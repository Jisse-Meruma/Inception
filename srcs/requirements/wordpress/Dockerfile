FROM debian:12-slim

RUN apt-get update && \
    apt-get install -y php php-fpm php-mysql && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Download and extract WordPress
RUN wget -qO- https://wordpress.org/latest.tar.gz | tar xvz -C /var/www/html --strip-components=1



# Expose port 9000 for PHP-FPM
EXPOSE 9000

# Start PHP-FPM service
CMD ["php-fpm7.4", "--nodaemonize"]