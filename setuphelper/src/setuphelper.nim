import std/[os, sets, sequtils, strutils, hashes, tables, sugar, options, algorithm, strformat]


type
  PkgName = string
  PrefixPath = string

  Package = object
    name: PkgName
    deps: HashSet[string]
    prefix: PrefixPath
  
  UnorderedPkgTable = Table[PkgName, Package]

  PkgTable = OrderedTable[PkgName, Package]

  DsvOpKind = enum
    dsvPrependNonDup
    dsvPrependNonDupIfExists
    dsvSet
    dsvSetIfUnset
    dsvSource
  
  DsvOp = object
    case kind*: DsvOpKind
    of dsvPrependNonDup..dsvSetIfUnset:
      name, value: string
    of dsvSource:
      path: string
  
  DsvParseError = object of ValueError

  OpKind = enum
    opPrependNonDup
    opSet
    opSetIfUnset
    opSource
  
  Op = object
    case kind: OpKind
    of opPrependNonDup..opSetIfUnset:
      name, value: string
    of opSource:
      path: string
  
  Env = Table[string, string]

  ShellKind = enum
    shkDsv = ".dsv"
    shkSh = ".sh"
    shkBash = ".bash"
    shkOther


proc collectPackagesFrom(pkgs: var UnorderedPkgTable, prefix: PrefixPath, alreadyVisitedPrefixes: var HashSet[PrefixPath]) =
  let
    propagationFiles = [
      prefix/"nix-support/propagated-native-build-inputs",
      prefix/"nix-support/propagated-build-inputs",
    ]

  if prefix in alreadyVisitedPrefixes:
    return

  alreadyVisitedPrefixes.incl prefix

  for pkgFile in walkDir(prefix/"share/colcon-core/packages"):
    if pkgFile.kind notin {pcFile, pcLinkToFile}: continue
    
    let
      pkgName = pkgFile.path.splitPath().tail.PkgName
      deps = readFile(pkgFile.path).split(":").toHashSet
    
    # Skip already collected package
    if pkgName in pkgs: continue
    
    var pkg = Package(name: pkgName, deps: deps, prefix: prefix)
    pkgs[pkgName] = pkg

  for path in propagationFiles:
    if path.fileExists():
      for childPrefix in path.readFile().split(" ").toHashSet():
        pkgs.collectPackagesFrom(childPrefix, alreadyVisitedPrefixes)


proc collectPackagesFrom(pkgs: var UnorderedPkgTable, prefix: PrefixPath) =
  var cache = initHashSet[PrefixPath]()
  collectPackagesFrom(pkgs, prefix, cache)


proc removeNonRosDeps(pkgs: var UnorderedPkgTable) =
  let keys = pkgs.keys.toSeq.toHashSet
  for (pkgName, pkg) in pkgs.mpairs:
    pkg.deps = pkg.deps.intersection keys


proc reduceCycleSet(pkgs: var UnorderedPkgTable) =
  var lastDepended = none(HashSet[PkgName])
  
  while pkgs.len >= 0:
    var depended = HashSet[PkgName]()

    for pkgName, pkg in pkgs.pairs:
      depended = depended.union(pkg.deps)

    for name in pkgs.keys():
      if name notin depended:
        pkgs.del name
    
    if lastDepended.isSome:
      if lastDepended.get() == depended:
        return
    # otherwise reduce again
    lastDepended = some depended


proc orderPackages(pkgs: UnorderedPkgTable): PkgTable =
  var
    mPkgs = pkgs
    toBeOrdered = mPkgs.keys.toSeq
  
  toBeOrdered.sort()
  
  while toBeOrdered.len != 0:
    var pkgNamesWithoutDeps = collect:
      for name in toBeOrdered:
        if mPkgs[name].deps.len == 0:
          name
    
    if pkgNamesWithoutDeps.len == 0:
      mPkgs.reduceCycleSet()
      stderr.writeLine "Circular dependency detected"
    
    pkgNamesWithoutDeps.sort()
    let pkgName = pkgNamesWithoutDeps[0]
    if (let idx = toBeOrdered.find(pkgName); idx != -1):
      toBeOrdered.delete(idx)
    result[pkgName] = mPkgs[pkgName]

    for pkg in mPkgs.mvalues:
      pkg.deps.excl pkgName


