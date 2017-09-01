/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.5.41 : Database - shiyan
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`shiyan` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `shiyan`;

/*Table structure for table `label` */

DROP TABLE IF EXISTS `label`;

CREATE TABLE `label` (
  `number` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `term` varchar(10) DEFAULT NULL,
  `teachernum` varchar(20) DEFAULT NULL,
  `place` varchar(10) DEFAULT NULL,
  `maxnum` int(11) DEFAULT NULL,
  `nownum` int(11) DEFAULT NULL,
  `content` varchar(100) DEFAULT NULL,
  `time` varchar(10) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `studytime` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `label` */

/*Table structure for table `stu_lab` */

DROP TABLE IF EXISTS `stu_lab`;

CREATE TABLE `stu_lab` (
  `studentnum` varchar(20) NOT NULL,
  `lablenum` varchar(20) NOT NULL,
  `grade` int(11) DEFAULT '-1',
  `flag` int(11) DEFAULT '0',
  PRIMARY KEY (`studentnum`,`lablenum`),
  KEY `FK_stu_lab` (`lablenum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `stu_lab` */

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `number` varchar(20) NOT NULL,
  `name` varchar(10) DEFAULT NULL,
  `class` varchar(10) DEFAULT NULL,
  `tel` varchar(11) DEFAULT NULL,
  `major` varchar(10) DEFAULT NULL,
  `pwd` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `student` */

insert  into `student`(`number`,`name`,`class`,`tel`,`major`,`pwd`) values ('1120142000','张三','08311402','18811073648','软件学院','000000');

/*Table structure for table `teacher` */

DROP TABLE IF EXISTS `teacher`;

CREATE TABLE `teacher` (
  `number` varchar(20) DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL,
  `tel` varchar(11) DEFAULT NULL,
  `major` varchar(10) DEFAULT NULL,
  `pwd` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `teacher` */

insert  into `teacher`(`number`,`name`,`tel`,`major`,`pwd`) values ('10001','王平','67399834','光电学院','000000');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
