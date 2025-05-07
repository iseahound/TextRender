#include *i ..\TextRender%A_TrayMenu%.ahk
#include *i ..\TextRender (for v%true%).ahk
#singleinstance force

; Backdrop
shadow := TextRender("", "w:80% h:80% c:83888888").ClickThrough()
; Red Dot in Center
origin := TextRender("", "r:25 w:50 h:50 c:Red").ClickThrough()

a := TextRender()

loop 9
   a.Render("anchor: " A_Index, "color:Random x:center y:center w:50vmin h:50vmin t:fast m:0 a:" A_Index, "j:left s:10vmin").Wait()

loop 9
   a.Render("text anchor: " A_Index, "color:Random x:center y:center w:50vmin h:50vmin t:fast m:0 a:top-left", "j:left s:10vmin a:" A_Index).Wait()


ExitApp
Esc:: ExitApp