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
-- Table structure for table `shift_time_settings`
--

DROP TABLE IF EXISTS `shift_time_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shift_time_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shift_id` bigint unsigned NOT NULL,
  `shift_type` enum('day_shift','night_shift') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_shift` tinyint NOT NULL DEFAULT '0',
  `is_24_hour` tinyint NOT NULL DEFAULT '0',
  `in_time` time DEFAULT NULL,
  `out_time` time DEFAULT NULL,
  `punch_begin_before` tinyint NOT NULL DEFAULT '0',
  `punch_begin_before_minutes` int DEFAULT NULL,
  `punch_end_after` tinyint NOT NULL DEFAULT '0',
  `punch_end_after_minutes` int DEFAULT NULL,
  `break_1_start` time DEFAULT NULL,
  `break_1_end` time DEFAULT NULL,
  `break_2_start` time DEFAULT NULL,
  `break_2_end` time DEFAULT NULL,
  `weekoff_1_day` int DEFAULT NULL,
  `weekoff_1_applicable_on` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weekoff_2_day` int DEFAULT NULL,
  `weekoff_2_applicable_on` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weekoff_3_day` int DEFAULT NULL,
  `weekoff_3_applicable_on` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ot_consider_after_shift_ends` tinyint NOT NULL DEFAULT '0',
  `ot_minimum_minutes_after_shift_ends` int DEFAULT NULL,
  `ot_maximum_minutes_after_shift_ends` int DEFAULT NULL,
  `ot_consider_before_shift_starts` tinyint NOT NULL DEFAULT '0',
  `ot_minimum_minutes_before_shift_starts` int DEFAULT NULL,
  `ot_maximum_minutes_before_shift_starts` int DEFAULT NULL,
  `partial_on_day` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `partial_begin_at` time DEFAULT NULL,
  `partial_end_at` time DEFAULT NULL,
  `partial_minimum_working_time_for_full_day` int DEFAULT NULL,
  `partial_minimum_working_time_for_half_day` int DEFAULT NULL,
  `le_adjust_late_coming_with_late_go` tinyint NOT NULL DEFAULT '0',
  `le_adjust_late_coming_with_late_go_minutes` int DEFAULT NULL,
  `le_adjust_early_coming_with_early_go` tinyint NOT NULL DEFAULT '0',
  `le_adjust_early_coming_with_early_go_minutes` int DEFAULT NULL,
  `le_late_minutes` int DEFAULT NULL,
  `le_grace_late_marks` int DEFAULT NULL,
  `le_deduction` enum('hours','halfday','fullday') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `le_consider_ab_every_after_late_marks` int DEFAULT NULL,
  `le_allow_late_working_minutes` int DEFAULT NULL,
  `le_allow_late_coming_next_day_minutes` int DEFAULT NULL,
  `created_by` bigint unsigned NOT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shift_time_settings_shift_id_foreign` (`shift_id`),
  KEY `shift_time_settings_created_by_foreign` (`created_by`),
  KEY `shift_time_settings_updated_by_foreign` (`updated_by`),
  KEY `shift_time_settings_deleted_by_foreign` (`deleted_by`),
  CONSTRAINT `shift_time_settings_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `shift_time_settings_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `shift_time_settings_shift_id_foreign` FOREIGN KEY (`shift_id`) REFERENCES `shifts` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `shift_time_settings_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE RESTRICT
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

-- Dump completed on 2025-08-23 22:54:22
