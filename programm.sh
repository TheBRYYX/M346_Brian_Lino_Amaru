#!/bin/bash

current_directory=$(dirname $0)
# Funktion, die den Zählerwert erhöht und ausgibt
generate_unique_id() {
  # Pfad zur Datei, die den Zählerwert speichert
  counter_file="$(dirname $0)/scripts/counter.txt"

  # Initialisiere den Zählerwert, falls die Datei nicht existiert
  if [ ! -e "$counter_file" ]; then
    echo "0" > "$counter_file"
  fi

  # Lies den aktuellen Zählerwert aus der Datei
  counter=$(<"$counter_file")

  # Erhöhe den Zählerwert um eins
  ((counter++))

  # Speichere den neuen Zählerwert in der Datei
  echo "$counter" > "$counter_file"

  # Gib den aktuellen Zählerwert aus
  echo $counter
}

# Einzigartiger Name für jeden Bucket
counter=$(generate_unique_id)
name_upload="bucketamarubrianlinoupload$counter"
name_download="bucketamarubrianlinodownload$counter"

echo "-------------------------------------------------------"
echo "PROGRAMM START"
echo "-------------------------------------------------------"
echo "Teste verbindung zu AWS:"
# testen ob aws verfügbar und verbunden ist
$current_directory/scripts/checkIfAWS.sh
if [[ $? -eq 1 ]]; then
	echo "-------------------------------------------------------"
	echo "PROGRAMM FRÜHZEITIG BEENDET"
	echo "-------------------------------------------------------"
	exit 1
fi

echo "-------------------------------------------------------"
echo "Teste ob das Bild hochgeladen wurde:"
# testen ob aws verfügbar und verbunden ist
$current_directory/scripts/checkIfImage.sh
if [[ $? -eq 1 ]]; then
  echo "-------------------------------------------------------"
  echo "PROGRAMM FRÜHZEITIG BEENDET"
  echo "-------------------------------------------------------"
  exit 1
fi

echo "Erstelle S3 Buckets:"
# s3 buckets erstellen
$current_directory/scripts/createS3Containers.sh $name_upload $name_download
if [[ $? -eq 1 ]]; then
  echo "-------------------------------------------------------"
  echo "PROGRAMM FRÜHZEITIG BEENDET"
  echo "-------------------------------------------------------"
  exit 1
fi

echo "Erstelle Lambda Funktion"
# lambda funktion erstellen
$current_directory/scripts/createLambda.sh $name_upload $name_download
if [[ $? -eq 1 ]]; then
  echo "-------------------------------------------------------"
  echo "PROGRAMM FRÜHZEITIG BEENDET"
  echo "-------------------------------------------------------"
  exit 1
fi

echo "-------------------------------------------------------"
echo "Bild hochladen:"
# bild hochladen
$current_directory/scripts/uploadNewImage.sh $name_upload
if [[ $? -eq 1 ]]; then
  echo "-------------------------------------------------------"
  echo "PROGRAMM FRÜHZEITIG BEENDET"
  echo "-------------------------------------------------------"
  exit 1
fi

echo "-------------------------------------------------------"
echo "Bild herunterladen:"
# bild herunterladen
$current_directory/scripts/downloadCompressedImage.sh $name_download
if [[ $? -eq 1 ]]; then
  echo "-------------------------------------------------------"
  echo "PROGRAMM FRÜHZEITIG BEENDET"
  echo "-------------------------------------------------------"
  exit 1
fi

echo "-------------------------------------------------------"
echo "PROGRAMM BEENDET"
echo "-------------------------------------------------------"
