-- MySQL dump 10.13  Distrib 5.7.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: glkt_wechat
-- ------------------------------------------------------
-- Server version	5.7.38

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
-- Current Database: `glkt_wechat`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `glkt_wechat` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `glkt_wechat`;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级id',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `type` varchar(10) DEFAULT NULL COMMENT '类型',
  `url` varchar(100) DEFAULT NULL COMMENT '网页 链接，用户点击菜单可打开链接',
  `meun_key` varchar(20) DEFAULT NULL COMMENT '菜单KEY值，用于消息接口推送',
  `sort` tinyint(3) DEFAULT NULL COMMENT '排序',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='订单明细 订单明细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` (`id`, `parent_id`, `name`, `type`, `url`, `meun_key`, `sort`, `create_time`, `update_time`, `is_deleted`) VALUES (1,0,'热门',NULL,NULL,NULL,1,'2021-11-24 00:41:53','2022-08-14 10:42:34',0),(2,0,'课程',NULL,NULL,NULL,2,'2021-11-24 00:41:57','2021-11-24 17:33:52',0),(3,0,'我的',NULL,NULL,NULL,3,'2021-11-24 00:42:00','2021-11-24 17:34:16',0),(4,3,'关于我们','click',NULL,'aboutUs',10,'2021-11-24 00:42:05','2021-11-24 00:45:00',0),(5,1,'微服务架构演进','view','#/liveInfo/3','',2,'2021-11-24 02:29:12','2022-08-14 10:33:10',1),(6,1,'大数据Spark','view','#/liveInfo/2','',1,'2021-11-24 02:29:24','2022-08-14 10:33:06',1),(7,2,'后端开发','view','#/course/1','',1,'2021-11-24 02:31:48','2022-08-14 10:39:03',1),(8,2,'大数据','view','#/course/14','',2,'2021-11-24 02:31:59','2022-08-14 10:39:05',1),(9,3,'我的订单','view','#/order','',1,'2021-11-24 17:19:25','2022-08-14 10:28:19',1),(10,3,'我的课程','view','#/myCourse','',2,'2021-11-24 17:26:51','2022-08-14 10:28:13',1),(11,1,'全部列表','view','#/live','',6,'2021-11-24 17:41:47','2022-08-14 10:28:23',1),(12,3,'我的优惠券','view','#/coupon',NULL,3,'2021-11-26 00:52:27','2022-08-14 10:28:17',1),(13,1,'11月26日晚8点电商分享','view','#/liveInfo/8','',1,'2021-11-26 01:21:39','2022-08-14 10:33:09',1),(16,2,'前端开发','view','#/course/3','',3,'2022-08-14 10:30:34','2022-08-14 10:39:06',1),(17,2,'云计算','view','#/course/5','',4,'2022-08-14 10:30:47','2022-08-14 10:39:20',1),(18,2,'系统/运维','view','#/course/8','',5,'2022-08-14 10:31:01','2022-08-14 10:39:22',1),(19,2,'数据库','view','#/course/11','',5,'2022-08-14 10:31:53','2022-08-14 10:39:23',1),(20,1,'人工智能','view','#/course/17','',6,'2022-08-14 10:32:04','2022-08-14 10:33:12',1),(21,2,'编程语言','view','#/course/19','',11,'2022-08-14 10:32:24','2022-08-14 10:39:25',1),(23,1,'后端开发','view','course/1','',1,'2022-08-14 10:42:51','2022-08-14 10:42:51',0),(24,1,'前端开发','view','course/3','',2,'2022-08-14 10:43:03','2022-08-14 10:43:03',0),(25,1,'数据库','view','course/11','',3,'2022-08-14 10:43:25','2022-08-14 10:43:25',0),(26,1,'人工智能','view','course/17','',4,'2022-08-14 10:43:49','2022-08-14 10:43:49',0),(27,2,'云计算','view','course/5','',1,'2022-08-14 10:43:59','2022-08-14 10:43:59',0),(28,2,'系统/运维','view','course/8','',2,'2022-08-14 10:44:11','2022-08-14 10:44:11',0),(29,2,'大数据','view','course/14','',3,'2022-08-14 10:44:27','2022-08-14 10:44:27',0),(30,2,'编程语言','view','course/19','',4,'2022-08-14 10:44:46','2022-08-14 10:44:46',0),(31,3,'测试一下','click','','aboutUs',1,'2023-01-12 13:44:28','2023-01-12 13:44:28',0),(32,3,'获取优惠券','view','coupon','',1,'2023-01-12 15:01:53','2023-01-12 15:01:53',0);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-16 12:17:14
