/*

DataBase initialization script

*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tb_album`
-- ----------------------------
DROP TABLE IF EXISTS `tb_album`;
CREATE TABLE `tb_album` (
  `pid` bigint(20) NOT NULL AUTO_INCREMENT,
  `alt` varchar(255) DEFAULT NULL,
  `create_at` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `src` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `thumb` varchar(255) DEFAULT NULL,
  `tiltle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_album
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_blog`
-- ----------------------------
/* DROP TABLE IF EXISTS `tb_blog`;
CREATE TABLE `tb_blog` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` longtext,
  `create_at` datetime DEFAULT NULL,
  `featured` int(11) DEFAULT NULL,
  `privacy` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `summary` longtext,
  `tags` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  `author_id` bigint(20) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK26qshdwihej4t9niu5e4lmgxv` (`author_id`),
  KEY `FKjawve4qwb5wvb0jkvpv6rs20k` (`category_id`),
  CONSTRAINT `FK26qshdwihej4t9niu5e4lmgxv` FOREIGN KEY (`author_id`) REFERENCES `tb_user` (`id`),
  CONSTRAINT `FKjawve4qwb5wvb0jkvpv6rs20k` FOREIGN KEY (`category_id`) REFERENCES `tb_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
 */


DROP TABLE IF EXISTS `tb_category`;
CREATE TABLE `tb_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `count` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_category
-- ----------------------------
INSERT INTO `tb_category` VALUES ('1', '7', '原创', '0');
INSERT INTO `tb_category` VALUES ('2', '6', '转载', '0');

-- ----------------------------
-- Table structure for `tb_file`
-- ----------------------------
DROP TABLE IF EXISTS `tb_file`;
CREATE TABLE `tb_file` (
  `pid` bigint(20) NOT NULL AUTO_INCREMENT,
  `alt` varchar(255) DEFAULT NULL,
  `carousel` int(11) NOT NULL DEFAULT '0',
  `create_at` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `src` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `thumb` varchar(255) DEFAULT NULL,
  `tiltle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_file
-- ----------------------------
INSERT INTO `tb_file` VALUES ('2', '图片1', '0', '2019-03-30 14:55:27', '图片1', 'https://cdn.pixabay.com/photo/2017/01/12/06/00/island-1973839_1280.jpg', '0', 'https://cdn.pixabay.com/photo/2017/01/12/06/00/island-1973839_1280.jpg', null);
INSERT INTO `tb_file` VALUES ('3', '图片2', '1', '2019-03-30 14:56:00', '图片2', 'https://cdn.pixabay.com/photo/2014/07/16/05/18/beach-394503_1280.jpg', '0', 'https://cdn.pixabay.com/photo/2014/07/16/05/18/beach-394503_1280.jpg', null);
INSERT INTO `tb_file` VALUES ('4', '图片3', '1', '2019-03-30 14:56:33', '图片3', 'https://cdn.pixabay.com/photo/2012/03/01/00/55/flowers-19830_1280.jpg', '0', 'https://cdn.pixabay.com/photo/2012/03/01/00/55/flowers-19830_1280.jpg', null);
INSERT INTO `tb_file` VALUES ('5', '图片4', '1', '2019-03-30 14:57:37', '图片4', 'https://cdn.pixabay.com/photo/2016/08/09/21/54/yellowstone-national-park-1581879_1280.jpg', '0', 'https://cdn.pixabay.com/photo/2016/08/09/21/54/yellowstone-national-park-1581879_1280.jpg', null);
INSERT INTO `tb_file` VALUES ('6', '图片5', '1', '2019-03-30 15:14:25', '图片5', 'https://cdn.pixabay.com/photo/2015/07/05/10/18/tree-832079_1280.jpg', '0', 'https://cdn.pixabay.com/photo/2015/07/05/10/18/tree-832079_1280.jpg', null);

-- ----------------------------
-- Table structure for `tb_log`
-- ----------------------------
DROP TABLE IF EXISTS `tb_log`;
CREATE TABLE `tb_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gmt_create` datetime DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `operation` varchar(255) DEFAULT NULL,
  `params` varchar(255) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_log
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_login_log`
-- ----------------------------
DROP TABLE IF EXISTS `tb_login_log`;
CREATE TABLE `tb_login_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) DEFAULT NULL,
  `login_at` datetime DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7vcmphcy2rt1aatmheivnk31r` (`user_id`),
  CONSTRAINT `FK7vcmphcy2rt1aatmheivnk31r` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `tb_menu`
-- ----------------------------
DROP TABLE IF EXISTS `tb_menu`;
CREATE TABLE `tb_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `menu_ico` varchar(255) DEFAULT NULL,
  `menu_name` varchar(255) DEFAULT NULL,
  `menu_src` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_menu
