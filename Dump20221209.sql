CREATE DATABASE  IF NOT EXISTS `db_powerhub_hm` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_powerhub_hm`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: db_powerhub_hm
-- ------------------------------------------------------
-- Server version	8.0.30

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

--
-- Table structure for table `tb_grupo`
--

DROP TABLE IF EXISTS `tb_grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_grupo` (
  `ID_GRUPO` int NOT NULL AUTO_INCREMENT,
  `NOME_DO_GRUPO` varchar(20) NOT NULL DEFAULT 'Grupo Padrao',
  `DATA_CRIACAO` datetime DEFAULT NULL,
  `FL_ATIVO` tinyint(1) DEFAULT (1),
  `ID_ORGANIZACAO` int DEFAULT NULL,
  PRIMARY KEY (`ID_GRUPO`),
  KEY `ib_organizacao` (`ID_ORGANIZACAO`),
  CONSTRAINT `ib_organizacao` FOREIGN KEY (`ID_ORGANIZACAO`) REFERENCES `tb_organizacao` (`ID_ORGANIZACAO`),
  CONSTRAINT `tb_grupo_ibfk_1` FOREIGN KEY (`ID_ORGANIZACAO`) REFERENCES `tb_organizacao` (`ID_ORGANIZACAO`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_grupo`
--

