#include *i ..\TextRender%A_TrayMenu%.ahk
#include *i ..\TextRender (for v%true%).ahk
#singleinstance force

a := TextRender()

loop 3
   if vertical := A_Index
      loop 3
         if justify := A_Index
            a.Render("justify: " justify "`nvertical: " vertical
                  ,  "color:Random x:center y:center w:50vmin h:50vmin t:fast m:0 a:5"
                  ,  "s:10vmin j:" justify " v:" vertical)
            .Wait()


ExitApp
Esc:: ExitApp