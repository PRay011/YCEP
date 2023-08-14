/*
 Navicat Premium Data Transfer

 Source Server         : 阿里云MySQL
 Source Server Type    : MySQL
 Source Server Version : 50743 (5.7.43)
 Source Host           : tdsmy.cn:3306
 Source Schema         : ycep

 Target Server Type    : MySQL
 Target Server Version : 50743 (5.7.43)
 File Encoding         : 65001

 Date: 14/08/2023 11:36:02
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
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE,
  KEY `account` (`account`) USING BTREE,
  CONSTRAINT `auth_local_ibfk_1` FOREIGN KEY (`account`) REFERENCES `user` (`account`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of auth_local
-- ----------------------------
BEGIN;
INSERT INTO `auth_local` (`id`, `account`, `username`, `password`) VALUES (1, 1, 'root', '$argon2id$v=19$m=4096,t=3,p=1$d5FLws7CQLfST/5CzkqS9w$bSrNnvhRyB5lT6/tSgVOiJ7uVSRQR1a5xd4qZbrLQEk');
INSERT INTO `auth_local` (`id`, `account`, `username`, `password`) VALUES (2, 2, 'abc', '$argon2id$v=19$m=4096,t=3,p=1$gm87yiZJC94Sc7oeVI4YDQ$nDDky3perv9hmq4V13rPJCfgIQ5kNw1esmzPzvzVzkE');
INSERT INTO `auth_local` (`id`, `account`, `username`, `password`) VALUES (3, 3, 'pr', '$argon2id$v=19$m=4096,t=3,p=1$/5tXGdtLgaMwSqo7cpkgTw$84Aq9PPxHywD9Ja8VWbmoRkKj7cEYMmqQ2VZyjJVh0s');
INSERT INTO `auth_local` (`id`, `account`, `username`, `password`) VALUES (4, 8, 'yy', '$argon2id$v=19$m=4096,t=3,p=1$lX3SeKpgRMnDVbEP9uOcmg$KUS/1rkzFF2sp5OJqdN2bSwO2ujBNWl4rRkgQdMddbc');
INSERT INTO `auth_local` (`id`, `account`, `username`, `password`) VALUES (5, 9, 'll', '$argon2id$v=19$m=4096,t=3,p=1$A8rI62utkYS+JYkM19pplQ$NmvbkjYviqmzgMXWzlq3d/lzK3fzZAVqohR0tG5JzvE');
INSERT INTO `auth_local` (`id`, `account`, `username`, `password`) VALUES (6, 10, '122112', '$argon2id$v=19$m=4096,t=3,p=1$xBGSHn+o+EAnIQLmMrihXg$CTKbD12FNGKiH3rte7zMu46L2CAPc9wRMrBnwtsipfE');
INSERT INTO `auth_local` (`id`, `account`, `username`, `password`) VALUES (7, 11, '123456', '$argon2id$v=19$m=4096,t=3,p=1$gzvBcPk8PpO0xQfx1GcPXg$MQr/+MSItKNhHW3VZODZNiZrfk/bG9TZZ1LEfmD4OaA');
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
  PRIMARY KEY (`id`) USING BTREE,
  KEY `account` (`account`) USING BTREE,
  CONSTRAINT `auth_oauth_ibfk_1` FOREIGN KEY (`account`) REFERENCES `user` (`account`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

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
  PRIMARY KEY (`game_id`) USING BTREE,
  KEY `game_ibfk_1` (`knowledge_id`) USING BTREE,
  CONSTRAINT `game_ibfk_1` FOREIGN KEY (`knowledge_id`) REFERENCES `knowledge` (`knowledge_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of game
-- ----------------------------
BEGIN;
INSERT INTO `game` (`game_id`, `knowledge_id`, `title`, `author`, `description`, `img_src`) VALUES (1, 1, '找出绿碧玺的盗窃者', '向右看齐', '宝石博物馆的镇馆之宝——绿碧玺被偷了！这是怎么一回事呢？快来看看吧！', 'game1.png');
INSERT INTO `game` (`game_id`, `knowledge_id`, `title`, `author`, `description`, `img_src`) VALUES (2, 1, '帮她开灯', '李姐', '丽丽晚上做作业的时候突然灯坏了，帮助她一起看看哪里出了问题吧！', 'game2.png');
INSERT INTO `game` (`game_id`, `knowledge_id`, `title`, `author`, `description`, `img_src`) VALUES (3, 2, '我需要计算器！', '编码使我快乐', '暑假马上就要结束了，但黎姿的数学算数作业还有好多没有写完，帮她做一个简易计算器吧！', 'game3.jpg');
INSERT INTO `game` (`game_id`, `knowledge_id`, `title`, `author`, `description`, `img_src`) VALUES (4, 2, '发电！发电！发电！', '皆是浮云', '利亚总是对爷爷住的房子远处的一个大风车好奇，它是用来干什么的呢？', 'game4.jpg');
INSERT INTO `game` (`game_id`, `knowledge_id`, `title`, `author`, `description`, `img_src`) VALUES (5, 2, '从生到熟', '皆是浮云', '芭芭拉在帮妈妈做饭，她感觉生米煮成熟饭这个过程很是神奇，大米在电饭锅里究竟经历了些什么呢？', 'game5.jpg');
INSERT INTO `game` (`game_id`, `knowledge_id`, `title`, `author`, `description`, `img_src`) VALUES (6, 3, '3D零食', '不是帅哥', '里蹦冒出了一个奇妙的想法，他想打印出独一无二的零食，帮帮他吧！', 'game6.jpg');
INSERT INTO `game` (`game_id`, `knowledge_id`, `title`, `author`, `description`, `img_src`) VALUES (7, 3, '太阳能发电', '向右看齐', '太阳的能量如此巨大，占梦看到了好多太阳能热水器，那么太阳光是怎么转化成别的能量的呢？', 'game7.jpg');
INSERT INTO `game` (`game_id`, `knowledge_id`, `title`, `author`, `description`, `img_src`) VALUES (8, 3, '做网站去', '编码使我快乐', '敦荷最近爱上了上网，他喜欢浏览各式各样的网站，发现了很多很喜欢的样式，帮他一起做一个属于自己的网站吧！', 'game8.jpg');
INSERT INTO `game` (`game_id`, `knowledge_id`, `title`, `author`, `description`, `img_src`) VALUES (9, 3, '抱紧我', '我不是萌妹', '打雷啦！打雷啦！好吓人，雷电是怎么忽的一下劈在地面上的呢？', 'game9.jpg');
INSERT INTO `game` (`game_id`, `knowledge_id`, `title`, `author`, `description`, `img_src`) VALUES (10, 4, '厨房里的物质变化', '我不是萌妹', '你想知道妈妈做的饭菜从生变熟的过程都发生了什么化学变化吗？来这里一探究竟吧！', 'game10.jpg');
COMMIT;

-- ----------------------------
-- Table structure for interest
-- ----------------------------
DROP TABLE IF EXISTS `interest`;
CREATE TABLE `interest` (
  `account` int(11) NOT NULL,
  `item_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of interest
-- ----------------------------
BEGIN;
INSERT INTO `interest` (`account`, `item_id`) VALUES (3, 1);
INSERT INTO `interest` (`account`, `item_id`) VALUES (3, 2);
INSERT INTO `interest` (`account`, `item_id`) VALUES (8, 5);
INSERT INTO `interest` (`account`, `item_id`) VALUES (8, 6);
INSERT INTO `interest` (`account`, `item_id`) VALUES (8, 7);
INSERT INTO `interest` (`account`, `item_id`) VALUES (8, 8);
INSERT INTO `interest` (`account`, `item_id`) VALUES (8, 14);
INSERT INTO `interest` (`account`, `item_id`) VALUES (8, 2);
INSERT INTO `interest` (`account`, `item_id`) VALUES (8, 11);
INSERT INTO `interest` (`account`, `item_id`) VALUES (9, 5);
INSERT INTO `interest` (`account`, `item_id`) VALUES (9, 6);
INSERT INTO `interest` (`account`, `item_id`) VALUES (9, 7);
INSERT INTO `interest` (`account`, `item_id`) VALUES (9, 8);
INSERT INTO `interest` (`account`, `item_id`) VALUES (9, 1);
INSERT INTO `interest` (`account`, `item_id`) VALUES (9, 2);
INSERT INTO `interest` (`account`, `item_id`) VALUES (9, 3);
INSERT INTO `interest` (`account`, `item_id`) VALUES (9, 4);
INSERT INTO `interest` (`account`, `item_id`) VALUES (10, 1);
INSERT INTO `interest` (`account`, `item_id`) VALUES (11, 1);
INSERT INTO `interest` (`account`, `item_id`) VALUES (11, 4);
COMMIT;

-- ----------------------------
-- Table structure for item
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `kind_id` int(11) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  PRIMARY KEY (`item_id`) USING BTREE,
  KEY `item_kind_id_fk` (`kind_id`) USING BTREE,
  CONSTRAINT `item_kind_id_fk` FOREIGN KEY (`kind_id`) REFERENCES `kind` (`kind_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

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
INSERT INTO `item` (`item_id`, `kind_id`, `item_name`) VALUES (9, 4, '固体');
INSERT INTO `item` (`item_id`, `kind_id`, `item_name`) VALUES (10, 4, '液体');
INSERT INTO `item` (`item_id`, `kind_id`, `item_name`) VALUES (11, 4, '气体');
INSERT INTO `item` (`item_id`, `kind_id`, `item_name`) VALUES (12, 4, '混合物质');
INSERT INTO `item` (`item_id`, `kind_id`, `item_name`) VALUES (13, 2, '木材');
INSERT INTO `item` (`item_id`, `kind_id`, `item_name`) VALUES (14, 2, '冶金');
INSERT INTO `item` (`item_id`, `kind_id`, `item_name`) VALUES (15, 2, '高分子');
INSERT INTO `item` (`item_id`, `kind_id`, `item_name`) VALUES (16, 2, '工艺');
COMMIT;

-- ----------------------------
-- Table structure for kind
-- ----------------------------
DROP TABLE IF EXISTS `kind`;
CREATE TABLE `kind` (
  `kind_id` int(11) NOT NULL AUTO_INCREMENT,
  `kind_name` varchar(255) NOT NULL,
  PRIMARY KEY (`kind_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

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
  PRIMARY KEY (`knowledge_id`) USING BTREE,
  KEY `knowledge_item_id_fk` (`item_id`) USING BTREE,
  CONSTRAINT `knowledge_item_id_fk` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of knowledge
-- ----------------------------
BEGIN;
INSERT INTO `knowledge` (`knowledge_id`, `item_id`, `title`, `author`, `description`, `img_src`) VALUES (1, 1, '基础电路分析', '南桥几晴秋', '你有想过吗？灯泡是怎么亮起来的呢？开关和灯泡是怎么连接起来的呢？导线应该怎么连接才会让整个通路都正常导电？灯泡有时候会不亮，这又是怎么回事呢？来一起看看吧！', 'klg1.jpg');
INSERT INTO `knowledge` (`knowledge_id`, `item_id`, `title`, `author`, `description`, `img_src`) VALUES (2, 1, '台式电脑电路连接', '硬件找我', '上计算机课的时候有注意过台式电脑的主机是怎么跟显示器相连的吗？一起来了解一下吧！', 'klg2.jpg');
INSERT INTO `knowledge` (`knowledge_id`, `item_id`, `title`, `author`, `description`, `img_src`) VALUES (3, 1, '静电的形态', '诚心蝴蝶', '在科技馆里你注意过这种手指摸上去就会吸引电流的装置吗？电视剧里也许你看到过，那么这究竟是什么原理呢？', 'klg3.jpg');
INSERT INTO `knowledge` (`knowledge_id`, `item_id`, `title`, `author`, `description`, `img_src`) VALUES (4, 1, '高空中的雷电', '一只小猫', '你遇到过打雷下雨的恶劣天气吧！轰隆轰隆的雷声十分骇人。那么天空为什么会放出威压这么猛烈的电呢？是什么造成了打雷的天气呢？', 'klg4.jpg');
INSERT INTO `knowledge` (`knowledge_id`, `item_id`, `title`, `author`, `description`, `img_src`) VALUES (5, 1, '风力发电', '天天进步', '坐在车里经过一些空旷的地带时，你有没有发现这些巨大的“竹蜻蜓”？你可能了解过这是风力发电装置，可是它的扇叶转的那么慢，究竟可不可以发电呢？', 'klg5.jpg');
INSERT INTO `knowledge` (`knowledge_id`, `item_id`, `title`, `author`, `description`, `img_src`) VALUES (6, 2, '页面设计', '进阶的码农', '打开电脑，在浏览器访问一个又一个精美的网站时，你是否会好奇这样的页面是怎么编码设计的？通过一行行代码就可以绘制出可以点击的页面，这到底是怎么实现的呢？', 'klg6.jpg');
INSERT INTO `knowledge` (`knowledge_id`, `item_id`, `title`, `author`, `description`, `img_src`) VALUES (7, 2, '数据分析', '张无畏', '计算机内部就像一个巨大的大脑，保存了很多数据记忆，那么我们需要对这些数据进行一定的分析，提取出有用的信息，怎么处理呢？', 'klg7.jpg');
INSERT INTO `knowledge` (`knowledge_id`, `item_id`, `title`, `author`, `description`, `img_src`) VALUES (8, 2, '简易计算器', '进阶的码农', '你对计算器肯定十分了解吧！但你知道它是如何由代码编译而来的吗？来一起动手设计一个计算器吧！', 'klg8.jpg');
INSERT INTO `knowledge` (`knowledge_id`, `item_id`, `title`, `author`, `description`, `img_src`) VALUES (9, 2, '智能眼镜', '我不是小郭', '你戴眼镜的时候有没有幻想过眼前可以通过眼镜投射出一个显示屏来进行类似电脑的操作？来一起看看吧！', 'klg9.jpg');
INSERT INTO `knowledge` (`knowledge_id`, `item_id`, `title`, `author`, `description`, `img_src`) VALUES (10, 2, '简易鞋架建模', '爱上建模', '3D打印是一个热门话题，不过打印的东西可不能简简单单的画在一个平面上，要用3D建模软件，来试试吧！', 'klg10.jpg');
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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

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
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of role
-- ----------------------------
BEGIN;
INSERT INTO `role` (`role_id`, `role_name`) VALUES (1, 'user');
INSERT INTO `role` (`role_id`, `role_name`) VALUES (2, 'admin');
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
  KEY `role_id` (`role_id`) USING BTREE,
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` (`account`, `role_id`, `phone`, `email`, `sex`, `school`, `description`) VALUES (1, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user` (`account`, `role_id`, `phone`, `email`, `sex`, `school`, `description`) VALUES (2, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user` (`account`, `role_id`, `phone`, `email`, `sex`, `school`, `description`) VALUES (3, 1, '12345678901', '123456789@test.com', '女', '解放幼儿园', '哈哈哈');
INSERT INTO `user` (`account`, `role_id`, `phone`, `email`, `sex`, `school`, `description`) VALUES (8, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user` (`account`, `role_id`, `phone`, `email`, `sex`, `school`, `description`) VALUES (9, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user` (`account`, `role_id`, `phone`, `email`, `sex`, `school`, `description`) VALUES (10, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user` (`account`, `role_id`, `phone`, `email`, `sex`, `school`, `description`) VALUES (11, 1, NULL, NULL, NULL, NULL, NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
