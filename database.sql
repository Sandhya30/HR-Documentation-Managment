/*
SQLyog Community Edition- MySQL GUI v7.15 
MySQL - 5.5.29 : Database - ujob
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`ujob` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `ujob`;

/*Table structure for table `file` */

DROP TABLE IF EXISTS `file`;

CREATE TABLE `file` (
  `username` varchar(100) DEFAULT NULL,
  `filename` varchar(100) DEFAULT NULL,
  `filepath` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `tl` varchar(100) DEFAULT NULL,
  `qualification` varchar(100) DEFAULT NULL,
  `exp` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `file` */

insert  into `file`(`username`,`filename`,`filepath`,`email`,`tl`,`qualification`,`exp`) values ('munna','ss1.docx','leaves\\ss1.docx','moulalicce225@gmail.com','java','B.tech','2');

/*Table structure for table `hr` */

DROP TABLE IF EXISTS `hr`;

CREATE TABLE `hr` (
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `hr` */

insert  into `hr`(`username`,`password`,`email`,`company`,`phone`,`gender`) values ('chotu','chotu','chotu@gmail.com','1000projects','8639966858','Male');

/*Table structure for table `jobs` */

DROP TABLE IF EXISTS `jobs`;

CREATE TABLE `jobs` (
  `username` varchar(100) DEFAULT NULL,
  `language` varchar(100) DEFAULT NULL,
  `qualification` varchar(100) DEFAULT NULL,
  `exp` varchar(100) DEFAULT NULL,
  `about` varchar(100) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `jobs` */

insert  into `jobs`(`username`,`language`,`qualification`,`exp`,`about`,`company`) values ('chotu','java and python','B.tech','2','you have to work on python or java','1000projects');

/*Table structure for table `request` */

DROP TABLE IF EXISTS `request`;

CREATE TABLE `request` (
  `hr` varchar(100) DEFAULT NULL,
  `language` varchar(100) DEFAULT NULL,
  `qualification` varchar(100) DEFAULT NULL,
  `exp` varchar(100) DEFAULT NULL,
  `about` varchar(100) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `cficates` varchar(100) DEFAULT NULL,
  `file1` varchar(100) DEFAULT NULL,
  `file2` varchar(100) DEFAULT NULL,
  `fpath` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `fpath1` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `request` */

insert  into `request`(`hr`,`language`,`qualification`,`exp`,`about`,`company`,`username`,`email`,`cficates`,`file1`,`file2`,`fpath`,`status`,`fpath1`) values ('chotu','java and python','B.tech','2','you have to work on python or java','1000projects','munna','moulalicce225@gmail.com','upload graduation and exp document','ss2.docx','ss3.docx','leavesss2.docx','pending','leavesss3.docx');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL,
  `dob` varchar(100) DEFAULT NULL,
  `qualification` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`username`,`password`,`email`,`phone`,`gender`,`dob`,`qualification`,`address`) values ('munna','munna','moulalicce225@gmail.com','8639966858','Male','25-08-1993','B.tech','hyd');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
