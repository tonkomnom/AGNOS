# A.G.N.O.S.
**A**utomated **G**adgets for **N**oobs **O**ffice **S**uite

[Download V1.3](https://github.com/tonkomnom/AGNOS/archive/V1.3.zip)

## Inhaltsverzeichnis
[Tastaturkürzel](https://github.com/tonkomnom/AGNOS#tastaturk%C3%BCrzel)</br>
[Datensicherungs-Dokumentation](https://github.com/tonkomnom/AGNOS#ps4000-datensicherungs-dokumentation-datsidoku)</br>
[Einblendpunkt-/Datenpunktzähler](https://github.com/tonkomnom/AGNOS#einblendpunkt-datenpunktz%C3%A4hler)</br>
[Neutrino GLT Fernbedienung](https://github.com/tonkomnom/AGNOS#neutrino-glt-fernbedienung)</br>
[Autovervollständing](https://github.com/tonkomnom/AGNOS#autovervollst%C3%A4ndigung)

## Vorwort
Dies ist eine Sammlung von scripts und Programmen um diverse Arbeitsabläufe zu erleichtern und/oder beschleunigen. Ich teste alles auf richtige Funktion und Fehlerfreiheit, kann und werde dies aber nie garantieren. Viele Funktionen hängen zum Teil maßgeblich von der Geschwindigkeit der Rechner und Systeme ab. Ich versuche dies immer zu berücksichtigen, was aber natürlich nicht immer klappen kann.

Ich übernehme somit **keinerlei** Verantwortung für Schäden jeglicher Art die durch die Benutzung entstehen! Ich stehe jedoch (fast) jederzeit für Fragen, Fehlerbeseitigung und Hilfe zur Verfügung.

Ich bin jederzeit für feedback, Vorschläge und Wünsche offen. Jeglicher code den ich geschrieben habe kann unter [GNU GPL V3](https://www.gnu.org/licenses/gpl-3.0.en.html), [Autohotkey](https://autohotkey.com/) selbst unter [GNU GPL V2](https://www.gnu.org/licenses/gpl-2.0.html) genutzt werden.

Erreichbar bin ich telefonisch (4128), per Email, oder über Microsoft Teams - private Email Adresse sieht man nach Anmeldung auf GitHub [hier](https://github.com/tonkomnom "Tonk's GitHub Profil"), alternative Kontaktdaten gebe ich auf Anfrage heraus.

## Allgemein
Über das Rechtsklickmenü in der Schnellstartleiste lassen sich die PS4000 Datensicherungs-Doku, die Autovervollständigung, die Neutrino GLT Fernbedienung und der Einblendpunkt/Datenpunkt-Zähler starten.</br>
![](https://i.imgur.com/pDZA7ET.png "Rechtsklickmenü")

### Installation
Zum Installieren von A.G.N.O.S. einfach nur die heruntergeladene \*.zip Datei am gewünschten Ort entpacken und "setup.exe" ausführen. Autohotkey wird mehr oder weniger automatisch mit installiert.

### Autostart
Das Hauptscript, die PS4000 Datensicherungs-Doku und die Autovervollständigung können alle automatisch mit Windows gestartet werden. Dies lässt sich per Rechtsklick in der Schnellstartleiste unter Optionen ändern.
![](https://i.imgur.com/SDpKuTu.png "Autostart")

## Tastaturkürzel
Die Tastaturkürzel und ihre Funktion sind immer nur im entsprechenden Programm aktiv. Leider kann ich zum Teil, gerade in PS4000 und der Neutrino GLT, nicht kontrollieren ob ein Befehl ausgeführt werden darf weil z.B. das richtige Fenster offen ist, also muss sich jeder sicher sein dass alle Bedingungen eines Kürzels erfüllt sind. Unter Optionen kann man bei Bedarf die Tastaturkürzel ein oder aus schalten.</br>
![](https://i.imgur.com/i4coHvu.png "Tastaturkürzel")

### Allgemein:
- F12 lang drücken (>=1s) = schließt im Notfall alle laufenden Autohotkey scripts. (Bedingung: keine)

### Neutrino GLT:
- Doppelklick auf F2 = Öffnet einen Einblendpunkt und die Einblendpunktauswahl. (Bedingung: Einblendpunkt ist ausgewählt)
- F2 "lang" drücken = Entfernt oder setzt das Häkchen bei Datenpunkttyp in der Datenpunktauswahl. (Bedingung: Datenpunktauswahl ist geöffnet)
- Windows-Taste + Tab = Schließt das Eingabefenster für Textblocks in "Bedienebene einrichten". (Bedingung: Eingabefenster eines Texblocks ist geöffnet)
- Strg + Alt + A = Startet 'Anlagebilder anpassen', aktualisiert Klartexte, sichert und lädt die Zeichnung neu. (Bedingung: Bedienebene Einrichten ist aktiv)
- Strg + Z = Rückgängig (Bedingung: Bedienebene Einrichten ist aktiv)
- Strg + S = Sichern (Bedingung: Bedienebene Einrichten ist aktiv)
- Shift + Recht/Links = Rotiert Auswahl nach rechts oder links. (Bedingung: Block ist ausgewählt)
- Strg + Pfeiltasten = Bewegt die Auswahl um zehn Schritte in die entsprechende Richtung. (Bedingung: Block ist ausgewählt)

### PS4000:
- Strg + k: Generiert ein Kommentar mit Info icon und blauem Hintergrund. (Bedingung: SPS-Reiter ist aktiv, Mauszeiger befindet sich auf SPS-Zeichnung)

### Tric:
- Windows-Taste + Esc = Schließt eine Tric Zeichnung und ruft die Zeichnugsverwaltung auf. (Bedingung: Tric Zeichnung ist geöffnet, wurde bearbeitet und ist noch nicht gespeichert)

## PS4000 Datensicherungs-Dokumentation (DatSiDoku)
Dieses Program dient dazu PS4000 Datensicherungen besser und einfacher zu dokumentieren und nachzuverfolgen. Das Programm startet entweder automatisch beim Starten einer Sicherung oder Wiederherstellung oder über das Rechtsklick Menü des Taskleistensymbols. Es legt entsprechend des Vorgangs eine Datei mit aktuellem Datum, Art des Vorgangs und Name des Nutzers ab. Diese Datei hat eine \*.ps5 Endung, ist somit auch in PS4000 sichtbar (im Gegensatz zu einer \*.txt Datei). Die Option "Ablage über Explorer" ermöglicht es die Datei für jemanden auszubuchen und deren Namen zu hinterlegen.

Leider ist es (im Moment) nicht möglich das Programm über Total Commander zu nutzen.

### Sicherung/Wiederherstellung über PS4000
- Sicherung oder Wiederherstellung starten -> Programm startet automatisch
- Zum Datensicherungsordner navigieren.
- Auswählen ob man mit dem Projekt fertig ist oder nur eine Zwischensicherung macht.
- Sichergehen dass der Ordner aktiv ist (Rahmen ist nicht grau).
- In der Benutzeroberfläche des Programms auf "Sichern" oder "Wiederherstellen" klicken.
- Sicherung wie gewohnt ablegen oder Wiederherstellung starten.

### Sicherung/Wiederherstellung über Windows Explorer
- Rechtsklick auf das blaue D in der Schnellstartleiste -> Ablage über Explorer
- Zum Datensicherungsordner navigieren.
- Auswählen ob man mit dem Projekt fertig ist oder nur eine Zwischensicherung macht.
- Sichergehen dass der Ordner aktiv ist (Rahmen ist nicht grau).
- In der Benutzeroberfläche des Programms auf "Sichern" oder "Wiederherstellen" klicken.
- Sicherung ablegen/entnehmen.

### Sicherung ausbuchen
- Rechtsklick auf das blaue D in der Schnellstartleiste -> Ablage über Explorer
- In der Benutzeroberfläche des Programms auf "Ausbuchen" klicken.
- Zum Datensicherungsordner navigieren und die Datei auswählen die verschickt werden soll.
- Name der Person an die die Sicherung verschickt/gegeben wird eintragen und bestätigen.
- Empfänger anpassen, im Moment wird noch nicht die volle Emailadresse automatisch eingetragen.

## Einblendpunkt-/Datenpunktzähler
Dieses Programm zählt anhand eines Stapesdrucks die Anzahl der Einblend- oder Datenpunkte einer Neutrino GLT.

### Vorgehensweise:
- In Bedienebene einrichten einen Stapeldruck inklusive aller Daten- bzw. Einblendpunkte erstellen.
- Die Datei an einem beliebigen Ort speichern.
- Das Programm starten und die Datei einlesen.

## Neutrino GLT Fernbedienung
Erzeugt/entfernt Trendkurven 1-fach, 5-fach und 10-fach. Setzt Störmeldung auf Störung = 0 oder Störung = 1 1-fach, 5-fach und 10-fach.

### Vorgehensweise:
- Zu trendende Werte und Störmeldungen in Parametrierung einfiltern.
- Größe der Schleife wählen
- Größe der Verzögerung wählen. Standard sind 500ms, was bei einer Einmandaten GLT in der Regel gut funktionieren sollte.
- Die erste Zeile in der Liste anwählen.
- Auf OK klicken.

Dieses script is extrem von der Geschwindigkeit der GLT abhängig - mit dem Schieberegler kann die Verzögerung zwischen den einzelnen Schritten verändert werden und ein Klick mit der linken Maustaste unterbricht im Notfall eine 5- oder 10-fach Schleife.

## Autovervollständigung
Dieses script ermöglicht es Wörtern oder Zeichenfolgen Abkürzungen zuzuweisen oder auch beliebte Rechtschreibfehler sofort zu korrigieren, z.B.:

- mfg = Mit freundlichen Grüßen
- rep. = Rep.-Schalter
- Analge = Anlage
- e@ = email@domain.de

Einige Autovervollständigungen sind schon voreingestellt.

### Vorgehensweise:
- Um das script zu starten falls es nicht automatisch mit Windows gestartet wird Rechtsklick auf A.G.N.O.S. in der Schnellstartleiste -> Autovervollständigung
- Das zu ersetzende Wort oder Zeichenfolge markieren und Strg + Alt + A drücken, die Abkürzung und eventuelle Bedingungen ([siehe Dokumentation](https://ahkde.github.io/docs/Hotstrings.htm)) eingeben und bestätigen</br>
![](https://i.imgur.com/f9FMJXd.png "Hotstrings")
- Jede Autovervollständigung kann ich Nachhinein noch geändert oder gelöscht werden. Dazu Rechtsklick auf das blaue A -> Editieren...
