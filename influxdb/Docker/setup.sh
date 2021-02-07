# Start influxdb
/usr/sbin/influxd & sleep 3

# Initialize database
influx -execute "CREATE DATABASE grafana"
influx -execute "CREATE USER ljurdant WITH PASSWORD 'yo'"
influx -execute "GRANT ALL ON grafana TO ljurdant"

# Keep container running
tail -f /dev/null
