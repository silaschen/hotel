/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : hotel

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2017-03-29 11:54:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `bingo_art_category`
-- ----------------------------
DROP TABLE IF EXISTS `bingo_art_category`;
CREATE TABLE `bingo_art_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(30) DEFAULT NULL,
  `parid` int(11) unsigned DEFAULT '0' COMMENT '父级分类id',
  `cover` varchar(150) DEFAULT NULL,
  `intro` text,
  `tmp` varchar(50) DEFAULT NULL COMMENT '自定义模版文件',
  `addtime` int(11) unsigned DEFAULT NULL,
  `px` int(11) unsigned DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) DEFAULT '1' COMMENT '1正常 0隐藏',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bingo_art_category
-- ----------------------------

-- ----------------------------
-- Table structure for `bingo_art_list`
-- ----------------------------
DROP TABLE IF EXISTS `bingo_art_list`;
CREATE TABLE `bingo_art_list` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cateid` int(10) unsigned DEFAULT '0' COMMENT '分类id',
  `title` varchar(150) DEFAULT NULL,
  `cover` varchar(150) DEFAULT NULL,
  `content` text,
  `addtime` varchar(15) DEFAULT NULL,
  `tmp` varchar(50) DEFAULT NULL COMMENT '自定义模板',
  `views` decimal(11,0) unsigned DEFAULT '0' COMMENT '浏览量',
  `status` tinyint(1) DEFAULT '1' COMMENT '-1删除 1正常 0隐藏',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bingo_art_list
-- ----------------------------

-- ----------------------------
-- Table structure for `bingo_cmd_audio`
-- ----------------------------
DROP TABLE IF EXISTS `bingo_cmd_audio`;
CREATE TABLE `bingo_cmd_audio` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mod` varchar(50) DEFAULT NULL,
  `pre` varchar(50) DEFAULT NULL COMMENT '前置调用函数',
  `table` varchar(20) DEFAULT NULL,
  `rid` varchar(150) DEFAULT NULL,
  `hide` tinyint(1) unsigned DEFAULT '0',
  `addtime` char(14) DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=96 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bingo_cmd_audio
-- ----------------------------

-- ----------------------------
-- Table structure for `bingo_cmd_count`
-- ----------------------------
DROP TABLE IF EXISTS `bingo_cmd_count`;
CREATE TABLE `bingo_cmd_count` (
  `date` varchar(10) NOT NULL DEFAULT '',
  `ask` int(10) unsigned DEFAULT '0',
  `img` int(8) unsigned DEFAULT '0',
  `txt` int(8) unsigned DEFAULT '0',
  `lbs` int(8) unsigned DEFAULT '0',
  `voice` int(8) unsigned DEFAULT '0',
  `click` int(8) unsigned DEFAULT '0',
  `scan` int(8) unsigned DEFAULT '0',
  `location` int(8) unsigned DEFAULT '0',
  `join` int(8) unsigned DEFAULT '0',
  `exit` int(8) unsigned DEFAULT '0',
  PRIMARY KEY (`date`),
  UNIQUE KEY `date` (`date`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bingo_cmd_count
-- ----------------------------
INSERT INTO `bingo_cmd_count` VALUES ('2014-03-26', '5', '0', '4', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `bingo_cmd_count` VALUES ('2014-03-27', '3', '0', '2', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `bingo_cmd_count` VALUES ('2014-03-28', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `bingo_cmd_count` VALUES ('2014-03-29', '95', '0', '2', '0', '0', '90', '0', '0', '0', '0');
INSERT INTO `bingo_cmd_count` VALUES ('2014-03-30', '5', '0', '0', '0', '0', '5', '0', '0', '0', '0');
INSERT INTO `bingo_cmd_count` VALUES ('2015-12-16', '21', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `bingo_cmd_count` VALUES ('2015-12-17', '4', '0', '0', '0', '0', '1', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `bingo_cmd_event`
-- ----------------------------
DROP TABLE IF EXISTS `bingo_cmd_event`;
CREATE TABLE `bingo_cmd_event` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT COMMENT '欢迎语',
  `mod` varchar(50) DEFAULT NULL,
  `pre` varchar(50) DEFAULT NULL COMMENT '前置调用函数',
  `event` varchar(50) DEFAULT NULL,
  `value` varchar(50) DEFAULT NULL,
  `table` varchar(20) DEFAULT NULL,
  `rid` varchar(150) DEFAULT NULL,
  `hide` tinyint(1) unsigned DEFAULT '0',
  `addtime` char(14) DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `ev` (`event`,`value`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=159 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bingo_cmd_event
-- ----------------------------

-- ----------------------------
-- Table structure for `bingo_cmd_location`
-- ----------------------------
DROP TABLE IF EXISTS `bingo_cmd_location`;
CREATE TABLE `bingo_cmd_location` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '欢迎语',
  `mod` varchar(50) DEFAULT NULL,
  `pre` varchar(50) DEFAULT NULL COMMENT '前置调用函数',
  `ltx` float(20,6) unsigned DEFAULT NULL,
  `lty` float(20,6) unsigned DEFAULT NULL,
  `rbx` float(20,6) unsigned DEFAULT NULL,
  `rby` float(20,6) unsigned DEFAULT NULL,
  `table` varchar(20) DEFAULT NULL,
  `rid` varchar(150) DEFAULT NULL,
  `hide` tinyint(1) unsigned DEFAULT '0',
  `addtime` char(14) DEFAULT '',
  `status` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `lbs` (`ltx`,`lty`,`rbx`,`rby`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=169 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bingo_cmd_location
-- ----------------------------

-- ----------------------------
-- Table structure for `bingo_cmd_notfound`
-- ----------------------------
DROP TABLE IF EXISTS `bingo_cmd_notfound`;
CREATE TABLE `bingo_cmd_notfound` (
  `id` tinyint(1) unsigned NOT NULL AUTO_INCREMENT,
  `mod` varchar(50) DEFAULT NULL,
  `pre` varchar(50) DEFAULT NULL COMMENT '前置调用函数',
  `table` varchar(20) DEFAULT NULL COMMENT '无法匹配用户指令时的回复',
  `rid` varchar(150) DEFAULT NULL,
  `hide` tinyint(1) unsigned DEFAULT '0',
  `addtime` char(14) DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bingo_cmd_notfound
-- ----------------------------

-- ----------------------------
-- Table structure for `bingo_cmd_pic`
-- ----------------------------
DROP TABLE IF EXISTS `bingo_cmd_pic`;
CREATE TABLE `bingo_cmd_pic` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mod` varchar(50) DEFAULT NULL,
  `pre` varchar(50) DEFAULT NULL COMMENT '前置调用函数',
  `table` varchar(20) DEFAULT NULL,
  `rid` varchar(150) DEFAULT NULL,
  `hide` tinyint(1) unsigned DEFAULT '0',
  `addtime` char(14) DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=98 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bingo_cmd_pic
-- ----------------------------

-- ----------------------------
-- Table structure for `bingo_cmd_text`
-- ----------------------------
DROP TABLE IF EXISTS `bingo_cmd_text`;
CREATE TABLE `bingo_cmd_text` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mod` varchar(50) DEFAULT NULL,
  `pre` varchar(50) DEFAULT NULL COMMENT '前置调用函数',
  `keyword` varchar(255) DEFAULT NULL,
  `table` varchar(20) DEFAULT NULL,
  `rid` varchar(650) DEFAULT NULL,
  `hide` tinyint(1) unsigned DEFAULT '0' COMMENT '是否隐藏',
  `addtime` char(14) DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `keyword` (`keyword`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=267 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bingo_cmd_text
-- ----------------------------

-- ----------------------------
-- Table structure for `bingo_hotel_album`
-- ----------------------------
DROP TABLE IF EXISTS `bingo_hotel_album`;
CREATE TABLE `bingo_hotel_album` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `hid` int(11) unsigned DEFAULT NULL COMMENT '所属酒店ID',
  `rid` int(11) unsigned DEFAULT '0' COMMENT '所属房型ID',
  `title` varchar(150) DEFAULT NULL,
  `cover` varchar(150) DEFAULT NULL,
  `file` varchar(150) DEFAULT NULL,
  `addtime` int(11) unsigned DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '1正常 0隐藏',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bingo_hotel_album
-- ----------------------------

-- ----------------------------
-- Table structure for `bingo_hotel_list`
-- ----------------------------
DROP TABLE IF EXISTS `bingo_hotel_list`;
CREATE TABLE `bingo_hotel_list` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL COMMENT '酒店名称',
  `cover` varchar(150) DEFAULT NULL COMMENT '封面图片',
  `intro` varchar(650) DEFAULT NULL COMMENT '简介',
  `tel` varchar(50) DEFAULT NULL COMMENT '联系电话',
  `a1` tinyint(4) unsigned DEFAULT NULL,
  `a2` int(6) unsigned DEFAULT NULL,
  `a3` int(8) unsigned DEFAULT NULL,
  `adr` varchar(200) DEFAULT NULL COMMENT '详细地址',
  `lat` float(20,6) unsigned DEFAULT NULL,
  `lng` float(20,6) unsigned DEFAULT NULL,
  `user` varchar(50) DEFAULT NULL COMMENT '帐号',
  `pwd` char(32) DEFAULT NULL,
  `total` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '累计收入',
  `money` decimal(20,2) unsigned DEFAULT '0.00' COMMENT '当前余额',
  `js` decimal(5,2) unsigned DEFAULT '0.00' COMMENT '结算比例 如 0.8',
  `wifi` tinyint(1) DEFAULT '0' COMMENT '客房wifi覆盖',
  `park` tinyint(1) DEFAULT '0' COMMENT '停车场',
  `restaurant` tinyint(1) DEFAULT '0' COMMENT '餐厅',
  `meeting` tinyint(1) DEFAULT '0' COMMENT '会议室',
  `contact` varchar(50) DEFAULT NULL COMMENT '联系人',
  `mobile` varchar(20) DEFAULT NULL COMMENT '联系人手机号码',
  `remark` varchar(650) DEFAULT NULL COMMENT '备注',
  `px` int(11) unsigned DEFAULT '0' COMMENT '排序',
  `addtime` int(11) unsigned DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '0禁用 1正常 -1删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bingo_hotel_list
-- ----------------------------
INSERT INTO `bingo_hotel_list` VALUES ('1', '郑州七天连锁酒店', 'Public/uploads/images/2017-03-22/58d21c7c35e1f.jpg', '郑州七天连锁酒店火车站店是2001年新开的廖所酒店，服务于火车站', '03975580654', '41', '4101', '410103', '郑州市二七区火车站向东100米', '34.744751', '113.661377', 'stationzz', 'e10adc3949ba59abbe56e057f20f883e', '0.00', '0.00', '0.70', '1', '0', '1', '1', '杰特', '18811174687', '保险公司取消', '1', '1490165043', '0');
INSERT INTO `bingo_hotel_list` VALUES ('2', '七天连锁郑东CBD分店', 'Public/uploads/images/2017-03-22/58d22c6cba717.jpg', '测试测试<span>测试测试</span><span>测试测试</span><span>测试测试</span><span>测试测试</span><span>测试测试</span><span>测试测试</span><span>测试测试</span><span>测试测试</span><span>测试测试</span><span>测试测试</span><span>测试测试</span><span>测试测试</span><span>测试测试</span><span>测试测试</span>', '039188801552', '41', '4101', '410104', '郑州市郑东新区东风南路85号', '34.743870', '113.602150', 'east7', 'e10adc3949ba59abbe56e057f20f883e', '0.00', '0.00', '0.80', '0', '1', '0', '1', '赵钱孙', '18865428987', null, '8', '1490169083', '1');
INSERT INTO `bingo_hotel_list` VALUES ('3', '开封鼓楼七天连锁酒店', 'Public/uploads/images/2017-03-23/58d36540a62d8.jpg', '鼓楼大街 七天连锁酒店', '039788569874', '41', '4102', '410204', '开封市西环路中段', '34.795109', '114.334076', 'gulou', 'e10adc3949ba59abbe56e057f20f883e', '0.00', '0.00', '0.85', '1', '0', '1', '1', '顾小姐', '159632145698', null, '1', '1490249172', '1');
INSERT INTO `bingo_hotel_list` VALUES ('4', '郑州建业艾美国际酒店', 'Public/uploads/images/2017-03-23/58d366541c222.jpg', '建业艾美，必须舒服！！！！', '039788526541', '41', '4101', '410104', '航海路中原福塔 嗨嗨体育场南1000米', '34.750500', '113.668587', 'jianye', 'e10adc3949ba59abbe56e057f20f883e', '0.00', '0.00', '0.80', '1', '1', '1', '1', '张六子', '15865233214', null, '5', '1490249651', '1');
INSERT INTO `bingo_hotel_list` VALUES ('5', '郑州万达文华酒店', 'Public/uploads/images/2017-03-23/58d369dc293f1.jpg', '万达文华', '039755886541', '41', '4101', '410102', '郑州市中原万达酒店', '34.744434', '113.596573', 'vanda', 'e10adc3949ba59abbe56e057f20f883e', '0.00', '0.00', '0.85', '1', '1', '1', '1', '万达', '18532654123', null, '11', '1490250272', '1');
INSERT INTO `bingo_hotel_list` VALUES ('6', '开封摩天大楼国际酒楼', 'Public/uploads/images/2017-03-23/58d374947f13b.jpg', '', '039755886699', '41', '4102', '410202', '开封市龙亭公园', '34.807072', '114.349434', 'kf250', 'e10adc3949ba59abbe56e057f20f883e', '0.00', '0.00', '0.90', '1', '1', '1', '1', 'Smith', '15698745212', null, '3', '1490253079', '1');
INSERT INTO `bingo_hotel_list` VALUES ('7', '焦作政二街七天连锁酒店', 'Public/uploads/images/2017-03-23/58d38ca120e6d.jpg', '叫做七天连锁酒店', '039788885595', '41', '4108', '410802', '人民路与政二街交叉口', '35.215561', '113.257370', 'hpu', 'e10adc3949ba59abbe56e057f20f883e', '0.00', '0.00', '0.85', '1', '0', '0', '0', '刘晨', '18555555552', null, '7', '1490259220', '1');
INSERT INTO `bingo_hotel_list` VALUES ('8', '怀柔雁栖湖国际酒店', 'Public/uploads/images/2017-03-24/58d4767beb857.jpg', '', '01088889965', '11', '1127', '112716', '北京市怀柔区雁栖湖', '40.404476', '116.683731', 'yanqi', 'e10adc3949ba59abbe56e057f20f883e', '0.00', '0.00', '0.80', '1', '1', '1', '1', '雁栖湖', '15869888896', null, '2', '1490319089', '1');
INSERT INTO `bingo_hotel_list` VALUES ('9', 'Zhengzhou fxHOTEL', 'Public/uploads/images/2017-03-27/58d86ba051944.jpg', 'THIS is an International Hotel where there is some u like.', '039755886542', '41', '4101', '410102', '中原区 中原万达国际酒店', '34.745350', '113.601891', 'hotel', 'e10adc3949ba59abbe56e057f20f883e', '0.00', '0.00', '0.80', '1', '1', '0', '1', '张三丰', '18856523215', null, '5', '1490578426', '1');
INSERT INTO `bingo_hotel_list` VALUES ('10', '213', '', '234', '234523', '62', '6202', '620200', '235423542', '39.770481', '98.265923', '2342', 'b397068f8bf932bf4e49340185ceec65', '0.00', '0.00', '0.00', '1', '1', '1', '1', '23423', '2352354', null, '23542', '1490579589', '-1');
INSERT INTO `bingo_hotel_list` VALUES ('11', '北京hoildays假日酒店', 'Public/uploads/images/2017-03-29/58db16ecc8bf9.jpg', 'holiday假日酒店，北京永定路店', '01088845669', '11', '1108', '110808', '北京市海淀区永定路北京长峰假日酒店', '39.908741', '116.265114', 'holiday', 'e10adc3949ba59abbe56e057f20f883e', '0.00', '0.00', '0.80', '1', '1', '1', '0', '长峰', '15696321236', null, '0', '1490753427', '0');
INSERT INTO `bingo_hotel_list` VALUES ('12', '北京丽亭酒店', 'Public/uploads/images/2017-03-29/58db1b4d02255.jpg', '北京站、建国门地区、天安门、王府井地区、前门、崇文门商贸区', '010888556985', '11', '1108', '110808', '北京站、建国门地区、天安门、王府井地区、前门、崇文门商贸区', '39.961926', '116.277924', 'liting', 'e10adc3949ba59abbe56e057f20f883e', '0.00', '0.00', '0.85', '1', '1', '1', '1', 'liting', '15698586321', null, '2', '1490754466', '1');

-- ----------------------------
-- Table structure for `bingo_hotel_room`
-- ----------------------------
DROP TABLE IF EXISTS `bingo_hotel_room`;
CREATE TABLE `bingo_hotel_room` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `hid` int(11) unsigned DEFAULT NULL,
  `title` varchar(150) DEFAULT NULL COMMENT '房型名称',
  `intro` varchar(150) DEFAULT NULL COMMENT '简介',
  `cover` varchar(150) DEFAULT NULL COMMENT '封面',
  `price0` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '门市价',
  `price1` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '普通用户价',
  `price2` decimal(10,2) unsigned DEFAULT '0.00' COMMENT 'VIP会员价',
  `size` tinyint(4) unsigned DEFAULT '0' COMMENT '面积 （平米）',
  `bedtype` varchar(50) DEFAULT NULL COMMENT '床型',
  `bedsize` varchar(20) DEFAULT NULL COMMENT '床宽',
  `window` varchar(50) DEFAULT NULL COMMENT '窗户信息',
  `floor` varchar(20) DEFAULT NULL COMMENT '所在楼层',
  `people` varchar(50) DEFAULT NULL COMMENT '入住人数说明',
  `internet` varchar(50) DEFAULT NULL COMMENT '上网方式说明',
  `smoke` varchar(50) DEFAULT NULL COMMENT '抽烟说明',
  `num` int(6) unsigned DEFAULT '0' COMMENT '库存数',
  `addtime` int(11) unsigned DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '1正常 0禁用 -1删除 ',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bingo_hotel_room
-- ----------------------------
INSERT INTO `bingo_hotel_room` VALUES ('1', '2', '商务大床房', '经济大床房，商务人士首选！！！！原价498现价358.', 'Public/uploads/images/2017-03-22/58d2473dc2c9b.jpg', '458.00', '358.00', '325.00', '60', '大床', '2.2', '1', '4', '1-2', '宽带 wifi', '可以抽烟', '20', '1490175930', '-1');
INSERT INTO `bingo_hotel_room` VALUES ('2', '2', '经济标间双床房', '两张床，您想咋哪儿睡就在那里睡！！！哈哈哈哈，赶紧的', 'Public/uploads/images/2017-03-22/58d24947315a4.jpg', '358.00', '250.00', '200.00', '45', '中床', '1.5', '0', '5-6', '2', 'wifi+宽带', '可以抽', '10', '1490176413', '0');
INSERT INTO `bingo_hotel_room` VALUES ('3', '5', '超级套房', '', 'Public/uploads/images/2017-03-23/58d36ed5f10a8.jpg', '968.00', '788.00', '700.00', '150', '', '2.9', '1', '28', '2', '', '', '2', '1490251512', '-1');
INSERT INTO `bingo_hotel_room` VALUES ('4', '5', '万达文华套间', '', 'Public/uploads/images/2017-03-23/58d3700fee6b2.jpg', '1588.00', '1200.00', '968.00', '186', '', '3.5', '1', '50', '2-4', '', '', '8', '1490251835', '0');
INSERT INTO `bingo_hotel_room` VALUES ('5', '5', '万达文华总统套房', '', 'Public/uploads/images/2017-03-23/58d3724e2aad4.jpg', '2500.00', '2200.00', '1988.00', '255', '', '4.8', '1', '58', '1-2', '', '', '8', '1490252419', '1');
INSERT INTO `bingo_hotel_room` VALUES ('6', '7', '商务大床', '经济实惠大床', 'Public/uploads/images/2017-03-23/58d38dce2dc6c.jpg', '258.00', '198.00', '168.00', '45', '大床', '2.5', '1', '4-6', '1-1', '', '', '25', '1490259446', '1');
INSERT INTO `bingo_hotel_room` VALUES ('7', '8', '商务套间', '', 'Public/uploads/images/2017-03-24/58d477f651bdc.jpg', '1500.00', '1200.00', '998.00', '100', '', '3', '1', '5', '2', '', '', '5', '1490319414', '1');
INSERT INTO `bingo_hotel_room` VALUES ('8', '9', '商务私人套房', '', 'Public/uploads/images/2017-03-27/58d86c5dc0ebb.jpg', '5000.00', '4500.00', '4200.00', '150', '50', '50', '1', '5', '5', '', '', '2', '1490578554', '0');
INSERT INTO `bingo_hotel_room` VALUES ('9', '11', '五星级套房', 'It\'s very good.', 'Public/uploads/images/2017-03-29/58db18b469248.jpg', '2800.00', '2200.00', '1988.00', '98', '', '', '1', '', '2-5', '', '', '10', '1490753762', '-1');
INSERT INTO `bingo_hotel_room` VALUES ('10', '11', '商务大床', 'd', 'Public/uploads/images/2017-03-29/58db1c476a55a.jpg', '1500.00', '1250.00', '1200.00', '88', '', '', '1', '5', '', '', '', '5', '1490754655', '1');

-- ----------------------------
-- Table structure for `bingo_mate_audio`
-- ----------------------------
DROP TABLE IF EXISTS `bingo_mate_audio`;
CREATE TABLE `bingo_mate_audio` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `intro` varchar(200) DEFAULT NULL,
  `wlink` varchar(200) DEFAULT NULL,
  `nlink` varchar(200) DEFAULT NULL,
  `cmd` varchar(250) DEFAULT NULL,
  `editime` varchar(15) DEFAULT NULL,
  `addtime` varchar(15) DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '显示或隐藏',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bingo_mate_audio
-- ----------------------------

-- ----------------------------
-- Table structure for `bingo_mate_morenews`
-- ----------------------------
DROP TABLE IF EXISTS `bingo_mate_morenews`;
CREATE TABLE `bingo_mate_morenews` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(2000) DEFAULT NULL,
  `cover` varchar(2000) DEFAULT NULL,
  `intro` varchar(1000) DEFAULT NULL,
  `tpl` varchar(150) DEFAULT NULL,
  `content` text,
  `cmd` varchar(250) DEFAULT NULL,
  `editime` varchar(15) DEFAULT NULL,
  `addtime` varchar(15) DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '显示或隐藏',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bingo_mate_morenews
-- ----------------------------

-- ----------------------------
-- Table structure for `bingo_mate_onenews`
-- ----------------------------
DROP TABLE IF EXISTS `bingo_mate_onenews`;
CREATE TABLE `bingo_mate_onenews` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(150) DEFAULT NULL,
  `cover` varchar(200) DEFAULT NULL,
  `intro` varchar(150) DEFAULT NULL,
  `content` text,
  `cmd` varchar(250) DEFAULT NULL,
  `tpl` varchar(50) DEFAULT NULL COMMENT '自定义模板',
  `editime` varchar(15) DEFAULT NULL,
  `addtime` varchar(15) DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '显示或隐藏',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bingo_mate_onenews
-- ----------------------------

-- ----------------------------
-- Table structure for `bingo_mate_remot`
-- ----------------------------
DROP TABLE IF EXISTS `bingo_mate_remot`;
CREATE TABLE `bingo_mate_remot` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(560) DEFAULT NULL,
  `content` varchar(6550) DEFAULT NULL,
  `cmd` varchar(250) DEFAULT NULL,
  `editime` varchar(15) DEFAULT NULL,
  `addtime` varchar(15) DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '显示或隐藏',
  PRIMARY KEY (`id`),
  KEY `id` (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bingo_mate_remot
-- ----------------------------
INSERT INTO `bingo_mate_remot` VALUES ('6', '点击领取您的微信会员卡', '[{\"title\":\"\\u70b9\\u51fb\\u9886\\u53d6\\u60a8\\u7684\\u5fae\\u4fe1\\u4f1a\\u5458\\u5361\",\"cover\":\"Public\\/modcard\\/getcover.jpg\",\"intro\":\"\\u65b9\\u4fbf\\u643a\\u5e26\\uff0c\\u6253\\u5f00\\u5fae\\u4fe1\\u5373\\u53ef\\u4f7f\\u7528\\u3002\",\"url\":\"{#}ModCardCenter{*}reg{*}openid{*}{@}\"}]', 'cmd_text,229#cmd_text,229#cmd_event,124#cmd_event,147#', '1384094668', '1384094668', '0');
INSERT INTO `bingo_mate_remot` VALUES ('7', '点击出示我的微信会员卡', '[{\"title\":\"\\u70b9\\u51fb\\u51fa\\u793a\\u6211\\u7684\\u5fae\\u4fe1\\u4f1a\\u5458\\u5361\",\"cover\":\"Public\\/modcard\\/getcover.jpg\",\"intro\":\"\",\"url\":\"{#}ModCardCenter{*}mycard{*}openid{*}{@}\"}]', 'cmd_text,232#cmd_event,118#cmd_event,125#cmd_event,146#', '1384673405', '1384673405', '0');
INSERT INTO `bingo_mate_remot` VALUES ('8', '欢迎进入留言板', '[{\"title\":\"\\u6b22\\u8fce\\u8fdb\\u5165\\u7559\\u8a00\\u677f\",\"cover\":\"Public\\/modmsgbord\\/msg.png\",\"intro\":\"\",\"url\":\"{#}ModMsgbordFront{*}index{*}openid{*}{@}\"}]', 'cmd_text,237#cmd_event,127#cmd_event,129#', '1385451974', '1385451974', '0');
INSERT INTO `bingo_mate_remot` VALUES ('9', '点击进入聊天室', '[{\"title\":\"\\u70b9\\u51fb\\u8fdb\\u5165\\u804a\\u5929\\u5ba4\",\"cover\":\"Public\\/modlive\\/msg.png\",\"intro\":\"\\u53d1\\u9001\\u6570\\u5b570\\u9000\\u51fa\",\"url\":\"{#}ModLive{*}index{*}openid{*}{@}\"}]', 'cmd_text,238#cmd_text,239#cmd_event,119#cmd_text,214#cmd_text,254#cmd_text,255#cmd_event,145#', '1385599171', '1385599171', '0');
INSERT INTO `bingo_mate_remot` VALUES ('10', '点击进入在线预约', '[{\"title\":\"\\u70b9\\u51fb\\u8fdb\\u5165\\u5728\\u7ebf\\u9884\\u7ea6\",\"cover\":\"Public\\/modbook\\/cover.png\",\"intro\":\"\",\"url\":\"{#}ModBook{*}make{*}openid{*}{@}\"}]', 'cmd_text,241#cmd_text,242#cmd_event,121#cmd_event,123#cmd_event,130#cmd_event,131#cmd_event,132#cmd_event,133#cmd_event,140#cmd_event,143#', '1386423180', '1386423180', '0');
INSERT INTO `bingo_mate_remot` VALUES ('23', '点击进入参与抽奖活动', '[{\"title\":\"\\u70b9\\u51fb\\u8fdb\\u5165\\u53c2\\u4e0e\\u62bd\\u5956\\u6d3b\\u52a8\",\"cover\":\"Public\\/modmarket\\/t1.png\",\"intro\":\"\",\"url\":\"{#}ModMarket{*}hd{*}openid{*}{@}\"}]', 'cmd_event,139#cmd_event,144#', null, '1386593126', '0');
INSERT INTO `bingo_mate_remot` VALUES ('33', '点击进入微友晒照', '[{\"title\":\"\\u70b9\\u51fb\\u8fdb\\u5165\\u5fae\\u53cb\\u6652\\u7167\",\"cover\":\"Public\\/modwall\\/cover.jpg\",\"intro\":\"\\u5206\\u4eab\\u4f60\\u7684\\u7cbe\\u5f69\",\"url\":\"{#}ModWall{*}view{*}openid{*}{@}\"}]', 'cmd_text,263#', '1384094668', '1384094668', '0');

-- ----------------------------
-- Table structure for `bingo_mate_text`
-- ----------------------------
DROP TABLE IF EXISTS `bingo_mate_text`;
CREATE TABLE `bingo_mate_text` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `text` varchar(750) DEFAULT NULL,
  `cmd` varchar(250) DEFAULT NULL,
  `editime` varchar(15) DEFAULT NULL,
  `addtime` varchar(15) DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '显示或隐藏',
  PRIMARY KEY (`id`),
  KEY `id` (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bingo_mate_text
-- ----------------------------
INSERT INTO `bingo_mate_text` VALUES ('29', '/拥抱请输入您的手机号码', 'cmd_location,165#cmd_event,114#cmd_event,112#cmd_location,166#cmd_text,224#cmd_event,115#cmd_text,225#', '1383919896', '1383919896', '0');
INSERT INTO `bingo_mate_text` VALUES ('39', '/太阳 欢迎进入微信墙，请输入口令进入对应的频道。 如需退出 请发送数字 0 ', 'cmd_text,257#cmd_text,258#cmd_text,261#', '1389168752', '1389168752', '0');

-- ----------------------------
-- Table structure for `bingo_mod_menu`
-- ----------------------------
DROP TABLE IF EXISTS `bingo_mod_menu`;
CREATE TABLE `bingo_mod_menu` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `pid` tinyint(4) unsigned DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `value` varchar(660) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=108 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bingo_mod_menu
-- ----------------------------

-- ----------------------------
-- Table structure for `bingo_sys_advs`
-- ----------------------------
DROP TABLE IF EXISTS `bingo_sys_advs`;
CREATE TABLE `bingo_sys_advs` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned DEFAULT '1' COMMENT '1首页轮播广告',
  `pic` varchar(150) DEFAULT NULL,
  `url` varchar(150) DEFAULT NULL,
  `addtime` varchar(15) DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bingo_sys_advs
-- ----------------------------

-- ----------------------------
-- Table structure for `bingo_sys_group`
-- ----------------------------
DROP TABLE IF EXISTS `bingo_sys_group`;
CREATE TABLE `bingo_sys_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `rules` text,
  `addtime` varchar(15) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bingo_sys_group
-- ----------------------------

