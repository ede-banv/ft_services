FROM  alpine:3.13

RUN apk update
RUN apk add mysql mysql-client openrc --no-cache
RUN rc-status
RUN touch /run/openrc/softlevel

COPY run.sh /tmp/

ENTRYPOINT [ "sh" , "/tmp/run.sh"]

EXPOSE 3306