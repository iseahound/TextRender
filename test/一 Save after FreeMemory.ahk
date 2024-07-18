#include *i ..\TextRender%A_TrayMenu%.ahk
#include *i ..\TextRender (for v%true%).ahk
#singleinstance force

tr := TextRender()

tr.Draw("Und über uns ziehen lila Wolken in die Nacht"
   , {color: "#F9E27E"}
   , {font: "Century Gothic"
    , size: 60
    , color: "#F88958"
    , outline: [5, "Indigo"]
    , dropShadow: {horizontal: 5
                 , vertical: 5
                 , blur: 0
                 , color: "#009DA7"}})

tr.Render()
tr.Save()
tr.FreeMemory()
tr.Save()            ; This call after the memory has been freed should work.

TextRender("There should be two identical pictures in the folder.", "t:10000 y:83%")
Sleep 10000
ExitApp
Esc:: ExitApp