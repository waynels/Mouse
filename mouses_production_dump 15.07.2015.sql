# CocoaMySQL dump
# Version 0.7b5
# http://cocoamysql.sourceforge.net
#
# Host: localhost (MySQL 5.6.15)
# Database: mouses_production
# Generation Time: 2015-07-15 03:25:10 +0000
# ************************************************************

# Dump of table alleles
# ------------------------------------------------------------

CREATE TABLE `alleles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gene_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `alleles` (`id`,`gene_id`,`name`,`created_at`,`updated_at`) VALUES ('1','1','adfasd','2015-06-05 03:33:12','2015-06-05 03:33:12');
INSERT INTO `alleles` (`id`,`gene_id`,`name`,`created_at`,`updated_at`) VALUES ('2','1','afdfasdf','2015-06-05 03:33:12','2015-06-05 03:33:12');
INSERT INTO `alleles` (`id`,`gene_id`,`name`,`created_at`,`updated_at`) VALUES ('3','1','asdfads','2015-06-05 03:33:12','2015-06-05 03:33:12');
INSERT INTO `alleles` (`id`,`gene_id`,`name`,`created_at`,`updated_at`) VALUES ('4','1','sdfasdf','2015-06-05 03:33:12','2015-06-05 03:33:12');
INSERT INTO `alleles` (`id`,`gene_id`,`name`,`created_at`,`updated_at`) VALUES ('5','2','sdghj','2015-06-05 03:33:36','2015-06-05 03:33:36');
INSERT INTO `alleles` (`id`,`gene_id`,`name`,`created_at`,`updated_at`) VALUES ('6','2','43qe','2015-06-05 03:33:36','2015-06-05 03:33:36');
INSERT INTO `alleles` (`id`,`gene_id`,`name`,`created_at`,`updated_at`) VALUES ('7','2','gear3','2015-06-05 03:33:36','2015-06-05 03:33:36');
INSERT INTO `alleles` (`id`,`gene_id`,`name`,`created_at`,`updated_at`) VALUES ('8','3','?','2015-06-08 03:56:32','2015-06-08 03:56:32');
INSERT INTO `alleles` (`id`,`gene_id`,`name`,`created_at`,`updated_at`) VALUES ('9','3','?','2015-06-08 03:56:32','2015-06-08 03:56:32');
INSERT INTO `alleles` (`id`,`gene_id`,`name`,`created_at`,`updated_at`) VALUES ('10','3','?','2015-06-08 03:56:32','2015-06-08 03:56:32');
INSERT INTO `alleles` (`id`,`gene_id`,`name`,`created_at`,`updated_at`) VALUES ('11','3','?','2015-06-08 03:56:32','2015-06-08 03:56:32');
INSERT INTO `alleles` (`id`,`gene_id`,`name`,`created_at`,`updated_at`) VALUES ('12','3','?','2015-06-08 03:56:32','2015-06-08 03:56:32');
INSERT INTO `alleles` (`id`,`gene_id`,`name`,`created_at`,`updated_at`) VALUES ('13','3','?','2015-06-08 03:56:32','2015-06-08 03:56:32');
INSERT INTO `alleles` (`id`,`gene_id`,`name`,`created_at`,`updated_at`) VALUES ('14','3','?','2015-06-08 03:56:32','2015-06-08 03:56:32');


# Dump of table baskets
# ------------------------------------------------------------

CREATE TABLE `baskets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `framework_id` int(11) DEFAULT NULL,
  `onwer_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `cage_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'S',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=426 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('1','1A','1','3','2015-06-04 07:56:35','2015-07-07 07:56:46','NCE');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('2','1B','1','3','2015-06-04 07:56:35','2015-07-07 07:59:54','CE');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('3','1C','1','3','2015-06-04 07:56:35','2015-07-07 07:58:49','CE');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('4','1D','1','3','2015-06-04 07:56:35','2015-07-07 07:59:28','NCE');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('5','1E','1',NULL,'2015-06-04 07:56:35','2015-06-04 07:56:35','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('6','1F','1',NULL,'2015-06-04 07:56:35','2015-06-25 03:58:37','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('7','1G','1',NULL,'2015-06-04 07:56:35','2015-07-02 07:23:42','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('8','1H','1',NULL,'2015-06-04 07:56:35','2015-07-02 07:47:26','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('9','1I','1','2','2015-06-04 07:56:35','2015-07-07 07:51:21','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('10','1J','1',NULL,'2015-06-04 07:56:35','2015-06-04 07:56:35','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('11','2A','1','3','2015-06-04 07:56:35','2015-07-07 08:14:09','M');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('12','2B','1','3','2015-06-04 07:56:35','2015-07-07 08:12:41','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('13','2C','1','3','2015-06-04 07:56:35','2015-07-07 08:12:46','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('14','2D','1','3','2015-06-04 07:56:35','2015-07-07 08:12:52','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('15','2E','1','2','2015-06-04 07:56:35','2015-06-26 06:28:02','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('16','2F','1','1','2015-06-04 07:56:35','2015-06-17 07:00:07','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('17','2G','1',NULL,'2015-06-04 07:56:35','2015-06-04 07:56:35','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('18','2H','1',NULL,'2015-06-04 07:56:35','2015-06-04 07:56:35','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('19','2I','1',NULL,'2015-06-04 07:56:35','2015-06-04 07:56:35','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('20','2J','1',NULL,'2015-06-04 07:56:35','2015-06-04 07:56:35','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('21','3A','1','2','2015-06-04 07:56:35','2015-07-10 05:18:18','M');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('22','3B','1',NULL,'2015-06-04 07:56:35','2015-06-04 07:56:35','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('23','3C','1',NULL,'2015-06-04 07:56:35','2015-06-04 07:56:35','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('24','3D','1','1','2015-06-04 07:56:35','2015-06-12 03:12:56','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('25','3E','1',NULL,'2015-06-04 07:56:35','2015-06-04 07:56:35','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('26','3F','1','2','2015-06-04 07:56:35','2015-06-26 06:32:45','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('27','3G','1',NULL,'2015-06-04 07:56:35','2015-06-04 07:56:35','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('28','3H','1',NULL,'2015-06-04 07:56:35','2015-06-04 07:56:35','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('29','3I','1',NULL,'2015-06-04 07:56:35','2015-06-04 07:56:35','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('30','3J','1',NULL,'2015-06-04 07:56:35','2015-06-04 07:56:35','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('31','4A','1',NULL,'2015-06-04 07:56:35','2015-06-04 07:56:35','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('32','4B','1','2','2015-06-04 07:56:35','2015-06-17 03:47:01','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('33','4C','1','2','2015-06-04 07:56:35','2015-07-09 09:53:03','M');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('34','4D','1',NULL,'2015-06-04 07:56:35','2015-06-12 03:13:48','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('35','4E','1','2','2015-06-04 07:56:35','2015-06-26 06:27:46','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('36','4F','1',NULL,'2015-06-04 07:56:35','2015-06-29 06:35:09','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('37','4G','1',NULL,'2015-06-04 07:56:35','2015-06-04 07:56:35','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('38','4H','1',NULL,'2015-06-04 07:56:35','2015-06-04 07:56:35','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('39','4I','1',NULL,'2015-06-04 07:56:35','2015-06-04 07:56:35','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('40','4J','1',NULL,'2015-06-04 07:56:35','2015-06-04 07:56:35','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('41','5A','1','4','2015-06-04 07:56:35','2015-07-13 07:49:28','M');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('42','5B','1',NULL,'2015-06-04 07:56:35','2015-06-04 07:56:35','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('43','5C','1','1','2015-06-04 07:56:35','2015-06-12 05:36:25','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('44','5D','1',NULL,'2015-06-04 07:56:35','2015-06-04 07:56:35','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('45','5E','1','2','2015-06-04 07:56:35','2015-06-17 03:47:16','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('46','5F','1','1','2015-06-04 07:56:35','2015-06-11 08:04:46','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('47','5G','1',NULL,'2015-06-04 07:56:35','2015-06-04 07:56:35','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('48','5H','1',NULL,'2015-06-04 07:56:35','2015-06-04 07:56:35','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('49','5I','1',NULL,'2015-06-04 07:56:35','2015-06-04 07:56:35','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('50','5J','1',NULL,'2015-06-04 07:56:35','2015-06-04 07:56:35','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('51','6A','1',NULL,'2015-06-04 07:56:35','2015-06-04 07:56:35','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('52','6B','1',NULL,'2015-06-04 07:56:35','2015-06-04 07:56:35','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('53','6C','1',NULL,'2015-06-04 07:56:35','2015-06-04 07:56:35','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('54','6D','1',NULL,'2015-06-04 07:56:35','2015-06-04 07:56:35','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('55','6E','1',NULL,'2015-06-04 07:56:35','2015-06-15 01:43:57','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('56','6F','1',NULL,'2015-06-04 07:56:35','2015-06-04 07:56:35','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('57','6G','1',NULL,'2015-06-04 07:56:35','2015-06-04 07:56:35','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('58','6H','1',NULL,'2015-06-04 07:56:35','2015-06-04 07:56:35','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('59','6I','1',NULL,'2015-06-04 07:56:35','2015-06-04 07:56:35','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('60','6J','1',NULL,'2015-06-04 07:56:35','2015-06-04 07:56:35','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('61','7A','1','2','2015-06-04 07:56:35','2015-06-26 06:33:31','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('62','7B','1','2','2015-06-04 07:56:35','2015-06-17 03:47:10','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('63','7C','1',NULL,'2015-06-04 07:56:35','2015-06-04 07:56:35','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('64','7D','1',NULL,'2015-06-04 07:56:35','2015-06-04 07:56:35','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('65','7E','1',NULL,'2015-06-04 07:56:35','2015-06-04 07:56:35','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('66','7F','1','1','2015-06-04 07:56:35','2015-06-08 03:51:21','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('67','7G','1',NULL,'2015-06-04 07:56:35','2015-06-04 07:56:35','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('68','7H','1',NULL,'2015-06-04 07:56:35','2015-06-04 07:56:35','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('69','7I','1',NULL,'2015-06-04 07:56:35','2015-06-04 07:56:35','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('70','7J','1',NULL,'2015-06-04 07:56:35','2015-06-04 07:56:35','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('71','8A','1',NULL,'2015-06-04 07:56:35','2015-06-04 07:56:35','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('72','8B','1',NULL,'2015-06-04 07:56:35','2015-06-04 07:56:35','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('73','8C','1','2','2015-06-04 07:56:35','2015-06-12 05:36:39','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('74','8D','1','1','2015-06-04 07:56:35','2015-06-09 06:32:14','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('75','8E','1','1','2015-06-04 07:56:35','2015-06-09 06:32:16','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('76','8F','1','2','2015-06-04 07:56:35','2015-07-07 07:46:30','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('77','8G','1',NULL,'2015-06-04 07:56:35','2015-06-04 07:56:35','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('78','8H','1',NULL,'2015-06-04 07:56:35','2015-06-04 07:56:35','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('79','8I','1',NULL,'2015-06-04 07:56:35','2015-06-04 07:56:35','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('80','8J','1',NULL,'2015-06-04 07:56:36','2015-06-04 07:56:36','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('81','9A','1','2','2015-06-04 07:56:36','2015-06-26 06:33:23','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('82','9B','1',NULL,'2015-06-04 07:56:36','2015-06-12 03:16:19','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('83','9C','1','4','2015-06-04 07:56:36','2015-07-13 07:48:31','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('84','9D','1',NULL,'2015-06-04 07:56:36','2015-06-04 07:56:36','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('85','9E','1',NULL,'2015-06-04 07:56:36','2015-06-04 07:56:36','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('86','9F','1',NULL,'2015-06-04 07:56:36','2015-06-04 07:56:36','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('87','9G','1',NULL,'2015-06-04 07:56:36','2015-06-04 07:56:36','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('88','9H','1',NULL,'2015-06-04 07:56:36','2015-06-04 07:56:36','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('89','9I','1',NULL,'2015-06-04 07:56:36','2015-06-04 07:56:36','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('90','9J','1',NULL,'2015-06-04 07:56:36','2015-06-04 07:56:36','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('91','10A','1',NULL,'2015-06-04 07:56:36','2015-06-04 07:56:36','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('92','10B','1',NULL,'2015-06-04 07:56:36','2015-06-04 07:56:36','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('93','10C','1',NULL,'2015-06-04 07:56:36','2015-06-04 07:56:36','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('94','10D','1',NULL,'2015-06-04 07:56:36','2015-06-12 03:16:25','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('95','10E','1',NULL,'2015-06-04 07:56:36','2015-06-04 07:56:36','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('96','10F','1','2','2015-06-04 07:56:36','2015-07-06 07:47:35','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('97','10G','1',NULL,'2015-06-04 07:56:36','2015-06-04 07:56:36','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('98','10H','1',NULL,'2015-06-04 07:56:36','2015-06-04 07:56:36','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('99','10I','1',NULL,'2015-06-04 07:56:36','2015-06-04 07:56:36','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('100','10J','1',NULL,'2015-06-04 07:56:36','2015-06-04 07:56:36','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('101','1A','2','1','2015-06-04 07:58:22','2015-06-09 09:35:09','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('102','1B','2','2','2015-06-04 07:58:22','2015-06-11 08:05:47','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('103','1C','2',NULL,'2015-06-04 07:58:22','2015-06-04 07:58:22','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('104','1D','2',NULL,'2015-06-04 07:58:22','2015-06-04 07:58:22','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('105','1E','2',NULL,'2015-06-04 07:58:22','2015-06-04 07:58:22','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('106','1F','2',NULL,'2015-06-04 07:58:22','2015-06-04 07:58:22','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('107','1G','2',NULL,'2015-06-04 07:58:22','2015-06-04 07:58:22','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('108','1H','2',NULL,'2015-06-04 07:58:22','2015-06-04 07:58:22','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('109','1I','2',NULL,'2015-06-04 07:58:22','2015-06-04 07:58:22','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('110','1J','2',NULL,'2015-06-04 07:58:22','2015-06-04 07:58:22','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('111','2A','2','2','2015-06-04 07:58:22','2015-07-07 07:47:09','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('112','2B','2',NULL,'2015-06-04 07:58:22','2015-06-04 07:58:22','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('113','2C','2',NULL,'2015-06-04 07:58:22','2015-06-04 07:58:22','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('114','2D','2',NULL,'2015-06-04 07:58:22','2015-06-04 07:58:22','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('115','2E','2',NULL,'2015-06-04 07:58:22','2015-06-04 07:58:22','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('116','2F','2',NULL,'2015-06-04 07:58:22','2015-06-04 07:58:22','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('117','2G','2',NULL,'2015-06-04 07:58:22','2015-06-04 07:58:22','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('118','2H','2',NULL,'2015-06-04 07:58:22','2015-06-04 07:58:22','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('119','2I','2',NULL,'2015-06-04 07:58:22','2015-06-04 07:58:22','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('120','2J','2',NULL,'2015-06-04 07:58:22','2015-06-04 07:58:22','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('121','3A','2',NULL,'2015-06-04 07:58:22','2015-06-04 07:58:22','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('122','3B','2',NULL,'2015-06-04 07:58:22','2015-06-04 07:58:22','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('123','3C','2',NULL,'2015-06-04 07:58:22','2015-06-04 07:58:22','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('124','3D','2',NULL,'2015-06-04 07:58:22','2015-06-04 07:58:22','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('125','3E','2',NULL,'2015-06-04 07:58:22','2015-06-04 07:58:22','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('126','3F','2',NULL,'2015-06-04 07:58:22','2015-06-04 07:58:22','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('127','3G','2',NULL,'2015-06-04 07:58:22','2015-06-04 07:58:22','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('128','3H','2',NULL,'2015-06-04 07:58:22','2015-06-04 07:58:22','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('129','3I','2',NULL,'2015-06-04 07:58:22','2015-06-04 07:58:22','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('130','3J','2',NULL,'2015-06-04 07:58:22','2015-06-04 07:58:22','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('131','4A','2',NULL,'2015-06-04 07:58:22','2015-06-04 07:58:22','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('132','4B','2',NULL,'2015-06-04 07:58:22','2015-06-04 07:58:22','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('133','4C','2',NULL,'2015-06-04 07:58:22','2015-06-04 07:58:22','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('134','4D','2',NULL,'2015-06-04 07:58:22','2015-06-04 07:58:22','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('135','4E','2',NULL,'2015-06-04 07:58:22','2015-06-04 07:58:22','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('136','4F','2',NULL,'2015-06-04 07:58:22','2015-06-04 07:58:22','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('137','4G','2',NULL,'2015-06-04 07:58:22','2015-06-04 07:58:22','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('138','4H','2',NULL,'2015-06-04 07:58:22','2015-06-04 07:58:22','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('139','4I','2',NULL,'2015-06-04 07:58:22','2015-06-04 07:58:22','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('140','4J','2',NULL,'2015-06-04 07:58:22','2015-06-04 07:58:22','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('141','5A','2',NULL,'2015-06-04 07:58:22','2015-06-04 07:58:22','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('142','5B','2',NULL,'2015-06-04 07:58:22','2015-06-04 07:58:22','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('143','5C','2',NULL,'2015-06-04 07:58:22','2015-06-04 07:58:22','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('144','5D','2',NULL,'2015-06-04 07:58:22','2015-06-04 07:58:22','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('145','5E','2',NULL,'2015-06-04 07:58:22','2015-06-04 07:58:22','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('146','5F','2',NULL,'2015-06-04 07:58:22','2015-06-04 07:58:22','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('147','5G','2',NULL,'2015-06-04 07:58:22','2015-06-04 07:58:22','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('148','5H','2',NULL,'2015-06-04 07:58:22','2015-06-04 07:58:22','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('149','5I','2',NULL,'2015-06-04 07:58:22','2015-06-04 07:58:22','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('150','5J','2',NULL,'2015-06-04 07:58:22','2015-06-04 07:58:22','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('151','6A','2',NULL,'2015-06-04 07:58:22','2015-06-04 07:58:22','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('152','6B','2',NULL,'2015-06-04 07:58:22','2015-06-04 07:58:22','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('153','6C','2',NULL,'2015-06-04 07:58:22','2015-06-04 07:58:22','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('154','6D','2',NULL,'2015-06-04 07:58:22','2015-06-04 07:58:22','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('155','6E','2',NULL,'2015-06-04 07:58:22','2015-06-04 07:58:22','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('156','6F','2',NULL,'2015-06-04 07:58:22','2015-06-04 07:58:22','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('157','6G','2',NULL,'2015-06-04 07:58:23','2015-06-04 07:58:23','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('158','6H','2',NULL,'2015-06-04 07:58:23','2015-06-04 07:58:23','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('159','6I','2',NULL,'2015-06-04 07:58:23','2015-06-04 07:58:23','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('160','6J','2',NULL,'2015-06-04 07:58:23','2015-06-04 07:58:23','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('161','7A','2',NULL,'2015-06-04 07:58:23','2015-06-04 07:58:23','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('162','7B','2',NULL,'2015-06-04 07:58:23','2015-06-04 07:58:23','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('163','7C','2',NULL,'2015-06-04 07:58:23','2015-06-04 07:58:23','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('164','7D','2',NULL,'2015-06-04 07:58:23','2015-06-04 07:58:23','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('165','7E','2',NULL,'2015-06-04 07:58:23','2015-06-04 07:58:23','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('166','7F','2',NULL,'2015-06-04 07:58:23','2015-06-04 07:58:23','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('167','7G','2',NULL,'2015-06-04 07:58:23','2015-06-04 07:58:23','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('168','7H','2',NULL,'2015-06-04 07:58:23','2015-06-04 07:58:23','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('169','7I','2',NULL,'2015-06-04 07:58:23','2015-06-04 07:58:23','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('170','7J','2',NULL,'2015-06-04 07:58:23','2015-06-04 07:58:23','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('171','8A','2',NULL,'2015-06-04 07:58:23','2015-06-04 07:58:23','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('172','8B','2',NULL,'2015-06-04 07:58:23','2015-06-04 07:58:23','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('173','8C','2',NULL,'2015-06-04 07:58:23','2015-06-04 07:58:23','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('174','8D','2',NULL,'2015-06-04 07:58:23','2015-06-04 07:58:23','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('175','8E','2',NULL,'2015-06-04 07:58:23','2015-06-04 07:58:23','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('176','8F','2',NULL,'2015-06-04 07:58:23','2015-06-04 07:58:23','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('177','8G','2',NULL,'2015-06-04 07:58:23','2015-06-04 07:58:23','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('178','8H','2',NULL,'2015-06-04 07:58:23','2015-06-04 07:58:23','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('179','8I','2',NULL,'2015-06-04 07:58:23','2015-06-04 07:58:23','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('180','8J','2',NULL,'2015-06-04 07:58:23','2015-06-04 07:58:23','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('181','9A','2',NULL,'2015-06-04 07:58:23','2015-06-04 07:58:23','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('182','9B','2',NULL,'2015-06-04 07:58:23','2015-06-04 07:58:23','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('183','9C','2',NULL,'2015-06-04 07:58:23','2015-06-04 07:58:23','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('184','9D','2',NULL,'2015-06-04 07:58:23','2015-06-04 07:58:23','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('185','9E','2',NULL,'2015-06-04 07:58:23','2015-06-04 07:58:23','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('186','9F','2',NULL,'2015-06-04 07:58:23','2015-06-04 07:58:23','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('187','9G','2',NULL,'2015-06-04 07:58:23','2015-06-04 07:58:23','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('188','9H','2',NULL,'2015-06-04 07:58:23','2015-06-04 07:58:23','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('189','9I','2',NULL,'2015-06-04 07:58:23','2015-06-04 07:58:23','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('190','9J','2',NULL,'2015-06-04 07:58:23','2015-06-04 07:58:23','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('191','10A','2',NULL,'2015-06-04 07:58:23','2015-06-04 07:58:23','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('192','10B','2',NULL,'2015-06-04 07:58:23','2015-06-04 07:58:23','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('193','10C','2',NULL,'2015-06-04 07:58:23','2015-06-04 07:58:23','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('194','10D','2',NULL,'2015-06-04 07:58:23','2015-06-04 07:58:23','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('195','10E','2',NULL,'2015-06-04 07:58:23','2015-06-04 07:58:23','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('196','10F','2',NULL,'2015-06-04 07:58:23','2015-06-04 07:58:23','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('197','10G','2',NULL,'2015-06-04 07:58:23','2015-06-04 07:58:23','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('198','10H','2',NULL,'2015-06-04 07:58:23','2015-06-04 07:58:23','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('199','10I','2',NULL,'2015-06-04 07:58:23','2015-06-04 07:58:23','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('200','10J','2',NULL,'2015-06-04 07:58:23','2015-06-04 07:58:23','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('201','1A','3',NULL,'2015-06-04 07:58:24','2015-06-24 09:21:49','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('202','1B','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('203','1C','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('204','1D','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('205','1E','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('206','1F','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('207','1G','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('208','1H','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('209','1I','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('210','1J','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('211','2A','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('212','2B','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('213','2C','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('214','2D','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('215','2E','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('216','2F','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('217','2G','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('218','2H','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('219','2I','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('220','2J','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('221','3A','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('222','3B','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('223','3C','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('224','3D','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('225','3E','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('226','3F','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('227','3G','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('228','3H','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('229','3I','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('230','3J','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('231','4A','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('232','4B','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('233','4C','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('234','4D','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('235','4E','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('236','4F','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('237','4G','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('238','4H','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('239','4I','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('240','4J','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('241','5A','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('242','5B','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('243','5C','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('244','5D','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('245','5E','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('246','5F','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('247','5G','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('248','5H','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('249','5I','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('250','5J','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('251','6A','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('252','6B','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('253','6C','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('254','6D','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('255','6E','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('256','6F','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('257','6G','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('258','6H','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('259','6I','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('260','6J','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('261','7A','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('262','7B','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('263','7C','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('264','7D','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('265','7E','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('266','7F','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('267','7G','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('268','7H','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('269','7I','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('270','7J','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('271','8A','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('272','8B','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('273','8C','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('274','8D','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('275','8E','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('276','8F','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('277','8G','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('278','8H','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('279','8I','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('280','8J','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('281','9A','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('282','9B','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('283','9C','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('284','9D','3',NULL,'2015-06-04 07:58:24','2015-06-04 07:58:24','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('285','9E','3',NULL,'2015-06-04 07:58:25','2015-06-04 07:58:25','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('286','9F','3',NULL,'2015-06-04 07:58:25','2015-06-04 07:58:25','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('287','9G','3',NULL,'2015-06-04 07:58:25','2015-06-04 07:58:25','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('288','9H','3',NULL,'2015-06-04 07:58:25','2015-06-04 07:58:25','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('289','9I','3',NULL,'2015-06-04 07:58:25','2015-06-04 07:58:25','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('290','9J','3',NULL,'2015-06-04 07:58:25','2015-06-04 07:58:25','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('291','10A','3',NULL,'2015-06-04 07:58:25','2015-06-04 07:58:25','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('292','10B','3',NULL,'2015-06-04 07:58:25','2015-06-04 07:58:25','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('293','10C','3',NULL,'2015-06-04 07:58:25','2015-06-04 07:58:25','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('294','10D','3',NULL,'2015-06-04 07:58:25','2015-06-04 07:58:25','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('295','10E','3',NULL,'2015-06-04 07:58:25','2015-06-04 07:58:25','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('296','10F','3',NULL,'2015-06-04 07:58:25','2015-06-04 07:58:25','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('297','10G','3',NULL,'2015-06-04 07:58:25','2015-06-04 07:58:25','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('298','10H','3',NULL,'2015-06-04 07:58:25','2015-06-04 07:58:25','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('299','10I','3',NULL,'2015-06-04 07:58:25','2015-06-04 07:58:25','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('300','10J','3',NULL,'2015-06-04 07:58:25','2015-06-04 07:58:25','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('301','1A','4',NULL,'2015-06-04 07:58:31','2015-06-04 07:58:31','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('302','1B','4',NULL,'2015-06-04 07:58:31','2015-06-04 07:58:31','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('303','1C','4',NULL,'2015-06-04 07:58:31','2015-06-04 07:58:31','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('304','1D','4',NULL,'2015-06-04 07:58:31','2015-06-04 07:58:31','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('305','1E','4',NULL,'2015-06-04 07:58:31','2015-06-04 07:58:31','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('306','2A','4',NULL,'2015-06-04 07:58:31','2015-06-04 07:58:31','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('307','2B','4',NULL,'2015-06-04 07:58:31','2015-06-04 07:58:31','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('308','2C','4',NULL,'2015-06-04 07:58:31','2015-06-04 07:58:31','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('309','2D','4',NULL,'2015-06-04 07:58:31','2015-06-04 07:58:31','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('310','2E','4',NULL,'2015-06-04 07:58:31','2015-06-04 07:58:31','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('311','3A','4',NULL,'2015-06-04 07:58:31','2015-06-04 07:58:31','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('312','3B','4',NULL,'2015-06-04 07:58:31','2015-06-04 07:58:31','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('313','3C','4',NULL,'2015-06-04 07:58:31','2015-06-04 07:58:31','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('314','3D','4',NULL,'2015-06-04 07:58:31','2015-06-04 07:58:31','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('315','3E','4',NULL,'2015-06-04 07:58:31','2015-06-04 07:58:31','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('316','4A','4',NULL,'2015-06-04 07:58:31','2015-06-04 07:58:31','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('317','4B','4',NULL,'2015-06-04 07:58:31','2015-06-04 07:58:31','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('318','4C','4',NULL,'2015-06-04 07:58:31','2015-06-04 07:58:31','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('319','4D','4',NULL,'2015-06-04 07:58:31','2015-06-04 07:58:31','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('320','4E','4',NULL,'2015-06-04 07:58:31','2015-06-04 07:58:31','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('321','5A','4',NULL,'2015-06-04 07:58:31','2015-06-04 07:58:31','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('322','5B','4',NULL,'2015-06-04 07:58:31','2015-06-04 07:58:31','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('323','5C','4',NULL,'2015-06-04 07:58:31','2015-06-04 07:58:31','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('324','5D','4',NULL,'2015-06-04 07:58:31','2015-06-04 07:58:31','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('325','5E','4',NULL,'2015-06-04 07:58:31','2015-06-04 07:58:31','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('326','1A','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('327','1B','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('328','1C','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('329','1D','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('330','1E','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('331','1F','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('332','1G','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('333','1H','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('334','1I','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('335','1J','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('336','2A','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('337','2B','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('338','2C','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('339','2D','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('340','2E','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('341','2F','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('342','2G','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('343','2H','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('344','2I','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('345','2J','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('346','3A','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('347','3B','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('348','3C','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('349','3D','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('350','3E','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('351','3F','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('352','3G','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('353','3H','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('354','3I','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('355','3J','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('356','4A','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('357','4B','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('358','4C','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('359','4D','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('360','4E','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('361','4F','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('362','4G','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('363','4H','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('364','4I','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('365','4J','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('366','5A','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('367','5B','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('368','5C','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('369','5D','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('370','5E','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('371','5F','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('372','5G','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('373','5H','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('374','5I','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('375','5J','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('376','6A','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('377','6B','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('378','6C','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('379','6D','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('380','6E','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('381','6F','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('382','6G','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('383','6H','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('384','6I','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('385','6J','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('386','7A','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('387','7B','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('388','7C','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('389','7D','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('390','7E','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('391','7F','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('392','7G','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('393','7H','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('394','7I','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('395','7J','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('396','8A','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('397','8B','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('398','8C','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('399','8D','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('400','8E','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('401','8F','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('402','8G','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('403','8H','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('404','8I','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('405','8J','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('406','9A','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('407','9B','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('408','9C','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('409','9D','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('410','9E','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('411','9F','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('412','9G','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('413','9H','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('414','9I','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('415','9J','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('416','10A','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('417','10B','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('418','10C','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('419','10D','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('420','10E','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('421','10F','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('422','10G','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('423','10H','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('424','10I','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');
INSERT INTO `baskets` (`id`,`code`,`framework_id`,`onwer_id`,`created_at`,`updated_at`,`cage_type`) VALUES ('425','10J','5',NULL,'2015-06-08 03:47:20','2015-06-08 03:47:20','S');


# Dump of table batches
# ------------------------------------------------------------

CREATE TABLE `batches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `father_id` int(11) DEFAULT NULL,
  `basket_id` int(11) DEFAULT NULL,
  `mother_id` int(11) DEFAULT NULL,
  `breed_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `childbirthday` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `use_val` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `batches` (`id`,`father_id`,`basket_id`,`mother_id`,`breed_id`,`quantity`,`childbirthday`,`created_at`,`updated_at`,`use_val`) VALUES ('8','11',NULL,'8','28','5','2015-07-07','2015-07-07 08:35:23','2015-07-07 08:35:23',NULL);
INSERT INTO `batches` (`id`,`father_id`,`basket_id`,`mother_id`,`breed_id`,`quantity`,`childbirthday`,`created_at`,`updated_at`,`use_val`) VALUES ('9','34',NULL,'27','29','4','2015-07-13','2015-07-10 05:25:51','2015-07-10 05:25:51',NULL);


# Dump of table breeds
# ------------------------------------------------------------

CREATE TABLE `breeds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `basket_id` int(11) DEFAULT NULL,
  `father_id` int(11) DEFAULT NULL,
  `mother_id` int(11) DEFAULT NULL,
  `cage_at` date DEFAULT NULL,
  `is_usable` tinyint(1) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `breeding` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `breeds` (`id`,`basket_id`,`father_id`,`mother_id`,`cage_at`,`is_usable`,`created_at`,`updated_at`,`created_by`,`breeding`) VALUES ('28','11','11','8','2015-06-07','1','2015-07-07 08:14:29','2015-07-07 08:35:23','3','1');
INSERT INTO `breeds` (`id`,`basket_id`,`father_id`,`mother_id`,`cage_at`,`is_usable`,`created_at`,`updated_at`,`created_by`,`breeding`) VALUES ('29','33','34','27','2015-07-01','1','2015-07-09 09:53:09','2015-07-14 09:32:31','2','1');
INSERT INTO `breeds` (`id`,`basket_id`,`father_id`,`mother_id`,`cage_at`,`is_usable`,`created_at`,`updated_at`,`created_by`,`breeding`) VALUES ('30','21','30','32','2015-06-30','1','2015-07-10 05:18:18','2015-07-14 06:22:10','2','0');
INSERT INTO `breeds` (`id`,`basket_id`,`father_id`,`mother_id`,`cage_at`,`is_usable`,`created_at`,`updated_at`,`created_by`,`breeding`) VALUES ('32','21','30','33','2015-07-01','1','2015-07-14 09:11:34','2015-07-14 09:11:40','2','0');


# Dump of table breeds_infos
# ------------------------------------------------------------

CREATE TABLE `breeds_infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `breed_id` int(11) DEFAULT NULL,
  `batch_id` int(11) DEFAULT NULL,
  `operation_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `operation_by` int(11) DEFAULT NULL,
  `operation_at` date DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `die_reason` text COLLATE utf8_unicode_ci,
  `remark` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table frameworks
# ------------------------------------------------------------

CREATE TABLE `frameworks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `axis_y` int(11) DEFAULT NULL,
  `axis_x` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `frameworks` (`id`,`code`,`axis_y`,`axis_x`,`created_at`,`updated_at`) VALUES ('1',NULL,'10','10','2015-06-04 07:56:35','2015-06-04 07:56:35');
INSERT INTO `frameworks` (`id`,`code`,`axis_y`,`axis_x`,`created_at`,`updated_at`) VALUES ('2',NULL,'10','10','2015-06-04 07:58:22','2015-06-04 07:58:22');
INSERT INTO `frameworks` (`id`,`code`,`axis_y`,`axis_x`,`created_at`,`updated_at`) VALUES ('3',NULL,'10','10','2015-06-04 07:58:24','2015-06-04 07:58:24');
INSERT INTO `frameworks` (`id`,`code`,`axis_y`,`axis_x`,`created_at`,`updated_at`) VALUES ('4',NULL,'5','5','2015-06-04 07:58:31','2015-06-04 07:58:31');
INSERT INTO `frameworks` (`id`,`code`,`axis_y`,`axis_x`,`created_at`,`updated_at`) VALUES ('5',NULL,'10','10','2015-06-08 03:47:20','2015-06-08 03:47:20');


# Dump of table genes
# ------------------------------------------------------------

CREATE TABLE `genes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `short_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `access_id` int(11) DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `genes` (`id`,`name`,`short_name`,`access_id`,`location`,`created_at`,`updated_at`) VALUES ('1','ghi','ghi','3','123','2015-06-05 03:33:12','2015-06-08 07:55:29');
INSERT INTO `genes` (`id`,`name`,`short_name`,`access_id`,`location`,`created_at`,`updated_at`) VALUES ('2','def','qre','2','def','2015-06-05 03:33:36','2015-06-08 07:55:08');
INSERT INTO `genes` (`id`,`name`,`short_name`,`access_id`,`location`,`created_at`,`updated_at`) VALUES ('3','abc','abc','1','234234','2015-06-08 03:56:32','2015-06-08 07:55:15');


# Dump of table genetic_types
# ------------------------------------------------------------

CREATE TABLE `genetic_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `short_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `genetic_types` (`id`,`short_name`,`full_name`,`created_at`,`updated_at`) VALUES ('1','CTK','Combonation transgene + KO','2015-06-04 07:55:52','2015-06-04 07:55:52');
INSERT INTO `genetic_types` (`id`,`short_name`,`full_name`,`created_at`,`updated_at`) VALUES ('2','E','endogenous','2015-06-04 07:55:52','2015-06-04 07:55:52');
INSERT INTO `genetic_types` (`id`,`short_name`,`full_name`,`created_at`,`updated_at`) VALUES ('3','Floxed','tissue specific knock out','2015-06-04 07:55:52','2015-06-04 07:55:52');
INSERT INTO `genetic_types` (`id`,`short_name`,`full_name`,`created_at`,`updated_at`) VALUES ('4','KI','knock in','2015-06-04 07:55:52','2015-06-04 07:55:52');
INSERT INTO `genetic_types` (`id`,`short_name`,`full_name`,`created_at`,`updated_at`) VALUES ('5','KO','knock out','2015-06-04 07:55:52','2015-06-04 07:55:52');
INSERT INTO `genetic_types` (`id`,`short_name`,`full_name`,`created_at`,`updated_at`) VALUES ('6','MK','multi allele knock out','2015-06-04 07:55:52','2015-06-04 07:55:52');
INSERT INTO `genetic_types` (`id`,`short_name`,`full_name`,`created_at`,`updated_at`) VALUES ('7','MTG','multi allele trans gene','2015-06-04 07:55:52','2015-06-04 07:55:52');
INSERT INTO `genetic_types` (`id`,`short_name`,`full_name`,`created_at`,`updated_at`) VALUES ('8','TG','trans gene','2015-06-04 07:55:52','2015-06-04 07:55:52');
INSERT INTO `genetic_types` (`id`,`short_name`,`full_name`,`created_at`,`updated_at`) VALUES ('9','SM','spontaneous mutation','2015-06-04 07:55:52','2015-06-04 07:55:52');


# Dump of table mice
# ------------------------------------------------------------

CREATE TABLE `mice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `strain_id` int(11) DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `generation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `wean_date` date DEFAULT NULL,
  `sex` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `father_id` int(11) DEFAULT NULL,
  `mother_id` int(11) DEFAULT NULL,
  `basket_id` int(11) DEFAULT NULL,
  `batch_id` int(11) DEFAULT NULL,
  `life_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'A',
  `coat_color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dead_date` date DEFAULT NULL,
  `dead` date DEFAULT NULL,
  `onwer_id` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `is_dead` tinyint(1) DEFAULT '0',
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `breed_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `mice` (`id`,`strain_id`,`code`,`generation`,`birthday`,`wean_date`,`sex`,`father_id`,`mother_id`,`basket_id`,`batch_id`,`life_status`,`coat_color`,`dead_date`,`dead`,`onwer_id`,`created_by`,`is_dead`,`description`,`created_at`,`updated_at`,`breed_id`) VALUES ('2','1','0001','1','2015-06-05','2015-06-18','M',NULL,NULL,NULL,NULL,'A','??',NULL,NULL,'3','1','0',NULL,'2015-06-05 08:39:47','2015-07-07 07:51:52',NULL);
INSERT INTO `mice` (`id`,`strain_id`,`code`,`generation`,`birthday`,`wean_date`,`sex`,`father_id`,`mother_id`,`basket_id`,`batch_id`,`life_status`,`coat_color`,`dead_date`,`dead`,`onwer_id`,`created_by`,`is_dead`,`description`,`created_at`,`updated_at`,`breed_id`) VALUES ('3','2','0002','2','2015-06-05','2015-06-17','F',NULL,'3','34',NULL,'A','adf',NULL,NULL,'3','1','0',NULL,'2015-06-05 08:44:02','2015-07-02 09:09:36',NULL);
INSERT INTO `mice` (`id`,`strain_id`,`code`,`generation`,`birthday`,`wean_date`,`sex`,`father_id`,`mother_id`,`basket_id`,`batch_id`,`life_status`,`coat_color`,`dead_date`,`dead`,`onwer_id`,`created_by`,`is_dead`,`description`,`created_at`,`updated_at`,`breed_id`) VALUES ('4','4','0003','2','2015-06-11','2015-06-11','M','2',NULL,NULL,NULL,'A','??',NULL,NULL,'3','1','0',NULL,'2015-06-05 09:38:03','2015-07-07 07:48:39',NULL);
INSERT INTO `mice` (`id`,`strain_id`,`code`,`generation`,`birthday`,`wean_date`,`sex`,`father_id`,`mother_id`,`basket_id`,`batch_id`,`life_status`,`coat_color`,`dead_date`,`dead`,`onwer_id`,`created_by`,`is_dead`,`description`,`created_at`,`updated_at`,`breed_id`) VALUES ('5','1','0004','4','2015-06-09','2015-06-16','F',NULL,NULL,'74',NULL,'A','??',NULL,NULL,'3','1','0',NULL,'2015-06-08 08:33:37','2015-06-10 07:45:14',NULL);
INSERT INTO `mice` (`id`,`strain_id`,`code`,`generation`,`birthday`,`wean_date`,`sex`,`father_id`,`mother_id`,`basket_id`,`batch_id`,`life_status`,`coat_color`,`dead_date`,`dead`,`onwer_id`,`created_by`,`is_dead`,`description`,`created_at`,`updated_at`,`breed_id`) VALUES ('6','4','0005','2','2015-06-10','2015-06-11','F','2',NULL,'101',NULL,'A','QDQW',NULL,NULL,'3','1','0',NULL,'2015-06-09 06:31:13','2015-06-09 09:35:20',NULL);
INSERT INTO `mice` (`id`,`strain_id`,`code`,`generation`,`birthday`,`wean_date`,`sex`,`father_id`,`mother_id`,`basket_id`,`batch_id`,`life_status`,`coat_color`,`dead_date`,`dead`,`onwer_id`,`created_by`,`is_dead`,`description`,`created_at`,`updated_at`,`breed_id`) VALUES ('7','2','0006','3','2015-06-09','2015-06-11','F',NULL,NULL,NULL,NULL,'A','adf',NULL,NULL,'3','1','0',NULL,'2015-06-09 06:31:36','2015-07-07 07:51:49',NULL);
INSERT INTO `mice` (`id`,`strain_id`,`code`,`generation`,`birthday`,`wean_date`,`sex`,`father_id`,`mother_id`,`basket_id`,`batch_id`,`life_status`,`coat_color`,`dead_date`,`dead`,`onwer_id`,`created_by`,`is_dead`,`description`,`created_at`,`updated_at`,`breed_id`) VALUES ('8','4','0007','5','2015-06-11','2015-06-11','F',NULL,NULL,'11',NULL,'A','QD',NULL,NULL,'3','1','0',NULL,'2015-06-09 06:32:04','2015-07-07 08:14:20',NULL);
INSERT INTO `mice` (`id`,`strain_id`,`code`,`generation`,`birthday`,`wean_date`,`sex`,`father_id`,`mother_id`,`basket_id`,`batch_id`,`life_status`,`coat_color`,`dead_date`,`dead`,`onwer_id`,`created_by`,`is_dead`,`description`,`created_at`,`updated_at`,`breed_id`) VALUES ('9','4','','4','2015-06-11','2015-06-11','F','2','3','7',NULL,'A','QD',NULL,NULL,'3','1','0',NULL,'2015-06-11 06:47:46','2015-07-02 07:37:11',NULL);
INSERT INTO `mice` (`id`,`strain_id`,`code`,`generation`,`birthday`,`wean_date`,`sex`,`father_id`,`mother_id`,`basket_id`,`batch_id`,`life_status`,`coat_color`,`dead_date`,`dead`,`onwer_id`,`created_by`,`is_dead`,`description`,`created_at`,`updated_at`,`breed_id`) VALUES ('10','1','0008','2','2015-06-09','2015-06-23','F',NULL,NULL,'5',NULL,'A','??',NULL,NULL,'3','1','0',NULL,'2015-06-11 08:07:40','2015-07-02 06:26:05',NULL);
INSERT INTO `mice` (`id`,`strain_id`,`code`,`generation`,`birthday`,`wean_date`,`sex`,`father_id`,`mother_id`,`basket_id`,`batch_id`,`life_status`,`coat_color`,`dead_date`,`dead`,`onwer_id`,`created_by`,`is_dead`,`description`,`created_at`,`updated_at`,`breed_id`) VALUES ('11','1','23424','3','2015-06-26','2015-07-04','M','2','3','11',NULL,'A','??',NULL,NULL,'3','1','0',NULL,'2015-06-24 05:51:21','2015-07-07 08:14:29',NULL);
INSERT INTO `mice` (`id`,`strain_id`,`code`,`generation`,`birthday`,`wean_date`,`sex`,`father_id`,`mother_id`,`basket_id`,`batch_id`,`life_status`,`coat_color`,`dead_date`,`dead`,`onwer_id`,`created_by`,`is_dead`,`description`,`created_at`,`updated_at`,`breed_id`) VALUES ('12','1','00011','4','2015-06-26','2015-06-29','M','2','3','21',NULL,'K','??','2015-07-06',NULL,'3','1','0','','2015-06-24 05:51:21','2015-07-06 05:54:20',NULL);
INSERT INTO `mice` (`id`,`strain_id`,`code`,`generation`,`birthday`,`wean_date`,`sex`,`father_id`,`mother_id`,`basket_id`,`batch_id`,`life_status`,`coat_color`,`dead_date`,`dead`,`onwer_id`,`created_by`,`is_dead`,`description`,`created_at`,`updated_at`,`breed_id`) VALUES ('13','1','1231','3','2015-06-26','2015-06-09','F','2','3',NULL,NULL,'A','??',NULL,NULL,'3','1','0',NULL,'2015-06-24 05:51:21','2015-07-07 07:48:37',NULL);
INSERT INTO `mice` (`id`,`strain_id`,`code`,`generation`,`birthday`,`wean_date`,`sex`,`father_id`,`mother_id`,`basket_id`,`batch_id`,`life_status`,`coat_color`,`dead_date`,`dead`,`onwer_id`,`created_by`,`is_dead`,`description`,`created_at`,`updated_at`,`breed_id`) VALUES ('14','1','0010','4','2015-06-26','2015-06-25','M','2','3','13',NULL,'A','??',NULL,NULL,'3','1','0',NULL,'2015-06-24 05:51:21','2015-07-02 07:22:42',NULL);
INSERT INTO `mice` (`id`,`strain_id`,`code`,`generation`,`birthday`,`wean_date`,`sex`,`father_id`,`mother_id`,`basket_id`,`batch_id`,`life_status`,`coat_color`,`dead_date`,`dead`,`onwer_id`,`created_by`,`is_dead`,`description`,`created_at`,`updated_at`,`breed_id`) VALUES ('15','1','1233','4','2015-06-26','2015-07-08','M','2','3',NULL,NULL,'A','??',NULL,NULL,'4','1','0',NULL,'2015-06-24 05:51:21','2015-07-06 03:58:24',NULL);
INSERT INTO `mice` (`id`,`strain_id`,`code`,`generation`,`birthday`,`wean_date`,`sex`,`father_id`,`mother_id`,`basket_id`,`batch_id`,`life_status`,`coat_color`,`dead_date`,`dead`,`onwer_id`,`created_by`,`is_dead`,`description`,`created_at`,`updated_at`,`breed_id`) VALUES ('16','1',NULL,NULL,'2015-07-01',NULL,NULL,'4','13',NULL,NULL,'A',NULL,NULL,NULL,'3','1','0',NULL,'2015-07-01 06:48:00','2015-07-07 07:50:44',NULL);
INSERT INTO `mice` (`id`,`strain_id`,`code`,`generation`,`birthday`,`wean_date`,`sex`,`father_id`,`mother_id`,`basket_id`,`batch_id`,`life_status`,`coat_color`,`dead_date`,`dead`,`onwer_id`,`created_by`,`is_dead`,`description`,`created_at`,`updated_at`,`breed_id`) VALUES ('17','1',NULL,NULL,'2015-07-01',NULL,NULL,'4','13','2',NULL,'A',NULL,NULL,NULL,'3','1','0',NULL,'2015-07-01 06:48:00','2015-07-01 06:48:00',NULL);
INSERT INTO `mice` (`id`,`strain_id`,`code`,`generation`,`birthday`,`wean_date`,`sex`,`father_id`,`mother_id`,`basket_id`,`batch_id`,`life_status`,`coat_color`,`dead_date`,`dead`,`onwer_id`,`created_by`,`is_dead`,`description`,`created_at`,`updated_at`,`breed_id`) VALUES ('18','1',NULL,NULL,'2015-07-01',NULL,NULL,'4','13','3',NULL,'A',NULL,NULL,NULL,'3','1','0',NULL,'2015-07-01 06:48:00','2015-07-07 07:58:51',NULL);
INSERT INTO `mice` (`id`,`strain_id`,`code`,`generation`,`birthday`,`wean_date`,`sex`,`father_id`,`mother_id`,`basket_id`,`batch_id`,`life_status`,`coat_color`,`dead_date`,`dead`,`onwer_id`,`created_by`,`is_dead`,`description`,`created_at`,`updated_at`,`breed_id`) VALUES ('19','1',NULL,NULL,'2015-07-01',NULL,NULL,'4','13',NULL,NULL,'A',NULL,NULL,NULL,'3','1','0',NULL,'2015-07-01 06:48:00','2015-07-06 06:30:16',NULL);
INSERT INTO `mice` (`id`,`strain_id`,`code`,`generation`,`birthday`,`wean_date`,`sex`,`father_id`,`mother_id`,`basket_id`,`batch_id`,`life_status`,`coat_color`,`dead_date`,`dead`,`onwer_id`,`created_by`,`is_dead`,`description`,`created_at`,`updated_at`,`breed_id`) VALUES ('20','1',NULL,NULL,'2015-07-01',NULL,NULL,'4','13','3',NULL,'A',NULL,NULL,NULL,'3','1','0',NULL,'2015-07-01 06:48:00','2015-07-07 07:58:54',NULL);
INSERT INTO `mice` (`id`,`strain_id`,`code`,`generation`,`birthday`,`wean_date`,`sex`,`father_id`,`mother_id`,`basket_id`,`batch_id`,`life_status`,`coat_color`,`dead_date`,`dead`,`onwer_id`,`created_by`,`is_dead`,`description`,`created_at`,`updated_at`,`breed_id`) VALUES ('21','1',NULL,NULL,'2015-07-01',NULL,NULL,'4','13',NULL,NULL,'A',NULL,NULL,NULL,'3','1','0',NULL,'2015-07-01 06:48:00','2015-07-06 06:30:20',NULL);
INSERT INTO `mice` (`id`,`strain_id`,`code`,`generation`,`birthday`,`wean_date`,`sex`,`father_id`,`mother_id`,`basket_id`,`batch_id`,`life_status`,`coat_color`,`dead_date`,`dead`,`onwer_id`,`created_by`,`is_dead`,`description`,`created_at`,`updated_at`,`breed_id`) VALUES ('22','1',NULL,NULL,'2015-07-01',NULL,NULL,'4','13','2',NULL,'A',NULL,NULL,NULL,'3','1','0',NULL,'2015-07-01 06:48:01','2015-07-01 06:48:01',NULL);
INSERT INTO `mice` (`id`,`strain_id`,`code`,`generation`,`birthday`,`wean_date`,`sex`,`father_id`,`mother_id`,`basket_id`,`batch_id`,`life_status`,`coat_color`,`dead_date`,`dead`,`onwer_id`,`created_by`,`is_dead`,`description`,`created_at`,`updated_at`,`breed_id`) VALUES ('23','1','32343','3','2015-07-01','2015-07-10','M','4','13',NULL,NULL,'A','??',NULL,NULL,'3','1','0',NULL,'2015-07-01 06:48:01','2015-07-07 07:48:49',NULL);
INSERT INTO `mice` (`id`,`strain_id`,`code`,`generation`,`birthday`,`wean_date`,`sex`,`father_id`,`mother_id`,`basket_id`,`batch_id`,`life_status`,`coat_color`,`dead_date`,`dead`,`onwer_id`,`created_by`,`is_dead`,`description`,`created_at`,`updated_at`,`breed_id`) VALUES ('24','1','35456','3','2015-07-01','2015-07-03','F','4','13','4',NULL,'A','??',NULL,NULL,'3','1','0',NULL,'2015-07-01 06:48:01','2015-07-07 07:59:31',NULL);
INSERT INTO `mice` (`id`,`strain_id`,`code`,`generation`,`birthday`,`wean_date`,`sex`,`father_id`,`mother_id`,`basket_id`,`batch_id`,`life_status`,`coat_color`,`dead_date`,`dead`,`onwer_id`,`created_by`,`is_dead`,`description`,`created_at`,`updated_at`,`breed_id`) VALUES ('25','1','qwe','','2015-07-01','2015-07-17','M','4','13','33',NULL,'K','??',NULL,NULL,'2','1','0','','2015-07-01 06:48:01','2015-07-08 10:12:28',NULL);
INSERT INTO `mice` (`id`,`strain_id`,`code`,`generation`,`birthday`,`wean_date`,`sex`,`father_id`,`mother_id`,`basket_id`,`batch_id`,`life_status`,`coat_color`,`dead_date`,`dead`,`onwer_id`,`created_by`,`is_dead`,`description`,`created_at`,`updated_at`,`breed_id`) VALUES ('26','1',NULL,NULL,'2015-07-01',NULL,NULL,'4','13','2',NULL,'A',NULL,NULL,NULL,'3','1','0',NULL,'2015-07-01 06:48:01','2015-07-01 06:48:01',NULL);
INSERT INTO `mice` (`id`,`strain_id`,`code`,`generation`,`birthday`,`wean_date`,`sex`,`father_id`,`mother_id`,`basket_id`,`batch_id`,`life_status`,`coat_color`,`dead_date`,`dead`,`onwer_id`,`created_by`,`is_dead`,`description`,`created_at`,`updated_at`,`breed_id`) VALUES ('27','1','24342','3','2015-07-01','2015-07-04','F','4','13','33',NULL,'A','??',NULL,NULL,'2','1','0',NULL,'2015-07-01 06:48:01','2015-07-08 10:15:00',NULL);
INSERT INTO `mice` (`id`,`strain_id`,`code`,`generation`,`birthday`,`wean_date`,`sex`,`father_id`,`mother_id`,`basket_id`,`batch_id`,`life_status`,`coat_color`,`dead_date`,`dead`,`onwer_id`,`created_by`,`is_dead`,`description`,`created_at`,`updated_at`,`breed_id`) VALUES ('28','1',NULL,NULL,'2015-07-02',NULL,NULL,'4','13','2',NULL,'A',NULL,NULL,NULL,'3','1','0',NULL,'2015-07-01 06:52:17','2015-07-01 07:02:07',NULL);
INSERT INTO `mice` (`id`,`strain_id`,`code`,`generation`,`birthday`,`wean_date`,`sex`,`father_id`,`mother_id`,`basket_id`,`batch_id`,`life_status`,`coat_color`,`dead_date`,`dead`,`onwer_id`,`created_by`,`is_dead`,`description`,`created_at`,`updated_at`,`breed_id`) VALUES ('29','1',NULL,NULL,'2015-07-02',NULL,NULL,'4','13',NULL,NULL,'A',NULL,NULL,NULL,'3','1','0',NULL,'2015-07-01 06:52:17','2015-07-01 07:25:19',NULL);
INSERT INTO `mice` (`id`,`strain_id`,`code`,`generation`,`birthday`,`wean_date`,`sex`,`father_id`,`mother_id`,`basket_id`,`batch_id`,`life_status`,`coat_color`,`dead_date`,`dead`,`onwer_id`,`created_by`,`is_dead`,`description`,`created_at`,`updated_at`,`breed_id`) VALUES ('30','1','','','2015-07-02','2015-07-05','M','4','13','21',NULL,'A','??',NULL,NULL,'2','1','0',NULL,'2015-07-01 06:52:17','2015-07-09 07:23:19',NULL);
INSERT INTO `mice` (`id`,`strain_id`,`code`,`generation`,`birthday`,`wean_date`,`sex`,`father_id`,`mother_id`,`basket_id`,`batch_id`,`life_status`,`coat_color`,`dead_date`,`dead`,`onwer_id`,`created_by`,`is_dead`,`description`,`created_at`,`updated_at`,`breed_id`) VALUES ('31','1','','','2015-07-02','2015-07-07','F','4','13','76',NULL,'K','??','2015-07-10',NULL,'2','1','0','','2015-07-01 06:54:23','2015-07-06 09:38:13',NULL);
INSERT INTO `mice` (`id`,`strain_id`,`code`,`generation`,`birthday`,`wean_date`,`sex`,`father_id`,`mother_id`,`basket_id`,`batch_id`,`life_status`,`coat_color`,`dead_date`,`dead`,`onwer_id`,`created_by`,`is_dead`,`description`,`created_at`,`updated_at`,`breed_id`) VALUES ('32','1','123434','4','2015-07-02','2015-07-09','F','4','13','21',NULL,'A','??',NULL,NULL,'2','1','0',NULL,'2015-07-01 06:54:23','2015-07-10 05:16:25',NULL);
INSERT INTO `mice` (`id`,`strain_id`,`code`,`generation`,`birthday`,`wean_date`,`sex`,`father_id`,`mother_id`,`basket_id`,`batch_id`,`life_status`,`coat_color`,`dead_date`,`dead`,`onwer_id`,`created_by`,`is_dead`,`description`,`created_at`,`updated_at`,`breed_id`) VALUES ('33','1','12435','','2015-07-02','2015-07-09','F','4','13','21',NULL,'A','??',NULL,NULL,'2','1','0',NULL,'2015-07-01 06:54:23','2015-07-14 09:11:34',NULL);
INSERT INTO `mice` (`id`,`strain_id`,`code`,`generation`,`birthday`,`wean_date`,`sex`,`father_id`,`mother_id`,`basket_id`,`batch_id`,`life_status`,`coat_color`,`dead_date`,`dead`,`onwer_id`,`created_by`,`is_dead`,`description`,`created_at`,`updated_at`,`breed_id`) VALUES ('34','1','123431','3','2015-07-06','2015-07-10','M','30','27','33',NULL,'A','??',NULL,NULL,'2','2','0',NULL,'2015-07-06 09:52:10','2015-07-09 09:53:09',NULL);
INSERT INTO `mice` (`id`,`strain_id`,`code`,`generation`,`birthday`,`wean_date`,`sex`,`father_id`,`mother_id`,`basket_id`,`batch_id`,`life_status`,`coat_color`,`dead_date`,`dead`,`onwer_id`,`created_by`,`is_dead`,`description`,`created_at`,`updated_at`,`breed_id`) VALUES ('35','1','76575','4','2015-07-06','2015-07-10','F','30','27','32',NULL,'A','??',NULL,NULL,'2','2','0',NULL,'2015-07-06 09:52:10','2015-07-10 05:35:23',NULL);
INSERT INTO `mice` (`id`,`strain_id`,`code`,`generation`,`birthday`,`wean_date`,`sex`,`father_id`,`mother_id`,`basket_id`,`batch_id`,`life_status`,`coat_color`,`dead_date`,`dead`,`onwer_id`,`created_by`,`is_dead`,`description`,`created_at`,`updated_at`,`breed_id`) VALUES ('36','1','85643','3','2015-07-06','2015-07-25','F','30','27','32',NULL,'A','??',NULL,NULL,'2','2','0',NULL,'2015-07-06 09:52:10','2015-07-10 05:35:26',NULL);
INSERT INTO `mice` (`id`,`strain_id`,`code`,`generation`,`birthday`,`wean_date`,`sex`,`father_id`,`mother_id`,`basket_id`,`batch_id`,`life_status`,`coat_color`,`dead_date`,`dead`,`onwer_id`,`created_by`,`is_dead`,`description`,`created_at`,`updated_at`,`breed_id`) VALUES ('37','1','57824','5','2015-07-06','2015-07-24','M','30','27','21',NULL,'K','??','2015-07-24',NULL,'2','2','0','adfadfda','2015-07-06 09:52:10','2015-07-09 06:10:27',NULL);
INSERT INTO `mice` (`id`,`strain_id`,`code`,`generation`,`birthday`,`wean_date`,`sex`,`father_id`,`mother_id`,`basket_id`,`batch_id`,`life_status`,`coat_color`,`dead_date`,`dead`,`onwer_id`,`created_by`,`is_dead`,`description`,`created_at`,`updated_at`,`breed_id`) VALUES ('38','1','37679','2','2015-07-06','2015-07-31','M','30','27',NULL,NULL,'A','??',NULL,NULL,'2','2','0',NULL,'2015-07-06 09:52:10','2015-07-07 07:46:00',NULL);
INSERT INTO `mice` (`id`,`strain_id`,`code`,`generation`,`birthday`,`wean_date`,`sex`,`father_id`,`mother_id`,`basket_id`,`batch_id`,`life_status`,`coat_color`,`dead_date`,`dead`,`onwer_id`,`created_by`,`is_dead`,`description`,`created_at`,`updated_at`,`breed_id`) VALUES ('39','1',NULL,NULL,'2015-05-28',NULL,NULL,'23','24','1',NULL,'A',NULL,NULL,NULL,'3','3','0',NULL,'2015-07-06 10:12:42','2015-07-06 10:12:42',NULL);
INSERT INTO `mice` (`id`,`strain_id`,`code`,`generation`,`birthday`,`wean_date`,`sex`,`father_id`,`mother_id`,`basket_id`,`batch_id`,`life_status`,`coat_color`,`dead_date`,`dead`,`onwer_id`,`created_by`,`is_dead`,`description`,`created_at`,`updated_at`,`breed_id`) VALUES ('40','1',NULL,NULL,'2015-05-28',NULL,NULL,'23','24',NULL,NULL,'A',NULL,NULL,NULL,'3','3','0',NULL,'2015-07-06 10:12:42','2015-07-07 07:52:55',NULL);
INSERT INTO `mice` (`id`,`strain_id`,`code`,`generation`,`birthday`,`wean_date`,`sex`,`father_id`,`mother_id`,`basket_id`,`batch_id`,`life_status`,`coat_color`,`dead_date`,`dead`,`onwer_id`,`created_by`,`is_dead`,`description`,`created_at`,`updated_at`,`breed_id`) VALUES ('41','1',NULL,NULL,'2015-05-28',NULL,NULL,'23','24','1',NULL,'A',NULL,NULL,NULL,'3','3','0',NULL,'2015-07-06 10:12:42','2015-07-06 10:12:42',NULL);
INSERT INTO `mice` (`id`,`strain_id`,`code`,`generation`,`birthday`,`wean_date`,`sex`,`father_id`,`mother_id`,`basket_id`,`batch_id`,`life_status`,`coat_color`,`dead_date`,`dead`,`onwer_id`,`created_by`,`is_dead`,`description`,`created_at`,`updated_at`,`breed_id`) VALUES ('42','1',NULL,NULL,'2015-05-28',NULL,NULL,'23','24','1',NULL,'A',NULL,NULL,NULL,'3','3','0',NULL,'2015-07-06 10:12:42','2015-07-06 10:12:42',NULL);
INSERT INTO `mice` (`id`,`strain_id`,`code`,`generation`,`birthday`,`wean_date`,`sex`,`father_id`,`mother_id`,`basket_id`,`batch_id`,`life_status`,`coat_color`,`dead_date`,`dead`,`onwer_id`,`created_by`,`is_dead`,`description`,`created_at`,`updated_at`,`breed_id`) VALUES ('43','1',NULL,NULL,'2015-05-28',NULL,NULL,'23','24','1',NULL,'A',NULL,NULL,NULL,'3','3','0',NULL,'2015-07-06 10:12:42','2015-07-06 10:12:42',NULL);
INSERT INTO `mice` (`id`,`strain_id`,`code`,`generation`,`birthday`,`wean_date`,`sex`,`father_id`,`mother_id`,`basket_id`,`batch_id`,`life_status`,`coat_color`,`dead_date`,`dead`,`onwer_id`,`created_by`,`is_dead`,`description`,`created_at`,`updated_at`,`breed_id`) VALUES ('44','1',NULL,NULL,'2015-07-07',NULL,NULL,'11','8','11','8','DD',NULL,'2015-07-10',NULL,'3','3','0','','2015-07-07 08:35:23','2015-07-08 09:36:23',NULL);
INSERT INTO `mice` (`id`,`strain_id`,`code`,`generation`,`birthday`,`wean_date`,`sex`,`father_id`,`mother_id`,`basket_id`,`batch_id`,`life_status`,`coat_color`,`dead_date`,`dead`,`onwer_id`,`created_by`,`is_dead`,`description`,`created_at`,`updated_at`,`breed_id`) VALUES ('45','1',NULL,NULL,'2015-07-07',NULL,NULL,'11','8','11','8','A',NULL,NULL,NULL,'3','3','0',NULL,'2015-07-07 08:35:23','2015-07-07 08:35:23',NULL);
INSERT INTO `mice` (`id`,`strain_id`,`code`,`generation`,`birthday`,`wean_date`,`sex`,`father_id`,`mother_id`,`basket_id`,`batch_id`,`life_status`,`coat_color`,`dead_date`,`dead`,`onwer_id`,`created_by`,`is_dead`,`description`,`created_at`,`updated_at`,`breed_id`) VALUES ('46','1',NULL,NULL,'2015-07-07',NULL,NULL,'11','8','11','8','DD',NULL,'2015-07-17',NULL,'3','3','0','','2015-07-07 08:35:23','2015-07-08 09:36:34',NULL);
INSERT INTO `mice` (`id`,`strain_id`,`code`,`generation`,`birthday`,`wean_date`,`sex`,`father_id`,`mother_id`,`basket_id`,`batch_id`,`life_status`,`coat_color`,`dead_date`,`dead`,`onwer_id`,`created_by`,`is_dead`,`description`,`created_at`,`updated_at`,`breed_id`) VALUES ('47','1',NULL,NULL,'2015-07-07',NULL,NULL,'11','8','11','8','A',NULL,NULL,NULL,'3','3','0',NULL,'2015-07-07 08:35:23','2015-07-07 08:35:23',NULL);
INSERT INTO `mice` (`id`,`strain_id`,`code`,`generation`,`birthday`,`wean_date`,`sex`,`father_id`,`mother_id`,`basket_id`,`batch_id`,`life_status`,`coat_color`,`dead_date`,`dead`,`onwer_id`,`created_by`,`is_dead`,`description`,`created_at`,`updated_at`,`breed_id`) VALUES ('48','1','523462','','2015-07-07','2015-07-25',NULL,'11','8','11','8','A','??',NULL,NULL,'3','3','0',NULL,'2015-07-07 08:35:23','2015-07-08 09:44:23',NULL);
INSERT INTO `mice` (`id`,`strain_id`,`code`,`generation`,`birthday`,`wean_date`,`sex`,`father_id`,`mother_id`,`basket_id`,`batch_id`,`life_status`,`coat_color`,`dead_date`,`dead`,`onwer_id`,`created_by`,`is_dead`,`description`,`created_at`,`updated_at`,`breed_id`) VALUES ('49','1','','','2015-07-13',NULL,'M','34','27',NULL,'9','A','??',NULL,NULL,'2','2','0',NULL,'2015-07-10 05:25:51','2015-07-13 09:51:21',NULL);
INSERT INTO `mice` (`id`,`strain_id`,`code`,`generation`,`birthday`,`wean_date`,`sex`,`father_id`,`mother_id`,`basket_id`,`batch_id`,`life_status`,`coat_color`,`dead_date`,`dead`,`onwer_id`,`created_by`,`is_dead`,`description`,`created_at`,`updated_at`,`breed_id`) VALUES ('50','1',NULL,NULL,'2015-07-13',NULL,NULL,'34','27','33','9','A',NULL,NULL,NULL,'2','2','0',NULL,'2015-07-10 05:25:51','2015-07-10 05:25:51',NULL);
INSERT INTO `mice` (`id`,`strain_id`,`code`,`generation`,`birthday`,`wean_date`,`sex`,`father_id`,`mother_id`,`basket_id`,`batch_id`,`life_status`,`coat_color`,`dead_date`,`dead`,`onwer_id`,`created_by`,`is_dead`,`description`,`created_at`,`updated_at`,`breed_id`) VALUES ('51','1',NULL,NULL,'2015-07-13',NULL,NULL,'34','27','33','9','A',NULL,NULL,NULL,'2','2','0',NULL,'2015-07-10 05:25:51','2015-07-10 05:25:51',NULL);
INSERT INTO `mice` (`id`,`strain_id`,`code`,`generation`,`birthday`,`wean_date`,`sex`,`father_id`,`mother_id`,`basket_id`,`batch_id`,`life_status`,`coat_color`,`dead_date`,`dead`,`onwer_id`,`created_by`,`is_dead`,`description`,`created_at`,`updated_at`,`breed_id`) VALUES ('52','1','25212','5','2015-07-13','2015-07-15','F','34','27','102','9','A','??',NULL,NULL,'2','2','0',NULL,'2015-07-10 05:25:51','2015-07-10 05:54:58',NULL);
INSERT INTO `mice` (`id`,`strain_id`,`code`,`generation`,`birthday`,`wean_date`,`sex`,`father_id`,`mother_id`,`basket_id`,`batch_id`,`life_status`,`coat_color`,`dead_date`,`dead`,`onwer_id`,`created_by`,`is_dead`,`description`,`created_at`,`updated_at`,`breed_id`) VALUES ('53','1','4536364','4F','2015-03-01','2015-04-09','M',NULL,NULL,'15',NULL,'K','??',NULL,NULL,'2','2','0',NULL,'2015-07-13 08:48:24','2015-07-13 08:48:24',NULL);


# Dump of table mice_alleles
# ------------------------------------------------------------

CREATE TABLE `mice_alleles` (
  `mouse_id` int(11) DEFAULT NULL,
  `allele_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `mice_alleles` (`mouse_id`,`allele_id`) VALUES ('2','1');
INSERT INTO `mice_alleles` (`mouse_id`,`allele_id`) VALUES ('3','1');
INSERT INTO `mice_alleles` (`mouse_id`,`allele_id`) VALUES ('5','1');
INSERT INTO `mice_alleles` (`mouse_id`,`allele_id`) VALUES ('5','5');
INSERT INTO `mice_alleles` (`mouse_id`,`allele_id`) VALUES ('5','8');
INSERT INTO `mice_alleles` (`mouse_id`,`allele_id`) VALUES ('2','5');
INSERT INTO `mice_alleles` (`mouse_id`,`allele_id`) VALUES ('2','8');
INSERT INTO `mice_alleles` (`mouse_id`,`allele_id`) VALUES ('4','1');
INSERT INTO `mice_alleles` (`mouse_id`,`allele_id`) VALUES ('4','8');
INSERT INTO `mice_alleles` (`mouse_id`,`allele_id`) VALUES ('6','8');
INSERT INTO `mice_alleles` (`mouse_id`,`allele_id`) VALUES ('8','8');
INSERT INTO `mice_alleles` (`mouse_id`,`allele_id`) VALUES ('7','2');
INSERT INTO `mice_alleles` (`mouse_id`,`allele_id`) VALUES ('7','11');
INSERT INTO `mice_alleles` (`mouse_id`,`allele_id`) VALUES ('7','5');
INSERT INTO `mice_alleles` (`mouse_id`,`allele_id`) VALUES ('9','8');
INSERT INTO `mice_alleles` (`mouse_id`,`allele_id`) VALUES ('10','1');
INSERT INTO `mice_alleles` (`mouse_id`,`allele_id`) VALUES ('10','5');
INSERT INTO `mice_alleles` (`mouse_id`,`allele_id`) VALUES ('10','8');
INSERT INTO `mice_alleles` (`mouse_id`,`allele_id`) VALUES ('52','1');
INSERT INTO `mice_alleles` (`mouse_id`,`allele_id`) VALUES ('52','5');
INSERT INTO `mice_alleles` (`mouse_id`,`allele_id`) VALUES ('52','8');
INSERT INTO `mice_alleles` (`mouse_id`,`allele_id`) VALUES ('49','4');
INSERT INTO `mice_alleles` (`mouse_id`,`allele_id`) VALUES ('49','6');
INSERT INTO `mice_alleles` (`mouse_id`,`allele_id`) VALUES ('49','14');
INSERT INTO `mice_alleles` (`mouse_id`,`allele_id`) VALUES ('53','1');
INSERT INTO `mice_alleles` (`mouse_id`,`allele_id`) VALUES ('53','5');
INSERT INTO `mice_alleles` (`mouse_id`,`allele_id`) VALUES ('53','8');


# Dump of table operations
# ------------------------------------------------------------

CREATE TABLE `operations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `strain_id` int(11) DEFAULT NULL,
  `mouse_id` int(11) DEFAULT NULL,
  `operate_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `old_basket` int(11) DEFAULT NULL,
  `new_basket` int(11) DEFAULT NULL,
  `operate_by` int(11) DEFAULT NULL,
  `operate_at` date DEFAULT NULL,
  `remark` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table roles
# ------------------------------------------------------------

CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `resource_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_roles_on_name` (`name`),
  KEY `index_roles_on_name_and_resource_type_and_resource_id` (`name`,`resource_type`,`resource_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `roles` (`id`,`name`,`resource_id`,`resource_type`,`created_at`,`updated_at`) VALUES ('1','PI',NULL,NULL,'2015-06-04 07:55:52','2015-06-04 07:55:52');
INSERT INTO `roles` (`id`,`name`,`resource_id`,`resource_type`,`created_at`,`updated_at`) VALUES ('2','Manager',NULL,NULL,'2015-06-11 08:03:11','2015-06-11 08:03:11');
INSERT INTO `roles` (`id`,`name`,`resource_id`,`resource_type`,`created_at`,`updated_at`) VALUES ('3','Faculty',NULL,NULL,'2015-06-11 08:03:11','2015-06-11 08:03:11');


# Dump of table schema_migrations
# ------------------------------------------------------------

CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `schema_migrations` (`version`) VALUES ('20150313173320');
INSERT INTO `schema_migrations` (`version`) VALUES ('20150313173743');
INSERT INTO `schema_migrations` (`version`) VALUES ('20150414025234');
INSERT INTO `schema_migrations` (`version`) VALUES ('20150414032326');
INSERT INTO `schema_migrations` (`version`) VALUES ('20150414052810');
INSERT INTO `schema_migrations` (`version`) VALUES ('20150414053913');
INSERT INTO `schema_migrations` (`version`) VALUES ('20150416101456');
INSERT INTO `schema_migrations` (`version`) VALUES ('20150429035558');
INSERT INTO `schema_migrations` (`version`) VALUES ('20150514080409');
INSERT INTO `schema_migrations` (`version`) VALUES ('20150601064631');
INSERT INTO `schema_migrations` (`version`) VALUES ('20150601064838');
INSERT INTO `schema_migrations` (`version`) VALUES ('20150601065038');
INSERT INTO `schema_migrations` (`version`) VALUES ('20150601090524');
INSERT INTO `schema_migrations` (`version`) VALUES ('20150608092954');
INSERT INTO `schema_migrations` (`version`) VALUES ('20150706081242');
INSERT INTO `schema_migrations` (`version`) VALUES ('20150707045549');
INSERT INTO `schema_migrations` (`version`) VALUES ('20150713094751');


# Dump of table strains
# ------------------------------------------------------------

CREATE TABLE `strains` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `former_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `common_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `genetic_type_id` int(11) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `coat_color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wean_age` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `female_mature_age` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `male_mature_age` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mating_system` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `breeding_consideration` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `origin` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ref_website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `strains` (`id`,`former_name`,`common_name`,`genetic_type_id`,`status`,`coat_color`,`wean_age`,`female_mature_age`,`male_mature_age`,`mating_system`,`breeding_consideration`,`source`,`origin`,`ref_website`,`description`,`created_at`,`updated_at`) VALUES ('1','C58-mir21','C58-mir21','6','A','??,??,??,??,??','common_name','common_name','common_name','common_name','common_name','common_name','common_name','common_name','qewrwer','2015-06-04 10:25:15','2015-07-14 07:52:24');
INSERT INTO `strains` (`id`,`former_name`,`common_name`,`genetic_type_id`,`status`,`coat_color`,`wean_age`,`female_mature_age`,`male_mature_age`,`mating_system`,`breeding_consideration`,`source`,`origin`,`ref_website`,`description`,`created_at`,`updated_at`) VALUES ('2','C57-miR202','C57-miR202','1','A','adf,adfa,dafa,sfa','','','','afds','afsf','af','afd','adf','adfa','2015-06-05 02:08:42','2015-06-08 09:15:47');
INSERT INTO `strains` (`id`,`former_name`,`common_name`,`genetic_type_id`,`status`,`coat_color`,`wean_age`,`female_mature_age`,`male_mature_age`,`mating_system`,`breeding_consideration`,`source`,`origin`,`ref_website`,`description`,`created_at`,`updated_at`) VALUES ('3','C57-mir191','C57-mir191','3','F','fasdf','','','','','','','','','fadfdfads','2015-06-05 05:35:46','2015-06-08 09:22:34');
INSERT INTO `strains` (`id`,`former_name`,`common_name`,`genetic_type_id`,`status`,`coat_color`,`wean_age`,`female_mature_age`,`male_mature_age`,`mating_system`,`breeding_consideration`,`source`,`origin`,`ref_website`,`description`,`created_at`,`updated_at`) VALUES ('4','C57-miR223','C57-miR223','1','A','QD,QDQW','C57-miR223','C57-miR223','C57-miR223','C57-miR223','C57-miR223','C57-miR223','C57-miR223','C57-miR223','C57-miR223','2015-06-08 09:04:43','2015-06-08 09:04:43');


# Dump of table strains_genes
# ------------------------------------------------------------

CREATE TABLE `strains_genes` (
  `strain_id` int(11) DEFAULT NULL,
  `gene_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `strains_genes` (`strain_id`,`gene_id`) VALUES ('1','1');
INSERT INTO `strains_genes` (`strain_id`,`gene_id`) VALUES ('3','2');
INSERT INTO `strains_genes` (`strain_id`,`gene_id`) VALUES ('1','2');
INSERT INTO `strains_genes` (`strain_id`,`gene_id`) VALUES ('2','1');
INSERT INTO `strains_genes` (`strain_id`,`gene_id`) VALUES ('3','1');
INSERT INTO `strains_genes` (`strain_id`,`gene_id`) VALUES ('1','3');
INSERT INTO `strains_genes` (`strain_id`,`gene_id`) VALUES ('4','3');
INSERT INTO `strains_genes` (`strain_id`,`gene_id`) VALUES ('2','2');
INSERT INTO `strains_genes` (`strain_id`,`gene_id`) VALUES ('2','3');
INSERT INTO `strains_genes` (`strain_id`,`gene_id`) VALUES ('5','1');
INSERT INTO `strains_genes` (`strain_id`,`gene_id`) VALUES ('5','2');
INSERT INTO `strains_genes` (`strain_id`,`gene_id`) VALUES ('5','3');


# Dump of table todo_lists
# ------------------------------------------------------------

CREATE TABLE `todo_lists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mouse_id` int(11) DEFAULT NULL,
  `operation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `todo_lists` (`id`,`mouse_id`,`operation`,`description`,`status`,`created_at`,`updated_at`,`created_by`) VALUES ('1','2','S','afdafsd','C','2015-06-09 06:00:02','2015-07-10 09:45:03',NULL);
INSERT INTO `todo_lists` (`id`,`mouse_id`,`operation`,`description`,`status`,`created_at`,`updated_at`,`created_by`) VALUES ('2','10','M','qffwqfefq','D','2015-06-15 02:32:34','2015-06-15 02:32:34',NULL);
INSERT INTO `todo_lists` (`id`,`mouse_id`,`operation`,`description`,`status`,`created_at`,`updated_at`,`created_by`) VALUES ('3','38','E','bgagdgadsf','D','2015-07-10 06:29:21','2015-07-10 09:25:05',NULL);
INSERT INTO `todo_lists` (`id`,`mouse_id`,`operation`,`description`,`status`,`created_at`,`updated_at`,`created_by`) VALUES ('4','36','M','gfaa','D','2015-07-10 08:33:22','2015-07-10 09:44:59',NULL);
INSERT INTO `todo_lists` (`id`,`mouse_id`,`operation`,`description`,`status`,`created_at`,`updated_at`,`created_by`) VALUES ('5','34','E','','F','2015-07-10 08:33:37','2015-07-13 01:56:28',NULL);


# Dump of table users
# ------------------------------------------------------------

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `confirmation_sent_at` datetime DEFAULT NULL,
  `unconfirmed_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `failed_attempts` int(11) NOT NULL DEFAULT '0',
  `unlock_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locked_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `users` (`id`,`full_name`,`username`,`email`,`encrypted_password`,`name`,`reset_password_token`,`reset_password_sent_at`,`remember_created_at`,`sign_in_count`,`current_sign_in_at`,`last_sign_in_at`,`current_sign_in_ip`,`last_sign_in_ip`,`confirmation_token`,`confirmed_at`,`confirmation_sent_at`,`unconfirmed_email`,`failed_attempts`,`unlock_token`,`locked_at`,`created_at`,`updated_at`) VALUES ('1','PI','admin','admin@email.com','$2a$10$lbEyqJ3o3LtSP54sqEFYBuHokixHyFTLv0J99F2Mfc0SOOnRnbyKi',NULL,NULL,NULL,NULL,'12','2015-07-14 07:29:22','2015-07-13 07:48:09','::1','192.168.0.4',NULL,NULL,NULL,NULL,'0',NULL,NULL,'2015-06-04 07:55:52','2015-07-14 07:29:22');
INSERT INTO `users` (`id`,`full_name`,`username`,`email`,`encrypted_password`,`name`,`reset_password_token`,`reset_password_sent_at`,`remember_created_at`,`sign_in_count`,`current_sign_in_at`,`last_sign_in_at`,`current_sign_in_ip`,`last_sign_in_ip`,`confirmation_token`,`confirmed_at`,`confirmation_sent_at`,`unconfirmed_email`,`failed_attempts`,`unlock_token`,`locked_at`,`created_at`,`updated_at`) VALUES ('2','liushuai','liushuai','759983462@qq.com','$2a$10$h9tsy1IK1mJCiWypzrC/Duxio.bmjH.pWMDXdwPf9bTP3NypFeBsO',NULL,NULL,NULL,NULL,'7','2015-07-14 07:37:18','2015-07-07 01:57:07','::1','::1',NULL,'2015-06-11 08:03:11','2015-06-11 08:03:11',NULL,'0',NULL,NULL,'2015-06-11 08:03:11','2015-07-14 07:37:18');
INSERT INTO `users` (`id`,`full_name`,`username`,`email`,`encrypted_password`,`name`,`reset_password_token`,`reset_password_sent_at`,`remember_created_at`,`sign_in_count`,`current_sign_in_at`,`last_sign_in_at`,`current_sign_in_ip`,`last_sign_in_ip`,`confirmation_token`,`confirmed_at`,`confirmation_sent_at`,`unconfirmed_email`,`failed_attempts`,`unlock_token`,`locked_at`,`created_at`,`updated_at`) VALUES ('3','test_1','test_1','test1@qq.com','$2a$10$7Yf4ONfva/CY0h3FOrGsquBtZ6H/tp24sYKIHLBUV1.qbebge4tPK',NULL,NULL,NULL,NULL,'2','2015-07-07 07:48:24','2015-07-06 03:58:45','::1','::1',NULL,'2015-07-03 07:48:29','2015-07-03 07:48:29',NULL,'0',NULL,NULL,'2015-07-03 07:48:29','2015-07-07 07:48:24');
INSERT INTO `users` (`id`,`full_name`,`username`,`email`,`encrypted_password`,`name`,`reset_password_token`,`reset_password_sent_at`,`remember_created_at`,`sign_in_count`,`current_sign_in_at`,`last_sign_in_at`,`current_sign_in_ip`,`last_sign_in_ip`,`confirmation_token`,`confirmed_at`,`confirmation_sent_at`,`unconfirmed_email`,`failed_attempts`,`unlock_token`,`locked_at`,`created_at`,`updated_at`) VALUES ('4','test_2','test_2','test_2@qq.com','$2a$10$OGg/rbsufjwzSoL7hx3cQO4KH2sRHHKrER8uVV1PvCScce/pILtui',NULL,NULL,NULL,NULL,'3','2015-07-13 07:49:16','2015-07-13 07:47:40','192.168.0.4','192.168.0.4',NULL,'2015-07-03 07:49:05','2015-07-03 07:49:05',NULL,'0',NULL,NULL,'2015-07-03 07:49:05','2015-07-13 07:49:16');


# Dump of table users_roles
# ------------------------------------------------------------

CREATE TABLE `users_roles` (
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  KEY `index_users_roles_on_user_id_and_role_id` (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `users_roles` (`user_id`,`role_id`) VALUES ('1','1');
INSERT INTO `users_roles` (`user_id`,`role_id`) VALUES ('2','2');
INSERT INTO `users_roles` (`user_id`,`role_id`) VALUES ('3','2');
INSERT INTO `users_roles` (`user_id`,`role_id`) VALUES ('4','3');


