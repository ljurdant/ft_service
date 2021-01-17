FROM alpine:latest

EXPOSE 5050

RUN apk update && apk upgrade
 
RUN apk add openrc

RUN apk add nginx

ARG nginx_path='/etc/nginx'
ARG nginx_config_path="${nginx_path}/conf.d"
ARG nginx_run='/run/nginx'
ENV nginx_html="/var/lib/nginx/html"
ARG nginx_ssl="${nginx_path}/ssl"
ARG ssl_key="${nginx_ssl}/nginx-selfsigned.key"
ARG ssl_cert="${nginx_ssl}/nginx-selfsigned.crt"
ARG nginx_conf="${nginx_config_path}/default.conf"

RUN mkdir -p /run/nginx
RUN rm /var/lib/nginx/html/index.html
ADD config/default.conf /etc/nginx/conf.d

RUN		apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session


ADD     ./tars/wordpress.tar.gz /
ADD     ./config/wp-config.php /wordpress


#RUN		mv config/wp-config.php /usr/share/nginx/html/wordpress/.

#ARG DB_IP="172.17.0.2:3306"
ARG DB_IP="mariadb-service:3306"

################################################################################################################3

RUN apk add netcat-openbsd

CMD php-fpm7 -R && nginx -g "daemon off;" && tail -f /dev/null	
