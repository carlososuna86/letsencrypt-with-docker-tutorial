#!/bin/bash

if [[ ! -f .env ]]; then
  cp env.example .env;
fi
source .env;

echo Testing installed SSL certificates
if [[ "$EUID" -ne 0 ]]; then
  echo "Running as Root";
  CMD=sudo;
else
  CMD="";
fi;

echo "testing certificates for $SSL_DOMAIN";
ls -1 ./certs/live | grep $SSL_DOMAIN | while read -r line
do
  echo "";
  echo "[$line]"
  CERT_DIR=./certs/live/$line;
#  ls -1 $CERT_DIR | grep pem
  $CMD openssl verify -untrusted $CERT_DIR/chain.pem $CERT_DIR/cert.pem;
  $CMD openssl verify -untrusted $CERT_DIR/chain.pem $CERT_DIR/fullchain.pem;
done;
