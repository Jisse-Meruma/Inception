FROM debian:bullseye

RUN apt update -y && apt upgrade -y
# gettext-base provides the envsubst command
RUN apt install -y\
	mariadb-server\
	gettext-base

# Not sure what this does, but removing it breaks mariadb
RUN mkdir -p /var/run/mysqld; chown -R mysql:root /var/run/mysqld

# Allows wordpress to connect using the name mariadb otherwise error establishing database connection
RUN sed 's/bind-address .*/bind-address = mariadb/' -i /etc/mysql/mariadb.conf.d/50-server.cnf

# Connect mariadb with the database_volume /var/lib/mysql
# we set up in docker-compose.yml
# RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

COPY ./tools/init_mariadb.sh /home/
COPY ./tools/init.sql /home/

RUN chmod 777 /home/init_mariadb.sh
RUN chmod 777 /home/init.sql

CMD [ "/home/init_mariadb.sh" ]

