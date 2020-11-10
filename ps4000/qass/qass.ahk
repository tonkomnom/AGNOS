#SingleInstance, force
#Persistent
SendMode Input
SetWorkingDir %A_ScriptDir%

SetBatchLines, -1
SetMouseDelay, -1, -1


I_Icon = %A_ScriptDir%\icons\qdg.ico

Menu, Tray, Tip, QaSS
Menu, Tray, NoStandard

Menu, Tray, Icon, %I_Icon%, ,1
Menu, Tray, Add, GUI, gui

Menu, Tray, Add, Stufentexte..., settings

Menu, Tray, Add, Neu laden, reload
Menu, Tray, Add, Beenden, exit

IniRead, textzero, %A_ScriptDir%\qass_settings.ini, texts, null
IniRead, textone, %A_ScriptDir%\qass_settings.ini, texts, eins

gui:
	Gui, 1:Destroy
	Gui, 1:+E0x08000000 +AlwaysOnTop
	Gui, 1:Add, ComboBox, vtextwert0, %textzero%
	Gui, 1:Add, ComboBox, vtextwert1, %textone%
	Gui, 1:Add, Button, x9 y60 h20 gsettings, Stufentexte
	Gui, 1:Add, Button, x80 y60 h20 w70 greload, Neu laden...
	Gui, 1:Add, Text, x9 w180 h2 +0x10
	Gui, 1:Add, ComboBox, x9 w200 vtextwert2, Auswählen...
	||1  - BMA, Einbruch
	|29 - BSK
	|29 - Frost
	|30 - Rauchmelder
	|32 - Lüfter
	|34 - Pumpen
	|121 - Wartung Rep.-Schalter
	|122 - Wartung Filter
	|120 - Handeingriff
	|------------------------------------
	|30 - Aufzug
	|30 - Gasalarm/Batterieraum
	|32 - Kessel/BHKW/Fernwärme
	|33 - Kälte EDV/Sibe
	|64 - Hebeanlage
	|64 - Kälte/RLT Prio A/B/C
	|65 - Adiabatik/Dampfbefeuchter
	|66 - Fremdgewerk
	|66 - Nachspeisung
	|66 - Schaltschrankmeldungen
	|92 - Raumqualität
	|93 - Taupunktwächter/Kondensatpumpen
	|94 - Laufüberwachung
	|122 - Wartung Fremdgewerk
	|123 - Wartung DDC
	Gui, 1:Add, Text, w180 h2 +0x10
	Gui, 1:Add, Text, x70, Schrittpause
	Gui, 1:Add, Slider, x40 Range0-100 TickInterval50 ToolTipTop vsleepdur, 50
	Gui, 1:Add, Button, x40 y220 h20 w120 gsmcreate, Störmeldung anlegen
	Gui, 1:Add, Button, x40 y240 h20 w120 gsminv, Störmeldung invertieren
	Gui, 1:Add, Button, x60 y270 h20 w70 gclose, Schließen
	Gui, 1:Show, x250 y350 NoActivate, QaSS
return