template parseError(): untyped =
  raise newException(DsvParseError, "Failed to parse dsv file")

template parseErrorIf(cond: bool) =
  if cond: parseError()


proc parseDsvOp(line: string): DsvOp =
  let s = line.split(";")
  parseErrorIf(s.len == 0)
  case s[0]
  of "prepend-non-duplicate":
    parseErrorIf(s.len != 3)
    result = DsvOp(kind: dsvPrependNonDup, name: s[1], value: s[2])
  
  of "prepend-non-duplicate-if-exists":
    parseErrorIf(s.len != 3)
    result = DsvOp(kind: dsvPrependNonDupIfExists, name: s[1], value: s[2])
  
  of "set":
    parseErrorIf(s.len != 3)
    result = DsvOp(kind: dsvSet, name: s[1], value: s[2])
  
  of "set-if-unset":
    parseErrorIf(s.len != 3)
    result = DsvOp(kind: dsvSetIfUnset, name: s[1], value: s[2])
  
  of "source":
    parseErrorIf(s.len != 2)
    result = DsvOp(kind: dsvSource, path: s[1])


proc parseDsv(filename: string): seq[DsvOp] =
  for line in filename.lines:
    if line.len == 0: continue
    result.add parseDsvOp(line)


proc resolvePath(path: string, prefix: PrefixPath): string =
  if path.isAbsolute:
    path
  else:
    prefix/path


proc prependNonDup(env: var Env, name, value: string, prefix: PrefixPath) =
  let path = value.resolvePath(prefix)

  if name in env:
    if value notin env[name].split(PathSep).toHashSet:
      env[name] = path & PathSep & env[name]
  else:
    env[name] = path


proc setEnv(env: var Env, name, value: string, prefix: PrefixPath) =
  let v =
    if value.isAbsolute:
      value
    else:
      let path = prefix/value
      if fileExists(path) or dirExists(path):
        path
      else:
        value
  env[name] = v


proc shellKind(filename: string): ShellKind =
  let ext = filename.splitFile.ext
  case ext
  of ".dsv": shkDsv
  of ".sh": shkSh
  of ".bash": shkBash
  else: shkOther


type
  Context = object
    realEnv: Env
    env: Env
    ops: seq[Op]
    hasNonDsvFileSourced: bool
    prevPrefix: PrefixPath


proc envDiff(ctx: Context): Env =
  for (name, value) in ctx.env.pairs:
    if name in ctx.realEnv:
      if ctx.realEnv[name] != value:
        result[name] = value
    else:
      result[name] = ctx.env[name]



