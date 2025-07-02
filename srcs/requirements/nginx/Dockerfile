FROM debian:buster

RUN apt-get update && apt-get install -y \
    nginx \
    openssl

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=soel-bou.42.fr/UID=soel-bou"

RUN mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/sites-available/default

RUN chmod 755 /var/run/nginx

RUN chown -R www-data:www-data /var/www/html

CMD ["nginx", "-g", "daemon off;"]



