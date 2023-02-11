import std/[strutils, tables]


type Expression* = object
  src: string
  cursor: Natural
  variables: Table[string, string]

{.push, gcsafe.}

proc atEnd(self: var Expression): bool
proc peekChar(self: var Expression): char
proc eatChar(self: var Expression): char
proc eat(self: var Expression, c: char): bool
proc eat(self: var Expression, s: string): bool
proc eatSpaces(self: var Expression)
proc nextOp(self: var Expression, ops: openArray[string]): string
proc parseQuote(self: var Expression, q: char): string
proc parseIdent(self: var Expression): string
proc parseParen(self: var Expression): string
proc parseTerm(self: var Expression): string
proc parseExpr2(self: var Expression): string
proc parseExpr1(self: var Expression): string
proc evalConditionExpr*(s: string, variables: Table[string, string]): string


proc atEnd(self: var Expression): bool =
  self.cursor >= self.src.len

proc peekChar(self: var Expression): char =
  if self.atEnd():
    return '\0'
  result = self.src[self.cursor]

proc eatChar(self: var Expression): char =
  result = self.peekChar()
  if result != '\0':
    inc self.cursor

proc eat(self: var Expression, c: char): bool =
  if self.peekChar() == c:
    discard self.eatChar()
    return true
  else:
    return false

proc eat(self: var Expression, s: string): bool =
  if self.src[self.cursor..^1].startsWith(s):
    inc self.cursor, s.len
    result = true
  else:
    result = false

proc eatSpaces(self: var Expression) =
  while self.eat(' ') or self.eat('\n') or self.eat('\r') or self.eat('\t'): discard

proc nextOp(self: var Expression, ops: openArray[string]): string =
  self.eatSpaces()
  
  for op in ops:
    if self.eat(op):
      result = op

proc parseQuote(self: var Expression, q: char): string =
  while not self.atEnd():
    let c = self.eatChar()

    if c == '\\':
      result.add self.eatChar()
    elif c == q:
      return result
    else:
      result.add c
  raise (ref ValueError)(msg: "'\"' not found")

proc parseIdent(self: var Expression): string =
  while self.peekChar() in {'a'..'z', 'A'..'Z', '0'..'9', '_'}:
    result.add self.eatChar()

proc parseParen(self: var Expression): string =
  var sub = ""
  
  var depth = 1
  while not self.atEnd():
    if self.eat('('):
      inc depth
    elif self.eat(')'):
      dec depth
      if depth == 0:
        var subexp = Expression(src: sub, variables: self.variables)
        return subexp.parseExpr1()
    else:
      sub.add self.eatChar()
  
  raise (ref ValueError)(msg: "parenthesis not baranced")

proc parseTerm(self: var Expression): string =
  self.eatSpaces()

  if self.eat('"'):
    result = self.parseQuote('"')
  elif self.eat('\''):
    result = self.parseQuote('\'')
  elif self.eat('$'):
    result = self.variables[self.parseIdent()]
  elif self.eat('('):
    result = self.parseParen()
  else:
    result = self.parseIdent()

proc toStr(b: bool): string =
  if b:
    "True"
  else:
    "False"

proc applyOp(op, le, ri: string): string =
  case op
  of "==":
    toStr(le == ri)
  of "!=":
    toStr(le != ri)
  of "<":
    toStr(le < ri)
  of "<=":
    toStr(le <= ri)
  of ">":
    toStr(le > ri)
  of ">=":
    toStr(le >= ri)
  of "and":
    toStr(le == "True" and ri == "True")
  of "or":
    toStr(le == "True" or ri == "True")
  else:
    raise (ref ValueError)(msg: "Unknown op")

proc parseExpr2(self: var Expression): string =
  result = self.parseTerm()

  while not self.atEnd():
    let op = self.nextOp(["==", "!=", "<", "<=", ">", ">="])

    if op == "":
      self.eatSpaces()
      break
      # if self.atEnd():
      #   break
      # else:
      #   raise (ref ValueError)(msg: "Parse failed")
    
    result = op.applyOp(result, self.parseTerm())

proc parseExpr1(self: var Expression): string =
  result = self.parseExpr2()

  while not self.atEnd():
    let op = self.nextOp(["and", "or"])

    if op == "":
      self.eatSpaces()
      if self.atEnd():
        break
      else:
        raise (ref ValueError)(msg: "Parse failed")
  
    result = op.applyOp(result, self.parseExpr2())


proc evalConditionExpr*(s: string, variables: Table[string, string]): string =
  var e = Expression(
    src: s,
    variables: variables
  )
  result = e.parseExpr1()

{.pop.}

when isMainModule:
  echo evalConditionExpr("""

a == b or c == c

""", {"ROS_VERSION": "2"}.toTable)

