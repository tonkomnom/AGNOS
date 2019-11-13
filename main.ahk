#SingleInstance, force
SendMode Input
SetWorkingDir %A_ScriptDir%

SetBatchLines, -1
SetMouseDelay, -1, -1

I_Icon = %A_ScriptDir%\core\icons\agold.ico
Menu, Tray, Icon, %I_Icon%, ,1

Menu, Tray, Tip, A.G.N.O.S.
Menu, Tray, NoStandard

Menu, Tray, Add, Info..., gAbout
Menu, Tray, Add, Hilfe, sHelp
Menu, Tray, Add, Hilfe Online, sHelponline
Menu, Tray, Add

Menu, options, Add, Tastaturkürzel aktiviert, stogglehk
Menu, options, Add, A.G.N.O.S. mit Windows starten, sautomain
Menu, options, Add, DatSiDoku mit Windows starten, sautodatsi
Menu, options, Add, Autovervollständigung mit Windows starten, sautohotstringgen
Menu, Tray, Add, Optionen, :options
Menu, Tray, Add

Menu, Tray, Add, DatSiDoku, sDatSiDoku
Menu, Tray, Add, Autovervollständigung, sRunhotstringgen
Menu, Tray, Add, Neutrino GLT Fernbedienung, sRunremote
Menu, Tray, Add, EP/DP Zähler, sRunEPDP
Menu, Tray, Add

Menu, Tray, Add, Beenden, sExit


if FileExist(A_Startup "\A.G.N.O.S..lnk")
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

if FileExist(A_Startup "\hotstringgen.lnk")
	{
		IniWrite, true, %A_ScriptDir%\core\settings.ini, autostart, autostart_hotstringgen
	}
else
	{
		IniWrite, false, %A_ScriptDir%\core\settings.ini, autostart, autostart_hotstringgen
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
			Suspend, On
		}

IniRead, vautohotstringgeninit, %A_ScriptDir%\core\settings.ini, autostart, autostart_hotstringgen
	if vautohotstringgeninit = true
		{
			Menu, options, Check, Autovervollständigung mit Windows starten
		}
	else
		{
			Menu, options, UnCheck, Autovervollständigung mit Windows starten
		}

IniRead, vautomaininit, %A_ScriptDir%\core\settings.ini, autostart, autostart_main
	if vautomaininit = true
		{
			Menu, options, Check, A.G.N.O.S. mit Windows starten
		}
	else
		{
			Menu, options, UnCheck, A.G.N.O.S. mit Windows starten
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

return

stogglehk:
	Suspend, Toggle
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


sautomain:
	IniRead, vautomain, %A_ScriptDir%\core\settings.ini, autostart, autostart_main
		if vautomain = true
			{
				Menu, options, UnCheck, A.G.N.O.S. mit Windows starten
				IniWrite, false, %A_ScriptDir%\core\settings.ini, autostart, autostart_main
				FileDelete, %A_Startup%\A.G.N.O.S..lnk
			}
		else
			{
				Menu, options, Check, A.G.N.O.S. mit Windows starten
				IniWrite, true, %A_ScriptDir%\core\settings.ini, autostart, autostart_main
				FileCreateShortcut, %A_ScriptFullPath%, %A_Startup%\A.G.N.O.S..lnk, , , , %A_ScriptDir%\core\icons\ugold.ico
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
				FileCreateShortcut, %A_ScriptDir%\ps4000\datsidoku\datsidoku.ahk, %A_Startup%\datsidoku.lnk, , , , %A_ScriptDir%\ps4000\datsidoku\icons\dblue.ico
			}
	return

sautohotstringgen:
	IniRead, vautohotstringgen, %A_ScriptDir%\core\settings.ini, autostart, autostart_hotstringgen
		if vautohotstringgen = true
			{
				Menu, options, UnCheck, Autovervollständigung mit Windows starten
				IniWrite, false, %A_ScriptDir%\core\settings.ini, autostart, autostart_hotstringgen
				FileDelete, %A_Startup%\hotstringgen.lnk
			}
		else
			{
				Menu, options, Check, Autovervollständigung mit Windows starten
				IniWrite, true, %A_ScriptDir%\core\settings.ini, autostart, autostart_hotstringgen
				FileCreateShortcut, %A_ScriptDir%\core\hotstringgen\hotstringgen.ahk, %A_Startup%\hotstringgen.lnk, , , , %A_ScriptDir%\core\hotstringgen\icons\ablue.ico
			}
	return


sDatSiDoku:
	Run, %A_ScriptDir%\ps4000\datsidoku\datsidoku.ahk
	return

sRunhotstringgen:
	Run, %A_ScriptDir%\core\hotstringgen\hotstringgen.ahk
	return

sRunremote:
	Run, %A_ScriptDir%\neutrino\remote\remote.ahk
	return

sRunEPDP:
	Run, %A_ScriptDir%\neutrino\ep-dp_zaehler\ep-dp_zaehler.ahk
	return

gAbout:
	Gui, 99:Destroy
	Gui, 99:Add, Text, ,Automated Gadgets for Noobs Office Suite
	Gui, 99:Add, Text, ,Version V1.2, 2019-11-13
	Gui, 99:Add, Text, ,© Tonk Omnom
	Gui, 99:Add, Text, cblue gGitlink, https://github.com/tonkomnom
	Gui, 99:Add, Text,
	Gui, 99: -MinimizeBox
	Gui, 99:Show, AutoSize, Info
	return

	Gitlink:
		Run, https://github.com/tonkomnom
		return

sHelp:
	Run, %A_ScriptDir%\liesmich.txt
	return

sHelponline:
	Run, https://github.com/tonkomnom/AGNOS
	return

sExit:
	ExitApp
	return

;hotkeys
$F12::
	Suspend, Permit
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

	^!a::
	;Ctrl+Alt+a - refresh datapoint texts
		SendInput, {AltDown}ds{AltUp}
		Sleep, 300
		SendInput, {AltDown}xa{AltUp}
		SendInput, a
		Sleep, 300
		SendInput, {Space}
		SendInput, {Tab 21}
		SendInput, {Enter}
		Sleep, 300
		SendInput, {Tab}
		SendInput, {Enter}
		Sleep, 300
		SendInput, {Tab}
		SendInput, {Enter}
		Sleep, 300
		SendInput, {AltDown}ds{AltUp}
		Sleep, 300
		SendInput, {AltDown}d1{AltUp}
		return

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
					Keywait, F2
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

	$F3::
		KeyWait, F3, T0.5
			if ErrorLevel
				{
					;long - F3
					SendInput, {F3}
					return
				}
			else
				{
					;short - F3
					KeyWait, F3, D T0.2
						if ErrorLevel
							SendInput, {F3}
						else
							{
									;double - open datapoint attributes
									SendInput, {F2}
									Sleep, 50
									SendInput, {Tab}
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