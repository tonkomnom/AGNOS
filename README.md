# A.G.N.O.S.
**A**utomated **G**adgets for **N**oobs **O**ffice **S**uite

## Vorwort
Dies ist eine Sammlung von scripts und Programmen um diverse Arbeitsabläufe zu erleichtern und/oder beschleunigen. Ich teste alles auf richtige Funktion und Fehlerfreiheit, kann und werde dies aber nie garantieren. Viele Funktionen hängen zum Teil maßgeblich von der Geschwindigkeit der Rechner und Systeme ab. Ich versuche dies immer zu berücksichtigen, was aber natürlich nicht immer klappen kann.

Ich übernehme somit **keinerlei** Verantwortung für Schäden jeglicher Art die durch die Benutzung entstehen! Ich stehe jedoch (fast) jederzeit für Fragen, Fehlerbeseitigung und Hilfe zur Verfügung.

Die Installation von [Autohotkey](https://autohotkey.com/ ) nicht nötig, ein paar Funktionen werden aber erst dadurch verfügbar.

Ich bin jederzeit für feedback, Vorschläge und Wünsche offen. Jeglicher code den ich geschrieben habe kann unter [GNU GPL V3](https://www.gnu.org/licenses/gpl-3.0.en.html), [Autohotkey](https://autohotkey.com/) selbst unter [GNU GPL V2](https://www.gnu.org/licenses/gpl-2.0.html) genutzt werden.

Erreichbar bin ich telefonisch, per Email, oder über Microsoft Teams - Email Adresse sieht man nach Anmeldung auf GitHub [hier](https://github.com/tonkomnom "Tonk's GitHub Profil"), alternative Kontaktdaten gebe ich auf Anfrage heraus.


## PS4000 Datensicherungs-Dokumentation (DatSiDoku)
Dieses Program dient dazu PS4000 Datensicherungen besser und einfacher zu dokumentieren und nachzuverfolgen. Beim erstmaligen starten wird ein Autostart Eintrag angelegt, es muss somit nur ein einziges Mal die \*.exe ausgeführt werden. Das Programm startet entweder automatisch beim Starten einer Sicherung oder Wiederherstellung oder über das Rechtsklick Menü des Taskleistensymbols. Es legt entsprechend des Vorgangs eine Datei mit aktuellem Datum, Art des Vorgangs und Name des Nutzers ab. Diese Datei hat eine \*.ps5 Endung, ist somit auch in PS4000 sichtbar (im Gegensatz zu einer \*.txt Datei). Die Option "Ablage über Explorer" ermöglicht es die Datei für jemanden auszubuchen und deren Namen zu hinterlegen.

Leider ist es (im Moment) nicht möglich das Programm über Total Commander zu nutzen.

### Sicherung/Wiederherstellung über PS4000
- Sicherung oder Wiederherstellung starten -> Programm startet automatisch
- Zum Datensicherungsordner navigieren
- Sichergehen dass der Ordner aktiv ist (Rahmen ist nicht grau)
- In der Benutzeroberfläche des Programms auf "Sichern" oder "Wiederherstellen" klicken
- Sicherung wie gewohnt ablegen oder Wiederherstellung starten

### Sicherung/Wiederherstellung über Windows Explorer
- Zum Datensicherungsordner navigieren
- Rechtsklick auf das Taskleistensymbol (blaues D) -> Ablage über Explorer
- Sichergehen dass der Ordner aktiv ist (Rahmen ist nicht grau)
- In der Benutzeroberfläche des Programms auf "Sichern" oder "Wiederherstellen" klicken
- Sicherung ablegen/entnehmen

### Sicherung ausbuchen
- Zum Datensicherungsordner navigieren
- Rechtsklick auf das Taskleistensymbol (blaues D) -> Ablage über Explorer
- Sichergehen dass der Ordner aktiv ist (Rahmen ist nicht grau)
- In der Benutzeroberfläche des Programms auf "Ausbuchen" klicken
- Name der Person an die die Sicherung verschickt/gegeben wird eintragen und bestätigen
- Sicherung entnehmen

## Einblendpunkt-/Datenpunktzähler
Dieses Programm zählt anhand eines Stapesdrucks die Anzahl der Einblend- oder Datenpunkte einer GLT.

### Vorgehensweise:
- In Bedienebene einrichten einen Stapeldruck inklusive aller Daten- bzw. Einblendpunkte erstellen.
- Die Datei an einem beliebigen Ort speichern.
- Das Programm starten und die Datei einlesen.

## GLT Fernbedienung
Erzeugt/entfernt Trendkurven 1-fach, 5-fach und 10-fach. Setzt Störmeldung auf Störung = 0 oder Störung = 1 1-fach, 5-fach und 10-fach.
