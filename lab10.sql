-- Adminer 4.8.1 MySQL 5.5.5-10.3.32-MariaDB-1:10.3.32+maria~focal dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `connections`;
CREATE TABLE `connections` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `station_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `station_id` (`station_id`),
  CONSTRAINT `connections_ibfk_1` FOREIGN KEY (`station_id`) REFERENCES `stations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `connections` (`id`, `group_id`, `station_id`) VALUES
(1,	1,	2),
(2,	1,	8),
(3,	2,	1),
(4,	2,	7),
(5,	3,	4),
(6,	3,	13);

DROP TABLE IF EXISTS `lines`;
CREATE TABLE `lines` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `lines` (`id`, `name`, `color`) VALUES
(1,	'Святошинсько-Броварська',	'червоний'),
(2,	'Оболонсько-Теремківська',	'синій'),
(3,	'Сирецько-Печерська',	'зелений');

DROP TABLE IF EXISTS `stations`;
CREATE TABLE `stations` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `line_id` int(11) NOT NULL,
  `previous_station` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `line_id` (`line_id`),
  KEY `stations_ibfk_2` (`previous_station`),
  CONSTRAINT `stations_ibfk_1` FOREIGN KEY (`line_id`) REFERENCES `lines` (`id`),
  CONSTRAINT `stations_ibfk_2` FOREIGN KEY (`previous_station`) REFERENCES `stations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `stations` (`id`, `name`, `line_id`, `previous_station`) VALUES
(1,	'Академмістечко',	1,	NULL),
(2,	'Житомирська',	1,	1),
(3,	'Святошин',	1,	2),
(4,	'Нивки',	1,	3),
(5,	'Берестейська',	1,	4),
(6,	'Героїв Дніпра',	2,	NULL),
(7,	'Мінська',	2,	6),
(8,	'Оболонь',	2,	7),
(9,	'Почайна',	2,	8),
(10,	'Тараса Шевченка',	2,	9),
(11,	'Сирець',	3,	NULL),
(12,	'Дорогожичі',	3,	11),
(13,	'Лукянівська',	3,	12),
(14,	'Золоті ворота',	3,	12),
(15,	'Палац спорту',	3,	14);

-- 2024-11-11 15:45:47