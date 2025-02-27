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
-- Table structure for table `dim_customers`
--

DROP TABLE IF EXISTS `dim_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dim_customers` (
  `customer_id` char(5) NOT NULL,
  `customer_name` varchar(40) DEFAULT NULL,
  `city` varchar(15) DEFAULT NULL,
  `region` varchar(15) DEFAULT NULL,
  `country` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dim_customers`
--

LOCK TABLES `dim_customers` WRITE;
/*!40000 ALTER TABLE `dim_customers` DISABLE KEYS */;
INSERT INTO `dim_customers` VALUES ('ALFKI','Alfreds Futterkiste','Berlin',NULL,'Germany'),('ANATR','Ana Trujillo Emparedados y helados','México D.F.',NULL,'Mexico'),('ANTON','Antonio Moreno Taquería','México D.F.',NULL,'Mexico'),('AROUT','Around the Horn','London',NULL,'UK'),('BERGS','Berglunds snabbköp','Luleå',NULL,'Sweden'),('BLAUS','Blauer See Delikatessen','Mannheim',NULL,'Germany'),('BLONP','Blondesddsl père et fils','Strasbourg',NULL,'France'),('BOLID','Bólido Comidas preparadas','Madrid',NULL,'Spain'),('BONAP','Bon app\'','Marseille',NULL,'France'),('BOTTM','Bottom-Dollar Markets','Tsawassen','BC','Canada'),('BSBEV','B\'s Beverages','London',NULL,'UK'),('CACTU','Cactus Comidas para llevar','Buenos Aires',NULL,'Argentina'),('CENTC','Centro comercial Moctezuma','México D.F.',NULL,'Mexico'),('CHOPS','Chop-suey Chinese','Bern',NULL,'Switzerland'),('COMMI','Comércio Mineiro','Sao Paulo','SP','Brazil'),('CONSH','Consolidated Holdings','London',NULL,'UK'),('DRACD','Drachenblut Delikatessen','Aachen',NULL,'Germany'),('DUMON','Du monde entier','Nantes',NULL,'France'),('EASTC','Eastern Connection','London',NULL,'UK'),('ERNSH','Ernst Handel','Graz',NULL,'Austria'),('FAMIA','Familia Arquibaldo','Sao Paulo','SP','Brazil'),('FISSA','FISSA Fabrica Inter. Salchichas S.A.','Madrid',NULL,'Spain'),('FOLIG','Folies gourmandes','Lille',NULL,'France'),('FOLKO','Folk och fä HB','Bräcke',NULL,'Sweden'),('FRANK','Frankenversand','München',NULL,'Germany'),('FRANR','France restauration','Nantes',NULL,'France'),('FRANS','Franchi S.p.A.','Torino',NULL,'Italy'),('FURIB','Furia Bacalhau e Frutos do Mar','Lisboa',NULL,'Portugal'),('GALED','Galería del gastrónomo','Barcelona',NULL,'Spain'),('GODOS','Godos Cocina Típica','Sevilla',NULL,'Spain'),('GOURL','Gourmet Lanchonetes','Campinas','SP','Brazil'),('GREAL','Great Lakes Food Market','Eugene','OR','USA'),('GROSR','GROSELLA-Restaurante','Caracas','DF','Venezuela'),('HANAR','Hanari Carnes','Rio de Janeiro','RJ','Brazil'),('HILAA','HILARION-Abastos','San Cristóbal','Táchira','Venezuela'),('HUNGC','Hungry Coyote Import Store','Elgin','OR','USA'),('HUNGO','Hungry Owl All-Night Grocers','Cork','Co. Cork','Ireland'),('ISLAT','Island Trading','Cowes','Isle of Wight','UK'),('KOENE','Königlich Essen','Brandenburg',NULL,'Germany'),('LACOR','La corne d\'abondance','Versailles',NULL,'France'),('LAMAI','La maison d\'Asie','Toulouse',NULL,'France'),('LAUGB','Laughing Bacchus Wine Cellars','Vancouver','BC','Canada'),('LAZYK','Lazy K Kountry Store','Walla Walla','WA','USA'),('LEHMS','Lehmanns Marktstand','Frankfurt a.M.',NULL,'Germany'),('LETSS','Let\'s Stop N Shop','San Francisco','CA','USA'),('LILAS','LILA-Supermercado','Barquisimeto','Lara','Venezuela'),('LINOD','LINO-Delicateses','I. de Margarita','Nueva Esparta','Venezuela'),('LONEP','Lonesome Pine Restaurant','Portland','OR','USA'),('MAGAA','Magazzini Alimentari Riuniti','Bergamo',NULL,'Italy'),('MAISD','Maison Dewey','Bruxelles',NULL,'Belgium'),('MEREP','Mère Paillarde','Montréal','Québec','Canada'),('MORGK','Morgenstern Gesundkost','Leipzig',NULL,'Germany'),('NORTS','North/South','London',NULL,'UK'),('OCEAN','Océano Atlántico Ltda.','Buenos Aires',NULL,'Argentina'),('OLDWO','Old World Delicatessen','Anchorage','AK','USA'),('OTTIK','Ottilies Käseladen','Köln',NULL,'Germany'),('PARIS','Paris spécialités','Paris',NULL,'France'),('PERIC','Pericles Comidas clásicas','México D.F.',NULL,'Mexico'),('PICCO','Piccolo und mehr','Salzburg',NULL,'Austria'),('PRINI','Princesa Isabel Vinhos','Lisboa',NULL,'Portugal'),('QUEDE','Que Delícia','Rio de Janeiro','RJ','Brazil'),('QUEEN','Queen Cozinha','Sao Paulo','SP','Brazil'),('QUICK','QUICK-Stop','Cunewalde',NULL,'Germany'),('RANCH','Rancho grande','Buenos Aires',NULL,'Argentina'),('RATTC','Rattlesnake Canyon Grocery','Albuquerque','NM','USA'),('REGGC','Reggiani Caseifici','Reggio Emilia',NULL,'Italy'),('RICAR','Ricardo Adocicados','Rio de Janeiro','RJ','Brazil'),('RICSU','Richter Supermarkt','Genève',NULL,'Switzerland'),('ROMEY','Romero y tomillo','Madrid',NULL,'Spain'),('SANTG','Santé Gourmet','Stavern',NULL,'Norway'),('SAVEA','Save-a-lot Markets','Boise','ID','USA'),('SEVES','Seven Seas Imports','London',NULL,'UK'),('SIMOB','Simons bistro','Kobenhavn',NULL,'Denmark'),('SPECD','Spécialités du monde','Paris',NULL,'France'),('SPLIR','Split Rail Beer & Ale','Lander','WY','USA'),('SUPRD','Suprêmes délices','Charleroi',NULL,'Belgium'),('THEBI','The Big Cheese','Portland','OR','USA'),('THECR','The Cracker Box','Butte','MT','USA'),('TOMSP','Toms Spezialitäten','Münster',NULL,'Germany'),('TORTU','Tortuga Restaurante','México D.F.',NULL,'Mexico'),('TRADH','Tradição Hipermercados','Sao Paulo','SP','Brazil'),('TRAIH','Trail\'s Head Gourmet Provisioners','Kirkland','WA','USA'),('VAFFE','Vaffeljernet','Århus',NULL,'Denmark'),('VICTE','Victuailles en stock','Lyon',NULL,'France'),('VINET','Vins et alcools Chevalier','Reims',NULL,'France'),('WANDK','Die Wandernde Kuh','Stuttgart',NULL,'Germany'),('WARTH','Wartian Herkku','Oulu',NULL,'Finland'),('WELLI','Wellington Importadora','Resende','SP','Brazil'),('WHITC','White Clover Markets','Seattle','WA','USA'),('WILMK','Wilman Kala','Helsinki',NULL,'Finland'),('WOLZA','Wolski  Zajazd','Warszawa',NULL,'Poland');
/*!40000 ALTER TABLE `dim_customers` ENABLE KEYS */;
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
