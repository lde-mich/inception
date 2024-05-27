FROM debian:bookworm

#copio gli argomenti passati nel docker-compose
#facendo una copia dei valori dentro le variabili d'ambiente
ARG WORDPRESS_DB_HOST
ENV WORDPRESS_DB_HOST ${WORDPRESS_DB_HOST}

ARG WORDPRESS_DB_USER
ENV WORDPRESS_DB_USER ${WORDPRESS_DB_USER}

ARG WORDPRESS_DB_PASSWORD
ENV WORDPRESS_DB_PASSWORD ${WORDPRESS_DB_PASSWORD}

ARG WORDPRESS_DB_NAME
ENV WORDPRESS_DB_NAME ${WORDPRESS_DB_NAME}

ENV DEBIAN_FRONTEND=noninteractive

#installa i pacchetti necessari per WP
RUN apt-get update && \
    apt-get install -y \
	netcat-traditional \
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

# Crea la directory target se non esiste
RUN mkdir -p /var/www/html

#installa e configura WordPress
RUN curl -O https://wordpress.org/latest.tar.gz \
    && tar -zxvf latest.tar.gz \
    && mv wordpress/* /var/www/html/ \
    && chown -R www-data:www-data /var/www/html/ \
    && chmod -R 755 /var/www/html/

#permessi
COPY ./tools/setup.sh /usr/local/bin/setup.sh
RUN chmod +x /usr/local/bin/setup.sh

#eseguire lo script
RUN /usr/local/bin/setup.sh 

#porta
EXPOSE 9000

# Avvia php-fpm
CMD ["./usr/sbin/php-fpm8.2", "-F"]

#comando per far andare il container in loop
#CMD ["tail", "-f", "/dev/null"] 

