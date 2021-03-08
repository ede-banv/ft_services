FROM  alpine:3.13

#https://wiki.alpinelinux.org/wiki/FTP
RUN apk add --no-cache openrc openssl vsftpd && rc-update add vsftpd default 
COPY vsftpd.conf /etc/

#for ftp to be ftps it requires a tls/ssl encryption
#https://doc.ubuntu-fr.org/vsftpd#installation
RUN openssl req -new -x509 -days 365 -nodes -out /etc/ssl/private/vsftpd.cert.pem -keyout /etc/ssl/private/vsftpd.key.pem -subj "/C=FR/ST=PARIS/L=PARIS/O=42/OU=STUDENT/CN=ede-banv"
RUN chown root:root /etc/ssl/private/vsftpd.cert.* && chmod 600 /etc/ssl/private/vsftpd.cert.*
#RUN sudo ufw allow proto tcp to any port 40000:40100 && sudo ufw allow proto udp to any port 40000:40100

COPY ftpsstart.sh /tmp/

ENTRYPOINT [ "sh" ,"/tmp/ftpsstart.sh" ]

EXPOSE 21