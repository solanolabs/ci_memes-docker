-- MySQL dump 10.13  Distrib 5.5.44, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: ci_memes
-- ------------------------------------------------------
-- Server version	5.5.44-0ubuntu0.14.04.1

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
-- Current Database: `ci_memes`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ci_memes` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `ci_memes`;

--
-- Table structure for table `chuck_quotes`
--

DROP TABLE IF EXISTS `chuck_quotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chuck_quotes` (
  `quote` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chuck_quotes`
--

LOCK TABLES `chuck_quotes` WRITE;
/*!40000 ALTER TABLE `chuck_quotes` DISABLE KEYS */;
INSERT INTO `chuck_quotes` VALUES ('Chuck Norris uses Solano CI');
INSERT INTO `chuck_quotes` VALUES ('When Chuck Norris throws exceptions, it\'s across the room.');
INSERT INTO `chuck_quotes` VALUES ('All arrays Chuck Norris declares are of infinite size, because Chuck Norris knows no bounds.');
INSERT INTO `chuck_quotes` VALUES ('Chuck Norris doesn\'t have disk latency because the hard drive knows to hurry the hell up.');
INSERT INTO `chuck_quotes` VALUES ('Chuck Norris writes code that optimizes itself.');
INSERT INTO `chuck_quotes` VALUES ('Chuck Norris can\'t test for equality because he has no equal.');
INSERT INTO `chuck_quotes` VALUES ('Chuck Norris doesn\'t need garbage collection because he doesn\'t call .Dispose(), he calls .DropKick().');
INSERT INTO `chuck_quotes` VALUES ('Chuck Norris\'s first program was kill -9.');
INSERT INTO `chuck_quotes` VALUES ('Chuck Norris burst the dot com bubble.');
INSERT INTO `chuck_quotes` VALUES ('All browsers support the hex definitions #chuck and #norris for the colors black and blue.');
INSERT INTO `chuck_quotes` VALUES ('MySpace actually isn\'t your space, it\'s Chuck\'s (he just lets you use it).');
INSERT INTO `chuck_quotes` VALUES ('Chuck Norris can write infinite recursion functions...and have them return.');
INSERT INTO `chuck_quotes` VALUES ('Chuck Norris can solve the Towers of Hanoi in one move.');
INSERT INTO `chuck_quotes` VALUES ('The only pattern Chuck Norris knows is God Object.');
INSERT INTO `chuck_quotes` VALUES ('Chuck Norris finished World of Warcraft.');
INSERT INTO `chuck_quotes` VALUES ('Project managers never ask Chuck Norris for estimations...ever.');
INSERT INTO `chuck_quotes` VALUES ('Chuck Norris doesn\'t use web standards as the web will conform to him.');
INSERT INTO `chuck_quotes` VALUES ('\'It works on my machine\' always holds true for Chuck Norris.');
INSERT INTO `chuck_quotes` VALUES ('Whiteboards are white because Chuck Norris scared them that way.');
INSERT INTO `chuck_quotes` VALUES ('Chuck Norris doesn\'t do Burn Down charts, he does Smack Down charts.');
INSERT INTO `chuck_quotes` VALUES ('Chuck Norris can delete the Recycling Bin.');
INSERT INTO `chuck_quotes` VALUES ('Chuck Norris\'s beard can type 140 wpm.');
INSERT INTO `chuck_quotes` VALUES ('Chuck Norris can unit test entire applications with a single assert.');
INSERT INTO `chuck_quotes` VALUES ('Chuck Norris doesn\'t bug hunt as that signifies a probability of failure, he goes bug killing.');
INSERT INTO `chuck_quotes` VALUES ('Chuck Norris\'s keyboard doesn\'t have a Ctrl key because nothing controls Chuck Norris.');
INSERT INTO `chuck_quotes` VALUES ('When Chuck Norris is web surfing websites get the message \'Warning: Internet Explorer has deemed this user to be malicious or dangerous. Proceed?\'.');
/*!40000 ALTER TABLE `chuck_quotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `images` (
  `image_url` varchar(255) NOT NULL,
  `html` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`image_url`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES ('img/memes/business_cat_unit_test.jpg','');
INSERT INTO `images` VALUES ('img/memes/desk_flip.gif','<div><image src=\"__IMAGE__\" /></div><h1>Build Engineer<br />without Solano CI</h1>');
INSERT INTO `images` VALUES ('img/memes/dos_equis_test_in_production.jpg','');
INSERT INTO `images` VALUES ('img/memes/jenkins_is_hard_sad_pikachu.jpg','');
INSERT INTO `images` VALUES ('img/memes/laser_pointer_cat.gif','<div style=\"width:486px;display:inline-block;\"><div style=\"width:243px;float:left;\"><img src=\"__IMAGE__\" /></div><div style=\"float:left;text-align:left;\"><h1 style=\"padding-left:15px;\">Solano CI<br />No more<br />chasing<br />red builds!</h1></div></div>');
INSERT INTO `images` VALUES ('img/memes/never_too_much_automation.gif','<div><image src=\"__IMAGE__\" /></div><h1>Never too much automation</h1>');
INSERT INTO `images` VALUES ('img/memes/picard_enjoys_passing_tests.jpg','');
INSERT INTO `images` VALUES ('img/memes/red_shirt_explosion.gif','<div><image src=\"__IMAGE__\" style=\"height: 396px; width: 500px;\" /></div><h1>Solano CI:<br />no more red builds</h1>');
INSERT INTO `images` VALUES ('img/memes/see_ci_in_action.gif','<div><image src=\"__IMAGE__\" style=\"height: 324px; width: 516px;\" /></div><h1>See Solano CI in action</h1>');
INSERT INTO `images` VALUES ('img/memes/simpsons_bugs.gif','<div><image src=\"__IMAGE__\" /></div><h1>Deploying without<br />Solano CI</h1>');
INSERT INTO `images` VALUES ('img/memes/surf_board_beer.gif','<div><image src=\"__IMAGE__\" /></div><h1>Sysadmin after switching to Solano CI</h1>');
INSERT INTO `images` VALUES ('img/memes/unit_test_walrus.jpg','');
INSERT INTO `images` VALUES ('img/memes/yoda_broken_build.jpg','');
INSERT INTO `images` VALUES ('img/memes/office-happy.gif','<div><image src=\"__IMAGE__\" /></div><h1>The feeling using Solano CI gives you!</h1>');
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-10-02 14:59:27
