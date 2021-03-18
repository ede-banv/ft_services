#!/bin/sh

rc-service telegraf start
rc-service influxdb start

echo "CREATE DATABASE ${IDB_NAME}" | influx
echo "CREATE USER ${IDB_USER} WITH PASSWORD '${IDB_PASSWORD}' WITH ALL PRIVILEGES" | influx

tail -f /dev/null