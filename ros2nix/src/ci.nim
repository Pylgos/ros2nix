import std/[tables, sets, json, times, strformat, options, sequtils, sugar, algorithm, strutils, atomics, httpclient, os]
import threading/channels
import types, procutils, ghactions


type
  RosPkgName = string

  NixPath = string

  DrvPath = string

  Drv = object
    attrName: string
    name: string
    drvPath: DrvPath
    isCached: bool
    inputDrvs: HashSet[DrvPath]
    rosInputDrvs: HashSet[DrvPath]
    dependantDrvs: HashSet[DrvPath]
    buildResult: Option[BuildResult]
    outputs: Table[string, NixPath]
  
  EvalError = object
    attrName: string
    error: string

  BuildResultKind = enum
    rkSuccess
    rkBuildError
    rkDependencyError
    rkSkipped
    rkCached
  
  BuildResult = object
    drvPath: DrvPath
    case kind: BuildResultKind
    of rkSuccess, rkBuildError:
      output: string
    else:
      discard

  DrvTable = Table[DrvPath, Drv]


func toMarkdown(k: BuildResultKind): string =
  case k
  of rkSuccess:
    "✅"
  of rkBuildError:
    "❌"
  of rkDependencyError:
    "➖"
  of rkSkipped:
    "💤"
  of rkCached:
    "🔵"


func isSuccess(k: BuildResult): bool =
  k.kind in {rkSuccess, rkCached}


proc writeSummary(drvs: DrvTable, importantDrvs: seq[Drv], evalErrors: seq[EvalError]) =
  var s = initJobSummary()
  s.line "## Summary"

  s.line "### Statistics"
  let
    totalPkgCount = drvs.len
    okPkgCount = drvs.values.toSeq.filterIt(it.buildResult.get.isSuccess).len
    okPkgPercent = (okPkgCount * 100) div totalPkgCount
    failedPkgCount = totalPkgCount - okPkgCount
    failedPkgPercent = (failedPkgCount * 100) div totalPkgCount
  s.tableHeader("Ok", "Failed", "Total")
  s.tableRow(fmt"{okPkgCount} ({okPkgPercent}%)", fmt"{failedPkgCount} ({failedPkgPercent}%)", $totalPkgCount)
  s.tableEnd()
  
  s.line "### Important packages"
  for drv in importantDrvs:
    let r = if drv.buildResult.get.isSuccess: ":heavy_check_mark:" else: ":x:"
    s.line fmt"- {drv.attrName}: {r}"
  
  s.line "### Details"
  s.line "legend"
  s.writeDedent fmt"""
    ```text
    Success: {rkSuccess.toMarkdown}
    EvaluationError: ❗
    BuildError: {rkBuildError.toMarkdown}
    DependencyError: {rkDependencyError.toMarkdown}
    Skipped: {rkSkipped.toMarkdown}
    Cached: {rkCached.toMarkdown}
    ```
  """

  s.line

  for err in evalErrors:
    s.line fmt"❗ {err.attrName}"

  for (drvPath, drv) in drvs.pairs:
    s.line fmt"{drv.buildResult.get.kind.toMarkdown} {drv.attrName}"
  
  s.save()


proc uploadDrv(drv: Drv) =
  for path in drv.outputs.values:
    let
      cmd = ["cachix", "push", "ros2nix", path]

    proc callback(ev: ProcEvent) =
      case ev.kind:
      of pekStdout:
        stdout.write ev.stdout
        stdout.flushFile()
      of pekStderr:
        stderr.write ev.stderr
        stdout.flushFile()
      else:
        discard

    let
      res = execCmdUltra(cmd, eventCallback=callback)


