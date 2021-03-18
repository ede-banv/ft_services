FROM  alpine:3.13

RUN apk update && apk add influxdb influxdb-openrc influxdb-doc openrc && \
    mkdir -p /run/openrc && touch /run/openrc/softlevel

RUN apk add telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community \
    telegraf-openrc --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community && \
    rm /etc/telegraf.conf
COPY srcs/telegraf.conf /etc/telegraf.conf

COPY init_influx.sh /tmp/
ENTRYPOINT ["sh", "/tmp/init_influx.sh"]

EXPOSE 8086