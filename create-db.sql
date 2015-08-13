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
INSERT INTO `chuck_quotes` VALUES ('Chuck Norris uses Solano CI'),('When Chuck Norris throws exceptions, it\'s across the room.'),('All arrays Chuck Norris declares are of infinite size, because Chuck Norris knows no bounds.'),('Chuck Norris doesn\'t have disk latency because the hard drive knows to hurry the hell up.'),('Chuck Norris writes code that optimizes itself.'),('Chuck Norris can’t test for equality because he has no equal.'),('Chuck Norris doesn\'t need garbage collection because he doesn\'t call .Dispose(), he calls .DropKick().'),('Chuck Norris\'s first program was kill -9.'),('Chuck Norris burst the dot com bubble.'),('All browsers support the hex definitions #chuck and #norris for the colors black and blue.'),('MySpace actually isn\'t your space, it’s Chuck\'s (he just lets you use it).'),('Chuck Norris can write infinite recursion functions...and have them return.'),('Chuck Norris can solve the Towers of Hanoi in one move.'),('The only pattern Chuck Norris knows is God Object.'),('Chuck Norris finished World of Warcraft.'),('Project managers never ask Chuck Norris for estimations…ever.'),('Chuck Norris doesn\'t use web standards as the web will conform to him.'),('\'It works on my machine\' always holds true for Chuck Norris.'),('Whiteboards are white because Chuck Norris scared them that way.'),('Chuck Norris doesn\'t do Burn Down charts, he does Smack Down charts.'),('Chuck Norris can delete the Recycling Bin.'),('Chuck Norris\'s beard can type 140 wpm.'),('Chuck Norris can unit test entire applications with a single assert.'),('Chuck Norris doesn\'t bug hunt as that signifies a probability of failure, he goes bug killing.'),('Chuck Norris\'s keyboard doesn\'t have a Ctrl key because nothing controls Chuck Norris.'),('When Chuck Norris is web surfing websites get the message \'Warning: Internet Explorer has deemed this user to be malicious or dangerous. Proceed?\'.');
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
INSERT INTO `images` VALUES ('https://raw.githubusercontent.com/solanolabs/ci_memes/gh-pages/assets/images/business_cat_unit_test.jpg',''),('https://raw.githubusercontent.com/solanolabs/ci_memes/gh-pages/assets/images/desk_flip.gif','<div><image src=\"__IMAGE__\" /></div><h1>Jenkins Administrator...<br />on a good day</h1>'),('https://raw.githubusercontent.com/solanolabs/ci_memes/gh-pages/assets/images/dos_equis_test_in_production.jpg',''),('https://raw.githubusercontent.com/solanolabs/ci_memes/gh-pages/assets/images/Jenkins%20is%20Hard%20-%20sad%20pikachu.jpg',''),('https://raw.githubusercontent.com/solanolabs/ci_memes/gh-pages/assets/images/laser_pointer_cat.gif','<div style=\"width:49%;height:100%;float:left;text-align:right;\"><img src=\"__IMAGE__\" /></div><div style=\"width:49%;height:100%;float:left;text-align:left;\"><h1 style=\"padding-left:15px;\">I can haz<br />passing<br />Jenkins<br />buildz???</h1></div>'),('https://raw.githubusercontent.com/solanolabs/ci_memes/gh-pages/assets/images/never_too_much_automation.gif','<div><image src=\"__IMAGE__\" /></div><h1>Never too much automation</h1>'),('https://raw.githubusercontent.com/solanolabs/ci_memes/gh-pages/assets/images/picard_enjoys_passing_tests.jpg',''),('https://raw.githubusercontent.com/solanolabs/ci_memes/gh-pages/assets/images/red_shirt_explosion.gif','<div><image src=\"__IMAGE__\" style=\"height: 396px; width: 500px;\" /></div><h1>Solano CI:<br />no more red builds</h1>'),('https://raw.githubusercontent.com/solanolabs/ci_memes/gh-pages/assets/images/see_ci_in_action.gif','<div><image src=\"__IMAGE__\" style=\"height: 324px; width: 516px;\" /></div><h1>See Solano CI in action</h1>'),('https://raw.githubusercontent.com/solanolabs/ci_memes/gh-pages/assets/images/surf_board_beer.gif','<div><image src=\"__IMAGE__\" /></div><h1>Sysadmin after switching to Solano</h1>'),('https://raw.githubusercontent.com/solanolabs/ci_memes/gh-pages/assets/images/unit_test_walrus.jpg',''),('https://raw.githubusercontent.com/solanolabs/ci_memes/gh-pages/assets/images/yoda_broken_build.jpg','');
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

-- Dump completed on 2015-08-13  9:23:00
