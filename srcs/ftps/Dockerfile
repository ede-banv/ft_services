FROM  alpine:3.13

#######################
#     Setup FTPS      #
#######################
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    apk update && apk add --no-cache openrc openssl vsftpd && rc-update add vsftpd default \
    && mkdir -p /run/openrc && touch /run/openrc/softlevel && rm /etc/vsftpd/vsftpd.conf && rc-status
COPY vsftpd.conf /etc/vsftpd/

######################
#   Setup Telegraf   #
######################
RUN apk add telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community \
    telegraf-openrc --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community && \
    rm /etc/telegraf.conf
COPY telegraf.conf /etc/

######################
#     Setup  SSL     #
######################
RUN openssl req -new -x509 -days 365 -nodes -out /etc/ssl/private/vsftpd.cert.pem -keyout /etc/ssl/private/vsftpd.key.pem -subj "/C=FR/ST=PARIS/L=PARIS/O=42/OU=STUDENT/CN=ede-banv"
RUN chown root:root /etc/ssl/private/vsftpd.cert.* && chmod 600 /etc/ssl/private/vsftpd.cert.*

######################
#  User + test file  #
######################
RUN adduser --disabled-password --home etc/vsftpd/home ftps_ede-banv && \
	echo "ftps_ede-banv:xdmdr" | chpasswd && \
	echo 'This is only a test.' >> etc/vsftpd/home/test

COPY ftpsstart.sh /tmp/
ENTRYPOINT [ "sh" ,"/tmp/ftpsstart.sh" ]

EXPOSE 21 21000 21001 