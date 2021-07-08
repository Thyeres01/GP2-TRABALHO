CREATE DATABASE  IF NOT EXISTS `dbendemic` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `dbendemic`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: dbendemic
-- ------------------------------------------------------
-- Server version	5.6.14-log

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
-- Table structure for table `ac_corretiva`
--

DROP TABLE IF EXISTS `ac_corretiva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ac_corretiva` (
  `idac_corretiva` int(11) NOT NULL AUTO_INCREMENT,
  `nome_ac_corretiva` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`idac_corretiva`),
  UNIQUE KEY `idtipoac_corretiva_UNIQUE` (`idac_corretiva`),
  UNIQUE KEY `nome_ac_corretiva_UNIQUE` (`nome_ac_corretiva`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ac_corretiva`
--

LOCK TABLES `ac_corretiva` WRITE;
/*!40000 ALTER TABLE `ac_corretiva` DISABLE KEYS */;
INSERT INTO `ac_corretiva` VALUES (2,'Borrifação');
INSERT INTO `ac_corretiva` VALUES (1,'Nebolização');
/*!40000 ALTER TABLE `ac_corretiva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bairro`
--

DROP TABLE IF EXISTS `bairro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bairro` (
  `idbairro` int(11) NOT NULL AUTO_INCREMENT,
  `nome_bairro` varchar(45) NOT NULL,
  `nome_cidade` varchar(40) NOT NULL,
  PRIMARY KEY (`idbairro`),
  UNIQUE KEY `idbairro_UNIQUE` (`idbairro`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bairro`
--

LOCK TABLES `bairro` WRITE;
/*!40000 ALTER TABLE `bairro` DISABLE KEYS */;
INSERT INTO `bairro` VALUES (1,'Setor Central','Goiânia');
INSERT INTO `bairro` VALUES (3,'Setor Monte Sinai','Trindade');
INSERT INTO `bairro` VALUES (4,'Vila Roberto Monteiro','Trindade');
INSERT INTO `bairro` VALUES (5,'Jardim Novo Mundo','Goiânia');
INSERT INTO `bairro` VALUES (6,'Setor Serra Dourada','Trindade');
INSERT INTO `bairro` VALUES (8,'Morada do Bosque','Trindade');
INSERT INTO `bairro` VALUES (9,'Setor Comercial','Senador Canedo');
INSERT INTO `bairro` VALUES (10,'Conjunto Uirapuru','Senador Canedo');
INSERT INTO `bairro` VALUES (11,'Vila São sebastião ','Senador Canedo');
INSERT INTO `bairro` VALUES (12,'São francisco','Senador Canedo');
INSERT INTO `bairro` VALUES (13,'Vila Matinha','Senador Canedo');
INSERT INTO `bairro` VALUES (14,'Jardim Imperial','Trindade');
INSERT INTO `bairro` VALUES (15,'Jardim Novo Horizonte','Trindade');
INSERT INTO `bairro` VALUES (16,'Morada do Bosque','Trindade');
INSERT INTO `bairro` VALUES (17,'Jardim Dom Bosco','Aparecida de Goiânia');
INSERT INTO `bairro` VALUES (18,'Jardim Maranata','Aparecida de Goiânia');
INSERT INTO `bairro` VALUES (19,'Jardim Tiradentes','Aparecida de Goiânia');
INSERT INTO `bairro` VALUES (20,'Setor Garavelo','Aparecida de Goiânia');
INSERT INTO `bairro` VALUES (21,'Bairro Ilda','Aparecida de Goiânia');
INSERT INTO `bairro` VALUES (22,'Papillon Park','Aparecida de Goiânia');
INSERT INTO `bairro` VALUES (23,'Parque Das Nações','Aparecida de Goiânia');
INSERT INTO `bairro` VALUES (24,'Loteamento Retiro Dos Bosques','Aparecida de Goiânia');
INSERT INTO `bairro` VALUES (25,'Jardim Eldorado','Aparecida de Goiânia');
INSERT INTO `bairro` VALUES (26,'Jardim Olimpico','Aparecida de Goiânia');
INSERT INTO `bairro` VALUES (27,'Parque Trindade','Aparecida de Goiânia');
INSERT INTO `bairro` VALUES (28,'Vila Brasília','Aparecida de Goiânia');
INSERT INTO `bairro` VALUES (30,'Setor Sul','Goiânia');
INSERT INTO `bairro` VALUES (31,'Setor Oeste','Goiânia');
INSERT INTO `bairro` VALUES (32,'Setor Pedro Ludovico','Goiânia');
INSERT INTO `bairro` VALUES (33,'Parque Amazonia','Goiânia');
INSERT INTO `bairro` VALUES (34,'Setor Crimeia Leste','Goiânia');
INSERT INTO `bairro` VALUES (35,'Vila São Francisco','Goiânia');
INSERT INTO `bairro` VALUES (36,'Vila Itatiaia','Goiânia');
INSERT INTO `bairro` VALUES (37,'Setor Jao','Goiânia');
INSERT INTO `bairro` VALUES (38,'Chacara Do Governador','Goiânia');
INSERT INTO `bairro` VALUES (39,'Jardim Goiás','Goiânia');
/*!40000 ALTER TABLE `bairro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cidade`
--

DROP TABLE IF EXISTS `cidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cidade` (
  `idcidade` int(11) NOT NULL AUTO_INCREMENT,
  `nome_cidade` varchar(40) NOT NULL,
  PRIMARY KEY (`idcidade`),
  UNIQUE KEY `idcidade_UNIQUE` (`idcidade`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cidade`
--

LOCK TABLES `cidade` WRITE;
/*!40000 ALTER TABLE `cidade` DISABLE KEYS */;
INSERT INTO `cidade` VALUES (1,'Aparecida de Goiânia');
INSERT INTO `cidade` VALUES (2,'Goiânia');
INSERT INTO `cidade` VALUES (3,'Senador Canedo');
INSERT INTO `cidade` VALUES (4,'Trindade');
/*!40000 ALTER TABLE `cidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estagio`
--

DROP TABLE IF EXISTS `estagio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estagio` (
  `idestagio` int(11) NOT NULL AUTO_INCREMENT,
  `nome_estagio` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`idestagio`),
  UNIQUE KEY `idnew_table_UNIQUE` (`idestagio`),
  UNIQUE KEY `nome_estagio_UNIQUE` (`nome_estagio`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estagio`
--

LOCK TABLES `estagio` WRITE;
/*!40000 ALTER TABLE `estagio` DISABLE KEYS */;
INSERT INTO `estagio` VALUES (2,'Larva');
INSERT INTO `estagio` VALUES (4,'Mosquito');
INSERT INTO `estagio` VALUES (1,'Ovo');
INSERT INTO `estagio` VALUES (3,'Pupa');
/*!40000 ALTER TABLE `estagio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcao`
--

DROP TABLE IF EXISTS `funcao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funcao` (
  `idfuncao` int(11) NOT NULL AUTO_INCREMENT,
  `nome_funcao` varchar(25) NOT NULL,
  PRIMARY KEY (`idfuncao`),
  UNIQUE KEY `idfuncao_UNIQUE` (`idfuncao`),
  UNIQUE KEY `nome_funcao_UNIQUE` (`nome_funcao`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcao`
--

LOCK TABLES `funcao` WRITE;
/*!40000 ALTER TABLE `funcao` DISABLE KEYS */;
INSERT INTO `funcao` VALUES (1,'Administrador');
INSERT INTO `funcao` VALUES (2,'Agente');
INSERT INTO `funcao` VALUES (3,'Atendente');
INSERT INTO `funcao` VALUES (4,'Convidado');
/*!40000 ALTER TABLE `funcao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funcionario` (
  `idfuncionario` int(11) NOT NULL AUTO_INCREMENT,
  `matricula` varchar(10) CHARACTER SET utf8 NOT NULL,
  `nome` varchar(60) CHARACTER SET utf8 NOT NULL,
  `funcao` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `senha` varchar(15) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`idfuncionario`),
  UNIQUE KEY `matricula_UNIQUE` (`matricula`),
  UNIQUE KEY `idfuncionario_UNIQUE` (`idfuncionario`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES (1,'admin','Administrador','Administrador','administrador@sysendemic.com','admin');
INSERT INTO `funcionario` VALUES (2,'100001','Sabrina Carneiro','Administrador','sabrina@sysendemic.com','123');
INSERT INTO `funcionario` VALUES (3,'100002','Henrique Coimbra','Agente','henrique@sysendemic.com','123');
INSERT INTO `funcionario` VALUES (4,'100003','Eduardo Braz','Agente','eduardo@sysendemic.com','123');
INSERT INTO `funcionario` VALUES (5,'100004','Marieta Severo','Atendente','marieta@sysendemic.com','123');
INSERT INTO `funcionario` VALUES (6,'100005','Lorena Abrahão','Atendente','lorena@sysendemic.com','123');
INSERT INTO `funcionario` VALUES (7,'100006','Márcio Coimbra','Agente','marcio@sysendemic.com','123');
INSERT INTO `funcionario` VALUES (8,'100007','Cinara de Jesus','Convidado','cinara@sysendemic.com','123');
INSERT INTO `funcionario` VALUES (9,'100008','Marcos Nascimento Pereira','Agente','marcos@sysendemic.com','123');
INSERT INTO `funcionario` VALUES (10,'100009','Lourenço Peixoto','Atendente','lourenco@sysendemic.com','123');
INSERT INTO `funcionario` VALUES (11,'100010','Moisés Assunção','Agente','moises@sysendemic.com','123');
INSERT INTO `funcionario` VALUES (12,'100011','Maria de Fátima da Silva','Atendente','maria@sysendemic.com','123');
INSERT INTO `funcionario` VALUES (13,'100012','Carlos Daniel Menezes','Atendente','carlos@sysendemic.com','123');
INSERT INTO `funcionario` VALUES (14,'100013','Zélia Costa','Agente','zelia@sysendemic.com','123');
INSERT INTO `funcionario` VALUES (15,'100014','Talita Queróz','Agente','talita@sysendemic.com','123');
INSERT INTO `funcionario` VALUES (16,'100015','Bruna Nunes','Agente','bruna@sysendemic.com','123');
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificacao`
--

DROP TABLE IF EXISTS `notificacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notificacao` (
  `idnotificacao` int(11) NOT NULL AUTO_INCREMENT,
  `data_notificacao` datetime NOT NULL,
  `data_visita` datetime DEFAULT NULL,
  `bairro` varchar(30) NOT NULL,
  `rua` varchar(45) NOT NULL,
  `quadra` varchar(5) NOT NULL,
  `lote` varchar(5) NOT NULL,
  `numero` varchar(5) NOT NULL,
  `cidade` varchar(30) NOT NULL,
  `tp_imovel` varchar(15) NOT NULL,
  `desc_notificacao` varchar(300) NOT NULL,
  `verificado` tinyint(4) DEFAULT '0',
  `complemento` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idnotificacao`),
  UNIQUE KEY `iddenuncia_UNIQUE` (`idnotificacao`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificacao`
--

LOCK TABLES `notificacao` WRITE;
/*!40000 ALTER TABLE `notificacao` DISABLE KEYS */;
INSERT INTO `notificacao` VALUES (22,'2017-12-07 22:01:00','2017-12-07 22:04:00','Setor Sul','Rua 108','s/n','s/n','104','Goiânia','Casa','',1,'');
INSERT INTO `notificacao` VALUES (23,'2017-12-07 22:06:00','2017-12-07 22:08:00','Setor Central','RUA 74','s/n','s/n','245','Goiânia','Casa','',1,'');
INSERT INTO `notificacao` VALUES (24,'2017-12-07 22:13:00','2017-12-07 22:16:00','Vila Itatiaia','Rua 21','s/n','s/n','61','Goiânia','Casa','',1,'');
INSERT INTO `notificacao` VALUES (25,'2017-12-07 23:28:00',NULL,'Bairro Ilda','trr','4','4','6','Aparecida de Goiânia','Loja','',0,'6');
/*!40000 ALTER TABLE `notificacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoimovel`
--

DROP TABLE IF EXISTS `tipoimovel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoimovel` (
  `idimovel` int(11) NOT NULL AUTO_INCREMENT,
  `nome_tpimovel` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`idimovel`),
  UNIQUE KEY `idimovel_UNIQUE` (`idimovel`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoimovel`
--

LOCK TABLES `tipoimovel` WRITE;
/*!40000 ALTER TABLE `tipoimovel` DISABLE KEYS */;
INSERT INTO `tipoimovel` VALUES (1,'Apartamento');
INSERT INTO `tipoimovel` VALUES (2,'Casa');
INSERT INTO `tipoimovel` VALUES (3,'Deposito');
INSERT INTO `tipoimovel` VALUES (4,'Loja');
INSERT INTO `tipoimovel` VALUES (5,'Lote');
INSERT INTO `tipoimovel` VALUES (6,'Sala Comercial');
/*!40000 ALTER TABLE `tipoimovel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tratamento`
--

DROP TABLE IF EXISTS `tratamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tratamento` (
  `idtratamento` int(11) NOT NULL AUTO_INCREMENT,
  `nome_tratamento` varchar(30) NOT NULL,
  `tp_tratamento` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`idtratamento`),
  UNIQUE KEY `idlarvicida_UNIQUE` (`idtratamento`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tratamento`
--

LOCK TABLES `tratamento` WRITE;
/*!40000 ALTER TABLE `tratamento` DISABLE KEYS */;
INSERT INTO `tratamento` VALUES (10,'Biovech','Larvicida 1');
INSERT INTO `tratamento` VALUES (11,'Pyriproxyfen','Larvicida 2');
INSERT INTO `tratamento` VALUES (12,'Malathion','Adulticida 1');
INSERT INTO `tratamento` VALUES (13,'Bendiocarb','Adulticida 2');
/*!40000 ALTER TABLE `tratamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visita`
--

DROP TABLE IF EXISTS `visita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visita` (
  `idvisita` int(11) NOT NULL AUTO_INCREMENT,
  `idnotificacao` int(11) DEFAULT NULL,
  `status` varchar(15) NOT NULL,
  `agente` varchar(60) NOT NULL,
  `data_visita` datetime NOT NULL,
  `bairro` varchar(30) NOT NULL,
  `rua` varchar(45) NOT NULL,
  `quadra` varchar(5) DEFAULT NULL,
  `lote` varchar(5) DEFAULT NULL,
  `numero` varchar(5) DEFAULT NULL,
  `cidade` varchar(30) NOT NULL,
  `latitude` varchar(20) NOT NULL,
  `longitude` varchar(20) NOT NULL,
  `tp_imovel` varchar(15) NOT NULL,
  `estagio` varchar(100) DEFAULT 'Não encontrado',
  `tp_larvicida` varchar(100) DEFAULT NULL,
  `dp1` tinyint(4) DEFAULT '0',
  `dp2` tinyint(4) DEFAULT '0',
  `dp3` tinyint(4) DEFAULT '0',
  `dp4` tinyint(4) DEFAULT '0',
  `dp5` tinyint(4) DEFAULT '0',
  `dp6` tinyint(4) DEFAULT '0',
  `dp7` tinyint(4) DEFAULT '0',
  `qt1` int(4) DEFAULT '0',
  `qt2` int(4) DEFAULT '0',
  `qt3` int(4) DEFAULT '0',
  `qt4` int(4) DEFAULT '0',
  `qt5` int(4) DEFAULT '0',
  `qt6` int(4) DEFAULT '0',
  `qt7` int(4) DEFAULT '0',
  `n_ini` int(11) DEFAULT NULL,
  `n_fim` int(11) DEFAULT NULL,
  `n_tubitos` int(11) DEFAULT '0',
  `qt_larv1` int(11) DEFAULT '0',
  `qt_larv2` int(11) DEFAULT '0',
  `qt_adult1` int(11) DEFAULT '0',
  `qt_adult2` int(11) DEFAULT '0',
  `qt_focostratados` int(11) DEFAULT '0',
  `complemento` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idvisita`),
  UNIQUE KEY `idvisita_UNIQUE` (`idvisita`)
) ENGINE=InnoDB AUTO_INCREMENT=340 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visita`
--

LOCK TABLES `visita` WRITE;
/*!40000 ALTER TABLE `visita` DISABLE KEYS */;
INSERT INTO `visita` VALUES (89,0,'Visitado','Administrador','2017-11-27 22:28:00','Setor Monte Sinai','UMBELINO VICENTE DA SILVA','35','24','s/n','Trindade','-16.632344025000002','-49.504376879999995','Casa','Mosquito,Ovo','Bendiocarb,Malathion',1,0,1,1,0,0,0,1,0,2,1,0,0,0,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (90,0,'Visitado','Administrador','2017-11-27 22:38:00','Setor Monte Sinai','JOAO MARIANO DE SOUZA','35','5','s/n','Trindade','-16.632801495','-49.5047376','Casa','Larva,Mosquito','Biovech,Pyriproxyfen',1,1,0,0,1,0,0,2,1,0,0,2,0,0,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (91,0,'Visitado','Administrador','2017-11-28 19:54:00','Setor Monte Sinai','RAIMUNDO LOPES','34','1','s/n','Trindade','-16.633328985','-49.505173920000004','Casa','Mosquito,Ovo','Bendiocarb,Malathion',1,1,0,0,1,0,1,2,1,0,0,2,0,3,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (92,0,'Visitado','Administrador','2017-11-28 19:58:00','Setor Monte Sinai','RAIMUNDO LOPES','33','27','s/n','Trindade','-16.633393965','-49.5052245','Casa','Larva,Mosquito','Bendiocarb,Malathion',1,1,1,0,1,0,1,1,1,0,0,2,0,2,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (93,0,'Visitado','Administrador','2017-11-28 20:03:00','Setor Monte Sinai','JOAQUIM ALGUSTO PORTUGAL','32','2','s/n','Trindade','-16.63466652','-49.504376519999994','Apartamento','Mosquito','Bendiocarb',0,1,0,1,0,0,1,0,1,0,1,0,0,2,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (94,0,'Visitado','Administrador','2017-11-28 20:06:00','Setor Monte Sinai','NILO JOSE CORREIA','32','6','s/n','Trindade','-16.633752399662235','-49.50406736014549','Apartamento','Larva,Mosquito','Bendiocarb,Malathion',1,0,1,0,0,0,1,1,0,1,0,0,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (95,0,'Visitado','Administrador','2017-11-28 20:08:00','Setor Monte Sinai','DIVINO LUIZ RIBEIRO','32','20','s/n','Trindade','-16.634055015','-49.503599460000004','Apartamento','Mosquito,Ovo','Biovech,Malathion',1,0,1,0,0,0,1,1,0,1,0,0,0,2,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (96,0,'Visitado','Administrador','2017-11-28 20:13:00','Setor Monte Sinai','DIVINO LUIZ RIBEIRO','19','12','s/n','Trindade','-16.634101995','-49.50352962','Apartamento','Mosquito,Ovo','Bendiocarb,Malathion',1,0,0,0,0,0,1,1,0,0,0,0,0,2,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (97,0,'Visitado','Administrador','2017-11-28 20:19:00','Setor Monte Sinai','UMBELINO VICENTE DA SILVA','19','19','s/n','Trindade','-16.633532969999997','-49.502791619999996','Deposito','Larva,Mosquito,Ovo','Bendiocarb,Malathion',1,0,1,1,0,0,1,2,0,1,2,0,0,3,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (98,0,'Visitado','Administrador','2017-11-28 20:21:00','Setor Monte Sinai','JOAO DE DES GUIMARAES','19','20','s/n','Trindade','-16.634436975','-49.5030285','Casa','Larva,Mosquito','Biovech,Malathion',1,0,0,1,0,0,1,1,0,0,1,0,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (99,0,'Visitado','Administrador','2017-11-28 20:23:00','Setor Monte Sinai','JOAQUIM ALGUSTO PORTUGAL','19','1','s/n','Trindade','-16.635006','-49.5037665','Loja','Larva,Mosquito','Bendiocarb,Malathion',1,1,0,0,0,0,1,1,1,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (100,0,'Visitado','Administrador','2017-11-28 20:26:00','Setor Monte Sinai','JOAQUIM ALGUSTO PORTUGAL','18','1','s/n','Trindade','-16.635361005','-49.50317412','Loja','Mosquito,Ovo','Biovech,Malathion',1,1,1,0,0,0,1,1,1,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (101,0,'Visitado','Administrador','2017-11-28 20:28:00','Setor Monte Sinai','ANTONIO ALVES FORTES','18','19','s/n','Trindade','-16.63497999','-49.50255456','Apartamento','Larva,Mosquito','Bendiocarb,Malathion',1,0,1,0,0,0,1,1,0,1,0,0,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (102,0,'Visitado','Administrador','2017-11-28 20:31:00','Setor Monte Sinai','JOAO CARLOS CAMILO','17','12','s/n','Trindade','-16.635551985','-49.502106','Casa','Larva,Mosquito','Biovech,Malathion',1,0,0,0,0,0,1,1,0,0,0,0,0,2,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (103,0,'Visitado','Administrador','2017-11-28 20:33:00','Setor Monte Sinai','LUIZ CARLOS DE MORAES','31','3','s/n','Trindade','-16.63576299','-49.505085539999996','Casa','Mosquito,Ovo','Biovech,Malathion',1,0,0,0,0,0,1,1,0,0,0,0,0,3,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (104,0,'Visitado','Administrador','2017-11-28 20:37:00','Setor Monte Sinai','JOAO CARLOS CAMILO','21','32','s/n','Trindade','-16.63619148','-49.502555099999995','Deposito','Larva,Mosquito,Ovo','Bendiocarb,Biovech,Malathion',1,1,1,1,0,0,1,1,1,1,1,0,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (105,0,'Visitado','Administrador','2017-11-28 20:39:00','Setor Monte Sinai','JOAO ATALIBA DE CAMPOS','20','3','s/n','Trindade','-16.63597854','-49.50359496','Apartamento','Larva,Mosquito','Bendiocarb,Malathion',1,0,0,0,0,0,1,1,0,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (106,0,'Visitado','Administrador','2017-11-28 20:41:00','Setor Monte Sinai','OTAVIO DIAS DE OLIVEIRA','30','1','s/n','Trindade','-16.63744401','-49.506206399999996 ','Apartamento','Larva,Mosquito','Bendiocarb,Malathion',1,0,0,0,0,0,1,1,0,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (107,0,'Visitado','Administrador','2017-11-28 20:43:00','Setor Monte Sinai','L DOMINGUES','30','5','s/n','Trindade','-16.63647736564217','-49.505937204818885','Loja','Mosquito,Ovo','Biovech,Malathion',1,0,1,1,0,0,1,1,0,1,2,0,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (108,0,'Visitado','Administrador','2017-11-28 20:45:00','Setor Monte Sinai','ARI PINTO DE MAGALHAES','22','01','s/n','Trindade','-16.6370715','-49.50429804','Loja','Ovo,Pupa','Biovech,Malathion',1,0,1,0,0,0,1,1,0,1,0,0,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (109,0,'Visitado','Administrador','2017-11-28 20:49:00','Vila Roberto Monteiro','VESPAZIANO ODORICO VIEIRA','D','06','s/n','Trindade','-16.66604723573726','-49.49337209472187','Apartamento','Larva,Mosquito','Bendiocarb,Malathion',1,0,0,0,0,0,1,1,0,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (110,0,'Visitado','Administrador','2017-11-28 20:52:00','Vila Roberto Monteiro','ADIR MOISES','D','10','s/n','Trindade','-16.666202475','-49.49293392','Apartamento','Larva,Mosquito','Bendiocarb,Malathion',1,0,1,0,0,0,1,1,0,1,0,0,0,2,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (111,0,'Visitado','Administrador','2017-11-28 20:54:00','Vila Roberto Monteiro','VEREADOR JAIME DE OLIVEIRA','E','13','s/n','Trindade','-16.66705446000000','-49.493007000000006','Casa','Mosquito,Ovo,Pupa','Bendiocarb,Biovech,Malathion',1,0,1,1,0,0,1,1,0,1,1,0,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (112,0,'Visitado','Administrador','2017-11-28 20:57:00','Vila Roberto Monteiro','SANTA TEREZINHA','A','02','s/n','Trindade','-16.66493298','-49.4929789','Casa','Larva,Mosquito','Bendiocarb,Malathion',1,1,0,0,0,0,1,1,1,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (113,0,'Visitado','Administrador','2017-11-28 20:58:00','Vila Roberto Monteiro','JOSE QUIRINO','c','05','s/n','Trindade','-16.665756029997247','-49.493453039995856','Casa','Larva,Mosquito','Biovech',1,0,1,1,0,0,1,1,0,1,0,0,0,0,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (114,0,'Visitado','Administrador','2017-11-28 21:02:00','Vila Roberto Monteiro','F','F','3','s/n','Trindade','-16.66813698','-49.493056859999996','Apartamento','Larva,Mosquito','Bendiocarb,Malathion',1,0,0,0,0,0,1,1,0,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (115,0,'Visitado','Administrador','2017-11-28 21:05:00','Jardim Novo Horizonte','ABRAO MANOEL DA COSTA','04','02','s/n','Trindade','-16.67090366393295','-49.49174380552995','Apartamento','Larva,Mosquito','Bendiocarb,Malathion',1,0,0,0,0,0,1,1,0,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (116,0,'Visitado','Administrador','2017-11-28 21:09:00','Jardim Novo Horizonte','PADRE MAURILIO FERNANDES','01','01','s/n','Trindade','-16.67135502','-49.4906679','Apartamento','Larva,Ovo','Bendiocarb,Malathion',1,0,1,0,0,0,1,1,0,1,0,0,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (117,0,'Visitado','Administrador','2017-11-28 21:14:00','Setor Serra Dourada','PERCIANA NATAL DA CONCEICAO','1','33','s/n','Trindade','-16.639389','-49.4939169','Deposito','Larva,Ovo','Biovech,Malathion',1,0,1,1,0,0,1,1,0,1,1,0,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (118,0,'Visitado','Administrador','2017-11-28 21:16:00','Setor Serra Dourada','PERCIANA NATAL DA CONCEICAO','2','1','s/n','Trindade','-16.639678035','-49.49438904','Casa','Larva,Mosquito','Bendiocarb,Malathion',1,0,0,1,0,0,1,1,0,0,1,0,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (119,0,'Visitado','Administrador','2017-11-28 21:18:00','Setor Serra Dourada','ADELINA DE MORAIS BORGES','3','1','s/n','Trindade','-16.639413734315514','-49.4957979496141','Casa','Larva,Mosquito','Biovech,Malathion',1,0,1,1,0,0,1,1,0,1,1,0,0,2,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (120,0,'Visitado','Administrador','2017-11-28 21:20:00','Setor Serra Dourada','KATIA ROVANE FERREIRA','03','17','s/n','Trindade','-16.638416505000002','-49.496166','Apartamento','Mosquito','Bendiocarb,Malathion',1,0,0,0,0,0,1,1,0,0,0,0,0,2,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (121,0,'Visitado','Administrador','2017-11-28 21:22:00','Setor Serra Dourada','KATIA ROVANE FERREIRA','2','17','s/n','Trindade','-16.638027525','-49.49559648','Apartamento','Mosquito','Bendiocarb,Malathion',1,0,1,0,0,0,1,1,0,1,0,0,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (122,0,'Visitado','Administrador','2017-11-28 21:23:00','Setor Serra Dourada','KATIA ROVANE FERREIRA','1','16','s/n','Trindade','-16.637661','-49.49505792','Apartamento','Mosquito,Ovo','Biovech,Malathion',1,0,1,0,0,0,1,1,0,1,0,0,0,10,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (123,0,'Visitado','Administrador','2017-11-28 21:29:00','Setor Serra Dourada','DOIS','1','25','s/n','Trindade','-16.637928518091556','-49.49445550037899','Apartamento','Mosquito,Ovo','Bendiocarb,Malathion',1,0,0,0,0,0,1,1,0,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (124,0,'Visitado','Administrador','2017-11-28 21:30:00','Setor Serra Dourada','ELZA DE FREITAS','1','3','s/n','Trindade','-16.63864452','-49.49467938','Apartamento','Larva,Mosquito','Biovech,Malathion',1,0,1,0,0,0,1,1,1,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (125,0,'Visitado','Administrador','2017-11-28 21:32:00','Setor Serra Dourada','MARINA DE OLIVEIRA','3','20','s/n','Trindade','-16.639064505','-49.49530398','Apartamento','Mosquito,Ovo','Biovech,Malathion',1,0,1,0,0,0,1,1,0,1,0,0,0,2,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (126,0,'Visitado','Administrador','2017-11-28 21:34:00','Setor Serra Dourada','ELZA DE FREITAS','2','21','s/n','Trindade','-16.638689024999998','-49.4947494','Apartamento','Larva,Mosquito','Bendiocarb,Malathion',1,0,1,0,0,0,1,1,0,1,0,0,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (127,0,'Visitado','Administrador','2017-11-28 21:37:00','Setor Serra Dourada','OTILIA F ALMEIDA','12','8','s/n','Trindade','-16.632873','-49.49940042','Casa','Larva,Mosquito','Bendiocarb,Malathion',1,0,1,1,0,0,1,1,1,0,2,0,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (128,0,'Visitado','Administrador','2017-11-28 21:39:00','Setor Serra Dourada','JOSEFA SILVA VIERA','10','18','s/n','Trindade','-16.634957985','-49.498660619999995','Casa','Mosquito,Ovo','Biovech,Malathion',1,0,1,1,0,0,1,1,0,1,1,0,0,10,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (129,0,'Visitado','Administrador','2017-11-28 21:41:00','Setor Serra Dourada','MARINA DE OLIVEIRA','12','2','s/n','Trindade','-16.633863495','-49.49902944','Casa','Larva,Mosquito','Biovech,Malathion',1,0,0,0,0,0,1,1,0,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (130,0,'Visitado','Administrador','2017-11-28 21:43:00','Setor Serra Dourada','ELZA DE FREITAS','12','20','s/n','Trindade','-16.633506015000002','-49.498542','Casa','Larva,Mosquito','Biovech,Malathion',1,0,1,0,0,0,1,1,0,1,0,0,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (131,0,'Visitado','Administrador','2017-11-28 21:46:00','Setor Serra Dourada','JOSEFA SILVA VIEIRA','12','34','s/n','Trindade','-16.634496509999998','-49.49817102','Deposito','Mosquito,Ovo','Biovech,Malathion',1,0,1,1,0,0,1,1,0,1,1,0,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (132,0,'Visitado','Administrador','2017-11-28 21:49:00','Setor Serra Dourada','LAUDELINA TOLEDO','7','17','s/n','Trindade','-16.635914505000002','-49.4962974','Deposito','Larva,Mosquito,Ovo','Bendiocarb,Biovech,Malathion',1,0,1,1,0,0,1,1,0,1,2,0,0,2,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (133,0,'Visitado','Administrador','2017-11-28 21:50:00','Setor Serra Dourada','LAUDELINA TOLEDO','9','36','s/n','Trindade','-16.63624998','-49.496891579999996','Deposito','Mosquito,Ovo','Biovech,Malathion',1,0,0,1,0,0,1,1,0,0,1,0,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (134,0,'Visitado','Administrador','2017-11-28 21:52:00','Setor Serra Dourada','LAUDELINA TOLEDO','6','17','s/n','Trindade','-16.63631649','-49.49684406','Deposito','Larva,Mosquito','Bendiocarb,Malathion',1,0,0,0,0,0,1,1,0,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (135,0,'Visitado','Administrador','2017-11-28 21:54:00','Setor Serra Dourada','ELZA DE FREITAS','7','2','s/n','Trindade','-16.636928985','-49.49593146','Loja','Mosquito,Ovo','Biovech,Malathion',1,0,0,0,0,0,1,1,0,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (136,0,'Visitado','Administrador','2017-11-28 21:56:00','Setor Serra Dourada','IDALINA MARIA DE ALMEIDA','4','3','s/n','Trindade','-16.63829001','-49.49740638','Loja','Mosquito,Ovo','Bendiocarb,Malathion',1,0,1,0,0,0,1,1,0,1,0,0,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (137,0,'Visitado','Administrador','2017-11-28 21:58:00','Setor Serra Dourada','ADELINA DE MORAIS BORGES','5','3','s/n','Trindade','-16.63770839765473','-49.49707048087842','Loja','Mosquito,Ovo','Bendiocarb,Biovech',1,0,0,0,0,0,1,1,0,0,0,0,0,2,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (138,0,'Visitado','Administrador','2017-11-28 22:12:00','Jardim Imperial','CENTO E QUARENTA E NOVE','37','24','s/n','Trindade','-16.65185949','-49.51616346','Loja','Mosquito,Ovo','Biovech,Malathion',1,1,0,0,0,0,1,1,1,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (139,0,'Visitado','Administrador','2017-11-28 22:15:00','Jardim Imperial','CENTO E QUARENTA E NOVE','40','4','s/n','Trindade','-16.6523897295137','-49.51550299828689','Loja','Ovo,Pupa','Bendiocarb,Biovech',1,0,1,0,0,0,1,1,0,1,0,0,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (140,0,'Visitado','Administrador','2017-11-28 22:16:00','Jardim Imperial','CENTO E CINQUENTA E CINCO','40','36','s/n','Trindade','-16.65194669114303','-49.51507557563176','Loja','Mosquito,Ovo','Bendiocarb,Malathion',1,0,1,0,0,0,1,1,0,1,0,0,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (141,0,'Visitado','Administrador','2017-11-28 22:19:00','Jardim Imperial','CENTO E CINQUENTA E CINCO','43','1','s/n','Trindade','-16.652574989999998','-49.51429992','Loja','Mosquito,Ovo','Biovech,Malathion',1,1,0,0,0,0,1,1,1,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (142,0,'Visitado','Administrador','2017-11-28 22:21:00','Jardim Imperial','CENTO E QUARENTA E CINCO','44','1','s/n','Trindade','-16.651409985','-49.51550537999999','Apartamento','Mosquito,Ovo','Bendiocarb,Malathion',1,0,1,0,0,0,1,1,0,1,0,0,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (143,0,'Visitado','Administrador','2017-11-28 22:24:00','Jardim Imperial','CENTO E VINTE','46','20','s/n','Trindade','-16.650927494999998','-49.51449684','Apartamento','Larva,Mosquito','Bendiocarb,Malathion',1,1,0,0,0,0,1,1,1,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (144,0,'Visitado','Administrador','2017-11-28 22:26:00','Jardim Imperial','CENTO E VINTE','47','23','s/n','Trindade','-16.65087102','-49.5145575','Apartamento','Larva,Mosquito','Bendiocarb,Malathion',1,0,0,0,0,0,1,1,0,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (145,0,'Visitado','Administrador','2017-11-28 22:31:00','Jardim Imperial','CENTO E CIQUENTA E NOVE','47','15','s/n','Trindade','-16.650233505','-49.51476702','Apartamento','Larva,Mosquito','Bendiocarb,Pyriproxyfen',1,1,0,0,0,0,1,1,1,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (146,0,'Visitado','Administrador','2017-11-28 22:33:00','Jardim Imperial','CENTO E CIQUENTA E NOVE','46','26','s/n','Trindade','-16.651363005','-49.5135414','Apartamento','Larva,Mosquito','Biovech,Malathion',1,1,0,0,0,0,1,1,1,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (147,0,'Visitado','Administrador','2017-11-28 22:35:00','Jardim Imperial','CENTO E CIQUENTA E NOVE','49','1','s/n','Trindade','-16.651308014999998','-49.5134829','Apartamento','Mosquito,Ovo','Biovech,Malathion',1,0,0,0,0,0,1,11,0,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (148,0,'Visitado','Administrador','2017-11-28 22:38:00','Jardim Imperial','CENTO E VINTE','49','16','s/n','Trindade','-16.650424035','-49.5139905','Casa','Mosquito,Ovo','Biovech,Malathion',1,1,0,0,1,1,0,1,1,0,0,1,1,0,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (149,0,'Visitado','Administrador','2017-11-28 22:42:00','Jardim Imperial','CENTO E VINTE','50','22','s/n','Trindade','-16.650364500000002','-49.51405098','Casa','Mosquito,Ovo','Biovech,Malathion',1,1,0,1,0,1,0,1,1,0,1,0,1,0,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (150,0,'Visitado','Administrador','2017-11-28 22:44:00','Jardim Imperial','CENTO E SESSENTA E TRES','50','15','s/n','Trindade','-16.64973351','-49.51426554','Casa','Larva,Mosquito','Bendiocarb,Malathion',1,1,0,1,0,0,0,1,1,0,1,0,0,0,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (151,0,'Visitado','Administrador','2017-11-28 22:48:00','Jardim Imperial','CENTO E SESSENTA E TRES','49','22','s/n','Trindade','-16.650880020000002','-49.5130446','Apartamento','Larva,Mosquito','Biovech,Malathion',1,0,0,0,0,0,1,1,0,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (152,0,'Visitado','Administrador','2017-11-28 22:50:00','Jardim Imperial','CENTO E SESSENTA E CINCO','52','15','s/n','Trindade','-16.6492845','-49.51380798','Casa','Larva,Mosquito','Biovech,Malathion',1,0,0,1,0,0,0,1,0,0,1,0,0,0,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (153,0,'Visitado','Administrador','2017-11-28 22:51:00','Jardim Imperial','CENTO E CIQUENTA E SETE','45','20','s/n','Trindade','-16.652679525','-49.51205496','Loja','Mosquito','Biovech',1,0,0,0,0,1,0,1,0,0,0,0,1,0,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (154,0,'Visitado','Administrador','2017-11-28 22:53:00','Jardim Imperial','CENTO E DEZ','34','28','s/n','Trindade','-16.655730525000003','-49.512550499999996','Loja','Mosquito,Ovo','Bendiocarb,Malathion',1,1,0,0,0,1,0,1,1,0,0,0,1,0,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (155,0,'Visitado','Administrador','2017-12-06 21:17:00','Jardim Imperial','CENTO E CIQUENTA BE','38','22','s/n','Trindade','-16.655847951359082','-49.510919562547485','Loja','Larva,Mosquito','Bendiocarb,Malathion',1,0,1,0,0,1,0,1,1,0,0,0,1,0,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (156,0,'Visitado','Administrador','2017-11-28 23:01:00','Morada do Bosque','DOS TARUMAS','39','07','s/n','Trindade','-16.644375495','-49.433024880000005','Casa','Mosquito,Ovo','Bendiocarb,Malathion',1,0,0,0,0,1,0,1,0,0,0,0,1,0,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (157,0,'Visitado','Administrador','2017-11-28 23:03:00','Morada do Bosque','JOSE MANOEL DA SILVEIRA','09','02','s/n','Trindade','-16.64511799498515','-49.431106980006646','Apartamento','Mosquito,Ovo','Bendiocarb,Malathion',1,0,0,0,0,1,0,1,0,0,0,0,1,0,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (158,0,'Visitado','Administrador','2017-11-28 23:06:00','Morada do Bosque','DONA OLIVIA MARIA','08','04','s/n','Trindade','-16.64500387912495','-49.43045413511623','Casa','Larva,Mosquito','Bendiocarb,Malathion',1,0,1,0,0,0,1,1,0,10,0,0,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (159,0,'Visitado','Administrador','2017-11-28 23:08:00','Morada do Bosque','JOSE MANOEL DA SILVEIRA','08','14','s/n','Trindade','-16.645101975','-49.431024539999996','Casa','Mosquito,Ovo','Biovech,Malathion',1,0,0,0,1,0,0,1,0,0,0,1,0,0,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (160,0,'Visitado','Administrador','2017-11-28 23:10:00','Morada do Bosque','DONA MARIQUINHA','04','14','s/n','Trindade','-16.644793741585392','-49.42889895590056','Casa','Larva,Mosquito','Biovech,Malathion',1,1,0,0,0,0,1,0,1,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (161,0,'Visitado','Administrador','2017-11-28 23:13:00','Morada do Bosque',',DONA MARIQUINHA','06','08','s/n','Trindade','-16.644803845518744','-49.428993204995564','Casa','Larva,Mosquito','Bendiocarb,Malathion',1,0,0,0,1,0,1,1,0,0,0,1,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (162,0,'Visitado','Administrador','2017-11-28 23:14:00','Morada do Bosque','ISABEL ESPERDIAO JORGE','06','25','s/n','Trindade','-16.644868965','-49.42966356','Casa','Larva,Mosquito','Biovech,Malathion',1,0,1,0,0,1,0,1,0,1,0,0,1,0,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (163,0,'Visitado','Administrador','2017-11-28 23:18:00','Morada do Bosque','DONA OLIVIA MARIA','07','01','s/n','Trindade','-16.64498745721877','-49.43036213978498','Casa','Mosquito,Ovo,Pupa','Bendiocarb,Malathion,Pyriproxyfen',1,1,0,0,1,0,1,1,1,0,0,1,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (164,0,'Visitado','Administrador','2017-11-28 23:21:00','Morada do Bosque','DONA RACHIDE AUAD','09','11','s/n','Trindade','-16.644924830501076','-49.431769978367214','Apartamento','Mosquito','Malathion',1,0,0,0,0,0,0,1,0,0,0,0,0,0,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (165,0,'Visitado','Administrador','2017-11-28 23:22:00','Morada do Bosque','ANTONIO ARAUJO','09','07','s/n','Trindade','-16.64552102628985','-49.431666182791695','Apartamento','Larva,Mosquito','Bendiocarb,Malathion',0,0,0,0,0,0,1,0,0,0,0,0,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (166,0,'Visitado','Administrador','2017-11-28 23:25:00','Morada do Bosque','MANOEL FERNANDES','04','07','s/n','Trindade','-16.644735549893692','-49.42827187848232','Apartamento','Mosquito,Ovo','Biovech,Malathion',0,0,1,0,0,0,1,0,0,1,0,0,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (167,0,'Visitado','Administrador','2017-11-28 23:26:00','Morada do Bosque','JOSE FERNANDES ALVES','02','18','s/n','Trindade','-16.646630985','-49.428891','Apartamento','Mosquito,Ovo','Biovech,Malathion',1,0,1,0,0,0,1,1,0,1,0,0,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (168,0,'Visitado','Administrador','2017-12-01 21:21:00','Setor Comercial','VALTER VELOSO','02','06','s/n','Senador Canedo','-16.70286753','-49.10849442','Casa','Mosquito,Ovo','Bendiocarb,Malathion',1,0,1,0,0,0,1,1,0,1,0,0,0,2,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (169,0,'Visitado','Administrador','2017-12-01 21:23:00','Setor Comercial','TOM JOBIM','02','29','s/n','Senador Canedo','-16.701990525','-49.108900500000004','Casa','Larva,Mosquito','Biovech,Malathion',1,0,1,1,0,0,1,1,0,1,2,0,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (170,0,'Visitado','Administrador','2017-12-01 21:25:00','Setor Comercial','NITEROI','03','28','s/n','Senador Canedo','-16.7011245','-49.1095044','Casa','Mosquito,Ovo','Biovech,Malathion',1,0,1,0,0,1,0,1,0,1,0,0,1,0,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (171,0,'Visitado','Administrador','2017-12-01 21:27:00','Setor Comercial','OLAVO BILAC','03','03','s/n','Senador Canedo','-16.70096629882114','-49.10797436119145','Casa','Larva,Mosquito','Biovech,Malathion',1,1,0,1,0,0,0,1,1,0,1,0,0,0,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (172,0,'Visitado','Administrador','2017-12-01 21:29:00','Setor Comercial','DO CORCOVADO','05','1 e 3','s/n','Senador Canedo','-16.70309221232705','-49.11029547091862','Casa','Larva,Mosquito','Biovech,Malathion',1,1,0,0,1,0,1,1,1,0,0,1,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (173,0,'Visitado','Administrador','2017-12-01 21:30:00','Setor Comercial','PROGRESSO','01','07','s/n','Senador Canedo','-16.703811821371918','-49.10798583430691','Casa','Mosquito,Ovo','Bendiocarb,Malathion',1,0,0,1,0,0,1,1,0,0,1,0,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (174,0,'Visitado','Administrador','2017-12-01 21:34:00','Setor Comercial','GO 0 19','s/n','s/n','s/n','Senador Canedo','-16.704921015','-49.111664039999994','Deposito','Larva,Mosquito,Ovo','Bendiocarb,Biovech,Malathion',1,1,1,1,0,0,1,1,1,1,1,0,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (175,0,'Visitado','Administrador','2017-12-01 21:36:00','Setor Comercial','NITEROI','s/n','s/n','s/n','Senador Canedo','-16.701061005','-49.10955984','Deposito','Mosquito,Ovo','Bendiocarb,Malathion',1,1,0,0,1,1,0,1,1,0,0,1,1,0,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (176,0,'Visitado','Administrador','2017-12-01 21:55:00','Vila São sebastião','PRESIDENTE GETULIO VARGAS','26','01','s/n','Senador Canedo','-16.717292999999998','-49.08527856','Loja','Larva,Mosquito','Bendiocarb,Malathion',1,0,1,0,0,0,1,1,0,1,0,0,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (177,0,'Visitado','Administrador','2017-12-01 21:56:00','Vila São sebastião','CENTO E QUATORZE,','45','15','s/n','Senador Canedo','-16.721513505','-49.085332019999996','Apartamento','Larva,Mosquito','Bendiocarb,Biovech,Malathion',1,0,0,0,0,1,1,1,0,0,0,0,1,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (178,0,'Visitado','Administrador','2017-12-01 21:58:00','Vila São sebastião','CENTO E TRES','45','10','s/n','Senador Canedo','-16.720742475','-49.08570498','Apartamento','Mosquito,Ovo','Bendiocarb,Malathion',1,0,1,0,0,1,0,1,0,1,0,0,1,0,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (179,0,'Visitado','Administrador','2017-12-01 22:00:00','Vila São sebastião','CENTO E TREZE','45','03','s/n','Senador Canedo','-16.71992649','-49.08544002','Loja','Larva,Mosquito','Bendiocarb,Malathion',1,0,1,0,1,0,0,1,0,1,0,1,0,0,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (180,0,'Visitado','Administrador','2017-12-01 22:03:00','Vila São sebastião','PRESIDENTE GETULIO VARGAS','45','22','s/n','Senador Canedo','-16.72069752','-49.08506706','Deposito','Mosquito,Ovo,Pupa','Biovech,Malathion,Pyriproxyfen',1,1,1,1,0,0,1,1,1,1,1,0,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (181,0,'Visitado','Administrador','2017-12-01 22:05:00','Vila São sebastião','JOSE LOBO','46','12','s/n','Senador Canedo','-16.72080147','-49.08646494','Casa','Larva,Mosquito','Biovech,Malathion',1,0,0,0,0,1,1,1,0,0,0,0,1,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (182,0,'Visitado','Administrador','2017-12-01 22:08:00','Vila São sebastião','SENADOR,CANEDO','47','08','s/n','Senador Canedo','-16.720899029999998','-49.08740004','Deposito','Mosquito,Ovo,Pupa','Biovech,Malathion,Pyriproxyfen',0,1,0,1,0,1,0,0,1,0,1,0,1,0,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (183,0,'Visitado','Administrador','2017-12-01 22:10:00','Vila São sebastião','CENTO E UM','48','12','s/n','Senador Canedo','-16.72096653','-49.0883004','Apartamento','Larva,Ovo','Biovech,Malathion',0,1,0,0,1,0,1,0,1,0,0,1,0,11,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (184,0,'Visitado','Administrador','2017-12-01 22:12:00','Vila São sebastião','CENTO E QUATRO','49','12','s/n','Senador Canedo','-16.72181001','-49.08866706','Casa','Mosquito,Pupa','Malathion,Pyriproxyfen',1,0,1,1,0,0,1,1,0,1,1,0,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (185,0,'Visitado','Administrador','2017-12-01 22:14:00','Vila São sebastião','CENTO E CINCO','50','08','s/n','Senador Canedo','-16.721138025000002','-49.08984192','Apartamento','Larva,Mosquito','Bendiocarb,Malathion',0,0,1,0,0,1,1,0,0,1,0,0,1,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (186,0,'Visitado','Administrador','2017-12-01 22:16:00','Vila São sebastião','CLOVES BERTOLDO DE SOUSA','03','02','s/n','Senador Canedo','-16.72126749','-49.09102506','Loja','Mosquito,Ovo','Biovech,Malathion',1,1,1,0,1,0,0,1,1,1,0,1,0,0,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (187,0,'Visitado','Administrador','2017-12-01 22:18:00','Vila São sebastião','CENTO E DOZE 2','01','23','s/n','Senador Canedo','-16.7185755','-49.09043142','Loja','Mosquito,Ovo,Pupa','Biovech,Malathion,Pyriproxyfen',1,0,1,1,1,0,1,1,0,1,2,1,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (188,0,'Visitado','Administrador','2017-12-01 22:20:00','Vila São sebastião','CENTO E ONZ','31','06','s/n','Senador Canedo','-16.71764301','-49.08978252','Deposito','Mosquito,Ovo,Pupa','Biovech,Malathion,Pyriproxyfen',0,1,0,1,1,1,0,0,1,0,1,1,1,0,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (189,0,'Visitado','Administrador','2017-12-01 22:22:00','Vila São sebastião','CENTO E SEIS','01','08','s/n','Senador Canedo','-16.71306201','-49.085886959999996','Casa','Mosquito,Ovo','Bendiocarb,Malathion',0,1,1,0,1,1,0,0,1,1,0,1,1,0,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (190,0,'Visitado','Administrador','2017-12-01 22:26:00','São francisco','FRANCISCA MAIA DA SILVEIRA','04','06','s/n','Senador Canedo','-16.700155099331496','-49.080993088498204','Apartamento','Larva,Mosquito','Bendiocarb,Biovech,Malathion',0,1,1,0,0,1,1,0,1,1,0,0,1,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (191,0,'Visitado','Administrador','2017-12-01 22:28:00','São francisco','OLIVEIRA FERREIRA MAIA','01','12','s/n','Senador Canedo','-16.70438303461905','-49.08672612571555','Apartamento','Mosquito','Biovech',0,1,0,0,1,0,1,0,1,0,0,1,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (192,0,'Visitado','Administrador','2017-12-01 22:29:00','São francisco','SF DEZ','02','11','s/n','Senador Canedo','-16.703392019166053','-49.08659402603535','Casa','Mosquito,Ovo','Bendiocarb,Malathion',1,1,1,1,0,0,0,1,1,1,2,0,0,0,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (193,0,'Visitado','Administrador','2017-12-01 22:31:00','São francisco','SF NOVE','02','01','s/n','Senador Canedo','-16.7038546423933','-49.0868233939950','Apartamento','Larva,Mosquito','Biovech,Malathion',0,1,0,0,1,0,1,0,1,0,0,1,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (194,0,'Visitado','Administrador','2017-12-01 22:33:00','São francisco','MANOEL FERREIRA MAIA','06','15','s/n','Senador Canedo','-16.701021123117847','-49.0817927945355','Loja','Mosquito,Ovo','Biovech,Malathion',1,1,1,0,0,1,0,1,1,1,0,0,1,0,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (195,0,'Visitado','Administrador','2017-12-01 22:36:00','São francisco','OILDA VALERIA SILVEIRA COELHO','09','15','s/n','Senador Canedo','-16.70261131589345','-49.08238631872665','Casa','Larva,Mosquito','Bendiocarb,Malathion',1,0,1,1,1,0,0,1,0,1,1,1,0,0,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (196,0,'Visitado','Administrador','2017-12-01 22:37:00','São francisco','MARIA LEMOS MAIA','10','18','s/n','Senador Canedo','-16.702750854800602','-49.083406761387394','Apartamento','Larva,Mosquito','Bendiocarb,Malathion',0,1,1,0,0,0,1,0,1,1,0,0,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (197,0,'Visitado','Administrador','2017-12-01 22:39:00','São francisco','MARIA FERREIRA MAIA','11','20','s/n','Senador Canedo','-16.7031875888837','-49.083814026332746','Casa','Mosquito,Ovo','Biovech,Malathion',0,1,1,1,1,1,0,0,1,1,1,1,1,0,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (198,0,'Visitado','Administrador','2017-12-01 22:41:00','São francisco','HELIO CAMPOS','12','21','s/n','Senador Canedo','-16.70361886858675','-49.08421612216574','Deposito','Larva,Mosquito','Bendiocarb,Biovech,Malathion',1,0,1,1,1,1,0,1,0,1,2,1,1,0,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (199,0,'Visitado','Administrador','2017-12-01 22:43:00','São francisco','ANTONIO FERREIRA MAIA','13','20','s/n','Senador Canedo','-16.707589535351552','-49.08290918237505','Casa','Mosquito,Ovo','Biovech,Malathion',1,1,1,0,0,0,1,1,1,1,0,0,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (200,0,'Visitado','Administrador','2017-12-01 22:46:00','Vila Matinha','QUATRO','03','05','s/n','Senador Canedo','-16.640474984999997','-49.13816904','Loja','Larva,Mosquito','Bendiocarb,Malathion',0,1,0,1,1,0,1,0,1,0,1,1,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (201,0,'Visitado','Administrador','2017-12-01 22:47:00','Vila Matinha','CINCO','12','01','s/n','Senador Canedo','-16.63662920583304','-49.138549019412345','Deposito','Mosquito,Ovo,Pupa','Biovech,Malathion,Pyriproxyfen',1,1,1,1,1,0,0,1,1,1,1,1,0,0,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (202,0,'Visitado','Administrador','2017-12-01 22:49:00','Vila Matinha','OITO','12','05','s/n','Senador Canedo','-16.637860484999997','-49.1381955','Apartamento','Mosquito','Biovech,Malathion',0,1,0,0,1,1,1,0,1,0,0,1,1,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (203,0,'Visitado','Administrador','2017-12-01 22:50:00','Vila Matinha','TRES','04','01','s/n','Senador Canedo','-16.6385835','-49.138228440000006','Casa','Larva,Mosquito,Ovo','Bendiocarb,Biovech,Malathion',1,1,1,1,0,0,1,1,1,1,1,0,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (204,0,'Visitado','Administrador','2017-12-01 22:52:00','Vila Matinha','SEIS','04','03','s/n','Senador Canedo','-16.639260479999997','-49.13827038','Apartamento','Larva,Mosquito','Bendiocarb,Malathion',0,1,0,0,1,1,1,0,1,0,0,1,1,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (205,0,'Visitado','Administrador','2017-12-01 22:54:00','Vila Matinha','SETE','13','12','s/n','Senador Canedo','-16.635964995000002','-49.13741844','Loja','Larva,Mosquito','Bendiocarb,Malathion',0,1,0,0,1,1,1,0,1,0,0,1,1,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (206,0,'Visitado','Administrador','2017-12-01 22:57:00','Vila Matinha','DOIS','16','18','s/n','Senador Canedo','-16.637534504999998','-49.1356215','Deposito','Mosquito,Ovo','Biovech,Malathion',1,1,1,1,1,1,0,1,1,1,1,1,1,0,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (207,0,'Visitado','Administrador','2017-12-01 23:01:00','Vila Matinha','DOIS','09','05','s/n','Senador Canedo','-16.63882047','-49.136387400000004','Loja','Mosquito,Ovo','Biovech,Malathion',0,1,1,0,1,1,0,0,1,1,0,1,1,0,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (208,0,'Visitado','Administrador','2017-12-01 23:03:00','Vila Matinha','UM','06','09','s/n','Senador Canedo','-16.640188965','-49.13755902','Loja','Mosquito,Ovo','Biovech,Malathion',1,1,0,1,1,1,0,1,1,0,1,1,1,0,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (209,0,'Visitado','Administrador','2017-12-01 23:06:00','Vila Matinha','LEOPOLDO DE BULHOES','08','05','s/n','Senador Canedo','-16.639170525','-49.135787640000004','Casa','Mosquito,Ovo','Biovech,Malathion',1,0,1,1,0,0,1,1,0,1,1,0,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (210,0,'Visitado','Administrador','2017-12-01 23:09:00','Vila Matinha','JO TRINTA E NOVE','B','16','s/n','Senador Canedo','-16.647687579815397','-49.14326121512805','Deposito','Mosquito,Ovo,Pupa','Biovech,Malathion,Pyriproxyfen',1,1,1,1,0,1,1,1,1,1,1,0,1,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (211,0,'Visitado','Administrador','2017-12-05 21:14:00','Jardim Dom Bosco','MOISES OLEGARIO DE JESUS','34','13','s/n','Aparecida de Goiânia','-16.817250558453','-49.34811851611445','Casa','Larva,Mosquito','Bendiocarb,Malathion',1,0,1,0,0,0,1,1,0,1,0,0,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (212,0,'Visitado','Administrador','2017-12-05 21:16:00','Jardim Dom Bosco','MOISES OLEGARIO DE JESUS','33','11','s/n','Aparecida de Goiânia','-16.816092634811998','-49.348914067968494','Casa','Mosquito,Ovo','Biovech,Malathion',1,0,1,1,0,0,1,1,0,1,1,0,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (213,0,'Visitado','Administrador','2017-12-05 21:18:00','Jardim Dom Bosco','NEUZA DE JESUS MACEDO','33','12','s/n','Aparecida de Goiânia','-16.815393892741426','-49.34899610318298','Casa','Larva,Mosquito','Bendiocarb,Malathion',0,1,1,1,0,0,0,0,1,1,1,0,0,0,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (214,0,'Visitado','Administrador','2017-12-05 21:22:00','Jardim Dom Bosco','FRANCISCA DA CRUZ MACEDO','33','17','s/n','Aparecida de Goiânia','-16.81574148','-49.34838258','Deposito','Mosquito,Ovo,Pupa','Biovech,Malathion,Pyriproxyfen',1,1,0,1,1,0,1,1,1,0,10,1,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (215,0,'Visitado','Administrador','2017-12-05 21:25:00','Jardim Dom Bosco','MOACIR CAMILO NASCIMENTO','33','02','s/n','Aparecida de Goiânia','-16.81644008566735','-49.34830063717845','Loja','Larva,Mosquito','Bendiocarb,Malathion',0,1,0,1,1,0,0,0,1,0,1,1,0,0,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (216,0,'Visitado','Administrador','2017-12-05 21:27:00','Jardim Dom Bosco','MOACIR CAMILO NASCIMENTO','34','05','s/n','Aparecida de Goiânia','-16.816501777018','-49.348254586020744','Deposito','Mosquito,Ovo','Biovech,Malathion',1,0,0,0,1,1,1,1,0,0,0,1,1,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (217,0,'Visitado','Administrador','2017-12-05 21:29:00','Jardim Dom Bosco','JOAO GOULART FERNANDES','34','16','s/n','Aparecida de Goiânia','-16.817620796435','-49.347513370093694','Loja','Larva,Mosquito','Bendiocarb,Malathion',0,1,1,0,0,1,1,0,1,1,0,0,1,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (218,0,'Visitado','Administrador','2017-12-05 21:32:00','Jardim Dom Bosco','DOUTOR CICERO CRUZ MACEDO','17','05','s/n','Aparecida de Goiânia','-16.814602485','-49.34663388','Casa','Larva,Mosquito','Biovech,Malathion',1,0,1,0,1,0,0,1,0,1,0,1,0,0,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (219,0,'Visitado','Administrador','2017-12-05 21:34:00','Jardim Dom Bosco','FRANCISCO SARAIVA DA CRUZ','10','11','s/n','Aparecida de Goiânia','-16.8132825','-49.34442402','Casa','Mosquito,Ovo','Biovech,Malathion',1,0,1,1,1,0,0,1,0,1,1,1,0,0,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (220,0,'Visitado','Administrador','2017-12-05 21:36:00','Jardim Dom Bosco','RAIMUNDO OLEGARIO DA CRUZ','12','13','s/n','Aparecida de Goiânia','-16.8136502697941','-49.344879557944246','Casa','Larva,Mosquito','Biovech,Malathion',1,1,1,1,0,0,0,1,1,1,1,0,0,0,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (221,0,'Visitado','Administrador','2017-12-05 21:38:00','Jardim Dom Bosco','ANA ISABEL SANTANA','14','15','s/n','Aparecida de Goiânia','-16.814117475','-49.345425','Apartamento','Mosquito,Ovo','Biovech,Malathion',0,1,1,0,1,1,1,0,1,1,0,1,1,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (222,0,'Visitado','Administrador','2017-12-05 21:40:00','Jardim Dom Bosco','WALMIR OLEGARIO CRUZ','16','20','s/n','Aparecida de Goiânia','-16.814526181275394','-49.345901809428454','Casa','Larva,Mosquito,Ovo','Bendiocarb,Biovech,Malathion',1,1,0,0,1,1,0,1,1,0,0,1,1,0,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (223,0,'Visitado','Administrador','2017-12-05 21:41:00','Jardim Dom Bosco','ODALIO OLEGARIO CRUZ,','24','04','s/n','Aparecida de Goiânia','-16.814962485000002','-49.34718504','Casa','Mosquito,Ovo','Biovech,Malathion',1,0,0,0,0,1,1,1,0,0,0,0,1,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (224,0,'Visitado','Administrador','2017-12-05 21:43:00','Jardim Dom Bosco','MARIA CELIDA CRUZ MACEDO','25','05','s/n','Aparecida de Goiânia','-16.815313485','-49.34773098','Deposito','Mosquito,Ovo,Pupa','Biovech,Malathion,Pyriproxyfen',1,1,1,1,0,0,1,1,1,1,1,0,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (225,0,'Visitado','Administrador','2017-12-05 21:46:00','Jardim Dom Bosco','GERALDO OLEGARIO DA CRUZ','10','21','s/n','Aparecida de Goiânia','-16.812846495000002','-49.34390904','Casa','Larva,Mosquito','Bendiocarb,Malathion',1,0,0,0,1,1,1,1,0,0,0,1,1,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (226,0,'Visitado','Administrador','2017-12-05 21:47:00','Jardim Dom Bosco','PADRE JOSE DALLAMUTA','32','24','s/n','Aparecida de Goiânia','-16.82611685769885','-49.367151983577266','Casa','Larva,Mosquito,Ovo','Bendiocarb,Biovech,Malathion',1,1,0,0,1,1,1,1,1,0,0,1,1,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (227,0,'Visitado','Administrador','2017-12-05 21:50:00','Jardim Maranata','SANTO ANTONIO','13','17','s/n','Aparecida de Goiânia','-16.81131826563691','-49.360711348249716','Loja','Mosquito,Ovo','Biovech,Malathion',0,1,1,0,0,0,1,0,1,1,0,0,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (228,0,'Visitado','Administrador','2017-12-05 21:53:00','Jardim Maranata','CORINTO','13','02','s/n','Aparecida de Goiânia','-16.81140654','-49.36155138','Casa','Mosquito,Ovo','Biovech,Malathion',0,1,0,1,1,0,0,0,1,0,1,1,0,0,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (229,0,'Visitado','Administrador','2017-12-05 21:54:00','Jardim Maranata','MONTE SINAI','12','06','s/n','Aparecida de Goiânia','-16.811754524999998','-49.360977000000005','Deposito','Larva,Mosquito','Bendiocarb,Malathion',1,1,0,0,1,1,1,1,10,0,0,1,1,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (230,0,'Visitado','Administrador','2017-12-05 21:55:00','Jardim Maranata','TOPAZIO','14','04','s/n','Aparecida de Goiânia','-16.81189513278981','-49.3602669186691','Loja','Mosquito,Ovo','Biovech,Malathion',1,0,1,0,1,0,1,1,0,1,0,1,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (231,0,'Visitado','Administrador','2017-12-05 21:57:00','Jardim Maranata','MONTE SIAO','12','15','s/n','Aparecida de Goiânia','-16.812324495','-49.361304419999996','Casa','Larva,Mosquito','Bendiocarb,Malathion',0,1,0,0,1,1,1,0,1,0,0,1,1,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (232,0,'Visitado','Administrador','2017-12-05 21:58:00','Jardim Maranata','CANAA','15','04','s/n','Aparecida de Goiânia','-16.812055740016756','-49.359410755710854','Apartamento','Larva,Mosquito','Bendiocarb,Malathion',0,1,0,0,1,1,1,0,1,0,0,1,1,10,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (233,0,'Visitado','Administrador','2017-12-05 22:00:00','Jardim Maranata','DOS MISSIONARIOS','16','05','s/n','Aparecida de Goiânia','-16.81213149','-49.35853098','Loja','Larva,Mosquito,Ovo','Bendiocarb,Biovech,Malathion',1,1,1,1,0,0,0,1,1,1,1,0,0,0,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (234,0,'Visitado','Administrador','2017-12-05 22:02:00','Jardim Maranata','EBENEZER','16','21','s/n','Aparecida de Goiânia','-16.812358982468865','-49.35792360106466','Casa','Mosquito,Ovo','Biovech,Malathion',1,0,0,1,1,1,1,1,0,0,1,1,1,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (235,0,'Visitado','Administrador','2017-12-05 22:05:00','Jardim Maranata','PEINEL','23','20','s/n','Aparecida de Goiânia','-16.812441140127227','-49.357070176267236','Casa','Mosquito,Ovo','Biovech,Malathion',1,0,1,1,1,0,0,1,0,1,1,1,0,0,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (236,0,'Visitado','Administrador','2017-12-05 22:06:00','Jardim Maranata','PERGAMO','20','11','s/n','Aparecida de Goiânia','-16.815696975','-49.360515480000004','Casa','Larva,Mosquito','Bendiocarb,Malathion',0,1,0,0,1,1,1,0,1,0,0,1,1,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (237,0,'Visitado','Administrador','2017-12-05 22:08:00','Jardim Maranata','CRISOLITO','01','24','s/n','Aparecida de Goiânia','-16.81745786223545','-49.3646678706579','Casa','Mosquito,Ovo','Biovech,Malathion',0,1,0,1,1,1,1,0,1,0,1,1,1,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (238,0,'Visitado','Administrador','2017-12-05 22:09:00','Jardim Maranata','BOA ESPERANCA','02','05','s/n','Aparecida de Goiânia','-16.815033105101698','-49.3643276909977','Apartamento','Larva,Mosquito','Bendiocarb,Malathion',0,1,0,0,1,1,1,0,1,0,0,1,1,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (239,0,'Visitado','Administrador','2017-12-05 22:11:00','Jardim Maranata','ALFA','02','17','s/n','Aparecida de Goiânia','-16.815275430984034','-49.36360276965148','Apartamento','Larva,Mosquito','Bendiocarb,Malathion',0,1,1,0,1,1,0,1,1,1,0,1,1,0,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (240,0,'Visitado','Administrador','2017-12-05 22:13:00','Jardim Maranata','BETANIA,','04','16','s/n','Aparecida de Goiânia','-16.81347753769722','-49.362397877883915','Casa','Mosquito,Pupa','Malathion,Pyriproxyfen',1,1,0,1,1,1,0,1,1,0,1,1,1,0,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (241,0,'Visitado','Administrador','2017-12-05 22:25:00','Jardim Tiradentes','C CINQUENTA','17','08','s/n','Aparecida de Goiânia','-16.804096627080266','-49.326606197281976','Loja','Larva,Mosquito','Bendiocarb,Malathion',1,1,0,0,1,0,1,1,1,0,0,1,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (242,0,'Visitado','Administrador','2017-12-05 22:26:00','Jardim Tiradentes','QUATRO','17','01','s/n','Aparecida de Goiânia','-16.804288485','-49.3260435','Deposito','Mosquito,Ovo','Biovech,Malathion',1,1,1,1,1,0,0,1,1,1,1,1,0,0,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (243,0,'Visitado','Administrador','2017-12-05 22:31:00','Jardim Tiradentes','CINCO','17','02','s/n','Aparecida de Goiânia','-16.804433475','-49.326646499999995','Apartamento','Larva,Mosquito','Bendiocarb,Malathion',0,1,1,0,1,0,1,0,1,1,0,1,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (244,0,'Visitado','Administrador','2017-12-05 22:32:00','Jardim Tiradentes','DOIS','17','07','s/n','Aparecida de Goiânia','-16.80423498','-49.32720954','Apartamento','Larva,Mosquito','Bendiocarb,Malathion',0,1,1,0,0,1,1,0,1,1,0,0,1,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (245,0,'Visitado','Administrador','2017-12-05 22:33:00','Jardim Tiradentes','TRES','32','19','s/n','Aparecida de Goiânia','-16.804189530000002','-49.32508464','Apartamento','Larva,Mosquito,Ovo','Bendiocarb,Biovech,Malathion',0,1,1,0,0,1,0,0,1,1,0,0,1,0,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (247,0,'Visitado','Administrador','2017-12-05 22:37:00','Jardim Tiradentes','SETE','18','16','s/n','Aparecida de Goiânia','-16.804984994999998','-49.32673848','Deposito','Mosquito,Ovo,Pupa','Biovech,Malathion,Pyriproxyfen',1,1,1,0,1,1,1,1,1,1,0,1,1,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (248,0,'Visitado','Administrador','2017-12-05 22:39:00','Jardim Tiradentes','NOVE','02','01','s/n','Aparecida de Goiânia','-16.805299995','-49.32836658','Loja','Larva,Mosquito','Bendiocarb,Malathion',1,0,1,0,0,1,1,1,0,1,0,0,1,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (249,0,'Visitado','Administrador','2017-12-05 22:41:00','Jardim Tiradentes','CENTRAL OU BRASIL','02','17','s/n','Aparecida de Goiânia','-16.804941975','-49.329210419999995','Casa','Mosquito,Ovo','Biovech,Pyriproxyfen',1,1,0,1,0,0,1,1,1,0,1,0,0,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (250,0,'Visitado','Administrador','2017-12-05 22:43:00','Jardim Tiradentes','ONZE','35','09','s/n','Aparecida de Goiânia','-16.80628248','-49.32541098','Casa','Larva,Mosquito','Bendiocarb,Malathion',1,1,0,1,0,0,0,1,1,0,1,0,0,0,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (251,0,'Visitado','Administrador','2017-12-05 22:45:00','Jardim Tiradentes','B','04','02','s/n','Aparecida de Goiânia','-16.80641397','-49.328541900000005','Loja','Mosquito,Ovo','Biovech,Malathion',0,1,1,0,0,1,1,0,1,1,0,0,1,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (252,0,'Visitado','Administrador','2017-12-05 22:47:00','Jardim Tiradentes','TREZE','37','06','s/n','Aparecida de Goiânia','-16.80743052','-49.32558756','Apartamento','Larva,Mosquito','Biovech,Malathion',0,1,1,0,1,1,0,0,1,1,0,1,1,0,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (253,0,'Visitado','Administrador','2017-12-05 22:49:00','Jardim Tiradentes','QUINZE','38','02','s/n','Aparecida de Goiânia','-16.80797502','-49.325674500000005','Apartamento','Larva,Mosquito','Bendiocarb,Malathion',0,1,1,0,0,1,1,0,1,1,0,0,1,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (254,0,'Visitado','Administrador','2017-12-05 22:51:00','Jardim Tiradentes','DEZESSETE','07','02','s/n','Aparecida de Goiânia','-16.808076540000002','-49.328801999999996','Deposito','Larva,Mosquito,Ovo','Bendiocarb,Biovech,Malathion',1,1,0,1,0,1,1,1,1,0,1,0,10,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (255,0,'Visitado','Administrador','2017-12-05 22:54:00','Jardim Tiradentes','DEZENOVE','40','03','s/n','Aparecida de Goiânia','-16.809043995','-49.325850900000006','Apartamento','Larva,Mosquito','Biovech,Malathion',0,1,1,0,0,1,1,0,1,1,0,0,1,1,NULL,NULL,0,0,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (278,0,'Visitado','Bruna Nunes','2017-12-07 19:46:00','Bairro Ilda','DONA JOSEFINA LUDOVICO ALMEIDA','49','19','s/n','Aparecida de Goiânia','-16.755952004999997','-49.293153000000004','Casa','Larva,Mosquito','Biovech',1,0,1,0,1,0,1,1,0,1,0,1,0,1,0,0,3,100,0,0,0,4,NULL);
INSERT INTO `visita` VALUES (279,0,'Visitado','Bruna Nunes','2017-12-07 19:48:00','Bairro Ilda','SENADOR PEDRO LUDOVICO TEIXEIRA','56','03','s/n','Aparecida de Goiânia','-16.753129514999998','-49.29679764','Casa','Mosquito,Ovo','Biovech',1,0,1,0,0,1,1,1,0,1,0,0,1,1,0,0,2,100,0,0,0,4,NULL);
INSERT INTO `visita` VALUES (280,0,'Visitado','Bruna Nunes','2017-12-07 19:50:00','Bairro Ilda','MARCOS GUIAO','56','12','s/n','Aparecida de Goiânia','-16.753815','-49.2970356','Deposito','Larva,Mosquito','Biovech',1,0,1,0,1,0,1,1,0,2,0,1,0,2,0,0,5,100,0,0,0,6,NULL);
INSERT INTO `visita` VALUES (281,0,'Visitado','Bruna Nunes','2017-12-07 19:52:00','Bairro Ilda','DONA GERCINA BORGES TEIXEIRA','55','20','s/n','Aparecida de Goiânia','-16.753140000000002','-49.296055859999996','Loja','Larva,Mosquito','Biovech',1,0,1,0,0,1,0,1,0,1,0,0,10,0,0,0,3,100,0,0,0,6,NULL);
INSERT INTO `visita` VALUES (282,0,'Visitado','Bruna Nunes','2017-12-07 19:54:00','Bairro Ilda','DOUTOR JOSE OSVALDO DE ARAUJO','50','17','s/n','Aparecida de Goiânia','-16.753962005','-49.294106459999995','Apartamento','Larva,Mosquito','Biovech',0,1,1,0,0,1,1,0,1,1,0,0,1,2,0,0,2,100,0,0,0,5,NULL);
INSERT INTO `visita` VALUES (283,0,'Visitado','Bruna Nunes','2017-12-07 19:56:00','Papillon Park','L NOVE','18','08','s/n','Aparecida de Goiânia','-16.7841722428805','-49.267775901683706','Casa','Mosquito,Ovo','Biovech',1,0,1,0,1,0,1,1,0,1,0,1,0,1,0,0,3,0,0,0,0,4,NULL);
INSERT INTO `visita` VALUES (284,0,'Visitado','Bruna Nunes','2017-12-07 19:58:00','Bairro Ilda','DOUTOR JOSE OSVALDO DE ARAUJO','50','17','s/n','Aparecida de Goiânia','-16.754307495','-49.29411','Apartamento','Larva,Mosquito','Biovech',0,1,1,0,0,1,1,0,1,1,0,0,1,2,0,0,2,100,0,0,0,5,NULL);
INSERT INTO `visita` VALUES (285,0,'Visitado','Bruna Nunes','2017-12-07 20:00:00','Papillon Park','SENADOR ANTONIO RAMOS CAIADO','31','8','s/n','Aparecida de Goiânia','-16.785324841006386','-49.271098362547555','Casa','Larva,Mosquito','Biovech',1,1,0,1,1,1,0,1,1,0,1,1,1,0,0,0,4,100,0,0,0,5,NULL);
INSERT INTO `visita` VALUES (286,0,'Visitado','Bruna Nunes','2017-12-07 20:02:00','Papillon Park','W TRES','29','13','s/n','Aparecida de Goiânia','-16.784626995','-49.27278294','Casa','Larva,Mosquito','Biovech',1,1,1,0,1,0,0,1,1,1,0,2,0,0,0,0,2,100,0,0,0,5,NULL);
INSERT INTO `visita` VALUES (287,0,'Visitado','Bruna Nunes','2017-12-07 20:03:00','Papillon Park','L 11','04','02','s/n','Aparecida de Goiânia','-16.779568005','-49.27499298','Casa','Mosquito','Biovech',1,1,1,1,1,0,1,1,1,1,1,1,0,1,0,0,1,100,0,0,0,6,NULL);
INSERT INTO `visita` VALUES (288,0,'Visitado','Bruna Nunes','2017-12-07 20:06:00','Parque Das Nações','CURITIBA','05','01','s/n','Aparecida de Goiânia','-16.799386345451904','-49.30980951051573','Casa','Larva,Mosquito','Biovech',1,0,1,1,0,0,0,1,0,1,1,0,0,0,0,0,3,100,0,0,0,3,NULL);
INSERT INTO `visita` VALUES (289,0,'Visitado','Bruna Nunes','2017-12-07 20:09:00','Parque Das Nações','MOSCOU','03','04','s/n','Aparecida de Goiânia','-16.79789547','-49.3077699','Deposito','Larva,Mosquito','Biovech',1,1,1,1,0,1,1,1,1,1,1,0,1,2,0,0,4,100,0,0,0,7,NULL);
INSERT INTO `visita` VALUES (290,0,'Visitado','Bruna Nunes','2017-12-07 20:11:00','Parque Das Nações','BELGRADO','03','04','s/n','Aparecida de Goiânia','-16.798495','-49.30822296','Casa','Larva,Mosquito','Biovech',1,1,0,0,1,1,0,1,1,0,0,1,1,0,0,0,3,100,0,0,0,7,NULL);
INSERT INTO `visita` VALUES (291,0,'Visitado','Bruna Nunes','2017-12-07 20:13:00','Parque Das Nações','CHIPE','02','02','s/n','Aparecida de Goiânia','-16.79704397999999','-49.30611246','Deposito','Mosquito,Ovo','Malathion',1,1,1,1,0,0,1,1,1,1,1,0,0,1,0,0,4,0,0,1,0,5,NULL);
INSERT INTO `visita` VALUES (292,0,'Visitado','Bruna Nunes','2017-12-07 20:15:00','Parque Das Nações','GUATEMALA','16','02','s/n','Aparecida de Goiânia','-16.796625525','-49.3038405','Loja','Larva,Mosquito','Malathion',1,1,0,0,0,0,1,1,1,0,0,0,0,2,0,0,2,0,0,1,0,4,NULL);
INSERT INTO `visita` VALUES (293,0,'Visitado','Bruna Nunes','2017-12-07 20:30:00','Setor Central','20','s/n','s/n','1035','Goiânia','-16.671615842042474','-49.255518340768525','Sala Comercial','Larva,Mosquito','Biovech',1,0,0,0,0,1,1,1,0,0,0,0,1,10,0,0,3,100,0,0,0,3,NULL);
INSERT INTO `visita` VALUES (294,0,'Visitado','Bruna Nunes','2017-12-07 20:38:00','Setor Central','28','s/n','s/n','27','Goiânia','-16.672144937564962','-49.255744326259354','Sala Comercial','Mosquito,Ovo','Biovech',1,0,1,0,1,0,1,1,0,1,0,1,0,2,0,0,2,100,0,0,0,5,NULL);
INSERT INTO `visita` VALUES (295,0,'Visitado','Márcio Coimbra','2017-12-07 20:52:00','Setor Sul','RUA 90','s/n','s/n','401','Goiânia','-16.69231500478365','-49.252594472149504','Apartamento','Larva,Mosquito','Biovech,Malathion',0,0,1,0,1,0,0,0,0,3,0,2,0,0,15,19,5,140,0,1,0,5,NULL);
INSERT INTO `visita` VALUES (296,0,'Visitado','Márcio Coimbra','2017-12-07 20:55:00','Setor Sul','Rua 107','s/n','s','299','Goiânia','-16.69013356399135','-49.25181408524227','Casa','Larva','Biovech',1,0,0,1,1,0,0,1,0,0,2,2,0,0,21,22,1,210,0,0,0,5,NULL);
INSERT INTO `visita` VALUES (297,0,'Visitado','Márcio Coimbra','2017-12-07 20:57:00','Setor Sul','RUA 88 A','s/n','s/n','32','Goiânia','-16.691699296978','-49.25136518926465','Casa','Larva,Pupa','Biovech,Pyriproxyfen',1,1,1,1,1,0,0,1,2,1,1,1,0,0,0,0,0,100,50,0,0,6,NULL);
INSERT INTO `visita` VALUES (298,0,'Visitado','Bruna Nunes','2017-12-07 20:59:00','Setor Central','ARAGUAIA,','s/n','s/n','66','Goiânia','-16.673207728497513','-49.25463378230995','Sala Comercial','Larva,Mosquito','Biovech',1,1,1,0,0,0,1,1,1,1,0,0,0,1,0,0,3,100,0,0,0,5,NULL);
INSERT INTO `visita` VALUES (299,0,'Visitado','Bruna Nunes','2017-12-07 21:01:00','Setor Central','ANHANGUERA','s/n','s/n','4740','Goiânia','-16.6740621379272','-49.255622658433495','Sala Comercial','Larva,Mosquito','Biovech',1,1,0,0,1,1,0,1,1,0,0,1,1,0,0,0,3,100,0,0,0,4,NULL);
INSERT INTO `visita` VALUES (300,0,'Visitado','Márcio Coimbra','2017-12-07 21:03:00','Setor Sul','RUA 123','s/n','s/n','121','Goiânia','-16.691504111895213','-49.25217616380585','Casa','Ovo,Pupa','Biovech',1,0,0,1,1,1,1,1,0,0,2,2,1,1,31,33,2,350,0,0,0,7,NULL);
INSERT INTO `visita` VALUES (301,0,'Visitado','Bruna Nunes','2017-12-07 21:03:00','Setor Central','17','s/n','s/n','63','Goiânia','-16.67398041024175','-49.25702646626995','Sala Comercial','Mosquito,Ovo','Biovech',1,0,1,0,0,1,1,1,0,1,0,0,10,1,0,0,2,100,0,0,0,4,NULL);
INSERT INTO `visita` VALUES (302,0,'Visitado','Márcio Coimbra','2017-12-07 21:05:00','Setor Sul','Rua 84','s/n','s/n','715','Goiânia','-16.68873862133575','-49.25370153935235','Casa','Larva','Biovech',1,1,1,1,0,0,1,1,2,1,1,0,0,3,0,0,0,100,0,0,0,8,NULL);
INSERT INTO `visita` VALUES (303,0,'Visitado','Bruna Nunes','2017-12-07 21:06:00','Setor Oeste','6','s/n','s/n','499','Goiânia','16.68384257813485','-49.2674191078588','Apartamento','Larva,Mosquito','Biovech',0,0,1,0,1,0,1,0,0,1,0,1,0,1,0,0,3,100,0,0,0,3,NULL);
INSERT INTO `visita` VALUES (304,0,'Visitado','Márcio Coimbra','2017-12-07 21:08:00','Setor Sul','RUA DOUTOR OLINTO MANSO PEREIRA','s/n','s/n','459','Goiânia','-16.683295499656452','-49.25279480846888','Casa','Larva,Ovo,Pupa','Pyriproxyfen',1,0,1,1,1,0,0,1,0,2,2,2,0,0,47,49,2,0,200,0,0,7,NULL);
INSERT INTO `visita` VALUES (305,0,'Visitado','Bruna Nunes','2017-12-07 21:08:00','Setor Oeste','7','s/n','s/n','656','Goiânia','-16.68415263428095','-49.26680446533785','Apartamento','Mosquito,Ovo','Biovech',0,1,0,0,1,1,1,0,1,0,0,1,1,10,0,0,2,100,0,0,0,4,NULL);
INSERT INTO `visita` VALUES (306,0,'Visitado','Bruna Nunes','2017-12-07 21:10:00','Setor Oeste','8','s/n','s/n','536','Goiânia','-16.6847225017005','-49.26712751435575','Apartamento','Larva,Mosquito','Biovech',0,0,1,0,0,1,1,0,0,1,0,0,1,1,0,0,2,100,0,0,0,0,NULL);
INSERT INTO `visita` VALUES (307,0,'Visitado','Bruna Nunes','2017-12-07 21:11:00','Setor Oeste','9','s/n','s/n','663','Goiânia','-16.6844124455544','-49.2677421568767','Apartamento','Larva,Mosquito','Biovech',0,0,1,1,1,1,0,0,0,1,1,1,1,0,0,0,4,100,0,0,0,4,NULL);
INSERT INTO `visita` VALUES (308,0,'Visitado','Bruna Nunes','2017-12-07 21:12:00','Setor Oeste','3','s/n','s/n','572','Goiânia','-16.6832537834856','-49.26381598374729','Apartamento','Mosquito,Ovo','Biovech',0,1,0,0,1,1,1,0,1,0,0,1,1,1,0,0,3,100,0,0,0,4,NULL);
INSERT INTO `visita` VALUES (309,0,'Visitado','Bruna Nunes','2017-12-07 21:14:00','Setor Oeste','ASSIS CHATEUBRIAND','s/n','s/n','500','Goiânia','-16.6847206334466','-49.26386708723565','Sala Comercial','Larva,Mosquito','Biovech',1,1,1,0,0,1,1,1,1,1,0,0,1,1,0,0,2,100,0,0,0,5,NULL);
INSERT INTO `visita` VALUES (310,0,'Visitado','Bruna Nunes','2017-12-07 21:19:00','Setor Pedro Ludovico','CIRCULAR','s/n','s/n','1117','Goiânia','-16.712224784181','-49.25186060251908','Apartamento','Larva,Mosquito,Ovo','Biovech',0,1,1,0,1,1,0,0,1,1,0,1,1,0,0,0,5,100,0,0,0,4,NULL);
INSERT INTO `visita` VALUES (311,0,'Visitado','Bruna Nunes','2017-12-07 21:22:00','Setor Pedro Ludovico','RUA 2A RADIAL','s/n','s/n','77','Goiânia','16.713495864681853','-49.25134841044415','Sala Comercial','Larva,Mosquito','Biovech',1,1,1,0,1,1,1,1,1,1,0,1,1,1,0,0,3,0,0,0,0,6,NULL);
INSERT INTO `visita` VALUES (312,0,'Visitado','Bruna Nunes','2017-12-07 21:25:00','Setor Pedro Ludovico','AVENIDA 2A RADIAL','s/n','s/n','84','Goiânia','-16.713660194904648','-49.25128539386485','Apartamento','Larva,Mosquito','Biovech',0,1,0,0,1,0,1,0,1,0,0,1,0,10,0,0,2,0,0,0,0,3,NULL);
INSERT INTO `visita` VALUES (313,0,'Visitado','Bruna Nunes','2017-12-07 21:27:00','Setor Pedro Ludovico','AVENIDA ALFREDO LOPES MORAIS','s/n','s/n','30','Goiânia','-16.715312441374987','-49.25025649813442','Loja','Mosquito,Ovo','Biovech',1,1,1,0,1,1,1,1,1,1,0,1,1,1,0,0,3,100,0,0,0,6,NULL);
INSERT INTO `visita` VALUES (314,0,'Visitado','Bruna Nunes','2017-12-07 21:29:00','Setor Pedro Ludovico','AVENIDA 1015','s/n','s/n','1068','Goiânia','-16.716283530825525','-49.2502476475363','Casa','Larva,Mosquito','Biovech',1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,4,100,0,0,0,7,NULL);
INSERT INTO `visita` VALUES (315,0,'Visitado','Bruna Nunes','2017-12-07 21:31:00','Setor Pedro Ludovico','AVENIDA 3A RADIAL','117','18','S/N','Goiânia','-16.7151816545947','49.2522263518522','Sala Comercial','Larva,Mosquito','Biovech',1,1,0,0,1,1,1,1,1,0,0,1,1,1,0,0,3,100,0,0,0,5,NULL);
INSERT INTO `visita` VALUES (316,0,'Visitado','Bruna Nunes','2017-12-07 21:34:00','Setor Pedro Ludovico','RUA 1064 A','127','32','S/N','Goiânia','-16.715869516045913','-49.25073730402913','Casa','Mosquito,Ovo','Biovech',1,1,0,1,1,0,0,1,11,0,1,1,0,0,0,0,3,0,0,0,0,4,NULL);
INSERT INTO `visita` VALUES (317,0,'Visitado','Bruna Nunes','2017-12-07 21:37:00','Parque Amazonia','RUA BEIJUACU','172','2','S/N','Goiânia','-16.730049158560966','-49.27371890933143','Casa','Larva,Mosquito','Biovech',1,0,1,1,1,0,0,1,0,1,1,1,0,0,0,0,3,100,0,0,0,4,NULL);
INSERT INTO `visita` VALUES (318,0,'Visitado','Bruna Nunes','2017-12-07 21:39:00','Parque Amazonia','RUA ANHANGA','172','19','S/N','Goiânia','-16.729835429239905','-49.27438595002169','Casa','Mosquito,Ovo','Biovech',1,1,1,1,1,0,0,1,1,1,1,1,0,0,0,0,4,100,0,0,0,5,NULL);
INSERT INTO `visita` VALUES (319,0,'Visitado','Bruna Nunes','2017-12-07 21:40:00','Parque Amazonia','AVENIDA JOSE RODRIGUES DE MORAIS NETO','s/n','s/n','1776','Goiânia','-16.730965182559018','-49.274623124416514','Sala Comercial','Larva,Mosquito','Malathion',1,1,0,0,1,1,0,1,1,0,0,1,1,0,0,0,3,0,0,1,0,4,NULL);
INSERT INTO `visita` VALUES (321,0,'Visitado','Bruna Nunes','2017-12-07 21:42:00','Parque Amazonia','RUA HARPIA','178','14','S/N','Goiânia','-16.730944857169884','-49.2759726810425','Casa','Mosquito,Ovo','Malathion',1,1,0,1,0,0,0,1,1,0,10,0,0,0,0,0,2,0,0,1,0,3,NULL);
INSERT INTO `visita` VALUES (322,0,'Visitado','Bruna Nunes','2017-12-07 21:44:00','Parque Amazonia','RUA TAUA','182','12','S/N','Goiânia','-16.730438746045476','-49.276438530257586','Casa','Larva,Mosquito','Malathion',1,1,1,0,0,0,0,1,1,1,0,0,0,0,0,0,1,0,0,1,0,3,NULL);
INSERT INTO `visita` VALUES (323,0,'Visitado','Bruna Nunes','2017-12-07 21:51:00','Chacara Do Governador',' AVENIDA PROFESSOR ALFREDO DE CASTRO','s/n','s/n','907','Goiânia','-16.73028957017265','-49.2215984882693','Loja','Larva,Mosquito','Biovech',0,1,0,0,1,1,1,0,1,0,0,1,1,1,0,0,4,100,0,0,0,4,NULL);
INSERT INTO `visita` VALUES (324,0,'Visitado','Bruna Nunes','2017-12-07 22:01:00','Chacara Do Governador','RUA DOM FERNANDO','RB','3','S/N','Goiânia','-16.727921926005','-49.22072940752315','Casa','Larva,Mosquito','Biovech',1,1,1,0,0,0,0,1,1,1,0,0,0,0,0,0,4,100,0,0,0,3,'');
INSERT INTO `visita` VALUES (325,22,'Fechado','Administrador','2017-12-07 22:02:00','Setor Sul','Rua 108','s/n','s/n','104','Goiânia','-16.69015788825886','-49.251052915007634','Casa','Não Encontrado','Não Encontrado',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');
INSERT INTO `visita` VALUES (326,22,'Recusado','Administrador','2017-12-07 22:02:00','Setor Sul','Rua 108','s/n','s/n','104','Goiânia','-16.69015788825886','-49.251052915007634','Casa','Não Encontrado','Não Encontrado',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');
INSERT INTO `visita` VALUES (327,0,'Visitado','Bruna Nunes','2017-12-07 22:09:00','Chacara Do Governador','RUA DF17','RB','11','S/N','Goiânia','-16.728404889123','-49.220649546717','Casa','Não Encontrado','Não Encontrado',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');
INSERT INTO `visita` VALUES (328,22,'Fechado','Administrador','2017-12-07 22:03:00','Setor Sul','Rua 108','s/n','s/n','104','Goiânia','-16.69015788825886','-49.251052915007634','Casa','Não Encontrado','Não Encontrado',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');
INSERT INTO `visita` VALUES (329,22,'Visitado','Administrador','2017-12-07 22:04:00','Setor Sul','Rua 108','s/n','s/n','104','Goiânia','-16.69015788825886','-49.251052915007634','Casa','Larva,Ovo','Biovech',1,0,1,1,1,0,0,1,0,5,3,3,0,0,21,23,2,150,0,0,0,12,'');
INSERT INTO `visita` VALUES (330,0,'Visitado','Bruna Nunes','2017-12-07 22:05:00','Chacara Do Governador','RUA DF9 ','s/n','s/n','18','Goiânia','16.7258796409079','-49.21972513252635','Casa','Mosquito,Ovo','Biovech',1,1,0,1,1,1,0,1,1,0,1,1,1,0,0,0,5,100,0,0,0,0,'');
INSERT INTO `visita` VALUES (331,0,'Visitado','Bruna Nunes','2017-12-07 22:07:00','Chacara Do Governador','RUA DF23','RK','12','S/N','Goiânia','-16.72852383350825','-49.2191963710086','Casa','Mosquito,Ovo','Malathion',1,1,0,1,1,1,1,1,1,0,1,1,1,1,0,0,5,0,0,1,0,6,'');
INSERT INTO `visita` VALUES (332,22,'Fechado','Administrador','2017-12-07 22:07:00','Setor Sul','Rua 108','s/n','s/n','104','Goiânia','-16.668933028857346','-49.262193345366','Casa','Não Encontrado','Não Encontrado',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');
INSERT INTO `visita` VALUES (333,23,'Visitado','Administrador','2017-12-07 22:08:00','Setor Central','RUA 74','s/n','s/n','245','Goiânia','-16.668933028857346','-49.262193345366','Casa','Não Encontrado','Não Encontrado',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');
INSERT INTO `visita` VALUES (334,0,'Visitado','Bruna Nunes','2017-12-07 22:08:00','Chacara Do Governador','RUA DF23','RJ','14','S/N','Goiânia','-16.72847802897195','-49.219230800269955','Casa','Larva,Mosquito','Biovech',1,1,1,1,1,0,0,1,1,1,1,1,0,0,0,0,3,100,0,0,0,0,'');
INSERT INTO `visita` VALUES (335,24,'Fechado','Administrador','2017-12-07 22:14:00','Vila Itatiaia','Rua 21','s/n','s/n','61','Goiânia',' -16.599581',' -49.25874920000001','Casa','Não Encontrado','Não Encontrado',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');
INSERT INTO `visita` VALUES (336,24,'Recusado','Administrador','2017-12-07 22:15:00','Vila Itatiaia','Rua 21','s/n','s/n','61','Goiânia','-16.599581','-49.25874920000001','Casa','Não Encontrado','Não Encontrado',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');
INSERT INTO `visita` VALUES (337,24,'Visitado','Administrador','2017-12-07 22:16:00','Vila Itatiaia','Rua 21','s/n','s/n','61','Goiânia','-16.599581','-49.25874920000001','Casa','Não Encontrado','Não Encontrado',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'');
/*!40000 ALTER TABLE `visita` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-07 23:36:21
