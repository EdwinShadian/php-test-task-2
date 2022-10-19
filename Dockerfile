FROM php:7.4-fpm-alpine AS base

ARG DEV=1

RUN apk update \
    && apk add ca-certificates wget \
    && update-ca-certificates
RUN apk add --no-cache curl
RUN docker-php-ext-install pdo \
    && docker-php-ext-install pdo_mysql
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

FROM base AS build

WORKDIR /var/www/app
COPY . .
RUN if [ $DEV -eq 1 ]; then \
      composer install --no-autoloader; \
    else \
      composer install --no-dev --no-autoloader;\
    fi \
    && composer dump-autoload -o

CMD ["php-fpm"]
