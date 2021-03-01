FROM  alpine

#https://wiki.alpinelinux.org/wiki/Nginx
RUN apk update && apk add nginx openrc --no-cache &&\
adduser -D -g 'www' www && mkdir /www && chown -R www:www /var/lib/nginx && chown -R www:www /www &&\
mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
COPY nginx.conf /etc/nginx/
RUN mkdir -p /run/nginx

#start le service ds le container?
#NO ENTRYPOINT! >:(
#https://stackoverflow.com/questions/24241292/dockerized-nginx-is-not-starting
#CMD rc-service nginx start
#CMD ["nginx", "-g", "daemon off;"]
CMD /usr/sbin/nginx -g "daemon off;"