FROM alpine:3.9.4

RUN apk add nginx gettext

COPY nginx.conf.tpl /etc/nginx

COPY start.sh /usr/local/sbin/start.sh
RUN  chmod +x /usr/local/sbin/start.sh

CMD "/usr/local/sbin/start.sh"
