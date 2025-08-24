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
-- Table structure for table `company_statutories`
--

DROP TABLE IF EXISTS `company_statutories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_statutories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` bigint unsigned NOT NULL,
  `gst_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sss_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phil_health_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hdmf_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phic_applicable` tinyint(1) NOT NULL DEFAULT '0',
  `phic_applicable_employee_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phic_employer_share_rate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phic_employer_unit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phic_employee_share_rate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phic_employee_unit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pag_ibig_applicable` tinyint(1) NOT NULL DEFAULT '0',
  `pag_ibig_applicable_employee_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pag_ibig_employer_share_rate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pag_ibig_employer_unit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pag_ibig_employee_share_rate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pag_ibig_employee_unit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sss_applicable` tinyint(1) NOT NULL DEFAULT '0',
  `sss_applicable_employee_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_applicable` tinyint(1) NOT NULL DEFAULT '0',
  `tax_applicable_employee_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thirteen_month_applicable` tinyint(1) NOT NULL DEFAULT '0',
  `thirteen_month_applicable_employee_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bonus_applicable` tinyint(1) NOT NULL DEFAULT '0',
  `bonus_applicable_employee_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ot_applicable` tinyint(1) NOT NULL DEFAULT '0',
  `ot_applicable_employee_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint unsigned NOT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `company_statutories_company_id_foreign` (`company_id`),
  KEY `company_statutories_created_by_foreign` (`created_by`),
  KEY `company_statutories_updated_by_foreign` (`updated_by`),
  KEY `company_statutories_deleted_by_foreign` (`deleted_by`),
  CONSTRAINT `company_statutories_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `company_statutories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `company_statutories_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `company_statutories_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE RESTRICT
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

-- Dump completed on 2025-08-23 22:54:51