-- ----------------------------
-- Table structure for `bingo_sys_group_access`
-- ----------------------------
DROP TABLE IF EXISTS `bingo_sys_group_access`;
CREATE TABLE `bingo_sys_group_access` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned DEFAULT NULL,
  `group_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bingo_sys_group_access
-- ----------------------------
INSERT INTO `bingo_sys_group_access` VALUES ('1', '1', '1');
INSERT INTO `bingo_sys_group_access` VALUES ('13', '16', '1');

-- ----------------------------
-- Table structure for `bingo_sys_location`
-- ----------------------------
DROP TABLE IF EXISTS `bingo_sys_location`;
CREATE TABLE `bingo_sys_location` (
  `id` int(8) unsigned NOT NULL DEFAULT '0',
  `pid` int(8) unsigned DEFAULT '0',
  `name` varchar(100) DEFAULT NULL,
  `lv` tinyint(1) unsigned DEFAULT '1' COMMENT '几级数据1,2,3',
  `son` int(6) unsigned DEFAULT '0' COMMENT '是否有下级数据 子数据条数',
  `status` tinyint(1) DEFAULT '1' COMMENT '1正常',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bingo_sys_location
-- ----------------------------
INSERT INTO `bingo_sys_location` VALUES ('11', '0', '北京', '1', '18', '1');
INSERT INTO `bingo_sys_location` VALUES ('31', '0', '上海', '1', '18', '1');
INSERT INTO `bingo_sys_location` VALUES ('44', '0', '广东', '1', '21', '1');
INSERT INTO `bingo_sys_location` VALUES ('34', '0', '安徽', '1', '17', '1');
INSERT INTO `bingo_sys_location` VALUES ('50', '0', '重庆', '1', '40', '1');
INSERT INTO `bingo_sys_location` VALUES ('35', '0', '福建', '1', '9', '1');
INSERT INTO `bingo_sys_location` VALUES ('46', '0', '海南', '1', '8', '1');
INSERT INTO `bingo_sys_location` VALUES ('13', '0', '河北', '1', '11', '1');
INSERT INTO `bingo_sys_location` VALUES ('41', '0', '河南', '1', '18', '1');
INSERT INTO `bingo_sys_location` VALUES ('23', '0', '黑龙江', '1', '13', '1');
INSERT INTO `bingo_sys_location` VALUES ('42', '0', '湖北', '1', '17', '1');
INSERT INTO `bingo_sys_location` VALUES ('43', '0', '湖南', '1', '14', '1');
INSERT INTO `bingo_sys_location` VALUES ('62', '0', '甘肃', '1', '14', '1');
INSERT INTO `bingo_sys_location` VALUES ('45', '0', '广西', '1', '14', '1');
INSERT INTO `bingo_sys_location` VALUES ('52', '0', '贵州', '1', '9', '1');
INSERT INTO `bingo_sys_location` VALUES ('22', '0', '吉林', '1', '9', '1');
INSERT INTO `bingo_sys_location` VALUES ('36', '0', '江西', '1', '11', '1');
INSERT INTO `bingo_sys_location` VALUES ('32', '0', '江苏', '1', '13', '1');
INSERT INTO `bingo_sys_location` VALUES ('21', '0', '辽宁', '1', '14', '1');
INSERT INTO `bingo_sys_location` VALUES ('15', '0', '内蒙古', '1', '12', '1');
INSERT INTO `bingo_sys_location` VALUES ('64', '0', '宁夏', '1', '5', '1');
INSERT INTO `bingo_sys_location` VALUES ('63', '0', '青海', '1', '8', '1');
INSERT INTO `bingo_sys_location` VALUES ('37', '0', '山东', '1', '17', '1');
INSERT INTO `bingo_sys_location` VALUES ('14', '0', '山西', '1', '11', '1');
INSERT INTO `bingo_sys_location` VALUES ('61', '0', '陕西', '1', '10', '1');
INSERT INTO `bingo_sys_location` VALUES ('51', '0', '四川', '1', '21', '1');
INSERT INTO `bingo_sys_location` VALUES ('12', '0', '天津', '1', '16', '1');
INSERT INTO `bingo_sys_location` VALUES ('54', '0', '西藏', '1', '7', '1');
INSERT INTO `bingo_sys_location` VALUES ('65', '0', '新疆', '1', '18', '1');
INSERT INTO `bingo_sys_location` VALUES ('53', '0', '云南', '1', '16', '1');
INSERT INTO `bingo_sys_location` VALUES ('33', '0', '浙江', '1', '11', '1');
INSERT INTO `bingo_sys_location` VALUES ('71', '0', '台湾', '1', '23', '1');
INSERT INTO `bingo_sys_location` VALUES ('81', '0', '香港', '1', '18', '1');
INSERT INTO `bingo_sys_location` VALUES ('82', '0', '澳门\r\n', '1', '7', '1');
INSERT INTO `bingo_sys_location` VALUES ('1101', '11', '东城', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('1102', '11', '西城', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('1103', '11', '崇文', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('1104', '11', '宣武', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('1105', '11', '朝阳', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('1106', '11', '丰台', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('1107', '11', '石景山', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('1108', '11', '海淀', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('1109', '11', '门头沟', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('1111', '11', '房山', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('1112', '11', '通州', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('1113', '11', '顺义', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('1121', '11', '昌平', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('1124', '11', '大兴', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('1126', '11', '平谷', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('1127', '11', '怀柔', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('1128', '11', '密云', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('1129', '11', '延庆', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('110101', '1101', '东城区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('1201', '12', '和平', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('1202', '12', '河东', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('1203', '12', '河西', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('1204', '12', '南开', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('1205', '12', '河北', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('1206', '12', '红桥', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('1207', '12', '滨海新区', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('1210', '12', '东丽', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('1211', '12', '西青', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('1212', '12', '津南', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('1213', '12', '北辰', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('1221', '12', '宁河', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('1222', '12', '武清', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('1223', '12', '静海', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('1224', '12', '宝坻', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('1225', '12', '蓟县', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('1301', '13', '石家庄', '2', '23', '1');
INSERT INTO `bingo_sys_location` VALUES ('1302', '13', '唐山', '2', '14', '1');
INSERT INTO `bingo_sys_location` VALUES ('1303', '13', '秦皇岛', '2', '7', '1');
INSERT INTO `bingo_sys_location` VALUES ('1304', '13', '邯郸', '2', '19', '1');
INSERT INTO `bingo_sys_location` VALUES ('1305', '13', '邢台', '2', '19', '1');
INSERT INTO `bingo_sys_location` VALUES ('1306', '13', '保定', '2', '25', '1');
INSERT INTO `bingo_sys_location` VALUES ('1307', '13', '张家口', '2', '17', '1');
INSERT INTO `bingo_sys_location` VALUES ('1308', '13', '承德', '2', '11', '1');
INSERT INTO `bingo_sys_location` VALUES ('1309', '13', '沧州', '2', '16', '1');
INSERT INTO `bingo_sys_location` VALUES ('1310', '13', '廊坊', '2', '10', '1');
INSERT INTO `bingo_sys_location` VALUES ('1311', '13', '衡水', '2', '11', '1');
INSERT INTO `bingo_sys_location` VALUES ('1401', '14', '太原', '2', '10', '1');
INSERT INTO `bingo_sys_location` VALUES ('1402', '14', '大同', '2', '11', '1');
INSERT INTO `bingo_sys_location` VALUES ('1403', '14', '阳泉', '2', '5', '1');
INSERT INTO `bingo_sys_location` VALUES ('1404', '14', '长治', '2', '13', '1');
INSERT INTO `bingo_sys_location` VALUES ('1405', '14', '晋城', '2', '6', '1');
INSERT INTO `bingo_sys_location` VALUES ('1406', '14', '朔州', '2', '6', '1');
INSERT INTO `bingo_sys_location` VALUES ('1407', '14', '晋中', '2', '11', '1');
INSERT INTO `bingo_sys_location` VALUES ('1408', '14', '运城', '2', '13', '1');
INSERT INTO `bingo_sys_location` VALUES ('1409', '14', '忻州', '2', '14', '1');
INSERT INTO `bingo_sys_location` VALUES ('1410', '14', '临汾', '2', '17', '1');
INSERT INTO `bingo_sys_location` VALUES ('1411', '14', '吕梁', '2', '13', '1');
INSERT INTO `bingo_sys_location` VALUES ('1501', '15', '呼和浩特', '2', '9', '1');
INSERT INTO `bingo_sys_location` VALUES ('1502', '15', '包头', '2', '9', '1');
INSERT INTO `bingo_sys_location` VALUES ('1503', '15', '乌海', '2', '3', '1');
INSERT INTO `bingo_sys_location` VALUES ('1504', '15', '赤峰', '2', '12', '1');
INSERT INTO `bingo_sys_location` VALUES ('1505', '15', '通辽', '2', '8', '1');
INSERT INTO `bingo_sys_location` VALUES ('1506', '15', '鄂尔多斯', '2', '8', '1');
INSERT INTO `bingo_sys_location` VALUES ('1507', '15', '呼伦贝尔', '2', '13', '1');
INSERT INTO `bingo_sys_location` VALUES ('1508', '15', '巴彦淖尔', '2', '7', '1');
INSERT INTO `bingo_sys_location` VALUES ('1509', '15', '乌兰察布', '2', '11', '1');
INSERT INTO `bingo_sys_location` VALUES ('1522', '15', '兴安', '2', '6', '1');
INSERT INTO `bingo_sys_location` VALUES ('1525', '15', '锡林郭勒', '2', '12', '1');
INSERT INTO `bingo_sys_location` VALUES ('1529', '15', '阿拉善', '2', '3', '1');
INSERT INTO `bingo_sys_location` VALUES ('2101', '21', '沈阳', '2', '13', '1');
INSERT INTO `bingo_sys_location` VALUES ('2102', '21', '大连', '2', '10', '1');
INSERT INTO `bingo_sys_location` VALUES ('2103', '21', '鞍山', '2', '7', '1');
INSERT INTO `bingo_sys_location` VALUES ('2104', '21', '抚顺', '2', '7', '1');
INSERT INTO `bingo_sys_location` VALUES ('2105', '21', '本溪', '2', '6', '1');
INSERT INTO `bingo_sys_location` VALUES ('2106', '21', '丹东', '2', '6', '1');
INSERT INTO `bingo_sys_location` VALUES ('2107', '21', '锦州', '2', '7', '1');
INSERT INTO `bingo_sys_location` VALUES ('2108', '21', '营口', '2', '6', '1');
INSERT INTO `bingo_sys_location` VALUES ('2109', '21', '阜新', '2', '7', '1');
INSERT INTO `bingo_sys_location` VALUES ('2110', '21', '辽阳', '2', '7', '1');
INSERT INTO `bingo_sys_location` VALUES ('2111', '21', '盘锦', '2', '4', '1');
INSERT INTO `bingo_sys_location` VALUES ('2112', '21', '铁岭', '2', '7', '1');
INSERT INTO `bingo_sys_location` VALUES ('2113', '21', '朝阳', '2', '7', '1');
INSERT INTO `bingo_sys_location` VALUES ('2114', '21', '葫芦岛', '2', '6', '1');
INSERT INTO `bingo_sys_location` VALUES ('2201', '22', '长春', '2', '10', '1');
INSERT INTO `bingo_sys_location` VALUES ('2202', '22', '吉林', '2', '9', '1');
INSERT INTO `bingo_sys_location` VALUES ('2203', '22', '四平', '2', '6', '1');
INSERT INTO `bingo_sys_location` VALUES ('2204', '22', '辽源', '2', '4', '1');
INSERT INTO `bingo_sys_location` VALUES ('2205', '22', '通化', '2', '7', '1');
INSERT INTO `bingo_sys_location` VALUES ('2206', '22', '白山', '2', '6', '1');
INSERT INTO `bingo_sys_location` VALUES ('2207', '22', '松原', '2', '5', '1');
INSERT INTO `bingo_sys_location` VALUES ('2208', '22', '白城', '2', '5', '1');
INSERT INTO `bingo_sys_location` VALUES ('2224', '22', '延边', '2', '8', '1');
INSERT INTO `bingo_sys_location` VALUES ('2301', '23', '哈尔滨', '2', '18', '1');
INSERT INTO `bingo_sys_location` VALUES ('2302', '23', '齐齐哈尔', '2', '16', '1');
INSERT INTO `bingo_sys_location` VALUES ('2303', '23', '鸡西', '2', '9', '1');
INSERT INTO `bingo_sys_location` VALUES ('2304', '23', '鹤岗', '2', '8', '1');
INSERT INTO `bingo_sys_location` VALUES ('2305', '23', '双鸭山', '2', '8', '1');
INSERT INTO `bingo_sys_location` VALUES ('2306', '23', '大庆', '2', '9', '1');
INSERT INTO `bingo_sys_location` VALUES ('2307', '23', '伊春', '2', '17', '1');
INSERT INTO `bingo_sys_location` VALUES ('2308', '23', '佳木斯', '2', '10', '1');
INSERT INTO `bingo_sys_location` VALUES ('2309', '23', '七台河', '2', '4', '1');
INSERT INTO `bingo_sys_location` VALUES ('2310', '23', '牡丹江', '2', '10', '1');
INSERT INTO `bingo_sys_location` VALUES ('2311', '23', '黑河', '2', '6', '1');
INSERT INTO `bingo_sys_location` VALUES ('2312', '23', '绥化', '2', '10', '1');
INSERT INTO `bingo_sys_location` VALUES ('2327', '23', '大兴安岭', '2', '7', '1');
INSERT INTO `bingo_sys_location` VALUES ('3101', '31', '黄浦', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('3103', '31', '卢湾', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('3104', '31', '徐汇', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('3105', '31', '长宁', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('3106', '31', '静安', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('3107', '31', '普陀', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('3108', '31', '闸北', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('3109', '31', '虹口', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('3110', '31', '杨浦', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('3112', '31', '闵行', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('3113', '31', '宝山', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('3114', '31', '嘉定', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('3115', '31', '浦东新区', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('3116', '31', '金山', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('3117', '31', '松江', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('3126', '31', '奉贤', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('3129', '31', '青浦', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('3130', '31', '崇明', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('3201', '32', '南京', '2', '13', '1');
INSERT INTO `bingo_sys_location` VALUES ('3202', '32', '无锡', '2', '8', '1');
INSERT INTO `bingo_sys_location` VALUES ('3203', '32', '徐州', '2', '11', '1');
INSERT INTO `bingo_sys_location` VALUES ('3204', '32', '常州', '2', '7', '1');
INSERT INTO `bingo_sys_location` VALUES ('3205', '32', '苏州', '2', '11', '1');
INSERT INTO `bingo_sys_location` VALUES ('3206', '32', '南通', '2', '8', '1');
INSERT INTO `bingo_sys_location` VALUES ('3207', '32', '连云港', '2', '7', '1');
INSERT INTO `bingo_sys_location` VALUES ('3208', '32', '淮安', '2', '8', '1');
INSERT INTO `bingo_sys_location` VALUES ('3209', '32', '盐城', '2', '9', '1');
INSERT INTO `bingo_sys_location` VALUES ('3210', '32', '扬州', '2', '7', '1');
INSERT INTO `bingo_sys_location` VALUES ('3211', '32', '镇江', '2', '6', '1');
INSERT INTO `bingo_sys_location` VALUES ('3212', '32', '泰州', '2', '6', '1');
INSERT INTO `bingo_sys_location` VALUES ('3213', '32', '宿迁', '2', '5', '1');
INSERT INTO `bingo_sys_location` VALUES ('3301', '33', '杭州', '2', '13', '1');
INSERT INTO `bingo_sys_location` VALUES ('3302', '33', '宁波', '2', '11', '1');
INSERT INTO `bingo_sys_location` VALUES ('3303', '33', '温州', '2', '11', '1');
INSERT INTO `bingo_sys_location` VALUES ('3304', '33', '嘉兴', '2', '7', '1');
INSERT INTO `bingo_sys_location` VALUES ('3305', '33', '湖州', '2', '5', '1');
INSERT INTO `bingo_sys_location` VALUES ('3306', '33', '绍兴', '2', '6', '1');
INSERT INTO `bingo_sys_location` VALUES ('3307', '33', '金华', '2', '9', '1');
INSERT INTO `bingo_sys_location` VALUES ('3308', '33', '衢州', '2', '6', '1');
INSERT INTO `bingo_sys_location` VALUES ('3309', '33', '舟山', '2', '4', '1');
INSERT INTO `bingo_sys_location` VALUES ('3310', '33', '台州', '2', '9', '1');
INSERT INTO `bingo_sys_location` VALUES ('3311', '33', '丽水', '2', '9', '1');
INSERT INTO `bingo_sys_location` VALUES ('3401', '34', '合肥', '2', '7', '1');
INSERT INTO `bingo_sys_location` VALUES ('3402', '34', '芜湖', '2', '7', '1');
INSERT INTO `bingo_sys_location` VALUES ('3403', '34', '蚌埠', '2', '7', '1');
INSERT INTO `bingo_sys_location` VALUES ('3404', '34', '淮南', '2', '6', '1');
INSERT INTO `bingo_sys_location` VALUES ('3405', '34', '马鞍山', '2', '4', '1');
INSERT INTO `bingo_sys_location` VALUES ('3406', '34', '淮北', '2', '4', '1');
INSERT INTO `bingo_sys_location` VALUES ('3407', '34', '铜陵', '2', '4', '1');
INSERT INTO `bingo_sys_location` VALUES ('3408', '34', '安庆', '2', '11', '1');
INSERT INTO `bingo_sys_location` VALUES ('3410', '34', '黄山', '2', '7', '1');
INSERT INTO `bingo_sys_location` VALUES ('3411', '34', '滁州', '2', '8', '1');
INSERT INTO `bingo_sys_location` VALUES ('3412', '34', '阜阳', '2', '8', '1');
INSERT INTO `bingo_sys_location` VALUES ('3413', '34', '宿州', '2', '5', '1');
INSERT INTO `bingo_sys_location` VALUES ('3414', '34', '巢湖', '2', '5', '1');
INSERT INTO `bingo_sys_location` VALUES ('3415', '34', '六安', '2', '7', '1');
INSERT INTO `bingo_sys_location` VALUES ('3416', '34', '亳州', '2', '4', '1');
INSERT INTO `bingo_sys_location` VALUES ('3417', '34', '池州', '2', '4', '1');
INSERT INTO `bingo_sys_location` VALUES ('3418', '34', '宣城', '2', '7', '1');
INSERT INTO `bingo_sys_location` VALUES ('3501', '35', '福州', '2', '13', '1');
INSERT INTO `bingo_sys_location` VALUES ('3502', '35', '厦门', '2', '6', '1');
INSERT INTO `bingo_sys_location` VALUES ('3503', '35', '莆田', '2', '5', '1');
INSERT INTO `bingo_sys_location` VALUES ('3504', '35', '三明', '2', '12', '1');
INSERT INTO `bingo_sys_location` VALUES ('3505', '35', '泉州', '2', '12', '1');
INSERT INTO `bingo_sys_location` VALUES ('3506', '35', '漳州', '2', '11', '1');
INSERT INTO `bingo_sys_location` VALUES ('3507', '35', '南平', '2', '10', '1');
INSERT INTO `bingo_sys_location` VALUES ('3508', '35', '龙岩', '2', '7', '1');
INSERT INTO `bingo_sys_location` VALUES ('3509', '35', '宁德', '2', '9', '1');
INSERT INTO `bingo_sys_location` VALUES ('3601', '36', '南昌', '2', '9', '1');
INSERT INTO `bingo_sys_location` VALUES ('3602', '36', '景德镇', '2', '4', '1');
INSERT INTO `bingo_sys_location` VALUES ('3603', '36', '萍乡', '2', '5', '1');
INSERT INTO `bingo_sys_location` VALUES ('3604', '36', '九江', '2', '12', '1');
INSERT INTO `bingo_sys_location` VALUES ('3605', '36', '新余', '2', '2', '1');
INSERT INTO `bingo_sys_location` VALUES ('3606', '36', '鹰潭', '2', '3', '1');
INSERT INTO `bingo_sys_location` VALUES ('3607', '36', '赣州', '2', '18', '1');
INSERT INTO `bingo_sys_location` VALUES ('3608', '36', '吉安', '2', '13', '1');
INSERT INTO `bingo_sys_location` VALUES ('3609', '36', '宜春', '2', '10', '1');
INSERT INTO `bingo_sys_location` VALUES ('3610', '36', '抚州', '2', '11', '1');
INSERT INTO `bingo_sys_location` VALUES ('3611', '36', '上饶', '2', '12', '1');
INSERT INTO `bingo_sys_location` VALUES ('3701', '37', '济南', '2', '10', '1');
INSERT INTO `bingo_sys_location` VALUES ('3702', '37', '青岛', '2', '12', '1');
INSERT INTO `bingo_sys_location` VALUES ('3703', '37', '淄博', '2', '8', '1');
INSERT INTO `bingo_sys_location` VALUES ('3704', '37', '枣庄', '2', '6', '1');
INSERT INTO `bingo_sys_location` VALUES ('3705', '37', '东营', '2', '5', '1');
INSERT INTO `bingo_sys_location` VALUES ('3706', '37', '烟台', '2', '12', '1');
INSERT INTO `bingo_sys_location` VALUES ('3707', '37', '潍坊', '2', '12', '1');
INSERT INTO `bingo_sys_location` VALUES ('3708', '37', '济宁', '2', '12', '1');
INSERT INTO `bingo_sys_location` VALUES ('3709', '37', '泰安', '2', '6', '1');
INSERT INTO `bingo_sys_location` VALUES ('3710', '37', '威海', '2', '4', '1');
INSERT INTO `bingo_sys_location` VALUES ('3711', '37', '日照', '2', '4', '1');
INSERT INTO `bingo_sys_location` VALUES ('3712', '37', '莱芜', '2', '2', '1');
INSERT INTO `bingo_sys_location` VALUES ('3713', '37', '临沂', '2', '12', '1');
INSERT INTO `bingo_sys_location` VALUES ('3714', '37', '德州', '2', '11', '1');
INSERT INTO `bingo_sys_location` VALUES ('3715', '37', '聊城', '2', '8', '1');
INSERT INTO `bingo_sys_location` VALUES ('3716', '37', '滨州', '2', '7', '1');
INSERT INTO `bingo_sys_location` VALUES ('3717', '37', '菏泽', '2', '9', '1');
INSERT INTO `bingo_sys_location` VALUES ('4101', '41', '郑州', '2', '12', '1');
INSERT INTO `bingo_sys_location` VALUES ('4102', '41', '开封', '2', '10', '1');
INSERT INTO `bingo_sys_location` VALUES ('4103', '41', '洛阳', '2', '15', '1');
INSERT INTO `bingo_sys_location` VALUES ('4104', '41', '平顶山', '2', '10', '1');
INSERT INTO `bingo_sys_location` VALUES ('4105', '41', '安阳', '2', '9', '1');
INSERT INTO `bingo_sys_location` VALUES ('4106', '41', '鹤壁', '2', '5', '1');
INSERT INTO `bingo_sys_location` VALUES ('4107', '41', '新乡', '2', '12', '1');
INSERT INTO `bingo_sys_location` VALUES ('4108', '41', '焦作', '2', '10', '1');
INSERT INTO `bingo_sys_location` VALUES ('4109', '41', '濮阳', '2', '6', '1');
INSERT INTO `bingo_sys_location` VALUES ('4110', '41', '许昌', '2', '6', '1');
INSERT INTO `bingo_sys_location` VALUES ('4111', '41', '漯河', '2', '5', '1');
INSERT INTO `bingo_sys_location` VALUES ('4112', '41', '三门峡', '2', '6', '1');
INSERT INTO `bingo_sys_location` VALUES ('4113', '41', '南阳', '2', '13', '1');
INSERT INTO `bingo_sys_location` VALUES ('4114', '41', '商丘', '2', '9', '1');
INSERT INTO `bingo_sys_location` VALUES ('4115', '41', '信阳', '2', '10', '1');
INSERT INTO `bingo_sys_location` VALUES ('4116', '41', '周口', '2', '10', '1');
INSERT INTO `bingo_sys_location` VALUES ('4117', '41', '驻马店', '2', '10', '1');
INSERT INTO `bingo_sys_location` VALUES ('4118', '41', '济源', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('4201', '42', '武汉', '2', '13', '1');
INSERT INTO `bingo_sys_location` VALUES ('4202', '42', '黄石', '2', '6', '1');
INSERT INTO `bingo_sys_location` VALUES ('4203', '42', '十堰', '2', '8', '1');
INSERT INTO `bingo_sys_location` VALUES ('4205', '42', '宜昌', '2', '13', '1');
INSERT INTO `bingo_sys_location` VALUES ('4206', '42', '襄樊', '2', '9', '1');
INSERT INTO `bingo_sys_location` VALUES ('4207', '42', '鄂州', '2', '3', '1');
INSERT INTO `bingo_sys_location` VALUES ('4208', '42', '荆门', '2', '5', '1');
INSERT INTO `bingo_sys_location` VALUES ('4209', '42', '孝感', '2', '7', '1');
INSERT INTO `bingo_sys_location` VALUES ('4210', '42', '荆州', '2', '8', '1');
INSERT INTO `bingo_sys_location` VALUES ('4211', '42', '黄冈', '2', '10', '1');
INSERT INTO `bingo_sys_location` VALUES ('4212', '42', '咸宁', '2', '6', '1');
INSERT INTO `bingo_sys_location` VALUES ('4213', '42', '随州', '2', '3', '1');
INSERT INTO `bingo_sys_location` VALUES ('4228', '42', '恩施', '2', '8', '1');
INSERT INTO `bingo_sys_location` VALUES ('4229', '42', '仙桃', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('4230', '42', '潜江', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('4231', '42', '天门', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('4232', '42', '神农架', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('4301', '43', '长沙', '2', '9', '1');
INSERT INTO `bingo_sys_location` VALUES ('4302', '43', '株洲', '2', '9', '1');
INSERT INTO `bingo_sys_location` VALUES ('4303', '43', '湘潭', '2', '5', '1');
INSERT INTO `bingo_sys_location` VALUES ('4304', '43', '衡阳', '2', '12', '1');
INSERT INTO `bingo_sys_location` VALUES ('4305', '43', '邵阳', '2', '12', '1');
INSERT INTO `bingo_sys_location` VALUES ('4306', '43', '岳阳', '2', '9', '1');
INSERT INTO `bingo_sys_location` VALUES ('4307', '43', '常德', '2', '9', '1');
INSERT INTO `bingo_sys_location` VALUES ('4308', '43', '张家界', '2', '4', '1');
INSERT INTO `bingo_sys_location` VALUES ('4309', '43', '益阳', '2', '6', '1');
INSERT INTO `bingo_sys_location` VALUES ('4310', '43', '郴州', '2', '11', '1');
INSERT INTO `bingo_sys_location` VALUES ('4311', '43', '永州', '2', '11', '1');
INSERT INTO `bingo_sys_location` VALUES ('4312', '43', '怀化', '2', '12', '1');
INSERT INTO `bingo_sys_location` VALUES ('4313', '43', '娄底', '2', '5', '1');
INSERT INTO `bingo_sys_location` VALUES ('4331', '43', '湘西', '2', '8', '1');
INSERT INTO `bingo_sys_location` VALUES ('4401', '44', '广州', '2', '12', '1');
INSERT INTO `bingo_sys_location` VALUES ('4402', '44', '韶关', '2', '10', '1');
INSERT INTO `bingo_sys_location` VALUES ('4403', '44', '深圳', '2', '6', '1');
INSERT INTO `bingo_sys_location` VALUES ('4404', '44', '珠海', '2', '3', '1');
INSERT INTO `bingo_sys_location` VALUES ('4405', '44', '汕头', '2', '7', '1');
INSERT INTO `bingo_sys_location` VALUES ('4406', '44', '佛山', '2', '5', '1');
INSERT INTO `bingo_sys_location` VALUES ('4407', '44', '江门', '2', '7', '1');
INSERT INTO `bingo_sys_location` VALUES ('4408', '44', '湛江', '2', '9', '1');
INSERT INTO `bingo_sys_location` VALUES ('4409', '44', '茂名', '2', '6', '1');
INSERT INTO `bingo_sys_location` VALUES ('4412', '44', '肇庆', '2', '8', '1');
INSERT INTO `bingo_sys_location` VALUES ('4413', '44', '惠州', '2', '5', '1');
INSERT INTO `bingo_sys_location` VALUES ('4414', '44', '梅州', '2', '8', '1');
INSERT INTO `bingo_sys_location` VALUES ('4415', '44', '汕尾', '2', '4', '1');
INSERT INTO `bingo_sys_location` VALUES ('4416', '44', '河源', '2', '6', '1');
INSERT INTO `bingo_sys_location` VALUES ('4417', '44', '阳江', '2', '4', '1');
INSERT INTO `bingo_sys_location` VALUES ('4418', '44', '清远', '2', '8', '1');
INSERT INTO `bingo_sys_location` VALUES ('4419', '44', '东莞', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('4420', '44', '中山', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('4451', '44', '潮州', '2', '3', '1');
INSERT INTO `bingo_sys_location` VALUES ('4452', '44', '揭阳', '2', '5', '1');
INSERT INTO `bingo_sys_location` VALUES ('4453', '44', '云浮', '2', '5', '1');
INSERT INTO `bingo_sys_location` VALUES ('4501', '45', '南宁', '2', '12', '1');
INSERT INTO `bingo_sys_location` VALUES ('4502', '45', '柳州', '2', '10', '1');
INSERT INTO `bingo_sys_location` VALUES ('4503', '45', '桂林', '2', '17', '1');
INSERT INTO `bingo_sys_location` VALUES ('4504', '45', '梧州', '2', '7', '1');
INSERT INTO `bingo_sys_location` VALUES ('4505', '45', '北海', '2', '4', '1');
INSERT INTO `bingo_sys_location` VALUES ('4506', '45', '防城港', '2', '4', '1');
INSERT INTO `bingo_sys_location` VALUES ('4507', '45', '钦州', '2', '4', '1');
INSERT INTO `bingo_sys_location` VALUES ('4508', '45', '贵港', '2', '5', '1');
INSERT INTO `bingo_sys_location` VALUES ('4509', '45', '玉林', '2', '6', '1');
INSERT INTO `bingo_sys_location` VALUES ('4510', '45', '百色', '2', '12', '1');
INSERT INTO `bingo_sys_location` VALUES ('4511', '45', '贺州', '2', '4', '1');
INSERT INTO `bingo_sys_location` VALUES ('4512', '45', '河池', '2', '11', '1');
INSERT INTO `bingo_sys_location` VALUES ('4513', '45', '来宾', '2', '6', '1');
INSERT INTO `bingo_sys_location` VALUES ('4514', '45', '崇左', '2', '7', '1');
INSERT INTO `bingo_sys_location` VALUES ('4601', '46', '海口', '2', '4', '1');
INSERT INTO `bingo_sys_location` VALUES ('4602', '46', '三亚', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('4603', '46', '五指山', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('4604', '46', '琼海', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('4605', '46', '儋州', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('4606', '46', '文昌', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('4607', '46', '万宁', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('4608', '46', '东方', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('5001', '50', '万州', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('5002', '50', '涪陵', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('5003', '50', '渝中', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('5004', '50', '大渡口', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('5005', '50', '江北', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('5006', '50', '沙坪坝', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('5007', '50', '九龙坡', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('5008', '50', '南岸', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('5009', '50', '北碚', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('5010', '50', '万盛', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('5011', '50', '双桥', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('5012', '50', '渝北', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('5013', '50', '巴南', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('5021', '50', '长寿', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('5022', '50', '綦江', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('5023', '50', '潼南', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('5024', '50', '铜梁', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('5025', '50', '大足', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('5026', '50', '荣昌', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('5027', '50', '璧山', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('5028', '50', '梁平', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('5029', '50', '城口', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('5030', '50', '丰都', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('5031', '50', '垫江', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('5032', '50', '武隆', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('5033', '50', '忠县', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('5034', '50', '开县', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('5035', '50', '云阳', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('5036', '50', '奉节', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('5037', '50', '巫山', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('5038', '50', '巫溪', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('5039', '50', '黔江', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('5040', '50', '石柱', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('5041', '50', '秀山', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('5042', '50', '酉阳', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('5043', '50', '彭水', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('5081', '50', '江津', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('5082', '50', '合川', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('5083', '50', '永川', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('5084', '50', '南川', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('5101', '51', '成都', '2', '19', '1');
INSERT INTO `bingo_sys_location` VALUES ('5103', '51', '自贡', '2', '6', '1');
INSERT INTO `bingo_sys_location` VALUES ('5104', '51', '攀枝花', '2', '5', '1');
INSERT INTO `bingo_sys_location` VALUES ('5105', '51', '泸州', '2', '7', '1');
INSERT INTO `bingo_sys_location` VALUES ('5106', '51', '德阳', '2', '6', '1');
INSERT INTO `bingo_sys_location` VALUES ('5107', '51', '绵阳', '2', '9', '1');
INSERT INTO `bingo_sys_location` VALUES ('5108', '51', '广元', '2', '7', '1');
INSERT INTO `bingo_sys_location` VALUES ('5109', '51', '遂宁', '2', '5', '1');
INSERT INTO `bingo_sys_location` VALUES ('5110', '51', '内江', '2', '5', '1');
INSERT INTO `bingo_sys_location` VALUES ('5111', '51', '乐山', '2', '11', '1');
INSERT INTO `bingo_sys_location` VALUES ('5113', '51', '南充', '2', '9', '1');
INSERT INTO `bingo_sys_location` VALUES ('5114', '51', '眉山', '2', '6', '1');
INSERT INTO `bingo_sys_location` VALUES ('5115', '51', '宜宾', '2', '10', '1');
INSERT INTO `bingo_sys_location` VALUES ('5116', '51', '广安', '2', '5', '1');
INSERT INTO `bingo_sys_location` VALUES ('5117', '51', '达州', '2', '7', '1');
INSERT INTO `bingo_sys_location` VALUES ('5118', '51', '雅安', '2', '8', '1');
INSERT INTO `bingo_sys_location` VALUES ('5119', '51', '巴中', '2', '4', '1');
INSERT INTO `bingo_sys_location` VALUES ('5120', '51', '资阳', '2', '4', '1');
INSERT INTO `bingo_sys_location` VALUES ('5132', '51', '阿坝', '2', '13', '1');
INSERT INTO `bingo_sys_location` VALUES ('5133', '51', '甘孜', '2', '18', '1');
INSERT INTO `bingo_sys_location` VALUES ('5134', '51', '凉山', '2', '17', '1');
INSERT INTO `bingo_sys_location` VALUES ('5201', '52', '贵阳', '2', '10', '1');
INSERT INTO `bingo_sys_location` VALUES ('5202', '52', '六盘水', '2', '4', '1');
INSERT INTO `bingo_sys_location` VALUES ('5203', '52', '遵义', '2', '14', '1');
INSERT INTO `bingo_sys_location` VALUES ('5204', '52', '安顺', '2', '6', '1');
INSERT INTO `bingo_sys_location` VALUES ('5222', '52', '铜仁', '2', '10', '1');
INSERT INTO `bingo_sys_location` VALUES ('5223', '52', '黔西南', '2', '8', '1');
INSERT INTO `bingo_sys_location` VALUES ('5224', '52', '毕节', '2', '8', '1');
INSERT INTO `bingo_sys_location` VALUES ('5226', '52', '黔东南', '2', '16', '1');
INSERT INTO `bingo_sys_location` VALUES ('5227', '52', '黔南', '2', '12', '1');
INSERT INTO `bingo_sys_location` VALUES ('5301', '53', '昆明', '2', '14', '1');
INSERT INTO `bingo_sys_location` VALUES ('5303', '53', '曲靖', '2', '9', '1');
INSERT INTO `bingo_sys_location` VALUES ('5304', '53', '玉溪', '2', '9', '1');
INSERT INTO `bingo_sys_location` VALUES ('5305', '53', '保山', '2', '5', '1');
INSERT INTO `bingo_sys_location` VALUES ('5306', '53', '昭通', '2', '11', '1');
INSERT INTO `bingo_sys_location` VALUES ('5307', '53', '丽江', '2', '5', '1');
INSERT INTO `bingo_sys_location` VALUES ('5308', '53', '普洱', '2', '10', '1');
INSERT INTO `bingo_sys_location` VALUES ('5309', '53', '临沧', '2', '8', '1');
INSERT INTO `bingo_sys_location` VALUES ('5323', '53', '楚雄', '2', '10', '1');
INSERT INTO `bingo_sys_location` VALUES ('5325', '53', '红河', '2', '13', '1');
INSERT INTO `bingo_sys_location` VALUES ('5326', '53', '文山', '2', '8', '1');
INSERT INTO `bingo_sys_location` VALUES ('5328', '53', '西双版纳', '2', '3', '1');
INSERT INTO `bingo_sys_location` VALUES ('5329', '53', '大理', '2', '12', '1');
INSERT INTO `bingo_sys_location` VALUES ('5331', '53', '德宏', '2', '5', '1');
INSERT INTO `bingo_sys_location` VALUES ('5333', '53', '怒江傈', '2', '4', '1');
INSERT INTO `bingo_sys_location` VALUES ('5334', '53', '迪庆', '2', '3', '1');
INSERT INTO `bingo_sys_location` VALUES ('5401', '54', '拉萨', '2', '8', '1');
INSERT INTO `bingo_sys_location` VALUES ('5421', '54', '昌都', '2', '11', '1');
INSERT INTO `bingo_sys_location` VALUES ('5422', '54', '山南', '2', '12', '1');
INSERT INTO `bingo_sys_location` VALUES ('5423', '54', '日喀则', '2', '18', '1');
INSERT INTO `bingo_sys_location` VALUES ('5424', '54', '那曲', '2', '10', '1');
INSERT INTO `bingo_sys_location` VALUES ('5425', '54', '阿里', '2', '7', '1');
INSERT INTO `bingo_sys_location` VALUES ('5426', '54', '林芝', '2', '7', '1');
INSERT INTO `bingo_sys_location` VALUES ('6101', '61', '西安', '2', '13', '1');
INSERT INTO `bingo_sys_location` VALUES ('6102', '61', '铜川', '2', '4', '1');
INSERT INTO `bingo_sys_location` VALUES ('6103', '61', '宝鸡', '2', '12', '1');
INSERT INTO `bingo_sys_location` VALUES ('6104', '61', '咸阳', '2', '14', '1');
INSERT INTO `bingo_sys_location` VALUES ('6105', '61', '渭南', '2', '11', '1');
INSERT INTO `bingo_sys_location` VALUES ('6106', '61', '延安', '2', '13', '1');
INSERT INTO `bingo_sys_location` VALUES ('6107', '61', '汉中', '2', '11', '1');
INSERT INTO `bingo_sys_location` VALUES ('6108', '61', '榆林', '2', '12', '1');
INSERT INTO `bingo_sys_location` VALUES ('6109', '61', '安康', '2', '10', '1');
INSERT INTO `bingo_sys_location` VALUES ('6110', '61', '商洛', '2', '7', '1');
INSERT INTO `bingo_sys_location` VALUES ('6201', '62', '兰州', '2', '8', '1');
INSERT INTO `bingo_sys_location` VALUES ('6202', '62', '嘉峪关', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('6203', '62', '金昌', '2', '2', '1');
INSERT INTO `bingo_sys_location` VALUES ('6204', '62', '白银', '2', '5', '1');
INSERT INTO `bingo_sys_location` VALUES ('6205', '62', '天水', '2', '7', '1');
INSERT INTO `bingo_sys_location` VALUES ('6206', '62', '武威', '2', '4', '1');
INSERT INTO `bingo_sys_location` VALUES ('6207', '62', '张掖', '2', '6', '1');
INSERT INTO `bingo_sys_location` VALUES ('6208', '62', '平凉', '2', '7', '1');
INSERT INTO `bingo_sys_location` VALUES ('6209', '62', '酒泉', '2', '7', '1');
INSERT INTO `bingo_sys_location` VALUES ('6210', '62', '庆阳', '2', '8', '1');
INSERT INTO `bingo_sys_location` VALUES ('6211', '62', '定西', '2', '7', '1');
INSERT INTO `bingo_sys_location` VALUES ('6212', '62', '陇南', '2', '9', '1');
INSERT INTO `bingo_sys_location` VALUES ('6229', '62', '临夏', '2', '8', '1');
INSERT INTO `bingo_sys_location` VALUES ('6230', '62', '甘南', '2', '8', '1');
INSERT INTO `bingo_sys_location` VALUES ('6301', '63', '西宁', '2', '7', '1');
INSERT INTO `bingo_sys_location` VALUES ('6321', '63', '海东', '2', '6', '1');
INSERT INTO `bingo_sys_location` VALUES ('6322', '63', '海北', '2', '4', '1');
INSERT INTO `bingo_sys_location` VALUES ('6323', '63', '黄南', '2', '4', '1');
INSERT INTO `bingo_sys_location` VALUES ('6325', '63', '海南', '2', '5', '1');
INSERT INTO `bingo_sys_location` VALUES ('6326', '63', '果洛', '2', '6', '1');
INSERT INTO `bingo_sys_location` VALUES ('6327', '63', '玉树', '2', '6', '1');
INSERT INTO `bingo_sys_location` VALUES ('6328', '63', '海西', '2', '5', '1');
INSERT INTO `bingo_sys_location` VALUES ('6401', '64', '银川', '2', '6', '1');
INSERT INTO `bingo_sys_location` VALUES ('6402', '64', '石嘴山', '2', '3', '1');
INSERT INTO `bingo_sys_location` VALUES ('6403', '64', '吴忠', '2', '5', '1');
INSERT INTO `bingo_sys_location` VALUES ('6404', '64', '固原', '2', '5', '1');
INSERT INTO `bingo_sys_location` VALUES ('6405', '64', '中卫', '2', '3', '1');
INSERT INTO `bingo_sys_location` VALUES ('6501', '65', '乌鲁木齐', '2', '8', '1');
INSERT INTO `bingo_sys_location` VALUES ('6502', '65', '克拉玛依', '2', '4', '1');
INSERT INTO `bingo_sys_location` VALUES ('6521', '65', '吐鲁番', '2', '3', '1');
INSERT INTO `bingo_sys_location` VALUES ('6522', '65', '哈密', '2', '3', '1');
INSERT INTO `bingo_sys_location` VALUES ('6523', '65', '昌吉', '2', '7', '1');
INSERT INTO `bingo_sys_location` VALUES ('6527', '65', '博尔塔拉', '2', '3', '1');
INSERT INTO `bingo_sys_location` VALUES ('6528', '65', '巴音郭楞', '2', '9', '1');
INSERT INTO `bingo_sys_location` VALUES ('6529', '65', '阿克苏', '2', '9', '1');
INSERT INTO `bingo_sys_location` VALUES ('6530', '65', '克孜勒苏', '2', '4', '1');
INSERT INTO `bingo_sys_location` VALUES ('6531', '65', '喀什', '2', '12', '1');
INSERT INTO `bingo_sys_location` VALUES ('6532', '65', '和田', '2', '8', '1');
INSERT INTO `bingo_sys_location` VALUES ('6540', '65', '伊犁', '2', '10', '1');
INSERT INTO `bingo_sys_location` VALUES ('6542', '65', '塔城', '2', '7', '1');
INSERT INTO `bingo_sys_location` VALUES ('6543', '65', '阿勒泰', '2', '7', '1');
INSERT INTO `bingo_sys_location` VALUES ('6544', '65', '石河子', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('6545', '65', '阿拉尔', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('6546', '65', '图木舒克', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('6547', '65', '五家渠', '2', '1', '1');
INSERT INTO `bingo_sys_location` VALUES ('7101', '71', '台北市', '2', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('7102', '71', '高雄市', '2', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('7103', '71', '基隆市', '2', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('7104', '71', '台中市', '2', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('7105', '71', '台南市', '2', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('7106', '71', '新竹市', '2', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('7107', '71', '嘉义市', '2', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('7108', '71', '台北县', '2', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('7109', '71', '宜兰县', '2', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('7110', '71', '新竹县', '2', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('7111', '71', '桃园县', '2', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('7112', '71', '苗栗县', '2', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('7113', '71', '台中县', '2', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('7114', '71', '彰化县', '2', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('7115', '71', '南投县', '2', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('7116', '71', '嘉义县', '2', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('7117', '71', '云林县', '2', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('7118', '71', '台南县', '2', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('7119', '71', '高雄县', '2', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('7120', '71', '屏东县', '2', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('7121', '71', '台东县', '2', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('7122', '71', '花莲县', '2', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('7123', '71', '澎湖县', '2', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('8101', '81', '中西区', '2', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('8102', '81', '东区', '2', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('8103', '81', '九龙城区', '2', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('8104', '81', '观塘区', '2', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('8105', '81', '南区', '2', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('8106', '81', '深水区', '2', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('8107', '81', '湾仔区', '2', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('8108', '81', '黄大仙区', '2', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('8109', '81', '油尖旺区', '2', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('8110', '81', '离岛区', '2', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('8111', '81', '葵青区', '2', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('8112', '81', '北区', '2', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('8113', '81', '西贡区', '2', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('8114', '81', '沙田区', '2', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('8115', '81', '屯门区', '2', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('8116', '81', '大埔区', '2', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('8117', '81', '荃湾区', '2', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('8118', '81', '元朗区', '2', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('8201', '82', '花地玛堂区', '2', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('8202', '82', '圣安多尼堂区', '2', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('8203', '82', '大堂区', '2', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('8204', '82', '望德堂区', '2', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('8205', '82', '风顺堂区', '2', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('8206', '82', '嘉模堂区', '2', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('8207', '82', '圣方济各堂区', '2', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('110202', '1102', '西城区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('110303', '1103', '崇文区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('110404', '1104', '宣武区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('110505', '1105', '朝阳区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('110606', '1106', '丰台区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('110707', '1107', '石景山区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('110808', '1108', '海淀区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('110909', '1109', '门头沟区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('111111', '1111', '房山区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('111212', '1112', '通州区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('111313', '1113', '顺义区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('112114', '1121', '昌平区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('112415', '1124', '大兴区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('112617', '1126', '平谷区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('112716', '1127', '怀柔区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('112828', '1128', '密云县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('112929', '1129', '延庆县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('120101', '1201', '和平区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('120202', '1202', '河东区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('120303', '1203', '河西区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('120404', '1204', '南开区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('120505', '1205', '河北区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('120606', '1206', '红桥区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('120707', '1207', '滨海新区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('121010', '1210', '东丽区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('121111', '1211', '西青区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('121212', '1212', '津南区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('121313', '1213', '北辰区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('122121', '1221', '宁河县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('122214', '1222', '武清区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('122323', '1223', '静海县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('122415', '1224', '宝坻区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('122525', '1225', '蓟县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130102', '1301', '长安区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130103', '1301', '桥东区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130104', '1301', '桥西区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130105', '1301', '新华区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130107', '1301', '井陉矿区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130108', '1301', '裕华区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130121', '1301', '井陉县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130123', '1301', '正定县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130124', '1301', '栾城县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130125', '1301', '行唐县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130126', '1301', '灵寿县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130127', '1301', '高邑县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130128', '1301', '深泽县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130129', '1301', '赞皇县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130130', '1301', '无极县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130131', '1301', '平山县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130132', '1301', '元氏县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130133', '1301', '赵县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130181', '1301', '辛集市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130182', '1301', '藁城市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130183', '1301', '晋州市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130184', '1301', '新乐市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130185', '1301', '鹿泉市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130202', '1302', '路南区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130203', '1302', '路北区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130204', '1302', '古冶区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130205', '1302', '开平区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130207', '1302', '丰南区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130208', '1302', '丰润区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130223', '1302', '滦县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130224', '1302', '滦南县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130225', '1302', '乐亭县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130227', '1302', '迁西县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130229', '1302', '玉田县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130230', '1302', '唐海县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130281', '1302', '遵化市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130283', '1302', '迁安市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130302', '1303', '海港区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130303', '1303', '山海关区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130304', '1303', '北戴河区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130321', '1303', '青龙满族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130322', '1303', '昌黎县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130323', '1303', '抚宁县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130324', '1303', '卢龙县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130402', '1304', '邯山区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130403', '1304', '丛台区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130404', '1304', '复兴区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130406', '1304', '峰峰矿区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130421', '1304', '邯郸县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130423', '1304', '临漳县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130424', '1304', '成安县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130425', '1304', '大名县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130426', '1304', '涉县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130427', '1304', '磁县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130428', '1304', '肥乡县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130429', '1304', '永年县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130430', '1304', '邱县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130431', '1304', '鸡泽县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130432', '1304', '广平县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130433', '1304', '馆陶县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130434', '1304', '魏县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130435', '1304', '曲周县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130481', '1304', '武安市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130502', '1305', '桥东区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130503', '1305', '桥西区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130521', '1305', '邢台县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130522', '1305', '临城县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130523', '1305', '内丘县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130524', '1305', '柏乡县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130525', '1305', '隆尧县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130526', '1305', '任县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130527', '1305', '南和县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130528', '1305', '宁晋县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130529', '1305', '巨鹿县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130530', '1305', '新河县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130531', '1305', '广宗县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130532', '1305', '平乡县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130533', '1305', '威县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130534', '1305', '清河县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130535', '1305', '临西县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130581', '1305', '南宫市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130582', '1305', '沙河市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130602', '1306', '新市区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130603', '1306', '北市区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130604', '1306', '南市区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130621', '1306', '满城县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130622', '1306', '清苑县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130623', '1306', '涞水县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130624', '1306', '阜平县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130625', '1306', '徐水县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130626', '1306', '定兴县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130627', '1306', '唐县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130628', '1306', '高阳县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130629', '1306', '容城县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130630', '1306', '涞源县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130631', '1306', '望都县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130632', '1306', '安新县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130633', '1306', '易县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130634', '1306', '曲阳县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130635', '1306', '蠡县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130636', '1306', '顺平县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130637', '1306', '博野县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130638', '1306', '雄县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130681', '1306', '涿州市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130682', '1306', '定州市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130683', '1306', '安国市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130684', '1306', '高碑店市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130702', '1307', '桥东区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130703', '1307', '桥西区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130705', '1307', '宣化区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130706', '1307', '下花园区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130721', '1307', '宣化县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130722', '1307', '张北县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130723', '1307', '康保县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130724', '1307', '沽源县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130725', '1307', '尚义县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130726', '1307', '蔚县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130727', '1307', '阳原县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130728', '1307', '怀安县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130729', '1307', '万全县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130730', '1307', '怀来县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130731', '1307', '涿鹿县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130732', '1307', '赤城县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130733', '1307', '崇礼县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130802', '1308', '双桥区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130803', '1308', '双滦区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130804', '1308', '鹰手营子矿区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130821', '1308', '承德县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130822', '1308', '兴隆县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130823', '1308', '平泉县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130824', '1308', '滦平县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130825', '1308', '隆化县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130826', '1308', '丰宁满族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130827', '1308', '宽城满族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130828', '1308', '围场满族蒙古族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130902', '1309', '新华区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130903', '1309', '运河区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130921', '1309', '沧县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130922', '1309', '青县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130923', '1309', '东光县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130924', '1309', '海兴县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130925', '1309', '盐山县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130926', '1309', '肃宁县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130927', '1309', '南皮县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130928', '1309', '吴桥县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130929', '1309', '献县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130930', '1309', '孟村回族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130981', '1309', '泊头市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130982', '1309', '任丘市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130983', '1309', '黄骅市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('130984', '1309', '河间市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('131002', '1310', '安次区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('131003', '1310', '广阳区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('131022', '1310', '固安县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('131023', '1310', '永清县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('131024', '1310', '香河县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('131025', '1310', '大城县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('131026', '1310', '文安县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('131028', '1310', '大厂回族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('131081', '1310', '霸州市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('131082', '1310', '三河市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('131102', '1311', '桃城区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('131121', '1311', '枣强县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('131122', '1311', '武邑县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('131123', '1311', '武强县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('131124', '1311', '饶阳县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('131125', '1311', '安平县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('131126', '1311', '故城县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('131127', '1311', '景县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('131128', '1311', '阜城县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('131181', '1311', '冀州市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('131182', '1311', '深州市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140105', '1401', '小店区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140106', '1401', '迎泽区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140107', '1401', '杏花岭区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140108', '1401', '尖草坪区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140109', '1401', '万柏林区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140110', '1401', '晋源区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140121', '1401', '清徐县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140122', '1401', '阳曲县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140123', '1401', '娄烦县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140181', '1401', '古交市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140202', '1402', '城区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140203', '1402', '矿区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140211', '1402', '南郊区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140212', '1402', '新荣区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140221', '1402', '阳高县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140222', '1402', '天镇县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140223', '1402', '广灵县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140224', '1402', '灵丘县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140225', '1402', '浑源县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140226', '1402', '左云县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140227', '1402', '大同县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140302', '1403', '城区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140303', '1403', '矿区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140311', '1403', '郊区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140321', '1403', '平定县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140322', '1403', '盂县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140402', '1404', '城区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140411', '1404', '郊区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140421', '1404', '长治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140423', '1404', '襄垣县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140424', '1404', '屯留县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140425', '1404', '平顺县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140426', '1404', '黎城县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140427', '1404', '壶关县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140428', '1404', '长子县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140429', '1404', '武乡县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140430', '1404', '沁县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140431', '1404', '沁源县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140481', '1404', '潞城市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140502', '1405', '城区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140521', '1405', '沁水县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140522', '1405', '阳城县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140524', '1405', '陵川县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140525', '1405', '泽州县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140581', '1405', '高平市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140602', '1406', '朔城区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140603', '1406', '平鲁区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140621', '1406', '山阴县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140622', '1406', '应县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140623', '1406', '右玉县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140624', '1406', '怀仁县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140702', '1407', '榆次区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140721', '1407', '榆社县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140722', '1407', '左权县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140723', '1407', '和顺县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140724', '1407', '昔阳县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140725', '1407', '寿阳县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140726', '1407', '太谷县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140727', '1407', '祁县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140728', '1407', '平遥县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140729', '1407', '灵石县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140781', '1407', '介休市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140802', '1408', '盐湖区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140821', '1408', '临猗县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140822', '1408', '万荣县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140823', '1408', '闻喜县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140824', '1408', '稷山县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140825', '1408', '新绛县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140826', '1408', '绛县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140827', '1408', '垣曲县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140828', '1408', '夏县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140829', '1408', '平陆县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140830', '1408', '芮城县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140881', '1408', '永济市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140882', '1408', '河津市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140902', '1409', '忻府区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140921', '1409', '定襄县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140922', '1409', '五台县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140923', '1409', '代县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140924', '1409', '繁峙县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140925', '1409', '宁武县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140926', '1409', '静乐县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140927', '1409', '神池县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140928', '1409', '五寨县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140929', '1409', '岢岚县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140930', '1409', '河曲县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140931', '1409', '保德县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140932', '1409', '偏关县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('140981', '1409', '原平市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('141002', '1410', '尧都区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('141021', '1410', '曲沃县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('141022', '1410', '翼城县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('141023', '1410', '襄汾县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('141024', '1410', '洪洞县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('141025', '1410', '古县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('141026', '1410', '安泽县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('141027', '1410', '浮山县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('141028', '1410', '吉县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('141029', '1410', '乡宁县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('141030', '1410', '大宁县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('141031', '1410', '隰县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('141032', '1410', '永和县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('141033', '1410', '蒲县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('141034', '1410', '汾西县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('141081', '1410', '侯马市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('141082', '1410', '霍州市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('141102', '1411', '离石区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('141121', '1411', '文水县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('141122', '1411', '交城县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('141123', '1411', '兴县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('141124', '1411', '临县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('141125', '1411', '柳林县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('141126', '1411', '石楼县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('141127', '1411', '岚县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('141128', '1411', '方山县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('141129', '1411', '中阳县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('141130', '1411', '交口县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('141181', '1411', '孝义市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('141182', '1411', '汾阳市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150102', '1501', '新城区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150103', '1501', '回民区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150104', '1501', '玉泉区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150105', '1501', '赛罕区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150121', '1501', '土默特左旗', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150122', '1501', '托克托县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150123', '1501', '和林格尔县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150124', '1501', '清水河县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150125', '1501', '武川县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150202', '1502', '东河区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150203', '1502', '昆都仑区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150204', '1502', '青山区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150205', '1502', '石拐区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150206', '1502', '白云矿区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150207', '1502', '九原区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150221', '1502', '土默特右旗', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150222', '1502', '固阳县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150223', '1502', '达尔罕茂明安联合旗', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150302', '1503', '海勃湾区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150303', '1503', '海南区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150304', '1503', '乌达区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150402', '1504', '红山区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150403', '1504', '元宝山区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150404', '1504', '松山区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150421', '1504', '阿鲁科尔沁旗', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150422', '1504', '巴林左旗', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150423', '1504', '巴林右旗', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150424', '1504', '林西县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150425', '1504', '克什克腾旗', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150426', '1504', '翁牛特旗', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150428', '1504', '喀喇沁旗', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150429', '1504', '宁城县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150430', '1504', '敖汉旗', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150502', '1505', '科尔沁区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150521', '1505', '科尔沁左翼中旗', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150522', '1505', '科尔沁左翼后旗', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150523', '1505', '开鲁县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150524', '1505', '库伦旗', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150525', '1505', '奈曼旗', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150526', '1505', '扎鲁特旗', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150581', '1505', '霍林郭勒市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150602', '1506', '东胜区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150621', '1506', '达拉特旗', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150622', '1506', '准格尔旗', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150623', '1506', '鄂托克前旗', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150624', '1506', '鄂托克旗', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150625', '1506', '杭锦旗', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150626', '1506', '乌审旗', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150627', '1506', '伊金霍洛旗', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150702', '1507', '海拉尔区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150721', '1507', '阿荣旗', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150722', '1507', '莫力达瓦达斡尔族自治旗', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150723', '1507', '鄂伦春自治旗', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150724', '1507', '鄂温克族自治旗', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150725', '1507', '陈巴尔虎旗', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150726', '1507', '新巴尔虎左旗', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150727', '1507', '新巴尔虎右旗', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150781', '1507', '满洲里市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150782', '1507', '牙克石市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150783', '1507', '扎兰屯市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150784', '1507', '额尔古纳市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150785', '1507', '根河市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150802', '1508', '临河区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150821', '1508', '五原县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150822', '1508', '磴口县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150823', '1508', '乌拉特前旗', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150824', '1508', '乌拉特中旗', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150825', '1508', '乌拉特后旗', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150826', '1508', '杭锦后旗', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150902', '1509', '集宁区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150921', '1509', '卓资县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150922', '1509', '化德县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150923', '1509', '商都县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150924', '1509', '兴和县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150925', '1509', '凉城县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150926', '1509', '察哈尔右翼前旗', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150927', '1509', '察哈尔右翼中旗', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150928', '1509', '察哈尔右翼后旗', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150929', '1509', '四子王旗', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('150981', '1509', '丰镇市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('152201', '1522', '乌兰浩特市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('152202', '1522', '阿尔山市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('152221', '1522', '科尔沁右翼前旗', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('152222', '1522', '科尔沁右翼中旗', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('152223', '1522', '扎赉特旗', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('152224', '1522', '突泉县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('152501', '1525', '二连浩特市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('152502', '1525', '锡林浩特市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('152522', '1525', '阿巴嘎旗', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('152523', '1525', '苏尼特左旗', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('152524', '1525', '苏尼特右旗', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('152525', '1525', '东乌珠穆沁旗', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('152526', '1525', '西乌珠穆沁旗', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('152527', '1525', '太仆寺旗', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('152528', '1525', '镶黄旗', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('152529', '1525', '正镶白旗', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('152530', '1525', '正蓝旗', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('152531', '1525', '多伦县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('152921', '1529', '阿拉善左旗', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('152922', '1529', '阿拉善右旗', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('152923', '1529', '额济纳旗', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210102', '2101', '和平区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210103', '2101', '沈河区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210104', '2101', '大东区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210105', '2101', '皇姑区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210106', '2101', '铁西区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210111', '2101', '苏家屯区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210112', '2101', '东陵区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210113', '2101', '新城子区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210114', '2101', '于洪区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210122', '2101', '辽中县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210123', '2101', '康平县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210124', '2101', '法库县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210181', '2101', '新民市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210202', '2102', '中山区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210203', '2102', '西岗区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210204', '2102', '沙河口区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210211', '2102', '甘井子区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210212', '2102', '旅顺口区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210213', '2102', '金州区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210224', '2102', '长海县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210281', '2102', '瓦房店市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210282', '2102', '普兰店市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210283', '2102', '庄河市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210302', '2103', '铁东区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210303', '2103', '铁西区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210304', '2103', '立山区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210311', '2103', '千山区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210321', '2103', '台安县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210323', '2103', '岫岩满族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210381', '2103', '海城市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210402', '2104', '新抚区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210403', '2104', '东洲区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210404', '2104', '望花区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210411', '2104', '顺城区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210421', '2104', '抚顺县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210422', '2104', '新宾满族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210423', '2104', '清原满族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210502', '2105', '平山区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210503', '2105', '溪湖区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210504', '2105', '明山区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210505', '2105', '南芬区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210521', '2105', '本溪满族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210522', '2105', '桓仁满族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210602', '2106', '元宝区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210603', '2106', '振兴区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210604', '2106', '振安区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210624', '2106', '宽甸满族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210681', '2106', '东港市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210682', '2106', '凤城市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210702', '2107', '古塔区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210703', '2107', '凌河区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210711', '2107', '太和区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210726', '2107', '黑山县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210727', '2107', '义县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210781', '2107', '凌海市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210782', '2107', '北镇市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210802', '2108', '站前区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210803', '2108', '西市区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210804', '2108', '鲅鱼圈区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210811', '2108', '老边区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210881', '2108', '盖州市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210882', '2108', '大石桥市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210902', '2109', '海州区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210903', '2109', '新邱区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210904', '2109', '太平区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210905', '2109', '清河门区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210911', '2109', '细河区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210921', '2109', '阜新蒙古族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('210922', '2109', '彰武县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('211002', '2110', '白塔区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('211003', '2110', '文圣区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('211004', '2110', '宏伟区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('211005', '2110', '弓长岭区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('211011', '2110', '太子河区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('211021', '2110', '辽阳县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('211081', '2110', '灯塔市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('211102', '2111', '双台子区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('211103', '2111', '兴隆台区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('211121', '2111', '大洼县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('211122', '2111', '盘山县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('211202', '2112', '银州区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('211204', '2112', '清河区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('211221', '2112', '铁岭县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('211223', '2112', '西丰县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('211224', '2112', '昌图县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('211281', '2112', '调兵山市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('211282', '2112', '开原市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('211302', '2113', '双塔区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('211303', '2113', '龙城区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('211321', '2113', '朝阳县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('211322', '2113', '建平县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('211324', '2113', '喀喇沁左翼蒙古族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('211381', '2113', '北票市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('211382', '2113', '凌源市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('211402', '2114', '连山区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('211403', '2114', '龙港区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('211404', '2114', '南票区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('211421', '2114', '绥中县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('211422', '2114', '建昌县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('211481', '2114', '兴城市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('220102', '2201', '南关区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('220103', '2201', '宽城区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('220104', '2201', '朝阳区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('220105', '2201', '二道区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('220106', '2201', '绿园区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('220112', '2201', '双阳区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('220122', '2201', '农安县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('220181', '2201', '九台市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('220182', '2201', '榆树市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('220183', '2201', '德惠市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('220202', '2202', '昌邑区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('220203', '2202', '龙潭区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('220204', '2202', '船营区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('220211', '2202', '丰满区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('220221', '2202', '永吉县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('220281', '2202', '蛟河市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('220282', '2202', '桦甸市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('220283', '2202', '舒兰市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('220284', '2202', '磐石市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('220302', '2203', '铁西区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('220303', '2203', '铁东区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('220322', '2203', '梨树县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('220323', '2203', '伊通满族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('220381', '2203', '公主岭市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('220382', '2203', '双辽市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('220402', '2204', '龙山区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('220403', '2204', '西安区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('220421', '2204', '东丰县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('220422', '2204', '东辽县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('220502', '2205', '东昌区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('220503', '2205', '二道江区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('220521', '2205', '通化县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('220523', '2205', '辉南县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('220524', '2205', '柳河县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('220581', '2205', '梅河口市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('220582', '2205', '集安市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('220602', '2206', '八道江区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('220604', '2206', '江源区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('220621', '2206', '抚松县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('220622', '2206', '靖宇县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('220623', '2206', '长白朝鲜族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('220681', '2206', '临江市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('220702', '2207', '宁江区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('220721', '2207', '前郭尔罗斯蒙古族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('220722', '2207', '长岭县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('220723', '2207', '乾安县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('220724', '2207', '扶余县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('220802', '2208', '洮北区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('220821', '2208', '镇赉县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('220822', '2208', '通榆县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('220881', '2208', '洮南市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('220882', '2208', '大安市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('222401', '2224', '延吉市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('222402', '2224', '图们市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('222403', '2224', '敦化市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('222404', '2224', '珲春市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('222405', '2224', '龙井市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('222406', '2224', '和龙市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('222424', '2224', '汪清县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('222426', '2224', '安图县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230102', '2301', '道里区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230103', '2301', '南岗区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230104', '2301', '道外区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230108', '2301', '平房区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230109', '2301', '松北区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230110', '2301', '香坊区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230111', '2301', '呼兰区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230112', '2301', '阿城区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230123', '2301', '依兰县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230124', '2301', '方正县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230125', '2301', '宾县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230126', '2301', '巴彦县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230127', '2301', '木兰县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230128', '2301', '通河县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230129', '2301', '延寿县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230182', '2301', '双城市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230183', '2301', '尚志市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230184', '2301', '五常市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230202', '2302', '龙沙区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230203', '2302', '建华区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230204', '2302', '铁锋区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230205', '2302', '昂昂溪区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230206', '2302', '富拉尔基区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230207', '2302', '碾子山区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230208', '2302', '梅里斯达斡尔族区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230221', '2302', '龙江县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230223', '2302', '依安县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230224', '2302', '泰来县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230225', '2302', '甘南县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230227', '2302', '富裕县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230229', '2302', '克山县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230230', '2302', '克东县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230231', '2302', '拜泉县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230281', '2302', '讷河市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230302', '2303', '鸡冠区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230303', '2303', '恒山区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230304', '2303', '滴道区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230305', '2303', '梨树区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230306', '2303', '城子河区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230307', '2303', '麻山区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230321', '2303', '鸡东县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230381', '2303', '虎林市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230382', '2303', '密山市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230402', '2304', '向阳区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230403', '2304', '工农区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230404', '2304', '南山区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230405', '2304', '兴安区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230406', '2304', '东山区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230407', '2304', '兴山区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230421', '2304', '萝北县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230422', '2304', '绥滨县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230502', '2305', '尖山区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230503', '2305', '岭东区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230505', '2305', '四方台区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230506', '2305', '宝山区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230521', '2305', '集贤县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230522', '2305', '友谊县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230523', '2305', '宝清县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230524', '2305', '饶河县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230602', '2306', '萨尔图区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230603', '2306', '龙凤区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230604', '2306', '让胡路区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230605', '2306', '红岗区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230606', '2306', '大同区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230621', '2306', '肇州县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230622', '2306', '肇源县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230623', '2306', '林甸县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230624', '2306', '杜尔伯特蒙古族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230702', '2307', '伊春区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230703', '2307', '南岔区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230704', '2307', '友好区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230705', '2307', '西林区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230706', '2307', '翠峦区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230707', '2307', '新青区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230708', '2307', '美溪区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230709', '2307', '金山屯区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230710', '2307', '五营区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230711', '2307', '乌马河区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230712', '2307', '汤旺河区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230713', '2307', '带岭区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230714', '2307', '乌伊岭区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230715', '2307', '红星区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230716', '2307', '上甘岭区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230722', '2307', '嘉荫县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230781', '2307', '铁力市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230803', '2308', '向阳区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230804', '2308', '前进区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230805', '2308', '东风区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230811', '2308', '郊区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230822', '2308', '桦南县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230826', '2308', '桦川县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230828', '2308', '汤原县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230833', '2308', '抚远县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230881', '2308', '同江市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230882', '2308', '富锦市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230902', '2309', '新兴区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230903', '2309', '桃山区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230904', '2309', '茄子河区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('230921', '2309', '勃利县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('231002', '2310', '东安区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('231003', '2310', '阳明区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('231004', '2310', '爱民区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('231005', '2310', '西安区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('231024', '2310', '东宁县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('231025', '2310', '林口县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('231081', '2310', '绥芬河市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('231083', '2310', '海林市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('231084', '2310', '宁安市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('231085', '2310', '穆棱市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('231102', '2311', '爱辉区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('231121', '2311', '嫩江县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('231123', '2311', '逊克县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('231124', '2311', '孙吴县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('231181', '2311', '北安市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('231182', '2311', '五大连池市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('231202', '2312', '北林区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('231221', '2312', '望奎县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('231222', '2312', '兰西县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('231223', '2312', '青冈县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('231224', '2312', '庆安县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('231225', '2312', '明水县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('231226', '2312', '绥棱县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('231281', '2312', '安达市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('231282', '2312', '肇东市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('231283', '2312', '海伦市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('232701', '2327', '加格达奇区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('232702', '2327', '松岭区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('232703', '2327', '新林区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('232704', '2327', '呼中区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('232721', '2327', '呼玛县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('232722', '2327', '塔河县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('232723', '2327', '漠河县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('310101', '3101', '黄浦区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('310303', '3103', '卢湾区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('310404', '3104', '徐汇区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('310505', '3105', '长宁区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('310606', '3106', '静安区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('310707', '3107', '普陀区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('310808', '3108', '闸北区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('310909', '3109', '虹口区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('311010', '3110', '杨浦区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('311212', '3112', '闵行区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('311313', '3113', '宝山区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('311414', '3114', '嘉定区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('311515', '3115', '浦东新区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('311616', '3116', '金山区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('311717', '3117', '松江区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('312620', '3126', '奉贤区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('312918', '3129', '青浦区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('313030', '3130', '崇明县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320102', '3201', '玄武区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320103', '3201', '白下区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320104', '3201', '秦淮区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320105', '3201', '建邺区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320106', '3201', '鼓楼区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320107', '3201', '下关区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320111', '3201', '浦口区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320113', '3201', '栖霞区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320114', '3201', '雨花台区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320115', '3201', '江宁区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320116', '3201', '六合区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320124', '3201', '溧水县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320125', '3201', '高淳县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320202', '3202', '崇安区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320203', '3202', '南长区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320204', '3202', '北塘区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320205', '3202', '锡山区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320206', '3202', '惠山区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320211', '3202', '滨湖区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320281', '3202', '江阴市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320282', '3202', '宜兴市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320302', '3203', '鼓楼区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320303', '3203', '云龙区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320304', '3203', '九里区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320305', '3203', '贾汪区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320311', '3203', '泉山区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320321', '3203', '丰县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320322', '3203', '沛县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320323', '3203', '铜山县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320324', '3203', '睢宁县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320381', '3203', '新沂市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320382', '3203', '邳州市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320402', '3204', '天宁区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320404', '3204', '钟楼区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320405', '3204', '戚墅堰区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320411', '3204', '新北区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320412', '3204', '武进区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320481', '3204', '溧阳市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320482', '3204', '金坛市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320502', '3205', '沧浪区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320503', '3205', '平江区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320504', '3205', '金阊区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320505', '3205', '虎丘区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320506', '3205', '吴中区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320507', '3205', '相城区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320581', '3205', '常熟市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320582', '3205', '张家港市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320583', '3205', '昆山市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320584', '3205', '吴江市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320585', '3205', '太仓市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320602', '3206', '崇川区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320611', '3206', '港闸区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320621', '3206', '海安县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320623', '3206', '如东县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320681', '3206', '启东市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320682', '3206', '如皋市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320683', '3206', '通州市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320684', '3206', '海门市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320703', '3207', '连云区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320705', '3207', '新浦区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320706', '3207', '海州区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320721', '3207', '赣榆县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320722', '3207', '东海县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320723', '3207', '灌云县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320724', '3207', '灌南县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320802', '3208', '清河区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320803', '3208', '楚州区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320804', '3208', '淮阴区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320811', '3208', '清浦区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320826', '3208', '涟水县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320829', '3208', '洪泽县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320830', '3208', '盱眙县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320831', '3208', '金湖县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320902', '3209', '亭湖区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320903', '3209', '盐都区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320921', '3209', '响水县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320922', '3209', '滨海县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320923', '3209', '阜宁县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320924', '3209', '射阳县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320925', '3209', '建湖县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320981', '3209', '东台市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('320982', '3209', '大丰市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('321002', '3210', '广陵区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('321003', '3210', '邗江区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('321011', '3210', '维扬区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('321023', '3210', '宝应县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('321081', '3210', '仪征市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('321084', '3210', '高邮市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('321088', '3210', '江都市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('321102', '3211', '京口区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('321111', '3211', '润州区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('321112', '3211', '丹徒区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('321181', '3211', '丹阳市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('321182', '3211', '扬中市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('321183', '3211', '句容市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('321202', '3212', '海陵区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('321203', '3212', '高港区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('321281', '3212', '兴化市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('321282', '3212', '靖江市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('321283', '3212', '泰兴市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('321284', '3212', '姜堰市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('321302', '3213', '宿城区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('321311', '3213', '宿豫区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('321322', '3213', '沭阳县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('321323', '3213', '泗阳县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('321324', '3213', '泗洪县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330102', '3301', '上城区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330103', '3301', '下城区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330104', '3301', '江干区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330105', '3301', '拱墅区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330106', '3301', '西湖区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330108', '3301', '滨江区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330109', '3301', '萧山区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330110', '3301', '余杭区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330122', '3301', '桐庐县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330127', '3301', '淳安县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330182', '3301', '建德市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330183', '3301', '富阳市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330185', '3301', '临安市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330203', '3302', '海曙区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330204', '3302', '江东区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330205', '3302', '江北区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330206', '3302', '北仑区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330211', '3302', '镇海区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330212', '3302', '鄞州区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330225', '3302', '象山县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330226', '3302', '宁海县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330281', '3302', '余姚市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330282', '3302', '慈溪市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330283', '3302', '奉化市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330302', '3303', '鹿城区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330303', '3303', '龙湾区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330304', '3303', '瓯海区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330322', '3303', '洞头县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330324', '3303', '永嘉县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330326', '3303', '平阳县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330327', '3303', '苍南县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330328', '3303', '文成县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330329', '3303', '泰顺县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330381', '3303', '瑞安市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330382', '3303', '乐清市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330402', '3304', '南湖区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330411', '3304', '秀洲区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330421', '3304', '嘉善县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330424', '3304', '海盐县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330481', '3304', '海宁市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330482', '3304', '平湖市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330483', '3304', '桐乡市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330502', '3305', '吴兴区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330503', '3305', '南浔区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330521', '3305', '德清县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330522', '3305', '长兴县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330523', '3305', '安吉县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330602', '3306', '越城区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330621', '3306', '绍兴县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330624', '3306', '新昌县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330681', '3306', '诸暨市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330682', '3306', '上虞市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330683', '3306', '嵊州市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330702', '3307', '婺城区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330703', '3307', '金东区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330723', '3307', '武义县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330726', '3307', '浦江县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330727', '3307', '磐安县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330781', '3307', '兰溪市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330782', '3307', '义乌市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330783', '3307', '东阳市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330784', '3307', '永康市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330802', '3308', '柯城区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330803', '3308', '衢江区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330822', '3308', '常山县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330824', '3308', '开化县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330825', '3308', '龙游县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330881', '3308', '江山市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330902', '3309', '定海区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330903', '3309', '普陀区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330921', '3309', '岱山县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('330922', '3309', '嵊泗县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('331002', '3310', '椒江区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('331003', '3310', '黄岩区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('331004', '3310', '路桥区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('331021', '3310', '玉环县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('331022', '3310', '三门县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('331023', '3310', '天台县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('331024', '3310', '仙居县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('331081', '3310', '温岭市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('331082', '3310', '临海市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('331102', '3311', '莲都区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('331121', '3311', '青田县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('331122', '3311', '缙云县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('331123', '3311', '遂昌县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('331124', '3311', '松阳县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('331125', '3311', '云和县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('331126', '3311', '庆元县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('331127', '3311', '景宁畲族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('331181', '3311', '龙泉市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('340102', '3401', '瑶海区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('340103', '3401', '庐阳区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('340104', '3401', '蜀山区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('340111', '3401', '包河区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('340121', '3401', '长丰县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('340122', '3401', '肥东县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('340123', '3401', '肥西县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('340202', '3402', '镜湖区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('340203', '3402', '弋江区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('340207', '3402', '鸠江区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('340208', '3402', '三山区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('340221', '3402', '芜湖县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('340222', '3402', '繁昌县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('340223', '3402', '南陵县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('340302', '3403', '龙子湖区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('340303', '3403', '蚌山区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('340304', '3403', '禹会区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('340311', '3403', '淮上区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('340321', '3403', '怀远县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('340322', '3403', '五河县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('340323', '3403', '固镇县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('340402', '3404', '大通区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('340403', '3404', '田家庵区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('340404', '3404', '谢家集区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('340405', '3404', '八公山区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('340406', '3404', '潘集区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('340421', '3404', '凤台县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('340502', '3405', '金家庄区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('340503', '3405', '花山区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('340504', '3405', '雨山区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('340521', '3405', '当涂县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('340602', '3406', '杜集区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('340603', '3406', '相山区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('340604', '3406', '烈山区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('340621', '3406', '濉溪县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('340702', '3407', '铜官山区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('340703', '3407', '狮子山区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('340711', '3407', '郊区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('340721', '3407', '铜陵县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('340802', '3408', '迎江区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('340803', '3408', '大观区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('340811', '3408', '宜秀区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('340822', '3408', '怀宁县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('340823', '3408', '枞阳县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('340824', '3408', '潜山县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('340825', '3408', '太湖县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('340826', '3408', '宿松县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('340827', '3408', '望江县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('340828', '3408', '岳西县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('340881', '3408', '桐城市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('341002', '3410', '屯溪区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('341003', '3410', '黄山区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('341004', '3410', '徽州区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('341021', '3410', '歙县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('341022', '3410', '休宁县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('341023', '3410', '黟县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('341024', '3410', '祁门县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('341102', '3411', '琅琊区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('341103', '3411', '南谯区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('341122', '3411', '来安县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('341124', '3411', '全椒县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('341125', '3411', '定远县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('341126', '3411', '凤阳县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('341181', '3411', '天长市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('341182', '3411', '明光市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('341202', '3412', '颍州区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('341203', '3412', '颍东区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('341204', '3412', '颍泉区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('341221', '3412', '临泉县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('341222', '3412', '太和县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('341225', '3412', '阜南县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('341226', '3412', '颍上县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('341282', '3412', '界首市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('341302', '3413', '埇桥区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('341321', '3413', '砀山县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('341322', '3413', '萧县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('341323', '3413', '灵璧县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('341324', '3413', '泗县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('341402', '3414', '居巢区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('341421', '3414', '庐江县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('341422', '3414', '无为县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('341423', '3414', '含山县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('341424', '3414', '和县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('341502', '3415', '金安区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('341503', '3415', '裕安区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('341521', '3415', '寿县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('341522', '3415', '霍邱县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('341523', '3415', '舒城县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('341524', '3415', '金寨县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('341525', '3415', '霍山县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('341602', '3416', '谯城区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('341621', '3416', '涡阳县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('341622', '3416', '蒙城县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('341623', '3416', '利辛县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('341702', '3417', '贵池区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('341721', '3417', '东至县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('341722', '3417', '石台县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('341723', '3417', '青阳县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('341802', '3418', '宣州区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('341821', '3418', '郎溪县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('341822', '3418', '广德县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('341823', '3418', '泾县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('341824', '3418', '绩溪县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('341825', '3418', '旌德县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('341881', '3418', '宁国市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350102', '3501', '鼓楼区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350103', '3501', '台江区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350104', '3501', '仓山区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350105', '3501', '马尾区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350111', '3501', '晋安区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350121', '3501', '闽侯县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350122', '3501', '连江县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350123', '3501', '罗源县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350124', '3501', '闽清县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350125', '3501', '永泰县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350128', '3501', '平潭县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350181', '3501', '福清市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350182', '3501', '长乐市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350203', '3502', '思明区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350205', '3502', '海沧区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350206', '3502', '湖里区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350211', '3502', '集美区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350212', '3502', '同安区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350213', '3502', '翔安区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350302', '3503', '城厢区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350303', '3503', '涵江区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350304', '3503', '荔城区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350305', '3503', '秀屿区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350322', '3503', '仙游县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350402', '3504', '梅列区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350403', '3504', '三元区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350421', '3504', '明溪县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350423', '3504', '清流县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350424', '3504', '宁化县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350425', '3504', '大田县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350426', '3504', '尤溪县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350427', '3504', '沙县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350428', '3504', '将乐县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350429', '3504', '泰宁县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350430', '3504', '建宁县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350481', '3504', '永安市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350502', '3505', '鲤城区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350503', '3505', '丰泽区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350504', '3505', '洛江区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350505', '3505', '泉港区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350521', '3505', '惠安县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350524', '3505', '安溪县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350525', '3505', '永春县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350526', '3505', '德化县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350527', '3505', '金门县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350581', '3505', '石狮市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350582', '3505', '晋江市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350583', '3505', '南安市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350602', '3506', '芗城区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350603', '3506', '龙文区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350622', '3506', '云霄县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350623', '3506', '漳浦县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350624', '3506', '诏安县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350625', '3506', '长泰县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350626', '3506', '东山县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350627', '3506', '南靖县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350628', '3506', '平和县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350629', '3506', '华安县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350681', '3506', '龙海市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350702', '3507', '延平区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350721', '3507', '顺昌县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350722', '3507', '浦城县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350723', '3507', '光泽县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350724', '3507', '松溪县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350725', '3507', '政和县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350781', '3507', '邵武市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350782', '3507', '武夷山市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350783', '3507', '建瓯市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350784', '3507', '建阳市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350802', '3508', '新罗区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350821', '3508', '长汀县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350822', '3508', '永定县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350823', '3508', '上杭县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350824', '3508', '武平县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350825', '3508', '连城县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350881', '3508', '漳平市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350902', '3509', '蕉城区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350921', '3509', '霞浦县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350922', '3509', '古田县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350923', '3509', '屏南县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350924', '3509', '寿宁县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350925', '3509', '周宁县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350926', '3509', '柘荣县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350981', '3509', '福安市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('350982', '3509', '福鼎市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360102', '3601', '东湖区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360103', '3601', '西湖区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360104', '3601', '青云谱区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360105', '3601', '湾里区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360111', '3601', '青山湖区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360121', '3601', '南昌县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360122', '3601', '新建县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360123', '3601', '安义县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360124', '3601', '进贤县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360202', '3602', '昌江区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360203', '3602', '珠山区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360222', '3602', '浮梁县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360281', '3602', '乐平市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360302', '3603', '安源区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360313', '3603', '湘东区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360321', '3603', '莲花县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360322', '3603', '上栗县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360323', '3603', '芦溪县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360402', '3604', '庐山区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360403', '3604', '浔阳区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360421', '3604', '九江县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360423', '3604', '武宁县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360424', '3604', '修水县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360425', '3604', '永修县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360426', '3604', '德安县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360427', '3604', '星子县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360428', '3604', '都昌县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360429', '3604', '湖口县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360430', '3604', '彭泽县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360481', '3604', '瑞昌市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360502', '3605', '渝水区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360521', '3605', '分宜县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360602', '3606', '月湖区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360622', '3606', '余江县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360681', '3606', '贵溪市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360702', '3607', '章贡区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360721', '3607', '赣县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360722', '3607', '信丰县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360723', '3607', '大余县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360724', '3607', '上犹县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360725', '3607', '崇义县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360726', '3607', '安远县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360727', '3607', '龙南县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360728', '3607', '定南县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360729', '3607', '全南县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360730', '3607', '宁都县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360731', '3607', '于都县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360732', '3607', '兴国县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360733', '3607', '会昌县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360734', '3607', '寻乌县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360735', '3607', '石城县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360781', '3607', '瑞金市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360782', '3607', '南康市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360802', '3608', '吉州区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360803', '3608', '青原区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360821', '3608', '吉安县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360822', '3608', '吉水县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360823', '3608', '峡江县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360824', '3608', '新干县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360825', '3608', '永丰县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360826', '3608', '泰和县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360827', '3608', '遂川县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360828', '3608', '万安县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360829', '3608', '安福县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360830', '3608', '永新县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360881', '3608', '井冈山市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360902', '3609', '袁州区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360921', '3609', '奉新县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360922', '3609', '万载县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360923', '3609', '上高县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360924', '3609', '宜丰县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360925', '3609', '靖安县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360926', '3609', '铜鼓县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360981', '3609', '丰城市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360982', '3609', '樟树市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('360983', '3609', '高安市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('361002', '3610', '临川区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('361021', '3610', '南城县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('361022', '3610', '黎川县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('361023', '3610', '南丰县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('361024', '3610', '崇仁县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('361025', '3610', '乐安县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('361026', '3610', '宜黄县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('361027', '3610', '金溪县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('361028', '3610', '资溪县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('361029', '3610', '东乡县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('361030', '3610', '广昌县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('361102', '3611', '信州区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('361121', '3611', '上饶县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('361122', '3611', '广丰县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('361123', '3611', '玉山县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('361124', '3611', '铅山县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('361125', '3611', '横峰县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('361126', '3611', '弋阳县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('361127', '3611', '余干县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('361128', '3611', '鄱阳县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('361129', '3611', '万年县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('361130', '3611', '婺源县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('361181', '3611', '德兴市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370102', '3701', '历下区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370103', '3701', '市中区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370104', '3701', '槐荫区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370105', '3701', '天桥区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370112', '3701', '历城区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370113', '3701', '长清区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370124', '3701', '平阴县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370125', '3701', '济阳县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370126', '3701', '商河县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370181', '3701', '章丘市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370202', '3702', '市南区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370203', '3702', '市北区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370205', '3702', '四方区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370211', '3702', '黄岛区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370212', '3702', '崂山区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370213', '3702', '李沧区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370214', '3702', '城阳区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370281', '3702', '胶州市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370282', '3702', '即墨市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370283', '3702', '平度市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370284', '3702', '胶南市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370285', '3702', '莱西市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370302', '3703', '淄川区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370303', '3703', '张店区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370304', '3703', '博山区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370305', '3703', '临淄区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370306', '3703', '周村区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370321', '3703', '桓台县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370322', '3703', '高青县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370323', '3703', '沂源县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370402', '3704', '市中区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370403', '3704', '薛城区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370404', '3704', '峄城区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370405', '3704', '台儿庄区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370406', '3704', '山亭区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370481', '3704', '滕州市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370502', '3705', '东营区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370503', '3705', '河口区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370521', '3705', '垦利县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370522', '3705', '利津县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370523', '3705', '广饶县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370602', '3706', '芝罘区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370611', '3706', '福山区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370612', '3706', '牟平区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370613', '3706', '莱山区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370634', '3706', '长岛县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370681', '3706', '龙口市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370682', '3706', '莱阳市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370683', '3706', '莱州市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370684', '3706', '蓬莱市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370685', '3706', '招远市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370686', '3706', '栖霞市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370687', '3706', '海阳市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370702', '3707', '潍城区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370703', '3707', '寒亭区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370704', '3707', '坊子区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370705', '3707', '奎文区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370724', '3707', '临朐县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370725', '3707', '昌乐县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370781', '3707', '青州市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370782', '3707', '诸城市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370783', '3707', '寿光市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370784', '3707', '安丘市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370785', '3707', '高密市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370786', '3707', '昌邑市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370802', '3708', '市中区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370811', '3708', '任城区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370826', '3708', '微山县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370827', '3708', '鱼台县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370828', '3708', '金乡县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370829', '3708', '嘉祥县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370830', '3708', '汶上县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370831', '3708', '泗水县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370832', '3708', '梁山县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370881', '3708', '曲阜市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370882', '3708', '兖州市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370883', '3708', '邹城市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370902', '3709', '泰山区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370903', '3709', '岱岳区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370921', '3709', '宁阳县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370923', '3709', '东平县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370982', '3709', '新泰市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('370983', '3709', '肥城市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('371002', '3710', '环翠区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('371081', '3710', '文登市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('371082', '3710', '荣成市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('371083', '3710', '乳山市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('371102', '3711', '东港区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('371103', '3711', '岚山区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('371121', '3711', '五莲县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('371122', '3711', '莒县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('371202', '3712', '莱城区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('371203', '3712', '钢城区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('371302', '3713', '兰山区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('371311', '3713', '罗庄区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('371312', '3713', '河东区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('371321', '3713', '沂南县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('371322', '3713', '郯城县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('371323', '3713', '沂水县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('371324', '3713', '苍山县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('371325', '3713', '费县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('371326', '3713', '平邑县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('371327', '3713', '莒南县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('371328', '3713', '蒙阴县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('371329', '3713', '临沭县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('371402', '3714', '德城区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('371421', '3714', '陵县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('371422', '3714', '宁津县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('371423', '3714', '庆云县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('371424', '3714', '临邑县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('371425', '3714', '齐河县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('371426', '3714', '平原县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('371427', '3714', '夏津县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('371428', '3714', '武城县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('371481', '3714', '乐陵市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('371482', '3714', '禹城市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('371502', '3715', '东昌府区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('371521', '3715', '阳谷县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('371522', '3715', '莘县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('371523', '3715', '茌平县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('371524', '3715', '东阿县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('371525', '3715', '冠县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('371526', '3715', '高唐县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('371581', '3715', '临清市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('371602', '3716', '滨城区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('371621', '3716', '惠民县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('371622', '3716', '阳信县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('371623', '3716', '无棣县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('371624', '3716', '沾化县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('371625', '3716', '博兴县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('371626', '3716', '邹平县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('371702', '3717', '牡丹区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('371721', '3717', '曹县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('371722', '3717', '单县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('371723', '3717', '成武县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('371724', '3717', '巨野县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('371725', '3717', '郓城县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('371726', '3717', '鄄城县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('371727', '3717', '定陶县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('371728', '3717', '东明县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410102', '4101', '中原区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410103', '4101', '二七区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410104', '4101', '管城回族区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410105', '4101', '金水区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410106', '4101', '上街区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410108', '4101', '惠济区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410122', '4101', '中牟县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410181', '4101', '巩义市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410182', '4101', '荥阳市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410183', '4101', '新密市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410184', '4101', '新郑市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410185', '4101', '登封市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410202', '4102', '龙亭区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410203', '4102', '顺河回族区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410204', '4102', '鼓楼区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410205', '4102', '禹王台区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410211', '4102', '金明区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410221', '4102', '杞县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410222', '4102', '通许县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410223', '4102', '尉氏县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410224', '4102', '开封县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410225', '4102', '兰考县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410302', '4103', '老城区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410303', '4103', '西工区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410304', '4103', '廛河回族区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410305', '4103', '涧西区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410306', '4103', '吉利区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410307', '4103', '洛龙区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410322', '4103', '孟津县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410323', '4103', '新安县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410324', '4103', '栾川县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410325', '4103', '嵩县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410326', '4103', '汝阳县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410327', '4103', '宜阳县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410328', '4103', '洛宁县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410329', '4103', '伊川县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410381', '4103', '偃师市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410402', '4104', '新华区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410403', '4104', '卫东区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410404', '4104', '石龙区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410411', '4104', '湛河区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410421', '4104', '宝丰县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410422', '4104', '叶县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410423', '4104', '鲁山县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410425', '4104', '郏县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410481', '4104', '舞钢市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410482', '4104', '汝州市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410502', '4105', '文峰区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410503', '4105', '北关区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410505', '4105', '殷都区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410506', '4105', '龙安区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410522', '4105', '安阳县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410523', '4105', '汤阴县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410526', '4105', '滑县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410527', '4105', '内黄县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410581', '4105', '林州市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410602', '4106', '鹤山区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410603', '4106', '山城区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410611', '4106', '淇滨区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410621', '4106', '浚县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410622', '4106', '淇县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410702', '4107', '红旗区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410703', '4107', '卫滨区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410704', '4107', '凤泉区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410711', '4107', '牧野区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410721', '4107', '新乡县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410724', '4107', '获嘉县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410725', '4107', '原阳县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410726', '4107', '延津县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410727', '4107', '封丘县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410728', '4107', '长垣县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410781', '4107', '卫辉市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410782', '4107', '辉县市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410802', '4108', '解放区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410803', '4108', '中站区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410804', '4108', '马村区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410811', '4108', '山阳区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410821', '4108', '修武县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410822', '4108', '博爱县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410823', '4108', '武陟县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410825', '4108', '温县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410882', '4108', '沁阳市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410883', '4108', '孟州市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410902', '4109', '华龙区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410922', '4109', '清丰县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410923', '4109', '南乐县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410926', '4109', '范县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410927', '4109', '台前县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('410928', '4109', '濮阳县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411002', '4110', '魏都区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411023', '4110', '许昌县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411024', '4110', '鄢陵县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411025', '4110', '襄城县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411081', '4110', '禹州市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411082', '4110', '长葛市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411102', '4111', '源汇区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411103', '4111', '郾城区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411104', '4111', '召陵区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411121', '4111', '舞阳县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411122', '4111', '临颍县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411202', '4112', '湖滨区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411221', '4112', '渑池县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411222', '4112', '陕县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411224', '4112', '卢氏县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411281', '4112', '义马市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411282', '4112', '灵宝市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411302', '4113', '宛城区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411303', '4113', '卧龙区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411321', '4113', '南召县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411322', '4113', '方城县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411323', '4113', '西峡县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411324', '4113', '镇平县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411325', '4113', '内乡县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411326', '4113', '淅川县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411327', '4113', '社旗县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411328', '4113', '唐河县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411329', '4113', '新野县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411330', '4113', '桐柏县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411381', '4113', '邓州市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411402', '4114', '梁园区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411403', '4114', '睢阳区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411421', '4114', '民权县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411422', '4114', '睢县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411423', '4114', '宁陵县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411424', '4114', '柘城县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411425', '4114', '虞城县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411426', '4114', '夏邑县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411481', '4114', '永城市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411502', '4115', '浉河区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411503', '4115', '平桥区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411521', '4115', '罗山县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411522', '4115', '光山县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411523', '4115', '新县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411524', '4115', '商城县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411525', '4115', '固始县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411526', '4115', '潢川县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411527', '4115', '淮滨县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411528', '4115', '息县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411602', '4116', '川汇区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411621', '4116', '扶沟县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411622', '4116', '西华县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411623', '4116', '商水县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411624', '4116', '沈丘县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411625', '4116', '郸城县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411626', '4116', '淮阳县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411627', '4116', '太康县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411628', '4116', '鹿邑县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411681', '4116', '项城市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411702', '4117', '驿城区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411721', '4117', '西平县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411722', '4117', '上蔡县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411723', '4117', '平舆县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411724', '4117', '正阳县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411725', '4117', '确山县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411726', '4117', '泌阳县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411727', '4117', '汝南县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411728', '4117', '遂平县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411729', '4117', '新蔡县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('411800', '4118', '济源', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('420102', '4201', '江岸区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('420103', '4201', '江汉区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('420104', '4201', '硚口区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('420105', '4201', '汉阳区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('420106', '4201', '武昌区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('420107', '4201', '青山区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('420111', '4201', '洪山区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('420112', '4201', '东西湖区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('420113', '4201', '汉南区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('420114', '4201', '蔡甸区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('420115', '4201', '江夏区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('420116', '4201', '黄陂区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('420117', '4201', '新洲区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('420202', '4202', '黄石港区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('420203', '4202', '西塞山区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('420204', '4202', '下陆区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('420205', '4202', '铁山区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('420222', '4202', '阳新县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('420281', '4202', '大冶市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('420302', '4203', '茅箭区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('420303', '4203', '张湾区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('420321', '4203', '郧县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('420322', '4203', '郧西县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('420323', '4203', '竹山县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('420324', '4203', '竹溪县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('420325', '4203', '房县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('420381', '4203', '丹江口市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('420502', '4205', '西陵区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('420503', '4205', '伍家岗区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('420504', '4205', '点军区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('420505', '4205', '猇亭区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('420506', '4205', '夷陵区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('420525', '4205', '远安县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('420526', '4205', '兴山县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('420527', '4205', '秭归县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('420528', '4205', '长阳土家族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('420529', '4205', '五峰土家族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('420581', '4205', '宜都市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('420582', '4205', '当阳市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('420583', '4205', '枝江市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('420602', '4206', '襄城区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('420606', '4206', '樊城区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('420607', '4206', '襄阳区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('420624', '4206', '南漳县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('420625', '4206', '谷城县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('420626', '4206', '保康县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('420682', '4206', '老河口市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('420683', '4206', '枣阳市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('420684', '4206', '宜城市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('420702', '4207', '梁子湖区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('420703', '4207', '华容区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('420704', '4207', '鄂城区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('420802', '4208', '东宝区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('420804', '4208', '掇刀区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('420821', '4208', '京山县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('420822', '4208', '沙洋县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('420881', '4208', '钟祥市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('420902', '4209', '孝南区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('420921', '4209', '孝昌县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('420922', '4209', '大悟县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('420923', '4209', '云梦县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('420981', '4209', '应城市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('420982', '4209', '安陆市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('420984', '4209', '汉川市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('421002', '4210', '沙市区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('421003', '4210', '荆州区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('421022', '4210', '公安县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('421023', '4210', '监利县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('421024', '4210', '江陵县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('421081', '4210', '石首市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('421083', '4210', '洪湖市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('421087', '4210', '松滋市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('421102', '4211', '黄州区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('421121', '4211', '团风县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('421122', '4211', '红安县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('421123', '4211', '罗田县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('421124', '4211', '英山县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('421125', '4211', '浠水县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('421126', '4211', '蕲春县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('421127', '4211', '黄梅县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('421181', '4211', '麻城市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('421182', '4211', '武穴市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('421202', '4212', '咸安区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('421221', '4212', '嘉鱼县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('421222', '4212', '通城县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('421223', '4212', '崇阳县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('421224', '4212', '通山县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('421281', '4212', '赤壁市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('421302', '4213', '曾都区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('421381', '4213', '广水市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('421321', '4213', '随县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('422801', '4228', '恩施市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('422802', '4228', '利川市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('422822', '4228', '建始县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('422823', '4228', '巴东县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('422825', '4228', '宣恩县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('422826', '4228', '咸丰县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('422827', '4228', '来凤县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('422828', '4228', '鹤峰县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('422900', '4229', '仙桃', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('423000', '4230', '潜江', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('423100', '4231', '天门', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('423200', '4232', '神农架', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430102', '4301', '芙蓉区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430103', '4301', '天心区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430104', '4301', '岳麓区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430105', '4301', '开福区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430111', '4301', '雨花区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430121', '4301', '长沙县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430122', '4301', '望城县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430124', '4301', '宁乡县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430181', '4301', '浏阳市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430202', '4302', '荷塘区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430203', '4302', '芦淞区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430204', '4302', '石峰区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430211', '4302', '天元区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430221', '4302', '株洲县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430223', '4302', '攸县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430224', '4302', '茶陵县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430225', '4302', '炎陵县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430281', '4302', '醴陵市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430302', '4303', '雨湖区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430304', '4303', '岳塘区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430321', '4303', '湘潭县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430381', '4303', '湘乡市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430382', '4303', '韶山市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430405', '4304', '珠晖区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430406', '4304', '雁峰区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430407', '4304', '石鼓区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430408', '4304', '蒸湘区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430412', '4304', '南岳区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430421', '4304', '衡阳县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430422', '4304', '衡南县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430423', '4304', '衡山县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430424', '4304', '衡东县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430426', '4304', '祁东县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430481', '4304', '耒阳市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430482', '4304', '常宁市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430502', '4305', '双清区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430503', '4305', '大祥区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430511', '4305', '北塔区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430521', '4305', '邵东县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430522', '4305', '新邵县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430523', '4305', '邵阳县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430524', '4305', '隆回县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430525', '4305', '洞口县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430527', '4305', '绥宁县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430528', '4305', '新宁县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430529', '4305', '城步苗族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430581', '4305', '武冈市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430602', '4306', '岳阳楼区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430603', '4306', '云溪区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430611', '4306', '君山区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430621', '4306', '岳阳县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430623', '4306', '华容县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430624', '4306', '湘阴县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430626', '4306', '平江县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430681', '4306', '汨罗市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430682', '4306', '临湘市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430702', '4307', '武陵区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430703', '4307', '鼎城区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430721', '4307', '安乡县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430722', '4307', '汉寿县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430723', '4307', '澧县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430724', '4307', '临澧县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430725', '4307', '桃源县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430726', '4307', '石门县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430781', '4307', '津市市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430802', '4308', '永定区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430811', '4308', '武陵源区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430821', '4308', '慈利县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430822', '4308', '桑植县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430902', '4309', '资阳区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430903', '4309', '赫山区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430921', '4309', '南县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430922', '4309', '桃江县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430923', '4309', '安化县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('430981', '4309', '沅江市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('431002', '4310', '北湖区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('431003', '4310', '苏仙区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('431021', '4310', '桂阳县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('431022', '4310', '宜章县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('431023', '4310', '永兴县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('431024', '4310', '嘉禾县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('431025', '4310', '临武县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('431026', '4310', '汝城县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('431027', '4310', '桂东县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('431028', '4310', '安仁县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('431081', '4310', '资兴市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('431102', '4311', '零陵区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('431103', '4311', '冷水滩区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('431121', '4311', '祁阳县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('431122', '4311', '东安县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('431123', '4311', '双牌县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('431124', '4311', '道县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('431125', '4311', '江永县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('431126', '4311', '宁远县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('431127', '4311', '蓝山县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('431128', '4311', '新田县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('431129', '4311', '江华瑶族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('431202', '4312', '鹤城区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('431221', '4312', '中方县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('431222', '4312', '沅陵县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('431223', '4312', '辰溪县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('431224', '4312', '溆浦县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('431225', '4312', '会同县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('431226', '4312', '麻阳苗族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('431227', '4312', '新晃侗族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('431228', '4312', '芷江侗族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('431229', '4312', '靖州苗族侗族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('431230', '4312', '通道侗族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('431281', '4312', '洪江市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('431302', '4313', '娄星区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('431321', '4313', '双峰县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('431322', '4313', '新化县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('431381', '4313', '冷水江市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('431382', '4313', '涟源市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('433101', '4331', '吉首市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('433122', '4331', '泸溪县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('433123', '4331', '凤凰县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('433124', '4331', '花垣县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('433125', '4331', '保靖县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('433126', '4331', '古丈县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('433127', '4331', '永顺县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('433130', '4331', '龙山县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('440103', '4401', '荔湾区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('440104', '4401', '越秀区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('440105', '4401', '海珠区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('440106', '4401', '天河区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('440111', '4401', '白云区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('440112', '4401', '黄埔区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('440113', '4401', '番禺区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('440114', '4401', '花都区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('440115', '4401', '南沙区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('440116', '4401', '萝岗区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('440183', '4401', '增城市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('440184', '4401', '从化市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('440203', '4402', '武江区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('440204', '4402', '浈江区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('440205', '4402', '曲江区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('440222', '4402', '始兴县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('440224', '4402', '仁化县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('440229', '4402', '翁源县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('440232', '4402', '乳源瑶族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('440233', '4402', '新丰县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('440281', '4402', '乐昌市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('440282', '4402', '南雄市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('440303', '4403', '罗湖区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('440304', '4403', '福田区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('440305', '4403', '南山区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('440306', '4403', '宝安区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('440307', '4403', '龙岗区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('440308', '4403', '盐田区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('440402', '4404', '香洲区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('440403', '4404', '斗门区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('440404', '4404', '金湾区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('440507', '4405', '龙湖区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('440511', '4405', '金平区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('440512', '4405', '濠江区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('440513', '4405', '潮阳区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('440514', '4405', '潮南区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('440515', '4405', '澄海区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('440523', '4405', '南澳县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('440604', '4406', '禅城区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('440605', '4406', '南海区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('440606', '4406', '顺德区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('440607', '4406', '三水区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('440608', '4406', '高明区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('440703', '4407', '蓬江区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('440704', '4407', '江海区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('440705', '4407', '新会区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('440781', '4407', '台山市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('440783', '4407', '开平市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('440784', '4407', '鹤山市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('440785', '4407', '恩平市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('440802', '4408', '赤坎区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('440803', '4408', '霞山区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('440804', '4408', '坡头区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('440811', '4408', '麻章区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('440823', '4408', '遂溪县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('440825', '4408', '徐闻县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('440881', '4408', '廉江市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('440882', '4408', '雷州市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('440883', '4408', '吴川市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('440902', '4409', '茂南区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('440903', '4409', '茂港区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('440923', '4409', '电白县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('440981', '4409', '高州市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('440982', '4409', '化州市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('440983', '4409', '信宜市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('441202', '4412', '端州区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('441203', '4412', '鼎湖区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('441223', '4412', '广宁县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('441224', '4412', '怀集县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('441225', '4412', '封开县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('441226', '4412', '德庆县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('441283', '4412', '高要市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('441284', '4412', '四会市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('441302', '4413', '惠城区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('441303', '4413', '惠阳区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('441322', '4413', '博罗县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('441323', '4413', '惠东县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('441324', '4413', '龙门县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('441402', '4414', '梅江区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('441421', '4414', '梅县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('441422', '4414', '大埔县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('441423', '4414', '丰顺县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('441424', '4414', '五华县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('441426', '4414', '平远县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('441427', '4414', '蕉岭县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('441481', '4414', '兴宁市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('441502', '4415', '城区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('441521', '4415', '海丰县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('441523', '4415', '陆河县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('441581', '4415', '陆丰市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('441602', '4416', '源城区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('441621', '4416', '紫金县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('441622', '4416', '龙川县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('441623', '4416', '连平县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('441624', '4416', '和平县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('441625', '4416', '东源县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('441702', '4417', '江城区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('441721', '4417', '阳西县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('441723', '4417', '阳东县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('441781', '4417', '阳春市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('441802', '4418', '清城区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('441821', '4418', '佛冈县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('441823', '4418', '阳山县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('441825', '4418', '连山壮族瑶族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('441826', '4418', '连南瑶族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('441827', '4418', '清新县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('441881', '4418', '英德市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('441882', '4418', '连州市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('441900', '4419', '东莞市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('442000', '4420', '中山市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('445102', '4451', '湘桥区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('445121', '4451', '潮安县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('445122', '4451', '饶平县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('445202', '4452', '榕城区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('445221', '4452', '揭东县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('445222', '4452', '揭西县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('445224', '4452', '惠来县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('445281', '4452', '普宁市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('445302', '4453', '云城区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('445321', '4453', '新兴县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('445322', '4453', '郁南县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('445323', '4453', '云安县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('445381', '4453', '罗定市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450102', '4501', '兴宁区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450103', '4501', '青秀区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450105', '4501', '江南区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450107', '4501', '西乡塘区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450108', '4501', '良庆区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450109', '4501', '邕宁区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450122', '4501', '武鸣县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450123', '4501', '隆安县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450124', '4501', '马山县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450125', '4501', '上林县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450126', '4501', '宾阳县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450127', '4501', '横县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450202', '4502', '城中区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450203', '4502', '鱼峰区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450204', '4502', '柳南区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450205', '4502', '柳北区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450221', '4502', '柳江县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450222', '4502', '柳城县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450223', '4502', '鹿寨县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450224', '4502', '融安县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450225', '4502', '融水苗族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450226', '4502', '三江侗族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450302', '4503', '秀峰区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450303', '4503', '叠彩区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450304', '4503', '象山区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450305', '4503', '七星区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450311', '4503', '雁山区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450321', '4503', '阳朔县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450322', '4503', '临桂县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450323', '4503', '灵川县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450324', '4503', '全州县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450325', '4503', '兴安县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450326', '4503', '永福县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450327', '4503', '灌阳县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450328', '4503', '龙胜各族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450329', '4503', '资源县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450330', '4503', '平乐县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450331', '4503', '荔蒲县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450332', '4503', '恭城瑶族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450403', '4504', '万秀区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450404', '4504', '蝶山区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450405', '4504', '长洲区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450421', '4504', '苍梧县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450422', '4504', '藤县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450423', '4504', '蒙山县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450481', '4504', '岑溪市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450502', '4505', '海城区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450503', '4505', '银海区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450512', '4505', '铁山港区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450521', '4505', '合浦县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450602', '4506', '港口区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450603', '4506', '防城区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450621', '4506', '上思县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450681', '4506', '东兴市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450702', '4507', '钦南区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450703', '4507', '钦北区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450721', '4507', '灵山县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450722', '4507', '浦北县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450802', '4508', '港北区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450803', '4508', '港南区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450804', '4508', '覃塘区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450821', '4508', '平南县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450881', '4508', '桂平市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450902', '4509', '玉州区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450921', '4509', '容县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450922', '4509', '陆川县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450923', '4509', '博白县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450924', '4509', '兴业县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('450981', '4509', '北流市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('451002', '4510', '右江区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('451021', '4510', '田阳县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('451022', '4510', '田东县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('451023', '4510', '平果县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('451024', '4510', '德保县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('451025', '4510', '靖西县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('451026', '4510', '那坡县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('451027', '4510', '凌云县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('451028', '4510', '乐业县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('451029', '4510', '田林县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('451030', '4510', '西林县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('451031', '4510', '隆林各族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('451102', '4511', '八步区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('451121', '4511', '昭平县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('451122', '4511', '钟山县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('451123', '4511', '富川瑶族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('451202', '4512', '金城江区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('451221', '4512', '南丹县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('451222', '4512', '天峨县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('451223', '4512', '凤山县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('451224', '4512', '东兰县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('451225', '4512', '罗城仫佬族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('451226', '4512', '环江毛南族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('451227', '4512', '巴马瑶族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('451228', '4512', '都安瑶族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('451229', '4512', '大化瑶族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('451281', '4512', '宜州市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('451302', '4513', '兴宾区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('451321', '4513', '忻城县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('451322', '4513', '象州县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('451323', '4513', '武宣县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('451324', '4513', '金秀瑶族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('451381', '4513', '合山市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('451402', '4514', '江洲区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('451421', '4514', '扶绥县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('451422', '4514', '宁明县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('451423', '4514', '龙州县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('451424', '4514', '大新县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('451425', '4514', '天等县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('451481', '4514', '凭祥市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('460105', '4601', '秀英区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('460106', '4601', '龙华区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('460107', '4601', '琼山区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('460108', '4601', '美兰区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('460200', '4602', '三亚市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('460300', '4603', '五指山', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('460400', '4604', '琼海', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('460500', '4605', '儋州', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('460600', '4606', '文昌', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('460700', '4607', '万宁', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('460800', '4608', '东方', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('500101', '5001', '万州区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('500202', '5002', '涪陵区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('500303', '5003', '渝中区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('500104', '5004', '大渡口区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('500505', '5005', '江北区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('500606', '5006', '沙坪坝区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('500707', '5007', '九龙坡区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('500808', '5008', '南岸区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('500909', '5009', '北碚区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('501010', '5010', '万盛区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('501111', '5011', '双桥区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('501212', '5012', '渝北区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('501313', '5013', '巴南区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('502115', '5021', '长寿区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('502222', '5022', '綦江县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('502323', '5023', '潼南县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('502424', '5024', '铜梁县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('502525', '5025', '大足县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('502626', '5026', '荣昌县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('502727', '5027', '璧山县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('502828', '5028', '梁平县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('502929', '5029', '城口县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('503030', '5030', '丰都县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('503131', '5031', '垫江县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('503232', '5032', '武隆县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('503333', '5033', '忠县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('503434', '5034', '开县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('503535', '5035', '云阳县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('503636', '5036', '奉节县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('503737', '5037', '巫山县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('503838', '5038', '巫溪县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('503914', '5039', '黔江区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('504040', '5040', '石柱土家族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('504141', '5041', '秀山土家族苗族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('504242', '5042', '酉阳土家族苗族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('504343', '5043', '彭水苗族土家族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('508116', '5081', '江津区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('508217', '5082', '合川区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('508318', '5083', '永川区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('508419', '5084', '南川区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('510104', '5101', '锦江区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('510105', '5101', '青羊区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('510106', '5101', '金牛区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('510107', '5101', '武侯区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('510108', '5101', '成华区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('510112', '5101', '龙泉驿区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('510113', '5101', '青白江区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('510114', '5101', '新都区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('510115', '5101', '温江区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('510121', '5101', '金堂县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('510122', '5101', '双流县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('510124', '5101', '郫县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('510129', '5101', '大邑县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('510131', '5101', '蒲江县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('510132', '5101', '新津县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('510181', '5101', '都江堰市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('510182', '5101', '彭州市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('510183', '5101', '邛崃市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('510184', '5101', '崇州市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('510302', '5103', '自流井区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('510303', '5103', '贡井区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('510304', '5103', '大安区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('510311', '5103', '沿滩区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('510321', '5103', '荣县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('510322', '5103', '富顺县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('510402', '5104', '东区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('510403', '5104', '西区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('510411', '5104', '仁和区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('510421', '5104', '米易县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('510422', '5104', '盐边县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('510502', '5105', '江阳区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('510503', '5105', '纳溪区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('510504', '5105', '龙马潭区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('510521', '5105', '泸县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('510522', '5105', '合江县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('510524', '5105', '叙永县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('510525', '5105', '古蔺县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('510603', '5106', '旌阳区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('510623', '5106', '中江县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('510626', '5106', '罗江县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('510681', '5106', '广汉市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('510682', '5106', '什邡市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('510683', '5106', '绵竹市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('510703', '5107', '涪城区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('510704', '5107', '游仙区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('510722', '5107', '三台县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('510723', '5107', '盐亭县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('510724', '5107', '安县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('510725', '5107', '梓潼县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('510726', '5107', '北川羌族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('510727', '5107', '平武县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('510781', '5107', '江油市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('510802', '5108', '利州区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('510811', '5108', '元坝区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('510812', '5108', '朝天区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('510821', '5108', '旺苍县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('510822', '5108', '青川县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('510823', '5108', '剑阁县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('510824', '5108', '苍溪县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('510903', '5109', '船山区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('510904', '5109', '安居区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('510921', '5109', '蓬溪县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('510922', '5109', '射洪县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('510923', '5109', '大英县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('511002', '5110', '市中区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('511011', '5110', '东兴区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('511024', '5110', '威远县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('511025', '5110', '资中县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('511028', '5110', '隆昌县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('511102', '5111', '市中区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('511111', '5111', '沙湾区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('511112', '5111', '五通桥区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('511113', '5111', '金口河区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('511123', '5111', '犍为县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('511124', '5111', '井研县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('511126', '5111', '夹江县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('511129', '5111', '沐川县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('511132', '5111', '峨边彝族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('511133', '5111', '马边彝族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('511181', '5111', '峨眉山市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('511302', '5113', '顺庆区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('511303', '5113', '高坪区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('511304', '5113', '嘉陵区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('511321', '5113', '南部县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('511322', '5113', '营山县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('511323', '5113', '蓬安县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('511324', '5113', '仪陇县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('511325', '5113', '西充县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('511381', '5113', '阆中市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('511402', '5114', '东坡区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('511421', '5114', '仁寿县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('511422', '5114', '彭山县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('511423', '5114', '洪雅县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('511424', '5114', '丹棱县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('511425', '5114', '青神县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('511502', '5115', '翠屏区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('511521', '5115', '宜宾县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('511522', '5115', '南溪县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('511523', '5115', '江安县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('511524', '5115', '长宁县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('511525', '5115', '高县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('511526', '5115', '珙县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('511527', '5115', '筠连县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('511528', '5115', '兴文县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('511529', '5115', '屏山县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('511602', '5116', '广安区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('511621', '5116', '岳池县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('511622', '5116', '武胜县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('511623', '5116', '邻水县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('511681', '5116', '华蓥市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('511702', '5117', '通川区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('511721', '5117', '达县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('511722', '5117', '宣汉县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('511723', '5117', '开江县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('511724', '5117', '大竹县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('511725', '5117', '渠县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('511781', '5117', '万源市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('511802', '5118', '雨城区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('511821', '5118', '名山县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('511822', '5118', '荥经县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('511823', '5118', '汉源县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('511824', '5118', '石棉县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('511825', '5118', '天全县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('511826', '5118', '芦山县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('511827', '5118', '宝兴县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('511902', '5119', '巴州区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('511921', '5119', '通江县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('511922', '5119', '南江县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('511923', '5119', '平昌县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('512002', '5120', '雁江区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('512021', '5120', '安岳县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('512022', '5120', '乐至县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('512081', '5120', '简阳市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('513221', '5132', '汶川县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('513222', '5132', '理县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('513223', '5132', '茂县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('513224', '5132', '松潘县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('513225', '5132', '九寨沟县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('513226', '5132', '金川县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('513227', '5132', '小金县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('513228', '5132', '黑水县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('513229', '5132', '马尔康县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('513230', '5132', '壤塘县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('513231', '5132', '阿坝县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('513232', '5132', '若尔盖县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('513233', '5132', '红原县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('513321', '5133', '康定县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('513322', '5133', '泸定县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('513323', '5133', '丹巴县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('513324', '5133', '九龙县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('513325', '5133', '雅江县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('513326', '5133', '道孚县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('513327', '5133', '炉霍县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('513328', '5133', '甘孜县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('513329', '5133', '新龙县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('513330', '5133', '德格县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('513331', '5133', '白玉县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('513332', '5133', '石渠县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('513333', '5133', '色达县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('513334', '5133', '理塘县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('513335', '5133', '巴塘县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('513336', '5133', '乡城县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('513337', '5133', '稻城县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('513338', '5133', '得荣县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('513401', '5134', '西昌市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('513422', '5134', '木里藏族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('513423', '5134', '盐源县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('513424', '5134', '德昌县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('513425', '5134', '会理县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('513426', '5134', '会东县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('513427', '5134', '宁南县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('513428', '5134', '普格县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('513429', '5134', '布拖县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('513430', '5134', '金阳县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('513431', '5134', '昭觉县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('513432', '5134', '喜德县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('513433', '5134', '冕宁县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('513434', '5134', '越西县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('513435', '5134', '甘洛县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('513436', '5134', '美姑县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('513437', '5134', '雷波县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('520102', '5201', '南明区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('520103', '5201', '云岩区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('520111', '5201', '花溪区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('520112', '5201', '乌当区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('520113', '5201', '白云区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('520114', '5201', '小河区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('520121', '5201', '开阳县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('520122', '5201', '息烽县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('520123', '5201', '修文县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('520181', '5201', '清镇市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('520201', '5202', '钟山区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('520203', '5202', '六枝特区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('520221', '5202', '水城县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('520222', '5202', '盘县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('520302', '5203', '红花岗区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('520303', '5203', '汇川区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('520321', '5203', '遵义县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('520322', '5203', '桐梓县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('520323', '5203', '绥阳县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('520324', '5203', '正安县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('520325', '5203', '道真仡佬族苗族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('520326', '5203', '务川仡佬族苗族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('520327', '5203', '凤冈县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('520328', '5203', '湄潭县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('520329', '5203', '余庆县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('520330', '5203', '习水县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('520381', '5203', '赤水市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('520382', '5203', '仁怀市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('520402', '5204', '西秀区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('520421', '5204', '平坝县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('520422', '5204', '普定县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('520423', '5204', '镇宁布依族苗族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('520424', '5204', '关岭布依族苗族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('520425', '5204', '紫云苗族布依族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('522201', '5222', '铜仁市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('522222', '5222', '江口县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('522223', '5222', '玉屏侗族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('522224', '5222', '石阡县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('522225', '5222', '思南县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('522226', '5222', '印江土家族苗族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('522227', '5222', '德江县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('522228', '5222', '沿河土家族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('522229', '5222', '松桃苗族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('522230', '5222', '万山特区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('522301', '5223', '兴义市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('522322', '5223', '兴仁县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('522323', '5223', '普安县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('522324', '5223', '晴隆县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('522325', '5223', '贞丰县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('522326', '5223', '望谟县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('522327', '5223', '册亨县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('522328', '5223', '安龙县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('522401', '5224', '毕节市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('522422', '5224', '大方县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('522423', '5224', '黔西县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('522424', '5224', '金沙县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('522425', '5224', '织金县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('522426', '5224', '纳雍县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('522427', '5224', '威宁彝族回族苗族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('522428', '5224', '赫章县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('522601', '5226', '凯里市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('522622', '5226', '黄平县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('522623', '5226', '施秉县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('522624', '5226', '三穗县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('522625', '5226', '镇远县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('522626', '5226', '岑巩县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('522627', '5226', '天柱县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('522628', '5226', '锦屏县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('522629', '5226', '剑河县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('522630', '5226', '台江县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('522631', '5226', '黎平县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('522632', '5226', '榕江县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('522633', '5226', '从江县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('522634', '5226', '雷山县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('522635', '5226', '麻江县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('522636', '5226', '丹寨县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('522701', '5227', '都匀市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('522702', '5227', '福泉市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('522722', '5227', '荔波县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('522723', '5227', '贵定县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('522725', '5227', '瓮安县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('522726', '5227', '独山县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('522727', '5227', '平塘县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('522728', '5227', '罗甸县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('522729', '5227', '长顺县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('522730', '5227', '龙里县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('522731', '5227', '惠水县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('522732', '5227', '三都水族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530102', '5301', '五华区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530103', '5301', '盘龙区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530111', '5301', '官渡区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530112', '5301', '西山区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530113', '5301', '东川区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530121', '5301', '呈贡县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530122', '5301', '晋宁县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530124', '5301', '富民县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530125', '5301', '宜良县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530126', '5301', '石林彝族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530127', '5301', '嵩明县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530128', '5301', '禄劝彝族苗族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530129', '5301', '寻甸回族彝族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530181', '5301', '安宁市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530302', '5303', '麒麟区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530321', '5303', '马龙县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530322', '5303', '陆良县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530323', '5303', '师宗县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530324', '5303', '罗平县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530325', '5303', '富源县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530326', '5303', '会泽县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530328', '5303', '沾益县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530381', '5303', '宣威市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530402', '5304', '红塔区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530421', '5304', '江川县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530422', '5304', '澄江县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530423', '5304', '通海县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530424', '5304', '华宁县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530425', '5304', '易门县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530426', '5304', '峨山彝族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530427', '5304', '新平彝族傣族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530428', '5304', '元江哈尼族彝族傣族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530502', '5305', '隆阳区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530521', '5305', '施甸县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530522', '5305', '腾冲县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530523', '5305', '龙陵县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530524', '5305', '昌宁县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530602', '5306', '昭阳区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530621', '5306', '鲁甸县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530622', '5306', '巧家县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530623', '5306', '盐津县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530624', '5306', '大关县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530625', '5306', '永善县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530626', '5306', '绥江县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530627', '5306', '镇雄县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530628', '5306', '彝良县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530629', '5306', '威信县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530630', '5306', '水富县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530702', '5307', '古城区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530721', '5307', '玉龙纳西族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530722', '5307', '永胜县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530723', '5307', '华坪县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530724', '5307', '宁蒗彝族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530802', '5308', '思茅区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530821', '5308', '宁洱镇', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530822', '5308', '墨江哈尼族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530823', '5308', '景东彝族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530824', '5308', '景谷傣族彝族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530825', '5308', '镇沅彝族哈尼族拉祜族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530826', '5308', '江城哈尼族彝族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530827', '5308', '孟连傣族拉祜族佤族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530828', '5308', '澜沧拉祜族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530829', '5308', '西盟佤族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530902', '5309', '临翔区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530921', '5309', '凤庆县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530922', '5309', '云县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530923', '5309', '永德县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530924', '5309', '镇康县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530925', '5309', '双江拉祜族佤族布朗族傣族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530926', '5309', '耿马傣族佤族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('530927', '5309', '沧源佤族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('532301', '5323', '楚雄市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('532322', '5323', '双柏县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('532323', '5323', '牟定县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('532324', '5323', '南华县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('532325', '5323', '姚安县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('532326', '5323', '大姚县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('532327', '5323', '永仁县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('532328', '5323', '元谋县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('532329', '5323', '武定县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('532331', '5323', '禄丰县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('532501', '5325', '个旧市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('532502', '5325', '开远市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('532522', '5325', '蒙自县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('532523', '5325', '屏边苗族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('532524', '5325', '建水县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('532525', '5325', '石屏县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('532526', '5325', '弥勒县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('532527', '5325', '泸西县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('532528', '5325', '元阳县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('532529', '5325', '红河县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('532530', '5325', '金平苗族瑶族傣族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('532531', '5325', '绿春县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('532532', '5325', '河口瑶族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('532621', '5326', '文山县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('532622', '5326', '砚山县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('532623', '5326', '西畴县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('532624', '5326', '麻栗坡县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('532625', '5326', '马关县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('532626', '5326', '丘北县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('532627', '5326', '广南县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('532628', '5326', '富宁县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('532801', '5328', '景洪市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('532822', '5328', '勐海县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('532823', '5328', '勐腊县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('532901', '5329', '大理市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('532922', '5329', '漾濞彝族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('532923', '5329', '祥云县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('532924', '5329', '宾川县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('532925', '5329', '弥渡县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('532926', '5329', '南涧彝族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('532927', '5329', '巍山彝族回族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('532928', '5329', '永平县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('532929', '5329', '云龙县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('532930', '5329', '洱源县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('532931', '5329', '剑川县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('532932', '5329', '鹤庆县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('533102', '5331', '瑞丽市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('533103', '5331', '潞西市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('533122', '5331', '梁河县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('533123', '5331', '盈江县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('533124', '5331', '陇川县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('533321', '5333', '泸水县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('533323', '5333', '福贡县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('533324', '5333', '贡山独龙族怒族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('533325', '5333', '兰坪白族普米族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('533421', '5334', '香格里拉县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('533422', '5334', '德钦县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('533423', '5334', '维西傈僳族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('540102', '5401', '城关区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('540121', '5401', '林周县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('540122', '5401', '当雄县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('540123', '5401', '尼木县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('540124', '5401', '曲水县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('540125', '5401', '堆龙德庆县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('540126', '5401', '达孜县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('540127', '5401', '墨竹工卡县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('542121', '5421', '昌都县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('542122', '5421', '江达县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('542123', '5421', '贡觉县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('542124', '5421', '类乌齐县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('542125', '5421', '丁青县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('542126', '5421', '察雅县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('542127', '5421', '八宿县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('542128', '5421', '左贡县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('542129', '5421', '芒康县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('542132', '5421', '洛隆县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('542133', '5421', '边坝县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('542221', '5422', '乃东县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('542222', '5422', '扎囊县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('542223', '5422', '贡嘎县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('542224', '5422', '桑日县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('542225', '5422', '琼结县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('542226', '5422', '曲松县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('542227', '5422', '措美县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('542228', '5422', '洛扎县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('542229', '5422', '加查县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('542231', '5422', '隆子县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('542232', '5422', '错那县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('542233', '5422', '浪卡子县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('542301', '5423', '日喀则市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('542322', '5423', '南木林县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('542323', '5423', '江孜县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('542324', '5423', '定日县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('542325', '5423', '萨迦县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('542326', '5423', '拉孜县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('542327', '5423', '昂仁县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('542328', '5423', '谢通门县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('542329', '5423', '白朗县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('542330', '5423', '仁布县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('542331', '5423', '康马县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('542332', '5423', '定结县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('542333', '5423', '仲巴县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('542334', '5423', '亚东县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('542335', '5423', '吉隆县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('542336', '5423', '聂拉木县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('542337', '5423', '萨嘎县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('542338', '5423', '岗巴县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('542421', '5424', '那曲县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('542422', '5424', '嘉黎县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('542423', '5424', '比如县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('542424', '5424', '聂荣县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('542425', '5424', '安多县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('542426', '5424', '申扎县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('542427', '5424', '索县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('542428', '5424', '班戈县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('542429', '5424', '巴青县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('542430', '5424', '尼玛县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('542521', '5425', '普兰县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('542522', '5425', '札达县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('542523', '5425', '噶尔县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('542524', '5425', '日土县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('542525', '5425', '革吉县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('542526', '5425', '改则县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('542527', '5425', '措勤县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('542621', '5426', '林芝县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('542622', '5426', '工布江达县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('542623', '5426', '米林县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('542624', '5426', '墨脱县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('542625', '5426', '波密县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('542626', '5426', '察隅县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('542627', '5426', '朗县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610102', '6101', '新城区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610103', '6101', '碑林区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610104', '6101', '莲湖区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610111', '6101', '灞桥区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610112', '6101', '未央区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610113', '6101', '雁塔区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610114', '6101', '阎良区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610115', '6101', '临潼区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610116', '6101', '长安区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610122', '6101', '蓝田县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610124', '6101', '周至县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610125', '6101', '户县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610126', '6101', '高陵县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610202', '6102', '王益区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610203', '6102', '印台区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610204', '6102', '耀州区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610222', '6102', '宜君县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610302', '6103', '渭滨区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610303', '6103', '金台区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610304', '6103', '陈仓区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610322', '6103', '凤翔县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610323', '6103', '岐山县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610324', '6103', '扶风县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610326', '6103', '眉县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610327', '6103', '陇县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610328', '6103', '千阳县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610329', '6103', '麟游县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610330', '6103', '凤县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610331', '6103', '太白县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610402', '6104', '秦都区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610403', '6104', '杨凌区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610404', '6104', '渭城区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610422', '6104', '三原县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610423', '6104', '泾阳县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610424', '6104', '乾县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610425', '6104', '礼泉县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610426', '6104', '永寿县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610427', '6104', '彬县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610428', '6104', '长武县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610429', '6104', '旬邑县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610430', '6104', '淳化县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610431', '6104', '武功县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610481', '6104', '兴平市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610502', '6105', '临渭区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610521', '6105', '华县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610522', '6105', '潼关县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610523', '6105', '大荔县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610524', '6105', '合阳县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610525', '6105', '澄城县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610526', '6105', '蒲城县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610527', '6105', '白水县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610528', '6105', '富平县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610581', '6105', '韩城市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610582', '6105', '华阴市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610602', '6106', '宝塔区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610621', '6106', '延长县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610622', '6106', '延川县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610623', '6106', '子长县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610624', '6106', '安塞县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610625', '6106', '志丹县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610626', '6106', '吴起县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610627', '6106', '甘泉县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610628', '6106', '富县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610629', '6106', '洛川县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610630', '6106', '宜川县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610631', '6106', '黄龙县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610632', '6106', '黄陵县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610702', '6107', '汉台区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610721', '6107', '南郑县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610722', '6107', '城固县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610723', '6107', '洋县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610724', '6107', '西乡县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610725', '6107', '勉县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610726', '6107', '宁强县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610727', '6107', '略阳县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610728', '6107', '镇巴县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610729', '6107', '留坝县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610730', '6107', '佛坪县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610802', '6108', '榆阳区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610821', '6108', '神木县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610822', '6108', '府谷县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610823', '6108', '横山县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610824', '6108', '靖边县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610825', '6108', '定边县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610826', '6108', '绥德县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610827', '6108', '米脂县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610828', '6108', '佳县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610829', '6108', '吴堡县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610830', '6108', '清涧县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610831', '6108', '子洲县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610902', '6109', '汉滨区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610921', '6109', '汉阴县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610922', '6109', '石泉县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610923', '6109', '宁陕县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610924', '6109', '紫阳县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610925', '6109', '岚皋县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610926', '6109', '平利县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610927', '6109', '镇坪县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610928', '6109', '旬阳县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('610929', '6109', '白河县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('611002', '6110', '商州区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('611021', '6110', '洛南县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('611022', '6110', '丹凤县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('611023', '6110', '商南县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('611024', '6110', '山阳县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('611025', '6110', '镇安县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('611026', '6110', '柞水县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('620102', '6201', '城关区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('620103', '6201', '七里河区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('620104', '6201', '西固区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('620105', '6201', '安宁区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('620111', '6201', '红古区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('620121', '6201', '永登县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('620122', '6201', '皋兰县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('620123', '6201', '榆中县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('620200', '6202', '嘉峪关市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('620302', '6203', '金川区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('620321', '6203', '永昌县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('620402', '6204', '白银区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('620403', '6204', '平川区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('620421', '6204', '靖远县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('620422', '6204', '会宁县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('620423', '6204', '景泰县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('620502', '6205', '秦城区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('620503', '6205', '麦积区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('620521', '6205', '清水县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('620522', '6205', '秦安县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('620523', '6205', '甘谷县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('620524', '6205', '武山县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('620525', '6205', '张家川回族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('620602', '6206', '凉州区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('620621', '6206', '民勤县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('620622', '6206', '古浪县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('620623', '6206', '天祝藏族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('620702', '6207', '甘州区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('620721', '6207', '肃南裕固族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('620722', '6207', '民乐县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('620723', '6207', '临泽县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('620724', '6207', '高台县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('620725', '6207', '山丹县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('620802', '6208', '崆峒区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('620821', '6208', '泾川县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('620822', '6208', '灵台县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('620823', '6208', '崇信县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('620824', '6208', '华亭县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('620825', '6208', '庄浪县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('620826', '6208', '静宁县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('620902', '6209', '肃州区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('620921', '6209', '金塔县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('620922', '6209', '瓜州县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('620923', '6209', '肃北蒙古族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('620924', '6209', '阿克塞哈萨克族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('620981', '6209', '玉门市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('620982', '6209', '敦煌市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('621002', '6210', '西峰区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('621021', '6210', '庆城县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('621022', '6210', '环县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('621023', '6210', '华池县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('621024', '6210', '合水县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('621025', '6210', '正宁县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('621026', '6210', '宁县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('621027', '6210', '镇原县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('621102', '6211', '安定区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('621121', '6211', '通渭县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('621122', '6211', '陇西县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('621123', '6211', '渭源县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('621124', '6211', '临洮县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('621125', '6211', '漳县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('621126', '6211', '岷县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('621202', '6212', '武都区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('621221', '6212', '成县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('621222', '6212', '文县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('621223', '6212', '宕昌县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('621224', '6212', '康县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('621225', '6212', '西和县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('621226', '6212', '礼县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('621227', '6212', '徽县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('621228', '6212', '两当县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('622901', '6229', '临夏市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('622921', '6229', '临夏县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('622922', '6229', '康乐县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('622923', '6229', '永靖县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('622924', '6229', '广河县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('622925', '6229', '和政县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('622926', '6229', '东乡族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('622927', '6229', '积石山保安族东乡族撒拉族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('623001', '6230', '合作市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('623021', '6230', '临潭县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('623022', '6230', '卓尼县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('623023', '6230', '舟曲县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('623024', '6230', '迭部县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('623025', '6230', '玛曲县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('623026', '6230', '碌曲县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('623027', '6230', '夏河县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('630102', '6301', '城东区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('630103', '6301', '城中区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('630104', '6301', '城西区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('630105', '6301', '城北区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('630121', '6301', '大通回族土族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('630122', '6301', '湟中县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('630123', '6301', '湟源县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('632121', '6321', '平安县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('632122', '6321', '民和回族土族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('632123', '6321', '乐都县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('632126', '6321', '互助土族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('632127', '6321', '化隆回族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('632128', '6321', '循化撒拉族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('632221', '6322', '门源回族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('632222', '6322', '祁连县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('632223', '6322', '海晏县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('632224', '6322', '刚察县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('632321', '6323', '同仁县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('632322', '6323', '尖扎县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('632323', '6323', '泽库县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('632324', '6323', '河南蒙古族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('632521', '6325', '共和县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('632522', '6325', '同德县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('632523', '6325', '贵德县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('632524', '6325', '兴海县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('632525', '6325', '贵南县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('632621', '6326', '玛沁县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('632622', '6326', '班玛县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('632623', '6326', '甘德县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('632624', '6326', '达日县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('632625', '6326', '久治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('632626', '6326', '玛多县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('632721', '6327', '玉树县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('632722', '6327', '杂多县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('632723', '6327', '称多县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('632724', '6327', '治多县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('632725', '6327', '囊谦县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('632726', '6327', '曲麻莱县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('632801', '6328', '格尔木市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('632802', '6328', '德令哈市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('632821', '6328', '乌兰县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('632822', '6328', '都兰县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('632823', '6328', '天峻县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('640104', '6401', '兴庆区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('640105', '6401', '西夏区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('640106', '6401', '金凤区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('640121', '6401', '永宁县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('640122', '6401', '贺兰县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('640181', '6401', '灵武市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('640202', '6402', '大武口区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('640205', '6402', '惠农区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('640221', '6402', '平罗县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('640302', '6403', '利通区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('640303', '6403', '红寺堡区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('640323', '6403', '盐池县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('640324', '6403', '同心县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('640381', '6403', '青铜峡市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('640402', '6404', '原州区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('640422', '6404', '西吉县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('640423', '6404', '隆德县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('640424', '6404', '泾源县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('640425', '6404', '彭阳县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('640502', '6405', '沙坡头区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('640521', '6405', '中宁县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('640522', '6405', '海原县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('650102', '6501', '天山区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('650103', '6501', '沙依巴克区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('650104', '6501', '新市区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('650105', '6501', '水磨沟区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('650106', '6501', '头屯河区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('650107', '6501', '达坂城区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('650109', '6501', '米东区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('650121', '6501', '乌鲁木齐县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('650202', '6502', '独山子区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('650203', '6502', '克拉玛依区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('650204', '6502', '白碱滩区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('650205', '6502', '乌尔禾区', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('652101', '6521', '吐鲁番市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('652122', '6521', '鄯善县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('652123', '6521', '托克逊县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('652201', '6522', '哈密市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('652222', '6522', '巴里坤哈萨克自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('652223', '6522', '伊吾县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('652301', '6523', '昌吉市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('652302', '6523', '阜康市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('652323', '6523', '呼图壁县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('652324', '6523', '玛纳斯县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('652325', '6523', '奇台县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('652327', '6523', '吉木萨尔县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('652328', '6523', '木垒哈萨克自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('652701', '6527', '博乐市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('652722', '6527', '精河县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('652723', '6527', '温泉县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('652801', '6528', '库尔勒市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('652822', '6528', '轮台县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('652823', '6528', '尉犁县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('652824', '6528', '若羌县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('652825', '6528', '且末县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('652826', '6528', '焉耆回族自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('652827', '6528', '和静县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('652828', '6528', '和硕县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('652829', '6528', '博湖县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('652901', '6529', '阿克苏市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('652922', '6529', '温宿县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('652923', '6529', '库车县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('652924', '6529', '沙雅县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('652925', '6529', '新和县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('652926', '6529', '拜城县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('652927', '6529', '乌什县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('652928', '6529', '阿瓦提县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('652929', '6529', '柯坪县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('653001', '6530', '阿图什市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('653022', '6530', '阿克陶县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('653023', '6530', '阿合奇县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('653024', '6530', '乌恰县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('653101', '6531', '喀什市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('653121', '6531', '疏附县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('653122', '6531', '疏勒县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('653123', '6531', '英吉沙县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('653124', '6531', '泽普县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('653125', '6531', '莎车县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('653126', '6531', '叶城县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('653127', '6531', '麦盖提县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('653128', '6531', '岳普湖县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('653129', '6531', '伽师县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('653130', '6531', '巴楚县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('653131', '6531', '塔什库尔干县塔吉克自治', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('653201', '6532', '和田市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('653221', '6532', '和田县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('653222', '6532', '墨玉县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('653223', '6532', '皮山县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('653224', '6532', '洛浦县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('653225', '6532', '策勒县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('653226', '6532', '于田县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('653227', '6532', '民丰县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('654002', '6540', '伊宁市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('654003', '6540', '奎屯市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('654021', '6540', '伊宁县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('654022', '6540', '察布查尔锡伯自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('654023', '6540', '霍城县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('654024', '6540', '巩留县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('654025', '6540', '新源县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('654026', '6540', '昭苏县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('654027', '6540', '特克斯县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('654028', '6540', '尼勒克县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('654201', '6542', '塔城市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('654202', '6542', '乌苏市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('654221', '6542', '额敏县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('654223', '6542', '沙湾县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('654224', '6542', '托里县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('654225', '6542', '裕民县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('654226', '6542', '和布克赛尔蒙古自治县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('654301', '6543', '阿勒泰市', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('654321', '6543', '布尔津县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('654322', '6543', '富蕴县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('654323', '6543', '福海县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('654324', '6543', '哈巴河县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('654325', '6543', '青河县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('654326', '6543', '吉木乃县', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('654400', '6544', '石河子', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('654500', '6545', '阿拉尔', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('654600', '6546', '图木舒克', '3', '0', '1');
INSERT INTO `bingo_sys_location` VALUES ('654700', '6547', '五家渠', '3', '0', '1');

-- ----------------------------
-- Table structure for `bingo_sys_logs`
-- ----------------------------
DROP TABLE IF EXISTS `bingo_sys_logs`;
CREATE TABLE `bingo_sys_logs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned DEFAULT '1' COMMENT '1总后台',
  `uid` int(11) unsigned DEFAULT '0' COMMENT '管理帐号ID',
  `event` varchar(100) DEFAULT NULL,
  `addtime` varchar(15) DEFAULT NULL,
  `addip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`,`addtime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=237 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bingo_sys_logs
-- ----------------------------
INSERT INTO `bingo_sys_logs` VALUES ('113', '1', '1', '系统管理员admin登录后台。', '1464660168', '192.168.1.103');
INSERT INTO `bingo_sys_logs` VALUES ('114', '1', '1', '系统管理员admin登录后台。', '1464661234', '192.168.1.103');
INSERT INTO `bingo_sys_logs` VALUES ('115', '1', '1', '删除管理员:10。', '1464662028', '192.168.1.103');
INSERT INTO `bingo_sys_logs` VALUES ('116', '1', '1', '删除管理员:9。', '1464662032', '192.168.1.103');
INSERT INTO `bingo_sys_logs` VALUES ('117', '1', '1', '删除管理员:8。', '1464662037', '192.168.1.103');
INSERT INTO `bingo_sys_logs` VALUES ('118', '1', '1', '删除管理员:5。', '1464662041', '192.168.1.103');
INSERT INTO `bingo_sys_logs` VALUES ('119', '1', '1', '系统管理员admin登录后台。', '1466589140', '0.0.0.0');
INSERT INTO `bingo_sys_logs` VALUES ('120', '1', '1', '系统管理员admin登录后台。', '1467178521', '0.0.0.0');
INSERT INTO `bingo_sys_logs` VALUES ('121', '1', '1', '系统管理员admin登录后台。', '1467190084', '0.0.0.0');
INSERT INTO `bingo_sys_logs` VALUES ('122', '1', '1', '系统管理员admin登录后台。', '1468300928', '127.0.0.1');
INSERT INTO `bingo_sys_logs` VALUES ('123', '1', '1', '系统管理员admin登录后台。', '1468304170', '127.0.0.1');
INSERT INTO `bingo_sys_logs` VALUES ('124', '1', '1', '编辑文章:sad。', '1468306546', '127.0.0.1');
INSERT INTO `bingo_sys_logs` VALUES ('125', '1', '1', '系统管理员admin登录后台。', '1468308830', '127.0.0.1');
INSERT INTO `bingo_sys_logs` VALUES ('126', '1', '1', '系统管理员admin登录后台。', '1468312102', '127.0.0.1');
INSERT INTO `bingo_sys_logs` VALUES ('127', '1', '1', '系统管理员admin登录后台。', '1468312615', '127.0.0.1');
INSERT INTO `bingo_sys_logs` VALUES ('128', '1', '1', '系统管理员admin登录后台。', '1468313669', '127.0.0.1');
INSERT INTO `bingo_sys_logs` VALUES ('129', '1', '1', '系统管理员admin登录后台。', '1468314591', '127.0.0.1');
INSERT INTO `bingo_sys_logs` VALUES ('130', '1', '1', '系统管理员admin登录后台。', '1468371791', '127.0.0.1');
INSERT INTO `bingo_sys_logs` VALUES ('131', '1', '1', '系统管理员admin登录后台。', '1468372899', '127.0.0.1');
INSERT INTO `bingo_sys_logs` VALUES ('132', '1', '1', '系统管理员admin登录后台。', '1468380972', '127.0.0.1');
INSERT INTO `bingo_sys_logs` VALUES ('133', '1', '1', '系统管理员admin登录后台。', '1468381478', '127.0.0.1');
INSERT INTO `bingo_sys_logs` VALUES ('134', '1', '1', '系统管理员admin登录后台。', '1468389366', '127.0.0.1');
INSERT INTO `bingo_sys_logs` VALUES ('135', '1', '1', '系统管理员admin登录后台。', '1468402572', '127.0.0.1');
INSERT INTO `bingo_sys_logs` VALUES ('136', '1', '1', '系统管理员admin登录后台。', '1468404691', '127.0.0.1');
INSERT INTO `bingo_sys_logs` VALUES ('137', '1', '1', '系统管理员admin登录后台。', '1468457928', '127.0.0.1');
INSERT INTO `bingo_sys_logs` VALUES ('138', '1', '1', '系统管理员admin登录后台。', '1468458576', '127.0.0.1');
INSERT INTO `bingo_sys_logs` VALUES ('139', '1', '1', '系统管理员admin登录后台。', '1468460712', '127.0.0.1');
INSERT INTO `bingo_sys_logs` VALUES ('140', '1', '1', '禁用管理员:2。', '1468460992', '127.0.0.1');
INSERT INTO `bingo_sys_logs` VALUES ('141', '1', '1', '系统管理员admin登录后台。', '1468462244', '127.0.0.1');
INSERT INTO `bingo_sys_logs` VALUES ('142', '1', '1', '系统管理员admin登录后台。', '1468462310', '127.0.0.1');
INSERT INTO `bingo_sys_logs` VALUES ('143', '1', '1', '系统管理员admin登录后台。', '1468462572', '127.0.0.1');
INSERT INTO `bingo_sys_logs` VALUES ('144', '1', '1', '系统管理员admin登录后台。', '1468465388', '127.0.0.1');
INSERT INTO `bingo_sys_logs` VALUES ('145', '1', '1', '系统管理员admin登录后台。', '1468466623', '127.0.0.1');
INSERT INTO `bingo_sys_logs` VALUES ('146', '1', '1', '系统管理员admin登录后台。', '1468469637', '127.0.0.1');
INSERT INTO `bingo_sys_logs` VALUES ('147', '1', '1', '系统管理员admin登录后台。', '1468469762', '127.0.0.1');
INSERT INTO `bingo_sys_logs` VALUES ('148', '1', '1', '系统管理员admin登录后台。', '1468474249', '127.0.0.1');
INSERT INTO `bingo_sys_logs` VALUES ('149', '1', '1', '删除管理员:14。', '1468476447', '127.0.0.1');
INSERT INTO `bingo_sys_logs` VALUES ('150', '1', '1', '删除管理员:15。', '1468476459', '127.0.0.1');
INSERT INTO `bingo_sys_logs` VALUES ('151', '1', '1', '删除管理员:15。', '1468476466', '127.0.0.1');
INSERT INTO `bingo_sys_logs` VALUES ('152', '1', '1', '系统管理员admin登录后台。', '1469061222', '0.0.0.0');
INSERT INTO `bingo_sys_logs` VALUES ('153', '1', '1', '启用管理员:15。', '1469073084', '0.0.0.0');
INSERT INTO `bingo_sys_logs` VALUES ('154', '1', '1', '禁用管理员:12。', '1469074539', '0.0.0.0');
INSERT INTO `bingo_sys_logs` VALUES ('155', '1', '1', '系统管理员admin登录后台。', '1477362989', '192.168.1.105');
INSERT INTO `bingo_sys_logs` VALUES ('156', '1', '1', '系统管理员admin登录后台。', '1477545742', '0.0.0.0');
INSERT INTO `bingo_sys_logs` VALUES ('157', '1', '1', '修改学生信息成功:辰生物i诶。', '1477550299', '0.0.0.0');
INSERT INTO `bingo_sys_logs` VALUES ('158', '1', '1', '修改学生信息成功:小伟。', '1477550333', '0.0.0.0');
INSERT INTO `bingo_sys_logs` VALUES ('159', '1', '1', '修改学生信息成功:4小伟。', '1477550785', '0.0.0.0');
INSERT INTO `bingo_sys_logs` VALUES ('160', '1', '1', '修改学生信息成功:郜林。', '1477551126', '0.0.0.0');
INSERT INTO `bingo_sys_logs` VALUES ('161', '1', '1', '删除文章:3。', '1477553729', '0.0.0.0');
INSERT INTO `bingo_sys_logs` VALUES ('162', '1', '1', '修改学生信息成功:2小军。', '1477553750', '0.0.0.0');
INSERT INTO `bingo_sys_logs` VALUES ('163', '1', '1', '删除文章:1。', '1477554216', '0.0.0.0');
INSERT INTO `bingo_sys_logs` VALUES ('164', '1', '1', '编辑文章:送到。', '1477556163', '0.0.0.0');
INSERT INTO `bingo_sys_logs` VALUES ('165', '1', '1', '修改学生信息成功:得瑟得瑟。', '1477557030', '0.0.0.0');
INSERT INTO `bingo_sys_logs` VALUES ('166', '1', '1', '修改学生信息成功:多少撒。', '1477557154', '0.0.0.0');
INSERT INTO `bingo_sys_logs` VALUES ('167', '1', '1', '修改学生信息成功:阿斯。', '1477557418', '0.0.0.0');
INSERT INTO `bingo_sys_logs` VALUES ('168', '1', '1', '修改学生信息成功:撒打算。', '1477557776', '0.0.0.0');
INSERT INTO `bingo_sys_logs` VALUES ('169', '1', '1', '修改学生信息成功:撒打算。', '1477557835', '0.0.0.0');
INSERT INTO `bingo_sys_logs` VALUES ('170', '1', '1', '修改学生信息成功:000。', '1477557875', '0.0.0.0');
INSERT INTO `bingo_sys_logs` VALUES ('171', '1', '1', '修改学生信息成功:的飒爽·。', '1477558298', '0.0.0.0');
INSERT INTO `bingo_sys_logs` VALUES ('172', '1', '1', '修改学生信息成功:12的飒爽·。', '1477558552', '0.0.0.0');
INSERT INTO `bingo_sys_logs` VALUES ('173', '1', '1', '删除文章:2。', '1477558567', '0.0.0.0');
INSERT INTO `bingo_sys_logs` VALUES ('174', '1', '1', '删除文章:4。', '1477558574', '0.0.0.0');
INSERT INTO `bingo_sys_logs` VALUES ('175', '1', '1', '删除文章:5。', '1477558580', '0.0.0.0');
INSERT INTO `bingo_sys_logs` VALUES ('176', '1', '1', '删除文章:10。', '1477558587', '0.0.0.0');
INSERT INTO `bingo_sys_logs` VALUES ('177', '1', '1', '删除文章:6。', '1477559797', '0.0.0.0');
INSERT INTO `bingo_sys_logs` VALUES ('178', '1', '1', '系统管理员admin登录后台。', '1477561710', '0.0.0.0');
INSERT INTO `bingo_sys_logs` VALUES ('179', '1', '1', '系统管理员admin登录后台。', '1481942762', '192.168.31.56');
INSERT INTO `bingo_sys_logs` VALUES ('180', '1', '1', '编辑文章:7送到666。', '1481944930', '192.168.31.56');
INSERT INTO `bingo_sys_logs` VALUES ('181', '1', '1', '编辑文章:7送到666。', '1481945031', '192.168.31.56');
INSERT INTO `bingo_sys_logs` VALUES ('182', '1', '1', '删除文章:7。', '1481945038', '192.168.31.56');
INSERT INTO `bingo_sys_logs` VALUES ('183', '1', '1', '删除文章:2。', '1481945051', '192.168.31.56');
INSERT INTO `bingo_sys_logs` VALUES ('184', '1', '1', '删除管理员:16。', '1481947203', '192.168.31.56');
INSERT INTO `bingo_sys_logs` VALUES ('185', '1', '1', '删除管理员:15。', '1481947208', '192.168.31.56');
INSERT INTO `bingo_sys_logs` VALUES ('186', '1', '1', '删除管理员:14。', '1481947212', '192.168.31.56');
INSERT INTO `bingo_sys_logs` VALUES ('187', '1', '1', '删除管理员:13。', '1481947217', '192.168.31.56');
INSERT INTO `bingo_sys_logs` VALUES ('188', '1', '1', '删除管理员:12。', '1481947222', '192.168.31.56');
INSERT INTO `bingo_sys_logs` VALUES ('189', '1', '1', '删除管理员:2。', '1481947281', '192.168.31.56');
INSERT INTO `bingo_sys_logs` VALUES ('190', '1', '1', '删除管理员:3。', '1481947285', '192.168.31.56');
INSERT INTO `bingo_sys_logs` VALUES ('191', '1', '1', '删除管理员:4。', '1481947290', '192.168.31.56');
INSERT INTO `bingo_sys_logs` VALUES ('192', '1', '1', '系统管理员admin登录后台。', '1483441592', '192.168.31.56');
INSERT INTO `bingo_sys_logs` VALUES ('193', '1', '1', '编辑文章:sdfsdf。', '1483442059', '192.168.31.56');
INSERT INTO `bingo_sys_logs` VALUES ('194', '1', '1', '删除文章:1。', '1483442071', '192.168.31.56');
INSERT INTO `bingo_sys_logs` VALUES ('195', '1', '1', '系统管理员admin登录后台。', '1486522210', '192.168.31.56');
INSERT INTO `bingo_sys_logs` VALUES ('196', '1', '1', '系统管理员admin登录后台。', '1487742548', '192.168.31.56');
INSERT INTO `bingo_sys_logs` VALUES ('197', '1', '1', '系统管理员admin登录后台。', '1487820330', '192.168.31.56');
INSERT INTO `bingo_sys_logs` VALUES ('198', '1', '1', '系统管理员admin登录后台。', '1487901229', '192.168.31.56');
INSERT INTO `bingo_sys_logs` VALUES ('199', '1', '1', '系统管理员admin登录后台。', '1488352259', '192.168.31.56');
INSERT INTO `bingo_sys_logs` VALUES ('200', '1', '1', '系统管理员admin登录后台。', '1490160356', '0.0.0.0');
INSERT INTO `bingo_sys_logs` VALUES ('201', '2', '2', '系统管理员east7登录后台。', '1490170915', '0.0.0.0');
INSERT INTO `bingo_sys_logs` VALUES ('202', '2', '2', '系统管理员east7登录后台。', '1490175531', '0.0.0.0');
INSERT INTO `bingo_sys_logs` VALUES ('203', '1', '1', '系统管理员admin登录后台。', '1490175620', '0.0.0.0');
INSERT INTO `bingo_sys_logs` VALUES ('204', '1', '1', '系统管理员admin登录后台。', '1490231405', '0.0.0.0');
INSERT INTO `bingo_sys_logs` VALUES ('205', '2', '2', '系统管理员east7登录后台。', '1490231445', '0.0.0.0');
INSERT INTO `bingo_sys_logs` VALUES ('206', '3', '19', '系统管理员kaifeng登录后台。', '1490244489', '0.0.0.0');
INSERT INTO `bingo_sys_logs` VALUES ('207', '3', '1', '系统管理员admin登录后台。', '1490244511', '0.0.0.0');
INSERT INTO `bingo_sys_logs` VALUES ('208', '3', '19', '系统管理员kaifeng登录后台。', '1490244570', '0.0.0.0');
INSERT INTO `bingo_sys_logs` VALUES ('209', '1', '1', '系统管理员admin登录后台。', '1490247498', '0.0.0.0');
INSERT INTO `bingo_sys_logs` VALUES ('210', '3', '17', '系统管理员zhengzhou登录后台。', '1490247552', '0.0.0.0');
INSERT INTO `bingo_sys_logs` VALUES ('211', '3', '17', '系统管理员zhengzhou登录后台。', '1490248800', '0.0.0.0');
INSERT INTO `bingo_sys_logs` VALUES ('212', '1', '1', '系统管理员admin登录后台。', '1490248963', '0.0.0.0');
INSERT INTO `bingo_sys_logs` VALUES ('213', '2', '5', '系统管理员vanda登录后台。', '1490251420', '0.0.0.0');
INSERT INTO `bingo_sys_logs` VALUES ('214', '3', '19', '系统管理员kaifeng登录后台。', '1490252867', '0.0.0.0');
INSERT INTO `bingo_sys_logs` VALUES ('215', '3', '20', '系统管理员jiaoha登录后台。', '1490259024', '0.0.0.0');
INSERT INTO `bingo_sys_logs` VALUES ('216', '2', '5', '系统管理员vanda登录后台。', '1490259328', '0.0.0.0');
INSERT INTO `bingo_sys_logs` VALUES ('217', '2', '7', '系统管理员hpu登录后台。', '1490259350', '0.0.0.0');
INSERT INTO `bingo_sys_logs` VALUES ('218', '1', '1', '系统管理员admin登录后台。', '1490317671', '0.0.0.0');
INSERT INTO `bingo_sys_logs` VALUES ('219', '3', '21', '系统管理员huairou登录后台。', '1490318612', '0.0.0.0');
INSERT INTO `bingo_sys_logs` VALUES ('220', '2', '8', '系统管理员yanqi登录后台。', '1490319292', '0.0.0.0');
INSERT INTO `bingo_sys_logs` VALUES ('221', '1', '1', '系统管理员admin登录后台。', '1490575549', '0.0.0.0');
INSERT INTO `bingo_sys_logs` VALUES ('222', '2', '5', '系统管理员vanda登录后台。', '1490575899', '0.0.0.0');
INSERT INTO `bingo_sys_logs` VALUES ('223', '3', '17', '系统管理员zhengzhou登录后台。', '1490576024', '0.0.0.0');
INSERT INTO `bingo_sys_logs` VALUES ('224', '2', '9', '系统管理员hotel登录后台。', '1490578482', '0.0.0.0');
INSERT INTO `bingo_sys_logs` VALUES ('225', '2', '2', '系统管理员east7登录后台。', '1490689000', '0.0.0.0');
INSERT INTO `bingo_sys_logs` VALUES ('226', '3', '17', '系统管理员zhengzhou登录后台。', '1490689593', '0.0.0.0');
INSERT INTO `bingo_sys_logs` VALUES ('227', '2', '5', '系统管理员vanda登录后台。', '1490692064', '0.0.0.0');
INSERT INTO `bingo_sys_logs` VALUES ('228', '2', '5', '系统管理员vanda登录后台。', '1490692597', '0.0.0.0');
INSERT INTO `bingo_sys_logs` VALUES ('229', '1', '1', '系统管理员admin登录后台。', '1490753089', '0.0.0.0');
INSERT INTO `bingo_sys_logs` VALUES ('230', '2', '11', '系统管理员holiday登录后台。', '1490753663', '0.0.0.0');
INSERT INTO `bingo_sys_logs` VALUES ('231', '3', '22', '系统管理员beijing登录后台。', '1490754028', '0.0.0.0');
INSERT INTO `bingo_sys_logs` VALUES ('232', '1', '1', '系统管理员admin登录后台。', '1490754229', '0.0.0.0');
INSERT INTO `bingo_sys_logs` VALUES ('233', '3', '22', '系统管理员beijing登录后台。', '1490754308', '0.0.0.0');
INSERT INTO `bingo_sys_logs` VALUES ('234', '2', '11', '系统管理员holiday登录后台。', '1490754597', '0.0.0.0');
INSERT INTO `bingo_sys_logs` VALUES ('235', '2', '11', '系统管理员holiday登录后台。', '1490756307', '0.0.0.0');
INSERT INTO `bingo_sys_logs` VALUES ('236', '3', '22', '系统管理员beijing登录后台。', '1490756594', '0.0.0.0');

-- ----------------------------
-- Table structure for `bingo_sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `bingo_sys_role`;
CREATE TABLE `bingo_sys_role` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) unsigned DEFAULT '1' COMMENT '1总后台类 2加盟商后台',
  `name` varchar(50) DEFAULT NULL,
  `auth` varchar(650) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bingo_sys_role
