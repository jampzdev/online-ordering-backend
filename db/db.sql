/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 10.1.40-MariaDB : Database - online_ordering_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`online_ordering_db` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `online_ordering_db`;

/*Table structure for table `admin_tbl` */

DROP TABLE IF EXISTS `admin_tbl`;

CREATE TABLE `admin_tbl` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fname` varchar(50) DEFAULT NULL,
  `mname` varchar(50) DEFAULT NULL,
  `lname` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `passhash` varchar(200) DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `brands_tbl` */

DROP TABLE IF EXISTS `brands_tbl`;

CREATE TABLE `brands_tbl` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(100) DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Table structure for table `categories_tbl` */

DROP TABLE IF EXISTS `categories_tbl`;

CREATE TABLE `categories_tbl` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) DEFAULT NULL,
  `img` varchar(200) DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

/*Table structure for table `inventory_tbl` */

DROP TABLE IF EXISTS `inventory_tbl`;

CREATE TABLE `inventory_tbl` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `product_size` bigint(20) DEFAULT NULL,
  `product_color` bigint(20) DEFAULT NULL,
  `quantity` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

/*Table structure for table `orders_products_tbl` */

DROP TABLE IF EXISTS `orders_products_tbl`;

CREATE TABLE `orders_products_tbl` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `size` varchar(20) DEFAULT NULL,
  `color` varchar(20) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `total_price` double(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`,`quantity`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Table structure for table `orders_tbl` */

DROP TABLE IF EXISTS `orders_tbl`;

CREATE TABLE `orders_tbl` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `payment_method` varchar(20) DEFAULT NULL,
  `order_status` enum('Pending','Shipped','Delivered','Picked Up') DEFAULT 'Pending',
  `grand_total` double(10,2) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Table structure for table `product_colors_tbl` */

DROP TABLE IF EXISTS `product_colors_tbl`;

CREATE TABLE `product_colors_tbl` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `size_id` bigint(20) DEFAULT NULL,
  `size_name` varchar(100) DEFAULT NULL,
  `color_name` varchar(100) DEFAULT NULL,
  `add_price` double(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

/*Table structure for table `product_sizes_tbl` */

DROP TABLE IF EXISTS `product_sizes_tbl`;

CREATE TABLE `product_sizes_tbl` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `size_name` varchar(100) DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

/*Table structure for table `product_varieties_tbl` */

DROP TABLE IF EXISTS `product_varieties_tbl`;

CREATE TABLE `product_varieties_tbl` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `variety_id` bigint(20) DEFAULT NULL,
  `prod_variety_name` varchar(150) DEFAULT NULL,
  `description` text,
  `price` double(10,2) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `img_url` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `products_tbl` */

DROP TABLE IF EXISTS `products_tbl`;

CREATE TABLE `products_tbl` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(150) DEFAULT NULL,
  `product_desc` text,
  `category_id` bigint(20) DEFAULT NULL,
  `brand_id` bigint(20) DEFAULT NULL,
  `img` varchar(200) DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Table structure for table `users_tbl` */

DROP TABLE IF EXISTS `users_tbl`;

CREATE TABLE `users_tbl` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) DEFAULT NULL,
  `phash` varchar(150) DEFAULT NULL,
  `fname` varchar(100) DEFAULT NULL,
  `mname` varchar(100) DEFAULT NULL,
  `lname` varchar(100) DEFAULT NULL,
  `date_created` varchar(50) DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Table structure for table `varieties_tbl` */

DROP TABLE IF EXISTS `varieties_tbl`;

CREATE TABLE `varieties_tbl` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `variety_name` varchar(150) DEFAULT NULL,
  `is_priceable` enum('0','1') DEFAULT '1',
  `is_active` enum('0','1') DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/* Trigger structure for table `orders_tbl` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `setCurrentDateOrders` */$$

/*!50003 CREATE */ /*!50003 TRIGGER `setCurrentDateOrders` BEFORE INSERT ON `orders_tbl` FOR EACH ROW  
 set New.date_created = Now() */$$


DELIMITER ;

/* Trigger structure for table `product_colors_tbl` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `prodNewColor` */$$

/*!50003 CREATE */ /*!50003 TRIGGER `prodNewColor` BEFORE INSERT ON `product_colors_tbl` FOR EACH ROW 
	SET New.size_id = (SELECT id FROM product_sizes_tbl WHERE product_id = New.product_id AND size_name = New.size_name) */$$


