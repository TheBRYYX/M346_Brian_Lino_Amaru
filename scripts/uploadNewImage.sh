#!/bin/bash

# Einzigartiger Name für jeden Bucket
name_upload=$1

# Pfad zur Datei
bildpfad="$(dirname $0)/../upload/image.jpg"

# Bild hochladen
aws s3 cp $bildpfad s3://$name_upload >> $(dirname $0)/log.txt

# Überprüfe ob der Bucket erstellt wurde
response=$(aws s3 ls s3://$name_upload 2>&1)

if [[ $response == *"image.jpg"* ]]; then
	echo "Das Bild wurde erfolgreich hochgeladen."
else
	echo "Das Bild konnte nicht hochgeladen werden, schau doch mal im log.txt"
	exit 1
fi
