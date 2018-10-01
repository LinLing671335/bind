FROM docker.demigame.com/base/debian:8.10v6
MAINTAINER linling <ling.lin@cilugame.com>
RUN apt-get update \
 && apt-get install -y bind9 dnsutils \
 && apt-get clean \
 && rm -rf /etc/bind/named.conf.local \
 && rm -rf /etc/bind/named.conf \
 && rm -rf /etc/bind/named.conf.options \
 && mkdir -p /home/nucleus-oc/bind/ \
 && mv /etc/bind/bind.keys /etc/bind/bind.keys.back 
EXPOSE 53
CMD ["/usr/sbin/named","-f","-u","bind","-c", "/home/nucleus-oc/bind/etc/named.conf"]

