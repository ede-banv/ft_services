#!/bin/sh

sed s/__DB_NAME__/$IDB_NAME/g /etc/telegraf.conf -i
sed s/__DB_USER__/$IDB_USER/g /etc/telegraf.conf -i
sed s/__DB_PASSWORD__/$IDB_PASSWORD/g /etc/telegraf.conf -i

sed "s/;admin_user = admin/admin_user = $IDB_USER/g" /usr/share/grafana/conf/custom.ini -i
sed "s/;admin_password = admin/admin_password = $IDB_PASSWORD/g" /usr/share/grafana/conf/custom.ini -i

rc-service telegraf start
grafana-server --homepath=/usr/share/grafana/ --config=/usr/share/grafana/conf/custom.ini >/dev/null 2>&1
