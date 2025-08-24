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
-- Table structure for table `shift_general_settings`
--

DROP TABLE IF EXISTS `shift_general_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shift_general_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shift_id` bigint unsigned NOT NULL,
  `consider_first_and_last_punch_for_work` tinyint NOT NULL DEFAULT '0',
  `break_time_deduction_first_break` tinyint NOT NULL DEFAULT '0',
  `break_time_deduction_second_break` tinyint NOT NULL DEFAULT '0',
  `consider_present_if_single_punch` tinyint NOT NULL DEFAULT '0',
  `consider_half_day_if_single_punch` tinyint NOT NULL DEFAULT '0',
  `consider_half_day_if_odd_punch` tinyint NOT NULL DEFAULT '0',
  `neglect_last_punch_if_odd_punch` tinyint NOT NULL DEFAULT '0',
  `auto_shift_assign` tinyint NOT NULL DEFAULT '0',
  `min_working_time_for_full_day` int DEFAULT NULL,
  `min_working_time_for_half_day` int DEFAULT NULL,
  `min_for_full_co` int DEFAULT NULL,
  `min_for_half_co` int DEFAULT NULL,
  `mark_full_co_on_wd_if_ot_work_hour_greater` int DEFAULT NULL,
  `mark_half_co_on_wd_if_ot_work_hour_greater` int DEFAULT NULL,
  `mark_wo_as_ab_on_absent_count` int DEFAULT NULL,
  `wo_not_assigned_if_absent_in_a_week_greater_days` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `co_on_single_punch_on_wo_ph` tinyint NOT NULL DEFAULT '0',
  `monthly_free_minutes` int DEFAULT NULL,
  `mark_ph_as_ab_if_prefix_absent` tinyint NOT NULL DEFAULT '0',
  `mark_wo_as_ab_if_prefix_absent` tinyint NOT NULL DEFAULT '0',
  `mark_ph_as_ab_if_suffix_absent` tinyint NOT NULL DEFAULT '0',
  `mark_wo_as_ab_if_suffix_absent` tinyint NOT NULL DEFAULT '0',
  `mark_ph_as_ab_if_prefix_and_suffix_absent` tinyint NOT NULL DEFAULT '0',
  `mark_wo_as_ab_if_prefix_and_suffix_absent` tinyint NOT NULL DEFAULT '0',
  `consider_ph_work_as_ot` tinyint NOT NULL DEFAULT '0',
  `consider_wo_work_as_ot` tinyint NOT NULL DEFAULT '0',
  `consider_ph_work_as_double_co` tinyint NOT NULL DEFAULT '0',
  `consider_wo_work_as_double_co` tinyint NOT NULL DEFAULT '0',
  `created_by` bigint unsigned NOT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shift_general_settings_shift_id_foreign` (`shift_id`),
  KEY `shift_general_settings_created_by_foreign` (`created_by`),
  KEY `shift_general_settings_updated_by_foreign` (`updated_by`),
  KEY `shift_general_settings_deleted_by_foreign` (`deleted_by`),
  CONSTRAINT `shift_general_settings_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `shift_general_settings_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `shift_general_settings_shift_id_foreign` FOREIGN KEY (`shift_id`) REFERENCES `shifts` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `shift_general_settings_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-23 22:54:48
