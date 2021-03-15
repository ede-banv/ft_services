#!/bin/sh

mysql_install_db --user=mysql --datadir=/var/lib/mysql
sed -i 's/skip-networking/#skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf
rc-service mariadb start

echo "CREATE DATABASE wordpress;" | mysql -u root
echo "CREATE USER 'ede-banv';" | mysql -u root
echo "SET password FOR 'ede-banv' = password('jojorigolo');" | mysql -u root
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'ede-banv' IDENTIFIED BY 'jojorigolo';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root

mysql wordpress -u root < /start/wordpress.sql
tail -f /dev/null