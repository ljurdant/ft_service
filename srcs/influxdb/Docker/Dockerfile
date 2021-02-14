
FROM alpine:latest

COPY setup.sh /

# Install influxdb
RUN apk update && \
	apk add influxdb
ADD influxdb.conf /etc/influxdb.conf

#RUN /usr/sbin/influxd & sleep 3
#RUN influx -execute "CREATE DATABASE grafana"
#RUN influx -execute "CREATE USER ljurdant WITH PASSWORD 'yo'"
#RUN influx -execute "GRANT ALL ON grafana TO ljurdant"

#RUN mkdir -p /var/lib/influxdb/data
#RUN mkdir -p /var/lib/influxdb/wal
#RUN mkdir -p /var/lib/influxdb/meta
EXPOSE 8086

RUN chmod 777 setup.sh
CMD ./setup.sh
