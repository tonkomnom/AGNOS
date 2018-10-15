# A.G.N.O.S.
**A**utomated **G**adgets for **N**oobs **O**ffice **S**uite

## Vorwort
Dies ist eine Sammlung von scripts und Programmen um diverse Arbeitsabläufe zu erleichtern und/oder beschleunigen. Ich teste alles auf richtige Funktion und Fehlerfreiheit, kann und werde dies aber nie garantieren. Viele Funktionen hängen zum Teil maßgeblich von der Geschwindigkeit der Rechner und Systeme ab. Ich versuche dies immer zu berücksichtigen, was aber natürlich nicht immer klappen kann.

Ich übernehme somit **keinerlei** Verantwortung für Schäden jeglicher Art die durch die Benutzung entstehen! Ich stehe jedoch (fast) jederzeit für Fragen, Fehlerbeseitigung und Hilfe zur Verfügung.

Die Installation von [Autohotkey](https://autohotkey.com/ ) nicht nötig, ein paar Funktionen werden aber erst dadurch verfügbar.

Ich bin jederzeit für feedback, Vorschläge und Wünsche offen. Jeglicher code den ich geschrieben habe kann unter [GNU GPL V3](https://www.gnu.org/licenses/gpl-3.0.en.html), [Autohotkey](https://autohotkey.com/) selbst unter [GNU GPL V2](https://www.gnu.org/licenses/gpl-2.0.html) genutzt werden.

Erreichbar bin ich telefonisch, per Email, oder über Microsoft Teams - Email Adresse sieht man nach Anmeldung auf GitHub [hier](https://github.com/tonkomnom "Tonk's GitHub Profil"), alternative Kontaktdaten gebe ich auf Anfrage heraus.

## Allgemein
Über das [Rechtsklickmenü in der Schnellstartleiste](https://i.imgur.com/pDZA7ET.png) lassen sich die PS4000 Datensicherungs-Doku, die Autovervollständigung, die Neutrino GLT Fernbedienung und der Einblendpunkt/Datenpunkt-Zähler starten.
Unter Optionen kann man bei Bedarf die [Tastaturkürzeln ein und aus](https://i.imgur.com/i4coHvu.png) schalten.

### Installation
Download-Link folgt in Kürze. Zum Installieren einfach nur die heruntergeladene \*.exe ausführen.

### Autostart
Das Hauptscript, die PS4000 Datensicherungs-Doku und die Autovervollständigung können alle automatisch mit Windows gestartet werden. Dies lässt sich per [Rechtsklick in der Schnellstartleiste unter Optionen](https://i.imgur.com/SDpKuTu.png) ändern.

## Tastaturkürzel
Die Tastaturkürzel und ihre Funktion sind immer nur im entsprechenden Programm aktiv. Leider kann ich zum Teil, gerade in PS4000 und der Neutrino GLT, nicht kontrollieren ob ein Befehl ausgeführt werden darf weil z.B. das richtige Fenster offen ist, also muss sich jeder sicher sein dass alle Bedingungen eines Kürzels erfüllt sind.
### Allgemein:
- F12 lang drücken (>=1s) = schließt im Notfall alle laufenden Autohotkey scripts. (Bedingung: keine)

### Neutrino GLT:
- Doppelklick auf F2 = Öffnet einen Einblendpunkt und die Einblendpunktauswahl. (Bedingung: Einblendpunkt ist ausgewählt)
- F2 "lang" drücken = Entfernt oder setzt das Häkchen bei Datenpunkttyp in der Datenpunktauswahl. (Bedingung: Datenpunktauswahl ist geöffnet)
- Windows-Taste + Tab = Schließt das Eingabefenster für Textblocks in "Bedienebene einrichten". (Bedingung: Eingabefenster eines Texblocks ist geöffnet)
- Strg + Z = Rückgängig (Bedingung: Bedienebene Einrichten ist aktiv)
- Strg + S = Sichern (Bedingung: Bedienebene Einrichten ist aktiv)
- Shift + Recht/Links = Rotiert Auswahl nach rechts oder links. (Bedingung: Block ist ausgewählt)
- Strg + Pfeiltasten = Bewegt die Auswahl um zehn Schritte in die entsprechende Richtung. (Bedingung: Block ist ausgewählt)

### PS4000:
- Alt + k: Generiert ein Kommentar mit Info icon und blauem Hintergrund. (Bedingung: SPS-Reiter ist aktiv, Mauszeiger befindet sich auf SPS-Zeichnung)

### Tric:
- Windows-Taste + Esc = Schließt eine Tric Zeichnung und ruft die Zeichnugsverwaltung auf. (Bedingung: Tric Zeichnung ist geöffnet, wurde bearbeitet und ist noch nicht gespeichert)

## PS4000 Datensicherungs-Dokumentation (DatSiDoku)
Dieses Program dient dazu PS4000 Datensicherungen besser und einfacher zu dokumentieren und nachzuverfolgen. Das Programm startet entweder automatisch beim Starten einer Sicherung oder Wiederherstellung oder über das Rechtsklick Menü des Taskleistensymbols. Es legt entsprechend des Vorgangs eine Datei mit aktuellem Datum, Art des Vorgangs und Name des Nutzers ab. Diese Datei hat eine \*.ps5 Endung, ist somit auch in PS4000 sichtbar (im Gegensatz zu einer \*.txt Datei). Die Option "Ablage über Explorer" ermöglicht es die Datei für jemanden auszubuchen und deren Namen zu hinterlegen.

Leider ist es (im Moment) nicht möglich das Programm über Total Commander zu nutzen.

### Sicherung/Wiederherstellung über PS4000
- Sicherung oder Wiederherstellung starten -> Programm startet automatisch
- Zum Datensicherungsordner navigieren
- Auswählen ob man mit dem Projekt fertig ist oder nur eine Zwischensicherung macht.
- Sichergehen dass der Ordner aktiv ist (Rahmen ist nicht grau)
- In der Benutzeroberfläche des Programms auf "Sichern" oder "Wiederherstellen" klicken
- Sicherung wie gewohnt ablegen oder Wiederherstellung starten

### Sicherung/Wiederherstellung über Windows Explorer
- Rechtsklick auf das blaue D in der Schnellstartleiste -> Ablage über Explorer
- Zum Datensicherungsordner navigieren
- Auswählen ob man mit dem Projekt fertig ist oder nur eine Zwischensicherung macht.
- Sichergehen dass der Ordner aktiv ist (Rahmen ist nicht grau)
- In der Benutzeroberfläche des Programms auf "Sichern" oder "Wiederherstellen" klicken
- Sicherung ablegen/entnehmen

### Sicherung ausbuchen
- Rechtsklick auf das blaue D in der Schnellstartleiste -> Ablage über Explorer
- In der Benutzeroberfläche des Programms auf "Ausbuchen" klicken
- Zum Datensicherungsordner navigieren und die Datei auswählen die verschickt werden soll
- Name der Person an die die Sicherung verschickt/gegeben wird eintragen und bestätigen
- Empfänger anpassen, im Moment wird noch nicht die volle Emailadresse automatisch eingetragen

## Einblendpunkt-/Datenpunktzähler
Dieses Programm zählt anhand eines Stapesdrucks die Anzahl der Einblend- oder Datenpunkte einer Neutrino GLT.

### Vorgehensweise:
- In Bedienebene einrichten einen Stapeldruck inklusive aller Daten- bzw. Einblendpunkte erstellen.
- Die Datei an einem beliebigen Ort speichern.
- Das Programm starten und die Datei einlesen.

## GLT Fernbedienung
Erzeugt/entfernt Trendkurven 1-fach, 5-fach und 10-fach. Setzt Störmeldung auf Störung = 0 oder Störung = 1 1-fach, 5-fach und 10-fach.

## Autovervollständigung
Dieses script ist nur nach Installation von Autohotkey verfügbar.
