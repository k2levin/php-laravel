FROM alpine:latest

LABEL MAINTAINER "k2leving@gmail.com"

COPY ./files/.bashrc /root/

RUN apk add --no-cache --update alpine-sdk bash git libpng-dev mysql-client nano nginx openrc openssh openssl php7 php7-ctype php7-curl php7-dom php7-fpm php7-gd php7-json php7-mbstring php7-pdo php7-pdo_mysql php7-phar php7-session php7-tokenizer php7-xml php7-xmlwriter python vim yarn && \
# composer installation
  curl -O https://getcomposer.org/composer.phar && \
  mv composer.phar /usr/local/bin/composer && \
  chmod 755 /usr/local/bin/composer && \
# node installation
  yarn global add apidoc bower grunt gulp && \
# openrc installation
  mkdir /run/mysqld mkdir /run/openrc && mkdir /run/nginx && touch /run/openrc/softlevel && echo 'rc_provide="net"' >> /etc/rc.conf && sed -i 's/cgroup_add_service /# cgroup_add_service /g' /lib/rc/sh/openrc-run.sh && \
  sed -i '/tty/d' /etc/inittab && sed -i 's/mount -t tmpfs/# mount -t tmpfs/g' /lib/rc/sh/init.sh && sed -i 's/#rc_sys=""/rc_sys="lxc"/g' /etc/rc.conf && \
  rc-update add nginx default && rc-update add php-fpm7 default

EXPOSE 80

CMD ["/sbin/init"]
