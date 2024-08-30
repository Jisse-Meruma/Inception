#!bin/bash

# Check if the specified database (defined in .env) directory exists
if [ -d "/var/lib/mysql/$DB_NAME" ]; then 
    echo "Database already exists"
# If the database does not exist, create it and create a user with all privileges
else
    {
        echo "FLUSH PRIVILEGES;"
        echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
        echo "CREATE USER IF NOT EXISTS $DB_USER@'%' IDENTIFIED BY '$DB_USER_PASSWORD';"
        echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO $DB_USER@'%';"
        echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWORD';";
        echo "FLUSH PRIVILEGES;"
    } | mysqld --bootstrap
        fi

echo "executing mysql daemon"
exec mysqld
# using exec allows child processes to recieve the sigterm from docker stop,
# allowing for clean shutdowns