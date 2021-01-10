/*
Navicat MySQL Data Transfer

Source Server         : nahian@bigm
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : bigm_genesis_online_exam

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-01-08 14:24:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for oe_exam_question
-- ----------------------------
DROP TABLE IF EXISTS `oe_exam_question`;
CREATE TABLE `oe_exam_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_ref_id` int(11) NOT NULL,
  `question_type_id` int(11) NOT NULL COMMENT '1->SBA, 2 -> MCQ',
  `question_id` int(11) NOT NULL,
  `chapter_id` int(4) DEFAULT NULL,
  `topic_id` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8;
SET FOREIGN_KEY_CHECKS=1;
