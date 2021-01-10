/*
Navicat MySQL Data Transfer

Source Server         : nahian@bigm
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : bigm_genesis_online_exam

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-01-08 12:03:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for oe_qns_chapter_relatn
-- ----------------------------
DROP TABLE IF EXISTS `oe_qns_chapter_relatn`;
CREATE TABLE `oe_qns_chapter_relatn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chapter_id` int(11) NOT NULL,
  `master_ref_id` int(11) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sub_id` (`chapter_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3932 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oe_qns_topic_relatn
-- ----------------------------
DROP TABLE IF EXISTS `oe_qns_topic_relatn`;
CREATE TABLE `oe_qns_topic_relatn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) NOT NULL,
  `master_ref_id` int(11) NOT NULL,
  `chapter_ref_id` int(3) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `topic_id` (`topic_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3850 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=19076 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oe_qsn_bnk_master
-- ----------------------------
DROP TABLE IF EXISTS `oe_qsn_bnk_master`;
CREATE TABLE `oe_qsn_bnk_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=3708 DEFAULT CHARSET=utf8;
SET FOREIGN_KEY_CHECKS=1;
