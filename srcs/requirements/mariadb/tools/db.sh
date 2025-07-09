#!/bin/bash

# Start MariaDB temporarily in the background
service mysql start

# Wait until the server is ready
sleep 10

echo "✅ MariaDB is up, configuring..."

# Print the variables (debug)
echo "Creating database: ${SQL_DATABASE}"
echo "Creating user: ${SQL_USER}"

# Run all SQL commands in a single clean block
mysql -uroot <<EOF
CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;
CREATE USER IF NOT EXISTS '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';
GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';
ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';
FLUSH PRIVILEGES;
EOF

# Shut down the temporary server
mysqladmin -uroot -p${SQL_ROOT_PASSWORD} shutdown

# Start MariaDB in the foreground (keep container alive)
exec mysqld --bind-address=0.0.0.0




# #!/bin/bash

# # Start MariaDB temporarily in the background
# service mysql start

# # Wait until the server is ready
# sleep 10

# echo "✅ MariaDB is up, configuring..."

# # Run SQL commands properly — you MUST quote the full command
# mysql -e CREATE DATABASE IF NOT EXISTS \${SQL_DATABSE}\;
# mysql -e CREATE USER IF NOT EXISTS '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';
# mysql -e GRANT ALL PRIVILEGES ON \${SQL_DATABSE}\.* TO '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';
# mysql -e ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';
# mysql -e FLUSH PRIVILEGES;

# # Shut down the temporary server
# mysqladmin -uroot -p$SQL_ROOT_PASSWORD shutdown

# # Shut down the temporary MariaDB instance
# mysqladmin -uroot -p${SQL_ROOT_PASSWORD} shutdown

# # Start MariaDB in the foreground (keep the container alive)
# exec mysqld --bind-address=0.0.0.0


