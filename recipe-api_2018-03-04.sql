# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.17)
# Datenbank: recipe-api
# Erstellt am: 2018-03-04 15:25:44 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Export von Tabelle recipes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `recipes`;

CREATE TABLE `recipes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `ingredients` text,
  `preparation` text,
  `portion` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `recipes` WRITE;
/*!40000 ALTER TABLE `recipes` DISABLE KEYS */;

INSERT INTO `recipes` (`id`, `title`, `image_path`, `ingredients`, `preparation`, `portion`)
VALUES
	(1,'Steakpfanne mit Brokkoli',NULL,'180g Rindersteak\n150g Brokkoli\n40g Zwiebel\n1 Knoblauchzehe\n1 EL Olivenöl\n1 TL Chilisauce\netwas Chiliflocken\netwas Salz\netwas Pfeffer','Brokkoli putzen, waschen, in kleine Röschen teilen und in kochendem Salzwasser ca. 2 Minuten garen. Abgießen, und abschrecken.\n\nFleisch trocken tupfen und in Streifen schneiden. In einer Pfanne mit heißem Olivenöl rundherum etwa 3-5 Minuten anbraten. Mit Salz und Pfeffer würzen. Aus der Pfanne nehmen und zur Seite stellen.\n\nZwiebel und Knoblauch hacken und im Bratfett für etwa 2-3 Minuten andünsten. Chilisoße hinzufügen und unterrühren. Brokkoli in die Pfanne geben und 3 Minuten anbraten.\n\nSteakstreifen wieder in die Pfanne geben, kurz erwärmen und mit Salz, Pfeffer und Chiliflocken würzen.',1);

/*!40000 ALTER TABLE `recipes` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first` varchar(255) DEFAULT NULL,
  `last` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `Users_email_unique` (`email`),
  UNIQUE KEY `Users_phone_unique` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `first`, `last`, `email`, `phone`, `username`, `password`, `createdAt`, `updatedAt`)
VALUES
	(1,'Sam','Sampleman','sam@sampleman.com',NULL,'samsampleman','0d54e89080810023a1b8c9bc4f9c0ffba0e6a4d4f6998bb862b1f0ecfb64581bbddeecd8d82c6b7ef33e5049d30723cbbafb073300d90f544fc36cd209fef515','2018-03-02 00:00:00','2018-03-02 00:00:00');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
