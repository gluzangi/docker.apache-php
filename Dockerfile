FROM php:7.1-apache
MAINTAINER Gerald Luzangi "gerald.luzangi@gmail.com"

RUN a2enmod rewrite
RUN apt-get update && apt-get install -y \
	libc-client-dev \
	libfreetype6-dev \
	libgeoip-dev \
	libjpeg62-turbo-dev \
	libmcrypt-dev \
	libmysqlclient18 \
	libicu-dev \
	libpq-dev \
	libsqlite3-dev \
	libpng12-dev \
	libkrb5-dev \
	libexpat1-dev \
	libxml2-dev \
	zlib1g-dev \
    && docker-php-ext-install -j$(nproc) exif iconv intl json mbstring mcrypt mysqli pgsql pdo pdo_mysql pdo_pgsql pdo_sqlite phar xmlrpc zip \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
    && docker-php-ext-configure xml --with-libxml-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd imap xml \
    && pecl install geoip-1.1.1 \
    && docker-php-ext-enable geoip

COPY config/php.ini /usr/local/etc/php/
