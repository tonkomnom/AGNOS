#Persistent
;Keeps a script permanently running (that is, until the user closes it or ExitApp is encountered).
#SingleInstance, force
;Determines whether a script is allowed to run again when it is already running.
SendMode Input
;Switches to the SendInput method for Send, SendRaw, Click, and MouseMove/Click/Drag.
SetWorkingDir %A_ScriptDir%
;Script unconditionally uses its own folder as its working directory.

SetBatchLines, -1
SetMouseDelay, -1, -1

Menu, Tray, Tip, Erlkönig
;Menu, Tray, NoStandard
Menu, Tray, Add

Menu, Tray, Add, Info..., gAbout
Menu, Tray, Add, Hilfe, sHelp
Menu, Tray, Add

Menu, options, Add, Tastaturkürzel aktiviert, stogglehk
Menu, options, Add, Autovervollständigung aktiviert, stogglehs
Menu, options, Add, Erlkoenig mit Windows starten, sautomain
Menu, options, Add, DatSiDoku mit Windows starten, sautodatsi
Menu, Tray, Add, Optionen, :options
Menu, Tray, Add

Menu, Tray, Add, EP/DP Zähler, sRunEPDP
Menu, Tray, Add, Neutrino GLT Fernbedienung, sRunremote
Menu, Tray, Add, DatSiDoku, sDatSiDoku
Menu, Tray, Add

Menu, Tray, Add, Erlkoenig anhalten, sPause
Menu, Tray, Add, Beenden, sExit

if FileExist(A_Startup "\main.lnk")
	{
		IniWrite, true, %A_ScriptDir%\core\settings.ini, autostart, autostart_main
	}
else
	{
		IniWrite, false, %A_ScriptDir%\core\settings.ini, autostart, autostart_main
	}

if FileExist(A_Startup "\datsidoku.lnk")
	{
		IniWrite, true, %A_ScriptDir%\core\settings.ini, autostart, autostart_datsi
	}
else
	{
		IniWrite, false, %A_ScriptDir%\core\settings.ini, autostart, autostart_datsi
	}

IniRead, vautomaininit, %A_ScriptDir%\core\settings.ini, autostart, autostart_main
	if vautomaininit = true
		{
			Menu, options, Check, Erlkoenig mit Windows starten
		}
	else
		{
			Menu, options, UnCheck, Erlkoenig mit Windows starten
		}

IniRead, vautodatsiinit, %A_ScriptDir%\core\settings.ini, autostart, autostart_datsi
	if vautodatsiinit = true
		{
			Menu, options, Check, DatSiDoku mit Windows starten
		}
	else
		{
			Menu, options, UnCheck, DatSiDoku mit Windows starten
		}

IniRead, vtogglehk, %A_ScriptDir%\core\settings.ini, hotkeys, active
	if vtogglehk = true
		{
			Menu, options, Check, Tastaturkürzel aktiviert
		}
	else
		{
			Menu, options, UnCheck, Tastaturkürzel aktiviert
			Menu, options, Rename, Tastaturkürzel aktiviert, Tastaturkürzel deaktiviert
			Hotkey, F10, Off
			Hotkey, IfWinActive, ahk_exe PS4000.exe
			Hotkey, ^k, Off
			Hotkey, IfWinActive, ahk_exe bricscad.exe
			Hotkey, #Esc, Off
			Hotkey, IfWinActive, ahk_exe phindows.ex_
			Hotkey, ^z, Off
			Hotkey, #Tab, Off
			Hotkey, $F2, Off
			Hotkey, ^Left, Off
			Hotkey, ^Up, Off
			Hotkey, ^Right, Off
			Hotkey, ^Down, Off
			Hotkey, +Left, Off
			Hotkey, +Right, Off
			Hotkey, IfWinActive
		}

