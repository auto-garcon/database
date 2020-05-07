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
-- Table structure for table `FavoriteRestaurants`
--

DROP TABLE IF EXISTS `FavoriteRestaurants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FavoriteRestaurants` (
  `favoriteID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) DEFAULT NULL,
  `restaurantID` int(11) DEFAULT NULL,
  PRIMARY KEY (`favoriteID`),
  KEY `FavRestauransfk_1_idx` (`userID`),
  KEY `FavRestaurantsfk_2_idx` (`restaurantID`),
  CONSTRAINT `FavRestaurantsfk_1` FOREIGN KEY (`userID`) REFERENCES `Users` (`userID`),
  CONSTRAINT `FavRestaurantsfk_2` FOREIGN KEY (`restaurantID`) REFERENCES `Restaurant` (`restaurantId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FavoriteRestaurants`
--

LOCK TABLES `FavoriteRestaurants` WRITE;
/*!40000 ALTER TABLE `FavoriteRestaurants` DISABLE KEYS */;
INSERT INTO `FavoriteRestaurants` VALUES (1,28,3),(2,28,4),(3,22,3),(5,32,5),(8,22,5),(9,28,3),(10,28,4),(11,22,3),(12,22,5),(13,32,5);
/*!40000 ALTER TABLE `FavoriteRestaurants` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Menu`
--

LOCK TABLES `Menu` WRITE;
/*!40000 ALTER TABLE `Menu` DISABLE KEYS */;
INSERT INTO `Menu` VALUES (7,1,'Red Cow Lunch',5),(8,1,'Red Cow Happy Hour',5),(9,1,'Scooters Menu',1),(10,1,'Chipotle Menu',3),(11,1,'Khao Hom Lunch',2),(12,1,'Khao Hom Dinner',2),(13,1,'Roti Lunch Menu',2),(14,1,'Roti Dinner Menu',2),(15,1,'Roti Happy Hour Selections',2),(32,0,'Burgers',5),(48,1,'Dinner',5),(49,0,'Dinner',5),(65,1,'Lunch',19);
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
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MenuContains`
--

LOCK TABLES `MenuContains` WRITE;
/*!40000 ALTER TABLE `MenuContains` DISABLE KEYS */;
INSERT INTO `MenuContains` VALUES (7,51,11.99,44),(7,54,6.50,47),(7,55,7.00,48),(8,1,4.50,49),(8,2,5.50,50),(8,3,5.25,51),(8,4,5.00,52),(8,5,5.00,53),(48,75,13.99,69),(48,76,11.29,70),(48,77,7.49,71),(48,78,8.99,72),(48,79,10.79,73),(48,80,10.99,74),(48,81,11.49,75),(48,82,15.29,76),(48,83,16.29,77),(48,84,14.99,78),(48,85,12.99,79),(48,86,13.99,80),(48,87,11.99,81),(48,88,12.99,82),(48,89,12.29,83),(48,90,15.99,84),(48,91,11.59,85),(48,92,11.59,86),(48,93,12.59,87),(48,94,11.89,88),(48,95,11.89,89),(49,96,13.99,90),(49,97,11.29,91),(49,98,7.49,92),(49,99,8.99,93),(49,100,10.79,94),(49,101,10.99,95),(49,102,11.49,96),(49,103,15.29,97),(49,104,16.29,98),(49,105,14.99,99),(49,106,12.99,100),(49,107,13.99,101),(49,108,11.99,102),(49,109,12.99,103),(49,110,12.29,104),(49,111,15.99,105),(49,112,11.59,106),(49,113,11.59,107),(49,114,12.59,108),(49,115,11.89,109),(49,116,11.89,110),(48,144,12.90,138),(65,146,8.99,140),(65,147,10.99,141);
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
  `description` varchar(250) DEFAULT NULL,
  `itemStatus` tinyint(1) NOT NULL DEFAULT '1',
  `calories` int(11) DEFAULT NULL,
  `category` varchar(100) NOT NULL,
  `gluten` tinyint(1) NOT NULL DEFAULT '0',
  `meat` tinyint(1) NOT NULL DEFAULT '0',
  `dairy` tinyint(1) NOT NULL DEFAULT '0',
  `nuts` tinyint(1) NOT NULL DEFAULT '0',
  `soy` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MenuItem`
--

LOCK TABLES `MenuItem` WRITE;
/*!40000 ALTER TABLE `MenuItem` DISABLE KEYS */;
INSERT INTO `MenuItem` VALUES (1,'French Fries','Crispy fries',1,400,'Appetizers',0,0,0,0,0),(2,'Traditional Tots','Classic potato tater tots',1,400,'Appetizers',0,0,0,0,0),(3,'Chicken Strips','Crispy chicken strips',1,800,'Appetizers',0,0,0,0,0),(4,'Cheese Curds','Little fried cheese balls',1,750,'Appetizers',0,0,0,0,0),(5,'Mozzarella Sticks','Good with marinara',1,750,'Appetizers',0,0,0,0,0),(6,'Grilled Cheese','Rosemary Bread with your choice of cheese',1,850,'Paninis',0,0,0,0,0),(7,'Chicken Avocado','Rosemary Bread, Chicken, Gouda, Avocado Mayo, Spinach',1,825,'Paninis',0,0,0,0,0),(8,'Curry Basil Leaved Fried Rice','Spicy*. Zesty red curry paste stir fried with Jasmine rice, egg, basil, onion, and bell peppers.\n',1,272,'Thai Fried Rice',0,0,0,0,0),(9,'Pad Thai','A staple of every Thai restaurant, Pad Thai is a stir fried rice noodle, tangy pad Thai sauce, egg, green onions, and bean sprouts served with crushed peanut and lime on the side.',1,1131,'Noodle Stir Fry',0,0,0,0,0),(10,'Rice Noodle  gluten free','Gluten Free* Thai classic street noodle soup, Goid-Tiou. Just like in Thailand, you get your choice of noodle and meat in this delightful and delicious Thai spice soup. All soup is served with bean sprouts, jalapeno, and sweet basil.',1,192,'Noodle Soup',0,0,0,0,0),(11,'Thai Fried Rice','Thai Jasmine rice blended with egg, onions, tomatoes, and scallions.',1,137,'Lunch Specials',0,0,0,0,0),(12,' Red Curry','Gluten Free* *Spicy* Red curry paste, coconut milk, egg plant, bell peppers, bamboo shoots, lime leaves, and basil. Served with rice.',1,441,'Lunch Specials',0,0,0,0,0),(13,'Green Curry','Gluten Free* *Spicy* Green curry paste, coconut milk, egg plant, bell peppers, bamboo shoots, lime leaves, and basil. Served with rice.',1,310,'Lunch Specials',0,0,0,0,0),(14,'Pad Ruom Mid','Stir fried seasonal vegetables in our soy based sauce.\n',1,547,'Lunch Specials',0,0,0,0,0),(15,'Noodle Soup','*Gluten Free* One of Thailand’s favorite street food. Rice noodles in a rich clear broth served with bean sprouts, lime, jalapeno, and sweet basil.',1,120,'Lunch Specials',0,0,0,0,0),(16,'California Burger','Burger topped with lettuce, tomato, onion and mayonaise',1,850,'Burgers',0,0,0,0,0),(17,'Flame Thrower Burger','Spicy burger with sauteed onions and jalepenos topped with ghost pepper cheese and sriracha mayo',1,1000,'Burgers',0,0,0,0,0),(18,'Pretzel Bites','Bavarian pretzel bites served with hot queso dip',1,400,'Starters',0,0,0,0,0),(19,'Frickles','Seasoned and deep friend pickle spears servedwith ranch or jalapeno ranch',1,350,'Starters',0,0,0,0,0),(20,'Chicken Club','Crispy or grilled chicken breast topped with honey mustard on a toated bun',1,610,'Sandwiches',0,0,0,0,0),(21,'The Galaxy','Pepperoni, sausage, mushroom, onions and green pepper pizza',1,1500,'Moon Pizzas',0,0,0,0,0),(22,'Midnight Munchies','Garlic butter bites and mozzarella served with pizza sauce for dipping',1,740,'Moon Pizzas',0,0,0,0,0),(23,'Grilled Salmon','6oz Keta salmon filt wild caught from Alaska and served with a dill butter sauce',1,630,'Entrees',0,0,0,0,0),(24,'Redhook Battered Shrimp','Beer battered tail-off shrimp served with cocktail or tartar sauce and lemon wedge',1,580,'',0,0,0,0,0),(25,'Yum Neua','Spicy* Grilled beef, tomatoes, cucumbers, lettuce, onions, and cilantro in spicy lime herb dressing.',1,490,'Salad',0,0,0,0,0),(26,'Fried Ice Cream','Crispy breading on the outside with creamy ice cream inside.',1,450,'',0,0,0,0,0),(27,'Ultimate','CAB® burger, wisconsin aged cheddar, iceberg lettuce, tomato, onion & Red Cow sauce',1,750,'Burgers',0,1,1,0,0),(28,'Barcelona','CAB® burger, manchego, prosciutto, piquillo pepper & smoked aioli',1,750,'Burgers',0,1,1,0,0),(29,'60/40','60% CAB® & 40% ground bacon patty, wisconsin aged cheddar, beer mustard and candied bacon',1,750,'Burgers',0,1,1,0,0),(30,'Blues Burger','CAB® burger, wisconsin blue cheese & apricot-rosemary black pepper jam',1,750,'Burgers',0,1,1,0,0),(31,'Patty Melt','CAB* burger, caramelized onion, sharp cheddar, white american & garlic mayo',1,750,'Burgers',0,1,1,0,0),(32,'Breakfast','CAB® burger, peanut butter, over-easy egg, bacon & wisconsin aged cheddar on sourdough',1,750,'Burgers',0,1,1,0,0),(33,'Cowboy','CAB® burger, wisconsin aged cheddar, root beer pulled pork, onion rings, BBQ sauce',0,750,'Burgers',0,1,1,0,0),(34,'Mushroom-Swiss','CAB® burger, merlot mushrooms, garlic mayo & swiss cheese',0,750,'Burgers',0,1,1,0,0),(35,'Manhattan 2.0','double patty, bacon confit, Gruyere, arugula & dried cherry-red wine chutney, pretzel bun',1,750,'Red Cow Grind',1,1,1,0,0),(36,'Double Barrel Burger','double patty, white american, grilled onion & special sauce',1,750,'Red Cow Grind',1,1,1,0,0),(37,'Quarter Pounder','single patty, yellow american, ketchup, mustard, house pickles',1,750,'Red Cow Grind',1,1,1,0,0),(38,'Tennessee Hot Chicken','southern fried chicken, tennessee hot sauce, blackstrap mayo, house pickles',1,750,'Sandwiches',1,1,1,0,0),(39,'Reuben','kraut, russian aioli, muenster, fresh dill, pumpernickel\nveggie (beets)',1,750,'Sandwiches',0,1,1,0,0),(40,'Salmon','responsibly sourced grilled salmon, lemon-herb mayo, greens, whole wheat bun $14.50',1,750,'Sandwiches',0,1,0,0,0),(41,'Buffalo Cauliflower','gluten-free breading, buffalo sauce, ranch',1,750,'Plant Based',0,0,0,0,0),(42,'So Cal Burger','impossible patty, avocado, american, garlic mayo, lettuce, tomato, onion, whole wheat bun',1,750,'Plant Based',0,0,1,0,0),(43,'Red Cow','organic mixed greens, crispy prosciutto, sunflower, pumpkin, and hemp seeds, shaved parmesan, balsamic vinaigrette',1,600,'Salads',0,1,1,1,0),(44,'Asian','cucumber, carrot, radish, peanuts, root vegetables, citrus-asian vinaigrette',1,550,'Salads',0,0,0,1,0),(45,'Taco','avocado, tinga chicken, queso fresco, tomato, onion, corn salsa, tortilla chips, greens, chipotle-parmesan dressing',1,750,'Salads',0,1,1,0,0),(46,'Beet & Quinoa Salad','roasted red and golden beets, arugula, quinoa, edamame, red peppers, garbanzos, balsamic vinaigrette, chevre',1,650,'Salads',0,1,0,1,0),(47,'Caesar','red & green romaine, garlic croutons, parmesan',1,700,'Salads',0,0,1,0,0),(51,'Chicken Sandwich','Amazing chicken sandwich on ciabatta',2,950,'Sandwiches',1,0,0,1,0),(54,'Standard Burger','The basic burger',1,750,'Burgers',1,1,1,0,0),(55,'Cheeseburger','The basic burger with cheese',1,800,'Burgers',1,1,1,0,0),(56,'French Fries','Delicious side of crispy fries',1,550,'Sides',1,0,0,0,0),(57,'Sweet Potato Fries','Delicious side of crispy sweet potato fries',1,500,'Sides',1,0,0,1,0),(58,'Onion Rings','Delicious side of crispy onion rings',1,520,'Sides',1,0,0,0,0),(59,'Cheese Curds','Delicious side of fresh Wisconsin cheese curds',1,650,'Sides',1,0,1,0,0),(60,'Burger','description',1,NULL,'custom',0,1,1,0,0),(61,'Tripple Dipper','Why choose one when you can choose three? Select three appetizers and enjoy! Served with dipping sauces.',1,NULL,'Appetizers',1,1,1,0,0),(62,'Southwestern Eggrolls','These aren’t your ordinary eggrolls. Crispy flour tortillas, chicken, black beans, corn, jalapeño Jack cheese, red peppers, spinach. Served with avocado-ranch.',1,NULL,'Appetizers',1,0,1,0,0),(63,'Skillet Queso','Your chip’s favorite dip for over 25 years. Original with beef. Served with chips & salsa.',1,NULL,'Appetizers',1,0,1,0,0),(64,'Fried Pickles','Served with house-made ranch.',1,NULL,'Appetizers',1,0,0,0,0),(65,'Queso Burger','This half-pound patty comes smothered in white queso, crunchy tortilla strips & pico.',1,NULL,'Burgers',1,1,1,0,0),(66,'Mushroom Swiss Burger','There’s so mush-room in our hearts for this one. Topped with sauteed onions, mushrooms, Swiss, lettuce, tomato & garlic aioli.',1,NULL,'Burgers',1,1,1,0,0),(67,'Southern Smokehouse Burger','Bacon, cheddar, pickles, Awesome Blossom Petals, lettuce, tomato, garlic aioli. Served with a side of original BBQ sauce.',1,NULL,'Burgers',1,1,1,0,0),(68,'Carnitas Fajitas','Pulled pork carnitas, grilled bell peppers & onions. Topped with a drizzle of mango-habanero sauce and green onions.',1,NULL,'Fajitas',1,1,1,0,0),(69,'Mushroom Jack Chicken Fajitas','Grilled chicken, sauteed mushrooms, crumbled bacon & mixed cheese.',1,NULL,'Fajitas',1,1,1,0,0),(70,'Black Bean & Veggie Fajitas','Black bean patty, roasted asparagus, sauteed mushrooms, corn & black bean salsa, queso fresco, avocado & a drizzle of spicy Santa Fe sauce.',1,NULL,'Fajitas',1,0,1,0,0),(71,'Cajun Chicken Pasta','Grilled chicken, penne in Alfredo sauce, topped with chile spices, Parmesan, tomatoes, green onions. Served with garlic toast.',1,NULL,'Chicken & Seafood',1,1,0,0,0),(72,'Cajun Shrimp Pasta','Shrimp, penne in Alfredo sauce, topped with chile spices, Parmesan, tomatoes, green onions. Served with garlic toast.',1,NULL,'Chicken & Seafood',1,1,0,0,0),(73,'Chipotle Chicken Fresh Mex Bowl','Grilled chicken, pico, field greens, Mexican rice, corn & black bean salsa, avocado, shredded cheese, tortilla strips, cilantro, chipotle pesto, house-made ranch.',1,NULL,'Chicken & Seafood',1,1,0,0,0),(74,'Chipotle Shrimp Fresh Mex Bowl','Shrimp, pico, field greens, Mexican rice, corn & black bean salsa, avocado, shredded cheese, tortilla strips, cilantro, chipotle pesto, house-made ranch.',1,NULL,'Chicken & Seafood',1,1,0,0,0),(75,'Tripple Dipper','Why choose one when you can choose three? Select three appetizers and enjoy! Served with dipping sauces.',1,650,'Appetizers',1,1,1,0,0),(76,'Southwestern Eggrolls','These aren’t your ordinary eggrolls. Crispy flour tortillas, chicken, black beans, corn, jalapeño Jack cheese, red peppers, spinach. Served with avocado-ranch.',1,650,'Appetizers',1,0,1,0,0),(77,'Skillet Queso','Your chip’s favorite dip for over 25 years. Original with beef. Served with chips & salsa.',1,650,'Appetizers',1,0,1,0,0),(78,'Fried Pickles','Served with house-made ranch.',1,650,'Appetizers',1,0,0,0,0),(79,'Queso Burger','This half-pound patty comes smothered in white queso, crunchy tortilla strips & pico.',1,650,'Burgers',1,1,1,0,0),(80,'Mushroom Swiss Burger','There’s so mush-room in our hearts for this one. Topped with sauteed onions, mushrooms, Swiss, lettuce, tomato & garlic aioli.',1,650,'Burgers',1,1,1,0,0),(81,'Southern Smokehouse Burger','Bacon, cheddar, pickles, Awesome Blossom Petals, lettuce, tomato, garlic aioli. Served with a side of original BBQ sauce.',1,650,'Burgers',1,1,1,0,0),(82,'Carnitas Fajitas','Pulled pork carnitas, grilled bell peppers & onions. Topped with a drizzle of mango-habanero sauce and green onions.',1,650,'Fajitas',1,1,1,0,0),(83,'Mushroom Jack Chicken Fajitas','Grilled chicken, sauteed mushrooms, crumbled bacon & mixed cheese.',1,650,'Fajitas',1,1,1,0,0),(84,'Black Bean & Veggie Fajitas','Black bean patty, roasted asparagus, sauteed mushrooms, corn & black bean salsa, queso fresco, avocado & a drizzle of spicy Santa Fe sauce.',1,650,'Fajitas',1,0,1,0,0),(85,'Cajun Chicken Pasta','Grilled chicken, penne in Alfredo sauce, topped with chile spices, Parmesan, tomatoes, green onions. Served with garlic toast.',1,650,'Chicken & Seafood',1,1,0,0,0),(86,'Cajun Shrimp Pasta','Shrimp, penne in Alfredo sauce, topped with chile spices, Parmesan, tomatoes, green onions. Served with garlic toast.',1,725,'Chicken & Seafood',1,1,0,0,0),(87,'Chipotle Chicken Fresh Mex Bowl','Grilled chicken, pico, field greens, Mexican rice, corn & black bean salsa, avocado, shredded cheese, tortilla strips, cilantro, chipotle pesto, house-made ranch.',1,725,'Chicken & Seafood',1,1,0,0,0),(88,'Chipotle Shrimp Fresh Mex Bowl','Shrimp, pico, field greens, Mexican rice, corn & black bean salsa, avocado, shredded cheese, tortilla strips, cilantro, chipotle pesto, house-made ranch.',1,725,'Chicken & Seafood',1,1,0,0,0),(89,'Spicy Shrimp Tacos','Three spicy chile-lime shrimp tacos in flour tortillas with pico, avocado, cilantro, coleslaw queso fresco. Served with Mexican rice & black beans.',1,725,'Chicken & Seafood',1,1,0,0,0),(90,'Ancho Salmon','Seared chile-rubbed Atlantic salmon, spicy citrus-chile sauce, cilantro, queso fresco. Served with Mexican rice & steamed broccoli.',1,725,'Chicken & Seafood',1,1,0,0,0),(91,'Crispy Chicken Crispers','Served with fries, corn on the cob and choice of honey-mustard, BBQ sauce or house-made ranch.',1,725,'Chicken Crispers',0,1,0,0,0),(92,'Crispy Honey-Chipotle Chicken Crispers','Served with fries, corn on the cob and ranch.',1,725,'Chicken Crispers',0,1,0,0,0),(93,'Honey-Chipotle Crispers® & Waffles','Crispers on top of Belgian waffles. Topped with bacon, jalapeños, ancho-chile ranch. Served with fries & honey-chipotle sauce.',1,725,'Chicken Crispers',1,1,1,0,0),(94,'Crispy Buffalo Bleu Crispers','Served with fries, corn on the cob and bleu cheese.',1,725,'Chicken Crispers',0,1,1,0,0),(95,'Crispy Mango-Habanero Crispers','Served with fries, corn on the cob and ranch.',1,725,'Chicken Crispers',0,1,0,0,0),(96,'Tripple Dipper','Why choose one when you can choose three? Select three appetizers and enjoy! Served with dipping sauces.',1,NULL,'Appetizers',1,1,1,0,0),(97,'Southwestern Eggrolls','These aren’t your ordinary eggrolls. Crispy flour tortillas, chicken, black beans, corn, jalapeño Jack cheese, red peppers, spinach. Served with avocado-ranch.',1,NULL,'Appetizers',1,0,1,0,0),(98,'Skillet Queso','Your chip’s favorite dip for over 25 years. Original with beef. Served with chips & salsa.',1,NULL,'Appetizers',1,0,1,0,0),(99,'Fried Pickles','Served with house-made ranch.',1,NULL,'Appetizers',1,0,0,0,0),(100,'Queso Burger','This half-pound patty comes smothered in white queso, crunchy tortilla strips & pico.',1,NULL,'Burgers',1,1,1,0,0),(101,'Mushroom Swiss Burger','There’s so mush-room in our hearts for this one. Topped with sauteed onions, mushrooms, Swiss, lettuce, tomato & garlic aioli.',1,NULL,'Burgers',1,1,1,0,0),(102,'Southern Smokehouse Burger','Bacon, cheddar, pickles, Awesome Blossom Petals, lettuce, tomato, garlic aioli. Served with a side of original BBQ sauce.',1,NULL,'Burgers',1,1,1,0,0),(103,'Carnitas Fajitas','Pulled pork carnitas, grilled bell peppers & onions. Topped with a drizzle of mango-habanero sauce and green onions.',1,NULL,'Fajitas',1,1,1,0,0),(104,'Mushroom Jack Chicken Fajitas','Grilled chicken, sauteed mushrooms, crumbled bacon & mixed cheese.',1,NULL,'Fajitas',1,1,1,0,0),(105,'Black Bean & Veggie Fajitas','Black bean patty, roasted asparagus, sauteed mushrooms, corn & black bean salsa, queso fresco, avocado & a drizzle of spicy Santa Fe sauce.',1,NULL,'Fajitas',1,0,1,0,0),(106,'Cajun Chicken Pasta','Grilled chicken, penne in Alfredo sauce, topped with chile spices, Parmesan, tomatoes, green onions. Served with garlic toast.',1,NULL,'Chicken & Seafood',1,1,0,0,0),(107,'Cajun Shrimp Pasta','Shrimp, penne in Alfredo sauce, topped with chile spices, Parmesan, tomatoes, green onions. Served with garlic toast.',1,NULL,'Chicken & Seafood',1,1,0,0,0),(108,'Chipotle Chicken Fresh Mex Bowl','Grilled chicken, pico, field greens, Mexican rice, corn & black bean salsa, avocado, shredded cheese, tortilla strips, cilantro, chipotle pesto, house-made ranch.',1,NULL,'Chicken & Seafood',1,1,0,0,0),(109,'Chipotle Shrimp Fresh Mex Bowl','Shrimp, pico, field greens, Mexican rice, corn & black bean salsa, avocado, shredded cheese, tortilla strips, cilantro, chipotle pesto, house-made ranch.',1,NULL,'Chicken & Seafood',1,1,0,0,0),(110,'Spicy Shrimp Tacos','Three spicy chile-lime shrimp tacos in flour tortillas with pico, avocado, cilantro, coleslaw queso fresco. Served with Mexican rice & black beans.',1,NULL,'Chicken & Seafood',1,1,0,0,0),(111,'Ancho Salmon','Seared chile-rubbed Atlantic salmon, spicy citrus-chile sauce, cilantro, queso fresco. Served with Mexican rice & steamed broccoli.',1,NULL,'Chicken & Seafood',1,1,0,0,0),(112,'Crispy Chicken Crispers','Served with fries, corn on the cob and choice of honey-mustard, BBQ sauce or house-made ranch.',1,NULL,'Chicken Crispers',0,1,0,0,0),(113,'Crispy Honey-Chipotle Chicken Crispers','Served with fries, corn on the cob and ranch.',1,NULL,'Chicken Crispers',0,1,0,0,0),(114,'Honey-Chipotle Crispers® & Waffles','Crispers on top of Belgian waffles. Topped with bacon, jalapeños, ancho-chile ranch. Served with fries & honey-chipotle sauce.',1,NULL,'Chicken Crispers',1,1,1,0,0),(115,'Crispy Buffalo Bleu Crispers','Served with fries, corn on the cob and bleu cheese.',1,NULL,'Chicken Crispers',0,1,1,0,0),(116,'Crispy Mango-Habanero Crispers','Served with fries, corn on the cob and ranch.',1,NULL,'Chicken Crispers',0,1,0,0,0),(117,'Tripple Dipper','Why choose one when you can choose three? Select three appetizers and enjoy! Served with dipping sauces.',1,NULL,'Appetizers',1,1,1,0,0),(128,'Tripple Dipper','Why choose one when you can choose three? Select three appetizers and enjoy! Served with dipping sauces.',1,0,'Appetizers',1,1,1,0,0),(129,'Tripple Dipper','Why choose one when you can choose three? Select three appetizers and enjoy! Served with dipping sauces.',1,0,'Appetizers',1,1,1,0,0),(130,'Tripple Dipper','Why choose one when you can choose three? Select three appetizers and enjoy! Served with dipping sauces.',1,0,'Appetizers',1,1,1,0,0),(131,'Tripple Dipper','Why choose one when you can choose three? Select three appetizers and enjoy! Served with dipping sauces.',1,0,'Appetizers',1,1,1,0,0),(132,'Tripple Dipper','Why choose one when you can choose three? Select three appetizers and enjoy! Served with dipping sauces.',1,0,'Appetizers',1,1,1,0,0),(133,'Burger','description',1,0,'custom',0,1,1,0,0),(134,'Burger','description',1,0,'custom',0,1,1,0,0),(135,'Burger','description',1,0,'custom',0,1,1,0,0),(136,'Burger','description',1,0,'custom',0,1,1,0,0),(137,'Burger','description',1,0,'custom',0,1,1,0,0),(138,'Burger','description',1,0,'custom',0,1,1,0,0),(139,'Burger','description',1,0,'custom',0,1,1,0,0),(140,'Burger','description',1,0,'custom',0,1,1,0,0),(141,'Burger','description',1,0,'custom',0,1,1,0,0),(142,'Burger','description',1,0,'custom',0,1,1,0,0),(143,'test','',1,100,'category',0,0,0,0,0),(144,'test','',1,100,'category',0,0,0,0,0),(145,'Burger','description',1,0,'custom',0,1,1,0,0),(146,'Cheese Pizza','The cheesiest',1,750,'Pizzas',1,0,1,0,0),(147,'Pepperoni Pizza','The classic',1,850,'Pizzas',1,0,1,0,0),(148,'Burger','description',1,0,'custom',0,1,1,0,0),(149,'Burger','description',1,0,'custom',0,1,1,0,0),(150,'test item','test description',1,100,'test category',1,0,0,0,0),(151,'Burger','description',1,0,'custom',0,1,1,0,0),(152,'Burger','description',1,0,'custom',0,1,1,0,0),(153,'Burger','description',1,0,'custom',0,1,1,0,0),(154,'Burger','description',1,0,'custom',0,1,1,0,0),(155,'Burger','description',1,0,'custom',0,1,1,0,0),(156,'Burger','description',1,0,'custom',0,1,1,0,0),(157,'Burger','description',1,0,'custom',0,1,1,0,0),(158,'Burger','description',1,0,'custom',0,1,1,0,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MenuTimes`
--

LOCK TABLES `MenuTimes` WRITE;
/*!40000 ALTER TABLE `MenuTimes` DISABLE KEYS */;
INSERT INTO `MenuTimes` VALUES (3,8,1200,2400),(4,7,1030,1400),(6,7,1500,2300),(7,9,1100,2100),(8,10,1100,2100),(9,11,1100,1500),(10,12,1630,2200),(11,13,1100,1430),(12,14,1700,2100),(13,15,1000,1700),(14,15,1000,2359),(25,32,1000,2400),(38,48,1000,2300),(39,49,1000,2300),(54,65,1000,1500);
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
  `optionStatus` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`optionID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Options`
--

LOCK TABLES `Options` WRITE;
/*!40000 ALTER TABLE `Options` DISABLE KEYS */;
INSERT INTO `Options` VALUES (1,'Add Bacon',1.50,1),(2,'Extra Pickles',0.00,1),(3,'Add Fried Onions',0.00,1),(4,'Add Cheese',0.50,1),(5,'Extra Cheese',1.50,1);
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
  `comments` varchar(250) DEFAULT NULL,
  `orderID` int(11) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`orderItemID`),
  KEY `menuItemID` (`menuItemID`),
  KEY `OrderItem_ibfk_2` (`orderID`),
  CONSTRAINT `OrderItem_ibfk_1` FOREIGN KEY (`menuItemID`) REFERENCES `MenuItem` (`itemID`),
  CONSTRAINT `OrderItem_ibfk_2` FOREIGN KEY (`orderID`) REFERENCES `Orders` (`orderID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderItem`
--

LOCK TABLES `OrderItem` WRITE;
/*!40000 ALTER TABLE `OrderItem` DISABLE KEYS */;
INSERT INTO `OrderItem` VALUES (1,35,1,'Cooked medium-rare',1,0.00),(2,38,2,'Extra spicy',1,0.00),(3,39,2,NULL,2,0.00),(4,43,1,NULL,2,0.00),(5,41,1,'Please put the sauce on the side',2,0.00),(6,42,1,'Extra Pickles',1,0.00),(7,8,2,NULL,3,7.99),(8,10,1,'extra spicy',3,10.99),(9,11,1,NULL,3,7.99),(10,14,1,'no mushrooms please',3,10.99),(11,8,2,NULL,8,0.00),(12,10,3,NULL,8,0.00),(13,14,1,'extra rice',8,0.00),(14,56,1,NULL,1,0.00),(15,56,1,NULL,1,0.00),(33,146,2,'Extra napkins please',19,17.98),(34,147,1,'N/A',19,10.99),(50,89,2,'Extra sauce please',39,24.58),(51,90,1,'N/A',39,15.99),(52,56,1,NULL,1,0.00);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `orderTime` datetime DEFAULT NULL,
  `chargeAmount` decimal(10,2) DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  `orderStatus` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`orderID`),
  KEY `Orders_ibfk_11_idx` (`userID`),
  KEY `Orders_ibfk_12_idx` (`tableID`),
  CONSTRAINT `Orders_ibfk_11` FOREIGN KEY (`userID`) REFERENCES `Users` (`userID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `Orders_ibfk_12` FOREIGN KEY (`tableID`) REFERENCES `RestaurantTables` (`tableID`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
INSERT INTO `Orders` VALUES (1,1,'2020-04-14 14:15:00',0.00,2,0),(2,1,'2020-04-15 12:30:00',0.00,2,0),(3,1,'2020-04-13 18:45:00',0.00,2,0),(4,1,'2020-04-15 12:30:00',0.00,2,0),(5,1,'2020-04-14 14:15:00',0.00,2,0),(6,1,'2020-04-13 18:45:00',0.00,2,0),(7,1,'2020-04-15 12:30:00',0.00,2,0),(8,1,'2020-04-15 12:30:00',0.00,2,0),(9,1,'2020-04-13 18:45:00',0.00,2,0),(19,12,'2020-04-23 21:08:03',29.84,32,1),(38,1,'2020-05-05 01:34:49',NULL,2,0),(39,1,'2020-05-05 20:41:21',41.79,2,1),(40,1,'2020-05-05 20:56:20',NULL,3,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci CHECKSUM=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Restaurant`
--

LOCK TABLES `Restaurant` WRITE;
/*!40000 ALTER TABLE `Restaurant` DISABLE KEYS */;
INSERT INTO `Restaurant` VALUES (1,'Scooters','University of St. Thomas fast dining','2115 Summit Ave',7.70,'St. Paul','MN',55105,'United States'),(2,'Khao Hom','Thai Restaurant','2411 Central Ave NE',7.00,'Minneapolis','MN',55418,'United States'),(3,'Chipotle Mexican Restaurant','Fast-food Mexican Restaurant','2600 Hennepin Ave',7.00,'Minneapolis','MN',55408,'United States'),(4,'Roti Modern Mediterranean','Mediterranean','614 Washington Ave SE',0.00,'Minneapolis','MN',55414,'United States'),(5,'Red Cow Restaurant','Hamburger','393 Selby Avenue',0.03,'St. Paul','MN',55105,'United States'),(11,'test','test restaurant','address',2.30,'chaska','mn',55318,'USA'),(19,'Davannis','Go-To Spot for pizza and sandwiches','1234 Addr St.',0.03,'St. Paul','MN',55105,'USA');
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
  `tableID` int(11) NOT NULL AUTO_INCREMENT,
  `alexaID` varchar(100) DEFAULT NULL,
  `tableNumber` int(11) DEFAULT NULL,
  `restaurantID` int(11) DEFAULT NULL,
  PRIMARY KEY (`tableID`),
  UNIQUE KEY `alexaID_UNIQUE` (`alexaID`),
  KEY `RestaurantTables_ibfk_1_idx` (`restaurantID`),
  CONSTRAINT `RestaurantTables_ibfk_1` FOREIGN KEY (`restaurantID`) REFERENCES `Restaurant` (`restaurantId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RestaurantTables`
--

LOCK TABLES `RestaurantTables` WRITE;
/*!40000 ALTER TABLE `RestaurantTables` DISABLE KEYS */;
INSERT INTO `RestaurantTables` VALUES (1,'1',1,5),(12,'alexaID1234',1,19);
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
  `email` varchar(100) DEFAULT NULL,
  `token` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`userID`),
  UNIQUE KEY `token_UNIQUE` (`token`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (2,'Bob','Jones','bob@jones.com','test123'),(3,'\"sosa\"','\"edison\"','\"sosaedison69@gmail.com\"','\"ya29.a0Ae4lvC2NN3o3oJpRm5uJaR8PO95HUYu1ND4MZCBJgJh9N8oMYv4HScjkOpE06su194pQ5Uuo7Hc5S4LAxt0Qmae-n78p5-C5QSlZYxh5q1yQcndoUXJpjxlZ8jZ99LVbovc1Z1hogOQO9yMV7JYi6Y3rGqbOC4yQkGkx\"'),(12,'Default User','','',''),(21,'tyler','beverley','tylerbeverley@test1.gmail.com','1'),(22,'Mitchell','Nelson','mitchell.s.nels@gmail.com','token'),(28,'Riley','Tschumper','riley.tschumper@gmail.com','token1'),(32,'Bob','Smith','bob@smith.com','test1234'),(33,'tyler','beverley','tylerbeverley@test2.gmail.com','11');
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'AutoGarcon'
--
/*!50003 DROP PROCEDURE IF EXISTS `AddFavoriteRestaurant` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masterUser`@`%` PROCEDURE `AddFavoriteRestaurant`(IN userId INT, IN rID INT)
BEGIN
	
    -- Adds favorite restaurant(s) to a specified user with a restuarant ID --

	INSERT INTO	FavoriteRestaurants (userID, restaurantID)
    VALUES(userId, rID);
    
    -- Return the newly created favorite ID -- 
    SELECT LAST_INSERT_ID() AS newFavoriteID;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
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
CREATE DEFINER=`masterUser`@`%` PROCEDURE `AddItemToOrder`(IN orderIDToAddTo INT, IN menuItemIDToAdd INT, IN menuID INT, IN quantityToAdd INT, IN commentsToAdd VARCHAR(250))
BEGIN
	
    -- Declare a new variable, inputPrice  -- 
	DECLARE inputPrice DECIMAL(10,2);
	SELECT price
    FROM MenuContains 
    -- Store the price from MenuContains for menuItem into the inputPrice variable -- 
    WHERE MenuContains.menuId = menuID AND MenuContains.menuItemID = menuItemIDToAdd INTO inputPrice;
    
    
    -- Add the menuItem into the OrderItem by orderID -- 
	INSERT INTO OrderItem (menuItemID, quantity, comments, orderID, price)
    VALUES (menuItemIDToAdd, quantityToAdd, commentsToAdd, orderIDToAddTo, inputPrice * quantityToAdd);
    
    -- Return the newly created order item ID  --
    SELECT LAST_INSERT_ID() AS newOrderItemID;
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

	-- Adds a user as a manager to a specified restaurant -- 
	INSERT INTO RestaurantManagers(userID, restaurantID)
    VALUES (userID, restaurantID);
    
    -- Return the newly created manager ID -- 
    SELECT LAST_INSERT_ID() AS newManagerID;
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
	-- Add the given option to the given order item with matching orderItemID -- 
	INSERT INTO OrderItemHasOptions(orderItemID, optionID)
    VALUES (orderItemID, optionID);
    
    -- return the newly created order item option ID --
    SELECT LAST_INSERT_ID() AS newOrderItemOptionID;
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
    -- store price of order in temp table
    CALL GetTotalPriceOfOrder(oID);
    
    -- update the order's charge amount to match the total price
    UPDATE Orders
    SET chargeAmount = (SELECT c1 FROM tmp LIMIT 1)
    WHERE orderID = oID;
    
    -- Return the new charge amount
    SELECT chargeAmount
    FROM Orders
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
CREATE DEFINER=`masterUser`@`%` PROCEDURE `CreateNewMenu`(IN startTime INT, IN endTime INT, IN mStatus INT, IN  menuName varchar(255), IN restaurantID INT)
BEGIN 

	-- Create a new variable, menuID -- 
	DECLARE menuID INT;
    INSERT INTO Menu(menuStatus, menuName, restaurantID) 
	VALUES(mStatus, menuName, restaurantID); 
    
    -- Store the newly generated insert ID into the variable menuID --
    SELECT LAST_INSERT_ID() INTO menuID;
    
    -- Insert the menuID, start and end time into MenuTimes table -- 
    INSERT INTO MenuTimes( menuID, startTime, endTime) 
	VALUES( (SELECT LAST_INSERT_ID() ), startTime, endTime);   
    
    -- Return the menuID -- 
    SELECT menuID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateNewMenuItem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masterUser`@`%` PROCEDURE `CreateNewMenuItem`(IN mID INT, IN iName VARCHAR(100), IN idesc VARCHAR(250), IN iCategory VARCHAR(100), IN iPrice Decimal(10,2), IN iGluten TINYINT, IN iMeat TINYINT, IN iDairy TINYINT, IN iNuts TINYINT, IN iSoy TINYINT, IN calories INT)
BEGIN

	-- Create variable createdMenuItemID --
	DECLARE createdMenuItemID INT;
    
    -- Insert the passed variables into the MenuItem Table --
	INSERT INTO MenuItem(itemName, description, category, gluten, meat, dairy, nuts, soy, calories, itemStatus)
    VALUES(iName, idesc, iCategory, iGluten, iMeat, iDairy, iNuts, iSoy, calories, 1);
    
    -- Store the generated insert ID into createMenuItemID --  
    SELECT LAST_INSERT_ID() INTO createdMenuItemID;
    
    -- Call the updateMenuContains table to add the menuItem price -- 
    CALL updateMenuContains(mID, LAST_INSERT_ID(), iPrice);
    
    -- Return createdMenuItemID -- 
    SELECT createdMenuItemID;
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
CREATE DEFINER=`masterUser`@`%` PROCEDURE `CreateNewOrder`(IN tableID INT, IN customerID INT )
BEGIN
	
	-- Insert the passed values into the order table --
	INSERT INTO Orders(tableID, orderTime, userID, orderStatus)
    VALUES (tableID, NOW(), customerID, 0);
    
    -- Return the newly generated insert id -- 
    SELECT LAST_INSERT_ID() AS newOrderID;
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
CREATE DEFINER=`masterUser`@`%` PROCEDURE `CreateNewRestaurant`(IN rName varchar(100), IN rDescr varchar(100), IN rAddress varchar(100), IN rSalesTax DECIMAL(10,2), IN rCity varchar(100), IN rState varchar(100), IN rZip INT, IN rCountry varchar(100))
BEGIN

	-- Insert the passed values into the Restaurant table --
	INSERT into Restaurant(restaurantName, description, address, salesTax, city, state, zipCode, country)
    VALUES(rName, rDescr, rAddress, rSalesTax, rCity, rState, rZip, rCountry);
    
    -- Return the newly generated insert ID --
    SELECT LAST_INSERT_ID() AS newRestaurantID;
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
CREATE DEFINER=`masterUser`@`%` PROCEDURE `CreateOptionForMenuItem`(IN oName VARCHAR(100), IN oPrice DECIMAL(10,2), IN itemID INT )
BEGIN
	DECLARE oID INT;
	-- INSERT IF DOESN'T EXIST --
	IF (SELECT EXISTS(SELECT * FROM Options WHERE optionName = oName AND price = oPrice AND optionStatus = 1) = 0) THEN
		INSERT INTO Options(optionName, price, optionStatus)
		VALUES (oName, oPrice, 1);
	END IF;
    
    SELECT optionID INTO oID FROM Options WHERE optionName = oName AND price = oPrice;
    
    -- Update contains table --
    INSERT INTO ItemHasOptions(itemID, optionID)
    VALUES(itemID, oID);
    
    SELECT LAST_INSERT_ID() AS newMenuItemOptionID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateRestaurantTable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masterUser`@`%` PROCEDURE `CreateRestaurantTable`(IN alexaID VARCHAR(100), IN tableNumber INT, IN restaurantID INT)
BEGIN

	-- Insert the given values into the RestaurantTables table --
	INSERT INTO RestaurantTables(alexaID, tableNumber, restaurantID)
    VALUES (alexaID, tableNumber, restaurantID);
    
    -- Return the newly genearated insert ID --
    SELECT LAST_INSERT_ID() AS newTableID;
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
CREATE DEFINER=`masterUser`@`%` PROCEDURE `CreateUser`(IN firstName VARCHAR(45), IN lastName VARCHAR(45), IN email VARCHAR(100), IN token VARCHAR(300) )
BEGIN

	-- Insert the given values into the Users table --
	INSERT INTO Users(firstName, lastName, email, token)
    VALUES (firstName, lastName, email, token);
    
    -- Return the newly generated inset ID --
    SELECT LAST_INSERT_ID() AS newUserID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAccessibleMenus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetAccessibleMenus`(IN rID int, IN currentTime INT)
BEGIN
	-- Return all menus of valid time, matching restaurant id, and active status
	SELECT *
    FROM Menu
    WHERE menuID IN (
		SELECT menuID
		FROM MenuTimes
		WHERE currentTime BETWEEN startTime AND endTime)
	AND restaurantID = rID
    AND menuStatus = 1;
    
	-- SELECT * FROM AutoGarcon.Menu WHERE restaurantID = rID AND menuStatus = 1;
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
	
    -- Select all orders that are toggled active in the Orders table -- 
	SELECT *
    FROM Orders
    WHERE userID = uID AND orderStatus = 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllOrderItemsFromOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetAllOrderItemsFromOrder`(IN myOrderID INT)
BEGIN

	-- Returns all the order items for passed orderID --
	SELECT OrderItem.orderItemID, MenuItem.*, OrderItem.quantity, OrderItem.price, OrderItem.comments
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

	-- Returns all orders in the Order table that are marked complete --
	SELECT *
    FROM Orders
    WHERE userID = uID AND orderStatus = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetFavoriteRestaurants` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetFavoriteRestaurants`(IN inputUserID int)
BEGIN

	-- Pulls the user associated with the passed inputUserID --
	SELECT Users.userID, Users.firstName, Users.lastName, Restaurant.restaurantID, Restaurant.restaurantName, Menu.menuID, Menu.menuName, MenuTimes.startTime, MenuTimes.endTime
	
	-- Join the Users and Restaurant tables with the FavoriteRestaurants based on the user and restaurant IDs --
    FROM Users JOIN FavoriteRestaurants ON Users.userID = FavoriteRestaurants.userID
	JOIN Restaurant ON FavoriteRestaurants.restaurantID = Restaurant.restaurantID
	JOIN Menu ON Restaurant.restaurantID = Menu.restaurantID
	
    -- Join the MenuTimes table and Menu table on menus currently avaiable on the FavoriteMenus table--
    JOIN MenuTimes ON Menu.menuID = MenuTimes.menuID
	WHERE Users.userID = inputUserID AND Menu.menuStatus = 1;
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

	-- Select all active menu items from the passed menu ID --
	SELECT items.*, MenuContains.price, MenuContains.containsID
    FROM MenuContains JOIN (SELECT * FROM AutoGarcon.MenuItem
							WHERE itemID IN (SELECT menuItemID FROM AutoGarcon.MenuContains WHERE menuID=id)
							AND itemStatus = 1) AS items
						ON MenuContains.menuItemID = items.itemID AND MenuContains.menuID = id;
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
	
    -- Return all menu items with names matching the passed iName --
	SELECT *
    FROM AutoGarcon.MenuItem WHERE itemName = iName AND itemStatus = 1;
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

	-- Return all menus associated with the passed Restaurant ID --
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

	-- Return the times the menu is available for the passed menuID -- 
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

	-- Return all the available options for the given menuItem ID --
	SELECT *
    FROM Options
    WHERE optionStatus = 1 AND optionID IN (SELECT ItemHasOptions.optionID FROM ItemHasOptions WHERE ItemHasOptions.itemID = iID);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetOptionsForOrderItem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetOptionsForOrderItem`(IN oItemID INT)
BEGIN
	SELECT subQ.optionID, subQ.optionName, (subQ.price * OrderItem.quantity) AS price
    FROM
		(SELECT *
		FROM Options 
		WHERE Options.optionID IN (SELECT OrderItemHasOptions.optionID
							FROM OrderItemHasOptions
							WHERE OrderItemHasOptions.orderItemID = oItemID)) AS subQ
		JOIN OrderItemHasOptions ON subQ.optionID = OrderItemHasOptions.optionID
        JOIN OrderItem ON OrderItem.orderItemID = OrderItemHasOptions.orderItemID;
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

	-- Select all orders that match the orderID --
	SELECT *
    FROM Orders
    WHERE orderID = oID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetOrdersInPast24Hours` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetOrdersInPast24Hours`(IN uID INT)
BEGIN

	-- Return every order from Orders from the past 24 hours for a given user --
	SELECT * FROM Orders
	WHERE orderTime >= NOW() - INTERVAL 1 DAY AND userID = uID;
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

	-- Return all restaurants with a name matching rName --
	SELECT *
    FROM AutoGarcon.Restaurant WHERE restaurantName=rName;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetRestaurantByTable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetRestaurantByTable`(IN tID INT)
BEGIN

	-- Return the restuarant assocaited with the passed table ID --
	SELECT restaurantID
    FROM RestaurantTables
    WHERE tableID = tID;
    
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

	-- Return restaurant associated with the given manager ID --
	SELECT restaurantID
    FROM RestaurantManagers
    WHERE userID = iUserID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetTableByAlexaID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetTableByAlexaID`(IN aID VARCHAR(100))
BEGIN

	-- Return the table ID associated with the given Alexa ID --
	SELECT tableID
    FROM AutoGarcon.RestaurantTables WHERE alexaID = aID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetTableID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetTableID`(IN rID INT, IN tableNum INT)
BEGIN
	-- Gets the unique table identifier based on the restaurant ID and table number
	SELECT tableID
    FROM RestaurantTables
    WHERE restaurantID = rID AND tableNumber = tableNum;
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
	DECLARE itemBaseCost, optionsCost, costBeforeTax, taxPercent, salesTaxCost, totalCost DECIMAL(10,2);
    
    -- Get cost of all items together --
	SELECT SUM(OrderItem.price) INTO itemBaseCost
	FROM OrderItem
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
        
	-- Account for nulls --
    IF(itemBaseCost IS NULL)
		THEN SET itemBaseCost = 0.0;
	END IF;
    IF(optionsCost IS NULL)
		THEN SET optionsCost = 0.0;
	END IF;
    IF(taxPercent IS NULL)
		THEN SET taxPercent = 0.0;
	END IF;
    
    
    SET costBeforeTax = itemBaseCost + optionsCost;
    SET salesTaxCost = costBeforeTax * taxPercent;
    SET totalCost = costBeforeTax + salesTaxCost;
    
    -- store in temp table for outer calls to use
    DROP TABLE IF EXISTS tmp;
    CREATE TEMPORARY TABLE tmp(c1 DECIMAL(10,2), c2 DECIMAL(10,2), c3 DECIMAL(10,2));
    INSERT INTO tmp(c1,c2,c3)
    VALUES(totalCost,salesTaxCost,costBeforeTax);
    
    SELECT totalCost, salesTaxCost, costBeforeTax;
    
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

	-- Return the user associated with the given token --
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
CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetUserIdByEmail`(IN emailAddress VARCHAR(45) )
BEGIN

	-- Return the user associated with the given email address --
	SELECT userID
    FROM Users
    WHERE email = emailAddress;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MarkOrderReady` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masterUser`@`%` PROCEDURE `MarkOrderReady`(IN oID INT)
BEGIN
	-- Mark the order status to be ready to go out to a table
    UPDATE Orders
    SET orderStatus = 1
    WHERE orderID = oID;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegisterAlexaID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masterUser`@`%` PROCEDURE `RegisterAlexaID`(IN aID VARCHAR(100), IN tID INT)
BEGIN
	-- Registers an alexa ID for a specific table --
	UPDATE RestaurantTables
    SET alexaID = aID
    WHERE tableID = tID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RemoveFavoriteRestaurant` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masterUser`@`%` PROCEDURE `RemoveFavoriteRestaurant`(IN uID INT, IN rID INT)
BEGIN

	-- Removes the restaurant matching the rID from the users uID assocaited favorite restaurants --
	DELETE FROM FavoriteRestaurants
    WHERE userID = uID AND restaurantID = rID;
    
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

	-- Sets the menuStatus for given menu to 0, or inactive --
    UPDATE Menu
    SET menuStatus = 0
    WHERE menuID = mID;
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

	-- Sets the menu status for the given menu Item to 0, or inactive --
    UPDATE MenuItem
    SET itemStatus = 0
    WHERE itemID = iID;
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
CREATE DEFINER=`masterUser`@`%` PROCEDURE `RemoveMenuTime`(IN tID INT)
BEGIN

	-- Remove the passed time ID from the MenuTimes table --
	DELETE FROM MenuTimes
    WHERE (timeID = tID);
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
CREATE DEFINER=`masterUser`@`%` PROCEDURE `RemoveOption`(IN oID INT )
BEGIN

	-- Sets the option status for the passed option to 0, or inactive -- 
	UPDATE Options
    SET optionStatus = 0
    WHERE optionID = oID;
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
CREATE DEFINER=`masterUser`@`%` PROCEDURE `RemoveUser`(IN uID INT )
BEGIN

	-- Removes the given user from the Orders and Users tables --
	DELETE FROM Orders WHERE userID = uID;
	DELETE FROM Users WHERE userID = uID;
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

	-- Sets the given menu's menu time to the given start and end times --
	INSERT into MenuTimes(menuID, startTime, endTime)
    VALUES (menuID, startTime, endTime);
    
    SELECT LAST_INSERT_ID() AS newTimeID;
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

	-- Updates the price on the MenuContains table for the given menu and menuItem --
	INSERT INTO MenuContains(menuID, menuItemID, price)
    VALUES (mID, iID, iPrice);
    
    SELECT LAST_INSERT_ID() AS newMenuContainsID;
    
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
													 
													 
-- Dump completed on 2020-05-06 22:34:31
