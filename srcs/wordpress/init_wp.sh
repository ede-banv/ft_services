#!/bin/sh

sed s/__DB_NAME__/$DB_NAME/g /var/www/wordpress/wp-config.php -i
sed s/__DB_USER__/$DB_USER/g /var/www/wordpress/wp-config.php -i
sed s/__DB_PASSWORD__/$DB_PASSWORD/g /var/www/wordpress/wp-config.php -i
sed s/__DB_HOST__/$DB_HOST/g /var/www/wordpress/wp-config.php -i

sed s/__DB_NAME__/$IDB_NAME/g /etc/telegraf.conf -i
sed s/__DB_USER__/$IDB_USER/g /etc/telegraf.conf -i
sed s/__DB_PASSWORD__/$IDB_PASSWORD/g /etc/telegraf.conf -i

rc-service php-fpm7 start
rc-service telegraf start
nginx -g 'daemon off;'

tail -f /dev/nul