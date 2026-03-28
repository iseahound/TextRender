#include *i ..\TextRender%A_TrayMenu%.ahk
#include *i ..\TextRender (for v%true%).ahk
#singleinstance force

tr := TextRender()
tr.Render("hello world")
TextRender("There should be an error!", "t:3000 y:83%")
tr.Suspend(2000)
tr.Render()

Sleep 10000
ExitApp
Esc:: ExitApp