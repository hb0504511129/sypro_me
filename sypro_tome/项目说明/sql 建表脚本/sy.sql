/*
Navicat MySQL Data Transfer

Source Server         : sy
Source Server Version : 50525
Source Host           : localhost:3306
Source Database       : sy

Target Server Type    : MYSQL
Target Server Version : 50525
File Encoding         : 65001

Date: 2013-07-28 21:50:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tbug`
-- ----------------------------
DROP TABLE IF EXISTS `tbug`;
CREATE TABLE `tbug` (
  `id` varchar(36) NOT NULL,
  `createdatetime` timestamp NULL DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `note` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbug
-- ----------------------------

-- ----------------------------
-- Table structure for `tmenu`
-- ----------------------------
DROP TABLE IF EXISTS `tmenu`;
CREATE TABLE `tmenu` (
  `id` varchar(36) NOT NULL,
  `iconcls` varchar(200) DEFAULT NULL,
  `seq` decimal(22,0) DEFAULT NULL,
  `text` varchar(100) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `pid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tmenu
-- ----------------------------

-- ----------------------------
-- Table structure for `tonline`
-- ----------------------------
DROP TABLE IF EXISTS `tonline`;
CREATE TABLE `tonline` (
  `id` varchar(36) NOT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `logindatetime` timestamp NULL DEFAULT NULL,
  `loginname` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tonline
-- ----------------------------

-- ----------------------------
-- Table structure for `tresource`
-- ----------------------------
DROP TABLE IF EXISTS `tresource`;
CREATE TABLE `tresource` (
  `id` varchar(36) NOT NULL,
  `seq` decimal(22,0) DEFAULT NULL,
  `text` varchar(100) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `pid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tresource
-- ----------------------------

-- ----------------------------
-- Table structure for `trole`
-- ----------------------------
DROP TABLE IF EXISTS `trole`;
CREATE TABLE `trole` (
  `id` varchar(36) NOT NULL COMMENT 'trole表id',
  `text` varchar(100) DEFAULT NULL COMMENT '角色说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of trole
-- ----------------------------

-- ----------------------------
-- Table structure for `trole_tresource`
-- ----------------------------
DROP TABLE IF EXISTS `trole_tresource`;
CREATE TABLE `trole_tresource` (
  `id` varchar(36) NOT NULL COMMENT 'trole_tresource表id',
  `resource_id` varchar(36) NOT NULL COMMENT 'tresource表连接ID',
  `role_id` varchar(36) NOT NULL COMMENT 'trole表连接ID',
  PRIMARY KEY (`id`),
  KEY `resource_id` (`resource_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `resource_id` FOREIGN KEY (`resource_id`) REFERENCES `tresource` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_id` FOREIGN KEY (`role_id`) REFERENCES `trole` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of trole_tresource
-- ----------------------------

-- ----------------------------
-- Table structure for `tuser`
-- ----------------------------
DROP TABLE IF EXISTS `tuser`;
CREATE TABLE `tuser` (
  `id` varchar(36) NOT NULL,
  `createdatetime` timestamp NULL DEFAULT NULL,
  `modifydatetime` timestamp NULL DEFAULT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `pwd` varchar(50) DEFAULT NULL,
  `create_time` date DEFAULT NULL,
  `update_time` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tuser
-- ----------------------------
INSERT INTO `tuser` VALUES ('0bfdad9e-c09f-46aa-910c-831f17ef7aa4', '2013-07-28 21:30:23', '2013-07-28 21:30:23', '黄炳', '123', '2013-07-28', '2013-07-28');

-- ----------------------------
-- Table structure for `tuser_trole`
-- ----------------------------
DROP TABLE IF EXISTS `tuser_trole`;
CREATE TABLE `tuser_trole` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(36) NOT NULL,
  `user_id` varchar(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `role_id2` (`role_id`),
  CONSTRAINT `role_id2` FOREIGN KEY (`role_id`) REFERENCES `trole` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `tuser` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tuser_trole
-- ----------------------------
