
CREATE DATABASE mariadb;

CREATE USER 'lde-mich'@'localhost' IDENTIFIED BY 'root';
GRANT ALL PRIVILEGES ON mariadb.* TO 'lde-mich'@'localhost';

USE mariadb;

CREATE TABLE IF NOT EXISTS `Users`
(
	`id` INT NOT NULL AUTO_INCREMENT,
	`username` VARCHAR(45) NULL,
	`password` VARCHAR(45) NULL,
	 PRIMARY KEY (`id`)
)
ENGINE = InnoDB;


INSERT INTO Users VALUES ('lde-mich', 'lde-mich'); /* utente admin */
INSERT INTO Users VALUES ('luca', 'luca'); /* utente di prova*/