LOCK TABLES `tb_grupo` WRITE;
/*!40000 ALTER TABLE `tb_grupo` DISABLE KEYS */;
INSERT INTO `tb_grupo` VALUES (83,'Grupo Teste','2022-12-05 21:40:21',1,96);
/*!40000 ALTER TABLE `tb_grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_grupo_usuario`
--

DROP TABLE IF EXISTS `tb_grupo_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_grupo_usuario` (
  `ID_GRUPO_USUARIO` int NOT NULL AUTO_INCREMENT,
  `ID_GRUPO` int NOT NULL,
  `ID_USUARIO` int NOT NULL,
  `ID_ORGANIZACAO` int NOT NULL,
  PRIMARY KEY (`ID_GRUPO_USUARIO`),
  KEY `DEDE_idx` (`ID_GRUPO`),
  KEY `ID_ORGANIZACAO_idx` (`ID_ORGANIZACAO`),
  KEY `ID_USUARIO_FK` (`ID_USUARIO`),
  CONSTRAINT `ID_GRUPO_FK` FOREIGN KEY (`ID_GRUPO`) REFERENCES `tb_grupo` (`ID_GRUPO`),
  CONSTRAINT `ID_ORGANIZACAO_FK` FOREIGN KEY (`ID_ORGANIZACAO`) REFERENCES `tb_organizacao` (`ID_ORGANIZACAO`),
  CONSTRAINT `ID_USUARIO` FOREIGN KEY (`ID_USUARIO`) REFERENCES `tb_usuario` (`ID_USUARIO`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_grupo_usuario`
--

LOCK TABLES `tb_grupo_usuario` WRITE;
/*!40000 ALTER TABLE `tb_grupo_usuario` DISABLE KEYS */;
INSERT INTO `tb_grupo_usuario` VALUES (63,83,71,96),(64,83,72,96);
/*!40000 ALTER TABLE `tb_grupo_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_organizacao`
--

DROP TABLE IF EXISTS `tb_organizacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_organizacao` (
  `ID_ORGANIZACAO` int NOT NULL AUTO_INCREMENT,
  `NOME_ORGANIZACAO` varchar(100) NOT NULL,
  `DATA_CRIACAO` date NOT NULL,
  `FL_ATIVO` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID_ORGANIZACAO`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_organizacao`
--

LOCK TABLES `tb_organizacao` WRITE;
/*!40000 ALTER TABLE `tb_organizacao` DISABLE KEYS */;
INSERT INTO `tb_organizacao` VALUES (96,'Power','0000-00-00',1);
/*!40000 ALTER TABLE `tb_organizacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_relatorio`
--

DROP TABLE IF EXISTS `tb_relatorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_relatorio` (
  `ID_RELATORIO` int NOT NULL AUTO_INCREMENT,
  `DS_NOME_RELATORIO` varchar(100) NOT NULL,
  `DS_LINK_RELATORIO` varchar(1024) NOT NULL,
  `ID_GRUPO` int DEFAULT NULL,
  PRIMARY KEY (`ID_RELATORIO`),
  KEY `ID_GRUPO` (`ID_GRUPO`),
  CONSTRAINT `tb_relatorio_ibfk_1` FOREIGN KEY (`ID_GRUPO`) REFERENCES `tb_grupo` (`ID_GRUPO`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_relatorio`
--

LOCK TABLES `tb_relatorio` WRITE;
/*!40000 ALTER TABLE `tb_relatorio` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_relatorio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_usuario`
--

DROP TABLE IF EXISTS `tb_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_usuario` (
  `ID_USUARIO` int NOT NULL AUTO_INCREMENT,
  `NOME_USUARIO` varchar(100) NOT NULL,
  `DS_TELEFONE` varchar(15) NOT NULL,
  `DS_EMAIL` varchar(100) NOT NULL,
  `DS_LOGIN` varchar(30) NOT NULL,
  `DS_SENHA` varchar(256) NOT NULL,
  `FL_ADMINISTRADOR` tinyint(1) DEFAULT (1),
  `ID_ORGANIZACAO` int NOT NULL,
  PRIMARY KEY (`ID_USUARIO`),
  UNIQUE KEY `NOME_USUARIO` (`NOME_USUARIO`),
  UNIQUE KEY `DS_TELEFONE` (`DS_TELEFONE`),
  UNIQUE KEY `DS_EMAIL` (`DS_EMAIL`),
  KEY `ID_ORGANIZACAO_idx` (`ID_ORGANIZACAO`),
  CONSTRAINT `FK_ID_ORGANIZACAO` FOREIGN KEY (`ID_ORGANIZACAO`) REFERENCES `tb_organizacao` (`ID_ORGANIZACAO`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_usuario`
--

LOCK TABLES `tb_usuario` WRITE;
/*!40000 ALTER TABLE `tb_usuario` DISABLE KEYS */;
INSERT INTO `tb_usuario` VALUES (71,'Clayton','99000000000','relatorio@relatorio.com','admin','123',1,96),(72,'usrteste','09900000000','teste@teste.com','teste','000',0,96);
/*!40000 ALTER TABLE `tb_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'db_powerhub_hm'
--

--
-- Dumping routines for database 'db_powerhub_hm'
--
/*!50003 DROP PROCEDURE IF EXISTS `faculdades_select` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `faculdades_select`()
BEGIN
       SELECT * FROM tb_organizacao;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_autenticasUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_autenticasUsuario`(IN `DS_LOGIN` VARCHAR(20), IN `DS_SENHA` VARCHAR(30))
SELECT
	U.NOME_USUARIO,
	U.DS_LOGIN,
	U.DS_SENHA,
    U.ID_USUARIO,
	G.ID_GRUPO,
	G.NOME_DO_GRUPO,
    U.FL_ADMINISTRADOR
	FROM TB_USUARIO U
		INNER JOIN TB_GRUPO G
			ON U.ID_GRUPO = G.ID_GRUPO 
	WHERE U.DS_LOGIN =  `DS_LOGIN` AND U.DS_SENHA = `DS_SENHA` ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_autenticaUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_autenticaUsuario`(IN `DS_LOGIN` VARCHAR(20), IN `DS_SENHA` VARCHAR(256))
SELECT
	U.NOME_USUARIO,
	U.DS_LOGIN,
	U.DS_SENHA,
    U.ID_USUARIO,
	GP.ID_GRUPO,
	GP.NOME_DO_GRUPO,
    GP.ID_ORGANIZACAO,
    ORG.NOME_ORGANIZACAO,
    U.FL_ADMINISTRADOR
	FROM TB_USUARIO U
		INNER JOIN TB_GRUPO_USUARIO GPU
			ON U.ID_USUARIO = GPU.ID_USUARIO
		INNER JOIN TB_GRUPO GP
			ON GP.ID_GRUPO = GPU.ID_GRUPO
		INNER JOIN TB_ORGANIZACAO ORG
			ON GP.ID_ORGANIZACAO = GP.ID_ORGANIZACAO
	WHERE U.DS_LOGIN =  `DS_LOGIN` AND U.DS_SENHA = `DS_SENHA` ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_create_grupo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_create_grupo`(
	IN `ID_GRUPO` INT,
    IN `NOME_DO_GRUPO` VARCHAR(20),
    IN `DATA_CRIACAO` DATETIME,
    IN `FL_ATIVO` TINYINT,
    IN `ID_ORGANIZACAO` INT,
    
    IN `ID_GRUPO_USUARIO` INT, 
    IN `ID_GRUPO_USER` INT,
    IN `ID_USUARIO` INT,
    IN `ID_ORGANIZACAO_GRUPO` INT
)
BEGIN 
	INSERT INTO TB_GRUPO(`ID_GRUPO`, `NOME_DO_GRUPO`, `DATA_CRIACAO`, `FL_ATIVO`, `ID_ORGANIZACAO`) VALUES
    (ID_GRUPO, NOME_DO_GRUPO, DATA_CRIACAO, FL_ATIVO, ID_ORGANIZACAO);
    
	SELECT DISTINCT LAST_INSERT_ID() INTO @ID_GRUPO_USER FROM TB_GRUPO;
	
    INSERT INTO TB_GRUPO_USUARIO(`ID_GRUPO_USUARIO`,`ID_GRUPO`, `ID_USUARIO`, `ID_ORGANIZACAO`)VALUES
    (ID_GRUPO_USUARIO, @ID_GRUPO_USER, ID_USUARIO, ID_ORGANIZACAO);
   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_create_organizacao_and_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_create_organizacao_and_user`(
	  /*CRIACAO DA ORGANIZACAO*/
      IN `ID_ORGANIZACAO` INT,
	  in `NOME_ORGANIZACAO` varchar(100),
	  in `DATA_CRIACAO_ORG` date,
	  in `FL_ATIVO` TINYINT(1),
	  
      /*GRUPO*/
	  /*in `ID_GRUPO` INT,*/
      IN `ID_GRUPO` INT,
      IN `NOME_GRUPO` VARCHAR(20),
      IN `DATA_CRIACAO` DATETIME,
      IN `FL_ATIVO_GRUPO` TINYINT(1),
      IN `ID_ORGANIZACAO_GRUPO` INT,
      
      /**/
      IN `ID_USUARIO` INT,
      IN `NOME_USUARIO` VARCHAR(100),
      IN `DS_TELEFONE` VARCHAR(15),
      IN `DS_EMAIL` VARCHAR(100),
      IN `DS_LOGIN` VARCHAR(30),
      IN `DS_SENHA` VARCHAR(30),
      IN `FL_ADMINISTRADOR` VARCHAR(10),
      IN `ID_ORGANIZACAO_USUARIO` INT,
      /**/
	  IN `ID_GRUPO_USUARIO_R` INT,
      IN `ID_GRUPO_R` INT,
      IN `ID_USUARIO_R` INT,
      IN `ID_ORGANIZACAO_R` INT
  )
