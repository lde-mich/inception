FROM debian:bookworm

ENV DEBIAN_FRONTEND=noninteractive

#installa i pacchetti necessari per WP
RUN apt-get update && \
    apt-get install -y \
    php-fpm \
    php-mysql \
    php-cli \
    php-curl \
    php-gd \
    php-mbstring \
    php-xml \
    php-xmlrpc \
    curl \
    wget \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Installa WP-CLI (wordpress-command line interface)
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

# Crea la directory se non esiste
RUN mkdir -p /var/www/html

#installa e configura WordPress
RUN curl -O https://wordpress.org/latest.tar.gz \
    && tar -zxvf latest.tar.gz \
    && mv wordpress/* /var/www/html/ \
    && chown -R www-data:www-data /var/www/html/ \
    && chmod -R 755 /var/www/html/

# www.conf 
COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf

#permessi
COPY ./tools/setup.sh /usr/local/bin/setup.sh
RUN chmod +x /usr/local/bin/setup.sh

#porta
EXPOSE 9000

#avvia setup.sh
CMD ["./usr/local/bin/setup.sh"]

# Avvia php-fpm
#CMD ["./usr/sbin/php-fpm8.2", "-F"]

#comando per far andare il container in loop
#CMD ["tail", "-f", "/dev/null"] 

