/*
Navicat MySQL Data Transfer

Source Server         : nahian@bigm
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : bigm_cmed

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-01-10 10:59:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for doc_exams
-- ----------------------------
DROP TABLE IF EXISTS `doc_exams`;
CREATE TABLE `doc_exams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_id` int(11) DEFAULT NULL,
  `doc_id` int(11) DEFAULT NULL,
  `year` int(4) DEFAULT NULL,
  `session` int(2) DEFAULT NULL,
  `module_id` int(11) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `answers` text,
  `correct` text,
  `wrong` text,
  `not_answered` text,
  `correct_mark` decimal(10,2) DEFAULT NULL,
  `worng_mark` decimal(10,2) DEFAULT NULL,
  `final_mark` decimal(10,2) DEFAULT NULL,
  `attend_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `exam_type_pos` int(11) DEFAULT NULL,
  `subject_pos` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `duration` int(11) DEFAULT '30',
  `wrong_mark` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for exam_question
-- ----------------------------
DROP TABLE IF EXISTS `exam_question`;
CREATE TABLE `exam_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_ref_id` int(11) NOT NULL,
  `question_type_id` int(11) NOT NULL COMMENT '1->SBA, 2 -> MCQ',
  `question_id` int(11) NOT NULL,
  `module_id` int(11) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `year` int(4) DEFAULT NULL,
  `session` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for exams
-- ----------------------------
DROP TABLE IF EXISTS `exams`;
CREATE TABLE `exams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `module_id` int(11) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `year` int(4) DEFAULT NULL,
  `session` int(2) DEFAULT NULL,
  `time` int(4) DEFAULT NULL,
  `total_mark` int(4) DEFAULT NULL,
  `open_date` datetime DEFAULT NULL,
  `close_date` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oe_qsn_bnk_ans
-- ----------------------------
DROP TABLE IF EXISTS `oe_qsn_bnk_ans`;
CREATE TABLE `oe_qsn_bnk_ans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `master_ref_id` int(11) NOT NULL,
  `ans` varchar(500) NOT NULL,
  `index_seqn` varchar(2) NOT NULL,
  `correct_ans` varchar(5) DEFAULT NULL COMMENT 'only for mcq , only T,F',
  PRIMARY KEY (`id`),
  KEY `master_ref_id` (`master_ref_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19111 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oe_qsn_bnk_master
-- ----------------------------
DROP TABLE IF EXISTS `oe_qsn_bnk_master`;
CREATE TABLE `oe_qsn_bnk_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` int(11) NOT NULL,
  `unit` int(11) NOT NULL,
  `type` varchar(20) NOT NULL COMMENT 'mcq,sba',
  `question_name` varchar(400) NOT NULL,
  `correct_ans` varchar(5) NOT NULL,
  `question_in_year` varchar(90) DEFAULT NULL,
  `discussion` text NOT NULL,
  `reference` text NOT NULL,
  `heading` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(30) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(30) DEFAULT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3715 DEFAULT CHARSET=utf8;
SET FOREIGN_KEY_CHECKS=1;
