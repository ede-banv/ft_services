FROM  alpine:3.13

#https://wiki.alpinelinux.org/wiki/Nginx
RUN apk update && apk add nginx openrc openssl --no-cache &&\
mkdir -p /run/nginx && rm -f /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d/nginx.conf
COPY index.html /var/www/

#add ssl
RUN openssl req -x509 -nodes -newkey rsa:2048 -keyout /etc/ssl/private/nginx-key.key -out /etc/ssl/certs/nginx-cert.crt -subj "/C=FR/ST=PARIS/L=PARIS/O=42/OU=STUDENT/CN=ede-banv"
#start le service ds le container?
#NO ENTRYPOINT! >:(
#https://stackoverflow.com/questions/24241292/dockerized-nginx-is-not-starting
#CMD rc-service nginx start
#CMD ["nginx", "-g", "daemon off;"]
#CMD /usr/sbin/nginx -g "daemon off;"
ENTRYPOINT [ "nginx", "-g", "daemon off;" ]

EXPOSE 80 443