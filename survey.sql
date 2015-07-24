/*
Navicat MySQL Data Transfer

Source Server         : local-server
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : survey

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2015-07-24 11:25:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `answer`
-- ----------------------------
DROP TABLE IF EXISTS `answer`;
CREATE TABLE `answer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT '答案描述',
  `question_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '问题id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='答案表';

-- ----------------------------
-- Records of answer
-- ----------------------------

-- ----------------------------
-- Table structure for `invest`
-- ----------------------------
DROP TABLE IF EXISTS `invest`;
CREATE TABLE `invest` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '问卷标题',
  `status` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '问卷状态',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='问卷表';

-- ----------------------------
-- Records of invest
-- ----------------------------

-- ----------------------------
-- Table structure for `question`
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT '问题描述',
  `invest_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT ' 问卷号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='问题表';

-- ----------------------------
-- Records of question
-- ----------------------------

-- ----------------------------
-- Table structure for `statistic`
-- ----------------------------
DROP TABLE IF EXISTS `statistic`;
CREATE TABLE `statistic` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `invest_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '问卷id',
  `question_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '问题id',
  `answer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '回答id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `created` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='问卷统计';

-- ----------------------------
-- Records of statistic
-- ----------------------------
