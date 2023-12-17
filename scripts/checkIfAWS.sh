#!/bin/bash

# Führe den AWS S3 List-Befehl aus
response=$(aws s3 ls 2>&1)

# Überprüfe die Antwort auf Fehlermeldungen
if [[ $response == *"Unable to"* || $response == *"Error"* || $response == *"Invalid"* ]]; then
	echo "AWS scheint nicht korrekt konfiguriert zu sein: $response"
	exit 1
else
	echo "AWS scheint korrekt verbunden zu sein."
fi
