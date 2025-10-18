-- MariaDB dump 10.19  Distrib 10.4.25-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: project
-- ------------------------------------------------------
-- Server version	10.4.25-MariaDB

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
-- Table structure for table `blood_detail`
--

DROP TABLE IF EXISTS `blood_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blood_detail` (
  `Blood_Bag_ID` varchar(5) NOT NULL,
  `Date_Distribute` date DEFAULT NULL,
  `Date_Expire` date DEFAULT NULL,
  `Blood_ID` varchar(5) NOT NULL,
  PRIMARY KEY (`Blood_Bag_ID`),
  KEY `Blood_ID` (`Blood_ID`),
  CONSTRAINT `blood_detail_ibfk_1` FOREIGN KEY (`Blood_ID`) REFERENCES `bloodbank` (`Blood_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blood_detail`
--

LOCK TABLES `blood_detail` WRITE;
/*!40000 ALTER TABLE `blood_detail` DISABLE KEYS */;
INSERT INTO `blood_detail` VALUES ('BB001','2023-01-14','2023-02-09','BL003'),('BB002','2023-01-14','2023-02-06','BL001'),('BB003','2023-01-16','2023-02-09','BL003'),('BB004','2023-01-18','2023-02-14','BL005'),('BB005','2023-01-20','2023-02-14','BL005'),('BB006','2023-01-22','2023-02-06','BL001'),('BB007','2023-01-24','2023-02-16','BL007'),('BB008','2023-01-24','2023-02-16','BL006');
/*!40000 ALTER TABLE `blood_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bloodbank`
--

DROP TABLE IF EXISTS `bloodbank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bloodbank` (
  `Blood_ID` varchar(5) NOT NULL,
  `Blood_Type` varchar(2) NOT NULL,
  `Blood_Rhesus` char(1) NOT NULL,
  `Blood_Quantity` int(11) NOT NULL,
  `Staff_ID` varchar(5) NOT NULL,
  PRIMARY KEY (`Blood_ID`),
  KEY `Staff_ID` (`Staff_ID`),
  CONSTRAINT `bloodbank_ibfk_1` FOREIGN KEY (`Staff_ID`) REFERENCES `staff` (`Staff_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bloodbank`
--

LOCK TABLES `bloodbank` WRITE;
/*!40000 ALTER TABLE `bloodbank` DISABLE KEYS */;
INSERT INTO `bloodbank` VALUES ('BL001','A','+',200,'S0006'),('BL002','A','-',30,'S0006'),('BL003','B','+',150,'S0005'),('BL004','B','-',40,'S0005'),('BL005','AB','+',250,'S0008'),('BL006','AB','-',10,'S0008'),('BL007','O','+',100,'S0007'),('BL008','O','-',20,'S0007');
/*!40000 ALTER TABLE `bloodbank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donation`
--

DROP TABLE IF EXISTS `donation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `donation` (
  `Donation_ID` varchar(8) NOT NULL,
  `Date_Donate` date NOT NULL,
  `Donor_ID` varchar(5) NOT NULL,
  `Blood_Type` varchar(2) DEFAULT NULL,
  `Blood_ID` varchar(5) NOT NULL,
  `Blood_Rhesus` char(1) DEFAULT NULL,
  `Donation_Amt` int(11) DEFAULT NULL,
  `Donation_Place` varchar(25) NOT NULL,
  `Staff_ID` varchar(5) NOT NULL,
  PRIMARY KEY (`Donation_ID`,`Donor_ID`,`Blood_ID`),
  KEY `Blood_ID` (`Blood_ID`),
  KEY `Staff_ID` (`Staff_ID`),
  KEY `Donor_ID` (`Donor_ID`),
  CONSTRAINT `donation_ibfk_1` FOREIGN KEY (`Blood_ID`) REFERENCES `bloodbank` (`Blood_ID`),
  CONSTRAINT `donation_ibfk_2` FOREIGN KEY (`Staff_ID`) REFERENCES `staff` (`Staff_ID`),
  CONSTRAINT `donation_ibfk_3` FOREIGN KEY (`Donor_ID`) REFERENCES `donor` (`Donor_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donation`
--

LOCK TABLES `donation` WRITE;
/*!40000 ALTER TABLE `donation` DISABLE KEYS */;
INSERT INTO `donation` VALUES ('DNF0001','2022-12-13','D0001','A','BL001','+',200,'Klinik Kesihatan Alor Gaj','S0001'),('DNF0002','2022-10-10','D0002','AB','BL002','+',30,'Klink Kesihatan Kota Ting','S0002'),('DNF0003','2022-02-13','D0003','A','BL003','+',150,'Klink Kesihatan Petaling ','S0003'),('DNF0004','2022-08-18','D0004','B','BL004','+',40,'Klink Kesihatan Bentong','S0004'),('DNF0005','2022-09-18','D0005','O','BL005','+',250,'Klink Kesihatan Bayan Lep','S0005'),('DNF0006','2022-01-10','D0006','AB','BL006','-',10,'Klink Kesihatan Jasin','S0006'),('DNF0007','2022-12-13','D0007','B','BL007','+',100,'Klink Kesihatan Kuala Ter','S0007'),('DNF0008','2022-01-10','D0008','B','BL008','+',20,'Klink Kesihatan Ayer Lena','S0009'),('DNF0009','2022-05-14','D0009','A','BL001','+',200,'Klink Kesihatan Muar','S0010'),('DNF0010','2022-12-15','D0010','O','BL003','-',30,'Klink Kesihatan Kota Kina','S0008');
/*!40000 ALTER TABLE `donation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donor`
--

DROP TABLE IF EXISTS `donor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `donor` (
  `Donor_ID` varchar(5) NOT NULL,
  `Donor_IC` varchar(12) DEFAULT NULL,
  `Donor_Name` varchar(30) DEFAULT NULL,
  `Donor_Address` varchar(70) DEFAULT NULL,
  `Donor_Postcode` char(5) DEFAULT NULL,
  `Donor_City` varchar(15) DEFAULT NULL,
  `Donor_State` varchar(15) DEFAULT NULL,
  `Donor_Phone` char(11) DEFAULT NULL,
  `Donor_Gender` varchar(1) DEFAULT NULL,
  `Donor_Bloodtype` varchar(2) DEFAULT NULL,
  `Donor_Rhesus` varchar(1) DEFAULT NULL,
  `Donor_Weight` decimal(5,2) DEFAULT NULL,
  `Donor_Qualification` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`Donor_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donor`
--

LOCK TABLES `donor` WRITE;
/*!40000 ALTER TABLE `donor` DISABLE KEYS */;
INSERT INTO `donor` VALUES ('D0001','981201-04-43','Lim Qing Ting','Jalan Puteri Hang Li Poh, Kampung Durian Daun','75100','Alor Gajah','Melaka','011-1700 08','F','A','+',58.00,'Y'),('D0002','010722-01-11','Nurul Huda Binti Noh Hairul','Jalan Wayang, Kampung Seri Lalang','81900','Kota Tinggi','Johor','017-681 487','F','AB','+',49.00,'Y'),('D0003','070619-10-24','Choong Kai Wen','10th Floor, Surian Tower 1, Jalan PJU 7, Mutiara Damansara','47810','Petaling Jaya','Selangor','014-767 551','F','A','+',35.00,'N'),('D0004','840505-06-30','Muthu a/l Balachandran','Taman Anggerik Heights Utama, Kampung Marong','28700','Bentong','Pahang','012-305 405','M','B','+',67.00,'Y'),('D0005','031116-07-06','Yussuf bin Saiful Abdullah','Islam Global, 70, Lorong Mahsuri 10, Bayan Baru','11900','Bayan Lepas','Pulau Pinang','018-765 863','M','O','+',41.00,'N'),('D0006','780411-04-51','Shalini a/p Anbuselvan','No.1, Bt 15, Air Merbau','77200','Jasin','Melaka','011-2824 26','F','AB','-',52.00,'Y'),('D0007','560131-11-33','Ahmad Aydin Bin Nur Irffan','No.2, Stadium Sultan Ismail, Jalan Sultan Ismail','20000','Kuala Terenggan','Terengganu','016-735 377','M','B','+',60.00,'N'),('D0008','640920-03-82','Stephen Chow','C1-12-19, No.4441, Blok Pasir Puteh, Kampung Ayer Lanas','15200','Ayer Lanas','Kelantan','011-3049 40','M','B','+',73.00,'Y'),('D0009','810628-01-73','Tamilarasi a/p Vishnu','24, Jalan Muar, Bukit Bakri','84000','Muar','Johor','012-218 078','F','A','+',62.00,'Y'),('D0010','921229-12-97','Low Jun Rui','14-16, Lorong Seri Borneo 1, Taman Seri Borneo','88450','Kota Kinabalu','Sabah','019-838 976','M','O','-',63.00,'Y');
/*!40000 ALTER TABLE `donor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospital`
--

DROP TABLE IF EXISTS `hospital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hospital` (
  `Hos_ID` varchar(5) NOT NULL,
  `Hos_Address` varchar(50) DEFAULT NULL,
  `Hos_Postcode` char(5) DEFAULT NULL,
  `Hos_State` varchar(15) NOT NULL,
  `Hos_Phone` char(11) NOT NULL,
  `Hos_Name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Hos_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospital`
--

LOCK TABLES `hospital` WRITE;
/*!40000 ALTER TABLE `hospital` DISABLE KEYS */;
INSERT INTO `hospital` VALUES ('H0001','No 3, Mahkota Melaka, Jln Merdeka','75000','Melaka','06-9543331','Mahkota Medical Centre'),('H0002','No. 2418-1, KM 8, Lebuh Ayer Keroh, Ayer Keroh','75450','Melaka','06-2549976','Pantai Hospital'),('H0003','lot 25, Jalan Raja Muda Abdul Aziz, Kampung Baru','50300','Kuala Lumpur','03-2249983','Hospital Tunku Azizah'),('H0004','Jalan Mewah Utara, Taman Pandan Mewah, Ampang','68000','Selangor','03-5431273','Ampang Hospital'),('H0005','238, Jalan Macalister, George Town','10400','Pulau Pinang','04-2388888','Loh Guan Lye Specialists Centre');
/*!40000 ALTER TABLE `hospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipient`
--

DROP TABLE IF EXISTS `recipient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipient` (
  `Reci_ID` varchar(5) NOT NULL,
  `Reci_Name` varchar(70) NOT NULL,
  `Reci_Age` int(11) NOT NULL,
  `Reci_Phone` char(11) DEFAULT NULL,
  `Reci_Gender` char(1) DEFAULT NULL,
  `Reci_Bloodtype` char(2) NOT NULL,
  `Reci_BAmt` int(11) NOT NULL,
  `Received_Date` date NOT NULL,
  `Hos_ID` varchar(5) NOT NULL,
  PRIMARY KEY (`Reci_ID`),
  KEY `Hos_ID` (`Hos_ID`),
  CONSTRAINT `recipient_ibfk_1` FOREIGN KEY (`Hos_ID`) REFERENCES `hospital` (`Hos_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipient`
--

LOCK TABLES `recipient` WRITE;
/*!40000 ALTER TABLE `recipient` DISABLE KEYS */;
INSERT INTO `recipient` VALUES ('R0001','Chong Bi Wei',20,'016-2136461','F','A',200,'2022-06-02','H0001'),('R0002','Edward Lim',45,'012-9150782','M','O',300,'2023-01-02','H0002'),('R0003','Frankie Ngai Qin Feng',22,'012-2830788','M','B',250,'2022-11-13','H0003'),('R0004','Kaylynn Huang Kai Lyn',33,'012-9733895','F','AB',400,'2022-12-23','H0004'),('R0005','Wong Li Jing',66,'011-3092317','F','B',450,'2022-03-22','H0005'),('R0006','Samuel Ho Jia Jun',57,'010-9822927','M','A',200,'2023-01-19','H0001'),('R0007','Ubean Tock',71,'011-1679979','M','O',400,'2022-12-31','H0002'),('R0008','Violet Liew',39,'018-3178085','F','AB',350,'2022-09-05','H0002'),('R0009','Edison Wong Jia Qun',68,'018-3881595','M','B',220,'2023-01-09','H0004'),('R0010','Priscilla Goh Xuan Hui',49,'011-635-521','F','B',500,'2022-05-17','H0005');
/*!40000 ALTER TABLE `recipient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request_details`
--

DROP TABLE IF EXISTS `request_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request_details` (
  `Blood_ID` varchar(5) NOT NULL,
  `Hos_ID` varchar(5) NOT NULL,
  `Request_Quantity` int(11) NOT NULL,
  `Date_Lupdate` date DEFAULT NULL,
  PRIMARY KEY (`Blood_ID`,`Hos_ID`),
  KEY `Hos_ID` (`Hos_ID`),
  CONSTRAINT `request_details_ibfk_1` FOREIGN KEY (`Blood_ID`) REFERENCES `bloodbank` (`Blood_ID`),
  CONSTRAINT `request_details_ibfk_2` FOREIGN KEY (`Hos_ID`) REFERENCES `hospital` (`Hos_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_details`
--

LOCK TABLES `request_details` WRITE;
/*!40000 ALTER TABLE `request_details` DISABLE KEYS */;
INSERT INTO `request_details` VALUES ('BL001','H0001',10,'2023-01-16'),('BL001','H0002',5,'2023-01-18'),('BL003','H0001',8,'2023-01-16'),('BL003','H0005',20,'2023-01-24'),('BL005','H0003',7,'2023-01-20'),('BL005','H0004',15,'2023-01-22');
/*!40000 ALTER TABLE `request_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff` (
  `Staff_ID` varchar(5) NOT NULL,
  `Staff_Name` varchar(70) DEFAULT NULL,
  `Staff_Position` varchar(5) DEFAULT NULL,
  `Staff_Address` varchar(30) DEFAULT NULL,
  `Staff_Postcode` char(5) DEFAULT NULL,
  `Staff_City` varchar(15) DEFAULT NULL,
  `Staff_State` varchar(15) DEFAULT NULL,
  `Staff_Phone` char(12) DEFAULT NULL,
  `Staff_Gender` char(1) DEFAULT NULL,
  PRIMARY KEY (`Staff_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES ('S0001','Kane Lim','Admin','48,Jalan Merbok 1, Taman Bunga','70100','Seremban','Negeri Sembilan','011-23187905','F'),('S0002','Angeline Chuang May Teng','Admin','D-g7 pangsapuri , Emerald Resi','75450','Bukit Beruang','Melaka','017-6073331','F'),('S0003','Nicholas Chong Min Xuan','Admin','46, Jalan Dungun, Damansara He','50490','Maluri','Kuala Lumpur','014-7362823','M'),('S0004','Chew Zi Quan','Staff','37, Jeremy Bukit Batu Bakri','84000','Muar','Johor','011-15115516','M'),('S0005','Vivian Wee Sze Vian','Staff','Pangsaburi Mutiara Subang, Jal','40150','Shah Alam','Selangor','011-10760923','F'),('S0006','Nicole Cheock Pui Yee','Staff','48, Jalan Pantai Halban, Banda','06000','Jitra','Kedah','017-2923811','F'),('S0007','Aisyah Binti Hurul Ainis','Staff','283, Jalan Bukit Jambul, Burit','11900','Bayan Lepas','Pulau Penang','012-6083968','F'),('S0008','Yugathasini A/P parvin','Staff','2, Jalan Tanjung Damai 2, Ping','31250','Tanjung Rambuta','Perak','016-2136461','F'),('S0009','Pee Jia Rou','Staff','9,Jalan Simpang 3, Taman Simpa','93514','Kuching','Sarawak','016-7359247','F'),('S0010','Joseph Yeo','Admin','3, Lorong Aman,Taman Aman','91100','Lahad Datu','Sabah','016-9771998','M');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-22 14:59:01