proc buildDrv(drv: Drv): BuildResult =
  proc callback(ev: ProcEvent) =
    case ev.kind
    of pekStdout:
      stdout.write ev.stdout
      stdout.flushFile
    of pekStderr:
      stdout.write ev.stderr
      stdout.flushFile
    else:
      discard

  let
    cmd = @["nix", "build", drv.drvPath, "-L", "--no-link", "--accept-flake-config", "--option", "log-lines", "0"]
    res = execCmdUltra(cmd, eventCallback=callback)
  
  if res.exitCode == 0:
    return BuildResult(drvPath: drv.drvPath, kind: rkSuccess, output: res.stdout)

  else:
    return BuildResult(drvPath: drv.drvPath, kind: rkBuildError, output: res.stdout)


proc getRecursiveDependants(result: var HashSet[DrvPath], drvs: DrvTable, drvPath: DrvPath) =
  if drvPath in result: return
  
  for dependant in drvs[drvPath].dependantDrvs:
    getRecursiveDependants(result, drvs, dependant)
    result.incl dependant


proc getRecursiveDependencies(result: var HashSet[DrvPath], drvs: DrvTable, drvPath: DrvPath) =
  if drvPath in result: return
  
  for dependency in drvs[drvPath].rosInputDrvs:
    getRecursiveDependencies(result, drvs, dependency)
    result.incl dependency


func progressIndicator(current, total: Natural): string =
  let
    maxDigits = len($total)
    percents = current * 100 div total
  fmt"[{percents:3}%|{align($current, maxDigits)} of {total}]"


proc buildDrvs(drvs: var DrvTable) =
  var depTree = collect(initTable):
    for (drvPath, drv) in drvs.pairs:
      {drvPath: drv.rosInputDrvs}

  var buildCount = 1
  while true:
    if depTree.len == 0:
      break

    let drvsPathsWithoutDeps = collect(
      for (drvPath, deps) in depTree.pairs:
        if deps.len == 0:
          drvPath
    ).sorted()

    if drvsPathsWithoutDeps.len == 0:
      raise newException(ValueError, "Possible cyclic dependency")

    let
      drvPathToBuild = drvsPathsWithoutDeps[0]
      drvToBuild = drvs[drvPathToBuild]
      progressStr = progressIndicator(buildCount, drvs.len)
    
    var alreadyBuilt = false

    let res =
      if drvToBuild.isCached:
        echo fmt"{progressStr} Cached '{drvToBuild.name}'"
        BuildResult(drvPath: drvToBuild.drvPath, kind: rkCached)
      elif drvToBuild.buildResult.isSome:
        echo fmt"{progressStr} Already Built '{drvToBuild.name}'"
        alreadyBuilt = true
        drvToBuild.buildResult.get()
      else:
        beginGroup(fmt"{progressStr} Building '{drvToBuild.name}'")
        let res = buildDrv(drvToBuild)
        endGroup()
        res
    
    if res.isSuccess:
      drvs[drvPathToBuild].buildResult = some res
      depTree.del drvPathToBuild
      inc buildCount
      for drv in depTree.mvalues:
        drv.excl drvPathToBuild
      
      if not drvToBuild.isCached and not alreadyBuilt:
        beginGroup(fmt"Uploading '{drvToBuild.name}'")
        uploadDrv(drvToBuild)
        endGroup()


    else:
      drvs[drvPathToBuild].buildResult = some res
      depTree.del drvPathToBuild
      inc buildCount
      var recursiveDependants: HashSet[DrvPath]
      getRecursiveDependants(recursiveDependants, drvs, drvPathToBuild)
      for dependant in recursiveDependants:
        if dependant in depTree:
          depTree.del dependant
          inc buildCount
          echo fmt"{progressIndicator(buildCount, drvs.len)} Dependency Error '{drvs[dependant].name}'"
          drvs[drvPathToBuild].buildResult = some BuildResult(drvPath: dependant, kind: rkDependencyError)


