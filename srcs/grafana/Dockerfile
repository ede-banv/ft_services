FROM  alpine:3.13

RUN apk add --no-cache grafana --repository http://dl-cdn.alpinelinux.org/alpine/v3.13/community/ && \
	mv usr/share/grafana/conf/sample.ini usr/share/grafana/conf/custom.ini
#COPY grafana.ini /etc/

RUN apk add telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community \
    telegraf-openrc --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community && \
    rm /etc/telegraf.conf
COPY telegraf.conf /etc/

COPY grafana.db /usr/share/grafana/data/
#COPY dashboard.yaml /usr/share/grafana/conf/provisioning/dashboards/
#COPY database.yaml /usr/share/grafana/conf/provisioning/datasources/


COPY init_grf.sh /tmp/
ENTRYPOINT ["sh", "/tmp/init_grf.sh"]

EXPOSE 3000