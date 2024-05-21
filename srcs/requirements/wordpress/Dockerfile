FROM debian:12-slim

RUN apt-get update && \
    apt-get install -y php php-fpm php-mysql && \
    apt-get install wget -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Download and extract WordPress
RUN wget -qO- https://wordpress.org/latest.tar.gz | tar xvz -C /var/www/html --strip-components=1

# Download wp-cli PHP Archive to /usr/local/bin/
ADD https://raw.githubusercontent.com/wp-cli/builds/3e345df698faea02d64baebcb2fa6fc523231494/phar/wp-cli-release.phar /usr/local/bin/wp-cli

# Allow executing wp-cli
RUN chmod +x /usr/local/bin/wp-cli


COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

COPY ./tools/setup_php_logins.sh /home/

# Expose port 9000 for PHP-FPM
EXPOSE 9000

# Start Setup_php_login Script
CMD [ "./home/setup_php_logins.sh" ]