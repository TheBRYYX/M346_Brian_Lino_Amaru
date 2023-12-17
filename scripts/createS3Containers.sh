#!/bin/bash

# Funktion, die den Zählerwert erhöht und ausgibt
generate_unique_id() {
  # Pfad zur Datei, die den Zählerwert speichert
  counter_file="$(dirname $0)/counter.txt"

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

# Buckets erstellen
aws s3 mb s3://$name_upload >> $(dirname $0)/log.txt
aws s3 mb s3://$name_download >> $(dirname $0)/log.txt

# Überprüfe ob der Bucket erstellt wurde
response=$(aws s3 ls 2>&1)

if [[ $response == *"$name_upload"* && $response == *"$name_download"* ]]; then
  echo "Die s3-Buckets $name_upload und $name_download wurden erfolgreich erstellt."
else
  echo "Die s3-Buckets $name_upload und $name_download wurden nicht erfolgreich erstellt, schau doch mal ins log.txt."
  exit 1
fi

# Öffentlicher Zugriff auf den Buckets frei schalten
aws s3api put-public-access-block --bucket $name_upload --public-access-block-configuration "BlockPublicPolicy=false"
aws s3api put-public-access-block --bucket $name_download --public-access-block-configuration "BlockPublicPolicy=false"

# ACL's auf den Buckets aktivieren
aws s3api put-bucket-ownership-controls --bucket $name_upload --ownership-controls="Rules=[{ObjectOwnership=BucketOwnerPreferred}]"
aws s3api put-bucket-ownership-controls --bucket $name_download --ownership-controls="Rules=[{ObjectOwnership=BucketOwnerPreferred}]"
