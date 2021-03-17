sed s/__DB_NAME__/$DB_NAME/g /var/www/wordpress/wp-config.php -i
sed s/__DB_USER__/$DB_USER/g /var/www/wordpress/wp-config.php -i
sed s/__DB_PASSWORD__/$DB_PASSWORD/g /var/www/wordpress/wp-config.php -i
sed s/__DB_HOST__/$DB_HOST/g /var/www/wordpress/wp-config.php -i

rc-service php-fpm7 start
#php-fpm7 --nodaemonize
nginx -g 'daemon off;'
#rc-service nginx start
tail -f /dev/nul