BEGIN
		BEGIN
			INSERT INTO `TB_ORGANIZACAO`(`NOME_ORGANIZACAO`, `DATA_CRIACAO`, `FL_ATIVO`) VALUES
			(NOME_ORGANIZACAO, DATA_CRIACAO_ORG, FL_ATIVO);
            
			SELECT DISTINCT LAST_INSERT_ID() INTO @ID_ORGANIZACAO_GRUPO FROM TB_ORGANIZACAO;
            
			INSERT INTO `TB_GRUPO`(`ID_GRUPO`, `NOME_DO_GRUPO`, `DATA_CRIACAO`, `FL_ATIVO`, `ID_ORGANIZACAO` ) VALUES
			(ID_GRUPO, NOME_DO_GRUPO, DATA_CRIACAO, FL_ATIVO, @ID_ORGANIZACAO_GRUPO);
            
            SELECT DISTINCT LAST_INSERT_ID() INTO @ID_GRUPO FROM TB_GRUPO;
            
			INSERT INTO `TB_USUARIO`(`ID_USUARIO`, `NOME_USUARIO`, `DS_TELEFONE`, `DS_EMAIL`, `DS_LOGIN`, `DS_SENHA`, `FL_ADMINISTRADOR`, `ID_ORGANIZACAO`) VALUES
			(ID_USUARIO, NOME_USUARIO, DS_TELEFONE, DS_EMAIL, DS_LOGIN, DS_SENHA, FL_ADMINISTRADOR, @ID_ORGANIZACAO_GRUPO );
            
            SELECT DISTINCT LAST_INSERT_ID() INTO @ID_USUARIO FROM TB_USUARIO;
		
            INSERT INTO `TB_GRUPO_USUARIO`(`ID_GRUPO_USUARIO`, `ID_GRUPO`, `ID_USUARIO`, `ID_ORGANIZACAO`) VALUES
			(ID_GRUPO_USUARIO, @ID_GRUPO, @ID_USUARIO, @ID_ORGANIZACAO_GRUPO);
		
		END;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_create_relatorio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_create_relatorio`(
	IN `ID_RELATORIO` INT,
    IN `DS_NOME_RELATORIO` VARCHAR(100),
    IN `DS_LINK_RELATORIO` VARCHAR(124),
    IN `ID_GRUPO` INT
)
BEGIN 
INSERT INTO TB_RELATORIO(`ID_RELATORIO`, `DS_NOME_RELATORIO`, `DS_LINK_RELATORIO`, `ID_GRUPO`) 
	VALUES(ID_RELATORIO, DS_NOME_RELATORIO, DS_LINK_RELATORIO, ID_GRUPO);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_list_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_user`(

    IN `ID_ORGANIZACAO` INT
)
BEGIN 
	
