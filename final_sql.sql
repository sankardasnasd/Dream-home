/*
SQLyog Community v13.2.1 (64 bit)
MySQL - 10.4.28-MariaDB : Database - cev_dreamhome
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`cev_dreamhome` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;

USE `cev_dreamhome`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add bank',7,'add_bank'),
(26,'Can change bank',7,'change_bank'),
(27,'Can delete bank',7,'delete_bank'),
(28,'Can view bank',7,'view_bank'),
(29,'Can add category',8,'add_category'),
(30,'Can change category',8,'change_category'),
(31,'Can delete category',8,'delete_category'),
(32,'Can view category',8,'view_category'),
(33,'Can add login',9,'add_login'),
(34,'Can change login',9,'change_login'),
(35,'Can delete login',9,'delete_login'),
(36,'Can view login',9,'view_login'),
(37,'Can add plan',10,'add_plan'),
(38,'Can change plan',10,'change_plan'),
(39,'Can delete plan',10,'delete_plan'),
(40,'Can view plan',10,'view_plan'),
(41,'Can add user',11,'add_user'),
(42,'Can change user',11,'change_user'),
(43,'Can delete user',11,'delete_user'),
(44,'Can view user',11,'view_user'),
(45,'Can add product',12,'add_product'),
(46,'Can change product',12,'change_product'),
(47,'Can delete product',12,'delete_product'),
(48,'Can view product',12,'view_product'),
(49,'Can add complaint',13,'add_complaint'),
(50,'Can change complaint',13,'change_complaint'),
(51,'Can delete complaint',13,'delete_complaint'),
(52,'Can view complaint',13,'view_complaint'),
(53,'Can add company',14,'add_company'),
(54,'Can change company',14,'change_company'),
(55,'Can delete company',14,'delete_company'),
(56,'Can view company',14,'view_company'),
(57,'Can add ordermain',15,'add_ordermain'),
(58,'Can change ordermain',15,'change_ordermain'),
(59,'Can delete ordermain',15,'delete_ordermain'),
(60,'Can view ordermain',15,'view_ordermain'),
(61,'Can add ordersub',16,'add_ordersub'),
(62,'Can change ordersub',16,'change_ordersub'),
(63,'Can delete ordersub',16,'delete_ordersub'),
(64,'Can view ordersub',16,'view_ordersub'),
(65,'Can add cart',17,'add_cart'),
(66,'Can change cart',17,'change_cart'),
(67,'Can delete cart',17,'delete_cart'),
(68,'Can view cart',17,'view_cart'),
(69,'Can add feedback',18,'add_feedback'),
(70,'Can change feedback',18,'change_feedback'),
(71,'Can delete feedback',18,'delete_feedback'),
(72,'Can view feedback',18,'view_feedback');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `auth_user` */

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(7,'myapp','bank'),
(17,'myapp','cart'),
(8,'myapp','category'),
(14,'myapp','company'),
(13,'myapp','complaint'),
(18,'myapp','feedback'),
(9,'myapp','login'),
(15,'myapp','ordermain'),
(16,'myapp','ordersub'),
(10,'myapp','plan'),
(12,'myapp','product'),
(11,'myapp','user'),
(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2023-11-13 04:52:40.446891'),
(2,'auth','0001_initial','2023-11-13 04:52:41.169059'),
(3,'admin','0001_initial','2023-11-13 04:52:41.320517'),
(4,'admin','0002_logentry_remove_auto_add','2023-11-13 04:52:41.327868'),
(5,'admin','0003_logentry_add_action_flag_choices','2023-11-13 04:52:41.336818'),
(6,'contenttypes','0002_remove_content_type_name','2023-11-13 04:52:41.410888'),
(7,'auth','0002_alter_permission_name_max_length','2023-11-13 04:52:41.435561'),
(8,'auth','0003_alter_user_email_max_length','2023-11-13 04:52:41.464086'),
(9,'auth','0004_alter_user_username_opts','2023-11-13 04:52:41.474298'),
(10,'auth','0005_alter_user_last_login_null','2023-11-13 04:52:41.532697'),
(11,'auth','0006_require_contenttypes_0002','2023-11-13 04:52:41.536702'),
(12,'auth','0007_alter_validators_add_error_messages','2023-11-13 04:52:41.545172'),
(13,'auth','0008_alter_user_username_max_length','2023-11-13 04:52:41.572676'),
(14,'auth','0009_alter_user_last_name_max_length','2023-11-13 04:52:41.599067'),
(15,'auth','0010_alter_group_name_max_length','2023-11-13 04:52:41.625734'),
(16,'auth','0011_update_proxy_permissions','2023-11-13 04:52:41.634044'),
(17,'auth','0012_alter_user_first_name_max_length','2023-11-13 04:52:41.661513'),
(18,'myapp','0001_initial','2023-11-13 04:52:42.137822'),
(19,'sessions','0001_initial','2023-11-13 04:52:42.187641'),
(20,'myapp','0002_product_description','2023-11-13 04:59:02.935017'),
(21,'myapp','0003_ordermain_ordersub','2023-11-13 07:44:17.594887'),
(22,'myapp','0004_cart','2023-11-13 07:57:26.063033'),
(23,'myapp','0005_rename_accountno_bank_account_and_more','2023-11-13 08:47:32.691665'),
(24,'myapp','0006_feedback','2023-11-14 05:14:18.070856'),
(25,'myapp','0007_rename_account_bank_accountno_and_more','2023-11-14 05:14:18.110178');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('695mnp7cais3te8tkznlicxvsblv06m3','eyJsaWQiOiIwIn0:1r2RNv:xnG21aRfz1Od3qnCqpFqXnZNdhR6G4q0bP9H9S2rQxI','2023-11-27 07:29:27.339343'),
('jzugv3gr9zlqbik1y6zgxlit89plx0ho','eyJsaWQiOiIwIn0:1r2Urb:dmbHMcftwJ_lkWXTwogfLuxRCVcOaC2iDblNQdqQ5vU','2023-11-27 11:12:19.026611'),
('kn13wnbxzsy3mieewdbbpzk24ly33ahu','eyJsaWQiOjF9:1r2VHl:KgL2aJpkj-vbEvb-8MYqhezwNGCE2lIVx1gufnT9iTY','2023-11-27 11:39:21.500215'),
('m7bslpm57bq7taipp1fum5rxi3ywx7kx','eyJsaWQiOjZ9:1r2Uug:mmuyU1pMy0MTDW7UDbs8rfIJbUcbprOQhkK82h2FHVs','2023-11-27 11:15:30.701444'),
('s095r5zmcrldo1kum3gqbbrk8308s94i','eyJsaWQiOiIwIn0:1r2V6S:HyvrLJkd63ZZRQooSJIDGszckbZvsjVys8IM22Z85TA','2023-11-27 11:27:40.250154'),
('wiggqdlaog9b0igzvx6up8bnki7ks53t','eyJsaWQiOjZ9:1r2V2O:7eVBbUUiALeSjCbojfZR8Zo5u5MH_vgUVKZL7Ti4TXY','2023-11-27 11:23:28.409277'),
('xyliefix3h8emz6mn4iifrtdf2ncveod','eyJsaWQiOiIwIn0:1r2lxr:q4THkUhLtQ2YgOZhbWqTklUv4OLgyEZR2jqccBD2ZyU','2023-11-28 05:27:55.993104'),
('ypzd2mmswtu027wmcud6k5p6tl98cx2c','eyJsaWQiOiIwIn0:1r2V4W:PAT5_NLj8C9NJQu7SHNIo8brhkIwVqE46J-xAgKSb2c','2023-11-27 11:25:40.529074'),
('zciq6hq9rkyerahyqjzgwn1800mdnncm','eyJsaWQiOiIwIn0:1r2V6I:uPEZ1rKsB_Bk0c0o9zXfXAg2CEIFJw7TaeVz42QlQ58','2023-11-27 11:27:30.613201');

/*Table structure for table `myapp_bank` */

DROP TABLE IF EXISTS `myapp_bank`;

CREATE TABLE `myapp_bank` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `accountno` varchar(100) NOT NULL,
  `ifsccode` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `amount` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `myapp_bank` */

insert  into `myapp_bank`(`id`,`accountno`,`ifsccode`,`password`,`amount`) values 
(1,'1','1','1',11111111);

/*Table structure for table `myapp_cart` */

DROP TABLE IF EXISTS `myapp_cart`;

CREATE TABLE `myapp_cart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `qty` int(11) NOT NULL,
  `date` date NOT NULL,
  `PRODUCT_id` bigint(20) NOT NULL,
  `USER_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_cart_PRODUCT_id_3fedfb9e_fk_myapp_product_id` (`PRODUCT_id`),
  KEY `myapp_cart_USER_id_4e7e18d9_fk_myapp_user_id` (`USER_id`),
  CONSTRAINT `myapp_cart_PRODUCT_id_3fedfb9e_fk_myapp_product_id` FOREIGN KEY (`PRODUCT_id`) REFERENCES `myapp_product` (`id`),
  CONSTRAINT `myapp_cart_USER_id_4e7e18d9_fk_myapp_user_id` FOREIGN KEY (`USER_id`) REFERENCES `myapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `myapp_cart` */

/*Table structure for table `myapp_category` */

DROP TABLE IF EXISTS `myapp_category`;

CREATE TABLE `myapp_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `categoryname` varchar(50) NOT NULL,
  `COMPANY_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_category_COMPANY_id_1a75e50c_fk_myapp_company_id` (`COMPANY_id`),
  CONSTRAINT `myapp_category_COMPANY_id_1a75e50c_fk_myapp_company_id` FOREIGN KEY (`COMPANY_id`) REFERENCES `myapp_company` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `myapp_category` */

insert  into `myapp_category`(`id`,`categoryname`,`COMPANY_id`) values 
(1,'Cat1',3),
(2,'Cat2',3),
(3,'Cat3',3),
(4,'table',1);

/*Table structure for table `myapp_company` */

DROP TABLE IF EXISTS `myapp_company`;

CREATE TABLE `myapp_company` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `photo` varchar(500) NOT NULL,
  `buildingno` varchar(100) NOT NULL,
  `place` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `estd` varchar(100) NOT NULL,
  `managername` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `LOGIN_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_company_LOGIN_id_fa8b4b3c_fk_myapp_login_id` (`LOGIN_id`),
  CONSTRAINT `myapp_company_LOGIN_id_fa8b4b3c_fk_myapp_login_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `myapp_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `myapp_company` */

insert  into `myapp_company`(`id`,`name`,`email`,`phone`,`photo`,`buildingno`,`place`,`city`,`state`,`estd`,`managername`,`status`,`LOGIN_id`) values 
(1,'BN Groups','bngroups@gmail.com','9874561232','/media/20231112215005.jpg','Bn Building','Kakkodi','Kozhikode','Kerala','2021','Linil','approved',4),
(2,'Dream house innovation','dreamhouse@gmail.com','7854125487','/media/20231112224908.jpg','Bn Building','Eranakulam','Eranakulam','Keral','2004','Jineesh kumar','rejected',5),
(3,'house innovation','house@gmail.com','7854125487','/media/20231112224932.jpg','Bn Building','Eranakulam','Eranakulam','Keral','2004','Sreejith K','pending',6);

/*Table structure for table `myapp_complaint` */

DROP TABLE IF EXISTS `myapp_complaint`;

CREATE TABLE `myapp_complaint` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `complaint` varchar(500) NOT NULL,
  `date` date NOT NULL,
  `status` varchar(20) NOT NULL,
  `reply` varchar(20) NOT NULL,
  `USER_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_complaint_USER_id_21ed0b20_fk_myapp_user_id` (`USER_id`),
  CONSTRAINT `myapp_complaint_USER_id_21ed0b20_fk_myapp_user_id` FOREIGN KEY (`USER_id`) REFERENCES `myapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `myapp_complaint` */

insert  into `myapp_complaint`(`id`,`complaint`,`date`,`status`,`reply`,`USER_id`) values 
(1,'rtretre','2023-11-12','replied','jvhkds',1),
(2,'fdsfs df d','2023-11-13','pending','pending',1),
(3,'fighjk','2023-11-14','pending','pending',1);

/*Table structure for table `myapp_feedback` */

DROP TABLE IF EXISTS `myapp_feedback`;

CREATE TABLE `myapp_feedback` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `feedback` varchar(500) NOT NULL,
  `date` date NOT NULL,
  `USER_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_feedback_USER_id_fce7ccff_fk_myapp_user_id` (`USER_id`),
  CONSTRAINT `myapp_feedback_USER_id_fce7ccff_fk_myapp_user_id` FOREIGN KEY (`USER_id`) REFERENCES `myapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `myapp_feedback` */

insert  into `myapp_feedback`(`id`,`feedback`,`date`,`USER_id`) values 
(1,'','2023-11-14',1);

/*Table structure for table `myapp_login` */

DROP TABLE IF EXISTS `myapp_login`;

CREATE TABLE `myapp_login` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `myapp_login` */

insert  into `myapp_login`(`id`,`username`,`password`,`type`) values 
(1,'admin@gmail.com','admin1','admin'),
(4,'bngroups@gmail.com','123','company'),
(5,'dreamhouse@gmail.com','123','company'),
(6,'house@gmail.com','123','company'),
(7,'nikhitha@gmail.com','123','user'),
(8,'murali@gmail.com','1234','user');

/*Table structure for table `myapp_ordermain` */

DROP TABLE IF EXISTS `myapp_ordermain`;

CREATE TABLE `myapp_ordermain` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `amount` double NOT NULL,
  `COMPANY_id` bigint(20) NOT NULL,
  `USER_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_ordermain_COMPANY_id_9b2f584e_fk_myapp_company_id` (`COMPANY_id`),
  KEY `myapp_ordermain_USER_id_43078adf_fk_myapp_user_id` (`USER_id`),
  CONSTRAINT `myapp_ordermain_COMPANY_id_9b2f584e_fk_myapp_company_id` FOREIGN KEY (`COMPANY_id`) REFERENCES `myapp_company` (`id`),
  CONSTRAINT `myapp_ordermain_USER_id_43078adf_fk_myapp_user_id` FOREIGN KEY (`USER_id`) REFERENCES `myapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `myapp_ordermain` */

insert  into `myapp_ordermain`(`id`,`date`,`amount`,`COMPANY_id`,`USER_id`) values 
(1,'2023-11-13',0,3,1),
(2,'2023-11-13',1000,3,1),
(3,'2023-11-14',10000,1,1);

/*Table structure for table `myapp_ordersub` */

DROP TABLE IF EXISTS `myapp_ordersub`;

CREATE TABLE `myapp_ordersub` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `qty` int(11) NOT NULL,
  `ORDERMAIN_id` bigint(20) NOT NULL,
  `PRODUCT_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_ordersub_ORDERMAIN_id_9c6221ce_fk_myapp_ordermain_id` (`ORDERMAIN_id`),
  KEY `myapp_ordersub_PRODUCT_id_1bf674f6_fk_myapp_product_id` (`PRODUCT_id`),
  CONSTRAINT `myapp_ordersub_ORDERMAIN_id_9c6221ce_fk_myapp_ordermain_id` FOREIGN KEY (`ORDERMAIN_id`) REFERENCES `myapp_ordermain` (`id`),
  CONSTRAINT `myapp_ordersub_PRODUCT_id_1bf674f6_fk_myapp_product_id` FOREIGN KEY (`PRODUCT_id`) REFERENCES `myapp_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `myapp_ordersub` */

insert  into `myapp_ordersub`(`id`,`qty`,`ORDERMAIN_id`,`PRODUCT_id`) values 
(1,3,1,2),
(2,1,1,2),
(3,5,1,1),
(4,3,1,2),
(5,2,2,1),
(6,2,2,2),
(7,1,3,4);

/*Table structure for table `myapp_plan` */

DROP TABLE IF EXISTS `myapp_plan`;

CREATE TABLE `myapp_plan` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` varchar(500) NOT NULL,
  `file` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `myapp_plan` */

insert  into `myapp_plan`(`id`,`title`,`description`,`file`) values 
(2,'fdsfsdf','fsdfsdfs','/media/20231114100302.jpg'),
(3,'dkhfs','jkkhhkj','/media/20231114100151.jpg');

/*Table structure for table `myapp_product` */

DROP TABLE IF EXISTS `myapp_product`;

CREATE TABLE `myapp_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `photo` varchar(250) NOT NULL,
  `price` varchar(8) NOT NULL,
  `CATEGORY_id` bigint(20) NOT NULL,
  `description` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_product_CATEGORY_id_cf94409b_fk_myapp_category_id` (`CATEGORY_id`),
  CONSTRAINT `myapp_product_CATEGORY_id_cf94409b_fk_myapp_category_id` FOREIGN KEY (`CATEGORY_id`) REFERENCES `myapp_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `myapp_product` */

insert  into `myapp_product`(`id`,`name`,`photo`,`price`,`CATEGORY_id`,`description`) values 
(1,'Produc1','/media/20231113123239.jpg','250',1,'Descriptiondfsdfsd'),
(2,'Produc2','/media/20231113113003.jpg','250',1,'dsfsd sfd sd sdf sd'),
(4,'dining table','/media/20231114103707.jpg','10000',4,'ksbjljsfn;kfk;nsknfksnf');

/*Table structure for table `myapp_user` */

DROP TABLE IF EXISTS `myapp_user`;

CREATE TABLE `myapp_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `photo` varchar(500) NOT NULL,
  `housename` varchar(100) NOT NULL,
  `place` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `LOGIN_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_user_LOGIN_id_da832ded_fk_myapp_login_id` (`LOGIN_id`),
  CONSTRAINT `myapp_user_LOGIN_id_da832ded_fk_myapp_login_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `myapp_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `myapp_user` */

insert  into `myapp_user`(`id`,`name`,`email`,`phone`,`gender`,`photo`,`housename`,`place`,`city`,`state`,`LOGIN_id`) values 
(1,'Nikhitha','nikhitha@gmail.com','7845782145','FeMale','/media/20231114100104.jpg','Thekkedath','Kizhakkummuri','Kozhikode','Kerala',7),
(2,'Murali Krishnan','murali@gmail.com','9482930491','Male','/media/20231114105753.jpg','Krishnamrutham','Kannur','Kannur','Kerala',8);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
