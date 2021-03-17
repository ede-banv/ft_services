FROM  alpine:3.13

RUN apk update && apk add mysql mysql-client openrc --no-cache && rc-status \
    touch /run/openrc/softlevel

COPY run.sh /tmp/
ENTRYPOINT [ "sh" , "/tmp/run.sh"]

EXPOSE 3306