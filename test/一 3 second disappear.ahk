#include *i ..\TextRender%A_TrayMenu%.ahk
#include *i ..\TextRender (for v%true%).ahk
#singleinstance force

; After 3 seconds, this will disappear.
tr := TextRender("Hey, I just met you", "time: 3000 color: MintCream", "s: 10vmin")

Sleep 10000
ExitApp
Esc:: ExitApp