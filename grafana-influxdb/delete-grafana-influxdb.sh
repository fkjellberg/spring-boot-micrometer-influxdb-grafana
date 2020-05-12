#!/bin/sh
docker network rm monitoring
docker volume rm grafana-volume
docker volume rm influxdb-volume
echo
docker network ls
echo
docker volume ls
