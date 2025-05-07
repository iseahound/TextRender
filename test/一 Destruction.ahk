#include *i ..\TextRender%A_TrayMenu%.ahk
#include *i ..\TextRender (for v%true%).ahk
#singleinstance force

b := TextRender()
b.Render("hi!","m:0 c:Random", "s:15%")
Sleep 250
b := "" ; The screen should be blank here

Sleep 10000
ExitApp
Esc:: ExitApp