IniRead, vtogglehs, %A_ScriptDir%\core\settings.ini, hotstrings, active
	RegRead, dir, HKLM, SOFTWARE\AutoHotkey, InstallDir
	if (dir = "")
		{
			Menu, options, Disable, Autovervollständigung aktiviert
			Menu, options, Rename, Autovervollständigung aktiviert, Autovervollständigung deaktiviert
		}
	else
		{
			if vtogglehs = true
				{
					Menu, options, Check, Autovervollständigung aktiviert
				}
			else
				{
					Menu, options, UnCheck, Autovervollständigung aktiviert
					Menu, options, Rename, Autovervollständigung aktiviert, Autovervollständigung deaktiviert
					Hotkey, !h, Off
				}
		}

Loop,
	{
		I_Icon = %A_ScriptDir%\core\icons\kblue.ico
		Menu, Tray, Icon, %I_Icon%, ,1
		Sleep, 2000
		I_Icon = %A_ScriptDir%\core\icons\ugold.ico
		Menu, Tray, Icon, %I_Icon%, ,1
		Sleep, 2000
		I_Icon = %A_ScriptDir%\core\icons\pblue.ico
		Menu, Tray, Icon, %I_Icon%, ,1
		Sleep, 2000
	}
return

stogglehk:
	Hotkey, F10, Toggle
	Hotkey, IfWinActive, ahk_exe PS4000.exe
	Hotkey, ^k, Toggle
	Hotkey, IfWinActive, ahk_exe bricscad.exe
	Hotkey, #Esc, Toggle
	Hotkey, IfWinActive, ahk_exe phindows.ex_
	Hotkey, ^z, Toggle
	Hotkey, #Tab, Toggle
	Hotkey, $F2, Toggle
	Hotkey, ^Left, Toggle
	Hotkey, ^Up, Toggle
	Hotkey, ^Right, Toggle
	Hotkey, ^Down, Toggle
	Hotkey, +Left, Toggle
	Hotkey, +Right, Toggle
	Hotkey, IfWinActive
	IniRead, vtogglehk, %A_ScriptDir%\core\settings.ini, hotkeys, active
		if vtogglehk = true
			{
				Menu, options, UnCheck, Tastaturkürzel aktiviert
				Menu, options, Rename, Tastaturkürzel aktiviert, Tastaturkürzel deaktiviert
				IniWrite, false, %A_ScriptDir%\core\settings.ini, hotkeys, active
			}
		else
			{
				Menu, options, Check, Tastaturkürzel deaktiviert
				Menu, options, Rename, Tastaturkürzel deaktiviert, Tastaturkürzel aktiviert
				IniWrite, true, %A_ScriptDir%\core\settings.ini, hotkeys, active
			}
	return

stogglehs:
	Hotkey, !h, Toggle
	IniRead, vtogglehs, %A_ScriptDir%\core\settings.ini, hotstrings, active
		if vtogglehs = true
			{
				Menu, options, UnCheck, Autovervollständigung aktiviert
				Menu, options, Rename, Autovervollständigung aktiviert, Autovervollständigung deaktiviert
				IniWrite, false, %A_ScriptDir%\core\settings.ini, hotstrings, active
			}
		else
			{
				Menu, options, Check, Autovervollständigung deaktiviert
				Menu, options, Rename, Autovervollständigung deaktiviert, Autovervollständigung aktiviert
				IniWrite, true, %A_ScriptDir%\core\settings.ini, hotstrings, active
			}
	return

~^s::
;only used during development
	SetTitleMatchMode, 2
	if WinActive(A_ScriptName)
		{
			Send, ^s
			SplashTextOn,,25, Status, Script updated
			Sleep,1000
			SplashTextOff
			Reload
			Sleep 1000
			MsgBox,,, The script could not load!
		}
	else
		Send, ^s
	return

F10::
	MsgBox, , Title, Text,
return

