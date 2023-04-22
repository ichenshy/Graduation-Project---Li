-- MySQL dump 10.13  Distrib 5.7.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: glkt_user
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
-- Current Database: `glkt_user`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `glkt_user` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `glkt_user`;

--
-- Table structure for table `user_info`
--

DROP TABLE IF EXISTS `user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `phone` varchar(200) DEFAULT NULL COMMENT '手机号',
  `password` varchar(200) DEFAULT NULL COMMENT '用户密码',
  `name` varchar(200) DEFAULT NULL COMMENT '用户姓名',
  `nick_name` varchar(100) DEFAULT NULL COMMENT '昵称',
  `sex` tinyint(3) DEFAULT NULL COMMENT '性别',
  `avatar` varchar(200) DEFAULT NULL COMMENT '头像',
  `province` varchar(30) DEFAULT NULL,
  `subscribe` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0：未订阅 1：已订阅',
  `open_id` varchar(45) DEFAULT NULL COMMENT '小程序open id',
  `union_id` varchar(45) DEFAULT NULL COMMENT '微信开放平台unionID',
  `recommend_id` bigint(20) DEFAULT NULL COMMENT '推荐人用户id',
  `status` tinyint(3) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_info`
--

LOCK TABLES `user_info` WRITE;
/*!40000 ALTER TABLE `user_info` DISABLE KEYS */;
INSERT INTO `user_info` (`id`, `phone`, `password`, `name`, `nick_name`, `sex`, `avatar`, `province`, `subscribe`, `open_id`, `union_id`, `recommend_id`, `status`, `create_time`, `update_time`, `is_deleted`) VALUES (1,'15611248741',NULL,NULL,'晴天',1,'https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIB1WtJibSTqXvnJccFhOR1cSpVpdQ3BP5eTPCUO9CyI1feDefMoUFyA4E2C1oe2j8VMLrtAyBricvA/132','成都',0,'oQTXC56A4KDJuNRgj7hSoOqbxtDw',NULL,NULL,NULL,'2021-10-20 23:19:29','2021-11-23 03:32:44',0),(24,'13562359685',NULL,NULL,'简',0,'https://thirdwx.qlogo.cn/mmopen/vi_32/2GVkdw3J3kLruw37EYdW6RsFNUEL5mX5K3tgDolibM8hYICibPXpFIneMzyQpkFI0TsnE8R5ryUMvriaBmBNmNOsQ/132','',0,'oQTXC51A-QwGey9bsMH0rwP6pj0g0',NULL,1,NULL,'2021-11-23 02:14:00','2021-11-26 02:31:55',0),(25,'13810168266',NULL,NULL,'晨',0,'https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIB1WtJibSTqXsnvhFoEV7vpEMZkCfT0E9ib1TnUFHUYSppWy575onuuEDH8NRwU4aDj8PwXjQjY9OA/132','',0,'oQTXC5zyE9p-gp7T_qUnFlv8VbB0',NULL,1,NULL,'2021-11-23 02:49:00','2021-11-26 00:45:40',0),(26,'13716962779',NULL,NULL,'张晓飞',0,'https://thirdwx.qlogo.cn/mmopen/vi_32/vByI6bJx9js2GLBicLYGXJKy5cnRq9ojCBNmk3Zesakia8eShdfwV6JLfIumJyEPtLerUlQDwcF6ng8OuugaKEjg/132','',0,'oQTXC5xUafs2LDYATkXsXigZkE98',NULL,1,NULL,'2021-11-23 02:49:03','2021-11-26 00:45:40',0),(27,'17512080612',NULL,NULL,'我是',0,'https://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqhPquGcKzauUrwFxf82UfZVGbXApUU2vXhnQ7ZmSyHkGnPpUibahRs49vJcibTp1Co8iawppr0McL2A/132','',0,'oQTXC5znK6fxptadSmzTwjNIPbKo',NULL,1,NULL,'2021-11-23 02:50:02','2021-11-26 00:45:41',0),(28,'15901520518',NULL,NULL,'婷儿姐',0,'https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIVXAe2FkRhjYicibOVzMZrsEaObjmNMes9ru9ZNjx6WXt6aQSQsiccw25r2FzeGIqlUcYson4uQ8Bcw/132','',0,'oQTXC51Qq1bxuVcpivsiW3xeC6Us',NULL,1,NULL,'2021-11-23 02:52:48','2021-11-26 00:45:42',0),(29,'13500009888',NULL,NULL,'吧',0,'https://thirdwx.qlogo.cn/mmopen/vi_32/2GVkdw3J3kLruw37EYdW6RsFNUEL5mX5K3tgDolibM8hYICibPXpFIneMzyQpkFI0TsnE8R5ryUMvriaBmBNmNOsQ/132','',0,'oQTXC51A-QwGey9bsMH0rwP6pj0g',NULL,NULL,NULL,'2021-11-26 02:33:03','2021-11-26 02:39:46',0),(30,'13766816630',NULL,NULL,'环',0,'https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTInJ6LZx4So2d41ZWmv0z9hmM4yaE2dn2gvBeiasssw66NQCibuou4icHyMhjdu9ZQR6xiav2qswyNylA/132','',0,'oQTXC5x67M6p0kvuP8aDUrz3WZPg',NULL,NULL,NULL,'2021-11-26 02:34:11','2021-11-26 02:39:52',0),(37,NULL,NULL,NULL,'Galaxy',0,'https://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqQWN93KM5m6RRdLIzDa2PbiafRvUQTibLLh54v7WYIBJpmrKbrb8RhKP2g9m2CzpZ49ZQejejRSqTg/132','',0,'oPQgq6zf4KunDjmhlzgZgvgCCI8Y',NULL,NULL,NULL,'2023-01-12 14:33:26','2023-01-12 14:33:26',0);
/*!40000 ALTER TABLE `user_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_login_log`
--

DROP TABLE IF EXISTS `user_login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_login_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `ip` varchar(64) DEFAULT NULL COMMENT '登录ip',
  `city` varchar(64) DEFAULT NULL COMMENT '登录城市',
  `type` tinyint(1) DEFAULT NULL COMMENT '登录类型【0-web，1-移动】',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT '0' COMMENT '删除标记（0:不可用 1:可用）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户登陆记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_login_log`
--

LOCK TABLES `user_login_log` WRITE;
/*!40000 ALTER TABLE `user_login_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_login_log` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-16 12:16:51
