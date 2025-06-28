FROM debian:buster

RUN apt-get update && apt-get install -y \
    mariadb-server

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/db.sh /usr/local/bin/db.sh

RUN chmod +x /usr/local/bin/db.sh

CMD ["sh", "/usr/local/bin/db.sh"]