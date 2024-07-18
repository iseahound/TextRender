#include *i ..\TextRender%A_TrayMenu%.ahk
#include *i ..\TextRender (for v%true%).ahk
#singleinstance force

; Unset and no time. Will disappear.
TextRender("hi!","m:0 c:Random", "s:15%")

TextRender("You should not see anything except mabe a brief flash if your computer is slow.", "t:7000 c:Random y:83%")
Sleep 10000
ExitApp
Esc:: ExitApp