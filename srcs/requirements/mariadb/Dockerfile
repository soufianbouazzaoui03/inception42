FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    mariadb-server \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/mysqld && \
    chown mysql:mysql /var/run/mysqld && \
    chmod 755 /var/run/mysqld

# Create socket directory and set permissions
# RUN mkdir -p /var/run/mysqld && \
#     chown mysql:mysql /var/run/mysqld && \
#     chmod 755 /var/run/mysqld

# COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/db.sh /usr/local/bin/db.sh

RUN chmod +x /usr/local/bin/db.sh



EXPOSE 3306



ENTRYPOINT ["/usr/local/bin/db.sh" ]
