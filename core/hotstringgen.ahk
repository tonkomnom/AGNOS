#SingleInstance, force

I_Icon = %A_ScriptDir%\icons\ablue.ico
Menu, Tray, NoStandard
Menu, Tray, Icon, %I_Icon%, , 1
Menu, Tray, Tip, Autovervollständigung

Menu, Tray, Add, Hilfe..., sHelp
Menu, Tray, Add

Menu, Tray, Add, Editieren..., sEdit
Menu, Tray, Add, Anhalten, sPause
Menu, Tray, Add, Beenden, sExit
return

sHelp:
	Run, https://ahkde.github.io/docs/Hotstrings.htm
	return

sEdit:
	Edit
	return

sPause:
	Menu, Tray, ToggleCheck, Anhalten
	Suspend, Toggle
	Pause, Toggle
	return

sExit:
	ExitApp

^!a::
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
	InputBox, Hotstring, Neue Autovervollständigung, Tippen Sie Ihre Abkürzung zwischen den 2. und 3. Doppelpunkt. Sie können auch den zu vervollständigen Text noch ändern.`n`nBeispiel: :*R:MfG`::Mit freundlichen Grüßen,,,,,,,, :*R:`::%Hotstring%
		if ErrorLevel
			return
	IfInString, Hotstring, :*R`:::
		{
			MsgBox, , Fehler,Sie haben keine Abkürzung eingegeben, es wurde keine Autovervollständigung angelegt.
			return
		}
	FileAppend, `n%Hotstring%, %A_ScriptFullPath%
	Reload
	Sleep 200
	MsgBox, 4, Fehler, Die Autovervollständigung wurde anscheinend nicht richtig formatiert.  Wollen Sie das script zum Bearbeiten öffnen (die fehlerhafte Autovervollständigung befindet sich an letzter Stelle)?.
	IfMsgBox, Yes
		Edit
		return

	MoveCaret:
	IfWinNotActive, New Hotstring
	    return
	Send {Home}{Right 4}
	SetTimer, MoveCaret, Off
	return

;Autovervollständigungen (bei Autohotkey hotstrings genannt)
;Format -> :Bedingung:Kürzel::zu ersetzender Text
;geschweifte Klammern sind dazu da um Befehle wie Enter, Leerzeichen oder Pfeiltasten zu senden
;mehrzeilige hotstrings lassen sich nicht über das Tastaturkürzel erzeugen
;Dokumentation zur Formatierung und Optionen von hotstrings unter https://ahkde.github.io/docs/Hotstrings.htm
:*:dddd::
	FormatTime, CurrentDate,, yyyy-MM-dd
	SendInput, %CurrentDate%
return
:*:zzzz::
	FormatTime, CurrentDateTime,, yyyy-MM-dd-HH-mm
	SendInput, %CurrentDateTime%
return
:*:e@::email@domain.de
:c*:KPG::Kieback&Peter GmbH & Co. KG
:*:mfg::Mit freundlichen Grüßen,{Enter 2}
:*:xxxx::Sehr geehrte Frau{Space},{Left}
:*:yyyy::Sehr geehrter Herr{Space},{Left}
:*:xxyy::Sehr geehrte Damen und Herren,{Enter 2} 
:*:rep.::Rep.-Schalter