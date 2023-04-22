-- MySQL dump 10.13  Distrib 5.7.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: glkt_vod
-- ------------------------------------------------------
-- Server version	5.7.38

/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE = @@TIME_ZONE */;
/*!40103 SET TIME_ZONE = '+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0 */;
/*!40101 SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES = @@SQL_NOTES, SQL_NOTES = 0 */;

--
-- Current Database: `glkt_vod`
--

CREATE DATABASE /*!32312 IF NOT EXISTS */ `glkt_vod` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `glkt_vod`;

--
-- Table structure for table `chapter`
--

DROP TABLE IF EXISTS `chapter`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chapter`
(
    `id`          bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
    `course_id`   bigint(20)          NOT NULL DEFAULT '0' COMMENT '课程ID',
    `title`       varchar(50)         NOT NULL COMMENT '章节名称',
    `sort`        int(10) unsigned    NOT NULL DEFAULT '0' COMMENT '显示排序',
    `create_time` timestamp           NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` timestamp           NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `is_deleted`  tinyint(3)          NOT NULL DEFAULT '0',
    PRIMARY KEY (`id`),
    KEY `idx_course_id` (`course_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 79
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='课程';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chapter`
--

LOCK TABLES `chapter` WRITE;
/*!40000 ALTER TABLE `chapter`
    DISABLE KEYS */;
INSERT INTO `chapter` (`id`, `course_id`, `title`, `sort`, `create_time`, `update_time`, `is_deleted`)
VALUES (72, 25, '第1章    Java入门基础及环境搭建', 0, '2022-08-14 13:00:48', '2022-08-14 13:18:51', 0),
       (76, 25, '第2章    java进阶', 1, '2022-08-14 13:16:03', '2022-08-14 13:33:54', 0),
       (77, 26, '第1章   Spring Boot入门', 0, '2022-08-14 13:30:08', '2022-08-14 13:33:54', 0),
       (78, 26, '第2章   Spring Boot进阶', 0, '2022-08-14 13:30:17', '2022-08-14 13:33:54', 0);
/*!40000 ALTER TABLE `chapter`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment`
(
    `id`          bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
    `course_id`   bigint(20)          NOT NULL DEFAULT '0' COMMENT '课程id',
    `teacher_id`  bigint(20)          NOT NULL DEFAULT '0' COMMENT '讲师id',
    `user_id`     bigint(20)          NOT NULL DEFAULT '0' COMMENT '会员id',
    `nickname`    varchar(50)                  DEFAULT NULL COMMENT '会员昵称',
    `avatar`      varchar(255)                 DEFAULT NULL COMMENT '会员头像',
    `content`     varchar(500)                 DEFAULT NULL COMMENT '评论内容',
    `create_time` timestamp           NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` timestamp           NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `is_deleted`  tinyint(3)          NOT NULL DEFAULT '0',
    PRIMARY KEY (`id`),
    KEY `idx_course_id` (`course_id`),
    KEY `idx_teacher_id` (`teacher_id`),
    KEY `idx_member_id` (`user_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='评论';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `comment`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course`
(
    `id`                bigint(20) unsigned             NOT NULL AUTO_INCREMENT COMMENT '主键',
    `teacher_id`        bigint(20)                      NOT NULL DEFAULT '0' COMMENT '课程讲师ID',
    `subject_id`        bigint(20)                      NOT NULL DEFAULT '0' COMMENT '课程专业ID',
    `subject_parent_id` bigint(20)                      NOT NULL DEFAULT '0' COMMENT '课程专业父级ID',
    `title`             varchar(50)                     NOT NULL COMMENT '课程标题',
    `price`             decimal(10, 2) unsigned         NOT NULL DEFAULT '0.00' COMMENT '课程销售价格，设置为0则可免费观看',
    `lesson_num`        int(10) unsigned                NOT NULL DEFAULT '0' COMMENT '总课时',
    `duration_sum`      int(11)                         NOT NULL DEFAULT '0' COMMENT '视频总时长（秒）',
    `cover`             varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '课程封面图片路径',
    `buy_count`         bigint(10) unsigned             NOT NULL DEFAULT '0' COMMENT '销售数量',
    `view_count`        bigint(10) unsigned             NOT NULL DEFAULT '0' COMMENT '浏览数量',
    `status`            tinyint(3)                      NOT NULL DEFAULT '0' COMMENT '课程状态 0未发布 1已发布',
    `publish_time`      datetime                                 DEFAULT NULL COMMENT '课程发布时间',
    `create_time`       timestamp                       NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`       timestamp                       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `is_deleted`        tinyint(3)                      NOT NULL DEFAULT '0',
    PRIMARY KEY (`id`),
    KEY `idx_title` (`title`),
    KEY `idx_subject_id` (`subject_id`),
    KEY `idx_teacher_id` (`teacher_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 27
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='课程';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course`
    DISABLE KEYS */;
INSERT INTO `course` (`id`, `teacher_id`, `subject_id`, `subject_parent_id`, `title`, `price`, `lesson_num`,
                      `duration_sum`, `cover`, `buy_count`, `view_count`, `status`, `publish_time`, `create_time`,
                      `update_time`, `is_deleted`)
VALUES (25, 1, 2, 1, 'Java学习教程，Java基础教程', 0.00, 30, 123,
        'https://graduation-1254443159.cos.ap-beijing.myqcloud.com/2022/08/14/94f8c1bff4d643c3939297de939ac7985-2001031A231238 .jpg',
        0, 42, 1, '2023-01-12 21:22:33', '2022-08-14 13:00:29', '2023-02-07 05:31:07', 0),
       (26, 1, 27, 1, 'Spring Boot学习教程', 123.00, 30, 123,
        'https://graduation-1254443159.cos.ap-beijing.myqcloud.com/2022/08/14/01221002e042487ca88e173f4c19aeb8spring.jpg',
        0, 36, 1, '2023-02-07 13:37:27', '2022-08-14 13:29:58', '2023-02-07 05:37:27', 0);
/*!40000 ALTER TABLE `course`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_collect`
--

DROP TABLE IF EXISTS `course_collect`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_collect`
(
    `id`          bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
    `course_id`   bigint(20)          NOT NULL DEFAULT '0' COMMENT '课程讲师ID',
    `user_id`     bigint(20)          NOT NULL DEFAULT '0' COMMENT '会员ID',
    `create_time` timestamp           NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` timestamp           NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `is_deleted`  tinyint(3)          NOT NULL DEFAULT '0',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='课程收藏';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_collect`
--

LOCK TABLES `course_collect` WRITE;
/*!40000 ALTER TABLE `course_collect`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `course_collect`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_description`
--

DROP TABLE IF EXISTS `course_description`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_description`
(
    `id`          bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
    `course_id`   bigint(20)                   DEFAULT NULL,
    `description` text COMMENT '课程简介',
    `create_time` timestamp           NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` timestamp           NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `is_deleted`  tinyint(3)          NOT NULL DEFAULT '0',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 27
  DEFAULT CHARSET = utf8mb4 COMMENT ='课程简介';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_description`
--

LOCK TABLES `course_description` WRITE;
/*!40000 ALTER TABLE `course_description`
    DISABLE KEYS */;
INSERT INTO `course_description` (`id`, `course_id`, `description`, `create_time`, `update_time`, `is_deleted`)
VALUES (1, 1,
        '<p>本套Java视频完全针对零基础学员，课堂实录，自发布以来，好评如潮！Java视频中注重与学生互动，讲授幽默诙谐、细致入微，覆盖Java基础所有核心知识点，同类Java视频中也是代码量大、案例多、实战性强的。同时，本Java视频教程注重技术原理剖析，深入JDK源码，辅以代码实战贯穿始终，用实践驱动理论，并辅以必要的代码练习。</p>',
        '2021-11-04 19:29:33', '2022-08-14 12:04:16', 1),
       (2, 2,
        '<p>本套Java视频完全针对零基础学员，课堂实录，自发布以来，好评如潮！Java视频中注重与学生互动，讲授幽默诙谐、细致入微，覆盖Java基础所有核心知识点，同类Java视频中也是代码量大、案例多、实战性强的。同时，本Java视频教程注重技术原理剖析，深入JDK源码，辅以代码实战贯穿始终，用实践驱动理论，并辅以必要的代码练习。</p>',
        '2021-11-04 19:30:07', '2022-08-14 12:04:14', 1),
       (3, 3,
        '<p>本套Java视频完全针对零基础学员，课堂实录，自发布以来，好评如潮！Java视频中注重与学生互动，讲授幽默诙谐、细致入微，覆盖Java基础所有核心知识点，同类Java视频中也是代码量大、案例多、实战性强的。同时，本Java视频教程注重技术原理剖析，深入JDK源码，辅以代码实战贯穿始终，用实践驱动理论，并辅以必要的代码练习。</p>',
        '2021-11-04 19:30:47', '2022-08-14 12:04:12', 1),
       (4, 4,
        '<p>本套Java视频完全针对零基础学员，课堂实录，自发布以来，好评如潮！Java视频中注重与学生互动，讲授幽默诙谐、细致入微，覆盖Java基础所有核心知识点，同类Java视频中也是代码量大、案例多、实战性强的。同时，本Java视频教程注重技术原理剖析，深入JDK源码，辅以代码实战贯穿始终，用实践驱动理论，并辅以必要的代码练习。</p>\n<p>------------------------------------</p>\n<p>视频特点：</p>\n<p>通过学习本Java视频教程，大家能够真正将Java基础知识学以致用、活学活用，构架Java编程思想，牢牢掌握\"源码级\"的Javase核心技术，并为后续JavaWeb等技术的学习奠定扎实基础。<br /><br />1.通俗易懂，细致入微：每个知识点高屋建瓴，深入浅出，简洁明了的说明问题<br />2.具实战性：全程真正代码实战，涵盖上百个企业应用案例及练习<br />3.深入：源码分析，更有 Java 反射、动态代理的实际应用等<br />4.登录尚硅谷官网，技术讲师免费在线答疑</p>\n',
        '2021-11-04 19:33:18', '2022-08-14 12:04:21', 1),
       (5, 5,
        '<p>本套Java视频完全针对零基础学员，课堂实录，自发布以来，好评如潮！Java视频中注重与学生互动，讲授幽默诙谐、细致入微，覆盖Java基础所有核心知识点，同类Java视频中也是代码量大、案例多、实战性强的。同时，本Java视频教程注重技术原理剖析，深入JDK源码，辅以代码实战贯穿始终，用实践驱动理论，并辅以必要的代码练习。</p>',
        '2021-11-04 19:41:05', '2022-08-14 12:04:10', 1),
       (6, 6,
        '<p>本套Java视频完全针对零基础学员，课堂实录，自发布以来，好评如潮！Java视频中注重与学生互动，讲授幽默诙谐、细致入微，覆盖Java基础所有核心知识点，同类Java视频中也是代码量大、案例多、实战性强的。同时，本Java视频教程注重技术原理剖析，深入JDK源码，辅以代码实战贯穿始终，用实践驱动理论，并辅以必要的代码练习。</p>',
        '2021-11-04 19:41:27', '2022-08-14 12:04:02', 1),
       (7, 7,
        '<p>本套Java视频完全针对零基础学员，课堂实录，自发布以来，好评如潮！Java视频中注重与学生互动，讲授幽默诙谐、细致入微，覆盖Java基础所有核心知识点，同类Java视频中也是代码量大、案例多、实战性强的。同时，本Java视频教程注重技术原理剖析，深入JDK源码，辅以代码实战贯穿始终，用实践驱动理论，并辅以必要的代码练习。</p>',
        '2021-11-04 19:41:43', '2022-08-14 12:04:06', 1),
       (8, 8,
        '<p>本套Java视频完全针对零基础学员，课堂实录，自发布以来，好评如潮！Java视频中注重与学生互动，讲授幽默诙谐、细致入微，覆盖Java基础所有核心知识点，同类Java视频中也是代码量大、案例多、实战性强的。同时，本Java视频教程注重技术原理剖析，深入JDK源码，辅以代码实战贯穿始终，用实践驱动理论，并辅以必要的代码练习。</p>\n<p>------------------------------------</p>\n<p>视频特点：</p>\n<p>通过学习本Java视频教程，大家能够真正将Java基础知识学以致用、活学活用，构架Java编程思想，牢牢掌握\"源码级\"的Javase核心技术，并为后续JavaWeb等技术的学习奠定扎实基础。<br /><br />1.通俗易懂，细致入微：每个知识点高屋建瓴，深入浅出，简洁明了的说明问题<br />2.具实战性：全程真正代码实战，涵盖上百个企业应用案例及练习<br />3.深入：源码分析，更有 Java 反射、动态代理的实际应用等<br />4.登录尚硅谷官网，技术讲师免费在线答疑</p>',
        '2021-11-04 19:42:01', '2022-08-14 12:04:07', 1),
       (9, 14,
        '<p>本套Java视频完全针对零基础学员，课堂实录，自发布以来，好评如潮！Java视频中注重与学生互动，讲授幽默诙谐、细致入微，覆盖Java基础所有核心知识点，同类Java视频中也是代码量大、案例多、实战性强的。同时，本Java视频教程注重技术原理剖析，深入JDK源码，辅以代码实战贯穿始终，用实践驱动理论，并辅以必要的代码练习。</p>',
        '2021-11-04 19:42:16', '2021-11-08 03:27:24', 0),
       (15, 15,
        '<p>本套Java视频完全针对零基础学员，课堂实录，自发布以来，好评如潮！Java视频中注重与学生互动，讲授幽默诙谐、细致入微，覆盖Java基础所有核心知识点，同类Java视频中也是代码量大、案例多、实战性强的。同时，本Java视频教程注重技术原理剖析，深入JDK源码，辅以代码实战贯穿始终，用实践驱动理论，并辅以必要的代码练习。</p>',
        '2021-11-04 19:42:32', '2022-08-14 12:04:23', 1),
       (18, 18,
        '<p>本套Java视频完全针对零基础学员，课堂实录，自发布以来，好评如潮！Java视频中注重与学生互动，讲授幽默诙谐、细致入微，覆盖Java基础所有核心知识点，同类Java视频中也是代码量大、案例多、实战性强的。同时，本Java视频教程注重技术原理剖析，深入JDK源码，辅以代码实战贯穿始终，用实践驱动理论，并辅以必要的代码练习。</p>',
        '2021-11-04 19:42:51', '2022-08-14 12:04:26', 1),
       (19, 19,
        ' 数据库就像一棵常青的技能树，无论是初级程序员还是CTO、首席架构师都能从中汲取足够的技术养料。菜鸟往往积累单点技术，如 DML、DDL、存储过程和函数、约束、索引的数据结构，老鸟则需要吃透底层原理，数据库事务ACID如何实现？锁机制与MVCC又是怎么回事？分布式场景下数据库怎么优化保持高性能？\n      知道怎么用是一方面，知道为什么则是更为稀缺的能力。程序员核心能力中至关重要的一点：精通数据库。精通意味着：第一，形成知识网，更灵活地应对突发问题；第二，懂底层原理，更自由地应对复杂多变的业务场景。',
        '2021-11-22 03:09:22', '2022-08-13 16:49:25', 1),
       (20, 20, '添加课程测试添加课程测试添加课程测试', '2022-08-11 08:53:36', '2022-08-11 10:56:52', 0),
       (21, 21, '测试课程', '2022-08-11 09:05:55', '2022-08-11 09:05:55', 0),
       (22, 22, 'test', '2022-08-13 16:22:20', '2022-08-13 17:56:09', 1),
       (23, 23, 'test', '2022-08-13 16:23:24', '2022-08-13 17:56:07', 1),
       (24, 24, 'test', '2022-08-13 16:26:16', '2022-08-13 16:26:16', 0),
       (25, 25,
        'Java 是一门面向对象编程语言，不仅吸收了 C++ 语言的各种优点，还摒弃了 C++ 里难以理解的多继承、指针等概念。Java 不但可以用来开发网站后台、PC 客户端和 Android APP，还在数据分析、网络爬虫、云计算领域大显身手。\n\n从学术的角度讲，初学者需要花费不少时间来熟悉面向对象的概念、语法和编程思想。学习过程中有不理解的地方大家一定要坚持，多花时间编写代码自然会豁然开朗。只有一步一个脚印，踏踏实实学习，才能从零基础到入门，再到精通。\n\n这套教程适用于没有任何 Java 基础，或者基础薄弱的学员，它通俗易懂，并且非常全面，30 天从入门到精通不是神话。',
        '2022-08-14 13:00:29', '2022-08-14 13:00:29', 0),
       (26, 26,
        '所周知 Spring 应用需要进行大量的配置，各种 XML 配置和注解配置让人眼花缭乱，且极容易出错，因此 Spring 一度被称为“配置地狱”。\n\n为了简化 Spring 应用的搭建和开发过程，Pivotal 团队在 Spring 基础上提供了一套全新的开源的框架，它就是 Spring Boot。\n',
        '2022-08-14 13:29:58', '2022-08-14 13:29:58', 0);
/*!40000 ALTER TABLE `course_description`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject`
(
    `id`          bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '主键',
    `title`       varchar(10)         NOT NULL COMMENT '类别名称',
    `parent_id`   bigint(20)          NOT NULL DEFAULT '0' COMMENT '父ID',
    `sort`        int(10) unsigned    NOT NULL DEFAULT '0' COMMENT '排序字段',
    `create_time` timestamp           NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` timestamp           NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `is_deleted`  tinyint(3)          NOT NULL DEFAULT '0',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='课程科目';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject`
    DISABLE KEYS */;
INSERT INTO `subject` (`id`, `title`, `parent_id`, `sort`, `create_time`, `update_time`, `is_deleted`)
VALUES (1, '后端开发', 0, 1, '2022-08-14 12:58:24', '2022-08-14 12:58:24', 0),
       (2, 'Java', 1, 1, '2022-08-14 12:58:24', '2022-08-14 12:58:44', 0),
       (3, '前端开发', 0, 3, '2022-08-14 12:58:24', '2022-08-14 12:58:24', 0),
       (4, 'HTML', 3, 1, '2022-08-14 12:58:44', '2022-08-14 12:58:44', 0),
       (5, '云计算', 0, 5, '2022-08-14 12:58:24', '2022-08-14 12:58:24', 0),
       (6, '网络通信知识', 5, 1, '2022-08-14 12:58:44', '2022-08-14 12:58:44', 0),
       (7, '虚拟化技术', 5, 2, '2022-08-14 12:58:44', '2022-08-14 12:58:44', 0),
       (8, '系统/运维', 0, 7, '2022-08-14 12:58:24', '2022-08-14 12:58:24', 0),
       (9, 'Linux', 8, 1, '2022-08-14 12:58:44', '2022-08-14 12:58:44', 0),
       (10, 'Windows', 8, 2, '2022-08-14 12:58:44', '2022-08-14 12:58:44', 0),
       (11, '数据库', 0, 9, '2022-08-14 12:58:24', '2022-08-14 12:58:24', 0),
       (12, 'MySQL', 11, 1, '2022-08-14 12:58:44', '2022-08-14 12:58:44', 0),
       (13, 'MongoDB', 11, 2, '2022-08-14 12:58:44', '2022-08-14 12:58:44', 0),
       (14, '大数据', 0, 11, '2022-08-14 12:58:24', '2022-08-14 12:58:24', 0),
       (15, 'Hadoop', 14, 1, '2022-08-14 12:58:44', '2022-08-14 12:58:44', 0),
       (16, 'Spark', 14, 2, '2022-08-14 12:58:44', '2022-08-14 12:58:44', 0),
       (17, '人工智能', 0, 13, '2022-08-14 12:58:24', '2022-08-14 12:58:24', 0),
       (18, 'Python', 17, 1, '2022-08-14 12:58:44', '2022-08-14 12:58:44', 0),
       (20, 'VB语言', 19, 1, '2022-08-14 12:58:44', '2022-08-14 12:58:44', 0),
       (21, 'R语言', 19, 2, '2022-08-14 12:58:44', '2022-08-14 12:58:44', 0),
       (22, '易语言', 19, 3, '2022-08-14 12:58:44', '2022-08-14 12:58:44', 0),
       (23, 'J2SE', 1, 2, '2022-08-14 12:58:44', '2022-08-14 12:58:44', 0),
       (24, 'Java Web', 1, 3, '2022-08-14 12:58:44', '2022-08-14 12:58:44', 0),
       (25, 'SpringMVC', 1, 4, '2022-08-14 12:58:44', '2022-08-14 12:58:44', 0),
       (26, 'J2ME', 1, 5, '2022-08-14 12:58:44', '2022-08-14 12:58:44', 0),
       (27, 'SpringBoot', 1, 6, '2022-08-14 12:58:44', '2022-08-14 12:58:44', 0),
       (28, 'SpringClou', 1, 7, '2022-08-14 12:58:44', '2022-08-14 13:37:46', 1),
       (29, 'CSS', 3, 2, '2022-08-14 12:58:44', '2022-08-14 12:58:44', 0),
       (30, 'JavaScript', 3, 3, '2022-08-14 12:58:44', '2022-08-14 12:58:44', 0),
       (31, 'jquery', 3, 4, '2022-08-14 12:58:44', '2022-08-14 12:58:44', 0),
       (32, 'TypeScript', 3, 5, '2022-08-14 12:58:44', '2022-08-14 12:58:44', 0),
       (33, 'vue', 3, 6, '2022-08-14 12:58:44', '2022-08-14 12:58:44', 0),
       (34, 'bootstrap', 3, 7, '2022-08-14 12:58:44', '2022-08-14 12:58:44', 0),
       (35, 'React', 3, 8, '2022-08-14 12:58:44', '2022-08-14 12:58:44', 0),
       (36, '云计算导论', 5, 3, '2022-08-14 12:58:44', '2022-08-14 12:58:44', 0),
       (37, '数据通信技术', 5, 4, '2022-08-14 12:58:44', '2022-08-14 12:58:44', 0),
       (38, '海量存储技术', 5, 5, '2022-08-14 12:58:44', '2022-08-14 12:58:44', 0),
       (39, '网络工程项目实施', 5, 6, '2022-08-14 12:58:44', '2022-08-14 12:58:44', 0),
       (40, '云计算综合案例应用', 5, 7, '2022-08-14 12:58:44', '2022-08-14 12:58:44', 0),
       (41, 'shell脚本', 8, 3, '2022-08-14 12:58:44', '2022-08-14 12:58:44', 0),
       (42, 'LA/NMP架构实战', 8, 4, '2022-08-14 12:58:44', '2022-08-14 12:58:44', 0),
       (43, 'Zabbix', 8, 5, '2022-08-14 12:58:44', '2022-08-14 12:58:44', 0),
       (44, 'LVS', 8, 6, '2022-08-14 12:58:44', '2022-08-14 12:58:44', 0),
       (45, 'Redis', 11, 3, '2022-08-14 12:58:44', '2022-08-14 12:58:44', 0),
       (46, '数据库原理', 11, 4, '2022-08-14 12:58:44', '2022-08-14 12:58:44', 0),
       (47, '数据库应用', 11, 5, '2022-08-14 12:58:44', '2022-08-14 12:58:44', 0),
       (48, '数据库概论', 11, 6, '2022-08-14 12:58:44', '2022-08-14 12:58:44', 0),
       (49, 'Oracle', 11, 7, '2022-08-14 12:58:44', '2022-08-14 12:58:44', 0),
       (50, 'YARN', 14, 3, '2022-08-14 12:58:45', '2022-08-14 12:58:45', 0),
       (51, 'Zookeeper', 14, 4, '2022-08-14 12:58:45', '2022-08-14 12:58:45', 0),
       (52, 'Sqoop', 14, 5, '2022-08-14 12:58:45', '2022-08-14 12:58:45', 0),
       (53, 'Oozie', 14, 6, '2022-08-14 12:58:45', '2022-08-14 12:58:45', 0),
       (54, 'Hbase', 14, 7, '2022-08-14 12:58:45', '2022-08-14 12:58:45', 0),
       (55, 'Kafka', 14, 1, '2022-08-14 12:58:45', '2022-08-14 12:58:45', 0),
       (56, '线性代数', 17, 2, '2022-08-14 12:58:45', '2022-08-14 12:58:45', 0),
       (57, '概率统计', 17, 3, '2022-08-14 12:58:45', '2022-08-14 12:58:45', 0),
       (58, '机器学习', 17, 4, '2022-08-14 12:58:45', '2022-08-14 12:58:45', 0),
       (59, '深度学习', 17, 5, '2022-08-14 12:58:45', '2022-08-14 12:58:45', 0),
       (60, '数据挖掘', 17, 6, '2022-08-14 12:58:45', '2022-08-14 12:58:45', 0),
       (61, 'Go语言', 19, 4, '2022-08-14 12:58:45', '2022-08-14 12:58:45', 0);
/*!40000 ALTER TABLE `subject`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher`
(
    `id`          bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
    `name`        varchar(20)         NOT NULL COMMENT '讲师姓名',
    `intro`       varchar(500)        NOT NULL DEFAULT '' COMMENT '讲师简介',
    `career`      varchar(500)                 DEFAULT NULL COMMENT '讲师资历,一句话说明讲师',
    `level`       int(10) unsigned    NOT NULL COMMENT '头衔 1高级讲师 2首席讲师',
    `avatar`      varchar(255)                 DEFAULT NULL COMMENT '讲师头像',
    `sort`        int(10) unsigned    NOT NULL DEFAULT '0' COMMENT '排序',
    `join_date`   date                         DEFAULT NULL COMMENT '入驻时间',
    `create_time` timestamp           NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` timestamp           NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `is_deleted`  tinyint(3)          NOT NULL DEFAULT '0',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_name` (`name`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 8
  DEFAULT CHARSET = utf8mb4 COMMENT ='讲师';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher`
    DISABLE KEYS */;
INSERT INTO `teacher` (`id`, `name`, `intro`, `career`, `level`, `avatar`, `sort`, `join_date`, `create_time`,
                       `update_time`, `is_deleted`)
VALUES (1, '张老师', '讲师', '高级讲师', 0,
        'https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIB1WtJibSTqXvnJccFhOR1cSpVpdQ3BP5eTPCUO9CyI1feDefMoUFyA4E2C1oe2j8VMLrtAyBricvA/132',
        0, '2021-11-02', '2021-11-04 19:18:36', '2022-08-11 09:12:40', 0),
       (2, '陈老师', '高级讲师', '高级讲师', 1,
        'https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIB1WtJibSTqXvnJccFhOR1cSpVpdQ3BP5eTPCUO9CyI1feDefMoUFyA4E2C1oe2j8VMLrtAyBricvA/132',
        0, '2021-11-02', '2021-11-04 19:18:51', '2022-08-11 09:12:40', 0),
       (4, '钟老师', '高级讲师', '高级讲师', 1,
        'https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIB1WtJibSTqXvnJccFhOR1cSpVpdQ3BP5eTPCUO9CyI1feDefMoUFyA4E2C1oe2j8VMLrtAyBricvA/132',
        0, '2021-11-02', '2021-11-07 21:51:21', '2021-11-07 22:24:28', 0),
       (5, '钱老师', '钱老师', '钱老师', 1,
        'https://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eo8uwBUP6f5JtibWlkmpPAVjsSsibMaFupwFRyo2Vr5Gkc33uctiasfOFgZADd5X1NYP82bKYjMDbFnA/132',
        3, '2021-11-01', '2021-11-22 05:26:58', '2021-11-23 02:26:54', 0),
       (6, '宋老师', '宋老师', '宋老师', 1,
        'https://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eo8uwBUP6f5JtibWlkmpPAVjsSsibMaFupwFRyo2Vr5Gkc33uctiasfOFgZADd5X1NYP82bKYjMDbFnA/132',
        4, '2021-11-02', '2021-11-23 02:25:58', '2021-11-23 02:26:53', 0),
       (7, '李老师', '李老师', '李老师', 0,
        'https://graduation-1254443159.cos.ap-beijing.myqcloud.com/2022/08/14/63b740bf98ad45cd82a3c4cbb2142268棒冰.jpg',
        1, '2022-08-14', '2022-08-14 12:01:28', '2022-08-14 12:01:28', 0);
/*!40000 ALTER TABLE `teacher`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video`
(
    `id`                  bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
    `course_id`           bigint(20)          NOT NULL DEFAULT '0' COMMENT '课程ID',
    `chapter_id`          bigint(20)          NOT NULL DEFAULT '0' COMMENT '章节ID',
    `title`               varchar(50)         NOT NULL COMMENT '节点名称',
    `video_source_id`     varchar(100)                 DEFAULT NULL COMMENT '云端视频资源',
    `video_original_name` varchar(100)                 DEFAULT NULL COMMENT '原始文件名称',
    `sort`                int(10) unsigned    NOT NULL DEFAULT '0' COMMENT '排序字段',
    `play_count`          bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '播放次数',
    `is_free`             tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否可以试听：0收费 1免费',
    `duration`            float               NOT NULL DEFAULT '0' COMMENT '视频时长（秒）',
    `size`                bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '视频源文件大小（字节）',
    `version`             bigint(20) unsigned NOT NULL DEFAULT '1' COMMENT '乐观锁',
    `status`              tinyint(3)          NOT NULL DEFAULT '0' COMMENT '状态',
    `create_time`         timestamp           NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`         timestamp           NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `is_deleted`          tinyint(3)          NOT NULL DEFAULT '0',
    PRIMARY KEY (`id`),
    KEY `idx_course_id` (`course_id`),
    KEY `idx_chapter_id` (`chapter_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 106
  DEFAULT CHARSET = utf8mb4
  ROW_FORMAT = COMPACT COMMENT ='课程视频';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video`
--

LOCK TABLES `video` WRITE;
/*!40000 ALTER TABLE `video`
    DISABLE KEYS */;
INSERT INTO `video` (`id`, `course_id`, `chapter_id`, `title`, `video_source_id`, `video_original_name`, `sort`,
                     `play_count`, `is_free`, `duration`, `size`, `version`, `status`, `create_time`, `update_time`,
                     `is_deleted`)
VALUES (51, 25, 72, '1.了解 Java 语言的版本及特点', '243791578555401580', '001.mp4', 0, 0, 1, 0, 0, 1, 0,
        '2022-08-14 13:01:01', '2023-01-12 14:31:24', 0),
       (52, 25, 72, '2.了解学习 Java 的方法', NULL, NULL, 1, 0, 0, 0, 0, 1, 0, '2022-08-14 13:01:24',
        '2022-08-14 13:24:54', 0),
       (53, 25, 72, '3.掌握 JDK 的安装', NULL, NULL, 0, 0, 0, 0, 0, 1, 0, '2022-08-14 13:01:39', '2022-08-14 13:24:54',
        0),
       (54, 25, 72, '4.掌握环境变量的配置', NULL, NULL, 0, 0, 0, 0, 0, 1, 0, '2022-08-14 13:01:44',
        '2022-08-14 13:24:54', 0),
       (55, 25, 72, '5.熟悉 Java 程序的编写、编译和运行过程', NULL, NULL, 0, 0, 0, 0, 0, 1, 0, '2022-08-14 13:01:50',
        '2022-08-14 13:24:54', 0),
       (76, 25, 76, '1.Java标识符和关键字', NULL, NULL, 0, 0, 0, 0, 0, 1, 0, '2022-08-14 13:16:22',
        '2022-08-14 13:27:22', 0),
       (77, 25, 76, '2.Java注释', NULL, NULL, 0, 0, 0, 0, 0, 1, 0, '2022-08-14 13:16:22', '2022-08-14 13:16:22', 0),
       (78, 25, 76, '3.Javadoc文档注释', NULL, NULL, 0, 0, 0, 0, 0, 1, 0, '2022-08-14 13:16:22', '2022-08-14 13:16:22',
        0),
       (79, 25, 76, '4.Java常量', NULL, NULL, 0, 0, 0, 0, 0, 1, 0, '2022-08-14 13:16:22', '2022-08-14 13:16:22', 0),
       (80, 25, 76, '5.Java变量声明和变量赋值', NULL, NULL, 0, 0, 0, 0, 0, 1, 0, '2022-08-14 13:16:22',
        '2022-08-14 13:16:22', 0),
       (81, 25, 76, '6.Java变量的作用域', NULL, NULL, 0, 0, 0, 0, 0, 1, 0, '2022-08-14 13:16:22', '2022-08-14 13:16:22',
        0),
       (82, 25, 76, '7.Java数据类型', NULL, NULL, 0, 0, 0, 0, 0, 1, 0, '2022-08-14 13:16:22', '2022-08-14 13:16:22', 0),
       (83, 25, 76, '8.Java数据类型转换', NULL, NULL, 0, 0, 0, 0, 0, 1, 0, '2022-08-14 13:16:22', '2022-08-14 13:16:22',
        0),
       (84, 25, 76, '9.Java算术运算符', NULL, NULL, 0, 0, 0, 0, 0, 1, 0, '2022-08-14 13:16:22', '2022-08-14 13:16:22',
        0),
       (85, 25, 76, '10.Java赋值运算符', NULL, NULL, 0, 0, 0, 0, 0, 1, 0, '2022-08-14 13:16:22', '2022-08-14 13:16:22',
        0),
       (86, 25, 76, '11.Java逻辑运算符', NULL, NULL, 0, 0, 0, 0, 0, 1, 0, '2022-08-14 13:16:22', '2022-08-14 13:16:22',
        0),
       (87, 25, 76, '12.Java关系运算符', NULL, NULL, 0, 0, 0, 0, 0, 1, 0, '2022-08-14 13:16:22', '2022-08-14 13:16:22',
        0),
       (88, 25, 76, '13.Java自增和自减运算符', NULL, NULL, 0, 0, 0, 0, 0, 1, 0, '2022-08-14 13:16:22',
        '2022-08-14 13:16:22', 0),
       (89, 25, 76, '14.Java位运算符', NULL, NULL, 0, 0, 0, 0, 0, 1, 0, '2022-08-14 13:16:22', '2022-08-14 13:16:22',
        0),
       (90, 25, 76, '15.Java条件运算符', NULL, NULL, 0, 0, 0, 0, 0, 1, 0, '2022-08-14 13:16:22', '2022-08-14 13:16:22',
        0),
       (91, 25, 76, '16.Java运算符优先级', NULL, NULL, 0, 0, 0, 0, 0, 1, 0, '2022-08-14 13:16:22',
        '2022-08-14 13:16:22', 0),
       (92, 25, 76, '17.Java直接量', NULL, NULL, 0, 0, 0, 0, 0, 1, 0, '2022-08-14 13:16:22', '2022-08-14 13:16:22', 0),
       (93, 26, 77, 'springboot 之自定义servlet', NULL, NULL, 0, 0, 0, 0, 0, 1, 0, '2022-08-14 13:30:13',
        '2022-08-14 13:34:39', 0),
       (94, 26, 77, 'springboot 之 自定义servlet的监听器', NULL, NULL, 0, 0, 0, 0, 0, 1, 0, '2022-08-14 13:30:22',
        '2022-08-14 13:35:02', 0),
       (95, 26, 77, 'springboot 之 自定义过滤器', NULL, NULL, 0, 0, 0, 0, 0, 1, 0, '2022-08-14 13:34:39',
        '2022-08-14 13:34:39', 0),
       (96, 26, 77, 'springboot 之 自定义拦截器', NULL, NULL, 0, 0, 0, 0, 0, 1, 0, '2022-08-14 13:34:39',
        '2022-08-14 13:34:39', 0),
       (97, 26, 77, 'springboot 之 自定义starter', NULL, NULL, 0, 0, 0, 0, 0, 1, 0, '2022-08-14 13:34:39',
        '2022-08-14 13:34:39', 0),
       (98, 26, 78, 'springboot 之 SpringBoot指定额外需要扫描的包', NULL, NULL, 0, 0, 0, 0, 0, 1, 0,
        '2022-08-14 13:34:39', '2022-08-14 13:35:02', 0),
       (99, 0, 78, 'springboot 之 读取配置文件', NULL, NULL, 0, 0, 0, 0, 0, 1, 0, '2022-08-14 13:35:02',
        '2022-08-14 13:35:02', 0),
       (100, 0, 78, 'springboot 之 使用枚举类+配置文件显完成可配置信息', NULL, NULL, 0, 0, 0, 0, 0, 1, 0,
        '2022-08-14 13:35:02', '2022-08-14 13:35:02', 0),
       (101, 0, 78, 'springboot 之 服务器参数配置', NULL, NULL, 0, 0, 0, 0, 0, 1, 0, '2022-08-14 13:35:02',
        '2022-08-14 13:35:02', 0),
       (102, 0, 78, 'springboot 之 多环境配置', NULL, NULL, 0, 0, 0, 0, 0, 1, 0, '2022-08-14 13:35:02',
        '2022-08-14 13:35:02', 0),
       (103, 0, 78, 'springboot 之 编译配置文件', NULL, NULL, 0, 0, 0, 0, 0, 1, 0, '2022-08-14 13:35:03',
        '2022-08-14 13:35:03', 0),
       (104, 0, 78, 'springboot打包成war包', NULL, NULL, 0, 0, 0, 0, 0, 1, 0, '2022-08-14 13:35:03',
        '2022-08-14 13:35:03', 0),
       (105, 0, 78, 'springboot 之 logback 日志配置详解', NULL, NULL, 0, 0, 0, 0, 0, 1, 0, '2022-08-14 13:35:03',
        '2022-08-14 13:35:03', 0);
/*!40000 ALTER TABLE `video`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_visitor`
--

DROP TABLE IF EXISTS `video_visitor`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_visitor`
(
    `id`          bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
    `course_id`   bigint(20)                   DEFAULT NULL COMMENT '课程id',
    `video_id`    bigint(20)          NOT NULL DEFAULT '0' COMMENT '视频id',
    `user_id`     varchar(50)         NOT NULL DEFAULT '0' COMMENT '来访者用户id',
    `nick_name`   varchar(100)                 DEFAULT NULL COMMENT '昵称',
    `join_time`   varchar(30)                  DEFAULT NULL COMMENT '进入时间',
    `leave_time`  varchar(30)                  DEFAULT NULL COMMENT '离开的时间',
    `duration`    bigint(20)                   DEFAULT NULL COMMENT '用户停留的时间(单位：秒)',
    `create_time` timestamp           NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` timestamp           NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `is_deleted`  tinyint(3)          NOT NULL DEFAULT '0',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 24
  DEFAULT CHARSET = utf8mb4 COMMENT ='视频来访者记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_visitor`
--

LOCK TABLES `video_visitor` WRITE;
/*!40000 ALTER TABLE `video_visitor`
    DISABLE KEYS */;
INSERT INTO `video_visitor` (`id`, `course_id`, `video_id`, `user_id`, `nick_name`, `join_time`, `leave_time`,
                             `duration`, `create_time`, `update_time`, `is_deleted`)
VALUES (1, 1, 31, '1', '晴天', '2021-11-22 21:39:27.089', NULL, 100000, '2021-11-22 05:39:27', '2022-08-11 11:20:31',
        0),
       (2, 19, 38, '1', '晴天', '2021-11-20 21:39:32.071', '2021-11-22 21:44:24.026', 696, '2021-11-22 05:39:32',
        '2021-11-24 18:12:41', 0),
       (3, 7, 26, '1', '晴天', '2021-11-23 18:09:46.899', '2021-11-23 18:10:13.004', 5, '2021-11-23 02:09:47',
        '2021-11-23 02:09:47', 0),
       (4, 19, 38, '24', '简', '2021-11-23 18:14:53.542', NULL, 2, '2021-11-23 02:14:53', '2021-11-23 02:14:53', 0),
       (5, 19, 37, '27', '晴天', '2021-11-23 18:54:29.848', '2021-11-23 18:54:34.864', 3, '2021-11-23 02:54:29',
        '2022-08-11 11:24:45', 0),
       (6, 19, 37, '1', '晴天', '2021-11-21 18:55:12.082', '2021-11-23 18:56:16.536', 33, '2021-11-23 02:55:12',
        '2021-11-24 18:02:25', 0),
       (7, 19, 38, '1', '晴天', '2021-11-22 18:55:13.395', '2021-11-23 18:56:45.709', 706, '2021-11-23 02:55:13',
        '2021-11-24 18:02:31', 0),
       (8, 19, 37, '1', '晴天', '2021-11-23 18:56:13.368', '2021-11-23 18:58:18.665', 13, '2021-11-23 02:56:13',
        '2021-11-23 02:56:13', 0),
       (9, 19, 39, '1', '晴天', '2021-11-23 18:56:21.513', '2021-11-23 18:56:43.032', 313, '2021-11-23 02:56:21',
        '2021-11-24 18:02:12', 0),
       (10, 19, 40, '1', '晴天', '2021-11-21 18:56:32.061', '2021-11-23 18:56:37.113', 202, '2021-11-23 02:56:32',
        '2021-11-24 18:02:55', 0),
       (11, 19, 40, '1', '晴天', '2021-11-23 18:58:23.67', '2021-11-23 19:38:19.261', 114, '2021-11-23 02:58:23',
        '2021-11-23 02:58:23', 0),
       (12, 19, 40, '1', '晴天', '2021-11-24 10:11:44.531', '2021-11-24 10:11:44.531', 115, '2021-11-23 18:11:58',
        '2021-11-24 18:03:06', 0),
       (13, 19, 38, '1', '晴天', '2021-11-26 09:11:55.905', '2021-11-26 21:05:35.152', 943, '2021-11-25 17:12:12',
        '2021-11-25 17:37:30', 0),
       (14, 4, 15, '1', '晴天', '2021-11-26 17:07:25.349', '2021-11-26 17:07:45.149', 304, '2021-11-26 01:07:25',
        '2021-11-26 01:07:25', 0),
       (15, 8, 30, '1', '晴天', '2021-11-26 17:14:35.189', NULL, 2, '2021-11-26 01:14:35', '2021-11-26 01:14:35', 0),
       (16, 19, 37, '29', NULL, '2021-11-26 18:38:39.719', NULL, 3, '2021-11-26 02:38:39', '2021-11-26 02:38:39', 0),
       (17, 19, 38, '1', '晴天', '2021-11-27 08:02:41.382', NULL, 944, '2021-11-26 16:02:41', '2021-11-26 16:02:41', 0),
       (18, 18, 33, '1', '晴天', '2021-12-01 13:49:37.599', NULL, 11, '2021-11-30 21:49:36', '2021-11-30 21:49:36', 0),
       (19, 18, 33, '1', '晴天', '2021-12-01 13:49:32.6', NULL, 6, '2021-11-30 21:49:36', '2021-11-30 21:49:36', 0),
       (20, 18, 33, '1', '晴天', '2021-12-01 13:49:27.665', NULL, 1, '2021-11-30 21:49:37', '2021-11-30 21:49:37', 0),
       (21, 18, 34, '1', '晴天', '2021-12-01 13:52:02.601', '2021-12-01 13:52:14.295', 202, '2021-11-30 21:52:02',
        '2023-02-07 05:34:37', 0),
       (22, 25, 51, '1', '晴天', '2021-12-16 09:26:31.258', NULL, 114, '2021-12-16 01:26:31', '2023-02-07 05:34:37', 0),
       (23, 26, 98, '27', '我是', '2021-12-28 11:42:31.06', NULL, 115, '2021-12-28 03:42:31', '2023-02-07 05:34:37', 0);
/*!40000 ALTER TABLE `video_visitor`
    ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE = @OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE = @OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES = @OLD_SQL_NOTES */;

-- Dump completed on 2023-02-16 12:18:21
