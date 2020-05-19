-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 18, 2020 at 10:54 AM
-- Server version: 5.7.21
-- PHP Version: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gestion_clinique`
--

-- --------------------------------------------------------

--
-- Table structure for table `chambre`
--

DROP TABLE IF EXISTS `chambre`;
CREATE TABLE IF NOT EXISTS `chambre` (
  `numChambre` int(11) NOT NULL AUTO_INCREMENT,
  `categorie` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `numDept` int(11) NOT NULL,
  PRIMARY KEY (`numChambre`),
  KEY `Chambre_Departement_FK` (`numDept`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chambre`
--

INSERT INTO `chambre` (`numChambre`, `categorie`, `type`, `numDept`) VALUES
(1, 'satandard', 'solo', 1),
(2, 'prestige', 'solo confort', 3),
(3, 'prestige', 'solo', 4),
(4, 'standard', 'solo', 5),
(5, 'prestige', 'solo confort', 7),
(6, 'standard', 'solo', 8);

-- --------------------------------------------------------

--
-- Table structure for table `departement`
--

DROP TABLE IF EXISTS `departement`;
CREATE TABLE IF NOT EXISTS `departement` (
  `numDept` int(11) NOT NULL AUTO_INCREMENT,
  `nomDept` varchar(50) NOT NULL,
  PRIMARY KEY (`numDept`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `departement`
--

INSERT INTO `departement` (`numDept`, `nomDept`) VALUES
(1, 'D1'),
(2, 'D2'),
(3, 'D3'),
(4, 'D4'),
(5, 'D5'),
(6, 'D6'),
(7, 'D7'),
(8, 'D8'),
(9, 'D9'),
(10, 'D10');

-- --------------------------------------------------------

--
-- Table structure for table `feuille`
--

DROP TABLE IF EXISTS `feuille`;
CREATE TABLE IF NOT EXISTS `feuille` (
  `numFeuille` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `infos` varchar(50) NOT NULL,
  `numMalade` int(11) NOT NULL,
  PRIMARY KEY (`numFeuille`),
  KEY `Feuille_Malade_FK` (`numMalade`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feuille`
--

INSERT INTO `feuille` (`numFeuille`, `date`, `infos`, `numMalade`) VALUES
(1, '2020-02-09', 'I1', 1),
(2, '2020-01-19', 'I2', 2),
(3, '2012-03-09', 'I3', 3),
(4, '2020-04-19', 'I4', 4),
(5, '2012-05-09', 'I5', 11),
(6, '2012-12-09', 'I6', 6);

-- --------------------------------------------------------

--
-- Table structure for table `intervenir_dept`
--

DROP TABLE IF EXISTS `intervenir_dept`;
CREATE TABLE IF NOT EXISTS `intervenir_dept` (
  `numMed` int(11) NOT NULL,
  `numDept` int(11) NOT NULL,
  PRIMARY KEY (`numMed`,`numDept`),
  KEY `intervenir_Departement0_FK` (`numDept`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `intervenir_dept`
--

INSERT INTO `intervenir_dept` (`numMed`, `numDept`) VALUES
(1, 2),
(2, 4),
(3, 4),
(4, 2),
(5, 6),
(7, 8),
(9, 10);

-- --------------------------------------------------------

--
-- Table structure for table `lit`
--

DROP TABLE IF EXISTS `lit`;
CREATE TABLE IF NOT EXISTS `lit` (
  `numLit` int(11) NOT NULL AUTO_INCREMENT,
  `numChambre` int(11) NOT NULL,
  PRIMARY KEY (`numLit`),
  KEY `Lit_Chambre_FK` (`numChambre`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lit`
--

INSERT INTO `lit` (`numLit`, `numChambre`) VALUES
(1, 1),
(2, 2),
(3, 2),
(4, 3),
(5, 4),
(21, 5);

-- --------------------------------------------------------

--
-- Table structure for table `malade`
--

DROP TABLE IF EXISTS `malade`;
CREATE TABLE IF NOT EXISTS `malade` (
  `numMalade` int(11) NOT NULL AUTO_INCREMENT,
  `nomMalade` varchar(50) NOT NULL,
  `adresse` varchar(50) NOT NULL,
  `sexe` varchar(10) NOT NULL,
  `dateNaissance` date NOT NULL,
  `lieuNaissance` varchar(50) NOT NULL,
  `numDept` int(11) NOT NULL,
  PRIMARY KEY (`numMalade`),
  KEY `Malade_Departement_FK` (`numDept`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `malade`
--

INSERT INTO `malade` (`numMalade`, `nomMalade`, `adresse`, `sexe`, `dateNaissance`, `lieuNaissance`, `numDept`) VALUES
(1, 'Moussa', 'Thiaroye', 'masculin', '1990-12-11', 'Dakar', 2),
(2, 'Amadou', 'Pikine', 'masculin', '1990-12-01', 'Dakar', 2),
(3, 'Aminata', 'KM', 'feminin', '1992-12-11', 'Dakar', 3),
(4, 'Barry', 'Yeumbeul', 'masculin', '2012-03-09', 'Dakar', 4),
(5, 'Ba', 'Guediawwaye', 'feminin', '2012-04-22', 'Mbour', 2),
(6, 'Cisse', 'Rufisque', 'feminin', '2001-03-09', 'Thies', 6),
(7, 'Diop', 'KM', 'masculin', '1998-12-11', 'Dakar', 7),
(8, 'Emilie', 'Guediawwaye', 'feminin', '2014-03-09', 'Dakar', 8),
(9, 'Fall', 'Guediawwaye', 'masculin', '1990-12-16', 'Fouta', 9),
(10, 'Gore', 'Pikine', 'masculin', '1992-12-11', 'Dakar', 10),
(11, 'Honore', 'Thiaroye', 'masculin', '2020-01-22', 'Saint louis', 6),
(12, 'Isabelle', 'Paris', 'feminin', '2002-03-09', 'Paris', 3);

-- --------------------------------------------------------

--
-- Table structure for table `medecin`
--

DROP TABLE IF EXISTS `medecin`;
CREATE TABLE IF NOT EXISTS `medecin` (
  `numMed` int(11) NOT NULL AUTO_INCREMENT,
  `nomMed` varchar(50) NOT NULL,
  `numSpec` int(11) NOT NULL,
  PRIMARY KEY (`numMed`),
  KEY `Medecin_Specialite_FK` (`numSpec`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medecin`
--

INSERT INTO `medecin` (`numMed`, `nomMed`, `numSpec`) VALUES
(1, 'M1', 1),
(2, 'M2', 2),
(3, 'M3', 3),
(4, 'M4', 4),
(5, 'M5', 5),
(6, 'M6', 6),
(7, 'M7', 7),
(8, 'M8', 8),
(9, 'M9', 9),
(10, 'M10', 10),
(11, 'M11', 1);

-- --------------------------------------------------------

--
-- Table structure for table `occuper_lit`
--

DROP TABLE IF EXISTS `occuper_lit`;
CREATE TABLE IF NOT EXISTS `occuper_lit` (
  `numLit` int(11) NOT NULL,
  `numMalade` int(11) NOT NULL,
  `dateOccupation` date NOT NULL,
  PRIMARY KEY (`numLit`,`numMalade`),
  KEY `occuper_Malade0_FK` (`numMalade`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `occuper_lit`
--

INSERT INTO `occuper_lit` (`numLit`, `numMalade`, `dateOccupation`) VALUES
(1, 2, '2012-02-09'),
(3, 4, '2012-12-09'),
(2, 1, '2002-02-09'),
(5, 6, '2013-02-09'),
(7, 8, '2014-05-09'),
(21, 5, '2020-05-29'),
(21, 10, '2020-01-29'),
(21, 4, '2019-12-09');

-- --------------------------------------------------------

--
-- Table structure for table `specialite`
--

DROP TABLE IF EXISTS `specialite`;
CREATE TABLE IF NOT EXISTS `specialite` (
  `numSpec` int(11) NOT NULL AUTO_INCREMENT,
  `nomSpec` varchar(50) NOT NULL,
  PRIMARY KEY (`numSpec`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `specialite`
--

INSERT INTO `specialite` (`numSpec`, `nomSpec`) VALUES
(1, 'S1'),
(2, 'S2'),
(3, 'S3'),
(4, 'S4'),
(5, 'S5'),
(6, 'S6'),
(7, 'S7'),
(8, 'S8'),
(9, 'S9'),
(10, 'S10');

-- --------------------------------------------------------

--
-- Table structure for table `suivre`
--

DROP TABLE IF EXISTS `suivre`;
CREATE TABLE IF NOT EXISTS `suivre` (
  `numMed` int(11) NOT NULL,
  `numMalade` int(11) NOT NULL,
  PRIMARY KEY (`numMed`,`numMalade`),
  KEY `suivre_Malade0_FK` (`numMalade`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `suivre`
--

INSERT INTO `suivre` (`numMed`, `numMalade`) VALUES
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 6),
(5, 7),
(6, 8),
(7, 8),
(7, 9),
(9, 10);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
