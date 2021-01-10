/*
Navicat MySQL Data Transfer

Source Server         : Local
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : bigm_cmed

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-01-23 17:38:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for doc_notice
-- ----------------------------
DROP TABLE IF EXISTS `doc_notice`;
CREATE TABLE `doc_notice` (
  `notice_id` int(11) NOT NULL,
  `doc_id` int(11) NOT NULL,
  `seen` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sif_notice
-- ----------------------------
DROP TABLE IF EXISTS `sif_notice`;
CREATE TABLE `sif_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `send_to` varchar(4) DEFAULT NULL,
  `year` varchar(4) DEFAULT NULL,
  `session` int(2) DEFAULT NULL,
  `module_id` int(2) DEFAULT NULL,
  `unit_id` int(2) DEFAULT NULL,
  `subject` text NOT NULL,
  `notice` text,
  `attachment` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for teacher_notice
-- ----------------------------
DROP TABLE IF EXISTS `teacher_notice`;
CREATE TABLE `teacher_notice` (
  `notice_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `seen` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET FOREIGN_KEY_CHECKS=1;
