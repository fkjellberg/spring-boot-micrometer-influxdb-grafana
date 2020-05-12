## Run Grafana and InfluxDB using Docker

This folder contains some scripts and a docker-compose file to run Grafana and InfluxDB locally
in Docker when developing and testing the application in local mode.

Run the following script to create docker network, volumes and initialize the InfluxDB database.

    ./init-grafana-influxdb.sh

Start Grafana and InfluxDB:

    ./start-grafana-influxdb.sh

Stop Grafana and InfluxDB:

    ./stop-grafana-influxdb.sh

If the Grafana and InfluxDB setup is not needed anymore, it can be deleted. The following script will
remove the docker network and persisted volumes.

    ./delete-grafana-influxdb.sh

## Grafana

Go to Grafana using url http://localhost:3000/ and login with user **grafana** and password **grafana**. The following InfluxDB
data source is automatically provisioned.

* URL: http://influxdb:8086
* Database: influxdb
* User: influxdb
* Password: influxdb

## InfluxDB

InfluxDB queries:

    curl -s -G 'http://localhost:8086/query?pretty=true' --data-urlencode 'db=influxdb' --data-urlencode 'q=SHOW DATABASES'

    curl -s -G 'http://localhost:8086/query?pretty=true' --data-urlencode 'db=influxdb' --data-urlencode 'q=SHOW SERIES'

    curl -s -G 'http://localhost:8086/query?pretty=true' --data-urlencode 'db=influxdb' --data-urlencode 'q=SHOW SERIES ON influxdb WHERE time < now() - 1d'

    curl -s -G 'http://localhost:8086/query?pretty=true' --data-urlencode 'db=influxdb' --data-urlencode 'q=SELECT sum("value") FROM "hello" WHERE time >= now() - 10m GROUP BY time(1m) fill(null)'

    curl -s -G 'http://localhost:8086/query?pretty=true' --data-urlencode 'db=influxdb' --data-urlencode "q=SELECT sum("value") FROM \"jvm_memory_used\" WHERE time >= now() - 15m GROUP BY time(1m) fill(null)"
    curl -s -G 'http://localhost:8086/query?pretty=true' --data-urlencode 'db=influxdb' --data-urlencode "q=SELECT sum("value") FROM \"jvm_memory_used\" WHERE (\"area\" = 'heap') AND time >= now() - 15m GROUP BY time(1m) fill(null)"
