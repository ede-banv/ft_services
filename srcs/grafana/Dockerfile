FROM  alpine:3.13

RUN apk add --no-cache openrc openssl grafana grafana-openrc syslog-ng && \
    mkdir -p /run/openrc && touch /run/openrc/softlevel && \
    sed -i '/^cfg:server.http_addr/d' etc/conf.d/grafana && \
    rc-status && rm /etc/grafana.ini
COPY grafana.ini /etc/

RUN apk add telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community \
    telegraf-openrc --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community && \
    rm /etc/telegraf.conf
COPY telegraf.conf /etc/

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-key.key -out /etc/ssl/certs/nginx-cert.crt -subj "/C=FR/ST=PARIS/L=PARIS/O=42/OU=STUDENT/CN=ede-banv"

COPY dashboard.yaml /usr/share/grafana/conf/provisioning/dashboards/
COPY database.yaml /usr/share/grafana/conf/provisioning/datasources/
COPY grafana.db /var/lib/grafana/data/

COPY init_grf.sh /tmp/
ENTRYPOINT ["sh", "/tmp/init_grf.sh"]

EXPOSE 3000