#!/bin/bash

sed -i "s/EXPIRATION/$EXPIRATION/" cert.tmpl

if [[ "$*" == "/bin/bash /app/start.sh" ]]; then
    if [ ! -f /etc/nginx/certs/nginx-proxy-ca.crt ]; then
      echo "=== Generating a new Certificate Authority -> nginx-proxy-ca.crt  ================"
    	openssl genrsa -out /etc/nginx/certs/nginx-proxy-ca.key 2048
	    openssl req -x509 -new -nodes -key /etc/nginx/certs/nginx-proxy-ca.key -sha256 -days $EXPIRATION -subj "/CN=Nginx-Proxy Companion Self-Signed CA $(date +%s)-$RANDOM" -out /etc/nginx/certs/nginx-proxy-ca.crt
    fi
fi

exec "$@"
