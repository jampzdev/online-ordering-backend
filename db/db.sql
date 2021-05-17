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

CREATE TABLE `admin_tbl` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fname` varchar(50) DEFAULT NULL,
  `mname` varchar(50) DEFAULT NULL,
  `lname` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `passhash` varchar(200) DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `admin_tbl` */

insert  into `admin_tbl`(`id`,`fname`,`mname`,`lname`,`email`,`passhash`,`is_active`) values 
(1,'j','r','j','jaydev@yopmail.com','202cb962ac59075b964b07152d234b70','1');

/*Table structure for table `brands_tbl` */

CREATE TABLE `brands_tbl` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(100) DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `brands_tbl` */

insert  into `brands_tbl`(`id`,`brand_name`,`is_active`) values 
(1,'','1'),
(12,'MAXIS','1');

/*Table structure for table `categories_tbl` */

CREATE TABLE `categories_tbl` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

/*Data for the table `categories_tbl` */

insert  into `categories_tbl`(`id`,`category_name`,`is_active`) values 
(12,'WHEELS','1'),
(13,'FRAME','1'),
(14,'SET','1'),
(15,'FORK','1'),
(16,'BRAKES','1'),
(17,'QUILL STEM','1'),
(18,'STEM','1');

/*Table structure for table `inventory_tbl` */

CREATE TABLE `inventory_tbl` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `product_size` bigint(20) DEFAULT NULL,
  `product_color` bigint(20) DEFAULT NULL,
  `quantity` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

/*Data for the table `inventory_tbl` */

insert  into `inventory_tbl`(`id`,`product_id`,`product_size`,`product_color`,`quantity`) values 
(1,5,9,13,0),
(2,5,10,14,0),
(3,5,10,15,0),
(4,6,11,16,0),
(5,6,11,17,0),
(6,6,12,18,0),
(7,6,13,19,0),
(8,6,13,20,0),
(9,6,13,21,0),
(10,7,14,22,0),
(11,8,15,23,0),
(12,9,16,24,0),
(13,10,17,25,0),
(14,10,17,26,0),
(15,11,18,27,0),
(16,11,18,28,0),
(17,12,19,29,0),
(18,12,19,30,0),
(19,12,20,31,0);

/*Table structure for table `product_colors_tbl` */

CREATE TABLE `product_colors_tbl` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `size_id` bigint(20) DEFAULT NULL,
  `size_name` varchar(100) DEFAULT NULL,
  `color_name` varchar(100) DEFAULT NULL,
  `add_price` double(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

/*Data for the table `product_colors_tbl` */

insert  into `product_colors_tbl`(`id`,`product_id`,`size_id`,`size_name`,`color_name`,`add_price`) values 
(13,5,9,'large','red',200.00),
(14,5,10,'small','red',0.00),
(15,5,10,'small','blue',0.00),
(16,6,11,'large','red',0.00),
(17,6,11,'large','blue',0.00),
(18,6,12,'small','green',0.00),
(19,6,13,'medium','red',0.00),
(20,6,13,'medium','green',0.00),
(21,6,13,'medium','black',5.00),
(22,7,14,'small','red',0.00),
(23,8,15,'large','red',0.00),
(24,9,16,'hehe','red',20.00),
(25,10,17,'large','red',10.00),
(26,10,17,'large','blue',10.00),
(27,11,18,'large','red',10.00),
(28,11,18,'large','blue',10.00),
(29,12,19,'large','red',50.00),
(30,12,19,'large','blue',60.00),
(31,12,20,'medium','red',45.00);

/*Table structure for table `product_sizes_tbl` */

CREATE TABLE `product_sizes_tbl` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `size_name` varchar(100) DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

/*Data for the table `product_sizes_tbl` */

insert  into `product_sizes_tbl`(`id`,`product_id`,`size_name`,`price`) values 
(9,5,'large',500.00),
(10,5,'small',122.00),
(11,6,'large',800.00),
(12,6,'small',500.00),
(13,6,'medium',600.00),
(14,7,'small',500.00),
(15,8,'large',500.00),
(16,9,'hehe',50.00),
(17,10,'large',50.00),
(18,11,'large',50.00),
(19,12,'large',5000.00),
(20,12,'medium',4000.00),
(21,12,'small 25.5cm',3000.00);

/*Table structure for table `product_varieties_tbl` */

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

/*Data for the table `product_varieties_tbl` */

/*Table structure for table `products_tbl` */

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

/*Data for the table `products_tbl` */

insert  into `products_tbl`(`id`,`product_name`,`product_desc`,`category_id`,`brand_id`,`img`,`is_active`) values 
(5,'sadas','das',12,12,'1621102264027.jpeg','1'),
(6,'dsafdsa','fdsafsd',12,12,'1621102264027.jpeg','1'),
(7,'fdsafdsa','fdsaf',12,12,'1621102264027.jpeg','1'),
(8,'BIKE','SDAFDSAFSAD',12,12,'1621102264027.jpeg','1'),
(9,'sadfdsaf','dsafdsafdsa',12,12,'1621102264027.jpeg','1'),
(10,'dsafdsa','fdsafdsaf',12,12,'1621106308887.png','1'),
(11,'dsafdsa','fdsafdsaf',12,12,'1621106391818.jpeg','1'),
(12,'1 SET NG BIKE','dsafdsafsda fsda fsda fsda',14,12,'1621178174831.jpeg','1'),
(13,'1 SET NG BIKE','dsafdsafsda fsda fsda fsda',14,12,'1621178230780.jpeg','1');

/*Table structure for table `users_tbl` */

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `users_tbl` */

/*Table structure for table `varieties_tbl` */

CREATE TABLE `varieties_tbl` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `variety_name` varchar(150) DEFAULT NULL,
  `is_priceable` enum('0','1') DEFAULT '1',
  `is_active` enum('0','1') DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `varieties_tbl` */

insert  into `varieties_tbl`(`id`,`variety_name`,`is_priceable`,`is_active`) values 
(1,'SIZE','1','1'),
(2,'COLOR','0','1');

/* Trigger structure for table `product_colors_tbl` */

DELIMITER $$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `prodNewColor` BEFORE INSERT ON `product_colors_tbl` FOR EACH ROW 
	SET New.size_id = (SELECT id FROM product_sizes_tbl WHERE product_id = New.product_id AND size_name = New.size_name) */$$


DELIMITER ;

/* Trigger structure for table `product_colors_tbl` */

DELIMITER $$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `prodNewColorAfter` AFTER INSERT ON `product_colors_tbl` FOR EACH ROW 
	INSERT INTO inventory_tbl(product_id,product_size,product_color)VALUES(New.product_id,New.size_id,new.id) */$$


DELIMITER ;

/*Table structure for table `inventory_view` */

DROP TABLE IF EXISTS `inventory_view`;

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
/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `inventory_view` AS (select `a`.`id` AS `id`,`a`.`product_name` AS `product_name`,`a`.`product_desc` AS `product_desc`,`a`.`category_id` AS `category_id`,`a`.`brand_id` AS `brand_id`,`e`.`brand_name` AS `brand_name`,`a`.`img` AS `img`,`f`.`category_name` AS `category_name`,`c`.`size_name` AS `size_name`,`d`.`color_name` AS `color_name`,`c`.`price` AS `price`,`b`.`quantity` AS `quantity`,`a`.`is_active` AS `is_active` from (((((`inventory_tbl` `b` join `products_tbl` `a` on((`a`.`id` = `b`.`product_id`))) join `product_sizes_tbl` `c` on((`c`.`id` = `b`.`product_size`))) join `product_colors_tbl` `d` on((`d`.`id` = `b`.`product_color`))) join `brands_tbl` `e` on((`e`.`id` = `a`.`brand_id`))) join `categories_tbl` `f` on((`f`.`id` = `a`.`category_id`)))) */;

/*View structure for view products_view */

/*!50001 DROP TABLE IF EXISTS `products_view` */;
/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `products_view` AS (select `a`.`id` AS `id`,`a`.`product_name` AS `product_name`,`a`.`product_desc` AS `product_desc`,`a`.`category_id` AS `category_id`,`a`.`brand_id` AS `brand_id`,`b`.`brand_name` AS `brand_name`,`a`.`img` AS `img`,`c`.`category_name` AS `category_name`,(select group_concat(concat(`d`.`size_name`,'|',`d`.`price`,'-',(select group_concat(concat(`e`.`color_name`,'~',`e`.`add_price`) separator '/') from `product_colors_tbl` `e` where (`e`.`size_id` = `d`.`id`))) separator ',') from `product_sizes_tbl` `d` where (`d`.`product_id` = `a`.`id`)) AS `sizes`,`a`.`is_active` AS `is_active` from ((`products_tbl` `a` join `brands_tbl` `b` on((`b`.`id` = `a`.`brand_id`))) join `categories_tbl` `c` on((`c`.`id` = `a`.`category_id`)))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
