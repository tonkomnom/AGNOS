#SingleInstance, force

;there is a reason for this syntax, don't judge.
RegRead, dir, HKLM, SOFTWARE\AutoHotkey, InstallDir
	if (dir = "")
		{
			MsgBox, 65, A.G.N.O.S. Setup,
(
Willkommen bei der Installation von A.G.N.O.S.!

1.) Drücken Sie OK um eine fertige Email an appinstall zu öffnen.
2.) Senden Sie die Email ab und kopieren Sie das erhaltenen Passwort in die Zwischenablage.
3.) Wenn dies innerhalb zwei Minuten geschieht öffnet sich die appinstall Eingabemaske -> Daten eingeben.
4.) Den Anweisungen der Autohotkey Installation folgen.
5.) Nach Beendigung starten A.G.N.O.S. und die DatSiDoku automatisch und legen Autostart Einträge und eine Desktopverknüpfung an.
)
			IfMsgBox, Cancel
				{
					ExitApp
				}
			Run, "C:\Program Files\Microsoft Office 15\root\office15\OUTLOOK.EXE" /c ipm.note /m appinstall&subject=softwareinstallation
			Clipboard := ""
			ClipWait, 120, 1
				if ErrorLevel
					{
						MsgBox, 16, Fehler, Es konnte keine Eingabe in die Zwischenablage festgestellt werden.
						ExitApp
					}
			RunWait, %A_ScriptDir%\core\AutoHotkey_1.1.30.00_setup.exe
			RegRead, dir, HKLM, SOFTWARE\AutoHotkey, InstallDir
				if (dir = "")
					MsgBox, 16, Fehler, Autohotkey wurde nicht richtig installiert, bitte starten Sie die Installation erneut.
						IfMsgBox, Ok
							{
								ExitApp
							}
				else
					FileCreateShortcut, %A_ScriptDir%\main.ahk, %A_Startup%\A.G.N.O.S..lnk, , , , %A_ScriptDir%\core\icons\ugold.ico
					FileCreateShortcut, %A_ScriptDir%\ps4000\datsidoku\datsidoku.ahk, %A_Startup%\datsidoku.lnk, , , , %A_ScriptDir%\ps4000\datsidoku\icons\dblue.ico
					FileCreateShortcut, %A_ScriptDir%\main.ahk, %A_Desktop%\A.G.N.O.S..lnk , , , , %A_ScriptDir%\core\icons\ampersand.ico
					Run, %A_ScriptDir%\main.ahk
					Run, %A_ScriptDir%\ps4000\datsidoku\datsidoku.ahk
		}
	else
		MsgBox, 65, A.G.N.O.S. Setup,
(
Willkommen bei der Installation von A.G.N.O.S.!

Autohotkey wurde scheinbar schon installiert, es werden nur Autostart Einträge und eine Desktop Verknüpfung angelegt und das Programm gestartet
)
		IfMsgBox, Cancel
			{
				ExitApp
			}
		FileCreateShortcut, %A_ScriptDir%\main.ahk, %A_Startup%\A.G.N.O.S..lnk, , , , %A_ScriptDir%\core\icons\ugold.ico
		FileCreateShortcut, %A_ScriptDir%\ps4000\datsidoku\datsidoku.ahk, %A_Startup%\datsidoku.lnk, , , , %A_ScriptDir%\ps4000\datsidoku\icons\dblue.ico
		FileCreateShortcut, %A_ScriptDir%\main.ahk, %A_Desktop%\A.G.N.O.S..lnk , , , , %A_ScriptDir%\core\icons\ampersand.ico
		Run, %A_ScriptDir%\main.ahk
		Run, %A_ScriptDir%\ps4000\datsidoku\datsidoku.ahk