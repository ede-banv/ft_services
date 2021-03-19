#!/bin/sh

sed s/__DB_NAME__/$IDB_NAME/g /etc/telegraf.conf -i
sed s/__DB_USER__/$IDB_USER/g /etc/telegraf.conf -i
sed s/__DB_PASSWORD__/$IDB_PASSWORD/g /etc/telegraf.conf -i

sed s/__DB_HOST__/$DB_HOST/g /var/www/phpmyadmin/config.inc.php -i
rc-service php-fpm7 start
rc-service telegraf start
nginx -g 'daemon off;'