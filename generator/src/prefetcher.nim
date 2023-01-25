import std/[os, json, uri, tables, strtabs, strutils, sugar, hashes, sequtils, osproc, locks, enumerate, options, sugar, strformat]
import chronicles, taskpools
import types


var fetchCacheLock: Lock
initLock(fetchCacheLock)
var fetchCache: Table[FetchSource, FetchResult]


proc writePrefetchCache*(path: string) =
  var j = newJArray()

  withLock fetchCacheLock:
    for (k, v) in fetchCache.pairs:
      var elem = newJObject()
      elem["source"] = %*k
      elem["result"] = %*v
      j.add elem

  writeFile(path, j.pretty)


proc loadPrefetchCache*(path: string) =
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


proc prefetchUrl*(url: Uri): FetchResult {.gcsafe.} =
  logScope:
    url = url

  let source = FetchSource(kind: fkUrl, url: url)
  withLock fetchCacheLock:
    {.cast(gcsafe).}:
      if source in fetchCache:
        info "Retrieved from cache"
        result = fetchCache[source]
        return

  info "Fetching"

  let args = [
    "--print-path", $url,
  ].toSeq
  debug "Executing", cmd = "nix-prefetch-url " & args.join(" ")
  let r = execProcess("nix-prefetch-url", "", args, nil, {poUsePath})
  let lines = r.splitLines()

  let fr = FetchResult(
    source: source,
    hash: lines[0],
    path: lines[1],
    kind: fkUrl)

  withLock fetchCacheLock:
    {.cast(gcsafe).}:
      fetchCache[source] = fr

  info "Completed", hash=fr.hash

  return fr


proc prefetchGit*(url: Uri, rev: RevStr, rewriteUrl=true): FetchResult {.gcsafe.} =
  logScope:
    repoUrl = url
    rev = rev

  if rewriteUrl:
    let rewrittenUrl = rewriteUrl(url, rev)
    if rewrittenUrl.isSome:
      debug "Url was rewritten", to=rewrittenUrl.get()
      return prefetchUrl(rewrittenUrl.get())

  let source = FetchSource(kind: fkGit, repoUrl: url, rev: rev)

  {.cast(gcsafe).}:
    fetchCacheLock.acquire()
    if source in fetchCache:
      info "Retrieved from cache"
      result = fetchCache[source]
      fetchCacheLock.release()
      return
    fetchCacheLock.release()

  info "Fetching"

  # HACK
  let selector =
    if rev == "main" or rev == "master":
      "--branch-name"
    else:
      "--rev"

  let args = [
    "--url", $url, "--quiet", "--fetch-submodules", selector, rev.string
  ].toSeq
  debug "Executing", cmd = "nix-prefetch-git " & args.join(" ")
  let r = execProcess("nix-prefetch-git", "", args, nil, {poUsePath})
  let j = r.parseJson()

  let fr = FetchResult(
    source: source,
    path: j["path"].getStr(),
    hash: j["sha256"].getStr(),
    kind: fkGit,
    commitHash: j["rev"].getStr())

  fetchCacheLock.acquire()
  {.cast(gcsafe).}:
    fetchCache[source] = fr
  fetchCacheLock.release()

  info "Completed", hash=fr.hash

  return fr


proc prefetch*(distroPkgs: DistroPkgsTable, nParallel = 6): DistroPkgsTable =
  # var tp = TaskPool.new(nParallel)

  proc prefetchGitWrapper(url: Uri, rev: RevStr, distroName: DistroName, pkgName: PkgName):
        ptr tuple[fr: FetchResult, distroName: DistroName, pkgName: PkgName] =
    try:
      let fr = prefetchGit(url, rev)
      let p = createShared(typeof result[])
      p[].fr = fr
      p[].distroName = distroName
      p[].pkgName = pkgName
      return p
    except Exception as e:
      writeStackTrace()
      echo e[]

  let futs = collect:
    for (distroName, pkgs) in distroPkgs.pairs:
      for i, (pkgName, pkg) in enumerate(pkgs.pairs):
        info "Downloads left", n = (pkgs.len - i)
        prefetchGitWrapper(pkg.repoUrl, pkg.tag, distroName, pkgName)

  result = distroPkgs
  for fut in futs:
    # let p = fut.sync()
    let p = fut
    let r = p[]
    deallocShared(p)
    result[r.distroName][r.pkgName].prefetch = r.fr
