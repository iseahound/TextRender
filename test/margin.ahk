#include *i ..\TextRender%A_TrayMenu%.ahk
#include *i ..\TextRender (for v%true%).ahk
#singleinstance force

; Backdrop
shadow := TextRender("", "w:80% h:80% c:83888888").ClickThrough()
; Red Dot in Center
origin := TextRender("", "r:25 w:50 h:50 c:Red").ClickThrough()

margins := ["(top:50 right:100 bottom:300 left:0)"
          , "(top:100 right:300 bottom:0 left:50)"
          , "(top:300 right:0 bottom:50 left:100)"
          , "(top:0 right:50 bottom:100 left:300)"]

a := TextRender()

for each, value in margins {
   a.Render("center on text `nmargin: " value, "color:Random x:center y:center t:auto m:" value, "j:left s:5vmin").Wait()

   a.Render("center on background `ntext margin: " value, "color:Random x:center y:center t:auto m:0", "j:left s:5vmin m:" value).Wait()

   origin.TopMost()
}

shadow := origin := a := ""
ExitApp
Esc:: ExitApp