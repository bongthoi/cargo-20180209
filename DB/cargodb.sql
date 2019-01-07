-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 10.0.10.41    Database: cargodb
-- ------------------------------------------------------
-- Server version	5.6.34

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
-- Table structure for table `_sequence`
--

DROP TABLE IF EXISTS `_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_sequence` (
  `seq_name` varchar(50) NOT NULL,
  `seq_group` varchar(10) NOT NULL,
  `seq_val` int(10) NOT NULL,
  PRIMARY KEY (`seq_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_sequence`
--

LOCK TABLES `_sequence` WRITE;
/*!40000 ALTER TABLE `_sequence` DISABLE KEYS */;
INSERT INTO `_sequence` VALUES ('PN_ID','PN',92),('PX_ID','PX',50);
/*!40000 ALTER TABLE `_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_sequence_barcode`
--

DROP TABLE IF EXISTS `_sequence_barcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `_sequence_barcode` (
  `id` int(11) NOT NULL,
  `contry_code` varchar(3) DEFAULT NULL COMMENT '- Nhóm 1: Từ trái sang phải, hai hoặc ba chữ số đầu là mã số về quốc gia (vùng lãnh thổ)',
  `company_code` varchar(6) DEFAULT NULL COMMENT '- Nhóm 2: Tiếp theo gồm bốn, năm hoặc sáu chữ số là mã số về doanh nghiệp.',
  `product_code_count` int(5) DEFAULT NULL COMMENT '- Nhóm 3: Tiếp theo gồm năm, bốn hoặc ba chữ số là mã số về hàng hóa.\n\n-tạo tự động +1 vi du 1,2,3,4,5',
  `product_length` int(2) DEFAULT NULL COMMENT 'độ dài mã +1 prodcut vd 00001 ,00002',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_sequence_barcode`
--

LOCK TABLES `_sequence_barcode` WRITE;
/*!40000 ALTER TABLE `_sequence_barcode` DISABLE KEYS */;
INSERT INTO `_sequence_barcode` VALUES (1,'893','0001',300,5);
/*!40000 ALTER TABLE `_sequence_barcode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_bigunit`
--

DROP TABLE IF EXISTS `tb_bigunit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_bigunit` (
  `id` int(3) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_bigunit`
--

LOCK TABLES `tb_bigunit` WRITE;
/*!40000 ALTER TABLE `tb_bigunit` DISABLE KEYS */;
INSERT INTO `tb_bigunit` VALUES (1,'barrels',' don vi thung nuoc'),(2,'Block','don vi block'),(3,'pack','thung bia'),(99,'None','None of big Unit');
/*!40000 ALTER TABLE `tb_bigunit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_businesstype`
--

DROP TABLE IF EXISTS `tb_businesstype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_businesstype` (
  `id` int(3) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_businesstype`
--

LOCK TABLES `tb_businesstype` WRITE;
/*!40000 ALTER TABLE `tb_businesstype` DISABLE KEYS */;
INSERT INTO `tb_businesstype` VALUES (1,'self-business','aaaa'),(2,'Agent','aaaa');
/*!40000 ALTER TABLE `tb_businesstype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_category`
--

DROP TABLE IF EXISTS `tb_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_category` (
  `id` varchar(3) NOT NULL,
  `CategoryName` varchar(145) DEFAULT NULL,
  `CategoryDes` varchar(245) DEFAULT NULL,
  `IndustryId` varchar(2) DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `UpdateDate` datetime DEFAULT NULL,
  `CreateUser` varchar(45) DEFAULT NULL,
  `UpdateUser` varchar(45) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_category`
--

LOCK TABLES `tb_category` WRITE;
/*!40000 ALTER TABLE `tb_category` DISABLE KEYS */;
INSERT INTO `tb_category` VALUES ('000','Speaker','','01','2017-06-09 09:58:44','2017-06-19 10:31:49','u1@gmail.com','u1@gmail.com',1),('001','Watch','','01','2017-06-09 14:47:19','2017-06-26 10:15:36','u1@gmail.com','u1@gmail.com',1),('002','Electronic Lamp','','01','2017-06-26 10:19:03','2017-06-26 10:19:03','u1@gmail.com','u1@gmail.com',1),('003','camera','','01','2017-06-26 10:27:28','2017-06-26 10:27:28','u1@gmail.com','u1@gmail.com',1),('004','VR box 3D glasses','','01','2017-07-03 12:29:43','2017-07-03 12:29:43','u1@gmail.com','u1@gmail.com',1),('005','Microphone','','01','2017-06-26 11:12:06','2017-06-26 11:12:06','u1@gmail.com','u1@gmail.com',1),('006','Air purifier','','01','2017-06-26 11:13:05','2017-07-03 12:14:36','u1@gmail.com','u1@gmail.com',1),('007','Led shoes','','01','2017-07-03 13:31:54','2017-07-03 13:31:54','u1@gmail.com','u1@gmail.com',1),('008','Guardian of health','','01','2017-07-03 13:48:35','2017-07-03 13:48:35','u1@gmail.com','u1@gmail.com',1),('009','GPS tracking','','01','2017-09-15 09:13:11','2017-09-15 09:13:11','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com',1),('050','Electronic accessories','','01','2017-07-03 12:16:36','2017-07-03 12:16:36','u1@gmail.com','u1@gmail.com',1),('051','Crafts','','02','2017-06-19 11:34:24','2017-06-19 11:34:24','u1@gmail.com','u1@gmail.com',1),('052','Foods ','','02','2017-06-19 11:32:53','2017-06-19 11:32:53','u1@gmail.com','u1@gmail.com',1),('053','Beauty products ','','02','2017-06-19 11:38:37','2017-06-19 11:38:37','u1@gmail.com','u1@gmail.com',1),('101',' Sunglasses ','','03','2017-07-04 11:40:31','2017-07-04 11:40:31','u1@gmail.com','u1@gmail.com',1),('151','Domestic','','04','2017-07-03 16:33:44','2017-07-03 16:33:58','u1@gmail.com','u1@gmail.com',1),('152','Decorated - Gifts products','','04','2017-07-03 16:33:09','2017-07-03 16:33:09','u1@gmail.com','u1@gmail.com',1),('153','Seashell jewelry','','04','2017-07-03 17:10:10','2017-07-03 17:10:10','u1@gmail.com','u1@gmail.com',1),('201','Fan','','05','2017-06-20 15:40:19','2017-06-20 15:40:19','u1@gmail.com','u1@gmail.com',1),('251','Light','','06','2017-07-28 16:38:53','2017-07-28 16:38:53','u1@gmail.com','u1@gmail.com',1),('252','Candle','','06','2017-07-03 14:08:27','2017-07-05 11:30:30','u1@gmail.com','u1@gmail.com',1),('301','Water paint','','07','2017-08-04 11:16:51','2017-08-04 11:16:59','u1@gmail.com','u1@gmail.com',1),('351','Pet Clothes ','','08','2017-09-14 16:00:38','2017-09-14 16:00:38','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com',1),('352',' Pet Cleaning - Grooming Products','','08','2017-09-14 16:01:27','2017-09-14 16:15:09','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com',1),('353','Pet Collars & Leashes','','08','2017-09-14 17:15:24','2017-09-14 17:15:24','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com',1),('401','Stress  & Fidget Toys','','09','2017-09-14 16:17:02','2017-09-14 16:17:02','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com',1);
/*!40000 ALTER TABLE `tb_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_deliveried_note_type`
--

DROP TABLE IF EXISTS `tb_deliveried_note_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_deliveried_note_type` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_deliveried_note_type`
--

LOCK TABLES `tb_deliveried_note_type` WRITE;
/*!40000 ALTER TABLE `tb_deliveried_note_type` DISABLE KEYS */;
INSERT INTO `tb_deliveried_note_type` VALUES (1,'Xuất bán lẻ'),(2,'Xuất sản phẩm hư, lỗi'),(3,'Xuất quà tặng'),(4,'Xuất tặng kèm hóa đơn'),(5,'Xuất qua STC tặng khách   '),(6,'Xuất ký gửi trường DHKHXH & NV'),(7,'Xuất chuyển kho'),(8,'Xuất sự kiện'),(9,'Xuất Mr Kong');
/*!40000 ALTER TABLE `tb_deliveried_note_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_goods_deliveried_note`
--

DROP TABLE IF EXISTS `tb_goods_deliveried_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_goods_deliveried_note` (
  `id` varchar(20) NOT NULL,
  `DocumentNo` varchar(245) DEFAULT NULL COMMENT 'chứng từ kèm theo',
  `TypeofNote` int(3) DEFAULT NULL COMMENT 'loại  phiếu xuất',
  `FromLogicWarehouse` char(6) DEFAULT NULL,
  `ToLogicWarehouse` char(6) DEFAULT NULL,
  `TotalQuantity` int(11) DEFAULT NULL,
  `TotalAmount` decimal(11,2) DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `ApproveDate` datetime DEFAULT NULL,
  `CreateUser` varchar(45) DEFAULT NULL,
  `ApproveUser` varchar(45) DEFAULT NULL,
  `Note` varchar(245) DEFAULT NULL,
  `IsCheck` tinyint(1) DEFAULT '0' COMMENT '0 tao moi\n1 xac nhan\n2 huy bo',
  `InPreference` varchar(20) DEFAULT NULL COMMENT 'đối ứng mã phiếu nhập',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_goods_deliveried_note`
--

LOCK TABLES `tb_goods_deliveried_note` WRITE;
/*!40000 ALTER TABLE `tb_goods_deliveried_note` DISABLE KEYS */;
INSERT INTO `tb_goods_deliveried_note` VALUES ('PX-00000000016','1708-01',1,'DS1-TK','DS1-KH',1,179000.00,'2017-08-31 14:16:36','2017-08-10 15:00:08','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','',1,'PN-00000000056'),('PX-00000000018','1709-02',1,'DS1-TK','DS1-KH',1,35000.00,'2017-09-05 10:06:38','2017-09-10 15:23:56','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','',1,'PN-00000000060'),('PX-00000000019','1709-03',1,'DS1-TK','DS1-KH',1,99000.00,'2017-09-06 10:12:56','2017-09-06 15:41:05','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','',1,'PN-00000000061'),('PX-00000000020','1709-04',7,'DS1-TK','DS1-KM',724,41015000.00,'2017-09-10 10:34:45','2017-09-10 15:24:48','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','',1,'PN-00000000057'),('PX-00000000021','1709-05',1,'DS1-TK','DS1-KH',2,298000.00,'2017-09-27 10:41:26','2017-09-10 15:26:40','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','',1,'PN-00000000062'),('PX-00000000022','1709-06',8,'DS1-KM','DS1-SK',40,400000.00,'2017-09-29 11:07:56','2017-09-10 15:27:16','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','Sự kiện trung thu',1,'PN-00000000058'),('PX-00000000023','1709-07',1,'DS1-TK','DS1-KH',1,149000.00,'2017-09-29 11:14:23','2017-09-10 15:29:13','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','',1,'PN-00000000063'),('PX-00000000024','1709',7,'ST1-TK','ST1-TA',50,0.00,'2017-09-05 14:28:40','2017-09-10 15:38:20','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','',1,'PN-00000000059'),('PX-00000000025','1710-08',1,'DS1-KM','DS1-KH',1,35000.00,'2017-10-20 16:29:34','2017-10-20 16:42:07','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','',1,'PN-00000000065'),('PX-00000000026','1710-09',1,'DS1-TK','DS1-KH',2,118000.00,'2017-10-20 16:30:53','2017-10-20 16:43:54','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','',1,'PN-00000000066'),('PX-00000000027','1710-10',1,'DS1-TK','DS1-KH',1,339000.00,'2017-10-20 16:35:42','2017-10-20 16:48:02','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','',1,'PN-00000000067'),('PX-00000000028','1710-11',3,'DS1-KM','DS1-QT',1,55000.00,'2017-10-20 16:40:42','2017-10-20 16:49:30','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','Tặng kèm hóa đơn loa sạc dự phòng C79  339.000',1,'PN-00000000068'),('PX-00000000029','1710-12',1,'DS1-TK','DS1-KH',4,480000.00,'2017-10-24 09:22:52','2017-10-24 09:24:16','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','Mr Kong mua',1,'PN-00000000069'),('PX-00000000030','1710-13',1,'DS1-HQ','DS1-KH',1,209000.00,'2017-10-30 14:44:02','2017-10-30 14:57:05','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','',1,'PN-00000000072'),('PX-00000000031','1710-14',4,'DS1-KM','DS1-QT',1,35000.00,'2017-10-30 14:50:51','2017-10-30 14:51:30','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','xuất tặng kèm hóa đơn giá đỡ ipad ô tô 209.000',1,'PN-00000000071'),('PX-00000000032','1711-15',7,'DS1-TK','DS1-KG',65,9121000.00,'2017-11-02 00:27:44','2017-11-03 23:35:01','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','Bán hàng tại  trường DHKHXH&NV ',1,'PN-00000000074'),('PX-00000000033','1711-16',1,'DS1-KG','DS1-KH',5,781000.00,'2017-11-03 23:41:02','2017-11-03 23:41:43','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','',1,'PN-00000000075'),('PX-00000000034','1711-18',1,'DS1-KG','DS1-KH',1,179000.00,'2017-11-07 08:47:23','2017-11-07 08:47:29','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','',1,'PN-00000000076'),('PX-00000000035','1711-19',1,'DS1-KG','DS1-KH',10,1730000.00,'2017-11-30 20:42:53','2017-11-30 20:43:27','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','BÁN TẠI TRƯỜNG DHKHXH & NV',1,'PN-00000000077'),('PX-00000000036','1711-20',7,'DS1-KG','DS1-TK',39,5141000.00,'2017-11-30 20:54:10','2017-11-30 20:54:55','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','',1,'PN-00000000078'),('PX-00000000037','1711-21',7,'DS1-KG','DS1-TK',10,1290000.00,'2017-11-30 20:59:09','2017-11-30 20:59:14','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','',1,'PN-00000000079'),('PX-00000000038','1711-22',1,'DS1-KM','DS1-KH',12,660000.00,'2017-11-30 21:04:41','2017-11-30 21:05:06','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','BÁN TẠI TRƯỜNG DHKHXH&NV',1,'PN-00000000080'),('PX-00000000039','1711-23',1,'DS1-TK','DS1-KH',4,596000.00,'2017-11-30 21:13:10','2017-11-30 21:13:42','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','',1,'PN-00000000081'),('PX-00000000040','1711-24',1,'DS1-KM','DS1-KH',1,55000.00,'2017-11-30 21:17:01','2017-11-30 21:17:43','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','',1,'PN-00000000082'),('PX-00000000041','1711-25',3,'DS1-KM','DS1-QT',52,0.00,'2017-11-30 21:34:12','2017-11-30 21:34:18','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','',1,'PN-00000000083'),('PX-00000000042','1711-25',4,'DS1-KM','DS1-QT',8,0.00,'2017-11-30 21:42:34','2017-11-30 21:42:43','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','xuất tặng kèm hóa đơn ngày khai trương 24.11.2017',1,'PN-00000000084'),('PX-00000000043','1711-26',4,'DS1-KM','DS1-QT',1,0.00,'2017-11-30 21:46:25','2017-11-30 21:46:31','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','xuất tặng kèm hóa đơn (2 USB 32 GB: 298.000 và micro để bàn 51.000) ngày 14/11',1,'PN-00000000085'),('PX-00000000044','1711-27',4,'DS1-KM','DS1-QT',1,0.00,'2017-11-30 21:48:21','2017-11-30 21:48:51','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','',1,'PN-00000000086'),('PX-00000000045','1711-28',8,'DS1-TK','DS1-SK',1,99000.00,'2017-11-30 21:54:25','2017-11-30 21:54:30','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','',1,'PN-00000000087'),('PX-00000000046','1711-29',8,'DS1-KM','DS1-SK',1,35000.00,'2017-11-30 21:57:13','2017-11-30 21:57:22','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','Xuất sự kiện khai trương Showroom GLORIOUS STC',1,'PN-00000000088'),('PX-00000000047','1711-30',3,'DS1-KM','DS1-QT',15,55000.00,'2017-11-30 23:56:42','2017-11-30 00:40:05','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','Xuất tặng nhà thầu GREEN BUILDING ngày hoàn tất công trình SHOWROOM GLORIOUS STC 23.11.2017',1,'PN-00000000089'),('PX-00000000048','1711-31',3,'DS1-QT','DS1-KM',1,0.00,'2017-12-01 14:27:42','2017-12-01 14:28:01','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','Xuất đổi quà tặng ',1,'PN-00000000090'),('PX-00000000049','1712-32',1,'DS1-TK','DS1-KH',1,149000.00,'2017-12-02 09:53:07','2017-12-02 09:53:21','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','',1,'PN-00000000091'),('PX-00000000050','1712-33',1,'DS1-TK','DS1-KH',1,149000.00,'2017-12-14 09:24:40','2017-12-14 09:25:07','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','',1,'PN-00000000092');
/*!40000 ALTER TABLE `tb_goods_deliveried_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_goods_deliveried_note_detail`
--

DROP TABLE IF EXISTS `tb_goods_deliveried_note_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_goods_deliveried_note_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ProductId` varchar(13) DEFAULT NULL,
  `ProductName` varchar(245) DEFAULT NULL,
  `Unit` int(3) DEFAULT NULL,
  `RealQuantity` int(11) DEFAULT NULL,
  `DocumentQuantity` int(11) DEFAULT NULL,
  `Price` decimal(11,2) DEFAULT NULL,
  `Amount` decimal(11,2) DEFAULT NULL,
  `GoodsDeliveriedNoteId` varchar(20) DEFAULT NULL COMMENT 'ma phieu xuat',
  `ProductCode` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_goods_deliveried_note_detail`
--

LOCK TABLES `tb_goods_deliveried_note_detail` WRITE;
/*!40000 ALTER TABLE `tb_goods_deliveried_note_detail` DISABLE KEYS */;
INSERT INTO `tb_goods_deliveried_note_detail` VALUES (34,'8930001001053','Bluetooth speaker HF-Q8',6,1,1,179000.00,179000.00,'PX-00000000016','Q8'),(36,'8930001001299','Insole grip for phone',6,1,1,35000.00,35000.00,'PX-00000000018','KDT'),(37,'8930001002043','Photo frames (13×18cm)',6,1,1,99000.00,99000.00,'PX-00000000019','KHUNG13'),(38,'8930001001619','Lotus light pink',6,10,10,150000.00,1500000.00,'PX-00000000020','DS2'),(39,'8930001001626','Lotus light ',6,43,43,150000.00,6450000.00,'PX-00000000020','DS3'),(40,'8930001002012','Keychains',6,10,10,10000.00,100000.00,'PX-00000000020','MOCSO'),(41,'8930001000834','Keychains',6,9,9,10000.00,90000.00,'PX-00000000020','MOCDUA'),(42,'8930001001299','Insole grip for phone',6,10,10,35000.00,350000.00,'PX-00000000020','KDT'),(49,'8930001001282','Cable for iPhone 5/6 & Ipad mini',6,487,487,55000.00,26785000.00,'PX-00000000020','CAPDU'),(50,'8930001001602','Lotus light yellow ',6,24,24,150000.00,3600000.00,'PX-00000000020','DS1'),(51,'8930001001657','Round candle',7,17,17,35000.00,595000.00,'PX-00000000020','NTR'),(52,'8930001001640','Tall candle',7,9,9,55000.00,495000.00,'PX-00000000020','NLC'),(53,'8930001002142','Heart shaped shell (Orange)',8,39,39,10000.00,390000.00,'PX-00000000020','VSC'),(54,'8930001002159','Heart shaped shell (Pink)',8,46,46,10000.00,460000.00,'PX-00000000020','VSH'),(55,'8930001002166','Heart shaped shell (Brown)',8,20,20,10000.00,200000.00,'PX-00000000020','VSN'),(56,'8930001001343','USB 32GB',6,2,2,149000.00,298000.00,'PX-00000000021','USB32'),(57,'8930001002142','Heart shaped shell (Orange)',8,20,20,10000.00,200000.00,'PX-00000000022','VSC'),(59,'8930001001343','USB 32GB',6,1,1,149000.00,149000.00,'PX-00000000023','USB32'),(60,'8930001002159','Heart shaped shell (Pink)',8,20,20,10000.00,200000.00,'PX-00000000022','VSH'),(61,'8930001002432','Water Based Paint / Crown Emulsion KP-110',2,16,16,0.00,0.00,'PX-00000000024','KP-110'),(62,'8930001002425','Premium Skim Coat for Exter KSB-E',2,2,2,0.00,0.00,'PX-00000000024','KBSE'),(63,'8930001002418','Water Based Paint / Crown Emulsion H75-40T',2,7,7,0.00,0.00,'PX-00000000024','H75-40T'),(64,'8930001002401','Kansai paint Eco AC Sealer',2,1,1,0.00,0.00,'PX-00000000024','ACSEALER'),(65,'8930001002395','Water Based Paint / Par Weather AC KP-110',2,10,10,0.00,0.00,'PX-00000000024','AC KP-110'),(66,'8930001002388','Water Based Paint / Par Weather AC H75-40T',2,9,9,0.00,0.00,'PX-00000000024','AC H75-40T'),(67,'8930001002371','Water Based Paint / Par Weather AC H05-40V',2,5,5,0.00,0.00,'PX-00000000024','AC H05-40V'),(68,'8930001001299','Insole grip for phone',6,1,1,35000.00,35000.00,'PX-00000000025','KDT'),(69,'8930001000728','Chopsticks type 2',4,1,1,29000.00,29000.00,'PX-00000000026','DUA2'),(70,'8930001000704','Pestle and mortar',4,1,1,89000.00,89000.00,'PX-00000000026','CVC'),(71,'8930001001008','Music box + power bank C79',6,1,1,339000.00,339000.00,'PX-00000000027','C79'),(72,'8930001001282','Cable for iPhone 5/6 & Ipad mini',6,1,1,55000.00,55000.00,'PX-00000000028','CAPDU'),(73,'8930001000988','Coconut mask',7,4,4,120000.00,480000.00,'PX-00000000029','MATNA'),(74,'8930001001275','Car holder',6,1,1,209000.00,209000.00,'PX-00000000030','KIPAD'),(75,'8930001001657','Round candle',7,1,1,35000.00,35000.00,'PX-00000000031','NTR'),(76,'8930001001015','Bluetooth speaker  A9',6,6,6,209000.00,1254000.00,'PX-00000000032','A9'),(77,'8930001001022','Bluetooth speaker  A10',6,8,8,189000.00,1512000.00,'PX-00000000032','A10'),(78,'8930001001039','Smart box mini',6,21,21,85000.00,1785000.00,'PX-00000000032','SMARTBOX'),(79,'8930001001053','Bluetooth speaker HF-Q8',6,10,10,179000.00,1790000.00,'PX-00000000032','Q8'),(80,'8930001001336','USB 16GB',6,10,10,129000.00,1290000.00,'PX-00000000032','USB16'),(81,'8930001001343','USB 32GB',6,10,10,149000.00,1490000.00,'PX-00000000032','USB32'),(82,'8930001001343','USB 32GB',6,2,2,149000.00,298000.00,'PX-00000000033','USB32'),(83,'8930001001015','Bluetooth speaker  A9',6,1,1,209000.00,209000.00,'PX-00000000033','A9'),(84,'8930001001022','Bluetooth speaker  A10',6,1,1,189000.00,189000.00,'PX-00000000033','A10'),(85,'8930001001039','Smart box mini',6,1,1,85000.00,85000.00,'PX-00000000033','SMARTBOX'),(86,'8930001001053','Bluetooth speaker HF-Q8',6,1,1,179000.00,179000.00,'PX-00000000034','Q8'),(87,'8930001001022','Bluetooth speaker  A10',6,3,3,189000.00,567000.00,'PX-00000000035','A10'),(88,'8930001001053','Bluetooth speaker HF-Q8',6,4,4,179000.00,716000.00,'PX-00000000035','Q8'),(89,'8930001001343','USB 32GB',6,3,3,149000.00,447000.00,'PX-00000000035','USB32'),(90,'8930001001022','Bluetooth speaker  A10',6,4,4,189000.00,756000.00,'PX-00000000036','A10'),(91,'8930001001015','Bluetooth speaker  A9',6,5,5,209000.00,1045000.00,'PX-00000000036','A9'),(92,'8930001001053','Bluetooth speaker HF-Q8',6,5,5,179000.00,895000.00,'PX-00000000036','Q8'),(93,'8930001001039','Smart box mini',6,20,20,85000.00,1700000.00,'PX-00000000036','SMARTBOX'),(94,'8930001001343','USB 32GB',6,5,5,149000.00,745000.00,'PX-00000000036','USB32'),(95,'8930001001336','USB 16GB',6,10,10,129000.00,1290000.00,'PX-00000000037','USB16'),(96,'8930001001282','Cable for iPhone 5/6 & Ipad mini',6,12,12,55000.00,660000.00,'PX-00000000038','CAPDU'),(97,'8930001001343','USB 32GB',6,4,4,149000.00,596000.00,'PX-00000000039','USB32'),(98,'8930001001282','Cable for iPhone 5/6 & Ipad mini',6,1,1,55000.00,55000.00,'PX-00000000040','CAPDU'),(99,'8930001002814','Wireless music earphone V4.1+ EDR',6,1,1,0.00,0.00,'PX-00000000041','HBQI7'),(100,'8930001002937','USB KINGSTON - 16GB		',6,8,8,0.00,0.00,'PX-00000000041','USBKT16'),(101,'8930001002920','USB KINGSTON - 8GB',6,8,8,0.00,0.00,'PX-00000000041','USBKT8'),(102,'8930001002890','QUTE wireless speaker',6,1,1,0.00,0.00,'PX-00000000041','QUTE'),(103,'8930001002913','USB VAIO SONY - 8GB',6,8,8,0.00,0.00,'PX-00000000041','USBVIO8'),(104,'8930001002821','wireless metal in-ear stereo',6,11,11,0.00,0.00,'PX-00000000041','WLINEAR'),(105,'8930001002869','BT speaker S-13',6,9,9,0.00,0.00,'PX-00000000041','S-13'),(106,'8930001002876','mini audio 175',6,2,2,0.00,0.00,'PX-00000000041','175'),(107,'8930001002852','wireless music YZ-18',6,2,2,0.00,0.00,'PX-00000000041','YZ-18'),(108,'8930001002807','twin true wireless earbuds V4.2 + DER',6,2,2,0.00,0.00,'PX-00000000041','I7 TWS'),(109,'8930001002876','mini audio 175',6,1,1,0.00,0.00,'PX-00000000042','175'),(110,'8930001002845','mini speaker WS-187',6,2,2,0.00,0.00,'PX-00000000042','WS-187'),(111,'8930001002821','wireless metal in-ear stereo',6,5,5,0.00,0.00,'PX-00000000042','WLINEAR'),(112,'8930001002876','mini audio 175',6,1,1,0.00,0.00,'PX-00000000043','175'),(113,'8930001001282','Cable for iPhone 5/6 & Ipad mini',6,1,1,0.00,0.00,'PX-00000000044','CAPDU'),(114,'8930001002043','Photo frames (13×18cm)',6,1,1,99000.00,99000.00,'PX-00000000045','KHUNG13'),(115,'8930001001657','Round candle',7,1,1,35000.00,35000.00,'PX-00000000046','NTR'),(116,'8930001002821','wireless metal in-ear stereo',6,2,2,0.00,0.00,'PX-00000000047','WLINEAR'),(117,'8930001002852','wireless music YZ-18',6,2,2,0.00,0.00,'PX-00000000047','YZ-18'),(118,'8930001002845','mini speaker WS-187',6,1,1,0.00,0.00,'PX-00000000047','WS-187'),(119,'8930001002876','mini audio 175',6,2,2,0.00,0.00,'PX-00000000047','175'),(120,'8930001002814','Wireless music earphone V4.1+ EDR',6,3,3,0.00,0.00,'PX-00000000047','HBQI7'),(121,'8930001002807','twin true wireless earbuds V4.2 + DER',6,1,1,0.00,0.00,'PX-00000000047','I7 TWS'),(122,'8930001002838','Music wireless speaker',6,3,3,0.00,0.00,'PX-00000000047','A2DP'),(123,'8930001001282','Cable for iPhone 5/6 & Ipad mini',6,1,1,55000.00,55000.00,'PX-00000000047','CAPDU'),(124,'8930001002876','mini audio 175',6,1,1,0.00,0.00,'PX-00000000048','175'),(125,'8930001001343','USB 32GB',6,1,1,149000.00,149000.00,'PX-00000000049','USB32'),(126,'8930001001343','USB 32GB',6,1,1,149000.00,149000.00,'PX-00000000050','USB32');
/*!40000 ALTER TABLE `tb_goods_deliveried_note_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_goods_receipt_note`
--

DROP TABLE IF EXISTS `tb_goods_receipt_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_goods_receipt_note` (
  `id` varchar(20) NOT NULL,
  `DocumentNo` varchar(245) DEFAULT NULL COMMENT 'chứng từ kèm theo',
  `TypeofNote` int(3) DEFAULT NULL COMMENT 'loại  phiếu nhập',
  `FromLogicWarehouse` char(6) DEFAULT NULL,
  `ToLogicWarehouse` char(6) DEFAULT NULL,
  `TotalQuantity` int(11) DEFAULT NULL,
  `TotalAmount` decimal(11,2) DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `ApproveDate` datetime DEFAULT NULL,
  `CreateUser` varchar(45) DEFAULT NULL,
  `ApproveUser` varchar(45) DEFAULT NULL,
  `Note` varchar(245) DEFAULT NULL,
  `IsCheck` tinyint(1) DEFAULT '0' COMMENT '0 tao moi\n1 xac nhan\n2 huy bo',
  `OutPreference` varchar(20) DEFAULT NULL COMMENT 'đối ứng mã phiếu xuất',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_goods_receipt_note`
--

LOCK TABLES `tb_goods_receipt_note` WRITE;
/*!40000 ALTER TABLE `tb_goods_receipt_note` DISABLE KEYS */;
INSERT INTO `tb_goods_receipt_note` VALUES ('PN-00000000036','1707-01',1,'sup015','DS1-TK',662,69569000.00,'2017-08-10 17:36:10','2017-08-10 14:57:20','u1@gmail.com','hien.ntt@vinhsangvn.com','',1,''),('PN-00000000037','1708-02  (INV: 0000025)',1,'sup001','DS1-HQ',266,110308000.00,'2017-08-10 11:19:05','2017-08-10 14:57:30','u1@gmail.com','hien.ntt@vinhsangvn.com','',1,NULL),('PN-00000000038','1708-03',1,'sup013','DS1-TK',16,687000.00,'2017-08-10 12:33:11','2017-08-10 14:57:54','u1@gmail.com','hien.ntt@vinhsangvn.com','',1,NULL),('PN-00000000039','1708-04',1,'sup013','DS1-TK',28,1178000.00,'2017-08-10 12:46:50','2017-08-10 14:58:10','u1@gmail.com','hien.ntt@vinhsangvn.com','',1,NULL),('PN-00000000040','1708-05',1,'sup014','DS1-TK',32,1118000.00,'2017-08-10 14:38:50','2017-08-10 14:58:17','u1@gmail.com','hien.ntt@vinhsangvn.com','',1,NULL),('PN-00000000041','1708-06',1,'sup014','DS1-TK',12,676000.00,'2017-08-10 14:43:21','2017-08-10 14:58:21','u1@gmail.com','hien.ntt@vinhsangvn.com','',1,NULL),('PN-00000000042','1708-07',1,'sup008','DS1-TK',12,1440000.00,'2017-08-10 15:00:07','2017-08-10 14:58:25','u1@gmail.com','hien.ntt@vinhsangvn.com','',1,NULL),('PN-00000000043','1708-08',1,'sup014','DS1-TK',105,1050000.00,'2017-08-10 14:33:13','2017-08-10 14:58:28','u1@gmail.com','hien.ntt@vinhsangvn.com','',1,NULL),('PN-00000000044','1708-09',1,'sup017','DS1-TK',175,16739000.00,'2017-08-10 16:05:07','2017-08-10 14:58:35','u1@gmail.com','hien.ntt@vinhsangvn.com','',1,''),('PN-00000000045','1708-10',1,'sup017','DS1-TK',80,12937000.00,'2017-08-10 16:51:02','2017-08-10 14:58:39','u1@gmail.com','hien.ntt@vinhsangvn.com','',1,NULL),('PN-00000000046','1708-11',1,'sup017','DS1-TK',115,0.00,'2017-08-10 18:32:33','2017-08-10 14:58:44','u1@gmail.com','hien.ntt@vinhsangvn.com','',1,NULL),('PN-00000000047','1708-12 (VS)',1,'sup007','ST1-TK',50,0.00,'2017-09-04 12:51:49','2017-09-08 15:36:37','u1@gmail.com','hien.ntt@vinhsangvn.com','',1,NULL),('PN-00000000050','1709-13',1,'sup002','ST1-TK',3600,383000000.00,'2017-09-08 17:30:34','2017-09-08 15:36:45','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','Receive on Sept 8, 2017',1,''),('PN-00000000052','1709-14',1,'sup018','ST1-TK',360,174010000.00,'2017-09-11 09:43:13','2017-09-11 15:39:30','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','Receive on Sept 11, 2017',1,''),('PN-00000000056','-- edit here --',2,'DS1-TK','DS1-KH',1,179000.00,'2017-08-16 15:46:39','2017-08-10 15:03:13','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','ban cho khach',1,'PX-00000000016'),('PN-00000000057','-- edit here --',2,'DS1-TK','DS1-KM',724,41015000.00,'2017-09-10 13:50:45','2017-09-10 15:26:18','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','',1,'PX-00000000020'),('PN-00000000058','-- edit here --',2,'DS1-KM','DS1-SK',40,400000.00,'2017-09-29 14:04:37','2017-09-10 15:27:36','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','',1,'PX-00000000022'),('PN-00000000059','-- edit here --',2,'ST1-TK','ST1-TA',50,0.00,'2017-09-10 14:50:24','2017-09-10 15:38:47','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','',1,'PX-00000000024'),('PN-00000000060','-- edit here --',2,'DS1-TK','DS1-KH',1,35000.00,'2017-09-05 14:58:11','2017-09-10 15:26:07','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','',1,'PX-00000000018'),('PN-00000000061','-- edit here --',2,'DS1-TK','DS1-KH',1,99000.00,'2017-09-06 15:01:18','2017-09-06 15:41:20','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','',1,'PX-00000000019'),('PN-00000000062','-- edit here --',2,'DS1-TK','DS1-KH',2,298000.00,'2017-09-27 15:04:08','2017-09-10 15:26:57','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','',1,'PX-00000000021'),('PN-00000000063','-- edit here --',2,'DS1-TK','DS1-KH',1,149000.00,'2017-09-29 15:06:12','2017-09-10 15:29:39','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','',1,'PX-00000000023'),('PN-00000000065','-- edit here --',2,'DS1-KM','DS1-KH',1,35000.00,'2017-10-20 16:42:53','2017-10-20 16:51:43','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','',1,'PX-00000000025'),('PN-00000000066','-- edit here --',2,'DS1-TK','DS1-KH',2,118000.00,'2017-10-20 16:47:34','2017-10-20 16:53:31','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','',1,'PX-00000000026'),('PN-00000000067','-- edit here --',2,'DS1-TK','DS1-KH',1,339000.00,'2017-10-20 16:48:42','2017-10-20 16:59:03','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','',1,'PX-00000000027'),('PN-00000000068','-- edit here --',2,'DS1-KM','DS1-QT',1,55000.00,'2017-10-20 16:49:53','2017-10-20 16:57:57','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','',1,'PX-00000000028'),('PN-00000000069','-- edit here --',2,'DS1-TK','DS1-KH',4,480000.00,'2017-10-24 09:24:28','2017-10-24 09:24:50','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','',1,'PX-00000000029'),('PN-00000000070','1710-15',1,'sup017','DS1-KM',6,0.00,'2017-10-30 09:55:16','2017-10-31 22:26:23','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','',1,''),('PN-00000000071','-- edit here --',2,'DS1-KM','DS1-QT',1,35000.00,'2017-10-30 14:51:52','2017-10-30 14:52:26','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','',1,'PX-00000000031'),('PN-00000000072','-- edit here --',2,'DS1-HQ','DS1-KH',1,209000.00,'2017-10-30 14:57:21','2017-10-30 14:57:37','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','',1,'PX-00000000030'),('PN-00000000073','1710-16',1,'sup017','DS1-KM',150,0.00,'2017-10-31 22:24:16','2017-10-31 22:26:32','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','',1,''),('PN-00000000074','-- edit here --',2,'DS1-TK','DS1-KG',65,9121000.00,'2017-11-03 23:35:41','2017-11-03 23:37:20','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','',1,'PX-00000000032'),('PN-00000000075','-- edit here --',2,'DS1-KG','DS1-KH',5,781000.00,'2017-11-03 23:41:59','2017-11-03 23:42:13','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','',1,'PX-00000000033'),('PN-00000000076','-- edit here --',2,'DS1-KG','DS1-KH',1,179000.00,'2017-11-07 08:47:44','2017-11-08 08:38:52','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','',1,'PX-00000000034'),('PN-00000000077','-- edit here --',2,'DS1-KG','DS1-KH',10,1730000.00,'2017-11-30 20:43:40','2017-11-30 20:44:48','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','',1,'PX-00000000035'),('PN-00000000078','-- edit here --',2,'DS1-KG','DS1-TK',39,5141000.00,'2017-11-30 20:55:03','2017-11-30 20:55:18','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','',1,'PX-00000000036'),('PN-00000000079','-- edit here --',2,'DS1-KG','DS1-TK',10,1290000.00,'2017-11-30 20:59:23','2017-11-30 20:59:34','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','',1,'PX-00000000037'),('PN-00000000080','-- edit here --',2,'DS1-KM','DS1-KH',12,660000.00,'2017-11-30 21:05:15','2017-11-30 21:05:29','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','',1,'PX-00000000038'),('PN-00000000081','-- edit here --',2,'DS1-TK','DS1-KH',4,596000.00,'2017-11-30 21:14:39','2017-11-30 21:15:05','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','',1,'PX-00000000039'),('PN-00000000082','-- edit here --',2,'DS1-KM','DS1-KH',1,55000.00,'2017-11-30 21:17:56','2017-11-30 21:18:01','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','',1,'PX-00000000040'),('PN-00000000083','-- edit here --',2,'DS1-KM','DS1-QT',52,0.00,'2017-11-30 21:36:04','2017-11-30 21:36:14','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','',1,'PX-00000000041'),('PN-00000000084','-- edit here --',2,'DS1-KM','DS1-QT',8,0.00,'2017-11-30 21:42:54','2017-11-30 21:43:02','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','',1,'PX-00000000042'),('PN-00000000085','-- edit here --',2,'DS1-KM','DS1-QT',1,0.00,'2017-11-30 21:46:40','2017-11-30 21:46:51','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','',1,'PX-00000000043'),('PN-00000000086','-- edit here --',2,'DS1-KM','DS1-QT',1,0.00,'2017-11-30 21:49:02','2017-11-30 21:49:21','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','',1,'PX-00000000044'),('PN-00000000087','-- edit here --',2,'DS1-TK','DS1-SK',1,99000.00,'2017-11-30 21:54:39','2017-11-30 21:54:45','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','',1,'PX-00000000045'),('PN-00000000088','-- edit here --',2,'DS1-KM','DS1-SK',1,35000.00,'2017-11-30 21:57:30','2017-11-30 21:57:37','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','',1,'PX-00000000046'),('PN-00000000089','-- edit here --',2,'DS1-KM','DS1-QT',15,55000.00,'2017-11-30 00:40:21','2017-11-30 00:42:37','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','',1,'PX-00000000047'),('PN-00000000090','-- edit here --',2,'DS1-QT','DS1-KM',1,0.00,'2017-12-01 14:28:12','2017-12-01 14:29:12','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','',1,'PX-00000000048'),('PN-00000000091','-- edit here --',2,'DS1-TK','DS1-KH',1,149000.00,'2017-12-02 09:53:28','2017-12-02 09:53:35','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','',1,'PX-00000000049'),('PN-00000000092','-- edit here --',2,'DS1-TK','DS1-KH',1,149000.00,'2017-12-14 09:25:22','2017-12-14 09:25:40','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','',1,'PX-00000000050');
/*!40000 ALTER TABLE `tb_goods_receipt_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_goods_receipt_note_detail`
--

DROP TABLE IF EXISTS `tb_goods_receipt_note_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_goods_receipt_note_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ProductId` varchar(13) DEFAULT NULL,
  `ProductName` varchar(245) DEFAULT NULL,
  `Unit` int(3) DEFAULT NULL,
  `RealQuantity` int(11) DEFAULT NULL,
  `DocumentQuantity` int(11) DEFAULT NULL,
  `Price` decimal(11,2) DEFAULT NULL,
  `Amount` decimal(11,2) DEFAULT NULL,
  `GoodsReceiptNoteId` varchar(20) DEFAULT NULL COMMENT 'ma phieu nhap',
  `ProductCode` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=388 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_goods_receipt_note_detail`
--

LOCK TABLES `tb_goods_receipt_note_detail` WRITE;
/*!40000 ALTER TABLE `tb_goods_receipt_note_detail` DISABLE KEYS */;
INSERT INTO `tb_goods_receipt_note_detail` VALUES (23,'8930001000209','LOA 1',2,1,1,0.00,0.00,'PN-00000000026','C3'),(30,'8930001000216','LOA 2',2,10,10,2.00,20.00,'PN-00000000029','C4'),(31,'8930001000193','Dầu dừa',1,15,15,2.00,30.00,'PN-00000000029','c2'),(36,'8930001000940','Thai sling bag 22*24cm',6,10,10,5.00,50.00,'PN-00000000030','TUITHAI'),(37,'8930001000988','Coconut mask',7,10,10,0.00,0.00,'PN-00000000031','MATNA'),(41,'8930001002241','Men Sunglasses ',6,15,15,11.00,165.00,'PN-00000000033','KMN'),(42,'8930001000766','Pen box',6,2,2,2.80,5.60,'PN-00000000035','HOPVIET'),(43,'8930001000834','Keychains',6,9,9,0.40,3.60,'PN-00000000035','MOCDUA'),(44,'8930001000865','Toothpick jar 1',6,3,3,1.90,5.70,'PN-00000000035','TAMCA'),(45,'8930001000872','Toothpick jar 2',6,3,3,1.70,5.10,'PN-00000000035','TAMTHU'),(46,'8930001000858','Name card box',6,2,2,1.90,3.80,'PN-00000000035','CARD'),(47,'8930001000926','Wristlet 17*10cm',6,2,2,2.60,5.20,'PN-00000000035','VITAY'),(48,'8930001000933','Small sling bag 17*13cm',6,2,2,4.00,8.00,'PN-00000000035','TUINHO'),(49,'8930001000957','Big sling bag 22*13cm',6,1,1,4.80,4.80,'PN-00000000035','TUILON'),(50,'8930001000940','Thai sling bag 22*24cm',6,1,1,5.20,5.20,'PN-00000000035','TUITHAI'),(51,'8930001001978','Tea set',4,1,1,14.30,14.30,'PN-00000000035','BOTRA'),(52,'8930001000704','Pestle and mortar',4,1,1,5.50,5.50,'PN-00000000035','CVC'),(53,'8930001000711','Chopsticks type 1',4,1,1,2.30,2.30,'PN-00000000035','DUA1'),(54,'8930001000728','Chopsticks type 2',4,1,1,1.60,1.60,'PN-00000000035','DUA2'),(55,'8930001000735','Jar of tea',6,1,1,2.80,2.80,'PN-00000000035','HUMUT'),(56,'8930001000810','Big Dish',6,1,1,3.10,3.10,'PN-00000000035','DL'),(57,'8930001000742','Small Dish ',6,2,2,2.40,4.80,'PN-00000000035','DN'),(58,'8930001000841','4 tablespoons kits',6,2,2,3.10,6.20,'PN-00000000035','B4M'),(59,'8930001000896','Bowl',6,1,1,6.80,6.80,'PN-00000000035','TO'),(60,'8930001000797','Small bowl ',6,1,1,1.70,1.70,'PN-00000000035','C001'),(61,'8930001002203','Sauce bowl',6,1,1,1.40,1.40,'PN-00000000035','C002'),(62,'8930001000827','Coasters',4,3,3,3.00,9.00,'PN-00000000035','LOTLY'),(63,'8930001000988','Coconut mask',7,17,17,5.20,88.40,'PN-00000000035','MATNA'),(64,'8930001000919','Comb hair',6,1,1,2.00,2.00,'PN-00000000035','LU'),(65,'8930001000902','Water Dipper ',6,2,2,0.60,1.20,'PN-00000000035','GD'),(66,'8930001001008','Music box + power bank C79',6,43,43,339000.00,14577000.00,'PN-00000000036','C79'),(67,'8930001001329','Headphones',6,12,12,389000.00,4668000.00,'PN-00000000036','HPSD'),(69,'8930001001015','Bluetooth speaker  A9',6,6,6,209000.00,1254000.00,'PN-00000000036','A9'),(70,'8930001001022','Bluetooth speaker  A10',6,8,8,189000.00,1512000.00,'PN-00000000036','A10'),(71,'8930001001190','USB Led light',6,8,8,229000.00,1832000.00,'PN-00000000036','LED7'),(72,'8930001001282','Cable for iPhone 5/6 & Ipad mini',6,487,487,55000.00,26785000.00,'PN-00000000036','CAPDU'),(73,'8930001001336','USB 16GB',6,23,23,129000.00,2967000.00,'PN-00000000036','USB16'),(74,'8930001001343','USB 32GB',6,16,16,149000.00,2384000.00,'PN-00000000036','USB32'),(75,'8930001001053','Bluetooth speaker HF-Q8',6,20,20,179000.00,3580000.00,'PN-00000000036','Q8'),(76,'8930001000995','Dancing water speakers FM08',4,26,26,295000.00,7670000.00,'PN-00000000036','FM08'),(77,'8930001001312','3 in 1 Power bank',6,13,13,180000.00,2340000.00,'PN-00000000036','PIN3IN1'),(78,'8930001001183','Smart watch T3',6,20,20,550000.00,11000000.00,'PN-00000000037','T3'),(80,'8930001001305','Xiaomi Piston Youth Colourful Edition earphones',6,48,48,242000.00,11616000.00,'PN-00000000037','EAR'),(81,'8930001001206','Bluetooth music bulb WJ-L2',4,20,20,539000.00,10780000.00,'PN-00000000037','WJL2'),(82,'8930001001220','Xiaomi YI IP Camera Wireless Wifi HD 720P-Night Edition',6,20,20,880000.00,17600000.00,'PN-00000000037','YI'),(83,'8930001001213','Led electric mosquito catcher',6,50,50,308000.00,15400000.00,'PN-00000000037','LEDM'),(84,'8930001001442','VR box 3D glasses',6,20,20,264000.00,5280000.00,'PN-00000000037','VRBOX'),(85,'8930001001251','Bluetooth microphone YS-10',6,20,20,946000.00,18920000.00,'PN-00000000037','MIC'),(86,'8930001001046','Best core Magic boost portable speakers',6,20,20,484000.00,9680000.00,'PN-00000000037','CH'),(87,'8930001000711','Chopsticks type 1',4,1,1,39000.00,39000.00,'PN-00000000038','DUA1'),(88,'8930001000728','Chopsticks type 2',4,1,1,29000.00,29000.00,'PN-00000000038','DUA2'),(89,'8930001000797','Small bowl ',6,2,2,29000.00,58000.00,'PN-00000000038','C001'),(90,'8930001000896','Bowl',6,1,1,99000.00,99000.00,'PN-00000000038','TO'),(91,'8930001002203','Sauce bowl',6,1,1,25000.00,25000.00,'PN-00000000038','C002'),(92,'8930001000742','Small Dish ',6,2,2,45000.00,90000.00,'PN-00000000038','DN'),(93,'8930001000810','Big Dish',6,1,1,55000.00,55000.00,'PN-00000000038','DL'),(94,'8930001000841','4 tablespoons kits',6,2,2,49000.00,98000.00,'PN-00000000038','B4M'),(95,'8930001000919','Comb hair',6,1,1,35000.00,35000.00,'PN-00000000038','LU'),(96,'8930001000704','Pestle and mortar',4,1,1,89000.00,89000.00,'PN-00000000038','CVC'),(97,'8930001000902','Water Dipper ',6,2,2,10000.00,20000.00,'PN-00000000038','GD'),(98,'8930001000827','Coasters',4,3,3,55000.00,165000.00,'PN-00000000039','LOTLY'),(99,'8930001000766','Pen box',6,2,2,49000.00,98000.00,'PN-00000000039','HOPVIET'),(100,'8930001000834','Keychains',6,9,9,10000.00,90000.00,'PN-00000000039','MOCDUA'),(101,'8930001000865','Toothpick jar 1',6,3,3,35000.00,105000.00,'PN-00000000039','TAMCA'),(102,'8930001000872','Toothpick jar 2',6,3,3,40000.00,120000.00,'PN-00000000039','TAMTHU'),(103,'8930001000858','Name card box',6,2,2,35000.00,70000.00,'PN-00000000039','CARD'),(104,'8930001000926','Wristlet 17*10cm',6,2,2,60000.00,120000.00,'PN-00000000039','VITAY'),(105,'8930001000933','Small sling bag 17*13cm',6,2,2,90000.00,180000.00,'PN-00000000039','TUINHO'),(106,'8930001000957','Big sling bag 22*13cm',6,1,1,110000.00,110000.00,'PN-00000000039','TUILON'),(107,'8930001000940','Thai sling bag 22*24cm',6,1,1,120000.00,120000.00,'PN-00000000039','TUITHAI'),(109,'8930001000735','Jar of tea',6,1,1,50000.00,50000.00,'PN-00000000038','HUMUT'),(110,'8930001001992','Gerbera flower',6,1,1,75000.00,75000.00,'PN-00000000040','HDT'),(111,'8930001002005','Orchid',6,1,1,59000.00,59000.00,'PN-00000000040','HLAN'),(112,'8930001002050','Small sand jar',6,8,8,10000.00,80000.00,'PN-00000000040','CATNHO'),(113,'8930001002067','Big sand jar',6,4,4,19000.00,76000.00,'PN-00000000040','CATLON'),(114,'8930001002098','Fish  9x20cm',6,2,2,28000.00,56000.00,'PN-00000000040','CADOI'),(115,'8930001002081','Small boat',6,3,3,35000.00,105000.00,'PN-00000000040','THUYENNHO'),(116,'8930001001961','Shell lamp',6,2,2,149000.00,298000.00,'PN-00000000040','DENNGU'),(117,'8930001002012','Keychains',6,10,10,10000.00,100000.00,'PN-00000000040','MOCSO'),(118,'8930001001978','Tea set',4,1,1,269000.00,269000.00,'PN-00000000040','BOTRA'),(121,'8930001002135','Hairpin comb',6,1,1,45000.00,45000.00,'PN-00000000041','CAITOC'),(122,'8930001002111','Necklace',6,2,2,19000.00,38000.00,'PN-00000000041','VONGCO'),(123,'8930001002074','Coral',6,2,2,45000.00,90000.00,'PN-00000000041','SANHO'),(124,'8930001001985','Seashell',6,3,3,39000.00,117000.00,'PN-00000000041','GHE'),(125,'8930001000988','Coconut mask',7,12,12,120000.00,1440000.00,'PN-00000000042','MATNA'),(126,'8930001002166','Heart shaped shell (Brown)',8,20,20,10000.00,200000.00,'PN-00000000043','VSN'),(127,'8930001002142','Heart shaped shell (Orange)',8,39,39,10000.00,390000.00,'PN-00000000043','VSC'),(128,'8930001002159','Heart shaped shell (Pink)',3,46,46,10000.00,460000.00,'PN-00000000043','VSH'),(129,'8930001001039','Smart box mini',6,21,21,85000.00,1785000.00,'PN-00000000044','SMARTBOX'),(130,'8930001001640','Tall candle',7,9,9,55000.00,495000.00,'PN-00000000044','NLC'),(131,'8930001001664','Lotus candle',7,3,3,55000.00,165000.00,'PN-00000000044','NHS'),(132,'8930001001657','Round candle',7,17,17,35000.00,595000.00,'PN-00000000044','NTR'),(133,'8930001001480','Light LED motorbike (circle)',6,1,1,110000.00,110000.00,'PN-00000000044','LED2'),(134,'8930001001381','USB cable',6,9,9,35000.00,315000.00,'PN-00000000044','CUSB'),(135,'8930001001398','Car charger',6,4,4,79000.00,316000.00,'PN-00000000044','SOT'),(136,'8930001001404','Backup charger ring',6,1,1,67000.00,67000.00,'PN-00000000044','CS'),(137,'8930001002234','Women Sunglasses ',6,3,3,130000.00,390000.00,'PN-00000000044','KMNU'),(138,'8930001002241','Men Sunglasses ',6,15,15,189000.00,2835000.00,'PN-00000000044','KMN'),(139,'8930001001497','Ceiling led light',6,1,1,135000.00,135000.00,'PN-00000000044','LTRAN'),(140,'8930001001671','Motorcycle rearview mirror',6,1,1,69000.00,69000.00,'PN-00000000044','KCH2'),(141,'8930001001299','Insole grip for phone',6,11,11,35000.00,385000.00,'PN-00000000044','KDT'),(142,'8930001001060','Bluetooth speaker - Pulse XL',6,1,1,1299000.00,1299000.00,'PN-00000000044','GREAT'),(145,'8930001001527','Mini fan air conditioning',6,1,1,115000.00,115000.00,'PN-00000000044','QDH'),(149,'8930001001503','Micro SINGPLAY',6,1,1,289000.00,289000.00,'PN-00000000045','SINPLAY'),(150,'8930001001435','Air purifier',6,2,2,549000.00,1098000.00,'PN-00000000045','KQ06'),(151,'8930001001275','Car holder',6,48,48,209000.00,10032000.00,'PN-00000000037','KIPAD'),(152,'8930001001619','Lotus light pink',6,10,10,150000.00,1500000.00,'PN-00000000045','DS2'),(153,'8930001001602','Lotus light yellow ',6,24,24,150000.00,3600000.00,'PN-00000000045','DS1'),(154,'8930001001626','Lotus light ',6,43,43,150000.00,6450000.00,'PN-00000000045','DS3'),(155,'8930001002333','Health monitoring bracelet ',6,98,98,0.00,0.00,'PN-00000000046','VEEPOO'),(156,'8930001001558','led shoes',4,4,4,0.00,0.00,'PN-00000000046','GIAY'),(157,'8930001001770','PCB board 1',6,1,1,0.00,0.00,'PN-00000000046','BM1'),(158,'8930001001749','PCB board 2',6,1,1,0.00,0.00,'PN-00000000046','BM2'),(159,'8930001001725','PCB board 3',6,1,1,0.00,0.00,'PN-00000000046','BM3'),(160,'8930001001732','PCB board 4',6,1,1,0.00,0.00,'PN-00000000046','BM4'),(161,'8930001001756','PCB board 5',6,1,1,0.00,0.00,'PN-00000000046','BM5'),(162,'8930001001763','PCB board 6',6,1,1,0.00,0.00,'PN-00000000046','BM6'),(163,'8930001001695','PCB board 7',6,1,1,0.00,0.00,'PN-00000000046','BM7'),(164,'8930001001718','PCB board 8',6,1,1,0.00,0.00,'PN-00000000046','BM8'),(165,'8930001001701','PCB board 9',6,1,1,0.00,0.00,'PN-00000000046','BM9'),(166,'8930001001688','PCB board 10',6,1,1,0.00,0.00,'PN-00000000046','BM10'),(168,'8930001002265','Adapter',6,1,1,0.00,0.00,'PN-00000000046','ADAPTER'),(169,'8930001002272','Jack ',6,1,1,0.00,0.00,'PN-00000000046','KETNOI'),(170,'8930001002289','Big PCB Board',6,1,1,0.00,0.00,'PN-00000000046','BMT'),(171,'8930001002371','Water Based Paint / Par Weather AC H05-40V',2,5,5,0.00,0.00,'PN-00000000047','AC H05-40V'),(172,'8930001002388','Water Based Paint / Par Weather AC H75-40T',2,9,9,0.00,0.00,'PN-00000000047','AC H75-40T'),(173,'8930001002395','Water Based Paint / Par Weather AC KP-110',2,10,10,0.00,0.00,'PN-00000000047','AC KP-110'),(174,'8930001002401','Kansai paint Eco AC Sealer',2,1,1,0.00,0.00,'PN-00000000047','ACSEALER'),(175,'8930001002418','Water Based Paint / Crown Emulsion H75-40T',2,7,7,0.00,0.00,'PN-00000000047','H75-40T'),(176,'8930001002425','Premium Skim Coat for Exter KSB-E',2,2,2,0.00,0.00,'PN-00000000047','KBSE'),(177,'8930001002432','Water Based Paint / Crown Emulsion KP-110',2,16,16,0.00,0.00,'PN-00000000047','KP-110'),(178,'8930001002449','TestProduct1',1,1,1,2.00,2.00,'PN-00000000049','TestCode'),(179,'8930001002036','Photo frames (10×15cm)',6,1,1,89000.00,89000.00,'PN-00000000041','KHUNG10'),(180,'8930001002043','Photo frames (13×18cm)',6,3,3,99000.00,297000.00,'PN-00000000041','KHUNG13'),(181,'8930001001268','Charger Pisen 12W  1A-2.4A',6,36,36,150000.00,5400000.00,'PN-00000000044','COCPISEN'),(182,'8930001001824','Cable lightning PISEN',6,39,39,55000.00,2145000.00,'PN-00000000044','CAPISEN'),(183,'8930001001787','Audio/video high grade cable',6,2,2,59000.00,118000.00,'PN-00000000044','JACKAUDIO'),(250,'8930001002685','silicone led light',6,150,150,69000.00,10350000.00,'PN-00000000050','SILED'),(251,'8930001002630','safety dog scarf',6,150,150,44000.00,6600000.00,'PN-00000000050','DOGSCARF'),(252,'8930001002647','self cleaning slicker pet brush',6,100,100,74000.00,7400000.00,'PN-00000000050','PETBRUSH'),(253,'8930001002654','dematting grooming comb',6,100,100,78000.00,7800000.00,'PN-00000000050','DECOMB'),(254,'8930001002661','pet nail clppers',6,150,150,72000.00,10800000.00,'PN-00000000050','CLIP'),(255,'8930001002609','clothes for dogs 1',6,150,150,126000.00,18900000.00,'PN-00000000050','CLODOG1'),(256,'8930001002616','dog bow tie collar',6,100,100,57000.00,5700000.00,'PN-00000000050','COLLAR'),(257,'8930001002623','clothes for dogs 2',6,100,100,130000.00,13000000.00,'PN-00000000050','CLODOG 2'),(258,'8930001002678','hand spinner',6,300,300,39000.00,11700000.00,'PN-00000000050','SPIN'),(259,'8930001002470','protection case  for phone',6,300,300,46000.00,13800000.00,'PN-00000000050','PROCASE'),(260,'8930001002487','premium tempered glass screen protector',6,300,300,21000.00,6300000.00,'PN-00000000050','PREPROTEC'),(261,'8930001002494','kid\'s stereo headphone 1',6,300,300,179000.00,53700000.00,'PN-00000000050','KIDHEAD1'),(262,'8930001002500','kid\'s stereo headphone 2',6,100,100,172000.00,17200000.00,'PN-00000000050','KIDHEAD2'),(263,'8930001002517','stereo headphones ',6,150,150,41000.00,6150000.00,'PN-00000000050','STEHEAD'),(264,'8930001002531','gaming stereo  headphones',6,150,150,60000.00,9000000.00,'PN-00000000050','GAMHEAD'),(265,'8930001002548','multimedia microphone',6,200,200,37000.00,7400000.00,'PN-00000000050','MULMIC'),(266,'8930001002555','keyring charger',6,150,150,52000.00,7800000.00,'PN-00000000050','KEYCHAR'),(267,'8930001002562','LCD writing table',6,150,150,751000.00,112650000.00,'PN-00000000050','LWT'),(268,'8930001002579','in-ear headphone',6,200,200,118000.00,23600000.00,'PN-00000000050','INEAR'),(269,'8930001002586','high performance  luxury earphones 1',6,150,150,95000.00,14250000.00,'PN-00000000050','HPLEAR1'),(270,'8930001002593','high performance  luxury earphones 2',6,150,150,126000.00,18900000.00,'PN-00000000050','HPLEAR2'),(279,'8930001002692','Activity Tracker  – AX1',6,100,100,303000.00,30300000.00,'PN-00000000052','AX1'),(280,'8930001002708','Smart Bracelet - i5 plus',6,30,30,449000.00,13470000.00,'PN-00000000052','AX1PLUS'),(281,'8930001002715','Smart Bracelet - AX-G8',6,30,30,757000.00,22710000.00,'PN-00000000052','AXG8'),(282,'8930001002722','Children GPS Watch – AX-G1',6,30,30,701000.00,21030000.00,'PN-00000000052','AXG1'),(283,'8930001002746','Children GPS Watch – AX-G1B',6,30,30,1038000.00,31140000.00,'PN-00000000052','AXG1B'),(284,'8930001002760','GPS device for Pet – P2',6,20,20,480000.00,9600000.00,'PN-00000000052','P2'),(285,'8930001002777','Wifi Socket – S1',6,50,50,278000.00,13900000.00,'PN-00000000052','S1'),(286,'8930001002784','Wifi Light – B1 plus',6,50,50,244000.00,12200000.00,'PN-00000000052','B1PLUS'),(287,'8930001002791','IP Camera ',6,20,20,983000.00,19660000.00,'PN-00000000052','C624'),(288,'8930001001619','Lotus light pink',6,10,10,150000.00,1500000.00,'PN-00000000057','DS2'),(289,'8930001001626','Lotus light ',6,43,43,150000.00,6450000.00,'PN-00000000057','DS3'),(290,'8930001002012','Keychains',6,10,10,10000.00,100000.00,'PN-00000000057','MOCSO'),(291,'8930001000834','Keychains',6,9,9,10000.00,90000.00,'PN-00000000057','MOCDUA'),(292,'8930001001299','Insole grip for phone',6,10,10,35000.00,350000.00,'PN-00000000057','KDT'),(293,'8930001001282','Cable for iPhone 5/6 & Ipad mini',6,487,487,55000.00,26785000.00,'PN-00000000057','CAPDU'),(294,'8930001001602','Lotus light yellow ',6,24,24,150000.00,3600000.00,'PN-00000000057','DS1'),(295,'8930001001657','Round candle',7,17,17,35000.00,595000.00,'PN-00000000057','NTR'),(296,'8930001001640','Tall candle',7,9,9,55000.00,495000.00,'PN-00000000057','NLC'),(297,'8930001002142','Heart shaped shell (Orange)',8,39,39,10000.00,390000.00,'PN-00000000057','VSC'),(298,'8930001002159','Heart shaped shell (Pink)',8,46,46,10000.00,460000.00,'PN-00000000057','VSH'),(299,'8930001002166','Heart shaped shell (Brown)',8,20,20,10000.00,200000.00,'PN-00000000057','VSN'),(300,'8930001002142','Heart shaped shell (Orange)',8,20,20,10000.00,200000.00,'PN-00000000058','VSC'),(301,'8930001002159','Heart shaped shell (Pink)',8,20,20,10000.00,200000.00,'PN-00000000058','VSH'),(302,'8930001002432','Water Based Paint / Crown Emulsion KP-110',2,16,16,0.00,0.00,'PN-00000000059','KP-110'),(303,'8930001002425','Premium Skim Coat for Exter KSB-E',2,2,2,0.00,0.00,'PN-00000000059','KBSE'),(304,'8930001002418','Water Based Paint / Crown Emulsion H75-40T',2,7,7,0.00,0.00,'PN-00000000059','H75-40T'),(305,'8930001002401','Kansai paint Eco AC Sealer',2,1,1,0.00,0.00,'PN-00000000059','ACSEALER'),(306,'8930001002395','Water Based Paint / Par Weather AC KP-110',2,10,10,0.00,0.00,'PN-00000000059','AC KP-110'),(307,'8930001002388','Water Based Paint / Par Weather AC H75-40T',2,9,9,0.00,0.00,'PN-00000000059','AC H75-40T'),(308,'8930001002371','Water Based Paint / Par Weather AC H05-40V',2,5,5,0.00,0.00,'PN-00000000059','AC H05-40V'),(309,'8930001001299','Insole grip for phone',6,1,1,35000.00,35000.00,'PN-00000000060','KDT'),(310,'8930001002043','Photo frames (13×18cm)',6,1,1,99000.00,99000.00,'PN-00000000061','KHUNG13'),(311,'8930001001343','USB 32GB',6,2,2,149000.00,298000.00,'PN-00000000062','USB32'),(312,'8930001001343','USB 32GB',6,1,1,149000.00,149000.00,'PN-00000000063','USB32'),(313,'8930001001343','USB 32GB',6,111,111,149000.00,16539000.00,'PN-00000000064','USB32'),(314,'8930001001053','Bluetooth speaker HF-Q8',6,1,1,179000.00,179000.00,'PN-00000000056','Q8'),(315,'8930001001299','Insole grip for phone',6,1,1,35000.00,35000.00,'PN-00000000065','KDT'),(316,'8930001000728','Chopsticks type 2',4,1,1,29000.00,29000.00,'PN-00000000066','DUA2'),(317,'8930001000704','Pestle and mortar',4,1,1,89000.00,89000.00,'PN-00000000066','CVC'),(318,'8930001001008','Music box + power bank C79',6,1,1,339000.00,339000.00,'PN-00000000067','C79'),(319,'8930001001282','Cable for iPhone 5/6 & Ipad mini',6,1,1,55000.00,55000.00,'PN-00000000068','CAPDU'),(320,'8930001000988','Coconut mask',7,4,4,120000.00,480000.00,'PN-00000000069','MATNA'),(321,'8930001002814','Wireless music earphone V4.1+ EDR',6,2,2,0.00,0.00,'PN-00000000070','HBQI7'),(322,'8930001002807','twin true wireless earbuds V4.2 + DER',6,4,4,0.00,0.00,'PN-00000000070','I7 TWS'),(323,'8930001001657','Round candle',7,1,1,35000.00,35000.00,'PN-00000000071','NTR'),(324,'8930001001275','Car holder',6,1,1,209000.00,209000.00,'PN-00000000072','KIPAD'),(325,'8930001002821','wireless metal in-ear stereo',6,30,30,0.00,0.00,'PN-00000000073','WLINEAR'),(326,'8930001002838','Music wireless speaker',6,3,3,0.00,0.00,'PN-00000000073','A2DP'),(327,'8930001002852','wireless music YZ-18',6,10,10,0.00,0.00,'PN-00000000073','YZ-18'),(328,'8930001002876','mini audio 175',6,10,10,0.00,0.00,'PN-00000000073','175'),(329,'8930001002883','BT speaker Y-35',6,6,6,0.00,0.00,'PN-00000000073','Y-35'),(330,'8930001002890','QUTE wireless speaker',6,1,1,0.00,0.00,'PN-00000000073','QUTE'),(331,'8930001002913','USB VAIO SONY - 8GB',6,10,10,0.00,0.00,'PN-00000000073','USBVIO8'),(332,'8930001002920','USB KINGSTON - 8GB',6,25,25,0.00,0.00,'PN-00000000073','USBKT8'),(333,'8930001002937','USB KINGSTON - 16GB		',6,15,15,0.00,0.00,'PN-00000000073','USBKT16'),(334,'8930001002814','Wireless music earphone V4.1+ EDR',6,20,20,0.00,0.00,'PN-00000000073','HBQI7'),(335,'8930001002845','mini speaker WS-187',6,10,10,0.00,0.00,'PN-00000000073','WS-187'),(336,'8930001002869','BT speaker S-13',6,10,10,0.00,0.00,'PN-00000000073','S-13'),(337,'8930001001015','Bluetooth speaker  A9',6,6,6,209000.00,1254000.00,'PN-00000000074','A9'),(338,'8930001001022','Bluetooth speaker  A10',6,8,8,189000.00,1512000.00,'PN-00000000074','A10'),(339,'8930001001039','Smart box mini',6,21,21,85000.00,1785000.00,'PN-00000000074','SMARTBOX'),(340,'8930001001053','Bluetooth speaker HF-Q8',6,10,10,179000.00,1790000.00,'PN-00000000074','Q8'),(341,'8930001001336','USB 16GB',6,10,10,129000.00,1290000.00,'PN-00000000074','USB16'),(342,'8930001001343','USB 32GB',6,10,10,149000.00,1490000.00,'PN-00000000074','USB32'),(343,'8930001001343','USB 32GB',6,2,2,149000.00,298000.00,'PN-00000000075','USB32'),(344,'8930001001015','Bluetooth speaker  A9',6,1,1,209000.00,209000.00,'PN-00000000075','A9'),(345,'8930001001022','Bluetooth speaker  A10',6,1,1,189000.00,189000.00,'PN-00000000075','A10'),(346,'8930001001039','Smart box mini',6,1,1,85000.00,85000.00,'PN-00000000075','SMARTBOX'),(347,'8930001001053','Bluetooth speaker HF-Q8',6,1,1,179000.00,179000.00,'PN-00000000076','Q8'),(348,'8930001001022','Bluetooth speaker  A10',6,3,3,189000.00,567000.00,'PN-00000000077','A10'),(349,'8930001001053','Bluetooth speaker HF-Q8',6,4,4,179000.00,716000.00,'PN-00000000077','Q8'),(350,'8930001001343','USB 32GB',6,3,3,149000.00,447000.00,'PN-00000000077','USB32'),(351,'8930001001022','Bluetooth speaker  A10',6,4,4,189000.00,756000.00,'PN-00000000078','A10'),(352,'8930001001015','Bluetooth speaker  A9',6,5,5,209000.00,1045000.00,'PN-00000000078','A9'),(353,'8930001001053','Bluetooth speaker HF-Q8',6,5,5,179000.00,895000.00,'PN-00000000078','Q8'),(354,'8930001001039','Smart box mini',6,20,20,85000.00,1700000.00,'PN-00000000078','SMARTBOX'),(355,'8930001001343','USB 32GB',6,5,5,149000.00,745000.00,'PN-00000000078','USB32'),(356,'8930001001336','USB 16GB',6,10,10,129000.00,1290000.00,'PN-00000000079','USB16'),(357,'8930001001282','Cable for iPhone 5/6 & Ipad mini',6,12,12,55000.00,660000.00,'PN-00000000080','CAPDU'),(358,'8930001001343','USB 32GB',6,4,4,149000.00,596000.00,'PN-00000000081','USB32'),(359,'8930001001282','Cable for iPhone 5/6 & Ipad mini',6,1,1,55000.00,55000.00,'PN-00000000082','CAPDU'),(360,'8930001002814','Wireless music earphone V4.1+ EDR',6,1,1,0.00,0.00,'PN-00000000083','HBQI7'),(361,'8930001002937','USB KINGSTON - 16GB		',6,8,8,0.00,0.00,'PN-00000000083','USBKT16'),(362,'8930001002920','USB KINGSTON - 8GB',6,8,8,0.00,0.00,'PN-00000000083','USBKT8'),(363,'8930001002890','QUTE wireless speaker',6,1,1,0.00,0.00,'PN-00000000083','QUTE'),(364,'8930001002913','USB VAIO SONY - 8GB',6,8,8,0.00,0.00,'PN-00000000083','USBVIO8'),(365,'8930001002821','wireless metal in-ear stereo',6,11,11,0.00,0.00,'PN-00000000083','WLINEAR'),(366,'8930001002869','BT speaker S-13',6,9,9,0.00,0.00,'PN-00000000083','S-13'),(367,'8930001002876','mini audio 175',6,2,2,0.00,0.00,'PN-00000000083','175'),(368,'8930001002852','wireless music YZ-18',6,2,2,0.00,0.00,'PN-00000000083','YZ-18'),(369,'8930001002807','twin true wireless earbuds V4.2 + DER',6,2,2,0.00,0.00,'PN-00000000083','I7 TWS'),(370,'8930001002876','mini audio 175',6,1,1,0.00,0.00,'PN-00000000084','175'),(371,'8930001002845','mini speaker WS-187',6,2,2,0.00,0.00,'PN-00000000084','WS-187'),(372,'8930001002821','wireless metal in-ear stereo',6,5,5,0.00,0.00,'PN-00000000084','WLINEAR'),(373,'8930001002876','mini audio 175',6,1,1,0.00,0.00,'PN-00000000085','175'),(374,'8930001001282','Cable for iPhone 5/6 & Ipad mini',6,1,1,0.00,0.00,'PN-00000000086','CAPDU'),(375,'8930001002043','Photo frames (13×18cm)',6,1,1,99000.00,99000.00,'PN-00000000087','KHUNG13'),(376,'8930001001657','Round candle',7,1,1,35000.00,35000.00,'PN-00000000088','NTR'),(377,'8930001002821','wireless metal in-ear stereo',6,2,2,0.00,0.00,'PN-00000000089','WLINEAR'),(378,'8930001002852','wireless music YZ-18',6,2,2,0.00,0.00,'PN-00000000089','YZ-18'),(379,'8930001002845','mini speaker WS-187',6,1,1,0.00,0.00,'PN-00000000089','WS-187'),(380,'8930001002876','mini audio 175',6,2,2,0.00,0.00,'PN-00000000089','175'),(381,'8930001002814','Wireless music earphone V4.1+ EDR',6,3,3,0.00,0.00,'PN-00000000089','HBQI7'),(382,'8930001002807','twin true wireless earbuds V4.2 + DER',6,1,1,0.00,0.00,'PN-00000000089','I7 TWS'),(383,'8930001002838','Music wireless speaker',6,3,3,0.00,0.00,'PN-00000000089','A2DP'),(384,'8930001001282','Cable for iPhone 5/6 & Ipad mini',6,1,1,55000.00,55000.00,'PN-00000000089','CAPDU'),(385,'8930001002876','mini audio 175',6,1,1,0.00,0.00,'PN-00000000090','175'),(386,'8930001001343','USB 32GB',6,1,1,149000.00,149000.00,'PN-00000000091','USB32'),(387,'8930001001343','USB 32GB',6,1,1,149000.00,149000.00,'PN-00000000092','USB32');
/*!40000 ALTER TABLE `tb_goods_receipt_note_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_industry`
--

DROP TABLE IF EXISTS `tb_industry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_industry` (
  `id` varchar(2) NOT NULL,
  `IndustryName` varchar(145) DEFAULT NULL,
  `IndustryDes` varchar(245) DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `UpdateDate` datetime DEFAULT NULL,
  `CreateUser` varchar(45) DEFAULT NULL,
  `UpdateUser` varchar(45) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_industry`
--

LOCK TABLES `tb_industry` WRITE;
/*!40000 ALTER TABLE `tb_industry` DISABLE KEYS */;
INSERT INTO `tb_industry` VALUES ('01','Electronic products','Electronic products','2017-01-01 00:00:00','2017-06-19 10:15:55','u1@gmail.com','u1@gmail.com',1),('02','Coconut products','Coconut products','2017-02-02 00:00:00','2017-06-19 10:14:08','u1@gmail.com','u1@gmail.com',1),('03','Fashion - Beauty Products','Fashion - Beauty Products','2017-06-09 14:45:57','2017-06-19 10:16:05','u1@gmail.com','u1@gmail.com',1),('04','Seashell products','Seashell products','2017-06-19 11:04:54','2017-06-19 15:49:45','u1@gmail.com','u1@gmail.com',1),('05','Housewares','Housewares','2017-06-16 11:42:29','2017-06-19 10:55:52','u1@gmail.com','u1@gmail.com',1),('06','Worship products','Worship products','2017-07-03 13:56:15','2017-08-04 11:08:03','u1@gmail.com','u1@gmail.com',1),('07','Building materials','Buiding materials','2017-08-04 11:07:52','2017-08-09 08:37:46','u1@gmail.com','u1@gmail.com',1),('08','Pet products','Pet products','2017-09-14 15:03:06','2017-09-14 15:03:54','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com',1),('09','Toys','Toys','2017-09-14 15:59:34','2017-09-14 16:16:27','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com',1);
/*!40000 ALTER TABLE `tb_industry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_inventory`
--

DROP TABLE IF EXISTS `tb_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_inventory` (
  `LogicWarehouseId` char(6) NOT NULL,
  `ProductId` varchar(13) NOT NULL COMMENT 'barcode genarator',
  `ProductName` varchar(245) DEFAULT NULL,
  `RealQuantity` int(11) DEFAULT '0',
  `DocumentQuantity` int(11) DEFAULT '0',
  `ModifyTime` datetime DEFAULT NULL COMMENT 'thời gian điều chỉnh cuối cùng',
  `ProductCode` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`LogicWarehouseId`,`ProductId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_inventory`
--

LOCK TABLES `tb_inventory` WRITE;
/*!40000 ALTER TABLE `tb_inventory` DISABLE KEYS */;
INSERT INTO `tb_inventory` VALUES ('DS1-HQ','8930001001046','Best core Magic boost portable speakers',20,20,'2017-08-10 14:57:30','CH'),('DS1-HQ','8930001001183','Smart watch T3',20,20,'2017-08-10 14:57:29','T3'),('DS1-HQ','8930001001206','Bluetooth music bulb WJ-L2',20,20,'2017-08-10 14:57:29','WJL2'),('DS1-HQ','8930001001213','Led electric mosquito catcher',50,50,'2017-08-10 14:57:30','LEDM'),('DS1-HQ','8930001001220','Xiaomi YI IP Camera Wireless Wifi HD 720P-Night Edition',20,20,'2017-08-10 14:57:30','YI'),('DS1-HQ','8930001001251','Bluetooth microphone YS-10',20,20,'2017-08-10 14:57:30','MIC'),('DS1-HQ','8930001001275','Car holder',47,47,'2017-10-30 14:57:05','KIPAD'),('DS1-HQ','8930001001305','Xiaomi Piston Youth Colourful Edition earphones',48,48,'2017-08-10 14:57:29','EAR'),('DS1-HQ','8930001001442','VR box 3D glasses',20,20,'2017-08-10 14:57:30','VRBOX'),('DS1-KG','8930001001015','Bluetooth speaker  A9',0,0,'2017-11-30 20:54:55','A9'),('DS1-KG','8930001001022','Bluetooth speaker  A10',0,0,'2017-11-30 20:54:55','A10'),('DS1-KG','8930001001039','Smart box mini',0,0,'2017-11-30 20:54:55','SMARTBOX'),('DS1-KG','8930001001053','Bluetooth speaker HF-Q8',0,0,'2017-11-30 20:54:55','Q8'),('DS1-KG','8930001001336','USB 16GB',0,0,'2017-11-30 20:59:14','USB16'),('DS1-KG','8930001001343','USB 32GB',0,0,'2017-11-30 20:54:55','USB32'),('DS1-KH','8930001000704','Pestle and mortar',1,1,'2017-10-20 16:53:31','CVC'),('DS1-KH','8930001000728','Chopsticks type 2',1,1,'2017-10-20 16:53:31','DUA2'),('DS1-KH','8930001000988','Coconut mask',4,4,'2017-10-24 09:24:50','MATNA'),('DS1-KH','8930001001008','Music box + power bank C79',1,1,'2017-10-20 16:59:03','C79'),('DS1-KH','8930001001015','Bluetooth speaker  A9',1,1,'2017-11-03 23:42:13','A9'),('DS1-KH','8930001001022','Bluetooth speaker  A10',4,4,'2017-11-30 20:44:48','A10'),('DS1-KH','8930001001039','Smart box mini',1,1,'2017-11-03 23:42:13','SMARTBOX'),('DS1-KH','8930001001053','Bluetooth speaker HF-Q8',6,6,'2017-11-30 20:44:48','Q8'),('DS1-KH','8930001001275','Car holder',1,1,'2017-10-30 14:57:36','KIPAD'),('DS1-KH','8930001001282','Cable for iPhone 5/6 & Ipad mini',13,13,'2017-11-30 21:18:01','CAPDU'),('DS1-KH','8930001001299','Insole grip for phone',2,2,'2017-10-20 16:51:43','KDT'),('DS1-KH','8930001001343','USB 32GB',14,14,'2017-12-14 09:25:40','USB32'),('DS1-KH','8930001002043','Photo frames (13×18cm)',1,1,'2017-09-06 15:41:20','KHUNG13'),('DS1-KM','8930001000834','Keychains',9,9,'2017-09-10 15:26:17','MOCDUA'),('DS1-KM','8930001001282','Cable for iPhone 5/6 & Ipad mini',471,471,'2017-12-01 00:40:05','CAPDU'),('DS1-KM','8930001001299','Insole grip for phone',9,9,'2017-10-20 16:42:07','KDT'),('DS1-KM','8930001001602','Lotus light yellow ',24,24,'2017-09-10 15:26:17','DS1'),('DS1-KM','8930001001619','Lotus light pink',10,10,'2017-09-10 15:26:17','DS2'),('DS1-KM','8930001001626','Lotus light ',43,43,'2017-09-10 15:26:17','DS3'),('DS1-KM','8930001001640','Tall candle',9,9,'2017-09-10 15:26:17','NLC'),('DS1-KM','8930001001657','Round candle',15,15,'2017-11-30 21:57:22','NTR'),('DS1-KM','8930001002012','Keychains',10,10,'2017-09-10 15:26:17','MOCSO'),('DS1-KM','8930001002142','Heart shaped shell (Orange)',19,19,'2017-09-10 15:27:16','VSC'),('DS1-KM','8930001002159','Heart shaped shell (Pink)',26,26,'2017-09-10 15:27:16','VSH'),('DS1-KM','8930001002166','Heart shaped shell (Brown)',20,20,'2017-09-10 15:26:18','VSN'),('DS1-KM','8930001002807','twin true wireless earbuds V4.2 + DER',1,1,'2017-12-01 00:40:05','I7 TWS'),('DS1-KM','8930001002814','Wireless music earphone V4.1+ EDR',18,18,'2017-12-01 00:40:05','HBQI7'),('DS1-KM','8930001002821','wireless metal in-ear stereo',14,14,'2017-12-01 00:40:05','WLINEAR'),('DS1-KM','8930001002838','Music wireless speaker',0,0,'2017-12-01 00:40:05','A2DP'),('DS1-KM','8930001002845','mini speaker WS-187',7,7,'2017-12-01 00:40:05','WS-187'),('DS1-KM','8930001002852','wireless music YZ-18',6,6,'2017-12-01 00:40:05','YZ-18'),('DS1-KM','8930001002869','BT speaker S-13',9,9,'2017-11-30 21:34:18','S-13'),('DS1-KM','8930001002876','mini audio 175',5,5,'2017-12-01 14:29:12','175'),('DS1-KM','8930001002883','BT speaker Y-35',6,6,'2017-10-31 22:26:32','Y-35'),('DS1-KM','8930001002890','QUTE wireless speaker',0,0,'2017-11-30 21:34:18','QUTE'),('DS1-KM','8930001002913','USB VAIO SONY - 8GB',2,2,'2017-11-30 21:34:18','USBVIO8'),('DS1-KM','8930001002920','USB KINGSTON - 8GB',17,17,'2017-11-30 21:34:18','USBKT8'),('DS1-KM','8930001002937','USB KINGSTON - 16GB		',7,7,'2017-11-30 21:34:18','USBKT16'),('DS1-QT','8930001001282','Cable for iPhone 5/6 & Ipad mini',3,3,'2017-12-01 00:42:37','CAPDU'),('DS1-QT','8930001001657','Round candle',1,1,'2017-10-30 14:52:26','NTR'),('DS1-QT','8930001002807','twin true wireless earbuds V4.2 + DER',3,3,'2017-12-01 00:42:37','I7 TWS'),('DS1-QT','8930001002814','Wireless music earphone V4.1+ EDR',4,4,'2017-12-01 00:42:37','HBQI7'),('DS1-QT','8930001002821','wireless metal in-ear stereo',18,18,'2017-12-01 00:42:37','WLINEAR'),('DS1-QT','8930001002838','Music wireless speaker',3,3,'2017-12-01 00:42:37','A2DP'),('DS1-QT','8930001002845','mini speaker WS-187',3,3,'2017-12-01 00:42:37','WS-187'),('DS1-QT','8930001002852','wireless music YZ-18',4,4,'2017-12-01 00:42:37','YZ-18'),('DS1-QT','8930001002869','BT speaker S-13',9,9,'2017-11-30 21:36:14','S-13'),('DS1-QT','8930001002876','mini audio 175',5,5,'2017-12-01 14:28:01','175'),('DS1-QT','8930001002890','QUTE wireless speaker',1,1,'2017-11-30 21:36:14','QUTE'),('DS1-QT','8930001002913','USB VAIO SONY - 8GB',8,8,'2017-11-30 21:36:14','USBVIO8'),('DS1-QT','8930001002920','USB KINGSTON - 8GB',8,8,'2017-11-30 21:36:14','USBKT8'),('DS1-QT','8930001002937','USB KINGSTON - 16GB		',8,8,'2017-11-30 21:36:14','USBKT16'),('DS1-SK','8930001001657','Round candle',1,1,'2017-11-30 21:57:37','NTR'),('DS1-SK','8930001002043','Photo frames (13×18cm)',1,1,'2017-11-30 21:54:45','KHUNG13'),('DS1-SK','8930001002142','Heart shaped shell (Orange)',20,20,'2017-09-10 15:27:36','VSC'),('DS1-SK','8930001002159','Heart shaped shell (Pink)',20,20,'2017-09-10 15:27:36','VSH'),('DS1-TK','8930001000704','Pestle and mortar',0,0,'2017-10-20 16:43:54','CVC'),('DS1-TK','8930001000711','Chopsticks type 1',1,1,'2017-08-10 14:57:54','DUA1'),('DS1-TK','8930001000728','Chopsticks type 2',0,0,'2017-10-20 16:43:54','DUA2'),('DS1-TK','8930001000735','Jar of tea',1,1,'2017-08-10 14:57:54','HUMUT'),('DS1-TK','8930001000742','Small Dish ',2,2,'2017-08-10 14:57:54','DN'),('DS1-TK','8930001000766','Pen box',2,2,'2017-08-10 14:58:10','HOPVIET'),('DS1-TK','8930001000797','Small bowl ',2,2,'2017-08-10 14:57:54','C001'),('DS1-TK','8930001000810','Big Dish',1,1,'2017-08-10 14:57:54','DL'),('DS1-TK','8930001000827','Coasters',3,3,'2017-08-10 14:58:10','LOTLY'),('DS1-TK','8930001000834','Keychains',0,0,'2017-09-10 15:24:47','MOCDUA'),('DS1-TK','8930001000841','4 tablespoons kits',2,2,'2017-08-10 14:57:54','B4M'),('DS1-TK','8930001000858','Name card box',2,2,'2017-08-10 14:58:10','CARD'),('DS1-TK','8930001000865','Toothpick jar 1',3,3,'2017-08-10 14:58:10','TAMCA'),('DS1-TK','8930001000872','Toothpick jar 2',3,3,'2017-08-10 14:58:10','TAMTHU'),('DS1-TK','8930001000896','Bowl',1,1,'2017-08-10 14:57:54','TO'),('DS1-TK','8930001000902','Water Dipper ',2,2,'2017-08-10 14:57:54','GD'),('DS1-TK','8930001000919','Comb hair',1,1,'2017-08-10 14:57:54','LU'),('DS1-TK','8930001000926','Wristlet 17*10cm',2,2,'2017-08-10 14:58:10','VITAY'),('DS1-TK','8930001000933','Small sling bag 17*13cm',2,2,'2017-08-10 14:58:10','TUINHO'),('DS1-TK','8930001000940','Thai sling bag 22*24cm',1,1,'2017-08-10 14:58:10','TUITHAI'),('DS1-TK','8930001000957','Big sling bag 22*13cm',1,1,'2017-08-10 14:58:10','TUILON'),('DS1-TK','8930001000988','Coconut mask',8,8,'2017-10-24 09:24:16','MATNA'),('DS1-TK','8930001000995','Dancing water speakers FM08',26,26,'2017-08-10 14:57:20','FM08'),('DS1-TK','8930001001008','Music box + power bank C79',42,42,'2017-10-20 16:48:02','C79'),('DS1-TK','8930001001015','Bluetooth speaker  A9',5,5,'2017-11-30 20:55:18','A9'),('DS1-TK','8930001001022','Bluetooth speaker  A10',4,4,'2017-11-30 20:55:18','A10'),('DS1-TK','8930001001039','Smart box mini',20,20,'2017-11-30 20:55:18','SMARTBOX'),('DS1-TK','8930001001053','Bluetooth speaker HF-Q8',14,14,'2017-11-30 20:55:18','Q8'),('DS1-TK','8930001001060','Bluetooth speaker - Pulse XL',1,1,'2017-08-10 14:58:34','GREAT'),('DS1-TK','8930001001190','USB Led light',8,8,'2017-08-10 14:57:20','LED7'),('DS1-TK','8930001001268','Charger Pisen 12W  1A-2.4A',36,36,'2017-08-10 14:58:34','COCPISEN'),('DS1-TK','8930001001282','Cable for iPhone 5/6 & Ipad mini',0,0,'2017-09-10 15:24:47','CAPDU'),('DS1-TK','8930001001299','Insole grip for phone',0,0,'2017-09-10 15:24:47','KDT'),('DS1-TK','8930001001312','3 in 1 Power bank',13,13,'2017-08-10 14:57:20','PIN3IN1'),('DS1-TK','8930001001329','Headphones',12,12,'2017-08-10 14:57:20','HPSD'),('DS1-TK','8930001001336','USB 16GB',23,23,'2017-11-30 20:59:34','USB16'),('DS1-TK','8930001001343','USB 32GB',2,2,'2017-12-14 09:25:07','USB32'),('DS1-TK','8930001001381','USB cable',9,9,'2017-08-10 14:58:34','CUSB'),('DS1-TK','8930001001398','Car charger',4,4,'2017-08-10 14:58:34','SOT'),('DS1-TK','8930001001404','Backup charger ring',1,1,'2017-08-10 14:58:34','CS'),('DS1-TK','8930001001435','Air purifier',2,2,'2017-08-10 14:58:39','KQ06'),('DS1-TK','8930001001480','Light LED motorbike (circle)',1,1,'2017-08-10 14:58:34','LED2'),('DS1-TK','8930001001497','Ceiling led light',1,1,'2017-08-10 14:58:34','LTRAN'),('DS1-TK','8930001001503','Micro SINGPLAY',1,1,'2017-08-10 14:58:39','SINPLAY'),('DS1-TK','8930001001527','Mini fan air conditioning',1,1,'2017-08-10 14:58:34','QDH'),('DS1-TK','8930001001558','led shoes',4,4,'2017-08-10 14:58:44','GIAY'),('DS1-TK','8930001001602','Lotus light yellow ',0,0,'2017-09-10 15:24:48','DS1'),('DS1-TK','8930001001619','Lotus light pink',0,0,'2017-09-10 15:24:47','DS2'),('DS1-TK','8930001001626','Lotus light ',0,0,'2017-09-10 15:24:47','DS3'),('DS1-TK','8930001001640','Tall candle',0,0,'2017-09-10 15:24:48','NLC'),('DS1-TK','8930001001657','Round candle',0,0,'2017-09-10 15:24:48','NTR'),('DS1-TK','8930001001664','Lotus candle',3,3,'2017-08-10 14:58:34','NHS'),('DS1-TK','8930001001671','Motorcycle rearview mirror',1,1,'2017-08-10 14:58:34','KCH2'),('DS1-TK','8930001001688','PCB board 10',1,1,'2017-08-10 14:58:44','BM10'),('DS1-TK','8930001001695','PCB board 7',1,1,'2017-08-10 14:58:44','BM7'),('DS1-TK','8930001001701','PCB board 9',1,1,'2017-08-10 14:58:44','BM9'),('DS1-TK','8930001001718','PCB board 8',1,1,'2017-08-10 14:58:44','BM8'),('DS1-TK','8930001001725','PCB board 3',1,1,'2017-08-10 14:58:44','BM3'),('DS1-TK','8930001001732','PCB board 4',1,1,'2017-08-10 14:58:44','BM4'),('DS1-TK','8930001001749','PCB board 2',1,1,'2017-08-10 14:58:44','BM2'),('DS1-TK','8930001001756','PCB board 5',1,1,'2017-08-10 14:58:44','BM5'),('DS1-TK','8930001001763','PCB board 6',1,1,'2017-08-10 14:58:44','BM6'),('DS1-TK','8930001001770','PCB board 1',1,1,'2017-08-10 14:58:44','BM1'),('DS1-TK','8930001001787','Audio/video high grade cable',2,2,'2017-08-10 14:58:34','JACKAUDIO'),('DS1-TK','8930001001824','Cable lightning PISEN',39,39,'2017-08-10 14:58:34','CAPISEN'),('DS1-TK','8930001001961','Shell lamp',2,2,'2017-08-10 14:58:17','DENNGU'),('DS1-TK','8930001001978','Tea set',1,1,'2017-08-10 14:58:17','BOTRA'),('DS1-TK','8930001001985','Seashell',3,3,'2017-08-10 14:58:21','GHE'),('DS1-TK','8930001001992','Gerbera flower',1,1,'2017-08-10 14:58:16','HDT'),('DS1-TK','8930001002005','Orchid',1,1,'2017-08-10 14:58:16','HLAN'),('DS1-TK','8930001002012','Keychains',0,0,'2017-09-10 15:24:47','MOCSO'),('DS1-TK','8930001002036','Photo frames (10×15cm)',1,1,'2017-08-10 14:58:21','KHUNG10'),('DS1-TK','8930001002043','Photo frames (13×18cm)',1,1,'2017-11-30 21:54:30','KHUNG13'),('DS1-TK','8930001002050','Small sand jar',8,8,'2017-08-10 14:58:17','CATNHO'),('DS1-TK','8930001002067','Big sand jar',4,4,'2017-08-10 14:58:17','CATLON'),('DS1-TK','8930001002074','Coral',2,2,'2017-08-10 14:58:21','SANHO'),('DS1-TK','8930001002081','Small boat',3,3,'2017-08-10 14:58:17','THUYENNHO'),('DS1-TK','8930001002098','Fish  9x20cm',2,2,'2017-08-10 14:58:17','CADOI'),('DS1-TK','8930001002111','Necklace',2,2,'2017-08-10 14:58:21','VONGCO'),('DS1-TK','8930001002135','Hairpin comb',1,1,'2017-08-10 14:58:21','CAITOC'),('DS1-TK','8930001002142','Heart shaped shell (Orange)',0,0,'2017-09-10 15:24:48','VSC'),('DS1-TK','8930001002159','Heart shaped shell (Pink)',0,0,'2017-09-10 15:24:48','VSH'),('DS1-TK','8930001002166','Heart shaped shell (Brown)',0,0,'2017-09-10 15:24:48','VSN'),('DS1-TK','8930001002203','Sauce bowl',1,1,'2017-08-10 14:57:54','C002'),('DS1-TK','8930001002234','Women Sunglasses ',3,3,'2017-08-10 14:58:34','KMNU'),('DS1-TK','8930001002241','Men Sunglasses ',15,15,'2017-08-10 14:58:34','KMN'),('DS1-TK','8930001002265','Adapter',1,1,'2017-08-10 14:58:44','ADAPTER'),('DS1-TK','8930001002272','Jack ',1,1,'2017-08-10 14:58:44','KETNOI'),('DS1-TK','8930001002289','Big PCB Board',1,1,'2017-08-10 14:58:44','BMT'),('DS1-TK','8930001002333','Health monitoring bracelet ',98,98,'2017-08-10 14:58:44','VEEPOO'),('ST1-TA','8930001002371','Water Based Paint / Par Weather AC H05-40V',5,5,'2017-09-10 15:38:47','AC H05-40V'),('ST1-TA','8930001002388','Water Based Paint / Par Weather AC H75-40T',9,9,'2017-09-10 15:38:47','AC H75-40T'),('ST1-TA','8930001002395','Water Based Paint / Par Weather AC KP-110',10,10,'2017-09-10 15:38:47','AC KP-110'),('ST1-TA','8930001002401','Kansai paint Eco AC Sealer',1,1,'2017-09-10 15:38:47','ACSEALER'),('ST1-TA','8930001002418','Water Based Paint / Crown Emulsion H75-40T',7,7,'2017-09-10 15:38:47','H75-40T'),('ST1-TA','8930001002425','Premium Skim Coat for Exter KSB-E',2,2,'2017-09-10 15:38:47','KBSE'),('ST1-TA','8930001002432','Water Based Paint / Crown Emulsion KP-110',16,16,'2017-09-10 15:38:47','KP-110'),('ST1-TK','8930001002371','Water Based Paint / Par Weather AC H05-40V',0,0,'2017-09-10 15:38:20','AC H05-40V'),('ST1-TK','8930001002388','Water Based Paint / Par Weather AC H75-40T',0,0,'2017-09-10 15:38:20','AC H75-40T'),('ST1-TK','8930001002395','Water Based Paint / Par Weather AC KP-110',0,0,'2017-09-10 15:38:20','AC KP-110'),('ST1-TK','8930001002401','Kansai paint Eco AC Sealer',0,0,'2017-09-10 15:38:20','ACSEALER'),('ST1-TK','8930001002418','Water Based Paint / Crown Emulsion H75-40T',0,0,'2017-09-10 15:38:20','H75-40T'),('ST1-TK','8930001002425','Premium Skim Coat for Exter KSB-E',0,0,'2017-09-10 15:38:20','KBSE'),('ST1-TK','8930001002432','Water Based Paint / Crown Emulsion KP-110',0,0,'2017-09-10 15:38:20','KP-110'),('ST1-TK','8930001002470','protection case  for phone',300,300,'2017-09-08 15:36:45','PROCASE'),('ST1-TK','8930001002487','premium tempered glass screen protector',300,300,'2017-09-08 15:36:45','PREPROTEC'),('ST1-TK','8930001002494','kid\'s stereo headphone 1',300,300,'2017-09-08 15:36:45','KIDHEAD1'),('ST1-TK','8930001002500','kid\'s stereo headphone 2',100,100,'2017-09-08 15:36:45','KIDHEAD2'),('ST1-TK','8930001002517','stereo headphones ',150,150,'2017-09-08 15:36:45','STEHEAD'),('ST1-TK','8930001002531','gaming stereo  headphones',150,150,'2017-09-08 15:36:45','GAMHEAD'),('ST1-TK','8930001002548','multimedia microphone',200,200,'2017-09-08 15:36:45','MULMIC'),('ST1-TK','8930001002555','keyring charger',150,150,'2017-09-08 15:36:45','KEYCHAR'),('ST1-TK','8930001002562','LCD writing table',150,150,'2017-09-08 15:36:45','LWT'),('ST1-TK','8930001002579','in-ear headphone',200,200,'2017-09-08 15:36:45','INEAR'),('ST1-TK','8930001002586','high performance  luxury earphones 1',150,150,'2017-09-08 15:36:45','HPLEAR1'),('ST1-TK','8930001002593','high performance  luxury earphones 2',150,150,'2017-09-08 15:36:45','HPLEAR2'),('ST1-TK','8930001002609','clothes for dogs 1',150,150,'2017-09-08 15:36:45','CLODOG1'),('ST1-TK','8930001002616','dog bow tie collar',100,100,'2017-09-08 15:36:45','COLLAR'),('ST1-TK','8930001002623','clothes for dogs 2',100,100,'2017-09-08 15:36:45','CLODOG 2'),('ST1-TK','8930001002630','safety dog scarf',150,150,'2017-09-08 15:36:45','DOGSCARF'),('ST1-TK','8930001002647','self cleaning slicker pet brush',100,100,'2017-09-08 15:36:45','PETBRUSH'),('ST1-TK','8930001002654','dematting grooming comb',100,100,'2017-09-08 15:36:45','DECOMB'),('ST1-TK','8930001002661','pet nail clppers',150,150,'2017-09-08 15:36:45','CLIP'),('ST1-TK','8930001002678','hand spinner',300,300,'2017-09-08 15:36:45','SPIN'),('ST1-TK','8930001002685','silicone led light',150,150,'2017-09-08 15:36:45','SILED'),('ST1-TK','8930001002692','Activity Tracker  – AX1',100,100,'2017-09-11 15:39:30','AX1'),('ST1-TK','8930001002708','Smart Bracelet - i5 plus',30,30,'2017-09-11 15:39:30','AX1PLUS'),('ST1-TK','8930001002715','Smart Bracelet - AX-G8',30,30,'2017-09-11 15:39:30','AXG8'),('ST1-TK','8930001002722','Children GPS Watch – AX-G1',30,30,'2017-09-11 15:39:30','AXG1'),('ST1-TK','8930001002746','Children GPS Watch – AX-G1B',30,30,'2017-09-11 15:39:30','AXG1B'),('ST1-TK','8930001002760','GPS device for Pet – P2',20,20,'2017-09-11 15:39:30','P2'),('ST1-TK','8930001002777','Wifi Socket – S1',50,50,'2017-09-11 15:39:30','S1'),('ST1-TK','8930001002784','Wifi Light – B1 plus',50,50,'2017-09-11 15:39:30','B1PLUS'),('ST1-TK','8930001002791','IP Camera ',20,20,'2017-09-11 15:39:30','C624');
/*!40000 ALTER TABLE `tb_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_inventory_report`
--

DROP TABLE IF EXISTS `tb_inventory_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_inventory_report` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `LogicWarehouseId` char(6) DEFAULT NULL,
  `ProductId` varchar(13) DEFAULT NULL,
  `ProductCode` varchar(45) DEFAULT NULL,
  `ProductName` varchar(245) DEFAULT NULL,
  `QtyBeginning` int(11) DEFAULT NULL,
  `PriceBeginning` decimal(11,2) DEFAULT NULL,
  `QtyImport` int(11) DEFAULT NULL,
  `PriceImport` decimal(11,2) DEFAULT NULL,
  `QtyExport` int(11) DEFAULT NULL,
  `PriceExport` decimal(11,2) DEFAULT NULL,
  `QtyEnding` int(11) DEFAULT NULL,
  `PriceEnding` decimal(11,2) DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=321 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_inventory_report`
--

LOCK TABLES `tb_inventory_report` WRITE;
/*!40000 ALTER TABLE `tb_inventory_report` DISABLE KEYS */;
INSERT INTO `tb_inventory_report` VALUES (1,'DS1-TK','8930001001008','C79','Music box + power bank C79',0,0.00,43,339000.00,0,339000.00,43,339000.00,'2017-08-10 14:57:20'),(2,'DS1-TK','8930001001329','HPSD','Headphones',0,0.00,12,389000.00,0,389000.00,12,389000.00,'2017-08-10 14:57:20'),(3,'DS1-TK','8930001001015','A9','Bluetooth speaker  A9',0,0.00,6,209000.00,0,209000.00,6,209000.00,'2017-08-10 14:57:20'),(4,'DS1-TK','8930001001022','A10','Bluetooth speaker  A10',0,0.00,8,189000.00,0,189000.00,8,189000.00,'2017-08-10 14:57:20'),(5,'DS1-TK','8930001001190','LED7','USB Led light',0,0.00,8,229000.00,0,229000.00,8,229000.00,'2017-08-10 14:57:20'),(6,'DS1-TK','8930001001282','CAPDU','Cable for iPhone 5/6 & Ipad mini',0,0.00,487,55000.00,0,55000.00,487,55000.00,'2017-08-10 14:57:20'),(7,'DS1-TK','8930001001336','USB16','USB 16GB',0,0.00,23,129000.00,0,129000.00,23,129000.00,'2017-08-10 14:57:20'),(8,'DS1-TK','8930001001343','USB32','USB 32GB',0,0.00,16,149000.00,0,149000.00,16,149000.00,'2017-08-10 14:57:20'),(9,'DS1-TK','8930001001053','Q8','Bluetooth speaker HF-Q8',0,0.00,20,179000.00,0,179000.00,19,179000.00,'2017-08-10 14:57:20'),(10,'DS1-TK','8930001000995','FM08','Dancing water speakers FM08',0,0.00,26,295000.00,0,295000.00,26,295000.00,'2017-08-10 14:57:20'),(11,'DS1-TK','8930001001312','PIN3IN1','3 in 1 Power bank',0,0.00,13,180000.00,0,180000.00,13,180000.00,'2017-08-10 14:57:20'),(12,'DS1-HQ','8930001001183','T3','Smart watch T3',0,0.00,20,550000.00,0,550000.00,20,550000.00,'2017-08-10 14:57:29'),(13,'DS1-HQ','8930001001305','EAR','Xiaomi Piston Youth Colourful Edition earphones',0,0.00,48,242000.00,0,242000.00,48,242000.00,'2017-08-10 14:57:29'),(14,'DS1-HQ','8930001001206','WJL2','Bluetooth music bulb WJ-L2',0,0.00,20,539000.00,0,539000.00,20,539000.00,'2017-08-10 14:57:29'),(15,'DS1-HQ','8930001001220','YI','Xiaomi YI IP Camera Wireless Wifi HD 720P-Night Edition',0,0.00,20,880000.00,0,880000.00,20,880000.00,'2017-08-10 14:57:30'),(16,'DS1-HQ','8930001001213','LEDM','Led electric mosquito catcher',0,0.00,50,308000.00,0,308000.00,50,308000.00,'2017-08-10 14:57:30'),(17,'DS1-HQ','8930001001442','VRBOX','VR box 3D glasses',0,0.00,20,264000.00,0,264000.00,20,264000.00,'2017-08-10 14:57:30'),(18,'DS1-HQ','8930001001251','MIC','Bluetooth microphone YS-10',0,0.00,20,946000.00,0,946000.00,20,946000.00,'2017-08-10 14:57:30'),(19,'DS1-HQ','8930001001046','CH','Best core Magic boost portable speakers',0,0.00,20,484000.00,0,484000.00,20,484000.00,'2017-08-10 14:57:30'),(20,'DS1-HQ','8930001001275','KIPAD','Car holder',0,0.00,48,209000.00,0,209000.00,48,209000.00,'2017-08-10 14:57:30'),(21,'DS1-TK','8930001000711','DUA1','Chopsticks type 1',0,0.00,1,39000.00,0,39000.00,1,39000.00,'2017-08-10 14:57:54'),(22,'DS1-TK','8930001000728','DUA2','Chopsticks type 2',0,0.00,1,29000.00,0,29000.00,1,29000.00,'2017-08-10 14:57:54'),(23,'DS1-TK','8930001000797','C001','Small bowl ',0,0.00,2,29000.00,0,29000.00,2,29000.00,'2017-08-10 14:57:54'),(24,'DS1-TK','8930001000896','TO','Bowl',0,0.00,1,99000.00,0,99000.00,1,99000.00,'2017-08-10 14:57:54'),(25,'DS1-TK','8930001002203','C002','Sauce bowl',0,0.00,1,25000.00,0,25000.00,1,25000.00,'2017-08-10 14:57:54'),(26,'DS1-TK','8930001000742','DN','Small Dish ',0,0.00,2,45000.00,0,45000.00,2,45000.00,'2017-08-10 14:57:54'),(27,'DS1-TK','8930001000810','DL','Big Dish',0,0.00,1,55000.00,0,55000.00,1,55000.00,'2017-08-10 14:57:54'),(28,'DS1-TK','8930001000841','B4M','4 tablespoons kits',0,0.00,2,49000.00,0,49000.00,2,49000.00,'2017-08-10 14:57:54'),(29,'DS1-TK','8930001000919','LU','Comb hair',0,0.00,1,35000.00,0,35000.00,1,35000.00,'2017-08-10 14:57:54'),(30,'DS1-TK','8930001000704','CVC','Pestle and mortar',0,0.00,1,89000.00,0,89000.00,1,89000.00,'2017-08-10 14:57:54'),(31,'DS1-TK','8930001000902','GD','Water Dipper ',0,0.00,2,10000.00,0,10000.00,2,10000.00,'2017-08-10 14:57:54'),(32,'DS1-TK','8930001000735','HUMUT','Jar of tea',0,0.00,1,50000.00,0,50000.00,1,50000.00,'2017-08-10 14:57:54'),(33,'DS1-TK','8930001000827','LOTLY','Coasters',0,0.00,3,55000.00,0,55000.00,3,55000.00,'2017-08-10 14:58:10'),(34,'DS1-TK','8930001000766','HOPVIET','Pen box',0,0.00,2,49000.00,0,49000.00,2,49000.00,'2017-08-10 14:58:10'),(35,'DS1-TK','8930001000834','MOCDUA','Keychains',0,0.00,9,10000.00,0,10000.00,9,10000.00,'2017-08-10 14:58:10'),(36,'DS1-TK','8930001000865','TAMCA','Toothpick jar 1',0,0.00,3,35000.00,0,35000.00,3,35000.00,'2017-08-10 14:58:10'),(37,'DS1-TK','8930001000872','TAMTHU','Toothpick jar 2',0,0.00,3,40000.00,0,40000.00,3,40000.00,'2017-08-10 14:58:10'),(38,'DS1-TK','8930001000858','CARD','Name card box',0,0.00,2,35000.00,0,35000.00,2,35000.00,'2017-08-10 14:58:10'),(39,'DS1-TK','8930001000926','VITAY','Wristlet 17*10cm',0,0.00,2,60000.00,0,60000.00,2,60000.00,'2017-08-10 14:58:10'),(40,'DS1-TK','8930001000933','TUINHO','Small sling bag 17*13cm',0,0.00,2,90000.00,0,90000.00,2,90000.00,'2017-08-10 14:58:10'),(41,'DS1-TK','8930001000957','TUILON','Big sling bag 22*13cm',0,0.00,1,110000.00,0,110000.00,1,110000.00,'2017-08-10 14:58:10'),(42,'DS1-TK','8930001000940','TUITHAI','Thai sling bag 22*24cm',0,0.00,1,120000.00,0,120000.00,1,120000.00,'2017-08-10 14:58:10'),(43,'DS1-TK','8930001001992','HDT','Gerbera flower',0,0.00,1,75000.00,0,75000.00,1,75000.00,'2017-08-10 14:58:16'),(44,'DS1-TK','8930001002005','HLAN','Orchid',0,0.00,1,59000.00,0,59000.00,1,59000.00,'2017-08-10 14:58:17'),(45,'DS1-TK','8930001002050','CATNHO','Small sand jar',0,0.00,8,10000.00,0,10000.00,8,10000.00,'2017-08-10 14:58:17'),(46,'DS1-TK','8930001002067','CATLON','Big sand jar',0,0.00,4,19000.00,0,19000.00,4,19000.00,'2017-08-10 14:58:17'),(47,'DS1-TK','8930001002098','CADOI','Fish  9x20cm',0,0.00,2,28000.00,0,28000.00,2,28000.00,'2017-08-10 14:58:17'),(48,'DS1-TK','8930001002081','THUYENNHO','Small boat',0,0.00,3,35000.00,0,35000.00,3,35000.00,'2017-08-10 14:58:17'),(49,'DS1-TK','8930001001961','DENNGU','Shell lamp',0,0.00,2,149000.00,0,149000.00,2,149000.00,'2017-08-10 14:58:17'),(50,'DS1-TK','8930001002012','MOCSO','Keychains',0,0.00,10,10000.00,0,10000.00,10,10000.00,'2017-08-10 14:58:17'),(51,'DS1-TK','8930001001978','BOTRA','Tea set',0,0.00,1,269000.00,0,269000.00,1,269000.00,'2017-08-10 14:58:17'),(52,'DS1-TK','8930001002135','CAITOC','Hairpin comb',0,0.00,1,45000.00,0,45000.00,1,45000.00,'2017-08-10 14:58:21'),(53,'DS1-TK','8930001002111','VONGCO','Necklace',0,0.00,2,19000.00,0,19000.00,2,19000.00,'2017-08-10 14:58:21'),(54,'DS1-TK','8930001002074','SANHO','Coral',0,0.00,2,45000.00,0,45000.00,2,45000.00,'2017-08-10 14:58:21'),(55,'DS1-TK','8930001001985','GHE','Seashell',0,0.00,3,39000.00,0,39000.00,3,39000.00,'2017-08-10 14:58:21'),(56,'DS1-TK','8930001002036','KHUNG10','Photo frames (10×15cm)',0,0.00,1,89000.00,0,89000.00,1,89000.00,'2017-08-10 14:58:21'),(57,'DS1-TK','8930001002043','KHUNG13','Photo frames (13×18cm)',0,0.00,3,99000.00,0,99000.00,3,99000.00,'2017-08-10 14:58:21'),(58,'DS1-TK','8930001000988','MATNA','Coconut mask',0,0.00,12,120000.00,0,120000.00,12,120000.00,'2017-08-10 14:58:25'),(59,'DS1-TK','8930001002166','VSN','Heart shaped shell (Brown)',0,0.00,20,10000.00,0,10000.00,20,10000.00,'2017-08-10 14:58:28'),(60,'DS1-TK','8930001002142','VSC','Heart shaped shell (Orange)',0,0.00,39,10000.00,0,10000.00,39,10000.00,'2017-08-10 14:58:28'),(61,'DS1-TK','8930001002159','VSH','Heart shaped shell (Pink)',0,0.00,46,10000.00,0,10000.00,46,10000.00,'2017-08-10 14:58:28'),(62,'DS1-TK','8930001001039','SMARTBOX','Smart box mini',0,0.00,21,85000.00,0,85000.00,21,85000.00,'2017-08-10 14:58:34'),(63,'DS1-TK','8930001001640','NLC','Tall candle',0,0.00,9,55000.00,0,55000.00,9,55000.00,'2017-08-10 14:58:34'),(64,'DS1-TK','8930001001664','NHS','Lotus candle',0,0.00,3,55000.00,0,55000.00,3,55000.00,'2017-08-10 14:58:34'),(65,'DS1-TK','8930001001657','NTR','Round candle',0,0.00,17,35000.00,0,35000.00,17,35000.00,'2017-08-10 14:58:34'),(66,'DS1-TK','8930001001480','LED2','Light LED motorbike (circle)',0,0.00,1,110000.00,0,110000.00,1,110000.00,'2017-08-10 14:58:34'),(67,'DS1-TK','8930001001381','CUSB','USB cable',0,0.00,9,35000.00,0,35000.00,9,35000.00,'2017-08-10 14:58:34'),(68,'DS1-TK','8930001001398','SOT','Car charger',0,0.00,4,79000.00,0,79000.00,4,79000.00,'2017-08-10 14:58:34'),(69,'DS1-TK','8930001001404','CS','Backup charger ring',0,0.00,1,67000.00,0,67000.00,1,67000.00,'2017-08-10 14:58:34'),(70,'DS1-TK','8930001002234','KMNU','Women Sunglasses ',0,0.00,3,130000.00,0,130000.00,3,130000.00,'2017-08-10 14:58:34'),(71,'DS1-TK','8930001002241','KMN','Men Sunglasses ',0,0.00,15,189000.00,0,189000.00,15,189000.00,'2017-08-10 14:58:34'),(72,'DS1-TK','8930001001497','LTRAN','Ceiling led light',0,0.00,1,135000.00,0,135000.00,1,135000.00,'2017-08-10 14:58:34'),(73,'DS1-TK','8930001001671','KCH2','Motorcycle rearview mirror',0,0.00,1,69000.00,0,69000.00,1,69000.00,'2017-08-10 14:58:34'),(74,'DS1-TK','8930001001299','KDT','Insole grip for phone',0,0.00,11,35000.00,0,35000.00,11,35000.00,'2017-08-10 14:58:34'),(75,'DS1-TK','8930001001060','GREAT','Bluetooth speaker - Pulse XL',0,0.00,1,1299000.00,0,1299000.00,1,1299000.00,'2017-08-10 14:58:34'),(76,'DS1-TK','8930001001527','QDH','Mini fan air conditioning',0,0.00,1,115000.00,0,115000.00,1,115000.00,'2017-08-10 14:58:34'),(77,'DS1-TK','8930001001268','COCPISEN','Charger Pisen 12W  1A-2.4A',0,0.00,36,150000.00,0,150000.00,36,150000.00,'2017-08-10 14:58:34'),(78,'DS1-TK','8930001001824','CAPISEN','Cable lightning PISEN',0,0.00,39,55000.00,0,55000.00,39,55000.00,'2017-08-10 14:58:34'),(79,'DS1-TK','8930001001787','JACKAUDIO','Audio/video high grade cable',0,0.00,2,59000.00,0,59000.00,2,59000.00,'2017-08-10 14:58:35'),(80,'DS1-TK','8930001001503','SINPLAY','Micro SINGPLAY',0,0.00,1,289000.00,0,289000.00,1,289000.00,'2017-08-10 14:58:39'),(81,'DS1-TK','8930001001435','KQ06','Air purifier',0,0.00,2,549000.00,0,549000.00,2,549000.00,'2017-08-10 14:58:39'),(82,'DS1-TK','8930001001619','DS2','Lotus light pink',0,0.00,10,150000.00,0,150000.00,10,150000.00,'2017-08-10 14:58:39'),(83,'DS1-TK','8930001001602','DS1','Lotus light yellow ',0,0.00,24,150000.00,0,150000.00,24,150000.00,'2017-08-10 14:58:39'),(84,'DS1-TK','8930001001626','DS3','Lotus light ',0,0.00,43,150000.00,0,150000.00,43,150000.00,'2017-08-10 14:58:39'),(85,'DS1-TK','8930001002333','VEEPOO','Health monitoring bracelet ',0,0.00,98,0.00,0,0.00,98,0.00,'2017-08-10 14:58:44'),(86,'DS1-TK','8930001001558','GIAY','led shoes',0,0.00,4,0.00,0,0.00,4,0.00,'2017-08-10 14:58:44'),(87,'DS1-TK','8930001001770','BM1','PCB board 1',0,0.00,1,0.00,0,0.00,1,0.00,'2017-08-10 14:58:44'),(88,'DS1-TK','8930001001749','BM2','PCB board 2',0,0.00,1,0.00,0,0.00,1,0.00,'2017-08-10 14:58:44'),(89,'DS1-TK','8930001001725','BM3','PCB board 3',0,0.00,1,0.00,0,0.00,1,0.00,'2017-08-10 14:58:44'),(90,'DS1-TK','8930001001732','BM4','PCB board 4',0,0.00,1,0.00,0,0.00,1,0.00,'2017-08-10 14:58:44'),(91,'DS1-TK','8930001001756','BM5','PCB board 5',0,0.00,1,0.00,0,0.00,1,0.00,'2017-08-10 14:58:44'),(92,'DS1-TK','8930001001763','BM6','PCB board 6',0,0.00,1,0.00,0,0.00,1,0.00,'2017-08-10 14:58:44'),(93,'DS1-TK','8930001001695','BM7','PCB board 7',0,0.00,1,0.00,0,0.00,1,0.00,'2017-08-10 14:58:44'),(94,'DS1-TK','8930001001718','BM8','PCB board 8',0,0.00,1,0.00,0,0.00,1,0.00,'2017-08-10 14:58:44'),(95,'DS1-TK','8930001001701','BM9','PCB board 9',0,0.00,1,0.00,0,0.00,1,0.00,'2017-08-10 14:58:44'),(96,'DS1-TK','8930001001688','BM10','PCB board 10',0,0.00,1,0.00,0,0.00,1,0.00,'2017-08-10 14:58:44'),(97,'DS1-TK','8930001002265','ADAPTER','Adapter',0,0.00,1,0.00,0,0.00,1,0.00,'2017-08-10 14:58:44'),(98,'DS1-TK','8930001002272','KETNOI','Jack ',0,0.00,1,0.00,0,0.00,1,0.00,'2017-08-10 14:58:44'),(99,'DS1-TK','8930001002289','BMT','Big PCB Board',0,0.00,1,0.00,0,0.00,1,0.00,'2017-08-10 14:58:44'),(100,'DS1-TK','8930001001053','Q8','Bluetooth speaker HF-Q8',0,0.00,0,0.00,1,179000.00,19,179000.00,'2017-08-10 15:00:08'),(101,'DS1-KH','8930001001053','Q8','Bluetooth speaker HF-Q8',0,0.00,1,179000.00,0,179000.00,1,179000.00,'2017-08-10 15:03:13'),(102,'DS1-TK','8930001001299','KDT','Insole grip for phone',11,35000.00,0,0.00,1,35000.00,0,35000.00,'2017-09-10 15:23:56'),(103,'DS1-TK','8930001001619','DS2','Lotus light pink',10,150000.00,0,0.00,10,150000.00,0,150000.00,'2017-09-10 15:24:47'),(104,'DS1-TK','8930001001626','DS3','Lotus light ',43,150000.00,0,0.00,43,150000.00,0,150000.00,'2017-09-10 15:24:47'),(105,'DS1-TK','8930001002012','MOCSO','Keychains',10,10000.00,0,0.00,10,10000.00,0,10000.00,'2017-09-10 15:24:47'),(106,'DS1-TK','8930001000834','MOCDUA','Keychains',9,10000.00,0,0.00,9,10000.00,0,10000.00,'2017-09-10 15:24:47'),(107,'DS1-TK','8930001001299','KDT','Insole grip for phone',11,35000.00,0,0.00,10,35000.00,0,35000.00,'2017-09-10 15:24:47'),(108,'DS1-TK','8930001001282','CAPDU','Cable for iPhone 5/6 & Ipad mini',487,55000.00,0,0.00,487,55000.00,0,55000.00,'2017-09-10 15:24:48'),(109,'DS1-TK','8930001001602','DS1','Lotus light yellow ',24,150000.00,0,0.00,24,150000.00,0,150000.00,'2017-09-10 15:24:48'),(110,'DS1-TK','8930001001657','NTR','Round candle',17,35000.00,0,0.00,17,35000.00,0,35000.00,'2017-09-10 15:24:48'),(111,'DS1-TK','8930001001640','NLC','Tall candle',9,55000.00,0,0.00,9,55000.00,0,55000.00,'2017-09-10 15:24:48'),(112,'DS1-TK','8930001002142','VSC','Heart shaped shell (Orange)',39,10000.00,0,0.00,39,10000.00,0,10000.00,'2017-09-10 15:24:48'),(113,'DS1-TK','8930001002159','VSH','Heart shaped shell (Pink)',46,10000.00,0,0.00,46,10000.00,0,10000.00,'2017-09-10 15:24:48'),(114,'DS1-TK','8930001002166','VSN','Heart shaped shell (Brown)',20,10000.00,0,0.00,20,10000.00,0,10000.00,'2017-09-10 15:24:48'),(115,'DS1-KH','8930001001299','KDT','Insole grip for phone',0,0.00,1,35000.00,0,35000.00,1,35000.00,'2017-09-10 15:26:07'),(116,'DS1-KM','8930001001619','DS2','Lotus light pink',0,0.00,10,150000.00,0,150000.00,10,150000.00,'2017-09-10 15:26:17'),(117,'DS1-KM','8930001001626','DS3','Lotus light ',0,0.00,43,150000.00,0,150000.00,43,150000.00,'2017-09-10 15:26:17'),(118,'DS1-KM','8930001002012','MOCSO','Keychains',0,0.00,10,10000.00,0,10000.00,10,10000.00,'2017-09-10 15:26:17'),(119,'DS1-KM','8930001000834','MOCDUA','Keychains',0,0.00,9,10000.00,0,10000.00,9,10000.00,'2017-09-10 15:26:17'),(120,'DS1-KM','8930001001299','KDT','Insole grip for phone',0,0.00,10,35000.00,0,35000.00,10,35000.00,'2017-09-10 15:26:17'),(121,'DS1-KM','8930001001282','CAPDU','Cable for iPhone 5/6 & Ipad mini',0,0.00,487,55000.00,0,55000.00,487,55000.00,'2017-09-10 15:26:17'),(122,'DS1-KM','8930001001602','DS1','Lotus light yellow ',0,0.00,24,150000.00,0,150000.00,24,150000.00,'2017-09-10 15:26:17'),(123,'DS1-KM','8930001001657','NTR','Round candle',0,0.00,17,35000.00,0,35000.00,17,35000.00,'2017-09-10 15:26:17'),(124,'DS1-KM','8930001001640','NLC','Tall candle',0,0.00,9,55000.00,0,55000.00,9,55000.00,'2017-09-10 15:26:17'),(125,'DS1-KM','8930001002142','VSC','Heart shaped shell (Orange)',0,0.00,39,10000.00,0,10000.00,19,10000.00,'2017-09-10 15:26:17'),(126,'DS1-KM','8930001002159','VSH','Heart shaped shell (Pink)',0,0.00,46,10000.00,0,10000.00,26,10000.00,'2017-09-10 15:26:18'),(127,'DS1-KM','8930001002166','VSN','Heart shaped shell (Brown)',0,0.00,20,10000.00,0,10000.00,20,10000.00,'2017-09-10 15:26:18'),(128,'DS1-TK','8930001001343','USB32','USB 32GB',16,149000.00,0,0.00,2,149000.00,13,149000.00,'2017-09-10 15:26:40'),(129,'DS1-KH','8930001001343','USB32','USB 32GB',0,0.00,2,149000.00,0,149000.00,3,149000.00,'2017-09-10 15:26:57'),(130,'DS1-KM','8930001002142','VSC','Heart shaped shell (Orange)',0,0.00,0,0.00,20,10000.00,19,10000.00,'2017-09-10 15:27:16'),(131,'DS1-KM','8930001002159','VSH','Heart shaped shell (Pink)',0,0.00,0,0.00,20,10000.00,26,10000.00,'2017-09-10 15:27:16'),(132,'DS1-SK','8930001002142','VSC','Heart shaped shell (Orange)',0,0.00,20,10000.00,0,10000.00,20,10000.00,'2017-09-10 15:27:36'),(133,'DS1-SK','8930001002159','VSH','Heart shaped shell (Pink)',0,0.00,20,10000.00,0,10000.00,20,10000.00,'2017-09-10 15:27:36'),(134,'DS1-TK','8930001001343','USB32','USB 32GB',16,149000.00,0,0.00,1,149000.00,13,149000.00,'2017-09-10 15:29:13'),(135,'DS1-KH','8930001001343','USB32','USB 32GB',0,0.00,1,149000.00,0,149000.00,3,149000.00,'2017-09-10 15:29:39'),(136,'ST1-TK','8930001002371','AC H05-40V','Water Based Paint / Par Weather AC H05-40V',0,0.00,5,0.00,0,0.00,0,0.00,'2017-09-08 15:36:37'),(137,'ST1-TK','8930001002388','AC H75-40T','Water Based Paint / Par Weather AC H75-40T',0,0.00,9,0.00,0,0.00,0,0.00,'2017-09-08 15:36:37'),(138,'ST1-TK','8930001002395','AC KP-110','Water Based Paint / Par Weather AC KP-110',0,0.00,10,0.00,0,0.00,0,0.00,'2017-09-08 15:36:37'),(139,'ST1-TK','8930001002401','ACSEALER','Kansai paint Eco AC Sealer',0,0.00,1,0.00,0,0.00,0,0.00,'2017-09-08 15:36:37'),(140,'ST1-TK','8930001002418','H75-40T','Water Based Paint / Crown Emulsion H75-40T',0,0.00,7,0.00,0,0.00,0,0.00,'2017-09-08 15:36:37'),(141,'ST1-TK','8930001002425','KBSE','Premium Skim Coat for Exter KSB-E',0,0.00,2,0.00,0,0.00,0,0.00,'2017-09-08 15:36:37'),(142,'ST1-TK','8930001002432','KP-110','Water Based Paint / Crown Emulsion KP-110',0,0.00,16,0.00,0,0.00,0,0.00,'2017-09-08 15:36:37'),(143,'ST1-TK','8930001002685','SILED','silicone led light',0,0.00,150,69000.00,0,69000.00,150,69000.00,'2017-09-08 15:36:45'),(144,'ST1-TK','8930001002630','DOGSCARF','safety dog scarf',0,0.00,150,44000.00,0,44000.00,150,44000.00,'2017-09-08 15:36:45'),(145,'ST1-TK','8930001002647','PETBRUSH','self cleaning slicker pet brush',0,0.00,100,74000.00,0,74000.00,100,74000.00,'2017-09-08 15:36:45'),(146,'ST1-TK','8930001002654','DECOMB','dematting grooming comb',0,0.00,100,78000.00,0,78000.00,100,78000.00,'2017-09-08 15:36:45'),(147,'ST1-TK','8930001002661','CLIP','pet nail clppers',0,0.00,150,72000.00,0,72000.00,150,72000.00,'2017-09-08 15:36:45'),(148,'ST1-TK','8930001002609','CLODOG1','clothes for dogs 1',0,0.00,150,126000.00,0,126000.00,150,126000.00,'2017-09-08 15:36:45'),(149,'ST1-TK','8930001002616','COLLAR','dog bow tie collar',0,0.00,100,57000.00,0,57000.00,100,57000.00,'2017-09-08 15:36:45'),(150,'ST1-TK','8930001002623','CLODOG 2','clothes for dogs 2',0,0.00,100,130000.00,0,130000.00,100,130000.00,'2017-09-08 15:36:45'),(151,'ST1-TK','8930001002678','SPIN','hand spinner',0,0.00,300,39000.00,0,39000.00,300,39000.00,'2017-09-08 15:36:45'),(152,'ST1-TK','8930001002470','PROCASE','protection case  for phone',0,0.00,300,46000.00,0,46000.00,300,46000.00,'2017-09-08 15:36:45'),(153,'ST1-TK','8930001002487','PREPROTEC','premium tempered glass screen protector',0,0.00,300,21000.00,0,21000.00,300,21000.00,'2017-09-08 15:36:45'),(154,'ST1-TK','8930001002494','KIDHEAD1','kid\'s stereo headphone 1',0,0.00,300,179000.00,0,179000.00,300,179000.00,'2017-09-08 15:36:45'),(155,'ST1-TK','8930001002500','KIDHEAD2','kid\'s stereo headphone 2',0,0.00,100,172000.00,0,172000.00,100,172000.00,'2017-09-08 15:36:45'),(156,'ST1-TK','8930001002517','STEHEAD','stereo headphones ',0,0.00,150,41000.00,0,41000.00,150,41000.00,'2017-09-08 15:36:45'),(157,'ST1-TK','8930001002531','GAMHEAD','gaming stereo  headphones',0,0.00,150,60000.00,0,60000.00,150,60000.00,'2017-09-08 15:36:45'),(158,'ST1-TK','8930001002548','MULMIC','multimedia microphone',0,0.00,200,37000.00,0,37000.00,200,37000.00,'2017-09-08 15:36:45'),(159,'ST1-TK','8930001002555','KEYCHAR','keyring charger',0,0.00,150,52000.00,0,52000.00,150,52000.00,'2017-09-08 15:36:45'),(160,'ST1-TK','8930001002562','LWT','LCD writing table',0,0.00,150,751000.00,0,751000.00,150,751000.00,'2017-09-08 15:36:45'),(161,'ST1-TK','8930001002579','INEAR','in-ear headphone',0,0.00,200,118000.00,0,118000.00,200,118000.00,'2017-09-08 15:36:45'),(162,'ST1-TK','8930001002586','HPLEAR1','high performance  luxury earphones 1',0,0.00,150,95000.00,0,95000.00,150,95000.00,'2017-09-08 15:36:45'),(163,'ST1-TK','8930001002593','HPLEAR2','high performance  luxury earphones 2',0,0.00,150,126000.00,0,126000.00,150,126000.00,'2017-09-08 15:36:45'),(164,'ST1-TK','8930001002432','KP-110','Water Based Paint / Crown Emulsion KP-110',0,0.00,0,0.00,16,0.00,0,0.00,'2017-09-10 15:38:20'),(165,'ST1-TK','8930001002425','KBSE','Premium Skim Coat for Exter KSB-E',0,0.00,0,0.00,2,0.00,0,0.00,'2017-09-10 15:38:20'),(166,'ST1-TK','8930001002418','H75-40T','Water Based Paint / Crown Emulsion H75-40T',0,0.00,0,0.00,7,0.00,0,0.00,'2017-09-10 15:38:20'),(167,'ST1-TK','8930001002401','ACSEALER','Kansai paint Eco AC Sealer',0,0.00,0,0.00,1,0.00,0,0.00,'2017-09-10 15:38:20'),(168,'ST1-TK','8930001002395','AC KP-110','Water Based Paint / Par Weather AC KP-110',0,0.00,0,0.00,10,0.00,0,0.00,'2017-09-10 15:38:20'),(169,'ST1-TK','8930001002388','AC H75-40T','Water Based Paint / Par Weather AC H75-40T',0,0.00,0,0.00,9,0.00,0,0.00,'2017-09-10 15:38:20'),(170,'ST1-TK','8930001002371','AC H05-40V','Water Based Paint / Par Weather AC H05-40V',0,0.00,0,0.00,5,0.00,0,0.00,'2017-09-10 15:38:20'),(171,'ST1-TA','8930001002432','KP-110','Water Based Paint / Crown Emulsion KP-110',0,0.00,16,0.00,0,0.00,16,0.00,'2017-09-10 15:38:47'),(172,'ST1-TA','8930001002425','KBSE','Premium Skim Coat for Exter KSB-E',0,0.00,2,0.00,0,0.00,2,0.00,'2017-09-10 15:38:47'),(173,'ST1-TA','8930001002418','H75-40T','Water Based Paint / Crown Emulsion H75-40T',0,0.00,7,0.00,0,0.00,7,0.00,'2017-09-10 15:38:47'),(174,'ST1-TA','8930001002401','ACSEALER','Kansai paint Eco AC Sealer',0,0.00,1,0.00,0,0.00,1,0.00,'2017-09-10 15:38:47'),(175,'ST1-TA','8930001002395','AC KP-110','Water Based Paint / Par Weather AC KP-110',0,0.00,10,0.00,0,0.00,10,0.00,'2017-09-10 15:38:47'),(176,'ST1-TA','8930001002388','AC H75-40T','Water Based Paint / Par Weather AC H75-40T',0,0.00,9,0.00,0,0.00,9,0.00,'2017-09-10 15:38:47'),(177,'ST1-TA','8930001002371','AC H05-40V','Water Based Paint / Par Weather AC H05-40V',0,0.00,5,0.00,0,0.00,5,0.00,'2017-09-10 15:38:47'),(178,'ST1-TK','8930001002692','AX1','Activity Tracker  – AX1',0,0.00,100,303000.00,0,303000.00,100,303000.00,'2017-09-11 15:39:30'),(179,'ST1-TK','8930001002708','AX1PLUS','Smart Bracelet - i5 plus',0,0.00,30,449000.00,0,449000.00,30,449000.00,'2017-09-11 15:39:30'),(180,'ST1-TK','8930001002715','AXG8','Smart Bracelet - AX-G8',0,0.00,30,757000.00,0,757000.00,30,757000.00,'2017-09-11 15:39:30'),(181,'ST1-TK','8930001002722','AXG1','Children GPS Watch – AX-G1',0,0.00,30,701000.00,0,701000.00,30,701000.00,'2017-09-11 15:39:30'),(182,'ST1-TK','8930001002746','AXG1B','Children GPS Watch – AX-G1B',0,0.00,30,1038000.00,0,1038000.00,30,1038000.00,'2017-09-11 15:39:30'),(183,'ST1-TK','8930001002760','P2','GPS device for Pet – P2',0,0.00,20,480000.00,0,480000.00,20,480000.00,'2017-09-11 15:39:30'),(184,'ST1-TK','8930001002777','S1','Wifi Socket – S1',0,0.00,50,278000.00,0,278000.00,50,278000.00,'2017-09-11 15:39:30'),(185,'ST1-TK','8930001002784','B1PLUS','Wifi Light – B1 plus',0,0.00,50,244000.00,0,244000.00,50,244000.00,'2017-09-11 15:39:30'),(186,'ST1-TK','8930001002791','C624','IP Camera ',0,0.00,20,983000.00,0,983000.00,20,983000.00,'2017-09-11 15:39:30'),(187,'DS1-TK','8930001002043','KHUNG13','Photo frames (13×18cm)',3,99000.00,0,0.00,1,99000.00,2,99000.00,'2017-09-06 15:41:05'),(188,'DS1-KH','8930001002043','KHUNG13','Photo frames (13×18cm)',0,0.00,1,99000.00,0,99000.00,1,99000.00,'2017-09-06 15:41:20'),(189,'DS1-KM','8930001001299','KDT','Insole grip for phone',10,35000.00,0,0.00,1,35000.00,9,35000.00,'2017-10-20 16:42:07'),(190,'DS1-TK','8930001000728','DUA2','Chopsticks type 2',1,29000.00,0,0.00,1,29000.00,0,29000.00,'2017-10-20 16:43:54'),(191,'DS1-TK','8930001000704','CVC','Pestle and mortar',1,89000.00,0,0.00,1,89000.00,0,89000.00,'2017-10-20 16:43:54'),(192,'DS1-TK','8930001001008','C79','Music box + power bank C79',43,339000.00,0,0.00,1,339000.00,42,339000.00,'2017-10-20 16:48:02'),(193,'DS1-KM','8930001001282','CAPDU','Cable for iPhone 5/6 & Ipad mini',487,55000.00,0,0.00,1,55000.00,486,55000.00,'2017-10-20 16:49:30'),(194,'DS1-KH','8930001001299','KDT','Insole grip for phone',1,35000.00,1,35000.00,0,35000.00,2,35000.00,'2017-10-20 16:51:43'),(195,'DS1-KH','8930001000728','DUA2','Chopsticks type 2',0,0.00,1,29000.00,0,29000.00,1,29000.00,'2017-10-20 16:53:31'),(196,'DS1-KH','8930001000704','CVC','Pestle and mortar',0,0.00,1,89000.00,0,89000.00,1,89000.00,'2017-10-20 16:53:31'),(197,'DS1-QT','8930001001282','CAPDU','Cable for iPhone 5/6 & Ipad mini',0,0.00,1,55000.00,0,55000.00,1,55000.00,'2017-10-20 16:57:57'),(198,'DS1-KH','8930001001008','C79','Music box + power bank C79',0,0.00,1,339000.00,0,339000.00,1,339000.00,'2017-10-20 16:59:03'),(199,'DS1-TK','8930001000988','MATNA','Coconut mask',12,120000.00,0,0.00,4,120000.00,8,120000.00,'2017-10-24 09:24:16'),(200,'DS1-KH','8930001000988','MATNA','Coconut mask',0,0.00,4,120000.00,0,120000.00,4,120000.00,'2017-10-24 09:24:50'),(201,'DS1-KM','8930001001657','NTR','Round candle',17,35000.00,0,0.00,1,35000.00,16,35000.00,'2017-10-30 14:51:30'),(202,'DS1-QT','8930001001657','NTR','Round candle',0,0.00,1,35000.00,0,35000.00,1,35000.00,'2017-10-30 14:52:26'),(203,'DS1-HQ','8930001001275','KIPAD','Car holder',48,209000.00,0,0.00,1,209000.00,47,209000.00,'2017-10-30 14:57:05'),(204,'DS1-KH','8930001001275','KIPAD','Car holder',0,0.00,1,209000.00,0,209000.00,1,209000.00,'2017-10-30 14:57:37'),(205,'DS1-KM','8930001002814','HBQI7','Wireless music earphone V4.1+ EDR',0,0.00,2,0.00,0,0.00,18,0.00,'2017-10-31 22:26:23'),(206,'DS1-KM','8930001002807','I7 TWS','twin true wireless earbuds V4.2 + DER',0,0.00,4,0.00,0,0.00,1,0.00,'2017-10-31 22:26:23'),(207,'DS1-KM','8930001002821','WLINEAR','wireless metal in-ear stereo',0,0.00,30,0.00,0,0.00,14,0.00,'2017-10-31 22:26:32'),(208,'DS1-KM','8930001002838','A2DP','Music wireless speaker',0,0.00,3,0.00,0,0.00,0,0.00,'2017-10-31 22:26:32'),(209,'DS1-KM','8930001002852','YZ-18','wireless music YZ-18',0,0.00,10,0.00,0,0.00,6,0.00,'2017-10-31 22:26:32'),(210,'DS1-KM','8930001002876','175','mini audio 175',0,0.00,10,0.00,0,0.00,4,0.00,'2017-10-31 22:26:32'),(211,'DS1-KM','8930001002883','Y-35','BT speaker Y-35',0,0.00,6,0.00,0,0.00,6,0.00,'2017-10-31 22:26:32'),(212,'DS1-KM','8930001002890','QUTE','QUTE wireless speaker',0,0.00,1,0.00,0,0.00,0,0.00,'2017-10-31 22:26:32'),(213,'DS1-KM','8930001002913','USBVIO8','USB VAIO SONY - 8GB',0,0.00,10,0.00,0,0.00,2,0.00,'2017-10-31 22:26:32'),(214,'DS1-KM','8930001002920','USBKT8','USB KINGSTON - 8GB',0,0.00,25,0.00,0,0.00,17,0.00,'2017-10-31 22:26:32'),(215,'DS1-KM','8930001002937','USBKT16','USB KINGSTON - 16GB		',0,0.00,15,0.00,0,0.00,7,0.00,'2017-10-31 22:26:32'),(216,'DS1-KM','8930001002814','HBQI7','Wireless music earphone V4.1+ EDR',0,0.00,20,0.00,0,0.00,18,0.00,'2017-10-31 22:26:32'),(217,'DS1-KM','8930001002845','WS-187','mini speaker WS-187',0,0.00,10,0.00,0,0.00,7,0.00,'2017-10-31 22:26:32'),(218,'DS1-KM','8930001002869','S-13','BT speaker S-13',0,0.00,10,0.00,0,0.00,9,0.00,'2017-10-31 22:26:32'),(219,'DS1-TK','8930001001015','A9','Bluetooth speaker  A9',6,209000.00,0,0.00,6,209000.00,5,209000.00,'2017-11-03 23:35:01'),(220,'DS1-TK','8930001001022','A10','Bluetooth speaker  A10',8,189000.00,0,0.00,8,189000.00,4,189000.00,'2017-11-03 23:35:01'),(221,'DS1-TK','8930001001039','SMARTBOX','Smart box mini',21,85000.00,0,0.00,21,85000.00,20,85000.00,'2017-11-03 23:35:01'),(222,'DS1-TK','8930001001053','Q8','Bluetooth speaker HF-Q8',19,179000.00,0,0.00,10,179000.00,14,179000.00,'2017-11-03 23:35:01'),(223,'DS1-TK','8930001001336','USB16','USB 16GB',23,129000.00,0,0.00,10,129000.00,23,129000.00,'2017-11-03 23:35:01'),(224,'DS1-TK','8930001001343','USB32','USB 32GB',13,149000.00,0,0.00,10,149000.00,4,149000.00,'2017-11-03 23:35:01'),(225,'DS1-KG','8930001001015','A9','Bluetooth speaker  A9',0,0.00,6,209000.00,0,209000.00,0,209000.00,'2017-11-03 23:37:20'),(226,'DS1-KG','8930001001022','A10','Bluetooth speaker  A10',0,0.00,8,189000.00,0,189000.00,0,189000.00,'2017-11-03 23:37:20'),(227,'DS1-KG','8930001001039','SMARTBOX','Smart box mini',0,0.00,21,85000.00,0,85000.00,0,85000.00,'2017-11-03 23:37:20'),(228,'DS1-KG','8930001001053','Q8','Bluetooth speaker HF-Q8',0,0.00,10,179000.00,0,179000.00,0,179000.00,'2017-11-03 23:37:20'),(229,'DS1-KG','8930001001336','USB16','USB 16GB',0,0.00,10,129000.00,0,129000.00,0,129000.00,'2017-11-03 23:37:20'),(230,'DS1-KG','8930001001343','USB32','USB 32GB',0,0.00,10,149000.00,0,149000.00,0,149000.00,'2017-11-03 23:37:20'),(231,'DS1-KG','8930001001343','USB32','USB 32GB',0,0.00,0,0.00,2,149000.00,0,149000.00,'2017-11-03 23:41:43'),(232,'DS1-KG','8930001001015','A9','Bluetooth speaker  A9',0,0.00,0,0.00,1,209000.00,0,209000.00,'2017-11-03 23:41:43'),(233,'DS1-KG','8930001001022','A10','Bluetooth speaker  A10',0,0.00,0,0.00,1,189000.00,0,189000.00,'2017-11-03 23:41:43'),(234,'DS1-KG','8930001001039','SMARTBOX','Smart box mini',0,0.00,0,0.00,1,85000.00,0,85000.00,'2017-11-03 23:41:43'),(235,'DS1-KH','8930001001343','USB32','USB 32GB',3,149000.00,2,149000.00,0,149000.00,12,149000.00,'2017-11-03 23:42:13'),(236,'DS1-KH','8930001001015','A9','Bluetooth speaker  A9',0,0.00,1,209000.00,0,209000.00,1,209000.00,'2017-11-03 23:42:13'),(237,'DS1-KH','8930001001022','A10','Bluetooth speaker  A10',0,0.00,1,189000.00,0,189000.00,4,189000.00,'2017-11-03 23:42:13'),(238,'DS1-KH','8930001001039','SMARTBOX','Smart box mini',0,0.00,1,85000.00,0,85000.00,1,85000.00,'2017-11-03 23:42:13'),(239,'DS1-KG','8930001001053','Q8','Bluetooth speaker HF-Q8',0,0.00,0,0.00,1,179000.00,0,179000.00,'2017-11-07 08:47:29'),(240,'DS1-KH','8930001001053','Q8','Bluetooth speaker HF-Q8',1,179000.00,1,179000.00,0,179000.00,6,179000.00,'2017-11-08 08:38:52'),(241,'DS1-KG','8930001001022','A10','Bluetooth speaker  A10',0,0.00,0,0.00,3,189000.00,0,189000.00,'2017-11-30 20:43:27'),(242,'DS1-KG','8930001001053','Q8','Bluetooth speaker HF-Q8',0,0.00,0,0.00,4,179000.00,0,179000.00,'2017-11-30 20:43:27'),(243,'DS1-KG','8930001001343','USB32','USB 32GB',0,0.00,0,0.00,3,149000.00,0,149000.00,'2017-11-30 20:43:27'),(244,'DS1-KH','8930001001022','A10','Bluetooth speaker  A10',0,0.00,3,189000.00,0,189000.00,4,189000.00,'2017-11-30 20:44:48'),(245,'DS1-KH','8930001001053','Q8','Bluetooth speaker HF-Q8',1,179000.00,4,179000.00,0,179000.00,6,179000.00,'2017-11-30 20:44:48'),(246,'DS1-KH','8930001001343','USB32','USB 32GB',3,149000.00,3,149000.00,0,149000.00,12,149000.00,'2017-11-30 20:44:48'),(247,'DS1-KG','8930001001022','A10','Bluetooth speaker  A10',0,0.00,0,0.00,4,189000.00,0,189000.00,'2017-11-30 20:54:55'),(248,'DS1-KG','8930001001015','A9','Bluetooth speaker  A9',0,0.00,0,0.00,5,209000.00,0,209000.00,'2017-11-30 20:54:55'),(249,'DS1-KG','8930001001053','Q8','Bluetooth speaker HF-Q8',0,0.00,0,0.00,5,179000.00,0,179000.00,'2017-11-30 20:54:55'),(250,'DS1-KG','8930001001039','SMARTBOX','Smart box mini',0,0.00,0,0.00,20,85000.00,0,85000.00,'2017-11-30 20:54:55'),(251,'DS1-KG','8930001001343','USB32','USB 32GB',0,0.00,0,0.00,5,149000.00,0,149000.00,'2017-11-30 20:54:55'),(252,'DS1-TK','8930001001022','A10','Bluetooth speaker  A10',8,189000.00,4,189000.00,0,189000.00,4,189000.00,'2017-11-30 20:55:18'),(253,'DS1-TK','8930001001015','A9','Bluetooth speaker  A9',6,209000.00,5,209000.00,0,209000.00,5,209000.00,'2017-11-30 20:55:18'),(254,'DS1-TK','8930001001053','Q8','Bluetooth speaker HF-Q8',19,179000.00,5,179000.00,0,179000.00,14,179000.00,'2017-11-30 20:55:18'),(255,'DS1-TK','8930001001039','SMARTBOX','Smart box mini',21,85000.00,20,85000.00,0,85000.00,20,85000.00,'2017-11-30 20:55:18'),(256,'DS1-TK','8930001001343','USB32','USB 32GB',13,149000.00,5,149000.00,0,149000.00,4,149000.00,'2017-11-30 20:55:18'),(257,'DS1-KG','8930001001336','USB16','USB 16GB',0,0.00,0,0.00,10,129000.00,0,129000.00,'2017-11-30 20:59:14'),(258,'DS1-TK','8930001001336','USB16','USB 16GB',23,129000.00,10,129000.00,0,129000.00,23,129000.00,'2017-11-30 20:59:34'),(259,'DS1-KM','8930001001282','CAPDU','Cable for iPhone 5/6 & Ipad mini',486,55000.00,0,0.00,12,55000.00,471,55000.00,'2017-11-30 21:05:06'),(260,'DS1-KH','8930001001282','CAPDU','Cable for iPhone 5/6 & Ipad mini',0,0.00,12,55000.00,0,55000.00,13,55000.00,'2017-11-30 21:05:29'),(261,'DS1-TK','8930001001343','USB32','USB 32GB',13,149000.00,0,0.00,4,149000.00,4,149000.00,'2017-11-30 21:13:42'),(262,'DS1-KH','8930001001343','USB32','USB 32GB',3,149000.00,4,149000.00,0,149000.00,12,149000.00,'2017-11-30 21:15:05'),(263,'DS1-KM','8930001001282','CAPDU','Cable for iPhone 5/6 & Ipad mini',486,55000.00,0,0.00,1,55000.00,471,55000.00,'2017-11-30 21:17:43'),(264,'DS1-KH','8930001001282','CAPDU','Cable for iPhone 5/6 & Ipad mini',0,0.00,1,55000.00,0,55000.00,13,55000.00,'2017-11-30 21:18:01'),(265,'DS1-KM','8930001002814','HBQI7','Wireless music earphone V4.1+ EDR',22,0.00,0,0.00,1,0.00,18,0.00,'2017-11-30 21:34:18'),(266,'DS1-KM','8930001002937','USBKT16','USB KINGSTON - 16GB		',15,0.00,0,0.00,8,0.00,7,0.00,'2017-11-30 21:34:18'),(267,'DS1-KM','8930001002920','USBKT8','USB KINGSTON - 8GB',25,0.00,0,0.00,8,0.00,17,0.00,'2017-11-30 21:34:18'),(268,'DS1-KM','8930001002890','QUTE','QUTE wireless speaker',1,0.00,0,0.00,1,0.00,0,0.00,'2017-11-30 21:34:18'),(269,'DS1-KM','8930001002913','USBVIO8','USB VAIO SONY - 8GB',10,0.00,0,0.00,8,0.00,2,0.00,'2017-11-30 21:34:18'),(270,'DS1-KM','8930001002821','WLINEAR','wireless metal in-ear stereo',30,0.00,0,0.00,9,0.00,14,0.00,'2017-11-30 21:34:18'),(271,'DS1-KM','8930001002869','S-13','BT speaker S-13',10,0.00,0,0.00,1,0.00,9,0.00,'2017-11-30 21:34:18'),(272,'DS1-KM','8930001002876','175','mini audio 175',10,0.00,0,0.00,2,0.00,4,0.00,'2017-11-30 21:34:18'),(273,'DS1-KM','8930001002852','YZ-18','wireless music YZ-18',10,0.00,0,0.00,2,0.00,6,0.00,'2017-11-30 21:34:18'),(274,'DS1-KM','8930001002807','I7 TWS','twin true wireless earbuds V4.2 + DER',4,0.00,0,0.00,2,0.00,1,0.00,'2017-11-30 21:34:18'),(275,'DS1-QT','8930001002814','HBQI7','Wireless music earphone V4.1+ EDR',0,0.00,1,0.00,0,0.00,4,0.00,'2017-11-30 21:36:14'),(276,'DS1-QT','8930001002937','USBKT16','USB KINGSTON - 16GB		',0,0.00,8,0.00,0,0.00,8,0.00,'2017-11-30 21:36:14'),(277,'DS1-QT','8930001002920','USBKT8','USB KINGSTON - 8GB',0,0.00,8,0.00,0,0.00,8,0.00,'2017-11-30 21:36:14'),(278,'DS1-QT','8930001002890','QUTE','QUTE wireless speaker',0,0.00,1,0.00,0,0.00,1,0.00,'2017-11-30 21:36:14'),(279,'DS1-QT','8930001002913','USBVIO8','USB VAIO SONY - 8GB',0,0.00,8,0.00,0,0.00,8,0.00,'2017-11-30 21:36:14'),(280,'DS1-QT','8930001002821','WLINEAR','wireless metal in-ear stereo',0,0.00,11,0.00,0,0.00,18,0.00,'2017-11-30 21:36:14'),(281,'DS1-QT','8930001002869','S-13','BT speaker S-13',0,0.00,9,0.00,0,0.00,9,0.00,'2017-11-30 21:36:14'),(282,'DS1-QT','8930001002876','175','mini audio 175',0,0.00,2,0.00,0,0.00,6,0.00,'2017-11-30 21:36:14'),(283,'DS1-QT','8930001002852','YZ-18','wireless music YZ-18',0,0.00,2,0.00,0,0.00,4,0.00,'2017-11-30 21:36:14'),(284,'DS1-QT','8930001002807','I7 TWS','twin true wireless earbuds V4.2 + DER',0,0.00,2,0.00,0,0.00,3,0.00,'2017-11-30 21:36:14'),(285,'DS1-KM','8930001002876','175','mini audio 175',10,0.00,0,0.00,1,0.00,4,0.00,'2017-11-30 21:42:43'),(286,'DS1-KM','8930001002845','WS-187','mini speaker WS-187',10,0.00,0,0.00,2,0.00,7,0.00,'2017-11-30 21:42:43'),(287,'DS1-KM','8930001002821','WLINEAR','wireless metal in-ear stereo',30,0.00,0,0.00,5,0.00,14,0.00,'2017-11-30 21:42:43'),(288,'DS1-QT','8930001002876','175','mini audio 175',0,0.00,1,0.00,0,0.00,6,0.00,'2017-11-30 21:43:02'),(289,'DS1-QT','8930001002845','WS-187','mini speaker WS-187',0,0.00,2,0.00,0,0.00,3,0.00,'2017-11-30 21:43:02'),(290,'DS1-QT','8930001002821','WLINEAR','wireless metal in-ear stereo',0,0.00,5,0.00,0,0.00,18,0.00,'2017-11-30 21:43:02'),(291,'DS1-KM','8930001002876','175','mini audio 175',10,0.00,0,0.00,1,0.00,4,0.00,'2017-11-30 21:46:31'),(292,'DS1-QT','8930001002876','175','mini audio 175',0,0.00,1,0.00,0,0.00,6,0.00,'2017-11-30 21:46:51'),(293,'DS1-KM','8930001001282','CAPDU','Cable for iPhone 5/6 & Ipad mini',486,55000.00,0,0.00,1,55000.00,471,55000.00,'2017-11-30 21:48:51'),(294,'DS1-QT','8930001001282','CAPDU','Cable for iPhone 5/6 & Ipad mini',1,55000.00,1,0.00,0,36666.67,3,36666.67,'2017-11-30 21:49:21'),(295,'DS1-TK','8930001002043','KHUNG13','Photo frames (13×18cm)',2,99000.00,0,0.00,1,99000.00,1,99000.00,'2017-11-30 21:54:30'),(296,'DS1-SK','8930001002043','KHUNG13','Photo frames (13×18cm)',0,0.00,1,99000.00,0,99000.00,1,99000.00,'2017-11-30 21:54:45'),(297,'DS1-KM','8930001001657','NTR','Round candle',16,35000.00,0,0.00,1,35000.00,15,35000.00,'2017-11-30 21:57:22'),(298,'DS1-SK','8930001001657','NTR','Round candle',0,0.00,1,35000.00,0,35000.00,1,35000.00,'2017-11-30 21:57:37'),(299,'DS1-KM','8930001002821','WLINEAR','wireless metal in-ear stereo',30,0.00,0,0.00,2,0.00,14,0.00,'2017-11-30 00:40:05'),(300,'DS1-KM','8930001002852','YZ-18','wireless music YZ-18',10,0.00,0,0.00,2,0.00,6,0.00,'2017-11-30 00:40:05'),(301,'DS1-KM','8930001002845','WS-187','mini speaker WS-187',10,0.00,0,0.00,1,0.00,7,0.00,'2017-11-30 00:40:05'),(302,'DS1-KM','8930001002876','175','mini audio 175',10,0.00,0,0.00,2,0.00,4,0.00,'2017-11-30 00:40:05'),(303,'DS1-KM','8930001002814','HBQI7','Wireless music earphone V4.1+ EDR',22,0.00,0,0.00,3,0.00,18,0.00,'2017-11-30 00:40:05'),(304,'DS1-KM','8930001002807','I7 TWS','twin true wireless earbuds V4.2 + DER',4,0.00,0,0.00,1,0.00,1,0.00,'2017-11-30 00:40:05'),(305,'DS1-KM','8930001002838','A2DP','Music wireless speaker',3,0.00,0,0.00,3,0.00,0,0.00,'2017-11-30 00:40:05'),(306,'DS1-KM','8930001001282','CAPDU','Cable for iPhone 5/6 & Ipad mini',486,55000.00,0,0.00,1,55000.00,471,55000.00,'2017-11-30 00:40:05'),(307,'DS1-QT','8930001002821','WLINEAR','wireless metal in-ear stereo',0,0.00,2,0.00,0,0.00,18,0.00,'2017-11-30 00:42:37'),(308,'DS1-QT','8930001002852','YZ-18','wireless music YZ-18',0,0.00,2,0.00,0,0.00,4,0.00,'2017-11-30 00:42:37'),(309,'DS1-QT','8930001002845','WS-187','mini speaker WS-187',0,0.00,1,0.00,0,0.00,3,0.00,'2017-11-30 00:42:37'),(310,'DS1-QT','8930001002876','175','mini audio 175',0,0.00,2,0.00,0,0.00,6,0.00,'2017-11-30 00:42:37'),(311,'DS1-QT','8930001002814','HBQI7','Wireless music earphone V4.1+ EDR',0,0.00,3,0.00,0,0.00,4,0.00,'2017-11-30 00:42:37'),(312,'DS1-QT','8930001002807','I7 TWS','twin true wireless earbuds V4.2 + DER',0,0.00,1,0.00,0,0.00,3,0.00,'2017-11-30 00:42:37'),(313,'DS1-QT','8930001002838','A2DP','Music wireless speaker',0,0.00,3,0.00,0,0.00,3,0.00,'2017-11-30 00:42:37'),(314,'DS1-QT','8930001001282','CAPDU','Cable for iPhone 5/6 & Ipad mini',1,55000.00,1,55000.00,0,36666.67,3,36666.67,'2017-11-30 00:42:37'),(315,'DS1-QT','8930001002876','175','mini audio 175',6,0.00,0,0.00,1,0.00,0,0.00,'2017-12-01 14:28:01'),(316,'DS1-KM','8930001002876','175','mini audio 175',4,0.00,1,0.00,0,0.00,0,0.00,'2017-12-01 14:29:12'),(317,'DS1-TK','8930001001343','USB32','USB 32GB',4,149000.00,0,0.00,1,149000.00,0,0.00,'2017-12-02 09:53:21'),(318,'DS1-KH','8930001001343','USB32','USB 32GB',12,149000.00,1,149000.00,0,0.00,0,0.00,'2017-12-02 09:53:35'),(319,'DS1-TK','8930001001343','USB32','USB 32GB',4,149000.00,0,0.00,1,149000.00,0,0.00,'2017-12-14 09:25:07'),(320,'DS1-KH','8930001001343','USB32','USB 32GB',12,149000.00,1,149000.00,0,0.00,0,0.00,'2017-12-14 09:25:40');
/*!40000 ALTER TABLE `tb_inventory_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_inventory_report_history`
--

DROP TABLE IF EXISTS `tb_inventory_report_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_inventory_report_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(245) DEFAULT NULL,
  `beginning_date` datetime DEFAULT NULL,
  `ending_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_inventory_report_history`
--

LOCK TABLES `tb_inventory_report_history` WRITE;
/*!40000 ALTER TABLE `tb_inventory_report_history` DISABLE KEYS */;
INSERT INTO `tb_inventory_report_history` VALUES (1,'Chốt Kỳ Tháng 1','2017-01-01 00:00:00','2017-01-31 00:00:00'),(9,'Chốt Kỳ Tháng 2','2017-02-01 00:00:00','2017-02-28 00:00:00'),(10,'Chốt Kỳ Tháng 3','2017-03-01 00:00:00','2017-03-31 00:00:00'),(11,'Chốt Kỳ Tháng 4','2017-04-01 00:00:00','2017-04-30 00:00:00'),(12,'Chốt Kỳ Tháng 5','2017-05-01 00:00:00','2017-05-31 00:00:00'),(13,'Chốt Kỳ Tháng 6','2017-06-01 00:00:00','2017-06-30 00:00:00'),(14,'Chốt Kỳ Tháng 7','2017-07-01 00:00:00','2017-07-31 00:00:00'),(25,'Chốt Kỳ Tháng 8','2017-08-01 00:00:00','2017-08-31 00:00:00'),(26,'Chốt Kỳ Tháng 9','2017-09-01 00:00:00','2017-09-30 00:00:00'),(27,'Chốt Kỳ Tháng 10','2017-10-01 00:00:00','2017-10-31 00:00:00'),(28,'Chốt kỳ Tháng 11','2017-11-01 00:00:00','2017-11-30 00:00:00');
/*!40000 ALTER TABLE `tb_inventory_report_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_location`
--

DROP TABLE IF EXISTS `tb_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_location` (
  `id` varchar(20) NOT NULL,
  `LocationName` varchar(45) DEFAULT NULL,
  `Description` varchar(45) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_location`
--

LOCK TABLES `tb_location` WRITE;
/*!40000 ALTER TABLE `tb_location` DISABLE KEYS */;
INSERT INTO `tb_location` VALUES ('LOCA-001','location 1','location 1',1),('LOCA-002','location 2','location 2',0),('LOCA-003','location 3','location 3',1);
/*!40000 ALTER TABLE `tb_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_logical_warehouse`
--

DROP TABLE IF EXISTS `tb_logical_warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_logical_warehouse` (
  `id` char(6) NOT NULL,
  `name` varchar(145) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '0',
  `physical_warehouse` char(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_logical_warehouse`
--

LOCK TABLES `tb_logical_warehouse` WRITE;
/*!40000 ALTER TABLE `tb_logical_warehouse` DISABLE KEYS */;
INSERT INTO `tb_logical_warehouse` VALUES ('DS1-HQ','Đầm Sen- Hải Quan',1,'DS1'),('DS1-KG','dam sen ky gui',1,'DS1'),('DS1-KH','Kho bán khách hàng',1,'DS1'),('DS1-KM','Dam sen khuyen mai',1,'DS1'),('DS1-QT','Kho quà tặng',1,'DS1'),('DS1-SK','Kho Sự Kiện DS',1,'DS1'),('DS1-TK','Dam Sen Tong Kho',1,'DS1'),('ST1-KK','Kho tặng khách STC',1,'ST1'),('ST1-TA','Kho Vinhsang tạm',1,'ST1'),('ST1-TK','Kho Vinh Sang',1,'ST1'),('SZ1-KG','ShenZhen ky gui',1,'SZ1'),('SZ1-KM','ShenZhen Khuyen Mai',1,'SZ1'),('XM1-TK','Xaomi',1,'XM1');
/*!40000 ALTER TABLE `tb_logical_warehouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_physicalware_house`
--

DROP TABLE IF EXISTS `tb_physicalware_house`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_physicalware_house` (
  `id` char(3) NOT NULL,
  `WarehouseName` varchar(145) DEFAULT NULL,
  `Description` varchar(245) DEFAULT NULL,
  `Address` varchar(245) DEFAULT NULL,
  `Area` varchar(245) DEFAULT NULL,
  `Manager` varchar(50) DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `UpdateDate` datetime DEFAULT NULL,
  `CreateUser` varchar(45) DEFAULT NULL,
  `UpdateUser` varchar(45) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_physicalware_house`
--

LOCK TABLES `tb_physicalware_house` WRITE;
/*!40000 ALTER TABLE `tb_physicalware_house` DISABLE KEYS */;
INSERT INTO `tb_physicalware_house` VALUES ('DS1','DAMSEN NAME','DAMSEN NAME in viet nam','56 a hoa binh','HCM','u1@gmail.com','2017-01-01 00:00:00','2017-01-01 00:00:00','u1@gmail.com','u1@gmail.com',1),('ST1','STC','SaiGon Trade Center viet  nam','1000 binh tan','HCM','u1@gmail.com','2017-01-01 00:00:00','2017-01-01 00:00:00','u1@gmail.com','u1@gmail.com',0),('SZ1','ShenZhen','ShenZhen China','101 tan phu','HCM','u1@gmail.com','2017-01-01 00:00:00','2017-01-01 00:00:00','u1@gmail.com','u1@gmail.com',1),('XM1','Xaomi','Xaomi','China','China','u1@gmail.com','2017-01-01 00:00:00','2017-01-01 00:00:00','u1@gmail.com','u1@gmail.com',1);
/*!40000 ALTER TABLE `tb_physicalware_house` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_product`
--

DROP TABLE IF EXISTS `tb_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_product` (
  `id` varchar(13) NOT NULL COMMENT 'barcode genarator',
  `ProductName` varchar(245) DEFAULT NULL,
  `ProductDes` text,
  `ProductGuide` text,
  `FeatureImage` varchar(245) DEFAULT NULL,
  `Unit` int(3) DEFAULT NULL,
  `BigUnit` int(3) DEFAULT NULL,
  `CostPrice` decimal(11,2) DEFAULT NULL,
  `SellPrice` decimal(11,2) DEFAULT NULL,
  `SellPrice1` decimal(11,2) DEFAULT NULL,
  `SellPrice2` decimal(11,2) DEFAULT NULL,
  `SupplierId` varchar(20) DEFAULT NULL,
  `CategoryId` varchar(3) DEFAULT NULL,
  `CategoryAnalyseId` varchar(13) DEFAULT NULL,
  `BusinessType` int(3) DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `UpdateDate` datetime DEFAULT NULL,
  `CreateUser` varchar(45) DEFAULT NULL,
  `UpdateUser` varchar(45) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '0',
  `ProductCode` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ProductCode_UNIQUE` (`ProductCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_product`
--

LOCK TABLES `tb_product` WRITE;
/*!40000 ALTER TABLE `tb_product` DISABLE KEYS */;
INSERT INTO `tb_product` VALUES ('8930001000704','Pestle and mortar','','','2017-06-20_Pestle and mortar.png',4,99,0.00,89000.00,0.00,0.00,'sup013','051','0000000000000',2,'2017-06-20 10:11:57','2017-07-28 12:10:13','u1@gmail.com','u1@gmail.com',1,'CVC'),('8930001000711','Chopsticks type 1','','','2017-06-20_Chopsticks type 1.png',4,99,0.00,39000.00,0.00,0.00,'sup013','051','0000000000000',2,'2017-06-20 10:14:43','2017-07-28 12:11:23','u1@gmail.com','u1@gmail.com',1,'DUA1'),('8930001000728','Chopsticks type 2','','','2017-06-20_Chopsticks type 1.png',4,99,0.00,29000.00,0.00,0.00,'sup013','051','0000000000000',2,'2017-06-20 10:16:15','2017-07-28 12:10:52','u1@gmail.com','u1@gmail.com',1,'DUA2'),('8930001000735','Jar of tea','','','2017-06-20_Jar of tea.png',6,99,0.00,50000.00,0.00,0.00,'sup013','051','0000000000000',2,'2017-06-20 10:17:07','2017-07-28 12:11:50','u1@gmail.com','u1@gmail.com',1,'HUMUT'),('8930001000742','Small Dish ','','','2017-06-20_Small Dish.png',6,99,0.00,45000.00,0.00,0.00,'sup013','051','0000000000000',2,'2017-06-20 10:19:12','2017-07-28 12:13:10','u1@gmail.com','u1@gmail.com',1,'DN'),('8930001000766','Pen box','','','2017-06-20_Pen box.png',6,99,0.00,49000.00,0.00,0.00,'sup013','051','0000000000000',2,'2017-06-20 11:30:56','2017-07-28 12:17:42','u1@gmail.com','u1@gmail.com',1,'HOPVIET'),('8930001000797','Small bowl ','','','2017-06-20_Small bowl.png',6,99,0.00,29000.00,0.00,0.00,'sup013','051','0000000000000',2,'2017-06-20 11:41:43','2017-08-02 11:55:15','u1@gmail.com','u1@gmail.com',1,'C001'),('8930001000810','Big Dish','','','2017-06-20_Big Dish.png',6,99,0.00,55000.00,0.00,0.00,'sup013','051','0000000000000',2,'2017-06-20 12:12:50','2017-07-28 12:12:32','u1@gmail.com','u1@gmail.com',1,'DL'),('8930001000827','Coasters','','','2017-06-20_Coasters.png',4,99,0.00,55000.00,0.00,0.00,'sup013','051','0000000000000',2,'2017-06-20 12:19:21','2017-07-28 12:17:12','u1@gmail.com','u1@gmail.com',1,'LOTLY'),('8930001000834','Keychains','','','2017-06-20_Keychains.png',6,99,0.00,10000.00,0.00,0.00,'sup013','051','0000000000000',2,'2017-06-20 12:35:01','2017-07-28 12:18:24','u1@gmail.com','u1@gmail.com',1,'MOCDUA'),('8930001000841','4 tablespoons kits','','','2017-06-20_4 tablespoons kits.png',6,99,0.00,49000.00,0.00,0.00,'sup013','051','0000000000000',2,'2017-06-20 12:41:22','2017-07-28 12:13:39','u1@gmail.com','u1@gmail.com',1,'B4M'),('8930001000858','Name card box','','','2017-06-20_Name card box.png',6,99,0.00,35000.00,0.00,0.00,'sup013','051','0000000000000',2,'2017-06-20 12:44:52','2017-07-28 12:21:17','u1@gmail.com','u1@gmail.com',1,'CARD'),('8930001000865','Toothpick jar 1','','','2017-06-20_Toothpick jar 1.png',6,99,0.00,35000.00,0.00,0.00,'sup013','051','0000000000000',2,'2017-06-20 12:48:05','2017-07-28 12:20:06','u1@gmail.com','u1@gmail.com',1,'TAMCA'),('8930001000872','Toothpick jar 2','','','2017-06-20_Toothpick jar 2.png',6,99,0.00,40000.00,0.00,0.00,'sup013','051','0000000000000',2,'2017-06-20 12:51:11','2017-07-28 12:20:37','u1@gmail.com','u1@gmail.com',1,'TAMTHU'),('8930001000896','Bowl','','','2017-06-20_Bowl.png',6,99,0.00,99000.00,0.00,0.00,'sup013','051','0000000000000',2,'2017-06-20 12:54:47','2017-07-28 12:14:11','u1@gmail.com','u1@gmail.com',1,'TO'),('8930001000902','Water Dipper ','','','2017-06-20_Water Dipper.png',6,99,0.00,10000.00,0.00,0.00,'sup013','051','0000000000000',2,'2017-06-20 14:11:41','2017-07-28 12:15:51','u1@gmail.com','u1@gmail.com',1,'GD'),('8930001000919','Comb hair','','','2017-06-20_Comb hair.png',6,99,0.00,35000.00,0.00,0.00,'sup013','051','0000000000000',2,'2017-06-20 14:24:10','2017-07-28 12:16:22','u1@gmail.com','u1@gmail.com',1,'LU'),('8930001000926','Wristlet 17*10cm','','','2017-06-20_Wristlet 17 x 10 cm.png',6,99,0.00,60000.00,0.00,0.00,'sup013','051','0000000000000',2,'2017-06-20 14:31:46','2017-07-28 12:21:51','u1@gmail.com','u1@gmail.com',1,'VITAY'),('8930001000933','Small sling bag 17*13cm','','','2017-06-20_Small sling bag 17 x 13cm.png',6,99,0.00,90000.00,0.00,0.00,'sup013','051','0000000000000',2,'2017-06-20 14:35:03','2017-07-28 12:22:48','u1@gmail.com','u1@gmail.com',1,'TUINHO'),('8930001000940','Thai sling bag 22*24cm','','','2017-06-20_Thai sling bag 22 x 24cm.png',6,99,0.00,120000.00,0.00,0.00,'sup013','051','0000000000000',2,'2017-06-20 14:38:06','2017-07-28 12:23:22','u1@gmail.com','u1@gmail.com',1,'TUITHAI'),('8930001000957','Big sling bag 22*13cm','','','2017-06-20_Big sling bag 22 x 13cm.png',6,99,0.00,110000.00,0.00,0.00,'sup013','051','0000000000000',2,'2017-06-20 14:43:03','2017-07-28 12:23:58','u1@gmail.com','u1@gmail.com',1,'TUILON'),('8930001000988','Coconut mask','','','2017-06-20_Coconut mask.png',7,3,0.00,120000.00,0.00,0.00,'sup008','053','0000000000000',1,'2017-06-20 15:23:22','2017-07-28 15:13:15','u1@gmail.com','u1@gmail.com',1,'MATNA'),('8930001000995','Dancing water speakers FM08','','','2017-06-22_Dancing water speakers FM08.png',8,99,0.00,295000.00,0.00,0.00,'sup015','000','0000000000000',1,'2017-06-22 16:09:26','2017-08-10 12:09:46','u1@gmail.com','u1@gmail.com',1,'FM08'),('8930001001008','Music box + power bank C79','','','2017-06-22_Music box + power bank C79.png',6,99,0.00,339000.00,0.00,0.00,'sup015','000','0000000000000',2,'2017-06-22 16:11:21','2017-07-28 11:12:28','u1@gmail.com','u1@gmail.com',1,'C79'),('8930001001015','Bluetooth speaker  A9','','','2017-06-22_Bluetooth speaker  A9.png',6,99,0.00,209000.00,0.00,0.00,'sup017','000','0000000000000',2,'2017-06-22 16:12:47','2017-08-04 16:47:35','u1@gmail.com','u1@gmail.com',1,'A9'),('8930001001022','Bluetooth speaker  A10','','','2017-06-22_Bluetooth speaker  A10.png',6,99,0.00,189000.00,0.00,0.00,'sup017','000','0000000000000',2,'2017-06-22 16:13:42','2017-08-04 16:46:40','u1@gmail.com','u1@gmail.com',1,'A10'),('8930001001039','Smart box mini','','','2017-06-22_Loa bluetooth mini smart box.png',6,3,0.00,85000.00,0.00,0.00,'sup017','000','0000000000000',2,'2017-06-22 16:15:05','2017-08-04 16:44:26','u1@gmail.com','u1@gmail.com',1,'SMARTBOX'),('8930001001046','Best core Magic boost portable speakers','','','2017-06-22_Best core Magic boost portable speakers.png',6,99,421000.00,484000.00,0.00,0.00,'sup004','000','0000000000000',2,'2017-06-22 16:15:56','2017-07-28 11:59:39','u1@gmail.com','u1@gmail.com',1,'CH'),('8930001001053','Bluetooth speaker HF-Q8','','','2017-06-22_Bluetooth speaker HF-Q8.png',6,3,0.00,179000.00,0.00,0.00,'sup015','000','0000000000000',1,'2017-06-22 16:18:58','2017-08-08 17:07:02','u1@gmail.com','u1@gmail.com',1,'Q8'),('8930001001060','Bluetooth speaker - Pulse XL','','','2017-06-22_Bluetooth speaker - Pulse XL.png',6,99,0.00,1299000.00,0.00,0.00,'sup017','000','0000000000000',2,'2017-06-22 16:21:11','2017-08-04 16:42:20','u1@gmail.com','u1@gmail.com',1,'GREAT'),('8930001001183','Smart watch T3','','','2017-06-26_Smart watch T3.png',6,3,490000.00,550000.00,0.00,0.00,'sup004','001','0000000000000',1,'2017-06-26 11:15:02','2017-08-08 17:06:42','u1@gmail.com','u1@gmail.com',1,'T3'),('8930001001190','USB Led light','','','2017-06-26_USB Led light.png',6,99,0.00,229000.00,0.00,0.00,'sup015','002','0000000000000',1,'2017-06-26 11:19:05','2017-08-08 17:06:08','u1@gmail.com','u1@gmail.com',1,'LED7'),('8930001001206','Bluetooth music bulb WJ-L2','','','2017-06-26_Bluetooth music bulb WJ-L2.png',4,99,479000.00,539000.00,0.00,0.00,'sup004','002','0000000000000',1,'2017-06-26 11:20:12','2017-08-08 17:05:52','u1@gmail.com','u1@gmail.com',1,'WJL2'),('8930001001213','Led electric mosquito catcher','','','2017-06-26_Led electric mosquito catcher.png',6,99,263000.00,308000.00,0.00,0.00,'sup004','002','0000000000000',1,'2017-06-26 11:38:40','2017-08-08 17:05:31','u1@gmail.com','u1@gmail.com',1,'LEDM'),('8930001001220','Xiaomi YI IP Camera Wireless Wifi HD 720P-Night Edition','','','2017-06-26_Xiaomi YI IP Camera Wireless Wifi HD 720P-Night Edition.png',6,3,783000.00,880000.00,0.00,0.00,'sup004','003','0000000000000',1,'2017-06-26 11:41:43','2017-08-08 17:05:11','u1@gmail.com','u1@gmail.com',1,'YI'),('8930001001251','Bluetooth microphone YS-10','','','2017-06-26_Bluetooth microphone YS-10.png',6,99,838000.00,946000.00,0.00,0.00,'sup004','005','0000000000000',1,'2017-06-26 14:27:37','2017-08-08 17:04:39','u1@gmail.com','u1@gmail.com',1,'MIC'),('8930001001268','Charger Pisen 12W  1A-2.4A','','','2017-06-26_Charger Pisen 12W  1A-2.4A.png',6,99,0.00,150000.00,0.00,0.00,'sup017','050','0000000000000',2,'2017-06-26 14:30:39','2017-08-09 15:45:59','u1@gmail.com','u1@gmail.com',1,'COCPISEN'),('8930001001275','Car holder','','','2017-06-26_Universal car holder.png',6,99,169000.00,209000.00,0.00,0.00,'sup015','050','0000000000000',1,'2017-06-26 14:31:59','2017-08-08 17:04:09','u1@gmail.com','u1@gmail.com',1,'KIPAD'),('8930001001282','Cable for iPhone 5/6 & Ipad mini','','','2017-06-26_Cable for iPhone.png',6,99,0.00,55000.00,0.00,0.00,'sup015','050','0000000000000',1,'2017-06-26 14:34:04','2017-08-08 17:03:35','u1@gmail.com','u1@gmail.com',1,'CAPDU'),('8930001001299','Insole grip for phone','','','2017-06-26_Insole grip for phone.png',6,99,0.00,35000.00,0.00,0.00,'sup017','050','0000000000000',2,'2017-06-26 14:35:01','2017-08-04 16:40:57','u1@gmail.com','u1@gmail.com',1,'KDT'),('8930001001305','Xiaomi Piston Youth Colourful Edition earphones','','','2017-06-26_Xiaomi Piston Youth Colourful Edition earphones.png',6,99,202000.00,242000.00,0.00,0.00,'sup004','050','0000000000000',1,'2017-06-26 14:36:47','2017-08-08 17:02:59','u1@gmail.com','u1@gmail.com',1,'EAR'),('8930001001312','3 in 1 Power bank','','','2017-06-26_3 in 1 Power bank.png',6,3,0.00,180000.00,0.00,0.00,'sup015','050','0000000000000',1,'2017-06-26 14:37:57','2017-08-04 16:58:28','u1@gmail.com','u1@gmail.com',1,'PIN3IN1'),('8930001001329','Headphones','','','2017-06-26_Headphones.png',6,99,0.00,389000.00,0.00,0.00,'sup015','050','0000000000000',1,'2017-06-26 14:39:27','2017-08-04 16:57:49','u1@gmail.com','u1@gmail.com',1,'HPSD'),('8930001001336','USB 16GB','','','2017-06-26_USB 16GB.png',6,99,0.00,129000.00,0.00,0.00,'sup015','050','0000000000000',1,'2017-06-26 14:42:43','2017-08-04 16:57:10','u1@gmail.com','u1@gmail.com',1,'USB16'),('8930001001343','USB 32GB','','','2017-06-26_USB 16GB.png',6,99,0.00,149000.00,0.00,0.00,'sup015','050','0000000000000',1,'2017-06-26 14:43:55','2017-08-04 16:56:38','u1@gmail.com','u1@gmail.com',1,'USB32'),('8930001001367','Women Sunglasses ','','','2017-06-26_Women Sunglasses.png',6,99,0.00,0.00,0.00,0.00,'sup001','100','0000000000000',2,'2017-06-26 15:35:45','2017-06-26 15:35:45','u1@gmail.com','u1@gmail.com',1,'C6'),('8930001001374','Men Sunglasses ','','','2017-06-26_Men Sunglasses.png',6,99,0.00,0.00,0.00,0.00,'sup001','100','0000000000000',2,'2017-06-26 15:36:42','2017-06-26 15:36:42','u1@gmail.com','u1@gmail.com',1,'C7'),('8930001001381','USB cable','','','2017-06-26_USB cable.png',6,99,0.00,35000.00,0.00,0.00,'sup017','050','0000000000000',2,'2017-06-26 16:20:17','2017-08-04 16:38:16','u1@gmail.com','u1@gmail.com',1,'CUSB'),('8930001001398','Car charger','','','2017-06-26_Car charger.png',6,99,0.00,79000.00,0.00,0.00,'sup017','050','0000000000000',2,'2017-06-26 16:21:53','2017-08-04 16:37:44','u1@gmail.com','u1@gmail.com',1,'SOT'),('8930001001404','Backup charger ring','','','2017-06-26_Backup charger ring.png',6,99,0.00,67000.00,0.00,0.00,'sup017','050','0000000000000',2,'2017-06-26 16:24:04','2017-08-04 16:37:13','u1@gmail.com','u1@gmail.com',1,'CS'),('8930001001435','Air purifier','','','2017-07-03_Air purifier.1.png',6,99,0.00,549000.00,0.00,0.00,'sup015','006','0000000000000',1,'2017-07-03 12:26:27','2017-08-04 16:55:40','u1@gmail.com','u1@gmail.com',1,'KQ06'),('8930001001442','VR box 3D glasses','','','2017-07-03_VR box 3D glasses...png',6,99,219000.00,264000.00,0.00,0.00,'sup004','004','0000000000000',1,'2017-07-03 12:32:45','2017-08-04 16:54:51','u1@gmail.com','u1@gmail.com',1,'VRBOX'),('8930001001480','Light LED motorbike (circle)','','','2017-07-03_Light LED motorbike (circle).png',6,99,0.00,110000.00,0.00,0.00,'sup017','050','0000000000000',2,'2017-07-03 12:47:53','2017-08-04 16:35:26','u1@gmail.com','u1@gmail.com',1,'LED2'),('8930001001497','Ceiling led light','','','2017-07-03_Ceiling led light.png',6,99,0.00,135000.00,0.00,0.00,'sup017','050','0000000000000',2,'2017-07-03 12:50:22','2017-08-04 16:48:26','u1@gmail.com','u1@gmail.com',1,'LTRAN'),('8930001001503','Micro SINGPLAY','','','2017-07-03_Micro SINGPLAY.png',6,99,0.00,289000.00,0.00,0.00,'sup004','005','0000000000000',1,'2017-07-03 13:17:42','2017-08-08 17:02:26','u1@gmail.com','u1@gmail.com',1,'SINPLAY'),('8930001001527','Mini fan air conditioning','','','2017-07-03_Mini fan air conditioning.png',6,99,0.00,115000.00,0.00,0.00,'sup017','201','0000000000000',2,'2017-07-03 13:26:43','2017-08-04 16:34:42','u1@gmail.com','u1@gmail.com',1,'QDH'),('8930001001558','led shoes','','','2017-07-03_Led shoes.png',8,99,0.00,0.00,0.00,0.00,'sup017','007','0000000000000',2,'2017-07-03 13:39:50','2017-08-10 12:09:23','u1@gmail.com','u1@gmail.com',1,'GIAY'),('8930001001602','Lotus light yellow ','','','2017-07-03_Gold Battery Buddha Music Speaker Light Flower.png',6,99,0.00,150000.00,0.00,0.00,'sup017','251','0000000000000',2,'2017-07-03 14:11:12','2017-08-04 16:07:06','u1@gmail.com','u1@gmail.com',1,'DS1'),('8930001001619','Lotus light pink','','','2017-07-03_Lotus Buddha Lamp (pink).png',6,99,0.00,150000.00,0.00,0.00,'sup017','251','0000000000000',2,'2017-07-03 14:17:30','2017-08-04 16:06:43','u1@gmail.com','u1@gmail.com',1,'DS2'),('8930001001626','Lotus light ','','','2017-07-03_12.jpg',6,99,0.00,150000.00,0.00,0.00,'sup017','251','0000000000000',2,'2017-07-03 14:22:11','2017-08-04 16:06:20','u1@gmail.com','u1@gmail.com',1,'DS3'),('8930001001640','Tall candle','','','2017-07-03_Tall candles.png',7,99,0.00,55000.00,0.00,0.00,'sup017','252','0000000000000',2,'2017-07-03 14:27:37','2017-08-04 16:06:00','u1@gmail.com','u1@gmail.com',1,'NLC'),('8930001001657','Round candle','','','2017-07-03_Round candles.png',7,99,0.00,35000.00,0.00,0.00,'sup017','252','0000000000000',2,'2017-07-03 14:28:59','2017-08-04 16:05:37','u1@gmail.com','u1@gmail.com',1,'NTR'),('8930001001664','Lotus candle','','','2017-07-03_Lotus candles.png',7,99,0.00,55000.00,0.00,0.00,'sup017','252','0000000000000',2,'2017-07-03 14:33:31','2017-08-04 16:05:12','u1@gmail.com','u1@gmail.com',1,'NHS'),('8930001001671','Motorcycle rearview mirror','','','2017-07-03_Motorcycle rearview mirror.png',6,99,0.00,69000.00,0.00,0.00,'sup017','050','0000000000000',2,'2017-07-03 14:36:32','2017-08-04 16:04:36','u1@gmail.com','u1@gmail.com',1,'KCH2'),('8930001001688','PCB board 10','','','2017-07-03_20.jpg',6,99,0.00,0.00,0.00,0.00,'sup017','050','0000000000000',2,'2017-07-03 14:40:20','2017-08-04 16:04:05','u1@gmail.com','u1@gmail.com',1,'BM10'),('8930001001695','PCB board 7','','','2017-07-03_18.jpg',6,99,0.00,0.00,0.00,0.00,'sup017','050','0000000000000',2,'2017-07-03 14:42:17','2017-08-04 16:03:45','u1@gmail.com','u1@gmail.com',1,'BM7'),('8930001001701','PCB board 9','','','2017-07-03_circuit board 9.jpg',6,99,0.00,0.00,0.00,0.00,'sup017','050','0000000000000',2,'2017-07-03 14:44:59','2017-08-04 15:02:55','u1@gmail.com','u1@gmail.com',1,'BM9'),('8930001001718','PCB board 8','','','2017-07-03_circuit board 8.jpg',6,99,0.00,0.00,0.00,0.00,'sup017','050','0000000000000',2,'2017-07-03 14:46:32','2017-08-04 15:02:11','u1@gmail.com','u1@gmail.com',1,'BM8'),('8930001001725','PCB board 3','','','2017-07-03_circuit board 3.jpg',6,99,0.00,0.00,0.00,0.00,'sup017','050','0000000000000',2,'2017-07-03 14:48:15','2017-08-04 15:01:47','u1@gmail.com','u1@gmail.com',1,'BM3'),('8930001001732','PCB board 4','','','2017-07-03_Circuit board 4.jpg',6,99,0.00,0.00,0.00,0.00,'sup017','050','0000000000000',2,'2017-07-03 14:50:05','2017-08-04 15:01:16','u1@gmail.com','u1@gmail.com',1,'BM4'),('8930001001749','PCB board 2','','','2017-07-03_circuit board 2.jpg',6,99,0.00,0.00,0.00,0.00,'sup017','050','0000000000000',2,'2017-07-03 14:51:49','2017-08-04 15:00:45','u1@gmail.com','u1@gmail.com',1,'BM2'),('8930001001756','PCB board 5','','','2017-07-03_circuit board 5.jpg',6,99,0.00,0.00,0.00,0.00,'sup017','050','0000000000000',2,'2017-07-03 14:53:09','2017-08-04 11:49:52','u1@gmail.com','u1@gmail.com',1,'BM5'),('8930001001763','PCB board 6','','','2017-07-03_circuit board 6.jpg',6,99,0.00,0.00,0.00,0.00,'sup017','050','0000000000000',2,'2017-07-03 14:54:29','2017-08-04 11:48:45','u1@gmail.com','u1@gmail.com',1,'BM6'),('8930001001770','PCB board 1','','','2017-07-03_circuit board 1.jpg',6,99,0.00,0.00,0.00,0.00,'sup017','050','0000000000000',2,'2017-07-03 14:58:12','2017-08-04 11:48:14','u1@gmail.com','u1@gmail.com',1,'BM1'),('8930001001787','Audio/video high grade cable','','','2017-07-03_jack.jpg',6,99,59000.00,0.00,0.00,0.00,'sup017','050','0000000000000',2,'2017-07-03 15:06:09','2017-09-07 15:42:18','u1@gmail.com','u1@gmail.com',1,'JACKAUDIO'),('8930001001824','Cable lightning PISEN','','','2017-07-03_Cable lightning PISEN.png',6,99,0.00,55000.00,0.00,0.00,'sup017','050','0000000000000',2,'2017-07-03 15:24:26','2017-08-04 11:47:09','u1@gmail.com','u1@gmail.com',1,'CAPISEN'),('8930001001961','Shell lamp','','','2017-07-03_Shell lamp.png',6,99,0.00,149000.00,0.00,0.00,'sup014','151','0000000000000',2,'2017-07-03 16:44:51','2017-07-28 15:08:43','u1@gmail.com','u1@gmail.com',1,'DENNGU'),('8930001001978','Tea set','','','2017-07-03_tea set.png',4,99,0.00,269000.00,0.00,0.00,'sup014','151','0000000000000',2,'2017-07-03 16:47:13','2017-07-28 15:11:51','u1@gmail.com','u1@gmail.com',1,'BOTRA'),('8930001001985','Seashell','','','2017-07-03_Seashell.png',6,99,0.00,39000.00,0.00,0.00,'sup014','152','0000000000000',2,'2017-07-03 16:51:19','2017-07-28 15:16:41','u1@gmail.com','u1@gmail.com',1,'GHE'),('8930001001992','Gerbera flower','','','2017-07-03_Gerbera flower...png',6,99,0.00,75000.00,0.00,0.00,'sup014','152','0000000000000',2,'2017-07-03 16:52:09','2017-07-28 15:07:27','u1@gmail.com','u1@gmail.com',1,'HDT'),('8930001002005','Orchid','','','2017-07-03_Orchid...png',6,99,0.00,59000.00,0.00,0.00,'sup014','152','0000000000000',2,'2017-07-03 16:53:11','2017-07-28 15:08:12','u1@gmail.com','u1@gmail.com',1,'HLAN'),('8930001002012','Keychains','','','2017-07-03_Keychains.png',6,99,0.00,10000.00,0.00,0.00,'sup014','152','0000000000000',2,'2017-07-03 16:54:51','2017-07-28 15:11:15','u1@gmail.com','u1@gmail.com',1,'MOCSO'),('8930001002036','Photo frames (10×15cm)','','','2017-08-03_Photo frames.png',6,99,0.00,89000.00,0.00,0.00,'sup014','152','0000000000000',2,'2017-07-03 16:58:44','2017-08-03 18:46:44','u1@gmail.com','u1@gmail.com',1,'KHUNG10'),('8930001002043','Photo frames (13×18cm)','','','2017-08-03_Photo frames.png',6,99,0.00,99000.00,0.00,0.00,'sup014','152','0000000000000',2,'2017-07-03 16:59:43','2017-08-03 18:45:14','u1@gmail.com','u1@gmail.com',1,'KHUNG13'),('8930001002050','Small sand jar','','','2017-07-03_Small sand jar.png',6,99,0.00,10000.00,0.00,0.00,'sup014','152','0000000000000',2,'2017-07-03 17:01:28','2017-07-28 15:10:42','u1@gmail.com','u1@gmail.com',1,'CATNHO'),('8930001002067','Big sand jar','','','2017-07-03_Big sand jar.png',6,99,0.00,19000.00,0.00,0.00,'sup014','152','0000000000000',2,'2017-07-03 17:02:54','2017-07-28 15:10:13','u1@gmail.com','u1@gmail.com',1,'CATLON'),('8930001002074','Coral','','','2017-07-03_Coral.png',6,99,0.00,45000.00,0.00,0.00,'sup014','152','0000000000000',2,'2017-07-03 17:04:56','2017-07-28 15:16:16','u1@gmail.com','u1@gmail.com',1,'SANHO'),('8930001002081','Small boat','','','2017-07-03_Small boat.png',6,99,0.00,35000.00,0.00,0.00,'sup014','152','0000000000000',2,'2017-07-03 17:07:09','2017-07-28 15:12:25','u1@gmail.com','u1@gmail.com',1,'THUYENNHO'),('8930001002098','Fish  9x20cm','','','2017-07-03_Fish  9x20cm.png',6,99,0.00,28000.00,0.00,0.00,'sup014','152','0000000000000',2,'2017-07-03 17:08:55','2017-07-28 15:09:21','u1@gmail.com','u1@gmail.com',1,'CADOI'),('8930001002111','Necklace','','','2017-07-03_Necklace.png',6,99,0.00,19000.00,0.00,0.00,'sup014','153','0000000000000',2,'2017-07-03 17:13:17','2017-07-28 15:15:52','u1@gmail.com','u1@gmail.com',1,'VONGCO'),('8930001002135','Hairpin comb','','','2017-07-03_Hairpin comb.png',6,99,0.00,45000.00,0.00,0.00,'sup014','153','0000000000000',2,'2017-07-03 17:16:26','2017-07-28 15:15:14','u1@gmail.com','u1@gmail.com',1,'CAITOC'),('8930001002142','Heart shaped shell (Orange)','','','2017-07-03_Heart shaped shell (Orange).png',8,99,0.00,10000.00,0.00,0.00,'sup014','152','0000000000000',2,'2017-07-03 17:28:48','2017-07-28 14:59:42','u1@gmail.com','u1@gmail.com',1,'VSC'),('8930001002159','Heart shaped shell (Pink)','','','2017-07-03_Heart shaped shell (Pink).png',8,99,0.00,10000.00,0.00,0.00,'sup014','152','0000000000000',2,'2017-07-03 17:30:38','2017-08-10 12:08:34','u1@gmail.com','u1@gmail.com',1,'VSH'),('8930001002166','Heart shaped shell (Brown)','','','2017-07-03_Heart shaped shell (Brown).png',8,99,0.00,10000.00,0.00,0.00,'sup014','152','0000000000000',2,'2017-07-03 17:34:04','2017-07-28 15:00:08','u1@gmail.com','u1@gmail.com',1,'VSN'),('8930001002173','Trung Nguyen coffee','','','2017-07-04_Trung Nguyen coffee.png',7,99,0.00,39000.00,0.00,0.00,'sup019','052','0000000000000',2,'2017-07-04 09:11:13','2017-08-04 11:46:31','u1@gmail.com','u1@gmail.com',1,'CAFE'),('8930001002203','Sauce bowl','','','2017-07-04_chen-soup.jpg',6,99,0.00,25000.00,0.00,0.00,'sup013','051','0000000000000',2,'2017-07-04 09:22:12','2017-07-28 12:15:18','u1@gmail.com','u1@gmail.com',1,'C002'),('8930001002234','Women Sunglasses ','','','2017-07-04_Women Sunglasses.png',6,99,0.00,130000.00,0.00,0.00,'sup017','101','0000000000000',2,'2017-07-04 11:41:37','2017-08-04 11:45:44','u1@gmail.com','u1@gmail.com',1,'KMNU'),('8930001002241','Men Sunglasses ','','','2017-07-04_Men Sunglasses.png',6,99,0.00,189000.00,0.00,0.00,'sup017','101','0000000000000',2,'2017-07-04 11:47:04','2017-08-04 11:44:41','u1@gmail.com','u1@gmail.com',1,'KMN'),('8930001002265','Adapter','','','2017-07-28_Adapter.png',6,99,0.00,0.00,0.00,0.00,'sup017','050','0000000000000',2,'2017-07-28 16:26:12','2017-08-04 11:44:31','u1@gmail.com','u1@gmail.com',1,'ADAPTER'),('8930001002272','Jack ','','','2017-07-28_Jack.png',6,99,0.00,0.00,0.00,0.00,'sup017','050','0000000000000',2,'2017-07-28 16:28:21','2017-08-04 11:44:20','u1@gmail.com','u1@gmail.com',1,'KETNOI'),('8930001002289','Big PCB Board','','','2017-07-28_Big circuit board.png',6,99,0.00,0.00,0.00,0.00,'sup017','050','0000000000000',2,'2017-07-28 16:31:08','2017-08-04 11:44:06','u1@gmail.com','u1@gmail.com',1,'BMT'),('8930001002333','Health monitoring bracelet ','','','2017-08-03_Guardian of health.png',6,99,0.00,0.00,0.00,0.00,'sup017','008','0000000000000',2,'2017-08-03 16:14:00','2017-08-04 11:43:53','u1@gmail.com','u1@gmail.com',1,'VEEPOO'),('8930001002371','Water Based Paint / Par Weather AC H05-40V','','','2017-08-08_H05-40V.JPG',2,99,2822621.80,0.00,0.00,0.00,'sup007','301','0000000000000',1,'2017-08-04 11:53:06','2017-08-08 17:01:30','u1@gmail.com','u1@gmail.com',1,'AC H05-40V'),('8930001002388','Water Based Paint / Par Weather AC H75-40T','','','2017-08-08_H75-40T.JPG',2,99,2822621.86,0.00,0.00,0.00,'sup007','301','0000000000000',1,'2017-08-04 12:07:12','2017-08-08 17:01:17','u1@gmail.com','u1@gmail.com',1,'AC H75-40T'),('8930001002395','Water Based Paint / Par Weather AC KP-110','','','2017-08-08_AC KP-110.JPG',2,99,2822621.60,0.00,0.00,0.00,'sup007','301','0000000000000',1,'2017-08-04 12:10:11','2017-08-08 17:00:40','u1@gmail.com','u1@gmail.com',1,'AC KP-110'),('8930001002401','Kansai paint Eco AC Sealer','','','2017-08-08_ECO EC SEALER.JPG',2,99,1000000.00,0.00,0.00,0.00,'sup007','301','0000000000000',1,'2017-08-04 12:13:24','2017-08-08 16:59:03','u1@gmail.com','u1@gmail.com',1,'ACSEALER'),('8930001002418','Water Based Paint / Crown Emulsion H75-40T','','','2017-08-08_CROWN  EMULSION H75-40T.JPG',2,99,1376142.86,0.00,0.00,0.00,'sup007','301','0000000000000',1,'2017-08-04 12:18:05','2017-08-08 16:59:52','u1@gmail.com','u1@gmail.com',1,'H75-40T'),('8930001002425','Premium Skim Coat for Exter KSB-E','','','2017-08-08_Premium Skim Coat for Exter KSB-E.JPG',2,99,229143.00,0.00,0.00,0.00,'sup007','301','0000000000000',1,'2017-08-04 12:22:21','2017-08-08 17:00:06','u1@gmail.com','u1@gmail.com',1,'KBSE'),('8930001002432','Water Based Paint / Crown Emulsion KP-110','','','2017-08-08_CROWN EMULSION KP-110.JPG',2,99,1339125.00,0.00,0.00,0.00,'sup007','301','0000000000000',1,'2017-08-04 12:24:45','2017-08-16 15:28:51','u1@gmail.com','u1@gmail.com',1,'KP-110'),('8930001002470','protection case  for phone','','','2017-09-14_IMG_4748 (smaller).png',6,99,51000.00,66000.00,0.00,0.00,'sup002','050','0000000000000',1,'2017-09-14 16:24:25','2017-10-26 14:27:13','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com',1,'PROCASE'),('8930001002487','premium tempered glass screen protector','','','2017-09-14_IMG_4750 (smaller).png',6,99,23000.00,30000.00,0.00,0.00,'sup002','050','0000000000000',1,'2017-09-14 16:27:24','2017-10-26 14:27:46','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com',1,'PREPROTEC'),('8930001002494','kid\'s stereo headphone 1','','','2017-09-14_IMG_4713 (smaller).png',6,99,197000.00,237000.00,0.00,0.00,'sup002','050','0000000000000',1,'2017-09-14 16:29:20','2017-10-26 14:28:45','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com',1,'KIDHEAD1'),('8930001002500','kid\'s stereo headphone 2','','','2017-09-14_IMG_4712 (smaller).png',6,99,189000.00,227000.00,0.00,0.00,'sup002','050','0000000000000',1,'2017-09-14 16:30:53','2017-10-26 14:31:04','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com',1,'KIDHEAD2'),('8930001002517','stereo headphones ','','','2017-09-14_IMG_4752 (smaller).png',6,99,45000.00,58000.00,0.00,0.00,'sup002','050','0000000000000',1,'2017-09-14 16:33:15','2017-10-26 14:31:33','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com',1,'STEHEAD'),('8930001002531','gaming stereo  headphones','','','2017-09-14_IMG_4762 (smaller).png',6,99,66000.00,86000.00,0.00,0.00,'sup002','050','0000000000000',1,'2017-09-14 16:37:09','2017-10-26 14:32:08','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com',1,'GAMHEAD'),('8930001002548','multimedia microphone','','','2017-09-14_IMG_4757 (smaller).png',6,99,41000.00,53000.00,0.00,0.00,'sup002','050','0000000000000',1,'2017-09-14 16:38:46','2017-10-26 14:32:43','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com',1,'MULMIC'),('8930001002555','keyring charger','','','2017-09-14_IMG_4730 (smaller).png',6,99,57000.00,75000.00,0.00,0.00,'sup002','050','0000000000000',1,'2017-09-14 16:40:17','2017-10-26 14:33:16','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com',1,'KEYCHAR'),('8930001002562','LCD writing table','','','2017-09-14_IMG_4760 (smaller).png',6,99,827000.00,992000.00,0.00,0.00,'sup002','050','0000000000000',1,'2017-09-14 16:42:18','2017-10-26 14:33:42','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com',1,'LWT'),('8930001002579','in-ear headphone','','','2017-09-14_IMG_4751 (smaller).png',6,99,130000.00,156000.00,0.00,0.00,'sup002','050','0000000000000',1,'2017-09-14 16:43:51','2017-10-26 14:34:08','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com',1,'INEAR'),('8930001002586','high performance  luxury earphones 1','','','2017-09-14_IMG_4765 (smaller).png',6,99,105000.00,136000.00,0.00,0.00,'sup002','050','0000000000000',1,'2017-09-14 16:45:29','2017-10-26 14:34:56','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com',1,'HPLEAR1'),('8930001002593','high performance  luxury earphones 2','','','2017-09-14_tai nghe 2-1 (smaller).png',6,99,139000.00,180000.00,0.00,0.00,'sup002','050','0000000000000',1,'2017-09-14 16:46:39','2017-10-26 14:35:34','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com',1,'HPLEAR2'),('8930001002609','clothes for dogs 1','','','2017-09-14_IMG_4759 (smaller).png',6,99,139000.00,166000.00,0.00,0.00,'sup002','351','0000000000000',1,'2017-09-14 16:50:59','2017-10-26 14:24:54','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com',1,'CLODOG1'),('8930001002616','dog bow tie collar','','','2017-09-14_IMG_4711 (smaller).png',6,99,63000.00,75000.00,0.00,0.00,'sup002','353','0000000000000',1,'2017-09-14 16:54:15','2017-10-26 14:25:23','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com',1,'COLLAR'),('8930001002623','clothes for dogs 2','','','2017-09-14_IMG_4724 (smaller).png',6,99,143000.00,172000.00,0.00,0.00,'sup002','351','0000000000000',1,'2017-09-14 16:55:45','2017-10-26 14:25:58','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com',1,'CLODOG 2'),('8930001002630','safety dog scarf','','','2017-09-14_IMG_4728 (smaller).png',6,99,48000.00,58000.00,0.00,0.00,'sup002','353','0000000000000',1,'2017-09-14 16:58:11','2017-10-26 14:36:33','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com',1,'DOGSCARF'),('8930001002647','self cleaning slicker pet brush','','','2017-09-14_IMG_4758 (smaller).png',6,99,81000.00,98000.00,0.00,0.00,'sup002','352','0000000000000',1,'2017-09-14 17:00:53','2017-10-26 14:23:24','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com',1,'PETBRUSH'),('8930001002654','dematting grooming comb','','','2017-09-14_IMG_4761 (smaller).png',6,99,86000.00,103000.00,0.00,0.00,'sup002','352','0000000000000',1,'2017-09-14 17:05:40','2017-10-26 14:23:58','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com',1,'DECOMB'),('8930001002661','pet nail clippers','','','2017-09-14_IMG_4740 (smaller).png',6,99,79000.00,95000.00,0.00,0.00,'sup002','352','0000000000000',1,'2017-09-14 17:07:29','2017-10-30 11:36:14','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com',1,'CLIP'),('8930001002678','hand spinner','','','2017-09-14_IMG_4722 (smaller).png',6,99,43000.00,52000.00,0.00,0.00,'sup002','401','0000000000000',1,'2017-09-14 17:09:31','2017-10-26 14:26:36','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com',1,'SPIN'),('8930001002685','silicone led light','','','2017-09-14_IMG_4739 (smaller).png',6,99,76000.00,91000.00,0.00,0.00,'sup002','353','0000000000000',1,'2017-09-14 17:17:30','2017-10-26 14:22:04','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com',1,'SILED'),('8930001002692','Activity Tracker  – AX1','','','2017-09-15_Untitled.png',6,99,333000.00,400000.00,0.00,0.00,'sup018','001','0000000000000',1,'2017-09-15 09:02:19','2017-10-26 15:01:40','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com',1,'AX1'),('8930001002708','Smart Bracelet - i5 plus','','','2017-09-15_IMG_4801 (smaller).png',6,99,494000.00,593000.00,0.00,0.00,'sup018','001','0000000000000',1,'2017-09-15 09:03:51','2017-10-26 14:08:58','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com',1,'AX1PLUS'),('8930001002715','Smart Bracelet - AX-G8','','','2017-09-15_AXG8.png',6,99,834000.00,1001000.00,0.00,0.00,'sup018','001','0000000000000',1,'2017-09-15 09:06:38','2017-10-26 14:09:46','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com',1,'AXG8'),('8930001002722','Children GPS Watch – AX-G1','','','2017-09-15_IMG_4805 (smaller).png',6,99,772000.00,926000.00,0.00,0.00,'sup018','001','0000000000000',1,'2017-09-15 09:08:44','2017-10-26 14:10:33','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com',1,'AXG1'),('8930001002746','Children GPS Watch – AX-G1B','','','2017-09-15_IMG_4782 (smaller).png',6,99,1142000.00,1371000.00,0.00,0.00,'sup018','001','0000000000000',1,'2017-09-15 09:11:02','2017-10-26 14:11:52','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com',1,'AXG1B'),('8930001002760','GPS device for Pet – P2','','','2017-09-15_IMG_4790 (smaller).png',6,99,528000.00,634000.00,0.00,0.00,'sup018','009','0000000000000',1,'2017-09-15 09:15:08','2017-10-26 14:13:40','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com',1,'P2'),('8930001002777','Wifi Socket – S1','','','2017-09-15_IMG_4777 (smaller).png',6,99,306000.00,367000.00,0.00,0.00,'sup018','251','0000000000000',1,'2017-09-15 09:16:52','2017-10-26 14:15:10','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com',1,'S1'),('8930001002784','Wifi Light – B1 plus','','','2017-09-15_IMG_4789 (smaller).png',6,99,270000.00,323000.00,0.00,0.00,'sup018','251','0000000000000',1,'2017-09-15 09:18:28','2017-10-26 14:16:08','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com',1,'B1PLUS'),('8930001002791','IP Camera ','','','2017-09-15_IMG_4797 (smaller).png',6,99,1082000.00,1299000.00,0.00,0.00,'sup018','003','0000000000000',1,'2017-09-15 09:19:48','2017-10-26 14:17:15','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com',1,'C624'),('8930001002807','twin true wireless earbuds V4.2 + DER','','','2017-10-30_I7 TWS.png',6,99,0.00,0.00,0.00,0.00,'sup017','050','0000000000000',2,'2017-10-30 09:37:07','2017-10-30 09:49:31','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com',1,'I7 TWS'),('8930001002814','Wireless music earphone V4.1+ EDR','','','2017-10-30_HBQI7.png',6,99,0.00,0.00,0.00,0.00,'sup017','050','0000000000000',2,'2017-10-30 09:40:41','2017-10-31 21:35:26','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com',1,'HBQI7'),('8930001002821','wireless metal in-ear stereo','','','2017-10-31_ảnh 6.JPG',6,99,0.00,0.00,0.00,0.00,'sup017','050','0000000000000',2,'2017-10-31 21:04:21','2017-10-31 21:04:21','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com',1,'WLINEAR'),('8930001002838','Music wireless speaker','','','2017-10-31_A2DP.png',6,99,0.00,0.00,0.00,0.00,'sup017','000','0000000000000',2,'2017-10-31 21:11:37','2017-10-31 21:11:37','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com',1,'A2DP'),('8930001002845','mini speaker WS-187','','','2017-11-01_WS-187.png',6,99,0.00,0.00,0.00,0.00,'sup017','000','0000000000000',2,'2017-10-31 21:14:58','2017-11-01 11:19:30','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com',1,'WS-187'),('8930001002852','wireless music YZ-18','','','2017-10-31_YZ-18.png',6,99,0.00,0.00,0.00,0.00,'sup017','000','0000000000000',2,'2017-10-31 21:21:00','2017-10-31 21:28:10','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com',1,'YZ-18'),('8930001002869','BT speaker S-13','','','2017-10-31_ảnh 12.JPG',6,99,0.00,0.00,0.00,0.00,'sup017','000','0000000000000',2,'2017-10-31 21:22:23','2017-10-31 21:22:23','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com',1,'S-13'),('8930001002876','mini audio 175','','','2017-10-31_175.png',6,99,0.00,0.00,0.00,0.00,'sup017','000','0000000000000',2,'2017-10-31 21:23:49','2017-10-31 22:12:43','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com',1,'175'),('8930001002883','BT speaker Y-35','','','2017-10-31_Y-35.png',6,99,0.00,0.00,0.00,0.00,'sup017','000','0000000000000',2,'2017-10-31 21:32:10','2017-10-31 21:32:10','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com',1,'Y-35'),('8930001002890','QUTE wireless speaker','','','2017-10-31_QUTE.png',6,99,0.00,0.00,0.00,0.00,'sup017','000','0000000000000',2,'2017-10-31 21:35:05','2017-10-31 21:35:05','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com',1,'QUTE'),('8930001002913','USB VAIO SONY - 8GB','','','2017-10-31_ảnh 8.JPG',6,99,0.00,0.00,0.00,0.00,'sup017','050','0000000000000',2,'2017-10-31 21:40:48','2017-10-31 21:41:06','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com',1,'USBVIO8'),('8930001002920','USB KINGSTON - 8GB','','','2017-10-31_ảnh 9.JPG',6,99,0.00,0.00,0.00,0.00,'sup017','050','0000000000000',2,'2017-10-31 21:42:27','2017-10-31 22:01:48','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com',1,'USBKT8'),('8930001002937','USB KINGSTON - 16GB		','','','2017-10-31_ảnh 20.JPG',6,99,0.00,0.00,0.00,0.00,'sup017','050','0000000000000',2,'2017-10-31 22:00:59','2017-10-31 22:03:12','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com',1,'USBKT16'),('8930001002944','Vivmall\'s Pen','','','',6,99,0.00,0.00,0.00,0.00,'sup001','152','0000000000000',2,'2017-11-03 23:57:15','2017-11-04 00:02:43','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com',1,'VIET'),('8930001002951','Vivmall\'s raincoat','','','',6,99,0.00,0.00,0.00,0.00,'sup001','152','0000000000000',2,'2017-11-03 23:58:10','2017-11-04 00:02:19','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com',1,'AOMUA'),('8930001002982','Vivmall\'s umbrella','','','',6,99,0.00,0.00,0.00,0.00,'sup001','152','0000000000000',2,'2017-11-04 00:01:49','2017-11-04 00:01:49','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com',1,'DU'),('8930001002999','Vivmall\'s helmet','','','',6,99,0.00,0.00,0.00,0.00,'sup001','152','0000000000000',2,'2017-11-04 00:03:46','2017-11-04 00:03:46','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com',1,'MBH');
/*!40000 ALTER TABLE `tb_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_receipt_note_type`
--

DROP TABLE IF EXISTS `tb_receipt_note_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_receipt_note_type` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_receipt_note_type`
--

LOCK TABLES `tb_receipt_note_type` WRITE;
/*!40000 ALTER TABLE `tb_receipt_note_type` DISABLE KEYS */;
INSERT INTO `tb_receipt_note_type` VALUES (1,'New receipt'),(2,'Promotion');
/*!40000 ALTER TABLE `tb_receipt_note_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_supplier`
--

DROP TABLE IF EXISTS `tb_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_supplier` (
  `id` char(6) NOT NULL,
  `SupplierName` varchar(145) DEFAULT NULL,
  `BusinessType` int(11) DEFAULT NULL,
  `Description` varchar(245) DEFAULT NULL,
  `Address` varchar(245) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Email` varchar(145) DEFAULT NULL,
  `Website` varchar(45) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_supplier`
--

LOCK TABLES `tb_supplier` WRITE;
/*!40000 ALTER TABLE `tb_supplier` DISABLE KEYS */;
INSERT INTO `tb_supplier` VALUES ('sup001','Glorious Vietnam',1,'aaa','aaa','1243','aaa@gmail.com','vinhsang.com',1),('sup002','Made-in-China',2,'aaa','aa','1243','aaa@gmail.com','vinhsang.com',1),('sup004','Shenzhen Shengli Technology Co, Ltd',1,NULL,NULL,NULL,NULL,NULL,1),('sup007','Glorious IT Creation Limited',1,NULL,NULL,NULL,NULL,NULL,1),('sup008','Cuu Long Coconut Co, Ltd',1,NULL,NULL,NULL,NULL,NULL,1),('sup013','Pham Minh Quang',1,NULL,NULL,NULL,NULL,NULL,1),('sup014','Tran Thi Bau',1,NULL,NULL,NULL,NULL,NULL,1),('sup015','Shenzhen Ling Hang Da Electronics Co., Ltd',1,NULL,NULL,NULL,NULL,NULL,1),('sup017','China',1,NULL,NULL,NULL,NULL,NULL,1),('sup018','Korex',1,NULL,NULL,NULL,NULL,NULL,1),('sup019','Big C',1,NULL,NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `tb_supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_unit`
--

DROP TABLE IF EXISTS `tb_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_unit` (
  `id` int(3) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_unit`
--

LOCK TABLES `tb_unit` WRITE;
/*!40000 ALTER TABLE `tb_unit` DISABLE KEYS */;
INSERT INTO `tb_unit` VALUES (1,'Item','cái'),(2,'can','thùng'),(3,'pack','gói'),(4,'set','bộ'),(5,'bottle','chai'),(6,'piece','cái'),(7,'box','hop'),(8,'pair','Cặp');
/*!40000 ALTER TABLE `tb_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user_group`
--

DROP TABLE IF EXISTS `tb_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_user_group` (
  `id` varchar(20) NOT NULL,
  `UserGroupName` varchar(145) DEFAULT NULL,
  `UserGroupDes` varchar(245) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user_group`
--

LOCK TABLES `tb_user_group` WRITE;
/*!40000 ALTER TABLE `tb_user_group` DISABLE KEYS */;
INSERT INTO `tb_user_group` VALUES ('GROUP-001','Group user1','Group user1',1),('GROUP-002','Group user2','Group user2',1),('GROUP-003','Group user3','Group user3',0);
/*!40000 ALTER TABLE `tb_user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbuser`
--

DROP TABLE IF EXISTS `tbuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbuser` (
  `username` varchar(50) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `FirstName` varchar(45) DEFAULT NULL,
  `LastName` varchar(45) DEFAULT NULL,
  `Birthday` date DEFAULT NULL,
  `PhysicalWarehouseId` varchar(25) DEFAULT NULL,
  `UserGroupId` varchar(25) DEFAULT NULL,
  `RegisterDate` datetime DEFAULT NULL,
  `UpdateDate` datetime DEFAULT NULL,
  `RegisterUser` varchar(45) DEFAULT NULL,
  `UpdateUser` varchar(45) DEFAULT NULL,
  `LocationId` varchar(25) DEFAULT NULL,
  `user_role` varchar(45) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbuser`
--

LOCK TABLES `tbuser` WRITE;
/*!40000 ALTER TABLE `tbuser` DISABLE KEYS */;
INSERT INTO `tbuser` VALUES ('hien.ntt@vinhsangvn.com','123456','Hien','test11','2017-01-01','DS1','GROUP-001','2017-01-01 00:00:00','2017-01-01 00:00:00','hien.ntt@vinhsangvn.com','hien.ntt@vinhsangvn.com','LOCA-001','ROLE_ADMIN',1),('test11@gmail.com','123456','test11','test11','2017-01-01','DS1','GROUP-001','2017-01-01 00:00:00','2017-01-01 00:00:00','u1@gmail.com','u1@gmail.com','LOCA-001','ROLE_ADMIN',1),('test12@gmail.com','123456','test11','test11','2017-01-01','DS1','GROUP-001','2017-01-01 00:00:00','2017-01-01 00:00:00','u1@gmail.com','u1@gmail.com','LOCA-001','ROLE_ADMIN',1),('test13@gmail.com','123456','test11','test11','2017-01-01','DS1','GROUP-001','2017-01-01 00:00:00','2017-01-01 00:00:00','u1@gmail.com','u1@gmail.com','LOCA-001','ROLE_ADMIN',1),('test14@gmail.com','123456','test11','test11','2017-01-01','TP1','GROUP-002','2017-01-01 00:00:00','2017-06-08 15:15:08','u1@gmail.com','u1@gmail.com','LOCA-003','ROLE_ADMIN',1),('test15@gmail.com','123456','test11','test11','2017-01-01','DS1','GROUP-001','2017-01-01 00:00:00','2017-01-01 00:00:00','u1@gmail.com','u1@gmail.com','LOCA-001','ROLE_ADMIN',1),('test16@gmail.com','123456','test11','test11','2017-01-01','DS1','GROUP-001','2017-01-01 00:00:00','2017-01-01 00:00:00','u1@gmail.com','u1@gmail.com','LOCA-001','ROLE_ADMIN',1),('test17@gmail.com','123456','test17','test17','2017-01-01','DS1','GROUP-001','2017-07-03 16:31:10','2017-07-03 16:31:10','u1@gmail.com','u1@gmail.com','LOCA-001','ROLE_ADMIN',0);
/*!40000 ALTER TABLE `tbuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_user`
--

DROP TABLE IF EXISTS `view_user`;
/*!50001 DROP VIEW IF EXISTS `view_user`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_user` AS SELECT 
 1 AS `username`,
 1 AS `password`,
 1 AS `FirstName`,
 1 AS `LastName`,
 1 AS `Birthday`,
 1 AS `PhysicalWarehouseId`,
 1 AS `UserGroupId`,
 1 AS `RegisterDate`,
 1 AS `UpdateDate`,
 1 AS `RegisterUser`,
 1 AS `UpdateUser`,
 1 AS `LocationId`,
 1 AS `user_role`,
 1 AS `enabled`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_gridproduct`
--

DROP TABLE IF EXISTS `vw_gridproduct`;
/*!50001 DROP VIEW IF EXISTS `vw_gridproduct`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_gridproduct` AS SELECT 
 1 AS `id`,
 1 AS `ProductName`,
 1 AS `FeatureImage`,
 1 AS `Unit`,
 1 AS `BigUnit`,
 1 AS `CostPrice`,
 1 AS `SellPrice`,
 1 AS `SellPrice1`,
 1 AS `SellPrice2`,
 1 AS `CategoryId`,
 1 AS `CategoryAnalyseId`,
 1 AS `BusinessType`,
 1 AS `SupplierId`,
 1 AS `CreateDate`,
 1 AS `UpdateDate`,
 1 AS `CreateUser`,
 1 AS `UpdateUser`,
 1 AS `enabled`,
 1 AS `ProductCode`,
 1 AS `BigUnitName`,
 1 AS `CategoryName`,
 1 AS `SupplierName`,
 1 AS `UnitName`,
 1 AS `BusinessTypeName`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'cargodb'
--
/*!50003 DROP FUNCTION IF EXISTS `getNextCustomSeq` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`vinhsang`@`%` FUNCTION `getNextCustomSeq`(
    sSeqName VARCHAR(50),
    sSeqGroup VARCHAR(10)
) RETURNS varchar(20) CHARSET utf8
BEGIN
    DECLARE nLast_val INT; 
 
    SET nLast_val =  (SELECT seq_val
                          FROM _sequence
                          WHERE seq_name = sSeqName
                                AND seq_group = sSeqGroup);
    IF nLast_val IS NULL THEN
        SET nLast_val = 1;
        INSERT INTO _sequence (seq_name,seq_group,seq_val)
        VALUES (sSeqName,sSeqGroup,nLast_Val);
    ELSE
        SET nLast_val = nLast_val + 1;
        UPDATE _sequence SET seq_val = nLast_val
        WHERE seq_name = sSeqName AND seq_group = sSeqGroup;
    END IF; 
 
    SET @ret = (SELECT concat(sSeqGroup,'-',lpad(nLast_val,11,'0')));
    RETURN @ret;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getNextProductBarcodeWithoutChecksumDigit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`vinhsang`@`%` FUNCTION `getNextProductBarcodeWithoutChecksumDigit`(
) RETURNS varchar(12) CHARSET utf8
BEGIN
DECLARE nLast_val INT; 
DECLARE nContry_val varchar(3);
DECLARE nCompany_val varchar(6);
declare nProduct_length int;

select  contry_code, company_code, product_code_count, product_length
into    nContry_val,nCompany_val,nLast_val,nProduct_length
from _sequence_barcode where id=1;
  IF nLast_val IS NULL THEN
        SET nLast_val = 1;
        INSERT INTO _sequence_barcode (id,contry_code, company_code, product_code_count, product_length)
        VALUES (1,'893','0001',1,5);
    ELSE
        SET nLast_val = nLast_val + 1;
        UPDATE _sequence_barcode SET product_code_count = nLast_val
        WHERE id=1;
    END IF; 

	SET @ret = (SELECT concat(nContry_val,nCompany_val,lpad(nLast_val,nProduct_length,'0')));
    RETURN @ret;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `SPLIT_STR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`vinhsang`@`%` FUNCTION `SPLIT_STR`(
  x VARCHAR(255),
  delim VARCHAR(12),
  pos INT
) RETURNS varchar(255) CHARSET utf8
RETURN REPLACE(SUBSTRING(SUBSTRING_INDEX(x, delim, pos),
       LENGTH(SUBSTRING_INDEX(x, delim, pos -1)) + 1),
       delim, '') ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `debug_sp_lastperiod` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`vinhsang`@`%` PROCEDURE `debug_sp_lastperiod`(
	in p_warehouse char(6),
    in p_productid varchar(13)
)
BEGIN
declare begindate datetime;
declare enddate datetime;
			select  beginning_date, ending_date 
			FROM 
				tb_inventory_report_history	  order by id desc limit 1 
			into begindate,enddate;
            
     select      begindate,enddate;  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getInventory_report_Lastperiod` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`vinhsang`@`%` PROCEDURE `sp_getInventory_report_Lastperiod`(
	in p_warehouse char(6),
    in p_productid varchar(13)
)
BEGIN
declare begindate datetime;
declare enddate datetime;
			select  beginning_date, ending_date 
			FROM 
				tb_inventory_report_history	  order by id desc limit 1 
			into begindate,enddate;

select * from tb_inventory_report where LogicWarehouseId= p_warehouse 
and  ProductId=p_productid
 and  CreateDate < date_add(enddate,interval +1 day)
   order by id desc limit 1 ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_test_jasper_tb_product` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`vinhsang`@`%` PROCEDURE `sp_test_jasper_tb_product`(
in maxUnit int(8)
)
BEGIN

SELECT * 
FROM tb_product
where Unit < maxUnit
;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `view_user`
--

/*!50001 DROP VIEW IF EXISTS `view_user`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`vinhsang`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_user` AS (select `tbuser`.`username` AS `username`,`tbuser`.`password` AS `password`,`tbuser`.`FirstName` AS `FirstName`,`tbuser`.`LastName` AS `LastName`,`tbuser`.`Birthday` AS `Birthday`,`tbuser`.`PhysicalWarehouseId` AS `PhysicalWarehouseId`,`tbuser`.`UserGroupId` AS `UserGroupId`,`tbuser`.`RegisterDate` AS `RegisterDate`,`tbuser`.`UpdateDate` AS `UpdateDate`,`tbuser`.`RegisterUser` AS `RegisterUser`,`tbuser`.`UpdateUser` AS `UpdateUser`,`tbuser`.`LocationId` AS `LocationId`,`tbuser`.`user_role` AS `user_role`,`tbuser`.`enabled` AS `enabled` from `tbuser`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_gridproduct`
--

/*!50001 DROP VIEW IF EXISTS `vw_gridproduct`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`vinhsang`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_gridproduct` AS (select `p`.`id` AS `id`,`p`.`ProductName` AS `ProductName`,`p`.`FeatureImage` AS `FeatureImage`,`p`.`Unit` AS `Unit`,`p`.`BigUnit` AS `BigUnit`,`p`.`CostPrice` AS `CostPrice`,`p`.`SellPrice` AS `SellPrice`,`p`.`SellPrice1` AS `SellPrice1`,`p`.`SellPrice2` AS `SellPrice2`,`p`.`CategoryId` AS `CategoryId`,`p`.`CategoryAnalyseId` AS `CategoryAnalyseId`,`p`.`BusinessType` AS `BusinessType`,`p`.`SupplierId` AS `SupplierId`,`p`.`CreateDate` AS `CreateDate`,`p`.`UpdateDate` AS `UpdateDate`,`p`.`CreateUser` AS `CreateUser`,`p`.`UpdateUser` AS `UpdateUser`,`p`.`enabled` AS `enabled`,`p`.`ProductCode` AS `ProductCode`,`b`.`name` AS `BigUnitName`,`c`.`CategoryName` AS `CategoryName`,`s`.`SupplierName` AS `SupplierName`,`u`.`name` AS `UnitName`,`bs`.`name` AS `BusinessTypeName` from (((((`tb_product` `p` join `tb_bigunit` `b` on((`p`.`BigUnit` = `b`.`id`))) join `tb_category` `c` on((`p`.`CategoryId` = `c`.`id`))) join `tb_supplier` `s` on((`p`.`SupplierId` = `s`.`id`))) join `tb_unit` `u` on((`p`.`Unit` = `u`.`id`))) join `tb_businesstype` `bs` on((`p`.`BusinessType` = `bs`.`id`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-02 15:24:26
