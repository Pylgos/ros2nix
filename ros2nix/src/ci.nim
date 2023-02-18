import std/[tables, sets, json, times, strformat, options, sequtils, sugar, algorithm, strutils, atomics]
import threading/channels
import types, procutils, ghactions


type
  RosPkgName = string

  Pkg = object
    name: RosPkgName
    deps: HashSet[RosPkgName]
  
  OrderedPkgTable = OrderedTable[RosPkgName, Pkg]

  BuildResultTable = OrderedTable[RosPkgName, BuildResult]

  BuildWorkerArgs = object
    name: RosPkgName
    current, total: Natural
  
  UploadWorkerArgs = object
    path: NixPath

  NixPath = string

  BuildResultKind = enum
    rkSuccess
    rkEvalError
    rkBuildError
    rkDependencyError
    rkSkipped

  BuildResult = object
    name: RosPkgName
    kind: BuildResultKind
    buildTime: Duration
    stdout, stderr: string
  
  ContextObj = object
    # Read only
    buildQueue: Chan[Option[BuildWorkerArgs]]
    buildResultQueue: Chan[BuildResult]
    uploadQueue: Chan[Option[UploadWorkerArgs]]
    buildThreads, uploadThreads: seq[Thread[Context]]
    distro: DistroName
    cores: Natural
    verbose, foldOutput: bool

    # Writable
    buildResults: BuildResultTable
    pkgs: OrderedPkgTable
    importantPkgs: HashSet[RosPkgName]

    showUploadProgress: Atomic[bool]
    livingUploaders: Atomic[int]
  
  Context = ptr ContextObj


func toMarkdown(k: BuildResultKind): string =
  case k
  of rkSuccess:
    "✅"
  of rkEvalError:
    "❗"
  of rkBuildError:
    "❌"
  of rkDependencyError:
    "➖"
  of rkSkipped:
    "💤"


proc echoVerbose(ctx: Context, s: varargs[string, `$`]) =
  if ctx.verbose:
    echo s.join("")


proc uploadWorker(ctx: Context) {.thread.} =
  while true:
    var optArgs: Option[UploadWorkerArgs]
    ctx.uploadQueue.recv(optArgs)

    if optArgs.isNone: break

    let
      args = optArgs.get()
      cmd = ["cachix", "push", "ros2nix", args.path]
    
    ctx.echoVerbose "Executing ", cmd.join(" ")

    proc callback(ev: ProcEvent) =
      if ctx.verbose or ctx.showUploadProgress.load():
        case ev.kind:
        of pekStdout:
          stdout.write ev.stdout
          stdout.flushFile()
        of pekStderr:
          stderr.write ev.stderr
          stdout.flushFile()

    let
      res = execCmdUltra(cmd, eventCallback=callback)
  
  ctx.livingUploaders.atomicDec()


proc buildWorker(ctx: Context) {.thread.} =
  while true:
    var optArgs: Option[BuildWorkerArgs]
    ctx.buildQueue.recv(optArgs)

    if optArgs.isNone: break

    let
      args = optArgs.get()
      cmd = @["nix", "build", fmt".#{ctx.distro}.{args.name}", "-j1", "-L", "--no-link", "--accept-flake-config", "--cores", $ctx.cores, "--no-warn-dirty"]
      dryRunCmd = cmd & @["--json", "--dry-run"]
    
    let
      maxDigits = len($args.total)
      percents = args.current * 100 div args.total
      prog = fmt"[{percents:3}%|{align($args.current, maxDigits)} of {args.total}]"
    
    if ctx.foldOutput: beginGroup(fmt"{prog} Building '{args.name}'")

    if ctx.verbose or ctx.foldOutput:
      ctx.echoVerbose "Executing: ", cmd.join(" ")

    proc callback(ev: ProcEvent) =
      if ctx.verbose or ctx.foldOutput:
        case ev.kind:
        of pekStdout:
          stdout.write ev.stdout
          stdout.flushFile()
        of pekStderr:
          stderr.write ev.stderr
          stdout.flushFile()

    let
      buildStart = getTime()
      res = execCmdUltra(cmd, eventCallback=callback)
      dryRunRes = execCmdUltra(dryRunCmd)
      buildEnd = getTime()
      buildTime = buildEnd - buildStart
    
    if res.exitCode != 0 and dryRunRes.exitCode != 0:
      let buildRes = BuildResult(kind: rkEvalError, name: args.name, buildTime: buildTime, stdout: res.stdout, stderr: res.stderr)
      ctx.buildResultQueue.send buildRes
      echo fmt"Error: failed to evaluate '{args.name}'"
    
    elif res.exitCode != 0 and dryRunRes.exitCode == 0:
      let buildRes = BuildResult(kind: rkBuildError, name: args.name, buildTime: buildTime, stdout: res.stdout, stderr: res.stderr)
      ctx.buildResultQueue.send buildRes
      echo fmt"Error: failed to build '{args.name}'"
    
    elif res.exitCode == 0 and dryRunRes.exitCode == 0:
      let buildRes = BuildResult(kind: rkSuccess, name: args.name, buildTime: buildTime, stdout: res.stdout, stderr: res.stderr)
      ctx.buildResultQueue.send buildRes
      echo fmt"Completed: '{args.name}'"
      
      var toUpload: seq[Option[UploadWorkerArgs]]
      let j = dryRunRes.stdout.parseJson()
      for k in j:
        for (_, l) in k["outputs"].pairs:
          toUpload.add some UploadWorkerArgs(path: l.getStr())

      for path in toUpload:
        ctx.uploadQueue.send(path)
    
    else:
      doAssert false, "wtf"
    
    endGroup()


