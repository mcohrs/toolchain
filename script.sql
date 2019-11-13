# ************************************************************
# Sequel Pro SQL dump
# Version 5438
#
# https://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Generation Time: 2019-06-17 10:26:25 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


create schema if not exists  `onekey-toolchain` CHARACTER SET utf8 COLLATE utf8_general_ci;

use `onekey-toolchain`;


# Dump of table tb_apply_info
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_apply_info`;

CREATE TABLE `tb_apply_info` (
                                 `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
                                 `name` varchar(128) DEFAULT NULL,
                                 `contact_person` varchar(50) DEFAULT NULL,
                                 `tel_no` varchar(30) DEFAULT NULL,
                                 `email` varchar(100) DEFAULT NULL,
                                 `country` varchar(100) DEFAULT NULL,
                                 `status` varchar(10) DEFAULT '',
                                 `source` varchar(20) DEFAULT NULL,
                                 `remark` varchar(100) DEFAULT NULL,
                                 `create_time` timestamp NULL DEFAULT NULL,
                                 `update_time` timestamp NULL DEFAULT NULL,
                                 `enterprise_id` int(11) DEFAULT NULL,
                                 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `tb_onchain_balance_transaction`;

CREATE TABLE `tb_onchain_balance_transaction` (
                                                  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
                                                  `project_id` int(11) DEFAULT NULL,
                                                  `request_no` varchar(70) DEFAULT NULL,
                                                  `type` varchar(20) DEFAULT NULL,
                                                  `amount` int(11) DEFAULT NULL,
                                                  `remark` varchar(100) DEFAULT NULL,
                                                  `create_time` timestamp NULL DEFAULT NULL,
                                                  PRIMARY KEY (`id`),
                                                  KEY `request_no` (`request_no`)
) ENGINE=InnoDB AUTO_INCREMENT=1429 DEFAULT CHARSET=utf8;

