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
(1,	1,	40),
(2,	1,	10),
(3,	2,	27),
(4,	2,	41),
(5,	3,	26),
(6,	3,	11);

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
(6,	'Шулявська',	1,	5),
(7,	'Політехнічний інститут',	1,	6),
(8,	'Вокзальна',	1,	7),
(9,	'Університет',	1,	8),
(10,	'Театральна',	1,	9),
(11,	'Хрещатик',	1,	10),
(12,	'Арсенальна',	1,	11),
(13,	'Дніпро',	1,	12),
(14,	'Гідропарк',	1,	13),
(15,	'Лівобережна',	1,	14),
(16,	'Дарниця',	1,	15),
(17,	'Чернігівська',	1,	16),
(18,	'Лісова',	1,	17),
(19,	'Героїв Дніпра',	2,	NULL),
(20,	'Мінська',	2,	19),
(21,	'Оболонь',	2,	20),
(22,	'Почайна',	2,	21),
(23,	'Тараса Шевченка',	2,	22),
(24,	'Контрактова площа',	2,	23),
(25,	'Поштова площа',	2,	24),
(26,	'Майдан Незалежності',	2,	25),
(27,	'Площа Українських Героїв',	2,	26),
(28,	'Олімпійська',	2,	27),
(29,	'Палац «Україна»',	2,	28),
(30,	'Либідська',	2,	29),
(31,	'Деміївська',	2,	30),
(32,	'Голосіївська',	2,	31),
(33,	'Васильківська',	2,	32),
(34,	'Виставковий центр',	2,	33),
(35,	'Іподром',	2,	34),
(36,	'Теремки',	2,	35),
(37,	'Сирець',	3,	NULL),
(38,	'Дорогожичі',	3,	37),
(39,	'Лукянівська',	3,	38),
(40,	'Золоті ворота',	3,	39),
(41,	'Палац спорту',	3,	40),
(42,	'Кловська',	3,	41),
(43,	'Печерська',	3,	42),
(44,	'Звіринецька',	3,	43),
(45,	'Видубичі',	3,	44),
(46,	'Славутич',	3,	45),
(47,	'Осокорки',	3,	46),
(48,	'Позняки',	3,	47),
(49,	'Харківська',	3,	48),
(50,	'Вирлиця',	3,	49),
(51,	'Бориспільська',	3,	50),
(52,	'Червоний хутір',	3,	51);

-- 2024-11-11 15:20:59