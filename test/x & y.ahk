#include *i ..\TextRender%A_TrayMenu%.ahk
#include *i ..\TextRender (for v%true%).ahk
#singleinstance force

; Red Dot in Center
origin := TextRender("", "r:25 w:50 h:50 c:Red").ClickThrough()

x := ["left", "center", "right"]
y := ["top", "center", "bottom"]

a := TextRender()

for each, value in x
   a.Render("x: " value, "color:Random y:center t:auto m:0 x:" value, "j:left s:10vmin").Wait()

for each, value in y
   a.Render("y: " value, "color:Random x:center t:auto m:0 y:" value, "j:left s:10vmin").Wait()

origin := a := ""
ExitApp
Esc:: ExitApp