#!/bin/bash

# Prüfe, ob die Datei existiert
if [ ! -f "$HOME/.aws/credentials" ]; then
  echo "Die Datei $HOME/.aws/credentials existiert nicht."
  exit 1
fi

# Öffne die Datei
credentials=$(cat "$HOME/.aws/credentials")

# Prüfe, ob die Datei leer ist
if [ -z "$credentials" ]; then
  echo "Die Datei $HOME/.aws/credentials ist leer."
  exit 1
fi

# Alles in Ordnung
echo "Die Datei $HOME/.aws/credentials ist befüllt."

# Führe den AWS S3 List-Befehl aus
response=$(aws s3 ls 2>&1)

# Überprüfe die Antwort auf Fehlermeldungen
if [[ $response == *"Unable to"* || $response == *"Error"* || $response == *"Invalid"* ]]; then
  echo "AWS scheint nicht korrekt konfiguriert zu sein: $response"
  exit 1
else
  echo "AWS scheint korrekt konfiguriert und verbunden zu sein"
fi
