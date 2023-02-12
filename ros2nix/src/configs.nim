import std/[os, tables, sequtils, algorithm]

import parsetoml
import chronicles

import types

type
  Config* = object
    distributions*: Table[DistroName, DistroConfig]
  
  DistroConfig* = object
    env*: Table[string, string]

proc parseConfigAux(c: var Config, toml: TomlValueRef) =
  try:
    for (distroName, distro) in toml["distributions"].getTable().pairs:
      for (env, val) in distro["env"].getTable().pairs:
        if distroName.DistroName notin c.distributions:
          c.distributions[distroName.DistroName] = DistroConfig()
        c.distributions[distroName.DistroName].env[env] = val.getStr()
  except KeyError:
    discard

proc parseConfig*(path: string): Config =
  for f in path.walkDirRec({pcFile, pcLinkToFile}).toSeq.filterIt(it.splitFile.ext == ".toml").sorted():
    info "Parsing config file", file=f
    parseConfigAux(result, parsetoml.parseFile(f))