proc createContext(distro: DistroName, cores, maxJobs, maxUploadJobs, queueSize: Natural, verbose, foldOutput: bool, pkgs: OrderedPkgTable, importantPkgs: HashSet[RosPkgName]): Context =
  result = createShared(ContextObj)
  result.buildQueue = newChan[Option[BuildWorkerArgs]](queueSize)
  result.buildResultQueue = newChan[BuildResult](queueSize)
  result.uploadQueue = newChan[Option[UploadWorkerArgs]](queueSize)
  result.distro = distro
  result.cores = cores
  result.verbose = verbose
  result.foldOutput = foldOutput
  result.pkgs = pkgs
  result.importantPkgs = importantPkgs
  result.showUploadProgress.store(false)
  result.livingUploaders.store(maxUploadJobs)

  result.buildThreads = newSeq[Thread[Context]](maxJobs)
  for thread in result.buildThreads.mitems:
    createThread(thread, buildWorker, result)
  
  result.uploadThreads = newSeq[Thread[Context]](maxJobs)
  for thread in result.uploadThreads.mitems:
    createThread(thread, uploadWorker, result)


proc destroyContext(ctx: Context) =
  `=destroy`(ctx.buildQueue)
  `=destroy`(ctx.buildResultQueue)
  `=destroy`(ctx.uploadQueue)
  `=destroy`(ctx.distro)
  `=destroy`(ctx.buildThreads)
  `=destroy`(ctx.uploadThreads)
  `=destroy`(ctx.buildResults)
  `=destroy`(ctx.pkgs)
  `=destroy`(ctx.importantPkgs)

  deallocShared(ctx)


proc shutdownBuilders(ctx: Context) =
  for i in 0..<ctx.buildThreads.len:
    ctx.buildQueue.send none(BuildWorkerArgs)
  joinThreads(ctx.buildThreads)


proc shutdownUploaders(ctx: Context) =
  for i in 0..<ctx.uploadThreads.len:
    ctx.uploadQueue.send none(UploadWorkerArgs)
  beginGroup("Waiting for remaining upload jobs to complete")
  ctx.showUploadProgress.store(true)
  joinThreads(ctx.uploadThreads)
  endGroup()


proc loadRosPkgs(packageJsonFile: string, distro: DistroName): OrderedPkgTable =
  let j = readFile(packageJsonFile).parseJson()
  for (name, pkgNode) in j["distributions"][distro]["packages"].pairs:
    var deps = HashSet[RosPkgName]()
    
    for fieldName, dep in pkgNode["dependencies"].to(DepDesc).fieldPairs:
      when fieldName != "testDepend":
        deps.incl dep
    
    result[name] = Pkg(name: name, deps: deps)
  
  for pkg in result.mvalues:
    var toExcl: HashSet[RosPkgName]
    for dep in pkg.deps:
      if dep notin result:
        toExcl.incl dep
    pkg.deps.excl toExcl


proc dependencyErrorPkgsAux(ret: var HashSet[RosPkgName], pkgs: OrderedPkgTable) =
  var
    okPkgNames = pkgs.keys.toSeq.toHashSet()
    prevLen = -1

  while okPkgNames.len != prevLen:
    prevLen = okPkgNames.len
    let okPkgNamesCopy = okPkgNames
    for name in okPkgNamesCopy:
      if (ret * pkgs[name].deps).len != 0:
        ret.incl name
        okPkgNames.excl name


proc dependencyErrorPkgs(pkgs: OrderedPkgTable, failedPkg: RosPkgName): HashSet[RosPkgName] =
  var p = initHashSet[RosPkgName]()
  p.incl failedPkg
  dependencyErrorPkgsAux(p, pkgs)
  p.excl failedPkg
  result = p


