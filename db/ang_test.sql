/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50529
Source Host           : localhost:3306
Source Database       : nways_wechat

Target Server Type    : MYSQL
Target Server Version : 50529
File Encoding         : 65001

Date: 2015-08-10 11:25:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for havana_accesslog
-- ----------------------------
DROP TABLE IF EXISTS `havana_accesslog`;
CREATE TABLE `havana_accesslog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户名称',
  `ip` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT 'ip地址信息',
  `data` text CHARACTER SET utf8 COMMENT '额外数据信息',
  `memo` text CHARACTER SET utf8,
  `type` int(11) DEFAULT '10',
  `status` int(11) DEFAULT '10',
  `cdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '当前记录时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of havana_accesslog
-- ----------------------------
INSERT INTO `havana_accesslog` VALUES ('1', '0', '::1', '{\"WS_RESPONSE\":{\"RETURN_CODE\":\"601\",\"RETURN_MSG\":\"username is empty\"}}', '中文', '10', '10', '2015-07-24 18:03:04');
INSERT INTO `havana_accesslog` VALUES ('2', '0', '::1', 'Array', '{\"source_name\":\"5669eadfe06994640f11bd8ef694f9c5\",\"status\":1,\"nickname\":\"Mike\",\"cellphone\":\"13917441002\"}', '10', '10', '2015-07-24 10:51:07');
INSERT INTO `havana_accesslog` VALUES ('3', '0', '::1', '{\"WS_RESPONSE\":{\"RETURN_CODE\":\"601\",\"RETURN_MSG\":\"username is empty\"}}', '{\"source_name\":\"5669eadfe06994640f11bd8ef694f9c5\",\"status\":1,\"nickname\":\"Mike\",\"cellphone\":\"13917441002\"}', '10', '10', '2015-07-24 10:51:35');
INSERT INTO `havana_accesslog` VALUES ('4', '0', '::1', '{\"WS_RESPONSE\":{\"RETURN_CODE\":\"601\",\"RETURN_MSG\":\"username is empty\"}}', '{\"source_name\":\"5669eadfe06994640f11bd8ef694f9c5\",\"status\":1,\"nickname\":\"Mike\",\"cellphone\":\"13917441002\",\"username\":\"\"}', '10', '10', '2015-07-24 10:53:18');
INSERT INTO `havana_accesslog` VALUES ('5', '0', '::1', '', '{\"source_name\":\"5669eadfe06994640f11bd8ef694f9c5\",\"status\":1,\"nickname\":\"Mike\",\"cellphone\":\"13917441002\",\"username\":\"mike_yi\"}', '10', '10', '2015-07-24 11:15:53');
INSERT INTO `havana_accesslog` VALUES ('6', '0', '::1', '', '{\"source_name\":\"5669eadfe06994640f11bd8ef694f9c5\",\"status\":1,\"nickname\":\"Mike\",\"cellphone\":\"13917441002\",\"username\":\"mike_yi\"}', '10', '10', '2015-07-24 11:15:53');
INSERT INTO `havana_accesslog` VALUES ('7', '0', '::1', '{\"WS_RESPONSE\":{\"RETURN_CODE\":\"606\",\"RETURN_MSG\":\"Cellphone: 13917441002 already exist\"}}', '{\"source_name\":\"5669eadfe06994640f11bd8ef694f9c5\",\"username\":\"Mike\",\"cellphone\":\"13917441002\"}', '10', '10', '2015-07-24 15:16:08');
INSERT INTO `havana_accesslog` VALUES ('8', '0', '::1', '{\"WS_RESPONSE\":{\"RETURN_CODE\":\"606\",\"RETURN_MSG\":\"Cellphone: 13917441002 already exist\"}}', '{\"source_name\":\"5669eadfe06994640f11bd8ef694f9c5\",\"username\":\"Mike\",\"cellphone\":\"13917441002\"}', '10', '10', '2015-07-24 15:19:25');
INSERT INTO `havana_accesslog` VALUES ('9', '0', '::1', '{\"WS_RESPONSE\":{\"RETURN_CODE\":\"606\",\"RETURN_MSG\":\"Cellphone: 13917441002 already exist\"}}', '{\"source_name\":\"5669eadfe06994640f11bd8ef694f9c5\",\"username\":\"Mike\",\"cellphone\":\"13917441002\"}', '10', '10', '2015-07-24 15:21:11');
INSERT INTO `havana_accesslog` VALUES ('10', '0', '::1', '{\"WS_RESPONSE\":{\"RETURN_CODE\":\"606\",\"RETURN_MSG\":\"Cellphone: 13917441002 already exist\"}}', '{\"source_name\":\"5669eadfe06994640f11bd8ef694f9c5\",\"username\":\"Mike\",\"cellphone\":\"13917441002\"}', '10', '10', '2015-07-24 15:23:02');
INSERT INTO `havana_accesslog` VALUES ('11', '0', '::1', '{\"WS_RESPONSE\":{\"RETURN_CODE\":\"606\",\"RETURN_MSG\":\"Cellphone: 13917441002 already exist\"}}', '{\"source_name\":\"5669eadfe06994640f11bd8ef694f9c5\",\"username\":\"Mike\",\"cellphone\":\"13917441002\"}', '10', '10', '2015-07-24 15:24:07');
INSERT INTO `havana_accesslog` VALUES ('12', '0', '::1', '{\"acxiom_id\":\"3808364\",\"uuid\":\"bcba1fc2bffde33460e8061fbe2b826e20bb08a1\",\"WS_RESPONSE\":{\"RETURN_CODE\":\"000\",\"RETURN_MSG\":\"ok\"}}', '{\"source_name\":\"5669eadfe06994640f11bd8ef694f9c5\",\"username\":\"%E6%B5%8B%E8%AF%9501\",\"cellphone\":\"13917441001\"}', '10', '10', '2015-07-24 17:59:55');
INSERT INTO `havana_accesslog` VALUES ('13', '0', '::1', '{\"WS_RESPONSE\":{\"RETURN_CODE\":\"606\",\"RETURN_MSG\":\"Cellphone: 13917441001 already exist\"}}', '{\"source_name\":\"5669eadfe06994640f11bd8ef694f9c5\",\"username\":\"Mike\",\"cellphone\":\"13917441001\"}', '10', '10', '2015-07-24 18:26:24');
INSERT INTO `havana_accesslog` VALUES ('14', '0', '::1', '{\"WS_RESPONSE\":{\"RETURN_CODE\":\"606\",\"RETURN_MSG\":\"Cellphone: 13917441001 already exist\"}}', '{\"source_name\":\"5669eadfe06994640f11bd8ef694f9c5\",\"username\":\"%E6%B5%8B%E8%AF%951\",\"cellphone\":\"13917441001\"}', '10', '10', '2015-07-24 18:32:27');
INSERT INTO `havana_accesslog` VALUES ('15', '1', '127.0.0.1', 'login', null, '99', '10', '2015-07-28 10:04:59');
INSERT INTO `havana_accesslog` VALUES ('16', '0', '::1', '', 'null uid', '10', '10', '2015-07-28 19:39:54');
INSERT INTO `havana_accesslog` VALUES ('17', '0', '::1', 'null uid', 'null uid', '10', '10', '2015-07-28 20:40:43');
INSERT INTO `havana_accesslog` VALUES ('18', '0', '::1', 'null uid', 'null uid', '10', '10', '2015-07-28 20:43:19');
INSERT INTO `havana_accesslog` VALUES ('19', '', '::1', '{\"uid\":0,\"name\":\"mike\",\"phone\":\"13917441002\",\"udate\":\"2015-07-28 21:24:26\"}', '', '20', '10', '2015-07-28 21:24:26');
INSERT INTO `havana_accesslog` VALUES ('20', '0', '::1', '{\"WS_RESPONSE\":{\"RETURN_CODE\":\"606\",\"RETURN_MSG\":\"Cellphone: 13917441002 already exist\"}}', '{\"source_name\":\"5669eadfe06994640f11bd8ef694f9c5\",\"username\":\"mike\",\"cellphone\":\"13917441002\"}', '10', '10', '2015-07-28 21:24:32');
INSERT INTO `havana_accesslog` VALUES ('21', '1', '::1', 'login', null, '99', '10', '2015-07-28 21:38:25');
INSERT INTO `havana_accesslog` VALUES ('22', '', '::1', '%7B%22uid%22%3A0%2C%22name%22%3A%22mike%22%2C%22phone%22%3A%2213917441002%22%2C%22udate%22%3A%222015-07-29+11%3A49%3A03%22%7D', '', '20', '10', '2015-07-29 11:49:03');
INSERT INTO `havana_accesslog` VALUES ('23', '0', '::1', '{\"WS_RESPONSE\":{\"RETURN_CODE\":\"606\",\"RETURN_MSG\":\"Cellphone: 13917441002 already exist\"}}', '{\"source_name\":\"5669eadfe06994640f11bd8ef694f9c5\",\"username\":\"mike\",\"cellphone\":\"13917441002\"}', '10', '10', '2015-07-29 11:49:03');
INSERT INTO `havana_accesslog` VALUES ('24', '', '::1', '%7B%22uid%22%3A0%2C%22name%22%3A%22mike%22%2C%22phone%22%3A%2213917441003%22%2C%22udate%22%3A%222015-07-29+14%3A28%3A47%22%7D', '', '20', '10', '2015-07-29 14:28:47');
INSERT INTO `havana_accesslog` VALUES ('25', '0', '::1', '{\"acxiom_id\":\"3814064\",\"uuid\":\"dcf5f6a878c76894773fc8853c0a6f0c26e0520b\",\"WS_RESPONSE\":{\"RETURN_CODE\":\"000\",\"RETURN_MSG\":\"ok\"}}', '{\"source_name\":\"5669eadfe06994640f11bd8ef694f9c5\",\"username\":\"mike\",\"cellphone\":\"13917441003\"}', '10', '10', '2015-07-29 14:28:48');
INSERT INTO `havana_accesslog` VALUES ('26', '', '::1', '%7B%22uid%22%3A0%2C%22name%22%3A%22mike%22%2C%22phone%22%3A%2213917441004%22%2C%22udate%22%3A%222015-07-29+14%3A44%3A46%22%7D', '', '20', '10', '2015-07-29 14:44:46');
INSERT INTO `havana_accesslog` VALUES ('27', '0', '::1', '{\"acxiom_id\":\"3814066\",\"uuid\":\"83a70dd8a211c86192c9e98d75ad2a04b140819d\",\"WS_RESPONSE\":{\"RETURN_CODE\":\"000\",\"RETURN_MSG\":\"ok\"}}', '{\"source_name\":\"5669eadfe06994640f11bd8ef694f9c5\",\"username\":\"mike\",\"cellphone\":\"13917441004\"}', '10', '10', '2015-07-29 14:44:49');
INSERT INTO `havana_accesslog` VALUES ('28', '', '::1', '%7B%22uid%22%3A0%2C%22name%22%3A%22mike%22%2C%22phone%22%3A%2213917441005%22%2C%22udate%22%3A%222015-07-29+14%3A45%3A57%22%7D', '', '20', '10', '2015-07-29 14:45:57');
INSERT INTO `havana_accesslog` VALUES ('29', '0', '::1', '{\"acxiom_id\":\"3814068\",\"uuid\":\"dc05221dc9ebbedb4a882dcf9c98ea8f90cab6a3\",\"WS_RESPONSE\":{\"RETURN_CODE\":\"000\",\"RETURN_MSG\":\"ok\"}}', '{\"source_name\":\"5669eadfe06994640f11bd8ef694f9c5\",\"username\":\"mike\",\"cellphone\":\"13917441005\"}', '10', '10', '2015-07-29 14:45:58');
INSERT INTO `havana_accesslog` VALUES ('30', '1', '::1', 'login', null, '99', '10', '2015-07-30 13:05:05');
INSERT INTO `havana_accesslog` VALUES ('31', '', '::1', '%7B%22uid%22%3A1%2C%22name%22%3A%22mike%22%2C%22phone%22%3A%2213917441002%22%2C%22udate%22%3A%222015-07-30+18%3A14%3A49%22%7D', '', '20', '10', '2015-07-30 18:14:49');
INSERT INTO `havana_accesslog` VALUES ('32', '1', '::1', 'login', null, '99', '10', '2015-07-31 07:20:19');
INSERT INTO `havana_accesslog` VALUES ('33', '1', '::1', 'login', null, '99', '10', '2015-07-31 12:09:55');

