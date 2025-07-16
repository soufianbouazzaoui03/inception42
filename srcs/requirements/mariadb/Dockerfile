FROM debian:bullseye

RUN apt-get update && apt-get install -y mariadb-server


COPY tools/db.sh /usr/local/bin/db.sh

RUN chmod +x /usr/local/bin/db.sh



EXPOSE 3306



ENTRYPOINT ["/usr/local/bin/db.sh" ]
