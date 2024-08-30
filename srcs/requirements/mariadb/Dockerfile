FROM debian:bullseye

RUN apt update -y && apt upgrade -y

RUN apt install -y\
	mariadb-server

# Store Temporary files like PID files and unix socket files
# change the owner of the directory to mysql user and root group
RUN mkdir -p /var/run/mysqld; chown -R mysql:root /var/run/mysqld

# Allows wordpress to connect using the name mariadb otherwise error establishing database connection
RUN sed 's/bind-address .*/bind-address = mariadb/' -i /etc/mysql/mariadb.conf.d/50-server.cnf

# Copy the script to initialize the database
COPY ./tools/init_mariadb.sh /home/

# Change the permissions of the script
RUN chmod 777 /home/init_mariadb.sh

CMD [ "/home/init_mariadb.sh" ]

