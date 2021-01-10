/*
Navicat MySQL Data Transfer

Source Server         : Local
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : bigm_genesis

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-01-23 12:37:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sif_doc_notice
-- ----------------------------
DROP TABLE IF EXISTS `sif_doc_notice`;
CREATE TABLE `sif_doc_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` varchar(4) DEFAULT NULL,
  `session` int(2) DEFAULT NULL,
  `course_code` int(2) DEFAULT NULL,
  `batch_code` int(2) DEFAULT NULL,
  `subject` text NOT NULL,
  `notice` text,
  `attachment` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
SET FOREIGN_KEY_CHECKS=1;
