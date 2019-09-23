ARG PHP_VERSION
ARG IMAGE_NAME="php:${PHP_VERSION}-fpm"

FROM $IMAGE_NAME

RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    vim \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libxslt-dev \
    libicu-dev \
    libmcrypt-dev \
    libpng-dev \
    libxml2-dev

RUN docker-php-ext-configure gd \
    --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/;

RUN docker-php-ext-install bcmath \
    gd \
    intl \
    soap \
    xsl \
    zip \
    pdo_mysql \
    mcrypt

WORKDIR /var/www/html

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY ./magento /var/www/html

RUN find var generated vendor pub/static pub/media app/etc -type f -exec chmod g+w {} + \
    && find var generated vendor pub/static pub/media app/etc -type d -exec chmod g+ws {} + \
    && chown -R :www-data . \
    && chmod u+x bin/magento

RUN composer install
