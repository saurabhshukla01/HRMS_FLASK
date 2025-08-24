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
-- Table structure for table `salary_arrear_days`
--

DROP TABLE IF EXISTS `salary_arrear_days`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salary_arrear_days` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salary_arrear_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `shift_id` bigint unsigned DEFAULT NULL,
  `attendance_day_id` bigint unsigned DEFAULT NULL,
  `type` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `day_value` double DEFAULT NULL,
  `total_logged_min` int DEFAULT NULL,
  `date` date NOT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_second_half` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `day_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_punch` time DEFAULT NULL,
  `last_punch` time DEFAULT NULL,
  `day_timesheet_min` int DEFAULT NULL,
  `day_timesheet_approved_min` int DEFAULT NULL,
  `night_timesheet_min` int DEFAULT NULL,
  `night_timesheet_approved_min` int DEFAULT NULL,
  `total_shift_min` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `day_shift_min` int DEFAULT NULL,
  `night_shift_min` int DEFAULT NULL,
  `day_total_logged_min` int DEFAULT NULL,
  `night_total_logged_min` int DEFAULT NULL,
  `total_during_shift_logged_min` int DEFAULT NULL,
  `day_during_shift_logged_min` int DEFAULT NULL,
  `day_during_shift_logged_approved_min` int DEFAULT NULL,
  `night_during_shift_logged_min` int DEFAULT NULL,
  `night_during_shift_logged_approved_min` int DEFAULT NULL,
  `late_coming_min` int DEFAULT NULL,
  `early_leave_min` int DEFAULT NULL,
  `under_time_min` int DEFAULT NULL,
  `day_under_time_min` int DEFAULT NULL,
  `day_under_time_approved_min` int DEFAULT NULL,
  `night_under_time_min` int DEFAULT NULL,
  `night_under_time_approved_min` int DEFAULT NULL,
  `day_ot_from_time` datetime DEFAULT NULL,
  `day_ot_to_time` datetime DEFAULT NULL,
  `day_ot_applicable_min` int DEFAULT NULL,
  `day_ot_approved_min` int DEFAULT NULL,
  `night_ot_from_time` datetime DEFAULT NULL,
  `night_ot_to_time` datetime DEFAULT NULL,
  `night_ot_applicable_min` int DEFAULT NULL,
  `night_ot_approved_min` int DEFAULT NULL,
  `before_shift_extra_min` int DEFAULT NULL,
  `before_shift_ot_applicable_min` int DEFAULT NULL,
  `after_shift_extra_min` int DEFAULT NULL,
  `after_shift_ot_applicable_min` int DEFAULT NULL,
  `total_extra_min` int DEFAULT NULL,
  `total_ot_applicable_min` int DEFAULT NULL,
  `updated_remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locked` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT ' 0 => Unlocked, 1 => Locked',
  `unlocked_remark` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `unlocked_by` bigint unsigned DEFAULT NULL,
  `unlocked_at` timestamp NULL DEFAULT NULL,
  `approval_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `approval_by` int DEFAULT NULL,
  `approval_comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint unsigned NOT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `salary_arrear_days_salary_arrear_id_foreign` (`salary_arrear_id`),
  KEY `salary_arrear_days_user_id_foreign` (`user_id`),
  KEY `salary_arrear_days_shift_id_foreign` (`shift_id`),
  KEY `salary_arrear_days_attendance_day_id_foreign` (`attendance_day_id`),
  KEY `salary_arrear_days_created_by_foreign` (`created_by`),
  KEY `salary_arrear_days_updated_by_foreign` (`updated_by`),
  KEY `salary_arrear_days_deleted_by_foreign` (`deleted_by`),
  CONSTRAINT `salary_arrear_days_attendance_day_id_foreign` FOREIGN KEY (`attendance_day_id`) REFERENCES `attendance_days` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `salary_arrear_days_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `salary_arrear_days_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `salary_arrear_days_salary_arrear_id_foreign` FOREIGN KEY (`salary_arrear_id`) REFERENCES `salary_arrears` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `salary_arrear_days_shift_id_foreign` FOREIGN KEY (`shift_id`) REFERENCES `shifts` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `salary_arrear_days_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `salary_arrear_days_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT
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

-- Dump completed on 2025-08-23 22:54:34
