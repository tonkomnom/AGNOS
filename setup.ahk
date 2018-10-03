;give instructions to install AHK???

FileCreateShortcut, %A_ScriptDir%\main.ahk, %A_Startup%\main.lnk
FileCreateShortcut, %A_ScriptDir%\ps4000\datsidoku\datsidoku.ahk, %A_Startup%\datsidoku.lnk
Run, %A_ScriptDir%\main.ahk