FROM  alpine:3.13

######################
#   Install MySQL    #
######################
RUN apk update && apk add mysql mysql-client openrc --no-cache && rc-status && \
    touch /run/openrc/softlevel

######################
#   Setup Telegraf   #
######################
RUN apk add telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community \
    telegraf-openrc --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community && \
    rm /etc/telegraf.conf
COPY telegraf.conf /etc/
RUN rc-status

COPY wordpress.sql /tmp/
COPY run.sh /tmp/
ENTRYPOINT [ "sh" , "/tmp/run.sh"]

EXPOSE 3306