FROM debian:11

ENV DEBIAN_FRONTEND=noninteractive

# Aggiorna il sistema e installa i pacchetti necessari
RUN apt-get update && apt-get install -y \
    apache2 \
    libapache2-mod-php \
    php \
    php-mysql \
    wget \
    tar \
    && apt-get clean

#installa WordPress
RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xzf latest.tar.gz && \
    rm latest.tar.gz && \
    mv wordpress/* /var/www/html/ && \
    rmdir wordpress

# Imposta i permessi
RUN chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html


# Avvia Apache
CMD ["apache2ctl", "-D", "FOREGROUND"]


