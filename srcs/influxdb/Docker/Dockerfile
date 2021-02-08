
FROM alpine:latest

COPY setup.sh /

# Install influxdb
RUN apk update && \
	apk add --no-cache influxdb
ADD influxdb.conf /etc/influxdb.conf

EXPOSE 8086

RUN chmod 777 setup.sh
CMD ./setup.sh
