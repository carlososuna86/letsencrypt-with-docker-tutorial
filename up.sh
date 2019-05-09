#!/bin/bash

clear

if [ ! -f .env ]; then
  cp env.example .env
fi

source .env

docker-compose build
clear

docker-compose up -d

if $DEBUG
then
  docker-compose run letsencrypt ls -la /etc/letsencrypt/live/$SSL_DOMAIN/
  docker-compose exec proxy cat /etc/nginx/conf.d/app.conf
fi
