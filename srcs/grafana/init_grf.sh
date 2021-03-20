#!/bin/sh

sed s/__DB_NAME__/$IDB_NAME/g /usr/share/grafana/conf/provisioning/datasources/database.yaml -i
sed s/__DB_USER__/$IDB_USER/g /usr/share/grafana/conf/provisioning/datasources/database.yaml -i
sed s/__DB_PASSWORD__/$IDB_PASSWORD/g /usr/share/grafana/conf/provisioning/datasources/database.yaml -i

sed s/__GRAF_USER__/$IDB_USER/g /etc/grafana.ini -i
sed s/__GRAF_PASS__/$IDB_PASSWORD/g /etc/grafana.ini -i

sed s/__DB_NAME__/$IDB_NAME/g /etc/telegraf.conf -i
sed s/__DB_USER__/$IDB_USER/g /etc/telegraf.conf -i
sed s/__DB_PASSWORD__/$IDB_PASSWORD/g /etc/telegraf.conf -i

rc-service grafana start
rc-service telegraf start
grafana-server --homepath=/usr/share/grafana/ --config=/usr/share/grafana/conf/custom.ini >/dev/null 2>&1
tail -f /dev/null