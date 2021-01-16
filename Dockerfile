FROM alpine:3.7

LABEL MAINTAINER "k2leving@gmail.com"

COPY ./files/.bashrc /root/
COPY ./files/crond /etc/init.d/

RUN apk add --no-cache --update alpine-sdk bash git libpng-dev mysql-client nano nginx nodejs nodejs-npm openrc openssh openssl php7 php7-ctype php7-curl php7-dom php7-fileinfo php7-fpm php7-gd php7-json php7-mbstring php7-pdo php7-pdo_mysql php7-phar php7-session php7-simplexml php7-tokenizer php7-xml php7-xmlwriter php7-zip python tzdata vim && \
# composer setup
  curl -O https://getcomposer.org/composer.phar && mv composer.phar /usr/local/bin/composer && chmod 755 /usr/local/bin/composer && \
# php-fpm setup
  sed -i 's/user = nobody/user = 1000/1' /etc/php7/php-fpm.d/www.conf && \
# node setup
  npm install -g apidoc bower grunt-cli gulp-cli && \
# openrc setup
  sed -i 's/#rc_provide="!net"/rc_provide="net"/g' /etc/rc.conf && sed -i 's/#rc_sys=""/rc_sys="lxc"/g' /etc/rc.conf && \
  sed -i 's/cgroup_add_service()/cgroup_add_service() { return 0 ; }\ncgroup_add_service_old()/g' /lib/rc/sh/rc-cgroup.sh && \
  rc-update add crond default && rc-update add nginx default && rc-update add php-fpm7 default && \
# nginx configuration
  sed -i 's/worker_connections 1024;/worker_connections 32768;/g' /etc/nginx/nginx.conf && sed -i 's/http {/http {\n        # The size of request header (default 8k)\n        large_client_header_buffers 4 64k;\n/g' /etc/nginx/nginx.conf && \
# timezone to UTC+08:00
  cp /usr/share/zoneinfo/Asia/Singapore /etc/localtime && echo 'Asia/Singapore' > /etc/timezone && apk del tzdata

EXPOSE 80

CMD ["/sbin/init"]
