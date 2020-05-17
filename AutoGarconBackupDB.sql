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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FavoriteRestaurants`
--

LOCK TABLES `FavoriteRestaurants` WRITE;
/*!40000 ALTER TABLE `FavoriteRestaurants` DISABLE KEYS */;
INSERT INTO `FavoriteRestaurants` VALUES (1,28,3),(2,28,4),(3,22,3),(5,32,5),(14,34,5),(30,35,5);
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
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Menu`
--

LOCK TABLES `Menu` WRITE;
/*!40000 ALTER TABLE `Menu` DISABLE KEYS */;
INSERT INTO `Menu` VALUES (7,1,'Red Cow Lunch',5),(8,1,'Red Cow Happy Hour',5),(9,1,'Scooters Menu',1),(10,1,'Chipotle Menu',3),(11,1,'Khao Hom Lunch',2),(12,1,'Khao Hom Dinner',2),(13,1,'Roti Lunch Menu',2),(14,1,'Roti Dinner Menu',2),(15,1,'Roti Happy Hour Selections',2),(32,0,'Burgers',5),(48,1,'Dinner',5),(49,0,'Dinner',5),(65,1,'Lunch',19),(76,1,'Lunch',31),(77,1,'Dinner',31),(78,1,'Happy Hour',31),(79,1,'Carry Out - Curbside - Delivery Menu',32),(80,1,'Happy Hour',32),(81,1,'Award-Winning Craft Beer Menu',32),(82,1,'North Indian',33),(83,1,'South Indian',33),(84,1,'Indo-chin',33);
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
) ENGINE=InnoDB AUTO_INCREMENT=243 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MenuContains`
--

LOCK TABLES `MenuContains` WRITE;
/*!40000 ALTER TABLE `MenuContains` DISABLE KEYS */;
INSERT INTO `MenuContains` VALUES (7,51,11.99,44),(7,54,6.50,47),(7,55,7.00,48),(8,1,4.50,49),(8,2,5.50,50),(8,3,5.25,51),(8,4,5.00,52),(8,5,5.00,53),(48,75,13.99,69),(48,76,11.29,70),(48,77,7.49,71),(48,78,8.99,72),(48,79,10.79,73),(48,80,10.99,74),(48,81,11.49,75),(48,82,15.29,76),(48,83,16.29,77),(48,84,14.99,78),(48,85,12.99,79),(48,86,13.99,80),(48,87,11.99,81),(48,88,12.99,82),(48,89,12.29,83),(48,90,15.99,84),(48,91,11.59,85),(48,92,11.59,86),(48,93,12.59,87),(48,94,11.89,88),(48,95,11.89,89),(49,96,13.99,90),(49,97,11.29,91),(49,98,7.49,92),(49,99,8.99,93),(49,100,10.79,94),(49,101,10.99,95),(49,102,11.49,96),(49,103,15.29,97),(49,104,16.29,98),(49,105,14.99,99),(49,106,12.99,100),(49,107,13.99,101),(49,108,11.99,102),(49,109,12.99,103),(49,110,12.29,104),(49,111,15.99,105),(49,112,11.59,106),(49,113,11.59,107),(49,114,12.59,108),(49,115,11.89,109),(49,116,11.89,110),(48,144,12.90,138),(65,146,8.99,140),(65,147,10.99,141),(76,159,11.50,153),(76,160,9.25,154),(76,161,10.50,155),(76,162,10.50,156),(76,163,9.50,157),(76,164,9.25,158),(76,165,8.95,159),(76,166,10.75,160),(76,167,11.25,161),(76,168,9.50,162),(77,169,13.75,163),(77,170,12.25,164),(77,171,11.95,165),(77,172,11.95,166),(77,173,16.25,167),(77,174,14.50,168),(77,175,14.50,169),(77,176,16.95,170),(77,177,20.25,171),(77,178,16.00,172),(78,179,6.00,173),(78,180,8.00,174),(78,181,9.00,175),(78,182,10.50,176),(78,183,11.25,177),(78,184,11.25,178),(78,185,11.25,179),(78,186,11.25,180),(78,187,11.50,181),(78,188,NULL,182),(79,189,14.90,183),(79,190,13.50,184),(79,191,14.90,185),(79,192,10.90,186),(79,193,14.90,187),(79,194,13.50,188),(79,195,15.90,189),(79,196,12.90,190),(79,197,14.90,191),(79,198,14.50,192),(79,199,14.90,193),(79,200,15.50,194),(79,201,12.50,195),(80,202,9.90,196),(80,203,9.90,197),(80,204,8.50,198),(80,205,12.50,199),(80,206,13.50,200),(80,207,10.90,201),(80,208,12.90,202),(80,209,9.90,203),(81,210,15.99,204),(81,211,17.24,205),(81,212,16.75,206),(81,213,16.75,207),(81,214,16.75,208),(81,215,16.75,209),(81,216,17.24,210),(81,217,16.75,211),(81,218,16.75,212),(84,219,11.99,213),(83,220,3.99,214),(83,221,12.99,215),(83,222,14.99,216),(83,223,4.99,217),(83,224,12.99,218),(83,225,15.99,219),(83,226,12.99,220),(83,227,12.99,221),(84,228,12.99,222),(83,229,4.99,223),(82,230,3.99,224),(82,231,4.99,225),(84,232,11.99,226),(84,233,11.99,227),(84,234,11.99,228),(83,235,4.99,229),(83,236,12.99,230),(83,237,12.99,231),(82,238,10.99,232),(84,239,10.99,233),(84,240,10.99,234),(84,241,10.99,235),(82,242,3.99,236),(82,243,2.99,237),(82,244,2.99,238),(82,245,3.99,239),(82,246,3.99,240),(82,247,4.99,241),(82,248,3.99,242);
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
) ENGINE=InnoDB AUTO_INCREMENT=249 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MenuItem`
--

