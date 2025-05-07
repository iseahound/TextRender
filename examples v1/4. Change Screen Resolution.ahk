#include ..\TextRender (for v1).ahk

TextRender("Press 1 or 2 to toggle screen resolution to 1080p and 720p", "color:random t:30000 s:3vmin y:12%")
tr := TextRender(, "s:10vmin")

1::
tr.Render("720p", "time:10000")
ChangeDisplaySettings(32, 1280,  720, 60)
return

2::
tr.Render("1080p", "time:10000")
ChangeDisplaySettings(32, 1920, 1080, 60)
return

ChangeDisplaySettings( cD, sW, sH, rR ) {
    VarSetCapacity(dM,156,0), NumPut(156,2,&dM,36)
    DllCall( "EnumDisplaySettingsA", UInt,0, UInt,-1, UInt,&dM ), NumPut(0x5c0000,dM,40)
    NumPut(cD,dM,104),  NumPut(sW,dM,108),  NumPut(sH,dM,112),  NumPut(rR,dM,120)
    Return DllCall( "ChangeDisplaySettingsA", UInt,&dM, UInt,0 )
}

Esc:: ExitApp