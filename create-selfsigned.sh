#!/bin/bash
CRT=/etc/nginx/ssl/server.crt
KEY=/etc/nginx/ssl/server.key

if [ ! -f "$CRT" ] || [ ! -f "$KEY" ]; then
  openssl req -x509 -nodes -newkey rsa:2048 -days 3650 \
    -subj "/CN=rustdesk.local" \
    -keyout "$KEY" -out "$CRT"
fi

chmod 600 "$KEY"
