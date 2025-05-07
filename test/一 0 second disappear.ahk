#include *i ..\TextRender%A_TrayMenu%.ahk
#include *i ..\TextRender (for v%true%).ahk
#singleinstance force

; Unset and no time. Will disappear.
TextRender("hi!","m:0 c:Random", "s:50%")

TextRender("You should not see anything except maybe a brief flash if your computer is slow.", "t:5000 c:Random y:83%")
Sleep 5000
ExitApp
Esc:: ExitApp