-- ----------------------------
INSERT INTO `tb_menu` VALUES ('1', 'fa fa-home fa-spin', '主页', '/admin/welcome', '1');
INSERT INTO `tb_menu` VALUES ('2', 'fa fa-user fa-spin', '用户管理', '/admin/user/index', '2');
INSERT INTO `tb_menu` VALUES ('3', 'fa fa-tasks fa-spin', '分类管理', '/admin/category/index', '3');
INSERT INTO `tb_menu` VALUES ('4', 'fa fa-tag fa-spin', '标签管理', '/admin/tag/index', '4');
INSERT INTO `tb_menu` VALUES ('5', 'fa fa-heart fa-spin', '文章管理', '/admin/blog/index', '5');
INSERT INTO `tb_menu` VALUES ('6', 'fa fa-cloud fa-spin', '关于我', '/admin/about/index', '7');
INSERT INTO `tb_menu` VALUES ('7', 'fa fa-feed fa-spin', '友情链接', '/admin/youlian/index', '9');
INSERT INTO `tb_menu` VALUES ('8', 'fa fa-photo fa-spin', '图片列表', '/admin/files/index', '12');

-- ----------------------------
-- Table structure for `tb_options`
-- ----------------------------
DROP TABLE IF EXISTS `tb_options`;
CREATE TABLE `tb_options` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `option_key` varchar(255) DEFAULT NULL,
  `option_value` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_options
-- ----------------------------
INSERT INTO `tb_options` VALUES ('1', '关于我们', 'siteAboutMe', '<p>夏樱银的blog博客系统</p>');
INSERT INTO `tb_options` VALUES ('2', '站点描述', 'siteDescription', '夏樱银的blog博客系统');
INSERT INTO `tb_options` VALUES ('3', '网站域名', 'siteDomain', 'http://localhost:8088');
INSERT INTO `tb_options` VALUES ('4', '网站名称', 'siteName', '夏樱银的博客');
INSERT INTO `tb_options` VALUES ('5', '图标地址', 'siteIcoImg', 'https://s2.ax1x.com/2019/04/17/AxfHmj.png');
INSERT INTO `tb_options` VALUES ('6', '主页欢迎语', 'siteWelcome', '欢迎登录博客管理系统');

-- ----------------------------
-- Table structure for `tb_resource`
-- ----------------------------
DROP TABLE IF EXISTS `tb_resource`;
CREATE TABLE `tb_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` longtext,
  `create_at` datetime DEFAULT NULL,
  `num` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '0',
  `summary` longtext,
  `tags` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT '0',
  `url` varchar(255) DEFAULT NULL,
  `author_id` bigint(20) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKliy1rsfoghowdr3y5jjm5wv8l` (`author_id`),
  KEY `FKocix1jljhugdghligrlkodgyw` (`category_id`),
  CONSTRAINT `FKliy1rsfoghowdr3y5jjm5wv8l` FOREIGN KEY (`author_id`) REFERENCES `tb_user` (`id`),
  CONSTRAINT `FKocix1jljhugdghligrlkodgyw` FOREIGN KEY (`category_id`) REFERENCES `tb_resource_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_resource
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_resource_category`
-- ----------------------------
DROP TABLE IF EXISTS `tb_resource_category`;
CREATE TABLE `tb_resource_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `num` int(11) DEFAULT '0',
  `parent_id` bigint(20) DEFAULT '0',
  `status` int(11) DEFAULT '0',
  `type` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_resource_category
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_session`
-- ----------------------------
DROP TABLE IF EXISTS `tb_session`;
CREATE TABLE `tb_session` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `expire_at` bigint(20) DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK31riknm358i4amq9cqvye97r8` (`user_id`),
  CONSTRAINT `FK31riknm358i4amq9cqvye97r8` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_session
