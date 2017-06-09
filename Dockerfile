FROM php:7.1-fpm-alpine

LABEL MAINTAINER "k2leving@gmail.com"

RUN docker-php-ext-install pdo_mysql && \
  apk add --no-cache --update bash nano openssl vim && \
  curl -O https://getcomposer.org/composer.phar && \
  mv composer.phar /usr/local/bin/composer && \
  chmod 755 /usr/local/bin/composer && \
  wget https://phar.phpunit.de/phpunit.phar && \
  mv phpunit.phar /usr/local/bin/phpunit && \
  chmod 755 /usr/local/bin/phpunit && \
  echo "alias ll='ls -la'" > /root/.bashrc
