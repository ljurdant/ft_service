FROM alpine:latest

RUN apk update\
	&& apk add nginx\
	&& apk add wget

RUN wget https://wordpress.org/latest.tar.gz\
	&& tar -xzvf latest.tar.gz

EXPOSE 5050
ENTRYPOINT nginx -g 'daemon off'
