/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50639
 Source Host           : localhost:3306
 Source Schema         : questionnaire

 Target Server Type    : MySQL
 Target Server Version : 50639
 File Encoding         : 65001

 Date: 13/05/2021 00:48:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for answer
-- ----------------------------
DROP TABLE IF EXISTS `answer`;
CREATE TABLE `answer` (
  `answer_id` int(11) NOT NULL AUTO_INCREMENT,
  `fill_time` datetime(6) DEFAULT NULL,
  `ip` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  `question_title` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `question_type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `write_value` text COLLATE utf8mb4_bin,
  PRIMARY KEY (`answer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of answer
-- ----------------------------
BEGIN;
INSERT INTO `answer` VALUES (1, '2021-05-12 11:45:46.634000', '101.93.79.55', 1000, '你爱吃苹果吗?', 'single_check', '爱吃');
COMMIT;

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `question_id` int(11) NOT NULL,
  `details` text COLLATE utf8mb4_bin,
  `question_description` text COLLATE utf8mb4_bin,
  `question_nullable` bit(1) DEFAULT NULL,
  `question_title` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `question_type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `questionnaire_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of question
-- ----------------------------
BEGIN;
INSERT INTO `question` VALUES (1000, '{\"questionOptions\":[\"爱吃\",\"不爱吃\"],\"frontOptions\":[[]],\"frontChoose\":false,\"numberType\":\"integer\",\"defaultNumber\":0,\"gradeMax\":5,\"date\":\"2021-05-12T16:41:55.004Z\",\"textDescription\":\"\"}', '水果吃不', b'1', '你爱吃苹果吗?', 'single_check', 1);
COMMIT;

-- ----------------------------
-- Table structure for questionnaire
-- ----------------------------
DROP TABLE IF EXISTS `questionnaire`;
CREATE TABLE `questionnaire` (
  `questionnaire_id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `description` text COLLATE utf8mb4_bin,
  `end_time` datetime(6) DEFAULT NULL,
  `fill_count` int(11) DEFAULT NULL,
  `start_time` datetime(6) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`questionnaire_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of questionnaire
-- ----------------------------
BEGIN;
INSERT INTO `questionnaire` VALUES (1, '2021-05-12 11:41:25.544000', '回答有奖', NULL, 1, NULL, 'collecting', '你爱吃什么?', 'admin');
INSERT INTO `questionnaire` VALUES (2, '2021-05-12 11:46:23.696000', '请输入描述', NULL, NULL, NULL, 'editing', '请输入标题', 'admin');
INSERT INTO `questionnaire` VALUES (3, '2021-05-12 11:46:33.712000', '请输入描述', NULL, NULL, NULL, 'editing', '请输入标题', 'admin');
COMMIT;

-- ----------------------------
-- Table structure for questionnaire_ip
-- ----------------------------
DROP TABLE IF EXISTS `questionnaire_ip`;
CREATE TABLE `questionnaire_ip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `questionnaire_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of questionnaire_ip
-- ----------------------------
BEGIN;
INSERT INTO `questionnaire_ip` VALUES (1, '101.93.79.55', 1);
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `last_login_time` datetime(6) DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `phone_num` int(11) DEFAULT NULL,
  `random_code` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (1, '2021-05-12 11:41:13.428000', NULL, NULL, '$2a$10$gaANAy5eLTtWsKBN8tz6Je09MZ8SpZHPXPuk7nNUEskJxw.XOO.LW', NULL, NULL, NULL, 'admin');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
