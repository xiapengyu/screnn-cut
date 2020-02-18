/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50726
Source Host           : 127.0.0.1:3306
Source Database       : screen

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2020-02-18 16:56:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `sys_captcha`
-- ----------------------------
DROP TABLE IF EXISTS `sys_captcha`;
CREATE TABLE `sys_captcha` (
  `uuid` char(36) NOT NULL COMMENT 'uuid',
  `code` varchar(6) NOT NULL COMMENT '验证码',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统验证码';

-- ----------------------------
-- Records of sys_captcha
-- ----------------------------
INSERT INTO `sys_captcha` VALUES ('2bbc3ff7-db5e-4875-81c4-1db39719d9bb', '54f34', '2020-02-06 12:05:36');
INSERT INTO `sys_captcha` VALUES ('a241ce03-df2b-46f7-8354-301e67f2e186', 'by863', '2020-02-04 09:44:36');
INSERT INTO `sys_captcha` VALUES ('fdcbc030-d484-40bb-8020-e115d4e2ac63', 'dd24d', '2020-02-02 15:50:05');

-- ----------------------------
-- Table structure for `sys_config`
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `param_key` varchar(50) DEFAULT NULL COMMENT 'key',
  `param_value` varchar(2000) DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `param_key` (`param_key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统配置信息表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', 'CLOUD_STORAGE_CONFIG_KEY', '{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuBucketName\":\"ios-app\",\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"type\":1}', '0', '云存储配置信息');

-- ----------------------------
-- Table structure for `sys_dict_data`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_dict_type`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '1' COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1', 'admin', '保存菜单', 'com.yunjian.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":43,\"parentId\":0,\"name\":\"运营管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"job\",\"orderNum\":1}]', '97', '0:0:0:0:0:0:0:1', '2019-06-01 21:54:05');
INSERT INTO `sys_log` VALUES ('2', 'admin', '保存菜单', 'com.yunjian.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":44,\"parentId\":43,\"name\":\"充值记录\",\"url\":\"暂未开发\",\"perms\":\"\",\"type\":1,\"icon\":\"menu\",\"orderNum\":1}]', '155', '0:0:0:0:0:0:0:1', '2019-06-01 21:58:18');
INSERT INTO `sys_log` VALUES ('3', 'admin', '修改菜单', 'com.yunjian.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":1,\"parentId\":0,\"name\":\"系统管理\",\"type\":0,\"icon\":\"system\",\"orderNum\":99}]', '165', '0:0:0:0:0:0:0:1', '2019-06-02 12:26:35');
INSERT INTO `sys_log` VALUES ('4', 'admin', '保存菜单', 'com.yunjian.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":45,\"parentId\":43,\"name\":\"赠送规则列表\",\"url\":\"暂未开发\",\"perms\":\"donaterule:list\",\"type\":1,\"icon\":\"\",\"orderNum\":1}]', '145', '0:0:0:0:0:0:0:1', '2019-06-02 12:32:24');
INSERT INTO `sys_log` VALUES ('5', 'admin', '保存菜单', 'com.yunjian.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":46,\"parentId\":43,\"name\":\"赠送记录\",\"url\":\"暂未开发\",\"perms\":\"donaterecode:list\",\"type\":1,\"icon\":\"\",\"orderNum\":1}]', '41', '0:0:0:0:0:0:0:1', '2019-06-02 12:33:15');
INSERT INTO `sys_log` VALUES ('6', 'admin', '修改菜单', 'com.yunjian.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":45,\"parentId\":43,\"name\":\"赠送规则列表\",\"url\":\"暂未开发\",\"perms\":\"donaterule:list\",\"type\":1,\"icon\":\"menu\",\"orderNum\":1}]', '15', '0:0:0:0:0:0:0:1', '2019-06-02 12:33:50');
INSERT INTO `sys_log` VALUES ('7', 'admin', '修改菜单', 'com.yunjian.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":46,\"parentId\":43,\"name\":\"赠送记录\",\"url\":\"暂未开发\",\"perms\":\"donaterecode:list\",\"type\":1,\"icon\":\"menu\",\"orderNum\":1}]', '58', '0:0:0:0:0:0:0:1', '2019-06-02 12:34:02');
INSERT INTO `sys_log` VALUES ('8', 'admin', '保存菜单', 'com.yunjian.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":47,\"parentId\":0,\"name\":\"商品管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"menu\",\"orderNum\":2}]', '65', '0:0:0:0:0:0:0:1', '2019-06-02 12:36:33');
INSERT INTO `sys_log` VALUES ('9', 'admin', '保存菜单', 'com.yunjian.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":48,\"parentId\":47,\"name\":\"商品列表\",\"url\":\"暂未开发\",\"perms\":\"commodity:list\",\"type\":1,\"icon\":\"menu\",\"orderNum\":0}]', '48', '0:0:0:0:0:0:0:1', '2019-06-02 12:37:09');
INSERT INTO `sys_log` VALUES ('10', 'admin', '修改菜单', 'com.yunjian.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":48,\"parentId\":0,\"name\":\"商品列表\",\"url\":\"暂未开发\",\"perms\":\"commodity:list\",\"type\":1,\"icon\":\"menu\",\"orderNum\":3}]', '27', '0:0:0:0:0:0:0:1', '2019-06-02 12:38:03');
INSERT INTO `sys_log` VALUES ('11', 'admin', '修改菜单', 'com.yunjian.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":48,\"parentId\":0,\"name\":\"订单管理\",\"url\":\"暂未开发\",\"perms\":\"order:list\",\"type\":1,\"icon\":\"menu\",\"orderNum\":3}]', '38', '0:0:0:0:0:0:0:1', '2019-06-02 12:38:33');
INSERT INTO `sys_log` VALUES ('12', 'admin', '修改菜单', 'com.yunjian.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":47,\"parentId\":0,\"name\":\"商品管理\",\"url\":\"暂未开发\",\"perms\":\"commodity:list\",\"type\":1,\"icon\":\"menu\",\"orderNum\":2}]', '47', '0:0:0:0:0:0:0:1', '2019-06-02 12:38:55');
INSERT INTO `sys_log` VALUES ('13', 'admin', '保存菜单', 'com.yunjian.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":49,\"parentId\":0,\"name\":\"会员管理\",\"url\":\"暂未开发\",\"perms\":\"member:list\",\"type\":1,\"icon\":\"menu\",\"orderNum\":4}]', '71', '0:0:0:0:0:0:0:1', '2019-06-02 12:39:45');
INSERT INTO `sys_log` VALUES ('14', 'admin', '保存菜单', 'com.yunjian.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":50,\"parentId\":0,\"name\":\"统计报表\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"menu\",\"orderNum\":5}]', '39', '0:0:0:0:0:0:0:1', '2019-06-02 12:40:29');
INSERT INTO `sys_log` VALUES ('15', 'admin', '保存菜单', 'com.yunjian.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":51,\"parentId\":50,\"name\":\"订单报表\",\"url\":\"暂未开发\",\"perms\":\"report:list\",\"type\":1,\"icon\":\"menu\",\"orderNum\":6}]', '33', '0:0:0:0:0:0:0:1', '2019-06-02 12:41:41');
INSERT INTO `sys_log` VALUES ('16', 'admin', '保存菜单', 'com.yunjian.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":52,\"parentId\":50,\"name\":\"充值账单\",\"url\":\"暂未开发\",\"perms\":\"rechargebill:list\",\"type\":1,\"icon\":\"menu\",\"orderNum\":0}]', '80', '0:0:0:0:0:0:0:1', '2019-06-02 12:43:39');
INSERT INTO `sys_log` VALUES ('17', 'admin', '保存菜单', 'com.yunjian.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":53,\"parentId\":0,\"name\":\"设备管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"menu\",\"orderNum\":7}]', '32', '0:0:0:0:0:0:0:1', '2019-06-02 12:44:26');
INSERT INTO `sys_log` VALUES ('18', 'admin', '保存菜单', 'com.yunjian.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":54,\"parentId\":53,\"name\":\"设备列表\",\"url\":\"暂未开发\",\"perms\":\"device:list\",\"type\":1,\"icon\":\"menu\",\"orderNum\":0}]', '164', '0:0:0:0:0:0:0:1', '2019-06-02 12:44:58');
INSERT INTO `sys_log` VALUES ('19', 'admin', '保存菜单', 'com.yunjian.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":55,\"parentId\":53,\"name\":\"设备地图\",\"url\":\"暂未开发\",\"perms\":\"devicemap:list\",\"type\":1,\"icon\":\"menu\",\"orderNum\":1}]', '38', '0:0:0:0:0:0:0:1', '2019-06-02 12:45:23');
INSERT INTO `sys_log` VALUES ('20', 'admin', '保存菜单', 'com.yunjian.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":56,\"parentId\":53,\"name\":\"预警管理\",\"url\":\"暂未开发\",\"perms\":\"deviceworn:list\",\"type\":1,\"icon\":\"menu\",\"orderNum\":2}]', '22', '0:0:0:0:0:0:0:1', '2019-06-02 12:46:02');
INSERT INTO `sys_log` VALUES ('21', 'admin', '保存菜单', 'com.yunjian.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":57,\"parentId\":0,\"name\":\"二维码管理\",\"url\":\"暂未开发\",\"perms\":\"qrcode:list\",\"type\":1,\"icon\":\"menu\",\"orderNum\":8}]', '42', '0:0:0:0:0:0:0:1', '2019-06-02 12:47:00');
INSERT INTO `sys_log` VALUES ('22', 'admin', '保存菜单', 'com.yunjian.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":58,\"parentId\":0,\"name\":\"进销存管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"menu\",\"orderNum\":9}]', '27', '0:0:0:0:0:0:0:1', '2019-06-02 12:47:32');
INSERT INTO `sys_log` VALUES ('23', 'admin', '保存菜单', 'com.yunjian.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":59,\"parentId\":0,\"name\":\"到货明细\",\"url\":\"暂未开发\",\"perms\":\"daohuo:list\",\"type\":1,\"icon\":\"menu\",\"orderNum\":10}]', '13', '0:0:0:0:0:0:0:1', '2019-06-02 12:48:09');
INSERT INTO `sys_log` VALUES ('24', 'admin', '修改菜单', 'com.yunjian.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":59,\"parentId\":58,\"name\":\"到货明细\",\"url\":\"暂未开发\",\"perms\":\"daohuo:list\",\"type\":1,\"icon\":\"menu\",\"orderNum\":10}]', '8', '0:0:0:0:0:0:0:1', '2019-06-02 12:48:33');
INSERT INTO `sys_log` VALUES ('25', 'admin', '修改菜单', 'com.yunjian.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":59,\"parentId\":58,\"name\":\"到货明细\",\"url\":\"暂未开发\",\"perms\":\"daohuo:list\",\"type\":1,\"icon\":\"menu\",\"orderNum\":10}]', '902', '0:0:0:0:0:0:0:1', '2019-06-02 12:48:34');
INSERT INTO `sys_log` VALUES ('26', 'admin', '修改菜单', 'com.yunjian.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":59,\"parentId\":58,\"name\":\"到货明细\",\"url\":\"暂未开发\",\"perms\":\"daohuo:list\",\"type\":1,\"icon\":\"menu\",\"orderNum\":10}]', '8', '0:0:0:0:0:0:0:1', '2019-06-02 12:48:35');
INSERT INTO `sys_log` VALUES ('27', 'admin', '保存菜单', 'com.yunjian.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":60,\"parentId\":58,\"name\":\"送货明细\",\"url\":\"暂未开发\",\"perms\":\"songhuo:list\",\"type\":1,\"icon\":\"menu\",\"orderNum\":0}]', '33', '0:0:0:0:0:0:0:1', '2019-06-02 12:49:15');
INSERT INTO `sys_log` VALUES ('28', 'admin', '保存菜单', 'com.yunjian.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":61,\"parentId\":0,\"name\":\"配送管理\",\"url\":\"暂未开发\",\"perms\":\"delivery:\",\"type\":0,\"icon\":\"menu\",\"orderNum\":10}]', '5', '0:0:0:0:0:0:0:1', '2019-06-02 12:51:48');
INSERT INTO `sys_log` VALUES ('29', 'admin', '保存菜单', 'com.yunjian.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":62,\"parentId\":61,\"name\":\"配送记录\",\"url\":\"暂未开发\",\"perms\":\"deliveryrecord:list\",\"type\":1,\"icon\":\"menu\",\"orderNum\":0}]', '72', '0:0:0:0:0:0:0:1', '2019-06-02 12:52:26');
INSERT INTO `sys_log` VALUES ('30', 'admin', '保存菜单', 'com.yunjian.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":63,\"parentId\":61,\"name\":\"配送人员\",\"url\":\"暂未开发\",\"perms\":\"deliverypeople:list\",\"type\":1,\"icon\":\"menu\",\"orderNum\":1}]', '43', '0:0:0:0:0:0:0:1', '2019-06-02 12:52:46');
INSERT INTO `sys_log` VALUES ('31', 'admin', '保存菜单', 'com.yunjian.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":64,\"parentId\":0,\"name\":\"系统日志\",\"url\":\"暂未开发\",\"perms\":\"syslog:list\",\"type\":1,\"icon\":\"menu\",\"orderNum\":12}]', '48', '0:0:0:0:0:0:0:1', '2019-06-02 12:53:42');
INSERT INTO `sys_log` VALUES ('32', 'admin', '保存菜单', 'com.yunjian.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":65,\"parentId\":0,\"name\":\"广告管理\",\"url\":\"暂未开发\",\"perms\":\"ad:list\",\"type\":1,\"icon\":\"menu\",\"orderNum\":13}]', '8', '0:0:0:0:0:0:0:1', '2019-06-02 12:54:23');
INSERT INTO `sys_log` VALUES ('33', 'admin', '保存菜单', 'com.yunjian.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":66,\"parentId\":0,\"name\":\"工单管理\",\"url\":\"暂未开发\",\"perms\":\"wordorder:list\",\"type\":1,\"icon\":\"menu\",\"orderNum\":14}]', '14', '0:0:0:0:0:0:0:1', '2019-06-02 12:54:40');
INSERT INTO `sys_log` VALUES ('34', 'admin', '保存菜单', 'com.yunjian.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":67,\"parentId\":0,\"name\":\"后台预警管理\",\"url\":\"暂未开发\",\"perms\":\"sysworn:list\",\"type\":1,\"icon\":\"menu\",\"orderNum\":15}]', '64', '0:0:0:0:0:0:0:1', '2019-06-02 12:55:22');
INSERT INTO `sys_log` VALUES ('35', 'admin', '保存角色', 'com.yunjian.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":1,\"roleName\":\"系统管理员\",\"remark\":\"系统管理员\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,-666666],\"createTime\":\"Jun 2, 2019 4:48:38 PM\"}]', '1395', '0:0:0:0:0:0:0:1', '2019-06-02 16:48:40');
INSERT INTO `sys_log` VALUES ('36', 'admin', '删除菜单', 'com.yunjian.core.admin.SysMenuController.delete()', '[48]', '57', '127.0.0.1', '2020-01-20 16:59:06');
INSERT INTO `sys_log` VALUES ('37', 'admin', '删除菜单', 'com.yunjian.core.admin.SysMenuController.delete()', '[66]', '48', '127.0.0.1', '2020-01-20 16:59:24');
INSERT INTO `sys_log` VALUES ('38', 'admin', '删除菜单', 'com.yunjian.core.admin.SysMenuController.delete()', '[5]', '1', '127.0.0.1', '2020-01-20 16:59:45');
INSERT INTO `sys_log` VALUES ('39', 'admin', '删除菜单', 'com.yunjian.core.admin.SysMenuController.delete()', '[29]', '0', '127.0.0.1', '2020-01-20 16:59:53');
INSERT INTO `sys_log` VALUES ('40', 'admin', '删除菜单', 'com.yunjian.core.admin.SysMenuController.delete()', '[61]', '2', '127.0.0.1', '2020-01-20 17:04:14');
INSERT INTO `sys_log` VALUES ('41', 'admin', '删除菜单', 'com.yunjian.core.admin.SysMenuController.delete()', '[62]', '75', '127.0.0.1', '2020-01-20 17:04:18');
INSERT INTO `sys_log` VALUES ('42', 'admin', '删除菜单', 'com.yunjian.core.admin.SysMenuController.delete()', '[63]', '48', '127.0.0.1', '2020-01-20 17:04:25');
INSERT INTO `sys_log` VALUES ('43', 'admin', '删除菜单', 'com.yunjian.core.admin.SysMenuController.delete()', '[61]', '45', '127.0.0.1', '2020-01-20 17:04:31');
INSERT INTO `sys_log` VALUES ('44', 'admin', '删除菜单', 'com.yunjian.core.admin.SysMenuController.delete()', '[57]', '64', '127.0.0.1', '2020-01-20 17:04:36');
INSERT INTO `sys_log` VALUES ('45', 'admin', '删除菜单', 'com.yunjian.core.admin.SysMenuController.delete()', '[60]', '53', '127.0.0.1', '2020-01-20 17:04:50');
INSERT INTO `sys_log` VALUES ('46', 'admin', '删除菜单', 'com.yunjian.core.admin.SysMenuController.delete()', '[59]', '54', '127.0.0.1', '2020-01-20 17:04:56');
INSERT INTO `sys_log` VALUES ('47', 'admin', '删除菜单', 'com.yunjian.core.admin.SysMenuController.delete()', '[67]', '37', '127.0.0.1', '2020-01-20 17:05:04');
INSERT INTO `sys_log` VALUES ('48', 'admin', '删除菜单', 'com.yunjian.core.admin.SysMenuController.delete()', '[58]', '64', '127.0.0.1', '2020-01-20 17:05:09');
INSERT INTO `sys_log` VALUES ('49', 'admin', '删除菜单', 'com.yunjian.core.admin.SysMenuController.delete()', '[42]', '46', '127.0.0.1', '2020-01-20 17:05:21');
INSERT INTO `sys_log` VALUES ('50', 'admin', '删除菜单', 'com.yunjian.core.admin.SysMenuController.delete()', '[13]', '0', '127.0.0.1', '2020-01-20 17:05:25');
INSERT INTO `sys_log` VALUES ('51', 'admin', '修改菜单', 'com.yunjian.core.admin.SysMenuController.update()', '[{\"menuId\":43,\"parentId\":0,\"name\":\"经销商管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"menu\",\"orderNum\":1}]', '4', '0:0:0:0:0:0:0:1', '2020-01-30 15:13:49');
INSERT INTO `sys_log` VALUES ('52', 'admin', '删除菜单', 'com.yunjian.core.admin.SysMenuController.delete()', '[46]', '17', '0:0:0:0:0:0:0:1', '2020-01-30 15:14:08');
INSERT INTO `sys_log` VALUES ('53', 'admin', '修改菜单', 'com.yunjian.core.admin.SysMenuController.update()', '[{\"menuId\":44,\"parentId\":43,\"name\":\"设备列表\",\"url\":\"暂未开发\",\"perms\":\"\",\"type\":1,\"icon\":\"menu\",\"orderNum\":1}]', '7', '0:0:0:0:0:0:0:1', '2020-01-30 15:14:26');
INSERT INTO `sys_log` VALUES ('54', 'admin', '修改菜单', 'com.yunjian.core.admin.SysMenuController.update()', '[{\"menuId\":45,\"parentId\":43,\"name\":\"采购列表\",\"url\":\"暂未开发\",\"perms\":\"\",\"type\":1,\"icon\":\"menu\",\"orderNum\":1}]', '5', '0:0:0:0:0:0:0:1', '2020-01-30 15:14:44');
INSERT INTO `sys_log` VALUES ('55', 'admin', '修改菜单', 'com.yunjian.core.admin.SysMenuController.update()', '[{\"menuId\":45,\"parentId\":43,\"name\":\"采购列表\",\"url\":\"暂未开发\",\"perms\":\"\",\"type\":1,\"icon\":\"menu\",\"orderNum\":2}]', '5', '0:0:0:0:0:0:0:1', '2020-01-30 15:14:53');
INSERT INTO `sys_log` VALUES ('56', 'admin', '修改菜单', 'com.yunjian.core.admin.SysMenuController.update()', '[{\"menuId\":47,\"parentId\":0,\"name\":\"设备管理\",\"url\":\"暂未开发\",\"perms\":\"commodity:list\",\"type\":0,\"icon\":\"menu\",\"orderNum\":2}]', '3', '0:0:0:0:0:0:0:1', '2020-01-30 15:15:27');
INSERT INTO `sys_log` VALUES ('57', 'admin', '修改菜单', 'com.yunjian.core.admin.SysMenuController.update()', '[{\"menuId\":49,\"parentId\":0,\"name\":\"兑换码管理\",\"url\":\"暂未开发\",\"perms\":\"member:list\",\"type\":0,\"icon\":\"menu\",\"orderNum\":3}]', '3', '0:0:0:0:0:0:0:1', '2020-01-30 15:16:00');
INSERT INTO `sys_log` VALUES ('58', 'admin', '修改菜单', 'com.yunjian.core.admin.SysMenuController.update()', '[{\"menuId\":47,\"parentId\":0,\"name\":\"设备管理\",\"url\":\"暂未开发\",\"perms\":\"\",\"type\":1,\"icon\":\"menu\",\"orderNum\":2}]', '2', '0:0:0:0:0:0:0:1', '2020-01-30 15:16:14');
INSERT INTO `sys_log` VALUES ('59', 'admin', '修改菜单', 'com.yunjian.core.admin.SysMenuController.update()', '[{\"menuId\":47,\"parentId\":0,\"name\":\"设备管理\",\"url\":\"暂未开发\",\"perms\":\"\",\"type\":0,\"icon\":\"menu\",\"orderNum\":2}]', '3', '0:0:0:0:0:0:0:1', '2020-01-30 15:16:23');
INSERT INTO `sys_log` VALUES ('60', 'admin', '修改菜单', 'com.yunjian.core.admin.SysMenuController.update()', '[{\"menuId\":49,\"parentId\":0,\"name\":\"兑换码管理\",\"url\":\"暂未开发\",\"perms\":\"member:list\",\"type\":0,\"icon\":\"menu\",\"orderNum\":3}]', '3', '0:0:0:0:0:0:0:1', '2020-01-30 15:16:29');
INSERT INTO `sys_log` VALUES ('61', 'admin', '修改菜单', 'com.yunjian.core.admin.SysMenuController.update()', '[{\"menuId\":49,\"parentId\":0,\"name\":\"兑换码管理\",\"url\":\"暂未开发\",\"perms\":\"\",\"type\":0,\"icon\":\"menu\",\"orderNum\":3}]', '2', '0:0:0:0:0:0:0:1', '2020-01-30 15:16:46');
INSERT INTO `sys_log` VALUES ('62', 'admin', '修改菜单', 'com.yunjian.core.admin.SysMenuController.update()', '[{\"menuId\":50,\"parentId\":0,\"name\":\"客户管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"menu\",\"orderNum\":4}]', '2', '0:0:0:0:0:0:0:1', '2020-01-30 15:17:28');
INSERT INTO `sys_log` VALUES ('63', 'admin', '修改菜单', 'com.yunjian.core.admin.SysMenuController.update()', '[{\"menuId\":51,\"parentId\":50,\"name\":\"客户信息管理\",\"url\":\"暂未开发\",\"perms\":\"\",\"type\":0,\"icon\":\"menu\",\"orderNum\":1}]', '3', '0:0:0:0:0:0:0:1', '2020-01-30 15:17:59');
INSERT INTO `sys_log` VALUES ('64', 'admin', '修改菜单', 'com.yunjian.core.admin.SysMenuController.update()', '[{\"menuId\":52,\"parentId\":50,\"name\":\"客户采购需求管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"menu\",\"orderNum\":1}]', '4', '0:0:0:0:0:0:0:1', '2020-01-30 15:18:18');
INSERT INTO `sys_log` VALUES ('65', 'admin', '修改菜单', 'com.yunjian.core.admin.SysMenuController.update()', '[{\"menuId\":51,\"parentId\":50,\"name\":\"客户信息管理\",\"url\":\"暂未开发\",\"perms\":\"\",\"type\":1,\"icon\":\"menu\",\"orderNum\":1}]', '2', '0:0:0:0:0:0:0:1', '2020-01-30 15:19:05');
INSERT INTO `sys_log` VALUES ('66', 'admin', '修改菜单', 'com.yunjian.core.admin.SysMenuController.update()', '[{\"menuId\":52,\"parentId\":50,\"name\":\"客户采购需求管理\",\"url\":\"暂未开发\",\"perms\":\"\",\"type\":1,\"icon\":\"menu\",\"orderNum\":1}]', '3', '0:0:0:0:0:0:0:1', '2020-01-30 15:19:13');
INSERT INTO `sys_log` VALUES ('67', 'admin', '修改菜单', 'com.yunjian.core.admin.SysMenuController.update()', '[{\"menuId\":53,\"parentId\":0,\"name\":\"广告管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"menu\",\"orderNum\":8}]', '3', '0:0:0:0:0:0:0:1', '2020-01-30 15:19:37');
INSERT INTO `sys_log` VALUES ('68', 'admin', '修改菜单', 'com.yunjian.core.admin.SysMenuController.update()', '[{\"menuId\":53,\"parentId\":0,\"name\":\"广告管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"menu\",\"orderNum\":5}]', '2', '0:0:0:0:0:0:0:1', '2020-01-30 15:19:46');
INSERT INTO `sys_log` VALUES ('69', 'admin', '修改菜单', 'com.yunjian.core.admin.SysMenuController.update()', '[{\"menuId\":64,\"parentId\":0,\"name\":\"推送信息管理\",\"url\":\"暂未开发\",\"perms\":\"\",\"type\":0,\"icon\":\"menu\",\"orderNum\":1}]', '2', '0:0:0:0:0:0:0:1', '2020-01-30 15:20:28');
INSERT INTO `sys_log` VALUES ('70', 'admin', '修改菜单', 'com.yunjian.core.admin.SysMenuController.update()', '[{\"menuId\":65,\"parentId\":0,\"name\":\"品牌管理\",\"url\":\"暂未开发\",\"perms\":\"\",\"type\":0,\"icon\":\"menu\",\"orderNum\":13}]', '2', '0:0:0:0:0:0:0:1', '2020-01-30 15:20:43');
INSERT INTO `sys_log` VALUES ('71', 'admin', '修改菜单', 'com.yunjian.core.admin.SysMenuController.update()', '[{\"menuId\":64,\"parentId\":0,\"name\":\"推送信息管理\",\"url\":\"暂未开发\",\"perms\":\"\",\"type\":0,\"icon\":\"menu\",\"orderNum\":6}]', '2', '0:0:0:0:0:0:0:1', '2020-01-30 15:20:55');
INSERT INTO `sys_log` VALUES ('72', 'admin', '修改菜单', 'com.yunjian.core.admin.SysMenuController.update()', '[{\"menuId\":65,\"parentId\":0,\"name\":\"品牌管理\",\"url\":\"暂未开发\",\"perms\":\"\",\"type\":0,\"icon\":\"menu\",\"orderNum\":7}]', '2', '0:0:0:0:0:0:0:1', '2020-01-30 15:21:04');
INSERT INTO `sys_log` VALUES ('73', 'admin', '保存菜单', 'com.yunjian.core.admin.SysMenuController.save()', '[{\"menuId\":68,\"parentId\":65,\"name\":\"机型管理\",\"url\":\"暂未开发\",\"perms\":\"\",\"type\":1,\"icon\":\"menu\",\"orderNum\":1}]', '4', '0:0:0:0:0:0:0:1', '2020-01-30 15:21:34');
INSERT INTO `sys_log` VALUES ('74', 'admin', '修改菜单', 'com.yunjian.core.admin.SysMenuController.update()', '[{\"menuId\":54,\"parentId\":53,\"name\":\"广告信息管理\",\"url\":\"暂未开发\",\"perms\":\"\",\"type\":1,\"icon\":\"menu\",\"orderNum\":1}]', '3', '0:0:0:0:0:0:0:1', '2020-01-30 15:21:58');
INSERT INTO `sys_log` VALUES ('75', 'admin', '修改菜单', 'com.yunjian.core.admin.SysMenuController.update()', '[{\"menuId\":55,\"parentId\":53,\"name\":\"广告位管理\",\"url\":\"暂未开发\",\"perms\":\"\",\"type\":1,\"icon\":\"menu\",\"orderNum\":2}]', '3', '0:0:0:0:0:0:0:1', '2020-01-30 15:22:11');
INSERT INTO `sys_log` VALUES ('76', 'admin', '删除菜单', 'com.yunjian.core.admin.SysMenuController.delete()', '[56]', '4', '0:0:0:0:0:0:0:1', '2020-01-30 15:22:17');
INSERT INTO `sys_log` VALUES ('77', 'admin', '修改菜单', 'com.yunjian.core.admin.SysMenuController.update()', '[{\"menuId\":54,\"parentId\":53,\"name\":\"广告信息管理\",\"url\":\"ad/ad-info\",\"perms\":\"\",\"type\":1,\"icon\":\"menu\",\"orderNum\":1}]', '3', '0:0:0:0:0:0:0:1', '2020-01-30 15:23:06');
INSERT INTO `sys_log` VALUES ('78', 'admin', '修改菜单', 'com.yunjian.core.admin.SysMenuController.update()', '[{\"menuId\":55,\"parentId\":53,\"name\":\"广告位管理\",\"url\":\"ad/ad-position\",\"perms\":\"\",\"type\":1,\"icon\":\"menu\",\"orderNum\":2}]', '3', '0:0:0:0:0:0:0:1', '2020-01-30 15:23:18');
INSERT INTO `sys_log` VALUES ('79', 'admin', '修改菜单', 'com.yunjian.core.admin.SysMenuController.update()', '[{\"menuId\":68,\"parentId\":65,\"name\":\"机型管理\",\"url\":\"phone/phone-info\",\"perms\":\"\",\"type\":1,\"icon\":\"menu\",\"orderNum\":1}]', '2', '0:0:0:0:0:0:0:1', '2020-01-30 15:23:48');
INSERT INTO `sys_log` VALUES ('80', 'admin', '修改菜单', 'com.yunjian.core.admin.SysMenuController.update()', '[{\"menuId\":51,\"parentId\":50,\"name\":\"客户信息管理\",\"url\":\"account/account-info\",\"perms\":\"\",\"type\":1,\"icon\":\"menu\",\"orderNum\":1}]', '12', '0:0:0:0:0:0:0:1', '2020-01-30 15:57:07');
INSERT INTO `sys_log` VALUES ('81', 'admin', '修改菜单', 'com.yunjian.core.admin.SysMenuController.update()', '[{\"menuId\":64,\"parentId\":0,\"name\":\"推送信息管理\",\"url\":\"push/push-info\",\"perms\":\"\",\"type\":1,\"icon\":\"menu\",\"orderNum\":6}]', '5', '0:0:0:0:0:0:0:1', '2020-01-30 17:07:41');
INSERT INTO `sys_log` VALUES ('82', 'admin', '修改菜单', 'com.yunjian.core.admin.SysMenuController.update()', '[{\"menuId\":64,\"parentId\":0,\"name\":\"推送信息管理\",\"url\":\"push/push-info\",\"perms\":\"\",\"type\":1,\"icon\":\"menu\",\"orderNum\":6}]', '3', '0:0:0:0:0:0:0:1', '2020-01-30 17:08:34');
INSERT INTO `sys_log` VALUES ('83', 'admin', '修改菜单', 'com.yunjian.core.admin.SysMenuController.update()', '[{\"menuId\":64,\"parentId\":0,\"name\":\"推送信息管理\",\"url\":\"account/account-info\",\"perms\":\"\",\"type\":1,\"icon\":\"menu\",\"orderNum\":6}]', '3', '0:0:0:0:0:0:0:1', '2020-01-30 17:09:02');
INSERT INTO `sys_log` VALUES ('84', 'admin', '修改菜单', 'com.yunjian.core.admin.SysMenuController.update()', '[{\"menuId\":64,\"parentId\":0,\"name\":\"推送信息管理\",\"url\":\"push/push-info\",\"perms\":\"\",\"type\":1,\"icon\":\"menu\",\"orderNum\":6}]', '3', '0:0:0:0:0:0:0:1', '2020-01-30 17:09:25');
INSERT INTO `sys_log` VALUES ('85', 'admin', '保存菜单', 'com.yunjian.core.admin.SysMenuController.save()', '[{\"menuId\":69,\"parentId\":0,\"name\":\"商品管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"menu\",\"orderNum\":8}]', '7', '127.0.0.1', '2020-02-02 14:49:25');
INSERT INTO `sys_log` VALUES ('86', 'admin', '保存菜单', 'com.yunjian.core.admin.SysMenuController.save()', '[{\"menuId\":70,\"parentId\":69,\"name\":\"添加商品\",\"url\":\"暂未开发\",\"perms\":\"\",\"type\":1,\"icon\":\"menu\",\"orderNum\":1}]', '4', '0:0:0:0:0:0:0:1', '2020-02-02 14:50:55');
INSERT INTO `sys_log` VALUES ('87', 'admin', '保存菜单', 'com.yunjian.core.admin.SysMenuController.save()', '[{\"menuId\":71,\"parentId\":69,\"name\":\"商品列表\",\"url\":\"暂未开发\",\"perms\":\"\",\"type\":1,\"icon\":\"menu\",\"orderNum\":2}]', '3', '0:0:0:0:0:0:0:1', '2020-02-02 14:51:34');
INSERT INTO `sys_log` VALUES ('88', 'admin', '修改菜单', 'com.yunjian.core.admin.SysMenuController.update()', '[{\"menuId\":65,\"parentId\":0,\"name\":\"品牌管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"menu\",\"orderNum\":7}]', '13', '0:0:0:0:0:0:0:1', '2020-02-02 14:52:05');
INSERT INTO `sys_log` VALUES ('89', 'admin', '删除菜单', 'com.yunjian.core.admin.SysMenuController.delete()', '[70]', '17', '0:0:0:0:0:0:0:1', '2020-02-02 15:45:29');
INSERT INTO `sys_log` VALUES ('90', 'admin', '修改菜单', 'com.yunjian.core.admin.SysMenuController.update()', '[{\"menuId\":71,\"parentId\":69,\"name\":\"商品列表\",\"url\":\"goods/goods-info\",\"perms\":\"\",\"type\":1,\"icon\":\"menu\",\"orderNum\":1}]', '6', '0:0:0:0:0:0:0:1', '2020-02-02 15:45:49');
INSERT INTO `sys_log` VALUES ('91', 'admin', '修改菜单', 'com.yunjian.core.admin.SysMenuController.update()', '[{\"menuId\":71,\"parentId\":69,\"name\":\"商品信息管理\",\"url\":\"goods/goods-info\",\"perms\":\"\",\"type\":1,\"icon\":\"menu\",\"orderNum\":1}]', '5', '0:0:0:0:0:0:0:1', '2020-02-02 15:46:09');
INSERT INTO `sys_log` VALUES ('92', 'admin', '保存菜单', 'com.yunjian.core.admin.SysMenuController.save()', '[{\"menuId\":72,\"parentId\":43,\"name\":\"经销商列表\",\"url\":\"暂未开发\",\"perms\":\"\",\"type\":1,\"icon\":\"menu\",\"orderNum\":0}]', '6', '0:0:0:0:0:0:0:1', '2020-02-04 09:40:52');
INSERT INTO `sys_log` VALUES ('93', 'admin', '修改菜单', 'com.yunjian.core.admin.SysMenuController.update()', '[{\"menuId\":72,\"parentId\":43,\"name\":\"经销商列表\",\"url\":\"distributor/distributor-info\",\"perms\":\"\",\"type\":1,\"icon\":\"menu\",\"orderNum\":0}]', '5', '0:0:0:0:0:0:0:1', '2020-02-05 20:19:50');
INSERT INTO `sys_log` VALUES ('94', 'admin', '修改菜单', 'com.yunjian.core.admin.SysMenuController.update()', '[{\"menuId\":44,\"parentId\":43,\"name\":\"设备列表\",\"url\":\"device/device-info\",\"perms\":\"\",\"type\":1,\"icon\":\"menu\",\"orderNum\":1}]', '4', '0:0:0:0:0:0:0:1', '2020-02-05 20:20:28');
INSERT INTO `sys_log` VALUES ('95', 'admin', '删除菜单', 'com.yunjian.core.admin.SysMenuController.delete()', '[44]', '21', '0:0:0:0:0:0:0:1', '2020-02-05 21:09:28');
INSERT INTO `sys_log` VALUES ('96', 'admin', '修改菜单', 'com.yunjian.core.admin.SysMenuController.update()', '[{\"menuId\":47,\"parentId\":0,\"name\":\"设备管理\",\"url\":\"device/device-info\",\"perms\":\"\",\"type\":1,\"icon\":\"menu\",\"orderNum\":2}]', '3', '0:0:0:0:0:0:0:1', '2020-02-05 21:10:28');

-- ----------------------------
-- Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '系统管理', null, null, '0', 'system', '99');
INSERT INTO `sys_menu` VALUES ('2', '1', '管理员列表', 'sys/user', null, '1', 'admin', '1');
INSERT INTO `sys_menu` VALUES ('3', '1', '角色管理', 'sys/role', null, '1', 'role', '2');
INSERT INTO `sys_menu` VALUES ('4', '1', '菜单管理', 'sys/menu', null, '1', 'menu', '3');
INSERT INTO `sys_menu` VALUES ('15', '2', '查看', null, 'sys:user:list,sys:user:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('16', '2', '新增', null, 'sys:user:save,sys:role:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('17', '2', '修改', null, 'sys:user:update,sys:role:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('18', '2', '删除', null, 'sys:user:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('19', '3', '查看', null, 'sys:role:list,sys:role:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('20', '3', '新增', null, 'sys:role:save,sys:menu:list', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('21', '3', '修改', null, 'sys:role:update,sys:menu:list', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('22', '3', '删除', null, 'sys:role:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('23', '4', '查看', null, 'sys:menu:list,sys:menu:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('24', '4', '新增', null, 'sys:menu:save,sys:menu:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('25', '4', '修改', null, 'sys:menu:update,sys:menu:select', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('26', '4', '删除', null, 'sys:menu:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('27', '1', '参数管理', 'sys/config', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', '1', 'config', '6');
INSERT INTO `sys_menu` VALUES ('29', '1', '系统日志', 'sys/log', 'sys:log:list', '1', 'log', '7');
INSERT INTO `sys_menu` VALUES ('31', '1', '字典管理', 'sys/dictType', 'sys:dictType', '1', 'zonghe', '10');
INSERT INTO `sys_menu` VALUES ('32', '31', '字典分类查看', null, 'sys:dictType:list,sys:dictType:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('33', '31', '分类删除', null, 'sys:dictType:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('34', '31', '字典分类新增', null, 'sys:dictType:save', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('35', '31', '字典分类更新', null, 'sys:dictType:update', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('36', '31', '字典数据新增', null, 'sys:dictData:save', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('37', '31', '字典数据查看', null, 'sys:dictData:list,sys:dictData:info', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('38', '31', '字典数据更新', null, 'sys:dictData:update', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('39', '31', '字典数据删除', null, 'sys:dictData:delete', '2', null, '0');
INSERT INTO `sys_menu` VALUES ('43', '0', '经销商管理', '', '', '0', 'menu', '1');
INSERT INTO `sys_menu` VALUES ('45', '43', '采购列表', '暂未开发', '', '1', 'menu', '2');
INSERT INTO `sys_menu` VALUES ('47', '0', '设备管理', 'device/device-info', '', '1', 'menu', '2');
INSERT INTO `sys_menu` VALUES ('49', '0', '兑换码管理', '暂未开发', '', '0', 'menu', '3');
INSERT INTO `sys_menu` VALUES ('50', '0', '客户管理', '', '', '0', 'menu', '4');
INSERT INTO `sys_menu` VALUES ('51', '50', '客户信息管理', 'account/account-info', '', '1', 'menu', '1');
INSERT INTO `sys_menu` VALUES ('52', '50', '客户采购需求管理', '暂未开发', '', '1', 'menu', '1');
INSERT INTO `sys_menu` VALUES ('53', '0', '广告管理', '', '', '0', 'menu', '5');
INSERT INTO `sys_menu` VALUES ('54', '53', '广告信息管理', 'ad/ad-info', '', '1', 'menu', '1');
INSERT INTO `sys_menu` VALUES ('55', '53', '广告位管理', 'ad/ad-position', '', '1', 'menu', '2');
INSERT INTO `sys_menu` VALUES ('64', '0', '推送信息管理', 'push/push-info', '', '1', 'menu', '6');
INSERT INTO `sys_menu` VALUES ('65', '0', '品牌管理', '', '', '0', 'menu', '7');
INSERT INTO `sys_menu` VALUES ('68', '65', '机型管理', 'phone/phone-info', '', '1', 'menu', '1');
INSERT INTO `sys_menu` VALUES ('69', '0', '商品管理', '', '', '0', 'menu', '8');
INSERT INTO `sys_menu` VALUES ('71', '69', '商品信息管理', 'goods/goods-info', '', '1', 'menu', '1');
INSERT INTO `sys_menu` VALUES ('72', '43', '经销商列表', 'distributor/distributor-info', '', '1', 'menu', '0');

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '系统管理员', '系统管理员', '1', '2019-06-02 16:48:39');

-- ----------------------------
-- Table structure for `sys_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', '1', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '1', '2');
INSERT INTO `sys_role_menu` VALUES ('3', '1', '15');
INSERT INTO `sys_role_menu` VALUES ('4', '1', '16');
INSERT INTO `sys_role_menu` VALUES ('5', '1', '17');
INSERT INTO `sys_role_menu` VALUES ('6', '1', '18');
INSERT INTO `sys_role_menu` VALUES ('7', '1', '3');
INSERT INTO `sys_role_menu` VALUES ('8', '1', '19');
INSERT INTO `sys_role_menu` VALUES ('9', '1', '20');
INSERT INTO `sys_role_menu` VALUES ('10', '1', '21');
INSERT INTO `sys_role_menu` VALUES ('11', '1', '22');
INSERT INTO `sys_role_menu` VALUES ('12', '1', '4');
INSERT INTO `sys_role_menu` VALUES ('13', '1', '23');
INSERT INTO `sys_role_menu` VALUES ('14', '1', '24');
INSERT INTO `sys_role_menu` VALUES ('15', '1', '25');
INSERT INTO `sys_role_menu` VALUES ('16', '1', '26');
INSERT INTO `sys_role_menu` VALUES ('17', '1', '5');
INSERT INTO `sys_role_menu` VALUES ('18', '1', '6');
INSERT INTO `sys_role_menu` VALUES ('19', '1', '7');
INSERT INTO `sys_role_menu` VALUES ('20', '1', '8');
INSERT INTO `sys_role_menu` VALUES ('21', '1', '9');
INSERT INTO `sys_role_menu` VALUES ('22', '1', '10');
INSERT INTO `sys_role_menu` VALUES ('23', '1', '11');
INSERT INTO `sys_role_menu` VALUES ('24', '1', '12');
INSERT INTO `sys_role_menu` VALUES ('25', '1', '13');
INSERT INTO `sys_role_menu` VALUES ('26', '1', '14');
INSERT INTO `sys_role_menu` VALUES ('27', '1', '27');
INSERT INTO `sys_role_menu` VALUES ('28', '1', '29');
INSERT INTO `sys_role_menu` VALUES ('29', '1', '30');
INSERT INTO `sys_role_menu` VALUES ('30', '1', '31');
INSERT INTO `sys_role_menu` VALUES ('31', '1', '32');
INSERT INTO `sys_role_menu` VALUES ('32', '1', '33');
INSERT INTO `sys_role_menu` VALUES ('33', '1', '34');
INSERT INTO `sys_role_menu` VALUES ('34', '1', '35');
INSERT INTO `sys_role_menu` VALUES ('35', '1', '36');
INSERT INTO `sys_role_menu` VALUES ('36', '1', '37');
INSERT INTO `sys_role_menu` VALUES ('37', '1', '38');
INSERT INTO `sys_role_menu` VALUES ('38', '1', '39');
INSERT INTO `sys_role_menu` VALUES ('39', '1', '40');
INSERT INTO `sys_role_menu` VALUES ('40', '1', '41');
INSERT INTO `sys_role_menu` VALUES ('42', '1', '43');
INSERT INTO `sys_role_menu` VALUES ('44', '1', '45');
INSERT INTO `sys_role_menu` VALUES ('46', '1', '47');
INSERT INTO `sys_role_menu` VALUES ('48', '1', '49');
INSERT INTO `sys_role_menu` VALUES ('49', '1', '50');
INSERT INTO `sys_role_menu` VALUES ('50', '1', '51');
INSERT INTO `sys_role_menu` VALUES ('51', '1', '52');
INSERT INTO `sys_role_menu` VALUES ('52', '1', '53');
INSERT INTO `sys_role_menu` VALUES ('53', '1', '54');
INSERT INTO `sys_role_menu` VALUES ('54', '1', '55');
INSERT INTO `sys_role_menu` VALUES ('63', '1', '64');
INSERT INTO `sys_role_menu` VALUES ('64', '1', '65');
INSERT INTO `sys_role_menu` VALUES ('67', '1', '-666666');

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) DEFAULT NULL COMMENT '盐',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d', 'YzcmCZNvbXocrsz9dm8e', 'root@qq.com', '13612345678', '1', '1', '2016-11-11 11:11:11');

-- ----------------------------
-- Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_user_token`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_token`;
CREATE TABLE `sys_user_token` (
  `user_id` bigint(20) NOT NULL,
  `token` varchar(100) NOT NULL COMMENT 'token',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户Token';

-- ----------------------------
-- Records of sys_user_token
-- ----------------------------
INSERT INTO `sys_user_token` VALUES ('1', '9b059b21c29d002f5c4096035e678813', '2020-02-18 22:31:47', '2020-02-18 10:31:47');

-- ----------------------------
-- Table structure for `tb_account`
-- ----------------------------
DROP TABLE IF EXISTS `tb_account`;
CREATE TABLE `tb_account` (
  `id` int(10) NOT NULL,
  `email` varchar(64) NOT NULL COMMENT '邮箱',
  `password` varchar(128) NOT NULL COMMENT '密码',
  `avatar` varchar(256) DEFAULT NULL COMMENT '用户头像',
  `serial_no` varchar(128) NOT NULL COMMENT '机器序列码',
  `phone_model_id` int(10) DEFAULT NULL COMMENT '机型ID',
  `phone_model_name` varchar(255) DEFAULT NULL COMMENT '机型名称',
  `user_name` varchar(64) DEFAULT NULL COMMENT '用户名',
  `device_name` varchar(255) DEFAULT NULL COMMENT '设备名称',
  `use_amount` int(10) DEFAULT NULL COMMENT '已用次数',
  `unuse_amount` int(10) DEFAULT NULL COMMENT '未用次数',
  `status` int(2) DEFAULT NULL COMMENT '状态 1启用 0禁用',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '注册时间',
  `update_time` timestamp NULL DEFAULT NULL,
  `delete_flag` int(2) DEFAULT '1' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='APP用户账户表';

-- ----------------------------
-- Records of tb_account
-- ----------------------------
INSERT INTO `tb_account` VALUES ('1', '635642897@qq.com', '9dc63b007f7dc2ef6aae087920277c92', '', 'IMEI20109059', '1', 'HUWEI P30', '小地精', '贴膜切割机', '0', '1', '1', '2020-01-22 09:11:46', '2020-01-30 16:43:56', '1');

-- ----------------------------
-- Table structure for `tb_account_cache`
-- ----------------------------
DROP TABLE IF EXISTS `tb_account_cache`;
CREATE TABLE `tb_account_cache` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `account_id` int(10) NOT NULL,
  `token` varchar(128) NOT NULL,
  `account_info` text NOT NULL,
  `expire_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_account_cache
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_ad`
-- ----------------------------
DROP TABLE IF EXISTS `tb_ad`;
CREATE TABLE `tb_ad` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ad_image` varchar(255) DEFAULT NULL COMMENT '广告图片',
  `position_id` int(10) DEFAULT NULL COMMENT '广告位id',
  `position_name` varchar(255) DEFAULT NULL COMMENT '广告位名称',
  `sort_num` int(2) DEFAULT NULL COMMENT '排序码',
  `status` int(2) DEFAULT NULL COMMENT '状态 1启用 0禁用',
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  `delete_flag` int(2) DEFAULT NULL COMMENT '逻辑删除标记 1未删除 0已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_ad
-- ----------------------------
INSERT INTO `tb_ad` VALUES ('1', 'http://49.235.168.70:8085/upload/ad/734b5854234d404cb5cdb0dcc81cb49b.png', '1', '头部广告位', '1', '1', '2020-02-18 11:03:15', '2020-02-18 11:03:15', '1');

-- ----------------------------
-- Table structure for `tb_address`
-- ----------------------------
DROP TABLE IF EXISTS `tb_address`;
CREATE TABLE `tb_address` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `account_id` int(10) DEFAULT NULL COMMENT '用户id',
  `user_name` varchar(64) DEFAULT NULL COMMENT '收件人名称',
  `phone` varchar(32) DEFAULT NULL COMMENT '收件人联系方式',
  `province_id` int(11) DEFAULT NULL,
  `province_name` varchar(255) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `city_name` varchar(255) DEFAULT NULL,
  `district_id` int(11) DEFAULT NULL,
  `district_name` varchar(255) DEFAULT NULL,
  `address` varchar(512) DEFAULT NULL COMMENT '收件人详细地址',
  `is_default` int(2) DEFAULT '0' COMMENT '是否默认地址',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `delete_flag` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_address
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_ad_position`
-- ----------------------------
DROP TABLE IF EXISTS `tb_ad_position`;
CREATE TABLE `tb_ad_position` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '广告位名称',
  `status` int(2) DEFAULT NULL COMMENT '广告位状态 0禁用 1启用',
  `position_type` int(2) DEFAULT NULL COMMENT '广告位类型',
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  `delete_flag` int(2) DEFAULT NULL COMMENT '逻辑删除标记 1未删除 0已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_ad_position
-- ----------------------------
INSERT INTO `tb_ad_position` VALUES ('1', '头部广告位', '1', '1', '2020-01-30 15:27:11', '2020-01-30 15:27:11', '1');

-- ----------------------------
-- Table structure for `tb_device`
-- ----------------------------
DROP TABLE IF EXISTS `tb_device`;
CREATE TABLE `tb_device` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `serial_no` varchar(128) DEFAULT NULL COMMENT '机器序列号',
  `type` int(2) DEFAULT NULL COMMENT '类型 1不限次数 2有限次数',
  `distributor_id` int(10) DEFAULT NULL COMMENT '经销商id',
  `distributor_name` varchar(255) DEFAULT NULL COMMENT '经销商名称',
  `identifier` varchar(255) DEFAULT NULL COMMENT '经销商标识',
  `status` int(2) DEFAULT NULL COMMENT '状态 1正常 0禁用',
  `buy_time` timestamp NULL DEFAULT NULL COMMENT '购买时间',
  `email` varchar(255) DEFAULT NULL COMMENT '绑定邮箱',
  `remain_times` int(10) DEFAULT NULL COMMENT '剩余次数',
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  `delete_flag` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='设备信息表';

-- ----------------------------
-- Records of tb_device
-- ----------------------------
INSERT INTO `tb_device` VALUES ('3', 'NO123456789', '1', '4', '阿里巴巴', 'ERFDFDG87907898', '1', '2020-02-18 11:18:18', '4566666@qq.com', '100', '2020-02-18 11:18:18', '2020-02-18 11:18:18', '1');

-- ----------------------------
-- Table structure for `tb_distributor`
-- ----------------------------
DROP TABLE IF EXISTS `tb_distributor`;
CREATE TABLE `tb_distributor` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) DEFAULT NULL COMMENT '经销商名称',
  `address` varchar(255) DEFAULT NULL COMMENT '经销商地址',
  `contact` varchar(32) DEFAULT NULL COMMENT '经销商联系人',
  `phone` varchar(32) DEFAULT NULL COMMENT '经销商联系方式',
  `email` varchar(255) DEFAULT NULL COMMENT '经销商邮箱',
  `identifier` varchar(255) DEFAULT NULL COMMENT '经销商标识',
  `status` int(2) DEFAULT NULL COMMENT '状态 1正常  0禁用',
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  `delete_flag` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='经销商信息表';

-- ----------------------------
-- Records of tb_distributor
-- ----------------------------
INSERT INTO `tb_distributor` VALUES ('1', '百度', '广东省深圳市南山区', '李彦宏', '17855555555', '635642897@qq.com', 'ERFD345234234234', '1', '2020-02-05 20:47:33', '2020-02-05 21:05:10', '1');
INSERT INTO `tb_distributor` VALUES ('4', '阿里巴巴', '中国浙江杭州', '马云', '17588996541', '4566666@qq.com', 'ERFDFDG87907898', '1', '2020-02-18 11:17:16', '2020-02-18 11:17:16', '1');

-- ----------------------------
-- Table structure for `tb_email_code`
-- ----------------------------
DROP TABLE IF EXISTS `tb_email_code`;
CREATE TABLE `tb_email_code` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `email` varchar(128) NOT NULL,
  `code` varchar(32) NOT NULL,
  `expire_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  `delete_flag` int(2) NOT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_email_code
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_goods`
-- ----------------------------
DROP TABLE IF EXISTS `tb_goods`;
CREATE TABLE `tb_goods` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `comment` varchar(512) DEFAULT NULL COMMENT '商品介绍',
  `price` decimal(10,2) DEFAULT NULL COMMENT '原价',
  `is_discount` int(2) DEFAULT NULL COMMENT '是否打折',
  `discount_price` decimal(10,2) DEFAULT NULL COMMENT '折扣价',
  `sale_amount` int(10) DEFAULT NULL COMMENT '销量',
  `stock` int(10) DEFAULT NULL COMMENT '库存',
  `type` varchar(64) DEFAULT NULL COMMENT '商品类型ID 支持多类型 以逗号分割',
  `status` int(2) DEFAULT NULL COMMENT '状态 1上架 0下架',
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  `delete_flag` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='商品信息表';

-- ----------------------------
-- Records of tb_goods
-- ----------------------------
INSERT INTO `tb_goods` VALUES ('9', '小米贴膜', '小米贴膜', '12.00', '0', '0.00', '0', '1', '1,2', '1', '2020-02-02 22:55:25', '2020-02-02 22:55:25', '1');
INSERT INTO `tb_goods` VALUES ('10', '华为贴膜', '华为贴膜', '11.00', '1', '10.00', '0', '100', '2', '1', '2020-02-04 09:44:31', '2020-02-04 09:44:31', '1');

-- ----------------------------
-- Table structure for `tb_goods_cart`
-- ----------------------------
DROP TABLE IF EXISTS `tb_goods_cart`;
CREATE TABLE `tb_goods_cart` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) DEFAULT NULL COMMENT '商品名称',
  `amount` int(10) DEFAULT NULL COMMENT '商品数量',
  `total_price` decimal(10,2) DEFAULT NULL COMMENT '总价',
  `account_id` int(10) DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='购物车信息表';

-- ----------------------------
-- Records of tb_goods_cart
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_goods_img`
-- ----------------------------
DROP TABLE IF EXISTS `tb_goods_img`;
CREATE TABLE `tb_goods_img` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `goods_id` int(10) DEFAULT NULL COMMENT '商品id',
  `image_url` varchar(255) DEFAULT NULL COMMENT '图片URL',
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  `delete_flag` int(2) DEFAULT NULL COMMENT '逻辑删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='商品图片表';

-- ----------------------------
-- Records of tb_goods_img
-- ----------------------------
INSERT INTO `tb_goods_img` VALUES ('1', '10', 'http://49.235.168.70:8085/upload/ad/4f47ee3826354b92886d9ceb547ee530.png', '2020-02-04 09:44:31', '2020-02-04 09:44:31', '1');

-- ----------------------------
-- Table structure for `tb_goods_type`
-- ----------------------------
DROP TABLE IF EXISTS `tb_goods_type`;
CREATE TABLE `tb_goods_type` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '手机膜类型(钢化膜，磨砂膜等，初始化数据)',
  `delete_flag` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='手机膜类型表';

-- ----------------------------
-- Records of tb_goods_type
-- ----------------------------
INSERT INTO `tb_goods_type` VALUES ('1', '钢化膜', '1');
INSERT INTO `tb_goods_type` VALUES ('2', '磨砂膜', '1');
INSERT INTO `tb_goods_type` VALUES ('3', '普通膜', '1');
INSERT INTO `tb_goods_type` VALUES ('4', '橡胶膜', '1');

-- ----------------------------
-- Table structure for `tb_message_center`
-- ----------------------------
DROP TABLE IF EXISTS `tb_message_center`;
CREATE TABLE `tb_message_center` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `account_id` int(10) DEFAULT NULL COMMENT '用户id',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `content` varchar(512) DEFAULT NULL COMMENT '内容',
  `is_read` int(2) DEFAULT NULL COMMENT '已读标记 0未读 1已读',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `delete_flag` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户消息表';

-- ----------------------------
-- Records of tb_message_center
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_phone_model`
-- ----------------------------
DROP TABLE IF EXISTS `tb_phone_model`;
CREATE TABLE `tb_phone_model` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `phone_image` varchar(255) DEFAULT NULL COMMENT '手机图片',
  `phone_brand` varchar(255) DEFAULT NULL COMMENT '手机品牌',
  `phone_model` varchar(255) DEFAULT NULL COMMENT '手机型号',
  `sort_num` int(2) DEFAULT NULL COMMENT '排序码',
  `status` int(2) DEFAULT NULL COMMENT '状态 1正常 0禁用',
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `delete_flag` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_phone_model
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_purchase_detail`
-- ----------------------------
DROP TABLE IF EXISTS `tb_purchase_detail`;
CREATE TABLE `tb_purchase_detail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(64) DEFAULT NULL COMMENT '采购单编号',
  `goods_id` int(10) DEFAULT NULL COMMENT '商品id',
  `amount` int(10) DEFAULT NULL COMMENT '数量',
  `unit_price` decimal(10,2) DEFAULT NULL COMMENT '单价',
  `price` decimal(10,2) DEFAULT NULL COMMENT '总价',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采购订单详情表';

-- ----------------------------
-- Records of tb_purchase_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_purchase_order`
-- ----------------------------
DROP TABLE IF EXISTS `tb_purchase_order`;
CREATE TABLE `tb_purchase_order` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(64) DEFAULT NULL COMMENT '采购单编号',
  `comment` varchar(255) DEFAULT NULL COMMENT '备注',
  `account_id` int(10) DEFAULT NULL COMMENT '用户id',
  `status` int(2) DEFAULT NULL COMMENT '状态，预留字段',
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  `delete_flag` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采购订单信息表';

-- ----------------------------
-- Records of tb_purchase_order
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_push_msg`
-- ----------------------------
DROP TABLE IF EXISTS `tb_push_msg`;
CREATE TABLE `tb_push_msg` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '推送消息主体',
  `content` varchar(516) DEFAULT NULL COMMENT '推送消息内容',
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  `push_time` timestamp NULL DEFAULT NULL COMMENT '推送时间',
  `delete_flag` int(2) DEFAULT NULL COMMENT '逻辑删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='推送消息管理表';

-- ----------------------------
-- Records of tb_push_msg
-- ----------------------------
INSERT INTO `tb_push_msg` VALUES ('4', '啊啊啊啊', '啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊', '2020-01-30 17:33:34', '2020-01-30 17:33:34', null, '1');
INSERT INTO `tb_push_msg` VALUES ('5', '小三', '小三小三小三小三小三小三小三', '2020-01-30 17:33:53', '2020-02-04 10:16:12', null, '1');

-- ----------------------------
-- Table structure for `tb_push_record`
-- ----------------------------
DROP TABLE IF EXISTS `tb_push_record`;
CREATE TABLE `tb_push_record` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `msg_id` int(10) NOT NULL COMMENT '推送消息id',
  `account_id` int(10) NOT NULL COMMENT '接收推送消息的用户',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息推送记录表';

-- ----------------------------
-- Records of tb_push_record
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_region`
-- ----------------------------
DROP TABLE IF EXISTS `tb_region`;
CREATE TABLE `tb_region` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '行政区域id',
  `name` varchar(32) DEFAULT NULL COMMENT '行政区域名称',
  `parent_id` varchar(32) DEFAULT NULL COMMENT '上级行政区域id',
  `short_name` varchar(32) DEFAULT NULL COMMENT '简称',
  `level_type` smallint(2) DEFAULT NULL COMMENT '级别2省份3市区4区县',
  `city_code` varchar(10) DEFAULT NULL,
  `zip_code` varchar(10) DEFAULT NULL COMMENT '邮编',
  `merge_name` varchar(256) DEFAULT NULL,
  `pinyin` varchar(32) DEFAULT NULL,
  `lng` varchar(32) DEFAULT NULL COMMENT '经度',
  `lat` varchar(32) DEFAULT NULL COMMENT '纬度',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=820302 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_region
-- ----------------------------
INSERT INTO `tb_region` VALUES ('110000', '北京', '100004', '北京', '2', '', '', '中国,北京', 'Beijing', '116.405285', '39.904989');
INSERT INTO `tb_region` VALUES ('110100', '北京市', '110000', '北京', '3', '010', '100000', '中国,北京,北京市', 'Beijing', '116.405285', '39.904989');
INSERT INTO `tb_region` VALUES ('110101', '东城区', '110100', '东城', '4', '010', '100010', '中国,北京,北京市,东城区', 'Dongcheng', '116.41005', '39.93157');
INSERT INTO `tb_region` VALUES ('110102', '西城区', '110100', '西城', '4', '010', '100032', '中国,北京,北京市,西城区', 'Xicheng', '116.36003', '39.9305');
INSERT INTO `tb_region` VALUES ('110105', '朝阳区', '110100', '朝阳', '4', '010', '100020', '中国,北京,北京市,朝阳区', 'Chaoyang', '116.48548', '39.9484');
INSERT INTO `tb_region` VALUES ('110106', '丰台区', '110100', '丰台', '4', '010', '100071', '中国,北京,北京市,丰台区', 'Fengtai', '116.28625', '39.8585');
INSERT INTO `tb_region` VALUES ('110107', '石景山区', '110100', '石景山', '4', '010', '100043', '中国,北京,北京市,石景山区', 'Shijingshan', '116.2229', '39.90564');
INSERT INTO `tb_region` VALUES ('110108', '海淀区', '110100', '海淀', '4', '010', '100089', '中国,北京,北京市,海淀区', 'Haidian', '116.29812', '39.95931');
INSERT INTO `tb_region` VALUES ('110109', '门头沟区', '110100', '门头沟', '4', '010', '102300', '中国,北京,北京市,门头沟区', 'Mentougou', '116.10137', '39.94043');
INSERT INTO `tb_region` VALUES ('110111', '房山区', '110100', '房山', '4', '010', '102488', '中国,北京,北京市,房山区', 'Fangshan', '116.14257', '39.74786');
INSERT INTO `tb_region` VALUES ('110112', '通州区', '110100', '通州', '4', '010', '101149', '中国,北京,北京市,通州区', 'Tongzhou', '116.65716', '39.90966');
INSERT INTO `tb_region` VALUES ('110113', '顺义区', '110100', '顺义', '4', '010', '101300', '中国,北京,北京市,顺义区', 'Shunyi', '116.65417', '40.1302');
INSERT INTO `tb_region` VALUES ('110114', '昌平区', '110100', '昌平', '4', '010', '102200', '中国,北京,北京市,昌平区', 'Changping', '116.2312', '40.22072');
INSERT INTO `tb_region` VALUES ('110115', '大兴区', '110100', '大兴', '4', '010', '102600', '中国,北京,北京市,大兴区', 'Daxing', '116.34149', '39.72668');
INSERT INTO `tb_region` VALUES ('110116', '怀柔区', '110100', '怀柔', '4', '010', '101400', '中国,北京,北京市,怀柔区', 'Huairou', '116.63168', '40.31602');
INSERT INTO `tb_region` VALUES ('110117', '平谷区', '110100', '平谷', '4', '010', '101200', '中国,北京,北京市,平谷区', 'Pinggu', '117.12133', '40.14056');
INSERT INTO `tb_region` VALUES ('110228', '密云县', '110100', '密云', '4', '010', '101500', '中国,北京,北京市,密云县', 'Miyun', '116.84295', '40.37618');
INSERT INTO `tb_region` VALUES ('110229', '延庆县', '110100', '延庆', '4', '010', '102100', '中国,北京,北京市,延庆县', 'Yanqing', '115.97494', '40.45672');
INSERT INTO `tb_region` VALUES ('120000', '天津', '100004', '天津', '2', '', '', '中国,天津', 'Tianjin', '117.190182', '39.125596');
INSERT INTO `tb_region` VALUES ('120100', '天津市', '120000', '天津', '3', '022', '300000', '中国,天津,天津市', 'Tianjin', '117.190182', '39.125596');
INSERT INTO `tb_region` VALUES ('120101', '和平区', '120100', '和平', '4', '022', '300041', '中国,天津,天津市,和平区', 'Heping', '117.21456', '39.11718');
INSERT INTO `tb_region` VALUES ('120102', '河东区', '120100', '河东', '4', '022', '300171', '中国,天津,天津市,河东区', 'Hedong', '117.22562', '39.12318');
INSERT INTO `tb_region` VALUES ('120103', '河西区', '120100', '河西', '4', '022', '300202', '中国,天津,天津市,河西区', 'Hexi', '117.22327', '39.10959');
INSERT INTO `tb_region` VALUES ('120104', '南开区', '120100', '南开', '4', '022', '300110', '中国,天津,天津市,南开区', 'Nankai', '117.15074', '39.13821');
INSERT INTO `tb_region` VALUES ('120105', '河北区', '120100', '河北', '4', '022', '300143', '中国,天津,天津市,河北区', 'Hebei', '117.19697', '39.14816');
INSERT INTO `tb_region` VALUES ('120106', '红桥区', '120100', '红桥', '4', '022', '300131', '中国,天津,天津市,红桥区', 'Hongqiao', '117.15145', '39.16715');
INSERT INTO `tb_region` VALUES ('120110', '东丽区', '120100', '东丽', '4', '022', '300300', '中国,天津,天津市,东丽区', 'Dongli', '117.31436', '39.0863');
INSERT INTO `tb_region` VALUES ('120111', '西青区', '120100', '西青', '4', '022', '300380', '中国,天津,天津市,西青区', 'Xiqing', '117.00927', '39.14123');
INSERT INTO `tb_region` VALUES ('120112', '津南区', '120100', '津南', '4', '022', '300350', '中国,天津,天津市,津南区', 'Jinnan', '117.38537', '38.99139');
INSERT INTO `tb_region` VALUES ('120113', '北辰区', '120100', '北辰', '4', '022', '300400', '中国,天津,天津市,北辰区', 'Beichen', '117.13217', '39.22131');
INSERT INTO `tb_region` VALUES ('120114', '武清区', '120100', '武清', '4', '022', '301700', '中国,天津,天津市,武清区', 'Wuqing', '117.04443', '39.38415');
INSERT INTO `tb_region` VALUES ('120115', '宝坻区', '120100', '宝坻', '4', '022', '301800', '中国,天津,天津市,宝坻区', 'Baodi', '117.3103', '39.71761');
INSERT INTO `tb_region` VALUES ('120116', '滨海新区', '120100', '滨海新区', '4', '022', '300451', '中国,天津,天津市,滨海新区', 'Binhaixinqu', '117.70162', '39.02668');
INSERT INTO `tb_region` VALUES ('120221', '宁河县', '120100', '宁河', '4', '022', '301500', '中国,天津,天津市,宁河县', 'Ninghe', '117.8255', '39.33048');
INSERT INTO `tb_region` VALUES ('120223', '静海县', '120100', '静海', '4', '022', '301600', '中国,天津,天津市,静海县', 'Jinghai', '116.97436', '38.94582');
INSERT INTO `tb_region` VALUES ('120225', '蓟县', '120100', '蓟县', '4', '022', '301900', '中国,天津,天津市,蓟县', 'Jixian', '117.40799', '40.04567');
INSERT INTO `tb_region` VALUES ('130000', '河北省', '100004', '河北', '2', '', '', '中国,河北省', 'Hebei', '114.502461', '38.045474');
INSERT INTO `tb_region` VALUES ('130100', '石家庄市', '130000', '石家庄', '3', '0311', '050011', '中国,河北省,石家庄市', 'Shijiazhuang', '114.502461', '38.045474');
INSERT INTO `tb_region` VALUES ('130102', '长安区', '130100', '长安', '4', '0311', '050011', '中国,河北省,石家庄市,长安区', 'Chang\'an', '114.53906', '38.03665');
INSERT INTO `tb_region` VALUES ('130104', '桥西区', '130100', '桥西', '4', '0311', '050091', '中国,河北省,石家庄市,桥西区', 'Qiaoxi', '114.46977', '38.03221');
INSERT INTO `tb_region` VALUES ('130105', '新华区', '130100', '新华', '4', '0311', '050051', '中国,河北省,石家庄市,新华区', 'Xinhua', '114.46326', '38.05088');
INSERT INTO `tb_region` VALUES ('130107', '井陉矿区', '130100', '井陉矿区', '4', '0311', '050100', '中国,河北省,石家庄市,井陉矿区', 'Jingxingkuangqu', '114.06518', '38.06705');
INSERT INTO `tb_region` VALUES ('130108', '裕华区', '130100', '裕华', '4', '0311', '050031', '中国,河北省,石家庄市,裕华区', 'Yuhua', '114.53115', '38.00604');
INSERT INTO `tb_region` VALUES ('130109', '藁城区', '130100', '藁城', '4', '0311', '052160', '中国,河北省,石家庄市,藁城区', 'Gaocheng', '114.84671', '38.02162');
INSERT INTO `tb_region` VALUES ('130110', '鹿泉区', '130100', '鹿泉', '4', '0311', '050200', '中国,河北省,石家庄市,鹿泉区', 'Luquan', '114.31347', '38.08782');
INSERT INTO `tb_region` VALUES ('130111', '栾城区', '130100', '栾城', '4', '0311', '051430', '中国,河北省,石家庄市,栾城区', 'Luancheng', '114.64834', '37.90022');
INSERT INTO `tb_region` VALUES ('130121', '井陉县', '130100', '井陉', '4', '0311', '050300', '中国,河北省,石家庄市,井陉县', 'Jingxing', '114.14257', '38.03688');
INSERT INTO `tb_region` VALUES ('130123', '正定县', '130100', '正定', '4', '0311', '050800', '中国,河北省,石家庄市,正定县', 'Zhengding', '114.57296', '38.14445');
INSERT INTO `tb_region` VALUES ('130125', '行唐县', '130100', '行唐', '4', '0311', '050600', '中国,河北省,石家庄市,行唐县', 'Xingtang', '114.55316', '38.43654');
INSERT INTO `tb_region` VALUES ('130126', '灵寿县', '130100', '灵寿', '4', '0311', '050500', '中国,河北省,石家庄市,灵寿县', 'Lingshou', '114.38259', '38.30845');
INSERT INTO `tb_region` VALUES ('130127', '高邑县', '130100', '高邑', '4', '0311', '051330', '中国,河北省,石家庄市,高邑县', 'Gaoyi', '114.61142', '37.61556');
INSERT INTO `tb_region` VALUES ('130128', '深泽县', '130100', '深泽', '4', '0311', '052560', '中国,河北省,石家庄市,深泽县', 'Shenze', '115.20358', '38.18353');
INSERT INTO `tb_region` VALUES ('130129', '赞皇县', '130100', '赞皇', '4', '0311', '051230', '中国,河北省,石家庄市,赞皇县', 'Zanhuang', '114.38775', '37.66135');
INSERT INTO `tb_region` VALUES ('130130', '无极县', '130100', '无极', '4', '0311', '052460', '中国,河北省,石家庄市,无极县', 'Wuji', '114.97509', '38.17653');
INSERT INTO `tb_region` VALUES ('130131', '平山县', '130100', '平山', '4', '0311', '050400', '中国,河北省,石家庄市,平山县', 'Pingshan', '114.186', '38.25994');
INSERT INTO `tb_region` VALUES ('130132', '元氏县', '130100', '元氏', '4', '0311', '051130', '中国,河北省,石家庄市,元氏县', 'Yuanshi', '114.52539', '37.76668');
INSERT INTO `tb_region` VALUES ('130133', '赵县', '130100', '赵县', '4', '0311', '051530', '中国,河北省,石家庄市,赵县', 'Zhaoxian', '114.77612', '37.75628');
INSERT INTO `tb_region` VALUES ('130181', '辛集市', '130100', '辛集', '4', '0311', '052360', '中国,河北省,石家庄市,辛集市', 'Xinji', '115.20626', '37.94079');
INSERT INTO `tb_region` VALUES ('130183', '晋州市', '130100', '晋州', '4', '0311', '052260', '中国,河北省,石家庄市,晋州市', 'Jinzhou', '115.04348', '38.03135');
INSERT INTO `tb_region` VALUES ('130184', '新乐市', '130100', '新乐', '4', '0311', '050700', '中国,河北省,石家庄市,新乐市', 'Xinle', '114.68985', '38.34417');
INSERT INTO `tb_region` VALUES ('130200', '唐山市', '130000', '唐山', '3', '0315', '063000', '中国,河北省,唐山市', 'Tangshan', '118.175393', '39.635113');
INSERT INTO `tb_region` VALUES ('130202', '路南区', '130200', '路南', '4', '0315', '063000', '中国,河北省,唐山市,路南区', 'Lunan', '118.15431', '39.62505');
INSERT INTO `tb_region` VALUES ('130203', '路北区', '130200', '路北', '4', '0315', '063000', '中国,河北省,唐山市,路北区', 'Lubei', '118.20079', '39.62436');
INSERT INTO `tb_region` VALUES ('130204', '古冶区', '130200', '古冶', '4', '0315', '063100', '中国,河北省,唐山市,古冶区', 'Guye', '118.45803', '39.71993');
INSERT INTO `tb_region` VALUES ('130205', '开平区', '130200', '开平', '4', '0315', '063021', '中国,河北省,唐山市,开平区', 'Kaiping', '118.26171', '39.67128');
INSERT INTO `tb_region` VALUES ('130207', '丰南区', '130200', '丰南', '4', '0315', '063300', '中国,河北省,唐山市,丰南区', 'Fengnan', '118.11282', '39.56483');
INSERT INTO `tb_region` VALUES ('130208', '丰润区', '130200', '丰润', '4', '0315', '064000', '中国,河北省,唐山市,丰润区', 'Fengrun', '118.12976', '39.8244');
INSERT INTO `tb_region` VALUES ('130209', '曹妃甸区', '130200', '曹妃甸', '4', '0315', '063200', '中国,河北省,唐山市,曹妃甸区', 'Caofeidian', '118.460379', '39.273070');
INSERT INTO `tb_region` VALUES ('130223', '滦县', '130200', '滦县', '4', '0315', '063700', '中国,河北省,唐山市,滦县', 'Luanxian', '118.70346', '39.74056');
INSERT INTO `tb_region` VALUES ('130224', '滦南县', '130200', '滦南', '4', '0315', '063500', '中国,河北省,唐山市,滦南县', 'Luannan', '118.6741', '39.5039');
INSERT INTO `tb_region` VALUES ('130225', '乐亭县', '130200', '乐亭', '4', '0315', '063600', '中国,河北省,唐山市,乐亭县', 'Laoting', '118.9125', '39.42561');
INSERT INTO `tb_region` VALUES ('130227', '迁西县', '130200', '迁西', '4', '0315', '064300', '中国,河北省,唐山市,迁西县', 'Qianxi', '118.31616', '40.14587');
INSERT INTO `tb_region` VALUES ('130229', '玉田县', '130200', '玉田', '4', '0315', '064100', '中国,河北省,唐山市,玉田县', 'Yutian', '117.7388', '39.90049');
INSERT INTO `tb_region` VALUES ('130281', '遵化市', '130200', '遵化', '4', '0315', '064200', '中国,河北省,唐山市,遵化市', 'Zunhua', '117.96444', '40.18741');
INSERT INTO `tb_region` VALUES ('130283', '迁安市', '130200', '迁安', '4', '0315', '064400', '中国,河北省,唐山市,迁安市', 'Qian\'an', '118.70068', '39.99833');
INSERT INTO `tb_region` VALUES ('130300', '秦皇岛市', '130000', '秦皇岛', '3', '0335', '066000', '中国,河北省,秦皇岛市', 'Qinhuangdao', '119.586579', '39.942531');
INSERT INTO `tb_region` VALUES ('130302', '海港区', '130300', '海港', '4', '0335', '066000', '中国,河北省,秦皇岛市,海港区', 'Haigang', '119.61046', '39.9345');
INSERT INTO `tb_region` VALUES ('130303', '山海关区', '130300', '山海关', '4', '0335', '066200', '中国,河北省,秦皇岛市,山海关区', 'Shanhaiguan', '119.77563', '39.97869');
INSERT INTO `tb_region` VALUES ('130304', '北戴河区', '130300', '北戴河', '4', '0335', '066100', '中国,河北省,秦皇岛市,北戴河区', 'Beidaihe', '119.48388', '39.83408');
INSERT INTO `tb_region` VALUES ('130321', '青龙满族自治县', '130300', '青龙', '4', '0335', '066500', '中国,河北省,秦皇岛市,青龙满族自治县', 'Qinglong', '118.95242', '40.40743');
INSERT INTO `tb_region` VALUES ('130322', '昌黎县', '130300', '昌黎', '4', '0335', '066600', '中国,河北省,秦皇岛市,昌黎县', 'Changli', '119.16595', '39.70884');
INSERT INTO `tb_region` VALUES ('130323', '抚宁县', '130300', '抚宁', '4', '0335', '066300', '中国,河北省,秦皇岛市,抚宁县', 'Funing', '119.24487', '39.87538');
INSERT INTO `tb_region` VALUES ('130324', '卢龙县', '130300', '卢龙', '4', '0335', '066400', '中国,河北省,秦皇岛市,卢龙县', 'Lulong', '118.89288', '39.89176');
INSERT INTO `tb_region` VALUES ('130400', '邯郸市', '130000', '邯郸', '3', '0310', '056002', '中国,河北省,邯郸市', 'Handan', '114.490686', '36.612273');
INSERT INTO `tb_region` VALUES ('130402', '邯山区', '130400', '邯山', '4', '0310', '056001', '中国,河北省,邯郸市,邯山区', 'Hanshan', '114.48375', '36.60006');
INSERT INTO `tb_region` VALUES ('130403', '丛台区', '130400', '丛台', '4', '0310', '056002', '中国,河北省,邯郸市,丛台区', 'Congtai', '114.49343', '36.61847');
INSERT INTO `tb_region` VALUES ('130404', '复兴区', '130400', '复兴', '4', '0310', '056003', '中国,河北省,邯郸市,复兴区', 'Fuxing', '114.45928', '36.61134');
INSERT INTO `tb_region` VALUES ('130406', '峰峰矿区', '130400', '峰峰矿区', '4', '0310', '056200', '中国,河北省,邯郸市,峰峰矿区', 'Fengfengkuangqu', '114.21148', '36.41937');
INSERT INTO `tb_region` VALUES ('130421', '邯郸县', '130400', '邯郸', '4', '0310', '056101', '中国,河北省,邯郸市,邯郸县', 'Handan', '114.53103', '36.59385');
INSERT INTO `tb_region` VALUES ('130423', '临漳县', '130400', '临漳', '4', '0310', '056600', '中国,河北省,邯郸市,临漳县', 'Linzhang', '114.6195', '36.33461');
INSERT INTO `tb_region` VALUES ('130424', '成安县', '130400', '成安', '4', '0310', '056700', '中国,河北省,邯郸市,成安县', 'Cheng\'an', '114.66995', '36.44411');
INSERT INTO `tb_region` VALUES ('130425', '大名县', '130400', '大名', '4', '0310', '056900', '中国,河北省,邯郸市,大名县', 'Daming', '115.15362', '36.27994');
INSERT INTO `tb_region` VALUES ('130426', '涉县', '130400', '涉县', '4', '0310', '056400', '中国,河北省,邯郸市,涉县', 'Shexian', '113.69183', '36.58072');
INSERT INTO `tb_region` VALUES ('130427', '磁县', '130400', '磁县', '4', '0310', '056500', '中国,河北省,邯郸市,磁县', 'Cixian', '114.37387', '36.37392');
INSERT INTO `tb_region` VALUES ('130428', '肥乡县', '130400', '肥乡', '4', '0310', '057550', '中国,河北省,邯郸市,肥乡县', 'Feixiang', '114.79998', '36.54807');
INSERT INTO `tb_region` VALUES ('130429', '永年县', '130400', '永年', '4', '0310', '057150', '中国,河北省,邯郸市,永年县', 'Yongnian', '114.48925', '36.78356');
INSERT INTO `tb_region` VALUES ('130430', '邱县', '130400', '邱县', '4', '0310', '057450', '中国,河北省,邯郸市,邱县', 'Qiuxian', '115.17407', '36.82082');
INSERT INTO `tb_region` VALUES ('130431', '鸡泽县', '130400', '鸡泽', '4', '0310', '057350', '中国,河北省,邯郸市,鸡泽县', 'Jize', '114.8742', '36.92374');
INSERT INTO `tb_region` VALUES ('130432', '广平县', '130400', '广平', '4', '0310', '057650', '中国,河北省,邯郸市,广平县', 'Guangping', '114.94653', '36.48046');
INSERT INTO `tb_region` VALUES ('130433', '馆陶县', '130400', '馆陶', '4', '0310', '057750', '中国,河北省,邯郸市,馆陶县', 'Guantao', '115.29913', '36.53719');
INSERT INTO `tb_region` VALUES ('130434', '魏县', '130400', '魏县', '4', '0310', '056800', '中国,河北省,邯郸市,魏县', 'Weixian', '114.93518', '36.36171');
INSERT INTO `tb_region` VALUES ('130435', '曲周县', '130400', '曲周', '4', '0310', '057250', '中国,河北省,邯郸市,曲周县', 'Quzhou', '114.95196', '36.77671');
INSERT INTO `tb_region` VALUES ('130481', '武安市', '130400', '武安', '4', '0310', '056300', '中国,河北省,邯郸市,武安市', 'Wu\'an', '114.20153', '36.69281');
INSERT INTO `tb_region` VALUES ('130500', '邢台市', '130000', '邢台', '3', '0319', '054001', '中国,河北省,邢台市', 'Xingtai', '114.508851', '37.0682');
INSERT INTO `tb_region` VALUES ('130502', '桥东区', '130500', '桥东', '4', '0319', '054001', '中国,河北省,邢台市,桥东区', 'Qiaodong', '114.50725', '37.06801');
INSERT INTO `tb_region` VALUES ('130503', '桥西区', '130500', '桥西', '4', '0319', '054000', '中国,河北省,邢台市,桥西区', 'Qiaoxi', '114.46803', '37.05984');
INSERT INTO `tb_region` VALUES ('130521', '邢台县', '130500', '邢台', '4', '0319', '054001', '中国,河北省,邢台市,邢台县', 'Xingtai', '114.56575', '37.0456');
INSERT INTO `tb_region` VALUES ('130522', '临城县', '130500', '临城', '4', '0319', '054300', '中国,河北省,邢台市,临城县', 'Lincheng', '114.50387', '37.43977');
INSERT INTO `tb_region` VALUES ('130523', '内丘县', '130500', '内丘', '4', '0319', '054200', '中国,河北省,邢台市,内丘县', 'Neiqiu', '114.51212', '37.28671');
INSERT INTO `tb_region` VALUES ('130524', '柏乡县', '130500', '柏乡', '4', '0319', '055450', '中国,河北省,邢台市,柏乡县', 'Baixiang', '114.69332', '37.48242');
INSERT INTO `tb_region` VALUES ('130525', '隆尧县', '130500', '隆尧', '4', '0319', '055350', '中国,河北省,邢台市,隆尧县', 'Longyao', '114.77615', '37.35351');
INSERT INTO `tb_region` VALUES ('130526', '任县', '130500', '任县', '4', '0319', '055150', '中国,河北省,邢台市,任县', 'Renxian', '114.6842', '37.12575');
INSERT INTO `tb_region` VALUES ('130527', '南和县', '130500', '南和', '4', '0319', '054400', '中国,河北省,邢台市,南和县', 'Nanhe', '114.68371', '37.00488');
INSERT INTO `tb_region` VALUES ('130528', '宁晋县', '130500', '宁晋', '4', '0319', '055550', '中国,河北省,邢台市,宁晋县', 'Ningjin', '114.92117', '37.61696');
INSERT INTO `tb_region` VALUES ('130529', '巨鹿县', '130500', '巨鹿', '4', '0319', '055250', '中国,河北省,邢台市,巨鹿县', 'Julu', '115.03524', '37.21801');
INSERT INTO `tb_region` VALUES ('130530', '新河县', '130500', '新河', '4', '0319', '055650', '中国,河北省,邢台市,新河县', 'Xinhe', '115.24987', '37.52718');
INSERT INTO `tb_region` VALUES ('130531', '广宗县', '130500', '广宗', '4', '0319', '054600', '中国,河北省,邢台市,广宗县', 'Guangzong', '115.14254', '37.0746');
INSERT INTO `tb_region` VALUES ('130532', '平乡县', '130500', '平乡', '4', '0319', '054500', '中国,河北省,邢台市,平乡县', 'Pingxiang', '115.03002', '37.06317');
INSERT INTO `tb_region` VALUES ('130533', '威县', '130500', '威县', '4', '0319', '054700', '中国,河北省,邢台市,威县', 'Weixian', '115.2637', '36.9768');
INSERT INTO `tb_region` VALUES ('130534', '清河县', '130500', '清河', '4', '0319', '054800', '中国,河北省,邢台市,清河县', 'Qinghe', '115.66479', '37.07122');
INSERT INTO `tb_region` VALUES ('130535', '临西县', '130500', '临西', '4', '0319', '054900', '中国,河北省,邢台市,临西县', 'Linxi', '115.50097', '36.87078');
INSERT INTO `tb_region` VALUES ('130581', '南宫市', '130500', '南宫', '4', '0319', '055750', '中国,河北省,邢台市,南宫市', 'Nangong', '115.39068', '37.35799');
INSERT INTO `tb_region` VALUES ('130582', '沙河市', '130500', '沙河', '4', '0319', '054100', '中国,河北省,邢台市,沙河市', 'Shahe', '114.4981', '36.8577');
INSERT INTO `tb_region` VALUES ('130600', '保定市', '130000', '保定', '3', '0312', '071052', '中国,河北省,保定市', 'Baoding', '115.482331', '38.867657');
INSERT INTO `tb_region` VALUES ('130602', '新市区', '130600', '新市', '4', '0312', '071051', '中国,河北省,保定市,新市区', 'Xinshi', '115.4587', '38.87751');
INSERT INTO `tb_region` VALUES ('130603', '北市区', '130600', '北市', '4', '0312', '071000', '中国,河北省,保定市,北市区', 'Beishi', '115.49715', '38.88322');
INSERT INTO `tb_region` VALUES ('130604', '南市区', '130600', '南市', '4', '0312', '071001', '中国,河北省,保定市,南市区', 'Nanshi', '115.52859', '38.85455');
INSERT INTO `tb_region` VALUES ('130621', '满城县', '130600', '满城', '4', '0312', '072150', '中国,河北省,保定市,满城县', 'Mancheng', '115.32296', '38.94972');
INSERT INTO `tb_region` VALUES ('130622', '清苑县', '130600', '清苑', '4', '0312', '071100', '中国,河北省,保定市,清苑县', 'Qingyuan', '115.49267', '38.76709');
INSERT INTO `tb_region` VALUES ('130623', '涞水县', '130600', '涞水', '4', '0312', '074100', '中国,河北省,保定市,涞水县', 'Laishui', '115.71517', '39.39404');
INSERT INTO `tb_region` VALUES ('130624', '阜平县', '130600', '阜平', '4', '0312', '073200', '中国,河北省,保定市,阜平县', 'Fuping', '114.19683', '38.84763');
INSERT INTO `tb_region` VALUES ('130625', '徐水县', '130600', '徐水', '4', '0312', '072550', '中国,河北省,保定市,徐水县', 'Xushui', '115.65829', '39.02099');
INSERT INTO `tb_region` VALUES ('130626', '定兴县', '130600', '定兴', '4', '0312', '072650', '中国,河北省,保定市,定兴县', 'Dingxing', '115.80786', '39.26312');
INSERT INTO `tb_region` VALUES ('130627', '唐县', '130600', '唐县', '4', '0312', '072350', '中国,河北省,保定市,唐县', 'Tangxian', '114.98516', '38.74513');
INSERT INTO `tb_region` VALUES ('130628', '高阳县', '130600', '高阳', '4', '0312', '071500', '中国,河北省,保定市,高阳县', 'Gaoyang', '115.7788', '38.70003');
INSERT INTO `tb_region` VALUES ('130629', '容城县', '130600', '容城', '4', '0312', '071700', '中国,河北省,保定市,容城县', 'Rongcheng', '115.87158', '39.0535');
INSERT INTO `tb_region` VALUES ('130630', '涞源县', '130600', '涞源', '4', '0312', '074300', '中国,河北省,保定市,涞源县', 'Laiyuan', '114.69128', '39.35388');
INSERT INTO `tb_region` VALUES ('130631', '望都县', '130600', '望都', '4', '0312', '072450', '中国,河北省,保定市,望都县', 'Wangdu', '115.1567', '38.70996');
INSERT INTO `tb_region` VALUES ('130632', '安新县', '130600', '安新', '4', '0312', '071600', '中国,河北省,保定市,安新县', 'Anxin', '115.93557', '38.93532');
INSERT INTO `tb_region` VALUES ('130633', '易县', '130600', '易县', '4', '0312', '074200', '中国,河北省,保定市,易县', 'Yixian', '115.4981', '39.34885');
INSERT INTO `tb_region` VALUES ('130634', '曲阳县', '130600', '曲阳', '4', '0312', '073100', '中国,河北省,保定市,曲阳县', 'Quyang', '114.70123', '38.62154');
INSERT INTO `tb_region` VALUES ('130635', '蠡县', '130600', '蠡县', '4', '0312', '071400', '中国,河北省,保定市,蠡县', 'Lixian', '115.57717', '38.48974');
INSERT INTO `tb_region` VALUES ('130636', '顺平县', '130600', '顺平', '4', '0312', '072250', '中国,河北省,保定市,顺平县', 'Shunping', '115.1347', '38.83854');
INSERT INTO `tb_region` VALUES ('130637', '博野县', '130600', '博野', '4', '0312', '071300', '中国,河北省,保定市,博野县', 'Boye', '115.47033', '38.4564');
INSERT INTO `tb_region` VALUES ('130638', '雄县', '130600', '雄县', '4', '0312', '071800', '中国,河北省,保定市,雄县', 'Xiongxian', '116.10873', '38.99442');
INSERT INTO `tb_region` VALUES ('130681', '涿州市', '130600', '涿州', '4', '0312', '072750', '中国,河北省,保定市,涿州市', 'Zhuozhou', '115.98062', '39.48622');
INSERT INTO `tb_region` VALUES ('130682', '定州市', '130600', '定州', '4', '0312', '073000', '中国,河北省,保定市,定州市', 'Dingzhou', '114.9902', '38.51623');
INSERT INTO `tb_region` VALUES ('130683', '安国市', '130600', '安国', '4', '0312', '071200', '中国,河北省,保定市,安国市', 'Anguo', '115.32321', '38.41391');
INSERT INTO `tb_region` VALUES ('130684', '高碑店市', '130600', '高碑店', '4', '0312', '074000', '中国,河北省,保定市,高碑店市', 'Gaobeidian', '115.87368', '39.32655');
INSERT INTO `tb_region` VALUES ('130700', '张家口市', '130000', '张家口', '3', '0313', '075000', '中国,河北省,张家口市', 'Zhangjiakou', '114.884091', '40.811901');
INSERT INTO `tb_region` VALUES ('130702', '桥东区', '130700', '桥东', '4', '0313', '075000', '中国,河北省,张家口市,桥东区', 'Qiaodong', '114.8943', '40.78844');
INSERT INTO `tb_region` VALUES ('130703', '桥西区', '130700', '桥西', '4', '0313', '075061', '中国,河北省,张家口市,桥西区', 'Qiaoxi', '114.86962', '40.81945');
INSERT INTO `tb_region` VALUES ('130705', '宣化区', '130700', '宣化', '4', '0313', '075100', '中国,河北省,张家口市,宣化区', 'Xuanhua', '115.06543', '40.60957');
INSERT INTO `tb_region` VALUES ('130706', '下花园区', '130700', '下花园', '4', '0313', '075300', '中国,河北省,张家口市,下花园区', 'Xiahuayuan', '115.28744', '40.50236');
INSERT INTO `tb_region` VALUES ('130721', '宣化县', '130700', '宣化', '4', '0313', '075100', '中国,河北省,张家口市,宣化县', 'Xuanhua', '115.15497', '40.56618');
INSERT INTO `tb_region` VALUES ('130722', '张北县', '130700', '张北', '4', '0313', '076450', '中国,河北省,张家口市,张北县', 'Zhangbei', '114.71432', '41.15977');
INSERT INTO `tb_region` VALUES ('130723', '康保县', '130700', '康保', '4', '0313', '076650', '中国,河北省,张家口市,康保县', 'Kangbao', '114.60031', '41.85225');
INSERT INTO `tb_region` VALUES ('130724', '沽源县', '130700', '沽源', '4', '0313', '076550', '中国,河北省,张家口市,沽源县', 'Guyuan', '115.68859', '41.66959');
INSERT INTO `tb_region` VALUES ('130725', '尚义县', '130700', '尚义', '4', '0313', '076750', '中国,河北省,张家口市,尚义县', 'Shangyi', '113.97134', '41.07782');
INSERT INTO `tb_region` VALUES ('130726', '蔚县', '130700', '蔚县', '4', '0313', '075700', '中国,河北省,张家口市,蔚县', 'Yuxian', '114.58892', '39.84067');
INSERT INTO `tb_region` VALUES ('130727', '阳原县', '130700', '阳原', '4', '0313', '075800', '中国,河北省,张家口市,阳原县', 'Yangyuan', '114.15051', '40.10361');
INSERT INTO `tb_region` VALUES ('130728', '怀安县', '130700', '怀安', '4', '0313', '076150', '中国,河北省,张家口市,怀安县', 'Huai\'an', '114.38559', '40.67425');
INSERT INTO `tb_region` VALUES ('130729', '万全县', '130700', '万全', '4', '0313', '076250', '中国,河北省,张家口市,万全县', 'Wanquan', '114.7405', '40.76694');
INSERT INTO `tb_region` VALUES ('130730', '怀来县', '130700', '怀来', '4', '0313', '075400', '中国,河北省,张家口市,怀来县', 'Huailai', '115.51773', '40.41536');
INSERT INTO `tb_region` VALUES ('130731', '涿鹿县', '130700', '涿鹿', '4', '0313', '075600', '中国,河北省,张家口市,涿鹿县', 'Zhuolu', '115.22403', '40.37636');
INSERT INTO `tb_region` VALUES ('130732', '赤城县', '130700', '赤城', '4', '0313', '075500', '中国,河北省,张家口市,赤城县', 'Chicheng', '115.83187', '40.91438');
INSERT INTO `tb_region` VALUES ('130733', '崇礼县', '130700', '崇礼', '4', '0313', '076350', '中国,河北省,张家口市,崇礼县', 'Chongli', '115.27993', '40.97519');
INSERT INTO `tb_region` VALUES ('130800', '承德市', '130000', '承德', '3', '0314', '067000', '中国,河北省,承德市', 'Chengde', '117.939152', '40.976204');
INSERT INTO `tb_region` VALUES ('130802', '双桥区', '130800', '双桥', '4', '0314', '067000', '中国,河北省,承德市,双桥区', 'Shuangqiao', '117.9432', '40.97466');
INSERT INTO `tb_region` VALUES ('130803', '双滦区', '130800', '双滦', '4', '0314', '067001', '中国,河北省,承德市,双滦区', 'Shuangluan', '117.74487', '40.95375');
INSERT INTO `tb_region` VALUES ('130804', '鹰手营子矿区', '130800', '鹰手营子矿区', '4', '0314', '067200', '中国,河北省,承德市,鹰手营子矿区', 'Yingshouyingzikuangqu', '117.65985', '40.54744');
INSERT INTO `tb_region` VALUES ('130821', '承德县', '130800', '承德', '4', '0314', '067400', '中国,河北省,承德市,承德县', 'Chengde', '118.17639', '40.76985');
INSERT INTO `tb_region` VALUES ('130822', '兴隆县', '130800', '兴隆', '4', '0314', '067300', '中国,河北省,承德市,兴隆县', 'Xinglong', '117.50073', '40.41709');
INSERT INTO `tb_region` VALUES ('130823', '平泉县', '130800', '平泉', '4', '0314', '067500', '中国,河北省,承德市,平泉县', 'Pingquan', '118.70196', '41.01839');
INSERT INTO `tb_region` VALUES ('130824', '滦平县', '130800', '滦平', '4', '0314', '068250', '中国,河北省,承德市,滦平县', 'Luanping', '117.33276', '40.94148');
INSERT INTO `tb_region` VALUES ('130825', '隆化县', '130800', '隆化', '4', '0314', '068150', '中国,河北省,承德市,隆化县', 'Longhua', '117.7297', '41.31412');
INSERT INTO `tb_region` VALUES ('130826', '丰宁满族自治县', '130800', '丰宁', '4', '0314', '068350', '中国,河北省,承德市,丰宁满族自治县', 'Fengning', '116.6492', '41.20481');
INSERT INTO `tb_region` VALUES ('130827', '宽城满族自治县', '130800', '宽城', '4', '0314', '067600', '中国,河北省,承德市,宽城满族自治县', 'Kuancheng', '118.49176', '40.60829');
INSERT INTO `tb_region` VALUES ('130828', '围场满族蒙古族自治县', '130800', '围场', '4', '0314', '068450', '中国,河北省,承德市,围场满族蒙古族自治县', 'Weichang', '117.7601', '41.94368');
INSERT INTO `tb_region` VALUES ('130900', '沧州市', '130000', '沧州', '3', '0317', '061001', '中国,河北省,沧州市', 'Cangzhou', '116.857461', '38.310582');
INSERT INTO `tb_region` VALUES ('130902', '新华区', '130900', '新华', '4', '0317', '061000', '中国,河北省,沧州市,新华区', 'Xinhua', '116.86643', '38.31438');
INSERT INTO `tb_region` VALUES ('130903', '运河区', '130900', '运河', '4', '0317', '061001', '中国,河北省,沧州市,运河区', 'Yunhe', '116.85706', '38.31352');
INSERT INTO `tb_region` VALUES ('130921', '沧县', '130900', '沧县', '4', '0317', '061000', '中国,河北省,沧州市,沧县', 'Cangxian', '116.87817', '38.29361');
INSERT INTO `tb_region` VALUES ('130922', '青县', '130900', '青县', '4', '0317', '062650', '中国,河北省,沧州市,青县', 'Qingxian', '116.80316', '38.58345');
INSERT INTO `tb_region` VALUES ('130923', '东光县', '130900', '东光', '4', '0317', '061600', '中国,河北省,沧州市,东光县', 'Dongguang', '116.53668', '37.8857');
INSERT INTO `tb_region` VALUES ('130924', '海兴县', '130900', '海兴', '4', '0317', '061200', '中国,河北省,沧州市,海兴县', 'Haixing', '117.49758', '38.13958');
INSERT INTO `tb_region` VALUES ('130925', '盐山县', '130900', '盐山', '4', '0317', '061300', '中国,河北省,沧州市,盐山县', 'Yanshan', '117.23092', '38.05647');
INSERT INTO `tb_region` VALUES ('130926', '肃宁县', '130900', '肃宁', '4', '0317', '062350', '中国,河北省,沧州市,肃宁县', 'Suning', '115.82971', '38.42272');
INSERT INTO `tb_region` VALUES ('130927', '南皮县', '130900', '南皮', '4', '0317', '061500', '中国,河北省,沧州市,南皮县', 'Nanpi', '116.70224', '38.04109');
INSERT INTO `tb_region` VALUES ('130928', '吴桥县', '130900', '吴桥', '4', '0317', '061800', '中国,河北省,沧州市,吴桥县', 'Wuqiao', '116.3847', '37.62546');
INSERT INTO `tb_region` VALUES ('130929', '献县', '130900', '献县', '4', '0317', '062250', '中国,河北省,沧州市,献县', 'Xianxian', '116.12695', '38.19228');
INSERT INTO `tb_region` VALUES ('130930', '孟村回族自治县', '130900', '孟村', '4', '0317', '061400', '中国,河北省,沧州市,孟村回族自治县', 'Mengcun', '117.10412', '38.05338');
INSERT INTO `tb_region` VALUES ('130981', '泊头市', '130900', '泊头', '4', '0317', '062150', '中国,河北省,沧州市,泊头市', 'Botou', '116.57824', '38.08359');
INSERT INTO `tb_region` VALUES ('130982', '任丘市', '130900', '任丘', '4', '0317', '062550', '中国,河北省,沧州市,任丘市', 'Renqiu', '116.1033', '38.71124');
INSERT INTO `tb_region` VALUES ('130983', '黄骅市', '130900', '黄骅', '4', '0317', '061100', '中国,河北省,沧州市,黄骅市', 'Huanghua', '117.33883', '38.3706');
INSERT INTO `tb_region` VALUES ('130984', '河间市', '130900', '河间', '4', '0317', '062450', '中国,河北省,沧州市,河间市', 'Hejian', '116.0993', '38.44549');
INSERT INTO `tb_region` VALUES ('131000', '廊坊市', '130000', '廊坊', '3', '0316', '065000', '中国,河北省,廊坊市', 'Langfang', '116.713873', '39.529244');
INSERT INTO `tb_region` VALUES ('131002', '安次区', '131000', '安次', '4', '0316', '065000', '中国,河北省,廊坊市,安次区', 'Anci', '116.70308', '39.52057');
INSERT INTO `tb_region` VALUES ('131003', '广阳区', '131000', '广阳', '4', '0316', '065000', '中国,河北省,廊坊市,广阳区', 'Guangyang', '116.71069', '39.52278');
INSERT INTO `tb_region` VALUES ('131022', '固安县', '131000', '固安', '4', '0316', '065500', '中国,河北省,廊坊市,固安县', 'Gu\'an', '116.29916', '39.43833');
INSERT INTO `tb_region` VALUES ('131023', '永清县', '131000', '永清', '4', '0316', '065600', '中国,河北省,廊坊市,永清县', 'Yongqing', '116.50091', '39.32069');
INSERT INTO `tb_region` VALUES ('131024', '香河县', '131000', '香河', '4', '0316', '065400', '中国,河北省,廊坊市,香河县', 'Xianghe', '117.00634', '39.76133');
INSERT INTO `tb_region` VALUES ('131025', '大城县', '131000', '大城', '4', '0316', '065900', '中国,河北省,廊坊市,大城县', 'Daicheng', '116.65353', '38.70534');
INSERT INTO `tb_region` VALUES ('131026', '文安县', '131000', '文安', '4', '0316', '065800', '中国,河北省,廊坊市,文安县', 'Wen\'an', '116.45846', '38.87325');
INSERT INTO `tb_region` VALUES ('131028', '大厂回族自治县', '131000', '大厂', '4', '0316', '065300', '中国,河北省,廊坊市,大厂回族自治县', 'Dachang', '116.98916', '39.88649');
INSERT INTO `tb_region` VALUES ('131081', '霸州市', '131000', '霸州', '4', '0316', '065700', '中国,河北省,廊坊市,霸州市', 'Bazhou', '116.39154', '39.12569');
INSERT INTO `tb_region` VALUES ('131082', '三河市', '131000', '三河', '4', '0316', '065200', '中国,河北省,廊坊市,三河市', 'Sanhe', '117.07229', '39.98358');
INSERT INTO `tb_region` VALUES ('131100', '衡水市', '130000', '衡水', '3', '0318', '053000', '中国,河北省,衡水市', 'Hengshui', '115.665993', '37.735097');
INSERT INTO `tb_region` VALUES ('131102', '桃城区', '131100', '桃城', '4', '0318', '053000', '中国,河北省,衡水市,桃城区', 'Taocheng', '115.67529', '37.73499');
INSERT INTO `tb_region` VALUES ('131121', '枣强县', '131100', '枣强', '4', '0318', '053100', '中国,河北省,衡水市,枣强县', 'Zaoqiang', '115.72576', '37.51027');
INSERT INTO `tb_region` VALUES ('131122', '武邑县', '131100', '武邑', '4', '0318', '053400', '中国,河北省,衡水市,武邑县', 'Wuyi', '115.88748', '37.80181');
INSERT INTO `tb_region` VALUES ('131123', '武强县', '131100', '武强', '4', '0318', '053300', '中国,河北省,衡水市,武强县', 'Wuqiang', '115.98226', '38.04138');
INSERT INTO `tb_region` VALUES ('131124', '饶阳县', '131100', '饶阳', '4', '0318', '053900', '中国,河北省,衡水市,饶阳县', 'Raoyang', '115.72558', '38.23529');
INSERT INTO `tb_region` VALUES ('131125', '安平县', '131100', '安平', '4', '0318', '053600', '中国,河北省,衡水市,安平县', 'Anping', '115.51876', '38.23388');
INSERT INTO `tb_region` VALUES ('131126', '故城县', '131100', '故城', '4', '0318', '053800', '中国,河北省,衡水市,故城县', 'Gucheng', '115.97076', '37.34773');
INSERT INTO `tb_region` VALUES ('131127', '景县', '131100', '景县', '4', '0318', '053500', '中国,河北省,衡水市,景县', 'Jingxian', '116.26904', '37.6926');
INSERT INTO `tb_region` VALUES ('131128', '阜城县', '131100', '阜城', '4', '0318', '053700', '中国,河北省,衡水市,阜城县', 'Fucheng', '116.14431', '37.86881');
INSERT INTO `tb_region` VALUES ('131181', '冀州市', '131100', '冀州', '4', '0318', '053200', '中国,河北省,衡水市,冀州市', 'Jizhou', '115.57934', '37.55082');
INSERT INTO `tb_region` VALUES ('131182', '深州市', '131100', '深州', '4', '0318', '053800', '中国,河北省,衡水市,深州市', 'Shenzhou', '115.55993', '38.00109');
INSERT INTO `tb_region` VALUES ('140000', '山西省', '100004', '山西', '2', '', '', '中国,山西省', 'Shanxi', '112.549248', '37.857014');
INSERT INTO `tb_region` VALUES ('140100', '太原市', '140000', '太原', '3', '0351', '030082', '中国,山西省,太原市', 'Taiyuan', '112.549248', '37.857014');
INSERT INTO `tb_region` VALUES ('140105', '小店区', '140100', '小店', '4', '0351', '030032', '中国,山西省,太原市,小店区', 'Xiaodian', '112.56878', '37.73565');
INSERT INTO `tb_region` VALUES ('140106', '迎泽区', '140100', '迎泽', '4', '0351', '030002', '中国,山西省,太原市,迎泽区', 'Yingze', '112.56338', '37.86326');
INSERT INTO `tb_region` VALUES ('140107', '杏花岭区', '140100', '杏花岭', '4', '0351', '030009', '中国,山西省,太原市,杏花岭区', 'Xinghualing', '112.56237', '37.88429');
INSERT INTO `tb_region` VALUES ('140108', '尖草坪区', '140100', '尖草坪', '4', '0351', '030023', '中国,山西省,太原市,尖草坪区', 'Jiancaoping', '112.48709', '37.94193');
INSERT INTO `tb_region` VALUES ('140109', '万柏林区', '140100', '万柏林', '4', '0351', '030024', '中国,山西省,太原市,万柏林区', 'Wanbailin', '112.51553', '37.85923');
INSERT INTO `tb_region` VALUES ('140110', '晋源区', '140100', '晋源', '4', '0351', '030025', '中国,山西省,太原市,晋源区', 'Jinyuan', '112.47985', '37.72479');
INSERT INTO `tb_region` VALUES ('140121', '清徐县', '140100', '清徐', '4', '0351', '030400', '中国,山西省,太原市,清徐县', 'Qingxu', '112.35888', '37.60758');
INSERT INTO `tb_region` VALUES ('140122', '阳曲县', '140100', '阳曲', '4', '0351', '030100', '中国,山西省,太原市,阳曲县', 'Yangqu', '112.67861', '38.05989');
INSERT INTO `tb_region` VALUES ('140123', '娄烦县', '140100', '娄烦', '4', '0351', '030300', '中国,山西省,太原市,娄烦县', 'Loufan', '111.79473', '38.06689');
INSERT INTO `tb_region` VALUES ('140181', '古交市', '140100', '古交', '4', '0351', '030200', '中国,山西省,太原市,古交市', 'Gujiao', '112.16918', '37.90983');
INSERT INTO `tb_region` VALUES ('140200', '大同市', '140000', '大同', '3', '0352', '037008', '中国,山西省,大同市', 'Datong', '113.295259', '40.09031');
INSERT INTO `tb_region` VALUES ('140202', '城区', '140200', '城区', '4', '0352', '037008', '中国,山西省,大同市,城区', 'Chengqu', '113.298', '40.07566');
INSERT INTO `tb_region` VALUES ('140203', '矿区', '140200', '矿区', '4', '0352', '037003', '中国,山西省,大同市,矿区', 'Kuangqu', '113.1772', '40.03685');
INSERT INTO `tb_region` VALUES ('140211', '南郊区', '140200', '南郊', '4', '0352', '037001', '中国,山西省,大同市,南郊区', 'Nanjiao', '113.14947', '40.00539');
INSERT INTO `tb_region` VALUES ('140212', '新荣区', '140200', '新荣', '4', '0352', '037002', '中国,山西省,大同市,新荣区', 'Xinrong', '113.13504', '40.25618');
INSERT INTO `tb_region` VALUES ('140221', '阳高县', '140200', '阳高', '4', '0352', '038100', '中国,山西省,大同市,阳高县', 'Yanggao', '113.75012', '40.36256');
INSERT INTO `tb_region` VALUES ('140222', '天镇县', '140200', '天镇', '4', '0352', '038200', '中国,山西省,大同市,天镇县', 'Tianzhen', '114.0931', '40.42299');
INSERT INTO `tb_region` VALUES ('140223', '广灵县', '140200', '广灵', '4', '0352', '037500', '中国,山西省,大同市,广灵县', 'Guangling', '114.28204', '39.76082');
INSERT INTO `tb_region` VALUES ('140224', '灵丘县', '140200', '灵丘', '4', '0352', '034400', '中国,山西省,大同市,灵丘县', 'Lingqiu', '114.23672', '39.44043');
INSERT INTO `tb_region` VALUES ('140225', '浑源县', '140200', '浑源', '4', '0352', '037400', '中国,山西省,大同市,浑源县', 'Hunyuan', '113.69552', '39.69962');
INSERT INTO `tb_region` VALUES ('140226', '左云县', '140200', '左云', '4', '0352', '037100', '中国,山西省,大同市,左云县', 'Zuoyun', '112.70266', '40.01336');
INSERT INTO `tb_region` VALUES ('140227', '大同县', '140200', '大同', '4', '0352', '037300', '中国,山西省,大同市,大同县', 'Datong', '113.61212', '40.04012');
INSERT INTO `tb_region` VALUES ('140300', '阳泉市', '140000', '阳泉', '3', '0353', '045000', '中国,山西省,阳泉市', 'Yangquan', '113.583285', '37.861188');
INSERT INTO `tb_region` VALUES ('140302', '城区', '140300', '城区', '4', '0353', '045000', '中国,山西省,阳泉市,城区', 'Chengqu', '113.60069', '37.8474');
INSERT INTO `tb_region` VALUES ('140303', '矿区', '140300', '矿区', '4', '0353', '045000', '中国,山西省,阳泉市,矿区', 'Kuangqu', '113.55677', '37.86895');
INSERT INTO `tb_region` VALUES ('140311', '郊区', '140300', '郊区', '4', '0353', '045011', '中国,山西省,阳泉市,郊区', 'Jiaoqu', '113.58539', '37.94139');
INSERT INTO `tb_region` VALUES ('140321', '平定县', '140300', '平定', '4', '0353', '045200', '中国,山西省,阳泉市,平定县', 'Pingding', '113.65789', '37.78601');
INSERT INTO `tb_region` VALUES ('140322', '盂县', '140300', '盂县', '4', '0353', '045100', '中国,山西省,阳泉市,盂县', 'Yuxian', '113.41235', '38.08579');
INSERT INTO `tb_region` VALUES ('140400', '长治市', '140000', '长治', '3', '0355', '046000', '中国,山西省,长治市', 'Changzhi', '113.113556', '36.191112');
INSERT INTO `tb_region` VALUES ('140402', '城区', '140400', '城区', '4', '0355', '046011', '中国,山西省,长治市,城区', 'Chengqu', '113.12308', '36.20351');
INSERT INTO `tb_region` VALUES ('140411', '郊区', '140400', '郊区', '4', '0355', '046011', '中国,山西省,长治市,郊区', 'Jiaoqu', '113.12653', '36.19918');
INSERT INTO `tb_region` VALUES ('140421', '长治县', '140400', '长治', '4', '0355', '047100', '中国,山西省,长治市,长治县', 'Changzhi', '113.04791', '36.04722');
INSERT INTO `tb_region` VALUES ('140423', '襄垣县', '140400', '襄垣', '4', '0355', '046200', '中国,山西省,长治市,襄垣县', 'Xiangyuan', '113.05157', '36.53527');
INSERT INTO `tb_region` VALUES ('140424', '屯留县', '140400', '屯留', '4', '0355', '046100', '中国,山西省,长治市,屯留县', 'Tunliu', '112.89196', '36.31579');
INSERT INTO `tb_region` VALUES ('140425', '平顺县', '140400', '平顺', '4', '0355', '047400', '中国,山西省,长治市,平顺县', 'Pingshun', '113.43603', '36.20005');
INSERT INTO `tb_region` VALUES ('140426', '黎城县', '140400', '黎城', '4', '0355', '047600', '中国,山西省,长治市,黎城县', 'Licheng', '113.38766', '36.50301');
INSERT INTO `tb_region` VALUES ('140427', '壶关县', '140400', '壶关', '4', '0355', '047300', '中国,山西省,长治市,壶关县', 'Huguan', '113.207', '36.11301');
INSERT INTO `tb_region` VALUES ('140428', '长子县', '140400', '长子', '4', '0355', '046600', '中国,山西省,长治市,长子县', 'Zhangzi', '112.87731', '36.12125');
INSERT INTO `tb_region` VALUES ('140429', '武乡县', '140400', '武乡', '4', '0355', '046300', '中国,山西省,长治市,武乡县', 'Wuxiang', '112.86343', '36.83687');
INSERT INTO `tb_region` VALUES ('140430', '沁县', '140400', '沁县', '4', '0355', '046400', '中国,山西省,长治市,沁县', 'Qinxian', '112.69863', '36.75628');
INSERT INTO `tb_region` VALUES ('140431', '沁源县', '140400', '沁源', '4', '0355', '046500', '中国,山西省,长治市,沁源县', 'Qinyuan', '112.33758', '36.50008');
INSERT INTO `tb_region` VALUES ('140481', '潞城市', '140400', '潞城', '4', '0355', '047500', '中国,山西省,长治市,潞城市', 'Lucheng', '113.22888', '36.33414');
INSERT INTO `tb_region` VALUES ('140500', '晋城市', '140000', '晋城', '3', '0356', '048000', '中国,山西省,晋城市', 'Jincheng', '112.851274', '35.497553');
INSERT INTO `tb_region` VALUES ('140502', '城区', '140500', '城区', '4', '0356', '048000', '中国,山西省,晋城市,城区', 'Chengqu', '112.85319', '35.50175');
INSERT INTO `tb_region` VALUES ('140521', '沁水县', '140500', '沁水', '4', '0356', '048200', '中国,山西省,晋城市,沁水县', 'Qinshui', '112.1871', '35.69102');
INSERT INTO `tb_region` VALUES ('140522', '阳城县', '140500', '阳城', '4', '0356', '048100', '中国,山西省,晋城市,阳城县', 'Yangcheng', '112.41485', '35.48614');
INSERT INTO `tb_region` VALUES ('140524', '陵川县', '140500', '陵川', '4', '0356', '048300', '中国,山西省,晋城市,陵川县', 'Lingchuan', '113.2806', '35.77532');
INSERT INTO `tb_region` VALUES ('140525', '泽州县', '140500', '泽州', '4', '0356', '048012', '中国,山西省,晋城市,泽州县', 'Zezhou', '112.83947', '35.50789');
INSERT INTO `tb_region` VALUES ('140581', '高平市', '140500', '高平', '4', '0356', '048400', '中国,山西省,晋城市,高平市', 'Gaoping', '112.92288', '35.79705');
INSERT INTO `tb_region` VALUES ('140600', '朔州市', '140000', '朔州', '3', '0349', '038500', '中国,山西省,朔州市', 'Shuozhou', '112.433387', '39.331261');
INSERT INTO `tb_region` VALUES ('140602', '朔城区', '140600', '朔城', '4', '0349', '036000', '中国,山西省,朔州市,朔城区', 'Shuocheng', '112.43189', '39.31982');
INSERT INTO `tb_region` VALUES ('140603', '平鲁区', '140600', '平鲁', '4', '0349', '038600', '中国,山西省,朔州市,平鲁区', 'Pinglu', '112.28833', '39.51155');
INSERT INTO `tb_region` VALUES ('140621', '山阴县', '140600', '山阴', '4', '0349', '036900', '中国,山西省,朔州市,山阴县', 'Shanyin', '112.81662', '39.52697');
INSERT INTO `tb_region` VALUES ('140622', '应县', '140600', '应县', '4', '0349', '037600', '中国,山西省,朔州市,应县', 'Yingxian', '113.19052', '39.55279');
INSERT INTO `tb_region` VALUES ('140623', '右玉县', '140600', '右玉', '4', '0349', '037200', '中国,山西省,朔州市,右玉县', 'Youyu', '112.46902', '39.99011');
INSERT INTO `tb_region` VALUES ('140624', '怀仁县', '140600', '怀仁', '4', '0349', '038300', '中国,山西省,朔州市,怀仁县', 'Huairen', '113.10009', '39.82806');
INSERT INTO `tb_region` VALUES ('140700', '晋中市', '140000', '晋中', '3', '0354', '030600', '中国,山西省,晋中市', 'Jinzhong', '112.736465', '37.696495');
INSERT INTO `tb_region` VALUES ('140702', '榆次区', '140700', '榆次', '4', '0354', '030600', '中国,山西省,晋中市,榆次区', 'Yuci', '112.70788', '37.6978');
INSERT INTO `tb_region` VALUES ('140721', '榆社县', '140700', '榆社', '4', '0354', '031800', '中国,山西省,晋中市,榆社县', 'Yushe', '112.97558', '37.0721');
INSERT INTO `tb_region` VALUES ('140722', '左权县', '140700', '左权', '4', '0354', '032600', '中国,山西省,晋中市,左权县', 'Zuoquan', '113.37918', '37.08235');
INSERT INTO `tb_region` VALUES ('140723', '和顺县', '140700', '和顺', '4', '0354', '032700', '中国,山西省,晋中市,和顺县', 'Heshun', '113.56988', '37.32963');
INSERT INTO `tb_region` VALUES ('140724', '昔阳县', '140700', '昔阳', '4', '0354', '045300', '中国,山西省,晋中市,昔阳县', 'Xiyang', '113.70517', '37.61863');
INSERT INTO `tb_region` VALUES ('140725', '寿阳县', '140700', '寿阳', '4', '0354', '045400', '中国,山西省,晋中市,寿阳县', 'Shouyang', '113.17495', '37.88899');
INSERT INTO `tb_region` VALUES ('140726', '太谷县', '140700', '太谷', '4', '0354', '030800', '中国,山西省,晋中市,太谷县', 'Taigu', '112.55246', '37.42161');
INSERT INTO `tb_region` VALUES ('140727', '祁县', '140700', '祁县', '4', '0354', '030900', '中国,山西省,晋中市,祁县', 'Qixian', '112.33358', '37.3579');
INSERT INTO `tb_region` VALUES ('140728', '平遥县', '140700', '平遥', '4', '0354', '031100', '中国,山西省,晋中市,平遥县', 'Pingyao', '112.17553', '37.1892');
INSERT INTO `tb_region` VALUES ('140729', '灵石县', '140700', '灵石', '4', '0354', '031300', '中国,山西省,晋中市,灵石县', 'Lingshi', '111.7774', '36.84814');
INSERT INTO `tb_region` VALUES ('140781', '介休市', '140700', '介休', '4', '0354', '032000', '中国,山西省,晋中市,介休市', 'Jiexiu', '111.91824', '37.02771');
INSERT INTO `tb_region` VALUES ('140800', '运城市', '140000', '运城', '3', '0359', '044000', '中国,山西省,运城市', 'Yuncheng', '111.003957', '35.022778');
INSERT INTO `tb_region` VALUES ('140802', '盐湖区', '140800', '盐湖', '4', '0359', '044000', '中国,山西省,运城市,盐湖区', 'Yanhu', '110.99827', '35.0151');
INSERT INTO `tb_region` VALUES ('140821', '临猗县', '140800', '临猗', '4', '0359', '044100', '中国,山西省,运城市,临猗县', 'Linyi', '110.77432', '35.14455');
INSERT INTO `tb_region` VALUES ('140822', '万荣县', '140800', '万荣', '4', '0359', '044200', '中国,山西省,运城市,万荣县', 'Wanrong', '110.83657', '35.41556');
INSERT INTO `tb_region` VALUES ('140823', '闻喜县', '140800', '闻喜', '4', '0359', '043800', '中国,山西省,运城市,闻喜县', 'Wenxi', '111.22265', '35.35553');
INSERT INTO `tb_region` VALUES ('140824', '稷山县', '140800', '稷山', '4', '0359', '043200', '中国,山西省,运城市,稷山县', 'Jishan', '110.97924', '35.59993');
INSERT INTO `tb_region` VALUES ('140825', '新绛县', '140800', '新绛', '4', '0359', '043100', '中国,山西省,运城市,新绛县', 'Xinjiang', '111.22509', '35.61566');
INSERT INTO `tb_region` VALUES ('140826', '绛县', '140800', '绛县', '4', '0359', '043600', '中国,山西省,运城市,绛县', 'Jiangxian', '111.56668', '35.49096');
INSERT INTO `tb_region` VALUES ('140827', '垣曲县', '140800', '垣曲', '4', '0359', '043700', '中国,山西省,运城市,垣曲县', 'Yuanqu', '111.67166', '35.29923');
INSERT INTO `tb_region` VALUES ('140828', '夏县', '140800', '夏县', '4', '0359', '044400', '中国,山西省,运城市,夏县', 'Xiaxian', '111.21966', '35.14121');
INSERT INTO `tb_region` VALUES ('140829', '平陆县', '140800', '平陆', '4', '0359', '044300', '中国,山西省,运城市,平陆县', 'Pinglu', '111.21704', '34.83772');
INSERT INTO `tb_region` VALUES ('140830', '芮城县', '140800', '芮城', '4', '0359', '044600', '中国,山西省,运城市,芮城县', 'Ruicheng', '110.69455', '34.69384');
INSERT INTO `tb_region` VALUES ('140881', '永济市', '140800', '永济', '4', '0359', '044500', '中国,山西省,运城市,永济市', 'Yongji', '110.44537', '34.86556');
INSERT INTO `tb_region` VALUES ('140882', '河津市', '140800', '河津', '4', '0359', '043300', '中国,山西省,运城市,河津市', 'Hejin', '110.7116', '35.59478');
INSERT INTO `tb_region` VALUES ('140900', '忻州市', '140000', '忻州', '3', '0350', '034000', '中国,山西省,忻州市', 'Xinzhou', '112.733538', '38.41769');
INSERT INTO `tb_region` VALUES ('140902', '忻府区', '140900', '忻府', '4', '0350', '034000', '中国,山西省,忻州市,忻府区', 'Xinfu', '112.74603', '38.40414');
INSERT INTO `tb_region` VALUES ('140921', '定襄县', '140900', '定襄', '4', '0350', '035400', '中国,山西省,忻州市,定襄县', 'Dingxiang', '112.95733', '38.47387');
INSERT INTO `tb_region` VALUES ('140922', '五台县', '140900', '五台', '4', '0350', '035500', '中国,山西省,忻州市,五台县', 'Wutai', '113.25256', '38.72774');
INSERT INTO `tb_region` VALUES ('140923', '代县', '140900', '代县', '4', '0350', '034200', '中国,山西省,忻州市,代县', 'Daixian', '112.95913', '39.06717');
INSERT INTO `tb_region` VALUES ('140924', '繁峙县', '140900', '繁峙', '4', '0350', '034300', '中国,山西省,忻州市,繁峙县', 'Fanshi', '113.26303', '39.18886');
INSERT INTO `tb_region` VALUES ('140925', '宁武县', '140900', '宁武', '4', '0350', '036700', '中国,山西省,忻州市,宁武县', 'Ningwu', '112.30423', '39.00211');
INSERT INTO `tb_region` VALUES ('140926', '静乐县', '140900', '静乐', '4', '0350', '035100', '中国,山西省,忻州市,静乐县', 'Jingle', '111.94158', '38.3602');
INSERT INTO `tb_region` VALUES ('140927', '神池县', '140900', '神池', '4', '0350', '036100', '中国,山西省,忻州市,神池县', 'Shenchi', '112.20541', '39.09');
INSERT INTO `tb_region` VALUES ('140928', '五寨县', '140900', '五寨', '4', '0350', '036200', '中国,山西省,忻州市,五寨县', 'Wuzhai', '111.8489', '38.90757');
INSERT INTO `tb_region` VALUES ('140929', '岢岚县', '140900', '岢岚', '4', '0350', '036300', '中国,山西省,忻州市,岢岚县', 'Kelan', '111.57388', '38.70452');
INSERT INTO `tb_region` VALUES ('140930', '河曲县', '140900', '河曲', '4', '0350', '036500', '中国,山西省,忻州市,河曲县', 'Hequ', '111.13821', '39.38439');
INSERT INTO `tb_region` VALUES ('140931', '保德县', '140900', '保德', '4', '0350', '036600', '中国,山西省,忻州市,保德县', 'Baode', '111.08656', '39.02248');
INSERT INTO `tb_region` VALUES ('140932', '偏关县', '140900', '偏关', '4', '0350', '036400', '中国,山西省,忻州市,偏关县', 'Pianguan', '111.50863', '39.43609');
INSERT INTO `tb_region` VALUES ('140981', '原平市', '140900', '原平', '4', '0350', '034100', '中国,山西省,忻州市,原平市', 'Yuanping', '112.70584', '38.73181');
INSERT INTO `tb_region` VALUES ('141000', '临汾市', '140000', '临汾', '3', '0357', '041000', '中国,山西省,临汾市', 'Linfen', '111.517973', '36.08415');
INSERT INTO `tb_region` VALUES ('141002', '尧都区', '141000', '尧都', '4', '0357', '041000', '中国,山西省,临汾市,尧都区', 'Yaodu', '111.5787', '36.08298');
INSERT INTO `tb_region` VALUES ('141021', '曲沃县', '141000', '曲沃', '4', '0357', '043400', '中国,山西省,临汾市,曲沃县', 'Quwo', '111.47525', '35.64119');
INSERT INTO `tb_region` VALUES ('141022', '翼城县', '141000', '翼城', '4', '0357', '043500', '中国,山西省,临汾市,翼城县', 'Yicheng', '111.7181', '35.73881');
INSERT INTO `tb_region` VALUES ('141023', '襄汾县', '141000', '襄汾', '4', '0357', '041500', '中国,山西省,临汾市,襄汾县', 'Xiangfen', '111.44204', '35.87711');
INSERT INTO `tb_region` VALUES ('141024', '洪洞县', '141000', '洪洞', '4', '0357', '041600', '中国,山西省,临汾市,洪洞县', 'Hongtong', '111.67501', '36.25425');
INSERT INTO `tb_region` VALUES ('141025', '古县', '141000', '古县', '4', '0357', '042400', '中国,山西省,临汾市,古县', 'Guxian', '111.92041', '36.26688');
INSERT INTO `tb_region` VALUES ('141026', '安泽县', '141000', '安泽', '4', '0357', '042500', '中国,山西省,临汾市,安泽县', 'Anze', '112.24981', '36.14803');
INSERT INTO `tb_region` VALUES ('141027', '浮山县', '141000', '浮山', '4', '0357', '042600', '中国,山西省,临汾市,浮山县', 'Fushan', '111.84744', '35.96854');
INSERT INTO `tb_region` VALUES ('141028', '吉县', '141000', '吉县', '4', '0357', '042200', '中国,山西省,临汾市,吉县', 'Jixian', '110.68148', '36.09873');
INSERT INTO `tb_region` VALUES ('141029', '乡宁县', '141000', '乡宁', '4', '0357', '042100', '中国,山西省,临汾市,乡宁县', 'Xiangning', '110.84652', '35.97072');
INSERT INTO `tb_region` VALUES ('141030', '大宁县', '141000', '大宁', '4', '0357', '042300', '中国,山西省,临汾市,大宁县', 'Daning', '110.75216', '36.46624');
INSERT INTO `tb_region` VALUES ('141031', '隰县', '141000', '隰县', '4', '0357', '041300', '中国,山西省,临汾市,隰县', 'Xixian', '110.93881', '36.69258');
INSERT INTO `tb_region` VALUES ('141032', '永和县', '141000', '永和', '4', '0357', '041400', '中国,山西省,临汾市,永和县', 'Yonghe', '110.63168', '36.7584');
INSERT INTO `tb_region` VALUES ('141033', '蒲县', '141000', '蒲县', '4', '0357', '041200', '中国,山西省,临汾市,蒲县', 'Puxian', '111.09674', '36.41243');
INSERT INTO `tb_region` VALUES ('141034', '汾西县', '141000', '汾西', '4', '0357', '031500', '中国,山西省,临汾市,汾西县', 'Fenxi', '111.56811', '36.65063');
INSERT INTO `tb_region` VALUES ('141081', '侯马市', '141000', '侯马', '4', '0357', '043000', '中国,山西省,临汾市,侯马市', 'Houma', '111.37207', '35.61903');
INSERT INTO `tb_region` VALUES ('141082', '霍州市', '141000', '霍州', '4', '0357', '031400', '中国,山西省,临汾市,霍州市', 'Huozhou', '111.755', '36.5638');
INSERT INTO `tb_region` VALUES ('141100', '吕梁市', '140000', '吕梁', '3', '0358', '033000', '中国,山西省,吕梁市', 'Lvliang', '111.134335', '37.524366');
INSERT INTO `tb_region` VALUES ('141102', '离石区', '141100', '离石', '4', '0358', '033000', '中国,山西省,吕梁市,离石区', 'Lishi', '111.15059', '37.5177');
INSERT INTO `tb_region` VALUES ('141121', '文水县', '141100', '文水', '4', '0358', '032100', '中国,山西省,吕梁市,文水县', 'Wenshui', '112.02829', '37.43841');
INSERT INTO `tb_region` VALUES ('141122', '交城县', '141100', '交城', '4', '0358', '030500', '中国,山西省,吕梁市,交城县', 'Jiaocheng', '112.1585', '37.5512');
INSERT INTO `tb_region` VALUES ('141123', '兴县', '141100', '兴县', '4', '0358', '033600', '中国,山西省,吕梁市,兴县', 'Xingxian', '111.12692', '38.46321');
INSERT INTO `tb_region` VALUES ('141124', '临县', '141100', '临县', '4', '0358', '033200', '中国,山西省,吕梁市,临县', 'Linxian', '110.99282', '37.95271');
INSERT INTO `tb_region` VALUES ('141125', '柳林县', '141100', '柳林', '4', '0358', '033300', '中国,山西省,吕梁市,柳林县', 'Liulin', '110.88922', '37.42932');
INSERT INTO `tb_region` VALUES ('141126', '石楼县', '141100', '石楼', '4', '0358', '032500', '中国,山西省,吕梁市,石楼县', 'Shilou', '110.8352', '36.99731');
INSERT INTO `tb_region` VALUES ('141127', '岚县', '141100', '岚县', '4', '0358', '033500', '中国,山西省,吕梁市,岚县', 'Lanxian', '111.67627', '38.27874');
INSERT INTO `tb_region` VALUES ('141128', '方山县', '141100', '方山', '4', '0358', '033100', '中国,山西省,吕梁市,方山县', 'Fangshan', '111.24011', '37.88979');
INSERT INTO `tb_region` VALUES ('141129', '中阳县', '141100', '中阳', '4', '0358', '033400', '中国,山西省,吕梁市,中阳县', 'Zhongyang', '111.1795', '37.35715');
INSERT INTO `tb_region` VALUES ('141130', '交口县', '141100', '交口', '4', '0358', '032400', '中国,山西省,吕梁市,交口县', 'Jiaokou', '111.18103', '36.98213');
INSERT INTO `tb_region` VALUES ('141181', '孝义市', '141100', '孝义', '4', '0358', '032300', '中国,山西省,吕梁市,孝义市', 'Xiaoyi', '111.77362', '37.14414');
INSERT INTO `tb_region` VALUES ('141182', '汾阳市', '141100', '汾阳', '4', '0358', '032200', '中国,山西省,吕梁市,汾阳市', 'Fenyang', '111.7882', '37.26605');
INSERT INTO `tb_region` VALUES ('150000', '内蒙古自治区', '100004', '内蒙古', '2', '', '', '中国,内蒙古自治区', 'Inner Mongolia', '111.670801', '40.818311');
INSERT INTO `tb_region` VALUES ('150100', '呼和浩特市', '150000', '呼和浩特', '3', '0471', '010000', '中国,内蒙古自治区,呼和浩特市', 'Hohhot', '111.670801', '40.818311');
INSERT INTO `tb_region` VALUES ('150102', '新城区', '150100', '新城', '4', '0471', '010050', '中国,内蒙古自治区,呼和浩特市,新城区', 'Xincheng', '111.66554', '40.85828');
INSERT INTO `tb_region` VALUES ('150103', '回民区', '150100', '回民', '4', '0471', '010030', '中国,内蒙古自治区,呼和浩特市,回民区', 'Huimin', '111.62402', '40.80827');
INSERT INTO `tb_region` VALUES ('150104', '玉泉区', '150100', '玉泉', '4', '0471', '010020', '中国,内蒙古自治区,呼和浩特市,玉泉区', 'Yuquan', '111.67456', '40.75227');
INSERT INTO `tb_region` VALUES ('150105', '赛罕区', '150100', '赛罕', '4', '0471', '010020', '中国,内蒙古自治区,呼和浩特市,赛罕区', 'Saihan', '111.70224', '40.79207');
INSERT INTO `tb_region` VALUES ('150121', '土默特左旗', '150100', '土默特左旗', '4', '0471', '010100', '中国,内蒙古自治区,呼和浩特市,土默特左旗', 'Tumotezuoqi', '111.14898', '40.72229');
INSERT INTO `tb_region` VALUES ('150122', '托克托县', '150100', '托克托', '4', '0471', '010200', '中国,内蒙古自治区,呼和浩特市,托克托县', 'Tuoketuo', '111.19101', '40.27492');
INSERT INTO `tb_region` VALUES ('150123', '和林格尔县', '150100', '和林格尔', '4', '0471', '011500', '中国,内蒙古自治区,呼和浩特市,和林格尔县', 'Helingeer', '111.82205', '40.37892');
INSERT INTO `tb_region` VALUES ('150124', '清水河县', '150100', '清水河', '4', '0471', '011600', '中国,内蒙古自治区,呼和浩特市,清水河县', 'Qingshuihe', '111.68316', '39.9097');
INSERT INTO `tb_region` VALUES ('150125', '武川县', '150100', '武川', '4', '0471', '011700', '中国,内蒙古自治区,呼和浩特市,武川县', 'Wuchuan', '111.45785', '41.09289');
INSERT INTO `tb_region` VALUES ('150200', '包头市', '150000', '包头', '3', '0472', '014025', '中国,内蒙古自治区,包头市', 'Baotou', '109.840405', '40.658168');
INSERT INTO `tb_region` VALUES ('150202', '东河区', '150200', '东河', '4', '0472', '014040', '中国,内蒙古自治区,包头市,东河区', 'Donghe', '110.0462', '40.58237');
INSERT INTO `tb_region` VALUES ('150203', '昆都仑区', '150200', '昆都仑', '4', '0472', '014010', '中国,内蒙古自治区,包头市,昆都仑区', 'Kundulun', '109.83862', '40.64175');
INSERT INTO `tb_region` VALUES ('150204', '青山区', '150200', '青山', '4', '0472', '014030', '中国,内蒙古自治区,包头市,青山区', 'Qingshan', '109.90131', '40.64329');
INSERT INTO `tb_region` VALUES ('150205', '石拐区', '150200', '石拐', '4', '0472', '014070', '中国,内蒙古自治区,包头市,石拐区', 'Shiguai', '110.27322', '40.67297');
INSERT INTO `tb_region` VALUES ('150206', '白云鄂博矿区', '150200', '白云鄂博矿区', '4', '0472', '014080', '中国,内蒙古自治区,包头市,白云鄂博矿区', 'Baiyunebokuangqu', '109.97367', '41.76968');
INSERT INTO `tb_region` VALUES ('150207', '九原区', '150200', '九原', '4', '0472', '014060', '中国,内蒙古自治区,包头市,九原区', 'Jiuyuan', '109.96496', '40.60554');
INSERT INTO `tb_region` VALUES ('150221', '土默特右旗', '150200', '土默特右旗', '4', '0472', '014100', '中国,内蒙古自治区,包头市,土默特右旗', 'Tumoteyouqi', '110.52417', '40.5688');
INSERT INTO `tb_region` VALUES ('150222', '固阳县', '150200', '固阳', '4', '0472', '014200', '中国,内蒙古自治区,包头市,固阳县', 'Guyang', '110.06372', '41.01851');
INSERT INTO `tb_region` VALUES ('150223', '达尔罕茂明安联合旗', '150200', '达茂旗', '4', '0472', '014500', '中国,内蒙古自治区,包头市,达尔罕茂明安联合旗', 'Damaoqi', '110.43258', '41.69875');
INSERT INTO `tb_region` VALUES ('150300', '乌海市', '150000', '乌海', '3', '0473', '016000', '中国,内蒙古自治区,乌海市', 'Wuhai', '106.825563', '39.673734');
INSERT INTO `tb_region` VALUES ('150302', '海勃湾区', '150300', '海勃湾', '4', '0473', '016000', '中国,内蒙古自治区,乌海市,海勃湾区', 'Haibowan', '106.8222', '39.66955');
INSERT INTO `tb_region` VALUES ('150303', '海南区', '150300', '海南', '4', '0473', '016030', '中国,内蒙古自治区,乌海市,海南区', 'Hainan', '106.88656', '39.44128');
INSERT INTO `tb_region` VALUES ('150304', '乌达区', '150300', '乌达', '4', '0473', '016040', '中国,内蒙古自治区,乌海市,乌达区', 'Wuda', '106.72723', '39.505');
INSERT INTO `tb_region` VALUES ('150400', '赤峰市', '150000', '赤峰', '3', '0476', '024000', '中国,内蒙古自治区,赤峰市', 'Chifeng', '118.956806', '42.275317');
INSERT INTO `tb_region` VALUES ('150402', '红山区', '150400', '红山', '4', '0476', '024020', '中国,内蒙古自治区,赤峰市,红山区', 'Hongshan', '118.95755', '42.24312');
INSERT INTO `tb_region` VALUES ('150403', '元宝山区', '150400', '元宝山', '4', '0476', '024076', '中国,内蒙古自治区,赤峰市,元宝山区', 'Yuanbaoshan', '119.28921', '42.04005');
INSERT INTO `tb_region` VALUES ('150404', '松山区', '150400', '松山', '4', '0476', '024005', '中国,内蒙古自治区,赤峰市,松山区', 'Songshan', '118.9328', '42.28613');
INSERT INTO `tb_region` VALUES ('150421', '阿鲁科尔沁旗', '150400', '阿鲁科尔沁旗', '4', '0476', '025550', '中国,内蒙古自治区,赤峰市,阿鲁科尔沁旗', 'Alukeerqinqi', '120.06527', '43.87988');
INSERT INTO `tb_region` VALUES ('150422', '巴林左旗', '150400', '巴林左旗', '4', '0476', '025450', '中国,内蒙古自治区,赤峰市,巴林左旗', 'Balinzuoqi', '119.38012', '43.97031');
INSERT INTO `tb_region` VALUES ('150423', '巴林右旗', '150400', '巴林右旗', '4', '0476', '025150', '中国,内蒙古自治区,赤峰市,巴林右旗', 'Balinyouqi', '118.66461', '43.53387');
INSERT INTO `tb_region` VALUES ('150424', '林西县', '150400', '林西', '4', '0476', '025250', '中国,内蒙古自治区,赤峰市,林西县', 'Linxi', '118.04733', '43.61165');
INSERT INTO `tb_region` VALUES ('150425', '克什克腾旗', '150400', '克什克腾旗', '4', '0476', '025350', '中国,内蒙古自治区,赤峰市,克什克腾旗', 'Keshiketengqi', '117.54562', '43.26501');
INSERT INTO `tb_region` VALUES ('150426', '翁牛特旗', '150400', '翁牛特旗', '4', '0476', '024500', '中国,内蒙古自治区,赤峰市,翁牛特旗', 'Wengniuteqi', '119.03042', '42.93147');
INSERT INTO `tb_region` VALUES ('150428', '喀喇沁旗', '150400', '喀喇沁旗', '4', '0476', '024400', '中国,内蒙古自治区,赤峰市,喀喇沁旗', 'Kalaqinqi', '118.70144', '41.92917');
INSERT INTO `tb_region` VALUES ('150429', '宁城县', '150400', '宁城', '4', '0476', '024200', '中国,内蒙古自治区,赤峰市,宁城县', 'Ningcheng', '119.34375', '41.59661');
INSERT INTO `tb_region` VALUES ('150430', '敖汉旗', '150400', '敖汉旗', '4', '0476', '024300', '中国,内蒙古自治区,赤峰市,敖汉旗', 'Aohanqi', '119.92163', '42.29071');
INSERT INTO `tb_region` VALUES ('150500', '通辽市', '150000', '通辽', '3', '0475', '028000', '中国,内蒙古自治区,通辽市', 'Tongliao', '122.263119', '43.617429');
INSERT INTO `tb_region` VALUES ('150502', '科尔沁区', '150500', '科尔沁', '4', '0475', '028000', '中国,内蒙古自治区,通辽市,科尔沁区', 'Keerqin', '122.25573', '43.62257');
INSERT INTO `tb_region` VALUES ('150521', '科尔沁左翼中旗', '150500', '科尔沁左翼中旗', '4', '0475', '029300', '中国,内蒙古自治区,通辽市,科尔沁左翼中旗', 'Keerqinzuoyizhongqi', '123.31912', '44.13014');
INSERT INTO `tb_region` VALUES ('150522', '科尔沁左翼后旗', '150500', '科尔沁左翼后旗', '4', '0475', '028100', '中国,内蒙古自治区,通辽市,科尔沁左翼后旗', 'Keerqinzuoyihouqi', '122.35745', '42.94897');
INSERT INTO `tb_region` VALUES ('150523', '开鲁县', '150500', '开鲁', '4', '0475', '028400', '中国,内蒙古自治区,通辽市,开鲁县', 'Kailu', '121.31884', '43.60003');
INSERT INTO `tb_region` VALUES ('150524', '库伦旗', '150500', '库伦旗', '4', '0475', '028200', '中国,内蒙古自治区,通辽市,库伦旗', 'Kulunqi', '121.776', '42.72998');
INSERT INTO `tb_region` VALUES ('150525', '奈曼旗', '150500', '奈曼旗', '4', '0475', '028300', '中国,内蒙古自治区,通辽市,奈曼旗', 'Naimanqi', '120.66348', '42.84527');
INSERT INTO `tb_region` VALUES ('150526', '扎鲁特旗', '150500', '扎鲁特旗', '4', '0475', '029100', '中国,内蒙古自治区,通辽市,扎鲁特旗', 'Zhaluteqi', '120.91507', '44.55592');
INSERT INTO `tb_region` VALUES ('150581', '霍林郭勒市', '150500', '霍林郭勒', '4', '0475', '029200', '中国,内蒙古自治区,通辽市,霍林郭勒市', 'Huolinguole', '119.65429', '45.53454');
INSERT INTO `tb_region` VALUES ('150600', '鄂尔多斯市', '150000', '鄂尔多斯', '3', '0477', '017004', '中国,内蒙古自治区,鄂尔多斯市', 'Ordos', '109.99029', '39.817179');
INSERT INTO `tb_region` VALUES ('150602', '东胜区', '150600', '东胜', '4', '0477', '017000', '中国,内蒙古自治区,鄂尔多斯市,东胜区', 'Dongsheng', '109.96289', '39.82236');
INSERT INTO `tb_region` VALUES ('150621', '达拉特旗', '150600', '达拉特旗', '4', '0477', '014300', '中国,内蒙古自治区,鄂尔多斯市,达拉特旗', 'Dalateqi', '110.03317', '40.4001');
INSERT INTO `tb_region` VALUES ('150622', '准格尔旗', '150600', '准格尔旗', '4', '0477', '017100', '中国,内蒙古自治区,鄂尔多斯市,准格尔旗', 'Zhungeerqi', '111.23645', '39.86783');
INSERT INTO `tb_region` VALUES ('150623', '鄂托克前旗', '150600', '鄂托克前旗', '4', '0477', '016200', '中国,内蒙古自治区,鄂尔多斯市,鄂托克前旗', 'Etuokeqianqi', '107.48403', '38.18396');
INSERT INTO `tb_region` VALUES ('150624', '鄂托克旗', '150600', '鄂托克旗', '4', '0477', '016100', '中国,内蒙古自治区,鄂尔多斯市,鄂托克旗', 'Etuokeqi', '107.98226', '39.09456');
INSERT INTO `tb_region` VALUES ('150625', '杭锦旗', '150600', '杭锦旗', '4', '0477', '017400', '中国,内蒙古自治区,鄂尔多斯市,杭锦旗', 'Hangjinqi', '108.72934', '39.84023');
INSERT INTO `tb_region` VALUES ('150626', '乌审旗', '150600', '乌审旗', '4', '0477', '017300', '中国,内蒙古自治区,鄂尔多斯市,乌审旗', 'Wushenqi', '108.8461', '38.59092');
INSERT INTO `tb_region` VALUES ('150627', '伊金霍洛旗', '150600', '伊金霍洛旗', '4', '0477', '017200', '中国,内蒙古自治区,鄂尔多斯市,伊金霍洛旗', 'Yijinhuoluoqi', '109.74908', '39.57393');
INSERT INTO `tb_region` VALUES ('150700', '呼伦贝尔市', '150000', '呼伦贝尔', '3', '0470', '021008', '中国,内蒙古自治区,呼伦贝尔市', 'Hulunber', '119.758168', '49.215333');
INSERT INTO `tb_region` VALUES ('150702', '海拉尔区', '150700', '海拉尔', '4', '0470', '021000', '中国,内蒙古自治区,呼伦贝尔市,海拉尔区', 'Hailaer', '119.7364', '49.2122');
INSERT INTO `tb_region` VALUES ('150703', '扎赉诺尔区', '150700', '扎赉诺尔', '4', '0470', '021410', '中国,内蒙古自治区,呼伦贝尔市,扎赉诺尔区', 'Zhalainuoer', '117.792702', '49.486943');
INSERT INTO `tb_region` VALUES ('150721', '阿荣旗', '150700', '阿荣旗', '4', '0470', '162750', '中国,内蒙古自治区,呼伦贝尔市,阿荣旗', 'Arongqi', '123.45941', '48.12581');
INSERT INTO `tb_region` VALUES ('150722', '莫力达瓦达斡尔族自治旗', '150700', '莫旗', '4', '0470', '162850', '中国,内蒙古自治区,呼伦贝尔市,莫力达瓦达斡尔族自治旗', 'Moqi', '124.51498', '48.48055');
INSERT INTO `tb_region` VALUES ('150723', '鄂伦春自治旗', '150700', '鄂伦春', '4', '0470', '165450', '中国,内蒙古自治区,呼伦贝尔市,鄂伦春自治旗', 'Elunchun', '123.72604', '50.59777');
INSERT INTO `tb_region` VALUES ('150724', '鄂温克族自治旗', '150700', '鄂温', '4', '0470', '021100', '中国,内蒙古自治区,呼伦贝尔市,鄂温克族自治旗', 'Ewen', '119.7565', '49.14284');
INSERT INTO `tb_region` VALUES ('150725', '陈巴尔虎旗', '150700', '陈巴尔虎旗', '4', '0470', '021500', '中国,内蒙古自治区,呼伦贝尔市,陈巴尔虎旗', 'Chenbaerhuqi', '119.42434', '49.32684');
INSERT INTO `tb_region` VALUES ('150726', '新巴尔虎左旗', '150700', '新巴尔虎左旗', '4', '0470', '021200', '中国,内蒙古自治区,呼伦贝尔市,新巴尔虎左旗', 'Xinbaerhuzuoqi', '118.26989', '48.21842');
INSERT INTO `tb_region` VALUES ('150727', '新巴尔虎右旗', '150700', '新巴尔虎右旗', '4', '0470', '021300', '中国,内蒙古自治区,呼伦贝尔市,新巴尔虎右旗', 'Xinbaerhuyouqi', '116.82366', '48.66473');
INSERT INTO `tb_region` VALUES ('150781', '满洲里市', '150700', '满洲里', '4', '0470', '021400', '中国,内蒙古自治区,呼伦贝尔市,满洲里市', 'Manzhouli', '117.47946', '49.58272');
INSERT INTO `tb_region` VALUES ('150782', '牙克石市', '150700', '牙克石', '4', '0470', '022150', '中国,内蒙古自治区,呼伦贝尔市,牙克石市', 'Yakeshi', '120.7117', '49.2856');
INSERT INTO `tb_region` VALUES ('150783', '扎兰屯市', '150700', '扎兰屯', '4', '0470', '162650', '中国,内蒙古自治区,呼伦贝尔市,扎兰屯市', 'Zhalantun', '122.73757', '48.01363');
INSERT INTO `tb_region` VALUES ('150784', '额尔古纳市', '150700', '额尔古纳', '4', '0470', '022250', '中国,内蒙古自治区,呼伦贝尔市,额尔古纳市', 'Eerguna', '120.19094', '50.24249');
INSERT INTO `tb_region` VALUES ('150785', '根河市', '150700', '根河', '4', '0470', '022350', '中国,内蒙古自治区,呼伦贝尔市,根河市', 'Genhe', '121.52197', '50.77996');
INSERT INTO `tb_region` VALUES ('150800', '巴彦淖尔市', '150000', '巴彦淖尔', '3', '0478', '015001', '中国,内蒙古自治区,巴彦淖尔市', 'Bayan Nur', '107.416959', '40.757402');
INSERT INTO `tb_region` VALUES ('150802', '临河区', '150800', '临河', '4', '0478', '015001', '中国,内蒙古自治区,巴彦淖尔市,临河区', 'Linhe', '107.42668', '40.75827');
INSERT INTO `tb_region` VALUES ('150821', '五原县', '150800', '五原', '4', '0478', '015100', '中国,内蒙古自治区,巴彦淖尔市,五原县', 'Wuyuan', '108.26916', '41.09631');
INSERT INTO `tb_region` VALUES ('150822', '磴口县', '150800', '磴口', '4', '0478', '015200', '中国,内蒙古自治区,巴彦淖尔市,磴口县', 'Dengkou', '107.00936', '40.33062');
INSERT INTO `tb_region` VALUES ('150823', '乌拉特前旗', '150800', '乌拉特前旗', '4', '0478', '014400', '中国,内蒙古自治区,巴彦淖尔市,乌拉特前旗', 'Wulateqianqi', '108.65219', '40.73649');
INSERT INTO `tb_region` VALUES ('150824', '乌拉特中旗', '150800', '乌拉特中旗', '4', '0478', '015300', '中国,内蒙古自治区,巴彦淖尔市,乌拉特中旗', 'Wulatezhongqi', '108.52587', '41.56789');
INSERT INTO `tb_region` VALUES ('150825', '乌拉特后旗', '150800', '乌拉特后旗', '4', '0478', '015500', '中国,内蒙古自治区,巴彦淖尔市,乌拉特后旗', 'Wulatehouqi', '106.98971', '41.43151');
INSERT INTO `tb_region` VALUES ('150826', '杭锦后旗', '150800', '杭锦后旗', '4', '0478', '015400', '中国,内蒙古自治区,巴彦淖尔市,杭锦后旗', 'Hangjinhouqi', '107.15133', '40.88627');
INSERT INTO `tb_region` VALUES ('150900', '乌兰察布市', '150000', '乌兰察布', '3', '0474', '012000', '中国,内蒙古自治区,乌兰察布市', 'Ulanqab', '113.114543', '41.034126');
INSERT INTO `tb_region` VALUES ('150902', '集宁区', '150900', '集宁', '4', '0474', '012000', '中国,内蒙古自治区,乌兰察布市,集宁区', 'Jining', '113.11452', '41.0353');
INSERT INTO `tb_region` VALUES ('150921', '卓资县', '150900', '卓资', '4', '0474', '012300', '中国,内蒙古自治区,乌兰察布市,卓资县', 'Zhuozi', '112.57757', '40.89414');
INSERT INTO `tb_region` VALUES ('150922', '化德县', '150900', '化德', '4', '0474', '013350', '中国,内蒙古自治区,乌兰察布市,化德县', 'Huade', '114.01071', '41.90433');
INSERT INTO `tb_region` VALUES ('150923', '商都县', '150900', '商都', '4', '0474', '013450', '中国,内蒙古自治区,乌兰察布市,商都县', 'Shangdu', '113.57772', '41.56213');
INSERT INTO `tb_region` VALUES ('150924', '兴和县', '150900', '兴和', '4', '0474', '013650', '中国,内蒙古自治区,乌兰察布市,兴和县', 'Xinghe', '113.83395', '40.87186');
INSERT INTO `tb_region` VALUES ('150925', '凉城县', '150900', '凉城', '4', '0474', '013750', '中国,内蒙古自治区,乌兰察布市,凉城县', 'Liangcheng', '112.49569', '40.53346');
INSERT INTO `tb_region` VALUES ('150926', '察哈尔右翼前旗', '150900', '察右前旗', '4', '0474', '012200', '中国,内蒙古自治区,乌兰察布市,察哈尔右翼前旗', 'Chayouqianqi', '113.22131', '40.7788');
INSERT INTO `tb_region` VALUES ('150927', '察哈尔右翼中旗', '150900', '察右中旗', '4', '0474', '013550', '中国,内蒙古自治区,乌兰察布市,察哈尔右翼中旗', 'Chayouzhongqi', '112.63537', '41.27742');
INSERT INTO `tb_region` VALUES ('150928', '察哈尔右翼后旗', '150900', '察右后旗', '4', '0474', '012400', '中国,内蒙古自治区,乌兰察布市,察哈尔右翼后旗', 'Chayouhouqi', '113.19216', '41.43554');
INSERT INTO `tb_region` VALUES ('150929', '四子王旗', '150900', '四子王旗', '4', '0474', '011800', '中国,内蒙古自治区,乌兰察布市,四子王旗', 'Siziwangqi', '111.70654', '41.53312');
INSERT INTO `tb_region` VALUES ('150981', '丰镇市', '150900', '丰镇', '4', '0474', '012100', '中国,内蒙古自治区,乌兰察布市,丰镇市', 'Fengzhen', '113.10983', '40.4369');
INSERT INTO `tb_region` VALUES ('152200', '兴安盟', '150000', '兴安盟', '3', '0482', '137401', '中国,内蒙古自治区,兴安盟', 'Hinggan', '122.070317', '46.076268');
INSERT INTO `tb_region` VALUES ('152201', '乌兰浩特市', '152200', '乌兰浩特', '4', '0482', '137401', '中国,内蒙古自治区,兴安盟,乌兰浩特市', 'Wulanhaote', '122.06378', '46.06235');
INSERT INTO `tb_region` VALUES ('152202', '阿尔山市', '152200', '阿尔山', '4', '0482', '137800', '中国,内蒙古自治区,兴安盟,阿尔山市', 'Aershan', '119.94317', '47.17716');
INSERT INTO `tb_region` VALUES ('152221', '科尔沁右翼前旗', '152200', '科右前旗', '4', '0482', '137423', '中国,内蒙古自治区,兴安盟,科尔沁右翼前旗', 'Keyouqianqi', '121.95269', '46.0795');
INSERT INTO `tb_region` VALUES ('152222', '科尔沁右翼中旗', '152200', '科右中旗', '4', '0482', '029400', '中国,内蒙古自治区,兴安盟,科尔沁右翼中旗', 'Keyouzhongqi', '121.46807', '45.05605');
INSERT INTO `tb_region` VALUES ('152223', '扎赉特旗', '152200', '扎赉特旗', '4', '0482', '137600', '中国,内蒙古自治区,兴安盟,扎赉特旗', 'Zhalaiteqi', '122.91229', '46.7267');
INSERT INTO `tb_region` VALUES ('152224', '突泉县', '152200', '突泉', '4', '0482', '137500', '中国,内蒙古自治区,兴安盟,突泉县', 'Tuquan', '121.59396', '45.38187');
INSERT INTO `tb_region` VALUES ('152500', '锡林郭勒盟', '150000', '锡林郭勒盟', '3', '0479', '026000', '中国,内蒙古自治区,锡林郭勒盟', 'Xilin Gol', '116.090996', '43.944018');
INSERT INTO `tb_region` VALUES ('152501', '二连浩特市', '152500', '二连浩特', '4', '0479', '011100', '中国,内蒙古自治区,锡林郭勒盟,二连浩特市', 'Erlianhaote', '111.98297', '43.65303');
INSERT INTO `tb_region` VALUES ('152502', '锡林浩特市', '152500', '锡林浩特', '4', '0479', '026021', '中国,内蒙古自治区,锡林郭勒盟,锡林浩特市', 'Xilinhaote', '116.08603', '43.93341');
INSERT INTO `tb_region` VALUES ('152522', '阿巴嘎旗', '152500', '阿巴嘎旗', '4', '0479', '011400', '中国,内蒙古自治区,锡林郭勒盟,阿巴嘎旗', 'Abagaqi', '114.96826', '44.02174');
INSERT INTO `tb_region` VALUES ('152523', '苏尼特左旗', '152500', '苏尼特左旗', '4', '0479', '011300', '中国,内蒙古自治区,锡林郭勒盟,苏尼特左旗', 'Sunitezuoqi', '113.6506', '43.85687');
INSERT INTO `tb_region` VALUES ('152524', '苏尼特右旗', '152500', '苏尼特右旗', '4', '0479', '011200', '中国,内蒙古自治区,锡林郭勒盟,苏尼特右旗', 'Suniteyouqi', '112.65741', '42.7469');
INSERT INTO `tb_region` VALUES ('152525', '东乌珠穆沁旗', '152500', '东乌旗', '4', '0479', '026300', '中国,内蒙古自治区,锡林郭勒盟,东乌珠穆沁旗', 'Dongwuqi', '116.97293', '45.51108');
INSERT INTO `tb_region` VALUES ('152526', '西乌珠穆沁旗', '152500', '西乌旗', '4', '0479', '026200', '中国,内蒙古自治区,锡林郭勒盟,西乌珠穆沁旗', 'Xiwuqi', '117.60983', '44.59623');
INSERT INTO `tb_region` VALUES ('152527', '太仆寺旗', '152500', '太仆寺旗', '4', '0479', '027000', '中国,内蒙古自治区,锡林郭勒盟,太仆寺旗', 'Taipusiqi', '115.28302', '41.87727');
INSERT INTO `tb_region` VALUES ('152528', '镶黄旗', '152500', '镶黄旗', '4', '0479', '013250', '中国,内蒙古自治区,锡林郭勒盟,镶黄旗', 'Xianghuangqi', '113.84472', '42.23927');
INSERT INTO `tb_region` VALUES ('152529', '正镶白旗', '152500', '正镶白旗', '4', '0479', '013800', '中国,内蒙古自治区,锡林郭勒盟,正镶白旗', 'Zhengxiangbaiqi', '115.00067', '42.30712');
INSERT INTO `tb_region` VALUES ('152530', '正蓝旗', '152500', '正蓝旗', '4', '0479', '027200', '中国,内蒙古自治区,锡林郭勒盟,正蓝旗', 'Zhenglanqi', '116.00363', '42.25229');
INSERT INTO `tb_region` VALUES ('152531', '多伦县', '152500', '多伦', '4', '0479', '027300', '中国,内蒙古自治区,锡林郭勒盟,多伦县', 'Duolun', '116.48565', '42.203');
INSERT INTO `tb_region` VALUES ('152900', '阿拉善盟', '150000', '阿拉善盟', '3', '0483', '750306', '中国,内蒙古自治区,阿拉善盟', 'Alxa', '105.706422', '38.844814');
INSERT INTO `tb_region` VALUES ('152921', '阿拉善左旗', '152900', '阿拉善左旗', '4', '0483', '750306', '中国,内蒙古自治区,阿拉善盟,阿拉善左旗', 'Alashanzuoqi', '105.67532', '38.8293');
INSERT INTO `tb_region` VALUES ('152922', '阿拉善右旗', '152900', '阿拉善右旗', '4', '0483', '737300', '中国,内蒙古自治区,阿拉善盟,阿拉善右旗', 'Alashanyouqi', '101.66705', '39.21533');
INSERT INTO `tb_region` VALUES ('152923', '额济纳旗', '152900', '额济纳旗', '4', '0483', '735400', '中国,内蒙古自治区,阿拉善盟,额济纳旗', 'Ejinaqi', '101.06887', '41.96755');
INSERT INTO `tb_region` VALUES ('210000', '辽宁省', '100007', '辽宁', '2', '', '', '中国,辽宁省', 'Liaoning', '123.429096', '41.796767');
INSERT INTO `tb_region` VALUES ('210100', '沈阳市', '210000', '沈阳', '3', '024', '110013', '中国,辽宁省,沈阳市', 'Shenyang', '123.429096', '41.796767');
INSERT INTO `tb_region` VALUES ('210102', '和平区', '210100', '和平', '4', '024', '110001', '中国,辽宁省,沈阳市,和平区', 'Heping', '123.4204', '41.78997');
INSERT INTO `tb_region` VALUES ('210103', '沈河区', '210100', '沈河', '4', '024', '110011', '中国,辽宁省,沈阳市,沈河区', 'Shenhe', '123.45871', '41.79625');
INSERT INTO `tb_region` VALUES ('210104', '大东区', '210100', '大东', '4', '024', '110041', '中国,辽宁省,沈阳市,大东区', 'Dadong', '123.46997', '41.80539');
INSERT INTO `tb_region` VALUES ('210105', '皇姑区', '210100', '皇姑', '4', '024', '110031', '中国,辽宁省,沈阳市,皇姑区', 'Huanggu', '123.42527', '41.82035');
INSERT INTO `tb_region` VALUES ('210106', '铁西区', '210100', '铁西', '4', '024', '110021', '中国,辽宁省,沈阳市,铁西区', 'Tiexi', '123.37675', '41.80269');
INSERT INTO `tb_region` VALUES ('210111', '苏家屯区', '210100', '苏家屯', '4', '024', '110101', '中国,辽宁省,沈阳市,苏家屯区', 'Sujiatun', '123.34405', '41.66475');
INSERT INTO `tb_region` VALUES ('210112', '浑南区', '210100', '浑南', '4', '024', '110015', '中国,辽宁省,沈阳市,浑南区', 'Hunnan', '123.457707', '41.719450');
INSERT INTO `tb_region` VALUES ('210113', '沈北新区', '210100', '沈北新区', '4', '024', '110121', '中国,辽宁省,沈阳市,沈北新区', 'Shenbeixinqu', '123.52658', '42.05297');
INSERT INTO `tb_region` VALUES ('210114', '于洪区', '210100', '于洪', '4', '024', '110141', '中国,辽宁省,沈阳市,于洪区', 'Yuhong', '123.30807', '41.794');
INSERT INTO `tb_region` VALUES ('210122', '辽中县', '210100', '辽中', '4', '024', '110200', '中国,辽宁省,沈阳市,辽中县', 'Liaozhong', '122.72659', '41.51302');
INSERT INTO `tb_region` VALUES ('210123', '康平县', '210100', '康平', '4', '024', '110500', '中国,辽宁省,沈阳市,康平县', 'Kangping', '123.35446', '42.75081');
INSERT INTO `tb_region` VALUES ('210124', '法库县', '210100', '法库', '4', '024', '110400', '中国,辽宁省,沈阳市,法库县', 'Faku', '123.41214', '42.50608');
INSERT INTO `tb_region` VALUES ('210181', '新民市', '210100', '新民', '4', '024', '110300', '中国,辽宁省,沈阳市,新民市', 'Xinmin', '122.82867', '41.99847');
INSERT INTO `tb_region` VALUES ('210200', '大连市', '210000', '大连', '3', '0411', '116011', '中国,辽宁省,大连市', 'Dalian', '121.618622', '38.91459');
INSERT INTO `tb_region` VALUES ('210202', '中山区', '210200', '中山', '4', '0411', '116001', '中国,辽宁省,大连市,中山区', 'Zhongshan', '121.64465', '38.91859');
INSERT INTO `tb_region` VALUES ('210203', '西岗区', '210200', '西岗', '4', '0411', '116011', '中国,辽宁省,大连市,西岗区', 'Xigang', '121.61238', '38.91469');
INSERT INTO `tb_region` VALUES ('210204', '沙河口区', '210200', '沙河口', '4', '0411', '116021', '中国,辽宁省,大连市,沙河口区', 'Shahekou', '121.58017', '38.90536');
INSERT INTO `tb_region` VALUES ('210211', '甘井子区', '210200', '甘井子', '4', '0411', '116033', '中国,辽宁省,大连市,甘井子区', 'Ganjingzi', '121.56567', '38.95017');
INSERT INTO `tb_region` VALUES ('210212', '旅顺口区', '210200', '旅顺口', '4', '0411', '116041', '中国,辽宁省,大连市,旅顺口区', 'Lvshunkou', '121.26202', '38.85125');
INSERT INTO `tb_region` VALUES ('210213', '金州区', '210200', '金州', '4', '0411', '116100', '中国,辽宁省,大连市,金州区', 'Jinzhou', '121.71893', '39.1004');
INSERT INTO `tb_region` VALUES ('210224', '长海县', '210200', '长海', '4', '0411', '116500', '中国,辽宁省,大连市,长海县', 'Changhai', '122.58859', '39.27274');
INSERT INTO `tb_region` VALUES ('210281', '瓦房店市', '210200', '瓦房店', '4', '0411', '116300', '中国,辽宁省,大连市,瓦房店市', 'Wafangdian', '121.98104', '39.62843');
INSERT INTO `tb_region` VALUES ('210282', '普兰店市', '210200', '普兰店', '4', '0411', '116200', '中国,辽宁省,大连市,普兰店市', 'Pulandian', '121.96316', '39.39465');
INSERT INTO `tb_region` VALUES ('210283', '庄河市', '210200', '庄河', '4', '0411', '116400', '中国,辽宁省,大连市,庄河市', 'Zhuanghe', '122.96725', '39.68815');
INSERT INTO `tb_region` VALUES ('210300', '鞍山市', '210000', '鞍山', '3', '0412', '114001', '中国,辽宁省,鞍山市', 'Anshan', '122.995632', '41.110626');
INSERT INTO `tb_region` VALUES ('210302', '铁东区', '210300', '铁东', '4', '0412', '114001', '中国,辽宁省,鞍山市,铁东区', 'Tiedong', '122.99085', '41.08975');
INSERT INTO `tb_region` VALUES ('210303', '铁西区', '210300', '铁西', '4', '0413', '114013', '中国,辽宁省,鞍山市,铁西区', 'Tiexi', '122.96967', '41.11977');
INSERT INTO `tb_region` VALUES ('210304', '立山区', '210300', '立山', '4', '0414', '114031', '中国,辽宁省,鞍山市,立山区', 'Lishan', '123.02948', '41.15008');
INSERT INTO `tb_region` VALUES ('210311', '千山区', '210300', '千山', '4', '0415', '114041', '中国,辽宁省,鞍山市,千山区', 'Qianshan', '122.96048', '41.07507');
INSERT INTO `tb_region` VALUES ('210321', '台安县', '210300', '台安', '4', '0417', '114100', '中国,辽宁省,鞍山市,台安县', 'Tai\'an', '122.43585', '41.41265');
INSERT INTO `tb_region` VALUES ('210323', '岫岩满族自治县', '210300', '岫岩', '4', '0418', '114300', '中国,辽宁省,鞍山市,岫岩满族自治县', 'Xiuyan', '123.28875', '40.27996');
INSERT INTO `tb_region` VALUES ('210381', '海城市', '210300', '海城', '4', '0416', '114200', '中国,辽宁省,鞍山市,海城市', 'Haicheng', '122.68457', '40.88142');
INSERT INTO `tb_region` VALUES ('210400', '抚顺市', '210000', '抚顺', '3', '024', '113008', '中国,辽宁省,抚顺市', 'Fushun', '123.921109', '41.875956');
INSERT INTO `tb_region` VALUES ('210402', '新抚区', '210400', '新抚', '4', '024', '113008', '中国,辽宁省,抚顺市,新抚区', 'Xinfu', '123.91264', '41.86205');
INSERT INTO `tb_region` VALUES ('210403', '东洲区', '210400', '东洲', '4', '024', '113003', '中国,辽宁省,抚顺市,东洲区', 'Dongzhou', '124.03759', '41.8519');
INSERT INTO `tb_region` VALUES ('210404', '望花区', '210400', '望花', '4', '024', '113001', '中国,辽宁省,抚顺市,望花区', 'Wanghua', '123.78283', '41.85532');
INSERT INTO `tb_region` VALUES ('210411', '顺城区', '210400', '顺城', '4', '024', '113006', '中国,辽宁省,抚顺市,顺城区', 'Shuncheng', '123.94506', '41.88321');
INSERT INTO `tb_region` VALUES ('210421', '抚顺县', '210400', '抚顺', '4', '024', '113006', '中国,辽宁省,抚顺市,抚顺县', 'Fushun', '124.17755', '41.71217');
INSERT INTO `tb_region` VALUES ('210422', '新宾满族自治县', '210400', '新宾', '4', '024', '113200', '中国,辽宁省,抚顺市,新宾满族自治县', 'Xinbin', '125.04049', '41.73409');
INSERT INTO `tb_region` VALUES ('210423', '清原满族自治县', '210400', '清原', '4', '024', '113300', '中国,辽宁省,抚顺市,清原满族自治县', 'Qingyuan', '124.92807', '42.10221');
INSERT INTO `tb_region` VALUES ('210500', '本溪市', '210000', '本溪', '3', '0414', '117000', '中国,辽宁省,本溪市', 'Benxi', '123.770519', '41.297909');
INSERT INTO `tb_region` VALUES ('210502', '平山区', '210500', '平山', '4', '0414', '117000', '中国,辽宁省,本溪市,平山区', 'Pingshan', '123.76892', '41.2997');
INSERT INTO `tb_region` VALUES ('210503', '溪湖区', '210500', '溪湖', '4', '0414', '117002', '中国,辽宁省,本溪市,溪湖区', 'Xihu', '123.76764', '41.32921');
INSERT INTO `tb_region` VALUES ('210504', '明山区', '210500', '明山', '4', '0414', '117021', '中国,辽宁省,本溪市,明山区', 'Mingshan', '123.81746', '41.30827');
INSERT INTO `tb_region` VALUES ('210505', '南芬区', '210500', '南芬', '4', '0414', '117014', '中国,辽宁省,本溪市,南芬区', 'Nanfen', '123.74523', '41.1006');
INSERT INTO `tb_region` VALUES ('210521', '本溪满族自治县', '210500', '本溪', '4', '0414', '117100', '中国,辽宁省,本溪市,本溪满族自治县', 'Benxi', '124.12741', '41.30059');
INSERT INTO `tb_region` VALUES ('210522', '桓仁满族自治县', '210500', '桓仁', '4', '0414', '117200', '中国,辽宁省,本溪市,桓仁满族自治县', 'Huanren', '125.36062', '41.26798');
INSERT INTO `tb_region` VALUES ('210600', '丹东市', '210000', '丹东', '3', '0415', '118000', '中国,辽宁省,丹东市', 'Dandong', '124.383044', '40.124296');
INSERT INTO `tb_region` VALUES ('210602', '元宝区', '210600', '元宝', '4', '0415', '118000', '中国,辽宁省,丹东市,元宝区', 'Yuanbao', '124.39575', '40.13651');
INSERT INTO `tb_region` VALUES ('210603', '振兴区', '210600', '振兴', '4', '0415', '118002', '中国,辽宁省,丹东市,振兴区', 'Zhenxing', '124.36035', '40.10489');
INSERT INTO `tb_region` VALUES ('210604', '振安区', '210600', '振安', '4', '0415', '118001', '中国,辽宁省,丹东市,振安区', 'Zhen\'an', '124.42816', '40.15826');
INSERT INTO `tb_region` VALUES ('210624', '宽甸满族自治县', '210600', '宽甸', '4', '0415', '118200', '中国,辽宁省,丹东市,宽甸满族自治县', 'Kuandian', '124.78247', '40.73187');
INSERT INTO `tb_region` VALUES ('210681', '东港市', '210600', '东港', '4', '0415', '118300', '中国,辽宁省,丹东市,东港市', 'Donggang', '124.16287', '39.86256');
INSERT INTO `tb_region` VALUES ('210682', '凤城市', '210600', '凤城', '4', '0415', '118100', '中国,辽宁省,丹东市,凤城市', 'Fengcheng', '124.06671', '40.45302');
INSERT INTO `tb_region` VALUES ('210700', '锦州市', '210000', '锦州', '3', '0416', '121000', '中国,辽宁省,锦州市', 'Jinzhou', '121.135742', '41.119269');
INSERT INTO `tb_region` VALUES ('210702', '古塔区', '210700', '古塔', '4', '0416', '121001', '中国,辽宁省,锦州市,古塔区', 'Guta', '121.12832', '41.11725');
INSERT INTO `tb_region` VALUES ('210703', '凌河区', '210700', '凌河', '4', '0416', '121000', '中国,辽宁省,锦州市,凌河区', 'Linghe', '121.15089', '41.11496');
INSERT INTO `tb_region` VALUES ('210711', '太和区', '210700', '太和', '4', '0416', '121011', '中国,辽宁省,锦州市,太和区', 'Taihe', '121.10354', '41.10929');
INSERT INTO `tb_region` VALUES ('210726', '黑山县', '210700', '黑山', '4', '0416', '121400', '中国,辽宁省,锦州市,黑山县', 'Heishan', '122.12081', '41.69417');
INSERT INTO `tb_region` VALUES ('210727', '义县', '210700', '义县', '4', '0416', '121100', '中国,辽宁省,锦州市,义县', 'Yixian', '121.24035', '41.53458');
INSERT INTO `tb_region` VALUES ('210781', '凌海市', '210700', '凌海', '4', '0416', '121200', '中国,辽宁省,锦州市,凌海市', 'Linghai', '121.35705', '41.1737');
INSERT INTO `tb_region` VALUES ('210782', '北镇市', '210700', '北镇', '4', '0416', '121300', '中国,辽宁省,锦州市,北镇市', 'Beizhen', '121.79858', '41.59537');
INSERT INTO `tb_region` VALUES ('210800', '营口市', '210000', '营口', '3', '0417', '115003', '中国,辽宁省,营口市', 'Yingkou', '122.235151', '40.667432');
INSERT INTO `tb_region` VALUES ('210802', '站前区', '210800', '站前', '4', '0417', '115002', '中国,辽宁省,营口市,站前区', 'Zhanqian', '122.25896', '40.67266');
INSERT INTO `tb_region` VALUES ('210803', '西市区', '210800', '西市', '4', '0417', '115004', '中国,辽宁省,营口市,西市区', 'Xishi', '122.20641', '40.6664');
INSERT INTO `tb_region` VALUES ('210804', '鲅鱼圈区', '210800', '鲅鱼圈', '4', '0417', '115007', '中国,辽宁省,营口市,鲅鱼圈区', 'Bayuquan', '122.13266', '40.26865');
INSERT INTO `tb_region` VALUES ('210811', '老边区', '210800', '老边', '4', '0417', '115005', '中国,辽宁省,营口市,老边区', 'Laobian', '122.37996', '40.6803');
INSERT INTO `tb_region` VALUES ('210881', '盖州市', '210800', '盖州', '4', '0417', '115200', '中国,辽宁省,营口市,盖州市', 'Gaizhou', '122.35464', '40.40446');
INSERT INTO `tb_region` VALUES ('210882', '大石桥市', '210800', '大石桥', '4', '0417', '115100', '中国,辽宁省,营口市,大石桥市', 'Dashiqiao', '122.50927', '40.64567');
INSERT INTO `tb_region` VALUES ('210900', '阜新市', '210000', '阜新', '3', '0418', '123000', '中国,辽宁省,阜新市', 'Fuxin', '121.648962', '42.011796');
INSERT INTO `tb_region` VALUES ('210902', '海州区', '210900', '海州', '4', '0418', '123000', '中国,辽宁省,阜新市,海州区', 'Haizhou', '121.65626', '42.01336');
INSERT INTO `tb_region` VALUES ('210903', '新邱区', '210900', '新邱', '4', '0418', '123005', '中国,辽宁省,阜新市,新邱区', 'Xinqiu', '121.79251', '42.09181');
INSERT INTO `tb_region` VALUES ('210904', '太平区', '210900', '太平', '4', '0418', '123003', '中国,辽宁省,阜新市,太平区', 'Taiping', '121.67865', '42.01065');
INSERT INTO `tb_region` VALUES ('210905', '清河门区', '210900', '清河门', '4', '0418', '123006', '中国,辽宁省,阜新市,清河门区', 'Qinghemen', '121.4161', '41.78309');
INSERT INTO `tb_region` VALUES ('210911', '细河区', '210900', '细河', '4', '0418', '123000', '中国,辽宁省,阜新市,细河区', 'Xihe', '121.68013', '42.02533');
INSERT INTO `tb_region` VALUES ('210921', '阜新蒙古族自治县', '210900', '阜新', '4', '0418', '123100', '中国,辽宁省,阜新市,阜新蒙古族自治县', 'Fuxin', '121.75787', '42.0651');
INSERT INTO `tb_region` VALUES ('210922', '彰武县', '210900', '彰武', '4', '0418', '123200', '中国,辽宁省,阜新市,彰武县', 'Zhangwu', '122.54022', '42.38625');
INSERT INTO `tb_region` VALUES ('211000', '辽阳市', '210000', '辽阳', '3', '0419', '111000', '中国,辽宁省,辽阳市', 'Liaoyang', '123.18152', '41.269402');
INSERT INTO `tb_region` VALUES ('211002', '白塔区', '211000', '白塔', '4', '0419', '111000', '中国,辽宁省,辽阳市,白塔区', 'Baita', '123.1747', '41.27025');
INSERT INTO `tb_region` VALUES ('211003', '文圣区', '211000', '文圣', '4', '0419', '111000', '中国,辽宁省,辽阳市,文圣区', 'Wensheng', '123.18521', '41.26267');
INSERT INTO `tb_region` VALUES ('211004', '宏伟区', '211000', '宏伟', '4', '0419', '111003', '中国,辽宁省,辽阳市,宏伟区', 'Hongwei', '123.1929', '41.21852');
INSERT INTO `tb_region` VALUES ('211005', '弓长岭区', '211000', '弓长岭', '4', '0419', '111008', '中国,辽宁省,辽阳市,弓长岭区', 'Gongchangling', '123.41963', '41.15181');
INSERT INTO `tb_region` VALUES ('211011', '太子河区', '211000', '太子河', '4', '0419', '111000', '中国,辽宁省,辽阳市,太子河区', 'Taizihe', '123.18182', '41.25337');
INSERT INTO `tb_region` VALUES ('211021', '辽阳县', '211000', '辽阳', '4', '0419', '111200', '中国,辽宁省,辽阳市,辽阳县', 'Liaoyang', '123.10574', '41.20542');
INSERT INTO `tb_region` VALUES ('211081', '灯塔市', '211000', '灯塔', '4', '0419', '111300', '中国,辽宁省,辽阳市,灯塔市', 'Dengta', '123.33926', '41.42612');
INSERT INTO `tb_region` VALUES ('211100', '盘锦市', '210000', '盘锦', '3', '0427', '124010', '中国,辽宁省,盘锦市', 'Panjin', '122.06957', '41.124484');
INSERT INTO `tb_region` VALUES ('211102', '双台子区', '211100', '双台子', '4', '0427', '124000', '中国,辽宁省,盘锦市,双台子区', 'Shuangtaizi', '122.06011', '41.1906');
INSERT INTO `tb_region` VALUES ('211103', '兴隆台区', '211100', '兴隆台', '4', '0427', '124010', '中国,辽宁省,盘锦市,兴隆台区', 'Xinglongtai', '122.07529', '41.12402');
INSERT INTO `tb_region` VALUES ('211121', '大洼县', '211100', '大洼', '4', '0427', '124200', '中国,辽宁省,盘锦市,大洼县', 'Dawa', '122.08239', '41.00244');
INSERT INTO `tb_region` VALUES ('211122', '盘山县', '211100', '盘山', '4', '0427', '124000', '中国,辽宁省,盘锦市,盘山县', 'Panshan', '121.99777', '41.23805');
INSERT INTO `tb_region` VALUES ('211200', '铁岭市', '210000', '铁岭', '3', '024', '112000', '中国,辽宁省,铁岭市', 'Tieling', '123.844279', '42.290585');
INSERT INTO `tb_region` VALUES ('211202', '银州区', '211200', '银州', '4', '024', '112000', '中国,辽宁省,铁岭市,银州区', 'Yinzhou', '123.8573', '42.29507');
INSERT INTO `tb_region` VALUES ('211204', '清河区', '211200', '清河', '4', '024', '112003', '中国,辽宁省,铁岭市,清河区', 'Qinghe', '124.15911', '42.54679');
INSERT INTO `tb_region` VALUES ('211221', '铁岭县', '211200', '铁岭', '4', '024', '112000', '中国,辽宁省,铁岭市,铁岭县', 'Tieling', '123.77325', '42.22498');
INSERT INTO `tb_region` VALUES ('211223', '西丰县', '211200', '西丰', '4', '024', '112400', '中国,辽宁省,铁岭市,西丰县', 'Xifeng', '124.7304', '42.73756');
INSERT INTO `tb_region` VALUES ('211224', '昌图县', '211200', '昌图', '4', '024', '112500', '中国,辽宁省,铁岭市,昌图县', 'Changtu', '124.11206', '42.78428');
INSERT INTO `tb_region` VALUES ('211281', '调兵山市', '211200', '调兵山', '4', '024', '112700', '中国,辽宁省,铁岭市,调兵山市', 'Diaobingshan', '123.56689', '42.4675');
INSERT INTO `tb_region` VALUES ('211282', '开原市', '211200', '开原', '4', '024', '112300', '中国,辽宁省,铁岭市,开原市', 'Kaiyuan', '124.03945', '42.54585');
INSERT INTO `tb_region` VALUES ('211300', '朝阳市', '210000', '朝阳', '3', '0421', '122000', '中国,辽宁省,朝阳市', 'Chaoyang', '120.451176', '41.576758');
INSERT INTO `tb_region` VALUES ('211302', '双塔区', '211300', '双塔', '4', '0421', '122000', '中国,辽宁省,朝阳市,双塔区', 'Shuangta', '120.45385', '41.566');
INSERT INTO `tb_region` VALUES ('211303', '龙城区', '211300', '龙城', '4', '0421', '122000', '中国,辽宁省,朝阳市,龙城区', 'Longcheng', '120.43719', '41.59264');
INSERT INTO `tb_region` VALUES ('211321', '朝阳县', '211300', '朝阳', '4', '0421', '122000', '中国,辽宁省,朝阳市,朝阳县', 'Chaoyang', '120.17401', '41.4324');
INSERT INTO `tb_region` VALUES ('211322', '建平县', '211300', '建平', '4', '0421', '122400', '中国,辽宁省,朝阳市,建平县', 'Jianping', '119.64392', '41.40315');
INSERT INTO `tb_region` VALUES ('211324', '喀喇沁左翼蒙古族自治县', '211300', '喀喇沁左翼', '4', '0421', '122300', '中国,辽宁省,朝阳市,喀喇沁左翼蒙古族自治县', 'Kalaqinzuoyi', '119.74185', '41.12801');
INSERT INTO `tb_region` VALUES ('211381', '北票市', '211300', '北票', '4', '0421', '122100', '中国,辽宁省,朝阳市,北票市', 'Beipiao', '120.76977', '41.80196');
INSERT INTO `tb_region` VALUES ('211382', '凌源市', '211300', '凌源', '4', '0421', '122500', '中国,辽宁省,朝阳市,凌源市', 'Lingyuan', '119.40148', '41.24558');
INSERT INTO `tb_region` VALUES ('211400', '葫芦岛市', '210000', '葫芦岛', '3', '0429', '125000', '中国,辽宁省,葫芦岛市', 'Huludao', '120.856394', '40.755572');
INSERT INTO `tb_region` VALUES ('211402', '连山区', '211400', '连山', '4', '0429', '125001', '中国,辽宁省,葫芦岛市,连山区', 'Lianshan', '120.86393', '40.75554');
INSERT INTO `tb_region` VALUES ('211403', '龙港区', '211400', '龙港', '4', '0429', '125003', '中国,辽宁省,葫芦岛市,龙港区', 'Longgang', '120.94866', '40.71919');
INSERT INTO `tb_region` VALUES ('211404', '南票区', '211400', '南票', '4', '0429', '125027', '中国,辽宁省,葫芦岛市,南票区', 'Nanpiao', '120.74978', '41.10707');
INSERT INTO `tb_region` VALUES ('211421', '绥中县', '211400', '绥中', '4', '0429', '125200', '中国,辽宁省,葫芦岛市,绥中县', 'Suizhong', '120.34451', '40.32552');
INSERT INTO `tb_region` VALUES ('211422', '建昌县', '211400', '建昌', '4', '0429', '125300', '中国,辽宁省,葫芦岛市,建昌县', 'Jianchang', '119.8377', '40.82448');
INSERT INTO `tb_region` VALUES ('211481', '兴城市', '211400', '兴城', '4', '0429', '125100', '中国,辽宁省,葫芦岛市,兴城市', 'Xingcheng', '120.72537', '40.61492');
INSERT INTO `tb_region` VALUES ('211500', '金普新区', '210000', '金普新区', '3', '0411', '116100', '中国,辽宁省,金普新区', 'Jinpuxinqu', '121.789627', '39.055451');
INSERT INTO `tb_region` VALUES ('211501', '金州新区', '211500', '金州新区', '4', '0411', '116100', '中国,辽宁省,金普新区,金州新区', 'Jinzhouxinqu', '121.784821', '39.052252');
INSERT INTO `tb_region` VALUES ('211502', '普湾新区', '211500', '普湾新区', '4', '0411', '116200', '中国,辽宁省,金普新区,普湾新区', 'Puwanxinqu', '121.812812', '39.330093');
INSERT INTO `tb_region` VALUES ('211503', '保税区', '211500', '保税区', '4', '0411', '116100', '中国,辽宁省,金普新区,保税区', 'Baoshuiqu', '121.94289', '39.224614');
INSERT INTO `tb_region` VALUES ('220000', '吉林省', '100007', '吉林', '2', '', '', '中国,吉林省', 'Jilin', '125.3245', '43.886841');
INSERT INTO `tb_region` VALUES ('220100', '长春市', '220000', '长春', '3', '0431', '130022', '中国,吉林省,长春市', 'Changchun', '125.3245', '43.886841');
INSERT INTO `tb_region` VALUES ('220102', '南关区', '220100', '南关', '4', '0431', '130022', '中国,吉林省,长春市,南关区', 'Nanguan', '125.35035', '43.86401');
INSERT INTO `tb_region` VALUES ('220103', '宽城区', '220100', '宽城', '4', '0431', '130051', '中国,吉林省,长春市,宽城区', 'Kuancheng', '125.32635', '43.90182');
INSERT INTO `tb_region` VALUES ('220104', '朝阳区', '220100', '朝阳', '4', '0431', '130012', '中国,吉林省,长春市,朝阳区', 'Chaoyang', '125.2883', '43.83339');
INSERT INTO `tb_region` VALUES ('220105', '二道区', '220100', '二道', '4', '0431', '130031', '中国,吉林省,长春市,二道区', 'Erdao', '125.37429', '43.86501');
INSERT INTO `tb_region` VALUES ('220106', '绿园区', '220100', '绿园', '4', '0431', '130062', '中国,吉林省,长春市,绿园区', 'Lvyuan', '125.25582', '43.88045');
INSERT INTO `tb_region` VALUES ('220112', '双阳区', '220100', '双阳', '4', '0431', '130600', '中国,吉林省,长春市,双阳区', 'Shuangyang', '125.65631', '43.52803');
INSERT INTO `tb_region` VALUES ('220113', '九台区', '220100', '九台', '4', '0431', '130500', '中国,吉林省,长春市,九台区', 'Jiutai', '125.8395', '44.15163');
INSERT INTO `tb_region` VALUES ('220122', '农安县', '220100', '农安', '4', '0431', '130200', '中国,吉林省,长春市,农安县', 'Nong\'an', '125.18481', '44.43265');
INSERT INTO `tb_region` VALUES ('220182', '榆树市', '220100', '榆树', '4', '0431', '130400', '中国,吉林省,长春市,榆树市', 'Yushu', '126.55688', '44.82523');
INSERT INTO `tb_region` VALUES ('220183', '德惠市', '220100', '德惠', '4', '0431', '130300', '中国,吉林省,长春市,德惠市', 'Dehui', '125.70538', '44.53719');
INSERT INTO `tb_region` VALUES ('220200', '吉林市', '220000', '吉林', '3', '0432', '132011', '中国,吉林省,吉林市', 'Jilin', '126.55302', '43.843577');
INSERT INTO `tb_region` VALUES ('220202', '昌邑区', '220200', '昌邑', '4', '0432', '132002', '中国,吉林省,吉林市,昌邑区', 'Changyi', '126.57424', '43.88183');
INSERT INTO `tb_region` VALUES ('220203', '龙潭区', '220200', '龙潭', '4', '0432', '132021', '中国,吉林省,吉林市,龙潭区', 'Longtan', '126.56213', '43.91054');
INSERT INTO `tb_region` VALUES ('220204', '船营区', '220200', '船营', '4', '0432', '132011', '中国,吉林省,吉林市,船营区', 'Chuanying', '126.54096', '43.83344');
INSERT INTO `tb_region` VALUES ('220211', '丰满区', '220200', '丰满', '4', '0432', '132013', '中国,吉林省,吉林市,丰满区', 'Fengman', '126.56237', '43.82236');
INSERT INTO `tb_region` VALUES ('220221', '永吉县', '220200', '永吉', '4', '0432', '132200', '中国,吉林省,吉林市,永吉县', 'Yongji', '126.4963', '43.67197');
INSERT INTO `tb_region` VALUES ('220281', '蛟河市', '220200', '蛟河', '4', '0432', '132500', '中国,吉林省,吉林市,蛟河市', 'Jiaohe', '127.34426', '43.72696');
INSERT INTO `tb_region` VALUES ('220282', '桦甸市', '220200', '桦甸', '4', '0432', '132400', '中国,吉林省,吉林市,桦甸市', 'Huadian', '126.74624', '42.97206');
INSERT INTO `tb_region` VALUES ('220283', '舒兰市', '220200', '舒兰', '4', '0432', '132600', '中国,吉林省,吉林市,舒兰市', 'Shulan', '126.9653', '44.40582');
INSERT INTO `tb_region` VALUES ('220284', '磐石市', '220200', '磐石', '4', '0432', '132300', '中国,吉林省,吉林市,磐石市', 'Panshi', '126.0625', '42.94628');
INSERT INTO `tb_region` VALUES ('220300', '四平市', '220000', '四平', '3', '0434', '136000', '中国,吉林省,四平市', 'Siping', '124.370785', '43.170344');
INSERT INTO `tb_region` VALUES ('220302', '铁西区', '220300', '铁西', '4', '0434', '136000', '中国,吉林省,四平市,铁西区', 'Tiexi', '124.37369', '43.17456');
INSERT INTO `tb_region` VALUES ('220303', '铁东区', '220300', '铁东', '4', '0434', '136001', '中国,吉林省,四平市,铁东区', 'Tiedong', '124.40976', '43.16241');
INSERT INTO `tb_region` VALUES ('220322', '梨树县', '220300', '梨树', '4', '0434', '136500', '中国,吉林省,四平市,梨树县', 'Lishu', '124.33563', '43.30717');
INSERT INTO `tb_region` VALUES ('220323', '伊通满族自治县', '220300', '伊通', '4', '0434', '130700', '中国,吉林省,四平市,伊通满族自治县', 'Yitong', '125.30596', '43.34434');
INSERT INTO `tb_region` VALUES ('220381', '公主岭市', '220300', '公主岭', '4', '0434', '136100', '中国,吉林省,四平市,公主岭市', 'Gongzhuling', '124.82266', '43.50453');
INSERT INTO `tb_region` VALUES ('220382', '双辽市', '220300', '双辽', '4', '0434', '136400', '中国,吉林省,四平市,双辽市', 'Shuangliao', '123.50106', '43.52099');
INSERT INTO `tb_region` VALUES ('220400', '辽源市', '220000', '辽源', '3', '0437', '136200', '中国,吉林省,辽源市', 'Liaoyuan', '125.145349', '42.902692');
INSERT INTO `tb_region` VALUES ('220402', '龙山区', '220400', '龙山', '4', '0437', '136200', '中国,吉林省,辽源市,龙山区', 'Longshan', '125.13641', '42.89714');
INSERT INTO `tb_region` VALUES ('220403', '西安区', '220400', '西安', '4', '0437', '136201', '中国,吉林省,辽源市,西安区', 'Xi\'an', '125.14904', '42.927');
INSERT INTO `tb_region` VALUES ('220421', '东丰县', '220400', '东丰', '4', '0437', '136300', '中国,吉林省,辽源市,东丰县', 'Dongfeng', '125.53244', '42.6783');
INSERT INTO `tb_region` VALUES ('220422', '东辽县', '220400', '东辽', '4', '0437', '136600', '中国,吉林省,辽源市,东辽县', 'Dongliao', '124.98596', '42.92492');
INSERT INTO `tb_region` VALUES ('220500', '通化市', '220000', '通化', '3', '0435', '134001', '中国,吉林省,通化市', 'Tonghua', '125.936501', '41.721177');
INSERT INTO `tb_region` VALUES ('220502', '东昌区', '220500', '东昌', '4', '0435', '134001', '中国,吉林省,通化市,东昌区', 'Dongchang', '125.9551', '41.72849');
INSERT INTO `tb_region` VALUES ('220503', '二道江区', '220500', '二道江', '4', '0435', '134003', '中国,吉林省,通化市,二道江区', 'Erdaojiang', '126.04257', '41.7741');
INSERT INTO `tb_region` VALUES ('220521', '通化县', '220500', '通化', '4', '0435', '134100', '中国,吉林省,通化市,通化县', 'Tonghua', '125.75936', '41.67928');
INSERT INTO `tb_region` VALUES ('220523', '辉南县', '220500', '辉南', '4', '0435', '135100', '中国,吉林省,通化市,辉南县', 'Huinan', '126.04684', '42.68497');
INSERT INTO `tb_region` VALUES ('220524', '柳河县', '220500', '柳河', '4', '0435', '135300', '中国,吉林省,通化市,柳河县', 'Liuhe', '125.74475', '42.28468');
INSERT INTO `tb_region` VALUES ('220581', '梅河口市', '220500', '梅河口', '4', '0435', '135000', '中国,吉林省,通化市,梅河口市', 'Meihekou', '125.71041', '42.53828');
INSERT INTO `tb_region` VALUES ('220582', '集安市', '220500', '集安', '4', '0435', '134200', '中国,吉林省,通化市,集安市', 'Ji\'an', '126.18829', '41.12268');
INSERT INTO `tb_region` VALUES ('220600', '白山市', '220000', '白山', '3', '0439', '134300', '中国,吉林省,白山市', 'Baishan', '126.427839', '41.942505');
INSERT INTO `tb_region` VALUES ('220602', '浑江区', '220600', '浑江', '4', '0439', '134300', '中国,吉林省,白山市,浑江区', 'Hunjiang', '126.422342', '41.945656');
INSERT INTO `tb_region` VALUES ('220605', '江源区', '220600', '江源', '4', '0439', '134700', '中国,吉林省,白山市,江源区', 'Jiangyuan', '126.59079', '42.05664');
INSERT INTO `tb_region` VALUES ('220621', '抚松县', '220600', '抚松', '4', '0439', '134500', '中国,吉林省,白山市,抚松县', 'Fusong', '127.2803', '42.34198');
INSERT INTO `tb_region` VALUES ('220622', '靖宇县', '220600', '靖宇', '4', '0439', '135200', '中国,吉林省,白山市,靖宇县', 'Jingyu', '126.81308', '42.38863');
INSERT INTO `tb_region` VALUES ('220623', '长白朝鲜族自治县', '220600', '长白', '4', '0439', '134400', '中国,吉林省,白山市,长白朝鲜族自治县', 'Changbai', '128.20047', '41.41996');
INSERT INTO `tb_region` VALUES ('220681', '临江市', '220600', '临江', '4', '0439', '134600', '中国,吉林省,白山市,临江市', 'Linjiang', '126.91751', '41.81142');
INSERT INTO `tb_region` VALUES ('220700', '松原市', '220000', '松原', '3', '0438', '138000', '中国,吉林省,松原市', 'Songyuan', '124.823608', '45.118243');
INSERT INTO `tb_region` VALUES ('220702', '宁江区', '220700', '宁江', '4', '0438', '138000', '中国,吉林省,松原市,宁江区', 'Ningjiang', '124.81689', '45.17175');
INSERT INTO `tb_region` VALUES ('220721', '前郭尔罗斯蒙古族自治县', '220700', '前郭尔罗斯', '4', '0438', '138000', '中国,吉林省,松原市,前郭尔罗斯蒙古族自治县', 'Qianguoerluosi', '124.82351', '45.11726');
INSERT INTO `tb_region` VALUES ('220722', '长岭县', '220700', '长岭', '4', '0438', '131500', '中国,吉林省,松原市,长岭县', 'Changling', '123.96725', '44.27581');
INSERT INTO `tb_region` VALUES ('220723', '乾安县', '220700', '乾安', '4', '0438', '131400', '中国,吉林省,松原市,乾安县', 'Qian\'an', '124.02737', '45.01068');
INSERT INTO `tb_region` VALUES ('220781', '扶余市', '220700', '扶余', '4', '0438', '131200', '中国,吉林省,松原市,扶余市', 'Fuyu', '126.042758', '44.986199');
INSERT INTO `tb_region` VALUES ('220800', '白城市', '220000', '白城', '3', '0436', '137000', '中国,吉林省,白城市', 'Baicheng', '122.841114', '45.619026');
INSERT INTO `tb_region` VALUES ('220802', '洮北区', '220800', '洮北', '4', '0436', '137000', '中国,吉林省,白城市,洮北区', 'Taobei', '122.85104', '45.62167');
INSERT INTO `tb_region` VALUES ('220821', '镇赉县', '220800', '镇赉', '4', '0436', '137300', '中国,吉林省,白城市,镇赉县', 'Zhenlai', '123.19924', '45.84779');
INSERT INTO `tb_region` VALUES ('220822', '通榆县', '220800', '通榆', '4', '0436', '137200', '中国,吉林省,白城市,通榆县', 'Tongyu', '123.08761', '44.81388');
INSERT INTO `tb_region` VALUES ('220881', '洮南市', '220800', '洮南', '4', '0436', '137100', '中国,吉林省,白城市,洮南市', 'Taonan', '122.78772', '45.33502');
INSERT INTO `tb_region` VALUES ('220882', '大安市', '220800', '大安', '4', '0436', '131300', '中国,吉林省,白城市,大安市', 'Da\'an', '124.29519', '45.50846');
INSERT INTO `tb_region` VALUES ('222400', '延边朝鲜族自治州', '220000', '延边', '3', '0433', '133000', '中国,吉林省,延边朝鲜族自治州', 'Yanbian', '129.513228', '42.904823');
INSERT INTO `tb_region` VALUES ('222401', '延吉市', '222400', '延吉', '4', '0433', '133000', '中国,吉林省,延边朝鲜族自治州,延吉市', 'Yanji', '129.51357', '42.90682');
INSERT INTO `tb_region` VALUES ('222402', '图们市', '222400', '图们', '4', '0433', '133100', '中国,吉林省,延边朝鲜族自治州,图们市', 'Tumen', '129.84381', '42.96801');
INSERT INTO `tb_region` VALUES ('222403', '敦化市', '222400', '敦化', '4', '0433', '133700', '中国,吉林省,延边朝鲜族自治州,敦化市', 'Dunhua', '128.23242', '43.37304');
INSERT INTO `tb_region` VALUES ('222404', '珲春市', '222400', '珲春', '4', '0433', '133300', '中国,吉林省,延边朝鲜族自治州,珲春市', 'Hunchun', '130.36572', '42.86242');
INSERT INTO `tb_region` VALUES ('222405', '龙井市', '222400', '龙井', '4', '0433', '133400', '中国,吉林省,延边朝鲜族自治州,龙井市', 'Longjing', '129.42584', '42.76804');
INSERT INTO `tb_region` VALUES ('222406', '和龙市', '222400', '和龙', '4', '0433', '133500', '中国,吉林省,延边朝鲜族自治州,和龙市', 'Helong', '129.01077', '42.5464');
INSERT INTO `tb_region` VALUES ('222424', '汪清县', '222400', '汪清', '4', '0433', '133200', '中国,吉林省,延边朝鲜族自治州,汪清县', 'Wangqing', '129.77121', '43.31278');
INSERT INTO `tb_region` VALUES ('222426', '安图县', '222400', '安图', '4', '0433', '133600', '中国,吉林省,延边朝鲜族自治州,安图县', 'Antu', '128.90625', '43.11533');
INSERT INTO `tb_region` VALUES ('230000', '黑龙江省', '100007', '黑龙江', '2', '', '', '中国,黑龙江省', 'Heilongjiang', '126.642464', '45.756967');
INSERT INTO `tb_region` VALUES ('230100', '哈尔滨市', '230000', '哈尔滨', '3', '0451', '150010', '中国,黑龙江省,哈尔滨市', 'Harbin', '126.642464', '45.756967');
INSERT INTO `tb_region` VALUES ('230102', '道里区', '230100', '道里', '4', '0451', '150010', '中国,黑龙江省,哈尔滨市,道里区', 'Daoli', '126.61705', '45.75586');
INSERT INTO `tb_region` VALUES ('230103', '南岗区', '230100', '南岗', '4', '0451', '150006', '中国,黑龙江省,哈尔滨市,南岗区', 'Nangang', '126.66854', '45.75996');
INSERT INTO `tb_region` VALUES ('230104', '道外区', '230100', '道外', '4', '0451', '150020', '中国,黑龙江省,哈尔滨市,道外区', 'Daowai', '126.64938', '45.79187');
INSERT INTO `tb_region` VALUES ('230108', '平房区', '230100', '平房', '4', '0451', '150060', '中国,黑龙江省,哈尔滨市,平房区', 'Pingfang', '126.63729', '45.59777');
INSERT INTO `tb_region` VALUES ('230109', '松北区', '230100', '松北', '4', '0451', '150028', '中国,黑龙江省,哈尔滨市,松北区', 'Songbei', '126.56276', '45.80831');
INSERT INTO `tb_region` VALUES ('230110', '香坊区', '230100', '香坊', '4', '0451', '150036', '中国,黑龙江省,哈尔滨市,香坊区', 'Xiangfang', '126.67968', '45.72383');
INSERT INTO `tb_region` VALUES ('230111', '呼兰区', '230100', '呼兰', '4', '0451', '150500', '中国,黑龙江省,哈尔滨市,呼兰区', 'Hulan', '126.58792', '45.88895');
INSERT INTO `tb_region` VALUES ('230112', '阿城区', '230100', '阿城', '4', '0451', '150300', '中国,黑龙江省,哈尔滨市,阿城区', 'A\'cheng', '126.97525', '45.54144');
INSERT INTO `tb_region` VALUES ('230113', '双城区', '230100', '双城', '4', '0451', '150100', '中国,黑龙江省,哈尔滨市,双城区', 'Shuangcheng', '126.308784', '45.377942');
INSERT INTO `tb_region` VALUES ('230123', '依兰县', '230100', '依兰', '4', '0451', '154800', '中国,黑龙江省,哈尔滨市,依兰县', 'Yilan', '129.56817', '46.3247');
INSERT INTO `tb_region` VALUES ('230124', '方正县', '230100', '方正', '4', '0451', '150800', '中国,黑龙江省,哈尔滨市,方正县', 'Fangzheng', '128.82952', '45.85162');
INSERT INTO `tb_region` VALUES ('230125', '宾县', '230100', '宾县', '4', '0451', '150400', '中国,黑龙江省,哈尔滨市,宾县', 'Binxian', '127.48675', '45.75504');
INSERT INTO `tb_region` VALUES ('230126', '巴彦县', '230100', '巴彦', '4', '0451', '151800', '中国,黑龙江省,哈尔滨市,巴彦县', 'Bayan', '127.40799', '46.08148');
INSERT INTO `tb_region` VALUES ('230127', '木兰县', '230100', '木兰', '4', '0451', '151900', '中国,黑龙江省,哈尔滨市,木兰县', 'Mulan', '128.0448', '45.94944');
INSERT INTO `tb_region` VALUES ('230128', '通河县', '230100', '通河', '4', '0451', '150900', '中国,黑龙江省,哈尔滨市,通河县', 'Tonghe', '128.74603', '45.99007');
INSERT INTO `tb_region` VALUES ('230129', '延寿县', '230100', '延寿', '4', '0451', '150700', '中国,黑龙江省,哈尔滨市,延寿县', 'Yanshou', '128.33419', '45.4554');
INSERT INTO `tb_region` VALUES ('230183', '尚志市', '230100', '尚志', '4', '0451', '150600', '中国,黑龙江省,哈尔滨市,尚志市', 'Shangzhi', '127.96191', '45.21736');
INSERT INTO `tb_region` VALUES ('230184', '五常市', '230100', '五常', '4', '0451', '150200', '中国,黑龙江省,哈尔滨市,五常市', 'Wuchang', '127.16751', '44.93184');
INSERT INTO `tb_region` VALUES ('230200', '齐齐哈尔市', '230000', '齐齐哈尔', '3', '0452', '161005', '中国,黑龙江省,齐齐哈尔市', 'Qiqihar', '123.953486', '47.348079');
INSERT INTO `tb_region` VALUES ('230202', '龙沙区', '230200', '龙沙', '4', '0452', '161000', '中国,黑龙江省,齐齐哈尔市,龙沙区', 'Longsha', '123.95752', '47.31776');
INSERT INTO `tb_region` VALUES ('230203', '建华区', '230200', '建华', '4', '0452', '161006', '中国,黑龙江省,齐齐哈尔市,建华区', 'Jianhua', '124.0133', '47.36718');
INSERT INTO `tb_region` VALUES ('230204', '铁锋区', '230200', '铁锋', '4', '0452', '161000', '中国,黑龙江省,齐齐哈尔市,铁锋区', 'Tiefeng', '123.97821', '47.34075');
INSERT INTO `tb_region` VALUES ('230205', '昂昂溪区', '230200', '昂昂溪', '4', '0452', '161031', '中国,黑龙江省,齐齐哈尔市,昂昂溪区', 'Angangxi', '123.82229', '47.15513');
INSERT INTO `tb_region` VALUES ('230206', '富拉尔基区', '230200', '富拉尔基', '4', '0452', '161041', '中国,黑龙江省,齐齐哈尔市,富拉尔基区', 'Fulaerji', '123.62918', '47.20884');
INSERT INTO `tb_region` VALUES ('230207', '碾子山区', '230200', '碾子山', '4', '0452', '161046', '中国,黑龙江省,齐齐哈尔市,碾子山区', 'Nianzishan', '122.88183', '47.51662');
INSERT INTO `tb_region` VALUES ('230208', '梅里斯达斡尔族区', '230200', '梅里斯', '4', '0452', '161021', '中国,黑龙江省,齐齐哈尔市,梅里斯达斡尔族区', 'Meilisi', '123.75274', '47.30946');
INSERT INTO `tb_region` VALUES ('230221', '龙江县', '230200', '龙江', '4', '0452', '161100', '中国,黑龙江省,齐齐哈尔市,龙江县', 'Longjiang', '123.20532', '47.33868');
INSERT INTO `tb_region` VALUES ('230223', '依安县', '230200', '依安', '4', '0452', '161500', '中国,黑龙江省,齐齐哈尔市,依安县', 'Yi\'an', '125.30896', '47.8931');
INSERT INTO `tb_region` VALUES ('230224', '泰来县', '230200', '泰来', '4', '0452', '162400', '中国,黑龙江省,齐齐哈尔市,泰来县', 'Tailai', '123.42285', '46.39386');
INSERT INTO `tb_region` VALUES ('230225', '甘南县', '230200', '甘南', '4', '0452', '162100', '中国,黑龙江省,齐齐哈尔市,甘南县', 'Gannan', '123.50317', '47.92437');
INSERT INTO `tb_region` VALUES ('230227', '富裕县', '230200', '富裕', '4', '0452', '161200', '中国,黑龙江省,齐齐哈尔市,富裕县', 'Fuyu', '124.47457', '47.77431');
INSERT INTO `tb_region` VALUES ('230229', '克山县', '230200', '克山', '4', '0452', '161600', '中国,黑龙江省,齐齐哈尔市,克山县', 'Keshan', '125.87396', '48.03265');
INSERT INTO `tb_region` VALUES ('230230', '克东县', '230200', '克东', '4', '0452', '164800', '中国,黑龙江省,齐齐哈尔市,克东县', 'Kedong', '126.24917', '48.03828');
INSERT INTO `tb_region` VALUES ('230231', '拜泉县', '230200', '拜泉', '4', '0452', '164700', '中国,黑龙江省,齐齐哈尔市,拜泉县', 'Baiquan', '126.09167', '47.60817');
INSERT INTO `tb_region` VALUES ('230281', '讷河市', '230200', '讷河', '4', '0452', '161300', '中国,黑龙江省,齐齐哈尔市,讷河市', 'Nehe', '124.87713', '48.48388');
INSERT INTO `tb_region` VALUES ('230300', '鸡西市', '230000', '鸡西', '3', '0467', '158100', '中国,黑龙江省,鸡西市', 'Jixi', '130.975966', '45.300046');
INSERT INTO `tb_region` VALUES ('230302', '鸡冠区', '230300', '鸡冠', '4', '0467', '158100', '中国,黑龙江省,鸡西市,鸡冠区', 'Jiguan', '130.98139', '45.30396');
INSERT INTO `tb_region` VALUES ('230303', '恒山区', '230300', '恒山', '4', '0467', '158130', '中国,黑龙江省,鸡西市,恒山区', 'Hengshan', '130.90493', '45.21071');
INSERT INTO `tb_region` VALUES ('230304', '滴道区', '230300', '滴道', '4', '0467', '158150', '中国,黑龙江省,鸡西市,滴道区', 'Didao', '130.84841', '45.35109');
INSERT INTO `tb_region` VALUES ('230305', '梨树区', '230300', '梨树', '4', '0467', '158160', '中国,黑龙江省,鸡西市,梨树区', 'Lishu', '130.69848', '45.09037');
INSERT INTO `tb_region` VALUES ('230306', '城子河区', '230300', '城子河', '4', '0467', '158170', '中国,黑龙江省,鸡西市,城子河区', 'Chengzihe', '131.01132', '45.33689');
INSERT INTO `tb_region` VALUES ('230307', '麻山区', '230300', '麻山', '4', '0467', '158180', '中国,黑龙江省,鸡西市,麻山区', 'Mashan', '130.47811', '45.21209');
INSERT INTO `tb_region` VALUES ('230321', '鸡东县', '230300', '鸡东', '4', '0467', '158200', '中国,黑龙江省,鸡西市,鸡东县', 'Jidong', '131.12423', '45.26025');
INSERT INTO `tb_region` VALUES ('230381', '虎林市', '230300', '虎林', '4', '0467', '158400', '中国,黑龙江省,鸡西市,虎林市', 'Hulin', '132.93679', '45.76291');
INSERT INTO `tb_region` VALUES ('230382', '密山市', '230300', '密山', '4', '0467', '158300', '中国,黑龙江省,鸡西市,密山市', 'Mishan', '131.84625', '45.5297');
INSERT INTO `tb_region` VALUES ('230400', '鹤岗市', '230000', '鹤岗', '3', '0468', '154100', '中国,黑龙江省,鹤岗市', 'Hegang', '130.277487', '47.332085');
INSERT INTO `tb_region` VALUES ('230402', '向阳区', '230400', '向阳', '4', '0468', '154100', '中国,黑龙江省,鹤岗市,向阳区', 'Xiangyang', '130.2943', '47.34247');
INSERT INTO `tb_region` VALUES ('230403', '工农区', '230400', '工农', '4', '0468', '154101', '中国,黑龙江省,鹤岗市,工农区', 'Gongnong', '130.27468', '47.31869');
INSERT INTO `tb_region` VALUES ('230404', '南山区', '230400', '南山', '4', '0468', '154104', '中国,黑龙江省,鹤岗市,南山区', 'Nanshan', '130.27676', '47.31404');
INSERT INTO `tb_region` VALUES ('230405', '兴安区', '230400', '兴安', '4', '0468', '154102', '中国,黑龙江省,鹤岗市,兴安区', 'Xing\'an', '130.23965', '47.2526');
INSERT INTO `tb_region` VALUES ('230406', '东山区', '230400', '东山', '4', '0468', '154106', '中国,黑龙江省,鹤岗市,东山区', 'Dongshan', '130.31706', '47.33853');
INSERT INTO `tb_region` VALUES ('230407', '兴山区', '230400', '兴山', '4', '0468', '154105', '中国,黑龙江省,鹤岗市,兴山区', 'Xingshan', '130.29271', '47.35776');
INSERT INTO `tb_region` VALUES ('230421', '萝北县', '230400', '萝北', '4', '0468', '154200', '中国,黑龙江省,鹤岗市,萝北县', 'Luobei', '130.83346', '47.57959');
INSERT INTO `tb_region` VALUES ('230422', '绥滨县', '230400', '绥滨', '4', '0468', '156200', '中国,黑龙江省,鹤岗市,绥滨县', 'Suibin', '131.86029', '47.2903');
INSERT INTO `tb_region` VALUES ('230500', '双鸭山市', '230000', '双鸭山', '3', '0469', '155100', '中国,黑龙江省,双鸭山市', 'Shuangyashan', '131.157304', '46.643442');
INSERT INTO `tb_region` VALUES ('230502', '尖山区', '230500', '尖山', '4', '0469', '155100', '中国,黑龙江省,双鸭山市,尖山区', 'Jianshan', '131.15841', '46.64635');
INSERT INTO `tb_region` VALUES ('230503', '岭东区', '230500', '岭东', '4', '0469', '155120', '中国,黑龙江省,双鸭山市,岭东区', 'Lingdong', '131.16473', '46.59043');
INSERT INTO `tb_region` VALUES ('230505', '四方台区', '230500', '四方台', '4', '0469', '155130', '中国,黑龙江省,双鸭山市,四方台区', 'Sifangtai', '131.33593', '46.59499');
INSERT INTO `tb_region` VALUES ('230506', '宝山区', '230500', '宝山', '4', '0469', '155131', '中国,黑龙江省,双鸭山市,宝山区', 'Baoshan', '131.4016', '46.57718');
INSERT INTO `tb_region` VALUES ('230521', '集贤县', '230500', '集贤', '4', '0469', '155900', '中国,黑龙江省,双鸭山市,集贤县', 'Jixian', '131.14053', '46.72678');
INSERT INTO `tb_region` VALUES ('230522', '友谊县', '230500', '友谊', '4', '0469', '155800', '中国,黑龙江省,双鸭山市,友谊县', 'Youyi', '131.80789', '46.76739');
INSERT INTO `tb_region` VALUES ('230523', '宝清县', '230500', '宝清', '4', '0469', '155600', '中国,黑龙江省,双鸭山市,宝清县', 'Baoqing', '132.19695', '46.32716');
INSERT INTO `tb_region` VALUES ('230524', '饶河县', '230500', '饶河', '4', '0469', '155700', '中国,黑龙江省,双鸭山市,饶河县', 'Raohe', '134.01986', '46.79899');
INSERT INTO `tb_region` VALUES ('230600', '大庆市', '230000', '大庆', '3', '0459', '163000', '中国,黑龙江省,大庆市', 'Daqing', '125.11272', '46.590734');
INSERT INTO `tb_region` VALUES ('230602', '萨尔图区', '230600', '萨尔图', '4', '0459', '163001', '中国,黑龙江省,大庆市,萨尔图区', 'Saertu', '125.08792', '46.59359');
INSERT INTO `tb_region` VALUES ('230603', '龙凤区', '230600', '龙凤', '4', '0459', '163711', '中国,黑龙江省,大庆市,龙凤区', 'Longfeng', '125.11657', '46.53273');
INSERT INTO `tb_region` VALUES ('230604', '让胡路区', '230600', '让胡路', '4', '0459', '163712', '中国,黑龙江省,大庆市,让胡路区', 'Ranghulu', '124.87075', '46.6522');
INSERT INTO `tb_region` VALUES ('230605', '红岗区', '230600', '红岗', '4', '0459', '163511', '中国,黑龙江省,大庆市,红岗区', 'Honggang', '124.89248', '46.40128');
INSERT INTO `tb_region` VALUES ('230606', '大同区', '230600', '大同', '4', '0459', '163515', '中国,黑龙江省,大庆市,大同区', 'Datong', '124.81591', '46.03295');
INSERT INTO `tb_region` VALUES ('230621', '肇州县', '230600', '肇州', '4', '0459', '166400', '中国,黑龙江省,大庆市,肇州县', 'Zhaozhou', '125.27059', '45.70414');
INSERT INTO `tb_region` VALUES ('230622', '肇源县', '230600', '肇源', '4', '0459', '166500', '中国,黑龙江省,大庆市,肇源县', 'Zhaoyuan', '125.08456', '45.52032');
INSERT INTO `tb_region` VALUES ('230623', '林甸县', '230600', '林甸', '4', '0459', '166300', '中国,黑龙江省,大庆市,林甸县', 'Lindian', '124.87564', '47.18601');
INSERT INTO `tb_region` VALUES ('230624', '杜尔伯特蒙古族自治县', '230600', '杜尔伯特', '4', '0459', '166200', '中国,黑龙江省,大庆市,杜尔伯特蒙古族自治县', 'Duerbote', '124.44937', '46.86507');
INSERT INTO `tb_region` VALUES ('230700', '伊春市', '230000', '伊春', '3', '0458', '153000', '中国,黑龙江省,伊春市', 'Yichun', '128.899396', '47.724775');
INSERT INTO `tb_region` VALUES ('230702', '伊春区', '230700', '伊春', '4', '0458', '153000', '中国,黑龙江省,伊春市,伊春区', 'Yichun', '128.90752', '47.728');
INSERT INTO `tb_region` VALUES ('230703', '南岔区', '230700', '南岔', '4', '0458', '153100', '中国,黑龙江省,伊春市,南岔区', 'Nancha', '129.28362', '47.13897');
INSERT INTO `tb_region` VALUES ('230704', '友好区', '230700', '友好', '4', '0458', '153031', '中国,黑龙江省,伊春市,友好区', 'Youhao', '128.84039', '47.85371');
INSERT INTO `tb_region` VALUES ('230705', '西林区', '230700', '西林', '4', '0458', '153025', '中国,黑龙江省,伊春市,西林区', 'Xilin', '129.31201', '47.48103');
INSERT INTO `tb_region` VALUES ('230706', '翠峦区', '230700', '翠峦', '4', '0458', '153013', '中国,黑龙江省,伊春市,翠峦区', 'Cuiluan', '128.66729', '47.72503');
INSERT INTO `tb_region` VALUES ('230707', '新青区', '230700', '新青', '4', '0458', '153036', '中国,黑龙江省,伊春市,新青区', 'Xinqing', '129.53653', '48.29067');
INSERT INTO `tb_region` VALUES ('230708', '美溪区', '230700', '美溪', '4', '0458', '153021', '中国,黑龙江省,伊春市,美溪区', 'Meixi', '129.13708', '47.63513');
INSERT INTO `tb_region` VALUES ('230709', '金山屯区', '230700', '金山屯', '4', '0458', '153026', '中国,黑龙江省,伊春市,金山屯区', 'Jinshantun', '129.43768', '47.41349');
INSERT INTO `tb_region` VALUES ('230710', '五营区', '230700', '五营', '4', '0458', '153033', '中国,黑龙江省,伊春市,五营区', 'Wuying', '129.24545', '48.10791');
INSERT INTO `tb_region` VALUES ('230711', '乌马河区', '230700', '乌马河', '4', '0458', '153011', '中国,黑龙江省,伊春市,乌马河区', 'Wumahe', '128.79672', '47.728');
INSERT INTO `tb_region` VALUES ('230712', '汤旺河区', '230700', '汤旺河', '4', '0458', '153037', '中国,黑龙江省,伊春市,汤旺河区', 'Tangwanghe', '129.57226', '48.45182');
INSERT INTO `tb_region` VALUES ('230713', '带岭区', '230700', '带岭', '4', '0458', '153106', '中国,黑龙江省,伊春市,带岭区', 'Dailing', '129.02352', '47.02553');
INSERT INTO `tb_region` VALUES ('230714', '乌伊岭区', '230700', '乌伊岭', '4', '0458', '153038', '中国,黑龙江省,伊春市,乌伊岭区', 'Wuyiling', '129.43981', '48.59602');
INSERT INTO `tb_region` VALUES ('230715', '红星区', '230700', '红星', '4', '0458', '153035', '中国,黑龙江省,伊春市,红星区', 'Hongxing', '129.3887', '48.23944');
INSERT INTO `tb_region` VALUES ('230716', '上甘岭区', '230700', '上甘岭', '4', '0458', '153032', '中国,黑龙江省,伊春市,上甘岭区', 'Shangganling', '129.02447', '47.97522');
INSERT INTO `tb_region` VALUES ('230722', '嘉荫县', '230700', '嘉荫', '4', '0458', '153200', '中国,黑龙江省,伊春市,嘉荫县', 'Jiayin', '130.39825', '48.8917');
INSERT INTO `tb_region` VALUES ('230781', '铁力市', '230700', '铁力', '4', '0458', '152500', '中国,黑龙江省,伊春市,铁力市', 'Tieli', '128.0317', '46.98571');
INSERT INTO `tb_region` VALUES ('230800', '佳木斯市', '230000', '佳木斯', '3', '0454', '154002', '中国,黑龙江省,佳木斯市', 'Jiamusi', '130.361634', '46.809606');
INSERT INTO `tb_region` VALUES ('230803', '向阳区', '230800', '向阳', '4', '0454', '154002', '中国,黑龙江省,佳木斯市,向阳区', 'Xiangyang', '130.36519', '46.80778');
INSERT INTO `tb_region` VALUES ('230804', '前进区', '230800', '前进', '4', '0454', '154002', '中国,黑龙江省,佳木斯市,前进区', 'Qianjin', '130.37497', '46.81401');
INSERT INTO `tb_region` VALUES ('230805', '东风区', '230800', '东风', '4', '0454', '154005', '中国,黑龙江省,佳木斯市,东风区', 'Dongfeng', '130.40366', '46.82257');
INSERT INTO `tb_region` VALUES ('230811', '郊区', '230800', '郊区', '4', '0454', '154004', '中国,黑龙江省,佳木斯市,郊区', 'Jiaoqu', '130.32731', '46.80958');
INSERT INTO `tb_region` VALUES ('230822', '桦南县', '230800', '桦南', '4', '0454', '154400', '中国,黑龙江省,佳木斯市,桦南县', 'Huanan', '130.55361', '46.23921');
INSERT INTO `tb_region` VALUES ('230826', '桦川县', '230800', '桦川', '4', '0454', '154300', '中国,黑龙江省,佳木斯市,桦川县', 'Huachuan', '130.71893', '47.02297');
INSERT INTO `tb_region` VALUES ('230828', '汤原县', '230800', '汤原', '4', '0454', '154700', '中国,黑龙江省,佳木斯市,汤原县', 'Tangyuan', '129.90966', '46.72755');
INSERT INTO `tb_region` VALUES ('230833', '抚远县', '230800', '抚远', '4', '0454', '156500', '中国,黑龙江省,佳木斯市,抚远县', 'Fuyuan', '134.29595', '48.36794');
INSERT INTO `tb_region` VALUES ('230881', '同江市', '230800', '同江', '4', '0454', '156400', '中国,黑龙江省,佳木斯市,同江市', 'Tongjiang', '132.51095', '47.64211');
INSERT INTO `tb_region` VALUES ('230882', '富锦市', '230800', '富锦', '4', '0454', '156100', '中国,黑龙江省,佳木斯市,富锦市', 'Fujin', '132.03707', '47.25132');
INSERT INTO `tb_region` VALUES ('230900', '七台河市', '230000', '七台河', '3', '0464', '154600', '中国,黑龙江省,七台河市', 'Qitaihe', '131.015584', '45.771266');
INSERT INTO `tb_region` VALUES ('230902', '新兴区', '230900', '新兴', '4', '0464', '154604', '中国,黑龙江省,七台河市,新兴区', 'Xinxing', '130.93212', '45.81624');
INSERT INTO `tb_region` VALUES ('230903', '桃山区', '230900', '桃山', '4', '0464', '154600', '中国,黑龙江省,七台河市,桃山区', 'Taoshan', '131.01786', '45.76782');
INSERT INTO `tb_region` VALUES ('230904', '茄子河区', '230900', '茄子河', '4', '0464', '154622', '中国,黑龙江省,七台河市,茄子河区', 'Qiezihe', '131.06807', '45.78519');
INSERT INTO `tb_region` VALUES ('230921', '勃利县', '230900', '勃利', '4', '0464', '154500', '中国,黑龙江省,七台河市,勃利县', 'Boli', '130.59179', '45.755');
INSERT INTO `tb_region` VALUES ('231000', '牡丹江市', '230000', '牡丹江', '3', '0453', '157000', '中国,黑龙江省,牡丹江市', 'Mudanjiang', '129.618602', '44.582962');
INSERT INTO `tb_region` VALUES ('231002', '东安区', '231000', '东安', '4', '0453', '157000', '中国,黑龙江省,牡丹江市,东安区', 'Dong\'an', '129.62665', '44.58133');
INSERT INTO `tb_region` VALUES ('231003', '阳明区', '231000', '阳明', '4', '0453', '157013', '中国,黑龙江省,牡丹江市,阳明区', 'Yangming', '129.63547', '44.59603');
INSERT INTO `tb_region` VALUES ('231004', '爱民区', '231000', '爱民', '4', '0453', '157009', '中国,黑龙江省,牡丹江市,爱民区', 'Aimin', '129.59077', '44.59648');
INSERT INTO `tb_region` VALUES ('231005', '西安区', '231000', '西安', '4', '0453', '157000', '中国,黑龙江省,牡丹江市,西安区', 'Xi\'an', '129.61616', '44.57766');
INSERT INTO `tb_region` VALUES ('231024', '东宁县', '231000', '东宁', '4', '0453', '157200', '中国,黑龙江省,牡丹江市,东宁县', 'Dongning', '131.12793', '44.0661');
INSERT INTO `tb_region` VALUES ('231025', '林口县', '231000', '林口', '4', '0453', '157600', '中国,黑龙江省,牡丹江市,林口县', 'Linkou', '130.28393', '45.27809');
INSERT INTO `tb_region` VALUES ('231081', '绥芬河市', '231000', '绥芬河', '4', '0453', '157300', '中国,黑龙江省,牡丹江市,绥芬河市', 'Suifenhe', '131.15139', '44.41249');
INSERT INTO `tb_region` VALUES ('231083', '海林市', '231000', '海林', '4', '0453', '157100', '中国,黑龙江省,牡丹江市,海林市', 'Hailin', '129.38156', '44.59');
INSERT INTO `tb_region` VALUES ('231084', '宁安市', '231000', '宁安', '4', '0453', '157400', '中国,黑龙江省,牡丹江市,宁安市', 'Ning\'an', '129.48303', '44.34016');
INSERT INTO `tb_region` VALUES ('231085', '穆棱市', '231000', '穆棱', '4', '0453', '157500', '中国,黑龙江省,牡丹江市,穆棱市', 'Muling', '130.52465', '44.919');
INSERT INTO `tb_region` VALUES ('231100', '黑河市', '230000', '黑河', '3', '0456', '164300', '中国,黑龙江省,黑河市', 'Heihe', '127.499023', '50.249585');
INSERT INTO `tb_region` VALUES ('231102', '爱辉区', '231100', '爱辉', '4', '0456', '164300', '中国,黑龙江省,黑河市,爱辉区', 'Aihui', '127.50074', '50.25202');
INSERT INTO `tb_region` VALUES ('231121', '嫩江县', '231100', '嫩江', '4', '0456', '161400', '中国,黑龙江省,黑河市,嫩江县', 'Nenjiang', '125.22607', '49.17844');
INSERT INTO `tb_region` VALUES ('231123', '逊克县', '231100', '逊克', '4', '0456', '164400', '中国,黑龙江省,黑河市,逊克县', 'Xunke', '128.47882', '49.57983');
INSERT INTO `tb_region` VALUES ('231124', '孙吴县', '231100', '孙吴', '4', '0456', '164200', '中国,黑龙江省,黑河市,孙吴县', 'Sunwu', '127.33599', '49.42539');
INSERT INTO `tb_region` VALUES ('231181', '北安市', '231100', '北安', '4', '0456', '164000', '中国,黑龙江省,黑河市,北安市', 'Bei\'an', '126.48193', '48.23872');
INSERT INTO `tb_region` VALUES ('231182', '五大连池市', '231100', '五大连池', '4', '0456', '164100', '中国,黑龙江省,黑河市,五大连池市', 'Wudalianchi', '126.20294', '48.51507');
INSERT INTO `tb_region` VALUES ('231200', '绥化市', '230000', '绥化', '3', '0455', '152000', '中国,黑龙江省,绥化市', 'Suihua', '126.99293', '46.637393');
INSERT INTO `tb_region` VALUES ('231202', '北林区', '231200', '北林', '4', '0455', '152000', '中国,黑龙江省,绥化市,北林区', 'Beilin', '126.98564', '46.63735');
INSERT INTO `tb_region` VALUES ('231221', '望奎县', '231200', '望奎', '4', '0455', '152100', '中国,黑龙江省,绥化市,望奎县', 'Wangkui', '126.48187', '46.83079');
INSERT INTO `tb_region` VALUES ('231222', '兰西县', '231200', '兰西', '4', '0455', '151500', '中国,黑龙江省,绥化市,兰西县', 'Lanxi', '126.28994', '46.2525');
INSERT INTO `tb_region` VALUES ('231223', '青冈县', '231200', '青冈', '4', '0455', '151600', '中国,黑龙江省,绥化市,青冈县', 'Qinggang', '126.11325', '46.68534');
INSERT INTO `tb_region` VALUES ('231224', '庆安县', '231200', '庆安', '4', '0455', '152400', '中国,黑龙江省,绥化市,庆安县', 'Qing\'an', '127.50753', '46.88016');
INSERT INTO `tb_region` VALUES ('231225', '明水县', '231200', '明水', '4', '0455', '151700', '中国,黑龙江省,绥化市,明水县', 'Mingshui', '125.90594', '47.17327');
INSERT INTO `tb_region` VALUES ('231226', '绥棱县', '231200', '绥棱', '4', '0455', '152200', '中国,黑龙江省,绥化市,绥棱县', 'Suileng', '127.11584', '47.24267');
INSERT INTO `tb_region` VALUES ('231281', '安达市', '231200', '安达', '4', '0455', '151400', '中国,黑龙江省,绥化市,安达市', 'Anda', '125.34375', '46.4177');
INSERT INTO `tb_region` VALUES ('231282', '肇东市', '231200', '肇东', '4', '0455', '151100', '中国,黑龙江省,绥化市,肇东市', 'Zhaodong', '125.96243', '46.05131');
INSERT INTO `tb_region` VALUES ('231283', '海伦市', '231200', '海伦', '4', '0455', '152300', '中国,黑龙江省,绥化市,海伦市', 'Hailun', '126.9682', '47.46093');
INSERT INTO `tb_region` VALUES ('232700', '大兴安岭地区', '230000', '大兴安岭', '3', '0457', '165000', '中国,黑龙江省,大兴安岭地区', 'DaXingAnLing', '124.711526', '52.335262');
INSERT INTO `tb_region` VALUES ('232701', '加格达奇区', '232700', '加格达奇', '4', '0457', '165000', '中国,黑龙江省,大兴安岭地区,加格达奇区', 'Jiagedaqi', '124.30954', '51.98144');
INSERT INTO `tb_region` VALUES ('232702', '新林区', '232700', '新林', '4', '0457', '165000', '中国,黑龙江省,大兴安岭地区,新林区', 'Xinlin', '124.397983', '51.67341');
INSERT INTO `tb_region` VALUES ('232703', '松岭区', '232700', '松岭', '4', '0457', '165000', '中国,黑龙江省,大兴安岭地区,松岭区', 'Songling', '124.189713', '51.985453');
INSERT INTO `tb_region` VALUES ('232704', '呼中区', '232700', '呼中', '4', '0457', '165000', '中国,黑龙江省,大兴安岭地区,呼中区', 'Huzhong', '123.60009', '52.03346');
INSERT INTO `tb_region` VALUES ('232721', '呼玛县', '232700', '呼玛', '4', '0457', '165100', '中国,黑龙江省,大兴安岭地区,呼玛县', 'Huma', '126.66174', '51.73112');
INSERT INTO `tb_region` VALUES ('232722', '塔河县', '232700', '塔河', '4', '0457', '165200', '中国,黑龙江省,大兴安岭地区,塔河县', 'Tahe', '124.70999', '52.33431');
INSERT INTO `tb_region` VALUES ('232723', '漠河县', '232700', '漠河', '4', '0457', '165300', '中国,黑龙江省,大兴安岭地区,漠河县', 'Mohe', '122.53759', '52.97003');
INSERT INTO `tb_region` VALUES ('310000', '上海', '100001', '上海', '2', '', '', '中国,上海', 'Shanghai', '121.472644', '31.231706');
INSERT INTO `tb_region` VALUES ('310100', '上海市', '310000', '上海', '3', '021', '200000', '中国,上海,上海市', 'Shanghai', '121.472644', '31.231706');
INSERT INTO `tb_region` VALUES ('310101', '黄浦区', '310100', '黄浦', '4', '021', '200001', '中国,上海,上海市,黄浦区', 'Huangpu', '121.49295', '31.22337');
INSERT INTO `tb_region` VALUES ('310104', '徐汇区', '310100', '徐汇', '4', '021', '200030', '中国,上海,上海市,徐汇区', 'Xuhui', '121.43676', '31.18831');
INSERT INTO `tb_region` VALUES ('310105', '长宁区', '310100', '长宁', '4', '021', '200050', '中国,上海,上海市,长宁区', 'Changning', '121.42462', '31.22036');
INSERT INTO `tb_region` VALUES ('310106', '静安区', '310100', '静安', '4', '021', '200040', '中国,上海,上海市,静安区', 'Jing\'an', '121.4444', '31.22884');
INSERT INTO `tb_region` VALUES ('310107', '普陀区', '310100', '普陀', '4', '021', '200333', '中国,上海,上海市,普陀区', 'Putuo', '121.39703', '31.24951');
INSERT INTO `tb_region` VALUES ('310108', '闸北区', '310100', '闸北', '4', '021', '200070', '中国,上海,上海市,闸北区', 'Zhabei', '121.44636', '31.28075');
INSERT INTO `tb_region` VALUES ('310109', '虹口区', '310100', '虹口', '4', '021', '200086', '中国,上海,上海市,虹口区', 'Hongkou', '121.48162', '31.27788');
INSERT INTO `tb_region` VALUES ('310110', '杨浦区', '310100', '杨浦', '4', '021', '200082', '中国,上海,上海市,杨浦区', 'Yangpu', '121.526', '31.2595');
INSERT INTO `tb_region` VALUES ('310112', '闵行区', '310100', '闵行', '4', '021', '201100', '中国,上海,上海市,闵行区', 'Minhang', '121.38162', '31.11246');
INSERT INTO `tb_region` VALUES ('310113', '宝山区', '310100', '宝山', '4', '021', '201900', '中国,上海,上海市,宝山区', 'Baoshan', '121.4891', '31.4045');
INSERT INTO `tb_region` VALUES ('310114', '嘉定区', '310100', '嘉定', '4', '021', '201800', '中国,上海,上海市,嘉定区', 'Jiading', '121.2655', '31.37473');
INSERT INTO `tb_region` VALUES ('310115', '浦东新区', '310100', '浦东', '4', '021', '200135', '中国,上海,上海市,浦东新区', 'Pudong', '121.5447', '31.22249');
INSERT INTO `tb_region` VALUES ('310116', '金山区', '310100', '金山', '4', '021', '200540', '中国,上海,上海市,金山区', 'Jinshan', '121.34164', '30.74163');
INSERT INTO `tb_region` VALUES ('310117', '松江区', '310100', '松江', '4', '021', '201600', '中国,上海,上海市,松江区', 'Songjiang', '121.22879', '31.03222');
INSERT INTO `tb_region` VALUES ('310118', '青浦区', '310100', '青浦', '4', '021', '201700', '中国,上海,上海市,青浦区', 'Qingpu', '121.12417', '31.14974');
INSERT INTO `tb_region` VALUES ('310120', '奉贤区', '310100', '奉贤', '4', '021', '201400', '中国,上海,上海市,奉贤区', 'Fengxian', '121.47412', '30.9179');
INSERT INTO `tb_region` VALUES ('310230', '崇明县', '310100', '崇明', '4', '021', '202150', '中国,上海,上海市,崇明县', 'Chongming', '121.39758', '31.62278');
INSERT INTO `tb_region` VALUES ('320000', '江苏省', '100001', '江苏', '2', '', '', '中国,江苏省', 'Jiangsu', '118.767413', '32.041544');
INSERT INTO `tb_region` VALUES ('320100', '南京市', '320000', '南京', '3', '025', '210008', '中国,江苏省,南京市', 'Nanjing', '118.767413', '32.041544');
INSERT INTO `tb_region` VALUES ('320102', '玄武区', '320100', '玄武', '4', '025', '210018', '中国,江苏省,南京市,玄武区', 'Xuanwu', '118.79772', '32.04856');
INSERT INTO `tb_region` VALUES ('320104', '秦淮区', '320100', '秦淮', '4', '025', '210001', '中国,江苏省,南京市,秦淮区', 'Qinhuai', '118.79815', '32.01112');
INSERT INTO `tb_region` VALUES ('320105', '建邺区', '320100', '建邺', '4', '025', '210004', '中国,江苏省,南京市,建邺区', 'Jianye', '118.76641', '32.03096');
INSERT INTO `tb_region` VALUES ('320106', '鼓楼区', '320100', '鼓楼', '4', '025', '210009', '中国,江苏省,南京市,鼓楼区', 'Gulou', '118.76974', '32.06632');
INSERT INTO `tb_region` VALUES ('320111', '浦口区', '320100', '浦口', '4', '025', '211800', '中国,江苏省,南京市,浦口区', 'Pukou', '118.62802', '32.05881');
INSERT INTO `tb_region` VALUES ('320113', '栖霞区', '320100', '栖霞', '4', '025', '210046', '中国,江苏省,南京市,栖霞区', 'Qixia', '118.88064', '32.11352');
INSERT INTO `tb_region` VALUES ('320114', '雨花台区', '320100', '雨花台', '4', '025', '210012', '中国,江苏省,南京市,雨花台区', 'Yuhuatai', '118.7799', '31.99202');
INSERT INTO `tb_region` VALUES ('320115', '江宁区', '320100', '江宁', '4', '025', '211100', '中国,江苏省,南京市,江宁区', 'Jiangning', '118.8399', '31.95263');
INSERT INTO `tb_region` VALUES ('320116', '六合区', '320100', '六合', '4', '025', '211500', '中国,江苏省,南京市,六合区', 'Luhe', '118.8413', '32.34222');
INSERT INTO `tb_region` VALUES ('320117', '溧水区', '320100', '溧水', '4', '025', '211200', '中国,江苏省,南京市,溧水区', 'Lishui', '119.028732', '31.653061');
INSERT INTO `tb_region` VALUES ('320118', '高淳区', '320100', '高淳', '4', '025', '211300', '中国,江苏省,南京市,高淳区', 'Gaochun', '118.87589', '31.327132');
INSERT INTO `tb_region` VALUES ('320200', '无锡市', '320000', '无锡', '3', '0510', '214000', '中国,江苏省,无锡市', 'Wuxi', '120.301663', '31.574729');
INSERT INTO `tb_region` VALUES ('320202', '崇安区', '320200', '崇安', '4', '0510', '214001', '中国,江苏省,无锡市,崇安区', 'Chong\'an', '120.29975', '31.58002');
INSERT INTO `tb_region` VALUES ('320203', '南长区', '320200', '南长', '4', '0510', '214021', '中国,江苏省,无锡市,南长区', 'Nanchang', '120.30873', '31.56359');
INSERT INTO `tb_region` VALUES ('320204', '北塘区', '320200', '北塘', '4', '0510', '214044', '中国,江苏省,无锡市,北塘区', 'Beitang', '120.29405', '31.60592');
INSERT INTO `tb_region` VALUES ('320205', '锡山区', '320200', '锡山', '4', '0510', '214101', '中国,江苏省,无锡市,锡山区', 'Xishan', '120.35699', '31.5886');
INSERT INTO `tb_region` VALUES ('320206', '惠山区', '320200', '惠山', '4', '0510', '214174', '中国,江苏省,无锡市,惠山区', 'Huishan', '120.29849', '31.68088');
INSERT INTO `tb_region` VALUES ('320211', '滨湖区', '320200', '滨湖', '4', '0510', '214123', '中国,江苏省,无锡市,滨湖区', 'Binhu', '120.29461', '31.52162');
INSERT INTO `tb_region` VALUES ('320281', '江阴市', '320200', '江阴', '4', '0510', '214431', '中国,江苏省,无锡市,江阴市', 'Jiangyin', '120.2853', '31.91996');
INSERT INTO `tb_region` VALUES ('320282', '宜兴市', '320200', '宜兴', '4', '0510', '214200', '中国,江苏省,无锡市,宜兴市', 'Yixing', '119.82357', '31.33978');
INSERT INTO `tb_region` VALUES ('320300', '徐州市', '320000', '徐州', '3', '0516', '221003', '中国,江苏省,徐州市', 'Xuzhou', '117.184811', '34.261792');
INSERT INTO `tb_region` VALUES ('320302', '鼓楼区', '320300', '鼓楼', '4', '0516', '221005', '中国,江苏省,徐州市,鼓楼区', 'Gulou', '117.18559', '34.28851');
INSERT INTO `tb_region` VALUES ('320303', '云龙区', '320300', '云龙', '4', '0516', '221007', '中国,江苏省,徐州市,云龙区', 'Yunlong', '117.23053', '34.24895');
INSERT INTO `tb_region` VALUES ('320305', '贾汪区', '320300', '贾汪', '4', '0516', '221003', '中国,江苏省,徐州市,贾汪区', 'Jiawang', '117.45346', '34.44264');
INSERT INTO `tb_region` VALUES ('320311', '泉山区', '320300', '泉山', '4', '0516', '221006', '中国,江苏省,徐州市,泉山区', 'Quanshan', '117.19378', '34.24418');
INSERT INTO `tb_region` VALUES ('320312', '铜山区', '320300', '铜山', '4', '0516', '221106', '中国,江苏省,徐州市,铜山区', 'Tongshan', '117.183894', '34.19288');
INSERT INTO `tb_region` VALUES ('320321', '丰县', '320300', '丰县', '4', '0516', '221700', '中国,江苏省,徐州市,丰县', 'Fengxian', '116.59957', '34.69972');
INSERT INTO `tb_region` VALUES ('320322', '沛县', '320300', '沛县', '4', '0516', '221600', '中国,江苏省,徐州市,沛县', 'Peixian', '116.93743', '34.72163');
INSERT INTO `tb_region` VALUES ('320324', '睢宁县', '320300', '睢宁', '4', '0516', '221200', '中国,江苏省,徐州市,睢宁县', 'Suining', '117.94104', '33.91269');
INSERT INTO `tb_region` VALUES ('320381', '新沂市', '320300', '新沂', '4', '0516', '221400', '中国,江苏省,徐州市,新沂市', 'Xinyi', '118.35452', '34.36942');
INSERT INTO `tb_region` VALUES ('320382', '邳州市', '320300', '邳州', '4', '0516', '221300', '中国,江苏省,徐州市,邳州市', 'Pizhou', '117.95858', '34.33329');
INSERT INTO `tb_region` VALUES ('320400', '常州市', '320000', '常州', '3', '0519', '213000', '中国,江苏省,常州市', 'Changzhou', '119.946973', '31.772752');
INSERT INTO `tb_region` VALUES ('320402', '天宁区', '320400', '天宁', '4', '0519', '213000', '中国,江苏省,常州市,天宁区', 'Tianning', '119.95132', '31.75211');
INSERT INTO `tb_region` VALUES ('320404', '钟楼区', '320400', '钟楼', '4', '0519', '213023', '中国,江苏省,常州市,钟楼区', 'Zhonglou', '119.90178', '31.80221');
INSERT INTO `tb_region` VALUES ('320405', '戚墅堰区', '320400', '戚墅堰', '4', '0519', '213025', '中国,江苏省,常州市,戚墅堰区', 'Qishuyan', '120.06106', '31.71956');
INSERT INTO `tb_region` VALUES ('320411', '新北区', '320400', '新北', '4', '0519', '213022', '中国,江苏省,常州市,新北区', 'Xinbei', '119.97131', '31.83046');
INSERT INTO `tb_region` VALUES ('320412', '武进区', '320400', '武进', '4', '0519', '213100', '中国,江苏省,常州市,武进区', 'Wujin', '119.94244', '31.70086');
INSERT INTO `tb_region` VALUES ('320481', '溧阳市', '320400', '溧阳', '4', '0519', '213300', '中国,江苏省,常州市,溧阳市', 'Liyang', '119.4837', '31.41538');
INSERT INTO `tb_region` VALUES ('320482', '金坛市', '320400', '金坛', '4', '0519', '213200', '中国,江苏省,常州市,金坛市', 'Jintan', '119.57757', '31.74043');
INSERT INTO `tb_region` VALUES ('320500', '苏州市', '320000', '苏州', '3', '0512', '215002', '中国,江苏省,苏州市', 'Suzhou', '120.619585', '31.299379');
INSERT INTO `tb_region` VALUES ('320505', '虎丘区', '320500', '虎丘', '4', '0512', '215004', '中国,江苏省,苏州市,虎丘区', 'Huqiu', '120.57345', '31.2953');
INSERT INTO `tb_region` VALUES ('320506', '吴中区', '320500', '吴中', '4', '0512', '215128', '中国,江苏省,苏州市,吴中区', 'Wuzhong', '120.63211', '31.26226');
INSERT INTO `tb_region` VALUES ('320507', '相城区', '320500', '相城', '4', '0512', '215131', '中国,江苏省,苏州市,相城区', 'Xiangcheng', '120.64239', '31.36889');
INSERT INTO `tb_region` VALUES ('320508', '姑苏区', '320500', '姑苏', '4', '0512', '215031', '中国,江苏省,苏州市,姑苏区', 'Gusu', '120.619585', '31.299379');
INSERT INTO `tb_region` VALUES ('320509', '吴江区', '320500', '吴江', '4', '0512', '215200', '中国,江苏省,苏州市,吴江区', 'Wujiang', '120.638317', '31.159815');
INSERT INTO `tb_region` VALUES ('320581', '常熟市', '320500', '常熟', '4', '0512', '215500', '中国,江苏省,苏州市,常熟市', 'Changshu', '120.75225', '31.65374');
INSERT INTO `tb_region` VALUES ('320582', '张家港市', '320500', '张家港', '4', '0512', '215600', '中国,江苏省,苏州市,张家港市', 'Zhangjiagang', '120.55538', '31.87532');
INSERT INTO `tb_region` VALUES ('320583', '昆山市', '320500', '昆山', '4', '0512', '215300', '中国,江苏省,苏州市,昆山市', 'Kunshan', '120.98074', '31.38464');
INSERT INTO `tb_region` VALUES ('320585', '太仓市', '320500', '太仓', '4', '0512', '215400', '中国,江苏省,苏州市,太仓市', 'Taicang', '121.10891', '31.4497');
INSERT INTO `tb_region` VALUES ('320600', '南通市', '320000', '南通', '3', '0513', '226001', '中国,江苏省,南通市', 'Nantong', '120.864608', '32.016212');
INSERT INTO `tb_region` VALUES ('320602', '崇川区', '320600', '崇川', '4', '0513', '226001', '中国,江苏省,南通市,崇川区', 'Chongchuan', '120.8573', '32.0098');
INSERT INTO `tb_region` VALUES ('320611', '港闸区', '320600', '港闸', '4', '0513', '226001', '中国,江苏省,南通市,港闸区', 'Gangzha', '120.81778', '32.03163');
INSERT INTO `tb_region` VALUES ('320612', '通州区', '320600', '通州', '4', '0513', '226300', '中国,江苏省,南通市,通州区', 'Tongzhou', '121.07293', '32.0676');
INSERT INTO `tb_region` VALUES ('320621', '海安县', '320600', '海安', '4', '0513', '226600', '中国,江苏省,南通市,海安县', 'Hai\'an', '120.45852', '32.54514');
INSERT INTO `tb_region` VALUES ('320623', '如东县', '320600', '如东', '4', '0513', '226400', '中国,江苏省,南通市,如东县', 'Rudong', '121.18942', '32.31439');
INSERT INTO `tb_region` VALUES ('320681', '启东市', '320600', '启东', '4', '0513', '226200', '中国,江苏省,南通市,启东市', 'Qidong', '121.65985', '31.81083');
INSERT INTO `tb_region` VALUES ('320682', '如皋市', '320600', '如皋', '4', '0513', '226500', '中国,江苏省,南通市,如皋市', 'Rugao', '120.55969', '32.37597');
INSERT INTO `tb_region` VALUES ('320684', '海门市', '320600', '海门', '4', '0513', '226100', '中国,江苏省,南通市,海门市', 'Haimen', '121.16995', '31.89422');
INSERT INTO `tb_region` VALUES ('320700', '连云港市', '320000', '连云港', '3', '0518', '222002', '中国,江苏省,连云港市', 'Lianyungang', '119.178821', '34.600018');
INSERT INTO `tb_region` VALUES ('320703', '连云区', '320700', '连云', '4', '0518', '222042', '中国,江苏省,连云港市,连云区', 'Lianyun', '119.37304', '34.75293');
INSERT INTO `tb_region` VALUES ('320706', '海州区', '320700', '海州', '4', '0518', '222003', '中国,江苏省,连云港市,海州区', 'Haizhou', '119.13128', '34.56986');
INSERT INTO `tb_region` VALUES ('320707', '赣榆区', '320700', '赣榆', '4', '0518', '222100', '中国,江苏省,连云港市,赣榆区', 'Ganyu', '119.128774', '34.839154');
INSERT INTO `tb_region` VALUES ('320722', '东海县', '320700', '东海', '4', '0518', '222300', '中国,江苏省,连云港市,东海县', 'Donghai', '118.77145', '34.54215');
INSERT INTO `tb_region` VALUES ('320723', '灌云县', '320700', '灌云', '4', '0518', '222200', '中国,江苏省,连云港市,灌云县', 'Guanyun', '119.23925', '34.28391');
INSERT INTO `tb_region` VALUES ('320724', '灌南县', '320700', '灌南', '4', '0518', '222500', '中国,江苏省,连云港市,灌南县', 'Guannan', '119.35632', '34.09');
INSERT INTO `tb_region` VALUES ('320800', '淮安市', '320000', '淮安', '3', '0517', '223001', '中国,江苏省,淮安市', 'Huai\'an', '119.021265', '33.597506');
INSERT INTO `tb_region` VALUES ('320802', '清河区', '320800', '清河', '4', '0517', '223001', '中国,江苏省,淮安市,清河区', 'Qinghe', '119.00778', '33.59949');
INSERT INTO `tb_region` VALUES ('320803', '淮安区', '320800', '淮安', '4', '0517', '223200', '中国,江苏省,淮安市,淮安区', 'Huai\'an', '119.021265', '33.597506');
INSERT INTO `tb_region` VALUES ('320804', '淮阴区', '320800', '淮阴', '4', '0517', '223300', '中国,江苏省,淮安市,淮阴区', 'Huaiyin', '119.03485', '33.63171');
INSERT INTO `tb_region` VALUES ('320811', '清浦区', '320800', '清浦', '4', '0517', '223002', '中国,江苏省,淮安市,清浦区', 'Qingpu', '119.02648', '33.55232');
INSERT INTO `tb_region` VALUES ('320826', '涟水县', '320800', '涟水', '4', '0517', '223400', '中国,江苏省,淮安市,涟水县', 'Lianshui', '119.26083', '33.78094');
INSERT INTO `tb_region` VALUES ('320829', '洪泽县', '320800', '洪泽', '4', '0517', '223100', '中国,江苏省,淮安市,洪泽县', 'Hongze', '118.87344', '33.29429');
INSERT INTO `tb_region` VALUES ('320830', '盱眙县', '320800', '盱眙', '4', '0517', '211700', '中国,江苏省,淮安市,盱眙县', 'Xuyi', '118.54495', '33.01086');
INSERT INTO `tb_region` VALUES ('320831', '金湖县', '320800', '金湖', '4', '0517', '211600', '中国,江苏省,淮安市,金湖县', 'Jinhu', '119.02307', '33.02219');
INSERT INTO `tb_region` VALUES ('320900', '盐城市', '320000', '盐城', '3', '0515', '224005', '中国,江苏省,盐城市', 'Yancheng', '120.139998', '33.377631');
INSERT INTO `tb_region` VALUES ('320902', '亭湖区', '320900', '亭湖', '4', '0515', '224005', '中国,江苏省,盐城市,亭湖区', 'Tinghu', '120.16583', '33.37825');
INSERT INTO `tb_region` VALUES ('320903', '盐都区', '320900', '盐都', '4', '0515', '224055', '中国,江苏省,盐城市,盐都区', 'Yandu', '120.15441', '33.3373');
INSERT INTO `tb_region` VALUES ('320921', '响水县', '320900', '响水', '4', '0515', '224600', '中国,江苏省,盐城市,响水县', 'Xiangshui', '119.56985', '34.20513');
INSERT INTO `tb_region` VALUES ('320922', '滨海县', '320900', '滨海', '4', '0515', '224500', '中国,江苏省,盐城市,滨海县', 'Binhai', '119.82058', '33.98972');
INSERT INTO `tb_region` VALUES ('320923', '阜宁县', '320900', '阜宁', '4', '0515', '224400', '中国,江苏省,盐城市,阜宁县', 'Funing', '119.80175', '33.78228');
INSERT INTO `tb_region` VALUES ('320924', '射阳县', '320900', '射阳', '4', '0515', '224300', '中国,江苏省,盐城市,射阳县', 'Sheyang', '120.26043', '33.77636');
INSERT INTO `tb_region` VALUES ('320925', '建湖县', '320900', '建湖', '4', '0515', '224700', '中国,江苏省,盐城市,建湖县', 'Jianhu', '119.79852', '33.47241');
INSERT INTO `tb_region` VALUES ('320981', '东台市', '320900', '东台', '4', '0515', '224200', '中国,江苏省,盐城市,东台市', 'Dongtai', '120.32376', '32.85078');
INSERT INTO `tb_region` VALUES ('320982', '大丰市', '320900', '大丰', '4', '0515', '224100', '中国,江苏省,盐城市,大丰市', 'Dafeng', '120.46594', '33.19893');
INSERT INTO `tb_region` VALUES ('321000', '扬州市', '320000', '扬州', '3', '0514', '225002', '中国,江苏省,扬州市', 'Yangzhou', '119.421003', '32.393159');
INSERT INTO `tb_region` VALUES ('321002', '广陵区', '321000', '广陵', '4', '0514', '225002', '中国,江苏省,扬州市,广陵区', 'Guangling', '119.43186', '32.39472');
INSERT INTO `tb_region` VALUES ('321003', '邗江区', '321000', '邗江', '4', '0514', '225002', '中国,江苏省,扬州市,邗江区', 'Hanjiang', '119.39816', '32.3765');
INSERT INTO `tb_region` VALUES ('321012', '江都区', '321000', '江都', '4', '0514', '225200', '中国,江苏省,扬州市,江都区', 'Jiangdu', '119.567481', '32.426564');
INSERT INTO `tb_region` VALUES ('321023', '宝应县', '321000', '宝应', '4', '0514', '225800', '中国,江苏省,扬州市,宝应县', 'Baoying', '119.31213', '33.23549');
INSERT INTO `tb_region` VALUES ('321081', '仪征市', '321000', '仪征', '4', '0514', '211400', '中国,江苏省,扬州市,仪征市', 'Yizheng', '119.18432', '32.27197');
INSERT INTO `tb_region` VALUES ('321084', '高邮市', '321000', '高邮', '4', '0514', '225600', '中国,江苏省,扬州市,高邮市', 'Gaoyou', '119.45965', '32.78135');
INSERT INTO `tb_region` VALUES ('321100', '镇江市', '320000', '镇江', '3', '0511', '212004', '中国,江苏省,镇江市', 'Zhenjiang', '119.452753', '32.204402');
INSERT INTO `tb_region` VALUES ('321102', '京口区', '321100', '京口', '4', '0511', '212003', '中国,江苏省,镇江市,京口区', 'Jingkou', '119.46947', '32.19809');
INSERT INTO `tb_region` VALUES ('321111', '润州区', '321100', '润州', '4', '0511', '212005', '中国,江苏省,镇江市,润州区', 'Runzhou', '119.41134', '32.19523');
INSERT INTO `tb_region` VALUES ('321112', '丹徒区', '321100', '丹徒', '4', '0511', '212028', '中国,江苏省,镇江市,丹徒区', 'Dantu', '119.43383', '32.13183');
INSERT INTO `tb_region` VALUES ('321181', '丹阳市', '321100', '丹阳', '4', '0511', '212300', '中国,江苏省,镇江市,丹阳市', 'Danyang', '119.57525', '31.99121');
INSERT INTO `tb_region` VALUES ('321182', '扬中市', '321100', '扬中', '4', '0511', '212200', '中国,江苏省,镇江市,扬中市', 'Yangzhong', '119.79718', '32.2363');
INSERT INTO `tb_region` VALUES ('321183', '句容市', '321100', '句容', '4', '0511', '212400', '中国,江苏省,镇江市,句容市', 'Jurong', '119.16482', '31.95591');
INSERT INTO `tb_region` VALUES ('321200', '泰州市', '320000', '泰州', '3', '0523', '225300', '中国,江苏省,泰州市', 'Taizhou', '119.915176', '32.484882');
INSERT INTO `tb_region` VALUES ('321202', '海陵区', '321200', '海陵', '4', '0523', '225300', '中国,江苏省,泰州市,海陵区', 'Hailing', '119.91942', '32.49101');
INSERT INTO `tb_region` VALUES ('321203', '高港区', '321200', '高港', '4', '0523', '225321', '中国,江苏省,泰州市,高港区', 'Gaogang', '119.88089', '32.31833');
INSERT INTO `tb_region` VALUES ('321204', '姜堰区', '321200', '姜堰', '4', '0523', '225500', '中国,江苏省,泰州市,姜堰区', 'Jiangyan', '120.148208', '32.508483');
INSERT INTO `tb_region` VALUES ('321281', '兴化市', '321200', '兴化', '4', '0523', '225700', '中国,江苏省,泰州市,兴化市', 'Xinghua', '119.85238', '32.90944');
INSERT INTO `tb_region` VALUES ('321282', '靖江市', '321200', '靖江', '4', '0523', '214500', '中国,江苏省,泰州市,靖江市', 'Jingjiang', '120.27291', '32.01595');
INSERT INTO `tb_region` VALUES ('321283', '泰兴市', '321200', '泰兴', '4', '0523', '225400', '中国,江苏省,泰州市,泰兴市', 'Taixing', '120.05194', '32.17187');
INSERT INTO `tb_region` VALUES ('321300', '宿迁市', '320000', '宿迁', '3', '0527', '223800', '中国,江苏省,宿迁市', 'Suqian', '118.293328', '33.945154');
INSERT INTO `tb_region` VALUES ('321302', '宿城区', '321300', '宿城', '4', '0527', '223800', '中国,江苏省,宿迁市,宿城区', 'Sucheng', '118.29141', '33.94219');
INSERT INTO `tb_region` VALUES ('321311', '宿豫区', '321300', '宿豫', '4', '0527', '223800', '中国,江苏省,宿迁市,宿豫区', 'Suyu', '118.32922', '33.94673');
INSERT INTO `tb_region` VALUES ('321322', '沭阳县', '321300', '沭阳', '4', '0527', '223600', '中国,江苏省,宿迁市,沭阳县', 'Shuyang', '118.76873', '34.11446');
INSERT INTO `tb_region` VALUES ('321323', '泗阳县', '321300', '泗阳', '4', '0527', '223700', '中国,江苏省,宿迁市,泗阳县', 'Siyang', '118.7033', '33.72096');
INSERT INTO `tb_region` VALUES ('321324', '泗洪县', '321300', '泗洪', '4', '0527', '223900', '中国,江苏省,宿迁市,泗洪县', 'Sihong', '118.21716', '33.45996');
INSERT INTO `tb_region` VALUES ('330000', '浙江省', '100001', '浙江', '2', '', '', '中国,浙江省', 'Zhejiang', '120.153576', '30.287459');
INSERT INTO `tb_region` VALUES ('330100', '杭州市', '330000', '杭州', '3', '0571', '310026', '中国,浙江省,杭州市', 'Hangzhou', '120.153576', '30.287459');
INSERT INTO `tb_region` VALUES ('330102', '上城区', '330100', '上城', '4', '0571', '310002', '中国,浙江省,杭州市,上城区', 'Shangcheng', '120.16922', '30.24255');
INSERT INTO `tb_region` VALUES ('330103', '下城区', '330100', '下城', '4', '0571', '310006', '中国,浙江省,杭州市,下城区', 'Xiacheng', '120.18096', '30.28153');
INSERT INTO `tb_region` VALUES ('330104', '江干区', '330100', '江干', '4', '0571', '310016', '中国,浙江省,杭州市,江干区', 'Jianggan', '120.20517', '30.2572');
INSERT INTO `tb_region` VALUES ('330105', '拱墅区', '330100', '拱墅', '4', '0571', '310011', '中国,浙江省,杭州市,拱墅区', 'Gongshu', '120.14209', '30.31968');
INSERT INTO `tb_region` VALUES ('330106', '西湖区', '330100', '西湖', '4', '0571', '310013', '中国,浙江省,杭州市,西湖区', 'Xihu', '120.12979', '30.25949');
INSERT INTO `tb_region` VALUES ('330108', '滨江区', '330100', '滨江', '4', '0571', '310051', '中国,浙江省,杭州市,滨江区', 'Binjiang', '120.21194', '30.20835');
INSERT INTO `tb_region` VALUES ('330109', '萧山区', '330100', '萧山', '4', '0571', '311200', '中国,浙江省,杭州市,萧山区', 'Xiaoshan', '120.26452', '30.18505');
INSERT INTO `tb_region` VALUES ('330110', '余杭区', '330100', '余杭', '4', '0571', '311100', '中国,浙江省,杭州市,余杭区', 'Yuhang', '120.29986', '30.41829');
INSERT INTO `tb_region` VALUES ('330122', '桐庐县', '330100', '桐庐', '4', '0571', '311500', '中国,浙江省,杭州市,桐庐县', 'Tonglu', '119.68853', '29.79779');
INSERT INTO `tb_region` VALUES ('330127', '淳安县', '330100', '淳安', '4', '0571', '311700', '中国,浙江省,杭州市,淳安县', 'Chun\'an', '119.04257', '29.60988');
INSERT INTO `tb_region` VALUES ('330182', '建德市', '330100', '建德', '4', '0571', '311600', '中国,浙江省,杭州市,建德市', 'Jiande', '119.28158', '29.47603');
INSERT INTO `tb_region` VALUES ('330183', '富阳区', '330100', '富阳', '4', '0571', '311400', '中国,浙江省,杭州市,富阳区', 'Fuyang', '119.96041', '30.04878');
INSERT INTO `tb_region` VALUES ('330185', '临安市', '330100', '临安', '4', '0571', '311300', '中国,浙江省,杭州市,临安市', 'Lin\'an', '119.72473', '30.23447');
INSERT INTO `tb_region` VALUES ('330200', '宁波市', '330000', '宁波', '3', '0574', '315000', '中国,浙江省,宁波市', 'Ningbo', '121.549792', '29.868388');
INSERT INTO `tb_region` VALUES ('330203', '海曙区', '330200', '海曙', '4', '0574', '315000', '中国,浙江省,宁波市,海曙区', 'Haishu', '121.55106', '29.85977');
INSERT INTO `tb_region` VALUES ('330204', '江东区', '330200', '江东', '4', '0574', '315040', '中国,浙江省,宁波市,江东区', 'Jiangdong', '121.57028', '29.86701');
INSERT INTO `tb_region` VALUES ('330205', '江北区', '330200', '江北', '4', '0574', '315020', '中国,浙江省,宁波市,江北区', 'Jiangbei', '121.55681', '29.88776');
INSERT INTO `tb_region` VALUES ('330206', '北仑区', '330200', '北仑', '4', '0574', '315800', '中国,浙江省,宁波市,北仑区', 'Beilun', '121.84408', '29.90069');
INSERT INTO `tb_region` VALUES ('330211', '镇海区', '330200', '镇海', '4', '0574', '315200', '中国,浙江省,宁波市,镇海区', 'Zhenhai', '121.71615', '29.94893');
INSERT INTO `tb_region` VALUES ('330212', '鄞州区', '330200', '鄞州', '4', '0574', '315100', '中国,浙江省,宁波市,鄞州区', 'Yinzhou', '121.54754', '29.81614');
INSERT INTO `tb_region` VALUES ('330225', '象山县', '330200', '象山', '4', '0574', '315700', '中国,浙江省,宁波市,象山县', 'Xiangshan', '121.86917', '29.47758');
INSERT INTO `tb_region` VALUES ('330226', '宁海县', '330200', '宁海', '4', '0574', '315600', '中国,浙江省,宁波市,宁海县', 'Ninghai', '121.43072', '29.2889');
INSERT INTO `tb_region` VALUES ('330281', '余姚市', '330200', '余姚', '4', '0574', '315400', '中国,浙江省,宁波市,余姚市', 'Yuyao', '121.15341', '30.03867');
INSERT INTO `tb_region` VALUES ('330282', '慈溪市', '330200', '慈溪', '4', '0574', '315300', '中国,浙江省,宁波市,慈溪市', 'Cixi', '121.26641', '30.16959');
INSERT INTO `tb_region` VALUES ('330283', '奉化市', '330200', '奉化', '4', '0574', '315500', '中国,浙江省,宁波市,奉化市', 'Fenghua', '121.41003', '29.65537');
INSERT INTO `tb_region` VALUES ('330300', '温州市', '330000', '温州', '3', '0577', '325000', '中国,浙江省,温州市', 'Wenzhou', '120.672111', '28.000575');
INSERT INTO `tb_region` VALUES ('330302', '鹿城区', '330300', '鹿城', '4', '0577', '325000', '中国,浙江省,温州市,鹿城区', 'Lucheng', '120.65505', '28.01489');
INSERT INTO `tb_region` VALUES ('330303', '龙湾区', '330300', '龙湾', '4', '0577', '325013', '中国,浙江省,温州市,龙湾区', 'Longwan', '120.83053', '27.91284');
INSERT INTO `tb_region` VALUES ('330304', '瓯海区', '330300', '瓯海', '4', '0577', '325005', '中国,浙江省,温州市,瓯海区', 'Ouhai', '120.63751', '28.00714');
INSERT INTO `tb_region` VALUES ('330322', '洞头县', '330300', '洞头', '4', '0577', '325700', '中国,浙江省,温州市,洞头县', 'Dongtou', '121.15606', '27.83634');
INSERT INTO `tb_region` VALUES ('330324', '永嘉县', '330300', '永嘉', '4', '0577', '325100', '中国,浙江省,温州市,永嘉县', 'Yongjia', '120.69317', '28.15456');
INSERT INTO `tb_region` VALUES ('330326', '平阳县', '330300', '平阳', '4', '0577', '325400', '中国,浙江省,温州市,平阳县', 'Pingyang', '120.56506', '27.66245');
INSERT INTO `tb_region` VALUES ('330327', '苍南县', '330300', '苍南', '4', '0577', '325800', '中国,浙江省,温州市,苍南县', 'Cangnan', '120.42608', '27.51739');
INSERT INTO `tb_region` VALUES ('330328', '文成县', '330300', '文成', '4', '0577', '325300', '中国,浙江省,温州市,文成县', 'Wencheng', '120.09063', '27.78678');
INSERT INTO `tb_region` VALUES ('330329', '泰顺县', '330300', '泰顺', '4', '0577', '325500', '中国,浙江省,温州市,泰顺县', 'Taishun', '119.7182', '27.55694');
INSERT INTO `tb_region` VALUES ('330381', '瑞安市', '330300', '瑞安', '4', '0577', '325200', '中国,浙江省,温州市,瑞安市', 'Rui\'an', '120.65466', '27.78041');
INSERT INTO `tb_region` VALUES ('330382', '乐清市', '330300', '乐清', '4', '0577', '325600', '中国,浙江省,温州市,乐清市', 'Yueqing', '120.9617', '28.12404');
INSERT INTO `tb_region` VALUES ('330400', '嘉兴市', '330000', '嘉兴', '3', '0573', '314000', '中国,浙江省,嘉兴市', 'Jiaxing', '120.750865', '30.762653');
INSERT INTO `tb_region` VALUES ('330402', '南湖区', '330400', '南湖', '4', '0573', '314051', '中国,浙江省,嘉兴市,南湖区', 'Nanhu', '120.78524', '30.74865');
INSERT INTO `tb_region` VALUES ('330411', '秀洲区', '330400', '秀洲', '4', '0573', '314031', '中国,浙江省,嘉兴市,秀洲区', 'Xiuzhou', '120.70867', '30.76454');
INSERT INTO `tb_region` VALUES ('330421', '嘉善县', '330400', '嘉善', '4', '0573', '314100', '中国,浙江省,嘉兴市,嘉善县', 'Jiashan', '120.92559', '30.82993');
INSERT INTO `tb_region` VALUES ('330424', '海盐县', '330400', '海盐', '4', '0573', '314300', '中国,浙江省,嘉兴市,海盐县', 'Haiyan', '120.9457', '30.52547');
INSERT INTO `tb_region` VALUES ('330481', '海宁市', '330400', '海宁', '4', '0573', '314400', '中国,浙江省,嘉兴市,海宁市', 'Haining', '120.6813', '30.5097');
INSERT INTO `tb_region` VALUES ('330482', '平湖市', '330400', '平湖', '4', '0573', '314200', '中国,浙江省,嘉兴市,平湖市', 'Pinghu', '121.02166', '30.69618');
INSERT INTO `tb_region` VALUES ('330483', '桐乡市', '330400', '桐乡', '4', '0573', '314500', '中国,浙江省,嘉兴市,桐乡市', 'Tongxiang', '120.56485', '30.6302');
INSERT INTO `tb_region` VALUES ('330500', '湖州市', '330000', '湖州', '3', '0572', '313000', '中国,浙江省,湖州市', 'Huzhou', '120.102398', '30.867198');
INSERT INTO `tb_region` VALUES ('330502', '吴兴区', '330500', '吴兴', '4', '0572', '313000', '中国,浙江省,湖州市,吴兴区', 'Wuxing', '120.12548', '30.85752');
INSERT INTO `tb_region` VALUES ('330503', '南浔区', '330500', '南浔', '4', '0572', '313009', '中国,浙江省,湖州市,南浔区', 'Nanxun', '120.42038', '30.86686');
INSERT INTO `tb_region` VALUES ('330521', '德清县', '330500', '德清', '4', '0572', '313200', '中国,浙江省,湖州市,德清县', 'Deqing', '119.97836', '30.53369');
INSERT INTO `tb_region` VALUES ('330522', '长兴县', '330500', '长兴', '4', '0572', '313100', '中国,浙江省,湖州市,长兴县', 'Changxing', '119.90783', '31.00606');
INSERT INTO `tb_region` VALUES ('330523', '安吉县', '330500', '安吉', '4', '0572', '313300', '中国,浙江省,湖州市,安吉县', 'Anji', '119.68158', '30.63798');
INSERT INTO `tb_region` VALUES ('330600', '绍兴市', '330000', '绍兴', '3', '0575', '312000', '中国,浙江省,绍兴市', 'Shaoxing', '120.582112', '29.997117');
INSERT INTO `tb_region` VALUES ('330602', '越城区', '330600', '越城', '4', '0575', '312000', '中国,浙江省,绍兴市,越城区', 'Yuecheng', '120.5819', '29.98895');
INSERT INTO `tb_region` VALUES ('330603', '柯桥区', '330600', '柯桥', '4', '0575', '312030', '中国,浙江省,绍兴市,柯桥区', 'Keqiao ', '120.492736', '30.08763');
INSERT INTO `tb_region` VALUES ('330604', '上虞区', '330600', '上虞', '4', '0575', '312300', '中国,浙江省,绍兴市,上虞区', 'Shangyu', '120.476075', '30.078038');
INSERT INTO `tb_region` VALUES ('330624', '新昌县', '330600', '新昌', '4', '0575', '312500', '中国,浙江省,绍兴市,新昌县', 'Xinchang', '120.90435', '29.49991');
INSERT INTO `tb_region` VALUES ('330681', '诸暨市', '330600', '诸暨', '4', '0575', '311800', '中国,浙江省,绍兴市,诸暨市', 'Zhuji', '120.23629', '29.71358');
INSERT INTO `tb_region` VALUES ('330683', '嵊州市', '330600', '嵊州', '4', '0575', '312400', '中国,浙江省,绍兴市,嵊州市', 'Shengzhou', '120.82174', '29.58854');
INSERT INTO `tb_region` VALUES ('330700', '金华市', '330000', '金华', '3', '0579', '321000', '中国,浙江省,金华市', 'Jinhua', '119.649506', '29.089524');
INSERT INTO `tb_region` VALUES ('330702', '婺城区', '330700', '婺城', '4', '0579', '321000', '中国,浙江省,金华市,婺城区', 'Wucheng', '119.57135', '29.09521');
INSERT INTO `tb_region` VALUES ('330703', '金东区', '330700', '金东', '4', '0579', '321000', '中国,浙江省,金华市,金东区', 'Jindong', '119.69302', '29.0991');
INSERT INTO `tb_region` VALUES ('330723', '武义县', '330700', '武义', '4', '0579', '321200', '中国,浙江省,金华市,武义县', 'Wuyi', '119.8164', '28.89331');
INSERT INTO `tb_region` VALUES ('330726', '浦江县', '330700', '浦江', '4', '0579', '322200', '中国,浙江省,金华市,浦江县', 'Pujiang', '119.89181', '29.45353');
INSERT INTO `tb_region` VALUES ('330727', '磐安县', '330700', '磐安', '4', '0579', '322300', '中国,浙江省,金华市,磐安县', 'Pan\'an', '120.45022', '29.05733');
INSERT INTO `tb_region` VALUES ('330781', '兰溪市', '330700', '兰溪', '4', '0579', '321100', '中国,浙江省,金华市,兰溪市', 'Lanxi', '119.45965', '29.20841');
INSERT INTO `tb_region` VALUES ('330782', '义乌市', '330700', '义乌', '4', '0579', '322000', '中国,浙江省,金华市,义乌市', 'Yiwu', '120.0744', '29.30558');
INSERT INTO `tb_region` VALUES ('330783', '东阳市', '330700', '东阳', '4', '0579', '322100', '中国,浙江省,金华市,东阳市', 'Dongyang', '120.24185', '29.28942');
INSERT INTO `tb_region` VALUES ('330784', '永康市', '330700', '永康', '4', '0579', '321300', '中国,浙江省,金华市,永康市', 'Yongkang', '120.04727', '28.88844');
INSERT INTO `tb_region` VALUES ('330800', '衢州市', '330000', '衢州', '3', '0570', '324002', '中国,浙江省,衢州市', 'Quzhou', '118.87263', '28.941708');
INSERT INTO `tb_region` VALUES ('330802', '柯城区', '330800', '柯城', '4', '0570', '324100', '中国,浙江省,衢州市,柯城区', 'Kecheng', '118.87109', '28.96858');
INSERT INTO `tb_region` VALUES ('330803', '衢江区', '330800', '衢江', '4', '0570', '324022', '中国,浙江省,衢州市,衢江区', 'Qujiang', '118.9598', '28.97977');
INSERT INTO `tb_region` VALUES ('330822', '常山县', '330800', '常山', '4', '0570', '324200', '中国,浙江省,衢州市,常山县', 'Changshan', '118.51025', '28.90191');
INSERT INTO `tb_region` VALUES ('330824', '开化县', '330800', '开化', '4', '0570', '324300', '中国,浙江省,衢州市,开化县', 'Kaihua', '118.41616', '29.13785');
INSERT INTO `tb_region` VALUES ('330825', '龙游县', '330800', '龙游', '4', '0570', '324400', '中国,浙江省,衢州市,龙游县', 'Longyou', '119.17221', '29.02823');
INSERT INTO `tb_region` VALUES ('330881', '江山市', '330800', '江山', '4', '0570', '324100', '中国,浙江省,衢州市,江山市', 'Jiangshan', '118.62674', '28.7386');
INSERT INTO `tb_region` VALUES ('330900', '舟山市', '330000', '舟山', '3', '0580', '316000', '中国,浙江省,舟山市', 'Zhoushan', '122.106863', '30.016028');
INSERT INTO `tb_region` VALUES ('330902', '定海区', '330900', '定海', '4', '0580', '316000', '中国,浙江省,舟山市,定海区', 'Dinghai', '122.10677', '30.01985');
INSERT INTO `tb_region` VALUES ('330903', '普陀区', '330900', '普陀', '4', '0580', '316100', '中国,浙江省,舟山市,普陀区', 'Putuo', '122.30278', '29.94908');
INSERT INTO `tb_region` VALUES ('330921', '岱山县', '330900', '岱山', '4', '0580', '316200', '中国,浙江省,舟山市,岱山县', 'Daishan', '122.20486', '30.24385');
INSERT INTO `tb_region` VALUES ('330922', '嵊泗县', '330900', '嵊泗', '4', '0580', '202450', '中国,浙江省,舟山市,嵊泗县', 'Shengsi', '122.45129', '30.72678');
INSERT INTO `tb_region` VALUES ('331000', '台州市', '330000', '台州', '3', '0576', '318000', '中国,浙江省,台州市', 'Taizhou', '121.428599', '28.661378');
INSERT INTO `tb_region` VALUES ('331002', '椒江区', '331000', '椒江', '4', '0576', '318000', '中国,浙江省,台州市,椒江区', 'Jiaojiang', '121.44287', '28.67301');
INSERT INTO `tb_region` VALUES ('331003', '黄岩区', '331000', '黄岩', '4', '0576', '318020', '中国,浙江省,台州市,黄岩区', 'Huangyan', '121.25891', '28.65077');
INSERT INTO `tb_region` VALUES ('331004', '路桥区', '331000', '路桥', '4', '0576', '318050', '中国,浙江省,台州市,路桥区', 'Luqiao', '121.37381', '28.58016');
INSERT INTO `tb_region` VALUES ('331021', '玉环县', '331000', '玉环', '4', '0576', '317600', '中国,浙江省,台州市,玉环县', 'Yuhuan', '121.23242', '28.13637');
INSERT INTO `tb_region` VALUES ('331022', '三门县', '331000', '三门', '4', '0576', '317100', '中国,浙江省,台州市,三门县', 'Sanmen', '121.3937', '29.1051');
INSERT INTO `tb_region` VALUES ('331023', '天台县', '331000', '天台', '4', '0576', '317200', '中国,浙江省,台州市,天台县', 'Tiantai', '121.00848', '29.1429');
INSERT INTO `tb_region` VALUES ('331024', '仙居县', '331000', '仙居', '4', '0576', '317300', '中国,浙江省,台州市,仙居县', 'Xianju', '120.72872', '28.84672');
INSERT INTO `tb_region` VALUES ('331081', '温岭市', '331000', '温岭', '4', '0576', '317500', '中国,浙江省,台州市,温岭市', 'Wenling', '121.38595', '28.37176');
INSERT INTO `tb_region` VALUES ('331082', '临海市', '331000', '临海', '4', '0576', '317000', '中国,浙江省,台州市,临海市', 'Linhai', '121.13885', '28.85603');
INSERT INTO `tb_region` VALUES ('331100', '丽水市', '330000', '丽水', '3', '0578', '323000', '中国,浙江省,丽水市', 'Lishui', '119.921786', '28.451993');
INSERT INTO `tb_region` VALUES ('331102', '莲都区', '331100', '莲都', '4', '0578', '323000', '中国,浙江省,丽水市,莲都区', 'Liandu', '119.9127', '28.44583');
INSERT INTO `tb_region` VALUES ('331121', '青田县', '331100', '青田', '4', '0578', '323900', '中国,浙江省,丽水市,青田县', 'Qingtian', '120.29028', '28.13897');
INSERT INTO `tb_region` VALUES ('331122', '缙云县', '331100', '缙云', '4', '0578', '321400', '中国,浙江省,丽水市,缙云县', 'Jinyun', '120.09036', '28.65944');
INSERT INTO `tb_region` VALUES ('331123', '遂昌县', '331100', '遂昌', '4', '0578', '323300', '中国,浙江省,丽水市,遂昌县', 'Suichang', '119.27606', '28.59291');
INSERT INTO `tb_region` VALUES ('331124', '松阳县', '331100', '松阳', '4', '0578', '323400', '中国,浙江省,丽水市,松阳县', 'Songyang', '119.48199', '28.4494');
INSERT INTO `tb_region` VALUES ('331125', '云和县', '331100', '云和', '4', '0578', '323600', '中国,浙江省,丽水市,云和县', 'Yunhe', '119.57287', '28.11643');
INSERT INTO `tb_region` VALUES ('331126', '庆元县', '331100', '庆元', '4', '0578', '323800', '中国,浙江省,丽水市,庆元县', 'Qingyuan', '119.06256', '27.61842');
INSERT INTO `tb_region` VALUES ('331127', '景宁畲族自治县', '331100', '景宁', '4', '0578', '323500', '中国,浙江省,丽水市,景宁畲族自治县', 'Jingning', '119.63839', '27.97393');
INSERT INTO `tb_region` VALUES ('331181', '龙泉市', '331100', '龙泉', '4', '0578', '323700', '中国,浙江省,丽水市,龙泉市', 'Longquan', '119.14163', '28.0743');
INSERT INTO `tb_region` VALUES ('331200', '舟山群岛新区', '330000', '舟山新区', '3', '0580', '316000', '中国,浙江省,舟山群岛新区', 'Zhoushan', '122.317657', '29.813242');
INSERT INTO `tb_region` VALUES ('331201', '金塘岛', '331200', '金塘', '4', '0580', '316000', '中国,浙江省,舟山群岛新区,金塘岛', 'Jintang', '121.893373', '30.040641');
INSERT INTO `tb_region` VALUES ('331202', '六横岛', '331200', '六横', '4', '0580', '316000', '中国,浙江省,舟山群岛新区,六横岛', 'Liuheng', '122.14265', '29.662938');
INSERT INTO `tb_region` VALUES ('331203', '衢山岛', '331200', '衢山', '4', '0580', '316000', '中国,浙江省,舟山群岛新区,衢山岛', 'Qushan', '122.358425', '30.442642');
INSERT INTO `tb_region` VALUES ('331204', '舟山本岛西北部', '331200', '舟山', '4', '0580', '316000', '中国,浙江省,舟山群岛新区,舟山本岛西北部', 'Zhoushan', '122.03064', '30.140377');
INSERT INTO `tb_region` VALUES ('331205', '岱山岛西南部', '331200', '岱山', '4', '0580', '316000', '中国,浙江省,舟山群岛新区,岱山岛西南部', 'Daishan', '122.180123', '30.277269');
INSERT INTO `tb_region` VALUES ('331206', '泗礁岛', '331200', '泗礁', '4', '0580', '316000', '中国,浙江省,舟山群岛新区,泗礁岛', 'Sijiao', '122.45803', '30.725112');
INSERT INTO `tb_region` VALUES ('331207', '朱家尖岛', '331200', '朱家尖', '4', '0580', '316000', '中国,浙江省,舟山群岛新区,朱家尖岛', 'Zhujiajian', '122.390636', '29.916303');
INSERT INTO `tb_region` VALUES ('331208', '洋山岛', '331200', '洋山', '4', '0580', '316000', '中国,浙江省,舟山群岛新区,洋山岛', 'Yangshan', '121.995891', '30.094637');
INSERT INTO `tb_region` VALUES ('331209', '长涂岛', '331200', '长涂', '4', '0580', '316000', '中国,浙江省,舟山群岛新区,长涂岛', 'Changtu', '122.284681', '30.24888');
INSERT INTO `tb_region` VALUES ('331210', '虾峙岛', '331200', '虾峙', '4', '0580', '316000', '中国,浙江省,舟山群岛新区,虾峙岛', 'Xiazhi', '122.244686', '29.752941');
INSERT INTO `tb_region` VALUES ('340000', '安徽省', '100001', '安徽', '2', '', '', '中国,安徽省', 'Anhui', '117.283042', '31.86119');
INSERT INTO `tb_region` VALUES ('340100', '合肥市', '340000', '合肥', '3', '0551', '230001', '中国,安徽省,合肥市', 'Hefei', '117.283042', '31.86119');
INSERT INTO `tb_region` VALUES ('340102', '瑶海区', '340100', '瑶海', '4', '0551', '230011', '中国,安徽省,合肥市,瑶海区', 'Yaohai', '117.30947', '31.85809');
INSERT INTO `tb_region` VALUES ('340103', '庐阳区', '340100', '庐阳', '4', '0551', '230001', '中国,安徽省,合肥市,庐阳区', 'Luyang', '117.26452', '31.87874');
INSERT INTO `tb_region` VALUES ('340104', '蜀山区', '340100', '蜀山', '4', '0551', '230031', '中国,安徽省,合肥市,蜀山区', 'Shushan', '117.26104', '31.85117');
INSERT INTO `tb_region` VALUES ('340111', '包河区', '340100', '包河', '4', '0551', '230041', '中国,安徽省,合肥市,包河区', 'Baohe', '117.30984', '31.79502');
INSERT INTO `tb_region` VALUES ('340121', '长丰县', '340100', '长丰', '4', '0551', '231100', '中国,安徽省,合肥市,长丰县', 'Changfeng', '117.16549', '32.47959');
INSERT INTO `tb_region` VALUES ('340122', '肥东县', '340100', '肥东', '4', '0551', '231600', '中国,安徽省,合肥市,肥东县', 'Feidong', '117.47128', '31.88525');
INSERT INTO `tb_region` VALUES ('340123', '肥西县', '340100', '肥西', '4', '0551', '231200', '中国,安徽省,合肥市,肥西县', 'Feixi', '117.16845', '31.72143');
INSERT INTO `tb_region` VALUES ('340124', '庐江县', '340100', '庐江', '4', '0565', '231500', '中国,安徽省,合肥市,庐江县', 'Lujiang', '117.289844', '31.251488');
INSERT INTO `tb_region` VALUES ('340181', '巢湖市', '340100', '巢湖', '4', '0565', '238000', '中国,安徽省,合肥市,巢湖市', 'Chaohu', '117.874155', '31.600518');
INSERT INTO `tb_region` VALUES ('340200', '芜湖市', '340000', '芜湖', '3', '0551', '241000', '中国,安徽省,芜湖市', 'Wuhu', '118.376451', '31.326319');
INSERT INTO `tb_region` VALUES ('340202', '镜湖区', '340200', '镜湖', '4', '0553', '241000', '中国,安徽省,芜湖市,镜湖区', 'Jinghu', '118.38525', '31.34038');
INSERT INTO `tb_region` VALUES ('340203', '弋江区', '340200', '弋江', '4', '0553', '241000', '中国,安徽省,芜湖市,弋江区', 'Yijiang', '118.37265', '31.31178');
INSERT INTO `tb_region` VALUES ('340207', '鸠江区', '340200', '鸠江', '4', '0553', '241000', '中国,安徽省,芜湖市,鸠江区', 'Jiujiang', '118.39215', '31.36928');
INSERT INTO `tb_region` VALUES ('340208', '三山区', '340200', '三山', '4', '0553', '241000', '中国,安徽省,芜湖市,三山区', 'Sanshan', '118.22509', '31.20703');
INSERT INTO `tb_region` VALUES ('340221', '芜湖县', '340200', '芜湖', '4', '0553', '241100', '中国,安徽省,芜湖市,芜湖县', 'Wuhu', '118.57525', '31.13476');
INSERT INTO `tb_region` VALUES ('340222', '繁昌县', '340200', '繁昌', '4', '0553', '241200', '中国,安徽省,芜湖市,繁昌县', 'Fanchang', '118.19982', '31.08319');
INSERT INTO `tb_region` VALUES ('340223', '南陵县', '340200', '南陵', '4', '0553', '242400', '中国,安徽省,芜湖市,南陵县', 'Nanling', '118.33688', '30.91969');
INSERT INTO `tb_region` VALUES ('340225', '无为县', '340200', '无为', '4', '0565', '238300', '中国,安徽省,芜湖市,无为县', 'Wuwei', '117.911432', '31.303075');
INSERT INTO `tb_region` VALUES ('340300', '蚌埠市', '340000', '蚌埠', '3', '0552', '233000', '中国,安徽省,蚌埠市', 'Bengbu', '117.36237', '32.934037');
INSERT INTO `tb_region` VALUES ('340302', '龙子湖区', '340300', '龙子湖', '4', '0552', '233000', '中国,安徽省,蚌埠市,龙子湖区', 'Longzihu', '117.39379', '32.94301');
INSERT INTO `tb_region` VALUES ('340303', '蚌山区', '340300', '蚌山', '4', '0552', '233000', '中国,安徽省,蚌埠市,蚌山区', 'Bengshan', '117.36767', '32.94411');
INSERT INTO `tb_region` VALUES ('340304', '禹会区', '340300', '禹会', '4', '0552', '233010', '中国,安徽省,蚌埠市,禹会区', 'Yuhui', '117.35315', '32.93336');
INSERT INTO `tb_region` VALUES ('340311', '淮上区', '340300', '淮上', '4', '0552', '233002', '中国,安徽省,蚌埠市,淮上区', 'Huaishang', '117.35983', '32.96423');
INSERT INTO `tb_region` VALUES ('340321', '怀远县', '340300', '怀远', '4', '0552', '233400', '中国,安徽省,蚌埠市,怀远县', 'Huaiyuan', '117.20507', '32.97007');
INSERT INTO `tb_region` VALUES ('340322', '五河县', '340300', '五河', '4', '0552', '233300', '中国,安徽省,蚌埠市,五河县', 'Wuhe', '117.89144', '33.14457');
INSERT INTO `tb_region` VALUES ('340323', '固镇县', '340300', '固镇', '4', '0552', '233700', '中国,安徽省,蚌埠市,固镇县', 'Guzhen', '117.31558', '33.31803');
INSERT INTO `tb_region` VALUES ('340400', '淮南市', '340000', '淮南', '3', '0554', '232001', '中国,安徽省,淮南市', 'Huainan', '117.025449', '32.645947');
INSERT INTO `tb_region` VALUES ('340402', '大通区', '340400', '大通', '4', '0554', '232033', '中国,安徽省,淮南市,大通区', 'Datong', '117.05255', '32.63265');
INSERT INTO `tb_region` VALUES ('340403', '田家庵区', '340400', '田家庵', '4', '0554', '232000', '中国,安徽省,淮南市,田家庵区', 'Tianjiaan', '117.01739', '32.64697');
INSERT INTO `tb_region` VALUES ('340404', '谢家集区', '340400', '谢家集', '4', '0554', '232052', '中国,安徽省,淮南市,谢家集区', 'Xiejiaji', '116.86377', '32.59818');
INSERT INTO `tb_region` VALUES ('340405', '八公山区', '340400', '八公山', '4', '0554', '232072', '中国,安徽省,淮南市,八公山区', 'Bagongshan', '116.83694', '32.62941');
INSERT INTO `tb_region` VALUES ('340406', '潘集区', '340400', '潘集', '4', '0554', '232082', '中国,安徽省,淮南市,潘集区', 'Panji', '116.81622', '32.78287');
INSERT INTO `tb_region` VALUES ('340421', '凤台县', '340400', '凤台', '4', '0554', '232100', '中国,安徽省,淮南市,凤台县', 'Fengtai', '116.71569', '32.70752');
INSERT INTO `tb_region` VALUES ('340500', '马鞍山市', '340000', '马鞍山', '3', '0555', '243001', '中国,安徽省,马鞍山市', 'Ma\'anshan', '118.507906', '31.689362');
INSERT INTO `tb_region` VALUES ('340503', '花山区', '340500', '花山', '4', '0555', '243000', '中国,安徽省,马鞍山市,花山区', 'Huashan', '118.51231', '31.7001');
INSERT INTO `tb_region` VALUES ('340504', '雨山区', '340500', '雨山', '4', '0555', '243071', '中国,安徽省,马鞍山市,雨山区', 'Yushan', '118.49869', '31.68219');
INSERT INTO `tb_region` VALUES ('340506', '博望区', '340500', '博望', '4', '0555', '243131', '中国,安徽省,马鞍山市,博望区', 'Bowang', '118.844387', '31.561871');
INSERT INTO `tb_region` VALUES ('340521', '当涂县', '340500', '当涂', '4', '0555', '243100', '中国,安徽省,马鞍山市,当涂县', 'Dangtu', '118.49786', '31.57098');
INSERT INTO `tb_region` VALUES ('340522', '含山县', '340500', '含山', '4', '0555', '238100', '中国,安徽省,马鞍山市,含山县', 'Hanshan ', '118.105545', '31.727758');
INSERT INTO `tb_region` VALUES ('340523', '和县', '340500', '和县', '4', '0555', '238200', '中国,安徽省,马鞍山市,和县', 'Hexian', '118.351405', '31.741794');
INSERT INTO `tb_region` VALUES ('340600', '淮北市', '340000', '淮北', '3', '0561', '235000', '中国,安徽省,淮北市', 'Huaibei', '116.794664', '33.971707');
INSERT INTO `tb_region` VALUES ('340602', '杜集区', '340600', '杜集', '4', '0561', '235000', '中国,安徽省,淮北市,杜集区', 'Duji', '116.82998', '33.99363');
INSERT INTO `tb_region` VALUES ('340603', '相山区', '340600', '相山', '4', '0561', '235000', '中国,安徽省,淮北市,相山区', 'Xiangshan', '116.79464', '33.95979');
INSERT INTO `tb_region` VALUES ('340604', '烈山区', '340600', '烈山', '4', '0561', '235000', '中国,安徽省,淮北市,烈山区', 'Lieshan', '116.81448', '33.89355');
INSERT INTO `tb_region` VALUES ('340621', '濉溪县', '340600', '濉溪', '4', '0561', '235100', '中国,安徽省,淮北市,濉溪县', 'Suixi', '116.76785', '33.91455');
INSERT INTO `tb_region` VALUES ('340700', '铜陵市', '340000', '铜陵', '3', '0562', '244000', '中国,安徽省,铜陵市', 'Tongling', '117.816576', '30.929935');
INSERT INTO `tb_region` VALUES ('340702', '铜官山区', '340700', '铜官山', '4', '0562', '244000', '中国,安徽省,铜陵市,铜官山区', 'Tongguanshan', '117.81525', '30.93423');
INSERT INTO `tb_region` VALUES ('340703', '狮子山区', '340700', '狮子山', '4', '0562', '244000', '中国,安徽省,铜陵市,狮子山区', 'Shizishan', '117.89178', '30.92631');
INSERT INTO `tb_region` VALUES ('340711', '郊区', '340700', '郊区', '4', '0562', '244000', '中国,安徽省,铜陵市,郊区', 'Jiaoqu', '117.80868', '30.91976');
INSERT INTO `tb_region` VALUES ('340721', '铜陵县', '340700', '铜陵', '4', '0562', '244100', '中国,安徽省,铜陵市,铜陵县', 'Tongling', '117.79113', '30.95365');
INSERT INTO `tb_region` VALUES ('340800', '安庆市', '340000', '安庆', '3', '0556', '246001', '中国,安徽省,安庆市', 'Anqing', '117.053571', '30.524816');
INSERT INTO `tb_region` VALUES ('340802', '迎江区', '340800', '迎江', '4', '0556', '246001', '中国,安徽省,安庆市,迎江区', 'Yingjiang', '117.0493', '30.50421');
INSERT INTO `tb_region` VALUES ('340803', '大观区', '340800', '大观', '4', '0556', '246002', '中国,安徽省,安庆市,大观区', 'Daguan', '117.03426', '30.51216');
INSERT INTO `tb_region` VALUES ('340811', '宜秀区', '340800', '宜秀', '4', '0556', '246003', '中国,安徽省,安庆市,宜秀区', 'Yixiu', '117.06127', '30.50783');
INSERT INTO `tb_region` VALUES ('340822', '怀宁县', '340800', '怀宁', '4', '0556', '246100', '中国,安徽省,安庆市,怀宁县', 'Huaining', '116.82968', '30.73376');
INSERT INTO `tb_region` VALUES ('340823', '枞阳县', '340800', '枞阳', '4', '0556', '246700', '中国,安徽省,安庆市,枞阳县', 'Zongyang', '117.22015', '30.69956');
INSERT INTO `tb_region` VALUES ('340824', '潜山县', '340800', '潜山', '4', '0556', '246300', '中国,安徽省,安庆市,潜山县', 'Qianshan', '116.57574', '30.63037');
INSERT INTO `tb_region` VALUES ('340825', '太湖县', '340800', '太湖', '4', '0556', '246400', '中国,安徽省,安庆市,太湖县', 'Taihu', '116.3088', '30.4541');
INSERT INTO `tb_region` VALUES ('340826', '宿松县', '340800', '宿松', '4', '0556', '246500', '中国,安徽省,安庆市,宿松县', 'Susong', '116.12915', '30.1536');
INSERT INTO `tb_region` VALUES ('340827', '望江县', '340800', '望江', '4', '0556', '246200', '中国,安徽省,安庆市,望江县', 'Wangjiang', '116.68814', '30.12585');
INSERT INTO `tb_region` VALUES ('340828', '岳西县', '340800', '岳西', '4', '0556', '246600', '中国,安徽省,安庆市,岳西县', 'Yuexi', '116.35995', '30.84983');
INSERT INTO `tb_region` VALUES ('340881', '桐城市', '340800', '桐城', '4', '0556', '231400', '中国,安徽省,安庆市,桐城市', 'Tongcheng', '116.95071', '31.05216');
INSERT INTO `tb_region` VALUES ('341000', '黄山市', '340000', '黄山', '3', '0559', '245000', '中国,安徽省,黄山市', 'Huangshan', '118.317325', '29.709239');
INSERT INTO `tb_region` VALUES ('341002', '屯溪区', '341000', '屯溪', '4', '0559', '245000', '中国,安徽省,黄山市,屯溪区', 'Tunxi', '118.33368', '29.71138');
INSERT INTO `tb_region` VALUES ('341003', '黄山区', '341000', '黄山', '4', '0559', '242700', '中国,安徽省,黄山市,黄山区', 'Huangshan', '118.1416', '30.2729');
INSERT INTO `tb_region` VALUES ('341004', '徽州区', '341000', '徽州', '4', '0559', '245061', '中国,安徽省,黄山市,徽州区', 'Huizhou', '118.33654', '29.82784');
INSERT INTO `tb_region` VALUES ('341021', '歙县', '341000', '歙县', '4', '0559', '245200', '中国,安徽省,黄山市,歙县', 'Shexian', '118.43676', '29.86745');
INSERT INTO `tb_region` VALUES ('341022', '休宁县', '341000', '休宁', '4', '0559', '245400', '中国,安徽省,黄山市,休宁县', 'Xiuning', '118.18136', '29.78607');
INSERT INTO `tb_region` VALUES ('341023', '黟县', '341000', '黟县', '4', '0559', '245500', '中国,安徽省,黄山市,黟县', 'Yixian', '117.94137', '29.92588');
INSERT INTO `tb_region` VALUES ('341024', '祁门县', '341000', '祁门', '4', '0559', '245600', '中国,安徽省,黄山市,祁门县', 'Qimen', '117.71847', '29.85723');
INSERT INTO `tb_region` VALUES ('341100', '滁州市', '340000', '滁州', '3', '0550', '239000', '中国,安徽省,滁州市', 'Chuzhou', '118.316264', '32.303627');
INSERT INTO `tb_region` VALUES ('341102', '琅琊区', '341100', '琅琊', '4', '0550', '239000', '中国,安徽省,滁州市,琅琊区', 'Langya', '118.30538', '32.29521');
INSERT INTO `tb_region` VALUES ('341103', '南谯区', '341100', '南谯', '4', '0550', '239000', '中国,安徽省,滁州市,南谯区', 'Nanqiao', '118.31222', '32.31861');
INSERT INTO `tb_region` VALUES ('341122', '来安县', '341100', '来安', '4', '0550', '239200', '中国,安徽省,滁州市,来安县', 'Lai\'an', '118.43438', '32.45176');
INSERT INTO `tb_region` VALUES ('341124', '全椒县', '341100', '全椒', '4', '0550', '239500', '中国,安徽省,滁州市,全椒县', 'Quanjiao', '118.27291', '32.08524');
INSERT INTO `tb_region` VALUES ('341125', '定远县', '341100', '定远', '4', '0550', '233200', '中国,安徽省,滁州市,定远县', 'Dingyuan', '117.68035', '32.52488');
INSERT INTO `tb_region` VALUES ('341126', '凤阳县', '341100', '凤阳', '4', '0550', '233100', '中国,安徽省,滁州市,凤阳县', 'Fengyang', '117.56454', '32.86507');
INSERT INTO `tb_region` VALUES ('341181', '天长市', '341100', '天长', '4', '0550', '239300', '中国,安徽省,滁州市,天长市', 'Tianchang', '118.99868', '32.69124');
INSERT INTO `tb_region` VALUES ('341182', '明光市', '341100', '明光', '4', '0550', '239400', '中国,安徽省,滁州市,明光市', 'Mingguang', '117.99093', '32.77819');
INSERT INTO `tb_region` VALUES ('341200', '阜阳市', '340000', '阜阳', '3', '0558', '236033', '中国,安徽省,阜阳市', 'Fuyang', '115.819729', '32.896969');
INSERT INTO `tb_region` VALUES ('341202', '颍州区', '341200', '颍州', '4', '0558', '236001', '中国,安徽省,阜阳市,颍州区', 'Yingzhou', '115.80694', '32.88346');
INSERT INTO `tb_region` VALUES ('341203', '颍东区', '341200', '颍东', '4', '0558', '236058', '中国,安徽省,阜阳市,颍东区', 'Yingdong', '115.85659', '32.91296');
INSERT INTO `tb_region` VALUES ('341204', '颍泉区', '341200', '颍泉', '4', '0558', '236045', '中国,安徽省,阜阳市,颍泉区', 'Yingquan', '115.80712', '32.9249');
INSERT INTO `tb_region` VALUES ('341221', '临泉县', '341200', '临泉', '4', '0558', '236400', '中国,安徽省,阜阳市,临泉县', 'Linquan', '115.26232', '33.06758');
INSERT INTO `tb_region` VALUES ('341222', '太和县', '341200', '太和', '4', '0558', '236600', '中国,安徽省,阜阳市,太和县', 'Taihe', '115.62191', '33.16025');
INSERT INTO `tb_region` VALUES ('341225', '阜南县', '341200', '阜南', '4', '0558', '236300', '中国,安徽省,阜阳市,阜南县', 'Funan', '115.58563', '32.63551');
INSERT INTO `tb_region` VALUES ('341226', '颍上县', '341200', '颍上', '4', '0558', '236200', '中国,安徽省,阜阳市,颍上县', 'Yingshang', '116.26458', '32.62998');
INSERT INTO `tb_region` VALUES ('341282', '界首市', '341200', '界首', '4', '0558', '236500', '中国,安徽省,阜阳市,界首市', 'Jieshou', '115.37445', '33.25714');
INSERT INTO `tb_region` VALUES ('341300', '宿州市', '340000', '宿州', '3', '0557', '234000', '中国,安徽省,宿州市', 'Suzhou', '116.984084', '33.633891');
INSERT INTO `tb_region` VALUES ('341302', '埇桥区', '341300', '埇桥', '4', '0557', '234000', '中国,安徽省,宿州市,埇桥区', 'Yongqiao', '116.97731', '33.64058');
INSERT INTO `tb_region` VALUES ('341321', '砀山县', '341300', '砀山', '4', '0557', '235300', '中国,安徽省,宿州市,砀山县', 'Dangshan', '116.35363', '34.42356');
INSERT INTO `tb_region` VALUES ('341322', '萧县', '341300', '萧县', '4', '0557', '235200', '中国,安徽省,宿州市,萧县', 'Xiaoxian', '116.94546', '34.1879');
INSERT INTO `tb_region` VALUES ('341323', '灵璧县', '341300', '灵璧', '4', '0557', '234200', '中国,安徽省,宿州市,灵璧县', 'Lingbi', '117.55813', '33.54339');
INSERT INTO `tb_region` VALUES ('341324', '泗县', '341300', '泗县', '4', '0557', '234300', '中国,安徽省,宿州市,泗县', 'Sixian', '117.91033', '33.48295');
INSERT INTO `tb_region` VALUES ('341500', '六安市', '340000', '六安', '3', '0564', '237000', '中国,安徽省,六安市', 'Lu\'an', '116.507676', '31.752889');
INSERT INTO `tb_region` VALUES ('341502', '金安区', '341500', '金安', '4', '0564', '237005', '中国,安徽省,六安市,金安区', 'Jin\'an', '116.50912', '31.75573');
INSERT INTO `tb_region` VALUES ('341503', '裕安区', '341500', '裕安', '4', '0564', '237010', '中国,安徽省,六安市,裕安区', 'Yu\'an', '116.47985', '31.73787');
INSERT INTO `tb_region` VALUES ('341521', '寿县', '341500', '寿县', '4', '0564', '232200', '中国,安徽省,六安市,寿县', 'Shouxian', '116.78466', '32.57653');
INSERT INTO `tb_region` VALUES ('341522', '霍邱县', '341500', '霍邱', '4', '0564', '237400', '中国,安徽省,六安市,霍邱县', 'Huoqiu', '116.27795', '32.353');
INSERT INTO `tb_region` VALUES ('341523', '舒城县', '341500', '舒城', '4', '0564', '231300', '中国,安徽省,六安市,舒城县', 'Shucheng', '116.94491', '31.46413');
INSERT INTO `tb_region` VALUES ('341524', '金寨县', '341500', '金寨', '4', '0564', '237300', '中国,安徽省,六安市,金寨县', 'Jinzhai', '115.93463', '31.7351');
INSERT INTO `tb_region` VALUES ('341525', '霍山县', '341500', '霍山', '4', '0564', '237200', '中国,安徽省,六安市,霍山县', 'Huoshan', '116.33291', '31.3929');
INSERT INTO `tb_region` VALUES ('341600', '亳州市', '340000', '亳州', '3', '0558', '236802', '中国,安徽省,亳州市', 'Bozhou', '115.782939', '33.869338');
INSERT INTO `tb_region` VALUES ('341602', '谯城区', '341600', '谯城', '4', '0558', '236800', '中国,安徽省,亳州市,谯城区', 'Qiaocheng', '115.77941', '33.87532');
INSERT INTO `tb_region` VALUES ('341621', '涡阳县', '341600', '涡阳', '4', '0558', '233600', '中国,安徽省,亳州市,涡阳县', 'Guoyang', '116.21682', '33.50911');
INSERT INTO `tb_region` VALUES ('341622', '蒙城县', '341600', '蒙城', '4', '0558', '233500', '中国,安徽省,亳州市,蒙城县', 'Mengcheng', '116.5646', '33.26477');
INSERT INTO `tb_region` VALUES ('341623', '利辛县', '341600', '利辛', '4', '0558', '236700', '中国,安徽省,亳州市,利辛县', 'Lixin', '116.208', '33.14198');
INSERT INTO `tb_region` VALUES ('341700', '池州市', '340000', '池州', '3', '0566', '247100', '中国,安徽省,池州市', 'Chizhou', '117.489157', '30.656037');
INSERT INTO `tb_region` VALUES ('341702', '贵池区', '341700', '贵池', '4', '0566', '247100', '中国,安徽省,池州市,贵池区', 'Guichi', '117.48722', '30.65283');
INSERT INTO `tb_region` VALUES ('341721', '东至县', '341700', '东至', '4', '0566', '247200', '中国,安徽省,池州市,东至县', 'Dongzhi', '117.02719', '30.0969');
INSERT INTO `tb_region` VALUES ('341722', '石台县', '341700', '石台', '4', '0566', '245100', '中国,安徽省,池州市,石台县', 'Shitai', '117.48666', '30.21042');
INSERT INTO `tb_region` VALUES ('341723', '青阳县', '341700', '青阳', '4', '0566', '242800', '中国,安徽省,池州市,青阳县', 'Qingyang', '117.84744', '30.63932');
INSERT INTO `tb_region` VALUES ('341800', '宣城市', '340000', '宣城', '3', '0563', '242000', '中国,安徽省,宣城市', 'Xuancheng', '118.757995', '30.945667');
INSERT INTO `tb_region` VALUES ('341802', '宣州区', '341800', '宣州', '4', '0563', '242000', '中国,安徽省,宣城市,宣州区', 'Xuanzhou', '118.75462', '30.94439');
INSERT INTO `tb_region` VALUES ('341821', '郎溪县', '341800', '郎溪', '4', '0563', '242100', '中国,安徽省,宣城市,郎溪县', 'Langxi', '119.17923', '31.12599');
INSERT INTO `tb_region` VALUES ('341822', '广德县', '341800', '广德', '4', '0563', '242200', '中国,安徽省,宣城市,广德县', 'Guangde', '119.41769', '30.89371');
INSERT INTO `tb_region` VALUES ('341823', '泾县', '341800', '泾县', '4', '0563', '242500', '中国,安徽省,宣城市,泾县', 'Jingxian', '118.41964', '30.69498');
INSERT INTO `tb_region` VALUES ('341824', '绩溪县', '341800', '绩溪', '4', '0563', '245300', '中国,安徽省,宣城市,绩溪县', 'Jixi', '118.59765', '30.07069');
INSERT INTO `tb_region` VALUES ('341825', '旌德县', '341800', '旌德', '4', '0563', '242600', '中国,安徽省,宣城市,旌德县', 'Jingde', '118.54299', '30.28898');
INSERT INTO `tb_region` VALUES ('341881', '宁国市', '341800', '宁国', '4', '0563', '242300', '中国,安徽省,宣城市,宁国市', 'Ningguo', '118.98349', '30.6238');
INSERT INTO `tb_region` VALUES ('350000', '福建省', '100001', '福建', '2', '', '', '中国,福建省', 'Fujian', '119.306239', '26.075302');
INSERT INTO `tb_region` VALUES ('350100', '福州市', '350000', '福州', '3', '0591', '350001', '中国,福建省,福州市', 'Fuzhou', '119.306239', '26.075302');
INSERT INTO `tb_region` VALUES ('350102', '鼓楼区', '350100', '鼓楼', '4', '0591', '350001', '中国,福建省,福州市,鼓楼区', 'Gulou', '119.30384', '26.08225');
INSERT INTO `tb_region` VALUES ('350103', '台江区', '350100', '台江', '4', '0591', '350004', '中国,福建省,福州市,台江区', 'Taijiang', '119.30899', '26.06204');
INSERT INTO `tb_region` VALUES ('350104', '仓山区', '350100', '仓山', '4', '0591', '350007', '中国,福建省,福州市,仓山区', 'Cangshan', '119.31543', '26.04335');
INSERT INTO `tb_region` VALUES ('350105', '马尾区', '350100', '马尾', '4', '0591', '350015', '中国,福建省,福州市,马尾区', 'Mawei', '119.4555', '25.98942');
INSERT INTO `tb_region` VALUES ('350111', '晋安区', '350100', '晋安', '4', '0591', '350011', '中国,福建省,福州市,晋安区', 'Jin\'an', '119.32828', '26.0818');
INSERT INTO `tb_region` VALUES ('350121', '闽侯县', '350100', '闽侯', '4', '0591', '350100', '中国,福建省,福州市,闽侯县', 'Minhou', '119.13388', '26.15014');
INSERT INTO `tb_region` VALUES ('350122', '连江县', '350100', '连江', '4', '0591', '350500', '中国,福建省,福州市,连江县', 'Lianjiang', '119.53433', '26.19466');
INSERT INTO `tb_region` VALUES ('350123', '罗源县', '350100', '罗源', '4', '0591', '350600', '中国,福建省,福州市,罗源县', 'Luoyuan', '119.5509', '26.48752');
INSERT INTO `tb_region` VALUES ('350124', '闽清县', '350100', '闽清', '4', '0591', '350800', '中国,福建省,福州市,闽清县', 'Minqing', '118.8623', '26.21901');
INSERT INTO `tb_region` VALUES ('350125', '永泰县', '350100', '永泰', '4', '0591', '350700', '中国,福建省,福州市,永泰县', 'Yongtai', '118.936', '25.86816');
INSERT INTO `tb_region` VALUES ('350128', '平潭县', '350100', '平潭', '4', '0591', '350400', '中国,福建省,福州市,平潭县', 'Pingtan', '119.791197', '25.503672');
INSERT INTO `tb_region` VALUES ('350181', '福清市', '350100', '福清', '4', '0591', '350300', '中国,福建省,福州市,福清市', 'Fuqing', '119.38507', '25.72086');
INSERT INTO `tb_region` VALUES ('350182', '长乐市', '350100', '长乐', '4', '0591', '350200', '中国,福建省,福州市,长乐市', 'Changle', '119.52313', '25.96276');
INSERT INTO `tb_region` VALUES ('350200', '厦门市', '350000', '厦门', '3', '0592', '361003', '中国,福建省,厦门市', 'Xiamen', '118.11022', '24.490474');
INSERT INTO `tb_region` VALUES ('350203', '思明区', '350200', '思明', '4', '0592', '361001', '中国,福建省,厦门市,思明区', 'Siming', '118.08233', '24.44543');
INSERT INTO `tb_region` VALUES ('350205', '海沧区', '350200', '海沧', '4', '0592', '361026', '中国,福建省,厦门市,海沧区', 'Haicang', '118.03289', '24.48461');
INSERT INTO `tb_region` VALUES ('350206', '湖里区', '350200', '湖里', '4', '0592', '361006', '中国,福建省,厦门市,湖里区', 'Huli', '118.14621', '24.51253');
INSERT INTO `tb_region` VALUES ('350211', '集美区', '350200', '集美', '4', '0592', '361021', '中国,福建省,厦门市,集美区', 'Jimei', '118.09719', '24.57584');
INSERT INTO `tb_region` VALUES ('350212', '同安区', '350200', '同安', '4', '0592', '361100', '中国,福建省,厦门市,同安区', 'Tong\'an', '118.15197', '24.72308');
INSERT INTO `tb_region` VALUES ('350213', '翔安区', '350200', '翔安', '4', '0592', '361101', '中国,福建省,厦门市,翔安区', 'Xiang\'an', '118.24783', '24.61863');
INSERT INTO `tb_region` VALUES ('350300', '莆田市', '350000', '莆田', '3', '0594', '351100', '中国,福建省,莆田市', 'Putian', '119.007558', '25.431011');
INSERT INTO `tb_region` VALUES ('350302', '城厢区', '350300', '城厢', '4', '0594', '351100', '中国,福建省,莆田市,城厢区', 'Chengxiang', '118.99462', '25.41872');
INSERT INTO `tb_region` VALUES ('350303', '涵江区', '350300', '涵江', '4', '0594', '351111', '中国,福建省,莆田市,涵江区', 'Hanjiang', '119.11621', '25.45876');
INSERT INTO `tb_region` VALUES ('350304', '荔城区', '350300', '荔城', '4', '0594', '351100', '中国,福建省,莆田市,荔城区', 'Licheng', '119.01339', '25.43369');
INSERT INTO `tb_region` VALUES ('350305', '秀屿区', '350300', '秀屿', '4', '0594', '351152', '中国,福建省,莆田市,秀屿区', 'Xiuyu', '119.10553', '25.31831');
INSERT INTO `tb_region` VALUES ('350322', '仙游县', '350300', '仙游', '4', '0594', '351200', '中国,福建省,莆田市,仙游县', 'Xianyou', '118.69177', '25.36214');
INSERT INTO `tb_region` VALUES ('350400', '三明市', '350000', '三明', '3', '0598', '365000', '中国,福建省,三明市', 'Sanming', '117.635001', '26.265444');
INSERT INTO `tb_region` VALUES ('350402', '梅列区', '350400', '梅列', '4', '0598', '365000', '中国,福建省,三明市,梅列区', 'Meilie', '117.64585', '26.27171');
INSERT INTO `tb_region` VALUES ('350403', '三元区', '350400', '三元', '4', '0598', '365001', '中国,福建省,三明市,三元区', 'Sanyuan', '117.60788', '26.23372');
INSERT INTO `tb_region` VALUES ('350421', '明溪县', '350400', '明溪', '4', '0598', '365200', '中国,福建省,三明市,明溪县', 'Mingxi', '117.20498', '26.35294');
INSERT INTO `tb_region` VALUES ('350423', '清流县', '350400', '清流', '4', '0598', '365300', '中国,福建省,三明市,清流县', 'Qingliu', '116.8146', '26.17144');
INSERT INTO `tb_region` VALUES ('350424', '宁化县', '350400', '宁化', '4', '0598', '365400', '中国,福建省,三明市,宁化县', 'Ninghua', '116.66101', '26.25874');
INSERT INTO `tb_region` VALUES ('350425', '大田县', '350400', '大田', '4', '0598', '366100', '中国,福建省,三明市,大田县', 'Datian', '117.8471', '25.6926');
INSERT INTO `tb_region` VALUES ('350426', '尤溪县', '350400', '尤溪', '4', '0598', '365100', '中国,福建省,三明市,尤溪县', 'Youxi', '118.19049', '26.17002');
INSERT INTO `tb_region` VALUES ('350427', '沙县', '350400', '沙县', '4', '0598', '365500', '中国,福建省,三明市,沙县', 'Shaxian', '117.79266', '26.39615');
INSERT INTO `tb_region` VALUES ('350428', '将乐县', '350400', '将乐', '4', '0598', '353300', '中国,福建省,三明市,将乐县', 'Jiangle', '117.47317', '26.72837');
INSERT INTO `tb_region` VALUES ('350429', '泰宁县', '350400', '泰宁', '4', '0598', '354400', '中国,福建省,三明市,泰宁县', 'Taining', '117.17578', '26.9001');
INSERT INTO `tb_region` VALUES ('350430', '建宁县', '350400', '建宁', '4', '0598', '354500', '中国,福建省,三明市,建宁县', 'Jianning', '116.84603', '26.83091');
INSERT INTO `tb_region` VALUES ('350481', '永安市', '350400', '永安', '4', '0598', '366000', '中国,福建省,三明市,永安市', 'Yong\'an', '117.36517', '25.94136');
INSERT INTO `tb_region` VALUES ('350500', '泉州市', '350000', '泉州', '3', '0595', '362000', '中国,福建省,泉州市', 'Quanzhou', '118.589421', '24.908853');
INSERT INTO `tb_region` VALUES ('350502', '鲤城区', '350500', '鲤城', '4', '0595', '362000', '中国,福建省,泉州市,鲤城区', 'Licheng', '118.56591', '24.88741');
INSERT INTO `tb_region` VALUES ('350503', '丰泽区', '350500', '丰泽', '4', '0595', '362000', '中国,福建省,泉州市,丰泽区', 'Fengze', '118.61328', '24.89119');
INSERT INTO `tb_region` VALUES ('350504', '洛江区', '350500', '洛江', '4', '0595', '362011', '中国,福建省,泉州市,洛江区', 'Luojiang', '118.67111', '24.93984');
INSERT INTO `tb_region` VALUES ('350505', '泉港区', '350500', '泉港', '4', '0595', '362114', '中国,福建省,泉州市,泉港区', 'Quangang', '118.91586', '25.12005');
INSERT INTO `tb_region` VALUES ('350521', '惠安县', '350500', '惠安', '4', '0595', '362100', '中国,福建省,泉州市,惠安县', 'Hui\'an', '118.79687', '25.03059');
INSERT INTO `tb_region` VALUES ('350524', '安溪县', '350500', '安溪', '4', '0595', '362400', '中国,福建省,泉州市,安溪县', 'Anxi', '118.18719', '25.05627');
INSERT INTO `tb_region` VALUES ('350525', '永春县', '350500', '永春', '4', '0595', '362600', '中国,福建省,泉州市,永春县', 'Yongchun', '118.29437', '25.32183');
INSERT INTO `tb_region` VALUES ('350526', '德化县', '350500', '德化', '4', '0595', '362500', '中国,福建省,泉州市,德化县', 'Dehua', '118.24176', '25.49224');
INSERT INTO `tb_region` VALUES ('350527', '金门县', '350500', '金门', '4', '', '', '中国,福建省,泉州市,金门县', 'Jinmen', '118.32263', '24.42922');
INSERT INTO `tb_region` VALUES ('350581', '石狮市', '350500', '石狮', '4', '0595', '362700', '中国,福建省,泉州市,石狮市', 'Shishi', '118.64779', '24.73242');
INSERT INTO `tb_region` VALUES ('350582', '晋江市', '350500', '晋江', '4', '0595', '362200', '中国,福建省,泉州市,晋江市', 'Jinjiang', '118.55194', '24.78141');
INSERT INTO `tb_region` VALUES ('350583', '南安市', '350500', '南安', '4', '0595', '362300', '中国,福建省,泉州市,南安市', 'Nan\'an', '118.38589', '24.96055');
INSERT INTO `tb_region` VALUES ('350600', '漳州市', '350000', '漳州', '3', '0596', '363005', '中国,福建省,漳州市', 'Zhangzhou', '117.661801', '24.510897');
INSERT INTO `tb_region` VALUES ('350602', '芗城区', '350600', '芗城', '4', '0596', '363000', '中国,福建省,漳州市,芗城区', 'Xiangcheng', '117.65402', '24.51081');
INSERT INTO `tb_region` VALUES ('350603', '龙文区', '350600', '龙文', '4', '0596', '363005', '中国,福建省,漳州市,龙文区', 'Longwen', '117.70971', '24.50323');
INSERT INTO `tb_region` VALUES ('350622', '云霄县', '350600', '云霄', '4', '0596', '363300', '中国,福建省,漳州市,云霄县', 'Yunxiao', '117.34051', '23.95534');
INSERT INTO `tb_region` VALUES ('350623', '漳浦县', '350600', '漳浦', '4', '0596', '363200', '中国,福建省,漳州市,漳浦县', 'Zhangpu', '117.61367', '24.11706');
INSERT INTO `tb_region` VALUES ('350624', '诏安县', '350600', '诏安', '4', '0596', '363500', '中国,福建省,漳州市,诏安县', 'Zhao\'an', '117.17501', '23.71148');
INSERT INTO `tb_region` VALUES ('350625', '长泰县', '350600', '长泰', '4', '0596', '363900', '中国,福建省,漳州市,长泰县', 'Changtai', '117.75924', '24.62526');
INSERT INTO `tb_region` VALUES ('350626', '东山县', '350600', '东山', '4', '0596', '363400', '中国,福建省,漳州市,东山县', 'Dongshan', '117.42822', '23.70109');
INSERT INTO `tb_region` VALUES ('350627', '南靖县', '350600', '南靖', '4', '0596', '363600', '中国,福建省,漳州市,南靖县', 'Nanjing', '117.35736', '24.51448');
INSERT INTO `tb_region` VALUES ('350628', '平和县', '350600', '平和', '4', '0596', '363700', '中国,福建省,漳州市,平和县', 'Pinghe', '117.3124', '24.36395');
INSERT INTO `tb_region` VALUES ('350629', '华安县', '350600', '华安', '4', '0596', '363800', '中国,福建省,漳州市,华安县', 'Hua\'an', '117.54077', '25.00563');
INSERT INTO `tb_region` VALUES ('350681', '龙海市', '350600', '龙海', '4', '0596', '363100', '中国,福建省,漳州市,龙海市', 'Longhai', '117.81802', '24.44655');
INSERT INTO `tb_region` VALUES ('350700', '南平市', '350000', '南平', '3', '0599', '353000', '中国,福建省,南平市', 'Nanping', '118.178459', '26.635627');
INSERT INTO `tb_region` VALUES ('350702', '延平区', '350700', '延平', '4', '0600', '353000', '中国,福建省,南平市,延平区', 'Yanping', '118.18189', '26.63745');
INSERT INTO `tb_region` VALUES ('350703', '建阳区', '350700', '建阳', '4', '0599', '354200', '中国,福建省,南平市,建阳区', 'Jianyang', '118.12267', '27.332067');
INSERT INTO `tb_region` VALUES ('350721', '顺昌县', '350700', '顺昌', '4', '0605', '353200', '中国,福建省,南平市,顺昌县', 'Shunchang', '117.8103', '26.79298');
INSERT INTO `tb_region` VALUES ('350722', '浦城县', '350700', '浦城', '4', '0606', '353400', '中国,福建省,南平市,浦城县', 'Pucheng', '118.54007', '27.91888');
INSERT INTO `tb_region` VALUES ('350723', '光泽县', '350700', '光泽', '4', '0607', '354100', '中国,福建省,南平市,光泽县', 'Guangze', '117.33346', '27.54231');
INSERT INTO `tb_region` VALUES ('350724', '松溪县', '350700', '松溪', '4', '0608', '353500', '中国,福建省,南平市,松溪县', 'Songxi', '118.78533', '27.52624');
INSERT INTO `tb_region` VALUES ('350725', '政和县', '350700', '政和', '4', '0609', '353600', '中国,福建省,南平市,政和县', 'Zhenghe', '118.85571', '27.36769');
INSERT INTO `tb_region` VALUES ('350781', '邵武市', '350700', '邵武', '4', '0601', '354000', '中国,福建省,南平市,邵武市', 'Shaowu', '117.4924', '27.34033');
INSERT INTO `tb_region` VALUES ('350782', '武夷山市', '350700', '武夷山', '4', '0602', '354300', '中国,福建省,南平市,武夷山市', 'Wuyishan', '118.03665', '27.75543');
INSERT INTO `tb_region` VALUES ('350783', '建瓯市', '350700', '建瓯', '4', '0603', '353100', '中国,福建省,南平市,建瓯市', 'Jianou', '118.29766', '27.02301');
INSERT INTO `tb_region` VALUES ('350800', '龙岩市', '350000', '龙岩', '3', '0597', '364000', '中国,福建省,龙岩市', 'Longyan', '117.02978', '25.091603');
INSERT INTO `tb_region` VALUES ('350802', '新罗区', '350800', '新罗', '4', '0597', '364000', '中国,福建省,龙岩市,新罗区', 'Xinluo', '117.03693', '25.09834');
INSERT INTO `tb_region` VALUES ('350821', '长汀县', '350800', '长汀', '4', '0597', '366300', '中国,福建省,龙岩市,长汀县', 'Changting', '116.35888', '25.82773');
INSERT INTO `tb_region` VALUES ('350822', '永定区', '350800', '永定', '4', '0597', '364100', '中国,福建省,龙岩市,永定区', 'Yongding', '116.73199', '24.72302');
INSERT INTO `tb_region` VALUES ('350823', '上杭县', '350800', '上杭', '4', '0597', '364200', '中国,福建省,龙岩市,上杭县', 'Shanghang', '116.42022', '25.04943');
INSERT INTO `tb_region` VALUES ('350824', '武平县', '350800', '武平', '4', '0597', '364300', '中国,福建省,龙岩市,武平县', 'Wuping', '116.10229', '25.09244');
INSERT INTO `tb_region` VALUES ('350825', '连城县', '350800', '连城', '4', '0597', '366200', '中国,福建省,龙岩市,连城县', 'Liancheng', '116.75454', '25.7103');
INSERT INTO `tb_region` VALUES ('350881', '漳平市', '350800', '漳平', '4', '0597', '364400', '中国,福建省,龙岩市,漳平市', 'Zhangping', '117.41992', '25.29109');
INSERT INTO `tb_region` VALUES ('350900', '宁德市', '350000', '宁德', '3', '0593', '352100', '中国,福建省,宁德市', 'Ningde', '119.527082', '26.65924');
INSERT INTO `tb_region` VALUES ('350902', '蕉城区', '350900', '蕉城', '4', '0593', '352100', '中国,福建省,宁德市,蕉城区', 'Jiaocheng', '119.52643', '26.66048');
INSERT INTO `tb_region` VALUES ('350921', '霞浦县', '350900', '霞浦', '4', '0593', '355100', '中国,福建省,宁德市,霞浦县', 'Xiapu', '119.99893', '26.88578');
INSERT INTO `tb_region` VALUES ('350922', '古田县', '350900', '古田', '4', '0593', '352200', '中国,福建省,宁德市,古田县', 'Gutian', '118.74688', '26.57682');
INSERT INTO `tb_region` VALUES ('350923', '屏南县', '350900', '屏南', '4', '0593', '352300', '中国,福建省,宁德市,屏南县', 'Pingnan', '118.98861', '26.91099');
INSERT INTO `tb_region` VALUES ('350924', '寿宁县', '350900', '寿宁', '4', '0593', '355500', '中国,福建省,宁德市,寿宁县', 'Shouning', '119.5039', '27.45996');
INSERT INTO `tb_region` VALUES ('350925', '周宁县', '350900', '周宁', '4', '0593', '355400', '中国,福建省,宁德市,周宁县', 'Zhouning', '119.33837', '27.10664');
INSERT INTO `tb_region` VALUES ('350926', '柘荣县', '350900', '柘荣', '4', '0593', '355300', '中国,福建省,宁德市,柘荣县', 'Zherong', '119.89971', '27.23543');
INSERT INTO `tb_region` VALUES ('350981', '福安市', '350900', '福安', '4', '0593', '355000', '中国,福建省,宁德市,福安市', 'Fu\'an', '119.6495', '27.08673');
INSERT INTO `tb_region` VALUES ('350982', '福鼎市', '350900', '福鼎', '4', '0593', '355200', '中国,福建省,宁德市,福鼎市', 'Fuding', '120.21664', '27.3243');
INSERT INTO `tb_region` VALUES ('360000', '江西省', '100001', '江西', '2', '', '', '中国,江西省', 'Jiangxi', '115.892151', '28.676493');
INSERT INTO `tb_region` VALUES ('360100', '南昌市', '360000', '南昌', '3', '0791', '330008', '中国,江西省,南昌市', 'Nanchang', '115.892151', '28.676493');
INSERT INTO `tb_region` VALUES ('360102', '东湖区', '360100', '东湖', '4', '0791', '330006', '中国,江西省,南昌市,东湖区', 'Donghu', '115.8988', '28.68505');
INSERT INTO `tb_region` VALUES ('360103', '西湖区', '360100', '西湖', '4', '0791', '330009', '中国,江西省,南昌市,西湖区', 'Xihu', '115.87728', '28.65688');
INSERT INTO `tb_region` VALUES ('360104', '青云谱区', '360100', '青云谱', '4', '0791', '330001', '中国,江西省,南昌市,青云谱区', 'Qingyunpu', '115.915', '28.63199');
INSERT INTO `tb_region` VALUES ('360105', '湾里区', '360100', '湾里', '4', '0791', '330004', '中国,江西省,南昌市,湾里区', 'Wanli', '115.73104', '28.71529');
INSERT INTO `tb_region` VALUES ('360111', '青山湖区', '360100', '青山湖', '4', '0791', '330029', '中国,江西省,南昌市,青山湖区', 'Qingshanhu', '115.9617', '28.68206');
INSERT INTO `tb_region` VALUES ('360121', '南昌县', '360100', '南昌', '4', '0791', '330200', '中国,江西省,南昌市,南昌县', 'Nanchang', '115.94393', '28.54559');
INSERT INTO `tb_region` VALUES ('360122', '新建县', '360100', '新建', '4', '0791', '330100', '中国,江西省,南昌市,新建县', 'Xinjian', '115.81546', '28.69248');
INSERT INTO `tb_region` VALUES ('360123', '安义县', '360100', '安义', '4', '0791', '330500', '中国,江西省,南昌市,安义县', 'Anyi', '115.54879', '28.84602');
INSERT INTO `tb_region` VALUES ('360124', '进贤县', '360100', '进贤', '4', '0791', '331700', '中国,江西省,南昌市,进贤县', 'Jinxian', '116.24087', '28.37679');
INSERT INTO `tb_region` VALUES ('360200', '景德镇市', '360000', '景德镇', '3', '0798', '333000', '中国,江西省,景德镇市', 'Jingdezhen', '117.214664', '29.29256');
INSERT INTO `tb_region` VALUES ('360202', '昌江区', '360200', '昌江', '4', '0799', '333000', '中国,江西省,景德镇市,昌江区', 'Changjiang', '117.18359', '29.27321');
INSERT INTO `tb_region` VALUES ('360203', '珠山区', '360200', '珠山', '4', '0800', '333000', '中国,江西省,景德镇市,珠山区', 'Zhushan', '117.20233', '29.30127');
INSERT INTO `tb_region` VALUES ('360222', '浮梁县', '360200', '浮梁', '4', '0802', '333400', '中国,江西省,景德镇市,浮梁县', 'Fuliang', '117.21517', '29.35156');
INSERT INTO `tb_region` VALUES ('360281', '乐平市', '360200', '乐平', '4', '0801', '333300', '中国,江西省,景德镇市,乐平市', 'Leping', '117.12887', '28.96295');
INSERT INTO `tb_region` VALUES ('360300', '萍乡市', '360000', '萍乡', '3', '0799', '337000', '中国,江西省,萍乡市', 'Pingxiang', '113.852186', '27.622946');
INSERT INTO `tb_region` VALUES ('360302', '安源区', '360300', '安源', '4', '0800', '337000', '中国,江西省,萍乡市,安源区', 'Anyuan', '113.89135', '27.61653');
INSERT INTO `tb_region` VALUES ('360313', '湘东区', '360300', '湘东', '4', '0801', '337016', '中国,江西省,萍乡市,湘东区', 'Xiangdong', '113.73294', '27.64007');
INSERT INTO `tb_region` VALUES ('360321', '莲花县', '360300', '莲花', '4', '0802', '337100', '中国,江西省,萍乡市,莲花县', 'Lianhua', '113.96142', '27.12866');
INSERT INTO `tb_region` VALUES ('360322', '上栗县', '360300', '上栗', '4', '0803', '337009', '中国,江西省,萍乡市,上栗县', 'Shangli', '113.79403', '27.87467');
INSERT INTO `tb_region` VALUES ('360323', '芦溪县', '360300', '芦溪', '4', '0804', '337053', '中国,江西省,萍乡市,芦溪县', 'Luxi', '114.02951', '27.63063');
INSERT INTO `tb_region` VALUES ('360400', '九江市', '360000', '九江', '3', '0792', '332000', '中国,江西省,九江市', 'Jiujiang', '115.992811', '29.712034');
INSERT INTO `tb_region` VALUES ('360402', '庐山区', '360400', '庐山', '4', '0792', '332005', '中国,江西省,九江市,庐山区', 'Lushan', '115.98904', '29.67177');
INSERT INTO `tb_region` VALUES ('360403', '浔阳区', '360400', '浔阳', '4', '0792', '332000', '中国,江西省,九江市,浔阳区', 'Xunyang', '115.98986', '29.72786');
INSERT INTO `tb_region` VALUES ('360421', '九江县', '360400', '九江', '4', '0792', '332100', '中国,江西省,九江市,九江县', 'Jiujiang', '115.91128', '29.60852');
INSERT INTO `tb_region` VALUES ('360423', '武宁县', '360400', '武宁', '4', '0792', '332300', '中国,江西省,九江市,武宁县', 'Wuning', '115.10061', '29.2584');
INSERT INTO `tb_region` VALUES ('360424', '修水县', '360400', '修水', '4', '0792', '332400', '中国,江西省,九江市,修水县', 'Xiushui', '114.54684', '29.02539');
INSERT INTO `tb_region` VALUES ('360425', '永修县', '360400', '永修', '4', '0792', '330300', '中国,江西省,九江市,永修县', 'Yongxiu', '115.80911', '29.02093');
INSERT INTO `tb_region` VALUES ('360426', '德安县', '360400', '德安', '4', '0792', '330400', '中国,江西省,九江市,德安县', 'De\'an', '115.75601', '29.31341');
INSERT INTO `tb_region` VALUES ('360427', '星子县', '360400', '星子', '4', '0792', '332800', '中国,江西省,九江市,星子县', 'Xingzi', '116.04492', '29.44608');
INSERT INTO `tb_region` VALUES ('360428', '都昌县', '360400', '都昌', '4', '0792', '332600', '中国,江西省,九江市,都昌县', 'Duchang', '116.20401', '29.27327');
INSERT INTO `tb_region` VALUES ('360429', '湖口县', '360400', '湖口', '4', '0792', '332500', '中国,江西省,九江市,湖口县', 'Hukou', '116.21853', '29.73818');
INSERT INTO `tb_region` VALUES ('360430', '彭泽县', '360400', '彭泽', '4', '0792', '332700', '中国,江西省,九江市,彭泽县', 'Pengze', '116.55011', '29.89589');
INSERT INTO `tb_region` VALUES ('360481', '瑞昌市', '360400', '瑞昌', '4', '0792', '332200', '中国,江西省,九江市,瑞昌市', 'Ruichang', '115.66705', '29.67183');
INSERT INTO `tb_region` VALUES ('360482', '共青城市', '360400', '共青城', '4', '0792', '332020', '中国,江西省,九江市,共青城市', 'Gongqingcheng', '115.801939', '29.238785');
INSERT INTO `tb_region` VALUES ('360500', '新余市', '360000', '新余', '3', '0790', '338025', '中国,江西省,新余市', 'Xinyu', '114.930835', '27.810834');
INSERT INTO `tb_region` VALUES ('360502', '渝水区', '360500', '渝水', '4', '0790', '338025', '中国,江西省,新余市,渝水区', 'Yushui', '114.944', '27.80098');
INSERT INTO `tb_region` VALUES ('360521', '分宜县', '360500', '分宜', '4', '0790', '336600', '中国,江西省,新余市,分宜县', 'Fenyi', '114.69189', '27.81475');
INSERT INTO `tb_region` VALUES ('360600', '鹰潭市', '360000', '鹰潭', '3', '0701', '335000', '中国,江西省,鹰潭市', 'Yingtan', '117.033838', '28.238638');
INSERT INTO `tb_region` VALUES ('360602', '月湖区', '360600', '月湖', '4', '0701', '335000', '中国,江西省,鹰潭市,月湖区', 'Yuehu', '117.03732', '28.23913');
INSERT INTO `tb_region` VALUES ('360622', '余江县', '360600', '余江', '4', '0701', '335200', '中国,江西省,鹰潭市,余江县', 'Yujiang', '116.81851', '28.21034');
INSERT INTO `tb_region` VALUES ('360681', '贵溪市', '360600', '贵溪', '4', '0701', '335400', '中国,江西省,鹰潭市,贵溪市', 'Guixi', '117.24246', '28.2926');
INSERT INTO `tb_region` VALUES ('360700', '赣州市', '360000', '赣州', '3', '0797', '341000', '中国,江西省,赣州市', 'Ganzhou', '114.940278', '25.85097');
INSERT INTO `tb_region` VALUES ('360702', '章贡区', '360700', '章贡', '4', '0797', '341000', '中国,江西省,赣州市,章贡区', 'Zhanggong', '114.94284', '25.8624');
INSERT INTO `tb_region` VALUES ('360703', '南康区', '360700', '南康', '4', '0797', '341400', '中国,江西省,赣州市,南康区', 'Nankang', '114.756933', '25.661721');
INSERT INTO `tb_region` VALUES ('360721', '赣县', '360700', '赣县', '4', '0797', '341100', '中国,江西省,赣州市,赣县', 'Ganxian', '115.01171', '25.86149');
INSERT INTO `tb_region` VALUES ('360722', '信丰县', '360700', '信丰', '4', '0797', '341600', '中国,江西省,赣州市,信丰县', 'Xinfeng', '114.92279', '25.38612');
INSERT INTO `tb_region` VALUES ('360723', '大余县', '360700', '大余', '4', '0797', '341500', '中国,江西省,赣州市,大余县', 'Dayu', '114.35757', '25.39561');
INSERT INTO `tb_region` VALUES ('360724', '上犹县', '360700', '上犹', '4', '0797', '341200', '中国,江西省,赣州市,上犹县', 'Shangyou', '114.54138', '25.79567');
INSERT INTO `tb_region` VALUES ('360725', '崇义县', '360700', '崇义', '4', '0797', '341300', '中国,江西省,赣州市,崇义县', 'Chongyi', '114.30835', '25.68186');
INSERT INTO `tb_region` VALUES ('360726', '安远县', '360700', '安远', '4', '0797', '342100', '中国,江西省,赣州市,安远县', 'Anyuan', '115.39483', '25.1371');
INSERT INTO `tb_region` VALUES ('360727', '龙南县', '360700', '龙南', '4', '0797', '341700', '中国,江西省,赣州市,龙南县', 'Longnan', '114.78994', '24.91086');
INSERT INTO `tb_region` VALUES ('360728', '定南县', '360700', '定南', '4', '0797', '341900', '中国,江西省,赣州市,定南县', 'Dingnan', '115.02713', '24.78395');
INSERT INTO `tb_region` VALUES ('360729', '全南县', '360700', '全南', '4', '0797', '341800', '中国,江西省,赣州市,全南县', 'Quannan', '114.5292', '24.74324');
INSERT INTO `tb_region` VALUES ('360730', '宁都县', '360700', '宁都', '4', '0797', '342800', '中国,江西省,赣州市,宁都县', 'Ningdu', '116.01565', '26.47227');
INSERT INTO `tb_region` VALUES ('360731', '于都县', '360700', '于都', '4', '0797', '342300', '中国,江西省,赣州市,于都县', 'Yudu', '115.41415', '25.95257');
INSERT INTO `tb_region` VALUES ('360732', '兴国县', '360700', '兴国', '4', '0797', '342400', '中国,江西省,赣州市,兴国县', 'Xingguo', '115.36309', '26.33776');
INSERT INTO `tb_region` VALUES ('360733', '会昌县', '360700', '会昌', '4', '0797', '342600', '中国,江西省,赣州市,会昌县', 'Huichang', '115.78555', '25.60068');
INSERT INTO `tb_region` VALUES ('360734', '寻乌县', '360700', '寻乌', '4', '0797', '342200', '中国,江西省,赣州市,寻乌县', 'Xunwu', '115.64852', '24.95513');
INSERT INTO `tb_region` VALUES ('360735', '石城县', '360700', '石城', '4', '0797', '342700', '中国,江西省,赣州市,石城县', 'Shicheng', '116.3442', '26.32617');
INSERT INTO `tb_region` VALUES ('360781', '瑞金市', '360700', '瑞金', '4', '0797', '342500', '中国,江西省,赣州市,瑞金市', 'Ruijin', '116.02703', '25.88557');
INSERT INTO `tb_region` VALUES ('360800', '吉安市', '360000', '吉安', '3', '0796', '343000', '中国,江西省,吉安市', 'Ji\'an', '114.986373', '27.111699');
INSERT INTO `tb_region` VALUES ('360802', '吉州区', '360800', '吉州', '4', '0796', '343000', '中国,江西省,吉安市,吉州区', 'Jizhou', '114.97598', '27.10669');
INSERT INTO `tb_region` VALUES ('360803', '青原区', '360800', '青原', '4', '0796', '343009', '中国,江西省,吉安市,青原区', 'Qingyuan', '115.01747', '27.10577');
INSERT INTO `tb_region` VALUES ('360821', '吉安县', '360800', '吉安', '4', '0796', '343100', '中国,江西省,吉安市,吉安县', 'Ji\'an', '114.90695', '27.04048');
INSERT INTO `tb_region` VALUES ('360822', '吉水县', '360800', '吉水', '4', '0796', '331600', '中国,江西省,吉安市,吉水县', 'Jishui', '115.1343', '27.21071');
INSERT INTO `tb_region` VALUES ('360823', '峡江县', '360800', '峡江', '4', '0796', '331409', '中国,江西省,吉安市,峡江县', 'Xiajiang', '115.31723', '27.576');
INSERT INTO `tb_region` VALUES ('360824', '新干县', '360800', '新干', '4', '0796', '331300', '中国,江西省,吉安市,新干县', 'Xingan', '115.39306', '27.74092');
INSERT INTO `tb_region` VALUES ('360825', '永丰县', '360800', '永丰', '4', '0796', '331500', '中国,江西省,吉安市,永丰县', 'Yongfeng', '115.44238', '27.31785');
INSERT INTO `tb_region` VALUES ('360826', '泰和县', '360800', '泰和', '4', '0796', '343700', '中国,江西省,吉安市,泰和县', 'Taihe', '114.90789', '26.79113');
INSERT INTO `tb_region` VALUES ('360827', '遂川县', '360800', '遂川', '4', '0796', '343900', '中国,江西省,吉安市,遂川县', 'Suichuan', '114.51629', '26.32598');
INSERT INTO `tb_region` VALUES ('360828', '万安县', '360800', '万安', '4', '0796', '343800', '中国,江西省,吉安市,万安县', 'Wan\'an', '114.78659', '26.45931');
INSERT INTO `tb_region` VALUES ('360829', '安福县', '360800', '安福', '4', '0796', '343200', '中国,江西省,吉安市,安福县', 'Anfu', '114.61956', '27.39276');
INSERT INTO `tb_region` VALUES ('360830', '永新县', '360800', '永新', '4', '0796', '343400', '中国,江西省,吉安市,永新县', 'Yongxin', '114.24246', '26.94488');
INSERT INTO `tb_region` VALUES ('360881', '井冈山市', '360800', '井冈山', '4', '0796', '343600', '中国,江西省,吉安市,井冈山市', 'Jinggangshan', '114.28949', '26.74804');
INSERT INTO `tb_region` VALUES ('360900', '宜春市', '360000', '宜春', '3', '0795', '336000', '中国,江西省,宜春市', 'Yichun', '114.391136', '27.8043');
INSERT INTO `tb_region` VALUES ('360902', '袁州区', '360900', '袁州', '4', '0795', '336000', '中国,江西省,宜春市,袁州区', 'Yuanzhou', '114.38246', '27.79649');
INSERT INTO `tb_region` VALUES ('360921', '奉新县', '360900', '奉新', '4', '0795', '330700', '中国,江西省,宜春市,奉新县', 'Fengxin', '115.40036', '28.6879');
INSERT INTO `tb_region` VALUES ('360922', '万载县', '360900', '万载', '4', '0795', '336100', '中国,江西省,宜春市,万载县', 'Wanzai', '114.4458', '28.10656');
INSERT INTO `tb_region` VALUES ('360923', '上高县', '360900', '上高', '4', '0795', '336400', '中国,江西省,宜春市,上高县', 'Shanggao', '114.92459', '28.23423');
INSERT INTO `tb_region` VALUES ('360924', '宜丰县', '360900', '宜丰', '4', '0795', '336300', '中国,江西省,宜春市,宜丰县', 'Yifeng', '114.7803', '28.38555');
INSERT INTO `tb_region` VALUES ('360925', '靖安县', '360900', '靖安', '4', '0795', '330600', '中国,江西省,宜春市,靖安县', 'Jing\'an', '115.36279', '28.86167');
INSERT INTO `tb_region` VALUES ('360926', '铜鼓县', '360900', '铜鼓', '4', '0795', '336200', '中国,江西省,宜春市,铜鼓县', 'Tonggu', '114.37036', '28.52311');
INSERT INTO `tb_region` VALUES ('360981', '丰城市', '360900', '丰城', '4', '0795', '331100', '中国,江西省,宜春市,丰城市', 'Fengcheng', '115.77114', '28.15918');
INSERT INTO `tb_region` VALUES ('360982', '樟树市', '360900', '樟树', '4', '0795', '331200', '中国,江西省,宜春市,樟树市', 'Zhangshu', '115.5465', '28.05332');
INSERT INTO `tb_region` VALUES ('360983', '高安市', '360900', '高安', '4', '0795', '330800', '中国,江西省,宜春市,高安市', 'Gao\'an', '115.3753', '28.4178');
INSERT INTO `tb_region` VALUES ('361000', '抚州市', '360000', '抚州', '3', '0794', '344000', '中国,江西省,抚州市', 'Fuzhou', '116.358351', '27.98385');
INSERT INTO `tb_region` VALUES ('361002', '临川区', '361000', '临川', '4', '0794', '344000', '中国,江西省,抚州市,临川区', 'Linchuan', '116.35919', '27.97721');
INSERT INTO `tb_region` VALUES ('361021', '南城县', '361000', '南城', '4', '0794', '344700', '中国,江西省,抚州市,南城县', 'Nancheng', '116.64419', '27.55381');
INSERT INTO `tb_region` VALUES ('361022', '黎川县', '361000', '黎川', '4', '0794', '344600', '中国,江西省,抚州市,黎川县', 'Lichuan', '116.90771', '27.28232');
INSERT INTO `tb_region` VALUES ('361023', '南丰县', '361000', '南丰', '4', '0794', '344500', '中国,江西省,抚州市,南丰县', 'Nanfeng', '116.5256', '27.21842');
INSERT INTO `tb_region` VALUES ('361024', '崇仁县', '361000', '崇仁', '4', '0794', '344200', '中国,江西省,抚州市,崇仁县', 'Chongren', '116.06021', '27.75962');
INSERT INTO `tb_region` VALUES ('361025', '乐安县', '361000', '乐安', '4', '0794', '344300', '中国,江西省,抚州市,乐安县', 'Le\'an', '115.83108', '27.42812');
INSERT INTO `tb_region` VALUES ('361026', '宜黄县', '361000', '宜黄', '4', '0794', '344400', '中国,江西省,抚州市,宜黄县', 'Yihuang', '116.23626', '27.55487');
INSERT INTO `tb_region` VALUES ('361027', '金溪县', '361000', '金溪', '4', '0794', '344800', '中国,江西省,抚州市,金溪县', 'Jinxi', '116.77392', '27.90753');
INSERT INTO `tb_region` VALUES ('361028', '资溪县', '361000', '资溪', '4', '0794', '335300', '中国,江西省,抚州市,资溪县', 'Zixi', '117.06939', '27.70493');
INSERT INTO `tb_region` VALUES ('361029', '东乡县', '361000', '东乡', '4', '0794', '331800', '中国,江西省,抚州市,东乡县', 'Dongxiang', '116.59039', '28.23614');
INSERT INTO `tb_region` VALUES ('361030', '广昌县', '361000', '广昌', '4', '0794', '344900', '中国,江西省,抚州市,广昌县', 'Guangchang', '116.32547', '26.8341');
INSERT INTO `tb_region` VALUES ('361100', '上饶市', '360000', '上饶', '3', '0793', '334000', '中国,江西省,上饶市', 'Shangrao', '117.971185', '28.44442');
INSERT INTO `tb_region` VALUES ('361102', '信州区', '361100', '信州', '4', '0793', '334000', '中国,江西省,上饶市,信州区', 'Xinzhou', '117.96682', '28.43121');
INSERT INTO `tb_region` VALUES ('361121', '上饶县', '361100', '上饶', '4', '0793', '334100', '中国,江西省,上饶市,上饶县', 'Shangrao', '117.90884', '28.44856');
INSERT INTO `tb_region` VALUES ('361122', '广丰县', '361100', '广丰', '4', '0793', '334600', '中国,江西省,上饶市,广丰县', 'Guangfeng', '118.19158', '28.43766');
INSERT INTO `tb_region` VALUES ('361123', '玉山县', '361100', '玉山', '4', '0793', '334700', '中国,江西省,上饶市,玉山县', 'Yushan', '118.24462', '28.6818');
INSERT INTO `tb_region` VALUES ('361124', '铅山县', '361100', '铅山', '4', '0793', '334500', '中国,江西省,上饶市,铅山县', 'Yanshan', '117.70996', '28.31549');
INSERT INTO `tb_region` VALUES ('361125', '横峰县', '361100', '横峰', '4', '0793', '334300', '中国,江西省,上饶市,横峰县', 'Hengfeng', '117.5964', '28.40716');
INSERT INTO `tb_region` VALUES ('361126', '弋阳县', '361100', '弋阳', '4', '0793', '334400', '中国,江西省,上饶市,弋阳县', 'Yiyang', '117.45929', '28.37451');
INSERT INTO `tb_region` VALUES ('361127', '余干县', '361100', '余干', '4', '0793', '335100', '中国,江西省,上饶市,余干县', 'Yugan', '116.69555', '28.70206');
INSERT INTO `tb_region` VALUES ('361128', '鄱阳县', '361100', '鄱阳', '4', '0793', '333100', '中国,江西省,上饶市,鄱阳县', 'Poyang', '116.69967', '29.0118');
INSERT INTO `tb_region` VALUES ('361129', '万年县', '361100', '万年', '4', '0793', '335500', '中国,江西省,上饶市,万年县', 'Wannian', '117.06884', '28.69537');
INSERT INTO `tb_region` VALUES ('361130', '婺源县', '361100', '婺源', '4', '0793', '333200', '中国,江西省,上饶市,婺源县', 'Wuyuan', '117.86105', '29.24841');
INSERT INTO `tb_region` VALUES ('361181', '德兴市', '361100', '德兴', '4', '0793', '334200', '中国,江西省,上饶市,德兴市', 'Dexing', '117.57919', '28.94736');
INSERT INTO `tb_region` VALUES ('370000', '山东省', '100001', '山东', '2', '', '', '中国,山东省', 'Shandong', '117.000923', '36.675807');
INSERT INTO `tb_region` VALUES ('370100', '济南市', '370000', '济南', '3', '0531', '250001', '中国,山东省,济南市', 'Jinan', '117.000923', '36.675807');
INSERT INTO `tb_region` VALUES ('370102', '历下区', '370100', '历下', '4', '0531', '250014', '中国,山东省,济南市,历下区', 'Lixia', '117.0768', '36.66661');
INSERT INTO `tb_region` VALUES ('370103', '市中区', '370100', '市中区', '4', '0531', '250001', '中国,山东省,济南市,市中区', 'Shizhongqu', '116.99741', '36.65101');
INSERT INTO `tb_region` VALUES ('370104', '槐荫区', '370100', '槐荫', '4', '0531', '250117', '中国,山东省,济南市,槐荫区', 'Huaiyin', '116.90075', '36.65136');
INSERT INTO `tb_region` VALUES ('370105', '天桥区', '370100', '天桥', '4', '0531', '250031', '中国,山东省,济南市,天桥区', 'Tianqiao', '116.98749', '36.67801');
INSERT INTO `tb_region` VALUES ('370112', '历城区', '370100', '历城', '4', '0531', '250100', '中国,山东省,济南市,历城区', 'Licheng', '117.06509', '36.67995');
INSERT INTO `tb_region` VALUES ('370113', '长清区', '370100', '长清', '4', '0531', '250300', '中国,山东省,济南市,长清区', 'Changqing', '116.75192', '36.55352');
INSERT INTO `tb_region` VALUES ('370124', '平阴县', '370100', '平阴', '4', '0531', '250400', '中国,山东省,济南市,平阴县', 'Pingyin', '116.45587', '36.28955');
INSERT INTO `tb_region` VALUES ('370125', '济阳县', '370100', '济阳', '4', '0531', '251400', '中国,山东省,济南市,济阳县', 'Jiyang', '117.17327', '36.97845');
INSERT INTO `tb_region` VALUES ('370126', '商河县', '370100', '商河', '4', '0531', '251600', '中国,山东省,济南市,商河县', 'Shanghe', '117.15722', '37.31119');
INSERT INTO `tb_region` VALUES ('370181', '章丘市', '370100', '章丘', '4', '0531', '250200', '中国,山东省,济南市,章丘市', 'Zhangqiu', '117.53677', '36.71392');
INSERT INTO `tb_region` VALUES ('370200', '青岛市', '370000', '青岛', '3', '0532', '266001', '中国,山东省,青岛市', 'Qingdao', '120.369557', '36.094406');
INSERT INTO `tb_region` VALUES ('370202', '市南区', '370200', '市南', '4', '0532', '266001', '中国,山东省,青岛市,市南区', 'Shinan', '120.38773', '36.06671');
INSERT INTO `tb_region` VALUES ('370203', '市北区', '370200', '市北', '4', '0532', '266011', '中国,山东省,青岛市,市北区', 'Shibei', '120.37469', '36.08734');
INSERT INTO `tb_region` VALUES ('370211', '黄岛区', '370200', '黄岛', '4', '0532', '266500', '中国,山东省,青岛市,黄岛区', 'Huangdao', '120.19775', '35.96065');
INSERT INTO `tb_region` VALUES ('370212', '崂山区', '370200', '崂山', '4', '0532', '266100', '中国,山东省,青岛市,崂山区', 'Laoshan', '120.46923', '36.10717');
INSERT INTO `tb_region` VALUES ('370213', '李沧区', '370200', '李沧', '4', '0532', '266021', '中国,山东省,青岛市,李沧区', 'Licang', '120.43286', '36.14502');
INSERT INTO `tb_region` VALUES ('370214', '城阳区', '370200', '城阳', '4', '0532', '266041', '中国,山东省,青岛市,城阳区', 'Chengyang', '120.39621', '36.30735');
INSERT INTO `tb_region` VALUES ('370281', '胶州市', '370200', '胶州', '4', '0532', '266300', '中国,山东省,青岛市,胶州市', 'Jiaozhou', '120.0335', '36.26442');
INSERT INTO `tb_region` VALUES ('370282', '即墨市', '370200', '即墨', '4', '0532', '266200', '中国,山东省,青岛市,即墨市', 'Jimo', '120.44699', '36.38907');
INSERT INTO `tb_region` VALUES ('370283', '平度市', '370200', '平度', '4', '0532', '266700', '中国,山东省,青岛市,平度市', 'Pingdu', '119.95996', '36.78688');
INSERT INTO `tb_region` VALUES ('370285', '莱西市', '370200', '莱西', '4', '0532', '266600', '中国,山东省,青岛市,莱西市', 'Laixi', '120.51773', '36.88804');
INSERT INTO `tb_region` VALUES ('370286', '西海岸新区', '370200', '西海岸', '4', '0532', '266500', '中国,山东省,青岛市,西海岸新区', 'Xihai\'an', '120.19775', '35.96065');
INSERT INTO `tb_region` VALUES ('370300', '淄博市', '370000', '淄博', '3', '0533', '255039', '中国,山东省,淄博市', 'Zibo', '118.047648', '36.814939');
INSERT INTO `tb_region` VALUES ('370302', '淄川区', '370300', '淄川', '4', '0533', '255100', '中国,山东省,淄博市,淄川区', 'Zichuan', '117.96655', '36.64339');
INSERT INTO `tb_region` VALUES ('370303', '张店区', '370300', '张店', '4', '0533', '255022', '中国,山东省,淄博市,张店区', 'Zhangdian', '118.01788', '36.80676');
INSERT INTO `tb_region` VALUES ('370304', '博山区', '370300', '博山', '4', '0533', '255200', '中国,山东省,淄博市,博山区', 'Boshan', '117.86166', '36.49469');
INSERT INTO `tb_region` VALUES ('370305', '临淄区', '370300', '临淄', '4', '0533', '255400', '中国,山东省,淄博市,临淄区', 'Linzi', '118.30966', '36.8259');
INSERT INTO `tb_region` VALUES ('370306', '周村区', '370300', '周村', '4', '0533', '255300', '中国,山东省,淄博市,周村区', 'Zhoucun', '117.86969', '36.80322');
INSERT INTO `tb_region` VALUES ('370321', '桓台县', '370300', '桓台', '4', '0533', '256400', '中国,山东省,淄博市,桓台县', 'Huantai', '118.09698', '36.96036');
INSERT INTO `tb_region` VALUES ('370322', '高青县', '370300', '高青', '4', '0533', '256300', '中国,山东省,淄博市,高青县', 'Gaoqing', '117.82708', '37.17197');
INSERT INTO `tb_region` VALUES ('370323', '沂源县', '370300', '沂源', '4', '0533', '256100', '中国,山东省,淄博市,沂源县', 'Yiyuan', '118.17105', '36.18536');
INSERT INTO `tb_region` VALUES ('370400', '枣庄市', '370000', '枣庄', '3', '0632', '277101', '中国,山东省,枣庄市', 'Zaozhuang', '117.557964', '34.856424');
INSERT INTO `tb_region` VALUES ('370402', '市中区', '370400', '市中区', '4', '0632', '277101', '中国,山东省,枣庄市,市中区', 'Shizhongqu', '117.55603', '34.86391');
INSERT INTO `tb_region` VALUES ('370403', '薛城区', '370400', '薛城', '4', '0632', '277000', '中国,山东省,枣庄市,薛城区', 'Xuecheng', '117.26318', '34.79498');
INSERT INTO `tb_region` VALUES ('370404', '峄城区', '370400', '峄城', '4', '0632', '277300', '中国,山东省,枣庄市,峄城区', 'Yicheng', '117.59057', '34.77225');
INSERT INTO `tb_region` VALUES ('370405', '台儿庄区', '370400', '台儿庄', '4', '0632', '277400', '中国,山东省,枣庄市,台儿庄区', 'Taierzhuang', '117.73452', '34.56363');
INSERT INTO `tb_region` VALUES ('370406', '山亭区', '370400', '山亭', '4', '0632', '277200', '中国,山东省,枣庄市,山亭区', 'Shanting', '117.4663', '35.09541');
INSERT INTO `tb_region` VALUES ('370481', '滕州市', '370400', '滕州', '4', '0632', '277500', '中国,山东省,枣庄市,滕州市', 'Tengzhou', '117.165', '35.10534');
INSERT INTO `tb_region` VALUES ('370500', '东营市', '370000', '东营', '3', '0546', '257093', '中国,山东省,东营市', 'Dongying', '118.4963', '37.461266');
INSERT INTO `tb_region` VALUES ('370502', '东营区', '370500', '东营', '4', '0546', '257029', '中国,山东省,东营市,东营区', 'Dongying', '118.5816', '37.44875');
INSERT INTO `tb_region` VALUES ('370503', '河口区', '370500', '河口', '4', '0546', '257200', '中国,山东省,东营市,河口区', 'Hekou', '118.5249', '37.88541');
INSERT INTO `tb_region` VALUES ('370521', '垦利县', '370500', '垦利', '4', '0546', '257500', '中国,山东省,东营市,垦利县', 'Kenli', '118.54815', '37.58825');
INSERT INTO `tb_region` VALUES ('370522', '利津县', '370500', '利津', '4', '0546', '257400', '中国,山东省,东营市,利津县', 'Lijin', '118.25637', '37.49157');
INSERT INTO `tb_region` VALUES ('370523', '广饶县', '370500', '广饶', '4', '0546', '257300', '中国,山东省,东营市,广饶县', 'Guangrao', '118.40704', '37.05381');
INSERT INTO `tb_region` VALUES ('370600', '烟台市', '370000', '烟台', '3', '0635', '264010', '中国,山东省,烟台市', 'Yantai', '121.391382', '37.539297');
INSERT INTO `tb_region` VALUES ('370602', '芝罘区', '370600', '芝罘', '4', '0635', '264001', '中国,山东省,烟台市,芝罘区', 'Zhifu', '121.40023', '37.54064');
INSERT INTO `tb_region` VALUES ('370611', '福山区', '370600', '福山', '4', '0635', '265500', '中国,山东省,烟台市,福山区', 'Fushan', '121.26812', '37.49841');
INSERT INTO `tb_region` VALUES ('370612', '牟平区', '370600', '牟平', '4', '0635', '264100', '中国,山东省,烟台市,牟平区', 'Muping', '121.60067', '37.38846');
INSERT INTO `tb_region` VALUES ('370613', '莱山区', '370600', '莱山', '4', '0635', '264600', '中国,山东省,烟台市,莱山区', 'Laishan', '121.44512', '37.51165');
INSERT INTO `tb_region` VALUES ('370634', '长岛县', '370600', '长岛', '4', '0635', '265800', '中国,山东省,烟台市,长岛县', 'Changdao', '120.738', '37.91754');
INSERT INTO `tb_region` VALUES ('370681', '龙口市', '370600', '龙口', '4', '0635', '265700', '中国,山东省,烟台市,龙口市', 'Longkou', '120.50634', '37.64064');
INSERT INTO `tb_region` VALUES ('370682', '莱阳市', '370600', '莱阳', '4', '0635', '265200', '中国,山东省,烟台市,莱阳市', 'Laiyang', '120.71066', '36.98012');
INSERT INTO `tb_region` VALUES ('370683', '莱州市', '370600', '莱州', '4', '0635', '261400', '中国,山东省,烟台市,莱州市', 'Laizhou', '119.94137', '37.17806');
INSERT INTO `tb_region` VALUES ('370684', '蓬莱市', '370600', '蓬莱', '4', '0635', '265600', '中国,山东省,烟台市,蓬莱市', 'Penglai', '120.75988', '37.81119');
INSERT INTO `tb_region` VALUES ('370685', '招远市', '370600', '招远', '4', '0635', '265400', '中国,山东省,烟台市,招远市', 'Zhaoyuan', '120.40481', '37.36269');
INSERT INTO `tb_region` VALUES ('370686', '栖霞市', '370600', '栖霞', '4', '0635', '265300', '中国,山东省,烟台市,栖霞市', 'Qixia', '120.85025', '37.33571');
INSERT INTO `tb_region` VALUES ('370687', '海阳市', '370600', '海阳', '4', '0635', '265100', '中国,山东省,烟台市,海阳市', 'Haiyang', '121.15976', '36.77622');
INSERT INTO `tb_region` VALUES ('370700', '潍坊市', '370000', '潍坊', '3', '0536', '261041', '中国,山东省,潍坊市', 'Weifang', '119.107078', '36.70925');
INSERT INTO `tb_region` VALUES ('370702', '潍城区', '370700', '潍城', '4', '0536', '261021', '中国,山东省,潍坊市,潍城区', 'Weicheng', '119.10582', '36.7139');
INSERT INTO `tb_region` VALUES ('370703', '寒亭区', '370700', '寒亭', '4', '0536', '261100', '中国,山东省,潍坊市,寒亭区', 'Hanting', '119.21832', '36.77504');
INSERT INTO `tb_region` VALUES ('370704', '坊子区', '370700', '坊子', '4', '0536', '261200', '中国,山东省,潍坊市,坊子区', 'Fangzi', '119.16476', '36.65218');
INSERT INTO `tb_region` VALUES ('370705', '奎文区', '370700', '奎文', '4', '0536', '261031', '中国,山东省,潍坊市,奎文区', 'Kuiwen', '119.12532', '36.70723');
INSERT INTO `tb_region` VALUES ('370724', '临朐县', '370700', '临朐', '4', '0536', '262600', '中国,山东省,潍坊市,临朐县', 'Linqu', '118.544', '36.51216');
INSERT INTO `tb_region` VALUES ('370725', '昌乐县', '370700', '昌乐', '4', '0536', '262400', '中国,山东省,潍坊市,昌乐县', 'Changle', '118.83017', '36.7078');
INSERT INTO `tb_region` VALUES ('370781', '青州市', '370700', '青州', '4', '0536', '262500', '中国,山东省,潍坊市,青州市', 'Qingzhou', '118.47915', '36.68505');
INSERT INTO `tb_region` VALUES ('370782', '诸城市', '370700', '诸城', '4', '0536', '262200', '中国,山东省,潍坊市,诸城市', 'Zhucheng', '119.40988', '35.99662');
INSERT INTO `tb_region` VALUES ('370783', '寿光市', '370700', '寿光', '4', '0536', '262700', '中国,山东省,潍坊市,寿光市', 'Shouguang', '118.74047', '36.88128');
INSERT INTO `tb_region` VALUES ('370784', '安丘市', '370700', '安丘', '4', '0536', '262100', '中国,山东省,潍坊市,安丘市', 'Anqiu', '119.2189', '36.47847');
INSERT INTO `tb_region` VALUES ('370785', '高密市', '370700', '高密', '4', '0536', '261500', '中国,山东省,潍坊市,高密市', 'Gaomi', '119.75701', '36.38397');
INSERT INTO `tb_region` VALUES ('370786', '昌邑市', '370700', '昌邑', '4', '0536', '261300', '中国,山东省,潍坊市,昌邑市', 'Changyi', '119.39767', '36.86008');
INSERT INTO `tb_region` VALUES ('370800', '济宁市', '370000', '济宁', '3', '0537', '272119', '中国,山东省,济宁市', 'Jining', '116.587245', '35.415393');
INSERT INTO `tb_region` VALUES ('370811', '任城区', '370800', '任城', '4', '0537', '272113', '中国,山东省,济宁市,任城区', 'Rencheng', '116.59504', '35.40659');
INSERT INTO `tb_region` VALUES ('370812', '兖州区', '370800', '兖州', '4', '0537', '272000', '中国,山东省,济宁市,兖州区', 'Yanzhou ', '116.826546', '35.552305');
INSERT INTO `tb_region` VALUES ('370826', '微山县', '370800', '微山', '4', '0537', '277600', '中国,山东省,济宁市,微山县', 'Weishan', '117.12875', '34.80712');
INSERT INTO `tb_region` VALUES ('370827', '鱼台县', '370800', '鱼台', '4', '0537', '272300', '中国,山东省,济宁市,鱼台县', 'Yutai', '116.64761', '34.99674');
INSERT INTO `tb_region` VALUES ('370828', '金乡县', '370800', '金乡', '4', '0537', '272200', '中国,山东省,济宁市,金乡县', 'Jinxiang', '116.31146', '35.065');
INSERT INTO `tb_region` VALUES ('370829', '嘉祥县', '370800', '嘉祥', '4', '0537', '272400', '中国,山东省,济宁市,嘉祥县', 'Jiaxiang', '116.34249', '35.40836');
INSERT INTO `tb_region` VALUES ('370830', '汶上县', '370800', '汶上', '4', '0537', '272501', '中国,山东省,济宁市,汶上县', 'Wenshang', '116.48742', '35.73295');
INSERT INTO `tb_region` VALUES ('370831', '泗水县', '370800', '泗水', '4', '0537', '273200', '中国,山东省,济宁市,泗水县', 'Sishui', '117.27948', '35.66113');
INSERT INTO `tb_region` VALUES ('370832', '梁山县', '370800', '梁山', '4', '0537', '272600', '中国,山东省,济宁市,梁山县', 'Liangshan', '116.09683', '35.80322');
INSERT INTO `tb_region` VALUES ('370881', '曲阜市', '370800', '曲阜', '4', '0537', '273100', '中国,山东省,济宁市,曲阜市', 'Qufu', '116.98645', '35.58091');
INSERT INTO `tb_region` VALUES ('370883', '邹城市', '370800', '邹城', '4', '0537', '273500', '中国,山东省,济宁市,邹城市', 'Zoucheng', '116.97335', '35.40531');
INSERT INTO `tb_region` VALUES ('370900', '泰安市', '370000', '泰安', '3', '0538', '271000', '中国,山东省,泰安市', 'Tai\'an', '117.129063', '36.194968');
INSERT INTO `tb_region` VALUES ('370902', '泰山区', '370900', '泰山', '4', '0538', '271000', '中国,山东省,泰安市,泰山区', 'Taishan', '117.13446', '36.19411');
INSERT INTO `tb_region` VALUES ('370911', '岱岳区', '370900', '岱岳', '4', '0538', '271000', '中国,山东省,泰安市,岱岳区', 'Daiyue', '117.04174', '36.1875');
INSERT INTO `tb_region` VALUES ('370921', '宁阳县', '370900', '宁阳', '4', '0538', '271400', '中国,山东省,泰安市,宁阳县', 'Ningyang', '116.80542', '35.7599');
INSERT INTO `tb_region` VALUES ('370923', '东平县', '370900', '东平', '4', '0538', '271500', '中国,山东省,泰安市,东平县', 'Dongping', '116.47113', '35.93792');
INSERT INTO `tb_region` VALUES ('370982', '新泰市', '370900', '新泰', '4', '0538', '271200', '中国,山东省,泰安市,新泰市', 'Xintai', '117.76959', '35.90887');
INSERT INTO `tb_region` VALUES ('370983', '肥城市', '370900', '肥城', '4', '0538', '271600', '中国,山东省,泰安市,肥城市', 'Feicheng', '116.76815', '36.18247');
INSERT INTO `tb_region` VALUES ('371000', '威海市', '370000', '威海', '3', '0631', '264200', '中国,山东省,威海市', 'Weihai', '122.116394', '37.509691');
INSERT INTO `tb_region` VALUES ('371002', '环翠区', '371000', '环翠', '4', '0631', '264200', '中国,山东省,威海市,环翠区', 'Huancui', '122.12344', '37.50199');
INSERT INTO `tb_region` VALUES ('371003', '文登区', '371000', '文登', '4', '0631', '266440', '中国,山东省,威海市,文登区', 'Wendeng', '122.057139', '37.196211');
INSERT INTO `tb_region` VALUES ('371082', '荣成市', '371000', '荣成', '4', '0631', '264300', '中国,山东省,威海市,荣成市', 'Rongcheng', '122.48773', '37.1652');
INSERT INTO `tb_region` VALUES ('371083', '乳山市', '371000', '乳山', '4', '0631', '264500', '中国,山东省,威海市,乳山市', 'Rushan', '121.53814', '36.91918');
INSERT INTO `tb_region` VALUES ('371100', '日照市', '370000', '日照', '3', '0633', '276800', '中国,山东省,日照市', 'Rizhao', '119.461208', '35.428588');
INSERT INTO `tb_region` VALUES ('371102', '东港区', '371100', '东港', '4', '0633', '276800', '中国,山东省,日照市,东港区', 'Donggang', '119.46237', '35.42541');
INSERT INTO `tb_region` VALUES ('371103', '岚山区', '371100', '岚山', '4', '0633', '276808', '中国,山东省,日照市,岚山区', 'Lanshan', '119.31884', '35.12203');
INSERT INTO `tb_region` VALUES ('371121', '五莲县', '371100', '五莲', '4', '0633', '262300', '中国,山东省,日照市,五莲县', 'Wulian', '119.207', '35.75004');
INSERT INTO `tb_region` VALUES ('371122', '莒县', '371100', '莒县', '4', '0633', '276500', '中国,山东省,日照市,莒县', 'Juxian', '118.83789', '35.58054');
INSERT INTO `tb_region` VALUES ('371200', '莱芜市', '370000', '莱芜', '3', '0634', '271100', '中国,山东省,莱芜市', 'Laiwu', '117.677736', '36.214397');
INSERT INTO `tb_region` VALUES ('371202', '莱城区', '371200', '莱城', '4', '0634', '271199', '中国,山东省,莱芜市,莱城区', 'Laicheng', '117.65986', '36.2032');
INSERT INTO `tb_region` VALUES ('371203', '钢城区', '371200', '钢城', '4', '0634', '271100', '中国,山东省,莱芜市,钢城区', 'Gangcheng', '117.8049', '36.06319');
INSERT INTO `tb_region` VALUES ('371300', '临沂市', '370000', '临沂', '3', '0539', '253000', '中国,山东省,临沂市', 'Linyi', '118.326443', '35.065282');
INSERT INTO `tb_region` VALUES ('371302', '兰山区', '371300', '兰山', '4', '0539', '276002', '中国,山东省,临沂市,兰山区', 'Lanshan', '118.34817', '35.06872');
INSERT INTO `tb_region` VALUES ('371311', '罗庄区', '371300', '罗庄', '4', '0539', '276022', '中国,山东省,临沂市,罗庄区', 'Luozhuang', '118.28466', '34.99627');
INSERT INTO `tb_region` VALUES ('371312', '河东区', '371300', '河东', '4', '0539', '276034', '中国,山东省,临沂市,河东区', 'Hedong', '118.41055', '35.08803');
INSERT INTO `tb_region` VALUES ('371321', '沂南县', '371300', '沂南', '4', '0539', '276300', '中国,山东省,临沂市,沂南县', 'Yinan', '118.47061', '35.55131');
INSERT INTO `tb_region` VALUES ('371322', '郯城县', '371300', '郯城', '4', '0539', '276100', '中国,山东省,临沂市,郯城县', 'Tancheng', '118.36712', '34.61354');
INSERT INTO `tb_region` VALUES ('371323', '沂水县', '371300', '沂水', '4', '0539', '276400', '中国,山东省,临沂市,沂水县', 'Yishui', '118.63009', '35.78731');
INSERT INTO `tb_region` VALUES ('371324', '兰陵县', '371300', '兰陵', '4', '0539', '277700', '中国,山东省,临沂市,兰陵县', 'Lanling', '117.856592', '34.738315');
INSERT INTO `tb_region` VALUES ('371325', '费县', '371300', '费县', '4', '0539', '273400', '中国,山东省,临沂市,费县', 'Feixian', '117.97836', '35.26562');
INSERT INTO `tb_region` VALUES ('371326', '平邑县', '371300', '平邑', '4', '0539', '273300', '中国,山东省,临沂市,平邑县', 'Pingyi', '117.63867', '35.50573');
INSERT INTO `tb_region` VALUES ('371327', '莒南县', '371300', '莒南', '4', '0539', '276600', '中国,山东省,临沂市,莒南县', 'Junan', '118.83227', '35.17539');
INSERT INTO `tb_region` VALUES ('371328', '蒙阴县', '371300', '蒙阴', '4', '0539', '276200', '中国,山东省,临沂市,蒙阴县', 'Mengyin', '117.94592', '35.70996');
INSERT INTO `tb_region` VALUES ('371329', '临沭县', '371300', '临沭', '4', '0539', '276700', '中国,山东省,临沂市,临沭县', 'Linshu', '118.65267', '34.92091');
INSERT INTO `tb_region` VALUES ('371400', '德州市', '370000', '德州', '3', '0534', '253000', '中国,山东省,德州市', 'Dezhou', '116.307428', '37.453968');
INSERT INTO `tb_region` VALUES ('371402', '德城区', '371400', '德城', '4', '0534', '253012', '中国,山东省,德州市,德城区', 'Decheng', '116.29943', '37.45126');
INSERT INTO `tb_region` VALUES ('371403', '陵城区', '371400', '陵城', '4', '0534', '253500', '中国,山东省,德州市,陵城区', 'Lingcheng', '116.57601', '37.33571');
INSERT INTO `tb_region` VALUES ('371422', '宁津县', '371400', '宁津', '4', '0534', '253400', '中国,山东省,德州市,宁津县', 'Ningjin', '116.79702', '37.65301');
INSERT INTO `tb_region` VALUES ('371423', '庆云县', '371400', '庆云', '4', '0534', '253700', '中国,山东省,德州市,庆云县', 'Qingyun', '117.38635', '37.77616');
INSERT INTO `tb_region` VALUES ('371424', '临邑县', '371400', '临邑', '4', '0534', '251500', '中国,山东省,德州市,临邑县', 'Linyi', '116.86547', '37.19053');
INSERT INTO `tb_region` VALUES ('371425', '齐河县', '371400', '齐河', '4', '0534', '251100', '中国,山东省,德州市,齐河县', 'Qihe', '116.75515', '36.79532');
INSERT INTO `tb_region` VALUES ('371426', '平原县', '371400', '平原', '4', '0534', '253100', '中国,山东省,德州市,平原县', 'Pingyuan', '116.43432', '37.16632');
INSERT INTO `tb_region` VALUES ('371427', '夏津县', '371400', '夏津', '4', '0534', '253200', '中国,山东省,德州市,夏津县', 'Xiajin', '116.0017', '36.94852');
INSERT INTO `tb_region` VALUES ('371428', '武城县', '371400', '武城', '4', '0534', '253300', '中国,山东省,德州市,武城县', 'Wucheng', '116.07009', '37.21403');
INSERT INTO `tb_region` VALUES ('371481', '乐陵市', '371400', '乐陵', '4', '0534', '253600', '中国,山东省,德州市,乐陵市', 'Leling', '117.23141', '37.73164');
INSERT INTO `tb_region` VALUES ('371482', '禹城市', '371400', '禹城', '4', '0534', '251200', '中国,山东省,德州市,禹城市', 'Yucheng', '116.64309', '36.93444');
INSERT INTO `tb_region` VALUES ('371500', '聊城市', '370000', '聊城', '3', '0635', '252052', '中国,山东省,聊城市', 'Liaocheng', '115.980367', '36.456013');
INSERT INTO `tb_region` VALUES ('371502', '东昌府区', '371500', '东昌府', '4', '0635', '252000', '中国,山东省,聊城市,东昌府区', 'Dongchangfu', '115.97383', '36.44458');
INSERT INTO `tb_region` VALUES ('371521', '阳谷县', '371500', '阳谷', '4', '0635', '252300', '中国,山东省,聊城市,阳谷县', 'Yanggu', '115.79126', '36.11444');
INSERT INTO `tb_region` VALUES ('371522', '莘县', '371500', '莘县', '4', '0635', '252400', '中国,山东省,聊城市,莘县', 'Shenxian', '115.6697', '36.23423');
INSERT INTO `tb_region` VALUES ('371523', '茌平县', '371500', '茌平', '4', '0635', '252100', '中国,山东省,聊城市,茌平县', 'Chiping', '116.25491', '36.57969');
INSERT INTO `tb_region` VALUES ('371524', '东阿县', '371500', '东阿', '4', '0635', '252200', '中国,山东省,聊城市,东阿县', 'Dong\'e', '116.25012', '36.33209');
INSERT INTO `tb_region` VALUES ('371525', '冠县', '371500', '冠县', '4', '0635', '252500', '中国,山东省,聊城市,冠县', 'Guanxian', '115.44195', '36.48429');
INSERT INTO `tb_region` VALUES ('371526', '高唐县', '371500', '高唐', '4', '0635', '252800', '中国,山东省,聊城市,高唐县', 'Gaotang', '116.23172', '36.86535');
INSERT INTO `tb_region` VALUES ('371581', '临清市', '371500', '临清', '4', '0635', '252600', '中国,山东省,聊城市,临清市', 'Linqing', '115.70629', '36.83945');
INSERT INTO `tb_region` VALUES ('371600', '滨州市', '370000', '滨州', '3', '0543', '256619', '中国,山东省,滨州市', 'Binzhou', '118.016974', '37.383542');
INSERT INTO `tb_region` VALUES ('371602', '滨城区', '371600', '滨城', '4', '0543', '256613', '中国,山东省,滨州市,滨城区', 'Bincheng', '118.02026', '37.38524');
INSERT INTO `tb_region` VALUES ('371603', '沾化区', '371600', '沾化', '4', '0543', '256800', '中国,山东省,滨州市,沾化区', 'Zhanhua', '118.13214', '37.69832');
INSERT INTO `tb_region` VALUES ('371621', '惠民县', '371600', '惠民', '4', '0543', '251700', '中国,山东省,滨州市,惠民县', 'Huimin', '117.51113', '37.49013');
INSERT INTO `tb_region` VALUES ('371622', '阳信县', '371600', '阳信', '4', '0543', '251800', '中国,山东省,滨州市,阳信县', 'Yangxin', '117.58139', '37.64198');
INSERT INTO `tb_region` VALUES ('371623', '无棣县', '371600', '无棣', '4', '0543', '251900', '中国,山东省,滨州市,无棣县', 'Wudi', '117.61395', '37.74009');
INSERT INTO `tb_region` VALUES ('371625', '博兴县', '371600', '博兴', '4', '0543', '256500', '中国,山东省,滨州市,博兴县', 'Boxing', '118.1336', '37.14316');
INSERT INTO `tb_region` VALUES ('371626', '邹平县', '371600', '邹平', '4', '0543', '256200', '中国,山东省,滨州市,邹平县', 'Zouping', '117.74307', '36.86295');
INSERT INTO `tb_region` VALUES ('371627', '北海新区', '371600', '北海新区', '4', '0543', '256200', '中国,山东省,滨州市,北海新区', 'Beihaixinqu', '118.016974', '37.383542');
INSERT INTO `tb_region` VALUES ('371700', '菏泽市', '370000', '菏泽', '3', '0530', '274020', '中国,山东省,菏泽市', 'Heze', '115.469381', '35.246531');
INSERT INTO `tb_region` VALUES ('371702', '牡丹区', '371700', '牡丹', '4', '0530', '274009', '中国,山东省,菏泽市,牡丹区', 'Mudan', '115.41662', '35.25091');
INSERT INTO `tb_region` VALUES ('371721', '曹县', '371700', '曹县', '4', '0530', '274400', '中国,山东省,菏泽市,曹县', 'Caoxian', '115.54226', '34.82659');
INSERT INTO `tb_region` VALUES ('371722', '单县', '371700', '单县', '4', '0530', '273700', '中国,山东省,菏泽市,单县', 'Shanxian', '116.08703', '34.79514');
INSERT INTO `tb_region` VALUES ('371723', '成武县', '371700', '成武', '4', '0530', '274200', '中国,山东省,菏泽市,成武县', 'Chengwu', '115.8897', '34.95332');
INSERT INTO `tb_region` VALUES ('371724', '巨野县', '371700', '巨野', '4', '0530', '274900', '中国,山东省,菏泽市,巨野县', 'Juye', '116.09497', '35.39788');
INSERT INTO `tb_region` VALUES ('371725', '郓城县', '371700', '郓城', '4', '0530', '274700', '中国,山东省,菏泽市,郓城县', 'Yuncheng', '115.94439', '35.60044');
INSERT INTO `tb_region` VALUES ('371726', '鄄城县', '371700', '鄄城', '4', '0530', '274600', '中国,山东省,菏泽市,鄄城县', 'Juancheng', '115.50997', '35.56412');
INSERT INTO `tb_region` VALUES ('371727', '定陶县', '371700', '定陶', '4', '0530', '274100', '中国,山东省,菏泽市,定陶县', 'Dingtao', '115.57287', '35.07118');
INSERT INTO `tb_region` VALUES ('371728', '东明县', '371700', '东明', '4', '0530', '274500', '中国,山东省,菏泽市,东明县', 'Dongming', '115.09079', '35.28906');
INSERT INTO `tb_region` VALUES ('410000', '河南省', '100003', '河南', '2', '', '', '中国,河南省', 'Henan', '113.665412', '34.757975');
INSERT INTO `tb_region` VALUES ('410100', '郑州市', '410000', '郑州', '3', '0371', '450000', '中国,河南省,郑州市', 'Zhengzhou', '113.665412', '34.757975');
INSERT INTO `tb_region` VALUES ('410102', '中原区', '410100', '中原', '4', '0371', '450007', '中国,河南省,郑州市,中原区', 'Zhongyuan', '113.61333', '34.74827');
INSERT INTO `tb_region` VALUES ('410103', '二七区', '410100', '二七', '4', '0371', '450052', '中国,河南省,郑州市,二七区', 'Erqi', '113.63931', '34.72336');
INSERT INTO `tb_region` VALUES ('410104', '管城回族区', '410100', '管城', '4', '0371', '450000', '中国,河南省,郑州市,管城回族区', 'Guancheng', '113.67734', '34.75383');
INSERT INTO `tb_region` VALUES ('410105', '金水区', '410100', '金水', '4', '0371', '450003', '中国,河南省,郑州市,金水区', 'Jinshui', '113.66057', '34.80028');
INSERT INTO `tb_region` VALUES ('410106', '上街区', '410100', '上街', '4', '0371', '450041', '中国,河南省,郑州市,上街区', 'Shangjie', '113.30897', '34.80276');
INSERT INTO `tb_region` VALUES ('410108', '惠济区', '410100', '惠济', '4', '0371', '450053', '中国,河南省,郑州市,惠济区', 'Huiji', '113.61688', '34.86735');
INSERT INTO `tb_region` VALUES ('410122', '中牟县', '410100', '中牟', '4', '0371', '451450', '中国,河南省,郑州市,中牟县', 'Zhongmu', '113.97619', '34.71899');
INSERT INTO `tb_region` VALUES ('410181', '巩义市', '410100', '巩义', '4', '0371', '451200', '中国,河南省,郑州市,巩义市', 'Gongyi', '113.022', '34.74794');
INSERT INTO `tb_region` VALUES ('410182', '荥阳市', '410100', '荥阳', '4', '0371', '450100', '中国,河南省,郑州市,荥阳市', 'Xingyang', '113.38345', '34.78759');
INSERT INTO `tb_region` VALUES ('410183', '新密市', '410100', '新密', '4', '0371', '452300', '中国,河南省,郑州市,新密市', 'Xinmi', '113.3869', '34.53704');
INSERT INTO `tb_region` VALUES ('410184', '新郑市', '410100', '新郑', '4', '0371', '451100', '中国,河南省,郑州市,新郑市', 'Xinzheng', '113.73645', '34.3955');
INSERT INTO `tb_region` VALUES ('410185', '登封市', '410100', '登封', '4', '0371', '452470', '中国,河南省,郑州市,登封市', 'Dengfeng', '113.05023', '34.45345');
INSERT INTO `tb_region` VALUES ('410200', '开封市', '410000', '开封', '3', '0378', '475001', '中国,河南省,开封市', 'Kaifeng', '114.341447', '34.797049');
INSERT INTO `tb_region` VALUES ('410202', '龙亭区', '410200', '龙亭', '4', '0378', '475100', '中国,河南省,开封市,龙亭区', 'Longting', '114.35484', '34.79995');
INSERT INTO `tb_region` VALUES ('410203', '顺河回族区', '410200', '顺河', '4', '0378', '475000', '中国,河南省,开封市,顺河回族区', 'Shunhe', '114.36123', '34.79586');
INSERT INTO `tb_region` VALUES ('410204', '鼓楼区', '410200', '鼓楼', '4', '0378', '475000', '中国,河南省,开封市,鼓楼区', 'Gulou', '114.35559', '34.79517');
INSERT INTO `tb_region` VALUES ('410205', '禹王台区', '410200', '禹王台', '4', '0378', '475003', '中国,河南省,开封市,禹王台区', 'Yuwangtai', '114.34787', '34.77693');
INSERT INTO `tb_region` VALUES ('410212', '祥符区', '410200', '祥符', '4', '0378', '475100', '中国,河南省,开封市,祥符区', 'Xiangfu', '114.43859', '34.75874');
INSERT INTO `tb_region` VALUES ('410221', '杞县', '410200', '杞县', '4', '0378', '475200', '中国,河南省,开封市,杞县', 'Qixian', '114.7828', '34.55033');
INSERT INTO `tb_region` VALUES ('410222', '通许县', '410200', '通许', '4', '0378', '475400', '中国,河南省,开封市,通许县', 'Tongxu', '114.46716', '34.47522');
INSERT INTO `tb_region` VALUES ('410223', '尉氏县', '410200', '尉氏', '4', '0378', '475500', '中国,河南省,开封市,尉氏县', 'Weishi', '114.19284', '34.41223');
INSERT INTO `tb_region` VALUES ('410225', '兰考县', '410200', '兰考', '4', '0378', '475300', '中国,河南省,开封市,兰考县', 'Lankao', '114.81961', '34.8235');
INSERT INTO `tb_region` VALUES ('410300', '洛阳市', '410000', '洛阳', '3', '0379', '471000', '中国,河南省,洛阳市', 'Luoyang', '112.434468', '34.663041');
INSERT INTO `tb_region` VALUES ('410302', '老城区', '410300', '老城', '4', '0379', '471002', '中国,河南省,洛阳市,老城区', 'Laocheng', '112.46902', '34.68364');
INSERT INTO `tb_region` VALUES ('410303', '西工区', '410300', '西工', '4', '0379', '471000', '中国,河南省,洛阳市,西工区', 'Xigong', '112.4371', '34.67');
INSERT INTO `tb_region` VALUES ('410304', '瀍河回族区', '410300', '瀍河', '4', '0379', '471002', '中国,河南省,洛阳市,瀍河回族区', 'Chanhe', '112.50018', '34.67985');
INSERT INTO `tb_region` VALUES ('410305', '涧西区', '410300', '涧西', '4', '0379', '471003', '中国,河南省,洛阳市,涧西区', 'Jianxi', '112.39588', '34.65823');
INSERT INTO `tb_region` VALUES ('410306', '吉利区', '410300', '吉利', '4', '0379', '471012', '中国,河南省,洛阳市,吉利区', 'Jili', '112.58905', '34.90088');
INSERT INTO `tb_region` VALUES ('410311', '洛龙区', '410300', '洛龙', '4', '0379', '471000', '中国,河南省,洛阳市,洛龙区', 'Luolong', '112.46412', '34.61866');
INSERT INTO `tb_region` VALUES ('410322', '孟津县', '410300', '孟津', '4', '0379', '471100', '中国,河南省,洛阳市,孟津县', 'Mengjin', '112.44351', '34.826');
INSERT INTO `tb_region` VALUES ('410323', '新安县', '410300', '新安', '4', '0379', '471800', '中国,河南省,洛阳市,新安县', 'Xin\'an', '112.13238', '34.72814');
INSERT INTO `tb_region` VALUES ('410324', '栾川县', '410300', '栾川', '4', '0379', '471500', '中国,河南省,洛阳市,栾川县', 'Luanchuan', '111.61779', '33.78576');
INSERT INTO `tb_region` VALUES ('410325', '嵩县', '410300', '嵩县', '4', '0379', '471400', '中国,河南省,洛阳市,嵩县', 'Songxian', '112.08526', '34.13466');
INSERT INTO `tb_region` VALUES ('410326', '汝阳县', '410300', '汝阳', '4', '0379', '471200', '中国,河南省,洛阳市,汝阳县', 'Ruyang', '112.47314', '34.15387');
INSERT INTO `tb_region` VALUES ('410327', '宜阳县', '410300', '宜阳', '4', '0379', '471600', '中国,河南省,洛阳市,宜阳县', 'Yiyang', '112.17907', '34.51523');
INSERT INTO `tb_region` VALUES ('410328', '洛宁县', '410300', '洛宁', '4', '0379', '471700', '中国,河南省,洛阳市,洛宁县', 'Luoning', '111.65087', '34.38913');
INSERT INTO `tb_region` VALUES ('410329', '伊川县', '410300', '伊川', '4', '0379', '471300', '中国,河南省,洛阳市,伊川县', 'Yichuan', '112.42947', '34.42205');
INSERT INTO `tb_region` VALUES ('410381', '偃师市', '410300', '偃师', '4', '0379', '471900', '中国,河南省,洛阳市,偃师市', 'Yanshi', '112.7922', '34.7281');
INSERT INTO `tb_region` VALUES ('410400', '平顶山市', '410000', '平顶山', '3', '0375', '467000', '中国,河南省,平顶山市', 'Pingdingshan', '113.307718', '33.735241');
INSERT INTO `tb_region` VALUES ('410402', '新华区', '410400', '新华', '4', '0375', '467002', '中国,河南省,平顶山市,新华区', 'Xinhua', '113.29402', '33.7373');
INSERT INTO `tb_region` VALUES ('410403', '卫东区', '410400', '卫东', '4', '0375', '467021', '中国,河南省,平顶山市,卫东区', 'Weidong', '113.33511', '33.73472');
INSERT INTO `tb_region` VALUES ('410404', '石龙区', '410400', '石龙', '4', '0375', '467045', '中国,河南省,平顶山市,石龙区', 'Shilong', '112.89879', '33.89878');
INSERT INTO `tb_region` VALUES ('410411', '湛河区', '410400', '湛河', '4', '0375', '467000', '中国,河南省,平顶山市,湛河区', 'Zhanhe', '113.29252', '33.7362');
INSERT INTO `tb_region` VALUES ('410421', '宝丰县', '410400', '宝丰', '4', '0375', '467400', '中国,河南省,平顶山市,宝丰县', 'Baofeng', '113.05493', '33.86916');
INSERT INTO `tb_region` VALUES ('410422', '叶县', '410400', '叶县', '4', '0375', '467200', '中国,河南省,平顶山市,叶县', 'Yexian', '113.35104', '33.62225');
INSERT INTO `tb_region` VALUES ('410423', '鲁山县', '410400', '鲁山', '4', '0375', '467300', '中国,河南省,平顶山市,鲁山县', 'Lushan', '112.9057', '33.73879');
INSERT INTO `tb_region` VALUES ('410425', '郏县', '410400', '郏县', '4', '0375', '467100', '中国,河南省,平顶山市,郏县', 'Jiaxian', '113.21588', '33.97072');
INSERT INTO `tb_region` VALUES ('410481', '舞钢市', '410400', '舞钢', '4', '0375', '462500', '中国,河南省,平顶山市,舞钢市', 'Wugang', '113.52417', '33.2938');
INSERT INTO `tb_region` VALUES ('410482', '汝州市', '410400', '汝州', '4', '0375', '467500', '中国,河南省,平顶山市,汝州市', 'Ruzhou', '112.84301', '34.16135');
INSERT INTO `tb_region` VALUES ('410500', '安阳市', '410000', '安阳', '3', '0372', '455000', '中国,河南省,安阳市', 'Anyang', '114.352482', '36.103442');
INSERT INTO `tb_region` VALUES ('410502', '文峰区', '410500', '文峰', '4', '0372', '455000', '中国,河南省,安阳市,文峰区', 'Wenfeng', '114.35708', '36.09046');
INSERT INTO `tb_region` VALUES ('410503', '北关区', '410500', '北关', '4', '0372', '455001', '中国,河南省,安阳市,北关区', 'Beiguan', '114.35735', '36.11872');
INSERT INTO `tb_region` VALUES ('410505', '殷都区', '410500', '殷都', '4', '0372', '455004', '中国,河南省,安阳市,殷都区', 'Yindu', '114.3034', '36.1099');
INSERT INTO `tb_region` VALUES ('410506', '龙安区', '410500', '龙安', '4', '0372', '455001', '中国,河南省,安阳市,龙安区', 'Long\'an', '114.34814', '36.11904');
INSERT INTO `tb_region` VALUES ('410522', '安阳县', '410500', '安阳', '4', '0372', '455000', '中国,河南省,安阳市,安阳县', 'Anyang', '114.36605', '36.06695');
INSERT INTO `tb_region` VALUES ('410523', '汤阴县', '410500', '汤阴', '4', '0372', '456150', '中国,河南省,安阳市,汤阴县', 'Tangyin', '114.35839', '35.92152');
INSERT INTO `tb_region` VALUES ('410526', '滑县', '410500', '滑县', '4', '0372', '456400', '中国,河南省,安阳市,滑县', 'Huaxian', '114.52066', '35.5807');
INSERT INTO `tb_region` VALUES ('410527', '内黄县', '410500', '内黄', '4', '0372', '456350', '中国,河南省,安阳市,内黄县', 'Neihuang', '114.90673', '35.95269');
INSERT INTO `tb_region` VALUES ('410581', '林州市', '410500', '林州', '4', '0372', '456550', '中国,河南省,安阳市,林州市', 'Linzhou', '113.81558', '36.07804');
INSERT INTO `tb_region` VALUES ('410600', '鹤壁市', '410000', '鹤壁', '3', '0392', '458030', '中国,河南省,鹤壁市', 'Hebi', '114.295444', '35.748236');
INSERT INTO `tb_region` VALUES ('410602', '鹤山区', '410600', '鹤山', '4', '0392', '458010', '中国,河南省,鹤壁市,鹤山区', 'Heshan', '114.16336', '35.95458');
INSERT INTO `tb_region` VALUES ('410603', '山城区', '410600', '山城', '4', '0392', '458000', '中国,河南省,鹤壁市,山城区', 'Shancheng', '114.18443', '35.89773');
INSERT INTO `tb_region` VALUES ('410611', '淇滨区', '410600', '淇滨', '4', '0392', '458000', '中国,河南省,鹤壁市,淇滨区', 'Qibin', '114.29867', '35.74127');
INSERT INTO `tb_region` VALUES ('410621', '浚县', '410600', '浚县', '4', '0392', '456250', '中国,河南省,鹤壁市,浚县', 'Xunxian', '114.54879', '35.67085');
INSERT INTO `tb_region` VALUES ('410622', '淇县', '410600', '淇县', '4', '0392', '456750', '中国,河南省,鹤壁市,淇县', 'Qixian', '114.1976', '35.60782');
INSERT INTO `tb_region` VALUES ('410700', '新乡市', '410000', '新乡', '3', '0373', '453000', '中国,河南省,新乡市', 'Xinxiang', '113.883991', '35.302616');
INSERT INTO `tb_region` VALUES ('410702', '红旗区', '410700', '红旗', '4', '0373', '453000', '中国,河南省,新乡市,红旗区', 'Hongqi', '113.87523', '35.30367');
INSERT INTO `tb_region` VALUES ('410703', '卫滨区', '410700', '卫滨', '4', '0373', '453000', '中国,河南省,新乡市,卫滨区', 'Weibin', '113.86578', '35.30211');
INSERT INTO `tb_region` VALUES ('410704', '凤泉区', '410700', '凤泉', '4', '0373', '453011', '中国,河南省,新乡市,凤泉区', 'Fengquan', '113.91507', '35.38399');
INSERT INTO `tb_region` VALUES ('410711', '牧野区', '410700', '牧野', '4', '0373', '453002', '中国,河南省,新乡市,牧野区', 'Muye', '113.9086', '35.3149');
INSERT INTO `tb_region` VALUES ('410721', '新乡县', '410700', '新乡', '4', '0373', '453700', '中国,河南省,新乡市,新乡县', 'Xinxiang', '113.80511', '35.19075');
INSERT INTO `tb_region` VALUES ('410724', '获嘉县', '410700', '获嘉', '4', '0373', '453800', '中国,河南省,新乡市,获嘉县', 'Huojia', '113.66159', '35.26521');
INSERT INTO `tb_region` VALUES ('410725', '原阳县', '410700', '原阳', '4', '0373', '453500', '中国,河南省,新乡市,原阳县', 'Yuanyang', '113.93994', '35.06565');
INSERT INTO `tb_region` VALUES ('410726', '延津县', '410700', '延津', '4', '0373', '453200', '中国,河南省,新乡市,延津县', 'Yanjin', '114.20266', '35.14327');
INSERT INTO `tb_region` VALUES ('410727', '封丘县', '410700', '封丘', '4', '0373', '453300', '中国,河南省,新乡市,封丘县', 'Fengqiu', '114.41915', '35.04166');
INSERT INTO `tb_region` VALUES ('410728', '长垣县', '410700', '长垣', '4', '0373', '453400', '中国,河南省,新乡市,长垣县', 'Changyuan', '114.66882', '35.20046');
INSERT INTO `tb_region` VALUES ('410781', '卫辉市', '410700', '卫辉', '4', '0373', '453100', '中国,河南省,新乡市,卫辉市', 'Weihui', '114.06454', '35.39843');
INSERT INTO `tb_region` VALUES ('410782', '辉县市', '410700', '辉县', '4', '0373', '453600', '中国,河南省,新乡市,辉县市', 'Huixian', '113.8067', '35.46307');
INSERT INTO `tb_region` VALUES ('410800', '焦作市', '410000', '焦作', '3', '0391', '454002', '中国,河南省,焦作市', 'Jiaozuo', '113.238266', '35.23904');
INSERT INTO `tb_region` VALUES ('410802', '解放区', '410800', '解放', '4', '0391', '454000', '中国,河南省,焦作市,解放区', 'Jiefang', '113.22933', '35.24023');
INSERT INTO `tb_region` VALUES ('410803', '中站区', '410800', '中站', '4', '0391', '454191', '中国,河南省,焦作市,中站区', 'Zhongzhan', '113.18315', '35.23665');
INSERT INTO `tb_region` VALUES ('410804', '马村区', '410800', '马村', '4', '0391', '454171', '中国,河南省,焦作市,马村区', 'Macun', '113.3187', '35.26908');
INSERT INTO `tb_region` VALUES ('410811', '山阳区', '410800', '山阳', '4', '0391', '454002', '中国,河南省,焦作市,山阳区', 'Shanyang', '113.25464', '35.21436');
INSERT INTO `tb_region` VALUES ('410821', '修武县', '410800', '修武', '4', '0391', '454350', '中国,河南省,焦作市,修武县', 'Xiuwu', '113.44775', '35.22357');
INSERT INTO `tb_region` VALUES ('410822', '博爱县', '410800', '博爱', '4', '0391', '454450', '中国,河南省,焦作市,博爱县', 'Boai', '113.06698', '35.16943');
INSERT INTO `tb_region` VALUES ('410823', '武陟县', '410800', '武陟', '4', '0391', '454950', '中国,河南省,焦作市,武陟县', 'Wuzhi', '113.39718', '35.09505');
INSERT INTO `tb_region` VALUES ('410825', '温县', '410800', '温县', '4', '0391', '454850', '中国,河南省,焦作市,温县', 'Wenxian', '113.08065', '34.94022');
INSERT INTO `tb_region` VALUES ('410882', '沁阳市', '410800', '沁阳', '4', '0391', '454550', '中国,河南省,焦作市,沁阳市', 'Qinyang', '112.94494', '35.08935');
INSERT INTO `tb_region` VALUES ('410883', '孟州市', '410800', '孟州', '4', '0391', '454750', '中国,河南省,焦作市,孟州市', 'Mengzhou', '112.79138', '34.9071');
INSERT INTO `tb_region` VALUES ('410900', '濮阳市', '410000', '濮阳', '3', '0393', '457000', '中国,河南省,濮阳市', 'Puyang', '115.041299', '35.768234');
INSERT INTO `tb_region` VALUES ('410902', '华龙区', '410900', '华龙', '4', '0393', '457001', '中国,河南省,濮阳市,华龙区', 'Hualong', '115.07446', '35.77736');
INSERT INTO `tb_region` VALUES ('410922', '清丰县', '410900', '清丰', '4', '0393', '457300', '中国,河南省,濮阳市,清丰县', 'Qingfeng', '115.10415', '35.88507');
INSERT INTO `tb_region` VALUES ('410923', '南乐县', '410900', '南乐', '4', '0393', '457400', '中国,河南省,濮阳市,南乐县', 'Nanle', '115.20639', '36.07686');
INSERT INTO `tb_region` VALUES ('410926', '范县', '410900', '范县', '4', '0393', '457500', '中国,河南省,濮阳市,范县', 'Fanxian', '115.50405', '35.85178');
INSERT INTO `tb_region` VALUES ('410927', '台前县', '410900', '台前', '4', '0393', '457600', '中国,河南省,濮阳市,台前县', 'Taiqian', '115.87158', '35.96923');
INSERT INTO `tb_region` VALUES ('410928', '濮阳县', '410900', '濮阳', '4', '0393', '457100', '中国,河南省,濮阳市,濮阳县', 'Puyang', '115.03057', '35.70745');
INSERT INTO `tb_region` VALUES ('411000', '许昌市', '410000', '许昌', '3', '0374', '461000', '中国,河南省,许昌市', 'Xuchang', '113.826063', '34.022956');
INSERT INTO `tb_region` VALUES ('411002', '魏都区', '411000', '魏都', '4', '0374', '461000', '中国,河南省,许昌市,魏都区', 'Weidu', '113.8227', '34.02544');
INSERT INTO `tb_region` VALUES ('411023', '许昌县', '411000', '许昌', '4', '0374', '461100', '中国,河南省,许昌市,许昌县', 'Xuchang', '113.84707', '34.00406');
INSERT INTO `tb_region` VALUES ('411024', '鄢陵县', '411000', '鄢陵', '4', '0374', '461200', '中国,河南省,许昌市,鄢陵县', 'Yanling', '114.18795', '34.10317');
INSERT INTO `tb_region` VALUES ('411025', '襄城县', '411000', '襄城', '4', '0374', '461700', '中国,河南省,许昌市,襄城县', 'Xiangcheng', '113.48196', '33.84928');
INSERT INTO `tb_region` VALUES ('411081', '禹州市', '411000', '禹州', '4', '0374', '461670', '中国,河南省,许昌市,禹州市', 'Yuzhou', '113.48803', '34.14054');
INSERT INTO `tb_region` VALUES ('411082', '长葛市', '411000', '长葛', '4', '0374', '461500', '中国,河南省,许昌市,长葛市', 'Changge', '113.77328', '34.21846');
INSERT INTO `tb_region` VALUES ('411100', '漯河市', '410000', '漯河', '3', '0395', '462000', '中国,河南省,漯河市', 'Luohe', '114.026405', '33.575855');
INSERT INTO `tb_region` VALUES ('411102', '源汇区', '411100', '源汇', '4', '0395', '462000', '中国,河南省,漯河市,源汇区', 'Yuanhui', '114.00647', '33.55627');
INSERT INTO `tb_region` VALUES ('411103', '郾城区', '411100', '郾城', '4', '0395', '462300', '中国,河南省,漯河市,郾城区', 'Yancheng', '114.00694', '33.58723');
INSERT INTO `tb_region` VALUES ('411104', '召陵区', '411100', '召陵', '4', '0395', '462300', '中国,河南省,漯河市,召陵区', 'Zhaoling', '114.09399', '33.58601');
INSERT INTO `tb_region` VALUES ('411121', '舞阳县', '411100', '舞阳', '4', '0395', '462400', '中国,河南省,漯河市,舞阳县', 'Wuyang', '113.59848', '33.43243');
INSERT INTO `tb_region` VALUES ('411122', '临颍县', '411100', '临颍', '4', '0395', '462600', '中国,河南省,漯河市,临颍县', 'Linying', '113.93661', '33.81123');
INSERT INTO `tb_region` VALUES ('411200', '三门峡市', '410000', '三门峡', '3', '0398', '472000', '中国,河南省,三门峡市', 'Sanmenxia', '111.194099', '34.777338');
INSERT INTO `tb_region` VALUES ('411202', '湖滨区', '411200', '湖滨', '4', '0398', '472000', '中国,河南省,三门峡市,湖滨区', 'Hubin', '111.20006', '34.77872');
INSERT INTO `tb_region` VALUES ('411221', '渑池县', '411200', '渑池', '4', '0398', '472400', '中国,河南省,三门峡市,渑池县', 'Mianchi', '111.76184', '34.76725');
INSERT INTO `tb_region` VALUES ('411222', '陕县', '411200', '陕县', '4', '0398', '472100', '中国,河南省,三门峡市,陕县', 'Shanxian', '111.10333', '34.72052');
INSERT INTO `tb_region` VALUES ('411224', '卢氏县', '411200', '卢氏', '4', '0398', '472200', '中国,河南省,三门峡市,卢氏县', 'Lushi', '111.04782', '34.05436');
INSERT INTO `tb_region` VALUES ('411281', '义马市', '411200', '义马', '4', '0398', '472300', '中国,河南省,三门峡市,义马市', 'Yima', '111.87445', '34.74721');
INSERT INTO `tb_region` VALUES ('411282', '灵宝市', '411200', '灵宝', '4', '0398', '472500', '中国,河南省,三门峡市,灵宝市', 'Lingbao', '110.8945', '34.51682');
INSERT INTO `tb_region` VALUES ('411300', '南阳市', '410000', '南阳', '3', '0377', '473002', '中国,河南省,南阳市', 'Nanyang', '112.540918', '32.999082');
INSERT INTO `tb_region` VALUES ('411302', '宛城区', '411300', '宛城', '4', '0377', '473001', '中国,河南省,南阳市,宛城区', 'Wancheng', '112.53955', '33.00378');
INSERT INTO `tb_region` VALUES ('411303', '卧龙区', '411300', '卧龙', '4', '0377', '473003', '中国,河南省,南阳市,卧龙区', 'Wolong', '112.53479', '32.98615');
INSERT INTO `tb_region` VALUES ('411321', '南召县', '411300', '南召', '4', '0377', '474650', '中国,河南省,南阳市,南召县', 'Nanzhao', '112.43194', '33.49098');
INSERT INTO `tb_region` VALUES ('411322', '方城县', '411300', '方城', '4', '0377', '473200', '中国,河南省,南阳市,方城县', 'Fangcheng', '113.01269', '33.25453');
INSERT INTO `tb_region` VALUES ('411323', '西峡县', '411300', '西峡', '4', '0377', '474550', '中国,河南省,南阳市,西峡县', 'Xixia', '111.48187', '33.29772');
INSERT INTO `tb_region` VALUES ('411324', '镇平县', '411300', '镇平', '4', '0377', '474250', '中国,河南省,南阳市,镇平县', 'Zhenping', '112.2398', '33.03629');
INSERT INTO `tb_region` VALUES ('411325', '内乡县', '411300', '内乡', '4', '0377', '474350', '中国,河南省,南阳市,内乡县', 'Neixiang', '111.84957', '33.04671');
INSERT INTO `tb_region` VALUES ('411326', '淅川县', '411300', '淅川', '4', '0377', '474450', '中国,河南省,南阳市,淅川县', 'Xichuan', '111.48663', '33.13708');
INSERT INTO `tb_region` VALUES ('411327', '社旗县', '411300', '社旗', '4', '0377', '473300', '中国,河南省,南阳市,社旗县', 'Sheqi', '112.94656', '33.05503');
INSERT INTO `tb_region` VALUES ('411328', '唐河县', '411300', '唐河', '4', '0377', '473400', '中国,河南省,南阳市,唐河县', 'Tanghe', '112.83609', '32.69453');
INSERT INTO `tb_region` VALUES ('411329', '新野县', '411300', '新野', '4', '0377', '473500', '中国,河南省,南阳市,新野县', 'Xinye', '112.36151', '32.51698');
INSERT INTO `tb_region` VALUES ('411330', '桐柏县', '411300', '桐柏', '4', '0377', '474750', '中国,河南省,南阳市,桐柏县', 'Tongbai', '113.42886', '32.37917');
INSERT INTO `tb_region` VALUES ('411381', '邓州市', '411300', '邓州', '4', '0377', '474150', '中国,河南省,南阳市,邓州市', 'Dengzhou', '112.0896', '32.68577');
INSERT INTO `tb_region` VALUES ('411400', '商丘市', '410000', '商丘', '3', '0370', '476000', '中国,河南省,商丘市', 'Shangqiu', '115.650497', '34.437054');
INSERT INTO `tb_region` VALUES ('411402', '梁园区', '411400', '梁园', '4', '0370', '476000', '中国,河南省,商丘市,梁园区', 'Liangyuan', '115.64487', '34.44341');
INSERT INTO `tb_region` VALUES ('411403', '睢阳区', '411400', '睢阳', '4', '0370', '476100', '中国,河南省,商丘市,睢阳区', 'Suiyang', '115.65338', '34.38804');
INSERT INTO `tb_region` VALUES ('411421', '民权县', '411400', '民权', '4', '0370', '476800', '中国,河南省,商丘市,民权县', 'Minquan', '115.14621', '34.64931');
INSERT INTO `tb_region` VALUES ('411422', '睢县', '411400', '睢县', '4', '0370', '476900', '中国,河南省,商丘市,睢县', 'Suixian', '115.07168', '34.44539');
INSERT INTO `tb_region` VALUES ('411423', '宁陵县', '411400', '宁陵', '4', '0370', '476700', '中国,河南省,商丘市,宁陵县', 'Ningling', '115.30511', '34.45463');
INSERT INTO `tb_region` VALUES ('411424', '柘城县', '411400', '柘城', '4', '0370', '476200', '中国,河南省,商丘市,柘城县', 'Zhecheng', '115.30538', '34.0911');
INSERT INTO `tb_region` VALUES ('411425', '虞城县', '411400', '虞城', '4', '0370', '476300', '中国,河南省,商丘市,虞城县', 'Yucheng', '115.86337', '34.40189');
INSERT INTO `tb_region` VALUES ('411426', '夏邑县', '411400', '夏邑', '4', '0370', '476400', '中国,河南省,商丘市,夏邑县', 'Xiayi', '116.13348', '34.23242');
INSERT INTO `tb_region` VALUES ('411481', '永城市', '411400', '永城', '4', '0370', '476600', '中国,河南省,商丘市,永城市', 'Yongcheng', '116.44943', '33.92911');
INSERT INTO `tb_region` VALUES ('411500', '信阳市', '410000', '信阳', '3', '0376', '464000', '中国,河南省,信阳市', 'Xinyang', '114.075031', '32.123274');
INSERT INTO `tb_region` VALUES ('411502', '浉河区', '411500', '浉河', '4', '0376', '464000', '中国,河南省,信阳市,浉河区', 'Shihe', '114.05871', '32.1168');
INSERT INTO `tb_region` VALUES ('411503', '平桥区', '411500', '平桥', '4', '0376', '464100', '中国,河南省,信阳市,平桥区', 'Pingqiao', '114.12435', '32.10095');
INSERT INTO `tb_region` VALUES ('411521', '罗山县', '411500', '罗山', '4', '0376', '464200', '中国,河南省,信阳市,罗山县', 'Luoshan', '114.5314', '32.20277');
INSERT INTO `tb_region` VALUES ('411522', '光山县', '411500', '光山', '4', '0376', '465450', '中国,河南省,信阳市,光山县', 'Guangshan', '114.91873', '32.00992');
INSERT INTO `tb_region` VALUES ('411523', '新县', '411500', '新县', '4', '0376', '465550', '中国,河南省,信阳市,新县', 'Xinxian', '114.87924', '31.64386');
INSERT INTO `tb_region` VALUES ('411524', '商城县', '411500', '商城', '4', '0376', '465350', '中国,河南省,信阳市,商城县', 'Shangcheng', '115.40856', '31.79986');
INSERT INTO `tb_region` VALUES ('411525', '固始县', '411500', '固始', '4', '0376', '465250', '中国,河南省,信阳市,固始县', 'Gushi', '115.68298', '32.18011');
INSERT INTO `tb_region` VALUES ('411526', '潢川县', '411500', '潢川', '4', '0376', '465150', '中国,河南省,信阳市,潢川县', 'Huangchuan', '115.04696', '32.13763');
INSERT INTO `tb_region` VALUES ('411527', '淮滨县', '411500', '淮滨', '4', '0376', '464400', '中国,河南省,信阳市,淮滨县', 'Huaibin', '115.4205', '32.46614');
INSERT INTO `tb_region` VALUES ('411528', '息县', '411500', '息县', '4', '0376', '464300', '中国,河南省,信阳市,息县', 'Xixian', '114.7402', '32.34279');
INSERT INTO `tb_region` VALUES ('411600', '周口市', '410000', '周口', '3', '0394', '466000', '中国,河南省,周口市', 'Zhoukou', '114.649653', '33.620357');
INSERT INTO `tb_region` VALUES ('411602', '川汇区', '411600', '川汇', '4', '0394', '466000', '中国,河南省,周口市,川汇区', 'Chuanhui', '114.64202', '33.6256');
INSERT INTO `tb_region` VALUES ('411621', '扶沟县', '411600', '扶沟', '4', '0394', '461300', '中国,河南省,周口市,扶沟县', 'Fugou', '114.39477', '34.05999');
INSERT INTO `tb_region` VALUES ('411622', '西华县', '411600', '西华', '4', '0394', '466600', '中国,河南省,周口市,西华县', 'Xihua', '114.52279', '33.78548');
INSERT INTO `tb_region` VALUES ('411623', '商水县', '411600', '商水', '4', '0394', '466100', '中国,河南省,周口市,商水县', 'Shangshui', '114.60604', '33.53912');
INSERT INTO `tb_region` VALUES ('411624', '沈丘县', '411600', '沈丘', '4', '0394', '466300', '中国,河南省,周口市,沈丘县', 'Shenqiu', '115.09851', '33.40936');
INSERT INTO `tb_region` VALUES ('411625', '郸城县', '411600', '郸城', '4', '0394', '477150', '中国,河南省,周口市,郸城县', 'Dancheng', '115.17715', '33.64485');
INSERT INTO `tb_region` VALUES ('411626', '淮阳县', '411600', '淮阳', '4', '0394', '466700', '中国,河南省,周口市,淮阳县', 'Huaiyang', '114.88848', '33.73211');
INSERT INTO `tb_region` VALUES ('411627', '太康县', '411600', '太康', '4', '0394', '461400', '中国,河南省,周口市,太康县', 'Taikang', '114.83773', '34.06376');
INSERT INTO `tb_region` VALUES ('411628', '鹿邑县', '411600', '鹿邑', '4', '0394', '477200', '中国,河南省,周口市,鹿邑县', 'Luyi', '115.48553', '33.85931');
INSERT INTO `tb_region` VALUES ('411681', '项城市', '411600', '项城', '4', '0394', '466200', '中国,河南省,周口市,项城市', 'Xiangcheng', '114.87558', '33.4672');
INSERT INTO `tb_region` VALUES ('411700', '驻马店市', '410000', '驻马店', '3', '0396', '463000', '中国,河南省,驻马店市', 'Zhumadian', '114.024736', '32.980169');
INSERT INTO `tb_region` VALUES ('411702', '驿城区', '411700', '驿城', '4', '0396', '463000', '中国,河南省,驻马店市,驿城区', 'Yicheng', '113.99377', '32.97316');
INSERT INTO `tb_region` VALUES ('411721', '西平县', '411700', '西平', '4', '0396', '463900', '中国,河南省,驻马店市,西平县', 'Xiping', '114.02322', '33.3845');
INSERT INTO `tb_region` VALUES ('411722', '上蔡县', '411700', '上蔡', '4', '0396', '463800', '中国,河南省,驻马店市,上蔡县', 'Shangcai', '114.26825', '33.26825');
INSERT INTO `tb_region` VALUES ('411723', '平舆县', '411700', '平舆', '4', '0396', '463400', '中国,河南省,驻马店市,平舆县', 'Pingyu', '114.63552', '32.95727');
INSERT INTO `tb_region` VALUES ('411724', '正阳县', '411700', '正阳', '4', '0396', '463600', '中国,河南省,驻马店市,正阳县', 'Zhengyang', '114.38952', '32.6039');
INSERT INTO `tb_region` VALUES ('411725', '确山县', '411700', '确山', '4', '0396', '463200', '中国,河南省,驻马店市,确山县', 'Queshan', '114.02917', '32.80281');
INSERT INTO `tb_region` VALUES ('411726', '泌阳县', '411700', '泌阳', '4', '0396', '463700', '中国,河南省,驻马店市,泌阳县', 'Biyang', '113.32681', '32.71781');
INSERT INTO `tb_region` VALUES ('411727', '汝南县', '411700', '汝南', '4', '0396', '463300', '中国,河南省,驻马店市,汝南县', 'Runan', '114.36138', '33.00461');
INSERT INTO `tb_region` VALUES ('411728', '遂平县', '411700', '遂平', '4', '0396', '463100', '中国,河南省,驻马店市,遂平县', 'Suiping', '114.01297', '33.14571');
INSERT INTO `tb_region` VALUES ('411729', '新蔡县', '411700', '新蔡', '4', '0396', '463500', '中国,河南省,驻马店市,新蔡县', 'Xincai', '114.98199', '32.7502');
INSERT INTO `tb_region` VALUES ('419000', '直辖县级', '410000', '', '3', '', '', '中国,河南省,直辖县级', '', '113.665412', '34.757975');
INSERT INTO `tb_region` VALUES ('419001', '济源市', '419000', '济源', '4', '0391', '454650', '中国,河南省,直辖县级,济源市', 'Jiyuan', '112.590047', '35.090378');
INSERT INTO `tb_region` VALUES ('420000', '湖北省', '100003', '湖北', '2', '', '', '中国,湖北省', 'Hubei', '114.298572', '30.584355');
INSERT INTO `tb_region` VALUES ('420100', '武汉市', '420000', '武汉', '3', '', '430014', '中国,湖北省,武汉市', 'Wuhan', '114.298572', '30.584355');
INSERT INTO `tb_region` VALUES ('420102', '江岸区', '420100', '江岸', '4', '027', '430014', '中国,湖北省,武汉市,江岸区', 'Jiang\'an', '114.30943', '30.59982');
INSERT INTO `tb_region` VALUES ('420103', '江汉区', '420100', '江汉', '4', '027', '430021', '中国,湖北省,武汉市,江汉区', 'Jianghan', '114.27093', '30.60146');
INSERT INTO `tb_region` VALUES ('420104', '硚口区', '420100', '硚口', '4', '027', '430033', '中国,湖北省,武汉市,硚口区', 'Qiaokou', '114.26422', '30.56945');
INSERT INTO `tb_region` VALUES ('420105', '汉阳区', '420100', '汉阳', '4', '027', '430050', '中国,湖北省,武汉市,汉阳区', 'Hanyang', '114.27478', '30.54915');
INSERT INTO `tb_region` VALUES ('420106', '武昌区', '420100', '武昌', '4', '027', '430061', '中国,湖北省,武汉市,武昌区', 'Wuchang', '114.31589', '30.55389');
INSERT INTO `tb_region` VALUES ('420107', '青山区', '420100', '青山', '4', '027', '430080', '中国,湖北省,武汉市,青山区', 'Qingshan', '114.39117', '30.63427');
INSERT INTO `tb_region` VALUES ('420111', '洪山区', '420100', '洪山', '4', '027', '430070', '中国,湖北省,武汉市,洪山区', 'Hongshan', '114.34375', '30.49989');
INSERT INTO `tb_region` VALUES ('420112', '东西湖区', '420100', '东西湖', '4', '027', '430040', '中国,湖北省,武汉市,东西湖区', 'Dongxihu', '114.13708', '30.61989');
INSERT INTO `tb_region` VALUES ('420113', '汉南区', '420100', '汉南', '4', '027', '430090', '中国,湖北省,武汉市,汉南区', 'Hannan', '114.08462', '30.30879');
INSERT INTO `tb_region` VALUES ('420114', '蔡甸区', '420100', '蔡甸', '4', '027', '430100', '中国,湖北省,武汉市,蔡甸区', 'Caidian', '114.02929', '30.58197');
INSERT INTO `tb_region` VALUES ('420115', '江夏区', '420100', '江夏', '4', '027', '430200', '中国,湖北省,武汉市,江夏区', 'Jiangxia', '114.31301', '30.34653');
INSERT INTO `tb_region` VALUES ('420116', '黄陂区', '420100', '黄陂', '4', '027', '432200', '中国,湖北省,武汉市,黄陂区', 'Huangpi', '114.37512', '30.88151');
INSERT INTO `tb_region` VALUES ('420117', '新洲区', '420100', '新洲', '4', '027', '431400', '中国,湖北省,武汉市,新洲区', 'Xinzhou', '114.80136', '30.84145');
INSERT INTO `tb_region` VALUES ('420200', '黄石市', '420000', '黄石', '3', '0714', '435003', '中国,湖北省,黄石市', 'Huangshi', '115.077048', '30.220074');
INSERT INTO `tb_region` VALUES ('420202', '黄石港区', '420200', '黄石港', '4', '0714', '435000', '中国,湖北省,黄石市,黄石港区', 'Huangshigang', '115.06604', '30.22279');
INSERT INTO `tb_region` VALUES ('420203', '西塞山区', '420200', '西塞山', '4', '0714', '435001', '中国,湖北省,黄石市,西塞山区', 'Xisaishan', '115.11016', '30.20487');
INSERT INTO `tb_region` VALUES ('420204', '下陆区', '420200', '下陆', '4', '0714', '435005', '中国,湖北省,黄石市,下陆区', 'Xialu', '114.96112', '30.17368');
INSERT INTO `tb_region` VALUES ('420205', '铁山区', '420200', '铁山', '4', '0714', '435006', '中国,湖北省,黄石市,铁山区', 'Tieshan', '114.90109', '30.20678');
INSERT INTO `tb_region` VALUES ('420222', '阳新县', '420200', '阳新', '4', '0714', '435200', '中国,湖北省,黄石市,阳新县', 'Yangxin', '115.21527', '29.83038');
INSERT INTO `tb_region` VALUES ('420281', '大冶市', '420200', '大冶', '4', '0714', '435100', '中国,湖北省,黄石市,大冶市', 'Daye', '114.97174', '30.09438');
INSERT INTO `tb_region` VALUES ('420300', '十堰市', '420000', '十堰', '3', '0719', '442000', '中国,湖北省,十堰市', 'Shiyan', '110.785239', '32.647017');
INSERT INTO `tb_region` VALUES ('420302', '茅箭区', '420300', '茅箭', '4', '0719', '442012', '中国,湖北省,十堰市,茅箭区', 'Maojian', '110.81341', '32.59153');
INSERT INTO `tb_region` VALUES ('420303', '张湾区', '420300', '张湾', '4', '0719', '442001', '中国,湖北省,十堰市,张湾区', 'Zhangwan', '110.77067', '32.65195');
INSERT INTO `tb_region` VALUES ('420304', '郧阳区', '420300', '郧阳', '4', '0719', '442500', '中国,湖北省,十堰市,郧阳区', 'Yunyang', '110.81854', '32.83593');
INSERT INTO `tb_region` VALUES ('420322', '郧西县', '420300', '郧西', '4', '0719', '442600', '中国,湖北省,十堰市,郧西县', 'Yunxi', '110.42556', '32.99349');
INSERT INTO `tb_region` VALUES ('420323', '竹山县', '420300', '竹山', '4', '0719', '442200', '中国,湖北省,十堰市,竹山县', 'Zhushan', '110.23071', '32.22536');
INSERT INTO `tb_region` VALUES ('420324', '竹溪县', '420300', '竹溪', '4', '0719', '442300', '中国,湖北省,十堰市,竹溪县', 'Zhuxi', '109.71798', '32.31901');
INSERT INTO `tb_region` VALUES ('420325', '房县', '420300', '房县', '4', '0719', '442100', '中国,湖北省,十堰市,房县', 'Fangxian', '110.74386', '32.05794');
INSERT INTO `tb_region` VALUES ('420381', '丹江口市', '420300', '丹江口', '4', '0719', '442700', '中国,湖北省,十堰市,丹江口市', 'Danjiangkou', '111.51525', '32.54085');
INSERT INTO `tb_region` VALUES ('420500', '宜昌市', '420000', '宜昌', '3', '0717', '443000', '中国,湖北省,宜昌市', 'Yichang', '111.290843', '30.702636');
INSERT INTO `tb_region` VALUES ('420502', '西陵区', '420500', '西陵', '4', '0717', '443000', '中国,湖北省,宜昌市,西陵区', 'Xiling', '111.28573', '30.71077');
INSERT INTO `tb_region` VALUES ('420503', '伍家岗区', '420500', '伍家岗', '4', '0717', '443001', '中国,湖北省,宜昌市,伍家岗区', 'Wujiagang', '111.3609', '30.64434');
INSERT INTO `tb_region` VALUES ('420504', '点军区', '420500', '点军', '4', '0717', '443006', '中国,湖北省,宜昌市,点军区', 'Dianjun', '111.26828', '30.6934');
INSERT INTO `tb_region` VALUES ('420505', '猇亭区', '420500', '猇亭', '4', '0717', '443007', '中国,湖北省,宜昌市,猇亭区', 'Xiaoting', '111.44079', '30.52663');
INSERT INTO `tb_region` VALUES ('420506', '夷陵区', '420500', '夷陵', '4', '0717', '443100', '中国,湖北省,宜昌市,夷陵区', 'Yiling', '111.3262', '30.76881');
INSERT INTO `tb_region` VALUES ('420525', '远安县', '420500', '远安', '4', '0717', '444200', '中国,湖北省,宜昌市,远安县', 'Yuan\'an', '111.6416', '31.05989');
INSERT INTO `tb_region` VALUES ('420526', '兴山县', '420500', '兴山', '4', '0717', '443711', '中国,湖北省,宜昌市,兴山县', 'Xingshan', '110.74951', '31.34686');
INSERT INTO `tb_region` VALUES ('420527', '秭归县', '420500', '秭归', '4', '0717', '443600', '中国,湖北省,宜昌市,秭归县', 'Zigui', '110.98156', '30.82702');
INSERT INTO `tb_region` VALUES ('420528', '长阳土家族自治县', '420500', '长阳', '4', '0717', '443500', '中国,湖北省,宜昌市,长阳土家族自治县', 'Changyang', '111.20105', '30.47052');
INSERT INTO `tb_region` VALUES ('420529', '五峰土家族自治县', '420500', '五峰', '4', '0717', '443413', '中国,湖北省,宜昌市,五峰土家族自治县', 'Wufeng', '110.6748', '30.19856');
INSERT INTO `tb_region` VALUES ('420581', '宜都市', '420500', '宜都', '4', '0717', '443300', '中国,湖北省,宜昌市,宜都市', 'Yidu', '111.45025', '30.37807');
INSERT INTO `tb_region` VALUES ('420582', '当阳市', '420500', '当阳', '4', '0717', '444100', '中国,湖北省,宜昌市,当阳市', 'Dangyang', '111.78912', '30.8208');
INSERT INTO `tb_region` VALUES ('420583', '枝江市', '420500', '枝江', '4', '0717', '443200', '中国,湖北省,宜昌市,枝江市', 'Zhijiang', '111.76855', '30.42612');
INSERT INTO `tb_region` VALUES ('420600', '襄阳市', '420000', '襄阳', '3', '0710', '441021', '中国,湖北省,襄阳市', 'Xiangyang', '112.144146', '32.042426');
INSERT INTO `tb_region` VALUES ('420602', '襄城区', '420600', '襄城', '4', '0710', '441021', '中国,湖北省,襄阳市,襄城区', 'Xiangcheng', '112.13372', '32.01017');
INSERT INTO `tb_region` VALUES ('420606', '樊城区', '420600', '樊城', '4', '0710', '441001', '中国,湖北省,襄阳市,樊城区', 'Fancheng', '112.13546', '32.04482');
INSERT INTO `tb_region` VALUES ('420607', '襄州区', '420600', '襄州', '4', '0710', '441100', '中国,湖北省,襄阳市,襄州区', 'Xiangzhou', '112.150327', '32.015088');
INSERT INTO `tb_region` VALUES ('420624', '南漳县', '420600', '南漳', '4', '0710', '441500', '中国,湖北省,襄阳市,南漳县', 'Nanzhang', '111.84603', '31.77653');
INSERT INTO `tb_region` VALUES ('420625', '谷城县', '420600', '谷城', '4', '0710', '441700', '中国,湖北省,襄阳市,谷城县', 'Gucheng', '111.65267', '32.26377');
INSERT INTO `tb_region` VALUES ('420626', '保康县', '420600', '保康', '4', '0710', '441600', '中国,湖北省,襄阳市,保康县', 'Baokang', '111.26138', '31.87874');
INSERT INTO `tb_region` VALUES ('420682', '老河口市', '420600', '老河口', '4', '0710', '441800', '中国,湖北省,襄阳市,老河口市', 'Laohekou', '111.67117', '32.38476');
INSERT INTO `tb_region` VALUES ('420683', '枣阳市', '420600', '枣阳', '4', '0710', '441200', '中国,湖北省,襄阳市,枣阳市', 'Zaoyang', '112.77444', '32.13142');
INSERT INTO `tb_region` VALUES ('420684', '宜城市', '420600', '宜城', '4', '0710', '441400', '中国,湖北省,襄阳市,宜城市', 'Yicheng', '112.25772', '31.71972');
INSERT INTO `tb_region` VALUES ('420700', '鄂州市', '420000', '鄂州', '3', '0711', '436000', '中国,湖北省,鄂州市', 'Ezhou', '114.890593', '30.396536');
INSERT INTO `tb_region` VALUES ('420702', '梁子湖区', '420700', '梁子湖', '4', '0711', '436064', '中国,湖北省,鄂州市,梁子湖区', 'Liangzihu', '114.68463', '30.10003');
INSERT INTO `tb_region` VALUES ('420703', '华容区', '420700', '华容', '4', '0711', '436030', '中国,湖北省,鄂州市,华容区', 'Huarong', '114.73568', '30.53328');
INSERT INTO `tb_region` VALUES ('420704', '鄂城区', '420700', '鄂城', '4', '0711', '436000', '中国,湖北省,鄂州市,鄂城区', 'Echeng', '114.89158', '30.40024');
INSERT INTO `tb_region` VALUES ('420800', '荆门市', '420000', '荆门', '3', '0724', '448000', '中国,湖北省,荆门市', 'Jingmen', '112.204251', '31.03542');
INSERT INTO `tb_region` VALUES ('420802', '东宝区', '420800', '东宝', '4', '0724', '448004', '中国,湖北省,荆门市,东宝区', 'Dongbao', '112.20147', '31.05192');
INSERT INTO `tb_region` VALUES ('420804', '掇刀区', '420800', '掇刀', '4', '0724', '448124', '中国,湖北省,荆门市,掇刀区', 'Duodao', '112.208', '30.97316');
INSERT INTO `tb_region` VALUES ('420821', '京山县', '420800', '京山', '4', '0724', '431800', '中国,湖北省,荆门市,京山县', 'Jingshan', '113.11074', '31.0224');
INSERT INTO `tb_region` VALUES ('420822', '沙洋县', '420800', '沙洋', '4', '0724', '448200', '中国,湖北省,荆门市,沙洋县', 'Shayang', '112.58853', '30.70916');
INSERT INTO `tb_region` VALUES ('420881', '钟祥市', '420800', '钟祥', '4', '0724', '431900', '中国,湖北省,荆门市,钟祥市', 'Zhongxiang', '112.58932', '31.1678');
INSERT INTO `tb_region` VALUES ('420900', '孝感市', '420000', '孝感', '3', '0712', '432100', '中国,湖北省,孝感市', 'Xiaogan', '113.926655', '30.926423');
INSERT INTO `tb_region` VALUES ('420902', '孝南区', '420900', '孝南', '4', '0712', '432100', '中国,湖北省,孝感市,孝南区', 'Xiaonan', '113.91111', '30.9168');
INSERT INTO `tb_region` VALUES ('420921', '孝昌县', '420900', '孝昌', '4', '0712', '432900', '中国,湖北省,孝感市,孝昌县', 'Xiaochang', '113.99795', '31.25799');
INSERT INTO `tb_region` VALUES ('420922', '大悟县', '420900', '大悟', '4', '0712', '432800', '中国,湖北省,孝感市,大悟县', 'Dawu', '114.12564', '31.56176');
INSERT INTO `tb_region` VALUES ('420923', '云梦县', '420900', '云梦', '4', '0712', '432500', '中国,湖北省,孝感市,云梦县', 'Yunmeng', '113.75289', '31.02093');
INSERT INTO `tb_region` VALUES ('420981', '应城市', '420900', '应城', '4', '0712', '432400', '中国,湖北省,孝感市,应城市', 'Yingcheng', '113.57287', '30.92834');
INSERT INTO `tb_region` VALUES ('420982', '安陆市', '420900', '安陆', '4', '0712', '432600', '中国,湖北省,孝感市,安陆市', 'Anlu', '113.68557', '31.25693');
INSERT INTO `tb_region` VALUES ('420984', '汉川市', '420900', '汉川', '4', '0712', '432300', '中国,湖北省,孝感市,汉川市', 'Hanchuan', '113.83898', '30.66117');
INSERT INTO `tb_region` VALUES ('421000', '荆州市', '420000', '荆州', '3', '0716', '434000', '中国,湖北省,荆州市', 'Jingzhou', '112.23813', '30.326857');
INSERT INTO `tb_region` VALUES ('421002', '沙市区', '421000', '沙市', '4', '0716', '434000', '中国,湖北省,荆州市,沙市区', 'Shashi', '112.25543', '30.31107');
INSERT INTO `tb_region` VALUES ('421003', '荆州区', '421000', '荆州', '4', '0716', '434020', '中国,湖北省,荆州市,荆州区', 'Jingzhou', '112.19006', '30.35264');
INSERT INTO `tb_region` VALUES ('421022', '公安县', '421000', '公安', '4', '0716', '434300', '中国,湖北省,荆州市,公安县', 'Gong\'an', '112.23242', '30.05902');
INSERT INTO `tb_region` VALUES ('421023', '监利县', '421000', '监利', '4', '0716', '433300', '中国,湖北省,荆州市,监利县', 'Jianli', '112.89462', '29.81494');
INSERT INTO `tb_region` VALUES ('421024', '江陵县', '421000', '江陵', '4', '0716', '434101', '中国,湖北省,荆州市,江陵县', 'Jiangling', '112.42468', '30.04174');
INSERT INTO `tb_region` VALUES ('421081', '石首市', '421000', '石首', '4', '0716', '434400', '中国,湖北省,荆州市,石首市', 'Shishou', '112.42636', '29.72127');
INSERT INTO `tb_region` VALUES ('421083', '洪湖市', '421000', '洪湖', '4', '0716', '433200', '中国,湖北省,荆州市,洪湖市', 'Honghu', '113.47598', '29.827');
INSERT INTO `tb_region` VALUES ('421087', '松滋市', '421000', '松滋', '4', '0716', '434200', '中国,湖北省,荆州市,松滋市', 'Songzi', '111.76739', '30.16965');
INSERT INTO `tb_region` VALUES ('421100', '黄冈市', '420000', '黄冈', '3', '0713', '438000', '中国,湖北省,黄冈市', 'Huanggang', '114.879365', '30.447711');
INSERT INTO `tb_region` VALUES ('421102', '黄州区', '421100', '黄州', '4', '0713', '438000', '中国,湖北省,黄冈市,黄州区', 'Huangzhou', '114.88008', '30.43436');
INSERT INTO `tb_region` VALUES ('421121', '团风县', '421100', '团风', '4', '0713', '438800', '中国,湖北省,黄冈市,团风县', 'Tuanfeng', '114.87228', '30.64359');
INSERT INTO `tb_region` VALUES ('421122', '红安县', '421100', '红安', '4', '0713', '438401', '中国,湖北省,黄冈市,红安县', 'Hong\'an', '114.6224', '31.28668');
INSERT INTO `tb_region` VALUES ('421123', '罗田县', '421100', '罗田', '4', '0713', '438600', '中国,湖北省,黄冈市,罗田县', 'Luotian', '115.39971', '30.78255');
INSERT INTO `tb_region` VALUES ('421124', '英山县', '421100', '英山', '4', '0713', '438700', '中国,湖北省,黄冈市,英山县', 'Yingshan', '115.68142', '30.73516');
INSERT INTO `tb_region` VALUES ('421125', '浠水县', '421100', '浠水', '4', '0713', '438200', '中国,湖北省,黄冈市,浠水县', 'Xishui', '115.26913', '30.45265');
INSERT INTO `tb_region` VALUES ('421126', '蕲春县', '421100', '蕲春', '4', '0713', '435300', '中国,湖北省,黄冈市,蕲春县', 'Qichun', '115.43615', '30.22613');
INSERT INTO `tb_region` VALUES ('421127', '黄梅县', '421100', '黄梅', '4', '0713', '435500', '中国,湖北省,黄冈市,黄梅县', 'Huangmei', '115.94427', '30.07033');
INSERT INTO `tb_region` VALUES ('421181', '麻城市', '421100', '麻城', '4', '0713', '438300', '中国,湖北省,黄冈市,麻城市', 'Macheng', '115.00988', '31.17228');
INSERT INTO `tb_region` VALUES ('421182', '武穴市', '421100', '武穴', '4', '0713', '435400', '中国,湖北省,黄冈市,武穴市', 'Wuxue', '115.55975', '29.84446');
INSERT INTO `tb_region` VALUES ('421200', '咸宁市', '420000', '咸宁', '3', '0715', '437000', '中国,湖北省,咸宁市', 'Xianning', '114.328963', '29.832798');
INSERT INTO `tb_region` VALUES ('421202', '咸安区', '421200', '咸安', '4', '0715', '437000', '中国,湖北省,咸宁市,咸安区', 'Xian\'an', '114.29872', '29.8529');
INSERT INTO `tb_region` VALUES ('421221', '嘉鱼县', '421200', '嘉鱼', '4', '0715', '437200', '中国,湖北省,咸宁市,嘉鱼县', 'Jiayu', '113.93927', '29.97054');
INSERT INTO `tb_region` VALUES ('421222', '通城县', '421200', '通城', '4', '0715', '437400', '中国,湖北省,咸宁市,通城县', 'Tongcheng', '113.81582', '29.24568');
INSERT INTO `tb_region` VALUES ('421223', '崇阳县', '421200', '崇阳', '4', '0715', '437500', '中国,湖北省,咸宁市,崇阳县', 'Chongyang', '114.03982', '29.55564');
INSERT INTO `tb_region` VALUES ('421224', '通山县', '421200', '通山', '4', '0715', '437600', '中国,湖北省,咸宁市,通山县', 'Tongshan', '114.48239', '29.6063');
INSERT INTO `tb_region` VALUES ('421281', '赤壁市', '421200', '赤壁', '4', '0715', '437300', '中国,湖北省,咸宁市,赤壁市', 'Chibi', '113.90039', '29.72454');
INSERT INTO `tb_region` VALUES ('421300', '随州市', '420000', '随州', '3', '0722', '441300', '中国,湖北省,随州市', 'Suizhou', '113.37377', '31.717497');
INSERT INTO `tb_region` VALUES ('421303', '曾都区', '421300', '曾都', '4', '0722', '441300', '中国,湖北省,随州市,曾都区', 'Zengdu', '113.37128', '31.71614');
INSERT INTO `tb_region` VALUES ('421321', '随县', '421300', '随县', '4', '0722', '441309', '中国,湖北省,随州市,随县', 'Suixian', '113.82663', '31.6179');
INSERT INTO `tb_region` VALUES ('421381', '广水市', '421300', '广水', '4', '0722', '432700', '中国,湖北省,随州市,广水市', 'Guangshui', '113.82663', '31.6179');
INSERT INTO `tb_region` VALUES ('422800', '恩施土家族苗族自治州', '420000', '恩施', '3', '0718', '445000', '中国,湖北省,恩施土家族苗族自治州', 'Enshi', '109.48699', '30.283114');
INSERT INTO `tb_region` VALUES ('422801', '恩施市', '422800', '恩施', '4', '0718', '445000', '中国,湖北省,恩施土家族苗族自治州,恩施市', 'Enshi', '109.47942', '30.29502');
INSERT INTO `tb_region` VALUES ('422802', '利川市', '422800', '利川', '4', '0718', '445400', '中国,湖北省,恩施土家族苗族自治州,利川市', 'Lichuan', '108.93591', '30.29117');
INSERT INTO `tb_region` VALUES ('422822', '建始县', '422800', '建始', '4', '0718', '445300', '中国,湖北省,恩施土家族苗族自治州,建始县', 'Jianshi', '109.72207', '30.60209');
INSERT INTO `tb_region` VALUES ('422823', '巴东县', '422800', '巴东', '4', '0718', '444300', '中国,湖北省,恩施土家族苗族自治州,巴东县', 'Badong', '110.34066', '31.04233');
INSERT INTO `tb_region` VALUES ('422825', '宣恩县', '422800', '宣恩', '4', '0718', '445500', '中国,湖北省,恩施土家族苗族自治州,宣恩县', 'Xuanen', '109.49179', '29.98714');
INSERT INTO `tb_region` VALUES ('422826', '咸丰县', '422800', '咸丰', '4', '0718', '445600', '中国,湖北省,恩施土家族苗族自治州,咸丰县', 'Xianfeng', '109.152', '29.67983');
INSERT INTO `tb_region` VALUES ('422827', '来凤县', '422800', '来凤', '4', '0718', '445700', '中国,湖北省,恩施土家族苗族自治州,来凤县', 'Laifeng', '109.40716', '29.49373');
INSERT INTO `tb_region` VALUES ('422828', '鹤峰县', '422800', '鹤峰', '4', '0718', '445800', '中国,湖北省,恩施土家族苗族自治州,鹤峰县', 'Hefeng', '110.03091', '29.89072');
INSERT INTO `tb_region` VALUES ('429000', '直辖县级', '420000', '', '3', '', '', '中国,湖北省,直辖县级', '', '114.298572', '30.584355');
INSERT INTO `tb_region` VALUES ('429004', '仙桃市', '429000', '仙桃', '4', '0728', '433000', '中国,湖北省,直辖县级,仙桃市', 'Xiantao', '113.453974', '30.364953');
INSERT INTO `tb_region` VALUES ('429005', '潜江市', '429000', '潜江', '4', '0728', '433100', '中国,湖北省,直辖县级,潜江市', 'Qianjiang', '112.896866', '30.421215');
INSERT INTO `tb_region` VALUES ('429006', '天门市', '429000', '天门', '4', '0728', '431700', '中国,湖北省,直辖县级,天门市', 'Tianmen', '113.165862', '30.653061');
INSERT INTO `tb_region` VALUES ('429021', '神农架林区', '429000', '神农架', '4', '0719', '442400', '中国,湖北省,直辖县级,神农架林区', 'Shennongjia', '110.671525', '31.744449');
INSERT INTO `tb_region` VALUES ('430000', '湖南省', '100003', '湖南', '2', '', '', '中国,湖南省', 'Hunan', '112.982279', '28.19409');
INSERT INTO `tb_region` VALUES ('430100', '长沙市', '430000', '长沙', '3', '0731', '410005', '中国,湖南省,长沙市', 'Changsha', '112.982279', '28.19409');
INSERT INTO `tb_region` VALUES ('430102', '芙蓉区', '430100', '芙蓉', '4', '0731', '410011', '中国,湖南省,长沙市,芙蓉区', 'Furong', '113.03176', '28.1844');
INSERT INTO `tb_region` VALUES ('430103', '天心区', '430100', '天心', '4', '0731', '410004', '中国,湖南省,长沙市,天心区', 'Tianxin', '112.98991', '28.1127');
INSERT INTO `tb_region` VALUES ('430104', '岳麓区', '430100', '岳麓', '4', '0731', '410013', '中国,湖南省,长沙市,岳麓区', 'Yuelu', '112.93133', '28.2351');
INSERT INTO `tb_region` VALUES ('430105', '开福区', '430100', '开福', '4', '0731', '410008', '中国,湖南省,长沙市,开福区', 'Kaifu', '112.98623', '28.25585');
INSERT INTO `tb_region` VALUES ('430111', '雨花区', '430100', '雨花', '4', '0731', '410011', '中国,湖南省,长沙市,雨花区', 'Yuhua', '113.03567', '28.13541');
INSERT INTO `tb_region` VALUES ('430112', '望城区', '430100', '望城', '4', '0731', '410200', '中国,湖南省,长沙市,望城区', 'Wangcheng', '112.819549', '28.347458');
INSERT INTO `tb_region` VALUES ('430121', '长沙县', '430100', '长沙', '4', '0731', '410100', '中国,湖南省,长沙市,长沙县', 'Changsha', '113.08071', '28.24595');
INSERT INTO `tb_region` VALUES ('430124', '宁乡县', '430100', '宁乡', '4', '0731', '410600', '中国,湖南省,长沙市,宁乡县', 'Ningxiang', '112.55749', '28.25358');
INSERT INTO `tb_region` VALUES ('430181', '浏阳市', '430100', '浏阳', '4', '0731', '410300', '中国,湖南省,长沙市,浏阳市', 'Liuyang', '113.64312', '28.16375');
INSERT INTO `tb_region` VALUES ('430200', '株洲市', '430000', '株洲', '3', '0731', '412000', '中国,湖南省,株洲市', 'Zhuzhou', '113.151737', '27.835806');
INSERT INTO `tb_region` VALUES ('430202', '荷塘区', '430200', '荷塘', '4', '0731', '412000', '中国,湖南省,株洲市,荷塘区', 'Hetang', '113.17315', '27.85569');
INSERT INTO `tb_region` VALUES ('430203', '芦淞区', '430200', '芦淞', '4', '0731', '412000', '中国,湖南省,株洲市,芦淞区', 'Lusong', '113.15562', '27.78525');
INSERT INTO `tb_region` VALUES ('430204', '石峰区', '430200', '石峰', '4', '0731', '412005', '中国,湖南省,株洲市,石峰区', 'Shifeng', '113.11776', '27.87552');
INSERT INTO `tb_region` VALUES ('430211', '天元区', '430200', '天元', '4', '0731', '412007', '中国,湖南省,株洲市,天元区', 'Tianyuan', '113.12335', '27.83103');
INSERT INTO `tb_region` VALUES ('430221', '株洲县', '430200', '株洲', '4', '0731', '412100', '中国,湖南省,株洲市,株洲县', 'Zhuzhou', '113.14428', '27.69826');
INSERT INTO `tb_region` VALUES ('430223', '攸县', '430200', '攸县', '4', '0731', '412300', '中国,湖南省,株洲市,攸县', 'Youxian', '113.34365', '27.00352');
INSERT INTO `tb_region` VALUES ('430224', '茶陵县', '430200', '茶陵', '4', '0731', '412400', '中国,湖南省,株洲市,茶陵县', 'Chaling', '113.54364', '26.7915');
INSERT INTO `tb_region` VALUES ('430225', '炎陵县', '430200', '炎陵', '4', '0731', '412500', '中国,湖南省,株洲市,炎陵县', 'Yanling', '113.77163', '26.48818');
INSERT INTO `tb_region` VALUES ('430281', '醴陵市', '430200', '醴陵', '4', '0731', '412200', '中国,湖南省,株洲市,醴陵市', 'Liling', '113.49704', '27.64615');
INSERT INTO `tb_region` VALUES ('430300', '湘潭市', '430000', '湘潭', '3', '0731', '411100', '中国,湖南省,湘潭市', 'Xiangtan', '112.925083', '27.846725');
INSERT INTO `tb_region` VALUES ('430302', '雨湖区', '430300', '雨湖', '4', '0731', '411100', '中国,湖南省,湘潭市,雨湖区', 'Yuhu', '112.90399', '27.86859');
INSERT INTO `tb_region` VALUES ('430304', '岳塘区', '430300', '岳塘', '4', '0731', '411101', '中国,湖南省,湘潭市,岳塘区', 'Yuetang', '112.9606', '27.85784');
INSERT INTO `tb_region` VALUES ('430321', '湘潭县', '430300', '湘潭', '4', '0731', '411228', '中国,湖南省,湘潭市,湘潭县', 'Xiangtan', '112.9508', '27.77893');
INSERT INTO `tb_region` VALUES ('430381', '湘乡市', '430300', '湘乡', '4', '0731', '411400', '中国,湖南省,湘潭市,湘乡市', 'Xiangxiang', '112.53512', '27.73543');
INSERT INTO `tb_region` VALUES ('430382', '韶山市', '430300', '韶山', '4', '0731', '411300', '中国,湖南省,湘潭市,韶山市', 'Shaoshan', '112.52655', '27.91503');
INSERT INTO `tb_region` VALUES ('430400', '衡阳市', '430000', '衡阳', '3', '0734', '421001', '中国,湖南省,衡阳市', 'Hengyang', '112.607693', '26.900358');
INSERT INTO `tb_region` VALUES ('430405', '珠晖区', '430400', '珠晖', '4', '0734', '421002', '中国,湖南省,衡阳市,珠晖区', 'Zhuhui', '112.62054', '26.89361');
INSERT INTO `tb_region` VALUES ('430406', '雁峰区', '430400', '雁峰', '4', '0734', '421001', '中国,湖南省,衡阳市,雁峰区', 'Yanfeng', '112.61654', '26.88866');
INSERT INTO `tb_region` VALUES ('430407', '石鼓区', '430400', '石鼓', '4', '0734', '421005', '中国,湖南省,衡阳市,石鼓区', 'Shigu', '112.61069', '26.90232');
INSERT INTO `tb_region` VALUES ('430408', '蒸湘区', '430400', '蒸湘', '4', '0734', '421001', '中国,湖南省,衡阳市,蒸湘区', 'Zhengxiang', '112.6033', '26.89651');
INSERT INTO `tb_region` VALUES ('430412', '南岳区', '430400', '南岳', '4', '0734', '421900', '中国,湖南省,衡阳市,南岳区', 'Nanyue', '112.7384', '27.23262');
INSERT INTO `tb_region` VALUES ('430421', '衡阳县', '430400', '衡阳', '4', '0734', '421200', '中国,湖南省,衡阳市,衡阳县', 'Hengyang', '112.37088', '26.9706');
INSERT INTO `tb_region` VALUES ('430422', '衡南县', '430400', '衡南', '4', '0734', '421131', '中国,湖南省,衡阳市,衡南县', 'Hengnan', '112.67788', '26.73828');
INSERT INTO `tb_region` VALUES ('430423', '衡山县', '430400', '衡山', '4', '0734', '421300', '中国,湖南省,衡阳市,衡山县', 'Hengshan', '112.86776', '27.23134');
INSERT INTO `tb_region` VALUES ('430424', '衡东县', '430400', '衡东', '4', '0734', '421400', '中国,湖南省,衡阳市,衡东县', 'Hengdong', '112.94833', '27.08093');
INSERT INTO `tb_region` VALUES ('430426', '祁东县', '430400', '祁东', '4', '0734', '421600', '中国,湖南省,衡阳市,祁东县', 'Qidong', '112.09039', '26.79964');
INSERT INTO `tb_region` VALUES ('430481', '耒阳市', '430400', '耒阳', '4', '0734', '421800', '中国,湖南省,衡阳市,耒阳市', 'Leiyang', '112.85998', '26.42132');
INSERT INTO `tb_region` VALUES ('430482', '常宁市', '430400', '常宁', '4', '0734', '421500', '中国,湖南省,衡阳市,常宁市', 'Changning', '112.4009', '26.40692');
INSERT INTO `tb_region` VALUES ('430500', '邵阳市', '430000', '邵阳', '3', '0739', '422000', '中国,湖南省,邵阳市', 'Shaoyang', '111.46923', '27.237842');
INSERT INTO `tb_region` VALUES ('430502', '双清区', '430500', '双清', '4', '0739', '422001', '中国,湖南省,邵阳市,双清区', 'Shuangqing', '111.49715', '27.23291');
INSERT INTO `tb_region` VALUES ('430503', '大祥区', '430500', '大祥', '4', '0739', '422000', '中国,湖南省,邵阳市,大祥区', 'Daxiang', '111.45412', '27.23332');
INSERT INTO `tb_region` VALUES ('430511', '北塔区', '430500', '北塔', '4', '0739', '422007', '中国,湖南省,邵阳市,北塔区', 'Beita', '111.45219', '27.24648');
INSERT INTO `tb_region` VALUES ('430521', '邵东县', '430500', '邵东', '4', '0739', '422800', '中国,湖南省,邵阳市,邵东县', 'Shaodong', '111.74441', '27.2584');
INSERT INTO `tb_region` VALUES ('430522', '新邵县', '430500', '新邵', '4', '0739', '422900', '中国,湖南省,邵阳市,新邵县', 'Xinshao', '111.46066', '27.32169');
INSERT INTO `tb_region` VALUES ('430523', '邵阳县', '430500', '邵阳', '4', '0739', '422100', '中国,湖南省,邵阳市,邵阳县', 'Shaoyang', '111.27459', '26.99143');
INSERT INTO `tb_region` VALUES ('430524', '隆回县', '430500', '隆回', '4', '0739', '422200', '中国,湖南省,邵阳市,隆回县', 'Longhui', '111.03216', '27.10937');
INSERT INTO `tb_region` VALUES ('430525', '洞口县', '430500', '洞口', '4', '0739', '422300', '中国,湖南省,邵阳市,洞口县', 'Dongkou', '110.57388', '27.05462');
INSERT INTO `tb_region` VALUES ('430527', '绥宁县', '430500', '绥宁', '4', '0739', '422600', '中国,湖南省,邵阳市,绥宁县', 'Suining', '110.15576', '26.58636');
INSERT INTO `tb_region` VALUES ('430528', '新宁县', '430500', '新宁', '4', '0739', '422700', '中国,湖南省,邵阳市,新宁县', 'Xinning', '110.85131', '26.42936');
INSERT INTO `tb_region` VALUES ('430529', '城步苗族自治县', '430500', '城步', '4', '0739', '422500', '中国,湖南省,邵阳市,城步苗族自治县', 'Chengbu', '110.3222', '26.39048');
INSERT INTO `tb_region` VALUES ('430581', '武冈市', '430500', '武冈', '4', '0739', '422400', '中国,湖南省,邵阳市,武冈市', 'Wugang', '110.63281', '26.72817');
INSERT INTO `tb_region` VALUES ('430600', '岳阳市', '430000', '岳阳', '3', '0730', '414000', '中国,湖南省,岳阳市', 'Yueyang', '113.132855', '29.37029');
INSERT INTO `tb_region` VALUES ('430602', '岳阳楼区', '430600', '岳阳楼', '4', '0730', '414000', '中国,湖南省,岳阳市,岳阳楼区', 'Yueyanglou', '113.12942', '29.3719');
INSERT INTO `tb_region` VALUES ('430603', '云溪区', '430600', '云溪', '4', '0730', '414009', '中国,湖南省,岳阳市,云溪区', 'Yunxi', '113.27713', '29.47357');
INSERT INTO `tb_region` VALUES ('430611', '君山区', '430600', '君山', '4', '0730', '414005', '中国,湖南省,岳阳市,君山区', 'Junshan', '113.00439', '29.45941');
INSERT INTO `tb_region` VALUES ('430621', '岳阳县', '430600', '岳阳', '4', '0730', '414100', '中国,湖南省,岳阳市,岳阳县', 'Yueyang', '113.11987', '29.14314');
INSERT INTO `tb_region` VALUES ('430623', '华容县', '430600', '华容', '4', '0730', '414200', '中国,湖南省,岳阳市,华容县', 'Huarong', '112.54089', '29.53019');
INSERT INTO `tb_region` VALUES ('430624', '湘阴县', '430600', '湘阴', '4', '0730', '414600', '中国,湖南省,岳阳市,湘阴县', 'Xiangyin', '112.90911', '28.68922');
INSERT INTO `tb_region` VALUES ('430626', '平江县', '430600', '平江', '4', '0730', '414500', '中国,湖南省,岳阳市,平江县', 'Pingjiang', '113.58105', '28.70664');
INSERT INTO `tb_region` VALUES ('430681', '汨罗市', '430600', '汨罗', '4', '0730', '414400', '中国,湖南省,岳阳市,汨罗市', 'Miluo', '113.06707', '28.80631');
INSERT INTO `tb_region` VALUES ('430682', '临湘市', '430600', '临湘', '4', '0730', '414300', '中国,湖南省,岳阳市,临湘市', 'Linxiang', '113.4501', '29.47701');
INSERT INTO `tb_region` VALUES ('430700', '常德市', '430000', '常德', '3', '0736', '415000', '中国,湖南省,常德市', 'Changde', '111.691347', '29.040225');
INSERT INTO `tb_region` VALUES ('430702', '武陵区', '430700', '武陵', '4', '0736', '415000', '中国,湖南省,常德市,武陵区', 'Wuling', '111.69791', '29.02876');
INSERT INTO `tb_region` VALUES ('430703', '鼎城区', '430700', '鼎城', '4', '0736', '415101', '中国,湖南省,常德市,鼎城区', 'Dingcheng', '111.68078', '29.01859');
INSERT INTO `tb_region` VALUES ('430721', '安乡县', '430700', '安乡', '4', '0736', '415600', '中国,湖南省,常德市,安乡县', 'Anxiang', '112.16732', '29.41326');
INSERT INTO `tb_region` VALUES ('430722', '汉寿县', '430700', '汉寿', '4', '0736', '415900', '中国,湖南省,常德市,汉寿县', 'Hanshou', '111.96691', '28.90299');
INSERT INTO `tb_region` VALUES ('430723', '澧县', '430700', '澧县', '4', '0736', '415500', '中国,湖南省,常德市,澧县', 'Lixian', '111.75866', '29.63317');
INSERT INTO `tb_region` VALUES ('430724', '临澧县', '430700', '临澧', '4', '0736', '415200', '中国,湖南省,常德市,临澧县', 'Linli', '111.65161', '29.44163');
INSERT INTO `tb_region` VALUES ('430725', '桃源县', '430700', '桃源', '4', '0736', '415700', '中国,湖南省,常德市,桃源县', 'Taoyuan', '111.48892', '28.90474');
INSERT INTO `tb_region` VALUES ('430726', '石门县', '430700', '石门', '4', '0736', '415300', '中国,湖南省,常德市,石门县', 'Shimen', '111.37966', '29.58424');
INSERT INTO `tb_region` VALUES ('430781', '津市市', '430700', '津市', '4', '0736', '415400', '中国,湖南省,常德市,津市市', 'Jinshi', '111.87756', '29.60563');
INSERT INTO `tb_region` VALUES ('430800', '张家界市', '430000', '张家界', '3', '0744', '427000', '中国,湖南省,张家界市', 'Zhangjiajie', '110.479921', '29.127401');
INSERT INTO `tb_region` VALUES ('430802', '永定区', '430800', '永定', '4', '0744', '427000', '中国,湖南省,张家界市,永定区', 'Yongding', '110.47464', '29.13387');
INSERT INTO `tb_region` VALUES ('430811', '武陵源区', '430800', '武陵源', '4', '0744', '427400', '中国,湖南省,张家界市,武陵源区', 'Wulingyuan', '110.55026', '29.34574');
INSERT INTO `tb_region` VALUES ('430821', '慈利县', '430800', '慈利', '4', '0744', '427200', '中国,湖南省,张家界市,慈利县', 'Cili', '111.13946', '29.42989');
INSERT INTO `tb_region` VALUES ('430822', '桑植县', '430800', '桑植', '4', '0744', '427100', '中国,湖南省,张家界市,桑植县', 'Sangzhi', '110.16308', '29.39815');
INSERT INTO `tb_region` VALUES ('430900', '益阳市', '430000', '益阳', '3', '0737', '413000', '中国,湖南省,益阳市', 'Yiyang', '112.355042', '28.570066');
INSERT INTO `tb_region` VALUES ('430902', '资阳区', '430900', '资阳', '4', '0737', '413001', '中国,湖南省,益阳市,资阳区', 'Ziyang', '112.32447', '28.59095');
INSERT INTO `tb_region` VALUES ('430903', '赫山区', '430900', '赫山', '4', '0737', '413002', '中国,湖南省,益阳市,赫山区', 'Heshan', '112.37265', '28.57425');
INSERT INTO `tb_region` VALUES ('430921', '南县', '430900', '南县', '4', '0737', '413200', '中国,湖南省,益阳市,南县', 'Nanxian', '112.3963', '29.36159');
INSERT INTO `tb_region` VALUES ('430922', '桃江县', '430900', '桃江', '4', '0737', '413400', '中国,湖南省,益阳市,桃江县', 'Taojiang', '112.1557', '28.51814');
INSERT INTO `tb_region` VALUES ('430923', '安化县', '430900', '安化', '4', '0737', '413500', '中国,湖南省,益阳市,安化县', 'Anhua', '111.21298', '28.37424');
INSERT INTO `tb_region` VALUES ('430981', '沅江市', '430900', '沅江', '4', '0737', '413100', '中国,湖南省,益阳市,沅江市', 'Yuanjiang', '112.35427', '28.84403');
INSERT INTO `tb_region` VALUES ('431000', '郴州市', '430000', '郴州', '3', '0735', '423000', '中国,湖南省,郴州市', 'Chenzhou', '113.032067', '25.793589');
INSERT INTO `tb_region` VALUES ('431002', '北湖区', '431000', '北湖', '4', '0735', '423000', '中国,湖南省,郴州市,北湖区', 'Beihu', '113.01103', '25.78405');
INSERT INTO `tb_region` VALUES ('431003', '苏仙区', '431000', '苏仙', '4', '0735', '423000', '中国,湖南省,郴州市,苏仙区', 'Suxian', '113.04226', '25.80045');
INSERT INTO `tb_region` VALUES ('431021', '桂阳县', '431000', '桂阳', '4', '0735', '424400', '中国,湖南省,郴州市,桂阳县', 'Guiyang', '112.73364', '25.75406');
INSERT INTO `tb_region` VALUES ('431022', '宜章县', '431000', '宜章', '4', '0735', '424200', '中国,湖南省,郴州市,宜章县', 'Yizhang', '112.95147', '25.39931');
INSERT INTO `tb_region` VALUES ('431023', '永兴县', '431000', '永兴', '4', '0735', '423300', '中国,湖南省,郴州市,永兴县', 'Yongxing', '113.11242', '26.12646');
INSERT INTO `tb_region` VALUES ('431024', '嘉禾县', '431000', '嘉禾', '4', '0735', '424500', '中国,湖南省,郴州市,嘉禾县', 'Jiahe', '112.36935', '25.58795');
INSERT INTO `tb_region` VALUES ('431025', '临武县', '431000', '临武', '4', '0735', '424300', '中国,湖南省,郴州市,临武县', 'Linwu', '112.56369', '25.27602');
INSERT INTO `tb_region` VALUES ('431026', '汝城县', '431000', '汝城', '4', '0735', '424100', '中国,湖南省,郴州市,汝城县', 'Rucheng', '113.68582', '25.55204');
INSERT INTO `tb_region` VALUES ('431027', '桂东县', '431000', '桂东', '4', '0735', '423500', '中国,湖南省,郴州市,桂东县', 'Guidong', '113.9468', '26.07987');
INSERT INTO `tb_region` VALUES ('431028', '安仁县', '431000', '安仁', '4', '0735', '423600', '中国,湖南省,郴州市,安仁县', 'Anren', '113.26944', '26.70931');
INSERT INTO `tb_region` VALUES ('431081', '资兴市', '431000', '资兴', '4', '0735', '423400', '中国,湖南省,郴州市,资兴市', 'Zixing', '113.23724', '25.97668');
INSERT INTO `tb_region` VALUES ('431100', '永州市', '430000', '永州', '3', '0746', '425000', '中国,湖南省,永州市', 'Yongzhou', '111.608019', '26.434516');
INSERT INTO `tb_region` VALUES ('431102', '零陵区', '431100', '零陵', '4', '0746', '425100', '中国,湖南省,永州市,零陵区', 'Lingling', '111.62103', '26.22109');
INSERT INTO `tb_region` VALUES ('431103', '冷水滩区', '431100', '冷水滩', '4', '0746', '425100', '中国,湖南省,永州市,冷水滩区', 'Lengshuitan', '111.59214', '26.46107');
INSERT INTO `tb_region` VALUES ('431121', '祁阳县', '431100', '祁阳', '4', '0746', '426100', '中国,湖南省,永州市,祁阳县', 'Qiyang', '111.84011', '26.58009');
INSERT INTO `tb_region` VALUES ('431122', '东安县', '431100', '东安', '4', '0746', '425900', '中国,湖南省,永州市,东安县', 'Dong\'an', '111.3164', '26.39202');
INSERT INTO `tb_region` VALUES ('431123', '双牌县', '431100', '双牌', '4', '0746', '425200', '中国,湖南省,永州市,双牌县', 'Shuangpai', '111.65927', '25.95988');
INSERT INTO `tb_region` VALUES ('431124', '道县', '431100', '道县', '4', '0746', '425300', '中国,湖南省,永州市,道县', 'Daoxian', '111.60195', '25.52766');
INSERT INTO `tb_region` VALUES ('431125', '江永县', '431100', '江永', '4', '0746', '425400', '中国,湖南省,永州市,江永县', 'Jiangyong', '111.34082', '25.27233');
INSERT INTO `tb_region` VALUES ('431126', '宁远县', '431100', '宁远', '4', '0746', '425600', '中国,湖南省,永州市,宁远县', 'Ningyuan', '111.94625', '25.56913');
INSERT INTO `tb_region` VALUES ('431127', '蓝山县', '431100', '蓝山', '4', '0746', '425800', '中国,湖南省,永州市,蓝山县', 'Lanshan', '112.19363', '25.36794');
INSERT INTO `tb_region` VALUES ('431128', '新田县', '431100', '新田', '4', '0746', '425700', '中国,湖南省,永州市,新田县', 'Xintian', '112.22103', '25.9095');
INSERT INTO `tb_region` VALUES ('431129', '江华瑶族自治县', '431100', '江华', '4', '0746', '425500', '中国,湖南省,永州市,江华瑶族自治县', 'Jianghua', '111.58847', '25.1845');
INSERT INTO `tb_region` VALUES ('431200', '怀化市', '430000', '怀化', '3', '0745', '418000', '中国,湖南省,怀化市', 'Huaihua', '109.97824', '27.550082');
INSERT INTO `tb_region` VALUES ('431202', '鹤城区', '431200', '鹤城', '4', '0745', '418000', '中国,湖南省,怀化市,鹤城区', 'Hecheng', '109.96509', '27.54942');
INSERT INTO `tb_region` VALUES ('431221', '中方县', '431200', '中方', '4', '0745', '418005', '中国,湖南省,怀化市,中方县', 'Zhongfang', '109.94497', '27.43988');
INSERT INTO `tb_region` VALUES ('431222', '沅陵县', '431200', '沅陵', '4', '0745', '419600', '中国,湖南省,怀化市,沅陵县', 'Yuanling', '110.39633', '28.45548');
INSERT INTO `tb_region` VALUES ('431223', '辰溪县', '431200', '辰溪', '4', '0745', '419500', '中国,湖南省,怀化市,辰溪县', 'Chenxi', '110.18942', '28.00406');
INSERT INTO `tb_region` VALUES ('431224', '溆浦县', '431200', '溆浦', '4', '0745', '419300', '中国,湖南省,怀化市,溆浦县', 'Xupu', '110.59384', '27.90836');
INSERT INTO `tb_region` VALUES ('431225', '会同县', '431200', '会同', '4', '0745', '418300', '中国,湖南省,怀化市,会同县', 'Huitong', '109.73568', '26.88716');
INSERT INTO `tb_region` VALUES ('431226', '麻阳苗族自治县', '431200', '麻阳', '4', '0745', '419400', '中国,湖南省,怀化市,麻阳苗族自治县', 'Mayang', '109.80194', '27.866');
INSERT INTO `tb_region` VALUES ('431227', '新晃侗族自治县', '431200', '新晃', '4', '0745', '419200', '中国,湖南省,怀化市,新晃侗族自治县', 'Xinhuang', '109.17166', '27.35937');
INSERT INTO `tb_region` VALUES ('431228', '芷江侗族自治县', '431200', '芷江', '4', '0745', '419100', '中国,湖南省,怀化市,芷江侗族自治县', 'Zhijiang', '109.6849', '27.44297');
INSERT INTO `tb_region` VALUES ('431229', '靖州苗族侗族自治县', '431200', '靖州', '4', '0745', '418400', '中国,湖南省,怀化市,靖州苗族侗族自治县', 'Jingzhou', '109.69821', '26.57651');
INSERT INTO `tb_region` VALUES ('431230', '通道侗族自治县', '431200', '通道', '4', '0745', '418500', '中国,湖南省,怀化市,通道侗族自治县', 'Tongdao', '109.78515', '26.1571');
INSERT INTO `tb_region` VALUES ('431281', '洪江市', '431200', '洪江', '4', '0745', '418100', '中国,湖南省,怀化市,洪江市', 'Hongjiang', '109.83651', '27.20922');
INSERT INTO `tb_region` VALUES ('431300', '娄底市', '430000', '娄底', '3', '0738', '417000', '中国,湖南省,娄底市', 'Loudi', '112.008497', '27.728136');
INSERT INTO `tb_region` VALUES ('431302', '娄星区', '431300', '娄星', '4', '0738', '417000', '中国,湖南省,娄底市,娄星区', 'Louxing', '112.00193', '27.72992');
INSERT INTO `tb_region` VALUES ('431321', '双峰县', '431300', '双峰', '4', '0738', '417700', '中国,湖南省,娄底市,双峰县', 'Shuangfeng', '112.19921', '27.45418');
INSERT INTO `tb_region` VALUES ('431322', '新化县', '431300', '新化', '4', '0738', '417600', '中国,湖南省,娄底市,新化县', 'Xinhua', '111.32739', '27.7266');
INSERT INTO `tb_region` VALUES ('431381', '冷水江市', '431300', '冷水江', '4', '0738', '417500', '中国,湖南省,娄底市,冷水江市', 'Lengshuijiang', '111.43554', '27.68147');
INSERT INTO `tb_region` VALUES ('431382', '涟源市', '431300', '涟源', '4', '0738', '417100', '中国,湖南省,娄底市,涟源市', 'Lianyuan', '111.67233', '27.68831');
INSERT INTO `tb_region` VALUES ('433100', '湘西土家族苗族自治州', '430000', '湘西', '3', '0743', '416000', '中国,湖南省,湘西土家族苗族自治州', 'Xiangxi', '109.739735', '28.314296');
INSERT INTO `tb_region` VALUES ('433101', '吉首市', '433100', '吉首', '4', '0743', '416000', '中国,湖南省,湘西土家族苗族自治州,吉首市', 'Jishou', '109.69799', '28.26247');
INSERT INTO `tb_region` VALUES ('433122', '泸溪县', '433100', '泸溪', '4', '0743', '416100', '中国,湖南省,湘西土家族苗族自治州,泸溪县', 'Luxi', '110.21682', '28.2205');
INSERT INTO `tb_region` VALUES ('433123', '凤凰县', '433100', '凤凰', '4', '0743', '416200', '中国,湖南省,湘西土家族苗族自治州,凤凰县', 'Fenghuang', '109.60156', '27.94822');
INSERT INTO `tb_region` VALUES ('433124', '花垣县', '433100', '花垣', '4', '0743', '416400', '中国,湖南省,湘西土家族苗族自治州,花垣县', 'Huayuan', '109.48217', '28.5721');
INSERT INTO `tb_region` VALUES ('433125', '保靖县', '433100', '保靖', '4', '0743', '416500', '中国,湖南省,湘西土家族苗族自治州,保靖县', 'Baojing', '109.66049', '28.69997');
INSERT INTO `tb_region` VALUES ('433126', '古丈县', '433100', '古丈', '4', '0743', '416300', '中国,湖南省,湘西土家族苗族自治州,古丈县', 'Guzhang', '109.94812', '28.61944');
INSERT INTO `tb_region` VALUES ('433127', '永顺县', '433100', '永顺', '4', '0743', '416700', '中国,湖南省,湘西土家族苗族自治州,永顺县', 'Yongshun', '109.85266', '29.00103');
INSERT INTO `tb_region` VALUES ('433130', '龙山县', '433100', '龙山', '4', '0743', '416800', '中国,湖南省,湘西土家族苗族自治州,龙山县', 'Longshan', '109.4432', '29.45693');
INSERT INTO `tb_region` VALUES ('440000', '广东省', '100002', '广东', '2', '', '', '中国,广东省', 'Guangdong', '113.280637', '23.125178');
INSERT INTO `tb_region` VALUES ('440100', '广州市', '440000', '广州', '3', '020', '510032', '中国,广东省,广州市', 'Guangzhou', '113.280637', '23.125178');
INSERT INTO `tb_region` VALUES ('440103', '荔湾区', '440100', '荔湾', '4', '020', '510170', '中国,广东省,广州市,荔湾区', 'Liwan', '113.2442', '23.12592');
INSERT INTO `tb_region` VALUES ('440104', '越秀区', '440100', '越秀', '4', '020', '510030', '中国,广东省,广州市,越秀区', 'Yuexiu', '113.26683', '23.12897');
INSERT INTO `tb_region` VALUES ('440105', '海珠区', '440100', '海珠', '4', '020', '510300', '中国,广东省,广州市,海珠区', 'Haizhu', '113.26197', '23.10379');
INSERT INTO `tb_region` VALUES ('440106', '天河区', '440100', '天河', '4', '020', '510665', '中国,广东省,广州市,天河区', 'Tianhe', '113.36112', '23.12467');
INSERT INTO `tb_region` VALUES ('440111', '白云区', '440100', '白云', '4', '020', '510405', '中国,广东省,广州市,白云区', 'Baiyun', '113.27307', '23.15787');
INSERT INTO `tb_region` VALUES ('440112', '黄埔区', '440100', '黄埔', '4', '020', '510700', '中国,广东省,广州市,黄埔区', 'Huangpu', '113.45895', '23.10642');
INSERT INTO `tb_region` VALUES ('440113', '番禺区', '440100', '番禺', '4', '020', '511400', '中国,广东省,广州市,番禺区', 'Panyu', '113.38397', '22.93599');
INSERT INTO `tb_region` VALUES ('440114', '花都区', '440100', '花都', '4', '020', '510800', '中国,广东省,广州市,花都区', 'Huadu', '113.22033', '23.40358');
INSERT INTO `tb_region` VALUES ('440115', '南沙区', '440100', '南沙', '4', '020', '511458', '中国,广东省,广州市,南沙区', 'Nansha', '113.60845', '22.77144');
INSERT INTO `tb_region` VALUES ('440117', '从化区', '440100', '从化', '4', '020', '510900', '中国,广东省,广州市,从化区', 'Conghua', '113.587386', '23.545283');
INSERT INTO `tb_region` VALUES ('440118', '增城区', '440100', '增城', '4', '020', '511300', '中国,广东省,广州市,增城区', 'Zengcheng', '113.829579', '23.290497');
INSERT INTO `tb_region` VALUES ('440200', '韶关市', '440000', '韶关', '3', '0751', '512002', '中国,广东省,韶关市', 'Shaoguan', '113.591544', '24.801322');
INSERT INTO `tb_region` VALUES ('440203', '武江区', '440200', '武江', '4', '0751', '512026', '中国,广东省,韶关市,武江区', 'Wujiang', '113.58767', '24.79264');
INSERT INTO `tb_region` VALUES ('440204', '浈江区', '440200', '浈江', '4', '0751', '512023', '中国,广东省,韶关市,浈江区', 'Zhenjiang', '113.61109', '24.80438');
INSERT INTO `tb_region` VALUES ('440205', '曲江区', '440200', '曲江', '4', '0751', '512101', '中国,广东省,韶关市,曲江区', 'Qujiang', '113.60165', '24.67915');
INSERT INTO `tb_region` VALUES ('440222', '始兴县', '440200', '始兴', '4', '0751', '512500', '中国,广东省,韶关市,始兴县', 'Shixing', '114.06799', '24.94759');
INSERT INTO `tb_region` VALUES ('440224', '仁化县', '440200', '仁化', '4', '0751', '512300', '中国,广东省,韶关市,仁化县', 'Renhua', '113.74737', '25.08742');
INSERT INTO `tb_region` VALUES ('440229', '翁源县', '440200', '翁源', '4', '0751', '512600', '中国,广东省,韶关市,翁源县', 'Wengyuan', '114.13385', '24.3495');
INSERT INTO `tb_region` VALUES ('440232', '乳源瑶族自治县', '440200', '乳源', '4', '0751', '512700', '中国,广东省,韶关市,乳源瑶族自治县', 'Ruyuan', '113.27734', '24.77803');
INSERT INTO `tb_region` VALUES ('440233', '新丰县', '440200', '新丰', '4', '0751', '511100', '中国,广东省,韶关市,新丰县', 'Xinfeng', '114.20788', '24.05924');
INSERT INTO `tb_region` VALUES ('440281', '乐昌市', '440200', '乐昌', '4', '0751', '512200', '中国,广东省,韶关市,乐昌市', 'Lechang', '113.35653', '25.12799');
INSERT INTO `tb_region` VALUES ('440282', '南雄市', '440200', '南雄', '4', '0751', '512400', '中国,广东省,韶关市,南雄市', 'Nanxiong', '114.30966', '25.11706');
INSERT INTO `tb_region` VALUES ('440300', '深圳市', '440000', '深圳', '3', '0755', '518035', '中国,广东省,深圳市', 'Shenzhen', '114.085947', '22.547');
INSERT INTO `tb_region` VALUES ('440303', '罗湖区', '440300', '罗湖', '4', '0755', '518021', '中国,广东省,深圳市,罗湖区', 'Luohu', '114.13116', '22.54836');
INSERT INTO `tb_region` VALUES ('440304', '福田区', '440300', '福田', '4', '0755', '518048', '中国,广东省,深圳市,福田区', 'Futian', '114.05571', '22.52245');
INSERT INTO `tb_region` VALUES ('440305', '南山区', '440300', '南山', '4', '0755', '518051', '中国,广东省,深圳市,南山区', 'Nanshan', '113.93029', '22.53291');
INSERT INTO `tb_region` VALUES ('440306', '宝安区', '440300', '宝安', '4', '0755', '518101', '中国,广东省,深圳市,宝安区', 'Bao\'an', '113.88311', '22.55371');
INSERT INTO `tb_region` VALUES ('440307', '龙岗区', '440300', '龙岗', '4', '0755', '518172', '中国,广东省,深圳市,龙岗区', 'Longgang', '114.24771', '22.71986');
INSERT INTO `tb_region` VALUES ('440308', '盐田区', '440300', '盐田', '4', '0755', '518081', '中国,广东省,深圳市,盐田区', 'Yantian', '114.23733', '22.5578');
INSERT INTO `tb_region` VALUES ('440309', '光明新区', '440300', '光明新区', '4', '0755', '518100', '中国,广东省,深圳市,光明新区', 'Guangmingxinqu', '113.896026', '22.777292');
INSERT INTO `tb_region` VALUES ('440310', '坪山新区', '440300', '坪山新区', '4', '0755', '518000', '中国,广东省,深圳市,坪山新区', 'Pingshanxinqu', '114.34637', '22.690529');
INSERT INTO `tb_region` VALUES ('440311', '大鹏新区', '440300', '大鹏新区', '4', '0755', '518000', '中国,广东省,深圳市,大鹏新区', 'Dapengxinqu', '114.479901', '22.587862');
INSERT INTO `tb_region` VALUES ('440312', '龙华新区', '440300', '龙华新区', '4', '0755', '518100', '中国,广东省,深圳市,龙华新区', 'Longhuaxinqu', '114.036585', '22.68695');
INSERT INTO `tb_region` VALUES ('440400', '珠海市', '440000', '珠海', '3', '0756', '519000', '中国,广东省,珠海市', 'Zhuhai', '113.552724', '22.255899');
INSERT INTO `tb_region` VALUES ('440402', '香洲区', '440400', '香洲', '4', '0756', '519000', '中国,广东省,珠海市,香洲区', 'Xiangzhou', '113.5435', '22.26654');
INSERT INTO `tb_region` VALUES ('440403', '斗门区', '440400', '斗门', '4', '0756', '519110', '中国,广东省,珠海市,斗门区', 'Doumen', '113.29644', '22.20898');
INSERT INTO `tb_region` VALUES ('440404', '金湾区', '440400', '金湾', '4', '0756', '519040', '中国,广东省,珠海市,金湾区', 'Jinwan', '113.36361', '22.14691');
INSERT INTO `tb_region` VALUES ('440500', '汕头市', '440000', '汕头', '3', '0754', '515041', '中国,广东省,汕头市', 'Shantou', '116.708463', '23.37102');
INSERT INTO `tb_region` VALUES ('440507', '龙湖区', '440500', '龙湖', '4', '0754', '515041', '中国,广东省,汕头市,龙湖区', 'Longhu', '116.71641', '23.37166');
INSERT INTO `tb_region` VALUES ('440511', '金平区', '440500', '金平', '4', '0754', '515041', '中国,广东省,汕头市,金平区', 'Jinping', '116.70364', '23.36637');
INSERT INTO `tb_region` VALUES ('440512', '濠江区', '440500', '濠江', '4', '0754', '515071', '中国,广东省,汕头市,濠江区', 'Haojiang', '116.72659', '23.28588');
INSERT INTO `tb_region` VALUES ('440513', '潮阳区', '440500', '潮阳', '4', '0754', '515100', '中国,广东省,汕头市,潮阳区', 'Chaoyang', '116.6015', '23.26485');
INSERT INTO `tb_region` VALUES ('440514', '潮南区', '440500', '潮南', '4', '0754', '515144', '中国,广东省,汕头市,潮南区', 'Chaonan', '116.43188', '23.25');
INSERT INTO `tb_region` VALUES ('440515', '澄海区', '440500', '澄海', '4', '0754', '515800', '中国,广东省,汕头市,澄海区', 'Chenghai', '116.75589', '23.46728');
INSERT INTO `tb_region` VALUES ('440523', '南澳县', '440500', '南澳', '4', '0754', '515900', '中国,广东省,汕头市,南澳县', 'Nanao', '117.01889', '23.4223');
INSERT INTO `tb_region` VALUES ('440600', '佛山市', '440000', '佛山', '3', '0757', '528000', '中国,广东省,佛山市', 'Foshan', '113.122717', '23.028762');
INSERT INTO `tb_region` VALUES ('440604', '禅城区', '440600', '禅城', '4', '0757', '528000', '中国,广东省,佛山市,禅城区', 'Chancheng', '113.1228', '23.00842');
INSERT INTO `tb_region` VALUES ('440605', '南海区', '440600', '南海', '4', '0757', '528251', '中国,广东省,佛山市,南海区', 'Nanhai', '113.14299', '23.02877');
INSERT INTO `tb_region` VALUES ('440606', '顺德区', '440600', '顺德', '4', '0757', '528300', '中国,广东省,佛山市,顺德区', 'Shunde', '113.29394', '22.80452');
INSERT INTO `tb_region` VALUES ('440607', '三水区', '440600', '三水', '4', '0757', '528133', '中国,广东省,佛山市,三水区', 'Sanshui', '112.89703', '23.15564');
INSERT INTO `tb_region` VALUES ('440608', '高明区', '440600', '高明', '4', '0757', '528500', '中国,广东省,佛山市,高明区', 'Gaoming', '112.89254', '22.90022');
INSERT INTO `tb_region` VALUES ('440700', '江门市', '440000', '江门', '3', '0750', '529000', '中国,广东省,江门市', 'Jiangmen', '113.094942', '22.590431');
INSERT INTO `tb_region` VALUES ('440703', '蓬江区', '440700', '蓬江', '4', '0750', '529000', '中国,广东省,江门市,蓬江区', 'Pengjiang', '113.07849', '22.59515');
INSERT INTO `tb_region` VALUES ('440704', '江海区', '440700', '江海', '4', '0750', '529040', '中国,广东省,江门市,江海区', 'Jianghai', '113.11099', '22.56024');
INSERT INTO `tb_region` VALUES ('440705', '新会区', '440700', '新会', '4', '0750', '529100', '中国,广东省,江门市,新会区', 'Xinhui', '113.03225', '22.45876');
INSERT INTO `tb_region` VALUES ('440781', '台山市', '440700', '台山', '4', '0750', '529200', '中国,广东省,江门市,台山市', 'Taishan', '112.79382', '22.2515');
INSERT INTO `tb_region` VALUES ('440783', '开平市', '440700', '开平', '4', '0750', '529337', '中国,广东省,江门市,开平市', 'Kaiping', '112.69842', '22.37622');
INSERT INTO `tb_region` VALUES ('440784', '鹤山市', '440700', '鹤山', '4', '0750', '529700', '中国,广东省,江门市,鹤山市', 'Heshan', '112.96429', '22.76523');
INSERT INTO `tb_region` VALUES ('440785', '恩平市', '440700', '恩平', '4', '0750', '529400', '中国,广东省,江门市,恩平市', 'Enping', '112.30496', '22.18288');
INSERT INTO `tb_region` VALUES ('440800', '湛江市', '440000', '湛江', '3', '0759', '524047', '中国,广东省,湛江市', 'Zhanjiang', '110.405529', '21.195338');
INSERT INTO `tb_region` VALUES ('440802', '赤坎区', '440800', '赤坎', '4', '0759', '524033', '中国,广东省,湛江市,赤坎区', 'Chikan', '110.36592', '21.26606');
INSERT INTO `tb_region` VALUES ('440803', '霞山区', '440800', '霞山', '4', '0759', '524011', '中国,广东省,湛江市,霞山区', 'Xiashan', '110.39822', '21.19181');
INSERT INTO `tb_region` VALUES ('440804', '坡头区', '440800', '坡头', '4', '0759', '524057', '中国,广东省,湛江市,坡头区', 'Potou', '110.45533', '21.24472');
INSERT INTO `tb_region` VALUES ('440811', '麻章区', '440800', '麻章', '4', '0759', '524094', '中国,广东省,湛江市,麻章区', 'Mazhang', '110.3342', '21.26333');
INSERT INTO `tb_region` VALUES ('440823', '遂溪县', '440800', '遂溪', '4', '0759', '524300', '中国,广东省,湛江市,遂溪县', 'Suixi', '110.25003', '21.37721');
INSERT INTO `tb_region` VALUES ('440825', '徐闻县', '440800', '徐闻', '4', '0759', '524100', '中国,广东省,湛江市,徐闻县', 'Xuwen', '110.17379', '20.32812');
INSERT INTO `tb_region` VALUES ('440881', '廉江市', '440800', '廉江', '4', '0759', '524400', '中国,广东省,湛江市,廉江市', 'Lianjiang', '110.28442', '21.60917');
INSERT INTO `tb_region` VALUES ('440882', '雷州市', '440800', '雷州', '4', '0759', '524200', '中国,广东省,湛江市,雷州市', 'Leizhou', '110.10092', '20.91428');
INSERT INTO `tb_region` VALUES ('440883', '吴川市', '440800', '吴川', '4', '0759', '524500', '中国,广东省,湛江市,吴川市', 'Wuchuan', '110.77703', '21.44584');
INSERT INTO `tb_region` VALUES ('440900', '茂名市', '440000', '茂名', '3', '0668', '525000', '中国,广东省,茂名市', 'Maoming', '110.919229', '21.659751');
INSERT INTO `tb_region` VALUES ('440902', '茂南区', '440900', '茂南', '4', '0668', '525000', '中国,广东省,茂名市,茂南区', 'Maonan', '110.9187', '21.64103');
INSERT INTO `tb_region` VALUES ('440904', '电白区', '440900', '电白', '4', '0668', '525400', '中国,广东省,茂名市,电白区', 'Dianbai', '111.007264', '21.507219');
INSERT INTO `tb_region` VALUES ('440981', '高州市', '440900', '高州', '4', '0668', '525200', '中国,广东省,茂名市,高州市', 'Gaozhou', '110.85519', '21.92057');
INSERT INTO `tb_region` VALUES ('440982', '化州市', '440900', '化州', '4', '0668', '525100', '中国,广东省,茂名市,化州市', 'Huazhou', '110.63949', '21.66394');
INSERT INTO `tb_region` VALUES ('440983', '信宜市', '440900', '信宜', '4', '0668', '525300', '中国,广东省,茂名市,信宜市', 'Xinyi', '110.94647', '22.35351');
INSERT INTO `tb_region` VALUES ('441200', '肇庆市', '440000', '肇庆', '3', '0758', '526040', '中国,广东省,肇庆市', 'Zhaoqing', '112.472529', '23.051546');
INSERT INTO `tb_region` VALUES ('441202', '端州区', '441200', '端州', '4', '0758', '526060', '中国,广东省,肇庆市,端州区', 'Duanzhou', '112.48495', '23.0519');
INSERT INTO `tb_region` VALUES ('441203', '鼎湖区', '441200', '鼎湖', '4', '0758', '526070', '中国,广东省,肇庆市,鼎湖区', 'Dinghu', '112.56643', '23.15846');
INSERT INTO `tb_region` VALUES ('441223', '广宁县', '441200', '广宁', '4', '0758', '526300', '中国,广东省,肇庆市,广宁县', 'Guangning', '112.44064', '23.6346');
INSERT INTO `tb_region` VALUES ('441224', '怀集县', '441200', '怀集', '4', '0758', '526400', '中国,广东省,肇庆市,怀集县', 'Huaiji', '112.18396', '23.90918');
INSERT INTO `tb_region` VALUES ('441225', '封开县', '441200', '封开', '4', '0758', '526500', '中国,广东省,肇庆市,封开县', 'Fengkai', '111.50332', '23.43571');
INSERT INTO `tb_region` VALUES ('441226', '德庆县', '441200', '德庆', '4', '0758', '526600', '中国,广东省,肇庆市,德庆县', 'Deqing', '111.78555', '23.14371');
INSERT INTO `tb_region` VALUES ('441283', '高要市', '441200', '高要', '4', '0758', '526100', '中国,广东省,肇庆市,高要市', 'Gaoyao', '112.45834', '23.02577');
INSERT INTO `tb_region` VALUES ('441284', '四会市', '441200', '四会', '4', '0758', '526200', '中国,广东省,肇庆市,四会市', 'Sihui', '112.73416', '23.32686');
INSERT INTO `tb_region` VALUES ('441300', '惠州市', '440000', '惠州', '3', '0752', '516000', '中国,广东省,惠州市', 'Huizhou', '114.412599', '23.079404');
INSERT INTO `tb_region` VALUES ('441302', '惠城区', '441300', '惠城', '4', '0752', '516008', '中国,广东省,惠州市,惠城区', 'Huicheng', '114.3828', '23.08377');
INSERT INTO `tb_region` VALUES ('441303', '惠阳区', '441300', '惠阳', '4', '0752', '516211', '中国,广东省,惠州市,惠阳区', 'Huiyang', '114.45639', '22.78845');
INSERT INTO `tb_region` VALUES ('441322', '博罗县', '441300', '博罗', '4', '0752', '516100', '中国,广东省,惠州市,博罗县', 'Boluo', '114.28964', '23.17307');
INSERT INTO `tb_region` VALUES ('441323', '惠东县', '441300', '惠东', '4', '0752', '516300', '中国,广东省,惠州市,惠东县', 'Huidong', '114.72009', '22.98484');
INSERT INTO `tb_region` VALUES ('441324', '龙门县', '441300', '龙门', '4', '0752', '516800', '中国,广东省,惠州市,龙门县', 'Longmen', '114.25479', '23.72758');
INSERT INTO `tb_region` VALUES ('441400', '梅州市', '440000', '梅州', '3', '0753', '514021', '中国,广东省,梅州市', 'Meizhou', '116.117582', '24.299112');
INSERT INTO `tb_region` VALUES ('441402', '梅江区', '441400', '梅江', '4', '0753', '514000', '中国,广东省,梅州市,梅江区', 'Meijiang', '116.11663', '24.31062');
INSERT INTO `tb_region` VALUES ('441403', '梅县区', '441400', '梅县', '4', '0753', '514787', '中国,广东省,梅州市,梅县区', 'Meixian', '116.097753', '24.286739');
INSERT INTO `tb_region` VALUES ('441422', '大埔县', '441400', '大埔', '4', '0753', '514200', '中国,广东省,梅州市,大埔县', 'Dabu', '116.69662', '24.35325');
INSERT INTO `tb_region` VALUES ('441423', '丰顺县', '441400', '丰顺', '4', '0753', '514300', '中国,广东省,梅州市,丰顺县', 'Fengshun', '116.18219', '23.74094');
INSERT INTO `tb_region` VALUES ('441424', '五华县', '441400', '五华', '4', '0753', '514400', '中国,广东省,梅州市,五华县', 'Wuhua', '115.77893', '23.92417');
INSERT INTO `tb_region` VALUES ('441426', '平远县', '441400', '平远', '4', '0753', '514600', '中国,广东省,梅州市,平远县', 'Pingyuan', '115.89556', '24.57116');
INSERT INTO `tb_region` VALUES ('441427', '蕉岭县', '441400', '蕉岭', '4', '0753', '514100', '中国,广东省,梅州市,蕉岭县', 'Jiaoling', '116.17089', '24.65732');
INSERT INTO `tb_region` VALUES ('441481', '兴宁市', '441400', '兴宁', '4', '0753', '514500', '中国,广东省,梅州市,兴宁市', 'Xingning', '115.73141', '24.14001');
INSERT INTO `tb_region` VALUES ('441500', '汕尾市', '440000', '汕尾', '3', '0660', '516600', '中国,广东省,汕尾市', 'Shanwei', '115.364238', '22.774485');
INSERT INTO `tb_region` VALUES ('441502', '城区', '441500', '城区', '4', '0660', '516600', '中国,广东省,汕尾市,城区', 'Chengqu', '115.36503', '22.7789');
INSERT INTO `tb_region` VALUES ('441521', '海丰县', '441500', '海丰', '4', '0660', '516400', '中国,广东省,汕尾市,海丰县', 'Haifeng', '115.32336', '22.96653');
INSERT INTO `tb_region` VALUES ('441523', '陆河县', '441500', '陆河', '4', '0660', '516700', '中国,广东省,汕尾市,陆河县', 'Luhe', '115.65597', '23.30365');
INSERT INTO `tb_region` VALUES ('441581', '陆丰市', '441500', '陆丰', '4', '0660', '516500', '中国,广东省,汕尾市,陆丰市', 'Lufeng', '115.64813', '22.94335');
INSERT INTO `tb_region` VALUES ('441600', '河源市', '440000', '河源', '3', '0762', '517000', '中国,广东省,河源市', 'Heyuan', '114.697802', '23.746266');
INSERT INTO `tb_region` VALUES ('441602', '源城区', '441600', '源城', '4', '0762', '517000', '中国,广东省,河源市,源城区', 'Yuancheng', '114.70242', '23.7341');
INSERT INTO `tb_region` VALUES ('441621', '紫金县', '441600', '紫金', '4', '0762', '517400', '中国,广东省,河源市,紫金县', 'Zijin', '115.18365', '23.63867');
INSERT INTO `tb_region` VALUES ('441622', '龙川县', '441600', '龙川', '4', '0762', '517300', '中国,广东省,河源市,龙川县', 'Longchuan', '115.26025', '24.10142');
INSERT INTO `tb_region` VALUES ('441623', '连平县', '441600', '连平', '4', '0762', '517100', '中国,广东省,河源市,连平县', 'Lianping', '114.49026', '24.37156');
INSERT INTO `tb_region` VALUES ('441624', '和平县', '441600', '和平', '4', '0762', '517200', '中国,广东省,河源市,和平县', 'Heping', '114.93841', '24.44319');
INSERT INTO `tb_region` VALUES ('441625', '东源县', '441600', '东源', '4', '0762', '517583', '中国,广东省,河源市,东源县', 'Dongyuan', '114.74633', '23.78835');
INSERT INTO `tb_region` VALUES ('441700', '阳江市', '440000', '阳江', '3', '0662', '529500', '中国,广东省,阳江市', 'Yangjiang', '111.975107', '21.859222');
INSERT INTO `tb_region` VALUES ('441702', '江城区', '441700', '江城', '4', '0662', '529500', '中国,广东省,阳江市,江城区', 'Jiangcheng', '111.95488', '21.86193');
INSERT INTO `tb_region` VALUES ('441704', '阳东区', '441700', '阳东', '4', '0662', '529900', '中国,广东省,阳江市,阳东区', 'Yangdong', '112.01467', '21.87398');
INSERT INTO `tb_region` VALUES ('441721', '阳西县', '441700', '阳西', '4', '0662', '529800', '中国,广东省,阳江市,阳西县', 'Yangxi', '111.61785', '21.75234');
INSERT INTO `tb_region` VALUES ('441781', '阳春市', '441700', '阳春', '4', '0662', '529600', '中国,广东省,阳江市,阳春市', 'Yangchun', '111.78854', '22.17232');
INSERT INTO `tb_region` VALUES ('441800', '清远市', '440000', '清远', '3', '0763', '511500', '中国,广东省,清远市', 'Qingyuan', '113.036779', '23.704188');
INSERT INTO `tb_region` VALUES ('441802', '清城区', '441800', '清城', '4', '0763', '511515', '中国,广东省,清远市,清城区', 'Qingcheng', '113.06265', '23.69784');
INSERT INTO `tb_region` VALUES ('441803', '清新区', '441800', '清新', '4', '0763', '511810', '中国,广东省,清远市,清新区', 'Qingxin', '113.015203', '23.736949');
INSERT INTO `tb_region` VALUES ('441821', '佛冈县', '441800', '佛冈', '4', '0763', '511600', '中国,广东省,清远市,佛冈县', 'Fogang', '113.53286', '23.87231');
INSERT INTO `tb_region` VALUES ('441823', '阳山县', '441800', '阳山', '4', '0763', '513100', '中国,广东省,清远市,阳山县', 'Yangshan', '112.64129', '24.46516');
INSERT INTO `tb_region` VALUES ('441825', '连山壮族瑶族自治县', '441800', '连山', '4', '0763', '513200', '中国,广东省,清远市,连山壮族瑶族自治县', 'Lianshan', '112.0802', '24.56807');
INSERT INTO `tb_region` VALUES ('441826', '连南瑶族自治县', '441800', '连南', '4', '0763', '513300', '中国,广东省,清远市,连南瑶族自治县', 'Liannan', '112.28842', '24.71726');
INSERT INTO `tb_region` VALUES ('441881', '英德市', '441800', '英德', '4', '0763', '513000', '中国,广东省,清远市,英德市', 'Yingde', '113.415', '24.18571');
INSERT INTO `tb_region` VALUES ('441882', '连州市', '441800', '连州', '4', '0763', '513400', '中国,广东省,清远市,连州市', 'Lianzhou', '112.38153', '24.77913');
INSERT INTO `tb_region` VALUES ('441900', '东莞市', '440000', '东莞', '3', '0769', '523888', '中国,广东省,东莞市', 'Dongguan', '113.760234', '23.048884');
INSERT INTO `tb_region` VALUES ('441901', '莞城区', '441900', '莞城', '4', '0769', '523128', '中国,广东省,东莞市,莞城区', 'Guancheng', '113.751043', '23.053412');
INSERT INTO `tb_region` VALUES ('441902', '南城区', '441900', '南城', '4', '0769', '523617', '中国,广东省,东莞市,南城区', 'Nancheng', '113.752125', '23.02018');
INSERT INTO `tb_region` VALUES ('441904', '万江区', '441900', '万江', '4', '0769', '523039', '中国,广东省,东莞市,万江区', 'Wanjiang', '113.739053', '23.043842');
INSERT INTO `tb_region` VALUES ('441905', '石碣镇', '441900', '石碣', '4', '0769', '523290', '中国,广东省,东莞市,石碣镇', 'Shijie', '113.80217', '23.09899');
INSERT INTO `tb_region` VALUES ('441906', '石龙镇', '441900', '石龙', '4', '0769', '523326', '中国,广东省,东莞市,石龙镇', 'Shilong', '113.876381', '23.107444');
INSERT INTO `tb_region` VALUES ('441907', '茶山镇', '441900', '茶山', '4', '0769', '523380', '中国,广东省,东莞市,茶山镇', 'Chashan', '113.883526', '23.062375');
INSERT INTO `tb_region` VALUES ('441908', '石排镇', '441900', '石排', '4', '0769', '523346', '中国,广东省,东莞市,石排镇', 'Shipai', '113.919859', '23.0863');
INSERT INTO `tb_region` VALUES ('441909', '企石镇', '441900', '企石', '4', '0769', '523507', '中国,广东省,东莞市,企石镇', 'Qishi', '114.013233', '23.066044');
INSERT INTO `tb_region` VALUES ('441910', '横沥镇', '441900', '横沥', '4', '0769', '523471', '中国,广东省,东莞市,横沥镇', 'Hengli', '113.957436', '23.025732');
INSERT INTO `tb_region` VALUES ('441911', '桥头镇', '441900', '桥头', '4', '0769', '523520', '中国,广东省,东莞市,桥头镇', 'Qiaotou', '114.01385', '22.939727');
INSERT INTO `tb_region` VALUES ('441912', '谢岗镇', '441900', '谢岗', '4', '0769', '523592', '中国,广东省,东莞市,谢岗镇', 'Xiegang', '114.141396', '22.959664');
INSERT INTO `tb_region` VALUES ('441913', '东坑镇', '441900', '东坑', '4', '0769', '523451', '中国,广东省,东莞市,东坑镇', 'Dongkeng', '113.939835', '22.992804');
INSERT INTO `tb_region` VALUES ('441914', '常平镇', '441900', '常平', '4', '0769', '523560', '中国,广东省,东莞市,常平镇', 'Changping', '114.029627', '23.016116');
INSERT INTO `tb_region` VALUES ('441915', '寮步镇', '441900', '寮步', '4', '0769', '523411', '中国,广东省,东莞市,寮步镇', 'Liaobu', '113.884745', '22.991738');
INSERT INTO `tb_region` VALUES ('441916', '大朗镇', '441900', '大朗', '4', '0769', '523770', '中国,广东省,东莞市,大朗镇', 'Dalang', '113.9271', '22.965748');
INSERT INTO `tb_region` VALUES ('441917', '麻涌镇', '441900', '麻涌', '4', '0769', '523143', '中国,广东省,东莞市,麻涌镇', 'Machong', '113.546177', '23.045315');
INSERT INTO `tb_region` VALUES ('441918', '中堂镇', '441900', '中堂', '4', '0769', '523233', '中国,广东省,东莞市,中堂镇', 'Zhongtang', '113.654422', '23.090164');
INSERT INTO `tb_region` VALUES ('441919', '高埗镇', '441900', '高埗', '4', '0769', '523282', '中国,广东省,东莞市,高埗镇', 'Gaobu', '113.735917', '23.068415');
INSERT INTO `tb_region` VALUES ('441920', '樟木头镇', '441900', '樟木头', '4', '0769', '523619', '中国,广东省,东莞市,樟木头镇', 'Zhangmutou', '114.066298', '22.956682');
INSERT INTO `tb_region` VALUES ('441921', '大岭山镇', '441900', '大岭山', '4', '0769', '523835', '中国,广东省,东莞市,大岭山镇', 'Dalingshan', '113.782955', '22.885366');
INSERT INTO `tb_region` VALUES ('441922', '望牛墩镇', '441900', '望牛墩', '4', '0769', '523203', '中国,广东省,东莞市,望牛墩镇', 'Wangniudun', '113.658847', '23.055018');
INSERT INTO `tb_region` VALUES ('441923', '黄江镇', '441900', '黄江', '4', '0769', '523755', '中国,广东省,东莞市,黄江镇', 'Huangjiang', '113.992635', '22.877536');
INSERT INTO `tb_region` VALUES ('441924', '洪梅镇', '441900', '洪梅', '4', '0769', '523163', '中国,广东省,东莞市,洪梅镇', 'Hongmei', '113.613081', '22.992675');
INSERT INTO `tb_region` VALUES ('441925', '清溪镇', '441900', '清溪', '4', '0769', '523660', '中国,广东省,东莞市,清溪镇', 'Qingxi', '114.155796', '22.844456');
INSERT INTO `tb_region` VALUES ('441926', '沙田镇', '441900', '沙田', '4', '0769', '523988', '中国,广东省,东莞市,沙田镇', 'Shatian', '113.760234', '23.048884');
INSERT INTO `tb_region` VALUES ('441927', '道滘镇', '441900', '道滘', '4', '0769', '523171', '中国,广东省,东莞市,道滘镇', 'Daojiao', '113.760234', '23.048884');
INSERT INTO `tb_region` VALUES ('441928', '塘厦镇', '441900', '塘厦', '4', '0769', '523713', '中国,广东省,东莞市,塘厦镇', 'Tangxia', '114.10765', '22.822862');
INSERT INTO `tb_region` VALUES ('441929', '虎门镇', '441900', '虎门', '4', '0769', '523932', '中国,广东省,东莞市,虎门镇', 'Humen', '113.71118', '22.82615');
INSERT INTO `tb_region` VALUES ('441930', '厚街镇', '441900', '厚街', '4', '0769', '523960', '中国,广东省,东莞市,厚街镇', 'Houjie', '113.67301', '22.940815');
INSERT INTO `tb_region` VALUES ('441931', '凤岗镇', '441900', '凤岗', '4', '0769', '523690', '中国,广东省,东莞市,凤岗镇', 'Fenggang', '114.141194', '22.744598');
INSERT INTO `tb_region` VALUES ('441932', '长安镇', '441900', '长安', '4', '0769', '523850', '中国,广东省,东莞市,长安镇', 'Chang\'an', '113.803939', '22.816644');
INSERT INTO `tb_region` VALUES ('442000', '中山市', '440000', '中山', '3', '0760', '528403', '中国,广东省,中山市', 'Zhongshan', '113.382391', '22.521113');
INSERT INTO `tb_region` VALUES ('442001', '石岐区', '442000', '石岐', '4', '0760', '528400', '中国,广东省,中山市,石岐区', 'Shiqi', '113.378835', '22.52522');
INSERT INTO `tb_region` VALUES ('442004', '南区', '442000', '南区', '4', '0760', '528400', '中国,广东省,中山市,南区', 'Nanqu', '113.355896', '22.486568');
INSERT INTO `tb_region` VALUES ('442005', '五桂山区', '442000', '五桂山', '4', '0760', '528458', '中国,广东省,中山市,五桂山区', 'Wuguishan', '113.41079', '22.51968');
INSERT INTO `tb_region` VALUES ('442006', '火炬开发区', '442000', '火炬', '4', '0760', '528437', '中国,广东省,中山市,火炬开发区', 'Huoju', '113.480523', '22.566082');
INSERT INTO `tb_region` VALUES ('442007', '黄圃镇', '442000', '黄圃', '4', '0760', '528429', '中国,广东省,中山市,黄圃镇', 'Huangpu', '113.342359', '22.715116');
INSERT INTO `tb_region` VALUES ('442008', '南头镇', '442000', '南头', '4', '0760', '528421', '中国,广东省,中山市,南头镇', 'Nantou', '113.296358', '22.713907');
INSERT INTO `tb_region` VALUES ('442009', '东凤镇', '442000', '东凤', '4', '0760', '528425', '中国,广东省,中山市,东凤镇', 'Dongfeng', '113.26114', '22.68775');
INSERT INTO `tb_region` VALUES ('442010', '阜沙镇', '442000', '阜沙', '4', '0760', '528434', '中国,广东省,中山市,阜沙镇', 'Fusha', '113.353024', '22.666364');
INSERT INTO `tb_region` VALUES ('442011', '小榄镇', '442000', '小榄', '4', '0760', '528415', '中国,广东省,中山市,小榄镇', 'Xiaolan', '113.244235', '22.666951');
INSERT INTO `tb_region` VALUES ('442012', '东升镇', '442000', '东升', '4', '0760', '528400', '中国,广东省,中山市,东升镇', 'Dongsheng', '113.296298', '22.614003');
INSERT INTO `tb_region` VALUES ('442013', '古镇镇', '442000', '古镇', '4', '0760', '528422', '中国,广东省,中山市,古镇镇', 'Guzhen', '113.179745', '22.611019');
INSERT INTO `tb_region` VALUES ('442014', '横栏镇', '442000', '横栏', '4', '0760', '528478', '中国,广东省,中山市,横栏镇', 'Henglan', '113.265845', '22.523202');
INSERT INTO `tb_region` VALUES ('442015', '三角镇', '442000', '三角', '4', '0760', '528422', '中国,广东省,中山市,三角镇', 'Sanjiao', '113.423624', '22.677033');
INSERT INTO `tb_region` VALUES ('442016', '民众镇', '442000', '民众', '4', '0760', '528441', '中国,广东省,中山市,民众镇', 'Minzhong', '113.486025', '22.623468');
INSERT INTO `tb_region` VALUES ('442017', '南朗镇', '442000', '南朗', '4', '0760', '528454', '中国,广东省,中山市,南朗镇', 'Nanlang', '113.533939', '22.492378');
INSERT INTO `tb_region` VALUES ('442018', '港口镇', '442000', '港口', '4', '0760', '528447', '中国,广东省,中山市,港口镇', 'Gangkou', '113.382391', '22.521113');
INSERT INTO `tb_region` VALUES ('442019', '大涌镇', '442000', '大涌', '4', '0760', '528476', '中国,广东省,中山市,大涌镇', 'Dayong', '113.291708', '22.467712');
INSERT INTO `tb_region` VALUES ('442020', '沙溪镇', '442000', '沙溪', '4', '0760', '528471', '中国,广东省,中山市,沙溪镇', 'Shaxi', '113.328369', '22.526325');
INSERT INTO `tb_region` VALUES ('442021', '三乡镇', '442000', '三乡', '4', '0760', '528463', '中国,广东省,中山市,三乡镇', 'Sanxiang', '113.4334', '22.352494');
INSERT INTO `tb_region` VALUES ('442022', '板芙镇', '442000', '板芙', '4', '0760', '528459', '中国,广东省,中山市,板芙镇', 'Banfu', '113.320346', '22.415674');
INSERT INTO `tb_region` VALUES ('442023', '神湾镇', '442000', '神湾', '4', '0760', '528462', '中国,广东省,中山市,神湾镇', 'Shenwan', '113.359387', '22.312476');
INSERT INTO `tb_region` VALUES ('442024', '坦洲镇', '442000', '坦洲', '4', '0760', '528467', '中国,广东省,中山市,坦洲镇', 'Tanzhou', '113.485677', '22.261269');
INSERT INTO `tb_region` VALUES ('445100', '潮州市', '440000', '潮州', '3', '0768', '521000', '中国,广东省,潮州市', 'Chaozhou', '116.632301', '23.661701');
INSERT INTO `tb_region` VALUES ('445102', '湘桥区', '445100', '湘桥', '4', '0768', '521000', '中国,广东省,潮州市,湘桥区', 'Xiangqiao', '116.62805', '23.67451');
INSERT INTO `tb_region` VALUES ('445103', '潮安区', '445100', '潮安', '4', '0768', '515638', '中国,广东省,潮州市,潮安区', 'Chao\'an', '116.592895', '23.643656');
INSERT INTO `tb_region` VALUES ('445122', '饶平县', '445100', '饶平', '4', '0768', '515700', '中国,广东省,潮州市,饶平县', 'Raoping', '117.00692', '23.66994');
INSERT INTO `tb_region` VALUES ('445200', '揭阳市', '440000', '揭阳', '3', '0633', '522000', '中国,广东省,揭阳市', 'Jieyang', '116.355733', '23.543778');
INSERT INTO `tb_region` VALUES ('445202', '榕城区', '445200', '榕城', '4', '0633', '522000', '中国,广东省,揭阳市,榕城区', 'Rongcheng', '116.3671', '23.52508');
INSERT INTO `tb_region` VALUES ('445203', '揭东区', '445200', '揭东', '4', '0633', '515500', '中国,广东省,揭阳市,揭东区', 'Jiedong', '116.412947', '23.569887');
INSERT INTO `tb_region` VALUES ('445222', '揭西县', '445200', '揭西', '4', '0633', '515400', '中国,广东省,揭阳市,揭西县', 'Jiexi', '115.83883', '23.42714');
INSERT INTO `tb_region` VALUES ('445224', '惠来县', '445200', '惠来', '4', '0633', '515200', '中国,广东省,揭阳市,惠来县', 'Huilai', '116.29599', '23.03289');
INSERT INTO `tb_region` VALUES ('445281', '普宁市', '445200', '普宁', '4', '0633', '515300', '中国,广东省,揭阳市,普宁市', 'Puning', '116.16564', '23.29732');
INSERT INTO `tb_region` VALUES ('445300', '云浮市', '440000', '云浮', '3', '0766', '527300', '中国,广东省,云浮市', 'Yunfu', '112.044439', '22.929801');
INSERT INTO `tb_region` VALUES ('445302', '云城区', '445300', '云城', '4', '0766', '527300', '中国,广东省,云浮市,云城区', 'Yuncheng', '112.03908', '22.92996');
INSERT INTO `tb_region` VALUES ('445303', '云安区', '445300', '云安', '4', '0766', '527500', '中国,广东省,云浮市,云安区', 'Yun\'an', '112.00936', '23.07779');
INSERT INTO `tb_region` VALUES ('445321', '新兴县', '445300', '新兴', '4', '0766', '527400', '中国,广东省,云浮市,新兴县', 'Xinxing', '112.23019', '22.69734');
INSERT INTO `tb_region` VALUES ('445322', '郁南县', '445300', '郁南', '4', '0766', '527100', '中国,广东省,云浮市,郁南县', 'Yunan', '111.53387', '23.23307');
INSERT INTO `tb_region` VALUES ('445381', '罗定市', '445300', '罗定', '4', '0766', '527200', '中国,广东省,云浮市,罗定市', 'Luoding', '111.56979', '22.76967');
INSERT INTO `tb_region` VALUES ('450000', '广西壮族自治区', '100002', '广西', '2', '', '', '中国,广西壮族自治区', 'Guangxi', '108.320004', '22.82402');
INSERT INTO `tb_region` VALUES ('450100', '南宁市', '450000', '南宁', '3', '0771', '530028', '中国,广西壮族自治区,南宁市', 'Nanning', '108.320004', '22.82402');
INSERT INTO `tb_region` VALUES ('450102', '兴宁区', '450100', '兴宁', '4', '0771', '530023', '中国,广西壮族自治区,南宁市,兴宁区', 'Xingning', '108.36694', '22.85355');
INSERT INTO `tb_region` VALUES ('450103', '青秀区', '450100', '青秀', '4', '0771', '530213', '中国,广西壮族自治区,南宁市,青秀区', 'Qingxiu', '108.49545', '22.78511');
INSERT INTO `tb_region` VALUES ('450105', '江南区', '450100', '江南', '4', '0771', '530031', '中国,广西壮族自治区,南宁市,江南区', 'Jiangnan', '108.27325', '22.78127');
INSERT INTO `tb_region` VALUES ('450107', '西乡塘区', '450100', '西乡塘', '4', '0771', '530001', '中国,广西壮族自治区,南宁市,西乡塘区', 'Xixiangtang', '108.31347', '22.83386');
INSERT INTO `tb_region` VALUES ('450108', '良庆区', '450100', '良庆', '4', '0771', '530219', '中国,广西壮族自治区,南宁市,良庆区', 'Liangqing', '108.41284', '22.74914');
INSERT INTO `tb_region` VALUES ('450109', '邕宁区', '450100', '邕宁', '4', '0771', '530200', '中国,广西壮族自治区,南宁市,邕宁区', 'Yongning', '108.48684', '22.75628');
INSERT INTO `tb_region` VALUES ('450122', '武鸣县', '450100', '武鸣', '4', '0771', '530100', '中国,广西壮族自治区,南宁市,武鸣县', 'Wuming', '108.27719', '23.15643');
INSERT INTO `tb_region` VALUES ('450123', '隆安县', '450100', '隆安', '4', '0771', '532700', '中国,广西壮族自治区,南宁市,隆安县', 'Long\'an', '107.69192', '23.17336');
INSERT INTO `tb_region` VALUES ('450124', '马山县', '450100', '马山', '4', '0771', '530600', '中国,广西壮族自治区,南宁市,马山县', 'Mashan', '108.17697', '23.70931');
INSERT INTO `tb_region` VALUES ('450125', '上林县', '450100', '上林', '4', '0771', '530500', '中国,广西壮族自治区,南宁市,上林县', 'Shanglin', '108.60522', '23.432');
INSERT INTO `tb_region` VALUES ('450126', '宾阳县', '450100', '宾阳', '4', '0771', '530400', '中国,广西壮族自治区,南宁市,宾阳县', 'Binyang', '108.81185', '23.2196');
INSERT INTO `tb_region` VALUES ('450127', '横县', '450100', '横县', '4', '0771', '530300', '中国,广西壮族自治区,南宁市,横县', 'Hengxian', '109.26608', '22.68448');
INSERT INTO `tb_region` VALUES ('450128', '埌东新区', '450100', '埌东', '4', '0771', '530000', '中国,广西壮族自治区,南宁市,埌东新区', 'Langdong', '108.419094', '22.812976');
INSERT INTO `tb_region` VALUES ('450200', '柳州市', '450000', '柳州', '3', '0772', '545001', '中国,广西壮族自治区,柳州市', 'Liuzhou', '109.411703', '24.314617');
INSERT INTO `tb_region` VALUES ('450202', '城中区', '450200', '城中', '4', '0772', '545001', '中国,广西壮族自治区,柳州市,城中区', 'Chengzhong', '109.41082', '24.31543');
INSERT INTO `tb_region` VALUES ('450203', '鱼峰区', '450200', '鱼峰', '4', '0772', '545005', '中国,广西壮族自治区,柳州市,鱼峰区', 'Yufeng', '109.4533', '24.31868');
INSERT INTO `tb_region` VALUES ('450204', '柳南区', '450200', '柳南', '4', '0772', '545007', '中国,广西壮族自治区,柳州市,柳南区', 'Liunan', '109.38548', '24.33599');
INSERT INTO `tb_region` VALUES ('450205', '柳北区', '450200', '柳北', '4', '0772', '545002', '中国,广西壮族自治区,柳州市,柳北区', 'Liubei', '109.40202', '24.36267');
INSERT INTO `tb_region` VALUES ('450221', '柳江县', '450200', '柳江', '4', '0772', '545100', '中国,广西壮族自治区,柳州市,柳江县', 'Liujiang', '109.33273', '24.25596');
INSERT INTO `tb_region` VALUES ('450222', '柳城县', '450200', '柳城', '4', '0772', '545200', '中国,广西壮族自治区,柳州市,柳城县', 'Liucheng', '109.23877', '24.64951');
INSERT INTO `tb_region` VALUES ('450223', '鹿寨县', '450200', '鹿寨', '4', '0772', '545600', '中国,广西壮族自治区,柳州市,鹿寨县', 'Luzhai', '109.75177', '24.47306');
INSERT INTO `tb_region` VALUES ('450224', '融安县', '450200', '融安', '4', '0772', '545400', '中国,广西壮族自治区,柳州市,融安县', 'Rong\'an', '109.39761', '25.22465');
INSERT INTO `tb_region` VALUES ('450225', '融水苗族自治县', '450200', '融水', '4', '0772', '545300', '中国,广西壮族自治区,柳州市,融水苗族自治县', 'Rongshui', '109.25634', '25.06628');
INSERT INTO `tb_region` VALUES ('450226', '三江侗族自治县', '450200', '三江', '4', '0772', '545500', '中国,广西壮族自治区,柳州市,三江侗族自治县', 'Sanjiang', '109.60446', '25.78428');
INSERT INTO `tb_region` VALUES ('450227', '柳东新区', '450200', '柳东', '4', '0772', '545000', '中国,广西壮族自治区,柳州市,柳东新区', 'Liudong', '109.437053', '24.329204');
INSERT INTO `tb_region` VALUES ('450300', '桂林市', '450000', '桂林', '3', '0773', '541100', '中国,广西壮族自治区,桂林市', 'Guilin', '110.299121', '25.274215');
INSERT INTO `tb_region` VALUES ('450302', '秀峰区', '450300', '秀峰', '4', '0773', '541001', '中国,广西壮族自治区,桂林市,秀峰区', 'Xiufeng', '110.28915', '25.28249');
INSERT INTO `tb_region` VALUES ('450303', '叠彩区', '450300', '叠彩', '4', '0773', '541001', '中国,广西壮族自治区,桂林市,叠彩区', 'Diecai', '110.30195', '25.31381');
INSERT INTO `tb_region` VALUES ('450304', '象山区', '450300', '象山', '4', '0773', '541002', '中国,广西壮族自治区,桂林市,象山区', 'Xiangshan', '110.28108', '25.26168');
INSERT INTO `tb_region` VALUES ('450305', '七星区', '450300', '七星', '4', '0773', '541004', '中国,广西壮族自治区,桂林市,七星区', 'Qixing', '110.31793', '25.2525');
INSERT INTO `tb_region` VALUES ('450311', '雁山区', '450300', '雁山', '4', '0773', '541006', '中国,广西壮族自治区,桂林市,雁山区', 'Yanshan', '110.30911', '25.06038');
INSERT INTO `tb_region` VALUES ('450312', '临桂区', '450300', '临桂', '4', '0773', '541100', '中国,广西壮族自治区,桂林市,临桂区', 'Lingui', '110.205487', '25.246257');
INSERT INTO `tb_region` VALUES ('450321', '阳朔县', '450300', '阳朔', '4', '0773', '541900', '中国,广西壮族自治区,桂林市,阳朔县', 'Yangshuo', '110.49475', '24.77579');
INSERT INTO `tb_region` VALUES ('450323', '灵川县', '450300', '灵川', '4', '0773', '541200', '中国,广西壮族自治区,桂林市,灵川县', 'Lingchuan', '110.32949', '25.41292');
INSERT INTO `tb_region` VALUES ('450324', '全州县', '450300', '全州', '4', '0773', '541503', '中国,广西壮族自治区,桂林市,全州县', 'Quanzhou', '111.07211', '25.92799');
INSERT INTO `tb_region` VALUES ('450325', '兴安县', '450300', '兴安', '4', '0773', '541300', '中国,广西壮族自治区,桂林市,兴安县', 'Xing\'an', '110.67144', '25.61167');
INSERT INTO `tb_region` VALUES ('450326', '永福县', '450300', '永福', '4', '0773', '541800', '中国,广西壮族自治区,桂林市,永福县', 'Yongfu', '109.98333', '24.98004');
INSERT INTO `tb_region` VALUES ('450327', '灌阳县', '450300', '灌阳', '4', '0773', '541600', '中国,广西壮族自治区,桂林市,灌阳县', 'Guanyang', '111.15954', '25.48803');
INSERT INTO `tb_region` VALUES ('450328', '龙胜各族自治县', '450300', '龙胜', '4', '0773', '541700', '中国,广西壮族自治区,桂林市,龙胜各族自治县', 'Longsheng', '110.01226', '25.79614');
INSERT INTO `tb_region` VALUES ('450329', '资源县', '450300', '资源', '4', '0773', '541400', '中国,广西壮族自治区,桂林市,资源县', 'Ziyuan', '110.65255', '26.04237');
INSERT INTO `tb_region` VALUES ('450330', '平乐县', '450300', '平乐', '4', '0773', '542400', '中国,广西壮族自治区,桂林市,平乐县', 'Pingle', '110.64175', '24.63242');
INSERT INTO `tb_region` VALUES ('450331', '荔浦县', '450300', '荔浦', '4', '0773', '546600', '中国,广西壮族自治区,桂林市,荔浦县', 'Lipu', '110.3971', '24.49589');
INSERT INTO `tb_region` VALUES ('450332', '恭城瑶族自治县', '450300', '恭城', '4', '0773', '542500', '中国,广西壮族自治区,桂林市,恭城瑶族自治县', 'Gongcheng', '110.83035', '24.83286');
INSERT INTO `tb_region` VALUES ('450400', '梧州市', '450000', '梧州', '3', '0774', '543002', '中国,广西壮族自治区,梧州市', 'Wuzhou', '111.316229', '23.472309');
INSERT INTO `tb_region` VALUES ('450403', '万秀区', '450400', '万秀', '4', '0774', '543000', '中国,广西壮族自治区,梧州市,万秀区', 'Wanxiu', '111.32052', '23.47298');
INSERT INTO `tb_region` VALUES ('450405', '长洲区', '450400', '长洲', '4', '0774', '543003', '中国,广西壮族自治区,梧州市,长洲区', 'Changzhou', '111.27494', '23.48573');
INSERT INTO `tb_region` VALUES ('450406', '龙圩区', '450400', '龙圩', '4', '0774', '543002', '中国,广西壮族自治区,梧州市,龙圩区', 'Longxu', '111.316229', '23.472309');
INSERT INTO `tb_region` VALUES ('450421', '苍梧县', '450400', '苍梧', '4', '0774', '543100', '中国,广西壮族自治区,梧州市,苍梧县', 'Cangwu', '111.24533', '23.42049');
INSERT INTO `tb_region` VALUES ('450422', '藤县', '450400', '藤县', '4', '0774', '543300', '中国,广西壮族自治区,梧州市,藤县', 'Tengxian', '110.91418', '23.37605');
INSERT INTO `tb_region` VALUES ('450423', '蒙山县', '450400', '蒙山', '4', '0774', '546700', '中国,广西壮族自治区,梧州市,蒙山县', 'Mengshan', '110.52221', '24.20168');
INSERT INTO `tb_region` VALUES ('450481', '岑溪市', '450400', '岑溪', '4', '0774', '543200', '中国,广西壮族自治区,梧州市,岑溪市', 'Cenxi', '110.99594', '22.9191');
INSERT INTO `tb_region` VALUES ('450500', '北海市', '450000', '北海', '3', '0779', '536000', '中国,广西壮族自治区,北海市', 'Beihai', '109.119254', '21.473343');
INSERT INTO `tb_region` VALUES ('450502', '海城区', '450500', '海城', '4', '0779', '536000', '中国,广西壮族自治区,北海市,海城区', 'Haicheng', '109.11744', '21.47501');
INSERT INTO `tb_region` VALUES ('450503', '银海区', '450500', '银海', '4', '0779', '536000', '中国,广西壮族自治区,北海市,银海区', 'Yinhai', '109.13029', '21.4783');
INSERT INTO `tb_region` VALUES ('450512', '铁山港区', '450500', '铁山港', '4', '0779', '536017', '中国,广西壮族自治区,北海市,铁山港区', 'Tieshangang', '109.45578', '21.59661');
INSERT INTO `tb_region` VALUES ('450521', '合浦县', '450500', '合浦', '4', '0779', '536100', '中国,广西壮族自治区,北海市,合浦县', 'Hepu', '109.20068', '21.66601');
INSERT INTO `tb_region` VALUES ('450600', '防城港市', '450000', '防城港', '3', '0770', '538001', '中国,广西壮族自治区,防城港市', 'Fangchenggang', '108.345478', '21.614631');
INSERT INTO `tb_region` VALUES ('450602', '港口区', '450600', '港口', '4', '0770', '538001', '中国,广西壮族自治区,防城港市,港口区', 'Gangkou', '108.38022', '21.64342');
INSERT INTO `tb_region` VALUES ('450603', '防城区', '450600', '防城', '4', '0770', '538021', '中国,广西壮族自治区,防城港市,防城区', 'Fangcheng', '108.35726', '21.76464');
INSERT INTO `tb_region` VALUES ('450621', '上思县', '450600', '上思', '4', '0770', '535500', '中国,广西壮族自治区,防城港市,上思县', 'Shangsi', '107.9823', '22.14957');
INSERT INTO `tb_region` VALUES ('450681', '东兴市', '450600', '东兴', '4', '0770', '538100', '中国,广西壮族自治区,防城港市,东兴市', 'Dongxing', '107.97204', '21.54713');
INSERT INTO `tb_region` VALUES ('450700', '钦州市', '450000', '钦州', '3', '0777', '535099', '中国,广西壮族自治区,钦州市', 'Qinzhou', '108.624175', '21.967127');
INSERT INTO `tb_region` VALUES ('450702', '钦南区', '450700', '钦南', '4', '0777', '535099', '中国,广西壮族自治区,钦州市,钦南区', 'Qinnan', '108.61775', '21.95137');
INSERT INTO `tb_region` VALUES ('450703', '钦北区', '450700', '钦北', '4', '0777', '535099', '中国,广西壮族自治区,钦州市,钦北区', 'Qinbei', '108.63037', '21.95127');
INSERT INTO `tb_region` VALUES ('450721', '灵山县', '450700', '灵山', '4', '0777', '535099', '中国,广西壮族自治区,钦州市,灵山县', 'Lingshan', '109.29153', '22.4165');
INSERT INTO `tb_region` VALUES ('450722', '浦北县', '450700', '浦北', '4', '0777', '535099', '中国,广西壮族自治区,钦州市,浦北县', 'Pubei', '109.55572', '22.26888');
INSERT INTO `tb_region` VALUES ('450800', '贵港市', '450000', '贵港', '3', '0775', '537100', '中国,广西壮族自治区,贵港市', 'Guigang', '109.602146', '23.0936');
INSERT INTO `tb_region` VALUES ('450802', '港北区', '450800', '港北', '4', '0775', '537100', '中国,广西壮族自治区,贵港市,港北区', 'Gangbei', '109.57224', '23.11153');
INSERT INTO `tb_region` VALUES ('450803', '港南区', '450800', '港南', '4', '0775', '537100', '中国,广西壮族自治区,贵港市,港南区', 'Gangnan', '109.60617', '23.07226');
INSERT INTO `tb_region` VALUES ('450804', '覃塘区', '450800', '覃塘', '4', '0775', '537121', '中国,广西壮族自治区,贵港市,覃塘区', 'Qintang', '109.44293', '23.12677');
INSERT INTO `tb_region` VALUES ('450821', '平南县', '450800', '平南', '4', '0775', '537300', '中国,广西壮族自治区,贵港市,平南县', 'Pingnan', '110.39062', '23.54201');
INSERT INTO `tb_region` VALUES ('450881', '桂平市', '450800', '桂平', '4', '0775', '537200', '中国,广西壮族自治区,贵港市,桂平市', 'Guiping', '110.08105', '23.39339');
INSERT INTO `tb_region` VALUES ('450900', '玉林市', '450000', '玉林', '3', '0775', '537000', '中国,广西壮族自治区,玉林市', 'Yulin', '110.154393', '22.63136');
INSERT INTO `tb_region` VALUES ('450902', '玉州区', '450900', '玉州', '4', '0775', '537000', '中国,广西壮族自治区,玉林市,玉州区', 'Yuzhou', '110.15114', '22.6281');
INSERT INTO `tb_region` VALUES ('450903', '福绵区', '450900', '福绵', '4', '0775', '537023', '中国,广西壮族自治区,玉林市,福绵区', 'Fumian', '110.064816', '22.583057');
INSERT INTO `tb_region` VALUES ('450904', '玉东新区', '450900', '玉东', '4', '0775', '537000', '中国,广西壮族自治区,玉林市,玉东新区', 'Yudong', '110.154393', '22.63136');
INSERT INTO `tb_region` VALUES ('450921', '容县', '450900', '容县', '4', '0775', '537500', '中国,广西壮族自治区,玉林市,容县', 'Rongxian', '110.55593', '22.85701');
INSERT INTO `tb_region` VALUES ('450922', '陆川县', '450900', '陆川', '4', '0775', '537700', '中国,广西壮族自治区,玉林市,陆川县', 'Luchuan', '110.26413', '22.32454');
INSERT INTO `tb_region` VALUES ('450923', '博白县', '450900', '博白', '4', '0775', '537600', '中国,广西壮族自治区,玉林市,博白县', 'Bobai', '109.97744', '22.27286');
INSERT INTO `tb_region` VALUES ('450924', '兴业县', '450900', '兴业', '4', '0775', '537800', '中国,广西壮族自治区,玉林市,兴业县', 'Xingye', '109.87612', '22.74237');
INSERT INTO `tb_region` VALUES ('450981', '北流市', '450900', '北流', '4', '0775', '537400', '中国,广西壮族自治区,玉林市,北流市', 'Beiliu', '110.35302', '22.70817');
INSERT INTO `tb_region` VALUES ('451000', '百色市', '450000', '百色', '3', '0776', '533000', '中国,广西壮族自治区,百色市', 'Baise', '106.616285', '23.897742');
INSERT INTO `tb_region` VALUES ('451002', '右江区', '451000', '右江', '4', '0776', '533000', '中国,广西壮族自治区,百色市,右江区', 'Youjiang', '106.61764', '23.9009');
INSERT INTO `tb_region` VALUES ('451021', '田阳县', '451000', '田阳', '4', '0776', '533600', '中国,广西壮族自治区,百色市,田阳县', 'Tianyang', '106.91558', '23.73535');
INSERT INTO `tb_region` VALUES ('451022', '田东县', '451000', '田东', '4', '0776', '531500', '中国,广西壮族自治区,百色市,田东县', 'Tiandong', '107.12432', '23.60003');
INSERT INTO `tb_region` VALUES ('451023', '平果县', '451000', '平果', '4', '0776', '531400', '中国,广西壮族自治区,百色市,平果县', 'Pingguo', '107.59045', '23.32969');
INSERT INTO `tb_region` VALUES ('451024', '德保县', '451000', '德保', '4', '0776', '533700', '中国,广西壮族自治区,百色市,德保县', 'Debao', '106.61917', '23.32515');
INSERT INTO `tb_region` VALUES ('451025', '靖西县', '451000', '靖西', '4', '0776', '533800', '中国,广西壮族自治区,百色市,靖西县', 'Jingxi', '106.41766', '23.13425');
INSERT INTO `tb_region` VALUES ('451026', '那坡县', '451000', '那坡', '4', '0776', '533900', '中国,广西壮族自治区,百色市,那坡县', 'Napo', '105.84191', '23.40649');
INSERT INTO `tb_region` VALUES ('451027', '凌云县', '451000', '凌云', '4', '0776', '533100', '中国,广西壮族自治区,百色市,凌云县', 'Lingyun', '106.56155', '24.34747');
INSERT INTO `tb_region` VALUES ('451028', '乐业县', '451000', '乐业', '4', '0776', '533200', '中国,广西壮族自治区,百色市,乐业县', 'Leye', '106.56124', '24.78295');
INSERT INTO `tb_region` VALUES ('451029', '田林县', '451000', '田林', '4', '0776', '533300', '中国,广西壮族自治区,百色市,田林县', 'Tianlin', '106.22882', '24.29207');
INSERT INTO `tb_region` VALUES ('451030', '西林县', '451000', '西林', '4', '0776', '533500', '中国,广西壮族自治区,百色市,西林县', 'Xilin', '105.09722', '24.48966');
INSERT INTO `tb_region` VALUES ('451031', '隆林各族自治县', '451000', '隆林', '4', '0776', '533400', '中国,广西壮族自治区,百色市,隆林各族自治县', 'Longlin', '105.34295', '24.77036');
INSERT INTO `tb_region` VALUES ('451100', '贺州市', '450000', '贺州', '3', '0774', '542800', '中国,广西壮族自治区,贺州市', 'Hezhou', '111.552056', '24.414141');
INSERT INTO `tb_region` VALUES ('451102', '八步区', '451100', '八步', '4', '0774', '542800', '中国,广西壮族自治区,贺州市,八步区', 'Babu', '111.55225', '24.41179');
INSERT INTO `tb_region` VALUES ('451121', '昭平县', '451100', '昭平', '4', '0774', '546800', '中国,广西壮族自治区,贺州市,昭平县', 'Zhaoping', '110.81082', '24.1701');
INSERT INTO `tb_region` VALUES ('451122', '钟山县', '451100', '钟山', '4', '0774', '542600', '中国,广西壮族自治区,贺州市,钟山县', 'Zhongshan', '111.30459', '24.52482');
INSERT INTO `tb_region` VALUES ('451123', '富川瑶族自治县', '451100', '富川', '4', '0774', '542700', '中国,广西壮族自治区,贺州市,富川瑶族自治县', 'Fuchuan', '111.27767', '24.81431');
INSERT INTO `tb_region` VALUES ('451124', '平桂管理区', '451100', '平桂', '4', '0774', '542800', '中国,广西壮族自治区,贺州市,平桂管理区', 'Pingui', '111.485651', '24.458041');
INSERT INTO `tb_region` VALUES ('451200', '河池市', '450000', '河池', '3', '0778', '547000', '中国,广西壮族自治区,河池市', 'Hechi', '108.062105', '24.695899');
INSERT INTO `tb_region` VALUES ('451202', '金城江区', '451200', '金城江', '4', '0779', '547000', '中国,广西壮族自治区,河池市,金城江区', 'Jinchengjiang', '108.03727', '24.6897');
INSERT INTO `tb_region` VALUES ('451221', '南丹县', '451200', '南丹', '4', '0781', '547200', '中国,广西壮族自治区,河池市,南丹县', 'Nandan', '107.54562', '24.9776');
INSERT INTO `tb_region` VALUES ('451222', '天峨县', '451200', '天峨', '4', '0782', '547300', '中国,广西壮族自治区,河池市,天峨县', 'Tiane', '107.17205', '24.99593');
INSERT INTO `tb_region` VALUES ('451223', '凤山县', '451200', '凤山', '4', '0783', '547600', '中国,广西壮族自治区,河池市,凤山县', 'Fengshan', '107.04892', '24.54215');
INSERT INTO `tb_region` VALUES ('451224', '东兰县', '451200', '东兰', '4', '0784', '547400', '中国,广西壮族自治区,河池市,东兰县', 'Donglan', '107.37527', '24.51053');
INSERT INTO `tb_region` VALUES ('451225', '罗城仫佬族自治县', '451200', '罗城', '4', '0785', '546400', '中国,广西壮族自治区,河池市,罗城仫佬族自治县', 'Luocheng', '108.90777', '24.77923');
INSERT INTO `tb_region` VALUES ('451226', '环江毛南族自治县', '451200', '环江', '4', '0786', '547100', '中国,广西壮族自治区,河池市,环江毛南族自治县', 'Huanjiang', '108.26055', '24.82916');
INSERT INTO `tb_region` VALUES ('451227', '巴马瑶族自治县', '451200', '巴马', '4', '0787', '547500', '中国,广西壮族自治区,河池市,巴马瑶族自治县', 'Bama', '107.25308', '24.14135');
INSERT INTO `tb_region` VALUES ('451228', '都安瑶族自治县', '451200', '都安', '4', '0788', '530700', '中国,广西壮族自治区,河池市,都安瑶族自治县', 'Du\'an', '108.10116', '23.93245');
INSERT INTO `tb_region` VALUES ('451229', '大化瑶族自治县', '451200', '大化', '4', '0789', '530800', '中国,广西壮族自治区,河池市,大化瑶族自治县', 'Dahua', '107.9985', '23.74487');
INSERT INTO `tb_region` VALUES ('451281', '宜州市', '451200', '宜州', '4', '0780', '546300', '中国,广西壮族自治区,河池市,宜州市', 'Yizhou', '108.65304', '24.49391');
INSERT INTO `tb_region` VALUES ('451300', '来宾市', '450000', '来宾', '3', '0772', '546100', '中国,广西壮族自治区,来宾市', 'Laibin', '109.229772', '23.733766');
INSERT INTO `tb_region` VALUES ('451302', '兴宾区', '451300', '兴宾', '4', '0772', '546100', '中国,广西壮族自治区,来宾市,兴宾区', 'Xingbin', '109.23471', '23.72731');
INSERT INTO `tb_region` VALUES ('451321', '忻城县', '451300', '忻城', '4', '0772', '546200', '中国,广西壮族自治区,来宾市,忻城县', 'Xincheng', '108.66357', '24.06862');
INSERT INTO `tb_region` VALUES ('451322', '象州县', '451300', '象州', '4', '0772', '545800', '中国,广西壮族自治区,来宾市,象州县', 'Xiangzhou', '109.6994', '23.97355');
INSERT INTO `tb_region` VALUES ('451323', '武宣县', '451300', '武宣', '4', '0772', '545900', '中国,广西壮族自治区,来宾市,武宣县', 'Wuxuan', '109.66284', '23.59474');
INSERT INTO `tb_region` VALUES ('451324', '金秀瑶族自治县', '451300', '金秀', '4', '0772', '545799', '中国,广西壮族自治区,来宾市,金秀瑶族自治县', 'Jinxiu', '110.19079', '24.12929');
INSERT INTO `tb_region` VALUES ('451381', '合山市', '451300', '合山', '4', '0772', '546500', '中国,广西壮族自治区,来宾市,合山市', 'Heshan', '108.88586', '23.80619');
INSERT INTO `tb_region` VALUES ('451400', '崇左市', '450000', '崇左', '3', '0771', '532299', '中国,广西壮族自治区,崇左市', 'Chongzuo', '107.353926', '22.404108');
INSERT INTO `tb_region` VALUES ('451402', '江州区', '451400', '江州', '4', '0771', '532299', '中国,广西壮族自治区,崇左市,江州区', 'Jiangzhou', '107.34747', '22.41135');
INSERT INTO `tb_region` VALUES ('451421', '扶绥县', '451400', '扶绥', '4', '0771', '532199', '中国,广西壮族自治区,崇左市,扶绥县', 'Fusui', '107.90405', '22.63413');
INSERT INTO `tb_region` VALUES ('451422', '宁明县', '451400', '宁明', '4', '0771', '532599', '中国,广西壮族自治区,崇左市,宁明县', 'Ningming', '107.07299', '22.13655');
INSERT INTO `tb_region` VALUES ('451423', '龙州县', '451400', '龙州', '4', '0771', '532499', '中国,广西壮族自治区,崇左市,龙州县', 'Longzhou', '106.85415', '22.33937');
INSERT INTO `tb_region` VALUES ('451424', '大新县', '451400', '大新', '4', '0771', '532399', '中国,广西壮族自治区,崇左市,大新县', 'Daxin', '107.19821', '22.83412');
INSERT INTO `tb_region` VALUES ('451425', '天等县', '451400', '天等', '4', '0771', '532899', '中国,广西壮族自治区,崇左市,天等县', 'Tiandeng', '107.13998', '23.077');
INSERT INTO `tb_region` VALUES ('451481', '凭祥市', '451400', '凭祥', '4', '0771', '532699', '中国,广西壮族自治区,崇左市,凭祥市', 'Pingxiang', '106.75534', '22.10573');
INSERT INTO `tb_region` VALUES ('460000', '海南省', '100002', '海南', '2', '', '', '中国,海南省', 'Hainan', '110.33119', '20.031971');
INSERT INTO `tb_region` VALUES ('460100', '海口市', '460000', '海口', '3', '0898', '570000', '中国,海南省,海口市', 'Haikou', '110.33119', '20.031971');
INSERT INTO `tb_region` VALUES ('460105', '秀英区', '460100', '秀英', '4', '0898', '570311', '中国,海南省,海口市,秀英区', 'Xiuying', '110.29345', '20.00752');
INSERT INTO `tb_region` VALUES ('460106', '龙华区', '460100', '龙华', '4', '0898', '570145', '中国,海南省,海口市,龙华区', 'Longhua', '110.30194', '20.02866');
INSERT INTO `tb_region` VALUES ('460107', '琼山区', '460100', '琼山', '4', '0898', '571100', '中国,海南省,海口市,琼山区', 'Qiongshan', '110.35418', '20.00321');
INSERT INTO `tb_region` VALUES ('460108', '美兰区', '460100', '美兰', '4', '0898', '570203', '中国,海南省,海口市,美兰区', 'Meilan', '110.36908', '20.02864');
INSERT INTO `tb_region` VALUES ('460200', '三亚市', '460000', '三亚', '3', '0898', '572000', '中国,海南省,三亚市', 'Sanya', '109.508268', '18.247872');
INSERT INTO `tb_region` VALUES ('460202', '海棠区', '460200', '海棠', '4', '0898', '572000', '中国,海南省,三亚市,海棠区', 'Haitang', '109.508268', '18.247872');
INSERT INTO `tb_region` VALUES ('460203', '吉阳区', '460200', '吉阳', '4', '0898', '572000', '中国,海南省,三亚市,吉阳区', 'Jiyang', '109.508268', '18.247872');
INSERT INTO `tb_region` VALUES ('460204', '天涯区', '460200', '天涯', '4', '0898', '572000', '中国,海南省,三亚市,天涯区', 'Tianya', '109.508268', '18.247872');
INSERT INTO `tb_region` VALUES ('460205', '崖州区', '460200', '崖州', '4', '0898', '572000', '中国,海南省,三亚市,崖州区', 'Yazhou', '109.508268', '18.247872');
INSERT INTO `tb_region` VALUES ('460300', '三沙市', '460000', '三沙', '3', '0898', '573199', '中国,海南省,三沙市', 'Sansha', '112.34882', '16.831039');
INSERT INTO `tb_region` VALUES ('460321', '西沙群岛', '460300', '西沙', '4', '0898', '572000', '中国,海南省,三沙市,西沙群岛', 'Xisha Islands', '112.025528', '16.331342');
INSERT INTO `tb_region` VALUES ('460322', '南沙群岛', '460300', '南沙', '4', '0898', '573100', '中国,海南省,三沙市,南沙群岛', 'Nansha Islands', '116.749998', '11.471888');
INSERT INTO `tb_region` VALUES ('460323', '中沙群岛', '460300', '中沙', '4', '0898', '573100', '中国,海南省,三沙市,中沙群岛', 'Zhongsha Islands', '117.740071', '15.112856');
INSERT INTO `tb_region` VALUES ('469000', '直辖县级', '460000', '', '3', '', '', '中国,海南省,直辖县级', '', '109.503479', '18.739906');
INSERT INTO `tb_region` VALUES ('469001', '五指山市', '469000', '五指山', '4', '0898', '572200', '中国,海南省,直辖县级,五指山市', 'Wuzhishan', '109.516662', '18.776921');
INSERT INTO `tb_region` VALUES ('469002', '琼海市', '469000', '琼海', '4', '0898', '571400', '中国,海南省,直辖县级,琼海市', 'Qionghai', '110.466785', '19.246011');
INSERT INTO `tb_region` VALUES ('469003', '儋州市', '469000', '儋州', '4', '0898', '571700', '中国,海南省,直辖县级,儋州市', 'Danzhou', '109.576782', '19.517486');
INSERT INTO `tb_region` VALUES ('469005', '文昌市', '469000', '文昌', '4', '0898', '571339', '中国,海南省,直辖县级,文昌市', 'Wenchang', '110.753975', '19.612986');
INSERT INTO `tb_region` VALUES ('469006', '万宁市', '469000', '万宁', '4', '0898', '571500', '中国,海南省,直辖县级,万宁市', 'Wanning', '110.388793', '18.796216');
INSERT INTO `tb_region` VALUES ('469007', '东方市', '469000', '东方', '4', '0898', '572600', '中国,海南省,直辖县级,东方市', 'Dongfang', '108.653789', '19.10198');
INSERT INTO `tb_region` VALUES ('469021', '定安县', '469000', '定安', '4', '0898', '571200', '中国,海南省,直辖县级,定安县', 'Ding\'an', '110.323959', '19.699211');
INSERT INTO `tb_region` VALUES ('469022', '屯昌县', '469000', '屯昌', '4', '0898', '571600', '中国,海南省,直辖县级,屯昌县', 'Tunchang', '110.102773', '19.362916');
INSERT INTO `tb_region` VALUES ('469023', '澄迈县', '469000', '澄迈', '4', '0898', '571900', '中国,海南省,直辖县级,澄迈县', 'Chengmai', '110.007147', '19.737095');
INSERT INTO `tb_region` VALUES ('469024', '临高县', '469000', '临高', '4', '0898', '571800', '中国,海南省,直辖县级,临高县', 'Lingao', '109.687697', '19.908293');
INSERT INTO `tb_region` VALUES ('469025', '白沙黎族自治县', '469000', '白沙', '4', '0898', '572800', '中国,海南省,直辖县级,白沙黎族自治县', 'Baisha', '109.452606', '19.224584');
INSERT INTO `tb_region` VALUES ('469026', '昌江黎族自治县', '469000', '昌江', '4', '0898', '572700', '中国,海南省,直辖县级,昌江黎族自治县', 'Changjiang', '109.053351', '19.260968');
INSERT INTO `tb_region` VALUES ('469027', '乐东黎族自治县', '469000', '乐东', '4', '0898', '572500', '中国,海南省,直辖县级,乐东黎族自治县', 'Ledong', '109.175444', '18.74758');
INSERT INTO `tb_region` VALUES ('469028', '陵水黎族自治县', '469000', '陵水', '4', '0898', '572400', '中国,海南省,直辖县级,陵水黎族自治县', 'Lingshui', '110.037218', '18.505006');
INSERT INTO `tb_region` VALUES ('469029', '保亭黎族苗族自治县', '469000', '保亭', '4', '0898', '572300', '中国,海南省,直辖县级,保亭黎族苗族自治县', 'Baoting', '109.70245', '18.636371');
INSERT INTO `tb_region` VALUES ('469030', '琼中黎族苗族自治县', '469000', '琼中', '4', '0898', '572900', '中国,海南省,直辖县级,琼中黎族苗族自治县', 'Qiongzhong', '109.839996', '19.03557');
INSERT INTO `tb_region` VALUES ('500000', '重庆', '100006', '重庆', '2', '', '', '中国,重庆', 'Chongqing', '106.504962', '29.533155');
INSERT INTO `tb_region` VALUES ('500100', '重庆市', '500000', '重庆', '3', '023', '400000', '中国,重庆,重庆市', 'Chongqing', '106.504962', '29.533155');
INSERT INTO `tb_region` VALUES ('500101', '万州区', '500100', '万州', '4', '023', '404000', '中国,重庆,重庆市,万州区', 'Wanzhou', '108.40869', '30.80788');
INSERT INTO `tb_region` VALUES ('500102', '涪陵区', '500100', '涪陵', '4', '023', '408000', '中国,重庆,重庆市,涪陵区', 'Fuling', '107.39007', '29.70292');
INSERT INTO `tb_region` VALUES ('500103', '渝中区', '500100', '渝中', '4', '023', '400010', '中国,重庆,重庆市,渝中区', 'Yuzhong', '106.56901', '29.55279');
INSERT INTO `tb_region` VALUES ('500104', '大渡口区', '500100', '大渡口', '4', '023', '400080', '中国,重庆,重庆市,大渡口区', 'Dadukou', '106.48262', '29.48447');
INSERT INTO `tb_region` VALUES ('500105', '江北区', '500100', '江北', '4', '023', '400020', '中国,重庆,重庆市,江北区', 'Jiangbei', '106.57434', '29.60658');
INSERT INTO `tb_region` VALUES ('500106', '沙坪坝区', '500100', '沙坪坝', '4', '023', '400030', '中国,重庆,重庆市,沙坪坝区', 'Shapingba', '106.45752', '29.54113');
INSERT INTO `tb_region` VALUES ('500107', '九龙坡区', '500100', '九龙坡', '4', '023', '400050', '中国,重庆,重庆市,九龙坡区', 'Jiulongpo', '106.51107', '29.50197');
INSERT INTO `tb_region` VALUES ('500108', '南岸区', '500100', '南岸', '4', '023', '400064', '中国,重庆,重庆市,南岸区', 'Nan\'an', '106.56347', '29.52311');
INSERT INTO `tb_region` VALUES ('500109', '北碚区', '500100', '北碚', '4', '023', '400700', '中国,重庆,重庆市,北碚区', 'Beibei', '106.39614', '29.80574');
INSERT INTO `tb_region` VALUES ('500110', '綦江区', '500100', '綦江', '4', '023', '400800', '中国,重庆,重庆市,綦江区', 'Qijiang', '106.926779', '28.960656');
INSERT INTO `tb_region` VALUES ('500111', '大足区', '500100', '大足', '4', '023', '400900', '中国,重庆,重庆市,大足区', 'Dazu', '105.768121', '29.484025');
INSERT INTO `tb_region` VALUES ('500112', '渝北区', '500100', '渝北', '4', '023', '401120', '中国,重庆,重庆市,渝北区', 'Yubei', '106.6307', '29.7182');
INSERT INTO `tb_region` VALUES ('500113', '巴南区', '500100', '巴南', '4', '023', '401320', '中国,重庆,重庆市,巴南区', 'Banan', '106.52365', '29.38311');
INSERT INTO `tb_region` VALUES ('500114', '黔江区', '500100', '黔江', '4', '023', '409700', '中国,重庆,重庆市,黔江区', 'Qianjiang', '108.7709', '29.5332');
INSERT INTO `tb_region` VALUES ('500115', '长寿区', '500100', '长寿', '4', '023', '401220', '中国,重庆,重庆市,长寿区', 'Changshou', '107.08166', '29.85359');
INSERT INTO `tb_region` VALUES ('500116', '江津区', '500100', '江津', '4', '023', '402260', '中国,重庆,重庆市,江津区', 'Jiangjin', '106.25912', '29.29008');
INSERT INTO `tb_region` VALUES ('500117', '合川区', '500100', '合川', '4', '023', '401520', '中国,重庆,重庆市,合川区', 'Hechuan', '106.27633', '29.97227');
INSERT INTO `tb_region` VALUES ('500118', '永川区', '500100', '永川', '4', '023', '402160', '中国,重庆,重庆市,永川区', 'Yongchuan', '105.927', '29.35593');
INSERT INTO `tb_region` VALUES ('500119', '南川区', '500100', '南川', '4', '023', '408400', '中国,重庆,重庆市,南川区', 'Nanchuan', '107.09936', '29.15751');
INSERT INTO `tb_region` VALUES ('500120', '璧山区', '500100', '璧山', '4', '023', '402760', '中国,重庆,重庆市,璧山区', 'Bishan', '106.231126', '29.593581');
INSERT INTO `tb_region` VALUES ('500151', '铜梁区', '500100', '铜梁', '4', '023', '402560', '中国,重庆,重庆市,铜梁区', 'Tongliang', '106.054948', '29.839944');
INSERT INTO `tb_region` VALUES ('500223', '潼南县', '500100', '潼南', '4', '023', '402660', '中国,重庆,重庆市,潼南县', 'Tongnan', '105.84005', '30.1912');
INSERT INTO `tb_region` VALUES ('500226', '荣昌县', '500100', '荣昌', '4', '023', '402460', '中国,重庆,重庆市,荣昌县', 'Rongchang', '105.59442', '29.40488');
INSERT INTO `tb_region` VALUES ('500228', '梁平县', '500100', '梁平', '4', '023', '405200', '中国,重庆,重庆市,梁平县', 'Liangping', '107.79998', '30.67545');
INSERT INTO `tb_region` VALUES ('500229', '城口县', '500100', '城口', '4', '023', '405900', '中国,重庆,重庆市,城口县', 'Chengkou', '108.66513', '31.94801');
INSERT INTO `tb_region` VALUES ('500230', '丰都县', '500100', '丰都', '4', '023', '408200', '中国,重庆,重庆市,丰都县', 'Fengdu', '107.73098', '29.86348');
INSERT INTO `tb_region` VALUES ('500231', '垫江县', '500100', '垫江', '4', '023', '408300', '中国,重庆,重庆市,垫江县', 'Dianjiang', '107.35446', '30.33359');
INSERT INTO `tb_region` VALUES ('500232', '武隆县', '500100', '武隆', '4', '023', '408500', '中国,重庆,重庆市,武隆县', 'Wulong', '107.7601', '29.32548');
INSERT INTO `tb_region` VALUES ('500233', '忠县', '500100', '忠县', '4', '023', '404300', '中国,重庆,重庆市,忠县', 'Zhongxian', '108.03689', '30.28898');
INSERT INTO `tb_region` VALUES ('500234', '开县', '500100', '开县', '4', '023', '405400', '中国,重庆,重庆市,开县', 'Kaixian', '108.39306', '31.16095');
INSERT INTO `tb_region` VALUES ('500235', '云阳县', '500100', '云阳', '4', '023', '404500', '中国,重庆,重庆市,云阳县', 'Yunyang', '108.69726', '30.93062');
INSERT INTO `tb_region` VALUES ('500236', '奉节县', '500100', '奉节', '4', '023', '404600', '中国,重庆,重庆市,奉节县', 'Fengjie', '109.46478', '31.01825');
INSERT INTO `tb_region` VALUES ('500237', '巫山县', '500100', '巫山', '4', '023', '404700', '中国,重庆,重庆市,巫山县', 'Wushan', '109.87814', '31.07458');
INSERT INTO `tb_region` VALUES ('500238', '巫溪县', '500100', '巫溪', '4', '023', '405800', '中国,重庆,重庆市,巫溪县', 'Wuxi', '109.63128', '31.39756');
INSERT INTO `tb_region` VALUES ('500240', '石柱土家族自治县', '500100', '石柱', '4', '023', '409100', '中国,重庆,重庆市,石柱土家族自治县', 'Shizhu', '108.11389', '30.00054');
INSERT INTO `tb_region` VALUES ('500241', '秀山土家族苗族自治县', '500100', '秀山', '4', '023', '409900', '中国,重庆,重庆市,秀山土家族苗族自治县', 'Xiushan', '108.98861', '28.45062');
INSERT INTO `tb_region` VALUES ('500242', '酉阳土家族苗族自治县', '500100', '酉阳', '4', '023', '409800', '中国,重庆,重庆市,酉阳土家族苗族自治县', 'Youyang', '108.77212', '28.8446');
INSERT INTO `tb_region` VALUES ('500243', '彭水苗族土家族自治县', '500100', '彭水', '4', '023', '409600', '中国,重庆,重庆市,彭水苗族土家族自治县', 'Pengshui', '108.16638', '29.29516');
INSERT INTO `tb_region` VALUES ('500300', '两江新区', '500000', '两江新区', '3', '023', '400000', '中国,重庆,两江新区', 'Liangjiangxinqu', '106.463344', '29.729153');
INSERT INTO `tb_region` VALUES ('500301', '北部新区', '500300', '北部新区', '4', '023', '400000', '中国,重庆,两江新区,北部新区', 'Beibuxinqu', '106.488841', '29.667062');
INSERT INTO `tb_region` VALUES ('500302', '保税港区', '500300', '保税港区', '4', '023', '400000', '中国,重庆,两江新区,保税港区', 'Baoshuigangqu', '106.638184', '29.716311');
INSERT INTO `tb_region` VALUES ('500303', '工业园区', '500300', '工业园区', '4', '023', '400000', '中国,重庆,两江新区,工业园区', 'Gongyeyuanqu', '106.626434', '29.55554');
INSERT INTO `tb_region` VALUES ('510000', '四川省', '100006', '四川', '2', '', '', '中国,四川省', 'Sichuan', '104.065735', '30.659462');
INSERT INTO `tb_region` VALUES ('510100', '成都市', '510000', '成都', '3', '028', '610015', '中国,四川省,成都市', 'Chengdu', '104.065735', '30.659462');
INSERT INTO `tb_region` VALUES ('510104', '锦江区', '510100', '锦江', '4', '028', '610021', '中国,四川省,成都市,锦江区', 'Jinjiang', '104.08347', '30.65614');
INSERT INTO `tb_region` VALUES ('510105', '青羊区', '510100', '青羊', '4', '028', '610031', '中国,四川省,成都市,青羊区', 'Qingyang', '104.06151', '30.67387');
INSERT INTO `tb_region` VALUES ('510106', '金牛区', '510100', '金牛', '4', '028', '610036', '中国,四川省,成都市,金牛区', 'Jinniu', '104.05114', '30.69126');
INSERT INTO `tb_region` VALUES ('510107', '武侯区', '510100', '武侯', '4', '028', '610041', '中国,四川省,成都市,武侯区', 'Wuhou', '104.04303', '30.64235');
INSERT INTO `tb_region` VALUES ('510108', '成华区', '510100', '成华', '4', '028', '610066', '中国,四川省,成都市,成华区', 'Chenghua', '104.10193', '30.65993');
INSERT INTO `tb_region` VALUES ('510112', '龙泉驿区', '510100', '龙泉驿', '4', '028', '610100', '中国,四川省,成都市,龙泉驿区', 'Longquanyi', '104.27462', '30.55658');
INSERT INTO `tb_region` VALUES ('510113', '青白江区', '510100', '青白江', '4', '028', '610300', '中国,四川省,成都市,青白江区', 'Qingbaijiang', '104.251', '30.87841');
INSERT INTO `tb_region` VALUES ('510114', '新都区', '510100', '新都', '4', '028', '610500', '中国,四川省,成都市,新都区', 'Xindu', '104.15921', '30.82314');
INSERT INTO `tb_region` VALUES ('510115', '温江区', '510100', '温江', '4', '028', '611130', '中国,四川省,成都市,温江区', 'Wenjiang', '103.84881', '30.68444');
INSERT INTO `tb_region` VALUES ('510121', '金堂县', '510100', '金堂', '4', '028', '610400', '中国,四川省,成都市,金堂县', 'Jintang', '104.41195', '30.86195');
INSERT INTO `tb_region` VALUES ('510122', '双流县', '510100', '双流', '4', '028', '610200', '中国,四川省,成都市,双流县', 'Shuangliu', '103.92373', '30.57444');
INSERT INTO `tb_region` VALUES ('510124', '郫县', '510100', '郫县', '4', '028', '611730', '中国,四川省,成都市,郫县', 'Pixian', '103.88717', '30.81054');
INSERT INTO `tb_region` VALUES ('510129', '大邑县', '510100', '大邑', '4', '028', '611330', '中国,四川省,成都市,大邑县', 'Dayi', '103.52075', '30.58738');
INSERT INTO `tb_region` VALUES ('510131', '蒲江县', '510100', '蒲江', '4', '028', '611630', '中国,四川省,成都市,蒲江县', 'Pujiang', '103.50616', '30.19667');
INSERT INTO `tb_region` VALUES ('510132', '新津县', '510100', '新津', '4', '028', '611430', '中国,四川省,成都市,新津县', 'Xinjin', '103.8114', '30.40983');
INSERT INTO `tb_region` VALUES ('510181', '都江堰市', '510100', '都江堰', '4', '028', '611830', '中国,四川省,成都市,都江堰市', 'Dujiangyan', '103.61941', '30.99825');
INSERT INTO `tb_region` VALUES ('510182', '彭州市', '510100', '彭州', '4', '028', '611930', '中国,四川省,成都市,彭州市', 'Pengzhou', '103.958', '30.99011');
INSERT INTO `tb_region` VALUES ('510183', '邛崃市', '510100', '邛崃', '4', '028', '611530', '中国,四川省,成都市,邛崃市', 'Qionglai', '103.46283', '30.41489');
INSERT INTO `tb_region` VALUES ('510184', '崇州市', '510100', '崇州', '4', '028', '611230', '中国,四川省,成都市,崇州市', 'Chongzhou', '103.67285', '30.63014');
INSERT INTO `tb_region` VALUES ('510300', '自贡市', '510000', '自贡', '3', '0813', '643000', '中国,四川省,自贡市', 'Zigong', '104.773447', '29.352765');
INSERT INTO `tb_region` VALUES ('510302', '自流井区', '510300', '自流井', '4', '0813', '643000', '中国,四川省,自贡市,自流井区', 'Ziliujing', '104.77719', '29.33745');
INSERT INTO `tb_region` VALUES ('510303', '贡井区', '510300', '贡井', '4', '0813', '643020', '中国,四川省,自贡市,贡井区', 'Gongjing', '104.71536', '29.34576');
INSERT INTO `tb_region` VALUES ('510304', '大安区', '510300', '大安', '4', '0813', '643010', '中国,四川省,自贡市,大安区', 'Da\'an', '104.77383', '29.36364');
INSERT INTO `tb_region` VALUES ('510311', '沿滩区', '510300', '沿滩', '4', '0813', '643030', '中国,四川省,自贡市,沿滩区', 'Yantan', '104.88012', '29.26611');
INSERT INTO `tb_region` VALUES ('510321', '荣县', '510300', '荣县', '4', '0813', '643100', '中国,四川省,自贡市,荣县', 'Rongxian', '104.4176', '29.44445');
INSERT INTO `tb_region` VALUES ('510322', '富顺县', '510300', '富顺', '4', '0813', '643200', '中国,四川省,自贡市,富顺县', 'Fushun', '104.97491', '29.18123');
INSERT INTO `tb_region` VALUES ('510400', '攀枝花市', '510000', '攀枝花', '3', '0812', '617000', '中国,四川省,攀枝花市', 'Panzhihua', '101.716007', '26.580446');
INSERT INTO `tb_region` VALUES ('510402', '东区', '510400', '东区', '4', '0812', '617067', '中国,四川省,攀枝花市,东区', 'Dongqu', '101.7052', '26.54677');
INSERT INTO `tb_region` VALUES ('510403', '西区', '510400', '西区', '4', '0812', '617068', '中国,四川省,攀枝花市,西区', 'Xiqu', '101.63058', '26.59753');
INSERT INTO `tb_region` VALUES ('510411', '仁和区', '510400', '仁和', '4', '0812', '617061', '中国,四川省,攀枝花市,仁和区', 'Renhe', '101.73812', '26.49841');
INSERT INTO `tb_region` VALUES ('510421', '米易县', '510400', '米易', '4', '0812', '617200', '中国,四川省,攀枝花市,米易县', 'Miyi', '102.11132', '26.88718');
INSERT INTO `tb_region` VALUES ('510422', '盐边县', '510400', '盐边', '4', '0812', '617100', '中国,四川省,攀枝花市,盐边县', 'Yanbian', '101.85446', '26.68847');
INSERT INTO `tb_region` VALUES ('510500', '泸州市', '510000', '泸州', '3', '0830', '646000', '中国,四川省,泸州市', 'Luzhou', '105.443348', '28.889138');
INSERT INTO `tb_region` VALUES ('510502', '江阳区', '510500', '江阳', '4', '0830', '646000', '中国,四川省,泸州市,江阳区', 'Jiangyang', '105.45336', '28.88934');
INSERT INTO `tb_region` VALUES ('510503', '纳溪区', '510500', '纳溪', '4', '0830', '646300', '中国,四川省,泸州市,纳溪区', 'Naxi', '105.37255', '28.77343');
INSERT INTO `tb_region` VALUES ('510504', '龙马潭区', '510500', '龙马潭', '4', '0830', '646000', '中国,四川省,泸州市,龙马潭区', 'Longmatan', '105.43774', '28.91308');
INSERT INTO `tb_region` VALUES ('510521', '泸县', '510500', '泸县', '4', '0830', '646106', '中国,四川省,泸州市,泸县', 'Luxian', '105.38192', '29.15041');
INSERT INTO `tb_region` VALUES ('510522', '合江县', '510500', '合江', '4', '0830', '646200', '中国,四川省,泸州市,合江县', 'Hejiang', '105.8352', '28.81005');
INSERT INTO `tb_region` VALUES ('510524', '叙永县', '510500', '叙永', '4', '0830', '646400', '中国,四川省,泸州市,叙永县', 'Xuyong', '105.44473', '28.15586');
INSERT INTO `tb_region` VALUES ('510525', '古蔺县', '510500', '古蔺', '4', '0830', '646500', '中国,四川省,泸州市,古蔺县', 'Gulin', '105.81347', '28.03867');
INSERT INTO `tb_region` VALUES ('510600', '德阳市', '510000', '德阳', '3', '0838', '618000', '中国,四川省,德阳市', 'Deyang', '104.398651', '31.127991');
INSERT INTO `tb_region` VALUES ('510603', '旌阳区', '510600', '旌阳', '4', '0838', '618000', '中国,四川省,德阳市,旌阳区', 'Jingyang', '104.39367', '31.13906');
INSERT INTO `tb_region` VALUES ('510623', '中江县', '510600', '中江', '4', '0838', '618100', '中国,四川省,德阳市,中江县', 'Zhongjiang', '104.67861', '31.03297');
INSERT INTO `tb_region` VALUES ('510626', '罗江县', '510600', '罗江', '4', '0838', '618500', '中国,四川省,德阳市,罗江县', 'Luojiang', '104.51025', '31.31665');
INSERT INTO `tb_region` VALUES ('510681', '广汉市', '510600', '广汉', '4', '0838', '618300', '中国,四川省,德阳市,广汉市', 'Guanghan', '104.28234', '30.97686');
INSERT INTO `tb_region` VALUES ('510682', '什邡市', '510600', '什邡', '4', '0838', '618400', '中国,四川省,德阳市,什邡市', 'Shifang', '104.16754', '31.1264');
INSERT INTO `tb_region` VALUES ('510683', '绵竹市', '510600', '绵竹', '4', '0838', '618200', '中国,四川省,德阳市,绵竹市', 'Mianzhu', '104.22076', '31.33772');
INSERT INTO `tb_region` VALUES ('510700', '绵阳市', '510000', '绵阳', '3', '0816', '621000', '中国,四川省,绵阳市', 'Mianyang', '104.741722', '31.46402');
INSERT INTO `tb_region` VALUES ('510703', '涪城区', '510700', '涪城', '4', '0816', '621000', '中国,四川省,绵阳市,涪城区', 'Fucheng', '104.75719', '31.45522');
INSERT INTO `tb_region` VALUES ('510704', '游仙区', '510700', '游仙', '4', '0816', '621022', '中国,四川省,绵阳市,游仙区', 'Youxian', '104.77092', '31.46574');
INSERT INTO `tb_region` VALUES ('510722', '三台县', '510700', '三台', '4', '0816', '621100', '中国,四川省,绵阳市,三台县', 'Santai', '105.09079', '31.09179');
INSERT INTO `tb_region` VALUES ('510723', '盐亭县', '510700', '盐亭', '4', '0816', '621600', '中国,四川省,绵阳市,盐亭县', 'Yanting', '105.3898', '31.22176');
INSERT INTO `tb_region` VALUES ('510724', '安县', '510700', '安县', '4', '0816', '622650', '中国,四川省,绵阳市,安县', 'Anxian', '104.56738', '31.53487');
INSERT INTO `tb_region` VALUES ('510725', '梓潼县', '510700', '梓潼', '4', '0816', '622150', '中国,四川省,绵阳市,梓潼县', 'Zitong', '105.16183', '31.6359');
INSERT INTO `tb_region` VALUES ('510726', '北川羌族自治县', '510700', '北川', '4', '0816', '622750', '中国,四川省,绵阳市,北川羌族自治县', 'Beichuan', '104.46408', '31.83286');
INSERT INTO `tb_region` VALUES ('510727', '平武县', '510700', '平武', '4', '0816', '622550', '中国,四川省,绵阳市,平武县', 'Pingwu', '104.52862', '32.40791');
INSERT INTO `tb_region` VALUES ('510781', '江油市', '510700', '江油', '4', '0816', '621700', '中国,四川省,绵阳市,江油市', 'Jiangyou', '104.74539', '31.77775');
INSERT INTO `tb_region` VALUES ('510800', '广元市', '510000', '广元', '3', '0839', '628000', '中国,四川省,广元市', 'Guangyuan', '105.829757', '32.433668');
INSERT INTO `tb_region` VALUES ('510802', '利州区', '510800', '利州', '4', '0839', '628017', '中国,四川省,广元市,利州区', 'Lizhou', '105.826194', '32.432276');
INSERT INTO `tb_region` VALUES ('510811', '昭化区', '510800', '昭化', '4', '0839', '628017', '中国,四川省,广元市,昭化区', 'Zhaohua', '105.640491', '32.386518');
INSERT INTO `tb_region` VALUES ('510812', '朝天区', '510800', '朝天', '4', '0839', '628017', '中国,四川省,广元市,朝天区', 'Chaotian', '105.89273', '32.64398');
INSERT INTO `tb_region` VALUES ('510821', '旺苍县', '510800', '旺苍', '4', '0839', '628200', '中国,四川省,广元市,旺苍县', 'Wangcang', '106.29022', '32.22845');
INSERT INTO `tb_region` VALUES ('510822', '青川县', '510800', '青川', '4', '0839', '628100', '中国,四川省,广元市,青川县', 'Qingchuan', '105.2391', '32.58563');
INSERT INTO `tb_region` VALUES ('510823', '剑阁县', '510800', '剑阁', '4', '0839', '628300', '中国,四川省,广元市,剑阁县', 'Jiange', '105.5252', '32.28845');
INSERT INTO `tb_region` VALUES ('510824', '苍溪县', '510800', '苍溪', '4', '0839', '628400', '中国,四川省,广元市,苍溪县', 'Cangxi', '105.936', '31.73209');
INSERT INTO `tb_region` VALUES ('510900', '遂宁市', '510000', '遂宁', '3', '0825', '629000', '中国,四川省,遂宁市', 'Suining', '105.571331', '30.513311');
INSERT INTO `tb_region` VALUES ('510903', '船山区', '510900', '船山', '4', '0825', '629000', '中国,四川省,遂宁市,船山区', 'Chuanshan', '105.5809', '30.49991');
INSERT INTO `tb_region` VALUES ('510904', '安居区', '510900', '安居', '4', '0825', '629000', '中国,四川省,遂宁市,安居区', 'Anju', '105.46402', '30.35778');
INSERT INTO `tb_region` VALUES ('510921', '蓬溪县', '510900', '蓬溪', '4', '0825', '629100', '中国,四川省,遂宁市,蓬溪县', 'Pengxi', '105.70752', '30.75775');
INSERT INTO `tb_region` VALUES ('510922', '射洪县', '510900', '射洪', '4', '0825', '629200', '中国,四川省,遂宁市,射洪县', 'Shehong', '105.38922', '30.87203');
INSERT INTO `tb_region` VALUES ('510923', '大英县', '510900', '大英', '4', '0825', '629300', '中国,四川省,遂宁市,大英县', 'Daying', '105.24346', '30.59434');
INSERT INTO `tb_region` VALUES ('511000', '内江市', '510000', '内江', '3', '0832', '641000', '中国,四川省,内江市', 'Neijiang', '105.066138', '29.58708');
INSERT INTO `tb_region` VALUES ('511002', '市中区', '511000', '市中区', '4', '0832', '641000', '中国,四川省,内江市,市中区', 'Shizhongqu', '105.0679', '29.58709');
INSERT INTO `tb_region` VALUES ('511011', '东兴区', '511000', '东兴', '4', '0832', '641100', '中国,四川省,内江市,东兴区', 'Dongxing', '105.07554', '29.59278');
INSERT INTO `tb_region` VALUES ('511024', '威远县', '511000', '威远', '4', '0832', '642450', '中国,四川省,内江市,威远县', 'Weiyuan', '104.66955', '29.52823');
INSERT INTO `tb_region` VALUES ('511025', '资中县', '511000', '资中', '4', '0832', '641200', '中国,四川省,内江市,资中县', 'Zizhong', '104.85205', '29.76409');
INSERT INTO `tb_region` VALUES ('511028', '隆昌县', '511000', '隆昌', '4', '0832', '642150', '中国,四川省,内江市,隆昌县', 'Longchang', '105.28738', '29.33937');
INSERT INTO `tb_region` VALUES ('511100', '乐山市', '510000', '乐山', '3', '0833', '614000', '中国,四川省,乐山市', 'Leshan', '103.761263', '29.582024');
INSERT INTO `tb_region` VALUES ('511102', '市中区', '511100', '市中区', '4', '0833', '614000', '中国,四川省,乐山市,市中区', 'Shizhongqu', '103.76159', '29.55543');
INSERT INTO `tb_region` VALUES ('511111', '沙湾区', '511100', '沙湾', '4', '0833', '614900', '中国,四川省,乐山市,沙湾区', 'Shawan', '103.54873', '29.41194');
INSERT INTO `tb_region` VALUES ('511112', '五通桥区', '511100', '五通桥', '4', '0833', '614800', '中国,四川省,乐山市,五通桥区', 'Wutongqiao', '103.82345', '29.40344');
INSERT INTO `tb_region` VALUES ('511113', '金口河区', '511100', '金口河', '4', '0833', '614700', '中国,四川省,乐山市,金口河区', 'Jinkouhe', '103.07858', '29.24578');
INSERT INTO `tb_region` VALUES ('511123', '犍为县', '511100', '犍为', '4', '0833', '614400', '中国,四川省,乐山市,犍为县', 'Qianwei', '103.94989', '29.20973');
INSERT INTO `tb_region` VALUES ('511124', '井研县', '511100', '井研', '4', '0833', '613100', '中国,四川省,乐山市,井研县', 'Jingyan', '104.07019', '29.65228');
INSERT INTO `tb_region` VALUES ('511126', '夹江县', '511100', '夹江', '4', '0833', '614100', '中国,四川省,乐山市,夹江县', 'Jiajiang', '103.57199', '29.73868');
INSERT INTO `tb_region` VALUES ('511129', '沐川县', '511100', '沐川', '4', '0833', '614500', '中国,四川省,乐山市,沐川县', 'Muchuan', '103.90353', '28.95646');
INSERT INTO `tb_region` VALUES ('511132', '峨边彝族自治县', '511100', '峨边', '4', '0833', '614300', '中国,四川省,乐山市,峨边彝族自治县', 'Ebian', '103.26339', '29.23004');
INSERT INTO `tb_region` VALUES ('511133', '马边彝族自治县', '511100', '马边', '4', '0833', '614600', '中国,四川省,乐山市,马边彝族自治县', 'Mabian', '103.54617', '28.83593');
INSERT INTO `tb_region` VALUES ('511181', '峨眉山市', '511100', '峨眉山', '4', '0833', '614200', '中国,四川省,乐山市,峨眉山市', 'Emeishan', '103.4844', '29.60117');
INSERT INTO `tb_region` VALUES ('511300', '南充市', '510000', '南充', '3', '0817', '637000', '中国,四川省,南充市', 'Nanchong', '106.082974', '30.795281');
INSERT INTO `tb_region` VALUES ('511302', '顺庆区', '511300', '顺庆', '4', '0817', '637000', '中国,四川省,南充市,顺庆区', 'Shunqing', '106.09216', '30.79642');
INSERT INTO `tb_region` VALUES ('511303', '高坪区', '511300', '高坪', '4', '0817', '637100', '中国,四川省,南充市,高坪区', 'Gaoping', '106.11894', '30.78162');
INSERT INTO `tb_region` VALUES ('511304', '嘉陵区', '511300', '嘉陵', '4', '0817', '637100', '中国,四川省,南充市,嘉陵区', 'Jialing', '106.07141', '30.75848');
INSERT INTO `tb_region` VALUES ('511321', '南部县', '511300', '南部', '4', '0817', '637300', '中国,四川省,南充市,南部县', 'Nanbu', '106.06738', '31.35451');
INSERT INTO `tb_region` VALUES ('511322', '营山县', '511300', '营山', '4', '0817', '637700', '中国,四川省,南充市,营山县', 'Yingshan', '106.56637', '31.07747');
INSERT INTO `tb_region` VALUES ('511323', '蓬安县', '511300', '蓬安', '4', '0817', '637800', '中国,四川省,南充市,蓬安县', 'Peng\'an', '106.41262', '31.02964');
INSERT INTO `tb_region` VALUES ('511324', '仪陇县', '511300', '仪陇', '4', '0817', '637600', '中国,四川省,南充市,仪陇县', 'Yilong', '106.29974', '31.27628');
INSERT INTO `tb_region` VALUES ('511325', '西充县', '511300', '西充', '4', '0817', '637200', '中国,四川省,南充市,西充县', 'Xichong', '105.89996', '30.9969');
INSERT INTO `tb_region` VALUES ('511381', '阆中市', '511300', '阆中', '4', '0817', '637400', '中国,四川省,南充市,阆中市', 'Langzhong', '106.00494', '31.55832');
INSERT INTO `tb_region` VALUES ('511400', '眉山市', '510000', '眉山', '3', '028', '620020', '中国,四川省,眉山市', 'Meishan', '103.831788', '30.048318');
INSERT INTO `tb_region` VALUES ('511402', '东坡区', '511400', '东坡', '4', '028', '620010', '中国,四川省,眉山市,东坡区', 'Dongpo', '103.832', '30.04219');
INSERT INTO `tb_region` VALUES ('511403', '彭山区', '511400', '彭山', '4', '028', '620860', '中国,四川省,眉山市,彭山区', 'Pengshan', '103.87268', '30.19283');
INSERT INTO `tb_region` VALUES ('511421', '仁寿县', '511400', '仁寿', '4', '028', '620500', '中国,四川省,眉山市,仁寿县', 'Renshou', '104.13412', '29.99599');
INSERT INTO `tb_region` VALUES ('511423', '洪雅县', '511400', '洪雅', '4', '028', '620360', '中国,四川省,眉山市,洪雅县', 'Hongya', '103.37313', '29.90661');
INSERT INTO `tb_region` VALUES ('511424', '丹棱县', '511400', '丹棱', '4', '028', '620200', '中国,四川省,眉山市,丹棱县', 'Danling', '103.51339', '30.01562');
INSERT INTO `tb_region` VALUES ('511425', '青神县', '511400', '青神', '4', '028', '620460', '中国,四川省,眉山市,青神县', 'Qingshen', '103.84771', '29.83235');
INSERT INTO `tb_region` VALUES ('511500', '宜宾市', '510000', '宜宾', '3', '0831', '644000', '中国,四川省,宜宾市', 'Yibin', '104.630825', '28.760189');
INSERT INTO `tb_region` VALUES ('511502', '翠屏区', '511500', '翠屏', '4', '0831', '644000', '中国,四川省,宜宾市,翠屏区', 'Cuiping', '104.61978', '28.76566');
INSERT INTO `tb_region` VALUES ('511503', '南溪区', '511500', '南溪', '4', '0831', '644100', '中国,四川省,宜宾市,南溪区', 'Nanxi', '104.981133', '28.839806');
INSERT INTO `tb_region` VALUES ('511521', '宜宾县', '511500', '宜宾', '4', '0831', '644600', '中国,四川省,宜宾市,宜宾县', 'Yibin', '104.53314', '28.68996');
INSERT INTO `tb_region` VALUES ('511523', '江安县', '511500', '江安', '4', '0831', '644200', '中国,四川省,宜宾市,江安县', 'Jiang\'an', '105.06683', '28.72385');
INSERT INTO `tb_region` VALUES ('511524', '长宁县', '511500', '长宁', '4', '0831', '644300', '中国,四川省,宜宾市,长宁县', 'Changning', '104.9252', '28.57777');
INSERT INTO `tb_region` VALUES ('511525', '高县', '511500', '高县', '4', '0831', '645150', '中国,四川省,宜宾市,高县', 'Gaoxian', '104.51754', '28.43619');
INSERT INTO `tb_region` VALUES ('511526', '珙县', '511500', '珙县', '4', '0831', '644500', '中国,四川省,宜宾市,珙县', 'Gongxian', '104.71398', '28.44512');
INSERT INTO `tb_region` VALUES ('511527', '筠连县', '511500', '筠连', '4', '0831', '645250', '中国,四川省,宜宾市,筠连县', 'Junlian', '104.51217', '28.16495');
INSERT INTO `tb_region` VALUES ('511528', '兴文县', '511500', '兴文', '4', '0831', '644400', '中国,四川省,宜宾市,兴文县', 'Xingwen', '105.23675', '28.3044');
INSERT INTO `tb_region` VALUES ('511529', '屏山县', '511500', '屏山', '4', '0831', '645350', '中国,四川省,宜宾市,屏山县', 'Pingshan', '104.16293', '28.64369');
INSERT INTO `tb_region` VALUES ('511600', '广安市', '510000', '广安', '3', '0826', '638000', '中国,四川省,广安市', 'Guang\'an', '106.633369', '30.456398');
INSERT INTO `tb_region` VALUES ('511602', '广安区', '511600', '广安', '4', '0826', '638000', '中国,四川省,广安市,广安区', 'Guang\'an', '106.64163', '30.47389');
INSERT INTO `tb_region` VALUES ('511603', '前锋区', '511600', '前锋', '4', '0826', '638019', '中国,四川省,广安市,前锋区', 'Qianfeng', '106.893537', '30.494572');
INSERT INTO `tb_region` VALUES ('511621', '岳池县', '511600', '岳池', '4', '0826', '638300', '中国,四川省,广安市,岳池县', 'Yuechi', '106.44079', '30.53918');
INSERT INTO `tb_region` VALUES ('511622', '武胜县', '511600', '武胜', '4', '0826', '638400', '中国,四川省,广安市,武胜县', 'Wusheng', '106.29592', '30.34932');
INSERT INTO `tb_region` VALUES ('511623', '邻水县', '511600', '邻水', '4', '0826', '638500', '中国,四川省,广安市,邻水县', 'Linshui', '106.92968', '30.33449');
INSERT INTO `tb_region` VALUES ('511681', '华蓥市', '511600', '华蓥', '4', '0826', '638600', '中国,四川省,广安市,华蓥市', 'Huaying', '106.78466', '30.39007');
INSERT INTO `tb_region` VALUES ('511700', '达州市', '510000', '达州', '3', '0818', '635000', '中国,四川省,达州市', 'Dazhou', '107.502262', '31.209484');
INSERT INTO `tb_region` VALUES ('511702', '通川区', '511700', '通川', '4', '0818', '635000', '中国,四川省,达州市,通川区', 'Tongchuan', '107.50456', '31.21469');
INSERT INTO `tb_region` VALUES ('511703', '达川区', '511700', '达川', '4', '0818', '635000', '中国,四川省,达州市,达川区', 'Dachuan', '107.502262', '31.209484');
INSERT INTO `tb_region` VALUES ('511722', '宣汉县', '511700', '宣汉', '4', '0818', '636150', '中国,四川省,达州市,宣汉县', 'Xuanhan', '107.72775', '31.35516');
INSERT INTO `tb_region` VALUES ('511723', '开江县', '511700', '开江', '4', '0818', '636250', '中国,四川省,达州市,开江县', 'Kaijiang', '107.86889', '31.0841');
INSERT INTO `tb_region` VALUES ('511724', '大竹县', '511700', '大竹', '4', '0818', '635100', '中国,四川省,达州市,大竹县', 'Dazhu', '107.20855', '30.74147');
INSERT INTO `tb_region` VALUES ('511725', '渠县', '511700', '渠县', '4', '0818', '635200', '中国,四川省,达州市,渠县', 'Quxian', '106.97381', '30.8376');
INSERT INTO `tb_region` VALUES ('511781', '万源市', '511700', '万源', '4', '0818', '636350', '中国,四川省,达州市,万源市', 'Wanyuan', '108.03598', '32.08091');
INSERT INTO `tb_region` VALUES ('511800', '雅安市', '510000', '雅安', '3', '0835', '625000', '中国,四川省,雅安市', 'Ya\'an', '103.001033', '29.987722');
INSERT INTO `tb_region` VALUES ('511802', '雨城区', '511800', '雨城', '4', '0835', '625000', '中国,四川省,雅安市,雨城区', 'Yucheng', '103.03305', '30.00531');
INSERT INTO `tb_region` VALUES ('511803', '名山区', '511800', '名山', '4', '0835', '625100', '中国,四川省,雅安市,名山区', 'Mingshan', '103.112214', '30.084718');
INSERT INTO `tb_region` VALUES ('511822', '荥经县', '511800', '荥经', '4', '0835', '625200', '中国,四川省,雅安市,荥经县', 'Yingjing', '102.84652', '29.79402');
INSERT INTO `tb_region` VALUES ('511823', '汉源县', '511800', '汉源', '4', '0835', '625300', '中国,四川省,雅安市,汉源县', 'Hanyuan', '102.6784', '29.35168');
INSERT INTO `tb_region` VALUES ('511824', '石棉县', '511800', '石棉', '4', '0835', '625400', '中国,四川省,雅安市,石棉县', 'Shimian', '102.35943', '29.22796');
INSERT INTO `tb_region` VALUES ('511825', '天全县', '511800', '天全', '4', '0835', '625500', '中国,四川省,雅安市,天全县', 'Tianquan', '102.75906', '30.06754');
INSERT INTO `tb_region` VALUES ('511826', '芦山县', '511800', '芦山', '4', '0835', '625600', '中国,四川省,雅安市,芦山县', 'Lushan', '102.92791', '30.14369');
INSERT INTO `tb_region` VALUES ('511827', '宝兴县', '511800', '宝兴', '4', '0835', '625700', '中国,四川省,雅安市,宝兴县', 'Baoxing', '102.81555', '30.36836');
INSERT INTO `tb_region` VALUES ('511900', '巴中市', '510000', '巴中', '3', '0827', '636000', '中国,四川省,巴中市', 'Bazhong', '106.753669', '31.858809');
INSERT INTO `tb_region` VALUES ('511902', '巴州区', '511900', '巴州', '4', '0827', '636001', '中国,四川省,巴中市,巴州区', 'Bazhou', '106.76889', '31.85125');
INSERT INTO `tb_region` VALUES ('511903', '恩阳区', '511900', '恩阳', '4', '0827', '636064', '中国,四川省,巴中市,恩阳区', 'Enyang', '106.753669', '31.858809');
INSERT INTO `tb_region` VALUES ('511921', '通江县', '511900', '通江', '4', '0827', '636700', '中国,四川省,巴中市,通江县', 'Tongjiang', '107.24398', '31.91294');
INSERT INTO `tb_region` VALUES ('511922', '南江县', '511900', '南江', '4', '0827', '636600', '中国,四川省,巴中市,南江县', 'Nanjiang', '106.84164', '32.35335');
INSERT INTO `tb_region` VALUES ('511923', '平昌县', '511900', '平昌', '4', '0827', '636400', '中国,四川省,巴中市,平昌县', 'Pingchang', '107.10424', '31.5594');
INSERT INTO `tb_region` VALUES ('512000', '资阳市', '510000', '资阳', '3', '028', '641300', '中国,四川省,资阳市', 'Ziyang', '104.641917', '30.122211');
INSERT INTO `tb_region` VALUES ('512002', '雁江区', '512000', '雁江', '4', '028', '641300', '中国,四川省,资阳市,雁江区', 'Yanjiang', '104.65216', '30.11525');
INSERT INTO `tb_region` VALUES ('512021', '安岳县', '512000', '安岳', '4', '028', '642350', '中国,四川省,资阳市,安岳县', 'Anyue', '105.3363', '30.09786');
INSERT INTO `tb_region` VALUES ('512022', '乐至县', '512000', '乐至', '4', '028', '641500', '中国,四川省,资阳市,乐至县', 'Lezhi', '105.03207', '30.27227');
INSERT INTO `tb_region` VALUES ('512081', '简阳市', '512000', '简阳', '4', '028', '641400', '中国,四川省,资阳市,简阳市', 'Jianyang', '104.54864', '30.3904');
INSERT INTO `tb_region` VALUES ('513200', '阿坝藏族羌族自治州', '510000', '阿坝', '3', '0837', '624000', '中国,四川省,阿坝藏族羌族自治州', 'Aba', '102.221374', '31.899792');
INSERT INTO `tb_region` VALUES ('513221', '汶川县', '513200', '汶川', '4', '0837', '623000', '中国,四川省,阿坝藏族羌族自治州,汶川县', 'Wenchuan', '103.59079', '31.47326');
INSERT INTO `tb_region` VALUES ('513222', '理县', '513200', '理县', '4', '0837', '623100', '中国,四川省,阿坝藏族羌族自治州,理县', 'Lixian', '103.17175', '31.43603');
INSERT INTO `tb_region` VALUES ('513223', '茂县', '513200', '茂县', '4', '0837', '623200', '中国,四川省,阿坝藏族羌族自治州,茂县', 'Maoxian', '103.85372', '31.682');
INSERT INTO `tb_region` VALUES ('513224', '松潘县', '513200', '松潘', '4', '0837', '623300', '中国,四川省,阿坝藏族羌族自治州,松潘县', 'Songpan', '103.59924', '32.63871');
INSERT INTO `tb_region` VALUES ('513225', '九寨沟县', '513200', '九寨沟', '4', '0837', '623400', '中国,四川省,阿坝藏族羌族自治州,九寨沟县', 'Jiuzhaigou', '104.23672', '33.26318');
INSERT INTO `tb_region` VALUES ('513226', '金川县', '513200', '金川', '4', '0837', '624100', '中国,四川省,阿坝藏族羌族自治州,金川县', 'Jinchuan', '102.06555', '31.47623');
INSERT INTO `tb_region` VALUES ('513227', '小金县', '513200', '小金', '4', '0837', '624200', '中国,四川省,阿坝藏族羌族自治州,小金县', 'Xiaojin', '102.36499', '30.99934');
INSERT INTO `tb_region` VALUES ('513228', '黑水县', '513200', '黑水', '4', '0837', '623500', '中国,四川省,阿坝藏族羌族自治州,黑水县', 'Heishui', '102.99176', '32.06184');
INSERT INTO `tb_region` VALUES ('513229', '马尔康县', '513200', '马尔康', '4', '0837', '624000', '中国,四川省,阿坝藏族羌族自治州,马尔康县', 'Maerkang', '102.20625', '31.90584');
INSERT INTO `tb_region` VALUES ('513230', '壤塘县', '513200', '壤塘', '4', '0837', '624300', '中国,四川省,阿坝藏族羌族自治州,壤塘县', 'Rangtang', '100.9783', '32.26578');
INSERT INTO `tb_region` VALUES ('513231', '阿坝县', '513200', '阿坝', '4', '0837', '624600', '中国,四川省,阿坝藏族羌族自治州,阿坝县', 'Aba', '101.70632', '32.90301');
INSERT INTO `tb_region` VALUES ('513232', '若尔盖县', '513200', '若尔盖', '4', '0837', '624500', '中国,四川省,阿坝藏族羌族自治州,若尔盖县', 'Ruoergai', '102.9598', '33.57432');
INSERT INTO `tb_region` VALUES ('513233', '红原县', '513200', '红原', '4', '0837', '624400', '中国,四川省,阿坝藏族羌族自治州,红原县', 'Hongyuan', '102.54525', '32.78989');
INSERT INTO `tb_region` VALUES ('513300', '甘孜藏族自治州', '510000', '甘孜', '3', '0836', '626000', '中国,四川省,甘孜藏族自治州', 'Garze', '101.963815', '30.050663');
INSERT INTO `tb_region` VALUES ('513321', '康定县', '513300', '康定', '4', '0836', '626000', '中国,四川省,甘孜藏族自治州,康定县', 'Kangding', '101.96487', '30.05532');
INSERT INTO `tb_region` VALUES ('513322', '泸定县', '513300', '泸定', '4', '0836', '626100', '中国,四川省,甘孜藏族自治州,泸定县', 'Luding', '102.23507', '29.91475');
INSERT INTO `tb_region` VALUES ('513323', '丹巴县', '513300', '丹巴', '4', '0836', '626300', '中国,四川省,甘孜藏族自治州,丹巴县', 'Danba', '101.88424', '30.87656');
INSERT INTO `tb_region` VALUES ('513324', '九龙县', '513300', '九龙', '4', '0836', '626200', '中国,四川省,甘孜藏族自治州,九龙县', 'Jiulong', '101.50848', '29.00091');
INSERT INTO `tb_region` VALUES ('513325', '雅江县', '513300', '雅江', '4', '0836', '627450', '中国,四川省,甘孜藏族自治州,雅江县', 'Yajiang', '101.01492', '30.03281');
INSERT INTO `tb_region` VALUES ('513326', '道孚县', '513300', '道孚', '4', '0836', '626400', '中国,四川省,甘孜藏族自治州,道孚县', 'Daofu', '101.12554', '30.98046');
INSERT INTO `tb_region` VALUES ('513327', '炉霍县', '513300', '炉霍', '4', '0836', '626500', '中国,四川省,甘孜藏族自治州,炉霍县', 'Luhuo', '100.67681', '31.3917');
INSERT INTO `tb_region` VALUES ('513328', '甘孜县', '513300', '甘孜', '4', '0836', '626700', '中国,四川省,甘孜藏族自治州,甘孜县', 'Ganzi', '99.99307', '31.62672');
INSERT INTO `tb_region` VALUES ('513329', '新龙县', '513300', '新龙', '4', '0836', '626800', '中国,四川省,甘孜藏族自治州,新龙县', 'Xinlong', '100.3125', '30.94067');
INSERT INTO `tb_region` VALUES ('513330', '德格县', '513300', '德格', '4', '0836', '627250', '中国,四川省,甘孜藏族自治州,德格县', 'Dege', '98.58078', '31.80615');
INSERT INTO `tb_region` VALUES ('513331', '白玉县', '513300', '白玉', '4', '0836', '627150', '中国,四川省,甘孜藏族自治州,白玉县', 'Baiyu', '98.82568', '31.20902');
INSERT INTO `tb_region` VALUES ('513332', '石渠县', '513300', '石渠', '4', '0836', '627350', '中国,四川省,甘孜藏族自治州,石渠县', 'Shiqu', '98.10156', '32.97884');
INSERT INTO `tb_region` VALUES ('513333', '色达县', '513300', '色达', '4', '0836', '626600', '中国,四川省,甘孜藏族自治州,色达县', 'Seda', '100.33224', '32.26839');
INSERT INTO `tb_region` VALUES ('513334', '理塘县', '513300', '理塘', '4', '0836', '627550', '中国,四川省,甘孜藏族自治州,理塘县', 'Litang', '100.27005', '29.99674');
INSERT INTO `tb_region` VALUES ('513335', '巴塘县', '513300', '巴塘', '4', '0836', '627650', '中国,四川省,甘孜藏族自治州,巴塘县', 'Batang', '99.10409', '30.00423');
INSERT INTO `tb_region` VALUES ('513336', '乡城县', '513300', '乡城', '4', '0836', '627850', '中国,四川省,甘孜藏族自治州,乡城县', 'Xiangcheng', '99.79943', '28.93554');
INSERT INTO `tb_region` VALUES ('513337', '稻城县', '513300', '稻城', '4', '0836', '627750', '中国,四川省,甘孜藏族自治州,稻城县', 'Daocheng', '100.29809', '29.0379');
INSERT INTO `tb_region` VALUES ('513338', '得荣县', '513300', '得荣', '4', '0836', '627950', '中国,四川省,甘孜藏族自治州,得荣县', 'Derong', '99.28628', '28.71297');
INSERT INTO `tb_region` VALUES ('513400', '凉山彝族自治州', '510000', '凉山', '3', '0834', '615000', '中国,四川省,凉山彝族自治州', 'Liangshan', '102.258746', '27.886762');
INSERT INTO `tb_region` VALUES ('513401', '西昌市', '513400', '西昌', '4', '0835', '615000', '中国,四川省,凉山彝族自治州,西昌市', 'Xichang', '102.26413', '27.89524');
INSERT INTO `tb_region` VALUES ('513422', '木里藏族自治县', '513400', '木里', '4', '0851', '615800', '中国,四川省,凉山彝族自治州,木里藏族自治县', 'Muli', '101.2796', '27.92875');
INSERT INTO `tb_region` VALUES ('513423', '盐源县', '513400', '盐源', '4', '0836', '615700', '中国,四川省,凉山彝族自治州,盐源县', 'Yanyuan', '101.5097', '27.42177');
INSERT INTO `tb_region` VALUES ('513424', '德昌县', '513400', '德昌', '4', '0837', '615500', '中国,四川省,凉山彝族自治州,德昌县', 'Dechang', '102.18017', '27.40482');
INSERT INTO `tb_region` VALUES ('513425', '会理县', '513400', '会理', '4', '0838', '615100', '中国,四川省,凉山彝族自治州,会理县', 'Huili', '102.24539', '26.65627');
INSERT INTO `tb_region` VALUES ('513426', '会东县', '513400', '会东', '4', '0839', '615200', '中国,四川省,凉山彝族自治州,会东县', 'Huidong', '102.57815', '26.63429');
INSERT INTO `tb_region` VALUES ('513427', '宁南县', '513400', '宁南', '4', '0840', '615400', '中国,四川省,凉山彝族自治州,宁南县', 'Ningnan', '102.76116', '27.06567');
INSERT INTO `tb_region` VALUES ('513428', '普格县', '513400', '普格', '4', '0841', '615300', '中国,四川省,凉山彝族自治州,普格县', 'Puge', '102.54055', '27.37485');
INSERT INTO `tb_region` VALUES ('513429', '布拖县', '513400', '布拖', '4', '0842', '616350', '中国,四川省,凉山彝族自治州,布拖县', 'Butuo', '102.81234', '27.7079');
INSERT INTO `tb_region` VALUES ('513430', '金阳县', '513400', '金阳', '4', '0843', '616250', '中国,四川省,凉山彝族自治州,金阳县', 'Jinyang', '103.24774', '27.69698');
INSERT INTO `tb_region` VALUES ('513431', '昭觉县', '513400', '昭觉', '4', '0844', '616150', '中国,四川省,凉山彝族自治州,昭觉县', 'Zhaojue', '102.84661', '28.01155');
INSERT INTO `tb_region` VALUES ('513432', '喜德县', '513400', '喜德', '4', '0845', '616750', '中国,四川省,凉山彝族自治州,喜德县', 'Xide', '102.41336', '28.30739');
INSERT INTO `tb_region` VALUES ('513433', '冕宁县', '513400', '冕宁', '4', '0846', '615600', '中国,四川省,凉山彝族自治州,冕宁县', 'Mianning', '102.17108', '28.55161');
INSERT INTO `tb_region` VALUES ('513434', '越西县', '513400', '越西', '4', '0847', '616650', '中国,四川省,凉山彝族自治州,越西县', 'Yuexi', '102.5079', '28.64133');
INSERT INTO `tb_region` VALUES ('513435', '甘洛县', '513400', '甘洛', '4', '0848', '616850', '中国,四川省,凉山彝族自治州,甘洛县', 'Ganluo', '102.77154', '28.96624');
INSERT INTO `tb_region` VALUES ('513436', '美姑县', '513400', '美姑', '4', '0849', '616450', '中国,四川省,凉山彝族自治州,美姑县', 'Meigu', '103.13116', '28.32596');
INSERT INTO `tb_region` VALUES ('513437', '雷波县', '513400', '雷波', '4', '0850', '616550', '中国,四川省,凉山彝族自治州,雷波县', 'Leibo', '103.57287', '28.26407');
INSERT INTO `tb_region` VALUES ('520000', '贵州省', '100006', '贵州', '2', '', '', '中国,贵州省', 'Guizhou', '106.713478', '26.578343');
INSERT INTO `tb_region` VALUES ('520100', '贵阳市', '520000', '贵阳', '3', '0851', '550001', '中国,贵州省,贵阳市', 'Guiyang', '106.713478', '26.578343');
INSERT INTO `tb_region` VALUES ('520102', '南明区', '520100', '南明', '4', '0851', '550001', '中国,贵州省,贵阳市,南明区', 'Nanming', '106.7145', '26.56819');
INSERT INTO `tb_region` VALUES ('520103', '云岩区', '520100', '云岩', '4', '0851', '550001', '中国,贵州省,贵阳市,云岩区', 'Yunyan', '106.72485', '26.60484');
INSERT INTO `tb_region` VALUES ('520111', '花溪区', '520100', '花溪', '4', '0851', '550025', '中国,贵州省,贵阳市,花溪区', 'Huaxi', '106.67688', '26.43343');
INSERT INTO `tb_region` VALUES ('520112', '乌当区', '520100', '乌当', '4', '0851', '550018', '中国,贵州省,贵阳市,乌当区', 'Wudang', '106.7521', '26.6302');
INSERT INTO `tb_region` VALUES ('520113', '白云区', '520100', '白云', '4', '0851', '550014', '中国,贵州省,贵阳市,白云区', 'Baiyun', '106.63088', '26.68284');
INSERT INTO `tb_region` VALUES ('520115', '观山湖区', '520100', '观山湖', '4', '0851', '550009', '中国,贵州省,贵阳市,观山湖区', 'Guanshanhu', '106.625442', '26.618209');
INSERT INTO `tb_region` VALUES ('520121', '开阳县', '520100', '开阳', '4', '0851', '550300', '中国,贵州省,贵阳市,开阳县', 'Kaiyang', '106.9692', '27.05533');
INSERT INTO `tb_region` VALUES ('520122', '息烽县', '520100', '息烽', '4', '0851', '551100', '中国,贵州省,贵阳市,息烽县', 'Xifeng', '106.738', '27.09346');
INSERT INTO `tb_region` VALUES ('520123', '修文县', '520100', '修文', '4', '0851', '550200', '中国,贵州省,贵阳市,修文县', 'Xiuwen', '106.59487', '26.83783');
INSERT INTO `tb_region` VALUES ('520181', '清镇市', '520100', '清镇', '4', '0851', '551400', '中国,贵州省,贵阳市,清镇市', 'Qingzhen', '106.46862', '26.55261');
INSERT INTO `tb_region` VALUES ('520200', '六盘水市', '520000', '六盘水', '3', '0858', '553400', '中国,贵州省,六盘水市', 'Liupanshui', '104.846743', '26.584643');
INSERT INTO `tb_region` VALUES ('520201', '钟山区', '520200', '钟山', '4', '0858', '553000', '中国,贵州省,六盘水市,钟山区', 'Zhongshan', '104.87848', '26.57699');
INSERT INTO `tb_region` VALUES ('520203', '六枝特区', '520200', '六枝', '4', '0858', '553400', '中国,贵州省,六盘水市,六枝特区', 'Liuzhi', '105.48062', '26.20117');
INSERT INTO `tb_region` VALUES ('520221', '水城县', '520200', '水城', '4', '0858', '553000', '中国,贵州省,六盘水市,水城县', 'Shuicheng', '104.95764', '26.54785');
INSERT INTO `tb_region` VALUES ('520222', '盘县', '520200', '盘县', '4', '0858', '561601', '中国,贵州省,六盘水市,盘县', 'Panxian', '104.47061', '25.7136');
INSERT INTO `tb_region` VALUES ('520300', '遵义市', '520000', '遵义', '3', '0852', '563000', '中国,贵州省,遵义市', 'Zunyi', '106.937265', '27.706626');
INSERT INTO `tb_region` VALUES ('520302', '红花岗区', '520300', '红花岗', '4', '0852', '563000', '中国,贵州省,遵义市,红花岗区', 'Honghuagang', '106.89404', '27.64471');
INSERT INTO `tb_region` VALUES ('520303', '汇川区', '520300', '汇川', '4', '0852', '563000', '中国,贵州省,遵义市,汇川区', 'Huichuan', '106.9393', '27.70625');
INSERT INTO `tb_region` VALUES ('520321', '遵义县', '520300', '遵义', '4', '0852', '563100', '中国,贵州省,遵义市,遵义县', 'Zunyi', '106.83331', '27.53772');
INSERT INTO `tb_region` VALUES ('520322', '桐梓县', '520300', '桐梓', '4', '0852', '563200', '中国,贵州省,遵义市,桐梓县', 'Tongzi', '106.82568', '28.13806');
INSERT INTO `tb_region` VALUES ('520323', '绥阳县', '520300', '绥阳', '4', '0852', '563300', '中国,贵州省,遵义市,绥阳县', 'Suiyang', '107.19064', '27.94702');
INSERT INTO `tb_region` VALUES ('520324', '正安县', '520300', '正安', '4', '0852', '563400', '中国,贵州省,遵义市,正安县', 'Zheng\'an', '107.44357', '28.5512');
INSERT INTO `tb_region` VALUES ('520325', '道真仡佬族苗族自治县', '520300', '道真', '4', '0852', '563500', '中国,贵州省,遵义市,道真仡佬族苗族自治县', 'Daozhen', '107.61152', '28.864');
INSERT INTO `tb_region` VALUES ('520326', '务川仡佬族苗族自治县', '520300', '务川', '4', '0852', '564300', '中国,贵州省,遵义市,务川仡佬族苗族自治县', 'Wuchuan', '107.88935', '28.52227');
INSERT INTO `tb_region` VALUES ('520327', '凤冈县', '520300', '凤冈', '4', '0852', '564200', '中国,贵州省,遵义市,凤冈县', 'Fenggang', '107.71682', '27.95461');
INSERT INTO `tb_region` VALUES ('520328', '湄潭县', '520300', '湄潭', '4', '0852', '564100', '中国,贵州省,遵义市,湄潭县', 'Meitan', '107.48779', '27.76676');
INSERT INTO `tb_region` VALUES ('520329', '余庆县', '520300', '余庆', '4', '0852', '564400', '中国,贵州省,遵义市,余庆县', 'Yuqing', '107.88821', '27.22532');
INSERT INTO `tb_region` VALUES ('520330', '习水县', '520300', '习水', '4', '0852', '564600', '中国,贵州省,遵义市,习水县', 'Xishui', '106.21267', '28.31976');
INSERT INTO `tb_region` VALUES ('520381', '赤水市', '520300', '赤水', '4', '0852', '564700', '中国,贵州省,遵义市,赤水市', 'Chishui', '105.69845', '28.58921');
INSERT INTO `tb_region` VALUES ('520382', '仁怀市', '520300', '仁怀', '4', '0852', '564500', '中国,贵州省,遵义市,仁怀市', 'Renhuai', '106.40152', '27.79231');
INSERT INTO `tb_region` VALUES ('520400', '安顺市', '520000', '安顺', '3', '0853', '561000', '中国,贵州省,安顺市', 'Anshun', '105.932188', '26.245544');
INSERT INTO `tb_region` VALUES ('520402', '西秀区', '520400', '西秀', '4', '0853', '561000', '中国,贵州省,安顺市,西秀区', 'Xixiu', '105.96585', '26.24491');
INSERT INTO `tb_region` VALUES ('520421', '平坝区', '520400', '平坝', '4', '0853', '561100', '中国,贵州省,安顺市,平坝区', 'Pingba', '106.25683', '26.40543');
INSERT INTO `tb_region` VALUES ('520422', '普定县', '520400', '普定', '4', '0853', '562100', '中国,贵州省,安顺市,普定县', 'Puding', '105.74285', '26.30141');
INSERT INTO `tb_region` VALUES ('520423', '镇宁布依族苗族自治县', '520400', '镇宁', '4', '0853', '561200', '中国,贵州省,安顺市,镇宁布依族苗族自治县', 'Zhenning', '105.76513', '26.05533');
INSERT INTO `tb_region` VALUES ('520424', '关岭布依族苗族自治县', '520400', '关岭', '4', '0853', '561300', '中国,贵州省,安顺市,关岭布依族苗族自治县', 'Guanling', '105.61883', '25.94248');
INSERT INTO `tb_region` VALUES ('520425', '紫云苗族布依族自治县', '520400', '紫云', '4', '0853', '550800', '中国,贵州省,安顺市,紫云苗族布依族自治县', 'Ziyun', '106.08364', '25.75258');
INSERT INTO `tb_region` VALUES ('520500', '毕节市', '520000', '毕节', '3', '0857', '551700', '中国,贵州省,毕节市', 'Bijie', '105.28501', '27.301693');
INSERT INTO `tb_region` VALUES ('520502', '七星关区', '520500', '七星关', '4', '0857', '551700', '中国,贵州省,毕节市,七星关区', 'Qixingguan', '104.9497', '27.153556');
INSERT INTO `tb_region` VALUES ('520521', '大方县', '520500', '大方', '4', '0857', '551600', '中国,贵州省,毕节市,大方县', 'Dafang', '105.609254', '27.143521');
INSERT INTO `tb_region` VALUES ('520522', '黔西县', '520500', '黔西', '4', '0857', '551500', '中国,贵州省,毕节市,黔西县', 'Qianxi', '106.038299', '27.024923');
INSERT INTO `tb_region` VALUES ('520523', '金沙县', '520500', '金沙', '4', '0857', '551800', '中国,贵州省,毕节市,金沙县', 'Jinsha', '106.222103', '27.459693');
INSERT INTO `tb_region` VALUES ('520524', '织金县', '520500', '织金', '4', '0857', '552100', '中国,贵州省,毕节市,织金县', 'Zhijin', '105.768997', '26.668497');
INSERT INTO `tb_region` VALUES ('520525', '纳雍县', '520500', '纳雍', '4', '0857', '553300', '中国,贵州省,毕节市,纳雍县', 'Nayong', '105.375322', '26.769875');
INSERT INTO `tb_region` VALUES ('520526', '威宁彝族回族苗族自治县', '520500', '威宁', '4', '0857', '553100', '中国,贵州省,毕节市,威宁彝族回族苗族自治县', 'Weining', '104.286523', '26.859099');
INSERT INTO `tb_region` VALUES ('520527', '赫章县', '520500', '赫章', '4', '0857', '553200', '中国,贵州省,毕节市,赫章县', 'Hezhang', '104.726438', '27.119243');
INSERT INTO `tb_region` VALUES ('520600', '铜仁市', '520000', '铜仁', '3', '0856', '554300', '中国,贵州省,铜仁市', 'Tongren', '109.191555', '27.718346');
INSERT INTO `tb_region` VALUES ('520602', '碧江区', '520600', '碧江', '4', '0856', '554300', '中国,贵州省,铜仁市,碧江区', 'Bijiang', '109.191555', '27.718346');
INSERT INTO `tb_region` VALUES ('520603', '万山区', '520600', '万山', '4', '0856', '554200', '中国,贵州省,铜仁市,万山区', 'Wanshan', '109.21199', '27.51903');
INSERT INTO `tb_region` VALUES ('520621', '江口县', '520600', '江口', '4', '0856', '554400', '中国,贵州省,铜仁市,江口县', 'Jiangkou', '108.848427', '27.691904');
INSERT INTO `tb_region` VALUES ('520622', '玉屏侗族自治县', '520600', '玉屏', '4', '0856', '554004', '中国,贵州省,铜仁市,玉屏侗族自治县', 'Yuping', '108.917882', '27.238024');
INSERT INTO `tb_region` VALUES ('520623', '石阡县', '520600', '石阡', '4', '0856', '555100', '中国,贵州省,铜仁市,石阡县', 'Shiqian', '108.229854', '27.519386');
INSERT INTO `tb_region` VALUES ('520624', '思南县', '520600', '思南', '4', '0856', '565100', '中国,贵州省,铜仁市,思南县', 'Sinan', '108.255827', '27.941331');
INSERT INTO `tb_region` VALUES ('520625', '印江土家族苗族自治县', '520600', '印江', '4', '0856', '555200', '中国,贵州省,铜仁市,印江土家族苗族自治县', 'Yinjiang', '108.405517', '27.997976');
INSERT INTO `tb_region` VALUES ('520626', '德江县', '520600', '德江', '4', '0856', '565200', '中国,贵州省,铜仁市,德江县', 'Dejiang', '108.117317', '28.26094');
INSERT INTO `tb_region` VALUES ('520627', '沿河土家族自治县', '520600', '沿河', '4', '0856', '565300', '中国,贵州省,铜仁市,沿河土家族自治县', 'Yuanhe', '108.495746', '28.560487');
INSERT INTO `tb_region` VALUES ('520628', '松桃苗族自治县', '520600', '松桃', '4', '0856', '554100', '中国,贵州省,铜仁市,松桃苗族自治县', 'Songtao', '109.202627', '28.165419');
INSERT INTO `tb_region` VALUES ('522300', '黔西南布依族苗族自治州', '520000', '黔西南', '3', '0859', '562400', '中国,贵州省,黔西南布依族苗族自治州', 'Qianxinan', '104.897971', '25.08812');
INSERT INTO `tb_region` VALUES ('522301', '兴义市 ', '522300', '兴义', '4', '0859', '562400', '中国,贵州省,黔西南布依族苗族自治州,兴义市 ', 'Xingyi', '104.89548', '25.09205');
INSERT INTO `tb_region` VALUES ('522322', '兴仁县', '522300', '兴仁', '4', '0859', '562300', '中国,贵州省,黔西南布依族苗族自治州,兴仁县', 'Xingren', '105.18652', '25.43282');
INSERT INTO `tb_region` VALUES ('522323', '普安县', '522300', '普安', '4', '0859', '561500', '中国,贵州省,黔西南布依族苗族自治州,普安县', 'Pu\'an', '104.95529', '25.78603');
INSERT INTO `tb_region` VALUES ('522324', '晴隆县', '522300', '晴隆', '4', '0859', '561400', '中国,贵州省,黔西南布依族苗族自治州,晴隆县', 'Qinglong', '105.2192', '25.83522');
INSERT INTO `tb_region` VALUES ('522325', '贞丰县', '522300', '贞丰', '4', '0859', '562200', '中国,贵州省,黔西南布依族苗族自治州,贞丰县', 'Zhenfeng', '105.65454', '25.38464');
INSERT INTO `tb_region` VALUES ('522326', '望谟县', '522300', '望谟', '4', '0859', '552300', '中国,贵州省,黔西南布依族苗族自治州,望谟县', 'Wangmo', '106.09957', '25.17822');
INSERT INTO `tb_region` VALUES ('522327', '册亨县', '522300', '册亨', '4', '0859', '552200', '中国,贵州省,黔西南布依族苗族自治州,册亨县', 'Ceheng', '105.8124', '24.98376');
INSERT INTO `tb_region` VALUES ('522328', '安龙县', '522300', '安龙', '4', '0859', '552400', '中国,贵州省,黔西南布依族苗族自治州,安龙县', 'Anlong', '105.44268', '25.09818');
INSERT INTO `tb_region` VALUES ('522600', '黔东南苗族侗族自治州', '520000', '黔东南', '3', '0855', '556000', '中国,贵州省,黔东南苗族侗族自治州', 'Qiandongnan', '107.977488', '26.583352');
INSERT INTO `tb_region` VALUES ('522601', '凯里市', '522600', '凯里', '4', '0855', '556000', '中国,贵州省,黔东南苗族侗族自治州,凯里市', 'Kaili', '107.98132', '26.56689');
INSERT INTO `tb_region` VALUES ('522622', '黄平县', '522600', '黄平', '4', '0855', '556100', '中国,贵州省,黔东南苗族侗族自治州,黄平县', 'Huangping', '107.90179', '26.89573');
INSERT INTO `tb_region` VALUES ('522623', '施秉县', '522600', '施秉', '4', '0855', '556200', '中国,贵州省,黔东南苗族侗族自治州,施秉县', 'Shibing', '108.12597', '27.03495');
INSERT INTO `tb_region` VALUES ('522624', '三穗县', '522600', '三穗', '4', '0855', '556500', '中国,贵州省,黔东南苗族侗族自治州,三穗县', 'Sansui', '108.67132', '26.94765');
INSERT INTO `tb_region` VALUES ('522625', '镇远县', '522600', '镇远', '4', '0855', '557700', '中国,贵州省,黔东南苗族侗族自治州,镇远县', 'Zhenyuan', '108.42721', '27.04933');
INSERT INTO `tb_region` VALUES ('522626', '岑巩县', '522600', '岑巩', '4', '0855', '557800', '中国,贵州省,黔东南苗族侗族自治州,岑巩县', 'Cengong', '108.81884', '27.17539');
INSERT INTO `tb_region` VALUES ('522627', '天柱县', '522600', '天柱', '4', '0855', '556600', '中国,贵州省,黔东南苗族侗族自治州,天柱县', 'Tianzhu', '109.20718', '26.90781');
INSERT INTO `tb_region` VALUES ('522628', '锦屏县', '522600', '锦屏', '4', '0855', '556700', '中国,贵州省,黔东南苗族侗族自治州,锦屏县', 'Jinping', '109.19982', '26.67635');
INSERT INTO `tb_region` VALUES ('522629', '剑河县', '522600', '剑河', '4', '0855', '556400', '中国,贵州省,黔东南苗族侗族自治州,剑河县', 'Jianhe', '108.5913', '26.6525');
INSERT INTO `tb_region` VALUES ('522630', '台江县', '522600', '台江', '4', '0855', '556300', '中国,贵州省,黔东南苗族侗族自治州,台江县', 'Taijiang', '108.31814', '26.66916');
INSERT INTO `tb_region` VALUES ('522631', '黎平县', '522600', '黎平', '4', '0855', '557300', '中国,贵州省,黔东南苗族侗族自治州,黎平县', 'Liping', '109.13607', '26.23114');
INSERT INTO `tb_region` VALUES ('522632', '榕江县', '522600', '榕江', '4', '0855', '557200', '中国,贵州省,黔东南苗族侗族自治州,榕江县', 'Rongjiang', '108.52072', '25.92421');
INSERT INTO `tb_region` VALUES ('522633', '从江县', '522600', '从江', '4', '0855', '557400', '中国,贵州省,黔东南苗族侗族自治州,从江县', 'Congjiang', '108.90527', '25.75415');
INSERT INTO `tb_region` VALUES ('522634', '雷山县', '522600', '雷山', '4', '0855', '557100', '中国,贵州省,黔东南苗族侗族自治州,雷山县', 'Leishan', '108.07745', '26.38385');
INSERT INTO `tb_region` VALUES ('522635', '麻江县', '522600', '麻江', '4', '0855', '557600', '中国,贵州省,黔东南苗族侗族自治州,麻江县', 'Majiang', '107.59155', '26.49235');
INSERT INTO `tb_region` VALUES ('522636', '丹寨县', '522600', '丹寨', '4', '0855', '557500', '中国,贵州省,黔东南苗族侗族自治州,丹寨县', 'Danzhai', '107.79718', '26.19816');
INSERT INTO `tb_region` VALUES ('522700', '黔南布依族苗族自治州', '520000', '黔南', '3', '0854', '558000', '中国,贵州省,黔南布依族苗族自治州', 'Qiannan', '107.517156', '26.258219');
INSERT INTO `tb_region` VALUES ('522701', '都匀市', '522700', '都匀', '4', '0854', '558000', '中国,贵州省,黔南布依族苗族自治州,都匀市', 'Duyun', '107.51872', '26.2594');
INSERT INTO `tb_region` VALUES ('522702', '福泉市', '522700', '福泉', '4', '0854', '550500', '中国,贵州省,黔南布依族苗族自治州,福泉市', 'Fuquan', '107.51715', '26.67989');
INSERT INTO `tb_region` VALUES ('522722', '荔波县', '522700', '荔波', '4', '0854', '558400', '中国,贵州省,黔南布依族苗族自治州,荔波县', 'Libo', '107.88592', '25.4139');
INSERT INTO `tb_region` VALUES ('522723', '贵定县', '522700', '贵定', '4', '0854', '551300', '中国,贵州省,黔南布依族苗族自治州,贵定县', 'Guiding', '107.23654', '26.57812');
INSERT INTO `tb_region` VALUES ('522725', '瓮安县', '522700', '瓮安', '4', '0854', '550400', '中国,贵州省,黔南布依族苗族自治州,瓮安县', 'Weng\'an', '107.4757', '27.06813');
INSERT INTO `tb_region` VALUES ('522726', '独山县', '522700', '独山', '4', '0854', '558200', '中国,贵州省,黔南布依族苗族自治州,独山县', 'Dushan', '107.54101', '25.8245');
INSERT INTO `tb_region` VALUES ('522727', '平塘县', '522700', '平塘', '4', '0854', '558300', '中国,贵州省,黔南布依族苗族自治州,平塘县', 'Pingtang', '107.32428', '25.83294');
INSERT INTO `tb_region` VALUES ('522728', '罗甸县', '522700', '罗甸', '4', '0854', '550100', '中国,贵州省,黔南布依族苗族自治州,罗甸县', 'Luodian', '106.75186', '25.42586');
INSERT INTO `tb_region` VALUES ('522729', '长顺县', '522700', '长顺', '4', '0854', '550700', '中国,贵州省,黔南布依族苗族自治州,长顺县', 'Changshun', '106.45217', '26.02299');
INSERT INTO `tb_region` VALUES ('522730', '龙里县', '522700', '龙里', '4', '0854', '551200', '中国,贵州省,黔南布依族苗族自治州,龙里县', 'Longli', '106.97662', '26.45076');
INSERT INTO `tb_region` VALUES ('522731', '惠水县', '522700', '惠水', '4', '0854', '550600', '中国,贵州省,黔南布依族苗族自治州,惠水县', 'Huishui', '106.65911', '26.13389');
INSERT INTO `tb_region` VALUES ('522732', '三都水族自治县', '522700', '三都', '4', '0854', '558100', '中国,贵州省,黔南布依族苗族自治州,三都水族自治县', 'Sandu', '107.87464', '25.98562');
INSERT INTO `tb_region` VALUES ('530000', '云南省', '100006', '云南', '2', '', '', '中国,云南省', 'Yunnan', '102.712251', '25.040609');
INSERT INTO `tb_region` VALUES ('530100', '昆明市', '530000', '昆明', '3', '0871', '650500', '中国,云南省,昆明市', 'Kunming', '102.712251', '25.040609');
INSERT INTO `tb_region` VALUES ('530102', '五华区', '530100', '五华', '4', '0871', '650021', '中国,云南省,昆明市,五华区', 'Wuhua', '102.70786', '25.03521');
INSERT INTO `tb_region` VALUES ('530103', '盘龙区', '530100', '盘龙', '4', '0871', '650051', '中国,云南省,昆明市,盘龙区', 'Panlong', '102.71994', '25.04053');
INSERT INTO `tb_region` VALUES ('530111', '官渡区', '530100', '官渡', '4', '0871', '650200', '中国,云南省,昆明市,官渡区', 'Guandu', '102.74362', '25.01497');
INSERT INTO `tb_region` VALUES ('530112', '西山区', '530100', '西山', '4', '0871', '650118', '中国,云南省,昆明市,西山区', 'Xishan', '102.66464', '25.03796');
INSERT INTO `tb_region` VALUES ('530113', '东川区', '530100', '东川', '4', '0871', '654100', '中国,云南省,昆明市,东川区', 'Dongchuan', '103.18832', '26.083');
INSERT INTO `tb_region` VALUES ('530114', '呈贡区', '530100', '呈贡', '4', '0871', '650500', '中国,云南省,昆明市,呈贡区', 'Chenggong', '102.801382', '24.889275');
INSERT INTO `tb_region` VALUES ('530122', '晋宁县', '530100', '晋宁', '4', '0871', '650600', '中国,云南省,昆明市,晋宁县', 'Jinning', '102.59393', '24.6665');
INSERT INTO `tb_region` VALUES ('530124', '富民县', '530100', '富民', '4', '0871', '650400', '中国,云南省,昆明市,富民县', 'Fumin', '102.4985', '25.22119');
INSERT INTO `tb_region` VALUES ('530125', '宜良县', '530100', '宜良', '4', '0871', '652100', '中国,云南省,昆明市,宜良县', 'Yiliang', '103.14117', '24.91705');
INSERT INTO `tb_region` VALUES ('530126', '石林彝族自治县', '530100', '石林', '4', '0871', '652200', '中国,云南省,昆明市,石林彝族自治县', 'Shilin', '103.27148', '24.75897');
INSERT INTO `tb_region` VALUES ('530127', '嵩明县', '530100', '嵩明', '4', '0871', '651700', '中国,云南省,昆明市,嵩明县', 'Songming', '103.03729', '25.33986');
INSERT INTO `tb_region` VALUES ('530128', '禄劝彝族苗族自治县', '530100', '禄劝', '4', '0871', '651500', '中国,云南省,昆明市,禄劝彝族苗族自治县', 'Luquan', '102.4671', '25.55387');
INSERT INTO `tb_region` VALUES ('530129', '寻甸回族彝族自治县 ', '530100', '寻甸', '4', '0871', '655200', '中国,云南省,昆明市,寻甸回族彝族自治县 ', 'Xundian', '103.2557', '25.55961');
INSERT INTO `tb_region` VALUES ('530181', '安宁市', '530100', '安宁', '4', '0871', '650300', '中国,云南省,昆明市,安宁市', 'Anning', '102.46972', '24.91652');
INSERT INTO `tb_region` VALUES ('530300', '曲靖市', '530000', '曲靖', '3', '0874', '655000', '中国,云南省,曲靖市', 'Qujing', '103.797851', '25.501557');
INSERT INTO `tb_region` VALUES ('530302', '麒麟区', '530300', '麒麟', '4', '0874', '655000', '中国,云南省,曲靖市,麒麟区', 'Qilin', '103.80504', '25.49515');
INSERT INTO `tb_region` VALUES ('530321', '马龙县', '530300', '马龙', '4', '0874', '655100', '中国,云南省,曲靖市,马龙县', 'Malong', '103.57873', '25.42521');
INSERT INTO `tb_region` VALUES ('530322', '陆良县', '530300', '陆良', '4', '0874', '655600', '中国,云南省,曲靖市,陆良县', 'Luliang', '103.6665', '25.02335');
INSERT INTO `tb_region` VALUES ('530323', '师宗县', '530300', '师宗', '4', '0874', '655700', '中国,云南省,曲靖市,师宗县', 'Shizong', '103.99084', '24.82822');
INSERT INTO `tb_region` VALUES ('530324', '罗平县', '530300', '罗平', '4', '0874', '655800', '中国,云南省,曲靖市,罗平县', 'Luoping', '104.30859', '24.88444');
INSERT INTO `tb_region` VALUES ('530325', '富源县', '530300', '富源', '4', '0874', '655500', '中国,云南省,曲靖市,富源县', 'Fuyuan', '104.25387', '25.66587');
INSERT INTO `tb_region` VALUES ('530326', '会泽县', '530300', '会泽', '4', '0874', '654200', '中国,云南省,曲靖市,会泽县', 'Huize', '103.30017', '26.41076');
INSERT INTO `tb_region` VALUES ('530328', '沾益县', '530300', '沾益', '4', '0874', '655331', '中国,云南省,曲靖市,沾益县', 'Zhanyi', '103.82135', '25.60715');
INSERT INTO `tb_region` VALUES ('530381', '宣威市', '530300', '宣威', '4', '0874', '655400', '中国,云南省,曲靖市,宣威市', 'Xuanwei', '104.10409', '26.2173');
INSERT INTO `tb_region` VALUES ('530400', '玉溪市', '530000', '玉溪', '3', '0877', '653100', '中国,云南省,玉溪市', 'Yuxi', '102.543907', '24.350461');
INSERT INTO `tb_region` VALUES ('530402', '红塔区', '530400', '红塔', '4', '0877', '653100', '中国,云南省,玉溪市,红塔区', 'Hongta', '102.5449', '24.35411');
INSERT INTO `tb_region` VALUES ('530421', '江川县', '530400', '江川', '4', '0877', '652600', '中国,云南省,玉溪市,江川县', 'Jiangchuan', '102.75412', '24.28863');
INSERT INTO `tb_region` VALUES ('530422', '澄江县', '530400', '澄江', '4', '0877', '652500', '中国,云南省,玉溪市,澄江县', 'Chengjiang', '102.90817', '24.67376');
INSERT INTO `tb_region` VALUES ('530423', '通海县', '530400', '通海', '4', '0877', '652700', '中国,云南省,玉溪市,通海县', 'Tonghai', '102.76641', '24.11362');
INSERT INTO `tb_region` VALUES ('530424', '华宁县', '530400', '华宁', '4', '0877', '652800', '中国,云南省,玉溪市,华宁县', 'Huaning', '102.92831', '24.1926');
INSERT INTO `tb_region` VALUES ('530425', '易门县', '530400', '易门', '4', '0877', '651100', '中国,云南省,玉溪市,易门县', 'Yimen', '102.16354', '24.67122');
INSERT INTO `tb_region` VALUES ('530426', '峨山彝族自治县', '530400', '峨山', '4', '0877', '653200', '中国,云南省,玉溪市,峨山彝族自治县', 'Eshan', '102.40576', '24.16904');
INSERT INTO `tb_region` VALUES ('530427', '新平彝族傣族自治县', '530400', '新平', '4', '0877', '653400', '中国,云南省,玉溪市,新平彝族傣族自治县', 'Xinping', '101.98895', '24.06886');
INSERT INTO `tb_region` VALUES ('530428', '元江哈尼族彝族傣族自治县', '530400', '元江', '4', '0877', '653300', '中国,云南省,玉溪市,元江哈尼族彝族傣族自治县', 'Yuanjiang', '101.99812', '23.59655');
INSERT INTO `tb_region` VALUES ('530500', '保山市', '530000', '保山', '3', '0875', '678000', '中国,云南省,保山市', 'Baoshan', '99.167133', '25.111802');
INSERT INTO `tb_region` VALUES ('530502', '隆阳区', '530500', '隆阳', '4', '0875', '678000', '中国,云南省,保山市,隆阳区', 'Longyang', '99.16334', '25.11163');
INSERT INTO `tb_region` VALUES ('530521', '施甸县', '530500', '施甸', '4', '0875', '678200', '中国,云南省,保山市,施甸县', 'Shidian', '99.18768', '24.72418');
INSERT INTO `tb_region` VALUES ('530522', '腾冲县', '530500', '腾冲', '4', '0875', '679100', '中国,云南省,保山市,腾冲县', 'Tengchong', '98.49414', '25.02539');
INSERT INTO `tb_region` VALUES ('530523', '龙陵县', '530500', '龙陵', '4', '0875', '678300', '中国,云南省,保山市,龙陵县', 'Longling', '98.69024', '24.58746');
INSERT INTO `tb_region` VALUES ('530524', '昌宁县', '530500', '昌宁', '4', '0875', '678100', '中国,云南省,保山市,昌宁县', 'Changning', '99.6036', '24.82763');
INSERT INTO `tb_region` VALUES ('530600', '昭通市', '530000', '昭通', '3', '0870', '657000', '中国,云南省,昭通市', 'Zhaotong', '103.717216', '27.336999');
INSERT INTO `tb_region` VALUES ('530602', '昭阳区', '530600', '昭阳', '4', '0870', '657000', '中国,云南省,昭通市,昭阳区', 'Zhaoyang', '103.70654', '27.31998');
INSERT INTO `tb_region` VALUES ('530621', '鲁甸县', '530600', '鲁甸', '4', '0870', '657100', '中国,云南省,昭通市,鲁甸县', 'Ludian', '103.54721', '27.19238');
INSERT INTO `tb_region` VALUES ('530622', '巧家县', '530600', '巧家', '4', '0870', '654600', '中国,云南省,昭通市,巧家县', 'Qiaojia', '102.92416', '26.91237');
INSERT INTO `tb_region` VALUES ('530623', '盐津县', '530600', '盐津', '4', '0870', '657500', '中国,云南省,昭通市,盐津县', 'Yanjin', '104.23461', '28.10856');
INSERT INTO `tb_region` VALUES ('530624', '大关县', '530600', '大关', '4', '0870', '657400', '中国,云南省,昭通市,大关县', 'Daguan', '103.89254', '27.7488');
INSERT INTO `tb_region` VALUES ('530625', '永善县', '530600', '永善', '4', '0870', '657300', '中国,云南省,昭通市,永善县', 'Yongshan', '103.63504', '28.2279');
INSERT INTO `tb_region` VALUES ('530626', '绥江县', '530600', '绥江', '4', '0870', '657700', '中国,云南省,昭通市,绥江县', 'Suijiang', '103.94937', '28.59661');
INSERT INTO `tb_region` VALUES ('530627', '镇雄县', '530600', '镇雄', '4', '0870', '657200', '中国,云南省,昭通市,镇雄县', 'Zhenxiong', '104.87258', '27.43981');
INSERT INTO `tb_region` VALUES ('530628', '彝良县', '530600', '彝良', '4', '0870', '657600', '中国,云南省,昭通市,彝良县', 'Yiliang', '104.04983', '27.62809');
INSERT INTO `tb_region` VALUES ('530629', '威信县', '530600', '威信', '4', '0870', '657900', '中国,云南省,昭通市,威信县', 'Weixin', '105.04754', '27.84065');
INSERT INTO `tb_region` VALUES ('530630', '水富县', '530600', '水富', '4', '0870', '657800', '中国,云南省,昭通市,水富县', 'Shuifu', '104.4158', '28.62986');
INSERT INTO `tb_region` VALUES ('530700', '丽江市', '530000', '丽江', '3', '0888', '674100', '中国,云南省,丽江市', 'Lijiang', '100.233026', '26.872108');
INSERT INTO `tb_region` VALUES ('530702', '古城区', '530700', '古城', '4', '0888', '674100', '中国,云南省,丽江市,古城区', 'Gucheng', '100.2257', '26.87697');
INSERT INTO `tb_region` VALUES ('530721', '玉龙纳西族自治县', '530700', '玉龙', '4', '0888', '674100', '中国,云南省,丽江市,玉龙纳西族自治县', 'Yulong', '100.2369', '26.82149');
INSERT INTO `tb_region` VALUES ('530722', '永胜县', '530700', '永胜', '4', '0888', '674200', '中国,云南省,丽江市,永胜县', 'Yongsheng', '100.74667', '26.68591');
INSERT INTO `tb_region` VALUES ('530723', '华坪县', '530700', '华坪', '4', '0888', '674800', '中国,云南省,丽江市,华坪县', 'Huaping', '101.26562', '26.62967');
INSERT INTO `tb_region` VALUES ('530724', '宁蒗彝族自治县', '530700', '宁蒗', '4', '0888', '674300', '中国,云南省,丽江市,宁蒗彝族自治县', 'Ninglang', '100.8507', '27.28179');
INSERT INTO `tb_region` VALUES ('530800', '普洱市', '530000', '普洱', '3', '0879', '665000', '中国,云南省,普洱市', 'Pu\'er', '100.972344', '22.777321');
INSERT INTO `tb_region` VALUES ('530802', '思茅区', '530800', '思茅', '4', '0879', '665000', '中国,云南省,普洱市,思茅区', 'Simao', '100.97716', '22.78691');
INSERT INTO `tb_region` VALUES ('530821', '宁洱哈尼族彝族自治县', '530800', '宁洱', '4', '0879', '665100', '中国,云南省,普洱市,宁洱哈尼族彝族自治县', 'Ninger', '101.04653', '23.06341');
INSERT INTO `tb_region` VALUES ('530822', '墨江哈尼族自治县', '530800', '墨江', '4', '0879', '654800', '中国,云南省,普洱市,墨江哈尼族自治县', 'Mojiang', '101.69171', '23.43214');
INSERT INTO `tb_region` VALUES ('530823', '景东彝族自治县', '530800', '景东', '4', '0879', '676200', '中国,云南省,普洱市,景东彝族自治县', 'Jingdong', '100.83599', '24.44791');
INSERT INTO `tb_region` VALUES ('530824', '景谷傣族彝族自治县', '530800', '景谷', '4', '0879', '666400', '中国,云南省,普洱市,景谷傣族彝族自治县', 'Jinggu', '100.70251', '23.49705');
INSERT INTO `tb_region` VALUES ('530825', '镇沅彝族哈尼族拉祜族自治县', '530800', '镇沅', '4', '0879', '666500', '中国,云南省,普洱市,镇沅彝族哈尼族拉祜族自治县', 'Zhenyuan', '101.10675', '24.00557');
INSERT INTO `tb_region` VALUES ('530826', '江城哈尼族彝族自治县', '530800', '江城', '4', '0879', '665900', '中国,云南省,普洱市,江城哈尼族彝族自治县', 'Jiangcheng', '101.85788', '22.58424');
INSERT INTO `tb_region` VALUES ('530827', '孟连傣族拉祜族佤族自治县', '530800', '孟连', '4', '0879', '665800', '中国,云南省,普洱市,孟连傣族拉祜族佤族自治县', 'Menglian', '99.58424', '22.32922');
INSERT INTO `tb_region` VALUES ('530828', '澜沧拉祜族自治县', '530800', '澜沧', '4', '0879', '665600', '中国,云南省,普洱市,澜沧拉祜族自治县', 'Lancang', '99.93591', '22.55474');
INSERT INTO `tb_region` VALUES ('530829', '西盟佤族自治县', '530800', '西盟', '4', '0879', '665700', '中国,云南省,普洱市,西盟佤族自治县', 'Ximeng', '99.59869', '22.64774');
INSERT INTO `tb_region` VALUES ('530900', '临沧市', '530000', '临沧', '3', '0883', '677000', '中国,云南省,临沧市', 'Lincang', '100.08697', '23.886567');
INSERT INTO `tb_region` VALUES ('530902', '临翔区', '530900', '临翔', '4', '0883', '677000', '中国,云南省,临沧市,临翔区', 'Linxiang', '100.08242', '23.89497');
INSERT INTO `tb_region` VALUES ('530921', '凤庆县', '530900', '凤庆', '4', '0883', '675900', '中国,云南省,临沧市,凤庆县', 'Fengqing', '99.92837', '24.58034');
INSERT INTO `tb_region` VALUES ('530922', '云县', '530900', '云县', '4', '0883', '675800', '中国,云南省,临沧市,云县', 'Yunxian', '100.12808', '24.44675');
INSERT INTO `tb_region` VALUES ('530923', '永德县', '530900', '永德', '4', '0883', '677600', '中国,云南省,临沧市,永德县', 'Yongde', '99.25326', '24.0276');
INSERT INTO `tb_region` VALUES ('530924', '镇康县', '530900', '镇康', '4', '0883', '677704', '中国,云南省,临沧市,镇康县', 'Zhenkang', '98.8255', '23.76241');
INSERT INTO `tb_region` VALUES ('530925', '双江拉祜族佤族布朗族傣族自治县', '530900', '双江', '4', '0883', '677300', '中国,云南省,临沧市,双江拉祜族佤族布朗族傣族自治县', 'Shuangjiang', '99.82769', '23.47349');
INSERT INTO `tb_region` VALUES ('530926', '耿马傣族佤族自治县', '530900', '耿马', '4', '0883', '677500', '中国,云南省,临沧市,耿马傣族佤族自治县', 'Gengma', '99.39785', '23.53776');
INSERT INTO `tb_region` VALUES ('530927', '沧源佤族自治县', '530900', '沧源', '4', '0883', '677400', '中国,云南省,临沧市,沧源佤族自治县', 'Cangyuan', '99.24545', '23.14821');
INSERT INTO `tb_region` VALUES ('532300', '楚雄彝族自治州', '530000', '楚雄', '3', '0878', '675000', '中国,云南省,楚雄彝族自治州', 'Chuxiong', '101.546046', '25.041988');
INSERT INTO `tb_region` VALUES ('532301', '楚雄市', '532300', '楚雄', '4', '0878', '675000', '中国,云南省,楚雄彝族自治州,楚雄市', 'Chuxiong', '101.54615', '25.0329');
INSERT INTO `tb_region` VALUES ('532322', '双柏县', '532300', '双柏', '4', '0878', '675100', '中国,云南省,楚雄彝族自治州,双柏县', 'Shuangbai', '101.64205', '24.68882');
INSERT INTO `tb_region` VALUES ('532323', '牟定县', '532300', '牟定', '4', '0878', '675500', '中国,云南省,楚雄彝族自治州,牟定县', 'Mouding', '101.54', '25.31551');
INSERT INTO `tb_region` VALUES ('532324', '南华县', '532300', '南华', '4', '0878', '675200', '中国,云南省,楚雄彝族自治州,南华县', 'Nanhua', '101.27313', '25.19293');
INSERT INTO `tb_region` VALUES ('532325', '姚安县', '532300', '姚安', '4', '0878', '675300', '中国,云南省,楚雄彝族自治州,姚安县', 'Yao\'an', '101.24279', '25.50467');
INSERT INTO `tb_region` VALUES ('532326', '大姚县', '532300', '大姚', '4', '0878', '675400', '中国,云南省,楚雄彝族自治州,大姚县', 'Dayao', '101.32397', '25.72218');
INSERT INTO `tb_region` VALUES ('532327', '永仁县', '532300', '永仁', '4', '0878', '651400', '中国,云南省,楚雄彝族自治州,永仁县', 'Yongren', '101.6716', '26.05794');
INSERT INTO `tb_region` VALUES ('532328', '元谋县', '532300', '元谋', '4', '0878', '651300', '中国,云南省,楚雄彝族自治州,元谋县', 'Yuanmou', '101.87728', '25.70438');
INSERT INTO `tb_region` VALUES ('532329', '武定县', '532300', '武定', '4', '0878', '651600', '中国,云南省,楚雄彝族自治州,武定县', 'Wuding', '102.4038', '25.5295');
INSERT INTO `tb_region` VALUES ('532331', '禄丰县', '532300', '禄丰', '4', '0878', '651200', '中国,云南省,楚雄彝族自治州,禄丰县', 'Lufeng', '102.07797', '25.14815');
INSERT INTO `tb_region` VALUES ('532500', '红河哈尼族彝族自治州', '530000', '红河', '3', '0873', '661400', '中国,云南省,红河哈尼族彝族自治州', 'Honghe', '103.384182', '23.366775');
INSERT INTO `tb_region` VALUES ('532501', '个旧市', '532500', '个旧', '4', '0873', '661000', '中国,云南省,红河哈尼族彝族自治州,个旧市', 'Gejiu', '103.15966', '23.35894');
INSERT INTO `tb_region` VALUES ('532502', '开远市', '532500', '开远', '4', '0873', '661600', '中国,云南省,红河哈尼族彝族自治州,开远市', 'Kaiyuan', '103.26986', '23.71012');
INSERT INTO `tb_region` VALUES ('532503', '蒙自市', '532500', '蒙自', '4', '0873', '661101', '中国,云南省,红河哈尼族彝族自治州,蒙自市', 'Mengzi', '103.385005', '23.366843');
INSERT INTO `tb_region` VALUES ('532504', '弥勒市', '532500', '弥勒', '4', '0873', '652300', '中国,云南省,红河哈尼族彝族自治州,弥勒市', 'Mile ', '103.436988', '24.40837');
INSERT INTO `tb_region` VALUES ('532523', '屏边苗族自治县', '532500', '屏边', '4', '0873', '661200', '中国,云南省,红河哈尼族彝族自治州,屏边苗族自治县', 'Pingbian', '103.68554', '22.98425');
INSERT INTO `tb_region` VALUES ('532524', '建水县', '532500', '建水', '4', '0873', '654300', '中国,云南省,红河哈尼族彝族自治州,建水县', 'Jianshui', '102.82656', '23.63472');
INSERT INTO `tb_region` VALUES ('532525', '石屏县', '532500', '石屏', '4', '0873', '662200', '中国,云南省,红河哈尼族彝族自治州,石屏县', 'Shiping', '102.49408', '23.71441');
INSERT INTO `tb_region` VALUES ('532527', '泸西县', '532500', '泸西', '4', '0873', '652400', '中国,云南省,红河哈尼族彝族自治州,泸西县', 'Luxi', '103.76373', '24.52854');
INSERT INTO `tb_region` VALUES ('532528', '元阳县', '532500', '元阳', '4', '0873', '662400', '中国,云南省,红河哈尼族彝族自治州,元阳县', 'Yuanyang', '102.83261', '23.22281');
INSERT INTO `tb_region` VALUES ('532529', '红河县', '532500', '红河县', '4', '0873', '654400', '中国,云南省,红河哈尼族彝族自治州,红河县', 'Honghexian', '102.42059', '23.36767');
INSERT INTO `tb_region` VALUES ('532530', '金平苗族瑶族傣族自治县', '532500', '金平', '4', '0873', '661500', '中国,云南省,红河哈尼族彝族自治州,金平苗族瑶族傣族自治县', 'Jinping', '103.22651', '22.77959');
INSERT INTO `tb_region` VALUES ('532531', '绿春县', '532500', '绿春', '4', '0873', '662500', '中国,云南省,红河哈尼族彝族自治州,绿春县', 'Lvchun', '102.39672', '22.99371');
INSERT INTO `tb_region` VALUES ('532532', '河口瑶族自治县', '532500', '河口', '4', '0873', '661300', '中国,云南省,红河哈尼族彝族自治州,河口瑶族自治县', 'Hekou', '103.93936', '22.52929');
INSERT INTO `tb_region` VALUES ('532600', '文山壮族苗族自治州', '530000', '文山', '3', '0876', '663000', '中国,云南省,文山壮族苗族自治州', 'Wenshan', '104.24401', '23.36951');
INSERT INTO `tb_region` VALUES ('532601', '文山市', '532600', '文山', '4', '0876', '663000', '中国,云南省,文山壮族苗族自治州,文山市', 'Wenshan', '104.244277', '23.369216');
INSERT INTO `tb_region` VALUES ('532622', '砚山县', '532600', '砚山', '4', '0876', '663100', '中国,云南省,文山壮族苗族自治州,砚山县', 'Yanshan', '104.33306', '23.60723');
INSERT INTO `tb_region` VALUES ('532623', '西畴县', '532600', '西畴', '4', '0876', '663500', '中国,云南省,文山壮族苗族自治州,西畴县', 'Xichou', '104.67419', '23.43941');
INSERT INTO `tb_region` VALUES ('532624', '麻栗坡县', '532600', '麻栗坡', '4', '0876', '663600', '中国,云南省,文山壮族苗族自治州,麻栗坡县', 'Malipo', '104.70132', '23.12028');
INSERT INTO `tb_region` VALUES ('532625', '马关县', '532600', '马关', '4', '0876', '663700', '中国,云南省,文山壮族苗族自治州,马关县', 'Maguan', '104.39514', '23.01293');
INSERT INTO `tb_region` VALUES ('532626', '丘北县', '532600', '丘北', '4', '0876', '663200', '中国,云南省,文山壮族苗族自治州,丘北县', 'Qiubei', '104.19256', '24.03957');
INSERT INTO `tb_region` VALUES ('532627', '广南县', '532600', '广南', '4', '0876', '663300', '中国,云南省,文山壮族苗族自治州,广南县', 'Guangnan', '105.05511', '24.0464');
INSERT INTO `tb_region` VALUES ('532628', '富宁县', '532600', '富宁', '4', '0876', '663400', '中国,云南省,文山壮族苗族自治州,富宁县', 'Funing', '105.63085', '23.62536');
INSERT INTO `tb_region` VALUES ('532800', '西双版纳傣族自治州', '530000', '西双版纳', '3', '0691', '666100', '中国,云南省,西双版纳傣族自治州', 'Xishuangbanna', '100.797941', '22.001724');
INSERT INTO `tb_region` VALUES ('532801', '景洪市', '532800', '景洪', '4', '0691', '666100', '中国,云南省,西双版纳傣族自治州,景洪市', 'Jinghong', '100.79977', '22.01071');
INSERT INTO `tb_region` VALUES ('532822', '勐海县', '532800', '勐海', '4', '0691', '666200', '中国,云南省,西双版纳傣族自治州,勐海县', 'Menghai', '100.44931', '21.96175');
INSERT INTO `tb_region` VALUES ('532823', '勐腊县', '532800', '勐腊', '4', '0691', '666300', '中国,云南省,西双版纳傣族自治州,勐腊县', 'Mengla', '101.56488', '21.48162');
INSERT INTO `tb_region` VALUES ('532900', '大理白族自治州', '530000', '大理', '3', '0872', '671000', '中国,云南省,大理白族自治州', 'Dali', '100.240037', '25.592765');
INSERT INTO `tb_region` VALUES ('532901', '大理市', '532900', '大理', '4', '0872', '671000', '中国,云南省,大理白族自治州,大理市', 'Dali', '100.22998', '25.59157');
INSERT INTO `tb_region` VALUES ('532922', '漾濞彝族自治县', '532900', '漾濞', '4', '0872', '672500', '中国,云南省,大理白族自治州,漾濞彝族自治县', 'Yangbi', '99.95474', '25.6652');
INSERT INTO `tb_region` VALUES ('532923', '祥云县', '532900', '祥云', '4', '0872', '672100', '中国,云南省,大理白族自治州,祥云县', 'Xiangyun', '100.55761', '25.47342');
INSERT INTO `tb_region` VALUES ('532924', '宾川县', '532900', '宾川', '4', '0872', '671600', '中国,云南省,大理白族自治州,宾川县', 'Binchuan', '100.57666', '25.83144');
INSERT INTO `tb_region` VALUES ('532925', '弥渡县', '532900', '弥渡', '4', '0872', '675600', '中国,云南省,大理白族自治州,弥渡县', 'Midu', '100.49075', '25.34179');
INSERT INTO `tb_region` VALUES ('532926', '南涧彝族自治县', '532900', '南涧', '4', '0872', '675700', '中国,云南省,大理白族自治州,南涧彝族自治县', 'Nanjian', '100.50964', '25.04349');
INSERT INTO `tb_region` VALUES ('532927', '巍山彝族回族自治县', '532900', '巍山', '4', '0872', '672400', '中国,云南省,大理白族自治州,巍山彝族回族自治县', 'Weishan', '100.30612', '25.23197');
INSERT INTO `tb_region` VALUES ('532928', '永平县', '532900', '永平', '4', '0872', '672600', '中国,云南省,大理白族自治州,永平县', 'Yongping', '99.54095', '25.46451');
INSERT INTO `tb_region` VALUES ('532929', '云龙县', '532900', '云龙', '4', '0872', '672700', '中国,云南省,大理白族自治州,云龙县', 'Yunlong', '99.37255', '25.88505');
INSERT INTO `tb_region` VALUES ('532930', '洱源县', '532900', '洱源', '4', '0872', '671200', '中国,云南省,大理白族自治州,洱源县', 'Eryuan', '99.94903', '26.10829');
INSERT INTO `tb_region` VALUES ('532931', '剑川县', '532900', '剑川', '4', '0872', '671300', '中国,云南省,大理白族自治州,剑川县', 'Jianchuan', '99.90545', '26.53688');
INSERT INTO `tb_region` VALUES ('532932', '鹤庆县', '532900', '鹤庆', '4', '0872', '671500', '中国,云南省,大理白族自治州,鹤庆县', 'Heqing', '100.17697', '26.55798');
INSERT INTO `tb_region` VALUES ('533100', '德宏傣族景颇族自治州', '530000', '德宏', '3', '0692', '678400', '中国,云南省,德宏傣族景颇族自治州', 'Dehong', '98.578363', '24.436694');
INSERT INTO `tb_region` VALUES ('533102', '瑞丽市', '533100', '瑞丽', '4', '0692', '678600', '中国,云南省,德宏傣族景颇族自治州,瑞丽市', 'Ruili', '97.85183', '24.01277');
INSERT INTO `tb_region` VALUES ('533103', '芒市', '533100', '芒市', '4', '0692', '678400', '中国,云南省,德宏傣族景颇族自治州,芒市', 'Mangshi', '98.588641', '24.433735');
INSERT INTO `tb_region` VALUES ('533122', '梁河县', '533100', '梁河', '4', '0692', '679200', '中国,云南省,德宏傣族景颇族自治州,梁河县', 'Lianghe', '98.29705', '24.80658');
INSERT INTO `tb_region` VALUES ('533123', '盈江县', '533100', '盈江', '4', '0692', '679300', '中国,云南省,德宏傣族景颇族自治州,盈江县', 'Yingjiang', '97.93179', '24.70579');
INSERT INTO `tb_region` VALUES ('533124', '陇川县', '533100', '陇川', '4', '0692', '678700', '中国,云南省,德宏傣族景颇族自治州,陇川县', 'Longchuan', '97.79199', '24.18302');
INSERT INTO `tb_region` VALUES ('533300', '怒江傈僳族自治州', '530000', '怒江', '3', '0886', '673100', '中国,云南省,怒江傈僳族自治州', 'Nujiang', '98.854304', '25.850949');
INSERT INTO `tb_region` VALUES ('533321', '泸水县', '533300', '泸水', '4', '0886', '673100', '中国,云南省,怒江傈僳族自治州,泸水县', 'Lushui', '98.85534', '25.83772');
INSERT INTO `tb_region` VALUES ('533323', '福贡县', '533300', '福贡', '4', '0886', '673400', '中国,云南省,怒江傈僳族自治州,福贡县', 'Fugong', '98.86969', '26.90366');
INSERT INTO `tb_region` VALUES ('533324', '贡山独龙族怒族自治县', '533300', '贡山', '4', '0886', '673500', '中国,云南省,怒江傈僳族自治州,贡山独龙族怒族自治县', 'Gongshan', '98.66583', '27.74088');
INSERT INTO `tb_region` VALUES ('533325', '兰坪白族普米族自治县', '533300', '兰坪', '4', '0886', '671400', '中国,云南省,怒江傈僳族自治州,兰坪白族普米族自治县', 'Lanping', '99.41891', '26.45251');
INSERT INTO `tb_region` VALUES ('533400', '迪庆藏族自治州', '530000', '迪庆', '3', '0887', '674400', '中国,云南省,迪庆藏族自治州', 'Deqen', '99.706463', '27.826853');
INSERT INTO `tb_region` VALUES ('533421', '香格里拉市', '533400', '香格里拉', '4', '0887', '674400', '中国,云南省,迪庆藏族自治州,香格里拉市', 'Xianggelila', '99.70601', '27.82308');
INSERT INTO `tb_region` VALUES ('533422', '德钦县', '533400', '德钦', '4', '0887', '674500', '中国,云南省,迪庆藏族自治州,德钦县', 'Deqin', '98.91082', '28.4863');
INSERT INTO `tb_region` VALUES ('533423', '维西傈僳族自治县', '533400', '维西', '4', '0887', '674600', '中国,云南省,迪庆藏族自治州,维西傈僳族自治县', 'Weixi', '99.28402', '27.1793');
INSERT INTO `tb_region` VALUES ('540000', '西藏自治区', '100005', '西藏', '2', '', '', '中国,西藏自治区', 'Tibet', '91.132212', '29.660361');
INSERT INTO `tb_region` VALUES ('540100', '拉萨市', '540000', '拉萨', '3', '0891', '850000', '中国,西藏自治区,拉萨市', 'Lhasa', '91.132212', '29.660361');
INSERT INTO `tb_region` VALUES ('540102', '城关区', '540100', '城关', '4', '0891', '850000', '中国,西藏自治区,拉萨市,城关区', 'Chengguan', '91.13859', '29.65312');
INSERT INTO `tb_region` VALUES ('540121', '林周县', '540100', '林周', '4', '0891', '851600', '中国,西藏自治区,拉萨市,林周县', 'Linzhou', '91.2586', '29.89445');
INSERT INTO `tb_region` VALUES ('540122', '当雄县', '540100', '当雄', '4', '0891', '851500', '中国,西藏自治区,拉萨市,当雄县', 'Dangxiong', '91.10076', '30.48309');
INSERT INTO `tb_region` VALUES ('540123', '尼木县', '540100', '尼木', '4', '0891', '851300', '中国,西藏自治区,拉萨市,尼木县', 'Nimu', '90.16378', '29.43353');
INSERT INTO `tb_region` VALUES ('540124', '曲水县', '540100', '曲水', '4', '0891', '850600', '中国,西藏自治区,拉萨市,曲水县', 'Qushui', '90.73187', '29.35636');
INSERT INTO `tb_region` VALUES ('540125', '堆龙德庆县', '540100', '堆龙德庆', '4', '0891', '851400', '中国,西藏自治区,拉萨市,堆龙德庆县', 'Duilongdeqing', '91.00033', '29.65002');
INSERT INTO `tb_region` VALUES ('540126', '达孜县', '540100', '达孜', '4', '0891', '850100', '中国,西藏自治区,拉萨市,达孜县', 'Dazi', '91.35757', '29.6722');
INSERT INTO `tb_region` VALUES ('540127', '墨竹工卡县', '540100', '墨竹工卡', '4', '0891', '850200', '中国,西藏自治区,拉萨市,墨竹工卡县', 'Mozhugongka', '91.72814', '29.83614');
INSERT INTO `tb_region` VALUES ('540200', '日喀则市', '540000', '日喀则', '3', '0892', '857000', '中国,西藏自治区,日喀则市', 'Rikaze', '88.884874', '29.263792');
INSERT INTO `tb_region` VALUES ('540202', '桑珠孜区', '540200', '桑珠孜', '4', '0892', '857000', '中国,西藏自治区,日喀则市,桑珠孜区', 'Sangzhuzi', '88.880367', '29.269565');
INSERT INTO `tb_region` VALUES ('540221', '南木林县', '540200', '南木林', '4', '0892', '857100', '中国,西藏自治区,日喀则市,南木林县', 'Nanmulin', '89.09686', '29.68206');
INSERT INTO `tb_region` VALUES ('540222', '江孜县', '540200', '江孜', '4', '0892', '857400', '中国,西藏自治区,日喀则市,江孜县', 'Jiangzi', '89.60263', '28.91744');
INSERT INTO `tb_region` VALUES ('540223', '定日县', '540200', '定日', '4', '0892', '858200', '中国,西藏自治区,日喀则市,定日县', 'Dingri', '87.12176', '28.66129');
INSERT INTO `tb_region` VALUES ('540224', '萨迦县', '540200', '萨迦', '4', '0892', '857800', '中国,西藏自治区,日喀则市,萨迦县', 'Sajia', '88.02191', '28.90299');
INSERT INTO `tb_region` VALUES ('540225', '拉孜县', '540200', '拉孜', '4', '0892', '858100', '中国,西藏自治区,日喀则市,拉孜县', 'Lazi', '87.63412', '29.085');
INSERT INTO `tb_region` VALUES ('540226', '昂仁县', '540200', '昂仁', '4', '0892', '858500', '中国,西藏自治区,日喀则市,昂仁县', 'Angren', '87.23858', '29.29496');
INSERT INTO `tb_region` VALUES ('540227', '谢通门县', '540200', '谢通门', '4', '0892', '858900', '中国,西藏自治区,日喀则市,谢通门县', 'Xietongmen', '88.26242', '29.43337');
INSERT INTO `tb_region` VALUES ('540228', '白朗县', '540200', '白朗', '4', '0892', '857300', '中国,西藏自治区,日喀则市,白朗县', 'Bailang', '89.26205', '29.10553');
INSERT INTO `tb_region` VALUES ('540229', '仁布县', '540200', '仁布', '4', '0892', '857200', '中国,西藏自治区,日喀则市,仁布县', 'Renbu', '89.84228', '29.2301');
INSERT INTO `tb_region` VALUES ('540230', '康马县', '540200', '康马', '4', '0892', '857500', '中国,西藏自治区,日喀则市,康马县', 'Kangma', '89.68527', '28.5567');
INSERT INTO `tb_region` VALUES ('540231', '定结县', '540200', '定结', '4', '0892', '857900', '中国,西藏自治区,日喀则市,定结县', 'Dingjie', '87.77255', '28.36403');
INSERT INTO `tb_region` VALUES ('540232', '仲巴县', '540200', '仲巴', '4', '0892', '858800', '中国,西藏自治区,日喀则市,仲巴县', 'Zhongba', '84.02951', '29.76595');
INSERT INTO `tb_region` VALUES ('540233', '亚东县', '540200', '亚东', '4', '0892', '857600', '中国,西藏自治区,日喀则市,亚东县', 'Yadong', '88.90802', '27.4839');
INSERT INTO `tb_region` VALUES ('540234', '吉隆县', '540200', '吉隆', '4', '0892', '858700', '中国,西藏自治区,日喀则市,吉隆县', 'Jilong', '85.29846', '28.85382');
INSERT INTO `tb_region` VALUES ('540235', '聂拉木县', '540200', '聂拉木', '4', '0892', '858300', '中国,西藏自治区,日喀则市,聂拉木县', 'Nielamu', '85.97998', '28.15645');
INSERT INTO `tb_region` VALUES ('540236', '萨嘎县', '540200', '萨嘎', '4', '0892', '857800', '中国,西藏自治区,日喀则市,萨嘎县', 'Saga', '85.23413', '29.32936');
INSERT INTO `tb_region` VALUES ('540237', '岗巴县', '540200', '岗巴', '4', '0892', '857700', '中国,西藏自治区,日喀则市,岗巴县', 'Gangba', '88.52069', '28.27504');
INSERT INTO `tb_region` VALUES ('540300', '昌都市', '540000', '昌都', '3', '0895', '854000', '中国,西藏自治区,昌都市', 'Qamdo', '97.178452', '31.136875');
INSERT INTO `tb_region` VALUES ('540302', '卡若区', '540300', '昌都', '4', '0895', '854000', '中国,西藏自治区,昌都市,卡若区', 'Karuo', '97.18043', '31.1385');
INSERT INTO `tb_region` VALUES ('540321', '江达县', '540300', '江达', '4', '0895', '854100', '中国,西藏自治区,昌都市,江达县', 'Jiangda', '98.21865', '31.50343');
INSERT INTO `tb_region` VALUES ('540322', '贡觉县', '540300', '贡觉', '4', '0895', '854200', '中国,西藏自治区,昌都市,贡觉县', 'Gongjue', '98.27163', '30.85941');
INSERT INTO `tb_region` VALUES ('540323', '类乌齐县', '540300', '类乌齐', '4', '0895', '855600', '中国,西藏自治区,昌都市,类乌齐县', 'Leiwuqi', '96.60015', '31.21207');
INSERT INTO `tb_region` VALUES ('540324', '丁青县', '540300', '丁青', '4', '0895', '855700', '中国,西藏自治区,昌都市,丁青县', 'Dingqing', '95.59362', '31.41621');
INSERT INTO `tb_region` VALUES ('540325', '察雅县', '540300', '察雅', '4', '0895', '854300', '中国,西藏自治区,昌都市,察雅县', 'Chaya', '97.56521', '30.65336');
INSERT INTO `tb_region` VALUES ('540326', '八宿县', '540300', '八宿', '4', '0895', '854600', '中国,西藏自治区,昌都市,八宿县', 'Basu', '96.9176', '30.05346');
INSERT INTO `tb_region` VALUES ('540327', '左贡县', '540300', '左贡', '4', '0895', '854400', '中国,西藏自治区,昌都市,左贡县', 'Zuogong', '97.84429', '29.67108');
INSERT INTO `tb_region` VALUES ('540328', '芒康县', '540300', '芒康', '4', '0895', '854500', '中国,西藏自治区,昌都市,芒康县', 'Mangkang', '98.59378', '29.67946');
INSERT INTO `tb_region` VALUES ('540329', '洛隆县', '540300', '洛隆', '4', '0895', '855400', '中国,西藏自治区,昌都市,洛隆县', 'Luolong', '95.82644', '30.74049');
INSERT INTO `tb_region` VALUES ('540330', '边坝县', '540300', '边坝', '4', '0895', '855500', '中国,西藏自治区,昌都市,边坝县', 'Bianba', '94.70687', '30.93434');
INSERT INTO `tb_region` VALUES ('542200', '山南地区', '540000', '山南', '3', '0893', '856000', '中国,西藏自治区,山南地区', 'Shannan', '91.766529', '29.236023');
INSERT INTO `tb_region` VALUES ('542221', '乃东县', '542200', '乃东', '4', '0893', '856100', '中国,西藏自治区,山南地区,乃东县', 'Naidong', '91.76153', '29.2249');
INSERT INTO `tb_region` VALUES ('542222', '扎囊县', '542200', '扎囊', '4', '0893', '850800', '中国,西藏自治区,山南地区,扎囊县', 'Zhanang', '91.33288', '29.2399');
INSERT INTO `tb_region` VALUES ('542223', '贡嘎县', '542200', '贡嘎', '4', '0893', '850700', '中国,西藏自治区,山南地区,贡嘎县', 'Gongga', '90.98867', '29.29408');
INSERT INTO `tb_region` VALUES ('542224', '桑日县', '542200', '桑日', '4', '0893', '856200', '中国,西藏自治区,山南地区,桑日县', 'Sangri', '92.02005', '29.26643');
INSERT INTO `tb_region` VALUES ('542225', '琼结县', '542200', '琼结', '4', '0893', '856800', '中国,西藏自治区,山南地区,琼结县', 'Qiongjie', '91.68093', '29.02632');
INSERT INTO `tb_region` VALUES ('542226', '曲松县', '542200', '曲松', '4', '0893', '856300', '中国,西藏自治区,山南地区,曲松县', 'Qusong', '92.20263', '29.06412');
INSERT INTO `tb_region` VALUES ('542227', '措美县', '542200', '措美', '4', '0893', '856900', '中国,西藏自治区,山南地区,措美县', 'Cuomei', '91.43237', '28.43794');
INSERT INTO `tb_region` VALUES ('542228', '洛扎县', '542200', '洛扎', '4', '0893', '856600', '中国,西藏自治区,山南地区,洛扎县', 'Luozha', '90.86035', '28.3872');
INSERT INTO `tb_region` VALUES ('542229', '加查县', '542200', '加查', '4', '0893', '856400', '中国,西藏自治区,山南地区,加查县', 'Jiacha', '92.57702', '29.13973');
INSERT INTO `tb_region` VALUES ('542231', '隆子县', '542200', '隆子', '4', '0893', '856600', '中国,西藏自治区,山南地区,隆子县', 'Longzi', '92.46148', '28.40797');
INSERT INTO `tb_region` VALUES ('542232', '错那县', '542200', '错那', '4', '0893', '856700', '中国,西藏自治区,山南地区,错那县', 'Cuona', '91.95752', '27.99224');
INSERT INTO `tb_region` VALUES ('542233', '浪卡子县', '542200', '浪卡子', '4', '0893', '851100', '中国,西藏自治区,山南地区,浪卡子县', 'Langkazi', '90.40002', '28.96948');
INSERT INTO `tb_region` VALUES ('542400', '那曲地区', '540000', '那曲', '3', '0896', '852000', '中国,西藏自治区,那曲地区', 'Nagqu', '92.060214', '31.476004');
INSERT INTO `tb_region` VALUES ('542421', '那曲县', '542400', '那曲', '4', '0896', '852000', '中国,西藏自治区,那曲地区,那曲县', 'Naqu', '92.0535', '31.46964');
INSERT INTO `tb_region` VALUES ('542422', '嘉黎县', '542400', '嘉黎', '4', '0896', '852400', '中国,西藏自治区,那曲地区,嘉黎县', 'Jiali', '93.24987', '30.64233');
INSERT INTO `tb_region` VALUES ('542423', '比如县', '542400', '比如', '4', '0896', '852300', '中国,西藏自治区,那曲地区,比如县', 'Biru', '93.68685', '31.4779');
INSERT INTO `tb_region` VALUES ('542424', '聂荣县', '542400', '聂荣', '4', '0896', '853500', '中国,西藏自治区,那曲地区,聂荣县', 'Nierong', '92.29574', '32.11193');
INSERT INTO `tb_region` VALUES ('542425', '安多县', '542400', '安多', '4', '0896', '853400', '中国,西藏自治区,那曲地区,安多县', 'Anduo', '91.6795', '32.26125');
INSERT INTO `tb_region` VALUES ('542426', '申扎县', '542400', '申扎', '4', '0896', '853100', '中国,西藏自治区,那曲地区,申扎县', 'Shenzha', '88.70776', '30.92995');
INSERT INTO `tb_region` VALUES ('542427', '索县', '542400', '索县', '4', '0896', '852200', '中国,西藏自治区,那曲地区,索县', 'Suoxian', '93.78295', '31.88427');
INSERT INTO `tb_region` VALUES ('542428', '班戈县', '542400', '班戈', '4', '0896', '852500', '中国,西藏自治区,那曲地区,班戈县', 'Bange', '90.01907', '31.36149');
INSERT INTO `tb_region` VALUES ('542429', '巴青县', '542400', '巴青', '4', '0896', '852100', '中国,西藏自治区,那曲地区,巴青县', 'Baqing', '94.05316', '31.91833');
INSERT INTO `tb_region` VALUES ('542430', '尼玛县', '542400', '尼玛', '4', '0896', '852600', '中国,西藏自治区,那曲地区,尼玛县', 'Nima', '87.25256', '31.79654');
INSERT INTO `tb_region` VALUES ('542431', '双湖县', '542400', '双湖', '4', '0896', '852600', '中国,西藏自治区,那曲地区,双湖县', 'Shuanghu', '88.837776', '33.189032');
INSERT INTO `tb_region` VALUES ('542500', '阿里地区', '540000', '阿里', '3', '0897', '859000', '中国,西藏自治区,阿里地区', 'Ngari', '80.105498', '32.503187');
INSERT INTO `tb_region` VALUES ('542521', '普兰县', '542500', '普兰', '4', '0897', '859500', '中国,西藏自治区,阿里地区,普兰县', 'Pulan', '81.177', '30.30002');
INSERT INTO `tb_region` VALUES ('542522', '札达县', '542500', '札达', '4', '0897', '859600', '中国,西藏自治区,阿里地区,札达县', 'Zhada', '79.80255', '31.48345');
INSERT INTO `tb_region` VALUES ('542523', '噶尔县', '542500', '噶尔', '4', '0897', '859400', '中国,西藏自治区,阿里地区,噶尔县', 'Gaer', '80.09579', '32.50024');
INSERT INTO `tb_region` VALUES ('542524', '日土县', '542500', '日土', '4', '0897', '859700', '中国,西藏自治区,阿里地区,日土县', 'Ritu', '79.7131', '33.38741');
INSERT INTO `tb_region` VALUES ('542525', '革吉县', '542500', '革吉', '4', '0897', '859100', '中国,西藏自治区,阿里地区,革吉县', 'Geji', '81.151', '32.3964');
INSERT INTO `tb_region` VALUES ('542526', '改则县', '542500', '改则', '4', '0897', '859200', '中国,西藏自治区,阿里地区,改则县', 'Gaize', '84.06295', '32.30446');
INSERT INTO `tb_region` VALUES ('542527', '措勤县', '542500', '措勤', '4', '0897', '859300', '中国,西藏自治区,阿里地区,措勤县', 'Cuoqin', '85.16616', '31.02095');
INSERT INTO `tb_region` VALUES ('542600', '林芝地区', '540000', '林芝', '3', '0894', '850400', '中国,西藏自治区,林芝地区', 'Nyingchi', '94.362348', '29.654693');
INSERT INTO `tb_region` VALUES ('542621', '林芝县', '542600', '林芝', '4', '0894', '850400', '中国,西藏自治区,林芝地区,林芝县', 'Linzhi', '94.48391', '29.57562');
INSERT INTO `tb_region` VALUES ('542622', '工布江达县', '542600', '工布江达', '4', '0894', '850300', '中国,西藏自治区,林芝地区,工布江达县', 'Gongbujiangda', '93.2452', '29.88576');
INSERT INTO `tb_region` VALUES ('542623', '米林县', '542600', '米林', '4', '0894', '850500', '中国,西藏自治区,林芝地区,米林县', 'Milin', '94.21316', '29.21535');
INSERT INTO `tb_region` VALUES ('542624', '墨脱县', '542600', '墨脱', '4', '0894', '855300', '中国,西藏自治区,林芝地区,墨脱县', 'Motuo', '95.3316', '29.32698');
INSERT INTO `tb_region` VALUES ('542625', '波密县', '542600', '波密', '4', '0894', '855200', '中国,西藏自治区,林芝地区,波密县', 'Bomi', '95.77096', '29.85907');
INSERT INTO `tb_region` VALUES ('542626', '察隅县', '542600', '察隅', '4', '0894', '855100', '中国,西藏自治区,林芝地区,察隅县', 'Chayu', '97.46679', '28.6618');
INSERT INTO `tb_region` VALUES ('542627', '朗县', '542600', '朗县', '4', '0894', '856500', '中国,西藏自治区,林芝地区,朗县', 'Langxian', '93.0754', '29.04549');
INSERT INTO `tb_region` VALUES ('610000', '陕西省', '100005', '陕西', '2', '', '', '中国,陕西省', 'Shaanxi', '108.948024', '34.263161');
INSERT INTO `tb_region` VALUES ('610100', '西安市', '610000', '西安', '3', '029', '710003', '中国,陕西省,西安市', 'Xi\'an', '108.948024', '34.263161');
INSERT INTO `tb_region` VALUES ('610102', '新城区', '610100', '新城', '4', '029', '710004', '中国,陕西省,西安市,新城区', 'Xincheng', '108.9608', '34.26641');
INSERT INTO `tb_region` VALUES ('610103', '碑林区', '610100', '碑林', '4', '029', '710001', '中国,陕西省,西安市,碑林区', 'Beilin', '108.93426', '34.2304');
INSERT INTO `tb_region` VALUES ('610104', '莲湖区', '610100', '莲湖', '4', '029', '710003', '中国,陕西省,西安市,莲湖区', 'Lianhu', '108.9401', '34.26709');
INSERT INTO `tb_region` VALUES ('610111', '灞桥区', '610100', '灞桥', '4', '029', '710038', '中国,陕西省,西安市,灞桥区', 'Baqiao', '109.06451', '34.27264');
INSERT INTO `tb_region` VALUES ('610112', '未央区', '610100', '未央', '4', '029', '710014', '中国,陕西省,西安市,未央区', 'Weiyang', '108.94683', '34.29296');
INSERT INTO `tb_region` VALUES ('610113', '雁塔区', '610100', '雁塔', '4', '029', '710061', '中国,陕西省,西安市,雁塔区', 'Yanta', '108.94866', '34.22245');
INSERT INTO `tb_region` VALUES ('610114', '阎良区', '610100', '阎良', '4', '029', '710087', '中国,陕西省,西安市,阎良区', 'Yanliang', '109.22616', '34.66221');
INSERT INTO `tb_region` VALUES ('610115', '临潼区', '610100', '临潼', '4', '029', '710600', '中国,陕西省,西安市,临潼区', 'Lintong', '109.21417', '34.36665');
INSERT INTO `tb_region` VALUES ('610116', '长安区', '610100', '长安', '4', '029', '710100', '中国,陕西省,西安市,长安区', 'Chang\'an', '108.94586', '34.15559');
INSERT INTO `tb_region` VALUES ('610122', '蓝田县', '610100', '蓝田', '4', '029', '710500', '中国,陕西省,西安市,蓝田县', 'Lantian', '109.32339', '34.15128');
INSERT INTO `tb_region` VALUES ('610124', '周至县', '610100', '周至', '4', '029', '710400', '中国,陕西省,西安市,周至县', 'Zhouzhi', '108.22207', '34.16337');
INSERT INTO `tb_region` VALUES ('610125', '户县', '610100', '户县', '4', '029', '710300', '中国,陕西省,西安市,户县', 'Huxian', '108.60513', '34.10856');
INSERT INTO `tb_region` VALUES ('610126', '高陵区', '610100', '高陵', '4', '029', '710200', '中国,陕西省,西安市,高陵区', 'Gaoling', '109.08816', '34.53483');
INSERT INTO `tb_region` VALUES ('610200', '铜川市', '610000', '铜川', '3', '0919', '727100', '中国,陕西省,铜川市', 'Tongchuan', '108.963122', '34.90892');
INSERT INTO `tb_region` VALUES ('610202', '王益区', '610200', '王益', '4', '0919', '727000', '中国,陕西省,铜川市,王益区', 'Wangyi', '109.07564', '35.06896');
INSERT INTO `tb_region` VALUES ('610203', '印台区', '610200', '印台', '4', '0919', '727007', '中国,陕西省,铜川市,印台区', 'Yintai', '109.10208', '35.1169');
INSERT INTO `tb_region` VALUES ('610204', '耀州区', '610200', '耀州', '4', '0919', '727100', '中国,陕西省,铜川市,耀州区', 'Yaozhou', '108.98556', '34.91308');
INSERT INTO `tb_region` VALUES ('610222', '宜君县', '610200', '宜君', '4', '0919', '727200', '中国,陕西省,铜川市,宜君县', 'Yijun', '109.11813', '35.40108');
INSERT INTO `tb_region` VALUES ('610300', '宝鸡市', '610000', '宝鸡', '3', '0917', '721000', '中国,陕西省,宝鸡市', 'Baoji', '107.14487', '34.369315');
INSERT INTO `tb_region` VALUES ('610302', '渭滨区', '610300', '渭滨', '4', '0917', '721000', '中国,陕西省,宝鸡市,渭滨区', 'Weibin', '107.14991', '34.37116');
INSERT INTO `tb_region` VALUES ('610303', '金台区', '610300', '金台', '4', '0917', '721000', '中国,陕西省,宝鸡市,金台区', 'Jintai', '107.14691', '34.37612');
INSERT INTO `tb_region` VALUES ('610304', '陈仓区', '610300', '陈仓', '4', '0917', '721300', '中国,陕西省,宝鸡市,陈仓区', 'Chencang', '107.38742', '34.35451');
INSERT INTO `tb_region` VALUES ('610322', '凤翔县', '610300', '凤翔', '4', '0917', '721400', '中国,陕西省,宝鸡市,凤翔县', 'Fengxiang', '107.39645', '34.52321');
INSERT INTO `tb_region` VALUES ('610323', '岐山县', '610300', '岐山', '4', '0917', '722400', '中国,陕西省,宝鸡市,岐山县', 'Qishan', '107.62173', '34.44378');
INSERT INTO `tb_region` VALUES ('610324', '扶风县', '610300', '扶风', '4', '0917', '722200', '中国,陕西省,宝鸡市,扶风县', 'Fufeng', '107.90017', '34.37524');
INSERT INTO `tb_region` VALUES ('610326', '眉县', '610300', '眉县', '4', '0917', '722300', '中国,陕西省,宝鸡市,眉县', 'Meixian', '107.75079', '34.27569');
INSERT INTO `tb_region` VALUES ('610327', '陇县', '610300', '陇县', '4', '0917', '721200', '中国,陕西省,宝鸡市,陇县', 'Longxian', '106.85946', '34.89404');
INSERT INTO `tb_region` VALUES ('610328', '千阳县', '610300', '千阳', '4', '0917', '721100', '中国,陕西省,宝鸡市,千阳县', 'Qianyang', '107.13043', '34.64219');
INSERT INTO `tb_region` VALUES ('610329', '麟游县', '610300', '麟游', '4', '0917', '721500', '中国,陕西省,宝鸡市,麟游县', 'Linyou', '107.79623', '34.67844');
INSERT INTO `tb_region` VALUES ('610330', '凤县', '610300', '凤县', '4', '0917', '721700', '中国,陕西省,宝鸡市,凤县', 'Fengxian', '106.52356', '33.91172');
INSERT INTO `tb_region` VALUES ('610331', '太白县', '610300', '太白', '4', '0917', '721600', '中国,陕西省,宝鸡市,太白县', 'Taibai', '107.31646', '34.06207');
INSERT INTO `tb_region` VALUES ('610400', '咸阳市', '610000', '咸阳', '3', '029', '712000', '中国,陕西省,咸阳市', 'Xianyang', '108.705117', '34.333439');
INSERT INTO `tb_region` VALUES ('610402', '秦都区', '610400', '秦都', '4', '029', '712000', '中国,陕西省,咸阳市,秦都区', 'Qindu', '108.71493', '34.33804');
INSERT INTO `tb_region` VALUES ('610403', '杨陵区', '610400', '杨陵', '4', '029', '712100', '中国,陕西省,咸阳市,杨陵区', 'Yangling', '108.083481', '34.270434');
INSERT INTO `tb_region` VALUES ('610404', '渭城区', '610400', '渭城', '4', '029', '712000', '中国,陕西省,咸阳市,渭城区', 'Weicheng', '108.72227', '34.33198');
INSERT INTO `tb_region` VALUES ('610422', '三原县', '610400', '三原', '4', '029', '713800', '中国,陕西省,咸阳市,三原县', 'Sanyuan', '108.93194', '34.61556');
INSERT INTO `tb_region` VALUES ('610423', '泾阳县', '610400', '泾阳', '4', '029', '713700', '中国,陕西省,咸阳市,泾阳县', 'Jingyang', '108.84259', '34.52705');
INSERT INTO `tb_region` VALUES ('610424', '乾县', '610400', '乾县', '4', '029', '713300', '中国,陕西省,咸阳市,乾县', 'Qianxian', '108.24231', '34.52946');
INSERT INTO `tb_region` VALUES ('610425', '礼泉县', '610400', '礼泉', '4', '029', '713200', '中国,陕西省,咸阳市,礼泉县', 'Liquan', '108.4263', '34.48455');
INSERT INTO `tb_region` VALUES ('610426', '永寿县', '610400', '永寿', '4', '029', '713400', '中国,陕西省,咸阳市,永寿县', 'Yongshou', '108.14474', '34.69081');
INSERT INTO `tb_region` VALUES ('610427', '彬县', '610400', '彬县', '4', '029', '713500', '中国,陕西省,咸阳市,彬县', 'Binxian', '108.08468', '35.0342');
INSERT INTO `tb_region` VALUES ('610428', '长武县', '610400', '长武', '4', '029', '713600', '中国,陕西省,咸阳市,长武县', 'Changwu', '107.7951', '35.2067');
INSERT INTO `tb_region` VALUES ('610429', '旬邑县', '610400', '旬邑', '4', '029', '711300', '中国,陕西省,咸阳市,旬邑县', 'Xunyi', '108.3341', '35.11338');
INSERT INTO `tb_region` VALUES ('610430', '淳化县', '610400', '淳化', '4', '029', '711200', '中国,陕西省,咸阳市,淳化县', 'Chunhua', '108.58026', '34.79886');
INSERT INTO `tb_region` VALUES ('610431', '武功县', '610400', '武功', '4', '029', '712200', '中国,陕西省,咸阳市,武功县', 'Wugong', '108.20434', '34.26003');
INSERT INTO `tb_region` VALUES ('610481', '兴平市', '610400', '兴平', '4', '029', '713100', '中国,陕西省,咸阳市,兴平市', 'Xingping', '108.49057', '34.29785');
INSERT INTO `tb_region` VALUES ('610500', '渭南市', '610000', '渭南', '3', '0913', '714000', '中国,陕西省,渭南市', 'Weinan', '109.502882', '34.499381');
INSERT INTO `tb_region` VALUES ('610502', '临渭区', '610500', '临渭', '4', '0913', '714000', '中国,陕西省,渭南市,临渭区', 'Linwei', '109.49296', '34.49822');
INSERT INTO `tb_region` VALUES ('610521', '华县', '610500', '华县', '4', '0913', '714100', '中国,陕西省,渭南市,华县', 'Huaxian', '109.77185', '34.51255');
INSERT INTO `tb_region` VALUES ('610522', '潼关县', '610500', '潼关', '4', '0913', '714300', '中国,陕西省,渭南市,潼关县', 'Tongguan', '110.24362', '34.54284');
INSERT INTO `tb_region` VALUES ('610523', '大荔县', '610500', '大荔', '4', '0913', '715100', '中国,陕西省,渭南市,大荔县', 'Dali', '109.94216', '34.79565');
INSERT INTO `tb_region` VALUES ('610524', '合阳县', '610500', '合阳', '4', '0913', '715300', '中国,陕西省,渭南市,合阳县', 'Heyang', '110.14862', '35.23805');
INSERT INTO `tb_region` VALUES ('610525', '澄城县', '610500', '澄城', '4', '0913', '715200', '中国,陕西省,渭南市,澄城县', 'Chengcheng', '109.93444', '35.18396');
INSERT INTO `tb_region` VALUES ('610526', '蒲城县', '610500', '蒲城', '4', '0913', '715500', '中国,陕西省,渭南市,蒲城县', 'Pucheng', '109.5903', '34.9568');
INSERT INTO `tb_region` VALUES ('610527', '白水县', '610500', '白水', '4', '0913', '715600', '中国,陕西省,渭南市,白水县', 'Baishui', '109.59286', '35.17863');
INSERT INTO `tb_region` VALUES ('610528', '富平县', '610500', '富平', '4', '0913', '711700', '中国,陕西省,渭南市,富平县', 'Fuping', '109.1802', '34.75109');
INSERT INTO `tb_region` VALUES ('610581', '韩城市', '610500', '韩城', '4', '0913', '715400', '中国,陕西省,渭南市,韩城市', 'Hancheng', '110.44238', '35.47926');
INSERT INTO `tb_region` VALUES ('610582', '华阴市', '610500', '华阴', '4', '0913', '714200', '中国,陕西省,渭南市,华阴市', 'Huayin', '110.08752', '34.56608');
INSERT INTO `tb_region` VALUES ('610600', '延安市', '610000', '延安', '3', '0911', '716000', '中国,陕西省,延安市', 'Yan\'an', '109.49081', '36.596537');
INSERT INTO `tb_region` VALUES ('610602', '宝塔区', '610600', '宝塔', '4', '0911', '716000', '中国,陕西省,延安市,宝塔区', 'Baota', '109.49336', '36.59154');
INSERT INTO `tb_region` VALUES ('610621', '延长县', '610600', '延长', '4', '0911', '717100', '中国,陕西省,延安市,延长县', 'Yanchang', '110.01083', '36.57904');
INSERT INTO `tb_region` VALUES ('610622', '延川县', '610600', '延川', '4', '0911', '717200', '中国,陕西省,延安市,延川县', 'Yanchuan', '110.19415', '36.87817');
INSERT INTO `tb_region` VALUES ('610623', '子长县', '610600', '子长', '4', '0911', '717300', '中国,陕西省,延安市,子长县', 'Zichang', '109.67532', '37.14253');
INSERT INTO `tb_region` VALUES ('610624', '安塞县', '610600', '安塞', '4', '0911', '717400', '中国,陕西省,延安市,安塞县', 'Ansai', '109.32708', '36.86507');
INSERT INTO `tb_region` VALUES ('610625', '志丹县', '610600', '志丹', '4', '0911', '717500', '中国,陕西省,延安市,志丹县', 'Zhidan', '108.76815', '36.82177');
INSERT INTO `tb_region` VALUES ('610626', '吴起县', '610600', '吴起', '4', '0911', '717600', '中国,陕西省,延安市,吴起县', 'Wuqi', '108.17611', '36.92785');
INSERT INTO `tb_region` VALUES ('610627', '甘泉县', '610600', '甘泉', '4', '0911', '716100', '中国,陕西省,延安市,甘泉县', 'Ganquan', '109.35012', '36.27754');
INSERT INTO `tb_region` VALUES ('610628', '富县', '610600', '富县', '4', '0911', '727500', '中国,陕西省,延安市,富县', 'Fuxian', '109.37927', '35.98803');
INSERT INTO `tb_region` VALUES ('610629', '洛川县', '610600', '洛川', '4', '0911', '727400', '中国,陕西省,延安市,洛川县', 'Luochuan', '109.43286', '35.76076');
INSERT INTO `tb_region` VALUES ('610630', '宜川县', '610600', '宜川', '4', '0911', '716200', '中国,陕西省,延安市,宜川县', 'Yichuan', '110.17196', '36.04732');
INSERT INTO `tb_region` VALUES ('610631', '黄龙县', '610600', '黄龙', '4', '0911', '715700', '中国,陕西省,延安市,黄龙县', 'Huanglong', '109.84259', '35.58349');
INSERT INTO `tb_region` VALUES ('610632', '黄陵县', '610600', '黄陵', '4', '0911', '727300', '中国,陕西省,延安市,黄陵县', 'Huangling', '109.26333', '35.58357');
INSERT INTO `tb_region` VALUES ('610700', '汉中市', '610000', '汉中', '3', '0916', '723000', '中国,陕西省,汉中市', 'Hanzhong', '107.028621', '33.077668');
INSERT INTO `tb_region` VALUES ('610702', '汉台区', '610700', '汉台', '4', '0916', '723000', '中国,陕西省,汉中市,汉台区', 'Hantai', '107.03187', '33.06774');
INSERT INTO `tb_region` VALUES ('610721', '南郑县', '610700', '南郑', '4', '0916', '723100', '中国,陕西省,汉中市,南郑县', 'Nanzheng', '106.94024', '33.00299');
INSERT INTO `tb_region` VALUES ('610722', '城固县', '610700', '城固', '4', '0916', '723200', '中国,陕西省,汉中市,城固县', 'Chenggu', '107.33367', '33.15661');
INSERT INTO `tb_region` VALUES ('610723', '洋县', '610700', '洋县', '4', '0916', '723300', '中国,陕西省,汉中市,洋县', 'Yangxian', '107.54672', '33.22102');
INSERT INTO `tb_region` VALUES ('610724', '西乡县', '610700', '西乡', '4', '0916', '723500', '中国,陕西省,汉中市,西乡县', 'Xixiang', '107.76867', '32.98411');
INSERT INTO `tb_region` VALUES ('610725', '勉县', '610700', '勉县', '4', '0916', '724200', '中国,陕西省,汉中市,勉县', 'Mianxian', '106.67584', '33.15273');
INSERT INTO `tb_region` VALUES ('610726', '宁强县', '610700', '宁强', '4', '0916', '724400', '中国,陕西省,汉中市,宁强县', 'Ningqiang', '106.25958', '32.82881');
INSERT INTO `tb_region` VALUES ('610727', '略阳县', '610700', '略阳', '4', '0916', '724300', '中国,陕西省,汉中市,略阳县', 'Lueyang', '106.15399', '33.33009');
INSERT INTO `tb_region` VALUES ('610728', '镇巴县', '610700', '镇巴', '4', '0916', '723600', '中国,陕西省,汉中市,镇巴县', 'Zhenba', '107.89648', '32.53487');
INSERT INTO `tb_region` VALUES ('610729', '留坝县', '610700', '留坝', '4', '0916', '724100', '中国,陕西省,汉中市,留坝县', 'Liuba', '106.92233', '33.61606');
INSERT INTO `tb_region` VALUES ('610730', '佛坪县', '610700', '佛坪', '4', '0916', '723400', '中国,陕西省,汉中市,佛坪县', 'Foping', '107.98974', '33.52496');
INSERT INTO `tb_region` VALUES ('610800', '榆林市', '610000', '榆林', '3', '0912', '719000', '中国,陕西省,榆林市', 'Yulin', '109.741193', '38.290162');
INSERT INTO `tb_region` VALUES ('610802', '榆阳区', '610800', '榆阳', '4', '0912', '719000', '中国,陕西省,榆林市,榆阳区', 'Yuyang', '109.73473', '38.27843');
INSERT INTO `tb_region` VALUES ('610821', '神木县', '610800', '神木', '4', '0912', '719300', '中国,陕西省,榆林市,神木县', 'Shenmu', '110.4989', '38.84234');
INSERT INTO `tb_region` VALUES ('610822', '府谷县', '610800', '府谷', '4', '0912', '719400', '中国,陕西省,榆林市,府谷县', 'Fugu', '111.06723', '39.02805');
INSERT INTO `tb_region` VALUES ('610823', '横山县', '610800', '横山', '4', '0912', '719100', '中国,陕西省,榆林市,横山县', 'Hengshan', '109.29568', '37.958');
INSERT INTO `tb_region` VALUES ('610824', '靖边县', '610800', '靖边', '4', '0912', '718500', '中国,陕西省,榆林市,靖边县', 'Jingbian', '108.79412', '37.59938');
INSERT INTO `tb_region` VALUES ('610825', '定边县', '610800', '定边', '4', '0912', '718600', '中国,陕西省,榆林市,定边县', 'Dingbian', '107.59793', '37.59037');
INSERT INTO `tb_region` VALUES ('610826', '绥德县', '610800', '绥德', '4', '0912', '718000', '中国,陕西省,榆林市,绥德县', 'Suide', '110.26126', '37.49778');
INSERT INTO `tb_region` VALUES ('610827', '米脂县', '610800', '米脂', '4', '0912', '718100', '中国,陕西省,榆林市,米脂县', 'Mizhi', '110.18417', '37.75529');
INSERT INTO `tb_region` VALUES ('610828', '佳县', '610800', '佳县', '4', '0912', '719200', '中国,陕西省,榆林市,佳县', 'Jiaxian', '110.49362', '38.02248');
INSERT INTO `tb_region` VALUES ('610829', '吴堡县', '610800', '吴堡', '4', '0912', '718200', '中国,陕西省,榆林市,吴堡县', 'Wubu', '110.74533', '37.45709');
INSERT INTO `tb_region` VALUES ('610830', '清涧县', '610800', '清涧', '4', '0912', '718300', '中国,陕西省,榆林市,清涧县', 'Qingjian', '110.12173', '37.08854');
INSERT INTO `tb_region` VALUES ('610831', '子洲县', '610800', '子洲', '4', '0912', '718400', '中国,陕西省,榆林市,子洲县', 'Zizhou', '110.03488', '37.61238');
INSERT INTO `tb_region` VALUES ('610900', '安康市', '610000', '安康', '3', '0915', '725000', '中国,陕西省,安康市', 'Ankang', '109.029273', '32.6903');
INSERT INTO `tb_region` VALUES ('610902', '汉滨区', '610900', '汉滨', '4', '0915', '725000', '中国,陕西省,安康市,汉滨区', 'Hanbin', '109.02683', '32.69517');
INSERT INTO `tb_region` VALUES ('610921', '汉阴县', '610900', '汉阴', '4', '0915', '725100', '中国,陕西省,安康市,汉阴县', 'Hanyin', '108.51098', '32.89129');
INSERT INTO `tb_region` VALUES ('610922', '石泉县', '610900', '石泉', '4', '0915', '725200', '中国,陕西省,安康市,石泉县', 'Shiquan', '108.24755', '33.03971');
INSERT INTO `tb_region` VALUES ('610923', '宁陕县', '610900', '宁陕', '4', '0915', '711600', '中国,陕西省,安康市,宁陕县', 'Ningshan', '108.31515', '33.31726');
INSERT INTO `tb_region` VALUES ('610924', '紫阳县', '610900', '紫阳', '4', '0915', '725300', '中国,陕西省,安康市,紫阳县', 'Ziyang', '108.5368', '32.52115');
INSERT INTO `tb_region` VALUES ('610925', '岚皋县', '610900', '岚皋', '4', '0915', '725400', '中国,陕西省,安康市,岚皋县', 'Langao', '108.90289', '32.30794');
INSERT INTO `tb_region` VALUES ('610926', '平利县', '610900', '平利', '4', '0915', '725500', '中国,陕西省,安康市,平利县', 'Pingli', '109.35775', '32.39111');
INSERT INTO `tb_region` VALUES ('610927', '镇坪县', '610900', '镇坪', '4', '0915', '725600', '中国,陕西省,安康市,镇坪县', 'Zhenping', '109.52456', '31.8833');
INSERT INTO `tb_region` VALUES ('610928', '旬阳县', '610900', '旬阳', '4', '0915', '725700', '中国,陕西省,安康市,旬阳县', 'Xunyang', '109.3619', '32.83207');
INSERT INTO `tb_region` VALUES ('610929', '白河县', '610900', '白河', '4', '0915', '725800', '中国,陕西省,安康市,白河县', 'Baihe', '110.11315', '32.80955');
INSERT INTO `tb_region` VALUES ('611000', '商洛市', '610000', '商洛', '3', '0914', '726000', '中国,陕西省,商洛市', 'Shangluo', '109.939776', '33.868319');
INSERT INTO `tb_region` VALUES ('611002', '商州区', '611000', '商州', '4', '0914', '726000', '中国,陕西省,商洛市,商州区', 'Shangzhou', '109.94126', '33.8627');
INSERT INTO `tb_region` VALUES ('611021', '洛南县', '611000', '洛南', '4', '0914', '726100', '中国,陕西省,商洛市,洛南县', 'Luonan', '110.14645', '34.08994');
INSERT INTO `tb_region` VALUES ('611022', '丹凤县', '611000', '丹凤', '4', '0914', '726200', '中国,陕西省,商洛市,丹凤县', 'Danfeng', '110.33486', '33.69468');
INSERT INTO `tb_region` VALUES ('611023', '商南县', '611000', '商南', '4', '0914', '726300', '中国,陕西省,商洛市,商南县', 'Shangnan', '110.88375', '33.52581');
INSERT INTO `tb_region` VALUES ('611024', '山阳县', '611000', '山阳', '4', '0914', '726400', '中国,陕西省,商洛市,山阳县', 'Shanyang', '109.88784', '33.52931');
INSERT INTO `tb_region` VALUES ('611025', '镇安县', '611000', '镇安', '4', '0914', '711500', '中国,陕西省,商洛市,镇安县', 'Zhen\'an', '109.15374', '33.42366');
INSERT INTO `tb_region` VALUES ('611026', '柞水县', '611000', '柞水', '4', '0914', '711400', '中国,陕西省,商洛市,柞水县', 'Zhashui', '109.11105', '33.6831');
INSERT INTO `tb_region` VALUES ('611100', '西咸新区', '610000', '西咸', '3', '029', '712000', '中国,陕西省,西咸新区', 'Xixian', '108.810654', '34.307144');
INSERT INTO `tb_region` VALUES ('611101', '空港新城', '611100', '空港', '4', '0374', '461000', '中国,陕西省,西咸新区,空港新城', 'Konggang', '108.760529', '34.440894');
INSERT INTO `tb_region` VALUES ('611102', '沣东新城', '611100', '沣东', '4', '029', '710000', '中国,陕西省,西咸新区,沣东新城', 'Fengdong', '108.82988', '34.267431');
INSERT INTO `tb_region` VALUES ('611103', '秦汉新城', '611100', '秦汉', '4', '029', '712000', '中国,陕西省,西咸新区,秦汉新城', 'Qinhan', '108.83812', '34.386513');
INSERT INTO `tb_region` VALUES ('611104', '沣西新城', '611100', '沣西', '4', '029', '710000', '中国,陕西省,西咸新区,沣西新城', 'Fengxi', '108.71215', '34.190453');
INSERT INTO `tb_region` VALUES ('611105', '泾河新城', '611100', '泾河', '4', '029', '713700', '中国,陕西省,西咸新区,泾河新城', 'Jinghe', '109.049603', '34.460587');
INSERT INTO `tb_region` VALUES ('620000', '甘肃省', '100005', '甘肃', '2', '', '', '中国,甘肃省', 'Gansu', '103.823557', '36.058039');
INSERT INTO `tb_region` VALUES ('620100', '兰州市', '620000', '兰州', '3', '0931', '730030', '中国,甘肃省,兰州市', 'Lanzhou', '103.823557', '36.058039');
INSERT INTO `tb_region` VALUES ('620102', '城关区', '620100', '城关', '4', '0931', '730030', '中国,甘肃省,兰州市,城关区', 'Chengguan', '103.8252', '36.05725');
INSERT INTO `tb_region` VALUES ('620103', '七里河区', '620100', '七里河', '4', '0931', '730050', '中国,甘肃省,兰州市,七里河区', 'Qilihe', '103.78564', '36.06585');
INSERT INTO `tb_region` VALUES ('620104', '西固区', '620100', '西固', '4', '0931', '730060', '中国,甘肃省,兰州市,西固区', 'Xigu', '103.62811', '36.08858');
INSERT INTO `tb_region` VALUES ('620105', '安宁区', '620100', '安宁', '4', '0931', '730070', '中国,甘肃省,兰州市,安宁区', 'Anning', '103.7189', '36.10384');
INSERT INTO `tb_region` VALUES ('620111', '红古区', '620100', '红古', '4', '0931', '730084', '中国,甘肃省,兰州市,红古区', 'Honggu', '102.85955', '36.34537');
INSERT INTO `tb_region` VALUES ('620121', '永登县', '620100', '永登', '4', '0931', '730300', '中国,甘肃省,兰州市,永登县', 'Yongdeng', '103.26055', '36.73522');
INSERT INTO `tb_region` VALUES ('620122', '皋兰县', '620100', '皋兰', '4', '0931', '730200', '中国,甘肃省,兰州市,皋兰县', 'Gaolan', '103.94506', '36.33215');
INSERT INTO `tb_region` VALUES ('620123', '榆中县', '620100', '榆中', '4', '0931', '730100', '中国,甘肃省,兰州市,榆中县', 'Yuzhong', '104.1145', '35.84415');
INSERT INTO `tb_region` VALUES ('620200', '嘉峪关市', '620000', '嘉峪关', '3', '0937', '735100', '中国,甘肃省,嘉峪关市', 'Jiayuguan', '98.277304', '39.786529');
INSERT INTO `tb_region` VALUES ('620201', '雄关区', '620200', '雄关', '4', '0937', '735100', '中国,甘肃省,嘉峪关市,雄关区', 'Xiongguan', '98.277398', '39.77925');
INSERT INTO `tb_region` VALUES ('620202', '长城区', '620200', '长城', '4', '0937', '735106', '中国,甘肃省,嘉峪关市,长城区', 'Changcheng', '98.273523', '39.787431');
INSERT INTO `tb_region` VALUES ('620203', '镜铁区', '620200', '镜铁', '4', '0937', '735100', '中国,甘肃省,嘉峪关市,镜铁区', 'Jingtie', '98.277304', '39.786529');
INSERT INTO `tb_region` VALUES ('620300', '金昌市', '620000', '金昌', '3', '0935', '737100', '中国,甘肃省,金昌市', 'Jinchang', '102.187888', '38.514238');
INSERT INTO `tb_region` VALUES ('620302', '金川区', '620300', '金川', '4', '0935', '737100', '中国,甘肃省,金昌市,金川区', 'Jinchuan', '102.19376', '38.52101');
INSERT INTO `tb_region` VALUES ('620321', '永昌县', '620300', '永昌', '4', '0935', '737200', '中国,甘肃省,金昌市,永昌县', 'Yongchang', '101.97222', '38.24711');
INSERT INTO `tb_region` VALUES ('620400', '白银市', '620000', '白银', '3', '0943', '730900', '中国,甘肃省,白银市', 'Baiyin', '104.173606', '36.54568');
INSERT INTO `tb_region` VALUES ('620402', '白银区', '620400', '白银', '4', '0943', '730900', '中国,甘肃省,白银市,白银区', 'Baiyin', '104.17355', '36.54411');
INSERT INTO `tb_region` VALUES ('620403', '平川区', '620400', '平川', '4', '0943', '730913', '中国,甘肃省,白银市,平川区', 'Pingchuan', '104.82498', '36.7277');
INSERT INTO `tb_region` VALUES ('620421', '靖远县', '620400', '靖远', '4', '0943', '730600', '中国,甘肃省,白银市,靖远县', 'Jingyuan', '104.68325', '36.56602');
INSERT INTO `tb_region` VALUES ('620422', '会宁县', '620400', '会宁', '4', '0943', '730700', '中国,甘肃省,白银市,会宁县', 'Huining', '105.05297', '35.69626');
INSERT INTO `tb_region` VALUES ('620423', '景泰县', '620400', '景泰', '4', '0943', '730400', '中国,甘肃省,白银市,景泰县', 'Jingtai', '104.06295', '37.18359');
INSERT INTO `tb_region` VALUES ('620500', '天水市', '620000', '天水', '3', '0938', '741000', '中国,甘肃省,天水市', 'Tianshui', '105.724998', '34.578529');
INSERT INTO `tb_region` VALUES ('620502', '秦州区', '620500', '秦州', '4', '0938', '741000', '中国,甘肃省,天水市,秦州区', 'Qinzhou', '105.72421', '34.58089');
INSERT INTO `tb_region` VALUES ('620503', '麦积区', '620500', '麦积', '4', '0938', '741020', '中国,甘肃省,天水市,麦积区', 'Maiji', '105.89013', '34.57069');
INSERT INTO `tb_region` VALUES ('620521', '清水县', '620500', '清水', '4', '0938', '741400', '中国,甘肃省,天水市,清水县', 'Qingshui', '106.13671', '34.75032');
INSERT INTO `tb_region` VALUES ('620522', '秦安县', '620500', '秦安', '4', '0938', '741600', '中国,甘肃省,天水市,秦安县', 'Qin\'an', '105.66955', '34.85894');
INSERT INTO `tb_region` VALUES ('620523', '甘谷县', '620500', '甘谷', '4', '0938', '741200', '中国,甘肃省,天水市,甘谷县', 'Gangu', '105.33291', '34.73665');
INSERT INTO `tb_region` VALUES ('620524', '武山县', '620500', '武山', '4', '0938', '741300', '中国,甘肃省,天水市,武山县', 'Wushan', '104.88382', '34.72123');
INSERT INTO `tb_region` VALUES ('620525', '张家川回族自治县', '620500', '张家川', '4', '0938', '741500', '中国,甘肃省,天水市,张家川回族自治县', 'Zhangjiachuan', '106.21582', '34.99582');
INSERT INTO `tb_region` VALUES ('620600', '武威市', '620000', '武威', '3', '0935', '733000', '中国,甘肃省,武威市', 'Wuwei', '102.634697', '37.929996');
INSERT INTO `tb_region` VALUES ('620602', '凉州区', '620600', '凉州', '4', '0935', '733000', '中国,甘肃省,武威市,凉州区', 'Liangzhou', '102.64203', '37.92832');
INSERT INTO `tb_region` VALUES ('620621', '民勤县', '620600', '民勤', '4', '0935', '733300', '中国,甘肃省,武威市,民勤县', 'Minqin', '103.09011', '38.62487');
INSERT INTO `tb_region` VALUES ('620622', '古浪县', '620600', '古浪', '4', '0935', '733100', '中国,甘肃省,武威市,古浪县', 'Gulang', '102.89154', '37.46508');
INSERT INTO `tb_region` VALUES ('620623', '天祝藏族自治县', '620600', '天祝', '4', '0935', '733200', '中国,甘肃省,武威市,天祝藏族自治县', 'Tianzhu', '103.1361', '36.97715');
INSERT INTO `tb_region` VALUES ('620700', '张掖市', '620000', '张掖', '3', '0936', '734000', '中国,甘肃省,张掖市', 'Zhangye', '100.455472', '38.932897');
INSERT INTO `tb_region` VALUES ('620702', '甘州区', '620700', '甘州', '4', '0936', '734000', '中国,甘肃省,张掖市,甘州区', 'Ganzhou', '100.4527', '38.92947');
INSERT INTO `tb_region` VALUES ('620721', '肃南裕固族自治县', '620700', '肃南', '4', '0936', '734400', '中国,甘肃省,张掖市,肃南裕固族自治县', 'Sunan', '99.61407', '38.83776');
INSERT INTO `tb_region` VALUES ('620722', '民乐县', '620700', '民乐', '4', '0936', '734500', '中国,甘肃省,张掖市,民乐县', 'Minle', '100.81091', '38.43479');
INSERT INTO `tb_region` VALUES ('620723', '临泽县', '620700', '临泽', '4', '0936', '734200', '中国,甘肃省,张掖市,临泽县', 'Linze', '100.16445', '39.15252');
INSERT INTO `tb_region` VALUES ('620724', '高台县', '620700', '高台', '4', '0936', '734300', '中国,甘肃省,张掖市,高台县', 'Gaotai', '99.81918', '39.37829');
INSERT INTO `tb_region` VALUES ('620725', '山丹县', '620700', '山丹', '4', '0936', '734100', '中国,甘肃省,张掖市,山丹县', 'Shandan', '101.09359', '38.78468');
INSERT INTO `tb_region` VALUES ('620800', '平凉市', '620000', '平凉', '3', '0933', '744000', '中国,甘肃省,平凉市', 'Pingliang', '106.684691', '35.54279');
INSERT INTO `tb_region` VALUES ('620802', '崆峒区', '620800', '崆峒', '4', '0933', '744000', '中国,甘肃省,平凉市,崆峒区', 'Kongtong', '106.67483', '35.54262');
INSERT INTO `tb_region` VALUES ('620821', '泾川县', '620800', '泾川', '4', '0933', '744300', '中国,甘肃省,平凉市,泾川县', 'Jingchuan', '107.36581', '35.33223');
INSERT INTO `tb_region` VALUES ('620822', '灵台县', '620800', '灵台', '4', '0933', '744400', '中国,甘肃省,平凉市,灵台县', 'Lingtai', '107.6174', '35.06768');
INSERT INTO `tb_region` VALUES ('620823', '崇信县', '620800', '崇信', '4', '0933', '744200', '中国,甘肃省,平凉市,崇信县', 'Chongxin', '107.03738', '35.30344');
INSERT INTO `tb_region` VALUES ('620824', '华亭县', '620800', '华亭', '4', '0933', '744100', '中国,甘肃省,平凉市,华亭县', 'Huating', '106.65463', '35.2183');
INSERT INTO `tb_region` VALUES ('620825', '庄浪县', '620800', '庄浪', '4', '0933', '744600', '中国,甘肃省,平凉市,庄浪县', 'Zhuanglang', '106.03662', '35.20235');
INSERT INTO `tb_region` VALUES ('620826', '静宁县', '620800', '静宁', '4', '0933', '743400', '中国,甘肃省,平凉市,静宁县', 'Jingning', '105.72723', '35.51991');
INSERT INTO `tb_region` VALUES ('620900', '酒泉市', '620000', '酒泉', '3', '0937', '735000', '中国,甘肃省,酒泉市', 'Jiuquan', '98.510795', '39.744023');
INSERT INTO `tb_region` VALUES ('620902', '肃州区', '620900', '肃州', '4', '0937', '735000', '中国,甘肃省,酒泉市,肃州区', 'Suzhou', '98.50775', '39.74506');
INSERT INTO `tb_region` VALUES ('620921', '金塔县', '620900', '金塔', '4', '0937', '735300', '中国,甘肃省,酒泉市,金塔县', 'Jinta', '98.90002', '39.97733');
INSERT INTO `tb_region` VALUES ('620922', '瓜州县', '620900', '瓜州', '4', '0937', '736100', '中国,甘肃省,酒泉市,瓜州县', 'Guazhou', '95.78271', '40.51548');
INSERT INTO `tb_region` VALUES ('620923', '肃北蒙古族自治县', '620900', '肃北', '4', '0937', '736300', '中国,甘肃省,酒泉市,肃北蒙古族自治县', 'Subei', '94.87649', '39.51214');
INSERT INTO `tb_region` VALUES ('620924', '阿克塞哈萨克族自治县', '620900', '阿克塞', '4', '0937', '736400', '中国,甘肃省,酒泉市,阿克塞哈萨克族自治县', 'Akesai', '94.34097', '39.63435');
INSERT INTO `tb_region` VALUES ('620981', '玉门市', '620900', '玉门', '4', '0937', '735200', '中国,甘肃省,酒泉市,玉门市', 'Yumen', '97.04538', '40.29172');
INSERT INTO `tb_region` VALUES ('620982', '敦煌市', '620900', '敦煌', '4', '0937', '736200', '中国,甘肃省,酒泉市,敦煌市', 'Dunhuang', '94.66159', '40.14211');
INSERT INTO `tb_region` VALUES ('621000', '庆阳市', '620000', '庆阳', '3', '0934', '745000', '中国,甘肃省,庆阳市', 'Qingyang', '107.638372', '35.734218');
INSERT INTO `tb_region` VALUES ('621002', '西峰区', '621000', '西峰', '4', '0934', '745000', '中国,甘肃省,庆阳市,西峰区', 'Xifeng', '107.65107', '35.73065');
INSERT INTO `tb_region` VALUES ('621021', '庆城县', '621000', '庆城', '4', '0934', '745100', '中国,甘肃省,庆阳市,庆城县', 'Qingcheng', '107.88272', '36.01507');
INSERT INTO `tb_region` VALUES ('621022', '环县', '621000', '环县', '4', '0934', '745700', '中国,甘肃省,庆阳市,环县', 'Huanxian', '107.30835', '36.56846');
INSERT INTO `tb_region` VALUES ('621023', '华池县', '621000', '华池', '4', '0934', '745600', '中国,甘肃省,庆阳市,华池县', 'Huachi', '107.9891', '36.46108');
INSERT INTO `tb_region` VALUES ('621024', '合水县', '621000', '合水', '4', '0934', '745400', '中国,甘肃省,庆阳市,合水县', 'Heshui', '108.02032', '35.81911');
INSERT INTO `tb_region` VALUES ('621025', '正宁县', '621000', '正宁', '4', '0934', '745300', '中国,甘肃省,庆阳市,正宁县', 'Zhengning', '108.36007', '35.49174');
INSERT INTO `tb_region` VALUES ('621026', '宁县', '621000', '宁县', '4', '0934', '745200', '中国,甘肃省,庆阳市,宁县', 'Ningxian', '107.92517', '35.50164');
INSERT INTO `tb_region` VALUES ('621027', '镇原县', '621000', '镇原', '4', '0934', '744500', '中国,甘肃省,庆阳市,镇原县', 'Zhenyuan', '107.199', '35.67712');
INSERT INTO `tb_region` VALUES ('621100', '定西市', '620000', '定西', '3', '0932', '743000', '中国,甘肃省,定西市', 'Dingxi', '104.626294', '35.579578');
INSERT INTO `tb_region` VALUES ('621102', '安定区', '621100', '安定', '4', '0932', '743000', '中国,甘肃省,定西市,安定区', 'Anding', '104.6106', '35.58066');
INSERT INTO `tb_region` VALUES ('621121', '通渭县', '621100', '通渭', '4', '0932', '743300', '中国,甘肃省,定西市,通渭县', 'Tongwei', '105.24224', '35.21101');
INSERT INTO `tb_region` VALUES ('621122', '陇西县', '621100', '陇西', '4', '0932', '748100', '中国,甘肃省,定西市,陇西县', 'Longxi', '104.63446', '35.00238');
INSERT INTO `tb_region` VALUES ('621123', '渭源县', '621100', '渭源', '4', '0932', '748200', '中国,甘肃省,定西市,渭源县', 'Weiyuan', '104.21435', '35.13649');
INSERT INTO `tb_region` VALUES ('621124', '临洮县', '621100', '临洮', '4', '0932', '730500', '中国,甘肃省,定西市,临洮县', 'Lintao', '103.86196', '35.3751');
INSERT INTO `tb_region` VALUES ('621125', '漳县', '621100', '漳县', '4', '0932', '748300', '中国,甘肃省,定西市,漳县', 'Zhangxian', '104.46704', '34.84977');
INSERT INTO `tb_region` VALUES ('621126', '岷县', '621100', '岷县', '4', '0932', '748400', '中国,甘肃省,定西市,岷县', 'Minxian', '104.03772', '34.43444');
INSERT INTO `tb_region` VALUES ('621200', '陇南市', '620000', '陇南', '3', '0939', '746000', '中国,甘肃省,陇南市', 'Longnan', '104.929379', '33.388598');
INSERT INTO `tb_region` VALUES ('621202', '武都区', '621200', '武都', '4', '0939', '746000', '中国,甘肃省,陇南市,武都区', 'Wudu', '104.92652', '33.39239');
INSERT INTO `tb_region` VALUES ('621221', '成县', '621200', '成县', '4', '0939', '742500', '中国,甘肃省,陇南市,成县', 'Chengxian', '105.72586', '33.73925');
INSERT INTO `tb_region` VALUES ('621222', '文县', '621200', '文县', '4', '0939', '746400', '中国,甘肃省,陇南市,文县', 'Wenxian', '104.68362', '32.94337');
INSERT INTO `tb_region` VALUES ('621223', '宕昌县', '621200', '宕昌', '4', '0939', '748500', '中国,甘肃省,陇南市,宕昌县', 'Dangchang', '104.39349', '34.04732');
INSERT INTO `tb_region` VALUES ('621224', '康县', '621200', '康县', '4', '0939', '746500', '中国,甘肃省,陇南市,康县', 'Kangxian', '105.60711', '33.32912');
INSERT INTO `tb_region` VALUES ('621225', '西和县', '621200', '西和', '4', '0939', '742100', '中国,甘肃省,陇南市,西和县', 'Xihe', '105.30099', '34.01432');
INSERT INTO `tb_region` VALUES ('621226', '礼县', '621200', '礼县', '4', '0939', '742200', '中国,甘肃省,陇南市,礼县', 'Lixian', '105.17785', '34.18935');
INSERT INTO `tb_region` VALUES ('621227', '徽县', '621200', '徽县', '4', '0939', '742300', '中国,甘肃省,陇南市,徽县', 'Huixian', '106.08529', '33.76898');
INSERT INTO `tb_region` VALUES ('621228', '两当县', '621200', '两当', '4', '0939', '742400', '中国,甘肃省,陇南市,两当县', 'Liangdang', '106.30484', '33.9096');
INSERT INTO `tb_region` VALUES ('622900', '临夏回族自治州', '620000', '临夏', '3', '0930', '731100', '中国,甘肃省,临夏回族自治州', 'Linxia', '103.212006', '35.599446');
INSERT INTO `tb_region` VALUES ('622901', '临夏市', '622900', '临夏', '4', '0930', '731100', '中国,甘肃省,临夏回族自治州,临夏市', 'Linxia', '103.21', '35.59916');
INSERT INTO `tb_region` VALUES ('622921', '临夏县', '622900', '临夏', '4', '0930', '731800', '中国,甘肃省,临夏回族自治州,临夏县', 'Linxia', '102.9938', '35.49519');
INSERT INTO `tb_region` VALUES ('622922', '康乐县', '622900', '康乐', '4', '0930', '731500', '中国,甘肃省,临夏回族自治州,康乐县', 'Kangle', '103.71093', '35.37219');
INSERT INTO `tb_region` VALUES ('622923', '永靖县', '622900', '永靖', '4', '0930', '731600', '中国,甘肃省,临夏回族自治州,永靖县', 'Yongjing', '103.32043', '35.93835');
INSERT INTO `tb_region` VALUES ('622924', '广河县', '622900', '广河', '4', '0930', '731300', '中国,甘肃省,临夏回族自治州,广河县', 'Guanghe', '103.56933', '35.48097');
INSERT INTO `tb_region` VALUES ('622925', '和政县', '622900', '和政', '4', '0930', '731200', '中国,甘肃省,临夏回族自治州,和政县', 'Hezheng', '103.34936', '35.42592');
INSERT INTO `tb_region` VALUES ('622926', '东乡族自治县', '622900', '东乡族', '4', '0930', '731400', '中国,甘肃省,临夏回族自治州,东乡族自治县', 'Dongxiangzu', '103.39477', '35.66471');
INSERT INTO `tb_region` VALUES ('622927', '积石山保安族东乡族撒拉族自治县', '622900', '积石山', '4', '0930', '731700', '中国,甘肃省,临夏回族自治州,积石山保安族东乡族撒拉族自治县', 'Jishishan', '102.87374', '35.7182');
INSERT INTO `tb_region` VALUES ('623000', '甘南藏族自治州', '620000', '甘南', '3', '0941', '747000', '中国,甘肃省,甘南藏族自治州', 'Gannan', '102.911008', '34.986354');
INSERT INTO `tb_region` VALUES ('623001', '合作市', '623000', '合作', '4', '0941', '747000', '中国,甘肃省,甘南藏族自治州,合作市', 'Hezuo', '102.91082', '35.00016');
INSERT INTO `tb_region` VALUES ('623021', '临潭县', '623000', '临潭', '4', '0941', '747500', '中国,甘肃省,甘南藏族自治州,临潭县', 'Lintan', '103.35287', '34.69515');
INSERT INTO `tb_region` VALUES ('623022', '卓尼县', '623000', '卓尼', '4', '0941', '747600', '中国,甘肃省,甘南藏族自治州,卓尼县', 'Zhuoni', '103.50811', '34.58919');
INSERT INTO `tb_region` VALUES ('623023', '舟曲县', '623000', '舟曲', '4', '0941', '746300', '中国,甘肃省,甘南藏族自治州,舟曲县', 'Zhouqu', '104.37155', '33.78468');
INSERT INTO `tb_region` VALUES ('623024', '迭部县', '623000', '迭部', '4', '0941', '747400', '中国,甘肃省,甘南藏族自治州,迭部县', 'Diebu', '103.22274', '34.05623');
INSERT INTO `tb_region` VALUES ('623025', '玛曲县', '623000', '玛曲', '4', '0941', '747300', '中国,甘肃省,甘南藏族自治州,玛曲县', 'Maqu', '102.0754', '33.997');
INSERT INTO `tb_region` VALUES ('623026', '碌曲县', '623000', '碌曲', '4', '0941', '747200', '中国,甘肃省,甘南藏族自治州,碌曲县', 'Luqu', '102.49176', '34.58872');
INSERT INTO `tb_region` VALUES ('623027', '夏河县', '623000', '夏河', '4', '0941', '747100', '中国,甘肃省,甘南藏族自治州,夏河县', 'Xiahe', '102.52215', '35.20487');
INSERT INTO `tb_region` VALUES ('630000', '青海省', '100005', '青海', '2', '', '', '中国,青海省', 'Qinghai', '101.778916', '36.623178');
INSERT INTO `tb_region` VALUES ('630100', '西宁市', '630000', '西宁', '3', '0971', '810000', '中国,青海省,西宁市', 'Xining', '101.778916', '36.623178');
INSERT INTO `tb_region` VALUES ('630102', '城东区', '630100', '城东', '4', '0971', '810007', '中国,青海省,西宁市,城东区', 'Chengdong', '101.80373', '36.59969');
INSERT INTO `tb_region` VALUES ('630103', '城中区', '630100', '城中', '4', '0971', '810000', '中国,青海省,西宁市,城中区', 'Chengzhong', '101.78394', '36.62279');
INSERT INTO `tb_region` VALUES ('630104', '城西区', '630100', '城西', '4', '0971', '810001', '中国,青海省,西宁市,城西区', 'Chengxi', '101.76588', '36.62828');
INSERT INTO `tb_region` VALUES ('630105', '城北区', '630100', '城北', '4', '0971', '810003', '中国,青海省,西宁市,城北区', 'Chengbei', '101.7662', '36.65014');
INSERT INTO `tb_region` VALUES ('630121', '大通回族土族自治县', '630100', '大通', '4', '0971', '810100', '中国,青海省,西宁市,大通回族土族自治县', 'Datong', '101.70236', '36.93489');
INSERT INTO `tb_region` VALUES ('630122', '湟中县', '630100', '湟中', '4', '0971', '811600', '中国,青海省,西宁市,湟中县', 'Huangzhong', '101.57159', '36.50083');
INSERT INTO `tb_region` VALUES ('630123', '湟源县', '630100', '湟源', '4', '0971', '812100', '中国,青海省,西宁市,湟源县', 'Huangyuan', '101.25643', '36.68243');
INSERT INTO `tb_region` VALUES ('630200', '海东市', '630000', '海东', '3', '0972', '810700', '中国,青海省,海东市', 'Haidong', '102.10327', '36.502916');
INSERT INTO `tb_region` VALUES ('630202', '乐都区', '630200', '乐都', '4', '0972', '810700', '中国,青海省,海东市,乐都区', 'Ledu', '102.402431', '36.480291');
INSERT INTO `tb_region` VALUES ('630221', '平安县', '630200', '平安', '4', '0972', '810600', '中国,青海省,海东市,平安县', 'Ping\'an', '102.104295', '36.502714');
INSERT INTO `tb_region` VALUES ('630222', '民和回族土族自治县', '630200', '民和', '4', '0972', '810800', '中国,青海省,海东市,民和回族土族自治县', 'Minhe', '102.804209', '36.329451');
INSERT INTO `tb_region` VALUES ('630223', '互助土族自治县', '630200', '互助', '4', '0972', '810500', '中国,青海省,海东市,互助土族自治县', 'Huzhu', '101.956734', '36.83994');
INSERT INTO `tb_region` VALUES ('630224', '化隆回族自治县', '630200', '化隆', '4', '0972', '810900', '中国,青海省,海东市,化隆回族自治县', 'Hualong', '102.262329', '36.098322');
INSERT INTO `tb_region` VALUES ('630225', '循化撒拉族自治县', '630200', '循化', '4', '0972', '811100', '中国,青海省,海东市,循化撒拉族自治县', 'Xunhua', '102.486534', '35.847247');
INSERT INTO `tb_region` VALUES ('632200', '海北藏族自治州', '630000', '海北', '3', '0970', '812200', '中国,青海省,海北藏族自治州', 'Haibei', '100.901059', '36.959435');
INSERT INTO `tb_region` VALUES ('632221', '门源回族自治县', '632200', '门源', '4', '0970', '810300', '中国,青海省,海北藏族自治州,门源回族自治县', 'Menyuan', '101.62228', '37.37611');
INSERT INTO `tb_region` VALUES ('632222', '祁连县', '632200', '祁连', '4', '0970', '810400', '中国,青海省,海北藏族自治州,祁连县', 'Qilian', '100.24618', '38.17901');
INSERT INTO `tb_region` VALUES ('632223', '海晏县', '632200', '海晏', '4', '0970', '812200', '中国,青海省,海北藏族自治州,海晏县', 'Haiyan', '100.9927', '36.89902');
INSERT INTO `tb_region` VALUES ('632224', '刚察县', '632200', '刚察', '4', '0970', '812300', '中国,青海省,海北藏族自治州,刚察县', 'Gangcha', '100.14675', '37.32161');
INSERT INTO `tb_region` VALUES ('632300', '黄南藏族自治州', '630000', '黄南', '3', '0973', '811300', '中国,青海省,黄南藏族自治州', 'Huangnan', '102.019988', '35.517744');
INSERT INTO `tb_region` VALUES ('632321', '同仁县', '632300', '同仁', '4', '0973', '811300', '中国,青海省,黄南藏族自治州,同仁县', 'Tongren', '102.0184', '35.51603');
INSERT INTO `tb_region` VALUES ('632322', '尖扎县', '632300', '尖扎', '4', '0973', '811200', '中国,青海省,黄南藏族自治州,尖扎县', 'Jianzha', '102.03411', '35.93947');
INSERT INTO `tb_region` VALUES ('632323', '泽库县', '632300', '泽库', '4', '0973', '811400', '中国,青海省,黄南藏族自治州,泽库县', 'Zeku', '101.46444', '35.03519');
INSERT INTO `tb_region` VALUES ('632324', '河南蒙古族自治县', '632300', '河南', '4', '0973', '811500', '中国,青海省,黄南藏族自治州,河南蒙古族自治县', 'Henan', '101.60864', '34.73476');
INSERT INTO `tb_region` VALUES ('632500', '海南藏族自治州', '630000', '海南', '3', '0974', '813000', '中国,青海省,海南藏族自治州', 'Hainan', '100.619542', '36.280353');
INSERT INTO `tb_region` VALUES ('632521', '共和县', '632500', '共和', '4', '0974', '813000', '中国,青海省,海南藏族自治州,共和县', 'Gonghe', '100.62003', '36.2841');
INSERT INTO `tb_region` VALUES ('632522', '同德县', '632500', '同德', '4', '0974', '813200', '中国,青海省,海南藏族自治州,同德县', 'Tongde', '100.57159', '35.25488');
INSERT INTO `tb_region` VALUES ('632523', '贵德县', '632500', '贵德', '4', '0974', '811700', '中国,青海省,海南藏族自治州,贵德县', 'Guide', '101.432', '36.044');
INSERT INTO `tb_region` VALUES ('632524', '兴海县', '632500', '兴海', '4', '0974', '813300', '中国,青海省,海南藏族自治州,兴海县', 'Xinghai', '99.98846', '35.59031');
INSERT INTO `tb_region` VALUES ('632525', '贵南县', '632500', '贵南', '4', '0974', '813100', '中国,青海省,海南藏族自治州,贵南县', 'Guinan', '100.74716', '35.58667');
INSERT INTO `tb_region` VALUES ('632600', '果洛藏族自治州', '630000', '果洛', '3', '0975', '814000', '中国,青海省,果洛藏族自治州', 'Golog', '100.242143', '34.4736');
INSERT INTO `tb_region` VALUES ('632621', '玛沁县', '632600', '玛沁', '4', '0975', '814000', '中国,青海省,果洛藏族自治州,玛沁县', 'Maqin', '100.23901', '34.47746');
INSERT INTO `tb_region` VALUES ('632622', '班玛县', '632600', '班玛', '4', '0975', '814300', '中国,青海省,果洛藏族自治州,班玛县', 'Banma', '100.73745', '32.93253');
INSERT INTO `tb_region` VALUES ('632623', '甘德县', '632600', '甘德', '4', '0975', '814100', '中国,青海省,果洛藏族自治州,甘德县', 'Gande', '99.90246', '33.96838');
INSERT INTO `tb_region` VALUES ('632624', '达日县', '632600', '达日', '4', '0975', '814200', '中国,青海省,果洛藏族自治州,达日县', 'Dari', '99.65179', '33.75193');
INSERT INTO `tb_region` VALUES ('632625', '久治县', '632600', '久治', '4', '0975', '624700', '中国,青海省,果洛藏族自治州,久治县', 'Jiuzhi', '101.48342', '33.42989');
INSERT INTO `tb_region` VALUES ('632626', '玛多县', '632600', '玛多', '4', '0975', '813500', '中国,青海省,果洛藏族自治州,玛多县', 'Maduo', '98.20996', '34.91567');
INSERT INTO `tb_region` VALUES ('632700', '玉树藏族自治州', '630000', '玉树', '3', '0976', '815000', '中国,青海省,玉树藏族自治州', 'Yushu', '97.008522', '33.004049');
INSERT INTO `tb_region` VALUES ('632701', '玉树市', '632700', '玉树', '4', '0976', '815000', '中国,青海省,玉树藏族自治州,玉树市', 'Yushu', '97.008762', '33.00393');
INSERT INTO `tb_region` VALUES ('632722', '杂多县', '632700', '杂多', '4', '0976', '815300', '中国,青海省,玉树藏族自治州,杂多县', 'Zaduo', '95.29864', '32.89318');
INSERT INTO `tb_region` VALUES ('632723', '称多县', '632700', '称多', '4', '0976', '815100', '中国,青海省,玉树藏族自治州,称多县', 'Chenduo', '97.10788', '33.36899');
INSERT INTO `tb_region` VALUES ('632724', '治多县', '632700', '治多', '4', '0976', '815400', '中国,青海省,玉树藏族自治州,治多县', 'Zhiduo', '95.61572', '33.8528');
INSERT INTO `tb_region` VALUES ('632725', '囊谦县', '632700', '囊谦', '4', '0976', '815200', '中国,青海省,玉树藏族自治州,囊谦县', 'Nangqian', '96.47753', '32.20359');
INSERT INTO `tb_region` VALUES ('632726', '曲麻莱县', '632700', '曲麻莱', '4', '0976', '815500', '中国,青海省,玉树藏族自治州,曲麻莱县', 'Qumalai', '95.79757', '34.12609');
INSERT INTO `tb_region` VALUES ('632800', '海西蒙古族藏族自治州', '630000', '海西', '3', '0977', '817000', '中国,青海省,海西蒙古族藏族自治州', 'Haixi', '97.370785', '37.374663');
INSERT INTO `tb_region` VALUES ('632801', '格尔木市', '632800', '格尔木', '4', '0977', '816000', '中国,青海省,海西蒙古族藏族自治州,格尔木市', 'Geermu', '94.90329', '36.40236');
INSERT INTO `tb_region` VALUES ('632802', '德令哈市', '632800', '德令哈', '4', '0977', '817000', '中国,青海省,海西蒙古族藏族自治州,德令哈市', 'Delingha', '97.36084', '37.36946');
INSERT INTO `tb_region` VALUES ('632821', '乌兰县', '632800', '乌兰', '4', '0977', '817100', '中国,青海省,海西蒙古族藏族自治州,乌兰县', 'Wulan', '98.48196', '36.93471');
INSERT INTO `tb_region` VALUES ('632822', '都兰县', '632800', '都兰', '4', '0977', '816100', '中国,青海省,海西蒙古族藏族自治州,都兰县', 'Dulan', '98.09228', '36.30135');
INSERT INTO `tb_region` VALUES ('632823', '天峻县', '632800', '天峻', '4', '0977', '817200', '中国,青海省,海西蒙古族藏族自治州,天峻县', 'Tianjun', '99.02453', '37.30326');
INSERT INTO `tb_region` VALUES ('640000', '宁夏回族自治区', '100005', '宁夏', '2', '', '', '中国,宁夏回族自治区', 'Ningxia', '106.278179', '38.46637');
INSERT INTO `tb_region` VALUES ('640100', '银川市', '640000', '银川', '3', '0951', '750004', '中国,宁夏回族自治区,银川市', 'Yinchuan', '106.278179', '38.46637');
INSERT INTO `tb_region` VALUES ('640104', '兴庆区', '640100', '兴庆', '4', '0951', '750001', '中国,宁夏回族自治区,银川市,兴庆区', 'Xingqing', '106.28872', '38.47392');
INSERT INTO `tb_region` VALUES ('640105', '西夏区', '640100', '西夏', '4', '0951', '750021', '中国,宁夏回族自治区,银川市,西夏区', 'Xixia', '106.15023', '38.49137');
INSERT INTO `tb_region` VALUES ('640106', '金凤区', '640100', '金凤', '4', '0951', '750011', '中国,宁夏回族自治区,银川市,金凤区', 'Jinfeng', '106.24261', '38.47294');
INSERT INTO `tb_region` VALUES ('640121', '永宁县', '640100', '永宁', '4', '0951', '750100', '中国,宁夏回族自治区,银川市,永宁县', 'Yongning', '106.2517', '38.27559');
INSERT INTO `tb_region` VALUES ('640122', '贺兰县', '640100', '贺兰', '4', '0951', '750200', '中国,宁夏回族自治区,银川市,贺兰县', 'Helan', '106.34982', '38.5544');
INSERT INTO `tb_region` VALUES ('640181', '灵武市', '640100', '灵武', '4', '0951', '750004', '中国,宁夏回族自治区,银川市,灵武市', 'Lingwu', '106.33999', '38.10266');
INSERT INTO `tb_region` VALUES ('640200', '石嘴山市', '640000', '石嘴山', '3', '0952', '753000', '中国,宁夏回族自治区,石嘴山市', 'Shizuishan', '106.376173', '39.01333');
INSERT INTO `tb_region` VALUES ('640202', '大武口区', '640200', '大武口', '4', '0952', '753000', '中国,宁夏回族自治区,石嘴山市,大武口区', 'Dawukou', '106.37717', '39.01226');
INSERT INTO `tb_region` VALUES ('640205', '惠农区', '640200', '惠农', '4', '0952', '753600', '中国,宁夏回族自治区,石嘴山市,惠农区', 'Huinong', '106.71145', '39.13193');
INSERT INTO `tb_region` VALUES ('640221', '平罗县', '640200', '平罗', '4', '0952', '753400', '中国,宁夏回族自治区,石嘴山市,平罗县', 'Pingluo', '106.54538', '38.90429');
INSERT INTO `tb_region` VALUES ('640300', '吴忠市', '640000', '吴忠', '3', '0953', '751100', '中国,宁夏回族自治区,吴忠市', 'Wuzhong', '106.199409', '37.986165');
INSERT INTO `tb_region` VALUES ('640302', '利通区', '640300', '利通', '4', '0953', '751100', '中国,宁夏回族自治区,吴忠市,利通区', 'Litong', '106.20311', '37.98512');
INSERT INTO `tb_region` VALUES ('640303', '红寺堡区', '640300', '红寺堡', '4', '0953', '751900', '中国,宁夏回族自治区,吴忠市,红寺堡区', 'Hongsibao', '106.19822', '37.99747');
INSERT INTO `tb_region` VALUES ('640323', '盐池县', '640300', '盐池', '4', '0953', '751500', '中国,宁夏回族自治区,吴忠市,盐池县', 'Yanchi', '107.40707', '37.7833');
INSERT INTO `tb_region` VALUES ('640324', '同心县', '640300', '同心', '4', '0953', '751300', '中国,宁夏回族自治区,吴忠市,同心县', 'Tongxin', '105.91418', '36.98116');
INSERT INTO `tb_region` VALUES ('640381', '青铜峡市', '640300', '青铜峡', '4', '0953', '751600', '中国,宁夏回族自治区,吴忠市,青铜峡市', 'Qingtongxia', '106.07489', '38.02004');
INSERT INTO `tb_region` VALUES ('640400', '固原市', '640000', '固原', '3', '0954', '756000', '中国,宁夏回族自治区,固原市', 'Guyuan', '106.285241', '36.004561');
INSERT INTO `tb_region` VALUES ('640402', '原州区', '640400', '原州', '4', '0954', '756000', '中国,宁夏回族自治区,固原市,原州区', 'Yuanzhou', '106.28778', '36.00374');
INSERT INTO `tb_region` VALUES ('640422', '西吉县', '640400', '西吉', '4', '0954', '756200', '中国,宁夏回族自治区,固原市,西吉县', 'Xiji', '105.73107', '35.96616');
INSERT INTO `tb_region` VALUES ('640423', '隆德县', '640400', '隆德', '4', '0954', '756300', '中国,宁夏回族自治区,固原市,隆德县', 'Longde', '106.12426', '35.61718');
INSERT INTO `tb_region` VALUES ('640424', '泾源县', '640400', '泾源', '4', '0954', '756400', '中国,宁夏回族自治区,固原市,泾源县', 'Jingyuan', '106.33902', '35.49072');
INSERT INTO `tb_region` VALUES ('640425', '彭阳县', '640400', '彭阳', '4', '0954', '756500', '中国,宁夏回族自治区,固原市,彭阳县', 'Pengyang', '106.64462', '35.85076');
INSERT INTO `tb_region` VALUES ('640500', '中卫市', '640000', '中卫', '3', '0955', '751700', '中国,宁夏回族自治区,中卫市', 'Zhongwei', '105.189568', '37.514951');
INSERT INTO `tb_region` VALUES ('640502', '沙坡头区', '640500', '沙坡头', '4', '0955', '755000', '中国,宁夏回族自治区,中卫市,沙坡头区', 'Shapotou', '105.18962', '37.51044');
INSERT INTO `tb_region` VALUES ('640521', '中宁县', '640500', '中宁', '4', '0955', '751200', '中国,宁夏回族自治区,中卫市,中宁县', 'Zhongning', '105.68515', '37.49149');
INSERT INTO `tb_region` VALUES ('640522', '海原县', '640500', '海原', '4', '0955', '751800', '中国,宁夏回族自治区,中卫市,海原县', 'Haiyuan', '105.64712', '36.56498');
INSERT INTO `tb_region` VALUES ('650000', '新疆维吾尔自治区', '100005', '新疆', '2', '', '', '中国,新疆维吾尔自治区', 'Xinjiang', '87.617733', '43.792818');
INSERT INTO `tb_region` VALUES ('650100', '乌鲁木齐市', '650000', '乌鲁木齐', '3', '0991', '830002', '中国,新疆维吾尔自治区,乌鲁木齐市', 'Urumqi', '87.617733', '43.792818');
INSERT INTO `tb_region` VALUES ('650102', '天山区', '650100', '天山', '4', '0991', '830002', '中国,新疆维吾尔自治区,乌鲁木齐市,天山区', 'Tianshan', '87.63167', '43.79439');
INSERT INTO `tb_region` VALUES ('650103', '沙依巴克区', '650100', '沙依巴克', '4', '0991', '830000', '中国,新疆维吾尔自治区,乌鲁木齐市,沙依巴克区', 'Shayibake', '87.59788', '43.80118');
INSERT INTO `tb_region` VALUES ('650104', '新市区', '650100', '新市', '4', '0991', '830011', '中国,新疆维吾尔自治区,乌鲁木齐市,新市区', 'Xinshi', '87.57406', '43.84348');
INSERT INTO `tb_region` VALUES ('650105', '水磨沟区', '650100', '水磨沟', '4', '0991', '830017', '中国,新疆维吾尔自治区,乌鲁木齐市,水磨沟区', 'Shuimogou', '87.64249', '43.83247');
INSERT INTO `tb_region` VALUES ('650106', '头屯河区', '650100', '头屯河', '4', '0991', '830022', '中国,新疆维吾尔自治区,乌鲁木齐市,头屯河区', 'Toutunhe', '87.29138', '43.85487');
INSERT INTO `tb_region` VALUES ('650107', '达坂城区', '650100', '达坂城', '4', '0991', '830039', '中国,新疆维吾尔自治区,乌鲁木齐市,达坂城区', 'Dabancheng', '88.30697', '43.35797');
INSERT INTO `tb_region` VALUES ('650109', '米东区', '650100', '米东', '4', '0991', '830019', '中国,新疆维吾尔自治区,乌鲁木齐市,米东区', 'Midong', '87.68583', '43.94739');
INSERT INTO `tb_region` VALUES ('650121', '乌鲁木齐县', '650100', '乌鲁木齐', '4', '0991', '830063', '中国,新疆维吾尔自治区,乌鲁木齐市,乌鲁木齐县', 'Wulumuqi', '87.40939', '43.47125');
INSERT INTO `tb_region` VALUES ('650200', '克拉玛依市', '650000', '克拉玛依', '3', '0990', '834000', '中国,新疆维吾尔自治区,克拉玛依市', 'Karamay', '84.873946', '45.595886');
INSERT INTO `tb_region` VALUES ('650202', '独山子区', '650200', '独山子', '4', '0992', '834021', '中国,新疆维吾尔自治区,克拉玛依市,独山子区', 'Dushanzi', '84.88671', '44.32867');
INSERT INTO `tb_region` VALUES ('650203', '克拉玛依区', '650200', '克拉玛依', '4', '0990', '834000', '中国,新疆维吾尔自治区,克拉玛依市,克拉玛依区', 'Kelamayi', '84.86225', '45.59089');
INSERT INTO `tb_region` VALUES ('650204', '白碱滩区', '650200', '白碱滩', '4', '0990', '834008', '中国,新疆维吾尔自治区,克拉玛依市,白碱滩区', 'Baijiantan', '85.13244', '45.68768');
INSERT INTO `tb_region` VALUES ('650205', '乌尔禾区', '650200', '乌尔禾', '4', '0990', '834012', '中国,新疆维吾尔自治区,克拉玛依市,乌尔禾区', 'Wuerhe', '85.69143', '46.09006');
INSERT INTO `tb_region` VALUES ('652100', '吐鲁番地区', '650000', '吐鲁番', '3', '0995', '838000', '中国,新疆维吾尔自治区,吐鲁番地区', 'Turpan', '89.184078', '42.947613');
INSERT INTO `tb_region` VALUES ('652101', '吐鲁番市', '652100', '吐鲁番', '4', '0995', '838000', '中国,新疆维吾尔自治区,吐鲁番地区,吐鲁番市', 'Tulufan', '89.18579', '42.93505');
INSERT INTO `tb_region` VALUES ('652122', '鄯善县', '652100', '鄯善', '4', '0995', '838200', '中国,新疆维吾尔自治区,吐鲁番地区,鄯善县', 'Shanshan', '90.21402', '42.8635');
INSERT INTO `tb_region` VALUES ('652123', '托克逊县', '652100', '托克逊', '4', '0995', '838100', '中国,新疆维吾尔自治区,吐鲁番地区,托克逊县', 'Tuokexun', '88.65823', '42.79231');
INSERT INTO `tb_region` VALUES ('652200', '哈密地区', '650000', '哈密', '3', '0902', '839000', '中国,新疆维吾尔自治区,哈密地区', 'Hami', '93.51316', '42.833248');
INSERT INTO `tb_region` VALUES ('652201', '哈密市', '652200', '哈密', '4', '0902', '839000', '中国,新疆维吾尔自治区,哈密地区,哈密市', 'Hami', '93.51452', '42.82699');
INSERT INTO `tb_region` VALUES ('652222', '巴里坤哈萨克自治县', '652200', '巴里坤', '4', '0902', '839200', '中国,新疆维吾尔自治区,哈密地区,巴里坤哈萨克自治县', 'Balikun', '93.01236', '43.59993');
INSERT INTO `tb_region` VALUES ('652223', '伊吾县', '652200', '伊吾', '4', '0902', '839300', '中国,新疆维吾尔自治区,哈密地区,伊吾县', 'Yiwu', '94.69403', '43.2537');
INSERT INTO `tb_region` VALUES ('652300', '昌吉回族自治州', '650000', '昌吉', '3', '0994', '831100', '中国,新疆维吾尔自治区,昌吉回族自治州', 'Changji', '87.304012', '44.014577');
INSERT INTO `tb_region` VALUES ('652301', '昌吉市', '652300', '昌吉', '4', '0994', '831100', '中国,新疆维吾尔自治区,昌吉回族自治州,昌吉市', 'Changji', '87.30249', '44.01267');
INSERT INTO `tb_region` VALUES ('652302', '阜康市', '652300', '阜康', '4', '0994', '831500', '中国,新疆维吾尔自治区,昌吉回族自治州,阜康市', 'Fukang', '87.98529', '44.1584');
INSERT INTO `tb_region` VALUES ('652323', '呼图壁县', '652300', '呼图壁', '4', '0994', '831200', '中国,新疆维吾尔自治区,昌吉回族自治州,呼图壁县', 'Hutubi', '86.89892', '44.18977');
INSERT INTO `tb_region` VALUES ('652324', '玛纳斯县', '652300', '玛纳斯', '4', '0994', '832200', '中国,新疆维吾尔自治区,昌吉回族自治州,玛纳斯县', 'Manasi', '86.2145', '44.30438');
INSERT INTO `tb_region` VALUES ('652325', '奇台县', '652300', '奇台', '4', '0994', '831800', '中国,新疆维吾尔自治区,昌吉回族自治州,奇台县', 'Qitai', '89.5932', '44.02221');
INSERT INTO `tb_region` VALUES ('652327', '吉木萨尔县', '652300', '吉木萨尔', '4', '0994', '831700', '中国,新疆维吾尔自治区,昌吉回族自治州,吉木萨尔县', 'Jimusaer', '89.18078', '44.00048');
INSERT INTO `tb_region` VALUES ('652328', '木垒哈萨克自治县', '652300', '木垒', '4', '0994', '831900', '中国,新疆维吾尔自治区,昌吉回族自治州,木垒哈萨克自治县', 'Mulei', '90.28897', '43.83508');
INSERT INTO `tb_region` VALUES ('652700', '博尔塔拉蒙古自治州', '650000', '博尔塔拉', '3', '0909', '833400', '中国,新疆维吾尔自治区,博尔塔拉蒙古自治州', 'Bortala', '82.074778', '44.903258');
INSERT INTO `tb_region` VALUES ('652701', '博乐市', '652700', '博乐', '4', '0909', '833400', '中国,新疆维吾尔自治区,博尔塔拉蒙古自治州,博乐市', 'Bole', '82.0713', '44.90052');
INSERT INTO `tb_region` VALUES ('652702', '阿拉山口市', '652700', '阿拉山口', '4', '0909', '833400', '中国,新疆维吾尔自治区,博尔塔拉蒙古自治州,阿拉山口市', 'Alashankou', '82.567721', '45.170616');
INSERT INTO `tb_region` VALUES ('652722', '精河县', '652700', '精河', '4', '0909', '833300', '中国,新疆维吾尔自治区,博尔塔拉蒙古自治州,精河县', 'Jinghe', '82.89419', '44.60774');
INSERT INTO `tb_region` VALUES ('652723', '温泉县', '652700', '温泉', '4', '0909', '833500', '中国,新疆维吾尔自治区,博尔塔拉蒙古自治州,温泉县', 'Wenquan', '81.03134', '44.97373');
INSERT INTO `tb_region` VALUES ('652800', '巴音郭楞蒙古自治州', '650000', '巴音郭楞', '3', '0996', '841000', '中国,新疆维吾尔自治区,巴音郭楞蒙古自治州', 'Bayingol', '86.150969', '41.768552');
INSERT INTO `tb_region` VALUES ('652801', '库尔勒市', '652800', '库尔勒', '4', '0996', '841000', '中国,新疆维吾尔自治区,巴音郭楞蒙古自治州,库尔勒市', 'Kuerle', '86.15528', '41.76602');
INSERT INTO `tb_region` VALUES ('652822', '轮台县', '652800', '轮台', '4', '0996', '841600', '中国,新疆维吾尔自治区,巴音郭楞蒙古自治州,轮台县', 'Luntai', '84.26101', '41.77642');
INSERT INTO `tb_region` VALUES ('652823', '尉犁县', '652800', '尉犁', '4', '0996', '841500', '中国,新疆维吾尔自治区,巴音郭楞蒙古自治州,尉犁县', 'Yuli', '86.25903', '41.33632');
INSERT INTO `tb_region` VALUES ('652824', '若羌县', '652800', '若羌', '4', '0996', '841800', '中国,新疆维吾尔自治区,巴音郭楞蒙古自治州,若羌县', 'Ruoqiang', '88.16812', '39.0179');
INSERT INTO `tb_region` VALUES ('652825', '且末县', '652800', '且末', '4', '0996', '841900', '中国,新疆维吾尔自治区,巴音郭楞蒙古自治州,且末县', 'Qiemo', '85.52975', '38.14534');
INSERT INTO `tb_region` VALUES ('652826', '焉耆回族自治县', '652800', '焉耆', '4', '0996', '841100', '中国,新疆维吾尔自治区,巴音郭楞蒙古自治州,焉耆回族自治县', 'Yanqi', '86.5744', '42.059');
INSERT INTO `tb_region` VALUES ('652827', '和静县', '652800', '和静', '4', '0996', '841300', '中国,新疆维吾尔自治区,巴音郭楞蒙古自治州,和静县', 'Hejing', '86.39611', '42.31838');
INSERT INTO `tb_region` VALUES ('652828', '和硕县', '652800', '和硕', '4', '0996', '841200', '中国,新疆维吾尔自治区,巴音郭楞蒙古自治州,和硕县', 'Heshuo', '86.86392', '42.26814');
INSERT INTO `tb_region` VALUES ('652829', '博湖县', '652800', '博湖', '4', '0996', '841400', '中国,新疆维吾尔自治区,巴音郭楞蒙古自治州,博湖县', 'Bohu', '86.63333', '41.98014');
INSERT INTO `tb_region` VALUES ('652900', '阿克苏地区', '650000', '阿克苏', '3', '0997', '843000', '中国,新疆维吾尔自治区,阿克苏地区', 'Aksu', '80.265068', '41.170712');
INSERT INTO `tb_region` VALUES ('652901', '阿克苏市', '652900', '阿克苏', '4', '0997', '843000', '中国,新疆维吾尔自治区,阿克苏地区,阿克苏市', 'Akesu', '80.26338', '41.16754');
INSERT INTO `tb_region` VALUES ('652922', '温宿县', '652900', '温宿', '4', '0997', '843100', '中国,新疆维吾尔自治区,阿克苏地区,温宿县', 'Wensu', '80.24173', '41.27679');
INSERT INTO `tb_region` VALUES ('652923', '库车县', '652900', '库车', '4', '0997', '842000', '中国,新疆维吾尔自治区,阿克苏地区,库车县', 'Kuche', '82.96209', '41.71793');
INSERT INTO `tb_region` VALUES ('652924', '沙雅县', '652900', '沙雅', '4', '0997', '842200', '中国,新疆维吾尔自治区,阿克苏地区,沙雅县', 'Shaya', '82.78131', '41.22497');
INSERT INTO `tb_region` VALUES ('652925', '新和县', '652900', '新和', '4', '0997', '842100', '中国,新疆维吾尔自治区,阿克苏地区,新和县', 'Xinhe', '82.61053', '41.54964');
INSERT INTO `tb_region` VALUES ('652926', '拜城县', '652900', '拜城', '4', '0997', '842300', '中国,新疆维吾尔自治区,阿克苏地区,拜城县', 'Baicheng', '81.87564', '41.79801');
INSERT INTO `tb_region` VALUES ('652927', '乌什县', '652900', '乌什', '4', '0997', '843400', '中国,新疆维吾尔自治区,阿克苏地区,乌什县', 'Wushi', '79.22937', '41.21569');
INSERT INTO `tb_region` VALUES ('652928', '阿瓦提县', '652900', '阿瓦提', '4', '0997', '843200', '中国,新疆维吾尔自治区,阿克苏地区,阿瓦提县', 'Awati', '80.38336', '40.63926');
INSERT INTO `tb_region` VALUES ('652929', '柯坪县', '652900', '柯坪', '4', '0997', '843600', '中国,新疆维吾尔自治区,阿克苏地区,柯坪县', 'Keping', '79.04751', '40.50585');
INSERT INTO `tb_region` VALUES ('653000', '克孜勒苏柯尔克孜自治州', '650000', '克孜勒苏', '3', '0908', '845350', '中国,新疆维吾尔自治区,克孜勒苏柯尔克孜自治州', 'Kizilsu', '76.172825', '39.713431');
INSERT INTO `tb_region` VALUES ('653001', '阿图什市', '653000', '阿图什', '4', '0908', '845350', '中国,新疆维吾尔自治区,克孜勒苏柯尔克孜自治州,阿图什市', 'Atushi', '76.16827', '39.71615');
INSERT INTO `tb_region` VALUES ('653022', '阿克陶县', '653000', '阿克陶', '4', '0908', '845550', '中国,新疆维吾尔自治区,克孜勒苏柯尔克孜自治州,阿克陶县', 'Aketao', '75.94692', '39.14892');
INSERT INTO `tb_region` VALUES ('653023', '阿合奇县', '653000', '阿合奇', '4', '0997', '843500', '中国,新疆维吾尔自治区,克孜勒苏柯尔克孜自治州,阿合奇县', 'Aheqi', '78.44848', '40.93947');
INSERT INTO `tb_region` VALUES ('653024', '乌恰县', '653000', '乌恰', '4', '0908', '845450', '中国,新疆维吾尔自治区,克孜勒苏柯尔克孜自治州,乌恰县', 'Wuqia', '75.25839', '39.71984');
INSERT INTO `tb_region` VALUES ('653100', '喀什地区', '650000', '喀什', '3', '0998', '844000', '中国,新疆维吾尔自治区,喀什地区', 'Kashgar', '75.989138', '39.467664');
INSERT INTO `tb_region` VALUES ('653101', '喀什市', '653100', '喀什', '4', '0998', '844000', '中国,新疆维吾尔自治区,喀什地区,喀什市', 'Kashi', '75.99379', '39.46768');
INSERT INTO `tb_region` VALUES ('653121', '疏附县', '653100', '疏附', '4', '0998', '844100', '中国,新疆维吾尔自治区,喀什地区,疏附县', 'Shufu', '75.86029', '39.37534');
INSERT INTO `tb_region` VALUES ('653122', '疏勒县', '653100', '疏勒', '4', '0998', '844200', '中国,新疆维吾尔自治区,喀什地区,疏勒县', 'Shule', '76.05398', '39.40625');
INSERT INTO `tb_region` VALUES ('653123', '英吉沙县', '653100', '英吉沙', '4', '0998', '844500', '中国,新疆维吾尔自治区,喀什地区,英吉沙县', 'Yingjisha', '76.17565', '38.92968');
INSERT INTO `tb_region` VALUES ('653124', '泽普县', '653100', '泽普', '4', '0998', '844800', '中国,新疆维吾尔自治区,喀什地区,泽普县', 'Zepu', '77.27145', '38.18935');
INSERT INTO `tb_region` VALUES ('653125', '莎车县', '653100', '莎车', '4', '0998', '844700', '中国,新疆维吾尔自治区,喀什地区,莎车县', 'Shache', '77.24316', '38.41601');
INSERT INTO `tb_region` VALUES ('653126', '叶城县', '653100', '叶城', '4', '0998', '844900', '中国,新疆维吾尔自治区,喀什地区,叶城县', 'Yecheng', '77.41659', '37.88324');
INSERT INTO `tb_region` VALUES ('653127', '麦盖提县', '653100', '麦盖提', '4', '0998', '844600', '中国,新疆维吾尔自治区,喀什地区,麦盖提县', 'Maigaiti', '77.64224', '38.89662');
INSERT INTO `tb_region` VALUES ('653128', '岳普湖县', '653100', '岳普湖', '4', '0998', '844400', '中国,新疆维吾尔自治区,喀什地区,岳普湖县', 'Yuepuhu', '76.77233', '39.23561');
INSERT INTO `tb_region` VALUES ('653129', '伽师县', '653100', '伽师', '4', '0998', '844300', '中国,新疆维吾尔自治区,喀什地区,伽师县', 'Jiashi', '76.72372', '39.48801');
INSERT INTO `tb_region` VALUES ('653130', '巴楚县', '653100', '巴楚', '4', '0998', '843800', '中国,新疆维吾尔自治区,喀什地区,巴楚县', 'Bachu', '78.54888', '39.7855');
INSERT INTO `tb_region` VALUES ('653131', '塔什库尔干塔吉克自治县', '653100', '塔什库尔干塔吉克', '4', '0998', '845250', '中国,新疆维吾尔自治区,喀什地区,塔什库尔干塔吉克自治县', 'Tashikuergantajike', '75.23196', '37.77893');
INSERT INTO `tb_region` VALUES ('653200', '和田地区', '650000', '和田', '3', '0903', '848000', '中国,新疆维吾尔自治区,和田地区', 'Hotan', '79.92533', '37.110687');
INSERT INTO `tb_region` VALUES ('653201', '和田市', '653200', '和田市', '4', '0903', '848000', '中国,新疆维吾尔自治区,和田地区,和田市', 'Hetianshi', '79.91353', '37.11214');
INSERT INTO `tb_region` VALUES ('653221', '和田县', '653200', '和田县', '4', '0903', '848000', '中国,新疆维吾尔自治区,和田地区,和田县', 'Hetianxian', '79.82874', '37.08922');
INSERT INTO `tb_region` VALUES ('653222', '墨玉县', '653200', '墨玉', '4', '0903', '848100', '中国,新疆维吾尔自治区,和田地区,墨玉县', 'Moyu', '79.74035', '37.27248');
INSERT INTO `tb_region` VALUES ('653223', '皮山县', '653200', '皮山', '4', '0903', '845150', '中国,新疆维吾尔自治区,和田地区,皮山县', 'Pishan', '78.28125', '37.62007');
INSERT INTO `tb_region` VALUES ('653224', '洛浦县', '653200', '洛浦', '4', '0903', '848200', '中国,新疆维吾尔自治区,和田地区,洛浦县', 'Luopu', '80.18536', '37.07364');
INSERT INTO `tb_region` VALUES ('653225', '策勒县', '653200', '策勒', '4', '0903', '848300', '中国,新疆维吾尔自治区,和田地区,策勒县', 'Cele', '80.80999', '36.99843');
INSERT INTO `tb_region` VALUES ('653226', '于田县', '653200', '于田', '4', '0903', '848400', '中国,新疆维吾尔自治区,和田地区,于田县', 'Yutian', '81.66717', '36.854');
INSERT INTO `tb_region` VALUES ('653227', '民丰县', '653200', '民丰', '4', '0903', '848500', '中国,新疆维吾尔自治区,和田地区,民丰县', 'Minfeng', '82.68444', '37.06577');
INSERT INTO `tb_region` VALUES ('654000', '伊犁哈萨克自治州', '650000', '伊犁', '3', '0999', '835100', '中国,新疆维吾尔自治区,伊犁哈萨克自治州', 'Ili', '81.317946', '43.92186');
INSERT INTO `tb_region` VALUES ('654002', '伊宁市', '654000', '伊宁', '4', '0999', '835000', '中国,新疆维吾尔自治区,伊犁哈萨克自治州,伊宁市', 'Yining', '81.32932', '43.91294');
INSERT INTO `tb_region` VALUES ('654003', '奎屯市', '654000', '奎屯', '4', '0992', '833200', '中国,新疆维吾尔自治区,伊犁哈萨克自治州,奎屯市', 'Kuitun', '84.90228', '44.425');
INSERT INTO `tb_region` VALUES ('654004', '霍尔果斯市', '654000', '霍尔果斯', '4', '0999', '835221', '中国,新疆维吾尔自治区,伊犁哈萨克自治州,霍尔果斯市', 'Huoerguosi', '80.418189', '44.205778');
INSERT INTO `tb_region` VALUES ('654021', '伊宁县', '654000', '伊宁', '4', '0999', '835100', '中国,新疆维吾尔自治区,伊犁哈萨克自治州,伊宁县', 'Yining', '81.52764', '43.97863');
INSERT INTO `tb_region` VALUES ('654022', '察布查尔锡伯自治县', '654000', '察布查尔锡伯', '4', '0999', '835300', '中国,新疆维吾尔自治区,伊犁哈萨克自治州,察布查尔锡伯自治县', 'Chabuchaerxibo', '81.14956', '43.84023');
INSERT INTO `tb_region` VALUES ('654023', '霍城县', '654000', '霍城', '4', '0999', '835200', '中国,新疆维吾尔自治区,伊犁哈萨克自治州,霍城县', 'Huocheng', '80.87826', '44.0533');
INSERT INTO `tb_region` VALUES ('654024', '巩留县', '654000', '巩留', '4', '0999', '835400', '中国,新疆维吾尔自治区,伊犁哈萨克自治州,巩留县', 'Gongliu', '82.22851', '43.48429');
INSERT INTO `tb_region` VALUES ('654025', '新源县', '654000', '新源', '4', '0999', '835800', '中国,新疆维吾尔自治区,伊犁哈萨克自治州,新源县', 'Xinyuan', '83.26095', '43.4284');
INSERT INTO `tb_region` VALUES ('654026', '昭苏县', '654000', '昭苏', '4', '0999', '835600', '中国,新疆维吾尔自治区,伊犁哈萨克自治州,昭苏县', 'Zhaosu', '81.1307', '43.15828');
INSERT INTO `tb_region` VALUES ('654027', '特克斯县', '654000', '特克斯', '4', '0999', '835500', '中国,新疆维吾尔自治区,伊犁哈萨克自治州,特克斯县', 'Tekesi', '81.84005', '43.21938');
INSERT INTO `tb_region` VALUES ('654028', '尼勒克县', '654000', '尼勒克', '4', '0999', '835700', '中国,新疆维吾尔自治区,伊犁哈萨克自治州,尼勒克县', 'Nileke', '82.51184', '43.79901');
INSERT INTO `tb_region` VALUES ('654200', '塔城地区', '650000', '塔城', '3', '0901', '834700', '中国,新疆维吾尔自治区,塔城地区', 'Qoqek', '82.985732', '46.746301');
INSERT INTO `tb_region` VALUES ('654201', '塔城市', '654200', '塔城', '4', '0901', '834700', '中国,新疆维吾尔自治区,塔城地区,塔城市', 'Tacheng', '82.97892', '46.74852');
INSERT INTO `tb_region` VALUES ('654202', '乌苏市', '654200', '乌苏', '4', '0992', '833000', '中国,新疆维吾尔自治区,塔城地区,乌苏市', 'Wusu', '84.68258', '44.43729');
INSERT INTO `tb_region` VALUES ('654221', '额敏县', '654200', '额敏', '4', '0901', '834600', '中国,新疆维吾尔自治区,塔城地区,额敏县', 'Emin', '83.62872', '46.5284');
INSERT INTO `tb_region` VALUES ('654223', '沙湾县', '654200', '沙湾', '4', '0993', '832100', '中国,新疆维吾尔自治区,塔城地区,沙湾县', 'Shawan', '85.61932', '44.33144');
INSERT INTO `tb_region` VALUES ('654224', '托里县', '654200', '托里', '4', '0901', '834500', '中国,新疆维吾尔自治区,塔城地区,托里县', 'Tuoli', '83.60592', '45.93623');
INSERT INTO `tb_region` VALUES ('654225', '裕民县', '654200', '裕民', '4', '0901', '834800', '中国,新疆维吾尔自治区,塔城地区,裕民县', 'Yumin', '82.99002', '46.20377');
INSERT INTO `tb_region` VALUES ('654226', '和布克赛尔蒙古自治县', '654200', '和布克赛尔', '4', '0990', '834400', '中国,新疆维吾尔自治区,塔城地区,和布克赛尔蒙古自治县', 'Hebukesaier', '85.72662', '46.79362');
INSERT INTO `tb_region` VALUES ('654300', '阿勒泰地区', '650000', '阿勒泰', '3', '0906', '836500', '中国,新疆维吾尔自治区,阿勒泰地区', 'Altay', '88.13963', '47.848393');
INSERT INTO `tb_region` VALUES ('654301', '阿勒泰市', '654300', '阿勒泰', '4', '0906', '836500', '中国,新疆维吾尔自治区,阿勒泰地区,阿勒泰市', 'Aletai', '88.13913', '47.8317');
INSERT INTO `tb_region` VALUES ('654321', '布尔津县', '654300', '布尔津', '4', '0906', '836600', '中国,新疆维吾尔自治区,阿勒泰地区,布尔津县', 'Buerjin', '86.85751', '47.70062');
INSERT INTO `tb_region` VALUES ('654322', '富蕴县', '654300', '富蕴', '4', '0906', '836100', '中国,新疆维吾尔自治区,阿勒泰地区,富蕴县', 'Fuyun', '89.52679', '46.99444');
INSERT INTO `tb_region` VALUES ('654323', '福海县', '654300', '福海', '4', '0906', '836400', '中国,新疆维吾尔自治区,阿勒泰地区,福海县', 'Fuhai', '87.49508', '47.11065');
INSERT INTO `tb_region` VALUES ('654324', '哈巴河县', '654300', '哈巴河', '4', '0906', '836700', '中国,新疆维吾尔自治区,阿勒泰地区,哈巴河县', 'Habahe', '86.42092', '48.06046');
INSERT INTO `tb_region` VALUES ('654325', '青河县', '654300', '青河', '4', '0906', '836200', '中国,新疆维吾尔自治区,阿勒泰地区,青河县', 'Qinghe', '90.38305', '46.67382');
INSERT INTO `tb_region` VALUES ('654326', '吉木乃县', '654300', '吉木乃', '4', '0906', '836800', '中国,新疆维吾尔自治区,阿勒泰地区,吉木乃县', 'Jimunai', '85.87814', '47.43359');
INSERT INTO `tb_region` VALUES ('659000', '直辖县级', '650000', '', '3', '', '', '中国,新疆维吾尔自治区,直辖县级', '', '91.132212', '29.660361');
INSERT INTO `tb_region` VALUES ('659001', '石河子市', '659000', '石河子', '4', '0993', '832000', '中国,新疆维吾尔自治区,直辖县级,石河子市', 'Shihezi', '86.041075', '44.305886');
INSERT INTO `tb_region` VALUES ('659002', '阿拉尔市', '659000', '阿拉尔', '4', '0997', '843300', '中国,新疆维吾尔自治区,直辖县级,阿拉尔市', 'Aral', '81.285884', '40.541914');
INSERT INTO `tb_region` VALUES ('659003', '图木舒克市', '659000', '图木舒克', '4', '0998', '843806', '中国,新疆维吾尔自治区,直辖县级,图木舒克市', 'Tumxuk', '79.077978', '39.867316');
INSERT INTO `tb_region` VALUES ('659004', '五家渠市', '659000', '五家渠', '4', '0994', '831300', '中国,新疆维吾尔自治区,直辖县级,五家渠市', 'Wujiaqu', '87.526884', '44.167401');
INSERT INTO `tb_region` VALUES ('659005', '北屯市', '659000', '北屯', '4', '0906', '836000', '中国,新疆维吾尔自治区,直辖县级,北屯市', 'Beitun', '87.808456', '47.362308');
INSERT INTO `tb_region` VALUES ('659006', '铁门关市', '659000', '铁门关', '4', '0906', '836000', '中国,新疆维吾尔自治区,直辖县级,铁门关市', 'Tiemenguan', '86.194687', '41.811007');
INSERT INTO `tb_region` VALUES ('659007', '双河市', '659000', '双河', '4', '0909', '833408', '中国,新疆维吾尔自治区,直辖县级,双河市', 'Shuanghe', '91.132212', '29.660361');
INSERT INTO `tb_region` VALUES ('710000', '台湾', '100008', '台湾', '2', '', '', '中国,台湾', 'Taiwan', '121.509062', '25.044332');
INSERT INTO `tb_region` VALUES ('710100', '台北市', '710000', '台北', '3', '02', '1', '中国,台湾,台北市', 'Taipei', '121.565170', '25.037798');
INSERT INTO `tb_region` VALUES ('710101', '松山区', '710100', '松山', '4', '02', '105', '中国,台湾,台北市,松山区', 'Songshan', '121.577206', '25.049698');
INSERT INTO `tb_region` VALUES ('710102', '信义区', '710100', '信义', '4', '02', '110', '中国,台湾,台北市,信义区', 'Xinyi', '121.751381', '25.129407');
INSERT INTO `tb_region` VALUES ('710103', '大安区', '710100', '大安', '4', '02', '106', '中国,台湾,台北市,大安区', 'Da\'an', '121.534648', '25.026406');
INSERT INTO `tb_region` VALUES ('710104', '中山区', '710100', '中山', '4', '02', '104', '中国,台湾,台北市,中山区', 'Zhongshan', '121.533468', '25.064361');
INSERT INTO `tb_region` VALUES ('710105', '中正区', '710100', '中正', '4', '02', '100', '中国,台湾,台北市,中正区', 'Zhongzheng', '121.518267', '25.032361');
INSERT INTO `tb_region` VALUES ('710106', '大同区', '710100', '大同', '4', '02', '103', '中国,台湾,台北市,大同区', 'Datong', '121.515514', '25.065986');
INSERT INTO `tb_region` VALUES ('710107', '万华区', '710100', '万华', '4', '02', '108', '中国,台湾,台北市,万华区', 'Wanhua', '121.499332', '25.031933');
INSERT INTO `tb_region` VALUES ('710108', '文山区', '710100', '文山', '4', '02', '116', '中国,台湾,台北市,文山区', 'Wenshan', '121.570458', '24.989786');
INSERT INTO `tb_region` VALUES ('710109', '南港区', '710100', '南港', '4', '02', '115', '中国,台湾,台北市,南港区', 'Nangang', '121.606858', '25.054656');
INSERT INTO `tb_region` VALUES ('710110', '内湖区', '710100', '内湖', '4', '02', '114', '中国,台湾,台北市,内湖区', 'Nahu', '121.588998', '25.069664');
INSERT INTO `tb_region` VALUES ('710111', '士林区', '710100', '士林', '4', '02', '111', '中国,台湾,台北市,士林区', 'Shilin', '121.519874', '25.092822');
INSERT INTO `tb_region` VALUES ('710112', '北投区', '710100', '北投', '4', '02', '112', '中国,台湾,台北市,北投区', 'Beitou', '121.501379', '25.132419');
INSERT INTO `tb_region` VALUES ('710200', '高雄市', '710000', '高雄', '3', '07', '8', '中国,台湾,高雄市', 'Kaohsiung', '120.311922', '22.620856');
INSERT INTO `tb_region` VALUES ('710201', '盐埕区', '710200', '盐埕', '4', '07', '803', '中国,台湾,高雄市,盐埕区', 'Yancheng', '120.286795', '22.624666');
INSERT INTO `tb_region` VALUES ('710202', '鼓山区', '710200', '鼓山', '4', '07', '804', '中国,台湾,高雄市,鼓山区', 'Gushan', '120.281154', '22.636797');
INSERT INTO `tb_region` VALUES ('710203', '左营区', '710200', '左营', '4', '07', '813', '中国,台湾,高雄市,左营区', 'Zuoying', '120.294958', '22.690124');
INSERT INTO `tb_region` VALUES ('710204', '楠梓区', '710200', '楠梓', '4', '07', '811', '中国,台湾,高雄市,楠梓区', 'Nanzi', '120.326314', '22.728401');
INSERT INTO `tb_region` VALUES ('710205', '三民区', '710200', '三民', '4', '07', '807', '中国,台湾,高雄市,三民区', 'Sanmin', '120.299622', '22.647695');
INSERT INTO `tb_region` VALUES ('710206', '新兴区', '710200', '新兴', '4', '07', '800', '中国,台湾,高雄市,新兴区', 'Xinxing', '120.309535', '22.631147');
INSERT INTO `tb_region` VALUES ('710207', '前金区', '710200', '前金', '4', '07', '801', '中国,台湾,高雄市,前金区', 'Qianjin', '120.294159', '22.627421');
INSERT INTO `tb_region` VALUES ('710208', '苓雅区', '710200', '苓雅', '4', '07', '802', '中国,台湾,高雄市,苓雅区', 'Lingya', '120.312347', '22.621770');
INSERT INTO `tb_region` VALUES ('710209', '前镇区', '710200', '前镇', '4', '07', '806', '中国,台湾,高雄市,前镇区', 'Qianzhen', '120.318583', '22.586425');
INSERT INTO `tb_region` VALUES ('710210', '旗津区', '710200', '旗津', '4', '07', '805', '中国,台湾,高雄市,旗津区', 'Qijin', '120.284429', '22.590565');
INSERT INTO `tb_region` VALUES ('710211', '小港区', '710200', '小港', '4', '07', '812', '中国,台湾,高雄市,小港区', 'Xiaogang', '120.337970', '22.565354');
INSERT INTO `tb_region` VALUES ('710212', '凤山区', '710200', '凤山', '4', '07', '830', '中国,台湾,高雄市,凤山区', 'Fengshan', '120.356892', '22.626945');
INSERT INTO `tb_region` VALUES ('710213', '林园区', '710200', '林园', '4', '07', '832', '中国,台湾,高雄市,林园区', 'Linyuan', '120.395977', '22.501490');
INSERT INTO `tb_region` VALUES ('710214', '大寮区', '710200', '大寮', '4', '07', '831', '中国,台湾,高雄市,大寮区', 'Daliao', '120.395422', '22.605386');
INSERT INTO `tb_region` VALUES ('710215', '大树区', '710200', '大树', '4', '07', '840', '中国,台湾,高雄市,大树区', 'Dashu', '120.433095', '22.693394');
INSERT INTO `tb_region` VALUES ('710216', '大社区', '710200', '大社', '4', '07', '815', '中国,台湾,高雄市,大社区', 'Dashe', '120.346635', '22.729966');
INSERT INTO `tb_region` VALUES ('710217', '仁武区', '710200', '仁武', '4', '07', '814', '中国,台湾,高雄市,仁武区', 'Renwu', '120.347779', '22.701901');
INSERT INTO `tb_region` VALUES ('710218', '鸟松区', '710200', '鸟松', '4', '07', '833', '中国,台湾,高雄市,鸟松区', 'Niaosong', '120.364402', '22.659340');
INSERT INTO `tb_region` VALUES ('710219', '冈山区', '710200', '冈山', '4', '07', '820', '中国,台湾,高雄市,冈山区', 'Gangshan', '120.295820', '22.796762');
INSERT INTO `tb_region` VALUES ('710220', '桥头区', '710200', '桥头', '4', '07', '825', '中国,台湾,高雄市,桥头区', 'Qiaotou', '120.305741', '22.757501');
INSERT INTO `tb_region` VALUES ('710221', '燕巢区', '710200', '燕巢', '4', '07', '824', '中国,台湾,高雄市,燕巢区', 'Yanchao', '120.361956', '22.793370');
INSERT INTO `tb_region` VALUES ('710222', '田寮区', '710200', '田寮', '4', '07', '823', '中国,台湾,高雄市,田寮区', 'Tianliao', '120.359636', '22.869307');
INSERT INTO `tb_region` VALUES ('710223', '阿莲区', '710200', '阿莲', '4', '07', '822', '中国,台湾,高雄市,阿莲区', 'Alian', '120.327036', '22.883703');
INSERT INTO `tb_region` VALUES ('710224', '路竹区', '710200', '路竹', '4', '07', '821', '中国,台湾,高雄市,路竹区', 'Luzhu', '120.261828', '22.856851');
INSERT INTO `tb_region` VALUES ('710225', '湖内区', '710200', '湖内', '4', '07', '829', '中国,台湾,高雄市,湖内区', 'Huna', '120.211530', '22.908188');
INSERT INTO `tb_region` VALUES ('710226', '茄萣区', '710200', '茄萣', '4', '07', '852', '中国,台湾,高雄市,茄萣区', 'Qieding', '120.182815', '22.906556');
INSERT INTO `tb_region` VALUES ('710227', '永安区', '710200', '永安', '4', '07', '828', '中国,台湾,高雄市,永安区', 'Yong\'an', '120.225308', '22.818580');
INSERT INTO `tb_region` VALUES ('710228', '弥陀区', '710200', '弥陀', '4', '07', '827', '中国,台湾,高雄市,弥陀区', 'Mituo', '120.247344', '22.782879');
INSERT INTO `tb_region` VALUES ('710229', '梓官区', '710200', '梓官', '4', '07', '826', '中国,台湾,高雄市,梓官区', 'Ziguan', '120.267322', '22.760475');
INSERT INTO `tb_region` VALUES ('710230', '旗山区', '710200', '旗山', '4', '07', '842', '中国,台湾,高雄市,旗山区', 'Qishan', '120.483550', '22.888491');
INSERT INTO `tb_region` VALUES ('710231', '美浓区', '710200', '美浓', '4', '07', '843', '中国,台湾,高雄市,美浓区', 'Meinong', '120.541530', '22.897880');
INSERT INTO `tb_region` VALUES ('710232', '六龟区', '710200', '六龟', '4', '07', '844', '中国,台湾,高雄市,六龟区', 'Liugui', '120.633418', '22.997914');
INSERT INTO `tb_region` VALUES ('710233', '甲仙区', '710200', '甲仙', '4', '07', '847', '中国,台湾,高雄市,甲仙区', 'Jiaxian', '120.591185', '23.084688');
INSERT INTO `tb_region` VALUES ('710234', '杉林区', '710200', '杉林', '4', '07', '846', '中国,台湾,高雄市,杉林区', 'Shanlin', '120.538980', '22.970712');
INSERT INTO `tb_region` VALUES ('710235', '内门区', '710200', '内门', '4', '07', '845', '中国,台湾,高雄市,内门区', 'Namen', '120.462351', '22.943437');
INSERT INTO `tb_region` VALUES ('710236', '茂林区', '710200', '茂林', '4', '07', '851', '中国,台湾,高雄市,茂林区', 'Maolin', '120.663217', '22.886248');
INSERT INTO `tb_region` VALUES ('710237', '桃源区', '710200', '桃源', '4', '07', '848', '中国,台湾,高雄市,桃源区', 'Taoyuan', '120.760049', '23.159137');
INSERT INTO `tb_region` VALUES ('710238', '那玛夏区', '710200', '那玛夏', '4', '07', '849', '中国,台湾,高雄市,那玛夏区', 'Namaxia', '120.692799', '23.216964');
INSERT INTO `tb_region` VALUES ('710300', '基隆市', '710000', '基隆', '3', '02', '2', '中国,台湾,基隆市', 'Keelung', '121.746248', '25.130741');
INSERT INTO `tb_region` VALUES ('710301', '中正区', '710300', '中正', '4', '02', '202', '中国,台湾,基隆市,中正区', 'Zhongzheng', '121.518267', '25.032361');
INSERT INTO `tb_region` VALUES ('710302', '七堵区', '710300', '七堵', '4', '02', '206', '中国,台湾,基隆市,七堵区', 'Qidu', '121.713032', '25.095739');
INSERT INTO `tb_region` VALUES ('710303', '暖暖区', '710300', '暖暖', '4', '02', '205', '中国,台湾,基隆市,暖暖区', 'Nuannuan', '121.736102', '25.099777');
INSERT INTO `tb_region` VALUES ('710304', '仁爱区', '710300', '仁爱', '4', '02', '200', '中国,台湾,基隆市,仁爱区', 'Renai', '121.740940', '25.127526');
INSERT INTO `tb_region` VALUES ('710305', '中山区', '710300', '中山', '4', '02', '203', '中国,台湾,基隆市,中山区', 'Zhongshan', '121.739132', '25.133991');
INSERT INTO `tb_region` VALUES ('710306', '安乐区', '710300', '安乐', '4', '02', '204', '中国,台湾,基隆市,安乐区', 'Anle', '121.723203', '25.120910');
INSERT INTO `tb_region` VALUES ('710307', '信义区', '710300', '信义', '4', '02', '201', '中国,台湾,基隆市,信义区', 'Xinyi', '121.751381', '25.129407');
INSERT INTO `tb_region` VALUES ('710400', '台中市', '710000', '台中', '3', '04', '4', '中国,台湾,台中市', 'Taichung', '120.679040', '24.138620');
INSERT INTO `tb_region` VALUES ('710401', '中区', '710400', '中区', '4', '04', '400', '中国,台湾,台中市,中区', 'Zhongqu', '120.679510', '24.143830');
INSERT INTO `tb_region` VALUES ('710402', '东区', '710400', '东区', '4', '04', '401', '中国,台湾,台中市,东区', 'Dongqu', '120.704', '24.13662');
INSERT INTO `tb_region` VALUES ('710403', '南区', '710400', '南区', '4', '04', '402', '中国,台湾,台中市,南区', 'Nanqu', '120.188648', '22.960944');
INSERT INTO `tb_region` VALUES ('710404', '西区', '710400', '西区', '4', '04', '403', '中国,台湾,台中市,西区', 'Xiqu', '120.67104', '24.14138');
INSERT INTO `tb_region` VALUES ('710405', '北区', '710400', '北区', '4', '04', '404', '中国,台湾,台中市,北区', 'Beiqu', '120.682410', '24.166040');
INSERT INTO `tb_region` VALUES ('710406', '西屯区', '710400', '西屯', '4', '04', '407', '中国,台湾,台中市,西屯区', 'Xitun', '120.639820', '24.181340');
INSERT INTO `tb_region` VALUES ('710407', '南屯区', '710400', '南屯', '4', '04', '408', '中国,台湾,台中市,南屯区', 'Nantun', '120.643080', '24.138270');
INSERT INTO `tb_region` VALUES ('710408', '北屯区', '710400', '北屯', '4', '04', '406', '中国,台湾,台中市,北屯区', 'Beitun', '120.686250', '24.182220');
INSERT INTO `tb_region` VALUES ('710409', '丰原区', '710400', '丰原', '4', '04', '420', '中国,台湾,台中市,丰原区', 'Fengyuan', '120.718460', '24.242190');
INSERT INTO `tb_region` VALUES ('710410', '东势区', '710400', '东势', '4', '04', '423', '中国,台湾,台中市,东势区', 'Dongshi', '120.827770', '24.258610');
INSERT INTO `tb_region` VALUES ('710411', '大甲区', '710400', '大甲', '4', '04', '437', '中国,台湾,台中市,大甲区', 'Dajia', '120.622390', '24.348920');
INSERT INTO `tb_region` VALUES ('710412', '清水区', '710400', '清水', '4', '04', '436', '中国,台湾,台中市,清水区', 'Qingshui', '120.559780', '24.268650');
INSERT INTO `tb_region` VALUES ('710413', '沙鹿区', '710400', '沙鹿', '4', '04', '433', '中国,台湾,台中市,沙鹿区', 'Shalu', '120.565700', '24.233480');
INSERT INTO `tb_region` VALUES ('710414', '梧栖区', '710400', '梧栖', '4', '04', '435', '中国,台湾,台中市,梧栖区', 'Wuqi', '120.531520', '24.254960');
INSERT INTO `tb_region` VALUES ('710415', '后里区', '710400', '后里', '4', '04', '421', '中国,台湾,台中市,后里区', 'Houli', '120.710710', '24.304910');
INSERT INTO `tb_region` VALUES ('710416', '神冈区', '710400', '神冈', '4', '04', '429', '中国,台湾,台中市,神冈区', 'Shengang', '120.661550', '24.257770');
INSERT INTO `tb_region` VALUES ('710417', '潭子区', '710400', '潭子', '4', '04', '427', '中国,台湾,台中市,潭子区', 'Tanzi', '120.705160', '24.209530');
INSERT INTO `tb_region` VALUES ('710418', '大雅区', '710400', '大雅', '4', '04', '428', '中国,台湾,台中市,大雅区', 'Daya', '120.647780', '24.229230');
INSERT INTO `tb_region` VALUES ('710419', '新社区', '710400', '新社', '4', '04', '426', '中国,台湾,台中市,新社区', 'Xinshe', '120.809500', '24.234140');
INSERT INTO `tb_region` VALUES ('710420', '石冈区', '710400', '石冈', '4', '04', '422', '中国,台湾,台中市,石冈区', 'Shigang', '120.780410', '24.274980');
INSERT INTO `tb_region` VALUES ('710421', '外埔区', '710400', '外埔', '4', '04', '438', '中国,台湾,台中市,外埔区', 'Waipu', '120.654370', '24.332010');
INSERT INTO `tb_region` VALUES ('710422', '大安区', '710400', '大安', '4', '04', '439', '中国,台湾,台中市,大安区', 'Da\'an', '120.58652', '24.34607');
INSERT INTO `tb_region` VALUES ('710423', '乌日区', '710400', '乌日', '4', '04', '414', '中国,台湾,台中市,乌日区', 'Wuri', '120.623810', '24.104500');
INSERT INTO `tb_region` VALUES ('710424', '大肚区', '710400', '大肚', '4', '04', '432', '中国,台湾,台中市,大肚区', 'Dadu', '120.540960', '24.153660');
INSERT INTO `tb_region` VALUES ('710425', '龙井区', '710400', '龙井', '4', '04', '434', '中国,台湾,台中市,龙井区', 'Longjing', '120.545940', '24.192710');
INSERT INTO `tb_region` VALUES ('710426', '雾峰区', '710400', '雾峰', '4', '04', '413', '中国,台湾,台中市,雾峰区', 'Wufeng', '120.700200', '24.061520');
INSERT INTO `tb_region` VALUES ('710427', '太平区', '710400', '太平', '4', '04', '411', '中国,台湾,台中市,太平区', 'Taiping', '120.718523', '24.126472');
INSERT INTO `tb_region` VALUES ('710428', '大里区', '710400', '大里', '4', '04', '412', '中国,台湾,台中市,大里区', 'Dali', '120.677860', '24.099390');
INSERT INTO `tb_region` VALUES ('710429', '和平区', '710400', '和平', '4', '04', '424', '中国,台湾,台中市,和平区', 'Heping', '120.88349', '24.17477');
INSERT INTO `tb_region` VALUES ('710500', '台南市', '710000', '台南', '3', '06', '7', '中国,台湾,台南市', 'Tainan', '120.279363', '23.172478');
INSERT INTO `tb_region` VALUES ('710501', '东区', '710500', '东区', '4', '06', '701', '中国,台湾,台南市,东区', 'Dongqu', '120.224198', '22.980072');
INSERT INTO `tb_region` VALUES ('710502', '南区', '710500', '南区', '4', '06', '702', '中国,台湾,台南市,南区', 'Nanqu', '120.188648', '22.960944');
INSERT INTO `tb_region` VALUES ('710504', '北区', '710500', '北区', '4', '06', '704', '中国,台湾,台南市,北区', 'Beiqu', '120.682410', '24.166040');
INSERT INTO `tb_region` VALUES ('710506', '安南区', '710500', '安南', '4', '06', '709', '中国,台湾,台南市,安南区', 'Annan', '120.184617', '23.047230');
INSERT INTO `tb_region` VALUES ('710507', '安平区', '710500', '安平', '4', '06', '708', '中国,台湾,台南市,安平区', 'Anping', '120.166810', '23.000763');
INSERT INTO `tb_region` VALUES ('710508', '中西区', '710500', '中西', '4', '06', '700', '中国,台湾,台南市,中西区', 'Zhongxi', '120.205957', '22.992152');
INSERT INTO `tb_region` VALUES ('710509', '新营区', '710500', '新营', '4', '06', '730', '中国,台湾,台南市,新营区', 'Xinying', '120.316698', '23.310274');
INSERT INTO `tb_region` VALUES ('710510', '盐水区', '710500', '盐水', '4', '06', '737', '中国,台湾,台南市,盐水区', 'Yanshui', '120.266398', '23.319828');
INSERT INTO `tb_region` VALUES ('710511', '白河区', '710500', '白河', '4', '06', '732', '中国,台湾,台南市,白河区', 'Baihe', '120.415810', '23.351221');
INSERT INTO `tb_region` VALUES ('710512', '柳营区', '710500', '柳营', '4', '06', '736', '中国,台湾,台南市,柳营区', 'Liuying', '120.311286', '23.278133');
INSERT INTO `tb_region` VALUES ('710513', '后壁区', '710500', '后壁', '4', '06', '731', '中国,台湾,台南市,后壁区', 'Houbi', '120.362726', '23.366721');
INSERT INTO `tb_region` VALUES ('710514', '东山区', '710500', '东山', '4', '06', '733', '中国,台湾,台南市,东山区', 'Dongshan', '120.403984', '23.326092');
INSERT INTO `tb_region` VALUES ('710515', '麻豆区', '710500', '麻豆', '4', '06', '721', '中国,台湾,台南市,麻豆区', 'Madou', '120.248179', '23.181680');
INSERT INTO `tb_region` VALUES ('710516', '下营区', '710500', '下营', '4', '06', '735', '中国,台湾,台南市,下营区', 'Xiaying', '120.264484', '23.235413');
INSERT INTO `tb_region` VALUES ('710517', '六甲区', '710500', '六甲', '4', '06', '734', '中国,台湾,台南市,六甲区', 'Liujia', '120.347600', '23.231931');
INSERT INTO `tb_region` VALUES ('710518', '官田区', '710500', '官田', '4', '06', '720', '中国,台湾,台南市,官田区', 'Guantian', '120.314374', '23.194652');
INSERT INTO `tb_region` VALUES ('710519', '大内区', '710500', '大内', '4', '06', '742', '中国,台湾,台南市,大内区', 'Dana', '120.348853', '23.119460');
INSERT INTO `tb_region` VALUES ('710520', '佳里区', '710500', '佳里', '4', '06', '722', '中国,台湾,台南市,佳里区', 'Jiali', '120.177211', '23.165121');
INSERT INTO `tb_region` VALUES ('710521', '学甲区', '710500', '学甲', '4', '06', '726', '中国,台湾,台南市,学甲区', 'Xuejia', '120.180255', '23.232348');
INSERT INTO `tb_region` VALUES ('710522', '西港区', '710500', '西港', '4', '06', '723', '中国,台湾,台南市,西港区', 'Xigang', '120.203618', '23.123057');
INSERT INTO `tb_region` VALUES ('710523', '七股区', '710500', '七股', '4', '06', '724', '中国,台湾,台南市,七股区', 'Qigu', '120.140003', '23.140545');
INSERT INTO `tb_region` VALUES ('710524', '将军区', '710500', '将军', '4', '06', '725', '中国,台湾,台南市,将军区', 'Jiangjun', '120.156871', '23.199543');
INSERT INTO `tb_region` VALUES ('710525', '北门区', '710500', '北门', '4', '06', '727', '中国,台湾,台南市,北门区', 'Beimen', '120.125821', '23.267148');
INSERT INTO `tb_region` VALUES ('710526', '新化区', '710500', '新化', '4', '06', '712', '中国,台湾,台南市,新化区', 'Xinhua', '120.310807', '23.038533');
INSERT INTO `tb_region` VALUES ('710527', '善化区', '710500', '善化', '4', '06', '741', '中国,台湾,台南市,善化区', 'Shanhua', '120.296895', '23.132261');
INSERT INTO `tb_region` VALUES ('710528', '新市区', '710500', '新市', '4', '06', '744', '中国,台湾,台南市,新市区', 'Xinshi', '120.295138', '23.07897');
INSERT INTO `tb_region` VALUES ('710529', '安定区', '710500', '安定', '4', '06', '745', '中国,台湾,台南市,安定区', 'Anding', '120.237083', '23.121498');
INSERT INTO `tb_region` VALUES ('710530', '山上区', '710500', '山上', '4', '06', '743', '中国,台湾,台南市,山上区', 'Shanshang', '120.352908', '23.103223');
INSERT INTO `tb_region` VALUES ('710531', '玉井区', '710500', '玉井', '4', '06', '714', '中国,台湾,台南市,玉井区', 'Yujing', '120.460110', '23.123859');
INSERT INTO `tb_region` VALUES ('710532', '楠西区', '710500', '楠西', '4', '06', '715', '中国,台湾,台南市,楠西区', 'Nanxi', '120.485396', '23.173454');
INSERT INTO `tb_region` VALUES ('710533', '南化区', '710500', '南化', '4', '06', '716', '中国,台湾,台南市,南化区', 'Nanhua', '120.477116', '23.042614');
INSERT INTO `tb_region` VALUES ('710534', '左镇区', '710500', '左镇', '4', '06', '713', '中国,台湾,台南市,左镇区', 'Zuozhen', '120.407309', '23.057955');
INSERT INTO `tb_region` VALUES ('710535', '仁德区', '710500', '仁德', '4', '06', '717', '中国,台湾,台南市,仁德区', 'Rende', '120.251520', '22.972212');
INSERT INTO `tb_region` VALUES ('710536', '归仁区', '710500', '归仁', '4', '06', '711', '中国,台湾,台南市,归仁区', 'Guiren', '120.293791', '22.967081');
INSERT INTO `tb_region` VALUES ('710537', '关庙区', '710500', '关庙', '4', '06', '718', '中国,台湾,台南市,关庙区', 'Guanmiao', '120.327689', '22.962949');
INSERT INTO `tb_region` VALUES ('710538', '龙崎区', '710500', '龙崎', '4', '06', '719', '中国,台湾,台南市,龙崎区', 'Longqi', '120.360824', '22.965681');
INSERT INTO `tb_region` VALUES ('710539', '永康区', '710500', '永康', '4', '06', '710', '中国,台湾,台南市,永康区', 'Yongkang', '120.257069', '23.026061');
INSERT INTO `tb_region` VALUES ('710600', '新竹市', '710000', '新竹', '3', '03', '3', '中国,台湾,新竹市', 'Hsinchu', '120.968798', '24.806738');
INSERT INTO `tb_region` VALUES ('710601', '东区', '710600', '东区', '4', '03', '300', '中国,台湾,新竹市,东区', 'Dongqu', '120.970239', '24.801337');
INSERT INTO `tb_region` VALUES ('710602', '北区', '710600', '北区', '4', '03', '', '中国,台湾,新竹市,北区', 'Beiqu', '120.682410', '24.166040');
INSERT INTO `tb_region` VALUES ('710603', '香山区', '710600', '香山', '4', '03', '', '中国,台湾,新竹市,香山区', 'Xiangshan', '120.956679', '24.768933');
INSERT INTO `tb_region` VALUES ('710700', '嘉义市', '710000', '嘉义', '3', '05', '6', '中国,台湾,嘉义市', 'Chiayi', '120.452538', '23.481568');
INSERT INTO `tb_region` VALUES ('710701', '东区', '710700', '东区', '4', '05', '600', '中国,台湾,嘉义市,东区', 'Dongqu', '120.458009', '23.486213');
INSERT INTO `tb_region` VALUES ('710702', '西区', '710700', '西区', '4', '05', '600', '中国,台湾,嘉义市,西区', 'Xiqu', '120.437493', '23.473029');
INSERT INTO `tb_region` VALUES ('710800', '新北市', '710000', '新北', '3', '02', '2', '中国,台湾,新北市', 'New Taipei', '121.465746', '25.012366');
INSERT INTO `tb_region` VALUES ('710801', '板桥区', '710800', '板桥', '4', '02', '220', '中国,台湾,新北市,板桥区', 'Banqiao', '121.459084', '25.009578');
INSERT INTO `tb_region` VALUES ('710802', '三重区', '710800', '三重', '4', '02', '241', '中国,台湾,新北市,三重区', 'Sanzhong', '121.488102', '25.061486');
INSERT INTO `tb_region` VALUES ('710803', '中和区', '710800', '中和', '4', '02', '235', '中国,台湾,新北市,中和区', 'Zhonghe', '121.498980', '24.999397');
INSERT INTO `tb_region` VALUES ('710804', '永和区', '710800', '永和', '4', '02', '234', '中国,台湾,新北市,永和区', 'Yonghe', '121.513660', '25.007802');
INSERT INTO `tb_region` VALUES ('710805', '新庄区', '710800', '新庄', '4', '02', '242', '中国,台湾,新北市,新庄区', 'Xinzhuang', '121.450413', '25.035947');
INSERT INTO `tb_region` VALUES ('710806', '新店区', '710800', '新店', '4', '02', '231', '中国,台湾,新北市,新店区', 'Xindian', '121.541750', '24.967558');
INSERT INTO `tb_region` VALUES ('710807', '树林区', '710800', '树林', '4', '02', '238', '中国,台湾,新北市,树林区', 'Shulin', '121.420533', '24.990706');
INSERT INTO `tb_region` VALUES ('710808', '莺歌区', '710800', '莺歌', '4', '02', '239', '中国,台湾,新北市,莺歌区', 'Yingge', '121.354573', '24.955413');
INSERT INTO `tb_region` VALUES ('710809', '三峡区', '710800', '三峡', '4', '02', '237', '中国,台湾,新北市,三峡区', 'Sanxia', '121.368905', '24.934339');
INSERT INTO `tb_region` VALUES ('710810', '淡水区', '710800', '淡水', '4', '02', '251', '中国,台湾,新北市,淡水区', 'Danshui', '121.440915', '25.169452');
INSERT INTO `tb_region` VALUES ('710811', '汐止区', '710800', '汐止', '4', '02', '221', '中国,台湾,新北市,汐止区', 'Xizhi', '121.629470', '25.062999');
INSERT INTO `tb_region` VALUES ('710812', '瑞芳区', '710800', '瑞芳', '4', '02', '224', '中国,台湾,新北市,瑞芳区', 'Ruifang', '121.810061', '25.108895');
INSERT INTO `tb_region` VALUES ('710813', '土城区', '710800', '土城', '4', '02', '236', '中国,台湾,新北市,土城区', 'Tucheng', '121.443348', '24.972201');
INSERT INTO `tb_region` VALUES ('710814', '芦洲区', '710800', '芦洲', '4', '02', '247', '中国,台湾,新北市,芦洲区', 'Luzhou', '121.473700', '25.084923');
INSERT INTO `tb_region` VALUES ('710815', '五股区', '710800', '五股', '4', '02', '248', '中国,台湾,新北市,五股区', 'Wugu', '121.438156', '25.082743');
INSERT INTO `tb_region` VALUES ('710816', '泰山区', '710800', '泰山', '4', '02', '243', '中国,台湾,新北市,泰山区', 'Taishan', '121.430811', '25.058864');
INSERT INTO `tb_region` VALUES ('710817', '林口区', '710800', '林口', '4', '02', '244', '中国,台湾,新北市,林口区', 'Linkou', '121.391602', '25.077531');
INSERT INTO `tb_region` VALUES ('710818', '深坑区', '710800', '深坑', '4', '02', '222', '中国,台湾,新北市,深坑区', 'Shenkeng', '121.615670', '25.002329');
INSERT INTO `tb_region` VALUES ('710819', '石碇区', '710800', '石碇', '4', '02', '223', '中国,台湾,新北市,石碇区', 'Shiding', '121.658567', '24.991679');
INSERT INTO `tb_region` VALUES ('710820', '坪林区', '710800', '坪林', '4', '02', '232', '中国,台湾,新北市,坪林区', 'Pinglin', '121.711185', '24.937388');
INSERT INTO `tb_region` VALUES ('710821', '三芝区', '710800', '三芝', '4', '02', '252', '中国,台湾,新北市,三芝区', 'Sanzhi', '121.500866', '25.258047');
INSERT INTO `tb_region` VALUES ('710822', '石门区', '710800', '石门', '4', '02', '253', '中国,台湾,新北市,石门区', 'Shimen', '121.568491', '25.290412');
INSERT INTO `tb_region` VALUES ('710823', '八里区', '710800', '八里', '4', '02', '249', '中国,台湾,新北市,八里区', 'Bali', '121.398227', '25.146680');
INSERT INTO `tb_region` VALUES ('710824', '平溪区', '710800', '平溪', '4', '02', '226', '中国,台湾,新北市,平溪区', 'Pingxi', '121.738255', '25.025725');
INSERT INTO `tb_region` VALUES ('710825', '双溪区', '710800', '双溪', '4', '02', '227', '中国,台湾,新北市,双溪区', 'Shuangxi', '121.865676', '25.033409');
INSERT INTO `tb_region` VALUES ('710826', '贡寮区', '710800', '贡寮', '4', '02', '228', '中国,台湾,新北市,贡寮区', 'Gongliao', '121.908185', '25.022388');
INSERT INTO `tb_region` VALUES ('710827', '金山区', '710800', '金山', '4', '02', '208', '中国,台湾,新北市,金山区', 'Jinshan', '121.636427', '25.221883');
INSERT INTO `tb_region` VALUES ('710828', '万里区', '710800', '万里', '4', '02', '207', '中国,台湾,新北市,万里区', 'Wanli', '121.688687', '25.181234');
INSERT INTO `tb_region` VALUES ('710829', '乌来区', '710800', '乌来', '4', '02', '233', '中国,台湾,新北市,乌来区', 'Wulai', '121.550531', '24.865296');
INSERT INTO `tb_region` VALUES ('712200', '宜兰县', '710000', '宜兰', '3', '03', '2', '中国,台湾,宜兰县', 'Yilan', '121.500000', '24.600000');
INSERT INTO `tb_region` VALUES ('712201', '宜兰市', '712200', '宜兰', '4', '03', '260', '中国,台湾,宜兰县,宜兰市', 'Yilan', '121.753476', '24.751682');
INSERT INTO `tb_region` VALUES ('712221', '罗东镇', '712200', '罗东', '4', '03', '265', '中国,台湾,宜兰县,罗东镇', 'Luodong', '121.766919', '24.677033');
INSERT INTO `tb_region` VALUES ('712222', '苏澳镇', '712200', '苏澳', '4', '03', '270', '中国,台湾,宜兰县,苏澳镇', 'Suao', '121.842656', '24.594622');
INSERT INTO `tb_region` VALUES ('712223', '头城镇', '712200', '头城', '4', '03', '261', '中国,台湾,宜兰县,头城镇', 'Toucheng', '121.823307', '24.859217');
INSERT INTO `tb_region` VALUES ('712224', '礁溪乡', '712200', '礁溪', '4', '03', '262', '中国,台湾,宜兰县,礁溪乡', 'Jiaoxi', '121.766680', '24.822345');
INSERT INTO `tb_region` VALUES ('712225', '壮围乡', '712200', '壮围', '4', '03', '263', '中国,台湾,宜兰县,壮围乡', 'Zhuangwei', '121.781619', '24.744949');
INSERT INTO `tb_region` VALUES ('712226', '员山乡', '712200', '员山', '4', '03', '264', '中国,台湾,宜兰县,员山乡', 'Yuanshan', '121.721733', '24.741771');
INSERT INTO `tb_region` VALUES ('712227', '冬山乡', '712200', '冬山', '4', '03', '269', '中国,台湾,宜兰县,冬山乡', 'Dongshan', '121.792280', '24.634514');
INSERT INTO `tb_region` VALUES ('712228', '五结乡', '712200', '五结', '4', '03', '268', '中国,台湾,宜兰县,五结乡', 'Wujie', '121.798297', '24.684640');
INSERT INTO `tb_region` VALUES ('712229', '三星乡', '712200', '三星', '4', '03', '266', '中国,台湾,宜兰县,三星乡', 'Sanxing', '121.003418', '23.775291');
INSERT INTO `tb_region` VALUES ('712230', '大同乡', '712200', '大同', '4', '03', '267', '中国,台湾,宜兰县,大同乡', 'Datong', '121.605557', '24.675997');
INSERT INTO `tb_region` VALUES ('712231', '南澳乡', '712200', '南澳', '4', '03', '272', '中国,台湾,宜兰县,南澳乡', 'Nanao', '121.799810', '24.465393');
INSERT INTO `tb_region` VALUES ('712300', '桃园县', '710000', '桃园', '3', '03', '3', '中国,台湾,桃园县', 'Taoyuan', '121.083000', '25.000000');
INSERT INTO `tb_region` VALUES ('712301', '桃园市', '712300', '桃园', '4', '03', '330', '中国,台湾,桃园县,桃园市', 'Taoyuan', '121.301337', '24.993777');
INSERT INTO `tb_region` VALUES ('712302', '中坜市', '712300', '中坜', '4', '03', '320', '中国,台湾,桃园县,中坜市', 'Zhongli', '121.224926', '24.965353');
INSERT INTO `tb_region` VALUES ('712303', '平镇市', '712300', '平镇', '4', '03', '324', '中国,台湾,桃园县,平镇市', 'Pingzhen', '121.218359', '24.945752');
INSERT INTO `tb_region` VALUES ('712304', '八德市', '712300', '八德', '4', '03', '334', '中国,台湾,桃园县,八德市', 'Bade', '121.284655', '24.928651');
INSERT INTO `tb_region` VALUES ('712305', '杨梅市', '712300', '杨梅', '4', '03', '326', '中国,台湾,桃园县,杨梅市', 'Yangmei', '121.145873', '24.907575');
INSERT INTO `tb_region` VALUES ('712306', '芦竹市', '712300', '芦竹', '4', '03', '338', '中国,台湾,桃园县,芦竹市', 'Luzhu', '121.292064', '25.045392');
INSERT INTO `tb_region` VALUES ('712321', '大溪镇', '712300', '大溪', '4', '03', '335', '中国,台湾,桃园县,大溪镇', 'Daxi', '121.286962', '24.880584');
INSERT INTO `tb_region` VALUES ('712324', '大园乡', '712300', '大园', '4', '03', '337', '中国,台湾,桃园县,大园乡', 'Dayuan', '121.196292', '25.064471');
INSERT INTO `tb_region` VALUES ('712325', '龟山乡', '712300', '龟山', '4', '03', '333', '中国,台湾,桃园县,龟山乡', 'Guishan', '121.337767', '24.992517');
INSERT INTO `tb_region` VALUES ('712327', '龙潭乡', '712300', '龙潭', '4', '03', '325', '中国,台湾,桃园县,龙潭乡', 'Longtan', '121.216392', '24.863851');
INSERT INTO `tb_region` VALUES ('712329', '新屋乡', '712300', '新屋', '4', '03', '327', '中国,台湾,桃园县,新屋乡', 'Xinwu', '121.105801', '24.972203');
INSERT INTO `tb_region` VALUES ('712330', '观音乡', '712300', '观音', '4', '03', '328', '中国,台湾,桃园县,观音乡', 'Guanyin', '121.077519', '25.033303');
INSERT INTO `tb_region` VALUES ('712331', '复兴乡', '712300', '复兴', '4', '03', '336', '中国,台湾,桃园县,复兴乡', 'Fuxing', '121.352613', '24.820908');
INSERT INTO `tb_region` VALUES ('712400', '新竹县', '710000', '新竹', '3', '03', '3', '中国,台湾,新竹县', 'Hsinchu', '121.160000', '24.600000');
INSERT INTO `tb_region` VALUES ('712401', '竹北市', '712400', '竹北', '4', '03', '302', '中国,台湾,新竹县,竹北市', 'Zhubei', '121.004317', '24.839652');
INSERT INTO `tb_region` VALUES ('712421', '竹东镇', '712400', '竹东', '4', '03', '310', '中国,台湾,新竹县,竹东镇', 'Zhudong', '121.086418', '24.733601');
INSERT INTO `tb_region` VALUES ('712422', '新埔镇', '712400', '新埔', '4', '03', '305', '中国,台湾,新竹县,新埔镇', 'Xinpu', '121.072804', '24.824820');
INSERT INTO `tb_region` VALUES ('712423', '关西镇', '712400', '关西', '4', '03', '306', '中国,台湾,新竹县,关西镇', 'Guanxi', '121.177301', '24.788842');
INSERT INTO `tb_region` VALUES ('712424', '湖口乡', '712400', '湖口', '4', '03', '303', '中国,台湾,新竹县,湖口乡', 'Hukou', '121.043691', '24.903943');
INSERT INTO `tb_region` VALUES ('712425', '新丰乡', '712400', '新丰', '4', '03', '304', '中国,台湾,新竹县,新丰乡', 'Xinfeng', '120.983006', '24.899600');
INSERT INTO `tb_region` VALUES ('712426', '芎林乡', '712400', '芎林', '4', '03', '307', '中国,台湾,新竹县,芎林乡', 'Xionglin', '121.076924', '24.774436');
INSERT INTO `tb_region` VALUES ('712427', '横山乡', '712400', '横山', '4', '03', '312', '中国,台湾,新竹县,横山乡', 'Hengshan', '121.116244', '24.720807');
INSERT INTO `tb_region` VALUES ('712428', '北埔乡', '712400', '北埔', '4', '03', '314', '中国,台湾,新竹县,北埔乡', 'Beipu', '121.053156', '24.697126');
INSERT INTO `tb_region` VALUES ('712429', '宝山乡', '712400', '宝山', '4', '03', '308', '中国,台湾,新竹县,宝山乡', 'Baoshan', '120.985752', '24.760975');
INSERT INTO `tb_region` VALUES ('712430', '峨眉乡', '712400', '峨眉', '4', '03', '315', '中国,台湾,新竹县,峨眉乡', 'Emei', '121.015291', '24.686127');
INSERT INTO `tb_region` VALUES ('712431', '尖石乡', '712400', '尖石', '4', '03', '313', '中国,台湾,新竹县,尖石乡', 'Jianshi', '121.197802', '24.704360');
INSERT INTO `tb_region` VALUES ('712432', '五峰乡', '712400', '五峰', '4', '03', '311', '中国,台湾,新竹县,五峰乡', 'Wufeng', '121.003418', '23.775291');
INSERT INTO `tb_region` VALUES ('712500', '苗栗县', '710000', '苗栗', '3', '037', '3', '中国,台湾,苗栗县', 'Miaoli', '120.750000', '24.500000');
INSERT INTO `tb_region` VALUES ('712501', '苗栗市', '712500', '苗栗', '4', '037', '360', '中国,台湾,苗栗县,苗栗市', 'Miaoli', '120.818869', '24.561472');
INSERT INTO `tb_region` VALUES ('712521', '苑里镇', '712500', '苑里', '4', '037', '358', '中国,台湾,苗栗县,苑里镇', 'Yuanli', '120.648907', '24.441750');
INSERT INTO `tb_region` VALUES ('712522', '通霄镇', '712500', '通霄', '4', '037', '357', '中国,台湾,苗栗县,通霄镇', 'Tongxiao', '120.676700', '24.489087');
INSERT INTO `tb_region` VALUES ('712523', '竹南镇', '712500', '竹南', '4', '037', '350', '中国,台湾,苗栗县,竹南镇', 'Zhunan', '120.872641', '24.685513');
INSERT INTO `tb_region` VALUES ('712524', '头份镇', '712500', '头份', '4', '037', '351', '中国,台湾,苗栗县,头份镇', 'Toufen', '120.895188', '24.687993');
INSERT INTO `tb_region` VALUES ('712525', '后龙镇', '712500', '后龙', '4', '037', '356', '中国,台湾,苗栗县,后龙镇', 'Houlong', '120.786480', '24.612617');
INSERT INTO `tb_region` VALUES ('712526', '卓兰镇', '712500', '卓兰', '4', '037', '369', '中国,台湾,苗栗县,卓兰镇', 'Zhuolan', '120.823441', '24.309509');
INSERT INTO `tb_region` VALUES ('712527', '大湖乡', '712500', '大湖', '4', '037', '364', '中国,台湾,苗栗县,大湖乡', 'Dahu', '120.863641', '24.422547');
INSERT INTO `tb_region` VALUES ('712528', '公馆乡', '712500', '公馆', '4', '037', '363', '中国,台湾,苗栗县,公馆乡', 'Gongguan', '120.822983', '24.499108');
INSERT INTO `tb_region` VALUES ('712529', '铜锣乡', '712500', '铜锣', '4', '037', '366', '中国,台湾,苗栗县,铜锣乡', 'Tongluo', '121.003418', '23.775291');
INSERT INTO `tb_region` VALUES ('712530', '南庄乡', '712500', '南庄', '4', '037', '353', '中国,台湾,苗栗县,南庄乡', 'Nanzhuang', '120.994957', '24.596835');
INSERT INTO `tb_region` VALUES ('712531', '头屋乡', '712500', '头屋', '4', '037', '362', '中国,台湾,苗栗县,头屋乡', 'Touwu', '120.846616', '24.574249');
INSERT INTO `tb_region` VALUES ('712532', '三义乡', '712500', '三义', '4', '037', '367', '中国,台湾,苗栗县,三义乡', 'Sanyi', '120.742340', '24.350270');
INSERT INTO `tb_region` VALUES ('712533', '西湖乡', '712500', '西湖', '4', '037', '368', '中国,台湾,苗栗县,西湖乡', 'Xihu', '121.003418', '23.775291');
INSERT INTO `tb_region` VALUES ('712534', '造桥乡', '712500', '造桥', '4', '037', '361', '中国,台湾,苗栗县,造桥乡', 'Zaoqiao', '120.862399', '24.637537');
INSERT INTO `tb_region` VALUES ('712535', '三湾乡', '712500', '三湾', '4', '037', '352', '中国,台湾,苗栗县,三湾乡', 'Sanwan', '120.951484', '24.651051');
INSERT INTO `tb_region` VALUES ('712536', '狮潭乡', '712500', '狮潭', '4', '037', '354', '中国,台湾,苗栗县,狮潭乡', 'Shitan', '120.918024', '24.540004');
INSERT INTO `tb_region` VALUES ('712537', '泰安乡', '712500', '泰安', '4', '037', '365', '中国,台湾,苗栗县,泰安乡', 'Tai\'an', '120.904441', '24.442600');
INSERT INTO `tb_region` VALUES ('712700', '彰化县', '710000', '彰化', '3', '04', '5', '中国,台湾,彰化县', 'Changhua', '120.416000', '24.000000');
INSERT INTO `tb_region` VALUES ('712701', '彰化市', '712700', '彰化市', '4', '04', '500', '中国,台湾,彰化县,彰化市', 'Zhanghuashi', '120.542294', '24.080911');
INSERT INTO `tb_region` VALUES ('712721', '鹿港镇', '712700', '鹿港', '4', '04', '505', '中国,台湾,彰化县,鹿港镇', 'Lugang', '120.435392', '24.056937');
INSERT INTO `tb_region` VALUES ('712722', '和美镇', '712700', '和美', '4', '04', '508', '中国,台湾,彰化县,和美镇', 'Hemei', '120.500265', '24.110904');
INSERT INTO `tb_region` VALUES ('712723', '线西乡', '712700', '线西', '4', '04', '507', '中国,台湾,彰化县,线西乡', 'Xianxi', '120.465921', '24.128653');
INSERT INTO `tb_region` VALUES ('712724', '伸港乡', '712700', '伸港', '4', '04', '509', '中国,台湾,彰化县,伸港乡', 'Shengang', '120.484224', '24.146081');
INSERT INTO `tb_region` VALUES ('712725', '福兴乡', '712700', '福兴', '4', '04', '506', '中国,台湾,彰化县,福兴乡', 'Fuxing', '120.443682', '24.047883');
INSERT INTO `tb_region` VALUES ('712726', '秀水乡', '712700', '秀水', '4', '04', '504', '中国,台湾,彰化县,秀水乡', 'Xiushui', '120.502658', '24.035267');
INSERT INTO `tb_region` VALUES ('712727', '花坛乡', '712700', '花坛', '4', '04', '503', '中国,台湾,彰化县,花坛乡', 'Huatan', '120.538403', '24.029399');
INSERT INTO `tb_region` VALUES ('712728', '芬园乡', '712700', '芬园', '4', '04', '502', '中国,台湾,彰化县,芬园乡', 'Fenyuan', '120.629024', '24.013658');
INSERT INTO `tb_region` VALUES ('712729', '员林镇', '712700', '员林', '4', '04', '510', '中国,台湾,彰化县,员林镇', 'Yuanlin', '120.574625', '23.958999');
INSERT INTO `tb_region` VALUES ('712730', '溪湖镇', '712700', '溪湖', '4', '04', '514', '中国,台湾,彰化县,溪湖镇', 'Xihu', '120.479144', '23.962315');
INSERT INTO `tb_region` VALUES ('712731', '田中镇', '712700', '田中', '4', '04', '520', '中国,台湾,彰化县,田中镇', 'Tianzhong', '120.580629', '23.861718');
INSERT INTO `tb_region` VALUES ('712732', '大村乡', '712700', '大村', '4', '04', '515', '中国,台湾,彰化县,大村乡', 'Dacun', '120.540713', '23.993726');
INSERT INTO `tb_region` VALUES ('712733', '埔盐乡', '712700', '埔盐', '4', '04', '516', '中国,台湾,彰化县,埔盐乡', 'Puyan', '120.464044', '24.000346');
INSERT INTO `tb_region` VALUES ('712734', '埔心乡', '712700', '埔心', '4', '04', '513', '中国,台湾,彰化县,埔心乡', 'Puxin', '120.543568', '23.953019');
INSERT INTO `tb_region` VALUES ('712735', '永靖乡', '712700', '永靖', '4', '04', '512', '中国,台湾,彰化县,永靖乡', 'Yongjing', '120.547775', '23.924703');
INSERT INTO `tb_region` VALUES ('712736', '社头乡', '712700', '社头', '4', '04', '511', '中国,台湾,彰化县,社头乡', 'Shetou', '120.582681', '23.896686');
INSERT INTO `tb_region` VALUES ('712737', '二水乡', '712700', '二水', '4', '04', '530', '中国,台湾,彰化县,二水乡', 'Ershui', '120.618788', '23.806995');
INSERT INTO `tb_region` VALUES ('712738', '北斗镇', '712700', '北斗', '4', '04', '521', '中国,台湾,彰化县,北斗镇', 'Beidou', '120.520449', '23.870911');
INSERT INTO `tb_region` VALUES ('712739', '二林镇', '712700', '二林', '4', '04', '526', '中国,台湾,彰化县,二林镇', 'Erlin', '120.374468', '23.899751');
INSERT INTO `tb_region` VALUES ('712740', '田尾乡', '712700', '田尾', '4', '04', '522', '中国,台湾,彰化县,田尾乡', 'Tianwei', '120.524717', '23.890735');
INSERT INTO `tb_region` VALUES ('712741', '埤头乡', '712700', '埤头', '4', '04', '523', '中国,台湾,彰化县,埤头乡', 'Pitou', '120.462599', '23.891324');
INSERT INTO `tb_region` VALUES ('712742', '芳苑乡', '712700', '芳苑', '4', '04', '528', '中国,台湾,彰化县,芳苑乡', 'Fangyuan', '120.320329', '23.924222');
INSERT INTO `tb_region` VALUES ('712743', '大城乡', '712700', '大城', '4', '04', '527', '中国,台湾,彰化县,大城乡', 'Dacheng', '120.320934', '23.852382');
INSERT INTO `tb_region` VALUES ('712744', '竹塘乡', '712700', '竹塘', '4', '04', '525', '中国,台湾,彰化县,竹塘乡', 'Zhutang', '120.427499', '23.860112');
INSERT INTO `tb_region` VALUES ('712745', '溪州乡', '712700', '溪州', '4', '04', '524', '中国,台湾,彰化县,溪州乡', 'Xizhou', '120.498706', '23.851229');
INSERT INTO `tb_region` VALUES ('712800', '南投县', '710000', '南投', '3', '049', '5', '中国,台湾,南投县', 'Nantou', '120.830000', '23.830000');
INSERT INTO `tb_region` VALUES ('712801', '南投市', '712800', '南投市', '4', '049', '540', '中国,台湾,南投县,南投市', 'Nantoushi', '120.683706', '23.909956');
INSERT INTO `tb_region` VALUES ('712821', '埔里镇', '712800', '埔里', '4', '049', '545', '中国,台湾,南投县,埔里镇', 'Puli', '120.964648', '23.964789');
INSERT INTO `tb_region` VALUES ('712822', '草屯镇', '712800', '草屯', '4', '049', '542', '中国,台湾,南投县,草屯镇', 'Caotun', '120.680343', '23.973947');
INSERT INTO `tb_region` VALUES ('712823', '竹山镇', '712800', '竹山', '4', '049', '557', '中国,台湾,南投县,竹山镇', 'Zhushan', '120.672007', '23.757655');
INSERT INTO `tb_region` VALUES ('712824', '集集镇', '712800', '集集', '4', '049', '552', '中国,台湾,南投县,集集镇', 'Jiji', '120.783673', '23.829013');
INSERT INTO `tb_region` VALUES ('712825', '名间乡', '712800', '名间', '4', '049', '551', '中国,台湾,南投县,名间乡', 'Mingjian', '120.702797', '23.838427');
INSERT INTO `tb_region` VALUES ('712826', '鹿谷乡', '712800', '鹿谷', '4', '049', '558', '中国,台湾,南投县,鹿谷乡', 'Lugu', '120.752796', '23.744471');
INSERT INTO `tb_region` VALUES ('712827', '中寮乡', '712800', '中寮', '4', '049', '541', '中国,台湾,南投县,中寮乡', 'Zhongliao', '120.766654', '23.878935');
INSERT INTO `tb_region` VALUES ('712828', '鱼池乡', '712800', '鱼池', '4', '049', '555', '中国,台湾,南投县,鱼池乡', 'Yuchi', '120.936060', '23.896356');
INSERT INTO `tb_region` VALUES ('712829', '国姓乡', '712800', '国姓', '4', '049', '544', '中国,台湾,南投县,国姓乡', 'Guoxing', '120.858541', '24.042298');
INSERT INTO `tb_region` VALUES ('712830', '水里乡', '712800', '水里', '4', '049', '553', '中国,台湾,南投县,水里乡', 'Shuili', '120.855912', '23.812086');
INSERT INTO `tb_region` VALUES ('712831', '信义乡', '712800', '信义', '4', '049', '556', '中国,台湾,南投县,信义乡', 'Xinyi', '120.855257', '23.699922');
INSERT INTO `tb_region` VALUES ('712832', '仁爱乡', '712800', '仁爱', '4', '049', '546', '中国,台湾,南投县,仁爱乡', 'Renai', '121.133543', '24.024429');
INSERT INTO `tb_region` VALUES ('712900', '云林县', '710000', '云林', '3', '05', '6', '中国,台湾,云林县', 'Yunlin', '120.250000', '23.750000');
INSERT INTO `tb_region` VALUES ('712901', '斗六市', '712900', '斗六', '4', '05', '640', '中国,台湾,云林县,斗六市', 'Douliu', '120.527360', '23.697651');
INSERT INTO `tb_region` VALUES ('712921', '斗南镇', '712900', '斗南', '4', '05', '630', '中国,台湾,云林县,斗南镇', 'Dounan', '120.479075', '23.679731');
INSERT INTO `tb_region` VALUES ('712922', '虎尾镇', '712900', '虎尾', '4', '05', '632', '中国,台湾,云林县,虎尾镇', 'Huwei', '120.445339', '23.708182');
INSERT INTO `tb_region` VALUES ('712923', '西螺镇', '712900', '西螺', '4', '05', '648', '中国,台湾,云林县,西螺镇', 'Xiluo', '120.466010', '23.797984');
INSERT INTO `tb_region` VALUES ('712924', '土库镇', '712900', '土库', '4', '05', '633', '中国,台湾,云林县,土库镇', 'Tuku', '120.392572', '23.677822');
INSERT INTO `tb_region` VALUES ('712925', '北港镇', '712900', '北港', '4', '05', '651', '中国,台湾,云林县,北港镇', 'Beigang', '120.302393', '23.575525');
INSERT INTO `tb_region` VALUES ('712926', '古坑乡', '712900', '古坑', '4', '05', '646', '中国,台湾,云林县,古坑乡', 'Gukeng', '120.562043', '23.642568');
INSERT INTO `tb_region` VALUES ('712927', '大埤乡', '712900', '大埤', '4', '05', '631', '中国,台湾,云林县,大埤乡', 'Dapi', '120.430516', '23.645908');
INSERT INTO `tb_region` VALUES ('712928', '莿桐乡', '712900', '莿桐', '4', '05', '647', '中国,台湾,云林县,莿桐乡', 'Citong', '120.502374', '23.760784');
INSERT INTO `tb_region` VALUES ('712929', '林内乡', '712900', '林内', '4', '05', '643', '中国,台湾,云林县,林内乡', 'Linna', '120.611365', '23.758712');
INSERT INTO `tb_region` VALUES ('712930', '二仑乡', '712900', '二仑', '4', '05', '649', '中国,台湾,云林县,二仑乡', 'Erlun', '120.415077', '23.771273');
INSERT INTO `tb_region` VALUES ('712931', '仑背乡', '712900', '仑背', '4', '05', '637', '中国,台湾,云林县,仑背乡', 'Lunbei', '120.353895', '23.758840');
INSERT INTO `tb_region` VALUES ('712932', '麦寮乡', '712900', '麦寮', '4', '05', '638', '中国,台湾,云林县,麦寮乡', 'Mailiao', '120.252043', '23.753841');
INSERT INTO `tb_region` VALUES ('712933', '东势乡', '712900', '东势', '4', '05', '635', '中国,台湾,云林县,东势乡', 'Dongshi', '120.252672', '23.674679');
INSERT INTO `tb_region` VALUES ('712934', '褒忠乡', '712900', '褒忠', '4', '05', '634', '中国,台湾,云林县,褒忠乡', 'Baozhong', '120.310488', '23.694245');
INSERT INTO `tb_region` VALUES ('712935', '台西乡', '712900', '台西', '4', '05', '636', '中国,台湾,云林县,台西乡', 'Taixi', '120.196141', '23.702819');
INSERT INTO `tb_region` VALUES ('712936', '元长乡', '712900', '元长', '4', '05', '655', '中国,台湾,云林县,元长乡', 'Yuanchang', '120.315124', '23.649458');
INSERT INTO `tb_region` VALUES ('712937', '四湖乡', '712900', '四湖', '4', '05', '654', '中国,台湾,云林县,四湖乡', 'Sihu', '120.225741', '23.637740');
INSERT INTO `tb_region` VALUES ('712938', '口湖乡', '712900', '口湖', '4', '05', '653', '中国,台湾,云林县,口湖乡', 'Kouhu', '120.185370', '23.582406');
INSERT INTO `tb_region` VALUES ('712939', '水林乡', '712900', '水林', '4', '05', '652', '中国,台湾,云林县,水林乡', 'Shuilin', '120.245948', '23.572634');
INSERT INTO `tb_region` VALUES ('713000', '嘉义县', '710000', '嘉义', '3', '05', '6', '中国,台湾,嘉义县', 'Chiayi', '120.300000', '23.500000');
INSERT INTO `tb_region` VALUES ('713001', '太保市', '713000', '太保', '4', '05', '612', '中国,台湾,嘉义县,太保市', 'Taibao', '120.332876', '23.459647');
INSERT INTO `tb_region` VALUES ('713002', '朴子市', '713000', '朴子', '4', '05', '613', '中国,台湾,嘉义县,朴子市', 'Puzi', '120.247014', '23.464961');
INSERT INTO `tb_region` VALUES ('713023', '布袋镇', '713000', '布袋', '4', '05', '625', '中国,台湾,嘉义县,布袋镇', 'Budai', '120.166936', '23.377979');
INSERT INTO `tb_region` VALUES ('713024', '大林镇', '713000', '大林', '4', '05', '622', '中国,台湾,嘉义县,大林镇', 'Dalin', '120.471336', '23.603815');
INSERT INTO `tb_region` VALUES ('713025', '民雄乡', '713000', '民雄', '4', '05', '621', '中国,台湾,嘉义县,民雄乡', 'Minxiong', '120.428577', '23.551456');
INSERT INTO `tb_region` VALUES ('713026', '溪口乡', '713000', '溪口', '4', '05', '623', '中国,台湾,嘉义县,溪口乡', 'Xikou', '120.393822', '23.602223');
INSERT INTO `tb_region` VALUES ('713027', '新港乡', '713000', '新港', '4', '05', '616', '中国,台湾,嘉义县,新港乡', 'Xingang', '120.347647', '23.551806');
INSERT INTO `tb_region` VALUES ('713028', '六脚乡', '713000', '六脚', '4', '05', '615', '中国,台湾,嘉义县,六脚乡', 'Liujiao', '120.291083', '23.493942');
INSERT INTO `tb_region` VALUES ('713029', '东石乡', '713000', '东石', '4', '05', '614', '中国,台湾,嘉义县,东石乡', 'Dongshi', '120.153822', '23.459235');
INSERT INTO `tb_region` VALUES ('713030', '义竹乡', '713000', '义竹', '4', '05', '624', '中国,台湾,嘉义县,义竹乡', 'Yizhu', '120.243423', '23.336277');
INSERT INTO `tb_region` VALUES ('713031', '鹿草乡', '713000', '鹿草', '4', '05', '611', '中国,台湾,嘉义县,鹿草乡', 'Lucao', '120.308370', '23.410784');
INSERT INTO `tb_region` VALUES ('713032', '水上乡', '713000', '水上', '4', '05', '608', '中国,台湾,嘉义县,水上乡', 'Shuishang', '120.397936', '23.428104');
INSERT INTO `tb_region` VALUES ('713033', '中埔乡', '713000', '中埔', '4', '05', '606', '中国,台湾,嘉义县,中埔乡', 'Zhongpu', '120.522948', '23.425148');
INSERT INTO `tb_region` VALUES ('713034', '竹崎乡', '713000', '竹崎', '4', '05', '604', '中国,台湾,嘉义县,竹崎乡', 'Zhuqi', '120.551466', '23.523184');
INSERT INTO `tb_region` VALUES ('713035', '梅山乡', '713000', '梅山', '4', '05', '603', '中国,台湾,嘉义县,梅山乡', 'Meishan', '120.557192', '23.584915');
INSERT INTO `tb_region` VALUES ('713036', '番路乡', '713000', '番路', '4', '05', '602', '中国,台湾,嘉义县,番路乡', 'Fanlu', '120.555043', '23.465222');
INSERT INTO `tb_region` VALUES ('713037', '大埔乡', '713000', '大埔', '4', '05', '607', '中国,台湾,嘉义县,大埔乡', 'Dapu', '120.593795', '23.296715');
INSERT INTO `tb_region` VALUES ('713038', '阿里山乡', '713000', '阿里山', '4', '05', '605', '中国,台湾,嘉义县,阿里山乡', 'Alishan', '120.732520', '23.467950');
INSERT INTO `tb_region` VALUES ('713300', '屏东县', '710000', '屏东', '3', '08', '9', '中国,台湾,屏东县', 'Pingtung', '120.487928', '22.682802');
INSERT INTO `tb_region` VALUES ('713301', '屏东市', '713300', '屏东', '4', '08', '900', '中国,台湾,屏东县,屏东市', 'Pingdong', '120.488465', '22.669723');
INSERT INTO `tb_region` VALUES ('713321', '潮州镇', '713300', '潮州', '4', '08', '920', '中国,台湾,屏东县,潮州镇', 'Chaozhou', '120.542854', '22.550536');
INSERT INTO `tb_region` VALUES ('713322', '东港镇', '713300', '东港', '4', '08', '928', '中国,台湾,屏东县,东港镇', 'Donggang', '120.454489', '22.466626');
INSERT INTO `tb_region` VALUES ('713323', '恒春镇', '713300', '恒春', '4', '08', '946', '中国,台湾,屏东县,恒春镇', 'Hengchun', '120.745451', '22.002373');
INSERT INTO `tb_region` VALUES ('713324', '万丹乡', '713300', '万丹', '4', '08', '913', '中国,台湾,屏东县,万丹乡', 'Wandan', '120.484533', '22.589839');
INSERT INTO `tb_region` VALUES ('713325', '长治乡', '713300', '长治', '4', '08', '908', '中国,台湾,屏东县,长治乡', 'Changzhi', '120.527614', '22.677062');
INSERT INTO `tb_region` VALUES ('713326', '麟洛乡', '713300', '麟洛', '4', '08', '909', '中国,台湾,屏东县,麟洛乡', 'Linluo', '120.527283', '22.650604');
INSERT INTO `tb_region` VALUES ('713327', '九如乡', '713300', '九如', '4', '08', '904', '中国,台湾,屏东县,九如乡', 'Jiuru', '120.490142', '22.739778');
INSERT INTO `tb_region` VALUES ('713328', '里港乡', '713300', '里港', '4', '08', '905', '中国,台湾,屏东县,里港乡', 'Ligang', '120.494490', '22.779220');
INSERT INTO `tb_region` VALUES ('713329', '盐埔乡', '713300', '盐埔', '4', '08', '907', '中国,台湾,屏东县,盐埔乡', 'Yanpu', '120.572849', '22.754783');
INSERT INTO `tb_region` VALUES ('713330', '高树乡', '713300', '高树', '4', '08', '906', '中国,台湾,屏东县,高树乡', 'Gaoshu', '120.600214', '22.826789');
INSERT INTO `tb_region` VALUES ('713331', '万峦乡', '713300', '万峦', '4', '08', '923', '中国,台湾,屏东县,万峦乡', 'Wanluan', '120.566477', '22.571965');
INSERT INTO `tb_region` VALUES ('713332', '内埔乡', '713300', '内埔', '4', '08', '912', '中国,台湾,屏东县,内埔乡', 'Napu', '120.566865', '22.611967');
INSERT INTO `tb_region` VALUES ('713333', '竹田乡', '713300', '竹田', '4', '08', '911', '中国,台湾,屏东县,竹田乡', 'Zhutian', '120.544038', '22.584678');
INSERT INTO `tb_region` VALUES ('713334', '新埤乡', '713300', '新埤', '4', '08', '925', '中国,台湾,屏东县,新埤乡', 'Xinpi', '120.549546', '22.469976');
INSERT INTO `tb_region` VALUES ('713335', '枋寮乡', '713300', '枋寮', '4', '08', '940', '中国,台湾,屏东县,枋寮乡', 'Fangliao', '120.593438', '22.365560');
INSERT INTO `tb_region` VALUES ('713336', '新园乡', '713300', '新园', '4', '08', '932', '中国,台湾,屏东县,新园乡', 'Xinyuan', '120.461739', '22.543952');
INSERT INTO `tb_region` VALUES ('713337', '崁顶乡', '713300', '崁顶', '4', '08', '924', '中国,台湾,屏东县,崁顶乡', 'Kanding', '120.514571', '22.514795');
INSERT INTO `tb_region` VALUES ('713338', '林边乡', '713300', '林边', '4', '08', '927', '中国,台湾,屏东县,林边乡', 'Linbian', '120.515091', '22.434015');
INSERT INTO `tb_region` VALUES ('713339', '南州乡', '713300', '南州', '4', '08', '926', '中国,台湾,屏东县,南州乡', 'Nanzhou', '120.509808', '22.490192');
INSERT INTO `tb_region` VALUES ('713340', '佳冬乡', '713300', '佳冬', '4', '08', '931', '中国,台湾,屏东县,佳冬乡', 'Jiadong', '120.551544', '22.417653');
INSERT INTO `tb_region` VALUES ('713341', '琉球乡', '713300', '琉球', '4', '08', '929', '中国,台湾,屏东县,琉球乡', 'Liuqiu', '120.369020', '22.342366');
INSERT INTO `tb_region` VALUES ('713342', '车城乡', '713300', '车城', '4', '08', '944', '中国,台湾,屏东县,车城乡', 'Checheng', '120.710979', '22.072077');
INSERT INTO `tb_region` VALUES ('713343', '满州乡', '713300', '满州', '4', '08', '947', '中国,台湾,屏东县,满州乡', 'Manzhou', '120.838843', '22.020853');
INSERT INTO `tb_region` VALUES ('713344', '枋山乡', '713300', '枋山', '4', '08', '941', '中国,台湾,屏东县,枋山乡', 'Fangshan', '120.656356', '22.260338');
INSERT INTO `tb_region` VALUES ('713345', '三地门乡', '713300', '三地门', '4', '08', '901', '中国,台湾,屏东县,三地门乡', 'Sandimen', '120.654486', '22.713877');
INSERT INTO `tb_region` VALUES ('713346', '雾台乡', '713300', '雾台', '4', '08', '902', '中国,台湾,屏东县,雾台乡', 'Wutai', '120.732318', '22.744877');
INSERT INTO `tb_region` VALUES ('713347', '玛家乡', '713300', '玛家', '4', '08', '903', '中国,台湾,屏东县,玛家乡', 'Majia', '120.644130', '22.706718');
INSERT INTO `tb_region` VALUES ('713348', '泰武乡', '713300', '泰武', '4', '08', '921', '中国,台湾,屏东县,泰武乡', 'Taiwu', '120.632856', '22.591819');
INSERT INTO `tb_region` VALUES ('713349', '来义乡', '713300', '来义', '4', '08', '922', '中国,台湾,屏东县,来义乡', 'Laiyi', '120.633601', '22.525866');
INSERT INTO `tb_region` VALUES ('713350', '春日乡', '713300', '春日', '4', '08', '942', '中国,台湾,屏东县,春日乡', 'Chunri', '120.628793', '22.370672');
INSERT INTO `tb_region` VALUES ('713351', '狮子乡', '713300', '狮子', '4', '08', '943', '中国,台湾,屏东县,狮子乡', 'Shizi', '120.704617', '22.201917');
INSERT INTO `tb_region` VALUES ('713352', '牡丹乡', '713300', '牡丹', '4', '08', '945', '中国,台湾,屏东县,牡丹乡', 'Mudan', '120.770108', '22.125687');
INSERT INTO `tb_region` VALUES ('713400', '台东县', '710000', '台东', '3', '089', '9', '中国,台湾,台东县', 'Taitung', '120.916000', '23.000000');
INSERT INTO `tb_region` VALUES ('713401', '台东市', '713400', '台东', '4', '089', '950', '中国,台湾,台东县,台东市', 'Taidong', '121.145654', '22.756045');
INSERT INTO `tb_region` VALUES ('713421', '成功镇', '713400', '成功', '4', '089', '961', '中国,台湾,台东县,成功镇', 'Chenggong', '121.379571', '23.100223');
INSERT INTO `tb_region` VALUES ('713422', '关山镇', '713400', '关山', '4', '089', '956', '中国,台湾,台东县,关山镇', 'Guanshan', '121.163134', '23.047450');
INSERT INTO `tb_region` VALUES ('713423', '卑南乡', '713400', '卑南', '4', '089', '954', '中国,台湾,台东县,卑南乡', 'Beinan', '121.083503', '22.786039');
INSERT INTO `tb_region` VALUES ('713424', '鹿野乡', '713400', '鹿野', '4', '089', '955', '中国,台湾,台东县,鹿野乡', 'Luye', '121.135982', '22.913951');
INSERT INTO `tb_region` VALUES ('713425', '池上乡', '713400', '池上', '4', '089', '958', '中国,台湾,台东县,池上乡', 'Chishang', '121.215139', '23.122393');
INSERT INTO `tb_region` VALUES ('713426', '东河乡', '713400', '东河', '4', '089', '959', '中国,台湾,台东县,东河乡', 'Donghe', '121.300334', '22.969934');
INSERT INTO `tb_region` VALUES ('713427', '长滨乡', '713400', '长滨', '4', '089', '962', '中国,台湾,台东县,长滨乡', 'Changbin', '121.451522', '23.315041');
INSERT INTO `tb_region` VALUES ('713428', '太麻里乡', '713400', '太麻里', '4', '089', '963', '中国,台湾,台东县,太麻里乡', 'Taimali', '121.007394', '22.615383');
INSERT INTO `tb_region` VALUES ('713429', '大武乡', '713400', '大武', '4', '089', '965', '中国,台湾,台东县,大武乡', 'Dawu', '120.889938', '22.339919');
INSERT INTO `tb_region` VALUES ('713430', '绿岛乡', '713400', '绿岛', '4', '089', '951', '中国,台湾,台东县,绿岛乡', 'Lvdao', '121.492596', '22.661676');
INSERT INTO `tb_region` VALUES ('713431', '海端乡', '713400', '海端', '4', '089', '957', '中国,台湾,台东县,海端乡', 'Haiduan', '121.172008', '23.101074');
INSERT INTO `tb_region` VALUES ('713432', '延平乡', '713400', '延平', '4', '089', '953', '中国,台湾,台东县,延平乡', 'Yanping', '121.084499', '22.902358');
INSERT INTO `tb_region` VALUES ('713433', '金峰乡', '713400', '金峰', '4', '089', '964', '中国,台湾,台东县,金峰乡', 'Jinfeng', '120.971292', '22.595511');
INSERT INTO `tb_region` VALUES ('713434', '达仁乡', '713400', '达仁', '4', '089', '966', '中国,台湾,台东县,达仁乡', 'Daren', '120.884131', '22.294869');
INSERT INTO `tb_region` VALUES ('713435', '兰屿乡', '713400', '兰屿', '4', '089', '952', '中国,台湾,台东县,兰屿乡', 'Lanyu', '121.532473', '22.056736');
INSERT INTO `tb_region` VALUES ('713500', '花莲县', '710000', '花莲', '3', '03', '9', '中国,台湾,花莲县', 'Hualien', '121.300000', '23.830000');
INSERT INTO `tb_region` VALUES ('713501', '花莲市', '713500', '花莲', '4', '03', '970', '中国,台湾,花莲县,花莲市', 'Hualian', '121.606810', '23.982074');
INSERT INTO `tb_region` VALUES ('713521', '凤林镇', '713500', '凤林', '4', '03', '975', '中国,台湾,花莲县,凤林镇', 'Fenglin', '121.451687', '23.744648');
INSERT INTO `tb_region` VALUES ('713522', '玉里镇', '713500', '玉里', '4', '03', '981', '中国,台湾,花莲县,玉里镇', 'Yuli', '121.316445', '23.336509');
INSERT INTO `tb_region` VALUES ('713523', '新城乡', '713500', '新城', '4', '03', '971', '中国,台湾,花莲县,新城乡', 'Xincheng', '121.640512', '24.128133');
INSERT INTO `tb_region` VALUES ('713524', '吉安乡', '713500', '吉安', '4', '03', '973', '中国,台湾,花莲县,吉安乡', 'Ji\'an', '121.568005', '23.961635');
INSERT INTO `tb_region` VALUES ('713525', '寿丰乡', '713500', '寿丰', '4', '03', '974', '中国,台湾,花莲县,寿丰乡', 'Shoufeng', '121.508955', '23.870680');
INSERT INTO `tb_region` VALUES ('713526', '光复乡', '713500', '光复', '4', '03', '976', '中国,台湾,花莲县,光复乡', 'Guangfu', '121.423496', '23.669084');
INSERT INTO `tb_region` VALUES ('713527', '丰滨乡', '713500', '丰滨', '4', '03', '977', '中国,台湾,花莲县,丰滨乡', 'Fengbin', '121.518639', '23.597080');
INSERT INTO `tb_region` VALUES ('713528', '瑞穗乡', '713500', '瑞穗', '4', '03', '978', '中国,台湾,花莲县,瑞穗乡', 'Ruisui', '121.375992', '23.496817');
INSERT INTO `tb_region` VALUES ('713529', '富里乡', '713500', '富里', '4', '03', '983', '中国,台湾,花莲县,富里乡', 'Fuli', '121.250124', '23.179984');
INSERT INTO `tb_region` VALUES ('713530', '秀林乡', '713500', '秀林', '4', '03', '972', '中国,台湾,花莲县,秀林乡', 'Xiulin', '121.620381', '24.116642');
INSERT INTO `tb_region` VALUES ('713531', '万荣乡', '713500', '万荣', '4', '03', '979', '中国,台湾,花莲县,万荣乡', 'Wanrong', '121.407493', '23.715346');
INSERT INTO `tb_region` VALUES ('713532', '卓溪乡', '713500', '卓溪', '4', '03', '982', '中国,台湾,花莲县,卓溪乡', 'Zhuoxi', '121.303422', '23.346369');
INSERT INTO `tb_region` VALUES ('713600', '澎湖县', '710000', '澎湖', '3', '06', '8', '中国,台湾,澎湖县', 'Penghu', '119.566417', '23.569733');
INSERT INTO `tb_region` VALUES ('713601', '马公市', '713600', '马公', '4', '06', '880', '中国,台湾,澎湖县,马公市', 'Magong', '119.566499', '23.565845');
INSERT INTO `tb_region` VALUES ('713621', '湖西乡', '713600', '湖西', '4', '06', '885', '中国,台湾,澎湖县,湖西乡', 'Huxi', '119.659666', '23.583358');
INSERT INTO `tb_region` VALUES ('713622', '白沙乡', '713600', '白沙', '4', '06', '884', '中国,台湾,澎湖县,白沙乡', 'Baisha', '119.597919', '23.666060');
INSERT INTO `tb_region` VALUES ('713623', '西屿乡', '713600', '西屿', '4', '06', '881', '中国,台湾,澎湖县,西屿乡', 'Xiyu', '119.506974', '23.600836');
INSERT INTO `tb_region` VALUES ('713624', '望安乡', '713600', '望安', '4', '06', '882', '中国,台湾,澎湖县,望安乡', 'Wang\'an', '119.500538', '23.357531');
INSERT INTO `tb_region` VALUES ('713625', '七美乡', '713600', '七美', '4', '06', '883', '中国,台湾,澎湖县,七美乡', 'Qimei', '119.423929', '23.206018');
INSERT INTO `tb_region` VALUES ('713700', '金门县', '710000', '金门', '3', '082', '8', '中国,台湾,金门县', 'Jinmen', '118.317089', '24.432706');
INSERT INTO `tb_region` VALUES ('713701', '金城镇', '713700', '金城', '4', '082', '893', '中国,台湾,金门县,金城镇', 'Jincheng', '118.316667', '24.416667');
INSERT INTO `tb_region` VALUES ('713702', '金湖镇', '713700', '金湖', '4', '082', '891', '中国,台湾,金门县,金湖镇', 'Jinhu', '118.419743', '24.438633');
INSERT INTO `tb_region` VALUES ('713703', '金沙镇', '713700', '金沙', '4', '082', '890', '中国,台湾,金门县,金沙镇', 'Jinsha', '118.427993', '24.481109');
INSERT INTO `tb_region` VALUES ('713704', '金宁乡', '713700', '金宁', '4', '082', '892', '中国,台湾,金门县,金宁乡', 'Jinning', '118.334506', '24.45672');
INSERT INTO `tb_region` VALUES ('713705', '烈屿乡', '713700', '烈屿', '4', '082', '894', '中国,台湾,金门县,烈屿乡', 'Lieyu', '118.247255', '24.433102');
INSERT INTO `tb_region` VALUES ('713706', '乌丘乡', '713700', '乌丘', '4', '082', '896', '中国,台湾,金门县,乌丘乡', 'Wuqiu', '118.319578', '24.435038');
INSERT INTO `tb_region` VALUES ('713800', '连江县', '710000', '连江', '3', '0836', '2', '中国,台湾,连江县', 'Lienchiang', '119.539704', '26.197364');
INSERT INTO `tb_region` VALUES ('713801', '南竿乡', '713800', '南竿', '4', '0836', '209', '中国,台湾,连江县,南竿乡', 'Nangan', '119.944267', '26.144035');
INSERT INTO `tb_region` VALUES ('713802', '北竿乡', '713800', '北竿', '4', '0836', '210', '中国,台湾,连江县,北竿乡', 'Beigan', '120.000572', '26.221983');
INSERT INTO `tb_region` VALUES ('713803', '莒光乡', '713800', '莒光', '4', '0836', '211', '中国,台湾,连江县,莒光乡', 'Juguang', '119.940405', '25.976256');
INSERT INTO `tb_region` VALUES ('713804', '东引乡', '713800', '东引', '4', '0836', '212', '中国,台湾,连江县,东引乡', 'Dongyin', '120.493955', '26.366164');
INSERT INTO `tb_region` VALUES ('810000', '香港特别行政区', '100008', '香港', '2', '', '', '中国,香港特别行政区', 'Hong Kong', '114.173355', '22.320048');
INSERT INTO `tb_region` VALUES ('810100', '香港岛', '810000', '香港岛', '3', '00852', '999077', '中国,香港特别行政区,香港岛', 'Hong Kong Island', '114.177314', '22.266416');
INSERT INTO `tb_region` VALUES ('810101', '中西区', '810100', '中西区', '4', '00852', '999077', '中国,香港特别行政区,香港岛,中西区', 'Central and Western District', '114.154374', '22.281981');
INSERT INTO `tb_region` VALUES ('810102', '湾仔区', '810100', '湾仔区', '4', '00852', '999077', '中国,香港特别行政区,香港岛,湾仔区', 'Wan Chai District', '114.182915', '22.276389');
INSERT INTO `tb_region` VALUES ('810103', '东区', '810100', '东区', '4', '00852', '999077', '中国,香港特别行政区,香港岛,东区', 'Eastern District', '114.255993', '22.262755');
INSERT INTO `tb_region` VALUES ('810104', '南区', '810100', '南区', '4', '00852', '999077', '中国,香港特别行政区,香港岛,南区', 'Southern District', '114.174134', '22.24676');
INSERT INTO `tb_region` VALUES ('810200', '九龙', '810000', '九龙', '3', '00852', '999077', '中国,香港特别行政区,九龙', 'Kowloon', '114.17495', '22.327115');
INSERT INTO `tb_region` VALUES ('810201', '油尖旺区', '810200', '油尖旺', '4', '00852', '999077', '中国,香港特别行政区,九龙,油尖旺区', 'Yau Tsim Mong', '114.173332', '22.311704');
INSERT INTO `tb_region` VALUES ('810202', '深水埗区', '810200', '深水埗', '4', '00852', '999077', '中国,香港特别行政区,九龙,深水埗区', 'Sham Shui Po', '114.16721', '22.328171');
INSERT INTO `tb_region` VALUES ('810203', '九龙城区', '810200', '九龙城', '4', '00852', '999077', '中国,香港特别行政区,九龙,九龙城区', 'Jiulongcheng', '114.195053', '22.32673');
INSERT INTO `tb_region` VALUES ('810204', '黄大仙区', '810200', '黄大仙', '4', '00852', '999077', '中国,香港特别行政区,九龙,黄大仙区', 'Wong Tai Sin', '114.19924', '22.336313');
INSERT INTO `tb_region` VALUES ('810205', '观塘区', '810200', '观塘', '4', '00852', '999077', '中国,香港特别行政区,九龙,观塘区', 'Kwun Tong', '114.231268', '22.30943');
INSERT INTO `tb_region` VALUES ('810300', '新界', '810000', '新界', '3', '00852', '999077', '中国,香港特别行政区,新界', 'New Territories', '114.202408', '22.341766');
INSERT INTO `tb_region` VALUES ('810301', '荃湾区', '810300', '荃湾', '4', '00852', '999077', '中国,香港特别行政区,新界,荃湾区', 'Tsuen Wan', '114.122952', '22.370973');
INSERT INTO `tb_region` VALUES ('810302', '屯门区', '810300', '屯门', '4', '00852', '999077', '中国,香港特别行政区,新界,屯门区', 'Tuen Mun', '113.977416', '22.391047');
INSERT INTO `tb_region` VALUES ('810303', '元朗区', '810300', '元朗', '4', '00852', '999077', '中国,香港特别行政区,新界,元朗区', 'Yuen Long', '114.039796', '22.443342');
INSERT INTO `tb_region` VALUES ('810304', '北区', '810300', '北区', '4', '00852', '999077', '中国,香港特别行政区,新界,北区', 'North District', '114.148959', '22.494086');
INSERT INTO `tb_region` VALUES ('810305', '大埔区', '810300', '大埔', '4', '00852', '999077', '中国,香港特别行政区,新界,大埔区', 'Tai Po', '114.171743', '22.445653');
INSERT INTO `tb_region` VALUES ('810306', '西贡区', '810300', '西贡', '4', '00852', '999077', '中国,香港特别行政区,新界,西贡区', 'Sai Kung', '114.27854', '22.37944');
INSERT INTO `tb_region` VALUES ('810307', '沙田区', '810300', '沙田', '4', '00852', '999077', '中国,香港特别行政区,新界,沙田区', 'Sha Tin', '114.191941', '22.379294');
INSERT INTO `tb_region` VALUES ('810308', '葵青区', '810300', '葵青', '4', '00852', '999077', '中国,香港特别行政区,新界,葵青区', 'Kwai Tsing', '114.13932', '22.363877');
INSERT INTO `tb_region` VALUES ('810309', '离岛区', '810300', '离岛', '4', '00852', '999077', '中国,香港特别行政区,新界,离岛区', 'Outlying Islands', '113.945842', '22.281508');
INSERT INTO `tb_region` VALUES ('820000', '澳门特别行政区', '100008', '澳门', '2', '', '', '中国,澳门特别行政区', 'Macau', '113.54909', '22.198951');
INSERT INTO `tb_region` VALUES ('820100', '澳门半岛', '820000', '澳门半岛', '3', '00853', '999078', '中国,澳门特别行政区,澳门半岛', 'MacauPeninsula', '113.549134', '22.198751');
INSERT INTO `tb_region` VALUES ('820101', '花地玛堂区', '820100', '花地玛堂区', '4', '00853', '999078', '中国,澳门特别行政区,澳门半岛,花地玛堂区', 'Nossa Senhora de Fatima', '113.552284', '22.208067');
INSERT INTO `tb_region` VALUES ('820102', '圣安多尼堂区', '820100', '圣安多尼堂区', '4', '00853', '999078', '中国,澳门特别行政区,澳门半岛,圣安多尼堂区', 'Santo Antonio', '113.564301', '22.12381');
INSERT INTO `tb_region` VALUES ('820103', '大堂区', '820100', '大堂', '4', '00853', '999078', '中国,澳门特别行政区,澳门半岛,大堂区', 'Sé', '113.552971', '22.188359');
INSERT INTO `tb_region` VALUES ('820104', '望德堂区', '820100', '望德堂区', '4', '00853', '999078', '中国,澳门特别行政区,澳门半岛,望德堂区', 'Sao Lazaro', '113.550568', '22.194081');
INSERT INTO `tb_region` VALUES ('820105', '风顺堂区', '820100', '风顺堂区', '4', '00853', '999078', '中国,澳门特别行政区,澳门半岛,风顺堂区', 'Sao Lourenco', '113.541928', '22.187368');
INSERT INTO `tb_region` VALUES ('820200', '氹仔岛', '820000', '氹仔岛', '3', '00853', '999078', '中国,澳门特别行政区,氹仔岛', 'Taipa', '113.577669', '22.156838');
INSERT INTO `tb_region` VALUES ('820201', '嘉模堂区', '820200', '嘉模堂区', '4', '00853', '999078', '中国,澳门特别行政区,氹仔岛,嘉模堂区', 'Our Lady Of Carmel\'s Parish', '113.565303', '22.149029');
INSERT INTO `tb_region` VALUES ('820300', '路环岛', '820000', '路环岛', '3', '00853', '999078', '中国,澳门特别行政区,路环岛', 'Coloane', '113.564857', '22.116226');
INSERT INTO `tb_region` VALUES ('820301', '圣方济各堂区', '820300', '圣方济各堂区', '4', '00853', '999078', '中国,澳门特别行政区,路环岛,圣方济各堂区', 'St Francis Xavier\'s Parish', '113.559954', '22.123486');
