#!/bin/sh

sed s/__DB_NAME__/$IDB_NAME/g /etc/telegraf.conf -i
sed s/__DB_USER__/$IDB_USER/g /etc/telegraf.conf -i
sed s/__DB_PASSWORD__/$IDB_PASSWORD/g /etc/telegraf.conf -i

rc-service vsftpd start
#vsftpd /etc/vsftpd/vsftpd.conf
rc-service telegraf start

tail -f /dev/null
