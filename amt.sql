-- MariaDB dump 10.19  Distrib 10.5.15-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: amtviol
-- ------------------------------------------------------
-- Server version	10.4.17-MariaDB

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
-- Table structure for table `admin_permissions`
--

DROP TABLE IF EXISTS `admin_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`properties`)),
  `conditions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`conditions`)),
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_permissions_created_by_id_fk` (`created_by_id`),
  KEY `admin_permissions_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `admin_permissions_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `admin_permissions_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_permissions`
--

LOCK TABLES `admin_permissions` WRITE;
/*!40000 ALTER TABLE `admin_permissions` DISABLE KEYS */;
INSERT INTO `admin_permissions` VALUES (1,'plugin::upload.read',NULL,'{}','[]','2022-03-16 09:45:37.105000','2022-03-16 09:45:37.105000',NULL,NULL),(2,'plugin::upload.assets.create',NULL,'{}','[]','2022-03-16 09:45:37.118000','2022-03-16 09:45:37.118000',NULL,NULL),(3,'plugin::upload.assets.update',NULL,'{}','[]','2022-03-16 09:45:37.129000','2022-03-16 09:45:37.129000',NULL,NULL),(4,'plugin::upload.assets.download',NULL,'{}','[]','2022-03-16 09:45:37.139000','2022-03-16 09:45:37.139000',NULL,NULL),(5,'plugin::upload.assets.copy-link',NULL,'{}','[]','2022-03-16 09:45:37.149000','2022-03-16 09:45:37.149000',NULL,NULL),(6,'plugin::upload.read',NULL,'{}','[\"admin::is-creator\"]','2022-03-16 09:45:37.160000','2022-03-16 09:45:37.160000',NULL,NULL),(7,'plugin::upload.assets.create',NULL,'{}','[]','2022-03-16 09:45:37.171000','2022-03-16 09:45:37.171000',NULL,NULL),(8,'plugin::upload.assets.update',NULL,'{}','[\"admin::is-creator\"]','2022-03-16 09:45:37.180000','2022-03-16 09:45:37.180000',NULL,NULL),(9,'plugin::upload.assets.download',NULL,'{}','[]','2022-03-16 09:45:37.188000','2022-03-16 09:45:37.188000',NULL,NULL),(10,'plugin::upload.assets.copy-link',NULL,'{}','[]','2022-03-16 09:45:37.197000','2022-03-16 09:45:37.197000',NULL,NULL),(14,'plugin::content-manager.explorer.delete','plugin::users-permissions.user','{}','[]','2022-03-16 09:45:37.286000','2022-03-16 09:45:37.286000',NULL,NULL),(15,'plugin::content-manager.single-types.configure-view',NULL,'{}','[]','2022-03-16 09:45:37.301000','2022-03-16 09:45:37.301000',NULL,NULL),(16,'plugin::content-manager.collection-types.configure-view',NULL,'{}','[]','2022-03-16 09:45:37.316000','2022-03-16 09:45:37.316000',NULL,NULL),(17,'plugin::content-manager.components.configure-layout',NULL,'{}','[]','2022-03-16 09:45:37.334000','2022-03-16 09:45:37.334000',NULL,NULL),(18,'plugin::content-type-builder.read',NULL,'{}','[]','2022-03-16 09:45:37.348000','2022-03-16 09:45:37.348000',NULL,NULL),(19,'plugin::email.settings.read',NULL,'{}','[]','2022-03-16 09:45:37.365000','2022-03-16 09:45:37.365000',NULL,NULL),(20,'plugin::upload.read',NULL,'{}','[]','2022-03-16 09:45:37.384000','2022-03-16 09:45:37.384000',NULL,NULL),(21,'plugin::upload.assets.create',NULL,'{}','[]','2022-03-16 09:45:37.403000','2022-03-16 09:45:37.403000',NULL,NULL),(22,'plugin::upload.assets.update',NULL,'{}','[]','2022-03-16 09:45:37.415000','2022-03-16 09:45:37.415000',NULL,NULL),(23,'plugin::upload.assets.download',NULL,'{}','[]','2022-03-16 09:45:37.424000','2022-03-16 09:45:37.424000',NULL,NULL),(24,'plugin::upload.assets.copy-link',NULL,'{}','[]','2022-03-16 09:45:37.434000','2022-03-16 09:45:37.434000',NULL,NULL),(25,'plugin::upload.settings.read',NULL,'{}','[]','2022-03-16 09:45:37.443000','2022-03-16 09:45:37.443000',NULL,NULL),(26,'plugin::users-permissions.roles.create',NULL,'{}','[]','2022-03-16 09:45:37.452000','2022-03-16 09:45:37.452000',NULL,NULL),(27,'plugin::users-permissions.roles.read',NULL,'{}','[]','2022-03-16 09:45:37.460000','2022-03-16 09:45:37.460000',NULL,NULL),(28,'plugin::users-permissions.roles.update',NULL,'{}','[]','2022-03-16 09:45:37.469000','2022-03-16 09:45:37.469000',NULL,NULL),(29,'plugin::users-permissions.roles.delete',NULL,'{}','[]','2022-03-16 09:45:37.477000','2022-03-16 09:45:37.477000',NULL,NULL),(30,'plugin::users-permissions.providers.read',NULL,'{}','[]','2022-03-16 09:45:37.487000','2022-03-16 09:45:37.487000',NULL,NULL),(31,'plugin::users-permissions.providers.update',NULL,'{}','[]','2022-03-16 09:45:37.495000','2022-03-16 09:45:37.495000',NULL,NULL),(32,'plugin::users-permissions.email-templates.read',NULL,'{}','[]','2022-03-16 09:45:37.503000','2022-03-16 09:45:37.503000',NULL,NULL),(33,'plugin::users-permissions.email-templates.update',NULL,'{}','[]','2022-03-16 09:45:37.512000','2022-03-16 09:45:37.512000',NULL,NULL),(34,'plugin::users-permissions.advanced-settings.read',NULL,'{}','[]','2022-03-16 09:45:37.521000','2022-03-16 09:45:37.521000',NULL,NULL),(35,'plugin::users-permissions.advanced-settings.update',NULL,'{}','[]','2022-03-16 09:45:37.530000','2022-03-16 09:45:37.530000',NULL,NULL),(36,'plugin::i18n.locale.create',NULL,'{}','[]','2022-03-16 09:45:37.539000','2022-03-16 09:45:37.539000',NULL,NULL),(37,'plugin::i18n.locale.read',NULL,'{}','[]','2022-03-16 09:45:37.548000','2022-03-16 09:45:37.548000',NULL,NULL),(38,'plugin::i18n.locale.update',NULL,'{}','[]','2022-03-16 09:45:37.557000','2022-03-16 09:45:37.557000',NULL,NULL),(39,'plugin::i18n.locale.delete',NULL,'{}','[]','2022-03-16 09:45:37.564000','2022-03-16 09:45:37.564000',NULL,NULL),(40,'admin::marketplace.read',NULL,'{}','[]','2022-03-16 09:45:37.573000','2022-03-16 09:45:37.573000',NULL,NULL),(41,'admin::marketplace.plugins.install',NULL,'{}','[]','2022-03-16 09:45:37.581000','2022-03-16 09:45:37.581000',NULL,NULL),(42,'admin::marketplace.plugins.uninstall',NULL,'{}','[]','2022-03-16 09:45:37.590000','2022-03-16 09:45:37.590000',NULL,NULL),(43,'admin::webhooks.create',NULL,'{}','[]','2022-03-16 09:45:37.598000','2022-03-16 09:45:37.598000',NULL,NULL),(44,'admin::webhooks.read',NULL,'{}','[]','2022-03-16 09:45:37.606000','2022-03-16 09:45:37.606000',NULL,NULL),(45,'admin::webhooks.update',NULL,'{}','[]','2022-03-16 09:45:37.613000','2022-03-16 09:45:37.613000',NULL,NULL),(46,'admin::webhooks.delete',NULL,'{}','[]','2022-03-16 09:45:37.620000','2022-03-16 09:45:37.620000',NULL,NULL),(47,'admin::users.create',NULL,'{}','[]','2022-03-16 09:45:37.628000','2022-03-16 09:45:37.628000',NULL,NULL),(48,'admin::users.read',NULL,'{}','[]','2022-03-16 09:45:37.635000','2022-03-16 09:45:37.635000',NULL,NULL),(49,'admin::users.update',NULL,'{}','[]','2022-03-16 09:45:37.643000','2022-03-16 09:45:37.643000',NULL,NULL),(50,'admin::users.delete',NULL,'{}','[]','2022-03-16 09:45:37.650000','2022-03-16 09:45:37.650000',NULL,NULL),(51,'admin::roles.create',NULL,'{}','[]','2022-03-16 09:45:37.658000','2022-03-16 09:45:37.658000',NULL,NULL),(52,'admin::roles.read',NULL,'{}','[]','2022-03-16 09:45:37.666000','2022-03-16 09:45:37.666000',NULL,NULL),(53,'admin::roles.update',NULL,'{}','[]','2022-03-16 09:45:37.674000','2022-03-16 09:45:37.674000',NULL,NULL),(54,'admin::roles.delete',NULL,'{}','[]','2022-03-16 09:45:37.683000','2022-03-16 09:45:37.683000',NULL,NULL),(55,'admin::api-tokens.create',NULL,'{}','[]','2022-03-16 09:45:37.691000','2022-03-16 09:45:37.691000',NULL,NULL),(56,'admin::api-tokens.read',NULL,'{}','[]','2022-03-16 09:45:37.700000','2022-03-16 09:45:37.700000',NULL,NULL),(57,'admin::api-tokens.update',NULL,'{}','[]','2022-03-16 09:45:37.710000','2022-03-16 09:45:37.710000',NULL,NULL),(58,'admin::api-tokens.delete',NULL,'{}','[]','2022-03-16 09:45:37.719000','2022-03-16 09:45:37.719000',NULL,NULL),(62,'plugin::content-manager.explorer.delete','api::user-detail.user-detail','{}','[]','2022-03-16 09:56:15.934000','2022-03-16 09:56:15.934000',NULL,NULL),(63,'plugin::documentation.read',NULL,'{}','[]','2022-03-16 10:50:47.407000','2022-03-16 10:50:47.407000',NULL,NULL),(64,'plugin::documentation.settings.update',NULL,'{}','[]','2022-03-16 10:50:47.418000','2022-03-16 10:50:47.418000',NULL,NULL),(65,'plugin::documentation.settings.regenerate',NULL,'{}','[]','2022-03-16 10:50:47.427000','2022-03-16 10:50:47.427000',NULL,NULL),(66,'plugin::documentation.settings.read',NULL,'{}','[]','2022-03-16 10:50:47.436000','2022-03-16 10:50:47.436000',NULL,NULL),(79,'plugin::content-manager.explorer.delete','api::category.category','{}','[]','2022-03-20 03:55:50.606000','2022-03-20 03:55:50.606000',NULL,NULL),(83,'plugin::content-manager.explorer.delete','api::tag.tag','{}','[]','2022-03-20 04:10:30.945000','2022-03-20 04:10:30.945000',NULL,NULL),(84,'plugin::content-manager.explorer.create','api::municipality.municipality','{\"fields\": [\"title\", \"location\", \"profile\"]}','[]','2022-03-20 04:37:16.489000','2022-03-20 04:37:16.489000',NULL,NULL),(85,'plugin::content-manager.explorer.read','api::municipality.municipality','{\"fields\": [\"title\", \"location\", \"profile\"]}','[]','2022-03-20 04:37:16.501000','2022-03-20 04:37:16.501000',NULL,NULL),(86,'plugin::content-manager.explorer.update','api::municipality.municipality','{\"fields\": [\"title\", \"location\", \"profile\"]}','[]','2022-03-20 04:37:16.513000','2022-03-20 04:37:16.513000',NULL,NULL),(87,'plugin::content-manager.explorer.delete','api::municipality.municipality','{}','[]','2022-03-20 04:37:16.524000','2022-03-20 04:37:16.524000',NULL,NULL),(97,'plugin::content-manager.explorer.delete','api::project.project','{}','[]','2022-03-20 19:33:34.195000','2022-03-20 19:33:34.195000',NULL,NULL),(108,'plugin::content-manager.explorer.create','api::funding.funding','{\"fields\": [\"title\"]}','[]','2022-03-20 21:19:05.724000','2022-03-20 21:19:05.724000',NULL,NULL),(109,'plugin::content-manager.explorer.read','api::funding.funding','{\"fields\": [\"title\"]}','[]','2022-03-20 21:19:05.737000','2022-03-20 21:19:05.737000',NULL,NULL),(110,'plugin::content-manager.explorer.update','api::funding.funding','{\"fields\": [\"title\"]}','[]','2022-03-20 21:19:05.748000','2022-03-20 21:19:05.748000',NULL,NULL),(111,'plugin::content-manager.explorer.delete','api::funding.funding','{}','[]','2022-03-20 21:19:05.760000','2022-03-20 21:19:05.760000',NULL,NULL),(112,'plugin::content-manager.explorer.publish','api::funding.funding','{}','[]','2022-03-20 21:19:05.768000','2022-03-20 21:19:05.768000',NULL,NULL),(117,'plugin::content-manager.explorer.create','api::watchlist.watchlist','{\"fields\": [\"user\", \"project\"]}','[]','2022-03-20 21:54:22.993000','2022-03-20 21:54:22.993000',NULL,NULL),(119,'plugin::content-manager.explorer.read','api::watchlist.watchlist','{\"fields\": [\"user\", \"project\"]}','[]','2022-03-20 21:54:23.021000','2022-03-20 21:54:23.021000',NULL,NULL),(121,'plugin::content-manager.explorer.update','api::watchlist.watchlist','{\"fields\": [\"user\", \"project\"]}','[]','2022-03-20 21:54:23.039000','2022-03-20 21:54:23.039000',NULL,NULL),(122,'plugin::content-manager.explorer.delete','api::watchlist.watchlist','{}','[]','2022-03-20 21:54:23.048000','2022-03-20 21:54:23.048000',NULL,NULL),(132,'plugin::content-manager.explorer.create','api::user-detail.user-detail','{\"fields\":[\"fullName\",\"user\",\"phone\",\"location\",\"notifications.app.dataRequests\",\"notifications.app.inquiry\",\"notifications.app.newProjects\",\"notifications.app.fundingExpiry\",\"notifications.app.newChecklists\",\"notifications.app.networkRequest\",\"notifications.email.dataRequests\",\"notifications.email.inquiry\",\"notifications.email.newProjects\",\"notifications.email.fundingExpiry\",\"notifications.email.newChecklists\",\"notifications.email.networkRequests\",\"notifications.email.secureEmails\",\"contactPrivacy\",\"profile\",\"municipality\"]}','[]','2022-04-03 14:42:35.672000','2022-04-03 14:42:35.672000',NULL,NULL),(133,'plugin::content-manager.explorer.read','api::user-detail.user-detail','{\"fields\":[\"fullName\",\"user\",\"phone\",\"location\",\"notifications.app.dataRequests\",\"notifications.app.inquiry\",\"notifications.app.newProjects\",\"notifications.app.fundingExpiry\",\"notifications.app.newChecklists\",\"notifications.app.networkRequest\",\"notifications.email.dataRequests\",\"notifications.email.inquiry\",\"notifications.email.newProjects\",\"notifications.email.fundingExpiry\",\"notifications.email.newChecklists\",\"notifications.email.networkRequests\",\"notifications.email.secureEmails\",\"contactPrivacy\",\"profile\",\"municipality\"]}','[]','2022-04-03 14:42:35.688000','2022-04-03 14:42:35.688000',NULL,NULL),(134,'plugin::content-manager.explorer.update','api::user-detail.user-detail','{\"fields\":[\"fullName\",\"user\",\"phone\",\"location\",\"notifications.app.dataRequests\",\"notifications.app.inquiry\",\"notifications.app.newProjects\",\"notifications.app.fundingExpiry\",\"notifications.app.newChecklists\",\"notifications.app.networkRequest\",\"notifications.email.dataRequests\",\"notifications.email.inquiry\",\"notifications.email.newProjects\",\"notifications.email.fundingExpiry\",\"notifications.email.newChecklists\",\"notifications.email.networkRequests\",\"notifications.email.secureEmails\",\"contactPrivacy\",\"profile\",\"municipality\"]}','[]','2022-04-03 14:42:35.700000','2022-04-03 14:42:35.700000',NULL,NULL),(138,'plugin::content-manager.explorer.create','api::category.category','{\"fields\":[\"title\",\"projects\"]}','[]','2022-04-04 10:29:49.034000','2022-04-04 10:29:49.034000',NULL,NULL),(140,'plugin::content-manager.explorer.create','api::tag.tag','{\"fields\":[\"title\",\"projects\"]}','[]','2022-04-04 10:29:49.049000','2022-04-04 10:29:49.049000',NULL,NULL),(141,'plugin::content-manager.explorer.read','api::category.category','{\"fields\":[\"title\",\"projects\"]}','[]','2022-04-04 10:29:49.055000','2022-04-04 10:29:49.055000',NULL,NULL),(143,'plugin::content-manager.explorer.read','api::tag.tag','{\"fields\":[\"title\",\"projects\"]}','[]','2022-04-04 10:29:49.066000','2022-04-04 10:29:49.066000',NULL,NULL),(144,'plugin::content-manager.explorer.update','api::category.category','{\"fields\":[\"title\",\"projects\"]}','[]','2022-04-04 10:29:49.072000','2022-04-04 10:29:49.072000',NULL,NULL),(146,'plugin::content-manager.explorer.update','api::tag.tag','{\"fields\":[\"title\",\"projects\"]}','[]','2022-04-04 10:29:49.124000','2022-04-04 10:29:49.124000',NULL,NULL),(150,'plugin::content-manager.explorer.create','plugin::users-permissions.user','{\"fields\":[\"username\",\"provider\",\"password\",\"resetPasswordToken\",\"confirmationToken\",\"confirmed\",\"blocked\",\"role\",\"email\",\"projectEditor\",\"watchlists\",\"projectReader\"]}','[]','2022-04-04 14:17:22.351000','2022-04-04 14:17:22.351000',NULL,NULL),(151,'plugin::content-manager.explorer.create','api::project.project','{\"fields\":[\"title\",\"info.contactName\",\"info.phone\",\"info.email\",\"info.location\",\"info.streetNo\",\"info.postalCode\",\"editors\",\"owner\",\"details.content\",\"details.goals\",\"details.valuesAndBenefits\",\"details.partner\",\"details.investive\",\"details.status\",\"estimatedCosts.name\",\"estimatedCosts.price\",\"plannedStart\",\"plannedEnd\",\"links.title\",\"links.link\",\"uploads\",\"fundingGuideline\",\"categories\",\"tags\",\"municipality\",\"published\",\"readers\"]}','[]','2022-04-04 14:17:22.360000','2022-04-04 14:17:22.360000',NULL,NULL),(152,'plugin::content-manager.explorer.read','plugin::users-permissions.user','{\"fields\":[\"username\",\"provider\",\"password\",\"resetPasswordToken\",\"confirmationToken\",\"confirmed\",\"blocked\",\"role\",\"email\",\"projectEditor\",\"watchlists\",\"projectReader\"]}','[]','2022-04-04 14:17:22.367000','2022-04-04 14:17:22.367000',NULL,NULL),(153,'plugin::content-manager.explorer.read','api::project.project','{\"fields\":[\"title\",\"info.contactName\",\"info.phone\",\"info.email\",\"info.location\",\"info.streetNo\",\"info.postalCode\",\"editors\",\"owner\",\"details.content\",\"details.goals\",\"details.valuesAndBenefits\",\"details.partner\",\"details.investive\",\"details.status\",\"estimatedCosts.name\",\"estimatedCosts.price\",\"plannedStart\",\"plannedEnd\",\"links.title\",\"links.link\",\"uploads\",\"fundingGuideline\",\"categories\",\"tags\",\"municipality\",\"published\",\"readers\"]}','[]','2022-04-04 14:17:22.373000','2022-04-04 14:17:22.373000',NULL,NULL),(154,'plugin::content-manager.explorer.update','plugin::users-permissions.user','{\"fields\":[\"username\",\"provider\",\"password\",\"resetPasswordToken\",\"confirmationToken\",\"confirmed\",\"blocked\",\"role\",\"email\",\"projectEditor\",\"watchlists\",\"projectReader\"]}','[]','2022-04-04 14:17:22.380000','2022-04-04 14:17:22.380000',NULL,NULL),(155,'plugin::content-manager.explorer.update','api::project.project','{\"fields\":[\"title\",\"info.contactName\",\"info.phone\",\"info.email\",\"info.location\",\"info.streetNo\",\"info.postalCode\",\"editors\",\"owner\",\"details.content\",\"details.goals\",\"details.valuesAndBenefits\",\"details.partner\",\"details.investive\",\"details.status\",\"estimatedCosts.name\",\"estimatedCosts.price\",\"plannedStart\",\"plannedEnd\",\"links.title\",\"links.link\",\"uploads\",\"fundingGuideline\",\"categories\",\"tags\",\"municipality\",\"published\",\"readers\"]}','[]','2022-04-04 14:17:22.385000','2022-04-04 14:17:22.385000',NULL,NULL);
/*!40000 ALTER TABLE `admin_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_permissions_role_links`
--

DROP TABLE IF EXISTS `admin_permissions_role_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_permissions_role_links` (
  `permission_id` int(10) unsigned DEFAULT NULL,
  `role_id` int(10) unsigned DEFAULT NULL,
  KEY `admin_permissions_role_links_fk` (`permission_id`),
  KEY `admin_permissions_role_links_inv_fk` (`role_id`),
  CONSTRAINT `admin_permissions_role_links_fk` FOREIGN KEY (`permission_id`) REFERENCES `admin_permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `admin_permissions_role_links_inv_fk` FOREIGN KEY (`role_id`) REFERENCES `admin_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_permissions_role_links`
