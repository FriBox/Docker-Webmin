FROM ubuntu:22.04

MAINTAINER Stream.Wang <FriBox@Outlook.com>
LABEL version="1.00"
LABEL description="Webmin Service Docker image from FriBox customization."

ARG DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8 \ 
 TZ=Asia/Shanghai \ 
 WEBMIN_VERSION=1.941

#ADD webmin_1.994_all.deb /webmin_1.994_all.deb

RUN echo root:pass | chpasswd && \
 echo "Acquire::GzipIndexes \"false\"; Acquire::CompressionTypes::Order:: \"gz\";" >/etc/apt/apt.conf.d/docker-gzip-indexes && \
 sed -i s/archive.ubuntu.com/ftp.sjtu.edu.cn/g /etc/apt/sources.list && \
 sed -i s/security.ubuntu.com/ftp.sjtu.edu.cn/g /etc/apt/sources.list && \
 apt update && \
 apt -y upgrade && \
 apt -y dist-upgrade && \
 apt -y install ntp ntpdate net-tools iputils-ping wget python2 && \
 apt -y install perl libnet-ssleay-perl openssl libauthen-pam-perl libpam-runtime libio-pty-perl apt-show-versions unzip && \
 apt -y install libglib2.0-0 libglib2.0-data libicu70 libxml2 shared-mime-info xdg-user-dirs && \
 wget -e "http_proxy=http://192.168.100.253:6004" http://prdownloads.sourceforge.net/webadmin/webmin_1.994_all.deb && \
 dpkg --install webmin_1.994_all.deb && \
 apt -y install -f  && \
 apt -y autoclean && \
 apt -y autoremove && \
 apt -y autoremove --purge && \
 apt -y clean  && \
 rm -rf  webmin_1.994_all.deb  && \
 echo "" 

ENV LC_ALL C.UTF-8

EXPOSE 10000/tcp

VOLUME ["/etc/webmin"]

#ENTRYPOINT ["echo"," <-- [ FriBox - Webmin Service ] --> "]
CMD /usr/bin/touch /var/webmin/miniserv.log && /usr/sbin/service webmin restart && /usr/bin/tail -f /var/webmin/miniserv.log