# Dump of table tb_buy_order
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_buy_order`;

CREATE TABLE `tb_buy_order` (
                                `order_id` int(30) NOT NULL AUTO_INCREMENT COMMENT '订单id',
                                `project_id` int(10) unsigned NOT NULL COMMENT '项目id',
                                `order_name` varchar(200) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '订单名称',
                                `status` char(20) COLLATE utf8_bin NOT NULL DEFAULT 'INIT' COMMENT '状态，草稿，提交，撤销',
                                `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
                                `create_user` int(10) NOT NULL COMMENT '创建者',
                                `PROJECT_name` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '项目名称',
                                `PAY_TYPE` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '付费方式',
                                `price` decimal(20,6) NOT NULL COMMENT '价格',
                                `tax` decimal(20,6) NOT NULL COMMENT '税费',
                                `delivery_fee` decimal(20,6) NOT NULL COMMENT '运费',
                                `request_no` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '开发者项目请求号',
                                `total_fee` decimal(20,6) NOT NULL,
                                `countryId` varchar(11) COLLATE utf8_bin DEFAULT NULL,
                                `UPDATE_TIME` datetime DEFAULT NULL,
                                PRIMARY KEY (`order_id`),
                                UNIQUE KEY `UNI_REQUEST_NO` (`project_id`,`request_no`),
                                KEY `KEY_PROEJCT` (`project_id`,`create_time`,`create_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;



# Dump of table tb_collection
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_collection`;

CREATE TABLE `tb_collection` (
                                 `collection_id` int(11) NOT NULL AUTO_INCREMENT,
                                 `project_id` int(11) DEFAULT NULL COMMENT '项目id',
                                 `level` int(11) DEFAULT NULL COMMENT '级别',
                                 `parent_collection_id` int(11) DEFAULT NULL COMMENT '上级集合',
                                 `name` varchar(32) DEFAULT NULL COMMENT '名称',
                                 `create_time` timestamp NULL DEFAULT NULL,
                                 `update_time` timestamp NULL DEFAULT NULL,
                                 `en_name` varchar(32) DEFAULT NULL,
                                 PRIMARY KEY (`collection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='集合';



# Dump of table tb_countries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_countries`;

CREATE TABLE `tb_countries` (
                                `id` int(11) NOT NULL AUTO_INCREMENT,
                                `name` varchar(300) NOT NULL COMMENT ' 国家名称',
                                `nameEn` varchar(100) DEFAULT NULL,
                                `standard` varchar(100) DEFAULT NULL,
                                `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                PRIMARY KEY (`id`),
                                KEY `countriesIndex` (`name`(255),`standard`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='申请国家表';

LOCK TABLES `tb_countries` WRITE;
/*!40000 ALTER TABLE `tb_countries` DISABLE KEYS */;

INSERT INTO `tb_countries` (`id`, `name`, `nameEn`, `standard`, `create_time`)
VALUES
(112,' 阿富汗','Afghanistan','AFG','2019-05-05 20:32:15'),
(113,' 奥兰','Åland Islands','ALA','2019-05-05 20:32:15'),
(114,' 阿尔巴尼亚','Albania','ALB','2019-05-05 20:32:15'),
(115,' 阿尔及利亚','Algeria','DZA','2019-05-05 20:32:15'),
(116,' 美属萨摩亚','American Samoa','ASM','2019-05-05 20:32:15'),
(117,' 安道尔','Andorra','AND','2019-05-05 20:32:15'),
(118,' 安哥拉','Angola','AGO','2019-05-05 20:32:15'),
(119,' 安圭拉','Anguilla','AIA','2019-05-05 20:32:15'),
(120,' 南极洲','Antarctica','ATA','2019-05-05 20:32:15'),
(121,' 安提瓜和巴布达','Antigua and Barbuda','ATG','2019-05-05 20:32:15'),
(122,' 阿根廷','Argentina','ARG','2019-05-05 20:32:15'),
(123,' 亚美尼亚','Armenia','ARM','2019-05-05 20:32:15'),
(124,' 阿鲁巴','Aruba','ABW','2019-05-05 20:32:16'),
(125,' 澳大利亚','Australia','AUS','2019-05-05 20:32:16'),
(126,' 奥地利','Austria','AUT','2019-05-05 20:32:16'),
(127,' 阿塞拜疆','Azerbaijan','AZE','2019-05-05 20:32:16'),
(128,' 巴哈马','The Bahamas','BHS','2019-05-05 20:32:16'),
(129,' 巴林','Bahrain','BHR','2019-05-05 20:32:16'),
(130,' 孟加拉','Bangladesh','BGD','2019-05-05 20:32:16'),
(131,' 巴巴多斯','Barbados','BRB','2019-05-05 20:32:16'),
(132,' 白俄罗斯','Belarus','BLR','2019-05-05 20:32:16'),
(133,' 比利时','Belgium','BEL','2019-05-05 20:32:16'),
(134,' 伯利兹','Belize','BLZ','2019-05-05 20:32:16'),
(135,' 贝宁','Benin','BEN','2019-05-05 20:32:16'),
(136,' 百慕大','Bermuda','BMU','2019-05-05 20:32:16'),
(137,' 不丹','Bhutan','BTN','2019-05-05 20:32:17'),
(138,' 玻利维亚','Bolivia','BOL','2019-05-05 20:32:17'),
(139,' 荷兰加勒比区','Bonaire','BES','2019-05-05 20:32:17'),
(140,' 波斯尼亚和黑塞哥维那','Bosnia and Herzegovina','BIH','2019-05-05 20:32:17'),
(141,' 博茨瓦纳','Botswana','BWA','2019-05-05 20:32:17'),
(142,' 布韦岛','Bouvet Island','BVT','2019-05-05 20:32:17'),
(143,' 巴西','Brazil','BRA','2019-05-05 20:32:17'),
(144,' 英属印度洋领地','British Indian Ocean Territory','IOT','2019-05-05 20:32:17'),
(145,' 英属维尔京群岛','British Virgin Islands','VGB','2019-05-05 20:32:17'),
(146,' 文莱','Brunei','BRN','2019-05-05 20:32:17'),
(147,' 保加利亚','Bulgaria','BGR','2019-05-05 20:32:17'),
(148,' 布基纳法索','Burkina Faso','BFA','2019-05-05 20:32:17'),
(149,' 布隆迪','Burundi','BDI','2019-05-05 20:32:17'),
(150,' 柬埔寨','Cambodia','KHM','2019-05-05 20:32:18'),
(151,' 喀麦隆','Cameroon','CMR','2019-05-05 20:32:18'),
(152,' 加拿大','Canada','CAN','2019-05-05 20:32:18'),
(153,' 佛得角','Cape Verde','CPV','2019-05-05 20:32:18'),
(154,' 开曼群岛','Cayman Islands','CYM','2019-05-05 20:32:18'),
(155,' 中非','Central African Republic','CAF','2019-05-05 20:32:18'),
(156,' 乍得','Chad','TCD','2019-05-05 20:32:18'),
(157,' 智利','Chile','CHL','2019-05-05 20:32:18'),
(158,' 中国','China','CHN','2019-05-05 20:32:18'),
(159,' 圣诞岛','Christmas Island','CXR','2019-05-05 20:32:18'),
(160,' 科科斯（基林）群岛','Cocos (Keeling) Islands','CCK','2019-05-05 20:32:18'),
(161,' 哥伦比亚','Colombia','COL','2019-05-05 20:32:18'),
(162,' 科摩罗','Comoros','COM','2019-05-05 20:32:18'),
(163,' 刚果（金）','Congo, Dem','COD','2019-05-05 20:32:19'),
(164,' 刚果（布）','Congo, Rep','COG','2019-05-05 20:32:19'),
(165,' 库克群岛','Cook Islands','COK','2019-05-05 20:32:19'),
(166,' 哥斯达黎加','Costa Rica','CRI','2019-05-05 20:32:19'),
(167,' 科特迪瓦','Côte d\'Ivoire','CIV','2019-05-05 20:32:19'),
(168,' 克罗地亚','Croatia','HRV','2019-05-05 20:32:19'),
(169,' 古巴','Cuba','CUB','2019-05-05 20:32:19'),
(170,' 库拉索','Curaçao','CUW','2019-05-05 20:32:19'),
(171,' 塞浦路斯','Cyprus','CYP','2019-05-05 20:32:19'),
(172,' 捷克','Czech Republic','CZE','2019-05-05 20:32:19'),
(173,' 丹麦','Denmark','DNK','2019-05-05 20:32:19'),
(174,' 吉布提','Djibouti','DJI','2019-05-05 20:32:19'),
(175,' 多米尼克','Dominica','DMA','2019-05-05 20:32:19'),
(176,' 多米尼加','Dominican Republic','DOM','2019-05-05 20:32:20'),
(177,' 厄瓜多尔','Ecuador','ECU','2019-05-05 20:32:20'),
(178,' 埃及','Egypt','EGY','2019-05-05 20:32:20'),
(179,' 萨尔瓦多','El Salvador','SLV','2019-05-05 20:32:20'),
(181,' 赤道几内亚','Equatorial Guinea','GNQ','2019-05-05 20:32:20'),
(182,' 厄立特里亚','Eritrea','ERI','2019-05-05 20:32:20'),
(183,' 爱沙尼亚','Estonia','EST','2019-05-05 20:32:20'),
(184,' 埃塞俄比亚','Ethiopia','ETH','2019-05-05 20:32:20'),
(185,' 福克兰群岛','Falkland Islands','FLK','2019-05-05 20:32:20'),
(186,' 法罗群岛','Faroe Islands','FRO','2019-05-05 20:32:20'),
(187,' 斐济','Fiji','FJI','2019-05-05 20:32:20'),
(188,' 芬兰','Finland','FIN','2019-05-05 20:32:21'),
(189,' 法国','France','FRA','2019-05-05 20:32:21'),
(190,' 法属圭亚那','French Guiana','GUF','2019-05-05 20:32:21'),
(191,' 法属波利尼西亚','French Polynesia','PYF','2019-05-05 20:32:21'),
(192,' 法属南方和南极洲领地','French Southern and Antarctic Lands','ATF','2019-05-05 20:32:21'),
(193,' 加蓬','Gabon','GAB','2019-05-05 20:32:21'),
(194,' 冈比亚','The Gambia','GMB','2019-05-05 20:32:21'),
(195,' 格鲁吉亚','Georgia','GEO','2019-05-05 20:32:21'),
(196,' 德国','Germany','DEU','2019-05-05 20:32:21'),
(197,' 加纳','Ghana','GHA','2019-05-05 20:32:21'),
(198,' 直布罗陀','Gibraltar','GIB','2019-05-05 20:32:21'),
(199,' 希腊','Greece','GRC','2019-05-05 20:32:21'),
(200,' 格陵兰','Greenland','GRL','2019-05-05 20:32:22'),
(201,' 格林纳达','Grenada','GRD','2019-05-05 20:32:22'),
(202,' 瓜德罗普','Guadeloupe','GLP','2019-05-05 20:32:22'),
(203,' 关岛','Guam','GUM','2019-05-05 20:32:22'),
(204,' 危地马拉','Guatemala','GTM','2019-05-05 20:32:22'),
(205,' 根西','Guernsey','GGY','2019-05-05 20:32:22'),
(206,' 几内亚','Guinea','GIN','2019-05-05 20:32:22'),
(207,' 几内亚比绍','Guinea-Bissau','GNB','2019-05-05 20:32:22'),
(208,' 圭亚那','Guyana','GUY','2019-05-05 20:32:22'),
(209,' 海地','Haiti','HTI','2019-05-05 20:32:22'),
(210,' 赫德岛和麦克唐纳群岛','Heard Island and McDonald Islands','HMD','2019-05-05 20:32:22'),
(211,' 洪都拉斯','Honduras','HND','2019-05-05 20:32:22'),
(212,' 香港','Hong Kong','HKG','2019-05-05 20:32:22'),
(213,' 匈牙利','Hungary','HUN','2019-05-05 20:32:23'),
(214,' 冰岛','Iceland','ISL','2019-05-05 20:32:23'),
(215,' 印度','India','IND','2019-05-05 20:32:23'),
(216,' 印尼','Indonesia','IDN','2019-05-05 20:32:23'),
(217,' 伊朗','Iran','IRN','2019-05-05 20:32:23'),
(218,' 伊拉克','Iraq','IRQ','2019-05-05 20:32:23'),
(219,' 爱尔兰','Ireland','IRL','2019-05-05 20:32:23'),
(220,' 马恩岛','Isle of Man','IMN','2019-05-05 20:32:23'),
(221,' 以色列','Israel','ISR','2019-05-05 20:32:23'),
(222,' 意大利','Italy','ITA','2019-05-05 20:32:23'),
(223,' 牙买加','Jamaica','JAM','2019-05-05 20:32:23'),
(224,' 日本','Japan','JPN','2019-05-05 20:32:23'),
(225,' 泽西','Jersey','JEY','2019-05-05 20:32:23'),
(226,' 约旦','Jordan','JOR','2019-05-05 20:32:24'),
(227,' 哈萨克斯坦','Kazakhstan','KAZ','2019-05-05 20:32:24'),
(228,' 肯尼亚','Kenya','KEN','2019-05-05 20:32:24'),
(229,' 基里巴斯','Kiribati','KIR','2019-05-05 20:32:24'),
(230,' 朝鲜','Korea','PRK','2019-05-05 20:32:24'),
(231,' 韩国','Korea','KOR','2019-05-05 20:32:24'),
(233,' 科威特','Kuwait','KWT','2019-05-05 20:32:24'),
(234,' 吉尔吉斯斯坦','Kyrgyzstan','KGZ','2019-05-05 20:32:24'),
(235,' 老挝','Laos','LAO','2019-05-05 20:32:24'),
(236,' 拉脱维亚','Latvia','LVA','2019-05-05 20:32:24'),
(237,' 黎巴嫩','Lebanon','LBN','2019-05-05 20:32:24'),
(238,' 莱索托','Lesotho','LSO','2019-05-05 20:32:25'),
(239,' 利比里亚','Liberia','LBR','2019-05-05 20:32:25'),
(240,' 利比亚','Libya','LBY','2019-05-05 20:32:25'),
(241,' 列支敦士登','Liechtenstein','LIE','2019-05-05 20:32:25'),
(242,' 立陶宛','Lithuania','LTU','2019-05-05 20:32:25'),
(243,' 卢森堡','Luxembourg','LUX','2019-05-05 20:32:25'),
(244,' 澳门','Macau','MAC','2019-05-05 20:32:25'),
(245,' 马其顿','Macedonia','MKD','2019-05-05 20:32:25'),
(246,' 马达加斯加','Madagascar','MDG','2019-05-05 20:32:25'),
(247,' 马拉维','Malawi','MWI','2019-05-05 20:32:25'),
(248,' 马来西亚','Malaysia','MYS','2019-05-05 20:32:25'),
(249,' 马尔代夫','Maldives','MDV','2019-05-05 20:32:25'),
(250,' 马里','Mali','MLI','2019-05-05 20:32:25'),
(251,' 马耳他','Malta','MLT','2019-05-05 20:32:26'),
(252,' 马绍尔群岛','Marshall Islands','MHL','2019-05-05 20:32:26'),
(253,' 马提尼克','Martinique','MTQ','2019-05-05 20:32:26'),
(254,' 毛里塔尼亚','Mauritania','MRT','2019-05-05 20:32:26'),
(255,' 毛里求斯','Mauritius','MUS','2019-05-05 20:32:26'),
(256,' 马约特','Mayotte','MYT','2019-05-05 20:32:26'),
(257,' 墨西哥','Mexico','MEX','2019-05-05 20:32:26'),
(258,' 密克罗尼西亚联邦','Micronesia','FSM','2019-05-05 20:32:26'),
(259,' 摩尔多瓦','Moldova','MDA','2019-05-05 20:32:26'),
(260,' 摩纳哥','Monaco','MCO','2019-05-05 20:32:26'),
(261,' 蒙古国','Mongolia','MNG','2019-05-05 20:32:26'),
(262,' 黑山','Montenegro','MNE','2019-05-05 20:32:26'),
(263,' 蒙特塞拉特','Montserrat','MSR','2019-05-05 20:32:26'),
(264,' 摩洛哥','Morocco','MAR','2019-05-05 20:32:27'),
(265,' 莫桑比克','Mozambique','MOZ','2019-05-05 20:32:27'),
(266,' 缅甸','Myanmar','MMR','2019-05-05 20:32:27'),
(267,' 纳米比亚','Namibia','NAM','2019-05-05 20:32:27'),
(268,' 瑙鲁','Nauru','NRU','2019-05-05 20:32:27'),
(269,' 尼泊尔','Nepal','NPL','2019-05-05 20:32:27'),
(270,' 荷兰','Netherlands','NLD','2019-05-05 20:32:27'),
(271,' 新喀里多尼亚','New Caledonia','NCL','2019-05-05 20:32:27'),
(272,' 新西兰','New Zealand','NZL','2019-05-05 20:32:27'),
(273,' 尼加拉瓜','Nicaragua','NIC','2019-05-05 20:32:27'),
(274,' 尼日尔','Niger','NER','2019-05-05 20:32:27'),
(275,' 尼日利亚','Nigeria','NGA','2019-05-05 20:32:27'),
(276,' 纽埃','Niue','NIU','2019-05-05 20:32:28'),
(277,' 诺福克岛','Norfolk Island','NFK','2019-05-05 20:32:28'),
(279,' 北马里亚纳群岛','Northern Mariana Islands','MNP','2019-05-05 20:32:28'),
(280,' 挪威','Norway','NOR','2019-05-05 20:32:28'),
(281,' 阿曼','Oman','OMN','2019-05-05 20:32:28'),
(282,' 巴基斯坦','Pakistan','PAK','2019-05-05 20:32:28'),
(283,' 帕劳','Palau','PLW','2019-05-05 20:32:28'),
(284,' 巴勒斯坦','State of Palestine','PSE','2019-05-05 20:32:28'),
(285,' 巴拿马','Panama','PAN','2019-05-05 20:32:28'),
(286,' 巴布亚新几内亚','Papua New Guinea','PNG','2019-05-05 20:32:28'),
(287,' 巴拉圭','Paraguay','PRY','2019-05-05 20:32:28'),
(288,' 秘鲁','Peru','PER','2019-05-05 20:32:28'),
(289,' 菲律宾','Philippines','PHL','2019-05-05 20:32:29'),
(290,' 皮特凯恩群岛','Pitcairn Islands','PCN','2019-05-05 20:32:29'),
(291,' 波兰','Poland','POL','2019-05-05 20:32:29'),
(292,' 葡萄牙','Portugal','PRT','2019-05-05 20:32:29'),
(293,' 波多黎各','Puerto Rico','PRI','2019-05-05 20:32:29'),
(294,' 卡塔尔','Qatar','QAT','2019-05-05 20:32:29'),
(295,' 留尼汪','Réunion','REU','2019-05-05 20:32:29'),
(296,' 罗马尼亚','Romania','ROU','2019-05-05 20:32:29'),
(297,' 俄罗斯','Russian Federation','RUS','2019-05-05 20:32:29'),
(298,' 卢旺达','Rwanda','RWA','2019-05-05 20:32:29'),
(299,' 圣巴泰勒米','Saint Barthélemy','BLM','2019-05-05 20:32:29'),
(300,' 圣赫勒拿、阿森松和特里斯坦-达库尼亚','Saint Helena','SHN','2019-05-05 20:32:29'),
(301,' 圣基茨和尼维斯','Saint Kitts and Nevis','KNA','2019-05-05 20:32:30'),
(302,' 圣卢西亚','Saint Lucia','LCA','2019-05-05 20:32:30'),
(303,' 法属圣马丁','Saint Martin (French part)','MAF','2019-05-05 20:32:30'),
(304,' 圣皮埃尔和密克隆','Saint Pierre and Miquelon','SPM','2019-05-05 20:32:30'),
(305,' 圣文森特和格林纳丁斯','Saint Vincent and the Grenadines','VCT','2019-05-05 20:32:30'),
(306,' 萨摩亚','Samoa','WSM','2019-05-05 20:32:30'),
(307,' 圣马力诺','San Marino','SMR','2019-05-05 20:32:30'),
(308,' 圣多美和普林西比','São Tomé and Príncipe','STP','2019-05-05 20:32:30'),
(309,' 沙特阿拉伯','Saudi Arabia','SAU','2019-05-05 20:32:30'),
(311,' 塞内加尔','Senegal','SEN','2019-05-05 20:32:30'),
(312,' 塞尔维亚','Serbia','SRB','2019-05-05 20:32:30'),
(313,' 塞舌尔','Seychelles','SYC','2019-05-05 20:32:30'),
(314,' 塞拉利昂','Sierra Leone','SLE','2019-05-05 20:32:31'),
(315,' 新加坡','Singapore','SGP','2019-05-05 20:32:31'),
(316,' 圣马丁','Sint Maarten (Dutch part)','SXM','2019-05-05 20:32:31'),
(317,' 斯洛伐克','Slovakia','SVK','2019-05-05 20:32:31'),
(318,' 斯洛文尼亚','Slovenia','SVN','2019-05-05 20:32:31'),
(319,' 所罗门群岛','Solomon Islands','SLB','2019-05-05 20:32:31'),
(320,' 索马里','Somalia','SOM','2019-05-05 20:32:31'),
(321,' 南非','South Africa','ZAF','2019-05-05 20:32:31'),
(322,' 南乔治亚和南桑威奇群岛','South Georgia and the South Sandwich Islands','SGS','2019-05-05 20:32:31'),
(323,' 南苏丹','South Sudan','SSD','2019-05-05 20:32:31'),
(324,' 西班牙','Spain','ESP','2019-05-05 20:32:31'),
(325,' 斯里兰卡','Sri Lanka','LKA','2019-05-05 20:32:31'),
(326,' 苏丹','Sudan','SDN','2019-05-05 20:32:31'),
(327,' 苏里南','Suriname','SUR','2019-05-05 20:32:32'),
(328,' 斯瓦尔巴和扬马延','Svalbard and Jan Mayen','SJM','2019-05-05 20:32:32'),
(329,' 斯威士兰','Swaziland','SWZ','2019-05-05 20:32:32'),
(330,' 瑞典','Sweden','SWE','2019-05-05 20:32:32'),
(331,' 瑞士','Switzerland','CHE','2019-05-05 20:32:32'),
(332,' 叙利亚','Syria','SYR','2019-05-05 20:32:32'),
(334,' 塔吉克斯坦','Tajikistan','TJK','2019-05-05 20:32:32'),
(335,' 坦桑尼亚','Tanzania','TZA','2019-05-05 20:32:32'),
(336,' 泰国','Thailand','THA','2019-05-05 20:32:32'),
(337,' 东帝汶','Timor-Leste','TLS','2019-05-05 20:32:32'),
(338,' 多哥','Togo','TGO','2019-05-05 20:32:32'),
(339,' 托克劳','Tokelau','TKL','2019-05-05 20:32:32'),
(340,' 汤加','Tonga','TON','2019-05-05 20:32:33'),
(341,' 特立尼达和多巴哥','Trinidad and Tobago','TTO','2019-05-05 20:32:33'),
(342,' 突尼斯','Tunisia','TUN','2019-05-05 20:32:33'),
(343,' 土耳其','Turkey','TUR','2019-05-05 20:32:33'),
(344,' 土库曼斯坦','Turkmenistan','TKM','2019-05-05 20:32:33'),
(345,' 特克斯和凯科斯群岛','Turks and Caicos Islands','TCA','2019-05-05 20:32:33'),
(346,' 图瓦卢','Tuvalu','TUV','2019-05-05 20:32:33'),
(347,' 乌干达','Uganda','UGA','2019-05-05 20:32:33'),
(348,' 乌克兰','Ukraine','UKR','2019-05-05 20:32:33'),
(349,' 阿联酋','United Arab Emirates','ARE','2019-05-05 20:32:33'),
(350,' 英国','United Kingdom','GBR','2019-05-05 20:32:33'),
(351,' 美国','United States','USA','2019-05-05 20:32:33'),
(352,' 美国本土外小岛屿','United States Minor Outlying Islands','UMI','2019-05-05 20:32:33'),
(353,' 美属维尔京群岛','United States Virgin Islands','VIR','2019-05-05 20:32:34'),
(354,' 乌拉圭','Uruguay','URY','2019-05-05 20:32:34'),
(355,' 乌兹别克斯坦','Uzbekistan','UZB','2019-05-05 20:32:34'),
(356,' 瓦努阿图','Vanuatu','VUT','2019-05-05 20:32:34'),
(357,' 梵蒂冈','Vatican City State','VAT','2019-05-05 20:32:34'),
(358,' 委内瑞拉','Venezuela','VEN','2019-05-05 20:32:34'),
(359,' 越南','Vietnam','VNM','2019-05-05 20:32:34'),
(361,' 瓦利斯和富图纳','Wallis and Futuna','WLF','2019-05-05 20:32:34'),
(362,' 西撒哈拉','Western Sahara','ESH','2019-05-05 20:32:34'),
(363,' 也门','Yemen','YEM','2019-05-05 20:32:34'),
(364,' 赞比亚','Zambia','ZMB','2019-05-05 20:32:34'),
(365,' 津巴布韦','Zimbabwe','ZWE','2019-05-05 20:32:35');

/*!40000 ALTER TABLE `tb_countries` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tb_dashboard
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_dashboard`;

CREATE TABLE `tb_dashboard` (
                                `date` date NOT NULL,
                                `project_id` int(11) NOT NULL,
                                `app_id` char(66) COLLATE utf8_bin DEFAULT '',
                                `vid_purchased_quantity` varchar(30) COLLATE utf8_bin DEFAULT '''0''',
                                `vid_purchased_yesterday` varchar(30) COLLATE utf8_bin DEFAULT '''0''',
                                `vid_purchased_yesterday_compare` varchar(30) COLLATE utf8_bin DEFAULT '''0''',
                                `vid_purchased_last_week` varchar(30) COLLATE utf8_bin DEFAULT '''0''',
                                `vid_purchased_last_week_compare` varchar(30) COLLATE utf8_bin DEFAULT '''0''',
                                `vid_purchased_last_month` varchar(30) COLLATE utf8_bin DEFAULT '''0''',
                                `vid_activated_quantity` varchar(30) COLLATE utf8_bin DEFAULT '''0''',
                                `vid_activated_yesterday` varchar(30) COLLATE utf8_bin DEFAULT '''0''',
                                `vid_activated_yesterday_compare` varchar(30) COLLATE utf8_bin DEFAULT '''0''',
                                `vid_activated_last_week` varchar(30) COLLATE utf8_bin DEFAULT '''0''',
                                `vid_activated_last_week_compare` varchar(30) COLLATE utf8_bin DEFAULT '''0''',
                                `vid_activated_last_month` varchar(30) COLLATE utf8_bin DEFAULT '''0''',
                                `vid_income_total` varchar(30) COLLATE utf8_bin DEFAULT '''0''',
                                `vid_income_yesterday` varchar(30) COLLATE utf8_bin DEFAULT '''0''',
                                `vid_income_yesterday_compare` varchar(30) COLLATE utf8_bin DEFAULT '''0''',
                                `vid_income_last_week` varchar(30) COLLATE utf8_bin DEFAULT '''0''',
                                `vid_income_last_week_compare` varchar(30) COLLATE utf8_bin DEFAULT '''0''',
                                `vtho_consumption_total` varchar(30) COLLATE utf8_bin DEFAULT '''0''',
                                `vtho_consumption_yesterday` varchar(30) COLLATE utf8_bin DEFAULT '''0''',
                                `vtho_consumption_yesterday_compare` varchar(30) COLLATE utf8_bin DEFAULT '''0''',
                                `vtho_consumption_last_week` varchar(30) COLLATE utf8_bin DEFAULT '''0''',
                                `vtho_consumption_last_week_compare` varchar(30) COLLATE utf8_bin DEFAULT '''0''',
                                `vtho_consumption_last_month` varchar(30) COLLATE utf8_bin DEFAULT '''0''',
                                `tx_total` varchar(30) COLLATE utf8_bin DEFAULT '''0''',
                                `tx_yesterday` varchar(30) COLLATE utf8_bin DEFAULT '''0''',
                                `tx_yesterday_compare` varchar(30) COLLATE utf8_bin DEFAULT '''0''',
                                `tx_last_week` varchar(30) COLLATE utf8_bin DEFAULT '''0''',
                                `tx_last_week_compare` varchar(30) COLLATE utf8_bin DEFAULT '''0''',
                                `tx_last_month` varchar(30) COLLATE utf8_bin DEFAULT '''0''',
                                `on_chain_total` varchar(30) COLLATE utf8_bin DEFAULT '''0''',
                                `on_chain_yesterday` varchar(30) COLLATE utf8_bin DEFAULT '''0''',
                                `on_chain_yesterday_compare` varchar(30) COLLATE utf8_bin DEFAULT '''0''',
                                `on_chain_last_week` varchar(30) COLLATE utf8_bin DEFAULT '''0''',
                                `on_chain_last_week_compare` varchar(30) COLLATE utf8_bin DEFAULT '''0''',
                                `on_chain_last_month` varchar(30) COLLATE utf8_bin DEFAULT '''0''',
                                `vtho_deposit_yesterday` varchar(30) COLLATE utf8_bin DEFAULT '''0''',
                                `vtho_deposit_last_week` varchar(30) COLLATE utf8_bin DEFAULT '''0''',
                                `vtho_deposit_last_month` varchar(30) COLLATE utf8_bin DEFAULT '''0''',
                                `baseinfo` varchar(30) COLLATE utf8_bin DEFAULT '''0''',
                                `baseinfo_total` varchar(30) COLLATE utf8_bin DEFAULT '''0''',
                                `trackinfo` varchar(30) COLLATE utf8_bin DEFAULT '''0''',
                                `trackinfo_total` varchar(30) COLLATE utf8_bin DEFAULT '''0''',
                                `ownerinfo1` varchar(30) COLLATE utf8_bin DEFAULT '''0''',
                                `ownerinfo1_total` varchar(30) COLLATE utf8_bin DEFAULT '''0''',
                                `ownerinfo2` varchar(30) COLLATE utf8_bin DEFAULT '''0''',
                                `ownerinfo2_total` varchar(30) COLLATE utf8_bin DEFAULT '''0''',
                                `create_time` timestamp NULL DEFAULT NULL,
                                `update_time` timestamp NULL DEFAULT NULL,
                                UNIQUE KEY `date` (`date`,`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;



# Dump of table tb_data_permission
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_data_permission`;

CREATE TABLE `tb_data_permission` (
                                      `id` int(11) NOT NULL AUTO_INCREMENT,
                                      `user_id` int(11) DEFAULT NULL,
                                      `type` varchar(60) NOT NULL DEFAULT '',
                                      `value` varchar(2048) DEFAULT NULL,
                                      PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据权限';



# Dump of table tb_enterprise
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_enterprise`;

CREATE TABLE `tb_enterprise` (
                                 `enterprise_id` int(11) NOT NULL AUTO_INCREMENT,
                                 `admin_user_id` int(11) DEFAULT NULL COMMENT '企业管理员用户id',
                                 `enterprise_name` varchar(50) DEFAULT NULL COMMENT '企业名称',
                                 `account` varchar(20) DEFAULT NULL COMMENT '企业管理员账号',
                                 `status` varchar(20) DEFAULT NULL COMMENT '状态,ENABLE 启用,DISABLE 禁用',
                                 `project_count` int(11) DEFAULT NULL COMMENT '项目数量',
                                 `name` varchar(300) DEFAULT NULL,
                                 `contact_tel_no` varchar(20) DEFAULT NULL COMMENT '联系人电话',
                                 `contact_email` varchar(200) DEFAULT NULL,
                                 `finance_contact_name` varchar(32) DEFAULT NULL COMMENT '财务联系人姓名',
                                 `finance_contact_tel_no` varchar(100) DEFAULT NULL COMMENT '财务联系人电话',
                                 `finance_contact_email` varchar(200) DEFAULT NULL,
                                 `create_time` timestamp NULL DEFAULT NULL,
                                 `update_time` timestamp NULL DEFAULT NULL,
                                 PRIMARY KEY (`enterprise_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table tb_feature_config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_feature_config`;

CREATE TABLE `tb_feature_config` (
                                     `id` int(11) NOT NULL AUTO_INCREMENT,
                                     `category` varchar(50) DEFAULT NULL COMMENT '功能分类',
                                     `property_key` varchar(100) DEFAULT NULL COMMENT '配置项',
                                     `property_value` varchar(256) DEFAULT NULL COMMENT '配置值',
                                     `create_time` timestamp NULL DEFAULT NULL,
                                     `scope` varchar(100) DEFAULT NULL COMMENT '适用对象,ALL 所有人,CHANNEL 渠道管理员,PROJECT 项目管理员,OPERATOR 操作员,ENTERPRISE 企业管理员',
                                     PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='功能配置表';

LOCK TABLES `tb_feature_config` WRITE;
/*!40000 ALTER TABLE `tb_feature_config` DISABLE KEYS */;

INSERT INTO `tb_feature_config` (`id`, `category`, `property_key`, `property_value`, `create_time`, `scope`)
VALUES
(1,'user','second.login','false','2019-05-24 08:04:55','ALL'),
(2,'common','modify.password','true','2019-05-24 08:05:40','STANDARD_PROJECT_ADMIN'),
(3,'common','modify.password','true','2019-05-24 08:05:43','CHANNEL_ADMIN'),
(4,'common','modify.password','true','2019-05-24 08:05:40','DEVELOPER_PROJECT_ADMIN'),
(5,'common','modify.password','true','2019-05-24 08:05:40','ENTERPRISE_ADMIN');

/*!40000 ALTER TABLE `tb_feature_config` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tb_goods_attch
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_goods_attch`;

CREATE TABLE `tb_goods_attch` (
                                  `id` int(11) NOT NULL AUTO_INCREMENT,
                                  `type` varchar(45) DEFAULT NULL COMMENT '附件类型(IMAGE：商品图片，SPEC：规格书)',
                                  `goods_id` int(10) NOT NULL COMMENT ' 商品名称',
                                  `file_path` varchar(255) DEFAULT NULL COMMENT '文件路径',
                                  `isvalid` tinyint(1) NOT NULL DEFAULT '1' COMMENT '数据状态(0:删除，1：正常)',
                                  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
                                  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                  PRIMARY KEY (`id`),
                                  KEY `goodsIndex` (`goods_id`),
                                  KEY `IsValidIndex` (`isvalid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品附件表';



# Dump of table tb_goods_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_goods_category`;

CREATE TABLE `tb_goods_category` (
                                     `id` int(11) NOT NULL AUTO_INCREMENT,
                                     `baas_id` int(11) DEFAULT NULL,
                                     `name` varchar(100) NOT NULL COMMENT ' 商品名称',
                                     `type` varchar(45) DEFAULT NULL,
                                     `status` varchar(45) NOT NULL COMMENT '标签类型(GENERAL：通用类型，CUSTOM：定制类型)',
                                     `isvalid` tinyint(1) NOT NULL DEFAULT '1' COMMENT '数据状态(0:删除，1：正常)',
                                     `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
                                     `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                     PRIMARY KEY (`id`),
                                     KEY `nameIndex` (`name`),
                                     KEY `isvalidIndex` (`isvalid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品类别表';



# Dump of table tb_goods_chip_model
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_goods_chip_model`;

CREATE TABLE `tb_goods_chip_model` (
                                       `id` int(11) NOT NULL AUTO_INCREMENT,
                                       `baas_id` int(11) DEFAULT NULL,
                                       `name` varchar(200) NOT NULL COMMENT ' 属性名称',
                                       `options` varchar(200) DEFAULT NULL COMMENT '属性值',
                                       `isvalid` tinyint(1) NOT NULL DEFAULT '1' COMMENT '数据状态(0:删除，1：正常)',
                                       `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
                                       `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                       PRIMARY KEY (`id`),
                                       KEY `isValidIndex` (`isvalid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品属性表';



# Dump of table tb_goods_freight
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_goods_freight`;

CREATE TABLE `tb_goods_freight` (
                                    `id` int(11) NOT NULL AUTO_INCREMENT,
                                    `countries` varchar(300) NOT NULL COMMENT ' 国家名称',
                                    `std_country_name` varchar(100) DEFAULT NULL,
                                    `tax_rate` int(5) NOT NULL COMMENT '国家税率',
                                    `hash` varchar(200) DEFAULT NULL,
                                    `isvalid` tinyint(1) NOT NULL DEFAULT '1' COMMENT '数据状态(0:删除，1：正常)',
                                    `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
                                    `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                    PRIMARY KEY (`id`),
                                    KEY `isvalidIndex` (`isvalid`),
                                    KEY `countriesIndex` (`countries`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品运费表';



# Dump of table tb_goods_freight_backup
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_goods_freight_backup`;

CREATE TABLE `tb_goods_freight_backup` (
                                           `id` int(11) NOT NULL AUTO_INCREMENT,
                                           `countries` varchar(300) NOT NULL COMMENT ' 国家名称',
                                           `std_country_name` varchar(100) DEFAULT NULL,
                                           `tax_rate` int(5) NOT NULL COMMENT '国家税率',
                                           `hash` varchar(200) DEFAULT NULL,
                                           `isvalid` tinyint(1) NOT NULL DEFAULT '1' COMMENT '数据状态(0:删除，1：正常)',
                                           `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
                                           `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                           PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品运费表';



# Dump of table tb_goods_freight_details
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_goods_freight_details`;

CREATE TABLE `tb_goods_freight_details` (
                                            `id` int(11) NOT NULL AUTO_INCREMENT,
                                            `freight_id` int(10) NOT NULL COMMENT ' 国家名称',
                                            `weight_min` double(10,4) NOT NULL,
                                            `weight_max` double(10,4) NOT NULL,
                                            `isvalid` tinyint(1) NOT NULL DEFAULT '1' COMMENT '数据状态(0:删除，1：正常)',
                                            `cost` float(20,4) NOT NULL DEFAULT '0.0000' COMMENT '运费费用/按重量范围计算',
                                            `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
                                            `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                            PRIMARY KEY (`id`),
                                            KEY `freightIndex` (`freight_id`),
                                            KEY `isvalidIndex` (`isvalid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品运费明细表';



# Dump of table tb_goods_freight_details_backup
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_goods_freight_details_backup`;

CREATE TABLE `tb_goods_freight_details_backup` (
                                                   `id` int(11) NOT NULL AUTO_INCREMENT,
                                                   `freight_id` int(10) NOT NULL COMMENT ' 国家名称',
                                                   `weight_min` double(10,2) NOT NULL,
                                                   `weight_max` double(10,2) NOT NULL,
                                                   `isvalid` tinyint(1) NOT NULL DEFAULT '1' COMMENT '数据状态(0:删除，1：正常)',
                                                   `cost` float(20,4) NOT NULL DEFAULT '0.0000' COMMENT '运费费用/按重量范围计算',
                                                   `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
                                                   `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                                   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品运费明细表';



# Dump of table tb_goods_order
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_goods_order`;

CREATE TABLE `tb_goods_order` (
                                  `order_id` int(30) NOT NULL AUTO_INCREMENT,
                                  `project_id` int(10) unsigned NOT NULL,
                                  `order_name` varchar(64) COLLATE utf8_bin NOT NULL,
                                  `status` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT 'INIT',
                                  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                  `approved_time` datetime DEFAULT NULL,
                                  `pay_time` datetime DEFAULT NULL,
                                  `confirmed_time` datetime DEFAULT NULL,
                                  `declined_time` datetime DEFAULT NULL,
                                  `success_time` datetime DEFAULT NULL,
                                  `baas_order_id` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '数据对接ID',
                                  `create_user` int(10) NOT NULL,
                                  `approved_user` varchar(10) COLLATE utf8_bin DEFAULT NULL,
                                  `sync_status` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT 'INIT',
                                  `goods_type` varchar(30) COLLATE utf8_bin NOT NULL DEFAULT 'QRcode',
                                  `chip_version` varchar(64) COLLATE utf8_bin DEFAULT 'v1',
                                  `ID_quantity` int(11) NOT NULL,
                                  `SKU_id` int(11) DEFAULT NULL,
                                  `goods_id` int(11) NOT NULL,
                                  `goodsPrice` varchar(20) COLLATE utf8_bin DEFAULT NULL,
                                  `order_amount` decimal(20,6) NOT NULL,
                                  `total_amount` decimal(20,6) DEFAULT NULL,
                                  `fee` decimal(20,6) NOT NULL,
                                  `tax` decimal(20,6) DEFAULT NULL,
                                  `taxRate` varchar(20) COLLATE utf8_bin DEFAULT NULL,
                                  `order_type` varchar(15) COLLATE utf8_bin NOT NULL DEFAULT '',
                                  `collection_id` int(11) DEFAULT NULL,
                                  `buy_order_id` int(10) DEFAULT NULL,
                                  `pay_type` varchar(11) COLLATE utf8_bin DEFAULT NULL,
                                  `UPDATE_TIME` datetime DEFAULT NULL,
                                  `orderingid` varchar(100) COLLATE utf8_bin DEFAULT NULL,
                                  `countryId` varchar(20) COLLATE utf8_bin DEFAULT NULL,
                                  `oldorderid` varchar(20) COLLATE utf8_bin DEFAULT NULL,
                                  PRIMARY KEY (`order_id`),
                                  KEY `tb_chip_order_index_2` (`create_time`),
                                  KEY `baas_order_id` (`baas_order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;



# Dump of table tb_goods_order_onchain
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_goods_order_onchain`;

CREATE TABLE `tb_goods_order_onchain` (
                                          `id` int(30) NOT NULL AUTO_INCREMENT,
                                          `order_id` int(30) NOT NULL,
                                          `project_id` int(10) unsigned NOT NULL,
                                          `request_no` varchar(100) COLLATE utf8_bin DEFAULT NULL,
                                          `chain_number` int(11) DEFAULT NULL,
                                          `status` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT 'INIT',
                                          `update_time` datetime DEFAULT NULL,
                                          `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                          PRIMARY KEY (`id`),
                                          UNIQUE KEY `requestNoIndex` (`request_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='上链次数增送表';



# Dump of table tb_goods_order_present
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_goods_order_present`;

CREATE TABLE `tb_goods_order_present` (
                                          `id` int(30) NOT NULL AUTO_INCREMENT,
                                          `order_id` int(30) NOT NULL,
                                          `project_id` int(10) unsigned NOT NULL,
                                          `request_no` varchar(100) COLLATE utf8_bin DEFAULT NULL,
                                          `chain_number` int(11) DEFAULT NULL,
                                          `status` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT 'INIT',
                                          `update_time` datetime DEFAULT NULL,
                                          `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                          `present_order_id` int(30) DEFAULT NULL,
                                          PRIMARY KEY (`id`),
                                          UNIQUE KEY `requestNoIndex` (`request_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='上链次数增送表';



# Dump of table tb_goods_order_recipient
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_goods_order_recipient`;

CREATE TABLE `tb_goods_order_recipient` (
                                            `id` int(11) NOT NULL AUTO_INCREMENT,
                                            `order_id` int(10) NOT NULL,
                                            `receive_addr` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
                                            `receive_name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
                                            `receive_tel` varchar(32) COLLATE utf8_bin DEFAULT NULL,
                                            `receive_email` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                            `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
                                            PRIMARY KEY (`id`),
                                            UNIQUE KEY `UNI_ORDERID` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;



# Dump of table tb_goods_order_status
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_goods_order_status`;

CREATE TABLE `tb_goods_order_status` (
                                         `id` int(11) NOT NULL AUTO_INCREMENT,
                                         `order_id` int(10) NOT NULL,
                                         `status` varchar(15) COLLATE utf8_bin NOT NULL DEFAULT '',
                                         `time` datetime DEFAULT CURRENT_TIMESTAMP,
                                         `creater_id` int(10) unsigned DEFAULT NULL,
                                         PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;



# Dump of table tb_goods_order_subset
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_goods_order_subset`;

CREATE TABLE `tb_goods_order_subset` (
                                         `sub_order_id` int(11) NOT NULL AUTO_INCREMENT,
                                         `order_id` int(30) NOT NULL,
                                         `baas_suborder_id` int(30) DEFAULT NULL,
                                         `ID_quantity` int(11) NOT NULL,
                                         `status` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '',
                                         `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
                                         `confirm_time` datetime DEFAULT CURRENT_TIMESTAMP,
                                         `sync_status` varchar(20) COLLATE utf8_bin DEFAULT 'INIT',
                                         `confirm_user` varchar(10) COLLATE utf8_bin DEFAULT NULL,
                                         `logistics_info` varchar(10000) COLLATE utf8_bin NOT NULL DEFAULT '',
                                         PRIMARY KEY (`sub_order_id`),
                                         UNIQUE KEY `baasSubOrderUindex` (`baas_suborder_id`),
                                         KEY `order_id` (`order_id`),
                                         KEY `baas_suborder_id` (`baas_suborder_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;



# Dump of table tb_goods_parities
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_goods_parities`;

CREATE TABLE `tb_goods_parities` (
                                     `id` int(11) NOT NULL AUTO_INCREMENT,
                                     `name` varchar(300) NOT NULL COMMENT '币种名称',
                                     `scale` int(10) DEFAULT '2' COMMENT '小数长度',
                                     `symbol` varchar(45) NOT NULL COMMENT '当前币种',
                                     `symbol_value` double(10,5) NOT NULL DEFAULT '0.00000',
                                     `to_symbol` varchar(45) NOT NULL COMMENT '兑换币种',
                                     `to_symbol_value` double(10,5) NOT NULL DEFAULT '0.00000' COMMENT '兑换汇率(1USD = 6.8907RMB)',
                                     `discount` int(5) NOT NULL DEFAULT '0' COMMENT '支付折扣(0：不打折，其他整数为折扣数)',
                                     `hash` varchar(200) DEFAULT NULL,
                                     `baas_id` int(10) DEFAULT NULL,
                                     `isvalid` tinyint(1) NOT NULL DEFAULT '1' COMMENT '数据状态(0:删除，1：正常)',
                                     `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
                                     `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                     PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='结算币种表';



# Dump of table tb_goods_parities_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_goods_parities_log`;

CREATE TABLE `tb_goods_parities_log` (
                                         `id` int(11) NOT NULL AUTO_INCREMENT,
                                         `name` varchar(100) NOT NULL COMMENT '币种名称',
                                         `parities_id` int(10) NOT NULL,
                                         `symbol` varchar(45) NOT NULL COMMENT '当前币种',
                                         `symbol_value` double(10,5) NOT NULL DEFAULT '0.00000',
                                         `to_symbol` varchar(45) NOT NULL COMMENT '兑换币种',
                                         `to_symbol_value` double(10,5) NOT NULL DEFAULT '0.00000' COMMENT '兑换汇率(1USD = 6.8907RMB)',
                                         `discount` int(5) NOT NULL DEFAULT '0' COMMENT '支付折扣(0：不打折，其他整数为折扣数)',
                                         `isvalid` tinyint(1) NOT NULL DEFAULT '1' COMMENT '数据状态(0:删除，1：正常)',
                                         `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
                                         `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                         PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='结算币种表';



# Dump of table tb_goods_project
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_goods_project`;

CREATE TABLE `tb_goods_project` (
                                    `id` int(11) NOT NULL AUTO_INCREMENT,
                                    `goods_id` int(10) NOT NULL COMMENT ' 商品名称',
                                    `project_id` int(10) NOT NULL COMMENT '关联id',
                                    `isvalid` tinyint(1) NOT NULL DEFAULT '1' COMMENT '数据状态(0:删除，1：正常)',
                                    `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
                                    `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                    PRIMARY KEY (`id`),
                                    KEY `goodsIndex` (`goods_id`),
                                    KEY `projectIndex` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品关联表';



# Dump of table tb_goods_sync
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_goods_sync`;

CREATE TABLE `tb_goods_sync` (
                                 `id` int(11) NOT NULL AUTO_INCREMENT,
                                 `price` double(10,4) DEFAULT NULL COMMENT '商品售价',
                                 `image` varchar(300) DEFAULT NULL,
                                 `name` longtext,
                                 `description` longtext,
                                 `baas_goods_id` int(10) NOT NULL COMMENT 'baas商品表Id',
                                 `toolchain_goods_id` int(10) NOT NULL,
                                 `hash` varchar(255) NOT NULL,
                                 `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                 `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                 PRIMARY KEY (`id`),
                                 UNIQUE KEY `baasIndex` (`baas_goods_id`),
                                 UNIQUE KEY `toolIndex` (`toolchain_goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品同步表';



# Dump of table tb_goods_toolchain
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_goods_toolchain`;

CREATE TABLE `tb_goods_toolchain` (
                                      `id` int(11) NOT NULL AUTO_INCREMENT,
                                      `name` longtext COMMENT '商品名称',
                                      `ordering_id` varchar(100) DEFAULT NULL,
                                      `category_id` int(10) NOT NULL COMMENT '商品类型(类型表Id)',
                                      `chip_model_id` int(10) DEFAULT NULL,
                                      `price` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '商品售价',
                                      `weight` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '商品重量(kg)',
                                      `status` varchar(20) DEFAULT NULL COMMENT '上架状态(ONLINE:上线，OFFLINE：下线)',
                                      `isvalid` tinyint(1) DEFAULT '1' COMMENT '数据状态(0:删除，1：正常)',
                                      `description` longtext COMMENT '商品描述',
                                      `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                      `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                      PRIMARY KEY (`id`),
                                      KEY `categoryIdIndex` (`category_id`),
                                      KEY `isvalidIndex` (`isvalid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品表';



# Dump of table tb_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_menu`;

CREATE TABLE `tb_menu` (
                           `menu_id` int(11) NOT NULL AUTO_INCREMENT,
                           `menu_name` varchar(50) DEFAULT NULL,
                           `parent_menu_id` int(11) DEFAULT NULL,
                           `menu_name_en` varchar(50) DEFAULT NULL,
                           PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单';

LOCK TABLES `tb_menu` WRITE;
/*!40000 ALTER TABLE `tb_menu` DISABLE KEYS */;

INSERT INTO `tb_menu` (`menu_id`, `menu_name`, `parent_menu_id`, `menu_name_en`)
VALUES
(1,'企业管理列表',NULL,'test'),
(2,'项目管理列表',NULL,'test'),
(3,'订单管理列表',NULL,'test'),
(4,'系统管理',NULL,'test'),
(5,'渠道开发者中心',NULL,'test'),
(6,'通知',NULL,'test'),
(7,'采购管理列表',NULL,'test'),
(8,'标签ID管理列表',NULL,'test'),
(9,'sku管理列表',NULL,'test'),
(10,'追溯操作列表',NULL,'test'),
(11,'transactionID查询',NULL,'test'),
(13,'商品管理列表',4,'test'),
(14,'开发者中心',5,'test'),
(15,'集合ID列表',8,'test'),
(16,'商品ID列表',8,'test'),
(17,'创建机构',4,'test'),
(18,'创建app操作员',4,'test'),
(19,'开发者费用管理',5,'test'),
(20,'项目合约费用',5,'test'),
(21,'dashboard',NULL,'test');

/*!40000 ALTER TABLE `tb_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tb_notice
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_notice`;

CREATE TABLE `tb_notice` (
                             `id` int(11) NOT NULL AUTO_INCREMENT,
                             `title` varchar(200) DEFAULT NULL COMMENT '通知标题',
                             `type` varchar(45) DEFAULT NULL COMMENT '消息类型(PROJECT:项目管理员，CHANNEL：渠道管理员)',
                             `user_id` int(10) DEFAULT NULL,
                             `message` longtext COMMENT '通知消息',
                             `project_id` int(10) DEFAULT NULL COMMENT '用户Id',
                             `link_title` varchar(200) DEFAULT NULL COMMENT '链接标题',
                             `link_url` varchar(200) DEFAULT NULL COMMENT '链接URL',
                             `link_params` varchar(255) DEFAULT NULL,
                             `flag` varchar(100) DEFAULT NULL COMMENT '为业务处理主要防重复',
                             `sync_email` varchar(200) DEFAULT NULL COMMENT 'NO,YES',
                             `email_status` varchar(32) DEFAULT NULL,
                             `read_status` varchar(32) DEFAULT NULL COMMENT '状态(INIT: 未读,READ：已读)',
                             `update_time` timestamp NULL DEFAULT NULL,
                             `create_time` timestamp NULL DEFAULT NULL,
                             PRIMARY KEY (`id`),
                             UNIQUE KEY `flagUNIQUE` (`flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通知表';



# Dump of table tb_notice_request
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_notice_request`;

CREATE TABLE `tb_notice_request` (
                                     `id` int(11) NOT NULL AUTO_INCREMENT,
                                     `source_id` int(10) NOT NULL,
                                     `source_type` varchar(45) NOT NULL,
                                     `sync_status` varchar(45) NOT NULL,
                                     `status` varchar(45) NOT NULL COMMENT '订单状态',
                                     `request_no` varchar(100) NOT NULL,
                                     `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                     `update_time` timestamp NULL DEFAULT NULL,
                                     PRIMARY KEY (`id`),
                                     UNIQUE KEY `requestIndex` (`request_no`,`source_type`,`source_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通知控制表';



# Dump of table tb_org
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_org`;

CREATE TABLE `tb_org` (
                          `org_id` int(11) NOT NULL AUTO_INCREMENT,
                          `project_id` int(11) DEFAULT NULL COMMENT '项目id',
                          `name` varchar(100) DEFAULT NULL COMMENT '机构名称',
                          `contact` varchar(100) DEFAULT NULL COMMENT '联系人',
                          `tel_no` varchar(50) DEFAULT NULL COMMENT '联系电话',
                          `address` varchar(256) DEFAULT NULL COMMENT '联系地址',
                          `create_time` timestamp NULL DEFAULT NULL,
                          `update_time` timestamp NULL DEFAULT NULL,
                          `sync_status` varchar(20) DEFAULT NULL,
                          `uid` varchar(70) DEFAULT NULL,
                          `secret_key` varchar(32) DEFAULT '',
                          PRIMARY KEY (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='机构';



# Dump of table tb_permission
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_permission`;

CREATE TABLE `tb_permission` (
                                 `permission_id` int(11) NOT NULL AUTO_INCREMENT,
                                 `code` varchar(50) DEFAULT NULL COMMENT '权限编码',
                                 `name` varchar(50) NOT NULL DEFAULT '' COMMENT '权限描述',
                                 PRIMARY KEY (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限';

LOCK TABLES `tb_permission` WRITE;
/*!40000 ALTER TABLE `tb_permission` DISABLE KEYS */;

INSERT INTO `tb_permission` (`permission_id`, `code`, `name`)
VALUES
(1,'ORDER_ALL','订单管理列表'),
(2,'USER_ALL','用户权限'),
(3,'COLLECTION_ALL','集合权限'),
(4,'ENTERPRISE_ALL','企业管理列表'),
(5,'ORG_ALL','机构权限'),
(6,'PROJECT_ALL','项目管理列表'),
(7,'SKU_ALL','sku权限'),
(8,'TRACKOP_ALL','追溯权限'),
(9,'SYSTEM_ALL','系统管理'),
(10,'DEVELOP_ALL','开发中心'),
(11,'NOTIFY_ALL','通知'),
(12,'PURCHASING_ALL','采购管理'),
(13,'ID_ALL','标签ID管理'),
(14,'TRANSACTION_ID_ALL','transactionID查询'),
(15,'DASHBOARD_ALL','dashboard'),
(16,'BASE','基础权限'),
(17,'GOODS_ALL','商品权限'),
(18,'USER_RESETPWD','修改密码'),
(19,'ORG_LIST','机构列表'),
(20,'USER_LOAD','读取用户信息'),
(21,'SET_PROJECT_TRADE_PWD','设置交易密码'),
(22,'PROJECT_DEPOSIT','项目充值');

/*!40000 ALTER TABLE `tb_permission` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tb_project
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_project`;

CREATE TABLE `tb_project` (
                              `project_id` int(11) NOT NULL AUTO_INCREMENT,
                              `enterprise_id` int(11) DEFAULT NULL COMMENT '企业id',
                              `app_id` varchar(70) DEFAULT NULL,
                              `uid` varchar(70) DEFAULT NULL COMMENT '合约创建者ID',
                              `secret_key` varchar(32) DEFAULT NULL COMMENT '密钥',
                              `address` varchar(64) DEFAULT NULL COMMENT '链上地址',
                              `sync_status` varchar(20) DEFAULT NULL COMMENT '同步状态',
                              `name` varchar(100) NOT NULL COMMENT '项目名称',
                              `code` varchar(100) DEFAULT NULL COMMENT '项目编码',
                              `project_desc` longtext COMMENT '项目简介',
                              `admin_user_id` int(11) DEFAULT NULL COMMENT '项目管理员id',
                              `account` varchar(20) DEFAULT NULL COMMENT '管理员账号',
                              `vthor_balance` varchar(50) DEFAULT '0' COMMENT 'vhtor余额',
                              `email` varchar(200) DEFAULT NULL,
                              `tel_no` varchar(29) DEFAULT NULL,
                              `threshold` int(11) DEFAULT NULL COMMENT '费用预警阀值',
                              `chain_type` varchar(60) DEFAULT NULL COMMENT '上链类型',
                              `data_type` varchar(60) DEFAULT NULL COMMENT '数据服务类型',
                              `api_service` varchar(100) DEFAULT NULL COMMENT 'API服务',
                              `vid_service` varchar(60) DEFAULT NULL COMMENT 'VID服务',
                              `standard` varchar(10) DEFAULT NULL COMMENT '是否是标准项目:YES/NO',
                              `extra_url` varchar(128) DEFAULT NULL COMMENT '芯片写入额外的URL',
                              `status` varchar(20) DEFAULT NULL COMMENT 'ENABLE启用,DISABLE禁用',
                              `vid_suffix` varchar(10) DEFAULT NULL COMMENT '在URL后缀自动添加VID字符串,YES/NO',
                              `allow_pro_scan` varchar(10) DEFAULT NULL COMMENT '允许pro扫描,YES/NO',
                              `create_time` timestamp NULL DEFAULT NULL,
                              `update_time` timestamp NULL DEFAULT NULL,
                              `onchain_balance` int(11) DEFAULT '0',
                              `onchain_available_balance` int(11) DEFAULT '0',
                              `onchain_frozen_balance` int(11) DEFAULT '0',
                              `is20project` varchar(10) DEFAULT NULL,
                              `old_project_id` varchar(100) DEFAULT NULL,
                              PRIMARY KEY (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目';



# Dump of table tb_project_account
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_project_account`;

CREATE TABLE `tb_project_account` (
                                      `id` int(11) NOT NULL AUTO_INCREMENT,
                                      `request_no` varchar(100) NOT NULL,
                                      `app_id` varchar(70) NOT NULL COMMENT 'appid',
                                      `project_id` int(10) NOT NULL COMMENT '项目id',
                                      `name` varchar(100) NOT NULL,
                                      `uid` varchar(150) DEFAULT NULL COMMENT 'Appkey',
                                      `status` varchar(45) DEFAULT NULL,
                                      `secret_key` varchar(150) NOT NULL COMMENT '合约地址',
                                      `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                                      `create_time` timestamp NULL DEFAULT NULL,
                                      PRIMARY KEY (`id`),
                                      UNIQUE KEY `requestNoIndex` (`request_no`,`project_id`),
                                      UNIQUE KEY `requestUidIndex` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='开发者子账号';



# Dump of table tb_project_address
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_project_address`;

CREATE TABLE `tb_project_address` (
                                      `id` int(11) NOT NULL AUTO_INCREMENT,
                                      `project_id` int(10) DEFAULT NULL COMMENT '项目Id',
                                      `address` longtext COMMENT '地址',
                                      `isvalid` tinyint(1) DEFAULT NULL,
                                      `update_time` timestamp NULL DEFAULT NULL,
                                      `create_time` timestamp NULL DEFAULT NULL,
                                      PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收货地址缓存';



# Dump of table tb_project_deposit
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_project_deposit`;

CREATE TABLE `tb_project_deposit` (
                                      `deposit_id` int(11) NOT NULL AUTO_INCREMENT,
                                      `project_id` int(11) DEFAULT NULL,
                                      `amount` decimal(10,0) DEFAULT NULL,
                                      `remark` varchar(64) DEFAULT NULL COMMENT '备注',
                                      `status` varchar(20) DEFAULT NULL,
                                      `txid` varchar(70) DEFAULT NULL,
                                      `create_time` timestamp NULL DEFAULT NULL,
                                      `update_time` timestamp NULL DEFAULT NULL,
                                      `project_name` varchar(100) DEFAULT NULL,
                                      PRIMARY KEY (`deposit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目充值订单';



# Dump of table tb_project_developer
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_project_developer`;

CREATE TABLE `tb_project_developer` (
                                        `id` int(11) NOT NULL AUTO_INCREMENT,
                                        `app_id` varchar(70) NOT NULL COMMENT 'appid',
                                        `app_key` varchar(70) NOT NULL COMMENT 'Appkey',
                                        `address` varchar(45) DEFAULT NULL COMMENT '合约地址',
                                        `app_status` varchar(45) DEFAULT NULL COMMENT 'True:显示,false：隐藏',
                                        `project_id` int(10) DEFAULT NULL COMMENT '项目id',
                                        `uid_stauts` varchar(45) DEFAULT NULL COMMENT 'False：未下载，True：已下载',
                                        `uid_time` timestamp NULL DEFAULT NULL,
                                        `sdk_status` varchar(45) DEFAULT NULL COMMENT 'True：显示，false：不显示',
                                        `cert_id` int(10) DEFAULT NULL,
                                        `user_id` int(10) DEFAULT NULL,
                                        `csr_file` varchar(200) DEFAULT NULL COMMENT 'csr文件路劲',
                                        `csr_private` varchar(2000) DEFAULT NULL,
                                        `rsa_status` varchar(45) DEFAULT NULL COMMENT 'INIT: 为上传,UPLOAD：已上传',
                                        `rsa_private` varchar(2000) DEFAULT NULL,
                                        `csr_status` varchar(45) DEFAULT NULL COMMENT 'INIT:未上传，UPLOAD:已上传，CREATE：生成中，DOWNLOAD：已下载',
                                        `create_time` timestamp NULL DEFAULT NULL,
                                        `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                                        `app_sign` longtext,
                                        `sign_status` varchar(45) DEFAULT NULL,
                                        PRIMARY KEY (`id`),
                                        UNIQUE KEY `projectIndex` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目开发者表';



# Dump of table tb_project_developer_vid
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_project_developer_vid`;

CREATE TABLE `tb_project_developer_vid` (
                                            `id` int(11) NOT NULL AUTO_INCREMENT,
                                            `request_no` varchar(100) DEFAULT NULL,
                                            `project_id` int(10) DEFAULT NULL COMMENT '项目id',
                                            `vid` varchar(66) DEFAULT NULL,
                                            `url` varchar(200) DEFAULT NULL,
                                            `type` varchar(45) DEFAULT NULL COMMENT 'VIDS：批量生成，VID：抢占注册',
                                            `app_id` varchar(100) DEFAULT NULL,
                                            `vid_number` int(10) DEFAULT NULL COMMENT 'vid数量',
                                            `vid_cache` varchar(200) DEFAULT NULL COMMENT '缓存路径',
                                            `vid_status` varchar(45) DEFAULT NULL COMMENT 'INIT：新请求，BAAS：请求baas，ORDER：写入order，FINISH：完成',
                                            `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                                            `create_time` timestamp NULL DEFAULT NULL,
                                            PRIMARY KEY (`id`),
                                            UNIQUE KEY `requestIndex` (`request_no`,`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目开发者生成vid';



# Dump of table tb_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_role`;

CREATE TABLE `tb_role` (
                           `role_id` int(11) NOT NULL AUTO_INCREMENT,
                           `code` varchar(30) NOT NULL,
                           `name` varchar(50) NOT NULL,
                           PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `tb_role` WRITE;
/*!40000 ALTER TABLE `tb_role` DISABLE KEYS */;

INSERT INTO `tb_role` (`role_id`, `code`, `name`)
VALUES
(1,'CHANNEL_ADMIN','渠道管理员'),
(2,'ENTERPRISE_ADMIN','企业管理员'),
(3,'STANDARD_PROJECT_ADMIN','标准项目管理员'),
(4,'DEVELOPER_PROJECT_ADMIN','开发者项目管理员'),
(5,'PROJECT_OPERATOR','项目操作员');

/*!40000 ALTER TABLE `tb_role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tb_role_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_role_menu`;

CREATE TABLE `tb_role_menu` (
                                `role_id` int(11) DEFAULT NULL,
                                `menu_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色对应权限';

LOCK TABLES `tb_role_menu` WRITE;
/*!40000 ALTER TABLE `tb_role_menu` DISABLE KEYS */;

INSERT INTO `tb_role_menu` (`role_id`, `menu_id`)
VALUES
(1,1),
(1,2),
(1,3),
(1,4),
(1,5),
(1,6),
(1,13),
(1,14),
(1,19),
(3,6),
(3,7),
(3,8),
(3,9),
(3,10),
(3,11),
(3,15),
(3,16),
(3,17),
(3,18),
(1,21),
(3,21),
(4,5),
(4,6),
(4,7),
(4,8),
(4,11),
(4,21),
(4,14),
(4,19),
(2,21),
(5,7),
(2,2);

/*!40000 ALTER TABLE `tb_role_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tb_role_permission
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_role_permission`;

CREATE TABLE `tb_role_permission` (
                                      `id` int(11) NOT NULL AUTO_INCREMENT,
                                      `role_id` int(11) NOT NULL,
                                      `permission_id` int(11) NOT NULL,
                                      PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `tb_role_permission` WRITE;
/*!40000 ALTER TABLE `tb_role_permission` DISABLE KEYS */;

INSERT INTO `tb_role_permission` (`id`, `role_id`, `permission_id`)
VALUES
(1,1,15),
(2,1,4),
(3,1,6),
(4,1,1),
(5,1,9),
(6,1,10),
(7,1,11),
(8,3,15),
(9,3,12),
(10,3,13),
(11,3,7),
(12,3,8),
(13,3,9),
(14,3,14),
(15,3,11),
(16,4,10),
(17,4,11),
(18,4,12),
(19,4,13),
(20,4,14),
(21,4,15),
(23,1,2),
(24,1,16),
(25,2,16),
(26,3,16),
(27,4,16),
(28,5,16),
(29,3,5),
(30,1,17),
(33,3,3),
(34,5,7),
(35,5,8),
(36,5,2),
(38,5,18),
(39,5,19),
(40,4,7),
(41,4,6),
(42,3,2),
(43,1,11),
(44,3,11),
(45,4,11),
(46,4,10),
(47,2,2),
(48,4,2),
(49,1,21),
(50,1,22),
(53,4,17),
(54,2,6),
(55,3,6),
(56,5,5),
(57,2,4),
(59,3,4),
(60,2,11),
(61,1,7);

/*!40000 ALTER TABLE `tb_role_permission` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tb_sku
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_sku`;

CREATE TABLE `tb_sku` (
                          `sku_id` int(11) NOT NULL AUTO_INCREMENT,
                          `project_id` int(11) DEFAULT NULL COMMENT '项目id',
                          `name` varchar(100) DEFAULT NULL COMMENT '名称',
                          `code` varchar(100) DEFAULT NULL COMMENT '编码',
                          `description` varchar(1000) DEFAULT NULL COMMENT '描述',
                          `main_img` varchar(256) DEFAULT NULL COMMENT '主图',
                          `other_imgs` text COMMENT '其他图片',
                          `website` text,
                          `video_url` varchar(256) DEFAULT NULL COMMENT '视频地址',
                          `ext` text COMMENT '扩展参数',
                          `draft` varchar(10) DEFAULT NULL COMMENT '是否是草稿,YES是 ,NO 不是',
                          `create_time` timestamp NULL DEFAULT NULL,
                          `update_time` timestamp NULL DEFAULT NULL,
                          `online_status` varchar(20) DEFAULT 'OPEN',
                          `public_time` date DEFAULT NULL,
                          `public_time_zone` varchar(20) DEFAULT NULL,
                          `public_status` varchar(20) DEFAULT NULL,
                          PRIMARY KEY (`sku_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table tb_track_op
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_track_op`;

CREATE TABLE `tb_track_op` (
                               `track_op_id` int(11) NOT NULL AUTO_INCREMENT,
                               `project_id` int(11) DEFAULT NULL COMMENT '项目id',
                               `name` varchar(32) DEFAULT NULL COMMENT '操作名称',
                               `op_type` varchar(32) DEFAULT NULL COMMENT '操作类型',
                               `display` varchar(10) DEFAULT NULL COMMENT '是否显示 YES 显示 ,NO 不显示',
                               `status` varchar(10) DEFAULT NULL COMMENT '状态 ENABLE 启用,DISABLE 禁用',
                               `create_time` timestamp NULL DEFAULT NULL,
                               `update_time` timestamp NULL DEFAULT NULL,
                               PRIMARY KEY (`track_op_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='追溯操作';



# Dump of table tb_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_user`;

CREATE TABLE `tb_user` (
                           `user_id` int(11) NOT NULL AUTO_INCREMENT,
                           `name` varchar(25) NOT NULL COMMENT '用户名',
                           `account` varchar(100) NOT NULL COMMENT '登陆账号',
                           `pwd` varchar(50) DEFAULT NULL COMMENT '登陆密码',
                           `salt` varchar(50) DEFAULT NULL,
                           `trade_pwd` varchar(70) DEFAULT NULL,
                           `trade_pwd_salt` varchar(70) DEFAULT NULL,
                           `org_id` int(11) DEFAULT NULL COMMENT '机构id,操作员独有',
                           `status` varchar(20) DEFAULT NULL COMMENT 'ENABLE:启用,DISABLE:禁用',
                           `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                           `update_time` timestamp NULL DEFAULT NULL,
                           PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户';


INSERT INTO `tb_user` (`user_id`, `name`, `account`, `pwd`, `salt`, `trade_pwd`, `trade_pwd_salt`, `org_id`, `status`,
                       `create_time`, `update_time`)
VALUES (1, 'admin', 'admin', 'efbe30eff9ae6adc56d56359a6c3453e', 'gsnblSmKMDfOqBCW',
        'efbe30eff9ae6adc56d56359a6c3453e', 'gsnblSmKMDfOqBCW', NULL, 'ENABLE',
        now(), now());


# Dump of table tb_user_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_user_role`;

CREATE TABLE `tb_user_role` (
                                `id` int(11) NOT NULL AUTO_INCREMENT,
                                `user_id` int(11) DEFAULT NULL,
                                `role_id` int(11) DEFAULT NULL,
                                PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tb_user_role` (`id`, `user_id`, `role_id`)
VALUES (1, 1, 1);


# Dump of table tb_vid_exports
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_vid_exports`;

CREATE TABLE `tb_vid_exports` (
                                  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
                                  `params` longtext,
                                  `type` varchar(45) DEFAULT NULL COMMENT 'type：GOODSVID-商品导出',
                                  `status` varchar(20) DEFAULT NULL,
                                  `file` varchar(300) DEFAULT NULL,
                                  `create_time` datetime DEFAULT NULL,
                                  `project_id` int(11) DEFAULT NULL,
                                  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table tb_vid_hash
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_vid_hash`;

CREATE TABLE `tb_vid_hash` (
                               `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
                               `vid` varchar(66) DEFAULT NULL,
                               `type` varchar(20) DEFAULT NULL,
                               `transaction_id` varchar(70) DEFAULT NULL,
                               `create_time` timestamp NULL DEFAULT NULL,
                               `request_no` varchar(60) DEFAULT NULL,
                               `project_id` int(11) DEFAULT NULL,
                               PRIMARY KEY (`id`),
                               UNIQUE KEY `vid_hash_type` (`vid`,`transaction_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table tb_vid_occupy
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_vid_occupy`;

CREATE TABLE `tb_vid_occupy` (
                                 `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
                                 `vid` varchar(66) DEFAULT NULL,
                                 `status` varchar(45) DEFAULT NULL,
                                 `vid_request_id` int(10) DEFAULT NULL,
                                 `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                                 PRIMARY KEY (`id`),
                                 UNIQUE KEY `vidIndex` (`vid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table tb_vid_occupy_request
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_vid_occupy_request`;

CREATE TABLE `tb_vid_occupy_request` (
                                         `id` int(11) NOT NULL AUTO_INCREMENT,
                                         `request_no` varchar(100) DEFAULT NULL,
                                         `project_id` int(10) DEFAULT NULL COMMENT '项目id',
                                         `type` varchar(45) DEFAULT NULL COMMENT 'VIDS：批量生成，VID：抢占注册',
                                         `app_id` varchar(100) DEFAULT NULL,
                                         `url` varchar(200) DEFAULT NULL,
                                         `vid_number` int(10) DEFAULT NULL COMMENT 'vid数量',
                                         `vid_status` varchar(45) DEFAULT NULL COMMENT 'INIT：新请求，BAAS：请求baas，ORDER：写入order，FINISH：完成',
                                         `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
                                         `create_time` timestamp NULL DEFAULT NULL,
                                         PRIMARY KEY (`id`),
                                         UNIQUE KEY `requestIndex` (`request_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目开发者生成vid';



# Dump of table tb_vid_request
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_vid_request`;

CREATE TABLE `tb_vid_request` (
                                  `requestNo` varchar(70) COLLATE utf8_bin NOT NULL DEFAULT '',
                                  `status` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '1' COMMENT '状态',
                                  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
                                  PRIMARY KEY (`requestNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='vid请求';




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


create schema if not exists `onekey-toolchain-vid-main` CHARACTER SET utf8 COLLATE utf8_general_ci;
use `onekey-toolchain-vid-main`;

# ************************************************************
# Sequel Pro SQL dump
# Version 5438
#
# https://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Generation Time: 2019-06-17 10:29:43 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table tb_baas_onchain_request
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_baas_onchain_request`;

CREATE TABLE `tb_baas_onchain_request` (
                                           `out_request_no` varchar(100) NOT NULL,
                                           `project_id` int(11) NOT NULL,
                                           `project_app_id` varchar(100) DEFAULT NULL,
                                           `baas_request_no` varchar(100) DEFAULT NULL,
                                           `param_body` longtext,
                                           `vid_count` int(11) DEFAULT NULL,
                                           `frozen_status` varchar(20) DEFAULT NULL,
                                           `status` varchar(20) DEFAULT NULL,
                                           `onchain_type` varchar(30) DEFAULT NULL,
                                           `result` longtext,
                                           `response_code` int(11) DEFAULT NULL,
                                           `response_msg` text,
                                           `create_time` timestamp NULL DEFAULT NULL,
                                           `update_time` timestamp NULL DEFAULT NULL,
                                           `retry_count` int(11) default 1,
                                           PRIMARY KEY (`out_request_no`,`project_id`),
                                           UNIQUE KEY `onchainIndex` (`out_request_no`,`project_id`,`onchain_type`),
                                           KEY `index_create_time` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table tb_bind_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_bind_history`;

CREATE TABLE `tb_bind_history` (
                                   `child_id` varchar(66) NOT NULL DEFAULT '' COMMENT '子VID',
                                   `parent_id` varchar(66) NOT NULL DEFAULT '' COMMENT '父VID',
                                   `parent_collection_level` int(11) DEFAULT NULL,
                                   `parent_collection_name` varchar(50) DEFAULT NULL,
                                   `operator_user_id` int(11) NOT NULL COMMENT '操作员',
                                   `op_type` varchar(10) NOT NULL DEFAULT '' COMMENT 'BIND绑定,UNBIND解绑',
                                   `update_time` timestamp NULL DEFAULT NULL,
                                   `create_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table tb_pre_baseinfo
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_pre_baseinfo`;

CREATE TABLE `tb_pre_baseinfo` (
                                   `project_id` int(11) NOT NULL,
                                   `request_no` varchar(100) NOT NULL,
                                   `sku_id` int(11) NOT NULL,
                                   `num` int(11) NOT NULL,
                                   `status` varchar(20) DEFAULT '',
                                   `create_time` timestamp NULL DEFAULT NULL,
                                   `update_time` timestamp NULL DEFAULT NULL,
                                   PRIMARY KEY (`request_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table tb_track_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_track_history`;

CREATE TABLE `tb_track_history` (
                                    `baas_request_no` varchar(50) DEFAULT NULL,
                                    `vid` varchar(100) NOT NULL,
                                    `project_id` int(11) DEFAULT NULL,
                                    `from_org_id` int(11) DEFAULT NULL,
                                    `from_org_name` varchar(50) DEFAULT NULL,
                                    `to_org_id` int(11) DEFAULT NULL,
                                    `to_org_name` varchar(50) DEFAULT NULL,
                                    `operator_user_id` int(11) DEFAULT NULL,
                                    `track_op_id` int(11) DEFAULT NULL,
                                    `track_op_name` varchar(50) DEFAULT NULL,
                                    `create_time` timestamp NULL DEFAULT NULL,
                                    `update_time` timestamp NULL DEFAULT NULL,
                                    `location` varchar(200) DEFAULT NULL,
                                    `country` varchar(50) DEFAULT NULL,
                                    `prov` varchar(50) DEFAULT NULL,
                                    `city` varchar(50) DEFAULT NULL,
                                    `longitude` varchar(50) DEFAULT NULL,
                                    `latitude` varchar(50) DEFAULT NULL,
                                    KEY `vid` (`vid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='追溯历史';



# Dump of table tb_vechain_id
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_vechain_id`;

CREATE TABLE `tb_vechain_id` (
                                 `vid` varchar(100) NOT NULL,
                                 `project_id` int(11) DEFAULT NULL,
                                 `baseinfo` varchar(10) DEFAULT NULL,
                                 `source` varchar(20) DEFAULT NULL,
                                 `source_id` varchar(50) DEFAULT NULL,
                                 `batch_no` varchar(50) DEFAULT NULL,
                                 `url` varchar(256) DEFAULT NULL,
                                 `update_time` timestamp NULL DEFAULT NULL,
                                 `create_time` timestamp NULL DEFAULT NULL,
                                 PRIMARY KEY (`vid`),
                                 UNIQUE KEY `tb_vechain_id_vid_uindex` (`vid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='vid';



# Dump of table tb_vechain_id_external
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_vechain_id_external`;

CREATE TABLE `tb_vechain_id_external` (
                                          `vid` varchar(100) NOT NULL,
                                          `project_id` int(11) DEFAULT NULL,
                                          `delivery_id` int(11) DEFAULT NULL,
                                          `parent_id` varchar(100) DEFAULT NULL,
                                          `id_type` varchar(20) DEFAULT NULL,
                                          `sku_id` int(11) DEFAULT NULL,
                                          `collection_id` int(11) DEFAULT NULL,
                                          `collection_level` int(11) DEFAULT NULL,
                                          `last_track_op_id` int(11) DEFAULT NULL,
                                          `last_track_from_org_id` int(11) DEFAULT NULL,
                                          `last_track_to_org_id` int(11) DEFAULT NULL,
                                          `last_track_name` varchar(50) DEFAULT NULL,
                                          `last_track_time` timestamp NULL DEFAULT NULL,
                                          `create_time` timestamp NULL DEFAULT NULL,
                                          `update_time` timestamp NULL DEFAULT NULL,
                                          PRIMARY KEY (`vid`),
                                          UNIQUE KEY `tb_vechain_id_external_vid_uindex` (`vid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='vid扩展表';



# Dump of table tb_vechain_vid_view
# ------------------------------------------------------------

DROP VIEW IF EXISTS `tb_vechain_vid_view`;

CREATE TABLE `tb_vechain_vid_view` (
                                       `vid` VARCHAR(100) NOT NULL,
                                       `project_id` INT(11) NULL DEFAULT NULL,
                                       `baseinfo` VARCHAR(10) NULL DEFAULT NULL,
                                       `source` VARCHAR(20) NULL DEFAULT NULL,
                                       `source_id` VARCHAR(50) NULL DEFAULT NULL,
                                       `batch_no` VARCHAR(50) NULL DEFAULT NULL,
                                       `url` VARCHAR(256) NULL DEFAULT NULL,
                                       `delivery_id` INT(11) NULL DEFAULT NULL,
                                       `parent_id` VARCHAR(100) NULL DEFAULT NULL,
                                       `id_type` VARCHAR(20) NULL DEFAULT NULL,
                                       `sku_id` INT(11) NULL DEFAULT NULL,
                                       `collection_id` INT(11) NULL DEFAULT NULL,
                                       `collection_level` INT(11) NULL DEFAULT NULL,
                                       `last_track_op_id` INT(11) NULL DEFAULT NULL,
                                       `last_track_from_org_id` INT(11) NULL DEFAULT NULL,
                                       `last_track_to_org_id` INT(11) NULL DEFAULT NULL,
                                       `last_track_name` VARCHAR(50) NULL DEFAULT NULL,
                                       `last_track_time` TIMESTAMP NULL DEFAULT NULL,
                                       `update_time` TIMESTAMP NULL DEFAULT NULL,
                                       `create_time` TIMESTAMP NULL DEFAULT NULL
) ENGINE=MyISAM;

alter table tb_vechain_id_external add index IDX_VECHAIN_ID_PARENT_ID  ( parent_id (100) );
alter table tb_vechain_id_external add index IDX_VECHAIN_CREATE_TIME  ( create_time );
alter table tb_vechain_id_external add index IDX_VECHAIN_UPDATE_TIME  ( update_time );

# Dump of table tb_vid_hash
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_vid_hash`;

CREATE TABLE `tb_vid_hash` (
                               `project_id` int(11) DEFAULT NULL,
                               `request_no` varchar(100) DEFAULT NULL,
                               `vid` varchar(100) NOT NULL,
                               `transaction_id` varchar(100) NOT NULL,
                               `type` varchar(20) NOT NULL,
                               `create_time` timestamp NULL DEFAULT NULL,
                               `update_time` timestamp NULL DEFAULT NULL,
                               PRIMARY KEY (`vid`,`transaction_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table tb_vid_request
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_vid_request`;

CREATE TABLE `tb_vid_request` (
                                  `requestNo` varchar(70) COLLATE utf8_bin NOT NULL DEFAULT '',
                                  `status` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '1' COMMENT '状态',
                                  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
                                  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
                                  PRIMARY KEY (`requestNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='vid请求';





# Replace placeholder table for tb_vechain_vid_view with correct view syntax
# ------------------------------------------------------------

DROP TABLE `tb_vechain_vid_view`;

CREATE VIEW `tb_vechain_vid_view`
AS SELECT
       `vi`.`vid` AS `vid`,
       `vi`.`project_id` AS `project_id`,
       `vi`.`baseinfo` AS `baseinfo`,
       `vi`.`source` AS `source`,
       `vi`.`source_id` AS `source_id`,
       `vi`.`batch_no` AS `batch_no`,
       `vi`.`url` AS `url`,
       `vie`.`delivery_id` AS `delivery_id`,
       `vie`.`parent_id` AS `parent_id`,
       `vie`.`id_type` AS `id_type`,
       `vie`.`sku_id` AS `sku_id`,
       `vie`.`collection_id` AS `collection_id`,
       `vie`.`collection_level` AS `collection_level`,
       `vie`.`last_track_op_id` AS `last_track_op_id`,
       `vie`.`last_track_from_org_id` AS `last_track_from_org_id`,
       `vie`.`last_track_to_org_id` AS `last_track_to_org_id`,
       `vie`.`last_track_name` AS `last_track_name`,
       `vie`.`last_track_time` AS `last_track_time`,
       `vie`.`update_time` AS `update_time`,
       `vie`.`create_time` AS `create_time`
   FROM (`tb_vechain_id_external` `vie` join `tb_vechain_id` `vi`) where (`vie`.`vid` = `vi`.`vid`);

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


create schema if not exists `onekey-toolchain-vid-test1` CHARACTER SET utf8 COLLATE utf8_general_ci;
use `onekey-toolchain-vid-test1`;

# ************************************************************
# Sequel Pro SQL dump
# Version 5438
#
# https://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Generation Time: 2019-06-17 10:29:43 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table tb_baas_onchain_request
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_baas_onchain_request`;

CREATE TABLE `tb_baas_onchain_request` (
                                           `out_request_no` varchar(100) NOT NULL,
                                           `project_id` int(11) NOT NULL,
                                           `project_app_id` varchar(100) DEFAULT NULL,
                                           `baas_request_no` varchar(100) DEFAULT NULL,
                                           `param_body` longtext,
                                           `vid_count` int(11) DEFAULT NULL,
                                           `frozen_status` varchar(20) DEFAULT NULL,
                                           `status` varchar(20) DEFAULT NULL,
                                           `onchain_type` varchar(30) DEFAULT NULL,
                                           `result` longtext,
                                           `response_code` int(11) DEFAULT NULL,
                                           `response_msg` text,
                                           `create_time` timestamp NULL DEFAULT NULL,
                                           `update_time` timestamp NULL DEFAULT NULL,
                                           `retry_count` int(11) default 1,
                                           PRIMARY KEY (`out_request_no`,`project_id`),
                                           UNIQUE KEY `onchainIndex` (`out_request_no`,`project_id`,`onchain_type`),
                                           KEY `index_create_time` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table tb_bind_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_bind_history`;

CREATE TABLE `tb_bind_history` (
                                   `child_id` varchar(66) NOT NULL DEFAULT '' COMMENT '子VID',
                                   `parent_id` varchar(66) NOT NULL DEFAULT '' COMMENT '父VID',
                                   `parent_collection_level` int(11) DEFAULT NULL,
                                   `parent_collection_name` varchar(50) DEFAULT NULL,
                                   `operator_user_id` int(11) NOT NULL COMMENT '操作员',
                                   `op_type` varchar(10) NOT NULL DEFAULT '' COMMENT 'BIND绑定,UNBIND解绑',
                                   `update_time` timestamp NULL DEFAULT NULL,
                                   `create_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table tb_pre_baseinfo
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_pre_baseinfo`;

CREATE TABLE `tb_pre_baseinfo` (
                                   `project_id` int(11) NOT NULL,
                                   `request_no` varchar(100) NOT NULL,
                                   `sku_id` int(11) NOT NULL,
                                   `num` int(11) NOT NULL,
                                   `status` varchar(20) DEFAULT '',
                                   `create_time` timestamp NULL DEFAULT NULL,
                                   `update_time` timestamp NULL DEFAULT NULL,
                                   PRIMARY KEY (`request_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table tb_track_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_track_history`;

CREATE TABLE `tb_track_history` (
                                    `baas_request_no` varchar(50) DEFAULT NULL,
                                    `vid` varchar(100) NOT NULL,
                                    `project_id` int(11) DEFAULT NULL,
                                    `from_org_id` int(11) DEFAULT NULL,
                                    `from_org_name` varchar(50) DEFAULT NULL,
                                    `to_org_id` int(11) DEFAULT NULL,
                                    `to_org_name` varchar(50) DEFAULT NULL,
                                    `operator_user_id` int(11) DEFAULT NULL,
                                    `track_op_id` int(11) DEFAULT NULL,
                                    `track_op_name` varchar(50) DEFAULT NULL,
                                    `create_time` timestamp NULL DEFAULT NULL,
                                    `update_time` timestamp NULL DEFAULT NULL,
                                    `location` varchar(200) DEFAULT NULL,
                                    `country` varchar(50) DEFAULT NULL,
                                    `prov` varchar(50) DEFAULT NULL,
                                    `city` varchar(50) DEFAULT NULL,
                                    `longitude` varchar(50) DEFAULT NULL,
                                    `latitude` varchar(50) DEFAULT NULL,
                                    KEY `vid` (`vid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='追溯历史';



# Dump of table tb_vechain_id
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_vechain_id`;

CREATE TABLE `tb_vechain_id` (
                                 `vid` varchar(100) NOT NULL,
                                 `project_id` int(11) DEFAULT NULL,
                                 `baseinfo` varchar(10) DEFAULT NULL,
                                 `source` varchar(20) DEFAULT NULL,
                                 `source_id` varchar(50) DEFAULT NULL,
                                 `batch_no` varchar(50) DEFAULT NULL,
                                 `url` varchar(256) DEFAULT NULL,
                                 `update_time` timestamp NULL DEFAULT NULL,
                                 `create_time` timestamp NULL DEFAULT NULL,
                                 PRIMARY KEY (`vid`),
                                 UNIQUE KEY `tb_vechain_id_vid_uindex` (`vid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='vid';



# Dump of table tb_vechain_id_external
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_vechain_id_external`;

CREATE TABLE `tb_vechain_id_external` (
                                          `vid` varchar(100) NOT NULL,
                                          `project_id` int(11) DEFAULT NULL,
                                          `delivery_id` int(11) DEFAULT NULL,
                                          `parent_id` varchar(100) DEFAULT NULL,
                                          `id_type` varchar(20) DEFAULT NULL,
                                          `sku_id` int(11) DEFAULT NULL,
                                          `collection_id` int(11) DEFAULT NULL,
                                          `collection_level` int(11) DEFAULT NULL,
                                          `last_track_op_id` int(11) DEFAULT NULL,
                                          `last_track_from_org_id` int(11) DEFAULT NULL,
                                          `last_track_to_org_id` int(11) DEFAULT NULL,
                                          `last_track_name` varchar(50) DEFAULT NULL,
                                          `last_track_time` timestamp NULL DEFAULT NULL,
                                          `create_time` timestamp NULL DEFAULT NULL,
                                          `update_time` timestamp NULL DEFAULT NULL,
                                          PRIMARY KEY (`vid`),
                                          UNIQUE KEY `tb_vechain_id_external_vid_uindex` (`vid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='vid扩展表';

alter table tb_vechain_id_external add index IDX_VECHAIN_ID_PARENT_ID  ( parent_id (100) );
alter table tb_vechain_id_external add index IDX_VECHAIN_CREATE_TIME  ( create_time );
alter table tb_vechain_id_external add index IDX_VECHAIN_UPDATE_TIME  ( update_time );

# Dump of table tb_vechain_vid_view
# ------------------------------------------------------------

DROP VIEW IF EXISTS `tb_vechain_vid_view`;

CREATE TABLE `tb_vechain_vid_view` (
                                       `vid` VARCHAR(100) NOT NULL,
                                       `project_id` INT(11) NULL DEFAULT NULL,
                                       `baseinfo` VARCHAR(10) NULL DEFAULT NULL,
                                       `source` VARCHAR(20) NULL DEFAULT NULL,
                                       `source_id` VARCHAR(50) NULL DEFAULT NULL,
                                       `batch_no` VARCHAR(50) NULL DEFAULT NULL,
                                       `url` VARCHAR(256) NULL DEFAULT NULL,
                                       `delivery_id` INT(11) NULL DEFAULT NULL,
                                       `parent_id` VARCHAR(100) NULL DEFAULT NULL,
                                       `id_type` VARCHAR(20) NULL DEFAULT NULL,
                                       `sku_id` INT(11) NULL DEFAULT NULL,
                                       `collection_id` INT(11) NULL DEFAULT NULL,
                                       `collection_level` INT(11) NULL DEFAULT NULL,
                                       `last_track_op_id` INT(11) NULL DEFAULT NULL,
                                       `last_track_from_org_id` INT(11) NULL DEFAULT NULL,
                                       `last_track_to_org_id` INT(11) NULL DEFAULT NULL,
                                       `last_track_name` VARCHAR(50) NULL DEFAULT NULL,
                                       `last_track_time` TIMESTAMP NULL DEFAULT NULL,
                                       `update_time` TIMESTAMP NULL DEFAULT NULL,
                                       `create_time` TIMESTAMP NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table tb_vid_hash
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_vid_hash`;

CREATE TABLE `tb_vid_hash` (
                               `project_id` int(11) DEFAULT NULL,
                               `request_no` varchar(100) DEFAULT NULL,
                               `vid` varchar(100) NOT NULL,
                               `transaction_id` varchar(100) NOT NULL,
                               `type` varchar(20) NOT NULL,
                               `create_time` timestamp NULL DEFAULT NULL,
                               `update_time` timestamp NULL DEFAULT NULL,
                               PRIMARY KEY (`vid`,`transaction_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table tb_vid_request
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_vid_request`;

CREATE TABLE `tb_vid_request` (
                                  `requestNo` varchar(70) COLLATE utf8_bin NOT NULL DEFAULT '',
                                  `status` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '1' COMMENT '状态',
                                  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
                                  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
                                  PRIMARY KEY (`requestNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='vid请求';





# Replace placeholder table for tb_vechain_vid_view with correct view syntax
# ------------------------------------------------------------

DROP TABLE `tb_vechain_vid_view`;

CREATE VIEW `tb_vechain_vid_view`
AS SELECT
       `vi`.`vid` AS `vid`,
       `vi`.`project_id` AS `project_id`,
       `vi`.`baseinfo` AS `baseinfo`,
       `vi`.`source` AS `source`,
       `vi`.`source_id` AS `source_id`,
       `vi`.`batch_no` AS `batch_no`,
       `vi`.`url` AS `url`,
       `vie`.`delivery_id` AS `delivery_id`,
       `vie`.`parent_id` AS `parent_id`,
       `vie`.`id_type` AS `id_type`,
       `vie`.`sku_id` AS `sku_id`,
       `vie`.`collection_id` AS `collection_id`,
       `vie`.`collection_level` AS `collection_level`,
       `vie`.`last_track_op_id` AS `last_track_op_id`,
       `vie`.`last_track_from_org_id` AS `last_track_from_org_id`,
       `vie`.`last_track_to_org_id` AS `last_track_to_org_id`,
       `vie`.`last_track_name` AS `last_track_name`,
       `vie`.`last_track_time` AS `last_track_time`,
       `vie`.`update_time` AS `update_time`,
       `vie`.`create_time` AS `create_time`
   FROM (`tb_vechain_id_external` `vie` join `tb_vechain_id` `vi`) where (`vie`.`vid` = `vi`.`vid`);

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


create schema if not exists `onekey-balance-main` CHARACTER SET utf8 COLLATE utf8_general_ci;
use `onekey-balance-main`;

-- Create syntax for TABLE 'tb_address_balance_alert'
CREATE TABLE if not exists `tb_address_balance_alert`
(
    `id`                   int(11)       NOT NULL AUTO_INCREMENT,
    `address`              varchar(128)  NOT NULL DEFAULT '',
    `token`                varchar(128)  NOT NULL DEFAULT '',
    `threshold`            bigint(20)    NOT NULL DEFAULT '0',
    `email`                varchar(1000) NOT NULL DEFAULT '',
    `sms`                  varchar(1000) NOT NULL DEFAULT '',
    `lastNotificationTime` bigint(20)    NOT NULL,
    `notifyTimes`          bigint(20)    NOT NULL DEFAULT '0',
    `createdAt`            datetime      NOT NULL,
    `updatedAt`            datetime      NOT NULL,
    `title`                varchar(512)           DEFAULT NULL,
    `message`              varchar(2048)          DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 31
  DEFAULT CHARSET = utf8;

-- Create syntax for TABLE 'tb_address_balance_monitor'
CREATE TABLE if not exists `tb_address_balance_monitor`
(
    `id`          int(11)      NOT NULL AUTO_INCREMENT,
    `address`     varchar(128) NOT NULL DEFAULT '',
    `token`       varchar(128) NOT NULL DEFAULT '',
    `callbackUrl` varchar(128) NOT NULL DEFAULT '',
    `createdAt`   datetime     NOT NULL,
    `updatedAt`   datetime     NOT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 27
  DEFAULT CHARSET = utf8;

CREATE TABLE `tb_check_point` (
                                  `id` int(11) NOT NULL AUTO_INCREMENT,
                                  `taskName` varchar(128) NOT NULL DEFAULT '',
                                  `blockNumber` bigint(20) NOT NULL DEFAULT '0',
                                  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


create schema if not exists `onekey-balance-test1` CHARACTER SET utf8 COLLATE utf8_general_ci;
use `onekey-balance-test1`;

CREATE TABLE if not exists `tb_address_balance_alert`
(
    `id`                   int(11)       NOT NULL AUTO_INCREMENT,
    `address`              varchar(128)  NOT NULL DEFAULT '',
    `token`                varchar(128)  NOT NULL DEFAULT '',
    `threshold`            bigint(20)    NOT NULL DEFAULT '0',
    `email`                varchar(1000) NOT NULL DEFAULT '',
    `sms`                  varchar(1000) NOT NULL DEFAULT '',
    `lastNotificationTime` bigint(20)    NOT NULL,
    `notifyTimes`          bigint(20)    NOT NULL DEFAULT '0',
    `createdAt`            datetime      NOT NULL,
    `updatedAt`            datetime      NOT NULL,
    `title`                varchar(512)           DEFAULT NULL,
    `message`              varchar(2048)          DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 31
  DEFAULT CHARSET = utf8;

CREATE TABLE if not exists `tb_address_balance_monitor`
(
    `id`          int(11)      NOT NULL AUTO_INCREMENT,
    `address`     varchar(128) NOT NULL DEFAULT '',
    `token`       varchar(128) NOT NULL DEFAULT '',
    `callbackUrl` varchar(128) NOT NULL DEFAULT '',
    `createdAt`   datetime     NOT NULL,
    `updatedAt`   datetime     NOT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 27
  DEFAULT CHARSET = utf8;

CREATE TABLE `tb_check_point` (
                                  `id` int(11) NOT NULL AUTO_INCREMENT,
                                  `taskName` varchar(128) NOT NULL DEFAULT '',
                                  `blockNumber` bigint(20) NOT NULL DEFAULT '0',
                                  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


use `onekey-toolchain`;

update tb_sku set public_status = 'PUBLIC';

ALTER TABLE tb_project_developer ADD COLUMN ip_list VARCHAR(1000) NULL DEFAULT '0.0.0.0';

alter table tb_org add column request_no varchar(50);
alter table tb_project_deposit add column request_no varchar(50);
alter table tb_project add column request_no varchar(50);



use `onekey-toolchain`;

alter table tb_apply_info add column ip varchar(20) default '' not null ;
alter table tb_apply_info add column location varchar(128) default '' not null ;

use `onekey-toolchain-vid-test1`;

CREATE TABLE `tb_vechain_id_test` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `vid` varchar(100) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `baseinfo` varchar(10) DEFAULT NULL,
  `source` varchar(20) DEFAULT NULL,
  `source_id` varchar(50) DEFAULT NULL,
  `batch_no` varchar(50) DEFAULT NULL,
  `url` varchar(256) DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tb_vechain_id_vid_uindex` (`vid`),
  KEY `project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='vid';


DROP TRIGGER IF EXISTS `tb_vechain_id_AFTER_DELETE`;
DELIMITER $$
CREATE DEFINER = CURRENT_USER TRIGGER `tb_vechain_id_AFTER_DELETE` AFTER DELETE ON `tb_vechain_id` FOR EACH ROW
DELETE IGNORE FROM `tb_vechain_id_test` WHERE
        `tb_vechain_id_test`.`vid` <=> OLD.`vid`$$
DELIMITER ;


DROP TRIGGER IF EXISTS `tb_vechain_id_AFTER_INSERT`;
DELIMITER $$
CREATE 
    DEFINER = CURRENT_USER 
    TRIGGER   `tb_vechain_id_AFTER_INSERT`
 AFTER INSERT ON `tb_vechain_id` FOR EACH ROW 
    REPLACE INTO `tb_vechain_id_test` (`vid` , `project_id` , `baseinfo` , `source` , `source_id` , `batch_no` ,`url`,`update_time`, `create_time`) VALUES (NEW.`vid` , NEW.`project_id` , NEW.`baseinfo` , NEW.`source` , NEW.`source_id` , NEW.`batch_no` ,NEW.`url`,NEW.`update_time`, NEW.`create_time`)$$
DELIMITER ;


DROP TRIGGER IF EXISTS `tb_vechain_id_AFTER_UPDATE`;
DELIMITER $$
CREATE DEFINER = CURRENT_USER TRIGGER `tb_vechain_id_AFTER_UPDATE` AFTER UPDATE ON `tb_vechain_id` FOR EACH ROW
BEGIN
DELETE IGNORE FROM `tb_vechain_id_test` WHERE !(OLD.`vid` <=> NEW.`vid`) AND `tb_vechain_id_test`.`vid` <=> OLD.`vid`;
REPLACE INTO `tb_vechain_id_test` (`vid`, `project_id`,`baseinfo`,`source`,`source_id`,`batch_no`,`url`,`update_time`,`create_time`) VALUES (NEW.`vid`, NEW.`project_id`,NEW.`baseinfo`,NEW.`source`,NEW.`source_id`,NEW.`batch_no`,NEW.`url`,NEW.`update_time`,NEW.`create_time`);
END$$
DELIMITER ;

INSERT INTO tb_vechain_id_test (vid, project_id, baseinfo, source, source_id
    , batch_no,url,update_time, create_time)
SELECT vid, project_id, baseinfo, source, source_id
    , batch_no,url,update_time, create_time
FROM tb_vechain_id where create_time < now();



SET AUTOCOMMIT=0;
begin;
ALTER TABLE `tb_vechain_id` RENAME TO  `tb_vechain_id_old`;
ALTER TABLE `tb_vechain_id_test` RENAME TO  `tb_vechain_id`;
commit;
SET AUTOCOMMIT=1;



use `onekey-toolchain-vid-main`;
CREATE TABLE `tb_vechain_id_test` (
    `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `vid` varchar(100) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `baseinfo` varchar(10) DEFAULT NULL,
  `source` varchar(20) DEFAULT NULL,
  `source_id` varchar(50) DEFAULT NULL,
  `batch_no` varchar(50) DEFAULT NULL,
  `url` varchar(256) DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tb_vechain_id_vid_uindex` (`vid`),
  KEY `project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='vid';


DROP TRIGGER IF EXISTS `tb_vechain_id_AFTER_DELETE`;
DELIMITER $$
CREATE DEFINER = CURRENT_USER TRIGGER `tb_vechain_id_AFTER_DELETE` AFTER DELETE ON `tb_vechain_id` FOR EACH ROW
DELETE IGNORE FROM `tb_vechain_id_test` WHERE
        `tb_vechain_id_test`.`vid` <=> OLD.`vid`$$
DELIMITER ;


DROP TRIGGER IF EXISTS `tb_vechain_id_AFTER_INSERT`;
DELIMITER $$
CREATE 
    DEFINER = CURRENT_USER 
    TRIGGER   `tb_vechain_id_AFTER_INSERT`
 AFTER INSERT ON `tb_vechain_id` FOR EACH ROW 
    REPLACE INTO `tb_vechain_id_test` (`vid` , `project_id` , `baseinfo` , `source` , `source_id` , `batch_no` ,`url`,`update_time`, `create_time`) VALUES (NEW.`vid` , NEW.`project_id` , NEW.`baseinfo` , NEW.`source` , NEW.`source_id` , NEW.`batch_no` ,NEW.`url`,NEW.`update_time`, NEW.`create_time`)$$
DELIMITER ;


DROP TRIGGER IF EXISTS `tb_vechain_id_AFTER_UPDATE`;
DELIMITER $$
CREATE DEFINER = CURRENT_USER TRIGGER `tb_vechain_id_AFTER_UPDATE` AFTER UPDATE ON `tb_vechain_id` FOR EACH ROW
BEGIN
DELETE IGNORE FROM `tb_vechain_id_test` WHERE !(OLD.`vid` <=> NEW.`vid`) AND `tb_vechain_id_test`.`vid` <=> OLD.`vid`;
REPLACE INTO `tb_vechain_id_test` (`vid`, `project_id`,`baseinfo`,`source`,`source_id`,`batch_no`,`url`,`update_time`,`create_time`) VALUES (NEW.`vid`, NEW.`project_id`,NEW.`baseinfo`,NEW.`source`,NEW.`source_id`,NEW.`batch_no`,NEW.`url`,NEW.`update_time`,NEW.`create_time`);
END$$
DELIMITER ;

INSERT INTO tb_vechain_id_test (vid, project_id, baseinfo, source, source_id
    , batch_no,url,update_time, create_time)
SELECT vid, project_id, baseinfo, source, source_id
    , batch_no,url,update_time, create_time
FROM tb_vechain_id where create_time < now();


SET AUTOCOMMIT=0;
begin;
ALTER TABLE `tb_vechain_id` RENAME TO  `tb_vechain_id_old`;
ALTER TABLE `tb_vechain_id_test` RENAME TO  `tb_vechain_id`;
commit;
SET AUTOCOMMIT=1;

use `onekey-toolchain`;
alter table tb_sku
    add column vid_count int;
alter table tb_sku
    add column video_sha1 varchar(100);
alter table tb_sku
    add column approve_status varchar(20);

CREATE TABLE `tb_resource_approve`
(
    `id`          int(11)   NOT NULL AUTO_INCREMENT,
    `project_id`  int(11)        DEFAULT NULL,
    `module`      varchar(30)    DEFAULT NULL,
    `type`        varchar(30)    DEFAULT NULL,
    `status`      varchar(30)    DEFAULT NULL,
    `request_no`  varchar(50)    DEFAULT NULL,
    `file_sha1`   varchar(100)   DEFAULT NULL,
    `file_path`   varchar(128)   DEFAULT NULL,
    `oss_path`   varchar(128)   DEFAULT NULL,
    `create_time` timestamp NULL DEFAULT NULL,
    `update_time` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

update tb_sku set approve_status = 'SUCCESS';

use `onekey-toolchain-vid-test1`;

ALTER TABLE tb_vechain_id_external ADD COLUMN `baseinfo` VARCHAR(10) NULL;
ALTER TABLE tb_pre_baseinfo ADD COLUMN `type` VARCHAR(20) NULL;
UPDATE tb_pre_baseinfo SET `type` = 'BASEINFO-PRE';
ALTER TABLE tb_pre_baseinfo CHANGE COLUMN `sku_id` `sku_id` INT(11) NULL ;



CREATE 
     OR REPLACE ALGORITHM = UNDEFINED 
    DEFINER = CURRENT_USER 
    SQL SECURITY DEFINER
VIEW `tb_vechain_vid_view` AS
    SELECT 
        `vi`.`id` AS `id`,
        `vi`.`url` AS `url`,
        `vi`.`vid` AS `vid`,
        `vi`.`project_id` AS `project_id`,
        `vi`.`baseinfo` AS `baseinfo`,
        `vi`.`source` AS `source`,
        `vi`.`source_id` AS `source_id`,
        `vi`.`batch_no` AS `batch_no`,
        `vie`.`delivery_id` AS `delivery_id`,
        `vie`.`parent_id` AS `parent_id`,
        `vie`.`id_type` AS `id_type`,
        `vie`.`sku_id` AS `sku_id`,
        `vie`.`collection_id` AS `collection_id`,
        `vie`.`collection_level` AS `collection_level`,
        `vie`.`last_track_op_id` AS `last_track_op_id`,
        `vie`.`last_track_from_org_id` AS `last_track_from_org_id`,
        `vie`.`last_track_to_org_id` AS `last_track_to_org_id`,
        `vie`.`last_track_name` AS `last_track_name`,
        `vie`.`last_track_time` AS `last_track_time`,
        `vie`.`update_time` as `update_time`,
        `vie`.`create_time` AS `create_time`
    FROM
        (`tb_vechain_id_external` `vie`
        JOIN `tb_vechain_id` `vi`)
    WHERE
        (`vie`.`vid` = `vi`.`vid`);
        



use `onekey-toolchain-vid-main`;

ALTER TABLE tb_vechain_id_external ADD COLUMN `baseinfo` VARCHAR(10) NULL;
ALTER TABLE tb_pre_baseinfo ADD COLUMN `type` VARCHAR(20) NULL;
UPDATE tb_pre_baseinfo SET `type` = 'BASEINFO-PRE';
ALTER TABLE tb_pre_baseinfo CHANGE COLUMN `sku_id` `sku_id` INT(11) NULL ;



CREATE 
     OR REPLACE ALGORITHM = UNDEFINED 
    DEFINER = CURRENT_USER 
    SQL SECURITY DEFINER
VIEW `tb_vechain_vid_view` AS
    SELECT 
        `vi`.`id` AS `id`,
        `vi`.`url` AS `url`,
        `vi`.`vid` AS `vid`,
        `vi`.`project_id` AS `project_id`,
        `vi`.`baseinfo` AS `baseinfo`,
        `vi`.`source` AS `source`,
        `vi`.`source_id` AS `source_id`,
        `vi`.`batch_no` AS `batch_no`,
        `vie`.`delivery_id` AS `delivery_id`,
        `vie`.`parent_id` AS `parent_id`,
        `vie`.`id_type` AS `id_type`,
        `vie`.`sku_id` AS `sku_id`,
        `vie`.`collection_id` AS `collection_id`,
        `vie`.`collection_level` AS `collection_level`,
        `vie`.`last_track_op_id` AS `last_track_op_id`,
        `vie`.`last_track_from_org_id` AS `last_track_from_org_id`,
        `vie`.`last_track_to_org_id` AS `last_track_to_org_id`,
        `vie`.`last_track_name` AS `last_track_name`,
        `vie`.`last_track_time` AS `last_track_time`,
        `vie`.`update_time` as `update_time`,
        `vie`.`create_time` AS `create_time`
    FROM
        (`tb_vechain_id_external` `vie`
        JOIN `tb_vechain_id` `vi`)
    WHERE
        (`vie`.`vid` = `vi`.`vid`);