SELECT DISTINCT US.*
FROM TB_USUARIO US
	 LEFT OUTER JOIN TB_GRUPO_USUARIO GPU
		ON GPU.ID_USUARIO = US.ID_USUARIO
WHERE US.ID_ORGANIZACAO = `ID_ORGANIZACAO`;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TESTE7` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TESTE7`(
	  /*CRIACAO DA ORGANIZACAO*/
	  in `NOME_ORGANIZACAO` varchar(100),
	  in `DATA_CRIACAO` date, 
	  in `FL_ATIVO` TINYINT(1),
	  
      /*GRUPO*/
	  /*in `ID_GRUPO` INT,*/
      IN `NOME_GRUPO` VARCHAR(20),
      IN `DATA_CRICAO` DATETIME,
      IN `FL_ATIVO_GRUPO` TINYINT(1),
      IN `ID_ORGANIZACAO` INT,
      
      /**/
      IN `NOME_USUARIO` VARCHAR(100),
      IN `ID_GRUPO` INT,
      IN `DS_TELEFONE` VARCHAR(15),
      IN `DS_EMAIL` VARCHAR(100),
      IN `DS_LOGIN` VARCHAR(30), 
      IN `DS_SENHA` VARCHAR(30),
      IN `FL_ADMINISTRADOR` TINYINT
      
  )
BEGIN
      
		BEGIN
			INSERT INTO `TB_ORGANIZACAO`(`NOME_ORGANIZACAO`, `DATA_CRIACAO`, `FL_ATIVO`) VALUES
			(NOME_ORGANIZACAO, DATA_CRIACAO, FL_ATIVO);
		END;
        BEGIN
			INSERT INTO `TB_GRUPO`(`NOME_DO_GRUPO`, `DATA_CRIACAO`, `FL_ATIVO`, `ID_ORGANIZACAO` ) VALUES
			(NOME_DO_GRUPO, DATA_CRIACAO, FL_ATIVO, ID_ORGANIZACAO);
		END;
		BEGIN
			INSERT INTO `TB_USUARIO`(`NOME_USUARIO`, `ID_GRUPO`, `DS_TELEFONE`, `DS_EMAIL`, `DS_LOGIN`, `DS_SENHA`, `FL_ADMINISTRADOR` ) VALUES
			(NOME_USUARIO, ID_GRUPO, DS_TELEFONE, DS_EMAIL, DS_LOGIN, DS_SENHA, FL_ADMINISTRADOR );
		END;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-09  0:30:10
