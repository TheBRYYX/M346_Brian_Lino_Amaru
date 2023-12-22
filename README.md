# Dokumentation

## Ablauf für Bildverkleinerung
- Zuerst sollte Amazon AWS installiert werden.
- Danach muss bevor irgenein Programm ausgeführt wird, das Bild "image.jpg" in den upload Ordner gelegt werden. Das Bild muss genau image.jpg heissen und darf zur Zeit kein anderes Bildformat haben. Es sollte ebenfalls eine Gültige Bilddatei sein.
- Sobald das Bild hochgeladen wurde, muss man nur noch "programm.sh" ausgeführt werden, welches zuerst einige Tests ausführt und dann mit der konfiguration und der Bildverkleinerung beginnt.
- Das verkleinerte Bild sollte dann schlussendlich im download-Ordner zu finden sein, sowie im Download-bucket

## Tests
Wir haben auch einige Tests durchgeführt.
Bisher hält sich das Programm jedoch relativ gut, da es zu beginn einige Test zur validierung der Bilddatei usw. ausführt.
Das Programm wirft auch jeweils Fehlermeldungen und bricht bei Fehlern automatisch ab.
### Beispiele für Tests:
- Ungültige Bilddatei hochladen: dieser Testfall wurde abgedeckt und es wird auf die Validität des Bildes getestet.
	- "image.jpg existiert, ist jedoch kein Bild. Bitte lade ein gültiges Bild hoch."
- AWS nicht korrekt konfiguriert: dieser Testfall wurde ebefalls abgedeckt, jedoch kann ich mir vorstellen, dass es hier trotzdem noch fälle gibt in denen das zu dummen Fehlern ohne klare Fehlermeldung führt.
	- "AWS scheint nicht korrekt konfiguriert zu sein: 
		An error occurred (InvalidAccessKeyId) when calling the ListBuckets operation: The AWS Access Key Id you provided does not exist in our records."
- Bild falsch benennen: in diesem Fall wird eine klare Fehlermeldung ausgegeben und das Programm abgebrochen.
	- "image.jpg existiert noch nicht. Bitte lade zuerst ein Bild hoch."
To be continued...
nomol 2 testfäll teste und responses ine packe über lamda, eifach probiere kaputt mache und denn erkläre wa passiert isch

## Allgemeiner Ablauf vom Programm
Zuerst wird getestet ob AWS konfiguriert ist. Wenn nicht, wirft das Programm eine Fehlermeldung und wird abgebrochen.
Danach wird das Bild getestet auf sein Name und die Validität.
Dann werden die Bucket-Names generiert und kurz darauf erstellt.
Das Bild wird dann hochgeladen.

To be continued...
Schrib eif din shit do ine

## Reflexion
Das Projekt war sehr anspruchsvoll.
Mir viel es schwer die Zusammenhänge zu verstehen. Die Arbeitsteilung ging bei uns nicht sehr gut, da wir an sehr unterschiedlichen Zeiten am Projekt gearbeitet haben.
To be continued...
### Arbeitsteilung
Von Beginn an, haben wir die Arbeit so aufgeteilt, dass Lino Zubler sich um die S3 Container und die Grundstruktur der Bash-Skripts kümmert und Amaru Eugster und Brian Furlan sich um die Erstellung und Programmierung der Lambda Funktion kümmern.
