/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 50742 (5.7.42)
 Source Host           : localhost:3306
 Source Schema         : ycep

 Target Server Type    : MySQL
 Target Server Version : 50742 (5.7.42)
 File Encoding         : 65001

 Date: 06/08/2023 07:53:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_local
-- ----------------------------
DROP TABLE IF EXISTS `auth_local`;
CREATE TABLE `auth_local` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `account` (`account`),
  CONSTRAINT `auth_local_ibfk_1` FOREIGN KEY (`account`) REFERENCES `user` (`account`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of auth_local
-- ----------------------------
BEGIN;
INSERT INTO `auth_local` (`id`, `account`, `username`, `password`) VALUES (1, 1, 'root', '$argon2id$v=19$m=4096,t=3,p=1$d5FLws7CQLfST/5CzkqS9w$bSrNnvhRyB5lT6/tSgVOiJ7uVSRQR1a5xd4qZbrLQEk');
INSERT INTO `auth_local` (`id`, `account`, `username`, `password`) VALUES (2, 2, 'abc', '$argon2id$v=19$m=4096,t=3,p=1$gm87yiZJC94Sc7oeVI4YDQ$nDDky3perv9hmq4V13rPJCfgIQ5kNw1esmzPzvzVzkE');
INSERT INTO `auth_local` (`id`, `account`, `username`, `password`) VALUES (3, 3, 'pr', '$argon2id$v=19$m=4096,t=3,p=1$/5tXGdtLgaMwSqo7cpkgTw$84Aq9PPxHywD9Ja8VWbmoRkKj7cEYMmqQ2VZyjJVh0s');
COMMIT;

-- ----------------------------
-- Table structure for auth_oauth
-- ----------------------------
DROP TABLE IF EXISTS `auth_oauth`;
CREATE TABLE `auth_oauth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` int(11) NOT NULL,
  `oauth_name` varchar(255) NOT NULL,
  `oauth_id` varchar(255) NOT NULL,
  `oauth_access_token` varchar(255) NOT NULL,
  `oauth_expires` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account` (`account`),
  CONSTRAINT `auth_oauth_ibfk_1` FOREIGN KEY (`account`) REFERENCES `user` (`account`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of auth_oauth
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for game
-- ----------------------------
DROP TABLE IF EXISTS `game`;
CREATE TABLE `game` (
  `game_id` int(11) NOT NULL AUTO_INCREMENT,
  `knowledge_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `img_src` varchar(255) NOT NULL,
  PRIMARY KEY (`game_id`),
  KEY `game_ibfk_1` (`knowledge_id`),
  CONSTRAINT `game_ibfk_1` FOREIGN KEY (`knowledge_id`) REFERENCES `knowledge` (`knowledge_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of game
-- ----------------------------
BEGIN;
INSERT INTO `game` (`game_id`, `knowledge_id`, `title`, `author`, `description`, `img_src`) VALUES (1, 1, '1', '1', '1', '1');
INSERT INTO `game` (`game_id`, `knowledge_id`, `title`, `author`, `description`, `img_src`) VALUES (2, 1, '2', '2', '2', '2');
INSERT INTO `game` (`game_id`, `knowledge_id`, `title`, `author`, `description`, `img_src`) VALUES (3, 2, '3', '3', '3', '3');
INSERT INTO `game` (`game_id`, `knowledge_id`, `title`, `author`, `description`, `img_src`) VALUES (4, 2, '4', '4', '4', '4');
INSERT INTO `game` (`game_id`, `knowledge_id`, `title`, `author`, `description`, `img_src`) VALUES (5, 2, '5', '5', '5', '5');
INSERT INTO `game` (`game_id`, `knowledge_id`, `title`, `author`, `description`, `img_src`) VALUES (6, 3, '6', '6', '6', '6');
INSERT INTO `game` (`game_id`, `knowledge_id`, `title`, `author`, `description`, `img_src`) VALUES (7, 3, '7', '7', '7', '7');
INSERT INTO `game` (`game_id`, `knowledge_id`, `title`, `author`, `description`, `img_src`) VALUES (8, 3, '8', '8', '8', '8');
INSERT INTO `game` (`game_id`, `knowledge_id`, `title`, `author`, `description`, `img_src`) VALUES (9, 3, '9', '9', '9', '9');
INSERT INTO `game` (`game_id`, `knowledge_id`, `title`, `author`, `description`, `img_src`) VALUES (10, 3, '0', '0', '0', '0');
COMMIT;

-- ----------------------------
-- Table structure for interest
-- ----------------------------
DROP TABLE IF EXISTS `interest`;
CREATE TABLE `interest` (
  `account` int(11) NOT NULL,
  `item_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of interest
-- ----------------------------
BEGIN;
INSERT INTO `interest` (`account`, `item_id`) VALUES (3, 1);
INSERT INTO `interest` (`account`, `item_id`) VALUES (3, 2);
COMMIT;

-- ----------------------------
-- Table structure for item
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `kind_id` int(11) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `item_kind_id_fk` (`kind_id`),
  CONSTRAINT `item_kind_id_fk` FOREIGN KEY (`kind_id`) REFERENCES `kind` (`kind_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of item
-- ----------------------------
BEGIN;
INSERT INTO `item` (`item_id`, `kind_id`, `item_name`) VALUES (1, 3, '电路');
INSERT INTO `item` (`item_id`, `kind_id`, `item_name`) VALUES (2, 3, '太空');
INSERT INTO `item` (`item_id`, `kind_id`, `item_name`) VALUES (3, 3, '力');
INSERT INTO `item` (`item_id`, `kind_id`, `item_name`) VALUES (4, 3, '电磁');
INSERT INTO `item` (`item_id`, `kind_id`, `item_name`) VALUES (5, 1, '排序算法');
INSERT INTO `item` (`item_id`, `kind_id`, `item_name`) VALUES (6, 1, '数组');
INSERT INTO `item` (`item_id`, `kind_id`, `item_name`) VALUES (7, 1, '链表');
INSERT INTO `item` (`item_id`, `kind_id`, `item_name`) VALUES (8, 1, '对象');
COMMIT;

-- ----------------------------
-- Table structure for kind
-- ----------------------------
DROP TABLE IF EXISTS `kind`;
CREATE TABLE `kind` (
  `kind_id` int(11) NOT NULL AUTO_INCREMENT,
  `kind_name` varchar(255) NOT NULL,
  PRIMARY KEY (`kind_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of kind
-- ----------------------------
BEGIN;
INSERT INTO `kind` (`kind_id`, `kind_name`) VALUES (1, '编程');
INSERT INTO `kind` (`kind_id`, `kind_name`) VALUES (2, '材料');
INSERT INTO `kind` (`kind_id`, `kind_name`) VALUES (3, '物理');
INSERT INTO `kind` (`kind_id`, `kind_name`) VALUES (4, '化学');
COMMIT;

-- ----------------------------
-- Table structure for knowledge
-- ----------------------------
DROP TABLE IF EXISTS `knowledge`;
CREATE TABLE `knowledge` (
  `knowledge_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `img_src` varchar(255) NOT NULL,
  PRIMARY KEY (`knowledge_id`),
  KEY `knowledge_item_id_fk` (`item_id`),
  CONSTRAINT `knowledge_item_id_fk` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of knowledge
-- ----------------------------
BEGIN;
INSERT INTO `knowledge` (`knowledge_id`, `item_id`, `title`, `author`, `description`, `img_src`) VALUES (1, 1, '1', '1', '1', '1');
INSERT INTO `knowledge` (`knowledge_id`, `item_id`, `title`, `author`, `description`, `img_src`) VALUES (2, 1, '2', '2', '2', '2');
INSERT INTO `knowledge` (`knowledge_id`, `item_id`, `title`, `author`, `description`, `img_src`) VALUES (3, 1, '3', '3', '3', '3');
INSERT INTO `knowledge` (`knowledge_id`, `item_id`, `title`, `author`, `description`, `img_src`) VALUES (4, 1, '4', '4', '4', '4');
INSERT INTO `knowledge` (`knowledge_id`, `item_id`, `title`, `author`, `description`, `img_src`) VALUES (5, 1, '5', '5', '5', '5');
INSERT INTO `knowledge` (`knowledge_id`, `item_id`, `title`, `author`, `description`, `img_src`) VALUES (6, 2, '6', '6', '6', '6');
INSERT INTO `knowledge` (`knowledge_id`, `item_id`, `title`, `author`, `description`, `img_src`) VALUES (7, 2, '7', '7', '7', '7');
INSERT INTO `knowledge` (`knowledge_id`, `item_id`, `title`, `author`, `description`, `img_src`) VALUES (8, 2, '8', '8', '8', '8');
INSERT INTO `knowledge` (`knowledge_id`, `item_id`, `title`, `author`, `description`, `img_src`) VALUES (9, 2, '9', '9', '9', '9');
INSERT INTO `knowledge` (`knowledge_id`, `item_id`, `title`, `author`, `description`, `img_src`) VALUES (10, 3, '0', '0', '0', '0');
COMMIT;

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL,
  `release_time` datetime NOT NULL,
  `is_delete` tinyint(1) NOT NULL COMMENT '0：未删除；1：已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of notice
-- ----------------------------
BEGIN;
INSERT INTO `notice` (`id`, `content`, `release_time`, `is_delete`) VALUES (1, '这是一条公告', '2023-08-02 07:58:51', 0);
INSERT INTO `notice` (`id`, `content`, `release_time`, `is_delete`) VALUES (2, '这是另外一条公告', '2023-08-02 08:01:53', 0);
INSERT INTO `notice` (`id`, `content`, `release_time`, `is_delete`) VALUES (3, '这又双叒叕是一条公告', '2023-08-02 08:02:47', 0);
INSERT INTO `notice` (`id`, `content`, `release_time`, `is_delete`) VALUES (4, '这是一条新的公告', '2023-08-02 08:02:57', 1);
INSERT INTO `notice` (`id`, `content`, `release_time`, `is_delete`) VALUES (5, '公告xxx', '2023-08-02 08:33:52', 0);
COMMIT;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of role
-- ----------------------------
BEGIN;
INSERT INTO `role` (`role_id`, `role_name`) VALUES (0, 'admin');
INSERT INTO `role` (`role_id`, `role_name`) VALUES (1, 'user');
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `account` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `school` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`account`) USING BTREE,
  KEY `role_id` (`role_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` (`account`, `role_id`, `phone`, `email`, `sex`, `school`, `description`) VALUES (1, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user` (`account`, `role_id`, `phone`, `email`, `sex`, `school`, `description`) VALUES (2, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user` (`account`, `role_id`, `phone`, `email`, `sex`, `school`, `description`) VALUES (3, 1, '12345678901', '123456789@test.com', '女', '解放幼儿园', '哈哈哈');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
