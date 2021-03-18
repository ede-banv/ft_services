#!/bin/sh

mysql_install_db --user=mysql --datadir=/var/lib/mysql
sed -i 's/skip-networking/#skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf
rc-service mariadb start

echo "CREATE DATABASE ${DB_NAME};" | mysql -u root
echo "CREATE USER '${DB_USER}'@'%';" | mysql -u root
echo "SET password FOR '${DB_USER}'@'%' = password('${DB_PASSWORD}');" | mysql -u root
echo "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root

mysql wordpress -u root < /tmp/wordpress.sql
tail -f /dev/null

#if [ ! -f /var/lib/mysql/wpNewUsers ]; then
	#echo "done" >> /var/lib/mysql/wpNewUsers
	#mysql -h localhost -e "$(cat $tmpsql)"
	#mysql wordpress -u root < wordpress.sql
	#mysql wordpress -u root < users.sql
#fi