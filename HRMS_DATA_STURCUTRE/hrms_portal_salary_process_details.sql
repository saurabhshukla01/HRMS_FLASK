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
-- Table structure for table `salary_process_details`
--

DROP TABLE IF EXISTS `salary_process_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salary_process_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salary_process_id` bigint unsigned NOT NULL,
  `salary_structure_id` bigint unsigned DEFAULT NULL,
  `salary_contractor_tax_setting_id` bigint unsigned DEFAULT NULL,
  `salary_from_date` date NOT NULL,
  `salary_to_date` date NOT NULL,
  `working_days` double DEFAULT NULL,
  `working_minutes` double DEFAULT NULL,
  `paid_days` double DEFAULT NULL,
  `present_days` double DEFAULT NULL,
  `wo_days` double DEFAULT NULL,
  `leave_days` double DEFAULT NULL,
  `holiday_days` double DEFAULT NULL,
  `gross_salary` decimal(10,2) DEFAULT NULL,
  `total_deduction` decimal(10,2) DEFAULT NULL,
  `net_pay` decimal(10,2) DEFAULT NULL,
  `taxable_pay` decimal(10,2) DEFAULT NULL,
  `non_taxable_pay` decimal(10,2) DEFAULT NULL,
  `sss_applicable_pay` decimal(10,2) DEFAULT NULL,
  `non_sss_applicable_pay` decimal(10,2) DEFAULT NULL,
  `pag_ibig_applicable_pay` decimal(10,2) DEFAULT NULL,
  `non_pag_ibig_applicable_pay` decimal(10,2) DEFAULT NULL,
  `phic_applicable_pay` decimal(10,2) DEFAULT NULL,
  `non_phic_applicable_pay` decimal(10,2) DEFAULT NULL,
  `thirteen_month_applicable_pay` decimal(10,2) DEFAULT NULL,
  `non_thirteen_month_applicable_pay` decimal(10,2) DEFAULT NULL,
  `month` int NOT NULL,
  `period` int NOT NULL,
  `year` int NOT NULL,
  `thirteen_month_given` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` bigint unsigned NOT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `salary_process_details_salary_process_id_foreign` (`salary_process_id`),
  KEY `salary_process_details_salary_structure_id_foreign` (`salary_structure_id`),
  KEY `salary_process_details_created_by_foreign` (`created_by`),
  KEY `salary_process_details_updated_by_foreign` (`updated_by`),
  KEY `salary_process_details_deleted_by_foreign` (`deleted_by`),
  KEY `spdetails_tax_setting_fk` (`salary_contractor_tax_setting_id`),
  CONSTRAINT `salary_process_details_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `salary_process_details_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `salary_process_details_salary_process_id_foreign` FOREIGN KEY (`salary_process_id`) REFERENCES `salary_processes` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `salary_process_details_salary_structure_id_foreign` FOREIGN KEY (`salary_structure_id`) REFERENCES `salary_structures` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `salary_process_details_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `spdetails_tax_setting_fk` FOREIGN KEY (`salary_contractor_tax_setting_id`) REFERENCES `salary_contractor_tax_settings` (`id`) ON DELETE RESTRICT
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

-- Dump completed on 2025-08-23 22:54:23
