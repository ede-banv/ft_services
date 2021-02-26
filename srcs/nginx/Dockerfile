FROM  Alpine

#https://wiki.alpinelinux.org/wiki/Nginx
RUN apk update && apk add nginx &&\
adduser -D -g 'www' www && mkdir /www && chown -R www:www /var/lib/nginx && chown -R www:www /www &&\
mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
COPY nginx.config /etc/nginx/

#start le service ds le container?
#NO ENTRYPOINT! >:(
CMD rc-service nginx start