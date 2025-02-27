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
-- Table structure for table `dim_products`
--

DROP TABLE IF EXISTS `dim_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_products` (
  `product_id` smallint NOT NULL,
  `product_name` varchar(40) NOT NULL,
  `supplier_id` smallint DEFAULT NULL,
  `category_id` smallint DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_products`
--

LOCK TABLES `dim_products` WRITE;
/*!40000 ALTER TABLE `dim_products` DISABLE KEYS */;
INSERT INTO `dim_products` VALUES (1,'Chai',8,1),(2,'Chang',1,1),(3,'Aniseed Syrup',1,2),(4,'Chef Anton\'s Cajun Seasoning',2,2),(5,'Chef Anton\'s Gumbo Mix',2,2),(6,'Grandma\'s Boysenberry Spread',3,2),(7,'Uncle Bob\'s Organic Dried Pears',3,7),(8,'Northwoods Cranberry Sauce',3,2),(9,'Mishi Kobe Niku',4,6),(10,'Ikura',4,8),(11,'Queso Cabrales',5,4),(12,'Queso Manchego La Pastora',5,4),(13,'Konbu',6,8),(14,'Tofu',6,7),(15,'Genen Shouyu',6,2),(16,'Pavlova',7,3),(17,'Alice Mutton',7,6),(18,'Carnarvon Tigers',7,8),(19,'Teatime Chocolate Biscuits',8,3),(20,'Sir Rodney\'s Marmalade',8,3),(21,'Sir Rodney\'s Scones',8,3),(22,'Gustaf\'s Knäckebröd',9,5),(23,'Tunnbröd',9,5),(24,'Guaraná Fantástica',10,1),(25,'NuNuCa Nuß-Nougat-Creme',11,3),(26,'Gumbär Gummibärchen',11,3),(27,'Schoggi Schokolade',11,3),(28,'Rössle Sauerkraut',12,7),(29,'Thüringer Rostbratwurst',12,6),(30,'Nord-Ost Matjeshering',13,8),(31,'Gorgonzola Telino',14,4),(32,'Mascarpone Fabioli',14,4),(33,'Geitost',15,4),(34,'Sasquatch Ale',16,1),(35,'Steeleye Stout',16,1),(36,'Inlagd Sill',17,8),(37,'Gravad lax',17,8),(38,'Côte de Blaye',18,1),(39,'Chartreuse verte',18,1),(40,'Boston Crab Meat',19,8),(41,'Jack\'s New England Clam Chowder',19,8),(42,'Singaporean Hokkien Fried Mee',20,5),(43,'Ipoh Coffee',20,1),(44,'Gula Malacca',20,2),(45,'Rogede sild',21,8),(46,'Spegesild',21,8),(47,'Zaanse koeken',22,3),(48,'Chocolade',22,3),(49,'Maxilaku',23,3),(50,'Valkoinen suklaa',23,3),(51,'Manjimup Dried Apples',24,7),(52,'Filo Mix',24,5),(53,'Perth Pasties',24,6),(54,'Tourtière',25,6),(55,'Pâté chinois',25,6),(56,'Gnocchi di nonna Alice',26,5),(57,'Ravioli Angelo',26,5),(58,'Escargots de Bourgogne',27,8),(59,'Raclette Courdavault',28,4),(60,'Camembert Pierrot',28,4),(61,'Sirop d\'érable',29,2),(62,'Tarte au sucre',29,3),(63,'Vegie-spread',7,2),(64,'Wimmers gute Semmelknödel',12,5),(65,'Louisiana Fiery Hot Pepper Sauce',2,2),(66,'Louisiana Hot Spiced Okra',2,2),(67,'Laughing Lumberjack Lager',16,1),(68,'Scottish Longbreads',8,3),(69,'Gudbrandsdalsost',15,4),(70,'Outback Lager',7,1),(71,'Flotemysost',15,4),(72,'Mozzarella di Giovanni',14,4),(73,'Röd Kaviar',17,8),(74,'Longlife Tofu',4,7),(75,'Rhönbräu Klosterbier',12,1),(76,'Lakkalikööri',23,1),(77,'Original Frankfurter grüne Soße',12,2);
/*!40000 ALTER TABLE `dim_products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-24  1:20:18