-- ----------------------------
-- Table structure for havana_codes
-- ----------------------------
DROP TABLE IF EXISTS `havana_codes`;
CREATE TABLE `havana_codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '验证码',
  `cid` int(11) DEFAULT '0',
  `uid` int(11) DEFAULT '0' COMMENT '生成uid',
  `status` int(11) NOT NULL DEFAULT '10' COMMENT '状态',
  `udate` timestamp NULL DEFAULT NULL,
  `cdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录时间',
  `startdate` timestamp NULL DEFAULT NULL,
  `enddate` timestamp NULL DEFAULT NULL,
  `orderid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `code` (`code`),
  KEY `cid` (`cid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of havana_codes
-- ----------------------------

-- ----------------------------
-- Table structure for havana_collect
-- ----------------------------
DROP TABLE IF EXISTS `havana_collect`;
CREATE TABLE `havana_collect` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `codes` varchar(50) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '收集用时(秒)',
  `collects` int(11) DEFAULT '0' COMMENT '收集数量',
  `complete` int(2) DEFAULT '0' COMMENT '是否完成',
  `memo` text COLLATE utf8_unicode_ci COMMENT '说明',
  `ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `useragent` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT '10' COMMENT '状态',
  `type` int(11) DEFAULT '20' COMMENT '类别',
  `cdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `complete` (`complete`),
  KEY `times` (`codes`)
) ENGINE=MyISAM AUTO_INCREMENT=967 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of havana_collect
-- ----------------------------
INSERT INTO `havana_collect` VALUES ('1', '51', '68', '0', '1', null, '101.231.165.202', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_4 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12H143 MicroMessenger/6.2.3 NetType/WIFI Language/en', '10', '20', '2015-07-27 12:35:24');
INSERT INTO `havana_collect` VALUES ('2', '52', '40', '0', '1', null, '58.35.137.107', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_4 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12H143 MicroMessenger/6.2.3 NetType/WIFI Language/en', '10', '20', '2015-07-27 13:02:07');
INSERT INTO `havana_collect` VALUES ('3', '53', '50', '0', '1', null, '223.104.5.205', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_4 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12H143 MicroMessenger/6.2.3 NetType/3G+ Language/zh_CN', '10', '20', '2015-07-27 13:44:49');
INSERT INTO `havana_collect` VALUES ('4', '55', '369', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (Linux; U; Android 4.4.2; zh-cn; SM-G9008W Build/KOT49H) AppleWebKit/533.1 (KHTML, like Gecko)Version/4.0 MQQBrowser/5.4 TBS/025440 Mobile Safari/533.1 MicroMessenger/6.2.2.54_rec1912d.581 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-28 01:43:16');
INSERT INTO `havana_collect` VALUES ('5', '55', '54', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (Linux; U; Android 4.4.2; zh-cn; SM-G9008W Build/KOT49H) AppleWebKit/533.1 (KHTML, like Gecko)Version/4.0 MQQBrowser/5.4 TBS/025440 Mobile Safari/533.1 MicroMessenger/6.2.2.54_rec1912d.581 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-28 01:47:16');
INSERT INTO `havana_collect` VALUES ('6', '56', '86', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (Linux; U; Android 4.4.4; zh-cn; MI 4LTE Build/KTU84P) AppleWebKit/533.1 (KHTML, like Gecko)Version/4.0 MQQBrowser/5.4 TBS/025440 Mobile Safari/533.1 MicroMessenger/6.2.2.54_rec1912d.581 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-28 01:53:06');
INSERT INTO `havana_collect` VALUES ('7', '57', '49', '0', '1', null, '106.84.52.204', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12F70 MicroMessenger/6.2.3 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-28 02:35:57');
INSERT INTO `havana_collect` VALUES ('8', '55', '540', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (Linux; U; Android 4.4.2; zh-cn; SM-G9008W Build/KOT49H) AppleWebKit/533.1 (KHTML, like Gecko)Version/4.0 MQQBrowser/5.4 TBS/025440 Mobile Safari/533.1 MicroMessenger/6.2.2.54_rec1912d.581 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-28 02:57:00');
INSERT INTO `havana_collect` VALUES ('9', '58', '123', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_1_3 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12B466 MicroMessenger/6.2.3 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-28 03:02:19');
INSERT INTO `havana_collect` VALUES ('10', '55', '24', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (Linux; U; Android 4.4.2; zh-cn; SM-G9008W Build/KOT49H) AppleWebKit/533.1 (KHTML, like Gecko)Version/4.0 MQQBrowser/5.4 TBS/025440 Mobile Safari/533.1 MicroMessenger/6.2.2.54_rec1912d.581 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-28 03:31:42');
INSERT INTO `havana_collect` VALUES ('11', '59', '58', '0', '1', null, '101.81.66.19', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_1_2 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12B440 MicroMessenger/6.2 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-28 03:34:51');
INSERT INTO `havana_collect` VALUES ('12', '56', '333', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (Linux; U; Android 4.4.4; zh-cn; MI 4LTE Build/KTU84P) AppleWebKit/533.1 (KHTML, like Gecko)Version/4.0 MQQBrowser/5.4 TBS/025440 Mobile Safari/533.1 MicroMessenger/6.2.2.54_rec1912d.581 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-28 03:37:40');
INSERT INTO `havana_collect` VALUES ('13', '60', '161', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_4 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12H143 MicroMessenger/6.2.3 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-28 06:31:16');
INSERT INTO `havana_collect` VALUES ('14', '60', '55', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_4 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12H143 MicroMessenger/6.2.3 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-28 06:38:38');
INSERT INTO `havana_collect` VALUES ('15', '60', '137', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_4 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12H143 MicroMessenger/6.2.3 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-28 06:45:21');
INSERT INTO `havana_collect` VALUES ('16', '58', '53', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_1_3 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12B466 MicroMessenger/6.2.3 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-28 06:52:50');
INSERT INTO `havana_collect` VALUES ('17', '58', '47', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_1_3 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12B466 MicroMessenger/6.2.3 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-28 06:55:33');
INSERT INTO `havana_collect` VALUES ('18', '65', '87', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_1_3 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12B466 MicroMessenger/6.2.3 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 02:52:20');
INSERT INTO `havana_collect` VALUES ('19', '65', '105', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_1_3 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12B466 MicroMessenger/6.2.3 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 03:25:46');
INSERT INTO `havana_collect` VALUES ('20', '65', '133', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_1_3 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12B466 MicroMessenger/6.2.3 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 03:31:47');
INSERT INTO `havana_collect` VALUES ('21', '61', '47', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_4 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12H143 MicroMessenger/6.2.3 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 03:39:18');
INSERT INTO `havana_collect` VALUES ('22', '61', '4', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_4 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12H143 MicroMessenger/6.2.3 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 03:49:17');
INSERT INTO `havana_collect` VALUES ('23', '61', '5', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_4 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12H143 MicroMessenger/6.2.3 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 03:51:32');
INSERT INTO `havana_collect` VALUES ('24', '61', '3', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_4 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12H143 MicroMessenger/6.2.3 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 03:53:39');
INSERT INTO `havana_collect` VALUES ('25', '61', '3', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_4 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12H143 MicroMessenger/6.2.3 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 03:56:02');
INSERT INTO `havana_collect` VALUES ('26', '62', '4', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (Linux; U; Android 4.4.2; zh-cn; SM-G9008W Build/KOT49H) AppleWebKit/533.1 (KHTML, like Gecko)Version/4.0 MQQBrowser/5.4 TBS/025440 Mobile Safari/533.1 MicroMessenger/6.2.2.54_rec1912d.581 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 03:58:35');
INSERT INTO `havana_collect` VALUES ('27', '65', '7', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_1_3 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12B466 MicroMessenger/6.2.3 NetType/3G+ Language/zh_CN', '10', '20', '2015-07-29 03:59:52');
INSERT INTO `havana_collect` VALUES ('28', '61', '4', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_4 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12H143 MicroMessenger/6.2.3 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 04:37:27');
INSERT INTO `havana_collect` VALUES ('29', '62', '4', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (Linux; U; Android 4.4.2; zh-cn; SM-G9008W Build/KOT49H) AppleWebKit/533.1 (KHTML, like Gecko)Version/4.0 MQQBrowser/5.4 TBS/025440 Mobile Safari/533.1 MicroMessenger/6.2.2.54_rec1912d.581 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 04:38:49');
INSERT INTO `havana_collect` VALUES ('30', '65', '5', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_1_3 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12B466 MicroMessenger/6.2.3 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 04:41:20');
INSERT INTO `havana_collect` VALUES ('31', '61', '4', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_4 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12H143 MicroMessenger/6.2.3 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 04:42:24');
INSERT INTO `havana_collect` VALUES ('32', '65', '14', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_1_3 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12B466 MicroMessenger/6.2.3 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 04:43:53');
INSERT INTO `havana_collect` VALUES ('33', '61', '4', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_4 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12H143 MicroMessenger/6.2.3 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 04:44:13');
INSERT INTO `havana_collect` VALUES ('34', '61', '3', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_4 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12H143 MicroMessenger/6.2.3 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 04:48:08');
INSERT INTO `havana_collect` VALUES ('35', '61', '4', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_4 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12H143 MicroMessenger/6.2.3 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 04:49:35');
INSERT INTO `havana_collect` VALUES ('36', '61', '4', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_4 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12H143 MicroMessenger/6.2.3 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 04:51:37');
INSERT INTO `havana_collect` VALUES ('37', '61', '9', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_4 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12H143 MicroMessenger/6.2.3 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 04:52:31');
INSERT INTO `havana_collect` VALUES ('38', '61', '4', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_4 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12H143 MicroMessenger/6.2.3 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 05:03:56');
INSERT INTO `havana_collect` VALUES ('39', '61', '4', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_4 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12H143 MicroMessenger/6.2.3 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 05:05:27');
INSERT INTO `havana_collect` VALUES ('40', '61', '6', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_4 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12H143 MicroMessenger/6.2.3 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 05:05:57');
INSERT INTO `havana_collect` VALUES ('41', '67', '4', '0', '1', null, '221.192.179.29', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_4 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12H143 MicroMessenger/6.2.3 NetType/3G+ Language/zh_CN', '10', '20', '2015-07-29 05:07:08');
INSERT INTO `havana_collect` VALUES ('42', '61', '3', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_4 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12H143 MicroMessenger/6.2.3 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 05:07:52');
INSERT INTO `havana_collect` VALUES ('43', '61', '3', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_4 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12H143 MicroMessenger/6.2.3 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 05:09:44');
INSERT INTO `havana_collect` VALUES ('44', '61', '3', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_4 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12H143 MicroMessenger/6.2.3 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 05:11:51');
INSERT INTO `havana_collect` VALUES ('45', '61', '4', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_4 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12H143 MicroMessenger/6.2.3 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 05:12:45');
INSERT INTO `havana_collect` VALUES ('46', '61', '6', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_4 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12H143 MicroMessenger/6.2.3 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 05:13:24');
INSERT INTO `havana_collect` VALUES ('47', '61', '6', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_4 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12H143 MicroMessenger/6.2.3 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 05:14:13');
INSERT INTO `havana_collect` VALUES ('48', '61', '3', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_4 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12H143 MicroMessenger/6.2.3 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 05:16:39');
INSERT INTO `havana_collect` VALUES ('49', '61', '3', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_4 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12H143 MicroMessenger/6.2.3 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 05:18:19');
INSERT INTO `havana_collect` VALUES ('50', '61', '3', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_4 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12H143 MicroMessenger/6.2.3 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 05:20:52');
INSERT INTO `havana_collect` VALUES ('51', '61', '3', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_4 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12H143 MicroMessenger/6.2.3 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 05:23:26');
INSERT INTO `havana_collect` VALUES ('52', '61', '8', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_4 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12H143 MicroMessenger/6.2.3 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 05:24:44');
INSERT INTO `havana_collect` VALUES ('53', '61', '3', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_4 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12H143 MicroMessenger/6.2.3 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 05:27:25');
INSERT INTO `havana_collect` VALUES ('54', '61', '3', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_4 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12H143 MicroMessenger/6.2.3 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 05:28:28');
INSERT INTO `havana_collect` VALUES ('55', '69', '60', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12B411 MicroMessenger/6.1.1 NetType/WIFI', '10', '20', '2015-07-29 05:36:02');
INSERT INTO `havana_collect` VALUES ('56', '62', '13', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (Linux; U; Android 4.4.2; zh-cn; SM-G9008W Build/KOT49H) AppleWebKit/533.1 (KHTML, like Gecko)Version/4.0 MQQBrowser/5.4 TBS/025440 Mobile Safari/533.1 MicroMessenger/6.2.2.54_rec1912d.581 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 05:38:47');
INSERT INTO `havana_collect` VALUES ('57', '69', '7', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12B411 MicroMessenger/6.1.1 NetType/WIFI', '10', '20', '2015-07-29 05:43:22');
INSERT INTO `havana_collect` VALUES ('58', '70', '24', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (Linux; U; Android 4.3; zh-cn; K-Touch Tou ch 2 Build/K-Touch Tou ch 2) AppleWebKit/533.1 (KHTML, like Gecko)Version/4.0 MQQBrowser/5.4 TBS/025440 Mobile Safari/533.1 MicroMessenger/6.2.2.54_rec1912d.581 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 05:43:31');
INSERT INTO `havana_collect` VALUES ('59', '70', '30', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (Linux; U; Android 4.3; zh-cn; K-Touch Tou ch 2 Build/K-Touch Tou ch 2) AppleWebKit/533.1 (KHTML, like Gecko)Version/4.0 MQQBrowser/5.4 TBS/025440 Mobile Safari/533.1 MicroMessenger/6.2.2.54_rec1912d.581 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 05:48:56');
INSERT INTO `havana_collect` VALUES ('60', '69', '7', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12B411 MicroMessenger/6.1.1 NetType/WIFI', '10', '20', '2015-07-29 05:50:36');
INSERT INTO `havana_collect` VALUES ('61', '70', '22', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (Linux; U; Android 4.3; zh-cn; K-Touch Tou ch 2 Build/K-Touch Tou ch 2) AppleWebKit/533.1 (KHTML, like Gecko)Version/4.0 MQQBrowser/5.4 TBS/025440 Mobile Safari/533.1 MicroMessenger/6.2.2.54_rec1912d.581 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 06:00:40');
INSERT INTO `havana_collect` VALUES ('62', '65', '96', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_1_3 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12B466 MicroMessenger/6.2.3 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 06:01:08');
INSERT INTO `havana_collect` VALUES ('63', '71', '59', '0', '1', null, '106.84.52.204', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_1_1 like Mac OS X) AppleWebKit/537.51.2 (KHTML, like Gecko) Mobile/11D201 MicroMessenger/6.1 NetType/WIFI', '10', '20', '2015-07-29 06:04:17');
INSERT INTO `havana_collect` VALUES ('64', '65', '66', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_1_3 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12B466 MicroMessenger/6.2.3 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 06:05:23');
INSERT INTO `havana_collect` VALUES ('65', '72', '40', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (Linux; U; Android 4.4.4; zh-cn; MI 4LTE Build/KTU84P) AppleWebKit/533.1 (KHTML, like Gecko)Version/4.0 MQQBrowser/5.4 TBS/025440 Mobile Safari/533.1 MicroMessenger/6.2.2.54_rec1912d.581 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 06:08:35');
INSERT INTO `havana_collect` VALUES ('66', '71', '61', '0', '1', null, '106.84.52.204', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_1_1 like Mac OS X) AppleWebKit/537.51.2 (KHTML, like Gecko) Mobile/11D201 MicroMessenger/6.1 NetType/WIFI', '10', '20', '2015-07-29 06:08:45');
INSERT INTO `havana_collect` VALUES ('67', '69', '51', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12B411 MicroMessenger/6.1.1 NetType/WIFI', '10', '20', '2015-07-29 06:11:51');
INSERT INTO `havana_collect` VALUES ('68', '72', '4', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (Linux; U; Android 4.4.4; zh-cn; MI 4LTE Build/KTU84P) AppleWebKit/533.1 (KHTML, like Gecko)Version/4.0 MQQBrowser/5.4 TBS/025440 Mobile Safari/533.1 MicroMessenger/6.2.2.54_rec1912d.581 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 06:32:18');
INSERT INTO `havana_collect` VALUES ('69', '72', '5', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (Linux; U; Android 4.4.4; zh-cn; MI 4LTE Build/KTU84P) AppleWebKit/533.1 (KHTML, like Gecko)Version/4.0 MQQBrowser/5.4 TBS/025440 Mobile Safari/533.1 MicroMessenger/6.2.2.54_rec1912d.581 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 06:43:09');
INSERT INTO `havana_collect` VALUES ('70', '72', '5', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (Linux; U; Android 4.4.4; zh-cn; MI 4LTE Build/KTU84P) AppleWebKit/533.1 (KHTML, like Gecko)Version/4.0 MQQBrowser/5.4 TBS/025440 Mobile Safari/533.1 MicroMessenger/6.2.2.54_rec1912d.581 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 06:59:54');
INSERT INTO `havana_collect` VALUES ('71', '63', '63', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_4 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12H143 MicroMessenger/6.2.3 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 07:07:07');
INSERT INTO `havana_collect` VALUES ('72', '72', '12', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (Linux; U; Android 4.4.4; zh-cn; MI 4LTE Build/KTU84P) AppleWebKit/533.1 (KHTML, like Gecko)Version/4.0 MQQBrowser/5.4 TBS/025440 Mobile Safari/533.1 MicroMessenger/6.2.2.54_rec1912d.581 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 07:08:11');
INSERT INTO `havana_collect` VALUES ('73', '67', '143', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_4 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12H143 MicroMessenger/6.2.3 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 07:10:46');
INSERT INTO `havana_collect` VALUES ('74', '72', '3', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (Linux; U; Android 4.4.4; zh-cn; MI 4LTE Build/KTU84P) AppleWebKit/533.1 (KHTML, like Gecko)Version/4.0 MQQBrowser/5.4 TBS/025440 Mobile Safari/533.1 MicroMessenger/6.2.2.54_rec1912d.581 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 07:11:28');
INSERT INTO `havana_collect` VALUES ('75', '69', '78', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12B411 MicroMessenger/6.1.1 NetType/WIFI', '10', '20', '2015-07-29 07:12:24');
INSERT INTO `havana_collect` VALUES ('76', '72', '5', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (Linux; U; Android 4.4.4; zh-cn; MI 4LTE Build/KTU84P) AppleWebKit/533.1 (KHTML, like Gecko)Version/4.0 MQQBrowser/5.4 TBS/025440 Mobile Safari/533.1 MicroMessenger/6.2.2.54_rec1912d.581 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 07:12:55');
INSERT INTO `havana_collect` VALUES ('77', '73', '64', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (Linux; U; Android 4.2.2; zh-cn; H30-U10 Build/HuaweiH30-U10) AppleWebKit/533.1 (KHTML, like Gecko)Version/4.0 MQQBrowser/5.4 TBS/025440 Mobile Safari/533.1 MicroMessenger/6.2.2.54_rec1912d.581 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 07:13:15');
INSERT INTO `havana_collect` VALUES ('78', '72', '4', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (Linux; U; Android 4.4.4; zh-cn; MI 4LTE Build/KTU84P) AppleWebKit/533.1 (KHTML, like Gecko)Version/4.0 MQQBrowser/5.4 TBS/025440 Mobile Safari/533.1 MicroMessenger/6.2.2.54_rec1912d.581 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 07:19:12');
INSERT INTO `havana_collect` VALUES ('79', '72', '4', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (Linux; U; Android 4.4.4; zh-cn; MI 4LTE Build/KTU84P) AppleWebKit/533.1 (KHTML, like Gecko)Version/4.0 MQQBrowser/5.4 TBS/025440 Mobile Safari/533.1 MicroMessenger/6.2.2.54_rec1912d.581 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 07:22:55');
INSERT INTO `havana_collect` VALUES ('80', '73', '4', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (Linux; U; Android 4.2.2; zh-cn; H30-U10 Build/HuaweiH30-U10) AppleWebKit/533.1 (KHTML, like Gecko)Version/4.0 MQQBrowser/5.4 TBS/025440 Mobile Safari/533.1 MicroMessenger/6.2.2.54_rec1912d.581 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 07:54:26');
INSERT INTO `havana_collect` VALUES ('81', '73', '5', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (Linux; U; Android 4.2.2; zh-cn; H30-U10 Build/HuaweiH30-U10) AppleWebKit/533.1 (KHTML, like Gecko)Version/4.0 MQQBrowser/5.4 TBS/025440 Mobile Safari/533.1 MicroMessenger/6.2.2.54_rec1912d.581 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 08:01:05');
INSERT INTO `havana_collect` VALUES ('82', '62', '5', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (Linux; U; Android 4.4.2; zh-cn; SM-G9008W Build/KOT49H) AppleWebKit/533.1 (KHTML, like Gecko)Version/4.0 MQQBrowser/5.4 TBS/025440 Mobile Safari/533.1 MicroMessenger/6.2.2.54_rec1912d.581 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 08:07:45');
INSERT INTO `havana_collect` VALUES ('83', '62', '3', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (Linux; U; Android 4.4.2; zh-cn; SM-G9008W Build/KOT49H) AppleWebKit/533.1 (KHTML, like Gecko)Version/4.0 MQQBrowser/5.4 TBS/025440 Mobile Safari/533.1 MicroMessenger/6.2.2.54_rec1912d.581 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 08:09:46');
INSERT INTO `havana_collect` VALUES ('84', '62', '3', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (Linux; U; Android 4.4.2; zh-cn; SM-G9008W Build/KOT49H) AppleWebKit/533.1 (KHTML, like Gecko)Version/4.0 MQQBrowser/5.4 TBS/025440 Mobile Safari/533.1 MicroMessenger/6.2.2.54_rec1912d.581 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 08:10:58');
INSERT INTO `havana_collect` VALUES ('85', '69', '11', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_4 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12H143 MicroMessenger/6.1.1 NetType/WIFI', '10', '20', '2015-07-29 08:12:15');
INSERT INTO `havana_collect` VALUES ('86', '65', '142', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_1_3 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12B466 MicroMessenger/6.2.3 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 08:17:21');
INSERT INTO `havana_collect` VALUES ('87', '71', '72', '0', '1', null, '183.66.180.39', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_1_1 like Mac OS X) AppleWebKit/537.51.2 (KHTML, like Gecko) Mobile/11D201 MicroMessenger/6.1 NetType/WIFI', '10', '20', '2015-07-29 08:48:00');
INSERT INTO `havana_collect` VALUES ('88', '62', '4', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (Linux; U; Android 4.4.2; zh-cn; SM-G9008W Build/KOT49H) AppleWebKit/533.1 (KHTML, like Gecko)Version/4.0 MQQBrowser/5.4 TBS/025440 Mobile Safari/533.1 MicroMessenger/6.2.2.54_rec1912d.581 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 09:41:47');
INSERT INTO `havana_collect` VALUES ('89', '61', '4', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_4 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12H143 MicroMessenger/6.2.3 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 09:42:15');
INSERT INTO `havana_collect` VALUES ('90', '70', '54', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (Linux; U; Android 4.3; zh-cn; K-Touch Tou ch 2 Build/K-Touch Tou ch 2) AppleWebKit/533.1 (KHTML, like Gecko)Version/4.0 MQQBrowser/5.4 TBS/025440 Mobile Safari/533.1 MicroMessenger/6.2.2.54_rec1912d.581 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 09:45:30');
INSERT INTO `havana_collect` VALUES ('91', '72', '8', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (Linux; U; Android 4.4.4; zh-cn; MI 4LTE Build/KTU84P) AppleWebKit/533.1 (KHTML, like Gecko)Version/4.0 MQQBrowser/5.4 TBS/025440 Mobile Safari/533.1 MicroMessenger/6.2.2.54_rec1912d.581 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 09:46:05');
INSERT INTO `havana_collect` VALUES ('92', '62', '3', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (Linux; U; Android 4.4.2; zh-cn; SM-G9008W Build/KOT49H) AppleWebKit/533.1 (KHTML, like Gecko)Version/4.0 MQQBrowser/5.4 TBS/025440 Mobile Safari/533.1 MicroMessenger/6.2.2.54_rec1912d.581 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 09:46:33');
INSERT INTO `havana_collect` VALUES ('93', '72', '3', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (Linux; U; Android 4.4.4; zh-cn; MI 4LTE Build/KTU84P) AppleWebKit/533.1 (KHTML, like Gecko)Version/4.0 MQQBrowser/5.4 TBS/025440 Mobile Safari/533.1 MicroMessenger/6.2.2.54_rec1912d.581 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 09:47:54');
INSERT INTO `havana_collect` VALUES ('94', '62', '3', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (Linux; U; Android 4.4.2; zh-cn; SM-G9008W Build/KOT49H) AppleWebKit/533.1 (KHTML, like Gecko)Version/4.0 MQQBrowser/5.4 TBS/025440 Mobile Safari/533.1 MicroMessenger/6.2.2.54_rec1912d.581 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 09:48:57');
INSERT INTO `havana_collect` VALUES ('95', '62', '4', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (Linux; U; Android 4.4.2; zh-cn; SM-G9008W Build/KOT49H) AppleWebKit/533.1 (KHTML, like Gecko)Version/4.0 MQQBrowser/5.4 TBS/025440 Mobile Safari/533.1 MicroMessenger/6.2.2.54_rec1912d.581 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 09:51:55');
INSERT INTO `havana_collect` VALUES ('96', '62', '4', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (Linux; U; Android 4.4.2; zh-cn; SM-G9008W Build/KOT49H) AppleWebKit/533.1 (KHTML, like Gecko)Version/4.0 MQQBrowser/5.4 TBS/025440 Mobile Safari/533.1 MicroMessenger/6.2.2.54_rec1912d.581 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 10:31:52');
INSERT INTO `havana_collect` VALUES ('97', '62', '3', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (Linux; U; Android 4.4.2; zh-cn; SM-G9008W Build/KOT49H) AppleWebKit/533.1 (KHTML, like Gecko)Version/4.0 MQQBrowser/5.4 TBS/025440 Mobile Safari/533.1 MicroMessenger/6.2.2.54_rec1912d.581 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 10:32:34');
INSERT INTO `havana_collect` VALUES ('98', '61', '37', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_4 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12H143 MicroMessenger/6.2.3 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 10:37:40');
INSERT INTO `havana_collect` VALUES ('99', '72', '90', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (Linux; U; Android 4.4.4; zh-cn; MI 4LTE Build/KTU84P) AppleWebKit/533.1 (KHTML, like Gecko)Version/4.0 MQQBrowser/5.4 TBS/025440 Mobile Safari/533.1 MicroMessenger/6.2.2.54_rec1912d.581 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 10:43:21');
INSERT INTO `havana_collect` VALUES ('100', '66', '121', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (Linux; U; Android 4.3; zh-cn; SM-N9008 Build/JSS15J) AppleWebKit/533.1 (KHTML, like Gecko)Version/4.0 MQQBrowser/5.4 TBS/025440 Mobile Safari/533.1 MicroMessenger/6.2.2.54_rec1912d.581 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 10:44:20');
INSERT INTO `havana_collect` VALUES ('101', '67', '57', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_4 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12H143 MicroMessenger/6.2.3 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 10:47:59');
INSERT INTO `havana_collect` VALUES ('102', '62', '44', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (Linux; U; Android 4.4.2; zh-cn; SM-G9008W Build/KOT49H) AppleWebKit/533.1 (KHTML, like Gecko)Version/4.0 MQQBrowser/5.4 TBS/025440 Mobile Safari/533.1 MicroMessenger/6.2.2.54_rec1912d.581 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-29 10:53:25');
INSERT INTO `havana_collect` VALUES ('103', '69', '49', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_4 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12H143 MicroMessenger/6.1.1 NetType/WIFI', '10', '20', '2015-07-29 10:54:10');
INSERT INTO `havana_collect` VALUES ('104', '71', '77', '0', '1', null, '183.66.180.39', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_1_1 like Mac OS X) AppleWebKit/537.51.2 (KHTML, like Gecko) Mobile/11D201 MicroMessenger/6.1 NetType/WIFI', '10', '20', '2015-07-29 11:08:48');
INSERT INTO `havana_collect` VALUES ('105', '62', '41', '0', '1', null, '180.166.195.146', 'Mozilla/5.0 (Linux; U; Android 4.4.2; zh-cn; SM-G9008W Build/KOT49H) AppleWebKit/533.1 (KHTML, like Gecko)Version/4.0 MQQBrowser/5.4 TBS/025440 Mobile Safari/533.1 MicroMessenger/6.2.2.54_rec1912d.581 NetType/WIFI Language/zh_CN', '10', '20', '2015-07-30 01:30:27');
INSERT INTO `havana_collect` VALUES ('938', '1', '3', '0', '1', null, '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_0 like Mac OS X) AppleWebKit/600.1.3 (KHTML, like Gecko) Version/8.0 Mobile/12A4345d Safari/600.1.4', '10', '20', '2015-07-30 18:11:18');
INSERT INTO `havana_collect` VALUES ('939', '1', '3', '0', '1', null, '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_0 like Mac OS X) AppleWebKit/600.1.3 (KHTML, like Gecko) Version/8.0 Mobile/12A4345d Safari/600.1.4', '10', '20', '2015-07-30 18:21:10');
INSERT INTO `havana_collect` VALUES ('940', '1', '3', '0', '1', null, '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_0 like Mac OS X) AppleWebKit/600.1.3 (KHTML, like Gecko) Version/8.0 Mobile/12A4345d Safari/600.1.4', '10', '20', '2015-07-30 18:22:54');
INSERT INTO `havana_collect` VALUES ('941', '1', '2', '0', '1', null, '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_0 like Mac OS X) AppleWebKit/600.1.3 (KHTML, like Gecko) Version/8.0 Mobile/12A4345d Safari/600.1.4', '10', '20', '2015-07-30 18:24:42');
INSERT INTO `havana_collect` VALUES ('942', '1', '3', '0', '1', null, '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_0 like Mac OS X) AppleWebKit/600.1.3 (KHTML, like Gecko) Version/8.0 Mobile/12A4345d Safari/600.1.4', '10', '20', '2015-07-30 18:26:00');
INSERT INTO `havana_collect` VALUES ('943', '1', '2', '0', '1', null, '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_0 like Mac OS X) AppleWebKit/600.1.3 (KHTML, like Gecko) Version/8.0 Mobile/12A4345d Safari/600.1.4', '10', '20', '2015-07-30 18:39:39');
INSERT INTO `havana_collect` VALUES ('944', '1', '4', '0', '1', null, '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_0 like Mac OS X) AppleWebKit/600.1.3 (KHTML, like Gecko) Version/8.0 Mobile/12A4345d Safari/600.1.4', '10', '20', '2015-07-30 18:40:54');
INSERT INTO `havana_collect` VALUES ('945', '1', '2', '0', '1', null, '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_0 like Mac OS X) AppleWebKit/600.1.3 (KHTML, like Gecko) Version/8.0 Mobile/12A4345d Safari/600.1.4', '10', '20', '2015-07-30 18:42:57');
INSERT INTO `havana_collect` VALUES ('946', '1', '2', '0', '1', null, '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_0 like Mac OS X) AppleWebKit/600.1.3 (KHTML, like Gecko) Version/8.0 Mobile/12A4345d Safari/600.1.4', '10', '20', '2015-07-30 18:43:25');
INSERT INTO `havana_collect` VALUES ('947', '1', '2', '0', '1', null, '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_0 like Mac OS X) AppleWebKit/600.1.3 (KHTML, like Gecko) Version/8.0 Mobile/12A4345d Safari/600.1.4', '10', '20', '2015-07-30 18:44:57');
INSERT INTO `havana_collect` VALUES ('948', '1', '2', '0', '1', null, '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_0 like Mac OS X) AppleWebKit/600.1.3 (KHTML, like Gecko) Version/8.0 Mobile/12A4345d Safari/600.1.4', '10', '20', '2015-07-30 18:45:15');
INSERT INTO `havana_collect` VALUES ('949', '1', '8', '0', '1', null, '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_0 like Mac OS X) AppleWebKit/600.1.3 (KHTML, like Gecko) Version/8.0 Mobile/12A4345d Safari/600.1.4', '10', '20', '2015-07-30 18:46:31');
INSERT INTO `havana_collect` VALUES ('950', '1', '1', '0', '1', null, '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_0 like Mac OS X) AppleWebKit/600.1.3 (KHTML, like Gecko) Version/8.0 Mobile/12A4345d Safari/600.1.4', '10', '20', '2015-07-30 18:51:12');
INSERT INTO `havana_collect` VALUES ('951', '1', '2', '0', '1', null, '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_0 like Mac OS X) AppleWebKit/600.1.3 (KHTML, like Gecko) Version/8.0 Mobile/12A4345d Safari/600.1.4', '10', '20', '2015-07-30 18:52:03');
INSERT INTO `havana_collect` VALUES ('952', '1', '2', '0', '1', null, '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_0 like Mac OS X) AppleWebKit/600.1.3 (KHTML, like Gecko) Version/8.0 Mobile/12A4345d Safari/600.1.4', '10', '20', '2015-07-30 18:56:01');
INSERT INTO `havana_collect` VALUES ('953', '1', '2', '0', '1', null, '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_0 like Mac OS X) AppleWebKit/600.1.3 (KHTML, like Gecko) Version/8.0 Mobile/12A4345d Safari/600.1.4', '10', '20', '2015-07-30 19:02:58');
INSERT INTO `havana_collect` VALUES ('954', '1', '2', '0', '1', null, '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_0 like Mac OS X) AppleWebKit/600.1.3 (KHTML, like Gecko) Version/8.0 Mobile/12A4345d Safari/600.1.4', '10', '20', '2015-07-30 19:07:28');
INSERT INTO `havana_collect` VALUES ('955', '1', '2', '0', '1', null, '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_0 like Mac OS X) AppleWebKit/600.1.3 (KHTML, like Gecko) Version/8.0 Mobile/12A4345d Safari/600.1.4', '10', '20', '2015-07-30 19:07:52');
INSERT INTO `havana_collect` VALUES ('956', '1', '2', '0', '1', null, '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_0 like Mac OS X) AppleWebKit/600.1.3 (KHTML, like Gecko) Version/8.0 Mobile/12A4345d Safari/600.1.4', '10', '20', '2015-07-30 19:08:28');
INSERT INTO `havana_collect` VALUES ('957', '1', '2', '0', '1', null, '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_0 like Mac OS X) AppleWebKit/600.1.3 (KHTML, like Gecko) Version/8.0 Mobile/12A4345d Safari/600.1.4', '10', '20', '2015-07-30 19:12:07');
INSERT INTO `havana_collect` VALUES ('958', '1', '2', '0', '1', null, '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_0 like Mac OS X) AppleWebKit/600.1.3 (KHTML, like Gecko) Version/8.0 Mobile/12A4345d Safari/600.1.4', '10', '20', '2015-07-30 19:12:42');
INSERT INTO `havana_collect` VALUES ('959', '1', '3', '0', '1', null, '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_0 like Mac OS X) AppleWebKit/600.1.3 (KHTML, like Gecko) Version/8.0 Mobile/12A4345d Safari/600.1.4', '10', '20', '2015-07-30 19:15:42');
INSERT INTO `havana_collect` VALUES ('960', '1', '2', '0', '1', null, '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_0 like Mac OS X) AppleWebKit/600.1.3 (KHTML, like Gecko) Version/8.0 Mobile/12A4345d Safari/600.1.4', '10', '20', '2015-07-30 19:16:38');
INSERT INTO `havana_collect` VALUES ('961', '1', '2', '0', '1', null, '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_0 like Mac OS X) AppleWebKit/600.1.3 (KHTML, like Gecko) Version/8.0 Mobile/12A4345d Safari/600.1.4', '10', '20', '2015-07-30 19:17:22');
INSERT INTO `havana_collect` VALUES ('962', '1', '4', '0', '1', null, '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_0 like Mac OS X) AppleWebKit/600.1.3 (KHTML, like Gecko) Version/8.0 Mobile/12A4345d Safari/600.1.4', '10', '20', '2015-07-31 08:26:40');
INSERT INTO `havana_collect` VALUES ('963', '1', '2', '0', '1', null, '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_0 like Mac OS X) AppleWebKit/600.1.3 (KHTML, like Gecko) Version/8.0 Mobile/12A4345d Safari/600.1.4', '10', '20', '2015-07-31 08:41:21');
INSERT INTO `havana_collect` VALUES ('964', '1', '2', '0', '1', null, '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_0 like Mac OS X) AppleWebKit/600.1.3 (KHTML, like Gecko) Version/8.0 Mobile/12A4345d Safari/600.1.4', '10', '20', '2015-07-31 08:42:08');
INSERT INTO `havana_collect` VALUES ('965', '1', '3', '0', '1', null, '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_0 like Mac OS X) AppleWebKit/600.1.3 (KHTML, like Gecko) Version/8.0 Mobile/12A4345d Safari/600.1.4', '10', '20', '2015-07-31 08:46:53');
INSERT INTO `havana_collect` VALUES ('966', '1', '2', '0', '1', null, '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_0 like Mac OS X) AppleWebKit/600.1.3 (KHTML, like Gecko) Version/8.0 Mobile/12A4345d Safari/600.1.4', '10', '20', '2015-07-31 10:04:51');

-- ----------------------------
-- Table structure for havana_profile
-- ----------------------------
DROP TABLE IF EXISTS `havana_profile`;
CREATE TABLE `havana_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '姓名',
  `phone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '手机',
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '地址',
  `postcode` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮编',
  `memo` text COLLATE utf8_unicode_ci COMMENT '备注',
  `status` int(11) DEFAULT '10' COMMENT '状态',
  `udate` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `cdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of havana_profile
-- ----------------------------
INSERT INTO `havana_profile` VALUES ('6', '1', 'mike', '13917441002', null, null, null, null, '99', '2015-07-30 18:14:49', '2015-07-30 18:14:49');
INSERT INTO `havana_profile` VALUES ('7', '2', 'mike', '13917441002', null, null, null, null, '99', '2015-07-29 11:49:03', '2015-07-29 14:28:38');
INSERT INTO `havana_profile` VALUES ('8', '3', 'mike', '13917441003', null, null, null, null, '99', '2015-07-29 14:28:47', '2015-07-29 14:38:01');
INSERT INTO `havana_profile` VALUES ('9', '4', 'mike', '13917441004', null, null, null, null, '99', '2015-07-29 14:44:46', '2015-07-29 14:45:47');
INSERT INTO `havana_profile` VALUES ('10', '5', 'mike', '13917441005', null, null, null, null, '99', '2015-07-29 14:45:57', '2015-07-29 17:47:13');
INSERT INTO `havana_profile` VALUES ('70', '62', '你了', '13917441001', null, null, null, null, '10', '2015-07-30 01:31:47', '2015-07-30 01:31:47');

-- ----------------------------
-- Table structure for havana_setting
-- ----------------------------
DROP TABLE IF EXISTS `havana_setting`;
CREATE TABLE `havana_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  `udate` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of havana_setting
-- ----------------------------
INSERT INTO `havana_setting` VALUES ('1', 'access_token', 'iIGTCfE_z8FUTebvp5klMGsvNT20BuOmX-iZWJiyW1Q-SUs4S6uR4P5aHTJ9M67iSc-FHsuC10qtgUhdJGrzJRF5Po1_l3ocgl2xpkZB_T8', '1', '1438946636');
INSERT INTO `havana_setting` VALUES ('2', 'jsapi_ticket', 'bxLdikRXVbTPdHSM05e5uzkPP-hGKQp_10Ct9fdbLNkq2j05Bqmh9SEaZPrVdgE0Q01x3HhsX7jDQZ4RpQzczw', '1', '1438946636');

-- ----------------------------
-- Table structure for havana_share
-- ----------------------------
DROP TABLE IF EXISTS `havana_share`;
CREATE TABLE `havana_share` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标识',
  `uid` int(11) DEFAULT NULL COMMENT '用户id',
  `cid` int(11) DEFAULT NULL COMMENT '采集记录id',
  `sid` int(11) DEFAULT NULL COMMENT '分享记录id',
  `url` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `memo` text COLLATE utf8_unicode_ci COMMENT '说明',
  `status` int(11) DEFAULT '10' COMMENT '状态',
  `type` int(11) DEFAULT '10' COMMENT '类别',
  `cdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of havana_share
-- ----------------------------

-- ----------------------------
-- Table structure for havana_user
-- ----------------------------
DROP TABLE IF EXISTS `havana_user`;
CREATE TABLE `havana_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '密码',
  `levels` int(11) DEFAULT '1' COMMENT '用户组',
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '姓名',
  `sex` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '性别',
  `phone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '手机',
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `memo` text COLLATE utf8_unicode_ci COMMENT '备注',
  `headimgurl` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '头像URL',
  `iswechat` int(11) DEFAULT '0' COMMENT '是否已拉到用户信息',
  `status` int(11) DEFAULT '10' COMMENT '状态',
  `cdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录时间',
  PRIMARY KEY (`id`),
  KEY `openid` (`openid`),
  KEY `levels` (`levels`)
) ENGINE=MyISAM AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of havana_user
-- ----------------------------
INSERT INTO `havana_user` VALUES ('1', 'admin', 'admin', '123', '99', 'admin', null, null, null, null, null, '0', '10', '2015-06-04 09:33:52');
INSERT INTO `havana_user` VALUES ('2', 'ozv8xs8uLTgD75JBcQHgrWMx0xcM', 'username_1437456585', '1437456585', '20', 'name_1437456585', null, null, null, null, null, '0', '10', '2015-07-21 05:29:45');
INSERT INTO `havana_user` VALUES ('74', 'oU4rns4bpOsMiYcsXc9hoemASc20', 'username_1438168669', '1438168669', '20', 'Journey', '2', null, null, null, 'http://wx.qlogo.cn/mmopen/9k0or0gRKt3kMsK9p8Hx4FqibKeFI8JRPzJgCjC4C9QUtgMl05EQfbZ6pYZtUg4dL59qhADB2DaD7xgiclqcETaU4qGN95l41E/0', '1', '10', '2015-07-29 11:17:49');
INSERT INTO `havana_user` VALUES ('73', 'oU4rns_4zSmDsJanYO3WRHAHyLRA', 'username_1438153905', '1438153905', '20', '辰', '1', null, null, null, 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBka8GtHbdZJjVjLl3PGXoFDcWp2qVABwJ0eIN5LVibmmUUgwRwHSBgjjibzoBIyCG0BbsgoWtP8E3g/0', '1', '10', '2015-07-29 07:11:45');
INSERT INTO `havana_user` VALUES ('72', 'oU4rns1dQ6RpwklOo4MCIwQm21uI', 'username_1438149988', '1438149988', '20', 'name_1438149988', null, null, null, null, null, '0', '10', '2015-07-29 06:06:28');
INSERT INTO `havana_user` VALUES ('71', 'oU4rns7K7ckL5KIDlBvo8wG6fq-E', 'username_1438149751', '1438149751', '20', 'name_1438149751', null, null, null, null, null, '0', '10', '2015-07-29 06:02:31');
INSERT INTO `havana_user` VALUES ('70', 'oU4rns641v7oCclmLG8ugLJg43TI', 'username_1438148538', '1438148538', '20', 'name_1438148538', null, null, null, null, null, '0', '10', '2015-07-29 05:42:18');
INSERT INTO `havana_user` VALUES ('69', 'oU4rnsyysbOqc5ujK6C24THMYG8A', 'username_1438138514', '1438138514', '20', 'name_1438138514', null, null, null, null, null, '0', '10', '2015-07-29 02:55:14');
INSERT INTO `havana_user` VALUES ('68', 'oU4rns9QHxXve9ZH0zm0LgNeLBYk', 'username_1438137816', '1438137816', '20', 'name_1438137816', null, null, null, null, null, '0', '10', '2015-07-29 02:43:36');
INSERT INTO `havana_user` VALUES ('67', 'oU4rns3LZdCfDENhUkP_IEoN77Rs', 'username_1438136134', '1438136134', '20', 'name_1438136134', null, null, null, null, null, '0', '10', '2015-07-29 02:15:34');
INSERT INTO `havana_user` VALUES ('66', 'oU4rnsx8ZyNeey0fAm59EmroRGfA', 'username_1438135194', '1438135194', '20', 'name_1438135194', null, null, null, null, null, '0', '10', '2015-07-29 01:59:54');
INSERT INTO `havana_user` VALUES ('65', 'oU4rns75OAraVNukgDflUsV6uHfA', 'username_1438135143', '1438135143', '20', 'name_1438135143', null, null, null, null, null, '0', '10', '2015-07-29 01:59:03');
INSERT INTO `havana_user` VALUES ('64', 'oU4rnswXtHwOyDn0my-uHBBDuC_Q', 'username_1438134792', '1438134792', '20', 'name_1438134792', null, null, null, null, null, '0', '10', '2015-07-29 01:53:12');
INSERT INTO `havana_user` VALUES ('63', 'oU4rnsx7uIC_fif9x-3WNMtuyJt4', 'username_1438134703', '1438134703', '20', 'name_1438134703', null, null, null, null, null, '0', '10', '2015-07-29 01:51:43');
INSERT INTO `havana_user` VALUES ('62', 'oU4rns4ADM62z5qkDyLrWdymAkCw', 'username_1438133946', '1438133946', '20', 'name_1438133946', null, null, null, null, null, '0', '10', '2015-07-29 01:39:06');
INSERT INTO `havana_user` VALUES ('61', 'oU4rns-Vk4zQBfPEc-UNkG6BEKSA', 'username_1438133756', '1438133756', '20', 'name_1438133756', null, null, null, null, null, '0', '10', '2015-07-29 01:35:56');
INSERT INTO `havana_user` VALUES ('60', 'ozv8xs0MM4R9QmFcaJ-ASba6lidY', 'username_1438063332', '1438063332', '20', 'name_1438063332', null, null, null, null, null, '0', '10', '2015-07-28 06:02:12');
INSERT INTO `havana_user` VALUES ('59', 'ozv8xs1gccFV661A13wHtJqyJlD8', 'username_1438054405', '1438054405', '20', 'name_1438054405', null, null, null, null, null, '0', '10', '2015-07-28 03:33:25');
INSERT INTO `havana_user` VALUES ('58', 'ozv8xs1BiiW_Oxs9Jeh_tG6WEw0w', 'username_1438052384', '1438052384', '20', 'name_1438052384', null, null, null, null, null, '0', '10', '2015-07-28 02:59:44');
INSERT INTO `havana_user` VALUES ('57', 'ozv8xs72nDU5UgtG1pWARRnmFyHE', 'username_1438049403', '1438049403', '20', 'Journey', '2', null, null, null, 'http://wx.qlogo.cn/mmopen/buVat8qxPwicVnYGGVlP2EQyTlYFibxYbp3zDFZAqrlTibH3Utt8pQYOvFQsspuiaibFoq8wvobTcia5dZPaCFgCOEH37evtDx8EVF/0', '1', '10', '2015-07-28 02:10:03');
INSERT INTO `havana_user` VALUES ('56', 'ozv8xs6FVz8kuZquBSqQw3MRTHGE', 'username_1438047914', '1438047914', '20', 'name_1438047914', null, null, null, null, null, '0', '10', '2015-07-28 01:45:14');
INSERT INTO `havana_user` VALUES ('55', 'ozv8xs5neXlT95I9-oq0qzCeTXk4', 'username_1438047407', '1438047407', '20', 'name_1438047407', null, null, null, null, null, '0', '10', '2015-07-28 01:36:47');
INSERT INTO `havana_user` VALUES ('54', 'ozv8xsyEYak8i0PywHJzSgJh2c2U', 'username_1438007757', '1438007757', '20', 'name_1438007757', null, null, null, null, null, '0', '10', '2015-07-27 14:35:57');
INSERT INTO `havana_user` VALUES ('53', 'ozv8xs13pjQISL-vS4TYhwdj1fV4', 'username_1438004618', '1438004618', '20', 'name_1438004618', null, null, null, null, null, '0', '10', '2015-07-27 13:43:38');
INSERT INTO `havana_user` VALUES ('52', 'ozv8xsxC49Ye6p9ezvTfUSzZMPIg', 'username_1438001360', '1438001360', '20', 'name_1438001360', null, null, null, null, null, '0', '10', '2015-07-27 12:49:20');
INSERT INTO `havana_user` VALUES ('51', 'ozv8xsyYXPpNABN6b__fgMVrjCyg', 'username_1438000238', '1438000238', '20', 'name_1438000238', null, null, null, null, null, '0', '10', '2015-07-27 12:30:38');
INSERT INTO `havana_user` VALUES ('50', 'ozv8xs_iRH8kwOC5JZ1UguTykPEY', 'username_1437999296', '1437999296', '20', 'name_1437999296', null, null, null, null, null, '0', '10', '2015-07-27 12:14:56');

-- ----------------------------
-- Table structure for havana_usergroup
-- ----------------------------
DROP TABLE IF EXISTS `havana_usergroup`;
CREATE TABLE `havana_usergroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `levels` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `memo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `functions` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of havana_usergroup
-- ----------------------------
INSERT INTO `havana_usergroup` VALUES ('1', 'admin', '99', '1', null, null);
INSERT INTO `havana_usergroup` VALUES ('2', '后台用户', '10', '1', null, null);
INSERT INTO `havana_usergroup` VALUES ('3', '微信用户', '20', '1', null, null);