proc buildPkgs(ctx: Context, origPkgs: OrderedPkgTable) =
  var
    pkgs = origPkgs
    buildingPkgs = initHashSet[RosPkgName]()
  
  for pkgName in ctx.buildResults.keys:
    for pkg in pkgs.mvalues:
      pkg.deps.excl pkgName
    pkgs.del pkgName
  
  var numOfPkgsBuilt = 0

  while true:
    if pkgs.len == 0:
      break

    var buildReadyPkgs = collect(
      for (name, pkg) in pkgs.pairs:
        if pkg.deps.len == 0:
          name
    ).sorted()

    if buildReadyPkgs.len == 0:
      raise newException(ValueError, "possible circular dependency")
    
    for pkgName in buildReadyPkgs:
      if pkgName notin buildingPkgs:
        ctx.echoVerbose "queueing ", pkgName
        ctx.buildQueue.send some BuildWorkerArgs(name: pkgName, current: numOfPkgsBuilt + 1, total: origPkgs.len)
        inc numOfPkgsBuilt
        buildingPkgs.incl pkgName

    var buildResult: BuildResult
    ctx.buildResultQueue.recv(buildResult)
    
    ctx.buildResults[buildResult.name] = buildResult
    buildingPkgs.excl buildResult.name
    
    pkgs.del buildResult.name
    
    if buildResult.kind == rkSuccess:
      for pkg in pkgs.mvalues:
        pkg.deps.excl buildResult.name
    
    else:
      for errorPkgName in dependencyErrorPkgs(pkgs, buildResult.name):
        pkgs.del errorPkgName
        ctx.buildResults[errorPkgName] = BuildResult(
          name: errorPkgName,
          kind: rkDependencyError
        )
        inc numOfPkgsBuilt


proc recursiveDependencies(pkgs: OrderedPkgTable, pkgName: RosPkgName, result: var OrderedPkgTable) =
  if pkgName in result: return
  result[pkgName] = pkgs[pkgName]
  for dep in pkgs[pkgName].deps:
    pkgs.recursiveDependencies(dep, result)


proc recursiveDependencies(pkgs: OrderedPkgTable, pkgName: RosPkgName): OrderedPkgTable =
  recursiveDependencies(pkgs, pkgName, result)


proc skipPackages(ctx: Context, pkgNames: openArray[RosPkgName]) =
  for pkgName in pkgNames:
    ctx.buildResults[pkgName] = BuildResult(name: pkgName, kind: rkSkipped)
    for errorPkgName in ctx.pkgs.dependencyErrorPkgs(pkgName):
      ctx.buildResults[errorPkgName] = BuildResult(
        name: errorPkgName,
        kind: rkDependencyError
      )


proc isBlank(s: string): bool =
  s.replace("\n", "").replace("\r", "").replace(" ", "").len == 0


proc writeSummary(ctx: Context) =
  var s = initJobSummary()
  s.line "## Summary"
  
  s.line "### Important packages"
  for pkgName in ctx.importantPkgs:
    let r = if ctx.buildResults[pkgName].kind == rkSuccess: ":heavy_check_mark:" else: ":x:"
    s.line fmt"- {pkgName}: {r}"
  
  s.line "### Details"
  for (pkgName, result) in ctx.buildResults.pairs:
    s.beginFold(fmt"{result.kind.toMarkdown}: {pkgName}")
    
    if not result.stdout.isBlank:
      s.line "- stdout"
      s.tripleQuote("text", result.stdout)
      s.ensureNewLine()
    
    if not result.stderr.isBlank:
      s.line "- stderr"
      s.tripleQuote("text", result.stderr)
      s.ensureNewLine()
    
    if result.stdout.isBlank and result.stderr.isBlank:
      s.line "No outputs"

    s.endFold()
  
  s.save()


proc ci*(
    distro: DistroName,
    important: seq[RosPkgName] = @[],
    buildAll = false,
    maxJobs: Natural = 1,
    packageJsonFile = "packages.json",
    maxUploadJobs: Natural = 2,
    cores: Natural = 1,
    verbose = false,
    foldOutput = true,
    skip: seq[RosPkgName] = @[]
  ): int =

  let foldOutput =
    if foldOutput and (maxJobs != 1 or verbose == true):
      echo "Option 'foldOutput' is only available with option 'maxJobs=1' and 'verbose=false'"
      false
    else:
      foldOutput
  
  let pkgs = loadRosPkgs(packageJsonFile, distro)

  let ctx = createContext(distro, cores, maxJobs, maxUploadJobs, 1024, verbose, foldOutput, pkgs, important.toHashSet)
  defer: ctx.destroyContext()

  ctx.skipPackages(skip)

  for importantPkg in ctx.importantPkgs:
    let pkgsSub = pkgs.recursiveDependencies(importantPkg)
    ctx.buildPkgs(pkgsSub)
    if ctx.buildResults[importantPkg].kind != rkSuccess:
      error fmt"Failed to build an important package '{importantPkg}'"

  if buildAll:
    ctx.buildPkgs(pkgs)

  ctx.writeSummary()

  ctx.shutdownBuilders()
  ctx.showUploadProgress.store(true)
  ctx.shutdownUploaders()


when isMainModule:
  var t = {
    "a": Pkg(name: "a", deps: ["b"].toHashSet),
    "b": Pkg(name: "b", deps: ["c"].toHashSet),
    "c": Pkg(name: "c"),
    "d": Pkg(name: "d")
  }.toOrderedTable
  echo t.dependencyErrorPkgs("c")
