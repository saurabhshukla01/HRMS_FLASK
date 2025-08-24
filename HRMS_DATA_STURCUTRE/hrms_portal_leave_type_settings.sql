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
-- Table structure for table `leave_type_settings`
--

DROP TABLE IF EXISTS `leave_type_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leave_type_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `leave_type_id` bigint unsigned NOT NULL,
  `year` int DEFAULT NULL,
  `entitlement` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accural` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_of_days` decimal(8,2) NOT NULL,
  `credit_on_min_days` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credit_on_min_day_value` int DEFAULT NULL,
  `eligible_for_credit_of_leaves` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `eligible_for_credit_of_leaves_time` int DEFAULT NULL,
  `avail_after` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avail_after_time` int DEFAULT NULL,
  `leaves_credit_if_join_after` int DEFAULT NULL,
  `leaves_credit_if_join_after_value` decimal(8,2) DEFAULT NULL,
  `do_not_club_with` text COLLATE utf8mb4_unicode_ci,
  `round_of_leave_days` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `do_not_apply_leave_after` int DEFAULT NULL,
  `allow_carry_forward` tinyint NOT NULL DEFAULT '0',
  `carry_forward_limit` int DEFAULT NULL,
  `prior_approval_required` tinyint NOT NULL DEFAULT '0',
  `prior_approval_days` int DEFAULT NULL,
  `count_intervening_weekoff` tinyint NOT NULL DEFAULT '0',
  `count_intervening_holidays` tinyint NOT NULL DEFAULT '0',
  `count_intervening_od_wfh_as_co` tinyint NOT NULL DEFAULT '0',
  `allow_negative_leave_balance` tinyint NOT NULL DEFAULT '0',
  `negative_leave_balance_limit` decimal(8,2) DEFAULT NULL,
  `allow_half_days` tinyint NOT NULL DEFAULT '0',
  `allow_encashable` tinyint NOT NULL DEFAULT '0',
  `allow_encashable_value` int DEFAULT NULL,
  `min_leaves_at_once` int DEFAULT NULL,
  `max_leaves_at_once` int DEFAULT NULL,
  `min_leaves_in_month` int DEFAULT NULL,
  `max_leaves_in_month` int DEFAULT NULL,
  `max_leave_instance_in_year` int DEFAULT NULL,
  `apply_from_ess` tinyint NOT NULL DEFAULT '1',
  `display_in_payslip` tinyint NOT NULL DEFAULT '1',
  `allow_application_in_notice_period` tinyint NOT NULL DEFAULT '0',
  `allow_application_in_notice_period_value` int DEFAULT NULL,
  `document_required` tinyint NOT NULL DEFAULT '0',
  `document_required_within_days` int DEFAULT NULL,
  `pro_rata` tinyint NOT NULL DEFAULT '0',
  `shortleave_active` tinyint NOT NULL DEFAULT '0',
  `shortleave_max_hours_in_day` int DEFAULT NULL,
  `compoff_active` tinyint NOT NULL DEFAULT '0',
  `compoff_lapse` tinyint NOT NULL DEFAULT '0',
  `compoff_limit` int DEFAULT NULL,
  `onduty_active` tinyint NOT NULL DEFAULT '0',
  `onduty_on_week_off` tinyint NOT NULL DEFAULT '0',
  `onduty_on_holidays` tinyint NOT NULL DEFAULT '0',
  `onduty_on_working_days` tinyint NOT NULL DEFAULT '0',
  `remarks` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1 => Active, 0 => Inactive',
  `created_by` bigint unsigned NOT NULL,
  `updated_by` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `leave_type_settings_leave_type_id_foreign` (`leave_type_id`),
  KEY `leave_type_settings_created_by_foreign` (`created_by`),
  KEY `leave_type_settings_updated_by_foreign` (`updated_by`),
  KEY `leave_type_settings_deleted_by_foreign` (`deleted_by`),
  CONSTRAINT `leave_type_settings_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `leave_type_settings_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `leave_type_settings_leave_type_id_foreign` FOREIGN KEY (`leave_type_id`) REFERENCES `leave_types` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `leave_type_settings_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-23 22:54:28
