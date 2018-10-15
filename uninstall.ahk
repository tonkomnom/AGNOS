MsgBox, 4, Deinstallation, Sind Sie sicher dass Sie Erlkönig deinstallieren möchten?
	IfMsgBox, Yes
		FileDelete, %A_Startup%\hotstringgen.lnk
		FileDelete, %A_Startup%\main.lnk
		FileDelete, %A_Startup%\datsidoku.lnk
		FileDelete, %A_Desktop%\Erlkönig.lnk
		Run, explorer.exe %A_ScriptDir%
		MsgBox, 4096, Deinstallation, Löschen Sie diesen Ordner bitte manuell.`n%A_ScriptDir%

