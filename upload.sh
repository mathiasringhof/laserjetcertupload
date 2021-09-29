#!/bin/bash

CERT_LOCATION=./cert
KEY_LOCATION=./key
EXTRACTED_CERT=$(mktemp)
GENERATED_PKCS12=$(mktemp)
PASSWORD=superSecret

# get first certificate of provided cert file
awk '/-----BEGIN CERTIFICATE-----/,/-----END CERTIFICATE-----/' $CERT_LOCATION > $EXTRACTED_CERT
openssl pkcs12 -export -in $EXTRACTED_CERT -inkey $KEY_LOCATION -out $GENERATED_PKCS12 -password pass:$PASSWORD
curl -v --insecure https://laserjet/hp/device/Certificate.pfx --form upload=@$GENERATED_PKCS12 --form Password=$PASSWORD