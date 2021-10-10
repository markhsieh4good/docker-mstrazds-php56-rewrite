#!/bin/bash

## debain 10 : buster

## env base
> install lnmp 1.8 (php 7.4, mysql 8.0, nginx ...)

## env update
sudo apt update
sudo apt install \
    wget git vim zip unzip bzip2

## php 5.6 need low supporter
$ curl -O https://www.openssl.org/source/old/1.0.2/openssl-1.0.2u.tar.gz
$ tar xf openssl-1.0.2u.tar.gz
$ cd openssl-1.0.2u
$ ./config --prefix=/opt/openssl-1.0.2u
$ make
$ sudo make install

## php 5.6.40 (10 Jan 2019)
### https://www.php.net/releases/
wget https://www.php.net/distributions/php-5.6.40.tar.bz2
tar xvjf php-5.6.40.tar.bz2 && cd php-5.6.40
./configure --prefix=/usr/local/php5 --enable-fpm --enable-mysqlnd --with-mysql=/usr/local/mysql --with-mysqli --with-pdo-mysql --with-zlib --with-curl --with-gd --with-jpeg-dir --with-png-dir --with-openssl=/opt/openssl-1.0.2u --enable-mbstring --enable-xml --enable-session --enable-ftp --enable-pdo --with-freetype-dir=no --enable-sockets --enable-sysvsem --enable-sysvshm --with-fpm-user=www-data --with-fpm-group=www-data

