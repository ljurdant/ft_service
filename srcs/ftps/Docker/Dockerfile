FROM alpine:latest

RUN apk add vsftpd openssl
RUN addgroup -g 1000 -S ljurdant
RUN adduser -u 1000 -D -G ljurdant -h /home/ljurdant -s /bin/false ljurdant
RUN chown ljurdant:ljurdant /home/ljurdant/ -R
RUN echo "ljurdant:yo" | /usr/sbin/chpasswd

#SSL
RUN		openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd-selfsigned.key -out /etc/ssl/certs/vsftpd-selfsigned.crt -subj "/C=FR/ST=./L=Paris/O=ljurdant/OU=./CN=192.168.49.240"

ADD  vsftpd2.conf /etc/vsftpd/vsftpd.conf
ADD vsftpd.chroot_list /etc/vsftpd.chroot_list

EXPOSE 21 20 30100 30101 30102 30103

CMD vsftpd /etc/vsftpd/vsftpd.conf 
