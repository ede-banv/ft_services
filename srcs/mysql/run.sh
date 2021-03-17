#!/bin/sh

mysql_install_db --user=mysql --datadir=/var/lib/mysql
sed -i 's/skip-networking/#skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf
rc-service mariadb start

echo "CREATE DATABASE ${DB_NAME};" | mysql -u root
echo "CREATE USER '${DB_USER}'@'%';" | mysql -u root
echo "SET password FOR '${DB_USER}'@'%' = password('${DB_PASSWORD}');" | mysql -u root
echo "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root

mysql wordpress -u root < /start/wordpress.sql
tail -f /dev/null