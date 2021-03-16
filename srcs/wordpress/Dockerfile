FROM  alpine:3.13

#install php & mysql?
RUN apk update && \
    apk add --no-cache nginx openrc wget openssl php7 php7-fpm php7-mysqli php7-mbstring \
    php7-json php7-session php-sockets php7-common php7-opcache php7-zlib php7-curl php7-gd \
    php7-cgi
RUN mkdir -p /run/openrc && touch /run/openrc/softlevel

#setup openssl key
RUN openssl req -x509 -nodes -newkey rsa:2048 -keyout /etc/ssl/private/nginx-key.key -out /etc/ssl/certs/nginx-cert.crt -subj "/C=FR/ST=PARIS/L=PARIS/O=42/OU=STUDENT/CN=ede-banv"

#set up nginx
RUN mkdir -p /run/nginx && rm -f /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d/

#https://wiki.alpinelinux.org/wiki/WordPress
RUN  cd /var/www && wget http://wordpress.org/latest.tar.gz && tar -xzvf latest.tar.gz \
    && rm latest.tar.gz && chmod -R 755 /var/www/wordpress
COPY wp-config.php /var/www/wordpress/
RUN rc-status
ENTRYPOINT service php-fpm7 start && nginx -g 'daemon off;'

EXPOSE 5050