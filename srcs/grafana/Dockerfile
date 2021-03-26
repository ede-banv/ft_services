FROM  alpine:3.13

#####################
#  Install Grafana  #
#####################
RUN apk add --no-cache grafana --repository http://dl-cdn.alpinelinux.org/alpine/v3.13/community/ && \
	mv usr/share/grafana/conf/sample.ini usr/share/grafana/conf/custom.ini
RUN apk add openrc && mkdir -p /run/openrc && touch /run/openrc/softlevel
COPY grafana.db /usr/share/grafana/data/

######################
#   Setup Telegraf   #
######################
RUN apk add telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community \
    telegraf-openrc --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community && \
    rm /etc/telegraf.conf
COPY telegraf.conf /etc/
RUN rc-status

COPY init_grf.sh /tmp/
ENTRYPOINT ["sh", "/tmp/init_grf.sh"]

EXPOSE 3000