#!/bin/bash

echo "Starting WordPress setup..."
echo "Database: $SQL_DATABASE"
echo "User: $SQL_USER" 
echo "Domain: $DOMAIN_NAME"

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp


mkdir -p /var/www/html
cd /var/www/html
chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html


echo "Waiting for database..."
while ! mariadb -h mariadb -u"$SQL_USER" -p"$SQL_PASSWORD" "$SQL_DATABASE" -e "SELECT 1;" &>/dev/null; do
    echo "Database not ready, waiting..."
    sleep 5
done
echo "✅ Database is ready!"

if [ ! -f wp-load.php ]; then
    echo "Downloading WordPress..."
    wp core download --allow-root
fi

if [ ! -f wp-config.php ]; then
    echo "Creating wp-config.php..."
    wp config create \
        --dbname="$SQL_DATABASE" \
        --dbuser="$SQL_USER" \
        --dbpass="$SQL_PASSWORD" \
        --dbhost=mariadb:3306 \
        --allow-root
fi

if ! wp core is-installed --allow-root; then
    echo "Installing WordPress..."
    wp core install \
        --url=$DOMAIN_NAME \
        --title="$WP_TITLE" \
        --admin_user="$WP_ADMIN_USER" \
        --admin_password="$WP_ADMIN_PASSWORD" \
        --admin_email="$WP_ADMIN_EMAIL" \
        --allow-root
fi

if ! wp user get "$WP_USERNAME" --field=ID --allow-root &> /dev/null; then
    echo "Creating user: $WP_USERNAME"
    wp user create \
        "$WP_USERNAME" "$WP_USER_EMAIL" \
        --user_pass="$WP_USER_PASSWORD" \
        --role="$WP_USER_ROLE" \
        --allow-root
fi

echo "Configuring PHP-FPM..."
sed -i 's|^listen = .*|listen = 0.0.0.0:9000|' /etc/php/7.4/fpm/pool.d/www.conf

mkdir -p /run/php

echo "✅ Starting PHP-FPM..."
exec /usr/sbin/php-fpm7.4 -F

