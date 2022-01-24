CREATE DATABASE  IF NOT EXISTS `dbnoticia` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `dbnoticia`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dbnoticia
-- ------------------------------------------------------
-- Server version	5.7.33

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
-- Table structure for table `tblcomentario`
--

DROP TABLE IF EXISTS `tblcomentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblcomentario` (
  `idcomentario` int(11) NOT NULL AUTO_INCREMENT,
  `idnoticia` int(11) NOT NULL,
  `comentario` varchar(250) NOT NULL,
  `idcomentariopadre` int(11) DEFAULT NULL,
  `idusuario` int(11) NOT NULL,
  `fecharegistro` datetime NOT NULL,
  PRIMARY KEY (`idcomentario`),
  KEY `idcomentario` (`idcomentario`,`idnoticia`),
  KEY `idusuario` (`idusuario`),
  KEY `comentario_noticia` (`idnoticia`),
  CONSTRAINT `comentario_noticia` FOREIGN KEY (`idnoticia`) REFERENCES `tblnoticia` (`idnoticia`),
  CONSTRAINT `comentario_usuario` FOREIGN KEY (`idusuario`) REFERENCES `tblusuario` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcomentario`
--

LOCK TABLES `tblcomentario` WRITE;
/*!40000 ALTER TABLE `tblcomentario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblcomentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblimagen`
--

DROP TABLE IF EXISTS `tblimagen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblimagen` (
  `idimagen` int(11) NOT NULL AUTO_INCREMENT,
  `idnoticia` int(11) NOT NULL,
  `nombreimagen` varchar(100) NOT NULL,
  PRIMARY KEY (`idimagen`),
  KEY `idnoticia` (`idnoticia`),
  CONSTRAINT `tblimagen_ibfk_1` FOREIGN KEY (`idnoticia`) REFERENCES `tblnoticia` (`idnoticia`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblimagen`
--

LOCK TABLES `tblimagen` WRITE;
/*!40000 ALTER TABLE `tblimagen` DISABLE KEYS */;
INSERT INTO `tblimagen` VALUES (82,57,'image1253832022-01-24_violencia-machista-generado-cifras-record_0_52_1200_746.jpg');
/*!40000 ALTER TABLE `tblimagen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblnoticia`
--

DROP TABLE IF EXISTS `tblnoticia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblnoticia` (
  `idnoticia` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(250) NOT NULL,
  `contenido` text NOT NULL,
  `idusuario` int(11) NOT NULL,
  `fecharegistro` datetime NOT NULL,
  PRIMARY KEY (`idnoticia`),
  KEY `idusuario` (`idusuario`),
  CONSTRAINT `tblnoticia_ibfk_1` FOREIGN KEY (`idusuario`) REFERENCES `tblusuario` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblnoticia`
--

LOCK TABLES `tblnoticia` WRITE;
/*!40000 ALTER TABLE `tblnoticia` DISABLE KEYS */;
INSERT INTO `tblnoticia` VALUES (57,'Edomex, Veracruz y Jalisco registran un tercio de feminicidios en México','<p>La violencia machista ha provocado una lucha incansable de familiares y colectivos feministas para acceder a la justicia, que generalmente es para evitar el &#39;carpetazo&#39; en la investigaci&oacute;n.</p>\r\n\r\n<p>Nacer mujer en M&eacute;xico representa un riesgo; no importa la hora, ni el lugar, ni c&oacute;mo vas vestida y tampoco la edad, incluso una ni&ntilde;a puede ser v&iacute;ctima de feminicidio. Entre 2015 y noviembre del 2021 de acuerdo con datos del Secretariado Ejecutivo del Sistema Nacional de Seguridad P&uacute;blica (SESNSP) se han cometido al menos 554 feminicidios infantiles, siendo el 2020 el a&ntilde;o con m&aacute;s casos con un total de 115.</p>\r\n\r\n<p>De todos los feminicidios registrados, un tercio se concentran en solo tres estado del pa&iacute;s, Estado de M&eacute;xico con 97 casos, Veracruz con 48 casos y Jalisco con 42, lo que dan un total de 187 feminicidios en un periodo de seis a&ntilde;os.</p>\r\n\r\n<p>Mientras que los estados con las cifras m&aacute;s bajas son Tlaxcala y Yucat&aacute;n con un caso respectivamente, y en Baja California Sur no se tiene reporte de ning&uacute;n feminicidio infantil durante este tiempo, aunque s&iacute; se han reportado casos de mujeres v&iacute;ctimas de este delito.&nbsp;</p>',1,'2022-01-24 08:55:06');
/*!40000 ALTER TABLE `tblnoticia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpermiso`
--

DROP TABLE IF EXISTS `tblpermiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblpermiso` (
  `idpermiso` int(11) NOT NULL AUTO_INCREMENT,
  `idrol` int(11) NOT NULL,
  `uri` varchar(100) NOT NULL,
  PRIMARY KEY (`idpermiso`),
  KEY `idrol` (`idrol`),
  CONSTRAINT `tblpermiso_ibfk_1` FOREIGN KEY (`idrol`) REFERENCES `tblrol` (`idrol`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpermiso`
--

LOCK TABLES `tblpermiso` WRITE;
/*!40000 ALTER TABLE `tblpermiso` DISABLE KEYS */;
INSERT INTO `tblpermiso` VALUES (1,2,'Noticia/*'),(2,2,'Admin/*');
/*!40000 ALTER TABLE `tblpermiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpersonal`
--

DROP TABLE IF EXISTS `tblpersonal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblpersonal` (
  `idpersonal` int(11) NOT NULL AUTO_INCREMENT,
  `apepaterno` varchar(25) NOT NULL,
  `apematerno` varchar(25) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `direccion` varchar(250) NOT NULL,
  `fechaingreso` date NOT NULL,
  PRIMARY KEY (`idpersonal`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpersonal`
--

LOCK TABLES `tblpersonal` WRITE;
/*!40000 ALTER TABLE `tblpersonal` DISABLE KEYS */;
INSERT INTO `tblpersonal` VALUES (1,'Velasco','Palacios','Prudencio','Conocido','1990-04-28');
/*!40000 ALTER TABLE `tblpersonal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblrol`
--

DROP TABLE IF EXISTS `tblrol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblrol` (
  `idrol` int(11) NOT NULL AUTO_INCREMENT,
  `nombrerol` varchar(30) NOT NULL,
  PRIMARY KEY (`idrol`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblrol`
--

LOCK TABLES `tblrol` WRITE;
/*!40000 ALTER TABLE `tblrol` DISABLE KEYS */;
INSERT INTO `tblrol` VALUES (1,'EXTERNO'),(2,'INTERNO');
/*!40000 ALTER TABLE `tblrol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblusuario`
--

DROP TABLE IF EXISTS `tblusuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblusuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `idpersonal` int(11) NOT NULL,
  `apepaterno` varchar(25) NOT NULL,
  `apematerno` varchar(25) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `password` varchar(250) NOT NULL,
  `idrol` int(11) NOT NULL,
  PRIMARY KEY (`idusuario`),
  KEY `idrol` (`idrol`),
  KEY `idpersonal` (`idpersonal`),
  CONSTRAINT `tblusuario_ibfk_1` FOREIGN KEY (`idrol`) REFERENCES `tblrol` (`idrol`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblusuario`
--

LOCK TABLES `tblusuario` WRITE;
/*!40000 ALTER TABLE `tblusuario` DISABLE KEYS */;
INSERT INTO `tblusuario` VALUES (1,1,'Velasco','Palacios','Prudencio','pvelasco','$2y$10$gxvFRhWak5x7XeHBjnGDie65vpjNKQk5wtBgGLwvdZ5vHboM28YLy',2),(2,0,'Cristal','Torres','Cruz','tcristal','$2y$10$gxvFRhWak5x7XeHBjnGDie65vpjNKQk5wtBgGLwvdZ5vHboM28YLy',1);
/*!40000 ALTER TABLE `tblusuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'dbnoticia'
--

--
-- Dumping routines for database 'dbnoticia'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-24 10:37:11
