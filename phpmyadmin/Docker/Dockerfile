FROM alpine:latest

FROM alpine:latest

# Install PHP
RUN apk update && \
	apk add --no-cache php7 php7-fpm php7-opcache php7-gd php7-mysqli \
	php7-zlib php7-curl php7-mbstring php7-json php7-session nginx openssl

# Download PHPMyAdmin
ADD https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-english.tar.gz .

# SSL Certificate
RUN		openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=FR/ST=./L=Paris/O=ljurdant/OU=./CN=localhost"
COPY	./srcs/self-signed.conf /etc/nginx/snippets
COPY	./srcs/ssl-params.conf /etc/nginx/snippets

# Install PHPMyAdmin
RUN tar -xvf phpMyAdmin-5.0.2-english.tar.gz && \
	mv phpMyAdmin-5.0.2-english /www && \
	rm -f phpMyAdmin-5.0.2-english.tar.gz \

EXPOSE 5000

CMD /usr/bin/php -S 0.0.0.0:80 -t /www/
