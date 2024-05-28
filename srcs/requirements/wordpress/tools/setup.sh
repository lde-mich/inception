#!/bin/bash

cd /var/www/html/

wp core download --version=6.5 --allow-root

# Configurare il database per WordPress
wp config create \
	--path=/var/www/html \
	--dbname=${WORDPRESS_DB_NAME} \
	--dbuser=${WORDPRESS_DB_USER} \
	--dbpass=${WORDPRESS_DB_PASSWORD} \
	--dbhost=${WORDPRESS_DB_HOST} \
	--allow-root

mv /var/www/html/wp-config-sample.php wp-config.php

# Installare WordPress
wp core install \
	--path=/var/www/html \
	--url="http://localhost" \
	--title="Inception" \
	--admin_user="lde-mich" \
	--admin_password="lde-mich" \
	--admin_email="lde-mich@example.com" \
	--allow-root

# Avviare php-fpm
/usr/sbin/php-fpm8.2 -F

