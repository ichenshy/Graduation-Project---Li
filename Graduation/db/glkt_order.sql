-- MySQL dump 10.13  Distrib 5.7.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: glkt_order
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
-- Current Database: `glkt_order`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `glkt_order` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `glkt_order`;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `course_id` bigint(20) DEFAULT NULL COMMENT '课程id',
  `course_name` varchar(4000) DEFAULT NULL COMMENT '课程名称',
  `cover` varchar(255) DEFAULT NULL COMMENT '课程封面',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单编号',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `origin_amount` decimal(16,2) DEFAULT NULL COMMENT '原始金额',
  `coupon_reduce` decimal(16,2) DEFAULT NULL COMMENT '优惠劵减免金额',
  `final_amount` decimal(16,2) DEFAULT NULL COMMENT '最终金额',
  `session_id` varchar(4000) DEFAULT NULL COMMENT '会话id 当前会话id 继承购物车中会话id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_oid_cid` (`order_id`,`course_id`),
  KEY `idx_cid` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='订单明细 订单明细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` (`id`, `course_id`, `course_name`, `cover`, `order_id`, `user_id`, `origin_amount`, `coupon_reduce`, `final_amount`, `session_id`, `create_time`, `update_time`, `is_deleted`) VALUES (1,19,'Java学习教程，Java基础教程','http://47.93.148.192:9000/gmall/20211122/1504320cbe2b246514.jpg',1,1,1000.00,0.00,1000.00,NULL,'2021-11-22 05:38:47','2022-08-14 13:37:03',0),(2,7,'Java学习教程，Java基础教程','https://online-teach-file.oss-cn-beijing.aliyuncs.com/cover/2021/08/10/9452b057-6ad6-4600-891e-b168083fee4d.jpg',2,1,23800.00,0.00,23800.00,NULL,'2021-11-23 02:09:08','2022-08-14 13:37:03',0),(3,19,'Java学习教程，Java基础教程','http://47.93.148.192:9000/gmall/20211122/1504320cbe2b246514.jpg',3,25,1000.00,0.00,1000.00,NULL,'2021-11-23 02:54:51','2022-08-14 13:37:03',0),(4,18,'Java学习教程，Java基础教程','https://online-teach-file.oss-cn-beijing.aliyuncs.com/cover/2021/08/09/e4ee03d7-52bd-41ca-99f9-04dc23250a71.jpg',4,1,22800.00,0.00,22800.00,NULL,'2021-11-23 02:57:27','2022-08-14 13:37:03',0),(5,19,'Java学习教程，Java基础教程','http://47.93.148.192:9000/gmall/20211122/1504320cbe2b246514.jpg',5,27,1000.00,0.00,1000.00,NULL,'2021-11-23 02:57:52','2022-08-14 13:37:03',0),(6,4,'Java学习教程，Java基础教程','https://online-teach-file.oss-cn-beijing.aliyuncs.com/cover/2021/08/09/a16c5694-3037-4330-b1c5-438052081fcb.jpg',6,1,19800.00,0.00,19800.00,NULL,'2021-11-26 00:56:07','2022-08-14 13:37:03',0),(7,19,'Spring Boot学习教程','http://47.93.148.192:9000/gmall/20211122/1504320cbe2b246514.jpg',7,29,1000.00,0.00,1000.00,NULL,'2021-11-26 02:35:46','2022-08-14 13:37:03',0),(8,19,'Spring Boot学习教程','http://47.93.148.192:9000/gmall/20211122/1504320cbe2b246514.jpg',8,32,1000.00,0.00,1000.00,NULL,'2021-12-28 07:25:01','2022-08-14 13:37:03',0);
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_info`
--

DROP TABLE IF EXISTS `order_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `nick_name` varchar(30) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `origin_amount` decimal(10,2) DEFAULT NULL COMMENT '原始金额',
  `coupon_reduce` decimal(10,2) DEFAULT NULL COMMENT '优惠券减免',
  `final_amount` decimal(10,2) DEFAULT NULL COMMENT '最终金额',
  `order_status` varchar(20) DEFAULT NULL COMMENT '订单状态',
  `out_trade_no` varchar(50) DEFAULT NULL COMMENT '订单交易编号（第三方支付用)',
  `trade_body` varchar(200) DEFAULT NULL COMMENT '订单描述(第三方支付用)',
  `session_id` varchar(100) DEFAULT NULL COMMENT 'session id',
  `province` varchar(20) DEFAULT NULL COMMENT '地区id',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `expire_time` datetime DEFAULT NULL COMMENT '失效时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uid` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='订单表 订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_info`
--

LOCK TABLES `order_info` WRITE;
/*!40000 ALTER TABLE `order_info` DISABLE KEYS */;
INSERT INTO `order_info` (`id`, `user_id`, `nick_name`, `phone`, `origin_amount`, `coupon_reduce`, `final_amount`, `order_status`, `out_trade_no`, `trade_body`, `session_id`, `province`, `pay_time`, `expire_time`, `create_time`, `update_time`, `is_deleted`) VALUES (1,1,'晴天','15010546384',1000.00,500.00,500.00,'1','20211122213847830','JAVA之Mysql基础',NULL,'枣庄学院','2023-01-22 21:39:12',NULL,'2023-01-22 13:39:12','2023-02-07 05:40:13',0),(2,1,'晴天','15010546384',23800.00,0.00,23800.00,'1','20211123180908744','尚硅谷大数据技术之Sqoop',NULL,'枣庄学院','2023-01-22 21:39:12',NULL,'2023-01-22 13:39:12','2023-02-07 05:40:13',0),(3,25,'晨','13810168266',1000.00,0.00,1000.00,'1','20211123185451570','JAVA之Mysql基础',NULL,'枣庄学院','2023-01-22 21:39:12',NULL,'2023-01-22 13:39:12','2023-02-07 05:40:13',0),(4,1,'晴天','15069352568',22800.00,500.00,22300.00,'0','20211123185726513','Java精品课程',NULL,'枣庄学院','2023-01-22 21:39:12',NULL,'2023-01-22 13:39:12','2023-02-07 05:40:13',0),(5,27,'******','17512080612',1000.00,500.00,500.00,'0','20211123185752103','JAVA之Mysql基础',NULL,'枣庄学院','2023-01-22 21:39:12',NULL,'2023-01-22 13:39:12','2023-02-07 05:40:13',0),(6,1,'晴天','17512080612',19800.00,0.00,19800.00,'1','20211126165606808','尚硅谷大数据技术之HBase（2019新版）',NULL,'枣庄学院','2023-01-22 21:39:12',NULL,'2023-01-22 13:39:12','2023-02-07 05:40:13',0),(7,29,NULL,'13500009888',1000.00,0.00,1000.00,'1','20211126183546799','JAVA之Mysql基础',NULL,'枣庄学院','2023-01-22 21:39:12',NULL,'2023-01-22 13:39:12','2023-02-07 05:40:13',0),(8,32,'',NULL,1000.00,0.00,1000.00,'0','20211228152501327','JAVA之Mysql基础',NULL,'枣庄学院','2021-12-28 15:25:01',NULL,'2021-12-28 07:25:01','2023-02-07 05:40:13',0);
/*!40000 ALTER TABLE `order_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_info`
--

DROP TABLE IF EXISTS `payment_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `out_trade_no` varchar(50) DEFAULT NULL COMMENT '对外业务编号',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单编号',
  `user_id` bigint(20) DEFAULT NULL,
  `alipay_trade_no` varchar(50) DEFAULT NULL COMMENT '支付宝交易编号',
  `total_amount` decimal(10,2) DEFAULT NULL COMMENT '支付金额',
  `trade_body` varchar(200) DEFAULT NULL COMMENT '交易内容',
  `payment_type` varchar(20) DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT NULL COMMENT '支付状态',
  `callback_content` varchar(1000) DEFAULT NULL COMMENT '回调信息',
  `callback_time` datetime DEFAULT NULL COMMENT '回调时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_oid` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='支付信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_info`
--

LOCK TABLES `payment_info` WRITE;
/*!40000 ALTER TABLE `payment_info` DISABLE KEYS */;
INSERT INTO `payment_info` (`id`, `out_trade_no`, `order_id`, `user_id`, `alipay_trade_no`, `total_amount`, `trade_body`, `payment_type`, `payment_status`, `callback_content`, `callback_time`, `create_time`, `update_time`, `is_deleted`) VALUES (1,'20211122213847830',1,1,NULL,0.01,'JAVA之Mysql基础','2','2','{transaction_id=4200001236202111223264279278, nonce_str=60QD7Oevf9wU02zc, trade_state=SUCCESS, bank_type=OTHERS, openid=oQTXC56A4KDJuNRgj7hSoOqbxtDw, sign=1D685646F5D4D5BB4AEA9A3285A322B0, return_msg=OK, fee_type=CNY, mch_id=1481962542, cash_fee=1, out_trade_no=20211122213847830, cash_fee_type=CNY, appid=wxf913bfa3a2c7eeeb, total_fee=1, trade_state_desc=支付成功, trade_type=JSAPI, result_code=SUCCESS, attach=, time_end=20211122213909, is_subscribe=Y, return_code=SUCCESS}','2023-01-22 21:39:12','2023-01-22 13:39:12','2023-02-07 05:39:09',0),(2,'20211123180908744',2,1,NULL,0.01,'尚硅谷大数据技术之Sqoop','2','2','{transaction_id=4200001120202111230211882387, nonce_str=wn4XulMGtpBWmHvP, trade_state=SUCCESS, bank_type=OTHERS, openid=oQTXC56A4KDJuNRgj7hSoOqbxtDw, sign=0F505EC786ECC4C649578D8A71DE139C, return_msg=OK, fee_type=CNY, mch_id=1481962542, cash_fee=1, out_trade_no=20211123180908744, cash_fee_type=CNY, appid=wxf913bfa3a2c7eeeb, total_fee=1, trade_state_desc=支付成功, trade_type=JSAPI, result_code=SUCCESS, attach=, time_end=20211123180927, is_subscribe=Y, return_code=SUCCESS}','2023-01-22 21:39:12','2023-01-22 13:39:12','2023-02-07 05:39:09',0),(3,'20211123185451570',3,25,NULL,0.01,'JAVA之Mysql基础','2','2','{transaction_id=4200001123202111233106099225, nonce_str=VNHOOhJVvGW8V0xo, trade_state=SUCCESS, bank_type=OTHERS, openid=oQTXC5zyE9p-gp7T_qUnFlv8VbB0, sign=CE0049BC9A1922CF70F423AC406BEB88, return_msg=OK, fee_type=CNY, mch_id=1481962542, cash_fee=1, out_trade_no=20211123185451570, cash_fee_type=CNY, appid=wxf913bfa3a2c7eeeb, total_fee=1, trade_state_desc=支付成功, trade_type=JSAPI, result_code=SUCCESS, attach=, time_end=20211123185502, is_subscribe=N, return_code=SUCCESS}','2023-01-22 21:39:12','2023-01-22 13:39:12','2023-02-07 05:39:09',0),(4,'20211123185726513',4,1,NULL,0.01,'Java精品课程','2','1',NULL,'2023-01-22 21:39:12','2023-01-22 13:39:12','2023-02-07 05:39:09',0),(5,'20211123185752103',5,27,NULL,0.01,'JAVA之Mysql基础','2','1',NULL,'2023-01-22 21:39:12','2023-01-22 13:39:12','2023-02-07 05:39:09',0),(6,'20211126165606808',6,1,NULL,0.01,'尚硅谷大数据技术之HBase（2019新版）','2','2','{transaction_id=4200001146202111266807786474, nonce_str=xTJGeq7F0Dz0c0U8, trade_state=SUCCESS, bank_type=OTHERS, openid=oQTXC56A4KDJuNRgj7hSoOqbxtDw, sign=201D5B989A83376A3AA34DFDAB457CFF, return_msg=OK, fee_type=CNY, mch_id=1481962542, cash_fee=1, out_trade_no=20211126165606808, cash_fee_type=CNY, appid=wxf913bfa3a2c7eeeb, total_fee=1, trade_state_desc=支付成功, trade_type=JSAPI, result_code=SUCCESS, attach=, time_end=20211126165619, is_subscribe=Y, return_code=SUCCESS}','2023-01-22 21:39:12','2023-01-22 13:39:12','2023-02-07 05:39:09',0),(7,'20211126183546799',7,29,NULL,0.01,'JAVA之Mysql基础','2','2','{transaction_id=4200001228202111261700574727, nonce_str=pzhJ1kkbfSwFMslY, trade_state=SUCCESS, bank_type=OTHERS, openid=oQTXC51A-QwGey9bsMH0rwP6pj0g, sign=5B8528ED454C09E24F4297A97345FD87, return_msg=OK, fee_type=CNY, mch_id=1481962542, cash_fee=1, out_trade_no=20211126183546799, cash_fee_type=CNY, appid=wxf913bfa3a2c7eeeb, total_fee=1, trade_state_desc=支付成功, trade_type=JSAPI, result_code=SUCCESS, attach=, time_end=20211126183611, is_subscribe=Y, return_code=SUCCESS}','2023-01-22 21:39:12','2023-01-22 13:39:12','2023-02-07 05:39:09',0);
/*!40000 ALTER TABLE `payment_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-16 12:16:38
