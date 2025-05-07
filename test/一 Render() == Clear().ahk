#include *i ..\TextRender%A_TrayMenu%.ahk
#include *i ..\TextRender (for v%true%).ahk
#singleinstance force

tr := TextRender()
tr.Render("hello world")
tr.Suspend(2000)
tr.Render()
TextRender("The text should have been cleared by now.", "t:3000 y:83%")

Sleep 10000
ExitApp
Esc:: ExitApp