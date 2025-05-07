#include ..\TextRender (for v1).ahk
SetBatchLines -1 ; Mandatory for all v1 scripts

srt := "..\media\sample.srt"

; Create TextRender instance.
tr := TextRender()

; Get number of lines in srt file.
Loop Read, % srt
   srt_number_of_lines := A_Index

; Loop through the SRT file.
state := 1
time_alive := time_pause := t2 := t1 := 0
text := ""
Loop Read, % srt
{
   ; State 0: Draw!
   if (A_LoopReadLine = "") && (state >= 4) {
      tr.Hide()
      tr.Suspend(time_pause)
      tr.Render(text, "r:1vmin y:83%")
      tr.Suspend(time_alive)
   }

   ; Increment the state
   state++

   ; Debugging
   ; MsgBox % "Index:`t" A_Index "`nState:`t" state "`nLine Text:`t" A_LoopReadLine

   ; State 1: An empty line resets the state to 1.
   if (A_LoopReadLine = "")
      state := 1

   ; State 2 - Subtitle #
   if (state = 2)
      ("This is usually a subtitle number in the SRT.")

   ; State 3 - Time
   if (state = 3) {

      ; Gets the hours, minutes, seconds, and milliseconds of the starting time. (Fade In)
      h1 := RegExReplace(A_LoopReadLine, "^(\d+):(\d+):(\d+),(\d+) --> (\d+):(\d+):(\d+),(\d+)", "$1")
      m1 := RegExReplace(A_LoopReadLine, "^(\d+):(\d+):(\d+),(\d+) --> (\d+):(\d+):(\d+),(\d+)", "$2")
      s1 := RegExReplace(A_LoopReadLine, "^(\d+):(\d+):(\d+),(\d+) --> (\d+):(\d+):(\d+),(\d+)", "$3")
      f1 := RegExReplace(A_LoopReadLine, "^(\d+):(\d+):(\d+),(\d+) --> (\d+):(\d+):(\d+),(\d+)", "$4")

      ; Gets the hours, minutes, seconds, and milliseconds of the ending time. (Fade Out)
      h2 := RegExReplace(A_LoopReadLine, "^(\d+):(\d+):(\d+),(\d+) --> (\d+):(\d+):(\d+),(\d+)", "$5")
      m2 := RegExReplace(A_LoopReadLine, "^(\d+):(\d+):(\d+),(\d+) --> (\d+):(\d+):(\d+),(\d+)", "$6")
      s2 := RegExReplace(A_LoopReadLine, "^(\d+):(\d+):(\d+),(\d+) --> (\d+):(\d+):(\d+),(\d+)", "$7")
      f2 := RegExReplace(A_LoopReadLine, "^(\d+):(\d+):(\d+),(\d+) --> (\d+):(\d+):(\d+),(\d+)", "$8")


      t1 := 3600000 * h1 + 60000 * m1 + 1000 * s1 + f1 ;Start

      ; Calculate the amount of time to wait before showing the subtitle using the old ending time.
      time_pause := t1 - t2 ; <---- previous end!!!

      t2 := 3600000 * h2 + 60000 * m2 + 1000 * s2 + f2 ;End

      ; Calculate the amount of time to show the subtitle on screen.
      time_alive := t2 - t1
   }

   ; Read the text.
   if (state = 4)
      text := A_LoopReadLine

   ; Keep reading until the line is blank.
   if (state > 4)
      text .= "`n" A_LoopReadLine
}

; Last cycle
tr.Hide()
tr.Suspend(time_pause)
tr.Render(text, "color:LemonChiffon", "s:5vmin")
tr.Suspend(time_alive)
tr.Clear()

ExitApp
Esc:: ExitApp