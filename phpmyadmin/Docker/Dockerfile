FROM alpine:latest

RUN apk update\
	&& apk add nginx\
	&& mkdir /run/nginx

RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
COPY default.conf /etc/nginx/conf.d
COPY index.html var/www
EXPOSE 5000
ENTRYPOINT nginx -g 'daemon off;'
