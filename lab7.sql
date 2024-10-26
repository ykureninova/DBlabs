-- Adminer 4.8.1 MySQL 5.5.5-10.3.32-MariaDB-1:10.3.32+maria~focal dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `categories` (`id`, `name`) VALUES
(1,	'Technology'),
(2,	'Science');

DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `content` text NOT NULL,
  `news_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `news_id` (`news_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`news_id`) REFERENCES `news` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `comments` (`id`, `content`, `news_id`) VALUES
(1,	'Interesting news!',	1),
(2,	'Incredible achievements!',	2);

DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `content` text NOT NULL,
  `categories_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_id` (`categories_id`),
  CONSTRAINT `news_ibfk_1` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `news` (`id`, `content`, `categories_id`) VALUES
(1,	'News about new technologies',	1),
(2,	'Science news',	2);

DROP TABLE IF EXISTS `ratings`;
CREATE TABLE `ratings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rating` int(11) DEFAULT NULL CHECK (`rating` between 1 and 5),
  `news_id` int(11) NOT NULL,
  `ip_adress` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `news_id` (`news_id`,`ip_adress`),
  CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`news_id`) REFERENCES `news` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `ratings` (`id`, `rating`, `news_id`, `ip_adress`) VALUES
(1,	5,	1,	'192.168.1.1'),
(2,	4,	2,	'192.168.1.2');
