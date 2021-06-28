/*
 Navicat Premium Data Transfer

 Source Server         : 腾讯云
 Source Server Type    : MySQL
 Source Server Version : 50733
 Source Host           : 119.29.159.73:3306
 Source Schema         : psychology_mgr

 Target Server Type    : MySQL
 Target Server Version : 50733
 File Encoding         : 65001

 Date: 28/06/2021 18:45:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for QRTZ_BLOB_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `BLOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `SCHED_NAME`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_BLOB_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CALENDARS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_CALENDARS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CRON_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CRON_EXPRESSION` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TIME_ZONE_ID` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_CRON_TRIGGERS
-- ----------------------------
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', '0 0/30 * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for QRTZ_FIRED_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ENTRY_ID` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `ENTRY_ID`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TRIG_INST_NAME`(`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY`(`SCHED_NAME`, `INSTANCE_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_FT_J_G`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_T_G`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TG`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_FIRED_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_JOB_DETAILS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_DURABLE` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_UPDATE_DATA` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_J_REQ_RECOVERY`(`SCHED_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_J_GRP`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_JOB_DETAILS
-- ----------------------------
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', NULL, 'com.shangcheng.psychology.modules.job.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372003E636F6D2E7368616E676368656E672E70737963686F6C6F67792E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200074C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017A08C00D907874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672656E72656E74000CE58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);

-- ----------------------------
-- Table structure for QRTZ_LOCKS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LOCK_NAME` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `LOCK_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------
INSERT INTO `QRTZ_LOCKS` VALUES ('RenrenScheduler', 'STATE_ACCESS');
INSERT INTO `QRTZ_LOCKS` VALUES ('RenrenScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SCHEDULER_STATE
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SCHEDULER_STATE
-- ----------------------------
INSERT INTO `QRTZ_SCHEDULER_STATE` VALUES ('RenrenScheduler', 'VM-8-13-centos1624850045642', 1624877126672, 15000);

-- ----------------------------
-- Table structure for QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SIMPLE_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `STR_PROP_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR_PROP_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR_PROP_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `INT_PROP_1` int(11) NULL DEFAULT NULL,
  `INT_PROP_2` int(11) NULL DEFAULT NULL,
  `LONG_PROP_1` bigint(20) NULL DEFAULT NULL,
  `LONG_PROP_2` bigint(20) NULL DEFAULT NULL,
  `DEC_PROP_1` decimal(13, 4) NULL DEFAULT NULL,
  `DEC_PROP_2` decimal(13, 4) NULL DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SIMPROP_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) NULL DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) NULL DEFAULT NULL,
  `PRIORITY` int(11) NULL DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_TYPE` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) NULL DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) NULL DEFAULT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_J`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_C`(`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_T_G`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_STATE`(`SCHED_NAME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_STATE`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_G_STATE`(`SCHED_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NEXT_FIRE_TIME`(`SCHED_NAME`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST`(`SCHED_NAME`, `TRIGGER_STATE`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `QRTZ_JOB_DETAILS` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_TRIGGERS
-- ----------------------------
INSERT INTO `QRTZ_TRIGGERS` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', 'TASK_1', 'DEFAULT', NULL, 1624878000000, 1624876200000, 5, 'WAITING', 'CRON', 1623728560000, 0, NULL, 2, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372003E636F6D2E7368616E676368656E672E70737963686F6C6F67792E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200074C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017A08C00D907874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672656E72656E74000CE58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);

-- ----------------------------
-- Table structure for announcement
-- ----------------------------
DROP TABLE IF EXISTS `announcement`;
CREATE TABLE `announcement`  (
  `announcement_id` int(9) NOT NULL AUTO_INCREMENT COMMENT '公告id',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '公告标题',
  `context` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '公告的内容',
  `creater_id` bigint(20) NULL DEFAULT NULL COMMENT '公告的创建者id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '公告发布时间',
  `is_active` int(1) NULL DEFAULT NULL COMMENT '0 不显示，1显示',
  `priority` int(2) NULL DEFAULT NULL COMMENT '优先级，实现置顶等功能',
  PRIMARY KEY (`announcement_id`) USING BTREE,
  INDEX `creater_id`(`creater_id`) USING BTREE,
  CONSTRAINT `announcement_ibfk_1` FOREIGN KEY (`creater_id`) REFERENCES `sys_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '公告面板，发布通知' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of announcement
-- ----------------------------

-- ----------------------------
-- Table structure for archive
-- ----------------------------
DROP TABLE IF EXISTS `archive`;
CREATE TABLE `archive`  (
  `archives_id` int(9) NOT NULL AUTO_INCREMENT COMMENT '咨询者的一次完整咨询，一次完整咨询包含多次记录',
  `client_id` bigint(20) NOT NULL COMMENT '本次咨询的，来访者的id',
  `doctor_id` bigint(20) NOT NULL COMMENT '本次咨询的，咨询师的id',
  `client_description` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '无' COMMENT '申请人的主观描述',
  `doctor_description` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '无' COMMENT '医生描述',
  `apply_time` datetime(0) NOT NULL COMMENT '申请时间',
  `status` int(1) NOT NULL DEFAULT 0 COMMENT '-1 失败，0 申请中，1 申请成功，2 结束',
  PRIMARY KEY (`archives_id`) USING BTREE,
  INDEX `client_archive_ibfk_1`(`client_id`) USING BTREE,
  INDEX `doctor_id`(`doctor_id`) USING BTREE,
  CONSTRAINT `client_archive_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `client_archive_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`doctor_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '来访者的一次咨询的档案' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of archive
-- ----------------------------
INSERT INTO `archive` VALUES (1, 2, 3, '最近心情不好', '可以当面说下具体遇到了什么事情', '2021-06-24 20:08:53', -1);
INSERT INTO `archive` VALUES (2, 2, 3, '心情太差', '无', '2021-07-02 11:50:39', 1);
INSERT INTO `archive` VALUES (3, 2, 4, '最近失恋了', '可以看电影听音乐转移注意力', '2021-06-25 12:16:58', 1);
INSERT INTO `archive` VALUES (4, 2, 3, '成绩不理想', '可以多进行些运动来放松下', '2021-06-25 12:16:58', -1);
INSERT INTO `archive` VALUES (14, 2, 4, '找不到想做的事', '无', '2021-06-27 11:56:19', 1);
INSERT INTO `archive` VALUES (23, 2, 3, '篮球比赛输了', '无', '2021-06-27 12:10:32', 0);
INSERT INTO `archive` VALUES (24, 2, 4, '没交作业被老师批评了', '无', '2021-06-27 12:10:52', 0);
INSERT INTO `archive` VALUES (25, 2, 3, '和父母意见不和', '恩', '2021-06-27 12:12:11', 0);
INSERT INTO `archive` VALUES (26, 2, 4, '总是感到焦虑', '无', '2021-06-27 20:56:24', 0);
INSERT INTO `archive` VALUES (27, 5, 3, '压力太大', '无', '2021-06-27 23:22:09', 0);
INSERT INTO `archive` VALUES (28, 3, 3, '喜欢的球队被淘汰了', '无', '2021-06-27 23:28:37', 0);
INSERT INTO `archive` VALUES (29, 4, 3, '工作太累', '无', '2021-06-27 23:30:03', 0);
INSERT INTO `archive` VALUES (30, 2, 3, '失眠睡不着', '无', '2021-06-27 23:58:59', 0);

-- ----------------------------
-- Table structure for client
-- ----------------------------
DROP TABLE IF EXISTS `client`;
CREATE TABLE `client`  (
  `client_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '来访者的id主键',
  `user_id` bigint(20) NULL DEFAULT NULL,
  `name` varchar(12) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '来访者姓名',
  `sex` int(1) NULL DEFAULT NULL COMMENT '0女，1男',
  `age` int(3) NULL DEFAULT NULL COMMENT '来访者年龄',
  PRIMARY KEY (`client_id`) USING BTREE,
  INDEX `client_users`(`user_id`) USING BTREE,
  CONSTRAINT `client_users` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '来访者，普通需要咨询的人' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of client
-- ----------------------------
INSERT INTO `client` VALUES (2, 13, NULL, NULL, NULL);
INSERT INTO `client` VALUES (3, 16, NULL, NULL, NULL);
INSERT INTO `client` VALUES (4, 17, NULL, NULL, NULL);
INSERT INTO `client` VALUES (5, 23, NULL, NULL, NULL);
INSERT INTO `client` VALUES (6, 24, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for client_question
-- ----------------------------
DROP TABLE IF EXISTS `client_question`;
CREATE TABLE `client_question`  (
  `client_question_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `client_id` bigint(20) NOT NULL COMMENT 'client_id',
  `question_id` bigint(20) NOT NULL COMMENT '问题id',
  `his_answer` int(3) NULL DEFAULT NULL COMMENT '1 2 3 4分别代表他的答案',
  `score` int(3) NULL DEFAULT NULL COMMENT '得分',
  PRIMARY KEY (`client_question_id`) USING BTREE,
  INDEX `client_id`(`client_id`) USING BTREE,
  INDEX `question_id`(`question_id`) USING BTREE,
  CONSTRAINT `client_question_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `client_question_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `question` (`question_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 879 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'client和问题的对应' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of client_question
-- ----------------------------
INSERT INTO `client_question` VALUES (1, 2, 1, 2, NULL);
INSERT INTO `client_question` VALUES (2, 2, 2, 1, 5);
INSERT INTO `client_question` VALUES (3, 2, 3, 1, 5);
INSERT INTO `client_question` VALUES (4, 2, 2, 3, 2);
INSERT INTO `client_question` VALUES (5, 2, 5, 3, 2);
INSERT INTO `client_question` VALUES (6, 2, 10, 3, 5);
INSERT INTO `client_question` VALUES (7, 2, 11, 2, 4);
INSERT INTO `client_question` VALUES (403, 3, 1, 0, 1);
INSERT INTO `client_question` VALUES (404, 3, 2, 1, 2);
INSERT INTO `client_question` VALUES (405, 3, 3, 1, 2);
INSERT INTO `client_question` VALUES (406, 3, 4, 1, 2);
INSERT INTO `client_question` VALUES (407, 3, 5, 0, 1);
INSERT INTO `client_question` VALUES (408, 3, 6, 1, 2);
INSERT INTO `client_question` VALUES (409, 3, 7, 0, 1);
INSERT INTO `client_question` VALUES (410, 3, 8, 1, 2);
INSERT INTO `client_question` VALUES (411, 3, 9, 0, 1);
INSERT INTO `client_question` VALUES (412, 3, 10, 1, 2);
INSERT INTO `client_question` VALUES (413, 3, 11, 0, 1);
INSERT INTO `client_question` VALUES (414, 3, 12, 1, 2);
INSERT INTO `client_question` VALUES (415, 3, 13, 0, 1);
INSERT INTO `client_question` VALUES (416, 3, 14, 1, 2);
INSERT INTO `client_question` VALUES (417, 3, 15, 0, 1);
INSERT INTO `client_question` VALUES (418, 3, 16, 1, 2);
INSERT INTO `client_question` VALUES (419, 3, 17, 0, 1);
INSERT INTO `client_question` VALUES (420, 3, 18, 1, 2);
INSERT INTO `client_question` VALUES (421, 3, 19, 0, 1);
INSERT INTO `client_question` VALUES (422, 3, 20, 1, 2);
INSERT INTO `client_question` VALUES (423, 3, 1, 0, 1);
INSERT INTO `client_question` VALUES (424, 3, 2, 1, 2);
INSERT INTO `client_question` VALUES (425, 3, 3, 2, 3);
INSERT INTO `client_question` VALUES (426, 3, 4, 1, 2);
INSERT INTO `client_question` VALUES (427, 3, 5, 2, 3);
INSERT INTO `client_question` VALUES (428, 3, 6, 3, 4);
INSERT INTO `client_question` VALUES (429, 3, 7, 3, 4);
INSERT INTO `client_question` VALUES (430, 3, 8, 3, 4);
INSERT INTO `client_question` VALUES (431, 3, 9, 3, 4);
INSERT INTO `client_question` VALUES (432, 3, 10, 3, 4);
INSERT INTO `client_question` VALUES (433, 3, 11, 3, 4);
INSERT INTO `client_question` VALUES (434, 3, 12, 3, 4);
INSERT INTO `client_question` VALUES (435, 3, 13, 2, 3);
INSERT INTO `client_question` VALUES (436, 3, 14, 3, 4);
INSERT INTO `client_question` VALUES (437, 3, 15, 3, 4);
INSERT INTO `client_question` VALUES (438, 3, 16, 2, 3);
INSERT INTO `client_question` VALUES (439, 3, 17, 3, 4);
INSERT INTO `client_question` VALUES (440, 3, 18, 2, 3);
INSERT INTO `client_question` VALUES (441, 3, 19, 3, 4);
INSERT INTO `client_question` VALUES (442, 3, 20, 2, 3);
INSERT INTO `client_question` VALUES (443, 3, 1, 1, 2);
INSERT INTO `client_question` VALUES (444, 3, 2, 1, 2);
INSERT INTO `client_question` VALUES (445, 3, 3, 2, 3);
INSERT INTO `client_question` VALUES (446, 3, 4, 1, 2);
INSERT INTO `client_question` VALUES (447, 3, 5, 2, 3);
INSERT INTO `client_question` VALUES (448, 3, 6, 3, 4);
INSERT INTO `client_question` VALUES (449, 3, 7, 3, 4);
INSERT INTO `client_question` VALUES (450, 3, 8, 3, 4);
INSERT INTO `client_question` VALUES (451, 3, 9, 3, 4);
INSERT INTO `client_question` VALUES (452, 3, 10, 3, 4);
INSERT INTO `client_question` VALUES (453, 3, 11, 3, 4);
INSERT INTO `client_question` VALUES (454, 3, 12, 3, 4);
INSERT INTO `client_question` VALUES (455, 3, 13, 2, 3);
INSERT INTO `client_question` VALUES (456, 3, 14, 3, 4);
INSERT INTO `client_question` VALUES (457, 3, 15, 3, 4);
INSERT INTO `client_question` VALUES (458, 3, 16, 2, 3);
INSERT INTO `client_question` VALUES (459, 3, 17, 3, 4);
INSERT INTO `client_question` VALUES (460, 3, 18, 2, 3);
INSERT INTO `client_question` VALUES (461, 3, 19, 3, 4);
INSERT INTO `client_question` VALUES (462, 3, 20, 2, 3);
INSERT INTO `client_question` VALUES (463, 3, 1, 1, 2);
INSERT INTO `client_question` VALUES (464, 3, 2, 1, 2);
INSERT INTO `client_question` VALUES (465, 3, 3, 2, 3);
INSERT INTO `client_question` VALUES (466, 3, 4, 1, 2);
INSERT INTO `client_question` VALUES (467, 3, 5, 2, 3);
INSERT INTO `client_question` VALUES (468, 3, 6, 3, 4);
INSERT INTO `client_question` VALUES (469, 3, 7, 3, 4);
INSERT INTO `client_question` VALUES (470, 3, 8, 3, 4);
INSERT INTO `client_question` VALUES (471, 3, 9, 3, 4);
INSERT INTO `client_question` VALUES (472, 3, 10, 3, 4);
INSERT INTO `client_question` VALUES (473, 3, 11, 3, 4);
INSERT INTO `client_question` VALUES (474, 3, 12, 3, 4);
INSERT INTO `client_question` VALUES (475, 3, 13, 2, 3);
INSERT INTO `client_question` VALUES (476, 3, 14, 3, 4);
INSERT INTO `client_question` VALUES (477, 3, 15, 3, 4);
INSERT INTO `client_question` VALUES (478, 3, 16, 2, 3);
INSERT INTO `client_question` VALUES (479, 3, 17, 3, 4);
INSERT INTO `client_question` VALUES (480, 3, 18, 2, 3);
INSERT INTO `client_question` VALUES (481, 3, 19, 3, 4);
INSERT INTO `client_question` VALUES (482, 3, 20, 2, 3);
INSERT INTO `client_question` VALUES (483, 4, 1, 1, 2);
INSERT INTO `client_question` VALUES (484, 4, 2, 1, 2);
INSERT INTO `client_question` VALUES (485, 4, 3, 2, 3);
INSERT INTO `client_question` VALUES (486, 4, 4, 1, 2);
INSERT INTO `client_question` VALUES (487, 4, 5, 2, 3);
INSERT INTO `client_question` VALUES (488, 4, 6, 3, 4);
INSERT INTO `client_question` VALUES (489, 4, 7, 3, 4);
INSERT INTO `client_question` VALUES (490, 4, 8, 3, 4);
INSERT INTO `client_question` VALUES (491, 4, 9, 3, 4);
INSERT INTO `client_question` VALUES (492, 4, 10, 3, 4);
INSERT INTO `client_question` VALUES (493, 4, 11, 3, 4);
INSERT INTO `client_question` VALUES (494, 4, 12, 3, 4);
INSERT INTO `client_question` VALUES (495, 4, 13, 2, 3);
INSERT INTO `client_question` VALUES (496, 4, 14, 3, 4);
INSERT INTO `client_question` VALUES (497, 4, 15, 3, 4);
INSERT INTO `client_question` VALUES (498, 4, 16, 2, 3);
INSERT INTO `client_question` VALUES (499, 4, 17, 3, 4);
INSERT INTO `client_question` VALUES (500, 4, 18, 2, 3);
INSERT INTO `client_question` VALUES (501, 4, 19, 3, 4);
INSERT INTO `client_question` VALUES (502, 4, 20, 2, 3);
INSERT INTO `client_question` VALUES (503, 4, 1, 1, 2);
INSERT INTO `client_question` VALUES (504, 4, 2, 1, 2);
INSERT INTO `client_question` VALUES (505, 4, 3, 2, 3);
INSERT INTO `client_question` VALUES (506, 4, 4, 1, 2);
INSERT INTO `client_question` VALUES (507, 4, 5, 2, 3);
INSERT INTO `client_question` VALUES (508, 4, 6, 3, 4);
INSERT INTO `client_question` VALUES (509, 4, 7, 3, 4);
INSERT INTO `client_question` VALUES (510, 4, 8, 3, 4);
INSERT INTO `client_question` VALUES (511, 4, 9, 3, 4);
INSERT INTO `client_question` VALUES (512, 4, 10, 3, 4);
INSERT INTO `client_question` VALUES (513, 4, 11, 3, 4);
INSERT INTO `client_question` VALUES (514, 4, 12, 3, 4);
INSERT INTO `client_question` VALUES (515, 4, 13, 2, 3);
INSERT INTO `client_question` VALUES (516, 4, 14, 3, 4);
INSERT INTO `client_question` VALUES (517, 4, 15, 3, 4);
INSERT INTO `client_question` VALUES (518, 4, 16, 2, 3);
INSERT INTO `client_question` VALUES (519, 4, 17, 3, 4);
INSERT INTO `client_question` VALUES (520, 4, 18, 2, 3);
INSERT INTO `client_question` VALUES (521, 4, 19, 3, 4);
INSERT INTO `client_question` VALUES (522, 4, 20, 2, 3);
INSERT INTO `client_question` VALUES (523, 4, 1, 1, 2);
INSERT INTO `client_question` VALUES (524, 4, 2, 1, 2);
INSERT INTO `client_question` VALUES (525, 4, 3, 2, 3);
INSERT INTO `client_question` VALUES (526, 4, 4, 1, 2);
INSERT INTO `client_question` VALUES (527, 4, 5, 2, 3);
INSERT INTO `client_question` VALUES (528, 4, 6, 3, 4);
INSERT INTO `client_question` VALUES (529, 4, 7, 3, 4);
INSERT INTO `client_question` VALUES (530, 4, 8, 3, 4);
INSERT INTO `client_question` VALUES (531, 4, 9, 3, 4);
INSERT INTO `client_question` VALUES (532, 4, 10, 3, 4);
INSERT INTO `client_question` VALUES (533, 4, 11, 3, 4);
INSERT INTO `client_question` VALUES (534, 4, 12, 3, 4);
INSERT INTO `client_question` VALUES (535, 4, 13, 2, 3);
INSERT INTO `client_question` VALUES (536, 4, 14, 3, 4);
INSERT INTO `client_question` VALUES (537, 4, 15, 3, 4);
INSERT INTO `client_question` VALUES (538, 4, 16, 2, 3);
INSERT INTO `client_question` VALUES (539, 4, 17, 3, 4);
INSERT INTO `client_question` VALUES (540, 4, 18, 2, 3);
INSERT INTO `client_question` VALUES (541, 4, 19, 3, 4);
INSERT INTO `client_question` VALUES (542, 4, 20, 2, 3);
INSERT INTO `client_question` VALUES (543, 4, 1, 1, 2);
INSERT INTO `client_question` VALUES (544, 4, 2, 1, 2);
INSERT INTO `client_question` VALUES (545, 4, 3, 2, 3);
INSERT INTO `client_question` VALUES (546, 4, 4, 1, 2);
INSERT INTO `client_question` VALUES (547, 4, 5, 2, 3);
INSERT INTO `client_question` VALUES (548, 4, 6, 3, 4);
INSERT INTO `client_question` VALUES (549, 4, 7, 3, 4);
INSERT INTO `client_question` VALUES (550, 4, 8, 3, 4);
INSERT INTO `client_question` VALUES (551, 4, 9, 3, 4);
INSERT INTO `client_question` VALUES (552, 4, 10, 3, 4);
INSERT INTO `client_question` VALUES (553, 4, 11, 3, 4);
INSERT INTO `client_question` VALUES (554, 4, 12, 3, 4);
INSERT INTO `client_question` VALUES (555, 4, 13, 2, 3);
INSERT INTO `client_question` VALUES (556, 4, 14, 3, 4);
INSERT INTO `client_question` VALUES (557, 4, 15, 3, 4);
INSERT INTO `client_question` VALUES (558, 4, 16, 2, 3);
INSERT INTO `client_question` VALUES (559, 4, 17, 3, 4);
INSERT INTO `client_question` VALUES (560, 4, 18, 2, 3);
INSERT INTO `client_question` VALUES (561, 4, 19, 3, 4);
INSERT INTO `client_question` VALUES (562, 4, 20, 2, 3);
INSERT INTO `client_question` VALUES (563, 4, 1, 1, 2);
INSERT INTO `client_question` VALUES (564, 4, 2, 1, 2);
INSERT INTO `client_question` VALUES (565, 4, 3, 2, 3);
INSERT INTO `client_question` VALUES (566, 4, 4, 1, 2);
INSERT INTO `client_question` VALUES (567, 4, 5, 2, 3);
INSERT INTO `client_question` VALUES (568, 4, 6, 3, 4);
INSERT INTO `client_question` VALUES (569, 4, 7, 3, 4);
INSERT INTO `client_question` VALUES (570, 4, 8, 3, 4);
INSERT INTO `client_question` VALUES (571, 4, 9, 3, 4);
INSERT INTO `client_question` VALUES (572, 4, 10, 3, 4);
INSERT INTO `client_question` VALUES (573, 4, 11, 3, 4);
INSERT INTO `client_question` VALUES (574, 4, 12, 3, 4);
INSERT INTO `client_question` VALUES (575, 4, 13, 2, 3);
INSERT INTO `client_question` VALUES (576, 4, 14, 3, 4);
INSERT INTO `client_question` VALUES (577, 4, 15, 3, 4);
INSERT INTO `client_question` VALUES (578, 4, 16, 2, 3);
INSERT INTO `client_question` VALUES (579, 4, 17, 3, 4);
INSERT INTO `client_question` VALUES (580, 4, 18, 2, 3);
INSERT INTO `client_question` VALUES (581, 4, 19, 3, 4);
INSERT INTO `client_question` VALUES (582, 4, 20, 2, 3);
INSERT INTO `client_question` VALUES (583, 4, 1, 1, 2);
INSERT INTO `client_question` VALUES (584, 4, 2, 1, 2);
INSERT INTO `client_question` VALUES (585, 4, 3, 2, 3);
INSERT INTO `client_question` VALUES (586, 4, 4, 1, 2);
INSERT INTO `client_question` VALUES (587, 4, 5, 2, 3);
INSERT INTO `client_question` VALUES (588, 4, 6, 3, 4);
INSERT INTO `client_question` VALUES (589, 4, 7, 3, 4);
INSERT INTO `client_question` VALUES (590, 4, 8, 3, 4);
INSERT INTO `client_question` VALUES (591, 4, 9, 3, 4);
INSERT INTO `client_question` VALUES (592, 4, 10, 3, 4);
INSERT INTO `client_question` VALUES (593, 4, 11, 3, 4);
INSERT INTO `client_question` VALUES (594, 4, 12, 3, 4);
INSERT INTO `client_question` VALUES (595, 4, 13, 2, 3);
INSERT INTO `client_question` VALUES (596, 4, 14, 3, 4);
INSERT INTO `client_question` VALUES (597, 4, 15, 3, 4);
INSERT INTO `client_question` VALUES (598, 4, 16, 2, 3);
INSERT INTO `client_question` VALUES (599, 4, 17, 3, 4);
INSERT INTO `client_question` VALUES (600, 4, 18, 2, 3);
INSERT INTO `client_question` VALUES (601, 4, 19, 3, 4);
INSERT INTO `client_question` VALUES (602, 4, 20, 2, 3);
INSERT INTO `client_question` VALUES (603, 4, 1, 1, 2);
INSERT INTO `client_question` VALUES (604, 4, 2, 1, 2);
INSERT INTO `client_question` VALUES (605, 4, 3, 2, 3);
INSERT INTO `client_question` VALUES (606, 4, 4, 1, 2);
INSERT INTO `client_question` VALUES (607, 4, 5, 2, 3);
INSERT INTO `client_question` VALUES (608, 4, 6, 3, 4);
INSERT INTO `client_question` VALUES (609, 4, 7, 3, 4);
INSERT INTO `client_question` VALUES (610, 4, 8, 3, 4);
INSERT INTO `client_question` VALUES (611, 4, 9, 3, 4);
INSERT INTO `client_question` VALUES (612, 4, 10, 3, 4);
INSERT INTO `client_question` VALUES (613, 4, 11, 3, 4);
INSERT INTO `client_question` VALUES (614, 4, 12, 3, 4);
INSERT INTO `client_question` VALUES (615, 4, 13, 2, 3);
INSERT INTO `client_question` VALUES (616, 4, 14, 3, 4);
INSERT INTO `client_question` VALUES (617, 4, 15, 3, 4);
INSERT INTO `client_question` VALUES (618, 4, 16, 2, 3);
INSERT INTO `client_question` VALUES (619, 4, 17, 3, 4);
INSERT INTO `client_question` VALUES (620, 4, 18, 2, 3);
INSERT INTO `client_question` VALUES (621, 4, 19, 3, 4);
INSERT INTO `client_question` VALUES (622, 4, 20, 2, 3);
INSERT INTO `client_question` VALUES (623, 2, 1, 0, 1);
INSERT INTO `client_question` VALUES (624, 2, 2, 0, 1);
INSERT INTO `client_question` VALUES (625, 2, 3, 0, 1);
INSERT INTO `client_question` VALUES (626, 2, 4, 0, 1);
INSERT INTO `client_question` VALUES (627, 2, 5, 0, 1);
INSERT INTO `client_question` VALUES (628, 2, 6, 0, 1);
INSERT INTO `client_question` VALUES (629, 2, 7, 1, 2);
INSERT INTO `client_question` VALUES (630, 2, 8, 2, 3);
INSERT INTO `client_question` VALUES (631, 2, 9, 3, 4);
INSERT INTO `client_question` VALUES (632, 2, 10, 0, 1);
INSERT INTO `client_question` VALUES (633, 2, 11, 0, 1);
INSERT INTO `client_question` VALUES (634, 2, 12, 3, 4);
INSERT INTO `client_question` VALUES (635, 2, 13, 0, 1);
INSERT INTO `client_question` VALUES (636, 2, 14, 0, 1);
INSERT INTO `client_question` VALUES (637, 2, 15, 0, 1);
INSERT INTO `client_question` VALUES (638, 2, 16, 3, 4);
INSERT INTO `client_question` VALUES (639, 2, 17, 0, 1);
INSERT INTO `client_question` VALUES (640, 2, 18, 0, 1);
INSERT INTO `client_question` VALUES (641, 2, 19, 0, 1);
INSERT INTO `client_question` VALUES (642, 2, 20, 0, 1);
INSERT INTO `client_question` VALUES (643, 2, 1, 3, 4);
INSERT INTO `client_question` VALUES (644, 2, 2, 0, 1);
INSERT INTO `client_question` VALUES (645, 2, 3, 0, 1);
INSERT INTO `client_question` VALUES (646, 2, 4, 0, 1);
INSERT INTO `client_question` VALUES (647, 2, 5, 0, 1);
INSERT INTO `client_question` VALUES (648, 2, 6, 0, 1);
INSERT INTO `client_question` VALUES (649, 2, 7, 0, 1);
INSERT INTO `client_question` VALUES (650, 2, 8, 2, 3);
INSERT INTO `client_question` VALUES (651, 2, 9, 0, 1);
INSERT INTO `client_question` VALUES (652, 2, 10, 3, 4);
INSERT INTO `client_question` VALUES (653, 2, 11, 0, 1);
INSERT INTO `client_question` VALUES (654, 2, 12, 0, 1);
INSERT INTO `client_question` VALUES (655, 2, 13, 1, 2);
INSERT INTO `client_question` VALUES (656, 2, 14, 0, 1);
INSERT INTO `client_question` VALUES (657, 2, 15, 0, 1);
INSERT INTO `client_question` VALUES (658, 2, 16, 0, 1);
INSERT INTO `client_question` VALUES (659, 2, 1, 3, 4);
INSERT INTO `client_question` VALUES (660, 2, 2, 0, 1);
INSERT INTO `client_question` VALUES (661, 2, 3, 0, 1);
INSERT INTO `client_question` VALUES (662, 2, 4, 0, 1);
INSERT INTO `client_question` VALUES (663, 2, 5, 0, 1);
INSERT INTO `client_question` VALUES (664, 2, 6, 0, 1);
INSERT INTO `client_question` VALUES (665, 2, 7, 0, 1);
INSERT INTO `client_question` VALUES (666, 2, 8, 2, 3);
INSERT INTO `client_question` VALUES (667, 2, 9, 0, 1);
INSERT INTO `client_question` VALUES (668, 2, 10, 3, 4);
INSERT INTO `client_question` VALUES (669, 2, 11, 0, 1);
INSERT INTO `client_question` VALUES (670, 2, 12, 0, 1);
INSERT INTO `client_question` VALUES (671, 2, 13, 1, 2);
INSERT INTO `client_question` VALUES (672, 2, 14, 0, 1);
INSERT INTO `client_question` VALUES (673, 2, 15, 0, 1);
INSERT INTO `client_question` VALUES (674, 2, 16, 0, 1);
INSERT INTO `client_question` VALUES (675, 2, 17, 0, 1);
INSERT INTO `client_question` VALUES (676, 2, 18, 2, 3);
INSERT INTO `client_question` VALUES (677, 2, 19, 0, 1);
INSERT INTO `client_question` VALUES (678, 2, 20, 0, 1);
INSERT INTO `client_question` VALUES (679, 2, 1, 0, 1);
INSERT INTO `client_question` VALUES (680, 2, 2, 1, 2);
INSERT INTO `client_question` VALUES (681, 2, 3, 1, 2);
INSERT INTO `client_question` VALUES (682, 2, 4, 0, 1);
INSERT INTO `client_question` VALUES (683, 2, 5, 0, 1);
INSERT INTO `client_question` VALUES (684, 2, 6, 0, 1);
INSERT INTO `client_question` VALUES (685, 2, 7, 0, 1);
INSERT INTO `client_question` VALUES (686, 2, 8, 2, 3);
INSERT INTO `client_question` VALUES (687, 2, 9, 0, 1);
INSERT INTO `client_question` VALUES (688, 2, 10, 0, 1);
INSERT INTO `client_question` VALUES (689, 2, 11, 2, 3);
INSERT INTO `client_question` VALUES (690, 2, 12, 1, 2);
INSERT INTO `client_question` VALUES (691, 2, 13, 0, 1);
INSERT INTO `client_question` VALUES (692, 2, 14, 0, 1);
INSERT INTO `client_question` VALUES (693, 2, 15, 0, 1);
INSERT INTO `client_question` VALUES (694, 2, 16, 0, 1);
INSERT INTO `client_question` VALUES (695, 2, 17, 0, 1);
INSERT INTO `client_question` VALUES (696, 2, 18, 3, 4);
INSERT INTO `client_question` VALUES (697, 2, 19, 3, 4);
INSERT INTO `client_question` VALUES (698, 2, 20, 0, 1);
INSERT INTO `client_question` VALUES (699, 5, 1, 3, 4);
INSERT INTO `client_question` VALUES (700, 5, 2, 3, 4);
INSERT INTO `client_question` VALUES (701, 5, 3, 3, 4);
INSERT INTO `client_question` VALUES (702, 5, 4, 3, 4);
INSERT INTO `client_question` VALUES (703, 5, 5, 3, 4);
INSERT INTO `client_question` VALUES (704, 5, 6, 3, 4);
INSERT INTO `client_question` VALUES (705, 5, 7, 3, 4);
INSERT INTO `client_question` VALUES (706, 5, 8, 3, 4);
INSERT INTO `client_question` VALUES (707, 5, 9, 3, 4);
INSERT INTO `client_question` VALUES (708, 5, 10, 3, 4);
INSERT INTO `client_question` VALUES (709, 5, 11, 3, 4);
INSERT INTO `client_question` VALUES (710, 5, 12, 3, 4);
INSERT INTO `client_question` VALUES (711, 5, 13, 3, 4);
INSERT INTO `client_question` VALUES (712, 5, 14, 3, 4);
INSERT INTO `client_question` VALUES (713, 5, 15, 3, 4);
INSERT INTO `client_question` VALUES (714, 5, 16, 3, 4);
INSERT INTO `client_question` VALUES (715, 5, 17, 3, 4);
INSERT INTO `client_question` VALUES (716, 5, 18, 3, 4);
INSERT INTO `client_question` VALUES (717, 5, 19, 3, 4);
INSERT INTO `client_question` VALUES (718, 5, 20, 3, 4);
INSERT INTO `client_question` VALUES (719, 5, 1, 3, 4);
INSERT INTO `client_question` VALUES (720, 5, 2, 3, 4);
INSERT INTO `client_question` VALUES (721, 5, 3, 3, 4);
INSERT INTO `client_question` VALUES (722, 5, 4, 3, 4);
INSERT INTO `client_question` VALUES (723, 5, 5, 3, 4);
INSERT INTO `client_question` VALUES (724, 5, 6, 3, 4);
INSERT INTO `client_question` VALUES (725, 5, 7, 3, 4);
INSERT INTO `client_question` VALUES (726, 5, 8, 3, 4);
INSERT INTO `client_question` VALUES (727, 5, 9, 3, 4);
INSERT INTO `client_question` VALUES (728, 5, 10, 3, 4);
INSERT INTO `client_question` VALUES (729, 5, 11, 3, 4);
INSERT INTO `client_question` VALUES (730, 5, 12, 3, 4);
INSERT INTO `client_question` VALUES (731, 5, 13, 3, 4);
INSERT INTO `client_question` VALUES (732, 5, 14, 3, 4);
INSERT INTO `client_question` VALUES (733, 5, 15, 3, 4);
INSERT INTO `client_question` VALUES (734, 5, 16, 3, 4);
INSERT INTO `client_question` VALUES (735, 5, 17, 3, 4);
INSERT INTO `client_question` VALUES (736, 5, 18, 3, 4);
INSERT INTO `client_question` VALUES (737, 5, 19, 3, 4);
INSERT INTO `client_question` VALUES (738, 5, 20, 3, 4);
INSERT INTO `client_question` VALUES (739, 5, 1, 3, 4);
INSERT INTO `client_question` VALUES (740, 5, 2, 3, 4);
INSERT INTO `client_question` VALUES (741, 5, 3, 3, 4);
INSERT INTO `client_question` VALUES (742, 5, 4, 3, 4);
INSERT INTO `client_question` VALUES (743, 5, 5, 3, 4);
INSERT INTO `client_question` VALUES (744, 5, 6, 3, 4);
INSERT INTO `client_question` VALUES (745, 5, 7, 3, 4);
INSERT INTO `client_question` VALUES (746, 5, 8, 3, 4);
INSERT INTO `client_question` VALUES (747, 5, 9, 3, 4);
INSERT INTO `client_question` VALUES (748, 5, 10, 3, 4);
INSERT INTO `client_question` VALUES (749, 5, 11, 3, 4);
INSERT INTO `client_question` VALUES (750, 5, 12, 3, 4);
INSERT INTO `client_question` VALUES (751, 5, 13, 3, 4);
INSERT INTO `client_question` VALUES (752, 5, 14, 3, 4);
INSERT INTO `client_question` VALUES (753, 5, 15, 3, 4);
INSERT INTO `client_question` VALUES (754, 5, 16, 3, 4);
INSERT INTO `client_question` VALUES (755, 5, 17, 3, 4);
INSERT INTO `client_question` VALUES (756, 5, 18, 3, 4);
INSERT INTO `client_question` VALUES (757, 5, 19, 3, 4);
INSERT INTO `client_question` VALUES (758, 5, 20, 3, 4);
INSERT INTO `client_question` VALUES (759, 2, 1, 0, 1);
INSERT INTO `client_question` VALUES (760, 2, 2, 0, 1);
INSERT INTO `client_question` VALUES (761, 2, 3, 0, 1);
INSERT INTO `client_question` VALUES (762, 2, 4, 0, 1);
INSERT INTO `client_question` VALUES (763, 2, 5, 0, 1);
INSERT INTO `client_question` VALUES (764, 2, 6, 0, 1);
INSERT INTO `client_question` VALUES (765, 2, 7, 0, 1);
INSERT INTO `client_question` VALUES (766, 2, 8, 0, 1);
INSERT INTO `client_question` VALUES (767, 2, 9, 0, 1);
INSERT INTO `client_question` VALUES (768, 2, 10, 0, 1);
INSERT INTO `client_question` VALUES (769, 2, 11, 0, 1);
INSERT INTO `client_question` VALUES (770, 2, 12, 0, 1);
INSERT INTO `client_question` VALUES (771, 2, 13, 0, 1);
INSERT INTO `client_question` VALUES (772, 2, 14, 1, 2);
INSERT INTO `client_question` VALUES (773, 2, 15, 1, 2);
INSERT INTO `client_question` VALUES (774, 2, 16, 1, 2);
INSERT INTO `client_question` VALUES (775, 2, 17, 1, 2);
INSERT INTO `client_question` VALUES (776, 2, 18, 1, 2);
INSERT INTO `client_question` VALUES (777, 2, 19, 1, 2);
INSERT INTO `client_question` VALUES (778, 2, 20, 1, 2);
INSERT INTO `client_question` VALUES (779, 2, 1, 0, 1);
INSERT INTO `client_question` VALUES (780, 2, 2, 0, 1);
INSERT INTO `client_question` VALUES (781, 2, 3, 0, 1);
INSERT INTO `client_question` VALUES (782, 2, 4, 0, 1);
INSERT INTO `client_question` VALUES (783, 2, 5, 0, 1);
INSERT INTO `client_question` VALUES (784, 2, 6, 0, 1);
INSERT INTO `client_question` VALUES (785, 2, 7, 0, 1);
INSERT INTO `client_question` VALUES (786, 2, 8, 0, 1);
INSERT INTO `client_question` VALUES (787, 2, 9, 0, 1);
INSERT INTO `client_question` VALUES (788, 2, 10, 0, 1);
INSERT INTO `client_question` VALUES (789, 2, 11, 0, 1);
INSERT INTO `client_question` VALUES (790, 2, 12, 0, 1);
INSERT INTO `client_question` VALUES (791, 2, 13, 0, 1);
INSERT INTO `client_question` VALUES (792, 2, 14, 0, 1);
INSERT INTO `client_question` VALUES (793, 2, 15, 0, 1);
INSERT INTO `client_question` VALUES (794, 2, 16, 0, 1);
INSERT INTO `client_question` VALUES (795, 2, 17, 0, 1);
INSERT INTO `client_question` VALUES (796, 2, 18, 0, 1);
INSERT INTO `client_question` VALUES (797, 2, 19, 0, 1);
INSERT INTO `client_question` VALUES (798, 2, 20, 0, 1);
INSERT INTO `client_question` VALUES (799, 2, 1, 1, 2);
INSERT INTO `client_question` VALUES (800, 2, 2, 1, 2);
INSERT INTO `client_question` VALUES (801, 2, 3, 1, 2);
INSERT INTO `client_question` VALUES (802, 2, 4, 1, 2);
INSERT INTO `client_question` VALUES (803, 2, 5, 1, 2);
INSERT INTO `client_question` VALUES (804, 2, 6, 1, 2);
INSERT INTO `client_question` VALUES (805, 2, 7, 1, 2);
INSERT INTO `client_question` VALUES (806, 2, 8, 1, 2);
INSERT INTO `client_question` VALUES (807, 2, 9, 1, 2);
INSERT INTO `client_question` VALUES (808, 2, 10, 1, 2);
INSERT INTO `client_question` VALUES (809, 2, 11, 1, 2);
INSERT INTO `client_question` VALUES (810, 2, 12, 1, 2);
INSERT INTO `client_question` VALUES (811, 2, 13, 1, 2);
INSERT INTO `client_question` VALUES (812, 2, 14, 1, 2);
INSERT INTO `client_question` VALUES (813, 2, 15, 1, 2);
INSERT INTO `client_question` VALUES (814, 2, 16, 1, 2);
INSERT INTO `client_question` VALUES (815, 2, 17, 1, 2);
INSERT INTO `client_question` VALUES (816, 2, 18, 1, 2);
INSERT INTO `client_question` VALUES (817, 2, 19, 1, 2);
INSERT INTO `client_question` VALUES (818, 2, 20, 1, 2);
INSERT INTO `client_question` VALUES (819, 2, 1, 2, 3);
INSERT INTO `client_question` VALUES (820, 2, 2, 2, 3);
INSERT INTO `client_question` VALUES (821, 2, 3, 2, 3);
INSERT INTO `client_question` VALUES (822, 2, 4, 2, 3);
INSERT INTO `client_question` VALUES (823, 2, 5, 2, 3);
INSERT INTO `client_question` VALUES (824, 2, 6, 2, 3);
INSERT INTO `client_question` VALUES (825, 2, 7, 2, 3);
INSERT INTO `client_question` VALUES (826, 2, 8, 2, 3);
INSERT INTO `client_question` VALUES (827, 2, 9, 2, 3);
INSERT INTO `client_question` VALUES (828, 2, 10, 2, 3);
INSERT INTO `client_question` VALUES (829, 2, 11, 2, 3);
INSERT INTO `client_question` VALUES (830, 2, 12, 2, 3);
INSERT INTO `client_question` VALUES (831, 2, 13, 2, 3);
INSERT INTO `client_question` VALUES (832, 2, 14, 2, 3);
INSERT INTO `client_question` VALUES (833, 2, 15, 2, 3);
INSERT INTO `client_question` VALUES (834, 2, 16, 2, 3);
INSERT INTO `client_question` VALUES (835, 2, 17, 2, 3);
INSERT INTO `client_question` VALUES (836, 2, 18, 2, 3);
INSERT INTO `client_question` VALUES (837, 2, 19, 2, 3);
INSERT INTO `client_question` VALUES (838, 2, 20, 2, 3);
INSERT INTO `client_question` VALUES (839, 2, 1, 2, 3);
INSERT INTO `client_question` VALUES (840, 2, 2, 2, 3);
INSERT INTO `client_question` VALUES (841, 2, 3, 2, 3);
INSERT INTO `client_question` VALUES (842, 2, 4, 2, 3);
INSERT INTO `client_question` VALUES (843, 2, 5, 2, 3);
INSERT INTO `client_question` VALUES (844, 2, 6, 2, 3);
INSERT INTO `client_question` VALUES (845, 2, 7, 2, 3);
INSERT INTO `client_question` VALUES (846, 2, 8, 2, 3);
INSERT INTO `client_question` VALUES (847, 2, 9, 2, 3);
INSERT INTO `client_question` VALUES (848, 2, 10, 2, 3);
INSERT INTO `client_question` VALUES (849, 2, 11, 2, 3);
INSERT INTO `client_question` VALUES (850, 2, 12, 2, 3);
INSERT INTO `client_question` VALUES (851, 2, 13, 2, 3);
INSERT INTO `client_question` VALUES (852, 2, 14, 2, 3);
INSERT INTO `client_question` VALUES (853, 2, 15, 2, 3);
INSERT INTO `client_question` VALUES (854, 2, 16, 2, 3);
INSERT INTO `client_question` VALUES (855, 2, 17, 2, 3);
INSERT INTO `client_question` VALUES (856, 2, 18, 2, 3);
INSERT INTO `client_question` VALUES (857, 2, 19, 2, 3);
INSERT INTO `client_question` VALUES (858, 2, 20, 2, 3);
INSERT INTO `client_question` VALUES (859, 2, 1, 1, 2);
INSERT INTO `client_question` VALUES (860, 2, 2, 1, 2);
INSERT INTO `client_question` VALUES (861, 2, 3, 1, 2);
INSERT INTO `client_question` VALUES (862, 2, 4, 1, 2);
INSERT INTO `client_question` VALUES (863, 2, 5, 1, 2);
INSERT INTO `client_question` VALUES (864, 2, 6, 1, 2);
INSERT INTO `client_question` VALUES (865, 2, 7, 1, 2);
INSERT INTO `client_question` VALUES (866, 2, 8, 1, 2);
INSERT INTO `client_question` VALUES (867, 2, 9, 1, 2);
INSERT INTO `client_question` VALUES (868, 2, 10, 1, 2);
INSERT INTO `client_question` VALUES (869, 2, 11, 1, 2);
INSERT INTO `client_question` VALUES (870, 2, 12, 1, 2);
INSERT INTO `client_question` VALUES (871, 2, 13, 1, 2);
INSERT INTO `client_question` VALUES (872, 2, 14, 1, 2);
INSERT INTO `client_question` VALUES (873, 2, 15, 1, 2);
INSERT INTO `client_question` VALUES (874, 2, 16, 1, 2);
INSERT INTO `client_question` VALUES (875, 2, 17, 1, 2);
INSERT INTO `client_question` VALUES (876, 2, 18, 1, 2);
INSERT INTO `client_question` VALUES (877, 2, 19, 1, 2);
INSERT INTO `client_question` VALUES (878, 2, 20, 1, 2);

-- ----------------------------
-- Table structure for doctor
-- ----------------------------
DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor`  (
  `doctor_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) NULL DEFAULT NULL,
  `name` varchar(12) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '咨询师姓名',
  `sex` int(1) NULL DEFAULT NULL COMMENT '0女，1男',
  `age` int(3) NULL DEFAULT NULL COMMENT '咨询师年龄',
  `level` varchar(8) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '咨询师等级（一级、二级 等）',
  `skill` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '咨询师擅长方向（家庭、亲密关系，挫折等）',
  `avatar` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '头像',
  `place` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '咨询师 的咨询地点',
  `work_time` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`doctor_id`) USING BTREE,
  INDEX `doctor_users`(`user_id`) USING BTREE,
  CONSTRAINT `doctor_users` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '心理咨询师用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of doctor
-- ----------------------------
INSERT INTO `doctor` VALUES (3, 14, '张五离', 2, 28, '二级医师', '家庭', 'www.baidu.com', '江安1', '每周四');
INSERT INTO `doctor` VALUES (4, 15, '张四', 1, 36, '2', '感情', 'www.baidu.com', '江安', '每周六');

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question`  (
  `question_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '一个问卷题目id',
  `context` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '题目内容',
  `answer` int(1) NULL DEFAULT NULL COMMENT '1 2 3 4分别代表ABCD',
  `full_score` int(1) NOT NULL COMMENT '满分',
  PRIMARY KEY (`question_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES (1, '您经常对事物失去兴趣吗？', 0, 5);
INSERT INTO `question` VALUES (2, '您经常感到疲惫或没有精力吗？', 0, 5);
INSERT INTO `question` VALUES (3, '您经常失眠或者睡眠时间过长吗？', 0, 5);
INSERT INTO `question` VALUES (4, '您经常感到没有胃口或暴饮暴食吗？', 0, 5);
INSERT INTO `question` VALUES (5, '您经常产生自杀或者自我伤害的想法吗？', 0, 5);
INSERT INTO `question` VALUES (6, '您经常对未来失去信心吗？', 0, 5);
INSERT INTO `question` VALUES (7, '您非常不了解相关的心理疾病吗？', 0, 5);
INSERT INTO `question` VALUES (8, '您很在意别人对你的看法吗？', 0, 5);
INSERT INTO `question` VALUES (9, '您从来不会发泄自己的不良感情吗？', 0, 5);
INSERT INTO `question` VALUES (10, '您的想法和行为家里人非常不支持吗？', 0, 5);
INSERT INTO `question` VALUES (11, '面对陌生的环境，您会感到非常恐惧和不安吗？', 0, 5);
INSERT INTO `question` VALUES (12, '您非常不了解自己的优缺点吗？', 0, 5);
INSERT INTO `question` VALUES (13, '您经常通过网络发泄自己的情绪吗？', 0, 5);
INSERT INTO `question` VALUES (14, '您非常不愿意结识新的朋友吗？', 0, 5);
INSERT INTO `question` VALUES (15, '如果您身边的朋友向你求助，您非常不愿意帮助他吗？', 0, 5);
INSERT INTO `question` VALUES (16, '您的心理问题对你的生活产生了非常大的影响吗？', 0, 5);
INSERT INTO `question` VALUES (17, '您非常不愿意接受心理辅导吗？', 0, 5);
INSERT INTO `question` VALUES (18, '您会经常变得非常暴躁或者产生暴力行为吗？', 0, 5);
INSERT INTO `question` VALUES (19, '您从来不会向别人倾诉自己的情绪问题吗？', 0, 5);
INSERT INTO `question` VALUES (20, '您经常在做事时无法集中注意吗？', 0, 5);

-- ----------------------------
-- Table structure for record
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record`  (
  `record_id` int(9) NOT NULL AUTO_INCREMENT COMMENT '咨询者的一次record，一次完整咨询包含多次record',
  `archives_id` int(9) NOT NULL,
  `doctor_description` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '无' COMMENT '医生记录',
  `datetime` datetime(0) NULL DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`record_id`) USING BTREE,
  INDEX `record_archive_ibfk_1`(`archives_id`) USING BTREE,
  CONSTRAINT `record_archive_ibfk_1` FOREIGN KEY (`archives_id`) REFERENCES `archive` (`archives_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '来访者的一次咨询的档案' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of record
-- ----------------------------

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of schedule_job
-- ----------------------------
INSERT INTO `schedule_job` VALUES (1, 'testTask', 'renren', '0 0/30 * * * ?', 0, '参数测试', '2021-06-14 12:20:42');

-- ----------------------------
-- Table structure for schedule_job_log
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log`  (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`) USING BTREE,
  INDEX `job_id`(`job_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 126 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------
INSERT INTO `schedule_job_log` VALUES (1, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-15 14:00:00');
INSERT INTO `schedule_job_log` VALUES (2, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-15 17:30:00');
INSERT INTO `schedule_job_log` VALUES (3, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-15 18:00:00');
INSERT INTO `schedule_job_log` VALUES (4, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-15 18:30:00');
INSERT INTO `schedule_job_log` VALUES (5, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-15 19:00:00');
INSERT INTO `schedule_job_log` VALUES (6, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-15 19:30:00');
INSERT INTO `schedule_job_log` VALUES (7, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-15 20:00:00');
INSERT INTO `schedule_job_log` VALUES (8, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-15 20:30:00');
INSERT INTO `schedule_job_log` VALUES (9, 1, 'testTask', 'renren', 0, NULL, 1, '2021-06-16 11:30:00');
INSERT INTO `schedule_job_log` VALUES (10, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-16 12:30:01');
INSERT INTO `schedule_job_log` VALUES (11, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-16 13:00:01');
INSERT INTO `schedule_job_log` VALUES (12, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-16 13:30:00');
INSERT INTO `schedule_job_log` VALUES (13, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-16 14:00:00');
INSERT INTO `schedule_job_log` VALUES (14, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-16 18:00:00');
INSERT INTO `schedule_job_log` VALUES (15, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-16 18:30:00');
INSERT INTO `schedule_job_log` VALUES (16, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-17 15:30:00');
INSERT INTO `schedule_job_log` VALUES (17, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-17 16:00:00');
INSERT INTO `schedule_job_log` VALUES (18, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-17 16:30:00');
INSERT INTO `schedule_job_log` VALUES (19, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-17 17:00:00');
INSERT INTO `schedule_job_log` VALUES (20, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-17 17:30:00');
INSERT INTO `schedule_job_log` VALUES (21, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-17 18:00:00');
INSERT INTO `schedule_job_log` VALUES (22, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-17 18:30:00');
INSERT INTO `schedule_job_log` VALUES (23, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-18 16:30:00');
INSERT INTO `schedule_job_log` VALUES (24, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-18 21:00:00');
INSERT INTO `schedule_job_log` VALUES (25, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-18 21:30:00');
INSERT INTO `schedule_job_log` VALUES (26, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-18 22:00:00');
INSERT INTO `schedule_job_log` VALUES (27, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-18 22:30:00');
INSERT INTO `schedule_job_log` VALUES (28, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-18 23:00:00');
INSERT INTO `schedule_job_log` VALUES (29, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-18 23:30:00');
INSERT INTO `schedule_job_log` VALUES (30, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-21 15:00:00');
INSERT INTO `schedule_job_log` VALUES (31, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-21 15:30:00');
INSERT INTO `schedule_job_log` VALUES (32, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-21 16:00:00');
INSERT INTO `schedule_job_log` VALUES (33, 1, 'testTask', 'renren', 0, NULL, 1, '2021-06-21 16:30:00');
INSERT INTO `schedule_job_log` VALUES (34, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-21 17:00:00');
INSERT INTO `schedule_job_log` VALUES (35, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-21 17:32:36');
INSERT INTO `schedule_job_log` VALUES (36, 1, 'testTask', 'renren', 0, NULL, 1, '2021-06-21 18:00:00');
INSERT INTO `schedule_job_log` VALUES (37, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-21 18:30:00');
INSERT INTO `schedule_job_log` VALUES (38, 1, 'testTask', 'renren', 0, NULL, 1, '2021-06-21 20:00:00');
INSERT INTO `schedule_job_log` VALUES (39, 1, 'testTask', 'renren', 0, NULL, 1, '2021-06-21 20:30:00');
INSERT INTO `schedule_job_log` VALUES (40, 1, 'testTask', 'renren', 0, NULL, 1, '2021-06-21 21:00:00');
INSERT INTO `schedule_job_log` VALUES (41, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-21 21:30:00');
INSERT INTO `schedule_job_log` VALUES (42, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-21 22:00:00');
INSERT INTO `schedule_job_log` VALUES (43, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-21 22:30:00');
INSERT INTO `schedule_job_log` VALUES (44, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-21 23:00:00');
INSERT INTO `schedule_job_log` VALUES (45, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-21 23:30:00');
INSERT INTO `schedule_job_log` VALUES (46, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-22 00:00:00');
INSERT INTO `schedule_job_log` VALUES (47, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-22 08:30:01');
INSERT INTO `schedule_job_log` VALUES (48, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-22 09:00:01');
INSERT INTO `schedule_job_log` VALUES (49, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-22 10:00:02');
INSERT INTO `schedule_job_log` VALUES (50, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-22 10:30:01');
INSERT INTO `schedule_job_log` VALUES (51, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-22 15:30:00');
INSERT INTO `schedule_job_log` VALUES (52, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-22 16:00:00');
INSERT INTO `schedule_job_log` VALUES (53, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-24 11:00:00');
INSERT INTO `schedule_job_log` VALUES (54, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-24 12:00:01');
INSERT INTO `schedule_job_log` VALUES (55, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-24 12:30:01');
INSERT INTO `schedule_job_log` VALUES (56, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-24 13:00:02');
INSERT INTO `schedule_job_log` VALUES (57, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-24 13:30:01');
INSERT INTO `schedule_job_log` VALUES (58, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-24 14:00:00');
INSERT INTO `schedule_job_log` VALUES (59, 1, 'testTask', 'renren', 0, NULL, 1, '2021-06-24 16:00:06');
INSERT INTO `schedule_job_log` VALUES (60, 1, 'testTask', 'renren', 0, NULL, 2, '2021-06-24 18:00:01');
INSERT INTO `schedule_job_log` VALUES (61, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-24 18:30:00');
INSERT INTO `schedule_job_log` VALUES (62, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-24 19:00:00');
INSERT INTO `schedule_job_log` VALUES (63, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-24 19:30:01');
INSERT INTO `schedule_job_log` VALUES (64, 1, 'testTask', 'renren', 0, NULL, 2, '2021-06-24 20:00:01');
INSERT INTO `schedule_job_log` VALUES (65, 1, 'testTask', 'renren', 0, NULL, 20, '2021-06-24 20:30:01');
INSERT INTO `schedule_job_log` VALUES (66, 1, 'testTask', 'renren', 0, NULL, 286, '2021-06-25 11:30:05');
INSERT INTO `schedule_job_log` VALUES (67, 1, 'testTask', 'renren', 0, NULL, 1, '2021-06-25 12:00:00');
INSERT INTO `schedule_job_log` VALUES (68, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-25 12:30:01');
INSERT INTO `schedule_job_log` VALUES (69, 1, 'testTask', 'renren', 0, NULL, 4, '2021-06-25 13:00:00');
INSERT INTO `schedule_job_log` VALUES (70, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-25 13:30:01');
INSERT INTO `schedule_job_log` VALUES (71, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-25 14:00:01');
INSERT INTO `schedule_job_log` VALUES (72, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-25 18:30:01');
INSERT INTO `schedule_job_log` VALUES (73, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-25 19:00:01');
INSERT INTO `schedule_job_log` VALUES (74, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-25 19:30:01');
INSERT INTO `schedule_job_log` VALUES (75, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-25 20:00:01');
INSERT INTO `schedule_job_log` VALUES (76, 1, 'testTask', 'renren', 0, NULL, 4, '2021-06-25 20:30:01');
INSERT INTO `schedule_job_log` VALUES (77, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-25 21:00:00');
INSERT INTO `schedule_job_log` VALUES (78, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-26 11:30:00');
INSERT INTO `schedule_job_log` VALUES (79, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-26 12:00:01');
INSERT INTO `schedule_job_log` VALUES (80, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-26 12:30:01');
INSERT INTO `schedule_job_log` VALUES (81, 1, 'testTask', 'renren', 0, NULL, 2, '2021-06-26 13:00:02');
INSERT INTO `schedule_job_log` VALUES (82, 1, 'testTask', 'renren', 0, NULL, 1, '2021-06-26 13:30:01');
INSERT INTO `schedule_job_log` VALUES (83, 1, 'testTask', 'renren', 0, NULL, 1, '2021-06-26 14:00:00');
INSERT INTO `schedule_job_log` VALUES (84, 1, 'testTask', 'renren', 0, NULL, 1, '2021-06-26 15:00:01');
INSERT INTO `schedule_job_log` VALUES (85, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-26 15:30:01');
INSERT INTO `schedule_job_log` VALUES (86, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-26 18:30:00');
INSERT INTO `schedule_job_log` VALUES (87, 1, 'testTask', 'renren', 0, NULL, 4, '2021-06-26 19:00:01');
INSERT INTO `schedule_job_log` VALUES (88, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-26 19:30:00');
INSERT INTO `schedule_job_log` VALUES (89, 1, 'testTask', 'renren', 0, NULL, 4, '2021-06-26 20:00:01');
INSERT INTO `schedule_job_log` VALUES (90, 1, 'testTask', 'renren', 0, NULL, 8, '2021-06-26 20:30:00');
INSERT INTO `schedule_job_log` VALUES (91, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-27 11:30:00');
INSERT INTO `schedule_job_log` VALUES (92, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-27 12:00:01');
INSERT INTO `schedule_job_log` VALUES (93, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-27 12:30:00');
INSERT INTO `schedule_job_log` VALUES (94, 1, 'testTask', 'renren', 0, NULL, 8, '2021-06-27 13:00:02');
INSERT INTO `schedule_job_log` VALUES (95, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-27 13:30:00');
INSERT INTO `schedule_job_log` VALUES (96, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-27 14:00:00');
INSERT INTO `schedule_job_log` VALUES (97, 1, 'testTask', 'renren', 0, NULL, 1, '2021-06-27 15:00:00');
INSERT INTO `schedule_job_log` VALUES (98, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-27 15:30:00');
INSERT INTO `schedule_job_log` VALUES (99, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-27 16:00:00');
INSERT INTO `schedule_job_log` VALUES (100, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-27 18:30:00');
INSERT INTO `schedule_job_log` VALUES (101, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-27 19:00:01');
INSERT INTO `schedule_job_log` VALUES (102, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-27 19:30:01');
INSERT INTO `schedule_job_log` VALUES (103, 1, 'testTask', 'renren', 0, NULL, 7, '2021-06-27 20:00:04');
INSERT INTO `schedule_job_log` VALUES (104, 1, 'testTask', 'renren', 0, NULL, 1, '2021-06-27 20:30:00');
INSERT INTO `schedule_job_log` VALUES (105, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-27 21:00:01');
INSERT INTO `schedule_job_log` VALUES (106, 1, 'testTask', 'renren', 0, NULL, 3, '2021-06-27 21:30:01');
INSERT INTO `schedule_job_log` VALUES (107, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-27 22:00:01');
INSERT INTO `schedule_job_log` VALUES (108, 1, 'testTask', 'renren', 0, NULL, 3, '2021-06-27 23:00:01');
INSERT INTO `schedule_job_log` VALUES (109, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-27 23:30:00');
INSERT INTO `schedule_job_log` VALUES (110, 1, 'testTask', 'renren', 0, NULL, 1, '2021-06-28 00:00:01');
INSERT INTO `schedule_job_log` VALUES (111, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-28 11:30:00');
INSERT INTO `schedule_job_log` VALUES (112, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-28 12:00:00');
INSERT INTO `schedule_job_log` VALUES (113, 1, 'testTask', 'renren', 0, NULL, 2, '2021-06-28 12:30:01');
INSERT INTO `schedule_job_log` VALUES (114, 1, 'testTask', 'renren', 0, NULL, 1, '2021-06-28 13:00:01');
INSERT INTO `schedule_job_log` VALUES (115, 1, 'testTask', 'renren', 0, NULL, 2, '2021-06-28 13:30:01');
INSERT INTO `schedule_job_log` VALUES (116, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-28 14:00:00');
INSERT INTO `schedule_job_log` VALUES (117, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-28 14:30:00');
INSERT INTO `schedule_job_log` VALUES (118, 1, 'testTask', 'renren', 0, NULL, 1, '2021-06-28 15:00:00');
INSERT INTO `schedule_job_log` VALUES (119, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-28 15:30:00');
INSERT INTO `schedule_job_log` VALUES (120, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-28 16:00:00');
INSERT INTO `schedule_job_log` VALUES (121, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-28 16:30:00');
INSERT INTO `schedule_job_log` VALUES (122, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-28 17:00:00');
INSERT INTO `schedule_job_log` VALUES (123, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-28 17:30:00');
INSERT INTO `schedule_job_log` VALUES (124, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-28 18:00:00');
INSERT INTO `schedule_job_log` VALUES (125, 1, 'testTask', 'renren', 0, NULL, 0, '2021-06-28 18:30:00');

-- ----------------------------
-- Table structure for sys_captcha
-- ----------------------------
DROP TABLE IF EXISTS `sys_captcha`;
CREATE TABLE `sys_captcha`  (
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'uuid',
  `code` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '验证码',
  `expire_time` datetime(0) NULL DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统验证码' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_captcha
-- ----------------------------
INSERT INTO `sys_captcha` VALUES ('00424b2a-a89a-4083-8128-cf0e39466207', 'en34f', '2021-06-24 12:40:22');
INSERT INTO `sys_captcha` VALUES ('0060941b-36f8-4702-8a86-45d64830db70', 'nxx87', '2021-06-27 23:13:39');
INSERT INTO `sys_captcha` VALUES ('00717761-540e-437c-8703-c50d0e23fff8', 'a2wgy', '2021-06-28 11:44:56');
INSERT INTO `sys_captcha` VALUES ('03da2d69-c742-493f-8fa4-4c22df717219', 'enxcp', '2021-06-21 17:31:46');
INSERT INTO `sys_captcha` VALUES ('04379e5a-51dd-49ca-84e2-63b87f88959e', 'mm8nc', '2021-06-17 16:23:37');
INSERT INTO `sys_captcha` VALUES ('04f35696-82de-44de-8e9e-7d0388f34c6f', '8n53b', '2021-06-27 23:05:29');
INSERT INTO `sys_captcha` VALUES ('061833a1-858e-457d-86af-9462706339fe', '82n85', '2021-06-24 19:35:32');
INSERT INTO `sys_captcha` VALUES ('084bc6e1-1aaa-48b0-8a6f-4dc978cad5d1', 'fd8n6', '2021-06-24 19:03:55');
INSERT INTO `sys_captcha` VALUES ('0e048169-681a-44a1-8a3b-13a8515e1250', 'nbfgn', '2021-06-25 18:15:01');
INSERT INTO `sys_captcha` VALUES ('1', 'y7dne', '2021-06-22 08:27:46');
INSERT INTO `sys_captcha` VALUES ('123', 'c6gp8', '2021-06-15 19:08:51');
INSERT INTO `sys_captcha` VALUES ('19e19e67-3c8d-4a4c-8928-289e0a07f285', 'b7caf', '2021-06-27 18:15:52');
INSERT INTO `sys_captcha` VALUES ('2', 'w6aga', '2021-06-22 08:30:08');
INSERT INTO `sys_captcha` VALUES ('200845b4-b59c-4178-8a26-fc783caaa8e2', '5xpnc', '2021-06-25 18:25:47');
INSERT INTO `sys_captcha` VALUES ('23', 'p5pwb', '2021-06-15 19:08:56');
INSERT INTO `sys_captcha` VALUES ('2323432432', 'edb25', '2021-06-15 19:15:12');
INSERT INTO `sys_captcha` VALUES ('2409c954-0ca0-411f-8b15-6f73163e865a', 'd54ce', '2021-06-24 20:09:42');
INSERT INTO `sys_captcha` VALUES ('295a5605-1193-46ff-87fa-7effbc705a1f', '8bn4m', '2021-06-24 12:24:50');
INSERT INTO `sys_captcha` VALUES ('2be52867-49ce-4ff0-8adf-33f26276a3e0', 'wm4eg', '2021-06-25 13:25:11');
INSERT INTO `sys_captcha` VALUES ('2ccd0be2-c426-4f9d-8cad-6175926c4d6a', 'my2b2', '2021-06-25 11:39:11');
INSERT INTO `sys_captcha` VALUES ('2ddd1bfc-d2d1-43b5-856b-fff556d0051f', 'ebdem', '2021-06-27 11:10:00');
INSERT INTO `sys_captcha` VALUES ('2e14d747-5b74-4e40-85b3-8d085069e36d', 'cdx6m', '2021-06-28 13:56:10');
INSERT INTO `sys_captcha` VALUES ('3001b264-6ceb-45e5-834d-9d95f413090d', '84pym', '2021-06-24 12:18:32');
INSERT INTO `sys_captcha` VALUES ('3554efd5-8a77-40a7-8de6-88045137a91c', 'g5xcb', '2021-06-24 19:16:19');
INSERT INTO `sys_captcha` VALUES ('37a56e0b-b5de-4602-89a5-f40410b3f6af', 'wmxdx', '2021-06-27 18:19:08');
INSERT INTO `sys_captcha` VALUES ('39f761f1-934d-4557-8d52-074f6ed57c09', 'p8pxb', '2021-06-26 11:45:26');
INSERT INTO `sys_captcha` VALUES ('3a3335c3-f6cc-456c-8f74-b079e664df4c', 'bcbb8', '2021-06-25 19:07:26');
INSERT INTO `sys_captcha` VALUES ('467c8d77-4d59-43af-8cc7-1469b54d7033', '43e26', '2021-06-24 12:37:49');
INSERT INTO `sys_captcha` VALUES ('4b8b6d57-0d42-4901-8311-4fe6796e96eb', 'anm82', '2021-06-27 23:30:58');
INSERT INTO `sys_captcha` VALUES ('4c615a6c-27b6-4755-81b9-4b7526500c32', 'yfee5', '2021-06-24 20:33:24');
INSERT INTO `sys_captcha` VALUES ('573205cd-cc1c-4f58-85c0-cd6ae13bebfe', '2cpcx', '2021-06-27 23:13:47');
INSERT INTO `sys_captcha` VALUES ('574c5fc1-5804-4c4c-83ac-b6608ef7f8ae', '8x2ef', '2021-06-24 19:45:10');
INSERT INTO `sys_captcha` VALUES ('579914ed-6be2-4731-881f-aab5a74839b4', '2ebf2', '2021-06-25 11:35:47');
INSERT INTO `sys_captcha` VALUES ('5dd67d0e-b6d2-496e-83e3-98b5ff946119', 'p2eef', '2021-06-24 12:24:00');
INSERT INTO `sys_captcha` VALUES ('62d6f1c0-4246-4696-82be-de61770144b5', 'nnd6y', '2021-06-24 18:56:25');
INSERT INTO `sys_captcha` VALUES ('632c2918-0373-4d3b-8440-369fd2d58edb', 'gy573', '2021-06-27 18:09:19');
INSERT INTO `sys_captcha` VALUES ('63341d80-8b2d-4b8d-8779-7e2967501a8b', '7gfy5', '2021-06-25 18:14:52');
INSERT INTO `sys_captcha` VALUES ('6949df00-3494-4602-8b22-02116bad10fa', '852w3', '2021-06-25 11:26:29');
INSERT INTO `sys_captcha` VALUES ('6f103472-f96e-4c0e-80b9-e97f1be5f9ac', 'gf27n', '2021-06-26 13:03:41');
INSERT INTO `sys_captcha` VALUES ('704271c6-04d9-489f-848c-4de7ad6639f5', '8np7y', '2021-06-28 13:23:36');
INSERT INTO `sys_captcha` VALUES ('765bfc7b-0554-4682-815a-86fc1a4a30ba', 'y6nmx', '2021-06-25 20:15:52');
INSERT INTO `sys_captcha` VALUES ('76705804-47ec-40e6-87b3-68c2f9471a9a', '8fnne', '2021-06-28 13:10:30');
INSERT INTO `sys_captcha` VALUES ('7b6b3607-72fe-4e1d-837a-d520b2bd56cf', 'bbcxf', '2021-06-25 19:10:55');
INSERT INTO `sys_captcha` VALUES ('83d1a0de-9452-45c6-8075-0f9b6806222e', 'ba8y6', '2021-06-28 11:51:18');
INSERT INTO `sys_captcha` VALUES ('88fc7f68-c838-4efd-8eaf-6e957b1caf68', 'dnx77', '2021-06-27 18:09:16');
INSERT INTO `sys_captcha` VALUES ('8eb6c4b4-d65a-48ec-8bfd-2eb9c824ed51', 'd7xd7', '2021-06-28 14:39:06');
INSERT INTO `sys_captcha` VALUES ('95e4a04d-ad6b-4b30-8477-8036655b0973', '5ccn5', '2021-06-27 13:09:13');
INSERT INTO `sys_captcha` VALUES ('97319635-3a7a-43d9-8dc5-dbee6182c6e3', 'p55em', '2021-06-24 12:14:46');
INSERT INTO `sys_captcha` VALUES ('9d00d823-4a7f-428e-82ff-9f1ccf5d8eb5', 'ggmm7', '2021-06-25 18:25:47');
INSERT INTO `sys_captcha` VALUES ('a0612778-af36-4004-8a26-63b3eae0392b', 'e3gn8', '2021-06-28 11:46:31');
INSERT INTO `sys_captcha` VALUES ('a2e6c2a6-86b4-40d2-807d-37f047329e49', 'n4w2c', '2021-06-17 16:23:49');
INSERT INTO `sys_captcha` VALUES ('a5929bb5-fc14-4c6b-86a5-b3295881c8df', 'xpfdw', '2021-06-24 19:01:48');
INSERT INTO `sys_captcha` VALUES ('a6197b63-33d9-4987-8e26-c895dd500bb8', 'x6ma7', '2021-06-28 13:56:05');
INSERT INTO `sys_captcha` VALUES ('a88d29a4-2bea-40b5-83d0-15f194a64ca2', '247fn', '2021-06-27 20:49:18');
INSERT INTO `sys_captcha` VALUES ('b3a20ff4-39d4-44b5-8b8d-6f7a95645067', 'n85b2', '2021-06-28 11:45:27');
INSERT INTO `sys_captcha` VALUES ('be3350c4-22ca-43a3-8c0a-23d629430f0c', 'x76n5', '2021-06-17 16:19:41');
INSERT INTO `sys_captcha` VALUES ('c8e6f00b-1c0b-486c-83f8-08d926eb5afd', 'c54dm', '2021-06-25 19:02:31');
INSERT INTO `sys_captcha` VALUES ('c99b57fa-ccb1-49fd-8898-0496a32a211c', 'ec37f', '2021-06-27 18:08:27');
INSERT INTO `sys_captcha` VALUES ('cfc8123e-da64-45ea-8a94-57ac7cfb33de', 'bdpg4', '2021-06-28 14:39:10');
INSERT INTO `sys_captcha` VALUES ('d7553c22-ac7b-4344-8478-84f6e8452aef', '73a3n', '2021-06-24 20:12:44');
INSERT INTO `sys_captcha` VALUES ('d772cd93-e75c-41ae-8994-1fc59c65e6a6', 'e6fn4', '2021-06-18 23:54:17');
INSERT INTO `sys_captcha` VALUES ('d9cef8ef-38a4-402e-87d4-37e72654fd5d', 'be85g', '2021-06-24 13:49:31');
INSERT INTO `sys_captcha` VALUES ('de91bd26-87a2-49aa-822e-b27997deee13', 'g3na4', '2021-06-28 13:24:46');
INSERT INTO `sys_captcha` VALUES ('dsfasdfs', 'y4fn3', '2021-06-15 19:07:22');
INSERT INTO `sys_captcha` VALUES ('e2286e3d-e51e-460b-8a5f-a73c80de37fd', '2wg2n', '2021-06-28 11:51:18');
INSERT INTO `sys_captcha` VALUES ('ebf928a1-cec5-4c55-87d2-db8eaea05d45', 'bp7nw', '2021-06-24 20:00:16');
INSERT INTO `sys_captcha` VALUES ('eea43976-9d8d-4df3-89c6-64aacb5fb61e', '35wny', '2021-06-24 18:59:55');
INSERT INTO `sys_captcha` VALUES ('fcdce07a-30d7-4738-8b59-3587670c315f', 'g67bw', '2021-06-28 00:06:28');
INSERT INTO `sys_captcha` VALUES ('ff0fdad7-463a-4337-85e0-1df6dbf0552e', 'pnmxx', '2021-06-27 21:49:55');
INSERT INTO `sys_captcha` VALUES ('ff3b696a-8370-4726-895b-c134f48cf100', '7f5dm', '2021-06-25 20:16:41');
INSERT INTO `sys_captcha` VALUES ('ffa26f59-525b-4bae-87e9-889983ad136d', '8byp8', '2021-06-24 20:15:25');
INSERT INTO `sys_captcha` VALUES ('ffdccdc9-2306-4783-8cc9-d075a10511cc', 'nwe74', '2021-06-24 12:14:45');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `param_key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'key',
  `param_value` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) NULL DEFAULT 1 COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `param_key`(`param_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统配置信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, 'CLOUD_STORAGE_CONFIG_KEY', '{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuBucketName\":\"ios-app\",\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"type\":1}', 0, '云存储配置信息');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 88 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES (1, 'admin', '保存角色', 'com.shangcheng.psychology.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":1,\"roleName\":\"管理员\",\"remark\":\"管理员\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,-666666],\"createTime\":\"Jun 15, 2021 8:03:00 PM\"}]', 2890, '127.0.0.1', '2021-06-15 20:03:03');
INSERT INTO `sys_log` VALUES (2, 'admin', '保存角色', 'com.shangcheng.psychology.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":2,\"roleName\":\"心理老师\",\"remark\":\"心理老师\",\"createUserId\":1,\"menuIdList\":[15,19,23,-666666,1,2,3,4],\"createTime\":\"Jun 15, 2021 8:03:58 PM\"}]', 820, '127.0.0.1', '2021-06-15 20:03:59');
INSERT INTO `sys_log` VALUES (3, 'admin', '保存角色', 'com.shangcheng.psychology.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":3,\"roleName\":\"心理老师\",\"remark\":\"心理老师\",\"createUserId\":1,\"menuIdList\":[15,19,23,-666666,1,2,3,4],\"createTime\":\"Jun 15, 2021 8:03:59 PM\"}]', 815, '127.0.0.1', '2021-06-15 20:04:00');
INSERT INTO `sys_log` VALUES (4, 'admin', '删除角色', 'com.shangcheng.psychology.modules.sys.controller.SysRoleController.delete()', '[[3]]', 322, '127.0.0.1', '2021-06-15 20:04:05');
INSERT INTO `sys_log` VALUES (5, 'admin', '保存角色', 'com.shangcheng.psychology.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":4,\"roleName\":\"咨询者\",\"remark\":\"\",\"createUserId\":1,\"menuIdList\":[15,19,23,7,-666666,1,2,3,4,6],\"createTime\":\"Jun 15, 2021 8:04:24 PM\"}]', 961, '127.0.0.1', '2021-06-15 20:04:26');
INSERT INTO `sys_log` VALUES (6, 'admin', '修改角色', 'com.shangcheng.psychology.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":4,\"roleName\":\"咨询者\",\"remark\":\"咨询者\",\"createUserId\":1,\"menuIdList\":[15,19,23,7,-666666,1,2,3,4,6]}]', 965, '127.0.0.1', '2021-06-15 20:04:38');
INSERT INTO `sys_log` VALUES (7, 'admin', '保存菜单', 'com.shangcheng.psychology.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":31,\"parentId\":0,\"name\":\"预约医生\",\"type\":0,\"icon\":\"geren\",\"orderNum\":1}]', 88, '127.0.0.1', '2021-06-17 15:54:10');
INSERT INTO `sys_log` VALUES (8, 'admin', '保存菜单', 'com.shangcheng.psychology.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":32,\"parentId\":0,\"name\":\"心理测试\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"\",\"orderNum\":3}]', 86, '127.0.0.1', '2021-06-17 15:56:26');
INSERT INTO `sys_log` VALUES (9, 'admin', '修改菜单', 'com.shangcheng.psychology.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":1,\"parentId\":0,\"name\":\"系统管理\",\"type\":0,\"icon\":\"system\",\"orderNum\":10}]', 89, '127.0.0.1', '2021-06-17 15:57:48');
INSERT INTO `sys_log` VALUES (10, 'admin', '修改菜单', 'com.shangcheng.psychology.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":32,\"parentId\":0,\"name\":\"心理测试\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"daohang\",\"orderNum\":2}]', 76, '127.0.0.1', '2021-06-17 15:59:08');
INSERT INTO `sys_log` VALUES (11, 'admin', '修改菜单', 'com.shangcheng.psychology.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":32,\"parentId\":0,\"name\":\"心理测试\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"daohang\",\"orderNum\":2}]', 73, '127.0.0.1', '2021-06-17 15:59:09');
INSERT INTO `sys_log` VALUES (12, 'admin', '保存菜单', 'com.shangcheng.psychology.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":33,\"parentId\":0,\"name\":\"我的排班\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"geren\",\"orderNum\":3}]', 88, '127.0.0.1', '2021-06-17 16:00:25');
INSERT INTO `sys_log` VALUES (13, 'admin', '保存用户', 'com.shangcheng.psychology.modules.sys.controller.SysUserController.save()', '[{\"userId\":2,\"username\":\"wu\",\"password\":\"bc2b281a28acf5e310df744182cb3ffa84d1bcfc2f4cd4283869073801b2a39b\",\"salt\":\"FAVAPTii1QufAy1K7a0R\",\"email\":\"2947323341@qq.com\",\"mobile\":\"15882372901\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Jun 17, 2021 4:12:31 PM\"}]', 953, '127.0.0.1', '2021-06-17 16:12:32');
INSERT INTO `sys_log` VALUES (14, 'wu', '保存用户', 'com.shangcheng.psychology.modules.sys.controller.SysUserController.save()', '[{\"userId\":3,\"username\":\"wu2\",\"password\":\"cb2193c18d4225e9252b6f7f5a705a6af0dd35a3fabb6c4f012c74594fcb2222\",\"salt\":\"FpYwMbqOVMrRF7ECZbkb\",\"email\":\"2947323341@qq.com\",\"mobile\":\"15882372901\",\"status\":1,\"roleIdList\":[],\"createUserId\":2,\"createTime\":\"Jun 17, 2021 4:13:45 PM\"}]', 541, '127.0.0.1', '2021-06-17 16:13:46');
INSERT INTO `sys_log` VALUES (15, 'admin', '修改角色', 'com.shangcheng.psychology.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"管理员\",\"remark\":\"管理员\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,32,33,-666666]}]', 3300, '127.0.0.1', '2021-06-17 16:15:13');
INSERT INTO `sys_log` VALUES (16, 'admin', '修改角色', 'com.shangcheng.psychology.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":2,\"roleName\":\"心理老师\",\"remark\":\"心理老师\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,32,33,-666666]}]', 3062, '127.0.0.1', '2021-06-17 16:15:33');
INSERT INTO `sys_log` VALUES (17, 'admin', '修改角色', 'com.shangcheng.psychology.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":4,\"roleName\":\"咨询者\",\"remark\":\"咨询者\",\"createUserId\":1,\"menuIdList\":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,32,33,-666666]}]', 3017, '127.0.0.1', '2021-06-17 16:15:47');
INSERT INTO `sys_log` VALUES (18, 'admin', '修改用户', 'com.shangcheng.psychology.modules.sys.controller.SysUserController.update()', '[{\"userId\":3,\"username\":\"wu2\",\"salt\":\"FpYwMbqOVMrRF7ECZbkb\",\"email\":\"2947323341@qq.com\",\"mobile\":\"15882372901\",\"status\":1,\"roleIdList\":[1,2,4],\"createUserId\":1}]', 564, '127.0.0.1', '2021-06-17 16:19:21');
INSERT INTO `sys_log` VALUES (19, 'admin', '修改用户', 'com.shangcheng.psychology.modules.sys.controller.SysUserController.update()', '[{\"userId\":2,\"username\":\"wu\",\"salt\":\"FAVAPTii1QufAy1K7a0R\",\"email\":\"2947323341@qq.com\",\"mobile\":\"15882372901\",\"status\":1,\"roleIdList\":[],\"createUserId\":1}]', 284, '127.0.0.1', '2021-06-17 16:24:11');
INSERT INTO `sys_log` VALUES (20, 'admin', '修改用户', 'com.shangcheng.psychology.modules.sys.controller.SysUserController.update()', '[{\"userId\":2,\"username\":\"wu\",\"salt\":\"FAVAPTii1QufAy1K7a0R\",\"email\":\"2947323341@qq.com\",\"mobile\":\"15882372901\",\"status\":1,\"roleIdList\":[1,2,4],\"createUserId\":1}]', 591, '127.0.0.1', '2021-06-17 16:36:00');
INSERT INTO `sys_log` VALUES (21, 'admin', '修改用户', 'com.shangcheng.psychology.modules.sys.controller.SysUserController.update()', '[{\"userId\":1,\"username\":\"admin\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"root@renren.io\",\"mobile\":\"13612345678\",\"status\":1,\"roleIdList\":[1,2,4],\"createUserId\":1}]', 557, '127.0.0.1', '2021-06-17 16:36:12');
INSERT INTO `sys_log` VALUES (22, 'admin', '删除菜单', 'com.shangcheng.psychology.modules.sys.controller.SysMenuController.delete()', '[33]', 244, '127.0.0.1', '2021-06-21 14:45:09');
INSERT INTO `sys_log` VALUES (23, 'admin', '保存用户', 'com.shangcheng.psychology.modules.sys.controller.SysUserController.save()', '[{\"userId\":4,\"username\":\"doctor1\",\"password\":\"d6f13dc0261408bcfda3e391a49ec65f6ddd7c05c59108a2c8aba6c5b8fbb837\",\"salt\":\"jNS6yhptWxAdQhWZf8c9\",\"email\":\"123@qq.com\",\"mobile\":\"11111111111\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1,\"createTime\":\"Jun 21, 2021 3:57:41 PM\"}]', 667, '127.0.0.1', '2021-06-21 15:57:42');
INSERT INTO `sys_log` VALUES (24, 'admin', '保存用户', 'com.shangcheng.psychology.modules.sys.controller.SysUserController.save()', '[{\"userId\":5,\"username\":\"d1\",\"password\":\"792454d022dfd85d0efde6b054d50819f2e8bc572dbe850d7742c19e4621376e\",\"salt\":\"9CTnkUNdpxlIAPwvv5eH\",\"email\":\"11@qq.com\",\"mobile\":\"15228888888\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1,\"createTime\":\"Jun 21, 2021 4:04:29 PM\"}]', 603, '127.0.0.1', '2021-06-21 16:04:30');
INSERT INTO `sys_log` VALUES (25, 'admin', '保存用户', 'com.shangcheng.psychology.modules.sys.controller.SysUserController.save()', '[{\"userId\":6,\"username\":\"d2\",\"password\":\"c4d5b35d189629c6805787041a7758f632ca12fda413b6249e6838c066fa1315\",\"salt\":\"wraAlpupffkKSzmcQTv2\",\"email\":\"222@qq.com\",\"mobile\":\"11223322151\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1,\"createTime\":\"Jun 21, 2021 4:06:40 PM\"}]', 970, '127.0.0.1', '2021-06-21 16:06:41');
INSERT INTO `sys_log` VALUES (26, 'admin', '保存用户', 'com.shangcheng.psychology.modules.sys.controller.SysUserController.save()', '[{\"userId\":7,\"username\":\"d3\",\"password\":\"f3cf83c86e33c72796eb3f8ddbd2c7eeef08b25ef7bb537f95becec4785c3a4c\",\"salt\":\"ftsLtrvqRub6txAdG6ma\",\"email\":\"1213@qq.com\",\"mobile\":\"11111111111\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1,\"createTime\":\"Jun 21, 2021 4:08:26 PM\"}]', 608, '127.0.0.1', '2021-06-21 16:08:27');
INSERT INTO `sys_log` VALUES (27, 'admin', '保存用户', 'com.shangcheng.psychology.modules.sys.controller.SysUserController.save()', '[{\"userId\":8,\"username\":\"dd\",\"password\":\"9bb8e8200c864c8bec4ca242c5ecf322c045b4b1682a8d74d4fa93a5163aebed\",\"salt\":\"GWqbGos0lH2yevGlDyTC\",\"email\":\"dd@qq.com\",\"mobile\":\"12312312311\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1,\"createTime\":\"Jun 21, 2021 4:11:18 PM\"}]', 624, '127.0.0.1', '2021-06-21 16:11:19');
INSERT INTO `sys_log` VALUES (28, 'admin', '删除用户', 'com.shangcheng.psychology.modules.sys.controller.SysUserController.delete()', '[[4]]', 93, '127.0.0.1', '2021-06-21 16:12:36');
INSERT INTO `sys_log` VALUES (29, 'admin', '删除用户', 'com.shangcheng.psychology.modules.sys.controller.SysUserController.delete()', '[[5]]', 90, '127.0.0.1', '2021-06-21 16:12:42');
INSERT INTO `sys_log` VALUES (30, 'admin', '删除用户', 'com.shangcheng.psychology.modules.sys.controller.SysUserController.delete()', '[[6,7]]', 90, '127.0.0.1', '2021-06-21 16:12:49');
INSERT INTO `sys_log` VALUES (31, 'admin', '删除用户', 'com.shangcheng.psychology.modules.sys.controller.SysUserController.delete()', '[[8]]', 92, '127.0.0.1', '2021-06-21 16:16:13');
INSERT INTO `sys_log` VALUES (32, 'admin', '保存用户', 'com.shangcheng.psychology.modules.sys.controller.SysUserController.save()', '[{\"userId\":9,\"username\":\"client1\",\"password\":\"d5404565a5c935f486662024d95eab7da0f6ca41389b6102095af8b45fede849\",\"salt\":\"cQgdrvA2sGdQwCvODcAQ\",\"email\":\"123@qq.com\",\"mobile\":\"15882222222\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1,\"createTime\":\"Jun 21, 2021 4:17:56 PM\"}]', 524, '127.0.0.1', '2021-06-21 16:17:57');
INSERT INTO `sys_log` VALUES (33, 'admin', '保存用户', 'com.shangcheng.psychology.modules.sys.controller.SysUserController.save()', '[{\"userId\":12,\"username\":\"client2\",\"password\":\"5b5f656c9d4cb67cbb817093ffb9f4b4a4280dd9055598b01fd8cbf01b222d0e\",\"salt\":\"YCsfcnjE7N8kto4Rcm4b\",\"email\":\"123@qq.com\",\"mobile\":\"15224444111\",\"status\":1,\"roleIdList\":[4],\"createUserId\":1,\"createTime\":\"Jun 21, 2021 4:18:47 PM\"}]', 524, '127.0.0.1', '2021-06-21 16:18:48');
INSERT INTO `sys_log` VALUES (34, 'admin', '删除用户', 'com.shangcheng.psychology.modules.sys.controller.SysUserController.delete()', '[[12]]', 100, '127.0.0.1', '2021-06-21 16:19:44');
INSERT INTO `sys_log` VALUES (35, 'admin', '删除用户', 'com.shangcheng.psychology.modules.sys.controller.SysUserController.delete()', '[[9]]', 90, '127.0.0.1', '2021-06-21 16:19:51');
INSERT INTO `sys_log` VALUES (36, 'admin', '保存用户', 'com.shangcheng.psychology.modules.sys.controller.SysUserController.save()', '[{\"userId\":13,\"username\":\"client1\",\"password\":\"e89dc0477e568b0da0ef3a65b59f14f5e87e1491bd91f440601e4ad11ed54f8a\",\"salt\":\"0LkWweDHtkpPJSUXA97y\",\"email\":\"29@qq.com\",\"mobile\":\"15223333666\",\"status\":1,\"roleIdList\":[4],\"createUserId\":1,\"createTime\":\"Jun 21, 2021 4:20:23 PM\"}]', 529, '127.0.0.1', '2021-06-21 16:20:24');
INSERT INTO `sys_log` VALUES (37, 'admin', '删除用户', 'com.shangcheng.psychology.modules.sys.controller.SysUserController.delete()', '[[2,3]]', 93, '127.0.0.1', '2021-06-21 16:20:35');
INSERT INTO `sys_log` VALUES (38, 'admin', '保存用户', 'com.shangcheng.psychology.modules.sys.controller.SysUserController.save()', '[{\"userId\":14,\"username\":\"doctor1\",\"password\":\"afe05c24508595b9dece9b561423020f97eaa4e22cf7946f40e5450c76b2ee22\",\"salt\":\"LWw8JopeR44uoFcfhVSV\",\"email\":\"123@qq.com\",\"mobile\":\"12331111444\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1,\"createTime\":\"Jun 21, 2021 4:21:01 PM\"}]', 513, '127.0.0.1', '2021-06-21 16:21:02');
INSERT INTO `sys_log` VALUES (39, 'admin', '修改用户', 'com.shangcheng.psychology.modules.sys.controller.SysUserController.update()', '[{\"userId\":1,\"username\":\"admin\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"root@renren.io\",\"mobile\":\"13612345678\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1}]', 866, '127.0.0.1', '2021-06-21 16:27:13');
INSERT INTO `sys_log` VALUES (40, 'admin', '保存用户', 'com.shangcheng.psychology.modules.sys.controller.SysUserController.save()', '[{\"userId\":15,\"username\":\"doctor2\",\"password\":\"65eca9c1c28d8f77ef7fea61cda9ae20be2b5160777c1aeb7f3eb41ae4ff3d29\",\"salt\":\"fWv2qjeU8mIkyTFj1YcZ\",\"email\":\"doctor2@163.com\",\"mobile\":\"13384862614\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1,\"createTime\":\"Jun 21, 2021, 10:46:35 PM\"}]', 522, '127.0.0.1', '2021-06-21 22:46:36');
INSERT INTO `sys_log` VALUES (41, 'admin', '保存菜单', 'com.shangcheng.psychology.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":34,\"parentId\":32,\"name\":\"问卷\",\"url\":\"/psycho/question\",\"perms\":\"\",\"type\":1,\"icon\":\"editor\",\"orderNum\":0}]', 102, '127.0.0.1', '2021-06-24 12:25:41');
INSERT INTO `sys_log` VALUES (42, 'admin', '修改菜单', 'com.shangcheng.psychology.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":34,\"parentId\":32,\"name\":\"问卷\",\"url\":\"/psychology/question\",\"perms\":\"\",\"type\":1,\"icon\":\"editor\",\"orderNum\":0}]', 422, '127.0.0.1', '2021-06-24 12:26:37');
INSERT INTO `sys_log` VALUES (43, 'admin', '修改菜单', 'com.shangcheng.psychology.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":34,\"parentId\":32,\"name\":\"问卷\",\"url\":\"/psychology/question\",\"perms\":\"\",\"type\":1,\"icon\":\"editor\",\"orderNum\":0}]', 740, '127.0.0.1', '2021-06-24 12:26:38');
INSERT INTO `sys_log` VALUES (44, 'doctor2', '保存菜单', 'com.shangcheng.psychology.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":35,\"parentId\":31,\"name\":\"开始预约\",\"url\":\"/psychology/doctor\",\"perms\":\"\",\"type\":1,\"icon\":\"role\",\"orderNum\":0}]', 119, '127.0.0.1', '2021-06-24 12:57:20');
INSERT INTO `sys_log` VALUES (45, 'admin', '修改菜单', 'com.shangcheng.psychology.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":34,\"parentId\":32,\"name\":\"问题列表\",\"url\":\"/psychology/question\",\"perms\":\"\",\"type\":1,\"icon\":\"editor\",\"orderNum\":0}]', 138, '127.0.0.1', '2021-06-24 13:34:31');
INSERT INTO `sys_log` VALUES (46, 'doctor1', '修改用户', 'com.shangcheng.psychology.modules.sys.controller.SysUserController.update()', '[{\"userId\":14,\"username\":\"doctor1\",\"salt\":\"LWw8JopeR44uoFcfhVSV\",\"email\":\"123@qq.com\",\"mobile\":\"12331111444\",\"status\":1,\"roleIdList\":[2,1],\"createUserId\":14}]', 1670, '127.0.0.1', '2021-06-24 18:32:34');
INSERT INTO `sys_log` VALUES (47, 'doctor1', '修改用户', 'com.shangcheng.psychology.modules.sys.controller.SysUserController.update()', '[{\"userId\":14,\"username\":\"doctor1\",\"salt\":\"LWw8JopeR44uoFcfhVSV\",\"email\":\"123@qq.com\",\"mobile\":\"12331111444\",\"status\":1,\"roleIdList\":[2],\"createUserId\":14}]', 379, '127.0.0.1', '2021-06-24 18:32:50');
INSERT INTO `sys_log` VALUES (48, 'doctor1', '保存菜单', 'com.shangcheng.psychology.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":36,\"parentId\":0,\"name\":\"我的\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"admin\",\"orderNum\":0}]', 202, '127.0.0.1', '2021-06-24 20:10:59');
INSERT INTO `sys_log` VALUES (49, 'doctor1', '保存菜单', 'com.shangcheng.psychology.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":37,\"parentId\":0,\"name\":\"我的\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"admin\",\"orderNum\":0}]', 160, '127.0.0.1', '2021-06-24 20:11:00');
INSERT INTO `sys_log` VALUES (50, 'doctor1', '删除菜单', 'com.shangcheng.psychology.modules.sys.controller.SysMenuController.delete()', '[37]', 600, '127.0.0.1', '2021-06-24 20:11:36');
INSERT INTO `sys_log` VALUES (51, 'doctor1', '修改菜单', 'com.shangcheng.psychology.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":36,\"parentId\":0,\"name\":\"医生入口\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"admin\",\"orderNum\":0}]', 678, '127.0.0.1', '2021-06-24 20:13:12');
INSERT INTO `sys_log` VALUES (52, 'doctor1', '修改菜单', 'com.shangcheng.psychology.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":36,\"parentId\":0,\"name\":\"医生入口\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"admin\",\"orderNum\":9}]', 191, '127.0.0.1', '2021-06-24 20:13:29');
INSERT INTO `sys_log` VALUES (53, 'doctor1', '保存菜单', 'com.shangcheng.psychology.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":38,\"parentId\":0,\"name\":\"查看预约\",\"url\":\"/psychology/doctor_archive\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0}]', 168, '127.0.0.1', '2021-06-24 20:15:42');
INSERT INTO `sys_log` VALUES (54, 'doctor1', '修改菜单', 'com.shangcheng.psychology.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":38,\"parentId\":36,\"name\":\"查看预约\",\"url\":\"/psychology/doctor_archive\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0}]', 258, '127.0.0.1', '2021-06-24 20:16:37');
INSERT INTO `sys_log` VALUES (55, 'admin', '保存用户', 'com.shangcheng.psychology.modules.sys.controller.SysUserController.save()', '[{\"userId\":16,\"username\":\"client2\",\"password\":\"1ba2e37af4ecb53b4e0f7326abddd494e79b366782838129d780c190c412e510\",\"salt\":\"2TD5AkdhJOTHXbrQ3Wj7\",\"email\":\"121545@qq.com\",\"mobile\":\"18880236547\",\"status\":1,\"roleIdList\":[4],\"createUserId\":1,\"createTime\":\"Jun 25, 2021 7:05:30 PM\"}]', 1377, '127.0.0.1', '2021-06-25 19:05:32');
INSERT INTO `sys_log` VALUES (56, 'admin', '保存用户', 'com.shangcheng.psychology.modules.sys.controller.SysUserController.save()', '[{\"userId\":17,\"username\":\"client3\",\"password\":\"febcb65a7d11d8821b2137ecceb07f950b0fadb7f8e8d1dc5c6e3f690353d13e\",\"salt\":\"iVXJUAE9IscKinkqkTTT\",\"email\":\"151654@qq.com\",\"mobile\":\"12154798794\",\"status\":1,\"roleIdList\":[4],\"createUserId\":1,\"createTime\":\"Jun 25, 2021 8:10:38 PM\"}]', 1451, '127.0.0.1', '2021-06-25 20:10:39');
INSERT INTO `sys_log` VALUES (57, 'admin', '保存用户', 'com.shangcheng.psychology.modules.sys.controller.SysUserController.save()', '[{\"userId\":18,\"username\":\"doctor3\",\"password\":\"81aa76acd23896e15869bca352090377a2cf936d69d0b0f8da0428ded105ef85\",\"salt\":\"4Upm8Kg6Oa5rYpcPzqmr\",\"email\":\"doctor3@163.com\",\"mobile\":\"13628608841\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1,\"createTime\":\"Jun 25, 2021, 8:21:47 PM\"}]', 1102, '127.0.0.1', '2021-06-25 20:21:48');
INSERT INTO `sys_log` VALUES (58, 'admin', '删除用户', 'com.shangcheng.psychology.modules.sys.controller.SysUserController.delete()', '[[18]]', 242, '127.0.0.1', '2021-06-25 20:28:08');
INSERT INTO `sys_log` VALUES (59, 'doctor2', '保存用户', 'com.shangcheng.psychology.modules.sys.controller.SysUserController.save()', '[{\"userId\":20,\"username\":\"doctor4\",\"password\":\"183785a98c179ba705bcaebc6372a324256d609d681f262547c1e1fffd9ba0e6\",\"salt\":\"fhAJBGy3o31wroWMjVzi\",\"email\":\"2947@qq.com\",\"mobile\":\"15888888999\",\"status\":1,\"roleIdList\":[2],\"createUserId\":15,\"createTime\":\"Jun 26, 2021, 12:52:00 PM\"}]', 1983, '127.0.0.1', '2021-06-26 12:52:02');
INSERT INTO `sys_log` VALUES (60, 'admin', '删除用户', 'com.shangcheng.psychology.modules.sys.controller.SysUserController.delete()', '[[20]]', 102, '127.0.0.1', '2021-06-26 18:21:57');
INSERT INTO `sys_log` VALUES (61, 'client3', '保存菜单', 'com.shangcheng.psychology.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":39,\"parentId\":36,\"name\":\"咨询者答题情况\",\"url\":\"/psychology/client_question\",\"perms\":\"\",\"type\":1,\"icon\":\"log\",\"orderNum\":0}]', 145, '127.0.0.1', '2021-06-27 12:29:11');
INSERT INTO `sys_log` VALUES (62, 'client3', '删除菜单', 'com.shangcheng.psychology.modules.sys.controller.SysMenuController.delete()', '[39]', 215, '127.0.0.1', '2021-06-27 12:52:26');
INSERT INTO `sys_log` VALUES (63, 'admin', '修改菜单', 'com.shangcheng.psychology.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":38,\"parentId\":36,\"name\":\"查看预约\",\"url\":\"/psychology/doctor_archive\",\"perms\":\"\",\"type\":1,\"icon\":\"sousuo\",\"orderNum\":0}]', 127, '127.0.0.1', '2021-06-27 12:55:48');
INSERT INTO `sys_log` VALUES (64, 'admin', '保存菜单', 'com.shangcheng.psychology.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":40,\"parentId\":0,\"name\":\"编辑信息\",\"url\":\"/psychology/aaaa\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0}]', 88, '127.0.0.1', '2021-06-27 13:10:34');
INSERT INTO `sys_log` VALUES (65, 'admin', '修改菜单', 'com.shangcheng.psychology.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":40,\"parentId\":36,\"name\":\"编辑信息\",\"url\":\"/psychology/aaaa\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0}]', 130, '127.0.0.1', '2021-06-27 13:10:54');
INSERT INTO `sys_log` VALUES (66, 'doctor2', '修改菜单', 'com.shangcheng.psychology.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":40,\"parentId\":36,\"name\":\"编辑信息\",\"url\":\"/psychology/doctor-addit-info\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0}]', 125, '127.0.0.1', '2021-06-27 13:20:51');
INSERT INTO `sys_log` VALUES (67, 'client1', '保存菜单', 'com.shangcheng.psychology.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":41,\"parentId\":31,\"name\":\"我的预约\",\"url\":\"/psychology/my\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0}]', 128, '127.0.0.1', '2021-06-27 14:09:39');
INSERT INTO `sys_log` VALUES (68, 'client1', '修改菜单', 'com.shangcheng.psychology.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":41,\"parentId\":31,\"name\":\"我的预约\",\"url\":\"/psychology/mydoctor\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0}]', 131, '127.0.0.1', '2021-06-27 14:10:04');
INSERT INTO `sys_log` VALUES (69, 'client1', '修改菜单', 'com.shangcheng.psychology.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":41,\"parentId\":31,\"name\":\"我的预约\",\"url\":\"/psychology/mydoctor\",\"perms\":\"\",\"type\":1,\"icon\":\"log\",\"orderNum\":0}]', 128, '127.0.0.1', '2021-06-27 14:10:30');
INSERT INTO `sys_log` VALUES (70, 'doctor1', '修改菜单', 'com.shangcheng.psychology.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":40,\"parentId\":36,\"name\":\"编辑信息\",\"url\":\"/psychology/doctor-addit-info\",\"perms\":\"\",\"type\":1,\"icon\":\"bianji\",\"orderNum\":0}]', 140, '127.0.0.1', '2021-06-27 19:52:03');
INSERT INTO `sys_log` VALUES (71, 'client1', '修改菜单', 'com.shangcheng.psychology.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":41,\"parentId\":31,\"name\":\"我的预约\",\"url\":\"/psychology/mydoctor\",\"perms\":\"\",\"type\":1,\"icon\":\"log\",\"orderNum\":0}]', 128, '127.0.0.1', '2021-06-27 20:08:49');
INSERT INTO `sys_log` VALUES (72, 'admin', '修改菜单', 'com.shangcheng.psychology.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":5,\"parentId\":1,\"name\":\"SQL监控\",\"url\":\"http://localhost:8923/renren-fast/druid/sql.html\",\"type\":1,\"icon\":\"sql\",\"orderNum\":4}]', 122, '127.0.0.1', '2021-06-27 20:40:47');
INSERT INTO `sys_log` VALUES (73, 'admin', '删除菜单', 'com.shangcheng.psychology.modules.sys.controller.SysMenuController.delete()', '[29]', 0, '127.0.0.1', '2021-06-27 20:43:50');
INSERT INTO `sys_log` VALUES (74, 'admin', '删除菜单', 'com.shangcheng.psychology.modules.sys.controller.SysMenuController.delete()', '[30]', 0, '127.0.0.1', '2021-06-27 20:43:55');
INSERT INTO `sys_log` VALUES (75, 'admin', '修改菜单', 'com.shangcheng.psychology.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":35,\"parentId\":31,\"name\":\"开始预约\",\"url\":\"/psychology/doctor\",\"perms\":\"psychology:client\",\"type\":1,\"icon\":\"role\",\"orderNum\":1}]', 122, '127.0.0.1', '2021-06-27 20:45:46');
INSERT INTO `sys_log` VALUES (76, 'admin', '修改菜单', 'com.shangcheng.psychology.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":41,\"parentId\":31,\"name\":\"我的预约\",\"url\":\"/psychology/mydoctor\",\"perms\":\"psychology:client\",\"type\":1,\"icon\":\"log\",\"orderNum\":0}]', 128, '127.0.0.1', '2021-06-27 20:46:06');
INSERT INTO `sys_log` VALUES (77, 'admin', '修改菜单', 'com.shangcheng.psychology.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":38,\"parentId\":36,\"name\":\"查看预约\",\"url\":\"/psychology/doctor_archive\",\"perms\":\"psychology:doctor\",\"type\":1,\"icon\":\"sousuo\",\"orderNum\":0}]', 128, '127.0.0.1', '2021-06-27 20:46:24');
INSERT INTO `sys_log` VALUES (78, 'admin', '修改菜单', 'com.shangcheng.psychology.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":40,\"parentId\":36,\"name\":\"编辑信息\",\"url\":\"/psychology/doctor-addit-info\",\"perms\":\"psychology:doctor\",\"type\":1,\"icon\":\"bianji\",\"orderNum\":0}]', 127, '127.0.0.1', '2021-06-27 20:46:34');
INSERT INTO `sys_log` VALUES (79, 'admin', '修改菜单', 'com.shangcheng.psychology.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":34,\"parentId\":32,\"name\":\"问题列表\",\"url\":\"/psychology/question\",\"perms\":\"psychology:client\",\"type\":1,\"icon\":\"editor\",\"orderNum\":1}]', 119, '127.0.0.1', '2021-06-27 20:47:13');
INSERT INTO `sys_log` VALUES (80, 'admin', '修改菜单', 'com.shangcheng.psychology.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":2,\"parentId\":1,\"name\":\"人员列表\",\"url\":\"sys/user\",\"type\":1,\"icon\":\"admin\",\"orderNum\":1}]', 120, '127.0.0.1', '2021-06-27 20:48:36');
INSERT INTO `sys_log` VALUES (81, 'admin', '修改角色', 'com.shangcheng.psychology.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"管理员\",\"remark\":\"管理员\",\"createUserId\":1,\"menuIdList\":[2,15,16,17,18,19,5,29,-666666,1,3]}]', 1743, '127.0.0.1', '2021-06-27 20:49:51');
INSERT INTO `sys_log` VALUES (82, 'admin', '修改角色', 'com.shangcheng.psychology.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":2,\"roleName\":\"心理老师\",\"remark\":\"心理老师\",\"createUserId\":1,\"menuIdList\":[36,38,40,-666666]}]', 607, '127.0.0.1', '2021-06-27 20:50:48');
INSERT INTO `sys_log` VALUES (83, 'admin', '修改角色', 'com.shangcheng.psychology.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":4,\"roleName\":\"咨询者\",\"remark\":\"咨询者\",\"createUserId\":1,\"menuIdList\":[31,35,41,32,34,-666666]}]', 770, '127.0.0.1', '2021-06-27 20:51:01');
INSERT INTO `sys_log` VALUES (84, 'admin', '保存用户', 'com.shangcheng.psychology.modules.sys.controller.SysUserController.save()', '[{\"userId\":21,\"username\":\"admin1\",\"password\":\"722c6eb1c1b258bcf46b99c3bc5c62aedb1e596a20bd7288964d01e95a8ecb8e\",\"salt\":\"jwyA2oHQflCNCt6x8sSa\",\"email\":\"2555@qq.com\",\"mobile\":\"15223333666\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Jun 27, 2021 9:39:49 PM\"}]', 1078, '127.0.0.1', '2021-06-27 21:39:50');
INSERT INTO `sys_log` VALUES (85, 'admin1', '保存用户', 'com.shangcheng.psychology.modules.sys.controller.SysUserController.save()', '[{\"userId\":22,\"username\":\"admin2\",\"password\":\"8320e777d0f814e2dd8f960873683819562e47a0da8198ffbd6d796eafd0a59c\",\"salt\":\"pe7Ul6ZjVH9tJFHEWDtv\",\"email\":\"1651651@qq.com\",\"mobile\":\"15226666888\",\"status\":1,\"roleIdList\":[1],\"createUserId\":21,\"createTime\":\"Jun 27, 2021 9:40:49 PM\"}]', 415, '127.0.0.1', '2021-06-27 21:40:50');
INSERT INTO `sys_log` VALUES (86, 'admin', '保存用户', 'com.shangcheng.psychology.modules.sys.controller.SysUserController.save()', '[{\"userId\":23,\"username\":\"client4\",\"password\":\"bdd0116c1e43eab32b517259cf176f3c129c16b3326bf228fb261b783fefa156\",\"salt\":\"Y6E3xUlWWRjF54yFVyg3\",\"email\":\"123124981794@qq.com\",\"mobile\":\"17754561236\",\"status\":1,\"roleIdList\":[4],\"createUserId\":1,\"createTime\":\"Jun 27, 2021 11:11:13 PM\"}]', 984, '127.0.0.1', '2021-06-27 23:11:14');
INSERT INTO `sys_log` VALUES (87, 'admin', '保存用户', 'com.shangcheng.psychology.modules.sys.controller.SysUserController.save()', '[{\"userId\":24,\"username\":\"client5\",\"password\":\"17aba2130054d3c499f3ca10387a13667df0c2207f04a1084703e203fcc50f7d\",\"salt\":\"B0rmjpWzACkouLOd7mlE\",\"email\":\"12345@gmail.com\",\"mobile\":\"19956512132\",\"status\":1,\"roleIdList\":[4],\"createUserId\":1,\"createTime\":\"Jun 28, 2021 12:04:39 PM\"}]', 886, '127.0.0.1', '2021-06-28 12:04:40');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) NULL DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 0, '系统管理', NULL, NULL, 0, 'system', 10);
INSERT INTO `sys_menu` VALUES (2, 1, '人员列表', 'sys/user', NULL, 1, 'admin', 1);
INSERT INTO `sys_menu` VALUES (3, 1, '角色管理', 'sys/role', NULL, 1, 'role', 2);
INSERT INTO `sys_menu` VALUES (4, 1, '菜单管理', 'sys/menu', NULL, 1, 'menu', 3);
INSERT INTO `sys_menu` VALUES (5, 1, 'SQL监控', 'http://localhost:8923/renren-fast/druid/sql.html', NULL, 1, 'sql', 4);
INSERT INTO `sys_menu` VALUES (6, 1, '定时任务', 'job/schedule', NULL, 1, 'job', 5);
INSERT INTO `sys_menu` VALUES (7, 6, '查看', NULL, 'sys:schedule:list,sys:schedule:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (8, 6, '新增', NULL, 'sys:schedule:save', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (9, 6, '修改', NULL, 'sys:schedule:update', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (10, 6, '删除', NULL, 'sys:schedule:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (11, 6, '暂停', NULL, 'sys:schedule:pause', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (12, 6, '恢复', NULL, 'sys:schedule:resume', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (13, 6, '立即执行', NULL, 'sys:schedule:run', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (14, 6, '日志列表', NULL, 'sys:schedule:log', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (15, 2, '查看', NULL, 'sys:user:list,sys:user:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (16, 2, '新增', NULL, 'sys:user:save,sys:role:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (17, 2, '修改', NULL, 'sys:user:update,sys:role:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (18, 2, '删除', NULL, 'sys:user:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (19, 3, '查看', NULL, 'sys:role:list,sys:role:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (20, 3, '新增', NULL, 'sys:role:save,sys:menu:list', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (21, 3, '修改', NULL, 'sys:role:update,sys:menu:list', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (22, 3, '删除', NULL, 'sys:role:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (23, 4, '查看', NULL, 'sys:menu:list,sys:menu:info', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (24, 4, '新增', NULL, 'sys:menu:save,sys:menu:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (25, 4, '修改', NULL, 'sys:menu:update,sys:menu:select', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (26, 4, '删除', NULL, 'sys:menu:delete', 2, NULL, 0);
INSERT INTO `sys_menu` VALUES (27, 1, '参数管理', 'sys/config', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', 1, 'config', 6);
INSERT INTO `sys_menu` VALUES (29, 1, '系统日志', 'sys/log', 'sys:log:list', 1, 'log', 7);
INSERT INTO `sys_menu` VALUES (30, 1, '文件上传', 'oss/oss', 'sys:oss:all', 1, 'oss', 6);
INSERT INTO `sys_menu` VALUES (31, 0, '预约医生', NULL, NULL, 0, 'geren', 1);
INSERT INTO `sys_menu` VALUES (32, 0, '心理测试', '', '', 0, 'daohang', 2);
INSERT INTO `sys_menu` VALUES (34, 32, '问题列表', '/psychology/question', 'psychology:client', 1, 'editor', 1);
INSERT INTO `sys_menu` VALUES (35, 31, '开始预约', '/psychology/doctor', 'psychology:client', 1, 'role', 1);
INSERT INTO `sys_menu` VALUES (36, 0, '医生入口', '', '', 0, 'admin', 9);
INSERT INTO `sys_menu` VALUES (38, 36, '查看预约', '/psychology/doctor_archive', 'psychology:doctor', 1, 'sousuo', 0);
INSERT INTO `sys_menu` VALUES (40, 36, '编辑信息', '/psychology/doctor-addit-info', 'psychology:doctor', 1, 'bianji', 0);
INSERT INTO `sys_menu` VALUES (41, 31, '我的预约', '/psychology/mydoctor', 'psychology:client', 1, 'log', 0);

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文件上传' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oss
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) NULL DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '管理员', '管理员', 1, '2021-06-15 20:03:01');
INSERT INTO `sys_role` VALUES (2, '心理老师', '心理老师', 1, '2021-06-15 20:03:58');
INSERT INTO `sys_role` VALUES (4, '咨询者', '咨询者', 1, '2021-06-15 20:04:25');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NULL DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 187 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色与菜单对应关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (166, 1, 2);
INSERT INTO `sys_role_menu` VALUES (167, 1, 15);
INSERT INTO `sys_role_menu` VALUES (168, 1, 16);
INSERT INTO `sys_role_menu` VALUES (169, 1, 17);
INSERT INTO `sys_role_menu` VALUES (170, 1, 18);
INSERT INTO `sys_role_menu` VALUES (171, 1, 19);
INSERT INTO `sys_role_menu` VALUES (172, 1, 5);
INSERT INTO `sys_role_menu` VALUES (173, 1, 29);
INSERT INTO `sys_role_menu` VALUES (174, 1, -666666);
INSERT INTO `sys_role_menu` VALUES (175, 1, 1);
INSERT INTO `sys_role_menu` VALUES (176, 1, 3);
INSERT INTO `sys_role_menu` VALUES (177, 2, 36);
INSERT INTO `sys_role_menu` VALUES (178, 2, 38);
INSERT INTO `sys_role_menu` VALUES (179, 2, 40);
INSERT INTO `sys_role_menu` VALUES (180, 2, -666666);
INSERT INTO `sys_role_menu` VALUES (181, 4, 31);
INSERT INTO `sys_role_menu` VALUES (182, 4, 35);
INSERT INTO `sys_role_menu` VALUES (183, 4, 41);
INSERT INTO `sys_role_menu` VALUES (184, 4, 32);
INSERT INTO `sys_role_menu` VALUES (185, 4, 34);
INSERT INTO `sys_role_menu` VALUES (186, 4, -666666);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '盐',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_user_id` bigint(20) NULL DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d', 'YzcmCZNvbXocrsz9dm8e', 'root@renren.io', '13612345678', 1, 1, '2016-11-11 11:11:11');
INSERT INTO `sys_user` VALUES (13, 'client1', 'e89dc0477e568b0da0ef3a65b59f14f5e87e1491bd91f440601e4ad11ed54f8a', '0LkWweDHtkpPJSUXA97y', '29@qq.com', '15223333666', 1, 1, '2021-06-21 16:20:24');
INSERT INTO `sys_user` VALUES (14, 'doctor1', 'afe05c24508595b9dece9b561423020f97eaa4e22cf7946f40e5450c76b2ee22', 'LWw8JopeR44uoFcfhVSV', '123@qq.com', '12331111444', 1, 14, '2021-06-21 16:21:01');
INSERT INTO `sys_user` VALUES (15, 'doctor2', '65eca9c1c28d8f77ef7fea61cda9ae20be2b5160777c1aeb7f3eb41ae4ff3d29', 'fWv2qjeU8mIkyTFj1YcZ', 'doctor2@163.com', '13384862614', 1, 1, '2021-06-21 22:46:35');
INSERT INTO `sys_user` VALUES (16, 'client2', '1ba2e37af4ecb53b4e0f7326abddd494e79b366782838129d780c190c412e510', '2TD5AkdhJOTHXbrQ3Wj7', '121545@qq.com', '18880236547', 1, 1, '2021-06-25 19:05:31');
INSERT INTO `sys_user` VALUES (17, 'client3', 'febcb65a7d11d8821b2137ecceb07f950b0fadb7f8e8d1dc5c6e3f690353d13e', 'iVXJUAE9IscKinkqkTTT', '151654@qq.com', '12154798794', 1, 1, '2021-06-25 20:10:38');
INSERT INTO `sys_user` VALUES (21, 'admin1', '722c6eb1c1b258bcf46b99c3bc5c62aedb1e596a20bd7288964d01e95a8ecb8e', 'jwyA2oHQflCNCt6x8sSa', '2555@qq.com', '15223333666', 1, 1, '2021-06-27 21:39:49');
INSERT INTO `sys_user` VALUES (22, 'admin2', '8320e777d0f814e2dd8f960873683819562e47a0da8198ffbd6d796eafd0a59c', 'pe7Ul6ZjVH9tJFHEWDtv', '1651651@qq.com', '15226666888', 1, 21, '2021-06-27 21:40:49');
INSERT INTO `sys_user` VALUES (23, 'client4', 'bdd0116c1e43eab32b517259cf176f3c129c16b3326bf228fb261b783fefa156', 'Y6E3xUlWWRjF54yFVyg3', '123124981794@qq.com', '17754561236', 1, 1, '2021-06-27 23:11:14');
INSERT INTO `sys_user` VALUES (24, 'client5', '17aba2130054d3c499f3ca10387a13667df0c2207f04a1084703e203fcc50f7d', 'B0rmjpWzACkouLOd7mlE', '12345@gmail.com', '19956512132', 1, 1, '2021-06-28 12:04:39');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户与角色对应关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (2, 3, 1);
INSERT INTO `sys_user_role` VALUES (3, 3, 2);
INSERT INTO `sys_user_role` VALUES (4, 3, 4);
INSERT INTO `sys_user_role` VALUES (5, 2, 1);
INSERT INTO `sys_user_role` VALUES (6, 2, 2);
INSERT INTO `sys_user_role` VALUES (7, 2, 4);
INSERT INTO `sys_user_role` VALUES (11, 4, 2);
INSERT INTO `sys_user_role` VALUES (12, 5, 2);
INSERT INTO `sys_user_role` VALUES (13, 6, 2);
INSERT INTO `sys_user_role` VALUES (14, 7, 2);
INSERT INTO `sys_user_role` VALUES (15, 8, 2);
INSERT INTO `sys_user_role` VALUES (16, 9, 2);
INSERT INTO `sys_user_role` VALUES (17, 12, 4);
INSERT INTO `sys_user_role` VALUES (18, 13, 4);
INSERT INTO `sys_user_role` VALUES (20, 1, 1);
INSERT INTO `sys_user_role` VALUES (21, 15, 2);
INSERT INTO `sys_user_role` VALUES (24, 14, 2);
INSERT INTO `sys_user_role` VALUES (25, 16, 4);
INSERT INTO `sys_user_role` VALUES (26, 17, 4);
INSERT INTO `sys_user_role` VALUES (27, 18, 2);
INSERT INTO `sys_user_role` VALUES (28, 20, 2);
INSERT INTO `sys_user_role` VALUES (29, 21, 1);
INSERT INTO `sys_user_role` VALUES (30, 22, 1);
INSERT INTO `sys_user_role` VALUES (31, 23, 4);
INSERT INTO `sys_user_role` VALUES (32, 24, 4);

-- ----------------------------
-- Table structure for sys_user_token
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_token`;
CREATE TABLE `sys_user_token`  (
  `user_id` bigint(20) NOT NULL,
  `token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'token',
  `expire_time` datetime(0) NULL DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `token`(`token`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统用户Token' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_token
-- ----------------------------
INSERT INTO `sys_user_token` VALUES (1, '39a36c5097a890b56cff9a171b219247', '2021-06-29 00:01:51', '2021-06-28 12:01:51');
INSERT INTO `sys_user_token` VALUES (2, '3a1b40fcda5259e03f8d8db80d8654ff', '2021-06-18 04:36:28', '2021-06-17 16:36:28');
INSERT INTO `sys_user_token` VALUES (3, '230fa1d9d30ecfd4d899b3195b979714', '2021-06-18 04:29:16', '2021-06-17 16:29:16');
INSERT INTO `sys_user_token` VALUES (13, 'cd202cf1c42839155e316226de0f3dad', '2021-06-29 02:38:27', '2021-06-28 14:38:27');
INSERT INTO `sys_user_token` VALUES (14, '4af8a3aee63559b18e883bab335d6629', '2021-06-29 02:42:47', '2021-06-28 14:42:47');
INSERT INTO `sys_user_token` VALUES (15, '52c1977efdf90a8143baa97e7e2d6fc8', '2021-06-28 12:03:46', '2021-06-28 00:03:46');
INSERT INTO `sys_user_token` VALUES (16, '87812cbe9c23c74c0af5203ec45ccbfd', '2021-06-28 12:06:46', '2021-06-28 00:06:46');
INSERT INTO `sys_user_token` VALUES (17, 'b9468386f74c667754a33424b5fddb79', '2021-06-28 11:29:30', '2021-06-27 23:29:30');
INSERT INTO `sys_user_token` VALUES (21, '862040bc42b56bdf59da281f06af6115', '2021-06-29 02:39:49', '2021-06-28 14:39:49');
INSERT INTO `sys_user_token` VALUES (23, 'a467897f6db0c5454e10d61ff4aca4ac', '2021-06-28 11:21:43', '2021-06-27 23:21:43');
INSERT INTO `sys_user_token` VALUES (24, '01d8f59abad712fd6108dd19c1495638', '2021-06-29 01:48:35', '2021-06-28 13:48:35');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '手机号',
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (1, 'mark', '13612345678', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '2017-03-23 22:37:41');

SET FOREIGN_KEY_CHECKS = 1;
