CREATE DATABASE motorcycleshop;
use motorcycleshop;

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

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `idcustomer` int NOT NULL,
  `customer_name` varchar(45) DEFAULT NULL,
  `customer_address` varchar(65) DEFAULT NULL,
  `customer_phone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcustomer`),
  UNIQUE KEY `idcustomer_UNIQUE` (`idcustomer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Михайлов Максим','Самара, ул. Московское шоссе, д.4','8(943)080-13-00'),(2,'Прокопов Всеволод','Самара, ул. Солнечная, д.45','8(889)746-12-71'),(3,'Илюхин Евгений','Самара, ул. галактионовская, д.224','8(927)977-88-91'),(4,'Едавкин Степан','Самара, ул. Революционная, д.42','8(929)341-57-96'),(5,'Иванов Иван','Самара, ул. Гагаринская, д.15','8(927)903-80-47'),(6,'Петров Михаил','Самара, ул. Шольца, д. 12','8(817)984-14-10'),(7,'Михайлов Петр','Самара, ул. Гая, д.43','8(929)011-40-18'),(8,'Карпов Анатолий','Самара, ул. Авроры, д.127д','8(999)992-40-76'),(9,'Корнеев Корней','Самара, ул. Киевская, д.4','8(927)863-90-30'),(10,'Корнеев Алексей',NULL,'8(917)740-15-77');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

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
-- Table structure for table `type_of_delivery`
--

DROP TABLE IF EXISTS `type_of_delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type_of_delivery` (
  `idtype_of_delivery` int NOT NULL,
  `name_of_type` varchar(45) DEFAULT NULL,
  `delivery_iddelivery` int NOT NULL,
  `type_of_delivery_price` int DEFAULT NULL,
  PRIMARY KEY (`idtype_of_delivery`),
  KEY `fk_type_of_delivery_delivery1_idx` (`delivery_iddelivery`),
  CONSTRAINT `fk_type_of_delivery_delivery1` FOREIGN KEY (`delivery_iddelivery`) REFERENCES `delivery` (`iddelivery`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_of_delivery`
--

LOCK TABLES `type_of_delivery` WRITE;
/*!40000 ALTER TABLE `type_of_delivery` DISABLE KEYS */;
INSERT INTO `type_of_delivery` VALUES (1,'Эконом',1,100),(2,'Комфорт',2,200),(3,'Бизнес',3,300),(4,'Экспресс',1,250),(5,'Бесплатная',1,0),(6,'VIP',2,500),(7,'Эконом+',3,150),(8,'Обычная',4,50),(9,'Специальная',5,150),(10,'Круиз',6,200);
/*!40000 ALTER TABLE `type_of_delivery` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

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
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery` (
  `iddelivery` int NOT NULL,
  `delivery_name` varchar(45) DEFAULT NULL,
  `delivery_phone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`iddelivery`),
  UNIQUE KEY `iddelivery_UNIQUE` (`iddelivery`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` VALUES (1,'СДЭК','8(927)485-19-38'),(2,'Яндекс.Курьер','8(905)587-79-02'),(3,'ОЗОН','8(927)022-26-18'),(4,'WildBerries','8(929)247-01-40'),(5,'KazanExpress','8(902)662-68-59'),(6,'Почта России','8(917)700-94-70'),(7,'Орлы Экспресс','8(929)566-15-21'),(8,'Голубиная почта','8(917)664-61-16'),(9,'Деловые линии','8(927)508-22-34'),(10,'Прямые маршруты','8(927)621-20-93');
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

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
-- Table structure for table `type_of_product`
--

DROP TABLE IF EXISTS `type_of_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type_of_product` (
  `idtype_of_product` int NOT NULL,
  `name_of_type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idtype_of_product`),
  UNIQUE KEY `idtype_of_product_UNIQUE` (`idtype_of_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_of_product`
--

LOCK TABLES `type_of_product` WRITE;
/*!40000 ALTER TABLE `type_of_product` DISABLE KEYS */;
INSERT INTO `type_of_product` VALUES (1,'Квадроциклы'),(2,'Гидроциклы'),(3,'Катеры'),(4,'Снегоходы'),(5,'Вездеходы'),(6,'Двигатели'),(7,'Запчасти'),(8,'Электроника'),(9,'Инструменты'),(10,'Аксессуары');
/*!40000 ALTER TABLE `type_of_product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

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
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `idproduct` int NOT NULL,
  `type_of_product_idtype_of_product` int NOT NULL,
  `product_price` int DEFAULT NULL,
  `product_brand` varchar(45) DEFAULT NULL,
  `product_model` varchar(45) DEFAULT NULL,
  `product_action` varchar(45) DEFAULT NULL,
  `product_power` int DEFAULT NULL,
  `product_count` int DEFAULT NULL,
  `product_image` varchar(100) DEFAULT NULL,
  `product_date` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`idproduct`),
  UNIQUE KEY `idproduct_UNIQUE` (`idproduct`),
  KEY `fk_product_type_of_product_idx` (`type_of_product_idtype_of_product`),
  CONSTRAINT `fk_product_type_of_product` FOREIGN KEY (`type_of_product_idtype_of_product`) REFERENCES `type_of_product` (`idtype_of_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,1,1049500,'BRP','EarthDoo GTI','Hit',130,9,'./img/icons/category-card/quadro.png','2021'),(2,1,1100000,'BRP','EarthDoo GTR','Sale',155,5,'./img/icons/category-card/quadro.png','2022'),(3,1,1000000,'Spark3','EarthDoo GTI','New',90,4,'./img/icons/category-card/quadro.png','2023'),(4,2,1100475,'BRP','SeaDoo GTX',NULL,155,3,'./img/icons/category-card/hydrocycle.png','2020'),(5,2,1323700,'Spark2','SeaDoo GTS',NULL,125,1,'./img/icons/category-card/hydrocycle.png','2021'),(6,10,9800,NULL,'Рюкзак водонепроницаемый','New',NULL,10,'./img/cards/backpack.png','2021'),(7,4,1229711,'Spark2','SnowDoo',NULL,150,0,'./img/icons/category-card/snowmobile.png','2022'),(8,5,587440,'Spark3','EveryDoo','Sale',100,10,'./img/icons/category-card/rover.png','2023'),(9,6,50000,'Suzuki','Df9.9BRS',NULL,155,0,'./img/icons/category-card/motor.png','2023'),(10,7,25000,'SeaWater','Аудио-система','Hit',NULL,5,'./img/cards/audio_portable_system.png','2022');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

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
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `product_idproduct` int NOT NULL,
  `customer_idcustomer` int NOT NULL,
  `delivery_iddelivery` int NOT NULL,
  `order_comment` varchar(45) DEFAULT NULL,
  `order_date` datetime DEFAULT NULL,
  `idorder` int NOT NULL,
  PRIMARY KEY (`idorder`),
  KEY `fk_order_product1_idx` (`product_idproduct`),
  KEY `fk_order_customer2_idx` (`customer_idcustomer`),
  KEY `fk_order_delivery1_idx` (`delivery_iddelivery`),
  CONSTRAINT `fk_order_customer2` FOREIGN KEY (`customer_idcustomer`) REFERENCES `customer` (`idcustomer`),
  CONSTRAINT `fk_order_delivery1` FOREIGN KEY (`delivery_iddelivery`) REFERENCES `delivery` (`iddelivery`),
  CONSTRAINT `fk_order_product1` FOREIGN KEY (`product_idproduct`) REFERENCES `product` (`idproduct`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,1,1,'Позвоните перед доставкой 8(929)718-14-37','2023-03-03 00:00:00',0),(2,2,1,'','2023-03-02 00:00:00',1),(3,3,2,'Постучите в дверь','2023-02-04 00:00:00',2),(3,4,2,'Замените двигатель на более мощный','2023-06-01 00:00:00',3),(4,5,3,NULL,'2023-05-08 00:00:00',4),(5,6,4,'Добавьте аудио-систему','2023-04-16 00:00:00',5),(6,7,5,NULL,'2023-05-14 00:00:00',6),(6,8,6,NULL,'2023-05-31 00:00:00',7);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

CREATE TRIGGER customer_auto_inc BEFORE INSERT ON customer FOR EACH ROW
SET NEW.idcustomer = (
SELECT MAX(idcustomer)
FROM customer
) + 1 ;

CREATE TRIGGER order_auto_inc BEFORE INSERT ON motorcycleshop.order FOR EACH ROW
SET NEW.idorder = (
SELECT MAX(idorder)
FROM motorcycleshop.order
) + 1 ;

DELIMITER //
CREATE TRIGGER drop_duplication BEFORE INSERT
ON customer FOR EACH ROW
IF new.customer_name IN (SELECT customer_name FROM customer)
AND new.customer_address IN (SELECT customer_address FROM customer)
AND new.customer_phone IN (SELECT customer_phone FROM customer) THEN
 SIGNAL SQLSTATE '45000';
END IF//
DELIMITER ;

CREATE TRIGGER product_minus_trigger AFTER INSERT ON motorcycleshop.order FOR EACH ROW
UPDATE product SET product_count = product_count - 1
WHERE idproduct = new.product_idproduct;