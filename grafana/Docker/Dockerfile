FROM alpine:latest

RUN apk update\
	&& apk add wget

RUN wget https://dl.grafana.com/oss/release/grafana-7.3.7.linux-amd64.tar.gz\
	&& tar -zxvf grafana-7.3.7.linux-amd64.tar.gz\
	&& mv grafana-7.3.7 grafana
RUN mkdir =p /lib64\
	&& cp /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2
RUN mkdir -p /grafana/dashboards
ADD defaults.ini /grafana/conf/defaults.ini
COPY ./influxdb.yaml /grafana/conf/provisioning/datasources
COPY ./dashboard.json /grafana/dashboards
COPY ./dashboard-config.yaml /grafana/conf/provisioning/dashboards/default.yaml
RUN chmod 777 /grafana/conf/provisioning/datasources/influxdb.yaml
RUN rm -rf /grafana/conf/provisioning/dashboards/sample.yaml
RUN chmod 777 /grafana/conf/provisioning/dashboards/default.yaml
RUN chmod 777 /grafana/dashboards/dashboard.json
RUN rm /grafana/conf/provisioning/datasources/sample.yaml

EXPOSE 3000

CMD /grafana/bin/grafana-server --homepath=/grafana
