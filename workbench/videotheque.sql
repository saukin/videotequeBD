DROP DATABASE `videotheque`;
CREATE DATABASE `videotheque` DEFAULT CHARACTER SET utf8 ;
USE `videotheque` ;

-- -----------------------------------------------------
-- Table `videotheque`.`clients`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `videotheque`.`clients` ;

CREATE TABLE IF NOT EXISTS `videotheque`.`clients` (
  `client_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `client_created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`client_id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
;


-- -----------------------------------------------------
-- Table `videotheque`.`categories`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `videotheque`.`categories` ;

CREATE TABLE IF NOT EXISTS `videotheque`.`categories` (
  `categorie` VARCHAR(15) NOT NULL,
  `price` DECIMAL NOT NULL CHECK (`price` > 0),
  PRIMARY KEY (`categorie`))
;


-- -----------------------------------------------------
-- Table `videotheque`.`videos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `videotheque`.`videos` ;

CREATE TABLE IF NOT EXISTS `videotheque`.`videos` (
  `video_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `year` INT(4) NOT NULL,
  `categorie` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`video_id`),
  CONSTRAINT `fk_videos_categories1`
    FOREIGN KEY (`categorie`)
    REFERENCES `videotheque`.`categories` (`categorie`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
;


-- -----------------------------------------------------
-- Table `videotheque`.`orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `videotheque`.`orders` ;

CREATE TABLE IF NOT EXISTS `videotheque`.`orders` (
  `order_date` DATETIME NOT NULL,
  `rent_duration` INT NOT NULL DEFAULT 1 CHECK (`rent_duration` IN (1,3,7)),
  `client_id` INT NOT NULL, 
  `video_id` INT NOT NULL,
  CONSTRAINT `fk_orders_clients`
    FOREIGN KEY (`client_id`)
    REFERENCES `videotheque`.`clients` (`client_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_orders_videos`
    FOREIGN KEY (`video_id`)
    REFERENCES `videotheque`.`videos` (`video_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
;


-- -----------------------------------------------------
-- Table `videotheque`.`addresses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `videotheque`.`addresses` ;

CREATE TABLE IF NOT EXISTS `videotheque`.`addresses` (
  `address_id` INT NOT NULL AUTO_INCREMENT,
  `country` VARCHAR(20) NOT NULL,
  `province` VARCHAR(40) NULL,
  `city` VARCHAR(45) NOT NULL,
  `street` VARCHAR(45) NOT NULL,
  `building` INT(5) NOT NULL,
  `apt` INT(5) NULL,
  `zipcode` INT(6) NOT NULL,
  `client_id` INT NOT NULL,
  PRIMARY KEY (`address_id`),
  CONSTRAINT `fk_addresses_client_id`
    FOREIGN KEY (`client_id`)
    REFERENCES `videotheque`.`clients` (`client_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
;


-- -----------------------------------------------------
-- Table `videotheque`.`actors`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `videotheque`.`actors` ;

CREATE TABLE IF NOT EXISTS `videotheque`.`actors` (
  `actor_id` INT NOT NULL AUTO_INCREMENT,
  `a_last_name` VARCHAR(45) NOT NULL,
  `a_first_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`actor_id`))
;


-- -----------------------------------------------------
-- Table `videotheque`.`directors`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `videotheque`.`directors` ;

CREATE TABLE IF NOT EXISTS `videotheque`.`directors` (
  `director_id` INT NOT NULL AUTO_INCREMENT,
  `d_last_name` VARCHAR(45) NOT NULL,
  `d_first_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`director_id`))
;


-- -----------------------------------------------------
-- Table `videotheque`.`videos_actors`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `videotheque`.`videos_actors` ;

CREATE TABLE IF NOT EXISTS `videotheque`.`videos_actors` (
  `video_id` INT NOT NULL,
  `actor_id` INT NOT NULL,
  CONSTRAINT `fk_videos_has_actors_videos1`
    FOREIGN KEY (`video_id`)
    REFERENCES `videotheque`.`videos` (`video_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_videos_has_actors_actors1`
    FOREIGN KEY (`actor_id`)
    REFERENCES `videotheque`.`actors` (`actor_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
;


-- -----------------------------------------------------
-- Table `videotheque`.`videos_directors`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `videotheque`.`videos_directors` ;

CREATE TABLE IF NOT EXISTS `videotheque`.`videos_directors` (
  `video_id` INT NOT NULL,
  `director_id` INT NOT NULL,
  CONSTRAINT `fk_videos_has_directors_videos1`
    FOREIGN KEY (`video_id`)
    REFERENCES `videotheque`.`videos` (`video_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_videos_has_directors_directors1`
    FOREIGN KEY (`director_id`)
    REFERENCES `videotheque`.`directors` (`director_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
;


