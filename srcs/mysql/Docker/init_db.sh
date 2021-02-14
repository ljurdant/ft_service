#!/bin/sh

if [ ! -d /var/lib/mysql/wordpress ]
then
	(
	/etc/init.d/mariadb setup 
 	service mariadb start
	mysql --execute "CREATE DATABASE wordpress" 
	mysql --execute "GRANT ALL PRIVILEGES ON wordpress.* TO 'ljurdant'@'%' IDENTIFIED BY 'yo' ;"
	mysql --execute "GRANT INSERT ON wordpress.* TO 'bobby'@'%' IDENTIFIED BY 'yo' ;"
	mysql --execute "FLUSH PRIVILEGES;" 
	mysql -u root wordpress < wordpress.sql
	)
else
 	echo "hellooooooooooooooooooooooooooooooooOOOOOOOOOOOOO\n"
	mysql -u root wordpress < wp_users.sql
	service mariadb start
fi
sed -i 's/skip-networking/# skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf	
service mariadb restart
tail -f /dev/null
