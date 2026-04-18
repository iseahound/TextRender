#include *i ..\TextRender.ahk
#singleinstance force

; This is an unrealistic daily routine for the life of a working student
; In reality no one has that much free time...

; Press Win + W to open. Click the arrows on the side to adjust your schedule for early / late waketimes
; Press Space or NumpPadEnter or Left Click to open a custom calender app
; Press Esc or Right Click to exit

Daily_Routine()

Schedule() => TextRender("Opening Schedule!", "t:3s r:3vmin c:#FFDE81  m:3vmin", "s:5vmin")

#w:: Daily_Routine()

Daily_Routine(*) {
   static tx := Map(
      "08:00 AM", "Commute",
      "08:30 AM", "School",
      "09:00 AM", "School",
      "09:30 AM", "School",
      "10:00 AM", "School",
      "10:30 AM", "School",
      "11:00 AM", "School",
      "11:30 AM", "School",
      "12:00 PM", "Commute",
      "12:30 PM", "Work",
      "01:00 PM", "Work",
      "01:30 PM", "Work",
      "02:00 PM", "Work",
      "02:30 PM", "Work",
      "03:00 PM", "Work",
      "03:30 PM", "Work",
      "04:00 PM", "Work",
      "04:30 PM", "Work",
      "05:00 PM", "Work",
      "05:30 PM", "Commute",
      "06:00 PM", "Evening Free Time 1",
      "06:30 PM", "Evening Free Time 1",
      "07:00 PM", "Evening Free Time 2",
      "07:30 PM", "Evening Free Time 2",
      "08:00 PM", "Evening Free Time 3",
      "08:30 PM", "Evening Free Time 3",
      "09:00 PM", "Evening Free Time 4",
      "09:30 PM", "Evening Free Time 4",
      "10:00 PM", "Sleep",
      "10:30 PM", "Sleep",
      "11:00 PM", "Sleep",
      "11:30 PM", "Sleep",
      "12:00 AM", "Sleep",
      "12:30 AM", "Sleep",
      "01:00 AM", "Sleep",
      "01:30 AM", "Sleep",
      "02:00 AM", "Sleep",
      "02:30 AM", "Sleep",
      "03:00 AM", "Sleep",
      "03:30 AM", "Sleep",
      "04:00 AM", "Sleep",
      "04:30 AM", "Sleep",
      "05:00 AM", "Sleep",
      "05:30 AM", "Sleep",
      "06:00 AM", "Sleep",
      "06:30 AM", "Morning Routine",
      "07:00 AM", "Morning Routine",
      "07:30 AM", "Morning Routine",
   )

   static scroll_offset := 0
   static update_offset := 0

   static up := TextRender(, "x:0 y:41vh w:6vh h:6vh t:42s c:#1E1E2E", "c:#89B4FA s:2.3vmin v:center").NoEvents()
      .OnLeftMouseDown(Update.bind("-30"))
   static down := TextRender(, "x:0 y:53vh w:6vh h:6vh t:42s c:#1E1E2E", "c:#89B4FA s:2.3vmin v:center").NoEvents()
      .OnLeftMouseDown(Update.bind("+30"))
   static counter := TextRender(, "x:0 y:47vh w:6vh h:6vh t:42s c:#1E1E2E", "c:#F4DC83 s:2.3vmin v:center o:1.5 j:center").NoEvents()
      .OnLeftMouseDown(() => (update_offset := 0, Update()))
   static popup := TextRender(, "t:42s r:3vmin c:#1E1E2E  m:5vmin", "c:#ECEFF4  j:left s:5vmin").NoEvents()
      .OnLeftMouseDown(LaunchSchedule)
      .OnRightMouseUp(Destroy)
      .OnMouseScrollUp(Scroll.bind("-30"))
      .OnMouseScrollDown(Scroll.bind("+30"))
      .OnRender(Enable)
      .OnDestroy(Disable)  ; No special handling on exit required as cleanup will be performed on destruction

   ; // main() function
   WinExist(popup) ? Destroy() : Create()
   ; // end main()

   Create() {
      Update()
      up.Render("▲")
      down.Render("▼")
   }

   Destroy(ThisHotkey?) {
      up.Destroy()
      down.Destroy()
      counter.Destroy()
      popup.Destroy()
   }

   Scroll(Δscroll_offset) {
      scroll_offset += Δscroll_offset

      static now(dt) => FormatTime(DateAdd(A_Now, -mod(A_Min,  30) + dt, "minutes"), "hh:mm tt")
      past := now(scroll_offset-60)
      prev := now(scroll_offset-30)
      curr := now(scroll_offset)
      next := now(scroll_offset+30)
      soon := now(scroll_offset+60)
      time := FormatTime(, "hh:mm tt")

      up.Restart()
      down.Restart()
      counter.Restart()
      popup.Render(RegExReplace(
         ""     past "   " tx[now(scroll_offset+update_offset-60)]
         . "`n" prev "   " tx[now(scroll_offset+update_offset-30)]
         . "`n" curr "   " tx[now(scroll_offset+update_offset)]
         . "`n" next "   " tx[now(scroll_offset+update_offset+30)]
         . "`n" soon "   " tx[now(scroll_offset+update_offset+60)]
      , now(0) "   " tx[now(update_offset)], time " ❧ " tx[now(update_offset)] " ☙"))
   }

   Update(Δupdate_offset := 0) {
      update_offset += Δupdate_offset

      static now(dt) => FormatTime(DateAdd(A_Now, -mod(A_Min,  30) + dt, "minutes"), "hh:mm tt")
      past := now(-60)
      prev := now(-30)
      curr := now(0)
      next := now(+30)
      soon := now(+60)
      time := FormatTime(, "hh:mm tt")

      up.Restart()
      down.Restart()
      counter.Render(round(update_offset/60, 1))
      popup.Render(
         ""     past "   " tx[now(update_offset-60)]
         . "`n" prev "   " tx[now(update_offset-30)]
         . "`n" time " ❧ " tx[now(update_offset)] " ☙"
         . "`n" next "   " tx[now(update_offset+30)]
         . "`n" soon "   " tx[now(update_offset+60)]
      )
      scroll_offset := 0 ; Reset any scrolled views.
   }

   LaunchSchedule(ThisHotkey?) {
      Destroy()
      Schedule()
   }

   Enable() {
      HotIf
      Hotkey "Esc", Destroy, "On"
      Hotkey "Space", LaunchSchedule, "On"
      Hotkey "NumPadEnter", LaunchSchedule, "On"
   }

   Disable() {
      HotIf
      Hotkey "Esc", "Off"
      Hotkey "Space", "Off"
      Hotkey "NumPadEnter", "Off"
      try Hotkey "Esc", "Esc", "On"
      try Hotkey "Space", "Space", "On"
      try Hotkey "NumPadEnter", "NumPadEnter", "On"
   }
}