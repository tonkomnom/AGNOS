MsgBox, 4, Deinstallation, Sind Sie sicher dass Sie A.G.N.O.S. deinstallieren möchten?
	IfMsgBox, No
		{
			ExitApp
		}
FileDelete, %A_Startup%\hotstringgen.lnk
FileDelete, %A_Startup%\A.G.N.O.S..lnk
FileDelete, %A_Startup%\datsidoku.lnk
FileDelete, %A_Desktop%\A.G.N.O.S..lnk
Run, explorer.exe %A_ScriptDir%
MsgBox, 4096, Deinstallation, Löschen Sie diesen Ordner bitte manuell.`
