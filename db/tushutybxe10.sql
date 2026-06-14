/*
 Navicat Premium Data Transfer

 Source Server         : localhost_33061
 Source Server Type    : MySQL
 Source Server Version : 50732
 Source Host           : localhost:33061
 Source Schema         : tushutybxe10

 Target Server Type    : MySQL
 Target Server Version : 50732
 File Encoding         : 65001

 Date: 13/06/2026 14:30:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '地址',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '收货人',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '电话',
  `isdefault` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '是否默认地址[是/否]',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '地址' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES (1, '2026-05-12 09:20:00', 1, '北京市朝阳区建国路88号SOHO现代城A座1205室', '张伟', '13812345678', '是');
INSERT INTO `address` VALUES (2, '2026-05-12 09:21:00', 1, '北京市海淀区中关村大街15号中关村广场B座808室', '张伟', '13812345678', '否');
INSERT INTO `address` VALUES (3, '2026-05-12 09:25:00', 2, '上海市浦东新区陆家嘴环路1088号国金中心3201室', '李娜', '13987654321', '是');
INSERT INTO `address` VALUES (4, '2026-05-12 09:26:00', 2, '上海市徐汇区漕溪北路595号上海影城旁公寓1502室', '李娜', '13987654321', '否');
INSERT INTO `address` VALUES (5, '2026-05-12 09:30:00', 3, '广州市天河区体育西路189号城建大厦2203室', '王芳', '13655551234', '是');
INSERT INTO `address` VALUES (6, '2026-05-12 09:35:00', 4, '深圳市南山区科技园南路88号深圳湾科技生态园10栋1801室', '刘军', '13722228888', '是');
INSERT INTO `address` VALUES (7, '2026-05-12 09:36:00', 4, '深圳市福田区深南大道6009号NEO绿景广场3505室', '刘军', '13722228888', '否');
INSERT INTO `address` VALUES (8, '2026-05-12 09:40:00', 5, '杭州市西湖区文三路259号昌地火炬大厦1208室', '陈燕', '13566667777', '是');
INSERT INTO `address` VALUES (9, '2026-05-12 09:45:00', 6, '南京市鼓楼区中山路321号绿地中心4201室', '杨明', '13899990000', '是');
INSERT INTO `address` VALUES (10, '2026-05-12 09:46:00', 6, '南京市玄武区玄武大道69号江苏软件园5号楼1002室', '杨明', '13899990000', '否');
INSERT INTO `address` VALUES (11, '2026-05-12 09:50:00', 7, '成都市武侯区人民南路四段9号来福士广场T2-2803室', '赵丽', '13611112222', '是');
INSERT INTO `address` VALUES (12, '2026-05-12 09:55:00', 8, '武汉市洪山区光谷大道88号光谷软件园C8栋1501室', '孙磊', '13733334444', '是');
INSERT INTO `address` VALUES (13, '2026-05-12 10:00:00', 9, '重庆市渝北区金开大道1000号棕榈泉国际中心1806室', '周敏', '13555556666', '是');
INSERT INTO `address` VALUES (14, '2026-05-12 10:05:00', 10, '西安市雁塔区科技路48号创业广场B座2201室', '吴涛', '13877778888', '否');

-- ----------------------------
-- Table structure for bookannouncement
-- ----------------------------
DROP TABLE IF EXISTS `bookannouncement`;
CREATE TABLE `bookannouncement`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
  `picture` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '图片',
  `publisher` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '发布人',
  `introduction` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '简介',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '内容',
  `clicktime` datetime NULL DEFAULT NULL COMMENT '最近点击时间',
  `storeupnum` int(11) NULL DEFAULT 0 COMMENT '收藏数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '图书公告' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bookannouncement
-- ----------------------------
INSERT INTO `bookannouncement` VALUES (2, '2026-05-13 09:47:03', '开启阅读之旅', 'upload/1779274317152_317.jpg', '图书馆信息技术部', '', '<p><span class=\"ql-size-large\">亲爱的读者：</span></p><p><br></p><p><span class=\"ql-size-large\">为丰富网站图书资源，满足广大文学爱好者的阅读与选购需求，本站近期对文学类图书进行了全面补充更新。本次新增书籍涵盖多本中外经典名著，内容丰富、品类齐全，已全部完成上架。</span></p><p><br></p><p><span class=\"ql-size-large\">欢迎各位读者登录网站浏览选购，开启阅读之旅。</span></p><p><br></p><p><span class=\"ql-size-large\">特此公告。</span></p>', '2026-05-13 17:47:03', 2);
INSERT INTO `bookannouncement` VALUES (3, '2026-05-13 09:47:03', '系统维护公告', 'upload/1779274427174_671.jpg', '图书运维部', '系统维护公告', '<p><span class=\"ql-size-large\"><span class=\"ql-cursor\">﻿</span>平台将于4月10日凌晨进行系统升级</span></p><p><span class=\"ql-size-large\">通知内容：为保障平台稳定运行，优化用户体验，本平台将于2026年4月10日00:00-06:00进行系统维护升级。维护期间，平台部分功能将暂时无法使用，给您带来的不便，敬请谅解。升级完成后，我们将第一时间恢复服务，感谢您的支持。</span></p>', '2026-05-13 17:47:03', 3);
INSERT INTO `bookannouncement` VALUES (4, '2026-05-13 09:47:03', '平台服务规范&用户须知', 'upload/1779274534712_686.jpg', '平台管理部', '平台用户服务规范更新 | 共建良好阅读与购物环境\n', '<p><span class=\"ql-size-large\">为保障广大用户的合法权益，营造健康、有序、文明的平台环境，本平台对《用户服务规范》进行了修订，核心调整如下：</span></p><p><span class=\"ql-size-large\">明确图书版权保护要求，严禁盗版、侵权内容上传与传播</span></p><p><span class=\"ql-size-large\">规范用户评论区管理，禁止恶意刷屏、人身攻击、虚假评价等行为</span></p><p><span class=\"ql-size-large\">完善订单与售后流程，明确退换货、物流查询等服务标准</span></p><p><span class=\"ql-size-large\">新增用户隐私保护条款，全面保障用户个人信息安全</span></p><p><span class=\"ql-size-large\">新规范已于2026年4月1日正式生效，欢迎广大用户监督执行。如有任何疑问，可通过「客服中心」咨询。感谢您的理解与配合，让我们共同守护书香平台。</span></p>', '2026-05-13 17:47:03', 4);
INSERT INTO `bookannouncement` VALUES (5, '2026-05-13 09:47:03', '正品授权', 'upload/1779019477283_300.jpg', '平台管理部', '正品授权', '<p><span class=\"ql-size-large\">﻿尊敬的各位读者：</span></p><p><span class=\"ql-size-large\">本站所售图书均为官方正版授权，严格把控图书印刷、装订及内容质量，确保每一位读者都能获得优质阅读体验。感谢您的信任与支持。</span></p>', '2026-05-13 17:47:03', 5);
INSERT INTO `bookannouncement` VALUES (6, '2026-05-13 09:47:03', '订单发货及售后', 'upload/bookannouncement_picture6.jpg', '平台管理部', '保障读者合法权益', '<p><span class=\"ql-size-large\">本站日常订单将在24小时内完成审核与打包，常规地区正常配送。如遇节假日物流高峰，配送时效可能略有延迟，敬请谅解。</span></p><p><span class=\"ql-size-large\">若您收到图书存在破损、缺页、印刷瑕疵等问题，请及时联系在线客服，我们将第一时间为您处理售后事宜，全力保障您的合法权益。</span></p>', '2026-05-13 17:47:03', 6);
INSERT INTO `bookannouncement` VALUES (8, '2026-05-13 09:47:03', '新书上架预告公告', 'upload/1779019518645_358.jpg', '平台管理部', '', '<p><span class=\"ql-size-large\">本站将持续上架文学、社科、教辅、少儿等各类优质新书，每日定时更新书单，欢迎各位读者持续关注。</span></p>', '2026-05-13 17:47:03', 8);

-- ----------------------------
-- Table structure for bookclassification
-- ----------------------------
DROP TABLE IF EXISTS `bookclassification`;
CREATE TABLE `bookclassification`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `bookclassification` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '图书分类',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `bookclassification`(`bookclassification`) USING BTREE,
  INDEX `bookclassification_f8on`(`bookclassification`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '图书分类' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bookclassification
-- ----------------------------
INSERT INTO `bookclassification` VALUES (1, '2026-05-12 10:30:00', '文学小说');
INSERT INTO `bookclassification` VALUES (2, '2026-05-12 10:31:00', '计算机科学');
INSERT INTO `bookclassification` VALUES (3, '2026-05-12 10:32:00', '经济管理');
INSERT INTO `bookclassification` VALUES (4, '2026-05-12 10:33:00', '心理学');
INSERT INTO `bookclassification` VALUES (5, '2026-05-12 10:34:00', '历史传记');
INSERT INTO `bookclassification` VALUES (6, '2026-05-12 10:35:00', '自然科学');
INSERT INTO `bookclassification` VALUES (7, '2026-05-12 10:36:00', '教育考试');
INSERT INTO `bookclassification` VALUES (8, '2026-05-12 10:37:00', '艺术设计');
INSERT INTO `bookclassification` VALUES (9, '2026-05-12 10:38:00', '生活休闲');
INSERT INTO `bookclassification` VALUES (10, '2026-05-12 10:39:00', '儿童读物');

-- ----------------------------
-- Table structure for bookinformation
-- ----------------------------
DROP TABLE IF EXISTS `bookinformation`;
CREATE TABLE `bookinformation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `isbn` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'ISBN',
  `booktitle` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '书名',
  `bookcover` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '图书封面',
  `bookclassification` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图书分类',
  `author` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '作者',
  `authorsnationality` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '作者国籍',
  `language` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '语言',
  `publishinghouse` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '出版社',
  `sales` int(11) NULL DEFAULT NULL COMMENT '销量',
  `publicationdate` date NULL DEFAULT NULL COMMENT '出版日期',
  `bookintroduction` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '图书简介',
  `onelimittimes` int(11) NULL DEFAULT -1 COMMENT '单限',
  `alllimittimes` int(11) NULL DEFAULT -1 COMMENT '库存',
  `price` double NOT NULL DEFAULT 0 COMMENT '价格',
  `thumbsupnum` int(11) NULL DEFAULT 0 COMMENT '赞',
  `crazilynum` int(11) NULL DEFAULT 0 COMMENT '踩',
  `clicktime` datetime NULL DEFAULT NULL COMMENT '最近点击时间',
  `discussnum` int(11) NULL DEFAULT 0 COMMENT '评论数',
  `totalscore` double NULL DEFAULT 0 COMMENT '评分',
  `onshelves` int(11) NULL DEFAULT 1 COMMENT '是否上架(1:上架，0:下架)',
  `storeupnum` int(11) NULL DEFAULT 0 COMMENT '收藏数',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `isbn`(`isbn`) USING BTREE,
  INDEX `bookinformation_price`(`price`) USING BTREE,
  INDEX `bookclassification`(`bookclassification`) USING BTREE,
  CONSTRAINT `bookinformation_ibfk_1` FOREIGN KEY (`bookclassification`) REFERENCES `bookclassification` (`bookclassification`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '图书信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bookinformation
-- ----------------------------
INSERT INTO `bookinformation` VALUES (1, '2026-05-12 10:00:00', '9787020145607', '平凡的世界', 'upload/1778756677058_36.png', '文学小说', '路遥', '中国', '中文', '人民文学出版社', 15823, '2012-09-01', '<p>一部全景式地表现中国当代城乡社会生活的长篇小说,展现了普通人在大时代历史进程中所走过的艰难曲折的道路。</p>', 10, 500, 59.8, 892, 12, '2026-05-12 14:30:00', 156, 4.8, 1, 328);
INSERT INTO `bookinformation` VALUES (2, '2026-05-12 10:05:00', '9787111544937', '算法导论', 'upload/1778756499656_992.png', '计算机科学', 'Thomas H. Cormen', '美国', '中文', '机械工业出版社', 8562, '2015-03-01', '<p>全面介绍计算机算法的经典著作,涵盖排序、数据结构、图算法等内容,是计算机科学专业必备教材。</p>', 5, 300, 99, 1245, 23, '2026-05-12 15:20:00', 234, 4.9, 1, 567);
INSERT INTO `bookinformation` VALUES (3, '2026-05-12 10:10:00', '9787508648231', '从优秀到卓越', 'upload/1778756310324_436.png', '经济管理', '吉姆·柯林斯', '美国', '中文', '中信出版社', 12345, '2015-06-01', '<p>探讨了优秀企业如何实现跨越式发展,成为卓越企业的核心原则和实践方法。</p>', 8, 400, 45, 678, 15, '2026-05-12 16:10:00', 89, 4.6, 1, 234);
INSERT INTO `bookinformation` VALUES (4, '2026-05-12 10:15:00', '9787115428691', '思考,快与慢', 'upload/1778756281027_356.png', '心理学', '丹尼尔·卡尼曼', '美国', '中文', '人民邮电出版社', 18934, '2016-11-01', '<p>诺贝尔经济学奖得主卡尼曼的代表作,揭示了人类思维的两种模式及其对决策的影响。</p>', 10, 598, 69, 1567, 34, '2026-05-12 17:00:00', 312, 4.7, 1, 789);
INSERT INTO `bookinformation` VALUES (5, '2026-05-12 10:20:00', '9787208116467', '万历十五年', 'upload/1778756066623_234.jpg', '历史传记', '黄仁宇', '美国', '中文', '生活·读书·新知三联书店', 23456, '2015-08-01', '<p>以万历十五年为切入点,展现了明代中晚期的政治生态和社会风貌,是历史研究的经典之作。</p>', 10, 800, 38, 2134, 45, '2026-05-12 18:30:00', 445, 4.9, 1, 1234);
INSERT INTO `bookinformation` VALUES (6, '2026-05-12 10:25:00', '9787535783448', '时间简史', 'upload/1778756033444_818.jpg', '自然科学', '史蒂芬·霍金', '英国', '中文', '湖南科学技术出版社', 31245, '2015-04-01', '<p>探索宇宙起源、结构和未来的科普经典,用通俗语言讲述深奥的物理学理论。</p>', 10, 1000, 45, 3456, 67, '2026-05-12 19:20:00', 567, 4.8, 1, 1890);
INSERT INTO `bookinformation` VALUES (7, '2026-05-12 10:30:00', '9787040458633', '高等数学', 'upload/1778755941370_471.jpg', '教育考试', '同济大学数学系', '中国', '中文', '高等教育出版社', 45678, '2016-06-01', '<p>全国工科院校广泛使用的数学教材,系统讲解微积分、线性代数和概率论等基础知识。</p>', 5, 2000, 42.5, 891, 123, '2026-05-12 20:10:00', 234, 4.5, 1, 566);
INSERT INTO `bookinformation` VALUES (8, '2026-05-12 10:35:00', '9787515347059', '设计中的设计', 'upload/1778755835824_120.jpeg', '艺术设计', '原研哉', '日本', '中文', '中国青年出版社', 9876, '2016-09-01', '<p>日本设计大师原研哉阐述设计理念和方法的著作,展现了日式设计的简约美学。</p>', 8, 350, 58, 1234, 28, '2026-05-12 21:00:00', 189, 4.7, 1, 456);
INSERT INTO `bookinformation` VALUES (9, '2026-05-12 10:40:00', '9787508668451', '断舍离', 'upload/1778755689992_567.webp', '生活休闲', '山下英子', '日本', '中文', '中信出版社', 28765, '2016-12-01', '<p>提倡通过整理收纳来整理内心,摆脱对物品的执念,过上简约舒适的生活方式。</p>', 10, 700, 35, 2345, 56, '2026-05-12 22:30:00', 345, 4.6, 1, 1123);
INSERT INTO `bookinformation` VALUES (10, '2026-05-12 10:45:00', '9787535383549', '小王子', 'upload/1778755630864_945.jpg', '儿童读物', '安托万·德·圣埃克苏佩里', '法国', '中文', '湖北少年儿童出版社', 52345, '2015-05-01', '<p>全球畅销的童话经典,通过小王子的星际旅行,探讨爱、生命和人生的意义。</p>', 10, 1500, 25, 5678, 89, '2026-05-12 23:10:00', 789, 4.9, 1, 2345);
INSERT INTO `bookinformation` VALUES (11, '2026-05-12 10:50:00', '9787544277822', '活着', 'upload/1778757097896_972.jpg', '文学小说', '余华', '中国', '中文', '作家出版社', 67890, '2012-08-01', '<p>讲述了一个人一生的故事，展现了生命的脆弱与坚韧，是对生存意义的深刻思考。</p>', 10, 800, 32, 6789, 78, '2026-05-11 23:30:00', 890, 4.8, 1, 2678);
INSERT INTO `bookinformation` VALUES (12, '2026-05-12 10:55:00', '9787115428234', 'Python编程：从入门到实践', 'upload/1778757068702_413.png', '计算机科学', 'Eric Matthes', '美国', '中文', '人民邮电出版社', 34567, '2016-07-01', '<p>Python入门经典教程，通过实践项目帮助读者快速掌握Python编程技能。</p>', 8, 499, 79, 2345, 46, '2026-05-11 23:50:00', 456, 4.7, 1, 1234);
INSERT INTO `bookinformation` VALUES (13, '2026-05-12 11:00:00', '9787508678932', '人类简史', 'upload/1778756998181_500.webp', '历史传记', '尤瓦尔·赫拉利', '以色列', '中文', '中信出版社', 45678, '2017-03-01', '<p>从十万年前到21世纪，全景式展现人类发展史，探讨人类如何从普通动物成为地球主宰。</p>', 10, 599, 68, 4568, 89, '2026-05-11 00:10:00', 678, 4.9, 1, 1891);
INSERT INTO `bookinformation` VALUES (14, '2026-05-12 11:05:00', '9787111605430', '经济学原理', 'upload/1778756968245_914.jpg', '经济管理', '曼昆', '美国', '中文', '北京大学出版社', 28765, '2015-09-01', '<p>经济学入门必读经典，系统讲解微观经济学和宏观经济学基本原理。</p>', 5, 396, 89, 1890, 34, '2026-05-11 00:30:00', 345, 4.6, 1, 987);

-- ----------------------------
-- Table structure for bookinformationforecast
-- ----------------------------
DROP TABLE IF EXISTS `bookinformationforecast`;
CREATE TABLE `bookinformationforecast`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `booktitle` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '书名',
  `price` double NULL DEFAULT NULL COMMENT '价格',
  `sales` int(11) NULL DEFAULT NULL COMMENT '销量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '销量预测' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bookinformationforecast
-- ----------------------------
INSERT INTO `bookinformationforecast` VALUES (1, '2026-05-12 14:00:00', '平凡的世界', 59.8, 1650);
INSERT INTO `bookinformationforecast` VALUES (2, '2026-05-12 14:05:00', '算法导论', 99, 2200);
INSERT INTO `bookinformationforecast` VALUES (3, '2026-05-12 14:10:00', '从优秀到卓越', 45, 1300);
INSERT INTO `bookinformationforecast` VALUES (4, '2026-05-12 14:15:00', '思考,快与慢', 69, 1950);
INSERT INTO `bookinformationforecast` VALUES (5, '2026-05-12 14:20:00', '万历十五年', 38, 2420);
INSERT INTO `bookinformationforecast` VALUES (6, '2026-05-12 14:25:00', '时间简史', 45, 3200);
INSERT INTO `bookinformationforecast` VALUES (7, '2026-05-12 14:30:00', '高等数学', 42.5, 4700);
INSERT INTO `bookinformationforecast` VALUES (8, '2026-05-12 14:35:00', '设计中的设计', 58, 1020);
INSERT INTO `bookinformationforecast` VALUES (9, '2026-05-12 14:40:00', '断舍离', 35, 2950);
INSERT INTO `bookinformationforecast` VALUES (10, '2026-05-12 14:45:00', '小王子', 25, 5350);
INSERT INTO `bookinformationforecast` VALUES (11, '2026-05-12 14:50:00', '活着', 32, 6900);
INSERT INTO `bookinformationforecast` VALUES (12, '2026-05-12 14:55:00', 'Python编程：从入门到实践', 79, 34567);
INSERT INTO `bookinformationforecast` VALUES (13, '2026-05-12 15:00:00', '人类简史', 68, 45678);
INSERT INTO `bookinformationforecast` VALUES (14, '2026-05-12 15:05:00', '经济学原理', 89, 28765);

-- ----------------------------
-- Table structure for bookmarkbookpreview
-- ----------------------------
DROP TABLE IF EXISTS `bookmarkbookpreview`;
CREATE TABLE `bookmarkbookpreview`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `chapterid` bigint(20) NOT NULL COMMENT '章节表id',
  `chapternum` int(11) NOT NULL COMMENT '章节数',
  `chaptertitle` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '章节标题',
  `userid` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `progress` int(11) NULL DEFAULT NULL COMMENT '进度',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'bookpreview书签表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bookmarkbookpreview
-- ----------------------------
INSERT INTO `bookmarkbookpreview` VALUES (1, '2026-05-12 14:00:00', 3, 3, '第三章 少安的梦想', 1, 65);
INSERT INTO `bookmarkbookpreview` VALUES (2, '2026-05-12 14:10:00', 8, 3, '第三章 排序算法', 2, 72);
INSERT INTO `bookmarkbookpreview` VALUES (3, '2026-05-12 14:20:00', 17, 3, '第三章 过度自信', 3, 80);
INSERT INTO `bookmarkbookpreview` VALUES (4, '2026-05-12 14:30:00', 22, 3, '第三章 张居正', 4, 75);
INSERT INTO `bookmarkbookpreview` VALUES (5, '2026-05-12 14:40:00', 26, 3, '第三章 膨胀的宇宙', 5, 85);
INSERT INTO `bookmarkbookpreview` VALUES (6, '2026-05-12 14:50:00', 31, 3, '第三章 积分学', 6, 60);
INSERT INTO `bookmarkbookpreview` VALUES (7, '2026-05-12 15:00:00', 35, 3, '第三章 感觉的唤醒', 7, 70);
INSERT INTO `bookmarkbookpreview` VALUES (8, '2026-05-12 15:10:00', 39, 3, '第三章 实践断舍离', 8, 78);
INSERT INTO `bookmarkbookpreview` VALUES (9, '2026-05-12 15:20:00', 43, 3, '第三章 玫瑰与狐狸', 9, 82);
INSERT INTO `bookmarkbookpreview` VALUES (10, '2026-05-12 15:30:00', 47, 3, '第三章 苦难岁月', 10, 88);
INSERT INTO `bookmarkbookpreview` VALUES (11, '2026-05-12 15:40:00', 52, 3, '第三章 列表和操作列表', 1, 68);
INSERT INTO `bookmarkbookpreview` VALUES (12, '2026-05-12 15:50:00', 56, 3, '第三章 人类的融合统一', 2, 76);
INSERT INTO `bookmarkbookpreview` VALUES (13, '2026-05-12 16:00:00', 60, 3, '第三章 供给与需求', 3, 84);
INSERT INTO `bookmarkbookpreview` VALUES (14, '2026-05-12 16:10:00', 5, 5, '第五章 奋斗与希望', 4, 95);
INSERT INTO `bookmarkbookpreview` VALUES (15, '2026-05-12 16:20:00', 10, 5, '第五章 图算法', 5, 90);
INSERT INTO `bookmarkbookpreview` VALUES (16, '2026-05-12 16:30:00', 14, 4, '第四章 直面残酷的现实', 6, 88);
INSERT INTO `bookmarkbookpreview` VALUES (17, '2026-05-12 16:40:00', 19, 5, '第五章 两个自我', 7, 92);
INSERT INTO `bookmarkbookpreview` VALUES (18, '2026-05-12 16:50:00', 23, 4, '第四章 海瑞', 8, 86);
INSERT INTO `bookmarkbookpreview` VALUES (19, '2026-05-12 17:00:00', 28, 5, '第五章 宇宙的起源和命运', 9, 94);
INSERT INTO `bookmarkbookpreview` VALUES (20, '2026-05-12 17:10:00', 32, 4, '第四章 多元函数微积分', 10, 82);
INSERT INTO `bookmarkbookpreview` VALUES (21, '2026-05-12 17:20:00', 36, 4, '第四章 设计的未来', 1, 87);
INSERT INTO `bookmarkbookpreview` VALUES (22, '2026-05-12 17:30:00', 40, 4, '第四章 断舍离的人生', 2, 91);
INSERT INTO `bookmarkbookpreview` VALUES (23, '2026-05-12 17:40:00', 44, 4, '第四章 真正的宝藏', 3, 85);
INSERT INTO `bookmarkbookpreview` VALUES (24, '2026-05-12 17:50:00', 49, 5, '第五章 与牛为伴', 4, 96);
INSERT INTO `bookmarkbookpreview` VALUES (25, '2026-05-12 18:00:00', 53, 4, '第四章 函数和模块', 5, 88);
INSERT INTO `bookmarkbookpreview` VALUES (26, '2026-05-17 16:24:23', 61, 4, '第四章 市场与福利', 10, 0);
INSERT INTO `bookmarkbookpreview` VALUES (27, '2026-05-17 16:25:07', 50, 1, '第一章 Python入门', 10, 0);
INSERT INTO `bookmarkbookpreview` VALUES (28, '2026-05-17 16:25:30', 53, 4, '第四章 函数和模块', 10, 0);

-- ----------------------------
-- Table structure for bookpreview
-- ----------------------------
DROP TABLE IF EXISTS `bookpreview`;
CREATE TABLE `bookpreview`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `isbn` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'ISBN',
  `booktitle` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'booktitle',
  `bookclassification` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图书分类',
  `author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '作者',
  `authorsnationality` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '作者国籍',
  `language` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '语言',
  `publishinghouse` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '出版社',
  `publicationdate` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '出版日期',
  `bookcover` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '图书封面',
  `bookintroduction` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '图书简介',
  `thumbsupnum` int(11) NULL DEFAULT 0 COMMENT '赞',
  `crazilynum` int(11) NULL DEFAULT 0 COMMENT '踩',
  `storeupnum` int(11) NULL DEFAULT 0 COMMENT '收藏数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `bookclassification`(`bookclassification`) USING BTREE,
  CONSTRAINT `bookpreview_ibfk_1` FOREIGN KEY (`bookclassification`) REFERENCES `bookclassification` (`bookclassification`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '图书试看' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bookpreview
-- ----------------------------
INSERT INTO `bookpreview` VALUES (1, '2026-05-12 10:00:00', '9787020145607', '平凡的世界', '文学小说', '路遥', '中国', '中文', '人民文学出版社', '2012-09-01', 'upload/1778756677058_36.png', '<p>一部全景式地表现中国当代城乡社会生活的长篇小说,展现了普通人在大时代历史进程中所走过的艰难曲折的道路。</p>', 156, 8, 234);
INSERT INTO `bookpreview` VALUES (2, '2026-05-12 10:05:00', '9787111544937', '算法导论', '计算机科学', 'Thomas H. Cormen', '美国', '中文', '机械工业出版社', '2015-03-01', 'upload/1778756499656_992.png', '<p>全面介绍计算机算法的经典著作,涵盖排序、数据结构、图算法等内容,是计算机科学专业必备教材。</p>', 234, 12, 456);
INSERT INTO `bookpreview` VALUES (3, '2026-05-12 10:10:00', '9787508648231', '从优秀到卓越', '经济管理', '吉姆·柯林斯', '美国', '中文', '中信出版社', '2015-06-01', 'upload/1778756310324_436.png', '<p>探讨了优秀企业如何实现跨越式发展,成为卓越企业的核心原则和实践方法。</p>', 89, 5, 123);
INSERT INTO `bookpreview` VALUES (4, '2026-05-12 10:15:00', '9787115428691', '思考,快与慢', '心理学', '丹尼尔·卡尼曼', '美国', '中文', '人民邮电出版社', '2016-11-01', 'upload/1778756281027_356.png', '<p>诺贝尔经济学奖得主卡尼曼的代表作,揭示了人类思维的两种模式及其对决策的影响。</p>', 312, 18, 567);
INSERT INTO `bookpreview` VALUES (5, '2026-05-12 10:20:00', '9787208116467', '万历十五年', '历史传记', '黄仁宇', '美国', '中文', '生活·读书·新知三联书店', '2015-08-01', 'upload/1778756066623_234.jpg', '<p>以万历十五年为切入点,展现了明代中晚期的政治生态和社会风貌,是历史研究的经典之作。</p>', 445, 23, 890);
INSERT INTO `bookpreview` VALUES (6, '2026-05-12 10:25:00', '9787535783448', '时间简史', '自然科学', '史蒂芬·霍金', '英国', '中文', '湖南科学技术出版社', '2015-04-01', 'upload/1778756033444_818.jpg', '<p>探索宇宙起源、结构和未来的科普经典,用通俗语言讲述深奥的物理学理论。</p>', 567, 34, 1234);
INSERT INTO `bookpreview` VALUES (7, '2026-05-12 10:30:00', '9787040458633', '高等数学', '教育考试', '同济大学数学系', '中国', '中文', '高等教育出版社', '2016-06-01', 'upload/1778755941370_471.jpg', '<p>全国工科院校广泛使用的数学教材,系统讲解微积分、线性代数和概率论等基础知识。</p>', 234, 45, 345);
INSERT INTO `bookpreview` VALUES (8, '2026-05-12 10:35:00', '9787515347059', '设计中的设计', '艺术设计', '原研哉', '日本', '中文', '中国青年出版社', '2016-09-01', 'upload/1778755835824_120.jpeg', '<p>日本设计大师原研哉阐述设计理念和方法的著作,展现了日式设计的简约美学。</p>', 189, 15, 234);
INSERT INTO `bookpreview` VALUES (9, '2026-05-12 10:40:00', '9787508668451', '断舍离', '生活休闲', '山下英子', '日本', '中文', '中信出版社', '2016-12-01', 'upload/1778755689992_567.webp', '<p>提倡通过整理收纳来整理内心,摆脱对物品的执念,过上简约舒适的生活方式。</p>', 345, 28, 679);
INSERT INTO `bookpreview` VALUES (10, '2026-05-12 10:45:00', '9787535383549', '小王子', '儿童读物', '安托万·德·圣埃克苏佩里', '法国', '中文', '湖北少年儿童出版社', '2015-05-01', 'upload/1778755630864_945.jpg', '<p>全球畅销的童话经典,通过小王子的星际旅行,探讨爱、生命和人生的意义。</p>', 789, 45, 1567);
INSERT INTO `bookpreview` VALUES (11, '2026-05-12 10:50:00', '9787544277822', '活着', '文学小说', '余华', '中国', '中文', '作家出版社', '2012-08-01', 'upload/1778757097896_972.jpg', '<p>讲述了一个人一生的故事，展现了生命的脆弱与坚韧，是对生存意义的深刻思考。</p>', 890, 56, 1890);
INSERT INTO `bookpreview` VALUES (12, '2026-05-12 10:55:00', '9787115428234', 'Python编程：从入门到实践', '计算机科学', 'Eric Matthes', '美国', '中文', '人民邮电出版社', '2016-07-01', 'upload/1778757068702_413.png', '<p>Python入门经典教程，通过实践项目帮助读者快速掌握Python编程技能。</p>', 456, 34, 789);
INSERT INTO `bookpreview` VALUES (13, '2026-05-12 11:00:00', '9787508678932', '人类简史', '历史传记', '尤瓦尔·赫拉利', '以色列', '中文', '中信出版社', '2017-03-01', 'upload/1778756998181_500.webp', '<p>从十万年前到21世纪，全景式展现人类发展史，探讨人类如何从普通动物成为地球主宰。</p>', 678, 45, 1234);
INSERT INTO `bookpreview` VALUES (14, '2026-05-12 11:05:00', '9787111605430', '经济学原理', '经济管理', '曼昆', '美国', '中文', '北京大学出版社', '2015-09-01', 'upload/1778756968245_914.jpg', '<p>经济学入门必读经典，系统讲解微观经济学和宏观经济学基本原理。</p>', 345, 23, 567);

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `tablename` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'bookinformation' COMMENT '商品表名',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `goodid` bigint(20) NOT NULL COMMENT '商品id',
  `goodname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `picture` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '图片',
  `buynumber` int(11) NOT NULL COMMENT '购买数量',
  `price` double NULL DEFAULT NULL COMMENT '单价',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `price`(`price`) USING BTREE,
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`price`) REFERENCES `bookinformation` (`price`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '购物车表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (1, '2026-05-14 19:38:17', 'bookinformation', 10, 12, 'Python编程：从入门到实践', 'upload/1778757068702_413.png', 1, 79);
INSERT INTO `cart` VALUES (2, '2026-05-14 19:38:47', 'bookinformation', 10, 1, '平凡的世界', 'upload/1778756677058_36.png', 1, 59.8);
INSERT INTO `cart` VALUES (4, '2026-05-14 19:39:11', 'bookinformation', 10, 13, '人类简史', 'upload/1778756998181_500.webp', 1, 68);
INSERT INTO `cart` VALUES (5, '2026-05-14 19:49:56', 'bookinformation', 9, 14, '经济学原理', 'upload/1778756968245_914.jpg', 1, 89);
INSERT INTO `cart` VALUES (6, '2026-05-14 19:50:00', 'bookinformation', 9, 13, '人类简史', 'upload/1778756998181_500.webp', 1, 68);
INSERT INTO `cart` VALUES (7, '2026-05-14 19:55:46', 'bookinformation', 4, 14, '经济学原理', 'upload/1778756968245_914.jpg', 1, 89);
INSERT INTO `cart` VALUES (8, '2026-05-14 19:55:59', 'bookinformation', 4, 13, '人类简史', 'upload/1778756998181_500.webp', 1, 68);

-- ----------------------------
-- Table structure for chaptertushushikan
-- ----------------------------
DROP TABLE IF EXISTS `chaptertushushikan`;
CREATE TABLE `chaptertushushikan`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `refid` bigint(20) NOT NULL COMMENT '关联表id',
  `chapternum` int(11) NOT NULL COMMENT '章节数',
  `chaptertitle` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '章节标题',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '章节内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '图书试看章节' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of chaptertushushikan
-- ----------------------------
INSERT INTO `chaptertushushikan` VALUES (1, '2026-05-12 11:00:00', 1, 1, '第一章 黄土高原的春天', '\r\n<p>1975年二、三月间，一个平平常常的日子，细蒙蒙的雨丝夹着一星半点的雪花，正纷纷淋淋地向大地飘洒着。时令已快到惊蛰，雪当然再不会存留，往往还没等落地，就已经消失得无踪无影了。黄土高原严寒而漫长的冬天看来就要过去，但那真正温暖的春天还远远地没有到来。</p>\r\n<p>在这样尴尬的季节里，双水村的梁峁上依然是一片苍茫与寂凉。一连几天的阴雨让村里的土路变得泥泞不堪，踩一脚下去，鞋底就能粘上厚厚的一层红粘土。早起下地干活的村民们不得不把裤腿挽得高高的，缩着脖子在田垄间瑟瑟发抖。风里带着刺骨的寒意，刀子一样刮在人们粗糙的脸皮上，让人忍不住直打喷嚏。</p>\r\n<p>然而，在这看似沉寂和绝望的土地下方，生命的种子已经在悄悄蓄力。只要你侧耳细听，仿佛能听到泥土深处冰层裂开的细微声响，那是大地正在复苏的呼吸。枯萎了一整个冬天的野草根部，已经隐隐泛出了一丝不易察觉的淡淡青绿，它们同样在等待着一场真正唤醒万物的春雨，等待着把这片黄色的世界装点成生机勃勃的模样。</p>\r\n<p>在这冷清的早晨，学校那口挂在老榆树上的破铁钟又准时沉闷地响了起来。钟声穿过密密麻麻的雨丝，在空旷的山谷间回荡。孩子们背着破旧的布书包，在泥水里一跐一滑地朝学校跑去。他们那冻得通红的小脸上挂着亮晶晶的鼻涕，却依然遮挡不住眼睛里对这个世界最纯真的渴望与好奇。</p>\r\n');
INSERT INTO `chaptertushushikan` VALUES (2, '2026-05-12 11:05:00', 1, 2, '第二章 双水村的早晨', '\r\n<p>双水村位于黄土高原腹地，是一个普通的北方农村。这里沟壑纵横，山峦起伏，两座巨大的山梁像一双粗壮的手臂，将这个古老的村落紧紧地搂在怀里。清晨，当东方刚刚露出第一缕鱼肚白时，村子里的公鸡便开始此起彼伏地大声打鸣，打破了夜的沉静。</p>\r\n<p>随着鸡叫声，一缕缕淡淡的炊烟开始从小镇依山而建的成排窑洞顶上袅袅升起。这些炊烟在清冷、潮湿的空气中慢慢散开，渐渐融为一体，像一层薄薄的轻纱笼罩在村子的上空。空气中开始弥漫着一股烧柴禾的熟悉焦香味，那是婆姨们正在灶前忙碌，准备着一家人填饱肚子的早饭。</p>\r\n<p>村民们陆续下炕起床，扣上略显破旧且补丁摞补丁的棉袄，踢踏着布鞋走到院子里。男人们大都习惯端着一个粗瓷大碗，在碗里盛上大半碗稀薄的黄米粥，然后三三两两地蹲在自家的门圪劳或者村头的大槐树下。他们一边吸溜吸溜地喝着热粥，一边吧嗒吧嗒地抽着旱烟，互相交流着今天地里的农活和队里的工分。</p>\r\n<p>妇女们则踩着结了薄霜的小路，手里端着木盆，结伴去河边担水或洗衣服。木桶晃荡的声音在寂静的山谷间显得格外清脆，伴随着圈里老牛偶尔发出的低哼，这片古老而贫瘠的土地，又在日复一日、年复一年的辛劳与平凡中，渐渐地彻底苏醒了过来。</p>\r\n');
INSERT INTO `chaptertushushikan` VALUES (3, '2026-05-12 11:10:00', 1, 3, '第三章 少安的梦想', '\r\n<p>孙少安从小就有一个执着的梦想，那就是让全家人彻底摆脱饥饿的折磨，过上真正有尊严、不求人的好日子。作为这个贫苦大家庭中最年长的儿子，他从十三岁起就跟着父亲下田干活。他那过早成熟的肩膀上，压着超越年龄的沉重重担，这让他比同龄人多了一份不属于这个年纪的沉稳与坚毅。</p>\r\n<p>每天天不亮，少安就要第一个起床，去队里套牛、派活。他不仅要考虑如何多下田、多挣工分来糊口，还要时刻操心家里下学期弟弟妹妹那几块钱的学费和长年吃药的祖母。生活的苦难像一把锋利的刻刀，在他原本年轻的脸庞上留下了几道深深的印记，但他那双黑亮的眼睛里，却永远闪烁着一股不服输的灼热光芒。</p>\r\n<p>在少安看来，人只要肯吃苦、愿意流汗，脚底下的泥土就绝对不会亏待你。无数个疲摆不堪的夜晚，当家里人都已经沉沉睡去，他常常一个人默默地坐在窑洞外的石凳上，望着满天的繁星，一口接一口地抽着劣质的旱烟。烟头在黑暗中忽明忽暗，映照着他那张写满沉思的年轻面庞。</p>\r\n<p>他的思绪往往会飘得很远，飘过眼前的这座大山，飘向未知的远方。他在心中无数次默默地发誓，自己绝对不能一辈子就这样窝在穷山沟里当一辈子泥腿子。他一定要带着双水村的乡亲们，在这片老祖宗留下的、贫瘠干涸的黄土地上，用汗水生生开辟出一条能够顿顿吃上白面馍馍的致富新路。</p>\r\n');
INSERT INTO `chaptertushushikan` VALUES (4, '2026-05-12 11:15:00', 1, 4, '第四章 时代的变迁', '\r\n<p>随着历史车轮的滚滚向前，时间终于来到了一个命运的转折点。改革开放的春风终于像一股不可阻挡的巨大洪流，冲破了重重阻碍，开始吹向这片闭塞、古老而又有些麻木的黄土地。村头高音大喇叭里不再只是枯燥乏味的政治口号，而是开始传来了关于土地承包、自主经营和发展个体经济的全新政策。</p>\r\n<p>这些陌生而又令人心跳加速的新名词，像一颗颗重磅炸弹，在平静了多年的双水村激起了千层浪。人们干涸了太久的心灵开始泛起层层漪涟，私底下，村民们开始扎堆咬耳朵，有人兴奋得整夜睡不着觉，也有人抱着怀疑的态度，生怕这又是‘割资本主义尾巴’的某种政治圈套，一时间人心惶惶却又充满期待。</p>\r\n<p>孙少安那敏锐的直觉让他第一时间感受到了这种历史性的巨大变化。站在田埂上，看着冬去春来、渐渐解冻的土地，他隐约意识到，一个属于奋斗者、属于敢想敢干之人的黄金时代正在缓缓拉开序幕。那些过去被视为违规、甚至要挨批斗的生产尝试，如今正在变成改变全家人命运的唯一契机。</p>\r\n<p>他开始不满足于每天在生产队里按部就班地混日子，他的心思开始活泛起来。在几番痛苦的权衡与激烈的思想斗争后，少安决定做第一个吃螃蟹的人。他要利用政策的松动，寻找一条能真正解决温饱的门路。哪怕前方布满了未知的风险与流言蜚语，他也决定挺起胸膛，勇敢地向这古老的体制发起第一次冲击。</p>\r\n');
INSERT INTO `chaptertushushikan` VALUES (5, '2026-05-12 11:20:00', 1, 5, '第五章 奋斗与希望', '\r\n<p>然而，创业的道路从来都不是一帆风顺的，等待着孙少安的是接踵而至的巨大打击。在尝试开办砖厂的初期，由于缺乏专业技术，第一窑烧出来的砖全是毫无用处的碎渣。这不仅赔光了他东拼西凑借来的所有本金，还让那些原本就等着看他笑话的村民们在背后指指点点，冷嘲热讽的风言风语像刀子一样扎向他。</p>\r\n<p>面对资金断裂、债主临门以及村民们极度不信任的重重困境和人生挫折，少安一个人躲在无人的山沟里抱头大哭了一场。但哭过之后，他抹干眼泪，骨子里的那股西北汉子的倔强与狠劲被彻底激发了出来。他没有选择向命运低头，更没有丝毫退缩和放弃的念头，他坚信自己的方向绝对没有错。</p>\r\n<p>他再次起早贪黑，磨破了无数双粗布鞋，甚至厚着脸皮去求外地的师傅来帮忙指导。他用真诚的眼神和写满血丝的承诺，一次次劝说那些犹疑不决的乡亲们留下来继续干。在布满泥泞、汗水与血泪的致富路上，他顶住了所有的压力，终于在第二年春天，迎来了红砖顺利出窑的历史时刻。</p>\r\n<p>当看到那冒着熊熊红火烟雾的砖窑里，一块块结实硬朗的红砖被整齐地码放出来，当看到那些跟着他干的贫困乡亲们脸上终于露出了久违、真挚的灿烂笑容时，少安站在滚烫的红砖堆旁，忍不住长长地舒了一口气。他知道，双水村长达数百年的贫困历史，注定要在他们这一代人手里，被彻底改写了。</p>\r\n');
INSERT INTO `chaptertushushikan` VALUES (6, '2026-05-12 11:25:00', 2, 1, '第一章 算法在计算中的作用', '\r\n<p>在当代计算机科学的庞大版图之中，算法无疑是最核心、最稳固的底层支柱。从宏观的角度来看，算法绝不仅仅是一串没有生命的冰冷程序代码，它们本质上是一套形式化的、逻辑严密的、用于解决各种复杂计算问题的确定性数学方法。无论是简单的数字排序，还是现代大语言模型背后的分布式参数优化，算法都在幕后扮演着指挥官的角色。</p>\r\n<p>随着大数据和云计算时代的全面到来，数据规模呈现出爆发式的指数级增长。在海量的数据洪流面前，一个优秀算法的价值被成倍放大。在同样的硬件环境下，高效的算法能够以不可思议的速度完成计算，而拙劣的算法则可能导致程序陷入永久的死锁。可以说，算法的设计水平直接决定了软件系统能够达到的性能上限。</p>\r\n<p>不仅如此，优秀的算法更能为整个企业、乃至整个社会节约宝贵的硬件算力资源与电力能源。在追求绿色计算与低延迟体验的今天，对算法的极致优化已经成了顶尖科技公司保持核心竞争力的制胜法宝。一个微小的复杂度降低，在几亿用户的访问基数下，带来的都是数以百万计的成本削减。</p>\r\n<p>本章将作为全书的宏大引言，旨在带领读者跨入算法的神圣殿堂。我们将从最基础的输入、输出、确定性和有限性等核心概念入手，详细给出算法的形式化定义。同时，我们将结合当今高度数字化、智能化的社会实际，深入探讨算法是如何作为底层逻辑在现代计算中发挥决定性重要作用的。</p>\r\n');
INSERT INTO `chaptertushushikan` VALUES (7, '2026-05-12 11:30:00', 2, 2, '第二章 算法基础', '\r\n<p>在真正动手编写复杂的程序代码之前，我们需要一套科学、系统且客观的数学工具，来对算法的性能进行严谨的评估。这便是算法分析与设计的核心目的。本章将带领读者深入探讨如何对算法在运行过程中所消耗的计算资源进行定量分析，重点在于空间与时间两个维度的博弈。</p>\r\n<p>我们将深入剖析时间复杂度和空间复杂度的核心概念。在计算机科学中，我们很少关注算法在某台具体电脑上跑了多少秒，因为硬件性能千差万别。相反，我们关注的是随着输入数据规模 $N$ 的增长，算法运行所需的计算步骤和内存空间的增长趋势。为此，我们将正式引入经典的渐近记号：大 $O$ 记号、$Omega$ 记号以及 $Theta$ 记号。</p>\r\n<p>这些记号构成了算法理论的数学语言，它们允许我们忽略掉那些次要的常数项和低阶项，从而能够客观、跨平台地评估和比较一个算法在最好情况、最坏情况以及平均情况下的系统执行效率。掌握这些渐近分析方法，是你从一个普通的‘代码搬运工’彻底蜕变为‘优秀架构师’的必经之路。</p>\r\n<p>此外，本章还将通过具体的‘循环不变式’实例，展示如何像证明数学定理一样，一步步严格地证明一个算法的正确性。通过对基础算法设计范式（如分治策略和递推关系）的初步探讨，我们将为后续章节学习更复杂的贪心、动态规划以及高级数据结构打下极其坚实的理论基石。</p>\r\n');
INSERT INTO `chaptertushushikan` VALUES (8, '2026-05-12 11:35:00', 2, 3, '第三章 排序算法', '\r\n<p>排序算法是计算机科学中最基础、最频繁使用的底层操作之一，同时它也是评估和展示各种算法设计思想的最佳舞台。在实际的工程开发中，无论是数据库索引的建立，还是搜索引擎对网页相关性的权重排列，都离不开高效的排序技术。通过学习排序，我们可以最直观地体会到算法优劣带来的性能天壤之别。</p>\r\n<p>本章将带领读者深入、系统地剖析几种具有里程碑意义的经典排序算法。首先，我们将从简单直观但执行效率较低的初等排序算法入手，包括冒泡排序、插入排序和选择排序。我们将详细推推导它们在最坏和平均情况下的时间复杂度为什么是 $O(N^2)$，并分析为什么它们在处理海量数据时会面临严重的性能瓶颈。</p>\r\n<p>紧接着，章节将迎来真正的高潮——采用‘分治法（Divide and Conquer）’核心思想的高效排序算法：快速排序（Quick Sort）和归并排序（Merge Sort）。我们将剖析它们如何通过递归将一个庞大的问题拆解为多个微小的子问题，从而生生将时间复杂度降低到了极其优秀的 $O(N log N)$ 级别。</p>\r\n<p>通过对这些排序算法在不同输入规模、不同初始状态（如完全随机、逆序、基本有序）下的数学期望、比较次数以及内存开销进行细致入微的图形化对比，读者将深刻体会到不同算法设计范式对程序实际性能带来的巨大影响，并学会在面对真实的业务场景时，如何挑选出最完美的排序解决方案。</p>\r\n');
INSERT INTO `chaptertushushikan` VALUES (9, '2026-05-12 11:40:00', 2, 4, '第四章 数据结构', '\r\n<p>如果说算法是程序的灵魂和执行逻辑，那么数据结构就是程序的骨架与血肉。数据结构的形式化定义，是指组织、管理和存储数据的特定方式。它并不是孤立存在的，而是直接决定了在其上运行的各种算法的整体执行效率。没有合理的数据结构支撑，再精妙的算法也会变成无源之水。</p>\r\n<p>本章将全面、系统地介绍计算机科学中几种最基础且核心的数据结构。我们将首先从底层的线性结构开始谈起，深入探讨数组（Array）和链表（LinkedList）在内存分配上的本质区别，对比它们在随机访问和动态插入元素时的性能代价。随后，我们将讲解具有‘后进先出’特性的栈（Stack）和‘先进先出’特性的队列（Queue）的底层实现。</p>\r\n<p>在此基础上，章节的重心将逐步延伸到更加复杂的非线性数据结构。我们将重点解构树（Tree）的概念，特别是二叉搜索树（BST）以及为了解决树形退化而诞生的散列树平衡方案——红黑树（Red-Black Tree）。我们将详细分析红黑树在频繁进行插入和删除操作时，如何通过颜色旋转保持树的平衡，从而确保各项操作的时间复杂度稳定在 $O(log N)$。</p>\r\n<p>最后，我们还将引入图（Graph）的表示方法，以及散列表（Hash Table）的冲突解决策略（如链地址法和开放寻址法）。理解这些数据结构的内在物理机理、内存对齐和空间利用率，是写出高质量、高并发、可扩展软件系统的必备前提。只有对数据结构了然于胸，你才能在面对复杂业务模型时做到游刃有余。</p>\r\n');
INSERT INTO `chaptertushushikan` VALUES (10, '2026-05-12 11:45:00', 2, 5, '第五章 图算法', '\r\n<p>图（Graph）是一种强大且极具表现力的数学模型，专门用于描述现实世界中各种对象之间错综复杂的关联关系。无论是社交网络中错综复杂的人际好友链、城市交通网络中四通八达的道路规划、互联网中网页之间的超链接，还是深度学习中复杂的神经网络拓扑，都可以被完美地抽象为由顶点（Vertex）和边（Edge）构成的图结构。</p>\r\n<p>本章将重点介绍图的基本数学概念，详细对比邻接矩阵（Adjacency Matrix）和邻接表（Adjacency List）两种主流表示方法在空间复杂度和遍历效率上的各自优缺点。在此基础上，我们将深入剖析图论中最核心的两大基础遍历算法：广度优先搜索（BFS）和深度搜索（DFS），理解它们是如何利用队列和栈来一步步探索未知时空的。</p>\r\n<p>在掌握了基础遍历之后，章节将带读者发起对图论最优化问题的冲击。我们将深入剖析诸如Dijkstra算法、Bellman-Ford算法以及Floyd-Warshall算法等经典的单源与多源最短路径解决方案，推导它们在处理包含负权边、环路图时的正确性与边界条件。这些算法正是如今各大家地图软件进行路线规划的核心理论依托。</p>\r\n<p>最后，本章还将详细讲解用于解决网络铺设成本最优化问题的最小生成树（MST）算法，包括经典的Prim算法和Kruskal算法，并引入并查集（Union-Find）数据结构来优化算法的执行代价。通过这些极其生动的实际工程案例，读者将彻底掌握利用图论算法攻克现实工程中拓扑排序、网络流和最优化抉择的核心实战技能。</p>\r\n');
INSERT INTO `chaptertushushikan` VALUES (11, '2026-05-12 11:50:00', 3, 1, '第一章 优秀是卓越的大敌', '\r\n<p>为什么有些企业能够打破平庸，成功实现向卓越的跨越式发展，而另一些企业倾尽全力却永远只能停留在优秀的泥潭中？这是一个困扰全球管理界多年的核心课题。优秀往往让我们满足于现状、忽视了潜伏的危机，从而失去了更进一步的动力。</p>\r\n<p>在长达数年的严谨数据调研和企业对比分析中，我们发现绝大多数企业在取得一定成绩后，管理层就会陷入一种盲目的自满。他们开始构筑高大上的办公楼，沉迷于各种商业聚会，却忘记了让企业保持活力的根本原因。‘优秀’变成了一个舒适的牢笼，紧紧地锁住了员工的创造力和危机感。</p>\r\n<p>而那些真正走向卓越的企业，从不把‘优秀’当成终点。在他们的企业文化里，昨天的辉煌只是今天的起点。他们时刻保持着如履薄冰的危机意识，不断寻找系统中的漏洞并加以修正。这种对平庸的拒绝，成了拉开两类企业差距的分水岭。</p>\r\n<p>本章将作为全书的引言，彻底颠覆传统的商业认知。我们将带你拉开这场关于企业命运、体制重塑与长期主义的管理学探索序幕。你将看到，如何通过对组织结构的微调，释放出抗击市场风暴的巨大潜能。</p>\r\n');
INSERT INTO `chaptertushushikan` VALUES (12, '2026-05-12 11:55:00', 3, 2, '第二章 第五级经理人', '\r\n<p>通过对大量实现跨越的公司进行深度剖析，我们发现这些卓越企业的领导者具有一种独特的、甚至有些矛盾的品格：他们将个人的谦逊品质与职业的钢铁意志完美地融为一体。他们不贪图个人的聚光灯，而是将企业的长远发展置于首位。</p>\r\n<p>这种被称为‘第五级经理人’的领导角色，彻底颠覆了大众对于‘高调、明星式CEO’的迷信。在公司的公开财报和媒体采访中，你很难看到他们个人的大张旗鼓的宣传。相反，当公司取得巨大成就时，他们总是把功劳归结于团队和运气；而当公司遭遇挫折时，他们却会第一个站出来承担责任。</p>\r\n<p>但在温和的外表下，他们拥有着不达目的誓不罢休的钢铁般坚强意志。为了企业的长期利益，他们可以毫不留情地砍掉不赚钱的边缘业务，哪怕这些业务是自己曾经亲手建立的。这种理性的冷酷与无私的谦逊，构成了卓越领导力的最高境界。</p>\r\n<p>本章将详细解构这一核心领导力模型，阐述他们是如何在幕后默默为企业建立起基业长青的持久伟大基石。通过具体的案例对比，你会发现，正是这种人格魅力，吸引了无数顶尖人才死心塌地地为公司效力。</p>\r\n');
INSERT INTO `chaptertushushikan` VALUES (13, '2026-05-12 12:00:00', 3, 3, '第三章 先人后事', '\r\n<p>在企业变革或战略转型的初期，平庸的企业往往习惯于先制定宏伟的战略路线图，然后再去找人执行。然而，卓越企业在决策时则遵循一条完全相反的根本原则：先人后事。也就是说，在决定把车开往哪里之前，必须先让合适的人上车，让不合适的人下车。</p>\r\n<p>因为战略在多变的市场中随时需要调整，而只有高度契合、具备卓越能力的团队，才能在迷茫与风暴中自主找到正确的方向并坚定不移地走下去。如果你的车上全是不合适的人，那么无论你的战略有多么完美，最终都只会走向执行力瘫痪的灾难结局。</p>\r\n<p>‘合适的人’并不一定意味着学历最高或资历最深，而是指那些在价值观上与企业高度一致、具备强烈自我驱动力和学习能力的人。这样的人不需要复杂的KPI去鞭策，他们本身就对卓越有着病态的追求。一旦把他们放在合适的座位上，他们就会爆发出惊人的能量。</p>\r\n<p>本章将深度剖析卓越企业的招聘与人才留存机制。你将学会如何在一面试中筛选出真正具备‘卓越基因’的员工，以及如何果断地淘汰那些阻碍组织进化的‘平庸之辈’，为你的商业战车打造最核心的动力引擎。</p>\r\n');
INSERT INTO `chaptertushushikan` VALUES (14, '2026-05-12 12:05:00', 3, 4, '第四章 直面残酷的现实', '\r\n<p>卓越企业不回避残酷的现实，而是以坚定的信念直面困难，从中寻找突破的机会。他们建立了健全的信息过滤器，敢于让员工吐露真相。在严峻的市场竞争、技术淘汰或财务危机面前，管理层从不活在虚假的繁荣和乐观的幻觉中。</p>\r\n<p>这种‘两面性’在心理学上被称为斯托克代尔悖论：一方面，你必须坚信自己最终必定能够克服困难、取得胜利；另一方面，你又必须有清醒的理智，去直面眼前最残酷的现实，绝不自欺欺人。这两者看似矛盾，却是卓越组织活下去的必备精神支柱。</p>\r\n<p>在许多破产的企业案例中，高层往往习惯于听取粉饰太平的汇报，对一线的亏损和用户的抱怨视而不见，直到危机彻底爆发。而卓越企业则鼓励‘听得见炮火的人’做决策，他们在内部开展激烈的辩论，甚至刻意制造冲突，以此来压榨出最真实的经营现状。</p>\r\n<p>本章将结合生动的企业转型案例，详细阐述领导者应当如何营造出一种能够让员工吐露真相、让管理层直面残酷现实，却又决不丢失必必胜信心的健康组织文化。你会看到，真正的勇气不是盲目乐观，而是看清真相后的死磕到底。</p>\r\n');
INSERT INTO `chaptertushushikan` VALUES (15, '2026-05-12 11:10:00', 4, 1, '第一章 两种思维系统', '\r\n<p>人类的大脑作为漫长进化史上的最高杰作，在处理纷繁复杂的外部世界信息时，逐渐演化出了两套并行运行、分工明确却又紧密交织的思考系统。丹尼尔·卡尼曼教授在书中将它们通俗地命名为系统1（快思考）和系统2（慢思考）。这两个系统的博弈，构成了我们一切决策、情绪与偏见的认知底层逻辑。</p>\r\n<p>系统1是快速、直觉、无意识且完全自动运行的。它就像是运行在后台的常驻底层程序，不需要耗费任何心智努力就能在瞬间对外部刺激做出反应。例如，当你看到一张愤怒的脸、听到一声刺耳的巨响，或者在熟练地驾驶汽车时，系统1都在凭借本能和经验瞬间做出决策。它是进化的恩赐，帮助我们的祖先在弱肉强食的原始丛林中幸存下来。</p>\r\n<p>然而，系统1虽然高效，却极其容易受到各种视觉错觉、情绪波动和认知偏见的误导。相比之下，系统2则是缓慢、深思熟虑、充满逻辑且需要耗费大量心理能量的。它负责处理那些复杂的、非本能的难题。例如，当你在脑海中计算 $17 	imes 24$ 的乘积、在一间嘈杂的房间里刻意寻找一个穿红色衣服的朋友，或者在填写复杂的税务表格时，系统2才会被极不情愿地被唤醒。</p>\r\n<p>系统2是极其懒惰的，大脑为了节约宝贵的身体能量，总是倾向于让系统1去接管日常事务，只有当系统1遇到无法解释的冲突或错误时，系统2才会介入。这两个系统在日常生活中不断地相互配合、相互妥协，但也正是在这种偷懒与妥协之中，滋生了无数个连我们自己都无法察觉的荒谬认知误区。本章将为你正式打开这扇认知科学的神秘大门。</p>\r\n');
INSERT INTO `chaptertushushikan` VALUES (16, '2026-05-12 11:15:00', 4, 2, '第二章 启发法与偏见', '\r\n<p>面对这个充满了不确定性、信息瞬息万变且极其庞杂的现实世界，我们的大脑如果每一次做决定都要启动系统2进行严密的逻辑推导和数据统计，那我们可能连早饭吃什么都要纠结上好几个小时。为了生存和节约宝贵的精力，我们的大脑在漫长的进化中学会了贪图省力，这便是‘启发法（Heuristics）’——也就是依靠直觉走捷径、凭经验做决定。</p>\r\n<p>启发法虽然在多数情况下能帮我们快速应付过去，但这种‘贪图省力’的本能往往会导致一系列严重的、系统性的认知偏见。本章将详细探讨几种在商业、投资和日常管理中高频出现的直觉陷阱。首先是‘可得性启发’，即人们往往会根据一件事情在脑海中被想起来的容易程度，来盲目判断它发生的真实概率。例如，在看完一场空难新闻后，人们往往会过度恐慌，误以为坐飞机是一件极其危险的事。</p>\r\n<p>下一个著名的直觉陷阱是‘典型性启发’。我们总是习惯于用刻板印象去评估概率，而完全忽视了基础比率（Base Rate）的存在。比如，当我们描述一个性格内向、喜欢整洁、对细节一丝不苟的人时，系统1会自动倾向于认为他更可能是一个图书管理员，而不是一个农民。但理性的系统2如果去查阅统计数据，就会发现农民的总人口基数是图书管理员的数百倍，他其实更有可能是一个性格内向的农民。</p>\r\n<p>通过这一系列趣味横生却发人深省的经典心理学实验，卡尼曼教授无情地揭示了我们在看似做出理性、科学抉择时的荒谬一面。我们会发现，无论是经验丰富的专业法官、身经百战的华尔街投资大佬，还是普通的消费者，在面对精心设计的语言框架和思维陷阱时，都常常会沦为直觉偏见的战利品。理解这些偏见，是重塑理性的第一步。</p>\r\n');
INSERT INTO `chaptertushushikan` VALUES (17, '2026-05-12 11:20:00', 4, 3, '第三章 过度自信', '\r\n<p>人类往往存在一种根深蒂固的心理倾向：对自己的能力、知识和未来发展的准确性存在盲目的过度自信。我们总是习惯于将成功归功于自己的英明，将失败归咎于坏运气，并乐此不遣地通过‘事后诸葛亮’的方式在脑海中重构历史。这种乐观的错觉在商业投资、政治决策和日常管理中会导致颠覆性的决策失误。</p>\r\n<p>过度自信的核心催化剂之一是所谓的‘叙事谬误’。我们的大脑有一种强烈的本能，喜欢将过去的各种碎片化事件拼凑成一个逻辑丝滑、因果明确的完整故事。当我们看到一家创业公司成功上市，我们就会自动忽略掉其中的运气、时代红利和无数个偶然因素，转而建立一个‘创始人高瞻远瞩、执行力无敌’的完美因果叙事，进而产生了一种‘未来也是可以轻易预测’的严重幻觉。</p>\r\n<p>这种错觉在专家学者和专业分析师身上表现得尤为明显。研究表明，许多频繁接受媒体采访的行业专家，他们对未来一两年经济或政治局势的预测准确率，往往并不比一只随意扔飞镖的猴子高多少。因为世界是一个复杂的非线性系统，但我们过度自信的系统1却总是固执地用线性眼光、用一两句简单的口号去裁剪它，并对自己的判断深信不疑。</p>\r\n<p>本章将深刻剖析过度自信的产生机理，并提供几种有效的工程学管理工具。比如在重大项目启动前引入‘事前验尸（Pre-mortem）’流程——即刻意假设项目在一年后已经彻底失败，让所有团队成员反向寻找可能导致失败的隐患。教读者如何在重大项目中识别并克服这种认知陷阱，建立起健全的信息过滤器。</p>\r\n');
INSERT INTO `chaptertushushikan` VALUES (18, '2026-05-12 11:25:00', 4, 4, '第四章 选择与风险', '\r\n<p>传统的经济学假设人都是绝对理性的‘经济人’，但在面对风险和不确定性选择时，人类的表现完全不同。丹尼尔·卡尼曼通过其获得诺贝尔奖的‘前景理论’揭示了一个颠覆性的规律：人们对损失的痛苦感受远远大于对同等收益的快乐感受。失去 100 块钱带来的痛苦感受，往往需要赚到 200 块钱的快乐才能勉强弥补。</p>\r\n<p>这种对损失的天然厌恶，导致我们在面临不同框架的抉择时，会表现出完全不同的风险偏好。当面对确定的收益时，我们倾向于见好就收、规避风险；而当面对必然的损失时，我们却会变成疯狂的赌徒，宁愿冒着更大的风险去博一个全身而退的机会。这种行为在传统理性经济学看来完全是不可理喻的。</p>\r\n<p>这种心理机制在股市投资、商业谈判乃至日常消费中被广泛利用。例如，当散户在股市里遭遇亏损时，他们往往不愿意‘割肉止损’，而是选择死扛甚至不断加仓，本质上就是系统1在抗拒损失的痛苦，宁愿冒着爆仓的风险去赌一个回本的可能；而一旦手里的股票稍微赚了一点点，他们又会因为害怕失去这点收益而迫不及待地抛出。</p>\r\n<p>本章将系统拆解前景理论的数学模型与心理学实验。你将看到那些看似客观的风险评估报告是如何通过语言技巧来左右高层的决断的。只有看清了这一层心理学外衣，理解了框架效应（Framing Effect）对决策的扭曲，我们才能在财富博弈和日常生活中保持真正的冷静和清醒。</p>\r\n');
INSERT INTO `chaptertushushikan` VALUES (19, '2026-05-12 11:30:00', 4, 5, '第五章 两个自我', '\r\n<p>我们每个人体内都共存着两个不同视角的自我：‘体验自我’和‘记忆自我’。体验自我回答‘现在疼不疼、快不快乐’，它活在当下，记录生命中的每一个真实的瞬间；而记忆自我回答‘这次旅行整体感觉如何’，它倾向于通过‘峰终定律’（只记最深刻的节点和结尾）来重构故事，甚至会为了追求完美的记忆而选择忍受不必要的痛苦。</p>\r\n<p>令人吃惊的是，掌握我们最终决策大权的，通常是记忆自我。记忆自我在重构过去时，遵循着两条残酷的铁律：‘峰终定律’（Peak-End Rule）和‘时长忽略’（Duration Neglect）。也就是说，不管一段痛苦的医疗手术持续了 10 分钟还是 30 分钟，记忆自我对这段痛苦的最终评分，只取决于最疼的那一刻以及手术结束时的感受。</p>\r\n<p>这意味着，一段漫长而平淡的幸福假期，在记忆自我的评价里，可能还不如一个短暂但结尾极度惊艳的周末。很多企业在优化客户体验时，往往犯了平均主义的错误，把大量的资金平摊到每一个日常环节，结果却反响平平；而真正高明的商业设计则懂得集中火力打造一两个‘尖叫时刻（峰值）’和完美的退场体验（终值）。</p>\r\n<p>本章将深入解构这两个自我的冲突与妥协。你将学会如何通过心理学技术去操纵和优化他人的体验记忆，更重要的是，学会如何去关怀和安抚你内心中那个活在当下的体验自我，在追求完美的生命记忆的同时，不要剥夺了此时此刻最真实的平静与快乐。</p>\r\n');
INSERT INTO `chaptertushushikan` VALUES (20, '2026-05-12 12:35:00', 5, 1, '第一章 万历皇帝', '\r\n<p>明神宗万历皇帝朱翊钧在位四十八年，是明朝历史上在位时间最长的皇帝。在世人眼中，这是一个看似国库充盈、文治武功达于极盛的繁荣时代。然而，在这个庞大帝国的权力中枢，年轻的皇帝却感到了一种无法挣脱的窒息感。他的一举一动都被沉重古老的儒家礼法、文官集团的道德说教紧紧束缚。</p>\r\n<p>在执政的前十年，他在一代首辅张居正的严厉教导和太监冯保的监视下，励精图治，每天起早贪黑地批阅奏折、举行经筵，扮演着一个完美符合儒家圣贤标准的少年天子。他本以为自己的勤勉能换来帝国的革新和大臣们的由衷拥戴，但随着年龄的增长和张居正的突然去世，万历逐渐看清了这套庞大官僚体制的虚伪本质。</p>\r\n<p>他震惊地发现，那些满嘴仁义道德、天天在奏折里引经据典教导他要克己复礼的文官们，私底下却结党营私、争权夺利，为了各自的家族利益不择手段。他们用近乎严苛的礼法道德限制皇帝的一举一动，连皇帝想册立自己心爱的皇长子为太子都会遭到全天下文官的集体唾骂和疯狂抵制，而他们自己对体制内的贪腐和无能却百般包庇。</p>\r\n<p>这种巨大的幻灭感让年轻的皇帝感到了一种无法挣脱的窒息与绝望。他意识到自己不过是这个庞大帝国机器上的一枚精致玩偶，没有任何真正的自由可言。既然无法通过制度去改变这个虚伪的集体，万历皇帝开始用‘消极罢工’的方式进行长达数十年决绝的对抗：不见大臣、不批奏折、不上朝，大明帝国开始在沉闷中缓缓滑向衰亡的深渊。</p>\r\n');
INSERT INTO `chaptertushushikan` VALUES (21, '2026-05-12 12:40:00', 5, 2, '第二章 申时行', '\r\n<p>接替张居正成为内阁首辅的申时行，是一个极其温和、老练的政治调和者。他深刻吸取了前任张居正因锋芒太露、手段过激而导致死后不久便遭遇惨烈抄家撤职的政治悲剧。他深知，大明帝国的文官集团是以双重道德标准和庞大的关系网维持运行的，如果一味采取刚猛、铁血的铁腕改革，必然会遭到整个官僚体制的疯狂反噬。</p>\r\n<p>申时行的政治哲学是‘和衷共济’，通俗来说就是高超的‘和稀泥’艺术。他从不正面触碰文官集团的根本利益，也从不用严苛的法律去逼迫官员，而是用极尽温和、圆滑的手腕在固执怨恨的万历皇帝和成见极深的言官文臣之间寻找一种微妙的平衡。他像一个高超的缝补匠，努力缝补着皇权与相权、理想与现实之间的巨大裂痕。</p>\r\n<p>在申时行看来，大明帝国的底层逻辑不是靠行政效率或者严密的法治来维持的，而是靠表面上的一致道德口号和私底下的利益妥协。如果把这层虚伪的窗户纸彻底捅破，整个国家机器就会陷入瘫痪。因此，他宁可牺牲掉一部分财政和军事上的进取心，也要换取朝廷表面上的体面、和平与稳定。</p>\r\n<p>然而，在这样一个用虚伪道德代替严密法律的帝国结构里，他的妥协与调和终究难以从根本上挽救帝国的危机。由于缺乏真正的制度改良，朝廷内部的结党营私、推诿扯皮之风反而愈演愈烈。申时行耗尽了自己一生的聪明才智，最终也只能在复杂的政治内耗中交出一份充满遗憾的无奈答卷，黯然退场。</p>\r\n');
INSERT INTO `chaptertushushikan` VALUES (22, '2026-05-12 12:45:00', 5, 3, '第三章 张居正', '\r\n<p>张居正是大明帝国历史上罕见的、最具魄力和决断力的卓越改革家。在万历皇帝年幼时，他独揽大权，推行‘一条鞭法’和‘考成法’，以雷霆万钧之势整顿吏治、清丈土地、充实国库，生生为气数将尽、摇摇欲坠的明明朝续命数十年。他是那个时代唯一真正具有行政执行力和宏大战略眼光的巨擘。</p>\r\n<p>然而，张居正的伟大与他的悲剧同样根源于他对效率的极端追求。为了打破官僚体制的推诿和拖延，他利用‘考成法’给各级官员套上了沉重的KPI枷锁，不合格者直接罢官。这种铁血手腕虽然让帝国的行政效率在短时间内达到了巅峰，却也彻底践踏了文官集团公认的‘尊尊贤贤’的制衡传统，将自己推到了所有读书人的对立面。</p>\r\n<p>更致命的是，张居正的改革重在‘法治’、技术改良与效率提升，却无法触动、甚至在表面上还要去迎合帝国以儒家道德伦理为核心的底层虚伪结构。他在朝堂上要求小皇帝克己奉公、节俭爱民，私底下自己却坐着三十二人抬的豪华大轿，生活奢靡、培植亲信。这种言行不一的道德污点，成了文官集团在他死后进行疯狂政治报复的最致命武器。</p>\r\n<p>他前脚刚刚带着‘功盖天下’的荣耀离世，后脚他曾经悉心栽培的万历皇帝和满朝文官便联起手来，对他展开了惨烈的清算。张府被抄家，子孙流放饿死，他苦心孤诣推行了十年的新政也在顷刻间被废除大半。张居正的悲剧深刻地证明了，在一个拒绝法治、以道德作为最高统治工具的古老帝国里，任何超越时代的理智改革者都注定难逃粉身碎骨的宿命。</p>\r\n');
INSERT INTO `chaptertushushikan` VALUES (23, '2026-05-12 12:50:00', 5, 4, '第四章 海瑞', '<p>海瑞是明代官场上一个绝对的异类，一个将古老儒家道德理想推向极致的纯粹理想主义者。他清廉到令人发指的程度，日常只吃粗茶淡饭，为了给母亲过生日才破例买了两斤肉；他买好棺材、告别妻子，抬着棺材上疏痛骂嘉靖皇帝；他严格按照大明律和圣贤教条去审判案件，规范官员行为，成了百姓眼中的‘海青天’。</p><p>然而，在黄仁宇先生的宏大历史视角下，海瑞的出现不仅不是帝国的救星，反而成了体制走向僵死的一个尴尬符号。海瑞坚守的那些绝对化、教条化的道德原则，在商品经济已经开始萌芽、人事关系极其错综复杂的现实政治中，显得如此格格不入。他试图用西周时期的简朴道德去管理一个处于 16 世纪的庞大帝国，这本身就是一种历史的倒退。</p><p>在担任应天巡抚期间，海瑞为了保护贫民，强制要求当地的乡绅地主退还侵占的土地。这种缺乏法律依据、纯粹依赖道德热情的过激行政，直接导致了当地金融资本的断裂和商业的全面萧条，连贫民也因为失去雇佣机会而陷入了更深的绝望。文官集团虽然在口头上将他奉为道德模范，但在实际任用上却避之唯恐不及，将他高高挂起。</p><p>海瑞的一生处处碰壁、无所建树，最终在孤独和贫困中死去。他的命运成了一面讽刺的镜子，无情地照出了明朝政治体制的虚伪与死局：当一个社会只能依靠海瑞这样的‘道德圣人’才能勉强维持正义、而整个官僚系统又无法容忍这样一个圣人真正参与管理时，这个帝国的底层结构就已经彻底坏死，无药可救了。</p>');
INSERT INTO `chaptertushushikan` VALUES (24, '2026-05-12 12:55:00', 6, 1, '第一章 我们的宇宙图像', '\r\n<p>从古代亚里士多德的地心说、托勒密的本轮理论，到哥白尼冒着生命危险提出的日心说，再到现代借助哈勃望远镜构建的千亿个星系的大爆炸模型，人类探索未知宇宙的目光经历了一场漫长、惊心动魄且不断颠覆自我的曲折过程。我们是谁？我们从哪里来？宇宙是否有边界？</p>\r\n<p>在人类文明的早期，这些宏大的哲学拷问都是神学家和巫师们的专属领地。人们习惯于用神话故事和不可知论来掩盖对头顶那片漆黑夜空的天然恐惧。大自然的一场雷暴、一颗流星的划过，都会被解读为神灵反复无常的愤怒或神谕。直到近代物理学的诞生，科学才开始真正将宇宙的解释权从神灵手中夺回。</p>\r\n<p>从伽利略制作的第一台简陋望远镜，到牛顿用万有引力定律完美统一了天上繁星和地上苹果的运动轨迹，人类第一次震撼地发现，原来这个浩瀚无垠的宇宙并不是混乱无序的，而是一台遵循着严密、优美、放之四海而皆准的数学公式精准运行的巨型机器。这种世界观的根本性转变，彻底拉开了现代科学文明的宏伟序幕。</p>\r\n<p>本章将作为全书的宏伟前言，带你梳理人类思想史上的宇宙图像变迁。你将清晰地看到，科学是如何一步步打破宗教审判和日常直觉的藩篱，用严密的观测数据和物理学语言，去重新描绘我们头顶那片璀璨星空的辽阔本质，将人类的目光从狭小的地球引向无穷的星辰大海。</p>\r\n');
INSERT INTO `chaptertushushikan` VALUES (25, '2026-05-12 13:00:00', 6, 2, '第二章 空间和时间', '\r\n<p>爱因斯坦在20世纪初提出的伟大相对论，彻底摧毁了牛顿建立的、统治了人类科学界数百年的‘绝对时空观’。在古典物理学中，空间和时间被视为一个孤立、僵死、一成不变的宏大背景舞台，无论舞台上的物质如何运动，时钟都在以永恒不变的速度滴答流逝。但爱因斯坦颠覆了这一切。</p>\r\n<p>在现代物理学看来，空间和时间不再是独立的，而是相互交织、形成了具有弹性的‘四维时空 fabric（时空织物）’。更不可思议的是，这个时空织物是动态的，会受到物质和能量的强烈影响。物体的质量会使其周围的时空发生弯曲，就像一个沉重的铅球压在一张紧绷的乳胶床上一样。而时空的弯曲反过来又决定了其他天体的运动轨迹，这便是引力的本质。</p>\r\n<p>由于时空弯曲的存在，光线在经过大质量天体（如太阳）附近时也会发生明显的几何偏折，因为空间本身已经不再平坦。更让人震惊的是，时间也变得具有相对性。引力场越强的地方，时钟的走速就越慢；而在高速运动的宇宙飞船上，宇航员的时间流逝速度也会明显落后于地面。这意味着，‘绝对的现在’根本不存在，每个人都有属于自己的相对时间。</p>\r\n<p>这种超越日常经验的物理现象，如今绝非仅仅停留在科幻小说和理论物理学家的黑板上，它已经在我们日常使用的GPS导航卫星和智能手机定位系统中得到了精确的工程应用——如果卫星不对相对论带来的时间偏差进行每秒纳秒级的修正，导航系统在一天之内就会产生数公里的巨大误差。本章将带你彻底颠覆常识，领略这个奇妙的相对论时空。 </p>\r\n');
INSERT INTO `chaptertushushikan` VALUES (26, '2026-05-12 13:05:00', 6, 3, '第三章 膨胀的宇宙', '\r\n<p>当著名天文学家爱德温·哈勃在20世纪20年代通过威尔逊山望远镜观测深空时，他发现了一个足以让整个人类科学界被彻底震撼的惊天秘密：绝大多数遥远星系发出的光谱都存在‘红移’现象。根据多普勒效应，这意味着所有的星系都在以不可思议的速度疯狂远离我们，并且距离我们越远的星系，逃逸的速度就越快。</p>\r\n<p>这一具有里程碑意义的重大发现直接颠覆了包括爱因斯坦在内的所有顶尖科学家的传统成见。在此之前，无论是宗教还是科学，人们总默认宇宙在整体上应该是恒定、永恒且静止不动的。爱因斯坦甚至为了让自己的广义相对论方程符合静态宇宙的模型，违心地在公式中塞进了一个多余的‘宇宙常数’。哈勃的观测结果像一把重锤，彻底砸碎了静态宇宙观的幻觉。</p>\r\n<p>既然宇宙并不是静止的，而是像一个巨大的气球一样在各个方向上不断膨胀，那么如果我们顺着时间轴将历史画面向后倒流，就会得出一个极其震撼的逻辑结论：在过去某一个遥远的时刻，所有的星系、物质、空间和能量必然紧紧地聚集在一起。那个体积无限小、密度无限大、时空曲率无限高的状态，被称为‘奇点’。</p>\r\n<p>那便是大爆炸（Big Bang）的起点，也是我们这个宇宙一切时间和空间的源头。本章将为你揭示这段波澜壮阔的宇宙演化史诗。你将跟随科学家的足迹，看到宇宙是如何从大爆炸的一声啼鸣中诞生，并在随后短短几分钟的暴涨和冷却中，逐渐形成了今天构成星系、恒星乃至你我身体的基本粒子的雏形。</p>\r\n');
INSERT INTO `chaptertushushikan` VALUES (27, '2026-05-12 13:10:00', 6, 4, '第四章 黑洞', '\r\n<p>黑洞是整个宇宙中最极端、最神秘、甚至让人感到一丝恐惧的天体。在爱因斯坦的广义相对论预言中，当一颗质量足够巨大的恒星走向生命的终点、耗尽了其内部用于对抗引力的所有核燃料后，其自身庞大到无法想象的万有引力将无可避免地压倒一切排斥力，导致恒星发生无可挽回的向内大坍缩。</p>\r\n<p>随着恒星体积的疯狂缩小，其表面的引力会变得越来越恐怖。当它的体积缩小到一个临界半径（即所谓的‘史瓦西半径’）以内时，其表面的引力将变得无限强大，它彻底扭曲了周围的所有时空结构，形成了一个连宇宙中速度最快的光（每秒 30 万公里）都无法逃逸的封闭区域。这个区域的边界，被称为‘事件视界（Event Horizon）’。</p>\r\n<p>任何物质一旦跨越了事件视界这道宇宙红线，就等于踏上了一条通往毁灭的单行道，它们会在几毫秒内被强烈的引力潮汐力撕成基本粒子，并无可抗拒地坠向黑洞的核心——密度无限大、物理定律全部失效的‘奇点’。从外部宇宙来看，黑洞就像是一个漆黑的无底深渊，不发出任何光线，吞噬一切接近它的存在。</p>\r\n<p>然而，斯蒂芬·霍金教授最伟大的成就之一，就是将微观的量子力学成功引入了黑洞的研究。他惊人地发现，黑洞并不是完全‘黑’的。由于量子真空涨落的存在，事件视界边缘会不断向外辐射粒子，这便是著名的‘霍金辐射’。这意味着黑洞在吞噬物质的同时，也在极其缓慢地向外蒸发能量，并最终在异常壮烈的爆炸中走向消亡。本章将带你逼近这道神秘的视界，探索时空的终极奥秘。</p>\r\n');
INSERT INTO `chaptertushushikan` VALUES (28, '2026-05-12 13:15:00', 6, 5, '第五章 宇宙的起源和命运', '\r\n<p>宇宙究竟从何而来？它的未来又将走向何方？是永远无限地膨胀下去，直到所有的恒星燃尽、宇宙陷入一片死寂与冰冷的‘大冻结’；还是在庞大物质引力的拉扯下最终停止膨胀，转而向内坍缩，在一场与大爆炸完全相反的‘大挤压’中宣告终结？为了回答这一人类文明的终极拷问，物理学家们正在进行着一场人类智力的最高博弈。</p>\r\n<p>目前的科学界正面临着一个巨大的理论鸿沟：解释宇宙宏观引力的广义相对论，与解释微观粒子世界的量子力学，在数学上是完全冲突、互不兼容的。而要说清楚宇宙诞生那一刻的奇异状态，就必须将这两大支柱完美结合，找到传说中物理学的圣杯——‘量子引力理论（或大统一理论）’。只有这样，我们才能看透奇点背后的真相。</p>\r\n<p>斯蒂芬·霍金教授在这一领域提出了极其震撼的‘无边界宇宙模型’。他运用虚时间（Imaginary Time）的概念，认为如果回到宇宙的极早期，时间维度会转化为另一个空间维度。这样一来，宇宙的时空就像是地球的表面一样，虽然面积是有限的，但你永远找不到它的边界或起点。宇宙不需要一个‘第一推动力’去开启，它完全是自给自足、自我创生的。</p>\r\n<p>本章将带你站在当代人类智力的最前沿，俯瞰宇宙波澜壮阔的终极命运演变。你将看到那些由复杂的数学公式、弦理论和多维空间交织出来的奇妙世界。这不仅是一场科学的冒险，更是一场关于存在、生命以及我们在浩瀚星空中微不足道却又无比伟大的精神探索。</p>\r\n');
INSERT INTO `chaptertushushikan` VALUES (29, '2026-05-12 13:20:00', 7, 1, '第一章 函数与极限', '\r\n<p>函数是整个现代高等数学分析、工程建模以及一切定量研究的最核心基础，它描述了客观现实世界中各种变量之间复杂的依赖、映射与动态对应关系。而极限理论，则是将初等数学成功跨越到高级微积分殿堂的灵魂桥梁和逻辑基石。没有严密的极限作为支撑，微积分的大厦将瞬间沦为空中楼阁。</p>\r\n<p>在初等数学里，我们习惯于处理静态、固定、有限的数字与代数式。但现实客观世界中，万物都处于永恒的运动、流转和连续变化之中。如何精确地用数学公式去描述一个‘无限趋近却又永远无法真正到达’的微妙动态趋势？这便是极限理论要解决的核心数学矛盾，也是莱布尼茨和牛顿面临的世纪难题。</p>\r\n<p>为了给微积分奠定坚不可摧的逻辑铁基，数学家们在 19 世纪终于发展出了极其严密的极限形式化定义——即让无数理工科大学生望而生畏、却又赞叹不已的经典 $varepsilon-N$（数列极限）和 $varepsilon-delta$（函数极限）语言。这种用静态的、绝对化的逻辑范围去精确锁定和定量描述动态无限趋近趋势的方法，是人类智力史上的伟大飞跃。</p>\r\n<p>本章将系统、严谨地介绍极限的定义、核心性质（如唯一性、有界性、保号性）、四则运算法则以及在后续求导中起到决定性作用的两个重要极限公式。通过丰富的几何图形与代数实例，我们将帮助读者彻底打破初等数学的思维枷锁，建立起全新的‘无限逼近’和‘连续性’的严密高等数学思维方式。</p>\r\n');
INSERT INTO `chaptertushushikan` VALUES (30, '2026-05-12 13:25:00', 7, 2, '第二章 导数与微分', '\r\n<p>导数的核心本质是为了精确描述一个变量相对于另一个变量的瞬时变化率，它是微分学中应用最具威力、最为广泛的数学工具。当我们说一辆高速行驶的赛车在某一秒的瞬时速度是多少、或者某支热门股票在某一时刻的下跌速率有多快、亦或是某个化学反应在某一瞬间的消耗速度时，我们本质上都在探讨导数的值。</p>\r\n<p>在几何解析几何上，导数对应着几何曲线在某一点切线的斜率。本章将详细介绍导数的了几何物理背景，并推导出求导的核心运算法则。我们将从最原始的极限定义式出发，一步步教会读者如何熟练运用四则求导法则，并重点攻克复合函数求导的‘链式法则（Chain Rule）’、隐函数求导、参数方程求导以及高阶导数的计算技术。</p>\r\n<p>与导数紧密相连的另一个核心概念是微分（Differential）。微分的本质在于探讨当自变量发生微小变化时，因变量随之产生的线性主要部分。这涉及到了微积分中最具哲学价值的思想——‘以直代曲’，即在极其微小的局部范围内，用简单的线性函数（切线直线）去完美逼近复杂的非线性函数（弯曲曲线）。</p>\r\n<p>这种局部线性化的思想，不仅是高数理论的核心，更是现代计算机数值计算、大数据分析以及人工智能机器学习中‘梯度下降（Gradient Descent）’算法的最底层数学逻辑。掌握了导数与微分，读者将能够轻松解决工程优化中的求极值、求最值、误差估计以及物理学中的各种瞬时量计算问题，真正获得用数学去精确操控现实世界变化的能力。</p>\r\n');
INSERT INTO `chaptertushushikan` VALUES (31, '2026-05-12 13:30:00', 7, 3, '第三章 积分学', '\r\n<p>积分学是导数与微分学的逆运算，主要包括探讨未知原函数的不定积分和求解曲边梯形面积的定积分。作为微积分的两大核心组成部分，微积分基本定理（即著名的牛顿-莱布尼茨公式）完美地将微分与积分统一了起来，实现了人类数学史上的伟大飞跃，也让连续变量的累加计算有了极其锋利的武器。</p>\r\n<p>在工程计算和物理模型中，我们经常会遇到求不规则图形的面积、变速运动的总位移、或者密度非均匀物体的总质量等问题。初等数学对这些非均匀变化的问题无能为力，而积分学则采用‘无限细分、求和、取极限’的核心思想，将复杂的不规则问题转化为可控的数学模型。这是从局部微观分析走向宏观总量统计的关键一步。</p>\r\n<p>为了让读者能够熟练驾驭这一强大的数学工具，本章将重点传授高超的积分技巧与计算公式。我们将深入解构换元积分法（包括第一类和第二类换元法）的代换机理、分部积分法的核心公式，以及有理函数、三角函数有理式的不定积分求解步骤。掌握这些积分公式，就像是掌握了破解连续多变世界的通关密钥。</p>\r\n<p>此外，本章还将引入定积分的几何应用与物理应用。通过求变力做功、旋转体体积、曲线弧长、引力以及水压力等丰富的实际工程案例，读者将深刻体会到积分在解决现实连续累加问题上的强大威力，彻底搞懂微积分是如何在现代工程学、力学以及经济学中发挥核心支柱作用的。</p>\r\n');
INSERT INTO `chaptertushushikan` VALUES (32, '2026-05-12 13:35:00', 7, 4, '第四章 多元函数微积分', '\r\n<p>在一维的数轴和单变量的现实生活之外，三维空间乃至更高维度的多变量模型，才是现实工程、物理世界、气象预报和经济学中最常见的数学形态。比如，一个山峰在不同经纬度上的高度、一个热力学系统在不同坐标下的温度、或者是某个产品的利润受到原材料、人工和物流等多种因素的共同制约。这便需要多元函数微积分的登场。</p>\r\n<p>本章将把一元微积分的精髓成功推广到多维向量空间领域。我们将首先研究多元函数的极限、重极限与连续性概念，讲解偏导数（Partial Derivative）与全微分（Total Differential）的核心定义，帮助读者搞清楚当多个自变量同时发生微小变动时，因变量的整体响应机制。这是进行高级多维空间几何推导的理论基石。</p>\r\n<p>在此基础上，章节的重心将转向多维最优化问题的求解。我们将重点阐述如何利用多元函数的极值判定定理，特别是如何运用拉格朗日乘数法（Lagrange Multiplier Method）去求解复杂的条件极值问题。这一方法在现代机器学习的约束优化（如支持向量机SVM的推导）和数理经济学的资源最优配置中，有着极其广泛的实战应用。</p>\r\n<p>随后，章节还将引入重积分（二重积分、三重积分）的计算技术，教授读者如何在直角坐标系、极坐标系以及球面坐标系下进行复杂的空间积分变换。最后，我们将重点讲解曲线积分与曲面积分，并引出格林公式、高斯公式和斯托克斯公式三大向量分析核心定理，为读者构建起在多维空间中进行严密数学建模与流体拓扑计算的完整知识框架。</p>\r\n');
INSERT INTO `chaptertushushikan` VALUES (33, '2026-05-12 13:40:00', 8, 1, '第一章 什么是设计', '\r\n<p>设计绝不不仅仅是停留在产品表面上的美化修饰、炫目的色彩搭配、或者盲目堆砌华丽的视觉特效和繁琐的装饰元素。在原研哉先生的管理与设计哲学中，设计本质上是一个通过敏锐洞察生活、发现隐藏在日常中的漏洞或别扭感，并提出优雅、合理解决方案的系统性思维与沟通行为。设计的真正价值，存在于产品与人发生交互的那一瞬间。</p>\r\n<p>在琳琅满目的现代商品市场中，充斥着大量为了追求商业噱头而‘过度设计’的繁琐产物。它们有着炫目的包装和复杂冗余的功能按键，却常常让真正的使用者感到困惑、疲惫和挫败。这种喧宾夺主、缺乏对人真实关怀的设计，正在变成现代都市的一种视觉与行为噪音。它不仅没有提升生活品质，反而增加了信息传达的障碍。</p>\r\n<p>一个真正优秀的设计师，不应该一味沉迷于自我表现的艺术狂欢，而应该像一个冷静、克制的社会观察家。他应当能够在一成不变的无聊日常生活中，捕捉到人们那些微小的、甚至连用户自己都说不清楚的日常行为习惯。然后，通过对产品的物理结构、材质纹理或者操作流程进行最细腻的微调，将这种别扭感无声无息地化解掉。</p>\r\n<p>在本章中，原研哉先生将带你彻底跳出传统的‘商业美工’和‘纯粹造型’的思维泥潭，重新审视设计的起源、本质和它在人类文明与现代社会文化中所扮演的精神角色。我们要做的，不是去制造虚无缥缈的奢华来刺激物欲，而是去理清混乱，重塑日常生活中那些最平凡物件的最本真、最舒适的使用体验。让设计回归生活本身。</p>\r\n');
INSERT INTO `chaptertushushikan` VALUES (34, '2026-05-12 13:45:00', 8, 2, '第二章 白与空', '\r\n<p>在日本传统美学和现代高级设计哲学中，‘白’绝对不是一种单纯的视觉颜色，而是一种极其深邃、充满了包容力与张力的精神状态；‘空’也绝不是虚无、死板和简陋，而是一种为了等待内容填满、为了容纳他人情感而故意留出的、极具禅意的无限可能性。它是东方美学对抗西方‘实体填满’理念的核心武器。</p>\r\n<p>当一张广告海报或一个数字界面上塞满了密密麻麻的文字卖点、高饱和度的渐变特效和五花八门的图标时，它其实是在强迫用户的眼球去接受信息，反而让人产生生理和心理上的双重排斥。而无印良品（MUJI）的经典视觉设计则恰恰相反，它往往只留下大片的空白，以及一条极其简单的地平线。这种‘空’不代表无话可说，而是给消费者的想象力留出了安放的容器。</p>\r\n<p>原研哉先生通过对传统纸张的触感选择、无印良品历年海报的构图、以及传统日式建筑中木质推拉门格调的细腻剖析，深刻阐述了设计师应当如何通过‘极度克制’和‘有意留白’的手法，去对抗现代社会泛滥的信息噪音。这种极简美学并不是粗制滥造的偷懒，它反而需要设计师对材质、光影和空间比例拥有炉火纯青的掌控力。</p>\r\n<p>本章将带你领略这种剥离累赘、直击事物最核心本质的最高级艺术表达。你将彻底学到，如何用最少的设计语言去传达最丰富、最隽永的信息意境。让你的作品在一片喧嚣、花哨的网页和移动端界面设计中脱颖而出，展现出一种高雅、沉静且经得起时间考验的独特高级质感。</p>\r\n');
INSERT INTO `chaptertushushikan` VALUES (35, '2026-05-12 13:50:00', 8, 3, '第三章 感觉的唤醒', '\r\n<p>在这个高度依赖数字屏幕、触控玻璃和虚拟社交的冷冰冰的全面数字化时代，人类对于物理世界真实的触觉、嗅觉、甚至空间包裹感的分辨能力，正在面临着日渐退化和钝化的危机。我们每天摸着同样的钢化玻璃屏幕，看着同样的像素色块，感官在不知不觉中变得麻木。而这，恰恰是现代设计的全新切入点。</p>\r\n<p>一个真正优秀的、具有生命温度的设计，绝不应该只满足于视觉上的冲击，它应当像一把温柔的钥匙，重新唤醒人们尘封、退化的全感官细胞。让人在触摸到粗糙而温暖的特种纸张、握住曲线完美的陶瓷杯柄、或者拧开带有细腻阻尼感的木质瓶盖时，在指尖与指关节的细微颤动中，重新发现日常生活中被严重忽视的美好与惊喜。</p>\r\n<p>本章将结合原研哉先生主持的著名的‘RE-DESIGN（再设计：二十一世纪的日常用品）’经典展览案例。在展览中，他邀请了建筑师、时装设计师等跨界大师，重新去设计纸建筑、卫生纸、甚至火柴等最普通的日常物件。通过改变卫生纸轴心的几何形状（从圆形改为正方形），不仅减少了滚动时的噪音，更无声地提醒了使用者要节约用纸。</p>\r\n<p>这便是‘感觉的唤醒’的核心魔力。本章将深入探讨设计师应当如何调动和协调人类的触觉、听觉、记忆与视觉的多感官交互，创造出超越扁平屏幕、直达人类潜意识和灵魂深处的细腻通感设计。通过学习这些高级的设计手法，你的前端系统和产品交互，将不再只是冷冰冰的功能堆砌，而是充满人性的情感桥梁。</p>\r\n');
INSERT INTO `chaptertushushikan` VALUES (36, '2026-05-12 13:55:00', 8, 4, '第四章 设计的未来', '\r\n<p>在人工智能、物联网、大数据以及虚拟现实汹涌而来的全新数字化浪潮中，设计的传统边界正在被无限拓宽，传统的媒介也正面临着前所未有的巨大颠覆。设计师的职责，不再只是设计一个具体的、具有物理形态的杯子或一把椅子，而是转变为设计一种服务形态、一种人机协作关系、或者是一种环境友好的可持续生活方式。</p>\r\n<p>面对全球气候变暖、资源短缺、社会老龄化等宏大的世纪难题，未来的设计必须要承担起更多的社会责任。我们不能再一味地为了刺激消费而去制造那些寿命短暂的塑料电子垃圾，而应当通过‘再思考’和‘技术减法’，去寻找科技与自然生态、人类精神渴望之间的优雅平衡点。设计的未来，在于从制造欲望转向清理欲望。</p>\r\n<p>在数字界面设计（UID）和用户体验设计（UXD）领域，未来的趋势也正在从一味追求高效、快捷，转向追求‘适度’与‘谦逊’。一个高级的未来系统界面，应当是无形且智能的。它能够根据使用者的情绪、年龄和环境光线自发地调整其可见度与交互密度，在不需要它时彻底隐退到大背景之中，给用户留出绝对专注的思考空间。</p>\r\n<p>本章将站在时代的最前沿，探讨设计在未来智能化社会中的全面演变趋势。原研哉先生将向你证明，无论底层的技术架构如何高频更迭，设计的初心将永远不会熄灭——那就是用对人类个体生存状态的极致关怀与尊重，让科技变得更加谦逊、让生活回归从容的诗意。这是每一个现代开发者和设计师都应指引的终极方向。</p>\r\n');
INSERT INTO `chaptertushushikan` VALUES (37, '2026-05-12 14:00:00', 9, 1, '第一章 断舍离的理念', '\r\n<p>断舍离绝对不是一种简单的、流于表面形式的家务整理技巧、或者盲目的物品扔弃指南，它本质上是一套通过有意识地梳理和精简自己身边的物理物品、进而彻底整理内心纷乱杂念与情绪淤积的最高级生活哲学。断：从源头上断绝不需要、不合适、不舒服的东西进入自己的生活空间；舍：舍弃掉家里那些长期闲置、除了占地方别无用处的废物堆积；离：脱离对物质的过度执念、摆脱物欲对心灵的无形捆绑。</p>\r\n<p>在物质和信息极度充裕、甚至严重泛滥的今天，我们的房间在不知不觉中被各种打折促销买来的衣物、过期的化妆品赠品、以及‘以后可能用得着’的闲置物件塞满。我们的桌面变得凌乱，抽屉无法关上，随之而来的，是内心深处无处不在的焦虑、拖延、烦躁和对生活的失控感。这些堆积如山的物件在无形中成了我们精神的枷锁，吸干了我们的能量。</p>\r\n<p>断舍离提倡我们将生活的轴心从‘物品’彻底交还给‘自己’。每一次在房间里面对一件器物时，我们不应该去思考‘这件东西还能不能用’，而应当高频、严肃地叩问自己：‘此时此刻的我，真的需要这件东西吗？它真的能让我感到快乐和合适吗？’通过这种日复一日的练习，我们能逐渐拨开物欲的迷雾，看清自己内心深处的真正渴望与当下的真实状态。</p>\r\n<p>本章将为你层层揭开断舍离的底层心理学机制与行为规范，带你彻底改变与物理世界物品的相处模式。你将学会如何通过对空间的掌控，去重新获取对人生的掌控权。迈向一个清爽、自主、专注且轻装上阵的全新人生阶段，体会到把沉重的肉身与物欲包袱果断卸下后，内心深处久违的、排山倒海般的巨大自由与轻松感。</p>\r\n');
INSERT INTO `chaptertushushikan` VALUES (38, '2026-05-12 14:05:00', 9, 2, '第二章 从加法到减法', '\r\n<p>现代资本主义和消费主义社会在无孔不入地崇尚‘加法’，各大电商平台的算法、精准的无死角广告营销、层出不穷的精致包装，都在试图用物质去填满我们的虚荣心与不安全感。我们总以为拥有的越多就会越幸福，于是不停地往家里搬东西，结果却陷入了屋子越来越挤、钱包越来越瘪、而心灵却越来越空虚和焦虑的恶性因果循环之中。</p>\r\n<p>然而，断舍离则是一门教我们做‘减法’的独特智慧艺术。在这样一个信息、物质和欲望全部泛滥甚至超载的速食时代，懂得‘如何拒绝’和‘如何放弃’，比懂得‘如何获取’需要更大的人生智慧、定力与勇气。减少不必要的累赘，你才能看清留在生命里真正珍贵的是什么。只有当繁杂的杂音和杂物逐渐退去时，生活的品质才会真正凸显出来。</p>\r\n<p>当你把那些一年都用不上一次的旧衣物、那些代表着过去错误决策或虚荣心爆发的物件果断清除后，你的生活空间会重新开始顺畅流动。阳光、微风、专注力以及极简美学带来的视觉舒适感会重新填满你的房间。你会惊奇地发现，精简物品后的日子不仅没有变得匮乏，反而因为摆脱了物品的挑选和维护成本，变得前所未有的丰富、轻松和高效。</p>\r\n<p>本章将结合大量的实际咨询案例，深刻解构现代消费主义是如何精准利用人类的贪婪、盲从和对未来不可知的恐惧心理，来操纵和奴役我们的大脑的。学会做减法，是你在现代都市生活中保持独立思考、守护内心富足与平静的必修课。这不仅是空间的精简，更是灵魂的深度净化。 </p>\r\n');
INSERT INTO `chaptertushushikan` VALUES (39, '2026-05-12 14:10:00', 9, 3, '第三章 实践断舍离', '\r\n<p>断舍离绝不是盲目地提倡苦行僧式的一无所有，它不要求你把所有的东西扔得一干二净，它的核心在于重新建立人与物品的健康关系。在具体的落地实践中，断舍离有着极其严密、科学的操作规范。我们要学会克服‘扔了可惜’的过度内疚心理，以及‘万一以后用到呢’的对未来的无端焦虑。本章将手把手教你一套极具可操作性的实战技巧。</p>\r\n<p>具体的行动应当遵循由浅入深、从小到大的空间推进原则。不要试图在一个周末就把整栋房子清理干净，那只会让你陷入体力虚脱和心理上的巨大抵触。正确的做法是，从清理一个钱包、一个书桌抽屉、或者是衣柜的一个小角落开始。在这个封闭的小空间里，把所有的物品全部拿出来平铺在地上，进行一次彻底的‘总选举’。</p>\r\n<p>在筛选物品时，我们要严格扣住两个核心维度：‘时间轴永远是当下’，‘关系轴永远是自己’。那些‘过去很贵但现在已经不穿的礼服’、‘朋友送的但自己根本不喜欢的摆件’，它们的时间轴在过去，或者人际关系轴在他人，都不属于现在的自己。对于这些物件，我们要学会用感恩的心态向它们道别：‘谢谢你曾带给我的快乐，再见。’然后果断地赠送或抛弃。</p>\r\n<p>通过这种不断重复的‘分类、审视、决断、感恩舍弃’的物理练习，你不仅能亲手打造出一个充满阳光、空气对流、具备无印良品般视觉流动感的清爽居住气场，更重要的是，你的大脑决断能力、逻辑分类思维以及面对断舍离时的心理抗压能力，也会在无形中得到极大的工程学训练。让整理成为你治愈内心焦虑的最有效行为疗法。</p>\r\n');
INSERT INTO `chaptertushushikan` VALUES (40, '2026-05-12 14:15:00', 9, 4, '第四章 断舍离的人生', '\r\n<p>当身边的冗余物品逐渐减少、生活空间变得通透舒适之后，你会惊奇地发现，自己的思维方式、情绪管理乃至人际关系也在发生着翻天覆地的神奇变化。你开始懂得拒绝那些无意义的无效社交，开始清晰地洞察自己内心深处的真正渴望，彻底摆脱了过去执念的束缚以及对未来的无端恐惧。断舍离的终极指向，从来不是屋子的整洁，而是心灵的绝对自由。</p>\r\n<p>这种心理上的蜕变在商业上被称为‘焦点效应’的重构。当环境中没有了杂物的干扰，你的大脑注意力和系统2的运作效率会得到成倍的提升。你在面对人生的重大分叉路口——比如更换工作、结束一段不健康的恋爱关系、或者是开启一项全新的创意系统项目时，你将不再拖泥带水，而是能像精简空间一样，展现出干脆利落、毫不妥协的惊人决断力。</p>\r\n<p>同时，你的消费观念也会发生根本性的品质跃迁。你不再会被各种花哨的促销套路所绑架，不再会为了填补空虚而盲目‘买买买’。你开始倾向于购买那些材质上乘、设计经典、能够长久陪伴你并滋养你精神的高品质器物。你的生活开始从‘数量的堆砌’走向‘质量的极致淬炼’。你所拥有的每一件东西，都是你的挚爱，它们在空间里共同呼吸，彰显着你的独立人格。</p>\r\n<p>断舍离最终指向的是心灵的绝对自由与笃定。它让我们学会在这个纷繁复杂、变化莫测的大千世界里，始终保持一份内心的清醒、一份生活的优雅与一份不随波逐流的坚实幸福感。当外界的风暴来临时，你的房间是你坚不可摧的理智避风港；当生活的压力涌来时，你的极简人生是你最强大的防线。愿你在这场做减法的旅途中，找回最纯粹的自己。</p>\r\n');
INSERT INTO `chaptertushushikan` VALUES (41, '2026-05-12 14:20:00', 10, 1, '第一章 我画的蟒蛇', '\r\n<p>当我还只有六岁的时候，在一本描写原始森林的书中看到了一幅精彩绝伦的插画。画的是一条巨大的蟒蛇正在吞食一只大野兽。书上写着：‘蟒蛇把它们的猎物不加咀嚼地整个吞下。然后，它们就再也无法动弹了，需要长达六个月的时间躺着睡觉来消化食物。’这幅惊心动魄的画面深深地震撼了我的童年心灵，激发了我对未知大自然和原始森林的无限神往。</p>\r\n<p>于是，在经过一番苦思冥想和反复尝试后，我也用彩色铅笔成功画出了我的第一号作品：那是一张看起来像是一顶棕色帽子的画。我兴高采烈、满怀期待地把这张凝聚了我全部想象力的杰作拿给那些自诩聪明的大人们看，并有些骄傲地问他们，我的画有没有带给他们某种发自内心的恐惧。可他们看了一眼，却轻描淡写地回答说：‘一顶帽子有什么好可怕的？’</p>\r\n<p>大人们的回答让我感到无比的沮丧与失望。他们那死板、贫瘠的眼光永远都看不懂这其实根本不是什么帽子，而是一条正在肚子里消化大象的巨型蟒蛇！为了能让他们看懂，我不得不违心地画了第二号作品，耐心地把蟒蛇肚子里的内部构造清清楚楚地画了出来，好让那些缺乏想象力的大人们一目了然。因为大人们总是这样，他们自己永远弄不懂任何事情，却总是需要小孩子无休止地去给他们做解释，这真叫人疲惫。</p>\r\n<p>大人们在看完了我的第二号作品后，不仅没有赞美我的天才创意，反而冷冰冰地劝我把这些关于蟒蛇肚子开着还是闭着的无聊画作放到一边，把精力多放在地理、历史、算术和语法等‘正经’功课上。就这样，在六岁那年，我被大人们亲手扼杀了成为一个伟大画家的美好梦想。大人们那充满数字、功利与死板的功利世界，让我早早地感到了一丝无言的窒息与无奈，也让我学会了隐藏自己最纯真的那一面，戴上面具去迎合他们的世俗生活。</p>\r\n');
INSERT INTO `chaptertushushikan` VALUES (42, '2026-05-12 14:25:00', 10, 2, '第二章 遇见小王子', '\r\n<p>就这样，我带着被扼杀的画家梦想渐渐长大，学会了开飞机，飞遍了世界的各个角落。在世俗的眼光里，我成了一个成熟、正经的飞行员。但我孤零零地生活在世界上，没有一个真正能谈得来、能彻底理解我内心精神世界的朋友。直到六年前，我的飞机在荒无人烟、死寂一片的撒哈拉沙漠深处出了严重的发动机故障。在面临饮用水即将耗尽、方圆几千里没有任何人类文明痕迹的绝望绝境中，我不得不独自承担起生死边缘的紧急抢修。</p>\r\n<p>在沙漠的第一晚，我躺在远离人间烟火的无边沙丘上过夜，觉得自己比一个在浩瀚大海上遭遇海难、漂流在木筏上的水手还要孤独千万倍。然而，当黎明的第一缕微光悄然划破黑暗时，一个奇特、细弱却无比清晰的小声音突然在我的耳畔响起，把我从沉睡中惊醒。那个声音极其认真地对我说：‘请……请帮我画一只羊！’我像被雷电击中了一样，骨碌一下爬了起来，拼命地揉了揉眼睛，震惊地环顾四周。</p>\r\n<p>我看到一个穿着华丽制服、披着金色围巾、长着一头灿烂金发的小人儿，正用一种极其庄严、澄澈的目光静静地站在我面前。那便是小王子。在这远离任何人类聚落千里之外、面临死亡威胁的金色大沙漠中央，他的脸上没有任何迷路、饥渴或恐惧的痕迹。他的出现是如此神秘、荒诞，却又如此真实。在这生死攸关的时刻，我居然从口袋里掏出了一张纸和一支钢笔，决定满足这个神秘孩子的奇特要求，哪怕我只学会过画那条消化大象的蟒蛇。</p>\r\n<p>我一连画了三只羊，他都因为各种理由拒绝了：‘这只太病了’，‘这只是公羊有角’，‘这只太老了’。在我的耐性快要被发动机的维修工作耗尽时，我胡乱地在纸上画了一个带有三个气孔的木箱子，并有些敷衍地对他说：‘这是箱子，你要的羊就在里面。’令我万万没有想到的是，这个小审判官的脸上突然绽放出了无比灿烂、喜悦的笑容，他拍着手叫道：‘这正是我想要的！你说，它需要很多草吗？因为我的星球太小了……’两个孤独灵魂的宿命相遇，由此开启了一段探索生命与爱之真谛的纯真对话。</p>\r\n');
INSERT INTO `chaptertushushikan` VALUES (43, '2026-05-12 14:30:00', 10, 3, '第三章 玫瑰与狐狸', '\r\n<p>在小王子居住的、只有一栋房子那么大的 B612 小行星上，诞生了一朵美丽、骄傲、有些虚荣敏感且带刺的玫瑰。小王子悉心地为她浇水、盖上玻璃防风罩、为她捕捉毛毛虫。然而，玫瑰那略带做作的挑剔和年轻不懂得如何去爱的羞涩，让小王子感到困惑与受伤，最终，他选择利用一群候鸟迁徙的机会，告别了自己的星球，开启了漫长的星际旅行。但在地球的荒凉沙漠和庞大花园里，当他看到五千朵和自己的玫瑰一模一样的花儿时，他陷入了巨大的忧伤，觉得自己被欺骗了，原来他的花并不是宇宙中的唯一。</p>\r\n<p>就在小王子趴在草丛中痛哭的时候，一只长着火红皮毛的狐狸静静地出现在苹果树下。狐狸并没有直接谈论花朵，而是向小王子提出了一个奇特的请求：‘请驯服（Tame）我吧！’小王子不解地问什么是驯服，狐狸温柔地解释道：‘对我来说，你还只是一个小男孩，和千千万万个小男孩没有什么两样，我不需要你，你也不需要我。但如果你驯服了我，我们就会彼此需要。对我来说，你就是我的世界里的唯一；对你来说，我也就是你的世界里的唯一。’</p>\r\n<p>狐狸的智慧像一道强光，瞬间照亮了小王子迷茫的内心。狐狸对他说：‘你看到那片金色的麦田了吗？我不吃面包，麦子对我毫无用处。但因为你有一头金色的头发，一旦你驯服了我，每当我看到金色的麦麦浪，我就会想起你，我甚至会爱上风吹麦穗的声音。’在狐狸的主动请求下，小王子按部就班地每天在固定的时间走近狐狸，用时间和耐心，完成了充满神圣感的‘驯服’过程。而在离别的时刻，狐狸把一个永恒的秘密作为礼物送给了小王子：‘只有用心去看，才能看得清楚。真正重要的东西，用眼睛是看不见的。’</p>\r\n<p>这个秘密让小王子如梦初醒，彻底明白了爱的真谛。他重新跑回那个拥有五千朵玫瑰的大花园，挺起胸膛对那些花儿说：‘你们很美丽，但你们是空虚的。没有人会为你们去死。我的那朵玫瑰，虽然在旁人眼里和你们毫无区别，但她一朵花就比你们全体都重要。因为我给她浇过水，我给她盖过罩子，我倾听过她的怨言和自诩，甚至倾听过她的沉默。因为她是我的玫瑰。’狐狸用深刻的哲学教会了小王子，爱不是占有，而是彼此驯服、付出时间并勇敢承担起属于自己的那份责任。</p>\r\n');
INSERT INTO `chaptertushushikan` VALUES (44, '2026-05-12 14:35:00', 10, 4, '第四章 真正的宝藏', '\r\n<p>‘你在你的玫瑰身上花费的时间，使得你的玫瑰变得如此重要。’小王子在心中一遍遍重复着狐狸的话，好把它牢牢记在心里。这是解开人类爱、责任与精神救赎的终极密码。在地球旅程的最后阶段，小王子和我在干涸的沙漠中寻找水源。当我们在星光下疲惫不堪地并肩前行时，他看着天上的繁星，对我说：‘星星之所以美丽，是因为有一朵人们看不见的花……沙漠之所以美丽，是因为在某个角落里藏着一口水井……’他的话让我浑身一震，瞬间看清了现实世界中那些真正被我们忽视的、超越物理形态的纯真宝藏。</p>\r\n<p>在那个金色的黎明，我们终于在沙丘之间找到了一口如同梦境般完美的村庄水井。那井水绝不是普通的单纯饮用水，它诞生于星空下的漫长跋涉、诞生于辘轳的转动、诞生于我双臂的劳作，它对心灵来说，就像是一份最圣洁的礼物，充满了无上的甘甜与幸福感。小王子闭着眼睛大口大口地喝着这甘泉，长长的金色睫毛在阳光下微微颤动。我看着他，心中却涌起了一股无法抑制的巨大忧伤。因为我知道，这个属于星空的孩子，在地球上跌跌撞撞地旅行了一年之后，终于要迎来他告别的时刻了。</p>\r\n<p>小王子在一条古老的颓圮石墙旁，和一条拥有致命剧毒的金黄色毒蛇达成了神秘的契约。他要在自己降临地球一周年的那个夜晚，借助毒蛇的毒液，卸下沉重、无法带走的肉体躯壳，让灵魂彻底轻装上阵，飞回他那相隔亿万光年、拥有火山和傲慢玫瑰的 B612 小行星。他看出了我的恐惧与极度不舍，搂着我的脖子，安慰我说：‘今晚，当你望着夜空时，因为我住在其中的一颗星星上，因为我在其中的一颗星星上笑，那么对你来说，满天的星星仿佛都在对着你笑。你将拥有五亿个会笑的小铃铛……’</p>\r\n<p>那是一个没有月亮的凄凉夜晚，小王子独自一人走向了沙地。他没有哭，也没有喊，走得非常坚定。当一道金黄色的闪光在它的脚踝处一闪而过时，他像一棵树一样，没有发出任何声响地、缓缓地倒在了柔软的沙地上。第二天的黎明，我没有在沙地上找到他的躯壳，我知道，他已经成功回到了他的旅途终点。本章将在这段充满了诗意、空灵、极致忧伤却又无比温暖与治愈的终极告别中画上句号。每当我们抬起头望向夜空，那漫天的繁星，都是小王子送给我们这个喧嚣人间最珍贵的精神宝藏。</p>\r\n');
INSERT INTO `chaptertushushikan` VALUES (45, '2026-05-12 14:40:00', 11, 1, '第一章 年轻时的福贵', '\r\n<p>我比现在年轻十岁的时候，获得了一个游手好闲、极具诗意的职业，那就是去南方的乡间收集在民间广为流传的歌谣。就是在那个阳光极其刺眼、空气中充斥着滚烫麦秆香味与知了疯狂鸣叫的盛夏午后，我在一棵巨大的老槐树下，第一次遇到了牵着老牛的垂暮老人福贵。那一人一牛的苍老身影，在金黄色的麦浪大背景下，散发出一种沉重得让人窒息的历史沧桑感。而在福贵本人年轻的时候，他可绝对不是什么老实的农夫，而是城里阔绰有名、让人侧目的徐家大少爷。</p>\r\n<p>那时候的徐大少爷，整天不干任何一件正事，沉迷于龙二的豪华赌场与青楼的虚荣繁华中。他最喜欢的荒唐恶作剧，就是让一个肥胖的妓女背着他，在城里最热闹的街道上大摇大摆地横行霸道，去羞辱他做塾师的岳父。他肆无忌惮地挥霍着祖辈用血汗攒下来的百亩良田，全然不顾妻子家珍挺着大肚子、跪在赌场冰冷的地板上流干的眼泪，也全然不顾老父亲徐老爷在祠堂里绝望的叹息与拐杖的痛打。那时候的他荒唐、自私、冷酷，以为这种糜烂的少爷日子会像城里的河水一样永远没有尽头。</p>\r\n<p>在赌场那一张张充满了贪婪、铜臭与尖叫的赌桌旁，福贵享受着那种一掷千金、被众人众星捧月的虚幻快感。他沉迷于骨牌碰撞的清脆声响，每一次开牌都像是吸食鸦片一样让他浑身颤抖。他根本看不清坐在他对面的龙二那阴险、狡诈的微笑，也听不到窗外大雨中时代巨轮正滚滚碾过来的轰鸣声。他彻底沦为了欲望的奴隶，把祖上传下来的、盖有鲜红官印的房契和地契，一张接一张地扔进那个永远也填不饱的赌博无底深渊之中，亲手为自己的人生套上了绞刑架。</p>\r\n<p>余华先生在这开篇的第一章里，并没有急着用大道理去审判福贵，而是用极其细腻、甚至带着一丝黑色幽默的白描手法，将一个封建败家子的骄奢淫逸、自私可悲刻画得淋漓尽致。这种极致的繁华与荒唐，与随后到来的、连绵不绝的家庭悲剧和时代苦难形成了极其惨烈的艺术对比。它让读者在跟随叙述者的目光走近这个老人的同时，在心中种下了一个巨大的悬念：究竟是怎样残酷的命运锤击，才能让这样一个恶劣的纨绔大少爷，蜕变成如今这个能和老牛平静对话、眼神里毫无怨恨的温厚老人？</p>\r\n');
INSERT INTO `chaptertushushikan` VALUES (46, '2026-05-12 14:45:00', 11, 2, '家道中落', '\r\n<p>当福贵在龙二精心设计的赌局里，把徐家最后的一亩地、连同那座气势宏伟的祖传老宅房契全部输得精光、甚至连龙二签字画押的账单都堆成一座小山时，他的一生在一夜之间被彻底推入了万劫不复的黑暗深渊。当他失魂落魄地走在回家的田垄上，清晨的冷风吹醒了他的赌瘾，换来的却是浸透全身的冰冷恐惧。他从高高在上的徐大少爷，沦为了全城人人唾弃、连狗都不如的穷光蛋。债务逼上门来，徐老爷为了保全最后一点尊严，不得不变卖了所有的家产，用一担担沉重的铜钱挑去还债。</p>\r\n<p>老父亲徐老爷在把挑钱的扁担交到福贵肩膀上时，看着这个不肖子，苍老的眼睛里流出了浑浊的泪水。还完债后，徐老爷由于一辈子的心血和面子彻底崩塌，在去村头茅厕的路上，气得当场从高高的粪担上结结实实地摔了下来，一口气没上来便绝气身亡。而福贵的岳父，城里有名的米行老板，更是丢尽了脸面，雇了一队敲锣打鼓的高头大马，浩浩荡荡地开进双水村，把正挺着大肚子、面容憔悴的家珍强行接回了城里。一时间，原本风光无限的徐家彻底家破人亡。</p>\r\n<p>福贵脱下了沾满胭脂俗粉的丝绸长袍，换上了粗糙、扎肉的粗布麻衣。他带着长年体弱多病的年迈母亲，以及只有几岁大、怯生生的女儿凤霞，搬进了村里最偏僻、四面漏风、屋顶漏雨的破旧茅草屋里。他必须租种龙二转手给他的五亩贫瘠土地，重新像一个最普通的泥腿子一样，弯下那从未干过重活的腰，将双手深深地扎进长满老茧的泥土里去讨生活。每当夜深人静，浑身酸痛得无法入睡时，福贵在黑暗中看着母亲和女儿，才终于流下了悔恨交加、痛彻心扉的泪水。</p>\r\n<p>徐家的门楣倒塌了，但对于福贵来说，这却是他灵魂真正苏醒的起点。在无边的贫穷与繁重的体力劳作中，他开始真正去体会父亲一辈子的辛劳，开始真正去心疼那个被他伤害了无数次的家庭。苦难剥离了他身上所有的虚荣与浮躁，生生把他从一个寄生虫淬炼成了一个真正的汉子。他开始咬紧牙关，在泥泞的田垄间一脚一个深坑地向前走，他要用自己的汗水把母亲养活，把女儿拉扯大，哪怕生活再苦再累，他也决定要像一棵野草一样，在这片土地上顽强地扎下根来。</p>\r\n');
INSERT INTO `chaptertushushikan` VALUES (47, '2026-05-12 14:50:00', 11, 3, '第三章 苦难岁月', '\r\n<p>然而，命运对福贵的折磨和捉弄，才刚刚拉开更加惨烈的大幕。家珍在城里生下儿子有庆后，最终还是割舍不下对福贵的爱，穿着一身粗布衣服，抱着孩子默默地走回了破茅草屋，徐家在贫苦中迎来了一丝短暂的温情。可好景不长，福贵在进城给重病的母亲抓药时，倒霉地遭遇了国民党军队的强行抓壮丁。他被塞进了冰冷的运兵卡车，一路拉到了战火连天的北方前线。在枪林弹雨、尸横遍野的战场上，他挨过冻、啃过冻硬的生红薯，在死人堆里侥幸捡回了一条命，跟着解放军的俘虏营倒腾了几年才回到了家乡。</p>\r\n<p>当他满身风尘、骨瘦如柴地推开那扇破烂的柴门时，等待他的却是一个个残酷的打击：母亲早在几年前就因为贫病交加、临终前没见到儿子一面而抱憾去世；而他心爱的女儿凤霞，也因为长年高烧没钱看病，生生变成了一个无法说话、只能用手比划的聋哑人。好不容易熬到了建国和土地改革，福贵分到了地，日子眼看着一点点有了盼头，但时代的暴风雨却再次接踵而至。在‘大炼钢铁’和‘人民公社’的狂热大背景下，家里的铁锅被收走，口粮被集中，生活再次陷入了极度的匮乏之中。</p>\r\n<p>更让福贵痛不欲生的是，妻子家珍因为长年的超负荷劳作，患上了无法治愈的严重软骨病，整天只能躺在炕上。而他们懂事、热爱跑步的儿子有庆，为了不耽误上学和割草喂羊，每天赤着脚在田埂上飞奔。就在有庆读小学的时候，县长夫人在生孩子时大出血，学校组织学生去医院验血。为了巴结讨好县里的领导，医院的医生竟然丧尽天良地在有庆身上疯狂抽血，直到把这个活蹦乱跳的孩子活活抽干了最后一滴血，死在了解剖台上。有庆夭折的噩耗，像一柄重锤，彻底砸碎了福贵的天空。</p>\r\n<p>福贵背着儿子冰冷的尸体，在漆黑的夜路上一深一浅地走着，他不敢把真相告诉重病的家珍。他在村头的后山上，用双手挖出了一个小小的坟坑，亲手把自己的儿子埋进了冰冷的土里。生活的苦难像一头不知疲倦的凶兽，将这个风雨飘摇的家庭撕咬得体完肤，亲人的鲜血和眼泪，把福贵脚底下的这片黄土地染成了暗红色。然而，看着炕上奄奄一息的妻子，和身边默默流泪的 deaf-mute 凤霞，福贵知道自己连倒下的资格都没有，他必须把所有的血泪和恨意往肚子里咽，继续挺起脊梁，去面对这看不到尽头的人生风暴。</p>\r\n');
INSERT INTO `chaptertushushikan` VALUES (48, '2026-05-12 14:55:00', 11, 4, '第四章 生命的坚韧', '\r\n<p>如果说有庆的夭折是命运的致命一击，那么随后的岁月则证明了，命运对福贵的摧残远没有结束。凤霞长大后，经人介绍嫁给了城里老实、长着偏头却极有责任感的搬运工二喜。二喜对凤霞体贴入微，小两口的日子过得蜜里调油，家珍的病情也因此有了一丝好转。可悲剧往往总是在人刚刚看到幸福曙光的时候再次降临——凤霞在医院生孩子时，遭遇了严重的产后大出血，医生虽然保住了孩子苦根，却没能留住凤霞的生命。凤霞死在了她弟弟当年死去的同一家医院里。</p>\r\n<p>家珍在凤霞死后不到三个月，也在平静和绝望中闭上了眼睛，临终前她拉着福贵的手说，这辈子跟着他不后悔，下辈子还要一起过。原本热闹的草屋里，转眼只剩下了福贵、瘸腿的女婿二喜以及嗷嗷待哺的外孙苦根。福贵和二喜成了最坚固的依靠，他们一起下地，一起带孩子。然而，苦难的死神并没有因为这个家庭的惨状而动任何恻隐之心。几年后，二喜在城里的建筑工地上倒腾水泥板时，由于吊车失控，沉重的水泥板将他整个人活活砸扁在石墙上，临死前他嘴里含混不清地喊着的，全是儿子苦根的名字。</p>\r\n<p>女婿二喜也走了，福贵把苦根接回了农村，爷孙俩相依为命。苦根七岁那年，因为家里实在是太穷了，长年见不到一点荤腥。孩子下地干活时中暑生病，福贵心疼外孙，破天荒地在锅里煮了满满一盆新鲜的豆子，放在炕头上，自己便匆匆赶回田里干活。可他万万没有想到，极度饥饿的苦根在炕上拼命地吃着，最后由于吃得太多、太急，生生被豆子活活撑死在了炕上。当福贵回到家，看到苦根已经僵硬的身体时，他连哭的声音都发不出来了。命运最终收走了他身边的最后一个亲人。</p>\r\n<p>余华先生在这极具毁灭性的一章里，将人类生命所能承受的苦难推向了宇宙的极限。福贵的一生，就是不断与死亡、告别、悲剧进行惨烈死磕的史诗。有庆走了，家珍走了，凤霞走了，二喜走了，连最后的希望苦根也走了，福贵亲手在后山上挖了五座坟。然而，福贵并没有因此疯掉或自杀，他身体里流淌着一种来自中国最底层农民最纯粹、最无声的生命力。这种坚韧不是因为有什么宏大的理想支持，而是因为人对于‘活着’这一状态最原始、最神圣的敬畏。生命本身就是一场奇迹，值得我们毫无怨言地死磕到底。</p>\r\n');
INSERT INTO `chaptertushushikan` VALUES (49, '2026-05-12 15:00:00', 11, 5, '第五章 与牛为伴', '\r\n<p>如今，长达数十年的时代风暴和家庭血泪终于渐渐散去，炊烟袅袅，夕阳那温暖、橘红色的余晖把整片广袤无垠的黄土地染成了苍凉而又厚重的金黄色。在寂静、空旷的田垄之间，只有年迈、满头银发、脸上布满深邃皱纹的福贵，和一头同样皮肤松弛、牙齿几乎掉光的衰老黑牛相依为命。福贵在几年前的集市上，用最后的积蓄从屠宰刀下救下了这头老牛，并亲切、固执地给老牛也取名叫‘福贵’，就像是在对着镜子呼唤当年的自己。</p>\r\n<p>老少两个‘福贵’每天日出而作、日落而息。福贵在前面赶着牛，手里晃晃悠悠地拿着鞭子，嘴里哼唱着从老祖宗那里传下来的、高亢而又略带沙哑的古老南方山歌。每当他在田里耕作得累了，就会拍拍老牛的屁股，自言自语地和它说话：‘今天咱们多犁半亩地，明天就能多歇一会。有庆、二喜他们都在看着咱们呢，可不能偷懒。’老牛仿佛真的能听懂主人的话，甩甩尾巴，发出一声深沉、悠长的低哼，在泥土中继续迈出沉稳的步伐。他们完美地融为了这片土地的一部分。</p>\r\n<p>老人的眼神里，已经找不到一丝一毫年轻时的嚣张跋扈，也找不到中年时那种撕心裂肺的恨意与痛苦。取而代之的，是一种超越了生死、看透了命运逻辑的极致温厚与平静。他没有向路过的年轻人抱怨命运的不公，而是像讲述别人的故事一样，平静、从容、乃至带着一丝淡淡微笑地向我讲述着自己那过往波澜壮阔却又空无一物的一生。所有的爱恨情仇、所有的亲人血泪，最终都化为了坟头上的一抹青草，和眼前这一捧最踏实的泥土。生命活到了最后，只剩下了‘活着’本身纯粹的尊严。</p>\r\n<p>夜幕渐渐降临，广阔的大地落下了黑色的帷幕。福贵老人牵着他的老牛，在暮色和晚风的包裹下，沿着熟悉的田间小路，朝着那间亮着微弱灯光的破旧草屋缓缓走去。他们的背影被拉得很长很长，渐渐消失在夜色深处。耳边仿佛还回荡着老人那苍老而又豁达的歌声：‘少年去游荡，中年想掘藏，老年做和尚。’这便是《活着》的终极震撼——生活虽然剥夺了你的一切，但它无法剥夺你活下去的权利和高贵的平静。愿每一个读懂福贵的人，都能在多变、残酷的现实世界里，拥有一份死磕到底的生命力。</p>\r\n');
INSERT INTO `chaptertushushikan` VALUES (50, '2026-05-12 15:05:00', 12, 1, '第一章 Python入门', '\r\n<p>Python 是一门极其优雅、语法简洁、极具逻辑美感却功能无比强大的现代计算机高级编程语言。它不仅深受全球初学者、高校科研人员的青睐，更是谷歌、网飞、Facebook、以及各类顶级人工智能实验室背后的核心技术支柱。对于任何想要跨入软件工程、大数据分析或者大语言模型开发领域的学习者来说，Python 无疑是你程序员生涯中最完美的起点和最锋利的武器。</p>\r\n<p>在本章中，我们将手把手带你完成开发环境的搭建，彻底消除你在编程第一步时可能遇到的各种配置恐惧。无论你使用的是 Windows、macOS 还是 Linux 操作系统，我们都为你准备了最详尽的避坑指南。我们将详细讲解如何从官方网站下载并正确配置最新版本的 Python 解释器，如何配置系统的环境变量（PATH），以及如何通过终端命令行（CLI）去验证你的开发环境是否真正处于可用状态。</p>\r\n<p>除了底层的解释器，一个高效、舒适的代码编辑器也是程序员必不可少的生产力工具。我们将向你推荐并演示如何配置业内主流的轻量级编辑器 VS Code 或者是专业的集成开发环境 PyCharm。我们会教你如何安装 Python 专属的扩展插件、如何配置代码高亮与自动补全、以及如何利用编辑器内置的终端调试工具，为接下来的大型项目实战打造一个最舒适的代码编写环境。</p>\r\n<p>最后，我们将共同写下属于你的第一行经典程序代码：`print(\"Hello World!\")`。当你在终端看到这行亮绿色的英文字符顺利输出的那一瞬间，你其实就已经成功向计算机的底层逻辑发出了第一道指令。这一行微小的代码，不仅标志着你跨界转型的第一步成功，更是在拉开你未来用面向对象编程、用算法逻辑去重构世界、解决现实商业难题的宏伟序幕。欢迎来到代码的世界！</p>\r\n');
INSERT INTO `chaptertushushikan` VALUES (51, '2026-05-12 15:10:00', 12, 2, '第二章 变量和简单数据类型', '\r\n<p>在编写任何复杂的计算机程序时，变量（Variable）都扮演着极其关键的角色，它就像是一个个被临时分配在计算机内存中的虚拟标签或容器，允许我们在程序运行的过程中，随时存取、修改和动态追踪各种业务数据。理解变量的底层赋值机制和内存对齐原理，是写出高性能、无系统 Bug 软件的最核心工程基础。本章将带你深入探究变量的内在逻辑。</p>\r\n<p>我们将首先探讨如何给变量规范地命名。一个优秀的软件工程师在为变量命名时，绝不会使用毫无意义的 `a` 或 `b`，而是遵循清晰的‘蛇形命名法（snake_case）’，使用能直观传达业务含义的英文单词（如 `user_account_balance`）。同时，我们还将深入学习 Python 最底层的几种简单数据类型，包括用于存储文本信息的字符串（String），以及如何运用强大的字符串内置方法进行动态拼接、去除两端空格以及高级格式化输出。</p>\r\n<p>除了文本，数字处理也是核心。我们将详细探讨整数（Integer）与浮点数（Float）的四则混合运算。在计算机底层，由于二进制转十进制的精度限制，浮点数的精确度处理常常会隐藏着巨大的商业计算陷阱（例如经典的 `0.1 + 0.2 != 0.3` 问题）。我们会教你如何理解 Python 的数字处理机制，以及如何防范可能导致电商财务系统发生混乱的计算精度误差，为后续的复杂后端逻辑筑起防线。</p>\r\n<p>本章的后半部分，还将引入布尔值（Boolean）以及极其重要的变量动态类型特征。通过编写一系列简单、有趣的交互式小脚本，你将亲眼看到程序是如何在计算机内存中实时分配内存块、又是如何通过标签的切换来动态改变数据状态的。这些知识不仅能帮初学者彻底建立起‘内存对象模型’的具象思维，更能为接下来的控制流（if 条件判断）以及大规模循环处理提供源源不断的基础数据支持。</p>\r\n');
INSERT INTO `chaptertushushikan` VALUES (52, '2026-05-12 15:15:00', 12, 3, '第三章 列表和操作列表', '\r\n<p>当我们的软件系统需要同时处理成百上千、乃至上百万个关联数据（例如管理一个电商毕设系统中的用户购物车清单、游戏开发中的玩家历史最高得分排行榜、或者航天企业人资系统中的员工花名册）时，单一的基础变量就显得捉襟见肘且无能为力了。列表（List）作为 Python 中功能最强大、最灵活、也最频繁被使用的复合数据结构之一，正是为了应对这种大批量数据集中管理场景而生的。</p>\r\n<p>本章将重点传授如何创建列表、如何利用 Python 的‘零索引（Zero-based Indexing）’特征精确地访问和修改列表中的任何一个元素。我们将深入剖析列表在内存中的连续存储机制，教你如何熟练使用 `.append()`、`.insert()` 动态地向集合中注入新数据，以及如何利用 `del`、`.pop()` 和 `.remove()` 干净利落地剔除过期元素。理解这些操作的空间与时间复杂度代价，是写出高效后端接口的关键。</p>\r\n<p>拥有了列表后，如何高效地对数据进行批量操作，则是决定代码优雅度的分水岭。我们将深入讲解如何利用优雅、高效率的 `for` 循环去自动化遍历和批量处理列表中的每一个元素，让你彻底摆脱繁琐的重复复制粘贴。同时，我们还将引出极其锋利的‘切片（Slicing）’技术，它允许你通过简单的冒号语法，任意截取、复制和分流数据集合，这是数据清洗与预处理的核心基本功。</p>\r\n<p>最后，为了进一步提升系统性能，本章还将引入 Python 独有的、备受专业开发者赞誉的‘列表推导式（List Comprehension）’。它允许你用仅仅一行极具阅读美感的代码，去瞬间生成或过滤出一个庞大的、符合特定商业规则的新列表。掌握了操作列表的技术，你的程序就真正具备了处理大规模真实业务流的能力，数据不再是孤立的个体，而是成体系的高效动力源泉。</p>\r\n');
INSERT INTO `chaptertushushikan` VALUES (53, '2026-05-12 15:20:00', 12, 4, '第四章 函数和模块', '\r\n<p>如果一个软件系统在多个不同的业务场景下都需要执行同一段特定的计算或校验逻辑（例如在用户下单、充值、收藏图书时都需要进行用户身份验证），如果我们只是机械、重复地将这段代码复制粘贴到各个接口中，这不仅会让整个项目系统变得极其臃肿和难以阅读，更会在后续业务规则发生变更时，带来灾难性的多点维护噩梦。这在软件工程中被严重违反了‘不要重复自己（DRY）’的根本原则。</p>\r\n<p>函数（Function）是组织好的、可重复使用的、用于实现单一或相关联功能的代码段。它是现代模块化软件架构的灵魂和基石。本章将详细介绍如何使用 `def` 关键字去定义一个规范的函数、如何为函数科学地设计位置参数（Positional Arguments）、关键字参数（Keyword Arguments）以及默认参数值。我们将深入解构函数执行时的‘作用域（Scope）’，帮初学者搞清楚全局变量与局部变量在内存中的生命周期隔离。</p>\r\n<p>除了接收输入，函数如何返回高质量的计算结果也是核心。我们将详细探讨 `return` 语句的各种高级用法，包括如何让一个函数同时返回多个关联的业务数据（本质上是利用了 Python 优雅的元组解包技术）。我们会编写一系列用于处理文件解析、学术摘要自动生成的通用核心算法函数，展示如何通过抽象出高内聚、低耦合的独立函数，将一个庞大而混乱的毕业设计项目拆解得井井有条。</p>\r\n<p>本章的终极高潮，是将这些高频使用的核心函数进一步封装成独立的‘模块（Module）’文件。通过在后端代码中灵活运用 `import`、`from ... import ...` 以及 `as` 别名语法，你可以在不同的 Controller 层和 Service 层中自由调配、拼装你的算法库，真正实现专业软件工程级别的高效解耦与代码复用。只有当你掌握了函数与模块的设计精髓，你才算真正具备了独立架构和开发中大型商业系统项目的极客实力。</p>\r\n');
INSERT INTO `chaptertushushikan` VALUES (54, '2026-05-12 15:25:00', 13, 1, '第一章 认知革命', '\r\n<p>在大约 7 万年前，生活在东非偏僻角落里、原本在整个大自然食物链中毫无存在感、地位甚至不如一只狒狒的边缘物种——智人，突然发生了一场基因层面的神秘突变。这场突变直接导致智人的大脑内部结构发生重组，从而诞生了一场被称为‘认知革命’的伟大智力风暴。它让智人拥有了前所未有的、极其复杂的、甚至可以说是具有魔法色彩的语言交流与高级抽象能力。</p>\r\n<p>传统的动物语言（哪怕是高级灵长类动物）只能传递客观存在的具象信息，例如‘小心！树上有狮子’。但认知革命带给智人的根本性飞跃，在于我们的语言不仅能描述身边的野兽，更能去凭空想象、讨论和相信那些在物理现实世界中完全不存在的‘虚构故事’。例如山川的神灵、部落的图腾、祖先的传说、以及后来演化出来的国家、法律和各种意识形态。这是其他任何物种都无法逾越的认知鸿沟。</p>\r\n<p>这种‘讨论和相信虚构故事’的独特超能力，带来了人类历史上最震撼的奇迹：它打破了动物界依靠血缘关系结成几十只小群体的基因限制，让成千上万个彼此素不相识、没有任何血缘关系的陌生智人，能够为了同一个虚幻的宗教信仰、同一个部落承诺进行紧密、甚至跨越地理限制的超级大规模协作。在大规模协作的恐怖力量面前，那些身体更强壮的尼安德特人也只能在智人的石器和围剿下走向彻底灭绝。</p>\r\n<p>本章将作为全书的宏大开篇，带你彻底颠覆对‘人类文明’的传统成见。尤瓦尔·赫拉利教授将运用生物学与历史学的双重跨界视角，深刻揭示认知革命是如何通过‘虚构故事’这一核心纽带，让智人从一个普通的哺乳动物一步步摆脱生物进化的紧箍咒，从而彻底改写了整个地球的生态版图，昂首拉开了现代人类用虚构力量主宰地球、改造自然的宏伟历史史诗序幕。</p>\r\n');
INSERT INTO `chaptertushushikan` VALUES (55, '2026-05-12 15:30:00', 13, 2, '第二章 农业革命', '\r\n<p>在大约 1 万年前，人类历史上演了一场看似具有里程碑和颠覆性意义的伟大跨越——‘农业革命’。世界各个主要文明发源地的智人，开始纷纷走出赖以生存了数万年的茂密森林与荒原，放弃了那种随遇而安、自由自在的采集狩猎生活方式。他们转而定居在河流两岸，开始倾尽一生的全部心血和体力去辛勤种植小麦、大麦、水稻，以及规律性地驯化猪马牛羊。人类开始自豪地宣称，我们掌握了自然规律，成为了土地的主人。</p>\r\n<p>然而，在传统的历史教科书中，农业革命总被粉饰成人类文明的伟大进步和幸福源泉。尤瓦尔·赫拉利教授在书中则提出了一个极具学术震撼力、甚至有些冷酷无情的反思：本质上，根本不是人类驯化了小麦，反而是小麦通过基因策略彻底驯化了人类。如果从生物学的‘基因复制数量’这一单一维度来看，小麦无疑取得了空前的成功；但对于当时无数个普通的智人个体来说，农业革命无异于一场精心包装的巨大骗局。</p>\r\n<p>为了伺候极其娇气的小麦，智人不得不强迫自己那习惯于在丛林里奔跑、采摘的脊椎和关节，去长年累月地干着弯腰拔草、挑水灌溉、清理石块的繁重体力劳作，这直接导致了人类骨骼结构发生永久性的退行性病变（如椎间盘突出和关节炎）。同时，采集时代那种多元、健康的饮食结构，在农业革命后被单一的碳水化合物（面馍或米饭）所无情取代，导致了营养不良、牙齿大面积坏死。而高密度、固定化的聚落定居，更是为霍乱、天花等恶性传染病的疯狂肆虐提供了完美的温床。</p>\r\n<p>更糟糕的是，农业革命还生生催生了土地私有制的概念，从而不可逆转地带来了阶级的严重压迫、残酷的赋税制度以及人剥削人的残酷社会不平等。它让智人作为一个物种在数量上实现了疯狂的繁衍，却让无数个普通的劳动个体陷入了比采集时代更加艰辛、更加狭窄、也更容易因为一场旱灾就全家饿死的生存漩涡之中。本章将带你深入这场革命的阴暗面，用完全相反的冷峻眼光，重新去审视那些写满汗水与血泪的农耕文明基石。</p>\r\n');
INSERT INTO `chaptertushushikan` VALUES (56, '2026-05-12 15:35:00', 13, 3, '第三章 人类的融合统一', '\r\n<p>随着农业革命导致的定居人口出现爆炸性增长，原本彼此孤立、散落各地、老死不相往来的各个分散部落与地方文明，开始在历史巨轮和物种交流的强力推动下，不可逆转地走向全球范围内的融合与统一。从宏观的世界历史轴线来看，整个人类社会的发展趋势，清晰地呈现出从多极化走向一体化的宏大轨迹。在错综复杂的历史演变与文明博弈中，人类逐渐创造出了三大超越一切地理阻隔、文化鸿沟和肤色成见的全球性终极统一力量。</p>\r\n<p>这第一股力量，便是冷酷无情、却能让所有不同文化、不同宗教信仰之人瞬间达成绝对信任的‘金钱与货币制度’。哲学家们天天痛骂金钱的市侩，但金钱却是历史上有史以来最宽容、最具有普世价值的信任系统。一个笃信基督教的欧洲商人和一个笃信伊斯兰教的阿拉伯商人，可以在完全不认同对方信仰的情况下，毫无障碍地坐下来进行跨国大宗贸易，因为他们共同认同那一枚闪闪发光的黄金货币背后的虚构价值。金钱抹平了文化的敌意。</p>\r\n<p>第二股强力推动人类走向融合的力量，则是伴随着铁血征伐与文明扩张的‘帝国（Empire）’。尽管帝国的建立过程往往伴随着血腥的杀戮、残酷的殖民和对原住民文化的无情摧残，但在客观的历史大局观下，帝国通过强行统一法律、统一度量衡、修建四通八达的官道网络，生生将无数个零散、冲突的小邦国揉合进了一个统一的文化和政治母体之中。罗马帝国的扩张传播了法律，大英帝国的殖民催生了全球贸易网，帝国成了文明融合的推土机。</p>\r\n<p>而第三股重塑人类精神秩序的终极统一力量，则是能够从思想底层对千万大众进行社会协作规范的‘全球性宗教（如佛教、基督教、伊斯兰教）’。这些宗教打破了过去那种‘我的神只保护我的部落’的狭隘地方神灵观念，提倡一种具有普世价值、适用于全人类的神圣法则。金钱、帝国和宗教相互交织，共同编织了一张把全球人类紧紧捆绑在一起的无形大网，将曾经支离破碎的世界，逐渐融合成了一个不可分割、休戚与共的现代命运共同体。本章将为你解开这场全球化大融合的底层运行逻辑。 </p>\r\n');
INSERT INTO `chaptertushushikan` VALUES (57, '2026-05-12 15:40:00', 13, 4, '第四章 科学革命', '\r\n<p>大约在 500 年前的欧洲，一场被称为‘科学革命’的伟大智力风暴悄然诞生。这场革命彻底改变了人类与自然、与知识的关系，它不仅将人类从长达数千年的中世纪宗教神学愚昧中解脱出来，更是以几何级数的惊人速度，将人类文明推向了现代工业化、信息化和太空探险的崭新纪元。而这场彻底改写人类命运的伟大革命，其最关键、最具有颠覆性的逻辑起点，竟然在于人类历史上第一次勇敢、坦诚地承认了自己的‘无知’。</p>\r\n<p>在科学革命之前，无论是古代儒家经典、中世纪的《圣经》还是阿拉伯的伊斯兰经书，都固执地向大众宣称：这个世界上所有真正重要、值得人类了解的知识（如世界的起源、道德的规范、灵魂的去向），都已经由神明或古希腊圣贤清清楚楚地写在经书里了。如果你在经书里找不到答案，那说明这个知识对人类来说毫无意义。古人崇拜过去，认为历史是在不断退化。而科学革命则彻底砸碎了这一智力紧箍咒，人类第一次在地图上画出了‘大片的空白’，勇敢地宣布：‘我们对这个世界的运行规律其实一无所知。’</p>\r\n<p>正是因为承认了自己的无知，人类才不再满足于趴在经书上查阅陈腐的教条，转而将目光投向真实的客观自然。我们开始学会运用严密的数学计算来归纳数据，运用精密的望远镜和显微镜进行客观的实地观察，以及通过反复、甚至有些执着的科学实验去验证未知的猜想。科学革命完美地与现代帝国的海外扩张本能、以及资本主义追求无限财富逐利追求达成了完美的利益同盟。科学通过技术变现，技术为帝国赚取巨额利润，帝国反过来砸下重金资助更多的基础科学研究。这辆恐怖的利益战车一旦启动，便再也无法停下。</p>\r\n<p>科学革命赋予了智人这个昔日边缘物种前所未有的、近乎于神明般的恐怖力量。我们在短短几百年里，生生攻克了肆虐数千年的恶性传染病，解开了 DNA 遗传学的底层天书，将足迹印在了荒凉的月球表面，甚至在如今的 2026 年，已经开始用基因工程和高级 AGI 系统去重新定义‘生命’这一概念本身的物理边界。本章将带你站在当代科学技术的最前沿，深度反思科学革命是如何作为一把威力巨大的双刃剑，在赋予人类无限能力的同同时，也步步将地球生态和人类自身推向了充满未知的危险奇点。这是一场惊心动魄的智力解构。</p>\r\n');
INSERT INTO `chaptertushushikan` VALUES (58, '2026-05-12 15:45:00', 14, 1, '第一章 经济学十大原理', '\r\n<p>经济学这门经典学科的底层核心本质，绝不仅仅是探讨华尔街那些精明的商人在股市里如何高频炒作股票、或者是研究中央银行明天要印制发行多少面值的纸币。它本质上是一门研究整个社会应当如何管理、合理配置其‘稀缺资源（Scarcity）’的严密、严谨社会科学。因为资源的有限性（如土地、算力、石油、劳动力）与人类物欲的无限性之间，存在着永恒且无法调和的根本性矛盾。如何最优化地分分配这些资源，是人类文明运转的核心命题。</p>\r\n<p>本章将作为全书的宏大总纲，系统性、图形化地向读者展示风靡全球的‘经济学十大原理’。我们将首先关注个体是如何做出决策的。理性的行为体在面对任何一项商业选择时，都必须清醒地评估其‘机会成本（Opportunity Cost）’——即为了得到这件东西所必须放弃的其他最大价值选项。同时，我们还将深入学习‘边际思考（Marginal Thinking）’，理解为什么一个理性的面包店老板，决定他明天是否多雇佣一个工人的依据，只取决于那最后一个工人带来的额外收益是否大于其工资开销。</p>\r\n<p>除了个体抉择，本章还将带读者领略经济是如何运行以及个体之间是如何相互交易的。我们将重点剖析‘贸易能让每一个人的处境变得更好’的比较优势理论，以及为什么自由市场通常是组织、协调社会经济活动的一种绝佳且极具效率的精妙方法。亚当·斯密在数百年前就精辟地指出，千千万万个自私的消费者和商家，在冥冥之中会受到一只‘看不见的手（Invisible Hand）’的指引与调节，在追求自身利益最大化的同时，竟然奇迹般地实现了全社会整体福利的动态最优分配。</p>\r\n<p>最后，十大原理还将延伸到宏观经济层面，探讨政府在什么时候可以且应当介入市场（如解决外部性引起的市场失灵、打击垄断和调节贫富差距），以及为什么当一个国家的中央银行开动机器疯狂印制货币时，必然会导致恶性通货膨胀（Inflation）的爆发。掌握了这十大黄金原理，你就拥有了一双看穿庞杂商业现象本质的理性慧眼，你将能够跳出那些政客和自媒体的语言陷阱，从最底层的‘资源配置开销与激励机制’出发，冷静地审视这个复杂多变的现代社会。这是你建立财富理性的通关第一步。</p>\r\n');
INSERT INTO `chaptertushushikan` VALUES (59, '2026-05-12 15:50:00', 14, 2, '第二章 像经济学家一样思考', '\r\n<p>每一个成熟、伟大的学科，都有其独特的专业研究视角、特定的行话以及严密的逻辑思维方式。为了在错综复杂、干扰项无数的现实社会生活中理清头绪，经济学家们学会了像物理学家在实验室里建立‘理想真空模型’一样，运用科学的合理假设（Assumptions）和高度抽象的‘经济模型（Economic Models）’来剪裁和简化这个过度庞杂的现实世界。本章的目标，正是带初学者完成一次思维方式的华丽蜕变，教你如何像一个理性的经济学家一样冷静地思考。</p>\r\n<p>我们将重点剖析两个最经典的入门级经济模型。首先是‘循环流量图（Circular-Flow Diagram）’，它将复杂的国民经济简化为两大行为体（居民户和企业）以及两大核心市场（产品和服务市场、生产要素市场），以极其直观的图形直观展示了资金、劳动力和商品是如何在社会各个阶层之间循环流动的。接下来，我们将深入推导并作图展示‘生产可能性边界（Production Possibilities Frontier）’模型，清晰阐述一个社会在技术和资源给定的前提下，如何在一款产品（如大炮）与另一款产品（如黄油）之间进行残酷的效率折中与机会成本转换。</p>\r\n<p>除了掌握模型，像经济学家一样思考的关键，还在于能够清晰地分辨‘实证分析（Positive Analysis）’与‘规范分析（Normative Analysis）’之间的天壤之别。实证表述回答的是‘世界实际上是什么样’的纯客观事实描述，可以通过数据和逻辑来验证其真伪；而规范表述回答的则是‘世界应该是什么样’的带有个人价值观、道德标准和政治偏见的主观判断。在现实中，许多别有用心的政策制定者经常故意混淆这两者，用虚假的数据粉饰其主观意图，从而误导公众。</p>\r\n<p>通过本章的系统训练，你将学会如何剥离掉个人泛滥的情感与廉价的同情心，运用严密的供求关系、边际开销以及长期博弈眼光去客观、跨平台地评估各种公共政策（如最低工资法、房租管制、跨国关税）所带来的长期连锁反应。你会震惊地发现，许多出发点极其善良的社会福利政策，最终在经济学模型的严格推演下，往往会推导出一个让底层平民处境更加悲惨的破坏性结局。看清世界运行的真相，需要极大的理智与冷峻。本章将为你铸造这柄理智的学术解剖刀。</p>\r\n');
INSERT INTO `chaptertushushikan` VALUES (60, '2026-05-12 15:55:00', 14, 3, '第三章 供给与需求', '\r\n<p>无论你在世界的哪一个角落经营一家市值千亿美元的跨国高科技软件企业，还是仅仅在双水村的集市街头兜售最廉价的小商品，你的商业行为都无法逃脱、更无法违背整个市场经济中最基础、最具有支配地位的两大根本性力量的无情制约——那便是‘供给（Supply）’与‘需求（Demand）’。这两股伟大的力量在冥冥之中编织了那只由亚当·斯密提出的、充满魔力的‘看不见的手’，在暗中默默操纵着全天下所有商品的最终交易价格与生产产量。</p>\r\n<p>本章将带领读者深入、详细地推导并构建经典的供求关系曲线数学模型。我们将首先从买者的行为谈起，详细拆解‘需求定理（Law of Demand）’的底层心理学与替代效应机理，作图展示为什么在其他条件不变的前提下，商品的价格越低，消费者的购买欲望和购买数量就会呈现出明显的反向增长。同时，我们还将深入探讨影响需求曲线整体发生平移（Shift）的核心外部变量，包括消费者的收入变动、偏好转移、买者人数多寡、以及替代品和互补品（例如汽车与汽油）的价格涨跌。</p>\r\n<p>紧接着，章节的重心将转向卖者的行为，全面剖析‘供给定理（Law of Supply）’的内在运行逻辑。我们将推导为什么对于逐利的厂商来说，商品的市场售价越高，他们扩大生产、向市场投放更多货物的激励就越强烈。我们会详细列举导致供给曲线发生左右平移的关键工程与商业变量，如原材料价格的波动、生产技术的重大革新、政府税收补贴政策的微调、以及对未来市场价格行情的期望变动。理解这些曲线背后的拉扯，是商业预测的必备功底。</p>\r\n<p>最后，本章将迎来最精彩的交汇点——‘市场均衡（Market Equilibrium）’。供给曲线与需求曲线在坐标系上相交的那一个唯一节点，直接决定了当前市场的均衡价格与均衡数量。我们会通过一系列极其生动的现实案例（如气候异常导致咖啡豆价格暴涨、或者是政府强行实施价格上限导致加油站排起长龙），详细向读者阐述当市场遭遇外部剧烈冲击时，价格机制是如何作为最灵敏的信号灯，自发进行调节，从而让市场在最短时间内重新恢复动态最优配置的。这便是微观经济学最核心的灵魂魅力所在。</p>\r\n');

-- ----------------------------
-- Table structure for chargerecord
-- ----------------------------
DROP TABLE IF EXISTS `chargerecord`;
CREATE TABLE `chargerecord`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `role` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色',
  `amount` double NOT NULL COMMENT '金额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '充值记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of chargerecord
-- ----------------------------
INSERT INTO `chargerecord` VALUES (1, '2026-05-12 09:30:00', 1, 'zhangwei2025', 'user', 500);
INSERT INTO `chargerecord` VALUES (2, '2026-05-12 10:40:00', 2, 'lina_book', 'user', 1000);
INSERT INTO `chargerecord` VALUES (3, '2026-05-12 11:00:00', 3, 'wangfang_reader', 'user', 300);
INSERT INTO `chargerecord` VALUES (4, '2026-05-12 12:50:00', 4, 'liujun_tech', 'user', 2000);
INSERT INTO `chargerecord` VALUES (5, '2026-05-12 13:10:00', 5, 'chenyan_student', 'user', 200);
INSERT INTO `chargerecord` VALUES (6, '2026-05-12 14:30:00', 6, 'yangming_prof', 'user', 3000);
INSERT INTO `chargerecord` VALUES (7, '2026-05-12 15:00:00', 7, 'zhaoli_writer', 'user', 800);
INSERT INTO `chargerecord` VALUES (8, '2026-05-12 16:40:00', 8, 'sunlei_dev', 'user', 1500);
INSERT INTO `chargerecord` VALUES (9, '2026-05-12 17:10:00', 9, 'zhoumin_artist', 'user', 600);
INSERT INTO `chargerecord` VALUES (10, '2026-05-12 18:50:00', 10, 'wutao_history', 'user', 2500);
INSERT INTO `chargerecord` VALUES (11, '2026-05-12 19:20:00', 1, 'zhangwei2025', 'user', 1000);
INSERT INTO `chargerecord` VALUES (12, '2026-05-12 20:30:00', 3, 'wangfang_reader', 'user', 500);
INSERT INTO `chargerecord` VALUES (13, '2026-05-12 21:45:00', 5, 'chenyan_student', 'user', 300);
INSERT INTO `chargerecord` VALUES (14, '2026-05-12 22:15:00', 7, 'zhaoli_writer', 'user', 800);
INSERT INTO `chargerecord` VALUES (15, '2026-05-12 23:30:00', 2, 'lina_book', 'user', 1200);

-- ----------------------------
-- Table structure for chat
-- ----------------------------
DROP TABLE IF EXISTS `chat`;
CREATE TABLE `chat`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `adminid` bigint(20) NULL DEFAULT NULL COMMENT '管理员id',
  `ask` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '提问',
  `reply` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '回复',
  `isreply` int(11) NULL DEFAULT NULL COMMENT '是否回复',
  `isread` int(11) NULL DEFAULT 0 COMMENT '已读/未读(1:已读,0:未读)',
  `uname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `uimage` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '用户头像',
  `type` int(11) NULL DEFAULT 1 COMMENT '内容类型(1:文本,2:图片,3:视频,4:文件,5:表情)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '客服中心' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of chat
-- ----------------------------
INSERT INTO `chat` VALUES (1, '2026-05-12 10:45:00', 1, 1, '请问订单2026051210300001什么时候能发货？', '您的订单已于今天上午发出，预计2-3天送达，请注意查收。', 1, 1, '张伟', 'upload/user_zhangwei.jpg', 1);
INSERT INTO `chat` VALUES (2, '2026-05-12 11:30:00', 3, 1, '我想申请退换货，怎么处理？', '请提供订单号，我们将在24小时内为您处理退换货申请。', 1, 1, '王芳', 'upload/user_wangfang.jpg', 1);
INSERT INTO `chat` VALUES (3, '2026-05-12 12:20:00', 5, 1, '会员积分怎么查询？', '登录账号后，在个人中心-我的积分页面即可查看积分余额和明细。', 1, 1, '陈燕', 'upload/user_chenyan.jpg', 1);
INSERT INTO `chat` VALUES (4, '2026-05-12 13:15:00', 2, 1, '有《算法导论》的电子书吗？', '目前该书只有纸质版，电子书正在洽谈版权，预计下月上线。', 1, 1, '李娜', 'upload/user_lina.jpg', 1);
INSERT INTO `chat` VALUES (5, '2026-05-12 14:40:00', 7, 1, '图书包装会不会很简陋？', '我们采用专业图书包装，外层加厚纸箱+气泡膜，确保运输安全。', 1, 1, '赵丽', 'upload/user_zhaoli.jpg', 1);
INSERT INTO `chat` VALUES (6, '2026-05-12 15:25:00', 4, 1, '可以开具发票吗？', '可以的，请在下单时选择需要发票，填写发票信息即可。', 1, 1, '刘军', 'upload/user_liujun.jpg', 1);
INSERT INTO `chat` VALUES (7, '2026-05-12 16:50:00', 6, 1, '团购有优惠吗？', '单次购买10本以上可享受团购价，请联系客服获取专属折扣。', 1, 1, '杨明', 'upload/user_yangming.jpg', 1);
INSERT INTO `chat` VALUES (8, '2026-05-12 17:30:00', 8, 1, '偏远地区包邮吗？', '新疆、西藏、内蒙古等偏远地区暂不享受包邮政策，需补运费差价。', 1, 1, '孙磊', 'upload/user_sunlei.jpg', 1);
INSERT INTO `chat` VALUES (9, '2026-05-12 18:20:00', 9, 1, '如何成为VIP会员？', '累计消费满1000元或充值2000元即可自动升级为VIP会员。', 1, 1, '周敏', 'upload/user_zhoumin.jpg', 1);
INSERT INTO `chat` VALUES (10, '2026-05-12 19:45:00', 10, 1, '预售图书什么时候发货？', '预售图书将在正式发售当天开始发货，预计3-5天送达。', 0, 1, '吴涛', 'upload/user_wutao.jpg', 1);
INSERT INTO `chat` VALUES (11, '2026-05-12 20:30:00', 1, 1, '收到的图书有破损怎么办？', '请拍照联系客服，我们将为您免费更换或全额退款。', 1, 0, '张伟', 'upload/user_zhangwei.jpg', 1);
INSERT INTO `chat` VALUES (12, '2026-05-12 21:20:00', 5, 1, '有签名版图书吗？', '部分热门图书提供签名版，请在商品页面查看是否有签名版选项。', 1, 0, '陈燕', 'upload/user_chenyan.jpg', 1);
INSERT INTO `chat` VALUES (13, '2026-06-04 20:18:58', 10, NULL, '您好', NULL, 0, 1, 'wutao', NULL, 1);
INSERT INTO `chat` VALUES (14, '2026-06-04 20:26:05', 10, 1, NULL, '您好', NULL, 0, 'admin', 'upload/1778755097331_566.jpeg', 1);

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置参数名称',
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配置参数值',
  `url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'url',
  `type` int(11) NULL DEFAULT NULL COMMENT '参数类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '配置文件' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES (1, 'picture1', 'upload/1779272638058_444.jpg', NULL, 1);
INSERT INTO `config` VALUES (2, 'picture2', 'upload/1779272623183_419.jpg', NULL, 1);
INSERT INTO `config` VALUES (3, 'picture3', 'upload/1779272601383_527.jpg', NULL, 1);
INSERT INTO `config` VALUES (11, 'baidu', '{\"appId\":\"49214550\",\"apiKey\":\"7Otjpv2kn0ljQk45qXOXh5MO\",\"secretKey\":\"BMfbXRbTIVaB4C3SbRTtGqDv1wHDvyXS\"}', NULL, 2);
INSERT INTO `config` VALUES (14, 'deepseek', '{\"key\":\"sk-961af215e60e4f269c2808b3a55eb9e8\"}', NULL, 2);
INSERT INTO `config` VALUES (21, 'bLoginBackgroundImg', '', NULL, 3);
INSERT INTO `config` VALUES (22, 'bRegisterBackgroundImg', '', NULL, 3);
INSERT INTO `config` VALUES (23, 'bIndexBackgroundImg', '', NULL, 3);
INSERT INTO `config` VALUES (24, 'bTopLogo', '', NULL, 3);
INSERT INTO `config` VALUES (25, 'bHomeLogo', '', NULL, 3);
INSERT INTO `config` VALUES (26, 'fLoginBackgroundImg', '', NULL, 3);
INSERT INTO `config` VALUES (27, 'fRegisterBackgroudImg', '', NULL, 3);
INSERT INTO `config` VALUES (28, 'fTopLogo', '', NULL, 3);

-- ----------------------------
-- Table structure for discussbookinformation
-- ----------------------------
DROP TABLE IF EXISTS `discussbookinformation`;
CREATE TABLE `discussbookinformation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `refid` bigint(20) NOT NULL COMMENT '关联表id',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `avatarurl` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '头像',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '评论内容',
  `score` double NULL DEFAULT NULL COMMENT '评分',
  `reply` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '回复内容',
  `thumbsupnum` int(11) NULL DEFAULT 0 COMMENT '赞',
  `crazilynum` int(11) NULL DEFAULT 0 COMMENT '踩',
  `istop` int(11) NULL DEFAULT 0 COMMENT '置顶(1:置顶,0:非置顶)',
  `tuserids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '赞用户ids',
  `cuserids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '踩用户ids',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '图书信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of discussbookinformation
-- ----------------------------
INSERT INTO `discussbookinformation` VALUES (1, '2026-05-12 10:30:00', 1, 1, 'upload/user_zhangwei.jpg', '张伟', '非常经典的作品，路遥的笔触非常细腻，展现了普通人的奋斗历程。强烈推荐！', 5, '感谢您的评价！', 23, 0, 1, '2,3,4,5,6', '');
INSERT INTO `discussbookinformation` VALUES (2, '2026-05-12 11:20:00', 2, 2, 'upload/user_lina.jpg', '李娜', '算法导论是计算机科学必备教材，内容非常全面，但难度较大，建议有一定基础再阅读。', 4.5, '谢谢您的专业评价！', 45, 2, 0, '1,3,4,5,6,7,8', '9,10');
INSERT INTO `discussbookinformation` VALUES (3, '2026-05-12 12:15:00', 4, 3, 'upload/user_wangfang.jpg', '王芳', '卡尼曼的理论非常实用，帮助我理解了很多日常决策中的误区。值得一读！', 4.8, '感谢您的分享！', 34, 1, 0, '1,2,4,5,6,7', '8');
INSERT INTO `discussbookinformation` VALUES (4, '2026-05-12 13:40:00', 6, 4, 'upload/user_liujun.jpg', '刘军', '霍金用通俗的语言讲述了深奥的物理学理论，非常精彩！孩子也很喜欢看。', 4.9, '谢谢支持！', 56, 0, 1, '1,2,3,5,6,7,8,9', '');
INSERT INTO `discussbookinformation` VALUES (5, '2026-05-12 14:25:00', 5, 5, 'upload/user_chenyan.jpg', '陈燕', '历史研究的经典之作，以小见大，展现了明代政治生态。非常有启发性！', 4.7, '感谢您的好评！', 28, 1, 0, '1,2,3,4,6', '7');
INSERT INTO `discussbookinformation` VALUES (6, '2026-05-12 15:50:00', 10, 6, 'upload/user_yangming.jpg', '杨明', '小王子的故事很温馨，适合所有年龄段的人阅读。买给孩子作为生日礼物。', 5, '谢谢您的信任！', 67, 0, 1, '1,2,3,4,5,7,8,9,10', '');
INSERT INTO `discussbookinformation` VALUES (7, '2026-05-12 16:35:00', 3, 7, 'upload/user_zhaoli.jpg', '赵丽', '企业管理的经典著作，很多理念至今仍适用。推荐给所有管理者。', 4.6, '感谢您的推荐！', 31, 2, 0, '1,2,3,4,5,6', '8,9');
INSERT INTO `discussbookinformation` VALUES (8, '2026-05-12 17:10:00', 8, 8, 'upload/user_sunlei.jpg', '孙磊', '原研哉的设计理念非常独特，日式简约美学让人耳目一新。', 4.7, '谢谢您的专业评价！', 22, 1, 0, '1,2,3,4,5,6,7', '10');
INSERT INTO `discussbookinformation` VALUES (9, '2026-05-12 18:45:00', 9, 9, 'upload/user_zhoumin.jpg', '周敏', '断舍离不仅是一种整理方法，更是一种生活态度。读后受益匪浅！', 4.5, '感谢您的分享！', 19, 0, 0, '1,2,3,4,5,6,7,8', '');
INSERT INTO `discussbookinformation` VALUES (10, '2026-05-12 19:20:00', 7, 10, 'upload/user_wutao.jpg', '吴涛', '高等数学教材编写得很系统，例题丰富，适合自学和课堂教学。', 4.4, '谢谢您的评价！', 15, 3, 0, '1,2,3,4,5', '6,7,8');
INSERT INTO `discussbookinformation` VALUES (11, '2026-05-12 20:15:00', 1, 3, 'upload/user_wangfang.jpg', '王芳', '第二次购买，送给朋友的。平凡的世界永远不过时！', 5, '感谢您的再次购买！', 12, 0, 0, '1,2,4,5', '');
INSERT INTO `discussbookinformation` VALUES (12, '2026-05-12 21:30:00', 6, 1, 'upload/user_zhangwei.jpg', '张伟', '时间简史是我最喜欢的科普书籍，已经推荐给了很多朋友。', 4.9, '谢谢您的推荐！', 38, 1, 0, '2,3,4,5,6,7,8,9', '10');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `orderid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '订单编号',
  `goodid` bigint(20) NOT NULL COMMENT '商品id',
  `goodname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '商品名称',
  `picture` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '图片',
  `buynumber` int(11) NULL DEFAULT NULL COMMENT '购买数量',
  `price` double NULL DEFAULT NULL COMMENT '单价',
  `total` double NULL DEFAULT NULL COMMENT '总价',
  `type` int(11) NULL DEFAULT NULL COMMENT '支付类型',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '订单状态',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '地址',
  `tel` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电话',
  `consignee` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '收货人',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `userid` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `tablename` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'bookinformation' COMMENT '商品表名',
  `logistics` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '物流',
  `sfsh` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '是否审核',
  `shhf` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '审核回复',
  `role` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户角色',
  `returnreason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '退货原因',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `orderid`(`orderid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '订单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, '2026-05-12 10:30:00', '2026051210300001', 1, '平凡的世界', 'upload/1778756677058_36.png', 2, 59.8, 119.6, 1, '已完成', '北京市朝阳区建国路88号SOHO现代城A座1205室', '13812345678', '张伟', '包装完好', 1, 'bookinformation', '顺丰快递:SF1234567890', '是', '', 'user', NULL);
INSERT INTO `orders` VALUES (2, '2026-05-12 11:20:00', '2026051211200002', 2, '算法导论', 'upload/1778756499656_992.png', 1, 99, 99, 1, '已完成', '上海市浦东新区陆家嘴环路1088号国金中心3201室', '13987654321', '李娜', '', 2, 'bookinformation', '中通快递:ZTO9876543210', '是', '', 'user', NULL);
INSERT INTO `orders` VALUES (3, '2026-05-12 12:15:00', '2026051212150003', 4, '思考,快与慢', 'upload/1778756281027_356.png', 1, 69, 69, 1, '已完成', '广州市天河区体育西路189号城建大厦2203室', '13655551234', '王芳', '请尽快发货', 3, 'bookinformation', '圆通快递:YT5678901234', '是', '', 'user', NULL);
INSERT INTO `orders` VALUES (4, '2026-05-12 13:40:00', '2026051213400004', 6, '时间简史', 'upload/1778756033444_818.jpg', 3, 45, 135, 1, '已完成', '深圳市南山区科技园南路88号深圳湾科技生态园10栋1801室', '13722228888', '刘军', '', 4, 'bookinformation', '韵达快递:YD3456789012', '是', '', 'user', NULL);
INSERT INTO `orders` VALUES (5, '2026-05-12 14:25:00', '2026051214250005', 5, '万历十五年', 'upload/1778756066623_234.jpg', 2, 38, 76, 1, '已完成', '杭州市西湖区文三路259号昌地火炬大厦1208室', '13566667777', '陈燕', '送书上门', 5, 'bookinformation', '申通快递:ST2345678901', '是', '', 'user', NULL);
INSERT INTO `orders` VALUES (6, '2026-05-12 15:50:00', '2026051215500006', 10, '小王子', 'upload/1778755630864_945.jpg', 5, 25, 125, 1, '已完成', '南京市鼓楼区中山路321号绿地中心4201室', '13899990000', '杨明', '送给孩子的礼物', 6, 'bookinformation', '顺丰快递:SF8901234567', '是', '', 'user', NULL);
INSERT INTO `orders` VALUES (7, '2026-05-12 16:35:00', '2026051216350007', 3, '从优秀到卓越', 'upload/1778756310324_436.png', 1, 45, 45, 1, '已完成', '成都市武侯区人民南路四段9号来福士广场T2-2803室', '13611112222', '赵丽', '', 7, 'bookinformation', '中通快递:ZTO6789012345', '是', '', 'user', NULL);
INSERT INTO `orders` VALUES (8, '2026-05-12 17:10:00', '2026051217100008', 8, '设计中的设计', 'upload/1778755835824_120.jpeg', 2, 58, 116, 1, '已完成', '武汉市洪山区光谷大道88号光谷软件园C8栋1501室', '13733334444', '孙磊', '', 8, 'bookinformation', '圆通快递:YT4567890123', '是', '', 'user', NULL);
INSERT INTO `orders` VALUES (9, '2026-05-12 18:45:00', '2026051218450009', 9, '断舍离', 'upload/1778755689992_567.webp', 3, 35, 105, 1, '已完成', '重庆市渝北区金开大道1000号棕榈泉国际中心1806室', '13555556666', '周敏', '尽快送达', 9, 'bookinformation', '韵达快递:YD1234567890', '是', '', 'user', NULL);
INSERT INTO `orders` VALUES (10, '2026-05-12 19:20:00', '2026051219200010', 7, '高等数学', 'upload/1778755941370_471.jpg', 1, 42.5, 42.5, 1, '已完成', '西安市雁塔区科技路48号创业广场B座2201室', '13877778888', '吴涛', '考试急用', 10, 'bookinformation', '申通快递:ST9012345678', '是', '', 'user', NULL);
INSERT INTO `orders` VALUES (11, '2026-05-12 20:15:00', '2026051220150011', 1, '平凡的世界', 'upload/1778756677058_36.png', 1, 59.8, 59.8, 1, '待发货', '北京市朝阳区建国路88号SOHO现代城A座1205室', '13812345678', '张伟', '', 1, 'bookinformation', NULL, '是', '', 'user', NULL);
INSERT INTO `orders` VALUES (12, '2026-05-12 21:30:00', '2026051221300012', 2, '算法导论', 'upload/1778756499656_992.png', 2, 99, 198, 1, '待发货', '上海市浦东新区陆家嘴环路1088号国金中心3201室', '13987654321', '李娜', '', 2, 'bookinformation', NULL, '是', '', 'user', NULL);
INSERT INTO `orders` VALUES (13, '2026-05-12 08:50:00', '2026051208500013', 6, '时间简史', 'upload/1778756033444_818.jpg', 1, 45, 45, 1, '已取消', '广州市天河区体育西路189号城建大厦2203室', '13655551234', '王芳', '重复下单', 3, 'bookinformation', NULL, '否', '订单已取消', 'user', '重复下单');
INSERT INTO `orders` VALUES (14, '2026-05-12 09:25:00', '2026051209250014', 4, '思考,快与慢', 'upload/1778756281027_356.png', 2, 69, 138, 1, '运输中', '深圳市南山区科技园南路88号深圳湾科技生态园10栋1801室', '13722228888', '刘军', '', 4, 'bookinformation', '顺丰快递:SF5678901234', '是', '', 'user', NULL);
INSERT INTO `orders` VALUES (15, '2026-05-12 10:40:00', '2026051210400015', 10, '小王子', 'upload/1778755630864_945.jpg', 10, 25, 250, 1, '已完成', '南京市鼓楼区中山路321号绿地中心4201室', '13899990000', '杨明', '班级团购', 6, 'bookinformation', '中通快递:ZTO3456789012', '是', '', 'user', NULL);
INSERT INTO `orders` VALUES (16, '2026-05-12 11:15:00', '2026051211150016', 5, '万历十五年', 'upload/1778756066623_234.jpg', 1, 38, 38, 1, '已完成', '杭州市西湖区文三路259号昌地火炬大厦1208室', '13566667777', '陈燕', '', 5, 'bookinformation', '圆通快递:YT7890123456', '是', '', 'user', NULL);
INSERT INTO `orders` VALUES (17, '2026-05-12 12:55:00', '2026051212550017', 9, '断舍离', 'upload/1778755689992_567.webp', 2, 35, 70, 1, '待收货', '成都市武侯区人民南路四段9号来福士广场T2-2803室', '13611112222', '赵丽', '', 7, 'bookinformation', '韵达快递:YD8901234567', '是', '', 'user', NULL);
INSERT INTO `orders` VALUES (18, '2026-05-12 13:30:00', '2026051213300018', 3, '从优秀到卓越', 'upload/1778756310324_436.png', 3, 45, 135, 1, '已完成', '武汉市洪山区光谷大道88号光谷软件园C8栋1501室', '13733334444', '孙磊', '', 8, 'bookinformation', '申通快递:ST5678901234', '是', '', 'user', NULL);
INSERT INTO `orders` VALUES (19, '2026-05-12 14:05:00', '2026051214050019', 8, '设计中的设计', 'upload/1778755835824_120.jpeg', 1, 58, 58, 1, '运输中', '重庆市渝北区金开大道1000号棕榈泉国际中心1806室', '13555556666', '周敏', '', 9, 'bookinformation', '顺丰快递:SF2345678901', '是', '', 'user', NULL);
INSERT INTO `orders` VALUES (20, '2026-05-12 15:45:00', '2026051215450020', 7, '高等数学', 'upload/1778755941370_471.jpg', 2, 42.5, 85, 1, '待发货', '西安市雁塔区科技路48号创业广场B座2201室', '13877778888', '吴涛', '', 10, 'bookinformation', NULL, '是', '', 'user', NULL);
INSERT INTO `orders` VALUES (21, '2026-05-14 19:38:24', '2026514193824368', 12, 'Python编程：从入门到实践', 'upload/1778757068702_413.png', 1, 79, 79, 1, '已支付', '西安市雁塔区科技路48号创业广场B座2201室', '13877778888', '吴涛', '', 10, 'bookinformation', NULL, '', NULL, 'user', NULL);
INSERT INTO `orders` VALUES (22, '2026-05-14 19:39:05', '202651419395162', 4, '思考,快与慢', 'upload/1778756281027_356.png', 1, 69, 69, 1, '已支付', '西安市雁塔区科技路48号创业广场B座2201室', '13877778888', '吴涛', '', 10, 'bookinformation', NULL, '', NULL, 'user', NULL);
INSERT INTO `orders` VALUES (23, '2026-05-14 19:55:50', '2026514195550546', 14, '经济学原理', 'upload/1778756968245_914.jpg', 1, 89, 89, 1, '已支付', '深圳市南山区科技园南路88号深圳湾科技生态园10栋1801室', '13722228888', '刘军', '', 4, 'bookinformation', NULL, '', NULL, 'user', NULL);
INSERT INTO `orders` VALUES (24, '2026-06-04 20:16:29', '202664201628200', 14, '经济学原理', 'upload/1778756968245_914.jpg', 1, 89, 89, 1, '已支付', '陕西省-咸阳市-渭城区-小区', '13333332423', 'wutao', '', 10, 'bookinformation', NULL, '', NULL, 'user', NULL);
INSERT INTO `orders` VALUES (25, '2026-06-04 20:18:20', '202664201819295', 4, '思考,快与慢', 'upload/1778756281027_356.png', 1, 69, 69, 1, '已支付', '西安市雁塔区科技路48号创业广场B座2201室', '13877778888', '吴涛', '', 10, 'bookinformation', NULL, '', NULL, 'user', NULL);
INSERT INTO `orders` VALUES (26, '2026-06-12 11:22:51', '2026612112246280', 14, '经济学原理', 'upload/1778756968245_914.jpg', 1, 89, 89, 1, '已支付', '西安市雁塔区科技路48号创业广场B座2201室', '13877778888', '吴涛', '', 10, 'bookinformation', NULL, '', NULL, 'user', NULL);
INSERT INTO `orders` VALUES (27, '2026-06-12 11:22:54', '2026612112253836', 14, '经济学原理', 'upload/1778756968245_914.jpg', 1, 89, 89, 1, '已支付', '西安市雁塔区科技路48号创业广场B座2201室', '13877778888', '吴涛', '', 10, 'bookinformation', NULL, '', NULL, 'user', NULL);
INSERT INTO `orders` VALUES (28, '2026-06-12 11:24:00', '202661211240232', 13, '人类简史', 'upload/1778756998181_500.webp', 1, 68, 68, 1, '已支付', '西安市雁塔区科技路48号创业广场B座2201室', '13877778888', '吴涛', '', 10, 'bookinformation', NULL, '', NULL, 'user', NULL);

-- ----------------------------
-- Table structure for storeup
-- ----------------------------
DROP TABLE IF EXISTS `storeup`;
CREATE TABLE `storeup`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `refid` bigint(20) NULL DEFAULT NULL COMMENT '外键id',
  `tablename` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '表名',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `picture` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '图片',
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '1' COMMENT '类型',
  `inteltype` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '推荐类型',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '收藏表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of storeup
-- ----------------------------
INSERT INTO `storeup` VALUES (1, '2026-05-12 11:00:00', 1, 1, 'bookinformation', '平凡的世界', 'upload/1778756677058_36.png', '1', '文学小说', '');
INSERT INTO `storeup` VALUES (2, '2026-05-12 12:30:00', 2, 2, 'bookinformation', '算法导论', 'upload/1778756499656_992.png', '1', '计算机科学', '');
INSERT INTO `storeup` VALUES (3, '2026-05-12 13:20:00', 3, 4, 'bookinformation', '思考，快与慢', 'upload/1778756281027_356.png', '1', '心理学', '');
INSERT INTO `storeup` VALUES (4, '2026-05-12 14:50:00', 4, 6, 'bookinformation', '时间简史', 'upload/1778756033444_818.jpg', '1', '自然科学', '');
INSERT INTO `storeup` VALUES (5, '2026-05-12 15:30:00', 5, 5, 'bookinformation', '万历十五年', 'upload/1778756066623_234.jpg', '1', '历史传记', '');
INSERT INTO `storeup` VALUES (6, '2026-05-12 16:00:00', 6, 10, 'bookinformation', '小王子', 'upload/1778755630864_945.jpg', '1', '儿童读物', '');
INSERT INTO `storeup` VALUES (7, '2026-05-12 17:40:00', 7, 3, 'bookinformation', '从优秀到卓越', 'upload/1778756310324_436.png', '1', '经济管理', '');
INSERT INTO `storeup` VALUES (8, '2026-05-12 18:20:00', 8, 8, 'bookinformation', '设计中的设计', 'upload/1778755835824_120.jpeg', '1', '艺术设计', '');
INSERT INTO `storeup` VALUES (9, '2026-05-12 19:50:00', 9, 9, 'bookinformation', '断舍离', 'upload/1778755689992_567.webp', '1', '生活休闲', '');
INSERT INTO `storeup` VALUES (10, '2026-05-12 20:30:00', 10, 7, 'bookinformation', '高等数学', 'upload/1778755941370_471.jpg', '1', '教育考试', '');
INSERT INTO `storeup` VALUES (11, '2026-05-12 21:20:00', 1, 6, 'bookinformation', '时间简史', 'upload/1778756033444_818.jpg', '1', '自然科学', '');
INSERT INTO `storeup` VALUES (12, '2026-05-12 22:40:00', 2, 1, 'bookinformation', '平凡的世界', 'upload/1778756677058_36.png', '1', '文学小说', '');
INSERT INTO `storeup` VALUES (13, '2026-05-12 23:00:00', 3, 10, 'bookinformation', '小王子', 'upload/1778755630864_945.jpg', '1', '儿童读物', '');
INSERT INTO `storeup` VALUES (14, '2026-05-12 08:30:00', 6, 4, 'bookinformation', '思考，快与慢', 'upload/1778756281027_356.png', '1', '心理学', '');
INSERT INTO `storeup` VALUES (15, '2026-05-12 09:40:00', 7, 5, 'bookinformation', '万历十五年', 'upload/1778756066623_234.jpg', '1', '历史传记', '');
INSERT INTO `storeup` VALUES (20, '2026-05-14 19:55:57', 4, 13, 'bookinformation', '人类简史', 'upload/1778756998181_500.webp', '21', NULL, NULL);

-- ----------------------------
-- Table structure for syslog
-- ----------------------------
DROP TABLE IF EXISTS `syslog`;
CREATE TABLE `syslog`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户操作',
  `method` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '请求方法',
  `params` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '请求参数',
  `time` bigint(20) NULL DEFAULT NULL COMMENT '请求时长(毫秒)',
  `ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'IP地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 123 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '系统日志' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of syslog
-- ----------------------------
INSERT INTO `syslog` VALUES (1, '2026-05-14 18:47:15', 'zhangwei2025', '修改图书信息', 'com.controller.BookinformationController.update()', '{\"id\":10,\"isbn\":\"9787535383549\",\"booktitle\":\"小王子\",\"bookcover\":\"upload/1778755630864_945.jpg\",\"bookclassification\":\"儿童读物\",\"author\":\"安托万·德·圣埃克苏佩里\",\"authorsnationality\":\"法国\",\"language\":\"中文\",\"publishinghouse\":\"湖北少年儿童出版社\",\"sales\":52345,\"publicationdate\":\"May 1, 2015 12:00:00 AM\",\"bookintroduction\":\"\\u003cp\\u003e全球畅销的童话经典,通过小王子的星际旅行,探讨爱、生命和人生的意义。\\u003c/p\\u003e\",\"onelimittimes\":10,\"alllimittimes\":1500,\"price\":25.0,\"thumbsupnum\":5678,\"crazilynum\":89,\"clicktime\":\"May 12, 2026 11:10:00 PM\",\"discussnum\":789,\"totalscore\":4.9,\"onshelves\":1,\"storeupnum\":2345,\"addtime\":\"May 12, 2026 10:45:00 AM\"}', 7, '127.0.0.1');
INSERT INTO `syslog` VALUES (2, '2026-05-14 18:48:14', 'zhangwei2025', '修改图书信息', 'com.controller.BookinformationController.update()', '{\"id\":9,\"isbn\":\"9787508668451\",\"booktitle\":\"断舍离\",\"bookcover\":\"upload/1778755689992_567.webp\",\"bookclassification\":\"生活休闲\",\"author\":\"山下英子\",\"authorsnationality\":\"日本\",\"language\":\"中文\",\"publishinghouse\":\"中信出版社\",\"sales\":28765,\"publicationdate\":\"Dec 1, 2016 12:00:00 AM\",\"bookintroduction\":\"\\u003cp\\u003e提倡通过整理收纳来整理内心,摆脱对物品的执念,过上简约舒适的生活方式。\\u003c/p\\u003e\",\"onelimittimes\":10,\"alllimittimes\":700,\"price\":35.0,\"thumbsupnum\":2345,\"crazilynum\":56,\"clicktime\":\"May 12, 2026 10:30:00 PM\",\"discussnum\":345,\"totalscore\":4.6,\"onshelves\":1,\"storeupnum\":1123,\"addtime\":\"May 12, 2026 10:40:00 AM\"}', 2, '127.0.0.1');
INSERT INTO `syslog` VALUES (3, '2026-05-14 18:49:19', 'zhangwei2025', '修改图书信息', 'com.controller.BookinformationController.update()', '{\"id\":8,\"isbn\":\"9787515347059\",\"booktitle\":\"设计中的设计\",\"bookcover\":\"upload/1778755754879_872.webp\",\"bookclassification\":\"艺术设计\",\"author\":\"原研哉\",\"authorsnationality\":\"日本\",\"language\":\"中文\",\"publishinghouse\":\"中国青年出版社\",\"sales\":9876,\"publicationdate\":\"Sep 1, 2016 12:00:00 AM\",\"bookintroduction\":\"\\u003cp\\u003e日本设计大师原研哉阐述设计理念和方法的著作,展现了日式设计的简约美学。\\u003c/p\\u003e\",\"onelimittimes\":8,\"alllimittimes\":350,\"price\":58.0,\"thumbsupnum\":1234,\"crazilynum\":28,\"clicktime\":\"May 12, 2026 9:00:00 PM\",\"discussnum\":189,\"totalscore\":4.7,\"onshelves\":1,\"storeupnum\":456,\"addtime\":\"May 12, 2026 10:35:00 AM\"}', 2, '127.0.0.1');
INSERT INTO `syslog` VALUES (4, '2026-05-14 18:50:41', 'zhangwei2025', '修改图书信息', 'com.controller.BookinformationController.update()', '{\"id\":8,\"isbn\":\"9787515347059\",\"booktitle\":\"设计中的设计\",\"bookcover\":\"upload/1778755835824_120.jpeg\",\"bookclassification\":\"艺术设计\",\"author\":\"原研哉\",\"authorsnationality\":\"日本\",\"language\":\"中文\",\"publishinghouse\":\"中国青年出版社\",\"sales\":9876,\"publicationdate\":\"Sep 1, 2016 12:00:00 AM\",\"bookintroduction\":\"\\u003cp\\u003e日本设计大师原研哉阐述设计理念和方法的著作,展现了日式设计的简约美学。\\u003c/p\\u003e\",\"onelimittimes\":8,\"alllimittimes\":350,\"price\":58.0,\"thumbsupnum\":1234,\"crazilynum\":28,\"clicktime\":\"May 12, 2026 9:00:00 PM\",\"discussnum\":189,\"totalscore\":4.7,\"onshelves\":1,\"storeupnum\":456,\"addtime\":\"May 12, 2026 10:35:00 AM\"}', 3, '127.0.0.1');
INSERT INTO `syslog` VALUES (5, '2026-05-14 18:51:33', 'zhangwei2025', '修改图书信息', 'com.controller.BookinformationController.update()', '{\"id\":7,\"isbn\":\"9787040458633\",\"booktitle\":\"高等数学\",\"bookcover\":\"upload/1778755891885_190.webp\",\"bookclassification\":\"教育考试\",\"author\":\"同济大学数学系\",\"authorsnationality\":\"中国\",\"language\":\"中文\",\"publishinghouse\":\"高等教育出版社\",\"sales\":45678,\"publicationdate\":\"Jun 1, 2016 12:00:00 AM\",\"bookintroduction\":\"\\u003cp\\u003e全国工科院校广泛使用的数学教材,系统讲解微积分、线性代数和概率论等基础知识。\\u003c/p\\u003e\",\"onelimittimes\":5,\"alllimittimes\":2000,\"price\":42.5,\"thumbsupnum\":890,\"crazilynum\":123,\"clicktime\":\"May 12, 2026 8:10:00 PM\",\"discussnum\":234,\"totalscore\":4.5,\"onshelves\":1,\"storeupnum\":567,\"addtime\":\"May 12, 2026 10:30:00 AM\"}', 1, '127.0.0.1');
INSERT INTO `syslog` VALUES (6, '2026-05-14 18:52:23', 'zhangwei2025', '修改图书信息', 'com.controller.BookinformationController.update()', '{\"id\":7,\"isbn\":\"9787040458633\",\"booktitle\":\"高等数学\",\"bookcover\":\"upload/1778755941370_471.jpg\",\"bookclassification\":\"教育考试\",\"author\":\"同济大学数学系\",\"authorsnationality\":\"中国\",\"language\":\"中文\",\"publishinghouse\":\"高等教育出版社\",\"sales\":45678,\"publicationdate\":\"Jun 1, 2016 12:00:00 AM\",\"bookintroduction\":\"\\u003cp\\u003e全国工科院校广泛使用的数学教材,系统讲解微积分、线性代数和概率论等基础知识。\\u003c/p\\u003e\",\"onelimittimes\":5,\"alllimittimes\":2000,\"price\":42.5,\"thumbsupnum\":890,\"crazilynum\":123,\"clicktime\":\"May 12, 2026 8:10:00 PM\",\"discussnum\":234,\"totalscore\":4.5,\"onshelves\":1,\"storeupnum\":567,\"addtime\":\"May 12, 2026 10:30:00 AM\"}', 2, '127.0.0.1');
INSERT INTO `syslog` VALUES (7, '2026-05-14 18:53:57', 'zhangwei2025', '修改图书信息', 'com.controller.BookinformationController.update()', '{\"id\":6,\"isbn\":\"9787535783448\",\"booktitle\":\"时间简史\",\"bookcover\":\"upload/1778756033444_818.jpg\",\"bookclassification\":\"自然科学\",\"author\":\"史蒂芬·霍金\",\"authorsnationality\":\"英国\",\"language\":\"中文\",\"publishinghouse\":\"湖南科学技术出版社\",\"sales\":31245,\"publicationdate\":\"Apr 1, 2015 12:00:00 AM\",\"bookintroduction\":\"\\u003cp\\u003e探索宇宙起源、结构和未来的科普经典,用通俗语言讲述深奥的物理学理论。\\u003c/p\\u003e\",\"onelimittimes\":10,\"alllimittimes\":1000,\"price\":45.0,\"thumbsupnum\":3456,\"crazilynum\":67,\"clicktime\":\"May 12, 2026 7:20:00 PM\",\"discussnum\":567,\"totalscore\":4.8,\"onshelves\":1,\"storeupnum\":1890,\"addtime\":\"May 12, 2026 10:25:00 AM\"}', 2, '127.0.0.1');
INSERT INTO `syslog` VALUES (8, '2026-05-14 18:54:30', 'zhangwei2025', '修改图书信息', 'com.controller.BookinformationController.update()', '{\"id\":5,\"isbn\":\"9787208116467\",\"booktitle\":\"万历十五年\",\"bookcover\":\"upload/1778756066623_234.jpg\",\"bookclassification\":\"历史传记\",\"author\":\"黄仁宇\",\"authorsnationality\":\"美国\",\"language\":\"中文\",\"publishinghouse\":\"生活·读书·新知三联书店\",\"sales\":23456,\"publicationdate\":\"Aug 1, 2015 12:00:00 AM\",\"bookintroduction\":\"\\u003cp\\u003e以万历十五年为切入点,展现了明代中晚期的政治生态和社会风貌,是历史研究的经典之作。\\u003c/p\\u003e\",\"onelimittimes\":10,\"alllimittimes\":800,\"price\":38.0,\"thumbsupnum\":2134,\"crazilynum\":45,\"clicktime\":\"May 12, 2026 6:30:00 PM\",\"discussnum\":445,\"totalscore\":4.9,\"onshelves\":1,\"storeupnum\":1234,\"addtime\":\"May 12, 2026 10:20:00 AM\"}', 1, '127.0.0.1');
INSERT INTO `syslog` VALUES (9, '2026-05-14 18:58:05', 'zhangwei2025', '修改图书信息', 'com.controller.BookinformationController.update()', '{\"id\":4,\"isbn\":\"9787115428691\",\"booktitle\":\"思考,快与慢\",\"bookcover\":\"upload/1778756281027_356.png\",\"bookclassification\":\"心理学\",\"author\":\"丹尼尔·卡尼曼\",\"authorsnationality\":\"美国\",\"language\":\"中文\",\"publishinghouse\":\"人民邮电出版社\",\"sales\":18934,\"publicationdate\":\"Nov 1, 2016 12:00:00 AM\",\"bookintroduction\":\"\\u003cp\\u003e诺贝尔经济学奖得主卡尼曼的代表作,揭示了人类思维的两种模式及其对决策的影响。\\u003c/p\\u003e\",\"onelimittimes\":10,\"alllimittimes\":600,\"price\":69.0,\"thumbsupnum\":1567,\"crazilynum\":34,\"clicktime\":\"May 12, 2026 5:00:00 PM\",\"discussnum\":312,\"totalscore\":4.7,\"onshelves\":1,\"storeupnum\":789,\"addtime\":\"May 12, 2026 10:15:00 AM\"}', 1, '127.0.0.1');
INSERT INTO `syslog` VALUES (10, '2026-05-14 18:58:34', 'zhangwei2025', '修改图书信息', 'com.controller.BookinformationController.update()', '{\"id\":3,\"isbn\":\"9787508648231\",\"booktitle\":\"从优秀到卓越\",\"bookcover\":\"upload/1778756310324_436.png\",\"bookclassification\":\"经济管理\",\"author\":\"吉姆·柯林斯\",\"authorsnationality\":\"美国\",\"language\":\"中文\",\"publishinghouse\":\"中信出版社\",\"sales\":12345,\"publicationdate\":\"Jun 1, 2015 12:00:00 AM\",\"bookintroduction\":\"\\u003cp\\u003e探讨了优秀企业如何实现跨越式发展,成为卓越企业的核心原则和实践方法。\\u003c/p\\u003e\",\"onelimittimes\":8,\"alllimittimes\":400,\"price\":45.0,\"thumbsupnum\":678,\"crazilynum\":15,\"clicktime\":\"May 12, 2026 4:10:00 PM\",\"discussnum\":89,\"totalscore\":4.6,\"onshelves\":1,\"storeupnum\":234,\"addtime\":\"May 12, 2026 10:10:00 AM\"}', 2, '127.0.0.1');
INSERT INTO `syslog` VALUES (11, '2026-05-14 19:01:41', 'zhangwei2025', '修改图书信息', 'com.controller.BookinformationController.update()', '{\"id\":2,\"isbn\":\"9787111544937\",\"booktitle\":\"算法导论\",\"bookcover\":\"upload/1778756499656_992.png\",\"bookclassification\":\"计算机科学\",\"author\":\"Thomas H. Cormen\",\"authorsnationality\":\"美国\",\"language\":\"中文\",\"publishinghouse\":\"机械工业出版社\",\"sales\":8562,\"publicationdate\":\"Mar 1, 2015 12:00:00 AM\",\"bookintroduction\":\"\\u003cp\\u003e全面介绍计算机算法的经典著作,涵盖排序、数据结构、图算法等内容,是计算机科学专业必备教材。\\u003c/p\\u003e\",\"onelimittimes\":5,\"alllimittimes\":300,\"price\":99.0,\"thumbsupnum\":1245,\"crazilynum\":23,\"clicktime\":\"May 12, 2026 3:20:00 PM\",\"discussnum\":234,\"totalscore\":4.9,\"onshelves\":1,\"storeupnum\":567,\"addtime\":\"May 12, 2026 10:05:00 AM\"}', 1, '127.0.0.1');
INSERT INTO `syslog` VALUES (12, '2026-05-14 19:04:41', 'zhangwei2025', '修改图书信息', 'com.controller.BookinformationController.update()', '{\"id\":1,\"isbn\":\"9787020145607\",\"booktitle\":\"平凡的世界\",\"bookcover\":\"upload/1778756677058_36.png\",\"bookclassification\":\"文学小说\",\"author\":\"路遥\",\"authorsnationality\":\"中国\",\"language\":\"中文\",\"publishinghouse\":\"人民文学出版社\",\"sales\":15823,\"publicationdate\":\"Sep 1, 2012 12:00:00 AM\",\"bookintroduction\":\"\\u003cp\\u003e一部全景式地表现中国当代城乡社会生活的长篇小说,展现了普通人在大时代历史进程中所走过的艰难曲折的道路。\\u003c/p\\u003e\",\"onelimittimes\":10,\"alllimittimes\":500,\"price\":59.8,\"thumbsupnum\":892,\"crazilynum\":12,\"clicktime\":\"May 12, 2026 2:30:00 PM\",\"discussnum\":156,\"totalscore\":4.8,\"onshelves\":1,\"storeupnum\":328,\"addtime\":\"May 12, 2026 10:00:00 AM\"}', 1, '127.0.0.1');
INSERT INTO `syslog` VALUES (13, '2026-05-14 19:09:32', 'zhangwei2025', '修改图书信息', 'com.controller.BookinformationController.update()', '{\"id\":14,\"isbn\":\"9787111605430\",\"booktitle\":\"经济学原理\",\"bookcover\":\"upload/1778756968245_914.jpg\",\"bookclassification\":\"经济管理\",\"author\":\"曼昆\",\"authorsnationality\":\"美国\",\"language\":\"中文\",\"publishinghouse\":\"北京大学出版社\",\"sales\":28765,\"publicationdate\":\"Sep 1, 2015 12:00:00 AM\",\"bookintroduction\":\"\\u003cp\\u003e经济学入门必读经典，系统讲解微观经济学和宏观经济学基本原理。\\u003c/p\\u003e\",\"onelimittimes\":5,\"alllimittimes\":400,\"price\":89.0,\"thumbsupnum\":1890,\"crazilynum\":34,\"clicktime\":\"May 13, 2026 12:30:00 AM\",\"discussnum\":345,\"totalscore\":4.6,\"onshelves\":1,\"storeupnum\":987,\"addtime\":\"May 12, 2026 11:05:00 AM\"}', 2, '127.0.0.1');
INSERT INTO `syslog` VALUES (14, '2026-05-14 19:10:02', 'zhangwei2025', '修改图书信息', 'com.controller.BookinformationController.update()', '{\"id\":13,\"isbn\":\"9787508678932\",\"booktitle\":\"人类简史\",\"bookcover\":\"upload/1778756998181_500.webp\",\"bookclassification\":\"历史传记\",\"author\":\"尤瓦尔·赫拉利\",\"authorsnationality\":\"以色列\",\"language\":\"中文\",\"publishinghouse\":\"中信出版社\",\"sales\":45678,\"publicationdate\":\"Mar 1, 2017 12:00:00 AM\",\"bookintroduction\":\"\\u003cp\\u003e从十万年前到21世纪，全景式展现人类发展史，探讨人类如何从普通动物成为地球主宰。\\u003c/p\\u003e\",\"onelimittimes\":10,\"alllimittimes\":600,\"price\":68.0,\"thumbsupnum\":4567,\"crazilynum\":89,\"clicktime\":\"May 13, 2026 12:10:00 AM\",\"discussnum\":678,\"totalscore\":4.9,\"onshelves\":1,\"storeupnum\":1890,\"addtime\":\"May 12, 2026 11:00:00 AM\"}', 2, '127.0.0.1');
INSERT INTO `syslog` VALUES (15, '2026-05-14 19:11:13', 'zhangwei2025', '修改图书信息', 'com.controller.BookinformationController.update()', '{\"id\":12,\"isbn\":\"9787115428234\",\"booktitle\":\"Python编程：从入门到实践\",\"bookcover\":\"upload/1778757068702_413.png\",\"bookclassification\":\"计算机科学\",\"author\":\"Eric Matthes\",\"authorsnationality\":\"美国\",\"language\":\"中文\",\"publishinghouse\":\"人民邮电出版社\",\"sales\":34567,\"publicationdate\":\"Jul 1, 2016 12:00:00 AM\",\"bookintroduction\":\"\\u003cp\\u003ePython入门经典教程，通过实践项目帮助读者快速掌握Python编程技能。\\u003c/p\\u003e\",\"onelimittimes\":8,\"alllimittimes\":500,\"price\":79.0,\"thumbsupnum\":2345,\"crazilynum\":45,\"clicktime\":\"May 12, 2026 11:50:00 PM\",\"discussnum\":456,\"totalscore\":4.7,\"onshelves\":1,\"storeupnum\":1234,\"addtime\":\"May 12, 2026 10:55:00 AM\"}', 2, '127.0.0.1');
INSERT INTO `syslog` VALUES (16, '2026-05-14 19:11:45', 'zhangwei2025', '修改图书信息', 'com.controller.BookinformationController.update()', '{\"id\":11,\"isbn\":\"9787544277822\",\"booktitle\":\"活着\",\"bookcover\":\"upload/1778757097896_972.jpg\",\"bookclassification\":\"文学小说\",\"author\":\"余华\",\"authorsnationality\":\"中国\",\"language\":\"中文\",\"publishinghouse\":\"作家出版社\",\"sales\":67890,\"publicationdate\":\"Aug 1, 2012 12:00:00 AM\",\"bookintroduction\":\"\\u003cp\\u003e讲述了一个人一生的故事，展现了生命的脆弱与坚韧，是对生存意义的深刻思考。\\u003c/p\\u003e\",\"onelimittimes\":10,\"alllimittimes\":800,\"price\":32.0,\"thumbsupnum\":6789,\"crazilynum\":78,\"clicktime\":\"May 12, 2026 11:30:00 PM\",\"discussnum\":890,\"totalscore\":4.8,\"onshelves\":1,\"storeupnum\":2678,\"addtime\":\"May 12, 2026 10:50:00 AM\"}', 1, '127.0.0.1');
INSERT INTO `syslog` VALUES (38, '2026-05-14 19:25:05', 'zhangwei2025', '修改销量预测', 'com.controller.BookinformationforecastController.update()', '{\"id\":14,\"booktitle\":\"经济学原理\",\"price\":89.0,\"sales\":2950,\"addtime\":\"May 12, 2026 3:05:00 PM\"}', 1, '127.0.0.1');
INSERT INTO `syslog` VALUES (39, '2026-05-14 19:25:09', 'zhangwei2025', '修改销量预测', 'com.controller.BookinformationforecastController.update()', '{\"id\":13,\"booktitle\":\"人类简史\",\"price\":68.0,\"sales\":4680,\"addtime\":\"May 12, 2026 3:00:00 PM\"}', 2, '127.0.0.1');
INSERT INTO `syslog` VALUES (40, '2026-05-14 19:38:18', 'wutao_history', '新增购物车表', 'com.controller.CartController.save()', '{\"id\":1,\"tablename\":\"bookinformation\",\"userid\":10,\"goodid\":12,\"goodname\":\"Python编程：从入门到实践\",\"picture\":\"upload/1778757068702_413.png\",\"buynumber\":1,\"price\":79.0}', 7, '127.0.0.1');
INSERT INTO `syslog` VALUES (41, '2026-05-14 19:38:24', 'wutao_history', '修改图书信息', 'com.controller.BookinformationController.update()', '{\"id\":12,\"isbn\":\"9787115428234\",\"booktitle\":\"Python编程：从入门到实践\",\"bookcover\":\"upload/1778757068702_413.png\",\"bookclassification\":\"计算机科学\",\"author\":\"Eric Matthes\",\"authorsnationality\":\"美国\",\"language\":\"中文\",\"publishinghouse\":\"人民邮电出版社\",\"sales\":34567,\"publicationdate\":\"Jul 1, 2016 12:00:00 AM\",\"bookintroduction\":\"\\u003cp\\u003ePython入门经典教程，通过实践项目帮助读者快速掌握Python编程技能。\\u003c/p\\u003e\",\"onelimittimes\":8,\"alllimittimes\":499,\"price\":79.0,\"thumbsupnum\":2345,\"crazilynum\":45,\"clicktime\":\"May 11, 2026 11:50:00 PM\",\"discussnum\":456,\"totalscore\":4.7,\"onshelves\":1,\"storeupnum\":1234,\"addtime\":\"May 12, 2026 10:55:00 AM\"}', 2, '127.0.0.1');
INSERT INTO `syslog` VALUES (42, '2026-05-14 19:38:24', 'wutao_history', '新增订单', 'com.controller.OrdersController.add()', '{\"id\":21,\"orderid\":\"2026514193824368\",\"goodid\":12,\"goodname\":\"Python编程：从入门到实践\",\"picture\":\"upload/1778757068702_413.png\",\"buynumber\":1,\"price\":79.0,\"total\":79.0,\"type\":1,\"status\":\"未支付\",\"address\":\"西安市雁塔区科技路48号创业广场B座2201室\",\"tel\":\"13877778888\",\"consignee\":\"吴涛\",\"remark\":\"\",\"userid\":10,\"tablename\":\"bookinformation\",\"sfsh\":\"\",\"role\":\"user\"}', 7, '127.0.0.1');
INSERT INTO `syslog` VALUES (43, '2026-05-14 19:38:24', 'wutao_history', '修改订单', 'com.controller.OrdersController.update()', '{\"id\":21,\"orderid\":\"2026514193824368\",\"goodid\":12,\"goodname\":\"Python编程：从入门到实践\",\"picture\":\"upload/1778757068702_413.png\",\"buynumber\":1,\"price\":79.0,\"total\":79.0,\"type\":1,\"status\":\"已支付\",\"address\":\"西安市雁塔区科技路48号创业广场B座2201室\",\"tel\":\"13877778888\",\"consignee\":\"吴涛\",\"remark\":\"\",\"userid\":10,\"tablename\":\"bookinformation\",\"sfsh\":\"\",\"role\":\"user\"}', 6, '127.0.0.1');
INSERT INTO `syslog` VALUES (44, '2026-05-14 19:38:48', 'wutao_history', '新增购物车表', 'com.controller.CartController.save()', '{\"id\":2,\"tablename\":\"bookinformation\",\"userid\":10,\"goodid\":1,\"goodname\":\"平凡的世界\",\"picture\":\"upload/1778756677058_36.png\",\"buynumber\":1,\"price\":59.8}', 3, '127.0.0.1');
INSERT INTO `syslog` VALUES (45, '2026-05-14 19:38:55', 'wutao_history', '新增购物车表', 'com.controller.CartController.save()', '{\"id\":3,\"tablename\":\"bookinformation\",\"userid\":10,\"goodid\":4,\"goodname\":\"思考,快与慢\",\"picture\":\"upload/1778756281027_356.png\",\"buynumber\":1,\"price\":69.0}', 2, '127.0.0.1');
INSERT INTO `syslog` VALUES (46, '2026-05-14 19:39:05', 'wutao_history', '修改图书信息', 'com.controller.BookinformationController.update()', '{\"id\":4,\"isbn\":\"9787115428691\",\"booktitle\":\"思考,快与慢\",\"bookcover\":\"upload/1778756281027_356.png\",\"bookclassification\":\"心理学\",\"author\":\"丹尼尔·卡尼曼\",\"authorsnationality\":\"美国\",\"language\":\"中文\",\"publishinghouse\":\"人民邮电出版社\",\"sales\":18934,\"publicationdate\":\"Nov 1, 2016 12:00:00 AM\",\"bookintroduction\":\"\\u003cp\\u003e诺贝尔经济学奖得主卡尼曼的代表作,揭示了人类思维的两种模式及其对决策的影响。\\u003c/p\\u003e\",\"onelimittimes\":10,\"alllimittimes\":599,\"price\":69.0,\"thumbsupnum\":1567,\"crazilynum\":34,\"clicktime\":\"May 12, 2026 5:00:00 PM\",\"discussnum\":312,\"totalscore\":4.7,\"onshelves\":1,\"storeupnum\":789,\"addtime\":\"May 12, 2026 10:15:00 AM\"}', 7, '127.0.0.1');
INSERT INTO `syslog` VALUES (47, '2026-05-14 19:39:05', 'wutao_history', '新增订单', 'com.controller.OrdersController.add()', '{\"id\":22,\"orderid\":\"202651419395162\",\"goodid\":4,\"goodname\":\"思考,快与慢\",\"picture\":\"upload/1778756281027_356.png\",\"buynumber\":1,\"price\":69.0,\"total\":69.0,\"type\":1,\"status\":\"未支付\",\"address\":\"西安市雁塔区科技路48号创业广场B座2201室\",\"tel\":\"13877778888\",\"consignee\":\"吴涛\",\"remark\":\"\",\"userid\":10,\"tablename\":\"bookinformation\",\"sfsh\":\"\",\"role\":\"user\"}', 180, '127.0.0.1');
INSERT INTO `syslog` VALUES (48, '2026-05-14 19:39:05', 'wutao_history', '删除购物车表', 'com.controller.CartController.delete()', '[3]', 8, '127.0.0.1');
INSERT INTO `syslog` VALUES (49, '2026-05-14 19:39:05', 'wutao_history', '修改订单', 'com.controller.OrdersController.update()', '{\"id\":22,\"orderid\":\"202651419395162\",\"goodid\":4,\"goodname\":\"思考,快与慢\",\"picture\":\"upload/1778756281027_356.png\",\"buynumber\":1,\"price\":69.0,\"total\":69.0,\"type\":1,\"status\":\"已支付\",\"address\":\"西安市雁塔区科技路48号创业广场B座2201室\",\"tel\":\"13877778888\",\"consignee\":\"吴涛\",\"remark\":\"\",\"userid\":10,\"tablename\":\"bookinformation\",\"sfsh\":\"\",\"role\":\"user\"}', 2, '127.0.0.1');
INSERT INTO `syslog` VALUES (50, '2026-05-14 19:39:12', 'wutao_history', '新增购物车表', 'com.controller.CartController.save()', '{\"id\":4,\"tablename\":\"bookinformation\",\"userid\":10,\"goodid\":13,\"goodname\":\"人类简史\",\"picture\":\"upload/1778756998181_500.webp\",\"buynumber\":1,\"price\":68.0}', 3, '127.0.0.1');
INSERT INTO `syslog` VALUES (51, '2026-05-14 19:39:27', 'wutao_history', '新增收藏表', 'com.controller.StoreupController.add()', '{\"id\":16,\"userid\":10,\"refid\":13,\"tablename\":\"bookinformation\",\"name\":\"人类简史\",\"picture\":\"upload/1778756998181_500.webp\",\"type\":\"1\"}', 4, '127.0.0.1');
INSERT INTO `syslog` VALUES (52, '2026-05-14 19:39:27', 'wutao_history', '修改图书信息', 'com.controller.BookinformationController.update()', '{\"id\":13,\"isbn\":\"9787508678932\",\"booktitle\":\"人类简史\",\"bookcover\":\"upload/1778756998181_500.webp\",\"bookclassification\":\"历史传记\",\"author\":\"尤瓦尔·赫拉利\",\"authorsnationality\":\"以色列\",\"language\":\"中文\",\"publishinghouse\":\"中信出版社\",\"sales\":45678,\"publicationdate\":\"Mar 1, 2017 12:00:00 AM\",\"bookintroduction\":\"\\u003cp\\u003e从十万年前到21世纪，全景式展现人类发展史，探讨人类如何从普通动物成为地球主宰。\\u003c/p\\u003e\",\"onelimittimes\":10,\"alllimittimes\":600,\"price\":68.0,\"thumbsupnum\":4567,\"crazilynum\":89,\"clicktime\":\"May 11, 2026 12:10:00 AM\",\"discussnum\":678,\"totalscore\":4.9,\"onshelves\":1,\"storeupnum\":1891,\"addtime\":\"May 12, 2026 11:00:00 AM\"}', 2, '127.0.0.1');
INSERT INTO `syslog` VALUES (53, '2026-05-14 19:48:20', 'wutao', '新增收藏表', 'com.controller.StoreupController.add()', '{\"id\":17,\"userid\":10,\"refid\":9,\"tablename\":\"bookpreview\",\"name\":\"断舍离\",\"picture\":\"upload/1778755689992_567.webp\",\"type\":\"1\"}', 6, '127.0.0.1');
INSERT INTO `syslog` VALUES (54, '2026-05-14 19:48:20', 'wutao', '修改图书试看', 'com.controller.BookpreviewController.update()', '{\"id\":9,\"isbn\":\"9787508668451\",\"booktitle\":\"断舍离\",\"bookclassification\":\"生活休闲\",\"author\":\"山下英子\",\"authorsnationality\":\"日本\",\"language\":\"中文\",\"publishinghouse\":\"中信出版社\",\"publicationdate\":\"2016-12-01\",\"bookcover\":\"upload/1778755689992_567.webp\",\"bookintroduction\":\"\\u003cp\\u003e提倡通过整理收纳来整理内心,摆脱对物品的执念,过上简约舒适的生活方式。\\u003c/p\\u003e\",\"thumbsupnum\":345,\"crazilynum\":28,\"storeupnum\":679,\"addtime\":\"May 12, 2026 10:40:00 AM\"}', 4, '127.0.0.1');
INSERT INTO `syslog` VALUES (55, '2026-05-14 19:48:32', 'wutao', '删除收藏表', 'com.controller.StoreupController.delete()', '[10]', 6, '127.0.0.1');
INSERT INTO `syslog` VALUES (56, '2026-05-14 19:48:32', 'wutao', '修改图书信息', 'com.controller.BookinformationController.update()', '{\"id\":7,\"isbn\":\"9787040458633\",\"booktitle\":\"高等数学\",\"bookcover\":\"upload/1778755941370_471.jpg\",\"bookclassification\":\"教育考试\",\"author\":\"同济大学数学系\",\"authorsnationality\":\"中国\",\"language\":\"中文\",\"publishinghouse\":\"高等教育出版社\",\"sales\":45678,\"publicationdate\":\"Jun 1, 2016 12:00:00 AM\",\"bookintroduction\":\"\\u003cp\\u003e全国工科院校广泛使用的数学教材,系统讲解微积分、线性代数和概率论等基础知识。\\u003c/p\\u003e\",\"onelimittimes\":5,\"alllimittimes\":2000,\"price\":42.5,\"thumbsupnum\":890,\"crazilynum\":123,\"clicktime\":\"May 12, 2026 8:10:00 PM\",\"discussnum\":234,\"totalscore\":4.5,\"onshelves\":1,\"storeupnum\":566,\"addtime\":\"May 12, 2026 10:30:00 AM\"}', 4, '127.0.0.1');
INSERT INTO `syslog` VALUES (57, '2026-05-14 19:49:57', 'zhoumin_artist ', '新增购物车表', 'com.controller.CartController.save()', '{\"id\":5,\"tablename\":\"bookinformation\",\"userid\":9,\"goodid\":14,\"goodname\":\"经济学原理\",\"picture\":\"upload/1778756968245_914.jpg\",\"buynumber\":1,\"price\":89.0}', 5, '127.0.0.1');
INSERT INTO `syslog` VALUES (58, '2026-05-14 19:50:01', 'zhoumin_artist ', '新增购物车表', 'com.controller.CartController.save()', '{\"id\":6,\"tablename\":\"bookinformation\",\"userid\":9,\"goodid\":13,\"goodname\":\"人类简史\",\"picture\":\"upload/1778756998181_500.webp\",\"buynumber\":1,\"price\":68.0}', 3, '127.0.0.1');
INSERT INTO `syslog` VALUES (59, '2026-05-14 19:50:25', 'zhoumin_artist ', '新增收藏表', 'com.controller.StoreupController.add()', '{\"id\":18,\"userid\":9,\"refid\":12,\"tablename\":\"bookinformation\",\"name\":\"Python编程：从入门到实践\",\"picture\":\"upload/1778757068702_413.png\",\"type\":\"22\"}', 4, '127.0.0.1');
INSERT INTO `syslog` VALUES (60, '2026-05-14 19:50:25', 'zhoumin_artist ', '修改图书信息', 'com.controller.BookinformationController.update()', '{\"id\":12,\"isbn\":\"9787115428234\",\"booktitle\":\"Python编程：从入门到实践\",\"bookcover\":\"upload/1778757068702_413.png\",\"bookclassification\":\"计算机科学\",\"author\":\"Eric Matthes\",\"authorsnationality\":\"美国\",\"language\":\"中文\",\"publishinghouse\":\"人民邮电出版社\",\"sales\":34567,\"publicationdate\":\"Jul 1, 2016 12:00:00 AM\",\"bookintroduction\":\"\\u003cp\\u003ePython入门经典教程，通过实践项目帮助读者快速掌握Python编程技能。\\u003c/p\\u003e\",\"onelimittimes\":8,\"alllimittimes\":499,\"price\":79.0,\"thumbsupnum\":2345,\"crazilynum\":46,\"clicktime\":\"May 11, 2026 11:50:00 PM\",\"discussnum\":456,\"totalscore\":4.7,\"onshelves\":1,\"storeupnum\":1234,\"addtime\":\"May 12, 2026 10:55:00 AM\"}', 2, '127.0.0.1');
INSERT INTO `syslog` VALUES (61, '2026-05-14 19:50:59', 'zhoumin_artist ', '新增收藏表', 'com.controller.StoreupController.add()', '{\"id\":19,\"userid\":9,\"refid\":7,\"tablename\":\"bookinformation\",\"name\":\"高等数学\",\"picture\":\"upload/1778755941370_471.jpg\",\"type\":\"21\"}', 4, '127.0.0.1');
INSERT INTO `syslog` VALUES (62, '2026-05-14 19:50:59', 'zhoumin_artist ', '修改图书信息', 'com.controller.BookinformationController.update()', '{\"id\":7,\"isbn\":\"9787040458633\",\"booktitle\":\"高等数学\",\"bookcover\":\"upload/1778755941370_471.jpg\",\"bookclassification\":\"教育考试\",\"author\":\"同济大学数学系\",\"authorsnationality\":\"中国\",\"language\":\"中文\",\"publishinghouse\":\"高等教育出版社\",\"sales\":45678,\"publicationdate\":\"Jun 1, 2016 12:00:00 AM\",\"bookintroduction\":\"\\u003cp\\u003e全国工科院校广泛使用的数学教材,系统讲解微积分、线性代数和概率论等基础知识。\\u003c/p\\u003e\",\"onelimittimes\":5,\"alllimittimes\":2000,\"price\":42.5,\"thumbsupnum\":891,\"crazilynum\":123,\"clicktime\":\"May 12, 2026 8:10:00 PM\",\"discussnum\":234,\"totalscore\":4.5,\"onshelves\":1,\"storeupnum\":566,\"addtime\":\"May 12, 2026 10:30:00 AM\"}', 2, '127.0.0.1');
INSERT INTO `syslog` VALUES (63, '2026-05-14 19:55:46', 'liujun_tech', '新增购物车表', 'com.controller.CartController.save()', '{\"id\":7,\"tablename\":\"bookinformation\",\"userid\":4,\"goodid\":14,\"goodname\":\"经济学原理\",\"picture\":\"upload/1778756968245_914.jpg\",\"buynumber\":1,\"price\":89.0}', 3, '127.0.0.1');
INSERT INTO `syslog` VALUES (64, '2026-05-14 19:55:51', 'liujun_tech', '修改图书信息', 'com.controller.BookinformationController.update()', '{\"id\":14,\"isbn\":\"9787111605430\",\"booktitle\":\"经济学原理\",\"bookcover\":\"upload/1778756968245_914.jpg\",\"bookclassification\":\"经济管理\",\"author\":\"曼昆\",\"authorsnationality\":\"美国\",\"language\":\"中文\",\"publishinghouse\":\"北京大学出版社\",\"sales\":28765,\"publicationdate\":\"Sep 1, 2015 12:00:00 AM\",\"bookintroduction\":\"\\u003cp\\u003e经济学入门必读经典，系统讲解微观经济学和宏观经济学基本原理。\\u003c/p\\u003e\",\"onelimittimes\":5,\"alllimittimes\":399,\"price\":89.0,\"thumbsupnum\":1890,\"crazilynum\":34,\"clicktime\":\"May 11, 2026 12:30:00 AM\",\"discussnum\":345,\"totalscore\":4.6,\"onshelves\":1,\"storeupnum\":987,\"addtime\":\"May 12, 2026 11:05:00 AM\"}', 2, '127.0.0.1');
INSERT INTO `syslog` VALUES (65, '2026-05-14 19:55:51', 'liujun_tech', '新增订单', 'com.controller.OrdersController.add()', '{\"id\":23,\"orderid\":\"2026514195550546\",\"goodid\":14,\"goodname\":\"经济学原理\",\"picture\":\"upload/1778756968245_914.jpg\",\"buynumber\":1,\"price\":89.0,\"total\":89.0,\"type\":1,\"status\":\"未支付\",\"address\":\"深圳市南山区科技园南路88号深圳湾科技生态园10栋1801室\",\"tel\":\"13722228888\",\"consignee\":\"刘军\",\"remark\":\"\",\"userid\":4,\"tablename\":\"bookinformation\",\"sfsh\":\"\",\"role\":\"user\"}', 3, '127.0.0.1');
INSERT INTO `syslog` VALUES (66, '2026-05-14 19:55:51', 'liujun_tech', '修改订单', 'com.controller.OrdersController.update()', '{\"id\":23,\"orderid\":\"2026514195550546\",\"goodid\":14,\"goodname\":\"经济学原理\",\"picture\":\"upload/1778756968245_914.jpg\",\"buynumber\":1,\"price\":89.0,\"total\":89.0,\"type\":1,\"status\":\"已支付\",\"address\":\"深圳市南山区科技园南路88号深圳湾科技生态园10栋1801室\",\"tel\":\"13722228888\",\"consignee\":\"刘军\",\"remark\":\"\",\"userid\":4,\"tablename\":\"bookinformation\",\"sfsh\":\"\",\"role\":\"user\"}', 4, '127.0.0.1');
INSERT INTO `syslog` VALUES (67, '2026-05-14 19:55:58', 'liujun_tech', '新增收藏表', 'com.controller.StoreupController.add()', '{\"id\":20,\"userid\":4,\"refid\":13,\"tablename\":\"bookinformation\",\"name\":\"人类简史\",\"picture\":\"upload/1778756998181_500.webp\",\"type\":\"21\"}', 4, '127.0.0.1');
INSERT INTO `syslog` VALUES (68, '2026-05-14 19:55:58', 'liujun_tech', '修改图书信息', 'com.controller.BookinformationController.update()', '{\"id\":13,\"isbn\":\"9787508678932\",\"booktitle\":\"人类简史\",\"bookcover\":\"upload/1778756998181_500.webp\",\"bookclassification\":\"历史传记\",\"author\":\"尤瓦尔·赫拉利\",\"authorsnationality\":\"以色列\",\"language\":\"中文\",\"publishinghouse\":\"中信出版社\",\"sales\":45678,\"publicationdate\":\"Mar 1, 2017 12:00:00 AM\",\"bookintroduction\":\"\\u003cp\\u003e从十万年前到21世纪，全景式展现人类发展史，探讨人类如何从普通动物成为地球主宰。\\u003c/p\\u003e\",\"onelimittimes\":10,\"alllimittimes\":600,\"price\":68.0,\"thumbsupnum\":4568,\"crazilynum\":89,\"clicktime\":\"May 11, 2026 12:10:00 AM\",\"discussnum\":678,\"totalscore\":4.9,\"onshelves\":1,\"storeupnum\":1891,\"addtime\":\"May 12, 2026 11:00:00 AM\"}', 2, '127.0.0.1');
INSERT INTO `syslog` VALUES (69, '2026-05-14 19:55:59', 'liujun_tech', '新增购物车表', 'com.controller.CartController.save()', '{\"id\":8,\"tablename\":\"bookinformation\",\"userid\":4,\"goodid\":13,\"goodname\":\"人类简史\",\"picture\":\"upload/1778756998181_500.webp\",\"buynumber\":1,\"price\":68.0}', 3, '127.0.0.1');
INSERT INTO `syslog` VALUES (70, '2026-05-17 16:24:23', 'wutao', '新增bookpreview书签表', 'com.controller.BookmarkbookpreviewController.add()', '{\"id\":26,\"chapterid\":61,\"chapternum\":4,\"chaptertitle\":\"第四章 市场与福利\",\"userid\":10,\"progress\":0}', 18, '0:0:0:0:0:0:0:1');
INSERT INTO `syslog` VALUES (71, '2026-05-17 16:25:07', 'wutao', '新增bookpreview书签表', 'com.controller.BookmarkbookpreviewController.add()', '{\"id\":27,\"chapterid\":50,\"chapternum\":1,\"chaptertitle\":\"第一章 Python入门\",\"userid\":10,\"progress\":0}', 3, '0:0:0:0:0:0:0:1');
INSERT INTO `syslog` VALUES (72, '2026-05-17 16:25:30', 'wutao', '新增bookpreview书签表', 'com.controller.BookmarkbookpreviewController.add()', '{\"id\":28,\"chapterid\":53,\"chapternum\":4,\"chaptertitle\":\"第四章 函数和模块\",\"userid\":10,\"progress\":0}', 5, '0:0:0:0:0:0:0:1');
INSERT INTO `syslog` VALUES (73, '2026-05-17 16:35:37', 'admin', '删除图书试看章节', 'com.controller.ChaptertushushikanController.delete()', '[61]', 15, '0:0:0:0:0:0:0:1');
INSERT INTO `syslog` VALUES (74, '2026-05-17 20:04:40', 'admin', '修改图书公告', 'com.controller.BookannouncementController.update()', '{\"id\":5,\"title\":\"图书捐赠活动招募\",\"picture\":\"upload/1779019477283_300.jpg\",\"publisher\":\"图书馆办公室\",\"introduction\":\"闲置图书捐赠征集\",\"content\":\"\\u003cp\\u003e图书捐赠活动招募读者捐赠闲置正版图书要求无涂无缺页捐赠后可获捐赠证书及借阅特权捐赠图书将纳入馆藏供读者借阅\\u003c/p\\u003e\",\"clicktime\":\"May 13, 2026 5:47:03 PM\",\"storeupnum\":5,\"addtime\":\"May 13, 2026 9:47:03 AM\"}', 8, '127.0.0.1');
INSERT INTO `syslog` VALUES (75, '2026-05-17 20:05:20', 'admin', '修改图书公告', 'com.controller.BookannouncementController.update()', '{\"id\":8,\"title\":\"世界读书日预热活动\",\"picture\":\"upload/1779019518645_358.jpg\",\"publisher\":\"图书馆办公室\",\"introduction\":\"读书日活动预告\",\"content\":\"\\u003cp\\u003e世界读书日预热活动启动10月25日至11月23日参与图书打卡分享活动可积累积分兑换读书日专属礼品包括图书文创等\\u003c/p\\u003e\",\"clicktime\":\"May 13, 2026 5:47:03 PM\",\"storeupnum\":8,\"addtime\":\"May 13, 2026 9:47:03 AM\"}', 4, '127.0.0.1');
INSERT INTO `syslog` VALUES (76, '2026-05-17 20:05:48', 'admin', '修改图书公告', 'com.controller.BookannouncementController.update()', '{\"id\":7,\"title\":\"图书修补服务开通\",\"picture\":\"upload/bookannouncement_picture7.jpg\",\"publisher\":\"图书馆技术部\",\"introduction\":\"破损图书免费修补\",\"content\":\"\\u003cp\\u003e图书馆开通图书修补服务读者可将破损图书送至一楼服务台工作人员免费修补包括封面修复内页粘贴等修补完成后通知领取\\u003c/p\\u003e\",\"clicktime\":\"May 13, 2026 5:47:03 PM\",\"storeupnum\":7,\"addtime\":\"May 13, 2026 9:47:03 AM\"}', 2, '127.0.0.1');
INSERT INTO `syslog` VALUES (77, '2026-05-17 20:05:58', 'admin', '修改图书公告', 'com.controller.BookannouncementController.update()', '{\"id\":6,\"title\":\"盲文图书借阅服务开通\",\"picture\":\"upload/bookannouncement_picture6.jpg\",\"publisher\":\"图书馆特藏部\",\"introduction\":\"视障读者借阅服务\",\"content\":\"\\u003cp\\u003e盲文图书借阅服务正式开通新增50册盲文图书涵盖文学科普教育等类别视障读者可凭借相关证件借阅提供上门送书服务\\u003c/p\\u003e\",\"clicktime\":\"May 13, 2026 5:47:03 PM\",\"storeupnum\":6,\"addtime\":\"May 13, 2026 9:47:03 AM\"}', 3, '127.0.0.1');
INSERT INTO `syslog` VALUES (78, '2026-05-17 20:06:36', 'admin', '修改图书公告', 'com.controller.BookannouncementController.update()', '{\"id\":4,\"title\":\"旧书置换活动启动\",\"picture\":\"upload/1779019594030_903.jpg\",\"publisher\":\"图书馆读者协会\",\"introduction\":\"闲置图书相互置换\",\"content\":\"\\u003cp\\u003e旧书置换活动启动11月1日至11月7日读者可携带闲置图书到图书馆广场置换其他图书每本限换1本需为正版无破损图书\\u003c/p\\u003e\",\"clicktime\":\"May 13, 2026 5:47:03 PM\",\"storeupnum\":4,\"addtime\":\"May 13, 2026 9:47:03 AM\"}', 2, '127.0.0.1');
INSERT INTO `syslog` VALUES (79, '2026-05-17 20:07:32', 'admin', '修改图书公告', 'com.controller.BookannouncementController.update()', '{\"id\":3,\"title\":\"逾期图书免罚活动\",\"picture\":\"upload/1779019650410_746.webp\",\"publisher\":\"图书馆读者服务部\",\"introduction\":\"逾期图书免逾期费\",\"content\":\"\\u003cp\\u003e10月25日至10月31日期间归还逾期图书可免缴逾期费超期30天以上图书也可享受该政策鼓励读者及时还书\\u003c/p\\u003e\",\"clicktime\":\"May 13, 2026 5:47:03 PM\",\"storeupnum\":3,\"addtime\":\"May 13, 2026 9:47:03 AM\"}', 2, '127.0.0.1');
INSERT INTO `syslog` VALUES (80, '2026-05-17 20:07:45', 'admin', '修改图书公告', 'com.controller.BookannouncementController.update()', '{\"id\":1,\"title\":\"图书借阅积分翻倍活动\",\"picture\":\"upload/bookannouncement_picture1.jpg\",\"publisher\":\"图书馆读者服务部\",\"introduction\":\"借阅图书积分翻倍\",\"content\":\"\\u003cp\\u003e10月25日至11月10日期间读者借阅图书可享积分翻倍每借阅1本获2积分积分可兑换书签借阅特权等礼品\\u003c/p\\u003e\",\"clicktime\":\"May 13, 2026 5:47:03 PM\",\"storeupnum\":1,\"addtime\":\"May 13, 2026 9:47:03 AM\"}', 1, '127.0.0.1');
INSERT INTO `syslog` VALUES (81, '2026-05-17 20:08:20', 'admin', '修改图书公告', 'com.controller.BookannouncementController.update()', '{\"id\":2,\"title\":\"电子图书免费阅读活动\",\"picture\":\"upload/bookannouncement_picture2.jpg\",\"publisher\":\"图书馆信息技术部\",\"introduction\":\"万册电子图书免费读\",\"content\":\"\\u003cp\\u003e图书馆电子数据库新增万册免费电子图书涵盖小说科普教育等类别读者可登录官网或APP免费阅读下载支持离线缓存\\u003c/p\\u003e\",\"clicktime\":\"May 13, 2026 5:47:03 PM\",\"storeupnum\":2,\"addtime\":\"May 13, 2026 9:47:03 AM\"}', 2, '127.0.0.1');
INSERT INTO `syslog` VALUES (82, '2026-05-17 20:09:21', 'admin', '修改图书公告', 'com.controller.BookannouncementController.update()', '{\"id\":2,\"title\":\"电子图书免费阅读活动\",\"picture\":\"upload/1779019757932_522.jpg\",\"publisher\":\"图书馆信息技术部\",\"introduction\":\"万册电子图书免费读\",\"content\":\"\\u003cp\\u003e图书馆电子数据库新增万册免费电子图书涵盖小说科普教育等类别读者可登录官网或APP免费阅读下载支持离线缓存\\u003c/p\\u003e\",\"clicktime\":\"May 13, 2026 5:47:03 PM\",\"storeupnum\":2,\"addtime\":\"May 13, 2026 9:47:03 AM\"}', 2, '127.0.0.1');
INSERT INTO `syslog` VALUES (83, '2026-05-20 18:49:17', 'admin', '删除图书公告', 'com.controller.BookannouncementController.delete()', '[1]', 219, '0:0:0:0:0:0:0:1');
INSERT INTO `syslog` VALUES (84, '2026-05-20 18:52:03', 'admin', '修改图书公告', 'com.controller.BookannouncementController.update()', '{\"id\":2,\"title\":\"开启阅读之旅\",\"picture\":\"upload/1779274317152_317.jpg\",\"publisher\":\"图书馆信息技术部\",\"introduction\":\"\",\"content\":\"\\u003cp\\u003e亲爱的读者：\\u003c/p\\u003e\\u003cp\\u003e\\u003cbr\\u003e\\u003c/p\\u003e\\u003cp\\u003e为丰富网站图书资源，满足广大文学爱好者的阅读与选购需求，本站近期对文学类图书进行了全面补充更新。本次新增书籍涵盖多本中外经典名著，内容丰富、品类齐全，已全部完成上架。\\u003c/p\\u003e\\u003cp\\u003e\\u003cbr\\u003e\\u003c/p\\u003e\\u003cp\\u003e欢迎各位读者登录网站浏览选购，开启阅读之旅。\\u003c/p\\u003e\\u003cp\\u003e\\u003cbr\\u003e\\u003c/p\\u003e\\u003cp\\u003e特此公告。\\u003c/p\\u003e\",\"clicktime\":\"May 13, 2026 5:47:03 PM\",\"storeupnum\":2,\"addtime\":\"May 13, 2026 9:47:03 AM\"}', 273, '0:0:0:0:0:0:0:1');
INSERT INTO `syslog` VALUES (85, '2026-05-20 18:53:49', 'admin', '修改图书公告', 'com.controller.BookannouncementController.update()', '{\"id\":3,\"title\":\"系统维护公告\",\"picture\":\"upload/1779274427174_671.jpg\",\"publisher\":\"图书运维部\",\"introduction\":\"系统维护公告\",\"content\":\"\\u003cp\\u003e平台将于4月10日凌晨进行系统升级\\u003c/p\\u003e\\u003cp\\u003e通知内容：为保障平台稳定运行，优化用户体验，本平台将于2026年4月10日00:00-06:00进行系统维护升级。维护期间，平台部分功能将暂时无法使用，给您带来的不便，敬请谅解。升级完成后，我们将第一时间恢复服务，感谢您的支持。\\u003c/p\\u003e\",\"clicktime\":\"May 13, 2026 5:47:03 PM\",\"storeupnum\":3,\"addtime\":\"May 13, 2026 9:47:03 AM\"}', 34, '0:0:0:0:0:0:0:1');
INSERT INTO `syslog` VALUES (86, '2026-05-20 18:55:41', 'admin', '修改图书公告', 'com.controller.BookannouncementController.update()', '{\"id\":4,\"title\":\"平台服务规范\\u0026用户须知\",\"picture\":\"upload/1779274534712_686.jpg\",\"publisher\":\"平台管理部\",\"introduction\":\"平台用户服务规范更新 | 共建良好阅读与购物环境\\n\",\"content\":\"\\u003cp\\u003e为保障广大用户的合法权益，营造健康、有序、文明的平台环境，本平台对《用户服务规范》进行了修订，核心调整如下：\\u003c/p\\u003e\\u003cp\\u003e 明确图书版权保护要求，严禁盗版、侵权内容上传与传播\\u003c/p\\u003e\\u003cp\\u003e 规范用户评论区管理，禁止恶意刷屏、人身攻击、虚假评价等行为\\u003c/p\\u003e\\u003cp\\u003e 完善订单与售后流程，明确退换货、物流查询等服务标准\\u003c/p\\u003e\\u003cp\\u003e 新增用户隐私保护条款，全面保障用户个人信息安全\\u003c/p\\u003e\\u003cp\\u003e新规范已于2026年4月1日正式生效，欢迎广大用户监督执行。如有任何疑问，可通过「客服中心」咨询。感谢您的理解与配合，让我们共同守护书香平台。\\u003c/p\\u003e\",\"clicktime\":\"May 13, 2026 5:47:03 PM\",\"storeupnum\":4,\"addtime\":\"May 13, 2026 9:47:03 AM\"}', 29, '0:0:0:0:0:0:0:1');
INSERT INTO `syslog` VALUES (87, '2026-05-20 18:58:39', 'admin', '修改图书公告', 'com.controller.BookannouncementController.update()', '{\"id\":5,\"title\":\"正品授权\",\"picture\":\"upload/1779019477283_300.jpg\",\"publisher\":\"平台管理部\",\"introduction\":\"正品授权\",\"content\":\"\\u003cp\\u003e尊敬的各位读者：\\u003c/p\\u003e\\u003cp\\u003e本站所售图书均为官方正版授权，严格把控图书印刷、装订及内容质量，确保每一位读者都能获得优质阅读体验。感谢您的信任与支持。\\u003c/p\\u003e\",\"clicktime\":\"May 13, 2026 5:47:03 PM\",\"storeupnum\":5,\"addtime\":\"May 13, 2026 9:47:03 AM\"}', 21, '0:0:0:0:0:0:0:1');
INSERT INTO `syslog` VALUES (88, '2026-05-20 19:00:17', 'admin', '修改图书公告', 'com.controller.BookannouncementController.update()', '{\"id\":6,\"title\":\"订单发货及售后\",\"picture\":\"upload/bookannouncement_picture6.jpg\",\"publisher\":\"平台管理部\",\"introduction\":\"保障读者合法权益\",\"content\":\"\\u003cp\\u003e\\u003cspan class\\u003d\\\"ql-size-large\\\"\\u003e本站日常订单将在24小时内完成审核与打包，常规地区正常配送。如遇节假日物流高峰，配送时效可能略有延迟，敬请谅解。\\u003c/span\\u003e\\u003c/p\\u003e\\u003cp\\u003e\\u003cspan class\\u003d\\\"ql-size-large\\\"\\u003e若您收到图书存在破损、缺页、印刷瑕疵等问题，请及时联系在线客服，我们将第一时间为您处理售后事宜，全力保障您的合法权益。\\u003c/span\\u003e\\u003c/p\\u003e\",\"clicktime\":\"May 13, 2026 5:47:03 PM\",\"storeupnum\":6,\"addtime\":\"May 13, 2026 9:47:03 AM\"}', 25, '0:0:0:0:0:0:0:1');
INSERT INTO `syslog` VALUES (89, '2026-05-20 19:00:35', 'admin', '修改图书公告', 'com.controller.BookannouncementController.update()', '{\"id\":5,\"title\":\"正品授权\",\"picture\":\"upload/1779019477283_300.jpg\",\"publisher\":\"平台管理部\",\"introduction\":\"正品授权\",\"content\":\"\\u003cp\\u003e\\u003cspan class\\u003d\\\"ql-size-large\\\"\\u003e\\u003cspan class\\u003d\\\"ql-cursor\\\"\\u003e﻿\\u003c/span\\u003e尊敬的各位读者：\\u003c/span\\u003e\\u003c/p\\u003e\\u003cp\\u003e\\u003cspan class\\u003d\\\"ql-size-large\\\"\\u003e本站所售图书均为官方正版授权，严格把控图书印刷、装订及内容质量，确保每一位读者都能获得优质阅读体验。感谢您的信任与支持。\\u003c/span\\u003e\\u003c/p\\u003e\",\"clicktime\":\"May 13, 2026 5:47:03 PM\",\"storeupnum\":5,\"addtime\":\"May 13, 2026 9:47:03 AM\"}', 2, '0:0:0:0:0:0:0:1');
INSERT INTO `syslog` VALUES (90, '2026-05-20 19:00:41', 'admin', '修改图书公告', 'com.controller.BookannouncementController.update()', '{\"id\":5,\"title\":\"正品授权\",\"picture\":\"upload/1779019477283_300.jpg\",\"publisher\":\"平台管理部\",\"introduction\":\"正品授权\",\"content\":\"\\u003cp\\u003e\\u003cspan class\\u003d\\\"ql-size-large\\\"\\u003e﻿尊敬的各位读者：\\u003c/span\\u003e\\u003c/p\\u003e\\u003cp\\u003e\\u003cspan class\\u003d\\\"ql-size-large\\\"\\u003e本站所售图书均为官方正版授权，严格把控图书印刷、装订及内容质量，确保每一位读者都能获得优质阅读体验。感谢您的信任与支持。\\u003c/span\\u003e\\u003c/p\\u003e\",\"clicktime\":\"May 13, 2026 5:47:03 PM\",\"storeupnum\":5,\"addtime\":\"May 13, 2026 9:47:03 AM\"}', 2, '0:0:0:0:0:0:0:1');
INSERT INTO `syslog` VALUES (91, '2026-05-20 19:00:55', 'admin', '修改图书公告', 'com.controller.BookannouncementController.update()', '{\"id\":4,\"title\":\"平台服务规范\\u0026用户须知\",\"picture\":\"upload/1779274534712_686.jpg\",\"publisher\":\"平台管理部\",\"introduction\":\"平台用户服务规范更新 | 共建良好阅读与购物环境\\n\",\"content\":\"\\u003cp\\u003e\\u003cspan class\\u003d\\\"ql-size-large\\\"\\u003e为保障广大用户的合法权益，营造健康、有序、文明的平台环境，本平台对《用户服务规范》进行了修订，核心调整如下：\\u003c/span\\u003e\\u003c/p\\u003e\\u003cp\\u003e\\u003cspan class\\u003d\\\"ql-size-large\\\"\\u003e明确图书版权保护要求，严禁盗版、侵权内容上传与传播\\u003c/span\\u003e\\u003c/p\\u003e\\u003cp\\u003e\\u003cspan class\\u003d\\\"ql-size-large\\\"\\u003e规范用户评论区管理，禁止恶意刷屏、人身攻击、虚假评价等行为\\u003c/span\\u003e\\u003c/p\\u003e\\u003cp\\u003e\\u003cspan class\\u003d\\\"ql-size-large\\\"\\u003e完善订单与售后流程，明确退换货、物流查询等服务标准\\u003c/span\\u003e\\u003c/p\\u003e\\u003cp\\u003e\\u003cspan class\\u003d\\\"ql-size-large\\\"\\u003e新增用户隐私保护条款，全面保障用户个人信息安全\\u003c/span\\u003e\\u003c/p\\u003e\\u003cp\\u003e\\u003cspan class\\u003d\\\"ql-size-large\\\"\\u003e新规范已于2026年4月1日正式生效，欢迎广大用户监督执行。如有任何疑问，可通过「客服中心」咨询。感谢您的理解与配合，让我们共同守护书香平台。\\u003c/span\\u003e\\u003c/p\\u003e\",\"clicktime\":\"May 13, 2026 5:47:03 PM\",\"storeupnum\":4,\"addtime\":\"May 13, 2026 9:47:03 AM\"}', 49, '0:0:0:0:0:0:0:1');
INSERT INTO `syslog` VALUES (92, '2026-05-20 19:01:09', 'admin', '修改图书公告', 'com.controller.BookannouncementController.update()', '{\"id\":3,\"title\":\"系统维护公告\",\"picture\":\"upload/1779274427174_671.jpg\",\"publisher\":\"图书运维部\",\"introduction\":\"系统维护公告\",\"content\":\"\\u003cp\\u003e\\u003cspan class\\u003d\\\"ql-size-large\\\"\\u003e\\u003cspan class\\u003d\\\"ql-cursor\\\"\\u003e﻿\\u003c/span\\u003e平台将于4月10日凌晨进行系统升级\\u003c/span\\u003e\\u003c/p\\u003e\\u003cp\\u003e\\u003cspan class\\u003d\\\"ql-size-large\\\"\\u003e通知内容：为保障平台稳定运行，优化用户体验，本平台将于2026年4月10日00:00-06:00进行系统维护升级。维护期间，平台部分功能将暂时无法使用，给您带来的不便，敬请谅解。升级完成后，我们将第一时间恢复服务，感谢您的支持。\\u003c/span\\u003e\\u003c/p\\u003e\",\"clicktime\":\"May 13, 2026 5:47:03 PM\",\"storeupnum\":3,\"addtime\":\"May 13, 2026 9:47:03 AM\"}', 2, '0:0:0:0:0:0:0:1');
INSERT INTO `syslog` VALUES (93, '2026-05-20 19:01:18', 'admin', '修改图书公告', 'com.controller.BookannouncementController.update()', '{\"id\":2,\"title\":\"开启阅读之旅\",\"picture\":\"upload/1779274317152_317.jpg\",\"publisher\":\"图书馆信息技术部\",\"introduction\":\"\",\"content\":\"\\u003cp\\u003e\\u003cspan class\\u003d\\\"ql-size-large\\\"\\u003e亲爱的读者：\\u003c/span\\u003e\\u003c/p\\u003e\\u003cp\\u003e\\u003cbr\\u003e\\u003c/p\\u003e\\u003cp\\u003e\\u003cspan class\\u003d\\\"ql-size-large\\\"\\u003e为丰富网站图书资源，满足广大文学爱好者的阅读与选购需求，本站近期对文学类图书进行了全面补充更新。本次新增书籍涵盖多本中外经典名著，内容丰富、品类齐全，已全部完成上架。\\u003c/span\\u003e\\u003c/p\\u003e\\u003cp\\u003e\\u003cbr\\u003e\\u003c/p\\u003e\\u003cp\\u003e\\u003cspan class\\u003d\\\"ql-size-large\\\"\\u003e欢迎各位读者登录网站浏览选购，开启阅读之旅。\\u003c/span\\u003e\\u003c/p\\u003e\\u003cp\\u003e\\u003cbr\\u003e\\u003c/p\\u003e\\u003cp\\u003e\\u003cspan class\\u003d\\\"ql-size-large\\\"\\u003e特此公告。\\u003c/span\\u003e\\u003c/p\\u003e\",\"clicktime\":\"May 13, 2026 5:47:03 PM\",\"storeupnum\":2,\"addtime\":\"May 13, 2026 9:47:03 AM\"}', 14, '0:0:0:0:0:0:0:1');
INSERT INTO `syslog` VALUES (94, '2026-05-20 19:02:13', 'admin', '修改图书公告', 'com.controller.BookannouncementController.update()', '{\"id\":8,\"title\":\"新书上架预告公告\",\"picture\":\"upload/1779019518645_358.jpg\",\"publisher\":\"平台管理部\",\"introduction\":\"\",\"content\":\"\\u003cp\\u003e\\u003cspan class\\u003d\\\"ql-size-large\\\"\\u003e本站将持续上架文学、社科、教辅、少儿等各类优质新书，每日定时更新书单，欢迎各位读者持续关注。\\u003c/span\\u003e\\u003c/p\\u003e\",\"clicktime\":\"May 13, 2026 5:47:03 PM\",\"storeupnum\":8,\"addtime\":\"May 13, 2026 9:47:03 AM\"}', 8, '0:0:0:0:0:0:0:1');
INSERT INTO `syslog` VALUES (95, '2026-05-20 19:02:21', 'admin', '删除图书公告', 'com.controller.BookannouncementController.delete()', '[7]', 73, '0:0:0:0:0:0:0:1');
INSERT INTO `syslog` VALUES (96, '2026-06-04 20:16:15', 'wutao', '新增地址', 'com.controller.AddressController.add()', '{\"id\":17,\"userid\":10,\"address\":\"陕西省-咸阳市-渭城区-小区\",\"name\":\"wutao\",\"phone\":\"13333332423\",\"isdefault\":\"是\"}', 6001, '127.0.0.1');
INSERT INTO `syslog` VALUES (97, '2026-06-04 20:16:15', 'wutao', '新增地址', 'com.controller.AddressController.add()', '{\"id\":15,\"userid\":10,\"address\":\"陕西省-咸阳市-渭城区-小区\",\"name\":\"wutao\",\"phone\":\"13333332423\",\"isdefault\":\"是\"}', 6001, '127.0.0.1');
INSERT INTO `syslog` VALUES (98, '2026-06-04 20:16:15', 'wutao', '新增地址', 'com.controller.AddressController.add()', '{\"id\":16,\"userid\":10,\"address\":\"陕西省-咸阳市-渭城区-小区\",\"name\":\"wutao\",\"phone\":\"13333332423\",\"isdefault\":\"是\"}', 6001, '127.0.0.1');
INSERT INTO `syslog` VALUES (99, '2026-06-04 20:16:15', 'wutao', '新增地址', 'com.controller.AddressController.add()', '{\"id\":18,\"userid\":10,\"address\":\"陕西省-咸阳市-渭城区-小区\",\"name\":\"wutao\",\"phone\":\"13333332423\",\"isdefault\":\"是\"}', 4689, '127.0.0.1');
INSERT INTO `syslog` VALUES (100, '2026-06-04 20:16:29', 'wutao', '修改图书信息', 'com.controller.BookinformationController.update()', '{\"id\":14,\"isbn\":\"9787111605430\",\"booktitle\":\"经济学原理\",\"bookcover\":\"upload/1778756968245_914.jpg\",\"bookclassification\":\"经济管理\",\"author\":\"曼昆\",\"authorsnationality\":\"美国\",\"language\":\"中文\",\"publishinghouse\":\"北京大学出版社\",\"sales\":28765,\"publicationdate\":\"Sep 1, 2015 12:00:00 AM\",\"bookintroduction\":\"\\u003cp\\u003e经济学入门必读经典，系统讲解微观经济学和宏观经济学基本原理。\\u003c/p\\u003e\",\"onelimittimes\":5,\"alllimittimes\":398,\"price\":89.0,\"thumbsupnum\":1890,\"crazilynum\":34,\"clicktime\":\"May 11, 2026 12:30:00 AM\",\"discussnum\":345,\"totalscore\":4.6,\"onshelves\":1,\"storeupnum\":987,\"addtime\":\"May 12, 2026 11:05:00 AM\"}', 226, '127.0.0.1');
INSERT INTO `syslog` VALUES (101, '2026-06-04 20:16:30', 'wutao', '新增订单', 'com.controller.OrdersController.add()', '{\"id\":24,\"orderid\":\"202664201628200\",\"goodid\":14,\"goodname\":\"经济学原理\",\"picture\":\"upload/1778756968245_914.jpg\",\"buynumber\":1,\"price\":89.0,\"total\":89.0,\"type\":1,\"status\":\"未支付\",\"address\":\"陕西省-咸阳市-渭城区-小区\",\"tel\":\"13333332423\",\"consignee\":\"wutao\",\"remark\":\"\",\"userid\":10,\"tablename\":\"bookinformation\",\"sfsh\":\"\",\"role\":\"user\"}', 250, '127.0.0.1');
INSERT INTO `syslog` VALUES (102, '2026-06-04 20:16:31', 'wutao', '修改订单', 'com.controller.OrdersController.update()', '{\"id\":24,\"orderid\":\"202664201628200\",\"goodid\":14,\"goodname\":\"经济学原理\",\"picture\":\"upload/1778756968245_914.jpg\",\"buynumber\":1,\"price\":89.0,\"total\":89.0,\"type\":1,\"status\":\"已支付\",\"address\":\"陕西省-咸阳市-渭城区-小区\",\"tel\":\"13333332423\",\"consignee\":\"wutao\",\"remark\":\"\",\"userid\":10,\"tablename\":\"bookinformation\",\"sfsh\":\"\",\"role\":\"user\"}', 297, '127.0.0.1');
INSERT INTO `syslog` VALUES (103, '2026-06-04 20:16:58', 'wutao', '删除地址', 'com.controller.AddressController.delete()', '[15]', 298, '127.0.0.1');
INSERT INTO `syslog` VALUES (104, '2026-06-04 20:17:00', 'wutao', '删除地址', 'com.controller.AddressController.delete()', '[16]', 132, '127.0.0.1');
INSERT INTO `syslog` VALUES (105, '2026-06-04 20:17:03', 'wutao', '删除地址', 'com.controller.AddressController.delete()', '[18]', 296, '127.0.0.1');
INSERT INTO `syslog` VALUES (106, '2026-06-04 20:17:06', 'wutao', '删除地址', 'com.controller.AddressController.delete()', '[17]', 235, '127.0.0.1');
INSERT INTO `syslog` VALUES (107, '2026-06-04 20:18:20', 'wutao', '修改图书信息', 'com.controller.BookinformationController.update()', '{\"id\":4,\"isbn\":\"9787115428691\",\"booktitle\":\"思考,快与慢\",\"bookcover\":\"upload/1778756281027_356.png\",\"bookclassification\":\"心理学\",\"author\":\"丹尼尔·卡尼曼\",\"authorsnationality\":\"美国\",\"language\":\"中文\",\"publishinghouse\":\"人民邮电出版社\",\"sales\":18934,\"publicationdate\":\"Nov 1, 2016 12:00:00 AM\",\"bookintroduction\":\"\\u003cp\\u003e诺贝尔经济学奖得主卡尼曼的代表作,揭示了人类思维的两种模式及其对决策的影响。\\u003c/p\\u003e\",\"onelimittimes\":10,\"alllimittimes\":598,\"price\":69.0,\"thumbsupnum\":1567,\"crazilynum\":34,\"clicktime\":\"May 12, 2026 5:00:00 PM\",\"discussnum\":312,\"totalscore\":4.7,\"onshelves\":1,\"storeupnum\":789,\"addtime\":\"May 12, 2026 10:15:00 AM\"}', 61, '127.0.0.1');
INSERT INTO `syslog` VALUES (108, '2026-06-04 20:18:20', 'wutao', '新增订单', 'com.controller.OrdersController.add()', '{\"id\":25,\"orderid\":\"202664201819295\",\"goodid\":4,\"goodname\":\"思考,快与慢\",\"picture\":\"upload/1778756281027_356.png\",\"buynumber\":1,\"price\":69.0,\"total\":69.0,\"type\":1,\"status\":\"未支付\",\"address\":\"西安市雁塔区科技路48号创业广场B座2201室\",\"tel\":\"13877778888\",\"consignee\":\"吴涛\",\"remark\":\"\",\"userid\":10,\"tablename\":\"bookinformation\",\"sfsh\":\"\",\"role\":\"user\"}', 73, '127.0.0.1');
INSERT INTO `syslog` VALUES (109, '2026-06-04 20:18:21', 'wutao', '修改订单', 'com.controller.OrdersController.update()', '{\"id\":25,\"orderid\":\"202664201819295\",\"goodid\":4,\"goodname\":\"思考,快与慢\",\"picture\":\"upload/1778756281027_356.png\",\"buynumber\":1,\"price\":69.0,\"total\":69.0,\"type\":1,\"status\":\"已支付\",\"address\":\"西安市雁塔区科技路48号创业广场B座2201室\",\"tel\":\"13877778888\",\"consignee\":\"吴涛\",\"remark\":\"\",\"userid\":10,\"tablename\":\"bookinformation\",\"sfsh\":\"\",\"role\":\"user\"}', 51, '127.0.0.1');
INSERT INTO `syslog` VALUES (110, '2026-06-04 20:18:59', 'wutao', '新增客服中心', 'com.controller.ChatController.add()', '{\"id\":13,\"userid\":10,\"ask\":\"您好\",\"isreply\":1,\"uname\":\"wutao\",\"type\":1}', 113, '127.0.0.1');
INSERT INTO `syslog` VALUES (111, '2026-06-04 20:25:25', 'admin', '修改图书试看章节', 'com.controller.ChaptertushushikanController.update()', '{\"id\":23,\"refid\":5,\"chapternum\":4,\"chaptertitle\":\"第四章 海瑞\",\"content\":\"\\u003cp\\u003e海瑞是明代官场上一个绝对的异类，一个将古老儒家道德理想推向极致的纯粹理想主义者。他清廉到令人发指的程度，日常只吃粗茶淡饭，为了给母亲过生日才破例买了两斤肉；他买好棺材、告别妻子，抬着棺材上疏痛骂嘉靖皇帝；他严格按照大明律和圣贤教条去审判案件，规范官员行为，成了百姓眼中的‘海青天’。\\u003c/p\\u003e\\u003cp\\u003e然而，在黄仁宇先生的宏大历史视角下，海瑞的出现不仅不是帝国的救星，反而成了体制走向僵死的一个尴尬符号。海瑞坚守的那些绝对化、教条化的道德原则，在商品经济已经开始萌芽、人事关系极其错综复杂的现实政治中，显得如此格格不入。他试图用西周时期的简朴道德去管理一个处于 16 世纪的庞大帝国，这本身就是一种历史的倒退。\\u003c/p\\u003e\\u003cp\\u003e在担任应天巡抚期间，海瑞为了保护贫民，强制要求当地的乡绅地主退还侵占的土地。这种缺乏法律依据、纯粹依赖道德热情的过激行政，直接导致了当地金融资本的断裂和商业的全面萧条，连贫民也因为失去雇佣机会而陷入了更深的绝望。文官集团虽然在口头上将他奉为道德模范，但在实际任用上却避之唯恐不及，将他高高挂起。\\u003c/p\\u003e\\u003cp\\u003e海瑞的一生处处碰壁、无所建树，最终在孤独和贫困中死去。他的命运成了一面讽刺的镜子，无情地照出了明朝政治体制的虚伪与死局：当一个社会只能依靠海瑞这样的‘道德圣人’才能勉强维持正义、而整个官僚系统又无法容忍这样一个圣人真正参与管理时，这个帝国的底层结构就已经彻底坏死，无药可救了。\\u003c/p\\u003e\",\"addtime\":\"May 12, 2026 12:50:00 PM\"}', 25, '127.0.0.1');
INSERT INTO `syslog` VALUES (112, '2026-06-04 20:26:05', 'admin', '新增客服中心', 'com.controller.ChatController.save()', '{\"id\":14,\"userid\":10,\"adminid\":1,\"reply\":\"您好\",\"uname\":\"admin\",\"uimage\":\"upload/1778755097331_566.jpeg\",\"type\":1}', 246, '127.0.0.1');
INSERT INTO `syslog` VALUES (113, '2026-06-04 20:28:46', 'admin', '修改图书试看章节', 'com.controller.ChaptertushushikanController.update()', '{\"id\":23,\"refid\":5,\"chapternum\":4,\"chaptertitle\":\"第四章 海瑞\",\"content\":\"\\u003cp\\u003e海瑞是明代官场上一个绝对的异类，一个将古老儒家道德理想推向极致的纯粹理想主义者。他清廉到令人发指的程度，日常只吃粗茶淡饭，为了给母亲过生日才破例买了两斤肉；他买好棺材、告别妻子，抬着棺材上疏痛骂嘉靖皇帝；他严格按照大明律和圣贤教条去审判案件，规范官员行为，成了百姓眼中的‘海青天’。\\u003c/p\\u003e\\u003cp\\u003e然而，在黄仁宇先生的宏大历史视角下，海瑞的出现不仅不是帝国的救星，反而成了体制走向僵死的一个尴尬符号。海瑞坚守的那些绝对化、教条化的道德原则，在商品经济已经开始萌芽、人事关系极其错综复杂的现实政治中，显得如此格格不入。他试图用西周时期的简朴道德去管理一个处于 16 世纪的庞大帝国，这本身就是一种历史的倒退。\\u003c/p\\u003e\\u003cp\\u003e在担任应天巡抚期间，海瑞为了保护贫民，强制要求当地的乡绅地主退还侵占的土地。这种缺乏法律依据、纯粹依赖道德热情的过激行政，直接导致了当地金融资本的断裂和商业的全面萧条，连贫民也因为失去雇佣机会而陷入了更深的绝望。文官集团虽然在口头上将他奉为道德模范，但在实际任用上却避之唯恐不及，将他高高挂起。\\u003c/p\\u003e\\u003cp\\u003e海瑞的一生处处碰壁、无所建树，最终在孤独和贫困中死去。他的命运成了一面讽刺的镜子，无情地照出了明朝政治体制的虚伪与死局：当一个社会只能依靠海瑞这样的‘道德圣人’才能勉强维持正义、而整个官僚系统又无法容忍这样一个圣人真正参与管理时，这个帝国的底层结构就已经彻底坏死，无药可救了。\\u003c/p\\u003e\",\"addtime\":\"May 12, 2026 12:50:00 PM\"}', 22, '127.0.0.1');
INSERT INTO `syslog` VALUES (114, '2026-06-12 11:22:51', 'wutao', '修改图书信息', 'com.controller.BookinformationController.update()', '{\"id\":14,\"isbn\":\"9787111605430\",\"booktitle\":\"经济学原理\",\"bookcover\":\"upload/1778756968245_914.jpg\",\"bookclassification\":\"经济管理\",\"author\":\"曼昆\",\"authorsnationality\":\"美国\",\"language\":\"中文\",\"publishinghouse\":\"北京大学出版社\",\"sales\":28765,\"publicationdate\":\"Sep 1, 2015 12:00:00 AM\",\"bookintroduction\":\"\\u003cp\\u003e经济学入门必读经典，系统讲解微观经济学和宏观经济学基本原理。\\u003c/p\\u003e\",\"onelimittimes\":5,\"alllimittimes\":397,\"price\":89.0,\"thumbsupnum\":1890,\"crazilynum\":34,\"clicktime\":\"May 11, 2026 12:30:00 AM\",\"discussnum\":345,\"totalscore\":4.6,\"onshelves\":1,\"storeupnum\":987,\"addtime\":\"May 12, 2026 11:05:00 AM\"}', 362, '127.0.0.1');
INSERT INTO `syslog` VALUES (115, '2026-06-12 11:22:52', 'wutao', '新增订单', 'com.controller.OrdersController.add()', '{\"id\":26,\"orderid\":\"2026612112246280\",\"goodid\":14,\"goodname\":\"经济学原理\",\"picture\":\"upload/1778756968245_914.jpg\",\"buynumber\":1,\"price\":89.0,\"total\":89.0,\"type\":1,\"status\":\"未支付\",\"address\":\"西安市雁塔区科技路48号创业广场B座2201室\",\"tel\":\"13877778888\",\"consignee\":\"吴涛\",\"remark\":\"\",\"userid\":10,\"tablename\":\"bookinformation\",\"sfsh\":\"\",\"role\":\"user\"}', 132, '127.0.0.1');
INSERT INTO `syslog` VALUES (116, '2026-06-12 11:22:53', 'wutao', '修改订单', 'com.controller.OrdersController.update()', '{\"id\":26,\"orderid\":\"2026612112246280\",\"goodid\":14,\"goodname\":\"经济学原理\",\"picture\":\"upload/1778756968245_914.jpg\",\"buynumber\":1,\"price\":89.0,\"total\":89.0,\"type\":1,\"status\":\"已支付\",\"address\":\"西安市雁塔区科技路48号创业广场B座2201室\",\"tel\":\"13877778888\",\"consignee\":\"吴涛\",\"remark\":\"\",\"userid\":10,\"tablename\":\"bookinformation\",\"sfsh\":\"\",\"role\":\"user\"}', 67, '127.0.0.1');
INSERT INTO `syslog` VALUES (117, '2026-06-12 11:22:54', 'wutao', '修改图书信息', 'com.controller.BookinformationController.update()', '{\"id\":14,\"isbn\":\"9787111605430\",\"booktitle\":\"经济学原理\",\"bookcover\":\"upload/1778756968245_914.jpg\",\"bookclassification\":\"经济管理\",\"author\":\"曼昆\",\"authorsnationality\":\"美国\",\"language\":\"中文\",\"publishinghouse\":\"北京大学出版社\",\"sales\":28765,\"publicationdate\":\"Sep 1, 2015 12:00:00 AM\",\"bookintroduction\":\"\\u003cp\\u003e经济学入门必读经典，系统讲解微观经济学和宏观经济学基本原理。\\u003c/p\\u003e\",\"onelimittimes\":5,\"alllimittimes\":396,\"price\":89.0,\"thumbsupnum\":1890,\"crazilynum\":34,\"clicktime\":\"May 11, 2026 12:30:00 AM\",\"discussnum\":345,\"totalscore\":4.6,\"onshelves\":1,\"storeupnum\":987,\"addtime\":\"May 12, 2026 11:05:00 AM\"}', 32, '127.0.0.1');
INSERT INTO `syslog` VALUES (118, '2026-06-12 11:22:55', 'wutao', '新增订单', 'com.controller.OrdersController.add()', '{\"id\":27,\"orderid\":\"2026612112253836\",\"goodid\":14,\"goodname\":\"经济学原理\",\"picture\":\"upload/1778756968245_914.jpg\",\"buynumber\":1,\"price\":89.0,\"total\":89.0,\"type\":1,\"status\":\"未支付\",\"address\":\"西安市雁塔区科技路48号创业广场B座2201室\",\"tel\":\"13877778888\",\"consignee\":\"吴涛\",\"remark\":\"\",\"userid\":10,\"tablename\":\"bookinformation\",\"sfsh\":\"\",\"role\":\"user\"}', 60, '127.0.0.1');
INSERT INTO `syslog` VALUES (119, '2026-06-12 11:22:55', 'wutao', '修改订单', 'com.controller.OrdersController.update()', '{\"id\":27,\"orderid\":\"2026612112253836\",\"goodid\":14,\"goodname\":\"经济学原理\",\"picture\":\"upload/1778756968245_914.jpg\",\"buynumber\":1,\"price\":89.0,\"total\":89.0,\"type\":1,\"status\":\"已支付\",\"address\":\"西安市雁塔区科技路48号创业广场B座2201室\",\"tel\":\"13877778888\",\"consignee\":\"吴涛\",\"remark\":\"\",\"userid\":10,\"tablename\":\"bookinformation\",\"sfsh\":\"\",\"role\":\"user\"}', 17, '127.0.0.1');
INSERT INTO `syslog` VALUES (120, '2026-06-12 11:24:01', 'wutao', '修改图书信息', 'com.controller.BookinformationController.update()', '{\"id\":13,\"isbn\":\"9787508678932\",\"booktitle\":\"人类简史\",\"bookcover\":\"upload/1778756998181_500.webp\",\"bookclassification\":\"历史传记\",\"author\":\"尤瓦尔·赫拉利\",\"authorsnationality\":\"以色列\",\"language\":\"中文\",\"publishinghouse\":\"中信出版社\",\"sales\":45678,\"publicationdate\":\"Mar 1, 2017 12:00:00 AM\",\"bookintroduction\":\"\\u003cp\\u003e从十万年前到21世纪，全景式展现人类发展史，探讨人类如何从普通动物成为地球主宰。\\u003c/p\\u003e\",\"onelimittimes\":10,\"alllimittimes\":599,\"price\":68.0,\"thumbsupnum\":4568,\"crazilynum\":89,\"clicktime\":\"May 11, 2026 12:10:00 AM\",\"discussnum\":678,\"totalscore\":4.9,\"onshelves\":1,\"storeupnum\":1891,\"addtime\":\"May 12, 2026 11:00:00 AM\"}', 18, '127.0.0.1');
INSERT INTO `syslog` VALUES (121, '2026-06-12 11:24:01', 'wutao', '新增订单', 'com.controller.OrdersController.add()', '{\"id\":28,\"orderid\":\"202661211240232\",\"goodid\":13,\"goodname\":\"人类简史\",\"picture\":\"upload/1778756998181_500.webp\",\"buynumber\":1,\"price\":68.0,\"total\":68.0,\"type\":1,\"status\":\"未支付\",\"address\":\"西安市雁塔区科技路48号创业广场B座2201室\",\"tel\":\"13877778888\",\"consignee\":\"吴涛\",\"remark\":\"\",\"userid\":10,\"tablename\":\"bookinformation\",\"sfsh\":\"\",\"role\":\"user\"}', 96, '127.0.0.1');
INSERT INTO `syslog` VALUES (122, '2026-06-12 11:24:02', 'wutao', '修改订单', 'com.controller.OrdersController.update()', '{\"id\":28,\"orderid\":\"202661211240232\",\"goodid\":13,\"goodname\":\"人类简史\",\"picture\":\"upload/1778756998181_500.webp\",\"buynumber\":1,\"price\":68.0,\"total\":68.0,\"type\":1,\"status\":\"已支付\",\"address\":\"西安市雁塔区科技路48号创业广场B座2201室\",\"tel\":\"13877778888\",\"consignee\":\"吴涛\",\"remark\":\"\",\"userid\":10,\"tablename\":\"bookinformation\",\"sfsh\":\"\",\"role\":\"user\"}', 6, '127.0.0.1');

-- ----------------------------
-- Table structure for token
-- ----------------------------
DROP TABLE IF EXISTS `token`;
CREATE TABLE `token`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `tablename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表名',
  `role` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色',
  `token` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'token表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of token
-- ----------------------------
INSERT INTO `token` VALUES (1, 1, 'zhangwei2025', 'users', '管理员', 'ibdnul1hh9srhybnp8jqjbhz3wc6pszs', '2026-05-14 18:37:14', '2026-05-14 19:37:14');
INSERT INTO `token` VALUES (3, 1, 'admin', 'users', '管理员', 'm7n8iner4tx9sg036lu9syuclfiahra5', '2026-05-14 19:31:35', '2026-06-12 10:30:37');
INSERT INTO `token` VALUES (4, 10, 'wutao', 'user', 'user', 'srshg61mcnoh9jjiyf0pgb13uodzj8n4', '2026-05-14 19:32:46', '2026-06-12 12:22:17');
INSERT INTO `token` VALUES (5, 9, 'zhoumin_artist ', 'user', 'user', 'ta5f36e3a6rfi378tc6d7pljx8g7uqpr', '2026-05-14 19:49:47', '2026-05-14 20:49:47');
INSERT INTO `token` VALUES (6, 4, 'liujun_tech', 'user', 'user', 'd5vpekxzmiedo633917umibxhaa73kfz', '2026-05-14 19:55:25', '2026-05-14 20:55:25');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `account` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '账号',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '姓名',
  `gender` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '性别',
  `age` int(11) NOT NULL COMMENT '年龄',
  `mobilephone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '手机',
  `avatar` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '头像',
  `money` double NULL DEFAULT 0 COMMENT '余额',
  `pquestion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密保问题',
  `panswer` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密保答案',
  `status` int(11) NULL DEFAULT 0 COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `account`(`account`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '2026-05-12 09:15:00', 'zhangwei2025', '8J9Je8e093V8Jiu+ily0yQ==', '张伟', '男', 28, '13812345678', 'upload/1778755549765_745.webp', 1580.5, '你的出生地是?', '北京', 0);
INSERT INTO `user` VALUES (2, '2026-05-12 09:20:00', 'lina_book', '8J9Je8e093V8Jiu+ily0yQ==', '李娜', '女', 32, '13987654321', 'upload/1778755522815_965.jpg', 2340, '你最喜欢的颜色是?', '蓝色', 0);
INSERT INTO `user` VALUES (3, '2026-05-12 09:25:00', 'wangfang_reader', '8J9Je8e093V8Jiu+ily0yQ==', '王芳', '女', 25, '13655551234', 'upload/1778755477874_50.webp', 890.75, '你的小学名字是?', '希望小学', 0);
INSERT INTO `user` VALUES (4, '2026-05-12 09:30:00', 'liujun_tech', '8J9Je8e093V8Jiu+ily0yQ==', '刘军', '男', 35, '13722228888', 'upload/1778755429727_989.webp', 3111, '你第一只宠物名字?', '小黄', 0);
INSERT INTO `user` VALUES (5, '2026-05-12 09:35:00', 'chenyan_student', '8J9Je8e093V8Jiu+ily0yQ==', '陈燕', '女', 22, '13566667777', 'upload/1778755390576_305.jpg', 560.25, '你的生日是?', '12月15日', 0);
INSERT INTO `user` VALUES (6, '2026-05-12 09:40:00', 'yangming_prof', '8J9Je8e093V8Jiu+ily0yQ==', '杨明', '男', 45, '13899990000', 'upload/1778755348910_857.webp', 5800, '你的高中名字是?', '一中', 0);
INSERT INTO `user` VALUES (7, '2026-05-12 09:45:00', 'zhaoli_writer', '8J9Je8e093V8Jiu+ily0yQ==', '赵丽', '女', 30, '13611112222', 'upload/1778755289614_482.jpg', 1250.5, '你最喜欢的电影?', '肖申克的救赎', 0);
INSERT INTO `user` VALUES (8, '2026-05-12 09:50:00', 'sunlei_dev', '8J9Je8e093V8Jiu+ily0yQ==', '孙磊', '男', 27, '13733334444', 'upload/1778755226806_398.jpg', 2100, '你的大学名字是?', '清华大学', 0);
INSERT INTO `user` VALUES (9, '2026-05-12 09:55:00', 'zhoumin_artist', '8J9Je8e093V8Jiu+ily0yQ==', '周敏', '女', 29, '13555556666', 'upload/1778755165316_632.png', 1680.75, '你最喜欢的城市?', '杭州', 0);
INSERT INTO `user` VALUES (10, '2026-05-12 10:00:00', 'wutao', '8J9Je8e093V8Jiu+ily0yQ==', '吴涛', '男', 38, '13877778888', 'upload/1778755200454_851.webp', 3648, '你的初中老师名字?', '李老师', 0);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `role` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '管理员' COMMENT '角色',
  `image` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '头像',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '管理员' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, '2026-05-14 18:36:39', 'admin', '8J9Je8e093V8Jiu+ily0yQ==', '管理员', 'upload/1778755097331_566.jpeg');

SET FOREIGN_KEY_CHECKS = 1;