-- ----------------------------
INSERT INTO `bingo_sys_role` VALUES ('1', '1', '超级管理员', 'all');

-- ----------------------------
-- Table structure for `bingo_sys_rule`
-- ----------------------------
DROP TABLE IF EXISTS `bingo_sys_rule`;
CREATE TABLE `bingo_sys_rule` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bingo_sys_rule
-- ----------------------------
INSERT INTO `bingo_sys_rule` VALUES ('1', 'Sys/index', '后台主页', '1');
INSERT INTO `bingo_sys_rule` VALUES ('3', 'Sys/add', '添加用户管理', '1');
INSERT INTO `bingo_sys_rule` VALUES ('4', 'Sys/group', '权限组查看', '1');
INSERT INTO `bingo_sys_rule` VALUES ('5', 'Sys/admin', '管理员', '1');
INSERT INTO `bingo_sys_rule` VALUES ('6', 'Sys/LookRule', '查看组权限', '1');
INSERT INTO `bingo_sys_rule` VALUES ('7', 'Sys/LookPre', '查看组成员', '1');
INSERT INTO `bingo_sys_rule` VALUES ('8', 'Sys/GroupAdd', '添加管理组页面', '1');
INSERT INTO `bingo_sys_rule` VALUES ('9', 'Sys/GroupAdds', '执行添加管理组操作', '1');
INSERT INTO `bingo_sys_rule` VALUES ('10', 'Sys/GroupStatus', '禁用小组操作', '1');
INSERT INTO `bingo_sys_rule` VALUES ('11', 'Sys/RuleAdd', '添加组权限页面', '1');
INSERT INTO `bingo_sys_rule` VALUES ('12', 'Sys/RuleAdds', '执行组权限添加操作', '1');
INSERT INTO `bingo_sys_rule` VALUES ('14', 'Sys/Ruledele', '管理员移除管理组操作', '1');
INSERT INTO `bingo_sys_rule` VALUES ('15', 'Sys/RulAdd', '组内添加管理员', '1');
INSERT INTO `bingo_sys_rule` VALUES ('16', 'Sys/GroupSave', '修改组权限操作', '1');

