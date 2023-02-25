import std/[os, selectors, options, tables, posix, strutils]


type
  ProcEventKind* = enum
    pekStdout
    pekStderr
    pekStdoutLine
    pekStderrLine
  
  ProcEvent* = object
    case kind*: ProcEventKind
    of pekStdout:
      stdout*: string
    of pekStderr:
      stderr*: string
    of pekStdoutLine:
      stdoutLine*: string
    of pekStderrLine:
      stderrLine*: string


const
  readIdx = 0
  writeIdx = 1


proc wrapError(ret: cint): cint {.discardable.} =
  if ret < 0:
    raiseOSError osLastError()
  ret


proc execCmdUltra*(
    command: openArray[string],
    input = "",
    env = none(Table[string, string]),
    usePath = true,
    eventCallback: proc(event: ProcEvent) = nil
  ): tuple[stdout, stderr: string, exitCode: int] {.effectsOf: eventCallback.} =

  if command.len == 0: raise newException(ValueError, "command length is zero")

  var stdinPipe, stdoutPipe, stderrPipe: array[2, cint]
  
  wrapError pipe(stdinPipe)
  wrapError pipe(stdoutPipe)
  wrapError pipe(stderrPipe)

  var
    executable = command[0]
    argArray, envArray: seq[string]
  
  if command.len > 1:
    argArray = command[0..^1]

  if env.isSome:
    for (key, value) in env.get.pairs:
      envArray.add key & "=" & value


  let pid = wrapError fork()
  if pid == 0:
    wrapError close(stdinPipe[writeIdx])
    wrapError close(stdoutPipe[readIdx])
    wrapError close(stderrPipe[readIdx])

    wrapError dup2(stdinPipe[readIdx], 0)
    wrapError dup2(stdoutPipe[writeIdx], 1)
    wrapError dup2(stderrPipe[writeIdx], 2)

    var
      argCStringArray = argArray.allocCStringArray
      envCStringArray: cstringArray
    
    if env.isSome:
      envCStringArray = envArray.allocCStringArray

    if usePath and env.isSome:
      discard execvpe(executable.cstring, argCStringArray, envCStringArray)
    elif usePath and env.isNone:
      discard execvp(executable.cstring, argCStringArray)
    elif not usePath and env.isSome:
      discard execve(executable.cstring, argCStringArray, envCStringArray)
    elif not usePath and env.isNone:
      discard execv(executable.cstring, argCStringArray)
    else:
      doAssert false
    quit(osLastError().int)
  
  else:
    wrapError close(stdinPipe[readIdx])
    wrapError close(stdoutPipe[writeIdx])
    wrapError close(stderrPipe[writeIdx])
    defer:
      discard close(stdinPipe[writeIdx])
      discard close(stdoutPipe[readIdx])
      discard close(stderrPipe[readIdx])

    let selector = newSelector[int]()
    defer: selector.close()

    selector.registerHandle(stdinPipe[writeIdx].int, {Event.Write}, 0)
    selector.registerHandle(stdoutPipe[readIdx].int, {Event.Read}, 0)
    selector.registerHandle(stderrPipe[readIdx].int, {Event.Read}, 0)

    var
      bytesWritten = 0
      stdoutClosed = false
      stderrClosed = false
      lastStdoutLineChange = 0
      lastStderrLineChange = 0

    while not stdoutClosed or not stderrClosed:
      let readyKeys = selector.select(-1)

      for readyKey in readyKeys:

        if readyKey.fd == stdinPipe[writeIdx]:
          if input.len > bytesWritten:
            let ret = write(stdinPipe[writeIdx], cast[pointer](unsafeAddr input[bytesWritten]), input.len - bytesWritten)
            if ret < 0: raiseOSError(OSErrorCode(-ret))
          else:
            selector.unregister(stdinPipe[writeIdx].int)
        
        elif readyKey.fd == stdoutPipe[readIdx]:
          var buf = newString(128)
          let ret = read(stdoutPipe[readIdx], cast[pointer](addr buf[0]), buf.len)
          
          if ret != 0:
            buf.setLen(ret)
            if eventCallback != nil: eventCallback(ProcEvent(kind: pekStdout, stdout: buf))
            result.stdout.add buf
            while (let lineChange = result.stdout.find('\n', lastStdoutLineChange); lineChange != -1):
              if eventCallback != nil: eventCallback(ProcEvent(kind: pekStdoutLine, stdoutLine: result.stdout[lastStdoutLineChange..lineChange-1]))
              lastStdoutLineChange = lineChange + 1
          else:
            stdoutClosed = true
        
        elif readyKey.fd == stderrPipe[readIdx]:
          var buf = newString(128)
          let ret = read(stderrPipe[readIdx], cast[pointer](addr buf[0]), buf.len)
          
          if ret != 0:
            buf.setLen(ret)
            result.stderr.add buf
            while (let lineChange = result.stderr.find('\n', lastStderrLineChange); lineChange != -1):
              if eventCallback != nil: eventCallback(ProcEvent(kind: pekStderrLine, stderrLine: result.stderr[lastStderrLineChange..lineChange-1]))
              lastStderrLineChange = lineChange + 1
          else:
            stderrClosed = true
        
        else: doAssert false
    
    var status = 0.cint
    result.exitCode = waitpid(pid, status, 0)
    if not WIFEXITED(status):
      result.exitCode = 1
    else:
      result.exitCode = WEXITSTATUS(status)

