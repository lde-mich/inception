FROM debian:11

ENV DEBIAN_FRONTEND=noninteractive

# Aggiorna il sistema e installa i pacchetti necessari
RUN apt-get update && apt-get install -y \
    nginx \
    php-fpm \
    php-mysql \
    php-gd \
    php-xml \
    php-mbstring \
    php-curl \
    mariadb-client \
    curl \
    tar \
    && apt-get clean

# conf php-fpm
RUN sed -i 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/' /etc/php/*/fpm/php.ini

#installa WordPress
RUN curl -o /tmp/latest.tar.gz https://wordpress.org/latest.tar.gz \
    && tar -xzf /tmp/latest.tar.gz -C /var/www/html --strip-components=1 \
    && rm /tmp/latest.tar.gz \
    && chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Imposta i permessi
RUN chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html

RUN	mkdir /run/php

#porta
EXPOSE 9000

# Avvia php-fpm
CMD ["./usr/sbin/php-fpm7.4", "-F"]


