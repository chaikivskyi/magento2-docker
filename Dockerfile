ARG PHP_VERSION
ARG IMAGE_NAME="php:${PHP_VERSION}-fpm"

FROM $IMAGE_NAME

RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    vim \
    re2c \
    autoconf \
    automake \
    shtool \
    graphviz \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libxslt-dev \
    libicu-dev \
    libmcrypt-dev \
    libpng-dev \
    libxml2-dev \
    libpcre3-dev \
    libssl-dev \
    libtool

RUN docker-php-ext-configure gd \
    --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/;

RUN docker-php-ext-install bcmath \
    gd \
    simplexml \
    sockets \
    intl \
    soap \
    xsl \
    zip \
    pdo_mysql

RUN pecl install xdebug && docker-php-ext-enable xdebug

WORKDIR /var/www/html

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY ./src /var/www/html

RUN chown -R www-data:www-data /var/www/html \
    && mkdir -p /tmp/xdebug/profile \
    && mkdir -p /tmp/xdebug/trace \
    && chown -R www-data:www-data /tmp/ \
    && apt-get -y autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

