-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: hrms_portal
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `employee_contracts`
--

DROP TABLE IF EXISTS `employee_contracts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_contracts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `parent_contract_id` bigint unsigned DEFAULT NULL,
  `from_date` date NOT NULL,
  `to_date` date DEFAULT NULL,
  `contract_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'onsite',
  `project_id` bigint unsigned DEFAULT NULL,
  `project_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_id` bigint unsigned DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_rate` decimal(10,2) DEFAULT NULL,
  `rate_currency_id` bigint unsigned DEFAULT NULL,
  `rate_frequency` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'monthly',
  `vendor_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `po_number` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_renewable` tinyint(1) DEFAULT '0',
  `status` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'active',
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint unsigned NOT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_contracts_company_id_foreign` (`company_id`),
  KEY `employee_contracts_user_id_foreign` (`user_id`),
  KEY `employee_contracts_parent_contract_id_foreign` (`parent_contract_id`),
  KEY `employee_contracts_project_id_foreign` (`project_id`),
  KEY `employee_contracts_location_id_foreign` (`location_id`),
  KEY `employee_contracts_rate_currency_id_foreign` (`rate_currency_id`),
  KEY `employee_contracts_created_by_foreign` (`created_by`),
  KEY `employee_contracts_updated_by_foreign` (`updated_by`),
  KEY `employee_contracts_deleted_by_foreign` (`deleted_by`),
  CONSTRAINT `employee_contracts_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `employee_contracts_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `employee_contracts_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `employee_contracts_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `employee_contracts_parent_contract_id_foreign` FOREIGN KEY (`parent_contract_id`) REFERENCES `employee_contracts` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `employee_contracts_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `employee_contracts_rate_currency_id_foreign` FOREIGN KEY (`rate_currency_id`) REFERENCES `currencies` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `employee_contracts_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `employee_contracts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-23 22:54:41