DELIMITER ;

/* Trigger structure for table `product_colors_tbl` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `prodNewColorAfter` */$$

/*!50003 CREATE */ /*!50003 TRIGGER `prodNewColorAfter` AFTER INSERT ON `product_colors_tbl` FOR EACH ROW 
	INSERT INTO inventory_tbl(product_id,product_size,product_color)VALUES(New.product_id,New.size_id,new.id) */$$


DELIMITER ;

/*Table structure for table `inventory_view` */

DROP TABLE IF EXISTS `inventory_view`;

/*!50001 DROP VIEW IF EXISTS `inventory_view` */;
/*!50001 DROP TABLE IF EXISTS `inventory_view` */;

/*!50001 CREATE TABLE  `inventory_view`(
 `id` bigint(20) ,
 `product_name` varchar(150) ,
 `product_desc` text ,
 `category_id` bigint(20) ,
 `brand_id` bigint(20) ,
 `brand_name` varchar(100) ,
 `img` varchar(200) ,
 `category_name` varchar(100) ,
 `size_name` varchar(100) ,
 `color_name` varchar(100) ,
 `price` double(10,2) ,
 `quantity` int(11) ,
 `is_active` enum('0','1') 
)*/;

/*Table structure for table `products_view` */

DROP TABLE IF EXISTS `products_view`;

/*!50001 DROP VIEW IF EXISTS `products_view` */;
/*!50001 DROP TABLE IF EXISTS `products_view` */;

/*!50001 CREATE TABLE  `products_view`(
 `id` bigint(20) ,
 `product_name` varchar(150) ,
 `product_desc` text ,
 `category_id` bigint(20) ,
 `brand_id` bigint(20) ,
 `brand_name` varchar(100) ,
 `img` varchar(200) ,
 `category_name` varchar(100) ,
 `sizes` text ,
 `is_active` enum('0','1') 
)*/;

/*View structure for view inventory_view */

/*!50001 DROP TABLE IF EXISTS `inventory_view` */;
/*!50001 DROP VIEW IF EXISTS `inventory_view` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `inventory_view` AS (select `a`.`id` AS `id`,`a`.`product_name` AS `product_name`,`a`.`product_desc` AS `product_desc`,`a`.`category_id` AS `category_id`,`a`.`brand_id` AS `brand_id`,`e`.`brand_name` AS `brand_name`,`a`.`img` AS `img`,`f`.`category_name` AS `category_name`,`c`.`size_name` AS `size_name`,`d`.`color_name` AS `color_name`,`c`.`price` AS `price`,`b`.`quantity` AS `quantity`,`a`.`is_active` AS `is_active` from (((((`inventory_tbl` `b` join `products_tbl` `a` on((`a`.`id` = `b`.`product_id`))) join `product_sizes_tbl` `c` on((`c`.`id` = `b`.`product_size`))) join `product_colors_tbl` `d` on((`d`.`id` = `b`.`product_color`))) join `brands_tbl` `e` on((`e`.`id` = `a`.`brand_id`))) join `categories_tbl` `f` on((`f`.`id` = `a`.`category_id`)))) */;

/*View structure for view products_view */

/*!50001 DROP TABLE IF EXISTS `products_view` */;
/*!50001 DROP VIEW IF EXISTS `products_view` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `products_view` AS (select `a`.`id` AS `id`,`a`.`product_name` AS `product_name`,`a`.`product_desc` AS `product_desc`,`a`.`category_id` AS `category_id`,`a`.`brand_id` AS `brand_id`,`b`.`brand_name` AS `brand_name`,`a`.`img` AS `img`,`c`.`category_name` AS `category_name`,(select group_concat(concat(`d`.`size_name`,'|',`d`.`price`,'-',(select group_concat(concat(`e`.`color_name`,'~',`e`.`add_price`) separator '/') from `product_colors_tbl` `e` where (`e`.`size_id` = `d`.`id`))) separator ',') from `product_sizes_tbl` `d` where (`d`.`product_id` = `a`.`id`)) AS `sizes`,`a`.`is_active` AS `is_active` from ((`products_tbl` `a` join `brands_tbl` `b` on((`b`.`id` = `a`.`brand_id`))) join `categories_tbl` `c` on((`c`.`id` = `a`.`category_id`)))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
