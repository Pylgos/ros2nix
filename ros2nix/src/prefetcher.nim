import std/[os, json, uri, tables, strutils, sugar, sequtils, osproc, locks, enumerate, options, strformat, base64]
import chronicles, taskpools
import types, procutils, semver


var fetchCacheLock: Lock
initLock(fetchCacheLock)
var fetchCache: Table[FetchSource, FetchResult]


proc writePrefetchCache*(path: string) =
  if path == "": return
  var j = newJArray()

  withLock fetchCacheLock:
    for (k, v) in fetchCache.pairs:
      var elem = newJObject()
      elem["source"] = %*k
      elem["result"] = %*v
      j.add elem

  writeFile(path, j.pretty)


proc loadPrefetchCache*(path: string) =
  if path == "": return
  let j = readFile(path).parseJson()

  withLock fetchCacheLock:
    for elem in j:
      let
        key = elem["source"].toFetchSource()
        val = elem["result"].toFetchResult()

      if dirExists(val.path) or fileExists(val.path):
        fetchCache[key] = val
    info "Cache loaded", n = fetchCache.len


proc rewriteUrl(url: Uri, rev: RevStr): Option[Uri] =
  if url.hostname != "github.com": return none(Uri)
  if rev == "main" or rev == "master": return none(Uri)

  let path = url.path.split("/")

  if path.len != 3: return none(Uri)

  let
    owner = path[1]
    repo = path[2].dup removeSuffix(".git")

  result = some Uri(
    scheme: "https",
    hostname: "github.com",
    path: fmt"/{owner}/{repo}/archive/refs/tags/{rev}.tar.gz"
  )


proc decodeBase32(s: string): string =
  var dst = newSeq[uint8]((s.len * 5) div 8)
  const base32Chars = "0123456789abcdfghijklmnpqrsvwxyz"

  for n in 0..<s.len:
    let c = s[s.len-n-1]

    let digit = base32Chars.find(c)
    if digit == -1:
      raise newException(ValueError, fmt"invalid base32 str {s}")

    let
      b = n.uint32 * 5
      i = b div 8
      j = b mod 8

    dst[i] = dst[i] or (digit.uint8 shl j)

    if i < 32 - 1:
      dst[i+1] = dst[i+1] or (digit.uint8 shr (8 - j));
    elif digit.uint8 shr (8 - j) != 0:
      raise newException(ValueError, fmt"invalid base32 str {s}")
  
  for b in dst:
    result.add chr(b)


proc toSriHash(base32Str: string): SriHashStr =
  "sha256-" & base64.encode(decodeBase32(base32Str))


proc prefetchUrl*(url: Uri, name="source"): FetchResult {.gcsafe.} =
  logScope:
    url = url

  let source = FetchSource(kind: fkUrl, url: url)
  withLock fetchCacheLock:
    {.cast(gcsafe).}:
      if source in fetchCache:
        info "Retrieved from cache"
        return fetchCache[source]

  info "Fetching"

  let cmd = [
    "nix-prefetch-url", "--print-path", "--unpack", $url,
  ].toSeq
  debug "Executing", cmd = cmd.join(" ")
  let r = execCmdAdvanced(cmd, {poUsePath})
  let lines = r.stdout.splitLines()

  let fr = FetchResult(
    name: name,
    source: source,
    hash: toSriHash(lines[0]),
    path: lines[1],
    kind: fkUrl)

  withLock fetchCacheLock:
    {.cast(gcsafe).}:
      fetchCache[source] = fr

  info "Completed", hash=fr.hash

  return fr


proc prefetchGit*(url: Uri, rev: RevStr, rewriteUrl=true, name="source"): FetchResult {.gcsafe.} =
  logScope:
    repoUrl = url
    rev = rev

  if rewriteUrl:
    let rewrittenUrl = rewriteUrl(url, rev)
    if rewrittenUrl.isSome:
      # debug "Url was rewritten", to=rewrittenUrl.get()
      return prefetchUrl(rewrittenUrl.get(), name)

  let source = FetchSource(kind: fkGit, repoUrl: url, rev: rev)

  withLock fetchCacheLock:
    {.cast(gcsafe).}:
      if source in fetchCache:
        info "Retrieved from cache"
        return fetchCache[source]

  info "Fetching"

  # HACK
  let selector =
    if rev == "main" or rev == "master":
      "--branch-name"
    else:
      "--rev"

  let cmd = [
    "nix-prefetch-git", "--url", $url, "--quiet", "--fetch-submodules", selector, rev.string
  ]
  debug "Executing", cmd = cmd.join(" ")
  let r = execCmdAdvanced(cmd, {poUsePath})
  let j = r.stdout.parseJson()

  let fr = FetchResult(
    name: name,
    source: source,
    path: j["path"].getStr(),
    hash: j["sha256"].getStr().toSriHash,
    kind: fkGit,
    commitHash: j["rev"].getStr())

  withLock fetchCacheLock:
    {.cast(gcsafe).}:
      fetchCache[source] = fr

  info "Completed", hash=fr.hash

  return fr


proc prefetchDistro*(distroPkgs: var DistroPkgsTable, parallel=8) =
  let tp = Taskpool.new(numThreads=parallel)

  type FetchResultAux = tuple[result: FetchResult, distroName: DistroName, pkgName: PkgName]
  proc prefetchGitAux(url: Uri, tag, name: string, distroName: DistroName, pkgName: PkgName): ptr FetchResultAux {.gcsafe.} =
    result = createShared(FetchResultAux)
    info "Download started", name = name
    result.result = prefetchGit(url, tag, name=name)
    info "Download completed", name = name
    result.distroName = distroName
    result.pkgName = pkgName

  var futures = newSeq[Flowvar[ptr FetchResultAux]]()

  for (distroName, pkgs) in distroPkgs.pairs:
    for i, (pkgName, pkg) in enumerate(pkgs.pairs):
      let
        repoUrl = pkg.repoUrl
        tag = pkg.tag
        distroName = distroName
        pkgName = pkgName
        sourceName = fmt"{pkgName}-{pkg.version}-source"
        fut = tp.spawn prefetchGitAux(repoUrl, tag, sourceName, distroName, pkgName)
      futures.add fut
  
  tp.syncAll()

  for future in futures:
    let
      resPtr = future.sync()
      res = resPtr[]
    distroPkgs[res.distroName][res.pkgName].prefetch = res.result
    deallocShared(resPtr)