LOCK TABLES `MenuItem` WRITE;
/*!40000 ALTER TABLE `MenuItem` DISABLE KEYS */;
INSERT INTO `MenuItem` VALUES (1,'French Fries','Crispy fries',1,400,'Appetizers',0,0,0,0,0),(2,'Traditional Tots','Classic potato tater tots',1,400,'Appetizers',0,0,0,0,0),(3,'Chicken Strips','Crispy chicken strips',1,800,'Appetizers',0,0,0,0,0),(4,'Cheese Curds','Little fried cheese balls',1,750,'Appetizers',0,0,0,0,0),(5,'Mozzarella Sticks','Good with marinara',1,750,'Appetizers',0,0,0,0,0),(6,'Grilled Cheese','Rosemary Bread with your choice of cheese',1,850,'Paninis',0,0,0,0,0),(7,'Chicken Avocado','Rosemary Bread, Chicken, Gouda, Avocado Mayo, Spinach',1,825,'Paninis',0,0,0,0,0),(8,'Curry Basil Leaved Fried Rice','Spicy*. Zesty red curry paste stir fried with Jasmine rice, egg, basil, onion, and bell peppers.\n',1,272,'Thai Fried Rice',0,0,0,0,0),(9,'Pad Thai','A staple of every Thai restaurant, Pad Thai is a stir fried rice noodle, tangy pad Thai sauce, egg, green onions, and bean sprouts served with crushed peanut and lime on the side.',1,1131,'Noodle Stir Fry',0,0,0,0,0),(10,'Rice Noodle  gluten free','Gluten Free* Thai classic street noodle soup, Goid-Tiou. Just like in Thailand, you get your choice of noodle and meat in this delightful and delicious Thai spice soup. All soup is served with bean sprouts, jalapeno, and sweet basil.',1,192,'Noodle Soup',0,0,0,0,0),(11,'Thai Fried Rice','Thai Jasmine rice blended with egg, onions, tomatoes, and scallions.',1,137,'Lunch Specials',0,0,0,0,0),(12,' Red Curry','Gluten Free* *Spicy* Red curry paste, coconut milk, egg plant, bell peppers, bamboo shoots, lime leaves, and basil. Served with rice.',1,441,'Lunch Specials',0,0,0,0,0),(13,'Green Curry','Gluten Free* *Spicy* Green curry paste, coconut milk, egg plant, bell peppers, bamboo shoots, lime leaves, and basil. Served with rice.',1,310,'Lunch Specials',0,0,0,0,0),(14,'Pad Ruom Mid','Stir fried seasonal vegetables in our soy based sauce.\n',1,547,'Lunch Specials',0,0,0,0,0),(15,'Noodle Soup','*Gluten Free* One of Thailand’s favorite street food. Rice noodles in a rich clear broth served with bean sprouts, lime, jalapeno, and sweet basil.',1,120,'Lunch Specials',0,0,0,0,0),(16,'California Burger','Burger topped with lettuce, tomato, onion and mayonaise',1,850,'Burgers',0,0,0,0,0),(17,'Flame Thrower Burger','Spicy burger with sauteed onions and jalepenos topped with ghost pepper cheese and sriracha mayo',1,1000,'Burgers',0,0,0,0,0),(18,'Pretzel Bites','Bavarian pretzel bites served with hot queso dip',1,400,'Starters',0,0,0,0,0),(19,'Frickles','Seasoned and deep friend pickle spears servedwith ranch or jalapeno ranch',1,350,'Starters',0,0,0,0,0),(20,'Chicken Club','Crispy or grilled chicken breast topped with honey mustard on a toated bun',1,610,'Sandwiches',0,0,0,0,0),(21,'The Galaxy','Pepperoni, sausage, mushroom, onions and green pepper pizza',1,1500,'Moon Pizzas',0,0,0,0,0),(22,'Midnight Munchies','Garlic butter bites and mozzarella served with pizza sauce for dipping',1,740,'Moon Pizzas',0,0,0,0,0),(23,'Grilled Salmon','6oz Keta salmon filt wild caught from Alaska and served with a dill butter sauce',1,630,'Entrees',0,0,0,0,0),(24,'Redhook Battered Shrimp','Beer battered tail-off shrimp served with cocktail or tartar sauce and lemon wedge',1,580,'',0,0,0,0,0),(25,'Yum Neua','Spicy* Grilled beef, tomatoes, cucumbers, lettuce, onions, and cilantro in spicy lime herb dressing.',1,490,'Salad',0,0,0,0,0),(26,'Fried Ice Cream','Crispy breading on the outside with creamy ice cream inside.',1,450,'',0,0,0,0,0),(27,'Ultimate','CAB® burger, wisconsin aged cheddar, iceberg lettuce, tomato, onion & Red Cow sauce',1,750,'Burgers',0,1,1,0,0),(28,'Barcelona','CAB® burger, manchego, prosciutto, piquillo pepper & smoked aioli',1,750,'Burgers',0,1,1,0,0),(29,'60/40','60% CAB® & 40% ground bacon patty, wisconsin aged cheddar, beer mustard and candied bacon',1,750,'Burgers',0,1,1,0,0),(30,'Blues Burger','CAB® burger, wisconsin blue cheese & apricot-rosemary black pepper jam',1,750,'Burgers',0,1,1,0,0),(31,'Patty Melt','CAB* burger, caramelized onion, sharp cheddar, white american & garlic mayo',1,750,'Burgers',0,1,1,0,0),(32,'Breakfast','CAB® burger, peanut butter, over-easy egg, bacon & wisconsin aged cheddar on sourdough',1,750,'Burgers',0,1,1,0,0),(33,'Cowboy','CAB® burger, wisconsin aged cheddar, root beer pulled pork, onion rings, BBQ sauce',0,750,'Burgers',0,1,1,0,0),(34,'Mushroom-Swiss','CAB® burger, merlot mushrooms, garlic mayo & swiss cheese',0,750,'Burgers',0,1,1,0,0),(35,'Manhattan 2.0','double patty, bacon confit, Gruyere, arugula & dried cherry-red wine chutney, pretzel bun',1,750,'Red Cow Grind',1,1,1,0,0),(36,'Double Barrel Burger','double patty, white american, grilled onion & special sauce',1,750,'Red Cow Grind',1,1,1,0,0),(37,'Quarter Pounder','single patty, yellow american, ketchup, mustard, house pickles',1,750,'Red Cow Grind',1,1,1,0,0),(38,'Tennessee Hot Chicken','southern fried chicken, tennessee hot sauce, blackstrap mayo, house pickles',1,750,'Sandwiches',1,1,1,0,0),(39,'Reuben','kraut, russian aioli, muenster, fresh dill, pumpernickel\nveggie (beets)',1,750,'Sandwiches',0,1,1,0,0),(40,'Salmon','responsibly sourced grilled salmon, lemon-herb mayo, greens, whole wheat bun $14.50',1,750,'Sandwiches',0,1,0,0,0),(41,'Buffalo Cauliflower','gluten-free breading, buffalo sauce, ranch',1,750,'Plant Based',0,0,0,0,0),(42,'So Cal Burger','impossible patty, avocado, american, garlic mayo, lettuce, tomato, onion, whole wheat bun',1,750,'Plant Based',0,0,1,0,0),(43,'Red Cow','organic mixed greens, crispy prosciutto, sunflower, pumpkin, and hemp seeds, shaved parmesan, balsamic vinaigrette',1,600,'Salads',0,1,1,1,0),(44,'Asian','cucumber, carrot, radish, peanuts, root vegetables, citrus-asian vinaigrette',1,550,'Salads',0,0,0,1,0),(45,'Taco','avocado, tinga chicken, queso fresco, tomato, onion, corn salsa, tortilla chips, greens, chipotle-parmesan dressing',1,750,'Salads',0,1,1,0,0),(46,'Beet & Quinoa Salad','roasted red and golden beets, arugula, quinoa, edamame, red peppers, garbanzos, balsamic vinaigrette, chevre',1,650,'Salads',0,1,0,1,0),(47,'Caesar','red & green romaine, garlic croutons, parmesan',1,700,'Salads',0,0,1,0,0),(51,'Chicken Sandwich','Amazing chicken sandwich on ciabatta',2,950,'Sandwiches',1,0,0,1,0),(54,'Standard Burger','The basic burger',1,750,'Burgers',1,1,1,0,0),(55,'Cheeseburger','The basic burger with cheese',1,800,'Burgers',1,1,1,0,0),(56,'French Fries','Delicious side of crispy fries',1,550,'Sides',1,0,0,0,0),(57,'Sweet Potato Fries','Delicious side of crispy sweet potato fries',1,500,'Sides',1,0,0,1,0),(58,'Onion Rings','Delicious side of crispy onion rings',1,520,'Sides',1,0,0,0,0),(59,'Cheese Curds','Delicious side of fresh Wisconsin cheese curds',1,650,'Sides',1,0,1,0,0),(60,'Burger','description',1,NULL,'custom',0,1,1,0,0),(61,'Tripple Dipper','Why choose one when you can choose three? Select three appetizers and enjoy! Served with dipping sauces.',1,NULL,'Appetizers',1,1,1,0,0),(62,'Southwestern Eggrolls','These aren’t your ordinary eggrolls. Crispy flour tortillas, chicken, black beans, corn, jalapeño Jack cheese, red peppers, spinach. Served with avocado-ranch.',1,NULL,'Appetizers',1,0,1,0,0),(63,'Skillet Queso','Your chip’s favorite dip for over 25 years. Original with beef. Served with chips & salsa.',1,NULL,'Appetizers',1,0,1,0,0),(64,'Fried Pickles','Served with house-made ranch.',1,NULL,'Appetizers',1,0,0,0,0),(65,'Queso Burger','This half-pound patty comes smothered in white queso, crunchy tortilla strips & pico.',1,NULL,'Burgers',1,1,1,0,0),(66,'Mushroom Swiss Burger','There’s so mush-room in our hearts for this one. Topped with sauteed onions, mushrooms, Swiss, lettuce, tomato & garlic aioli.',1,NULL,'Burgers',1,1,1,0,0),(67,'Southern Smokehouse Burger','Bacon, cheddar, pickles, Awesome Blossom Petals, lettuce, tomato, garlic aioli. Served with a side of original BBQ sauce.',1,NULL,'Burgers',1,1,1,0,0),(68,'Carnitas Fajitas','Pulled pork carnitas, grilled bell peppers & onions. Topped with a drizzle of mango-habanero sauce and green onions.',1,NULL,'Fajitas',1,1,1,0,0),(69,'Mushroom Jack Chicken Fajitas','Grilled chicken, sauteed mushrooms, crumbled bacon & mixed cheese.',1,NULL,'Fajitas',1,1,1,0,0),(70,'Black Bean & Veggie Fajitas','Black bean patty, roasted asparagus, sauteed mushrooms, corn & black bean salsa, queso fresco, avocado & a drizzle of spicy Santa Fe sauce.',1,NULL,'Fajitas',1,0,1,0,0),(71,'Cajun Chicken Pasta','Grilled chicken, penne in Alfredo sauce, topped with chile spices, Parmesan, tomatoes, green onions. Served with garlic toast.',1,NULL,'Chicken & Seafood',1,1,0,0,0),(72,'Cajun Shrimp Pasta','Shrimp, penne in Alfredo sauce, topped with chile spices, Parmesan, tomatoes, green onions. Served with garlic toast.',1,NULL,'Chicken & Seafood',1,1,0,0,0),(73,'Chipotle Chicken Fresh Mex Bowl','Grilled chicken, pico, field greens, Mexican rice, corn & black bean salsa, avocado, shredded cheese, tortilla strips, cilantro, chipotle pesto, house-made ranch.',1,NULL,'Chicken & Seafood',1,1,0,0,0),(74,'Chipotle Shrimp Fresh Mex Bowl','Shrimp, pico, field greens, Mexican rice, corn & black bean salsa, avocado, shredded cheese, tortilla strips, cilantro, chipotle pesto, house-made ranch.',1,NULL,'Chicken & Seafood',1,1,0,0,0),(75,'Tripple Dipper','Why choose one when you can choose three? Select three appetizers and enjoy! Served with dipping sauces.',1,650,'Appetizers',1,1,1,0,0),(76,'Southwestern Eggrolls','These aren’t your ordinary eggrolls. Crispy flour tortillas, chicken, black beans, corn, jalapeño Jack cheese, red peppers, spinach. Served with avocado-ranch.',1,650,'Appetizers',1,0,1,0,0),(77,'Skillet Queso','Your chip’s favorite dip for over 25 years. Original with beef. Served with chips & salsa.',1,650,'Appetizers',1,0,1,0,0),(78,'Fried Pickles','Served with house-made ranch.',1,650,'Appetizers',1,0,0,0,0),(79,'Queso Burger','This half-pound patty comes smothered in white queso, crunchy tortilla strips & pico.',1,650,'Burgers',1,1,1,0,0),(80,'Mushroom Swiss Burger','There’s so mush-room in our hearts for this one. Topped with sauteed onions, mushrooms, Swiss, lettuce, tomato & garlic aioli.',1,650,'Burgers',1,1,1,0,0),(81,'Southern Smokehouse Burger','Bacon, cheddar, pickles, Awesome Blossom Petals, lettuce, tomato, garlic aioli. Served with a side of original BBQ sauce.',1,650,'Burgers',1,1,1,0,0),(82,'Carnitas Fajitas','Pulled pork carnitas, grilled bell peppers & onions. Topped with a drizzle of mango-habanero sauce and green onions.',1,650,'Fajitas',1,1,1,0,0),(83,'Mushroom Jack Chicken Fajitas','Grilled chicken, sauteed mushrooms, crumbled bacon & mixed cheese.',1,650,'Fajitas',1,1,1,0,0),(84,'Black Bean & Veggie Fajitas','Black bean patty, roasted asparagus, sauteed mushrooms, corn & black bean salsa, queso fresco, avocado & a drizzle of spicy Santa Fe sauce.',1,650,'Fajitas',1,0,1,0,0),(85,'Cajun Chicken Pasta','Grilled chicken, penne in Alfredo sauce, topped with chile spices, Parmesan, tomatoes, green onions. Served with garlic toast.',1,650,'Chicken & Seafood',1,1,0,0,0),(86,'Cajun Shrimp Pasta','Shrimp, penne in Alfredo sauce, topped with chile spices, Parmesan, tomatoes, green onions. Served with garlic toast.',1,725,'Chicken & Seafood',1,1,0,0,0),(87,'Chipotle Chicken Fresh Mex Bowl','Grilled chicken, pico, field greens, Mexican rice, corn & black bean salsa, avocado, shredded cheese, tortilla strips, cilantro, chipotle pesto, house-made ranch.',1,725,'Chicken & Seafood',1,1,0,0,0),(88,'Chipotle Shrimp Fresh Mex Bowl','Shrimp, pico, field greens, Mexican rice, corn & black bean salsa, avocado, shredded cheese, tortilla strips, cilantro, chipotle pesto, house-made ranch.',1,725,'Chicken & Seafood',1,1,0,0,0),(89,'Spicy Shrimp Tacos','Three spicy chile-lime shrimp tacos in flour tortillas with pico, avocado, cilantro, coleslaw queso fresco. Served with Mexican rice & black beans.',1,725,'Chicken & Seafood',1,1,0,0,0),(90,'Ancho Salmon','Seared chile-rubbed Atlantic salmon, spicy citrus-chile sauce, cilantro, queso fresco. Served with Mexican rice & steamed broccoli.',1,725,'Chicken & Seafood',1,1,0,0,0),(91,'Crispy Chicken Crispers','Served with fries, corn on the cob and choice of honey-mustard, BBQ sauce or house-made ranch.',1,725,'Chicken Crispers',0,1,0,0,0),(92,'Crispy Honey-Chipotle Chicken Crispers','Served with fries, corn on the cob and ranch.',1,725,'Chicken Crispers',0,1,0,0,0),(93,'Honey-Chipotle Crispers® & Waffles','Crispers on top of Belgian waffles. Topped with bacon, jalapeños, ancho-chile ranch. Served with fries & honey-chipotle sauce.',1,725,'Chicken Crispers',1,1,1,0,0),(94,'Crispy Buffalo Bleu Crispers','Served with fries, corn on the cob and bleu cheese.',1,725,'Chicken Crispers',0,1,1,0,0),(95,'Crispy Mango-Habanero Crispers','Served with fries, corn on the cob and ranch.',1,725,'Chicken Crispers',0,1,0,0,0),(96,'Tripple Dipper','Why choose one when you can choose three? Select three appetizers and enjoy! Served with dipping sauces.',1,NULL,'Appetizers',1,1,1,0,0),(97,'Southwestern Eggrolls','These aren’t your ordinary eggrolls. Crispy flour tortillas, chicken, black beans, corn, jalapeño Jack cheese, red peppers, spinach. Served with avocado-ranch.',1,NULL,'Appetizers',1,0,1,0,0),(98,'Skillet Queso','Your chip’s favorite dip for over 25 years. Original with beef. Served with chips & salsa.',1,NULL,'Appetizers',1,0,1,0,0),(99,'Fried Pickles','Served with house-made ranch.',1,NULL,'Appetizers',1,0,0,0,0),(100,'Queso Burger','This half-pound patty comes smothered in white queso, crunchy tortilla strips & pico.',1,NULL,'Burgers',1,1,1,0,0),(101,'Mushroom Swiss Burger','There’s so mush-room in our hearts for this one. Topped with sauteed onions, mushrooms, Swiss, lettuce, tomato & garlic aioli.',1,NULL,'Burgers',1,1,1,0,0),(102,'Southern Smokehouse Burger','Bacon, cheddar, pickles, Awesome Blossom Petals, lettuce, tomato, garlic aioli. Served with a side of original BBQ sauce.',1,NULL,'Burgers',1,1,1,0,0),(103,'Carnitas Fajitas','Pulled pork carnitas, grilled bell peppers & onions. Topped with a drizzle of mango-habanero sauce and green onions.',1,NULL,'Fajitas',1,1,1,0,0),(104,'Mushroom Jack Chicken Fajitas','Grilled chicken, sauteed mushrooms, crumbled bacon & mixed cheese.',1,NULL,'Fajitas',1,1,1,0,0),(105,'Black Bean & Veggie Fajitas','Black bean patty, roasted asparagus, sauteed mushrooms, corn & black bean salsa, queso fresco, avocado & a drizzle of spicy Santa Fe sauce.',1,NULL,'Fajitas',1,0,1,0,0),(106,'Cajun Chicken Pasta','Grilled chicken, penne in Alfredo sauce, topped with chile spices, Parmesan, tomatoes, green onions. Served with garlic toast.',1,NULL,'Chicken & Seafood',1,1,0,0,0),(107,'Cajun Shrimp Pasta','Shrimp, penne in Alfredo sauce, topped with chile spices, Parmesan, tomatoes, green onions. Served with garlic toast.',1,NULL,'Chicken & Seafood',1,1,0,0,0),(108,'Chipotle Chicken Fresh Mex Bowl','Grilled chicken, pico, field greens, Mexican rice, corn & black bean salsa, avocado, shredded cheese, tortilla strips, cilantro, chipotle pesto, house-made ranch.',1,NULL,'Chicken & Seafood',1,1,0,0,0),(109,'Chipotle Shrimp Fresh Mex Bowl','Shrimp, pico, field greens, Mexican rice, corn & black bean salsa, avocado, shredded cheese, tortilla strips, cilantro, chipotle pesto, house-made ranch.',1,NULL,'Chicken & Seafood',1,1,0,0,0),(110,'Spicy Shrimp Tacos','Three spicy chile-lime shrimp tacos in flour tortillas with pico, avocado, cilantro, coleslaw queso fresco. Served with Mexican rice & black beans.',1,NULL,'Chicken & Seafood',1,1,0,0,0),(111,'Ancho Salmon','Seared chile-rubbed Atlantic salmon, spicy citrus-chile sauce, cilantro, queso fresco. Served with Mexican rice & steamed broccoli.',1,NULL,'Chicken & Seafood',1,1,0,0,0),(112,'Crispy Chicken Crispers','Served with fries, corn on the cob and choice of honey-mustard, BBQ sauce or house-made ranch.',1,NULL,'Chicken Crispers',0,1,0,0,0),(113,'Crispy Honey-Chipotle Chicken Crispers','Served with fries, corn on the cob and ranch.',1,NULL,'Chicken Crispers',0,1,0,0,0),(114,'Honey-Chipotle Crispers® & Waffles','Crispers on top of Belgian waffles. Topped with bacon, jalapeños, ancho-chile ranch. Served with fries & honey-chipotle sauce.',1,NULL,'Chicken Crispers',1,1,1,0,0),(115,'Crispy Buffalo Bleu Crispers','Served with fries, corn on the cob and bleu cheese.',1,NULL,'Chicken Crispers',0,1,1,0,0),(116,'Crispy Mango-Habanero Crispers','Served with fries, corn on the cob and ranch.',1,NULL,'Chicken Crispers',0,1,0,0,0),(117,'Tripple Dipper','Why choose one when you can choose three? Select three appetizers and enjoy! Served with dipping sauces.',1,NULL,'Appetizers',1,1,1,0,0),(128,'Tripple Dipper','Why choose one when you can choose three? Select three appetizers and enjoy! Served with dipping sauces.',1,0,'Appetizers',1,1,1,0,0),(129,'Tripple Dipper','Why choose one when you can choose three? Select three appetizers and enjoy! Served with dipping sauces.',1,0,'Appetizers',1,1,1,0,0),(130,'Tripple Dipper','Why choose one when you can choose three? Select three appetizers and enjoy! Served with dipping sauces.',1,0,'Appetizers',1,1,1,0,0),(131,'Tripple Dipper','Why choose one when you can choose three? Select three appetizers and enjoy! Served with dipping sauces.',1,0,'Appetizers',1,1,1,0,0),(132,'Tripple Dipper','Why choose one when you can choose three? Select three appetizers and enjoy! Served with dipping sauces.',1,0,'Appetizers',1,1,1,0,0),(133,'Burger','description',1,0,'custom',0,1,1,0,0),(134,'Burger','description',1,0,'custom',0,1,1,0,0),(135,'Burger','description',1,0,'custom',0,1,1,0,0),(136,'Burger','description',1,0,'custom',0,1,1,0,0),(137,'Burger','description',1,0,'custom',0,1,1,0,0),(138,'Burger','description',1,0,'custom',0,1,1,0,0),(139,'Burger','description',1,0,'custom',0,1,1,0,0),(140,'Burger','description',1,0,'custom',0,1,1,0,0),(141,'Burger','description',1,0,'custom',0,1,1,0,0),(142,'Burger','description',1,0,'custom',0,1,1,0,0),(143,'test','',1,100,'category',0,0,0,0,0),(144,'test','',1,100,'category',0,0,0,0,0),(145,'Burger','description',1,0,'custom',0,1,1,0,0),(146,'Cheese Pizza','The cheesiest',1,750,'Pizzas',1,0,1,0,0),(147,'Pepperoni Pizza','The classic',1,850,'Pizzas',1,0,1,0,0),(148,'Burger','description',1,0,'custom',0,1,1,0,0),(149,'Burger','description',1,0,'custom',0,1,1,0,0),(150,'test item','test description',1,100,'test category',1,0,0,0,0),(151,'Burger','description',1,0,'custom',0,1,1,0,0),(152,'Burger','description',1,0,'custom',0,1,1,0,0),(153,'Burger','description',1,0,'custom',0,1,1,0,0),(154,'Burger','description',1,0,'custom',0,1,1,0,0),(155,'Burger','description',1,0,'custom',0,1,1,0,0),(156,'Burger','description',1,0,'custom',0,1,1,0,0),(157,'Burger','description',1,0,'custom',0,1,1,0,0),(158,'Burger','description',1,0,'custom',0,1,1,0,0),(159,'Shrimp Caesar Salad','Traditional Daesar salad topped with shrimp, whole black beans, rachero cheese, tomatoes and avocado',1,1000,'Salads',0,1,1,0,0),(160,'Taco Salad Cazuela','A bowl shaped flour tortilla deep fried and filled with your choice of meat, lettuce, cheese, tomato, sour cream and guacamole',1,860,'Salads',1,1,1,0,0),(161,'Grilled Chicken Salad','Charbroiled chicken breast marinated in a special sauce served in a salad ',1,700,'Salads',1,1,1,0,0),(162,'Fish Tropical Salad','Grilled fish filet, mix salad, tropical fruit, avocados and red onions',1,850,'Salads',0,1,1,0,0),(163,'Tortilla Soup','Shredded chicken, slices of avocado, monterey cheese, broccoli, cauliflower, carrots and tortilla',1,500,'Soups',1,1,1,0,0),(164,'Green Chili Coup','Served with your choice of warm tortillas ',1,600,'Soups',1,1,1,0,0),(165,'Chicken or Beef Taquitos','Crisp corn tortilla filled with our fresh tasty shredded chicken or beef, garnished with tomatoes, guacamole and sour cream',1,775,'Appetizers',1,1,1,0,0),(166,'Spinach Quesadilla','A large flour tortilla filled with spinach and cheese, topped with guacamole, sour cream and tomatoes',1,430,'Appetizers',1,0,1,0,0),(167,'Quesadilla de Carne Asada','Flour tortilla with melted cheese, chopped char-broiled steak, guacamole, sour cream and tomatoes',1,900,'Appetizers',1,1,1,0,0),(168,'Chicken or Beef Flautas','Crisp flour tortillas filled with our fresh tasty shredded chicken or beef garnished with tomatoes, guacamole and sour cream',1,675,'Appetizers',1,1,1,0,0),(169,'Burrito Ranchero ','Cooked over charcoal served with rice and beans, wrapped in a flour tortilla, then topped with guacamole, sour cream, pico de gallo and lettuce',1,1200,'Burritos',1,1,1,0,0),(170,'Burrito Mandero','Ground beef or chicken with beans and rice in a flour tortilla topped with guacamole, tomato, onion, melted cheese and sour cream. Covered with sauce',1,1320,'Burritos',1,1,1,0,0),(171,'Pork Chile Verde Burrito','Chunks of pork in light tomatillo sauce in a flour tortilla covered with green sauce and metled cheese. Served with rice and beans',1,1100,'Burritos',1,1,1,0,0),(172,'Chile Colorado Burrito','Beef cooked in chile sauce in a flour tortilla, covered with Colorado sauce and melted cheese. Served with rice and beans',1,1350,'Burritos',1,1,1,0,0),(173,'Steak Ranchero','Tenderloin, sliced and fried with onions, tomatoes and jalepenos, covered with Spanish sauce',1,1000,'Specials',1,1,1,0,0),(174,'Chile Verde','Pork cooked tender in its own sauce witha light tomatillo and seasoned with our own spices',1,975,'Specials',1,1,1,0,0),(175,'Chile Colorado','Beef cooked in a tasty sauce, served with rice and beans',1,1050,'Specials',1,1,1,0,0),(176,'Steak a la Tampiquena ','Flap meat steak, chicken on mole enchilada',1,1400,'Specials',1,1,1,0,0),(177,'Pueblo Viejo Dinner','Charcoal broiled skirt steak, chile relleno, and enchilada',1,1260,'Specials',1,1,1,0,0),(178,'Pork Carnitas','Fried pork loin meat served with pico de gallo, rice and beans',1,1080,'Specials',1,1,1,0,0),(179,'House Margarita','Prepared with Sauza Gold Tequila',1,200,'Margaritas',0,0,0,0,0),(180,'Sangria Margarita','A mix of two classics',1,300,'Margaritas',0,0,0,0,0),(181,'Presidente Margarita','Triple Sec, Sauza Tequila and a float of Presidente Brandy',1,250,'Margaritas',0,0,0,0,0),(182,'Margarona','Margarita and Coronita',1,275,'Margaritas',0,0,0,0,0),(183,'Two Tacos Al Carbon','Choice of chicken or been served with pico de gallo and guacamole',1,600,'Tacos',1,1,1,0,0),(184,'Two Pork Carnitas Tacos','Fried pork loin meat served with pico de gallo',1,700,'Tacos',1,1,1,0,0),(185,'Two Fish Tacos','Two corn tortillas filled with marinated fish and salsa Mexicana. Served with rice, beans, garnished with lettuce and tomatoes',1,870,'Tacos',1,1,1,0,0),(186,'Two Tacos Fajitas','Two taces with chicken sauteed with green peppers, onions and mushrooms in a tngy salsa. Served with guacamole, sour cream and lettuce. ',1,650,'Tacos',1,1,1,0,0),(187,'Seafood Chimichanga','Flour tortilla stuffed with scallops, shrimp and crab meat, deep fried then topped with special sauce',1,900,'Tacos',1,1,1,0,0),(188,'Burrito de Carne Asada','Diced flap meat steak charbroiled, wrapped in flour tortillas with sour cream and gucamole. Served with rice and beans.',1,875,'Tacos',1,1,1,0,0),(189,'Northcoaster','Beef patty, cheddar cheese, thick cut bacon, guacamole, fried egg, house-made smoked tomato mayo. Served on a brioche bun.',1,850,'Burgers',1,1,1,0,0),(190,'Tidehaus','Beef patty, gruyere, caramelized onions, whiskey burger sauce, and roasted garlic mayo. Served on a brioche bun.',1,850,'Burgers',1,1,1,0,0),(191,'Jucy Lucy','Beef patty stuffed with cheddar, white cheddar, and smoked gouda.',1,900,'Burgers',1,1,1,0,0),(192,'Classic','Build your way, on a brioche bun',1,650,'Burgers',1,1,1,0,0),(193,'Smoken Salmon','Smoked salmon, thich cut bacon, guacamole, lettuce, tomato, onion, and roasted garlic mayo. Served on sourdough bread.',1,600,'Sandwiches',1,0,0,0,0),(194,'Canal Park Club','Shaved turkey breast, thick cut bacon, smoked gouda, lettuce, tomato. Served on sourdough bread.',1,700,'Sandwiches',1,1,1,0,0),(195,'15 Barrel Reuben','Thick cut corned beef slow braised in aromatics and our craft beer, sauerkraut, swiss cheese, and thousand island.',1,750,'Sandwiches',1,1,1,0,0),(196,'Hawaiian Pork','Slow roasted pulled pork, Hawaiin BBQ sauce, and cucumber pineapple salsa. Served on a ciabatta bun.',1,750,'Sandwiches',1,1,0,0,0),(197,'Steak Melt','Thinly sliced marinated sirloin steak, cheddar, swiss, caramelized onions, and house-made horseradish ranch.',1,800,'Sandwiches',1,1,1,0,0),(198,'Chicken Brie Asparagus','Grilled chicken breast, prosciutto wrapped asparagus, brie, house-made pesto aioli, and red wine vinaigrette.',1,650,'Sandwiches',1,1,1,0,0),(199,'Fish Tacos','Seasoned panko crusted fish, zesty cilantro lime rice, house-made jicama slaw, and cilantro lime cream sauce.',1,750,'Entrees',1,0,0,0,0),(200,'Stoned Surf Fish and Chips','Stoned Surf IPA beer-battered seasonal fish and fries. Served with house-made tartar sauce.',1,800,'Entrees',1,0,0,0,0),(201,'Mac and Cheese','Cavatappi noodles tossed in a creamy three cheese house-made blend, Italian mornay, garlic, shallots, and white wine.',1,750,'Entrees',1,0,0,0,0),(202,'Cheese Curds','Lightly Cajun seasoned fried cheese curds from Ellsworth, WI.',1,800,'Made To Share',1,0,1,0,0),(203,'Onion Rings','One whole pound of crispy beer-battered onion rings.',1,650,'Made To Share',1,0,0,0,0),(204,'Pretzel','Two Wisconsin made Bavarian pretzels served with Stoned Surf IPA mustard.',1,750,'Made To Share',1,0,1,0,0),(205,'Pork Nachos','Tortilla chips topped with slow roasted mojo pork, house-made questo, and black bean salsa.',1,900,'Made To Share',1,1,1,0,0),(206,'Lettuce Wraps','Korean beef, cucumbers, red onion, and kimchi.',1,500,'Made To Share',0,1,0,0,0),(207,'Chicken Strips','Hand-breaded chicken. Served with our house-made honey mustard.',1,750,'Made To Share',1,1,0,0,0),(208,'Wings','Bone-in wings, marinated and tossed in your choice of lemon garlic or sriracha honey.',1,750,'Made To Share',1,1,0,0,0),(209,'Quesadilla','Flour tortilla stuffed with cheddar jack cheese and house-made black bean corn salsa. Served with salsa and sour cream.',1,750,'Made To Share',1,0,1,0,0),(210,'Northcoaster Light','American Light Lager',1,150,'Growlers',1,0,0,0,0),(211,'Fireside Glow','Marzen',1,160,'Growlers',1,0,0,0,0),(212,'Hank & Dabs','Pale Ale',1,155,'Growlers',1,0,0,0,0),(213,'Lone Trekker','Belgian Single',1,155,'Growlers',1,0,0,0,0),(214,'Splendid Wood','Scottish Ale',1,160,'Growlers',1,0,0,0,0),(215,'Dos Puertos','Mexican Lager',1,150,'Growlers',1,0,0,0,0),(216,'Stoned Surf','India Pale Ale',1,175,'Growlers',1,0,0,0,0),(217,'Nut Hatchet','Brown Ale',1,160,'Growlers',1,0,0,0,0),(218,'Nut Hatchet','Brown Ale',1,160,'Growlers',1,0,0,0,0),(219,'Shanghai Chilli Paneer','Bite sized chunks of Indian cheese seasoned with spices and cooked in chili soy sauce.',1,91,'Veg Appetizers',1,0,1,0,1),(220,'Aloo Bonda','Deep fried savory appetizer made with spicy potato mix',1,136,'Veg Appetizers',1,0,0,0,0),(221,'Hyderabad Tawa Machili','Fish marinated with homemade sauces and herbs and grilled on tawa',1,120,'Non-Veg Appetizers',1,1,0,0,0),(222,'Royyala Vepudu','Shrimp marinated in house made spices and deep fried',1,110,'Non-Veg Appetizers',1,1,0,0,0),(223,'Guntur Mirapakaya Bhajji','Chilies battered, deep fried Indian style and stuffed with onions and peanuts',1,110,'Veg Appetizers',1,0,0,0,0),(224,'Raju Gari Kodi Veppudu','Chicken sauteed with homemade spices and deep fried',1,125,'Non-Veg Appetizers',1,1,0,0,0),(225,'Mamsam Roast','Goat marinated and roasted with homemade spices',1,100,'Non-Veg Appetizers',1,1,0,0,0),(226,'Konaseema Fish Vepudu','Boneless fillets cut into slices and slightly batter coated and deep fried',1,125,'Non-Veg Appetizers',1,1,0,0,0),(227,'Karaikudi Pepper Chicken','Cooked in aromatic spices featuring the uniqueness of Chettinad dishes',1,125,'Non-Veg Appetizers',1,1,0,0,0),(228,'Chicken Manchuria','Boneless chicken mildly spiced and cooked in a wok with special manchurian sauce',1,115,'Non-Veg Appetizers',1,1,0,0,0),(229,'Vegetable Pakoda','Mixed vegetables dipped in chickpea, rice flour batter and deep fried',1,125,'Veg Appetizers',1,0,0,0,0),(230,'Vegetable Samosa','Fried crispy patties stuffed with potatoes and sweet peas seasoned with herbs and spices',1,125,'Veg Appetizers',1,0,0,0,0),(231,'Vegetable Cutlet','Seasoned potatoes and peas blended with spices rolled in bread crumbs and deep fried.',1,125,'Veg Appetizers',1,0,0,0,0),(232,'Veg Manchurian','Vegetable balls made with finely chopped cauliflower, carrots, cabbage, beans and spices cooked in manchurian sauce',1,120,'Veg Appetizers',1,0,0,0,0),(233,'Gobi Manchurian','Cauliflower stir fried in sweet and spicy sauce',1,120,'Veg Appetizers',1,0,0,0,0),(234,'Baby corn Manchurian','Babycorn stir fried in sweet and spicy sauce',1,120,'Veg Appetizers',1,0,0,0,0),(235,'Cut Mirchi','Chilli bajji refried and sprinkled with onions, chat masala',1,125,'Veg Appetizers',1,0,0,0,0),(236,'Chicken 65','Fried & spicy boneless cubes of chicken marinated in Indian spices & sautéed with fresh ginger-garlic, onions',1,130,'Veg Appetizers',1,1,0,0,0),(237,'Chilli Chicken','Fried and spicy boneless cubes of chicken marinated in Indian spices and sautéed with fresh onions, capsicum and red chilies',1,125,'Veg Appetizers',1,1,0,0,0),(238,'Chicken Lollipop','Chicken marinated in spicy sauces and deep fried',1,135,'Veg Appetizers',1,1,0,0,0),(239,'Sczhewan Fried Rice','Hot & spicy fried rice with bursting flavors of ginger, garlic, soya sauce & red chilli paste.',1,150,'Fried Rice',1,1,0,1,0),(240,'Curry Fried Rice','Colorful rice perfectly seasoned and loaded with veggies and flavors',1,150,'Fried Rice',1,0,0,0,0),(241,'Egg Fried Rice','Hot & spicy cooked rice is stir-fried with egg',1,150,'Fried Rice',1,1,0,1,0),(242,'Garlic Naan','Unleavened flat bread with garlic.',1,50,'Roti',1,0,0,0,0),(243,'Naan','Unleavened flat bread baked',1,50,'Roti',1,0,0,0,0),(244,'Tandoori Naan','Unleavened flat bread baked in Tandoori',1,50,'Roti',1,1,0,0,0),(245,'Chapathi','Layered whole wheat bread with butter.',1,50,'Roti',1,0,0,0,0),(246,'Chilli Naan','Unleavened flat bread with green chili.',1,50,'Roti',1,0,0,0,0),(247,'Peshwari  Naan','Unleavened flat bread with mix of nuts.',1,50,'Roti',1,0,1,0,0),(248,'Onion Kulcha','Unleavened flat bread with onion.',1,50,'Roti',1,0,0,0,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MenuTimes`
--

LOCK TABLES `MenuTimes` WRITE;
/*!40000 ALTER TABLE `MenuTimes` DISABLE KEYS */;
INSERT INTO `MenuTimes` VALUES (3,8,1200,2400),(4,7,1030,1400),(6,7,1500,2300),(7,9,1100,2100),(8,10,1100,2100),(9,11,1100,1500),(10,12,1630,2200),(11,13,1100,1430),(12,14,1700,2100),(13,15,1000,1700),(14,15,1000,2359),(25,32,1000,2400),(38,48,0,2400),(39,49,0,2300),(54,65,0,1500),(65,76,0,2400),(66,77,0,2400),(67,78,0,2400),(68,79,0,2400),(69,80,0,2400),(70,81,0,2400),(71,82,0,2400),(72,83,0,2400),(73,84,0,2400);
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
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderItem`
--

LOCK TABLES `OrderItem` WRITE;
/*!40000 ALTER TABLE `OrderItem` DISABLE KEYS */;
INSERT INTO `OrderItem` VALUES (1,35,1,'Cooked medium-rare',1,0.00),(2,38,2,'Extra spicy',1,0.00),(3,39,2,NULL,2,0.00),(4,43,1,NULL,2,0.00),(5,41,1,'Please put the sauce on the side',2,0.00),(6,42,1,'Extra Pickles',1,0.00),(7,8,2,NULL,3,7.99),(8,10,1,'extra spicy',3,10.99),(9,11,1,NULL,3,7.99),(10,14,1,'no mushrooms please',3,10.99),(11,8,2,NULL,8,0.00),(12,10,3,NULL,8,0.00),(13,14,1,'extra rice',8,0.00),(14,56,1,NULL,1,0.00),(15,56,1,NULL,1,0.00),(33,146,2,'Extra napkins please',19,17.98),(34,147,1,'N/A',19,10.99),(50,89,2,'Extra sauce please',39,24.58),(51,90,1,'N/A',39,15.99),(52,56,1,NULL,1,0.00),(53,89,2,'Extra sauce',49,24.58),(54,89,2,'Extra sauce',50,24.58),(55,89,2,'Extra sauce please',51,24.58),(56,90,1,'N/A',51,15.99),(57,89,2,'Extra sauce please',53,24.58),(58,90,1,'N/A',53,15.99),(59,2,1,'',56,5.50),(60,3,1,'',66,5.25),(61,3,1,'',67,5.25),(62,3,1,'',68,5.25),(63,2,1,'',69,5.50),(64,3,1,'',70,5.25),(65,4,1,'',70,5.00),(66,55,1,'',71,7.00),(67,54,1,'',72,6.50),(68,76,1,'',73,11.29),(69,79,1,'',74,10.79),(70,89,2,'Extra sauce please',75,24.58),(71,90,1,'N/A',75,15.99);
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
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
INSERT INTO `Orders` VALUES (1,1,'2020-04-14 14:15:00',0.00,2,0),(2,1,'2020-04-15 12:30:00',0.00,2,0),(3,1,'2020-04-13 18:45:00',0.00,2,0),(4,1,'2020-04-15 12:30:00',0.00,2,0),(5,1,'2020-04-14 14:15:00',0.00,2,0),(6,1,'2020-04-13 18:45:00',0.00,2,0),(7,1,'2020-04-15 12:30:00',0.00,2,0),(8,1,'2020-04-15 12:30:00',0.00,2,0),(9,1,'2020-04-13 18:45:00',0.00,2,0),(19,12,'2020-04-23 21:08:03',29.84,32,1),(39,1,'2020-05-05 20:41:21',41.79,2,1),(49,1,'2020-05-10 22:03:36',25.32,2,0),(50,1,'2020-05-11 22:59:33',25.32,2,0),(51,1,'2020-05-11 23:01:07',41.79,2,0),(53,1,'2020-05-11 23:33:21',41.79,2,0),(56,1,'2020-05-12 15:32:37',5.67,22,0),(60,1,'2020-05-12 15:37:48',0.00,35,0),(61,1,'2020-05-12 15:40:00',0.00,35,0),(62,1,'2020-05-12 15:46:44',0.00,22,0),(63,1,'2020-05-12 15:50:04',0.00,35,0),(64,1,'2020-05-12 16:21:19',0.00,35,0),(65,1,'2020-05-12 18:32:19',0.00,35,0),(66,1,'2020-05-12 19:36:23',5.41,35,0),(67,1,'2020-05-12 19:41:11',5.41,35,0),(68,1,'2020-05-12 19:42:26',5.41,35,0),(69,1,'2020-05-12 19:47:35',5.67,35,0),(70,1,'2020-05-12 20:00:58',10.56,35,0),(71,1,'2020-05-12 20:08:43',7.21,28,0),(72,1,'2020-05-12 20:09:44',6.70,28,0),(73,1,'2020-05-12 20:40:01',11.63,28,0),(74,1,'2020-05-13 20:33:41',11.11,28,0),(75,1,'2020-05-14 21:48:02',41.79,2,0);
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
  `primaryColor` varchar(45) DEFAULT '#357ef2',
  `secondaryColor` varchar(45) DEFAULT '#8898b3',
  PRIMARY KEY (`restaurantId`),
  UNIQUE KEY `restaurantId_UNIQUE` (`restaurantId`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci CHECKSUM=1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Restaurant`
--

LOCK TABLES `Restaurant` WRITE;
/*!40000 ALTER TABLE `Restaurant` DISABLE KEYS */;
INSERT INTO `Restaurant` VALUES (1,'Scooters','University of St. Thomas fast dining','2115 Summit Ave',7.70,'St. Paul','MN',55105,'United States','#357ef2','#8898b3'),(2,'Khao Hom','Thai Restaurant','2411 Central Ave NE',7.00,'Minneapolis','MN',55418,'United States','#357ef2','#8898b3'),(3,'Chipotle Mexican Restaurant','Fast-food Mexican Restaurant','2600 Hennepin Ave',7.00,'Minneapolis','MN',55408,'United States','#357ef2','#8898b3'),(4,'Roti Modern Mediterranean','Mediterranean','614 Washington Ave SE',0.00,'Minneapolis','MN',55414,'United States','#357ef2','#8898b3'),(5,'Red Cow Restaurant','Hamburger','393 Selby Avenue',0.03,'St. Paul','MN',55105,'United States','#357ef2','#8898b3'),(11,'test','test restaurant','address',2.30,'chaska','mn',55318,'USA','#357ef2','#8898b3'),(19,'Davannis','Go-To Spot for pizza and sandwiches','1234 Addr St.',0.03,'St. Paul','MN',55105,'USA','#357ef2','#8898b3'),(31,'Pueblo Viejo','Authentic Mexican Family Restaurant ','S. Academy Blvd.',0.03,'Colorado Springs','CO',80923,'USA','#357ef2','#35f2ad'),(32,'Canal Park Brewing Company','Award Winning Beer','300 Canal Park Drive',0.03,'Duluth','MN',55802,'USA','#1e3d73','#f9b836'),(33,'India Spice House','Gourmet Indian Cuisine',' 8445 Joiner Way #7636',0.03,'Eden Prairie','MN',55344,'USA','#333836','#FF0000'),(34,'Taco','a taco place','1111 hi there lane',0.00,'St. Paul','MN',11211,'United States',NULL,NULL),(35,'New Restaurant ','Hello i am testing please work','1212 Lexington Ave',0.00,'Chanhassen','MN',55317,'USA','#873030','#640b0b'),(36,'Sadness','much sad','hello there lane',0.00,'St. Paul','MN',55104,'USA','#25c6ea','#3103c7');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RestaurantManagers`
--

LOCK TABLES `RestaurantManagers` WRITE;
/*!40000 ALTER TABLE `RestaurantManagers` DISABLE KEYS */;
INSERT INTO `RestaurantManagers` VALUES (1,32,5);
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
  `alexaID` varchar(200) DEFAULT NULL,
  `tableNumber` int(11) DEFAULT NULL,
  `restaurantID` int(11) DEFAULT NULL,
  PRIMARY KEY (`tableID`),
  UNIQUE KEY `alexaID_UNIQUE` (`alexaID`),
  KEY `RestaurantTables_ibfk_1_idx` (`restaurantID`),
  CONSTRAINT `RestaurantTables_ibfk_1` FOREIGN KEY (`restaurantID`) REFERENCES `Restaurant` (`restaurantId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RestaurantTables`
--

LOCK TABLES `RestaurantTables` WRITE;
/*!40000 ALTER TABLE `RestaurantTables` DISABLE KEYS */;
INSERT INTO `RestaurantTables` VALUES (0,'40',1,31),(1,'1',1,5),(12,'alexaID1234',1,19),(37,'2',1,31),(38,'123',2,31),(39,'12345',3,31),(40,'abcd',4,31),(41,NULL,5,31),(44,NULL,6,31),(45,NULL,1,32),(46,NULL,2,32),(47,NULL,3,32),(48,NULL,4,32),(49,NULL,5,32),(50,NULL,7,32),(51,NULL,8,32);
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
  PRIMARY KEY (`userID`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (2,'Bob','Jones','bob@jones.com'),(3,'\"sosa\"','\"edison\"','\"sosaedison69@gmail.com\"'),(12,'Default User','',''),(21,'tyler','beverley','tylerbeverley@test1.gmail.com'),(22,'Mitchell','Nelson','mitchell.s.nels@gmail.com'),(28,'Riley','Tschumper','riley.tschumper@gmail.com'),(32,'Bob','Smith','bob@smith.com'),(33,'tyler','beverley','tylerbeverley@test2.gmail.com'),(34,'John','Smith','john.smith@internet.web'),(35,'Tim','Callies','timcallies@gmail.com');
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
CREATE DEFINER=`masterUser`@`%` PROCEDURE `AddFavoriteRestaurant`(IN uID INT, IN rID INT)
BEGIN
	-- Adds the input restaurant ID to the input user's favorites if it is not already there --
    
	-- Insert if it doesn't exist --
	IF (SELECT EXISTS(SELECT * FROM FavoriteRestaurants WHERE userID = uID AND restaurantID = rID) = 0) THEN
		INSERT INTO FavoriteRestaurants(userID, restaurantID)
		VALUES (uID, rID);
	END IF;
    
    -- Select the favorite ID --
    SELECT favoriteID
    FROM FavoriteRestaurants
    WHERE userID = uID AND restaurantID = rID;
    
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
CREATE DEFINER=`masterUser`@`%` PROCEDURE `CreateNewRestaurant`(IN rName varchar(100), IN rDescr varchar(100), IN rAddress varchar(100), IN rSalesTax DECIMAL(10,2), IN rCity varchar(100), IN rState varchar(100), IN rZip INT, IN rCountry varchar(100), IN pColor VARCHAR(45), IN sColor VARCHAR(45))
BEGIN

	-- Insert the passed values into the Restaurant table --
	INSERT into Restaurant(restaurantName, description, address, salesTax, city, state, zipCode, country, primaryColor, secondaryColor)
    VALUES(rName, rDescr, rAddress, rSalesTax, rCity, rState, rZip, rCountry, pColor, sColor);
    
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
CREATE DEFINER=`masterUser`@`%` PROCEDURE `CreateRestaurantTable`(IN alexaID VARCHAR(200), IN tableNumber INT, IN restaurantID INT)
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
CREATE DEFINER=`masterUser`@`%` PROCEDURE `CreateUser`(IN firstName VARCHAR(45), IN lastName VARCHAR(45), IN email VARCHAR(100))
BEGIN

	-- Insert the given values into the Users table --
	INSERT INTO Users(firstName, lastName, email)
    VALUES (firstName, lastName, email);
    
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
/*!50003 DROP PROCEDURE IF EXISTS `GetAllRestaurants` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetAllRestaurants`()
BEGIN

	-- Returns all the order items for passed orderID --
	SELECT *
    FROM Restaurant;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllTablesByRestaurant` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetAllTablesByRestaurant`(IN rID INT)
BEGIN
	
    SELECT * 
    FROM RestaurantTables
    WHERE restaurantID = rID;
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
	SELECT Restaurant.*
    FROM Restaurant JOIN FavoriteRestaurants
    ON FavoriteRestaurants.restaurantID = Restaurant.restaurantID
    WHERE FavoriteRestaurants.userID = inputUserID;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetMenuItembyItemId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetMenuItembyItemId`(IN id INT)
BEGIN

	-- Select the menu item that corresponds to the input id --
	SELECT *
    FROM MenuItem
    WHERE itemID = id;
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
/*!50003 DROP PROCEDURE IF EXISTS `GetOrdersForRestaurant` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetOrdersForRestaurant`(IN rID INT)
BEGIN
    -- Gets all of the orders made at a specified restaurant --
    SELECT Orders.*
    FROM Orders JOIN RestaurantTables
    ON Orders.tableID = RestaurantTables.tableID
    WHERE RestaurantTables.restaurantID = rID;

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
/*!50003 DROP PROCEDURE IF EXISTS `GetRestaurantByID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masterUser`@`%` PROCEDURE `GetRestaurantByID`(IN rID INT )
BEGIN

	-- Return all restaurants with an ID matching rID --
	SELECT *
    FROM AutoGarcon.Restaurant WHERE restaurantID=rID;
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
CREATE DEFINER=`TBevs`@`%` PROCEDURE `GetTableByAlexaID`( aID varchar(100) )
BEGIN 
SELECT * FROM AutoGarcon.RestaurantTables
WHERE alexaID like aID; 
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
CREATE DEFINER=`masterUser`@`%` PROCEDURE `RegisterAlexaID`(IN aID VARCHAR(200), IN tID INT)
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
/*!50003 DROP PROCEDURE IF EXISTS `RemoveItemFromMenu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`masterUser`@`%` PROCEDURE `RemoveItemFromMenu`(IN mID INT, IN iID INT)
BEGIN
	-- Removes the input menu item from the input menu ID --
	DELETE FROM MenuContains
    WHERE menuID = mID AND menuItemID = iID;
    
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

-- Dump completed on 2020-05-16 22:22:28
