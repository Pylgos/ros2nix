import std/[os, osproc, selectors, strtabs]

proc execCmdAdvanced*(
  command: openArray[string], 
  options: set[ProcessOption] = {poUsePath},
  env: StringTableRef = nil,
  workingDir = "",
  input = ""): tuple[stderr, stdout: string, exitCode: int]
  {.tags: [ExecIOEffect, ReadIOEffect, RootEffect], gcsafe.} =

  if command.len == 0:
    raise newException(ValueError, "command length is 0")

  let args = if command.len == 1: @[] else: command[1..^1]
  var p = startProcess(command[0], args = args, options = options, workingDir = workingDir, env = env)
  defer: p.close()

  let selector = newSelector[int]()
  defer: selector.close()

  var stdinFile: File
  if not open(stdinFile, p.inputHandle, fmWrite): raiseOSError(osLastError())
  defer: stdinFile.close()

  var stdoutFile: File
  if not open(stdoutFile, p.outputHandle, fmRead): raiseOSError(osLastError())
  defer: stdoutFile.close()

  var stderrFile: File
  if not open(stderrFile, p.errorHandle, fmRead): raiseOSError(osLastError())
  defer: stderrFile.close()

  selector.registerHandle(stdinFile.getFileHandle.int, {Event.Write}, 0)
  selector.registerHandle(stdoutFile.getFileHandle.int, {Event.Read}, 1)
  selector.registerHandle(stderrFile.getFileHandle.int, {Event.Read}, 2)

  var
    bytesWritten = 0
    stdoutClosed = false
    stderrClosed = false

  while not stdoutClosed or not stderrClosed:
    let readyKeys = selector.select(-1)

    for readyKey in readyKeys:

      if readyKey.fd == stdinFile.getFileHandle:
        if input.len > bytesWritten:
          let ret = stdinFile.writeBuffer(cast[pointer](unsafeAddr input[bytesWritten]), input.len - bytesWritten)
          if ret < 0: raiseOSError(OSErrorCode(-ret))
        else:
          selector.unregister(stdinFile.getFileHandle.int)
      
      elif readyKey.fd == stdoutFile.getFileHandle:
        var buf = newString(128)
        let ret = stdoutFile.readBuffer(cast[pointer](addr buf[0]), buf.len)
        
        if ret != 0:
          buf.setLen(ret)
          result.stdout.add buf
        else:
          stdoutClosed = true
      
      elif readyKey.fd == stderrFile.getFileHandle:
        var buf = newString(128)
        let ret = stderrFile.readBuffer(cast[pointer](addr buf[0]), buf.len)
        
        if ret != 0:
          buf.setLen(ret)
          result.stderr.add buf
        else:
          stderrClosed = true
      
      else: doAssert false