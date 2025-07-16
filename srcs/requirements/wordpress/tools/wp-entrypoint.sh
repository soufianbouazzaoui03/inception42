#!/bin/bash

echo $MARIADB_DATABASE
echo $MARIADB_USER
echo $MARIADB_PASSWORD
echo $DOMAIN_NAME

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

mkdir -p /var/www/html
cd /var/www/html
chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html

if [ ! -f wp-load.php ]; then
  wp core download --allow-root
fi

if [ ! -f wp-config.php ]; then
  wp config create \
    --dbname="$MARIADB_DATABASE" \
    --dbuser="$MARIADB_USER" \
    --dbpass="$MARIADB_PASSWORD" \
    --dbhost=mariadb:3306 \
    --allow-root
fi

if ! wp core is-installed --allow-root; then
  wp core install \
    --url="$DOMAIN_NAME" \
    --title="$WP_TITLE" \
    --admin_user="$WP_ADMIN_USER" \
    --admin_password="$WP_ADMIN_PASSWORD" \
    --admin_email="$WP_ADMIN_EMAIL" \
    --allow-root
fi

if ! wp user get "$WP_USERNAME" --field=ID --allow-root &> /dev/null; then
  wp user create \
    "$WP_USERNAME" "$WP_USER_EMAIL" \
    --user_pass="$WP_USER_PASSWORD" \
    --role="$WP_USER_ROLE" \
    --allow-root
fi

sed -i 's|^listen = .*|listen = 9000|' /etc/php/7.4/fpm/pool.d/www.conf
mkdir -p /run/php

exec /usr/sbin/php-fpm7.4 -F

