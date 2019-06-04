#!/bin/bash

if [ -z $(groups | grep docker) ];
  CMD=sudo
else
  CMD=
fi

if [ -f .env ]; then
  source .env
fi

if [ $REBUILD -eq 1 ]; then
  $CMD docker rmi carlososuna86/certbot:proxy
  $CMD docker rmi carlososuna86/certbot:certbot
fi
