# service mysql start
# mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABSE}\`;"
# mysql -e "CREATE USER IF NOT EXISTS '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
# mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABSE}\`.* TO '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
# mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
# mysql -e "FLUSH PRIVILEGES;"
# mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown
# exec mysqld_safe


service mysql start
mysql -e "CREATE DATABASE IF NOT EXISTS \`DB\`;"
mysql -e "CREATE USER IF NOT EXISTS 'soel-bou'@'%' IDENTIFIED BY '0000';"
mysql -e "GRANT ALL PRIVILEGES ON \`DB\`.* TO 'soel-bou'@'%';"
mysql -e "FLUSH PRIVILEGES;"
mysqladmin -u root -p0000 shutdown
# exec mysqld_safe