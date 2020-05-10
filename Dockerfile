ARG PHP_VERSION
ARG IMAGE_NAME="php:${PHP_VERSION}-fpm"

FROM $IMAGE_NAME

ARG ENABLE_XDEBUG
ENV ENABLE_XDEBUG ${ENABLE_XDEBUG}

RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    vim \
    re2c \
    sendmail-bin \
    sendmail \
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
    libtool \
    libzip-dev

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
    pdo_mysql \
    opcache

RUN pecl install -o -f \
    apcu \
    xdebug

RUN docker-php-ext-enable apcu

WORKDIR /var/www/html

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN mkdir -p /tmp/xdebug/profile \
    && mkdir -p /tmp/xdebug/trace \
    && apt-get -y autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && usermod -a -G root www-data \
    && chown -R www-data ./

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN ["chmod", "+x", "/docker-entrypoint.sh"]
ENTRYPOINT ["/docker-entrypoint.sh"]
