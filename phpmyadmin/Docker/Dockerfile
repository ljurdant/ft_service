FROM alpine:latest
RUN apk update && apk upgrade

RUN apk add nginx openssl

RUN mkdir -p /run/nginx
RUN rm /var/lib/nginx/html/index.html
COPY default.conf /etc/nginx/conf.d


RUN		apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

RUN		wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-english.tar.gz\		
		&& tar -xvzf phpMyAdmin-5.0.4-english.tar.gz\
		&& rm phpMyAdmin-5.0.4-english.tar.gz\
		&& mkdir /var/lib/nginx/html/phpmyadmin\
		&& mv /phpMyAdmin-5.0.4-english/* /var/lib/nginx/html/phpmyadmin

COPY    config.inc.php /var/lib/nginx/html/phpmyadmin
RUN		chmod 777 /var/lib/nginx/html/phpmyadmin
COPY	www.conf /etc/php7/php-fpm.d/

EXPOSE	5000

CMD php-fpm7 -R && nginx -g "daemon off;" && tail -f /dev/null	
