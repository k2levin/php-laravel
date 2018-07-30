FROM alpine:latest

LABEL MAINTAINER "k2leving@gmail.com"

COPY ./files/.bashrc /root/

RUN apk add --no-cache --update alpine-sdk bash git libpng-dev mysql-client nano nginx nodejs nodejs-npm openrc openssh openssl php7 php7-ctype php7-curl php7-dom php7-fileinfo php7-fpm php7-gd php7-json php7-mbstring php7-pdo php7-pdo_mysql php7-phar php7-session php7-simplexml php7-tokenizer php7-xml php7-xmlwriter python tzdata vim && \
# composer installation
  curl -O https://getcomposer.org/composer.phar && mv composer.phar /usr/local/bin/composer && chmod 755 /usr/local/bin/composer && \
# node installation
  npm install -g apidoc bower grunt-cli gulp-cli && \
# openrc installation
  sed -i 's/#rc_provide="!net"/rc_provide="net"/g' /etc/rc.conf && sed -i 's/#rc_sys=""/rc_sys="lxc"/g' /etc/rc.conf && \
  sed -i 's/cgroup_add_service()/cgroup_add_service() { return 0 ; }\ncgroup_add_service_old()/g' /lib/rc/sh/rc-cgroup.sh && \
  rc-update add nginx default && rc-update add php-fpm7 default && \
# change timezone to UTC+08:00
  cp /usr/share/zoneinfo/Asia/Singapore /etc/localtime && echo 'Asia/Singapore' > /etc/timezone && apk del tzdata

EXPOSE 80 443

CMD ["/sbin/init"]
