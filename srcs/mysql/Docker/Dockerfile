FROM alpine:latest

#Copying saved wordpress database
COPY wordpress.sql ./
COPY wp_users.sql ./

# Install MySQL and dependencies
RUN apk update && apk upgrade\
	&& apk add mariadb mariadb-client\
	&& apk add mysql mysql-client\
	&& apk add openrc
RUN openrc boot
RUN mkdir -p /var/lib/mysql

EXPOSE 3306

#COPY mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

COPY init_db.sh ./

CMD sh init_db.sh

