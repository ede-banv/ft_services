FROM  alpine:3.13

#######################
#      Nginx Setup    #
#######################
RUN apk update && apk add nginx openrc openssl --no-cache && \
    mkdir -p /run/nginx && rm -f /etc/nginx/conf.d/default.conf && \
    mkdir -p /run/openrc && touch /run/openrc/softlevel
COPY nginx.conf /etc/nginx/conf.d/nginx.conf
COPY index.html /var/www/

######################
#   Setup Telegraf   #
######################
RUN apk add telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community \
    telegraf-openrc --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community && \
    rm /etc/telegraf.conf
COPY telegraf.conf /etc/

######################
#     Setup  SSL     #
######################
RUN openssl req -x509 -nodes -newkey rsa:2048 -keyout /etc/ssl/private/nginx-key.key -out /etc/ssl/certs/nginx-cert.crt -subj "/C=FR/ST=PARIS/L=PARIS/O=42/OU=STUDENT/CN=ede-banv"
RUN rc-status

COPY run.sh /tmp/
ENTRYPOINT [ "sh", "/tmp/run.sh" ]

EXPOSE 80 443