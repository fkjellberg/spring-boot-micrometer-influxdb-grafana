#!/bin/sh
docker network create monitoring
docker volume create grafana-volume
docker volume create influxdb-volume
echo
docker network ls
echo
docker volume ls

echo
echo Initialize InfluxDB database
docker run --rm \
    -e INFLUXDB_DB=influxdb \
    -e INFLUXDB_USER=influxdb \
    -e INFLUXDB_USER_PASSWORD=influxdb \
    -v influxdb-volume:/var/lib/influxdb \
    influxdb:1.7.10-alpine /init-influxdb.sh
