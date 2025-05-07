#include *i ..\TextRender%A_TrayMenu%.ahk
#include *i ..\TextRender (for v%true%).ahk
#singleinstance force

TextRender("Click on the window to be rendered on", "t:3000 c:PeachPuff r:1vmin")
Sleep 3000
hwnd := WinExist("A")
tr := TextRender().Create("MyWindowTitle", WS_CHILD := 0x40000000,, hwnd)
loop 100 {
   tr.Render("hi", "x: 100 y: 100 c:Random2")
   Sleep 1000
}
ExitApp
Esc:: ExitApp