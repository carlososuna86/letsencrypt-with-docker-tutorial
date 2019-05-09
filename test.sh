#!/bin/bash

clear

source .env

echo testing certificates for $SSL_DOMAIN
#ls -1 ./certs/live
#ls -1 ./certs/live | grep $SSL_DOMAIN
ls -1 ./certs/live | grep $SSL_DOMAIN | while read -r line;
do
  echo ""
  echo [$line]
  CERT_DIR=./certs/live/$line
#  ls -1 $CERT_DIR | grep pem
  sudo openssl verify -untrusted $CERT_DIR/chain.pem $CERT_DIR/cert.pem
  sudo openssl verify -untrusted $CERT_DIR/chain.pem $CERT_DIR/fullchain.pem
done
