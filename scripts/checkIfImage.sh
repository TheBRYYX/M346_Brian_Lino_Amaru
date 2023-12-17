#!/bin/bash

# Pfad zur Datei
bildpfad="$(dirname $0)/../upload/image.jpg"

# Überprüfen, ob die Datei existiert
if [ -e "$bildpfad" ]; then
	# Überprüfen, ob die Datei ein Bild ist
	dateityp=$(file -b --mime-type "$bildpfad" | cut -d '/' -f 1)

	if [ "$dateityp" == "image" ]; then
		echo "image.jpg existiert und ist ein Bild."
	else
		echo "image.jpg existiert, ist jedoch kein Bild. Bitte lade ein gültiges Bild hoch."
	fi
else
	echo "image.jpg existiert noch nicht. Bitte lade zuerst ein Bild hoch."
	exit 1
fi
