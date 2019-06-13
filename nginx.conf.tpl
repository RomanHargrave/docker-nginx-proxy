daemon off;
error_log /dev/stderr info;

events {
   worker_connections 768;
}

http {
   access_log /dev/stdout;

   client_max_body_size 64M;

   upstream target {
      server ${TARGET_ADDRESS};
   }

   server {
      listen 80 default_server;
      listen [::]:80 default_server;

      server_name _;

      location / {
         proxy_set_header Host      ${TARGET_HOST};
         proxy_set_header X-Forwarded-For    $proxy_add_x_forwarded_for; # year there is an RFC standard header now, I know
         proxy_set_header X-Forwarded-Port   ${TARGET_X_FORWARDED_PORT};
         proxy_set_header X-Forwarded-Proto  ${TARGET_X_FORWARDED_PROTO};
         proxy_pass http://target;
      }
   }
}

# vim: set ft=nginx :
