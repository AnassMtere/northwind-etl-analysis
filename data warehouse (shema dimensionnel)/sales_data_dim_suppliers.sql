-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: sales_data
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `dim_suppliers`
--

DROP TABLE IF EXISTS `dim_suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_suppliers` (
  `supplier_id` int NOT NULL,
  `supplier_name` varchar(40) DEFAULT NULL,
  `region` varchar(8) DEFAULT NULL,
  `product_type` varchar(14) DEFAULT NULL,
  `service_region` varchar(6) DEFAULT NULL,
  `reliability_score` float(3,2) DEFAULT NULL,
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_suppliers`
--

LOCK TABLES `dim_suppliers` WRITE;
/*!40000 ALTER TABLE `dim_suppliers` DISABLE KEYS */;
INSERT INTO `dim_suppliers` VALUES (1,'Exotic Liquids','N/A','Beverages','Europe',4.50),(2,'New Orleans Cajun Delights','LA','Spices','USA',4.00),(3,'Grandma Kelly\'s Homestead','MI','Dairy Products','Asia',4.80),(4,'Tokyo Traders','N/A','Seafood','Europe',4.20),(5,'Cooperativa de Quesos \'Las Cabras\'','Asturias','Cheese','USA',4.70),(6,'Mayumi\'s','N/A','Beverages','Europe',4.50),(7,'Pavlova, Ltd.','Victoria','Spices','USA',4.00),(8,'Specialty Biscuits, Ltd.','N/A','Dairy Products','Asia',4.80),(9,'PB Knäckebröd AB','N/A','Seafood','Europe',4.20),(10,'Refrescos Americanas LTDA','N/A','Cheese','USA',4.70),(11,'Heli Süßwaren GmbH & Co. KG','N/A','Beverages','Europe',4.50),(12,'Plutzer Lebensmittelgroßmärkte AG','N/A','Spices','USA',4.00),(13,'Nord-Ost-Fisch Handelsgesellschaft mbH','N/A','Dairy Products','Asia',4.80),(14,'Formaggi Fortini s.r.l.','N/A','Seafood','Europe',4.20),(15,'Norske Meierier','N/A','Cheese','USA',4.70),(16,'Bigfoot Breweries','OR','Beverages','Europe',4.50),(17,'Svensk Sjöföda AB','N/A','Spices','USA',4.00),(18,'Aux joyeux ecclésiastiques','N/A','Dairy Products','Asia',4.80),(19,'New England Seafood Cannery','MA','Seafood','Europe',4.20),(20,'Leka Trading','N/A','Cheese','USA',4.70),(21,'Lyngbysild','N/A','Beverages','Europe',4.50),(22,'Zaanse Snoepfabriek','N/A','Spices','USA',4.00),(23,'Karkki Oy','N/A','Dairy Products','Asia',4.80),(24,'G\'day, Mate','NSW','Seafood','Europe',4.20),(25,'Ma Maison','Québec','Cheese','USA',4.70),(26,'Pasta Buttini s.r.l.','N/A','Beverages','Europe',4.50),(27,'Escargots Nouveaux','N/A','Spices','USA',4.00),(28,'Gai pâturage','N/A','Dairy Products','Asia',4.80),(29,'Forêts d\'érables','Québec','Seafood','Europe',4.20);
/*!40000 ALTER TABLE `dim_suppliers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-24  1:20:17
