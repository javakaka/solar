/*
Navicat MySQL Data Transfer

Source Server         : 本机MYSQL
Source Server Version : 50532
Source Host           : localhost:3306
Source Database       : fangzubao

Target Server Type    : MYSQL
Target Server Version : 50532
File Encoding         : 65001

Date: 2015-01-18 13:46:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `common_city`
-- ----------------------------
DROP TABLE IF EXISTS `common_city`;
CREATE TABLE `common_city` (
  `id` int(11) NOT NULL,
  `code` varchar(6) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `provinceId` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL COMMENT '0停用1启用',
  PRIMARY KEY (`id`),
  KEY `FK_CITY_PROVINCE` (`provinceId`),
  CONSTRAINT `FK_CITY_PROVINCE` FOREIGN KEY (`provinceId`) REFERENCES `common_province` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of common_city
-- ----------------------------
INSERT INTO `common_city` VALUES ('1', '320500', '苏州市', '1', '0');
INSERT INTO `common_city` VALUES ('5', '130100', '石家庄市', '3', '0');
INSERT INTO `common_city` VALUES ('6', '130200', '唐山市', '3', '0');
INSERT INTO `common_city` VALUES ('7', '130300', '秦皇岛市', '3', '0');
INSERT INTO `common_city` VALUES ('8', '130400', '邯郸市', '3', '0');
INSERT INTO `common_city` VALUES ('9', '130500', '邢台市', '3', '0');
INSERT INTO `common_city` VALUES ('10', '130600', '保定市', '3', '0');
INSERT INTO `common_city` VALUES ('11', '130700', '张家口市', '3', '0');
INSERT INTO `common_city` VALUES ('12', '130800', '承德市', '3', '0');
INSERT INTO `common_city` VALUES ('13', '130900', '沧州市', '3', '0');
INSERT INTO `common_city` VALUES ('14', '131000', '廊坊市', '3', '0');
INSERT INTO `common_city` VALUES ('15', '131100', '衡水市', '3', '0');
INSERT INTO `common_city` VALUES ('16', '140100', '太原市', '4', '0');
INSERT INTO `common_city` VALUES ('17', '140200', '大同市', '4', '0');
INSERT INTO `common_city` VALUES ('18', '140300', '阳泉市', '4', '0');
INSERT INTO `common_city` VALUES ('19', '140400', '长治市', '4', '0');
INSERT INTO `common_city` VALUES ('20', '140500', '晋城市', '4', '0');
INSERT INTO `common_city` VALUES ('21', '140600', '朔州市', '4', '0');
INSERT INTO `common_city` VALUES ('22', '140700', '晋中市', '4', '0');
INSERT INTO `common_city` VALUES ('23', '140800', '运城市', '4', '0');
INSERT INTO `common_city` VALUES ('24', '140900', '忻州市', '4', '0');
INSERT INTO `common_city` VALUES ('25', '141000', '临汾市', '4', '0');
INSERT INTO `common_city` VALUES ('26', '141100', '吕梁市', '4', '0');
INSERT INTO `common_city` VALUES ('27', '150100', '呼和浩特市', '5', '0');
INSERT INTO `common_city` VALUES ('28', '150200', '包头市', '5', '0');
INSERT INTO `common_city` VALUES ('29', '150300', '乌海市', '5', '0');
INSERT INTO `common_city` VALUES ('30', '150400', '赤峰市', '5', '0');
INSERT INTO `common_city` VALUES ('31', '150500', '通辽市', '5', '0');
INSERT INTO `common_city` VALUES ('32', '150600', '鄂尔多斯市', '5', '0');
INSERT INTO `common_city` VALUES ('33', '150700', '呼伦贝尔市', '5', '0');
INSERT INTO `common_city` VALUES ('34', '150800', '巴彦淖尔市', '5', '0');
INSERT INTO `common_city` VALUES ('35', '150900', '乌兰察布市', '5', '0');
INSERT INTO `common_city` VALUES ('36', '152200', '兴安盟', '5', '0');
INSERT INTO `common_city` VALUES ('37', '152500', '锡林郭勒盟', '5', '0');
INSERT INTO `common_city` VALUES ('38', '152900', '阿拉善盟', '5', '0');
INSERT INTO `common_city` VALUES ('39', '210100', '沈阳市', '6', '0');
INSERT INTO `common_city` VALUES ('40', '210200', '大连市', '6', '0');
INSERT INTO `common_city` VALUES ('41', '210300', '鞍山市', '6', '0');
INSERT INTO `common_city` VALUES ('42', '210400', '抚顺市', '6', '0');
INSERT INTO `common_city` VALUES ('43', '210500', '本溪市', '6', '0');
INSERT INTO `common_city` VALUES ('44', '210600', '丹东市', '6', '0');
INSERT INTO `common_city` VALUES ('45', '210700', '锦州市', '6', '0');
INSERT INTO `common_city` VALUES ('46', '210800', '营口市', '6', '0');
INSERT INTO `common_city` VALUES ('47', '210900', '阜新市', '6', '0');
INSERT INTO `common_city` VALUES ('48', '211000', '辽阳市', '6', '0');
INSERT INTO `common_city` VALUES ('49', '211100', '盘锦市', '6', '0');
INSERT INTO `common_city` VALUES ('50', '211200', '铁岭市', '6', '0');
INSERT INTO `common_city` VALUES ('51', '211300', '朝阳市', '6', '0');
INSERT INTO `common_city` VALUES ('52', '211400', '葫芦岛市', '6', '0');
INSERT INTO `common_city` VALUES ('53', '220100', '长春市', '7', '0');
INSERT INTO `common_city` VALUES ('54', '220200', '吉林市', '7', '0');
INSERT INTO `common_city` VALUES ('55', '220300', '四平市', '7', '0');
INSERT INTO `common_city` VALUES ('56', '220400', '辽源市', '7', '0');
INSERT INTO `common_city` VALUES ('57', '220500', '通化市', '7', '0');
INSERT INTO `common_city` VALUES ('58', '220600', '白山市', '7', '0');
INSERT INTO `common_city` VALUES ('59', '220700', '松原市', '7', '0');
INSERT INTO `common_city` VALUES ('60', '220800', '白城市', '7', '0');
INSERT INTO `common_city` VALUES ('61', '222400', '延边朝鲜族自治州', '7', '0');
INSERT INTO `common_city` VALUES ('62', '230100', '哈尔滨市', '8', '0');
INSERT INTO `common_city` VALUES ('63', '230200', '齐齐哈尔市', '8', '0');
INSERT INTO `common_city` VALUES ('64', '230300', '鸡西市', '8', '0');
INSERT INTO `common_city` VALUES ('65', '230400', '鹤岗市', '8', '0');
INSERT INTO `common_city` VALUES ('66', '230500', '双鸭山市', '8', '0');
INSERT INTO `common_city` VALUES ('67', '230600', '大庆市', '8', '0');
INSERT INTO `common_city` VALUES ('68', '230700', '伊春市', '8', '0');
INSERT INTO `common_city` VALUES ('69', '230800', '佳木斯市', '8', '0');
INSERT INTO `common_city` VALUES ('70', '230900', '七台河市', '8', '0');
INSERT INTO `common_city` VALUES ('71', '231000', '牡丹江市', '8', '0');
INSERT INTO `common_city` VALUES ('72', '231100', '黑河市', '8', '0');
INSERT INTO `common_city` VALUES ('73', '231200', '绥化市', '8', '0');
INSERT INTO `common_city` VALUES ('74', '232700', '大兴安岭地区', '8', '0');
INSERT INTO `common_city` VALUES ('75', '310100', '市辖区', '9', '0');
INSERT INTO `common_city` VALUES ('76', '310200', '县', '9', '0');
INSERT INTO `common_city` VALUES ('77', '320100', '南京市', '1', '0');
INSERT INTO `common_city` VALUES ('78', '320200', '无锡市', '1', '0');
INSERT INTO `common_city` VALUES ('79', '320300', '徐州市', '1', '0');
INSERT INTO `common_city` VALUES ('80', '320400', '常州市', '1', '0');
INSERT INTO `common_city` VALUES ('81', '110100', '北京市', '10', '0');
INSERT INTO `common_city` VALUES ('82', '320600', '南通市', '1', '0');
INSERT INTO `common_city` VALUES ('83', '320700', '连云港市', '1', '0');
INSERT INTO `common_city` VALUES ('84', '320800', '淮安市', '1', '0');
INSERT INTO `common_city` VALUES ('85', '320900', '盐城市', '1', '0');
INSERT INTO `common_city` VALUES ('86', '321000', '扬州市', '1', '0');
INSERT INTO `common_city` VALUES ('87', '321100', '镇江市', '1', '0');
INSERT INTO `common_city` VALUES ('88', '321200', '泰州市', '1', '0');
INSERT INTO `common_city` VALUES ('89', '321300', '宿迁市', '1', '0');
INSERT INTO `common_city` VALUES ('90', '330100', '杭州市', '11', '0');
INSERT INTO `common_city` VALUES ('91', '330200', '宁波市', '11', '0');
INSERT INTO `common_city` VALUES ('92', '330300', '温州市', '11', '0');
INSERT INTO `common_city` VALUES ('93', '330400', '嘉兴市', '11', '0');
INSERT INTO `common_city` VALUES ('94', '330500', '湖州市', '11', '0');
INSERT INTO `common_city` VALUES ('95', '330600', '绍兴市', '11', '0');
INSERT INTO `common_city` VALUES ('96', '330700', '金华市', '11', '0');
INSERT INTO `common_city` VALUES ('97', '330800', '衢州市', '11', '0');
INSERT INTO `common_city` VALUES ('98', '330900', '舟山市', '11', '0');
INSERT INTO `common_city` VALUES ('99', '331000', '台州市', '11', '0');
INSERT INTO `common_city` VALUES ('100', '331100', '丽水市', '11', '0');
INSERT INTO `common_city` VALUES ('101', '340100', '合肥市', '12', '0');
INSERT INTO `common_city` VALUES ('102', '340200', '芜湖市', '12', '0');
INSERT INTO `common_city` VALUES ('103', '340300', '蚌埠市', '12', '0');
INSERT INTO `common_city` VALUES ('104', '340400', '淮南市', '12', '0');
INSERT INTO `common_city` VALUES ('105', '340500', '马鞍山市', '12', '0');
INSERT INTO `common_city` VALUES ('106', '340600', '淮北市', '12', '0');
INSERT INTO `common_city` VALUES ('107', '340700', '铜陵市', '12', '0');
INSERT INTO `common_city` VALUES ('108', '340800', '安庆市', '12', '0');
INSERT INTO `common_city` VALUES ('109', '341000', '黄山市', '12', '0');
INSERT INTO `common_city` VALUES ('110', '341100', '滁州市', '12', '0');
INSERT INTO `common_city` VALUES ('111', '341200', '阜阳市', '12', '0');
INSERT INTO `common_city` VALUES ('112', '341300', '宿州市', '12', '0');
INSERT INTO `common_city` VALUES ('113', '341400', '巢湖市', '12', '0');
INSERT INTO `common_city` VALUES ('114', '341500', '六安市', '12', '0');
INSERT INTO `common_city` VALUES ('115', '341600', '亳州市', '12', '0');
INSERT INTO `common_city` VALUES ('116', '341700', '池州市', '12', '0');
INSERT INTO `common_city` VALUES ('117', '341800', '宣城市', '12', '0');
INSERT INTO `common_city` VALUES ('118', '350100', '福州市', '13', '0');
INSERT INTO `common_city` VALUES ('119', '350200', '厦门市', '13', '0');
INSERT INTO `common_city` VALUES ('120', '350300', '莆田市', '13', '0');
INSERT INTO `common_city` VALUES ('121', '350400', '三明市', '13', '0');
INSERT INTO `common_city` VALUES ('122', '350500', '泉州市', '13', '0');
INSERT INTO `common_city` VALUES ('123', '350600', '漳州市', '13', '0');
INSERT INTO `common_city` VALUES ('124', '350700', '南平市', '13', '0');
INSERT INTO `common_city` VALUES ('125', '350800', '龙岩市', '13', '0');
INSERT INTO `common_city` VALUES ('126', '350900', '宁德市', '13', '0');
INSERT INTO `common_city` VALUES ('127', '360100', '南昌市', '14', '0');
INSERT INTO `common_city` VALUES ('128', '360200', '景德镇市', '14', '0');
INSERT INTO `common_city` VALUES ('129', '360300', '萍乡市', '14', '0');
INSERT INTO `common_city` VALUES ('130', '360400', '九江市', '14', '0');
INSERT INTO `common_city` VALUES ('131', '360500', '新余市', '14', '0');
INSERT INTO `common_city` VALUES ('132', '360600', '鹰潭市', '14', '0');
INSERT INTO `common_city` VALUES ('133', '360700', '赣州市', '14', '0');
INSERT INTO `common_city` VALUES ('134', '360800', '吉安市', '14', '0');
INSERT INTO `common_city` VALUES ('135', '360900', '宜春市', '14', '0');
INSERT INTO `common_city` VALUES ('136', '361000', '抚州市', '14', '0');
INSERT INTO `common_city` VALUES ('137', '361100', '上饶市', '14', '0');
INSERT INTO `common_city` VALUES ('138', '370100', '济南市', '15', '0');
INSERT INTO `common_city` VALUES ('139', '370200', '青岛市', '15', '0');
INSERT INTO `common_city` VALUES ('140', '370300', '淄博市', '15', '0');
INSERT INTO `common_city` VALUES ('141', '370400', '枣庄市', '15', '0');
INSERT INTO `common_city` VALUES ('142', '370500', '东营市', '15', '0');
INSERT INTO `common_city` VALUES ('143', '370600', '烟台市', '15', '0');
INSERT INTO `common_city` VALUES ('144', '370700', '潍坊市', '15', '0');
INSERT INTO `common_city` VALUES ('145', '370800', '济宁市', '15', '0');
INSERT INTO `common_city` VALUES ('146', '370900', '泰安市', '15', '0');
INSERT INTO `common_city` VALUES ('147', '371000', '威海市', '15', '0');
INSERT INTO `common_city` VALUES ('148', '371100', '日照市', '15', '0');
INSERT INTO `common_city` VALUES ('149', '371200', '莱芜市', '15', '0');
INSERT INTO `common_city` VALUES ('150', '371300', '临沂市', '15', '0');
INSERT INTO `common_city` VALUES ('151', '371400', '德州市', '15', '0');
INSERT INTO `common_city` VALUES ('152', '371500', '聊城市', '15', '0');
INSERT INTO `common_city` VALUES ('153', '371600', '滨州市', '15', '0');
INSERT INTO `common_city` VALUES ('154', '371700', '荷泽市', '15', '0');
INSERT INTO `common_city` VALUES ('155', '410100', '郑州市', '16', '0');
INSERT INTO `common_city` VALUES ('156', '410200', '开封市', '16', '0');
INSERT INTO `common_city` VALUES ('157', '410300', '洛阳市', '16', '0');
INSERT INTO `common_city` VALUES ('158', '410400', '平顶山市', '16', '0');
INSERT INTO `common_city` VALUES ('159', '410500', '安阳市', '16', '0');
INSERT INTO `common_city` VALUES ('160', '410600', '鹤壁市', '16', '0');
INSERT INTO `common_city` VALUES ('161', '410700', '新乡市', '16', '0');
INSERT INTO `common_city` VALUES ('162', '410800', '焦作市', '16', '0');
INSERT INTO `common_city` VALUES ('163', '410900', '濮阳市', '16', '0');
INSERT INTO `common_city` VALUES ('164', '411000', '许昌市', '16', '0');
INSERT INTO `common_city` VALUES ('165', '411100', '漯河市', '16', '0');
INSERT INTO `common_city` VALUES ('166', '411200', '三门峡市', '16', '0');
INSERT INTO `common_city` VALUES ('167', '411300', '南阳市', '16', '0');
INSERT INTO `common_city` VALUES ('168', '411400', '商丘市', '16', '0');
INSERT INTO `common_city` VALUES ('169', '411500', '信阳市', '16', '0');
INSERT INTO `common_city` VALUES ('170', '411600', '周口市', '16', '0');
INSERT INTO `common_city` VALUES ('171', '411700', '驻马店市', '16', '0');
INSERT INTO `common_city` VALUES ('172', '420100', '武汉市', '17', '0');
INSERT INTO `common_city` VALUES ('173', '420200', '黄石市', '17', '0');
INSERT INTO `common_city` VALUES ('174', '420300', '十堰市', '17', '0');
INSERT INTO `common_city` VALUES ('175', '420500', '宜昌市', '17', '0');
INSERT INTO `common_city` VALUES ('176', '420600', '襄樊市', '17', '0');
INSERT INTO `common_city` VALUES ('177', '420700', '鄂州市', '17', '0');
INSERT INTO `common_city` VALUES ('178', '420800', '荆门市', '17', '0');
INSERT INTO `common_city` VALUES ('179', '420900', '孝感市', '17', '0');
INSERT INTO `common_city` VALUES ('180', '421000', '荆州市', '17', '0');
INSERT INTO `common_city` VALUES ('181', '421100', '黄冈市', '17', '0');
INSERT INTO `common_city` VALUES ('182', '421200', '咸宁市', '17', '0');
INSERT INTO `common_city` VALUES ('183', '421300', '随州市', '17', '0');
INSERT INTO `common_city` VALUES ('184', '422800', '恩施土家族苗族自治州', '17', '0');
INSERT INTO `common_city` VALUES ('185', '429000', '省直辖行政单位', '17', '0');
INSERT INTO `common_city` VALUES ('186', '430100', '长沙市', '18', '0');
INSERT INTO `common_city` VALUES ('187', '430200', '株洲市', '18', '0');
INSERT INTO `common_city` VALUES ('188', '430300', '湘潭市', '18', '0');
INSERT INTO `common_city` VALUES ('189', '430400', '衡阳市', '18', '0');
INSERT INTO `common_city` VALUES ('190', '430500', '邵阳市', '18', '0');
INSERT INTO `common_city` VALUES ('191', '430600', '岳阳市', '18', '0');
INSERT INTO `common_city` VALUES ('192', '430700', '常德市', '18', '0');
INSERT INTO `common_city` VALUES ('193', '430800', '张家界市', '18', '0');
INSERT INTO `common_city` VALUES ('194', '430900', '益阳市', '18', '0');
INSERT INTO `common_city` VALUES ('195', '431000', '郴州市', '18', '0');
INSERT INTO `common_city` VALUES ('196', '431100', '永州市', '18', '0');
INSERT INTO `common_city` VALUES ('197', '431200', '怀化市', '18', '0');
INSERT INTO `common_city` VALUES ('198', '431300', '娄底市', '18', '0');
INSERT INTO `common_city` VALUES ('199', '433100', '湘西土家族苗族自治州', '18', '0');
INSERT INTO `common_city` VALUES ('200', '440100', '广州市', '19', '0');
INSERT INTO `common_city` VALUES ('201', '440200', '韶关市', '19', '0');
INSERT INTO `common_city` VALUES ('202', '440300', '深圳市', '19', '1');
INSERT INTO `common_city` VALUES ('203', '440400', '珠海市', '19', '0');
INSERT INTO `common_city` VALUES ('204', '440500', '汕头市', '19', '0');
INSERT INTO `common_city` VALUES ('205', '440600', '佛山市', '19', '0');
INSERT INTO `common_city` VALUES ('206', '440700', '江门市', '19', '0');
INSERT INTO `common_city` VALUES ('207', '440800', '湛江市', '19', '0');
INSERT INTO `common_city` VALUES ('208', '440900', '茂名市', '19', '0');
INSERT INTO `common_city` VALUES ('209', '441200', '肇庆市', '19', '0');
INSERT INTO `common_city` VALUES ('210', '441300', '惠州市', '19', '0');
INSERT INTO `common_city` VALUES ('211', '441400', '梅州市', '19', '0');
INSERT INTO `common_city` VALUES ('212', '441500', '汕尾市', '19', '0');
INSERT INTO `common_city` VALUES ('213', '441600', '河源市', '19', '0');
INSERT INTO `common_city` VALUES ('214', '441700', '阳江市', '19', '0');
INSERT INTO `common_city` VALUES ('215', '441800', '清远市', '19', '0');
INSERT INTO `common_city` VALUES ('216', '441900', '东莞市', '19', '0');
INSERT INTO `common_city` VALUES ('217', '442000', '中山市', '19', '0');
INSERT INTO `common_city` VALUES ('218', '445100', '潮州市', '19', '0');
INSERT INTO `common_city` VALUES ('219', '445200', '揭阳市', '19', '0');
INSERT INTO `common_city` VALUES ('220', '445300', '云浮市', '19', '0');
INSERT INTO `common_city` VALUES ('221', '450100', '南宁市', '20', '0');
INSERT INTO `common_city` VALUES ('222', '450200', '柳州市', '20', '0');
INSERT INTO `common_city` VALUES ('223', '450300', '桂林市', '20', '0');
INSERT INTO `common_city` VALUES ('224', '450400', '梧州市', '20', '0');
INSERT INTO `common_city` VALUES ('225', '450500', '北海市', '20', '0');
INSERT INTO `common_city` VALUES ('226', '450600', '防城港市', '20', '0');
INSERT INTO `common_city` VALUES ('227', '450700', '钦州市', '20', '0');
INSERT INTO `common_city` VALUES ('228', '450800', '贵港市', '20', '0');
INSERT INTO `common_city` VALUES ('229', '450900', '玉林市', '20', '0');
INSERT INTO `common_city` VALUES ('230', '451000', '百色市', '20', '0');
INSERT INTO `common_city` VALUES ('231', '451100', '贺州市', '20', '0');
INSERT INTO `common_city` VALUES ('232', '451200', '河池市', '20', '0');
INSERT INTO `common_city` VALUES ('233', '451300', '来宾市', '20', '0');
INSERT INTO `common_city` VALUES ('234', '451400', '崇左市', '20', '0');
INSERT INTO `common_city` VALUES ('235', '460100', '海口市', '21', '0');
INSERT INTO `common_city` VALUES ('236', '460200', '三亚市', '21', '0');
INSERT INTO `common_city` VALUES ('237', '469000', '省直辖县级行政单位', '21', '0');
INSERT INTO `common_city` VALUES ('238', '500100', '市辖区', '22', '0');
INSERT INTO `common_city` VALUES ('239', '500200', '县', '22', '0');
INSERT INTO `common_city` VALUES ('240', '500300', '市', '22', '0');
INSERT INTO `common_city` VALUES ('241', '510100', '成都市', '23', '0');
INSERT INTO `common_city` VALUES ('242', '510300', '自贡市', '23', '0');
INSERT INTO `common_city` VALUES ('243', '510400', '攀枝花市', '23', '0');
INSERT INTO `common_city` VALUES ('244', '510500', '泸州市', '23', '0');
INSERT INTO `common_city` VALUES ('245', '510600', '德阳市', '23', '0');
INSERT INTO `common_city` VALUES ('246', '510700', '绵阳市', '23', '0');
INSERT INTO `common_city` VALUES ('247', '510800', '广元市', '23', '0');
INSERT INTO `common_city` VALUES ('248', '510900', '遂宁市', '23', '0');
INSERT INTO `common_city` VALUES ('249', '511000', '内江市', '23', '0');
INSERT INTO `common_city` VALUES ('250', '511100', '乐山市', '23', '0');
INSERT INTO `common_city` VALUES ('251', '511300', '南充市', '23', '0');
INSERT INTO `common_city` VALUES ('252', '511400', '眉山市', '23', '0');
INSERT INTO `common_city` VALUES ('253', '511500', '宜宾市', '23', '0');
INSERT INTO `common_city` VALUES ('254', '511600', '广安市', '23', '0');
INSERT INTO `common_city` VALUES ('255', '511700', '达州市', '23', '0');
INSERT INTO `common_city` VALUES ('256', '511800', '雅安市', '23', '0');
INSERT INTO `common_city` VALUES ('257', '511900', '巴中市', '23', '0');
INSERT INTO `common_city` VALUES ('258', '512000', '资阳市', '23', '0');
INSERT INTO `common_city` VALUES ('259', '513200', '阿坝藏族羌族自治州', '23', '0');
INSERT INTO `common_city` VALUES ('260', '513300', '甘孜藏族自治州', '23', '0');
INSERT INTO `common_city` VALUES ('261', '513400', '凉山彝族自治州', '23', '0');
INSERT INTO `common_city` VALUES ('262', '520100', '贵阳市', '24', '0');
INSERT INTO `common_city` VALUES ('263', '520200', '六盘水市', '24', '0');
INSERT INTO `common_city` VALUES ('264', '520300', '遵义市', '24', '0');
INSERT INTO `common_city` VALUES ('265', '520400', '安顺市', '24', '0');
INSERT INTO `common_city` VALUES ('266', '522200', '铜仁地区', '24', '0');
INSERT INTO `common_city` VALUES ('267', '522300', '黔西南布依族苗族自治州', '24', '0');
INSERT INTO `common_city` VALUES ('268', '522400', '毕节地区', '24', '0');
INSERT INTO `common_city` VALUES ('269', '522600', '黔东南苗族侗族自治州', '24', '0');
INSERT INTO `common_city` VALUES ('270', '522700', '黔南布依族苗族自治州', '24', '0');
INSERT INTO `common_city` VALUES ('271', '530100', '昆明市', '25', '0');
INSERT INTO `common_city` VALUES ('272', '530300', '曲靖市', '25', '0');
INSERT INTO `common_city` VALUES ('273', '530400', '玉溪市', '25', '0');
INSERT INTO `common_city` VALUES ('274', '530500', '保山市', '25', '0');
INSERT INTO `common_city` VALUES ('275', '530600', '昭通市', '25', '0');
INSERT INTO `common_city` VALUES ('276', '530700', '丽江市', '25', '0');
INSERT INTO `common_city` VALUES ('277', '530800', '思茅市', '25', '0');
INSERT INTO `common_city` VALUES ('278', '530900', '临沧市', '25', '0');
INSERT INTO `common_city` VALUES ('279', '532300', '楚雄彝族自治州', '25', '0');
INSERT INTO `common_city` VALUES ('280', '532500', '红河哈尼族彝族自治州', '25', '0');
INSERT INTO `common_city` VALUES ('281', '532600', '文山壮族苗族自治州', '25', '0');
INSERT INTO `common_city` VALUES ('282', '532800', '西双版纳傣族自治州', '25', '0');
INSERT INTO `common_city` VALUES ('283', '532900', '大理白族自治州', '25', '0');
INSERT INTO `common_city` VALUES ('284', '533100', '德宏傣族景颇族自治州', '25', '0');
INSERT INTO `common_city` VALUES ('285', '533300', '怒江傈僳族自治州', '25', '0');
INSERT INTO `common_city` VALUES ('286', '533400', '迪庆藏族自治州', '25', '0');
INSERT INTO `common_city` VALUES ('287', '540100', '拉萨市', '26', '0');
INSERT INTO `common_city` VALUES ('288', '542100', '昌都地区', '26', '0');
INSERT INTO `common_city` VALUES ('289', '542200', '山南地区', '26', '0');
INSERT INTO `common_city` VALUES ('290', '542300', '日喀则地区', '26', '0');
INSERT INTO `common_city` VALUES ('291', '542400', '那曲地区', '26', '0');
INSERT INTO `common_city` VALUES ('292', '542500', '阿里地区', '26', '0');
INSERT INTO `common_city` VALUES ('293', '542600', '林芝地区', '26', '0');
INSERT INTO `common_city` VALUES ('294', '610100', '西安市', '27', '0');
INSERT INTO `common_city` VALUES ('295', '610200', '铜川市', '27', '0');
INSERT INTO `common_city` VALUES ('296', '610300', '宝鸡市', '27', '0');
INSERT INTO `common_city` VALUES ('297', '610400', '咸阳市', '27', '0');
INSERT INTO `common_city` VALUES ('298', '610500', '渭南市', '27', '0');
INSERT INTO `common_city` VALUES ('299', '610600', '延安市', '27', '0');
INSERT INTO `common_city` VALUES ('300', '610700', '汉中市', '27', '0');
INSERT INTO `common_city` VALUES ('301', '610800', '榆林市', '27', '0');
INSERT INTO `common_city` VALUES ('302', '610900', '安康市', '27', '0');
INSERT INTO `common_city` VALUES ('303', '611000', '商洛市', '27', '0');
INSERT INTO `common_city` VALUES ('304', '620100', '兰州市', '28', '0');
INSERT INTO `common_city` VALUES ('305', '620200', '嘉峪关市', '28', '0');
INSERT INTO `common_city` VALUES ('306', '620300', '金昌市', '28', '0');
INSERT INTO `common_city` VALUES ('307', '620400', '白银市', '28', '0');
INSERT INTO `common_city` VALUES ('308', '620500', '天水市', '28', '0');
INSERT INTO `common_city` VALUES ('309', '620600', '武威市', '28', '0');
INSERT INTO `common_city` VALUES ('310', '620700', '张掖市', '28', '0');
INSERT INTO `common_city` VALUES ('311', '620800', '平凉市', '28', '0');
INSERT INTO `common_city` VALUES ('312', '620900', '酒泉市', '28', '0');
INSERT INTO `common_city` VALUES ('313', '621000', '庆阳市', '28', '0');
INSERT INTO `common_city` VALUES ('314', '621100', '定西市', '28', '0');
INSERT INTO `common_city` VALUES ('315', '621200', '陇南市', '28', '0');
INSERT INTO `common_city` VALUES ('316', '622900', '临夏回族自治州', '28', '0');
INSERT INTO `common_city` VALUES ('317', '623000', '甘南藏族自治州', '28', '0');
INSERT INTO `common_city` VALUES ('318', '630100', '西宁市', '29', '0');
INSERT INTO `common_city` VALUES ('319', '632100', '海东地区', '29', '0');
INSERT INTO `common_city` VALUES ('320', '632200', '海北藏族自治州', '29', '0');
INSERT INTO `common_city` VALUES ('321', '632300', '黄南藏族自治州', '29', '0');
INSERT INTO `common_city` VALUES ('322', '632500', '海南藏族自治州', '29', '0');
INSERT INTO `common_city` VALUES ('323', '632600', '果洛藏族自治州', '29', '0');
INSERT INTO `common_city` VALUES ('324', '632700', '玉树藏族自治州', '29', '0');
INSERT INTO `common_city` VALUES ('325', '632800', '海西蒙古族藏族自治州', '29', '0');
INSERT INTO `common_city` VALUES ('326', '640100', '银川市', '30', '0');
INSERT INTO `common_city` VALUES ('327', '640200', '石嘴山市', '30', '0');
INSERT INTO `common_city` VALUES ('328', '640300', '吴忠市', '30', '0');
INSERT INTO `common_city` VALUES ('329', '640400', '固原市', '30', '0');
INSERT INTO `common_city` VALUES ('330', '640500', '中卫市', '30', '0');
INSERT INTO `common_city` VALUES ('331', '650100', '乌鲁木齐市', '31', '0');
INSERT INTO `common_city` VALUES ('332', '650200', '克拉玛依市', '31', '0');
INSERT INTO `common_city` VALUES ('333', '652100', '吐鲁番地区', '31', '0');
INSERT INTO `common_city` VALUES ('334', '652200', '哈密地区', '31', '0');
INSERT INTO `common_city` VALUES ('335', '652300', '昌吉回族自治州', '31', '0');
INSERT INTO `common_city` VALUES ('336', '652700', '博尔塔拉蒙古自治州', '31', '0');
INSERT INTO `common_city` VALUES ('337', '652800', '巴音郭楞蒙古自治州', '31', '0');
INSERT INTO `common_city` VALUES ('338', '652900', '阿克苏地区', '31', '0');
INSERT INTO `common_city` VALUES ('339', '653000', '克孜勒苏柯尔克孜自治州', '31', '0');
INSERT INTO `common_city` VALUES ('340', '653100', '喀什地区', '31', '0');
INSERT INTO `common_city` VALUES ('341', '653200', '和田地区', '31', '0');
INSERT INTO `common_city` VALUES ('342', '654000', '伊犁哈萨克自治州', '31', '0');
INSERT INTO `common_city` VALUES ('343', '654200', '塔城地区', '31', '0');
INSERT INTO `common_city` VALUES ('344', '654300', '阿勒泰地区', '31', '0');
INSERT INTO `common_city` VALUES ('345', '659000', '省直辖行政单位', '31', '0');

-- ----------------------------
-- Table structure for `common_city_zone`
-- ----------------------------
DROP TABLE IF EXISTS `common_city_zone`;
CREATE TABLE `common_city_zone` (
  `id` int(11) NOT NULL,
  `code` varchar(6) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `cityId` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL COMMENT '0停用1启用',
  PRIMARY KEY (`id`),
  KEY `FK_AREA_CITY` (`cityId`),
  CONSTRAINT `FK_AREA_CITY` FOREIGN KEY (`cityId`) REFERENCES `common_city` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of common_city_zone
-- ----------------------------
INSERT INTO `common_city_zone` VALUES ('1', '320501', '市辖区', '1', '0');
INSERT INTO `common_city_zone` VALUES ('2', '110102', '西城区', '81', '0');
INSERT INTO `common_city_zone` VALUES ('3', '110103', '崇文区', '81', '0');
INSERT INTO `common_city_zone` VALUES ('4', '110104', '宣武区', '81', '0');
INSERT INTO `common_city_zone` VALUES ('5', '110105', '朝阳区', '81', '0');
INSERT INTO `common_city_zone` VALUES ('6', '110106', '丰台区', '81', '0');
INSERT INTO `common_city_zone` VALUES ('7', '110107', '石景山区', '81', '0');
INSERT INTO `common_city_zone` VALUES ('8', '110108', '海淀区', '81', '0');
INSERT INTO `common_city_zone` VALUES ('9', '110109', '门头沟区', '81', '0');
INSERT INTO `common_city_zone` VALUES ('10', '110111', '房山区', '81', '0');
INSERT INTO `common_city_zone` VALUES ('11', '110112', '通州区', '81', '0');
INSERT INTO `common_city_zone` VALUES ('12', '110113', '顺义区', '81', '0');
INSERT INTO `common_city_zone` VALUES ('13', '110114', '昌平区', '81', '0');
INSERT INTO `common_city_zone` VALUES ('14', '110115', '大兴区', '81', '0');
INSERT INTO `common_city_zone` VALUES ('15', '110116', '怀柔区', '81', '0');
INSERT INTO `common_city_zone` VALUES ('16', '110117', '平谷区', '81', '0');
INSERT INTO `common_city_zone` VALUES ('17', '110228', '密云县', null, null);
INSERT INTO `common_city_zone` VALUES ('18', '110229', '延庆县', null, null);
INSERT INTO `common_city_zone` VALUES ('19', '120101', '和平区', null, null);
INSERT INTO `common_city_zone` VALUES ('20', '120102', '河东区', null, null);
INSERT INTO `common_city_zone` VALUES ('21', '120103', '河西区', null, null);
INSERT INTO `common_city_zone` VALUES ('22', '120104', '南开区', null, null);
INSERT INTO `common_city_zone` VALUES ('23', '120105', '河北区', null, null);
INSERT INTO `common_city_zone` VALUES ('24', '120106', '红桥区', null, null);
INSERT INTO `common_city_zone` VALUES ('25', '120107', '塘沽区', null, null);
INSERT INTO `common_city_zone` VALUES ('26', '120108', '汉沽区', null, null);
INSERT INTO `common_city_zone` VALUES ('27', '120109', '大港区', null, null);
INSERT INTO `common_city_zone` VALUES ('28', '120110', '东丽区', null, null);
INSERT INTO `common_city_zone` VALUES ('29', '120111', '西青区', null, null);
INSERT INTO `common_city_zone` VALUES ('30', '120112', '津南区', null, null);
INSERT INTO `common_city_zone` VALUES ('31', '120113', '北辰区', null, null);
INSERT INTO `common_city_zone` VALUES ('32', '120114', '武清区', null, null);
INSERT INTO `common_city_zone` VALUES ('33', '120115', '宝坻区', null, null);
INSERT INTO `common_city_zone` VALUES ('34', '120221', '宁河县', null, null);
INSERT INTO `common_city_zone` VALUES ('35', '120223', '静海县', null, null);
INSERT INTO `common_city_zone` VALUES ('36', '120225', '蓟　县', null, null);
INSERT INTO `common_city_zone` VALUES ('37', '130101', '市辖区', '5', '0');
INSERT INTO `common_city_zone` VALUES ('38', '130102', '长安区', '5', '0');
INSERT INTO `common_city_zone` VALUES ('39', '130103', '桥东区', '5', '0');
INSERT INTO `common_city_zone` VALUES ('40', '130104', '桥西区', '5', '0');
INSERT INTO `common_city_zone` VALUES ('41', '130105', '新华区', '5', '0');
INSERT INTO `common_city_zone` VALUES ('42', '130107', '井陉矿区', '5', '0');
INSERT INTO `common_city_zone` VALUES ('43', '130108', '裕华区', '5', '0');
INSERT INTO `common_city_zone` VALUES ('44', '130121', '井陉县', '5', '0');
INSERT INTO `common_city_zone` VALUES ('45', '130123', '正定县', '5', '0');
INSERT INTO `common_city_zone` VALUES ('46', '130124', '栾城县', '5', '0');
INSERT INTO `common_city_zone` VALUES ('47', '130125', '行唐县', '5', '0');
INSERT INTO `common_city_zone` VALUES ('48', '130126', '灵寿县', '5', '0');
INSERT INTO `common_city_zone` VALUES ('49', '130127', '高邑县', '5', '0');
INSERT INTO `common_city_zone` VALUES ('50', '130128', '深泽县', '5', '0');
INSERT INTO `common_city_zone` VALUES ('51', '130129', '赞皇县', '5', '0');
INSERT INTO `common_city_zone` VALUES ('52', '130130', '无极县', '5', '0');
INSERT INTO `common_city_zone` VALUES ('53', '130131', '平山县', '5', '0');
INSERT INTO `common_city_zone` VALUES ('54', '130132', '元氏县', '5', '0');
INSERT INTO `common_city_zone` VALUES ('55', '130133', '赵　县', '5', '0');
INSERT INTO `common_city_zone` VALUES ('56', '130181', '辛集市', '5', '0');
INSERT INTO `common_city_zone` VALUES ('57', '130182', '藁城市', '5', '0');
INSERT INTO `common_city_zone` VALUES ('58', '130183', '晋州市', '5', '0');
INSERT INTO `common_city_zone` VALUES ('59', '130184', '新乐市', '5', '0');
INSERT INTO `common_city_zone` VALUES ('60', '130185', '鹿泉市', '5', '0');
INSERT INTO `common_city_zone` VALUES ('61', '130201', '市辖区', '6', '0');
INSERT INTO `common_city_zone` VALUES ('62', '130202', '路南区', '6', '0');
INSERT INTO `common_city_zone` VALUES ('63', '130203', '路北区', '6', '0');
INSERT INTO `common_city_zone` VALUES ('64', '130204', '古冶区', '6', '0');
INSERT INTO `common_city_zone` VALUES ('65', '130205', '开平区', '6', '0');
INSERT INTO `common_city_zone` VALUES ('66', '130207', '丰南区', '6', '0');
INSERT INTO `common_city_zone` VALUES ('67', '130208', '丰润区', '6', '0');
INSERT INTO `common_city_zone` VALUES ('68', '130223', '滦　县', '6', '0');
INSERT INTO `common_city_zone` VALUES ('69', '130224', '滦南县', '6', '0');
INSERT INTO `common_city_zone` VALUES ('70', '130225', '乐亭县', '6', '0');
INSERT INTO `common_city_zone` VALUES ('71', '130227', '迁西县', '6', '0');
INSERT INTO `common_city_zone` VALUES ('72', '130229', '玉田县', '6', '0');
INSERT INTO `common_city_zone` VALUES ('73', '130230', '唐海县', '6', '0');
INSERT INTO `common_city_zone` VALUES ('74', '130281', '遵化市', '6', '0');
INSERT INTO `common_city_zone` VALUES ('75', '130283', '迁安市', '6', '0');
INSERT INTO `common_city_zone` VALUES ('76', '130301', '市辖区', '7', '0');
INSERT INTO `common_city_zone` VALUES ('77', '130302', '海港区', '7', '0');
INSERT INTO `common_city_zone` VALUES ('78', '130303', '山海关区', '7', '0');
INSERT INTO `common_city_zone` VALUES ('79', '130304', '北戴河区', '7', '0');
INSERT INTO `common_city_zone` VALUES ('80', '130321', '青龙满族自治县', '7', '0');
INSERT INTO `common_city_zone` VALUES ('81', '130322', '昌黎县', '7', '0');
INSERT INTO `common_city_zone` VALUES ('82', '130323', '抚宁县', '7', '0');
INSERT INTO `common_city_zone` VALUES ('83', '130324', '卢龙县', '7', '0');
INSERT INTO `common_city_zone` VALUES ('84', '130401', '市辖区', '8', '0');
INSERT INTO `common_city_zone` VALUES ('85', '130402', '邯山区', '8', '0');
INSERT INTO `common_city_zone` VALUES ('86', '130403', '丛台区', '8', '0');
INSERT INTO `common_city_zone` VALUES ('87', '130404', '复兴区', '8', '0');
INSERT INTO `common_city_zone` VALUES ('88', '130406', '峰峰矿区', '8', '0');
INSERT INTO `common_city_zone` VALUES ('89', '130421', '邯郸县', '8', '0');
INSERT INTO `common_city_zone` VALUES ('90', '130423', '临漳县', '8', '0');
INSERT INTO `common_city_zone` VALUES ('91', '130424', '成安县', '8', '0');
INSERT INTO `common_city_zone` VALUES ('92', '130425', '大名县', '8', '0');
INSERT INTO `common_city_zone` VALUES ('93', '130426', '涉　县', '8', '0');
INSERT INTO `common_city_zone` VALUES ('94', '130427', '磁　县', '8', '0');
INSERT INTO `common_city_zone` VALUES ('95', '130428', '肥乡县', '8', '0');
INSERT INTO `common_city_zone` VALUES ('96', '130429', '永年县', '8', '0');
INSERT INTO `common_city_zone` VALUES ('97', '130430', '邱　县', '8', '0');
INSERT INTO `common_city_zone` VALUES ('98', '130431', '鸡泽县', '8', '0');
INSERT INTO `common_city_zone` VALUES ('99', '130432', '广平县', '8', '0');
INSERT INTO `common_city_zone` VALUES ('100', '130433', '馆陶县', '8', '0');
INSERT INTO `common_city_zone` VALUES ('101', '130434', '魏　县', '8', '0');
INSERT INTO `common_city_zone` VALUES ('102', '130435', '曲周县', '8', '0');
INSERT INTO `common_city_zone` VALUES ('103', '130481', '武安市', '8', '0');
INSERT INTO `common_city_zone` VALUES ('104', '130501', '市辖区', '9', '0');
INSERT INTO `common_city_zone` VALUES ('105', '130502', '桥东区', '9', '0');
INSERT INTO `common_city_zone` VALUES ('106', '130503', '桥西区', '9', '0');
INSERT INTO `common_city_zone` VALUES ('107', '130521', '邢台县', '9', '0');
INSERT INTO `common_city_zone` VALUES ('108', '130522', '临城县', '9', '0');
INSERT INTO `common_city_zone` VALUES ('109', '130523', '内丘县', '9', '0');
INSERT INTO `common_city_zone` VALUES ('110', '130524', '柏乡县', '9', '0');
INSERT INTO `common_city_zone` VALUES ('111', '130525', '隆尧县', '9', '0');
INSERT INTO `common_city_zone` VALUES ('112', '130526', '任　县', '9', '0');
INSERT INTO `common_city_zone` VALUES ('113', '130527', '南和县', '9', '0');
INSERT INTO `common_city_zone` VALUES ('114', '130528', '宁晋县', '9', '0');
INSERT INTO `common_city_zone` VALUES ('115', '130529', '巨鹿县', '9', '0');
INSERT INTO `common_city_zone` VALUES ('116', '130530', '新河县', '9', '0');
INSERT INTO `common_city_zone` VALUES ('117', '130531', '广宗县', '9', '0');
INSERT INTO `common_city_zone` VALUES ('118', '130532', '平乡县', '9', '0');
INSERT INTO `common_city_zone` VALUES ('119', '130533', '威　县', '9', '0');
INSERT INTO `common_city_zone` VALUES ('120', '130534', '清河县', '9', '0');
INSERT INTO `common_city_zone` VALUES ('121', '130535', '临西县', '9', '0');
INSERT INTO `common_city_zone` VALUES ('122', '130581', '南宫市', '9', '0');
INSERT INTO `common_city_zone` VALUES ('123', '130582', '沙河市', '9', '0');
INSERT INTO `common_city_zone` VALUES ('124', '130601', '市辖区', '10', '0');
INSERT INTO `common_city_zone` VALUES ('125', '130602', '新市区', '10', '0');
INSERT INTO `common_city_zone` VALUES ('126', '130603', '北市区', '10', '0');
INSERT INTO `common_city_zone` VALUES ('127', '130604', '南市区', '10', '0');
INSERT INTO `common_city_zone` VALUES ('128', '130621', '满城县', '10', '0');
INSERT INTO `common_city_zone` VALUES ('129', '130622', '清苑县', '10', '0');
INSERT INTO `common_city_zone` VALUES ('130', '130623', '涞水县', '10', '0');
INSERT INTO `common_city_zone` VALUES ('131', '130624', '阜平县', '10', '0');
INSERT INTO `common_city_zone` VALUES ('132', '130625', '徐水县', '10', '0');
INSERT INTO `common_city_zone` VALUES ('133', '130626', '定兴县', '10', '0');
INSERT INTO `common_city_zone` VALUES ('134', '130627', '唐　县', '10', '0');
INSERT INTO `common_city_zone` VALUES ('135', '130628', '高阳县', '10', '0');
INSERT INTO `common_city_zone` VALUES ('136', '130629', '容城县', '10', '0');
INSERT INTO `common_city_zone` VALUES ('137', '130630', '涞源县', '10', '0');
INSERT INTO `common_city_zone` VALUES ('138', '130631', '望都县', '10', '0');
INSERT INTO `common_city_zone` VALUES ('139', '130632', '安新县', '10', '0');
INSERT INTO `common_city_zone` VALUES ('140', '130633', '易　县', '10', '0');
INSERT INTO `common_city_zone` VALUES ('141', '130634', '曲阳县', '10', '0');
INSERT INTO `common_city_zone` VALUES ('142', '130635', '蠡　县', '10', '0');
INSERT INTO `common_city_zone` VALUES ('143', '130636', '顺平县', '10', '0');
INSERT INTO `common_city_zone` VALUES ('144', '130637', '博野县', '10', '0');
INSERT INTO `common_city_zone` VALUES ('145', '130638', '雄　县', '10', '0');
INSERT INTO `common_city_zone` VALUES ('146', '130681', '涿州市', '10', '0');
INSERT INTO `common_city_zone` VALUES ('147', '130682', '定州市', '10', '0');
INSERT INTO `common_city_zone` VALUES ('148', '130683', '安国市', '10', '0');
INSERT INTO `common_city_zone` VALUES ('149', '130684', '高碑店市', '10', '0');
INSERT INTO `common_city_zone` VALUES ('150', '130701', '市辖区', '11', '0');
INSERT INTO `common_city_zone` VALUES ('151', '130702', '桥东区', '11', '0');
INSERT INTO `common_city_zone` VALUES ('152', '130703', '桥西区', '11', '0');
INSERT INTO `common_city_zone` VALUES ('153', '130705', '宣化区', '11', '0');
INSERT INTO `common_city_zone` VALUES ('154', '130706', '下花园区', '11', '0');
INSERT INTO `common_city_zone` VALUES ('155', '130721', '宣化县', '11', '0');
INSERT INTO `common_city_zone` VALUES ('156', '130722', '张北县', '11', '0');
INSERT INTO `common_city_zone` VALUES ('157', '130723', '康保县', '11', '0');
INSERT INTO `common_city_zone` VALUES ('158', '130724', '沽源县', '11', '0');
INSERT INTO `common_city_zone` VALUES ('159', '130725', '尚义县', '11', '0');
INSERT INTO `common_city_zone` VALUES ('160', '130726', '蔚　县', '11', '0');
INSERT INTO `common_city_zone` VALUES ('161', '130727', '阳原县', '11', '0');
INSERT INTO `common_city_zone` VALUES ('162', '130728', '怀安县', '11', '0');
INSERT INTO `common_city_zone` VALUES ('163', '130729', '万全县', '11', '0');
INSERT INTO `common_city_zone` VALUES ('164', '130730', '怀来县', '11', '0');
INSERT INTO `common_city_zone` VALUES ('165', '130731', '涿鹿县', '11', '0');
INSERT INTO `common_city_zone` VALUES ('166', '130732', '赤城县', '11', '0');
INSERT INTO `common_city_zone` VALUES ('167', '130733', '崇礼县', '11', '0');
INSERT INTO `common_city_zone` VALUES ('168', '130801', '市辖区', '12', '0');
INSERT INTO `common_city_zone` VALUES ('169', '130802', '双桥区', '12', '0');
INSERT INTO `common_city_zone` VALUES ('170', '130803', '双滦区', '12', '0');
INSERT INTO `common_city_zone` VALUES ('171', '130804', '鹰手营子矿区', '12', '0');
INSERT INTO `common_city_zone` VALUES ('172', '130821', '承德县', '12', '0');
INSERT INTO `common_city_zone` VALUES ('173', '130822', '兴隆县', '12', '0');
INSERT INTO `common_city_zone` VALUES ('174', '130823', '平泉县', '12', '0');
INSERT INTO `common_city_zone` VALUES ('175', '130824', '滦平县', '12', '0');
INSERT INTO `common_city_zone` VALUES ('176', '130825', '隆化县', '12', '0');
INSERT INTO `common_city_zone` VALUES ('177', '130826', '丰宁满族自治县', '12', '0');
INSERT INTO `common_city_zone` VALUES ('178', '130827', '宽城满族自治县', '12', '0');
INSERT INTO `common_city_zone` VALUES ('179', '130828', '围场满族蒙古族自治县', '12', '0');
INSERT INTO `common_city_zone` VALUES ('180', '130901', '市辖区', '13', '0');
INSERT INTO `common_city_zone` VALUES ('181', '130902', '新华区', '13', '0');
INSERT INTO `common_city_zone` VALUES ('182', '130903', '运河区', '13', '0');
INSERT INTO `common_city_zone` VALUES ('183', '130921', '沧　县', '13', '0');
INSERT INTO `common_city_zone` VALUES ('184', '130922', '青　县', '13', '0');
INSERT INTO `common_city_zone` VALUES ('185', '130923', '东光县', '13', '0');
INSERT INTO `common_city_zone` VALUES ('186', '130924', '海兴县', '13', '0');
INSERT INTO `common_city_zone` VALUES ('187', '130925', '盐山县', '13', '0');
INSERT INTO `common_city_zone` VALUES ('188', '130926', '肃宁县', '13', '0');
INSERT INTO `common_city_zone` VALUES ('189', '130927', '南皮县', '13', '0');
INSERT INTO `common_city_zone` VALUES ('190', '130928', '吴桥县', '13', '0');
INSERT INTO `common_city_zone` VALUES ('191', '130929', '献　县', '13', '0');
INSERT INTO `common_city_zone` VALUES ('192', '130930', '孟村回族自治县', '13', '0');
INSERT INTO `common_city_zone` VALUES ('193', '130981', '泊头市', '13', '0');
INSERT INTO `common_city_zone` VALUES ('194', '130982', '任丘市', '13', '0');
INSERT INTO `common_city_zone` VALUES ('195', '130983', '黄骅市', '13', '0');
INSERT INTO `common_city_zone` VALUES ('196', '130984', '河间市', '13', '0');
INSERT INTO `common_city_zone` VALUES ('197', '131001', '市辖区', '14', '0');
INSERT INTO `common_city_zone` VALUES ('198', '131002', '安次区', '14', '0');
INSERT INTO `common_city_zone` VALUES ('199', '131003', '广阳区', '14', '0');
INSERT INTO `common_city_zone` VALUES ('200', '131022', '固安县', '14', '0');
INSERT INTO `common_city_zone` VALUES ('201', '131023', '永清县', '14', '0');
INSERT INTO `common_city_zone` VALUES ('202', '131024', '香河县', '14', '0');
INSERT INTO `common_city_zone` VALUES ('203', '131025', '大城县', '14', '0');
INSERT INTO `common_city_zone` VALUES ('204', '131026', '文安县', '14', '0');
INSERT INTO `common_city_zone` VALUES ('205', '131028', '大厂回族自治县', '14', '0');
INSERT INTO `common_city_zone` VALUES ('206', '131081', '霸州市', '14', '0');
INSERT INTO `common_city_zone` VALUES ('207', '131082', '三河市', '14', '0');
INSERT INTO `common_city_zone` VALUES ('208', '131101', '市辖区', '15', '0');
INSERT INTO `common_city_zone` VALUES ('209', '131102', '桃城区', '15', '0');
INSERT INTO `common_city_zone` VALUES ('210', '131121', '枣强县', '15', '0');
INSERT INTO `common_city_zone` VALUES ('211', '131122', '武邑县', '15', '0');
INSERT INTO `common_city_zone` VALUES ('212', '131123', '武强县', '15', '0');
INSERT INTO `common_city_zone` VALUES ('213', '131124', '饶阳县', '15', '0');
INSERT INTO `common_city_zone` VALUES ('214', '131125', '安平县', '15', '0');
INSERT INTO `common_city_zone` VALUES ('215', '131126', '故城县', '15', '0');
INSERT INTO `common_city_zone` VALUES ('216', '131127', '景　县', '15', '0');
INSERT INTO `common_city_zone` VALUES ('217', '131128', '阜城县', '15', '0');
INSERT INTO `common_city_zone` VALUES ('218', '131181', '冀州市', '15', '0');
INSERT INTO `common_city_zone` VALUES ('219', '131182', '深州市', '15', '0');
INSERT INTO `common_city_zone` VALUES ('220', '140101', '市辖区', '16', '0');
INSERT INTO `common_city_zone` VALUES ('221', '140105', '小店区', '16', '0');
INSERT INTO `common_city_zone` VALUES ('222', '140106', '迎泽区', '16', '0');
INSERT INTO `common_city_zone` VALUES ('223', '140107', '杏花岭区', '16', '0');
INSERT INTO `common_city_zone` VALUES ('224', '140108', '尖草坪区', '16', '0');
INSERT INTO `common_city_zone` VALUES ('225', '140109', '万柏林区', '16', '0');
INSERT INTO `common_city_zone` VALUES ('226', '140110', '晋源区', '16', '0');
INSERT INTO `common_city_zone` VALUES ('227', '140121', '清徐县', '16', '0');
INSERT INTO `common_city_zone` VALUES ('228', '140122', '阳曲县', '16', '0');
INSERT INTO `common_city_zone` VALUES ('229', '140123', '娄烦县', '16', '0');
INSERT INTO `common_city_zone` VALUES ('230', '140181', '古交市', '16', '0');
INSERT INTO `common_city_zone` VALUES ('231', '140201', '市辖区', '17', '0');
INSERT INTO `common_city_zone` VALUES ('232', '140202', '城　区', '17', '0');
INSERT INTO `common_city_zone` VALUES ('233', '140203', '矿　区', '17', '0');
INSERT INTO `common_city_zone` VALUES ('234', '140211', '南郊区', '17', '0');
INSERT INTO `common_city_zone` VALUES ('235', '140212', '新荣区', '17', '0');
INSERT INTO `common_city_zone` VALUES ('236', '140221', '阳高县', '17', '0');
INSERT INTO `common_city_zone` VALUES ('237', '140222', '天镇县', '17', '0');
INSERT INTO `common_city_zone` VALUES ('238', '140223', '广灵县', '17', '0');
INSERT INTO `common_city_zone` VALUES ('239', '140224', '灵丘县', '17', '0');
INSERT INTO `common_city_zone` VALUES ('240', '140225', '浑源县', '17', '0');
INSERT INTO `common_city_zone` VALUES ('241', '140226', '左云县', '17', '0');
INSERT INTO `common_city_zone` VALUES ('242', '140227', '大同县', '17', '0');
INSERT INTO `common_city_zone` VALUES ('243', '140301', '市辖区', '18', '0');
INSERT INTO `common_city_zone` VALUES ('244', '140302', '城　区', '18', '0');
INSERT INTO `common_city_zone` VALUES ('245', '140303', '矿　区', '18', '0');
INSERT INTO `common_city_zone` VALUES ('246', '140311', '郊　区', '18', '0');
INSERT INTO `common_city_zone` VALUES ('247', '140321', '平定县', '18', '0');
INSERT INTO `common_city_zone` VALUES ('248', '140322', '盂　县', '18', '0');
INSERT INTO `common_city_zone` VALUES ('249', '140401', '市辖区', '19', '0');
INSERT INTO `common_city_zone` VALUES ('250', '140402', '城　区', '19', '0');
INSERT INTO `common_city_zone` VALUES ('251', '140411', '郊　区', '19', '0');
INSERT INTO `common_city_zone` VALUES ('252', '140421', '长治县', '19', '0');
INSERT INTO `common_city_zone` VALUES ('253', '140423', '襄垣县', '19', '0');
INSERT INTO `common_city_zone` VALUES ('254', '140424', '屯留县', '19', '0');
INSERT INTO `common_city_zone` VALUES ('255', '140425', '平顺县', '19', '0');
INSERT INTO `common_city_zone` VALUES ('256', '140426', '黎城县', '19', '0');
INSERT INTO `common_city_zone` VALUES ('257', '140427', '壶关县', '19', '0');
INSERT INTO `common_city_zone` VALUES ('258', '140428', '长子县', '19', '0');
INSERT INTO `common_city_zone` VALUES ('259', '140429', '武乡县', '19', '0');
INSERT INTO `common_city_zone` VALUES ('260', '140430', '沁　县', '19', '0');
INSERT INTO `common_city_zone` VALUES ('261', '140431', '沁源县', '19', '0');
INSERT INTO `common_city_zone` VALUES ('262', '140481', '潞城市', '19', '0');
INSERT INTO `common_city_zone` VALUES ('263', '140501', '市辖区', '20', '0');
INSERT INTO `common_city_zone` VALUES ('264', '140502', '城　区', '20', '0');
INSERT INTO `common_city_zone` VALUES ('265', '140521', '沁水县', '20', '0');
INSERT INTO `common_city_zone` VALUES ('266', '140522', '阳城县', '20', '0');
INSERT INTO `common_city_zone` VALUES ('267', '140524', '陵川县', '20', '0');
INSERT INTO `common_city_zone` VALUES ('268', '140525', '泽州县', '20', '0');
INSERT INTO `common_city_zone` VALUES ('269', '140581', '高平市', '20', '0');
INSERT INTO `common_city_zone` VALUES ('270', '140601', '市辖区', '21', '0');
INSERT INTO `common_city_zone` VALUES ('271', '140602', '朔城区', '21', '0');
INSERT INTO `common_city_zone` VALUES ('272', '140603', '平鲁区', '21', '0');
INSERT INTO `common_city_zone` VALUES ('273', '140621', '山阴县', '21', '0');
INSERT INTO `common_city_zone` VALUES ('274', '140622', '应　县', '21', '0');
INSERT INTO `common_city_zone` VALUES ('275', '140623', '右玉县', '21', '0');
INSERT INTO `common_city_zone` VALUES ('276', '140624', '怀仁县', '21', '0');
INSERT INTO `common_city_zone` VALUES ('277', '140701', '市辖区', '22', '0');
INSERT INTO `common_city_zone` VALUES ('278', '140702', '榆次区', '22', '0');
INSERT INTO `common_city_zone` VALUES ('279', '140721', '榆社县', '22', '0');
INSERT INTO `common_city_zone` VALUES ('280', '140722', '左权县', '22', '0');
INSERT INTO `common_city_zone` VALUES ('281', '140723', '和顺县', '22', '0');
INSERT INTO `common_city_zone` VALUES ('282', '140724', '昔阳县', '22', '0');
INSERT INTO `common_city_zone` VALUES ('283', '140725', '寿阳县', '22', '0');
INSERT INTO `common_city_zone` VALUES ('284', '140726', '太谷县', '22', '0');
INSERT INTO `common_city_zone` VALUES ('285', '140727', '祁　县', '22', '0');
INSERT INTO `common_city_zone` VALUES ('286', '140728', '平遥县', '22', '0');
INSERT INTO `common_city_zone` VALUES ('287', '140729', '灵石县', '22', '0');
INSERT INTO `common_city_zone` VALUES ('288', '140781', '介休市', '22', '0');
INSERT INTO `common_city_zone` VALUES ('289', '140801', '市辖区', '23', '0');
INSERT INTO `common_city_zone` VALUES ('290', '140802', '盐湖区', '23', '0');
INSERT INTO `common_city_zone` VALUES ('291', '140821', '临猗县', '23', '0');
INSERT INTO `common_city_zone` VALUES ('292', '140822', '万荣县', '23', '0');
INSERT INTO `common_city_zone` VALUES ('293', '140823', '闻喜县', '23', '0');
INSERT INTO `common_city_zone` VALUES ('294', '140824', '稷山县', '23', '0');
INSERT INTO `common_city_zone` VALUES ('295', '140825', '新绛县', '23', '0');
INSERT INTO `common_city_zone` VALUES ('296', '140826', '绛　县', '23', '0');
INSERT INTO `common_city_zone` VALUES ('297', '140827', '垣曲县', '23', '0');
INSERT INTO `common_city_zone` VALUES ('298', '140828', '夏　县', '23', '0');
INSERT INTO `common_city_zone` VALUES ('299', '140829', '平陆县', '23', '0');
INSERT INTO `common_city_zone` VALUES ('300', '140830', '芮城县', '23', '0');
INSERT INTO `common_city_zone` VALUES ('301', '140881', '永济市', '23', '0');
INSERT INTO `common_city_zone` VALUES ('302', '140882', '河津市', '23', '0');
INSERT INTO `common_city_zone` VALUES ('303', '140901', '市辖区', '24', '0');
INSERT INTO `common_city_zone` VALUES ('304', '140902', '忻府区', '24', '0');
INSERT INTO `common_city_zone` VALUES ('305', '140921', '定襄县', '24', '0');
INSERT INTO `common_city_zone` VALUES ('306', '140922', '五台县', '24', '0');
INSERT INTO `common_city_zone` VALUES ('307', '140923', '代　县', '24', '0');
INSERT INTO `common_city_zone` VALUES ('308', '140924', '繁峙县', '24', '0');
INSERT INTO `common_city_zone` VALUES ('309', '140925', '宁武县', '24', '0');
INSERT INTO `common_city_zone` VALUES ('310', '140926', '静乐县', '24', '0');
INSERT INTO `common_city_zone` VALUES ('311', '140927', '神池县', '24', '0');
INSERT INTO `common_city_zone` VALUES ('312', '140928', '五寨县', '24', '0');
INSERT INTO `common_city_zone` VALUES ('313', '140929', '岢岚县', '24', '0');
INSERT INTO `common_city_zone` VALUES ('314', '140930', '河曲县', '24', '0');
INSERT INTO `common_city_zone` VALUES ('315', '140931', '保德县', '24', '0');
INSERT INTO `common_city_zone` VALUES ('316', '140932', '偏关县', '24', '0');
INSERT INTO `common_city_zone` VALUES ('317', '140981', '原平市', '24', '0');
INSERT INTO `common_city_zone` VALUES ('318', '141001', '市辖区', '25', '0');
INSERT INTO `common_city_zone` VALUES ('319', '141002', '尧都区', '25', '0');
INSERT INTO `common_city_zone` VALUES ('320', '141021', '曲沃县', '25', '0');
INSERT INTO `common_city_zone` VALUES ('321', '141022', '翼城县', '25', '0');
INSERT INTO `common_city_zone` VALUES ('322', '141023', '襄汾县', '25', '0');
INSERT INTO `common_city_zone` VALUES ('323', '141024', '洪洞县', '25', '0');
INSERT INTO `common_city_zone` VALUES ('324', '141025', '古　县', '25', '0');
INSERT INTO `common_city_zone` VALUES ('325', '141026', '安泽县', '25', '0');
INSERT INTO `common_city_zone` VALUES ('326', '141027', '浮山县', '25', '0');
INSERT INTO `common_city_zone` VALUES ('327', '141028', '吉　县', '25', '0');
INSERT INTO `common_city_zone` VALUES ('328', '141029', '乡宁县', '25', '0');
INSERT INTO `common_city_zone` VALUES ('329', '141030', '大宁县', '25', '0');
INSERT INTO `common_city_zone` VALUES ('330', '141031', '隰　县', '25', '0');
INSERT INTO `common_city_zone` VALUES ('331', '141032', '永和县', '25', '0');
INSERT INTO `common_city_zone` VALUES ('332', '141033', '蒲　县', '25', '0');
INSERT INTO `common_city_zone` VALUES ('333', '141034', '汾西县', '25', '0');
INSERT INTO `common_city_zone` VALUES ('334', '141081', '侯马市', '25', '0');
INSERT INTO `common_city_zone` VALUES ('335', '141082', '霍州市', '25', '0');
INSERT INTO `common_city_zone` VALUES ('336', '141101', '市辖区', '26', '0');
INSERT INTO `common_city_zone` VALUES ('337', '141102', '离石区', '26', '0');
INSERT INTO `common_city_zone` VALUES ('338', '141121', '文水县', '26', '0');
INSERT INTO `common_city_zone` VALUES ('339', '141122', '交城县', '26', '0');
INSERT INTO `common_city_zone` VALUES ('340', '141123', '兴　县', '26', '0');
INSERT INTO `common_city_zone` VALUES ('341', '141124', '临　县', '26', '0');
INSERT INTO `common_city_zone` VALUES ('342', '141125', '柳林县', '26', '0');
INSERT INTO `common_city_zone` VALUES ('343', '141126', '石楼县', '26', '0');
INSERT INTO `common_city_zone` VALUES ('344', '141127', '岚　县', '26', '0');
INSERT INTO `common_city_zone` VALUES ('345', '141128', '方山县', '26', '0');
INSERT INTO `common_city_zone` VALUES ('346', '141129', '中阳县', '26', '0');
INSERT INTO `common_city_zone` VALUES ('347', '141130', '交口县', '26', '0');
INSERT INTO `common_city_zone` VALUES ('348', '141181', '孝义市', '26', '0');
INSERT INTO `common_city_zone` VALUES ('349', '141182', '汾阳市', '26', '0');
INSERT INTO `common_city_zone` VALUES ('350', '150101', '市辖区', '27', '0');
INSERT INTO `common_city_zone` VALUES ('351', '150102', '新城区', '27', '0');
INSERT INTO `common_city_zone` VALUES ('352', '150103', '回民区', '27', '0');
INSERT INTO `common_city_zone` VALUES ('353', '150104', '玉泉区', '27', '0');
INSERT INTO `common_city_zone` VALUES ('354', '150105', '赛罕区', '27', '0');
INSERT INTO `common_city_zone` VALUES ('355', '150121', '土默特左旗', '27', '0');
INSERT INTO `common_city_zone` VALUES ('356', '150122', '托克托县', '27', '0');
INSERT INTO `common_city_zone` VALUES ('357', '150123', '和林格尔县', '27', '0');
INSERT INTO `common_city_zone` VALUES ('358', '150124', '清水河县', '27', '0');
INSERT INTO `common_city_zone` VALUES ('359', '150125', '武川县', '27', '0');
INSERT INTO `common_city_zone` VALUES ('360', '150201', '市辖区', '28', '0');
INSERT INTO `common_city_zone` VALUES ('361', '150202', '东河区', '28', '0');
INSERT INTO `common_city_zone` VALUES ('362', '150203', '昆都仑区', '28', '0');
INSERT INTO `common_city_zone` VALUES ('363', '150204', '青山区', '28', '0');
INSERT INTO `common_city_zone` VALUES ('364', '150205', '石拐区', '28', '0');
INSERT INTO `common_city_zone` VALUES ('365', '150206', '白云矿区', '28', '0');
INSERT INTO `common_city_zone` VALUES ('366', '150207', '九原区', '28', '0');
INSERT INTO `common_city_zone` VALUES ('367', '150221', '土默特右旗', '28', '0');
INSERT INTO `common_city_zone` VALUES ('368', '150222', '固阳县', '28', '0');
INSERT INTO `common_city_zone` VALUES ('369', '150223', '达尔罕茂明安联合旗', '28', '0');
INSERT INTO `common_city_zone` VALUES ('370', '150301', '市辖区', '29', '0');
INSERT INTO `common_city_zone` VALUES ('371', '150302', '海勃湾区', '29', '0');
INSERT INTO `common_city_zone` VALUES ('372', '150303', '海南区', '29', '0');
INSERT INTO `common_city_zone` VALUES ('373', '150304', '乌达区', '29', '0');
INSERT INTO `common_city_zone` VALUES ('374', '150401', '市辖区', '30', '0');
INSERT INTO `common_city_zone` VALUES ('375', '150402', '红山区', '30', '0');
INSERT INTO `common_city_zone` VALUES ('376', '150403', '元宝山区', '30', '0');
INSERT INTO `common_city_zone` VALUES ('377', '150404', '松山区', '30', '0');
INSERT INTO `common_city_zone` VALUES ('378', '150421', '阿鲁科尔沁旗', '30', '0');
INSERT INTO `common_city_zone` VALUES ('379', '150422', '巴林左旗', '30', '0');
INSERT INTO `common_city_zone` VALUES ('380', '150423', '巴林右旗', '30', '0');
INSERT INTO `common_city_zone` VALUES ('381', '150424', '林西县', '30', '0');
INSERT INTO `common_city_zone` VALUES ('382', '150425', '克什克腾旗', '30', '0');
INSERT INTO `common_city_zone` VALUES ('383', '150426', '翁牛特旗', '30', '0');
INSERT INTO `common_city_zone` VALUES ('384', '150428', '喀喇沁旗', '30', '0');
INSERT INTO `common_city_zone` VALUES ('385', '150429', '宁城县', '30', '0');
INSERT INTO `common_city_zone` VALUES ('386', '150430', '敖汉旗', '30', '0');
INSERT INTO `common_city_zone` VALUES ('387', '150501', '市辖区', '31', '0');
INSERT INTO `common_city_zone` VALUES ('388', '150502', '科尔沁区', '31', '0');
INSERT INTO `common_city_zone` VALUES ('389', '150521', '科尔沁左翼中旗', '31', '0');
INSERT INTO `common_city_zone` VALUES ('390', '150522', '科尔沁左翼后旗', '31', '0');
INSERT INTO `common_city_zone` VALUES ('391', '150523', '开鲁县', '31', '0');
INSERT INTO `common_city_zone` VALUES ('392', '150524', '库伦旗', '31', '0');
INSERT INTO `common_city_zone` VALUES ('393', '150525', '奈曼旗', '31', '0');
INSERT INTO `common_city_zone` VALUES ('394', '150526', '扎鲁特旗', '31', '0');
INSERT INTO `common_city_zone` VALUES ('395', '150581', '霍林郭勒市', '31', '0');
INSERT INTO `common_city_zone` VALUES ('396', '150602', '东胜区', '32', '0');
INSERT INTO `common_city_zone` VALUES ('397', '150621', '达拉特旗', '32', '0');
INSERT INTO `common_city_zone` VALUES ('398', '150622', '准格尔旗', '32', '0');
INSERT INTO `common_city_zone` VALUES ('399', '150623', '鄂托克前旗', '32', '0');
INSERT INTO `common_city_zone` VALUES ('400', '150624', '鄂托克旗', '32', '0');
INSERT INTO `common_city_zone` VALUES ('401', '150625', '杭锦旗', '32', '0');
INSERT INTO `common_city_zone` VALUES ('402', '150626', '乌审旗', '32', '0');
INSERT INTO `common_city_zone` VALUES ('403', '150627', '伊金霍洛旗', '32', '0');
INSERT INTO `common_city_zone` VALUES ('404', '150701', '市辖区', '33', '0');
INSERT INTO `common_city_zone` VALUES ('405', '150702', '海拉尔区', '33', '0');
INSERT INTO `common_city_zone` VALUES ('406', '150721', '阿荣旗', '33', '0');
INSERT INTO `common_city_zone` VALUES ('407', '150722', '莫力达瓦达斡尔族自治旗', '33', '0');
INSERT INTO `common_city_zone` VALUES ('408', '150723', '鄂伦春自治旗', '33', '0');
INSERT INTO `common_city_zone` VALUES ('409', '150724', '鄂温克族自治旗', '33', '0');
INSERT INTO `common_city_zone` VALUES ('410', '150725', '陈巴尔虎旗', '33', '0');
INSERT INTO `common_city_zone` VALUES ('411', '150726', '新巴尔虎左旗', '33', '0');
INSERT INTO `common_city_zone` VALUES ('412', '150727', '新巴尔虎右旗', '33', '0');
INSERT INTO `common_city_zone` VALUES ('413', '150781', '满洲里市', '33', '0');
INSERT INTO `common_city_zone` VALUES ('414', '150782', '牙克石市', '33', '0');
INSERT INTO `common_city_zone` VALUES ('415', '150783', '扎兰屯市', '33', '0');
INSERT INTO `common_city_zone` VALUES ('416', '150784', '额尔古纳市', '33', '0');
INSERT INTO `common_city_zone` VALUES ('417', '150785', '根河市', '33', '0');
INSERT INTO `common_city_zone` VALUES ('418', '150801', '市辖区', '34', '0');
INSERT INTO `common_city_zone` VALUES ('419', '150802', '临河区', '34', '0');
INSERT INTO `common_city_zone` VALUES ('420', '150821', '五原县', '34', '0');
INSERT INTO `common_city_zone` VALUES ('421', '150822', '磴口县', '34', '0');
INSERT INTO `common_city_zone` VALUES ('422', '150823', '乌拉特前旗', '34', '0');
INSERT INTO `common_city_zone` VALUES ('423', '150824', '乌拉特中旗', '34', '0');
INSERT INTO `common_city_zone` VALUES ('424', '150825', '乌拉特后旗', '34', '0');
INSERT INTO `common_city_zone` VALUES ('425', '150826', '杭锦后旗', '34', '0');
INSERT INTO `common_city_zone` VALUES ('426', '150901', '市辖区', '35', '0');
INSERT INTO `common_city_zone` VALUES ('427', '150902', '集宁区', '35', '0');
INSERT INTO `common_city_zone` VALUES ('428', '150921', '卓资县', '35', '0');
INSERT INTO `common_city_zone` VALUES ('429', '150922', '化德县', '35', '0');
INSERT INTO `common_city_zone` VALUES ('430', '150923', '商都县', '35', '0');
INSERT INTO `common_city_zone` VALUES ('431', '150924', '兴和县', '35', '0');
INSERT INTO `common_city_zone` VALUES ('432', '150925', '凉城县', '35', '0');
INSERT INTO `common_city_zone` VALUES ('433', '150926', '察哈尔右翼前旗', '35', '0');
INSERT INTO `common_city_zone` VALUES ('434', '150927', '察哈尔右翼中旗', '35', '0');
INSERT INTO `common_city_zone` VALUES ('435', '150928', '察哈尔右翼后旗', '35', '0');
INSERT INTO `common_city_zone` VALUES ('436', '150929', '四子王旗', '35', '0');
INSERT INTO `common_city_zone` VALUES ('437', '150981', '丰镇市', '35', '0');
INSERT INTO `common_city_zone` VALUES ('438', '152201', '乌兰浩特市', '36', '0');
INSERT INTO `common_city_zone` VALUES ('439', '152202', '阿尔山市', '36', '0');
INSERT INTO `common_city_zone` VALUES ('440', '152221', '科尔沁右翼前旗', '36', '0');
INSERT INTO `common_city_zone` VALUES ('441', '152222', '科尔沁右翼中旗', '36', '0');
INSERT INTO `common_city_zone` VALUES ('442', '152223', '扎赉特旗', '36', '0');
INSERT INTO `common_city_zone` VALUES ('443', '152224', '突泉县', '36', '0');
INSERT INTO `common_city_zone` VALUES ('444', '152501', '二连浩特市', '37', '0');
INSERT INTO `common_city_zone` VALUES ('445', '152502', '锡林浩特市', '37', '0');
INSERT INTO `common_city_zone` VALUES ('446', '152522', '阿巴嘎旗', '37', '0');
INSERT INTO `common_city_zone` VALUES ('447', '152523', '苏尼特左旗', '37', '0');
INSERT INTO `common_city_zone` VALUES ('448', '152524', '苏尼特右旗', '37', '0');
INSERT INTO `common_city_zone` VALUES ('449', '152525', '东乌珠穆沁旗', '37', '0');
INSERT INTO `common_city_zone` VALUES ('450', '152526', '西乌珠穆沁旗', '37', '0');
INSERT INTO `common_city_zone` VALUES ('451', '152527', '太仆寺旗', '37', '0');
INSERT INTO `common_city_zone` VALUES ('452', '152528', '镶黄旗', '37', '0');
INSERT INTO `common_city_zone` VALUES ('453', '152529', '正镶白旗', '37', '0');
INSERT INTO `common_city_zone` VALUES ('454', '152530', '正蓝旗', '37', '0');
INSERT INTO `common_city_zone` VALUES ('455', '152531', '多伦县', '37', '0');
INSERT INTO `common_city_zone` VALUES ('456', '152921', '阿拉善左旗', '38', '0');
INSERT INTO `common_city_zone` VALUES ('457', '152922', '阿拉善右旗', '38', '0');
INSERT INTO `common_city_zone` VALUES ('458', '152923', '额济纳旗', '38', '0');
INSERT INTO `common_city_zone` VALUES ('459', '210101', '市辖区', '39', '0');
INSERT INTO `common_city_zone` VALUES ('460', '210102', '和平区', '39', '0');
INSERT INTO `common_city_zone` VALUES ('461', '210103', '沈河区', '39', '0');
INSERT INTO `common_city_zone` VALUES ('462', '210104', '大东区', '39', '0');
INSERT INTO `common_city_zone` VALUES ('463', '210105', '皇姑区', '39', '0');
INSERT INTO `common_city_zone` VALUES ('464', '210106', '铁西区', '39', '0');
INSERT INTO `common_city_zone` VALUES ('465', '210111', '苏家屯区', '39', '0');
INSERT INTO `common_city_zone` VALUES ('466', '210112', '东陵区', '39', '0');
INSERT INTO `common_city_zone` VALUES ('467', '210113', '新城子区', '39', '0');
INSERT INTO `common_city_zone` VALUES ('468', '210114', '于洪区', '39', '0');
INSERT INTO `common_city_zone` VALUES ('469', '210122', '辽中县', '39', '0');
INSERT INTO `common_city_zone` VALUES ('470', '210123', '康平县', '39', '0');
INSERT INTO `common_city_zone` VALUES ('471', '210124', '法库县', '39', '0');
INSERT INTO `common_city_zone` VALUES ('472', '210181', '新民市', '39', '0');
INSERT INTO `common_city_zone` VALUES ('473', '210201', '市辖区', '40', '0');
INSERT INTO `common_city_zone` VALUES ('474', '210202', '中山区', '40', '0');
INSERT INTO `common_city_zone` VALUES ('475', '210203', '西岗区', '40', '0');
INSERT INTO `common_city_zone` VALUES ('476', '210204', '沙河口区', '40', '0');
INSERT INTO `common_city_zone` VALUES ('477', '210211', '甘井子区', '40', '0');
INSERT INTO `common_city_zone` VALUES ('478', '210212', '旅顺口区', '40', '0');
INSERT INTO `common_city_zone` VALUES ('479', '210213', '金州区', '40', '0');
INSERT INTO `common_city_zone` VALUES ('480', '210224', '长海县', '40', '0');
INSERT INTO `common_city_zone` VALUES ('481', '210281', '瓦房店市', '40', '0');
INSERT INTO `common_city_zone` VALUES ('482', '210282', '普兰店市', '40', '0');
INSERT INTO `common_city_zone` VALUES ('483', '210283', '庄河市', '40', '0');
INSERT INTO `common_city_zone` VALUES ('484', '210301', '市辖区', '41', '0');
INSERT INTO `common_city_zone` VALUES ('485', '210302', '铁东区', '41', '0');
INSERT INTO `common_city_zone` VALUES ('486', '210303', '铁西区', '41', '0');
INSERT INTO `common_city_zone` VALUES ('487', '210304', '立山区', '41', '0');
INSERT INTO `common_city_zone` VALUES ('488', '210311', '千山区', '41', '0');
INSERT INTO `common_city_zone` VALUES ('489', '210321', '台安县', '41', '0');
INSERT INTO `common_city_zone` VALUES ('490', '210323', '岫岩满族自治县', '41', '0');
INSERT INTO `common_city_zone` VALUES ('491', '210381', '海城市', '41', '0');
INSERT INTO `common_city_zone` VALUES ('492', '210401', '市辖区', '42', '0');
INSERT INTO `common_city_zone` VALUES ('493', '210402', '新抚区', '42', '0');
INSERT INTO `common_city_zone` VALUES ('494', '210403', '东洲区', '42', '0');
INSERT INTO `common_city_zone` VALUES ('495', '210404', '望花区', '42', '0');
INSERT INTO `common_city_zone` VALUES ('496', '210411', '顺城区', '42', '0');
INSERT INTO `common_city_zone` VALUES ('497', '210421', '抚顺县', '42', '0');
INSERT INTO `common_city_zone` VALUES ('498', '210422', '新宾满族自治县', '42', '0');
INSERT INTO `common_city_zone` VALUES ('499', '210423', '清原满族自治县', '42', '0');
INSERT INTO `common_city_zone` VALUES ('500', '210501', '市辖区', '43', '0');
INSERT INTO `common_city_zone` VALUES ('501', '210502', '平山区', '43', '0');
INSERT INTO `common_city_zone` VALUES ('502', '210503', '溪湖区', '43', '0');
INSERT INTO `common_city_zone` VALUES ('503', '210504', '明山区', '43', '0');
INSERT INTO `common_city_zone` VALUES ('504', '210505', '南芬区', '43', '0');
INSERT INTO `common_city_zone` VALUES ('505', '210521', '本溪满族自治县', '43', '0');
INSERT INTO `common_city_zone` VALUES ('506', '210522', '桓仁满族自治县', '43', '0');
INSERT INTO `common_city_zone` VALUES ('507', '210601', '市辖区', '44', '0');
INSERT INTO `common_city_zone` VALUES ('508', '210602', '元宝区', '44', '0');
INSERT INTO `common_city_zone` VALUES ('509', '210603', '振兴区', '44', '0');
INSERT INTO `common_city_zone` VALUES ('510', '210604', '振安区', '44', '0');
INSERT INTO `common_city_zone` VALUES ('511', '210624', '宽甸满族自治县', '44', '0');
INSERT INTO `common_city_zone` VALUES ('512', '210681', '东港市', '44', '0');
INSERT INTO `common_city_zone` VALUES ('513', '210682', '凤城市', '44', '0');
INSERT INTO `common_city_zone` VALUES ('514', '210701', '市辖区', '45', '0');
INSERT INTO `common_city_zone` VALUES ('515', '210702', '古塔区', '45', '0');
INSERT INTO `common_city_zone` VALUES ('516', '210703', '凌河区', '45', '0');
INSERT INTO `common_city_zone` VALUES ('517', '210711', '太和区', '45', '0');
INSERT INTO `common_city_zone` VALUES ('518', '210726', '黑山县', '45', '0');
INSERT INTO `common_city_zone` VALUES ('519', '210727', '义　县', '45', '0');
INSERT INTO `common_city_zone` VALUES ('520', '210781', '凌海市', '45', '0');
INSERT INTO `common_city_zone` VALUES ('521', '210782', '北宁市', '45', '0');
INSERT INTO `common_city_zone` VALUES ('522', '210801', '市辖区', '46', '0');
INSERT INTO `common_city_zone` VALUES ('523', '210802', '站前区', '46', '0');
INSERT INTO `common_city_zone` VALUES ('524', '210803', '西市区', '46', '0');
INSERT INTO `common_city_zone` VALUES ('525', '210804', '鲅鱼圈区', '46', '0');
INSERT INTO `common_city_zone` VALUES ('526', '210811', '老边区', '46', '0');
INSERT INTO `common_city_zone` VALUES ('527', '210881', '盖州市', '46', '0');
INSERT INTO `common_city_zone` VALUES ('528', '210882', '大石桥市', '46', '0');
INSERT INTO `common_city_zone` VALUES ('529', '210901', '市辖区', '47', '0');
INSERT INTO `common_city_zone` VALUES ('530', '210902', '海州区', '47', '0');
INSERT INTO `common_city_zone` VALUES ('531', '210903', '新邱区', '47', '0');
INSERT INTO `common_city_zone` VALUES ('532', '210904', '太平区', '47', '0');
INSERT INTO `common_city_zone` VALUES ('533', '210905', '清河门区', '47', '0');
INSERT INTO `common_city_zone` VALUES ('534', '210911', '细河区', '47', '0');
INSERT INTO `common_city_zone` VALUES ('535', '210921', '阜新蒙古族自治县', '47', '0');
INSERT INTO `common_city_zone` VALUES ('536', '210922', '彰武县', '47', '0');
INSERT INTO `common_city_zone` VALUES ('537', '211001', '市辖区', '48', '0');
INSERT INTO `common_city_zone` VALUES ('538', '211002', '白塔区', '48', '0');
INSERT INTO `common_city_zone` VALUES ('539', '211003', '文圣区', '48', '0');
INSERT INTO `common_city_zone` VALUES ('540', '211004', '宏伟区', '48', '0');
INSERT INTO `common_city_zone` VALUES ('541', '211005', '弓长岭区', '48', '0');
INSERT INTO `common_city_zone` VALUES ('542', '211011', '太子河区', '48', '0');
INSERT INTO `common_city_zone` VALUES ('543', '211021', '辽阳县', '48', '0');
INSERT INTO `common_city_zone` VALUES ('544', '211081', '灯塔市', '48', '0');
INSERT INTO `common_city_zone` VALUES ('545', '211101', '市辖区', '49', '0');
INSERT INTO `common_city_zone` VALUES ('546', '211102', '双台子区', '49', '0');
INSERT INTO `common_city_zone` VALUES ('547', '211103', '兴隆台区', '49', '0');
INSERT INTO `common_city_zone` VALUES ('548', '211121', '大洼县', '49', '0');
INSERT INTO `common_city_zone` VALUES ('549', '211122', '盘山县', '49', '0');
INSERT INTO `common_city_zone` VALUES ('550', '211201', '市辖区', '50', '0');
INSERT INTO `common_city_zone` VALUES ('551', '211202', '银州区', '50', '0');
INSERT INTO `common_city_zone` VALUES ('552', '211204', '清河区', '50', '0');
INSERT INTO `common_city_zone` VALUES ('553', '211221', '铁岭县', '50', '0');
INSERT INTO `common_city_zone` VALUES ('554', '211223', '西丰县', '50', '0');
INSERT INTO `common_city_zone` VALUES ('555', '211224', '昌图县', '50', '0');
INSERT INTO `common_city_zone` VALUES ('556', '211281', '调兵山市', '50', '0');
INSERT INTO `common_city_zone` VALUES ('557', '211282', '开原市', '50', '0');
INSERT INTO `common_city_zone` VALUES ('558', '211301', '市辖区', '51', '0');
INSERT INTO `common_city_zone` VALUES ('559', '211302', '双塔区', '51', '0');
INSERT INTO `common_city_zone` VALUES ('560', '211303', '龙城区', '51', '0');
INSERT INTO `common_city_zone` VALUES ('561', '211321', '朝阳县', '51', '0');
INSERT INTO `common_city_zone` VALUES ('562', '211322', '建平县', '51', '0');
INSERT INTO `common_city_zone` VALUES ('563', '211324', '喀喇沁左翼蒙古族自治县', '51', '0');
INSERT INTO `common_city_zone` VALUES ('564', '211381', '北票市', '51', '0');
INSERT INTO `common_city_zone` VALUES ('565', '211382', '凌源市', '51', '0');
INSERT INTO `common_city_zone` VALUES ('566', '211401', '市辖区', '52', '0');
INSERT INTO `common_city_zone` VALUES ('567', '211402', '连山区', '52', '0');
INSERT INTO `common_city_zone` VALUES ('568', '211403', '龙港区', '52', '0');
INSERT INTO `common_city_zone` VALUES ('569', '211404', '南票区', '52', '0');
INSERT INTO `common_city_zone` VALUES ('570', '211421', '绥中县', '52', '0');
INSERT INTO `common_city_zone` VALUES ('571', '211422', '建昌县', '52', '0');
INSERT INTO `common_city_zone` VALUES ('572', '211481', '兴城市', '52', '0');
INSERT INTO `common_city_zone` VALUES ('573', '220101', '市辖区', '53', '0');
INSERT INTO `common_city_zone` VALUES ('574', '220102', '南关区', '53', '0');
INSERT INTO `common_city_zone` VALUES ('575', '220103', '宽城区', '53', '0');
INSERT INTO `common_city_zone` VALUES ('576', '220104', '朝阳区', '53', '0');
INSERT INTO `common_city_zone` VALUES ('577', '220105', '二道区', '53', '0');
INSERT INTO `common_city_zone` VALUES ('578', '220106', '绿园区', '53', '0');
INSERT INTO `common_city_zone` VALUES ('579', '220112', '双阳区', '53', '0');
INSERT INTO `common_city_zone` VALUES ('580', '220122', '农安县', '53', '0');
INSERT INTO `common_city_zone` VALUES ('581', '220181', '九台市', '53', '0');
INSERT INTO `common_city_zone` VALUES ('582', '220182', '榆树市', '53', '0');
INSERT INTO `common_city_zone` VALUES ('583', '220183', '德惠市', '53', '0');
INSERT INTO `common_city_zone` VALUES ('584', '220201', '市辖区', '54', '0');
INSERT INTO `common_city_zone` VALUES ('585', '220202', '昌邑区', '54', '0');
INSERT INTO `common_city_zone` VALUES ('586', '220203', '龙潭区', '54', '0');
INSERT INTO `common_city_zone` VALUES ('587', '220204', '船营区', '54', '0');
INSERT INTO `common_city_zone` VALUES ('588', '220211', '丰满区', '54', '0');
INSERT INTO `common_city_zone` VALUES ('589', '220221', '永吉县', '54', '0');
INSERT INTO `common_city_zone` VALUES ('590', '220281', '蛟河市', '54', '0');
INSERT INTO `common_city_zone` VALUES ('591', '220282', '桦甸市', '54', '0');
INSERT INTO `common_city_zone` VALUES ('592', '220283', '舒兰市', '54', '0');
INSERT INTO `common_city_zone` VALUES ('593', '220284', '磐石市', '54', '0');
INSERT INTO `common_city_zone` VALUES ('594', '220301', '市辖区', '55', '0');
INSERT INTO `common_city_zone` VALUES ('595', '220302', '铁西区', '55', '0');
INSERT INTO `common_city_zone` VALUES ('596', '220303', '铁东区', '55', '0');
INSERT INTO `common_city_zone` VALUES ('597', '220322', '梨树县', '55', '0');
INSERT INTO `common_city_zone` VALUES ('598', '220323', '伊通满族自治县', '55', '0');
INSERT INTO `common_city_zone` VALUES ('599', '220381', '公主岭市', '55', '0');
INSERT INTO `common_city_zone` VALUES ('600', '220382', '双辽市', '55', '0');
INSERT INTO `common_city_zone` VALUES ('601', '220401', '市辖区', '56', '0');
INSERT INTO `common_city_zone` VALUES ('602', '220402', '龙山区', '56', '0');
INSERT INTO `common_city_zone` VALUES ('603', '220403', '西安区', '56', '0');
INSERT INTO `common_city_zone` VALUES ('604', '220421', '东丰县', '56', '0');
INSERT INTO `common_city_zone` VALUES ('605', '220422', '东辽县', '56', '0');
INSERT INTO `common_city_zone` VALUES ('606', '220501', '市辖区', '57', '0');
INSERT INTO `common_city_zone` VALUES ('607', '220502', '东昌区', '57', '0');
INSERT INTO `common_city_zone` VALUES ('608', '220503', '二道江区', '57', '0');
INSERT INTO `common_city_zone` VALUES ('609', '220521', '通化县', '57', '0');
INSERT INTO `common_city_zone` VALUES ('610', '220523', '辉南县', '57', '0');
INSERT INTO `common_city_zone` VALUES ('611', '220524', '柳河县', '57', '0');
INSERT INTO `common_city_zone` VALUES ('612', '220581', '梅河口市', '57', '0');
INSERT INTO `common_city_zone` VALUES ('613', '220582', '集安市', '57', '0');
INSERT INTO `common_city_zone` VALUES ('614', '220601', '市辖区', '58', '0');
INSERT INTO `common_city_zone` VALUES ('615', '220602', '八道江区', '58', '0');
INSERT INTO `common_city_zone` VALUES ('616', '220621', '抚松县', '58', '0');
INSERT INTO `common_city_zone` VALUES ('617', '220622', '靖宇县', '58', '0');
INSERT INTO `common_city_zone` VALUES ('618', '220623', '长白朝鲜族自治县', '58', '0');
INSERT INTO `common_city_zone` VALUES ('619', '220625', '江源县', '58', '0');
INSERT INTO `common_city_zone` VALUES ('620', '220681', '临江市', '58', '0');
INSERT INTO `common_city_zone` VALUES ('621', '220701', '市辖区', '59', '0');
INSERT INTO `common_city_zone` VALUES ('622', '220702', '宁江区', '59', '0');
INSERT INTO `common_city_zone` VALUES ('623', '220721', '前郭尔罗斯蒙古族自治县', '59', '0');
INSERT INTO `common_city_zone` VALUES ('624', '220722', '长岭县', '59', '0');
INSERT INTO `common_city_zone` VALUES ('625', '220723', '乾安县', '59', '0');
INSERT INTO `common_city_zone` VALUES ('626', '220724', '扶余县', '59', '0');
INSERT INTO `common_city_zone` VALUES ('627', '220801', '市辖区', '60', '0');
INSERT INTO `common_city_zone` VALUES ('628', '220802', '洮北区', '60', '0');
INSERT INTO `common_city_zone` VALUES ('629', '220821', '镇赉县', '60', '0');
INSERT INTO `common_city_zone` VALUES ('630', '220822', '通榆县', '60', '0');
INSERT INTO `common_city_zone` VALUES ('631', '220881', '洮南市', '60', '0');
INSERT INTO `common_city_zone` VALUES ('632', '220882', '大安市', '60', '0');
INSERT INTO `common_city_zone` VALUES ('633', '222401', '延吉市', '61', '0');
INSERT INTO `common_city_zone` VALUES ('634', '222402', '图们市', '61', '0');
INSERT INTO `common_city_zone` VALUES ('635', '222403', '敦化市', '61', '0');
INSERT INTO `common_city_zone` VALUES ('636', '222404', '珲春市', '61', '0');
INSERT INTO `common_city_zone` VALUES ('637', '222405', '龙井市', '61', '0');
INSERT INTO `common_city_zone` VALUES ('638', '222406', '和龙市', '61', '0');
INSERT INTO `common_city_zone` VALUES ('639', '222424', '汪清县', '61', '0');
INSERT INTO `common_city_zone` VALUES ('640', '222426', '安图县', '61', '0');
INSERT INTO `common_city_zone` VALUES ('641', '230101', '市辖区', '62', '0');
INSERT INTO `common_city_zone` VALUES ('642', '230102', '道里区', '62', '0');
INSERT INTO `common_city_zone` VALUES ('643', '230103', '南岗区', '62', '0');
INSERT INTO `common_city_zone` VALUES ('644', '230104', '道外区', '62', '0');
INSERT INTO `common_city_zone` VALUES ('645', '230106', '香坊区', '62', '0');
INSERT INTO `common_city_zone` VALUES ('646', '230107', '动力区', '62', '0');
INSERT INTO `common_city_zone` VALUES ('647', '230108', '平房区', '62', '0');
INSERT INTO `common_city_zone` VALUES ('648', '230109', '松北区', '62', '0');
INSERT INTO `common_city_zone` VALUES ('649', '230111', '呼兰区', '62', '0');
INSERT INTO `common_city_zone` VALUES ('650', '230123', '依兰县', '62', '0');
INSERT INTO `common_city_zone` VALUES ('651', '230124', '方正县', '62', '0');
INSERT INTO `common_city_zone` VALUES ('652', '230125', '宾　县', '62', '0');
INSERT INTO `common_city_zone` VALUES ('653', '230126', '巴彦县', '62', '0');
INSERT INTO `common_city_zone` VALUES ('654', '230127', '木兰县', '62', '0');
INSERT INTO `common_city_zone` VALUES ('655', '230128', '通河县', '62', '0');
INSERT INTO `common_city_zone` VALUES ('656', '230129', '延寿县', '62', '0');
INSERT INTO `common_city_zone` VALUES ('657', '230181', '阿城市', '62', '0');
INSERT INTO `common_city_zone` VALUES ('658', '230182', '双城市', '62', '0');
INSERT INTO `common_city_zone` VALUES ('659', '230183', '尚志市', '62', '0');
INSERT INTO `common_city_zone` VALUES ('660', '230184', '五常市', '62', '0');
INSERT INTO `common_city_zone` VALUES ('661', '230201', '市辖区', '63', '0');
INSERT INTO `common_city_zone` VALUES ('662', '230202', '龙沙区', '63', '0');
INSERT INTO `common_city_zone` VALUES ('663', '230203', '建华区', '63', '0');
INSERT INTO `common_city_zone` VALUES ('664', '230204', '铁锋区', '63', '0');
INSERT INTO `common_city_zone` VALUES ('665', '230205', '昂昂溪区', '63', '0');
INSERT INTO `common_city_zone` VALUES ('666', '230206', '富拉尔基区', '63', '0');
INSERT INTO `common_city_zone` VALUES ('667', '230207', '碾子山区', '63', '0');
INSERT INTO `common_city_zone` VALUES ('668', '230208', '梅里斯达斡尔族区', '63', '0');
INSERT INTO `common_city_zone` VALUES ('669', '230221', '龙江县', '63', '0');
INSERT INTO `common_city_zone` VALUES ('670', '230223', '依安县', '63', '0');
INSERT INTO `common_city_zone` VALUES ('671', '230224', '泰来县', '63', '0');
INSERT INTO `common_city_zone` VALUES ('672', '230225', '甘南县', '63', '0');
INSERT INTO `common_city_zone` VALUES ('673', '230227', '富裕县', '63', '0');
INSERT INTO `common_city_zone` VALUES ('674', '230229', '克山县', '63', '0');
INSERT INTO `common_city_zone` VALUES ('675', '230230', '克东县', '63', '0');
INSERT INTO `common_city_zone` VALUES ('676', '230231', '拜泉县', '63', '0');
INSERT INTO `common_city_zone` VALUES ('677', '230281', '讷河市', '63', '0');
INSERT INTO `common_city_zone` VALUES ('678', '230301', '市辖区', '64', '0');
INSERT INTO `common_city_zone` VALUES ('679', '230302', '鸡冠区', '64', '0');
INSERT INTO `common_city_zone` VALUES ('680', '230303', '恒山区', '64', '0');
INSERT INTO `common_city_zone` VALUES ('681', '230304', '滴道区', '64', '0');
INSERT INTO `common_city_zone` VALUES ('682', '230305', '梨树区', '64', '0');
INSERT INTO `common_city_zone` VALUES ('683', '230306', '城子河区', '64', '0');
INSERT INTO `common_city_zone` VALUES ('684', '230307', '麻山区', '64', '0');
INSERT INTO `common_city_zone` VALUES ('685', '230321', '鸡东县', '64', '0');
INSERT INTO `common_city_zone` VALUES ('686', '230381', '虎林市', '64', '0');
INSERT INTO `common_city_zone` VALUES ('687', '230382', '密山市', '64', '0');
INSERT INTO `common_city_zone` VALUES ('688', '230401', '市辖区', '65', '0');
INSERT INTO `common_city_zone` VALUES ('689', '230402', '向阳区', '65', '0');
INSERT INTO `common_city_zone` VALUES ('690', '230403', '工农区', '65', '0');
INSERT INTO `common_city_zone` VALUES ('691', '230404', '南山区', '65', '0');
INSERT INTO `common_city_zone` VALUES ('692', '230405', '兴安区', '65', '0');
INSERT INTO `common_city_zone` VALUES ('693', '230406', '东山区', '65', '0');
INSERT INTO `common_city_zone` VALUES ('694', '230407', '兴山区', '65', '0');
INSERT INTO `common_city_zone` VALUES ('695', '230421', '萝北县', '65', '0');
INSERT INTO `common_city_zone` VALUES ('696', '230422', '绥滨县', '65', '0');
INSERT INTO `common_city_zone` VALUES ('697', '230501', '市辖区', '66', '0');
INSERT INTO `common_city_zone` VALUES ('698', '230502', '尖山区', '66', '0');
INSERT INTO `common_city_zone` VALUES ('699', '230503', '岭东区', '66', '0');
INSERT INTO `common_city_zone` VALUES ('700', '230505', '四方台区', '66', '0');
INSERT INTO `common_city_zone` VALUES ('701', '230506', '宝山区', '66', '0');
INSERT INTO `common_city_zone` VALUES ('702', '230521', '集贤县', '66', '0');
INSERT INTO `common_city_zone` VALUES ('703', '230522', '友谊县', '66', '0');
INSERT INTO `common_city_zone` VALUES ('704', '230523', '宝清县', '66', '0');
INSERT INTO `common_city_zone` VALUES ('705', '230524', '饶河县', '66', '0');
INSERT INTO `common_city_zone` VALUES ('706', '230601', '市辖区', '67', '0');
INSERT INTO `common_city_zone` VALUES ('707', '230602', '萨尔图区', '67', '0');
INSERT INTO `common_city_zone` VALUES ('708', '230603', '龙凤区', '67', '0');
INSERT INTO `common_city_zone` VALUES ('709', '230604', '让胡路区', '67', '0');
INSERT INTO `common_city_zone` VALUES ('710', '230605', '红岗区', '67', '0');
INSERT INTO `common_city_zone` VALUES ('711', '230606', '大同区', '67', '0');
INSERT INTO `common_city_zone` VALUES ('712', '230621', '肇州县', '67', '0');
INSERT INTO `common_city_zone` VALUES ('713', '230622', '肇源县', '67', '0');
INSERT INTO `common_city_zone` VALUES ('714', '230623', '林甸县', '67', '0');
INSERT INTO `common_city_zone` VALUES ('715', '230624', '杜尔伯特蒙古族自治县', '67', '0');
INSERT INTO `common_city_zone` VALUES ('716', '230701', '市辖区', '68', '0');
INSERT INTO `common_city_zone` VALUES ('717', '230702', '伊春区', '68', '0');
INSERT INTO `common_city_zone` VALUES ('718', '230703', '南岔区', '68', '0');
INSERT INTO `common_city_zone` VALUES ('719', '230704', '友好区', '68', '0');
INSERT INTO `common_city_zone` VALUES ('720', '230705', '西林区', '68', '0');
INSERT INTO `common_city_zone` VALUES ('721', '230706', '翠峦区', '68', '0');
INSERT INTO `common_city_zone` VALUES ('722', '230707', '新青区', '68', '0');
INSERT INTO `common_city_zone` VALUES ('723', '230708', '美溪区', '68', '0');
INSERT INTO `common_city_zone` VALUES ('724', '230709', '金山屯区', '68', '0');
INSERT INTO `common_city_zone` VALUES ('725', '230710', '五营区', '68', '0');
INSERT INTO `common_city_zone` VALUES ('726', '230711', '乌马河区', '68', '0');
INSERT INTO `common_city_zone` VALUES ('727', '230712', '汤旺河区', '68', '0');
INSERT INTO `common_city_zone` VALUES ('728', '230713', '带岭区', '68', '0');
INSERT INTO `common_city_zone` VALUES ('729', '230714', '乌伊岭区', '68', '0');
INSERT INTO `common_city_zone` VALUES ('730', '230715', '红星区', '68', '0');
INSERT INTO `common_city_zone` VALUES ('731', '230716', '上甘岭区', '68', '0');
INSERT INTO `common_city_zone` VALUES ('732', '230722', '嘉荫县', '68', '0');
INSERT INTO `common_city_zone` VALUES ('733', '230781', '铁力市', '68', '0');
INSERT INTO `common_city_zone` VALUES ('734', '230801', '市辖区', '69', '0');
INSERT INTO `common_city_zone` VALUES ('735', '230802', '永红区', '69', '0');
INSERT INTO `common_city_zone` VALUES ('736', '230803', '向阳区', '69', '0');
INSERT INTO `common_city_zone` VALUES ('737', '230804', '前进区', '69', '0');
INSERT INTO `common_city_zone` VALUES ('738', '230805', '东风区', '69', '0');
INSERT INTO `common_city_zone` VALUES ('739', '230811', '郊　区', '69', '0');
INSERT INTO `common_city_zone` VALUES ('740', '230822', '桦南县', '69', '0');
INSERT INTO `common_city_zone` VALUES ('741', '230826', '桦川县', '69', '0');
INSERT INTO `common_city_zone` VALUES ('742', '230828', '汤原县', '69', '0');
INSERT INTO `common_city_zone` VALUES ('743', '230833', '抚远县', '69', '0');
INSERT INTO `common_city_zone` VALUES ('744', '230881', '同江市', '69', '0');
INSERT INTO `common_city_zone` VALUES ('745', '230882', '富锦市', '69', '0');
INSERT INTO `common_city_zone` VALUES ('746', '230901', '市辖区', '70', '0');
INSERT INTO `common_city_zone` VALUES ('747', '230902', '新兴区', '70', '0');
INSERT INTO `common_city_zone` VALUES ('748', '230903', '桃山区', '70', '0');
INSERT INTO `common_city_zone` VALUES ('749', '230904', '茄子河区', '70', '0');
INSERT INTO `common_city_zone` VALUES ('750', '230921', '勃利县', '70', '0');
INSERT INTO `common_city_zone` VALUES ('751', '231001', '市辖区', '71', '0');
INSERT INTO `common_city_zone` VALUES ('752', '231002', '东安区', '71', '0');
INSERT INTO `common_city_zone` VALUES ('753', '231003', '阳明区', '71', '0');
INSERT INTO `common_city_zone` VALUES ('754', '231004', '爱民区', '71', '0');
INSERT INTO `common_city_zone` VALUES ('755', '231005', '西安区', '71', '0');
INSERT INTO `common_city_zone` VALUES ('756', '231024', '东宁县', '71', '0');
INSERT INTO `common_city_zone` VALUES ('757', '231025', '林口县', '71', '0');
INSERT INTO `common_city_zone` VALUES ('758', '231081', '绥芬河市', '71', '0');
INSERT INTO `common_city_zone` VALUES ('759', '231083', '海林市', '71', '0');
INSERT INTO `common_city_zone` VALUES ('760', '231084', '宁安市', '71', '0');
INSERT INTO `common_city_zone` VALUES ('761', '231085', '穆棱市', '71', '0');
INSERT INTO `common_city_zone` VALUES ('762', '231101', '市辖区', '72', '0');
INSERT INTO `common_city_zone` VALUES ('763', '231102', '爱辉区', '72', '0');
INSERT INTO `common_city_zone` VALUES ('764', '231121', '嫩江县', '72', '0');
INSERT INTO `common_city_zone` VALUES ('765', '231123', '逊克县', '72', '0');
INSERT INTO `common_city_zone` VALUES ('766', '231124', '孙吴县', '72', '0');
INSERT INTO `common_city_zone` VALUES ('767', '231181', '北安市', '72', '0');
INSERT INTO `common_city_zone` VALUES ('768', '231182', '五大连池市', '72', '0');
INSERT INTO `common_city_zone` VALUES ('769', '231201', '市辖区', '73', '0');
INSERT INTO `common_city_zone` VALUES ('770', '231202', '北林区', '73', '0');
INSERT INTO `common_city_zone` VALUES ('771', '231221', '望奎县', '73', '0');
INSERT INTO `common_city_zone` VALUES ('772', '231222', '兰西县', '73', '0');
INSERT INTO `common_city_zone` VALUES ('773', '231223', '青冈县', '73', '0');
INSERT INTO `common_city_zone` VALUES ('774', '231224', '庆安县', '73', '0');
INSERT INTO `common_city_zone` VALUES ('775', '231225', '明水县', '73', '0');
INSERT INTO `common_city_zone` VALUES ('776', '231226', '绥棱县', '73', '0');
INSERT INTO `common_city_zone` VALUES ('777', '231281', '安达市', '73', '0');
INSERT INTO `common_city_zone` VALUES ('778', '231282', '肇东市', '73', '0');
INSERT INTO `common_city_zone` VALUES ('779', '231283', '海伦市', '73', '0');
INSERT INTO `common_city_zone` VALUES ('780', '232721', '呼玛县', '74', '0');
INSERT INTO `common_city_zone` VALUES ('781', '232722', '塔河县', '74', '0');
INSERT INTO `common_city_zone` VALUES ('782', '232723', '漠河县', '74', '0');
INSERT INTO `common_city_zone` VALUES ('783', '310101', '黄浦区', '75', '0');
INSERT INTO `common_city_zone` VALUES ('784', '310103', '卢湾区', '75', '0');
INSERT INTO `common_city_zone` VALUES ('785', '310104', '徐汇区', '75', '0');
INSERT INTO `common_city_zone` VALUES ('786', '310105', '长宁区', '75', '0');
INSERT INTO `common_city_zone` VALUES ('787', '310106', '静安区', '75', '0');
INSERT INTO `common_city_zone` VALUES ('788', '310107', '普陀区', '75', '0');
INSERT INTO `common_city_zone` VALUES ('789', '310108', '闸北区', '75', '0');
INSERT INTO `common_city_zone` VALUES ('790', '310109', '虹口区', '75', '0');
INSERT INTO `common_city_zone` VALUES ('791', '310110', '杨浦区', '75', '0');
INSERT INTO `common_city_zone` VALUES ('792', '310112', '闵行区', '75', '0');
INSERT INTO `common_city_zone` VALUES ('793', '310113', '宝山区', '75', '0');
INSERT INTO `common_city_zone` VALUES ('794', '310114', '嘉定区', '75', '0');
INSERT INTO `common_city_zone` VALUES ('795', '310115', '浦东新区', '75', '0');
INSERT INTO `common_city_zone` VALUES ('796', '310116', '金山区', '75', '0');
INSERT INTO `common_city_zone` VALUES ('797', '310117', '松江区', '75', '0');
INSERT INTO `common_city_zone` VALUES ('798', '310118', '青浦区', '75', '0');
INSERT INTO `common_city_zone` VALUES ('799', '310119', '南汇区', '75', '0');
INSERT INTO `common_city_zone` VALUES ('800', '310120', '奉贤区', '75', '0');
INSERT INTO `common_city_zone` VALUES ('801', '310230', '崇明县', '76', '0');
INSERT INTO `common_city_zone` VALUES ('802', '320101', '市辖区', '77', '0');
INSERT INTO `common_city_zone` VALUES ('803', '320102', '玄武区', '77', '0');
INSERT INTO `common_city_zone` VALUES ('804', '320103', '白下区', '77', '0');
INSERT INTO `common_city_zone` VALUES ('805', '320104', '秦淮区', '77', '0');
INSERT INTO `common_city_zone` VALUES ('806', '320105', '建邺区', '77', '0');
INSERT INTO `common_city_zone` VALUES ('807', '320106', '鼓楼区', '77', '0');
INSERT INTO `common_city_zone` VALUES ('808', '320107', '下关区', '77', '0');
INSERT INTO `common_city_zone` VALUES ('809', '320111', '浦口区', '77', '0');
INSERT INTO `common_city_zone` VALUES ('810', '320113', '栖霞区', '77', '0');
INSERT INTO `common_city_zone` VALUES ('811', '320114', '雨花台区', '77', '0');
INSERT INTO `common_city_zone` VALUES ('812', '320115', '江宁区', '77', '0');
INSERT INTO `common_city_zone` VALUES ('813', '320116', '六合区', '77', '0');
INSERT INTO `common_city_zone` VALUES ('814', '320124', '溧水县', '77', '0');
INSERT INTO `common_city_zone` VALUES ('815', '320125', '高淳县', '77', '0');
INSERT INTO `common_city_zone` VALUES ('816', '320201', '市辖区', '78', '0');
INSERT INTO `common_city_zone` VALUES ('817', '320202', '崇安区', '78', '0');
INSERT INTO `common_city_zone` VALUES ('818', '320203', '南长区', '78', '0');
INSERT INTO `common_city_zone` VALUES ('819', '320204', '北塘区', '78', '0');
INSERT INTO `common_city_zone` VALUES ('820', '320205', '锡山区', '78', '0');
INSERT INTO `common_city_zone` VALUES ('821', '320206', '惠山区', '78', '0');
INSERT INTO `common_city_zone` VALUES ('822', '320211', '滨湖区', '78', '0');
INSERT INTO `common_city_zone` VALUES ('823', '320281', '江阴市', '78', '0');
INSERT INTO `common_city_zone` VALUES ('824', '320282', '宜兴市', '78', '0');
INSERT INTO `common_city_zone` VALUES ('825', '320301', '市辖区', '79', '0');
INSERT INTO `common_city_zone` VALUES ('826', '320302', '鼓楼区', '79', '0');
INSERT INTO `common_city_zone` VALUES ('827', '320303', '云龙区', '79', '0');
INSERT INTO `common_city_zone` VALUES ('828', '320304', '九里区', '79', '0');
INSERT INTO `common_city_zone` VALUES ('829', '320305', '贾汪区', '79', '0');
INSERT INTO `common_city_zone` VALUES ('830', '320311', '泉山区', '79', '0');
INSERT INTO `common_city_zone` VALUES ('831', '320321', '丰　县', '79', '0');
INSERT INTO `common_city_zone` VALUES ('832', '320322', '沛　县', '79', '0');
INSERT INTO `common_city_zone` VALUES ('833', '320323', '铜山县', '79', '0');
INSERT INTO `common_city_zone` VALUES ('834', '320324', '睢宁县', '79', '0');
INSERT INTO `common_city_zone` VALUES ('835', '320381', '新沂市', '79', '0');
INSERT INTO `common_city_zone` VALUES ('836', '320382', '邳州市', '79', '0');
INSERT INTO `common_city_zone` VALUES ('837', '320401', '市辖区', '80', '0');
INSERT INTO `common_city_zone` VALUES ('838', '320402', '天宁区', '80', '0');
INSERT INTO `common_city_zone` VALUES ('839', '320404', '钟楼区', '80', '0');
INSERT INTO `common_city_zone` VALUES ('840', '320405', '戚墅堰区', '80', '0');
INSERT INTO `common_city_zone` VALUES ('841', '320411', '新北区', '80', '0');
INSERT INTO `common_city_zone` VALUES ('842', '320412', '武进区', '80', '0');
INSERT INTO `common_city_zone` VALUES ('843', '320481', '溧阳市', '80', '0');
INSERT INTO `common_city_zone` VALUES ('844', '320482', '金坛市', '80', '0');
INSERT INTO `common_city_zone` VALUES ('845', '110101', '东城区', '81', '0');
INSERT INTO `common_city_zone` VALUES ('846', '320502', '沧浪区', '1', '0');
INSERT INTO `common_city_zone` VALUES ('847', '320503', '平江区', '1', '0');
INSERT INTO `common_city_zone` VALUES ('848', '320504', '金阊区', '1', '0');
INSERT INTO `common_city_zone` VALUES ('849', '320505', '虎丘区', '1', '0');
INSERT INTO `common_city_zone` VALUES ('850', '320506', '吴中区', '1', '0');
INSERT INTO `common_city_zone` VALUES ('851', '320507', '相城区', '1', '0');
INSERT INTO `common_city_zone` VALUES ('852', '320581', '常熟市', '1', '0');
INSERT INTO `common_city_zone` VALUES ('853', '320582', '张家港市', '1', '0');
INSERT INTO `common_city_zone` VALUES ('854', '320583', '昆山市', '1', '0');
INSERT INTO `common_city_zone` VALUES ('855', '320584', '吴江市', '1', '0');
INSERT INTO `common_city_zone` VALUES ('856', '320585', '太仓市', '1', '0');
INSERT INTO `common_city_zone` VALUES ('857', '320601', '市辖区', '82', '0');
INSERT INTO `common_city_zone` VALUES ('858', '320602', '崇川区', '82', '0');
INSERT INTO `common_city_zone` VALUES ('859', '320611', '港闸区', '82', '0');
INSERT INTO `common_city_zone` VALUES ('860', '320621', '海安县', '82', '0');
INSERT INTO `common_city_zone` VALUES ('861', '320623', '如东县', '82', '0');
INSERT INTO `common_city_zone` VALUES ('862', '320681', '启东市', '82', '0');
INSERT INTO `common_city_zone` VALUES ('863', '320682', '如皋市', '82', '0');
INSERT INTO `common_city_zone` VALUES ('864', '320683', '通州市', '82', '0');
INSERT INTO `common_city_zone` VALUES ('865', '320684', '海门市', '82', '0');
INSERT INTO `common_city_zone` VALUES ('866', '320701', '市辖区', '83', '0');
INSERT INTO `common_city_zone` VALUES ('867', '320703', '连云区', '83', '0');
INSERT INTO `common_city_zone` VALUES ('868', '320705', '新浦区', '83', '0');
INSERT INTO `common_city_zone` VALUES ('869', '320706', '海州区', '83', '0');
INSERT INTO `common_city_zone` VALUES ('870', '320721', '赣榆县', '83', '0');
INSERT INTO `common_city_zone` VALUES ('871', '320722', '东海县', '83', '0');
INSERT INTO `common_city_zone` VALUES ('872', '320723', '灌云县', '83', '0');
INSERT INTO `common_city_zone` VALUES ('873', '320724', '灌南县', '83', '0');
INSERT INTO `common_city_zone` VALUES ('874', '320801', '市辖区', '84', '0');
INSERT INTO `common_city_zone` VALUES ('875', '320802', '清河区', '84', '0');
INSERT INTO `common_city_zone` VALUES ('876', '320803', '楚州区', '84', '0');
INSERT INTO `common_city_zone` VALUES ('877', '320804', '淮阴区', '84', '0');
INSERT INTO `common_city_zone` VALUES ('878', '320811', '清浦区', '84', '0');
INSERT INTO `common_city_zone` VALUES ('879', '320826', '涟水县', '84', '0');
INSERT INTO `common_city_zone` VALUES ('880', '320829', '洪泽县', '84', '0');
INSERT INTO `common_city_zone` VALUES ('881', '320830', '盱眙县', '84', '0');
INSERT INTO `common_city_zone` VALUES ('882', '320831', '金湖县', '84', '0');
INSERT INTO `common_city_zone` VALUES ('883', '320901', '市辖区', '85', '0');
INSERT INTO `common_city_zone` VALUES ('884', '320902', '亭湖区', '85', '0');
INSERT INTO `common_city_zone` VALUES ('885', '320903', '盐都区', '85', '0');
INSERT INTO `common_city_zone` VALUES ('886', '320921', '响水县', '85', '0');
INSERT INTO `common_city_zone` VALUES ('887', '320922', '滨海县', '85', '0');
INSERT INTO `common_city_zone` VALUES ('888', '320923', '阜宁县', '85', '0');
INSERT INTO `common_city_zone` VALUES ('889', '320924', '射阳县', '85', '0');
INSERT INTO `common_city_zone` VALUES ('890', '320925', '建湖县', '85', '0');
INSERT INTO `common_city_zone` VALUES ('891', '320981', '东台市', '85', '0');
INSERT INTO `common_city_zone` VALUES ('892', '320982', '大丰市', '85', '0');
INSERT INTO `common_city_zone` VALUES ('893', '321001', '市辖区', '86', '0');
INSERT INTO `common_city_zone` VALUES ('894', '321002', '广陵区', '86', '0');
INSERT INTO `common_city_zone` VALUES ('895', '321003', '邗江区', '86', '0');
INSERT INTO `common_city_zone` VALUES ('896', '321011', '郊　区', '86', '0');
INSERT INTO `common_city_zone` VALUES ('897', '321023', '宝应县', '86', '0');
INSERT INTO `common_city_zone` VALUES ('898', '321081', '仪征市', '86', '0');
INSERT INTO `common_city_zone` VALUES ('899', '321084', '高邮市', '86', '0');
INSERT INTO `common_city_zone` VALUES ('900', '321088', '江都市', '86', '0');
INSERT INTO `common_city_zone` VALUES ('901', '321101', '市辖区', '87', '0');
INSERT INTO `common_city_zone` VALUES ('902', '321102', '京口区', '87', '0');
INSERT INTO `common_city_zone` VALUES ('903', '321111', '润州区', '87', '0');
INSERT INTO `common_city_zone` VALUES ('904', '321112', '丹徒区', '87', '0');
INSERT INTO `common_city_zone` VALUES ('905', '321181', '丹阳市', '87', '0');
INSERT INTO `common_city_zone` VALUES ('906', '321182', '扬中市', '87', '0');
INSERT INTO `common_city_zone` VALUES ('907', '321183', '句容市', '87', '0');
INSERT INTO `common_city_zone` VALUES ('908', '321201', '市辖区', '88', '0');
INSERT INTO `common_city_zone` VALUES ('909', '321202', '海陵区', '88', '0');
INSERT INTO `common_city_zone` VALUES ('910', '321203', '高港区', '88', '0');
INSERT INTO `common_city_zone` VALUES ('911', '321281', '兴化市', '88', '0');
INSERT INTO `common_city_zone` VALUES ('912', '321282', '靖江市', '88', '0');
INSERT INTO `common_city_zone` VALUES ('913', '321283', '泰兴市', '88', '0');
INSERT INTO `common_city_zone` VALUES ('914', '321284', '姜堰市', '88', '0');
INSERT INTO `common_city_zone` VALUES ('915', '321301', '市辖区', '89', '0');
INSERT INTO `common_city_zone` VALUES ('916', '321302', '宿城区', '89', '0');
INSERT INTO `common_city_zone` VALUES ('917', '321311', '宿豫区', '89', '0');
INSERT INTO `common_city_zone` VALUES ('918', '321322', '沭阳县', '89', '0');
INSERT INTO `common_city_zone` VALUES ('919', '321323', '泗阳县', '89', '0');
INSERT INTO `common_city_zone` VALUES ('920', '321324', '泗洪县', '89', '0');
INSERT INTO `common_city_zone` VALUES ('921', '330101', '市辖区', '90', '0');
INSERT INTO `common_city_zone` VALUES ('922', '330102', '上城区', '90', '0');
INSERT INTO `common_city_zone` VALUES ('923', '330103', '下城区', '90', '0');
INSERT INTO `common_city_zone` VALUES ('924', '330104', '江干区', '90', '0');
INSERT INTO `common_city_zone` VALUES ('925', '330105', '拱墅区', '90', '0');
INSERT INTO `common_city_zone` VALUES ('926', '330106', '西湖区', '90', '0');
INSERT INTO `common_city_zone` VALUES ('927', '330108', '滨江区', '90', '0');
INSERT INTO `common_city_zone` VALUES ('928', '330109', '萧山区', '90', '0');
INSERT INTO `common_city_zone` VALUES ('929', '330110', '余杭区', '90', '0');
INSERT INTO `common_city_zone` VALUES ('930', '330122', '桐庐县', '90', '0');
INSERT INTO `common_city_zone` VALUES ('931', '330127', '淳安县', '90', '0');
INSERT INTO `common_city_zone` VALUES ('932', '330182', '建德市', '90', '0');
INSERT INTO `common_city_zone` VALUES ('933', '330183', '富阳市', '90', '0');
INSERT INTO `common_city_zone` VALUES ('934', '330185', '临安市', '90', '0');
INSERT INTO `common_city_zone` VALUES ('935', '330201', '市辖区', '91', '0');
INSERT INTO `common_city_zone` VALUES ('936', '330203', '海曙区', '91', '0');
INSERT INTO `common_city_zone` VALUES ('937', '330204', '江东区', '91', '0');
INSERT INTO `common_city_zone` VALUES ('938', '330205', '江北区', '91', '0');
INSERT INTO `common_city_zone` VALUES ('939', '330206', '北仑区', '91', '0');
INSERT INTO `common_city_zone` VALUES ('940', '330211', '镇海区', '91', '0');
INSERT INTO `common_city_zone` VALUES ('941', '330212', '鄞州区', '91', '0');
INSERT INTO `common_city_zone` VALUES ('942', '330225', '象山县', '91', '0');
INSERT INTO `common_city_zone` VALUES ('943', '330226', '宁海县', '91', '0');
INSERT INTO `common_city_zone` VALUES ('944', '330281', '余姚市', '91', '0');
INSERT INTO `common_city_zone` VALUES ('945', '330282', '慈溪市', '91', '0');
INSERT INTO `common_city_zone` VALUES ('946', '330283', '奉化市', '91', '0');
INSERT INTO `common_city_zone` VALUES ('947', '330301', '市辖区', '92', '0');
INSERT INTO `common_city_zone` VALUES ('948', '330302', '鹿城区', '92', '0');
INSERT INTO `common_city_zone` VALUES ('949', '330303', '龙湾区', '92', '0');
INSERT INTO `common_city_zone` VALUES ('950', '330304', '瓯海区', '92', '0');
INSERT INTO `common_city_zone` VALUES ('951', '330322', '洞头县', '92', '0');
INSERT INTO `common_city_zone` VALUES ('952', '330324', '永嘉县', '92', '0');
INSERT INTO `common_city_zone` VALUES ('953', '330326', '平阳县', '92', '0');
INSERT INTO `common_city_zone` VALUES ('954', '330327', '苍南县', '92', '0');
INSERT INTO `common_city_zone` VALUES ('955', '330328', '文成县', '92', '0');
INSERT INTO `common_city_zone` VALUES ('956', '330329', '泰顺县', '92', '0');
INSERT INTO `common_city_zone` VALUES ('957', '330381', '瑞安市', '92', '0');
INSERT INTO `common_city_zone` VALUES ('958', '330382', '乐清市', '92', '0');
INSERT INTO `common_city_zone` VALUES ('959', '330401', '市辖区', '93', '0');
INSERT INTO `common_city_zone` VALUES ('960', '330402', '秀城区', '93', '0');
INSERT INTO `common_city_zone` VALUES ('961', '330411', '秀洲区', '93', '0');
INSERT INTO `common_city_zone` VALUES ('962', '330421', '嘉善县', '93', '0');
INSERT INTO `common_city_zone` VALUES ('963', '330424', '海盐县', '93', '0');
INSERT INTO `common_city_zone` VALUES ('964', '330481', '海宁市', '93', '0');
INSERT INTO `common_city_zone` VALUES ('965', '330482', '平湖市', '93', '0');
INSERT INTO `common_city_zone` VALUES ('966', '330483', '桐乡市', '93', '0');
INSERT INTO `common_city_zone` VALUES ('967', '330501', '市辖区', '94', '0');
INSERT INTO `common_city_zone` VALUES ('968', '330502', '吴兴区', '94', '0');
INSERT INTO `common_city_zone` VALUES ('969', '330503', '南浔区', '94', '0');
INSERT INTO `common_city_zone` VALUES ('970', '330521', '德清县', '94', '0');
INSERT INTO `common_city_zone` VALUES ('971', '330522', '长兴县', '94', '0');
INSERT INTO `common_city_zone` VALUES ('972', '330523', '安吉县', '94', '0');
INSERT INTO `common_city_zone` VALUES ('973', '330601', '市辖区', '95', '0');
INSERT INTO `common_city_zone` VALUES ('974', '330602', '越城区', '95', '0');
INSERT INTO `common_city_zone` VALUES ('975', '330621', '绍兴县', '95', '0');
INSERT INTO `common_city_zone` VALUES ('976', '330624', '新昌县', '95', '0');
INSERT INTO `common_city_zone` VALUES ('977', '330681', '诸暨市', '95', '0');
INSERT INTO `common_city_zone` VALUES ('978', '330682', '上虞市', '95', '0');
INSERT INTO `common_city_zone` VALUES ('979', '330683', '嵊州市', '95', '0');
INSERT INTO `common_city_zone` VALUES ('980', '330701', '市辖区', '96', '0');
INSERT INTO `common_city_zone` VALUES ('981', '330702', '婺城区', '96', '0');
INSERT INTO `common_city_zone` VALUES ('982', '330703', '金东区', '96', '0');
INSERT INTO `common_city_zone` VALUES ('983', '330723', '武义县', '96', '0');
INSERT INTO `common_city_zone` VALUES ('984', '330726', '浦江县', '96', '0');
INSERT INTO `common_city_zone` VALUES ('985', '330727', '磐安县', '96', '0');
INSERT INTO `common_city_zone` VALUES ('986', '330781', '兰溪市', '96', '0');
INSERT INTO `common_city_zone` VALUES ('987', '330782', '义乌市', '96', '0');
INSERT INTO `common_city_zone` VALUES ('988', '330783', '东阳市', '96', '0');
INSERT INTO `common_city_zone` VALUES ('989', '330784', '永康市', '96', '0');
INSERT INTO `common_city_zone` VALUES ('990', '330801', '市辖区', '97', '0');
INSERT INTO `common_city_zone` VALUES ('991', '330802', '柯城区', '97', '0');
INSERT INTO `common_city_zone` VALUES ('992', '330803', '衢江区', '97', '0');
INSERT INTO `common_city_zone` VALUES ('993', '330822', '常山县', '97', '0');
INSERT INTO `common_city_zone` VALUES ('994', '330824', '开化县', '97', '0');
INSERT INTO `common_city_zone` VALUES ('995', '330825', '龙游县', '97', '0');
INSERT INTO `common_city_zone` VALUES ('996', '330881', '江山市', '97', '0');
INSERT INTO `common_city_zone` VALUES ('997', '330901', '市辖区', '98', '0');
INSERT INTO `common_city_zone` VALUES ('998', '330902', '定海区', '98', '0');
INSERT INTO `common_city_zone` VALUES ('999', '330903', '普陀区', '98', '0');
INSERT INTO `common_city_zone` VALUES ('1000', '330921', '岱山县', '98', '0');
INSERT INTO `common_city_zone` VALUES ('1001', '330922', '嵊泗县', '98', '0');
INSERT INTO `common_city_zone` VALUES ('1002', '331001', '市辖区', '99', '0');
INSERT INTO `common_city_zone` VALUES ('1003', '331002', '椒江区', '99', '0');
INSERT INTO `common_city_zone` VALUES ('1004', '331003', '黄岩区', '99', '0');
INSERT INTO `common_city_zone` VALUES ('1005', '331004', '路桥区', '99', '0');
INSERT INTO `common_city_zone` VALUES ('1006', '331021', '玉环县', '99', '0');
INSERT INTO `common_city_zone` VALUES ('1007', '331022', '三门县', '99', '0');
INSERT INTO `common_city_zone` VALUES ('1008', '331023', '天台县', '99', '0');
INSERT INTO `common_city_zone` VALUES ('1009', '331024', '仙居县', '99', '0');
INSERT INTO `common_city_zone` VALUES ('1010', '331081', '温岭市', '99', '0');
INSERT INTO `common_city_zone` VALUES ('1011', '331082', '临海市', '99', '0');
INSERT INTO `common_city_zone` VALUES ('1012', '331101', '市辖区', '100', '0');
INSERT INTO `common_city_zone` VALUES ('1013', '331102', '莲都区', '100', '0');
INSERT INTO `common_city_zone` VALUES ('1014', '331121', '青田县', '100', '0');
INSERT INTO `common_city_zone` VALUES ('1015', '331122', '缙云县', '100', '0');
INSERT INTO `common_city_zone` VALUES ('1016', '331123', '遂昌县', '100', '0');
INSERT INTO `common_city_zone` VALUES ('1017', '331124', '松阳县', '100', '0');
INSERT INTO `common_city_zone` VALUES ('1018', '331125', '云和县', '100', '0');
INSERT INTO `common_city_zone` VALUES ('1019', '331126', '庆元县', '100', '0');
INSERT INTO `common_city_zone` VALUES ('1020', '331127', '景宁畲族自治县', '100', '0');
INSERT INTO `common_city_zone` VALUES ('1021', '331181', '龙泉市', '100', '0');
INSERT INTO `common_city_zone` VALUES ('1022', '340101', '市辖区', '101', '0');
INSERT INTO `common_city_zone` VALUES ('1023', '340102', '瑶海区', '101', '0');
INSERT INTO `common_city_zone` VALUES ('1024', '340103', '庐阳区', '101', '0');
INSERT INTO `common_city_zone` VALUES ('1025', '340104', '蜀山区', '101', '0');
INSERT INTO `common_city_zone` VALUES ('1026', '340111', '包河区', '101', '0');
INSERT INTO `common_city_zone` VALUES ('1027', '340121', '长丰县', '101', '0');
INSERT INTO `common_city_zone` VALUES ('1028', '340122', '肥东县', '101', '0');
INSERT INTO `common_city_zone` VALUES ('1029', '340123', '肥西县', '101', '0');
INSERT INTO `common_city_zone` VALUES ('1030', '340201', '市辖区', '102', '0');
INSERT INTO `common_city_zone` VALUES ('1031', '340202', '镜湖区', '102', '0');
INSERT INTO `common_city_zone` VALUES ('1032', '340203', '马塘区', '102', '0');
INSERT INTO `common_city_zone` VALUES ('1033', '340204', '新芜区', '102', '0');
INSERT INTO `common_city_zone` VALUES ('1034', '340207', '鸠江区', '102', '0');
INSERT INTO `common_city_zone` VALUES ('1035', '340221', '芜湖县', '102', '0');
INSERT INTO `common_city_zone` VALUES ('1036', '340222', '繁昌县', '102', '0');
INSERT INTO `common_city_zone` VALUES ('1037', '340223', '南陵县', '102', '0');
INSERT INTO `common_city_zone` VALUES ('1038', '340301', '市辖区', '103', '0');
INSERT INTO `common_city_zone` VALUES ('1039', '340302', '龙子湖区', '103', '0');
INSERT INTO `common_city_zone` VALUES ('1040', '340303', '蚌山区', '103', '0');
INSERT INTO `common_city_zone` VALUES ('1041', '340304', '禹会区', '103', '0');
INSERT INTO `common_city_zone` VALUES ('1042', '340311', '淮上区', '103', '0');
INSERT INTO `common_city_zone` VALUES ('1043', '340321', '怀远县', '103', '0');
INSERT INTO `common_city_zone` VALUES ('1044', '340322', '五河县', '103', '0');
INSERT INTO `common_city_zone` VALUES ('1045', '340323', '固镇县', '103', '0');
INSERT INTO `common_city_zone` VALUES ('1046', '340401', '市辖区', '104', '0');
INSERT INTO `common_city_zone` VALUES ('1047', '340402', '大通区', '104', '0');
INSERT INTO `common_city_zone` VALUES ('1048', '340403', '田家庵区', '104', '0');
INSERT INTO `common_city_zone` VALUES ('1049', '340404', '谢家集区', '104', '0');
INSERT INTO `common_city_zone` VALUES ('1050', '340405', '八公山区', '104', '0');
INSERT INTO `common_city_zone` VALUES ('1051', '340406', '潘集区', '104', '0');
INSERT INTO `common_city_zone` VALUES ('1052', '340421', '凤台县', '104', '0');
INSERT INTO `common_city_zone` VALUES ('1053', '340501', '市辖区', '105', '0');
INSERT INTO `common_city_zone` VALUES ('1054', '340502', '金家庄区', '105', '0');
INSERT INTO `common_city_zone` VALUES ('1055', '340503', '花山区', '105', '0');
INSERT INTO `common_city_zone` VALUES ('1056', '340504', '雨山区', '105', '0');
INSERT INTO `common_city_zone` VALUES ('1057', '340521', '当涂县', '105', '0');
INSERT INTO `common_city_zone` VALUES ('1058', '340601', '市辖区', '106', '0');
INSERT INTO `common_city_zone` VALUES ('1059', '340602', '杜集区', '106', '0');
INSERT INTO `common_city_zone` VALUES ('1060', '340603', '相山区', '106', '0');
INSERT INTO `common_city_zone` VALUES ('1061', '340604', '烈山区', '106', '0');
INSERT INTO `common_city_zone` VALUES ('1062', '340621', '濉溪县', '106', '0');
INSERT INTO `common_city_zone` VALUES ('1063', '340701', '市辖区', '107', '0');
INSERT INTO `common_city_zone` VALUES ('1064', '340702', '铜官山区', '107', '0');
INSERT INTO `common_city_zone` VALUES ('1065', '340703', '狮子山区', '107', '0');
INSERT INTO `common_city_zone` VALUES ('1066', '340711', '郊　区', '107', '0');
INSERT INTO `common_city_zone` VALUES ('1067', '340721', '铜陵县', '107', '0');
INSERT INTO `common_city_zone` VALUES ('1068', '340801', '市辖区', '108', '0');
INSERT INTO `common_city_zone` VALUES ('1069', '340802', '迎江区', '108', '0');
INSERT INTO `common_city_zone` VALUES ('1070', '340803', '大观区', '108', '0');
INSERT INTO `common_city_zone` VALUES ('1071', '340811', '郊　区', '108', '0');
INSERT INTO `common_city_zone` VALUES ('1072', '340822', '怀宁县', '108', '0');
INSERT INTO `common_city_zone` VALUES ('1073', '340823', '枞阳县', '108', '0');
INSERT INTO `common_city_zone` VALUES ('1074', '340824', '潜山县', '108', '0');
INSERT INTO `common_city_zone` VALUES ('1075', '340825', '太湖县', '108', '0');
INSERT INTO `common_city_zone` VALUES ('1076', '340826', '宿松县', '108', '0');
INSERT INTO `common_city_zone` VALUES ('1077', '340827', '望江县', '108', '0');
INSERT INTO `common_city_zone` VALUES ('1078', '340828', '岳西县', '108', '0');
INSERT INTO `common_city_zone` VALUES ('1079', '340881', '桐城市', '108', '0');
INSERT INTO `common_city_zone` VALUES ('1080', '341001', '市辖区', '109', '0');
INSERT INTO `common_city_zone` VALUES ('1081', '341002', '屯溪区', '109', '0');
INSERT INTO `common_city_zone` VALUES ('1082', '341003', '黄山区', '109', '0');
INSERT INTO `common_city_zone` VALUES ('1083', '341004', '徽州区', '109', '0');
INSERT INTO `common_city_zone` VALUES ('1084', '341021', '歙　县', '109', '0');
INSERT INTO `common_city_zone` VALUES ('1085', '341022', '休宁县', '109', '0');
INSERT INTO `common_city_zone` VALUES ('1086', '341023', '黟　县', '109', '0');
INSERT INTO `common_city_zone` VALUES ('1087', '341024', '祁门县', '109', '0');
INSERT INTO `common_city_zone` VALUES ('1088', '341101', '市辖区', '110', '0');
INSERT INTO `common_city_zone` VALUES ('1089', '341102', '琅琊区', '110', '0');
INSERT INTO `common_city_zone` VALUES ('1090', '341103', '南谯区', '110', '0');
INSERT INTO `common_city_zone` VALUES ('1091', '341122', '来安县', '110', '0');
INSERT INTO `common_city_zone` VALUES ('1092', '341124', '全椒县', '110', '0');
INSERT INTO `common_city_zone` VALUES ('1093', '341125', '定远县', '110', '0');
INSERT INTO `common_city_zone` VALUES ('1094', '341126', '凤阳县', '110', '0');
INSERT INTO `common_city_zone` VALUES ('1095', '341181', '天长市', '110', '0');
INSERT INTO `common_city_zone` VALUES ('1096', '341182', '明光市', '110', '0');
INSERT INTO `common_city_zone` VALUES ('1097', '341201', '市辖区', '111', '0');
INSERT INTO `common_city_zone` VALUES ('1098', '341202', '颍州区', '111', '0');
INSERT INTO `common_city_zone` VALUES ('1099', '341203', '颍东区', '111', '0');
INSERT INTO `common_city_zone` VALUES ('1100', '341204', '颍泉区', '111', '0');
INSERT INTO `common_city_zone` VALUES ('1101', '341221', '临泉县', '111', '0');
INSERT INTO `common_city_zone` VALUES ('1102', '341222', '太和县', '111', '0');
INSERT INTO `common_city_zone` VALUES ('1103', '341225', '阜南县', '111', '0');
INSERT INTO `common_city_zone` VALUES ('1104', '341226', '颍上县', '111', '0');
INSERT INTO `common_city_zone` VALUES ('1105', '341282', '界首市', '111', '0');
INSERT INTO `common_city_zone` VALUES ('1106', '341301', '市辖区', '112', '0');
INSERT INTO `common_city_zone` VALUES ('1107', '341302', '墉桥区', '112', '0');
INSERT INTO `common_city_zone` VALUES ('1108', '341321', '砀山县', '112', '0');
INSERT INTO `common_city_zone` VALUES ('1109', '341322', '萧　县', '112', '0');
INSERT INTO `common_city_zone` VALUES ('1110', '341323', '灵璧县', '112', '0');
INSERT INTO `common_city_zone` VALUES ('1111', '341324', '泗　县', '112', '0');
INSERT INTO `common_city_zone` VALUES ('1112', '341401', '市辖区', '113', '0');
INSERT INTO `common_city_zone` VALUES ('1113', '341402', '居巢区', '113', '0');
INSERT INTO `common_city_zone` VALUES ('1114', '341421', '庐江县', '113', '0');
INSERT INTO `common_city_zone` VALUES ('1115', '341422', '无为县', '113', '0');
INSERT INTO `common_city_zone` VALUES ('1116', '341423', '含山县', '113', '0');
INSERT INTO `common_city_zone` VALUES ('1117', '341424', '和　县', '113', '0');
INSERT INTO `common_city_zone` VALUES ('1118', '341501', '市辖区', '114', '0');
INSERT INTO `common_city_zone` VALUES ('1119', '341502', '金安区', '114', '0');
INSERT INTO `common_city_zone` VALUES ('1120', '341503', '裕安区', '114', '0');
INSERT INTO `common_city_zone` VALUES ('1121', '341521', '寿　县', '114', '0');
INSERT INTO `common_city_zone` VALUES ('1122', '341522', '霍邱县', '114', '0');
INSERT INTO `common_city_zone` VALUES ('1123', '341523', '舒城县', '114', '0');
INSERT INTO `common_city_zone` VALUES ('1124', '341524', '金寨县', '114', '0');
INSERT INTO `common_city_zone` VALUES ('1125', '341525', '霍山县', '114', '0');
INSERT INTO `common_city_zone` VALUES ('1126', '341601', '市辖区', '115', '0');
INSERT INTO `common_city_zone` VALUES ('1127', '341602', '谯城区', '115', '0');
INSERT INTO `common_city_zone` VALUES ('1128', '341621', '涡阳县', '115', '0');
INSERT INTO `common_city_zone` VALUES ('1129', '341622', '蒙城县', '115', '0');
INSERT INTO `common_city_zone` VALUES ('1130', '341623', '利辛县', '115', '0');
INSERT INTO `common_city_zone` VALUES ('1131', '341701', '市辖区', '116', '0');
INSERT INTO `common_city_zone` VALUES ('1132', '341702', '贵池区', '116', '0');
INSERT INTO `common_city_zone` VALUES ('1133', '341721', '东至县', '116', '0');
INSERT INTO `common_city_zone` VALUES ('1134', '341722', '石台县', '116', '0');
INSERT INTO `common_city_zone` VALUES ('1135', '341723', '青阳县', '116', '0');
INSERT INTO `common_city_zone` VALUES ('1136', '341801', '市辖区', '117', '0');
INSERT INTO `common_city_zone` VALUES ('1137', '341802', '宣州区', '117', '0');
INSERT INTO `common_city_zone` VALUES ('1138', '341821', '郎溪县', '117', '0');
INSERT INTO `common_city_zone` VALUES ('1139', '341822', '广德县', '117', '0');
INSERT INTO `common_city_zone` VALUES ('1140', '341823', '泾　县', '117', '0');
INSERT INTO `common_city_zone` VALUES ('1141', '341824', '绩溪县', '117', '0');
INSERT INTO `common_city_zone` VALUES ('1142', '341825', '旌德县', '117', '0');
INSERT INTO `common_city_zone` VALUES ('1143', '341881', '宁国市', '117', '0');
INSERT INTO `common_city_zone` VALUES ('1144', '350101', '市辖区', '118', '0');
INSERT INTO `common_city_zone` VALUES ('1145', '350102', '鼓楼区', '118', '0');
INSERT INTO `common_city_zone` VALUES ('1146', '350103', '台江区', '118', '0');
INSERT INTO `common_city_zone` VALUES ('1147', '350104', '仓山区', '118', '0');
INSERT INTO `common_city_zone` VALUES ('1148', '350105', '马尾区', '118', '0');
INSERT INTO `common_city_zone` VALUES ('1149', '350111', '晋安区', '118', '0');
INSERT INTO `common_city_zone` VALUES ('1150', '350121', '闽侯县', '118', '0');
INSERT INTO `common_city_zone` VALUES ('1151', '350122', '连江县', '118', '0');
INSERT INTO `common_city_zone` VALUES ('1152', '350123', '罗源县', '118', '0');
INSERT INTO `common_city_zone` VALUES ('1153', '350124', '闽清县', '118', '0');
INSERT INTO `common_city_zone` VALUES ('1154', '350125', '永泰县', '118', '0');
INSERT INTO `common_city_zone` VALUES ('1155', '350128', '平潭县', '118', '0');
INSERT INTO `common_city_zone` VALUES ('1156', '350181', '福清市', '118', '0');
INSERT INTO `common_city_zone` VALUES ('1157', '350182', '长乐市', '118', '0');
INSERT INTO `common_city_zone` VALUES ('1158', '350201', '市辖区', '119', '0');
INSERT INTO `common_city_zone` VALUES ('1159', '350203', '思明区', '119', '0');
INSERT INTO `common_city_zone` VALUES ('1160', '350205', '海沧区', '119', '0');
INSERT INTO `common_city_zone` VALUES ('1161', '350206', '湖里区', '119', '0');
INSERT INTO `common_city_zone` VALUES ('1162', '350211', '集美区', '119', '0');
INSERT INTO `common_city_zone` VALUES ('1163', '350212', '同安区', '119', '0');
INSERT INTO `common_city_zone` VALUES ('1164', '350213', '翔安区', '119', '0');
INSERT INTO `common_city_zone` VALUES ('1165', '350301', '市辖区', '120', '0');
INSERT INTO `common_city_zone` VALUES ('1166', '350302', '城厢区', '120', '0');
INSERT INTO `common_city_zone` VALUES ('1167', '350303', '涵江区', '120', '0');
INSERT INTO `common_city_zone` VALUES ('1168', '350304', '荔城区', '120', '0');
INSERT INTO `common_city_zone` VALUES ('1169', '350305', '秀屿区', '120', '0');
INSERT INTO `common_city_zone` VALUES ('1170', '350322', '仙游县', '120', '0');
INSERT INTO `common_city_zone` VALUES ('1171', '350401', '市辖区', '121', '0');
INSERT INTO `common_city_zone` VALUES ('1172', '350402', '梅列区', '121', '0');
INSERT INTO `common_city_zone` VALUES ('1173', '350403', '三元区', '121', '0');
INSERT INTO `common_city_zone` VALUES ('1174', '350421', '明溪县', '121', '0');
INSERT INTO `common_city_zone` VALUES ('1175', '350423', '清流县', '121', '0');
INSERT INTO `common_city_zone` VALUES ('1176', '350424', '宁化县', '121', '0');
INSERT INTO `common_city_zone` VALUES ('1177', '350425', '大田县', '121', '0');
INSERT INTO `common_city_zone` VALUES ('1178', '350426', '尤溪县', '121', '0');
INSERT INTO `common_city_zone` VALUES ('1179', '350427', '沙　县', '121', '0');
INSERT INTO `common_city_zone` VALUES ('1180', '350428', '将乐县', '121', '0');
INSERT INTO `common_city_zone` VALUES ('1181', '350429', '泰宁县', '121', '0');
INSERT INTO `common_city_zone` VALUES ('1182', '350430', '建宁县', '121', '0');
INSERT INTO `common_city_zone` VALUES ('1183', '350481', '永安市', '121', '0');
INSERT INTO `common_city_zone` VALUES ('1184', '350501', '市辖区', '122', '0');
INSERT INTO `common_city_zone` VALUES ('1185', '350502', '鲤城区', '122', '0');
INSERT INTO `common_city_zone` VALUES ('1186', '350503', '丰泽区', '122', '0');
INSERT INTO `common_city_zone` VALUES ('1187', '350504', '洛江区', '122', '0');
INSERT INTO `common_city_zone` VALUES ('1188', '350505', '泉港区', '122', '0');
INSERT INTO `common_city_zone` VALUES ('1189', '350521', '惠安县', '122', '0');
INSERT INTO `common_city_zone` VALUES ('1190', '350524', '安溪县', '122', '0');
INSERT INTO `common_city_zone` VALUES ('1191', '350525', '永春县', '122', '0');
INSERT INTO `common_city_zone` VALUES ('1192', '350526', '德化县', '122', '0');
INSERT INTO `common_city_zone` VALUES ('1193', '350527', '金门县', '122', '0');
INSERT INTO `common_city_zone` VALUES ('1194', '350581', '石狮市', '122', '0');
INSERT INTO `common_city_zone` VALUES ('1195', '350582', '晋江市', '122', '0');
INSERT INTO `common_city_zone` VALUES ('1196', '350583', '南安市', '122', '0');
INSERT INTO `common_city_zone` VALUES ('1197', '350601', '市辖区', '123', '0');
INSERT INTO `common_city_zone` VALUES ('1198', '350602', '芗城区', '123', '0');
INSERT INTO `common_city_zone` VALUES ('1199', '350603', '龙文区', '123', '0');
INSERT INTO `common_city_zone` VALUES ('1200', '350622', '云霄县', '123', '0');
INSERT INTO `common_city_zone` VALUES ('1201', '350623', '漳浦县', '123', '0');
INSERT INTO `common_city_zone` VALUES ('1202', '350624', '诏安县', '123', '0');
INSERT INTO `common_city_zone` VALUES ('1203', '350625', '长泰县', '123', '0');
INSERT INTO `common_city_zone` VALUES ('1204', '350626', '东山县', '123', '0');
INSERT INTO `common_city_zone` VALUES ('1205', '350627', '南靖县', '123', '0');
INSERT INTO `common_city_zone` VALUES ('1206', '350628', '平和县', '123', '0');
INSERT INTO `common_city_zone` VALUES ('1207', '350629', '华安县', '123', '0');
INSERT INTO `common_city_zone` VALUES ('1208', '350681', '龙海市', '123', '0');
INSERT INTO `common_city_zone` VALUES ('1209', '350701', '市辖区', '124', '0');
INSERT INTO `common_city_zone` VALUES ('1210', '350702', '延平区', '124', '0');
INSERT INTO `common_city_zone` VALUES ('1211', '350721', '顺昌县', '124', '0');
INSERT INTO `common_city_zone` VALUES ('1212', '350722', '浦城县', '124', '0');
INSERT INTO `common_city_zone` VALUES ('1213', '350723', '光泽县', '124', '0');
INSERT INTO `common_city_zone` VALUES ('1214', '350724', '松溪县', '124', '0');
INSERT INTO `common_city_zone` VALUES ('1215', '350725', '政和县', '124', '0');
INSERT INTO `common_city_zone` VALUES ('1216', '350781', '邵武市', '124', '0');
INSERT INTO `common_city_zone` VALUES ('1217', '350782', '武夷山市', '124', '0');
INSERT INTO `common_city_zone` VALUES ('1218', '350783', '建瓯市', '124', '0');
INSERT INTO `common_city_zone` VALUES ('1219', '350784', '建阳市', '124', '0');
INSERT INTO `common_city_zone` VALUES ('1220', '350801', '市辖区', '125', '0');
INSERT INTO `common_city_zone` VALUES ('1221', '350802', '新罗区', '125', '0');
INSERT INTO `common_city_zone` VALUES ('1222', '350821', '长汀县', '125', '0');
INSERT INTO `common_city_zone` VALUES ('1223', '350822', '永定县', '125', '0');
INSERT INTO `common_city_zone` VALUES ('1224', '350823', '上杭县', '125', '0');
INSERT INTO `common_city_zone` VALUES ('1225', '350824', '武平县', '125', '0');
INSERT INTO `common_city_zone` VALUES ('1226', '350825', '连城县', '125', '0');
INSERT INTO `common_city_zone` VALUES ('1227', '350881', '漳平市', '125', '0');
INSERT INTO `common_city_zone` VALUES ('1228', '350901', '市辖区', '126', '0');
INSERT INTO `common_city_zone` VALUES ('1229', '350902', '蕉城区', '126', '0');
INSERT INTO `common_city_zone` VALUES ('1230', '350921', '霞浦县', '126', '0');
INSERT INTO `common_city_zone` VALUES ('1231', '350922', '古田县', '126', '0');
INSERT INTO `common_city_zone` VALUES ('1232', '350923', '屏南县', '126', '0');
INSERT INTO `common_city_zone` VALUES ('1233', '350924', '寿宁县', '126', '0');
INSERT INTO `common_city_zone` VALUES ('1234', '350925', '周宁县', '126', '0');
INSERT INTO `common_city_zone` VALUES ('1235', '350926', '柘荣县', '126', '0');
INSERT INTO `common_city_zone` VALUES ('1236', '350981', '福安市', '126', '0');
INSERT INTO `common_city_zone` VALUES ('1237', '350982', '福鼎市', '126', '0');
INSERT INTO `common_city_zone` VALUES ('1238', '360101', '市辖区', '127', '0');
INSERT INTO `common_city_zone` VALUES ('1239', '360102', '东湖区', '127', '0');
INSERT INTO `common_city_zone` VALUES ('1240', '360103', '西湖区', '127', '0');
INSERT INTO `common_city_zone` VALUES ('1241', '360104', '青云谱区', '127', '0');
INSERT INTO `common_city_zone` VALUES ('1242', '360105', '湾里区', '127', '0');
INSERT INTO `common_city_zone` VALUES ('1243', '360111', '青山湖区', '127', '0');
INSERT INTO `common_city_zone` VALUES ('1244', '360121', '南昌县', '127', '0');
INSERT INTO `common_city_zone` VALUES ('1245', '360122', '新建县', '127', '0');
INSERT INTO `common_city_zone` VALUES ('1246', '360123', '安义县', '127', '0');
INSERT INTO `common_city_zone` VALUES ('1247', '360124', '进贤县', '127', '0');
INSERT INTO `common_city_zone` VALUES ('1248', '360201', '市辖区', '128', '0');
INSERT INTO `common_city_zone` VALUES ('1249', '360202', '昌江区', '128', '0');
INSERT INTO `common_city_zone` VALUES ('1250', '360203', '珠山区', '128', '0');
INSERT INTO `common_city_zone` VALUES ('1251', '360222', '浮梁县', '128', '0');
INSERT INTO `common_city_zone` VALUES ('1252', '360281', '乐平市', '128', '0');
INSERT INTO `common_city_zone` VALUES ('1253', '360301', '市辖区', '129', '0');
INSERT INTO `common_city_zone` VALUES ('1254', '360302', '安源区', '129', '0');
INSERT INTO `common_city_zone` VALUES ('1255', '360313', '湘东区', '129', '0');
INSERT INTO `common_city_zone` VALUES ('1256', '360321', '莲花县', '129', '0');
INSERT INTO `common_city_zone` VALUES ('1257', '360322', '上栗县', '129', '0');
INSERT INTO `common_city_zone` VALUES ('1258', '360323', '芦溪县', '129', '0');
INSERT INTO `common_city_zone` VALUES ('1259', '360401', '市辖区', '130', '0');
INSERT INTO `common_city_zone` VALUES ('1260', '360402', '庐山区', '130', '0');
INSERT INTO `common_city_zone` VALUES ('1261', '360403', '浔阳区', '130', '0');
INSERT INTO `common_city_zone` VALUES ('1262', '360421', '九江县', '130', '0');
INSERT INTO `common_city_zone` VALUES ('1263', '360423', '武宁县', '130', '0');
INSERT INTO `common_city_zone` VALUES ('1264', '360424', '修水县', '130', '0');
INSERT INTO `common_city_zone` VALUES ('1265', '360425', '永修县', '130', '0');
INSERT INTO `common_city_zone` VALUES ('1266', '360426', '德安县', '130', '0');
INSERT INTO `common_city_zone` VALUES ('1267', '360427', '星子县', '130', '0');
INSERT INTO `common_city_zone` VALUES ('1268', '360428', '都昌县', '130', '0');
INSERT INTO `common_city_zone` VALUES ('1269', '360429', '湖口县', '130', '0');
INSERT INTO `common_city_zone` VALUES ('1270', '360430', '彭泽县', '130', '0');
INSERT INTO `common_city_zone` VALUES ('1271', '360481', '瑞昌市', '130', '0');
INSERT INTO `common_city_zone` VALUES ('1272', '360501', '市辖区', '131', '0');
INSERT INTO `common_city_zone` VALUES ('1273', '360502', '渝水区', '131', '0');
INSERT INTO `common_city_zone` VALUES ('1274', '360521', '分宜县', '131', '0');
INSERT INTO `common_city_zone` VALUES ('1275', '360601', '市辖区', '132', '0');
INSERT INTO `common_city_zone` VALUES ('1276', '360602', '月湖区', '132', '0');
INSERT INTO `common_city_zone` VALUES ('1277', '360622', '余江县', '132', '0');
INSERT INTO `common_city_zone` VALUES ('1278', '360681', '贵溪市', '132', '0');
INSERT INTO `common_city_zone` VALUES ('1279', '360701', '市辖区', '133', '0');
INSERT INTO `common_city_zone` VALUES ('1280', '360702', '章贡区', '133', '0');
INSERT INTO `common_city_zone` VALUES ('1281', '360721', '赣　县', '133', '0');
INSERT INTO `common_city_zone` VALUES ('1282', '360722', '信丰县', '133', '0');
INSERT INTO `common_city_zone` VALUES ('1283', '360723', '大余县', '133', '0');
INSERT INTO `common_city_zone` VALUES ('1284', '360724', '上犹县', '133', '0');
INSERT INTO `common_city_zone` VALUES ('1285', '360725', '崇义县', '133', '0');
INSERT INTO `common_city_zone` VALUES ('1286', '360726', '安远县', '133', '0');
INSERT INTO `common_city_zone` VALUES ('1287', '360727', '龙南县', '133', '0');
INSERT INTO `common_city_zone` VALUES ('1288', '360728', '定南县', '133', '0');
INSERT INTO `common_city_zone` VALUES ('1289', '360729', '全南县', '133', '0');
INSERT INTO `common_city_zone` VALUES ('1290', '360730', '宁都县', '133', '0');
INSERT INTO `common_city_zone` VALUES ('1291', '360731', '于都县', '133', '0');
INSERT INTO `common_city_zone` VALUES ('1292', '360732', '兴国县', '133', '0');
INSERT INTO `common_city_zone` VALUES ('1293', '360733', '会昌县', '133', '0');
INSERT INTO `common_city_zone` VALUES ('1294', '360734', '寻乌县', '133', '0');
INSERT INTO `common_city_zone` VALUES ('1295', '360735', '石城县', '133', '0');
INSERT INTO `common_city_zone` VALUES ('1296', '360781', '瑞金市', '133', '0');
INSERT INTO `common_city_zone` VALUES ('1297', '360782', '南康市', '133', '0');
INSERT INTO `common_city_zone` VALUES ('1298', '360801', '市辖区', '134', '0');
INSERT INTO `common_city_zone` VALUES ('1299', '360802', '吉州区', '134', '0');
INSERT INTO `common_city_zone` VALUES ('1300', '360803', '青原区', '134', '0');
INSERT INTO `common_city_zone` VALUES ('1301', '360821', '吉安县', '134', '0');
INSERT INTO `common_city_zone` VALUES ('1302', '360822', '吉水县', '134', '0');
INSERT INTO `common_city_zone` VALUES ('1303', '360823', '峡江县', '134', '0');
INSERT INTO `common_city_zone` VALUES ('1304', '360824', '新干县', '134', '0');
INSERT INTO `common_city_zone` VALUES ('1305', '360825', '永丰县', '134', '0');
INSERT INTO `common_city_zone` VALUES ('1306', '360826', '泰和县', '134', '0');
INSERT INTO `common_city_zone` VALUES ('1307', '360827', '遂川县', '134', '0');
INSERT INTO `common_city_zone` VALUES ('1308', '360828', '万安县', '134', '0');
INSERT INTO `common_city_zone` VALUES ('1309', '360829', '安福县', '134', '0');
INSERT INTO `common_city_zone` VALUES ('1310', '360830', '永新县', '134', '0');
INSERT INTO `common_city_zone` VALUES ('1311', '360881', '井冈山市', '134', '0');
INSERT INTO `common_city_zone` VALUES ('1312', '360901', '市辖区', '135', '0');
INSERT INTO `common_city_zone` VALUES ('1313', '360902', '袁州区', '135', '0');
INSERT INTO `common_city_zone` VALUES ('1314', '360921', '奉新县', '135', '0');
INSERT INTO `common_city_zone` VALUES ('1315', '360922', '万载县', '135', '0');
INSERT INTO `common_city_zone` VALUES ('1316', '360923', '上高县', '135', '0');
INSERT INTO `common_city_zone` VALUES ('1317', '360924', '宜丰县', '135', '0');
INSERT INTO `common_city_zone` VALUES ('1318', '360925', '靖安县', '135', '0');
INSERT INTO `common_city_zone` VALUES ('1319', '360926', '铜鼓县', '135', '0');
INSERT INTO `common_city_zone` VALUES ('1320', '360981', '丰城市', '135', '0');
INSERT INTO `common_city_zone` VALUES ('1321', '360982', '樟树市', '135', '0');
INSERT INTO `common_city_zone` VALUES ('1322', '360983', '高安市', '135', '0');
INSERT INTO `common_city_zone` VALUES ('1323', '361001', '市辖区', '136', '0');
INSERT INTO `common_city_zone` VALUES ('1324', '361002', '临川区', '136', '0');
INSERT INTO `common_city_zone` VALUES ('1325', '361021', '南城县', '136', '0');
INSERT INTO `common_city_zone` VALUES ('1326', '361022', '黎川县', '136', '0');
INSERT INTO `common_city_zone` VALUES ('1327', '361023', '南丰县', '136', '0');
INSERT INTO `common_city_zone` VALUES ('1328', '361024', '崇仁县', '136', '0');
INSERT INTO `common_city_zone` VALUES ('1329', '361025', '乐安县', '136', '0');
INSERT INTO `common_city_zone` VALUES ('1330', '361026', '宜黄县', '136', '0');
INSERT INTO `common_city_zone` VALUES ('1331', '361027', '金溪县', '136', '0');
INSERT INTO `common_city_zone` VALUES ('1332', '361028', '资溪县', '136', '0');
INSERT INTO `common_city_zone` VALUES ('1333', '361029', '东乡县', '136', '0');
INSERT INTO `common_city_zone` VALUES ('1334', '361030', '广昌县', '136', '0');
INSERT INTO `common_city_zone` VALUES ('1335', '361101', '市辖区', '137', '0');
INSERT INTO `common_city_zone` VALUES ('1336', '361102', '信州区', '137', '0');
INSERT INTO `common_city_zone` VALUES ('1337', '361121', '上饶县', '137', '0');
INSERT INTO `common_city_zone` VALUES ('1338', '361122', '广丰县', '137', '0');
INSERT INTO `common_city_zone` VALUES ('1339', '361123', '玉山县', '137', '0');
INSERT INTO `common_city_zone` VALUES ('1340', '361124', '铅山县', '137', '0');
INSERT INTO `common_city_zone` VALUES ('1341', '361125', '横峰县', '137', '0');
INSERT INTO `common_city_zone` VALUES ('1342', '361126', '弋阳县', '137', '0');
INSERT INTO `common_city_zone` VALUES ('1343', '361127', '余干县', '137', '0');
INSERT INTO `common_city_zone` VALUES ('1344', '361128', '鄱阳县', '137', '0');
INSERT INTO `common_city_zone` VALUES ('1345', '361129', '万年县', '137', '0');
INSERT INTO `common_city_zone` VALUES ('1346', '361130', '婺源县', '137', '0');
INSERT INTO `common_city_zone` VALUES ('1347', '361181', '德兴市', '137', '0');
INSERT INTO `common_city_zone` VALUES ('1348', '370101', '市辖区', '138', '0');
INSERT INTO `common_city_zone` VALUES ('1349', '370102', '历下区', '138', '0');
INSERT INTO `common_city_zone` VALUES ('1350', '370103', '市中区', '138', '0');
INSERT INTO `common_city_zone` VALUES ('1351', '370104', '槐荫区', '138', '0');
INSERT INTO `common_city_zone` VALUES ('1352', '370105', '天桥区', '138', '0');
INSERT INTO `common_city_zone` VALUES ('1353', '370112', '历城区', '138', '0');
INSERT INTO `common_city_zone` VALUES ('1354', '370113', '长清区', '138', '0');
INSERT INTO `common_city_zone` VALUES ('1355', '370124', '平阴县', '138', '0');
INSERT INTO `common_city_zone` VALUES ('1356', '370125', '济阳县', '138', '0');
INSERT INTO `common_city_zone` VALUES ('1357', '370126', '商河县', '138', '0');
INSERT INTO `common_city_zone` VALUES ('1358', '370181', '章丘市', '138', '0');
INSERT INTO `common_city_zone` VALUES ('1359', '370201', '市辖区', '139', '0');
INSERT INTO `common_city_zone` VALUES ('1360', '370202', '市南区', '139', '0');
INSERT INTO `common_city_zone` VALUES ('1361', '370203', '市北区', '139', '0');
INSERT INTO `common_city_zone` VALUES ('1362', '370205', '四方区', '139', '0');
INSERT INTO `common_city_zone` VALUES ('1363', '370211', '黄岛区', '139', '0');
INSERT INTO `common_city_zone` VALUES ('1364', '370212', '崂山区', '139', '0');
INSERT INTO `common_city_zone` VALUES ('1365', '370213', '李沧区', '139', '0');
INSERT INTO `common_city_zone` VALUES ('1366', '370214', '城阳区', '139', '0');
INSERT INTO `common_city_zone` VALUES ('1367', '370281', '胶州市', '139', '0');
INSERT INTO `common_city_zone` VALUES ('1368', '370282', '即墨市', '139', '0');
INSERT INTO `common_city_zone` VALUES ('1369', '370283', '平度市', '139', '0');
INSERT INTO `common_city_zone` VALUES ('1370', '370284', '胶南市', '139', '0');
INSERT INTO `common_city_zone` VALUES ('1371', '370285', '莱西市', '139', '0');
INSERT INTO `common_city_zone` VALUES ('1372', '370301', '市辖区', '140', '0');
INSERT INTO `common_city_zone` VALUES ('1373', '370302', '淄川区', '140', '0');
INSERT INTO `common_city_zone` VALUES ('1374', '370303', '张店区', '140', '0');
INSERT INTO `common_city_zone` VALUES ('1375', '370304', '博山区', '140', '0');
INSERT INTO `common_city_zone` VALUES ('1376', '370305', '临淄区', '140', '0');
INSERT INTO `common_city_zone` VALUES ('1377', '370306', '周村区', '140', '0');
INSERT INTO `common_city_zone` VALUES ('1378', '370321', '桓台县', '140', '0');
INSERT INTO `common_city_zone` VALUES ('1379', '370322', '高青县', '140', '0');
INSERT INTO `common_city_zone` VALUES ('1380', '370323', '沂源县', '140', '0');
INSERT INTO `common_city_zone` VALUES ('1381', '370401', '市辖区', '141', '0');
INSERT INTO `common_city_zone` VALUES ('1382', '370402', '市中区', '141', '0');
INSERT INTO `common_city_zone` VALUES ('1383', '370403', '薛城区', '141', '0');
INSERT INTO `common_city_zone` VALUES ('1384', '370404', '峄城区', '141', '0');
INSERT INTO `common_city_zone` VALUES ('1385', '370405', '台儿庄区', '141', '0');
INSERT INTO `common_city_zone` VALUES ('1386', '370406', '山亭区', '141', '0');
INSERT INTO `common_city_zone` VALUES ('1387', '370481', '滕州市', '141', '0');
INSERT INTO `common_city_zone` VALUES ('1388', '370501', '市辖区', '142', '0');
INSERT INTO `common_city_zone` VALUES ('1389', '370502', '东营区', '142', '0');
INSERT INTO `common_city_zone` VALUES ('1390', '370503', '河口区', '142', '0');
INSERT INTO `common_city_zone` VALUES ('1391', '370521', '垦利县', '142', '0');
INSERT INTO `common_city_zone` VALUES ('1392', '370522', '利津县', '142', '0');
INSERT INTO `common_city_zone` VALUES ('1393', '370523', '广饶县', '142', '0');
INSERT INTO `common_city_zone` VALUES ('1394', '370601', '市辖区', '143', '0');
INSERT INTO `common_city_zone` VALUES ('1395', '370602', '芝罘区', '143', '0');
INSERT INTO `common_city_zone` VALUES ('1396', '370611', '福山区', '143', '0');
INSERT INTO `common_city_zone` VALUES ('1397', '370612', '牟平区', '143', '0');
INSERT INTO `common_city_zone` VALUES ('1398', '370613', '莱山区', '143', '0');
INSERT INTO `common_city_zone` VALUES ('1399', '370634', '长岛县', '143', '0');
INSERT INTO `common_city_zone` VALUES ('1400', '370681', '龙口市', '143', '0');
INSERT INTO `common_city_zone` VALUES ('1401', '370682', '莱阳市', '143', '0');
INSERT INTO `common_city_zone` VALUES ('1402', '370683', '莱州市', '143', '0');
INSERT INTO `common_city_zone` VALUES ('1403', '370684', '蓬莱市', '143', '0');
INSERT INTO `common_city_zone` VALUES ('1404', '370685', '招远市', '143', '0');
INSERT INTO `common_city_zone` VALUES ('1405', '370686', '栖霞市', '143', '0');
INSERT INTO `common_city_zone` VALUES ('1406', '370687', '海阳市', '143', '0');
INSERT INTO `common_city_zone` VALUES ('1407', '370701', '市辖区', '144', '0');
INSERT INTO `common_city_zone` VALUES ('1408', '370702', '潍城区', '144', '0');
INSERT INTO `common_city_zone` VALUES ('1409', '370703', '寒亭区', '144', '0');
INSERT INTO `common_city_zone` VALUES ('1410', '370704', '坊子区', '144', '0');
INSERT INTO `common_city_zone` VALUES ('1411', '370705', '奎文区', '144', '0');
INSERT INTO `common_city_zone` VALUES ('1412', '370724', '临朐县', '144', '0');
INSERT INTO `common_city_zone` VALUES ('1413', '370725', '昌乐县', '144', '0');
INSERT INTO `common_city_zone` VALUES ('1414', '370781', '青州市', '144', '0');
INSERT INTO `common_city_zone` VALUES ('1415', '370782', '诸城市', '144', '0');
INSERT INTO `common_city_zone` VALUES ('1416', '370783', '寿光市', '144', '0');
INSERT INTO `common_city_zone` VALUES ('1417', '370784', '安丘市', '144', '0');
INSERT INTO `common_city_zone` VALUES ('1418', '370785', '高密市', '144', '0');
INSERT INTO `common_city_zone` VALUES ('1419', '370786', '昌邑市', '144', '0');
INSERT INTO `common_city_zone` VALUES ('1420', '370801', '市辖区', '145', '0');
INSERT INTO `common_city_zone` VALUES ('1421', '370802', '市中区', '145', '0');
INSERT INTO `common_city_zone` VALUES ('1422', '370811', '任城区', '145', '0');
INSERT INTO `common_city_zone` VALUES ('1423', '370826', '微山县', '145', '0');
INSERT INTO `common_city_zone` VALUES ('1424', '370827', '鱼台县', '145', '0');
INSERT INTO `common_city_zone` VALUES ('1425', '370828', '金乡县', '145', '0');
INSERT INTO `common_city_zone` VALUES ('1426', '370829', '嘉祥县', '145', '0');
INSERT INTO `common_city_zone` VALUES ('1427', '370830', '汶上县', '145', '0');
INSERT INTO `common_city_zone` VALUES ('1428', '370831', '泗水县', '145', '0');
INSERT INTO `common_city_zone` VALUES ('1429', '370832', '梁山县', '145', '0');
INSERT INTO `common_city_zone` VALUES ('1430', '370881', '曲阜市', '145', '0');
INSERT INTO `common_city_zone` VALUES ('1431', '370882', '兖州市', '145', '0');
INSERT INTO `common_city_zone` VALUES ('1432', '370883', '邹城市', '145', '0');
INSERT INTO `common_city_zone` VALUES ('1433', '370901', '市辖区', '146', '0');
INSERT INTO `common_city_zone` VALUES ('1434', '370902', '泰山区', '146', '0');
INSERT INTO `common_city_zone` VALUES ('1435', '370903', '岱岳区', '146', '0');
INSERT INTO `common_city_zone` VALUES ('1436', '370921', '宁阳县', '146', '0');
INSERT INTO `common_city_zone` VALUES ('1437', '370923', '东平县', '146', '0');
INSERT INTO `common_city_zone` VALUES ('1438', '370982', '新泰市', '146', '0');
INSERT INTO `common_city_zone` VALUES ('1439', '370983', '肥城市', '146', '0');
INSERT INTO `common_city_zone` VALUES ('1440', '371001', '市辖区', '147', '0');
INSERT INTO `common_city_zone` VALUES ('1441', '371002', '环翠区', '147', '0');
INSERT INTO `common_city_zone` VALUES ('1442', '371081', '文登市', '147', '0');
INSERT INTO `common_city_zone` VALUES ('1443', '371082', '荣成市', '147', '0');
INSERT INTO `common_city_zone` VALUES ('1444', '371083', '乳山市', '147', '0');
INSERT INTO `common_city_zone` VALUES ('1445', '371101', '市辖区', '148', '0');
INSERT INTO `common_city_zone` VALUES ('1446', '371102', '东港区', '148', '0');
INSERT INTO `common_city_zone` VALUES ('1447', '371103', '岚山区', '148', '0');
INSERT INTO `common_city_zone` VALUES ('1448', '371121', '五莲县', '148', '0');
INSERT INTO `common_city_zone` VALUES ('1449', '371122', '莒　县', '148', '0');
INSERT INTO `common_city_zone` VALUES ('1450', '371201', '市辖区', '149', '0');
INSERT INTO `common_city_zone` VALUES ('1451', '371202', '莱城区', '149', '0');
INSERT INTO `common_city_zone` VALUES ('1452', '371203', '钢城区', '149', '0');
INSERT INTO `common_city_zone` VALUES ('1453', '371301', '市辖区', '150', '0');
INSERT INTO `common_city_zone` VALUES ('1454', '371302', '兰山区', '150', '0');
INSERT INTO `common_city_zone` VALUES ('1455', '371311', '罗庄区', '150', '0');
INSERT INTO `common_city_zone` VALUES ('1456', '371312', '河东区', '150', '0');
INSERT INTO `common_city_zone` VALUES ('1457', '371321', '沂南县', '150', '0');
INSERT INTO `common_city_zone` VALUES ('1458', '371322', '郯城县', '150', '0');
INSERT INTO `common_city_zone` VALUES ('1459', '371323', '沂水县', '150', '0');
INSERT INTO `common_city_zone` VALUES ('1460', '371324', '苍山县', '150', '0');
INSERT INTO `common_city_zone` VALUES ('1461', '371325', '费　县', '150', '0');
INSERT INTO `common_city_zone` VALUES ('1462', '371326', '平邑县', '150', '0');
INSERT INTO `common_city_zone` VALUES ('1463', '371327', '莒南县', '150', '0');
INSERT INTO `common_city_zone` VALUES ('1464', '371328', '蒙阴县', '150', '0');
INSERT INTO `common_city_zone` VALUES ('1465', '371329', '临沭县', '150', '0');
INSERT INTO `common_city_zone` VALUES ('1466', '371401', '市辖区', '151', '0');
INSERT INTO `common_city_zone` VALUES ('1467', '371402', '德城区', '151', '0');
INSERT INTO `common_city_zone` VALUES ('1468', '371421', '陵　县', '151', '0');
INSERT INTO `common_city_zone` VALUES ('1469', '371422', '宁津县', '151', '0');
INSERT INTO `common_city_zone` VALUES ('1470', '371423', '庆云县', '151', '0');
INSERT INTO `common_city_zone` VALUES ('1471', '371424', '临邑县', '151', '0');
INSERT INTO `common_city_zone` VALUES ('1472', '371425', '齐河县', '151', '0');
INSERT INTO `common_city_zone` VALUES ('1473', '371426', '平原县', '151', '0');
INSERT INTO `common_city_zone` VALUES ('1474', '371427', '夏津县', '151', '0');
INSERT INTO `common_city_zone` VALUES ('1475', '371428', '武城县', '151', '0');
INSERT INTO `common_city_zone` VALUES ('1476', '371481', '乐陵市', '151', '0');
INSERT INTO `common_city_zone` VALUES ('1477', '371482', '禹城市', '151', '0');
INSERT INTO `common_city_zone` VALUES ('1478', '371501', '市辖区', '152', '0');
INSERT INTO `common_city_zone` VALUES ('1479', '371502', '东昌府区', '152', '0');
INSERT INTO `common_city_zone` VALUES ('1480', '371521', '阳谷县', '152', '0');
INSERT INTO `common_city_zone` VALUES ('1481', '371522', '莘　县', '152', '0');
INSERT INTO `common_city_zone` VALUES ('1482', '371523', '茌平县', '152', '0');
INSERT INTO `common_city_zone` VALUES ('1483', '371524', '东阿县', '152', '0');
INSERT INTO `common_city_zone` VALUES ('1484', '371525', '冠　县', '152', '0');
INSERT INTO `common_city_zone` VALUES ('1485', '371526', '高唐县', '152', '0');
INSERT INTO `common_city_zone` VALUES ('1486', '371581', '临清市', '152', '0');
INSERT INTO `common_city_zone` VALUES ('1487', '371601', '市辖区', '153', '0');
INSERT INTO `common_city_zone` VALUES ('1488', '371602', '滨城区', '153', '0');
INSERT INTO `common_city_zone` VALUES ('1489', '371621', '惠民县', '153', '0');
INSERT INTO `common_city_zone` VALUES ('1490', '371622', '阳信县', '153', '0');
INSERT INTO `common_city_zone` VALUES ('1491', '371623', '无棣县', '153', '0');
INSERT INTO `common_city_zone` VALUES ('1492', '371624', '沾化县', '153', '0');
INSERT INTO `common_city_zone` VALUES ('1493', '371625', '博兴县', '153', '0');
INSERT INTO `common_city_zone` VALUES ('1494', '371626', '邹平县', '153', '0');
INSERT INTO `common_city_zone` VALUES ('1495', '371701', '市辖区', '154', '0');
INSERT INTO `common_city_zone` VALUES ('1496', '371702', '牡丹区', '154', '0');
INSERT INTO `common_city_zone` VALUES ('1497', '371721', '曹　县', '154', '0');
INSERT INTO `common_city_zone` VALUES ('1498', '371722', '单　县', '154', '0');
INSERT INTO `common_city_zone` VALUES ('1499', '371723', '成武县', '154', '0');
INSERT INTO `common_city_zone` VALUES ('1500', '371724', '巨野县', '154', '0');
INSERT INTO `common_city_zone` VALUES ('1501', '371725', '郓城县', '154', '0');
INSERT INTO `common_city_zone` VALUES ('1502', '371726', '鄄城县', '154', '0');
INSERT INTO `common_city_zone` VALUES ('1503', '371727', '定陶县', '154', '0');
INSERT INTO `common_city_zone` VALUES ('1504', '371728', '东明县', '154', '0');
INSERT INTO `common_city_zone` VALUES ('1505', '410101', '市辖区', '155', '0');
INSERT INTO `common_city_zone` VALUES ('1506', '410102', '中原区', '155', '0');
INSERT INTO `common_city_zone` VALUES ('1507', '410103', '二七区', '155', '0');
INSERT INTO `common_city_zone` VALUES ('1508', '410104', '管城回族区', '155', '0');
INSERT INTO `common_city_zone` VALUES ('1509', '410105', '金水区', '155', '0');
INSERT INTO `common_city_zone` VALUES ('1510', '410106', '上街区', '155', '0');
INSERT INTO `common_city_zone` VALUES ('1511', '410108', '邙山区', '155', '0');
INSERT INTO `common_city_zone` VALUES ('1512', '410122', '中牟县', '155', '0');
INSERT INTO `common_city_zone` VALUES ('1513', '410181', '巩义市', '155', '0');
INSERT INTO `common_city_zone` VALUES ('1514', '410182', '荥阳市', '155', '0');
INSERT INTO `common_city_zone` VALUES ('1515', '410183', '新密市', '155', '0');
INSERT INTO `common_city_zone` VALUES ('1516', '410184', '新郑市', '155', '0');
INSERT INTO `common_city_zone` VALUES ('1517', '410185', '登封市', '155', '0');
INSERT INTO `common_city_zone` VALUES ('1518', '410201', '市辖区', '156', '0');
INSERT INTO `common_city_zone` VALUES ('1519', '410202', '龙亭区', '156', '0');
INSERT INTO `common_city_zone` VALUES ('1520', '410203', '顺河回族区', '156', '0');
INSERT INTO `common_city_zone` VALUES ('1521', '410204', '鼓楼区', '156', '0');
INSERT INTO `common_city_zone` VALUES ('1522', '410205', '南关区', '156', '0');
INSERT INTO `common_city_zone` VALUES ('1523', '410211', '郊　区', '156', '0');
INSERT INTO `common_city_zone` VALUES ('1524', '410221', '杞　县', '156', '0');
INSERT INTO `common_city_zone` VALUES ('1525', '410222', '通许县', '156', '0');
INSERT INTO `common_city_zone` VALUES ('1526', '410223', '尉氏县', '156', '0');
INSERT INTO `common_city_zone` VALUES ('1527', '410224', '开封县', '156', '0');
INSERT INTO `common_city_zone` VALUES ('1528', '410225', '兰考县', '156', '0');
INSERT INTO `common_city_zone` VALUES ('1529', '410301', '市辖区', '157', '0');
INSERT INTO `common_city_zone` VALUES ('1530', '410302', '老城区', '157', '0');
INSERT INTO `common_city_zone` VALUES ('1531', '410303', '西工区', '157', '0');
INSERT INTO `common_city_zone` VALUES ('1532', '410304', '廛河回族区', '157', '0');
INSERT INTO `common_city_zone` VALUES ('1533', '410305', '涧西区', '157', '0');
INSERT INTO `common_city_zone` VALUES ('1534', '410306', '吉利区', '157', '0');
INSERT INTO `common_city_zone` VALUES ('1535', '410307', '洛龙区', '157', '0');
INSERT INTO `common_city_zone` VALUES ('1536', '410322', '孟津县', '157', '0');
INSERT INTO `common_city_zone` VALUES ('1537', '410323', '新安县', '157', '0');
INSERT INTO `common_city_zone` VALUES ('1538', '410324', '栾川县', '157', '0');
INSERT INTO `common_city_zone` VALUES ('1539', '410325', '嵩　县', '157', '0');
INSERT INTO `common_city_zone` VALUES ('1540', '410326', '汝阳县', '157', '0');
INSERT INTO `common_city_zone` VALUES ('1541', '410327', '宜阳县', '157', '0');
INSERT INTO `common_city_zone` VALUES ('1542', '410328', '洛宁县', '157', '0');
INSERT INTO `common_city_zone` VALUES ('1543', '410329', '伊川县', '157', '0');
INSERT INTO `common_city_zone` VALUES ('1544', '410381', '偃师市', '157', '0');
INSERT INTO `common_city_zone` VALUES ('1545', '410401', '市辖区', '158', '0');
INSERT INTO `common_city_zone` VALUES ('1546', '410402', '新华区', '158', '0');
INSERT INTO `common_city_zone` VALUES ('1547', '410403', '卫东区', '158', '0');
INSERT INTO `common_city_zone` VALUES ('1548', '410404', '石龙区', '158', '0');
INSERT INTO `common_city_zone` VALUES ('1549', '410411', '湛河区', '158', '0');
INSERT INTO `common_city_zone` VALUES ('1550', '410421', '宝丰县', '158', '0');
INSERT INTO `common_city_zone` VALUES ('1551', '410422', '叶　县', '158', '0');
INSERT INTO `common_city_zone` VALUES ('1552', '410423', '鲁山县', '158', '0');
INSERT INTO `common_city_zone` VALUES ('1553', '410425', '郏　县', '158', '0');
INSERT INTO `common_city_zone` VALUES ('1554', '410481', '舞钢市', '158', '0');
INSERT INTO `common_city_zone` VALUES ('1555', '410482', '汝州市', '158', '0');
INSERT INTO `common_city_zone` VALUES ('1556', '410501', '市辖区', '159', '0');
INSERT INTO `common_city_zone` VALUES ('1557', '410502', '文峰区', '159', '0');
INSERT INTO `common_city_zone` VALUES ('1558', '410503', '北关区', '159', '0');
INSERT INTO `common_city_zone` VALUES ('1559', '410505', '殷都区', '159', '0');
INSERT INTO `common_city_zone` VALUES ('1560', '410506', '龙安区', '159', '0');
INSERT INTO `common_city_zone` VALUES ('1561', '410522', '安阳县', '159', '0');
INSERT INTO `common_city_zone` VALUES ('1562', '410523', '汤阴县', '159', '0');
INSERT INTO `common_city_zone` VALUES ('1563', '410526', '滑　县', '159', '0');
INSERT INTO `common_city_zone` VALUES ('1564', '410527', '内黄县', '159', '0');
INSERT INTO `common_city_zone` VALUES ('1565', '410581', '林州市', '159', '0');
INSERT INTO `common_city_zone` VALUES ('1566', '410601', '市辖区', '160', '0');
INSERT INTO `common_city_zone` VALUES ('1567', '410602', '鹤山区', '160', '0');
INSERT INTO `common_city_zone` VALUES ('1568', '410603', '山城区', '160', '0');
INSERT INTO `common_city_zone` VALUES ('1569', '410611', '淇滨区', '160', '0');
INSERT INTO `common_city_zone` VALUES ('1570', '410621', '浚　县', '160', '0');
INSERT INTO `common_city_zone` VALUES ('1571', '410622', '淇　县', '160', '0');
INSERT INTO `common_city_zone` VALUES ('1572', '410701', '市辖区', '161', '0');
INSERT INTO `common_city_zone` VALUES ('1573', '410702', '红旗区', '161', '0');
INSERT INTO `common_city_zone` VALUES ('1574', '410703', '卫滨区', '161', '0');
INSERT INTO `common_city_zone` VALUES ('1575', '410704', '凤泉区', '161', '0');
INSERT INTO `common_city_zone` VALUES ('1576', '410711', '牧野区', '161', '0');
INSERT INTO `common_city_zone` VALUES ('1577', '410721', '新乡县', '161', '0');
INSERT INTO `common_city_zone` VALUES ('1578', '410724', '获嘉县', '161', '0');
INSERT INTO `common_city_zone` VALUES ('1579', '410725', '原阳县', '161', '0');
INSERT INTO `common_city_zone` VALUES ('1580', '410726', '延津县', '161', '0');
INSERT INTO `common_city_zone` VALUES ('1581', '410727', '封丘县', '161', '0');
INSERT INTO `common_city_zone` VALUES ('1582', '410728', '长垣县', '161', '0');
INSERT INTO `common_city_zone` VALUES ('1583', '410781', '卫辉市', '161', '0');
INSERT INTO `common_city_zone` VALUES ('1584', '410782', '辉县市', '161', '0');
INSERT INTO `common_city_zone` VALUES ('1585', '410801', '市辖区', '162', '0');
INSERT INTO `common_city_zone` VALUES ('1586', '410802', '解放区', '162', '0');
INSERT INTO `common_city_zone` VALUES ('1587', '410803', '中站区', '162', '0');
INSERT INTO `common_city_zone` VALUES ('1588', '410804', '马村区', '162', '0');
INSERT INTO `common_city_zone` VALUES ('1589', '410811', '山阳区', '162', '0');
INSERT INTO `common_city_zone` VALUES ('1590', '410821', '修武县', '162', '0');
INSERT INTO `common_city_zone` VALUES ('1591', '410822', '博爱县', '162', '0');
INSERT INTO `common_city_zone` VALUES ('1592', '410823', '武陟县', '162', '0');
INSERT INTO `common_city_zone` VALUES ('1593', '410825', '温　县', '162', '0');
INSERT INTO `common_city_zone` VALUES ('1594', '410881', '济源市', '162', '0');
INSERT INTO `common_city_zone` VALUES ('1595', '410882', '沁阳市', '162', '0');
INSERT INTO `common_city_zone` VALUES ('1596', '410883', '孟州市', '162', '0');
INSERT INTO `common_city_zone` VALUES ('1597', '410901', '市辖区', '163', '0');
INSERT INTO `common_city_zone` VALUES ('1598', '410902', '华龙区', '163', '0');
INSERT INTO `common_city_zone` VALUES ('1599', '410922', '清丰县', '163', '0');
INSERT INTO `common_city_zone` VALUES ('1600', '410923', '南乐县', '163', '0');
INSERT INTO `common_city_zone` VALUES ('1601', '410926', '范　县', '163', '0');
INSERT INTO `common_city_zone` VALUES ('1602', '410927', '台前县', '163', '0');
INSERT INTO `common_city_zone` VALUES ('1603', '410928', '濮阳县', '163', '0');
INSERT INTO `common_city_zone` VALUES ('1604', '411001', '市辖区', '164', '0');
INSERT INTO `common_city_zone` VALUES ('1605', '411002', '魏都区', '164', '0');
INSERT INTO `common_city_zone` VALUES ('1606', '411023', '许昌县', '164', '0');
INSERT INTO `common_city_zone` VALUES ('1607', '411024', '鄢陵县', '164', '0');
INSERT INTO `common_city_zone` VALUES ('1608', '411025', '襄城县', '164', '0');
INSERT INTO `common_city_zone` VALUES ('1609', '411081', '禹州市', '164', '0');
INSERT INTO `common_city_zone` VALUES ('1610', '411082', '长葛市', '164', '0');
INSERT INTO `common_city_zone` VALUES ('1611', '411101', '市辖区', '165', '0');
INSERT INTO `common_city_zone` VALUES ('1612', '411102', '源汇区', '165', '0');
INSERT INTO `common_city_zone` VALUES ('1613', '411103', '郾城区', '165', '0');
INSERT INTO `common_city_zone` VALUES ('1614', '411104', '召陵区', '165', '0');
INSERT INTO `common_city_zone` VALUES ('1615', '411121', '舞阳县', '165', '0');
INSERT INTO `common_city_zone` VALUES ('1616', '411122', '临颍县', '165', '0');
INSERT INTO `common_city_zone` VALUES ('1617', '411201', '市辖区', '166', '0');
INSERT INTO `common_city_zone` VALUES ('1618', '411202', '湖滨区', '166', '0');
INSERT INTO `common_city_zone` VALUES ('1619', '411221', '渑池县', '166', '0');
INSERT INTO `common_city_zone` VALUES ('1620', '411222', '陕　县', '166', '0');
INSERT INTO `common_city_zone` VALUES ('1621', '411224', '卢氏县', '166', '0');
INSERT INTO `common_city_zone` VALUES ('1622', '411281', '义马市', '166', '0');
INSERT INTO `common_city_zone` VALUES ('1623', '411282', '灵宝市', '166', '0');
INSERT INTO `common_city_zone` VALUES ('1624', '411301', '市辖区', '167', '0');
INSERT INTO `common_city_zone` VALUES ('1625', '411302', '宛城区', '167', '0');
INSERT INTO `common_city_zone` VALUES ('1626', '411303', '卧龙区', '167', '0');
INSERT INTO `common_city_zone` VALUES ('1627', '411321', '南召县', '167', '0');
INSERT INTO `common_city_zone` VALUES ('1628', '411322', '方城县', '167', '0');
INSERT INTO `common_city_zone` VALUES ('1629', '411323', '西峡县', '167', '0');
INSERT INTO `common_city_zone` VALUES ('1630', '411324', '镇平县', '167', '0');
INSERT INTO `common_city_zone` VALUES ('1631', '411325', '内乡县', '167', '0');
INSERT INTO `common_city_zone` VALUES ('1632', '411326', '淅川县', '167', '0');
INSERT INTO `common_city_zone` VALUES ('1633', '411327', '社旗县', '167', '0');
INSERT INTO `common_city_zone` VALUES ('1634', '411328', '唐河县', '167', '0');
INSERT INTO `common_city_zone` VALUES ('1635', '411329', '新野县', '167', '0');
INSERT INTO `common_city_zone` VALUES ('1636', '411330', '桐柏县', '167', '0');
INSERT INTO `common_city_zone` VALUES ('1637', '411381', '邓州市', '167', '0');
INSERT INTO `common_city_zone` VALUES ('1638', '411401', '市辖区', '168', '0');
INSERT INTO `common_city_zone` VALUES ('1639', '411402', '梁园区', '168', '0');
INSERT INTO `common_city_zone` VALUES ('1640', '411403', '睢阳区', '168', '0');
INSERT INTO `common_city_zone` VALUES ('1641', '411421', '民权县', '168', '0');
INSERT INTO `common_city_zone` VALUES ('1642', '411422', '睢　县', '168', '0');
INSERT INTO `common_city_zone` VALUES ('1643', '411423', '宁陵县', '168', '0');
INSERT INTO `common_city_zone` VALUES ('1644', '411424', '柘城县', '168', '0');
INSERT INTO `common_city_zone` VALUES ('1645', '411425', '虞城县', '168', '0');
INSERT INTO `common_city_zone` VALUES ('1646', '411426', '夏邑县', '168', '0');
INSERT INTO `common_city_zone` VALUES ('1647', '411481', '永城市', '168', '0');
INSERT INTO `common_city_zone` VALUES ('1648', '411501', '市辖区', '169', '0');
INSERT INTO `common_city_zone` VALUES ('1649', '411502', '师河区', '169', '0');
INSERT INTO `common_city_zone` VALUES ('1650', '411503', '平桥区', '169', '0');
INSERT INTO `common_city_zone` VALUES ('1651', '411521', '罗山县', '169', '0');
INSERT INTO `common_city_zone` VALUES ('1652', '411522', '光山县', '169', '0');
INSERT INTO `common_city_zone` VALUES ('1653', '411523', '新　县', '169', '0');
INSERT INTO `common_city_zone` VALUES ('1654', '411524', '商城县', '169', '0');
INSERT INTO `common_city_zone` VALUES ('1655', '411525', '固始县', '169', '0');
INSERT INTO `common_city_zone` VALUES ('1656', '411526', '潢川县', '169', '0');
INSERT INTO `common_city_zone` VALUES ('1657', '411527', '淮滨县', '169', '0');
INSERT INTO `common_city_zone` VALUES ('1658', '411528', '息　县', '169', '0');
INSERT INTO `common_city_zone` VALUES ('1659', '411601', '市辖区', '170', '0');
INSERT INTO `common_city_zone` VALUES ('1660', '411602', '川汇区', '170', '0');
INSERT INTO `common_city_zone` VALUES ('1661', '411621', '扶沟县', '170', '0');
INSERT INTO `common_city_zone` VALUES ('1662', '411622', '西华县', '170', '0');
INSERT INTO `common_city_zone` VALUES ('1663', '411623', '商水县', '170', '0');
INSERT INTO `common_city_zone` VALUES ('1664', '411624', '沈丘县', '170', '0');
INSERT INTO `common_city_zone` VALUES ('1665', '411625', '郸城县', '170', '0');
INSERT INTO `common_city_zone` VALUES ('1666', '411626', '淮阳县', '170', '0');
INSERT INTO `common_city_zone` VALUES ('1667', '411627', '太康县', '170', '0');
INSERT INTO `common_city_zone` VALUES ('1668', '411628', '鹿邑县', '170', '0');
INSERT INTO `common_city_zone` VALUES ('1669', '411681', '项城市', '170', '0');
INSERT INTO `common_city_zone` VALUES ('1670', '411701', '市辖区', '171', '0');
INSERT INTO `common_city_zone` VALUES ('1671', '411702', '驿城区', '171', '0');
INSERT INTO `common_city_zone` VALUES ('1672', '411721', '西平县', '171', '0');
INSERT INTO `common_city_zone` VALUES ('1673', '411722', '上蔡县', '171', '0');
INSERT INTO `common_city_zone` VALUES ('1674', '411723', '平舆县', '171', '0');
INSERT INTO `common_city_zone` VALUES ('1675', '411724', '正阳县', '171', '0');
INSERT INTO `common_city_zone` VALUES ('1676', '411725', '确山县', '171', '0');
INSERT INTO `common_city_zone` VALUES ('1677', '411726', '泌阳县', '171', '0');
INSERT INTO `common_city_zone` VALUES ('1678', '411727', '汝南县', '171', '0');
INSERT INTO `common_city_zone` VALUES ('1679', '411728', '遂平县', '171', '0');
INSERT INTO `common_city_zone` VALUES ('1680', '411729', '新蔡县', '171', '0');
INSERT INTO `common_city_zone` VALUES ('1681', '420101', '市辖区', '172', '0');
INSERT INTO `common_city_zone` VALUES ('1682', '420102', '江岸区', '172', '0');
INSERT INTO `common_city_zone` VALUES ('1683', '420103', '江汉区', '172', '0');
INSERT INTO `common_city_zone` VALUES ('1684', '420104', '乔口区', '172', '0');
INSERT INTO `common_city_zone` VALUES ('1685', '420105', '汉阳区', '172', '0');
INSERT INTO `common_city_zone` VALUES ('1686', '420106', '武昌区', '172', '0');
INSERT INTO `common_city_zone` VALUES ('1687', '420107', '青山区', '172', '0');
INSERT INTO `common_city_zone` VALUES ('1688', '420111', '洪山区', '172', '0');
INSERT INTO `common_city_zone` VALUES ('1689', '420112', '东西湖区', '172', '0');
INSERT INTO `common_city_zone` VALUES ('1690', '420113', '汉南区', '172', '0');
INSERT INTO `common_city_zone` VALUES ('1691', '420114', '蔡甸区', '172', '0');
INSERT INTO `common_city_zone` VALUES ('1692', '420115', '江夏区', '172', '0');
INSERT INTO `common_city_zone` VALUES ('1693', '420116', '黄陂区', '172', '0');
INSERT INTO `common_city_zone` VALUES ('1694', '420117', '新洲区', '172', '0');
INSERT INTO `common_city_zone` VALUES ('1695', '420201', '市辖区', '173', '0');
INSERT INTO `common_city_zone` VALUES ('1696', '420202', '黄石港区', '173', '0');
INSERT INTO `common_city_zone` VALUES ('1697', '420203', '西塞山区', '173', '0');
INSERT INTO `common_city_zone` VALUES ('1698', '420204', '下陆区', '173', '0');
INSERT INTO `common_city_zone` VALUES ('1699', '420205', '铁山区', '173', '0');
INSERT INTO `common_city_zone` VALUES ('1700', '420222', '阳新县', '173', '0');
INSERT INTO `common_city_zone` VALUES ('1701', '420281', '大冶市', '173', '0');
INSERT INTO `common_city_zone` VALUES ('1702', '420301', '市辖区', '174', '0');
INSERT INTO `common_city_zone` VALUES ('1703', '420302', '茅箭区', '174', '0');
INSERT INTO `common_city_zone` VALUES ('1704', '420303', '张湾区', '174', '0');
INSERT INTO `common_city_zone` VALUES ('1705', '420321', '郧　县', '174', '0');
INSERT INTO `common_city_zone` VALUES ('1706', '420322', '郧西县', '174', '0');
INSERT INTO `common_city_zone` VALUES ('1707', '420323', '竹山县', '174', '0');
INSERT INTO `common_city_zone` VALUES ('1708', '420324', '竹溪县', '174', '0');
INSERT INTO `common_city_zone` VALUES ('1709', '420325', '房　县', '174', '0');
INSERT INTO `common_city_zone` VALUES ('1710', '420381', '丹江口市', '174', '0');
INSERT INTO `common_city_zone` VALUES ('1711', '420501', '市辖区', '175', '0');
INSERT INTO `common_city_zone` VALUES ('1712', '420502', '西陵区', '175', '0');
INSERT INTO `common_city_zone` VALUES ('1713', '420503', '伍家岗区', '175', '0');
INSERT INTO `common_city_zone` VALUES ('1714', '420504', '点军区', '175', '0');
INSERT INTO `common_city_zone` VALUES ('1715', '420505', '猇亭区', '175', '0');
INSERT INTO `common_city_zone` VALUES ('1716', '420506', '夷陵区', '175', '0');
INSERT INTO `common_city_zone` VALUES ('1717', '420525', '远安县', '175', '0');
INSERT INTO `common_city_zone` VALUES ('1718', '420526', '兴山县', '175', '0');
INSERT INTO `common_city_zone` VALUES ('1719', '420527', '秭归县', '175', '0');
INSERT INTO `common_city_zone` VALUES ('1720', '420528', '长阳土家族自治县', '175', '0');
INSERT INTO `common_city_zone` VALUES ('1721', '420529', '五峰土家族自治县', '175', '0');
INSERT INTO `common_city_zone` VALUES ('1722', '420581', '宜都市', '175', '0');
INSERT INTO `common_city_zone` VALUES ('1723', '420582', '当阳市', '175', '0');
INSERT INTO `common_city_zone` VALUES ('1724', '420583', '枝江市', '175', '0');
INSERT INTO `common_city_zone` VALUES ('1725', '420601', '市辖区', '176', '0');
INSERT INTO `common_city_zone` VALUES ('1726', '420602', '襄城区', '176', '0');
INSERT INTO `common_city_zone` VALUES ('1727', '420606', '樊城区', '176', '0');
INSERT INTO `common_city_zone` VALUES ('1728', '420607', '襄阳区', '176', '0');
INSERT INTO `common_city_zone` VALUES ('1729', '420624', '南漳县', '176', '0');
INSERT INTO `common_city_zone` VALUES ('1730', '420625', '谷城县', '176', '0');
INSERT INTO `common_city_zone` VALUES ('1731', '420626', '保康县', '176', '0');
INSERT INTO `common_city_zone` VALUES ('1732', '420682', '老河口市', '176', '0');
INSERT INTO `common_city_zone` VALUES ('1733', '420683', '枣阳市', '176', '0');
INSERT INTO `common_city_zone` VALUES ('1734', '420684', '宜城市', '176', '0');
INSERT INTO `common_city_zone` VALUES ('1735', '420701', '市辖区', '177', '0');
INSERT INTO `common_city_zone` VALUES ('1736', '420702', '梁子湖区', '177', '0');
INSERT INTO `common_city_zone` VALUES ('1737', '420703', '华容区', '177', '0');
INSERT INTO `common_city_zone` VALUES ('1738', '420704', '鄂城区', '177', '0');
INSERT INTO `common_city_zone` VALUES ('1739', '420801', '市辖区', '178', '0');
INSERT INTO `common_city_zone` VALUES ('1740', '420802', '东宝区', '178', '0');
INSERT INTO `common_city_zone` VALUES ('1741', '420804', '掇刀区', '178', '0');
INSERT INTO `common_city_zone` VALUES ('1742', '420821', '京山县', '178', '0');
INSERT INTO `common_city_zone` VALUES ('1743', '420822', '沙洋县', '178', '0');
INSERT INTO `common_city_zone` VALUES ('1744', '420881', '钟祥市', '178', '0');
INSERT INTO `common_city_zone` VALUES ('1745', '420901', '市辖区', '179', '0');
INSERT INTO `common_city_zone` VALUES ('1746', '420902', '孝南区', '179', '0');
INSERT INTO `common_city_zone` VALUES ('1747', '420921', '孝昌县', '179', '0');
INSERT INTO `common_city_zone` VALUES ('1748', '420922', '大悟县', '179', '0');
INSERT INTO `common_city_zone` VALUES ('1749', '420923', '云梦县', '179', '0');
INSERT INTO `common_city_zone` VALUES ('1750', '420981', '应城市', '179', '0');
INSERT INTO `common_city_zone` VALUES ('1751', '420982', '安陆市', '179', '0');
INSERT INTO `common_city_zone` VALUES ('1752', '420984', '汉川市', '179', '0');
INSERT INTO `common_city_zone` VALUES ('1753', '421001', '市辖区', '180', '0');
INSERT INTO `common_city_zone` VALUES ('1754', '421002', '沙市区', '180', '0');
INSERT INTO `common_city_zone` VALUES ('1755', '421003', '荆州区', '180', '0');
INSERT INTO `common_city_zone` VALUES ('1756', '421022', '公安县', '180', '0');
INSERT INTO `common_city_zone` VALUES ('1757', '421023', '监利县', '180', '0');
INSERT INTO `common_city_zone` VALUES ('1758', '421024', '江陵县', '180', '0');
INSERT INTO `common_city_zone` VALUES ('1759', '421081', '石首市', '180', '0');
INSERT INTO `common_city_zone` VALUES ('1760', '421083', '洪湖市', '180', '0');
INSERT INTO `common_city_zone` VALUES ('1761', '421087', '松滋市', '180', '0');
INSERT INTO `common_city_zone` VALUES ('1762', '421101', '市辖区', '181', '0');
INSERT INTO `common_city_zone` VALUES ('1763', '421102', '黄州区', '181', '0');
INSERT INTO `common_city_zone` VALUES ('1764', '421121', '团风县', '181', '0');
INSERT INTO `common_city_zone` VALUES ('1765', '421122', '红安县', '181', '0');
INSERT INTO `common_city_zone` VALUES ('1766', '421123', '罗田县', '181', '0');
INSERT INTO `common_city_zone` VALUES ('1767', '421124', '英山县', '181', '0');
INSERT INTO `common_city_zone` VALUES ('1768', '421125', '浠水县', '181', '0');
INSERT INTO `common_city_zone` VALUES ('1769', '421126', '蕲春县', '181', '0');
INSERT INTO `common_city_zone` VALUES ('1770', '421127', '黄梅县', '181', '0');
INSERT INTO `common_city_zone` VALUES ('1771', '421181', '麻城市', '181', '0');
INSERT INTO `common_city_zone` VALUES ('1772', '421182', '武穴市', '181', '0');
INSERT INTO `common_city_zone` VALUES ('1773', '421201', '市辖区', '182', '0');
INSERT INTO `common_city_zone` VALUES ('1774', '421202', '咸安区', '182', '0');
INSERT INTO `common_city_zone` VALUES ('1775', '421221', '嘉鱼县', '182', '0');
INSERT INTO `common_city_zone` VALUES ('1776', '421222', '通城县', '182', '0');
INSERT INTO `common_city_zone` VALUES ('1777', '421223', '崇阳县', '182', '0');
INSERT INTO `common_city_zone` VALUES ('1778', '421224', '通山县', '182', '0');
INSERT INTO `common_city_zone` VALUES ('1779', '421281', '赤壁市', '182', '0');
INSERT INTO `common_city_zone` VALUES ('1780', '421301', '市辖区', '183', '0');
INSERT INTO `common_city_zone` VALUES ('1781', '421302', '曾都区', '183', '0');
INSERT INTO `common_city_zone` VALUES ('1782', '421381', '广水市', '183', '0');
INSERT INTO `common_city_zone` VALUES ('1783', '422801', '恩施市', '184', '0');
INSERT INTO `common_city_zone` VALUES ('1784', '422802', '利川市', '184', '0');
INSERT INTO `common_city_zone` VALUES ('1785', '422822', '建始县', '184', '0');
INSERT INTO `common_city_zone` VALUES ('1786', '422823', '巴东县', '184', '0');
INSERT INTO `common_city_zone` VALUES ('1787', '422825', '宣恩县', '184', '0');
INSERT INTO `common_city_zone` VALUES ('1788', '422826', '咸丰县', '184', '0');
INSERT INTO `common_city_zone` VALUES ('1789', '422827', '来凤县', '184', '0');
INSERT INTO `common_city_zone` VALUES ('1790', '422828', '鹤峰县', '184', '0');
INSERT INTO `common_city_zone` VALUES ('1791', '429004', '仙桃市', '185', '0');
INSERT INTO `common_city_zone` VALUES ('1792', '429005', '潜江市', '185', '0');
INSERT INTO `common_city_zone` VALUES ('1793', '429006', '天门市', '185', '0');
INSERT INTO `common_city_zone` VALUES ('1794', '429021', '神农架林区', '185', '0');
INSERT INTO `common_city_zone` VALUES ('1795', '430101', '市辖区', '186', '0');
INSERT INTO `common_city_zone` VALUES ('1796', '430102', '芙蓉区', '186', '0');
INSERT INTO `common_city_zone` VALUES ('1797', '430103', '天心区', '186', '0');
INSERT INTO `common_city_zone` VALUES ('1798', '430104', '岳麓区', '186', '0');
INSERT INTO `common_city_zone` VALUES ('1799', '430105', '开福区', '186', '0');
INSERT INTO `common_city_zone` VALUES ('1800', '430111', '雨花区', '186', '0');
INSERT INTO `common_city_zone` VALUES ('1801', '430121', '长沙县', '186', '0');
INSERT INTO `common_city_zone` VALUES ('1802', '430122', '望城县', '186', '0');
INSERT INTO `common_city_zone` VALUES ('1803', '430124', '宁乡县', '186', '0');
INSERT INTO `common_city_zone` VALUES ('1804', '430181', '浏阳市', '186', '0');
INSERT INTO `common_city_zone` VALUES ('1805', '430201', '市辖区', '187', '0');
INSERT INTO `common_city_zone` VALUES ('1806', '430202', '荷塘区', '187', '0');
INSERT INTO `common_city_zone` VALUES ('1807', '430203', '芦淞区', '187', '0');
INSERT INTO `common_city_zone` VALUES ('1808', '430204', '石峰区', '187', '0');
INSERT INTO `common_city_zone` VALUES ('1809', '430211', '天元区', '187', '0');
INSERT INTO `common_city_zone` VALUES ('1810', '430221', '株洲县', '187', '0');
INSERT INTO `common_city_zone` VALUES ('1811', '430223', '攸　县', '187', '0');
INSERT INTO `common_city_zone` VALUES ('1812', '430224', '茶陵县', '187', '0');
INSERT INTO `common_city_zone` VALUES ('1813', '430225', '炎陵县', '187', '0');
INSERT INTO `common_city_zone` VALUES ('1814', '430281', '醴陵市', '187', '0');
INSERT INTO `common_city_zone` VALUES ('1815', '430301', '市辖区', '188', '0');
INSERT INTO `common_city_zone` VALUES ('1816', '430302', '雨湖区', '188', '0');
INSERT INTO `common_city_zone` VALUES ('1817', '430304', '岳塘区', '188', '0');
INSERT INTO `common_city_zone` VALUES ('1818', '430321', '湘潭县', '188', '0');
INSERT INTO `common_city_zone` VALUES ('1819', '430381', '湘乡市', '188', '0');
INSERT INTO `common_city_zone` VALUES ('1820', '430382', '韶山市', '188', '0');
INSERT INTO `common_city_zone` VALUES ('1821', '430401', '市辖区', '189', '0');
INSERT INTO `common_city_zone` VALUES ('1822', '430405', '珠晖区', '189', '0');
INSERT INTO `common_city_zone` VALUES ('1823', '430406', '雁峰区', '189', '0');
INSERT INTO `common_city_zone` VALUES ('1824', '430407', '石鼓区', '189', '0');
INSERT INTO `common_city_zone` VALUES ('1825', '430408', '蒸湘区', '189', '0');
INSERT INTO `common_city_zone` VALUES ('1826', '430412', '南岳区', '189', '0');
INSERT INTO `common_city_zone` VALUES ('1827', '430421', '衡阳县', '189', '0');
INSERT INTO `common_city_zone` VALUES ('1828', '430422', '衡南县', '189', '0');
INSERT INTO `common_city_zone` VALUES ('1829', '430423', '衡山县', '189', '0');
INSERT INTO `common_city_zone` VALUES ('1830', '430424', '衡东县', '189', '0');
INSERT INTO `common_city_zone` VALUES ('1831', '430426', '祁东县', '189', '0');
INSERT INTO `common_city_zone` VALUES ('1832', '430481', '耒阳市', '189', '0');
INSERT INTO `common_city_zone` VALUES ('1833', '430482', '常宁市', '189', '0');
INSERT INTO `common_city_zone` VALUES ('1834', '430501', '市辖区', '190', '0');
INSERT INTO `common_city_zone` VALUES ('1835', '430502', '双清区', '190', '0');
INSERT INTO `common_city_zone` VALUES ('1836', '430503', '大祥区', '190', '0');
INSERT INTO `common_city_zone` VALUES ('1837', '430511', '北塔区', '190', '0');
INSERT INTO `common_city_zone` VALUES ('1838', '430521', '邵东县', '190', '0');
INSERT INTO `common_city_zone` VALUES ('1839', '430522', '新邵县', '190', '0');
INSERT INTO `common_city_zone` VALUES ('1840', '430523', '邵阳县', '190', '0');
INSERT INTO `common_city_zone` VALUES ('1841', '430524', '隆回县', '190', '0');
INSERT INTO `common_city_zone` VALUES ('1842', '430525', '洞口县', '190', '0');
INSERT INTO `common_city_zone` VALUES ('1843', '430527', '绥宁县', '190', '0');
INSERT INTO `common_city_zone` VALUES ('1844', '430528', '新宁县', '190', '0');
INSERT INTO `common_city_zone` VALUES ('1845', '430529', '城步苗族自治县', '190', '0');
INSERT INTO `common_city_zone` VALUES ('1846', '430581', '武冈市', '190', '0');
INSERT INTO `common_city_zone` VALUES ('1847', '430601', '市辖区', '191', '0');
INSERT INTO `common_city_zone` VALUES ('1848', '430602', '岳阳楼区', '191', '0');
INSERT INTO `common_city_zone` VALUES ('1849', '430603', '云溪区', '191', '0');
INSERT INTO `common_city_zone` VALUES ('1850', '430611', '君山区', '191', '0');
INSERT INTO `common_city_zone` VALUES ('1851', '430621', '岳阳县', '191', '0');
INSERT INTO `common_city_zone` VALUES ('1852', '430623', '华容县', '191', '0');
INSERT INTO `common_city_zone` VALUES ('1853', '430624', '湘阴县', '191', '0');
INSERT INTO `common_city_zone` VALUES ('1854', '430626', '平江县', '191', '0');
INSERT INTO `common_city_zone` VALUES ('1855', '430681', '汨罗市', '191', '0');
INSERT INTO `common_city_zone` VALUES ('1856', '430682', '临湘市', '191', '0');
INSERT INTO `common_city_zone` VALUES ('1857', '430701', '市辖区', '192', '0');
INSERT INTO `common_city_zone` VALUES ('1858', '430702', '武陵区', '192', '0');
INSERT INTO `common_city_zone` VALUES ('1859', '430703', '鼎城区', '192', '0');
INSERT INTO `common_city_zone` VALUES ('1860', '430721', '安乡县', '192', '0');
INSERT INTO `common_city_zone` VALUES ('1861', '430722', '汉寿县', '192', '0');
INSERT INTO `common_city_zone` VALUES ('1862', '430723', '澧　县', '192', '0');
INSERT INTO `common_city_zone` VALUES ('1863', '430724', '临澧县', '192', '0');
INSERT INTO `common_city_zone` VALUES ('1864', '430725', '桃源县', '192', '0');
INSERT INTO `common_city_zone` VALUES ('1865', '430726', '石门县', '192', '0');
INSERT INTO `common_city_zone` VALUES ('1866', '430781', '津市市', '192', '0');
INSERT INTO `common_city_zone` VALUES ('1867', '430801', '市辖区', '193', '0');
INSERT INTO `common_city_zone` VALUES ('1868', '430802', '永定区', '193', '0');
INSERT INTO `common_city_zone` VALUES ('1869', '430811', '武陵源区', '193', '0');
INSERT INTO `common_city_zone` VALUES ('1870', '430821', '慈利县', '193', '0');
INSERT INTO `common_city_zone` VALUES ('1871', '430822', '桑植县', '193', '0');
INSERT INTO `common_city_zone` VALUES ('1872', '430901', '市辖区', '194', '0');
INSERT INTO `common_city_zone` VALUES ('1873', '430902', '资阳区', '194', '0');
INSERT INTO `common_city_zone` VALUES ('1874', '430903', '赫山区', '194', '0');
INSERT INTO `common_city_zone` VALUES ('1875', '430921', '南　县', '194', '0');
INSERT INTO `common_city_zone` VALUES ('1876', '430922', '桃江县', '194', '0');
INSERT INTO `common_city_zone` VALUES ('1877', '430923', '安化县', '194', '0');
INSERT INTO `common_city_zone` VALUES ('1878', '430981', '沅江市', '194', '0');
INSERT INTO `common_city_zone` VALUES ('1879', '431001', '市辖区', '195', '0');
INSERT INTO `common_city_zone` VALUES ('1880', '431002', '北湖区', '195', '0');
INSERT INTO `common_city_zone` VALUES ('1881', '431003', '苏仙区', '195', '0');
INSERT INTO `common_city_zone` VALUES ('1882', '431021', '桂阳县', '195', '0');
INSERT INTO `common_city_zone` VALUES ('1883', '431022', '宜章县', '195', '0');
INSERT INTO `common_city_zone` VALUES ('1884', '431023', '永兴县', '195', '0');
INSERT INTO `common_city_zone` VALUES ('1885', '431024', '嘉禾县', '195', '0');
INSERT INTO `common_city_zone` VALUES ('1886', '431025', '临武县', '195', '0');
INSERT INTO `common_city_zone` VALUES ('1887', '431026', '汝城县', '195', '0');
INSERT INTO `common_city_zone` VALUES ('1888', '431027', '桂东县', '195', '0');
INSERT INTO `common_city_zone` VALUES ('1889', '431028', '安仁县', '195', '0');
INSERT INTO `common_city_zone` VALUES ('1890', '431081', '资兴市', '195', '0');
INSERT INTO `common_city_zone` VALUES ('1891', '431101', '市辖区', '196', '0');
INSERT INTO `common_city_zone` VALUES ('1892', '431102', '芝山区', '196', '0');
INSERT INTO `common_city_zone` VALUES ('1893', '431103', '冷水滩区', '196', '0');
INSERT INTO `common_city_zone` VALUES ('1894', '431121', '祁阳县', '196', '0');
INSERT INTO `common_city_zone` VALUES ('1895', '431122', '东安县', '196', '0');
INSERT INTO `common_city_zone` VALUES ('1896', '431123', '双牌县', '196', '0');
INSERT INTO `common_city_zone` VALUES ('1897', '431124', '道　县', '196', '0');
INSERT INTO `common_city_zone` VALUES ('1898', '431125', '江永县', '196', '0');
INSERT INTO `common_city_zone` VALUES ('1899', '431126', '宁远县', '196', '0');
INSERT INTO `common_city_zone` VALUES ('1900', '431127', '蓝山县', '196', '0');
INSERT INTO `common_city_zone` VALUES ('1901', '431128', '新田县', '196', '0');
INSERT INTO `common_city_zone` VALUES ('1902', '431129', '江华瑶族自治县', '196', '0');
INSERT INTO `common_city_zone` VALUES ('1903', '431201', '市辖区', '197', '0');
INSERT INTO `common_city_zone` VALUES ('1904', '431202', '鹤城区', '197', '0');
INSERT INTO `common_city_zone` VALUES ('1905', '431221', '中方县', '197', '0');
INSERT INTO `common_city_zone` VALUES ('1906', '431222', '沅陵县', '197', '0');
INSERT INTO `common_city_zone` VALUES ('1907', '431223', '辰溪县', '197', '0');
INSERT INTO `common_city_zone` VALUES ('1908', '431224', '溆浦县', '197', '0');
INSERT INTO `common_city_zone` VALUES ('1909', '431225', '会同县', '197', '0');
INSERT INTO `common_city_zone` VALUES ('1910', '431226', '麻阳苗族自治县', '197', '0');
INSERT INTO `common_city_zone` VALUES ('1911', '431227', '新晃侗族自治县', '197', '0');
INSERT INTO `common_city_zone` VALUES ('1912', '431228', '芷江侗族自治县', '197', '0');
INSERT INTO `common_city_zone` VALUES ('1913', '431229', '靖州苗族侗族自治县', '197', '0');
INSERT INTO `common_city_zone` VALUES ('1914', '431230', '通道侗族自治县', '197', '0');
INSERT INTO `common_city_zone` VALUES ('1915', '431281', '洪江市', '197', '0');
INSERT INTO `common_city_zone` VALUES ('1916', '431301', '市辖区', '198', '0');
INSERT INTO `common_city_zone` VALUES ('1917', '431302', '娄星区', '198', '0');
INSERT INTO `common_city_zone` VALUES ('1918', '431321', '双峰县', '198', '0');
INSERT INTO `common_city_zone` VALUES ('1919', '431322', '新化县', '198', '0');
INSERT INTO `common_city_zone` VALUES ('1920', '431381', '冷水江市', '198', '0');
INSERT INTO `common_city_zone` VALUES ('1921', '431382', '涟源市', '198', '0');
INSERT INTO `common_city_zone` VALUES ('1922', '433101', '吉首市', '199', '0');
INSERT INTO `common_city_zone` VALUES ('1923', '433122', '泸溪县', '199', '0');
INSERT INTO `common_city_zone` VALUES ('1924', '433123', '凤凰县', '199', '0');
INSERT INTO `common_city_zone` VALUES ('1925', '433124', '花垣县', '199', '0');
INSERT INTO `common_city_zone` VALUES ('1926', '433125', '保靖县', '199', '0');
INSERT INTO `common_city_zone` VALUES ('1927', '433126', '古丈县', '199', '0');
INSERT INTO `common_city_zone` VALUES ('1928', '433127', '永顺县', '199', '0');
INSERT INTO `common_city_zone` VALUES ('1929', '433130', '龙山县', '199', '0');
INSERT INTO `common_city_zone` VALUES ('1930', '440101', '市辖区', '200', '0');
INSERT INTO `common_city_zone` VALUES ('1931', '440102', '东山区', '200', '0');
INSERT INTO `common_city_zone` VALUES ('1932', '440103', '荔湾区', '200', '0');
INSERT INTO `common_city_zone` VALUES ('1933', '440104', '越秀区', '200', '0');
INSERT INTO `common_city_zone` VALUES ('1934', '440105', '海珠区', '200', '0');
INSERT INTO `common_city_zone` VALUES ('1935', '440106', '天河区', '200', '0');
INSERT INTO `common_city_zone` VALUES ('1936', '440107', '芳村区', '200', '0');
INSERT INTO `common_city_zone` VALUES ('1937', '440111', '白云区', '200', '0');
INSERT INTO `common_city_zone` VALUES ('1938', '440112', '黄埔区', '200', '0');
INSERT INTO `common_city_zone` VALUES ('1939', '440113', '番禺区', '200', '0');
INSERT INTO `common_city_zone` VALUES ('1940', '440114', '花都区', '200', '0');
INSERT INTO `common_city_zone` VALUES ('1941', '440183', '增城市', '200', '0');
INSERT INTO `common_city_zone` VALUES ('1942', '440184', '从化市', '200', '0');
INSERT INTO `common_city_zone` VALUES ('1943', '440201', '市辖区', '201', '0');
INSERT INTO `common_city_zone` VALUES ('1944', '440203', '武江区', '201', '0');
INSERT INTO `common_city_zone` VALUES ('1945', '440204', '浈江区', '201', '0');
INSERT INTO `common_city_zone` VALUES ('1946', '440205', '曲江区', '201', '0');
INSERT INTO `common_city_zone` VALUES ('1947', '440222', '始兴县', '201', '0');
INSERT INTO `common_city_zone` VALUES ('1948', '440224', '仁化县', '201', '0');
INSERT INTO `common_city_zone` VALUES ('1949', '440229', '翁源县', '201', '0');
INSERT INTO `common_city_zone` VALUES ('1950', '440232', '乳源瑶族自治县', '201', '0');
INSERT INTO `common_city_zone` VALUES ('1951', '440233', '新丰县', '201', '0');
INSERT INTO `common_city_zone` VALUES ('1952', '440281', '乐昌市', '201', '0');
INSERT INTO `common_city_zone` VALUES ('1953', '440282', '南雄市', '201', '0');
INSERT INTO `common_city_zone` VALUES ('1954', '440301', '市辖区', '202', '1');
INSERT INTO `common_city_zone` VALUES ('1955', '440303', '罗湖区', '202', '1');
INSERT INTO `common_city_zone` VALUES ('1956', '440304', '福田区', '202', '1');
INSERT INTO `common_city_zone` VALUES ('1957', '440305', '南山区', '202', '1');
INSERT INTO `common_city_zone` VALUES ('1958', '440306', '宝安区', '202', '1');
INSERT INTO `common_city_zone` VALUES ('1959', '440307', '龙岗区', '202', '1');
INSERT INTO `common_city_zone` VALUES ('1960', '440308', '盐田区', '202', '1');
INSERT INTO `common_city_zone` VALUES ('1961', '440401', '市辖区', '203', '0');
INSERT INTO `common_city_zone` VALUES ('1962', '440402', '香洲区', '203', '0');
INSERT INTO `common_city_zone` VALUES ('1963', '440403', '斗门区', '203', '0');
INSERT INTO `common_city_zone` VALUES ('1964', '440404', '金湾区', '203', '0');
INSERT INTO `common_city_zone` VALUES ('1965', '440501', '市辖区', '204', '0');
INSERT INTO `common_city_zone` VALUES ('1966', '440507', '龙湖区', '204', '0');
INSERT INTO `common_city_zone` VALUES ('1967', '440511', '金平区', '204', '0');
INSERT INTO `common_city_zone` VALUES ('1968', '440512', '濠江区', '204', '0');
INSERT INTO `common_city_zone` VALUES ('1969', '440513', '潮阳区', '204', '0');
INSERT INTO `common_city_zone` VALUES ('1970', '440514', '潮南区', '204', '0');
INSERT INTO `common_city_zone` VALUES ('1971', '440515', '澄海区', '204', '0');
INSERT INTO `common_city_zone` VALUES ('1972', '440523', '南澳县', '204', '0');
INSERT INTO `common_city_zone` VALUES ('1973', '440601', '市辖区', '205', '0');
INSERT INTO `common_city_zone` VALUES ('1974', '440604', '禅城区', '205', '0');
INSERT INTO `common_city_zone` VALUES ('1975', '440605', '南海区', '205', '0');
INSERT INTO `common_city_zone` VALUES ('1976', '440606', '顺德区', '205', '0');
INSERT INTO `common_city_zone` VALUES ('1977', '440607', '三水区', '205', '0');
INSERT INTO `common_city_zone` VALUES ('1978', '440608', '高明区', '205', '0');
INSERT INTO `common_city_zone` VALUES ('1979', '440701', '市辖区', '206', '0');
INSERT INTO `common_city_zone` VALUES ('1980', '440703', '蓬江区', '206', '0');
INSERT INTO `common_city_zone` VALUES ('1981', '440704', '江海区', '206', '0');
INSERT INTO `common_city_zone` VALUES ('1982', '440705', '新会区', '206', '0');
INSERT INTO `common_city_zone` VALUES ('1983', '440781', '台山市', '206', '0');
INSERT INTO `common_city_zone` VALUES ('1984', '440783', '开平市', '206', '0');
INSERT INTO `common_city_zone` VALUES ('1985', '440784', '鹤山市', '206', '0');
INSERT INTO `common_city_zone` VALUES ('1986', '440785', '恩平市', '206', '0');
INSERT INTO `common_city_zone` VALUES ('1987', '440801', '市辖区', '207', '0');
INSERT INTO `common_city_zone` VALUES ('1988', '440802', '赤坎区', '207', '0');
INSERT INTO `common_city_zone` VALUES ('1989', '440803', '霞山区', '207', '0');
INSERT INTO `common_city_zone` VALUES ('1990', '440804', '坡头区', '207', '0');
INSERT INTO `common_city_zone` VALUES ('1991', '440811', '麻章区', '207', '0');
INSERT INTO `common_city_zone` VALUES ('1992', '440823', '遂溪县', '207', '0');
INSERT INTO `common_city_zone` VALUES ('1993', '440825', '徐闻县', '207', '0');
INSERT INTO `common_city_zone` VALUES ('1994', '440881', '廉江市', '207', '0');
INSERT INTO `common_city_zone` VALUES ('1995', '440882', '雷州市', '207', '0');
INSERT INTO `common_city_zone` VALUES ('1996', '440883', '吴川市', '207', '0');
INSERT INTO `common_city_zone` VALUES ('1997', '440901', '市辖区', '208', '0');
INSERT INTO `common_city_zone` VALUES ('1998', '440902', '茂南区', '208', '0');
INSERT INTO `common_city_zone` VALUES ('1999', '440903', '茂港区', '208', '0');
INSERT INTO `common_city_zone` VALUES ('2000', '440923', '电白县', '208', '0');
INSERT INTO `common_city_zone` VALUES ('2001', '440981', '高州市', '208', '0');
INSERT INTO `common_city_zone` VALUES ('2002', '440982', '化州市', '208', '0');
INSERT INTO `common_city_zone` VALUES ('2003', '440983', '信宜市', '208', '0');
INSERT INTO `common_city_zone` VALUES ('2004', '441201', '市辖区', '209', '0');
INSERT INTO `common_city_zone` VALUES ('2005', '441202', '端州区', '209', '0');
INSERT INTO `common_city_zone` VALUES ('2006', '441203', '鼎湖区', '209', '0');
INSERT INTO `common_city_zone` VALUES ('2007', '441223', '广宁县', '209', '0');
INSERT INTO `common_city_zone` VALUES ('2008', '441224', '怀集县', '209', '0');
INSERT INTO `common_city_zone` VALUES ('2009', '441225', '封开县', '209', '0');
INSERT INTO `common_city_zone` VALUES ('2010', '441226', '德庆县', '209', '0');
INSERT INTO `common_city_zone` VALUES ('2011', '441283', '高要市', '209', '0');
INSERT INTO `common_city_zone` VALUES ('2012', '441284', '四会市', '209', '0');
INSERT INTO `common_city_zone` VALUES ('2013', '441301', '市辖区', '210', '0');
INSERT INTO `common_city_zone` VALUES ('2014', '441302', '惠城区', '210', '0');
INSERT INTO `common_city_zone` VALUES ('2015', '441303', '惠阳区', '210', '0');
INSERT INTO `common_city_zone` VALUES ('2016', '441322', '博罗县', '210', '0');
INSERT INTO `common_city_zone` VALUES ('2017', '441323', '惠东县', '210', '0');
INSERT INTO `common_city_zone` VALUES ('2018', '441324', '龙门县', '210', '0');
INSERT INTO `common_city_zone` VALUES ('2019', '441401', '市辖区', '211', '0');
INSERT INTO `common_city_zone` VALUES ('2020', '441402', '梅江区', '211', '0');
INSERT INTO `common_city_zone` VALUES ('2021', '441421', '梅　县', '211', '0');
INSERT INTO `common_city_zone` VALUES ('2022', '441422', '大埔县', '211', '0');
INSERT INTO `common_city_zone` VALUES ('2023', '441423', '丰顺县', '211', '0');
INSERT INTO `common_city_zone` VALUES ('2024', '441424', '五华县', '211', '0');
INSERT INTO `common_city_zone` VALUES ('2025', '441426', '平远县', '211', '0');
INSERT INTO `common_city_zone` VALUES ('2026', '441427', '蕉岭县', '211', '0');
INSERT INTO `common_city_zone` VALUES ('2027', '441481', '兴宁市', '211', '0');
INSERT INTO `common_city_zone` VALUES ('2028', '441501', '市辖区', '212', '0');
INSERT INTO `common_city_zone` VALUES ('2029', '441502', '城　区', '212', '0');
INSERT INTO `common_city_zone` VALUES ('2030', '441521', '海丰县', '212', '0');
INSERT INTO `common_city_zone` VALUES ('2031', '441523', '陆河县', '212', '0');
INSERT INTO `common_city_zone` VALUES ('2032', '441581', '陆丰市', '212', '0');
INSERT INTO `common_city_zone` VALUES ('2033', '441601', '市辖区', '213', '0');
INSERT INTO `common_city_zone` VALUES ('2034', '441602', '源城区', '213', '0');
INSERT INTO `common_city_zone` VALUES ('2035', '441621', '紫金县', '213', '0');
INSERT INTO `common_city_zone` VALUES ('2036', '441622', '龙川县', '213', '0');
INSERT INTO `common_city_zone` VALUES ('2037', '441623', '连平县', '213', '0');
INSERT INTO `common_city_zone` VALUES ('2038', '441624', '和平县', '213', '0');
INSERT INTO `common_city_zone` VALUES ('2039', '441625', '东源县', '213', '0');
INSERT INTO `common_city_zone` VALUES ('2040', '441701', '市辖区', '214', '0');
INSERT INTO `common_city_zone` VALUES ('2041', '441702', '江城区', '214', '0');
INSERT INTO `common_city_zone` VALUES ('2042', '441721', '阳西县', '214', '0');
INSERT INTO `common_city_zone` VALUES ('2043', '441723', '阳东县', '214', '0');
INSERT INTO `common_city_zone` VALUES ('2044', '441781', '阳春市', '214', '0');
INSERT INTO `common_city_zone` VALUES ('2045', '441801', '市辖区', '215', '0');
INSERT INTO `common_city_zone` VALUES ('2046', '441802', '清城区', '215', '0');
INSERT INTO `common_city_zone` VALUES ('2047', '441821', '佛冈县', '215', '0');
INSERT INTO `common_city_zone` VALUES ('2048', '441823', '阳山县', '215', '0');
INSERT INTO `common_city_zone` VALUES ('2049', '441825', '连山壮族瑶族自治县', '215', '0');
INSERT INTO `common_city_zone` VALUES ('2050', '441826', '连南瑶族自治县', '215', '0');
INSERT INTO `common_city_zone` VALUES ('2051', '441827', '清新县', '215', '0');
INSERT INTO `common_city_zone` VALUES ('2052', '441881', '英德市', '215', '0');
INSERT INTO `common_city_zone` VALUES ('2053', '441882', '连州市', '215', '0');
INSERT INTO `common_city_zone` VALUES ('2054', '445101', '市辖区', '218', '0');
INSERT INTO `common_city_zone` VALUES ('2055', '445102', '湘桥区', '218', '0');
INSERT INTO `common_city_zone` VALUES ('2056', '445121', '潮安县', '218', '0');
INSERT INTO `common_city_zone` VALUES ('2057', '445122', '饶平县', '218', '0');
INSERT INTO `common_city_zone` VALUES ('2058', '445201', '市辖区', '219', '0');
INSERT INTO `common_city_zone` VALUES ('2059', '445202', '榕城区', '219', '0');
INSERT INTO `common_city_zone` VALUES ('2060', '445221', '揭东县', '219', '0');
INSERT INTO `common_city_zone` VALUES ('2061', '445222', '揭西县', '219', '0');
INSERT INTO `common_city_zone` VALUES ('2062', '445224', '惠来县', '219', '0');
INSERT INTO `common_city_zone` VALUES ('2063', '445281', '普宁市', '219', '0');
INSERT INTO `common_city_zone` VALUES ('2064', '445301', '市辖区', '220', '0');
INSERT INTO `common_city_zone` VALUES ('2065', '445302', '云城区', '220', '0');
INSERT INTO `common_city_zone` VALUES ('2066', '445321', '新兴县', '220', '0');
INSERT INTO `common_city_zone` VALUES ('2067', '445322', '郁南县', '220', '0');
INSERT INTO `common_city_zone` VALUES ('2068', '445323', '云安县', '220', '0');
INSERT INTO `common_city_zone` VALUES ('2069', '445381', '罗定市', '220', '0');
INSERT INTO `common_city_zone` VALUES ('2070', '450101', '市辖区', '221', '0');
INSERT INTO `common_city_zone` VALUES ('2071', '450102', '兴宁区', '221', '0');
INSERT INTO `common_city_zone` VALUES ('2072', '450103', '青秀区', '221', '0');
INSERT INTO `common_city_zone` VALUES ('2073', '450105', '江南区', '221', '0');
INSERT INTO `common_city_zone` VALUES ('2074', '450107', '西乡塘区', '221', '0');
INSERT INTO `common_city_zone` VALUES ('2075', '450108', '良庆区', '221', '0');
INSERT INTO `common_city_zone` VALUES ('2076', '450109', '邕宁区', '221', '0');
INSERT INTO `common_city_zone` VALUES ('2077', '450122', '武鸣县', '221', '0');
INSERT INTO `common_city_zone` VALUES ('2078', '450123', '隆安县', '221', '0');
INSERT INTO `common_city_zone` VALUES ('2079', '450124', '马山县', '221', '0');
INSERT INTO `common_city_zone` VALUES ('2080', '450125', '上林县', '221', '0');
INSERT INTO `common_city_zone` VALUES ('2081', '450126', '宾阳县', '221', '0');
INSERT INTO `common_city_zone` VALUES ('2082', '450127', '横　县', '221', '0');
INSERT INTO `common_city_zone` VALUES ('2083', '450201', '市辖区', '222', '0');
INSERT INTO `common_city_zone` VALUES ('2084', '450202', '城中区', '222', '0');
INSERT INTO `common_city_zone` VALUES ('2085', '450203', '鱼峰区', '222', '0');
INSERT INTO `common_city_zone` VALUES ('2086', '450204', '柳南区', '222', '0');
INSERT INTO `common_city_zone` VALUES ('2087', '450205', '柳北区', '222', '0');
INSERT INTO `common_city_zone` VALUES ('2088', '450221', '柳江县', '222', '0');
INSERT INTO `common_city_zone` VALUES ('2089', '450222', '柳城县', '222', '0');
INSERT INTO `common_city_zone` VALUES ('2090', '450223', '鹿寨县', '222', '0');
INSERT INTO `common_city_zone` VALUES ('2091', '450224', '融安县', '222', '0');
INSERT INTO `common_city_zone` VALUES ('2092', '450225', '融水苗族自治县', '222', '0');
INSERT INTO `common_city_zone` VALUES ('2093', '450226', '三江侗族自治县', '222', '0');
INSERT INTO `common_city_zone` VALUES ('2094', '450301', '市辖区', '223', '0');
INSERT INTO `common_city_zone` VALUES ('2095', '450302', '秀峰区', '223', '0');
INSERT INTO `common_city_zone` VALUES ('2096', '450303', '叠彩区', '223', '0');
INSERT INTO `common_city_zone` VALUES ('2097', '450304', '象山区', '223', '0');
INSERT INTO `common_city_zone` VALUES ('2098', '450305', '七星区', '223', '0');
INSERT INTO `common_city_zone` VALUES ('2099', '450311', '雁山区', '223', '0');
INSERT INTO `common_city_zone` VALUES ('2100', '450321', '阳朔县', '223', '0');
INSERT INTO `common_city_zone` VALUES ('2101', '450322', '临桂县', '223', '0');
INSERT INTO `common_city_zone` VALUES ('2102', '450323', '灵川县', '223', '0');
INSERT INTO `common_city_zone` VALUES ('2103', '450324', '全州县', '223', '0');
INSERT INTO `common_city_zone` VALUES ('2104', '450325', '兴安县', '223', '0');
INSERT INTO `common_city_zone` VALUES ('2105', '450326', '永福县', '223', '0');
INSERT INTO `common_city_zone` VALUES ('2106', '450327', '灌阳县', '223', '0');
INSERT INTO `common_city_zone` VALUES ('2107', '450328', '龙胜各族自治县', '223', '0');
INSERT INTO `common_city_zone` VALUES ('2108', '450329', '资源县', '223', '0');
INSERT INTO `common_city_zone` VALUES ('2109', '450330', '平乐县', '223', '0');
INSERT INTO `common_city_zone` VALUES ('2110', '450331', '荔蒲县', '223', '0');
INSERT INTO `common_city_zone` VALUES ('2111', '450332', '恭城瑶族自治县', '223', '0');
INSERT INTO `common_city_zone` VALUES ('2112', '450401', '市辖区', '224', '0');
INSERT INTO `common_city_zone` VALUES ('2113', '450403', '万秀区', '224', '0');
INSERT INTO `common_city_zone` VALUES ('2114', '450404', '蝶山区', '224', '0');
INSERT INTO `common_city_zone` VALUES ('2115', '450405', '长洲区', '224', '0');
INSERT INTO `common_city_zone` VALUES ('2116', '450421', '苍梧县', '224', '0');
INSERT INTO `common_city_zone` VALUES ('2117', '450422', '藤　县', '224', '0');
INSERT INTO `common_city_zone` VALUES ('2118', '450423', '蒙山县', '224', '0');
INSERT INTO `common_city_zone` VALUES ('2119', '450481', '岑溪市', '224', '0');
INSERT INTO `common_city_zone` VALUES ('2120', '450501', '市辖区', '225', '0');
INSERT INTO `common_city_zone` VALUES ('2121', '450502', '海城区', '225', '0');
INSERT INTO `common_city_zone` VALUES ('2122', '450503', '银海区', '225', '0');
INSERT INTO `common_city_zone` VALUES ('2123', '450512', '铁山港区', '225', '0');
INSERT INTO `common_city_zone` VALUES ('2124', '450521', '合浦县', '225', '0');
INSERT INTO `common_city_zone` VALUES ('2125', '450601', '市辖区', '226', '0');
INSERT INTO `common_city_zone` VALUES ('2126', '450602', '港口区', '226', '0');
INSERT INTO `common_city_zone` VALUES ('2127', '450603', '防城区', '226', '0');
INSERT INTO `common_city_zone` VALUES ('2128', '450621', '上思县', '226', '0');
INSERT INTO `common_city_zone` VALUES ('2129', '450681', '东兴市', '226', '0');
INSERT INTO `common_city_zone` VALUES ('2130', '450701', '市辖区', '227', '0');
INSERT INTO `common_city_zone` VALUES ('2131', '450702', '钦南区', '227', '0');
INSERT INTO `common_city_zone` VALUES ('2132', '450703', '钦北区', '227', '0');
INSERT INTO `common_city_zone` VALUES ('2133', '450721', '灵山县', '227', '0');
INSERT INTO `common_city_zone` VALUES ('2134', '450722', '浦北县', '227', '0');
INSERT INTO `common_city_zone` VALUES ('2135', '450801', '市辖区', '228', '0');
INSERT INTO `common_city_zone` VALUES ('2136', '450802', '港北区', '228', '0');
INSERT INTO `common_city_zone` VALUES ('2137', '450803', '港南区', '228', '0');
INSERT INTO `common_city_zone` VALUES ('2138', '450804', '覃塘区', '228', '0');
INSERT INTO `common_city_zone` VALUES ('2139', '450821', '平南县', '228', '0');
INSERT INTO `common_city_zone` VALUES ('2140', '450881', '桂平市', '228', '0');
INSERT INTO `common_city_zone` VALUES ('2141', '450901', '市辖区', '229', '0');
INSERT INTO `common_city_zone` VALUES ('2142', '450902', '玉州区', '229', '0');
INSERT INTO `common_city_zone` VALUES ('2143', '450921', '容　县', '229', '0');
INSERT INTO `common_city_zone` VALUES ('2144', '450922', '陆川县', '229', '0');
INSERT INTO `common_city_zone` VALUES ('2145', '450923', '博白县', '229', '0');
INSERT INTO `common_city_zone` VALUES ('2146', '450924', '兴业县', '229', '0');
INSERT INTO `common_city_zone` VALUES ('2147', '450981', '北流市', '229', '0');
INSERT INTO `common_city_zone` VALUES ('2148', '451001', '市辖区', '230', '0');
INSERT INTO `common_city_zone` VALUES ('2149', '451002', '右江区', '230', '0');
INSERT INTO `common_city_zone` VALUES ('2150', '451021', '田阳县', '230', '0');
INSERT INTO `common_city_zone` VALUES ('2151', '451022', '田东县', '230', '0');
INSERT INTO `common_city_zone` VALUES ('2152', '451023', '平果县', '230', '0');
INSERT INTO `common_city_zone` VALUES ('2153', '451024', '德保县', '230', '0');
INSERT INTO `common_city_zone` VALUES ('2154', '451025', '靖西县', '230', '0');
INSERT INTO `common_city_zone` VALUES ('2155', '451026', '那坡县', '230', '0');
INSERT INTO `common_city_zone` VALUES ('2156', '451027', '凌云县', '230', '0');
INSERT INTO `common_city_zone` VALUES ('2157', '451028', '乐业县', '230', '0');
INSERT INTO `common_city_zone` VALUES ('2158', '451029', '田林县', '230', '0');
INSERT INTO `common_city_zone` VALUES ('2159', '451030', '西林县', '230', '0');
INSERT INTO `common_city_zone` VALUES ('2160', '451031', '隆林各族自治县', '230', '0');
INSERT INTO `common_city_zone` VALUES ('2161', '451101', '市辖区', '231', '0');
INSERT INTO `common_city_zone` VALUES ('2162', '451102', '八步区', '231', '0');
INSERT INTO `common_city_zone` VALUES ('2163', '451121', '昭平县', '231', '0');
INSERT INTO `common_city_zone` VALUES ('2164', '451122', '钟山县', '231', '0');
INSERT INTO `common_city_zone` VALUES ('2165', '451123', '富川瑶族自治县', '231', '0');
INSERT INTO `common_city_zone` VALUES ('2166', '451201', '市辖区', '232', '0');
INSERT INTO `common_city_zone` VALUES ('2167', '451202', '金城江区', '232', '0');
INSERT INTO `common_city_zone` VALUES ('2168', '451221', '南丹县', '232', '0');
INSERT INTO `common_city_zone` VALUES ('2169', '451222', '天峨县', '232', '0');
INSERT INTO `common_city_zone` VALUES ('2170', '451223', '凤山县', '232', '0');
INSERT INTO `common_city_zone` VALUES ('2171', '451224', '东兰县', '232', '0');
INSERT INTO `common_city_zone` VALUES ('2172', '451225', '罗城仫佬族自治县', '232', '0');
INSERT INTO `common_city_zone` VALUES ('2173', '451226', '环江毛南族自治县', '232', '0');
INSERT INTO `common_city_zone` VALUES ('2174', '451227', '巴马瑶族自治县', '232', '0');
INSERT INTO `common_city_zone` VALUES ('2175', '451228', '都安瑶族自治县', '232', '0');
INSERT INTO `common_city_zone` VALUES ('2176', '451229', '大化瑶族自治县', '232', '0');
INSERT INTO `common_city_zone` VALUES ('2177', '451281', '宜州市', '232', '0');
INSERT INTO `common_city_zone` VALUES ('2178', '451301', '市辖区', '233', '0');
INSERT INTO `common_city_zone` VALUES ('2179', '451302', '兴宾区', '233', '0');
INSERT INTO `common_city_zone` VALUES ('2180', '451321', '忻城县', '233', '0');
INSERT INTO `common_city_zone` VALUES ('2181', '451322', '象州县', '233', '0');
INSERT INTO `common_city_zone` VALUES ('2182', '451323', '武宣县', '233', '0');
INSERT INTO `common_city_zone` VALUES ('2183', '451324', '金秀瑶族自治县', '233', '0');
INSERT INTO `common_city_zone` VALUES ('2184', '451381', '合山市', '233', '0');
INSERT INTO `common_city_zone` VALUES ('2185', '451401', '市辖区', '234', '0');
INSERT INTO `common_city_zone` VALUES ('2186', '451402', '江洲区', '234', '0');
INSERT INTO `common_city_zone` VALUES ('2187', '451421', '扶绥县', '234', '0');
INSERT INTO `common_city_zone` VALUES ('2188', '451422', '宁明县', '234', '0');
INSERT INTO `common_city_zone` VALUES ('2189', '451423', '龙州县', '234', '0');
INSERT INTO `common_city_zone` VALUES ('2190', '451424', '大新县', '234', '0');
INSERT INTO `common_city_zone` VALUES ('2191', '451425', '天等县', '234', '0');
INSERT INTO `common_city_zone` VALUES ('2192', '451481', '凭祥市', '234', '0');
INSERT INTO `common_city_zone` VALUES ('2193', '460101', '市辖区', '235', '0');
INSERT INTO `common_city_zone` VALUES ('2194', '460105', '秀英区', '235', '0');
INSERT INTO `common_city_zone` VALUES ('2195', '460106', '龙华区', '235', '0');
INSERT INTO `common_city_zone` VALUES ('2196', '460107', '琼山区', '235', '0');
INSERT INTO `common_city_zone` VALUES ('2197', '460108', '美兰区', '235', '0');
INSERT INTO `common_city_zone` VALUES ('2198', '460201', '市辖区', '236', '0');
INSERT INTO `common_city_zone` VALUES ('2199', '469001', '五指山市', '237', '0');
INSERT INTO `common_city_zone` VALUES ('2200', '469002', '琼海市', '237', '0');
INSERT INTO `common_city_zone` VALUES ('2201', '469003', '儋州市', '237', '0');
INSERT INTO `common_city_zone` VALUES ('2202', '469005', '文昌市', '237', '0');
INSERT INTO `common_city_zone` VALUES ('2203', '469006', '万宁市', '237', '0');
INSERT INTO `common_city_zone` VALUES ('2204', '469007', '东方市', '237', '0');
INSERT INTO `common_city_zone` VALUES ('2205', '469025', '定安县', '237', '0');
INSERT INTO `common_city_zone` VALUES ('2206', '469026', '屯昌县', '237', '0');
INSERT INTO `common_city_zone` VALUES ('2207', '469027', '澄迈县', '237', '0');
INSERT INTO `common_city_zone` VALUES ('2208', '469028', '临高县', '237', '0');
INSERT INTO `common_city_zone` VALUES ('2209', '469030', '白沙黎族自治县', '237', '0');
INSERT INTO `common_city_zone` VALUES ('2210', '469031', '昌江黎族自治县', '237', '0');
INSERT INTO `common_city_zone` VALUES ('2211', '469033', '乐东黎族自治县', '237', '0');
INSERT INTO `common_city_zone` VALUES ('2212', '469034', '陵水黎族自治县', '237', '0');
INSERT INTO `common_city_zone` VALUES ('2213', '469035', '保亭黎族苗族自治县', '237', '0');
INSERT INTO `common_city_zone` VALUES ('2214', '469036', '琼中黎族苗族自治县', '237', '0');
INSERT INTO `common_city_zone` VALUES ('2215', '469037', '西沙群岛', '237', '0');
INSERT INTO `common_city_zone` VALUES ('2216', '469038', '南沙群岛', '237', '0');
INSERT INTO `common_city_zone` VALUES ('2217', '469039', '中沙群岛的岛礁及其海域', '237', '0');
INSERT INTO `common_city_zone` VALUES ('2218', '500101', '万州区', '238', '0');
INSERT INTO `common_city_zone` VALUES ('2219', '500102', '涪陵区', '238', '0');
INSERT INTO `common_city_zone` VALUES ('2220', '500103', '渝中区', '238', '0');
INSERT INTO `common_city_zone` VALUES ('2221', '500104', '大渡口区', '238', '0');
INSERT INTO `common_city_zone` VALUES ('2222', '500105', '江北区', '238', '0');
INSERT INTO `common_city_zone` VALUES ('2223', '500106', '沙坪坝区', '238', '0');
INSERT INTO `common_city_zone` VALUES ('2224', '500107', '九龙坡区', '238', '0');
INSERT INTO `common_city_zone` VALUES ('2225', '500108', '南岸区', '238', '0');
INSERT INTO `common_city_zone` VALUES ('2226', '500109', '北碚区', '238', '0');
INSERT INTO `common_city_zone` VALUES ('2227', '500110', '万盛区', '238', '0');
INSERT INTO `common_city_zone` VALUES ('2228', '500111', '双桥区', '238', '0');
INSERT INTO `common_city_zone` VALUES ('2229', '500112', '渝北区', '238', '0');
INSERT INTO `common_city_zone` VALUES ('2230', '500113', '巴南区', '238', '0');
INSERT INTO `common_city_zone` VALUES ('2231', '500114', '黔江区', '238', '0');
INSERT INTO `common_city_zone` VALUES ('2232', '500115', '长寿区', '238', '0');
INSERT INTO `common_city_zone` VALUES ('2233', '500222', '綦江县', '239', '0');
INSERT INTO `common_city_zone` VALUES ('2234', '500223', '潼南县', '239', '0');
INSERT INTO `common_city_zone` VALUES ('2235', '500224', '铜梁县', '239', '0');
INSERT INTO `common_city_zone` VALUES ('2236', '500225', '大足县', '239', '0');
INSERT INTO `common_city_zone` VALUES ('2237', '500226', '荣昌县', '239', '0');
INSERT INTO `common_city_zone` VALUES ('2238', '500227', '璧山县', '239', '0');
INSERT INTO `common_city_zone` VALUES ('2239', '500228', '梁平县', '239', '0');
INSERT INTO `common_city_zone` VALUES ('2240', '500229', '城口县', '239', '0');
INSERT INTO `common_city_zone` VALUES ('2241', '500230', '丰都县', '239', '0');
INSERT INTO `common_city_zone` VALUES ('2242', '500231', '垫江县', '239', '0');
INSERT INTO `common_city_zone` VALUES ('2243', '500232', '武隆县', '239', '0');
INSERT INTO `common_city_zone` VALUES ('2244', '500233', '忠　县', '239', '0');
INSERT INTO `common_city_zone` VALUES ('2245', '500234', '开　县', '239', '0');
INSERT INTO `common_city_zone` VALUES ('2246', '500235', '云阳县', '239', '0');
INSERT INTO `common_city_zone` VALUES ('2247', '500236', '奉节县', '239', '0');
INSERT INTO `common_city_zone` VALUES ('2248', '500237', '巫山县', '239', '0');
INSERT INTO `common_city_zone` VALUES ('2249', '500238', '巫溪县', '239', '0');
INSERT INTO `common_city_zone` VALUES ('2250', '500240', '石柱土家族自治县', '239', '0');
INSERT INTO `common_city_zone` VALUES ('2251', '500241', '秀山土家族苗族自治县', '239', '0');
INSERT INTO `common_city_zone` VALUES ('2252', '500242', '酉阳土家族苗族自治县', '239', '0');
INSERT INTO `common_city_zone` VALUES ('2253', '500243', '彭水苗族土家族自治县', '239', '0');
INSERT INTO `common_city_zone` VALUES ('2254', '500381', '江津市', '240', '0');
INSERT INTO `common_city_zone` VALUES ('2255', '500382', '合川市', '240', '0');
INSERT INTO `common_city_zone` VALUES ('2256', '500383', '永川市', '240', '0');
INSERT INTO `common_city_zone` VALUES ('2257', '500384', '南川市', '240', '0');
INSERT INTO `common_city_zone` VALUES ('2258', '510101', '市辖区', '241', '0');
INSERT INTO `common_city_zone` VALUES ('2259', '510104', '锦江区', '241', '0');
INSERT INTO `common_city_zone` VALUES ('2260', '510105', '青羊区', '241', '0');
INSERT INTO `common_city_zone` VALUES ('2261', '510106', '金牛区', '241', '0');
INSERT INTO `common_city_zone` VALUES ('2262', '510107', '武侯区', '241', '0');
INSERT INTO `common_city_zone` VALUES ('2263', '510108', '成华区', '241', '0');
INSERT INTO `common_city_zone` VALUES ('2264', '510112', '龙泉驿区', '241', '0');
INSERT INTO `common_city_zone` VALUES ('2265', '510113', '青白江区', '241', '0');
INSERT INTO `common_city_zone` VALUES ('2266', '510114', '新都区', '241', '0');
INSERT INTO `common_city_zone` VALUES ('2267', '510115', '温江区', '241', '0');
INSERT INTO `common_city_zone` VALUES ('2268', '510121', '金堂县', '241', '0');
INSERT INTO `common_city_zone` VALUES ('2269', '510122', '双流县', '241', '0');
INSERT INTO `common_city_zone` VALUES ('2270', '510124', '郫　县', '241', '0');
INSERT INTO `common_city_zone` VALUES ('2271', '510129', '大邑县', '241', '0');
INSERT INTO `common_city_zone` VALUES ('2272', '510131', '蒲江县', '241', '0');
INSERT INTO `common_city_zone` VALUES ('2273', '510132', '新津县', '241', '0');
INSERT INTO `common_city_zone` VALUES ('2274', '510181', '都江堰市', '241', '0');
INSERT INTO `common_city_zone` VALUES ('2275', '510182', '彭州市', '241', '0');
INSERT INTO `common_city_zone` VALUES ('2276', '510183', '邛崃市', '241', '0');
INSERT INTO `common_city_zone` VALUES ('2277', '510184', '崇州市', '241', '0');
INSERT INTO `common_city_zone` VALUES ('2278', '510301', '市辖区', '242', '0');
INSERT INTO `common_city_zone` VALUES ('2279', '510302', '自流井区', '242', '0');
INSERT INTO `common_city_zone` VALUES ('2280', '510303', '贡井区', '242', '0');
INSERT INTO `common_city_zone` VALUES ('2281', '510304', '大安区', '242', '0');
INSERT INTO `common_city_zone` VALUES ('2282', '510311', '沿滩区', '242', '0');
INSERT INTO `common_city_zone` VALUES ('2283', '510321', '荣　县', '242', '0');
INSERT INTO `common_city_zone` VALUES ('2284', '510322', '富顺县', '242', '0');
INSERT INTO `common_city_zone` VALUES ('2285', '510401', '市辖区', '243', '0');
INSERT INTO `common_city_zone` VALUES ('2286', '510402', '东　区', '243', '0');
INSERT INTO `common_city_zone` VALUES ('2287', '510403', '西　区', '243', '0');
INSERT INTO `common_city_zone` VALUES ('2288', '510411', '仁和区', '243', '0');
INSERT INTO `common_city_zone` VALUES ('2289', '510421', '米易县', '243', '0');
INSERT INTO `common_city_zone` VALUES ('2290', '510422', '盐边县', '243', '0');
INSERT INTO `common_city_zone` VALUES ('2291', '510501', '市辖区', '244', '0');
INSERT INTO `common_city_zone` VALUES ('2292', '510502', '江阳区', '244', '0');
INSERT INTO `common_city_zone` VALUES ('2293', '510503', '纳溪区', '244', '0');
INSERT INTO `common_city_zone` VALUES ('2294', '510504', '龙马潭区', '244', '0');
INSERT INTO `common_city_zone` VALUES ('2295', '510521', '泸　县', '244', '0');
INSERT INTO `common_city_zone` VALUES ('2296', '510522', '合江县', '244', '0');
INSERT INTO `common_city_zone` VALUES ('2297', '510524', '叙永县', '244', '0');
INSERT INTO `common_city_zone` VALUES ('2298', '510525', '古蔺县', '244', '0');
INSERT INTO `common_city_zone` VALUES ('2299', '510601', '市辖区', '245', '0');
INSERT INTO `common_city_zone` VALUES ('2300', '510603', '旌阳区', '245', '0');
INSERT INTO `common_city_zone` VALUES ('2301', '510623', '中江县', '245', '0');
INSERT INTO `common_city_zone` VALUES ('2302', '510626', '罗江县', '245', '0');
INSERT INTO `common_city_zone` VALUES ('2303', '510681', '广汉市', '245', '0');
INSERT INTO `common_city_zone` VALUES ('2304', '510682', '什邡市', '245', '0');
INSERT INTO `common_city_zone` VALUES ('2305', '510683', '绵竹市', '245', '0');
INSERT INTO `common_city_zone` VALUES ('2306', '510701', '市辖区', '246', '0');
INSERT INTO `common_city_zone` VALUES ('2307', '510703', '涪城区', '246', '0');
INSERT INTO `common_city_zone` VALUES ('2308', '510704', '游仙区', '246', '0');
INSERT INTO `common_city_zone` VALUES ('2309', '510722', '三台县', '246', '0');
INSERT INTO `common_city_zone` VALUES ('2310', '510723', '盐亭县', '246', '0');
INSERT INTO `common_city_zone` VALUES ('2311', '510724', '安　县', '246', '0');
INSERT INTO `common_city_zone` VALUES ('2312', '510725', '梓潼县', '246', '0');
INSERT INTO `common_city_zone` VALUES ('2313', '510726', '北川羌族自治县', '246', '0');
INSERT INTO `common_city_zone` VALUES ('2314', '510727', '平武县', '246', '0');
INSERT INTO `common_city_zone` VALUES ('2315', '510781', '江油市', '246', '0');
INSERT INTO `common_city_zone` VALUES ('2316', '510801', '市辖区', '247', '0');
INSERT INTO `common_city_zone` VALUES ('2317', '510802', '市中区', '247', '0');
INSERT INTO `common_city_zone` VALUES ('2318', '510811', '元坝区', '247', '0');
INSERT INTO `common_city_zone` VALUES ('2319', '510812', '朝天区', '247', '0');
INSERT INTO `common_city_zone` VALUES ('2320', '510821', '旺苍县', '247', '0');
INSERT INTO `common_city_zone` VALUES ('2321', '510822', '青川县', '247', '0');
INSERT INTO `common_city_zone` VALUES ('2322', '510823', '剑阁县', '247', '0');
INSERT INTO `common_city_zone` VALUES ('2323', '510824', '苍溪县', '247', '0');
INSERT INTO `common_city_zone` VALUES ('2324', '510901', '市辖区', '248', '0');
INSERT INTO `common_city_zone` VALUES ('2325', '510903', '船山区', '248', '0');
INSERT INTO `common_city_zone` VALUES ('2326', '510904', '安居区', '248', '0');
INSERT INTO `common_city_zone` VALUES ('2327', '510921', '蓬溪县', '248', '0');
INSERT INTO `common_city_zone` VALUES ('2328', '510922', '射洪县', '248', '0');
INSERT INTO `common_city_zone` VALUES ('2329', '510923', '大英县', '248', '0');
INSERT INTO `common_city_zone` VALUES ('2330', '511001', '市辖区', '249', '0');
INSERT INTO `common_city_zone` VALUES ('2331', '511002', '市中区', '249', '0');
INSERT INTO `common_city_zone` VALUES ('2332', '511011', '东兴区', '249', '0');
INSERT INTO `common_city_zone` VALUES ('2333', '511024', '威远县', '249', '0');
INSERT INTO `common_city_zone` VALUES ('2334', '511025', '资中县', '249', '0');
INSERT INTO `common_city_zone` VALUES ('2335', '511028', '隆昌县', '249', '0');
INSERT INTO `common_city_zone` VALUES ('2336', '511101', '市辖区', '250', '0');
INSERT INTO `common_city_zone` VALUES ('2337', '511102', '市中区', '250', '0');
INSERT INTO `common_city_zone` VALUES ('2338', '511111', '沙湾区', '250', '0');
INSERT INTO `common_city_zone` VALUES ('2339', '511112', '五通桥区', '250', '0');
INSERT INTO `common_city_zone` VALUES ('2340', '511113', '金口河区', '250', '0');
INSERT INTO `common_city_zone` VALUES ('2341', '511123', '犍为县', '250', '0');
INSERT INTO `common_city_zone` VALUES ('2342', '511124', '井研县', '250', '0');
INSERT INTO `common_city_zone` VALUES ('2343', '511126', '夹江县', '250', '0');
INSERT INTO `common_city_zone` VALUES ('2344', '511129', '沐川县', '250', '0');
INSERT INTO `common_city_zone` VALUES ('2345', '511132', '峨边彝族自治县', '250', '0');
INSERT INTO `common_city_zone` VALUES ('2346', '511133', '马边彝族自治县', '250', '0');
INSERT INTO `common_city_zone` VALUES ('2347', '511181', '峨眉山市', '250', '0');
INSERT INTO `common_city_zone` VALUES ('2348', '511301', '市辖区', '251', '0');
INSERT INTO `common_city_zone` VALUES ('2349', '511302', '顺庆区', '251', '0');
INSERT INTO `common_city_zone` VALUES ('2350', '511303', '高坪区', '251', '0');
INSERT INTO `common_city_zone` VALUES ('2351', '511304', '嘉陵区', '251', '0');
INSERT INTO `common_city_zone` VALUES ('2352', '511321', '南部县', '251', '0');
INSERT INTO `common_city_zone` VALUES ('2353', '511322', '营山县', '251', '0');
INSERT INTO `common_city_zone` VALUES ('2354', '511323', '蓬安县', '251', '0');
INSERT INTO `common_city_zone` VALUES ('2355', '511324', '仪陇县', '251', '0');
INSERT INTO `common_city_zone` VALUES ('2356', '511325', '西充县', '251', '0');
INSERT INTO `common_city_zone` VALUES ('2357', '511381', '阆中市', '251', '0');
INSERT INTO `common_city_zone` VALUES ('2358', '511401', '市辖区', '252', '0');
INSERT INTO `common_city_zone` VALUES ('2359', '511402', '东坡区', '252', '0');
INSERT INTO `common_city_zone` VALUES ('2360', '511421', '仁寿县', '252', '0');
INSERT INTO `common_city_zone` VALUES ('2361', '511422', '彭山县', '252', '0');
INSERT INTO `common_city_zone` VALUES ('2362', '511423', '洪雅县', '252', '0');
INSERT INTO `common_city_zone` VALUES ('2363', '511424', '丹棱县', '252', '0');
INSERT INTO `common_city_zone` VALUES ('2364', '511425', '青神县', '252', '0');
INSERT INTO `common_city_zone` VALUES ('2365', '511501', '市辖区', '253', '0');
INSERT INTO `common_city_zone` VALUES ('2366', '511502', '翠屏区', '253', '0');
INSERT INTO `common_city_zone` VALUES ('2367', '511521', '宜宾县', '253', '0');
INSERT INTO `common_city_zone` VALUES ('2368', '511522', '南溪县', '253', '0');
INSERT INTO `common_city_zone` VALUES ('2369', '511523', '江安县', '253', '0');
INSERT INTO `common_city_zone` VALUES ('2370', '511524', '长宁县', '253', '0');
INSERT INTO `common_city_zone` VALUES ('2371', '511525', '高　县', '253', '0');
INSERT INTO `common_city_zone` VALUES ('2372', '511526', '珙　县', '253', '0');
INSERT INTO `common_city_zone` VALUES ('2373', '511527', '筠连县', '253', '0');
INSERT INTO `common_city_zone` VALUES ('2374', '511528', '兴文县', '253', '0');
INSERT INTO `common_city_zone` VALUES ('2375', '511529', '屏山县', '253', '0');
INSERT INTO `common_city_zone` VALUES ('2376', '511601', '市辖区', '254', '0');
INSERT INTO `common_city_zone` VALUES ('2377', '511602', '广安区', '254', '0');
INSERT INTO `common_city_zone` VALUES ('2378', '511621', '岳池县', '254', '0');
INSERT INTO `common_city_zone` VALUES ('2379', '511622', '武胜县', '254', '0');
INSERT INTO `common_city_zone` VALUES ('2380', '511623', '邻水县', '254', '0');
INSERT INTO `common_city_zone` VALUES ('2381', '511681', '华莹市', '254', '0');
INSERT INTO `common_city_zone` VALUES ('2382', '511701', '市辖区', '255', '0');
INSERT INTO `common_city_zone` VALUES ('2383', '511702', '通川区', '255', '0');
INSERT INTO `common_city_zone` VALUES ('2384', '511721', '达　县', '255', '0');
INSERT INTO `common_city_zone` VALUES ('2385', '511722', '宣汉县', '255', '0');
INSERT INTO `common_city_zone` VALUES ('2386', '511723', '开江县', '255', '0');
INSERT INTO `common_city_zone` VALUES ('2387', '511724', '大竹县', '255', '0');
INSERT INTO `common_city_zone` VALUES ('2388', '511725', '渠　县', '255', '0');
INSERT INTO `common_city_zone` VALUES ('2389', '511781', '万源市', '255', '0');
INSERT INTO `common_city_zone` VALUES ('2390', '511801', '市辖区', '256', '0');
INSERT INTO `common_city_zone` VALUES ('2391', '511802', '雨城区', '256', '0');
INSERT INTO `common_city_zone` VALUES ('2392', '511821', '名山县', '256', '0');
INSERT INTO `common_city_zone` VALUES ('2393', '511822', '荥经县', '256', '0');
INSERT INTO `common_city_zone` VALUES ('2394', '511823', '汉源县', '256', '0');
INSERT INTO `common_city_zone` VALUES ('2395', '511824', '石棉县', '256', '0');
INSERT INTO `common_city_zone` VALUES ('2396', '511825', '天全县', '256', '0');
INSERT INTO `common_city_zone` VALUES ('2397', '511826', '芦山县', '256', '0');
INSERT INTO `common_city_zone` VALUES ('2398', '511827', '宝兴县', '256', '0');
INSERT INTO `common_city_zone` VALUES ('2399', '511901', '市辖区', '257', '0');
INSERT INTO `common_city_zone` VALUES ('2400', '511902', '巴州区', '257', '0');
INSERT INTO `common_city_zone` VALUES ('2401', '511921', '通江县', '257', '0');
INSERT INTO `common_city_zone` VALUES ('2402', '511922', '南江县', '257', '0');
INSERT INTO `common_city_zone` VALUES ('2403', '511923', '平昌县', '257', '0');
INSERT INTO `common_city_zone` VALUES ('2404', '512001', '市辖区', '258', '0');
INSERT INTO `common_city_zone` VALUES ('2405', '512002', '雁江区', '258', '0');
INSERT INTO `common_city_zone` VALUES ('2406', '512021', '安岳县', '258', '0');
INSERT INTO `common_city_zone` VALUES ('2407', '512022', '乐至县', '258', '0');
INSERT INTO `common_city_zone` VALUES ('2408', '512081', '简阳市', '258', '0');
INSERT INTO `common_city_zone` VALUES ('2409', '513221', '汶川县', '259', '0');
INSERT INTO `common_city_zone` VALUES ('2410', '513222', '理　县', '259', '0');
INSERT INTO `common_city_zone` VALUES ('2411', '513223', '茂　县', '259', '0');
INSERT INTO `common_city_zone` VALUES ('2412', '513224', '松潘县', '259', '0');
INSERT INTO `common_city_zone` VALUES ('2413', '513225', '九寨沟县', '259', '0');
INSERT INTO `common_city_zone` VALUES ('2414', '513226', '金川县', '259', '0');
INSERT INTO `common_city_zone` VALUES ('2415', '513227', '小金县', '259', '0');
INSERT INTO `common_city_zone` VALUES ('2416', '513228', '黑水县', '259', '0');
INSERT INTO `common_city_zone` VALUES ('2417', '513229', '马尔康县', '259', '0');
INSERT INTO `common_city_zone` VALUES ('2418', '513230', '壤塘县', '259', '0');
INSERT INTO `common_city_zone` VALUES ('2419', '513231', '阿坝县', '259', '0');
INSERT INTO `common_city_zone` VALUES ('2420', '513232', '若尔盖县', '259', '0');
INSERT INTO `common_city_zone` VALUES ('2421', '513233', '红原县', '259', '0');
INSERT INTO `common_city_zone` VALUES ('2422', '513321', '康定县', '260', '0');
INSERT INTO `common_city_zone` VALUES ('2423', '513322', '泸定县', '260', '0');
INSERT INTO `common_city_zone` VALUES ('2424', '513323', '丹巴县', '260', '0');
INSERT INTO `common_city_zone` VALUES ('2425', '513324', '九龙县', '260', '0');
INSERT INTO `common_city_zone` VALUES ('2426', '513325', '雅江县', '260', '0');
INSERT INTO `common_city_zone` VALUES ('2427', '513326', '道孚县', '260', '0');
INSERT INTO `common_city_zone` VALUES ('2428', '513327', '炉霍县', '260', '0');
INSERT INTO `common_city_zone` VALUES ('2429', '513328', '甘孜县', '260', '0');
INSERT INTO `common_city_zone` VALUES ('2430', '513329', '新龙县', '260', '0');
INSERT INTO `common_city_zone` VALUES ('2431', '513330', '德格县', '260', '0');
INSERT INTO `common_city_zone` VALUES ('2432', '513331', '白玉县', '260', '0');
INSERT INTO `common_city_zone` VALUES ('2433', '513332', '石渠县', '260', '0');
INSERT INTO `common_city_zone` VALUES ('2434', '513333', '色达县', '260', '0');
INSERT INTO `common_city_zone` VALUES ('2435', '513334', '理塘县', '260', '0');
INSERT INTO `common_city_zone` VALUES ('2436', '513335', '巴塘县', '260', '0');
INSERT INTO `common_city_zone` VALUES ('2437', '513336', '乡城县', '260', '0');
INSERT INTO `common_city_zone` VALUES ('2438', '513337', '稻城县', '260', '0');
INSERT INTO `common_city_zone` VALUES ('2439', '513338', '得荣县', '260', '0');
INSERT INTO `common_city_zone` VALUES ('2440', '513401', '西昌市', '261', '0');
INSERT INTO `common_city_zone` VALUES ('2441', '513422', '木里藏族自治县', '261', '0');
INSERT INTO `common_city_zone` VALUES ('2442', '513423', '盐源县', '261', '0');
INSERT INTO `common_city_zone` VALUES ('2443', '513424', '德昌县', '261', '0');
INSERT INTO `common_city_zone` VALUES ('2444', '513425', '会理县', '261', '0');
INSERT INTO `common_city_zone` VALUES ('2445', '513426', '会东县', '261', '0');
INSERT INTO `common_city_zone` VALUES ('2446', '513427', '宁南县', '261', '0');
INSERT INTO `common_city_zone` VALUES ('2447', '513428', '普格县', '261', '0');
INSERT INTO `common_city_zone` VALUES ('2448', '513429', '布拖县', '261', '0');
INSERT INTO `common_city_zone` VALUES ('2449', '513430', '金阳县', '261', '0');
INSERT INTO `common_city_zone` VALUES ('2450', '513431', '昭觉县', '261', '0');
INSERT INTO `common_city_zone` VALUES ('2451', '513432', '喜德县', '261', '0');
INSERT INTO `common_city_zone` VALUES ('2452', '513433', '冕宁县', '261', '0');
INSERT INTO `common_city_zone` VALUES ('2453', '513434', '越西县', '261', '0');
INSERT INTO `common_city_zone` VALUES ('2454', '513435', '甘洛县', '261', '0');
INSERT INTO `common_city_zone` VALUES ('2455', '513436', '美姑县', '261', '0');
INSERT INTO `common_city_zone` VALUES ('2456', '513437', '雷波县', '261', '0');
INSERT INTO `common_city_zone` VALUES ('2457', '520101', '市辖区', '262', '0');
INSERT INTO `common_city_zone` VALUES ('2458', '520102', '南明区', '262', '0');
INSERT INTO `common_city_zone` VALUES ('2459', '520103', '云岩区', '262', '0');
INSERT INTO `common_city_zone` VALUES ('2460', '520111', '花溪区', '262', '0');
INSERT INTO `common_city_zone` VALUES ('2461', '520112', '乌当区', '262', '0');
INSERT INTO `common_city_zone` VALUES ('2462', '520113', '白云区', '262', '0');
INSERT INTO `common_city_zone` VALUES ('2463', '520114', '小河区', '262', '0');
INSERT INTO `common_city_zone` VALUES ('2464', '520121', '开阳县', '262', '0');
INSERT INTO `common_city_zone` VALUES ('2465', '520122', '息烽县', '262', '0');
INSERT INTO `common_city_zone` VALUES ('2466', '520123', '修文县', '262', '0');
INSERT INTO `common_city_zone` VALUES ('2467', '520181', '清镇市', '262', '0');
INSERT INTO `common_city_zone` VALUES ('2468', '520201', '钟山区', '263', '0');
INSERT INTO `common_city_zone` VALUES ('2469', '520203', '六枝特区', '263', '0');
INSERT INTO `common_city_zone` VALUES ('2470', '520221', '水城县', '263', '0');
INSERT INTO `common_city_zone` VALUES ('2471', '520222', '盘　县', '263', '0');
INSERT INTO `common_city_zone` VALUES ('2472', '520301', '市辖区', '264', '0');
INSERT INTO `common_city_zone` VALUES ('2473', '520302', '红花岗区', '264', '0');
INSERT INTO `common_city_zone` VALUES ('2474', '520303', '汇川区', '264', '0');
INSERT INTO `common_city_zone` VALUES ('2475', '520321', '遵义县', '264', '0');
INSERT INTO `common_city_zone` VALUES ('2476', '520322', '桐梓县', '264', '0');
INSERT INTO `common_city_zone` VALUES ('2477', '520323', '绥阳县', '264', '0');
INSERT INTO `common_city_zone` VALUES ('2478', '520324', '正安县', '264', '0');
INSERT INTO `common_city_zone` VALUES ('2479', '520325', '道真仡佬族苗族自治县', '264', '0');
INSERT INTO `common_city_zone` VALUES ('2480', '520326', '务川仡佬族苗族自治县', '264', '0');
INSERT INTO `common_city_zone` VALUES ('2481', '520327', '凤冈县', '264', '0');
INSERT INTO `common_city_zone` VALUES ('2482', '520328', '湄潭县', '264', '0');
INSERT INTO `common_city_zone` VALUES ('2483', '520329', '余庆县', '264', '0');
INSERT INTO `common_city_zone` VALUES ('2484', '520330', '习水县', '264', '0');
INSERT INTO `common_city_zone` VALUES ('2485', '520381', '赤水市', '264', '0');
INSERT INTO `common_city_zone` VALUES ('2486', '520382', '仁怀市', '264', '0');
INSERT INTO `common_city_zone` VALUES ('2487', '520401', '市辖区', '265', '0');
INSERT INTO `common_city_zone` VALUES ('2488', '520402', '西秀区', '265', '0');
INSERT INTO `common_city_zone` VALUES ('2489', '520421', '平坝县', '265', '0');
INSERT INTO `common_city_zone` VALUES ('2490', '520422', '普定县', '265', '0');
INSERT INTO `common_city_zone` VALUES ('2491', '520423', '镇宁布依族苗族自治县', '265', '0');
INSERT INTO `common_city_zone` VALUES ('2492', '520424', '关岭布依族苗族自治县', '265', '0');
INSERT INTO `common_city_zone` VALUES ('2493', '520425', '紫云苗族布依族自治县', '265', '0');
INSERT INTO `common_city_zone` VALUES ('2494', '522201', '铜仁市', '266', '0');
INSERT INTO `common_city_zone` VALUES ('2495', '522222', '江口县', '266', '0');
INSERT INTO `common_city_zone` VALUES ('2496', '522223', '玉屏侗族自治县', '266', '0');
INSERT INTO `common_city_zone` VALUES ('2497', '522224', '石阡县', '266', '0');
INSERT INTO `common_city_zone` VALUES ('2498', '522225', '思南县', '266', '0');
INSERT INTO `common_city_zone` VALUES ('2499', '522226', '印江土家族苗族自治县', '266', '0');
INSERT INTO `common_city_zone` VALUES ('2500', '522227', '德江县', '266', '0');
INSERT INTO `common_city_zone` VALUES ('2501', '522228', '沿河土家族自治县', '266', '0');
INSERT INTO `common_city_zone` VALUES ('2502', '522229', '松桃苗族自治县', '266', '0');
INSERT INTO `common_city_zone` VALUES ('2503', '522230', '万山特区', '266', '0');
INSERT INTO `common_city_zone` VALUES ('2504', '522301', '兴义市', '267', '0');
INSERT INTO `common_city_zone` VALUES ('2505', '522322', '兴仁县', '267', '0');
INSERT INTO `common_city_zone` VALUES ('2506', '522323', '普安县', '267', '0');
INSERT INTO `common_city_zone` VALUES ('2507', '522324', '晴隆县', '267', '0');
INSERT INTO `common_city_zone` VALUES ('2508', '522325', '贞丰县', '267', '0');
INSERT INTO `common_city_zone` VALUES ('2509', '522326', '望谟县', '267', '0');
INSERT INTO `common_city_zone` VALUES ('2510', '522327', '册亨县', '267', '0');
INSERT INTO `common_city_zone` VALUES ('2511', '522328', '安龙县', '267', '0');
INSERT INTO `common_city_zone` VALUES ('2512', '522401', '毕节市', '268', '0');
INSERT INTO `common_city_zone` VALUES ('2513', '522422', '大方县', '268', '0');
INSERT INTO `common_city_zone` VALUES ('2514', '522423', '黔西县', '268', '0');
INSERT INTO `common_city_zone` VALUES ('2515', '522424', '金沙县', '268', '0');
INSERT INTO `common_city_zone` VALUES ('2516', '522425', '织金县', '268', '0');
INSERT INTO `common_city_zone` VALUES ('2517', '522426', '纳雍县', '268', '0');
INSERT INTO `common_city_zone` VALUES ('2518', '522427', '威宁彝族回族苗族自治县', '268', '0');
INSERT INTO `common_city_zone` VALUES ('2519', '522428', '赫章县', '268', '0');
INSERT INTO `common_city_zone` VALUES ('2520', '522601', '凯里市', '269', '0');
INSERT INTO `common_city_zone` VALUES ('2521', '522622', '黄平县', '269', '0');
INSERT INTO `common_city_zone` VALUES ('2522', '522623', '施秉县', '269', '0');
INSERT INTO `common_city_zone` VALUES ('2523', '522624', '三穗县', '269', '0');
INSERT INTO `common_city_zone` VALUES ('2524', '522625', '镇远县', '269', '0');
INSERT INTO `common_city_zone` VALUES ('2525', '522626', '岑巩县', '269', '0');
INSERT INTO `common_city_zone` VALUES ('2526', '522627', '天柱县', '269', '0');
INSERT INTO `common_city_zone` VALUES ('2527', '522628', '锦屏县', '269', '0');
INSERT INTO `common_city_zone` VALUES ('2528', '522629', '剑河县', '269', '0');
INSERT INTO `common_city_zone` VALUES ('2529', '522630', '台江县', '269', '0');
INSERT INTO `common_city_zone` VALUES ('2530', '522631', '黎平县', '269', '0');
INSERT INTO `common_city_zone` VALUES ('2531', '522632', '榕江县', '269', '0');
INSERT INTO `common_city_zone` VALUES ('2532', '522633', '从江县', '269', '0');
INSERT INTO `common_city_zone` VALUES ('2533', '522634', '雷山县', '269', '0');
INSERT INTO `common_city_zone` VALUES ('2534', '522635', '麻江县', '269', '0');
INSERT INTO `common_city_zone` VALUES ('2535', '522636', '丹寨县', '269', '0');
INSERT INTO `common_city_zone` VALUES ('2536', '522701', '都匀市', '270', '0');
INSERT INTO `common_city_zone` VALUES ('2537', '522702', '福泉市', '270', '0');
INSERT INTO `common_city_zone` VALUES ('2538', '522722', '荔波县', '270', '0');
INSERT INTO `common_city_zone` VALUES ('2539', '522723', '贵定县', '270', '0');
INSERT INTO `common_city_zone` VALUES ('2540', '522725', '瓮安县', '270', '0');
INSERT INTO `common_city_zone` VALUES ('2541', '522726', '独山县', '270', '0');
INSERT INTO `common_city_zone` VALUES ('2542', '522727', '平塘县', '270', '0');
INSERT INTO `common_city_zone` VALUES ('2543', '522728', '罗甸县', '270', '0');
INSERT INTO `common_city_zone` VALUES ('2544', '522729', '长顺县', '270', '0');
INSERT INTO `common_city_zone` VALUES ('2545', '522730', '龙里县', '270', '0');
INSERT INTO `common_city_zone` VALUES ('2546', '522731', '惠水县', '270', '0');
INSERT INTO `common_city_zone` VALUES ('2547', '522732', '三都水族自治县', '270', '0');
INSERT INTO `common_city_zone` VALUES ('2548', '530101', '市辖区', '271', '0');
INSERT INTO `common_city_zone` VALUES ('2549', '530102', '五华区', '271', '0');
INSERT INTO `common_city_zone` VALUES ('2550', '530103', '盘龙区', '271', '0');
INSERT INTO `common_city_zone` VALUES ('2551', '530111', '官渡区', '271', '0');
INSERT INTO `common_city_zone` VALUES ('2552', '530112', '西山区', '271', '0');
INSERT INTO `common_city_zone` VALUES ('2553', '530113', '东川区', '271', '0');
INSERT INTO `common_city_zone` VALUES ('2554', '530121', '呈贡县', '271', '0');
INSERT INTO `common_city_zone` VALUES ('2555', '530122', '晋宁县', '271', '0');
INSERT INTO `common_city_zone` VALUES ('2556', '530124', '富民县', '271', '0');
INSERT INTO `common_city_zone` VALUES ('2557', '530125', '宜良县', '271', '0');
INSERT INTO `common_city_zone` VALUES ('2558', '530126', '石林彝族自治县', '271', '0');
INSERT INTO `common_city_zone` VALUES ('2559', '530127', '嵩明县', '271', '0');
INSERT INTO `common_city_zone` VALUES ('2560', '530128', '禄劝彝族苗族自治县', '271', '0');
INSERT INTO `common_city_zone` VALUES ('2561', '530129', '寻甸回族彝族自治县', '271', '0');
INSERT INTO `common_city_zone` VALUES ('2562', '530181', '安宁市', '271', '0');
INSERT INTO `common_city_zone` VALUES ('2563', '530301', '市辖区', '272', '0');
INSERT INTO `common_city_zone` VALUES ('2564', '530302', '麒麟区', '272', '0');
INSERT INTO `common_city_zone` VALUES ('2565', '530321', '马龙县', '272', '0');
INSERT INTO `common_city_zone` VALUES ('2566', '530322', '陆良县', '272', '0');
INSERT INTO `common_city_zone` VALUES ('2567', '530323', '师宗县', '272', '0');
INSERT INTO `common_city_zone` VALUES ('2568', '530324', '罗平县', '272', '0');
INSERT INTO `common_city_zone` VALUES ('2569', '530325', '富源县', '272', '0');
INSERT INTO `common_city_zone` VALUES ('2570', '530326', '会泽县', '272', '0');
INSERT INTO `common_city_zone` VALUES ('2571', '530328', '沾益县', '272', '0');
INSERT INTO `common_city_zone` VALUES ('2572', '530381', '宣威市', '272', '0');
INSERT INTO `common_city_zone` VALUES ('2573', '530401', '市辖区', '273', '0');
INSERT INTO `common_city_zone` VALUES ('2574', '530402', '红塔区', '273', '0');
INSERT INTO `common_city_zone` VALUES ('2575', '530421', '江川县', '273', '0');
INSERT INTO `common_city_zone` VALUES ('2576', '530422', '澄江县', '273', '0');
INSERT INTO `common_city_zone` VALUES ('2577', '530423', '通海县', '273', '0');
INSERT INTO `common_city_zone` VALUES ('2578', '530424', '华宁县', '273', '0');
INSERT INTO `common_city_zone` VALUES ('2579', '530425', '易门县', '273', '0');
INSERT INTO `common_city_zone` VALUES ('2580', '530426', '峨山彝族自治县', '273', '0');
INSERT INTO `common_city_zone` VALUES ('2581', '530427', '新平彝族傣族自治县', '273', '0');
INSERT INTO `common_city_zone` VALUES ('2582', '530428', '元江哈尼族彝族傣族自治县', '273', '0');
INSERT INTO `common_city_zone` VALUES ('2583', '530501', '市辖区', '274', '0');
INSERT INTO `common_city_zone` VALUES ('2584', '530502', '隆阳区', '274', '0');
INSERT INTO `common_city_zone` VALUES ('2585', '530521', '施甸县', '274', '0');
INSERT INTO `common_city_zone` VALUES ('2586', '530522', '腾冲县', '274', '0');
INSERT INTO `common_city_zone` VALUES ('2587', '530523', '龙陵县', '274', '0');
INSERT INTO `common_city_zone` VALUES ('2588', '530524', '昌宁县', '274', '0');
INSERT INTO `common_city_zone` VALUES ('2589', '530601', '市辖区', '275', '0');
INSERT INTO `common_city_zone` VALUES ('2590', '530602', '昭阳区', '275', '0');
INSERT INTO `common_city_zone` VALUES ('2591', '530621', '鲁甸县', '275', '0');
INSERT INTO `common_city_zone` VALUES ('2592', '530622', '巧家县', '275', '0');
INSERT INTO `common_city_zone` VALUES ('2593', '530623', '盐津县', '275', '0');
INSERT INTO `common_city_zone` VALUES ('2594', '530624', '大关县', '275', '0');
INSERT INTO `common_city_zone` VALUES ('2595', '530625', '永善县', '275', '0');
INSERT INTO `common_city_zone` VALUES ('2596', '530626', '绥江县', '275', '0');
INSERT INTO `common_city_zone` VALUES ('2597', '530627', '镇雄县', '275', '0');
INSERT INTO `common_city_zone` VALUES ('2598', '530628', '彝良县', '275', '0');
INSERT INTO `common_city_zone` VALUES ('2599', '530629', '威信县', '275', '0');
INSERT INTO `common_city_zone` VALUES ('2600', '530630', '水富县', '275', '0');
INSERT INTO `common_city_zone` VALUES ('2601', '530701', '市辖区', '276', '0');
INSERT INTO `common_city_zone` VALUES ('2602', '530702', '古城区', '276', '0');
INSERT INTO `common_city_zone` VALUES ('2603', '530721', '玉龙纳西族自治县', '276', '0');
INSERT INTO `common_city_zone` VALUES ('2604', '530722', '永胜县', '276', '0');
INSERT INTO `common_city_zone` VALUES ('2605', '530723', '华坪县', '276', '0');
INSERT INTO `common_city_zone` VALUES ('2606', '530724', '宁蒗彝族自治县', '276', '0');
INSERT INTO `common_city_zone` VALUES ('2607', '530801', '市辖区', '277', '0');
INSERT INTO `common_city_zone` VALUES ('2608', '530802', '翠云区', '277', '0');
INSERT INTO `common_city_zone` VALUES ('2609', '530821', '普洱哈尼族彝族自治县', '277', '0');
INSERT INTO `common_city_zone` VALUES ('2610', '530822', '墨江哈尼族自治县', '277', '0');
INSERT INTO `common_city_zone` VALUES ('2611', '530823', '景东彝族自治县', '277', '0');
INSERT INTO `common_city_zone` VALUES ('2612', '530824', '景谷傣族彝族自治县', '277', '0');
INSERT INTO `common_city_zone` VALUES ('2613', '530825', '镇沅彝族哈尼族拉祜族自治县', '277', '0');
INSERT INTO `common_city_zone` VALUES ('2614', '530826', '江城哈尼族彝族自治县', '277', '0');
INSERT INTO `common_city_zone` VALUES ('2615', '530827', '孟连傣族拉祜族佤族自治县', '277', '0');
INSERT INTO `common_city_zone` VALUES ('2616', '530828', '澜沧拉祜族自治县', '277', '0');
INSERT INTO `common_city_zone` VALUES ('2617', '530829', '西盟佤族自治县', '277', '0');
INSERT INTO `common_city_zone` VALUES ('2618', '530901', '市辖区', '278', '0');
INSERT INTO `common_city_zone` VALUES ('2619', '530902', '临翔区', '278', '0');
INSERT INTO `common_city_zone` VALUES ('2620', '530921', '凤庆县', '278', '0');
INSERT INTO `common_city_zone` VALUES ('2621', '530922', '云　县', '278', '0');
INSERT INTO `common_city_zone` VALUES ('2622', '530923', '永德县', '278', '0');
INSERT INTO `common_city_zone` VALUES ('2623', '530924', '镇康县', '278', '0');
INSERT INTO `common_city_zone` VALUES ('2624', '530925', '双江拉祜族佤族布朗族傣族自治县', '278', '0');
INSERT INTO `common_city_zone` VALUES ('2625', '530926', '耿马傣族佤族自治县', '278', '0');
INSERT INTO `common_city_zone` VALUES ('2626', '530927', '沧源佤族自治县', '278', '0');
INSERT INTO `common_city_zone` VALUES ('2627', '532301', '楚雄市', '279', '0');
INSERT INTO `common_city_zone` VALUES ('2628', '532322', '双柏县', '279', '0');
INSERT INTO `common_city_zone` VALUES ('2629', '532323', '牟定县', '279', '0');
INSERT INTO `common_city_zone` VALUES ('2630', '532324', '南华县', '279', '0');
INSERT INTO `common_city_zone` VALUES ('2631', '532325', '姚安县', '279', '0');
INSERT INTO `common_city_zone` VALUES ('2632', '532326', '大姚县', '279', '0');
INSERT INTO `common_city_zone` VALUES ('2633', '532327', '永仁县', '279', '0');
INSERT INTO `common_city_zone` VALUES ('2634', '532328', '元谋县', '279', '0');
INSERT INTO `common_city_zone` VALUES ('2635', '532329', '武定县', '279', '0');
INSERT INTO `common_city_zone` VALUES ('2636', '532331', '禄丰县', '279', '0');
INSERT INTO `common_city_zone` VALUES ('2637', '532501', '个旧市', '280', '0');
INSERT INTO `common_city_zone` VALUES ('2638', '532502', '开远市', '280', '0');
INSERT INTO `common_city_zone` VALUES ('2639', '532522', '蒙自县', '280', '0');
INSERT INTO `common_city_zone` VALUES ('2640', '532523', '屏边苗族自治县', '280', '0');
INSERT INTO `common_city_zone` VALUES ('2641', '532524', '建水县', '280', '0');
INSERT INTO `common_city_zone` VALUES ('2642', '532525', '石屏县', '280', '0');
INSERT INTO `common_city_zone` VALUES ('2643', '532526', '弥勒县', '280', '0');
INSERT INTO `common_city_zone` VALUES ('2644', '532527', '泸西县', '280', '0');
INSERT INTO `common_city_zone` VALUES ('2645', '532528', '元阳县', '280', '0');
INSERT INTO `common_city_zone` VALUES ('2646', '532529', '红河县', '280', '0');
INSERT INTO `common_city_zone` VALUES ('2647', '532530', '金平苗族瑶族傣族自治县', '280', '0');
INSERT INTO `common_city_zone` VALUES ('2648', '532531', '绿春县', '280', '0');
INSERT INTO `common_city_zone` VALUES ('2649', '532532', '河口瑶族自治县', '280', '0');
INSERT INTO `common_city_zone` VALUES ('2650', '532621', '文山县', '281', '0');
INSERT INTO `common_city_zone` VALUES ('2651', '532622', '砚山县', '281', '0');
INSERT INTO `common_city_zone` VALUES ('2652', '532623', '西畴县', '281', '0');
INSERT INTO `common_city_zone` VALUES ('2653', '532624', '麻栗坡县', '281', '0');
INSERT INTO `common_city_zone` VALUES ('2654', '532625', '马关县', '281', '0');
INSERT INTO `common_city_zone` VALUES ('2655', '532626', '丘北县', '281', '0');
INSERT INTO `common_city_zone` VALUES ('2656', '532627', '广南县', '281', '0');
INSERT INTO `common_city_zone` VALUES ('2657', '532628', '富宁县', '281', '0');
INSERT INTO `common_city_zone` VALUES ('2658', '532801', '景洪市', '282', '0');
INSERT INTO `common_city_zone` VALUES ('2659', '532822', '勐海县', '282', '0');
INSERT INTO `common_city_zone` VALUES ('2660', '532823', '勐腊县', '282', '0');
INSERT INTO `common_city_zone` VALUES ('2661', '532901', '大理市', '283', '0');
INSERT INTO `common_city_zone` VALUES ('2662', '532922', '漾濞彝族自治县', '283', '0');
INSERT INTO `common_city_zone` VALUES ('2663', '532923', '祥云县', '283', '0');
INSERT INTO `common_city_zone` VALUES ('2664', '532924', '宾川县', '283', '0');
INSERT INTO `common_city_zone` VALUES ('2665', '532925', '弥渡县', '283', '0');
INSERT INTO `common_city_zone` VALUES ('2666', '532926', '南涧彝族自治县', '283', '0');
INSERT INTO `common_city_zone` VALUES ('2667', '532927', '巍山彝族回族自治县', '283', '0');
INSERT INTO `common_city_zone` VALUES ('2668', '532928', '永平县', '283', '0');
INSERT INTO `common_city_zone` VALUES ('2669', '532929', '云龙县', '283', '0');
INSERT INTO `common_city_zone` VALUES ('2670', '532930', '洱源县', '283', '0');
INSERT INTO `common_city_zone` VALUES ('2671', '532931', '剑川县', '283', '0');
INSERT INTO `common_city_zone` VALUES ('2672', '532932', '鹤庆县', '283', '0');
INSERT INTO `common_city_zone` VALUES ('2673', '533102', '瑞丽市', '284', '0');
INSERT INTO `common_city_zone` VALUES ('2674', '533103', '潞西市', '284', '0');
INSERT INTO `common_city_zone` VALUES ('2675', '533122', '梁河县', '284', '0');
INSERT INTO `common_city_zone` VALUES ('2676', '533123', '盈江县', '284', '0');
INSERT INTO `common_city_zone` VALUES ('2677', '533124', '陇川县', '284', '0');
INSERT INTO `common_city_zone` VALUES ('2678', '533321', '泸水县', '285', '0');
INSERT INTO `common_city_zone` VALUES ('2679', '533323', '福贡县', '285', '0');
INSERT INTO `common_city_zone` VALUES ('2680', '533324', '贡山独龙族怒族自治县', '285', '0');
INSERT INTO `common_city_zone` VALUES ('2681', '533325', '兰坪白族普米族自治县', '285', '0');
INSERT INTO `common_city_zone` VALUES ('2682', '533421', '香格里拉县', '286', '0');
INSERT INTO `common_city_zone` VALUES ('2683', '533422', '德钦县', '286', '0');
INSERT INTO `common_city_zone` VALUES ('2684', '533423', '维西傈僳族自治县', '286', '0');
INSERT INTO `common_city_zone` VALUES ('2685', '540101', '市辖区', '287', '0');
INSERT INTO `common_city_zone` VALUES ('2686', '540102', '城关区', '287', '0');
INSERT INTO `common_city_zone` VALUES ('2687', '540121', '林周县', '287', '0');
INSERT INTO `common_city_zone` VALUES ('2688', '540122', '当雄县', '287', '0');
INSERT INTO `common_city_zone` VALUES ('2689', '540123', '尼木县', '287', '0');
INSERT INTO `common_city_zone` VALUES ('2690', '540124', '曲水县', '287', '0');
INSERT INTO `common_city_zone` VALUES ('2691', '540125', '堆龙德庆县', '287', '0');
INSERT INTO `common_city_zone` VALUES ('2692', '540126', '达孜县', '287', '0');
INSERT INTO `common_city_zone` VALUES ('2693', '540127', '墨竹工卡县', '287', '0');
INSERT INTO `common_city_zone` VALUES ('2694', '542121', '昌都县', '288', '0');
INSERT INTO `common_city_zone` VALUES ('2695', '542122', '江达县', '288', '0');
INSERT INTO `common_city_zone` VALUES ('2696', '542123', '贡觉县', '288', '0');
INSERT INTO `common_city_zone` VALUES ('2697', '542124', '类乌齐县', '288', '0');
INSERT INTO `common_city_zone` VALUES ('2698', '542125', '丁青县', '288', '0');
INSERT INTO `common_city_zone` VALUES ('2699', '542126', '察雅县', '288', '0');
INSERT INTO `common_city_zone` VALUES ('2700', '542127', '八宿县', '288', '0');
INSERT INTO `common_city_zone` VALUES ('2701', '542128', '左贡县', '288', '0');
INSERT INTO `common_city_zone` VALUES ('2702', '542129', '芒康县', '288', '0');
INSERT INTO `common_city_zone` VALUES ('2703', '542132', '洛隆县', '288', '0');
INSERT INTO `common_city_zone` VALUES ('2704', '542133', '边坝县', '288', '0');
INSERT INTO `common_city_zone` VALUES ('2705', '542221', '乃东县', '289', '0');
INSERT INTO `common_city_zone` VALUES ('2706', '542222', '扎囊县', '289', '0');
INSERT INTO `common_city_zone` VALUES ('2707', '542223', '贡嘎县', '289', '0');
INSERT INTO `common_city_zone` VALUES ('2708', '542224', '桑日县', '289', '0');
INSERT INTO `common_city_zone` VALUES ('2709', '542225', '琼结县', '289', '0');
INSERT INTO `common_city_zone` VALUES ('2710', '542226', '曲松县', '289', '0');
INSERT INTO `common_city_zone` VALUES ('2711', '542227', '措美县', '289', '0');
INSERT INTO `common_city_zone` VALUES ('2712', '542228', '洛扎县', '289', '0');
INSERT INTO `common_city_zone` VALUES ('2713', '542229', '加查县', '289', '0');
INSERT INTO `common_city_zone` VALUES ('2714', '542231', '隆子县', '289', '0');
INSERT INTO `common_city_zone` VALUES ('2715', '542232', '错那县', '289', '0');
INSERT INTO `common_city_zone` VALUES ('2716', '542233', '浪卡子县', '289', '0');
INSERT INTO `common_city_zone` VALUES ('2717', '542301', '日喀则市', '290', '0');
INSERT INTO `common_city_zone` VALUES ('2718', '542322', '南木林县', '290', '0');
INSERT INTO `common_city_zone` VALUES ('2719', '542323', '江孜县', '290', '0');
INSERT INTO `common_city_zone` VALUES ('2720', '542324', '定日县', '290', '0');
INSERT INTO `common_city_zone` VALUES ('2721', '542325', '萨迦县', '290', '0');
INSERT INTO `common_city_zone` VALUES ('2722', '542326', '拉孜县', '290', '0');
INSERT INTO `common_city_zone` VALUES ('2723', '542327', '昂仁县', '290', '0');
INSERT INTO `common_city_zone` VALUES ('2724', '542328', '谢通门县', '290', '0');
INSERT INTO `common_city_zone` VALUES ('2725', '542329', '白朗县', '290', '0');
INSERT INTO `common_city_zone` VALUES ('2726', '542330', '仁布县', '290', '0');
INSERT INTO `common_city_zone` VALUES ('2727', '542331', '康马县', '290', '0');
INSERT INTO `common_city_zone` VALUES ('2728', '542332', '定结县', '290', '0');
INSERT INTO `common_city_zone` VALUES ('2729', '542333', '仲巴县', '290', '0');
INSERT INTO `common_city_zone` VALUES ('2730', '542334', '亚东县', '290', '0');
INSERT INTO `common_city_zone` VALUES ('2731', '542335', '吉隆县', '290', '0');
INSERT INTO `common_city_zone` VALUES ('2732', '542336', '聂拉木县', '290', '0');
INSERT INTO `common_city_zone` VALUES ('2733', '542337', '萨嘎县', '290', '0');
INSERT INTO `common_city_zone` VALUES ('2734', '542338', '岗巴县', '290', '0');
INSERT INTO `common_city_zone` VALUES ('2735', '542421', '那曲县', '291', '0');
INSERT INTO `common_city_zone` VALUES ('2736', '542422', '嘉黎县', '291', '0');
INSERT INTO `common_city_zone` VALUES ('2737', '542423', '比如县', '291', '0');
INSERT INTO `common_city_zone` VALUES ('2738', '542424', '聂荣县', '291', '0');
INSERT INTO `common_city_zone` VALUES ('2739', '542425', '安多县', '291', '0');
INSERT INTO `common_city_zone` VALUES ('2740', '542426', '申扎县', '291', '0');
INSERT INTO `common_city_zone` VALUES ('2741', '542427', '索　县', '291', '0');
INSERT INTO `common_city_zone` VALUES ('2742', '542428', '班戈县', '291', '0');
INSERT INTO `common_city_zone` VALUES ('2743', '542429', '巴青县', '291', '0');
INSERT INTO `common_city_zone` VALUES ('2744', '542430', '尼玛县', '291', '0');
INSERT INTO `common_city_zone` VALUES ('2745', '542521', '普兰县', '292', '0');
INSERT INTO `common_city_zone` VALUES ('2746', '542522', '札达县', '292', '0');
INSERT INTO `common_city_zone` VALUES ('2747', '542523', '噶尔县', '292', '0');
INSERT INTO `common_city_zone` VALUES ('2748', '542524', '日土县', '292', '0');
INSERT INTO `common_city_zone` VALUES ('2749', '542525', '革吉县', '292', '0');
INSERT INTO `common_city_zone` VALUES ('2750', '542526', '改则县', '292', '0');
INSERT INTO `common_city_zone` VALUES ('2751', '542527', '措勤县', '292', '0');
INSERT INTO `common_city_zone` VALUES ('2752', '542621', '林芝县', '293', '0');
INSERT INTO `common_city_zone` VALUES ('2753', '542622', '工布江达县', '293', '0');
INSERT INTO `common_city_zone` VALUES ('2754', '542623', '米林县', '293', '0');
INSERT INTO `common_city_zone` VALUES ('2755', '542624', '墨脱县', '293', '0');
INSERT INTO `common_city_zone` VALUES ('2756', '542625', '波密县', '293', '0');
INSERT INTO `common_city_zone` VALUES ('2757', '542626', '察隅县', '293', '0');
INSERT INTO `common_city_zone` VALUES ('2758', '542627', '朗　县', '293', '0');
INSERT INTO `common_city_zone` VALUES ('2759', '610101', '市辖区', '294', '0');
INSERT INTO `common_city_zone` VALUES ('2760', '610102', '新城区', '294', '0');
INSERT INTO `common_city_zone` VALUES ('2761', '610103', '碑林区', '294', '0');
INSERT INTO `common_city_zone` VALUES ('2762', '610104', '莲湖区', '294', '0');
INSERT INTO `common_city_zone` VALUES ('2763', '610111', '灞桥区', '294', '0');
INSERT INTO `common_city_zone` VALUES ('2764', '610112', '未央区', '294', '0');
INSERT INTO `common_city_zone` VALUES ('2765', '610113', '雁塔区', '294', '0');
INSERT INTO `common_city_zone` VALUES ('2766', '610114', '阎良区', '294', '0');
INSERT INTO `common_city_zone` VALUES ('2767', '610115', '临潼区', '294', '0');
INSERT INTO `common_city_zone` VALUES ('2768', '610116', '长安区', '294', '0');
INSERT INTO `common_city_zone` VALUES ('2769', '610122', '蓝田县', '294', '0');
INSERT INTO `common_city_zone` VALUES ('2770', '610124', '周至县', '294', '0');
INSERT INTO `common_city_zone` VALUES ('2771', '610125', '户　县', '294', '0');
INSERT INTO `common_city_zone` VALUES ('2772', '610126', '高陵县', '294', '0');
INSERT INTO `common_city_zone` VALUES ('2773', '610201', '市辖区', '295', '0');
INSERT INTO `common_city_zone` VALUES ('2774', '610202', '王益区', '295', '0');
INSERT INTO `common_city_zone` VALUES ('2775', '610203', '印台区', '295', '0');
INSERT INTO `common_city_zone` VALUES ('2776', '610204', '耀州区', '295', '0');
INSERT INTO `common_city_zone` VALUES ('2777', '610222', '宜君县', '295', '0');
INSERT INTO `common_city_zone` VALUES ('2778', '610301', '市辖区', '296', '0');
INSERT INTO `common_city_zone` VALUES ('2779', '610302', '渭滨区', '296', '0');
INSERT INTO `common_city_zone` VALUES ('2780', '610303', '金台区', '296', '0');
INSERT INTO `common_city_zone` VALUES ('2781', '610304', '陈仓区', '296', '0');
INSERT INTO `common_city_zone` VALUES ('2782', '610322', '凤翔县', '296', '0');
INSERT INTO `common_city_zone` VALUES ('2783', '610323', '岐山县', '296', '0');
INSERT INTO `common_city_zone` VALUES ('2784', '610324', '扶风县', '296', '0');
INSERT INTO `common_city_zone` VALUES ('2785', '610326', '眉　县', '296', '0');
INSERT INTO `common_city_zone` VALUES ('2786', '610327', '陇　县', '296', '0');
INSERT INTO `common_city_zone` VALUES ('2787', '610328', '千阳县', '296', '0');
INSERT INTO `common_city_zone` VALUES ('2788', '610329', '麟游县', '296', '0');
INSERT INTO `common_city_zone` VALUES ('2789', '610330', '凤　县', '296', '0');
INSERT INTO `common_city_zone` VALUES ('2790', '610331', '太白县', '296', '0');
INSERT INTO `common_city_zone` VALUES ('2791', '610401', '市辖区', '297', '0');
INSERT INTO `common_city_zone` VALUES ('2792', '610402', '秦都区', '297', '0');
INSERT INTO `common_city_zone` VALUES ('2793', '610403', '杨凌区', '297', '0');
INSERT INTO `common_city_zone` VALUES ('2794', '610404', '渭城区', '297', '0');
INSERT INTO `common_city_zone` VALUES ('2795', '610422', '三原县', '297', '0');
INSERT INTO `common_city_zone` VALUES ('2796', '610423', '泾阳县', '297', '0');
INSERT INTO `common_city_zone` VALUES ('2797', '610424', '乾　县', '297', '0');
INSERT INTO `common_city_zone` VALUES ('2798', '610425', '礼泉县', '297', '0');
INSERT INTO `common_city_zone` VALUES ('2799', '610426', '永寿县', '297', '0');
INSERT INTO `common_city_zone` VALUES ('2800', '610427', '彬　县', '297', '0');
INSERT INTO `common_city_zone` VALUES ('2801', '610428', '长武县', '297', '0');
INSERT INTO `common_city_zone` VALUES ('2802', '610429', '旬邑县', '297', '0');
INSERT INTO `common_city_zone` VALUES ('2803', '610430', '淳化县', '297', '0');
INSERT INTO `common_city_zone` VALUES ('2804', '610431', '武功县', '297', '0');
INSERT INTO `common_city_zone` VALUES ('2805', '610481', '兴平市', '297', '0');
INSERT INTO `common_city_zone` VALUES ('2806', '610501', '市辖区', '298', '0');
INSERT INTO `common_city_zone` VALUES ('2807', '610502', '临渭区', '298', '0');
INSERT INTO `common_city_zone` VALUES ('2808', '610521', '华　县', '298', '0');
INSERT INTO `common_city_zone` VALUES ('2809', '610522', '潼关县', '298', '0');
INSERT INTO `common_city_zone` VALUES ('2810', '610523', '大荔县', '298', '0');
INSERT INTO `common_city_zone` VALUES ('2811', '610524', '合阳县', '298', '0');
INSERT INTO `common_city_zone` VALUES ('2812', '610525', '澄城县', '298', '0');
INSERT INTO `common_city_zone` VALUES ('2813', '610526', '蒲城县', '298', '0');
INSERT INTO `common_city_zone` VALUES ('2814', '610527', '白水县', '298', '0');
INSERT INTO `common_city_zone` VALUES ('2815', '610528', '富平县', '298', '0');
INSERT INTO `common_city_zone` VALUES ('2816', '610581', '韩城市', '298', '0');
INSERT INTO `common_city_zone` VALUES ('2817', '610582', '华阴市', '298', '0');
INSERT INTO `common_city_zone` VALUES ('2818', '610601', '市辖区', '299', '0');
INSERT INTO `common_city_zone` VALUES ('2819', '610602', '宝塔区', '299', '0');
INSERT INTO `common_city_zone` VALUES ('2820', '610621', '延长县', '299', '0');
INSERT INTO `common_city_zone` VALUES ('2821', '610622', '延川县', '299', '0');
INSERT INTO `common_city_zone` VALUES ('2822', '610623', '子长县', '299', '0');
INSERT INTO `common_city_zone` VALUES ('2823', '610624', '安塞县', '299', '0');
INSERT INTO `common_city_zone` VALUES ('2824', '610625', '志丹县', '299', '0');
INSERT INTO `common_city_zone` VALUES ('2825', '610626', '吴旗县', '299', '0');
INSERT INTO `common_city_zone` VALUES ('2826', '610627', '甘泉县', '299', '0');
INSERT INTO `common_city_zone` VALUES ('2827', '610628', '富　县', '299', '0');
INSERT INTO `common_city_zone` VALUES ('2828', '610629', '洛川县', '299', '0');
INSERT INTO `common_city_zone` VALUES ('2829', '610630', '宜川县', '299', '0');
INSERT INTO `common_city_zone` VALUES ('2830', '610631', '黄龙县', '299', '0');
INSERT INTO `common_city_zone` VALUES ('2831', '610632', '黄陵县', '299', '0');
INSERT INTO `common_city_zone` VALUES ('2832', '610701', '市辖区', '300', '0');
INSERT INTO `common_city_zone` VALUES ('2833', '610702', '汉台区', '300', '0');
INSERT INTO `common_city_zone` VALUES ('2834', '610721', '南郑县', '300', '0');
INSERT INTO `common_city_zone` VALUES ('2835', '610722', '城固县', '300', '0');
INSERT INTO `common_city_zone` VALUES ('2836', '610723', '洋　县', '300', '0');
INSERT INTO `common_city_zone` VALUES ('2837', '610724', '西乡县', '300', '0');
INSERT INTO `common_city_zone` VALUES ('2838', '610725', '勉　县', '300', '0');
INSERT INTO `common_city_zone` VALUES ('2839', '610726', '宁强县', '300', '0');
INSERT INTO `common_city_zone` VALUES ('2840', '610727', '略阳县', '300', '0');
INSERT INTO `common_city_zone` VALUES ('2841', '610728', '镇巴县', '300', '0');
INSERT INTO `common_city_zone` VALUES ('2842', '610729', '留坝县', '300', '0');
INSERT INTO `common_city_zone` VALUES ('2843', '610730', '佛坪县', '300', '0');
INSERT INTO `common_city_zone` VALUES ('2844', '610801', '市辖区', '301', '0');
INSERT INTO `common_city_zone` VALUES ('2845', '610802', '榆阳区', '301', '0');
INSERT INTO `common_city_zone` VALUES ('2846', '610821', '神木县', '301', '0');
INSERT INTO `common_city_zone` VALUES ('2847', '610822', '府谷县', '301', '0');
INSERT INTO `common_city_zone` VALUES ('2848', '610823', '横山县', '301', '0');
INSERT INTO `common_city_zone` VALUES ('2849', '610824', '靖边县', '301', '0');
INSERT INTO `common_city_zone` VALUES ('2850', '610825', '定边县', '301', '0');
INSERT INTO `common_city_zone` VALUES ('2851', '610826', '绥德县', '301', '0');
INSERT INTO `common_city_zone` VALUES ('2852', '610827', '米脂县', '301', '0');
INSERT INTO `common_city_zone` VALUES ('2853', '610828', '佳　县', '301', '0');
INSERT INTO `common_city_zone` VALUES ('2854', '610829', '吴堡县', '301', '0');
INSERT INTO `common_city_zone` VALUES ('2855', '610830', '清涧县', '301', '0');
INSERT INTO `common_city_zone` VALUES ('2856', '610831', '子洲县', '301', '0');
INSERT INTO `common_city_zone` VALUES ('2857', '610901', '市辖区', '302', '0');
INSERT INTO `common_city_zone` VALUES ('2858', '610902', '汉滨区', '302', '0');
INSERT INTO `common_city_zone` VALUES ('2859', '610921', '汉阴县', '302', '0');
INSERT INTO `common_city_zone` VALUES ('2860', '610922', '石泉县', '302', '0');
INSERT INTO `common_city_zone` VALUES ('2861', '610923', '宁陕县', '302', '0');
INSERT INTO `common_city_zone` VALUES ('2862', '610924', '紫阳县', '302', '0');
INSERT INTO `common_city_zone` VALUES ('2863', '610925', '岚皋县', '302', '0');
INSERT INTO `common_city_zone` VALUES ('2864', '610926', '平利县', '302', '0');
INSERT INTO `common_city_zone` VALUES ('2865', '610927', '镇坪县', '302', '0');
INSERT INTO `common_city_zone` VALUES ('2866', '610928', '旬阳县', '302', '0');
INSERT INTO `common_city_zone` VALUES ('2867', '610929', '白河县', '302', '0');
INSERT INTO `common_city_zone` VALUES ('2868', '611001', '市辖区', '303', '0');
INSERT INTO `common_city_zone` VALUES ('2869', '611002', '商州区', '303', '0');
INSERT INTO `common_city_zone` VALUES ('2870', '611021', '洛南县', '303', '0');
INSERT INTO `common_city_zone` VALUES ('2871', '611022', '丹凤县', '303', '0');
INSERT INTO `common_city_zone` VALUES ('2872', '611023', '商南县', '303', '0');
INSERT INTO `common_city_zone` VALUES ('2873', '611024', '山阳县', '303', '0');
INSERT INTO `common_city_zone` VALUES ('2874', '611025', '镇安县', '303', '0');
INSERT INTO `common_city_zone` VALUES ('2875', '611026', '柞水县', '303', '0');
INSERT INTO `common_city_zone` VALUES ('2876', '620101', '市辖区', '304', '0');
INSERT INTO `common_city_zone` VALUES ('2877', '620102', '城关区', '304', '0');
INSERT INTO `common_city_zone` VALUES ('2878', '620103', '七里河区', '304', '0');
INSERT INTO `common_city_zone` VALUES ('2879', '620104', '西固区', '304', '0');
INSERT INTO `common_city_zone` VALUES ('2880', '620105', '安宁区', '304', '0');
INSERT INTO `common_city_zone` VALUES ('2881', '620111', '红古区', '304', '0');
INSERT INTO `common_city_zone` VALUES ('2882', '620121', '永登县', '304', '0');
INSERT INTO `common_city_zone` VALUES ('2883', '620122', '皋兰县', '304', '0');
INSERT INTO `common_city_zone` VALUES ('2884', '620123', '榆中县', '304', '0');
INSERT INTO `common_city_zone` VALUES ('2885', '620201', '市辖区', '305', '0');
INSERT INTO `common_city_zone` VALUES ('2886', '620301', '市辖区', '306', '0');
INSERT INTO `common_city_zone` VALUES ('2887', '620302', '金川区', '306', '0');
INSERT INTO `common_city_zone` VALUES ('2888', '620321', '永昌县', '306', '0');
INSERT INTO `common_city_zone` VALUES ('2889', '620401', '市辖区', '307', '0');
INSERT INTO `common_city_zone` VALUES ('2890', '620402', '白银区', '307', '0');
INSERT INTO `common_city_zone` VALUES ('2891', '620403', '平川区', '307', '0');
INSERT INTO `common_city_zone` VALUES ('2892', '620421', '靖远县', '307', '0');
INSERT INTO `common_city_zone` VALUES ('2893', '620422', '会宁县', '307', '0');
INSERT INTO `common_city_zone` VALUES ('2894', '620423', '景泰县', '307', '0');
INSERT INTO `common_city_zone` VALUES ('2895', '620501', '市辖区', '308', '0');
INSERT INTO `common_city_zone` VALUES ('2896', '620502', '秦城区', '308', '0');
INSERT INTO `common_city_zone` VALUES ('2897', '620503', '北道区', '308', '0');
INSERT INTO `common_city_zone` VALUES ('2898', '620521', '清水县', '308', '0');
INSERT INTO `common_city_zone` VALUES ('2899', '620522', '秦安县', '308', '0');
INSERT INTO `common_city_zone` VALUES ('2900', '620523', '甘谷县', '308', '0');
INSERT INTO `common_city_zone` VALUES ('2901', '620524', '武山县', '308', '0');
INSERT INTO `common_city_zone` VALUES ('2902', '620525', '张家川回族自治县', '308', '0');
INSERT INTO `common_city_zone` VALUES ('2903', '620601', '市辖区', '309', '0');
INSERT INTO `common_city_zone` VALUES ('2904', '620602', '凉州区', '309', '0');
INSERT INTO `common_city_zone` VALUES ('2905', '620621', '民勤县', '309', '0');
INSERT INTO `common_city_zone` VALUES ('2906', '620622', '古浪县', '309', '0');
INSERT INTO `common_city_zone` VALUES ('2907', '620623', '天祝藏族自治县', '309', '0');
INSERT INTO `common_city_zone` VALUES ('2908', '620701', '市辖区', '310', '0');
INSERT INTO `common_city_zone` VALUES ('2909', '620702', '甘州区', '310', '0');
INSERT INTO `common_city_zone` VALUES ('2910', '620721', '肃南裕固族自治县', '310', '0');
INSERT INTO `common_city_zone` VALUES ('2911', '620722', '民乐县', '310', '0');
INSERT INTO `common_city_zone` VALUES ('2912', '620723', '临泽县', '310', '0');
INSERT INTO `common_city_zone` VALUES ('2913', '620724', '高台县', '310', '0');
INSERT INTO `common_city_zone` VALUES ('2914', '620725', '山丹县', '310', '0');
INSERT INTO `common_city_zone` VALUES ('2915', '620801', '市辖区', '311', '0');
INSERT INTO `common_city_zone` VALUES ('2916', '620802', '崆峒区', '311', '0');
INSERT INTO `common_city_zone` VALUES ('2917', '620821', '泾川县', '311', '0');
INSERT INTO `common_city_zone` VALUES ('2918', '620822', '灵台县', '311', '0');
INSERT INTO `common_city_zone` VALUES ('2919', '620823', '崇信县', '311', '0');
INSERT INTO `common_city_zone` VALUES ('2920', '620824', '华亭县', '311', '0');
INSERT INTO `common_city_zone` VALUES ('2921', '620825', '庄浪县', '311', '0');
INSERT INTO `common_city_zone` VALUES ('2922', '620826', '静宁县', '311', '0');
INSERT INTO `common_city_zone` VALUES ('2923', '620901', '市辖区', '312', '0');
INSERT INTO `common_city_zone` VALUES ('2924', '620902', '肃州区', '312', '0');
INSERT INTO `common_city_zone` VALUES ('2925', '620921', '金塔县', '312', '0');
INSERT INTO `common_city_zone` VALUES ('2926', '620922', '安西县', '312', '0');
INSERT INTO `common_city_zone` VALUES ('2927', '620923', '肃北蒙古族自治县', '312', '0');
INSERT INTO `common_city_zone` VALUES ('2928', '620924', '阿克塞哈萨克族自治县', '312', '0');
INSERT INTO `common_city_zone` VALUES ('2929', '620981', '玉门市', '312', '0');
INSERT INTO `common_city_zone` VALUES ('2930', '620982', '敦煌市', '312', '0');
INSERT INTO `common_city_zone` VALUES ('2931', '621001', '市辖区', '313', '0');
INSERT INTO `common_city_zone` VALUES ('2932', '621002', '西峰区', '313', '0');
INSERT INTO `common_city_zone` VALUES ('2933', '621021', '庆城县', '313', '0');
INSERT INTO `common_city_zone` VALUES ('2934', '621022', '环　县', '313', '0');
INSERT INTO `common_city_zone` VALUES ('2935', '621023', '华池县', '313', '0');
INSERT INTO `common_city_zone` VALUES ('2936', '621024', '合水县', '313', '0');
INSERT INTO `common_city_zone` VALUES ('2937', '621025', '正宁县', '313', '0');
INSERT INTO `common_city_zone` VALUES ('2938', '621026', '宁　县', '313', '0');
INSERT INTO `common_city_zone` VALUES ('2939', '621027', '镇原县', '313', '0');
INSERT INTO `common_city_zone` VALUES ('2940', '621101', '市辖区', '314', '0');
INSERT INTO `common_city_zone` VALUES ('2941', '621102', '安定区', '314', '0');
INSERT INTO `common_city_zone` VALUES ('2942', '621121', '通渭县', '314', '0');
INSERT INTO `common_city_zone` VALUES ('2943', '621122', '陇西县', '314', '0');
INSERT INTO `common_city_zone` VALUES ('2944', '621123', '渭源县', '314', '0');
INSERT INTO `common_city_zone` VALUES ('2945', '621124', '临洮县', '314', '0');
INSERT INTO `common_city_zone` VALUES ('2946', '621125', '漳　县', '314', '0');
INSERT INTO `common_city_zone` VALUES ('2947', '621126', '岷　县', '314', '0');
INSERT INTO `common_city_zone` VALUES ('2948', '621201', '市辖区', '315', '0');
INSERT INTO `common_city_zone` VALUES ('2949', '621202', '武都区', '315', '0');
INSERT INTO `common_city_zone` VALUES ('2950', '621221', '成　县', '315', '0');
INSERT INTO `common_city_zone` VALUES ('2951', '621222', '文　县', '315', '0');
INSERT INTO `common_city_zone` VALUES ('2952', '621223', '宕昌县', '315', '0');
INSERT INTO `common_city_zone` VALUES ('2953', '621224', '康　县', '315', '0');
INSERT INTO `common_city_zone` VALUES ('2954', '621225', '西和县', '315', '0');
INSERT INTO `common_city_zone` VALUES ('2955', '621226', '礼　县', '315', '0');
INSERT INTO `common_city_zone` VALUES ('2956', '621227', '徽　县', '315', '0');
INSERT INTO `common_city_zone` VALUES ('2957', '621228', '两当县', '315', '0');
INSERT INTO `common_city_zone` VALUES ('2958', '622901', '临夏市', '316', '0');
INSERT INTO `common_city_zone` VALUES ('2959', '622921', '临夏县', '316', '0');
INSERT INTO `common_city_zone` VALUES ('2960', '622922', '康乐县', '316', '0');
INSERT INTO `common_city_zone` VALUES ('2961', '622923', '永靖县', '316', '0');
INSERT INTO `common_city_zone` VALUES ('2962', '622924', '广河县', '316', '0');
INSERT INTO `common_city_zone` VALUES ('2963', '622925', '和政县', '316', '0');
INSERT INTO `common_city_zone` VALUES ('2964', '622926', '东乡族自治县', '316', '0');
INSERT INTO `common_city_zone` VALUES ('2965', '622927', '积石山保安族东乡族撒拉族自治县', '316', '0');
INSERT INTO `common_city_zone` VALUES ('2966', '623001', '合作市', '317', '0');
INSERT INTO `common_city_zone` VALUES ('2967', '623021', '临潭县', '317', '0');
INSERT INTO `common_city_zone` VALUES ('2968', '623022', '卓尼县', '317', '0');
INSERT INTO `common_city_zone` VALUES ('2969', '623023', '舟曲县', '317', '0');
INSERT INTO `common_city_zone` VALUES ('2970', '623024', '迭部县', '317', '0');
INSERT INTO `common_city_zone` VALUES ('2971', '623025', '玛曲县', '317', '0');
INSERT INTO `common_city_zone` VALUES ('2972', '623026', '碌曲县', '317', '0');
INSERT INTO `common_city_zone` VALUES ('2973', '623027', '夏河县', '317', '0');
INSERT INTO `common_city_zone` VALUES ('2974', '630101', '市辖区', '318', '0');
INSERT INTO `common_city_zone` VALUES ('2975', '630102', '城东区', '318', '0');
INSERT INTO `common_city_zone` VALUES ('2976', '630103', '城中区', '318', '0');
INSERT INTO `common_city_zone` VALUES ('2977', '630104', '城西区', '318', '0');
INSERT INTO `common_city_zone` VALUES ('2978', '630105', '城北区', '318', '0');
INSERT INTO `common_city_zone` VALUES ('2979', '630121', '大通回族土族自治县', '318', '0');
INSERT INTO `common_city_zone` VALUES ('2980', '630122', '湟中县', '318', '0');
INSERT INTO `common_city_zone` VALUES ('2981', '630123', '湟源县', '318', '0');
INSERT INTO `common_city_zone` VALUES ('2982', '632121', '平安县', '319', '0');
INSERT INTO `common_city_zone` VALUES ('2983', '632122', '民和回族土族自治县', '319', '0');
INSERT INTO `common_city_zone` VALUES ('2984', '632123', '乐都县', '319', '0');
INSERT INTO `common_city_zone` VALUES ('2985', '632126', '互助土族自治县', '319', '0');
INSERT INTO `common_city_zone` VALUES ('2986', '632127', '化隆回族自治县', '319', '0');
INSERT INTO `common_city_zone` VALUES ('2987', '632128', '循化撒拉族自治县', '319', '0');
INSERT INTO `common_city_zone` VALUES ('2988', '632221', '门源回族自治县', '320', '0');
INSERT INTO `common_city_zone` VALUES ('2989', '632222', '祁连县', '320', '0');
INSERT INTO `common_city_zone` VALUES ('2990', '632223', '海晏县', '320', '0');
INSERT INTO `common_city_zone` VALUES ('2991', '632224', '刚察县', '320', '0');
INSERT INTO `common_city_zone` VALUES ('2992', '632321', '同仁县', '321', '0');
INSERT INTO `common_city_zone` VALUES ('2993', '632322', '尖扎县', '321', '0');
INSERT INTO `common_city_zone` VALUES ('2994', '632323', '泽库县', '321', '0');
INSERT INTO `common_city_zone` VALUES ('2995', '632324', '河南蒙古族自治县', '321', '0');
INSERT INTO `common_city_zone` VALUES ('2996', '632521', '共和县', '322', '0');
INSERT INTO `common_city_zone` VALUES ('2997', '632522', '同德县', '322', '0');
INSERT INTO `common_city_zone` VALUES ('2998', '632523', '贵德县', '322', '0');
INSERT INTO `common_city_zone` VALUES ('2999', '632524', '兴海县', '322', '0');
INSERT INTO `common_city_zone` VALUES ('3000', '632525', '贵南县', '322', '0');
INSERT INTO `common_city_zone` VALUES ('3001', '632621', '玛沁县', '323', '0');
INSERT INTO `common_city_zone` VALUES ('3002', '632622', '班玛县', '323', '0');
INSERT INTO `common_city_zone` VALUES ('3003', '632623', '甘德县', '323', '0');
INSERT INTO `common_city_zone` VALUES ('3004', '632624', '达日县', '323', '0');
INSERT INTO `common_city_zone` VALUES ('3005', '632625', '久治县', '323', '0');
INSERT INTO `common_city_zone` VALUES ('3006', '632626', '玛多县', '323', '0');
INSERT INTO `common_city_zone` VALUES ('3007', '632721', '玉树县', '324', '0');
INSERT INTO `common_city_zone` VALUES ('3008', '632722', '杂多县', '324', '0');
INSERT INTO `common_city_zone` VALUES ('3009', '632723', '称多县', '324', '0');
INSERT INTO `common_city_zone` VALUES ('3010', '632724', '治多县', '324', '0');
INSERT INTO `common_city_zone` VALUES ('3011', '632725', '囊谦县', '324', '0');
INSERT INTO `common_city_zone` VALUES ('3012', '632726', '曲麻莱县', '324', '0');
INSERT INTO `common_city_zone` VALUES ('3013', '632801', '格尔木市', '325', '0');
INSERT INTO `common_city_zone` VALUES ('3014', '632802', '德令哈市', '325', '0');
INSERT INTO `common_city_zone` VALUES ('3015', '632821', '乌兰县', '325', '0');
INSERT INTO `common_city_zone` VALUES ('3016', '632822', '都兰县', '325', '0');
INSERT INTO `common_city_zone` VALUES ('3017', '632823', '天峻县', '325', '0');
INSERT INTO `common_city_zone` VALUES ('3018', '640101', '市辖区', '326', '0');
INSERT INTO `common_city_zone` VALUES ('3019', '640104', '兴庆区', '326', '0');
INSERT INTO `common_city_zone` VALUES ('3020', '640105', '西夏区', '326', '0');
INSERT INTO `common_city_zone` VALUES ('3021', '640106', '金凤区', '326', '0');
INSERT INTO `common_city_zone` VALUES ('3022', '640121', '永宁县', '326', '0');
INSERT INTO `common_city_zone` VALUES ('3023', '640122', '贺兰县', '326', '0');
INSERT INTO `common_city_zone` VALUES ('3024', '640181', '灵武市', '326', '0');
INSERT INTO `common_city_zone` VALUES ('3025', '640201', '市辖区', '327', '0');
INSERT INTO `common_city_zone` VALUES ('3026', '640202', '大武口区', '327', '0');
INSERT INTO `common_city_zone` VALUES ('3027', '640205', '惠农区', '327', '0');
INSERT INTO `common_city_zone` VALUES ('3028', '640221', '平罗县', '327', '0');
INSERT INTO `common_city_zone` VALUES ('3029', '640301', '市辖区', '328', '0');
INSERT INTO `common_city_zone` VALUES ('3030', '640302', '利通区', '328', '0');
INSERT INTO `common_city_zone` VALUES ('3031', '640323', '盐池县', '328', '0');
INSERT INTO `common_city_zone` VALUES ('3032', '640324', '同心县', '328', '0');
INSERT INTO `common_city_zone` VALUES ('3033', '640381', '青铜峡市', '328', '0');
INSERT INTO `common_city_zone` VALUES ('3034', '640401', '市辖区', '329', '0');
INSERT INTO `common_city_zone` VALUES ('3035', '640402', '原州区', '329', '0');
INSERT INTO `common_city_zone` VALUES ('3036', '640422', '西吉县', '329', '0');
INSERT INTO `common_city_zone` VALUES ('3037', '640423', '隆德县', '329', '0');
INSERT INTO `common_city_zone` VALUES ('3038', '640424', '泾源县', '329', '0');
INSERT INTO `common_city_zone` VALUES ('3039', '640425', '彭阳县', '329', '0');
INSERT INTO `common_city_zone` VALUES ('3040', '640501', '市辖区', '330', '0');
INSERT INTO `common_city_zone` VALUES ('3041', '640502', '沙坡头区', '330', '0');
INSERT INTO `common_city_zone` VALUES ('3042', '640521', '中宁县', '330', '0');
INSERT INTO `common_city_zone` VALUES ('3043', '640522', '海原县', '330', '0');
INSERT INTO `common_city_zone` VALUES ('3044', '650101', '市辖区', '331', '0');
INSERT INTO `common_city_zone` VALUES ('3045', '650102', '天山区', '331', '0');
INSERT INTO `common_city_zone` VALUES ('3046', '650103', '沙依巴克区', '331', '0');
INSERT INTO `common_city_zone` VALUES ('3047', '650104', '新市区', '331', '0');
INSERT INTO `common_city_zone` VALUES ('3048', '650105', '水磨沟区', '331', '0');
INSERT INTO `common_city_zone` VALUES ('3049', '650106', '头屯河区', '331', '0');
INSERT INTO `common_city_zone` VALUES ('3050', '650107', '达坂城区', '331', '0');
INSERT INTO `common_city_zone` VALUES ('3051', '650108', '东山区', '331', '0');
INSERT INTO `common_city_zone` VALUES ('3052', '650121', '乌鲁木齐县', '331', '0');
INSERT INTO `common_city_zone` VALUES ('3053', '650201', '市辖区', '332', '0');
INSERT INTO `common_city_zone` VALUES ('3054', '650202', '独山子区', '332', '0');
INSERT INTO `common_city_zone` VALUES ('3055', '650203', '克拉玛依区', '332', '0');
INSERT INTO `common_city_zone` VALUES ('3056', '650204', '白碱滩区', '332', '0');
INSERT INTO `common_city_zone` VALUES ('3057', '650205', '乌尔禾区', '332', '0');
INSERT INTO `common_city_zone` VALUES ('3058', '652101', '吐鲁番市', '333', '0');
INSERT INTO `common_city_zone` VALUES ('3059', '652122', '鄯善县', '333', '0');
INSERT INTO `common_city_zone` VALUES ('3060', '652123', '托克逊县', '333', '0');
INSERT INTO `common_city_zone` VALUES ('3061', '652201', '哈密市', '334', '0');
INSERT INTO `common_city_zone` VALUES ('3062', '652222', '巴里坤哈萨克自治县', '334', '0');
INSERT INTO `common_city_zone` VALUES ('3063', '652223', '伊吾县', '334', '0');
INSERT INTO `common_city_zone` VALUES ('3064', '652301', '昌吉市', '335', '0');
INSERT INTO `common_city_zone` VALUES ('3065', '652302', '阜康市', '335', '0');
INSERT INTO `common_city_zone` VALUES ('3066', '652303', '米泉市', '335', '0');
INSERT INTO `common_city_zone` VALUES ('3067', '652323', '呼图壁县', '335', '0');
INSERT INTO `common_city_zone` VALUES ('3068', '652324', '玛纳斯县', '335', '0');
INSERT INTO `common_city_zone` VALUES ('3069', '652325', '奇台县', '335', '0');
INSERT INTO `common_city_zone` VALUES ('3070', '652327', '吉木萨尔县', '335', '0');
INSERT INTO `common_city_zone` VALUES ('3071', '652328', '木垒哈萨克自治县', '335', '0');
INSERT INTO `common_city_zone` VALUES ('3072', '652701', '博乐市', '336', '0');
INSERT INTO `common_city_zone` VALUES ('3073', '652722', '精河县', '336', '0');
INSERT INTO `common_city_zone` VALUES ('3074', '652723', '温泉县', '336', '0');
INSERT INTO `common_city_zone` VALUES ('3075', '652801', '库尔勒市', '337', '0');
INSERT INTO `common_city_zone` VALUES ('3076', '652822', '轮台县', '337', '0');
INSERT INTO `common_city_zone` VALUES ('3077', '652823', '尉犁县', '337', '0');
INSERT INTO `common_city_zone` VALUES ('3078', '652824', '若羌县', '337', '0');
INSERT INTO `common_city_zone` VALUES ('3079', '652825', '且末县', '337', '0');
INSERT INTO `common_city_zone` VALUES ('3080', '652826', '焉耆回族自治县', '337', '0');
INSERT INTO `common_city_zone` VALUES ('3081', '652827', '和静县', '337', '0');
INSERT INTO `common_city_zone` VALUES ('3082', '652828', '和硕县', '337', '0');
INSERT INTO `common_city_zone` VALUES ('3083', '652829', '博湖县', '337', '0');
INSERT INTO `common_city_zone` VALUES ('3084', '652901', '阿克苏市', '338', '0');
INSERT INTO `common_city_zone` VALUES ('3085', '652922', '温宿县', '338', '0');
INSERT INTO `common_city_zone` VALUES ('3086', '652923', '库车县', '338', '0');
INSERT INTO `common_city_zone` VALUES ('3087', '652924', '沙雅县', '338', '0');
INSERT INTO `common_city_zone` VALUES ('3088', '652925', '新和县', '338', '0');
INSERT INTO `common_city_zone` VALUES ('3089', '652926', '拜城县', '338', '0');
INSERT INTO `common_city_zone` VALUES ('3090', '652927', '乌什县', '338', '0');
INSERT INTO `common_city_zone` VALUES ('3091', '652928', '阿瓦提县', '338', '0');
INSERT INTO `common_city_zone` VALUES ('3092', '652929', '柯坪县', '338', '0');
INSERT INTO `common_city_zone` VALUES ('3093', '653001', '阿图什市', '339', '0');
INSERT INTO `common_city_zone` VALUES ('3094', '653022', '阿克陶县', '339', '0');
INSERT INTO `common_city_zone` VALUES ('3095', '653023', '阿合奇县', '339', '0');
INSERT INTO `common_city_zone` VALUES ('3096', '653024', '乌恰县', '339', '0');
INSERT INTO `common_city_zone` VALUES ('3097', '653101', '喀什市', '340', '0');
INSERT INTO `common_city_zone` VALUES ('3098', '653121', '疏附县', '340', '0');
INSERT INTO `common_city_zone` VALUES ('3099', '653122', '疏勒县', '340', '0');
INSERT INTO `common_city_zone` VALUES ('3100', '653123', '英吉沙县', '340', '0');
INSERT INTO `common_city_zone` VALUES ('3101', '653124', '泽普县', '340', '0');
INSERT INTO `common_city_zone` VALUES ('3102', '653125', '莎车县', '340', '0');
INSERT INTO `common_city_zone` VALUES ('3103', '653126', '叶城县', '340', '0');
INSERT INTO `common_city_zone` VALUES ('3104', '653127', '麦盖提县', '340', '0');
INSERT INTO `common_city_zone` VALUES ('3105', '653128', '岳普湖县', '340', '0');
INSERT INTO `common_city_zone` VALUES ('3106', '653129', '伽师县', '340', '0');
INSERT INTO `common_city_zone` VALUES ('3107', '653130', '巴楚县', '340', '0');
INSERT INTO `common_city_zone` VALUES ('3108', '653131', '塔什库尔干塔吉克自治县', '340', '0');
INSERT INTO `common_city_zone` VALUES ('3109', '653201', '和田市', '341', '0');
INSERT INTO `common_city_zone` VALUES ('3110', '653221', '和田县', '341', '0');
INSERT INTO `common_city_zone` VALUES ('3111', '653222', '墨玉县', '341', '0');
INSERT INTO `common_city_zone` VALUES ('3112', '653223', '皮山县', '341', '0');
INSERT INTO `common_city_zone` VALUES ('3113', '653224', '洛浦县', '341', '0');
INSERT INTO `common_city_zone` VALUES ('3114', '653225', '策勒县', '341', '0');
INSERT INTO `common_city_zone` VALUES ('3115', '653226', '于田县', '341', '0');
INSERT INTO `common_city_zone` VALUES ('3116', '653227', '民丰县', '341', '0');
INSERT INTO `common_city_zone` VALUES ('3117', '654002', '伊宁市', '342', '0');
INSERT INTO `common_city_zone` VALUES ('3118', '654003', '奎屯市', '342', '0');
INSERT INTO `common_city_zone` VALUES ('3119', '654021', '伊宁县', '342', '0');
INSERT INTO `common_city_zone` VALUES ('3120', '654022', '察布查尔锡伯自治县', '342', '0');
INSERT INTO `common_city_zone` VALUES ('3121', '654023', '霍城县', '342', '0');
INSERT INTO `common_city_zone` VALUES ('3122', '654024', '巩留县', '342', '0');
INSERT INTO `common_city_zone` VALUES ('3123', '654025', '新源县', '342', '0');
INSERT INTO `common_city_zone` VALUES ('3124', '654026', '昭苏县', '342', '0');
INSERT INTO `common_city_zone` VALUES ('3125', '654027', '特克斯县', '342', '0');
INSERT INTO `common_city_zone` VALUES ('3126', '654028', '尼勒克县', '342', '0');
INSERT INTO `common_city_zone` VALUES ('3127', '654201', '塔城市', '343', '0');
INSERT INTO `common_city_zone` VALUES ('3128', '654202', '乌苏市', '343', '0');
INSERT INTO `common_city_zone` VALUES ('3129', '654221', '额敏县', '343', '0');
INSERT INTO `common_city_zone` VALUES ('3130', '654223', '沙湾县', '343', '0');
INSERT INTO `common_city_zone` VALUES ('3131', '654224', '托里县', '343', '0');
INSERT INTO `common_city_zone` VALUES ('3132', '654225', '裕民县', '343', '0');
INSERT INTO `common_city_zone` VALUES ('3133', '654226', '和布克赛尔蒙古自治县', '343', '0');
INSERT INTO `common_city_zone` VALUES ('3134', '654301', '阿勒泰市', '344', '0');
INSERT INTO `common_city_zone` VALUES ('3135', '654321', '布尔津县', '344', '0');
INSERT INTO `common_city_zone` VALUES ('3136', '654322', '富蕴县', '344', '0');
INSERT INTO `common_city_zone` VALUES ('3137', '654323', '福海县', '344', '0');
INSERT INTO `common_city_zone` VALUES ('3138', '654324', '哈巴河县', '344', '0');
INSERT INTO `common_city_zone` VALUES ('3139', '654325', '青河县', '344', '0');
INSERT INTO `common_city_zone` VALUES ('3140', '654326', '吉木乃县', '344', '0');
INSERT INTO `common_city_zone` VALUES ('3141', '659001', '石河子市', '345', '0');
INSERT INTO `common_city_zone` VALUES ('3142', '659002', '阿拉尔市', '345', '0');
INSERT INTO `common_city_zone` VALUES ('3143', '659003', '图木舒克市', '345', '0');
INSERT INTO `common_city_zone` VALUES ('3144', '659004', '五家渠市', '345', '0');

-- ----------------------------
-- Table structure for `common_province`
-- ----------------------------
DROP TABLE IF EXISTS `common_province`;
CREATE TABLE `common_province` (
  `id` int(11) NOT NULL,
  `code` varchar(6) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `zone_id` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL COMMENT '0停用1启用',
  PRIMARY KEY (`id`),
  KEY `FK_ZONE_PROVINCE` (`zone_id`),
  CONSTRAINT `FK_ZONE_PROVINCE` FOREIGN KEY (`zone_id`) REFERENCES `common_zone` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of common_province
-- ----------------------------
INSERT INTO `common_province` VALUES ('1', '320000', '江苏省', null, '0');
INSERT INTO `common_province` VALUES ('2', '120000', '天津市', null, '0');
INSERT INTO `common_province` VALUES ('3', '130000', '河北省', null, '0');
INSERT INTO `common_province` VALUES ('4', '140000', '山西省', null, '0');
INSERT INTO `common_province` VALUES ('5', '150000', '内蒙古', null, '0');
INSERT INTO `common_province` VALUES ('6', '210000', '辽宁省', null, '0');
INSERT INTO `common_province` VALUES ('7', '220000', '吉林省', null, '0');
INSERT INTO `common_province` VALUES ('8', '230000', '黑龙江', null, '0');
INSERT INTO `common_province` VALUES ('9', '310000', '上海市', null, '0');
INSERT INTO `common_province` VALUES ('10', '110000', '北京市', null, '0');
INSERT INTO `common_province` VALUES ('11', '330000', '浙江省', null, '0');
INSERT INTO `common_province` VALUES ('12', '340000', '安徽省', null, '0');
INSERT INTO `common_province` VALUES ('13', '350000', '福建省', null, '0');
INSERT INTO `common_province` VALUES ('14', '360000', '江西省', null, '0');
INSERT INTO `common_province` VALUES ('15', '370000', '山东省', null, '0');
INSERT INTO `common_province` VALUES ('16', '410000', '河南省', null, '0');
INSERT INTO `common_province` VALUES ('17', '420000', '湖北省', null, '0');
INSERT INTO `common_province` VALUES ('18', '430000', '湖南省', null, '0');
INSERT INTO `common_province` VALUES ('19', '440000', '广东省', null, '1');
INSERT INTO `common_province` VALUES ('20', '450000', '广  西', null, '0');
INSERT INTO `common_province` VALUES ('21', '460000', '海南省', null, '0');
INSERT INTO `common_province` VALUES ('22', '500000', '重庆市', null, '0');
INSERT INTO `common_province` VALUES ('23', '510000', '四川省', null, '0');
INSERT INTO `common_province` VALUES ('24', '520000', '贵州省', null, '0');
INSERT INTO `common_province` VALUES ('25', '530000', '云南省', null, '0');
INSERT INTO `common_province` VALUES ('26', '540000', '西  藏', null, '0');
INSERT INTO `common_province` VALUES ('27', '610000', '陕西省', null, '0');
INSERT INTO `common_province` VALUES ('28', '620000', '甘肃省', null, '0');
INSERT INTO `common_province` VALUES ('29', '630000', '青海省', null, '0');
INSERT INTO `common_province` VALUES ('30', '640000', '宁  夏', null, '0');
INSERT INTO `common_province` VALUES ('31', '650000', '新  疆', null, '0');
INSERT INTO `common_province` VALUES ('32', '710000', '台湾省', null, '0');
INSERT INTO `common_province` VALUES ('33', '810000', '香  港', null, '0');
INSERT INTO `common_province` VALUES ('34', '820000', '澳  门', null, '0');

-- ----------------------------
-- Table structure for `common_zone`
-- ----------------------------
DROP TABLE IF EXISTS `common_zone`;
CREATE TABLE `common_zone` (
  `id` int(11) NOT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `state` int(11) DEFAULT NULL COMMENT '0停用1启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='中国个区域划分表';

-- ----------------------------
-- Records of common_zone
-- ----------------------------

-- ----------------------------
-- Table structure for `comm_system_signle_data_set`
-- ----------------------------
DROP TABLE IF EXISTS `comm_system_signle_data_set`;
CREATE TABLE `comm_system_signle_data_set` (
  `DATA_SET_ID` int(11) NOT NULL,
  `BUSI_TYPE` varchar(50) NOT NULL,
  `BUSI_CODE` varchar(50) NOT NULL,
  `BUSI_CODE_SET` varchar(1000) DEFAULT NULL,
  `SET_MEMO` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`DATA_SET_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comm_system_signle_data_set
-- ----------------------------
INSERT INTO `comm_system_signle_data_set` VALUES ('1', 'APP_COMPANY_BANK_ACCOUNT', 'BANK_NO', '1231415435', '房租宝房东租客版公司收款账号');
INSERT INTO `comm_system_signle_data_set` VALUES ('2', 'APP_COMPANY_BANK_ACCOUNT', 'BANK_TYPE', '1', '房租宝房东租客版公司收款账号所属银行');

-- ----------------------------
-- Table structure for `file_attach_control`
-- ----------------------------
DROP TABLE IF EXISTS `file_attach_control`;
CREATE TABLE `file_attach_control` (
  `CONTROL_ID` decimal(8,0) NOT NULL COMMENT '自动增长',
  `FILE_TITLE` varchar(200) NOT NULL COMMENT '文件标题',
  `FILE_NAME` varchar(200) NOT NULL COMMENT '文件名',
  `FILE_TYPE` varchar(20) DEFAULT NULL COMMENT '实际文件扩展名，大写',
  `DEAL_TYPE` varchar(64) DEFAULT NULL,
  `DEAL_CODE` varchar(256) DEFAULT NULL,
  `TYPE` varchar(20) NOT NULL,
  `SUB_TYPE` varchar(20) DEFAULT NULL,
  `FILE_SEQ` decimal(8,0) DEFAULT NULL,
  `UPLOAD_USER` varchar(20) DEFAULT NULL COMMENT '上传用户',
  `UPLOAD_DATE` varchar(20) DEFAULT NULL COMMENT '上传日期',
  `UPLOAD_USER_NAME` varchar(20) DEFAULT NULL COMMENT '上传用户名',
  `DELETED` decimal(8,0) DEFAULT NULL COMMENT '0不删除（缺省），1删除',
  PRIMARY KEY (`CONTROL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通过文件控制表业务模块、业务模块标识定位业务数据。';

-- ----------------------------
-- Records of file_attach_control
-- ----------------------------
INSERT INTO `file_attach_control` VALUES ('1', 'test', 'test', 'xls', 'company_user', '10003', 'user_excel', 'user_excel', null, '', '2014-08-31 20:20:36', 'admin', '0');
INSERT INTO `file_attach_control` VALUES ('2', 'test', 'test', 'xls', 'company_user', '10004', 'user_excel', 'user_excel', null, '', '2014-08-31 23:40:22', 'admin', '0');
INSERT INTO `file_attach_control` VALUES ('4', 'test', 'test', 'xls', 'company_user', '10007', 'user_excel', 'user_excel', null, '', '2014-09-16 00:34:35', 'admin', '0');
INSERT INTO `file_attach_control` VALUES ('5', 'test', 'test', 'xls', 'company_user', '10006', 'user_excel', 'user_excel', null, '', '2014-09-16 00:38:35', 'admin', '0');

-- ----------------------------
-- Table structure for `file_attach_upload`
-- ----------------------------
DROP TABLE IF EXISTS `file_attach_upload`;
CREATE TABLE `file_attach_upload` (
  `FILE_CODE` varchar(32) NOT NULL COMMENT '文件编码',
  `CONTROL_ID` decimal(8,0) DEFAULT NULL COMMENT '自动增长',
  `FILE_PATH` varchar(200) DEFAULT NULL COMMENT '文件路径',
  `FILE_SIZE` decimal(8,0) DEFAULT NULL COMMENT '文件大小',
  `FILE_UPLOADED` decimal(8,0) DEFAULT NULL COMMENT '是否上传文件服务器',
  `FTP_PATH` varchar(200) DEFAULT NULL COMMENT 'FTP路径',
  PRIMARY KEY (`FILE_CODE`),
  KEY `file_attach_upload_control_fk` (`CONTROL_ID`),
  CONSTRAINT `file_attach_upload_ibfk_1` FOREIGN KEY (`CONTROL_ID`) REFERENCES `file_attach_control` (`CONTROL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='保存文件存放信息';

-- ----------------------------
-- Records of file_attach_upload
-- ----------------------------
INSERT INTO `file_attach_upload` VALUES ('4KXsW4GUkH95', '4', '/Library/Tomcat/webapps/mcn/resources/company_user/10007/4KXsW4GUkH95.xls', '41472', null, null);
INSERT INTO `file_attach_upload` VALUES ('92pzfLUeKWmR', '2', '/Library/Tomcat/webapps/mcn/resources/company_user/10004/92pzfLUeKWmR.xls', '41472', null, null);
INSERT INTO `file_attach_upload` VALUES ('wjYgyh95x859', '1', '/Library/Tomcat/webapps/mcn/resources/company_user/10003/wjYgyh95x859.xls', '41472', null, null);
INSERT INTO `file_attach_upload` VALUES ('zT6FQiqtKYw1', '5', '/Library/Tomcat/webapps/mcn/resources/company_user/10006/zT6FQiqtKYw1.xls', '41472', null, null);

-- ----------------------------
-- Table structure for `fm_error_log`
-- ----------------------------
DROP TABLE IF EXISTS `fm_error_log`;
CREATE TABLE `fm_error_log` (
  `ERROR_ID` decimal(12,0) NOT NULL,
  `ERROR_CODE` varchar(20) DEFAULT NULL,
  `ERROR_LOG` varchar(2000) DEFAULT NULL,
  `ERROR_EXP` text,
  `OCCUR_TIME` varchar(20) DEFAULT NULL,
  `TERMINAL` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`ERROR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of fm_error_log
-- ----------------------------
INSERT INTO `fm_error_log` VALUES ('71', '-1', '没有配置(getIndexPage)对应的运行类,请与系统管理员联系', '', '2013-12-07 22:31:22', 'no ip');
INSERT INTO `fm_error_log` VALUES ('72', '-1', '不存在此员工信息(员工号:1001)', '', '2013-12-07 22:35:20', 'no ip');
INSERT INTO `fm_error_log` VALUES ('73', '-1', '没有配置(getIndexPage)对应的运行类,请与系统管理员联系', '', '2013-12-07 22:35:48', 'fe80:0:0:0:0:0:0:1%1');
INSERT INTO `fm_error_log` VALUES ('74', '-1', '没有配置(getIndexPage)对应的运行类,请与系统管理员联系', '', '2013-12-07 22:35:49', 'fe80:0:0:0:0:0:0:1%1');
INSERT INTO `fm_error_log` VALUES ('75', '-1', '没有配置(getIndexPage)对应的运行类,请与系统管理员联系', '', '2013-12-07 22:35:58', 'fe80:0:0:0:0:0:0:1%1');
INSERT INTO `fm_error_log` VALUES ('76', '-1', '没有配置(getIndexPage)对应的运行类,请与系统管理员联系', '', '2013-12-07 22:35:59', 'fe80:0:0:0:0:0:0:1%1');
INSERT INTO `fm_error_log` VALUES ('77', '-1', '没有配置(getIndexPage)对应的运行类,请与系统管理员联系', '', '2013-12-07 22:36:15', 'no ip');
INSERT INTO `fm_error_log` VALUES ('78', '-1', '没有配置(getIndexPage)对应的运行类,请与系统管理员联系', '', '2013-12-07 22:45:29', 'fe80:0:0:0:0:0:0:1%1');
INSERT INTO `fm_error_log` VALUES ('79', '-1', '没有配置(getIndexPage)对应的运行类,请与系统管理员联系', '', '2013-12-07 22:51:28', 'fe80:0:0:0:0:0:0:1%1');
INSERT INTO `fm_error_log` VALUES ('80', '-1', '没有配置(getIndexPage)对应的运行类,请与系统管理员联系', '', '2013-12-07 22:51:49', 'fe80:0:0:0:0:0:0:1%1');
INSERT INTO `fm_error_log` VALUES ('81', '-1', '没有配置(getIndexPage)对应的运行类,请与系统管理员联系', '', '2013-12-07 23:02:17', 'fe80:0:0:0:0:0:0:1%1');
INSERT INTO `fm_error_log` VALUES ('82', '-1', '没有配置(getIndexPage)对应的运行类,请与系统管理员联系', '', '2013-12-07 23:02:51', 'fe80:0:0:0:0:0:0:1%1');
INSERT INTO `fm_error_log` VALUES ('83', '-1', '没有配置(getIndexPage)对应的运行类,请与系统管理员联系', '', '2013-12-07 23:02:57', 'fe80:0:0:0:0:0:0:1%1');
INSERT INTO `fm_error_log` VALUES ('84', '-1', '没有配置(getIndexPage)对应的运行类,请与系统管理员联系', '', '2013-12-07 23:04:12', 'fe80:0:0:0:0:0:0:1%1');
INSERT INTO `fm_error_log` VALUES ('85', '-1', '没有配置(getIndexPage)对应的运行类,请与系统管理员联系', '', '2013-12-07 23:09:25', 'fe80:0:0:0:0:0:0:1%1');
INSERT INTO `fm_error_log` VALUES ('86', '-1', '没有配置(getIndexPage)对应的运行类,请与系统管理员联系', '', '2013-12-07 23:09:32', 'fe80:0:0:0:0:0:0:1%1');
INSERT INTO `fm_error_log` VALUES ('87', '-1', '没有配置(getIndexPage)对应的运行类,请与系统管理员联系', '', '2013-12-07 23:20:36', 'fe80:0:0:0:0:0:0:1%1');
INSERT INTO `fm_error_log` VALUES ('88', '-800011', '数据库执行SQL出错.(SQL=select b.staff_no,d.u_id, b.u_realname,c.num from xieshou_staff b left join (select a.staff_no, count(*) as num from xieshou_car a where  LENGTH(a.staff_no) >0 group by a.staff_no ) c on b.staff_no=c.staff_no  left join xieshou_staff d on b.staff_no =d.staff_no )', 'java.sql.SQLException: Table \'xieshouw.xieshou_staff\' doesn\'t exist\n	at com.mysql.jdbc.MysqlIO.checkErrorPacket(MysqlIO.java:2847)\n	at com.mysql.jdbc.MysqlIO.sendCommand(MysqlIO.java:1531)\n	at com.mysql.jdbc.MysqlIO.sqlQueryDirect(MysqlIO.java:1622)\n	at com.mysql.jdbc.Connection.execSQL(Connection.java:2370)\n	at com.mysql.jdbc.Connection.execSQL(Connection.java:2297)\n	at com.mysql.jdbc.Statement.executeQuery(Statement.java:1183)\n	at sun.reflect.GeneratedMethodAccessor50.invoke(Unknown Source)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:25)\n	at java.lang.reflect.Method.invoke(Method.java:597)\n	at org.logicalcobwebs.proxool.ProxyStatement.invoke(ProxyStatement.java:100)\n	at org.logicalcobwebs.proxool.ProxyStatement.intercept(ProxyStatement.java:57)\n	at $java.sql.Statement$$EnhancerByProxool$$39ebb318.executeQuery(<generated>)\n	at com.juts.framework.data.DataAccess.query(Unknown Source:79)\n	at com.juts.framework.data.DataAccess.query(Unknown Source:100)\n	at com.xieshouw.staff.XieshouStaff.getStaffCarResources(XieshouStaff.java:224)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:39)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:25)\n	at java.lang.reflect.Method.invoke(Method.java:597)\n	at com.juts.framework.engine.Service.execMethod(Unknown Source:165)\n	at com.juts.framework.engine.Service.execute(Unknown Source:59)\n	at com.juts.framework.engine.ServiceAction.execute(Unknown Source:19)\n	at com.xieshouw.web.Index.getIndexPage(Index.java:51)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:39)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:25)\n	at java.lang.reflect.Method.invoke(Method.java:597)\n	at com.juts.framework.engine.Service.execMethod(Unknown Source:165)\n	at com.juts.framework.engine.Service.execute(Unknown Source:59)\n	at com.juts.framework.engine.ServiceAction.execute(Unknown Source:19)\n	at com.juts.framework.engine.Action.execute(Unknown Source:46)\n	at com.juts.web.taglibs.A.doEndTag(A.java:107)\n	at org.apache.jsp.home_jsp._jspx_meth_$_005fA_005f0(home_jsp.java:781)\n	at org.apache.jsp.home_jsp._jspService(home_jsp.java:256)\n	at org.apache.jasper.runtime.HttpJspBase.service(HttpJspBase.java:98)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:729)\n	at org.apache.jasper.servlet.JspServletWrapper.service(JspServletWrapper.java:369)\n	at org.apache.jasper.servlet.JspServlet.serviceJspFile(JspServlet.java:308)\n	at org.apache.jasper.servlet.JspServlet.service(JspServlet.java:259)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:729)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:269)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:188)\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:213)\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:172)\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:127)\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:117)\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:108)\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:174)\n	at org.apache.coyote.http11.Http11Processor.process(Http11Processor.java:879)\n	at org.apache.coyote.http11.Http11BaseProtocol$Http11ConnectionHandler.processConnection(Http11BaseProtocol.java:665)\n	at org.apache.tomcat.util.net.PoolTcpEndpoint.processSocket(PoolTcpEndpoint.java:528)\n	at org.apache.tomcat.util.net.LeaderFollowerWorkerThread.runIt(LeaderFollowerWorkerThread.java:81)\n	at org.apache.tomcat.util.threads.ThreadPool$ControlRunnable.run(ThreadPool.java:689)\n	at java.lang.Thread.run(Thread.java:680)\n', '2013-12-07 23:26:24', 'fe80:0:0:0:0:0:0:1%1');
INSERT INTO `fm_error_log` VALUES ('89', '-1', '不存在此员工信息(员工号:1001)', '', '2013-12-08 02:02:05', 'no ip');
INSERT INTO `fm_error_log` VALUES ('90', '-1', '调用动态服务(getErrorMsgs)发生数据库异常', 'com.juts.framework.exp.JException\n	at com.juts.framework.data.DataAccess.query(Unknown Source:51)\n	at com.juts.framework.engine.SqlAction.execute(Unknown Source:104)\n	at com.juts.framework.engine.Action.execute(Unknown Source:54)\n	at com.juts.web.taglibs.A.doEndTag(A.java:107)\n	at org.apache.jsp.system.framework.ErrorMessage_jsp._jspx_meth_$_005fA_005f0(ErrorMessage_jsp.java:443)\n	at org.apache.jsp.system.framework.ErrorMessage_jsp._jspx_meth_$_005fG_005f0(ErrorMessage_jsp.java:341)\n	at org.apache.jsp.system.framework.ErrorMessage_jsp._jspService(ErrorMessage_jsp.java:141)\n	at org.apache.jasper.runtime.HttpJspBase.service(HttpJspBase.java:98)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:729)\n	at org.apache.jasper.servlet.JspServletWrapper.service(JspServletWrapper.java:369)\n	at org.apache.jasper.servlet.JspServlet.serviceJspFile(JspServlet.java:308)\n	at org.apache.jasper.servlet.JspServlet.service(JspServlet.java:259)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:729)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:269)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:188)\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:213)\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:172)\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:127)\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:117)\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:108)\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:174)\n	at org.apache.coyote.http11.Http11Processor.process(Http11Processor.java:879)\n	at org.apache.coyote.http11.Http11BaseProtocol$Http11ConnectionHandler.processConnection(Http11BaseProtocol.java:665)\n	at org.apache.tomcat.util.net.PoolTcpEndpoint.processSocket(PoolTcpEndpoint.java:528)\n	at org.apache.tomcat.util.net.LeaderFollowerWorkerThread.runIt(LeaderFollowerWorkerThread.java:81)\n	at org.apache.tomcat.util.threads.ThreadPool$ControlRunnable.run(ThreadPool.java:689)\n	at java.lang.Thread.run(Thread.java:695)\n', '2014-08-17 13:52:11', '0:0:0:0:0:0:0:1%0');
INSERT INTO `fm_error_log` VALUES ('91', '-800010', '数据库执行SQL出错.', 'java.sql.SQLException: Unknown column \'faq_no\' in \'field list\'\n	at com.mysql.jdbc.MysqlIO.checkErrorPacket(MysqlIO.java:2847)\n	at com.mysql.jdbc.MysqlIO.sendCommand(MysqlIO.java:1531)\n	at com.mysql.jdbc.MysqlIO.sqlQueryDirect(MysqlIO.java:1622)\n	at com.mysql.jdbc.Connection.execSQL(Connection.java:2370)\n	at com.mysql.jdbc.Connection.execSQL(Connection.java:2297)\n	at com.mysql.jdbc.Statement.executeQuery(Statement.java:1183)\n	at sun.reflect.GeneratedMethodAccessor138.invoke(Unknown Source)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:25)\n	at java.lang.reflect.Method.invoke(Method.java:597)\n	at org.logicalcobwebs.proxool.ProxyStatement.invoke(ProxyStatement.java:100)\n	at org.logicalcobwebs.proxool.ProxyStatement.intercept(ProxyStatement.java:57)\n	at $java.sql.Wrapper$$EnhancerByProxool$$85cfb014.executeQuery(<generated>)\n	at com.juts.framework.data.DataAccess.query(Unknown Source:39)\n	at com.juts.logic.km.faq.FaqQuery.getSysFaqTree(FaqQuery.java:113)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:39)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:25)\n	at java.lang.reflect.Method.invoke(Method.java:597)\n	at com.juts.framework.engine.Service.execMethod(Unknown Source:165)\n	at com.juts.framework.engine.Service.execute(Unknown Source:59)\n	at com.juts.framework.engine.ServiceAction.execute(Unknown Source:19)\n	at com.juts.framework.engine.Action.execute(Unknown Source:46)\n	at com.juts.web.taglibs.A.doEndTag(A.java:107)\n	at org.apache.jsp.system.help.FaqInclude2_jsp._jspx_meth_$_005fA_005f0(FaqInclude2_jsp.java:275)\n	at org.apache.jsp.system.help.FaqInclude2_jsp._jspx_meth_$_005fG_005f0(FaqInclude2_jsp.java:225)\n	at org.apache.jsp.system.help.FaqInclude2_jsp._jspService(FaqInclude2_jsp.java:160)\n	at org.apache.jasper.runtime.HttpJspBase.service(HttpJspBase.java:98)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:729)\n	at org.apache.jasper.servlet.JspServletWrapper.service(JspServletWrapper.java:369)\n	at org.apache.jasper.servlet.JspServlet.serviceJspFile(JspServlet.java:308)\n	at org.apache.jasper.servlet.JspServlet.service(JspServlet.java:259)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:729)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:269)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:188)\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:213)\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:172)\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:127)\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:117)\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:108)\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:174)\n	at org.apache.coyote.http11.Http11Processor.process(Http11Processor.java:879)\n	at org.apache.coyote.http11.Http11BaseProtocol$Http11ConnectionHandler.processConnection(Http11BaseProtocol.java:665)\n	at org.apache.tomcat.util.net.PoolTcpEndpoint.processSocket(PoolTcpEndpoint.java:528)\n	at org.apache.tomcat.util.net.LeaderFollowerWorkerThread.runIt(LeaderFollowerWorkerThread.java:81)\n	at org.apache.tomcat.util.threads.ThreadPool$ControlRunnable.run(ThreadPool.java:689)\n	at java.lang.Thread.run(Thread.java:695)\n', '2014-08-26 11:49:51', '0:0:0:0:0:0:0:1%0');
INSERT INTO `fm_error_log` VALUES ('92', '-800010', '数据库执行SQL出错.', 'java.sql.SQLException: Unknown column \'faq_no\' in \'field list\'\n	at com.mysql.jdbc.MysqlIO.checkErrorPacket(MysqlIO.java:2847)\n	at com.mysql.jdbc.MysqlIO.sendCommand(MysqlIO.java:1531)\n	at com.mysql.jdbc.MysqlIO.sqlQueryDirect(MysqlIO.java:1622)\n	at com.mysql.jdbc.Connection.execSQL(Connection.java:2370)\n	at com.mysql.jdbc.Connection.execSQL(Connection.java:2297)\n	at com.mysql.jdbc.Statement.executeQuery(Statement.java:1183)\n	at sun.reflect.GeneratedMethodAccessor90.invoke(Unknown Source)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:25)\n	at java.lang.reflect.Method.invoke(Method.java:597)\n	at org.logicalcobwebs.proxool.ProxyStatement.invoke(ProxyStatement.java:100)\n	at org.logicalcobwebs.proxool.ProxyStatement.intercept(ProxyStatement.java:57)\n	at $java.sql.Wrapper$$EnhancerByProxool$$501427a1.executeQuery(<generated>)\n	at com.juts.framework.data.DataAccess.query(Unknown Source:39)\n	at com.juts.logic.km.faq.FaqQuery.getSysFaqTree(FaqQuery.java:113)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:39)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:25)\n	at java.lang.reflect.Method.invoke(Method.java:597)\n	at com.juts.framework.engine.Service.execMethod(Unknown Source:165)\n	at com.juts.framework.engine.Service.execute(Unknown Source:59)\n	at com.juts.framework.engine.ServiceAction.execute(Unknown Source:19)\n	at com.juts.framework.engine.Action.execute(Unknown Source:46)\n	at com.juts.web.taglibs.A.doEndTag(A.java:107)\n	at org.apache.jsp.system.help.FaqInclude2_jsp._jspx_meth_$_005fA_005f0(FaqInclude2_jsp.java:275)\n	at org.apache.jsp.system.help.FaqInclude2_jsp._jspx_meth_$_005fG_005f0(FaqInclude2_jsp.java:225)\n	at org.apache.jsp.system.help.FaqInclude2_jsp._jspService(FaqInclude2_jsp.java:160)\n	at org.apache.jasper.runtime.HttpJspBase.service(HttpJspBase.java:98)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:729)\n	at org.apache.jasper.servlet.JspServletWrapper.service(JspServletWrapper.java:369)\n	at org.apache.jasper.servlet.JspServlet.serviceJspFile(JspServlet.java:308)\n	at org.apache.jasper.servlet.JspServlet.service(JspServlet.java:259)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:729)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:269)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:188)\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:213)\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:172)\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:127)\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:117)\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:108)\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:174)\n	at org.apache.coyote.http11.Http11Processor.process(Http11Processor.java:879)\n	at org.apache.coyote.http11.Http11BaseProtocol$Http11ConnectionHandler.processConnection(Http11BaseProtocol.java:665)\n	at org.apache.tomcat.util.net.PoolTcpEndpoint.processSocket(PoolTcpEndpoint.java:528)\n	at org.apache.tomcat.util.net.LeaderFollowerWorkerThread.runIt(LeaderFollowerWorkerThread.java:81)\n	at org.apache.tomcat.util.threads.ThreadPool$ControlRunnable.run(ThreadPool.java:689)\n	at java.lang.Thread.run(Thread.java:695)\n', '2014-09-07 13:36:34', 'no ip');

-- ----------------------------
-- Table structure for `fm_execute_sql`
-- ----------------------------
DROP TABLE IF EXISTS `fm_execute_sql`;
CREATE TABLE `fm_execute_sql` (
  `ID` int(11) NOT NULL,
  `TYPE` varchar(20) DEFAULT NULL,
  `SSQL` varchar(1000) DEFAULT NULL,
  `START_TIME` varchar(20) DEFAULT NULL,
  `END_TIME` varchar(20) DEFAULT NULL,
  `SPEND_TIME` int(11) DEFAULT NULL,
  `SQL_LENGTH` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of fm_execute_sql
-- ----------------------------
INSERT INTO `fm_execute_sql` VALUES ('1', 'query', 'select seq, action_desc,action_type,rsname,action_sql,compare,auth_level from fm_dyna_action where action_id=\'getPageOtherConfig\' order by seq', '2014-09-07 19:10:43', '2014-09-07 19:10:43', '0', '142');
INSERT INTO `fm_execute_sql` VALUES ('2', 'query', 'select action_id,seq,arg_seq,arg_name,arg_data_type,arg_length,arg_desc,isnull,default_value,isasc,asc_field from fm_dyna_action_args where action_id =\'getPageOtherConfig\' and seq=1 order by arg_seq', '2014-09-07 19:10:43', '2014-09-07 19:10:43', '0', '198');
INSERT INTO `fm_execute_sql` VALUES ('3', 'query', 'select * from page_other_config where table_ename=\'SM_LOG\'', '2014-09-07 19:10:43', '2014-09-07 19:10:43', '42', '58');
INSERT INTO `fm_execute_sql` VALUES ('4', 'query', 'select * from FM_EXECUTE_SERVICE where 1>2', '2014-09-07 19:10:43', '2014-09-07 19:10:43', '1', '42');
INSERT INTO `fm_execute_sql` VALUES ('5', 'query', 'select class_name from fm_services where service_name=\'getPageComponents\'', '2014-09-07 19:10:43', '2014-09-07 19:10:43', '1', '73');
INSERT INTO `fm_execute_sql` VALUES ('6', 'query', 'select * from PAGE_COMPONETS_DEFINE where table_ename=\'SM_LOG\' and page_type=0', '2014-09-07 19:10:43', '2014-09-07 19:10:43', '18', '78');
INSERT INTO `fm_execute_sql` VALUES ('7', 'query', 'select comp_type, action_type, time_seq, act_type, act_name,javascript from db_table_top_config  where card=\'SM_LOG\' and action_type <>2 and act_type <>2', '2014-09-07 19:10:43', '2014-09-07 19:10:43', '1', '153');
INSERT INTO `fm_execute_sql` VALUES ('11', 'query', 'select action_id,seq,arg_seq,arg_name,arg_data_type,arg_length,arg_desc,isnull,default_value,isasc,asc_field from fm_dyna_action_args where action_id =\'getFmErrorLogs\' and seq=1 order by arg_seq', '2014-09-07 19:10:49', '2014-09-07 19:10:49', '0', '194');
INSERT INTO `fm_execute_sql` VALUES ('12', 'query', 'select * from FM_ERROR_LOG order by ERROR_ID DESC', '2014-09-07 19:10:49', '2014-09-07 19:10:49', '0', '49');
INSERT INTO `fm_execute_sql` VALUES ('13', 'query', 'select * from FM_EXECUTE_SERVICE where 1>2', '2014-09-07 19:10:50', '2014-09-07 19:10:50', '1', '42');

-- ----------------------------
-- Table structure for `fm_international_language`
-- ----------------------------
DROP TABLE IF EXISTS `fm_international_language`;
CREATE TABLE `fm_international_language` (
  `LAN_NO` varchar(50) NOT NULL,
  `LAN_NAME` varchar(50) NOT NULL,
  `LAN_STATE` int(11) DEFAULT NULL COMMENT '1启用0未启用',
  PRIMARY KEY (`LAN_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fm_international_language
-- ----------------------------
INSERT INTO `fm_international_language` VALUES ('123', '343', '1');
INSERT INTO `fm_international_language` VALUES ('Chinese', '中文', '1');
INSERT INTO `fm_international_language` VALUES ('English', 'English', '1');

-- ----------------------------
-- Table structure for `fm_international_res`
-- ----------------------------
DROP TABLE IF EXISTS `fm_international_res`;
CREATE TABLE `fm_international_res` (
  `RES_ITEM` varchar(50) DEFAULT NULL,
  `LAN_NO` varchar(50) DEFAULT NULL,
  `RES` varchar(1024) DEFAULT NULL,
  KEY `fm_international_res_language_fk` (`LAN_NO`),
  KEY `fm_international_res_resitem_fk` (`RES_ITEM`),
  CONSTRAINT `fm_international_res_ibfk_1` FOREIGN KEY (`RES_ITEM`) REFERENCES `fm_international_res_item` (`RES_ITEM`),
  CONSTRAINT `fm_international_res_ibfk_2` FOREIGN KEY (`LAN_NO`) REFERENCES `fm_international_language` (`LAN_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fm_international_res
-- ----------------------------
INSERT INTO `fm_international_res` VALUES ('card.attach', 'English', 'TableAttach{0}123{1}45690');
INSERT INTO `fm_international_res` VALUES ('card.attach', 'Chinese', '表单附件{0}123{1}456');
INSERT INTO `fm_international_res` VALUES ('framework.message.error', 'Chinese', '操作失败');
INSERT INTO `fm_international_res` VALUES ('framework.message.error', 'English', 'Failure');
INSERT INTO `fm_international_res` VALUES ('framework.message.success', 'Chinese', '操作成功');
INSERT INTO `fm_international_res` VALUES ('framework.message.success', 'English', 'Success');
INSERT INTO `fm_international_res` VALUES ('framework.validatecode.error', 'Chinese', '验证码错误');
INSERT INTO `fm_international_res` VALUES ('framework.not.login', 'Chinese', '未登录');
INSERT INTO `fm_international_res` VALUES ('admin.article.list', 'Chinese', '文章列表');
INSERT INTO `fm_international_res` VALUES ('admin.common.add', 'Chinese', '添加');
INSERT INTO `fm_international_res` VALUES ('admin.common.delete', 'Chinese', '删除');
INSERT INTO `fm_international_res` VALUES ('admin.common.refresh', 'Chinese', '刷新');
INSERT INTO `fm_international_res` VALUES ('admin.page.pageSize', 'Chinese', '每页显示');
INSERT INTO `fm_international_res` VALUES ('admin.page.total', 'Chinese', '(共<span id=\"pageTotal\">{0}</span>条记录)');
INSERT INTO `fm_international_res` VALUES ('admin.path.index', 'Chinese', '首页');
INSERT INTO `fm_international_res` VALUES ('Article.title', 'Chinese', '标题');
INSERT INTO `fm_international_res` VALUES ('admin.common.handle', 'Chinese', '操作');
INSERT INTO `fm_international_res` VALUES ('admin.common.edit', 'Chinese', '编辑');
INSERT INTO `fm_international_res` VALUES ('admin.common.view', 'Chinese', '查看');
INSERT INTO `fm_international_res` VALUES ('page.total', 'Chinese', '共{0}页 到第');
INSERT INTO `fm_international_res` VALUES ('framework.nav.index', 'Chinese', '系统管理');
INSERT INTO `fm_international_res` VALUES ('framework.nav.moudle', 'Chinese', '模块维护');
INSERT INTO `fm_international_res` VALUES ('admin.common.back', 'Chinese', '返回');
INSERT INTO `fm_international_res` VALUES ('admin.common.submit', 'Chinese', '确定');
INSERT INTO `fm_international_res` VALUES ('framework.moudle.add', 'Chinese', '添加模块');
INSERT INTO `fm_international_res` VALUES ('framework.moudle.moudle_name', 'Chinese', '模块名称');
INSERT INTO `fm_international_res` VALUES ('framework.moudle.moudle_begin_tab', 'Chinese', '表前缀');
INSERT INTO `fm_international_res` VALUES ('framework.moudle.moudle_desc', 'Chinese', '模块简介');
INSERT INTO `fm_international_res` VALUES ('framework.moudle.edit', 'Chinese', '模块修改');
INSERT INTO `fm_international_res` VALUES ('framework.nav.window', 'Chinese', '窗口维护');
INSERT INTO `fm_international_res` VALUES ('framework.window.add', 'Chinese', '添加窗口');
INSERT INTO `fm_international_res` VALUES ('framework.window.edit', 'Chinese', '窗口维护');
INSERT INTO `fm_international_res` VALUES ('framework.window.win_target', 'Chinese', '窗口地址');
INSERT INTO `fm_international_res` VALUES ('framework.window.win_desc', 'Chinese', '功能简介');
INSERT INTO `fm_international_res` VALUES ('framework.language.lan_name', 'Chinese', '语言名称');
INSERT INTO `fm_international_res` VALUES ('framework.language.lan_no', 'Chinese', '语言代码');
INSERT INTO `fm_international_res` VALUES ('framework.language.lan_state', 'Chinese', '状态');
INSERT INTO `fm_international_res` VALUES ('framework.nav.language', 'Chinese', '语言设置');
INSERT INTO `fm_international_res` VALUES ('framework.language.add', 'Chinese', '添加语言');
INSERT INTO `fm_international_res` VALUES ('framework.language.edit', 'Chinese', '修改语言');

-- ----------------------------
-- Table structure for `fm_international_res_item`
-- ----------------------------
DROP TABLE IF EXISTS `fm_international_res_item`;
CREATE TABLE `fm_international_res_item` (
  `RES_TYPE` int(11) NOT NULL COMMENT '1文字资源2文件资源',
  `RES_ITEM` varchar(50) NOT NULL,
  `RES_POSITION` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`RES_ITEM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fm_international_res_item
-- ----------------------------
INSERT INTO `fm_international_res_item` VALUES ('6', 'admin.article.list', null);
INSERT INTO `fm_international_res_item` VALUES ('7', 'admin.common.add', null);
INSERT INTO `fm_international_res_item` VALUES ('20', 'admin.common.back', null);
INSERT INTO `fm_international_res_item` VALUES ('8', 'admin.common.delete', null);
INSERT INTO `fm_international_res_item` VALUES ('15', 'admin.common.edit', null);
INSERT INTO `fm_international_res_item` VALUES ('14', 'admin.common.handle', null);
INSERT INTO `fm_international_res_item` VALUES ('9', 'admin.common.refresh', null);
INSERT INTO `fm_international_res_item` VALUES ('21', 'admin.common.submit', null);
INSERT INTO `fm_international_res_item` VALUES ('16', 'admin.common.view', null);
INSERT INTO `fm_international_res_item` VALUES ('10', 'admin.page.pageSize', null);
INSERT INTO `fm_international_res_item` VALUES ('11', 'admin.page.total', null);
INSERT INTO `fm_international_res_item` VALUES ('12', 'admin.path.index', null);
INSERT INTO `fm_international_res_item` VALUES ('13', 'Article.title', null);
INSERT INTO `fm_international_res_item` VALUES ('1', 'card.attach', '');
INSERT INTO `fm_international_res_item` VALUES ('0', 'framework.language.add', null);
INSERT INTO `fm_international_res_item` VALUES ('0', 'framework.language.edit', null);
INSERT INTO `fm_international_res_item` VALUES ('0', 'framework.language.lan_name', null);
INSERT INTO `fm_international_res_item` VALUES ('0', 'framework.language.lan_no', null);
INSERT INTO `fm_international_res_item` VALUES ('0', 'framework.language.lan_state', null);
INSERT INTO `fm_international_res_item` VALUES ('0', 'framework.lan_res_item.edit', null);
INSERT INTO `fm_international_res_item` VALUES ('2', 'framework.message.error', null);
INSERT INTO `fm_international_res_item` VALUES ('3', 'framework.message.success', null);
INSERT INTO `fm_international_res_item` VALUES ('22', 'framework.moudle.add', null);
INSERT INTO `fm_international_res_item` VALUES ('26', 'framework.moudle.edit', null);
INSERT INTO `fm_international_res_item` VALUES ('24', 'framework.moudle.moudle_begin_tab', null);
INSERT INTO `fm_international_res_item` VALUES ('25', 'framework.moudle.moudle_desc', null);
INSERT INTO `fm_international_res_item` VALUES ('23', 'framework.moudle.moudle_name', null);
INSERT INTO `fm_international_res_item` VALUES ('0', 'framework.nav.i18n', null);
INSERT INTO `fm_international_res_item` VALUES ('18', 'framework.nav.index', null);
INSERT INTO `fm_international_res_item` VALUES ('0', 'framework.nav.language', null);
INSERT INTO `fm_international_res_item` VALUES ('19', 'framework.nav.moudle', null);
INSERT INTO `fm_international_res_item` VALUES ('27', 'framework.nav.window', null);
INSERT INTO `fm_international_res_item` VALUES ('5', 'framework.not.login', null);
INSERT INTO `fm_international_res_item` VALUES ('4', 'framework.validatecode.error', null);
INSERT INTO `fm_international_res_item` VALUES ('27', 'framework.window.add', null);
INSERT INTO `fm_international_res_item` VALUES ('28', 'framework.window.edit', null);
INSERT INTO `fm_international_res_item` VALUES ('30', 'framework.window.win_desc', null);
INSERT INTO `fm_international_res_item` VALUES ('29', 'framework.window.win_target', null);
INSERT INTO `fm_international_res_item` VALUES ('17', 'page.total', null);

-- ----------------------------
-- Table structure for `pm_params`
-- ----------------------------
DROP TABLE IF EXISTS `pm_params`;
CREATE TABLE `pm_params` (
  `PARA_ID` int(11) NOT NULL,
  `PROJECT_ID` varchar(50) DEFAULT NULL,
  `PARA_NAME` varchar(50) DEFAULT NULL,
  `PARA_VALUE` varchar(128) DEFAULT NULL,
  `NOTES` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`PARA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pm_params
-- ----------------------------
INSERT INTO `pm_params` VALUES ('1', '1', 'USER_LOGIN_URL', 'http://localhost:8080/mcn/login/Login.jsp', '管理员登陆地址');

-- ----------------------------
-- Table structure for `pm_project`
-- ----------------------------
DROP TABLE IF EXISTS `pm_project`;
CREATE TABLE `pm_project` (
  `PROJECT_ID` varchar(50) NOT NULL,
  `PROJECT_NAME` varchar(50) DEFAULT NULL,
  `PROJECT_ENAME` varchar(100) DEFAULT NULL,
  `PROJECT_DESC` varchar(4000) DEFAULT NULL,
  `BEGIN_DATE` varchar(20) DEFAULT NULL,
  `DAYS` decimal(8,0) DEFAULT NULL,
  `COMPANY` varchar(50) DEFAULT NULL,
  `CUSTOMER` varchar(50) DEFAULT NULL,
  `ABOUT_US` varchar(4000) DEFAULT NULL,
  `CONTACT` varchar(1000) DEFAULT NULL,
  `SERVICES` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`PROJECT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='对所有项目的管理';

-- ----------------------------
-- Records of pm_project
-- ----------------------------
INSERT INTO `pm_project` VALUES ('1', '管控系统', 'mcn', '考勤、报销、会议室、任务', '2014-08-01', '50', '飞渡技术有限公司', '徐', '移动管控系统', '123', '1233');

-- ----------------------------
-- Table structure for `rent_ad`
-- ----------------------------
DROP TABLE IF EXISTS `rent_ad`;
CREATE TABLE `rent_ad` (
  `id` int(11) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `picture` varchar(256) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `content` varchar(1024) DEFAULT NULL,
  `start_time` varchar(32) DEFAULT NULL,
  `end_time` varchar(32) DEFAULT NULL,
  `view_num` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '1启用2停用',
  `create_time` varchar(32) DEFAULT NULL,
  `modify_time` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_AD_AD_TYPE` (`type_id`),
  CONSTRAINT `FK_AD_AD_TYPE` FOREIGN KEY (`type_id`) REFERENCES `rent_ad_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rent_ad
-- ----------------------------
INSERT INTO `rent_ad` VALUES ('1', '11', '1', 'http://img5.imgtn.bdimg.com/it/u=3292851460,915918973&fm=116&gp=0.jpg', '300', '300', '广告详情', '2014-12-01 00:00:00', '2015-12-01 00:00:00', '0', '1', '2014-12-01 00:00:00', '');
INSERT INTO `rent_ad` VALUES ('2', '12', '1', 'http://img2.imgtn.bdimg.com/it/u=2026575213,2622578559&fm=116&gp=0.jpg', '300', '300', '广告详情', '2014-12-01 00:00:00', '2015-12-01 00:00:00', '0', '1', '2014-12-01 00:00:00', '');

-- ----------------------------
-- Table structure for `rent_ad_type`
-- ----------------------------
DROP TABLE IF EXISTS `rent_ad_type`;
CREATE TABLE `rent_ad_type` (
  `id` int(11) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `remark` varchar(128) DEFAULT NULL,
  `create_time` varchar(32) DEFAULT NULL,
  `modify_time` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='第一期系统默认只有一个广告分类，后续可以扩展分类';

-- ----------------------------
-- Records of rent_ad_type
-- ----------------------------
INSERT INTO `rent_ad_type` VALUES ('1', '房租宝广告通用分类', '房租宝默认广告分类', null, null);

-- ----------------------------
-- Table structure for `rent_agent`
-- ----------------------------
DROP TABLE IF EXISTS `rent_agent`;
CREATE TABLE `rent_agent` (
  `id` int(11) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `telephone` varchar(32) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `username` varchar(32) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `bank_card_no` varchar(32) DEFAULT NULL COMMENT '房东用户银行账号',
  `bank_card_type` varchar(8) DEFAULT NULL COMMENT '区分不同的银行',
  `register_version` varchar(32) DEFAULT NULL,
  `current_version` varchar(32) DEFAULT NULL,
  `device` int(11) DEFAULT NULL COMMENT '1 android 2 ios',
  `device_code` varchar(64) DEFAULT NULL,
  `register_time` varchar(32) DEFAULT NULL,
  `create_time` varchar(32) DEFAULT NULL,
  `modify_time` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rent_agent
-- ----------------------------
INSERT INTO `rent_agent` VALUES ('1', '小童', '13826531136', 'dabao1989125@163.com', '哈哈哈', '2D23E461971CD2D03E6D6DEF61C4506C', '62220210011162457036', null, '1.0', '1.1', '1', '1235173571357562317', '2015-02-17 15:58:29', '2015-02-17 15:58:29', null);

-- ----------------------------
-- Table structure for `rent_agent_customer`
-- ----------------------------
DROP TABLE IF EXISTS `rent_agent_customer`;
CREATE TABLE `rent_agent_customer` (
  `id` int(11) NOT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(32) DEFAULT NULL,
  `create_time` varchar(32) DEFAULT NULL,
  `modify_time` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_CUSTOMER_AGENT` (`agent_id`),
  CONSTRAINT `FK_CUSTOMER_AGENT` FOREIGN KEY (`agent_id`) REFERENCES `rent_agent` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rent_agent_customer
-- ----------------------------

-- ----------------------------
-- Table structure for `rent_agent_reward`
-- ----------------------------
DROP TABLE IF EXISTS `rent_agent_reward`;
CREATE TABLE `rent_agent_reward` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `year` varchar(4) DEFAULT NULL,
  `month` varchar(2) DEFAULT NULL,
  `day` varchar(2) DEFAULT NULL,
  `date` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `status` int(11) NOT NULL COMMENT '1已转账2已到账',
  `create_time` varchar(32) DEFAULT NULL,
  `modify_time` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_REWARD_AGENT` (`user_id`),
  CONSTRAINT `FK_REWARD_AGENT` FOREIGN KEY (`user_id`) REFERENCES `rent_agent` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rent_agent_reward
-- ----------------------------
INSERT INTO `rent_agent_reward` VALUES ('1', '1', '2014', '09', '05', '2104-09-05', '租房中介奖励', '1', '1000.00', '1', '2014-09-05 11:30:23', null);
INSERT INTO `rent_agent_reward` VALUES ('2', '1', '2014', '10', '05', '2104-10-05', '租房中介奖励', '1', '2000.00', '1', '2014-10-05 11:30:23', null);

-- ----------------------------
-- Table structure for `rent_app_version`
-- ----------------------------
DROP TABLE IF EXISTS `rent_app_version`;
CREATE TABLE `rent_app_version` (
  `id` int(11) NOT NULL,
  `app_id` int(11) DEFAULT NULL COMMENT '1房租宝房东租客版2中介版',
  `device` int(11) DEFAULT NULL COMMENT '1 ios 2 android 3 wp',
  `version` varchar(32) DEFAULT NULL,
  `version_name` varchar(32) DEFAULT NULL,
  `url` varchar(128) DEFAULT NULL,
  `remark` varchar(256) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `upload_id` varchar(32) DEFAULT NULL,
  `create_time` varchar(32) DEFAULT NULL,
  `modify_time` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rent_app_version
-- ----------------------------
INSERT INTO `rent_app_version` VALUES ('1', '1', '1', '1.0', '1.0正式版', 'http://10.8.0.34:8080/fangzubao/resources/app/fangzubao-core-1.0.ipa', '房东租客1.0ios正式版', '10240', null, '2014-12-26 00:00:00', '2014-12-27 00:00:00');
INSERT INTO `rent_app_version` VALUES ('2', '2', '1', '1.0', '1.0正式版', 'http://10.8.0.34:8080/fangzubao/resources/app/fangzubao-agent-1.0.ipa', '中介1.0ios正式版', '10240', null, '2014-12-26 00:00:00', '2014-12-27 00:00:00');
INSERT INTO `rent_app_version` VALUES ('3', '1', '2', '1.0', '1.0正式版', 'http://10.8.0.34:8080/fangzubao/resources/app/fangzubao-core-1.0.apk', '房东租客1.0安卓正式版', '10240', null, '2014-12-26 00:00:00', '2014-12-27 00:00:00');
INSERT INTO `rent_app_version` VALUES ('4', '2', '2', '1.0', '1.0正式版', 'http://10.8.0.34:8080/fangzubao/resources/app/fangzubao-agent-1.0.apk', '中介1.0安卓正式版', '10240', null, '2014-12-26 00:00:00', '2014-12-27 00:00:00');

-- ----------------------------
-- Table structure for `rent_landlord_charge`
-- ----------------------------
DROP TABLE IF EXISTS `rent_landlord_charge`;
CREATE TABLE `rent_landlord_charge` (
  `id` int(11) NOT NULL,
  `landlord_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `charge_time` varchar(32) NOT NULL,
  `year` varchar(4) DEFAULT NULL,
  `month` varchar(2) DEFAULT NULL,
  `day` varchar(2) DEFAULT NULL,
  `money` decimal(10,2) DEFAULT NULL,
  `money_type` int(11) DEFAULT NULL COMMENT '1租金2押金',
  `renter_pay_id` int(11) DEFAULT NULL COMMENT '对应租客缴费的记录编号，如果当月租客没有缴费，系统转押金给房东，则此字段为租客针对这个房源的缴押金记录的编号（租客缴租记录表中这个房源的金额类型为押金的记录的编号）',
  `status` int(11) DEFAULT NULL,
  `from_account` varchar(32) DEFAULT NULL,
  `from_account_type` varchar(32) DEFAULT NULL,
  `to_account` varchar(32) DEFAULT NULL,
  `to_account_type` varchar(32) DEFAULT NULL,
  `pay_type` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `remark` varchar(64) DEFAULT NULL,
  `create_time` varchar(32) DEFAULT NULL,
  `modify_time` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_LANDLORD_CHARGE_ROOM` (`room_id`),
  KEY `FK_LANDLORD_CHARGE_USER` (`landlord_id`),
  CONSTRAINT `FK_LANDLORD_CHARGE_ROOM` FOREIGN KEY (`room_id`) REFERENCES `rent_room` (`id`),
  CONSTRAINT `FK_LANDLORD_CHARGE_USER` FOREIGN KEY (`landlord_id`) REFERENCES `rent_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rent_landlord_charge
-- ----------------------------

-- ----------------------------
-- Table structure for `rent_mail_record`
-- ----------------------------
DROP TABLE IF EXISTS `rent_mail_record`;
CREATE TABLE `rent_mail_record` (
  `id` int(11) NOT NULL,
  `from_account` varchar(32) DEFAULT NULL,
  `to_account` varchar(32) DEFAULT NULL,
  `send_time` varchar(32) DEFAULT NULL,
  `mail_content` varchar(512) DEFAULT NULL,
  `send_id` int(11) DEFAULT NULL,
  `send_name` varchar(32) DEFAULT NULL,
  `receiver_name` varchar(32) DEFAULT NULL,
  `create_time` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='包含用户找回密码邮件，系统给用户发送的提醒邮件等..';

-- ----------------------------
-- Records of rent_mail_record
-- ----------------------------

-- ----------------------------
-- Table structure for `rent_rent`
-- ----------------------------
DROP TABLE IF EXISTS `rent_rent`;
CREATE TABLE `rent_rent` (
  `id` int(11) NOT NULL,
  `room_id` int(11) DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `present` int(11) DEFAULT NULL,
  `rent_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '0未确认1确认3终止4续租',
  `create_time` varchar(32) DEFAULT NULL,
  `modify_time` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_RENT_RECORD_ROOM` (`room_id`),
  CONSTRAINT `FK_RENT_RECORD_ROOM` FOREIGN KEY (`room_id`) REFERENCES `rent_room` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rent_rent
-- ----------------------------
INSERT INTO `rent_rent` VALUES ('1', '1', '100000', '0', '2', '2', '2015-01-15 18:25:22', null);

-- ----------------------------
-- Table structure for `rent_renter_deposit`
-- ----------------------------
DROP TABLE IF EXISTS `rent_renter_deposit`;
CREATE TABLE `rent_renter_deposit` (
  `id` int(11) NOT NULL,
  `renter_id` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `month_num` int(11) DEFAULT NULL,
  `money` decimal(10,2) DEFAULT NULL,
  `money_type` int(11) DEFAULT NULL COMMENT '1租金2押金',
  `from_account` varchar(32) DEFAULT NULL,
  `from_account_type` varchar(11) DEFAULT NULL,
  `to_account` varchar(32) DEFAULT NULL,
  `to_account_type` varchar(11) DEFAULT NULL,
  `pay_type` int(11) DEFAULT NULL,
  `year` varchar(4) DEFAULT NULL,
  `month` varchar(4) DEFAULT NULL,
  `day` varchar(4) DEFAULT NULL,
  `create_time` varchar(32) DEFAULT NULL,
  `modify_time` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_RENTER_PAYMENT_ROOM` (`room_id`),
  KEY `FK_RENTER_PAYMENT_USER` (`renter_id`),
  CONSTRAINT `FK_RENTER_PAYMENT_ROOM` FOREIGN KEY (`room_id`) REFERENCES `rent_room` (`id`),
  CONSTRAINT `FK_RENTER_PAYMENT_USER` FOREIGN KEY (`renter_id`) REFERENCES `rent_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rent_renter_deposit
-- ----------------------------
INSERT INTO `rent_renter_deposit` VALUES ('1', '2', '1', null, '1000.00', '2', '6228480402637874213', '', '1231415435', '1231415435', null, '2015', '01', '16', '2015-01-16 18:00:55', null);

-- ----------------------------
-- Table structure for `rent_renter_monthly_money`
-- ----------------------------
DROP TABLE IF EXISTS `rent_renter_monthly_money`;
CREATE TABLE `rent_renter_monthly_money` (
  `id` int(11) NOT NULL,
  `renter_id` int(11) DEFAULT NULL,
  `room_id` int(11) NOT NULL,
  `month_num` int(11) DEFAULT NULL,
  `year` varchar(4) DEFAULT NULL,
  `month` varchar(4) DEFAULT NULL,
  `day` varchar(4) DEFAULT NULL,
  `week` varchar(8) DEFAULT NULL,
  `start_time` varchar(32) DEFAULT NULL,
  `end_time` varchar(32) DEFAULT NULL,
  `money` decimal(10,2) DEFAULT NULL,
  `real_money` decimal(10,2) DEFAULT NULL,
  `money_type` int(11) DEFAULT NULL COMMENT '1租金2押金',
  `pay_status` int(11) DEFAULT NULL COMMENT '0未收1已收',
  `from_account` varchar(32) DEFAULT NULL,
  `from_account_type` int(11) DEFAULT NULL,
  `to_account` varchar(32) DEFAULT NULL,
  `to_account_type` int(11) DEFAULT NULL,
  `pay_type` int(11) DEFAULT NULL,
  `create_time` varchar(32) DEFAULT NULL,
  `modify_time` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_MONTHLY_MONEY_ROOM` (`room_id`),
  CONSTRAINT `FK_MONTHLY_MONEY_ROOM` FOREIGN KEY (`room_id`) REFERENCES `rent_room` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rent_renter_monthly_money
-- ----------------------------
INSERT INTO `rent_renter_monthly_money` VALUES ('1', '2', '1', '1', '2015', '02', '17', null, '2015-02-01', '2015-03-01', '10000.00', '1000.00', '2', '1', '6228480402637874213', null, '1231415435', '1231415435', null, '2015-01-15 11:19:34', '2015-02-17 10:14:42');
INSERT INTO `rent_renter_monthly_money` VALUES ('2', null, '1', '1', null, null, null, null, '2015-03-01', '2015-04-01', '10000.00', null, null, '0', null, null, null, null, null, '2015-01-15 11:19:34', null);
INSERT INTO `rent_renter_monthly_money` VALUES ('3', null, '1', '1', null, null, null, null, '2015-04-01', '2015-05-01', '10000.00', null, null, '0', null, null, null, null, null, '2015-01-15 11:19:34', null);
INSERT INTO `rent_renter_monthly_money` VALUES ('4', null, '1', '1', null, null, null, null, '2015-05-01', '2015-06-01', '10000.00', null, null, '0', null, null, null, null, null, '2015-01-15 11:19:34', null);
INSERT INTO `rent_renter_monthly_money` VALUES ('5', null, '1', '1', null, null, null, null, '2015-06-01', '2015-07-01', '10000.00', null, null, '0', null, null, null, null, null, '2015-01-15 11:19:34', null);
INSERT INTO `rent_renter_monthly_money` VALUES ('6', null, '1', '1', null, null, null, null, '2015-07-01', '2015-08-01', '10000.00', null, null, '0', null, null, null, null, null, '2015-01-15 11:19:34', null);
INSERT INTO `rent_renter_monthly_money` VALUES ('7', null, '1', '1', null, null, null, null, '2015-08-01', '2015-09-01', '10000.00', null, null, '0', null, null, null, null, null, '2015-01-15 11:19:34', null);
INSERT INTO `rent_renter_monthly_money` VALUES ('8', null, '1', '1', null, null, null, null, '2015-09-01', '2015-10-01', '10000.00', null, null, '0', null, null, null, null, null, '2015-01-15 11:19:34', null);
INSERT INTO `rent_renter_monthly_money` VALUES ('9', null, '1', '1', null, null, null, null, '2015-10-01', '2015-11-01', '10000.00', null, null, '0', null, null, null, null, null, '2015-01-15 11:19:34', null);
INSERT INTO `rent_renter_monthly_money` VALUES ('10', null, '1', '1', null, null, null, null, '2015-11-01', '2015-12-01', '10000.00', null, null, '0', null, null, null, null, null, '2015-01-15 11:19:34', null);
INSERT INTO `rent_renter_monthly_money` VALUES ('11', null, '1', '1', null, null, null, null, '2015-12-01', '2016-01-01', '10000.00', null, null, '0', null, null, null, null, null, '2015-01-15 11:19:34', null);
INSERT INTO `rent_renter_monthly_money` VALUES ('12', null, '1', '1', null, null, null, null, '2016-01-01', '2016-02-01', '10000.00', null, null, '0', null, null, null, null, null, '2015-01-15 11:19:34', null);

-- ----------------------------
-- Table structure for `rent_request_stop_entrust`
-- ----------------------------
DROP TABLE IF EXISTS `rent_request_stop_entrust`;
CREATE TABLE `rent_request_stop_entrust` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `room_code` int(11) DEFAULT NULL,
  `req_end_date` varchar(32) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '0待审核1审核通过2审核不通过',
  `audit_id` int(11) DEFAULT NULL,
  `audit_name` varchar(32) DEFAULT NULL,
  `create_time` varchar(32) DEFAULT NULL,
  `modify_time` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_STOP_ENTRUST_USER` (`user_id`),
  CONSTRAINT `FK_STOP_ENTRUST_USER` FOREIGN KEY (`user_id`) REFERENCES `rent_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rent_request_stop_entrust
-- ----------------------------

-- ----------------------------
-- Table structure for `rent_room`
-- ----------------------------
DROP TABLE IF EXISTS `rent_room`;
CREATE TABLE `rent_room` (
  `id` int(11) NOT NULL,
  `code` int(11) NOT NULL COMMENT '房源的唯一编码，初始为6位数字，每次增加1',
  `landlord_id` int(11) NOT NULL,
  `province` int(11) NOT NULL,
  `city` int(11) NOT NULL,
  `region` int(11) NOT NULL,
  `address` varchar(128) DEFAULT NULL,
  `area` decimal(4,2) NOT NULL COMMENT '单位/平方米',
  `start_date` varchar(32) NOT NULL COMMENT '格式yyyy-mm-dd',
  `end_date` varchar(32) NOT NULL,
  `request_end_date` varchar(32) DEFAULT NULL,
  `pay_day` varchar(2) NOT NULL COMMENT '01-31',
  `monthly_rent` decimal(12,2) NOT NULL,
  `deposit` decimal(12,2) NOT NULL,
  `invite_code` varchar(32) DEFAULT NULL COMMENT '中介手机号码',
  `status` int(11) DEFAULT NULL COMMENT '0未出租，房东未确认 1未租出，房东已确认出租 2已租出，双方已签署协议 3托管正常结束 4续租 5申请终止委托成功',
  `create_time` varchar(32) DEFAULT NULL,
  `modify_time` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_USER_ROOM` (`landlord_id`),
  CONSTRAINT `FK_USER_ROOM` FOREIGN KEY (`landlord_id`) REFERENCES `rent_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rent_room
-- ----------------------------
INSERT INTO `rent_room` VALUES ('1', '100000', '1', '19', '202', '1956', '香景大厦', '50.00', '2015-02-01', '2016-02-01', '', '02', '10000.00', '10000.00', '13826531136', '2', '2015-01-15 10:44:41', '2015-01-16 15:36:54');

-- ----------------------------
-- Table structure for `rent_sms`
-- ----------------------------
DROP TABLE IF EXISTS `rent_sms`;
CREATE TABLE `rent_sms` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `from_account` varchar(32) DEFAULT NULL,
  `to_account` varchar(32) DEFAULT NULL,
  `sms_code` varchar(6) DEFAULT NULL,
  `sms_content` varchar(128) DEFAULT NULL,
  `send_time` varchar(32) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '1发送成功 0发送失败',
  `type` int(11) DEFAULT NULL COMMENT '1房东租客版2中介版',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rent_sms
-- ----------------------------
INSERT INTO `rent_sms` VALUES ('1', null, null, '13826531132', '886265', '欢迎使用房租宝，您本次验证码是:886265【深圳房不剩房网络科技公司】', '2015-01-13 17:35:48', '1', null);
INSERT INTO `rent_sms` VALUES ('2', null, null, '13826531132', '801027', '欢迎使用房租宝，您本次验证码是:801027【深圳房不剩房网络科技公司】', '2015-02-17 15:12:36', '1', null);
INSERT INTO `rent_sms` VALUES ('3', null, null, '13826531132', '101132', '欢迎使用房租宝，您本次验证码是:101132【深圳房不剩房网络科技公司】', '2015-02-17 15:16:57', '1', '2');

-- ----------------------------
-- Table structure for `rent_users`
-- ----------------------------
DROP TABLE IF EXISTS `rent_users`;
CREATE TABLE `rent_users` (
  `id` int(11) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `telephone` varchar(32) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `username` varchar(32) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL COMMENT '32位md5加密密码',
  `bank_card_no` varchar(32) DEFAULT NULL COMMENT '房东用户银行账号',
  `bank_card_type` varchar(8) DEFAULT NULL COMMENT '区分不同的银行',
  `credit_card_no` varchar(32) DEFAULT NULL COMMENT '租客用户信用卡卡号',
  `credit_card_type` varchar(32) DEFAULT NULL COMMENT '区分信用卡所属银行',
  `address` varchar(64) DEFAULT NULL,
  `type` int(11) DEFAULT NULL COMMENT '1房东2租客3既是房东又是租客',
  `register_time` varchar(32) DEFAULT NULL,
  `register_version` varchar(32) DEFAULT NULL,
  `current_version` varchar(32) DEFAULT NULL,
  `device` int(11) DEFAULT NULL COMMENT '1 android 2 ios',
  `device_code` varchar(64) DEFAULT NULL,
  `create_time` varchar(32) DEFAULT NULL,
  `modify_time` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rent_users
-- ----------------------------
INSERT INTO `rent_users` VALUES ('1', '小童', '13826531136', '510836106@qq.com', '哈哈哈', '670B14728AD9902AECBA32E22FA4F6BD', '6222021001116245703', '', '4270202235500236', '工商银行', '香景大厦', '3', '2014-12-26 13:05:23', '1.0', '1.0', null, null, '2014-12-26 13:05:23', '2015-01-16 18:25:35');
INSERT INTO `rent_users` VALUES ('2', 'test', '13826531135', '1915662148@qq.com', 'javakaka', 'E10ADC3949BA59ABBE56E057F20F883E', '6228480402564890018', null, '6228480402637874213', null, null, '3', '2014-12-29 18:41:57', '1.0', null, '1', '1235173571357562317', '2014-12-29 18:41:57', null);
INSERT INTO `rent_users` VALUES ('3', '测试', '13826531133', '510836102@qq.com', 'javakaka3', 'C5A1BEC92DC95924765E00EFAB78E839', '6228480402564890018', null, '6228480402637874213', null, null, '3', '2014-12-31 17:15:09', '1.0', null, '1', '1235173571357562317', '2014-12-31 17:15:09', '2015-01-16 17:45:44');
INSERT INTO `rent_users` VALUES ('4', null, '13826531132', null, '13826531132', 'E10ADC3949BA59ABBE56E057F20F883E', null, null, null, null, null, null, '2015-01-13 17:44:32', '1.0', '1.1', '1', '1235173571357562317', '2015-01-13 17:44:32', null);

-- ----------------------------
-- Table structure for `sm_bureau`
-- ----------------------------
DROP TABLE IF EXISTS `sm_bureau`;
CREATE TABLE `sm_bureau` (
  `BUREAU_NO` varchar(10) NOT NULL COMMENT '区域编码',
  `BUREAU_NAME` varchar(50) NOT NULL COMMENT '区域名称',
  `UP_BUREAU_NO` varchar(10) DEFAULT NULL COMMENT '上级区域编码',
  `AREA_CODE` varchar(256) DEFAULT NULL COMMENT '地址',
  `LINKS` varchar(128) DEFAULT NULL COMMENT '联系方式',
  `NOTES` varchar(256) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`BUREAU_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='区域（单位）表';

-- ----------------------------
-- Records of sm_bureau
-- ----------------------------
INSERT INTO `sm_bureau` VALUES ('10001', '管理平台', '', '深圳', '13826531136', '管理平台（勿删）');
INSERT INTO `sm_bureau` VALUES ('10002', 'test02', '', 'euqetu', '127317', '123');
INSERT INTO `sm_bureau` VALUES ('10003', '1212', '', '123123', '123', '12313');
INSERT INTO `sm_bureau` VALUES ('10004', 'test5', '', '12312', '1212', 'http://localhost:8080/mcn/login/Login.jsp?token=nQd9zWGtvBeGWqdnZ%2F9ZfQ%3D%3D');
INSERT INTO `sm_bureau` VALUES ('10005', 'test6', '', '12313', '1231', 'http://localhost:8080/mcn/login/Login.jsp?token=U2n7vi9qfXEY%2BiYF5%2Bsamw%3D%3D');
INSERT INTO `sm_bureau` VALUES ('10006', '11111111', '', '1111', '111', 'http://localhost:8080/mcn/login/Login.jsp?token=OkZ%2BI6qVjF%2Bzhj134gaL9Q%3D%3D');

-- ----------------------------
-- Table structure for `sm_common_position`
-- ----------------------------
DROP TABLE IF EXISTS `sm_common_position`;
CREATE TABLE `sm_common_position` (
  `COMM_POSI_NO` varchar(10) NOT NULL,
  `COMM_POSI_NAME` varchar(20) NOT NULL,
  `NOTES` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`COMM_POSI_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sm_common_position
-- ----------------------------

-- ----------------------------
-- Table structure for `sm_dictory`
-- ----------------------------
DROP TABLE IF EXISTS `sm_dictory`;
CREATE TABLE `sm_dictory` (
  `FIELD_ENAME` varchar(25) NOT NULL,
  `USED_VIEW` varchar(50) NOT NULL,
  `DISP_VIEW` varchar(100) NOT NULL,
  `DISP_ORDER` decimal(8,0) DEFAULT NULL,
  `NOTES` varchar(100) DEFAULT NULL,
  `DEFAULT_VALUE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`FIELD_ENAME`,`USED_VIEW`),
  CONSTRAINT `sm_dictory_ibfk_1` FOREIGN KEY (`FIELD_ENAME`) REFERENCES `sm_dictory_item` (`FIELD_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sm_dictory
-- ----------------------------
INSERT INTO `sm_dictory` VALUES ('AUTH_LEVEL', '10', '一般操作员', '4', '一般操作员', null);
INSERT INTO `sm_dictory` VALUES ('AUTH_LEVEL', '50', '部门管理员', '3', '部门管理员', null);
INSERT INTO `sm_dictory` VALUES ('AUTH_LEVEL', '70', '子网站管理员', '2', '子网站管理员', null);
INSERT INTO `sm_dictory` VALUES ('AUTH_LEVEL', '90', '系统管理员', '1', '系统管理员', null);
INSERT INTO `sm_dictory` VALUES ('AUTH_LEVEL', '99', '系统开发商', '0', '系统开发商', null);

-- ----------------------------
-- Table structure for `sm_dictory_item`
-- ----------------------------
DROP TABLE IF EXISTS `sm_dictory_item`;
CREATE TABLE `sm_dictory_item` (
  `FIELD_NAME` varchar(50) NOT NULL,
  `ITEM_TITLE` varchar(50) NOT NULL,
  `NOTES` varchar(500) DEFAULT NULL,
  `ONLY_VIEW` int(11) DEFAULT NULL COMMENT '如果定义为只是显示，则业务库关联的静态数据项保存静态数据项的显示值而不是使用值',
  PRIMARY KEY (`FIELD_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sm_dictory_item
-- ----------------------------
INSERT INTO `sm_dictory_item` VALUES ('AUTH_LEVEL', '权限等级', '权限等级', '0');
INSERT INTO `sm_dictory_item` VALUES ('COMPARE', '比较符', '比较符', '0');
INSERT INTO `sm_dictory_item` VALUES ('DB_TYPE', '数据库', '数据库类型', '0');
INSERT INTO `sm_dictory_item` VALUES ('LANGUAGE', '系统语言', '系统语言', '0');
INSERT INTO `sm_dictory_item` VALUES ('SQL_TYPE', '数据库操作类型', '数据库操作类型', '0');
INSERT INTO `sm_dictory_item` VALUES ('STATE', '状态', '系统使用状态', '0');
INSERT INTO `sm_dictory_item` VALUES ('WIN_MODE', '窗口打开方式', '窗口打开方式', '0');

-- ----------------------------
-- Table structure for `sm_faq`
-- ----------------------------
DROP TABLE IF EXISTS `sm_faq`;
CREATE TABLE `sm_faq` (
  `FAQ_NO` varchar(40) NOT NULL,
  `PFAQ_NO` varchar(40) DEFAULT NULL,
  `SUBJECT` varchar(100) DEFAULT NULL,
  `CONTENT` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`FAQ_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sm_faq
-- ----------------------------

-- ----------------------------
-- Table structure for `sm_file_code`
-- ----------------------------
DROP TABLE IF EXISTS `sm_file_code`;
CREATE TABLE `sm_file_code` (
  `id` int(11) NOT NULL,
  `first_type` varchar(32) DEFAULT NULL,
  `second_type` varchar(32) DEFAULT NULL,
  `third_type` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='此表用来保存文件编号，当与文件相关联的记录尚未生成，但是提前上传了文件，就通过这个表记录文件编号，再把这个编号关联到相应';

-- ----------------------------
-- Records of sm_file_code
-- ----------------------------

-- ----------------------------
-- Table structure for `sm_fun`
-- ----------------------------
DROP TABLE IF EXISTS `sm_fun`;
CREATE TABLE `sm_fun` (
  `FUN_ID` varchar(20) NOT NULL,
  `WIN_ID` decimal(8,0) DEFAULT NULL COMMENT '窗口编号',
  `UP_FUN_ID` varchar(20) DEFAULT NULL,
  `FUN_NAME` varchar(32) DEFAULT NULL,
  `FUN_ENAME` varchar(100) DEFAULT NULL,
  `PARAM` varchar(200) DEFAULT NULL,
  `FUN_DESC` varchar(200) DEFAULT NULL,
  `LEVEL_INDEX` varchar(2) DEFAULT NULL,
  `STATE` varchar(2) DEFAULT NULL,
  `QUICK_TAB` varchar(32) DEFAULT NULL,
  `CHILD_COUNT` varchar(2) DEFAULT NULL,
  `CHILD_MAX_LEN` decimal(8,0) DEFAULT NULL,
  `ICO_NAME` varchar(30) DEFAULT NULL,
  `WIN_MODE` decimal(1,0) DEFAULT NULL,
  PRIMARY KEY (`FUN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sm_fun
-- ----------------------------
INSERT INTO `sm_fun` VALUES ('01', null, null, '框架平台', 'Framework', null, null, '99', '1', null, null, null, null, null);
INSERT INTO `sm_fun` VALUES ('0101', null, '01', '功能模块', '功能模块', null, '功能模块', '1', '1', null, null, null, null, null);
INSERT INTO `sm_fun` VALUES ('010101', '2', '0101', '模块维护', '模块维护', null, '模块维护', '1', '1', null, null, null, '21.gif', null);
INSERT INTO `sm_fun` VALUES ('010102', '3', '0101', '窗口维护', '窗口维护', null, '窗口维护', '2', '1', null, null, null, '173.gif', null);
INSERT INTO `sm_fun` VALUES ('010103', '4', '0101', '功能菜单', '功能菜单', null, '功能菜单', '3', '1', null, null, null, '172.gif', null);
INSERT INTO `sm_fun` VALUES ('010104', '5', '0101', '小图片', '小图片', null, '小图片', '4', '1', null, null, null, '83.gif', null);
INSERT INTO `sm_fun` VALUES ('0102', null, '01', '服务配置', '服务配置', null, '服务配置', '2', '1', null, null, null, null, null);
INSERT INTO `sm_fun` VALUES ('010201', '6', '0102', '国际化', '国际化', null, '国际化', '1', '1', null, null, null, '10.gif', null);
INSERT INTO `sm_fun` VALUES ('010202', null, '0102', '提示信息', '提示信息', null, '提示信息', '2', '1', null, null, null, '135.gif', null);
INSERT INTO `sm_fun` VALUES ('010203', '19', '0102', '语言设置', '语言设置', null, '语言设置', '3', '1', null, null, null, '104.gif', null);
INSERT INTO `sm_fun` VALUES ('010204', '20', '0102', '词条维护', '词条维护', null, '词条维护', '4', '1', null, null, null, '136.gif', null);
INSERT INTO `sm_fun` VALUES ('02', null, null, '系统管理', 'SystemManager', null, '系统管理', '98', '1', null, null, null, null, null);
INSERT INTO `sm_fun` VALUES ('0201', null, '02', '初始化', '初始化', null, '初始化', '1', '1', null, null, null, null, null);
INSERT INTO `sm_fun` VALUES ('020101', '15', '0201', '静态参数维护', '静态参数维护', null, '静态参数维护', '1', '1', null, null, null, '100.gif', null);
INSERT INTO `sm_fun` VALUES ('020102', '25', '0201', '项目参数维护', '项目参数维护', null, '项目参数维护', '2', '1', null, null, null, '148.gif', null);
INSERT INTO `sm_fun` VALUES ('020103', '17', '0201', 'FAQ维护', 'FAQ维护', null, 'FAQ维护', '3', '1', null, null, null, '144.gif', null);
INSERT INTO `sm_fun` VALUES ('0202', null, '02', '组织机构', '组织机构', null, '组织机构', '2', '1', null, null, null, null, null);
INSERT INTO `sm_fun` VALUES ('020201', '11', '0202', '区域', '区域', null, '区域', '1', '1', null, null, null, '110.gif', null);
INSERT INTO `sm_fun` VALUES ('020202', '12', '0202', '组织机构图', '组织机构图', null, '组织机构图', '2', '1', null, null, null, '125.gif', null);
INSERT INTO `sm_fun` VALUES ('020203', '13', '0202', '组织维护', '组织维护', null, '组织维护', '3', '1', null, null, null, '111.gif', null);
INSERT INTO `sm_fun` VALUES ('020204', '14', '0202', '群组设置', '群组设置', null, '群组设置', '4', '1', null, null, null, '126.gif', null);
INSERT INTO `sm_fun` VALUES ('0203', null, '02', '角色/权限', '角色/权限', null, '角色/权限', '3', '1', null, null, null, null, null);
INSERT INTO `sm_fun` VALUES ('020301', '1', '0203', '角色维护', '角色维护', null, '角色维护', '1', '1', null, null, null, '104.gif', null);
INSERT INTO `sm_fun` VALUES ('020302', '9', '0203', '角色功能', '角色功能', null, '角色功能', '2', '1', null, null, null, '101.gif', null);
INSERT INTO `sm_fun` VALUES ('020303', '10', '0203', '角色授权', '角色授权', null, '角色授权', '3', '1', null, null, null, '103.gif', null);
INSERT INTO `sm_fun` VALUES ('0204', null, '02', '系统日志', '系统日志', null, '系统日志', '4', '1', null, null, null, null, null);
INSERT INTO `sm_fun` VALUES ('020401', '7', '0204', '操作日志', '操作日志', null, '操作日志', '1', '1', null, null, null, '28.gif', null);
INSERT INTO `sm_fun` VALUES ('020402', '8', '0204', '错误日志', '错误日志', null, '错误日志', '2', '1', null, null, null, '71.gif', null);
INSERT INTO `sm_fun` VALUES ('020403', '27', '0204', 'SQL执行日志', 'SQL执行日志', null, 'SQL执行日志', '3', null, null, null, null, '79.gif', null);
INSERT INTO `sm_fun` VALUES ('0205', null, '02', '项目管理', '项目管理', null, '项目管理', '5', '1', null, null, null, null, null);
INSERT INTO `sm_fun` VALUES ('020501', '24', '0205', '项目设置', '项目设置', null, '项目设置', '1', '1', null, null, null, '145.gif', null);
INSERT INTO `sm_fun` VALUES ('03', null, null, '平台管理', '平台管理', null, '平台管理人员所有功能', '3', null, null, null, null, null, null);
INSERT INTO `sm_fun` VALUES ('0301', null, '03', '企业管理', '企业管理', null, '新增／查询企业用户', '1', null, null, null, null, '104.gif', null);
INSERT INTO `sm_fun` VALUES ('030101', '21', '0301', '企业列表', '企业列表', null, '企业列表', '1', null, null, null, null, '27.gif', null);
INSERT INTO `sm_fun` VALUES ('030102', null, '0301', '添加企业', '添加企业', null, '添加企业', '2', null, null, null, null, '192.gif', null);
INSERT INTO `sm_fun` VALUES ('030103', null, '0301', '企业通讯录', '企业通讯录', null, '企业通讯录', '3', null, null, null, null, '118.gif', null);
INSERT INTO `sm_fun` VALUES ('04', null, null, '用户管理中心', '用户管理中心', null, '企业用户所有功能', '4', null, null, null, null, null, null);
INSERT INTO `sm_fun` VALUES ('0401', null, '04', '部门管理', '部门管理', null, '部门管理', '1', null, null, null, null, null, null);
INSERT INTO `sm_fun` VALUES ('040101', '31', '0401', '部门列表', '部门列表', null, '部门列表', '1', null, null, null, null, '9.gif', null);
INSERT INTO `sm_fun` VALUES ('040102', '32', '0401', '添加部门', '添加部门', null, '添加部门', '2', null, null, null, null, '197.gif', null);
INSERT INTO `sm_fun` VALUES ('0402', null, '04', '人员管理', '人员管理', null, '人员管理', '2', null, null, null, null, null, null);
INSERT INTO `sm_fun` VALUES ('040201', '29', '0402', '人员列表', '人员列表', null, '人员列表', '1', null, null, null, null, '104.gif', null);
INSERT INTO `sm_fun` VALUES ('040202', '30', '0402', '添加人员', '添加人员', null, '添加人员', '2', null, null, null, null, '156.gif', null);
INSERT INTO `sm_fun` VALUES ('0403', null, '04', '项目管理', '项目管理', null, '项目管理', '3', null, null, null, null, null, null);
INSERT INTO `sm_fun` VALUES ('040301', null, '0403', '项目列表', '项目列表', null, '项目列表', '1', null, null, null, null, '203.gif', null);
INSERT INTO `sm_fun` VALUES ('040302', null, '0403', '添加项目', '添加项目', null, '添加项目', '2', null, null, null, null, '201.gif', null);
INSERT INTO `sm_fun` VALUES ('0404', null, '04', '报销流程管理', '报销流程管理', null, '报销流程管理', '4', null, null, null, null, null, null);
INSERT INTO `sm_fun` VALUES ('040401', null, '0404', '报销流程列表', '报销流程列表', null, '报销流程列表', '1', null, null, null, null, '225.gif', null);
INSERT INTO `sm_fun` VALUES ('040402', null, '0404', '添加报销流程', '添加报销流程', null, '添加报销流程', '2', null, null, null, null, '202.gif', null);
INSERT INTO `sm_fun` VALUES ('0405', null, '04', '权限管理', '权限管理', null, '权限管理', '5', null, null, null, null, null, null);
INSERT INTO `sm_fun` VALUES ('0406', null, '04', '考勤管理', '考勤管理', null, '考勤管理', '6', null, null, null, null, null, null);
INSERT INTO `sm_fun` VALUES ('040601', '33', '0406', '打卡时间列表', '打卡时间列表', null, '打卡时间列表', '1', null, null, null, null, '178.gif', null);
INSERT INTO `sm_fun` VALUES ('040602', '34', '0406', '新增打卡时间', '新增打卡时间', null, '新增打卡时间', '2', null, null, null, null, '69.gif', null);
INSERT INTO `sm_fun` VALUES ('040603', '35', '0406', '打卡记录', '打卡记录', null, '打卡记录', '3', null, null, null, null, '151.gif', null);
INSERT INTO `sm_fun` VALUES ('040604', '36', '0406', '请假记录', '请假记录', null, '请假记录', '4', null, null, null, null, '137.gif', null);
INSERT INTO `sm_fun` VALUES ('040605', '37', '0406', '假期设置', '假期设置', null, '假期设置', '5', null, null, null, null, '148.gif', null);
INSERT INTO `sm_fun` VALUES ('0407', null, '04', '会议室管理', '会议室管理', null, '会议室管理', '7', null, null, null, null, null, null);
INSERT INTO `sm_fun` VALUES ('040701', '22', '0407', '会议室列表', '会议室列表', null, '会议室列表', '1', null, null, null, null, '55.gif', null);
INSERT INTO `sm_fun` VALUES ('040702', '23', '0407', '添加会议室', '添加会议室', null, '添加会议室', '2', null, null, null, null, '71.gif', null);
INSERT INTO `sm_fun` VALUES ('040703', '28', '0407', '预定列表', '预定列表', null, '预定列表', '3', null, null, null, null, '157.gif', null);

-- ----------------------------
-- Table structure for `sm_group`
-- ----------------------------
DROP TABLE IF EXISTS `sm_group`;
CREATE TABLE `sm_group` (
  `GROUP_ID` varchar(10) NOT NULL,
  `GROUP_NAME` varchar(50) NOT NULL,
  `GROUP_CONF` varchar(1000) DEFAULT NULL,
  `IS_SQL` decimal(1,0) DEFAULT '0',
  `STAFF_NOS` varchar(1000) DEFAULT NULL,
  `SYS_GROUP` decimal(8,0) DEFAULT NULL,
  PRIMARY KEY (`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统群组表，如党员，团员等信息\r\n           系统群组（SYS_GROUP）：0:个人群组，1：系统';

-- ----------------------------
-- Records of sm_group
-- ----------------------------

-- ----------------------------
-- Table structure for `sm_log`
-- ----------------------------
DROP TABLE IF EXISTS `sm_log`;
CREATE TABLE `sm_log` (
  `LOG_ID` varchar(20) NOT NULL,
  `OPERATE_TYPE` varchar(200) DEFAULT NULL,
  `SITE_NO` varchar(20) DEFAULT NULL,
  `POSI_NO` varchar(20) DEFAULT NULL,
  `STAFF_NO` varchar(10) DEFAULT NULL,
  `CONTENT` varchar(1000) DEFAULT NULL,
  `LOG_TIME` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`LOG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='记录系统日志。如登陆、重要操作等';

-- ----------------------------
-- Records of sm_log
-- ----------------------------
INSERT INTO `sm_log` VALUES ('100', 'system.login', '10001', '10000', '10001', '登录系统', '2013-09-12 11:22:25');
INSERT INTO `sm_log` VALUES ('101', 'system.login', '', '', '10001', '登录系统', '2013-12-07 22:35:38');
INSERT INTO `sm_log` VALUES ('102', 'system.login', '', '', '10001', '登录系统', '2013-12-07 22:36:36');
INSERT INTO `sm_log` VALUES ('103', 'system.login', '', '', '10001', '登录系统', '2013-12-08 02:02:16');
INSERT INTO `sm_log` VALUES ('104', 'system.login', '', '', '10001', '登录系统', '2014-08-15 08:01:08');
INSERT INTO `sm_log` VALUES ('105', 'system.login', '', '', '10001', '登录系统', '2014-08-15 10:04:06');
INSERT INTO `sm_log` VALUES ('106', 'system.login', '', '', '10001', '登录系统', '2014-08-15 10:53:16');
INSERT INTO `sm_log` VALUES ('107', 'system.login', '', '', '10001', '登录系统', '2014-08-15 12:04:52');
INSERT INTO `sm_log` VALUES ('108', 'system.login', '', '', '10001', '登录系统', '2014-08-16 16:52:39');
INSERT INTO `sm_log` VALUES ('109', 'system.login', '', '', '10001', '登录系统', '2014-08-16 17:47:19');
INSERT INTO `sm_log` VALUES ('11', 'system.login', '', '', '10001', '登录系统', '2013-08-13 23:52:41');
INSERT INTO `sm_log` VALUES ('110', 'system.login', '', '', '10001', '登录系统', '2014-08-17 12:26:23');
INSERT INTO `sm_log` VALUES ('111', 'system.login', '', '', '10001', '登录系统', '2014-08-17 13:29:34');
INSERT INTO `sm_log` VALUES ('112', 'system.login', '', '', '10001', '登录系统', '2014-08-26 11:29:49');
INSERT INTO `sm_log` VALUES ('113', 'system.login', '', '', '10001', '登录系统', '2014-09-06 21:56:55');
INSERT INTO `sm_log` VALUES ('114', 'system.login', '', '', '10001', '登录系统', '2014-09-06 23:41:05');
INSERT INTO `sm_log` VALUES ('115', 'system.login', '', '', '10001', '登录系统', '2014-09-07 00:25:28');
INSERT INTO `sm_log` VALUES ('116', 'system.login', '', '', '10001', '登录系统', '2014-09-07 00:52:45');
INSERT INTO `sm_log` VALUES ('117', 'system.login', '', '', '10001', '登录系统', '2014-09-07 10:27:00');
INSERT INTO `sm_log` VALUES ('118', 'system.login', '', '', '10001', '登录系统', '2014-09-07 10:42:33');
INSERT INTO `sm_log` VALUES ('119', 'system.login', '', '', '10001', '登录系统', '2014-09-07 10:44:04');
INSERT INTO `sm_log` VALUES ('12', 'system.login', '', '', '10001', '登录系统', '2013-08-13 23:55:59');
INSERT INTO `sm_log` VALUES ('120', 'system.login', '', '', '10001', '登录系统', '2014-09-07 19:10:35');
INSERT INTO `sm_log` VALUES ('121', 'system.login', '', '', '10001', '登录系统', '2014-09-07 20:16:21');
INSERT INTO `sm_log` VALUES ('13', 'system.login', '', '', '10001', '登录系统', '2013-08-13 23:58:32');
INSERT INTO `sm_log` VALUES ('14', 'system.login', '', '', '10001', '登录系统', '2013-08-14 00:24:17');
INSERT INTO `sm_log` VALUES ('15', 'system.login', '', '', '10001', '登录系统', '2013-08-14 00:28:03');
INSERT INTO `sm_log` VALUES ('16', 'system.login', '', '', '10001', '登录系统', '2013-08-14 01:11:07');
INSERT INTO `sm_log` VALUES ('17', 'system.login', '', '', '10001', '登录系统', '2013-08-18 14:20:28');
INSERT INTO `sm_log` VALUES ('18', 'system.login', '', '', '10001', '登录系统', '2013-08-18 21:14:01');
INSERT INTO `sm_log` VALUES ('19', 'system.login', '', '', '10001', '登录系统', '2013-08-18 21:18:20');
INSERT INTO `sm_log` VALUES ('2', 'system.login', '', '', '10001', '登录系统', '2013-04-04 21:26:26');
INSERT INTO `sm_log` VALUES ('20', 'system.login', '', '', '10001', '登录系统', '2013-08-18 21:28:26');
INSERT INTO `sm_log` VALUES ('21', 'system.login', '', '', '10001', '登录系统', '2013-08-18 22:15:18');
INSERT INTO `sm_log` VALUES ('22', 'system.login', '', '', '10001', '登录系统', '2013-08-18 22:36:39');
INSERT INTO `sm_log` VALUES ('23', 'system.login', '', '', '10001', '登录系统', '2013-08-18 22:41:15');
INSERT INTO `sm_log` VALUES ('24', 'system.login', '', '', '10001', '登录系统', '2013-08-18 23:05:45');
INSERT INTO `sm_log` VALUES ('25', 'system.login', '', '', '10001', '登录系统', '2013-08-18 23:08:08');
INSERT INTO `sm_log` VALUES ('26', 'system.login', '', '', '10001', '登录系统', '2013-08-18 23:08:11');
INSERT INTO `sm_log` VALUES ('27', 'system.login', '', '', '10001', '登录系统', '2013-08-18 23:17:52');
INSERT INTO `sm_log` VALUES ('28', 'system.login', '', '', '10001', '登录系统', '2013-08-18 23:18:48');
INSERT INTO `sm_log` VALUES ('29', 'system.login', '', '', '10001', '登录系统', '2013-08-18 23:19:07');
INSERT INTO `sm_log` VALUES ('3', 'system.login', '', '', '10001', '登录系统', '2013-04-04 21:26:26');
INSERT INTO `sm_log` VALUES ('30', 'system.login', '', '', '10001', '登录系统', '2013-08-18 23:28:35');
INSERT INTO `sm_log` VALUES ('31', 'system.login', '', '', '10001', '登录系统', '2013-08-18 23:29:16');
INSERT INTO `sm_log` VALUES ('32', 'system.login', '', '', '10001', '登录系统', '2013-08-18 23:36:56');
INSERT INTO `sm_log` VALUES ('33', 'system.login', '', '', '10001', '登录系统', '2013-08-18 23:43:13');
INSERT INTO `sm_log` VALUES ('34', 'system.login', '', '', '10001', '登录系统', '2013-08-18 23:49:11');
INSERT INTO `sm_log` VALUES ('35', 'system.login', '', '', '10001', '登录系统', '2013-08-18 23:49:49');
INSERT INTO `sm_log` VALUES ('36', 'system.login', '', '', '10001', '登录系统', '2013-08-19 00:11:35');
INSERT INTO `sm_log` VALUES ('37', 'system.login', '', '', '10001', '登录系统', '2013-08-19 00:14:08');
INSERT INTO `sm_log` VALUES ('38', 'system.login', '', '', '10001', '登录系统', '2013-08-19 00:15:25');
INSERT INTO `sm_log` VALUES ('39', 'system.login', '', '', '10001', '登录系统', '2013-08-19 00:16:17');
INSERT INTO `sm_log` VALUES ('4', 'system.login', '', '', '10001', '登录系统', '2013-04-04 21:26:26');
INSERT INTO `sm_log` VALUES ('40', 'system.login', '', '', '10001', '登录系统', '2013-08-19 00:17:57');
INSERT INTO `sm_log` VALUES ('41', 'system.login', '', '', '10001', '登录系统', '2013-08-19 00:19:37');
INSERT INTO `sm_log` VALUES ('42', 'system.login', '', '', '10001', '登录系统', '2013-08-19 00:27:32');
INSERT INTO `sm_log` VALUES ('43', 'system.login', '', '', '10001', '登录系统', '2013-08-19 23:42:49');
INSERT INTO `sm_log` VALUES ('44', 'system.login', '', '', '10001', '登录系统', '2013-08-19 23:43:29');
INSERT INTO `sm_log` VALUES ('45', 'system.login', '', '', '10001', '登录系统', '2013-08-20 00:00:28');
INSERT INTO `sm_log` VALUES ('46', 'system.login', '', '', '10001', '登录系统', '2013-08-20 00:00:51');
INSERT INTO `sm_log` VALUES ('47', 'system.login', '', '', '10001', '登录系统', '2013-08-23 00:01:37');
INSERT INTO `sm_log` VALUES ('48', 'system.login', '', '', '10001', '登录系统', '2013-08-23 00:02:07');
INSERT INTO `sm_log` VALUES ('49', 'system.login', '', '', '10001', '登录系统', '2013-09-01 15:24:19');
INSERT INTO `sm_log` VALUES ('5', 'system.login', '', '', '10001', '登录系统', '2013-04-04 22:09:40');
INSERT INTO `sm_log` VALUES ('50', 'system.login', '', '', '10001', '登录系统', '2013-09-01 15:24:45');
INSERT INTO `sm_log` VALUES ('51', 'system.login', '', '', '10001', '登录系统', '2013-09-01 16:24:42');
INSERT INTO `sm_log` VALUES ('52', 'system.login', '', '', '10001', '登录系统', '2013-09-01 16:25:15');
INSERT INTO `sm_log` VALUES ('53', 'system.login', '', '', '10001', '登录系统', '2013-09-01 16:38:36');
INSERT INTO `sm_log` VALUES ('54', 'system.login', '', '', '10001', '登录系统', '2013-09-01 16:39:59');
INSERT INTO `sm_log` VALUES ('55', 'system.login', '', '', '10001', '登录系统', '2013-09-01 16:45:16');
INSERT INTO `sm_log` VALUES ('56', 'system.login', '', '', '10001', '登录系统', '2013-09-01 16:55:54');
INSERT INTO `sm_log` VALUES ('57', 'system.login', '', '', '10001', '登录系统', '2013-09-01 17:01:00');
INSERT INTO `sm_log` VALUES ('58', 'system.login', '', '', '10001', '登录系统', '2013-09-01 18:02:10');
INSERT INTO `sm_log` VALUES ('59', 'system.login', '', '', '10001', '登录系统', '2013-09-01 23:19:00');
INSERT INTO `sm_log` VALUES ('6', 'system.login', '', '', '10001', '登录系统', '2013-04-28 00:45:34');
INSERT INTO `sm_log` VALUES ('60', 'system.login', '', '', '10001', '登录系统', '2013-09-01 23:30:03');
INSERT INTO `sm_log` VALUES ('61', 'system.login', '', '', '10001', '登录系统', '2013-09-01 23:35:10');
INSERT INTO `sm_log` VALUES ('62', 'system.login', '', '', '10001', '登录系统', '2013-09-01 23:43:08');
INSERT INTO `sm_log` VALUES ('63', 'system.login', '', '', '10001', '登录系统', '2013-09-01 23:45:30');
INSERT INTO `sm_log` VALUES ('64', 'system.login', '', '', '10001', '登录系统', '2013-09-01 23:53:57');
INSERT INTO `sm_log` VALUES ('65', 'system.login', '', '', '10001', '登录系统', '2013-09-02 22:33:28');
INSERT INTO `sm_log` VALUES ('66', 'system.login', '', '', '10001', '登录系统', '2013-09-02 23:20:03');
INSERT INTO `sm_log` VALUES ('67', 'system.login', '', '', '10001', '登录系统', '2013-09-02 23:44:42');
INSERT INTO `sm_log` VALUES ('68', 'system.login', '', '', '10001', '登录系统', '2013-09-02 23:46:07');
INSERT INTO `sm_log` VALUES ('69', 'system.login', '', '', '10001', '登录系统', '2013-09-02 23:48:26');
INSERT INTO `sm_log` VALUES ('7', 'system.login', '', '', '10001', '登录系统', '2013-06-23 23:47:46');
INSERT INTO `sm_log` VALUES ('70', 'system.login', '', '', '10001', '登录系统', '2013-09-02 23:50:37');
INSERT INTO `sm_log` VALUES ('71', 'system.login', '', '', '10001', '登录系统', '2013-09-03 00:07:35');
INSERT INTO `sm_log` VALUES ('72', 'system.login', '', '', '10001', '登录系统', '2013-09-03 00:10:04');
INSERT INTO `sm_log` VALUES ('73', 'system.login', '', '', '10001', '登录系统', '2013-09-03 22:48:20');
INSERT INTO `sm_log` VALUES ('74', 'system.login', '', '', '10001', '登录系统', '2013-09-03 22:53:32');
INSERT INTO `sm_log` VALUES ('75', 'system.login', '', '', '10001', '登录系统', '2013-09-03 23:59:04');
INSERT INTO `sm_log` VALUES ('76', 'system.login', '', '', '10001', '登录系统', '2013-09-04 00:00:54');
INSERT INTO `sm_log` VALUES ('77', 'system.login', '', '', '10001', '登录系统', '2013-09-04 00:15:30');
INSERT INTO `sm_log` VALUES ('78', 'system.login', '', '', '10001', '登录系统', '2013-09-05 22:50:33');
INSERT INTO `sm_log` VALUES ('79', 'system.login', '', '', '10001', '登录系统', '2013-09-05 22:51:20');
INSERT INTO `sm_log` VALUES ('8', 'system.login', '', '', '10001', '登录系统', '2013-07-17 12:39:18');
INSERT INTO `sm_log` VALUES ('80', 'system.login', '', '', '10001', '登录系统', '2013-09-05 23:18:09');
INSERT INTO `sm_log` VALUES ('81', 'system.login', '', '', '10001', '登录系统', '2013-09-05 23:20:53');
INSERT INTO `sm_log` VALUES ('82', 'system.login', '', '', '10001', '登录系统', '2013-09-05 23:22:11');
INSERT INTO `sm_log` VALUES ('83', 'system.login', '', '', '10001', '登录系统', '2013-09-05 23:24:16');
INSERT INTO `sm_log` VALUES ('84', 'system.login', '', '', '10001', '登录系统', '2013-09-05 23:26:03');
INSERT INTO `sm_log` VALUES ('85', 'system.login', '', '', '10001', '登录系统', '2013-09-06 00:30:45');
INSERT INTO `sm_log` VALUES ('86', 'system.login', '', '', '10001', '登录系统', '2013-09-06 00:32:44');
INSERT INTO `sm_log` VALUES ('87', 'system.login', '', '', '10001', '登录系统', '2013-09-07 16:20:23');
INSERT INTO `sm_log` VALUES ('88', 'system.login', '', '', '10001', '登录系统', '2013-09-07 16:25:40');
INSERT INTO `sm_log` VALUES ('89', 'system.login', '', '', '10001', '登录系统', '2013-09-07 16:29:35');
INSERT INTO `sm_log` VALUES ('9', 'system.login', '', '', '10001', '登录系统', '2013-08-13 23:47:49');
INSERT INTO `sm_log` VALUES ('90', 'system.login', '', '', '10001', '登录系统', '2013-09-07 20:59:04');
INSERT INTO `sm_log` VALUES ('91', 'system.login', '', '', '10001', '登录系统', '2013-09-08 00:38:32');
INSERT INTO `sm_log` VALUES ('92', 'system.login', '', '', '10001', '登录系统', '2013-09-08 12:52:22');
INSERT INTO `sm_log` VALUES ('93', 'system.login', '', '', '10001', '登录系统', '2013-09-08 15:02:52');
INSERT INTO `sm_log` VALUES ('94', 'system.login', '', '', '10001', '登录系统', '2013-09-08 15:51:25');
INSERT INTO `sm_log` VALUES ('95', 'system.login', '', '', '10001', '登录系统', '2013-09-08 17:26:06');
INSERT INTO `sm_log` VALUES ('96', 'system.login', '', '', '10001', '登录系统', '2013-09-10 01:25:50');
INSERT INTO `sm_log` VALUES ('97', 'system.login', '', '', '10001', '登录系统', '2013-09-10 10:46:01');
INSERT INTO `sm_log` VALUES ('98', 'system.login', '', '', '10001', '登录系统', '2013-09-11 18:43:28');
INSERT INTO `sm_log` VALUES ('99', 'system.login', '10001', '10000', '10001', '登录系统', '2013-09-11 19:05:07');

-- ----------------------------
-- Table structure for `sm_moudle`
-- ----------------------------
DROP TABLE IF EXISTS `sm_moudle`;
CREATE TABLE `sm_moudle` (
  `MOUDLE_ID` decimal(8,0) NOT NULL,
  `MOUDLE_NAME` varchar(50) NOT NULL,
  `MOUDLE_BEGIN_TAB` varchar(10) DEFAULT NULL,
  `MOUDLE_DESC` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`MOUDLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='记录系统模块信息';

-- ----------------------------
-- Records of sm_moudle
-- ----------------------------
INSERT INTO `sm_moudle` VALUES ('101', '系统管理', 'SM_', '系统管理');
INSERT INTO `sm_moudle` VALUES ('102', '项目管理', 'PM', '项目管理');
INSERT INTO `sm_moudle` VALUES ('103', '项目管理', null, null);
INSERT INTO `sm_moudle` VALUES ('104', '项目管理', null, null);
INSERT INTO `sm_moudle` VALUES ('105', '项目管理', null, null);
INSERT INTO `sm_moudle` VALUES ('106', '项目管理', null, null);
INSERT INTO `sm_moudle` VALUES ('107', '项目管理', null, null);
INSERT INTO `sm_moudle` VALUES ('108', '项目管理', null, null);
INSERT INTO `sm_moudle` VALUES ('109', '项目管理', null, null);
INSERT INTO `sm_moudle` VALUES ('111', '项目管理', null, null);
INSERT INTO `sm_moudle` VALUES ('112', '项目管理', null, null);
INSERT INTO `sm_moudle` VALUES ('113', '项目管理', null, null);

-- ----------------------------
-- Table structure for `sm_position`
-- ----------------------------
DROP TABLE IF EXISTS `sm_position`;
CREATE TABLE `sm_position` (
  `POSI_NO` varchar(20) NOT NULL COMMENT '区域编码',
  `SITE_NO` varchar(20) DEFAULT NULL,
  `POSI_NAME` varchar(50) NOT NULL COMMENT '区域名称',
  `UP_POSI_NO` varchar(20) DEFAULT '0' COMMENT '区号',
  `DAY_WORK` varchar(500) DEFAULT NULL,
  `PART_WORK` varchar(500) DEFAULT NULL,
  `ASSISTANT_WORK` varchar(500) DEFAULT NULL,
  `ACCIDENT_WORK` varchar(500) DEFAULT NULL,
  `TEMPORAR_WORK` varchar(500) DEFAULT NULL,
  `STAFFNUMS` decimal(6,0) DEFAULT NULL,
  `STATE` decimal(1,0) DEFAULT NULL,
  `POSI_LEVEL` decimal(1,0) DEFAULT NULL,
  `COMM_POSI_NO` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`POSI_NO`),
  KEY `sm_position_common_position_fk` (`COMM_POSI_NO`),
  KEY `sm_position_site_fk` (`SITE_NO`),
  CONSTRAINT `sm_position_ibfk_1` FOREIGN KEY (`SITE_NO`) REFERENCES `sm_site` (`SITE_NO`),
  CONSTRAINT `sm_position_ibfk_2` FOREIGN KEY (`COMM_POSI_NO`) REFERENCES `sm_common_position` (`COMM_POSI_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='岗位表\r\n           岗位人员数限制:  0:无限制';

-- ----------------------------
-- Records of sm_position
-- ----------------------------
INSERT INTO `sm_position` VALUES ('10000', '1', '总经理', '0', null, null, null, null, null, null, '1', null, null);

-- ----------------------------
-- Table structure for `sm_position_role`
-- ----------------------------
DROP TABLE IF EXISTS `sm_position_role`;
CREATE TABLE `sm_position_role` (
  `ROLE_ID` varchar(8) DEFAULT NULL,
  `POSI_NO` varchar(20) DEFAULT NULL COMMENT '区域编码',
  `USE_STATE` char(1) DEFAULT NULL COMMENT '1有效0无效',
  `ASSIGN_STATE` char(1) DEFAULT NULL COMMENT '1有效0无效',
  KEY `sm_position_role_position_fk` (`POSI_NO`),
  CONSTRAINT `sm_position_role_ibfk_1` FOREIGN KEY (`POSI_NO`) REFERENCES `sm_position` (`POSI_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sm_position_role
-- ----------------------------
INSERT INTO `sm_position_role` VALUES ('10003', '10000', '1', '1');

-- ----------------------------
-- Table structure for `sm_position_role_copy`
-- ----------------------------
DROP TABLE IF EXISTS `sm_position_role_copy`;
CREATE TABLE `sm_position_role_copy` (
  `ROLE_ID` varchar(8) DEFAULT NULL,
  `POSI_NO` varchar(20) DEFAULT NULL COMMENT '区域编码',
  `USE_STATE` char(1) DEFAULT NULL COMMENT '1有效0无效',
  `ASSIGN_STATE` char(1) DEFAULT NULL COMMENT '1有效0无效',
  KEY `sm_position_role_position_fk` (`POSI_NO`),
  CONSTRAINT `sm_position_role_copy_ibfk_1` FOREIGN KEY (`POSI_NO`) REFERENCES `sm_position` (`POSI_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sm_position_role_copy
-- ----------------------------
INSERT INTO `sm_position_role_copy` VALUES ('10003', '10000', '1', '1');

-- ----------------------------
-- Table structure for `sm_refer_faq`
-- ----------------------------
DROP TABLE IF EXISTS `sm_refer_faq`;
CREATE TABLE `sm_refer_faq` (
  `FAQ_NO` varchar(40) DEFAULT NULL,
  `REFER_FAQ_NO` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sm_refer_faq
-- ----------------------------

-- ----------------------------
-- Table structure for `sm_role`
-- ----------------------------
DROP TABLE IF EXISTS `sm_role`;
CREATE TABLE `sm_role` (
  `ROLE_ID` varchar(8) NOT NULL,
  `BUREAU_NO` varchar(14) DEFAULT NULL,
  `ROLE_NAME` varchar(50) NOT NULL,
  `ROLE_DESC` varchar(64) DEFAULT NULL,
  `ROLE_BEGINTIME` varchar(20) DEFAULT NULL,
  `ROLE_ENDTIME` varchar(20) DEFAULT NULL,
  `STATE` decimal(1,0) DEFAULT NULL COMMENT '1有效0无效',
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sm_role
-- ----------------------------
INSERT INTO `sm_role` VALUES ('10001', '', '系统管理员', '123', '2011-12-19', '2999-12-30', '1');
INSERT INTO `sm_role` VALUES ('10002', '', '普通管理员', 'xxx', '2011-12-19', '2999-12-30', '1');
INSERT INTO `sm_role` VALUES ('10003', '', '企业管理员', '企业管理员', '2014-08-01', '2020-08-01', '1');

-- ----------------------------
-- Table structure for `sm_role_fun`
-- ----------------------------
DROP TABLE IF EXISTS `sm_role_fun`;
CREATE TABLE `sm_role_fun` (
  `ROLE_ID` varchar(8) NOT NULL,
  `FUN_ID` varchar(20) NOT NULL,
  `ROLE_TYPE` decimal(8,0) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`FUN_ID`,`ROLE_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='功能标示:1:功能 2:子功能';

-- ----------------------------
-- Records of sm_role_fun
-- ----------------------------
INSERT INTO `sm_role_fun` VALUES ('10001', '01', '1');
INSERT INTO `sm_role_fun` VALUES ('10001', '0101', '1');
INSERT INTO `sm_role_fun` VALUES ('10001', '010101', '1');
INSERT INTO `sm_role_fun` VALUES ('10001', '010102', '1');
INSERT INTO `sm_role_fun` VALUES ('10001', '010103', '1');
INSERT INTO `sm_role_fun` VALUES ('10001', '010104', '1');
INSERT INTO `sm_role_fun` VALUES ('10001', '0102', '1');
INSERT INTO `sm_role_fun` VALUES ('10001', '010201', '1');
INSERT INTO `sm_role_fun` VALUES ('10001', '010202', '1');
INSERT INTO `sm_role_fun` VALUES ('10001', '010203', '1');
INSERT INTO `sm_role_fun` VALUES ('10001', '010204', '1');
INSERT INTO `sm_role_fun` VALUES ('10001', '02', '1');
INSERT INTO `sm_role_fun` VALUES ('10001', '0201', '1');
INSERT INTO `sm_role_fun` VALUES ('10001', '020101', '1');
INSERT INTO `sm_role_fun` VALUES ('10001', '020102', '1');
INSERT INTO `sm_role_fun` VALUES ('10001', '020103', '1');
INSERT INTO `sm_role_fun` VALUES ('10001', '0202', '1');
INSERT INTO `sm_role_fun` VALUES ('10001', '020201', '1');
INSERT INTO `sm_role_fun` VALUES ('10001', '020202', '1');
INSERT INTO `sm_role_fun` VALUES ('10001', '020203', '1');
INSERT INTO `sm_role_fun` VALUES ('10001', '020204', '1');
INSERT INTO `sm_role_fun` VALUES ('10001', '0203', '1');
INSERT INTO `sm_role_fun` VALUES ('10001', '020301', '1');
INSERT INTO `sm_role_fun` VALUES ('10001', '020302', '1');
INSERT INTO `sm_role_fun` VALUES ('10001', '020303', '1');
INSERT INTO `sm_role_fun` VALUES ('10001', '0204', '1');
INSERT INTO `sm_role_fun` VALUES ('10001', '020401', '1');
INSERT INTO `sm_role_fun` VALUES ('10001', '020402', '1');
INSERT INTO `sm_role_fun` VALUES ('10001', '020403', '1');
INSERT INTO `sm_role_fun` VALUES ('10001', '0205', '1');
INSERT INTO `sm_role_fun` VALUES ('10001', '020501', '1');
INSERT INTO `sm_role_fun` VALUES ('10001', '03', '1');
INSERT INTO `sm_role_fun` VALUES ('10001', '0301', '1');
INSERT INTO `sm_role_fun` VALUES ('10001', '030101', '1');
INSERT INTO `sm_role_fun` VALUES ('10002', '02', '1');
INSERT INTO `sm_role_fun` VALUES ('10002', '0201', '1');
INSERT INTO `sm_role_fun` VALUES ('10002', '020101', '1');
INSERT INTO `sm_role_fun` VALUES ('10002', '020102', '1');
INSERT INTO `sm_role_fun` VALUES ('10002', '020103', '1');
INSERT INTO `sm_role_fun` VALUES ('10002', '0202', '1');
INSERT INTO `sm_role_fun` VALUES ('10002', '020201', '1');
INSERT INTO `sm_role_fun` VALUES ('10002', '020202', '1');
INSERT INTO `sm_role_fun` VALUES ('10002', '020203', '1');
INSERT INTO `sm_role_fun` VALUES ('10002', '020204', '1');
INSERT INTO `sm_role_fun` VALUES ('10002', '0203', '1');
INSERT INTO `sm_role_fun` VALUES ('10002', '020301', '1');
INSERT INTO `sm_role_fun` VALUES ('10002', '020302', '1');
INSERT INTO `sm_role_fun` VALUES ('10002', '020303', '1');
INSERT INTO `sm_role_fun` VALUES ('10002', '0204', '1');
INSERT INTO `sm_role_fun` VALUES ('10002', '020401', '1');
INSERT INTO `sm_role_fun` VALUES ('10002', '020402', '1');
INSERT INTO `sm_role_fun` VALUES ('10002', '0205', '1');
INSERT INTO `sm_role_fun` VALUES ('10002', '020501', '1');
INSERT INTO `sm_role_fun` VALUES ('10002', '03', '1');
INSERT INTO `sm_role_fun` VALUES ('10002', '0301', '1');
INSERT INTO `sm_role_fun` VALUES ('10002', '030101', '1');
INSERT INTO `sm_role_fun` VALUES ('10003', '04', '1');
INSERT INTO `sm_role_fun` VALUES ('10003', '0401', '1');
INSERT INTO `sm_role_fun` VALUES ('10003', '040101', '1');
INSERT INTO `sm_role_fun` VALUES ('10003', '040102', '1');
INSERT INTO `sm_role_fun` VALUES ('10003', '0402', '1');
INSERT INTO `sm_role_fun` VALUES ('10003', '040201', '1');
INSERT INTO `sm_role_fun` VALUES ('10003', '040202', '1');
INSERT INTO `sm_role_fun` VALUES ('10003', '0403', '1');
INSERT INTO `sm_role_fun` VALUES ('10003', '040301', '1');
INSERT INTO `sm_role_fun` VALUES ('10003', '040302', '1');
INSERT INTO `sm_role_fun` VALUES ('10003', '0404', '1');
INSERT INTO `sm_role_fun` VALUES ('10003', '040401', '1');
INSERT INTO `sm_role_fun` VALUES ('10003', '040402', '1');
INSERT INTO `sm_role_fun` VALUES ('10003', '0405', '1');
INSERT INTO `sm_role_fun` VALUES ('10003', '0406', '1');
INSERT INTO `sm_role_fun` VALUES ('10003', '040601', '1');
INSERT INTO `sm_role_fun` VALUES ('10003', '040602', '1');
INSERT INTO `sm_role_fun` VALUES ('10003', '040603', '1');
INSERT INTO `sm_role_fun` VALUES ('10003', '040604', '1');
INSERT INTO `sm_role_fun` VALUES ('10003', '040605', '1');
INSERT INTO `sm_role_fun` VALUES ('10003', '0407', '1');
INSERT INTO `sm_role_fun` VALUES ('10003', '040701', '1');
INSERT INTO `sm_role_fun` VALUES ('10003', '040702', '1');
INSERT INTO `sm_role_fun` VALUES ('10003', '040703', '1');

-- ----------------------------
-- Table structure for `sm_site`
-- ----------------------------
DROP TABLE IF EXISTS `sm_site`;
CREATE TABLE `sm_site` (
  `SITE_NO` varchar(20) NOT NULL,
  `BUREAU_NO` varchar(10) DEFAULT NULL COMMENT '区域编码',
  `SITE_NAME` varchar(64) DEFAULT NULL,
  `ADDR` varchar(128) DEFAULT NULL,
  `RELA_PHONE` varchar(64) DEFAULT NULL,
  `UP_SITE_NO` varchar(20) DEFAULT NULL,
  `STATE` varchar(2) DEFAULT NULL,
  `NOTES` varchar(4000) DEFAULT NULL,
  `POSI_NO` varchar(10) DEFAULT NULL,
  `DEPT_TYPE` decimal(1,0) DEFAULT NULL,
  `SITE_SEQ` decimal(8,0) DEFAULT NULL,
  `RTX_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`SITE_NO`),
  KEY `sm_site_org_fk` (`BUREAU_NO`),
  CONSTRAINT `sm_site_ibfk_1` FOREIGN KEY (`BUREAU_NO`) REFERENCES `sm_bureau` (`BUREAU_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sm_site
-- ----------------------------
INSERT INTO `sm_site` VALUES ('1', '10004', '总经办', null, null, null, null, null, null, null, null, null);
INSERT INTO `sm_site` VALUES ('10', '10006', '市场部', null, null, null, null, null, null, null, null, null);
INSERT INTO `sm_site` VALUES ('11', '10006', '研发部', null, null, null, null, null, null, null, null, null);
INSERT INTO `sm_site` VALUES ('12', '10006', '开发部', null, null, '11', null, null, null, null, null, null);
INSERT INTO `sm_site` VALUES ('13', '10006', '测试部', null, null, '11', null, null, null, null, null, null);
INSERT INTO `sm_site` VALUES ('2', '10004', '财务部', null, null, null, null, null, null, null, null, null);
INSERT INTO `sm_site` VALUES ('3', '10004', '市场部', null, null, null, null, null, null, null, null, null);
INSERT INTO `sm_site` VALUES ('4', '10004', '研发部', null, null, null, null, null, null, null, null, null);
INSERT INTO `sm_site` VALUES ('5', '10004', '开发部', null, null, '4', null, null, null, null, null, null);
INSERT INTO `sm_site` VALUES ('6', '10004', '测试部', null, null, '4', null, null, null, null, null, null);
INSERT INTO `sm_site` VALUES ('7', '10004', '123123', null, null, '3', null, null, null, null, null, null);
INSERT INTO `sm_site` VALUES ('8', '10006', '总经办', null, null, null, null, null, null, null, null, null);
INSERT INTO `sm_site` VALUES ('9', '10006', '财务部', null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `sm_staff`
-- ----------------------------
DROP TABLE IF EXISTS `sm_staff`;
CREATE TABLE `sm_staff` (
  `STAFF_NO` varchar(10) NOT NULL,
  `BUREAU_NO` varchar(20) DEFAULT NULL,
  `SITE_NO` varchar(20) DEFAULT NULL,
  `STAFF_NAME` varchar(16) DEFAULT NULL,
  `PASSWORD` varchar(100) DEFAULT NULL,
  `REAL_NAME` varchar(16) DEFAULT NULL,
  `TITLE_TYPE` varchar(50) DEFAULT NULL,
  `AUTH_LEVEL` char(2) DEFAULT NULL,
  `STATE` varchar(2) DEFAULT NULL,
  `MOBILE` varchar(11) DEFAULT NULL,
  `RELA_PHONE` varchar(64) DEFAULT NULL,
  `SEX` char(1) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `EXTEN_PHONE` varchar(10) DEFAULT NULL,
  `USE_SMS` decimal(1,0) DEFAULT NULL,
  `SMS_AVILID_DATE` varchar(20) DEFAULT NULL,
  `IS_SYS_USER` decimal(1,0) DEFAULT NULL,
  `STAFF_SEQ` decimal(8,0) DEFAULT NULL,
  `RTX_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`STAFF_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户：1是系统用户，0非系统用户。 系统用户就是可以用用户名、密码进行登陆的用户。状态: 0禁用 1启用 -1删除';

-- ----------------------------
-- Records of sm_staff
-- ----------------------------
INSERT INTO `sm_staff` VALUES ('10001', '', '0', 'system', '81DC9BDB52D04DC20036DBD8313ED055', '系统', null, null, null, '1', null, null, null, null, null, null, null, null, null);
INSERT INTO `sm_staff` VALUES ('10002', '', '0', 'tong', '81DC9BDB52D04DC20036DBD8313ED055', 'test', null, null, null, '1', null, null, null, null, null, null, null, null, null);
INSERT INTO `sm_staff` VALUES ('10003', '10004', '1', 'admin', 'E10ADC3949BA59ABBE56E057F20F883E', '超级管理员', null, null, null, '1', null, null, null, null, null, null, null, null, null);
INSERT INTO `sm_staff` VALUES ('10004', '10005', null, 'admin', 'E10ADC3949BA59ABBE56E057F20F883E', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sm_staff` VALUES ('10005', '10006', null, 'admin', 'E10ADC3949BA59ABBE56E057F20F883E', null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `sm_staff_config`
-- ----------------------------
DROP TABLE IF EXISTS `sm_staff_config`;
CREATE TABLE `sm_staff_config` (
  `STAFF_NO` varchar(10) NOT NULL,
  `PARAM_NAME` varchar(200) DEFAULT NULL,
  `PARAM_VALUE` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`STAFF_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='记录员工的个性化配置项,例如桌面配置/界面语言/菜单风格等等.';

-- ----------------------------
-- Records of sm_staff_config
-- ----------------------------

-- ----------------------------
-- Table structure for `sm_staff_position`
-- ----------------------------
DROP TABLE IF EXISTS `sm_staff_position`;
CREATE TABLE `sm_staff_position` (
  `STAFF_NO` varchar(20) DEFAULT NULL,
  `POSI_NO` varchar(20) DEFAULT NULL,
  `MAIN_POSI` int(11) DEFAULT NULL,
  KEY `sm_staff_position_staff_fk` (`STAFF_NO`),
  CONSTRAINT `sm_staff_position_ibfk_1` FOREIGN KEY (`STAFF_NO`) REFERENCES `sm_staff` (`STAFF_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='一个人员对应多个岗位。实现现实社会中的兼职、挂职的情况。';

-- ----------------------------
-- Records of sm_staff_position
-- ----------------------------
INSERT INTO `sm_staff_position` VALUES ('10003', '10000', null);

-- ----------------------------
-- Table structure for `sm_staff_role`
-- ----------------------------
DROP TABLE IF EXISTS `sm_staff_role`;
CREATE TABLE `sm_staff_role` (
  `STAFF_NO` varchar(6) NOT NULL,
  `ROLE_ID` varchar(8) DEFAULT NULL,
  `USE_STATE` char(1) DEFAULT NULL,
  `ASSIGN_STATE` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sm_staff_role
-- ----------------------------
INSERT INTO `sm_staff_role` VALUES ('10001', '10001', '1', '1');
INSERT INTO `sm_staff_role` VALUES ('10002', '10001', '1', '1');
INSERT INTO `sm_staff_role` VALUES ('10002', '10002', '1', '1');
INSERT INTO `sm_staff_role` VALUES ('10003', '10003', '1', '1');
INSERT INTO `sm_staff_role` VALUES ('10004', '10003', '1', '1');
INSERT INTO `sm_staff_role` VALUES ('10005', '10003', '1', '1');

-- ----------------------------
-- Table structure for `sm_staff_role_copy`
-- ----------------------------
DROP TABLE IF EXISTS `sm_staff_role_copy`;
CREATE TABLE `sm_staff_role_copy` (
  `STAFF_NO` varchar(6) NOT NULL,
  `ROLE_ID` varchar(8) DEFAULT NULL,
  `USE_STATE` char(1) DEFAULT NULL,
  `ASSIGN_STATE` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sm_staff_role_copy
-- ----------------------------
INSERT INTO `sm_staff_role_copy` VALUES ('10001', '10001', '1', '1');
INSERT INTO `sm_staff_role_copy` VALUES ('10002', '10001', '1', '1');
INSERT INTO `sm_staff_role_copy` VALUES ('10002', '10002', '1', '1');
INSERT INTO `sm_staff_role_copy` VALUES ('10003', '10003', '1', '1');

-- ----------------------------
-- Table structure for `sm_stockico`
-- ----------------------------
DROP TABLE IF EXISTS `sm_stockico`;
CREATE TABLE `sm_stockico` (
  `ICO_NAME` varchar(30) NOT NULL COMMENT 'ico_name'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工具条图片';

-- ----------------------------
-- Records of sm_stockico
-- ----------------------------

-- ----------------------------
-- Table structure for `sm_sub_fun`
-- ----------------------------
DROP TABLE IF EXISTS `sm_sub_fun`;
CREATE TABLE `sm_sub_fun` (
  `SUB_FUN_ID` varchar(5) NOT NULL,
  `SUB_FUN_NAME` varchar(64) DEFAULT NULL,
  `SUB_FUN_DESC` varchar(256) DEFAULT NULL,
  `STATE` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`SUB_FUN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sm_sub_fun
-- ----------------------------

-- ----------------------------
-- Table structure for `sm_window`
-- ----------------------------
DROP TABLE IF EXISTS `sm_window`;
CREATE TABLE `sm_window` (
  `WIN_ID` decimal(8,0) NOT NULL COMMENT '窗口编号',
  `WIN_TARGET` varchar(100) NOT NULL COMMENT '窗口链接',
  `WIN_DESC` varchar(100) DEFAULT NULL COMMENT '窗口说明',
  PRIMARY KEY (`WIN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='窗口表';

-- ----------------------------
-- Records of sm_window
-- ----------------------------
INSERT INTO `sm_window` VALUES ('1', 'system/role/RoleList.do', '角色维护');
INSERT INTO `sm_window` VALUES ('2', 'system/sm_moudle/SystemModel.do', '模块维护');
INSERT INTO `sm_window` VALUES ('3', 'system/window/SystemWindow.do', '窗口维护');
INSERT INTO `sm_window` VALUES ('4', 'system/fun/Fun.do', '功能菜单');
INSERT INTO `sm_window` VALUES ('5', 'system/icon/SystemIcon.do', '小图片维护');
INSERT INTO `sm_window` VALUES ('6', 'system/i18n/International.do', '国际化');
INSERT INTO `sm_window` VALUES ('7', 'system/log/sm/LogList.do', '操作日志');
INSERT INTO `sm_window` VALUES ('8', 'system/log/error/ErrorLog.do', '错误日志');
INSERT INTO `sm_window` VALUES ('9', 'system/role/RoleFun.do', '角色功能');
INSERT INTO `sm_window` VALUES ('10', 'system/grantrole/GrantRole.do', '角色授权');
INSERT INTO `sm_window` VALUES ('11', 'system/org/Bureau.do', '区域');
INSERT INTO `sm_window` VALUES ('12', 'system/org/OrgGraph.jsp', '组织机构图');
INSERT INTO `sm_window` VALUES ('13', 'system/org/OrgTree.jsp', '组织维护');
INSERT INTO `sm_window` VALUES ('14', 'system/org/OrgGroup.jsp', '群组设置');
INSERT INTO `sm_window` VALUES ('15', 'system/parameters/ParamList.do', '静态参数维护');
INSERT INTO `sm_window` VALUES ('16', 'system/parameters/ProjectParameter.jsp', '项目参数维护');
INSERT INTO `sm_window` VALUES ('17', 'system/help/Main.jsp', 'FAQ维护');
INSERT INTO `sm_window` VALUES ('18', 'system/pm/ProjectList.jsp', '项目设置');
INSERT INTO `sm_window` VALUES ('19', 'system/language/Language.do', '语言维护');
INSERT INTO `sm_window` VALUES ('20', 'system/lan_res_item/Item.do', '词条维护');
INSERT INTO `sm_window` VALUES ('21', 'mcnpage/platform/company/CompanyList.do', '企业列表');
INSERT INTO `sm_window` VALUES ('22', 'mcnpage/user/meetingroom/RoomList.do', '企业用户－会议室列表');
INSERT INTO `sm_window` VALUES ('23', 'mcnpage/user/meetingroom/add.do', '企业用户－添加会议室');
INSERT INTO `sm_window` VALUES ('24', 'system/project/ProjectList.do', '项目列表');
INSERT INTO `sm_window` VALUES ('25', 'system/project/params/ParamsList.do', '项目参数维护');
INSERT INTO `sm_window` VALUES ('26', 'system/parameters/value/ParamItems.do', '静态参数值列表');
INSERT INTO `sm_window` VALUES ('27', 'system/log/sql/SqlLog.do', 'SQL执行日志');
INSERT INTO `sm_window` VALUES ('28', 'mcnpage/user/meetingroom/book/BookList.do', '预定列表');
INSERT INTO `sm_window` VALUES ('29', 'mcnpage/user/member/MemberList.do', '企业用户－用户列表');
INSERT INTO `sm_window` VALUES ('30', 'mcnpage/user/member/add.do', '企业用户－添加用户');
INSERT INTO `sm_window` VALUES ('31', 'mcnpage/user/depart/DepartList.do', '企业用户－部门列表');
INSERT INTO `sm_window` VALUES ('32', 'mcnpage/user/depart/add.do', '企业用户--添加部门');
INSERT INTO `sm_window` VALUES ('33', 'mcnpage/user/punch/rule/PunchRuleList.do', '企业用户－打卡规则列表');
INSERT INTO `sm_window` VALUES ('34', 'mcnpage/user/punch/rule/add.do', '企业用户－添加打卡规则');
INSERT INTO `sm_window` VALUES ('35', 'mcnpage/user/punch/log/PunchLogList.do', '企业用户－打卡记录');
INSERT INTO `sm_window` VALUES ('36', 'mcnpage/user/punch/leave/LeaveList.do', '企业用户－请假记录');
INSERT INTO `sm_window` VALUES ('37', 'mcnpage/user/punch/rule/setting.do', '假期设置');
