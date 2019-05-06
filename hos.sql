-- MySQL dump 10.15  Distrib 10.0.38-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: shd_hospital
-- ------------------------------------------------------
-- Server version	10.0.38-MariaDB-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin_company`
--

DROP TABLE IF EXISTS `admin_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_company` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_company`
--

LOCK TABLES `admin_company` WRITE;
/*!40000 ALTER TABLE `admin_company` DISABLE KEYS */;
INSERT INTO `admin_company` VALUES (1,'Godawari.'),(2,'Dalli.');
/*!40000 ALTER TABLE `admin_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_conAnomaly`
--

DROP TABLE IF EXISTS `admin_conAnomaly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_conAnomaly` (
  `caid` int(11) NOT NULL AUTO_INCREMENT,
  `canomaly` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`caid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_conAnomaly`
--

LOCK TABLES `admin_conAnomaly` WRITE;
/*!40000 ALTER TABLE `admin_conAnomaly` DISABLE KEYS */;
INSERT INTO `admin_conAnomaly` VALUES (1,'Leg.'),(2,'Hand.');
/*!40000 ALTER TABLE `admin_conAnomaly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_deliverytype`
--

DROP TABLE IF EXISTS `admin_deliverytype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_deliverytype` (
  `dtid` int(11) NOT NULL AUTO_INCREMENT,
  `tod` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`dtid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_deliverytype`
--

LOCK TABLES `admin_deliverytype` WRITE;
/*!40000 ALTER TABLE `admin_deliverytype` DISABLE KEYS */;
INSERT INTO `admin_deliverytype` VALUES (1,'LSCS.'),(2,'end');
/*!40000 ALTER TABLE `admin_deliverytype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_diagno`
--

DROP TABLE IF EXISTS `admin_diagno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_diagno` (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `diagnosis` varchar(50) DEFAULT NULL,
  `deletestatus` int(1) DEFAULT '0',
  PRIMARY KEY (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_diagno`
--

LOCK TABLES `admin_diagno` WRITE;
/*!40000 ALTER TABLE `admin_diagno` DISABLE KEYS */;
INSERT INTO `admin_diagno` VALUES (1,'Pain',0),(2,'Joint Pain',0);
/*!40000 ALTER TABLE `admin_diagno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_district`
--

DROP TABLE IF EXISTS `admin_district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_district` (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `disname` varchar(50) DEFAULT NULL,
  `deletestatus` int(1) DEFAULT '0',
  PRIMARY KEY (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_district`
--

LOCK TABLES `admin_district` WRITE;
/*!40000 ALTER TABLE `admin_district` DISABLE KEYS */;
INSERT INTO `admin_district` VALUES (1,'Durg.',0),(2,'Balod.',0),(3,'Bilaspur',0);
/*!40000 ALTER TABLE `admin_district` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_govsch`
--

DROP TABLE IF EXISTS `admin_govsch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_govsch` (
  `gsid` int(11) NOT NULL AUTO_INCREMENT,
  `gsname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`gsid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_govsch`
--

LOCK TABLES `admin_govsch` WRITE;
/*!40000 ALTER TABLE `admin_govsch` DISABLE KEYS */;
INSERT INTO `admin_govsch` VALUES (1,'RSBY.'),(2,'MSPY.'),(3,'Ayusman.');
/*!40000 ALTER TABLE `admin_govsch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_medtype`
--

DROP TABLE IF EXISTS `admin_medtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_medtype` (
  `mtid` int(11) NOT NULL AUTO_INCREMENT,
  `mtype` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`mtid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_medtype`
--

LOCK TABLES `admin_medtype` WRITE;
/*!40000 ALTER TABLE `admin_medtype` DISABLE KEYS */;
INSERT INTO `admin_medtype` VALUES (1,'Tablets.');
/*!40000 ALTER TABLE `admin_medtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_prOfSurgery`
--

DROP TABLE IF EXISTS `admin_prOfSurgery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_prOfSurgery` (
  `posid` int(11) NOT NULL AUTO_INCREMENT,
  `pos` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`posid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_prOfSurgery`
--

LOCK TABLES `admin_prOfSurgery` WRITE;
/*!40000 ALTER TABLE `admin_prOfSurgery` DISABLE KEYS */;
INSERT INTO `admin_prOfSurgery` VALUES (1,'LSCS.'),(2,'trrt.'),(3,'yyy.');
/*!40000 ALTER TABLE `admin_prOfSurgery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_ward_bdname`
--

DROP TABLE IF EXISTS `admin_ward_bdname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_ward_bdname` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `bname` varchar(20) DEFAULT NULL,
  `wid` int(11) DEFAULT NULL,
  `bstatus` int(1) DEFAULT '0',
  `deletestatus` int(1) DEFAULT '0',
  PRIMARY KEY (`bid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_ward_bdname`
--

LOCK TABLES `admin_ward_bdname` WRITE;
/*!40000 ALTER TABLE `admin_ward_bdname` DISABLE KEYS */;
INSERT INTO `admin_ward_bdname` VALUES (1,'M1',2,0,0),(2,'K1',4,0,0),(3,'M2',2,0,0),(4,'F1',3,0,0),(5,'S1.',1,0,0);
/*!40000 ALTER TABLE `admin_ward_bdname` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_wardname`
--

DROP TABLE IF EXISTS `admin_wardname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_wardname` (
  `wid` int(11) NOT NULL AUTO_INCREMENT,
  `wname` varchar(30) DEFAULT NULL,
  `deletestatus` int(1) DEFAULT '0',
  PRIMARY KEY (`wid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_wardname`
--

LOCK TABLES `admin_wardname` WRITE;
/*!40000 ALTER TABLE `admin_wardname` DISABLE KEYS */;
INSERT INTO `admin_wardname` VALUES (1,'S Male ',0),(2,'Male Ward.',0),(3,'Female Ward.',0),(4,'K Ward.',0),(5,'S Ward',0),(6,'Child WardC',0),(7,'test',0),(8,'ffaa',0);
/*!40000 ALTER TABLE `admin_wardname` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `eid` int(11) NOT NULL AUTO_INCREMENT,
  `ename` varchar(40) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `contact` varchar(12) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `emptype` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`eid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'admin','shd','00000','shd@shd.com','Admin'),(2,'staff','shd','00000','shd@shd.com','Staff'),(3,'Ramesh','Durg','00000','r@gmail.com','Doctor');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipdvisit`
--

DROP TABLE IF EXISTS `ipdvisit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ipdvisit` (
  `ipdid` int(11) NOT NULL AUTO_INCREMENT,
  `regno` varchar(13) DEFAULT NULL,
  `complaint` varchar(100) DEFAULT NULL,
  `patientfrom` varchar(50) DEFAULT NULL,
  `ipddate` date DEFAULT NULL,
  `ipdtime` time DEFAULT NULL,
  `ptype` varchar(5) DEFAULT NULL,
  `govscheme` varchar(70) DEFAULT NULL,
  `urnno` varchar(30) DEFAULT NULL,
  `advmoney` varchar(5) DEFAULT NULL,
  `moneyreceivedby` varchar(50) DEFAULT NULL,
  `wardid` int(11) DEFAULT NULL,
  `pstatus` varchar(20) DEFAULT NULL,
  `dischargedate` date DEFAULT NULL,
  `dischargetime` time DEFAULT NULL,
  PRIMARY KEY (`ipdid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipdvisit`
--

LOCK TABLES `ipdvisit` WRITE;
/*!40000 ALTER TABLE `ipdvisit` DISABLE KEYS */;
INSERT INTO `ipdvisit` VALUES (1,'2019SHD1','Leg Pain','OUTPATIENT','2019-04-12','13:25:00','NEW','Not Eligible','34444455666','3456','dsfdsf',2,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ipdvisit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opdClinicalHistory`
--

DROP TABLE IF EXISTS `opdClinicalHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opdClinicalHistory` (
  `hcid` int(11) NOT NULL AUTO_INCREMENT,
  `opdid` int(11) DEFAULT NULL,
  `regno` varchar(13) DEFAULT NULL,
  `hiscli` varchar(500) DEFAULT NULL,
  `hcdate` date DEFAULT NULL,
  `docid` int(11) DEFAULT NULL,
  PRIMARY KEY (`hcid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opdClinicalHistory`
--

LOCK TABLES `opdClinicalHistory` WRITE;
/*!40000 ALTER TABLE `opdClinicalHistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `opdClinicalHistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opdDiagnosis`
--

DROP TABLE IF EXISTS `opdDiagnosis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opdDiagnosis` (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `opdid` int(11) DEFAULT NULL,
  `regno` varchar(13) DEFAULT NULL,
  `diagnosisId` int(11) DEFAULT NULL,
  `diagnosisType` varchar(25) DEFAULT NULL,
  `diagnosisDate` date DEFAULT NULL,
  PRIMARY KEY (`did`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opdDiagnosis`
--

LOCK TABLES `opdDiagnosis` WRITE;
/*!40000 ALTER TABLE `opdDiagnosis` DISABLE KEYS */;
/*!40000 ALTER TABLE `opdDiagnosis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opdDocument`
--

DROP TABLE IF EXISTS `opdDocument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opdDocument` (
  `docid` int(11) NOT NULL AUTO_INCREMENT,
  `regno` varchar(13) DEFAULT NULL,
  `doc_name` varchar(100) DEFAULT NULL,
  `doc_date` date DEFAULT NULL,
  `doc_file_loc` varchar(100) DEFAULT NULL,
  `doc_from` varchar(20) DEFAULT NULL,
  `entry_date` date DEFAULT NULL,
  PRIMARY KEY (`docid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opdDocument`
--

LOCK TABLES `opdDocument` WRITE;
/*!40000 ALTER TABLE `opdDocument` DISABLE KEYS */;
/*!40000 ALTER TABLE `opdDocument` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opdreferInfo`
--

DROP TABLE IF EXISTS `opdreferInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opdreferInfo` (
  `refid` int(11) NOT NULL AUTO_INCREMENT,
  `opdid` int(11) DEFAULT NULL,
  `regno` varchar(13) DEFAULT NULL,
  `reason` varchar(60) DEFAULT '',
  `refdate` date DEFAULT NULL,
  `hname` varchar(50) DEFAULT NULL,
  `referby` int(11) DEFAULT NULL,
  `referto` int(11) DEFAULT NULL,
  PRIMARY KEY (`refid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opdreferInfo`
--

LOCK TABLES `opdreferInfo` WRITE;
/*!40000 ALTER TABLE `opdreferInfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `opdreferInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opdvisit`
--

DROP TABLE IF EXISTS `opdvisit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opdvisit` (
  `opdid` int(11) NOT NULL AUTO_INCREMENT,
  `regno` varchar(13) DEFAULT NULL,
  `ptype` varchar(5) DEFAULT NULL,
  `vdate` date DEFAULT NULL,
  `vtime` time DEFAULT NULL,
  `height` varchar(5) DEFAULT NULL,
  `weight` varchar(5) DEFAULT NULL,
  `bmi` varchar(5) DEFAULT NULL,
  `temp` varchar(3) DEFAULT NULL,
  `pulse` varchar(3) DEFAULT NULL,
  `rrate` varchar(3) DEFAULT NULL,
  `systolic` varchar(3) DEFAULT NULL,
  `diastolic` varchar(3) DEFAULT NULL,
  `complaint` varchar(100) DEFAULT NULL,
  `status` varchar(10) DEFAULT '',
  PRIMARY KEY (`opdid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opdvisit`
--

LOCK TABLES `opdvisit` WRITE;
/*!40000 ALTER TABLE `opdvisit` DISABLE KEYS */;
INSERT INTO `opdvisit` VALUES (1,'2019SHD1','NEW','2019-04-12','11:31:00','176','90','29.05','98','72','43','120','80','Leg Pain',''),(2,'2019SHD2','NEW','2019-04-12','11:33:00','154','32','13.49','98','87','80','130','80','stomach pain','');
/*!40000 ALTER TABLE `opdvisit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_registration`
--

DROP TABLE IF EXISTS `patient_registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_registration` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `regno` varchar(13) NOT NULL,
  `pfname` varchar(20) DEFAULT NULL,
  `pmname` varchar(10) DEFAULT NULL,
  `psname` varchar(20) DEFAULT NULL,
  `rtype` varchar(10) DEFAULT NULL,
  `rfname` varchar(20) DEFAULT NULL,
  `rmname` varchar(10) DEFAULT NULL,
  `rsname` varchar(20) DEFAULT NULL,
  `regdate` date DEFAULT NULL,
  `regtime` time DEFAULT NULL,
  `age` varchar(3) DEFAULT NULL,
  `agetype` varchar(7) DEFAULT NULL,
  `sex` varchar(12) DEFAULT NULL,
  `education` varchar(20) DEFAULT NULL,
  `occupation` varchar(25) DEFAULT NULL,
  `contactno` varchar(12) DEFAULT NULL,
  `pclass` varchar(15) DEFAULT NULL,
  `village` varchar(20) DEFAULT '',
  `tahsil` varchar(20) DEFAULT '',
  `district` varchar(20) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  `cast` varchar(10) DEFAULT NULL,
  `aadharNo` varchar(12) DEFAULT '',
  `rationcard` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  UNIQUE KEY `regno` (`regno`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_registration`
--

LOCK TABLES `patient_registration` WRITE;
/*!40000 ALTER TABLE `patient_registration` DISABLE KEYS */;
INSERT INTO `patient_registration` VALUES (1,'2019SHD1','b','h','j','Father','g','h','j','2019-04-12','00:00:00','21','Year','Male','jk','b','7','General','hj','bh','1','ytfghv','test1','786543','test2'),(2,'2019SHD2','UI','HJ','jsd','Father','sd','sdfg','jsd','2019-04-12','16:42:00','32','Year','Male','sd','er','234','General','sdf','sdfg','1','sdf','test1','23456u','test2');
/*!40000 ALTER TABLE `patient_registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `eid` int(11) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin123',1),(2,'staff','staff123',2),(3,'jana','jana123',3);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-12 16:57:04



--
-- Table structure for table `add_sample`
--

DROP TABLE IF EXISTS `add_sample`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `add_sample` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `test_type` varchar(20) DEFAULT NULL,
  `test_name` varchar(20) DEFAULT NULL,
  `Male_Range` varchar(10) DEFAULT NULL,
  `Female_Range` varchar(20) DEFAULT NULL,
  `Unit` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `add_sample`
--

LOCK TABLES `add_sample` WRITE;
/*!40000 ALTER TABLE `add_sample` DISABLE KEYS */;
INSERT INTO `add_sample` VALUES (1,'Urine','Ketone','25','26','kg/m3');
/*!40000 ALTER TABLE `add_sample` ENABLE KEYS */;
UNLOCK TABLES;