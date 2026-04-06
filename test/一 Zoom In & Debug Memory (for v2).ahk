#include *i ..\TextRender%A_TrayMenu%.ahk
#include *i ..\TextRender (for v%true%).ahk
#singleinstance force

a := TextRender()
a.Render("abcdef", "m0 c:random2")
a.DebugMemory := DebugMemory
a.DebugMemory()

   DebugMemory(this) {
      this.GetParentCoordinates(&monitor_left, &monitor_top, &monitor_width, &monitor_height)

      ; Using LockBits seems to bypass the need for DeleteGraphics to commit changes to this.ptr
      left := this.WindowLeft - monitor_left
      top := this.WindowTop - monitor_top
      width := this.WindowWidth
      height := this.WindowHeight

      if (width * height * 70**2 > 536870912) {
         TextRender("Window is too large to debug.", "t:3000 c:#F9E486 r:10%")
         return this
      }

      ; Allocate buffer.
      size := 4 * width * height
      buf := Buffer(size)

      ; Create a Bitmap with 32-bit pre-multiplied ARGB. (Owned by this object!)
      DllCall("gdiplus\GdipCreateBitmapFromScan0", "int", this.BitmapWidth, "int", this.BitmapHeight
         , "uint", 4 * this.BitmapWidth, "uint", 0xE200B, "ptr", this.ptr, "ptr*", &pBitmap:=0)

      ; Specify that only a cropped bitmap portion will be copied.
      Rect := Buffer(16, 0)                  ; sizeof(Rect) = 16
         NumPut(   "int",    left, Rect,  0) ; X
         NumPut(   "int",     top, Rect,  4) ; Y
         NumPut(  "uint",   width, Rect,  8) ; Width
         NumPut(  "uint",  height, Rect, 12) ; Height
      BitmapData := Buffer(16+2*A_PtrSize, 0)       ; sizeof(BitmapData) = 24, 32
         NumPut(   "int", 4*width, BitmapData,  8)  ; Stride
         NumPut(   "ptr", buf.ptr, BitmapData, 16)  ; Scan0

      ; Convert pARGB to ARGB using a writable buffer created by LockBits.
      DllCall("gdiplus\GdipBitmapLockBits"
               ,    "ptr", pBitmap
               ,    "ptr", Rect
               ,   "uint", 5            ; ImageLockMode.UserInputBuffer | ImageLockMode.ReadOnly
               ,    "int", 0x26200A     ; Format32bppArgb
               ,    "ptr", BitmapData)  ; Contains the buffer.
      DllCall("gdiplus\GdipBitmapUnlockBits", "ptr", pBitmap, "ptr", BitmapData)

      ; Release reference to pBits.
      DllCall("gdiplus\GdipDisposeImage", "ptr", pBitmap)

      ; Yes, TextRender can create it's own TextRender instance :)
      tr := TextRender()

      ; Draw an enlarged pixel grid layout with printed color hexes.
      loop height {
         h := A_Index-1
         loop width {
            w := A_Index-1
            offset := h * width + w
            tr.Render("Progress: " Round(offset / (width * height) * 100, 2) "%", "y:67%")
            pixel := Format("{:08X}", NumGet(buf, 4*offset, "uint"))
            hex := RegExReplace(pixel, "(.{4})(.{4})", "$1`r`n$2")
            this.Draw(hex, {x:70*w, y:70*h, w:70, h:70, m:0, c:pixel}, "s:24pt v:center")
         }
      }

      ; Show the user using their built-in image viewer.
      tr.Render("Writing to disk...", "y:67%")
      this.save("TextRender.png")
      Run "TextRender.png"

      ; Renders the huge image on screen!!!
      this.OnLeftMouseDown((this) => this.EventMoveWindowStorePositionAndRender())
      this.render()
      tr.Render("Press Esc to Exit", "y:16% t:30s")

      ; Note that this is a slow function in general. I'm not entirely sure how it can be sped up.
      return this
   }

Esc:: ExitApp