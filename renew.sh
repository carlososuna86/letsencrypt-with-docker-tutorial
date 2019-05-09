#!/bin/bash

if [ ! -f .env ]; then
  cp env.example .env
fi

source .env

docker-compose run --rm letsencrypt \
  letsencrypt renew

docker-compose kill -s SIGHUP proxy

