CREATE DATABASE  IF NOT EXISTS `inventory` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `inventory`;


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
-- Table structure for table `currentstock`
--

DROP TABLE IF EXISTS `currentstock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currentstock` (
  `productcode` varchar(45) NOT NULL,
  `quantity` int NOT NULL,
	foreign key (productcode) references products (productcode)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currentstock`
--

LOCK TABLES `currentstock` WRITE;
/*!40000 ALTER TABLE `currentstock` DISABLE KEYS */;
/*!40000 ALTER TABLE `currentstock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `customercode` varchar(45) NOT NULL,
  `fullname` varchar(45) NOT NULL,
  `location` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  PRIMARY KEY (`customercode`),
  UNIQUE KEY `cid_UNIQUE` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=307 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `pid` int NOT NULL AUTO_INCREMENT,
  `productcode` varchar(45) NOT NULL,
  `productname` varchar(45) NOT NULL,
  `costprice` double NOT NULL,
  `sellprice` double NOT NULL,
  `brand` varchar(45) NOT NULL,
  
  PRIMARY KEY (`productcode`),
  UNIQUE KEY `pid_UNIQUE` (`pid`)
  
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchaseinfo`
--

CREATE TABLE `purchaseinfo` (
  `purchaseID` int NOT NULL AUTO_INCREMENT,
  `suppliercode` varchar(45) NOT NULL,
  `productcode` varchar(45) NOT NULL,
  `date` varchar(45) NOT NULL,
  `quantity` int NOT NULL,
  `totalcost` double NOT NULL,
  PRIMARY KEY (`purchaseID`),
  foreign key (productcode) references products (productcode),
  foreign key (suppliercode) references suppliers (suppliercode)
)  ENGINE=InnoDB AUTO_INCREMENT=1012 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchaseinfo`
--

LOCK TABLES `purchaseinfo` WRITE;
/*!40000 ALTER TABLE `purchaseinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchaseinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesinfo`
--

DROP TABLE IF EXISTS `salesinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salesinfo` (
  `salesid` int NOT NULL AUTO_INCREMENT,
  `date` varchar(45) NOT NULL,
  `productcode` varchar(45) NOT NULL,
  `customercode` varchar(45) NOT NULL,
  `quantity` int NOT NULL,
  `revenue` double NOT NULL,
  `soldby` varchar(45) NOT NULL,
  foreign key (productcode) references products (productcode),
  foreign key (customercode) references customers (customercode),
  PRIMARY KEY (`salesid`)
) ENGINE=InnoDB AUTO_INCREMENT=2013 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesinfo`
--

LOCK TABLES `salesinfo` WRITE;
/*!40000 ALTER TABLE `salesinfo` DISABLE KEYS */;
INSERT INTO `salesinfo` VALUES (2001,'Fri Jan 16 23:12:40 IST 2021','prod1','vip1',3,270000,'stduser1'),(2002,'Fri Jan 16 23:12:40 IST 2021','prod2','vip2',2,144000,'stduser1'),(2003,'Fri Jan 16 23:12:40 IST 2021','prod3','std1',1,64000,'aduser1'),(2004,'Fri Jan 16 23:12:40 IST 2021','prod4','std2',5,255000,'aduser1'),(2006,'Thu Aug 05 17:29:36 IST 2021','prod1','vip1',2,180000,'root'),(2007,'Fri Aug 06 00:00:00 IST 2021','prod4','std1',1,51000,'aduser1'),(2008,'Fri Aug 06 02:41:28 IST 2021','prod7','std1',1,3500,'aduser1'),(2009,'Sat Aug 07 00:00:00 IST 2021','prod7','std1',5,17500,'aduser1'),(2010,'Thu Aug 12 00:00:00 IST 2021','prod4','vip3',2,102000,'root'),(2011,'Sun Aug 15 23:08:51 IST 2021','prod7','vip2',10,35000,'root'),(2012,'Thu Aug 26 15:17:48 IST 2021','prod4','vip3',5,255000,'aduser1');
/*!40000 ALTER TABLE `salesinfo` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `sid` int NOT NULL AUTO_INCREMENT,
  `suppliercode` varchar(45) NOT NULL,
  `fullname` varchar(45) NOT NULL,
  `location` varchar(45) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  PRIMARY KEY (`suppliercode`),
  UNIQUE KEY `sid_UNIQUE` (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=409 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;
 
--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `location` varchar(45) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(200) NOT NULL,
  `usertype` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;



-- DELIMITER $$		-- function to calculate total revenue for a product
-- CREATE FUNCTION CalculateTotalRevenue(productId VARCHAR(45)) RETURNS DOUBLE
-- READS SQL DATA
-- BEGIN
--   DECLARE totalRevenue DOUBLE;
--   SELECT SUM(revenue) INTO totalRevenue FROM salesinfo WHERE productcode = productId;
--   RETURN totalRevenue;
-- END$$
-- DELIMITER ;
-- select CalculateTotalRevenue ("a101");

-- DELIMITER $$		-- function to get product cost price
-- CREATE FUNCTION GetProductCostPrice(productId VARCHAR(45)) RETURNS DOUBLE
-- reads sql data
-- BEGIN
--   DECLARE costPrice int;
--   SELECT costprice INTO costPrice FROM products WHERE productcode = productId;
--   RETURN costPrice;
-- END$$
-- DELIMITER ;
-- SELECT GetProductCostPrice ("a102");


-- DELIMITER $$				-- function to check stock availability
-- CREATE FUNCTION CheckStockAvailability(productId VARCHAR(45)) RETURNS BOOLEAN
-- reads sql data
-- BEGIN
--   DECLARE stockQuantity INT;
--   SELECT quantity INTO stockQuantity FROM currentstock WHERE productcode = productId;
--   IF stockQuantity > 0 THEN
--     RETURN TRUE;
--   ELSE
--     RETURN FALSE;
--   END IF;
-- END$$
-- DELIMITER ;
-- select CheckStockAvailability ("a101");

-- DELIMITER $$
-- CREATE PROCEDURE AddNewProduct(
--   IN p_productcode VARCHAR(45),
--   IN p_productname VARCHAR(45),
--   IN p_costprice DOUBLE,
--   IN p_sellprice DOUBLE,
--   IN p_brand VARCHAR(45)
-- )
-- BEGIN
--   INSERT INTO products (productcode, productname, costprice, sellprice, brand)
--   VALUES (p_productcode, p_productname, p_costprice, p_sellprice, p_brand);
-- END$$
-- DELIMITER ;
-- CALL AddNewProduct('a105', 'Keyboard', 1600, 2000, 'Redgear');


-- DELIMITER $$
-- CREATE PROCEDURE UpdateCustomerLocation(
--   IN p_customercode VARCHAR(45),
--   IN p_newLocation VARCHAR(45)
-- )
-- BEGIN
--   UPDATE customers SET location = p_newLocation WHERE customercode = p_customercode;
-- END$$
-- DELIMITER ;
-- CALL UpdateCustomerLocation ("vip1","Vadodara");


-- DELIMITER $$
-- CREATE PROCEDURE DeleteSupplier(
--   IN p_suppliercode VARCHAR(45)
-- )
-- BEGIN
--   DELETE FROM suppliers WHERE suppliercode = p_suppliercode;
-- END$$
-- DELIMITER ;
-- CALL DeleteSupplier ("s105");

-- DELIMITER $$
-- CREATE TRIGGER UpdateCurrentStockOnSale
-- AFTER INSERT ON salesinfo
-- FOR EACH ROW
-- BEGIN
--   UPDATE currentstock
--   SET quantity = quantity - NEW.quantity
--   WHERE productcode = NEW.productcode;
-- END$$
-- DELIMITER ;

-- DELIMITER $$
-- CREATE TRIGGER UpdateTotalCostOnPurchase
-- AFTER INSERT ON purchaseinfo
-- FOR EACH ROW
-- BEGIN
--   UPDATE purchaseinfo
--   SET totalcost = NEW.quantity * GetProductCostPrice(NEW.productcode)
--   WHERE purchaseID = NEW.purchaseID;
-- END$$
-- DELIMITER ;

-- DELIMITER $$
-- CREATE TRIGGER LogUserActivityOnSales
-- AFTER INSERT ON salesinfo
-- FOR EACH ROW
-- BEGIN
--   INSERT INTO user_activity (activity_timestamp, activity_description)
--   VALUES (NOW(), CONCAT('New sales record added by ', NEW.soldby));
-- END$$
-- DELIMITER ;

select * from currentstock;