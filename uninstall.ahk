MsgBox, 1, Deinstallation, Sind Sie sicher dass Sie Erlkönig deinstallieren möchten?
	IfMsgBox, Yes
			FileDelete, %A_Startup%\main.lnk
			FileDelete, %A_Startup%\datsidoku.lnk
			FileDelete, %A_Desktop%\Erlkönig.lnk
			;FileRemoveDir, %A_ScriptDir%, 1