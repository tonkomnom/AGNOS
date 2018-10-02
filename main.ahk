;V0.3.1
#Persistent
;Keeps a script permanently running (that is, until the user closes it or ExitApp is encountered).
#SingleInstance, force
;Determines whether a script is allowed to run again when it is already running.
SendMode Input
;Switches to the SendInput method for Send, SendRaw, Click, and MouseMove/Click/Drag.
SetWorkingDir %A_ScriptDir%
;Script unconditionally uses its own folder as its working directory.

Menu, Tray, Tip, Erlkönig
;Menu, Tray, NoStandard
Menu, Tray, Add

Menu, Tray, Add, Info..., gAbout
Menu, Tray, Add, Hilfe, sHelp
Menu, Tray, Add

Menu, autostartsub, Add, Erlkoenig, sautomain
Menu, autostartsub, Add, DatSiDoku, sautodatsi
Menu, Tray, Add, Autostart, :autostartsub
Menu, Tray, Add

Menu, Tray, Add, EP/DP Zähler, sRunEPDP
Menu, Tray, Add, Neutrino GLT Fernbedienung, sRunremote
Menu, Tray, Add, DatSiDoku, sDatSiDoku
Menu, Tray, Add

Menu, Tray, Add, A.G.N.O.S. anhalten, sPause
Menu, Tray, Add, Beenden, sExit


IniRead, vautomaininit, %A_ScriptDir%\core\settings.ini, autostart, autostart_main
	if vautomaininit = true
		{
			Menu, autostartsub, Check, Erlkoenig
		}
	else
		{
			Menu, autostartsub, UnCheck, Erlkoenig
		}

IniRead, vautodatsiinit, %A_ScriptDir%\core\settings.ini, autostart, autostart_datsi
	if vautodatsiinit = true
		{
			Menu, autostartsub, Check, DatSiDoku
		}
	else
		{
			Menu, autostartsub, UnCheck, DatSiDoku
		}

Loop,
	{
		I_Icon = %A_ScriptDir%\core\icons\kblue.ico
		Menu, Tray, Icon, %I_Icon%
		Sleep, 2000
		I_Icon = %A_ScriptDir%\core\icons\ugold.ico
		Menu, Tray, Icon, %I_Icon%
		Sleep, 2000
		I_Icon = %A_ScriptDir%\core\icons\pblue.ico
		Menu, Tray, Icon, %I_Icon%
		Sleep, 2000
	}
return



#ScrollLock::Pause, Toggle
;Win+Pause pauses script
#Pause::Suspend, Toggle
;Win+Pause suspends hotkeys

;only used during development
~^s::
	SetTitleMatchMode, 2
	if WinActive(A_ScriptName)
		{
			Send, ^s
			SplashTextOn,,25, Status, Script updated
			Sleep,1000
			SplashTextOff
			Reload
			Sleep 1000
			MsgBox, 4,, Das Skript konnte nicht neu geladen werden, zum Editieren öffnen?
			IfMsgBox, Yes, Edit
		}
	else
		Send, ^s
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
		SendInput, {Alt}
		SendInput, D
		SendInput, Z
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
				Menu, autostartsub, UnCheck, Erlkoenig
				IniWrite, false, %A_ScriptDir%\core\settings.ini, autostart, autostart_main
				FileDelete, %A_Startup%\%A_ScriptName%.lnk
			}
		else
			{
				Menu, autostartsub, Check, Erlkoenig
				IniWrite, true, %A_ScriptDir%\core\settings.ini, autostart, autostart_main
				FileCreateShortcut, %A_ScriptFullPath%, %A_Startup%\%A_ScriptName%.lnk
			}
	return

sautodatsi:
	IniRead, vautodatsi, %A_ScriptDir%\core\settings.ini, autostart, autostart_datsi
		if vautodatsi = true
			{
				Menu, autostartsub, UnCheck, DatSiDoku
				IniWrite, false, %A_ScriptDir%\core\settings.ini, autostart, autostart_datsi
				FileDelete, %A_Startup%\datsidoku.lnk
			}
		else
			{
				Menu, autostartsub, Check, DatSiDoku
				IniWrite, true, %A_ScriptDir%\core\settings.ini, autostart, autostart_datsi
				FileCreateShortcut, %A_ScriptDir%\ps4000\datsidoku\datsidoku.ahk, %A_Startup%\datsidoku.lnk
			}
	return

sRunEPDP:
	Run, %A_ScriptDir%\neutrino\ep-dp_zaehler\ep-dp_zaehler.ahk
	return

sRunremote:
	Run, %A_ScriptDir%\neutrino\remote\remote.ahk
	return

sDatSiDoku:
	Run, %A_ScriptDir%\ps4000\datsidoku\datsidoku.ahk
	return

sPause:
	menu, tray, ToggleCheck, A.G.N.O.S. anhalten
	Suspend, Toggle
	Pause, Toggle
	return

sExit:
	ExitApp
	return

gAbout:
	Gui, 99:Destroy
	Gui, 99:Add, Text, ,© Tonk Omnom
	Gui, 99:Add, Text, ,Version V0.3.0, 2018-10-02
	Gui, 99:Add, Text, cblue gGitlink, GitHub
	Gui, 99:Add, Text,
	Gui, 99:Show, AutoSize
	return

Gitlink:
	Run, https://github.com/tonkomnom/erlkoenig
	return

sHelp:
	Run, https://github.com/tonkomnom/erlkoenig
	return