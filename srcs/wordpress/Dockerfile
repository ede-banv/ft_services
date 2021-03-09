FROM  alpine:3.13

#install php & mysql?
RUN apk add --no-cache nginx wget openssl php7 php7-fpm php7-mbstring php7-session php7-mcrypt \
    php7-soap php7-openssl php7-gmp php7-pdo_odbc php7-json php7-dom php7-pdo php7-zip \
    php7-mysqli php7-sqlite3 php7-apcu php7-pdo_pgsql php7-bcmath php7-gd php7-odbc php7-pdo_mysql \
    php7-pdo_sqlite php7-gettext php7-xmlreader php7-xmlrpc php7-bz2 php7-iconv php7-pdo_dblib \
    php7-curl php7-ctype hp7-gd php7-cgi php7-opcache php7-zlib php-sockets
RUN mkdir -p /run/openrc && touch /run/openrc/softlevel

#setup openssl key
RUN openssl req -x509 -nodes -newkey rsa:2048 -keyout /etc/ssl/private/nginx-key.key -out /etc/ssl/certs/nginx-cert.crt -subj "/C=FR/ST=PARIS/L=PARIS/O=42/OU=STUDENT/CN=ede-banv"

#set up nginx
RUN mkdir -p /run/nginx && rm -f /etc/nginx/conf.d/default.conf
COPY nginx.conf /run/nginx/conf.d/

#https://wiki.alpinelinux.org/wiki/WordPress
RUN  cd /var/www && wget http://wordpress.org/latest.tar.gz && tar -xzvf latest.tar.gz \
    && rm latest.tar.gz && chmod -R 755 /var/www/wordpress
COPY wp-config.php .

EXPOSE 5050