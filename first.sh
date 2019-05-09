#!/bin/bash

if [ ! -f .env ]; then
  cp env.example .env
fi

source .env

clear
echo DOMAIN=$SSL_DOMAIN
echo EMAIL=$SSL_ADMIN

docker-compose run --rm letsencrypt \
  letsencrypt certonly \
    --webroot \
    --email $SSL_ADMIN \
    --agree-tos \
    -w /var/www/letsencrypt \
    -d $SSL_DOMAIN

docker-compose kill -s SIGHUP proxy
