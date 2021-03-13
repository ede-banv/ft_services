FROM  alpine:3.13

RUN apk update && apk add mariadb mariadb-client --no-cache openrc && \
    rc-status && mkdir -p /run/openrc&& touch /run/openrc/softlevel

CMD

EXPOSE 3306