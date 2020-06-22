#SingleInstance, force

;there is a reason for this syntax, don't judge.
if !FileExist("C:\Program Files\AutoHotkey")
	{
		MsgBox, 64, A.G.N.O.S. Setup,
(
Willkommen bei der Installation von A.G.N.O.S.!

Autohotkey wurde noch nicht installiert, bitte folgende Schritte durchführen:

1.) Bitte AutoHotkey (www.autohotkey.com) runterladen und per Appinstall installieren.
2.) Setup erneut ausführen
)
	IfMsgBox, Ok
		{
			ExitApp
		}
	}
else
	MsgBox, 65, A.G.N.O.S. Setup,
(
Willkommen bei der Installation von A.G.N.O.S.!

Autohotkey ist schon installiert, es werden nur Autostart Einträge und eine Desktop Verknüpfung angelegt und das Programm gestartet
)
	IfMsgBox, Cancel
		{
			ExitApp
		}
	FileCreateShortcut, %A_ScriptDir%\main.ahk, %A_Startup%\A.G.N.O.S..lnk, , , , %A_ScriptDir%\core\icons\agold.ico
	FileCreateShortcut, %A_ScriptDir%\ps4000\datsidoku\datsidoku.ahk, %A_Startup%\datsidoku.lnk, , , , %A_ScriptDir%\ps4000\datsidoku\icons\dblue.ico
	FileCreateShortcut, %A_ScriptDir%\main.ahk, %A_Desktop%\A.G.N.O.S..lnk , , , , %A_ScriptDir%\core\icons\ampersand.ico
	Run, %A_ScriptDir%\main.ahk
	Run, %A_ScriptDir%\ps4000\datsidoku\datsidoku.ahk