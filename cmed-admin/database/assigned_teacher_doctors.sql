/*
Navicat MySQL Data Transfer

Source Server         : nahian@bigm
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : bigm_cmed

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-01-07 18:12:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for assigned_teacher_doctors
-- ----------------------------
DROP TABLE IF EXISTS `assigned_teacher_doctors`;
CREATE TABLE `assigned_teacher_doctors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` int(4) DEFAULT NULL,
  `session` int(2) DEFAULT NULL,
  `module` int(11) DEFAULT NULL,
  `teacher_id` varchar(30) DEFAULT NULL,
  `doc_id` varchar(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
SET FOREIGN_KEY_CHECKS=1;
