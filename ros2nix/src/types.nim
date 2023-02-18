import yaml, std/[options, uri, sets, tables, json]
import semver


type
  PkgName* = string
  ReleaseVersion* = string
  DistroName* = string
  SriHashStr* = string
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
    buildDepend*, buildExportDepend*, buildToolDepend*, buildToolExportDepend*, execDepend*, docDepend*, testDepend*: HashSet[PkgName]

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
    sskPatchVendor = "patchVendor"

  Substitution* = object
    filename*: string
    case kind*: SubstitutionKind
    of sskPatchVendor:
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
    name*: string
    source*: FetchSource
    hash*: SriHashStr
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
  result["name"] = newJString(s.name)
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
  result.name = j["name"].getStr()
  result.source = j["source"].toFetchSource()
  result.hash = j["hash"].getStr()
  result.path = j["path"].getStr()


proc `%`*(s: HashSet): JsonNode =
  result = newJArray()
  for elem in s.toSeq.sorted():
    result.add %*elem


proc to*(j: JsonNode, _: typedesc[HashSet[PkgName]]): HashSet[PkgName] =
  result = initHashSet[PkgName](j.len)
  for elem in j:
    result.incl elem.getStr()


proc to*(j: JsonNode, _: typedesc[DepDesc]): DepDesc =
  result.buildDepend = j["buildDepend"].to(HashSet[PkgName])
  result.buildExportDepend = j["buildExportDepend"].to(HashSet[PkgName])
  result.buildToolDepend = j["buildToolDepend"].to(HashSet[PkgName])
  result.buildToolExportDepend = j["buildToolExportDepend"].to(HashSet[PkgName])
  result.execDepend = j["execDepend"].to(HashSet[PkgName])
  result.docDepend = j["docDepend"].to(HashSet[PkgName])
  result.testDepend = j["testDepend"].to(HashSet[PkgName])

