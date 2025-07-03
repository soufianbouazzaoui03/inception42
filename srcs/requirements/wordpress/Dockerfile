FROM debian:buster

RUN apt-get update && apt-get install -y \
        curl php-fpm php-mysql mariadb-client

# RUN wget http://wordpress.org/latest.tar.gz -P /var/www/

# RUN cd /var/www/ && \
#     tar -xzf latest.tar.gz && \
#     rm latest.tar.gz

# RUN chown -R root /var/www/wordpress

# RUN cd /usr/local/bin && \
#     curl -o wp -L https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
#     chmod +x wp

COPY tools/wp-entrypoint.sh /usr/local/bin/wp-entrypoint.sh

RUN chmod +x /usr/local/bin/wp-entrypoint.sh

ENTRYPOINT ["wp-entrypoint.sh"]

ENV $MARIADB_DATABASE DB
ENV $MARIADB_USER soel
ENV $MARIADB_PASSWORD 0000
ENV DOMAIN_NAME localhost
ENV WP_TITLE "Inception"
ENV WP_ADMIN_USER soel
ENV WP_ADMIN_PASSWORD 0000
ENV WP_ADMIN_EMAIL soufianbouazzaoui96@gmail.com

ENV WP_USERNAME soufaine
ENV WP_USER_EMAIL soufianbouazzaoui96@gmail.com
ENV WP_USER_PASSWORD 0000
ENV WP_USER_ROLE administrator