proc buildDrvs(drvs: var DrvTable, target: DrvPath): bool =
  var recursiveDependencies: HashSet[DrvPath]
  getRecursiveDependencies(recursiveDependencies, drvs, target)
  recursiveDependencies.incl target
  
  var subDrvs: DrvTable
  for drvPath in recursiveDependencies:
    subDrvs[drvPath] = drvs[drvPath]
  
  buildDrvs(subDrvs)
  result = subDrvs[target].buildResult.get().isSuccess

  for (drvPath, drv) in subDrvs.pairs:
    drvs[drvPath] = drv


proc getDrv(p: DrvPath): Drv =
  let
    cmd = ["nix", "show-derivation", "--quiet", p]
    res = execCmdUltra(cmd)
  if res.exitCode != 0:
    raise newException(ValueError, fmt"Failed to get derivation data from '{p}'")
  
  let j = res.stdout.parseJson()
  result.name = j[p]["env"]["name"].getStr()
  result.drvPath = p
  result.inputDrvs = j[p]["inputDrvs"].keys.toSeq.toHashSet

  for (outName, path) in j[p]["outputs"].pairs:
    result.outputs[outName] = path["path"].getStr()


proc evaluate(distro: DistroName, system: string): tuple[drvs: DrvTable, evalErrors: seq[EvalError]] =
  let
    packagePath = fmt".#legacyPackages.{system}.{distro}"
    cmd = ["nix-eval-jobs", "--gc-roots-dir", "gcroot", "--check-cache-status", "--workers", "8", "--flake", packagePath]

  let resultPtr = addr result

  proc callback(ev: ProcEvent) =
    case ev.kind
    of pekStdoutLine:
      let j = ev.stdoutLine.parseJson()
      if "error" in j:
        echo "error    : ", j["attr"].getStr()
        echo j["error"].getStr()
        resultPtr.evalErrors.add EvalError(attrName: j["attr"].getStr(), error: j["error"].getStr())
      else:
        echo "evaluated: ", j["attr"].getStr()
        let drvPath = j["drvPath"].getStr()
        resultPtr.drvs[drvPath] = getDrv(drvPath)
        resultPtr.drvs[drvPath].attrName = j["attr"].getStr()
        resultPtr.drvs[drvPath].isCached = j["isCached"].getBool()
    else:
      discard

  beginGroup(fmt"Evaluating '{packagePath}'")
  let res = execCmdUltra(cmd, eventCallback=callback)
  endGroup()

  if res.exitCode != 0:
    raise newException(ValueError, "Failed to evaluate package set:\n" & res.stderr)
  
  let rosDrvs = result.drvs.keys.toSeq.toHashSet
  for drv in result.drvs.mvalues:
    drv.rosInputDrvs = drv.inputDrvs * rosDrvs

  for (drvPath, drv) in result.drvs.pairs:
    for inputDrvPath in drv.rosInputDrvs:
      result.drvs[inputDrvPath].dependantDrvs.incl drvPath


proc getCurrentSystem(): string =
  let
    cmd = ["nix", "eval", "--impure", "--json", "--expr", "builtins.currentSystem"]
    res = execCmdUltra(cmd)
  res.stdout.parseJson().getStr()


proc ci*(
    distro: DistroName,
    important: seq[RosPkgName] = @[],
    buildAll = false,
    maxJobs: Natural = 1,
    packageJsonFile = "packages.json",
    maxUploadJobs: Natural = 2,
    cores: Natural = 1,
    verbose = false,
    skip: seq[RosPkgName] = @[]
  ): int =

  var
    (drvs, evalErrors) = evaluate("humble", getCurrentSystem())
  
  let importantDrvs = drvs.values.toSeq.filterIt(it.attrName in important)

  for targetDrv in importantDrvs:
    let success = buildDrvs(drvs, targetDrv.drvPath)
    if success:
      echo fmt"Build completed '{targetDrv.name}'"
    else:
      error fmt"Failed to build an important package '{targetDrv.name}'"
      return 1

  if buildAll:
    buildDrvs(drvs)
  
  writeSummary(drvs, importantDrvs, evalErrors)

  return 0
