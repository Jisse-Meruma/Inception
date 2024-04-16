FROM debian:12-slim

RUN apt-get update && apt-get install -y mariadb-server

RUN rm -rf /var/lib/apt/lists/*

COPY conf/mariadb.cnf /etc/mysql/mariadb.cnf

EXPOSE 3306

CMD [ "mysql" ]

