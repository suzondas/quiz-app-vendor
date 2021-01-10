/*
Navicat MySQL Data Transfer

Source Server         : Local
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : bigm_cmed

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-01-17 13:41:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for fellow_login_attempts
-- ----------------------------
DROP TABLE IF EXISTS `fellow_login_attempts`;
CREATE TABLE `fellow_login_attempts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for on_site_exam
-- ----------------------------
DROP TABLE IF EXISTS `on_site_exam`;
CREATE TABLE `on_site_exam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` int(4) DEFAULT NULL,
  `session` int(2) DEFAULT NULL,
  `module_id` int(11) DEFAULT NULL,
  `doc_id` int(11) DEFAULT NULL,
  `mcq` decimal(10,2) DEFAULT NULL,
  `mcq_obtained` decimal(10,2) DEFAULT NULL,
  `essay` decimal(10,2) DEFAULT NULL,
  `essay_obtained` decimal(10,2) DEFAULT NULL,
  `oral` decimal(10,2) DEFAULT NULL,
  `oral_obtained` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `total_obtained` decimal(10,2) DEFAULT NULL,
  `percent` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS=0;
