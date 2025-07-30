#!/bin/bash

service mariadb start

sleep 5

mariadb -uroot <<EOF
CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;
CREATE USER IF NOT EXISTS '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';
GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';
FLUSH PRIVILEGES;
EOF

mysqladmin -uroot shutdown

exec mariadbd --bind-address=0.0.0.0
