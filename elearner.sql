-- MySQL dump 10.13  Distrib 5.5.62, for Linux (x86_64)
--
-- Host: localhost    Database: elearner
-- ------------------------------------------------------
-- Server version	5.5.62

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
-- Table structure for table `gradeLvlInfo`
--

DROP TABLE IF EXISTS `gradeLvlInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gradeLvlInfo` (
  `gradeLvl` mediumint(97) NOT NULL,
  `gradeName` varchar(50) NOT NULL,
  `englishDesc` varchar(500) DEFAULT NULL,
  `mathDesc` varchar(500) DEFAULT NULL,
  `scienceDesc` varchar(500) DEFAULT NULL,
  UNIQUE KEY `gradeLvl` (`gradeLvl`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gradeLvlInfo`
--

LOCK TABLES `gradeLvlInfo` WRITE;
/*!40000 ALTER TABLE `gradeLvlInfo` DISABLE KEYS */;
INSERT INTO `gradeLvlInfo` VALUES (1,'1st grade','A quiz that test student\'s english grammer to help understand how to formulate sentences.','Math Desc','Science Desc'),(2,'2nd grade','English Desc2','Math Desc2','Science Desc'),(3,'3rd grade','English Desc3','Math Desc3','Science Desc'),(4,'4th grade','English Desc4','Math Desc4','Science Desc'),(5,'5th grade','English Desc5','Math Desc5','Science Desc'),(6,'6th grade','English Desc6','Math Desc6','Science Desc');
/*!40000 ALTER TABLE `gradeLvlInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quizAttempts`
--

DROP TABLE IF EXISTS `quizAttempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quizAttempts` (
  `quizAttemptId` mediumint(97) NOT NULL AUTO_INCREMENT,
  `userId` mediumint(9) NOT NULL,
  `username` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `testScore` float(5,2) NOT NULL,
  `numRightAns` mediumint(9) NOT NULL,
  `totalQuestions` mediumint(9) NOT NULL,
  `gradeLvl` mediumint(9) DEFAULT NULL,
  `diff` mediumint(10) DEFAULT NULL,
  `category` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `submissionDate` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`quizAttemptId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quizAttempts`
--

LOCK TABLES `quizAttempts` WRITE;
/*!40000 ALTER TABLE `quizAttempts` DISABLE KEYS */;
INSERT INTO `quizAttempts` VALUES (1,1,'smol',33.33,1,3,1,1,'Science','Wed Dec 09 2020 19:47:26 GMT+0000 (Coordinated Universal Time)'),(2,1,'smol',0.00,0,1,1,1,'Math','Wed Dec 09 2020 19:48:03 GMT+0000 (Coordinated Universal Time)');
/*!40000 ALTER TABLE `quizAttempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `totalQuestions`
--

DROP TABLE IF EXISTS `totalQuestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `totalQuestions` (
  `questionId` mediumint(9) NOT NULL AUTO_INCREMENT,
  `difficulty` mediumint(10) DEFAULT NULL,
  `category` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `question` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `answer` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `gradeLvl` mediumint(9) NOT NULL,
  PRIMARY KEY (`questionId`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `totalQuestions`
--

LOCK TABLES `totalQuestions` WRITE;
/*!40000 ALTER TABLE `totalQuestions` DISABLE KEYS */;
INSERT INTO `totalQuestions` VALUES (1,5,'Math','','5 + 3 = _ + 7','1',1),(2,6,'Science','','What part of a bone builds new blood cells? a. Joints b. Bone marrow c. Spongy bone d. Compact bone','b',3),(3,3,'English','','Which letters BEST complete the word? spar____ a. kle b. kel c. kele','a',1),(4,9,'Math','','524 + 633 = ','1157',2),(5,8,'English','','A person who is shy probably does NOT? a. talk a lot. b. like animals. c. have any friends. d. get along with people.','a',4),(6,1,'Science','','Which law says that an object in motion will stay in motion unless another forces changes that? a. First law b. Second law c. Third law d. All','a',5),(7,1,'Science','','What is a scientist called who studies space in space? a. Astronaut b. Biologist c. Paleontologist d. Physicist','a',1),(8,1,'Science','','What is the Sun? a. A black hole b. Lots of lightning c. A bright flashlight d. A star','d',1),(9,1,'Science','','What is a scientist called that studies living things? a. Geologist b. Engineer c. Paleontologist d. Biologist','d',1),(10,1,'English','','Which letters complete the sentence I have to __ my homework? a. do b. does c. is d. am','a',1),(11,1,'English','','what is the past verb of speak? a. speaking b. spoke c. speaker d. talk','b',1),(12,1,'English','','Which letters complete the sentence She __ my friend? a. is b. are c. has','a',1),(13,1,'Math','https://i.pinimg.com/600x315/d6/1d/d7/d61dd7fcb6fe3417157423b2b48ebfe4.jpg','What time is it?','7:00',1),(14,1,'Science','','Which animal lays eggs? a. Dog b. Cat c. Duck d.Sheep','c',1),(15,2,'Science','','What part of the plant conducts photosynthesis? a. Branch b. Leaf c. Root d.Trunk','b',2),(16,3,'Science','','What is the boiling point of water? a. 25 C b. 50 C c. 75 C d. 100 C','d',2),(17,4,'Science','','Which is the largest land animal? a. Lion b. Tiger c. Elephant d. Rhinoceros','c',2),(18,5,'Science','','When you push something, you apply? a. Force b. Acceleration c. Mass d. Compression','a',2),(19,6,'Science','','Which group of animals have scales? a. Mammals b. Amphibians c. Reptiles','c',2),(20,7,'Science','','What part of the flower contains the pollen? a. Anther b. Stigma c. Stem d. Leaves','a',3),(21,8,'Science','','Which of the following is NOT scientifically considered a fruit? a. Pumpkin b. Tomato c. Broccoli d. Pear','c',3),(22,9,'Science','','Who came up with the three laws of motion? a. Benjamin Franklin b. Albert Einstein c. Galileo d. Isaac Newton','d',3),(23,10,'Science','','What tissue connects muscles to bones? a. Skin b. Blood vessels c. Fat d. Tendon','d',3),(24,1,'Science','','Which nutrient plays an essential role in muscle-building? a. Protein b. Carbohydrate c. Iron d. Fat','a',4),(25,2,'Science','','Plants need which gas to perform photosynthesis? a. Hydrogen b. Carbon monoxide c. Carbon dioxide d. Carbon dioxide','c',4),(26,3,'Science','','Earth is surrounded by layers of gases collectively called? a. Hydrosphere b. Stratosphere c. Atmosphere d. Ozone layer','c',4),(27,4,'Science','','Which system of the body controls the senses? a. Circulatory system b. Digestive system c. Nervous system d. Skeletal system','c',4),(28,5,'Science','','Similar body cells group together to form a? a. Organ b. Tissue c. Blood vessels d. Joints','b',4),(29,6,'Science','','Which of these is NOT a form of energy we get from the sun? a. Kinetic b. Potential c. Heat d. Light','a',5),(30,7,'Science','','Which two chromosomes do all male humans have? a. YY b. XX c. XY d. ABC','c',5),(31,8,'Science','','What part of the cell are all the organelles found? a. Nucleus b. Cytoplasm c. Cell Wall d. Cell Membrane','b',5),(32,9,'Science','','What is not a function of our skeletal system? a. Digesting b. Protection c. Support d. Movement','a',5),(33,10,'Science','','Which of these is the most efficient for of heat transfer? a. Heat does not transfer b. Conduction c. Convection d. Radiation','b',5),(34,1,'Science','','What energy emerges from motion? a. Potential energy b. Electrical energy c. Kinetic energy d. Gravitational energy','c',6),(35,2,'Science','','The standard unit of measurement for energy is? a. Newton b. Ampere c. Watt d. Joule','d',6),(36,3,'Science','','Which biologist proposed the theory of evolution through natural selection? a. Charles Darwin b. Stephen Hawking c. Francesco Redi d. Alexander Fleming','a',6),(37,4,'Science','','What are animals, which eat both plants and animals, called? a. Herbivores b. Insectivores c. Carnivores d. Omnivores','d',6),(38,5,'Science','','A single piece of coiled DNA is called? a. Nucleus b. Ribosome c. Cytoplasm d. Chromosome','d',6),(39,1,'English','','What is the past simple of become? a. began b. became c. were','b',1),(40,2,'English','','What is the past tense for drink? a. drinks b. drinked c. drinking d. drank','d',2),(41,3,'English','','A sentence that makes a statement, is called a? a. declarative sentence b. interrogative sentence c. exclamatory sentence d. independent sentence','a',2),(42,4,'English','','When you are upset about something, you are? a. happy b. unhappy c. happiest d. unangry','b',2),(43,5,'English','','Ken filled his cup with too much milk and it ____ a. overflowed b. reflowed c. underflowed d. preflowed','a',2),(44,6,'English','','Which of these words is a NOUN? a. cat b. hit c. red d. sing','a',2),(45,7,'English','','The eagle was _____ than the bluebird. a. big b. bigger c. biggest d. most big','b',3),(46,8,'English','','What does the prefix BI mean in BICYCLE? a. two b. one c. not d. round','a',3),(47,9,'English','','What does reread mean? a. read before b. read again c. read wrong d. not read','b',3),(48,10,'English','','When you do not agree with someone, you? a. disagree b. preagree c. reagree d. unagree','a',3),(49,1,'English','','What do you need in a complex sentence? a. subordinating conjunction b. conjunction c. run-on d. fragment','a',3),(50,2,'English','','I would like another ____ of cake. a. piece b. peace c. peece d. peez','a',4),(51,3,'English','','Which one is a correct sentence? a. Good to eat. b. We made cookies. c.Wagging its tail.','b',4),(52,4,'English','','What does the prefix re mean? a. more b. again c. not d. can','b',4),(53,5,'English','','What type of sentence is this? \"Are Jessica and Lilith sisters?\" a. declarative b. imperative c. exclamatory d. interrogative','d',4),(54,6,'English','','Which of these is a complete sentence? a. My mother drove us to the lake b. My father, brother and mother c. Came home from school today','d',4),(55,7,'English','','Which sentence uses a comma correctly? a. However I am very good at math. b. However I, am very, good at math. c. However, I am very good at math. d. However I am very good, at math.','c',5),(56,8,'English','','The suffix in the word comfortable is? a. for b. table c. ible d. able','d',5),(57,9,'English','','Identify the verb in the following sentence. \"That woman is a millionaire.\" a. that b. woman c. is d. millionaire','c',5),(58,10,'English','','Which of these prefixes means \"bad\" or \"wrong\"? a. pre- b. non- c. bi- d. mis-','d',5),(59,1,'English','','Which group of words are helping verbs? a. is, am, are, he b. will, seem, feel, being c. has, have, will, am d. swim, appear, smells, seem','c',5),(60,2,'English','','What does the suffix \"ing\" mean? a. past tense b. action or process c. full of d. runner','b',6),(61,3,'English','','Identify the adjective in the following sentence. \"The rain was steady throughout the afternoon\" a. rain b. was c. steady d. throughout','c',6),(62,4,'English','','Which of the following is a non-count noun? a. table b. candle c. dog d. information','d',6),(63,5,'English','','Which sentence is a simple sentence? a. We like to eat cheese. b. We like to eat cheese, although some cheeses are disgusting. c. In the mornings, we like to eat cheese on our eggs and toast. d. In the mornings, before we go to school, we like to eat cheese.','a',6),(64,6,'English','','Disapprove means? a. To not get along b. To not approve of something c. To approve of something','b',6),(65,1,'Math','','Write 5 x 6 as a repeated sum. a. 5 x 6 = 5 + 6 b. 5 x 6 = 5 + 5 + 5 + 5 + 5 c. 5 x 6 = 6 + 6 + 6 + 6 + 6 + 6 d. 5 x 6 = 6 + 6 + 6 + 6 + 6','d',4),(66,2,'Math','','123,686 x 0 =  a. 123,686 b. 1 c. 0 d. none of the above','c',4),(67,3,'Math','','23 x 15 =  a. 345 b. 335 c. 355 d. 365','a',4),(68,4,'Math','','789 x 17 =  a. 13753 b. 13413 c. 13000 d. 13003','b',4),(69,5,'Math','','5 x 6 x 3 = a. 18 b. 15 c. 30 d. 90','d',4),(70,6,'Math','','There are 61 boxes of pencils in a store. There are 14 pencils in each box. How many pencils are in the store? a. 854 b. 4 c. 75 d. 47','a',4),(71,7,'Math','','There are 24 hours in one day, and 3600 seconds in one hour. How many seconds are in one day? a. 7000 b. 864 c. 72000 d. 86400','d',4),(72,8,'Math','','What is n if 9 x n = 108 a. 22 b. 15 c. 12 d. 13','c',4),(73,9,'Math','','What is S if 6 x 4 = 3 x S? a. 8 b. 6 c. 4 d. 24','a',4),(74,10,'Math','','124 x 100 = a. 1,240 b. 12,400 c. 1,200 d. 1,000','b',4);
/*!40000 ALTER TABLE `totalQuestions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `userId` mediumint(9) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `profile_img` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `isAdmin` mediumint(1) NOT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'smol','$2b$10$cwfGj6ySCL9OlvDgFGTBCOalRm9f..ifHKenyEEIoPSnmEp9prjj6','sml@gmail.com','5554471mytzy10289439.png',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-10 23:02:15
