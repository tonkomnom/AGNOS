;give instructions to install AHK???

RegRead, dir, HKLM, SOFTWARE\AutoHotkey, InstallDir
	if (dir = "")
		{
			FileCreateShortcut, %A_ScriptDir%\main.exe, %A_Startup%\main.lnk
			FileCreateShortcut, %A_ScriptDir%\ps4000\datsidoku\datsidoku.exe, %A_Startup%\datsidoku.lnk
			FileCreateShortcut, %A_ScriptDir%\main.exe, %A_Desktop%\A.G.N.O.S..lnk , , , , %A_ScriptDir%\core\icons\ampersand.ico
			Run, %A_ScriptDir%\main.exe
		}
	else
		{
			FileCreateShortcut, %A_ScriptDir%\main.ahk, %A_Startup%\main.lnk
			FileCreateShortcut, %A_ScriptDir%\ps4000\datsidoku\datsidoku.ahk, %A_Startup%\datsidoku.lnk
			FileCreateShortcut, %A_ScriptDir%\main.ahk, %A_Desktop%\A.G.N.O.S..lnk , , , , %A_ScriptDir%\core\icons\ampersand.ico
			Run, %A_ScriptDir%\main.ahk
		}
