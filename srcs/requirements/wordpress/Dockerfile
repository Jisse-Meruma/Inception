FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y curl mariadb-client php7.4 php7.4-fpm php7.4-mysql && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html

# Download wp-cli PHP Archive to /usr/local/bin/
ADD https://raw.githubusercontent.com/wp-cli/builds/3e345df698faea02d64baebcb2fa6fc523231494/phar/wp-cli-release.phar /usr/local/bin/wp-cli

# Allow executing wp-cli
RUN chmod +x /usr/local/bin/wp-cli

RUN mkdir /run/php

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/
RUN sed -i "s/listen.*/listen = 9000/g" /etc/php/7.4/fpm/pool.d/www.conf

COPY ./tools/setup_php_logins.sh /home/

# Expose port 9000 for PHP-FPM
EXPOSE 9000
CMD [ "/home/setup_php_logins.sh" ]