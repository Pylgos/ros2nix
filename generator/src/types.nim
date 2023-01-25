import yaml, std/[options, uri, sets, tables, json]
import semver


type
  PkgName* = string
  ReleaseVersion* = string
  DistroName* = string
  Sha256Str* = string
  RevStr* = string


  DistroInfo* = object
    yaml*: YamlNode
    repos*: seq[RepoInfo]

  RepoInfo* = object
    name*: string
    release*: Option[ReleaseInfo]

  ReleaseInfo* = object
    pkgs*: seq[PkgName]
    url*: Uri
    tagFormat*: string
    version*: ReleaseVersion

  DepDesc* = object
    buildDeps*, buildExportDeps*, buildToolDeps*, buildToolExportDeps*, execDeps*, docDeps*, testDeps*: HashSet[PkgName]

  PkgKind* = enum
    pkSys
    pkRos

  PkgInfo* = object
    name*: PkgName
    repoUrl*: Uri
    tag*: string
    relVersion*: ReleaseVersion
    version*: Version
    deps*: DepDesc
    prefetch*: FetchResult
    substitutions*: seq[Substitution]
  
  SubstitutionKind* = enum
    sskReplaceToPath = "replaceToPath"

  Substitution* = object
    filename*: string
    case kind*: SubstitutionKind
    of sskReplaceToPath:
      replaceFrom*: string
      replaceToPath*: FetchResult

  PkgTable* = Table[PkgName, PkgInfo]
  DistroPkgsTable* = Table[DistroName, PkgTable]

  FetchKind* = enum
    fkGit = "git"
    fkUrl = "url"

  FetchSource* = object
    case kind*: FetchKind
    of fkGit:
      repoUrl*: Uri
      rev*: RevStr
    of fkUrl:
      url*: Uri

  FetchResult* = object
    source*: FetchSource
    hash*: Sha256Str
    path*: string
    case kind*: FetchKind
    of fkGit:
      commitHash*: RevStr
    of fkUrl:
      discard


func `==`*(a, b: FetchSource): bool =
  a.kind == b.kind and (
    case a.kind
    of fkGit: a.repoUrl == b.repoUrl and a.rev == b.rev
    of fkUrl: a.url == b.url
  )


func `==`*(a, b: FetchResult): bool =
  a.hash == b.hash and a.path == b.path and a.kind == b.kind and (
    case a.kind
    of fkGit:
      a.commitHash == b.commitHash
    of fkUrl:
      true
  )


proc `%*`*(s: FetchSource): JsonNode =
  result = newJObject()
  case s.kind
  of fkGit:
    result["kind"] = newJString("git")
    result["repoUrl"] = newJString($s.repoUrl)
    result["rev"] = newJString(s.rev)
  of fkUrl:
    result["kind"] = newJString("url")
    result["url"] = newJString($s.url)


proc `%*`*(s: FetchResult): JsonNode = 
  result = newJObject()
  result["source"] = %*s.source
  result["hash"] = newJString(s.hash)
  result["path"] = newJString(s.path)
  case s.kind
  of fkGit:
    result["kind"] = newJString("git")
    result["commitHash"] = newJString(s.commitHash)
  of fkUrl:
    result["kind"] = newJString("url")


proc toFetchSource*(j: JsonNode): FetchSource =
  case j["kind"].getStr()
  of "git":
    result = FetchSource(
      kind: fkGit,
      repoUrl: j["repoUrl"].getStr().parseUri(),
      rev: j["rev"].getStr()
    )
  of "url":
    result = FetchSource(
      kind: fkUrl,
      url: j["url"].getStr().parseUri()
    )
  else:
    raise (ref ValueError)(msg: "Couldn't parse FetchSource")


proc toFetchResult*(j: JsonNode): FetchResult =
  case j["kind"].getStr()
  of "git":
    result = FetchResult(
      kind: fkGit,
      commitHash: j["commitHash"].getStr()
    )
  of "url":
    result = FetchResult(
      kind: fkUrl
    )
  else:
    raise (ref ValueError)(msg: "Couldn't parse FetchResult")
  result.source = j["source"].toFetchSource()
  result.hash = j["hash"].getStr()
  result.path = j["path"].getStr()


when isMainModule:
  discard
