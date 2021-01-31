FROM alpine:latest

RUN apk update\
	&& apk add wget

#Grafana
RUN wget https://dl.grafana.com/oss/release/grafana-7.3.7.linux-amd64.tar.gz\
	&& tar -zxvf grafana-7.3.7.linux-amd64.tar.gz\
	&& mv grafana-7.3.7 grafana
RUN mkdir =p /lib64\
	&& cp /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2
ADD defaults.ini /grafana/conf/defaults.ini


#Telegraf
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.2_linux_amd64.tar.gz\
	&& tar -xvf telegraf-1.17.2_linux_amd64.tar.gz 
RUN mkdir -p /etc/telegraf
ADD telegraf.conf /etc/telegraf

EXPOSE 3000

CMD /grafana/bin/grafana-server --homepath=/grafana
