import std/[tables, sets, uri, json, algorithm, sequtils]
import types, semver


proc processDependencies(deps: DepDesc): JsonNode =
  result = %*deps


proc processSource(src: FetchResult): JsonNode = 
  result = newJObject()
  
  result["kind"] = newJString $src.kind
  result["hash"] = newJString src.hash

  case src.kind:
  of fkGit:
    result["url"] = newJString $src.source.repoUrl
    result["rev"] = newJString src.commitHash
  of fkUrl:
    result["url"] = newJString $src.source.url


proc processSubstitution(subs: seq[Substitution]): JsonNode =
  result = newJArray()

  for sub in subs:
    var j = newJObject()
    
    j["kind"] = newJString $sub.kind

    case sub.kind:
    of sskPatchVendor:
      j["filename"] = newJString sub.filename
      j["from"] = newJString sub.replaceFrom
      j["to"] = processSource sub.replaceToPath
    
    result.add j


proc processPkg(pkg: PkgInfo): JsonNode =
  result = newJObject()
  result["version"] = newJString $pkg.version
  result["source"] = processSource(pkg.prefetch)
  result["dependencies"] = processDependencies(pkg.deps)
  result["substitutions"] = processSubstitution(pkg.substitutions)


proc processDistro(pkgs: PkgTable): JsonNode =
  result = newJObject()
  let pkgsNode = newJObject()
  result["packages"] = pkgsNode
  for (name, pkg) in pkgs.pairs.toSeq.sortedByIt(it[0]):
    pkgsNode[name] = processPkg(pkg)


proc lockFileContent(distroPkgs: DistroPkgsTable): JsonNode =
  result = newJObject()
  let distroNode = newJObject()
  result["distributions"] = distroNode
  for (distroName, pkgs) in distroPkgs.pairs.toSeq.sortedByIt(it[0]):
    distroNode[distroName] = processDistro(pkgs)


proc writePkgJson*(distroPkgs: DistroPkgsTable, filename: string) =
  writeFile filename, lockFileContent(distroPkgs).pretty()

