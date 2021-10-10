#!/bin/bash

## debain 10 : buster

## env base
> install lnmp 1.8 (php 7.4, mysql 8.0, nginx ...)

## ref.
https://tomthorp.me/blog/installing-php-56-source-yields-segmentation-fault

## env update
sudo apt update
sudo apt install \
    wget git vim zip unzip bzip2

## php 5.6 need low supporter
### openssl 1.0.2u
curl -O https://www.openssl.org/source/old/1.0.2/openssl-1.0.2u.tar.gz
tar xf openssl-1.0.2u.tar.gz
cd openssl-1.0.2u
./config --prefix=/opt/openssl-1.0.2u
make
sudo make install

### libiconv
wget https://ftp.gnu.org/pub/gnu/libiconv/libiconv-1.16.tar.gz
tar xvzf libiconv-1.16.tar.gz && cd libiconv-1.16
./configure --prefix=/usr/local/libiconv-1.16
make
sudo make install

### imap extension (to fix php.phar building error)
sudo apt-get install php5-imap
sudo php5enmod imap

## php 5.6.40 (10 Jan 2019)
### https://www.php.net/releases/
wget https://www.php.net/distributions/php-5.6.40.tar.bz2
tar xvjf php-5.6.40.tar.bz2 && cd php-5.6.40
./configure --prefix=/usr/local/php5 --enable-sockets=shared --enable-fpm --enable-mysqlnd --with-mysql=/usr/local/mysql --with-mysqli --with-pdo-mysql --with-zlib --with-curl --with-gd --with-jpeg-dir --with-png-dir --with-openssl=/opt/openssl-1.0.2u --enable-mbstring --enable-xml --enable-session --enable-ftp --enable-pdo --with-freetype-dir=no --enable-sockets --enable-sysvsem --enable-sysvshm --with-iconv-dir=/usr/local/libiconv-1.16 --with-bz2 --with-zlib --with-fpm-user=www-data --with-fpm-group=www-data
vim Makefile
加上 -liconv
```
...
EXTRA_LIBS = -lcrypt -lcrypto -lssl -lcrypto ...  -lxml2 -lxml2 -lcrypt -liconv
...
```
make ... fail

