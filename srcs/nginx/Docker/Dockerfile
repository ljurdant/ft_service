FROM alpine:latest

RUN apk update\
	&& apk add nginx openssl\
	&& mkdir /run/nginx
#Nginx
COPY default.conf /etc/nginx/conf.d
COPY index.html var/www

#SSL
RUN		openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=FR/ST=./L=Paris/O=ljurdant/OU=./CN=192.168.49.240"


EXPOSE 80 443

ENTRYPOINT nginx -g 'daemon off;'
