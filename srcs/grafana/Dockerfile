FROM  alpine:3.13

RUN apk add --no-cache openrc openssl grafana grafana-openrc syslog-ng && \
    mkdir -p /run/openrc && touch /run/openrc/softlevel && \
    sed -i '/^cfg:server.http_addr/d' etc/conf.d/grafana && \
    rc-status && rm /etc/grafana.ini
COPY grafana.ini /etc/grafana.ini

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-key.key -out /etc/ssl/certs/nginx-cert.crt -subj "/C=FR/ST=PARIS/L=PARIS/O=42/OU=STUDENT/CN=ede-banv"

ENTRYPOINT rc-service grafana start && tail -f /dev/null

EXPOSE 3000