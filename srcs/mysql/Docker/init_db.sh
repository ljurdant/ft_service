#!/bin/sh

rc-update add mariadb default
if [ ! -d /var/lib/mysql/wordpress ]
then
	(
	mysql_install_db --user=mysql --datadir=${DB_DATA_PATH}
	rc-update add mariadb default
	rc boot && rc-service mariadb start 
	mysql --execute="create database wordpress default character set utf8 collate utf8_unicode_ci" 
	mysql --execute="grant all on *.* to 'root'@'%' identified by 'root'"
	mysql --execute "GRANT ALL PRIVILEGES ON wordpress.* TO 'ljurdant'@'%' IDENTIFIED BY 'yo' ;"
	mysql --execute "GRANT INSERT ON wordpress.* TO 'bobby'@'%' IDENTIFIED BY 'yo' ;" | mysql -u root \
	mysql --execute "flush privileges" 
	mysql -uroot -proot wordpress < wordpress.sql
	)
else
	mysql -uroot -proot wordpress < wp_users.sql
	rc boot && rc-service mariadb start
fi	
rc-service mariadb restart 
sleep infinity
