import std/[os, strformat, httpclient, tables, uri, sequtils, sets, xmlparser, xmltree, strutils, sugar, asyncdispatch]
import yaml
import chronicles
import zippy

import semver, conditioneval, configs, types, prefetcher, autopatcher, pkgjson


proc fetchContent(url: string | Uri): string =
  let cli = newHttpClient()
  info "Fetching content from url", url
  result = cli.getContent(url)


proc fetchGithubFileContent(owner, repo, rev, path: string): string =
  let cli = newHttpClient()
  info "Fetching content from github", owner, repo, rev, path
  result = cli.getContent(fmt"https://raw.githubusercontent.com/{owner}/{repo}/{rev}/{path}")


proc parseYaml(content: string): YamlNode = 
  var yamlDoc: YamlDocument
  load(content, yamlDoc.root)
  result = yamlDoc.root


proc contains(n: YamlNode, key: string): bool =
  try:
    discard n[key]
    true
  except KeyError:
    false


proc fetchDistro(url: string): DistroInfo =
  result.yaml = url.fetchContent().uncompress().parseYaml()

  for nameNode, infoNode in result.yaml["distribution_file"][0]["repositories"].pairs:
    var repo: RepoInfo
    repo.name = nameNode.content

    dynamicLogScope(repoName = repo.name):
      try:
        if "release" in infoNode:
          var rel: ReleaseInfo
          let relNode = infoNode["release"]

          if "packages" in relNode:
            rel.pkgs = relNode["packages"].mapIt(it.content.PkgName)
          else:
            rel.pkgs.add repo.name.PkgName
          
          rel.tagFormat = relNode["tags"]["release"].content
          rel.url = relNode["url"].content.parseUri()
          rel.version = relNode["version"].content.ReleaseVersion

          repo.release = some rel

        result.repos.add repo
      
      except KeyError as e:
        warn "Parse error", error = e.msg


proc fetchDistributions(cfg: Config): Table[DistroName, DistroInfo] =
  let distroIndexNode = fetchGithubFileContent("ros", "rosdistro", "master", "index-v4.yaml").parseYaml()

  for (distro, distroInfo) in distroIndexNode["distributions"].pairs:
    let distroName = distro.content.DistroName
    dynamicLogScope(distroName):
      if distroName in cfg.distributions:
        info "Parsing"
        result[distroName] = distroInfo["distribution_cache"].content.fetchDistro()
      else:
        debug "Skipped"


proc parsePkg(pkgXmlContent: string, env: Table[string, string]): PkgInfo =
  let root = parseXml(pkgXmlContent)

  var
    foundName = false
    foundVersion = false
  
  for child in root:
    if child.kind != xnElement: continue

    let cond = child.attr("condition")
    if cond != "" and evalConditionExpr(cond, env) != "True":
      continue
    
    let t = child.innerText
    case child.tag
    of "name":
      result.name = t.PkgName
      foundName = true
    of "version":
      result.version = parseVersion(t)
      foundVersion = true
    of "build_depend":
      result.deps.buildDeps.incl t.PkgName
    of "build_export_depend":
      result.deps.buildExportDeps.incl t.PkgName
    of "buildtool_depend":
      result.deps.buildToolDeps.incl t.PkgName
    of "buildtool_export_depend":
      result.deps.buildToolExportDeps.incl t.PkgName
    of "exec_depend":
      result.deps.execDeps.incl t.PkgName
    of "depend":
      result.deps.buildDeps.incl t.PkgName
      result.deps.buildExportDeps.incl t.PkgName
      result.deps.execDeps.incl t.PkgName
    of "doc_depend":
      result.deps.docDeps.incl t.PkgName
    of "test_depend":
      result.deps.testDeps.incl t.PkgName

  if not foundName:
    raise (ref ValueError)(msg: "name tag not found")
  if not foundVersion:
    raise (ref ValueError)(msg: "version tag not found")


proc listPackage(distro: DistroInfo, cfg: DistroConfig): PkgTable =
  for repo in distro.repos:
    if repo.release.isSome:
      let rel = repo.release.get()
      for pkgName in rel.pkgs:
        debug "Parsing package.xml", pkgName
        let pkgXmlContent = distro.yaml["release_package_xmls"][pkgName].content
        result[pkgName] = parsePkg(pkgXmlContent, cfg.env)
        result[pkgName].repoUrl = rel.url
        result[pkgName].relVersion = rel.version
        result[pkgName].tag = rel.tagFormat.replace("{package}", pkgName).replace("{version}", $result[pkgName].relVersion)


proc main =
  const prefetchCachePath = "prefetch_cache.json"
  let config = parseConfig("config")
  let distros = fetchDistributions(config)

  var distroPkgs = DistroPkgsTable()

  for (distroName, distro) in distros.pairs:
    var pkgs: PkgTable
    dynamicLogScope(distro=distroName):
      pkgs = listPackage(distro, config.distributions[distroName])
      distroPkgs[distroName] = pkgs
  
  try:
    loadPrefetchCache(prefetchCachePath)
  except IOError:
    discard

  prefetch(distroPkgs)
  
  writePrefetchCache(prefetchCachePath)

  for (distro, pkgs) in distroPkgs.mpairs:
    for (name, pkg) in pkgs.mpairs:
      autoPatch(pkg)
  
  writePrefetchCache(prefetchCachePath)
  
  writePkgJson(distroPkgs, "packages.json")

when isMainModule:
  main()
