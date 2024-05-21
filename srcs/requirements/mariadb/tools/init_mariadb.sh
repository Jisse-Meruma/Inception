#!/bin/bash

# Exit immediately on command error
set -e

# Since /var/lib/mysql is the persistent volume,
# we don't need to do this every time the container boots,
if [ ! -d "/var/lib/mysql/$DB_NAME" ]; then
	echo "Initializing mariadb database"

	# envsubst fills the environment variables from init.sql
	# --bootstrap tells mariadbd to use its stdin
	echo "Bootstrapping mariadbd"
	< /home/init.sql envsubst | mariadbd --bootstrap

	echo "Initialized mariadb database"
else
	echo "mariadb database was already initialized"
fi

echo "Running mariadbd"
mariadbd