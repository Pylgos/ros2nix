import std/[strformat, strutils, os]


proc errorLike(name, msg: string, title = "", file = "", col = -1, endColumn = -1, line = -1, endLine = -1) =
  var s = fmt"::{name} "
  
  if title != "": s &= fmt"title={title},"
  if file != "": s &= fmt"file={file},"
  if col != -1: s &= fmt"col={col},"
  if endColumn != -1: s &= fmt"endColumn={endColumn},"
  if line != -1: s &= fmt"line={line},"
  if endLine != -1: s &= fmt"endLine={endLine},"

  s.removeSuffix(',')
  s &= fmt"::{msg}"
  
  echo s


proc error*(msg: string, title = "", file = "", col = -1, endColumn = -1, line = -1, endLine = -1) =
  errorLike("error", msg, title, file, col, endColumn, line, endLine)

proc notice*(msg: string, title = "", file = "", col = -1, endColumn = -1, line = -1, endLine = -1) =
  errorLike("notice", msg, title, file, col, endColumn, line, endLine)

proc warn*(msg: string, title = "", file = "", col = -1, endColumn = -1, line = -1, endLine = -1) =
  errorLike("warn", msg, title, file, col, endColumn, line, endLine)

proc debug*(msg: string) =
  echo fmt"::debug::{msg}"

proc beginGroup*(title: string) =
  echo fmt"::group::{title}"

proc endGroup*() =
  echo fmt"::endgroup::"

proc jobSummaryFilePath*(): string =
  let s = getEnv("GITHUB_STEP_SUMMARY")
  
  if s == "":
    once:
      echo "ERROR: environment variable GITHUB_STEP_SUMMARY not found or is empty"
      echo "       redirecting to /tmp/github_step_summary.md"
    "/tmp/github_step_summary.md"
  
  else:
    s


type JobSummary* = object
  content*: string

proc initJobSummary*(): JobSummary = discard

using self: var JobSummary


proc write*(self; s: string) =
  self.content &= s


proc writeDedent*(self; s: string) =
  self.content &= s.dedent


proc line*(self; l: varargs[string]) =
  self.content &= l.join("")
  self.content &= '\n'


proc tableRow*(self; e: varargs[string]) =
  self.line "|" & e.join("|") & "|"


proc tableHeader*(self; e: varargs[string]) =
  self.tableRow(e)
  
  self.write "|"
  for i in 0..<e.len:
    self.write " ---- |"
  self.write "\n"


proc tableEnd*(self) =
  self.write "\n"


proc beginFold*(self; title: string, opened = false) =
  if opened:
    self.line "<details open>"
  else:
    self.line "<details>"

  self.line "<summary>", title, "</summary>\n"


proc endFold*(self) =
  self.line "</details>"


proc ensureNewLine*(self) =
  if not self.content.endsWith("\n"):
    self.write "\n"


proc tripleQuote*(self; typ, s: string) =
  self.line fmt"```{typ}"
  self.write s
  self.ensureNewLine()
  self.line "```"


proc save*(self; file = jobSummaryFilePath()) =
  writeFile(file, self.content)

# proc heading*(self; l: string, lvl = 1) =
#   self.line("#".repeat(lvl) & " " & l)
