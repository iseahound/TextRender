#include *i ..\TextRender%A_TrayMenu%.ahk
#include *i ..\TextRender (for v%true%).ahk
#singleinstance force

tr := TextRender()

tr.Draw("test 1", "m:10vmin c:Random t:2400").FadeIn(800).Cooldown().FadeOut(800)

tr.Draw("test 2", "m:10vmin c:Random").FadeIn(800).Suspend(2400).FadeOut(800)

tr.Draw("test 3", "m:10vmin c:Random t:2400").FadeOut(800).Cooldown().FadeIn(800)

tr.Draw("test 4", "m:10vmin c:Random").FadeOut(800).Suspend(2400).FadeIn(800)

Esc::ExitApp