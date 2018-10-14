#SingleInstance, force

I_Icon = %A_ScriptDir%\icons\ablue.ico
Menu, Tray, NoStandard
Menu, Tray, Icon, %I_Icon%
Menu, Tray, Tip, Autovervollständigung

Menu, Tray, Add, Beenden, sExit
return

sExit:
	ExitApp

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


