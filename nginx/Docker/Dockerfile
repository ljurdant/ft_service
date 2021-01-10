FROM alpine:latest

RUN apk update\
	&& apk add nginx

RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
COPY ./srcs/nginx.conf /etc/nginx/

EXPOSE 80
EXPOSE 443
ENTRYPOINT nginx -g 'daemon off;'
