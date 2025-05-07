#Include TextRender.ahk

TextRender("Press 1 or 2 to toggle screen resolution to 1080p and 720p", "color:random t:30000 s:3vmin m:3vmin y:12%")

1:: {
tr := TextRender("720p", "time:10000")
ChangeDisplaySettings(32, 1280,  720, 60)
}

2:: {
tr := TextRender("1080p", "time:10000")
ChangeDisplaySettings(32, 1920, 1080, 60)
}


ChangeDisplaySettings( cD, sW, sH, rR ) {
    dM := Buffer(156, 0), NumPut(36, 156, 2, dM.Ptr)
    DllCall("EnumDisplaySettingsA", "UInt", 0, "UInt", -1, "UInt", dM.Ptr), NumPut("UPtr", 0x5c0000, dM, 40)
    NumPut("UPtr", cD, dM, 104),  NumPut("UPtr", sW, dM, 108),  NumPut("UPtr", sH, dM, 112),  NumPut("UPtr", rR, dM, 120)
    Return DllCall("ChangeDisplaySettingsA", "UInt", dM.Ptr, "UInt", 0)
}

Esc::ExitApp