FROM debian:11

RUN apt-get update && apt-get install -y \
    nginx \
    openssl

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=localhost/UID=soel-bou"

RUN mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/conf.d/wp-conf.conf

RUN chmod 755 /var/run/nginx

RUN chown -R www-data:www-data /var/www/html

EXPOSE 8443

CMD ["nginx", "-g", "daemon off;"]



