#include *i ..\TextRender%A_TrayMenu%.ahk
#include *i ..\TextRender (for v%true%).ahk
#singleinstance force

; The text effects make it a little slow to render, so suspend has been set to 0 seconds.
a := TextRender("", "x:center y:83% c:Off", "s:52.7 f:(Garamond) color:White outline:(stroke:1 glow:4 tint:Black) dropShadow:(blur:5px color:White opacity:0.5 size:15)")
.OnLeftMouseDown(TextRender.prototype.EventMoveWindowStorePosition)
.Render("While")
.Suspend(000)
.Render("While I ")
.Suspend(000)
.Render("While I stood")
.Suspend(000)
.Render("While I stood in")
.Suspend(000)
.Render("While I stood in the")
.Suspend(000)
.Render("While I stood in the heavy,")
.Suspend(000)
.Render("While I stood in the heavy, never-ending")
.Suspend(000)
.Render("While I stood in the heavy, never-ending rain,")
.Suspend(000)
.Render("While I stood in the heavy, never-ending rain, I")
.Suspend(000)
.Render("While I stood in the heavy, never-ending rain, I forgot")
.Suspend(000)
.Render("While I stood in the heavy, never-ending rain, I forgot how")
.Suspend(000)
.Render("While I stood in the heavy, never-ending rain, I forgot how to")
.Suspend(000)
.Render("While I stood in the heavy, never-ending rain, I forgot how to smile...")
.Suspend(000)

Esc:: ExitApp