FROM debian:12-slim

#Install MariaDB
RUN apt-get update && \
	apt-get install -y mariadb-server && \
	apt-get clean

# Clean up any unsessesary apt packeges to save up disk space.
RUN rm -rf /var/lib/apt/lists/*

# Copy the configuration setting for the MariaDB sever
COPY conf/mariadb.cnf /etc/mysql/mariadb.cnf

# Copy the SQL initialization script into the container
COPY init.sql /docker-entrypoint-initdb.d/init.sql

#Expose port 3306 to make sure mariadb can communicate to the Wordpress Server
EXPOSE 3306

CMD [ "mysql" ]

