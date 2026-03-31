#include *i ..\TextRender%A_TrayMenu%.ahk
#include *i ..\TextRender (for v%true%).ahk
#singleinstance force

tr := TextRender()
tr.Render("hello")
tr.Render() ; good
tr.Clear()
tr.Suspend(2000)
TextRender("There should be an error!", "t:3000 y:83%")
tr.Render() ; not good

Sleep 10000
ExitApp
Esc:: ExitApp