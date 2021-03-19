#!/bin/sh

sed s/__DB_NAME__/$IDB_NAME/g /etc/telegraf.conf -i
sed s/__DB_USER__/$IDB_USER/g /etc/telegraf.conf -i
sed s/__DB_PASSWORD__/$IDB_PASSWORD/g /etc/telegraf.conf -i

rc-service influxdb start
rc-service telegraf start

echo "CREATE DATABASE ${IDB_NAME}" | influx
echo "CREATE USER ${IDB_USER} WITH PASSWORD '${IDB_PASSWORD}' WITH ALL PRIVILEGES" | influx

tail -f /dev/null