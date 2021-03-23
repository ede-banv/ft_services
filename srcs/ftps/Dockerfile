FROM  alpine:3.13

#https://wiki.alpinelinux.org/wiki/FTP
RUN apk update && apk add --no-cache openrc openssl vsftpd && rc-update add vsftpd default \
    && mkdir -p /run/openrc && touch /run/openrc/softlevel && rm /etc/vsftpd/vsftpd.conf && rc-status
COPY vsftpd.conf /etc/vsftpd/

RUN apk add telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community \
    telegraf-openrc --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community && \
    rm /etc/telegraf.conf
COPY telegraf.conf /etc/

#for ftp to be ftps it requires a tls/ssl encryption
#https://doc.ubuntu-fr.org/vsftpd#installation
RUN openssl req -new -x509 -days 365 -nodes -out /etc/ssl/private/vsftpd.cert.pem -keyout /etc/ssl/private/vsftpd.key.pem -subj "/C=FR/ST=PARIS/L=PARIS/O=42/OU=STUDENT/CN=ede-banv"
RUN chown root:root /etc/ssl/private/vsftpd.cert.* && chmod 600 /etc/ssl/private/vsftpd.cert.*

RUN adduser --disabled-password --home etc/vsftpd/home ftps_ede-banv && \
	echo "ftps_ede-banv:xdmdr" | chpasswd && \
	echo 'This is only a test.' >> etc/vsftpd/home/test

COPY ftpsstart.sh /tmp/
ENTRYPOINT [ "sh" ,"/tmp/ftpsstart.sh" ]

EXPOSE 21