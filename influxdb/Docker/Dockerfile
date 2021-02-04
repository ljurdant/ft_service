
FROM alpine:latest

COPY setup.sh /

# Install influxdb
RUN apk update && \
	apk add --no-cache influxdb

# Installing and configuring telegraf
#RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.2_linux_amd64.tar.gz\
#	&& tar -xvf telegraf-1.17.2_linux_amd64.tar.gz\
#	&& mkdir -p /etc/telegraf\
#	&& mv /telegraf.conf /etc/telegraf\
#	&& mkdir =p /lib64\
#	&& cp /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

EXPOSE 8086

RUN chmod 777 setup.sh
CMD ./setup.sh
