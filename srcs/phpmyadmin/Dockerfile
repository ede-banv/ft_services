FROM  alpine:3.13

#install packages
RUN apk upgrade && apk update &&\
    apk add --no-cache openrc openssl php7-common php7-iconv php7-json php7-gd php7-curl php7-xml \
    php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix \
    php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom php7-fpm php7-session \
    && mkdir -p /run/openrc && touch /run/openrc/softlevel

#install nginx
RUN apk add nginx && mkdir -p /run/nginx && rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d/

#install phpmyadmin
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-english.tar.gz \
    && mkdir /var/www/phpmyadmin && chown -R nginx:nginx /var/www/phpmyadmin \
    && tar xzf phpMyAdmin-5.0.2-english.tar.gz --strip-components=1 -C /var/www/phpmyadmin
COPY php_config.php /var/www/phpmyadmin/config.inc.php

#create ssl certificates
RUN openssl req -x509 -nodes -newkey rsa:2048 -keyout /etc/ssl/private/nginx-key.key -out /etc/ssl/certs/nginx-cert.crt -subj "/C=FR/ST=PARIS/L=PARIS/O=42/OU=STUDENT/CN=ede-banv"
RUN rc-status

ENTRYPOINT rc-service php-fpm7 start && nginx -g 'daemon off;'

EXPOSE 5000