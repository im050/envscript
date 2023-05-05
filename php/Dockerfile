FROM php:7.4-fpm

# 国外服务器就不需要这个
# RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        zlib1g-dev \
        libzip-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install -j$(nproc) bcmath \
    && docker-php-ext-install zip

RUN apt-get install -y --no-install-recommends libgmp-dev && \
    rm -r /var/lib/apt/lists/* && \
    docker-php-ext-install -j$(nproc) gmp

RUN pecl install redis-5.1.1 \
    && docker-php-ext-enable redis

RUN docker-php-ext-install pdo_mysql && docker-php-ext-install mysqli

RUN curl -sS https://install.phpcomposer.com/installer | php -- --install-dir=/usr/local/bin --filename=composer

# 国外服务就不需要这个
# RUN composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/
