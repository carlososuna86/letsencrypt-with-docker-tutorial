#!/bin/bash

if [ ! -f .env ]; then
  cp env.example .env
fi
source .env

if [ -z "$(groups | grep docker)" ]; then
  CMD=sudo
else
  CMD=
fi

$CMD docker-compose build

$CMD docker-compose up -d

if $DEBUG
then
  ./test.sh
fi
