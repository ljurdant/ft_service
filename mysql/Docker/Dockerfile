FROM alpine:latest

#COPY mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

# Install MySQL and dependencies100dd
RUN apk update && apk upgrade\
	&& apk add mysql mysql-client\
	&& apk add openrc
RUN openrc boot

RUN apk add mariadb mariadb-client
RUN mkdir -p /var/lib/mysql

EXPOSE 3306


ENTRYPOINT if [ ! -f /var/lib/mysql/wordpress ] ; then /etc/init.d/mariadb setup  && sed -i 's/skip-networking/# skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf \
 		&& 		service mariadb start \
		&&		echo "CREATE DATABASE IF NOT EXISTS wordpress;" | mysql -u root \
		&&		echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'ljurdant'@'%' IDENTIFIED BY 'yo' ;" | mysql -u root \
		&&		echo "FLUSH PRIVILEGES;" | mysql -u root; fi && tail -f /dev/null
