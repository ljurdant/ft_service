FROM alpine:latest

RUN apk add vsftpd
COPY vsftpd.conf /etc/vsftpd

EXPOSE 21
EXPOSE 20

CMD vsftpd
