#!/bin/bash

#aspetta che il database sia attivo
echo "Waiting for database connection..."
until nc -z -v -w30 ${WORDPRESS_DB_HOST%:*} ${WORDPRESS_DB_HOST##*:}; do
    echo "Waiting for database connection..."
    sleep 5
done
echo "Database is up and running!"


# Configurare il database per WordPress
wp core config \
	--path=/var/www/html \
	--dbname=${WORDPRESS_DB_NAME} \
	--dbuser=${WORDPRESS_DB_USER} \
	--dbpass=${WORDPRESS_DB_PASSWORD} \
	--dbhost=${WORDPRESS_DB_HOST} \
	--allow-root

# Installare WordPress
wp core install \
	--path=/var/www/html \
	--url="http://localhost" \
	--title="Inception" \
	--admin_user="lde-mich" \
	--admin_password="lde-mich" \
	--admin_email="lde-mich@example.com" \
	--allow-root