$F12::
	KeyWait, F12, T1.0
		if ErrorLevel
			{
				;long
				DetectHiddenWindows, On
				GroupAdd, ahk_scripts, ahk_class AutoHotkey
				GroupClose, ahk_scripts, A
			}
		else
			{
				KeyWait, F12, D T0.01
					if ErrorLevel
						;single
						SendInput, {F12}
			}
	return

;hotkeys active for PS4000
#IfWinActive, ahk_exe PS4000.exe
	^k::
		;create note
		MouseClick, Right
		SendInput, {Tab 2}
		SendInput, {Right}
		SendInput, {Up}
		SendInput, {Enter}
		MouseGetPos, xpos, ypos
		MouseMove, xpos + 10, ypos + 10
		
		;set border
		MouseClick, Right
		SendInput, {Tab 2}
		SendInput, {Right}
		SendInput, {Down 2}
		SendInput, {Tab}
		SendInput, {Enter}
		
		;set icon
		MouseClick, Right
		SendInput, {Tab}
		SendInput, {Right}
		SendInput, {Down}
		SendInput, {Tab}
		SendInput, {Enter}
		return	
#IfWinActive

;hotkeys active for Tric
#IfWinActive, ahk_exe bricscad.exe
	#Esc::
	;Win+Esc - save+close drawing
		SendInput, open
		SendInput, {Enter 2}
		return
#IfWinActive

;hotkeys active for Neutrino GLT
#IfWinActive, ahk_exe phindows.ex_
	^z::SendInput, {AltDown}br{AltUp}
	;Ctrl+z - undo

	^s::SendInput, {AltDown}ds{AltUp}
	;Ctrl+s - save

	#Tab::
	;Win+Tab - close text block
		SendInput, {Tab 9}
		SendInput, {Enter}
		return

	$F2::
		KeyWait, F2, T0.5
			if ErrorLevel
				{
					;long - deselect datapoint type
					CoordMode, Mouse, Client
					MouseGetPos, xpos, ypos
					MouseMove, 0, 0
					MouseClick, Left, 25, 50
					MouseClick, Left, 25, 260
					MouseClick, Left, 25, 50
					MouseMove, xpos, ypos
					return
				}
			else
				{
					;short - F2
					KeyWait, F2, D T0.2
						if ErrorLevel
							SendInput, {F2}
						else
							{
									;double - open datapoint selection
									SendInput, {F2}
									Sleep, 50
									SendInput, {Tab 2}
									SendInput, {Space}
									return
							}
				}
		return

	^Left::SendInput, {Left 10}
	;Ctrl+Left - move selection left 10 pixels 

	^Up::SendInput, {Up 10}
	;Ctrl+Up - move selection up 10 pixels 

	^Right::SendInput, {Right 10}
	;Ctrl+Right - move selection right 10 pixels 

	^Down::SendInput, {Down 10}
	;Ctrl+Down - move selection down 10 pixels

	+Left::SendInput, {AltDown}bn{AltUp}
	;Shift+Left - rotate left

	+Right::SendInput, {AltDown}bc{AltUp}
	;Shift+Right - rotate right
#IfWinActive


sautomain:
	IniRead, vautomain, %A_ScriptDir%\core\settings.ini, autostart, autostart_main
		if vautomain = true
			{
				Menu, options, UnCheck, Erlkoenig mit Windows starten
				IniWrite, false, %A_ScriptDir%\core\settings.ini, autostart, autostart_main
				FileDelete, %A_Startup%\main.lnk
			}
		else
			{
				Menu, options, Check, Erlkoenig mit Windows starten
				IniWrite, true, %A_ScriptDir%\core\settings.ini, autostart, autostart_main
				FileCreateShortcut, %A_ScriptFullPath%, %A_Startup%\main.lnk
			}
	return

