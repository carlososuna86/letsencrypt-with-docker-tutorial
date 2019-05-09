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
  ./test.sh
fi
