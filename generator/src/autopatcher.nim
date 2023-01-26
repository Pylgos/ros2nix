import std/[os, strutils, sets, re, strformat, uri, tables, sequtils, tempfiles]
import types, prefetcher
import chronicles
import zippy/tarballs


proc splitExt(file: string): string =
  let tmp = file.split(".", 1)
  if tmp.len == 1:
    ""
  else:
    "." & tmp[1]


proc findPairCurry(content: string, pos: int): int =
  var depth = 0
  for i in pos..content.high:
    case content[i]
    of '(':
      inc depth
    of ')':
      dec depth
    else:
      discard
    if depth == 0:
      return i
  return -1


proc findFunctionCalls(content, function: string): seq[Slice[int]] =
  var start = 0
  while true:
    start = content.toLowerAscii.find((function & "(").toLowerAscii, start)
    if start == -1: return
    let leftCurryPos = start + function.len
    let rightCurryPos = findPairCurry(content, leftCurryPos)
    if rightCurryPos == -1: return
    result.add leftCurryPos+1 .. rightCurryPos-1
    inc start

# The worst way to parse variable
proc evalCmakeExpr(e: string, variables: Table[string, string]): string =
  var exp = e
  try:
    exp = unescape(exp)
  except ValueError:
    discard

  for (k, v) in variables.pairs:
    exp = exp.replace("$" & k, v).replace("${" & k & "}", v)

  return exp


proc findCmakeVariables(content: string): Table[string, string] =
  let calls = findFunctionCalls(content, "set")

  for call in calls:
    let s = content[call]
    let tmp = s.split(" ").filterIt(it.len != 0)
    if tmp.len != 2:
      # Give up!
      continue

    var
      name = evalCmakeExpr(tmp[0], result)
      val = evalCmakeExpr(tmp[1], result)

    try:
      val = unescape(val)
    except ValueError:
      discard

    result[name] = val


# TODO: implement other sources like svn
proc patchCmakeVendor(pkg: var PkgInfo, file, dir: string) =
  dynamicLogScope(file = file):
    let content = file.readFile
    let calls = content.findFunctionCalls("externalproject_add")

    if calls.len == 0:
      return

    let
      urlRegex = re"(URL\s+([^\s]+))"
      gitRepoRegex = re"(GIT_REPOSITORY\s+([^\s]+))"
      gitTagRegex = re"(GIT_TAG\s+([^\s]+))"
      invalidChar = {'$', '@'}

    let relPath = relativePath(file, dir)
    let variables = findCmakeVariables(content)

    for call in calls:
      var matches: array[3, string]
      if find(content[call], urlRegex, matches) != -1:
        let
          orig = matches[0].evalCmakeExpr(variables)
          url = matches[1].evalCmakeExpr(variables)

        if invalidChar in url:
          warn "Could not resolve variable for url"
          continue

        let
          fetchResult = url.parseUri.prefetchUrl()
          # patch = fmt"""
          #   substituteInPlace {relPath} --replace '{orig}' 'URL ${{fetchurl {{ url = "{url}"; sha256 = "{hash}"; }}}}'
          # """.dedent
        # pkg.patch.add patch
        pkg.substitutions.add Substitution(
          kind: sskPatchVendor,
          filename: relPath,
          replaceFrom: orig,
          replaceToPath: fetchResult)

      elif find(content[call], gitRepoRegex, matches) != -1:
        let
          orig = matches[0].evalCmakeExpr(variables)
          url = matches[1].evalCmakeExpr(variables)

        if invalidChar in url:
          warn "Could not resolve variable for git url"
          continue

        if find(content[call], gitTagRegex, matches) == -1:
          warn "GIT_REPOSITORY found but GIT_TAG not found"
          continue

        let tag = matches[1].evalCmakeExpr(variables)

        if invalidChar in tag:
          warn "Could not resolve variable for tag"
          continue

        let
          fetchResult = url.parseUri.prefetchGit(tag, rewriteUrl=false)
        #   patch = fmt"""
        #     substituteInPlace {relPath} --replace '{orig}' 'URL ${{fetchgit {{ url = "{url}"; rev = "{commitHash}"; sha256 = "{hash}"; }}}}'
        #   """.dedent
        # pkg.patch.add patch
        pkg.substitutions.add Substitution(
          kind: sskPatchVendor,
          filename: relPath,
          replaceFrom: orig,
          replaceToPath: fetchResult)

        # Some packages require git to apply patches
        # pkg.deps.nativeBuildInputs.incl PkgDesc(kind: pkSys, sysName: "git")

      else:
        warn "ExternalProject_Add found, but URL or GIT_REPOSITORY not found"



proc autoPatch*(pkg: var PkgInfo) =
  dynamicLogScope(pkgName=pkg.name):
    var tmpDir = ""
    var path = pkg.prefetch.path

    if path.endsWith ".tar.gz":
      tmpDir = genTempPath("ros2nix_tarball_extract_", "_" & pkg.name)
      debug "Extracting", `from`=pkg.prefetch.path, dest=tmpDir
      pkg.prefetch.path.extractAll(tmpDir)
      let
        contents = tmpDir.walkDir.toSeq.filterIt:
          it.path.splitFile.ext != ".data"
      doAssert contents.len == 1
      path = contents[0].path


    for file in path.walkDirRec({pcFile}):
      let
        tail = file.splitPath().tail
        ext = splitExt(tail)

      const cmakeExt = [".cmake", ".in", ".cmake.in"].toHashSet

      if tail == "CMakeLists.txt" or ext in cmakeExt:
        patchCmakeVendor(pkg, file, path)

    if tmpDir != "":
      removeDir tmpDir