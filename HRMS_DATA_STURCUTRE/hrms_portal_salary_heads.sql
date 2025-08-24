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
-- Table structure for table `salary_heads`
--

DROP TABLE IF EXISTS `salary_heads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salary_heads` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` bigint unsigned NOT NULL,
  `salary_head_payment_type_id` bigint unsigned NOT NULL,
  `salary_head_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'earnings, variable_earnings, deductions, variable_deductions, others',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `round_off` enum('near','upper','down','none') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `print_order` int DEFAULT NULL,
  `phic_applicable` tinyint(1) NOT NULL DEFAULT '0',
  `pag_ibig_applicable` tinyint(1) NOT NULL DEFAULT '0',
  `sss_applicable` tinyint(1) NOT NULL DEFAULT '0',
  `tax_applicable` tinyint(1) NOT NULL DEFAULT '0',
  `thirteen_month_applicable` tinyint(1) NOT NULL DEFAULT '0',
  `leave_deduction_applicable` tinyint(1) NOT NULL DEFAULT '0',
  `absent_deduction_applicable` tinyint(1) NOT NULL DEFAULT '0',
  `late_deduction_applicable` tinyint(1) NOT NULL DEFAULT '0',
  `undertime_deduction_applicable` tinyint(1) NOT NULL DEFAULT '0',
  `variable_pay_applicable` tinyint(1) NOT NULL DEFAULT '0',
  `ot_applicable` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `formula` text COLLATE utf8mb4_unicode_ci,
  `leave_encashment` tinyint(1) NOT NULL DEFAULT '1',
  `bonus_applicable` tinyint(1) NOT NULL DEFAULT '1',
  `gratuity_applicable` tinyint(1) NOT NULL DEFAULT '1',
  `one_time_tax` tinyint(1) NOT NULL DEFAULT '1',
  `print_on_payslip` tinyint(1) NOT NULL DEFAULT '1',
  `print_on_payslip_if_zero` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` bigint unsigned NOT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `salary_heads_company_id_foreign` (`company_id`),
  KEY `salary_heads_salary_head_payment_type_id_foreign` (`salary_head_payment_type_id`),
  KEY `salary_heads_created_by_foreign` (`created_by`),
  KEY `salary_heads_updated_by_foreign` (`updated_by`),
  KEY `salary_heads_deleted_by_foreign` (`deleted_by`),
  CONSTRAINT `salary_heads_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `salary_heads_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `salary_heads_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `salary_heads_salary_head_payment_type_id_foreign` FOREIGN KEY (`salary_head_payment_type_id`) REFERENCES `salary_head_payment_types` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `salary_heads_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-23 22:54:14
