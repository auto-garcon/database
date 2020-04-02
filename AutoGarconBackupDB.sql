CREATE DATABASE  IF NOT EXISTS `AutoGarcon` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `AutoGarcon`;
-- MySQL dump 10.13  Distrib 8.0.19, for macos10.15 (x86_64)
--
-- Host: auto-garcon-database.cd4hzqa9i8mi.us-east-1.rds.amazonaws.com    Database: AutoGarcon
-- ------------------------------------------------------
-- Server version	8.0.16

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `ItemHasOptions`
--

DROP TABLE IF EXISTS `ItemHasOptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ItemHasOptions` (
  `itemOptionID` int(11) NOT NULL AUTO_INCREMENT,
  `itemID` int(11) DEFAULT NULL,
  `optionID` int(11) DEFAULT NULL,
  PRIMARY KEY (`itemOptionID`),
  KEY `ItemHasOptions_ibfk_1_idx` (`itemID`),
  KEY `ItemHasOptions_ibfk_2_idx` (`optionID`),
  CONSTRAINT `ItemHasOptions_ibfk_1` FOREIGN KEY (`itemID`) REFERENCES `MenuItem` (`itemID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ItemHasOptions_ibfk_2` FOREIGN KEY (`optionID`) REFERENCES `Options` (`optionID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ItemHasOptions`
--

LOCK TABLES `ItemHasOptions` WRITE;
/*!40000 ALTER TABLE `ItemHasOptions` DISABLE KEYS */;
INSERT INTO `ItemHasOptions` VALUES (1,27,1),(2,27,2),(3,27,3),(4,28,1),(5,28,2),(6,28,3),(7,29,1),(8,29,2),(9,29,3),(10,30,1),(11,30,2),(12,30,3);
/*!40000 ALTER TABLE `ItemHasOptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ItemHasSides`
--

DROP TABLE IF EXISTS `ItemHasSides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ItemHasSides` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menuItemID` int(11) NOT NULL,
  `sideItemID` int(11) NOT NULL,
  `additionalPrice` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `menuItemID_index` (`menuItemID`),
  KEY `sideItemID` (`sideItemID`),
  CONSTRAINT `ItemHasSides_ibfk_1` FOREIGN KEY (`menuItemID`) REFERENCES `MenuItem` (`itemID`) ON DELETE CASCADE,
  CONSTRAINT `ItemHasSides_ibfk_2` FOREIGN KEY (`sideItemID`) REFERENCES `MenuItem` (`itemID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ItemHasSides`
--

LOCK TABLES `ItemHasSides` WRITE;
/*!40000 ALTER TABLE `ItemHasSides` DISABLE KEYS */;
INSERT INTO `ItemHasSides` VALUES (1,35,56,0.00),(2,35,57,0.00),(3,35,58,1.50),(4,35,59,2.50),(5,27,56,0.00),(6,27,57,0.00),(7,28,56,0.00),(8,28,57,0.00),(9,29,58,1.50),(10,29,59,2.50),(11,30,56,0.00),(12,30,57,0.00),(13,31,56,0.00),(14,31,57,0.00),(15,32,56,0.00),(16,32,57,0.00),(17,33,56,0.00),(18,33,57,0.00),(19,34,56,0.00),(20,34,57,0.00);
/*!40000 ALTER TABLE `ItemHasSides` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Menu`
--

DROP TABLE IF EXISTS `Menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Menu` (
  `menuID` int(11) NOT NULL AUTO_INCREMENT,
  `menuStatus` tinyint(1) DEFAULT '1',
  `menuName` varchar(100) DEFAULT NULL,
  `restaurantID` int(11) DEFAULT NULL,
  PRIMARY KEY (`menuID`),
  UNIQUE KEY `menuID_UNIQUE` (`menuID`),
  KEY `restaurantId_idx` (`restaurantID`),
  CONSTRAINT `restaurantId` FOREIGN KEY (`restaurantID`) REFERENCES `Restaurant` (`restaurantId`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Menu`
--

LOCK TABLES `Menu` WRITE;
/*!40000 ALTER TABLE `Menu` DISABLE KEYS */;
INSERT INTO `Menu` VALUES (7,1,'Red Cow Lunch',5),(8,1,'Red Cow Happy Hour',5),(9,1,'Scooters Menu',1),(10,1,'Chipotle Menu',3),(11,1,'Khao Hom Lunch',2),(12,1,'Khao Hom Dinner',2),(13,1,'Roti Lunch Menu',2),(14,1,'Roti Dinner Menu',2),(15,1,'Roti Happy Hour Selections',2),(32,0,'Burgers',5),(48,0,'Dinner',5),(49,0,'Dinner',5);
/*!40000 ALTER TABLE `Menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MenuContains`
--

DROP TABLE IF EXISTS `MenuContains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MenuContains` (
  `menuID` int(11) DEFAULT NULL,
  `menuItemID` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `containsID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`containsID`),
  KEY `menuID_idx` (`menuID`),
  KEY `menuItemID_idx` (`menuItemID`),
  CONSTRAINT `MenuContains_ibfk_1` FOREIGN KEY (`menuID`) REFERENCES `Menu` (`menuID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `MenuContains_ibfk_2` FOREIGN KEY (`menuItemID`) REFERENCES `MenuItem` (`itemID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MenuContains`
--

LOCK TABLES `MenuContains` WRITE;
/*!40000 ALTER TABLE `MenuContains` DISABLE KEYS */;
INSERT INTO `MenuContains` VALUES (7,51,11.99,44),(7,54,6.50,47),(7,55,7.00,48),(8,1,4.50,49),(8,2,5.50,50),(8,3,5.25,51),(8,4,5.00,52),(8,5,5.00,53),(48,75,13.99,69),(48,76,11.29,70),(48,77,7.49,71),(48,78,8.99,72),(48,79,10.79,73),(48,80,10.99,74),(48,81,11.49,75),(48,82,15.29,76),(48,83,16.29,77),(48,84,14.99,78),(48,85,12.99,79),(48,86,13.99,80),(48,87,11.99,81),(48,88,12.99,82),(48,89,12.29,83),(48,90,15.99,84),(48,91,11.59,85),(48,92,11.59,86),(48,93,12.59,87),(48,94,11.89,88),(48,95,11.89,89),(49,96,13.99,90),(49,97,11.29,91),(49,98,7.49,92),(49,99,8.99,93),(49,100,10.79,94),(49,101,10.99,95),(49,102,11.49,96),(49,103,15.29,97),(49,104,16.29,98),(49,105,14.99,99),(49,106,12.99,100),(49,107,13.99,101),(49,108,11.99,102),(49,109,12.99,103),(49,110,12.29,104),(49,111,15.99,105),(49,112,11.59,106),(49,113,11.59,107),(49,114,12.59,108),(49,115,11.89,109),(49,116,11.89,110);
/*!40000 ALTER TABLE `MenuContains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MenuItem`
--

DROP TABLE IF EXISTS `MenuItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MenuItem` (
  `itemID` int(11) NOT NULL AUTO_INCREMENT,
  `itemName` varchar(100) NOT NULL,
  `description` text,
  `itemStatus` tinyint(1) NOT NULL DEFAULT '1',
  `calories` int(11) DEFAULT NULL,
  `category` varchar(100) NOT NULL,
  `gluten` tinyint(1) NOT NULL DEFAULT '0',
  `meat` tinyint(1) NOT NULL DEFAULT '0',
  `dairy` tinyint(1) NOT NULL DEFAULT '0',
  `nuts` tinyint(1) NOT NULL DEFAULT '0',
  `soy` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MenuItem`
--

LOCK TABLES `MenuItem` WRITE;
/*!40000 ALTER TABLE `MenuItem` DISABLE KEYS */;
INSERT INTO `MenuItem` VALUES (1,'French Fries','Crispy fries',1,400,'Appetizers',0,0,0,0,0),(2,'Traditional Tots','Classic potato tater tots',1,400,'Appetizers',0,0,0,0,0),(3,'Chicken Strips','Crispy chicken strips',1,800,'Appetizers',0,0,0,0,0),(4,'Cheese Curds','Little fried cheese balls',1,750,'Appetizers',0,0,0,0,0),(5,'Mozzarella Sticks','Good with marinara',1,750,'Appetizers',0,0,0,0,0),(6,'Grilled Cheese','Rosemary Bread with your choice of cheese',1,850,'Paninis',0,0,0,0,0),(7,'Chicken Avocado','Rosemary Bread, Chicken, Gouda, Avocado Mayo, Spinach',1,825,'Paninis',0,0,0,0,0),(8,'Curry Basil Leaved Fried Rice','Spicy*. Zesty red curry paste stir fried with Jasmine rice, egg, basil, onion, and bell peppers.\n',1,272,'Thai Fried Rice',0,0,0,0,0),(9,'Pad Thai','A staple of every Thai restaurant, Pad Thai is a stir fried rice noodle, tangy pad Thai sauce, egg, green onions, and bean sprouts served with crushed peanut and lime on the side.',1,1131,'Noodle Stir Fry',0,0,0,0,0),(10,'Rice Noodle  gluten free','Gluten Free* Thai classic street noodle soup, Goid-Tiou. Just like in Thailand, you get your choice of noodle and meat in this delightful and delicious Thai spice soup. All soup is served with bean sprouts, jalapeno, and sweet basil.',1,192,'Noodle Soup',0,0,0,0,0),(11,'Thai Fried Rice','Thai Jasmine rice blended with egg, onions, tomatoes, and scallions.',1,137,'Lunch Specials',0,0,0,0,0),(12,' Red Curry','Gluten Free* *Spicy* Red curry paste, coconut milk, egg plant, bell peppers, bamboo shoots, lime leaves, and basil. Served with rice.',1,441,'Lunch Specials',0,0,0,0,0),(13,'Green Curry','Gluten Free* *Spicy* Green curry paste, coconut milk, egg plant, bell peppers, bamboo shoots, lime leaves, and basil. Served with rice.',1,310,'Lunch Specials',0,0,0,0,0),(14,'Pad Ruom Mid','Stir fried seasonal vegetables in our soy based sauce.\n',1,547,'Lunch Specials',0,0,0,0,0),(15,'Noodle Soup','*Gluten Free* One of Thailand’s favorite street food. Rice noodles in a rich clear broth served with bean sprouts, lime, jalapeno, and sweet basil.',1,120,'Lunch Specials',0,0,0,0,0),(16,'California Burger','Burger topped with lettuce, tomato, onion and mayonaise',1,850,'Burgers',0,0,0,0,0),(17,'Flame Thrower Burger','Spicy burger with sauteed onions and jalepenos topped with ghost pepper cheese and sriracha mayo',1,1000,'Burgers',0,0,0,0,0),(18,'Pretzel Bites','Bavarian pretzel bites served with hot queso dip',1,400,'Starters',0,0,0,0,0),(19,'Frickles','Seasoned and deep friend pickle spears servedwith ranch or jalapeno ranch',1,350,'Starters',0,0,0,0,0),(20,'Chicken Club','Crispy or grilled chicken breast topped with honey mustard on a toated bun',1,610,'Sandwiches',0,0,0,0,0),(21,'The Galaxy','Pepperoni, sausage, mushroom, onions and green pepper pizza',1,1500,'Moon Pizzas',0,0,0,0,0),(22,'Midnight Munchies','Garlic butter bites and mozzarella served with pizza sauce for dipping',1,740,'Moon Pizzas',0,0,0,0,0),(23,'Grilled Salmon','6oz Keta salmon filt wild caught from Alaska and served with a dill butter sauce',1,630,'Entrees',0,0,0,0,0),(24,'Redhook Battered Shrimp','Beer battered tail-off shrimp served with cocktail or tartar sauce and lemon wedge',1,580,'',0,0,0,0,0),(25,'Yum Neua','Spicy* Grilled beef, tomatoes, cucumbers, lettuce, onions, and cilantro in spicy lime herb dressing.',1,490,'Salad',0,0,0,0,0),(26,'Fried Ice Cream','Crispy breading on the outside with creamy ice cream inside.',1,450,'',0,0,0,0,0),(27,'Ultimate','CAB® burger, wisconsin aged cheddar, iceberg lettuce, tomato, onion & Red Cow sauce',1,750,'Burgers',0,1,1,0,0),(28,'Barcelona','CAB® burger, manchego, prosciutto, piquillo pepper & smoked aioli',1,750,'Burgers',0,1,1,0,0),(29,'60/40','60% CAB® & 40% ground bacon patty, wisconsin aged cheddar, beer mustard and candied bacon',1,750,'Burgers',0,1,1,0,0),(30,'Blues Burger','CAB® burger, wisconsin blue cheese & apricot-rosemary black pepper jam',1,750,'Burgers',0,1,1,0,0),(31,'Patty Melt','CAB* burger, caramelized onion, sharp cheddar, white american & garlic mayo',1,750,'Burgers',0,1,1,0,0),(32,'Breakfast','CAB® burger, peanut butter, over-easy egg, bacon & wisconsin aged cheddar on sourdough',1,750,'Burgers',0,1,1,0,0),(33,'Cowboy','CAB® burger, wisconsin aged cheddar, root beer pulled pork, onion rings, BBQ sauce',0,750,'Burgers',0,1,1,0,0),(34,'Mushroom-Swiss','CAB® burger, merlot mushrooms, garlic mayo & swiss cheese',0,750,'Burgers',0,1,1,0,0),(35,'Manhattan 2.0','double patty, bacon confit, Gruyere, arugula & dried cherry-red wine chutney, pretzel bun',1,750,'Red Cow Grind',1,1,1,0,0),(36,'Double Barrel Burger','double patty, white american, grilled onion & special sauce',1,750,'Red Cow Grind',1,1,1,0,0),(37,'Quarter Pounder','single patty, yellow american, ketchup, mustard, house pickles',1,750,'Red Cow Grind',1,1,1,0,0),(38,'Tennessee Hot Chicken','southern fried chicken, tennessee hot sauce, blackstrap mayo, house pickles',1,750,'Sandwiches',1,1,1,0,0),(39,'Reuben','kraut, russian aioli, muenster, fresh dill, pumpernickel\nveggie (beets)',1,750,'Sandwiches',0,1,1,0,0),(40,'Salmon','responsibly sourced grilled salmon, lemon-herb mayo, greens, whole wheat bun $14.50',1,750,'Sandwiches',0,1,0,0,0),(41,'Buffalo Cauliflower','gluten-free breading, buffalo sauce, ranch',1,750,'Plant Based',0,0,0,0,0),(42,'So Cal Burger','impossible patty, avocado, american, garlic mayo, lettuce, tomato, onion, whole wheat bun',1,750,'Plant Based',0,0,1,0,0),(43,'Red Cow','organic mixed greens, crispy prosciutto, sunflower, pumpkin, and hemp seeds, shaved parmesan, balsamic vinaigrette',1,600,'Salads',0,1,1,1,0),(44,'Asian','cucumber, carrot, radish, peanuts, root vegetables, citrus-asian vinaigrette',1,550,'Salads',0,0,0,1,0),(45,'Taco','avocado, tinga chicken, queso fresco, tomato, onion, corn salsa, tortilla chips, greens, chipotle-parmesan dressing',1,750,'Salads',0,1,1,0,0),(46,'Beet & Quinoa Salad','roasted red and golden beets, arugula, quinoa, edamame, red peppers, garbanzos, balsamic vinaigrette, chevre',1,650,'Salads',0,1,0,1,0),(47,'Caesar','red & green romaine, garlic croutons, parmesan',1,700,'Salads',0,0,1,0,0),(51,'Chicken Sandwich','Amazing chicken sandwich on ciabatta',2,950,'Sandwiches',1,0,0,1,0),(54,'Standard Burger','The basic burger',1,750,'Burgers',1,1,1,0,0),(55,'Cheeseburger','The basic burger with cheese',1,800,'Burgers',1,1,1,0,0),(56,'French Fries','Delicious side of crispy fries',1,550,'Sides',1,0,0,0,0),(57,'Sweet Potato Fries','Delicious side of crispy sweet potato fries',1,500,'Sides',1,0,0,1,0),(58,'Onion Rings','Delicious side of crispy onion rings',1,520,'Sides',1,0,0,0,0),(59,'Cheese Curds','Delicious side of fresh Wisconsin cheese curds',1,650,'Sides',1,0,1,0,0),(60,'Burger','description',1,NULL,'custom',0,1,1,0,0),(61,'Tripple Dipper','Why choose one when you can choose three? Select three appetizers and enjoy! Served with dipping sauces.',1,NULL,'Appetizers',1,1,1,0,0),(62,'Southwestern Eggrolls','These aren’t your ordinary eggrolls. Crispy flour tortillas, chicken, black beans, corn, jalapeño Jack cheese, red peppers, spinach. Served with avocado-ranch.',1,NULL,'Appetizers',1,0,1,0,0),(63,'Skillet Queso','Your chip’s favorite dip for over 25 years. Original with beef. Served with chips & salsa.',1,NULL,'Appetizers',1,0,1,0,0),(64,'Fried Pickles','Served with house-made ranch.',1,NULL,'Appetizers',1,0,0,0,0),(65,'Queso Burger','This half-pound patty comes smothered in white queso, crunchy tortilla strips & pico.',1,NULL,'Burgers',1,1,1,0,0),(66,'Mushroom Swiss Burger','There’s so mush-room in our hearts for this one. Topped with sauteed onions, mushrooms, Swiss, lettuce, tomato & garlic aioli.',1,NULL,'Burgers',1,1,1,0,0),(67,'Southern Smokehouse Burger','Bacon, cheddar, pickles, Awesome Blossom Petals, lettuce, tomato, garlic aioli. Served with a side of original BBQ sauce.',1,NULL,'Burgers',1,1,1,0,0),(68,'Carnitas Fajitas','Pulled pork carnitas, grilled bell peppers & onions. Topped with a drizzle of mango-habanero sauce and green onions.',1,NULL,'Fajitas',1,1,1,0,0),(69,'Mushroom Jack Chicken Fajitas','Grilled chicken, sauteed mushrooms, crumbled bacon & mixed cheese.',1,NULL,'Fajitas',1,1,1,0,0),(70,'Black Bean & Veggie Fajitas','Black bean patty, roasted asparagus, sauteed mushrooms, corn & black bean salsa, queso fresco, avocado & a drizzle of spicy Santa Fe sauce.',1,NULL,'Fajitas',1,0,1,0,0),(71,'Cajun Chicken Pasta','Grilled chicken, penne in Alfredo sauce, topped with chile spices, Parmesan, tomatoes, green onions. Served with garlic toast.',1,NULL,'Chicken & Seafood',1,1,0,0,0),(72,'Cajun Shrimp Pasta','Shrimp, penne in Alfredo sauce, topped with chile spices, Parmesan, tomatoes, green onions. Served with garlic toast.',1,NULL,'Chicken & Seafood',1,1,0,0,0),(73,'Chipotle Chicken Fresh Mex Bowl','Grilled chicken, pico, field greens, Mexican rice, corn & black bean salsa, avocado, shredded cheese, tortilla strips, cilantro, chipotle pesto, house-made ranch.',1,NULL,'Chicken & Seafood',1,1,0,0,0),(74,'Chipotle Shrimp Fresh Mex Bowl','Shrimp, pico, field greens, Mexican rice, corn & black bean salsa, avocado, shredded cheese, tortilla strips, cilantro, chipotle pesto, house-made ranch.',1,NULL,'Chicken & Seafood',1,1,0,0,0),(75,'Tripple Dipper','Why choose one when you can choose three? Select three appetizers and enjoy! Served with dipping sauces.',1,NULL,'Appetizers',1,1,1,0,0),(76,'Southwestern Eggrolls','These aren’t your ordinary eggrolls. Crispy flour tortillas, chicken, black beans, corn, jalapeño Jack cheese, red peppers, spinach. Served with avocado-ranch.',1,NULL,'Appetizers',1,0,1,0,0),(77,'Skillet Queso','Your chip’s favorite dip for over 25 years. Original with beef. Served with chips & salsa.',1,NULL,'Appetizers',1,0,1,0,0),(78,'Fried Pickles','Served with house-made ranch.',1,NULL,'Appetizers',1,0,0,0,0),(79,'Queso Burger','This half-pound patty comes smothered in white queso, crunchy tortilla strips & pico.',1,NULL,'Burgers',1,1,1,0,0),(80,'Mushroom Swiss Burger','There’s so mush-room in our hearts for this one. Topped with sauteed onions, mushrooms, Swiss, lettuce, tomato & garlic aioli.',1,NULL,'Burgers',1,1,1,0,0),(81,'Southern Smokehouse Burger','Bacon, cheddar, pickles, Awesome Blossom Petals, lettuce, tomato, garlic aioli. Served with a side of original BBQ sauce.',1,NULL,'Burgers',1,1,1,0,0),(82,'Carnitas Fajitas','Pulled pork carnitas, grilled bell peppers & onions. Topped with a drizzle of mango-habanero sauce and green onions.',1,NULL,'Fajitas',1,1,1,0,0),(83,'Mushroom Jack Chicken Fajitas','Grilled chicken, sauteed mushrooms, crumbled bacon & mixed cheese.',1,NULL,'Fajitas',1,1,1,0,0),(84,'Black Bean & Veggie Fajitas','Black bean patty, roasted asparagus, sauteed mushrooms, corn & black bean salsa, queso fresco, avocado & a drizzle of spicy Santa Fe sauce.',1,NULL,'Fajitas',1,0,1,0,0),(85,'Cajun Chicken Pasta','Grilled chicken, penne in Alfredo sauce, topped with chile spices, Parmesan, tomatoes, green onions. Served with garlic toast.',1,NULL,'Chicken & Seafood',1,1,0,0,0),(86,'Cajun Shrimp Pasta','Shrimp, penne in Alfredo sauce, topped with chile spices, Parmesan, tomatoes, green onions. Served with garlic toast.',1,NULL,'Chicken & Seafood',1,1,0,0,0),(87,'Chipotle Chicken Fresh Mex Bowl','Grilled chicken, pico, field greens, Mexican rice, corn & black bean salsa, avocado, shredded cheese, tortilla strips, cilantro, chipotle pesto, house-made ranch.',1,NULL,'Chicken & Seafood',1,1,0,0,0),(88,'Chipotle Shrimp Fresh Mex Bowl','Shrimp, pico, field greens, Mexican rice, corn & black bean salsa, avocado, shredded cheese, tortilla strips, cilantro, chipotle pesto, house-made ranch.',1,NULL,'Chicken & Seafood',1,1,0,0,0),(89,'Spicy Shrimp Tacos','Three spicy chile-lime shrimp tacos in flour tortillas with pico, avocado, cilantro, coleslaw queso fresco. Served with Mexican rice & black beans.',1,NULL,'Chicken & Seafood',1,1,0,0,0),(90,'Ancho Salmon','Seared chile-rubbed Atlantic salmon, spicy citrus-chile sauce, cilantro, queso fresco. Served with Mexican rice & steamed broccoli.',1,NULL,'Chicken & Seafood',1,1,0,0,0),(91,'Crispy Chicken Crispers','Served with fries, corn on the cob and choice of honey-mustard, BBQ sauce or house-made ranch.',1,NULL,'Chicken Crispers',0,1,0,0,0),(92,'Crispy Honey-Chipotle Chicken Crispers','Served with fries, corn on the cob and ranch.',1,NULL,'Chicken Crispers',0,1,0,0,0),(93,'Honey-Chipotle Crispers® & Waffles','Crispers on top of Belgian waffles. Topped with bacon, jalapeños, ancho-chile ranch. Served with fries & honey-chipotle sauce.',1,NULL,'Chicken Crispers',1,1,1,0,0),(94,'Crispy Buffalo Bleu Crispers','Served with fries, corn on the cob and bleu cheese.',1,NULL,'Chicken Crispers',0,1,1,0,0),(95,'Crispy Mango-Habanero Crispers','Served with fries, corn on the cob and ranch.',1,NULL,'Chicken Crispers',0,1,0,0,0),(96,'Tripple Dipper','Why choose one when you can choose three? Select three appetizers and enjoy! Served with dipping sauces.',1,NULL,'Appetizers',1,1,1,0,0),(97,'Southwestern Eggrolls','These aren’t your ordinary eggrolls. Crispy flour tortillas, chicken, black beans, corn, jalapeño Jack cheese, red peppers, spinach. Served with avocado-ranch.',1,NULL,'Appetizers',1,0,1,0,0),(98,'Skillet Queso','Your chip’s favorite dip for over 25 years. Original with beef. Served with chips & salsa.',1,NULL,'Appetizers',1,0,1,0,0),(99,'Fried Pickles','Served with house-made ranch.',1,NULL,'Appetizers',1,0,0,0,0),(100,'Queso Burger','This half-pound patty comes smothered in white queso, crunchy tortilla strips & pico.',1,NULL,'Burgers',1,1,1,0,0),(101,'Mushroom Swiss Burger','There’s so mush-room in our hearts for this one. Topped with sauteed onions, mushrooms, Swiss, lettuce, tomato & garlic aioli.',1,NULL,'Burgers',1,1,1,0,0),(102,'Southern Smokehouse Burger','Bacon, cheddar, pickles, Awesome Blossom Petals, lettuce, tomato, garlic aioli. Served with a side of original BBQ sauce.',1,NULL,'Burgers',1,1,1,0,0),(103,'Carnitas Fajitas','Pulled pork carnitas, grilled bell peppers & onions. Topped with a drizzle of mango-habanero sauce and green onions.',1,NULL,'Fajitas',1,1,1,0,0),(104,'Mushroom Jack Chicken Fajitas','Grilled chicken, sauteed mushrooms, crumbled bacon & mixed cheese.',1,NULL,'Fajitas',1,1,1,0,0),(105,'Black Bean & Veggie Fajitas','Black bean patty, roasted asparagus, sauteed mushrooms, corn & black bean salsa, queso fresco, avocado & a drizzle of spicy Santa Fe sauce.',1,NULL,'Fajitas',1,0,1,0,0),(106,'Cajun Chicken Pasta','Grilled chicken, penne in Alfredo sauce, topped with chile spices, Parmesan, tomatoes, green onions. Served with garlic toast.',1,NULL,'Chicken & Seafood',1,1,0,0,0),(107,'Cajun Shrimp Pasta','Shrimp, penne in Alfredo sauce, topped with chile spices, Parmesan, tomatoes, green onions. Served with garlic toast.',1,NULL,'Chicken & Seafood',1,1,0,0,0),(108,'Chipotle Chicken Fresh Mex Bowl','Grilled chicken, pico, field greens, Mexican rice, corn & black bean salsa, avocado, shredded cheese, tortilla strips, cilantro, chipotle pesto, house-made ranch.',1,NULL,'Chicken & Seafood',1,1,0,0,0),(109,'Chipotle Shrimp Fresh Mex Bowl','Shrimp, pico, field greens, Mexican rice, corn & black bean salsa, avocado, shredded cheese, tortilla strips, cilantro, chipotle pesto, house-made ranch.',1,NULL,'Chicken & Seafood',1,1,0,0,0),(110,'Spicy Shrimp Tacos','Three spicy chile-lime shrimp tacos in flour tortillas with pico, avocado, cilantro, coleslaw queso fresco. Served with Mexican rice & black beans.',1,NULL,'Chicken & Seafood',1,1,0,0,0),(111,'Ancho Salmon','Seared chile-rubbed Atlantic salmon, spicy citrus-chile sauce, cilantro, queso fresco. Served with Mexican rice & steamed broccoli.',1,NULL,'Chicken & Seafood',1,1,0,0,0),(112,'Crispy Chicken Crispers','Served with fries, corn on the cob and choice of honey-mustard, BBQ sauce or house-made ranch.',1,NULL,'Chicken Crispers',0,1,0,0,0),(113,'Crispy Honey-Chipotle Chicken Crispers','Served with fries, corn on the cob and ranch.',1,NULL,'Chicken Crispers',0,1,0,0,0),(114,'Honey-Chipotle Crispers® & Waffles','Crispers on top of Belgian waffles. Topped with bacon, jalapeños, ancho-chile ranch. Served with fries & honey-chipotle sauce.',1,NULL,'Chicken Crispers',1,1,1,0,0),(115,'Crispy Buffalo Bleu Crispers','Served with fries, corn on the cob and bleu cheese.',1,NULL,'Chicken Crispers',0,1,1,0,0),(116,'Crispy Mango-Habanero Crispers','Served with fries, corn on the cob and ranch.',1,NULL,'Chicken Crispers',0,1,0,0,0),(117,'Tripple Dipper','Why choose one when you can choose three? Select three appetizers and enjoy! Served with dipping sauces.',1,NULL,'Appetizers',1,1,1,0,0);
/*!40000 ALTER TABLE `MenuItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MenuTimes`
--

DROP TABLE IF EXISTS `MenuTimes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MenuTimes` (
  `timeID` int(11) NOT NULL AUTO_INCREMENT,
  `menuID` int(11) DEFAULT NULL,
  `startTime` int(11) DEFAULT NULL,
  `endTime` int(11) DEFAULT NULL,
  PRIMARY KEY (`timeID`),
  KEY `MenuTimes_ibfk_1` (`menuID`),
  CONSTRAINT `MenuTimes_ibfk_1` FOREIGN KEY (`menuID`) REFERENCES `Menu` (`menuID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MenuTimes`
--

LOCK TABLES `MenuTimes` WRITE;
/*!40000 ALTER TABLE `MenuTimes` DISABLE KEYS */;
INSERT INTO `MenuTimes` VALUES (2,8,1500,1800),(3,8,2200,2300),(4,7,1030,1500),(6,7,0,2400),(7,9,1100,2100),(8,10,1100,2100),(9,11,1100,1500),(10,12,1630,2200),(11,13,1100,1430),(12,14,1700,2100),(13,15,1400,1700),(14,15,2200,2359),(25,32,0,2400),(38,48,0,0),(39,49,0,0);
/*!40000 ALTER TABLE `MenuTimes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Options`
--

DROP TABLE IF EXISTS `Options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Options` (
  `optionID` int(11) NOT NULL AUTO_INCREMENT,
  `optionName` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`optionID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Options`
--

LOCK TABLES `Options` WRITE;
/*!40000 ALTER TABLE `Options` DISABLE KEYS */;
INSERT INTO `Options` VALUES (1,'Add Bacon',1.50),(2,'Extra Pickles',0.00),(3,'Add Fried Onions',0.00),(4,'Add Cheese',0.50);
/*!40000 ALTER TABLE `Options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderItem`
--

DROP TABLE IF EXISTS `OrderItem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OrderItem` (
  `orderItemID` int(11) NOT NULL AUTO_INCREMENT,
  `menuItemID` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `comments` text,
  `orderID` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderItemID`),
  KEY `menuItemID` (`menuItemID`),
  KEY `OrderItem_ibfk_2` (`orderID`),
  CONSTRAINT `OrderItem_ibfk_1` FOREIGN KEY (`menuItemID`) REFERENCES `MenuItem` (`itemID`),
  CONSTRAINT `OrderItem_ibfk_2` FOREIGN KEY (`orderID`) REFERENCES `Orders` (`orderID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderItem`
--

LOCK TABLES `OrderItem` WRITE;
/*!40000 ALTER TABLE `OrderItem` DISABLE KEYS */;
INSERT INTO `OrderItem` VALUES (1,35,1,'Cooked medium-rare',1),(2,38,2,'Extra spicy',1),(3,39,2,NULL,2),(4,43,1,NULL,2),(5,41,1,'Please put the sauce on the side',2),(6,42,1,'Extra Pickles',1),(7,8,2,NULL,3),(8,10,1,'extra spicy',3),(9,11,1,NULL,3),(10,14,1,'no mushrooms please',3),(11,8,2,NULL,8),(12,10,3,NULL,8),(13,14,1,'extra rice',8);
/*!40000 ALTER TABLE `OrderItem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderItemHasOptions`
--

DROP TABLE IF EXISTS `OrderItemHasOptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OrderItemHasOptions` (
  `orderItemOptionID` int(11) NOT NULL AUTO_INCREMENT,
  `orderItemID` int(11) DEFAULT NULL,
  `optionID` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderItemOptionID`),
  KEY `OrderItemHasOptions_ibfk_1_idx` (`orderItemID`),
  KEY `OrderItemHasOptions_ibfk_2_idx` (`optionID`),
  CONSTRAINT `OrderItemHasOptions_ibfk_1` FOREIGN KEY (`orderItemID`) REFERENCES `OrderItem` (`orderItemID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `OrderItemHasOptions_ibfk_2` FOREIGN KEY (`optionID`) REFERENCES `Options` (`optionID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderItemHasOptions`
--

LOCK TABLES `OrderItemHasOptions` WRITE;
/*!40000 ALTER TABLE `OrderItemHasOptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `OrderItemHasOptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Orders` (
  `orderID` int(11) NOT NULL AUTO_INCREMENT,
  `tableID` int(11) DEFAULT NULL,
  `orderTime` int(11) DEFAULT NULL,
  `chargeAmount` decimal(10,2) DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  `orderStatus` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`orderID`),
  KEY `Orders_ibfk_2_idx` (`tableID`),
  KEY `Orders_ibfk_11_idx` (`userID`),
  CONSTRAINT `Orders_ibfk_10` FOREIGN KEY (`tableID`) REFERENCES `RestaurantTables` (`tableID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `Orders_ibfk_11` FOREIGN KEY (`userID`) REFERENCES `Users` (`userID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
INSERT INTO `Orders` VALUES (1,1,1230,0.00,2,0),(2,1,1300,0.00,2,0),(3,1,1415,0.00,2,0),(4,1,1905,0.00,2,0),(5,1,2150,0.00,2,0),(6,1,2030,0.00,2,0),(7,1,2035,0.00,2,0),(8,1,2015,0.00,2,0),(9,1,2015,0.00,2,0);
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Restaurant`
--

DROP TABLE IF EXISTS `Restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Restaurant` (
  `restaurantId` int(11) NOT NULL AUTO_INCREMENT,
  `restaurantName` varchar(100) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `salesTax` decimal(10,2) DEFAULT '0.00',
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `zipCode` int(11) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`restaurantId`),
  UNIQUE KEY `restaurantId_UNIQUE` (`restaurantId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci CHECKSUM=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Restaurant`
--

LOCK TABLES `Restaurant` WRITE;
/*!40000 ALTER TABLE `Restaurant` DISABLE KEYS */;
INSERT INTO `Restaurant` VALUES (1,'Scooters','University of St. Thomas fast dining','2115 Summit Ave',7.70,'St. Paul','MN',55105,'United States'),(2,'Khao Hom','Thai Restaurant','2411 Central Ave NE',7.00,'Minneapolis','MN',55418,'United States'),(3,'Chipotle Mexican Restaurant','Fast-food Mexican Restaurant','2600 Hennepin Ave',7.00,'Minneapolis','MN',55408,'United States'),(4,'Roti Modern Mediterranean','Mediterranean','614 Washington Ave SE',0.00,'Minneapolis','MN',55414,'United States'),(5,'Red Cow Restaurant','Hamburger','393 Selby Avenue',7.70,'St. Paul','MN',55105,'United States');
/*!40000 ALTER TABLE `Restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RestaurantManagers`
--

DROP TABLE IF EXISTS `RestaurantManagers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RestaurantManagers` (
  `managerID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) DEFAULT NULL,
  `restaurantID` int(11) DEFAULT NULL,
  PRIMARY KEY (`managerID`),
  KEY `RestaurantManagers_ibfk_1_idx` (`restaurantID`),
  KEY `RestaurantManagers_ibfk_2_idx` (`userID`),
  CONSTRAINT `RestaurantManagers_ibfk_1` FOREIGN KEY (`restaurantID`) REFERENCES `Restaurant` (`restaurantId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `RestaurantManagers_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `Users` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RestaurantManagers`
--

LOCK TABLES `RestaurantManagers` WRITE;
/*!40000 ALTER TABLE `RestaurantManagers` DISABLE KEYS */;
/*!40000 ALTER TABLE `RestaurantManagers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RestaurantTables`
--

DROP TABLE IF EXISTS `RestaurantTables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RestaurantTables` (
  `tableID` int(11) NOT NULL,
  `alexaID` varchar(100) DEFAULT NULL,
  `qrCode` varchar(100) DEFAULT NULL,
  `restaurantID` int(11) DEFAULT NULL,
  PRIMARY KEY (`tableID`),
  KEY `RestaurantTables_ibfk_1_idx` (`restaurantID`),
  CONSTRAINT `RestaurantTables_ibfk_1` FOREIGN KEY (`restaurantID`) REFERENCES `Restaurant` (`restaurantId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RestaurantTables`
--

LOCK TABLES `RestaurantTables` WRITE;
/*!40000 ALTER TABLE `RestaurantTables` DISABLE KEYS */;
INSERT INTO `RestaurantTables` VALUES (1,'1','abc',5);
/*!40000 ALTER TABLE `RestaurantTables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Users` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `token` text,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (2,'Bob','Jones','bob@jones.com','test123');
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'AutoGarcon'
--
/*!50003 DROP PROCEDURE IF EXISTS `AddItemToOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masterUser`@`%` PROCEDURE `AddItemToOrder`(IN orderIDToAddTo INT, IN menuItemIDToAdd INT, IN quantityToAdd INT, IN commentsToAdd TEXT)
BEGIN
	INSERT INTO OrderItem (menuItemID, quantity, comments, orderID)
    VALUES (menuItemIDToAdd, quantityToAdd, commentsToAdd, orderIDToAddTo);
    
    SELECT LAST_INSERT_ID();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddManagerToRestaurant` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masterUser`@`%` PROCEDURE `AddManagerToRestaurant`(IN userID INT, IN restaurantID INT )
BEGIN
	INSERT INTO RestaurantManagers(userID, restaurantID)
    VALUES (userID, restaurantID);
    
    SELECT LAST_INSERT_ID();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddOptionToOrderItem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masterUser`@`%` PROCEDURE `AddOptionToOrderItem`(IN optionID INT, IN orderItemID INT )
BEGIN
	INSERT INTO OrderItemHasOptions(orderItemID, optionID)
    VALUES (orderItemID, optionID);
    
    SELECT LAST_INSERT_ID();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CompleteOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masterUser`@`%` PROCEDURE `CompleteOrder`(IN oID INT)
BEGIN
	-- Mark the order inactive (it is now essentially a "reciept")
	UPDATE Orders
    SET orderStatus = 1
    WHERE orderID = oID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateNewMenu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`TBevs`@`%` PROCEDURE `CreateNewMenu`(IN startTime INT, IN endTime INT, IN mStatus INT, IN  menuName varchar(255), IN restaurantID INT, INOUT menuID INT)
BEGIN 
    INSERT INTO Menu(menuStatus, menuName, restaurantID) 
     VALUES(mStatus, menuName, restaurantID); 
    SELECT LAST_INSERT_ID() INTO menuID; 
    INSERT INTO MenuTimes( menuID, startTime, endTime) 
     VALUES( (SELECT LAST_INSERT_ID() ), startTime, endTime);   
     END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateNewOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masterUser`@`%` PROCEDURE `CreateNewOrder`(IN tableID INT, IN orderTime INT, IN chargeAmount DECIMAL(10,2), IN customerID INT )
BEGIN
	INSERT INTO Orders(tableID, orderTime, chargeAmount, userID, orderStatus)
    VALUES (tableID, orderTime, chargeAmount, customerID, 0);
    
    SELECT LAST_INSERT_ID();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateNewRestaurant` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masterUser`@`%` PROCEDURE `CreateNewRestaurant`(IN r_name varchar(100), IN r_descr varchar(100), IN r_address varchar(100), IN r_sales_tax DECIMAL(10,2), IN r_city varchar(100), IN r_state varchar(100), IN r_zip INT, IN r_country varchar(100))
BEGIN
	INSERT into Restaurant(restaurantName, description, address, salesTax, city, state, zipCode, country)
    VALUES(r_name, r_descr, r_address, r_sales_tax, r_city, r_state, r_zip, r_country);
    
    SELECT LAST_INSERT_ID();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateOptionForMenuItem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masterUser`@`%` PROCEDURE `CreateOptionForMenuItem`(IN optionName VARCHAR(100), IN price DECIMAL(10,2), IN itemID INT )
BEGIN
	DECLARE oID INT;
	-- INSERT IF DOESN'T EXIST --
	IF (SELECT EXISTS(SELECT * FROM Options WHERE optionName = optionName AND price = price) = 0) THEN
		INSERT INTO Options(optionName, price)
		VALUES (optionName, price);
	END IF;
    
    SELECT optionID INTO oID FROM Options WHERE optionName = optionName AND price = price;
    
    -- Update contains table --
    INSERT INTO ItemHasOptions(itemID, optionID)
    VALUES(itemID, optionID);
    
    SELECT LAST_INSERT_ID();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masterUser`@`%` PROCEDURE `CreateUser`(IN firstName VARCHAR(45), IN lastName VARCHAR(45), IN email VARCHAR(45), IN token TEXT )
BEGIN
	INSERT INTO Users(firstName, lastName, email, token)
    VALUES (firstName, lastName, email, token);
    
    SELECT LAST_INSERT_ID();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetActiveOrdersForUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetActiveOrdersForUser`(IN uID INT)
BEGIN
	SELECT *
    FROM Orders
    WHERE userID = uID AND orderStatus = 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllOrderItemsAndQuantity` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetAllOrderItemsAndQuantity`(IN myOrderID INT)
BEGIN
	SELECT MenuItem.itemName, OrderItem.quantity
	FROM MenuItem JOIN OrderItem ON MenuItem.itemID = OrderItem.menuItemID
	WHERE orderID = myOrderID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetCompletedOrdersForUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetCompletedOrdersForUser`(IN uID INT)
BEGIN
	SELECT *
    FROM Orders
    WHERE userID = uID AND orderStatus = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetMenuItembyMenuId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetMenuItembyMenuId`(IN id INT)
BEGIN
	SELECT * FROM AutoGarcon.MenuItem WHERE itemID IN (SELECT menuItemID FROM AutoGarcon.MenuContains WHERE menuID=id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetMenuItemByName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetMenuItemByName`(IN iName VARCHAR(255))
BEGIN
	SELECT *
    FROM AutoGarcon.MenuItem WHERE itemName = iName;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetMenuItemSides` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetMenuItemSides`(IN menuItem INT)
BEGIN
	SELECT MenuItem.itemName
	FROM MenuItem
	WHERE MenuItem.itemID IN
		(SELECT ItemHasSides.sideItemID
		FROM ItemHasSides
		WHERE menuItemID = menuItem);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetMenusByRestaurantId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetMenusByRestaurantId`(IN id int)
BEGIN
	SELECT * FROM AutoGarcon.Menu WHERE restaurantID = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetMenuTimes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetMenuTimes`(IN mID INT)
BEGIN
	SELECT *
    FROM MenuTimes
    WHERE menuID = mID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetOptionsForMenuItem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetOptionsForMenuItem`(IN iID INT)
BEGIN
	SELECT *
    FROM Options
    WHERE optionID IN ( SELECT * FROM Options JOIN ItemHasOptions ON ItemHasOptions.itemID = iID);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetOrderByID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetOrderByID`(IN oID INT)
BEGIN
	SELECT *
    FROM Orders
    WHERE orderID = oID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetRestaurantByName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetRestaurantByName`(IN rName VARCHAR(100) )
BEGIN
	SELECT *
    FROM AutoGarcon.Restaurant WHERE restaurantName=rName;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetRestaurantsUserManages` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetRestaurantsUserManages`(IN iUserID INT)
BEGIN
	SELECT restaurantID
    FROM RestaurantManagers
    WHERE userID = iUserID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetTotalPriceOfOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetTotalPriceOfOrder`(IN orderIDToGet INT)
BEGIN
	DECLARE itemBaseCost, optionsCost, costBeforeTax, salesTaxCost, totalCost INT;
    DECLARE taxPercent DECIMAL(10,2);
    
    -- Get cost of all items together --
	SELECT SUM(MenuContains.price * OrderItem.quantity) INTO itemBaseCost
	FROM OrderItem
	JOIN MenuContains ON OrderItem.menuItemID = MenuContains.menuItemID
	WHERE orderID = orderIDToGet;
    
    -- Get cost of all options added to items -- 
    SELECT SUM(Options.price * OrderItem.quantity) INTO optionsCost
    FROM OrderItem 
    JOIN OrderItemHasOptions ON OrderItem.orderItemID = OrderItemHasOptions.orderItemID
    JOIN Options ON OrderItemHasOptions.optionID = Options.optionID
    WHERE OrderItem.orderID = orderIDToGet;
    
    -- Get restaurant sales tax percent --
    SELECT Restaurant.salesTax INTO taxPercent
    FROM Restaurant WHERE restaurantID IN(
		SELECT restaurantID FROM RestaurantTables
		WHERE tableID IN (SELECT tableID FROM Orders WHERE orderID = orderIDToGet)) LIMIT 1;
    
    SET costBeforeTax = itemBaseCost + optionsCost;
    SET salesTaxCost = costBeforeTax * taxPercent;
    SET totalCost = costBeforeTax + salesTaxCost;
    
    SELECT totalCost;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetUserFromToken` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetUserFromToken`(IN iToken TEXT )
BEGIN
	SELECT userID
    FROM Users
    WHERE token = iToken;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetUserIdByEmail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetUserIdByEmail`(IN email VARCHAR(45) )
BEGIN
	SELECT userID
    FROM Users
    WHERE email = email;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RemoveMenu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masterUser`@`%` PROCEDURE `RemoveMenu`(IN mID INT)
BEGIN
    DELETE FROM MenuContains WHERE menuID = mID;
    DELETE FROM MenuTimes WHERE menuID = mID;
    DELETE FROM Menu WHERE menuID = mID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RemoveMenuItem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masterUser`@`%` PROCEDURE `RemoveMenuItem`(IN iID INT)
BEGIN
    DELETE FROM MenuContains WHERE menuItemID = iID;
    DELETE FROM MenuItem WHERE itemID = iID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RemoveMenuTime` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masterUser`@`%` PROCEDURE `RemoveMenuTime`(IN timeID INT)
BEGIN
	DELETE FROM MenuTimes
    WHERE (timeID = timeID);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RemoveOption` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masterUser`@`%` PROCEDURE `RemoveOption`(IN optionID INT )
BEGIN
	DELETE FROM Options WHERE optionID = optionID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RemoveUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masterUser`@`%` PROCEDURE `RemoveUser`(IN userID INT )
BEGIN
	DELETE FROM Users WHERE userID = userID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SetMenuTime` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masterUser`@`%` PROCEDURE `SetMenuTime`(IN startTime INT, IN endTime INT, IN menuID INT)
BEGIN
	INSERT into MenuTimes(menuID, startTime, endTime)
    VALUES (menuID, startTime, endTime);
    
    SELECT LAST_INSERT_ID();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateMenuContains` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masterUser`@`%` PROCEDURE `UpdateMenuContains`(IN mID INT, IN iID INT, IN iPrice Decimal(10,2))
BEGIN
	INSERT INTO MenuContains(menuID, menuItemID, price)
    VALUES (mID, iID, iPrice);
    
    SELECT iID;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-01 15:55:38