-- ----------------------------
-- Table structure for `bingo_sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `bingo_sys_user`;
CREATE TABLE `bingo_sys_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned DEFAULT '1' COMMENT '1系统管理员 2地区管理员',
  `a1` tinyint(1) unsigned DEFAULT NULL COMMENT '省份',
  `a2` int(4) unsigned DEFAULT NULL COMMENT '城市',
  `user` varchar(50) DEFAULT NULL,
  `pwd` char(32) DEFAULT NULL,
  `addtime` varchar(15) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bingo_sys_user
-- ----------------------------
INSERT INTO `bingo_sys_user` VALUES ('1', '1', null, null, 'admin', 'e10adc3949ba59abbe56e057f20f883e', null, '1');
INSERT INTO `bingo_sys_user` VALUES ('17', '2', '41', '4101', 'zhengzhou', 'e10adc3949ba59abbe56e057f20f883e', '1490238490', '1');
INSERT INTO `bingo_sys_user` VALUES ('18', '2', '31', '3101', 'aashanghai', 'e10adc3949ba59abbe56e057f20f883e', '1490238895', '0');
INSERT INTO `bingo_sys_user` VALUES ('19', '2', '41', '4102', 'kaifeng', 'e10adc3949ba59abbe56e057f20f883e', '1490238948', '1');
INSERT INTO `bingo_sys_user` VALUES ('20', '2', '41', '4108', 'jiaoha', 'e10adc3949ba59abbe56e057f20f883e', '1490238970', '1');
INSERT INTO `bingo_sys_user` VALUES ('21', '2', '11', '1127', 'huairou', 'e10adc3949ba59abbe56e057f20f883e', '1490318530', '1');
INSERT INTO `bingo_sys_user` VALUES ('22', '2', '11', '1108', 'beijing', 'e10adc3949ba59abbe56e057f20f883e', '1490753918', '1');

