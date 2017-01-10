FROM php:7.1-apache
RUN apt-get update && apt-get install -y \
	libc-client-dev \
	libfreetype6-dev \
	libjpeg62-turbo-dev \
	libmcrypt-dev \
	libicu-dev \
	libpng12-dev \
	libkrb5-dev \
	libexpat1-dev \
	libxml2-dev \
	zlib1g-dev \
    && docker-php-ext-install -j$(nproc) exif iconv intl json mbstring mcrypt mysqli pdo phar xmlrpc \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
    && docker-php-ext-configure xml --with-libxml-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd imap xml 
#   && pecl install apcu \
#   && docker-php-ext-enable apcu

COPY config/php.ini /usr/local/etc/php/
