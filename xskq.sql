/*
Navicat MySQL Data Transfer

Source Server         : data
Source Server Version : 50703
Source Host           : localhost:3306
Source Database       : xskq

Target Server Type    : MYSQL
Target Server Version : 50703
File Encoding         : 65001

Date: 2018-05-15 22:30:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tb_call_theroll`
-- ----------------------------
DROP TABLE IF EXISTS `tb_call_theroll`;
CREATE TABLE `tb_call_theroll` (
  `call_theroll_id` varchar(32) NOT NULL COMMENT '记录标识',
  `course_id` varchar(32) DEFAULT NULL COMMENT '课程ID',
  `course_name` varchar(32) DEFAULT NULL COMMENT '课程名称',
  `user_id` varchar(32) DEFAULT NULL COMMENT '用户ID',
  `stu_name` varchar(20) DEFAULT NULL COMMENT '学生姓名',
  `call_state` int(1) DEFAULT NULL COMMENT '签到状态',
  `call_date` datetime DEFAULT NULL COMMENT '签到日期',
  `call_position` varchar(10) DEFAULT NULL COMMENT '签到位置',
  PRIMARY KEY (`call_theroll_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='点名表';

-- ----------------------------
-- Records of tb_call_theroll
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_course`
-- ----------------------------
DROP TABLE IF EXISTS `tb_course`;
CREATE TABLE `tb_course` (
  `course_id` varchar(32) NOT NULL COMMENT '记录标识',
  `course_no` varchar(10) DEFAULT NULL,
  `course_name` varchar(255) DEFAULT NULL COMMENT '课程名称',
  `description` varchar(255) DEFAULT NULL COMMENT '课程描述',
  `term` varchar(10) DEFAULT NULL COMMENT '学期',
  `class_location` varchar(100) DEFAULT NULL COMMENT '上课地点',
  `class_date` varchar(10) DEFAULT NULL COMMENT '学周',
  `class_order` varchar(10) DEFAULT NULL COMMENT '学分',
  `daily_weight` double DEFAULT NULL COMMENT '日常比重',
  `final_weight` double DEFAULT NULL,
  `picket_line` int(11) DEFAULT NULL COMMENT '警戒线',
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='课程表';

-- ----------------------------
-- Records of tb_course
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_course_time`
-- ----------------------------
DROP TABLE IF EXISTS `tb_course_time`;
CREATE TABLE `tb_course_time` (
  `course_time_id` varchar(32) NOT NULL COMMENT '课程时间标识',
  `no` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '编号',
  `week` int(1) DEFAULT NULL COMMENT '星期（1-6）',
  `start_time` datetime DEFAULT NULL COMMENT '上课时间',
  `end_time` datetime DEFAULT NULL COMMENT '下课时间',
  PRIMARY KEY (`course_time_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='课程时间表';

-- ----------------------------
-- Records of tb_course_time
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_course_time_rel`
-- ----------------------------
DROP TABLE IF EXISTS `tb_course_time_rel`;
CREATE TABLE `tb_course_time_rel` (
  `couser_time_rel_id` varchar(32) DEFAULT NULL COMMENT '课程时间关联标识',
  `course_id` varchar(32) DEFAULT NULL COMMENT '课程标识',
  `course_time_id` varchar(32) DEFAULT NULL COMMENT '课程时间标识'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='课程时间关联表';

-- ----------------------------
-- Records of tb_course_time_rel
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_dict`
-- ----------------------------
DROP TABLE IF EXISTS `tb_dict`;
CREATE TABLE `tb_dict` (
  `dict_id` varchar(32) NOT NULL,
  `dict_no` int(11) DEFAULT NULL COMMENT '字典编号',
  `dict_name` varchar(60) NOT NULL COMMENT '字典名称',
  `dict_value` varchar(10) DEFAULT NULL COMMENT '字典',
  `dict_category` varchar(30) DEFAULT NULL COMMENT '字典类别',
  `parent_id` varchar(255) DEFAULT NULL COMMENT '父类id',
  `description` varchar(255) DEFAULT NULL COMMENT '字典描述',
  PRIMARY KEY (`dict_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典表';

-- ----------------------------
-- Records of tb_dict
-- ----------------------------
INSERT INTO `tb_dict` VALUES ('100', '100', '性别', '0', null, null, null);
INSERT INTO `tb_dict` VALUES ('101', '101', '男', '1', '性别', '100', null);
INSERT INTO `tb_dict` VALUES ('102', '102', '女', '2', '性别', '100', null);
INSERT INTO `tb_dict` VALUES ('200', '200', '是否有效', null, null, null, null);
INSERT INTO `tb_dict` VALUES ('201', '201', '是', '0', '是否有效', '200', null);
INSERT INTO `tb_dict` VALUES ('202', '202', '否', '1', '是否有效', '200', null);
INSERT INTO `tb_dict` VALUES ('300', '300', '班级', null, null, null, null);
INSERT INTO `tb_dict` VALUES ('301', '301', '1班', '1', '班级', '300', null);
INSERT INTO `tb_dict` VALUES ('302', '302', '2班', '2', '班级', '300', null);
INSERT INTO `tb_dict` VALUES ('303', '303', '3班', '3', '班级', '300', null);
INSERT INTO `tb_dict` VALUES ('304', '304', '4班', '4', '班级', '300', null);
INSERT INTO `tb_dict` VALUES ('305', '305', '5班', '5', '班级', '300', null);

-- ----------------------------
-- Table structure for `tb_mark`
-- ----------------------------
DROP TABLE IF EXISTS `tb_mark`;
CREATE TABLE `tb_mark` (
  `mark_id` varchar(32) NOT NULL COMMENT '记录标识',
  `course_id` varchar(32) DEFAULT NULL COMMENT '课程ID',
  `course_name` varchar(30) NOT NULL COMMENT '课程名称',
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `stu_name` varchar(30) DEFAULT NULL COMMENT '学生姓名',
  `daily_score` float DEFAULT NULL COMMENT '平时分',
  `final_score` float DEFAULT NULL COMMENT '期末分',
  `exam_score` float DEFAULT NULL,
  PRIMARY KEY (`mark_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='成绩表';

-- ----------------------------
-- Records of tb_mark
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_menu`
-- ----------------------------
DROP TABLE IF EXISTS `tb_menu`;
CREATE TABLE `tb_menu` (
  `menu_id` varchar(32) NOT NULL COMMENT '记录标识',
  `parent_id` varchar(32) DEFAULT NULL COMMENT '父类菜单id',
  `menu_name` varchar(100) DEFAULT NULL COMMENT '菜单名称',
  `menu_no` int(255) DEFAULT NULL COMMENT '菜单编号',
  `level` int(11) DEFAULT NULL COMMENT '菜单级别',
  `menu_url` varchar(255) DEFAULT NULL COMMENT '菜单地址',
  `is_leaf` int(1) DEFAULT NULL COMMENT '是否叶节点（0：是；1：否）',
  `menu_icon_path` varchar(255) DEFAULT NULL COMMENT '菜单图标路径',
  `is_visable` int(1) DEFAULT NULL COMMENT '是否有效（0：是；1否）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of tb_menu
-- ----------------------------
INSERT INTO `tb_menu` VALUES ('1', null, '用户管理', '1', '1', 'user_mng.html', '0', null, '0', '2018-04-26 16:53:12', 'fa fa-dashboard');
INSERT INTO `tb_menu` VALUES ('2', null, '角色权限', '2', '1', 'role_auth.html', '0', null, '0', '2018-04-26 16:54:26', 'fa fa-book');
INSERT INTO `tb_menu` VALUES ('20', null, '系统管理', '20', '1', 'sys_mng.html', '1', null, '0', '2018-04-26 17:01:25', 'fa fa-cogs');
INSERT INTO `tb_menu` VALUES ('201', '20', '字典设置', '201', '2', 'dict_setting.html', '0', null, '0', '2018-04-26 17:03:55', null);
INSERT INTO `tb_menu` VALUES ('202', '20', '密码修改', '202', '2', 'password_modify.html', '0', null, '0', '2018-04-26 17:05:23', null);
INSERT INTO `tb_menu` VALUES ('3', null, '班级管理', '3', '1', 'class_mng.html', '0', null, '0', '2018-04-26 16:58:40', 'fa fa-tasks');
INSERT INTO `tb_menu` VALUES ('4', null, '查看汇总', '4', '1', 'view_sum.html', '0', null, '0', '2018-04-26 16:58:37', 'fa fa-th');
INSERT INTO `tb_menu` VALUES ('5', null, '校园管理', '5', '1', 'school_mng.html', null, null, '0', '2018-05-14 18:40:00', 'fa fa-tasks');
INSERT INTO `tb_menu` VALUES ('6', null, '课程管理', '6', '1', 'course_mng.html', '0', null, '0', '2018-05-06 23:08:11', 'fa fa-book');
INSERT INTO `tb_menu` VALUES ('7', null, '成绩管理', '7', '1', 'mark_mng.html', '0', null, '0', '2018-05-06 22:48:14', 'fa fa-book');

-- ----------------------------
-- Table structure for `tb_permi`
-- ----------------------------
DROP TABLE IF EXISTS `tb_permi`;
CREATE TABLE `tb_permi` (
  `permi_id` varchar(32) NOT NULL COMMENT '记录标识',
  `permi_no` varchar(10) NOT NULL COMMENT '权限编号',
  `permi_name` varchar(50) DEFAULT NULL COMMENT '权限名称',
  `description` varchar(255) DEFAULT NULL COMMENT '权限描述',
  `req_url` varchar(255) DEFAULT NULL COMMENT '请求地址',
  `is_page` int(1) DEFAULT NULL COMMENT '是否页面（0：是；1：否）',
  `is_menu` int(1) DEFAULT NULL COMMENT '是否菜单（是：0；否：1）',
  `is_action` int(1) DEFAULT NULL COMMENT '是否动作',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `user_id` varchar(32) DEFAULT NULL COMMENT '创建者用户id',
  `is_access` int(1) DEFAULT '0' COMMENT '是否可访问（0：可访问；1：拒绝访问）',
  PRIMARY KEY (`permi_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限表';

-- ----------------------------
-- Records of tb_permi
-- ----------------------------
INSERT INTO `tb_permi` VALUES ('11', '1', '用户管理', null, 'user_mng.html', '0', '0', '1', '2018-04-24 19:11:27', null, '0');
INSERT INTO `tb_permi` VALUES ('12', '2', '角色权限', null, 'role_auth.html', '0', '0', '1', '2018-04-26 20:11:04', null, '0');
INSERT INTO `tb_permi` VALUES ('120', '20', '系统管理', null, 'sys_mng.html', '1', '0', '1', '2018-04-26 20:16:27', null, '0');
INSERT INTO `tb_permi` VALUES ('1201', '201', '字典设置', null, 'dict_setting.html', '0', '0', '1', '2018-04-26 20:18:44', null, '0');
INSERT INTO `tb_permi` VALUES ('1202', '202', '密码修改', null, 'password_modify.html', '0', '0', '1', '2018-04-26 20:18:41', null, '0');
INSERT INTO `tb_permi` VALUES ('13', '3', '班级管理', null, 'class_mng.html', '0', '0', '1', '2018-04-26 20:13:04', null, '0');
INSERT INTO `tb_permi` VALUES ('14', '4', '查看汇总', null, 'view_sum.html', '0', '0', '1', '2018-04-26 20:14:07', null, '0');
INSERT INTO `tb_permi` VALUES ('15', '5', '校园管理', null, 'school_mng.html', '0', '0', '1', '2018-04-26 20:15:21', null, '0');
INSERT INTO `tb_permi` VALUES ('17', '7', '成绩管理', null, 'mark_mng.html', '0', '0', '1', '2018-05-06 22:47:12', null, '0');

-- ----------------------------
-- Table structure for `tb_question`
-- ----------------------------
DROP TABLE IF EXISTS `tb_question`;
CREATE TABLE `tb_question` (
  `question_id` varchar(32) NOT NULL COMMENT '记录标识',
  `course_id` varchar(32) DEFAULT NULL COMMENT '课程ID',
  `course_name` varchar(32) DEFAULT NULL COMMENT '课程名称',
  `user_id` varchar(32) DEFAULT NULL COMMENT '用户ID',
  `question_date` datetime DEFAULT NULL COMMENT '提问日期',
  `score` double DEFAULT NULL COMMENT '分数',
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='提问表';

-- ----------------------------
-- Records of tb_question
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_role`
-- ----------------------------
DROP TABLE IF EXISTS `tb_role`;
CREATE TABLE `tb_role` (
  `role_id` varchar(32) NOT NULL COMMENT '记录标识',
  `parent_id` varchar(32) DEFAULT NULL COMMENT '父级角色id',
  `role_name` varchar(32) NOT NULL COMMENT '角色名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `description` varchar(255) DEFAULT NULL COMMENT '角色描述',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of tb_role
-- ----------------------------
INSERT INTO `tb_role` VALUES ('0', null, '超级管理员', '2018-04-21 19:48:30', null);
INSERT INTO `tb_role` VALUES ('1', null, '教师', '2018-05-06 22:42:59', null);
INSERT INTO `tb_role` VALUES ('2', null, '学生', '2018-05-14 19:58:59', null);

-- ----------------------------
-- Table structure for `tb_role_permi_rel`
-- ----------------------------
DROP TABLE IF EXISTS `tb_role_permi_rel`;
CREATE TABLE `tb_role_permi_rel` (
  `role_permi_rel_id` varchar(32) NOT NULL,
  `role_id` varchar(32) DEFAULT NULL COMMENT '角色id',
  `permi_id` varchar(32) DEFAULT NULL COMMENT '权限id',
  PRIMARY KEY (`role_permi_rel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色权限表';

-- ----------------------------
-- Records of tb_role_permi_rel
-- ----------------------------
INSERT INTO `tb_role_permi_rel` VALUES ('01', '0', '11');
INSERT INTO `tb_role_permi_rel` VALUES ('02', '0', '12');
INSERT INTO `tb_role_permi_rel` VALUES ('020', '0', '120');
INSERT INTO `tb_role_permi_rel` VALUES ('0201', '0', '1201');
INSERT INTO `tb_role_permi_rel` VALUES ('0202', '0', '1202');
INSERT INTO `tb_role_permi_rel` VALUES ('05', '0', '15');
INSERT INTO `tb_role_permi_rel` VALUES ('13', '1', '13');
INSERT INTO `tb_role_permi_rel` VALUES ('16', '1', '16');
INSERT INTO `tb_role_permi_rel` VALUES ('162', '1', '62');
INSERT INTO `tb_role_permi_rel` VALUES ('17', '1', '17');

-- ----------------------------
-- Table structure for `tb_school_info`
-- ----------------------------
DROP TABLE IF EXISTS `tb_school_info`;
CREATE TABLE `tb_school_info` (
  `school_info_id` varchar(32) NOT NULL,
  `school_no` int(11) NOT NULL COMMENT '学校编号',
  `school` varchar(100) NOT NULL COMMENT '学校',
  `college` varchar(100) NOT NULL COMMENT '学院',
  `department` varchar(100) DEFAULT NULL COMMENT '系别',
  PRIMARY KEY (`school_info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='校园信息表';

-- ----------------------------
-- Records of tb_school_info
-- ----------------------------
INSERT INTO `tb_school_info` VALUES ('1', '1', '福州大学', '数计学院', null);

-- ----------------------------
-- Table structure for `tb_teach_stu`
-- ----------------------------
DROP TABLE IF EXISTS `tb_teach_stu`;
CREATE TABLE `tb_teach_stu` (
  `teach_stu_id` varchar(32) NOT NULL COMMENT '记录标识',
  `no` varchar(20) DEFAULT NULL COMMENT '学号',
  `name` varchar(200) DEFAULT NULL COMMENT '姓名',
  `gender` int(1) DEFAULT NULL COMMENT '性别',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `grade` varchar(10) DEFAULT NULL COMMENT '年级',
  `major` varchar(255) DEFAULT NULL COMMENT '专业',
  `class_no` int(2) DEFAULT NULL COMMENT '班级',
  `is_teacher` int(1) DEFAULT NULL COMMENT '是否教师（0：是；1：否）',
  `user_id` varchar(32) DEFAULT NULL COMMENT '用户ID',
  `school_info_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`teach_stu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='师生表';

-- ----------------------------
-- Records of tb_teach_stu
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_user`
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `user_id` varchar(32) NOT NULL COMMENT '记录标识',
  `user_no` bigint(20) NOT NULL COMMENT '用户编号',
  `user_name` varchar(50) NOT NULL COMMENT '用户名',
  `pwd` varchar(50) NOT NULL COMMENT '密码',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号码',
  `email` varchar(64) DEFAULT NULL COMMENT '电子邮箱',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `last_login_time` datetime DEFAULT NULL COMMENT '上次登陆时间',
  `count` bigint(20) DEFAULT NULL COMMENT '登陆次数',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', '1', '用户1', 'E10ADC3949BA59ABBE56E057F20F883E', null, null, null, null, null, null);
INSERT INTO `tb_user` VALUES ('2', '2', '用户2', 'E10ADC3949BA59ABBE56E057F20F883E', null, null, null, null, null, null);
INSERT INTO `tb_user` VALUES ('3', '3', '用户3', 'E10ADC3949BA59ABBE56E057F20F883E', null, null, null, null, null, null);
INSERT INTO `tb_user` VALUES ('4', '4', '用户4', 'E10ADC3949BA59ABBE56E057F20F883E', null, null, null, null, null, null);
INSERT INTO `tb_user` VALUES ('4028b88162e8814e0162e883191d0005', '5', '李四', 'E10ADC3949BA59ABBE56E057F20F883E', '18060906666', null, '2018-05-06 22:41:09', null, null, null);
INSERT INTO `tb_user` VALUES ('4028b8816349623801634a433b510005', '0', '张三', 'E10ADC3949BA59ABBE56E057F20F883E', '18060905555', null, '2018-05-06 22:41:05', null, null, null);
INSERT INTO `tb_user` VALUES ('6', '6', '用户6', 'E10ADC3949BA59ABBE56E057F20F883E', null, null, null, null, null, null);
INSERT INTO `tb_user` VALUES ('7', '7', '用户7', 'E10ADC3949BA59ABBE56E057F20F883E', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `tb_user_course_rel`
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_course_rel`;
CREATE TABLE `tb_user_course_rel` (
  `user_course_rel_id` varchar(32) NOT NULL COMMENT '用户课程关联标识',
  `user_id` varchar(32) DEFAULT NULL COMMENT '用户标识',
  `course_id` varchar(32) DEFAULT NULL COMMENT '课程标识',
  PRIMARY KEY (`user_course_rel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户课程关联表';

-- ----------------------------
-- Records of tb_user_course_rel
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_user_role_rel`
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_role_rel`;
CREATE TABLE `tb_user_role_rel` (
  `user_role_rel_id` varchar(32) NOT NULL COMMENT '记录标识',
  `user_id` varchar(32) DEFAULT NULL COMMENT '用户',
  `role_id` varchar(32) DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`user_role_rel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色表';

-- ----------------------------
-- Records of tb_user_role_rel
-- ----------------------------
INSERT INTO `tb_user_role_rel` VALUES ('4028b88162e8814e0162e883191d0003', '4028b8816349623801634a433b510005', '0');
