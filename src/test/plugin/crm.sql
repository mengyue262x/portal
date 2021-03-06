/*
Navicat MySQL Data Transfer

Source Server         : crm
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : crm

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2016-08-28 18:00:40
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `customer_culture_info`
-- ----------------------------
DROP TABLE IF EXISTS `customer_culture_info`;
CREATE TABLE `customer_culture_info` (
  `id` varchar(16) COLLATE utf8_bin NOT NULL,
  `culture_name` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `account_date` date DEFAULT NULL,
  `bank_flag` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否银商绑定',
  `customer_name` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `phone` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `code` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '会员代码',
  `update_flag` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户文交所信息表';

-- ----------------------------
-- Records of customer_culture_info
-- ----------------------------

-- ----------------------------
-- Table structure for `customer_info`
-- ----------------------------
DROP TABLE IF EXISTS `customer_info`;
CREATE TABLE `customer_info` (
  `id` varchar(16) COLLATE utf8_bin NOT NULL,
  `type` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '客户分类\n0 空白客户\n1 重复登门\n2说明会\n3成单\n4锁定\n',
  `season2` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `season3` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `season4` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `phone_staff_id` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `receiver_staff_id` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `business_phone` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `phone` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `visit_date` date DEFAULT NULL,
  `area` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `phone2` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `relation_id` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `qq` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `msn` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `site` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `id_card` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `product` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '产品',
  `transaction_amount` decimal(10,0) DEFAULT NULL,
  `recent_visit_date` datetime DEFAULT NULL,
  `recent_export_date` datetime DEFAULT NULL,
  `blacklist_flag` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  `update_flag` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否更新标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户信息表';

-- ----------------------------
-- Records of customer_info
-- ----------------------------

-- ----------------------------
-- Table structure for `employee_info`
-- ----------------------------
DROP TABLE IF EXISTS `employee_info`;
CREATE TABLE `employee_info` (
  `id` varchar(16) COLLATE utf8_bin NOT NULL COMMENT '主键',
  `group_id` varchar(16) COLLATE utf8_bin NOT NULL,
  `name` varchar(8) COLLATE utf8_bin DEFAULT NULL,
  `login_name` varchar(20) COLLATE utf8_bin NOT NULL,
  `password` varchar(20) COLLATE utf8_bin NOT NULL,
  `reception_flag` varchar(1) COLLATE utf8_bin DEFAULT '0' COMMENT '接待标示(0未接待 1 正在接待)',
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `delete_flag` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='员工信息表';

-- ----------------------------
-- Records of employee_info
-- ----------------------------

-- ----------------------------
-- Table structure for `goods_info`
-- ----------------------------
DROP TABLE IF EXISTS `goods_info`;
CREATE TABLE `goods_info` (
  `id` varchar(16) COLLATE utf8_bin NOT NULL,
  `sort_id` varchar(16) COLLATE utf8_bin NOT NULL COMMENT '种类ID',
  `type` varchar(5) COLLATE utf8_bin DEFAULT NULL COMMENT '商品类型 0:常规商品 1：礼品 2：配售 3：配送 4:兑换',
  `code` varchar(5) COLLATE utf8_bin DEFAULT NULL COMMENT '商品序号',
  `name` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '产品名称',
  `amount` int(11) DEFAULT NULL COMMENT '数量',
  `trusteeship_flag` varchar(1) COLLATE utf8_bin DEFAULT '0' COMMENT '是否可托管',
  `repurchase_flag` varchar(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '回购标志',
  `repurchase_info` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '回购信息',
  `repurchase_starttime` date DEFAULT NULL COMMENT '回购开始时间',
  `repurchase_endtime` date DEFAULT NULL COMMENT '回购结束时间',
  `create_date` date DEFAULT NULL COMMENT '创建日期',
  `update_date` date DEFAULT NULL COMMENT '更新日期',
  `create_userid` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人id',
  `update_userid` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '更新人id',
  `delete_flag` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '删除标志 0正常 1删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='商品信息表';

-- ----------------------------
-- Records of goods_info
-- ----------------------------

-- ----------------------------
-- Table structure for `goods_sort`
-- ----------------------------
DROP TABLE IF EXISTS `goods_sort`;
CREATE TABLE `goods_sort` (
  `id` varchar(16) COLLATE utf8_bin NOT NULL,
  `parents_id` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `description` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='商品分类表';

-- ----------------------------
-- Records of goods_sort
-- ----------------------------

-- ----------------------------
-- Table structure for `group_info`
-- ----------------------------
DROP TABLE IF EXISTS `group_info`;
CREATE TABLE `group_info` (
  `id` varchar(16) COLLATE utf8_bin NOT NULL,
  `parents_id` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '上级ID',
  `name` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='组织结构表';

-- ----------------------------
-- Records of group_info
-- ----------------------------

-- ----------------------------
-- Table structure for `order_detail_info`
-- ----------------------------
DROP TABLE IF EXISTS `order_detail_info`;
CREATE TABLE `order_detail_info` (
  `id` varchar(16) COLLATE utf8_bin NOT NULL,
  `order_id` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '订单ID',
  `good_sort_id` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '商品类型ID',
  `good_sort_name` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '商品类型名称',
  `good_id` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '商品ID',
  `good_type` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '商品类型（同good_info type）',
  `good_name` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '商品名称',
  `price` decimal(10,0) DEFAULT NULL COMMENT '价格',
  `amount` int(11) DEFAULT NULL COMMENT '数量 如果退货数量为负',
  `delete_flag` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '删除标志 0正常 1删除',
  `update_date` datetime DEFAULT NULL COMMENT '更新日期',
  `update_id` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '更新人员id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='订单详情表';

-- ----------------------------
-- Records of order_detail_info
-- ----------------------------

-- ----------------------------
-- Table structure for `order_info`
-- ----------------------------
DROP TABLE IF EXISTS `order_info`;
CREATE TABLE `order_info` (
  `id` varchar(16) COLLATE utf8_bin NOT NULL,
  `customer_id` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `phone_staff_id` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `receiver_staff_id` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `status` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '订单状态 : 0未支付 1已支付 2已出库 3文交所已审核 4 已完成',
  `order_type` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '订单类型 1正常 2退货 3换货',
  `pay_type` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '支付类型  0全额支付 1定金支付 2派送支付',
  `pay_price` decimal(10,0) DEFAULT NULL COMMENT '订单金额',
  `actual_price` decimal(10,0) DEFAULT NULL COMMENT '实际支付金额',
  `finance_flag` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '支付状态(财务审核标志)\n0 未支付\n1已支付',
  `finance_type` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '支付接口\n接口1 接口2 微信支付等.',
  `finance_operator_id` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '财务审批人员',
  `finance_date` datetime DEFAULT NULL,
  `warehouse_flag` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '仓库审批标志\n0未审核\n1 已审核',
  `warehouse_operator_id` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `warehouse_date` datetime DEFAULT NULL,
  `culture_flag` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  `culture_operator_id` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `culture_date` datetime DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_id` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_id` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='订单表';

-- ----------------------------
-- Records of order_info
-- ----------------------------

-- ----------------------------
-- Table structure for `permission_info`
-- ----------------------------
DROP TABLE IF EXISTS `permission_info`;
CREATE TABLE `permission_info` (
  `id` varchar(16) COLLATE utf8_bin NOT NULL,
  `menu_url` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '菜单url',
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='权限表';

-- ----------------------------
-- Records of permission_info
-- ----------------------------

-- ----------------------------
-- Table structure for `reception_info`
-- ----------------------------
DROP TABLE IF EXISTS `reception_info`;
CREATE TABLE `reception_info` (
  `id` varchar(16) COLLATE utf8_bin NOT NULL,
  `customer_id` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `receiver_staff_id` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='日常接待表';

-- ----------------------------
-- Records of reception_info
-- ----------------------------

-- ----------------------------
-- Table structure for `report_good`
-- ----------------------------
DROP TABLE IF EXISTS `report_good`;
CREATE TABLE `report_good` (
  `id` varchar(16) COLLATE utf8_bin NOT NULL,
  `good_id` varchar(16) COLLATE utf8_bin DEFAULT NULL COMMENT '商品id',
  `good_type` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '商品类型',
  `good_name` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '商品名称',
  `amount` int(11) DEFAULT NULL COMMENT '商品数量',
  `price` decimal(10,0) DEFAULT NULL COMMENT '单价',
  `order_id` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='每日产品报表';

-- ----------------------------
-- Records of report_good
-- ----------------------------

-- ----------------------------
-- Table structure for `report_track`
-- ----------------------------
DROP TABLE IF EXISTS `report_track`;
CREATE TABLE `report_track` (
  `id` varchar(16) COLLATE utf8_bin NOT NULL,
  `report_date` datetime DEFAULT NULL COMMENT '客户id',
  `customer_type` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '客户类型 :0锁定 1 成单 2重复登门 3新登门 4说明会\n',
  `vistor_count` int(11) DEFAULT NULL COMMENT '登门数量',
  `order_amount` int(11) DEFAULT NULL COMMENT '成单数',
  `order_price` decimal(10,0) DEFAULT NULL COMMENT '成单金额',
  `new_change_customer` int(11) DEFAULT NULL COMMENT '新客户总数',
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='每日业绩报表';

-- ----------------------------
-- Records of report_track
-- ----------------------------

-- ----------------------------
-- Table structure for `role_info`
-- ----------------------------
DROP TABLE IF EXISTS `role_info`;
CREATE TABLE `role_info` (
  `id` varchar(16) COLLATE utf8_bin NOT NULL,
  `name` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `description` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色信息表';

-- ----------------------------
-- Records of role_info
-- ----------------------------

-- ----------------------------
-- Table structure for `role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `id` varchar(16) COLLATE utf8_bin NOT NULL,
  `role_id` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `permission_id` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色权限关联表';

-- ----------------------------
-- Records of role_permission
-- ----------------------------

-- ----------------------------
-- Table structure for `user_role`
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` varchar(16) COLLATE utf8_bin NOT NULL,
  `user_id` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  `role_id` varchar(16) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户角色关联表';

-- ----------------------------
-- Records of user_role
-- ----------------------------