-- ----------------------------
INSERT INTO `tb_session` VALUES ('1', '1615795879207', 'ea50469946714829a3499b0d9d7da64d', '1');
INSERT INTO `tb_session` VALUES ('2', '1615795944376', '891d0f1878eb446eada878be8d13a659', '1');
INSERT INTO `tb_session` VALUES ('3', '1615796105545', '9797065f8a4a4a338e2b9694a1613032', '1');
INSERT INTO `tb_session` VALUES ('4', '1521198702199', '6dd3b5ca22f54632952ef2af364c22a0', '1');
INSERT INTO `tb_session` VALUES ('5', '1521199989265', 'f09e64181fc54f9696b4c48c73eba50f', '1');
INSERT INTO `tb_session` VALUES ('6', '1521206243249', '2a6508beef1e41a38639b21f56614cc5', '1');
INSERT INTO `tb_session` VALUES ('7', '1521210057931', 'fec98ad40196474db0e7dac814c84563', '1');
INSERT INTO `tb_session` VALUES ('8', '1521217669395', '42391312f1b641d78202e0fbb35ed9f4', '1');
INSERT INTO `tb_session` VALUES ('9', '1615858127644', '72c03b15b5014b8eaae4b79db405a63a', '1');
INSERT INTO `tb_session` VALUES ('10', '1521374208802', 'e93637b66fc245189567e3ac54bcc512', '1');
INSERT INTO `tb_session` VALUES ('11', '1521374653181', '1d605c64af7d4f60bc7d80a6db1aabcd', '1');
INSERT INTO `tb_session` VALUES ('12', '1615979828842', '5324fb05dfca4705a63265ace9070537', '1');
INSERT INTO `tb_session` VALUES ('13', '1616026367564', 'd9c27fecce434d1b8e58b3b8435bad6f', '1');
INSERT INTO `tb_session` VALUES ('14', '1521432117092', '3426d596d3a748e984f2066b3ddd72f3', '1');
INSERT INTO `tb_session` VALUES ('15', '1521441345380', 'ac90a84bdaea4be9877d990df186ea3e', '1');
INSERT INTO `tb_session` VALUES ('16', '1521453296923', '012ac6a7d01243d693ff33d9c33e0b23', '1');
INSERT INTO `tb_session` VALUES ('17', '1521453317867', 'd3cbdadc18b7459c9cda8fdf670cc376', '1');
INSERT INTO `tb_session` VALUES ('18', '1521453368840', '7da33ec95c174134afeb8201b86874cf', '1');
INSERT INTO `tb_session` VALUES ('19', '1521453850799', 'd6f66a97afea48ecb6c3e21be7188268', '1');
INSERT INTO `tb_session` VALUES ('20', '1521453851837', '72152ea367224547905a69e0de01516c', '1');
INSERT INTO `tb_session` VALUES ('21', '1521453874287', '910d41e28b294f5187166aa1f75b648f', '1');
INSERT INTO `tb_session` VALUES ('22', '1521453904332', 'f9e97d24b168450586a41b96197a8864', '1');
INSERT INTO `tb_session` VALUES ('23', '1521454039655', '31d2445978444489ac13f8f096729821', '1');
INSERT INTO `tb_session` VALUES ('24', '1521454531746', '3a823d4c2a19461d9acd85ccb86b36ba', '1');
INSERT INTO `tb_session` VALUES ('25', '1521455006873', '0235fb9538144cdbb91b2f8e21f77209', '1');
INSERT INTO `tb_session` VALUES ('26', '1521455176866', '7f3d2428b37d4cf7b8a409ea3a315d22', '1');
INSERT INTO `tb_session` VALUES ('27', '1521455412295', 'fbb54734e4c74de8b3ae7c8a362e004c', '1');
INSERT INTO `tb_session` VALUES ('28', '1521455499678', '74796a85f4824daea7af8280e6d4bf45', '1');
INSERT INTO `tb_session` VALUES ('29', '1521455775321', 'fb65c1d3832e497c872420369c62904e', '1');
INSERT INTO `tb_session` VALUES ('30', '1521456332776', 'b40441fc0d8c4482a9709b51e71fbbac', '1');
INSERT INTO `tb_session` VALUES ('31', '1521456889865', 'f9f9ebd3e871464aa674a8dc1e497fad', '1');
INSERT INTO `tb_session` VALUES ('32', '1521465940408', '9a5b84f57d994cd6b79ca08ef28eb963', '1');
INSERT INTO `tb_session` VALUES ('33', '1616116227100', '2feb5b233c864219bcec9ecc5b62293a', '1');
INSERT INTO `tb_session` VALUES ('34', '1616143530739', 'dab26146fc51474b88fc0914bfef7f0a', '1');
INSERT INTO `tb_session` VALUES ('35', '1521606006628', 'a934fca1c3a74025b9f77fb5f7a04f11', '1');
INSERT INTO `tb_session` VALUES ('36', '1521642962973', '77c949ef81224786a5134dd94620ae41', '1');
INSERT INTO `tb_session` VALUES ('37', '1521644320633', '57b8bc54dc254de6bad734f2068a170c', '1');
INSERT INTO `tb_session` VALUES ('38', '1616245138379', 'b04586ceb11842b996495a3a04f5358b', '1');
INSERT INTO `tb_session` VALUES ('39', '1521727752758', '5f7292616f374863b60033d75cf7f592', '1');
INSERT INTO `tb_session` VALUES ('40', '1521795677947', '03baf6d0a3a845c8b840df8ebf5c7b95', '1');
INSERT INTO `tb_session` VALUES ('41', '1521795681165', '87d108f93d474fe99221e29a73067afc', '1');
INSERT INTO `tb_session` VALUES ('42', '1616405496787', '04d35ebd6f074972ac29aecd66c8a2cf', '1');
INSERT INTO `tb_session` VALUES ('43', '1522038607546', 'f291aa4c2ddc4cffb6ef8a12d588d631', '1');
INSERT INTO `tb_session` VALUES ('44', '1522137128293', 'fc5c90abdd2c40608695a01682938406', '1');
INSERT INTO `tb_session` VALUES ('45', '1522144483524', 'bcd4c321af1d40939ed4308f77f4374e', '1');
INSERT INTO `tb_session` VALUES ('46', '1522146900255', '5963ed17c30e4856a0e22be5dfe90880', '1');
INSERT INTO `tb_session` VALUES ('47', '1522231418151', '58570e91aff342178095bc369fd5c73f', '1');
INSERT INTO `tb_session` VALUES ('48', '1522238827117', '66552ba150ef425389547eb290965428', '1');
INSERT INTO `tb_session` VALUES ('49', '1522324606360', '0edcf98da46544d2b82a0bd12674580f', '1');
INSERT INTO `tb_session` VALUES ('50', '1522343518655', 'a3129f4c8c534d088dac918dd124c0f8', '1');
INSERT INTO `tb_session` VALUES ('51', '1522343524575', '78829e0b74724a798804c28dec54c388', '1');
INSERT INTO `tb_session` VALUES ('52', '1522398238079', 'eb6a7cf17c38424a8d925f7eecc37fca', '1');
INSERT INTO `tb_session` VALUES ('53', '1522408745794', 'aad36979a59543588193f7f8f48d2128', '1');
INSERT INTO `tb_session` VALUES ('54', '1523291044605', 'ea156a911fec408694bbe60ca4fdc5a4', '1');
INSERT INTO `tb_session` VALUES ('55', '1523291045596', '4374eb0461de440eb2c4d25d3bf92a4c', '1');
INSERT INTO `tb_session` VALUES ('56', '1617892012677', 'e8427f710e55449493151ef32f614543', '1');

