-- MySQL dump 10.13  Distrib 5.6.10, for Win64 (x86_64)
--
-- Host: localhost    Database: mmorder
-- ------------------------------------------------------
-- Server version	5.6.10

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add cart',7,'add_cart'),(20,'Can change cart',7,'change_cart'),(21,'Can delete cart',7,'delete_cart'),(22,'Can add foods',8,'add_foods'),(23,'Can change foods',8,'change_foods'),(24,'Can delete foods',8,'delete_foods'),(25,'Can add foods type',9,'add_foodstype'),(26,'Can change foods type',9,'change_foodstype'),(27,'Can delete foods type',9,'delete_foodstype'),(28,'Can add order',10,'add_order'),(29,'Can change order',10,'change_order'),(30,'Can delete order',10,'delete_order'),(31,'Can add orderdetail',11,'add_orderdetail'),(32,'Can change orderdetail',11,'change_orderdetail'),(33,'Can delete orderdetail',11,'delete_orderdetail');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'123456',NULL,0,'zz','z','z','110',1,1,'2019-03-23 10:50:18.000000'),(2,'pbkdf2_sha256$100000$xy7kzVbJk4Nj$/I903mfKOdQfgHS5vF7mg8IrgtlhaUJp9k2mlEIEqMc=',NULL,0,'赵炤','','','15339030310@163.com',0,1,'2019-03-29 07:36:03.159162');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'mmorder','cart'),(8,'mmorder','foods'),(9,'mmorder','foodstype'),(10,'mmorder','order'),(11,'mmorder','orderdetail'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-03-23 02:39:26.943005'),(2,'auth','0001_initial','2019-03-23 02:39:39.436998'),(3,'admin','0001_initial','2019-03-23 02:39:41.821005'),(4,'admin','0002_logentry_remove_auto_add','2019-03-23 02:39:41.847022'),(5,'contenttypes','0002_remove_content_type_name','2019-03-23 02:39:43.842570'),(6,'auth','0002_alter_permission_name_max_length','2019-03-23 02:39:44.725208'),(7,'auth','0003_alter_user_email_max_length','2019-03-23 02:39:45.724915'),(8,'auth','0004_alter_user_username_opts','2019-03-23 02:39:45.756925'),(9,'auth','0005_alter_user_last_login_null','2019-03-23 02:39:46.751628'),(10,'auth','0006_require_contenttypes_0002','2019-03-23 02:39:46.778649'),(11,'auth','0007_alter_validators_add_error_messages','2019-03-23 02:39:46.810669'),(12,'auth','0008_alter_user_username_max_length','2019-03-23 02:39:47.814394'),(13,'auth','0009_alter_user_last_name_max_length','2019-03-23 02:39:49.035281'),(14,'mmorder','0001_initial','2019-03-23 02:39:57.884709'),(15,'sessions','0001_initial','2019-03-23 02:39:58.706300'),(16,'mmorder','0002_remove_foods_fstorenum','2019-03-28 09:21:32.969993'),(17,'mmorder','0003_auto_20190328_1907','2019-03-28 11:07:22.455259'),(18,'mmorder','0004_auto_20190329_1110','2019-03-29 03:10:52.553251');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('6grtfn93f39tp7bs8ycwwt3oyzcwqh5p','MzEzNWIyZTYyN2JjODE3NjYyNTBkNzRlMTZlOWFlYzUzYjQxYzNjYzp7ImVycm9yX21lc3NhZ2UiOiJcdTYwYThcdThmZDhcdTY3MmFcdTc2N2JcdTVmNTVcdWZmMGNcdThiZjdcdTUxNDhcdTc2N2JcdTVmNTVcdWZmMDEifQ==','2019-04-12 07:33:42.383613'),('kkdohnwixnwfr7lg17qjiqw1avz09loo','NGMxYTQ5NTVlZjE0YWJiMGY2YTFjODQyYjQ2ODcwYzE2MThlYjU0MDp7ImVycm9yX21lc3NhZ2UiOiJcdTYwYThcdThmZDhcdTY3MmFcdTc2N2JcdTVmNTVcdWZmMGNcdThiZjdcdTUxNDhcdTc2N2JcdTVmNTVcdWZmMDEiLCJ1c2VyX2lkIjoyfQ==','2019-04-12 07:36:09.961620'),('zbnz27pkq9cq3ivsswv80c6qh0yumf94','NGMxYTQ5NTVlZjE0YWJiMGY2YTFjODQyYjQ2ODcwYzE2MThlYjU0MDp7ImVycm9yX21lc3NhZ2UiOiJcdTYwYThcdThmZDhcdTY3MmFcdTc2N2JcdTVmNTVcdWZmMGNcdThiZjdcdTUxNDhcdTc2N2JcdTVmNTVcdWZmMDEiLCJ1c2VyX2lkIjoyfQ==','2019-04-12 08:05:58.707272');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mm_cart`
--

DROP TABLE IF EXISTS `mm_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mm_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_foods_num` int(11) NOT NULL,
  `is_selected` tinyint(1) NOT NULL,
  `foods_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mm_cart_foods_id_0d72dc13_fk_mm_foods_fid` (`foods_id`),
  KEY `mm_cart_user_id_67dfcb4d_fk_auth_user_id` (`user_id`),
  CONSTRAINT `mm_cart_foods_id_0d72dc13_fk_mm_foods_fid` FOREIGN KEY (`foods_id`) REFERENCES `mm_foods` (`fid`),
  CONSTRAINT `mm_cart_user_id_67dfcb4d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mm_cart`
--

LOCK TABLES `mm_cart` WRITE;
/*!40000 ALTER TABLE `mm_cart` DISABLE KEYS */;
INSERT INTO `mm_cart` VALUES (41,5,1,16,1),(49,5,1,9,1);
/*!40000 ALTER TABLE `mm_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mm_foods`
--

DROP TABLE IF EXISTS `mm_foods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mm_foods` (
  `fid` int(11) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `fcategory` varchar(20) NOT NULL,
  `fprice` double NOT NULL,
  `fpopnum` int(11) NOT NULL,
  `fimg` varchar(100) NOT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mm_foods`
