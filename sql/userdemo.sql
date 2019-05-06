/*
MySQL Data Transfer
Source Host: localhost
Source Database: userdemo
Target Host: localhost
Target Database: userdemo
Date: 2019/5/6 16:43:48
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for city
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `cid` int(20) NOT NULL AUTO_INCREMENT,
  `pid` int(20) NOT NULL,
  `cname` varchar(255) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for province
-- ----------------------------
DROP TABLE IF EXISTS `province`;
CREATE TABLE `province` (
  `pid` int(20) NOT NULL AUTO_INCREMENT,
  `pname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `age` varchar(3) NOT NULL,
  `sex` varchar(3) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `pname` varchar(20) DEFAULT NULL,
  `cname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `city` VALUES ('1', '1', '保定');
INSERT INTO `city` VALUES ('2', '1', '承德');
INSERT INTO `city` VALUES ('3', '1', '石家庄');
INSERT INTO `city` VALUES ('4', '1', '唐山');
INSERT INTO `city` VALUES ('5', '2', '太原');
INSERT INTO `city` VALUES ('6', '2', '运城');
INSERT INTO `city` VALUES ('7', '2', '临汾');
INSERT INTO `city` VALUES ('8', '2', '大同');
INSERT INTO `city` VALUES ('9', '3', '聊城');
INSERT INTO `city` VALUES ('10', '3', '德州');
INSERT INTO `city` VALUES ('11', '3', '青岛');
INSERT INTO `city` VALUES ('12', '3', '济南');
INSERT INTO `city` VALUES ('13', '4', '西安');
INSERT INTO `city` VALUES ('14', '4', '延安');
INSERT INTO `city` VALUES ('15', '4', '宝鸡');
INSERT INTO `city` VALUES ('16', '4', '汉中');
INSERT INTO `province` VALUES ('1', '河北');
INSERT INTO `province` VALUES ('2', '山西');
INSERT INTO `province` VALUES ('3', '山东');
INSERT INTO `province` VALUES ('4', '陕西');
INSERT INTO `user` VALUES ('120', '李四', '24', '男', null, '山东', '青岛');
INSERT INTO `user` VALUES ('156', '27b825', '22', '男', '无', '河北', '保定');
INSERT INTO `user` VALUES ('157', 'b9f4d0', '22', '男', '无', '河北', '保定');
INSERT INTO `user` VALUES ('158', 'e00be5', '22', '男', '无', '河北', '保定');
INSERT INTO `user` VALUES ('159', '62793b', '22', '男', '无', '河北', '保定');
INSERT INTO `user` VALUES ('160', '3948bf', '22', '男', '无', '河北', '保定');
INSERT INTO `user` VALUES ('161', 'fa171e', '22', '男', '无', '河北', '保定');
INSERT INTO `user` VALUES ('162', '43948f', '22', '男', '无', '河北', '保定');
INSERT INTO `user` VALUES ('163', '251da8', '22', '男', '无', '河北', '保定');
INSERT INTO `user` VALUES ('164', '45f579', '22', '男', '无', '河北', '保定');
INSERT INTO `user` VALUES ('165', '2000b3', '22', '男', '无', '河北', '保定');
INSERT INTO `user` VALUES ('166', '3265a3', '22', '男', '无', '河北', '保定');
INSERT INTO `user` VALUES ('167', 'b2241f', '22', '男', '无', '河北', '保定');
INSERT INTO `user` VALUES ('168', 'c7310a', '22', '男', '无', '河北', '保定');
INSERT INTO `user` VALUES ('169', '28920e', '22', '男', '无', '河北', '保定');
