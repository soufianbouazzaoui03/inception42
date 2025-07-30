FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y \
    curl \
    php7.4-fpm \
    php7.4-mysql \
    php7.4-curl \
    php7.4-gd \
    php7.4-intl \
    php7.4-mbstring \
    php7.4-soap \
    php7.4-xml \
    php7.4-xmlrpc \
    php7.4-zip \
    mariadb-client \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY tools/wp-entrypoint.sh /usr/local/bin/wp-entrypoint.sh
RUN chmod +x /usr/local/bin/wp-entrypoint.sh

RUN mkdir -p /var/www/html /run/php

EXPOSE 9000

ENTRYPOINT ["wp-entrypoint.sh"]

