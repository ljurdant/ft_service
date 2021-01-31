FROM alpine:latest

RUN apk update\
	&& apk add influxdb wget

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.2_linux_amd64.tar.gz\
	&& tar -xvf telegraf-1.17.2_linux_amd64.tar.gz 
ADD influxdb.conf /etc/influxdb/influxdb.conf

EXPOSE 8086

CMD influxd -config /etc/influxdb/influxdb.conf\
	&& influx -execute "CREATE DATABASE telegraf"\
	&& influx -execute "CREATE USER ljurdant WITH PASSWORD 'yo'"\
	&& influx -execute "GRANT ALL ON telegraf TO ljurdant"\
	&& tail -f /dev/null
