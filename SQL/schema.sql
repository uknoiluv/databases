DROP DATABASE chat;
CREATE DATABASE chat;

USE chat;

-- CREATE TABLE messages (
--   Describe your table here.
-- );

/* You can also create more tables, if you need them... */

/*  Execute this file from the command line by typing:
 *    mysql < schema.sql
 *  to create the database and the tables.*/










-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'Messages'
--
-- ---

DROP TABLE IF EXISTS `Messages`;

CREATE TABLE `Messages` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `user` VARCHAR(20) NULL DEFAULT NULL,
  `text` VARCHAR(200) NULL DEFAULT NULL,
  `time stamp` DATETIME(6) NULL DEFAULT NULL,
  `room` VARCHAR(50) NULL DEFAULT NULL,
  `id_rooms` INTEGER NULL DEFAULT NULL,
  `id_Users` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Users'
--
-- ---

DROP TABLE IF EXISTS `Users`;

CREATE TABLE `Users` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `name` MEDIUMTEXT NULL DEFAULT NULL,
  `messages` VARCHAR(200) NULL DEFAULT NULL,
  `room` VARCHAR(20) NULL DEFAULT NULL,
  `friends` VARCHAR(20) NULL DEFAULT NULL,
  `id_rooms` INTEGER NULL DEFAULT NULL,
  `id_Friends` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'rooms'
--
-- ---

DROP TABLE IF EXISTS `rooms`;

CREATE TABLE `rooms` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `messages` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Friends'
--
-- ---

DROP TABLE IF EXISTS `Friends`;

CREATE TABLE `Friends` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `users` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Foreign Keys
-- ---

ALTER TABLE `Messages` ADD FOREIGN KEY (id_rooms) REFERENCES `rooms` (`id`);
ALTER TABLE `Messages` ADD FOREIGN KEY (id_Users) REFERENCES `Users` (`id`);
ALTER TABLE `Users` ADD FOREIGN KEY (id_rooms) REFERENCES `rooms` (`id`);
ALTER TABLE `Users` ADD FOREIGN KEY (id_Friends) REFERENCES `Friends` (`id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `Messages` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Users` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `rooms` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Friends` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `Messages` (`id`,`user`,`text`,`time stamp`,`room`,`id_rooms`,`id_Users`) VALUES
-- ('','','','','','','');
-- INSERT INTO `Users` (`id`,`name`,`messages`,`room`,`friends`,`id_rooms`,`id_Friends`) VALUES
-- ('','','','','','','');
-- INSERT INTO `rooms` (`id`,`messages`) VALUES
-- ('','');
-- INSERT INTO `Friends` (`id`,`users`) VALUES
-- ('','');