-- ----------------------------
-- Table structure for `bingo_user_list`
-- ----------------------------
DROP TABLE IF EXISTS `bingo_user_list`;
CREATE TABLE `bingo_user_list` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned DEFAULT '0' COMMENT '上级会员ID',
  `lv` tinyint(3) unsigned DEFAULT '0' COMMENT '0普通用户 1VIP用户',
  `openid` varchar(50) DEFAULT NULL,
  `jf` decimal(10,0) unsigned DEFAULT '0' COMMENT '积分',
  `name` varchar(50) DEFAULT NULL,
  `tel` varchar(15) DEFAULT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `sex` tinyint(1) DEFAULT NULL,
  `language` varchar(20) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `headimgurl` varchar(150) DEFAULT NULL,
  `subscribe` tinyint(1) DEFAULT '0' COMMENT '1已关注 0未关注',
  `subscribe_time` varchar(15) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `lat` float(20,6) unsigned DEFAULT NULL,
  `lng` float(20,6) unsigned DEFAULT NULL,
  `addtime` varchar(15) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=207 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bingo_user_list
-- ----------------------------
INSERT INTO `bingo_user_list` VALUES ('1', '0', '0', 'oSlXkvjnKZjdL7CmF39JWeyPWZkw', '0', null, null, 'Mr.right', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEISsgKHxg775q3LXFJXX0CU8JXnJMg464NkFdxyxmAwEvMWW6Y48zEOhFvoiaykNuw9lMB0eWvNNzg/0', '0', null, null, null, null, '1486616595', '1');
INSERT INTO `bingo_user_list` VALUES ('2', '0', '0', 'oSlXkvm1Lmr_MrggZ952S6jKNCjg', '0', null, null, '污小花', '2', 'zh_CN', '朝阳', '北京', '中国', 'http://wx.qlogo.cn/mmopen/MZbnegfbjxRwPhGmuon08UpeHzntkT2qAca3jtF14SeHY0GFtziaeIoeFl1IjzyfpSAbibicro8VfDiaIVJW6BZibvBeSkHonePBE/0', '0', null, null, null, null, '1486617091', '1');
INSERT INTO `bingo_user_list` VALUES ('3', '0', '0', 'oSlXkvmVSwhlVw1O_86PjqdeTZYQ', '0', null, null, '卿允', '1', 'zh_CN', '商丘', '河南', '中国', 'http://wx.qlogo.cn/mmopen/I3DOQLyMB0QG1JXjqn1q8AXk7Nicp8iaUah3Px0E1ics9T9AD7sicia4HNpqF6lx9SP1SgN3LvYWPE0YQRsNVWbdIwIje2BichcKibe/0', '0', null, null, null, null, '1486617760', '1');
INSERT INTO `bingo_user_list` VALUES ('4', '0', '0', 'oSlXkvs6sSqTJ4V8LBJdAqK79W9I', '0', '尚蔚', '135926868668', '尚蔚', '2', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCx8g7xCKOqvMjqWzQC09HRvQHTCKyiaBfKRzGfxIxcdibfyibY7utfkCVG0eJw8DffZrBMglszlQYWg/0', '0', null, null, null, null, '1486621750', '1');
INSERT INTO `bingo_user_list` VALUES ('5', '0', '0', 'oSlXkvtmMeDi9jwAmlwxXiHYVW3Y', '0', null, null, 'Chao', '1', 'zh_CN', '', '香港', '中国', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJKaWBoFNeoMffic5ia9jQPsqP0UGMSiaRcmf5SLeb0QicIenx0uHStiawF0IEbMcAA1WKibeDlCl42VMaw/0', '0', null, null, null, null, '1486622153', '1');
INSERT INTO `bingo_user_list` VALUES ('6', '0', '0', 'oSlXkvqFBxCtR9ujDzwe5Yo7vlbo', '0', null, null, '裴雨', '2', 'zh_CN', '', '', '中国', 'http://wx.qlogo.cn/mmopen/I3DOQLyMB0RJZzdQsB4sOluwpm7eEy1ozvt4R2mW1S8o8yosu58CyNmiboNzLOdTejKNyQ60fBZpjtgWA2RxEicrql3P7v5CrX/0', '0', null, null, null, null, '1486628807', '1');
INSERT INTO `bingo_user_list` VALUES ('7', '0', '0', 'oSlXkvqCa1RnBCBKizuFmFkIjMQ0', '0', null, null, '小吕', '1', 'zh_CN', '平顶山', '河南', '中国', 'http://wx.qlogo.cn/mmopen/e4AHVDBKM2JOhHD9B44B3kokAy597RTZrwMfGVRPRwib2pYwCVNpGMQGTn0ibTXwfPibtZZwogt3SEO02VoFjKYrics6UTyZ4CVj/0', '0', null, null, null, null, '1486635666', '1');
INSERT INTO `bingo_user_list` VALUES ('8', '0', '0', 'oSlXkvs6Ij0Unija4ZgvifDnvgZQ', '0', null, null, '小五', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/e4AHVDBKM2JOhHD9B44B3qwictFPpIRByiavia0FDV0DcESTOxtzBoOOXH8YHVYicoJBQpBhU0Mic0QhAybib8g0icXjHjbdZLzN157/0', '0', null, null, null, null, '1486635676', '1');
INSERT INTO `bingo_user_list` VALUES ('9', '0', '0', 'oSlXkvukRy25-kIk-DjYKptA8-NU', '0', null, null, 'REID', '1', 'zh_CN', '', '', '中国', 'http://wx.qlogo.cn/mmopen/MZbnegfbjxSyRj3ibM83Ez80RaCPoGrgYS0HcdVhOkrfg0W6MhvJmr2O3E6pGgNicMJ1drw6RGh4coUp0RaLzXX48Uql09z0Jm/0', '0', null, null, '34.808762', '113.569778', '1486635679', '1');
INSERT INTO `bingo_user_list` VALUES ('10', '0', '0', 'oSlXkvpUNx-_miCRcWsEdcSMmsGM', '0', null, null, '鹿先森', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/e4AHVDBKM2LMILaib6ETZe4oNDqUSfhMp51v10yVHsbmISGGH5LJfToSe5ZeStwMwXL6oo60OXs6Xicljib1l7rKE8xDs78nnr6/0', '0', null, null, null, null, '1486636440', '1');
INSERT INTO `bingo_user_list` VALUES ('11', '0', '0', 'oSlXkvvd_f4ZwJLrZaXkM7CV6ZgM', '0', null, null, 'zm', '2', 'en', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/LjfPIdu1jLGoqIMH7bo5TCZoe5XQgJRIYs2YcpTWEuMdG4uswPbrYZIVlZzZwmCWBVibCR7ogGG4Bhia2ALLJY1lMDtTYvhiaIW/0', '0', null, null, null, null, '1486636460', '1');
INSERT INTO `bingo_user_list` VALUES ('12', '0', '0', 'oSlXkvtKrA4cwb0Mil5rn2f_bI8I', '0', null, null, 'JCY', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/I3DOQLyMB0QG1JXjqn1q8NjYTruMb7SAVOUibBD1iae1QKwbEZYBR16dMFdfdNGjibFnBBV1Yrzct1qdZyl8uAc9aZiaD0srm9za/0', '0', null, null, null, null, '1486642322', '1');
INSERT INTO `bingo_user_list` VALUES ('13', '0', '0', 'oSlXkvo691ZYiWVOpr_HLs4JqIkw', '0', null, null, 'Clown、', '1', 'zh_CN', '无锡', '江苏', '中国', 'http://wx.qlogo.cn/mmopen/kIB1F5GBAEQrWS5fVC5CNwIylW3FFobwax1Gtk4dtQbh2f6qAPpYpUMQibsk9gcKV4g6YwFxAfgbEfsF9W5FA4se8ZI1icl0qW/0', '0', null, null, '34.807510', '113.570892', '1486645366', '1');
INSERT INTO `bingo_user_list` VALUES ('14', '0', '0', 'oSlXkvoh_yg3fwz8kGDraguwTmyQ', '0', null, null, 'Jason', '2', 'zh_CN', '', '', '中国', 'http://wx.qlogo.cn/mmopen/e4AHVDBKM2JZDujMibAGrlY2wVvgsTlJ1JeExdEJyM1bE9mXUstsgnKe4He0RuV1aRB4wxBw4tG7UdqdhGJqF3RXJbPUNnfuH/0', '0', null, null, '22.610304', '114.055054', '1486652232', '1');
INSERT INTO `bingo_user_list` VALUES ('15', '0', '0', 'oSlXkvvjSI8mM1lEuIZwm4eT_ENo', '0', null, null, '李永吉', '1', 'zh_CN', '安阳', '河南', '中国', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCPDDlykOtQjcpzxRV4lJBnCopoJxX7gkN5Uy0HcKNJv8SibqD5p2OJzmB2wbChmW2ZRntsb4INtgA/0', '0', null, null, null, null, '1486662887', '1');
INSERT INTO `bingo_user_list` VALUES ('16', '0', '0', 'oSlXkvmTcFQt4CDBBX1jq5VTiJRg', '0', null, null, ' 百度官网V果', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/I3DOQLyMB0QG1JXjqn1q8MzDcpjk9yibVPvWguUZk2dVAhD3M2Nj8hlkpKE1eQibCazLXEIrGxYJwwh07cnsjDdFg5z8My8tick/0', '0', null, null, '34.807434', '113.570251', '1486685183', '1');
INSERT INTO `bingo_user_list` VALUES ('17', '0', '0', 'oSlXkvmTvfRhcXsnqKd0hk5QszUc', '0', null, null, '无声告白', '2', 'zh_CN', '', '', '中国', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCadPZpygUIn3JfLu69duTalkm9VqVsZJHYGGL1sU7HTGwMqprrzjFq7DOMhMkJKNFvYa8KPQMtgw/0', '0', null, null, null, null, '1486687020', '1');
INSERT INTO `bingo_user_list` VALUES ('18', '0', '0', 'oSlXkviqLKJTU6PoOfkDpG5Bv6hE', '0', null, null, '忧郁的下午是微笑~', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/e4AHVDBKM2JOhHD9B44B3t7KpAtxK0Mo91cjz1gJgrr4StQia9uI067xGv9m3snLIJA5OgTia7icR5em2c4sKPia9tVcd6U2dh8y/0', '0', null, null, null, null, '1486692675', '1');
INSERT INTO `bingo_user_list` VALUES ('19', '0', '0', 'oSlXkvpcuniYO0JSCPdTAp0ifF6k', '0', null, null, '人在旅途', '2', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/VHU8bI7BOJA6qb1YjeVkcYuZx5ib7nKjJgrIQ8gic5dE63Lic6bWDFP7aNofeg8vJJbpymnNOfyuic09G5TTPvMsrg/0', '0', null, null, null, null, '1486699883', '1');
INSERT INTO `bingo_user_list` VALUES ('20', '0', '0', 'oSlXkvg-sTJNQG6OnpatHk6_tOnQ', '0', null, null, 'A00郑州360推广王朋宇15937163884', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/I3DOQLyMB0QG1JXjqn1q8OabfctOWyMxZolKg4aOic6jkTkQrSEpzt8Ozuy9J4qu66vnMAQiczTFZXCLmba9rW7oibl5ib15RAqX/0', '0', null, null, '34.807877', '113.570648', '1486701249', '1');
INSERT INTO `bingo_user_list` VALUES ('21', '0', '0', 'oSlXkvm8CwJmCV6jcNpqm_5znA9Q', '0', null, null, '辰狼', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/e4AHVDBKM2JOhHD9B44B3o4HpXdCHibyWibOSYdvWoKJrgp6yA9p0MkqFpQibeEUPDClCHtfS3DNropnSexC3t0ibaLaDvtOms8x/0', '0', null, null, null, null, '1486701290', '1');
INSERT INTO `bingo_user_list` VALUES ('22', '0', '0', 'oSlXkvuRQrQt7gacFjSlUG12A830', '0', null, null, '田超峰 网络推广 177 0382 4566', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/e4AHVDBKM2JOhHD9B44B3qgT63Eia8mPy4BEYvU69FLIbtpbTdERnRzaDPgoj8clmVbHoHNlHkQl5icQbFNdMIKp2OcOOGiaK2ic/0', '0', null, null, '34.808861', '113.568932', '1486701729', '1');
INSERT INTO `bingo_user_list` VALUES ('23', '0', '0', 'oSlXkvksbcv_kxAmfqi_mp_j57P4', '0', null, null, 'AAA艾翔A搜狗、腾讯.', '1', 'zh_CN', '', '', '中国', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLA5gWKhZ7sUBRkGyibaBN1ibyricDeuiaUYK69rwlm8xheeqF4XUrP5uJtdqgOpskOK2dmoibic7T4utgaw/0', '0', null, null, null, null, '1486702300', '1');
INSERT INTO `bingo_user_list` VALUES ('24', '0', '0', 'oSlXkvuPOsBYR0sQ56HHuMItsloY', '0', null, null, '蜜丝果尔饮品旗舰店', '2', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/I3DOQLyMB0QG1JXjqn1q8I5YVABn7J4CbGncSAxTAaibOZIYuAUkfgzpDibrtUyu4tCiabFpsVS59Ybt8lTyVRa019QZDgbKiagb/0', '0', null, null, null, null, '1486703645', '1');
INSERT INTO `bingo_user_list` VALUES ('25', '0', '0', 'oSlXkvnxmMPRkv06w1rH9KKGcx_E', '0', null, null, '吕敬', '2', 'zh_CN', '', '', '中国', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4fjALTicUANYiaWcSgKFAmSbxKC9RqfGKXLGjmTUiaria7BY4QuPTGoC6uoPIBAvzibn8WzmF82UQt3nbP2VYf8zcHM0Aj9erdKIhA/0', '0', null, null, '34.807743', '113.568924', '1486703984', '1');
INSERT INTO `bingo_user_list` VALUES ('26', '0', '0', 'oSlXkvnYUPYodo0xNvNWHxKmsXaU', '0', null, null, '、青 ', '2', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/VHU8bI7BOJBzkxDjfAnW8PauZegaoFsRibkop1ic68CZ4FbLic6wuVQSibyQpT94EsUgW15r2FkgnKWHar2fcLstjA/0', '0', null, null, null, null, '1486704510', '1');
INSERT INTO `bingo_user_list` VALUES ('27', '0', '0', 'oSlXkvkrXGz9cENzW99JofdPi7qg', '0', null, null, '汪汪汪', '2', 'zh_CN', '', '', '中国', 'http://wx.qlogo.cn/mmopen/LjfPIdu1jLGoqIMH7bo5TFh3UWYNib294h00OleA1EILYAKZUAhwHSFOneiaFO9WO9nJOhUk5UEZTvR2VyGwhE338lRc6IcWky/0', '0', null, null, '34.807766', '113.568680', '1486705673', '1');
INSERT INTO `bingo_user_list` VALUES ('28', '0', '0', 'oSlXkvt2ZsrUih6sj5dnS9xuZsRQ', '0', null, null, '关相( xiàng) 洋', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/MZbnegfbjxSyRj3ibM83EzibP0yld6YQ7LEFuMWE088eyIOHmnAibwBaFE4XVYYLF0EZhxnFUQ1NI0c7AKgxY3Q2DLu0vB6diaCW/0', '0', null, null, null, null, '1486706666', '1');
INSERT INTO `bingo_user_list` VALUES ('29', '0', '0', 'oSlXkvo2_mWgmzJioIADjXgsc6q8', '0', null, null, '鸿之翼  周创', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/VHU8bI7BOJC07MhpXyADmNM735gLQMyRcxq17TgAiaam2RptBGmSOSnhK9pUeRBYoicjZ9E5ZPxBwnSicAxUd2bqA/0', '0', null, null, null, null, '1486706959', '1');
INSERT INTO `bingo_user_list` VALUES ('30', '0', '0', 'oSlXkviAIF9fALCn243xgt09IjKY', '0', null, null, '芬', '2', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/I3DOQLyMB0RrpWVoQBbsLksuCicjoONgBL9oePKVbJOvMwR34RN8cz43CkUic9MK1ovBbuS0L1AWxaFic6gE7WteKxAymmhULiby/0', '0', null, null, '34.808144', '113.568871', '1486708495', '1');
INSERT INTO `bingo_user_list` VALUES ('31', '0', '0', 'oSlXkvjKTc7sk90gG8Q469J7eMH0', '0', null, null, '紫薰浅夏', '2', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/VHU8bI7BOJBH4YICqC6icydK6j4sYaanvVtOhnv7v2lvOHcicwPvq3fIc0w1qCPdD3jY0oaJEYdbz9UxhH8D4icXtYPnDr00UgL/0', '0', null, null, null, null, '1486708512', '1');
INSERT INTO `bingo_user_list` VALUES ('32', '0', '0', 'oSlXkvirJkOsfFMcdNPNTVCIF8nQ', '0', null, null, '匆匆', '2', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/VHU8bI7BOJDRjCkZyYEgJ4ibwaBuV1VhTbNhHQdIAePHJc3qM1Jgb4XehQVsZjTzmAqyDvia5y56O1jr4cTRbnRQ/0', '0', null, null, null, null, '1486708575', '1');
INSERT INTO `bingo_user_list` VALUES ('33', '0', '0', 'oSlXkvjfW9WUOP_BhkYac0uR1Ue8', '0', null, null, '我们天生偏执狂', '2', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/VHU8bI7BOJANYcEDrOdzXvE9TXhk3EUprLJazDbXKMhN7YlDa7Pb197fQFwIjtn6GR50l8htRAFFYwOyYPJrFw/0', '0', null, null, null, null, '1486708672', '1');
INSERT INTO `bingo_user_list` VALUES ('34', '0', '0', 'oSlXkvu1aUCoSrvbF_U4BJOQ9bUw', '0', null, null, '张小某', '2', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLAGtIHnb3k8JiaspZ1uwvmtrHvXDlSd2YkMencI3hvZiaXjSm098j0AGl4OE1Eeje8mCBGN8lT5k08g/0', '0', null, null, null, null, '1486709028', '1');
INSERT INTO `bingo_user_list` VALUES ('35', '0', '0', 'oSlXkvmEhj6V_oDR8SujI21_jlQ4', '0', null, null, '蔷薇花', '2', 'zh_CN', '', '', '中国', 'http://wx.qlogo.cn/mmopen/e4AHVDBKM2JOhHD9B44B3tO6d2H284ngTfRro2vn4ibJcB6atSTe8C7SNdQqV9DxlPpjX6AByCVWoP6k8EYLPgmf5BWKxBia0f/0', '0', null, null, '34.808132', '113.568794', '1486709218', '1');
INSERT INTO `bingo_user_list` VALUES ('36', '0', '0', 'oSlXkvj6CQ3qFmyppm_3HWKjECZU', '0', null, null, 'A 天.依旧亮', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/I3DOQLyMB0QG1JXjqn1q8KD9QWQEL7AlasofR3Yria48WBB8HvEnZA08CIgoQOiaBKyJPVC0NoMicia8JpbHQicuT7Mv40pliaSFzC/0', '0', null, null, '34.807552', '113.569054', '1486712846', '1');
INSERT INTO `bingo_user_list` VALUES ('37', '0', '0', 'oSlXkvsAYbTyvdw8SHy8B6SQeLaU', '0', null, null, 'AAA～时光偷走初心', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/MZbnegfbjxSyRj3ibM83Ez2NBvc1SMqYCEEicR1lPgWPtZvCyOa6TyUzE5qTJ5dptzYCic3q32nvkqUQLdNB8wodic84XaeziaXjB/0', '0', null, null, '34.808300', '113.570099', '1486714708', '1');
INSERT INTO `bingo_user_list` VALUES ('38', '0', '0', 'oSlXkvqfqfbTjEs-6ofDY8uiOow8', '0', null, null, '忘了为何', '1', 'zh_CN', '周口', '河南', '中国', 'http://wx.qlogo.cn/mmopen/VHU8bI7BOJBSpxUD7EjofwHDiaiauOORMUvx7Eyiax23KLZNAkXHicTupjP7VEyn9uBicdk6ia3z9AgsjEmsHiaWyGFEA/0', '0', null, null, '34.805412', '113.562424', '1486719015', '1');
INSERT INTO `bingo_user_list` VALUES ('39', '0', '0', 'oSlXkvs0jmvoCP83sa_G3dWV4jRk', '0', '张超', '15890013874', '细嗅蔷薇', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBBr2Ju5NFPuLmPlMqpqh58AwmpT6LoHf6FeeEWHd1lu3oSDpPibyhvf5qlakwQLjXshjJshicd4zUg/0', '0', null, null, '34.808304', '113.569977', '1486719682', '1');
INSERT INTO `bingo_user_list` VALUES ('40', '0', '0', 'oSlXkvvQi5xGsWOg1f05NUfs7oDI', '0', null, null, '锋云', '1', 'zh_CN', '南宁', '广西', '中国', 'http://wx.qlogo.cn/mmopen/MZbnegfbjxSKTBdFzDqsnKTSWxU3OTYB2VzMmRumKffBRudCA5XOxCx7PF1pDYPHZc3FzdJBG8HpmapmicD5ib0ydkpic8hb49W/0', '0', null, null, '22.867432', '108.268250', '1486719686', '1');
INSERT INTO `bingo_user_list` VALUES ('41', '0', '0', 'oSlXkvr5JNWrC3Mep0xDor7Zg2mo', '0', null, null, 'Shuang', '2', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/LjfPIdu1jLGoqIMH7bo5THF5FaH24Ft98yTXAroqjwqJ3nXca0jukMF6OK001jCWKpfIviaEOnP7P1W0Dsniaa5lz5exiaCicIAic/0', '0', null, null, '34.807663', '113.568924', '1486720908', '1');
INSERT INTO `bingo_user_list` VALUES ('42', '0', '0', 'oSlXkvtSijkgZIszv7My8VStva64', '0', null, null, '蚂蚁有问题', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/e4AHVDBKM2JOhHD9B44B3qbg6aRVH10tXXkF0O5xvM4Vp8iaAsBnIOFq4dsnVvUzuEPCHgtdMcb8CPr5QvjIvfwcDnIUvDnoX/0', '0', null, null, '34.808346', '113.568298', '1486721000', '1');
INSERT INTO `bingo_user_list` VALUES ('43', '0', '0', 'oSlXkvigs9t_7SdqO3eAqP-oth5U', '0', null, null, '寻', '1', 'zh_CN', '安阳', '河南', '中国', 'http://wx.qlogo.cn/mmopen/LjfPIdu1jLGoqIMH7bo5TDw3y1IhVVHwUxdRiaevzWW1Namp8iclNQ7miaib8HKmqZ5Cqfnfiavia01YhTbZaGDxBU1oP4GNx7Jlwp/0', '0', null, null, '34.808414', '113.569664', '1486721044', '1');
INSERT INTO `bingo_user_list` VALUES ('44', '0', '0', 'oSlXkviGjOwO_VogKzHh1YABBXvg', '0', null, null, '李衞超', '1', 'zh_CN', '丰台', '北京', '中国', 'http://wx.qlogo.cn/mmopen/I3DOQLyMB0QG1JXjqn1q8EJfuaD1ZQvBaVdoD9JiaiaOY1Xibuz34ogO28FCIzSMXX8yK78TOVG6WLJP0VRs1eA7InRtGoxkLAq/0', '0', null, null, null, null, '1486721298', '1');
INSERT INTO `bingo_user_list` VALUES ('45', '0', '0', 'oSlXkvqVWe32DqSD51RGlJa8dV5U', '0', null, null, '。', '1', 'zh_CN', '武汉', '湖北', '中国', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM7QqPB353F7o2EqzOJpFaIaH9FqAp9IeSYZQkTtpFXs380EfmLL5ibqIELEriaWIJgtzUSJw6ISxMicVMSP3BcctgpCiarCQyPuz7Q/0', '0', null, null, null, null, '1486721376', '1');
INSERT INTO `bingo_user_list` VALUES ('46', '0', '0', 'oSlXkvikPnq4BV2oIvJUHZGlXILs', '0', null, null, '飞', '1', 'zh_CN', '焦作', '河南', '中国', 'http://wx.qlogo.cn/mmopen/LjfPIdu1jLGoqIMH7bo5TMVxUIUYVG1ibGeextBEicsdTTUYQblibu3xWuibYtZhzECHkLfyOcNRdmxHibcu83OBD9alYFYztNrPo/0', '0', null, null, '34.800327', '113.562698', '1486724359', '1');
INSERT INTO `bingo_user_list` VALUES ('47', '0', '0', 'oSlXkvtdT2ziP29yUMBzO6_Kdtjg', '0', null, null, '', '2', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLAzG8kIyJjRXREvMF1NouI3MAl6wr2WuAthjERGHPzPDkgIv3aicnm88NZQicuw7IVicjyR7CZ5E4HTw/0', '0', null, null, null, null, '1486725925', '1');
INSERT INTO `bingo_user_list` VALUES ('48', '0', '0', 'oSlXkvkCRHkVJh3SgzbE2rR1B0oU', '0', null, null, 'A  ', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/I3DOQLyMB0SMOujzGiaccRH28whCjA2ibnmc5lDY0DgWkma1sFST86Q5rDAOKdCk4tFramxfo90sCf9ep5bJibSMVhwzXVGBN1t/0', '0', null, null, '34.475822', '114.453316', '1486726178', '1');
INSERT INTO `bingo_user_list` VALUES ('49', '0', '0', 'oSlXkvjKw4GZlQQLIKAlxCos7uAM', '0', '杨林', '15890602030', '宾果智造', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/VHU8bI7BOJBpgh9WYdoUaEEibxnibb6VjMVyPStRp8udHiaWlytlEaMFZMKG5PAbnZlQhXMQaicR8VmDkq46ZNWSfA/0', '0', null, null, '34.742393', '113.755951', '1486800683', '1');
INSERT INTO `bingo_user_list` VALUES ('50', '0', '0', 'oSlXkvuKeKTnyb8NhkwRwT_uWGv0', '0', null, null, 'Lynn', '2', 'en', '', '', '中国', 'http://wx.qlogo.cn/mmopen/MZbnegfbjxRwPhGmuon08cM8cqgafoZXUr4ibtnLafnZib5hxcRpZZWSWfkZpibaNK7IqRF4g9OmicZfaicQpJtvjbiarFkZYAibToH/0', '0', null, null, null, null, '1486830713', '1');
INSERT INTO `bingo_user_list` VALUES ('51', '0', '0', 'oSlXkviWvU4TAxYvW74upXwhDlYM', '0', null, null, '付金航', '1', 'zh_CN', '', '', '', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKleTWlG5rPicMYaFG1kYmFx8ZRwcZBhdO3F8QE2g8icFb2CPv0icfDsVpMdPcb6RkzLpwcia0ISx7UZA/0', '0', null, null, '37.790932', '112.604408', '1486868940', '1');
INSERT INTO `bingo_user_list` VALUES ('52', '0', '0', 'oSlXkvgj3tossk7TNpNc58FZA61Q', '0', null, null, 'MR.YANG', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELG2dTHEia5jptwQwUFWLlic1EhmuffxMQhtnBdWN0pDDIxFU4jUqYyP9Jicc6IEGm669c3DZyLPybDg/0', '0', null, null, '34.808331', '113.565918', '1486877430', '1');
INSERT INTO `bingo_user_list` VALUES ('53', '0', '0', 'oSlXkvoq3l1W7MAeyvwMLoYLPoSo', '0', null, null, '桑雅芳15136400951', '2', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/I3DOQLyMB0TYibeSzic9O6mmia0ibpLcBicIBKlSQJhc7sFN91adlmjEMx5uBqRhXQYQqJH69qRpzSALibTCrEOOicdFA/0', '0', null, null, '34.763737', '113.549362', '1486898471', '1');
INSERT INTO `bingo_user_list` VALUES ('54', '0', '0', 'oSlXkvr4ltzFW2AQydlVvbTcCfxg', '0', null, null, '杜晓阳', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/I3DOQLyMB0RicM1iauGpGAPVXKAtVBSHvN38KhfeHtGgFKGjCQju11P91GIIsBvk6gkdoLmD6bpicpiaElNCk5zGg2KzDqGHT1Ty/0', '0', null, null, null, null, '1486898493', '1');
INSERT INTO `bingo_user_list` VALUES ('55', '0', '0', 'oSlXkvh0Q0yAp0TLfAJnAdY_7XbQ', '0', null, null, 'KrystalJiao', '2', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/I3DOQLyMB0QG1JXjqn1q8OV2agrvp98pkm7kcjZWTnQZFnHXYCdIHUVs1CVow4mRt5IzaBsicJaGn4R0g9SlPf1e8fKlVHNso/0', '0', null, null, null, null, '1486898698', '1');
INSERT INTO `bingo_user_list` VALUES ('56', '0', '0', 'oSlXkvpYQarA1o16n8L2m6Frx0Qo', '0', null, null, 'Free and easy', '2', 'zh_CN', '西安', '陕西', '中国', 'http://wx.qlogo.cn/mmopen/I3DOQLyMB0QG1JXjqn1q8GnxrEfNHrPCT8le8yf9pPGYlsiaPIofX9cw3CXY4ZztI127TdHPkZ0J1pNEvGU8e5icArW97pTMrY/0', '0', null, null, null, null, '1486898966', '1');
INSERT INTO `bingo_user_list` VALUES ('57', '0', '0', 'oSlXkvqxMtzz-eOuc2RMrEdWXl2M', '0', null, null, '梁增增', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/I3DOQLyMB0Ty6TzhfmRP8MibaMYO3uqyAX33G3lRZ6mLpNslGxibL0lvEfhAAOXKYKibNR3Dv1B8C9Tm3p13rS9Xg/0', '0', null, null, '35.390953', '113.619133', '1486907353', '1');
INSERT INTO `bingo_user_list` VALUES ('58', '0', '0', 'oSlXkvj12fsKUZZJlM7zX43XmhVg', '0', null, null, '鑫', '1', 'zh_CN', '商丘', '河南', '中国', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLD3ftSX0uXch2eIibCc2Rzpku6eiaXDCv1oNGoyhuRIgqUG8vywrYdGXuxYZVUYDco7AFsiaDleN4XXA/0', '0', null, null, '34.742081', '113.755623', '1486909472', '1');
INSERT INTO `bingo_user_list` VALUES ('59', '0', '0', 'oSlXkvkSRhziX8NrJ24DnobQaqko', '0', null, null, '牵 ️ 手', '1', 'zh_CN', '广州', '广东', '中国', 'http://wx.qlogo.cn/mmopen/RrLouKpSZGxm1WkVRFIyDCSbJXUibicHUF4ibXIbHpI17y6D4AJAPvpYoZ2E2YesqaBZgKOt2XM2r1aHldNdMKGzEgt03jxREQr/0', '0', null, null, '34.807564', '113.569252', '1486947452', '1');
INSERT INTO `bingo_user_list` VALUES ('60', '0', '0', 'oSlXkvqSQQPGhttdGGZINnStPt7Q', '0', null, null, '승재', '1', 'zh_CN', '', '', '中国', 'http://wx.qlogo.cn/mmopen/VHU8bI7BOJDkyyEjBY7JJD2q8Vu3gQicJ0elsic8XtCI53bNR3Dt1FtdCdYYFOJqZGWDTCPqaW0iaCeUUC3gLgUsg/0', '0', null, null, null, null, '1486953198', '1');
INSERT INTO `bingo_user_list` VALUES ('61', '0', '0', 'oSlXkvjPZ5CAC0AmvCkfRmbE02ig', '0', null, null, '周庆超', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/LjfPIdu1jLGoqIMH7bo5TO6jRMMy5RWMwKictvUECBduMV1USLs1kZFRH6wrzH2UFW2gd6xn1xG2SYyEKUqCgnjLKa99MTY3g/0', '0', null, null, '34.807545', '113.568939', '1486957391', '1');
INSERT INTO `bingo_user_list` VALUES ('62', '0', '0', 'oSlXkvl2yyJuJG1o6O1nSn7en288', '0', null, null, '赵正权', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/LjfPIdu1jLGoqIMH7bo5TDpu6Skl5lkZfqZCoCRQa8WKYo8iaAjRr9XnK51Nyic3PT1B5IJc8uk343mDKXOOLwkdLTTY0icIgBs/0', '0', null, null, '34.807793', '113.568680', '1486961885', '1');
INSERT INTO `bingo_user_list` VALUES ('63', '0', '0', 'oSlXkvuQWyrdzZJ_JpVBXhpWD6wg', '0', null, null, '小强', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/MZbnegfbjxRLd199rUfLUQjTNX6sjricjufvHGQrABz5RLrYkGFNPoZiadgkky9kptW0aJaibrgAJWiarhtCeISKfjPOhkCicUBua/0', '0', null, null, '34.808521', '113.568954', '1486961893', '1');
INSERT INTO `bingo_user_list` VALUES ('64', '0', '0', 'oSlXkvh8qYbGpuRUYaiSYppHE-yQ', '0', null, null, '叽里呱啦荟', '0', 'zh_CN', '', '', '中国', 'http://wx.qlogo.cn/mmopen/e4AHVDBKM2K7vsBycjaHoIwq0EkL978Lp199icrMlKZWPRKFzQzuaA8YlXO5GfHoElbkwyv1dwhIibUQNplibKQ2H2A8GwwexEk/0', '0', null, null, null, null, '1486962391', '1');
INSERT INTO `bingo_user_list` VALUES ('65', '0', '0', 'oSlXkviZXGoSpryQ2e8lw79nc8_Y', '0', null, null, '蒝萊', '2', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5gm5megLWQEjDYt9RyVWgvCflTZbJGu8Jvicc42m2gntBv8l5157phgE3xVBhAIsESKW73YODa8sQ/0', '0', null, null, '34.808678', '113.569664', '1486962438', '1');
INSERT INTO `bingo_user_list` VALUES ('66', '0', '0', 'oSlXkvtBeZr_tsm-gi8Bo0GdQ3f4', '0', null, null, 'Joyce', '1', 'zh_CN', '', '', '', 'http://wx.qlogo.cn/mmopen/I3DOQLyMB0QG1JXjqn1q8LXZWbDJvicwzhv5ETu73WC9Bzfku5QFEa1aJBWG2QhVB8eoXDgMBnBf6nxRwfR6mYA6vothreP8Z/0', '0', null, null, '34.808399', '113.571854', '1486962730', '1');
INSERT INTO `bingo_user_list` VALUES ('67', '0', '0', 'oSlXkvrU4zvS6T7qJINrg_kmKjls', '0', null, null, '安东 ®', '2', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/I3DOQLyMB0QTc8egce1A7y1d0KvdzqkKONrsGMbm7yloWlQzrJicvBjhxxpk1v6r6ltfTnmqMq8wKUMJmkkwMZS1BPwWicsu2A/0', '0', null, null, null, null, '1486963418', '1');
INSERT INTO `bingo_user_list` VALUES ('68', '0', '0', 'oSlXkvvOwE6FaKmHP2PtAdafqzCQ', '0', null, null, 'A—360搜索李玲☏18039215371', '2', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/e4AHVDBKM2K6CznHVcEP4P1DJaXCRqrpXZxlKp7QzskzDJYXK5ibC7wZXBfC57DHK51qVGeEkaIjXibJSeEn9yW9LQicJuYkJkR/0', '0', null, null, '34.808517', '113.569893', '1486964828', '1');
INSERT INTO `bingo_user_list` VALUES ('69', '0', '0', 'oSlXkvmYeForQ11ECVHsGTOIohes', '0', null, null, '迷你虎头', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/VHU8bI7BOJCqaV3r6ysdFyEl9BoT5BXkCrPmSVKriand7sx22VvtF2ErXdzvdBN2vQtra0RSBS9OnsvNuFaswkP5Hic9tAPluE/0', '0', null, null, null, null, '1486966185', '1');
INSERT INTO `bingo_user_list` VALUES ('70', '0', '0', 'oSlXkvgbrNvVm32LhUabkjql3hN4', '0', null, null, '搜狗&神马广告策划崔志鸿', '1', 'zh_CN', '商丘', '河南', '中国', 'http://wx.qlogo.cn/mmopen/VHU8bI7BOJCqaV3r6ysdF3z9onu1EVup7kvOBrVVLqpckbh5yyVXaFbyPnYMSxL6MCtfvc6NMztogBsLUwITrKNPCYwyKJle/0', '0', null, null, null, null, '1486966634', '1');
INSERT INTO `bingo_user_list` VALUES ('71', '0', '0', 'oSlXkvqjvZ3XlwMXaLhNFNjxBJA0', '0', null, null, 'Leaf', '2', 'zh_CN', '', '河南', '中国', 'http://wx.qlogo.cn/mmopen/I3DOQLyMB0QG1JXjqn1q8DRIbMTNiaQu4Ov3R3P3ribNjx70txFH1Egsa3XyWtUgiazYwjWicB0QXtyvH57rCcY7ErRdSI1F4ciax/0', '0', null, null, '34.790901', '113.535751', '1486967167', '1');
INSERT INTO `bingo_user_list` VALUES ('72', '0', '0', 'oSlXkvkUGsvzTCJ38jrNFXh2C49c', '0', null, null, '☞360搜索♡李玲娟', '2', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/e4AHVDBKM2JOhHD9B44B3oFN1iaw9CHJwPYdfXL3ZCCxx7VeAhyZqjU0IYibenC9dpgZciaM539nhHpwnJp8D3BPXxQeSzOaL8c/0', '0', null, null, null, null, '1486967285', '1');
INSERT INTO `bingo_user_list` VALUES ('73', '0', '0', 'oSlXkvqhUhu8-Yizw3DEkymPSCrg', '0', null, null, '帥~嘚~卟~茗~显', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/I3DOQLyMB0QG1JXjqn1q8Gicicz1Fh6bqB4picr9mjNXUmBnG1z4CsS4XEtkMSboic6NdOia0GXGEV9scr0dVrm30NcvDO8jgbJb2/0', '0', null, null, '34.807800', '113.570778', '1486970327', '1');
INSERT INTO `bingo_user_list` VALUES ('74', '0', '0', 'oSlXkvplBCRp7WbDF-gg0KfD3p54', '0', null, null, 'A00-360搜索引擎网络推广_皇甫春秋', '2', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDNAT9CxrgkT8CFXJDl3CbXfPTc6p99EZtMfnh2gUuicVNHLs8AeYULr2ibZYGgfibD2zzgv9TvRLAzw/0', '0', null, null, null, null, '1486973470', '1');
INSERT INTO `bingo_user_list` VALUES ('75', '0', '0', 'oSlXkvu-UivfGRZf7xSdW23KYgfE', '0', null, null, 'A00       360搜索张海山', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/e4AHVDBKM2KFtcwicMTRicFhpG2EhyWeeJwDeJ3PLhfFrVhoE05pe8jYaXjF3ia5fseo5cU8Tia7cBbkErtdCkcTN22L2FiaYrjCV/0', '0', null, null, '34.808037', '113.570450', '1486977972', '1');
INSERT INTO `bingo_user_list` VALUES ('76', '0', '0', 'oSlXkvhA35KdULTZU6dXQ-ug1c64', '0', null, null, 'A0       .我们的天空', '1', 'zh_CN', '', '', '日本', 'http://wx.qlogo.cn/mmopen/MZbnegfbjxQg8UIVbRcoA0Gyq5GUrhtalsBWpoAl4eLStuKGYMh2HQ8LJIsxYyg77micPh0LCe5Qz8eMgfhzEoY4jEUtBCsFa/0', '0', null, null, '34.807491', '113.569260', '1486986359', '1');
INSERT INTO `bingo_user_list` VALUES ('77', '0', '0', 'oSlXkvhM-_o5d4D5fpaRkYh1wbc8', '0', null, null, '百度官网认证  付空胜', '1', 'zh_CN', '', '', '中国', 'http://wx.qlogo.cn/mmopen/I3DOQLyMB0SFOnchrNUqVicvKznx36XpAnOhiahgTibBy5jf6VK4LpmIrn36Fee0wxSkm6rvuTUYJPBz2TQvPrF4A/0', '0', null, null, '34.787762', '113.552277', '1486993366', '1');
INSERT INTO `bingo_user_list` VALUES ('78', '0', '0', 'oSlXkvu18whDNOMg1JhmgGuFmfLE', '0', null, null, '陈浩', '1', 'zh_CN', '朝阳', '北京', '中国', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCU6Lo1NkiaaZG8WAZuvI87HEMXd05p3iaCNib91rsiahOnibiaSwQtLc2l5z0HWQDNhibjyg11d6aUeWs4w/0', '0', null, null, null, null, '1486993717', '1');
INSERT INTO `bingo_user_list` VALUES ('79', '0', '0', 'oSlXkvt0S0MnNUKe1wvrek3N0T4Y', '0', null, null, '百度陈林丹', '2', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDia1TNE6Ybhbbxrl2ZWSHRc8US2ZRQJBQ9IhIGOXT9t7v7GByBjyXQTfickicD540Y81QAYVUukY2vw/0', '0', null, null, null, null, '1486996749', '1');
INSERT INTO `bingo_user_list` VALUES ('80', '0', '0', 'oSlXkvu3WXAAV9fdVcoQq84wp_Rw', '0', null, null, 'SHAWN', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBXOdvJx23HAlKyJtdEArJXySQyEOvHGqLSIyNBZbbM4DpowJP3ysIEpOicjl45HzKlk14GgSmVJOw/0', '0', null, null, null, null, '1486999742', '1');
INSERT INTO `bingo_user_list` VALUES ('81', '0', '0', 'oSlXkvgwIHnWAtMvMITfkpfxlobA', '0', null, null, '木子', '1', 'zh_CN', '朝阳', '北京', '中国', 'http://wx.qlogo.cn/mmopen/VHU8bI7BOJAOthM5EAibUZhQkbic56kLAgFKqL2CfIjDNdNR1TicLbEFDhv4dKc511qastJe8yueBEwp4KbdicLIibg/0', '0', null, null, null, null, '1487031879', '1');
INSERT INTO `bingo_user_list` VALUES ('82', '0', '0', 'oSlXkvjBCLKmIaWIfbQBYfEb4DzM', '0', null, null, 'Brad', '1', 'zh_CN', '', '', '中国', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM64f9XvMvFsoPJq0YiaMHqMSQhf6ciatXHgSoEX0R15iaMygsSTRbeLlicib9gj5DfHBCwVSU7ebbNVY2w/0', '0', null, null, null, null, '1487033603', '1');
INSERT INTO `bingo_user_list` VALUES ('83', '0', '0', 'oSlXkvry444zfP66c-Qu1UGBjCrE', '0', null, null, 'ZZ茜', '2', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/CFOrUQTPznwvIME0kTmKD9mNkJf1KswAPpiarOvGbaeZJyoGJ1Yz0JPrXKvKBekibkGfsZxdjzj9SgEtYEWvfgUgQtUkAOP36U/0', '0', null, null, null, null, '1487040642', '1');
INSERT INTO `bingo_user_list` VALUES ('84', '0', '0', 'oSlXkvgRjxU7YqMy7iBGFTeCYMx4', '0', null, null, '泡泡', '2', 'zh_CN', '', '', '中国', 'http://wx.qlogo.cn/mmopen/VHU8bI7BOJCcFfuqgpcbsoFicO6neNF1dYFfNICWU3HfFhZAXahR7RdcI0YMVvF6NI0EPtgVc5bxg3IeLyu5RMg8NktoU2MUf/0', '0', null, null, '34.776936', '113.666565', '1487043136', '1');
INSERT INTO `bingo_user_list` VALUES ('85', '0', '0', 'oSlXkvljml7VpNsLKhUdBlLpcQ9o', '0', null, null, '如墨', '2', 'zh_CN', '', '', '中国', 'http://wx.qlogo.cn/mmopen/MZbnegfbjxRsjvReOIwvjtXnE3u8F2Iib8RQgUoAyiaqlib6gdooib1icYPKJtk98KtD0zI9sHcryQTjEsFRibKomCJX0f5eicGwajc/0', '0', null, null, '34.808064', '113.810654', '1487044837', '1');
INSERT INTO `bingo_user_list` VALUES ('86', '0', '0', 'oSlXkvv8tqzPIltDow7R_wsL3O6g', '0', null, null, 'fang', '2', 'zh_CN', '', '', '中国', 'http://wx.qlogo.cn/mmopen/I3DOQLyMB0QU03JNcHBgY6AMMsvUACBQfLtRoDwC4ke6JeUMTQkibzg6GlynT4ibphwibaZCnuAubdb5Wg8VpibUGA/0', '0', null, null, null, null, '1487045058', '1');
INSERT INTO `bingo_user_list` VALUES ('87', '0', '0', 'oSlXkvp8WJ8flPzuGz2Ra4DNf3S0', '0', null, null, '', '2', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM60rvlZic3MQYeicdOl0cuR60dBUYExsQFfNI3FSvZpIqiatCE21lOrkB93SN75WEPDS3V9hEMUSwAEQ/0', '0', null, null, '34.807789', '113.570641', '1487046669', '1');
INSERT INTO `bingo_user_list` VALUES ('88', '0', '0', 'oSlXkvpfWw0m153BwI0ECrk1GGQA', '0', null, null, 's～caicai', '2', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBFKSxcNtYJjoIIqjsr3ILSIpCyqkKBSPXpwMCKsjdicf5FUxQYwgMz6jyRicWteXFNxb75VaiaWegKA/0', '0', null, null, null, null, '1487047891', '1');
INSERT INTO `bingo_user_list` VALUES ('89', '0', '0', 'oSlXkvuMj5dipAJQTtiIO-d4s3OE', '0', null, null, '小呆呆', '2', 'zh_CN', '漯河', '河南', '中国', 'http://wx.qlogo.cn/mmopen/MZbnegfbjxSoatZz7VWznn3cDwiazz3zlZtRH4epTO2Nx2WSv1SicffzrIM3DHJAu2CAJzzmysnL2oMSXVk8qhAibOickg7B6ubB/0', '0', null, null, '34.807076', '113.569252', '1487048146', '1');
INSERT INTO `bingo_user_list` VALUES ('90', '0', '0', 'oSlXkvkLWuaR328qO06wxqfbqr1E', '0', null, null, '', '2', 'zh_CN', '', '', '中国', 'http://wx.qlogo.cn/mmopen/LjfPIdu1jLEckxwKObKbtichAmOtVHia1ksNZ2cvBHI1rxvTNO3gGWeyuHSZmGLbibUElDibrwsiayvALNpI8L9mes2xb4ZZTK39R/0', '0', null, null, '34.805710', '113.574532', '1487048148', '1');
INSERT INTO `bingo_user_list` VALUES ('91', '0', '0', 'oSlXkvptr-TV8kT4d1_04z0I83XI', '0', null, null, '乔说说', '2', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/e4AHVDBKM2JOhHD9B44B3uCo9fH4CvvhBhmMG8k3nUiaibQMmQOYpgE8WM2dWLC5evf6ibnE4q3aJfX9ibrPwct1icXAicicr9nfa5ic/0', '0', null, null, '34.808727', '113.568596', '1487048149', '1');
INSERT INTO `bingo_user_list` VALUES ('92', '0', '0', 'oSlXkvswP6R1QUHXdtJ5IdcMEq9M', '0', null, null, 'ヾ阿喵', '2', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/VHU8bI7BOJC7zpDC7gyIJSRl4EkQjRbicVusEyiapuLIrPdrBxOoQ5hDDeJibVVwGYYufNpNbdhd4zvx8qopnve7Q/0', '0', null, null, null, null, '1487048248', '1');
INSERT INTO `bingo_user_list` VALUES ('93', '0', '0', 'oSlXkvkFvb9t_zz_hvxXs7pXNWGY', '0', null, null, '哭泣的百合花', '2', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/e4AHVDBKM2JOhHD9B44B3q9HXQQLD3btrycmxfLsBV1CTHIxB4lBcgzDtAgP1genXQJjwV9MJJ2mRLiaj7OSrVgqkrATBZf4l/0', '0', null, null, '34.808064', '113.571281', '1487048249', '1');
INSERT INTO `bingo_user_list` VALUES ('94', '0', '0', 'oSlXkvrNZvpneEfJDgUN6zzVz_RI', '0', null, null, '慢享-孙连峰', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/I3DOQLyMB0QG1JXjqn1q8Mgktazqq6iagcGjGibYaQDRZHj4JTCnKdYIMHHXQUMiaqD9TE2UicULk14Lde166YBarRlIPpDNKrIl/0', '0', null, null, '34.807552', '113.570618', '1487048249', '1');
INSERT INTO `bingo_user_list` VALUES ('95', '0', '0', 'oSlXkvk3_j5zuHym3XZPNpn6Pf6w', '0', null, null, 'ASA', '2', 'zh_CN', '', '', '中国', 'http://wx.qlogo.cn/mmopen/e4AHVDBKM2IkhbShqeg0Zhwn7cHPfqEVqGgEsrWiaNQ7esyDT56WBxHxGhOctMZUepUSCzX3SScooA1ica6nccdocbM4juHXuib/0', '0', null, null, null, null, '1487048265', '1');
INSERT INTO `bingo_user_list` VALUES ('96', '0', '0', 'oSlXkvotjwIFCtT2t-6OwNNuUppY', '0', null, null, '笑菁', '2', 'zh_CN', '深圳', '广东', '中国', 'http://wx.qlogo.cn/mmopen/fh64icw7LOGOo78Vp8bybDVkbTjnsndK7Dutzlj7RibvgQQPtE0k0te6PUjLplewaseTxDr3eNLzBIInHAxhOn9TcuDZiaJv5Pl/0', '0', null, null, '34.807198', '113.542282', '1487048341', '1');
INSERT INTO `bingo_user_list` VALUES ('97', '0', '0', 'oSlXkvrkJV-nIUMfgdtQJqSdXhTY', '0', null, null, '赵炜韬', '1', 'zh_CN', '东城', '北京', '中国', 'http://wx.qlogo.cn/mmopen/MZbnegfbjxSyRj3ibM83Ez28Ve0L55sE5hRickEjWA8Umlatic2UwquzbMPpAHMEYB75czJBhDJZQTgySGC9ibsIaicgaZp7XI2tj/0', '0', null, null, null, null, '1487048375', '1');
INSERT INTO `bingo_user_list` VALUES ('98', '0', '0', 'oSlXkvgdxxpkbr4XCplfRlfdVIP0', '0', null, null, '123', '2', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/e4AHVDBKM2JOhHD9B44B3o8TibLCS64FibjVxl871NRlULfzFG8lLY1EpWZWEF8quiac1HEwAPJiaBaIDSLmAYuFfPofibuHGATlX/0', '0', null, null, null, null, '1487048412', '1');
INSERT INTO `bingo_user_list` VALUES ('99', '0', '0', 'oSlXkvrgBr2xQxQRA8ZM-rZsJ_Zs', '0', null, null, '良', '2', 'zh_CN', '朝阳', '北京', '中国', '', '0', null, null, '34.808418', '113.570778', '1487048968', '1');
INSERT INTO `bingo_user_list` VALUES ('100', '0', '0', 'oSlXkvsZxcxgkYGaJppJeWca335o', '0', null, null, '等风来~', '2', 'zh_CN', '大连', '辽宁', '中国', 'http://wx.qlogo.cn/mmopen/LjfPIdu1jLGoqIMH7bo5TEP17pf7pUTCFBBq9Q44TY0CaT41T82iadKe4CFibDsOf6icTLt43YGOibtibt8aclfz8kpfYUaE5XiaHC/0', '0', null, null, null, null, '1487049245', '1');
INSERT INTO `bingo_user_list` VALUES ('101', '0', '0', 'oSlXkvtUW_bxu4moCFek1kNKK954', '0', null, null, '美.沙龙欧森.15238698780', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/LjfPIdu1jLGoqIMH7bo5TEk0cjIOpBK6dJ13txttW2uNMeMQLC9DOODqAxvTVmkl8AVGsfRhRYZvFkIiaLXxgU7tzhtw8wbibl/0', '0', null, null, null, null, '1487049354', '1');
INSERT INTO `bingo_user_list` VALUES ('102', '0', '0', 'oSlXkvg3kTixIlDw7e8tGC9gqsNA', '0', null, null, '生命练习生', '1', 'zh_CN', '安阳', '河南', '中国', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5Pk1yuHXZ3ugcp8Ifr1BZ3YYJLsVRGricTrUiayJEQ3RicLlSYicJk7F6nCH2NbDFCRolHVPU6du6rKA/0', '0', null, null, '38.912926', '0.000000', '1487049534', '1');
INSERT INTO `bingo_user_list` VALUES ('103', '0', '0', 'oSlXkvvKvkGL45mvHXU-0hJ4ziTo', '0', null, null, 'ameng', '2', 'zh_CN', '', '', '', 'http://wx.qlogo.cn/mmopen/I3DOQLyMB0QG1JXjqn1q8BpmnxrLFMaibsibibicCletxCyB2UQuwSVc9o9ibxYOdKYCXNiab7c3N5ibtYeWPMmTicZpLu2s9JaU4fgW/0', '0', null, null, null, null, '1487049806', '1');
INSERT INTO `bingo_user_list` VALUES ('104', '0', '0', 'oSlXkvoDCjEOPRKOdKP3eejTYn2o', '0', null, null, 'A百度小范', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/e4AHVDBKM2JOhHD9B44B3vib0maysofO0elEGo5KmOfsQT4YhP0BgnKB6j8fhUs0KBicuVydabvUeKicUrDcw1zC9G4HAIRib9O1/0', '0', null, null, null, null, '1487053277', '1');
INSERT INTO `bingo_user_list` VALUES ('105', '0', '0', 'oSlXkvmbF7-h94B6jhY7Bn9zc2rg', '0', null, null, '时光十年。િ', '1', 'zh_CN', '', '', '中国', 'http://wx.qlogo.cn/mmopen/I3DOQLyMB0QG1JXjqn1q8NNOErHysegOGiaVhg7qnsCmJe812R05ghE59WqLPQ59CbeMcTSHksibKLfXnMuUhtKHnGHy7Ipfn7/0', '0', null, null, '34.808304', '113.568779', '1487053418', '1');
INSERT INTO `bingo_user_list` VALUES ('106', '0', '0', 'oSlXkvsJiGPBAsynr9XTRHpGLJx4', '0', null, null, '东熙宝贝', '2', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/MZbnegfbjxSyRj3ibM83Ez7HUrdic7Iic1bicJtTooYRzkLA8Kia9RaVCLVIqibXtc1IrkI5vYOiaKDhkcWiaDZZIImDhhKy6Cygibfn0/0', '0', null, null, null, null, '1487053536', '1');
INSERT INTO `bingo_user_list` VALUES ('107', '0', '0', 'oSlXkvp9RLk_5ZrJqNnWgs0g6PlM', '0', '杨亚辉', '18695895858', '杨亚辉', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBDfcNpVUhQ2wEcyoT1PNR4venW5WNaCAJFNiaIrrBvPFGhPVcRnYbVBEqoHEVOickTqhrrfI4X9fibQ/0', '0', null, null, null, null, '1487053757', '1');
INSERT INTO `bingo_user_list` VALUES ('108', '40', '0', 'oSlXkvmBTSTLooCtOjzjleb9yqiA', '0', null, null, '记忆中的悠悠', '2', 'zh_CN', '', '', '中国', 'http://wx.qlogo.cn/mmopen/MZbnegfbjxRwPhGmuon08YgcYHCSL1NbqXjDTD3gfeGeicG1EasF0YicibWmvBYrI5EFia7XickpBMZw3zhhYN1rSwUj29EQa7O91/0', '1', '1487055311', '', '22.817448', '108.321892', '1487055311', '1');
INSERT INTO `bingo_user_list` VALUES ('109', '0', '0', 'oSlXkviTqHJDgZIPOQebH4tcOaz4', '0', null, null, 'Angel', '2', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/MZbnegfbjxSyRj3ibM83Ez6YPaNSIibnBtxEt37c0vwMZ4vQ5lvtDdI0NxQcTWSnKBOkuiaprsia0XlTurJdPlerdwDhnicpqO3Sh/0', '0', null, null, null, null, '1487055978', '1');
INSERT INTO `bingo_user_list` VALUES ('110', '0', '0', 'oSlXkvtuH4jvBOZR_0TLZS7W-a5c', '0', null, null, '王红阳', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLAQwfK25sh1lcWbSvos97Xx7KeMwWGv1Ehp70XhurvBO5w5ohOEcUIuPs9spNb911Tejvic1sVZBMA/0', '0', null, null, null, null, '1487059291', '1');
INSERT INTO `bingo_user_list` VALUES ('111', '0', '0', 'oSlXkvrf8xYdnvhRFsS_NT1p_ZJw', '0', null, null, '淼淼', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/I3DOQLyMB0Sm2mOd2rINE1MMtPC6bd0La5Jp69Hma1eu9LxcuZ9RwiaBY9AL7EZ5wXGkv6QHa0SgWYicjuMrTEAQ/0', '0', null, null, '34.807442', '113.569405', '1487059641', '1');
INSERT INTO `bingo_user_list` VALUES ('112', '0', '0', 'oSlXkviLNHu5iBNQOPlD1wXUA7HI', '0', null, null, '辉子', '2', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/MZbnegfbjxSyRj3ibM83Ez1WRZOMuL2RpyOPPicpBsndthYIaMjXOdXkNvkNopjVQylIoq2Nm85ZRp4O3uKVYXNdQ06n3RsnhZ/0', '0', null, null, '34.808872', '113.576492', '1487059794', '1');
INSERT INTO `bingo_user_list` VALUES ('113', '0', '0', 'oSlXkvkr6n1rxsoLBS52V5LcH7Fw', '0', null, null, '李冰', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/I3DOQLyMB0QG1JXjqn1q8CDuekfhU0bZ7o2kia9X3tbQAFiaTaYdmlnriaUJhL0JDG8PaP9K3PHqiatJxS33DicC6rVtmdD039Q33/0', '0', null, null, null, null, '1487060920', '1');
INSERT INTO `bingo_user_list` VALUES ('114', '0', '0', 'oSlXkvgFpZN69pAP16O34qTUeyaw', '0', null, null, 'amen', '1', 'zh_CN', '平顶山', '河南', '中国', 'http://wx.qlogo.cn/mmopen/VHU8bI7BOJCicianibj5bQITJOwCz3FEDm0iaMDfRCSHDvBuh5kpu1iaog4ulWickzF2WJWnib8rvribTM43vIbMdfjmlg/0', '0', null, null, '34.764465', '113.598846', '1487069093', '1');
INSERT INTO `bingo_user_list` VALUES ('115', '0', '0', 'oSlXkvni0qCn-FD7195epB0iD8Gw', '0', null, null, '柠檬的味道', '2', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/I3DOQLyMB0QG1JXjqn1q8PyKR1gsLSjz1cP4gCOvPQMDj4CNicp9yZgk5cDPMuccPNQqjslSjumhjEib8fibeRdRNgwe0MZdpEM/0', '0', null, null, null, null, '1487069582', '1');
INSERT INTO `bingo_user_list` VALUES ('116', '0', '0', 'oSlXkvhcmMebonL_tzplsGDmQ22E', '0', null, null, '孙庆辉', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/I3DOQLyMB0QG1JXjqn1q8I0SKXRA8EPSYJR9b8ZOVdQvueTcf9eypSofoYXKbnb5NKr8jCIeyqMpYwWhVwKB5wDAEsvaic17ia/0', '0', null, null, '34.808338', '113.569817', '1487073990', '1');
INSERT INTO `bingo_user_list` VALUES ('117', '0', '0', 'oSlXkvjfiP4HnXZtxD34j_xjyUHI', '0', null, null, '未央丶月凉', '2', 'zh_CN', '朝阳', '北京', '中国', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKhtnkfGjD9t5jQxZFbNbZl3NAqz5xFYj8FNaibPGhicKLD5icIFCOiaGSMSRicb3KoEG2WXpxIHXHdEHQ/0', '0', null, null, '34.807652', '113.568748', '1487074178', '1');
INSERT INTO `bingo_user_list` VALUES ('118', '0', '0', 'oSlXkvlYwx0qr1K1PbltNevxspcE', '0', null, null, '莫非', '1', 'zh_CN', '焦作', '河南', '中国', 'http://wx.qlogo.cn/mmopen/VHU8bI7BOJCv6skFnibCicjUtUa0ic6bBBA1GFvsjZUCnL9wfekoAQcVPcasOAlotafFicsmMQ4z6EicgaI8mpW4icglzGIickKuA6h/0', '0', null, null, '34.808792', '113.569756', '1487074181', '1');
INSERT INTO `bingo_user_list` VALUES ('119', '0', '0', 'oSlXkvjzCI9zo_5llSPY7Xamgaoo', '0', null, null, '尼古拉斯.小明', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/VHU8bI7BOJAhd4YohibO9JfrVCUuXsZKaUqTKxLnZLQeG5C0zSiaYiaJ9HbbdhkQobbYibcPFWWzc2zYacdEIzoGmg/0', '0', null, null, '34.807896', '113.568848', '1487119996', '1');
INSERT INTO `bingo_user_list` VALUES ('120', '0', '0', 'oSlXkvlIbn9Z-rGyXZNm1opTl06g', '0', null, null, '歌迷', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/MZbnegfbjxQcZ2Mguib5kGWN5QZgkiao9HicNaVyt8bZ6lE5NRMMdqzIwecm6sia5Wrib3bthm9kjoYw4K6oUPUkCAI3OdlHo3HgL/0', '0', null, null, null, null, '1487123138', '1');
INSERT INTO `bingo_user_list` VALUES ('121', '0', '0', 'oSlXkvrIGEqqhkuWplhxFA9An-XA', '0', 'Paul Pfister', '18638635751', 'Paul Pfister ', '1', 'en', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/POvu7F8YUYKIZf75NiaLUBxib8dyuic4P7caXv0w5J44MP47ibqAlecoN0ro4Lp7RetUXD4hIJslpJGTfcdIycJFJptTc57Dbsp6/0', '0', null, null, '34.748825', '113.578171', '1487124982', '1');
INSERT INTO `bingo_user_list` VALUES ('122', '0', '0', 'oSlXkvmUAsSUG5FiALvYMsV5sP4E', '0', null, null, 'Dmitry', '1', 'en', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/I3DOQLyMB0ShTp9B1ticxriaUicX4bEhJC2wgxYhZXLDN39YAMibKGz5ha6VpuUcT5FWVGmPGvV5pxHd8OBpR59XwwrY29I8pnwO/0', '0', null, null, null, null, '1487125423', '1');
INSERT INTO `bingo_user_list` VALUES ('123', '0', '0', 'oSlXkvoTa68QZTeGVvdNZCSa4DE4', '0', null, null, '赵东明 Đông Minh', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/e4AHVDBKM2LMILaib6ETZe5I7cWuuGS2xrT5mpmr1dNJGoLdTB4G9sMhpAcRYC6VQMT3aOicHvUyItpH1ETzOUXibs69KMPcTB6/0', '0', null, null, '34.808769', '113.567604', '1487125724', '1');
INSERT INTO `bingo_user_list` VALUES ('124', '0', '0', 'oSlXkvgZ7BExpTdgZlsLEw2gXLN4', '0', '裴兴社', '15937178609', '老裴', '1', 'zh_CN', '', '河南', '中国', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDAqHvwyXibYXgKsTu1XTjCsNwNKjMTwlAGS5ep0hrqnXEkEEc9GJsJvcKAVua4aeT7kw0zXiaGOMFw/0', '0', null, null, '34.750755', '113.720390', '1487126433', '1');
INSERT INTO `bingo_user_list` VALUES ('125', '0', '0', 'oSlXkvoVyTwFpavkGki7_rSUxZU8', '0', null, null, '贝贝', '2', 'zh_CN', '', '', '中国', 'http://wx.qlogo.cn/mmopen/I3DOQLyMB0RJZzdQsB4sOoibOyh8ygPQbBW2WbgJpkmHABeWYfxicU29o4rpFf1anuL9Vxhbibll6S8icziczER3ZNxrUyIGYswa6/0', '0', null, null, '34.807465', '113.570053', '1487131315', '1');
INSERT INTO `bingo_user_list` VALUES ('126', '0', '0', 'oSlXkvtoMpaz2JjkfHsFqYVR11d8', '0', null, null, '任妮娃', '2', 'zh_CN', '', '', '中国', 'http://wx.qlogo.cn/mmopen/I3DOQLyMB0QG1JXjqn1q8DBHoEGZ8tYKmEEmusVaVDFMX8zia8p8sBtQYvoX5fnPpswBaYRl2lTZdeJVxgS6ykXJzkicEGV25v/0', '0', null, null, null, null, '1487131567', '1');
INSERT INTO `bingo_user_list` VALUES ('127', '0', '0', 'oSlXkviAmXEJ5jXdCVnkkL4ThEyE', '0', null, null, '沈若无', '1', 'zh_CN', '杭州', '浙江', '中国', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBicl15suIhkkQhdcFiaqJA76Fmu92E1POHQ9g0picic4Cx6gbCNZj9Echft2BWSbs8TzHY0eypDzGhYA/0', '0', null, null, '34.808826', '113.569885', '1487134259', '1');
INSERT INTO `bingo_user_list` VALUES ('128', '0', '0', 'oSlXkviDCmMr3uD962LLHf4FIKb8', '0', null, null, '刘佳', '2', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/VHU8bI7BOJDFE6fkNqrw1LNC9kp1X96uPdH7ibhpZtkpxMpltmMgZJlIPXoHqxAzRczbZ1dGezXN4qnlS4tLia1w/0', '0', null, null, null, null, '1487134458', '1');
INSERT INTO `bingo_user_list` VALUES ('129', '0', '0', 'oSlXkvggiDHP0v5EItkzUxhA5z5g', '0', null, null, '马坤', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/MZbnegfbjxSyRj3ibM83Ez3ELcKXvg4gR44aiahwRNLic1tLRM0IvKbZhnFcycQRxeC3xUbIGz9H2bl1AeKIiaBmHNQiaOgDyiaBqE/0', '0', null, null, null, null, '1487135370', '1');
INSERT INTO `bingo_user_list` VALUES ('130', '0', '0', 'oSlXkvmNRE2sqM6bKWWFycX6P6n0', '0', null, null, 'walterincn', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/MZbnegfbjxRwPhGmuon08bW0UbO41BicIfWdSrMbqD2kKMxWumPZiaoD8ILibXYqLnw6eTfvD38HQ5741Z1gEnaOC08z1ncn8xC/0', '0', null, null, '34.808811', '113.570580', '1487138871', '1');
INSERT INTO `bingo_user_list` VALUES ('131', '0', '0', 'oSlXkvlcMK73oVkggTZU4N-9GGpc', '0', null, null, '侯沛东', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLD5vBsgLBeRMBwJy41LKwUGf3vWiaibBenfYtIkIrz3JTDo6icsQmedpp1tb7E2GB5tMOyVu2FxaxZbw/0', '0', null, null, '34.808102', '113.570641', '1487141382', '1');
INSERT INTO `bingo_user_list` VALUES ('132', '0', '0', 'oSlXkvj9UUyo848OU_s_oK44k3e0', '0', null, null, 'champion', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/I3DOQLyMB0QG1JXjqn1q8DtpvQRZS4EfJbBRZ6Io4aiast0g4mtYaX5wsVnGnzPC1m8YL9TaIOVJNy8iaV4AeMc6JFLnSHG6IB/0', '0', null, null, null, null, '1487142517', '1');
INSERT INTO `bingo_user_list` VALUES ('133', '0', '0', 'oSlXkvh-W1lPDamhA5QGBJOZ7h_g', '0', null, null, '我就是我', '0', 'zh_CN', '', '', '中国', 'http://wx.qlogo.cn/mmopen/VHU8bI7BOJCqaV3r6ysdFic5CPWA9xLRgtTalRVgGqxtNZwdyqlD04hicht3Ta7Cicl3picAo1ZG8jfU4sZwM7iafzq7ibuZtDqjZu/0', '0', null, null, null, null, '1487143070', '1');
INSERT INTO `bingo_user_list` VALUES ('134', '0', '0', 'oSlXkvv1Gw4xQkCEKoMGTnxNtN4A', '0', null, null, 'superzz', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLAulEd7tz0fgGsiaKia9dZkbfe5HGxY9GIhbZXne6nWeY0beVRnRP0uDh0tJs3xTUl0vUySMQ7MdicMA/0', '0', null, null, '34.807831', '113.568779', '1487151791', '1');
INSERT INTO `bingo_user_list` VALUES ('135', '0', '0', 'oSlXkvgZroAX_Mgwn6wvijQGBi-w', '0', null, null, '格诚设计策划小朱', '0', 'zh_CN', '', '', '中国', 'http://wx.qlogo.cn/mmopen/VHU8bI7BOJAXMJQnOHs509LjytibjwsEib2eIZ9DE3uDVLnibwBI4OdukGw37uvJTPwRSvicSMC2v0iaGpEAKbIEmnQ/0', '0', null, null, '34.808094', '113.569092', '1487152766', '1');
INSERT INTO `bingo_user_list` VALUES ('136', '0', '0', 'oSlXkvu7ao2ntsT4ShhkQ1qkgBZU', '0', null, null, '.', '2', 'zh_CN', '', '', '中国', 'http://wx.qlogo.cn/mmopen/e4AHVDBKM2JOhHD9B44B3gN4uW27R0xN6C8S0tpc81v7egmsUzxGIcseU9EpM7gpvs2PGS2rMkgFsmxSWS1oYPNibvicIPujqZ/0', '0', null, null, null, null, '1487152866', '1');
INSERT INTO `bingo_user_list` VALUES ('137', '0', '0', 'oSlXkvkfWOXkW3SUZXl-mrSWgT8Y', '0', null, null, '  MiKu', '2', 'zh_CN', '南阳', '河南', '中国', 'http://wx.qlogo.cn/mmopen/MZbnegfbjxSyRj3ibM83Ez3iakvZT6ME5wPTibRia74K0RagaJqSmViatuoABbM6NSP5qJia0tOxDwwTDbteHXib6yIwoGPHwRiaaovg/0', '0', null, null, null, null, '1487155477', '1');
INSERT INTO `bingo_user_list` VALUES ('138', '0', '0', 'oSlXkvsE_8y-oF7le3n6qQcLOhcs', '0', null, null, 'ZD_0216', '1', 'zh_CN', '洛阳', '河南', '中国', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM7YgFd8PzoKmMFm7Fv3Q3eU7YQ36TkLbtiaNLSs74nSEhSXFWibKBHbpAib0XDNUjdc57F3nKlT42PXg/0', '0', null, null, null, null, '1487159842', '1');
INSERT INTO `bingo_user_list` VALUES ('139', '0', '0', 'oSlXkvgKKUgADKRBuca9sx-4_Ub0', '0', null, null, '萍缘诺顿', '1', 'zh_CN', '许昌', '河南', '中国', 'http://wx.qlogo.cn/mmopen/e4AHVDBKM2JOhHD9B44B3o4GzR7SG4hYwb8LotNibNYsjWPnicBjZ4UaiaCRT3j7etibgbP8mUoaMQdXOr7Jey2M04VjyQ6dty8e/0', '0', null, null, null, null, '1487163667', '1');
INSERT INTO `bingo_user_list` VALUES ('140', '0', '0', 'oSlXkvgRMyUdjegrA1GFD2g9ZFR8', '0', null, null, '王成', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/MZbnegfbjxSyRj3ibM83Ez86gpVF7iaGd97IuIMhpzPVqibianJ0bLdD9Aic5qcTf9exLZX3iaeA9pgbFMQwrGj579NsmByzaibncSn/0', '0', null, null, '34.834099', '113.624062', '1487205418', '1');
INSERT INTO `bingo_user_list` VALUES ('141', '0', '0', 'oSlXkvpGw9kdr-b3BruNenfjEeVA', '0', null, null, '蓝域创想', '1', 'zh_CN', '深圳', '广东', '中国', 'http://wx.qlogo.cn/mmopen/e4AHVDBKM2LBd1y1EwMVkfXoHLWt2c1SuLDDicWcSP5B9HcibrMiaCe8AkQVzcYpo7PjMdk0XwxgmgzxByHAWzOqu9aeicaWps4I/0', '0', null, null, null, null, '1487205580', '1');
INSERT INTO `bingo_user_list` VALUES ('142', '0', '0', 'oSlXkvqrpnyovqad9fNNr3jrii9U', '0', null, null, '莫语', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/e4AHVDBKM2LmI5GmxCjv8NrBuEvf15sIzj3CkW1W90Fw3zXRHnpT6s1oeViaqkvb7aIwicPEIIb5xaQqVaN741RvlFSV7qSeo3/0', '0', null, null, '34.807476', '113.570038', '1487208515', '1');
INSERT INTO `bingo_user_list` VALUES ('143', '0', '0', 'oSlXkvsS4jbgcLdAkymYNAtyPdWk', '0', null, null, '刘淑雅', '2', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/LjfPIdu1jLGoqIMH7bo5TIzusqBsVFZN6hgaf6J6msSU4au2Sa6PvlicnsozPGsHmwNRjoLjKHics1Ym7ibumT41VA7HgVT0wiah/0', '0', null, null, '34.808064', '113.568825', '1487211308', '1');
INSERT INTO `bingo_user_list` VALUES ('144', '0', '0', 'oSlXkvibn32kro-INENJ0bZsDdOA', '0', null, null, '句号先生', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIE0fSG61dXjAtgzV3A7lrsVcicMDA22gPBOatM2NHp15ribqPcnsib766BlWj15BfLB04ibtDoJ3DjeQ/0', '0', null, null, null, null, '1487220002', '1');
INSERT INTO `bingo_user_list` VALUES ('145', '0', '0', 'oSlXkvh-_Tfi4AjSuYGsHcAaJFsk', '0', null, null, 'william', '1', 'zh_CN', '长春', '吉林', '中国', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIxvF1ykiaaicalFwsIfQAsCbHAskvicrKMfQ78xdChUWMQ9p1icJDRicvSHaQB2YjkQ1ljrAyaj7R8UcQ/0', '0', null, null, '34.808777', '113.570099', '1487226759', '1');
INSERT INTO `bingo_user_list` VALUES ('146', '0', '0', 'oSlXkvgtPCHPPlPRNhXoR4MgR7GY', '0', null, null, '刘振翔', '1', 'zh_CN', '', '', '中国', 'http://wx.qlogo.cn/mmopen/I3DOQLyMB0QG1JXjqn1q8G2aXOA0L3YNZribrL0pMElqQuX86QhgZvWa7DhseibcJTXicSrhKzwqYc898cUhFbuqU5bbYXRta7D/0', '0', null, null, '34.806164', '113.564186', '1487240189', '1');
INSERT INTO `bingo_user_list` VALUES ('147', '0', '0', 'oSlXkvj9dBA-xT25vxRbHQlYOQaM', '0', null, null, '沉默是金', '1', 'zh_CN', '', '', '', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6JSXv8Z5ag7fj6UsTlGWSDmUAQ9g7bRPXXYTPEiaILRKX7ubPFsaIwE9Jib4EN2pftVAclRnYVcBoQ/0', '0', null, null, null, null, '1487240310', '1');
INSERT INTO `bingo_user_list` VALUES ('148', '110', '0', 'oSlXkvjGIoA2hR-eCzBisZnsP8jM', '0', null, null, '郑州@谢飛', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/VHU8bI7BOJAXJYfrFssNH09aslcFiazloek6NAkLI4sy2WVh9MjMCkfgpDibQ9KTaC3dtmfOaP2bCWwFpYDBnSsAkQg9j9S4x3/0', '1', '1487297745', '', '34.764889', '113.763451', '1487297745', '1');
INSERT INTO `bingo_user_list` VALUES ('149', '0', '0', 'oSlXkvsvlBHa_b-DXktGIhsi28GY', '0', null, null, '阿拉琦', '2', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/e4AHVDBKM2JOhHD9B44B3gvBPhQ3SGow9Ks7jMqOAt9sictFYXFiaUwpuoIKW0H9EjgALVQ91fliaehl1ZHCSTAXAfBH2fENSQR/0', '0', null, null, null, null, '1487298616', '1');
INSERT INTO `bingo_user_list` VALUES ('150', '0', '0', 'oSlXkvvuNSjAk65CZbtbBGZ5Ifx0', '0', null, null, '阿贵', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/VHU8bI7BOJCqaV3r6ysdFzH6m1uIquI2r8Qg5a1Ew9JgdAYcLHAsfB0e4BSU7dktBXUiapRkkP8LhRWudblNqDTnrrhZbQTxz/0', '0', null, null, '34.808857', '113.568939', '1487306182', '1');
INSERT INTO `bingo_user_list` VALUES ('151', '0', '0', 'oSlXkvrXPhME_Ny52jJt1yPr_Oms', '0', null, null, '姬乙亥', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJpzalOmv3omuTx3JGYkC8a2RvKCTtDkiax3VTiavmcTbva5nDe6W2b82xiaOvMrh0ZiagVnNtz3VxvxA/0', '0', null, null, null, null, '1487307244', '1');
INSERT INTO `bingo_user_list` VALUES ('152', '0', '0', 'oSlXkvq5wOqUeWG1vP3KB9msy0C4', '0', null, null, '等等', '0', 'zh_CN', '', '', '中国', 'http://wx.qlogo.cn/mmopen/MZbnegfbjxSwN93xzqRjsOpDdH7XdHfMVZ0Mzx0acyicnmnyOTVxBL0icZocjOF0hnd8lf8udAJ8ImZeyibDJwLamhYXibK8O59s/0', '0', null, null, null, null, '1487307511', '1');
INSERT INTO `bingo_user_list` VALUES ('153', '0', '0', 'oSlXkvt5kHmV8kOhPjBhh__PW5V0', '0', null, null, '薇', '2', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/MZbnegfbjxSyRj3ibM83Ez3LwN8Sd6aCVl8x0JKCYXkvsNOWib8bBGANqLuraqIPdL2xhocbJicQtc580vh3ibUAfDTjGRKnRIak/0', '0', null, null, null, null, '1487307575', '1');
INSERT INTO `bingo_user_list` VALUES ('154', '0', '0', 'oSlXkvvT_3aqEwKNbX68rQaaVn4o', '0', null, null, '睡懒觉不打呼噜', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/I3DOQLyMB0QG1JXjqn1q8I00QbbzjicyeQZtjsLhklOCeqib1V1t8Qib821uzfM4wmpKuGnvtuXlFOYXMHWE1DFD68dfMYPomOQ/0', '0', null, null, '34.808838', '113.569862', '1487313215', '1');
INSERT INTO `bingo_user_list` VALUES ('155', '0', '0', 'oSlXkvjXJ8L2CChf5lw2PUElMgw8', '0', null, null, 'Island', '2', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/e4AHVDBKM2JplQbQESptjibictTywwlj7MIx0G5lQMVO3jtZxTzTHvkRRaR0LqnH4ibnqzmiaRME67Uib4RNxgg7FZdPKyquX8MrF/0', '0', null, null, '34.808773', '113.569839', '1487313344', '1');
INSERT INTO `bingo_user_list` VALUES ('156', '0', '0', 'oSlXkvu9mThhKHjZtqvnzdyB-TSM', '0', null, null, '大猫', '0', 'zh_CN', '', '', '中国', 'http://wx.qlogo.cn/mmopen/MZbnegfbjxT1RKbp1tFJzal4Hunia6sIc2haoKc4NJuNXTNXTX3BpMnKemEAyyRCYHzU4Jrl3ltfpaWzwpyCnuzv19fte0Fsh/0', '0', null, null, '34.808849', '113.569824', '1487313809', '1');
INSERT INTO `bingo_user_list` VALUES ('157', '0', '0', 'oSlXkvjmMKvONOeEXrMeD1zYM9BQ', '0', null, null, '高阳', '2', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/VHU8bI7BOJCqaV3r6ysdFibfHdURJuZ9Y0G9XfjJKfZA0k66kmb3wU10zfAg2oCTcpuMfFibPwOhLJkcH4KeDmXu6vfFBpz7Ag/0', '0', null, null, '34.805813', '113.556969', '1487334831', '1');
INSERT INTO `bingo_user_list` VALUES ('158', '157', '0', 'oSlXkvlk207H-UH5313_JiSvjPpA', '0', null, null, '王钦', '1', 'zh_CN', '', '', '直布罗陀', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCvEL17xic7LqK4WFMXmpWSoOicUDibEEaLicibwLH17Slq1myibiciaicqLqCfpibfwJCpUfiampAolnPYxhffw/0', '1', '1487335065', '', null, null, '1487335065', '1');
INSERT INTO `bingo_user_list` VALUES ('159', '157', '0', 'oSlXkvuCGvHhdPBWytXB9gVw1_bQ', '0', null, null, '人生如一杯酒', '2', 'zh_CN', '', '维多利亚', '加拿大', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJib7snibnGnsTEXoicjMKIF0cMXWV3B1hVNXLhtvTgavrNRwICb0pt8d8GBks9x7lgDLbLmDltE4Oog/0', '1', '1487335297', '', null, null, '1487335297', '1');
INSERT INTO `bingo_user_list` VALUES ('160', '149', '0', 'oSlXkvsK7WAvp2IjmaA1FLJjs2rs', '0', null, null, '我是卧底牛奶Sir', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/e4AHVDBKM2JOhHD9B44B3mKlOhuNnhy5kxBo6p1iaYqOD0nv03kXicaKykR6FU8yZvETvC7PUIocVN5pict4CM9xOUicRoibs08RQ/0', '1', '1487335684', '', '34.720638', '113.596901', '1487335684', '1');
INSERT INTO `bingo_user_list` VALUES ('161', '149', '0', 'oSlXkvtRHyl9qltXtgvboqBwzmCQ', '0', null, null, ' 阿泽西', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/I3DOQLyMB0QG1JXjqn1q8DssMD7bK3ZkQtDlE1jfPeibbQsWuicPng4BuHv9PIJOtGXnMt4y7QkuSLhywe3CBcibfDos2nZVYa2/0', '1', '1487337358', '', null, null, '1487337359', '1');
INSERT INTO `bingo_user_list` VALUES ('162', '149', '0', 'oSlXkvuPX1VBrbI6Bu90CMgnvRXk', '0', null, null, 'Destiny.', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIDnBiavasvcpUBDclWhLqbYb4BZ1Ss5Q7xDdhyzvHO6DicIicjiaQZVFvXiaibw7y5CnibqsrFMUqAFrjAw/0', '1', '1487339528', '', '34.706474', '113.613960', '1487339528', '1');
INSERT INTO `bingo_user_list` VALUES ('163', '0', '0', 'oSlXkvoO6GYEqbzbaJvIueELQgYU', '0', null, null, 'Anna~月月', '2', 'zh_CN', '许昌', '河南', '中国', 'http://wx.qlogo.cn/mmopen/I3DOQLyMB0QG1JXjqn1q8NJRlH6kz4W4sJVkNdmmWZRlyfJwFoywCWkOxhk777dmicp1DJ8n3krw5qg47ztcp7FaJJcG9d8iaic/0', '0', null, null, '34.807846', '113.569969', '1487341919', '1');
INSERT INTO `bingo_user_list` VALUES ('164', '0', '0', 'oSlXkvrqgCCB1U3sYSVFe1zGPFf8', '0', null, null, '泗姑娘', '2', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/VHU8bI7BOJCqaV3r6ysdF4yJdaOXae5GBbqCiaJWt85WrAzJRJLmQG4Wvw3Cy0hPBosrUNEtnIcaRJwjMT680fppZEulEjSEu/0', '0', null, null, null, null, '1487377055', '1');
INSERT INTO `bingo_user_list` VALUES ('165', '149', '0', 'oSlXkvncyJ_wiCAByK7dVIhMf6dk', '0', null, null, '欢迎', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/I3DOQLyMB0QG1JXjqn1q8BE3PibibzLy4YibGZnW7j1vZovURmDLnEARW8sxXiahcFS52k87ZJicutoUhorZH00V6HrmLicHD449r0/0', '1', '1487379952', '', null, null, '1487379952', '1');
INSERT INTO `bingo_user_list` VALUES ('166', '149', '0', 'oSlXkvrzYbxH0GVQWlFLxm4nAF4M', '0', null, null, '尼采', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/VHU8bI7BOJBSndgwLfMa03e5uHa8MDH8mXdtSnqTAf0iaJveyaCwEIicvCpxaLoHCVibrA5SU6tBKZKW44n7BeZ6Q/0', '1', '1487380003', '', '34.808838', '113.569862', '1487380003', '1');
INSERT INTO `bingo_user_list` VALUES ('167', '0', '0', 'oSlXkvuF4mls1JQdvgdQrIsAsN94', '0', null, null, '莫斯利安', '1', 'zh_CN', '', '', '中国', 'http://wx.qlogo.cn/mmopen/MZbnegfbjxSyRj3ibM83EzwGsrynjqkSXmwPNnOROBbbNSoDtwsdbjLobiccica96nYvGWBOia6BO8cGBePyOj1pbSbvdicIvniaUj/0', '0', null, null, '34.805710', '113.565063', '1487395697', '1');
INSERT INTO `bingo_user_list` VALUES ('168', '0', '0', 'oSlXkvuCw1sFgSCp-3lAnWvz2l0k', '0', null, null, '小程', '1', 'zh_CN', '晋城', '山西', '中国', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5SNwGbmvhwSKCS0BIXtXQSrVS6tbhSJTDXZdLhlc8euSy35vTJibI0hIbVtGSvGl2rLAjgFUxEdibQ/0', '0', null, null, '34.782650', '113.617867', '1487404661', '1');
INSERT INTO `bingo_user_list` VALUES ('169', '0', '0', 'oSlXkvnQW0TarqX-4hApqa9ejEmc', '0', null, null, '黄爱春', '1', 'zh_CN', '广州', '广东', '中国', 'http://wx.qlogo.cn/mmopen/MZbnegfbjxSyRj3ibM83EzyWKTb4iaGnZJU9DROib7nowwV1mamnSIPLGYiceTvtNjVvf0Zb2pW9dcldibIghcANLuKhB1KS2al5C/0', '0', null, null, '34.807423', '113.566299', '1487407215', '1');
INSERT INTO `bingo_user_list` VALUES ('170', '0', '0', 'oSlXkvr4sO0mXazcTxkYbHrv71XA', '0', null, null, '旅行者', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/e4AHVDBKM2JPt2x4Vwrh7Q9Yh88CESWwFwXeu7kTibuTwfKLib4tI6a5icBc2n0UY89TllmktD7meRlSBNTo8hRhClgSsU5pfHZ/0', '0', null, null, '34.808304', '113.569969', '1487409522', '1');
INSERT INTO `bingo_user_list` VALUES ('171', '0', '0', 'oSlXkvmzB3w5qzoNDXmJ4W8dms80', '0', null, null, '豆腐皮', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/I3DOQLyMB0QG1JXjqn1q8CDks4z160pibW40kxryr9k7F5pXzhia6ia3hNTdekoicVacRPxxM892UtqBqwGVsMuZx4WMyNJOAv4v/0', '0', null, null, null, null, '1487413086', '1');
INSERT INTO `bingo_user_list` VALUES ('172', '0', '0', 'oSlXkvqbvxm-ttYhRRl74QOuiCvc', '0', null, null, '科科', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/I3DOQLyMB0QG1JXjqn1q8BicKOqRVbwUml4iaKc11xI6mflL8Ez7KYZTh1ib9lJvC8x8dbw34DZKAFnExMibEfNcAibE5EWlecANp/0', '0', null, null, null, null, '1487414897', '1');
INSERT INTO `bingo_user_list` VALUES ('173', '0', '0', 'oSlXkvrPEL6shEJXySRHa1U89H34', '0', null, null, '岳斌', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/LjfPIdu1jLGoqIMH7bo5TOtaaOp0HaKeIOmLqh1OMj0ZIvRvIfL9icOjCFBY1y2AKF4IBO0kq5gAoic9uQVYqGW6A40EdZCX4o/0', '0', null, null, null, null, '1487417534', '1');
INSERT INTO `bingo_user_list` VALUES ('174', '0', '0', 'oSlXkvhA9ml0ihOO-eMWDAXu9LTA', '0', null, null, '张保富', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIGBx6fHt42r5ibF4BiapsEia3NCKiaATjBhwtiawTBg8PAicaSA7bRGt82FmWxAUSymO55BYjOFXwicyc0A/0', '0', null, null, '34.808174', '113.570969', '1487470600', '1');
INSERT INTO `bingo_user_list` VALUES ('175', '0', '0', 'oSlXkvvgC9w_fKzao7c9yJk7n-gQ', '0', null, null, '蒙版', '1', 'zh_CN', '平顶山', '河南', '中国', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJ9GGVPVw1Ihbn5p7Ojibq8vUvTXtv25ujnjp7AhmJKcWWRuwZRhCdpG25afGMAonuCUrP6TQbeuBw/0', '0', null, null, null, null, '1487472657', '1');
INSERT INTO `bingo_user_list` VALUES ('176', '0', '0', 'oSlXkvpL2YJoWvTmWz2SrumDG584', '0', null, null, '郝仁', '1', 'zh_CN', '安阳', '河南', '中国', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBkib4sW5ZjKypPGX7O4hpt6xF99qMowFiaOG92SsUZRPiaukqibicXW07jgAiaQweibWJvt3ZjXIiaGemQyg/0', '0', null, null, '34.807892', '113.568848', '1487472707', '1');
INSERT INTO `bingo_user_list` VALUES ('177', '0', '0', 'oSlXkvkLdGW1QdvktxfaUVoF0UF0', '0', '孙晓荣', '18437605786', '从蓉', '2', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLC8nza2GanBxmrk6KGSY6L5jaxt0Z2kfdOzMaibaw7iaQfsP7GOFYFh8qW7iaicVyFE0h8xLlIdkvtPZA/0', '0', null, null, null, null, '1487476150', '1');
INSERT INTO `bingo_user_list` VALUES ('178', '0', '0', 'oSlXkvkMClg9KVcCm4hMdsTKr4Jg', '0', null, null, '枫叶红彤彤', '2', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIM3pnGJB6Z4VRVLtCW2oVHh1iao63IbYNGW48q4ICFhIEYBmiapfib8tKwnflQqyyzXWWK6gPXjaQDw/0', '0', null, null, '34.807461', '113.569214', '1487478080', '1');
INSERT INTO `bingo_user_list` VALUES ('179', '0', '0', 'oSlXkvhuh2eijm4QPa4yqYFs7eJw', '0', null, null, '春天', '2', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/e4AHVDBKM2JpEiayGTSPiamzanjklCR6JaAm2rpKNuvXSCnjhvAAd8sEIAFw4lAcNNjCJmPmic1IWNxtBzBibyp42qjv3gBPZ5A7/0', '0', null, null, null, null, '1487478918', '1');
INSERT INTO `bingo_user_list` VALUES ('180', '0', '0', 'oSlXkvjXQfd_RqhBe1yBIQO2FyUk', '0', null, null, '潮起潮落', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/MZbnegfbjxSyRj3ibM83Ez1nmtKpeLEw498zFyniaX5Cwh6OvpQ2BuxLjchK7UdAX36ictyiczrvLCdXiaryYPJwibzoxSX1zSia1tj/0', '0', null, null, '34.807518', '113.569389', '1487497587', '1');
INSERT INTO `bingo_user_list` VALUES ('181', '0', '0', 'oSlXkvtm5ot4iCNEb01V2a6fiI6Q', '0', null, null, 'A. 1919', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/MZbnegfbjxSyRj3ibM83Ez511R99xYicW2lY0Miag3V0dzbCRbWJzbO6rBmc65GxFpoicDDndc0hYz5Y8FDaicticjFXZ8BXViatWBM/0', '0', null, null, '34.807579', '113.569427', '1487497642', '1');
INSERT INTO `bingo_user_list` VALUES ('182', '0', '0', 'oSlXkvoQwKmvGMFV91Jg2KYHKxqI', '0', null, null, '小熊维尼', '1', 'zh_CN', '丰台', '北京', '中国', 'http://wx.qlogo.cn/mmopen/LjfPIdu1jLGoqIMH7bo5TFic1jdIsBEITwic0cYaacy1PdIIRWlCskzyVKTA07ticR3ONr5OND2b0q5qibPokMmcLib9tq7WzCst7/0', '0', null, null, '34.710896', '113.382225', '1487510004', '1');
INSERT INTO `bingo_user_list` VALUES ('183', '0', '0', 'oSlXkvkLa6sn_VKqAnDOdDhTJ1bk', '0', null, null, '郑雪瑞', '2', 'zh_TW', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/I3DOQLyMB0QG1JXjqn1q8HHw09pQM2HD8UgRzgKxFHntuUeg8AuerwcXKMBTGIX3KX0OIb6AgIia9ibeZNkRo4Zy4aQcy8iaz6p/0', '0', null, null, null, null, '1487510131', '1');
INSERT INTO `bingo_user_list` VALUES ('184', '0', '0', 'oSlXkvvldqLJLUbOrMuwZfyre8_0', '0', null, null, '豆瓜', '1', 'zh_CN', '', '', '中国', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM7LUT3Ur2x0rmjBHT7M0mrDybktUOsmJ32CkbbEWc3iaqGoiblMK1GJ7VvegMeGOl0x7ZLLJbl97TL5f8PqBwS9z7FfF1icRTaWRU/0', '0', null, null, null, null, '1487510920', '1');
INSERT INTO `bingo_user_list` VALUES ('185', '0', '0', 'oSlXkvnIs-mgss1W5QBMgQBOg0-k', '0', null, null, '囧', '1', 'zh_CN', '', '', '中国', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLB9qxjnj3pguSPA0cMicTrQjfhUHGiaSMfotEbLdXGeQNya9CbKUSh5HO3Cak9Pkggz0ic3AIbiaaWz6g/0', '0', null, null, null, null, '1487511488', '1');
INSERT INTO `bingo_user_list` VALUES ('186', '0', '0', 'oSlXkvkRA9aZ0zy5SPXA8jnf39cE', '0', null, null, '韩川川', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/e4AHVDBKM2JOhHD9B44B3sAWicrPicfIqzotOiaYX0RKM0E3yUss9cnCCDZ19AqXl0xecMY6rqtloLVibA3MxIk9yngMpf2LXGOI/0', '0', null, null, null, null, '1487552298', '1');
INSERT INTO `bingo_user_list` VALUES ('187', '0', '0', 'oSlXkvtdHM-Fhr9DmN2Y9LXTy22I', '0', null, null, 'nini❤️', '2', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBxog8gu6zynv5lyJvQWjNvqDZxJB2NoHE5nv5IWYmcHic6VHGg8ZQAAmFADk57tVFPwZ7icTqib7k6w/0', '0', null, null, null, null, '1487552357', '1');
INSERT INTO `bingo_user_list` VALUES ('188', '0', '0', 'oSlXkvow6tTVpoxeK6tIFaRs8NCI', '0', null, null, '喵大人', '1', 'zh_CN', '', '', '中国', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM7cD6qibS05ypTKUx0N3nqL49cogrVJW182FALUia9icKH2LibgLCsfYq8p0yibY8BV0q7ibEaRGx5zG3FA/0', '0', null, null, null, null, '1487566432', '1');
INSERT INTO `bingo_user_list` VALUES ('189', '0', '0', 'oSlXkvtf2x4Bo-zAJIVv0CWUVEds', '0', null, null, '狄奥思齐', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/I3DOQLyMB0QG1JXjqn1q8MoUodeyZSJvEY5ibOCTg5PlleqBC496xjAJV6h6e27r1zmCrcG2kCiaykMib7YrY8Ct7sRz1qqKOfc/0', '0', null, null, null, null, '1487567514', '1');
INSERT INTO `bingo_user_list` VALUES ('190', '0', '0', 'oSlXkvqXgcuQMJGY7tUhrLC5uWrA', '0', null, null, 'a_a 倍力健身高媛136 0371 4076', '2', 'zh_CN', '', '', '中国', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIo1MibiaTKT65zg5gMwY2zPGuWVzq8szic9yTGHoiaVAxUgTZcBQiaPh3wLjJlnEJulFR5uhTQlH9OPSQ/0', '0', null, null, null, null, '1487585572', '1');
INSERT INTO `bingo_user_list` VALUES ('191', '0', '0', 'oSlXkvj0k_YnVl77rdD-XHKveOoc', '0', null, null, ' Meng', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/VHU8bI7BOJAVexg6mpBj2x8r7j0mrh9vMunnpQdXuaFZBecXyfiagO28kC4yFjz6oFJCjekg4lznM7awVcwFnmQ/0', '0', null, null, '34.808327', '113.569763', '1487586908', '1');
INSERT INTO `bingo_user_list` VALUES ('192', '0', '0', 'oSlXkvtd3ZllHXMVG9kLfg8AhSK4', '0', null, null, '回不去的年少时光', '2', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/MZbnegfbjxSxibHZe9pR44jicUbKM0brD4icGWdmyrSjOpXw8ofJLPKUQjMUneLSiaHBUxlspiaS03iafaPAX4ZUiadjoeBk2nmFYnd/0', '0', null, null, null, null, '1487590589', '1');
INSERT INTO `bingo_user_list` VALUES ('193', '0', '0', 'oSlXkvvmOU2A3kiPQ9QdfQ61wKko', '0', '陈万才', '13384009660', '难得糊涂', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6odfYXZvqMhWd4gbiaP4wqbibMWB6dOL4aDHRjI7IPG7ib6uViaqROpa54BGAiaRrbhoembMFsK1Nkk9XNctr2vqiamU9SicSPZeqWMA/0', '0', null, null, '34.807289', '113.571640', '1487642215', '1');
INSERT INTO `bingo_user_list` VALUES ('194', '0', '0', 'oSlXkvvJ3VjEV4oH2bAjTPh_0_rU', '0', null, null, '鸡毛蒜皮', '2', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDcHB7JtlFCG9ZW32Du4o5QiavlD9AY1Y1qiahnPTalk2eDDJUUmFC4Tx4zegZ8zrSoKhiaHldu7icWXg/0', '0', null, null, '34.807713', '113.568542', '1487651242', '1');
INSERT INTO `bingo_user_list` VALUES ('195', '0', '0', 'oSlXkvgY6lqXinZyPo88QdHiSp_M', '0', null, null, '行者彭洋', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELrdw3ts8pqLPQ4SR6yoxthhYWOvwViayXBlzdsvYgnSZInykj4k7ZxO6Xuv2G4U7ewdlEclCWLtqA/0', '0', null, null, null, null, '1487651296', '1');
INSERT INTO `bingo_user_list` VALUES ('196', '0', '0', 'oSlXkvr574K-ETxJ9yqd_cu-wxWU', '0', null, null, '贾胖胖～', '1', 'zh_CN', '', '', '中国', 'http://wx.qlogo.cn/mmopen/I3DOQLyMB0QG1JXjqn1q8MAL7JEMNKrbCXGXj8xbyFE37JbWNswbyUCdiaz94IPEm8cYN9PdSeBBcANclAM9zTPYDERVg2kK2/0', '0', null, null, null, null, '1487653921', '1');
INSERT INTO `bingo_user_list` VALUES ('197', '0', '0', 'oSlXkvlYe6aiFUYxgQw5OcuExcrs', '0', null, null, '睡到自然醒', '1', 'zh_CN', '信阳', '河南', '中国', 'http://wx.qlogo.cn/mmopen/I3DOQLyMB0SjwXaqdNVLtY31ibP6ak8N2CDO9l9udkDVrEIyicO484qFfzAXM1mSG2lluw9Bm2AiaaXWBib1PwppPhXFX0ib2icb8A/0', '0', null, null, '34.807648', '113.568611', '1487654916', '1');
INSERT INTO `bingo_user_list` VALUES ('198', '0', '0', 'oSlXkvuaYninolz6NUV-miHbVlvo', '0', null, null, '_Kai', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4lz9dpKhdBHr9WHxKtMJJtddv5ubF3ANu5CeHwQlk9chN7YrIGN2GA4ddLXPmibzX6nKNlgdsG5ibw/0', '0', null, null, '34.807762', '113.568718', '1487655000', '1');
INSERT INTO `bingo_user_list` VALUES ('199', '0', '0', 'oSlXkvuwqszpWykRC-4vO76LWbUU', '0', null, null, '小哥', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/I3DOQLyMB0T36iboZ7HymcN5NaiaBbmhGib7dGkibYA3HMqdhaOnE2wtA8pEgRgV7kd66rDCsdiaheKPwqwR2uAPGHQ/0', '0', null, null, '34.807667', '113.570831', '1487661502', '1');
INSERT INTO `bingo_user_list` VALUES ('200', '0', '0', 'oSlXkvlWruX5aLV-A9Md8G_8hgJ4', '0', null, null, 'Eudora', '2', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/MZbnegfbjxSyRj3ibM83Ez5vXqnzrNn6Z4Wy9TjiaqGpleyuW8WLDgJ2CaRyYqZYqu5XmCRHPh7NWRmvTLvlJBRWiao0exiaBnkz/0', '0', null, null, '34.805710', '113.565063', '1487666979', '1');
INSERT INTO `bingo_user_list` VALUES ('201', '0', '0', 'oSlXkvgPUf95LSAi5JpBJcWknduM', '0', null, null, 'Superman运友邦', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/MZbnegfbjxSyRj3ibM83Ez5jQHOdE2n9dp795w6T3ia8lmAys4V2ibia6p0mSA9G2DZx1WErVicIw98pyzKueGf7ibXayp6c5I9KIn/0', '0', null, null, '34.771347', '113.728745', '1487670753', '1');
INSERT INTO `bingo_user_list` VALUES ('202', '0', '0', 'oSlXkvq4gTiK1RLj6TA-ggAHCbJY', '0', null, null, '刘柳互联网、金融、泛娱乐', '1', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/I3DOQLyMB0QG1JXjqn1q8Mmv5YiaOI3jn5ZbIVFkS7MxHMh4NlUgpx3wYrs4Go30Wj8icCtZSBQ1hZRoKK5zUkv9lwuHnC1h2a/0', '0', null, null, '34.763897', '113.658897', '1487672954', '1');
INSERT INTO `bingo_user_list` VALUES ('203', '0', '0', 'oSlXkvtkk-CLmspRAobJnmw66Fa4', '0', null, null, 'zorn', '1', 'zh_CN', '', '', '中国', 'http://wx.qlogo.cn/mmopen/I3DOQLyMB0QpYKia1AQxTRQS5HSh2ZjJ9B4f8r6ibtR1NI7ceMyDmSgyakXNqNF91gPtMXgKMCKjgfU8BmMwasrBjh9ibBgYMRv/0', '0', null, null, null, null, '1487676935', '1');
INSERT INTO `bingo_user_list` VALUES ('204', '0', '0', 'oSlXkvsoP1apKhmGSzwvbwNX_C7U', '0', null, null, '龙人', '1', 'zh_CN', '', '', '中国', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIia4xmIJIvZDKohxQCndNM4Vy2yZCGqibQe4b0nlPSfdYZwOkHRRusp6ZzG5SKSBrSmPsYVuZNWGaQ/0', '0', null, null, null, null, '1487683066', '1');
INSERT INTO `bingo_user_list` VALUES ('205', '0', '0', 'oSlXkvrl4NUXkXSatfaNopfz38wc', '0', null, null, '小圆子', '2', 'zh_CN', '郑州', '河南', '中国', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCKM8rjUAyHINyibFulGIgjhGVicWz6cy8R3pz9uNQF4Nia8svdvMDPxnciat4j3LsUXg8mrtcCFcsQLg/0', '0', null, null, '34.808701', '113.568565', '1487683739', '1');
INSERT INTO `bingo_user_list` VALUES ('206', '0', '0', 'oSlXkvmjOFN7fpXFTu_JCwb89_eI', '0', null, null, '辉', '1', 'zh_CN', '新乡', '河南', '中国', 'http://wx.qlogo.cn/mmopen/I3DOQLyMB0QG1JXjqn1q8DDhic8KgURibVTjI14vTT6tDWf4REiaWIGVR5iaRfThoTP0wo1YRLekHnQfibasyKs15lNEzEn2iaUcsy/0', '0', null, null, '34.807472', '113.570274', '1487725959', '1');

-- ----------------------------
-- Table structure for `bingo_wxpay_logs`
-- ----------------------------
DROP TABLE IF EXISTS `bingo_wxpay_logs`;
CREATE TABLE `bingo_wxpay_logs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `appid` varchar(50) DEFAULT NULL,
  `err_code` varchar(50) DEFAULT NULL,
  `err_code_des` varchar(150) DEFAULT NULL,
  `bank_type` varchar(10) DEFAULT NULL,
  `cash_fee` varchar(20) DEFAULT NULL,
  `device_info` varchar(50) DEFAULT NULL,
  `fee_type` varchar(10) DEFAULT NULL,
  `is_subscribe` varchar(5) DEFAULT NULL,
  `mch_id` varchar(20) DEFAULT NULL,
  `nonce_str` varchar(50) DEFAULT NULL,
  `openid` varchar(50) DEFAULT NULL,
  `out_trade_no` varchar(20) DEFAULT NULL,
  `result_code` varchar(20) DEFAULT NULL,
  `return_code` varchar(20) DEFAULT NULL,
  `sign` varchar(32) DEFAULT NULL,
  `time_end` varchar(20) DEFAULT NULL,
  `total_fee` varchar(20) DEFAULT NULL,
  `trade_type` varchar(20) DEFAULT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `coupon_fee` varchar(50) DEFAULT NULL,
  `coupon_count` varchar(50) DEFAULT NULL,
  `attach` varchar(150) DEFAULT NULL,
  `addtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bingo_wxpay_logs
-- ----------------------------
