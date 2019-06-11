#!/bin/sh

conf_file=/etc/nginx/nginx.conf

echo "Setting up nginx configuration"

envsubst '${TARGET_HOST} ${TARGET_ADDRESS} ${TARGET_X_FORWARDED_PORT} ${TARGET_X_FORWARDED_PROTO}' < "$conf_file.tpl" > "$conf_file"

cat "$conf_file"

mkdir -p -- /run/nginx && touch /run/nginx/nginx.pid && nginx
