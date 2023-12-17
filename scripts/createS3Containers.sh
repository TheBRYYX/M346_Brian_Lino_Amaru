#!/bin/bash

# Einzigartiger Name für jeden Bucket
name_upload=$1
name_download=$2

# Buckets erstellen
aws s3 mb s3://$name_upload >> $(dirname $0)/log.txt
aws s3 mb s3://$name_download >> $(dirname $0)/log.txt

# Überprüfe ob der Bucket erstellt wurde
response=$(aws s3 ls 2>&1)

if [[ $response == *"$name_upload"* && $response == *"$name_download"* ]]; then
	echo "Der s3-Bucket $name_upload wurde erstellt."
	echo "Der s3-Bucket $name_download wurde erstellt."
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
