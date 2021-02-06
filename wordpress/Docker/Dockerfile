FROM alpine:latest

EXPOSE 5050

RUN apk update && apk upgrade\
	&&  apk add nginx openssl

#nginx
RUN mkdir -p /run/nginx
RUN rm /var/lib/nginx/html/index.html
COPY default.conf /etc/nginx/conf.d

#SSL
RUN		openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=FR/ST=./L=Paris/O=ljurdant/OU=./CN=192.168.49.240"

#php download
RUN		apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

#wordpress download
RUN 	wget https://wordpress.org/latest.tar.gz\
		&& tar -xzvf latest.tar.gz
COPY    wp-config.php /wordpress

CMD 	php-fpm7 && nginx -g "daemon off;" && tail -f /dev/null	
