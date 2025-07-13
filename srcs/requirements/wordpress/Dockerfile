FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y curl php-fpm php-mysql mariadb-client

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

EXPOSE 9000

ENTRYPOINT ["wp-entrypoint.sh"]

