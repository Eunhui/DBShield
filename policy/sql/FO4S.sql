-- MySQL dump 10.13  Distrib 5.1.73, for redhat-linux-gnu (x86_64)
--
-- Host: localhost    Database: FO4S
-- ------------------------------------------------------
-- Server version	5.1.73

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
-- Table structure for table `ACCESS_LOG`
--

DROP TABLE IF EXISTS `ACCESS_LOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACCESS_LOG` (
  `SEQ` bigint(20) NOT NULL AUTO_INCREMENT,
  `CONNECT_IP` varchar(23) NOT NULL COMMENT 'IP address or ALL, NOT NULL',
  `CONNECT_DB_USER` varchar(64) NOT NULL,
  `ENCRYPTION_YN` char(1) CHARACTER SET latin1 NOT NULL COMMENT 'ENCRYPTION : Y, DECRYPTION : N',
  `ALLOW_YN` char(1) CHARACTER SET latin1 NOT NULL COMMENT 'ALLOW : Y, DENY : N',
  `DENY_REASON` varchar(1000) DEFAULT NULL COMMENT 'DENY REASON',
  `COUNT` int(11) DEFAULT NULL COMMENT 'ALLOW OR DENY COUNT',
  `REGIST_DATE` datetime DEFAULT NULL COMMENT 'REGISTRATION DATE',
  PRIMARY KEY (`SEQ`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACCESS_LOG`
--

LOCK TABLES `ACCESS_LOG` WRITE;
/*!40000 ALTER TABLE `ACCESS_LOG` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACCESS_LOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ADMIN`
--

DROP TABLE IF EXISTS `ADMIN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ADMIN` (
  `ADMIN_ID` varchar(16) NOT NULL,
  `PASSWORD` varchar(16) NOT NULL,
  `NAME` varchar(20) NOT NULL,
  `PERMISSION` varchar(1) DEFAULT NULL COMMENT 'S: 보안관리자, NULL: 일반',
  PRIMARY KEY (`ADMIN_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADMIN`
--

LOCK TABLES `ADMIN` WRITE;
/*!40000 ALTER TABLE `ADMIN` DISABLE KEYS */;
INSERT INTO `ADMIN` VALUES ('admin','admin123','jimant','S'),('admin2','admin2','admin2','N');
/*!40000 ALTER TABLE `ADMIN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BEHAVIOR_ACCESS_CONTROL`
--

DROP TABLE IF EXISTS `BEHAVIOR_ACCESS_CONTROL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BEHAVIOR_ACCESS_CONTROL` (
  `CONNECT_IP` varchar(23) NOT NULL COMMENT 'IP address or ALL, NOT NULL',
  `CONNECT_DB_USER` varchar(64) NOT NULL COMMENT 'DB USER or ALL, NOT NULL',
  `SMALL_TIME` varchar(14) NOT NULL COMMENT 'NOT NULL(0005: 5분)',
  `SMALL_TIME_COUNT` int(4) NOT NULL COMMENT 'NOT NULL(50회)',
  `BIG_TIME` varchar(14) NOT NULL COMMENT 'NOT NULL(2400: 24??)',
  `BIG_TIME_COUNT` int(6) NOT NULL COMMENT 'NOT NULL(100?)',
  `DELETE_DATE` varchar(14) DEFAULT NULL COMMENT 'yyyymmddhhmmss, INDEX',
  `BEHAVIOR_ACCESS_CONTROL_ID` bigint(19) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`BEHAVIOR_ACCESS_CONTROL_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BEHAVIOR_ACCESS_CONTROL`
--

LOCK TABLES `BEHAVIOR_ACCESS_CONTROL` WRITE;
/*!40000 ALTER TABLE `BEHAVIOR_ACCESS_CONTROL` DISABLE KEYS */;
/*!40000 ALTER TABLE `BEHAVIOR_ACCESS_CONTROL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COLUMN_ENCRYPT_POLICY`
--

DROP TABLE IF EXISTS `COLUMN_ENCRYPT_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COLUMN_ENCRYPT_POLICY` (
  `USER` varchar(64) NOT NULL,
  `TABLE_NAME` varchar(64) NOT NULL,
  `COLUMN_NAME` varchar(64) DEFAULT NULL,
  `HASH_CHECK` varchar(1) DEFAULT NULL COMMENT 'Y: 일방향, NULL: 대칭키',
  `HASH_SALT` varchar(32) DEFAULT NULL,
  `IV_CHECK` varchar(1) DEFAULT NULL COMMENT 'Y::IV사용, NULL: 사용않함',
  `IV_VALUE` varchar(32) DEFAULT NULL,
  `PARTIAL_ENCRYPT_CHECK` varchar(1) DEFAULT NULL COMMENT 'Y: 사용, NULL: 사용않함',
  `PARTIAL_ENCRYPT_LENGTH` int(2) DEFAULT '0',
  `MASK_CHECK` varchar(1) DEFAULT NULL COMMENT 'Y: 사용, NULL: 사용않함',
  `MASK_DIGIT` varchar(16) DEFAULT NULL COMMENT '예) 1,5.8,12	',
  `MASK_VALUE` varchar(1) DEFAULT NULL COMMENT '예) # or *',
  `SYSTEM_APPLY_DATE` varchar(14) DEFAULT NULL COMMENT 'yyyymmddhhmmss, INDEX'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COLUMN_ENCRYPT_POLICY`
--

LOCK TABLES `COLUMN_ENCRYPT_POLICY` WRITE;
/*!40000 ALTER TABLE `COLUMN_ENCRYPT_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `COLUMN_ENCRYPT_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATA_ENCRYPT_KEY`
--

DROP TABLE IF EXISTS `DATA_ENCRYPT_KEY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DATA_ENCRYPT_KEY` (
  `ENCRYPT_KEY` varchar(1000) NOT NULL,
  `CREATE_DATE` varchar(14) DEFAULT NULL COMMENT 'yyyymmddhhmmss',
  `BACKUP_DATE` varchar(14) DEFAULT NULL COMMENT 'yyyymmddhhmmss',
  `RESTORE_DATE` varchar(14) DEFAULT NULL COMMENT 'yyyymmddhhmmss',
  `DISCARD_DATE` varchar(14) DEFAULT NULL COMMENT 'Yyyymmddhhmmss, INDEX',
  `STATE` varchar(1) DEFAULT NULL COMMENT 'NULL: 정상, E: 폐기'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATA_ENCRYPT_KEY`
--

LOCK TABLES `DATA_ENCRYPT_KEY` WRITE;
/*!40000 ALTER TABLE `DATA_ENCRYPT_KEY` DISABLE KEYS */;
/*!40000 ALTER TABLE `DATA_ENCRYPT_KEY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GLOBAL_ENCRYPT_POLICY`
--

DROP TABLE IF EXISTS `GLOBAL_ENCRYPT_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GLOBAL_ENCRYPT_POLICY` (
  `ALGORITHM` varchar(10) NOT NULL,
  `OPERATE_MODE` varchar(3) NOT NULL,
  `SYSTEM_APPLY_DATE` varchar(14) DEFAULT NULL,
  `DB_TYPE` varchar(1) DEFAULT NULL COMMENT 'M: mysql, O: oracle',
  `DB_NAME` varchar(64) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GLOBAL_ENCRYPT_POLICY`
--

LOCK TABLES `GLOBAL_ENCRYPT_POLICY` WRITE;
/*!40000 ALTER TABLE `GLOBAL_ENCRYPT_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `GLOBAL_ENCRYPT_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEY_COUNT`
--

DROP TABLE IF EXISTS `KEY_COUNT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KEY_COUNT` (
  `KEY_COUNT` int(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEY_COUNT`
--

LOCK TABLES `KEY_COUNT` WRITE;
/*!40000 ALTER TABLE `KEY_COUNT` DISABLE KEYS */;
/*!40000 ALTER TABLE `KEY_COUNT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEY_ENCRYPT_KEY`
--

DROP TABLE IF EXISTS `KEY_ENCRYPT_KEY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KEY_ENCRYPT_KEY` (
  `ENCRYPT_KEY` varchar(1000) NOT NULL,
  `CREATE_DATE` varchar(14) DEFAULT NULL COMMENT 'yyyymmddhhmmss',
  `BACKUP_DATE` varchar(14) DEFAULT NULL COMMENT 'yyyymmddhhmmss',
  `RESTORE_DATE` varchar(14) DEFAULT NULL COMMENT 'yyyymmddhhmmss',
  `DISCARD_DATE` varchar(14) DEFAULT NULL COMMENT 'Yyyymmddhhmmss, INDEX',
  `STATE` varchar(1) DEFAULT NULL COMMENT 'NULL: 정상, E: 폐기'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEY_ENCRYPT_KEY`
--

LOCK TABLES `KEY_ENCRYPT_KEY` WRITE;
/*!40000 ALTER TABLE `KEY_ENCRYPT_KEY` DISABLE KEYS */;
/*!40000 ALTER TABLE `KEY_ENCRYPT_KEY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POLICY_ACCESS_CONTROL`
--

DROP TABLE IF EXISTS `POLICY_ACCESS_CONTROL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `POLICY_ACCESS_CONTROL` (
  `CONNECT_IP` varchar(23) NOT NULL COMMENT 'IP address or ALL, NOT NULL',
  `CONNECT_DB_USER` varchar(64) NOT NULL COMMENT 'DB USER or ALL, NOT NULL',
  `START_TIME` varchar(14) DEFAULT NULL COMMENT 'yyyymmddhhmmss, ALL',
  `END_TIME` varchar(14) DEFAULT NULL COMMENT 'yyyymmddhhmmss, ALL',
  `CONNECT_PROGRAM_NAME` varchar(64) DEFAULT NULL COMMENT 'Program name OR ALL',
  `DELETE_DATE` varchar(14) DEFAULT NULL COMMENT 'yyyymmddhhmmss, INDEX',
  `POLICY_ACCESS_CONTROL_ID` bigint(19) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`POLICY_ACCESS_CONTROL_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POLICY_ACCESS_CONTROL`
--

LOCK TABLES `POLICY_ACCESS_CONTROL` WRITE;
/*!40000 ALTER TABLE `POLICY_ACCESS_CONTROL` DISABLE KEYS */;
/*!40000 ALTER TABLE `POLICY_ACCESS_CONTROL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WORK_CONTROL`
--

DROP TABLE IF EXISTS `WORK_CONTROL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WORK_CONTROL` (
  `REQUEST_TIME` varchar(14) NOT NULL COMMENT 'yyyymmddhhmmss',
  `REQUEST_ID` varchar(16) NOT NULL,
  `WORK_DB_USER` varchar(64) NOT NULL,
  `WORK_IP` varchar(23) NOT NULL,
  `WORK_START_TIME` varchar(14) DEFAULT NULL COMMENT 'yyyymmddhhmmss',
  `WORK_END_TIME` varchar(14) DEFAULT NULL COMMENT 'yyyymmddhhmmss',
  `APPROVE_ADMIN_ID` varchar(16) DEFAULT NULL,
  `APPROVE_TIME` varchar(14) DEFAULT NULL COMMENT 'yyyymmddhhmmss, INDEX',
  `SYSTEM_APPLY_DATE` varchar(14) DEFAULT NULL COMMENT 'yyyymmddhhmmss, INDEX',
  `WORK_CONTROL_ID` bigint(19) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`WORK_CONTROL_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WORK_CONTROL`
--

LOCK TABLES `WORK_CONTROL` WRITE;
/*!40000 ALTER TABLE `WORK_CONTROL` DISABLE KEYS */;
/*!40000 ALTER TABLE `WORK_CONTROL` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-01-17 13:26:52
