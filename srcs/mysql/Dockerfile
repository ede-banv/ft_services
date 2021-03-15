FROM  alpine:3.13

RUN apk update && apk add mariadb mariadb-common mariadb-client --no-cache openrc && \
    rc-status && mkdir -p /run/openrc&& touch /run/openrc/softlevel
#COPY wordpress.sql ./
#COPY ./my.cnf /etc/my.cnf.d/mariadb-server.cnf

COPY run.sh /tmp/

ENTRYPOINT [ "sh" , "/tmp/run.sh"]

EXPOSE 3306