sautodatsi:
	IniRead, vautodatsi, %A_ScriptDir%\core\settings.ini, autostart, autostart_datsi
		if vautodatsi = true
			{
				Menu, options, UnCheck, DatSiDoku mit Windows starten
				IniWrite, false, %A_ScriptDir%\core\settings.ini, autostart, autostart_datsi
				FileDelete, %A_Startup%\datsidoku.lnk
			}
		else
			{
				Menu, options, Check, DatSiDoku mit Windows starten
				IniWrite, true, %A_ScriptDir%\core\settings.ini, autostart, autostart_datsi
				FileCreateShortcut, %A_ScriptDir%\ps4000\datsidoku\datsidoku.ahk, %A_Startup%\datsidoku.lnk
			}
	return

sRunEPDP:
	RegRead, dir, HKLM, SOFTWARE\AutoHotkey, InstallDir
	if (dir = "")
		{
			Run, %A_ScriptDir%\neutrino\ep-dp_zaehler\ep-dp_zaehler.exe
		}
	else
		{
			Run, %A_ScriptDir%\neutrino\ep-dp_zaehler\ep-dp_zaehler.ahk
		}
	return

sRunremote:
	RegRead, dir, HKLM, SOFTWARE\AutoHotkey, InstallDir
	if (dir = "")
		{
			Run, %A_ScriptDir%\neutrino\remote\remote.exe
		}
	else
		{
			Run, %A_ScriptDir%\neutrino\remote\remote.ahk
		}
	return

sDatSiDoku:
	RegRead, dir, HKLM, SOFTWARE\AutoHotkey, InstallDir
	if (dir = "")
		{
			Run, %A_ScriptDir%\ps4000\datsidoku\datsidoku.exe
		}
	else
		{
			Run, %A_ScriptDir%\ps4000\datsidoku\datsidoku.ahk
		}
	return

sPause:
	menu, tray, ToggleCheck, Erlkoenig anhalten
	Suspend, Toggle
	Pause, Toggle
	return

sExit:
	ExitApp
	return

gAbout:
	Gui, 99:Destroy
	Gui, 99:Add, Text, ,© Tonk Omnom
	Gui, 99:Add, Text, ,Version V0.6.1, 2018-10-14
	Gui, 99:Add, Text, cblue gGitlink, https://github.com/tonkomnom
	Gui, 99:Add, Text,
	Gui, 99: -MinimizeBox
	Gui, 99:Show, AutoSize, Info
	return

Gitlink:
	Run, https://github.com/tonkomnom/erlkoenig
	return

sHelp:
	Run, https://github.com/tonkomnom/erlkoenig
	return

;any new code needs to go above this line
!h::
	AutoTrim Off
	ClipboardOld = %ClipboardAll%
	Clipboard = 
	Send ^c
	ClipWait 1
		if ErrorLevel
			return
	StringReplace, Hotstring, Clipboard, ``, ````, All
	StringReplace, Hotstring, Hotstring, `r`n, ``r, All
	StringReplace, Hotstring, Hotstring, `n, ``r, All
	StringReplace, Hotstring, Hotstring, %A_Tab%, ``t, All
	StringReplace, Hotstring, Hotstring, `;, ```;, All
	Clipboard = %ClipboardOld%
	SetTimer, MoveCaret, 10
	InputBox, Hotstring, New Hotstring, Type your abreviation at the indicated insertion point. You can also edit the replacement text if you wish.`n`nExample entry: :*R:btw`::by the way,,,,,,,, :*R:`::%Hotstring%
		if ErrorLevel
			return
	IfInString, Hotstring, :*R`:::
		{
			MsgBox You didn't provide an abbreviation. The hotstring has not been added.
			return
		}
	FileAppend, `n%Hotstring%, %A_ScriptFullPath%
	Reload
	Sleep 200
	MsgBox, 4, , The hotstring just added appears to be improperly formatted.  Would you like to open the script for editing? Note that the bad hotstring is at the bottom of the script.
	IfMsgBox, Yes, Edit
	return

	MoveCaret:
	IfWinNotActive, New Hotstring
	    return
	Send {Home}{Right 4}
	SetTimer, MoveCaret, Off
	return