proc computeOps(ctx: var Context, filename: string, prefix: PrefixPath) =
  let dsv = parseDsv(filename)

  if ctx.hasNonDsvFileSourced and ctx.prevPrefix != prefix:
    ctx.ops.add Op(kind: opSet, name: "COLCON_CURRENT_PREFIX", value: prefix)
    ctx.prevPrefix = prefix

  var i = 0

  while i < dsv.len:
    let dsvOp = dsv[i]
    case dsvOp.kind
    of dsvPrependNonDup:
      if ctx.hasNonDsvFileSourced:
        ctx.ops.add Op(kind: opPrependNonDup, name: dsvOp.name, value: dsvOp.value.resolvePath(prefix))
      else:
        ctx.env.prependNonDup(dsvOp.name, dsvOp.value, prefix)
      inc i
    
    of dsvPrependNonDupIfExists:
      let path = dsvOp.value.resolvePath(prefix)
      if path.fileExists or path.dirExists:
        if ctx.hasNonDsvFileSourced:
          ctx.ops.add Op(kind: opPrependNonDup, name: dsvOp.name, value: dsvOp.value.resolvePath(prefix))
        else:
          ctx.env.prependNonDup(dsvOp.name, dsvOp.value, prefix)
      inc i
    
    of dsvSet:
      if ctx.hasNonDsvFileSourced:
        ctx.ops.add Op(kind: opSet, name: dsvOp.name, value: dsvOp.value.resolvePath(prefix))
      else:
        ctx.env.setEnv(dsvOp.name, dsvOp.value, prefix)
      inc i
    
    of dsvSetIfUnset:
      if ctx.hasNonDsvFileSourced:
        ctx.ops.add Op(kind: opSetIfUnset, name: dsvOp.name, value: dsvOp.value.resolvePath(prefix))
      elif dsvOp.name notin ctx.env or ctx.env[dsvOp.name] == "":
        ctx.env.setEnv(dsvOp.name, dsvOp.value, prefix)
      inc i

    of dsvSource:
      let
        path = resolvePath(dsvOp.path, prefix)
        basePath = path.splitPath.head / path.splitFile.name
      
      var kinds = {dsvOp.path.shellKind}
      
      inc i

      while i < dsv.len:
        if dsv[i].kind != dsvSource: break
        let p = resolvePath(dsv[i].path, prefix)
        if p.splitPath.head / p.splitFile.name != basePath: break
        
        let kind = dsv[i].path.shellKind
        if kind != shkOther and kind in kinds:
          stderr.writeLine "Duplicated source"
        kinds.incl kind
        inc i
      
      for p in walkFiles(basePath & ".*"):
        let kind = p.shellKind
        kinds.incl kind
      
      if shkDsv in kinds:
        ctx.computeOps(basePath & ".dsv", prefix)
      
      elif shkBash in kinds:
        for (name, value) in ctx.envDiff.pairs:
          ctx.ops.add Op(kind: opSet, name: name, value: value)
        ctx.ops.add Op(kind: opSource, path: basePath & ".bash")
        ctx.hasNonDsvFileSourced = true
      
      elif shkSh in kinds:
        for (name, value) in ctx.envDiff.pairs:
          ctx.ops.add Op(kind: opSet, name: name, value: value)
        ctx.ops.add Op(kind: opSource, path: basePath & ".sh")
        ctx.hasNonDsvFileSourced = true

      else:
        stderr.writeLine "Unsupported shell"


proc computeCommands(pkgs: PkgTable): seq[string] =
  let env = envPairs().toSeq.toTable
  var ctx = Context(realEnv: env, env: env)
  for (name, pkg) in pkgs.pairs:
    let pkgDsvPath = pkg.prefix/"share"/name/"package.dsv"
    ctx.computeOps(pkgDsvPath, pkg.prefix)

  if not ctx.hasNonDsvFileSourced:
    for (name, value) in ctx.envDiff.pairs:
      ctx.ops.add Op(kind: opSet, name: name, value: value)

  for op in ctx.ops:
    case op.kind:
    of opSet:
      result.add fmt"export {op.name}={op.value.quoteShell}"
    of opSetIfUnset:
      result.add fmt"[[ -z {op.name} ]] && export {op.name}={op.value.quoteShell}"
    of opPrependNonDup:
      result.add fmt"_colcon_prefix_sh_prepend_unique_value {op.name} {op.value.quoteShell}"
    of opSource:
      result.add fmt"source {op.path.quoteShell}"
  
  result.add fmt"unset COLCON_CURRENT_PREFIX"


when isMainModule:
  var prefixes: HashSet[PrefixPath]

  for p in commandLineParams():
    if p != "":
      prefixes.incl p.split(" ").toHashSet

  var unorderedPkgs = UnorderedPkgTable()

  for prefix in prefixes:
    unorderedPkgs.collectPackagesFrom(prefix)
  
  unorderedPkgs.removeNonRosDeps()


  var pkgs = unorderedPkgs.orderPackages()
  
  echo pkgs.computeCommands().join("\n")
