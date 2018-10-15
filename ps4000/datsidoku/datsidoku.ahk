﻿#SingleInstance, force

I_Icon = %A_ScriptDir%\icons\dblue.ico
Menu, Tray, NoStandard
Menu, Tray, Icon, %I_Icon%
Menu, Tray, Tip, DatSiDoku

Menu, Tray, Add, Sichern über PS4000, guiSichern
Menu, Tray, Add, Wiederherstellen über PS4000, guiHerstellen
Menu, Tray, Add, Ablage über Explorer, guiExplorer
Menu, Tray, Add
Menu, Tray, Add, DatSiDoku anhalten, gPause
Menu, Tray, Add, Beenden, gExit
return


#IfWinActive, PS4000 Projektkonsole
~LButton::
	if WinExist("PS4000 Projektkonsole","Sicherung")
		{
		MouseGetPos,,,, OutputVarControl
			if OutputVarControl = Button1
				Gosub, guiSichern
				OutputVarControl :=""
			return
		}
	else
		{
		if WinExist("PS4000 Projektkonsole","Wiederherstellung")
			MouseGetPos,,,, OutputVarControl
			if OutputVarControl = Button1
				Gosub, guiHerstellen
				OutputVarControl :=""
			return
		}
	return
#IfWinActive


;GUI PS4000 Sicherung
guiSichern:
	Gui, Destroy
	Gui, +E0x08000000 +AlwaysOnTop
	Gui, Show, x250 y250 w200 h200 NoActivate, DatSiDoku
	Gui, Add, Button, x40 y5 h50 w120 gSichern, Sichern
	Gui, Add, Text, w120 h2 +0x10
	Gui, Add, Radio, vworkedon Checked, In Bearbeitung
	Gui, Add, Radio, vdone, Fertig
	Gui, Add, Button, x65 y160 h20 w70 gexit, Schließen
	return

Sichern:
	Gui, Submit
	if (workedon)
		{
			vstatus := "NICHT fertig"
		}
	if (done)
		{
			vstatus := "FERTIG"
		}
	WinGet, win_id, ID, A
	ControlGetText bar_text, ToolbarWindow324, ahk_id %win_id%
	StringTrimLeft, currentPath, bar_text, 9
	FormatTime, CurrentDateTime,, yyyy-MM-dd_HH-mm
	FileDelete, %currentPath%\*abgelegt*.ps5
	FileAppend, , %currentPath%\%CurrentDateTime% letzte Sicherung abgelegt durch %A_UserName% - %vstatus%.ps5
		if ErrorLevel
			SoundPlay, *16
			MsgBox, 16, Fehler, Achtung, es wurde keine Datei erzeugt!
		else
			{
				SplashTextOn,,25, Status, Datei wurde erzeugt.
				Sleep, 750
				SplashTextOff
				Gui, Destroy
			}
			currentPath :=""
			return
	return


;GUI PS4000 Wiederherstellung
guiHerstellen:
	Gui, Destroy
	Gui, +E0x08000000 +AlwaysOnTop
	Gui, Show, x250 y250 w200 h200 NoActivate, DatSiDoku
	Gui, Add, Button, x40 y5 h50 w120 gHerstellen, Wiederherstellen
	Gui, Add, Button, x65 y160 h20 w70 gexit, Schließen
	return

Herstellen:
	WinGet, win_id, ID, A
	ControlGetText bar_text, ToolbarWindow323, ahk_id %win_id%
	StringTrimLeft, currentPath, bar_text, 9
	FormatTime, CurrentDateTime,, yyyy-MM-dd_HH-mm
	FileDelete, %currentPath%\*wiederhergestellt*.ps5
	FileAppend, , %currentPath%\%CurrentDateTime% ACHTUNG! Projekt wiederhergestellt von %A_UserName%.ps5
		if ErrorLevel
			SoundPlay, *16
			MsgBox, 16, Fehler, Achtung, es wurde keine Datei erzeugt!
		else
			{
				SplashTextOn,,25, Status, Datei wurde erzeugt.
				Sleep, 750
				SplashTextOff
				Gui, Destroy
			}
	currentPath :=""
	return


