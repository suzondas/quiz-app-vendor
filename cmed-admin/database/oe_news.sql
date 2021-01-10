/*
Navicat MySQL Data Transfer

Source Server         : Local
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : bigm_cmed

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-01-17 17:45:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for oe_news
-- ----------------------------
DROP TABLE IF EXISTS `oe_news`;
CREATE TABLE `oe_news` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `news_title` varchar(300) CHARACTER SET utf8 NOT NULL,
  `news_details` varchar(800) CHARACTER SET utf8 NOT NULL,
  `file_loc` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  `file_type` varchar(60) CHARACTER SET utf8 DEFAULT NULL,
  `file_extension` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(120) DEFAULT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `status` int(1) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
SET FOREIGN_KEY_CHECKS=1;
