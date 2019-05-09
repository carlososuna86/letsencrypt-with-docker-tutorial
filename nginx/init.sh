#!/bin/bash

CONF_DIR=/etc/nginx/conf.d

# Remove previous configuration files
rm -v $CONF_DIR/*

# Use template to create new Nginx configuration file
frep /default/app.conf:$CONF_DIR/app.conf

if [ -z $@ ]; then
  # If no parameters are passed
  # Start the Nginx service
  nginx -g "daemon off;"
else
  # Process any command passed to the container
  bash $@
fi
