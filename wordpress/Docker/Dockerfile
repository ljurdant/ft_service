FROM alpine:latest

RUN apk update\
	&& apk add nginx rsync\
	&& mkdir /run/nginx\
	&& mkdir /etc/nginx/sites-enabled

RUN	apk add php-fpm php-curl php-gd php-intl php-mbstring\
	php-soap php-xml php-xmlrpc php-zip\
	&&  wget https://wordpress.org/latest.tar.gz\
	&& tar -xzvf latest.tar.gz\
	&& cp -a /wordpress/wp-config-sample.php /wordpress/wp-config.php

COPY	./srcs/wp-config.php /wordpress

RUN		rsync -avP /wordpress /var/www/html/\
		&& chown -R :www-data /var/www/html/*\
		&& mkdir /var/www/html/wp-content\
		&& mkdir /var/www/html/wp-content/uploads\
		&& chown -R :www-data /var/www/html/wp-content/uploads
COPY	./srcs/wordpress /etc/nginx/sites-available

RUN		ln -s /etc/nginx/sites-available/wordpress /etc/nginx/sites-enabled/

EXPOSE 5050
ENTRYPOINT nginx -g 'daemon off;'
