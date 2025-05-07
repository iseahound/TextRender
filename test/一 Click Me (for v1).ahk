#include ..\TextRender (for v1).ahk
#singleinstance force

tr := TextRender("Click me", "w:500px h:500px m:0 c:random", "v:center")
tr.NoEvents() ; IMPORTANT: Removes all default events.
tr.OnEvent("LeftMouseDown", Func("fn"))

fn(this) { ; "this" must be the first parameter.
    static n := 1
    static frames := ["oops", "I", "did", "it", "again"]

    if (n == frames.length() + 1)
       ExitApp

    this.draw(frames[n++], "w:500px h:500px m:0 c:random2", "v:center")
    this.fadein()
}

Esc:: ExitApp