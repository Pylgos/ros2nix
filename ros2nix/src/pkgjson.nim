import std/[tables, sequtils, sets, strutils, uri, json]
import types, semver



proc dependenciesContent(deps: DepDesc): JsonNode =
  result = newJObject()

  template map(jsonName: string, dep: HashSet[PkgName]) =
    let arr = newJArray()
    for pkg in dep:
      arr.add newJString pkg
    result[jsonName] = arr

  map "buildDepend", deps.buildDeps
  map "buildExportDepend", deps.buildExportDeps
  map "buildToolDepend", deps.buildToolDeps
  map "buildToolExportDepend", deps.buildToolExportDeps
  map "execDepend", deps.execDeps
  map "docDepend", deps.docDeps
  map "testDepend", deps.testDeps


proc sourceContent(src: FetchResult): JsonNode = 
  result = newJObject()
  
  result["kind"] = newJString $src.kind
  result["hash"] = newJString src.hash

  case src.kind:
  of fkGit:
    result["url"] = newJString $src.source.repoUrl
    result["rev"] = newJString src.commitHash
  of fkUrl:
    result["url"] = newJString $src.source.url


proc substitutionContent(subs: seq[Substitution]): JsonNode =
  result = newJArray()

  for sub in subs:
    var j = newJObject()
    
    j["kind"] = newJString $sub.kind

    case sub.kind:
    of sskPatchVendor:
      j["filename"] = newJString sub.filename
      j["from"] = newJString sub.replaceFrom
      j["to"] = sourceContent sub.replaceToPath
    
    result.add j


proc pkgContent(pkg: PkgInfo): JsonNode =
  result = newJObject()
  result["version"] = newJString $pkg.version
  result["source"] = sourceContent(pkg.prefetch)
  result["dependencies"] = dependenciesContent(pkg.deps)
  result["substitutions"] = substitutionContent(pkg.substitutions)


proc distroContent(pkgs: PkgTable): JsonNode =
  result = newJObject()
  let pkgsNode = newJObject()
  result["packages"] = pkgsNode
  for (name, pkg) in pkgs.pairs:
    pkgsNode[name] = pkgContent(pkg)


proc lockFileContent(distroPkgs: DistroPkgsTable): JsonNode =
  result = newJObject()
  let distroNode = newJObject()
  result["distributions"] = distroNode
  for (distroName, pkgs) in distroPkgs.pairs:
    distroNode[distroName] = distroContent(pkgs)


proc writePkgJson*(distroPkgs: DistroPkgsTable, filename: string) =
  writeFile filename, lockFileContent(distroPkgs).pretty()

