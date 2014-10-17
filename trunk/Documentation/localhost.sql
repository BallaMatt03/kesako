-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Mar 10 Juin 2014 à 14:59
-- Version du serveur: 5.5.24-log
-- Version de PHP: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `kezako`
--
DROP DATABASE IF EXISTS `kezako`;
CREATE DATABASE `kezako` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `kezako`;

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie` (
  `idCategorie` int(11) NOT NULL AUTO_INCREMENT,
  `labelCategorie` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`idCategorie`),
  UNIQUE KEY `idCategorie` (`idCategorie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `joueur`
--

DROP TABLE IF EXISTS `joueur`;
CREATE TABLE IF NOT EXISTS `joueur` (
  `idJoueur` int(11) NOT NULL AUTO_INCREMENT,
  `login` text COLLATE utf8_bin NOT NULL,
  `password` text COLLATE utf8_bin NOT NULL,
  `email` text COLLATE utf8_bin NOT NULL,
  `nbQuestionsCorrectes` int(11) NOT NULL DEFAULT '0',
  `nbQuestionsRepondus` int(11) NOT NULL DEFAULT '0',
  `nbTotalPoints` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idJoueur`),
  UNIQUE KEY `idJoueur` (`idJoueur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `question`
--

DROP TABLE IF EXISTS `question`;
CREATE TABLE IF NOT EXISTS `question` (
  `idQuestion` int(11) NOT NULL AUTO_INCREMENT,
  `labelQuestion` text COLLATE utf8_bin NOT NULL,
  `idCategorie` int(11) NOT NULL,
  PRIMARY KEY (`idQuestion`),
  UNIQUE KEY `idQuestion` (`idQuestion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `questionreponse`
--

DROP TABLE IF EXISTS `questionreponse`;
CREATE TABLE IF NOT EXISTS `questionreponse` (
  `idQuestion` int(11) NOT NULL,
  `idReponse` int(11) NOT NULL,
  `isCorrect` tinyint(1) NOT NULL,
  PRIMARY KEY (`idQuestion`,`idReponse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `reponse`
--

DROP TABLE IF EXISTS `reponse`;
CREATE TABLE IF NOT EXISTS `reponse` (
  `idReponse` int(11) NOT NULL AUTO_INCREMENT,
  `labelReponse` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`idReponse`),
  UNIQUE KEY `idReponse` (`idReponse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `salle`
--

DROP TABLE IF EXISTS `salle`;
CREATE TABLE IF NOT EXISTS `salle` (
  `idSalle` int(11) NOT NULL AUTO_INCREMENT,
  `nomSalle` text COLLATE utf8_bin NOT NULL,
  `idCategorie` int(11) NOT NULL DEFAULT '0',
  `nbQuestions` int(11) NOT NULL,
  `tempsLimite` int(11) NOT NULL,
  `isStarted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idSalle`),
  UNIQUE KEY `idRoom` (`idSalle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `sallejoueur`
--

DROP TABLE IF EXISTS `sallejoueur`;
CREATE TABLE IF NOT EXISTS `sallejoueur` (
  `idSalle` int(11) NOT NULL,
  `idJoueur` int(11) NOT NULL,
  `isHost` tinyint(1) NOT NULL,
  PRIMARY KEY (`idSalle`,`idJoueur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `sallequestion`
--

DROP TABLE IF EXISTS `sallequestion`;
CREATE TABLE IF NOT EXISTS `sallequestion` (
  `idSalle` int(11) NOT NULL,
  `idQuestion` int(11) NOT NULL,
  `winner` int(11) NOT NULL,
  PRIMARY KEY (`idSalle`,`idQuestion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
