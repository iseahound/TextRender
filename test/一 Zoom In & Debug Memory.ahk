#include *i ..\TextRender%A_TrayMenu%.ahk
#include *i ..\TextRender (for v%true%).ahk
#singleinstance force

a := TextRender()
a.Render("cute!", "m0 cpink")
a.DebugMemory()

ExitApp
Esc:: ExitApp