--

LOCK TABLES `admin_permissions_role_links` WRITE;
/*!40000 ALTER TABLE `admin_permissions_role_links` DISABLE KEYS */;
INSERT INTO `admin_permissions_role_links` VALUES (1,2),(2,2),(3,2),(4,2),(5,2),(6,3),(7,3),(8,3),(9,3),(10,3),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(40,1),(41,1),(42,1),(43,1),(44,1),(45,1),(46,1),(47,1),(48,1),(49,1),(50,1),(51,1),(52,1),(53,1),(54,1),(55,1),(56,1),(57,1),(58,1),(62,1),(63,1),(64,1),(65,1),(66,1),(79,1),(83,1),(84,1),(85,1),(86,1),(87,1),(97,1),(108,1),(109,1),(110,1),(111,1),(112,1),(117,1),(119,1),(121,1),(122,1),(132,1),(133,1),(134,1),(138,1),(140,1),(141,1),(143,1),(144,1),(146,1),(150,1),(151,1),(152,1),(153,1),(154,1),(155,1);
/*!40000 ALTER TABLE `admin_permissions_role_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_roles`
--

DROP TABLE IF EXISTS `admin_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_roles_created_by_id_fk` (`created_by_id`),
  KEY `admin_roles_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `admin_roles_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `admin_roles_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_roles`
--

LOCK TABLES `admin_roles` WRITE;
/*!40000 ALTER TABLE `admin_roles` DISABLE KEYS */;
INSERT INTO `admin_roles` VALUES (1,'Super Admin','strapi-super-admin','Super Admins can access and manage all features and settings.','2022-03-16 09:45:37.077000','2022-03-16 09:45:37.077000',NULL,NULL),(2,'Editor','strapi-editor','Editors can manage and publish contents including those of other users.','2022-03-16 09:45:37.090000','2022-03-16 09:45:37.090000',NULL,NULL),(3,'Author','strapi-author','Authors can manage the content they have created.','2022-03-16 09:45:37.097000','2022-03-16 09:45:37.097000',NULL,NULL);
/*!40000 ALTER TABLE `admin_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_users`
--

DROP TABLE IF EXISTS `admin_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reset_password_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `registration_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `blocked` tinyint(1) DEFAULT NULL,
  `prefered_language` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_users_created_by_id_fk` (`created_by_id`),
  KEY `admin_users_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `admin_users_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `admin_users_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_users`
--

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;
INSERT INTO `admin_users` VALUES (1,'alameen','azad',NULL,'alameen.azad@pm.me','$2a$10$phvC6sIhICrFzdnNmNDkK.huNoJo8AW.QXLC2YgkKoRR4CiZadkCy',NULL,NULL,1,0,NULL,'2022-03-16 09:46:21.922000','2022-04-04 13:38:02.553000',NULL,NULL);
/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_users_roles_links`
--

DROP TABLE IF EXISTS `admin_users_roles_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_users_roles_links` (
  `user_id` int(10) unsigned DEFAULT NULL,
  `role_id` int(10) unsigned DEFAULT NULL,
  KEY `admin_users_roles_links_fk` (`user_id`),
  KEY `admin_users_roles_links_inv_fk` (`role_id`),
  CONSTRAINT `admin_users_roles_links_fk` FOREIGN KEY (`user_id`) REFERENCES `admin_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `admin_users_roles_links_inv_fk` FOREIGN KEY (`role_id`) REFERENCES `admin_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_users_roles_links`
--

LOCK TABLES `admin_users_roles_links` WRITE;
/*!40000 ALTER TABLE `admin_users_roles_links` DISABLE KEYS */;
INSERT INTO `admin_users_roles_links` VALUES (1,1);
/*!40000 ALTER TABLE `admin_users_roles_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_created_by_id_fk` (`created_by_id`),
  KEY `categories_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `categories_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `categories_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Donec quam felis','2022-03-20 04:12:44.531000','2022-03-20 04:12:44.531000',1,1),(2,'Nullam quis ante','2022-03-20 04:12:57.987000','2022-03-20 04:12:57.987000',1,1),(3,'Aenean leo ligula','2022-03-20 04:13:04.008000','2022-03-20 04:13:04.008000',1,1),(4,'asdlkajsdlk','2022-04-04 11:51:53.888000','2022-04-04 11:51:53.888000',NULL,NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_notifications_apps`
--

DROP TABLE IF EXISTS `components_notifications_apps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `components_notifications_apps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_requests` tinyint(1) DEFAULT NULL,
  `inquiry` tinyint(1) DEFAULT NULL,
  `new_projects` tinyint(1) DEFAULT NULL,
  `funding_expiry` tinyint(1) DEFAULT NULL,
  `new_checklists` tinyint(1) DEFAULT NULL,
  `network_request` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_notifications_apps`
--

LOCK TABLES `components_notifications_apps` WRITE;
/*!40000 ALTER TABLE `components_notifications_apps` DISABLE KEYS */;
INSERT INTO `components_notifications_apps` VALUES (1,1,0,0,1,1,1),(2,1,0,1,1,1,1),(3,1,0,1,1,1,1),(4,1,0,1,1,1,1),(5,1,0,1,1,1,1),(6,1,0,1,1,1,1),(7,1,0,1,1,1,1);
/*!40000 ALTER TABLE `components_notifications_apps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_notifications_emails`
--

DROP TABLE IF EXISTS `components_notifications_emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `components_notifications_emails` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_requests` tinyint(1) DEFAULT NULL,
  `inquiry` tinyint(1) DEFAULT NULL,
  `new_projects` tinyint(1) DEFAULT NULL,
  `funding_expiry` tinyint(1) DEFAULT NULL,
  `new_checklists` tinyint(1) DEFAULT NULL,
  `network_requests` tinyint(1) DEFAULT NULL,
  `secure_emails` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_notifications_emails`
--

LOCK TABLES `components_notifications_emails` WRITE;
/*!40000 ALTER TABLE `components_notifications_emails` DISABLE KEYS */;
INSERT INTO `components_notifications_emails` VALUES (1,1,1,1,1,1,1,1),(2,1,1,0,1,1,1,1),(3,1,1,0,1,1,1,1),(4,1,1,0,1,1,1,1),(5,1,1,0,1,1,1,1),(6,1,1,0,1,1,1,1),(7,1,1,0,1,1,1,1);
/*!40000 ALTER TABLE `components_notifications_emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_project_cat_and_tags`
--

DROP TABLE IF EXISTS `components_project_cat_and_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `components_project_cat_and_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_project_cat_and_tags`
--

LOCK TABLES `components_project_cat_and_tags` WRITE;
/*!40000 ALTER TABLE `components_project_cat_and_tags` DISABLE KEYS */;
INSERT INTO `components_project_cat_and_tags` VALUES (1);
/*!40000 ALTER TABLE `components_project_cat_and_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_project_cat_and_tags_categories_links`
--

DROP TABLE IF EXISTS `components_project_cat_and_tags_categories_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `components_project_cat_and_tags_categories_links` (
  `cat_and_tag_id` int(10) unsigned DEFAULT NULL,
  `category_id` int(10) unsigned DEFAULT NULL,
  KEY `components_project_cat_and_tags_categories_links_fk` (`cat_and_tag_id`),
  KEY `components_project_cat_and_tags_categories_links_inv_fk` (`category_id`),
  CONSTRAINT `components_project_cat_and_tags_categories_links_fk` FOREIGN KEY (`cat_and_tag_id`) REFERENCES `components_project_cat_and_tags` (`id`) ON DELETE CASCADE,
  CONSTRAINT `components_project_cat_and_tags_categories_links_inv_fk` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_project_cat_and_tags_categories_links`
--

LOCK TABLES `components_project_cat_and_tags_categories_links` WRITE;
/*!40000 ALTER TABLE `components_project_cat_and_tags_categories_links` DISABLE KEYS */;
INSERT INTO `components_project_cat_and_tags_categories_links` VALUES (1,1);
/*!40000 ALTER TABLE `components_project_cat_and_tags_categories_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_project_cat_and_tags_tags_links`
--

DROP TABLE IF EXISTS `components_project_cat_and_tags_tags_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `components_project_cat_and_tags_tags_links` (
  `cat_and_tag_id` int(10) unsigned DEFAULT NULL,
  `tag_id` int(10) unsigned DEFAULT NULL,
  KEY `components_project_cat_and_tags_tags_links_fk` (`cat_and_tag_id`),
  KEY `components_project_cat_and_tags_tags_links_inv_fk` (`tag_id`),
  CONSTRAINT `components_project_cat_and_tags_tags_links_fk` FOREIGN KEY (`cat_and_tag_id`) REFERENCES `components_project_cat_and_tags` (`id`) ON DELETE CASCADE,
  CONSTRAINT `components_project_cat_and_tags_tags_links_inv_fk` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_project_cat_and_tags_tags_links`
--

LOCK TABLES `components_project_cat_and_tags_tags_links` WRITE;
/*!40000 ALTER TABLE `components_project_cat_and_tags_tags_links` DISABLE KEYS */;
INSERT INTO `components_project_cat_and_tags_tags_links` VALUES (1,1);
/*!40000 ALTER TABLE `components_project_cat_and_tags_tags_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_project_costs`
--

DROP TABLE IF EXISTS `components_project_costs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `components_project_costs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_project_costs`
--

LOCK TABLES `components_project_costs` WRITE;
/*!40000 ALTER TABLE `components_project_costs` DISABLE KEYS */;
INSERT INTO `components_project_costs` VALUES (1,'sdfsd',324),(2,'blocks',1231),(3,'cement',89754),(4,'blocks',1231),(5,'cement',89754),(6,'blocks',1231),(7,'cement',89754),(8,'blocks',1231),(9,'cement',89754),(10,'blocks',1231),(11,'cement',89754),(12,'blocks',1231),(13,'cement',89754);
/*!40000 ALTER TABLE `components_project_costs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_project_details`
--

DROP TABLE IF EXISTS `components_project_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `components_project_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `goals` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `values_and_benefits` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `partner` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `investive` tinyint(1) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_project_details`
--

LOCK TABLES `components_project_details` WRITE;
/*!40000 ALTER TABLE `components_project_details` DISABLE KEYS */;
INSERT INTO `components_project_details` VALUES (1,'sdfsdf','sdfsdf','sdfsdf',NULL,1,NULL),(2,'adasda','sdfsdf','sdfsdf','asdasd',1,'Development'),(3,'asdasd','asdasd','asdasd',NULL,1,NULL),(4,'adasda','sdfsdf','sdfsdf','asdasd',1,'Development'),(5,'adasda','sdfsdf','sdfsdf','asdasd',1,'Development'),(6,'adasda','sdfsdf','sdfsdf','asdasd',1,'Development'),(7,'adasda','sdfsdf','sdfsdf','asdasd',1,'Development'),(8,'adasda','sdfsdf','sdfsdf','asdasd',1,'Development');
/*!40000 ALTER TABLE `components_project_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_project_infos`
--

DROP TABLE IF EXISTS `components_project_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `components_project_infos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `contact_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_project_infos`
--

LOCK TABLES `components_project_infos` WRITE;
/*!40000 ALTER TABLE `components_project_infos` DISABLE KEYS */;
INSERT INTO `components_project_infos` VALUES (1,'setset',NULL,NULL,NULL,NULL,NULL),(2,'test','54646541','test@test.com','test','test','0099745'),(3,'asdasd',NULL,NULL,NULL,NULL,NULL),(4,'test','54646541','test@test.com','test','test','0099745'),(5,'test','54646541','test@test.com','test','test','0099745'),(6,'test','54646541','test@test.com','test','test','0099745'),(7,'test','54646541','test@test.com','test','test','0099745'),(8,'test','54646541','test@test.com','test','test','0099745');
/*!40000 ALTER TABLE `components_project_infos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_project_links`
--

DROP TABLE IF EXISTS `components_project_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `components_project_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_project_links`
--

LOCK TABLES `components_project_links` WRITE;
/*!40000 ALTER TABLE `components_project_links` DISABLE KEYS */;
INSERT INTO `components_project_links` VALUES (1,'asdasd','2323'),(2,'pdf','www.example.com'),(3,'doc','www.example.com'),(4,'doc','www.example.com'),(5,'pdf','www.example.com'),(6,'pdf','www.example.com'),(7,'doc','www.example.com'),(8,'pdf','www.example.com'),(9,'doc','www.example.com'),(10,'pdf','www.example.com'),(11,'doc','www.example.com'),(12,'pdf','www.example.com'),(13,'doc','www.example.com');
/*!40000 ALTER TABLE `components_project_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_user_app_notifications`
--

DROP TABLE IF EXISTS `components_user_app_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `components_user_app_notifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_user_app_notifications`
--

LOCK TABLES `components_user_app_notifications` WRITE;
/*!40000 ALTER TABLE `components_user_app_notifications` DISABLE KEYS */;
INSERT INTO `components_user_app_notifications` VALUES (1),(2),(3),(4),(5),(6),(7),(8);
/*!40000 ALTER TABLE `components_user_app_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_user_app_notifications_components`
--

DROP TABLE IF EXISTS `components_user_app_notifications_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `components_user_app_notifications_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned DEFAULT NULL,
  `component_id` int(10) unsigned DEFAULT NULL,
  `component_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(10) unsigned DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `components_user_app_notifications_field_index` (`field`),
  KEY `components_user_app_notifications_component_type_index` (`component_type`),
  KEY `components_user_app_notifications_entity_fk` (`entity_id`),
  CONSTRAINT `components_user_app_notifications_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `components_user_app_notifications` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_user_app_notifications_components`
--

LOCK TABLES `components_user_app_notifications_components` WRITE;
/*!40000 ALTER TABLE `components_user_app_notifications_components` DISABLE KEYS */;
INSERT INTO `components_user_app_notifications_components` VALUES (3,1,1,'notifications.app','app',1),(4,1,1,'notifications.email','email',1),(5,2,2,'notifications.app','app',1),(6,3,2,'notifications.email','email',1),(7,4,3,'notifications.app','app',1),(8,4,3,'notifications.email','email',1),(9,5,4,'notifications.app','app',1),(10,5,4,'notifications.email','email',1),(11,6,5,'notifications.app','app',1),(12,6,5,'notifications.email','email',1),(17,8,7,'notifications.app','app',1),(18,8,7,'notifications.email','email',1),(19,7,6,'notifications.app','app',1),(20,7,6,'notifications.email','email',1);
/*!40000 ALTER TABLE `components_user_app_notifications_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternative_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `caption` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `formats` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`formats`)),
  `hash` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ext` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mime` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` decimal(10,2) DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `preview_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`provider_metadata`)),
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `files_created_by_id_fk` (`created_by_id`),
  KEY `files_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `files_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `files_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES (1,'muni.png','muni.png','muni.png',150,176,'{\"thumbnail\": {\"ext\": \".png\", \"url\": \"/uploads/thumbnail_muni_67c7006b2e.png\", \"hash\": \"thumbnail_muni_67c7006b2e\", \"mime\": \"image/png\", \"name\": \"thumbnail_muni.png\", \"path\": null, \"size\": 16.3, \"width\": 133, \"height\": 156}}','muni_67c7006b2e','.png','image/png',5.47,'/uploads/muni_67c7006b2e.png',NULL,'local',NULL,'2022-03-20 04:42:44.198000','2022-03-20 04:42:44.198000',1,1),(2,'99794.jpg','99794.jpg','99794.jpg',3840,2160,'{\"thumbnail\":{\"name\":\"thumbnail_99794.jpg\",\"hash\":\"thumbnail_99794_dd1f13fb3a\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":245,\"height\":138,\"size\":2.7,\"url\":\"/uploads/thumbnail_99794_dd1f13fb3a.jpg\"},\"large\":{\"name\":\"large_99794.jpg\",\"hash\":\"large_99794_dd1f13fb3a\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":1000,\"height\":563,\"size\":18.01,\"url\":\"/uploads/large_99794_dd1f13fb3a.jpg\"},\"medium\":{\"name\":\"medium_99794.jpg\",\"hash\":\"medium_99794_dd1f13fb3a\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":750,\"height\":422,\"size\":12.03,\"url\":\"/uploads/medium_99794_dd1f13fb3a.jpg\"},\"small\":{\"name\":\"small_99794.jpg\",\"hash\":\"small_99794_dd1f13fb3a\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":281,\"size\":7.04,\"url\":\"/uploads/small_99794_dd1f13fb3a.jpg\"}}','99794_dd1f13fb3a','.jpg','image/jpeg',122.43,'/uploads/99794_dd1f13fb3a.jpg',NULL,'local',NULL,'2022-04-04 10:41:08.535000','2022-04-04 10:41:08.535000',1,1),(3,'99824.jpg','99824.jpg','99824.jpg',2560,1440,'{\"thumbnail\":{\"name\":\"thumbnail_99824.jpg\",\"hash\":\"thumbnail_99824_9ea4483548\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":245,\"height\":138,\"size\":3.3,\"url\":\"/uploads/thumbnail_99824_9ea4483548.jpg\"},\"large\":{\"name\":\"large_99824.jpg\",\"hash\":\"large_99824_9ea4483548\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":1000,\"height\":563,\"size\":26.81,\"url\":\"/uploads/large_99824_9ea4483548.jpg\"},\"medium\":{\"name\":\"medium_99824.jpg\",\"hash\":\"medium_99824_9ea4483548\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":750,\"height\":422,\"size\":17.22,\"url\":\"/uploads/medium_99824_9ea4483548.jpg\"},\"small\":{\"name\":\"small_99824.jpg\",\"hash\":\"small_99824_9ea4483548\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":281,\"size\":9.35,\"url\":\"/uploads/small_99824_9ea4483548.jpg\"}}','99824_9ea4483548','.jpg','image/jpeg',118.12,'/uploads/99824_9ea4483548.jpg',NULL,'local',NULL,'2022-04-04 10:41:08.987000','2022-04-04 10:41:08.987000',1,1),(4,'99807.jpg','99807.jpg','99807.jpg',3840,2400,'{\"thumbnail\":{\"name\":\"thumbnail_99807.jpg\",\"hash\":\"thumbnail_99807_e00b053967\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":245,\"height\":153,\"size\":3.55,\"url\":\"/uploads/thumbnail_99807_e00b053967.jpg\"},\"large\":{\"name\":\"large_99807.jpg\",\"hash\":\"large_99807_e00b053967\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":1000,\"height\":625,\"size\":29.46,\"url\":\"/uploads/large_99807_e00b053967.jpg\"},\"medium\":{\"name\":\"medium_99807.jpg\",\"hash\":\"medium_99807_e00b053967\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":750,\"height\":469,\"size\":18.44,\"url\":\"/uploads/medium_99807_e00b053967.jpg\"},\"small\":{\"name\":\"small_99807.jpg\",\"hash\":\"small_99807_e00b053967\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":313,\"size\":10.4,\"url\":\"/uploads/small_99807_e00b053967.jpg\"}}','99807_e00b053967','.jpg','image/jpeg',530.86,'/uploads/99807_e00b053967.jpg',NULL,'local',NULL,'2022-04-04 10:41:09.093000','2022-04-04 10:41:09.093000',1,1),(5,'99854.jpg','99854.jpg','99854.jpg',3840,2160,'{\"thumbnail\":{\"name\":\"thumbnail_99854.jpg\",\"hash\":\"thumbnail_99854_10d5f392db\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":245,\"height\":138,\"size\":3.96,\"url\":\"/uploads/thumbnail_99854_10d5f392db.jpg\"},\"large\":{\"name\":\"large_99854.jpg\",\"hash\":\"large_99854_10d5f392db\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":1000,\"height\":563,\"size\":30.31,\"url\":\"/uploads/large_99854_10d5f392db.jpg\"},\"medium\":{\"name\":\"medium_99854.jpg\",\"hash\":\"medium_99854_10d5f392db\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":750,\"height\":422,\"size\":19.81,\"url\":\"/uploads/medium_99854_10d5f392db.jpg\"},\"small\":{\"name\":\"small_99854.jpg\",\"hash\":\"small_99854_10d5f392db\",\"ext\":\".jpg\",\"mime\":\"image/jpeg\",\"path\":null,\"width\":500,\"height\":281,\"size\":11.11,\"url\":\"/uploads/small_99854_10d5f392db.jpg\"}}','99854_10d5f392db','.jpg','image/jpeg',217.42,'/uploads/99854_10d5f392db.jpg',NULL,'local',NULL,'2022-04-04 10:41:09.099000','2022-04-04 10:41:09.099000',1,1),(6,'MicrosoftTeams-image (3).png',NULL,NULL,1242,2550,'{\"thumbnail\":{\"name\":\"thumbnail_MicrosoftTeams-image (3).png\",\"hash\":\"thumbnail_Microsoft_Teams_image_3_15e6dab9ef\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":76,\"height\":156,\"size\":1.93,\"url\":\"/uploads/thumbnail_Microsoft_Teams_image_3_15e6dab9ef.png\"},\"large\":{\"name\":\"large_MicrosoftTeams-image (3).png\",\"hash\":\"large_Microsoft_Teams_image_3_15e6dab9ef\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":487,\"height\":1000,\"size\":37.51,\"url\":\"/uploads/large_Microsoft_Teams_image_3_15e6dab9ef.png\"},\"medium\":{\"name\":\"medium_MicrosoftTeams-image (3).png\",\"hash\":\"medium_Microsoft_Teams_image_3_15e6dab9ef\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":365,\"height\":750,\"size\":24.38,\"url\":\"/uploads/medium_Microsoft_Teams_image_3_15e6dab9ef.png\"},\"small\":{\"name\":\"small_MicrosoftTeams-image (3).png\",\"hash\":\"small_Microsoft_Teams_image_3_15e6dab9ef\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":243,\"height\":500,\"size\":12.33,\"url\":\"/uploads/small_Microsoft_Teams_image_3_15e6dab9ef.png\"}}','Microsoft_Teams_image_3_15e6dab9ef','.png','image/png',138.67,'/uploads/Microsoft_Teams_image_3_15e6dab9ef.png',NULL,'local',NULL,'2022-04-04 12:10:43.327000','2022-04-04 12:10:43.327000',NULL,NULL),(7,'MicrosoftTeams-image (4).png',NULL,NULL,1080,2340,'{\"thumbnail\":{\"name\":\"thumbnail_MicrosoftTeams-image (4).png\",\"hash\":\"thumbnail_Microsoft_Teams_image_4_8881410030\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":72,\"height\":156,\"size\":2.25,\"url\":\"/uploads/thumbnail_Microsoft_Teams_image_4_8881410030.png\"},\"large\":{\"name\":\"large_MicrosoftTeams-image (4).png\",\"hash\":\"large_Microsoft_Teams_image_4_8881410030\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":462,\"height\":1000,\"size\":34.88,\"url\":\"/uploads/large_Microsoft_Teams_image_4_8881410030.png\"},\"medium\":{\"name\":\"medium_MicrosoftTeams-image (4).png\",\"hash\":\"medium_Microsoft_Teams_image_4_8881410030\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":346,\"height\":750,\"size\":23.29,\"url\":\"/uploads/medium_Microsoft_Teams_image_4_8881410030.png\"},\"small\":{\"name\":\"small_MicrosoftTeams-image (4).png\",\"hash\":\"small_Microsoft_Teams_image_4_8881410030\",\"ext\":\".png\",\"mime\":\"image/png\",\"path\":null,\"width\":231,\"height\":500,\"size\":13.03,\"url\":\"/uploads/small_Microsoft_Teams_image_4_8881410030.png\"}}','Microsoft_Teams_image_4_8881410030','.png','image/png',99.72,'/uploads/Microsoft_Teams_image_4_8881410030.png',NULL,'local',NULL,'2022-04-04 12:10:43.329000','2022-04-04 12:10:43.329000',NULL,NULL),(8,'67A6598B-36C4-4912-82E0-5B3CA52C2A32.mp4',NULL,NULL,NULL,NULL,NULL,'67_A6598_B_36_C4_4912_82_E0_5_B3_CA_52_C2_A32_ab967576b2','.mp4','video/mp4',10892.67,'/uploads/67_A6598_B_36_C4_4912_82_E0_5_B3_CA_52_C2_A32_ab967576b2.mp4',NULL,'local',NULL,'2022-04-04 12:10:43.380000','2022-04-04 12:10:43.380000',NULL,NULL);
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files_related_morphs`
--

DROP TABLE IF EXISTS `files_related_morphs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `files_related_morphs` (
  `file_id` int(10) unsigned DEFAULT NULL,
  `related_id` int(10) unsigned DEFAULT NULL,
  `related_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(10) unsigned DEFAULT NULL,
  KEY `files_related_morphs_fk` (`file_id`),
  CONSTRAINT `files_related_morphs_fk` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files_related_morphs`
--

LOCK TABLES `files_related_morphs` WRITE;
/*!40000 ALTER TABLE `files_related_morphs` DISABLE KEYS */;
INSERT INTO `files_related_morphs` VALUES (1,1,'api::municipality.municipality','profile',1),(1,2,'api::municipality.municipality','profile',1),(1,3,'api::municipality.municipality','profile',1),(1,20,'api::user-detail.user-detail','profile',1),(6,3,'api::project.project','uploads',NULL),(7,3,'api::project.project','uploads',NULL),(8,3,'api::project.project','uploads',NULL),(2,2,'api::project.project','uploads',1),(3,2,'api::project.project','uploads',2),(4,2,'api::project.project','uploads',3),(5,2,'api::project.project','uploads',4);
/*!40000 ALTER TABLE `files_related_morphs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fundings`
--

DROP TABLE IF EXISTS `fundings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fundings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fundings_created_by_id_fk` (`created_by_id`),
  KEY `fundings_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `fundings_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fundings_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fundings`
--

LOCK TABLES `fundings` WRITE;
/*!40000 ALTER TABLE `fundings` DISABLE KEYS */;
/*!40000 ALTER TABLE `fundings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i18n_locale`
--

DROP TABLE IF EXISTS `i18n_locale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `i18n_locale` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `i18n_locale_created_by_id_fk` (`created_by_id`),
  KEY `i18n_locale_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `i18n_locale_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `i18n_locale_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i18n_locale`
--

LOCK TABLES `i18n_locale` WRITE;
/*!40000 ALTER TABLE `i18n_locale` DISABLE KEYS */;
INSERT INTO `i18n_locale` VALUES (1,'English (en)','en','2022-03-16 09:45:37.043000','2022-03-16 09:45:37.043000',NULL,NULL);
/*!40000 ALTER TABLE `i18n_locale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `municipalities`
--

DROP TABLE IF EXISTS `municipalities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `municipalities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `municipalities_created_by_id_fk` (`created_by_id`),
  KEY `municipalities_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `municipalities_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `municipalities_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `municipalities`
--

LOCK TABLES `municipalities` WRITE;
/*!40000 ALTER TABLE `municipalities` DISABLE KEYS */;
INSERT INTO `municipalities` VALUES (1,'Pellworm','Pellworm','2022-03-20 04:42:50.096000','2022-03-20 04:42:50.096000',1,1),(2,'Nordstrand','Nordstrand','2022-03-20 04:43:09.213000','2022-03-20 04:43:09.213000',1,1),(3,'Bredstedt','Bredstedt','2022-03-20 04:43:36.642000','2022-03-20 04:43:36.642000',1,1);
/*!40000 ALTER TABLE `municipalities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  `planned_start` date DEFAULT NULL,
  `planned_end` date DEFAULT NULL,
  `published` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `projects_created_by_id_fk` (`created_by_id`),
  KEY `projects_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `projects_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `projects_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (2,'testproject','2022-04-04 10:41:31.995000','2022-04-04 14:14:58.892000',1,1,'2022-04-02','2022-04-16',1),(3,'asdasd','2022-04-04 11:50:52.970000','2022-04-04 11:50:52.970000',1,1,NULL,NULL,1),(4,'testproject2','2022-04-04 12:16:45.575000','2022-04-04 14:14:47.095000',NULL,1,'2022-04-02','2022-04-16',1),(5,'testproject5','2022-04-04 12:20:00.502000','2022-04-04 14:32:32.118000',NULL,1,'2022-04-02','2022-04-16',1),(6,'testproject3','2022-04-04 12:20:28.420000','2022-04-04 12:20:28.420000',NULL,NULL,'2022-04-02','2022-04-16',1),(7,'testproject3','2022-04-04 12:21:47.212000','2022-04-04 12:21:47.212000',NULL,NULL,'2022-04-02','2022-04-16',1),(8,'testproject3','2022-04-04 12:22:31.440000','2022-04-04 12:22:31.440000',NULL,NULL,'2022-04-02','2022-04-16',1);
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_categories_links`
--

DROP TABLE IF EXISTS `projects_categories_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_categories_links` (
  `project_id` int(10) unsigned DEFAULT NULL,
  `category_id` int(10) unsigned DEFAULT NULL,
  KEY `projects_categories_links_fk` (`project_id`),
  KEY `projects_categories_links_inv_fk` (`category_id`),
  CONSTRAINT `projects_categories_links_fk` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `projects_categories_links_inv_fk` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_categories_links`
--

LOCK TABLES `projects_categories_links` WRITE;
/*!40000 ALTER TABLE `projects_categories_links` DISABLE KEYS */;
INSERT INTO `projects_categories_links` VALUES (3,1),(7,1),(8,1),(2,1),(2,2);
/*!40000 ALTER TABLE `projects_categories_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_components`
--

DROP TABLE IF EXISTS `projects_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned DEFAULT NULL,
  `component_id` int(10) unsigned DEFAULT NULL,
  `component_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(10) unsigned DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `projects_field_index` (`field`),
  KEY `projects_component_type_index` (`component_type`),
  KEY `projects_entity_fk` (`entity_id`),
  CONSTRAINT `projects_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_components`
--

LOCK TABLES `projects_components` WRITE;
/*!40000 ALTER TABLE `projects_components` DISABLE KEYS */;
INSERT INTO `projects_components` VALUES (17,3,3,'project.info','info',1),(18,3,3,'project.details','details',1),(31,6,6,'project.info','info',1),(32,6,6,'project.details','details',1),(33,6,8,'project.costs','estimatedCosts',1),(34,6,9,'project.costs','estimatedCosts',2),(35,6,8,'project.links','links',1),(36,6,9,'project.links','links',2),(37,7,7,'project.info','info',1),(38,7,7,'project.details','details',1),(39,7,10,'project.costs','estimatedCosts',1),(40,7,11,'project.costs','estimatedCosts',2),(41,7,10,'project.links','links',1),(42,7,11,'project.links','links',2),(43,8,8,'project.info','info',1),(44,8,8,'project.details','details',1),(45,8,12,'project.costs','estimatedCosts',1),(46,8,13,'project.costs','estimatedCosts',2),(47,8,12,'project.links','links',1),(48,8,13,'project.links','links',2),(55,4,4,'project.info','info',1),(56,4,4,'project.details','details',1),(57,4,4,'project.costs','estimatedCosts',1),(58,4,5,'project.costs','estimatedCosts',2),(59,4,5,'project.links','links',1),(60,4,4,'project.links','links',2),(61,2,2,'project.info','info',1),(62,2,2,'project.details','details',1),(63,2,2,'project.costs','estimatedCosts',1),(64,2,3,'project.costs','estimatedCosts',2),(65,2,2,'project.links','links',1),(66,2,3,'project.links','links',2),(79,5,5,'project.info','info',1),(80,5,5,'project.details','details',1),(81,5,6,'project.costs','estimatedCosts',1),(82,5,7,'project.costs','estimatedCosts',2),(83,5,6,'project.links','links',1),(84,5,7,'project.links','links',2);
/*!40000 ALTER TABLE `projects_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_editors_links`
--

DROP TABLE IF EXISTS `projects_editors_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_editors_links` (
  `project_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  KEY `projects_editors_links_fk` (`project_id`),
  KEY `projects_editors_links_inv_fk` (`user_id`),
  CONSTRAINT `projects_editors_links_fk` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `projects_editors_links_inv_fk` FOREIGN KEY (`user_id`) REFERENCES `up_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_editors_links`
--

LOCK TABLES `projects_editors_links` WRITE;
/*!40000 ALTER TABLE `projects_editors_links` DISABLE KEYS */;
INSERT INTO `projects_editors_links` VALUES (3,1),(2,4),(2,1);
/*!40000 ALTER TABLE `projects_editors_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_funding_guideline_links`
--

DROP TABLE IF EXISTS `projects_funding_guideline_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_funding_guideline_links` (
  `project_id` int(10) unsigned DEFAULT NULL,
  `funding_id` int(10) unsigned DEFAULT NULL,
  KEY `projects_funding_guideline_links_fk` (`project_id`),
  KEY `projects_funding_guideline_links_inv_fk` (`funding_id`),
  CONSTRAINT `projects_funding_guideline_links_fk` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `projects_funding_guideline_links_inv_fk` FOREIGN KEY (`funding_id`) REFERENCES `fundings` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_funding_guideline_links`
--

LOCK TABLES `projects_funding_guideline_links` WRITE;
/*!40000 ALTER TABLE `projects_funding_guideline_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_funding_guideline_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_municipality_links`
--

DROP TABLE IF EXISTS `projects_municipality_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_municipality_links` (
  `project_id` int(10) unsigned DEFAULT NULL,
  `municipality_id` int(10) unsigned DEFAULT NULL,
  KEY `projects_municipality_links_fk` (`project_id`),
  KEY `projects_municipality_links_inv_fk` (`municipality_id`),
  CONSTRAINT `projects_municipality_links_fk` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `projects_municipality_links_inv_fk` FOREIGN KEY (`municipality_id`) REFERENCES `municipalities` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_municipality_links`
--

LOCK TABLES `projects_municipality_links` WRITE;
/*!40000 ALTER TABLE `projects_municipality_links` DISABLE KEYS */;
INSERT INTO `projects_municipality_links` VALUES (3,1),(6,1),(7,1),(8,1),(2,1);
/*!40000 ALTER TABLE `projects_municipality_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_owner_links`
--

DROP TABLE IF EXISTS `projects_owner_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_owner_links` (
  `project_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  KEY `projects_owner_links_fk` (`project_id`),
  KEY `projects_owner_links_inv_fk` (`user_id`),
  CONSTRAINT `projects_owner_links_fk` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `projects_owner_links_inv_fk` FOREIGN KEY (`user_id`) REFERENCES `up_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_owner_links`
--

LOCK TABLES `projects_owner_links` WRITE;
/*!40000 ALTER TABLE `projects_owner_links` DISABLE KEYS */;
INSERT INTO `projects_owner_links` VALUES (3,1),(4,1),(2,2),(5,2);
/*!40000 ALTER TABLE `projects_owner_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_readers_links`
--

DROP TABLE IF EXISTS `projects_readers_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_readers_links` (
  `project_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  KEY `projects_readers_links_fk` (`project_id`),
  KEY `projects_readers_links_inv_fk` (`user_id`),
  CONSTRAINT `projects_readers_links_fk` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `projects_readers_links_inv_fk` FOREIGN KEY (`user_id`) REFERENCES `up_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_readers_links`
--

LOCK TABLES `projects_readers_links` WRITE;
/*!40000 ALTER TABLE `projects_readers_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_readers_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_tags_links`
--

DROP TABLE IF EXISTS `projects_tags_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_tags_links` (
  `project_id` int(10) unsigned DEFAULT NULL,
  `tag_id` int(10) unsigned DEFAULT NULL,
  KEY `projects_tags_links_fk` (`project_id`),
  KEY `projects_tags_links_inv_fk` (`tag_id`),
  CONSTRAINT `projects_tags_links_fk` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `projects_tags_links_inv_fk` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_tags_links`
--

LOCK TABLES `projects_tags_links` WRITE;
/*!40000 ALTER TABLE `projects_tags_links` DISABLE KEYS */;
INSERT INTO `projects_tags_links` VALUES (3,1),(8,1),(2,1),(2,2);
/*!40000 ALTER TABLE `projects_tags_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_api_tokens`
--

DROP TABLE IF EXISTS `strapi_api_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `strapi_api_tokens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `strapi_api_tokens_created_by_id_fk` (`created_by_id`),
  KEY `strapi_api_tokens_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `strapi_api_tokens_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `strapi_api_tokens_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_api_tokens`
--

LOCK TABLES `strapi_api_tokens` WRITE;
/*!40000 ALTER TABLE `strapi_api_tokens` DISABLE KEYS */;
INSERT INTO `strapi_api_tokens` VALUES (1,'amtviol','','full-access','e53c666e352aae235f21a62516da704a9d10bde23c75c989d3c74709c741e49b400976940c9d2ecb4d024b999db5079243bbb5d0ac4fb8a220c22ef24fe39ade','2022-03-16 09:57:55.764000','2022-03-16 09:59:29.283000',NULL,NULL);
/*!40000 ALTER TABLE `strapi_api_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_core_store_settings`
--

DROP TABLE IF EXISTS `strapi_core_store_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `strapi_core_store_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `environment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_core_store_settings`
--

LOCK TABLES `strapi_core_store_settings` WRITE;
/*!40000 ALTER TABLE `strapi_core_store_settings` DISABLE KEYS */;
INSERT INTO `strapi_core_store_settings` VALUES (1,'strapi_content_types_schema','{\"admin::permission\":{\"collectionName\":\"admin_permissions\",\"info\":{\"name\":\"Permission\",\"description\":\"\",\"singularName\":\"permission\",\"pluralName\":\"permissions\",\"displayName\":\"Permission\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"subject\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false},\"properties\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":{}},\"conditions\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":[]},\"role\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToOne\",\"inversedBy\":\"permissions\",\"target\":\"admin::role\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"admin_permissions\",\"info\":{\"name\":\"Permission\",\"description\":\"\",\"singularName\":\"permission\",\"pluralName\":\"permissions\",\"displayName\":\"Permission\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"subject\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false},\"properties\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":{}},\"conditions\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":[]},\"role\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToOne\",\"inversedBy\":\"permissions\",\"target\":\"admin::role\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"permission\",\"connection\":\"default\",\"uid\":\"admin::permission\",\"plugin\":\"admin\",\"globalId\":\"AdminPermission\"},\"admin::user\":{\"collectionName\":\"admin_users\",\"info\":{\"name\":\"User\",\"description\":\"\",\"singularName\":\"user\",\"pluralName\":\"users\",\"displayName\":\"User\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"firstname\":{\"type\":\"string\",\"unique\":false,\"minLength\":1,\"configurable\":false,\"required\":false},\"lastname\":{\"type\":\"string\",\"unique\":false,\"minLength\":1,\"configurable\":false,\"required\":false},\"username\":{\"type\":\"string\",\"unique\":false,\"configurable\":false,\"required\":false},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true,\"unique\":true,\"private\":true},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"required\":false,\"private\":true},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"registrationToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"isActive\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false,\"private\":true},\"roles\":{\"configurable\":false,\"private\":true,\"type\":\"relation\",\"relation\":\"manyToMany\",\"inversedBy\":\"users\",\"target\":\"admin::role\",\"collectionName\":\"strapi_users_roles\"},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false,\"private\":true},\"preferedLanguage\":{\"type\":\"string\",\"configurable\":false,\"required\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"admin_users\",\"info\":{\"name\":\"User\",\"description\":\"\",\"singularName\":\"user\",\"pluralName\":\"users\",\"displayName\":\"User\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"firstname\":{\"type\":\"string\",\"unique\":false,\"minLength\":1,\"configurable\":false,\"required\":false},\"lastname\":{\"type\":\"string\",\"unique\":false,\"minLength\":1,\"configurable\":false,\"required\":false},\"username\":{\"type\":\"string\",\"unique\":false,\"configurable\":false,\"required\":false},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true,\"unique\":true,\"private\":true},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"required\":false,\"private\":true},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"registrationToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"isActive\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false,\"private\":true},\"roles\":{\"configurable\":false,\"private\":true,\"type\":\"relation\",\"relation\":\"manyToMany\",\"inversedBy\":\"users\",\"target\":\"admin::role\",\"collectionName\":\"strapi_users_roles\"},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false,\"private\":true},\"preferedLanguage\":{\"type\":\"string\",\"configurable\":false,\"required\":false}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"user\",\"connection\":\"default\",\"uid\":\"admin::user\",\"plugin\":\"admin\",\"globalId\":\"AdminUser\"},\"admin::role\":{\"collectionName\":\"admin_roles\",\"info\":{\"name\":\"Role\",\"description\":\"\",\"singularName\":\"role\",\"pluralName\":\"roles\",\"displayName\":\"Role\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"unique\":true,\"configurable\":false,\"required\":true},\"code\":{\"type\":\"string\",\"minLength\":1,\"unique\":true,\"configurable\":false,\"required\":true},\"description\":{\"type\":\"string\",\"configurable\":false},\"users\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToMany\",\"mappedBy\":\"roles\",\"target\":\"admin::user\"},\"permissions\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"oneToMany\",\"mappedBy\":\"role\",\"target\":\"admin::permission\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"admin_roles\",\"info\":{\"name\":\"Role\",\"description\":\"\",\"singularName\":\"role\",\"pluralName\":\"roles\",\"displayName\":\"Role\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"unique\":true,\"configurable\":false,\"required\":true},\"code\":{\"type\":\"string\",\"minLength\":1,\"unique\":true,\"configurable\":false,\"required\":true},\"description\":{\"type\":\"string\",\"configurable\":false},\"users\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToMany\",\"mappedBy\":\"roles\",\"target\":\"admin::user\"},\"permissions\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"oneToMany\",\"mappedBy\":\"role\",\"target\":\"admin::permission\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"role\",\"connection\":\"default\",\"uid\":\"admin::role\",\"plugin\":\"admin\",\"globalId\":\"AdminRole\"},\"admin::api-token\":{\"collectionName\":\"strapi_api_tokens\",\"info\":{\"name\":\"Api Token\",\"singularName\":\"api-token\",\"pluralName\":\"api-tokens\",\"displayName\":\"Api Token\",\"description\":\"\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"description\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false,\"default\":\"\"},\"type\":{\"type\":\"enumeration\",\"enum\":[\"read-only\",\"full-access\"],\"configurable\":false,\"required\":false,\"default\":\"read-only\"},\"accessKey\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"strapi_api_tokens\",\"info\":{\"name\":\"Api Token\",\"singularName\":\"api-token\",\"pluralName\":\"api-tokens\",\"displayName\":\"Api Token\",\"description\":\"\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"description\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false,\"default\":\"\"},\"type\":{\"type\":\"enumeration\",\"enum\":[\"read-only\",\"full-access\"],\"configurable\":false,\"required\":false,\"default\":\"read-only\"},\"accessKey\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"api-token\",\"connection\":\"default\",\"uid\":\"admin::api-token\",\"plugin\":\"admin\",\"globalId\":\"AdminApiToken\"},\"plugin::upload.file\":{\"collectionName\":\"files\",\"info\":{\"singularName\":\"file\",\"pluralName\":\"files\",\"displayName\":\"File\",\"description\":\"\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"alternativeText\":{\"type\":\"string\",\"configurable\":false},\"caption\":{\"type\":\"string\",\"configurable\":false},\"width\":{\"type\":\"integer\",\"configurable\":false},\"height\":{\"type\":\"integer\",\"configurable\":false},\"formats\":{\"type\":\"json\",\"configurable\":false},\"hash\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"ext\":{\"type\":\"string\",\"configurable\":false},\"mime\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"size\":{\"type\":\"decimal\",\"configurable\":false,\"required\":true},\"url\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"previewUrl\":{\"type\":\"string\",\"configurable\":false},\"provider\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"provider_metadata\":{\"type\":\"json\",\"configurable\":false},\"related\":{\"type\":\"relation\",\"relation\":\"morphToMany\",\"configurable\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"files\",\"info\":{\"singularName\":\"file\",\"pluralName\":\"files\",\"displayName\":\"File\",\"description\":\"\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"alternativeText\":{\"type\":\"string\",\"configurable\":false},\"caption\":{\"type\":\"string\",\"configurable\":false},\"width\":{\"type\":\"integer\",\"configurable\":false},\"height\":{\"type\":\"integer\",\"configurable\":false},\"formats\":{\"type\":\"json\",\"configurable\":false},\"hash\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"ext\":{\"type\":\"string\",\"configurable\":false},\"mime\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"size\":{\"type\":\"decimal\",\"configurable\":false,\"required\":true},\"url\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"previewUrl\":{\"type\":\"string\",\"configurable\":false},\"provider\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"provider_metadata\":{\"type\":\"json\",\"configurable\":false},\"related\":{\"type\":\"relation\",\"relation\":\"morphToMany\",\"configurable\":false}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"file\",\"connection\":\"default\",\"uid\":\"plugin::upload.file\",\"plugin\":\"upload\",\"globalId\":\"UploadFile\"},\"plugin::i18n.locale\":{\"info\":{\"singularName\":\"locale\",\"pluralName\":\"locales\",\"collectionName\":\"locales\",\"displayName\":\"Locale\",\"description\":\"\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"min\":1,\"max\":50,\"configurable\":false},\"code\":{\"type\":\"string\",\"unique\":true,\"configurable\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"info\":{\"singularName\":\"locale\",\"pluralName\":\"locales\",\"collectionName\":\"locales\",\"displayName\":\"Locale\",\"description\":\"\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"min\":1,\"max\":50,\"configurable\":false},\"code\":{\"type\":\"string\",\"unique\":true,\"configurable\":false}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"locale\",\"connection\":\"default\",\"uid\":\"plugin::i18n.locale\",\"plugin\":\"i18n\",\"collectionName\":\"i18n_locale\",\"globalId\":\"I18NLocale\"},\"plugin::users-permissions.permission\":{\"collectionName\":\"up_permissions\",\"info\":{\"name\":\"permission\",\"description\":\"\",\"singularName\":\"permission\",\"pluralName\":\"permissions\",\"displayName\":\"Permission\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"role\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::users-permissions.role\",\"inversedBy\":\"permissions\",\"configurable\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"up_permissions\",\"info\":{\"name\":\"permission\",\"description\":\"\",\"singularName\":\"permission\",\"pluralName\":\"permissions\",\"displayName\":\"Permission\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"role\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::users-permissions.role\",\"inversedBy\":\"permissions\",\"configurable\":false}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"permission\",\"connection\":\"default\",\"uid\":\"plugin::users-permissions.permission\",\"plugin\":\"users-permissions\",\"globalId\":\"UsersPermissionsPermission\"},\"plugin::users-permissions.role\":{\"collectionName\":\"up_roles\",\"info\":{\"name\":\"role\",\"description\":\"\",\"singularName\":\"role\",\"pluralName\":\"roles\",\"displayName\":\"Role\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":3,\"required\":true,\"configurable\":false},\"description\":{\"type\":\"string\",\"configurable\":false},\"type\":{\"type\":\"string\",\"unique\":true,\"configurable\":false},\"permissions\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::users-permissions.permission\",\"mappedBy\":\"role\",\"configurable\":false},\"users\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::users-permissions.user\",\"mappedBy\":\"role\",\"configurable\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"up_roles\",\"info\":{\"name\":\"role\",\"description\":\"\",\"singularName\":\"role\",\"pluralName\":\"roles\",\"displayName\":\"Role\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":3,\"required\":true,\"configurable\":false},\"description\":{\"type\":\"string\",\"configurable\":false},\"type\":{\"type\":\"string\",\"unique\":true,\"configurable\":false},\"permissions\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::users-permissions.permission\",\"mappedBy\":\"role\",\"configurable\":false},\"users\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::users-permissions.user\",\"mappedBy\":\"role\",\"configurable\":false}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"role\",\"connection\":\"default\",\"uid\":\"plugin::users-permissions.role\",\"plugin\":\"users-permissions\",\"globalId\":\"UsersPermissionsRole\"},\"plugin::users-permissions.user\":{\"collectionName\":\"up_users\",\"info\":{\"name\":\"user\",\"description\":\"\",\"singularName\":\"user\",\"pluralName\":\"users\",\"displayName\":\"User\"},\"options\":{\"draftAndPublish\":false,\"timestamps\":true},\"attributes\":{\"username\":{\"type\":\"string\",\"minLength\":3,\"unique\":true,\"configurable\":false,\"required\":true},\"provider\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"private\":true},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"confirmationToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"confirmed\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false,\"private\":true},\"role\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::users-permissions.role\",\"inversedBy\":\"users\",\"configurable\":false},\"email\":{\"type\":\"email\",\"minLength\":6,\"required\":true,\"unique\":true},\"projectEditor\":{\"type\":\"relation\",\"relation\":\"manyToMany\",\"target\":\"api::project.project\",\"mappedBy\":\"editors\"},\"watchlists\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::watchlist.watchlist\",\"mappedBy\":\"user\"},\"projectReader\":{\"type\":\"relation\",\"relation\":\"manyToMany\",\"target\":\"api::project.project\",\"inversedBy\":\"readers\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"config\":{\"attributes\":{\"resetPasswordToken\":{\"hidden\":true},\"confirmationToken\":{\"hidden\":true},\"provider\":{\"hidden\":true}}},\"kind\":\"collectionType\",\"__filename__\":\"schema.json\",\"__schema__\":{\"collectionName\":\"up_users\",\"info\":{\"name\":\"user\",\"description\":\"\",\"singularName\":\"user\",\"pluralName\":\"users\",\"displayName\":\"User\"},\"options\":{\"draftAndPublish\":false,\"timestamps\":true},\"attributes\":{\"username\":{\"type\":\"string\",\"minLength\":3,\"unique\":true,\"configurable\":false,\"required\":true},\"provider\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"private\":true},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"confirmationToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"confirmed\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false,\"private\":true},\"role\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::users-permissions.role\",\"inversedBy\":\"users\",\"configurable\":false},\"email\":{\"type\":\"email\",\"minLength\":6,\"required\":true,\"unique\":true},\"projectEditor\":{\"type\":\"relation\",\"relation\":\"manyToMany\",\"target\":\"api::project.project\",\"mappedBy\":\"editors\"},\"watchlists\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::watchlist.watchlist\",\"mappedBy\":\"user\"},\"projectReader\":{\"type\":\"relation\",\"relation\":\"manyToMany\",\"target\":\"api::project.project\",\"inversedBy\":\"readers\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"user\",\"connection\":\"default\",\"uid\":\"plugin::users-permissions.user\",\"plugin\":\"users-permissions\",\"globalId\":\"UsersPermissionsUser\"},\"api::category.category\":{\"kind\":\"collectionType\",\"collectionName\":\"categories\",\"info\":{\"singularName\":\"category\",\"pluralName\":\"categories\",\"displayName\":\"category\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{},\"attributes\":{\"title\":{\"type\":\"string\",\"required\":true,\"unique\":true},\"projects\":{\"type\":\"relation\",\"relation\":\"manyToMany\",\"target\":\"api::project.project\",\"autoPopulate\":false,\"mappedBy\":\"categories\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"__schema__\":{\"collectionName\":\"categories\",\"info\":{\"singularName\":\"category\",\"pluralName\":\"categories\",\"displayName\":\"category\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{},\"attributes\":{\"title\":{\"type\":\"string\",\"required\":true,\"unique\":true},\"projects\":{\"type\":\"relation\",\"relation\":\"manyToMany\",\"target\":\"api::project.project\",\"autoPopulate\":false,\"mappedBy\":\"categories\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"category\",\"connection\":\"default\",\"uid\":\"api::category.category\",\"apiName\":\"category\",\"globalId\":\"Category\",\"actions\":{},\"lifecycles\":{}},\"api::funding.funding\":{\"kind\":\"collectionType\",\"collectionName\":\"fundings\",\"info\":{\"singularName\":\"funding\",\"pluralName\":\"fundings\",\"displayName\":\"funding\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"title\":{\"type\":\"string\",\"required\":true},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"__schema__\":{\"collectionName\":\"fundings\",\"info\":{\"singularName\":\"funding\",\"pluralName\":\"fundings\",\"displayName\":\"funding\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{},\"attributes\":{\"title\":{\"type\":\"string\",\"required\":true}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"funding\",\"connection\":\"default\",\"uid\":\"api::funding.funding\",\"apiName\":\"funding\",\"globalId\":\"Funding\",\"actions\":{},\"lifecycles\":{}},\"api::municipality.municipality\":{\"kind\":\"collectionType\",\"collectionName\":\"municipalities\",\"info\":{\"singularName\":\"municipality\",\"pluralName\":\"municipalities\",\"displayName\":\"municipality\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{},\"attributes\":{\"title\":{\"type\":\"string\",\"unique\":true,\"required\":true},\"location\":{\"type\":\"string\",\"required\":true,\"unique\":true},\"profile\":{\"allowedTypes\":[\"images\"],\"type\":\"media\",\"multiple\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"__schema__\":{\"collectionName\":\"municipalities\",\"info\":{\"singularName\":\"municipality\",\"pluralName\":\"municipalities\",\"displayName\":\"municipality\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{},\"attributes\":{\"title\":{\"type\":\"string\",\"unique\":true,\"required\":true},\"location\":{\"type\":\"string\",\"required\":true,\"unique\":true},\"profile\":{\"allowedTypes\":[\"images\"],\"type\":\"media\",\"multiple\":false}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"municipality\",\"connection\":\"default\",\"uid\":\"api::municipality.municipality\",\"apiName\":\"municipality\",\"globalId\":\"Municipality\",\"actions\":{},\"lifecycles\":{}},\"api::project.project\":{\"kind\":\"collectionType\",\"collectionName\":\"projects\",\"info\":{\"singularName\":\"project\",\"pluralName\":\"projects\",\"displayName\":\"project\",\"description\":\"\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{},\"attributes\":{\"title\":{\"type\":\"string\",\"required\":true,\"unique\":true},\"info\":{\"displayName\":\"info\",\"type\":\"component\",\"repeatable\":false,\"component\":\"project.info\",\"required\":true},\"editors\":{\"type\":\"relation\",\"relation\":\"manyToMany\",\"target\":\"plugin::users-permissions.user\",\"inversedBy\":\"projectEditor\"},\"owner\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"plugin::users-permissions.user\"},\"details\":{\"displayName\":\"details\",\"type\":\"component\",\"repeatable\":false,\"component\":\"project.details\",\"required\":true},\"estimatedCosts\":{\"displayName\":\"costs\",\"type\":\"component\",\"repeatable\":true,\"component\":\"project.costs\"},\"plannedStart\":{\"type\":\"date\"},\"plannedEnd\":{\"type\":\"date\"},\"links\":{\"displayName\":\"links\",\"type\":\"component\",\"repeatable\":true,\"component\":\"project.links\"},\"uploads\":{\"type\":\"media\",\"multiple\":true,\"required\":false,\"allowedTypes\":[\"images\",\"files\",\"videos\",\"audios\"]},\"fundingGuideline\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"api::funding.funding\"},\"categories\":{\"type\":\"relation\",\"relation\":\"manyToMany\",\"target\":\"api::category.category\",\"inversedBy\":\"projects\"},\"tags\":{\"type\":\"relation\",\"relation\":\"manyToMany\",\"target\":\"api::tag.tag\",\"inversedBy\":\"projects\"},\"municipality\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"api::municipality.municipality\"},\"published\":{\"type\":\"boolean\",\"default\":false,\"required\":true},\"readers\":{\"type\":\"relation\",\"relation\":\"manyToMany\",\"target\":\"plugin::users-permissions.user\",\"inversedBy\":\"projectReader\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"__schema__\":{\"collectionName\":\"projects\",\"info\":{\"singularName\":\"project\",\"pluralName\":\"projects\",\"displayName\":\"project\",\"description\":\"\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{},\"attributes\":{\"title\":{\"type\":\"string\",\"required\":true,\"unique\":true},\"info\":{\"displayName\":\"info\",\"type\":\"component\",\"repeatable\":false,\"component\":\"project.info\",\"required\":true},\"editors\":{\"type\":\"relation\",\"relation\":\"manyToMany\",\"target\":\"plugin::users-permissions.user\",\"inversedBy\":\"projectEditor\"},\"owner\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"plugin::users-permissions.user\"},\"details\":{\"displayName\":\"details\",\"type\":\"component\",\"repeatable\":false,\"component\":\"project.details\",\"required\":true},\"estimatedCosts\":{\"displayName\":\"costs\",\"type\":\"component\",\"repeatable\":true,\"component\":\"project.costs\"},\"plannedStart\":{\"type\":\"date\"},\"plannedEnd\":{\"type\":\"date\"},\"links\":{\"displayName\":\"links\",\"type\":\"component\",\"repeatable\":true,\"component\":\"project.links\"},\"uploads\":{\"type\":\"media\",\"multiple\":true,\"required\":false,\"allowedTypes\":[\"images\",\"files\",\"videos\",\"audios\"]},\"fundingGuideline\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"api::funding.funding\"},\"categories\":{\"type\":\"relation\",\"relation\":\"manyToMany\",\"target\":\"api::category.category\",\"inversedBy\":\"projects\"},\"tags\":{\"type\":\"relation\",\"relation\":\"manyToMany\",\"target\":\"api::tag.tag\",\"inversedBy\":\"projects\"},\"municipality\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"api::municipality.municipality\"},\"published\":{\"type\":\"boolean\",\"default\":false,\"required\":true},\"readers\":{\"type\":\"relation\",\"relation\":\"manyToMany\",\"target\":\"plugin::users-permissions.user\",\"inversedBy\":\"projectReader\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"project\",\"connection\":\"default\",\"uid\":\"api::project.project\",\"apiName\":\"project\",\"globalId\":\"Project\",\"actions\":{},\"lifecycles\":{}},\"api::tag.tag\":{\"kind\":\"collectionType\",\"collectionName\":\"tags\",\"info\":{\"singularName\":\"tag\",\"pluralName\":\"tags\",\"displayName\":\"tag\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{},\"attributes\":{\"title\":{\"type\":\"string\",\"required\":true,\"unique\":true},\"projects\":{\"type\":\"relation\",\"relation\":\"manyToMany\",\"target\":\"api::project.project\",\"mappedBy\":\"tags\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"__schema__\":{\"collectionName\":\"tags\",\"info\":{\"singularName\":\"tag\",\"pluralName\":\"tags\",\"displayName\":\"tag\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{},\"attributes\":{\"title\":{\"type\":\"string\",\"required\":true,\"unique\":true},\"projects\":{\"type\":\"relation\",\"relation\":\"manyToMany\",\"target\":\"api::project.project\",\"mappedBy\":\"tags\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"tag\",\"connection\":\"default\",\"uid\":\"api::tag.tag\",\"apiName\":\"tag\",\"globalId\":\"Tag\",\"actions\":{},\"lifecycles\":{}},\"api::user-detail.user-detail\":{\"kind\":\"collectionType\",\"collectionName\":\"user_details\",\"info\":{\"singularName\":\"user-detail\",\"pluralName\":\"user-details\",\"displayName\":\"user detail\",\"description\":\"\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{},\"attributes\":{\"fullName\":{\"type\":\"string\",\"required\":true},\"user\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"plugin::users-permissions.user\"},\"phone\":{\"type\":\"string\"},\"location\":{\"type\":\"string\"},\"notifications\":{\"type\":\"component\",\"repeatable\":false,\"component\":\"user.app-notifications\"},\"contactPrivacy\":{\"type\":\"boolean\",\"default\":false},\"profile\":{\"type\":\"media\",\"multiple\":false,\"required\":false,\"allowedTypes\":[\"images\"]},\"municipality\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"api::municipality.municipality\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"__schema__\":{\"collectionName\":\"user_details\",\"info\":{\"singularName\":\"user-detail\",\"pluralName\":\"user-details\",\"displayName\":\"user detail\",\"description\":\"\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{},\"attributes\":{\"fullName\":{\"type\":\"string\",\"required\":true},\"user\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"plugin::users-permissions.user\"},\"phone\":{\"type\":\"string\"},\"location\":{\"type\":\"string\"},\"notifications\":{\"type\":\"component\",\"repeatable\":false,\"component\":\"user.app-notifications\"},\"contactPrivacy\":{\"type\":\"boolean\",\"default\":false},\"profile\":{\"type\":\"media\",\"multiple\":false,\"required\":false,\"allowedTypes\":[\"images\"]},\"municipality\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"api::municipality.municipality\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"user-detail\",\"connection\":\"default\",\"uid\":\"api::user-detail.user-detail\",\"apiName\":\"user-detail\",\"globalId\":\"UserDetail\",\"actions\":{},\"lifecycles\":{}},\"api::watchlist.watchlist\":{\"kind\":\"collectionType\",\"collectionName\":\"watchlists\",\"info\":{\"singularName\":\"watchlist\",\"pluralName\":\"watchlists\",\"displayName\":\"watchlist\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{},\"attributes\":{\"user\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::users-permissions.user\",\"inversedBy\":\"watchlists\"},\"project\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"api::project.project\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true}},\"__schema__\":{\"collectionName\":\"watchlists\",\"info\":{\"singularName\":\"watchlist\",\"pluralName\":\"watchlists\",\"displayName\":\"watchlist\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{},\"attributes\":{\"user\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::users-permissions.user\",\"inversedBy\":\"watchlists\"},\"project\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"api::project.project\"}},\"kind\":\"collectionType\"},\"modelType\":\"contentType\",\"modelName\":\"watchlist\",\"connection\":\"default\",\"uid\":\"api::watchlist.watchlist\",\"apiName\":\"watchlist\",\"globalId\":\"Watchlist\",\"actions\":{},\"lifecycles\":{}}}','object',NULL,NULL),(2,'plugin_content_manager_configuration_content_types::admin::permission','{\"uid\":\"admin::permission\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"action\",\"defaultSortBy\":\"action\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"action\":{\"edit\":{\"label\":\"action\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"action\",\"searchable\":true,\"sortable\":true}},\"subject\":{\"edit\":{\"label\":\"subject\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"subject\",\"searchable\":true,\"sortable\":true}},\"properties\":{\"edit\":{\"label\":\"properties\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"properties\",\"searchable\":false,\"sortable\":false}},\"conditions\":{\"edit\":{\"label\":\"conditions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"conditions\",\"searchable\":false,\"sortable\":false}},\"role\":{\"edit\":{\"label\":\"role\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"role\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"action\",\"subject\",\"role\"],\"editRelations\":[\"role\"],\"edit\":[[{\"name\":\"action\",\"size\":6},{\"name\":\"subject\",\"size\":6}],[{\"name\":\"properties\",\"size\":12}],[{\"name\":\"conditions\",\"size\":12}]]}}','object',NULL,NULL),(3,'plugin_content_manager_configuration_content_types::admin::user','{\"uid\":\"admin::user\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"firstname\",\"defaultSortBy\":\"firstname\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"firstname\":{\"edit\":{\"label\":\"firstname\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"firstname\",\"searchable\":true,\"sortable\":true}},\"lastname\":{\"edit\":{\"label\":\"lastname\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"lastname\",\"searchable\":true,\"sortable\":true}},\"username\":{\"edit\":{\"label\":\"username\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"username\",\"searchable\":true,\"sortable\":true}},\"email\":{\"edit\":{\"label\":\"email\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"email\",\"searchable\":true,\"sortable\":true}},\"password\":{\"edit\":{\"label\":\"password\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"password\",\"searchable\":true,\"sortable\":true}},\"resetPasswordToken\":{\"edit\":{\"label\":\"resetPasswordToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"resetPasswordToken\",\"searchable\":true,\"sortable\":true}},\"registrationToken\":{\"edit\":{\"label\":\"registrationToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"registrationToken\",\"searchable\":true,\"sortable\":true}},\"isActive\":{\"edit\":{\"label\":\"isActive\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"isActive\",\"searchable\":true,\"sortable\":true}},\"roles\":{\"edit\":{\"label\":\"roles\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"roles\",\"searchable\":false,\"sortable\":false}},\"blocked\":{\"edit\":{\"label\":\"blocked\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"blocked\",\"searchable\":true,\"sortable\":true}},\"preferedLanguage\":{\"edit\":{\"label\":\"preferedLanguage\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"preferedLanguage\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"firstname\",\"lastname\",\"username\"],\"editRelations\":[\"roles\"],\"edit\":[[{\"name\":\"firstname\",\"size\":6},{\"name\":\"lastname\",\"size\":6}],[{\"name\":\"username\",\"size\":6},{\"name\":\"email\",\"size\":6}],[{\"name\":\"password\",\"size\":6},{\"name\":\"resetPasswordToken\",\"size\":6}],[{\"name\":\"registrationToken\",\"size\":6},{\"name\":\"isActive\",\"size\":4}],[{\"name\":\"blocked\",\"size\":4},{\"name\":\"preferedLanguage\",\"size\":6}]]}}','object',NULL,NULL),(4,'plugin_content_manager_configuration_content_types::admin::api-token','{\"uid\":\"admin::api-token\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":true,\"sortable\":true}},\"type\":{\"edit\":{\"label\":\"type\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"type\",\"searchable\":true,\"sortable\":true}},\"accessKey\":{\"edit\":{\"label\":\"accessKey\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"accessKey\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"description\",\"type\"],\"editRelations\":[],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"description\",\"size\":6}],[{\"name\":\"type\",\"size\":6},{\"name\":\"accessKey\",\"size\":6}]]}}','object',NULL,NULL),(5,'plugin_content_manager_configuration_content_types::admin::role','{\"uid\":\"admin::role\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"code\":{\"edit\":{\"label\":\"code\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"code\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":true,\"sortable\":true}},\"users\":{\"edit\":{\"label\":\"users\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"users\",\"searchable\":false,\"sortable\":false}},\"permissions\":{\"edit\":{\"label\":\"permissions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"action\"},\"list\":{\"label\":\"permissions\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"code\",\"description\"],\"editRelations\":[\"users\",\"permissions\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"code\",\"size\":6}],[{\"name\":\"description\",\"size\":6}]]}}','object',NULL,NULL),(6,'plugin_content_manager_configuration_content_types::plugin::upload.file','{\"uid\":\"plugin::upload.file\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"alternativeText\":{\"edit\":{\"label\":\"alternativeText\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"alternativeText\",\"searchable\":true,\"sortable\":true}},\"caption\":{\"edit\":{\"label\":\"caption\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"caption\",\"searchable\":true,\"sortable\":true}},\"width\":{\"edit\":{\"label\":\"width\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"width\",\"searchable\":true,\"sortable\":true}},\"height\":{\"edit\":{\"label\":\"height\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"height\",\"searchable\":true,\"sortable\":true}},\"formats\":{\"edit\":{\"label\":\"formats\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"formats\",\"searchable\":false,\"sortable\":false}},\"hash\":{\"edit\":{\"label\":\"hash\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"hash\",\"searchable\":true,\"sortable\":true}},\"ext\":{\"edit\":{\"label\":\"ext\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"ext\",\"searchable\":true,\"sortable\":true}},\"mime\":{\"edit\":{\"label\":\"mime\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"mime\",\"searchable\":true,\"sortable\":true}},\"size\":{\"edit\":{\"label\":\"size\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"size\",\"searchable\":true,\"sortable\":true}},\"url\":{\"edit\":{\"label\":\"url\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"url\",\"searchable\":true,\"sortable\":true}},\"previewUrl\":{\"edit\":{\"label\":\"previewUrl\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"previewUrl\",\"searchable\":true,\"sortable\":true}},\"provider\":{\"edit\":{\"label\":\"provider\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"provider\",\"searchable\":true,\"sortable\":true}},\"provider_metadata\":{\"edit\":{\"label\":\"provider_metadata\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"provider_metadata\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"alternativeText\",\"caption\"],\"editRelations\":[],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"alternativeText\",\"size\":6}],[{\"name\":\"caption\",\"size\":6},{\"name\":\"width\",\"size\":4}],[{\"name\":\"height\",\"size\":4}],[{\"name\":\"formats\",\"size\":12}],[{\"name\":\"hash\",\"size\":6},{\"name\":\"ext\",\"size\":6}],[{\"name\":\"mime\",\"size\":6},{\"name\":\"size\",\"size\":4}],[{\"name\":\"url\",\"size\":6},{\"name\":\"previewUrl\",\"size\":6}],[{\"name\":\"provider\",\"size\":6}],[{\"name\":\"provider_metadata\",\"size\":12}]]}}','object',NULL,NULL),(7,'plugin_content_manager_configuration_content_types::plugin::users-permissions.permission','{\"uid\":\"plugin::users-permissions.permission\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"action\",\"defaultSortBy\":\"action\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"action\":{\"edit\":{\"label\":\"action\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"action\",\"searchable\":true,\"sortable\":true}},\"role\":{\"edit\":{\"label\":\"role\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"role\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"action\",\"role\",\"createdAt\"],\"editRelations\":[\"role\"],\"edit\":[[{\"name\":\"action\",\"size\":6}]]}}','object',NULL,NULL),(8,'plugin_content_manager_configuration_content_types::plugin::users-permissions.role','{\"uid\":\"plugin::users-permissions.role\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":true,\"sortable\":true}},\"type\":{\"edit\":{\"label\":\"type\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"type\",\"searchable\":true,\"sortable\":true}},\"permissions\":{\"edit\":{\"label\":\"permissions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"action\"},\"list\":{\"label\":\"permissions\",\"searchable\":false,\"sortable\":false}},\"users\":{\"edit\":{\"label\":\"users\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"username\"},\"list\":{\"label\":\"users\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"description\",\"type\"],\"editRelations\":[\"permissions\",\"users\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"description\",\"size\":6}],[{\"name\":\"type\",\"size\":6}]]}}','object',NULL,NULL),(9,'plugin_content_manager_configuration_content_types::plugin::users-permissions.user','{\"uid\":\"plugin::users-permissions.user\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"username\",\"defaultSortBy\":\"username\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"username\":{\"edit\":{\"label\":\"username\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"username\",\"searchable\":true,\"sortable\":true}},\"provider\":{\"edit\":{\"label\":\"provider\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"provider\",\"searchable\":true,\"sortable\":true}},\"password\":{\"edit\":{\"label\":\"password\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"password\",\"searchable\":true,\"sortable\":true}},\"resetPasswordToken\":{\"edit\":{\"label\":\"resetPasswordToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"resetPasswordToken\",\"searchable\":true,\"sortable\":true}},\"confirmationToken\":{\"edit\":{\"label\":\"confirmationToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"confirmationToken\",\"searchable\":true,\"sortable\":true}},\"confirmed\":{\"edit\":{\"label\":\"confirmed\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"confirmed\",\"searchable\":true,\"sortable\":true}},\"blocked\":{\"edit\":{\"label\":\"blocked\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"blocked\",\"searchable\":true,\"sortable\":true}},\"role\":{\"edit\":{\"label\":\"role\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"role\",\"searchable\":true,\"sortable\":true}},\"email\":{\"edit\":{\"label\":\"email\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"email\",\"searchable\":true,\"sortable\":true}},\"projectEditor\":{\"edit\":{\"label\":\"projectEditor\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"title\"},\"list\":{\"label\":\"projectEditor\",\"searchable\":false,\"sortable\":false}},\"watchlists\":{\"edit\":{\"label\":\"watchlists\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"id\"},\"list\":{\"label\":\"watchlists\",\"searchable\":false,\"sortable\":false}},\"projectReader\":{\"edit\":{\"label\":\"projectReader\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"title\"},\"list\":{\"label\":\"projectReader\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"username\",\"email\",\"confirmed\"],\"edit\":[[{\"name\":\"username\",\"size\":6},{\"name\":\"email\",\"size\":6}],[{\"name\":\"password\",\"size\":6},{\"name\":\"confirmed\",\"size\":4}],[{\"name\":\"blocked\",\"size\":4}]],\"editRelations\":[\"role\",\"projectEditor\",\"watchlists\",\"projectReader\"]}}','object',NULL,NULL),(10,'plugin_content_manager_configuration_content_types::plugin::i18n.locale','{\"uid\":\"plugin::i18n.locale\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"code\":{\"edit\":{\"label\":\"code\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"code\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"code\",\"createdAt\"],\"editRelations\":[],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"code\",\"size\":6}]]}}','object',NULL,NULL),(11,'plugin_upload_settings','{\"sizeOptimization\":true,\"responsiveDimensions\":true,\"autoOrientation\":false}','object',NULL,NULL),(12,'plugin_users-permissions_grant','{\"email\":{\"enabled\":true,\"icon\":\"envelope\"},\"discord\":{\"enabled\":false,\"icon\":\"discord\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/discord/callback\",\"scope\":[\"identify\",\"email\"]},\"facebook\":{\"enabled\":false,\"icon\":\"facebook-square\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/facebook/callback\",\"scope\":[\"email\"]},\"google\":{\"enabled\":false,\"icon\":\"google\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/google/callback\",\"scope\":[\"email\"]},\"github\":{\"enabled\":false,\"icon\":\"github\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/github/callback\",\"scope\":[\"user\",\"user:email\"]},\"microsoft\":{\"enabled\":false,\"icon\":\"windows\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/microsoft/callback\",\"scope\":[\"user.read\"]},\"twitter\":{\"enabled\":false,\"icon\":\"twitter\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/twitter/callback\"},\"instagram\":{\"enabled\":false,\"icon\":\"instagram\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/instagram/callback\",\"scope\":[\"user_profile\"]},\"vk\":{\"enabled\":false,\"icon\":\"vk\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/vk/callback\",\"scope\":[\"email\"]},\"twitch\":{\"enabled\":false,\"icon\":\"twitch\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/twitch/callback\",\"scope\":[\"user:read:email\"]},\"linkedin\":{\"enabled\":false,\"icon\":\"linkedin\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/linkedin/callback\",\"scope\":[\"r_liteprofile\",\"r_emailaddress\"]},\"cognito\":{\"enabled\":false,\"icon\":\"aws\",\"key\":\"\",\"secret\":\"\",\"subdomain\":\"my.subdomain.com\",\"callback\":\"api/auth/cognito/callback\",\"scope\":[\"email\",\"openid\",\"profile\"]},\"reddit\":{\"enabled\":false,\"icon\":\"reddit\",\"key\":\"\",\"secret\":\"\",\"state\":true,\"callback\":\"api/auth/reddit/callback\",\"scope\":[\"identity\"]},\"auth0\":{\"enabled\":false,\"icon\":\"\",\"key\":\"\",\"secret\":\"\",\"subdomain\":\"my-tenant.eu\",\"callback\":\"api/auth/auth0/callback\",\"scope\":[\"openid\",\"email\",\"profile\"]},\"cas\":{\"enabled\":false,\"icon\":\"book\",\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/cas/callback\",\"scope\":[\"openid email\"],\"subdomain\":\"my.subdomain.com/cas\"}}','object',NULL,NULL),(13,'plugin_users-permissions_email','{\"reset_password\":{\"display\":\"Email.template.reset_password\",\"icon\":\"sync\",\"options\":{\"from\":{\"name\":\"Administration Panel\",\"email\":\"no-reply@strapi.io\"},\"response_email\":\"\",\"object\":\"Reset password\",\"message\":\"<p>We heard that you lost your password. Sorry about that!</p>\\n\\n<p>But don’t worry! You can use the following link to reset your password:</p>\\n<p><%= URL %>?code=<%= TOKEN %></p>\\n\\n<p>Thanks.</p>\"}},\"email_confirmation\":{\"display\":\"Email.template.email_confirmation\",\"icon\":\"check-square\",\"options\":{\"from\":{\"name\":\"Administration Panel\",\"email\":\"no-reply@strapi.io\"},\"response_email\":\"\",\"object\":\"Account confirmation\",\"message\":\"<p>Thank you for registering!</p>\\n\\n<p>You have to confirm your email address. Please click on the link below.</p>\\n\\n<p><%= URL %>?confirmation=<%= CODE %></p>\\n\\n<p>Thanks.</p>\"}}}','object',NULL,NULL),(14,'plugin_users-permissions_advanced','{\"unique_email\":true,\"allow_register\":true,\"email_confirmation\":false,\"email_reset_password\":null,\"email_confirmation_redirection\":null,\"default_role\":\"authenticated\"}','object',NULL,NULL),(15,'plugin_i18n_default_locale','\"en\"','string',NULL,NULL),(16,'core_admin_auth','{\"providers\":{\"autoRegister\":false,\"defaultRole\":null}}','object',NULL,NULL),(17,'plugin_content_manager_configuration_content_types::api::user-detail.user-detail','{\"uid\":\"api::user-detail.user-detail\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"fullName\",\"defaultSortBy\":\"fullName\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"fullName\":{\"edit\":{\"label\":\"fullName\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"fullName\",\"searchable\":true,\"sortable\":true}},\"user\":{\"edit\":{\"label\":\"user\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"username\"},\"list\":{\"label\":\"user\",\"searchable\":true,\"sortable\":true}},\"phone\":{\"edit\":{\"label\":\"phone\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"phone\",\"searchable\":true,\"sortable\":true}},\"location\":{\"edit\":{\"label\":\"location\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"location\",\"searchable\":true,\"sortable\":true}},\"notifications\":{\"edit\":{\"label\":\"notifications\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"notifications\",\"searchable\":false,\"sortable\":false}},\"contactPrivacy\":{\"edit\":{\"label\":\"contactPrivacy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"contactPrivacy\",\"searchable\":true,\"sortable\":true}},\"profile\":{\"edit\":{\"label\":\"profile\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"profile\",\"searchable\":false,\"sortable\":false}},\"municipality\":{\"edit\":{\"label\":\"municipality\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"title\"},\"list\":{\"label\":\"municipality\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"fullName\",\"user\",\"createdAt\"],\"edit\":[[{\"name\":\"fullName\",\"size\":6}],[{\"name\":\"phone\",\"size\":6},{\"name\":\"location\",\"size\":6}],[{\"name\":\"notifications\",\"size\":12}],[{\"name\":\"contactPrivacy\",\"size\":4},{\"name\":\"profile\",\"size\":6}]],\"editRelations\":[\"user\",\"municipality\"]}}','object',NULL,NULL),(18,'plugin_documentation_config','{\"restrictedAccess\":false}','object',NULL,NULL),(19,'plugin_content_manager_configuration_components::user.app-notifications','{\"uid\":\"user.app-notifications\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"app\":{\"edit\":{\"label\":\"app\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"app\",\"searchable\":false,\"sortable\":false}},\"email\":{\"edit\":{\"label\":\"email\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"email\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\",\"app\",\"email\"],\"edit\":[[{\"name\":\"app\",\"size\":12}],[{\"name\":\"email\",\"size\":12}]],\"editRelations\":[]},\"isComponent\":true}','object',NULL,NULL),(20,'plugin_content_manager_configuration_components::notifications.app','{\"uid\":\"notifications.app\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"dataRequests\":{\"edit\":{\"label\":\"dataRequests\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"dataRequests\",\"searchable\":true,\"sortable\":true}},\"inquiry\":{\"edit\":{\"label\":\"inquiry\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"inquiry\",\"searchable\":true,\"sortable\":true}},\"newProjects\":{\"edit\":{\"label\":\"newProjects\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"newProjects\",\"searchable\":true,\"sortable\":true}},\"fundingExpiry\":{\"edit\":{\"label\":\"fundingExpiry\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"fundingExpiry\",\"searchable\":true,\"sortable\":true}},\"newChecklists\":{\"edit\":{\"label\":\"newChecklists\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"newChecklists\",\"searchable\":true,\"sortable\":true}},\"networkRequest\":{\"edit\":{\"label\":\"networkRequest\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"networkRequest\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"dataRequests\",\"inquiry\",\"newProjects\"],\"edit\":[[{\"name\":\"dataRequests\",\"size\":4},{\"name\":\"inquiry\",\"size\":4},{\"name\":\"newProjects\",\"size\":4}],[{\"name\":\"fundingExpiry\",\"size\":4},{\"name\":\"newChecklists\",\"size\":4},{\"name\":\"networkRequest\",\"size\":4}]],\"editRelations\":[]},\"isComponent\":true}','object',NULL,NULL),(21,'plugin_content_manager_configuration_components::notifications.email','{\"uid\":\"notifications.email\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"dataRequests\":{\"edit\":{\"label\":\"dataRequests\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"dataRequests\",\"searchable\":true,\"sortable\":true}},\"inquiry\":{\"edit\":{\"label\":\"inquiry\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"inquiry\",\"searchable\":true,\"sortable\":true}},\"newProjects\":{\"edit\":{\"label\":\"newProjects\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"newProjects\",\"searchable\":true,\"sortable\":true}},\"fundingExpiry\":{\"edit\":{\"label\":\"fundingExpiry\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"fundingExpiry\",\"searchable\":true,\"sortable\":true}},\"newChecklists\":{\"edit\":{\"label\":\"newChecklists\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"newChecklists\",\"searchable\":true,\"sortable\":true}},\"networkRequests\":{\"edit\":{\"label\":\"networkRequests\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"networkRequests\",\"searchable\":true,\"sortable\":true}},\"secureEmails\":{\"edit\":{\"label\":\"secureEmails\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"secureEmails\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"dataRequests\",\"inquiry\",\"newProjects\"],\"edit\":[[{\"name\":\"dataRequests\",\"size\":4},{\"name\":\"inquiry\",\"size\":4},{\"name\":\"newProjects\",\"size\":4}],[{\"name\":\"fundingExpiry\",\"size\":4},{\"name\":\"newChecklists\",\"size\":4},{\"name\":\"networkRequests\",\"size\":4}],[{\"name\":\"secureEmails\",\"size\":4}]],\"editRelations\":[]},\"isComponent\":true}','object',NULL,NULL),(22,'plugin_content_manager_configuration_content_types::api::category.category','{\"uid\":\"api::category.category\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"title\",\"defaultSortBy\":\"title\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"title\":{\"edit\":{\"label\":\"title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"title\",\"searchable\":true,\"sortable\":true}},\"projects\":{\"edit\":{\"label\":\"projects\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"title\"},\"list\":{\"label\":\"projects\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"title\",\"createdAt\",\"updatedAt\"],\"edit\":[[{\"name\":\"title\",\"size\":6}]],\"editRelations\":[\"projects\"]}}','object',NULL,NULL),(23,'plugin_content_manager_configuration_content_types::api::tag.tag','{\"uid\":\"api::tag.tag\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"title\",\"defaultSortBy\":\"title\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"title\":{\"edit\":{\"label\":\"title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"title\",\"searchable\":true,\"sortable\":true}},\"projects\":{\"edit\":{\"label\":\"projects\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"title\"},\"list\":{\"label\":\"projects\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"title\",\"createdAt\",\"updatedAt\"],\"edit\":[[{\"name\":\"title\",\"size\":6}]],\"editRelations\":[\"projects\"]}}','object',NULL,NULL),(24,'plugin_content_manager_configuration_content_types::api::municipality.municipality','{\"uid\":\"api::municipality.municipality\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"title\",\"defaultSortBy\":\"title\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"title\":{\"edit\":{\"label\":\"title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"title\",\"searchable\":true,\"sortable\":true}},\"location\":{\"edit\":{\"label\":\"location\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"location\",\"searchable\":true,\"sortable\":true}},\"profile\":{\"edit\":{\"label\":\"profile\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"profile\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"title\",\"location\",\"profile\"],\"editRelations\":[],\"edit\":[[{\"name\":\"title\",\"size\":6},{\"name\":\"location\",\"size\":6}],[{\"name\":\"profile\",\"size\":6}]]}}','object',NULL,NULL),(25,'plugin_content_manager_configuration_components::project.info','{\"uid\":\"project.info\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"contactName\",\"defaultSortBy\":\"contactName\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"contactName\":{\"edit\":{\"label\":\"contactName\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"contactName\",\"searchable\":true,\"sortable\":true}},\"phone\":{\"edit\":{\"label\":\"phone\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"phone\",\"searchable\":true,\"sortable\":true}},\"email\":{\"edit\":{\"label\":\"email\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"email\",\"searchable\":true,\"sortable\":true}},\"location\":{\"edit\":{\"label\":\"location\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"location\",\"searchable\":true,\"sortable\":true}},\"streetNo\":{\"edit\":{\"label\":\"streetNo\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"streetNo\",\"searchable\":true,\"sortable\":true}},\"postalCode\":{\"edit\":{\"label\":\"postalCode\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"postalCode\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"contactName\",\"phone\"],\"edit\":[[{\"name\":\"contactName\",\"size\":6}],[{\"name\":\"phone\",\"size\":6},{\"name\":\"email\",\"size\":6}],[{\"name\":\"location\",\"size\":6},{\"name\":\"streetNo\",\"size\":6}],[{\"name\":\"postalCode\",\"size\":6}]],\"editRelations\":[]},\"isComponent\":true}','object',NULL,NULL),(26,'plugin_content_manager_configuration_content_types::api::project.project','{\"uid\":\"api::project.project\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"title\",\"defaultSortBy\":\"title\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"title\":{\"edit\":{\"label\":\"title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"title\",\"searchable\":true,\"sortable\":true}},\"info\":{\"edit\":{\"label\":\"info\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"info\",\"searchable\":false,\"sortable\":false}},\"editors\":{\"edit\":{\"label\":\"editors\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"username\"},\"list\":{\"label\":\"editors\",\"searchable\":false,\"sortable\":false}},\"owner\":{\"edit\":{\"label\":\"owner\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"username\"},\"list\":{\"label\":\"owner\",\"searchable\":true,\"sortable\":true}},\"details\":{\"edit\":{\"label\":\"details\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"details\",\"searchable\":false,\"sortable\":false}},\"estimatedCosts\":{\"edit\":{\"label\":\"estimatedCosts\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"estimatedCosts\",\"searchable\":false,\"sortable\":false}},\"plannedStart\":{\"edit\":{\"label\":\"plannedStart\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"plannedStart\",\"searchable\":true,\"sortable\":true}},\"plannedEnd\":{\"edit\":{\"label\":\"plannedEnd\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"plannedEnd\",\"searchable\":true,\"sortable\":true}},\"links\":{\"edit\":{\"label\":\"links\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"links\",\"searchable\":false,\"sortable\":false}},\"uploads\":{\"edit\":{\"label\":\"uploads\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"uploads\",\"searchable\":false,\"sortable\":false}},\"fundingGuideline\":{\"edit\":{\"label\":\"fundingGuideline\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"title\"},\"list\":{\"label\":\"fundingGuideline\",\"searchable\":true,\"sortable\":true}},\"categories\":{\"edit\":{\"label\":\"categories\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"title\"},\"list\":{\"label\":\"categories\",\"searchable\":false,\"sortable\":false}},\"tags\":{\"edit\":{\"label\":\"tags\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"title\"},\"list\":{\"label\":\"tags\",\"searchable\":false,\"sortable\":false}},\"municipality\":{\"edit\":{\"label\":\"municipality\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"title\"},\"list\":{\"label\":\"municipality\",\"searchable\":true,\"sortable\":true}},\"published\":{\"edit\":{\"label\":\"published\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"published\",\"searchable\":true,\"sortable\":true}},\"readers\":{\"edit\":{\"label\":\"readers\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"username\"},\"list\":{\"label\":\"readers\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"title\",\"info\",\"editors\",\"owner\"],\"edit\":[[{\"name\":\"title\",\"size\":6}],[{\"name\":\"info\",\"size\":12}],[{\"name\":\"details\",\"size\":12}],[{\"name\":\"estimatedCosts\",\"size\":12}],[{\"name\":\"plannedStart\",\"size\":4}],[{\"name\":\"plannedEnd\",\"size\":4}],[{\"name\":\"links\",\"size\":12}],[{\"name\":\"uploads\",\"size\":6},{\"name\":\"published\",\"size\":4}]],\"editRelations\":[\"editors\",\"owner\",\"categories\",\"tags\",\"municipality\",\"readers\"]}}','object',NULL,NULL),(27,'plugin_content_manager_configuration_components::project.cat-and-tag','{\"uid\":\"project.cat-and-tag\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"categories\":{\"edit\":{\"label\":\"categories\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"title\"},\"list\":{\"label\":\"categories\",\"searchable\":false,\"sortable\":false}},\"tags\":{\"edit\":{\"label\":\"tags\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"title\"},\"list\":{\"label\":\"tags\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\",\"categories\",\"tags\"],\"edit\":[[{\"name\":\"categories\",\"size\":6},{\"name\":\"tags\",\"size\":6}]],\"editRelations\":[]},\"isComponent\":true}','object',NULL,NULL),(28,'plugin_content_manager_configuration_components::project.details','{\"uid\":\"project.details\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"goals\",\"defaultSortBy\":\"goals\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"content\":{\"edit\":{\"label\":\"content\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"content\",\"searchable\":true,\"sortable\":true}},\"goals\":{\"edit\":{\"label\":\"goals\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"goals\",\"searchable\":true,\"sortable\":true}},\"valuesAndBenefits\":{\"edit\":{\"label\":\"valuesAndBenefits\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"valuesAndBenefits\",\"searchable\":true,\"sortable\":true}},\"partner\":{\"edit\":{\"label\":\"partner\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"partner\",\"searchable\":true,\"sortable\":true}},\"investive\":{\"edit\":{\"label\":\"investive\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"investive\",\"searchable\":true,\"sortable\":true}},\"status\":{\"edit\":{\"label\":\"status\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"status\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"content\",\"goals\",\"valuesAndBenefits\"],\"edit\":[[{\"name\":\"content\",\"size\":6},{\"name\":\"goals\",\"size\":6}],[{\"name\":\"valuesAndBenefits\",\"size\":6},{\"name\":\"partner\",\"size\":6}],[{\"name\":\"investive\",\"size\":4},{\"name\":\"status\",\"size\":6}]],\"editRelations\":[]},\"isComponent\":true}','object',NULL,NULL),(29,'plugin_content_manager_configuration_components::project.costs','{\"uid\":\"project.costs\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"price\":{\"edit\":{\"label\":\"price\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"price\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"price\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"price\",\"size\":4}]],\"editRelations\":[]},\"isComponent\":true}','object',NULL,NULL),(30,'plugin_content_manager_configuration_components::project.links','{\"uid\":\"project.links\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"title\",\"defaultSortBy\":\"title\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"title\":{\"edit\":{\"label\":\"title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"title\",\"searchable\":true,\"sortable\":true}},\"link\":{\"edit\":{\"label\":\"link\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"link\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"title\",\"link\"],\"edit\":[[{\"name\":\"title\",\"size\":6},{\"name\":\"link\",\"size\":6}]],\"editRelations\":[]},\"isComponent\":true}','object',NULL,NULL),(31,'plugin_content_manager_configuration_content_types::api::funding.funding','{\"uid\":\"api::funding.funding\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"title\",\"defaultSortBy\":\"title\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"title\":{\"edit\":{\"label\":\"title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"title\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"title\",\"createdAt\",\"updatedAt\"],\"editRelations\":[],\"edit\":[[{\"name\":\"title\",\"size\":6}]]}}','object',NULL,NULL),(32,'plugin_content_manager_configuration_content_types::api::watchlist.watchlist','{\"uid\":\"api::watchlist.watchlist\",\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"user\":{\"edit\":{\"label\":\"user\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"username\"},\"list\":{\"label\":\"user\",\"searchable\":true,\"sortable\":true}},\"project\":{\"edit\":{\"label\":\"project\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"title\"},\"list\":{\"label\":\"project\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"user\",\"project\",\"createdAt\"],\"editRelations\":[\"user\",\"project\"],\"edit\":[]}}','object',NULL,NULL);
/*!40000 ALTER TABLE `strapi_core_store_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_database_schema`
--

DROP TABLE IF EXISTS `strapi_database_schema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `strapi_database_schema` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `schema` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`schema`)),
  `time` datetime DEFAULT NULL,
  `hash` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_database_schema`
--

LOCK TABLES `strapi_database_schema` WRITE;
/*!40000 ALTER TABLE `strapi_database_schema` DISABLE KEYS */;
INSERT INTO `strapi_database_schema` VALUES (31,'{\"tables\":[{\"name\":\"strapi_core_store_settings\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"key\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"value\",\"type\":\"text\",\"args\":[\"longtext\"],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"environment\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"tag\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"strapi_webhooks\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"url\",\"type\":\"text\",\"args\":[\"longtext\"],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"headers\",\"type\":\"jsonb\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"events\",\"type\":\"jsonb\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"enabled\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"admin_permissions\",\"indexes\":[{\"name\":\"admin_permissions_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"admin_permissions_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"admin_permissions_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"admin_permissions_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"action\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"subject\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"properties\",\"type\":\"jsonb\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"conditions\",\"type\":\"jsonb\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"admin_users\",\"indexes\":[{\"name\":\"admin_users_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"admin_users_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"admin_users_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"admin_users_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"firstname\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"lastname\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"username\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"email\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"password\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"reset_password_token\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"registration_token\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"is_active\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"blocked\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"prefered_language\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"admin_roles\",\"indexes\":[{\"name\":\"admin_roles_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"admin_roles_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"admin_roles_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"admin_roles_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"code\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"description\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"strapi_api_tokens\",\"indexes\":[{\"name\":\"strapi_api_tokens_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"strapi_api_tokens_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"strapi_api_tokens_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"strapi_api_tokens_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"description\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"access_key\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"files\",\"indexes\":[{\"name\":\"files_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"files_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"files_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"files_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"alternative_text\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"caption\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"width\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"height\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"formats\",\"type\":\"jsonb\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"hash\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"ext\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"mime\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"size\",\"type\":\"decimal\",\"args\":[10,2],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"url\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"preview_url\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"provider\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"provider_metadata\",\"type\":\"jsonb\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"i18n_locale\",\"indexes\":[{\"name\":\"i18n_locale_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"i18n_locale_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"i18n_locale_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"i18n_locale_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"code\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"up_permissions\",\"indexes\":[{\"name\":\"up_permissions_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"up_permissions_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"up_permissions_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"up_permissions_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"action\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"up_roles\",\"indexes\":[{\"name\":\"up_roles_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"up_roles_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"up_roles_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"up_roles_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"description\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"up_users\",\"indexes\":[{\"name\":\"up_users_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"up_users_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"up_users_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"up_users_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"username\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"provider\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"password\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"reset_password_token\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"confirmation_token\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"confirmed\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"blocked\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"email\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"categories\",\"indexes\":[{\"name\":\"categories_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"categories_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"categories_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"categories_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"title\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"fundings\",\"indexes\":[{\"name\":\"fundings_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"fundings_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"fundings_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"fundings_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"title\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"published_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"municipalities\",\"indexes\":[{\"name\":\"municipalities_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"municipalities_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"municipalities_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"municipalities_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"title\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"location\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"projects\",\"indexes\":[{\"name\":\"projects_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"projects_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"projects_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"projects_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"title\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"planned_start\",\"type\":\"date\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"planned_end\",\"type\":\"date\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"published\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"tags\",\"indexes\":[{\"name\":\"tags_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"tags_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"tags_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"tags_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"title\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"user_details\",\"indexes\":[{\"name\":\"user_details_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"user_details_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"user_details_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"user_details_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"full_name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"phone\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"location\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"contact_privacy\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"watchlists\",\"indexes\":[{\"name\":\"watchlists_created_by_id_fk\",\"columns\":[\"created_by_id\"]},{\"name\":\"watchlists_updated_by_id_fk\",\"columns\":[\"updated_by_id\"]}],\"foreignKeys\":[{\"name\":\"watchlists_created_by_id_fk\",\"columns\":[\"created_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"},{\"name\":\"watchlists_updated_by_id_fk\",\"columns\":[\"updated_by_id\"],\"referencedTable\":\"admin_users\",\"referencedColumns\":[\"id\"],\"onDelete\":\"SET NULL\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"created_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"updated_at\",\"type\":\"datetime\",\"args\":[{\"useTz\":false,\"precision\":6}],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"created_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"updated_by_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"components_notifications_apps\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"data_requests\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"inquiry\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"new_projects\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"funding_expiry\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"new_checklists\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"network_request\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"components_notifications_emails\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"data_requests\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"inquiry\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"new_projects\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"funding_expiry\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"new_checklists\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"network_requests\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"secure_emails\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"components_project_cat_and_tags\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false}]},{\"name\":\"components_project_costs\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"price\",\"type\":\"double\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"components_project_details\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"content\",\"type\":\"text\",\"args\":[\"longtext\"],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"goals\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"values_and_benefits\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"partner\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"investive\",\"type\":\"boolean\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"status\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"components_project_infos\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"contact_name\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"phone\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"email\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"location\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"street_no\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"postal_code\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"components_project_links\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"title\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"link\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false}]},{\"name\":\"components_user_app_notifications\",\"indexes\":[],\"foreignKeys\":[],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false}]},{\"name\":\"admin_permissions_role_links\",\"indexes\":[{\"name\":\"admin_permissions_role_links_fk\",\"columns\":[\"permission_id\"]},{\"name\":\"admin_permissions_role_links_inv_fk\",\"columns\":[\"role_id\"]}],\"foreignKeys\":[{\"name\":\"admin_permissions_role_links_fk\",\"columns\":[\"permission_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"admin_permissions\",\"onDelete\":\"CASCADE\"},{\"name\":\"admin_permissions_role_links_inv_fk\",\"columns\":[\"role_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"admin_roles\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"permission_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"role_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"admin_users_roles_links\",\"indexes\":[{\"name\":\"admin_users_roles_links_fk\",\"columns\":[\"user_id\"]},{\"name\":\"admin_users_roles_links_inv_fk\",\"columns\":[\"role_id\"]}],\"foreignKeys\":[{\"name\":\"admin_users_roles_links_fk\",\"columns\":[\"user_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"admin_users\",\"onDelete\":\"CASCADE\"},{\"name\":\"admin_users_roles_links_inv_fk\",\"columns\":[\"role_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"admin_roles\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"user_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"role_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"files_related_morphs\",\"indexes\":[{\"name\":\"files_related_morphs_fk\",\"columns\":[\"file_id\"]}],\"foreignKeys\":[{\"name\":\"files_related_morphs_fk\",\"columns\":[\"file_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"files\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"file_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"related_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"related_type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"field\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"order\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"up_permissions_role_links\",\"indexes\":[{\"name\":\"up_permissions_role_links_fk\",\"columns\":[\"permission_id\"]},{\"name\":\"up_permissions_role_links_inv_fk\",\"columns\":[\"role_id\"]}],\"foreignKeys\":[{\"name\":\"up_permissions_role_links_fk\",\"columns\":[\"permission_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"up_permissions\",\"onDelete\":\"CASCADE\"},{\"name\":\"up_permissions_role_links_inv_fk\",\"columns\":[\"role_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"up_roles\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"permission_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"role_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"up_users_role_links\",\"indexes\":[{\"name\":\"up_users_role_links_fk\",\"columns\":[\"user_id\"]},{\"name\":\"up_users_role_links_inv_fk\",\"columns\":[\"role_id\"]}],\"foreignKeys\":[{\"name\":\"up_users_role_links_fk\",\"columns\":[\"user_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"up_users\",\"onDelete\":\"CASCADE\"},{\"name\":\"up_users_role_links_inv_fk\",\"columns\":[\"role_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"up_roles\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"user_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"role_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"up_users_project_reader_links\",\"indexes\":[{\"name\":\"up_users_project_reader_links_fk\",\"columns\":[\"user_id\"]},{\"name\":\"up_users_project_reader_links_inv_fk\",\"columns\":[\"project_id\"]}],\"foreignKeys\":[{\"name\":\"up_users_project_reader_links_fk\",\"columns\":[\"user_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"up_users\",\"onDelete\":\"CASCADE\"},{\"name\":\"up_users_project_reader_links_inv_fk\",\"columns\":[\"project_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"projects\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"user_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"project_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"projects_components\",\"indexes\":[{\"name\":\"projects_field_index\",\"columns\":[\"field\"],\"type\":null},{\"name\":\"projects_component_type_index\",\"columns\":[\"component_type\"],\"type\":null},{\"name\":\"projects_entity_fk\",\"columns\":[\"entity_id\"]}],\"foreignKeys\":[{\"name\":\"projects_entity_fk\",\"columns\":[\"entity_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"projects\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"entity_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"field\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"order\",\"type\":\"integer\",\"args\":[],\"defaultTo\":0,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"projects_editors_links\",\"indexes\":[{\"name\":\"projects_editors_links_fk\",\"columns\":[\"project_id\"]},{\"name\":\"projects_editors_links_inv_fk\",\"columns\":[\"user_id\"]}],\"foreignKeys\":[{\"name\":\"projects_editors_links_fk\",\"columns\":[\"project_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"projects\",\"onDelete\":\"CASCADE\"},{\"name\":\"projects_editors_links_inv_fk\",\"columns\":[\"user_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"up_users\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"project_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"user_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"projects_owner_links\",\"indexes\":[{\"name\":\"projects_owner_links_fk\",\"columns\":[\"project_id\"]},{\"name\":\"projects_owner_links_inv_fk\",\"columns\":[\"user_id\"]}],\"foreignKeys\":[{\"name\":\"projects_owner_links_fk\",\"columns\":[\"project_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"projects\",\"onDelete\":\"CASCADE\"},{\"name\":\"projects_owner_links_inv_fk\",\"columns\":[\"user_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"up_users\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"project_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"user_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"projects_funding_guideline_links\",\"indexes\":[{\"name\":\"projects_funding_guideline_links_fk\",\"columns\":[\"project_id\"]},{\"name\":\"projects_funding_guideline_links_inv_fk\",\"columns\":[\"funding_id\"]}],\"foreignKeys\":[{\"name\":\"projects_funding_guideline_links_fk\",\"columns\":[\"project_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"projects\",\"onDelete\":\"CASCADE\"},{\"name\":\"projects_funding_guideline_links_inv_fk\",\"columns\":[\"funding_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"fundings\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"project_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"funding_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"projects_categories_links\",\"indexes\":[{\"name\":\"projects_categories_links_fk\",\"columns\":[\"project_id\"]},{\"name\":\"projects_categories_links_inv_fk\",\"columns\":[\"category_id\"]}],\"foreignKeys\":[{\"name\":\"projects_categories_links_fk\",\"columns\":[\"project_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"projects\",\"onDelete\":\"CASCADE\"},{\"name\":\"projects_categories_links_inv_fk\",\"columns\":[\"category_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"categories\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"project_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"category_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"projects_tags_links\",\"indexes\":[{\"name\":\"projects_tags_links_fk\",\"columns\":[\"project_id\"]},{\"name\":\"projects_tags_links_inv_fk\",\"columns\":[\"tag_id\"]}],\"foreignKeys\":[{\"name\":\"projects_tags_links_fk\",\"columns\":[\"project_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"projects\",\"onDelete\":\"CASCADE\"},{\"name\":\"projects_tags_links_inv_fk\",\"columns\":[\"tag_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"tags\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"project_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"tag_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"projects_municipality_links\",\"indexes\":[{\"name\":\"projects_municipality_links_fk\",\"columns\":[\"project_id\"]},{\"name\":\"projects_municipality_links_inv_fk\",\"columns\":[\"municipality_id\"]}],\"foreignKeys\":[{\"name\":\"projects_municipality_links_fk\",\"columns\":[\"project_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"projects\",\"onDelete\":\"CASCADE\"},{\"name\":\"projects_municipality_links_inv_fk\",\"columns\":[\"municipality_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"municipalities\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"project_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"municipality_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"projects_readers_links\",\"indexes\":[{\"name\":\"projects_readers_links_fk\",\"columns\":[\"project_id\"]},{\"name\":\"projects_readers_links_inv_fk\",\"columns\":[\"user_id\"]}],\"foreignKeys\":[{\"name\":\"projects_readers_links_fk\",\"columns\":[\"project_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"projects\",\"onDelete\":\"CASCADE\"},{\"name\":\"projects_readers_links_inv_fk\",\"columns\":[\"user_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"up_users\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"project_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"user_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"user_details_components\",\"indexes\":[{\"name\":\"user_details_field_index\",\"columns\":[\"field\"],\"type\":null},{\"name\":\"user_details_component_type_index\",\"columns\":[\"component_type\"],\"type\":null},{\"name\":\"user_details_entity_fk\",\"columns\":[\"entity_id\"]}],\"foreignKeys\":[{\"name\":\"user_details_entity_fk\",\"columns\":[\"entity_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"user_details\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"entity_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"field\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"order\",\"type\":\"integer\",\"args\":[],\"defaultTo\":0,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"user_details_user_links\",\"indexes\":[{\"name\":\"user_details_user_links_fk\",\"columns\":[\"user_detail_id\"]},{\"name\":\"user_details_user_links_inv_fk\",\"columns\":[\"user_id\"]}],\"foreignKeys\":[{\"name\":\"user_details_user_links_fk\",\"columns\":[\"user_detail_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"user_details\",\"onDelete\":\"CASCADE\"},{\"name\":\"user_details_user_links_inv_fk\",\"columns\":[\"user_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"up_users\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"user_detail_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"user_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"user_details_municipality_links\",\"indexes\":[{\"name\":\"user_details_municipality_links_fk\",\"columns\":[\"user_detail_id\"]},{\"name\":\"user_details_municipality_links_inv_fk\",\"columns\":[\"municipality_id\"]}],\"foreignKeys\":[{\"name\":\"user_details_municipality_links_fk\",\"columns\":[\"user_detail_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"user_details\",\"onDelete\":\"CASCADE\"},{\"name\":\"user_details_municipality_links_inv_fk\",\"columns\":[\"municipality_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"municipalities\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"user_detail_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"municipality_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"watchlists_user_links\",\"indexes\":[{\"name\":\"watchlists_user_links_fk\",\"columns\":[\"watchlist_id\"]},{\"name\":\"watchlists_user_links_inv_fk\",\"columns\":[\"user_id\"]}],\"foreignKeys\":[{\"name\":\"watchlists_user_links_fk\",\"columns\":[\"watchlist_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"watchlists\",\"onDelete\":\"CASCADE\"},{\"name\":\"watchlists_user_links_inv_fk\",\"columns\":[\"user_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"up_users\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"watchlist_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"user_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"watchlists_project_links\",\"indexes\":[{\"name\":\"watchlists_project_links_fk\",\"columns\":[\"watchlist_id\"]},{\"name\":\"watchlists_project_links_inv_fk\",\"columns\":[\"project_id\"]}],\"foreignKeys\":[{\"name\":\"watchlists_project_links_fk\",\"columns\":[\"watchlist_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"watchlists\",\"onDelete\":\"CASCADE\"},{\"name\":\"watchlists_project_links_inv_fk\",\"columns\":[\"project_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"projects\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"watchlist_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"project_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"components_project_cat_and_tags_categories_links\",\"indexes\":[{\"name\":\"components_project_cat_and_tags_categories_links_fk\",\"columns\":[\"cat_and_tag_id\"]},{\"name\":\"components_project_cat_and_tags_categories_links_inv_fk\",\"columns\":[\"category_id\"]}],\"foreignKeys\":[{\"name\":\"components_project_cat_and_tags_categories_links_fk\",\"columns\":[\"cat_and_tag_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"components_project_cat_and_tags\",\"onDelete\":\"CASCADE\"},{\"name\":\"components_project_cat_and_tags_categories_links_inv_fk\",\"columns\":[\"category_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"categories\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"cat_and_tag_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"category_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"components_project_cat_and_tags_tags_links\",\"indexes\":[{\"name\":\"components_project_cat_and_tags_tags_links_fk\",\"columns\":[\"cat_and_tag_id\"]},{\"name\":\"components_project_cat_and_tags_tags_links_inv_fk\",\"columns\":[\"tag_id\"]}],\"foreignKeys\":[{\"name\":\"components_project_cat_and_tags_tags_links_fk\",\"columns\":[\"cat_and_tag_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"components_project_cat_and_tags\",\"onDelete\":\"CASCADE\"},{\"name\":\"components_project_cat_and_tags_tags_links_inv_fk\",\"columns\":[\"tag_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"tags\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"cat_and_tag_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"tag_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true}]},{\"name\":\"components_user_app_notifications_components\",\"indexes\":[{\"name\":\"components_user_app_notifications_field_index\",\"columns\":[\"field\"],\"type\":null},{\"name\":\"components_user_app_notifications_component_type_index\",\"columns\":[\"component_type\"],\"type\":null},{\"name\":\"components_user_app_notifications_entity_fk\",\"columns\":[\"entity_id\"]}],\"foreignKeys\":[{\"name\":\"components_user_app_notifications_entity_fk\",\"columns\":[\"entity_id\"],\"referencedColumns\":[\"id\"],\"referencedTable\":\"components_user_app_notifications\",\"onDelete\":\"CASCADE\"}],\"columns\":[{\"name\":\"id\",\"type\":\"increments\",\"args\":[{\"primary\":true,\"primaryKey\":true}],\"defaultTo\":null,\"notNullable\":true,\"unsigned\":false},{\"name\":\"entity_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_id\",\"type\":\"integer\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":true},{\"name\":\"component_type\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"field\",\"type\":\"string\",\"args\":[],\"defaultTo\":null,\"notNullable\":false,\"unsigned\":false},{\"name\":\"order\",\"type\":\"integer\",\"args\":[],\"defaultTo\":0,\"notNullable\":false,\"unsigned\":true}]}]}','2022-04-04 14:17:21','22ce3f30c46ebd0d1d361616bc235dcb');
/*!40000 ALTER TABLE `strapi_database_schema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_migrations`
--

DROP TABLE IF EXISTS `strapi_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `strapi_migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_migrations`
--

LOCK TABLES `strapi_migrations` WRITE;
/*!40000 ALTER TABLE `strapi_migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_webhooks`
--

DROP TABLE IF EXISTS `strapi_webhooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `strapi_webhooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `headers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`headers`)),
  `events` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`events`)),
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_webhooks`
--

LOCK TABLES `strapi_webhooks` WRITE;
/*!40000 ALTER TABLE `strapi_webhooks` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_webhooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tags_created_by_id_fk` (`created_by_id`),
  KEY `tags_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `tags_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `tags_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'Donec quam felis','2022-03-20 04:13:48.064000','2022-03-20 04:13:48.064000',1,1),(2,'Nullam quis ante','2022-03-20 04:13:53.940000','2022-03-20 04:13:53.940000',1,1),(3,'Aenean leo ligula','2022-03-20 04:13:59.197000','2022-03-20 04:13:59.197000',1,1);
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `up_permissions`
--

DROP TABLE IF EXISTS `up_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `up_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `up_permissions_created_by_id_fk` (`created_by_id`),
  KEY `up_permissions_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `up_permissions_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `up_permissions_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `up_permissions`
--

LOCK TABLES `up_permissions` WRITE;
/*!40000 ALTER TABLE `up_permissions` DISABLE KEYS */;
INSERT INTO `up_permissions` VALUES (1,'plugin::users-permissions.auth.connect','2022-03-16 09:45:36.984000','2022-03-16 09:45:36.984000',NULL,NULL),(2,'plugin::users-permissions.user.me','2022-03-16 09:45:36.984000','2022-03-16 09:45:36.984000',NULL,NULL),(5,'plugin::users-permissions.auth.callback','2022-03-16 09:45:37.005000','2022-03-16 09:45:37.005000',NULL,NULL),(6,'plugin::users-permissions.auth.connect','2022-03-16 09:45:37.006000','2022-03-16 09:45:37.006000',NULL,NULL),(9,'plugin::users-permissions.auth.register','2022-03-16 09:45:37.006000','2022-03-16 09:45:37.006000',NULL,NULL),(11,'plugin::users-permissions.user.me','2022-03-16 09:45:37.006000','2022-03-16 09:45:37.006000',NULL,NULL),(12,'api::user-detail.user-detail.find','2022-03-18 22:59:26.528000','2022-03-18 22:59:26.528000',NULL,NULL),(13,'api::user-detail.user-detail.create','2022-03-18 22:59:26.528000','2022-03-18 22:59:26.528000',NULL,NULL),(14,'api::user-detail.user-detail.update','2022-03-18 22:59:26.528000','2022-03-18 22:59:26.528000',NULL,NULL),(15,'plugin::users-permissions.user.find','2022-03-19 22:26:46.072000','2022-03-19 22:26:46.072000',NULL,NULL),(16,'plugin::users-permissions.user.findOne','2022-03-19 22:26:46.072000','2022-03-19 22:26:46.072000',NULL,NULL),(17,'api::category.category.find','2022-03-20 03:56:53.430000','2022-03-20 03:56:53.430000',NULL,NULL),(18,'api::category.category.find','2022-03-20 03:57:48.373000','2022-03-20 03:57:48.373000',NULL,NULL),(19,'api::category.category.create','2022-03-20 03:57:48.373000','2022-03-20 03:57:48.373000',NULL,NULL),(20,'api::category.category.update','2022-03-20 03:57:48.373000','2022-03-20 03:57:48.373000',NULL,NULL),(21,'api::category.category.delete','2022-03-20 03:57:48.373000','2022-03-20 03:57:48.373000',NULL,NULL),(22,'api::tag.tag.create','2022-03-20 04:10:42.755000','2022-03-20 04:10:42.755000',NULL,NULL),(23,'api::tag.tag.update','2022-03-20 04:10:42.755000','2022-03-20 04:10:42.755000',NULL,NULL),(24,'api::tag.tag.delete','2022-03-20 04:10:42.755000','2022-03-20 04:10:42.755000',NULL,NULL),(25,'api::tag.tag.find','2022-03-20 04:10:42.755000','2022-03-20 04:10:42.755000',NULL,NULL),(26,'api::category.category.find','2022-03-20 04:11:07.546000','2022-03-20 04:11:07.546000',NULL,NULL),(27,'api::tag.tag.find','2022-03-20 04:11:07.546000','2022-03-20 04:11:07.546000',NULL,NULL),(28,'api::tag.tag.find','2022-03-20 04:11:46.593000','2022-03-20 04:11:46.593000',NULL,NULL),(30,'plugin::upload.content-api.destroy','2022-03-20 04:11:46.593000','2022-03-20 04:11:46.593000',NULL,NULL),(31,'plugin::upload.content-api.upload','2022-03-20 04:11:46.593000','2022-03-20 04:11:46.593000',NULL,NULL),(32,'api::municipality.municipality.find','2022-03-20 05:36:40.563000','2022-03-20 05:36:40.563000',NULL,NULL),(33,'api::municipality.municipality.find','2022-03-20 05:36:53.346000','2022-03-20 05:36:53.346000',NULL,NULL),(34,'api::municipality.municipality.findOne','2022-03-20 05:36:53.346000','2022-03-20 05:36:53.346000',NULL,NULL),(35,'api::municipality.municipality.create','2022-03-20 05:36:53.346000','2022-03-20 05:36:53.346000',NULL,NULL),(36,'api::municipality.municipality.update','2022-03-20 05:36:53.346000','2022-03-20 05:36:53.346000',NULL,NULL),(37,'api::municipality.municipality.delete','2022-03-20 05:36:53.346000','2022-03-20 05:36:53.346000',NULL,NULL),(38,'api::municipality.municipality.find','2022-03-20 18:21:10.329000','2022-03-20 18:21:10.329000',NULL,NULL),(41,'api::project.project.find','2022-04-03 15:34:52.582000','2022-04-03 15:34:52.582000',NULL,NULL),(42,'api::project.project.findOne','2022-04-03 15:34:52.582000','2022-04-03 15:34:52.582000',NULL,NULL),(43,'api::category.category.findOne','2022-04-04 10:45:24.833000','2022-04-04 10:45:24.833000',NULL,NULL),(44,'api::project.project.find','2022-04-04 10:45:24.833000','2022-04-04 10:45:24.833000',NULL,NULL),(45,'api::project.project.findOne','2022-04-04 10:45:24.833000','2022-04-04 10:45:24.833000',NULL,NULL),(46,'api::project.project.create','2022-04-04 10:45:24.833000','2022-04-04 10:45:24.833000',NULL,NULL),(47,'api::project.project.update','2022-04-04 10:45:24.833000','2022-04-04 10:45:24.833000',NULL,NULL),(48,'api::tag.tag.findOne','2022-04-04 10:45:24.833000','2022-04-04 10:45:24.833000',NULL,NULL),(49,'api::user-detail.user-detail.create','2022-04-04 10:45:24.833000','2022-04-04 10:45:24.833000',NULL,NULL),(50,'api::user-detail.user-detail.findOne','2022-04-04 10:45:24.833000','2022-04-04 10:45:24.833000',NULL,NULL),(51,'api::user-detail.user-detail.find','2022-04-04 10:45:24.833000','2022-04-04 10:45:24.833000',NULL,NULL),(52,'api::user-detail.user-detail.update','2022-04-04 10:45:24.833000','2022-04-04 10:45:24.833000',NULL,NULL),(53,'api::user-detail.user-detail.delete','2022-04-04 10:45:24.833000','2022-04-04 10:45:24.833000',NULL,NULL),(54,'api::category.category.findOne','2022-04-04 10:45:53.943000','2022-04-04 10:45:53.943000',NULL,NULL),(60,'plugin::upload.content-api.destroy','2022-04-04 12:06:27.211000','2022-04-04 12:06:27.211000',NULL,NULL),(61,'plugin::upload.content-api.upload','2022-04-04 12:06:27.211000','2022-04-04 12:06:27.211000',NULL,NULL),(62,'api::watchlist.watchlist.find','2022-04-04 13:40:43.654000','2022-04-04 13:40:43.654000',NULL,NULL),(63,'api::watchlist.watchlist.findOne','2022-04-04 13:40:43.654000','2022-04-04 13:40:43.654000',NULL,NULL),(64,'api::watchlist.watchlist.create','2022-04-04 13:40:43.654000','2022-04-04 13:40:43.654000',NULL,NULL),(65,'api::watchlist.watchlist.delete','2022-04-04 13:40:43.654000','2022-04-04 13:40:43.654000',NULL,NULL),(66,'api::watchlist.watchlist.find','2022-04-04 13:40:52.495000','2022-04-04 13:40:52.495000',NULL,NULL),(67,'api::watchlist.watchlist.findOne','2022-04-04 13:40:52.495000','2022-04-04 13:40:52.495000',NULL,NULL),(68,'api::watchlist.watchlist.create','2022-04-04 13:40:52.495000','2022-04-04 13:40:52.495000',NULL,NULL),(69,'api::watchlist.watchlist.delete','2022-04-04 13:40:52.495000','2022-04-04 13:40:52.495000',NULL,NULL);
/*!40000 ALTER TABLE `up_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `up_permissions_role_links`
--

DROP TABLE IF EXISTS `up_permissions_role_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `up_permissions_role_links` (
  `permission_id` int(10) unsigned DEFAULT NULL,
  `role_id` int(10) unsigned DEFAULT NULL,
  KEY `up_permissions_role_links_fk` (`permission_id`),
  KEY `up_permissions_role_links_inv_fk` (`role_id`),
  CONSTRAINT `up_permissions_role_links_fk` FOREIGN KEY (`permission_id`) REFERENCES `up_permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `up_permissions_role_links_inv_fk` FOREIGN KEY (`role_id`) REFERENCES `up_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `up_permissions_role_links`
--

LOCK TABLES `up_permissions_role_links` WRITE;
/*!40000 ALTER TABLE `up_permissions_role_links` DISABLE KEYS */;
INSERT INTO `up_permissions_role_links` VALUES (1,1),(2,1),(5,2),(6,2),(9,2),(11,2),(12,1),(14,1),(13,1),(15,1),(16,1),(17,1),(18,4),(19,4),(20,4),(21,4),(22,4),(25,4),(23,4),(24,4),(26,2),(27,2),(28,1),(30,1),(31,1),(32,2),(33,4),(34,4),(35,4),(37,4),(36,4),(38,1),(42,1),(41,1),(43,4),(44,4),(45,4),(47,4),(46,4),(49,4),(48,4),(52,4),(50,4),(53,4),(51,4),(54,1),(61,4),(60,4),(63,1),(62,1),(64,1),(65,1),(66,4),(68,4),(69,4),(67,4);
/*!40000 ALTER TABLE `up_permissions_role_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `up_roles`
--

DROP TABLE IF EXISTS `up_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `up_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `up_roles_created_by_id_fk` (`created_by_id`),
  KEY `up_roles_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `up_roles_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `up_roles_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `up_roles`
--

LOCK TABLES `up_roles` WRITE;
/*!40000 ALTER TABLE `up_roles` DISABLE KEYS */;
INSERT INTO `up_roles` VALUES (1,'user','Default role given to authenticated user.','authenticated','2022-03-16 09:45:36.965000','2022-04-04 13:40:43.649000',NULL,NULL),(2,'Public','Default role given to unauthenticated user.','public','2022-03-16 09:45:36.973000','2022-04-04 12:08:19.957000',NULL,NULL),(4,'Admin','Admin user with access to all features ','admin','2022-03-16 10:44:11.462000','2022-04-04 13:40:52.490000',NULL,NULL);
/*!40000 ALTER TABLE `up_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `up_users`
--

DROP TABLE IF EXISTS `up_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `up_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reset_password_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirmed` tinyint(1) DEFAULT NULL,
  `blocked` tinyint(1) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `up_users_created_by_id_fk` (`created_by_id`),
  KEY `up_users_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `up_users_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `up_users_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `up_users`
--

LOCK TABLES `up_users` WRITE;
/*!40000 ALTER TABLE `up_users` DISABLE KEYS */;
INSERT INTO `up_users` VALUES (1,'admin','admin@test.com','local','$2a$10$mid5Iq4UMlbar6SBIxHO6O.qj7f3dyWlbCBI5yKOMf1WEtGMZ3C1e',NULL,NULL,1,0,'2022-03-16 09:57:19.609000','2022-03-18 21:39:29.493000',1,1),(2,'bilend','bilend@test.test','local','$2a$10$DhibtY/XiAPDnTgTqRk/wejY6oAffVuNfttHJrUqIbNz1YXfe.h4S',NULL,NULL,1,0,'2022-03-18 21:34:19.674000','2022-03-18 22:43:09.184000',1,1),(4,'user001','user@test.test','local','$2a$10$Yk5rqPSiqi2lGc..9N3CJuMj7rjP3Z.zgvEizpVtkMWiqtaP921NW',NULL,NULL,1,0,'2022-03-18 22:59:47.582000','2022-03-18 22:59:47.582000',NULL,NULL),(5,'user002','user2@test.test','local','$2a$10$UNh9jdHNdFeaZvEYYUcJKOOthch7lBybc0pLdg/m16D7Q.gLB2JF.',NULL,NULL,1,0,'2022-03-19 21:33:43.603000','2022-03-19 21:33:43.603000',NULL,NULL),(7,'red','alert@gmail.com','local','$2a$10$NGEkZ/PYbaWa9oeMrC40je0GQ8k/qoHrZyNnoJMr1A/Fq6NSIOeWu',NULL,NULL,1,0,'2022-03-20 05:42:37.012000','2022-03-20 05:42:37.012000',NULL,NULL),(8,'redyr','alert2@gmail.com','local','$2a$10$rE9gWwqYGyIeHf.t8rZh/uqKAZFYP8/71rOF9FTJ3aRc0bVUST18.',NULL,NULL,1,0,'2022-03-20 05:46:31.514000','2022-03-20 05:46:31.514000',NULL,NULL),(9,'yuri','revenge@gmail.com','local','$2a$10$t2sh7a636iAnPqgJMFQmb.S5BCWd8JfEYZg05VlGTIYTJ9AlvJAoe',NULL,NULL,1,0,'2022-03-20 05:47:20.688000','2022-03-20 05:47:20.688000',NULL,NULL),(10,'ameentest','test@gmail.com','local','$2a$10$mKeKpnV1pI7bWOa/PThJs.YIODZiKDGGcpuD39e6O2lkffIaSm9KS',NULL,NULL,1,0,'2022-03-20 05:54:08.297000','2022-03-20 05:54:08.297000',NULL,NULL),(11,'user008','user8@test.test','local','$2a$10$iyEd1WDooyr0oMA04sXrrufFY2ItyhQGHJ56mbxo61An7JaHSlEvu',NULL,NULL,1,0,'2022-03-20 05:54:42.209000','2022-03-20 05:54:42.209000',NULL,NULL),(12,'user006','alameen.azad@kruschecompany.com','local','$2a$10$QrYOK6fmcJaIkew4bPBQKe3tSDJwlveDxHN00V92AD/bt4nN341Q.',NULL,NULL,1,0,'2022-03-20 05:55:12.399000','2022-03-20 05:55:12.399000',NULL,NULL),(13,'dmr','shamel@gmail.com','local','$2a$10$xEjDv6TgtW2j99t5NnKc9uCBjZahT0UxmRHdAzXUY/GLH5Ejmub/q',NULL,NULL,1,0,'2022-03-20 17:41:36.764000','2022-03-20 17:41:36.764000',NULL,NULL),(14,'red3','gene@gmail.com','local','$2a$10$Rf12c5H8UsdcGgMn8K1tXudBaYAW9QIonqC9CaZRTqZ9s30A/p.me',NULL,NULL,1,0,'2022-03-20 18:18:32.955000','2022-03-20 18:18:32.955000',NULL,NULL),(15,'doisajd','ksjdl@gmail.com','local','$2a$10$3f1cbRxCPoZJ0VYr7/yih.cDS5IcLJuC94nFNbKu1AYbu4QPFsLui',NULL,NULL,1,0,'2022-03-20 18:26:43.230000','2022-03-20 18:26:43.230000',NULL,NULL),(16,'monster','lewis44@gmail.com','local','$2a$10$wBKepyfIievoPjcyyOZ6i..uBqUuSLLyDKU7VqUQ.6v.uJ7Txq4Ui',NULL,NULL,1,0,'2022-03-20 19:15:12.943000','2022-03-20 19:15:12.943000',NULL,NULL),(17,'plaw','plq@gmail.com','local','$2a$10$UOj1pKy4unBGZPwZS8gqveVcsZRpNC2tF7ZULivxE2gpxZFN8AHeS',NULL,NULL,1,0,'2022-03-20 19:18:15.892000','2022-03-20 19:18:15.892000',NULL,NULL),(18,'succc','xsss@gmail.com','local','$2a$10$Bpq0Fwn6GR7GX8vhao7y9.XBJHh2iaF9BTjXrg/U9CfC4aSjl.DPy',NULL,NULL,1,0,'2022-03-20 19:23:50.368000','2022-03-20 19:23:50.368000',NULL,NULL),(19,'poland','uk@gmail.com','local','$2a$10$4gAGf.1AZb1ewp2t/ZOdquaUbxvay2DYypWdixGOtXJXS.Yq/10jq',NULL,NULL,1,0,'2022-03-20 19:31:52.109000','2022-03-20 19:31:52.109000',NULL,NULL),(20,'fjdoisj','ameen@gmail.com','local','$2a$10$jKoMPTJQ5srVueTi1ypbeuNjo0rbwlCSBybeOiqrz1JgFMKe8wo26',NULL,NULL,1,0,'2022-03-20 19:35:21.104000','2022-03-20 19:35:21.104000',NULL,NULL),(21,'user009','alameen.azad2@kruschecompany.com','local','$2a$10$DdAW/YiU9TvfKpJX9VHJ5ePLnOvKcgAMzLTWOikHLcKZzO72H5BLu',NULL,NULL,1,0,'2022-03-20 19:41:02.269000','2022-03-20 19:41:02.269000',NULL,NULL),(22,'basha','mero@gmail.com','local','$2a$10$H/LJlvNABmXEaUzV5QyeXOuOiSizyI2PR9/BTBxSA11O1is1woYDu',NULL,NULL,1,0,'2022-03-20 19:52:26.521000','2022-03-20 19:52:26.521000',NULL,NULL),(23,'user0088','alameen.azad23@kruschecompany.com','local','$2a$10$Obl8kldQOdC5ysOicG3Q4.T1Mx8CLnprYDFeR90BFn7IRDJyXgGvS',NULL,NULL,1,0,'2022-04-03 14:18:34.198000','2022-04-03 14:18:34.198000',NULL,NULL),(24,'user00885','alameen.azad235@kruschecompany.com','local','$2a$10$321DBoqYyrP4ODr6odtIdeGwVhhkV1EpTNl4UWQn3OtIdWf0YDBXG',NULL,NULL,0,0,'2022-04-03 14:22:22.964000','2022-04-03 14:53:31.990000',NULL,1);
/*!40000 ALTER TABLE `up_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `up_users_project_reader_links`
--

DROP TABLE IF EXISTS `up_users_project_reader_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `up_users_project_reader_links` (
  `user_id` int(10) unsigned DEFAULT NULL,
  `project_id` int(10) unsigned DEFAULT NULL,
  KEY `up_users_project_reader_links_fk` (`user_id`),
  KEY `up_users_project_reader_links_inv_fk` (`project_id`),
  CONSTRAINT `up_users_project_reader_links_fk` FOREIGN KEY (`user_id`) REFERENCES `up_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `up_users_project_reader_links_inv_fk` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `up_users_project_reader_links`
--

LOCK TABLES `up_users_project_reader_links` WRITE;
/*!40000 ALTER TABLE `up_users_project_reader_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `up_users_project_reader_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `up_users_role_links`
--

DROP TABLE IF EXISTS `up_users_role_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `up_users_role_links` (
  `user_id` int(10) unsigned DEFAULT NULL,
  `role_id` int(10) unsigned DEFAULT NULL,
  KEY `up_users_role_links_fk` (`user_id`),
  KEY `up_users_role_links_inv_fk` (`role_id`),
  CONSTRAINT `up_users_role_links_fk` FOREIGN KEY (`user_id`) REFERENCES `up_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `up_users_role_links_inv_fk` FOREIGN KEY (`role_id`) REFERENCES `up_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `up_users_role_links`
--

LOCK TABLES `up_users_role_links` WRITE;
/*!40000 ALTER TABLE `up_users_role_links` DISABLE KEYS */;
INSERT INTO `up_users_role_links` VALUES (1,4),(2,2),(4,1),(5,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1);
/*!40000 ALTER TABLE `up_users_role_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_details`
--

DROP TABLE IF EXISTS `user_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_privacy` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_details_created_by_id_fk` (`created_by_id`),
  KEY `user_details_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `user_details_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `user_details_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_details`
--

LOCK TABLES `user_details` WRITE;
/*!40000 ALTER TABLE `user_details` DISABLE KEYS */;
INSERT INTO `user_details` VALUES (1,'alameen','2022-03-18 22:17:25.326000','2022-03-18 23:41:11.997000',1,1,'2398273497','Home',NULL),(2,'bilend','2022-03-18 23:50:31.422000','2022-03-19 00:50:59.917000',NULL,1,'555555','Nali',NULL),(17,'bilend5','2022-03-19 23:56:44.176000','2022-03-19 23:56:44.176000',NULL,NULL,'666666','Nali',NULL),(19,'meroo','2022-03-20 19:45:13.578000','2022-03-20 19:45:13.578000',NULL,NULL,'4324324324','dfdsfds',0),(20,'bilend57','2022-03-20 19:47:56.981000','2022-03-20 20:58:55.070000',NULL,1,'666666','Nali',0),(21,'basha','2022-03-20 19:52:44.506000','2022-03-20 19:52:44.506000',NULL,NULL,'342432','suli',0);
/*!40000 ALTER TABLE `user_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_details_components`
--

DROP TABLE IF EXISTS `user_details_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_details_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int(10) unsigned DEFAULT NULL,
  `component_id` int(10) unsigned DEFAULT NULL,
  `component_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(10) unsigned DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `user_details_field_index` (`field`),
  KEY `user_details_component_type_index` (`component_type`),
  KEY `user_details_entity_fk` (`entity_id`),
  CONSTRAINT `user_details_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `user_details` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_details_components`
--

LOCK TABLES `user_details_components` WRITE;
/*!40000 ALTER TABLE `user_details_components` DISABLE KEYS */;
INSERT INTO `user_details_components` VALUES (2,1,1,'user.app-notifications','notifications',1),(6,17,4,'user.app-notifications','notifications',1),(8,19,6,'user.app-notifications','notifications',1),(11,21,8,'user.app-notifications','notifications',1),(12,20,7,'user.app-notifications','notifications',1);
/*!40000 ALTER TABLE `user_details_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_details_municipality_links`
--

DROP TABLE IF EXISTS `user_details_municipality_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_details_municipality_links` (
  `user_detail_id` int(10) unsigned DEFAULT NULL,
  `municipality_id` int(10) unsigned DEFAULT NULL,
  KEY `user_details_municipality_links_fk` (`user_detail_id`),
  KEY `user_details_municipality_links_inv_fk` (`municipality_id`),
  CONSTRAINT `user_details_municipality_links_fk` FOREIGN KEY (`user_detail_id`) REFERENCES `user_details` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_details_municipality_links_inv_fk` FOREIGN KEY (`municipality_id`) REFERENCES `municipalities` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_details_municipality_links`
--

LOCK TABLES `user_details_municipality_links` WRITE;
/*!40000 ALTER TABLE `user_details_municipality_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_details_municipality_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_details_user_links`
--

DROP TABLE IF EXISTS `user_details_user_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_details_user_links` (
  `user_detail_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  KEY `user_details_user_links_fk` (`user_detail_id`),
  KEY `user_details_user_links_inv_fk` (`user_id`),
  CONSTRAINT `user_details_user_links_fk` FOREIGN KEY (`user_detail_id`) REFERENCES `user_details` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_details_user_links_inv_fk` FOREIGN KEY (`user_id`) REFERENCES `up_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_details_user_links`
--

LOCK TABLES `user_details_user_links` WRITE;
/*!40000 ALTER TABLE `user_details_user_links` DISABLE KEYS */;
INSERT INTO `user_details_user_links` VALUES (1,1),(2,2),(17,4),(19,20),(21,22),(20,21);
/*!40000 ALTER TABLE `user_details_user_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watchlists`
--

DROP TABLE IF EXISTS `watchlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `watchlists` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `created_by_id` int(10) unsigned DEFAULT NULL,
  `updated_by_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `watchlists_created_by_id_fk` (`created_by_id`),
  KEY `watchlists_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `watchlists_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `watchlists_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watchlists`
--

LOCK TABLES `watchlists` WRITE;
/*!40000 ALTER TABLE `watchlists` DISABLE KEYS */;
INSERT INTO `watchlists` VALUES (1,'2022-04-04 13:38:19.608000','2022-04-04 13:38:19.608000',1,1);
/*!40000 ALTER TABLE `watchlists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watchlists_project_links`
--

DROP TABLE IF EXISTS `watchlists_project_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `watchlists_project_links` (
  `watchlist_id` int(10) unsigned DEFAULT NULL,
  `project_id` int(10) unsigned DEFAULT NULL,
  KEY `watchlists_project_links_fk` (`watchlist_id`),
  KEY `watchlists_project_links_inv_fk` (`project_id`),
  CONSTRAINT `watchlists_project_links_fk` FOREIGN KEY (`watchlist_id`) REFERENCES `watchlists` (`id`) ON DELETE CASCADE,
  CONSTRAINT `watchlists_project_links_inv_fk` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watchlists_project_links`
--

LOCK TABLES `watchlists_project_links` WRITE;
/*!40000 ALTER TABLE `watchlists_project_links` DISABLE KEYS */;
INSERT INTO `watchlists_project_links` VALUES (1,2);
/*!40000 ALTER TABLE `watchlists_project_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watchlists_user_links`
--

DROP TABLE IF EXISTS `watchlists_user_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `watchlists_user_links` (
  `watchlist_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  KEY `watchlists_user_links_fk` (`watchlist_id`),
  KEY `watchlists_user_links_inv_fk` (`user_id`),
  CONSTRAINT `watchlists_user_links_fk` FOREIGN KEY (`watchlist_id`) REFERENCES `watchlists` (`id`) ON DELETE CASCADE,
  CONSTRAINT `watchlists_user_links_inv_fk` FOREIGN KEY (`user_id`) REFERENCES `up_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watchlists_user_links`
--

LOCK TABLES `watchlists_user_links` WRITE;
/*!40000 ALTER TABLE `watchlists_user_links` DISABLE KEYS */;
INSERT INTO `watchlists_user_links` VALUES (1,2);
/*!40000 ALTER TABLE `watchlists_user_links` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-04 15:44:38
