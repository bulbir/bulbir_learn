/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 5.7.33 : Database - learn_ciapi
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`learn_ciapi` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `learn_ciapi`;

/*Table structure for table `mahasiswa` */

DROP TABLE IF EXISTS `mahasiswa`;

CREATE TABLE `mahasiswa` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nrp` char(9) NOT NULL,
  `nama` varchar(250) NOT NULL,
  `email` varchar(250) DEFAULT NULL,
  `jurusan` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `mahasiswa` */

insert  into `mahasiswa`(`id`,`nrp`,`nama`,`email`,`jurusan`) values 
(1,'043040001','Doddy Ferdiansyah','doy@gmail.com','Teknik Mesin'),
(2,'023040123','Erik','erik@gmail.com','Teknik Industri'),
(3,'043040321','Rommy Fauzi','rommy@gmail.com','Teknik Planologi'),
(4,'033040023','Fajar Darmawan ','fajar@yahoo.com','Teknik Informatika'),
(5,'113040321','Ferry Mulyanto','ferry@yahoo.com','Manajemen'),
(6,'05550098','Ganti','mahya@uin-malang.ac.id','Teknik Informatika'),
(7,'05550098','Musa Ahmah Alkayyis','mahya@uin-malang.ac.id','Teknik Informatika');

/*Table structure for table `x_apikeys` */

DROP TABLE IF EXISTS `x_apikeys`;

CREATE TABLE `x_apikeys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT '0',
  `is_private_key` tinyint(1) NOT NULL DEFAULT '0',
  `ip_addresses` text,
  `date_created` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `x_apikeys` */

insert  into `x_apikeys`(`id`,`user_id`,`key`,`level`,`ignore_limits`,`is_private_key`,`ip_addresses`,`date_created`) values 
(1,1,'mhy_secret',1,0,0,NULL,1);

/*Table structure for table `x_apilimits` */

DROP TABLE IF EXISTS `x_apilimits`;

CREATE TABLE `x_apilimits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) NOT NULL,
  `count` int(10) NOT NULL,
  `hour_started` int(11) NOT NULL,
  `api_key` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `x_apilimits` */

insert  into `x_apilimits`(`id`,`uri`,`count`,`hour_started`,`api_key`) values 
(1,'uri:mahasiswa/index:get',4,1688699052,'mhy_secret');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
