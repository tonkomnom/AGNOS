#SingleInstance, force

I_Icon = %A_ScriptDir%\icons\zblue.ico
Menu, Tray, NoStandard
Menu, Tray, Icon, %I_Icon%
Menu, Tray, Tip, EP/DP Zähler

Menu, Tray, Add, Beenden, sExit

Gui, Show, w200 h200, EP/DP Zähler
Gui, Add, Button, x40 y5 h20 w120 gep, Einblendpunkte
Gui, Add, Button, x40 h20 w120 gdp, Datenpunkte
Gui, Add, Button, x65 y150 h20 w70 gexit, Schließen
return

ep:
	FileSelectFile, SelectedFile, , C:\Users\%A_UserName%\Desktop, GLT Stapeldruck auswählen, *.pdf
		if (SelectedFile = "")
			{
				MsgBox, , Fehler!,Sie haben keine Datei ausgewählt.
				return
			}
		FileCopy, %SelectedFile%, %A_ScriptDir%\temp_ep.pdf
	
		RunWait, %A_ScriptDir%\pdftotext.exe temp_ep.pdf
	
		FileRead haystack, temp_ep.txt
		needle := "(?<=Gesamtzahl aller Einblendpunkte: )\d+"
	
		output_ep := ""
		var_ep := 0
	
		Pos := 1
		while(Pos := RegExMatch(haystack, needle, M, Pos + StrLen(M)))
		output_ep .= M "`n"
	
		FileAppend, %output_ep%, %A_ScriptDir%\output_ep.txt
	
		Loop, Read, %A_ScriptDir%\output_ep.txt
		var_ep += A_LoopReadLine
	
		if var_ep > 0
			MsgBox, , EP,Gesamtzahl aller Einblendpunkte: %var_ep%
		else
			MsgBox, , Fehler!, Es konnten keine Einblendpunkte gefunden werden,`nvergewissern Sie sich dass Sie die richtige`nDatei ausgewählt hatten.

	
		FileDelete, %A_ScriptDir%\temp_ep.txt
		FileDelete, %A_ScriptDir%\temp_ep.pdf
		FileDelete, %A_ScriptDir%\output_ep.txt
	
	return

dp:
	FileSelectFile, SelectedFile, , C:\Users\%A_UserName%\Desktop, GLT Stapeldruck auswählen, *.pdf
		if (SelectedFile = "")
			{
				MsgBox, , Fehler!, Sie haben keine Datei ausgewählt.
				return
			}
		FileCopy, %SelectedFile%, %A_ScriptDir%\temp_dp.pdf
	
		RunWait, %A_ScriptDir%\pdftotext.exe temp_dp.pdf
	
		FileRead haystack, temp_dp.txt
		needle := "(?<=Gesamtzahl aller Informationspunkte: )\d+"
	
		output_dp := ""
		var_dp := 0
	
		Pos := 1
		while(Pos := RegExMatch(haystack, needle, M, Pos + StrLen(M)))
			output_dp .= M "`n"
	
		FileAppend, %output_dp%, %A_ScriptDir%\output_dp.txt
	
		Loop, Read, %A_ScriptDir%\output_dp.txt
		var_dp += A_LoopReadLine
	
		if var_dp > 0
			MsgBox, , EP,Gesamtzahl aller Informationspunkte: %var_dp%
		else
			MsgBox, , Fehler!, Es konnten keine Informationspunkte gefunden werden,`nvergewissern Sie sich dass Sie die richtige`nDatei ausgewählt hatten.
	
		FileDelete, %A_ScriptDir%\temp_dp.txt
		FileDelete, %A_ScriptDir%\temp_dp.pdf
		FileDelete, %A_ScriptDir%\output_dp.txt
	
	return

GuiClose:
	ExitApp

sExit:
	ExitApp

exit:
	Exitapp