-- ----------------------------
-- Table structure for `tb_tag`
-- ----------------------------
DROP TABLE IF EXISTS `tb_tag`;
CREATE TABLE `tb_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `count` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_tag
-- ----------------------------
INSERT INTO `tb_tag` VALUES ('4', '3', 'java', '0');
INSERT INTO `tb_tag` VALUES ('5', '0', 'test', '0');
INSERT INTO `tb_tag` VALUES ('6', '1', '产品', '0');
INSERT INTO `tb_tag` VALUES ('7', '1', 'c++', '0');
INSERT INTO `tb_tag` VALUES ('8', '0', 'springboot', '0');
INSERT INTO `tb_tag` VALUES ('9', '1', 'linux', '0');
INSERT INTO `tb_tag` VALUES ('10', '4', 'java', '0');

-- ----------------------------
-- Table structure for `tb_user`
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_at` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `nick_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `user_name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `emil` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', '2019-04-20 20:22:57', '我是夏樱银', '127.0.0.1', 'blog', 'DJ2B4FTK8KN7ORQF9IM59KKI1', 'zmxyyZJkE-N6JjRhujp6U8l4Yu7vuQDZ', '1', 'xiayingyin@126.com', '甘肃敦煌', 'xiayingyin@126.com', '13167389300', 'https://s2.ax1x.com/2019/04/15/AjdEFI.jpg', null);

-- ----------------------------
-- Table structure for `tb_youlian`
-- ----------------------------
DROP TABLE IF EXISTS `tb_youlian`;
CREATE TABLE `tb_youlian` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `url` longtext,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_youlian
-- ----------------------------
INSERT INTO `tb_youlian` VALUES ('2', '我的GitHub主页', '0', '我的GitHub', 'https://github.com/xiayingyin', null);
