-- Adminer 4.1.0 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `ref_religion_id` int(3) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `born` varchar(50) DEFAULT NULL,
  `birthDay` date DEFAULT NULL,
  `gender` tinyint(1) DEFAULT '1',
  `phone` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` text,
  `photo` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tb_employee_ref_religion1` (`ref_religion_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`ref_religion_id`) REFERENCES `ref_religion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `ref_religion`;
CREATE TABLE `ref_religion` (
  `id` int(3) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `ref_religion` (`id`, `name`, `status`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(0,	'-',	1,	NULL,	NULL,	NULL,	NULL),
(1,	'Islam',	1,	'2014-04-18 13:31:10',	1,	NULL,	NULL),
(2,	'Kristen Katolik',	1,	'2014-04-18 13:31:10',	1,	NULL,	NULL),
(3,	'Kristen Protestan',	1,	'2014-04-18 13:31:10',	1,	NULL,	NULL),
(4,	'Hindu',	1,	'2014-04-18 13:31:10',	1,	NULL,	NULL),
(5,	'Budha',	1,	'2014-04-18 13:31:10',	1,	NULL,	NULL),
(6,	'Konghucu',	1,	'2014-04-18 13:31:10',	1,	NULL,	NULL);

DROP TABLE IF EXISTS `training`;
CREATE TABLE `training` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `start` date DEFAULT NULL,
  `finish` date DEFAULT NULL,
  `note` text,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` int(2) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` varchar(20) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `user` (`id`, `username`, `password`, `role`, `name`, `last_login`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1,	'admin',	'21232f297a57a5a743894a0e4a801fc3',	0,	'Super Admin',	'2016-03-25 23:04:54',	'2015-12-22 23:06:00',	'admin',	'2016-03-25 23:04:54',	NULL);

-- 2016-03-25 16:06:00
