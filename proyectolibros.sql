-- MySQL dump 10.13  Distrib 8.0.23, for Linux (x86_64)
--
-- Host: localhost    Database: proyectolibros
-- ------------------------------------------------------
-- Server version	8.0.23-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (3,'clientes'),(1,'gestion_libreria'),(2,'venta_libros');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (10,1,29),(11,1,30),(12,1,31),(5,1,32),(6,1,33),(7,1,34),(8,1,35),(9,1,36),(2,2,25),(4,2,28),(1,2,32),(3,2,36);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add venta',7,'add_venta'),(26,'Can change venta',7,'change_venta'),(27,'Can delete venta',7,'delete_venta'),(28,'Can view venta',7,'view_venta'),(29,'Can add libro',8,'add_libro'),(30,'Can change libro',8,'change_libro'),(31,'Can delete libro',8,'delete_libro'),(32,'Can view libro',8,'view_libro'),(33,'Can add cliente',9,'add_cliente'),(34,'Can change cliente',9,'change_cliente'),(35,'Can delete cliente',9,'delete_cliente'),(36,'Can view cliente',9,'view_cliente');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$216000$5h3A901KyTPP$b9/fCog97kvM4O5inUFDQkUQA7MXt7SjEXjTfVoxUw0=','2021-02-28 01:33:20.013100',1,'jaimepaqui','','','jaime.paqui@unl.edu.ec',1,1,'2021-02-25 03:56:58.000000'),(2,'pbkdf2_sha256$216000$87g2eTnjEzG3$fOXZKPdM77exhWKiVuUXMJU+/848A405gKmykBInUpA=',NULL,0,'1900823236','Jaime Oswaldo','Paqui Medina','jaispaqui@gmail.com',0,1,'2021-02-25 04:10:18.793198'),(3,'pbkdf2_sha256$216000$aGSdDMLyXSDR$acNLDA4CVYJ+bow0ldOwZxuHyNDcATNwUwLS0OX1H00=',NULL,0,'1150698478','Jessyca Jhoana','Guazha Plasencia','jessica@unl.edu.ec',0,1,'2021-02-25 04:20:00.773341'),(4,'pbkdf2_sha256$216000$yGBMj0GEN23Y$YokKbHThhYpbVWjf34VHKCOUyEROE7iV4AZ1MJHdiTo=',NULL,0,'1900847563','Alexis','Armijos','alexis@unl.edu.ec',0,1,'2021-02-28 00:06:02.644314');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (1,1,1),(2,1,2),(3,2,3),(4,3,3),(5,4,3);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-02-25 03:59:28.519031','1','gestion_libreria',1,'[{\"added\": {}}]',3,1),(2,'2021-02-25 03:59:37.961770','2','venta_libros',1,'[{\"added\": {}}]',3,1),(3,'2021-02-25 03:59:58.150843','3','clientes',1,'[{\"added\": {}}]',3,1),(4,'2021-02-25 04:00:34.195276','1','jaimepaqui',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(5,'2021-02-25 04:02:35.943090','2','venta_libros',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',3,1),(6,'2021-02-25 04:03:22.395465','1','gestion_libreria',2,'[]',3,1),(7,'2021-02-25 04:08:22.279414','1','gestion_libreria',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',3,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(9,'modelo','cliente'),(8,'modelo','libro'),(7,'modelo','venta'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-02-25 03:49:06.984243'),(2,'auth','0001_initial','2021-02-25 03:49:11.619843'),(3,'admin','0001_initial','2021-02-25 03:49:30.710657'),(4,'admin','0002_logentry_remove_auto_add','2021-02-25 03:49:35.817016'),(5,'admin','0003_logentry_add_action_flag_choices','2021-02-25 03:49:36.026977'),(6,'contenttypes','0002_remove_content_type_name','2021-02-25 03:49:39.555180'),(7,'auth','0002_alter_permission_name_max_length','2021-02-25 03:49:41.549066'),(8,'auth','0003_alter_user_email_max_length','2021-02-25 03:49:41.828138'),(9,'auth','0004_alter_user_username_opts','2021-02-25 03:49:41.949876'),(10,'auth','0005_alter_user_last_login_null','2021-02-25 03:49:43.792376'),(11,'auth','0006_require_contenttypes_0002','2021-02-25 03:49:43.886486'),(12,'auth','0007_alter_validators_add_error_messages','2021-02-25 03:49:43.997534'),(13,'auth','0008_alter_user_username_max_length','2021-02-25 03:49:45.831978'),(14,'auth','0009_alter_user_last_name_max_length','2021-02-25 03:49:49.373945'),(15,'auth','0010_alter_group_name_max_length','2021-02-25 03:49:50.192266'),(16,'auth','0011_update_proxy_permissions','2021-02-25 03:49:50.436977'),(17,'auth','0012_alter_user_first_name_max_length','2021-02-25 03:49:53.980472'),(18,'sessions','0001_initial','2021-02-25 03:49:55.019955'),(19,'modelo','0001_initial','2021-02-25 03:50:25.946730');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('9sc8bi7k1o14rja5lnvst5p0389n7gwv','.eJxVjMEOwiAQBf-FsyFAFwoevfcbyMKCVA0kpT0Z_9026UGvM_Pem3nc1uK3nhY_E7syyS6_LGB8pnoIemC9Nx5bXZc58CPhp-18apRet7P9OyjYy74eKQYg7QRKIcEmsMq5hACjFQ4VaCQblBGDyAlxp2RMpjw4LUkZUOzzBdA7N0c:1lF7vJ:W5xyjQpZYQiFnF9Atdh5XFWFqj-BZ-uKnmdhDCHuV9M','2021-03-11 04:06:45.174507'),('goo8qwr42cctg9ji885rtmppvlgh8xiz','.eJxVjMEOwiAQBf-FsyFAFwoevfcbyMKCVA0kpT0Z_9026UGvM_Pem3nc1uK3nhY_E7syyS6_LGB8pnoIemC9Nx5bXZc58CPhp-18apRet7P9OyjYy74eKQYg7QRKIcEmsMq5hACjFQ4VaCQblBGDyAlxp2RMpjw4LUkZUOzzBdA7N0c:1lF94R:O0URxKXCBun1qp-zBmYI4IhTVIqijg3M8pLLGOQcaAs','2021-03-11 05:20:15.134746'),('qikayp1b73sq6p8059uwxtrcrjcpktih','.eJxVjMEOwiAQBf-FsyFAFwoevfcbyMKCVA0kpT0Z_9026UGvM_Pem3nc1uK3nhY_E7syyS6_LGB8pnoIemC9Nx5bXZc58CPhp-18apRet7P9OyjYy74eKQYg7QRKIcEmsMq5hACjFQ4VaCQblBGDyAlxp2RMpjw4LUkZUOzzBdA7N0c:1lF7ma:2WCbt7wO7sdctE88L7kPCRsZQjVkGT6xYgHGwJrUUPc','2021-03-11 03:57:44.943963');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modelo_cliente`
--

DROP TABLE IF EXISTS `modelo_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modelo_cliente` (
  `cliente_id` int NOT NULL AUTO_INCREMENT,
  `cedula` varchar(10) NOT NULL,
  `nombres` varchar(70) NOT NULL,
  `apellidos` varchar(70) NOT NULL,
  `genero` varchar(30) NOT NULL,
  `correo` varchar(105) NOT NULL,
  `celular` varchar(15) NOT NULL,
  `direccion` longtext NOT NULL,
  `date_created` datetime(6) NOT NULL,
  PRIMARY KEY (`cliente_id`),
  UNIQUE KEY `cedula` (`cedula`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelo_cliente`
--

LOCK TABLES `modelo_cliente` WRITE;
/*!40000 ALTER TABLE `modelo_cliente` DISABLE KEYS */;
INSERT INTO `modelo_cliente` VALUES (1,'1900823236','Jaime Oswaldo','Paqui Medina','masculino','jaispaqui@gmail.com','0986542760','Zamora','2021-02-25 04:10:18.634877'),(2,'1150698478','Jessyca Jhoana','Guazha Plasencia','femenino','jessica@unl.edu.ec','0986545376','Loja','2021-02-25 04:20:00.607177'),(3,'1900847563','Alexis','Armijos','masculino','alexis@unl.edu.ec','0986498320','Yantzaza','2021-02-28 00:06:02.471675');
/*!40000 ALTER TABLE `modelo_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modelo_libro`
--

DROP TABLE IF EXISTS `modelo_libro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modelo_libro` (
  `libro_id` int NOT NULL AUTO_INCREMENT,
  `isbn` varchar(70) NOT NULL,
  `nombre` varchar(70) NOT NULL,
  `tipo` varchar(30) NOT NULL,
  `autor` varchar(70) NOT NULL,
  `idioma` varchar(70) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int NOT NULL,
  `date_created` datetime(6) NOT NULL,
  PRIMARY KEY (`libro_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelo_libro`
--

LOCK TABLES `modelo_libro` WRITE;
/*!40000 ALTER TABLE `modelo_libro` DISABLE KEYS */;
INSERT INTO `modelo_libro` VALUES (1,'0-7645-2641-3','Vestidas para un baile en la nieve','revista','Monika Zgustova','English',50.00,70,'2021-02-25 04:14:33.286740'),(3,'12-453-678-34','El Escorpion','literatura','Homero','Espanol',45.00,65,'2021-02-25 16:29:53.347444'),(4,'145-78-876-90','Decamerón','novelas','Giovanni Boccaccio','English',34.00,100,'2021-02-28 00:01:48.260185'),(5,'564-785-898-8','Ficciones','literatura','Jorge Luis Borges','Espanol',13.00,25,'2021-02-28 00:02:42.796109'),(6,'98-673-896-09','Cumbres Borrascosas','revista','Emily Brontë','English',60.00,50,'2021-02-28 00:03:48.123074'),(7,'09-78-654-78','El extranjero','novelas','Albert Camus','English',44.00,19,'2021-02-28 00:04:41.299778');
/*!40000 ALTER TABLE `modelo_libro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modelo_venta`
--

DROP TABLE IF EXISTS `modelo_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modelo_venta` (
  `venta_id` int NOT NULL AUTO_INCREMENT,
  `fecha` datetime(6) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `descripcion` longtext NOT NULL,
  `cantlibros` int NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `updated_ad` datetime(6) NOT NULL,
  `cliente_id` int NOT NULL,
  `libr_id` int NOT NULL,
  PRIMARY KEY (`venta_id`),
  KEY `modelo_venta_cliente_id_1579afc4_fk_modelo_cliente_cliente_id` (`cliente_id`),
  KEY `modelo_venta_libr_id_6724434f_fk_modelo_libro_libro_id` (`libr_id`),
  CONSTRAINT `modelo_venta_cliente_id_1579afc4_fk_modelo_cliente_cliente_id` FOREIGN KEY (`cliente_id`) REFERENCES `modelo_cliente` (`cliente_id`),
  CONSTRAINT `modelo_venta_libr_id_6724434f_fk_modelo_libro_libro_id` FOREIGN KEY (`libr_id`) REFERENCES `modelo_libro` (`libro_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelo_venta`
--

LOCK TABLES `modelo_venta` WRITE;
/*!40000 ALTER TABLE `modelo_venta` DISABLE KEYS */;
INSERT INTO `modelo_venta` VALUES (1,'2021-02-27 23:48:31.128616',600.00,'lfoegk',12,'2021-02-27 23:48:31.128710','2021-02-27 23:48:31.128728',1,1),(2,'2021-02-27 23:56:23.676228',45.00,'tarjeta',1,'2021-02-27 23:56:23.676357','2021-02-27 23:56:23.676387',1,3),(3,'2021-02-27 23:56:45.237780',45.00,'tarjeta',1,'2021-02-27 23:56:45.237944','2021-02-27 23:56:45.237978',2,3),(4,'2021-02-27 23:57:14.819494',45.00,'efectivo',1,'2021-02-27 23:57:14.819607','2021-02-27 23:57:14.819634',1,3),(5,'2021-02-27 23:57:29.433257',45.00,'Tarjeta',1,'2021-02-27 23:57:29.433438','2021-02-27 23:57:29.433493',1,3),(6,'2021-02-28 00:08:43.250122',50.00,'Compra',1,'2021-02-28 00:08:43.250227','2021-02-28 00:08:43.250244',3,1),(7,'2021-02-28 00:10:14.686685',50.00,'Tarjeta',1,'2021-02-28 00:10:14.687574','2021-02-28 00:10:14.687944',3,1),(8,'2021-02-28 00:10:26.483865',45.00,'Tarjeta',1,'2021-02-28 00:10:26.483949','2021-02-28 00:10:26.483967',3,3),(9,'2021-02-28 00:11:12.038885',44.00,'Efectivo',1,'2021-02-28 00:11:12.038988','2021-02-28 00:11:12.039006',3,7),(10,'2021-02-28 00:13:33.020032',100.00,'Negocio',2,'2021-02-28 00:13:33.020199','2021-02-28 00:13:33.020238',3,1),(11,'2021-02-28 00:17:08.879472',500.00,'Negocio',10,'2021-02-28 00:17:08.879733','2021-02-28 00:17:08.879789',1,1),(12,'2021-01-28 15:42:30.000000',450.00,'Negocio',10,'2021-01-28 15:42:30.000000','2021-01-28 15:42:30.000000',1,3);
/*!40000 ALTER TABLE `modelo_venta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-28 15:56:37
