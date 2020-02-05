/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50716
Source Host           : 127.0.0.1:3306
Source Database       : screen

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2020-02-05 22:06:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_captcha
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
INSERT INTO `sys_captcha` VALUES ('a241ce03-df2b-46f7-8354-301e67f2e186', 'by863', '2020-02-04 09:44:36');
INSERT INTO `sys_captcha` VALUES ('fdcbc030-d484-40bb-8020-e115d4e2ac63', 'dd24d', '2020-02-02 15:50:05');

-- ----------------------------
-- Table structure for sys_config
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
-- Table structure for sys_dict_data
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
-- Table structure for sys_dict_type
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
-- Table structure for sys_log
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
-- Table structure for sys_menu
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
-- Table structure for sys_role
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
-- Table structure for sys_role_menu
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
-- Table structure for sys_user
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
-- Table structure for sys_user_role
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
-- Table structure for sys_user_token
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
INSERT INTO `sys_user_token` VALUES ('1', '3d392f1fc314f532accd59f1c464ceab', '2020-02-06 08:09:51', '2020-02-05 20:09:51');

-- ----------------------------
-- Table structure for tb_account
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
-- Table structure for tb_account_cache
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
-- Table structure for tb_ad
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_ad
-- ----------------------------

-- ----------------------------
-- Table structure for tb_ad_position
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
-- Table structure for tb_device
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='设备信息表';

-- ----------------------------
-- Records of tb_device
-- ----------------------------
INSERT INTO `tb_device` VALUES ('1', '12323000', '1', '1', '百度', 'ERFD345234234234', '1', null, '', '0', '2020-02-05 21:44:00', '2020-02-05 21:59:05', '1');

-- ----------------------------
-- Table structure for tb_distributor
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='经销商信息表';

-- ----------------------------
-- Records of tb_distributor
-- ----------------------------
INSERT INTO `tb_distributor` VALUES ('1', '百度', '广东省深圳市南山区', '李彦宏', '17855555555', '635642897@qq.com', 'ERFD345234234234', '1', '2020-02-05 20:47:33', '2020-02-05 21:05:10', '1');

-- ----------------------------
-- Table structure for tb_email_code
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
-- Table structure for tb_goods
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
-- Table structure for tb_goods_img
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
-- Table structure for tb_goods_type
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
-- Table structure for tb_phone_model
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
-- Table structure for tb_push_msg
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
-- Table structure for tb_push_record
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
