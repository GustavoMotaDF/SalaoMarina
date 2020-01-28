-- MySQL dump 10.16  Distrib 10.1.41-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: salaomarina
-- ------------------------------------------------------
-- Server version	10.1.41-MariaDB-0+deb9u1

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
-- Table structure for table `SITE_tb_mensagens`
--

DROP TABLE IF EXISTS `SITE_tb_mensagens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SITE_tb_mensagens` (
  `id_mensagem` int(11) NOT NULL AUTO_INCREMENT,
  `cliente` varchar(50) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `mensagem` longtext NOT NULL,
  `data` date NOT NULL,
  `lida` int(2) NOT NULL,
  `datalida` date DEFAULT NULL,
  PRIMARY KEY (`id_mensagem`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SITE_tb_mensagens`
--

LOCK TABLES `SITE_tb_mensagens` WRITE;
/*!40000 ALTER TABLE `SITE_tb_mensagens` DISABLE KEYS */;
INSERT INTO `SITE_tb_mensagens` VALUES (1,'Gustavo','6191452045','ghenrique156@gmail.com','Testando BD, celular ','2020-01-09',1,'2020-01-09'),(2,'Barbara ','61751111111','barbara@gmail.com','Olá, Marina!  Gostaria de saber quais os dias disponíveis na próxima semana.  Tenho preferencia por segunda ou sexta.','2020-01-10',1,'2020-01-14'),(3,'Guilherme','61986213410','gustavo@teste.com','Testando persistência do banco de dados / 2 ','2020-01-14',1,'2020-01-15');
/*!40000 ALTER TABLE `SITE_tb_mensagens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_agendamento`
--

DROP TABLE IF EXISTS `tb_agendamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_agendamento` (
  `idagendamento` int(11) NOT NULL AUTO_INCREMENT,
  `data_agendamento` datetime NOT NULL,
  `data_hora_ult_mov` datetime(6) DEFAULT NULL,
  `descricao_agendamento` varchar(255) DEFAULT NULL,
  `hora_agendamento` varchar(15) NOT NULL,
  `concluido` int(1) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  PRIMARY KEY (`idagendamento`),
  KEY `FKec28uck4rybcn9s26mrvxirp0` (`id_cliente`),
  CONSTRAINT `FKec28uck4rybcn9s26mrvxirp0` FOREIGN KEY (`id_cliente`) REFERENCES `tb_cliente` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_agendamento`
--

LOCK TABLES `tb_agendamento` WRITE;
/*!40000 ALTER TABLE `tb_agendamento` DISABLE KEYS */;
INSERT INTO `tb_agendamento` VALUES (1,'2020-01-25 00:00:00','2020-01-26 17:53:33.000000','Sobrancelha','08:00hrs',1,1);
/*!40000 ALTER TABLE `tb_agendamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cliente`
--

DROP TABLE IF EXISTS `tb_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_cliente` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `instagram` varchar(20) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `nome_cliente` varchar(100) NOT NULL,
  `telefone` varchar(11) NOT NULL,
  `postarfotos` varchar(5) DEFAULT NULL,
  `ativo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cliente`
--

LOCK TABLES `tb_cliente` WRITE;
/*!40000 ALTER TABLE `tb_cliente` DISABLE KEYS */;
INSERT INTO `tb_cliente` VALUES (1,'@gustavohenrique_m_s','Valparaiso, Anhanguera C, quadra 18, chacará 02, condominio Edson moraes, casa 13','Gustavo Henrique Mota Silva','61986213410','Sim',1),(4,'@marinaBeztriz','Riacho fundo 2','Marina Beatriz Mota silva','61999999999','Sim',1),(5,'@marinaIldonete','Valparaíso  ','Maria Ildonete Mota Brito','61991662671','Sim',1),(6,'@leandroVinicius','Ocidental','Leandro Vinicius Mota silva','61991452045','Sim',1),(7,'@tatianaBezerra','Ocidental','Tatiana Bezerra','61999999991','Sim',1),(8,'@joaoRangel','Riacho fundo 2','Joao Rangel','61999999992','Sim',1),(9,'@AliceVieira','Céu','Maria Alice','99999999999','Sim',1),(10,'@joaoGuilherme','Riacho fundo 2','joao guilherne','00000000001','Nao',1),(11,'@severino','Santa Maria','Severino','61999999912','Sim',1),(13,'','','TesteAtivo','71111111111','Sim',0);
/*!40000 ALTER TABLE `tb_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_funcionario`
--

DROP TABLE IF EXISTS `tb_funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_funcionario` (
  `id_funcionario` int(11) NOT NULL AUTO_INCREMENT,
  `acesso` int(1) NOT NULL,
  `nome` varchar(10) NOT NULL,
  `senha` varchar(5) NOT NULL,
  `ativo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_funcionario`),
  UNIQUE KEY `nome_UNIQUE` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_funcionario`
--

LOCK TABLES `tb_funcionario` WRITE;
/*!40000 ALTER TABLE `tb_funcionario` DISABLE KEYS */;
INSERT INTO `tb_funcionario` VALUES (1,3,'Admin','admin',1),(4,1,'Default','Defau',1),(10,3,'Marina','1234',1),(11,2,'Gustavo','1234',1),(12,1,'Guilherme','1234',1),(13,3,'Guilhermet','1234',0),(14,1,'Vinicius','1234',1);
/*!40000 ALTER TABLE `tb_funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_menu`
--

DROP TABLE IF EXISTS `tb_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_menu` (
  `id_menu` int(11) NOT NULL AUTO_INCREMENT,
  `link` varchar(255) NOT NULL,
  `nivel_acesso` int(11) NOT NULL,
  `nome` varchar(15) NOT NULL,
  PRIMARY KEY (`id_menu`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_menu`
--

LOCK TABLES `tb_menu` WRITE;
/*!40000 ALTER TABLE `tb_menu` DISABLE KEYS */;
INSERT INTO `tb_menu` VALUES (1,'/SalaoMarina/Inicio',1,'Inicio'),(2,'/SalaoMarina/agendar',2,'Agenda'),(3,'/SalaoMarina/venda',1,'Caixa'),(4,'/SalaoMarina/cadcliente',2,'Clientes'),(5,'/SalaoMarina/CadFuncionario',3,'Funcionarios'),(6,'/SalaoMarina/Mensagens',1,'Mensagens'),(7,'/SalaoMarina/cadservico',2,'Serviços'),(8,'jsp/includes/sessao.jsp',1,'Sair');
/*!40000 ALTER TABLE `tb_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_servico`
--

DROP TABLE IF EXISTS `tb_servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_servico` (
  `id_servico` int(11) NOT NULL AUTO_INCREMENT,
  `data_hora_ult_mov` datetime(6) NOT NULL,
  `servico` varchar(255) NOT NULL,
  `valor` double NOT NULL,
  `ativo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_servico`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_servico`
--

LOCK TABLES `tb_servico` WRITE;
/*!40000 ALTER TABLE `tb_servico` DISABLE KEYS */;
INSERT INTO `tb_servico` VALUES (2,'2019-12-14 23:21:30.000000','Sobrancelha simples',150,1),(3,'2019-12-14 22:47:01.000000','Sobrancelha Complexa',200,1),(4,'2019-12-14 22:47:20.000000','Sobrancelha Retorno',20,1),(5,'2020-01-01 03:05:50.000000','Volume Russo',120,1);
/*!40000 ALTER TABLE `tb_servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_venda`
--

DROP TABLE IF EXISTS `tb_venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_venda` (
  `idvenda` int(11) NOT NULL AUTO_INCREMENT,
  `data_venda` datetime NOT NULL,
  `formato_da_venda` varchar(15) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_servico` int(11) NOT NULL,
  PRIMARY KEY (`idvenda`),
  KEY `FKcmahsewdjwne1l78pkqjw0m1r` (`id_servico`),
  KEY `FKpxrksoud9jqdd9dl319rcc243` (`id_cliente`),
  CONSTRAINT `FKcmahsewdjwne1l78pkqjw0m1r` FOREIGN KEY (`id_servico`) REFERENCES `tb_servico` (`id_servico`),
  CONSTRAINT `FKpxrksoud9jqdd9dl319rcc243` FOREIGN KEY (`id_cliente`) REFERENCES `tb_cliente` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_venda`
--

LOCK TABLES `tb_venda` WRITE;
/*!40000 ALTER TABLE `tb_venda` DISABLE KEYS */;
INSERT INTO `tb_venda` VALUES (1,'2020-01-05 00:00:00','Dinheiro',1,2),(2,'2020-01-05 00:00:00','Debito',9,2),(3,'2020-01-25 00:00:00','Dinheiro',1,5);
/*!40000 ALTER TABLE `tb_venda` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-27 22:09:40
