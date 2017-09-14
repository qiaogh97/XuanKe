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
  `teachername` varchar(10) DEFAULT NULL,
  `place` varchar(10) DEFAULT NULL,
  `maxnum` int(11) DEFAULT NULL,
  `nownum` int(11) DEFAULT '0',
  `content` varchar(100) DEFAULT NULL,
  `time` varchar(10) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `studytime` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=1109 DEFAULT CHARSET=utf8;

/*Data for the table `label` */

insert  into `label`(`number`,`name`,`term`,`teachernum`,`teachername`,`place`,`maxnum`,`nownum`,`content`,`time`,`score`,`studytime`) values (1102,'数码相机评测','2017年秋季','10001','张强','3教402',50,12,'数码相机评测系统','32学时',2,'周二上午8点'),(1103,'MP3播放器制作','2017年春季','10001','张强','3教404',50,50,'制作一个mp3','32学时',3,'周日上午8点'),(1104,'虚拟仪器设计','2017年春季','10001','张强','3教432',50,6,'虚拟仪器设计实验','32学时',3,'周二下午2点'),(1105,'无线电传输','2017年春季','10002','张峰','3教412',50,0,'无线点传输实验','32学时',2,'周二下午2点'),(1106,'图像传输光网络','2017年春季','10002','张峰','3教411',50,0,'图像传输实验','32学时',2,'周三上午8点'),(1107,'兵器设计实验','2017年春季','10003','赵明','3教405',50,0,'设计兵器','32学时',3,'周五上午8点');

/*Table structure for table `stu_lab` */

DROP TABLE IF EXISTS `stu_lab`;

CREATE TABLE `stu_lab` (
  `studentnum` varchar(20) NOT NULL,
  `labelnum` int(20) NOT NULL,
  `grade` int(11) DEFAULT '-1',
  `flag` int(11) DEFAULT '0',
  PRIMARY KEY (`studentnum`,`labelnum`),
  KEY `FK_stu_lab` (`labelnum`),
  CONSTRAINT `FK_stu_lab` FOREIGN KEY (`labelnum`) REFERENCES `label` (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `stu_lab` */

insert  into `stu_lab`(`studentnum`,`labelnum`,`grade`,`flag`) values ('1120142000',1102,-1,2),('1120142000',1103,-1,0),('1120142000',1105,-1,0),('1120142000',1106,-1,0),('1120142000',1107,-1,0),('123123',1102,90,1);

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

insert  into `student`(`number`,`name`,`class`,`tel`,`major`,`pwd`) values ('1120142000','张一鸣','08311401','18810191822','软件工程','111111'),('1120142001','王峰','08311402','1881919101','软件工程','000000'),('1120142002','张三','08311402','18811071551','软件工程','000000'),('1120142003','李四','08311402','18810171611','软件工程','000000'),('1120142004','王五','08311402','18810192990','软件工程','000000'),('123123','123','123','18810129023','23','000000');

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

insert  into `teacher`(`number`,`name`,`tel`,`major`,`pwd`) values ('10001','张强','1892819721','软件学院','000000'),('10002','张峰','1881011982','光电学院','000000'),('10003','赵明','1881029129','软件工程','000000');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
