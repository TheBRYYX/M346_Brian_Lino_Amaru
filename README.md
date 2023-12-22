# Dokumentation

## Ablauf für Bildverkleinerung
- Zuerst sollte Amazon AWS installiert werden.
- Danach muss, bevor irgenein Programm ausgeführt wird, das Bild "image.jpg" in den upload Ordner gelegt werden. Das Bild muss genau image.jpg heissen und darf zur Zeit kein anderes Bildformat haben. Es sollte ebenfalls eine Gültige Bilddatei sein.
- Sobald das Bild hochgeladen wurde, muss man nur noch "programm.sh" ausgeführt werden, welches zuerst einige Tests ausführt und dann mit der konfiguration und der Bildverkleinerung beginnt.
- Das verkleinerte Bild sollte dann schlussendlich im download-Ordner zu finden sein, sowie im Download-bucket

## Tests
Wir haben auch einige Tests durchgeführt.
Bisher hält sich das Programm jedoch relativ gut, da es zu Beginn einige Test zur validierung der Bilddatei usw. ausführt.
Das Programm wirft auch jeweils Fehlermeldungen und bricht bei Fehlern automatisch ab.
### Beispiele für Tests:
- Ungültige Bilddatei hochladen: dieser Testfall wurde abgedeckt und es wird auf die Validität des Bildes getestet.
	- "image.jpg existiert, ist jedoch kein Bild. Bitte lade ein gültiges Bild hoch."
	- Durchgeführt von Lino am 20.12 um 13.32 Uhr
	- Fazit: Das Programm funktioniert genau so wie es sollte
- AWS nicht korrekt konfiguriert: dieser Testfall wurde ebefalls abgedeckt, jedoch kann ich mir vorstellen, dass es hier trotzdem noch fälle gibt in denen das zu dummen Fehlern ohne klare Fehlermeldung führt.
	- "AWS scheint nicht korrekt konfiguriert zu sein: 
		An error occurred (InvalidAccessKeyId) when calling the ListBuckets operation: The AWS Access Key Id you provided does not exist in our records."
		- Durchgeführt von Lino am 20.12 um 14.56 Uhr
		- Fazit: Hier kann nichts dagegen gemacht werden, da es ein User-Problem ist.
- Bild falsch benennen: in diesem Fall wird eine klare Fehlermeldung ausgegeben und das Programm abgebrochen.
	- "image.jpg existiert noch nicht. Bitte lade zuerst ein Bild hoch."
	- Durchgeführt von Lino am 20.12 um 15.40 Uhr
	- Fazit: Hier ist ein definitier Verbesserungsvorschlag, dass das Programm auch mit anderen Dateinamen funktioniert. 
- Falscher Datentyp des Bildes hochladen: Hier muss das Bild nur konvertiert werden. 
	- "image.(anderer Dateityp) existiert, ist jedoch kein .jpg File." 
	- Durchgeführt von Amaru am 20.12 um 22.04 Uhr
	- Fazit: Man könnte es schon implementieren, dass unser Programm funktioniert mit verschiedenen Dateitypen, jedoch ist dies extrem zeitaufwendig und meiner Meinung nach überflüssig
- Lambda-Funktion komprimiert das Bild nicht
	- Die Lambda Funktion wurde nicht richtig umgesetzt und in das Programm eingebunden, weswegen man nichts testen kann hier
	- Durchgeführt von Amaru am 22.12 um 23.21
	- Fazit: Zu wenig Zeit investiert von mir (Amaru)

## Allgemeiner Ablauf vom Programm
Zuerst wird getestet ob AWS konfiguriert ist. Wenn nicht, wirft das Programm eine Fehlermeldung und wird abgebrochen.
Danach wird das Bild getestet auf sein Name und die Validität.
Dann werden die Bucket-Names generiert und kurz darauf erstellt.
Das Bild wird dann hochgeladen.
+++++++++++ Nicht implementierter Teil +++++++++++
Die Lambda-Funktion wird erstellt.
Die Lambda Funktion komprimiert das Bild.
Das komprimierte Bild wird in dem nächsten Bucket gespeichert.
Das komprimierte Bild wird in dem Download-Ordner gespeichert.
+++++++++++ Nicht implementierter Teil +++++++++++
Ende des Programmes

## Reflexion
Das Projekt war sehr anspruchsvoll.
Mir (Lino) fiel es schwer, die Zusammenhänge zu verstehen. Die Arbeitsteilung war bei uns nicht gut umgesetzt, da wir zu sehr unterschiedlichen Zeiten am Projekt gearbeitet haben. Die Umsetzung des Projektes hätten wir definitiv besser machen können, indem wir gemeinsam alles zusammen gemacht hätten, statt zu sagen wer was macht und sich dann aufeinander zu verlassen, dass dies dann auch gemacht wird. Ich bin jedoch froh, dass ich meinen Teil der Projektarbeit gut und ohne allzu grossen Widerstand umsetzen konnte. Dies hat mir nochmals geholfen, Bash besser umzusetzen und die Cloudumgebung besser zu verstehen und wie man diese produktiv einsetzen kann. 

Ich (Amaru) habe ehrlich gesagt das gesamte Projekt massiv unterschätzt und deswegen viel zu wenig Zeit investiert, was sich auch an meinem Teil der Projektarbeit (Lambda-Funktion) zeigt, da hier wirklich sehr wenig funktioniert. Lino hat seinen Teil der Projektarbeit umgesetzt und es funktioniert auch, jedoch funktioniert der Teil von Brian und mir gar nicht, da wir wie schon gesagt das Projekt unterschätzt haben und deswegen zu wenig Zeit eingerechnet haben. Ich finde dieses Projekt allgemein sehr anspruchsvoll, auch wenn ich mehr Zeit investiert hätte, hätte ich dieses Projekt meiner Meinung nach nicht umsetzen können, da mir das nötige Wissen dazu fehlt, solche Lambda Funktionen zu schreiben und diese dann zu triggern, wenn eine Datei in ein S3 Bucket hochgeladen wird. Kurz gesagt hatte ich die gleichen Probleme wie Lino mit dem Unterschied, dass das Problem des Verstehens bei mir viel ausgeprägter war. Ich verstehe aktuell rimmer noch nicht, wie genau der gesamte Prozess des Lambda-Ausdruckes ablaufen soll, also welche Aufgaben nacheinander ausgeführt werden und wie ich diesen Ablauf implementieren könnte. Ich habe allgemein versagt in der Informationsbeschaffung und Zeitplanung. Jedoch muss ich sagen dass ich jetzt allgemein die Lambda Funktionen und die Cloud allgemein besser verstehe wie am Anfang des Projektes. Es reichte nicht für die Umsetzung, aber es reicht für fachlich anspruchsvolle Konversationen in diesem Themenbereich. 

Ich (Brian) habe rückblickend viel gemeinsam mit Amaru's Reflexion. Ich finde auch, dass ich das Projekt ziemlich unterschätzt habe und habe deswegen zusammen mit Amaru zu wenig Zeit investiert. Ich finde, genauso wie Amaru, dass die Projektarbeit extrem anspruchsvoll war. 