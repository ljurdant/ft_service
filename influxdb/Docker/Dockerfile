FROM alpine:latest

RUN apk update upgrade\
	&& apk add influxdb openrc
RUN mkdir -p /etc/influxdb
ADD influxdb.conf /etc/influxdb/influxdb.conf
RUN chown influxdb:influxdb /etc/influxdb/*
RUN mkdir -p /var/lib/influxdb
RUN chown influxdb:influxdb /var/lib/influxdb

EXPOSE 8086
RUN influxd
CMD influx -execute "CREATE DATABASE influxdb" && \
	influx -execute "CREATE USER ljurdant WITH PASSWORD 'yo'" && \
	influx -execute "GRANT ALL ON influxdb TO ljurdant"
