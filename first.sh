#!/bin/bash

clear

if [ ! -f .env ]; then
  cp env.example .env
fi
source .env


echo DOMAIN=$SSL_DOMAIN
echo EMAIL=$SSL_ADMIN

CERT_DIR=/etc/letsencrypt/live/$SSL_DOMAIN
docker-compose run --rm letsencrypt \
  letsencrypt certonly \
    --webroot \
    --email $SSL_ADMIN \
    --agree-tos \
    --force-renew \
    -w /var/www/letsencrypt \
    -d $SSL_DOMAIN \
&& openssl verify $CERT_DIR/fullchain.pem

docker-compose kill -s SIGHUP proxy
