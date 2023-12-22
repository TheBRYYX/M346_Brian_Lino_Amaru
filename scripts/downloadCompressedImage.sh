#!/bin/bash

# Einzigartiger Name für jeden Bucket
name_download=$1

# Pfad zur Datei
bildpfad="$(dirname $0)/../download/image.jpg"
logpfad="$(dirname $0)/log.txt"

aws s3api put-object-acl --bucket $name_download --key image.jpg --acl public-read

wget https://$name_download.s3.amazonaws.com/image.jpg -a $logpfad -O $bildpfad
