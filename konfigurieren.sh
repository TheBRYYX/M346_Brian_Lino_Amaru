#!/bin/bash

current_directory=$(dirname $0)

echo "-------------------------------------------------------"
echo "KONFIGURIEREN START"
echo "-------------------------------------------------------"
echo "Teste verbindung zu AWS:"
# testen ob aws verfügbar und verbunden ist
$current_directory/scripts/checkIfAWS.sh

echo "-------------------------------------------------------"
echo "Erstelle S3 Buckets:"
# s3 buckets erstellen
$current_directory/scripts/createS3Containers.sh

echo "-------------------------------------------------------"
echo "KONFIGURIEREN BEENDET"
echo "-------------------------------------------------------"
