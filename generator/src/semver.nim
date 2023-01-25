import std/[strutils, strformat]


type
  Version* = object
    major*, minor*, patch*: Natural
  
  VersionError = object of ValueError

proc assertNonNegative(i: int): int =
  if i >= 0:
    i
  else:
    raise (ref VersionError)(msg: "negative version is not allowed")

proc parseVersion*(s: string): Version =
  let parts = s.split(".")

  if parts.len < 1 or 3 < parts.len:
    raise (ref VersionError)(msg: fmt"invalid version string '{s}'")

  result.major = parts[0].parseInt().assertNonNegative()
  if parts.len >= 2:
    result.minor = parts[1].parseInt().assertNonNegative()
  if parts.len >= 3:
    result.patch = parts[2].parseInt().assertNonNegative()


func cmp*(a, b: Version): int =
  let
    cmpMajor = cmp(a.major, b.major)
    cmpMinor = cmp(a.minor, b.minor)
    cmpPatch = cmp(a.patch, b.patch)
  
  if cmpMajor != 0:
    return cmpMajor
  elif cmpMinor != 0:
    return cmpMinor
  else:
    return cmpPatch


func `<`*(a, b: Version): bool =
  cmp(a, b) == -1


func `<=`*(a, b: Version): bool =
  cmp(a, b) <= 0


func `$`*(v: Version): string =
  fmt"{v.major}.{v.minor}.{v.patch}"