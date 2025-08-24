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
-- Table structure for table `employee_salary_variable_heads`
--

DROP TABLE IF EXISTS `employee_salary_variable_heads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_salary_variable_heads` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `salary_structure_id` bigint unsigned DEFAULT NULL,
  `salary_head_id` bigint unsigned NOT NULL,
  `salary_process_id` bigint unsigned DEFAULT NULL,
  `salary_process_detail_id` bigint unsigned DEFAULT NULL,
  `year` int NOT NULL,
  `month` int NOT NULL,
  `period` int NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint unsigned NOT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_salary_variable_heads_user_id_foreign` (`user_id`),
  KEY `employee_salary_variable_heads_salary_head_id_foreign` (`salary_head_id`),
  KEY `employee_salary_variable_heads_created_by_foreign` (`created_by`),
  KEY `employee_salary_variable_heads_updated_by_foreign` (`updated_by`),
  KEY `employee_salary_variable_heads_deleted_by_foreign` (`deleted_by`),
  KEY `employee_salary_variable_heads_salary_process_id_foreign` (`salary_process_id`),
  KEY `fk_salary_process_detail_id_foreign` (`salary_process_detail_id`),
  KEY `employee_salary_variable_heads_salary_structure_id_foreign` (`salary_structure_id`),
  CONSTRAINT `employee_salary_variable_heads_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `employee_salary_variable_heads_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `employee_salary_variable_heads_salary_head_id_foreign` FOREIGN KEY (`salary_head_id`) REFERENCES `salary_heads` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `employee_salary_variable_heads_salary_process_id_foreign` FOREIGN KEY (`salary_process_id`) REFERENCES `salary_processes` (`id`),
  CONSTRAINT `employee_salary_variable_heads_salary_structure_id_foreign` FOREIGN KEY (`salary_structure_id`) REFERENCES `salary_structures` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `employee_salary_variable_heads_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `employee_salary_variable_heads_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `fk_salary_process_detail_id_foreign` FOREIGN KEY (`salary_process_detail_id`) REFERENCES `salary_process_details` (`id`) ON DELETE RESTRICT
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

-- Dump completed on 2025-08-23 22:54:40
