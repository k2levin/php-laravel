Docker image with PHP (Laravel Framework)
========================================

[![Build Status](https://travis-ci.org/k2levin/php-laravel.svg?branch=master)](https://travis-ci.org/k2levin/php-laravel)

[![GitHub issues](https://img.shields.io/github/issues/k2levin/php-laravel.svg)](https://github.com/k2levin/php-laravel/issues)
[![GitHub stars](https://img.shields.io/github/stars/k2levin/php-laravel.svg)](https://github.com/k2levin/php-laravel/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/k2levin/php-laravel.svg)](https://github.com/k2levin/php-laravel/network)
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/k2levin/php-laravel/master/LICENSE)

[![Docker Build Statu](https://img.shields.io/docker/build/k2levin/php-laravel.svg)](https://hub.docker.com/r/k2levin/php-laravel/)
[![Docker Automated buil](https://img.shields.io/docker/automated/k2levin/php-laravel.svg)](https://hub.docker.com/r/k2levin/php-laravel/)
[![Docker Stars](https://img.shields.io/docker/stars/k2levin/php-laravel.svg)](https://hub.docker.com/r/k2levin/php-laravel/)
[![Docker Pulls](https://img.shields.io/docker/pulls/k2levin/php-laravel.svg)](https://hub.docker.com/r/k2levin/php-laravel/)

Base image from [alpine](https://hub.docker.com/_/alpine/)

Additional PHP extension list:
* ctype
* curl
* dom
* fileinfo
* fpm
* gd
* json
* mbstring
* pdo
* pdo_mysql
* phar
* session
* tokenizer
* xml
* xmlwriter

Additional tool list:
* apidoc
* bash
* bower
* composer
* git
* grunt-cli
* gulp-cli
* mysql-client
* nano
* nginx
* node
* npm
* python
* vim

Additional startup bash script list:
* ```alias ll='ls -la';```
* ```alias phpunittest='vendor/bin/phpunit --color=always';```
