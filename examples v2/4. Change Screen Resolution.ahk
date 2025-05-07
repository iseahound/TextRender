#Include ..\TextRender.ahk

TextRender("Press 1 or 2 to toggle screen resolution to 1080p and 720p", "color:random t:30000 s:3vmin y:12%")
tr := TextRender(, "s:10vmin")

1:: {
tr.Render("720p", "time:10000")
ChangeResolution(1280, 720)
}

2:: {
tr.Render("1080p", "time:10000")
ChangeResolution(1920, 1080)
}

ChangeResolution(Screen_Width := 1920, Screen_Height := 1080, Refresh_Rate := "", Color_Depth := 32)
{
   Device_Mode := Buffer(156, 0)
   NumPut("ushort", 156, Device_Mode, 36)
   DllCall("EnumDisplaySettingsA", "uint", 0, "uint", -1, "ptr", Device_Mode)
   NumPut("uint", 0x5c0000, Device_Mode, 40)
   NumPut("uint", Color_Depth, Device_Mode, 104)
   NumPut("uint", Screen_Width, Device_Mode, 108)
   NumPut("uint", Screen_Height, Device_Mode, 112)
   if Refresh_Rate
      NumPut("uint", Refresh_Rate, Device_Mode, Refresh_Rate)
   Return DllCall("ChangeDisplaySettingsA", "ptr", Device_Mode, "uint", 0)
}

Esc::ExitApp