;GUI Windows Explorer
guiExplorer:
	Gui, Destroy
	Gui, +E0x08000000 +AlwaysOnTop
	Gui, Show, x250 y250 w200 h200 NoActivate, DatSiDoku
	Gui, Add, Button, x40 y5 h20 w120 gExplorersub1, Sichern
	Gui, Add, Radio, vworkedon Checked, In Bearbeitung
	Gui, Add, Radio, vdone, Fertig
	Gui, Add, Text, w120 h2 +0x10
	Gui, Add, Button, x40 h20 w120 gExplorersub2, Wiederherstellen
	Gui, Add, Button, x40 h20 w120 gExplorersub3, Ausbuchen
	Gui, Add, Button, x65 y170 h20 w70 gexit, Schließen
	return

Explorersub1:
	Gui, Submit
	if (workedon)
		{
			vstatus := "NICHT fertig"
		}
	if (done)
		{
			vstatus := "FERTIG"
		}
	WinGet, win_id, ID, A
	ControlGetText bar_text, ToolbarWindow323, ahk_id %win_id%
	StringTrimLeft, currentPath, bar_text, 9
	FormatTime, CurrentDateTime,, yyyy-MM-dd_HH-mm
	FileDelete, %currentPath%\*abgelegt*.ps5
	FileAppend, , %currentPath%\%CurrentDateTime% letzte Sicherung abgelegt durch %A_UserName% - %vstatus%.ps5
		if ErrorLevel
			SoundPlay, *16
			MsgBox, 16, Fehler, Achtung, es wurde keine Datei erzeugt!
		else
			{
				SplashTextOn,,25, Status, Datei wurde erzeugt.
				Sleep, 750
				SplashTextOff
				Gui, Destroy
			}
			currentPath :=""
			return
	return

Explorersub2:
	WinGet, win_id, ID, A
	ControlGetText bar_text, ToolbarWindow323, ahk_id %win_id%
	StringTrimLeft, currentPath, bar_text, 9
	FormatTime, CurrentDateTime,, yyyy-MM-dd_HH-mm
	FileDelete, %currentPath%\*wiederhergestellt*.ps5
	FileAppend, , %currentPath%\%CurrentDateTime% ACHTUNG! Projekt wiederhergestellt von %A_UserName%.ps5
		if ErrorLevel
			SoundPlay, *16
			MsgBox, 16, Fehler, Achtung, es wurde keine Datei erzeugt!
		else
			{
				SplashTextOn,,25, Status, Datei wurde erzeugt.
				Sleep, 750
				SplashTextOff
				Gui, Destroy
			}
	currentPath :=""
	return

Explorersub3:
	FileSelectFile, currentfile,,%A_Desktop%, Datei auswählen..., *.ps5
		if (currentfile = "")
			{
				SoundPlay, *16
				MsgBox, 16, Fehler!,Sie haben keine Datei ausgewählt.
				return
			}
		Loop, %currentfile%
			currentpath := A_LoopFileDir
	InputBox, ausbuchen_name, PS4000 Ablage, Für wen wird die Sicherung ausgebucht?,,,150
		if ausbuchen_name =
			MsgBox,, Fehler!, Sie haben keinen Namen angegeben, bitte erneut versuchen.
		else
			{
				FileDelete, %currentPath%\*übergeben*.ps5
				FormatTime, CurrentDateTime,, yyyy-MM-dd_HH-mm
				FileAppend, , %currentPath%\%CurrentDateTime% ACHTUNG! Projekt übergeben an %ausbuchen_name%.ps5
					if ErrorLevel
						MsgBox,, Fehler!, Achtung, es wurde keine Datei erzeugt!
					else
						{
							SplashTextOn,,25, Status, Datei wurde erzeugt.
							Sleep, 750
							SplashTextOff
							Run, "C:\Program Files\Microsoft Office 15\root\office15\OUTLOOK.EXE" /c ipm.note /m %ausbuchen_name% /a "%currentfile%"
							Gui, Destroy
						}
				currentfile :=""
				currentPath :=""
				ausbuchen_name :=""
			}
	return


gPause:
	menu, tray, ToggleCheck, Programm anhalten
	Suspend, Toggle
	Pause, Toggle
	return

gExit:
	ExitApp
	Return

guiclose:
Gui, Destroy

exit:
Gui, Destroy