FROM alpine:latest

RUN apk update upgrade\
	&& apk add influxdb

ADD influxdb.conf /etc/influxdb/influxdb.conf

EXPOSE 8086

CMD influxd -config /etc/influxdb/influxdb.conf && tail -f /dev/null
