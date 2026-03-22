#include *i ..\TextRender%A_TrayMenu%.ahk
#include *i ..\TextRender (for v%true%).ahk
#singleinstance force

; Get a path to the font. Must end in .otf or .ttf
font := "..\media\Love_and_Passion.ttf"

; Or pass the font directly as a parameter string!
; Note: It's best to place parenthesis around the path name if you have whitespace
TextRender("Flying in the night sky"
   , "t:10s c:midnightblue"
   , "f:(..\media\Love_and_Passion.ttf) s:10vmin")

Esc:: ExitApp