/*
 Navicat Premium Data Transfer

 Source Server         : tangfen_mysql
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : tangfen

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 07/06/2024 18:30:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for baomingxinxi
-- ----------------------------
DROP TABLE IF EXISTS `baomingxinxi`;
CREATE TABLE `baomingxinxi`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userid` tinyint NULL DEFAULT NULL COMMENT '用户id',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户名称',
  `activityname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '活动名称',
  `addtime` datetime NULL DEFAULT NULL COMMENT '报名时间',
  `activityid` bigint NULL DEFAULT NULL COMMENT '活动ID',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '审核中' COMMENT '状态',
  `sponsor` bigint NULL DEFAULT NULL COMMENT '发起者ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of baomingxinxi
-- ----------------------------
INSERT INTO `baomingxinxi` VALUES (1, 31, '喜羊羊', '夜爬武功山', '2024-05-07 15:01:55', 41, '审核中', 0);
INSERT INTO `baomingxinxi` VALUES (4, 31, '喜羊羊', '南岳衡山登山活动', '2024-05-08 19:51:51', 52, '不通过', 0);
INSERT INTO `baomingxinxi` VALUES (5, 32, '美羊羊', '老君山我们来了', '2024-05-08 21:19:04', 60, '通过', 31);
INSERT INTO `baomingxinxi` VALUES (6, 31, '喜羊羊', '夜爬泰山', '2024-05-14 16:01:05', 53, '审核中', 0);
INSERT INTO `baomingxinxi` VALUES (7, 32, '美羊羊', '罗浮山来了', '2024-05-15 03:05:01', 62, '通过', 31);
INSERT INTO `baomingxinxi` VALUES (8, 39, '懒羊羊', '罗浮山来了', '2024-05-15 03:05:47', 62, '通过', 31);
INSERT INTO `baomingxinxi` VALUES (9, 39, '懒羊羊', '老君山我们来了', '2024-05-15 03:05:53', 60, '通过', 31);
INSERT INTO `baomingxinxi` VALUES (10, 33, '暖羊羊', '罗浮山来了', '2024-05-15 03:06:22', 62, '通过', 31);
INSERT INTO `baomingxinxi` VALUES (11, 33, '暖羊羊', '老君山我们来了', '2024-05-15 03:06:25', 60, '通过', 31);
INSERT INTO `baomingxinxi` VALUES (12, 31, '喜羊羊', '四姑娘山冬季高山探险活动', '2024-05-24 14:38:47', 49, '审核中', 0);
INSERT INTO `baomingxinxi` VALUES (13, 31, '喜羊羊', '老君山我们来了', '2024-06-01 20:07:06', 60, '通过', 31);
INSERT INTO `baomingxinxi` VALUES (14, 31, '喜羊羊', '去武功山', '2024-06-01 20:22:13', 54, '审核中', 0);

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '配置文件' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES (1, 'picture1', 'upload/1713929978043.jpg');
INSERT INTO `config` VALUES (2, 'picture2', 'upload/1713929929823.jpg');
INSERT INTO `config` VALUES (3, 'picture3', 'upload/1713929949893.jpg');

-- ----------------------------
-- Table structure for forum
-- ----------------------------
DROP TABLE IF EXISTS `forum`;
CREATE TABLE `forum`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '帖子标题',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '帖子内容',
  `parentid` bigint NULL DEFAULT NULL COMMENT '父节点id',
  `userid` bigint NOT NULL COMMENT '用户id',
  `username` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `isdone` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `useravatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户头像地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 99 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '圈子交流' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of forum
-- ----------------------------
INSERT INTO `forum` VALUES (79, '2024-04-24 11:02:45', '武功山', '欢迎大家谈谈对武功山登山的意见和感受', 0, 1713879441539, '懒羊羊', '开放', NULL);
INSERT INTO `forum` VALUES (80, '2024-04-24 11:31:57', NULL, '就是很酷的感受！两个小白在大神的带领下，武功山穿越明月山全程47公里，这种穿越下来的感觉太酷了，会上瘾。\n\n同行两个女生从此爱上徒步登山，现在还在群里疯狂搜索装备，准备下次出行', 79, 31, '喜羊羊', NULL, NULL);
INSERT INTO `forum` VALUES (81, '2024-04-24 11:32:33', '衡山', '大家谈谈衡山值不值得去看看', 0, 31, '喜羊羊', '开放', NULL);
INSERT INTO `forum` VALUES (82, '2024-04-24 11:52:07', '挑战泰山', '<p><img src=\"http://localhost:8088/tangfen/upload/1715002624180.jpg\" alt=\"图像\"></p><p style=\"text-align: justify;\">有没有挑战泰山成功的，来说一下感受﻿</p>', 0, 31, '喜羊羊', '开放', NULL);
INSERT INTO `forum` VALUES (83, '2024-04-24 11:56:25', NULL, '太累了，爬到售票处的时候，我以为爬完了，结果才刚刚开始', 82, 32, '美羊羊', NULL, NULL);
INSERT INTO `forum` VALUES (84, '2024-04-24 11:56:50', NULL, '雾凇很好看，想去', 81, 32, '美羊羊', NULL, NULL);
INSERT INTO `forum` VALUES (85, '2024-04-24 11:57:06', NULL, '喜羊羊你真的厉害', 80, 32, '美羊羊', NULL, NULL);
INSERT INTO `forum` VALUES (86, '2024-04-24 11:57:46', NULL, '我也是', 83, 33, '暖羊羊', NULL, NULL);
INSERT INTO `forum` VALUES (87, '2024-04-24 11:57:58', NULL, '下次一定带登山棍', 82, 33, '暖羊羊', NULL, NULL);
INSERT INTO `forum` VALUES (88, '2024-04-24 11:58:19', NULL, '想去南岳大庙烧香', 81, 33, '暖羊羊', NULL, NULL);
INSERT INTO `forum` VALUES (89, '2024-05-06 22:39:43', NULL, '对', 87, 31, '喜羊羊', NULL, NULL);

-- ----------------------------
-- Table structure for huodongdiqu
-- ----------------------------
DROP TABLE IF EXISTS `huodongdiqu`;
CREATE TABLE `huodongdiqu`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `huodongdiqu` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动地区',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `huodongdiqu`(`huodongdiqu` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '活动地区' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of huodongdiqu
-- ----------------------------
INSERT INTO `huodongdiqu` VALUES (11, '2024-04-16 20:49:47', '湖南');
INSERT INTO `huodongdiqu` VALUES (12, '2024-04-16 20:49:47', '江西');
INSERT INTO `huodongdiqu` VALUES (13, '2024-04-16 20:49:47', '四川');
INSERT INTO `huodongdiqu` VALUES (14, '2024-04-16 20:49:47', '山东');
INSERT INTO `huodongdiqu` VALUES (15, '2024-04-16 20:49:47', '安徽');
INSERT INTO `huodongdiqu` VALUES (16, '2024-04-16 20:49:47', '河南');
INSERT INTO `huodongdiqu` VALUES (17, '2024-04-16 20:49:47', '西藏');
INSERT INTO `huodongdiqu` VALUES (18, '2024-04-16 20:49:47', '广西');

-- ----------------------------
-- Table structure for huodongleixing
-- ----------------------------
DROP TABLE IF EXISTS `huodongleixing`;
CREATE TABLE `huodongleixing`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `huodongleixing` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `huodongleixing`(`huodongleixing` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '活动类型' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of huodongleixing
-- ----------------------------
INSERT INTO `huodongleixing` VALUES (21, '2024-04-16 20:49:47', '高山探险');
INSERT INTO `huodongleixing` VALUES (22, '2024-04-16 20:49:47', '竞技登山');
INSERT INTO `huodongleixing` VALUES (23, '2024-04-16 20:49:47', '攀岩运动');
INSERT INTO `huodongleixing` VALUES (24, '2024-04-16 20:49:47', '徒步登山');

-- ----------------------------
-- Table structure for huodongxinxi
-- ----------------------------
DROP TABLE IF EXISTS `huodongxinxi`;
CREATE TABLE `huodongxinxi`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint NULL DEFAULT 0 COMMENT '用户id',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `huodongdiqu` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动地区',
  `huodongmingcheng` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动名称',
  `huodongleixing` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动类型',
  `huodongtupian` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '活动图片',
  `huodongdidian` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动地点',
  `huodongshijian` datetime NULL DEFAULT NULL COMMENT '活动时间',
  `huodongfeiyong` int NULL DEFAULT NULL COMMENT '活动费用',
  `feiyongshuoming` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '费用说明',
  `gonglvexinxi` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '攻略信息',
  `huodongxiangqing` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '活动详情',
  `xingchenganpai` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '行程安排',
  `zhuangbeiyaoqiu` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '装备要求',
  `faburiqi` date NULL DEFAULT NULL COMMENT '发布日期',
  `clicktime` datetime NULL DEFAULT NULL COMMENT '最近点击时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `huodongmingcheng`(`huodongmingcheng` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 77 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '活动信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of huodongxinxi
-- ----------------------------
INSERT INTO `huodongxinxi` VALUES (41, 0, '2024-04-16 20:49:47', '江西', '夜爬武功山', '徒步登山', 'upload/1713881003018.jpg,upload/1713881015475.jpg,upload/1713881020085.jpg', '萍乡武功山国家级风景名胜区', '2024-05-23 00:30:00', 200, '推荐', '武功山夜爬最全攻略2024', '<p><strong><img src=\"http://localhost:8088/tangfen/upload/1714474530662.webp\">一、活动背景</strong></p><p>武功山，作为中国著名的徒步胜地，以其险峻的山势、秀美的自然风光和深厚的文化底蕴吸引着无数户外爱好者。为了给大家提供一个难忘的徒步体验，我们特别策划了本次夜爬武功山活动，让大家在星空下感受大自然的魅力，挑战自我，超越极限。</p><p><strong>二、活动目的</strong></p><ol><li>锻炼身体，增强意志，体验户外徒步的乐趣。</li><li>欣赏武功山独特的夜景，感受大自然的神奇与美丽。</li><li>增进团队凝聚力，培养团队协作精神。</li></ol><p><strong>三、活动时间</strong></p><p>2024年5月23日，晚上0点集合，0点半出发。</p><p><strong>四、活动地点</strong></p><p>武功山景区，具体集合地点将在报名成功后通知。</p><p><strong>五、参与对象</strong></p><p>身体健康，热爱户外徒步，有夜爬经验的户外爱好者。</p><p><strong>六、活动流程</strong></p><ol><li><strong>集合签到</strong>：晚上0点在指定地点集合，签到并领取装备。</li><li><strong>热身准备</strong>：进行简单的热身运动，拉伸身体，为徒步做好准备。</li><li><strong>徒步出发</strong>：在领队的带领下，开始夜爬武功山之旅。</li><li><strong>中途休息</strong>：途中设有休息点，供大家休息、补充能量。</li><li><strong>到达山顶</strong>：欣赏武功山美丽的夜景，拍照留念。</li><li><strong>下山返程</strong>：在领队的带领下，安全下山，结束活动。</li></ol><p><strong>七、注意事项</strong></p><ol><li>请携带个人身份证件、户外装备（如徒步鞋、背包、头灯、雨衣等）及必要的个人用品（如水壶、干粮等）。</li><li>请确保身体状况良好，如有心脏病、高血压等病史，请提前告知。</li><li>请遵守活动纪律，听从领队指挥，不得擅自离队。</li><li>注意安全，遵守景区规定，不乱扔垃圾，保护生态环境。</li></ol><p><strong>八、报名方式</strong></p><p>请将您的姓名、联系方式、身份证号码及是否有夜爬经验等信息发送至我们的活动邮箱或添加活动微信群进行报名。报名成功后，我们将通过邮件或微信通知您集合时间、地点及注意事项。</p><p><strong>九、特别说明</strong></p><p>由于夜爬武功山存在一定的风险和挑战，请参与者做好充分准备，确保自身安全。如遇恶劣天气或其他不可抗力因素，活动将视情况调整或取消。如有任何疑问或建议，请随时联系我们。</p><p>让我们一起挑战自我，感受大自然的魅力，夜爬武功山，期待您的加入！</p>', '售票处集合，全程徒步，金顶集合看日出', '登山棍、强光手电筒、冲锋衣、工装裤', '2024-03-31', '2024-06-01 21:17:40');
INSERT INTO `huodongxinxi` VALUES (49, 0, '2024-04-23 22:30:06', '四川', '四姑娘山冬季高山探险活动', '高山探险', 'upload/1713882567707.jpg,upload/1713882571480.jpg,upload/1713882576343.jpg', '四川省四姑娘山', '2024-12-12 00:00:00', 1000, '推荐', '四姑娘山挑战成功', '<p><strong>一、活动背景</strong></p><p>四姑娘山，位于四川省阿坝藏族羌族自治州小金县境内，冬季的四姑娘山银装素裹，白雪皑皑，是高山探险爱好者的绝佳选择。为了体验冬季登山的独特魅力，感受高山探险的激情与挑战，我们特别策划了本次挑战四姑娘山冬季高山探险活动。</p><p><strong>二、活动目的</strong></p><ol><li>体验冬季登山的独特魅力，挑战自我，实现高山探险的梦想。</li><li>欣赏四姑娘山冬季的壮丽风光，感受大自然的神奇与美丽。</li><li>培养团队协作和互助精神，增强高山环境下的生存能力。</li></ol><p><strong>三、活动时间</strong></p><p>2024年12月12日到12月15日</p><p><strong>四、活动地点</strong></p><p>四姑娘山景区</p><p><strong>五、参与对象</strong></p><p>身体健康，热爱高山探险，有冬季登山经验的户外爱好者。</p><p><strong>六、活动流程</strong></p><ol><li><strong>集合签到</strong>：在指定地点集合，签到并领取装备。</li><li><strong>高山探险准备</strong>：进行高山探险前的准备工作，包括装备检查、热身运动、了解天气情况等。</li><li><strong>开始攀登</strong>：在专业领队的带领下，开始挑战四姑娘山冬季高山探险之旅。</li><li><strong>中途休息与补给</strong>：途中设有补给点，提供热水、食物等补给品，确保体力充沛。</li><li><strong>登顶庆祝</strong>：成功登顶后，欣赏冬季四姑娘山的壮丽景色，拍照留念，庆祝胜利。</li><li><strong>下山返程</strong>：安全下山，结束活动。</li></ol><p><strong>七、注意事项</strong></p><ol><li>请携带完整的冬季登山装备，包括防寒衣物、冰爪、冰镐、雪镜等。</li><li>请确保身体状况良好，能够适应高山环境，如有心脏病、高血压等病史，请提前告知。</li><li>遵守活动纪律，听从领队指挥，不得擅自离队。</li><li>注意安全，遵守高山探险规范，不乱扔垃圾，保护生态环境。</li><li>做好防寒保暖措施，避免低温造成冻伤。</li></ol><p><strong>八、报名方式</strong></p><p>请将您的姓名、联系方式、冬季登山经验等信息发送至我们的活动邮箱或添加活动微信群进行报名。报名成功后，我们将通过邮件或微信通知您集合时间、地点及注意事项。</p><p><strong>九、活动费用</strong></p><p>本次活动费用包含景区门票、领队费用、保险费用、部分装备租赁费用等。具体费用将在报名成功后通知您，请在规定时间内完成费用支付。</p><p><strong>十、特别说明</strong></p><p>冬季挑战四姑娘山高山探险是一项极具挑战性的活动，请参与者做好充分准备，确保自身安全。如遇恶劣天气或其他不可抗力因素，活动将视情况调整或取消。如有任何疑问或建议，请随时联系我们。</p><p>让我们一起迎接挑战，感受冬季四姑娘山的壮丽与神秘，高山探险之旅，期待您的加入！</p>', '见详情', '推荐', '2024-04-16', '2024-06-01 20:49:24');
INSERT INTO `huodongxinxi` VALUES (50, 0, '2024-04-23 22:42:06', '广西', '桂林阳朔攀岩节', '攀岩运动', 'upload/1713883271762.jpg,upload/1713883275146.jpg,upload/1713883323669.webp', '飞拉达攀岩基地', '2024-11-20 00:00:00', 500, '不推荐', '无', '<p><strong><img src=\"http://localhost:8088/tangfen/upload/1713947487660.jpg\">桂林阳朔攀岩节活动详情</strong></p><p><br></p><p><strong>一、活动背景</strong></p><p>桂林阳朔，国内攀岩的圣地，以其独特的喀斯特地貌和丰富的攀岩资源，吸引了世界各地的攀岩爱好者。为了推广攀岩文化，提升阳朔攀岩的国际影响力，同时为广大攀岩爱好者提供一个交流竞技的平台，我们特别策划了桂林阳朔攀岩节。</p><p><strong>二、活动目的</strong></p><ol><li>展示阳朔攀岩的魅力，推广攀岩文化，提升阳朔攀岩的国际知名度。</li><li>搭建一个攀岩爱好者交流竞技的平台，促进攀岩技术的提升和传播。</li><li>通过攀岩节的举办，带动阳朔旅游和相关产业的发展。</li></ol><p><strong>三、活动时间</strong></p><p>2024年11月20日到11月23日</p><p><strong>四、活动地点</strong></p><p>阳朔攀岩基地及周边攀岩点</p><p><strong>五、参与对象</strong></p><p>攀岩爱好者、攀岩教练、攀岩装备厂商、攀岩相关产业从业者及媒体等。</p><p><strong>六、活动内容</strong></p><ol><li><strong>攀岩比赛</strong>：设置不同难度级别的攀岩路线，分为男子组、女子组和团队组，参赛选手在规定时间内完成攀岩，以用时最短者为胜。</li><li><strong>攀岩论坛</strong>：邀请国内外知名攀岩教练、专家、运动员进行主题演讲和分享，探讨攀岩技术、攀岩文化、攀岩产业发展等话题。</li><li><strong>攀岩装备展示</strong>：邀请攀岩装备厂商展示最新的攀岩装备和技术，为攀岩爱好者提供了解和选择装备的机会。</li><li><strong>攀岩文化体验</strong>：组织攀岩爱好者参观阳朔攀岩基地，体验攀岩的乐趣，感受阳朔攀岩文化的魅力。</li><li><strong>攀岩表演</strong>：邀请攀岩高手进行精彩的攀岩表演，展示高超的攀岩技艺，为观众带来视觉盛宴。</li></ol><p><strong>七、报名方式</strong></p><p>请访问阳朔攀岩节官方网站或关注阳朔攀岩节官方微信公众号，按照提示完成报名程序。报名费用将包括参赛费用、活动期间的住宿和餐饮等。</p><p><strong>八、奖项设置</strong></p><p>攀岩比赛将设立丰厚的奖项，包括奖金、证书和纪念品等，以表彰优秀选手和团队。</p><p><strong>九、注意事项</strong></p><ol><li>请参赛选手自备攀岩装备，确保装备的安全性和完整性。</li><li>请遵守活动现场的秩序和规定，听从工作人员的安排和指导。</li><li>注意安全，遵守攀岩规则，确保自身和他人的安全。</li></ol><p><strong>十、特别说明</strong></p><p>本次攀岩节活动将充分展示阳朔攀岩的魅力，为攀岩爱好者提供一个交流竞技的平台。同时，我们也欢迎攀岩装备厂商和相关产业从业者参与，共同推动攀岩文化的发展和传播。让我们在阳朔攀岩节上相聚，共同感受攀岩的魅力和乐趣！</p>', '见详情', '不推荐', '2024-04-11', '2024-05-30 01:58:04');
INSERT INTO `huodongxinxi` VALUES (51, 0, '2024-04-24 11:13:37', '西藏', '洛堆峰竞技登山比赛', '竞技登山', 'upload/1713928350963.jpg,upload/1713928356358.jpg,upload/1713928364379.jpg', '洛堆村', '2024-05-25 00:00:00', 500, '推荐', '无', '<p>一、日期：2024年7月20日</p><p>二、地点：洛堆峰，位于西藏自治区，海拔8848米，是世界上海拔最高的山峰之一。</p><p>三、活动概况：</p><p>洛堆峰竞技登山比赛是一场国际性的挑战，旨在考验选手的登山技巧、体能和毅力。参赛者将面临极端的自然环境和严峻的挑战，争夺登顶洛堆峰的荣耀。</p><p>四、赛事项目：</p><ol><li>登山挑战赛：选手们将从洛堆峰南坡出发，穿越冰川、岩壁和雪崩区域，征服险峻的山峰，最终登顶成功。</li><li>速度攀登赛：选手们在规定的路线上进行速度攀登比赛，挑战自己的极限，争夺最快登顶洛堆峰的记录。</li><li>自由攀登赛：选手们在规定时间内自行选择路线，完成登顶任务，展现个人的登山技巧和决策能力。</li></ol><p>五、安全保障：</p><p>为确保比赛安全，组委会将提供专业的登山指导和救援队伍，监测气象变化和地形情况，确保选手在极端环境下安全参赛</p><p>六、装备要求：</p><ol><li>登山鞋：专业的登山鞋，具有良好的防滑和支撑性能，适合在复杂地形中行走。</li><li>登山装备：包括登山冲锋衣、登山裤、保暖内衣等，根据天气情况选择适当的厚度和材质。</li><li>头灯：用于夜间行走或在光线不足的环境中照明，保证安全。</li><li>登山杖：提供额外支撑和平衡，减轻对膝盖的压力，特别是在下山时有很大帮助。</li><li>护具：包括头盔、护膝、护肘等，提供额外的安全保障，减少受伤风险。</li><li>雪镜：防止雪盲和紫外线伤害，保护眼睛。</li><li>手套：保暖、防风、防水的登山手套，确保手部舒适和保护。</li><li>背包：轻便、耐用的登山背包，能够装下必备的装备和补给。</li><li>冰爪/登山爪：用于在冰雪或岩石上提供额外的抓地力和安全性。</li><li>睡袋和帐篷：根据比赛规定和个人需求携带，以备不时之需。</li><li>饮水设备：如水壶、水袋等，保证足够的水源补给。</li><li>食物和能量补给：携带高能量、易保存的食物，如能量棒、坚果、干果等，确保能够补充足够的能量。</li><li>其他个人必需品：包括个人药品、防晒霜、唇膏、急救包等。</li></ol><p>七、奖项设置：</p><ol><li>冠军奖杯及丰厚奖金</li><li>亚军奖杯及奖金</li><li>季军奖杯及奖金</li><li>最佳新人奖</li><li>最佳女选手奖</li></ol><p>八、参赛资格：</p><p>参赛选手需提交个人登山经历及健康状况证明，并具备相关登山技能和经验。未满18岁者需提供监护人同意书。</p><p>九、报名方式：</p><p>请访问我们的官方网站进行在线报名，并缴纳报名费用。报名截止日期为比赛前一个月。</p><p>洛堆峰竞技登山比赛将成为登山界的一次盛会，吸引世界各地的登山爱好者和专业选手前来挑战自我、超越极限，共同书写登山历史的辉煌篇章！</p><p><br></p><p><br></p><p><br></p>', '见详情', '推荐', '2024-05-07', '2024-05-30 01:53:26');
INSERT INTO `huodongxinxi` VALUES (52, 0, '2024-04-24 11:23:11', '湖南', '南岳衡山登山活动', '徒步登山', 'upload/1713928978780.jpeg,upload/1713928983041.jpeg,upload/1713928987816.jpeg', '南岳衡山风景区', '2024-04-26 00:00:00', 300, '推荐', '南岳衡山全程特种兵徒步一日游最全攻略', '<p><br></p><p>南岳衡山登山活动详情</p><p>一、日期：2024年4月26日</p><p>二、地点：南岳衡山，湖南省衡阳市南部</p><p>三、活动概况：</p><p>南岳衡山登山活动是一次挑战自我、感受自然、体验文化的徒步登山活动。参与者将有机会徒步登上南岳衡山的峰顶，领略壮美的自然景观，感受千年古刹的庄严气息，共同度过难忘的登山之旅。</p><p>四、活动流程：</p><ol><li>集合签到：上午8点在南岳衡山游客中心集合，签到并领取活动装备。</li><li>准备出发：组织者介绍活动流程、安全事项等，进行简单的热身运动，做好登山准备。</li><li>徒步登山：由专业向导带领，沿着指定路线开始徒步登山，途中欣赏自然风光，了解南岳衡山的历史文化。</li><li>中途休息：途中设有休息点，供大家休息、补充能量，交流互动。</li><li>登顶目标：前往南岳衡山主峰，观赏壮丽景色，拍照留念。</li><li>下山返程：安全下山，返回游客中心，结束活动。</li></ol><p>五、注意事项：</p><ol><li>参与者需具备一定的体能和健康状况，不宜有严重心脏病、高血压等疾病。</li><li>请穿着合适的登山装备，包括登山鞋、运动服、帽子等。</li><li>带上充足的水和一些高能量的食物，以备徒步途中需要。</li><li>遵守导游的安全指示，不擅自离队，保持队形。</li><li>注意环保，不乱扔垃圾，保护南岳衡山的自然环境。</li></ol><p>六、费用及报名方式：</p><p>活动费用为300元/人，包含导游费、登山保险、门票等。请将姓名、联系方式发送至活动邮箱或添加活动微信群进行报名，并在报名成功后10日内完成费用支付。</p><p>南岳衡山登山活动将为您带来一次难忘的户外体验，让我们一起挑战自我，感受自然的魅力，共同度过充实愉快的登山之旅！</p>', '坐登山大巴到达南天门祖师殿站，开始登山', '推荐', '2024-04-19', '2024-05-30 01:57:49');
INSERT INTO `huodongxinxi` VALUES (53, 0, '2024-04-24 11:47:34', '山东', '夜爬泰山', '徒步登山', 'upload/1713930516014.jpg,upload/1713930525810.jpg,upload/1713930532033.jpg', '泰山风景区', '2024-06-06 00:00:00', 500, '推荐', '大学生“特种兵旅行”之夜爬泰山', '<p>一、活动日期： 2024年6月6日</p><p>二、集合地点和时间：</p><p>时间：晚上8点</p><p>地点：泰山游客中心</p><p>三、活动概述：</p><p>夜爬泰山是一次难忘的徒步体验，让您在星空下征服中国古老的神山，感受大自然的神秘和壮丽。在夜幕降临之时，与泰山同在，欣赏壮观的夜景，领略别样的山间风光。</p><p>四、活动流程：</p><p>20:00 - 20:30：集合签到，领取装备（头灯、登山杖等），简要介绍活动安排和注意事项。</p><p>20:30 - 21:00：乘坐交通工具前往登山起点。</p><p>21:00 - 23:00：开始夜爬泰山之旅，沿着登山线路徒步攀登，欣赏夜晚的山间景色，感受夜色的神秘。</p><p>23:00 - 01:00：到达泰山主峰，欣赏星空、观赏夜景，拍摄美丽的夜景照片。</p><p>01:00 - 03:00：在主峰休息，享用夜宵，与同伴们交流，休息片刻。</p><p>03:00 - 05:00：观赏日出，欣赏晨曦中泰山的壮丽景色，留下珍贵的回忆。</p><p>05:00 - 07:00：开始下山返程，安全返回出发地点。</p><p>五、注意事项：</p><p>参与者需具备一定的体能和健康状况，不适宜有严重心脏病、高血压等疾病者参与。</p><p>请穿着合适的登山服装和登山鞋，保持身体舒适，并携带防寒、保暖的衣物。</p><p>活动过程中请注意安全，遵守领队的指导，不得擅自离队或逾越安全线。</p><p>请自备个人必需品，如水、食物、急救药品等，并保持环境卫生，不乱扔垃圾。</p><p>六、费用及报名方式：</p><p>活动费用为500元/人，包括交通费、导游费、夜宵等。</p><p>请将报名信息（姓名、联系方式）发送至活动组织者指定的邮箱或微信，并在报名成功后15日内完成费用支付。</p><p>夜爬泰山活动将给您带来一次难忘的夜间徒步体验，与星空相伴，与泰山同行，期待您的加入</p>', '见详情', '推荐', '2024-04-16', '2024-05-30 01:54:53');
INSERT INTO `huodongxinxi` VALUES (54, 0, '2024-05-02 22:25:04', '安徽', '去武功山', '徒步登山', 'upload/1714659847367.jpg', '武功山金顶', '2024-05-02 22:23:51', 110, '不推荐', '五', '<p>五</p>', '五', '不推荐', '2024-05-02', '2024-06-01 20:22:14');
INSERT INTO `huodongxinxi` VALUES (60, 31, '2024-05-08 21:14:09', '河南', '老君山我们来了', '徒步登山', 'upload/1715709500412.jfif', '老君山风景名胜区', '2024-05-14 21:00:03', 100, '不推荐', '无', '<p>一、活动背景：</p><p><br></p><p>老君山，位于河南省洛阳市栾川县境内，是中国著名的道教圣地之一，素有“天下第一奇山”之称。其险峻的山势、秀美的自然风光和悠久的历史文化吸引着无数游客前来观光游览。为了让更多人领略老君山的壮丽景色和文化底蕴，我们策划了这次一日游活动。</p><p><br></p><p>二、活动时间：</p><p><br></p><p>活动时间为2024年6月15日（星期六）。</p><p><br></p><p>三、活动内容：</p><p><br></p><p>1.&nbsp;上午集合：上午8点在指定集合地点集合，统一出发前往老君山景区。</p><p>2.&nbsp;上山游览：抵达景区后，游客可选择徒步或乘坐缆车上山，沿途欣赏山间美景，参观老君庙等道教文化景点。</p><p>3.&nbsp;午餐：中午在景区内或周边用餐，品尝当地特色美食。</p><p>4.&nbsp;下午游览：下午继续游览景区，可以登顶观景、游览老君洞、参观古建筑等。</p><p>5.&nbsp;返回返程：下午4点左右开始集合返回，结束愉快的一日游活动。</p><p><br></p><p>四、参与对象：</p><p><br></p><p>适合所有年龄段的游客参与，无需户外经验，身体健康者均可报名参加。</p><p><br></p><p>五、注意事项：</p><p><br></p><p>1.&nbsp;准备充足的水和食物，保持身体水分和能量补给。</p><p>2.&nbsp;根据天气情况选择合适的服装和鞋子，注意防晒和防雨。</p><p>3.&nbsp;遵守景区规定，保护环境，不随意乱扔垃圾。</p><p>4.&nbsp;在景区游览时注意安全，听从导游的安排和指导。</p><p><br></p><p>六、费用说明：</p><p><br></p><p>活动费用包括景区门票、导游费、午餐费用等，具体费用将在报名时通知参与者。</p><p><br></p><p>七、报名方式：</p><p><br></p><p>请将您的姓名、联系方式发送至活动组织者指定的报名邮箱或微信群，报名成功后会有工作人员与您联系确认。</p><p><br></p><p>八、特别提示：</p><p><br></p><p>本次活动为自费活动，建议提前报名并安排好行程，以便顺利参加活动。如有任何疑问，请随时联系活动组织者。</p>', '见详情', '登山棍', '2024-05-08', '2024-06-01 21:54:44');
INSERT INTO `huodongxinxi` VALUES (68, 31, '2024-05-16 22:30:47', '广西', '罗浮山', '徒步登山', 'upload/1715869831873.jpg', '罗浮山风景名胜区', NULL, NULL, '不推荐', '', '<p>好哦阿爸</p>', '', '不推荐', '2024-05-16', '2024-06-01 20:39:53');

-- ----------------------------
-- Table structure for marker
-- ----------------------------
DROP TABLE IF EXISTS `marker`;
CREATE TABLE `marker`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `latitude` decimal(10, 8) NOT NULL,
  `longitude` decimal(11, 8) NOT NULL,
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图片地址',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
  `addtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `activity_id` bigint NOT NULL COMMENT 'activtiyID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `activity_id`(`activity_id` ASC) USING BTREE,
  CONSTRAINT `marker_ibfk_1` FOREIGN KEY (`activity_id`) REFERENCES `huodongxinxi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of marker
-- ----------------------------
INSERT INTO `marker` VALUES (1, 23.26387000, 114.03420000, 'upload/1715869831873.jpg', '罗浮山风景名胜区', '2024-05-16 23:54:59', 68);
INSERT INTO `marker` VALUES (2, 27.45834000, 114.17596000, 'upload/1713881003018.jpg', '萍乡武功山国家级风景名胜区', '2024-05-16 23:53:44', 41);
INSERT INTO `marker` VALUES (3, 30.99911000, 102.84619000, 'upload/1713882567707.jpg', '四姑娘山景区', '2024-05-16 23:53:52', 49);
INSERT INTO `marker` VALUES (4, 24.76818300, 110.46802700, 'upload/1713883271762.jpg', '飞拉达攀岩基地', '2024-05-16 23:53:59', 50);
INSERT INTO `marker` VALUES (5, 31.72842100, 92.74617400, 'upload/1713928350963.jpg', '洛堆村', '2024-05-16 23:54:07', 51);
INSERT INTO `marker` VALUES (6, 27.26969000, 112.71543000, 'upload/1713928978780.jpeg', '南岳衡山风景区', '2024-05-16 23:54:42', 52);
INSERT INTO `marker` VALUES (7, 36.29674700, 117.08831000, 'upload/1713930516014.jpg', '泰山风景区', '2024-05-16 23:54:35', 53);
INSERT INTO `marker` VALUES (8, 27.45204700, 114.17864100, 'upload/1714659847367.jpg', '武功山国家级风景名胜区-金顶', '2024-05-16 23:54:48', 54);
INSERT INTO `marker` VALUES (9, 33.73421200, 111.65684100, 'upload/1715709500412.jfif', '老君山风景名胜区', '2024-06-01 21:54:44', 60);

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `introduction` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '简介',
  `picture` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 89 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公告资讯' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES (81, '2024-04-16 20:49:48', '趁着年轻，输得起，看得开，去经历', '我在大学一年级那一年，毫无悬念地把自己吃成了一个胖子。不是那种巨大的胖子，而是介于正规的肥胖和臃肿之间的尴尬体型，比标准体型重了15斤。于是，我的整个大学生活变成了电影《蝴蝶效应》系列，那只蝴蝶重达15斤', 'upload/news_picture1.jpg', '<p>我在大学一年级那一年，毫无悬念地把自己吃成了一个胖子。不是那种巨大的胖子，而是介于正规的肥胖和臃肿之间的尴尬体型，比标准体型重了15斤。于是，我的整个大学生活变成了电影《蝴蝶效应》系列，那只蝴蝶重达15斤。</p><p>  首先，我皈依了减肥。我可以整整一天滴水不进，然后第二天中午，一个小时之内连续去三个食堂吃午饭，每次都是两荤一素、一两米饭加一瓶大可乐，像是一个人孢子分裂出了三个暴食症患者。其次，因为要么饿得百爪挠心，要么撑得寝食难安，我变成了一个昼夜颠倒的人，再加上觉得自己邋遢难看，不愿见人，便逃掉了很多课。其三，逃课的空虚让我花了大量时间网购，击败了全国90%以上的电商消费者，和快递员结下了深厚的友谊。我买的大多数是衣服，衣服又穿不进，羞愤难当，继续皈依减肥。总之，那是我非常不快乐的几年。因为难以接受自己，所以蜷缩着，拒绝他人。</p><p>    我很久之后才知道，人用来自憎的大脑边缘系统，在童年时就已经形成。可是，用来开导自己、原谅自己、使自己变得强大的智慧，却往往在我们本该成熟的年纪依然不具备。每一世代的年轻人都是脆弱的、敏感的、容易受他人影响的。而对于正年轻的一代来说，这个挑战异乎寻常的艰难。</p><p> 电影《楚门的世界》中提出了一个假设以及相应的解答:当一个人活在所有人的窥探之下，他应该怎么办?答案是:他逃走，获得自由。然而，如果所有人活在所有人的窥探之下，那又该如何逃避?这不是假设，而是正在悄然发生的现实。我们无时无刻不在朋友圈、微博、贴吧、个人主页上展现自己的生活，同时，也在同样的平台上窥探他人的生活。我们无时无刻不在评估他人，同时，也在接受他人的评估。“个性张扬”只是狐假虎威的外衣，为的是掩饰自卑与自恋此起彼伏、相爱相杀的脆弱。我们羡慕嫉妒他人，也努力把自己的生活修饰得让他人羡慕嫉妒。我们对他人的意见过于敏感，无法忍受不被“点赞”的人生。</p><p>  社交网络的核心在于“社交”，社交的动力，是出于人们无法忍受孤独;人们之所以无法忍受孤独，是因为人们无法拷问自己。可是，总有一天，我们要站在镜子前，发现我们并不是自己创造出来的那个有趣、可爱、有吸引力、有能力的人。那么，你还喜欢镜子里的自己吗?或者，镜子里的你还喜欢自己吗?这个世界是否称赞你、羡慕你、爱你，在某种程度上是个不断膨胀的谎言。关键的问题在于，你是否对自己足够诚实，并且接受诚实之后的不完美。</p><p>   失去的痛苦、被拒绝的痛苦、被伤害的痛苦、分别的痛苦，它们如此显眼地横在前行的路上，让人想逃遁到那个充满着“赞”的虚幻世界里。然而，我们是人，走在一条从摇篮到坟墓的路上，年轻在途中，衰老在途中。必须和真实的世界发生联系，而不是兀自为尚未发生的事情恐惧;必须和真实的人发生各种关系，而不是如一座座只能遥远眺望的孤岛。</p><p>那些杀不死我们的，它们有时并不会让我们更加强大，而只是成为一段诗意或自嘲的记忆。趁着年轻，输得起，看得开，去经历。那些杀不死我们的，它们在混沌而无序的未来里，并不能成为我们手中的武器，却为我们的存活，增加了反抗脆弱与敏感的韧性。</p>');
INSERT INTO `news` VALUES (82, '2024-04-16 20:49:48', '大学就该抓住青春，用汗水实现梦想', '大学之青春，人生之春，人生之王，人生之华也，宝贵的时光我们理当去珍惜。然而，当我们在青春布满藤墓的围墙上缓慢的攀行时;依旧游离在青春摇摆不定的尾巴上时;奋力想抓却抓不住，用力一扯，却又是散落一地的音符时;我们是否该回头思考了。零零碎碎的记忆，偶尔会闪过寂寞的长空，飘然在无际的苍穹，仅仅留下几颗闪烁的残星让我们自己深思，青春易逝，好比东逝的水—去不复还', 'upload/news_picture2.jpg', '<p>  大学之青春，人生之春，人生之王，人生之华也，宝贵的时光我们理当去珍惜。然而，当我们在青春布满藤墓的围墙上缓慢的攀行时;依旧游离在青春摇摆不定的尾巴上时;奋力想抓却抓不住，用力一扯，却又是散落一地的音符时;我们是否该回头思考了。零零碎碎的记忆，偶尔会闪过寂寞的长空，飘然在无际的苍穹，仅仅留下几颗闪烁的残星让我们自己深思，青春易逝，好比东逝的水—去不复还。</p><p>  青春是属于我们的，是人生最最美好的时光。我们应该好好把握住现在象牙塔的点点滴滴。大学对于我们来说很重要，这里充满了好奇、机遇和挑战。当我懵懵懂懂的走过了两年才突然发现原来大学是这样的，每个人有不同的选择，有不同的理想，也有不同的人生。但是无论怎样都是一个博学的过程，学做人，学知识，学生活..…...春是疯狂的，是充满激情的，是奋斗的，最重要的是我们要坚定我们的梦想，为了梦想付出一切，为了梦想坚持到底，这才是真正的青春。青春的梦想就是黑夜里的灯塔在我们迷茫时给予我们方向，就是力量的源泉在我们身陷逆境时给予我们最大的动力，就是爱的港湾在我们屡次失败时给予我们受伤的心灵以安慰。因此无论何时何地，都不能忘却心里坚守的那份沉甸甸的梦想。</p><p>   青春的梦想很简单，可能是梦想成为学习的佼佼者让GPA无限趋于4.0，可能是梦想成为学生工作的杰出者当上主席为自己的从政事业奠定基础，也可能是梦想成为运动场上的超级明星拥有大量的球迷粉丝，也可能是梦想成为职场达人，面试无压力，就业有保障...….或许你觉得这些都算不上梦想，其实梦想并不分大小和轻重，不能说只有中国梦才算是梦想，梦想就是这样每个人有不同的定位，但都是值得去追逐的，去为之奋斗的。()拥有了梦想，就有了坚定的信念，海风再大海浪再大，也无法扼杀我们追逐胜利的信念。信念给我们坚持的勇气，勇气赐我们昂扬的斗志，斗志带我们摆脱厄运;拥有了梦想，就能化压力为动力，梦想会时刻在鞭策我们，鼓励我们，让我们审视自己，发现不足，奋力补救，让自己保持不懈的前进动力;拥有了梦想，我们就不会在迷茫的路上更加迷茫，我们就能在青春之歌复杂的五线谱中听到动人的旋律。</p><p>   我们是大学生，是祖国的未来，是民族复兴的脊梁，面对如此重任，怎么能不胸怀大志，坚定梦想，在青春的道路上奋斗。“恰同学少年，风华正茂，书生意气，挥斥方道。”青春是黄金时段，我们要以梦想为方向，扬帆起航，努力拼搏，给我们即将失去的青春以最好的结局。人因梦想而伟大，让我们一起奏响青春的梦想之歌，为各自的梦想努力进发吧!</p>');
INSERT INTO `news` VALUES (83, '2024-04-16 20:49:48', '你也可以攀登的雪山，中国7座\"入门级\"山峰', '公元前一世纪，凯撒大帝率领他的军队抵达了英格兰，他决心要赢得这场战争，不管遇到什么情况都不会退却。为了让士兵们明白自己必胜的决心和信心，也为了断绝士兵们逃跑退缩的念头，凯撒命令士兵将运载他们的所有船只都烧毁。这使得军队的士气受到了莫大的鼓舞。后来他们获胜了', 'upload/1715700712276.jpg', '<p>对于热爱雪山的户外爱好者来说</p><p>雪山攀登并非遥不可及</p><p>不论你是想感受</p><p>雪山的容貌和震撼的风景</p><p>还是打算加入登山爱好者的行列</p><p>都需从易到难，循序渐进</p><p>今天整理了7座入门级山峰</p><p>为热爱雪山的爱好者提供参考</p><p><br></p><p><br></p><p>7座入门级山峰，开启不一样的登山行</p><p><br></p><p><br></p><p>1、四姑娘山三峰</p><p><br></p><p><br></p><p><br></p><p><span style=\"background-color: transparent;\"><img src=\"https://pic3.zhimg.com/80/v2-3bd422ebffc740d4f00dedecf94bc43e_720w.webp\" height=\"358\" width=\"640\"></span></p><p><br></p><p><br></p><p><br></p><p>四姑娘山三峰，海拔5355米，就在四姑娘山二峰旁边。属于初级技术性雪山攀登的体验级，攀登过二峰的队员可尝试攀登三峰。只要体力好无高反，就可以尝试攀登。如从没攀登经验，建议跟随商业团队。</p><p><br></p><p><br></p><p><br></p><p><span style=\"background-color: transparent;\"><img src=\"https://pic3.zhimg.com/80/v2-61a2f6f9eb0bc5826bc2d1b8ba8f938a_720w.webp\" height=\"480\" width=\"640\"></span></p><p><br></p><p><br></p><p><br></p><p>行进大本营沿途景色以雪山、瀑布、原始森林、高山灌木为主，可以看到雄伟的婆缈峰、五色神山、日月宝镜等风景。一般7小时左右可登顶，中午12点前不能登顶，因天气原因，须下撤，择机再试！攀登费用约1500元。</p><p><br></p><p><br></p><p><br></p><p><span style=\"background-color: transparent;\"><img src=\"https://pic2.zhimg.com/80/v2-e749a93265866f679f6c51cda032ab65_720w.webp\" height=\"427\" width=\"640\"></span></p><p><br></p><p><br></p><p>风险预估</p><p>保暖，勤且少量喝水，防高反，体力有所准备，小心碎石坡路段，下撤需小心。</p><p><br></p><p><br></p><p>2、哈巴雪山</p><p><br></p><p><br></p><p>哈巴雪山，海拔5396米，位于香格里拉县东南部，山势上部较为平缓，下部则陡峭壁立，攀登季节为每年11月到次年2月，受季风影响，1、2月风力较 大，经常达8级以上。11月与12月风力较小，是攀登的最佳季节。</p><p><br></p><p><br></p><p><br></p><p><span style=\"background-color: transparent;\"><img src=\"https://pic3.zhimg.com/80/v2-b09657a99659b0014641207e0ea41a6e_720w.webp\" height=\"450\" width=\"640\"></span></p><p><br></p><p><br></p><p><br></p><p>哈巴雪山几乎是登山爱好者的必登之地，是一座适合初级登山爱好者攀登的山峰，但这不意味着可以轻视它的难度，更需要时刻注意安全。冰雪较多，有一定雪崩危险，没有特别的攀登难度。需要注意的是有一段大雪坡，如果滑坠下来会要命。</p><p><br></p><p><br></p><p><br></p><p><span style=\"background-color: transparent;\"><img src=\"https://pic4.zhimg.com/80/v2-7eeed4ffabc6e3e32f817791e167ecf7_720w.webp\" height=\"426\" width=\"640\"></span></p><p><br></p><p><br></p><p>风险预估</p><p>保暖，勤且少量喝水，防高反，体力有所准备，有一段陡峭雪坡需要攀冰。攀登费用约2400元，登顶时间需5至7小时。如无攀登经验需跟随商业队前行，并进行登山基础技术培训。</p><p><br></p><p><br></p><p>3、雪宝顶雪山</p><p><br></p><p><br></p><p>雪宝顶，5588米，岷山主峰，位于成都以北345公里处，属松潘县。雪宝顶雪线4700米，冰雪量大，是一座冰晶山，难度较前四座有明显提升，属于提 升级山峰，需垂直升降装备和较多的冰雪操作。</p><p><br></p><p><br></p><p><br></p><p><span style=\"background-color: transparent;\"><img src=\"https://pic2.zhimg.com/80/v2-b80e02b27a4cbc3639a30f115efc8809_720w.webp\" height=\"480\" width=\"640\"></span></p><p>图片作者：沉三水斩晖</p><p><br></p><p><br></p><p>1986年8月，四川登山协会同日本喜马拉雅登山协会组成联合登山队，首次登上了雪宝顶。1999年北大女生周慧霞在攀登雪宝顶时坠崖身亡。冬季新雪下后三天内雪崩频繁，不过近几年每年有多达十几支的业余登山队登顶成功。每年10月到翌年4月为旱季，5月至9月 为雨季，7、8月雨水较少，是登山的理想季节。攀登费用约2800元。</p><p><br></p><p><br></p><p><br></p><p><span style=\"background-color: transparent;\"><img src=\"https://pic2.zhimg.com/80/v2-97473f5fd5bd0cf24921d7e57ccd7f9d_720w.webp\" height=\"853\" width=\"640\"></span></p><p>图片作者：沉三水斩晖</p><p><br></p><p><br></p><p>可以提前在碎石坡处做好标记避免凌晨冲顶的时候绕到更远更难的路上。从大本营出发需要戴雪套（冬季大本营积雪）雪宝顶山体整体风化比较厉害，滑坠的危险系数比较高，骆驼背那段路尤其要小心。</p><p><br></p><p><br></p><p><br></p><p><span style=\"background-color: transparent;\"><img src=\"https://pic1.zhimg.com/80/v2-6fbc02903e77b4af14dd7eb964f2f920_720w.webp\" height=\"480\" width=\"640\"></span></p><p>图片作者：知行</p><p><br></p><p><br></p><p>风险预估</p><p>滑坠危险、碎石坡落石，初学者建议聘请专业向导 ，攀登及绳锁操作有一定基础，防风保暖，注意高反。</p><p><br></p><p><br></p><p><br></p><p><span style=\"background-color: transparent;\"><img src=\"https://pic4.zhimg.com/80/v2-e448065b6cfd3b2648c1b6912ab96433_720w.webp\" height=\"338\" width=\"640\"></span></p><p><br></p><p><br></p><p><br></p><p>4、岗什卡雪山</p><p><br></p><p><br></p><p>门源回族自治县境内的一座尽显北国风光的雪峰，山峰海拔5254.5米，是祁连山脉东段的最高峰，峰顶常年白雪皑皑，银光熠熠，宛如一条玉龙 ，也是门源境内群山之首。平时远眺，一片洁白，每当夕阳西下，晚霞辉映，山顶五彩缤纷，暮霭升腾，被称为“龙峰夕照”，是门源八大景之一。岗什卡雪峰海拔不高，是登山爱好者尝试攀登的理想场所，亦可作为登山滑雪，攀登的训练基地。</p><p><br></p><p><br></p><p><br></p><p><span style=\"background-color: transparent;\"><img src=\"https://pic1.zhimg.com/80/v2-da9f5603ead014dc93cf5c3199cb455c_720w.webp\" height=\"427\" width=\"640\"></span></p><p><br></p><p><br></p><p><br></p><p>岗什卡雪峰又称冷龙岭，祁连山主峰之一，是青海省东北部距离西宁市最近的雪峰。盛夏的岗什卡雪山寒气逼人， 在海拔4500米以上多有现代冰川，雪线以下却是广阔的草原和油菜花海。海拔高差、复杂地貌，冰川与温泉、湖泊与长河神奇地结合，构成了它内涵深邃丰厚的神韵和峻拔飘逸的气质。</p><p><br></p><p><br></p><p>岗什卡山峰地区属高寒半温气候区，3、4月为大风天气。6―7月、9―10是最佳登山季。</p><p><br></p><p><br></p><p><br></p><p><span style=\"background-color: transparent;\"><img src=\"https://pic1.zhimg.com/80/v2-3e74f7a1cb38a7f0f9fdb0d133489f04_720w.webp\" height=\"378\" width=\"640\"></span></p><p><br></p><p><br></p><p><br></p><p>进山线路</p><p>从西宁到岗什卡的交通十分便利，有两条公路可走：</p><p>1.西宁→大通→大坂山→青石嘴→盘坡山口→大本营；</p><p>2.西宁→互助土族自治县→北山林场→门源县城→石嘴镇→盘坡山口→大本营。</p><p><br></p><p><br></p><p>攀登线路</p><p>岗什卡的攀登以冰雪技术为主，路线上冰裂缝较多。攀登时应结组。在岗什卡地区，一般修路和登顶需3天的好天气。这里海拔与青藏高原腹地同一高度相比，含氧量要高，所以基本不会有明显的高山反应，因为它的北坡是河西走廊，海拔只有1300米左右。</p><p><br></p><p><br></p><p><br></p><p><span style=\"background-color: transparent;\"><img src=\"https://pic3.zhimg.com/80/v2-5dfb022d9ffca2315238fd64812451aa_720w.webp\" height=\"426\" width=\"640\"></span></p><p><br></p><p><br></p><p><br></p><p>5、素珠链雪山</p><p><br></p><p><br></p><p>素珠链，位于甘肃省肃南裕固族自治县境内，又名祁连峰。素珠链峰有较大面积现代冰川，因其覆盖冰川呈念珠状，故又名素珠链峰，属北祁连加里东褶皱带。一般海拔4700—4900米，主峰海拔5547米，为走廊南山主峰。属高原半干旱气候区，北坡海拔1500--1800米为灌木荒漠和山地荒漠草原带，1800-2500米为灌丛草原和山地草原带，2500--3800为高山灌丛草甸带，3800--4500米为冰源高山寒漠带，4500以上为雪冰带。</p><p><br></p><p><br></p><p><br></p><p><span style=\"background-color: transparent;\"><img src=\"https://pic1.zhimg.com/80/v2-c1ea42b33c6bb9c9e6b610adca8da5d8_720w.webp\" height=\"480\" width=\"640\"></span></p><p><br></p><p><br></p><p><br></p><p>气候状况</p><p>素珠琏地区属高寒半干旱气候，年平均气温约5℃～9℃。日照长，昼夜温差显著，夏季炎热，冬季寒冷，干旱多风。年平均降雨量84毫米，集中在6--10月，年平均降雨日数62天。冰冻：最冷时冻土深度为1.32米，冰冻期一般在11月至次年4月。</p><p><br></p><p><br></p><p>进山线路</p><p>从兰州坐火车抵达酒泉市，包车从酒泉到素珠链山脚下。</p><p><br></p><p><br></p><p><br></p><p><span style=\"background-color: transparent;\"><img src=\"https://pic4.zhimg.com/80/v2-927760a982e294d44f1f8037e3a7111b_720w.webp\" height=\"480\" width=\"640\"></span></p><p><br></p><p><br></p><p><br></p><p>攀登线路</p><p>抵达当天适应休息一天，到市区采购装备食物，山区一直有水，一路水源充足。第二日：市区出发中午抵达矿点，此时考虑装备的运送，休息饭后出发行进3小时到达4100的冰舌地带，约6点到达4500米BC营地（U形雪坳地带）对面就是准备开始攀登的400多米的大雪梁，需要先锋铺设路绳。</p><p><br></p><p><br></p><p><br></p><p><span style=\"background-color: transparent;\"><img src=\"https://pic2.zhimg.com/80/v2-2dd46fa0230d71f29a69c96a495cd2f9_720w.webp\" height=\"480\" width=\"640\"></span></p><p><br></p><p><br></p><p><br></p><p>第三日早8点出发，翻越雪坡到达海拔5200米的山脊侧面，重装时间约5-6小时，露营休息，第四日早5点轻装出发，9点到达顶峰下的山脊，需要翻越迎面的雪坡中午1点登顶5562米，随后下撤至5200米的C1营地，此时，队员体力可以的话继续下撤到4500的BC，或者在5200的C1休整，第四日早晨8点出发下撤翻越雪梁至4500的BC需要3-4小时，赶下午6点返回到矿点在回到市区，建议随协作或向导按计划和路线行进。</p><p><br></p><p><br></p><p><br></p><p><br></p><p><span style=\"background-color: transparent;\"><img src=\"https://pic3.zhimg.com/80/v2-118c150cde642487fe00245bc8b67266_720w.webp\" height=\"428\" width=\"640\"></span></p><p><br></p><p><br></p><p><br></p><p>6、玉珠峰</p><p><br></p><p><br></p><p>玉珠峰，海拔6178米，为昆仑山中段主峰，位于青海格尔木南160公里处，南坡雪线5100米，南坡山势平缓，无雪崩可能，一路多为雪坡，为典型 6000米级入门雪山。</p><p><br></p><p><br></p><p>全程需8天时间，费用5000-8000元左右（商业队），是登山初学者最理想的训练山峰。如果你有了几座5000米级的山峰经验，可以试试这个6000米级的入门雪山，听起来更加高大上一些。</p><p><br></p><p><br></p><p><br></p><p><span style=\"background-color: transparent;\"><img src=\"https://pic3.zhimg.com/80/v2-c9cd83ec7526eb08a5ace3dee911034a_720w.webp\" height=\"853\" width=\"640\"></span></p><p>图片作者：一粒凡尘</p><p><br></p><p><br></p><p>玉珠峰的山形地貌对于初学登山者是非常理想的。其南坡路线清楚明 了，对于攀登技术要求较低，但大本营的高度却相对较高，为海拔5040米。玉珠峰的另外一侧的北坡路线却比较复杂，沿着北侧的三条冰川均可登上玉珠峰。途 中会遇到冰壁，冰裂缝等地形。因此玉珠峰是登山爱好者初次攀登6000米级雪山的最佳山峰，可以在南坡获得高海拔地区的登山经历而在北坡学到更多的冰雪技术和登山技术。</p><p><br></p><p><br></p><p><br></p><p><span style=\"background-color: transparent;\"><img src=\"https://pic4.zhimg.com/80/v2-80bfba88bad22efbe082b6f265a304ff_720w.webp\" height=\"427\" width=\"640\"></span></p><p><br></p><p><br></p><p><br></p><p>该山峰南坡路线，以雪坡为主，BC（大本营）设于海拔5040米， C1设于海拔5600米，玉珠峰基本算是体力型山峰，10月份没有冰冻，相对更好攀登。滑坠制动、雪地行走是必须要掌握的。</p><p><br></p><p><br></p><p><br></p><p><span style=\"background-color: transparent;\"><img src=\"https://pic2.zhimg.com/80/v2-f21e956ffd6f1e9cc1783408719703ad_720w.webp\" height=\"424\" width=\"640\"></span></p><p><br></p><p><br></p><p>风险预估</p><p>调整高原反应，登顶时间要掌控好，下午2点左右开始变天，风雪很大，注意保暖，后援工作要做好，体能、装备、必要的攀登技术。</p><p><br></p><p><br></p><p>7、慕士塔格峰</p><p><br></p><p><br></p><p><br></p><p><span style=\"background-color: transparent;\"><img src=\"https://pic1.zhimg.com/80/v2-4bb2de1219380e741b0890aac28a13d4_720w.webp\" height=\"426\" width=\"640\"></span></p><p><br></p><p><br></p><p><br></p><p>慕士塔格峰，海拔7546米，位于新疆维吾尔族自治区阿克陶县与塔什库尔干塔吉克自治县交界处。俗称馒头峰，坡面比较平缓，像馒头一样可以直接走上去的，攀登难度较低，所以才成为7000米级入门山峰。如果你想给自己的攀登经历镀镀金，一定要选这座山。很多攀登珠峰和8000米级山峰的大佬，就是从这座山起步的。这是一座适应海拔高度和挑战8000米级山峰拉练的绝佳理想山峰。</p><p><br></p><p><br></p><p><br></p><p><span style=\"background-color: transparent;\"><img src=\"https://pic1.zhimg.com/80/v2-899a198336b9b876e2b2f8f06b465da0_720w.webp\" height=\"458\" width=\"640\"></span></p><p><br></p><p><br></p><p><br></p><p>慕士塔格峰的传统登山路线为西山脊和南山脊路线，尤以西山脊路线最为成熟，坡度相对平缓，为登山爱好者初涉7000米级山峰的最佳首选。该峰同样著名的是：在欧洲的高山滑雪者心中“慕士塔格峰”，又为世界上最高的能够滑雪的山体。1956年 中国和前苏联联和登山队31名队员经奋斗拚搏，最后全部登顶成功。</p><p><br></p><p><br></p><p><br></p><p><span style=\"background-color: transparent;\"><img src=\"https://pic1.zhimg.com/80/v2-9fdb40fa7654d42ea6ac6f54d4242ec4_720w.webp\" height=\"320\" width=\"640\"></span></p><p>图片作者：小龙</p><p><br></p><p><br></p><p>慕峰冲顶黄金时间是在7月初到7月中。早雪大、晚天气不稳定，雷暴、风雪天气变化极快，若想登顶，对天气选择极为重要。虽海拔7546米，其环境不比喜马拉雅山区8000更好，普遍反映难度大 于藏区8000米级的山峰。体能、保暖、适应高反是个人需要具备的三大要素。</p><p><br></p><p><br></p><p>风险预估</p><p>保暖防风，体能分配，结组行进，注意上升带来的高反，海拔高度带来的心理承受能力。</p><p><br></p><p><br></p><p><br></p><p>七大入门级雪山情况已介绍完毕</p><p>大家根据自身情况来选择合适的山峰</p><p>虽然每一座雪山特点不同</p><p>但给大家带来的震撼和景色</p><p>都足以让你忘掉攀登过程中的艰辛</p>');
INSERT INTO `news` VALUES (84, '2024-04-16 20:49:48', '“体育强国”大家谈│加强城乡互动 体育助力乡村振兴大有可为', '最近和几名大一的学生聊天，几名同学认为身边的人普遍都很迷茫，不知道该干什么，业余时间要么是对着电脑、要么是抱着手机刷微博。我问道:“为什么不找点事情做做，制定一个计划，哪怕是锻炼身体也好?4年也可以把身体锻炼得结实些。”当然，我也清楚，我的这些建议对他们来说，未必能有多大用。许多学生因为意志不坚定，没有老师的监督、逼迫，根本就无法做到', 'upload/news_picture4.jpg', '<p>今年全国两会，乡村振兴成为代表委员们热议的话题之一。全国政协教科卫体委员会去年曾组织送体育下基层等调研活动，多位参加过调研的全国政协委员日前接受人民网记者采访，对体育助力乡村振兴提出了独到见解和具体建议。</p><p>“体育助力乡村振兴大有可为，中国登协在这方面进行了积极探索。”全国政协委员、中国登山协会副主席王勇峰向记者介绍说，中国登协多年来一直积极助力广西马山县脱贫攻坚，根据其山地资源优势，建成了中国首个攀岩特色体育小镇，通过一系列的赛事活动带动，目前马山县已发展成为国内攀岩胜地。</p><p>王勇峰表示，马山县近些年也推动攀岩和相关产业融合，着力打造攀岩强县、攀岩名县，摸索出一条“攀岩+文旅+扶贫+县域经济发展”的道路，“中国登协将继续与马山县政府，包括广西体育局、南宁市政府等加强合作，引入更多的赛事活动，做大做强当地攀岩产业，进一步促进乡村振兴。”</p><p>通过去年赴贵州台江县的送体育下基层调研，王勇峰深刻认识到“村超”“村BA”在贵州发起并火爆出圈绝不是偶然的。随着国家全民健身战略的深入实施，老百姓体育锻炼的热情日益提升，群众体育基础逐步夯实，大众体育赛事活动应运而生。他们下基层时与当地孩子开展体育交流，也受到了热烈欢迎，“我希望有更多的体育工作者能走进乡村，促进体育与乡村振兴的更大融合，争取有更大的发展。”</p><p>对于“村超”“村BA”的突然爆红，全国政协委员、北京体育大学中国体育政策研究院院长鲍明晓认为，这高度契合了乡村振兴建设、体育强国建设、美丽中国建设和人们追求美好生活的时代背景，也可见体育能够成为促进乡村振兴、推动区域资源利用和提高群众幸福指数的重要手段。</p><p>鲍明晓希望“村BA”“村超”等赛事能走出一条可持续发展之路，在坚持本土化、坚守“乡土味”的同时，进一步提升品牌形象，深化城乡互动，带动当地文旅产业发展和农副产品销售，避免火热一阵后走向沉寂。如果没能持续深耕发力，放大其品牌效应，就浪费了这些赛事IP的价值内涵。</p><p>全国政协委员、农工党浙江省委会副主委、良渚实验室常务副主任、浙江理工大学副校长、浙江大学医学院教授欧阳宏伟在贵州的调研活动中主要做的是科普讲座，但他同样发现当地孩子对体育的热情高涨，体育活动搞得有声有色。“‘村超’‘村BA’这些赛事的火热，提升了当地知名度，进一步拉动当地文旅发展，激发了乡村振兴的新活力。”</p><p>欧阳宏伟目前主要居住在浙江杭州市，他介绍说，杭州无论是城市还是农村，这些年全民健身发展得非常好，健身设施日益完善，下辖的远郊区县充分挖掘地方资源，如临安区青山湖，发展健步走、水上运动等休闲健身方式，吸引各地游客前来，加强了城市与乡村的互动，进一步提高乡村收入，有力促进实现共同富裕。（文章来源：人民网）</p>');
INSERT INTO `news` VALUES (85, '2024-04-16 20:49:48', '追光｜他们生于山间 他们登上亚洲之巅', '最坚强的人，是以宽容的态度面对自己缺点的人，而懦弱的人，则不敢面对自己的缺点，最终自暴自弃，葬送自己。只要有进取心，我们都能从失败的领域中，发现到达成功的途径;只要有自信心，我们身上的每一个缺陷，也都可以成为与众不同的优点', 'upload/1715700863677.jpg', '<p class=\"ql-align-center\">今天</p><p class=\"ql-align-center\">2024滑雪登山亚锦赛在吉林省吉林市落下帷幕</p><p class=\"ql-align-center\">在混合接力比赛中</p><p class=\"ql-align-center\">中国选手布鲁尔/次旦玉珍以绝对优势</p><p class=\"ql-align-center\">获得冠军</p><p class=\"ql-align-center\">两人也成为了本届亚锦赛中</p><p class=\"ql-align-center\">最闪亮的“星”</p><p class=\"ql-align-center\">将满18岁的次旦玉珍</p><p class=\"ql-align-center\">还包揽了本次比赛</p><p class=\"ql-align-center\">全部三个女子个人项目的冠军</p><p class=\"ql-align-center\">布鲁尔也有两枚个人金牌入账</p><p class=\"ql-align-center\"><img src=\"https://xhimg.sports.cn/Image/allimg/240307/135-24030G10002J1.jpg\"></p><p class=\"ql-align-center\">↑布鲁尔(左)和次旦玉珍在比赛中完成接力。于峰摄</p><p class=\"ql-align-center\">这对年轻的雪上新星</p><p class=\"ql-align-center\">来自西部边疆的大山之间</p><p class=\"ql-align-center\">次旦玉珍</p><p class=\"ql-align-center\">生长在平均海拔3800多米的西藏隆子县</p><p class=\"ql-align-center\">布鲁尔则来自国内的滑雪胜地——新疆禾木</p><p class=\"ql-align-center\">那里是古老的毛皮滑雪的发源地</p><p class=\"ql-align-center\">当地知名山峰云霄峰海拔2800米</p><p class=\"ql-align-center\"><img src=\"https://xhimg.sports.cn/Image/allimg/240307/135-24030G10013118.jpg\"></p><p class=\"ql-align-center\">↑2023年1月12日拍摄的新疆阿勒泰地区禾木吉克普林滑雪场(无人机照片)。新华社记者 胡虎虎 摄</p><p class=\"ql-align-center\">这样的成长环境</p><p class=\"ql-align-center\">令两人都拥有了强大的心肺能力</p><p class=\"ql-align-center\">和对高海拔的适应力</p><p class=\"ql-align-center\">也让他们成为滑雪登山</p><p class=\"ql-align-center\">这项在山峰环境中进行的冬奥新项目的</p><p class=\"ql-align-center\">绝佳人选</p><p class=\"ql-align-center\"><img src=\"https://xhimg.sports.cn/Image/allimg/240307/135-24030G1203S46.jpg\"></p><p class=\"ql-align-center\">↑混合接力赛中，布鲁尔撞线后与次旦玉珍和教练庆祝<img src=\"https://www.cmasports.cn/Image/allimg/240307/135-24030G10535.gif\"><img src=\"https://www.cmasports.cn/Image/allimg/240307/135-24030G10535.gif\"><img src=\"https://www.cmasports.cn/Image/allimg/240307/135-24030G10535.gif\"><img src=\"https://www.cmasports.cn/Image/allimg/240307/135-24030G10535.gif\"><img src=\"https://www.cmasports.cn/Image/allimg/240307/135-24030G10535.gif\"><img src=\"https://www.cmasports.cn/Image/allimg/240307/135-24030G10535.gif\"><img src=\"https://www.cmasports.cn/Image/allimg/240307/135-24030G10535.gif\"><img src=\"https://www.cmasports.cn/Image/allimg/240307/135-24030G10535.gif\"><img src=\"https://www.cmasports.cn/Image/allimg/240307/135-24030G10535.gif\"><img src=\"https://www.cmasports.cn/Image/allimg/240307/135-24030G10535.gif\"><img src=\"https://www.cmasports.cn/Image/allimg/240307/135-24030G10535.gif\"></p><p class=\"ql-align-center\">滑雪登山</p><p class=\"ql-align-center\">是最接近冬季雪山居民传统出行方式的运动之一</p><p class=\"ql-align-center\">顾名思义</p><p class=\"ql-align-center\">项目由登山和滑雪两个环节组成</p><p class=\"ql-align-center\">选手需要先在雪面上攀上山坡或山峰</p><p class=\"ql-align-center\">再从高处滑行而下</p><p class=\"ql-align-center\">&nbsp;</p><p class=\"ql-align-center\"><img src=\"https://xhimg.sports.cn/Image/allimg/240308/135-24030Q1205OT.jpg\"></p><p class=\"ql-align-center\">↑选手们在本届亚锦赛混合接力比赛中。于峰 摄</p><p class=\"ql-align-center\">攀登时</p><p class=\"ql-align-center\">选手或在雪板下粘贴止滑带</p><p class=\"ql-align-center\">或背着雪板行进</p><p class=\"ql-align-center\">这是模拟雪山居民踩着毛皮雪板爬升</p><p class=\"ql-align-center\">以及遇到崎岖山路时背板徒步登山的过程</p><p class=\"ql-align-center\">而在比赛中过旗门下滑</p><p class=\"ql-align-center\">则模拟了人们下山绕障碍物滑行的过程</p><p class=\"ql-align-center\">&nbsp;</p><p class=\"ql-align-center\"><img src=\"https://xhimg.sports.cn/Image/allimg/240308/135-24030Q12046406.jpg\"></p><p class=\"ql-align-center\">↑布鲁尔在比赛中。于峰 摄</p><p class=\"ql-align-center\">这项运动在中国的发展始于民间</p><p class=\"ql-align-center\">约20年前</p><p class=\"ql-align-center\">就有一批爱好者开始率先尝试</p><p class=\"ql-align-center\">2026年冬奥会</p><p class=\"ql-align-center\">滑雪登山将作为正式比赛项目重返冬奥舞台</p><p class=\"ql-align-center\">因此这个冬奥周期</p><p class=\"ql-align-center\">滑雪登山国家集训队正式组建</p><p class=\"ql-align-center\">由于高水平国际赛事的举办地</p><p class=\"ql-align-center\">多在海拔两三千米的山区</p><p class=\"ql-align-center\">因此国家队在选材时</p><p class=\"ql-align-center\">将重点放在了拥有高海拔山区地形</p><p class=\"ql-align-center\">的新疆、西藏等地</p><p class=\"ql-align-center\">&nbsp;</p><p class=\"ql-align-center\"><img src=\"https://xhimg.sports.cn/Image/allimg/240308/135-24030Q12035M4.jpg\"></p><p class=\"ql-align-center\">↑部分滑雪登山国家集训队队员在雪山上合影。受访者供图</p><p class=\"ql-align-center\">2006年出生的次旦玉珍</p><p class=\"ql-align-center\">童年经常和父母一起放牧</p><p class=\"ql-align-center\">有时一整天都在高原的牧场上奔跑</p><p class=\"ql-align-center\">也从不觉得累</p><p class=\"ql-align-center\">小学时，她入选当地体校</p><p class=\"ql-align-center\">开始练习竞走</p><p class=\"ql-align-center\">&nbsp;</p><p class=\"ql-align-center\"><img src=\"https://xhimg.sports.cn/Image/allimg/240308/135-24030Q12023393.jpg\"></p><p class=\"ql-align-center\">↑儿时的次旦玉珍。受访者供图</p><p class=\"ql-align-center\">2020年，通过跨界跨项选拔</p><p class=\"ql-align-center\">次旦玉珍“转行”练习滑雪登山</p><p class=\"ql-align-center\">和队里的很多孩子一样</p><p class=\"ql-align-center\">她以前从没接触过冰雪</p><p class=\"ql-align-center\">更不知道滑雪登山是怎样的项目</p><p class=\"ql-align-center\">刚开始时</p><p class=\"ql-align-center\">她说自己每次转弯都会摔倒</p><p class=\"ql-align-center\">面对陡坡也很害怕</p><p class=\"ql-align-center\"><img src=\"https://xhimg.sports.cn/Image/allimg/240308/135-24030Q11954Z9.jpg\"></p><p class=\"ql-align-center\">↑次旦玉珍在欧洲参加比赛。受访者供图</p><p class=\"ql-align-center\">在不计其数的“爬上山、滑下去”之后</p><p class=\"ql-align-center\">次旦玉珍逐渐喜欢上在雪山超越对手</p><p class=\"ql-align-center\">再畅快而下的感觉</p><p class=\"ql-align-center\">而在初步掌握技术后</p><p class=\"ql-align-center\">她的体能天赋也逐渐显现</p><p class=\"ql-align-center\">其他选手完赛后会累到力竭</p><p class=\"ql-align-center\">她却经常比完后还活力满满</p><p class=\"ql-align-center\">不用休息就跑去给其他队友大声加油</p><p class=\"ql-align-center\">&nbsp;</p><p class=\"ql-align-center\"><img src=\"https://xhimg.sports.cn/Image/allimg/240308/135-24030Q119439C.jpg\"></p><p class=\"ql-align-center\">↑次旦玉珍在本届亚锦赛中。于峰 摄</p><p class=\"ql-align-center\">在教练金煜博眼中</p><p class=\"ql-align-center\">次旦玉珍是个“天赋+努力”型的选手</p><p class=\"ql-align-center\">“上升阶段(即爬升阶段)</p><p class=\"ql-align-center\">她经常能比一些男选手还快</p><p class=\"ql-align-center\">对于训练，她从未懈怠过”</p><p class=\"ql-align-center\">&nbsp;</p><p class=\"ql-align-center\"><img src=\"https://xhimg.sports.cn/Image/allimg/240308/135-24030Q1192E61.jpg\"></p><p class=\"ql-align-center\">↑次旦玉珍在训练中。受访者提供</p><p class=\"ql-align-center\">2023年2月</p><p class=\"ql-align-center\">首次参加国际比赛的次旦玉珍</p><p class=\"ql-align-center\">就在青年世界杯比赛中</p><p class=\"ql-align-center\">夺得U18组个人越野赛和垂直竞速赛冠军</p><p class=\"ql-align-center\">同年3月</p><p class=\"ql-align-center\">在2023滑雪登山世锦赛中</p><p class=\"ql-align-center\">次旦玉珍再次在两个项目的U18组别夺金</p><p class=\"ql-align-center\">尤其是在垂直竞速(即只比上升阶段的项目)中</p><p class=\"ql-align-center\">以领先第二名近一分钟的巨大优势夺冠</p><p class=\"ql-align-center\">一个月内连续两次包揽两个项目的金牌</p><p class=\"ql-align-center\">次旦玉珍在同年龄组别中</p><p class=\"ql-align-center\">已展现出了世界级水平</p><p class=\"ql-align-center\">&nbsp;</p><p class=\"ql-align-center\"><img src=\"https://xhimg.sports.cn/Image/allimg/240308/135-24030Q11K9118.jpg\"></p><p class=\"ql-align-center\">↑次旦玉珍(中)在青年世界杯的颁奖仪式上。受访者供图</p><p class=\"ql-align-center\">次旦玉珍的搭档布鲁尔</p><p class=\"ql-align-center\">除了一样拥有高海拔地区的成长经历外</p><p class=\"ql-align-center\">还从小便与滑雪结缘</p><p class=\"ql-align-center\">“当时只有很传统的毛皮滑雪板</p><p class=\"ql-align-center\">周末和寒假我都会和同学一起上山滑雪</p><p class=\"ql-align-center\">感觉特别快乐”</p><p class=\"ql-align-center\">&nbsp;</p><p class=\"ql-align-center\"><img src=\"https://xhimg.sports.cn/Image/allimg/240308/135-24030Q11J31N.jpg\"></p><p class=\"ql-align-center\">↑儿时的布鲁尔(右)和小伙伴在一起滑雪。受访者供图</p><p class=\"ql-align-center\">2021年12月</p><p class=\"ql-align-center\">当地开始组建滑雪登山队</p><p class=\"ql-align-center\">16岁的布鲁尔被选中</p><p class=\"ql-align-center\">2022年5月</p><p class=\"ql-align-center\">布鲁尔进入国家集训队</p><p class=\"ql-align-center\">在去年举行的世锦赛上</p><p class=\"ql-align-center\">布鲁尔在男子U18组的垂直竞速项目中</p><p class=\"ql-align-center\">拼得一个第六名</p><p class=\"ql-align-center\">这是中国男选手在当届世锦赛上的最好排名</p><p class=\"ql-align-center\">&nbsp;</p><p class=\"ql-align-center\"><img src=\"https://xhimg.sports.cn/Image/allimg/240308/135-24030Q11I1156.jpg\"></p><p class=\"ql-align-center\">↑布鲁尔在国外的比赛中。受访者供图</p><p class=\"ql-align-center\">在成绩之外</p><p class=\"ql-align-center\">布鲁尔觉得自己在练习滑雪登山后</p><p class=\"ql-align-center\">还收获了新的人生经历</p><p class=\"ql-align-center\">和不一样的视角</p><p class=\"ql-align-center\">“去了很多国家</p><p class=\"ql-align-center\">自己的眼界变得更开阔</p><p class=\"ql-align-center\">但也因此</p><p class=\"ql-align-center\">更爱自己的祖国和家乡”</p><p class=\"ql-align-center\">布鲁尔说</p><p class=\"ql-align-center\">去过的雪山越多</p><p class=\"ql-align-center\">他越觉得新疆禾木的山好、雪好</p><p class=\"ql-align-center\">“全世界最好”</p><p class=\"ql-align-center\">他也觉得自己已经离不开滑雪登山</p><p class=\"ql-align-center\">就算有一天练不动了</p><p class=\"ql-align-center\">他也会把雪板带在身边</p><p class=\"ql-align-center\">有时间就背着雪板上山看看</p><p class=\"ql-align-center\">&nbsp;</p><p class=\"ql-align-center\"><img src=\"https://xhimg.sports.cn/Image/allimg/240308/135-24030Q11FSS.jpg\"></p><p class=\"ql-align-center\">↑布鲁尔在本届亚锦赛中。于峰 摄</p><p class=\"ql-align-center\">这对金牌组合</p><p class=\"ql-align-center\">谈到对方时都不吝赞美</p><p class=\"ql-align-center\">双双表示“我是被他/她带飞”</p><p class=\"ql-align-center\">布鲁尔说次旦玉珍“实力超强”</p><p class=\"ql-align-center\">次旦玉珍则说布鲁尔“超级厉害，超乎想象”</p><p class=\"ql-align-center\">&nbsp;</p><p class=\"ql-align-center\"><img src=\"https://xhimg.sports.cn/Image/allimg/240308/135-24030Q11A1Z3.jpg\"></p><p class=\"ql-align-center\">↑两人在夺冠后合影。新华社记者 王沁鸥 摄</p><p class=\"ql-align-center\">尽管已经斩获多项荣誉</p><p class=\"ql-align-center\">但教练金煜博坦言</p><p class=\"ql-align-center\">与传统欧洲强队相比</p><p class=\"ql-align-center\">中国滑雪登山队还有很大提升空间</p><p class=\"ql-align-center\">接下来</p><p class=\"ql-align-center\">他们将继续备战亚冬会和米兰冬奥会资格赛</p><p class=\"ql-align-center\">期待不久的将来</p><p class=\"ql-align-center\">中国滑雪登山队</p><p class=\"ql-align-center\">能在雪上项目中</p><p class=\"ql-align-center\">为中国冰雪带来惊喜</p><p class=\"ql-align-center\">（文章来源：新华社）</p><p><br></p>');
INSERT INTO `news` VALUES (86, '2024-04-16 20:49:48', '远大的目标是成功的磁石', '上天对每个老实人都是公平的，每个人每一天都是二十四个小时，每个人的所有时间都是一生;同时上天对每个老实人又是不公平的，给每一个人的时间不都是二十四个小时，给每一个人的所有时间不都是一生。这之间的区别就在于有无远大目标', 'upload/news_picture6.jpg', '<p>  上天对每个老实人都是公平的，每个人每一天都是二十四个小时，每个人的所有时间都是一生;同时上天对每个老实人又是不公平的，给每一个人的时间不都是二十四个小时，给每一个人的所有时间不都是一生。这之间的区别就在于有无远大目标。</p><p>    有大目标的人，生活永远是积极的，他们会朝着自己的目标不断前进;没有大目标的老实人浑浑噩噩，不思进取，最后被生活淘汰。</p><p> 从前有个叫阿巴格的人生活在内蒙古草原上。有一次，年少的阿巴格和爸爸在草原上迷了路，阿巴格又累又怕，到最后快走不动了。爸爸就从兜里掏出五枚硬币，把一枚硬币埋在草地里，把其余四枚放在阿巴格的手上，说:“人生有五枚金币，童年、少年、青年、中年、老年各有一枚，你现在才用了一枚，就是埋在草地里的那一枚，你不能把五枚都扔在草原里，你要一点点地用，每一次都用出不同来，这样才不枉人生一世。今天我们一定要走出草原，你将来也一定要走出草原。世界很大，人活着，就要多走些地方，多看看，不要让你的金币没有用就扔掉。”在父亲的鼓励下，阿巴格走出了草原。长大后，阿巴格离开了家乡，成了一名十分优秀的船长。</p><p>  目标是与一个人的愿望相联系的，是对未来的一种设想，它往往和目前的行动不直接联系。但目标又不能脱离现实的生活，现实生活中的某些现象如果符合了个人的需要，与个人的世界观一致，这些现实的因素就会以个人目标的形式表现出来。目标总是对现实生活的重新加工，舍弃其中某些成分，又对某些因素给予强调的过程，但它必须以对客观规律的认识为基础，符合客观规律。</p><p> 能实现自己目标的老实人，对他个人而言，他是一个成功者，也是个幸福者。目标是成功的必要条件，虽然仅仅拥有目标，你不一定能取得成功;但是如果没有目标，成功对你而言就无从谈起。</p><p>远大的美好目标能吸引人努力为实现它而奋斗不止。</p>');
INSERT INTO `news` VALUES (87, '2024-04-16 20:49:48', '做一个最好的自己', '自信是成功的前提，你拥有自信，就拥有成功的一半机会。相信自己是最棒的就一定会成就一定的事业。拥有自信的人之所以会心想事成、走向成功，是因为他们都有着巨大无比的潜能等着去开发;消极失败的心态之所以会使人怯弱无能、走向失败，是因为它使人放弃潜能的开发，让潜能在那里沉睡、白白浪费', 'upload/news_picture7.jpg', '<p>自信是成功的前提，你拥有自信，就拥有成功的一半机会。相信自己是最棒的就一定会成就一定的事业。拥有自信的人之所以会心想事成、走向成功，是因为他们都有着巨大无比的潜能等着去开发;消极失败的心态之所以会使人怯弱无能、走向失败，是因为它使人放弃潜能的开发，让潜能在那里沉睡、白白浪费。</p><p>我们大家都知道的人大脑拥有140亿个脑细胞，但我们思维意识只利用了脑细胞的很少部分，如能将更多的脑细胞从睡眠中激活出来，人的思维意识将更加强大。如果我们都能充满自信，就能创造人间奇迹，亦能创造一个最好的自己。</p><p> 一个人相信自己是什么，就会是什么。一个人心里怎样想，就会成为怎样的人。这从心里学上讲是有一定的道理的。我们每一个人心里都有一幅心里蓝图，或是一幅自画像，有人称它为运作结果。如果你想象的是做最好的你，那么你就会在你内心的荧光屏上看到一个踌躇满志、不断进取、勇于开拓创新的自我。同时还会经常收到我做的很好，我以后还会做的更好之类的信息，这样你注定会成为一个最好的你。美国哲学家爱默生说:“人的一生正如他一天中所想的那样，你怎么想，怎么期待，就有怎样的人生。”美国有名的钢铁大王安德鲁·卡耐基就是一个充分发挥自己创造机会的楷模。他12岁时由英格兰移居美国，先是在一家纺织厂做工人，当时他的目标是“做全厂最出色的工人。”因为他经常这样想，以这样做，最终他实现了他的目标。后来命运有安排他当邮递员，他想的是怎样成为“全美最杰出的邮递员。”结果他的这一目标也实现了。他的一生总是根据自己所处的环境和地位塑造最佳的自己，他的座右铭就是“相信自己是最棒的。“</p><p>做一个最好的自己，不一定非要当什么“家”，也不一定非要出什么“名”，更不要与别人比高低、比大小。就像人的手指，有大有小，有长有短，他们各有所长，各有所短，你能说拇指比食指好吗?决定最好的你，既不是你拥有的物质财富的多少，也不是你身份的贵贱，关键是看你是否拥有实现自己理想的强烈愿望的程度，看你身上的潜力能否充分发挥。人们熟知的一些英雄模范，就是在平凡的工作岗位上充分发挥人的创新能力，做好自己身边的每一件小事，创造了做好的自己。</p><p>“塑造一个最好的自己”，这个目标人人都可以实现。你只意识到自己是大自然的一分子，坚信自己拥有“无限的能力”与“无限的可能”，这种坚定的信心能帮助你创造和谐的心理、生理韵律，建立起自己理想的自我形象，体现自己人格行为应该具有的魅力。</p>');
INSERT INTO `news` VALUES (88, '2024-04-16 20:49:48', '有了梦想就不会感到疲惫', '一段时间以前，一位在港的大陆学生，因为学业的压力、前途的渺茫等诸多原因，选择了自杀。在讨论和反思的潮流中，有一位毕业生在校内网匿名发表了自己的故事。他说，自己当年在学校也曾经面临绝境，一文不名。他选择了做“乞丐学生”，坚持着念完了课程。回忆的一些情节让我印象深刻，比如，平时偷偷住电梯间，蓬头垢面如乞丐;实在很饿，学校举办餐会的时候默默进场埋头大吃', 'upload/news_picture8.jpg', '<p>  一段时间以前，一位在港的大陆学生，因为学业的压力、前途的渺茫等诸多原因，选择了自杀。在讨论和反思的潮流中，有一位毕业生在校内网匿名发表了自己的故事。他说，自己当年在学校也曾经面临绝境，一文不名。他选择了做“乞丐学生”，坚持着念完了课程。回忆的一些情节让我印象深刻，比如，平时偷偷住电梯间，蓬头垢面如乞丐;实在很饿，学校举办餐会的时候默默进场埋头大吃。</p><p>“峣峣者易折，皎皎者易污。”能够从内地高校到香港读书的学子，都是一些很优秀的年轻人。不知道曾经高居象牙塔的书生，怎样狠下心，咬牙面对那一个天渊般的落差，以及旁人的目光和议论。</p><p>  说到这里，很像一个《读者》式的励志故事。但是这种励志故事从来就不缺乏感动人的力量，因为虽然光明的尾巴不是人人都能够拥有，但是人人都有梦想，面对实现过程中的困难，其奋斗或者说挣扎，却常常和平凡如你我的人们相遇。</p><p>    《当幸福来敲门/The Pursuit of Happyness》就是这样偶然被看到，又感动了我的电影。黑人克里斯是一名普普通通的医疗器械推销员，妻子忍受不了经济上的压力离开了他，留下5岁的儿子克里斯托夫和他相依为命。克里斯银行账户里只剩下21块钱，因为没钱付房租，他和儿子被撵出了公寓。费尽周折，克里斯赢得了在一家着名股票投资公司实习的机会，但是实习期间没有薪水，而且最终只有一人可以成功进入公司。</p><p>    学妹曾经告诉我一个故事，让我每次想到都觉得莫名恐怖。她说，她硕士毕业去广东求职，一个中学要招几个老师，结果南来北往的硕士博士挤了快有一个礼堂。可想而知，竞争有多么残酷。看来，中外求职者都面临着同样的挑战。但是克里斯和许多“80后”的大学毕业生不同，他更加坚韧:为了节省时间，上班时候不喝水，以避免上厕所。以疯狂的速度给客户打电话，打完一个，直接按挂机键就拨下一个电话。白天，克里斯忍受着一次又一次被拒绝的失望，带着微笑在公司和客户之间穿梭。回家，则要带着儿子穿过污秽的街道，忍受房东的咆哮。</p><p>    终于，交不起房租的父子俩流落街头。克里斯和儿子在午夜地铁里相对无言，儿子不能理解为什么不能回家住，爸爸却开始玩游戏:“我们通过时光机，到达古代了!”儿子立刻兴奋地配合起来，环顾左右。父子俩在“恐龙”的追杀下，逃到了一个“山洞”里，“山洞”是什么呢，其实是一间男厕所。克里斯搂着熟睡的儿子，坐靠在厕所的墙面。午夜的灯光很惨白，这个消瘦的、营养不良的父亲，默默地流下了泪水。</p><p>    父子俩依旧为了幸福到来而努力。他们开始住收容所，面对有限的床位，这个奔跑起来像猎豹一样的人，有时候得把草原上的爆发力运用到打架上面来。儿子在简陋的收容所床上睡着了，父亲还在埋头修理推销的医疗器械，或者翻那本厚厚的笔试全书。</p><p>   钱包磨损得厉害，而且，太瘪了，每张钱都很熟悉。老板要借5块钱，犹豫再三，摩挚着纸币，最终还是把钱送了出去。卖血。鲜血在塑料袋里面渗开，那是一个男人所能奉献的最后。拿着卖血的钱，克里斯仍然去买电子元件。一点点的希望，都要去坚持。</p><p>对于父母，最心酸的事儿是什么呢?就是子女的一点可怜的愿望得不到满足。克里斯托夫的惟一的玩偶“美国英雄”，在一次挤车的过程中掉到了地上。5岁的男孩悲伤欲绝，克里斯坚硬的表情下，读出的是面对困难的凶狠和惨痛。但是，无论多么深切的无望，都没有摧毁父子间的亲情与他们的信念，他们相信幸福总会落到自己的身上。“你是个好爸爸”，克里斯托夫跟着爸爸四处流浪，可是孩子的心灵，衡量的砝码和天使是—样的。</p><p>  克里斯最终成为了投资公司的员工，看似冷漠的白人老板们，此时显出他们的些微温情。他忍住了泪水，颤抖着拿起自己的物品，走入了茫茫人海。在熙熙攘攘的人群中间，克里斯举起手，为自己鼓掌，那无声的，一下下重重的掌声，是在为自己喝彩。其实，克里斯托夫的“美国英雄”并没有失落。</p><p>  这是一个非常典型的“美国梦”:一个人通过自己的努力，可以实现自己的梦想，幸福，会来敲门。很多人往往会关注对于梦想的树立，而往往忽略过程的艰辛。特别是，当面对一个看似无望的现实的时候，有多少人会坚持，多少人会放弃呢?生活总是在不断地修正，并且提醒我们，顺应大潮的人总是较有可能抵达成功的彼岸。可是，确实是有些人，愿意逆流而上。我相信，这是导演对于逆行者的一点鼓励。</p><p>那个香港的匿名毕业生后来博士毕业，找到了一份不错的工作，有了漂亮的妻子和可爱的孩子。这个强人在帖子里说，有什么坚持不下来的呢?只要有梦想</p>');

-- ----------------------------
-- Table structure for reply
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply`  (
  `id` bigint NOT NULL COMMENT '评论id',
  `parent_id` bigint NULL DEFAULT NULL COMMENT '父级评论的id\r\n',
  `reply_id` bigint NULL DEFAULT NULL COMMENT '被回复人评论id',
  `reply_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '被回复人名称',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户名称',
  `user_avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '评论者头像地址',
  `user_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '评论内容',
  `is_like` tinyint NULL DEFAULT NULL COMMENT '是否点赞',
  `like_count` bigint NULL DEFAULT NULL COMMENT '点赞数统计',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reply
-- ----------------------------

-- ----------------------------
-- Table structure for storeup
-- ----------------------------
DROP TABLE IF EXISTS `storeup`;
CREATE TABLE `storeup`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint NOT NULL COMMENT '用户id',
  `refid` bigint NULL DEFAULT NULL COMMENT '收藏id',
  `tablename` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表名',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `picture` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '图片',
  `type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '类型',
  `inteltype` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '推荐类型',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `userid`(`userid` ASC) USING BTREE,
  INDEX `name`(`name` ASC) USING BTREE,
  CONSTRAINT `storeup_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `yonghu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '收藏表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of storeup
-- ----------------------------
INSERT INTO `storeup` VALUES (3, '2024-04-24 11:55:36', 32, 59, 'yonghufabu', '夜爬武功山', 'upload/1713927501923.jpg', '1', NULL, NULL);
INSERT INTO `storeup` VALUES (4, '2024-04-24 16:12:49', 31, 41, 'huodongxinxi', '夜爬武功山', 'upload/1713881003018.jpg', '1', '徒步登山', NULL);
INSERT INTO `storeup` VALUES (15, '2024-05-11 22:53:45', 31, 62, 'yonghufabu', '大学生“特种兵旅行”之夜爬泰山', 'upload/1713930657939.webp', '2', NULL, NULL);
INSERT INTO `storeup` VALUES (16, '2024-05-13 21:08:12', 31, 49, 'huodongxinxi', '四姑娘山冬季高山探险活动', 'upload/1713882567707.jpg', '1', '高山探险', NULL);
INSERT INTO `storeup` VALUES (17, '2024-05-29 22:45:43', 31, 59, 'yonghufabu', '夜爬武功山', 'upload/1713927501923.jpg', '1', NULL, NULL);

-- ----------------------------
-- Table structure for token
-- ----------------------------
DROP TABLE IF EXISTS `token`;
CREATE TABLE `token`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint NOT NULL COMMENT '用户id',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `tablename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表名',
  `role` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色',
  `token` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL COMMENT '过期时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'token表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of token
-- ----------------------------
INSERT INTO `token` VALUES (1, 1, 'admin', 'users', '管理员', '8fv1f78qkenbt2n9pavxl53b7u6o1w48', '2024-04-21 14:25:06', '2024-05-30 02:51:44');
INSERT INTO `token` VALUES (2, 1713682024148, '123', 'yonghu', '用户', 'lti0d9unqcl7dt89xvqbtyqh8f2lug50', '2024-04-21 14:47:07', '2024-04-23 14:46:30');
INSERT INTO `token` VALUES (3, 1713879441539, '懒羊羊', 'yonghu', '用户', 'r99v55lcvd3u686dol1hhd75f6lfdwh6', '2024-04-23 22:50:30', '2024-04-24 11:55:59');
INSERT INTO `token` VALUES (4, 31, '喜羊羊', 'yonghu', '用户', 'hyh2j071nrjrbjnhzwy17m4o025ma6bc', '2024-04-24 11:29:58', '2024-06-01 22:54:37');
INSERT INTO `token` VALUES (5, 32, '美羊羊', 'yonghu', '用户', 'h8bs8g9a1w4pp6gzs1u18f07ngt1f4ki', '2024-04-24 11:55:29', '2024-05-15 04:04:47');
INSERT INTO `token` VALUES (6, 33, '暖羊羊', 'yonghu', '用户', 'nnknbtxenwhaxbe863ql37642uarzkzz', '2024-04-24 11:57:26', '2024-05-15 04:06:17');
INSERT INTO `token` VALUES (7, 0, '管理员', 'yonghu', '用户', '4ybi9nbbh0stlti1xrsctchygzsdg7bb', '2024-05-12 22:17:49', '2024-05-12 23:17:50');
INSERT INTO `token` VALUES (8, 39, '懒羊羊', 'yonghu', '用户', 'qx6d0aa5r4836voevn9pjb44zmdnqhwu', '2024-05-15 03:05:42', '2024-05-15 04:05:43');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `role` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'admin', 'admin', '管理员', '2024-04-16 20:49:48');

-- ----------------------------
-- Table structure for yonghu
-- ----------------------------
DROP TABLE IF EXISTS `yonghu`;
CREATE TABLE `yonghu`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yonghuming` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `mima` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `xingming` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `xingbie` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `touxiang` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '头像',
  `shouji` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `yonghuming`(`yonghuming` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1715696875876 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yonghu
-- ----------------------------
INSERT INTO `yonghu` VALUES (1, '2024-05-07 12:49:03', 'admin', '12345', 'admin', NULL, NULL, NULL);
INSERT INTO `yonghu` VALUES (31, '2024-04-16 20:49:47', '喜羊羊', '123456', '喜羊羊', '男', 'upload/1713879836313.jpg', '13378966400');
INSERT INTO `yonghu` VALUES (32, '2024-04-16 20:49:47', '美羊羊', '123456', '美羊羊', '女', 'upload/1713879919697.jpg', '13378966401');
INSERT INTO `yonghu` VALUES (33, '2024-04-16 20:49:47', '暖羊羊', '123456', '暖羊羊', '女', 'upload/1713880058974.jpg', '13378966403');
INSERT INTO `yonghu` VALUES (39, '2024-04-23 21:37:21', '懒羊羊', '12345', '懒羊羊', '女', 'upload/1713930894907.jpg', '13378966404');
INSERT INTO `yonghu` VALUES (1715696875875, '2024-05-14 22:27:55', '1', '1', '1', '男', NULL, NULL);

-- ----------------------------
-- Table structure for yonghufabu
-- ----------------------------
DROP TABLE IF EXISTS `yonghufabu`;
CREATE TABLE `yonghufabu`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `biaoti` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `leixing` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型',
  `tupian` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '图片',
  `neirong` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `riqi` date NULL DEFAULT NULL COMMENT '日期',
  `yonghuming` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `userid` bigint NULL DEFAULT 0 COMMENT '用户ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `用户ID`(`userid` ASC) USING BTREE,
  INDEX `用户名称`(`yonghuming` ASC) USING BTREE,
  INDEX `biaoti`(`biaoti` ASC) USING BTREE,
  CONSTRAINT `用户ID` FOREIGN KEY (`userid`) REFERENCES `yonghu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `用户名称` FOREIGN KEY (`yonghuming`) REFERENCES `yonghu` (`yonghuming`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 76 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户发布' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yonghufabu
-- ----------------------------
INSERT INTO `yonghufabu` VALUES (59, '2024-04-24 10:59:26', '夜爬武功山', '攻略', 'upload/1713927501923.jpg', '<p class=\"ql-align-justify\">武功山，这座自然之美的瑰宝，以其险峻的山势和迷人的夜景吸引着无数户外探险者。夜爬武功山，既是对体能的挑战，也是对心灵的洗礼。在这里，我们为您奉上2024年武功山夜爬的最全攻略，助您征服这座高山，尽享夜爬的乐趣。</p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-center\"><img src=\"https://www.wuhan.com/d/file/travel/attractionsAll/2024-03-22/1711097980498902.jpg\" alt=\"未标题-1.jpg\"></p><p class=\"ql-align-center\"><br></p><h3>夜爬时间</h3><p class=\"ql-align-justify\">推荐当天24点前入园，正好赶上早上6:30左右的日出（春季时间），也可能看到云海。</p><p class=\"ql-align-justify\"><br></p><h3>购票指南</h3><p class=\"ql-align-justify\">成人门票70元/人，学生门票50元/人，学生带好学生证或其他能证明的证件。萍乡武功山共有两段索道，索道票价如下</p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-center\"><img src=\"https://www.wuhan.com/d/file/travel/attractionsAll/2024-03-22/1711097763883098.jpg\" alt=\"微信图片_20240322170515.jpg\"></p><p class=\"ql-align-center\"><br></p><h3>徒步路线</h3><p class=\"ql-align-justify\"><strong>1、推荐上山路线</strong></p><p class=\"ql-align-justify\">游客服务中心➡️武功山山门（石鼓寺广场）➡️尽心瀑布（夜爬检票口）➡️猴谷➡️中庵紫极宫➡️好汉坡➡️吊马桩➡️万宝柜➡️金顶。</p><p class=\"ql-align-justify\"><strong>2、推荐下山路线</strong></p><p class=\"ql-align-justify\">金顶➡️金顶索道➡️玻璃眺台➡️福星谷栈道➡️许愿桥➡️点将台➡️中庵紫极宫➡️中庵索道➡️石鼓寺广场➡️乘坐景区大巴至游客服务中心。</p><p class=\"ql-align-justify\"><br></p><h3>出行必备</h3><p class=\"ql-align-justify\">1、证件：成人带身份证，学生带好学生证。</p><p class=\"ql-align-justify\">2、衣物：徒步时较热穿冲锋衣，登顶后风大需要羽绒服护体～爬山容易出汗，多带一件更换的里衣；下身着运动裤/工装裤，记得带条秋裤，脚穿防滑运动鞋。</p><p class=\"ql-align-justify\">3、其他配饰：墨镜、口罩，不仅防风御寒拍照还贼好看（露的面积越少越帅）；雨衣、雨鞋（春天可能有预料之外的阵雨，有备无患）。</p><p class=\"ql-align-justify\">4、其他用品：手电筒、保温杯（山顶提供饮用热水）、暖宝宝、自拍杆（人多的时候举起来拍很nice）。</p><p class=\"ql-align-justify\"><br></p><h3>景区服务</h3><p class=\"ql-align-justify\"><strong>1、寄存服务</strong></p><p class=\"ql-align-justify\">（1）萍乡北（高铁站）出口第一家武功山官方旗舰店有寄存服务，小件10元，箱子15元，寄存到第二天21点前。</p><p class=\"ql-align-justify\">（2）武功山游客服务中心、特种兵服务驿站都有免费行李寄存柜（只能小件），大件寄存在游客中心附近商店，收费10～20元左右。</p><p class=\"ql-align-justify\"><strong>2、特种兵青春驿站</strong></p><p class=\"ql-align-justify\">驿站提供24小时免费休息，二楼各类硬件设施齐全，为特种兵驴友们提供免费热水、WiFi等服务。</p>', '2024-03-24', '懒羊羊', 39);
INSERT INTO `yonghufabu` VALUES (60, '2024-04-24 11:01:54', '四姑娘山挑战成功', '攻略', 'upload/1713927713323.jpg', '线路推荐（仅供参考）\nD1：成都—映秀—卧龙—四姑娘山镇（车程4H左右）\nD2：四姑娘山镇—大峰大本营or二峰大本营（徒步或骑马需6H左右）\nD3：大本营—冲顶—四姑娘山镇—成都\n（大本营—打尖包—海子沟—海子沟桥头公路—成都）', '2023-04-24', '懒羊羊', 39);
INSERT INTO `yonghufabu` VALUES (61, '2024-04-24 11:37:28', '南岳衡山全程特种兵徒步一日游', '攻略', 'upload/1713929601588.jpeg', '游览方式\n乘车：前往游客中心三楼乘车，上山下山往返票78元，路线是从游客中心至南天门，从南天门到顶峰祝融峰需步行。\n索道：乘坐索道是从半山亭至南天门。\n徒步：选择步行上山从游客中心往北百米左右，从延寿路“胜利坊”牌坊开始，即可开始愉快的徒步之旅。\n', '2024-04-24', '喜羊羊', 31);
INSERT INTO `yonghufabu` VALUES (62, '2024-04-24 11:50:40', '大学生“特种兵旅行”之夜爬泰山', '游记', 'upload/1713930657939.webp', '特种兵式旅行就是苦中作乐 虽然累但开心。真正的“特种兵”都是夜爬，主要都是年轻人。白天他们下山时，碰到的爬山者大多是中年人。“很明显，我们的左边上山的都是中年人，或是带着小朋友的，或是跟着旅游团的，我们这边下山的都是年轻人。', '2024-04-24', '喜羊羊', 31);
INSERT INTO `yonghufabu` VALUES (74, '2024-04-30 19:38:07', '岭南第一山|罗浮山', '其它', 'upload/1714479669433.jpg', '<p>罗浮山被誉为岭南第一山 ，取名于罗山与浮山，国家AAAAA级旅游景区，最高峰为飞云顶，海拔1296米，共有大小山峰432座，飞瀑名泉多达980多处，洞天奇景18处，石室幽岩72个，有关罗浮山的文献典籍遗存非常丰厚，摩崖石刻遍山皆有，旧志载有2000多处。被道教尊为天下第七大洞天，被佛教称为罗浮第一禅林。</p><p><img src=\"http://localhost:8088/tangfen/upload/1714479595920.jpg\" alt=\"图像\"></p><p><br></p><p><br></p><p>五一劳动节在浆糊群相约几位小伙伴从深圳出发自驾游罗浮山，由于正值新冠疫情期间，包括朱明洞在内的众多室内建筑并未开放，好在我们此行主要目的是爬山，出发14人，除2位情侣选择佛系游览，其余12人均顺利登上飞云顶，感谢大家一路互相帮扶，感谢3位老司机和他们的车。</p><p><br></p><p><br></p><p><br></p><p>本文会详细介绍罗浮山的游览攻略、交通路线、防坑指南，应该可以帮你省下不少时间和冤枉钱，少走一些冤枉路，希望有用。</p><p><img src=\"http://localhost:8088/tangfen/upload/1714479621041.jpg\" alt=\"图像\"></p><p><br></p><p>| 游览攻略</p><p><br></p><p>罗浮山的最高处是飞云顶，海拔1296米，从山底到飞云顶由两段组成：盘山公路和阶梯。徒步登顶需要5小时左右，下山3小时左右，爬山公路部分可以乘坐索道，需要注意索道不能到达飞云顶，而是半山腰的鹰嘴岩景点，到最高处的飞云顶仍需要2-3小时左右徒步。除了索道也可以乘坐观光车完成盘山公路部分。</p>', '2024-04-30', '喜羊羊', 31);
INSERT INTO `yonghufabu` VALUES (75, '2024-05-14 23:56:44', '夜爬罗浮山', '游记', 'upload/1715709643104.jpg', '<h2>罗浮山夜爬路线推荐路线：</h2><p>景区老大门—轮龙坪—索道上站—鹰嘴岩一分水坳一飞云顶(全程4-5小时)</p><p>物品攻略</p><p>①每人带2-3瓶矿泉水和自身所需的2顿干粮(面包、火腿肠等)；</p><p>②晚间山风较大，需自备较厚的防风外套；</p><p>③推荐携带登山杖、羊电筒、驱蚊神器(百草油等),助力登山之旅。</p><p>登山线路图及线路二（点击看大图）<img src=\"http://localhost:8088/tangfen/upload/1715710191444.png\" alt=\"图像\"></p><p><br></p><p>拓展</p><p>罗浮山的游玩项目之一丛林穿越是集探险、运动、娱乐挑战于一体的户外运动项目。玩家通过挑战设置在丛林间难易不同的关卡，感受丛林攀爬与林间穿越的刺激，体验高空坠落与自由滑翔的快感。</p><p>丛林玻璃漂流全长3000多米，近200米的落差。两人一艇，盘旋而下，享受悬浮于高空之上的视觉体验。</p>', '2024-05-14', '喜羊羊', 31);

-- ----------------------------
-- Triggers structure for table forum
-- ----------------------------
DROP TRIGGER IF EXISTS `delete_forum_comments`;
delimiter ;;
CREATE TRIGGER `delete_forum_comments` AFTER DELETE ON `forum` FOR EACH ROW BEGIN  
    IF OLD.parentid = 0 THEN  
        DELETE FROM `forum` WHERE forum.parentid = OLD.id;  
    END IF;  
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table huodongxinxi
-- ----------------------------
DROP TRIGGER IF EXISTS `update_storeup`;
delimiter ;;
CREATE TRIGGER `update_storeup` AFTER UPDATE ON `huodongxinxi` FOR EACH ROW BEGIN  
    IF OLD.id != NEW.id THEN  
        UPDATE `storeup` SET storeup.refid = NEW.id WHERE storeup.refid = OLD.id AND storeup.type = 1;  
    END IF;  
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table huodongxinxi
-- ----------------------------
DROP TRIGGER IF EXISTS `delete_storeup`;
delimiter ;;
CREATE TRIGGER `delete_storeup` AFTER DELETE ON `huodongxinxi` FOR EACH ROW BEGIN  

         DELETE FROM `storeup` WHERE storeup.refid = OLD.id AND storeup.type = 1;  
  
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table yonghufabu
-- ----------------------------
DROP TRIGGER IF EXISTS `update_storeup_yonghufabu`;
delimiter ;;
CREATE TRIGGER `update_storeup_yonghufabu` AFTER UPDATE ON `yonghufabu` FOR EACH ROW BEGIN  
    IF OLD.id != NEW.id THEN  
        UPDATE `storeup` SET storeup.refid = NEW.id WHERE storeup.refid = OLD.id AND storeup.type = 2;  
    END IF;  
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table yonghufabu
-- ----------------------------
DROP TRIGGER IF EXISTS `delete_storeup_yongfufbu`;
delimiter ;;
CREATE TRIGGER `delete_storeup_yongfufbu` AFTER DELETE ON `yonghufabu` FOR EACH ROW BEGIN  

         DELETE FROM `storeup` WHERE storeup.refid = OLD.id AND storeup.type = 2;  
  
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
