#!/bin/bash

service mariadb start

echo "CREATE DATABASE IF NOT EXISTS mariadb;" | mariadb -u root
sleep .15

echo "CREATE USER IF NOT EXISTS 'lde-mich'@'%' IDENTIFIED BY 'root';" | mariadb -u root
sleep .15

echo "GRANT ALL PRIVILEGES ON mariadb.* TO 'lde-mich'@'%';" | mariadb -u root
sleep .15

service mariadb stop