smcreate:
	Gui, 1:Submit, NoHide
	SendInput, {Tab 2}
	Sleep, %sleepdur%
	SendInput, {Right}
	Sleep, %sleepdur%
	SendInput, {Tab}
	Sleep, %sleepdur%
	SendInput, {Down 3}
	Sleep, %sleepdur%
	SendInput, {Right}
	Sleep, %sleepdur%
	SendInput, {Down}
	Sleep, %sleepdur%
	SendInput, {Tab 2}
	Sleep, %sleepdur%
	SendInput, {Tab 15}
	Sleep, %sleepdur%
	SendInput, {CtrlDown}a{CtrlUp}
	SendInput, %textwert0%
	Sleep, %sleepdur%
	SendInput, {Tab}
	Sleep, %sleepdur%
	SendInput, {CtrlDown}a{CtrlUp}
	SendInput, %textwert1%
	Sleep, %sleepdur%
	SendInput, {Tab 7}
	Sleep, %sleepdur%
	SendInput, {Right 4}
	Sleep, %sleepdur%
	SendInput, {Tab 6}
	Sleep, %sleepdur%
	SendInput, {CtrlDown}a{CtrlUp}
	SendInput, %textwert0%
	Sleep, %sleepdur%
	SendInput, {Tab}
	Sleep, %sleepdur%
	SendInput, {CtrlDown}a{CtrlUp}
	SendInput, %textwert1%
	Sleep, %sleepdur%
	SendInput, {Tab 3}
	Sleep, %sleepdur%
	SendInput, {Space}
	Sleep, %sleepdur%
	SendInput, {Tab 5}
	Sleep, %sleepdur%
	SendInput, {Right}
	Sleep, %sleepdur%
	SendInput, {Tab 15}
	Sleep, %sleepdur%
	SendInput, {CtrlDown}a{CtrlUp}
	SendInput, %textwert0%
	Sleep, %sleepdur%
	SendInput, {Tab}
	Sleep, %sleepdur%
	SendInput, {CtrlDown}a{CtrlUp}
	SendInput, %textwert1%
	Sleep, %sleepdur%
	SendInput, {Tab 2}
	Sleep, %sleepdur%
	SendInput % SubStr(textwert2, 1 , 3)
	Sleep, %sleepdur%
	SendInput, {Tab 4}
	Sleep, %sleepdur%
	SendInput, 254
	Sleep, %sleepdur%
	SendInput, {Tab 3}
	Sleep, %sleepdur%
	SendInput, {Left}
	Sleep, %sleepdur%

	haystack := "1  - BMA, Einbruch 30 - Aufzug 30 - Gasalarm/Batterieraum 29 - BSK" ;Gefahr
	needle = %textwert2%
	if InStr(haystack, needle)
	    SendInput, {Down}
	else
	   {
		   	haystack := "" ;Systemmeldungen
			needle = %textwert2%
			if InStr(Haystack, Needle)
			    SendInput, {Down 2}
			else
			    {
				   	haystack := "29 - Frost 32 - Kessel/BHKW/Fernwärme 32 - Lüfte 33 - Kälte EDV/Sibe 34 - Pumpen 64 - Hebeanlage 66 - Schaltschrankmeldungen" ;Störmeldungen Bereitschaft
					needle = %textwert2%
					if InStr(Haystack, Needle)
					    SendInput, {Down 3}
					else
					    {
						   	haystack := "64 - Kälte/RLT Prio A/B/C 65 - Adiabatik/Dampfbefeuchter 66 - Fremdgewerk 66 - Nachspeisung 92 - Raumqualität 93 - Taupunktwächter/Kondensatpumpen 94 - Laufüberwachung" ;Störmeldungen Betrieb
							needle = %textwert2%
							if InStr(Haystack, Needle)
							    SendInput, {Down 4}
							else
							    {
								   	haystack := "121 - Wartung Rep.-Schalter 122 - Wartung Filter 122 - Wartung Fremdgewerk 123 - Wartung DDC" ;Wartungsmeldungen
									needle = %textwert2%
									if InStr(Haystack, Needle)
									    SendInput, {Down 5}
									else
									    {
										   	haystack := "" ;Betriebsmeldungen
											needle = %textwert2%
											if InStr(Haystack, Needle)
											    SendInput, {Down 6}
											else
											    {
												   	haystack := "120 - Handeingriff" ;Schaltbefehle
													needle = %textwert2%
													if InStr(Haystack, Needle)
													    SendInput, {Down 7}
													else
													    {
														   	haystack := "" ;Grenzwertverletzungen
															needle = %textwert2%
															if InStr(Haystack, Needle)
															    SendInput, {Down 8}
															else
															    {
																   	haystack := "30 - Rauchmelder" ;Alarm
																	needle = %textwert2%
																	if InStr(Haystack, Needle)
																	    SendInput, {Down 9}
																	else
																	    MsgBox, , Fehler!, Es wurde keine Meldepriorität ausgewählt
																	    ,bitte Priorität und Meldegruppe händisch eintragen.
																	return
																}
														}
												}
										}
								}
						}
				}
		}
	return

sminv:
	SendInput, {Tab 8}
	Sleep, %sleepdur%
	SendInput, {Up}
	return

settings:
	Run, %A_ScriptDir%\qass_settings.ini
	return

close:
	Gui, 1:Destroy
	return

reload:
	Reload

exit:
	ExitApp