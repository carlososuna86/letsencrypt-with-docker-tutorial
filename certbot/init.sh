#!/bin/bash

SSL_DIR=/etc/letsencrypt/live/$SSL_DOMAIN
mkdir -p $SSL_DIR

if [ ! -f $SSL_DIR/privkey.pem ] || [ ! -f $SSL_DIR/fullchain.pem ]; then
  mkdir -p $SSL_DIR

  echo Creating self-signed certificates at $SSL_DIR
  openssl req \
    -x509 \
    -nodes \
    -days 365 \
    -newkey rsa:2048 \
    -keyout $SSL_DIR/privkey.pem \
    -out $SSL_DIR/fullchain.pem \
    -subj /CN=$SSL_DOMAIN
  cp $SSL_DIR/fullchain.pem $SSL_DIR/chain.pem
  cp $SSL_DIR/fullchain.pem $SSL_DIR/cert.pem
  chmod +r $SSL_DIR/*.pem
fi

# Pass other arguments to the container
echo $@
$@
