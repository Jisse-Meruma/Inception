#!bin/bash

# Check if the specified database (defined in .env) directory exists
if [ -d "/var/lib/mysql/$DB_NAME" ]; then 
    echo "Database already exists"
else
    {
        echo "FLUSH PRIVILEGES;"
        echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
        echo "CREATE USER IF NOT EXISTS $DB_USER@'localhost' IDENTIFIED BY '$DB_USER_PASSWORD';"
        echo "GRANT ALL ON *.* TO $DB_USER@'localhost' IDENTIFIED BY '$DB_USER_PASSWORD';"
        echo "FLUSH PRIVILEGES;"
    } | mysqld --bootstrap
fi

echo "executing mysql daemon"
exec mysqld
# using exec allows child processes to recieve the sigterm from docker stop,
# allowing for clean shutdowns