--

LOCK TABLES `mm_foods` WRITE;
/*!40000 ALTER TABLE `mm_foods` DISABLE KEYS */;
INSERT INTO `mm_foods` VALUES (1,'XO酱肠粉','中华菜系',30,348,'https://s1.st.meishij.net/r/02/165/666252/a666252_151599769171842.jpg'),(2,'糖醋豆腐','中华菜系',36,416,'https://s1.st.meishij.net/r/102/220/13242602/a13242602_154398377107983.jpg'),(3,'农家小炒肉','中华菜系',26,297,'https://s1.st.meishij.net/r/09/29/13132259/a13132259_155088726506357.jpg'),(4,'私房小炒肉','中华菜系',40,338,'https://s1.st.meishij.net/r/102/220/13242602/a13242602_154381870988971.jpg'),(5,'蒜苗回锅肉','中华菜系',25,375,'https://s1.st.meishij.net/r/41/203/113291/a113291_155082461119028.jpg'),(6,'自制意大利青酱','国外菜谱',21,367,'https://s1.st.meishij.net/r/31/161/2290281/a2290281_32414.jpg'),(7,'铁板豆腐','中华菜系',40,5350,'https://s1.st.meishij.net/r/41/203/113291/a113291_154339680588737.jpg'),(8,'双味卷肠粉','中华菜系',33,425,'https://s1.st.meishij.net/r/155/126/5469155/a5469155_151662683111446.jpg'),(9,'青咖喱椰香鸡','国外菜谱',23,371,'https://s1.st.meishij.net/r/31/161/2290281/a2290281_92464.jpg'),(10,'口水猪肝','中华菜系',21,5507,'https://s1.st.meishij.net/r/19/99/9087269/a9087269_154287519480154.jpg'),(11,'花菜香肠披萨','国外菜谱',23,6877,'http://site.meishij.net/r/245/13/2378495/a2378495_149126795680476.jpg'),(12,'叉烧肉','中华菜系',29,486,'https://s1.st.meishij.net/r/41/203/113291/a113291_154469246342603.jpg'),(13,'法式果汁糖','国外菜谱',31,430,'https://s1.st.meishij.net/r/05/112/8653005/a8653005_154233332181487.jpg'),(14,'家常酸菜鱼','中华菜系',31,296,'https://s1.st.meishij.net/r/102/220/13242602/a13242602_154278747314922.jpg'),(15,'手工意大利面视频教程','国外菜谱',29,7877,'http://site.meishij.net/r/134/204/5801134/a5801134_149108044752590.jpg'),(16,'椰香艾窝窝','各地小吃',20,4294,'http://site.meishij.net/r/105/225/1306355/a1306355_151436440714026.jpg'),(17,'四川宫保鸡丁','中华菜系',23,373,'https://s1.st.meishij.net/r/41/203/113291/a113291_154805612732655.jpg'),(18,'寿喜烧','国外菜谱',38,11013,'http://site.meishij.net/r/78/120/30078/a30078_150893979724870.jpg'),(19,'地三鲜','中华菜系',35,262,'https://s1.st.meishij.net/r/83/142/410583/a410583_153728407302198.jpg'),(20,'麻辣凉皮','各地小吃',28,344,'https://s1.st.meishij.net/r/208/36/1259208/a1259208_60890.jpg'),(21,'寿司的制作','国外菜谱',20,10356,'http://site.meishij.net/r/219/122/4468219/a4468219_149028082773300.jpg'),(22,'南瓜红枣发糕','各地小吃',34,4031,'http://site.meishij.net/r/234/121/9905484/a9905484_151430023950204.jpg'),(23,'辣子鸡块','中华菜系',35,313,'https://s1.st.meishij.net/r/41/203/113291/a113291_154752150856640.jpg'),(24,'牛扒意大利面','国外菜谱',27,8348,'http://site.meishij.net/r/246/137/1534496/a1534496_150082085827096.jpg'),(25,'土豆炖芸豆','中华菜系',25,4920,'https://s1.st.meishij.net/r/73/127/10031823/a10031823_153568396636101.jpg'),(26,'八宝辣酱','各地小吃',40,292,'https://s1.st.meishij.net/r/31/161/2290281/a2290281_06900.jpg'),(27,'蛤蜊青酱意面','国外菜谱',29,11635,'http://site.meishij.net/r/52/228/9682052/a9682052_149076044003463.jpg'),(28,'驴打滚','各地小吃',33,4847,'http://site.meishij.net/r/102/176/12294102/a12294102_151420913850604.jpg'),(29,'溜肉段','中华菜系',37,310,'https://s1.st.meishij.net/r/41/203/113291/a113291_154771690381024.jpg'),(30,'黑椒牛排','国外菜谱',30,4834,'http://site.meishij.net/r/48/124/9093548/a9093548_150035578659309.jpg'),(31,'少油健康地三鲜','中华菜系',36,4855,'https://s1.st.meishij.net/r/50/123/6030800/a6030800_153561207315836.jpg'),(32,'棒棒馍','各地小吃',26,468,'https://s1.st.meishij.net/r/19/208/1364519/a1364519_95529.jpg'),(33,'茄汁炒年糕','国外菜谱',25,6723,'http://site.meishij.net/r/172/227/5119422/a5119422_149067902932108.jpg'),(34,'咕咕霍夫紫薯发糕','各地小吃',36,5805,'http://site.meishij.net/r/57/175/8481307/a8481307_151334220585210.jpg'),(35,'冬瓜丸子汤','中华菜系',31,217,'https://s1.st.meishij.net/r/102/220/13242602/a13242602_154692255725712.jpg'),(36,'培根意面','国外菜谱',35,8404,'http://site.meishij.net/r/35/102/5838035/a5838035_150021492529794.jpg'),(37,'蒜蓉紫贝菜','中华菜系',23,5504,'https://s1.st.meishij.net/r/216/197/6174466/a6174466_152896341119107.jpg'),(38,'上海冷面','各地小吃',25,291,'https://s1.st.meishij.net/r/31/161/2290281/a2290281_85046.jpg'),(39,'口蘑扇贝意大利饺','国外菜谱',27,5766,'http://site.meishij.net/r/02/165/666252/a666252_149059366421065.jpg'),(40,'彩虹发糕','各地小吃',25,6049,'http://site.meishij.net/r/172/188/7672172/a7672172_151304355076609.jpg'),(41,'回锅肉','中华菜系',20,6004,'https://s1.st.meishij.net/r/85/84/8271085/a8271085_154521007825045.jpg'),(42,'韩国泡菜炒饭','国外菜谱',38,5496,'http://site.meishij.net/r/98/97/9961848/a9961848_149982587771375.jpg'),(43,'麻婆豆腐#午餐','中华菜系',35,5964,'https://s1.st.meishij.net/r/80/133/5970830/a5970830_152834931817261.jpg'),(44,'南瓜葡萄干发糕','各地小吃',23,17111,'https://s1.st.meishij.net/r/216/197/6174466/a6174466_152776181739118.jpg'),(45,'《仓之食》01卷心菜大决斗之大阪烧','国外菜谱',28,3127,'http://site.meishij.net/r/117/177/9731867/a9731867_149036619247142.jpg'),(46,'开花红糖发糕','各地小吃',29,3710,'http://site.meishij.net/r/229/220/2430229/a2430229_151297664167410.jpg'),(47,'酸菜鱼','中华菜系',30,6137,'https://s1.st.meishij.net/r/85/84/8271085/a8271085_154520840799943.jpg'),(48,'肉松寿司','国外菜谱',40,5474,'http://site.meishij.net/r/33/65/9891283/a9891283_149899545839629.jpg'),(49,'家常干锅排骨','中华菜系',29,2970,'https://s1.st.meishij.net/r/174/213/2303424/a2303424_152716573964407.jpg'),(50,'金灿灿红火火，一个蒸蒸日上的南瓜发糕','各地小吃',23,3411,'http://s1.st.meishij.net/r/150/187/12421900/a12421900_151779640780422.jpg'),(51,'一道萨瓦迪卡的泰式菜','国外菜谱',39,3952,'http://site.meishij.net/r/136/65/9078886/a9078886_149025698194590.jpg'),(52,'红枣发糕','各地小吃',38,3735,'http://site.meishij.net/r/208/102/1025708/a1025708_151237456626021.jpg'),(53,'鱼香肉丝','中华菜系',20,5695,'https://s1.st.meishij.net/r/85/84/8271085/a8271085_154518238088693.jpg'),(54,'三文鱼茶泡饭','国外菜谱',28,9177,'http://site.meishij.net/r/172/94/5586172/a5586172_149906464852908.jpg'),(55,'宫保鸡丁','中华菜系',21,4727,'https://s1.st.meishij.net/r/23/237/621773/a621773_152697820674718.jpg'),(56,'玉米面发糕','各地小吃',21,7128,'http://s1.st.meishij.net/r/87/178/5169587/a5169587_151670233580367.jpg'),(57,'干煎三文鱼配时蔬','国外菜谱',33,5030,'http://site.meishij.net/r/238/152/2913238/a2913238_149024709189159.jpg'),(58,'南瓜发糕','各地小吃',28,2694,'http://site.meishij.net/r/230/127/5969480/a5969480_151265387968588.jpg'),(59,'白灼虾','中华菜系',28,223,'https://s1.st.meishij.net/r/41/203/113291/a113291_154529502426378.jpg'),(60,'肉酱意大利面','国外菜谱',38,6145,'http://site.meishij.net/r/89/138/8909589/a8909589_149869904099473.jpg'),(61,'糖醋芝麻豆腐','各地小吃',30,8809,'http://s1.st.meishij.net/r/32/219/3992282/a3992282_151618125373298.jpg'),(62,'英式三文鱼饼','国外菜谱',27,6562,'http://site.meishij.net/r/134/204/5801134/a5801134_148998361977575.jpg'),(63,'红枣发糕','各地小吃',20,5772,'http://site.meishij.net/r/210/167/9979460/a9979460_151254394811114.jpg'),(64,'酸菜白肉','中华菜系',38,432,'https://s1.st.meishij.net/r/41/203/113291/a113291_154529163422395.jpg'),(65,'家庭版牛肉派做起来','国外菜谱',36,3726,'http://site.meishij.net/r/118/207/10051868/a10051868_149845622448029.jpg'),(66,'酱香芝麻豆腐','各地小吃',40,6202,'http://s1.st.meishij.net/r/32/219/3992282/a3992282_151617393472891.jpg'),(67,'意大利面条怎么做？','国外菜谱',32,5916,'http://site.meishij.net/r/136/65/9078886/a9078886_149008675993564.jpg'),(68,'红糖红枣发糕','各地小吃',39,5517,'http://site.meishij.net/r/14/171/5480264/a5480264_151236920202487.jpg'),(69,'棒棒鸡','中华菜系',28,433,'https://s1.st.meishij.net/r/41/203/113291/a113291_154339570276229.jpg'),(70,'黑椒鸡肉汉堡','国外菜谱',23,6515,'http://site.meishij.net/r/64/41/7635314/a7635314_149769691812524.jpg'),(71,'大枣花生玉米面发糕','各地小吃',28,7069,'http://site.meishij.net/r/134/61/5140384/a5140384_151573841274165.jpg'),(72,'意大利蔬菜汤','国外菜谱',38,10087,'http://site.meishij.net/r/136/65/9078886/a9078886_149008428418176.jpg'),(73,'红糖鸡蛋发糕','各地小吃',33,3424,'http://site.meishij.net/r/91/98/10462091/a10462091_151237058794292.jpg'),(74,'东北乱炖','中华菜系',35,288,'https://s1.st.meishij.net/r/41/203/113291/a113291_154466858397209.jpg'),(75,'棒寿司','国外菜谱',23,6737,'http://site.meishij.net/r/172/94/5586172/a5586172_149767875267835.jpg'),(76,'枸杞玉米发糕','各地小吃',20,7578,'http://site.meishij.net/r/235/48/3699735/a3699735_151563328340622.jpg'),(77,'意创意大利面','国外菜谱',29,4290,'http://site.meishij.net/r/109/94/3273609/a3273609_148981071624078.jpg'),(78,'天然色素，红曲豆面发糕','各地小吃',21,6918,'http://site.meishij.net/r/137/187/359387/a359387_151228963173743.jpg'),(79,'干煸四季豆','中华菜系',26,284,'https://s1.st.meishij.net/r/102/220/13242602/a13242602_154467353560649.jpg'),(80,'鲭鱼押寿司','国外菜谱',34,6445,'http://site.meishij.net/r/172/94/5586172/a5586172_149767798327850.jpg'),(81,'南瓜发糕','各地小吃',21,3918,'http://site.meishij.net/r/25/20/10817525/a10817525_151549154243957.jpg'),(82,'寿司','国外菜谱',22,4272,'http://site.meishij.net/r/179/125/9031429/a9031429_148980390690802.jpg'),(83,'紫薯爆浆驴打滚','各地小吃',30,3909,'http://site.meishij.net/r/161/132/6595661/a6595661_151219379387676.jpg'),(84,'红油蒜泥肘花','中华菜系',34,213,'https://s1.st.meishij.net/r/19/208/1364519/a1364519_20383.jpg'),(85,'经典泰国料理冬阴功汤','国外菜谱',20,7529,'http://site.meishij.net/r/52/228/9682052/a9682052_149241561149600.jpg'),(86,'驴打滚','各地小吃',39,4293,'http://site.meishij.net/r/172/238/4872172/a4872172_151427225006211.jpg'),(87,'简易三文鱼餐','国外菜谱',34,2529,'http://site.meishij.net/r/242/113/5090992/a5090992_148976029268196.jpg'),(88,'紫薯发糕','各地小吃',22,8271,'http://site.meishij.net/r/184/195/2611434/a2611434_151212904448744.jpg'),(89,'水煮杏鲍菇','中华菜系',29,350,'https://s1.st.meishij.net/r/157/47/3324407/a3324407_151618486394883.jpg'),(90,'红枣牛奶发糕','各地小吃',28,3355,'http://site.meishij.net/r/41/172/1918041/a1918041_151515209098027.jpg'),(91,'土耳其名菜：苏丹最爱','国外菜谱',39,5635,'http://site.meishij.net/r/172/94/5586172/a5586172_148983901912277.jpg'),(92,'南瓜发糕','各地小吃',22,4238,'http://site.meishij.net/r/84/91/10210334/a10210334_151204806171153.jpg'),(93,'红糖红枣发糕 宝宝辅食食谱','各地小吃',24,4206,'http://site.meishij.net/r/178/85/5833928/a5833928_151503214445972.jpg'),(94,'日本料理 喜烧 （お好み焼き)','国外菜谱',29,6075,'http://site.meishij.net/r/18/197/6611768/a6611768_148946350355015.jpg'),(95,'红糖红枣发糕','各地小吃',39,3200,'http://site.meishij.net/r/142/61/5577892/a5577892_151202499093826.jpg'),(96,'老北京炸酱面','各地小吃',39,3621,'http://site.meishij.net/r/157/47/3324407/a3324407_151489535046717.jpg'),(97,'培根火腿披萨','国外菜谱',22,1875,'http://site.meishij.net/r/10/06/4939010/a4939010_148855081807462.jpg'),(98,'蔓越莓红糖弹发糕','各地小吃',24,6323,'http://site.meishij.net/r/47/119/5279797/a5279797_151192105883992.jpg'),(99,'薯立方——红薯发糕','各地小吃',22,2604,'http://site.meishij.net/r/104/144/10536104/a10536104_151451732570307.jpg'),(100,'驴打滚','各地小吃',37,7206,'http://site.meishij.net/r/98/99/4649848/a4649848_151186583058463.jpg'),(101,'薯立方-红薯发糕','各地小吃',35,2479,'http://site.meishij.net/r/104/144/10536104/a10536104_151451635677458.jpg');
/*!40000 ALTER TABLE `mm_foods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mm_foodtype`
--

DROP TABLE IF EXISTS `mm_foodtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mm_foodtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typename` varchar(20) NOT NULL,
  `note` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mm_foodtype`
--

LOCK TABLES `mm_foodtype` WRITE;
/*!40000 ALTER TABLE `mm_foodtype` DISABLE KEYS */;
INSERT INTO `mm_foodtype` VALUES (1,'中华菜系',NULL),(2,'各地小吃',NULL),(3,'国外菜谱',NULL);
/*!40000 ALTER TABLE `mm_foodtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mm_order`
--

DROP TABLE IF EXISTS `mm_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mm_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` double NOT NULL,
  `state` int(11) NOT NULL,
  `time` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mm_order_user_id_85a6b089_fk_auth_user_id` (`user_id`),
  CONSTRAINT `mm_order_user_id_85a6b089_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mm_order`
--

LOCK TABLES `mm_order` WRITE;
/*!40000 ALTER TABLE `mm_order` DISABLE KEYS */;
INSERT INTO `mm_order` VALUES (1,166,1,'2019-03-29 02:36:25.305820',1),(2,42,1,'2019-03-29 02:37:30.111531',1),(3,120,1,'2019-03-29 02:43:10.240865',1),(4,206,1,'2019-03-29 02:44:45.430010',1),(5,0,1,'2019-03-29 02:47:50.510749',1),(6,120,1,'2019-03-29 02:48:29.125236',1),(7,40,1,'2019-03-29 02:49:27.317524',1),(8,68,1,'2019-03-29 02:50:16.513869',1),(9,190,1,'2019-03-29 03:05:29.002574',1),(10,56,1,'2019-03-29 03:16:21.280160',1),(11,120,1,'2019-03-29 03:22:03.570255',1),(12,109,1,'2019-03-29 03:22:46.527330',1),(13,178,1,'2019-03-29 03:24:58.803410',1),(14,88,2,'2019-03-29 03:26:47.436058',1),(15,278,2,'2019-03-29 08:12:55.690796',2),(16,88,2,'2019-03-29 09:52:43.372021',2),(17,46,2,'2019-03-29 10:00:14.965070',2),(18,63,2,'2019-03-30 01:59:43.790325',2),(19,102,1,'2019-03-30 02:01:21.376755',2);
/*!40000 ALTER TABLE `mm_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mm_orderdetail`
--

DROP TABLE IF EXISTS `mm_orderdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mm_orderdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_foods_num` int(11) NOT NULL,
  `foods_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mm_orderdetail_foods_id_383ce893_fk_mm_foods_fid` (`foods_id`),
  KEY `mm_orderdetail_order_id_0d9d9bef_fk_mm_order_id` (`order_id`),
  CONSTRAINT `mm_orderdetail_foods_id_383ce893_fk_mm_foods_fid` FOREIGN KEY (`foods_id`) REFERENCES `mm_foods` (`fid`),
  CONSTRAINT `mm_orderdetail_order_id_0d9d9bef_fk_mm_order_id` FOREIGN KEY (`order_id`) REFERENCES `mm_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mm_orderdetail`
--

LOCK TABLES `mm_orderdetail` WRITE;
/*!40000 ALTER TABLE `mm_orderdetail` DISABLE KEYS */;
INSERT INTO `mm_orderdetail` VALUES (1,4,1,1),(2,2,9,1),(3,2,6,2),(4,1,4,3),(5,2,7,3),(6,2,8,4),(7,2,1,4),(8,2,4,4),(9,4,1,6),(10,2,16,7),(11,2,22,8),(12,2,2,9),(13,2,20,9),(14,2,13,9),(15,2,58,10),(16,4,1,11),(17,2,9,12),(18,3,6,12),(19,3,6,13),(20,2,9,13),(21,3,11,13),(22,2,6,14),(23,2,11,14),(24,3,6,15),(25,4,1,15),(26,2,2,15),(27,1,9,15),(28,2,6,16),(29,2,9,16),(30,2,9,17),(31,3,6,18),(32,2,6,19),(33,3,16,19);
/*!40000 ALTER TABLE `mm_orderdetail` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-30 10:33:13
