FROM alpine:latest

RUN apk update\
	&& apk add nginx\
	&& mkdir /run/nginx

RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www

RUN		openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=FR/ST=./L=Paris/O=ljurdant/OU=./CN=192.168.49.240"
#COPY	./srcs/self-signed.conf /etc/nginx/snippets
#COPY	./srcs/ssl-params.conf /etc/nginx/snippets
COPY default.conf /etc/nginx/conf.d
COPY index.html var/www
EXPOSE 80
ENTRYPOINT nginx -g 'daemon off;'
