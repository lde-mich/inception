#!/bin/bash

service mariadb start

echo "CREATE DATABASE mariadb;" | mariadb -u root

echo "CREATE USER 'lde-mich'@'localhost' IDENTIFIED BY 'root';" | mariadb -u root

echo "GRANT ALL PRIVILEGES ON mariadb.* TO 'lde-mich'@'localhost';" | mariadb -u root

echo "USE mariadb; CREATE TABLE IF NOT EXISTS \`Users\` (
    \`id\` INT NOT NULL AUTO_INCREMENT,
    \`username\` VARCHAR(45) NULL,
    \`password\` VARCHAR(45) NULL,
    PRIMARY KEY (\`id\`)
) ENGINE = InnoDB;" | mariadb -u root

echo "USE mariadb; INSERT INTO Users (username, password)
    VALUES ('lde-mich', 'lde-mich');" | mariadb -u root
echo "USE mariadb; INSERT INTO Users (username, password)
    VALUES ('luca', 'luca');" | mariadb -u root

service mariadb stop

