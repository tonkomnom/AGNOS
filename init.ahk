RegRead, dir, HKLM, SOFTWARE\AutoHotkey, InstallDir
	if (dir = "")
		{
			Run, %A_ScriptDir%\main.exe
		}
	else
		{
			Run, %A_ScriptDir%\main.ahk
		}