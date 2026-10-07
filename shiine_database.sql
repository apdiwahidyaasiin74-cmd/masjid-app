-- Database Backup for: shiine
-- Generated on: 2026-09-20 20:03:44
SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

DROP TABLE IF EXISTS `cache`;
CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_locks_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `committee_members`;
CREATE TABLE `committee_members` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `position` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `committee_members_user_id_foreign` (`user_id`),
  CONSTRAINT `committee_members_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `committee_members` VALUES ('1', '7', 'nimco yaasiin maxamud', '0634955678', 'nimcoyaasiin@gmail.com', 'Xoghaye', 'committee/WCyPkcJM1X1URzfgOSvH1F3MkWJSeCyGRyiXbJcr.jpg', NULL, '2026-09-15', '2028-01-19', 'active', '2026-09-15 13:01:58', '2026-09-15 13:02:16');

DROP TABLE IF EXISTS `employee_roles`;
CREATE TABLE `employee_roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employee_roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `employee_roles` VALUES ('1', 'Nadiifiye', NULL, 'active', '2026-08-29 21:05:44', '2026-09-07 22:37:17'),
('2', 'Ilaalo', NULL, 'active', '2026-08-29 21:05:44', '2026-09-07 22:37:17'),
('4', 'Hayaha Masaajidka', NULL, 'active', '2026-08-29 21:05:44', '2026-09-07 22:37:17'),
('5', 'Shaqaalaha Xafiiska', NULL, 'active', '2026-08-29 21:05:44', '2026-09-07 22:37:17');

DROP TABLE IF EXISTS `employee_warning_types`;
CREATE TABLE `employee_warning_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employee_warning_types_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `employee_warning_types` VALUES ('1', 'Cleanliness', 'Nadaafad Xumo', 'active', '2026-08-29 21:05:45', '2026-08-29 21:05:45'),
('2', 'Attendance', 'Maqnaansho ama Daahid', 'active', '2026-08-29 21:05:45', '2026-08-29 21:05:45'),
('3', 'Poor Performance', 'Shaqo Xumo', 'active', '2026-08-29 21:05:45', '2026-08-29 21:05:45'),
('4', 'Negligence', 'Kala-daadsan weyn iyo taxadar la\'aan', 'active', '2026-08-29 21:05:46', '2026-08-29 21:05:46'),
('5', 'Misconduct', 'Dhaqan Xumo', 'active', '2026-08-29 21:05:46', '2026-08-29 21:05:46'),
('6', 'Failure to Follow Instructions', 'Amar Diido ama u hoggaansami la\'aan', 'active', '2026-08-29 21:05:46', '2026-08-29 21:05:46'),
('7', 'Other', 'Kuwo Kale', 'active', '2026-08-29 21:05:46', '2026-08-29 21:05:46');

DROP TABLE IF EXISTS `employee_warnings`;
CREATE TABLE `employee_warnings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint(20) unsigned DEFAULT NULL,
  `committee_member_id` bigint(20) unsigned DEFAULT NULL,
  `imam_id` bigint(20) unsigned DEFAULT NULL,
  `warning_type_id` bigint(20) unsigned NOT NULL,
  `work_location_id` bigint(20) unsigned DEFAULT NULL,
  `creator_id` bigint(20) unsigned NOT NULL,
  `date` date NOT NULL,
  `message` text NOT NULL,
  `severity` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_warnings_employee_id_foreign` (`employee_id`),
  KEY `employee_warnings_committee_member_id_foreign` (`committee_member_id`),
  KEY `employee_warnings_imam_id_foreign` (`imam_id`),
  KEY `employee_warnings_warning_type_id_foreign` (`warning_type_id`),
  KEY `employee_warnings_work_location_id_foreign` (`work_location_id`),
  KEY `employee_warnings_creator_id_foreign` (`creator_id`),
  CONSTRAINT `employee_warnings_committee_member_id_foreign` FOREIGN KEY (`committee_member_id`) REFERENCES `committee_members` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employee_warnings_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employee_warnings_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employee_warnings_imam_id_foreign` FOREIGN KEY (`imam_id`) REFERENCES `imams` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employee_warnings_warning_type_id_foreign` FOREIGN KEY (`warning_type_id`) REFERENCES `employee_warning_types` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employee_warnings_work_location_id_foreign` FOREIGN KEY (`work_location_id`) REFERENCES `work_locations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `employee_warnings` VALUES ('1', '1', NULL, NULL, '1', '4', '2', '2026-09-01', 'Digniin outomatic ah: Waxaa laguu qoray digniintan sababtoo ah waxaad heshay 3 calaamadood oo jaale (Yellow) ah oo ku saabsan nadaafadda/shaqadaada.', 'yellow', '2026-09-01 07:35:08', '2026-09-01 07:35:08'),
('2', '1', NULL, NULL, '1', '4', '2', '2026-09-01', 'Digniin outomatic ah: Waxaa laguu qoray digniintan sababtoo ah waxaad heshay 3 calaamadood oo jaale (Yellow) ah oo ku saabsan nadaafadda/shaqadaada.', 'yellow', '2026-09-01 07:44:06', '2026-09-01 07:44:06'),
('3', '1', NULL, NULL, '1', '5', '2', '2026-09-01', 'hagaaji', 'yellow', '2026-09-01 07:46:51', '2026-09-01 07:46:51'),
('4', '1', NULL, NULL, '2', '4', '2', '2026-09-07', 'hello', 'yellow', '2026-09-07 23:31:17', '2026-09-07 23:31:17');

DROP TABLE IF EXISTS `employee_work_locations`;
CREATE TABLE `employee_work_locations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint(20) unsigned NOT NULL,
  `work_location_id` bigint(20) unsigned NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'none',
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `last_inspected_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_work_locations_employee_id_foreign` (`employee_id`),
  KEY `employee_work_locations_work_location_id_foreign` (`work_location_id`),
  CONSTRAINT `employee_work_locations_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employee_work_locations_work_location_id_foreign` FOREIGN KEY (`work_location_id`) REFERENCES `work_locations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `employee_work_locations` VALUES ('1', '1', '4', 'green', NULL, '2026-08-29 21:24:23', '2026-09-16 14:06:09', '2026-09-16'),
('2', '1', '5', 'green', NULL, '2026-08-29 21:24:23', '2026-09-16 14:06:15', '2026-09-16'),
('3', '2', '8', 'none', NULL, '2026-09-15 12:53:48', '2026-09-15 12:53:48', NULL),
('4', '2', '7', 'none', NULL, '2026-09-15 12:53:48', '2026-09-15 12:53:48', NULL),
('5', '3', '8', 'green', NULL, '2026-09-16 14:21:02', '2026-09-16 14:22:07', '2026-09-16'),
('6', '3', '2', 'yellow', NULL, '2026-09-16 14:21:02', '2026-09-16 14:22:14', '2026-09-16');

DROP TABLE IF EXISTS `employees`;
CREATE TABLE `employees` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `full_name` varchar(255) NOT NULL,
  `fathers_name` varchar(255) DEFAULT NULL,
  `mothers_name` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `employee_role_id` bigint(20) unsigned NOT NULL,
  `work_location_id` bigint(20) unsigned DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'active',
  `notes` text DEFAULT NULL,
  `guarantor_name` varchar(255) NOT NULL,
  `guarantor_phone` varchar(255) NOT NULL,
  `guarantor_address` text NOT NULL,
  `guarantor_relationship` varchar(255) NOT NULL,
  `guarantor_notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employees_employee_id_unique` (`employee_id`),
  KEY `employees_user_id_foreign` (`user_id`),
  KEY `employees_employee_role_id_foreign` (`employee_role_id`),
  KEY `employees_work_location_id_foreign` (`work_location_id`),
  CONSTRAINT `employees_employee_role_id_foreign` FOREIGN KEY (`employee_role_id`) REFERENCES `employee_roles` (`id`),
  CONSTRAINT `employees_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `employees_work_location_id_foreign` FOREIGN KEY (`work_location_id`) REFERENCES `work_locations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `employees` VALUES ('1', 'EMP-0001', '3', 'frahaan maxamuud maxamed', NULL, 'faadumo ibraahim ciise', NULL, '0637075490', 'abdi6@gmail.com', 'manhal.st', '1', '4', '2026-08-29', '2027-02-02', 'active', NULL, 'shiine axmed', '61522428', 'manhal.st', 'deer', NULL, '2026-08-29 21:24:23', '2026-08-29 21:24:23'),
('2', 'EMP-0002', '6', 'cabdikariim yaasiin maxamuud', NULL, 'xaawo ibraahim aadan', 'employees/0oipXkmmk37nLCr4gionBIXasqL8IeVYOxL6ONv6.jpg', '0636466128', NULL, 'faarax.st', '2', '8', '2026-09-15', '2027-11-10', 'active', NULL, 'yaasiin maxamuud casoowe', '0907681537', 'manhal.st', 'abbe', 'waxkasta oo uu geysto adaa masuul ka ah', '2026-09-15 12:53:48', '2026-09-15 12:53:48'),
('3', 'EMP-0003', '11', 'nasttexo', NULL, 'xaawo ibraahim aadan', NULL, '063646612', NULL, 'faarax.st', '1', '8', '2026-09-16', '2027-11-10', 'active', NULL, 'Shiine axmed cali', '6152242890', 'manhal.st', 'abbe', NULL, '2026-09-16 14:21:02', '2026-09-16 14:21:02');

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `financial_transactions`;
CREATE TABLE `financial_transactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `payment_account_id` bigint(20) unsigned NOT NULL,
  `donor_name` varchar(255) DEFAULT NULL,
  `donor_phone` varchar(255) DEFAULT NULL,
  `amount` decimal(14,2) NOT NULL,
  `reference_number` varchar(255) DEFAULT NULL,
  `category` varchar(255) NOT NULL DEFAULT 'Sadaqo Guud',
  `notes` text DEFAULT NULL,
  `recorded_by` bigint(20) unsigned DEFAULT NULL,
  `transaction_date` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `financial_transactions_payment_account_id_foreign` (`payment_account_id`),
  KEY `financial_transactions_recorded_by_foreign` (`recorded_by`),
  CONSTRAINT `financial_transactions_payment_account_id_foreign` FOREIGN KEY (`payment_account_id`) REFERENCES `payment_accounts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `financial_transactions_recorded_by_foreign` FOREIGN KEY (`recorded_by`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `imams`;
CREATE TABLE `imams` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `imams_user_id_foreign` (`user_id`),
  CONSTRAINT `imams_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `imams` VALUES ('1', '9', 'Sheekh Yuusuf Cali', '0615551122', 'yusuf@masajid.com', 'imams/L87NfanSb67FprpazppXIZPMKREeAaS24R1CzUnz.jpg', 'Muqdisho, Soomaaliya', 'active', '2026-08-29 21:05:47', '2026-09-15 13:18:19'),
('2', '8', 'Sheekh Cumar Xasan', '0615553344', 'omar@masajid.com', NULL, 'Muqdisho, Soomaaliya', 'active', '2026-08-29 21:05:47', '2026-09-15 13:13:49');

DROP TABLE IF EXISTS `internal_notifications`;
CREATE TABLE `internal_notifications` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'warning',
  `related_id` bigint(20) unsigned DEFAULT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `internal_notifications_user_id_foreign` (`user_id`),
  CONSTRAINT `internal_notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `internal_notifications` VALUES ('1', '3', 'Digniin Cusub (Yellow)', 'hagaaji', 'warning', '3', '2026-09-07 23:33:01', '2026-09-01 07:46:52', '2026-09-07 23:33:01'),
('2', '3', 'Digniin Cusub (Yellow)', 'hello', 'warning', '4', '2026-09-07 23:32:58', '2026-09-07 23:31:17', '2026-09-07 23:32:58'),
('3', '8', 'fffffffff', 'jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj', 'announcement', NULL, '2026-09-16 14:10:20', '2026-09-15 13:26:30', '2026-09-16 14:10:20'),
('4', '9', 'fffffffff', 'jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj', 'announcement', NULL, NULL, '2026-09-15 13:26:30', '2026-09-15 13:26:30'),
('5', '3', 'ogeysiis', 'waa la idiin sheegyaa inaad caawa shir timadaan', 'announcement', NULL, '2026-09-16 14:07:21', '2026-09-16 13:32:04', '2026-09-16 14:07:21'),
('6', '6', 'ogeysiis', 'waa la idiin sheegyaa inaad caawa shir timadaan', 'announcement', NULL, NULL, '2026-09-16 13:32:04', '2026-09-16 13:32:04'),
('7', '3', 'Warbixinta Shaqada ee Maanta (16/09/2026) - 100%', 'Asc frahaan maxamuud maxamed, warbixinta kormeerka shaqadaada maanta (16/09/2026): Natiijadaadu waa 100%. Waxaad heshay 0 Cagaar, 0 Jaale, 0 Cas. Heerkaaga maanta: Heer Sare (Aad u wanaagsan). Waad ku mahadsan tahay shaqadaada.', 'daily_evaluation', NULL, '2026-09-16 14:07:21', '2026-09-16 13:48:42', '2026-09-16 14:07:21'),
('8', '6', 'Warbixinta Shaqada ee Maanta (16/09/2026) - 100%', 'Asc cabdikariim yaasiin maxamuud, warbixinta kormeerka shaqadaada maanta (16/09/2026): Natiijadaadu waa 100%. Waxaad heshay 0 Cagaar, 0 Jaale, 0 Cas. Heerkaaga maanta: Heer Sare (Aad u wanaagsan). Waad ku mahadsan tahay shaqadaada.', 'daily_evaluation', NULL, NULL, '2026-09-16 13:48:42', '2026-09-16 13:48:42'),
('9', '9', 'Warbixinta Salaadaha ee Maanta (16/09/2026) - 100%', 'Asc Sheekh Sheekh Yuusuf Cali, warbixinta salaadahaaga maanta (16/09/2026): Natiijadaadu waa 100%. Waxaad heshay 0 Cagaar, 0 Jaale, 0 Cas. Heerkaaga maanta: Heer Sare (Aad u wanaagsan). Jazakallahu Khayran.', 'daily_evaluation', NULL, NULL, '2026-09-16 13:48:42', '2026-09-16 13:48:42'),
('10', '8', 'Warbixinta Salaadaha ee Maanta (16/09/2026) - 100%', 'Asc Sheekh Sheekh Cumar Xasan, warbixinta salaadahaaga maanta (16/09/2026): Natiijadaadu waa 100%. Waxaad heshay 0 Cagaar, 0 Jaale, 0 Cas. Heerkaaga maanta: Heer Sare (Aad u wanaagsan). Jazakallahu Khayran.', 'daily_evaluation', NULL, '2026-09-16 14:10:20', '2026-09-16 13:48:42', '2026-09-16 14:10:20'),
('11', '3', 'Warbixinta Toddobaadlaha ah ee Shaqada (10/09/2026 - 16/09/2026) - 100%', 'Ogeysiiska Toddobaadlaha (Isbuuclaha) frahaan maxamuud maxamed: Soo koobidda waxqabadkaaga 7-dii maalmood ee la soo dhaafay (10/09/2026 - 16/09/2026): Dhibcahaagu waa 100%. Waxaad heshay 2 Cagaar, 0 Jaale, 0 Cas. Heerkaaga: Heer Sare (Aad u wanaagsan). Sii wad dadaalka!', 'weekly_evaluation', NULL, '2026-09-16 14:07:21', '2026-09-16 13:48:50', '2026-09-16 14:07:21'),
('12', '6', 'Warbixinta Toddobaadlaha ah ee Shaqada (10/09/2026 - 16/09/2026) - 100%', 'Ogeysiiska Toddobaadlaha (Isbuuclaha) cabdikariim yaasiin maxamuud: Soo koobidda waxqabadkaaga 7-dii maalmood ee la soo dhaafay (10/09/2026 - 16/09/2026): Dhibcahaagu waa 100%. Waxaad heshay 0 Cagaar, 0 Jaale, 0 Cas. Heerkaaga: Heer Sare (Aad u wanaagsan). Sii wad dadaalka!', 'weekly_evaluation', NULL, NULL, '2026-09-16 13:48:50', '2026-09-16 13:48:50'),
('13', '9', 'Warbixinta Toddobaadlaha ah ee Salaadaha (10/09/2026 - 16/09/2026) - 100%', 'Ogeysiiska Toddobaadlaha (Isbuuclaha) Sheekh Yuusuf Cali: Soo koobidda xaaladda salaadahaaga 7-dii maalmood ee la soo dhaafay (10/09/2026 - 16/09/2026): Dhibcahaagu waa 100%. Waxaad heshay 0 Cagaar, 0 Jaale, 0 Cas. Heerkaaga: Heer Sare (Aad u wanaagsan). Jazakallahu Khayran.', 'weekly_evaluation', NULL, NULL, '2026-09-16 13:48:50', '2026-09-16 13:48:50'),
('14', '8', 'Warbixinta Toddobaadlaha ah ee Salaadaha (10/09/2026 - 16/09/2026) - 25%', 'Ogeysiiska Toddobaadlaha (Isbuuclaha) Sheekh Cumar Xasan: Soo koobidda xaaladda salaadahaaga 7-dii maalmood ee la soo dhaafay (10/09/2026 - 16/09/2026): Dhibcahaagu waa 25%. Waxaad heshay 0 Cagaar, 1 Jaale, 1 Cas. Heerkaaga: Heer Hoose (Gaabis). Jazakallahu Khayran.', 'weekly_evaluation', NULL, '2026-09-16 14:10:20', '2026-09-16 13:48:50', '2026-09-16 14:10:20'),
('15', '3', 'Qiimaynta Waxqabadka Bishan (Sebtembar 2026) - 64%', 'Ogeysiis Qiimayn frahaan maxamuud maxamed: Shaqadaada bishan (Sebtembar 2026) waxay ahayd mid dhexdhexaad ah (Dhibcahaaga: 64%). Waxaad heshay 4 Cagaar, 6 Jaale, 1 Cas. Fadlan kordhi nadaafadda iyo feejignaanta.', 'monthly_evaluation', NULL, '2026-09-16 14:07:21', '2026-09-16 13:48:54', '2026-09-16 14:07:21'),
('16', '6', 'Qiimaynta Waxqabadka Bishan (Sebtembar 2026) - 100%', 'Hambalyo cabdikariim yaasiin maxamuud! Shaqadaadii bishan (Sebtembar 2026) aad bay u wanaagsanayd (Dhibcahaaga: 100%). Waxaad heshay 0 Cagaar, 0 Jaale, 0 Cas. Sii wad dadaalkaaga wanaagsan!', 'monthly_evaluation', NULL, NULL, '2026-09-16 13:48:54', '2026-09-16 13:48:54'),
('17', '9', 'Qiimaynta Jadwalka Salaadaha Bishan (Sebtembar 2026) - 100%', 'Hambalyo Sheekh Yuusuf Cali! Shaqadaadii bishan (Sebtembar 2026) aad bay u wanaagsanayd (Dhibcahaaga: 100%). Waxaad heshay 0 Cagaar, 0 Jaale, 0 Cas. Sii wad dadaalkaaga wanaagsan!', 'monthly_evaluation', NULL, NULL, '2026-09-16 13:48:54', '2026-09-16 13:48:54'),
('18', '8', 'Qiimaynta Jadwalka Salaadaha Bishan (Sebtembar 2026) - 25%', 'Digniin/Ogeysiis Gaabis Sheekh Cumar Xasan: Waxaa la arkay in bishan (Sebtembar 2026) shaqadaadu aad u hoosaysay oo gaabis badani ku jiro (Dhibcahaaga: 25%). Waxaad heshay 0 Cagaar, 1 Jaale, 1 Cas. Fadlan si degdeg ah u hagaaji shaqadaada si aadan digniino dheeraad ah u qaadan.', 'monthly_evaluation', NULL, '2026-09-16 14:10:20', '2026-09-16 13:48:54', '2026-09-16 14:10:20'),
('19', '3', 'Warbixinta Shaqada ee Maanta (16/09/2026) - 100%', 'Asc frahaan maxamuud maxamed, kormeerka maanta (16/09/2026): Dhibcahaagu waa 100%. 0 Cagaar, 0 Jaale, 0 Cas.', 'daily_evaluation', NULL, '2026-09-16 14:07:21', '2026-09-16 13:51:19', '2026-09-16 14:07:21'),
('20', '6', 'Warbixinta Shaqada ee Maanta (16/09/2026) - 100%', 'Asc cabdikariim yaasiin maxamuud, kormeerka maanta (16/09/2026): Dhibcahaagu waa 100%. 0 Cagaar, 0 Jaale, 0 Cas.', 'daily_evaluation', NULL, NULL, '2026-09-16 13:51:19', '2026-09-16 13:51:19'),
('21', '9', 'Warbixinta Salaadaha ee Maanta (16/09/2026) - 100%', 'Asc Sheekh Yuusuf Cali, kormeerka salaadaha maanta (16/09/2026): Dhibcahaagu waa 100%. 0 Cagaar, 0 Jaale, 0 Cas.', 'daily_evaluation', NULL, NULL, '2026-09-16 13:51:19', '2026-09-16 13:51:19'),
('22', '8', 'Warbixinta Salaadaha ee Maanta (16/09/2026) - 100%', 'Asc Sheekh Cumar Xasan, kormeerka salaadaha maanta (16/09/2026): Dhibcahaagu waa 100%. 0 Cagaar, 0 Jaale, 0 Cas.', 'daily_evaluation', NULL, '2026-09-16 14:10:20', '2026-09-16 13:51:19', '2026-09-16 14:10:20'),
('23', '3', 'Warbixinta Toddobaadlaha ah ee Shaqada (10/09/2026 - 16/09/2026) - 100%', 'Asc frahaan maxamuud maxamed, toddobaadkan (10/09/2026 - 16/09/2026): Dhibcahaagu waa 100%. 2 Cagaar, 0 Jaale, 0 Cas.', 'weekly_evaluation', NULL, '2026-09-16 14:07:21', '2026-09-16 13:51:19', '2026-09-16 14:07:21'),
('24', '6', 'Warbixinta Toddobaadlaha ah ee Shaqada (10/09/2026 - 16/09/2026) - 100%', 'Asc cabdikariim yaasiin maxamuud, toddobaadkan (10/09/2026 - 16/09/2026): Dhibcahaagu waa 100%. 0 Cagaar, 0 Jaale, 0 Cas.', 'weekly_evaluation', NULL, NULL, '2026-09-16 13:51:19', '2026-09-16 13:51:19'),
('25', '9', 'Warbixinta Toddobaadlaha ah ee Salaadaha (10/09/2026 - 16/09/2026) - 100%', 'Asc Sheekh Yuusuf Cali, toddobaadkan (10/09/2026 - 16/09/2026): Dhibcahaagu waa 100%. 0 Cagaar, 0 Jaale, 0 Cas.', 'weekly_evaluation', NULL, NULL, '2026-09-16 13:51:19', '2026-09-16 13:51:19'),
('26', '8', 'Warbixinta Toddobaadlaha ah ee Salaadaha (10/09/2026 - 16/09/2026) - 25%', 'Asc Sheekh Cumar Xasan, toddobaadkan (10/09/2026 - 16/09/2026): Dhibcahaagu waa 25%. 0 Cagaar, 1 Jaale, 1 Cas.', 'weekly_evaluation', NULL, '2026-09-16 14:10:20', '2026-09-16 13:51:19', '2026-09-16 14:10:20'),
('27', '3', 'Qiimaynta Waxqabadka Bishan (Sebtembar 2026) - 64%', 'Ogeysiis frahaan maxamuud maxamed: Shaqadaada bishan (Sebtembar 2026) waxay ahayd 64%.', 'monthly_evaluation', NULL, '2026-09-16 14:07:21', '2026-09-16 13:51:19', '2026-09-16 14:07:21'),
('28', '6', 'Qiimaynta Waxqabadka Bishan (Sebtembar 2026) - 100%', 'Hambalyo cabdikariim yaasiin maxamuud! Shaqadaadii bishan (Sebtembar 2026) aad bay u wanaagsanayd (100%).', 'monthly_evaluation', NULL, NULL, '2026-09-16 13:51:19', '2026-09-16 13:51:19'),
('29', '9', 'Qiimaynta Jadwalka Salaadaha Bishan (Sebtembar 2026) - 100%', 'Hambalyo Sheekh Yuusuf Cali! Shaqadaadii bishan (Sebtembar 2026) aad bay u wanaagsanayd (100%).', 'monthly_evaluation', NULL, NULL, '2026-09-16 13:51:20', '2026-09-16 13:51:20'),
('30', '8', 'Qiimaynta Jadwalka Salaadaha Bishan (Sebtembar 2026) - 25%', 'Digniin Sheekh Cumar Xasan: Shaqadaadu bishan (Sebtembar 2026) waxay ahayd 25%.', 'monthly_evaluation', NULL, '2026-09-16 14:10:20', '2026-09-16 13:51:20', '2026-09-16 14:10:20'),
('31', '3', '🟢 Dhiirigelin Shaqo: Kormeerka Goobta (Hoolka Weyn)', 'Hambalyo frahaan maxamuud maxamed! Kormeerka shaqadaada maanta (16/09/2026) ee goobta (Hoolka Weyn) waxay heshay Cagaar (Heer Sare). Sii wad dadaalkaaga wanaagsan!', 'daily_evaluation', NULL, '2026-09-16 14:07:21', '2026-09-16 14:02:42', '2026-09-16 14:07:21'),
('32', '3', '🟡 Ogeysiis Feejignaan: Kormeerka Goobta (Musqulaha)', 'Ogeysiis frahaan maxamuud maxamed: Kormeerka shaqadaada maanta (16/09/2026) ee goobta (Musqulaha) waxaa lagu arkay gaabis (Jaale). Sabab: Biyo yari iyo qashin yaal. Fadlan kordhi nadaafadda iyo feejignaanta.', 'daily_evaluation', NULL, '2026-09-16 14:07:21', '2026-09-16 14:02:42', '2026-09-16 14:07:21'),
('33', '8', '🟢 Bogaadin Salaadeed: Salaadda (Salaadda Casir)', 'Jazakallahu Khayran Sheekh Cumar Xasan! Salaadda (Salaadda Casir) ee maanta (16/09/2026) si heer sare ah ayaa loo gutay (Cagaar). Allah ha kaa aqbalo.', 'daily_evaluation', NULL, '2026-09-16 14:10:20', '2026-09-16 14:02:42', '2026-09-16 14:10:20'),
('34', '8', '🟡 Ogeysiis: Dib-u-dhac Salaadda (Salaadda Maqrib)', 'Ogeysiis Sheekh Cumar Xasan: Salaadda (Salaadda Maqrib) ee maanta (16/09/2026) waxaa laga diiwaangeliyay dib-u-dhac/habsaamid (Jaale). Sabab: Dib u dhac 10 daqiiqo ah. Fadlan ilaali waqtiga salaadda.', 'daily_evaluation', NULL, '2026-09-16 14:10:20', '2026-09-16 14:02:42', '2026-09-16 14:10:20'),
('35', '3', '🟢 Dhiirigelin Shaqo: Kormeerka Goobta (Hoolka Weyn)', 'Hambalyo frahaan maxamuud maxamed! Kormeerka shaqadaada maanta (16/09/2026) ee goobta (Hoolka Weyn) waxay heshay Cagaar (Heer Sare). Sii wad dadaalkaaga wanaagsan!', 'daily_evaluation', NULL, '2026-09-16 14:07:21', '2026-09-16 14:04:12', '2026-09-16 14:07:21'),
('36', '3', '🟡 Ogeysiis Feejignaan: Kormeerka Goobta (Musqulaha)', 'Ogeysiis frahaan maxamuud maxamed: Kormeerka shaqadaada maanta (16/09/2026) ee goobta (Musqulaha) waxaa lagu arkay gaabis (Jaale). Sabab: Biyo yari iyo qashin yaal. Fadlan kordhi nadaafadda iyo feejignaanta.', 'daily_evaluation', NULL, '2026-09-16 14:07:21', '2026-09-16 14:04:12', '2026-09-16 14:07:21'),
('37', '8', '🟢 Bogaadin Salaadeed: Salaadda (Salaadda Casir)', 'Jazakallahu Khayran Sheekh Cumar Xasan! Salaadda (Salaadda Casir) ee maanta (16/09/2026) si heer sare ah ayaa loo gutay (Cagaar). Allah ha kaa aqbalo.', 'daily_evaluation', NULL, '2026-09-16 14:10:20', '2026-09-16 14:04:12', '2026-09-16 14:10:20'),
('38', '8', '🟡 Ogeysiis: Dib-u-dhac Salaadda (Salaadda Maqrib)', 'Ogeysiis Sheekh Cumar Xasan: Salaadda (Salaadda Maqrib) ee maanta (16/09/2026) waxaa laga diiwaangeliyay dib-u-dhac/habsaamid (Jaale). Sabab: Dib u dhac 10 daqiiqo ah. Fadlan ilaali waqtiga salaadda.', 'daily_evaluation', NULL, '2026-09-16 14:10:20', '2026-09-16 14:04:12', '2026-09-16 14:10:20'),
('39', '3', '🟢 Dhiirigelin Shaqo: Kormeerka Goobta (Barxadda)', 'Hambalyo frahaan maxamuud maxamed! Kormeerka shaqadaada maanta (16/09/2026) ee goobta (Barxadda) waxay heshay Cagaar (Heer Sare). Sii wad dadaalkaaga wanaagsan!', 'daily_evaluation', NULL, '2026-09-16 14:07:21', '2026-09-16 14:06:09', '2026-09-16 14:07:21'),
('40', '3', '🟢 Dhiirigelin Shaqo: Kormeerka Goobta (Dabaqa 1-aad)', 'Hambalyo frahaan maxamuud maxamed! Kormeerka shaqadaada maanta (16/09/2026) ee goobta (Dabaqa 1-aad) waxay heshay Cagaar (Heer Sare). Sii wad dadaalkaaga wanaagsan!', 'daily_evaluation', NULL, '2026-09-16 14:07:21', '2026-09-16 14:06:15', '2026-09-16 14:07:21'),
('41', '8', '🟡 Ogeysiis: Dib-u-dhac Salaadda (Casar)', 'Ogeysiis Sheekh Cumar Xasan: Salaadda (Casar) ee maanta (16/09/2026) waxaa laga diiwaangeliyay dib-u-dhac/habsaamid (Jaale). Sabab: Gudasho joogto ah. Fadlan ilaali waqtiga salaadda.', 'daily_evaluation', NULL, '2026-09-16 14:10:20', '2026-09-16 14:08:24', '2026-09-16 14:10:20'),
('42', '11', '🟢 Dhiirigelin Shaqo: Kormeerka Goobta (Maktabadda)', 'Hambalyo nasttexo! Kormeerka shaqadaada maanta (16/09/2026) ee goobta (Maktabadda) waxay heshay Cagaar (Heer Sare). Sii wad dadaalkaaga wanaagsan!', 'daily_evaluation', NULL, NULL, '2026-09-16 14:22:07', '2026-09-16 14:22:07'),
('43', '11', '🟡 Ogeysiis Feejignaan: Kormeerka Goobta (Musqulaha)', 'Ogeysiis nasttexo: Kormeerka shaqadaada maanta (16/09/2026) ee goobta (Musqulaha) waxaa lagu arkay gaabis (Jaale). Sabab: Shaqo joogto ah. Fadlan kordhi nadaafadda iyo feejignaanta.', 'daily_evaluation', NULL, NULL, '2026-09-16 14:22:15', '2026-09-16 14:22:15');

DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `login_activities`;
CREATE TABLE `login_activities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `employee_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `login_activities_user_id_foreign` (`user_id`),
  KEY `login_activities_employee_id_foreign` (`employee_id`),
  CONSTRAINT `login_activities_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE SET NULL,
  CONSTRAINT `login_activities_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `login_activities` VALUES ('1', '2', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-29 21:19:24', '2026-08-29 21:19:24'),
('2', '3', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-29 21:26:33', '2026-08-29 21:26:33'),
('3', '2', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-08-29 21:27:13', '2026-08-29 21:27:13'),
('4', '2', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-09-01 07:31:55', '2026-09-01 07:31:55'),
('5', '3', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-09-01 07:35:52', '2026-09-01 07:35:52'),
('6', '2', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-09-01 07:37:34', '2026-09-01 07:37:34'),
('7', '3', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-09-01 07:38:42', '2026-09-01 07:38:42'),
('8', '2', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-09-01 07:42:15', '2026-09-01 07:42:15'),
('9', '3', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-09-01 07:44:38', '2026-09-01 07:44:38'),
('10', '2', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-09-01 07:45:18', '2026-09-01 07:45:18'),
('11', '3', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-09-01 07:47:13', '2026-09-01 07:47:13'),
('12', '2', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-09-01 07:47:57', '2026-09-01 07:47:57'),
('13', '2', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-09-01 18:04:10', '2026-09-01 18:04:10'),
('14', '2', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-09-01 19:58:25', '2026-09-01 19:58:25'),
('15', '2', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-09-01 20:08:57', '2026-09-01 20:08:57'),
('16', '2', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-09-01 20:39:18', '2026-09-01 20:39:18'),
('17', '2', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-09-01 20:39:28', '2026-09-01 20:39:28'),
('18', '2', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/151.0.0.0 Safari/537.36 Edg/151.0.0.0', '2026-09-02 08:43:26', '2026-09-02 08:43:26'),
('19', '2', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36 Edg/152.0.0.0', '2026-09-07 21:37:58', '2026-09-07 21:37:58'),
('20', '3', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36 Edg/152.0.0.0', '2026-09-07 23:31:40', '2026-09-07 23:31:40'),
('21', '1', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36 Edg/152.0.0.0', '2026-09-07 23:35:32', '2026-09-07 23:35:32'),
('22', '2', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36 Edg/152.0.0.0', '2026-09-07 23:36:52', '2026-09-07 23:36:52'),
('23', '3', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36 Edg/152.0.0.0', '2026-09-07 23:38:06', '2026-09-07 23:38:06'),
('24', '1', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36 Edg/152.0.0.0', '2026-09-07 23:38:47', '2026-09-07 23:38:47'),
('25', '1', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36 Edg/152.0.0.0', '2026-09-07 23:40:21', '2026-09-07 23:40:21'),
('26', '1', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36 Edg/152.0.0.0', '2026-09-08 08:44:46', '2026-09-08 08:44:46'),
('27', '3', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36 Edg/152.0.0.0', '2026-09-08 09:57:57', '2026-09-08 09:57:57'),
('28', '1', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36 Edg/152.0.0.0', '2026-09-08 09:58:10', '2026-09-08 09:58:10'),
('29', '3', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36 Edg/152.0.0.0', '2026-09-08 09:59:02', '2026-09-08 09:59:02'),
('30', '2', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36 Edg/152.0.0.0', '2026-09-08 09:59:26', '2026-09-08 09:59:26'),
('31', '1', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36 Edg/152.0.0.0', '2026-09-08 10:00:54', '2026-09-08 10:00:54'),
('32', '2', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36 Edg/152.0.0.0', '2026-09-08 10:47:08', '2026-09-08 10:47:08'),
('33', '1', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36 Edg/152.0.0.0', '2026-09-08 10:48:05', '2026-09-08 10:48:05'),
('34', '3', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36 Edg/152.0.0.0', '2026-09-08 10:48:18', '2026-09-08 10:48:18'),
('35', '3', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36 Edg/152.0.0.0', '2026-09-08 10:49:34', '2026-09-08 10:49:34'),
('36', '2', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36 Edg/152.0.0.0', '2026-09-08 10:49:57', '2026-09-08 10:49:57'),
('37', '1', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36 Edg/152.0.0.0', '2026-09-08 10:50:27', '2026-09-08 10:50:27'),
('38', '2', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36 Edg/152.0.0.0', '2026-09-08 10:56:13', '2026-09-08 10:56:13'),
('39', '1', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36 Edg/152.0.0.0', '2026-09-08 10:57:56', '2026-09-08 10:57:56'),
('40', '2', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36 Edg/152.0.0.0', '2026-09-08 10:58:17', '2026-09-08 10:58:17'),
('41', '2', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36 Edg/152.0.0.0', '2026-09-08 11:00:03', '2026-09-08 11:00:03'),
('42', '1', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36 Edg/152.0.0.0', '2026-09-08 11:04:38', '2026-09-08 11:04:38'),
('43', '1', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36 Edg/152.0.0.0', '2026-09-09 06:57:55', '2026-09-09 06:57:55'),
('44', '2', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36 Edg/152.0.0.0', '2026-09-09 06:59:44', '2026-09-09 06:59:44'),
('45', '2', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36 Edg/152.0.0.0', '2026-09-14 12:58:04', '2026-09-14 12:58:04'),
('46', '3', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36 Edg/152.0.0.0', '2026-09-14 14:46:47', '2026-09-14 14:46:47'),
('47', '3', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36 Edg/152.0.0.0', '2026-09-14 20:06:34', '2026-09-14 20:06:34'),
('48', '2', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36 Edg/152.0.0.0', '2026-09-14 20:09:11', '2026-09-14 20:09:11'),
('49', '2', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36 Edg/152.0.0.0', '2026-09-15 12:49:42', '2026-09-15 12:49:42'),
('50', '9', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36 Edg/152.0.0.0', '2026-09-15 13:26:40', '2026-09-15 13:26:40'),
('51', '7', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36 Edg/152.0.0.0', '2026-09-15 13:48:41', '2026-09-15 13:48:41'),
('52', '7', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36 Edg/152.0.0.0', '2026-09-15 13:57:49', '2026-09-15 13:57:49'),
('53', '9', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36 Edg/152.0.0.0', '2026-09-15 13:58:57', '2026-09-15 13:58:57'),
('54', '9', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36 Edg/152.0.0.0', '2026-09-15 14:05:46', '2026-09-15 14:05:46'),
('55', '7', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.0.0 Safari/537.36 Edg/152.0.0.0', '2026-09-15 14:13:46', '2026-09-15 14:13:46'),
('56', '7', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36 Edg/153.0.0.0', '2026-09-16 12:57:58', '2026-09-16 12:57:58'),
('57', '2', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36 Edg/153.0.0.0', '2026-09-16 12:59:02', '2026-09-16 12:59:02'),
('58', '7', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36 Edg/153.0.0.0', '2026-09-16 13:04:23', '2026-09-16 13:04:23'),
('59', '2', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36 Edg/153.0.0.0', '2026-09-16 13:26:04', '2026-09-16 13:26:04'),
('60', '7', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36 Edg/153.0.0.0', '2026-09-16 13:29:49', '2026-09-16 13:29:49'),
('61', '2', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36 Edg/153.0.0.0', '2026-09-16 13:30:42', '2026-09-16 13:30:42'),
('62', '7', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36 Edg/153.0.0.0', '2026-09-16 13:31:19', '2026-09-16 13:31:19'),
('63', '3', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36 Edg/153.0.0.0', '2026-09-16 13:32:20', '2026-09-16 13:32:20'),
('64', '2', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36 Edg/153.0.0.0', '2026-09-16 13:32:57', '2026-09-16 13:32:57'),
('66', '2', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36 Edg/153.0.0.0', '2026-09-16 13:35:14', '2026-09-16 13:35:14'),
('67', '3', '1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36 Edg/153.0.0.0', '2026-09-16 14:06:26', '2026-09-16 14:06:26'),
('68', '2', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36 Edg/153.0.0.0', '2026-09-16 14:07:32', '2026-09-16 14:07:32'),
('69', '8', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36 Edg/153.0.0.0', '2026-09-16 14:09:21', '2026-09-16 14:09:21'),
('70', '2', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36 Edg/153.0.0.0', '2026-09-16 14:17:07', '2026-09-16 14:17:07'),
('71', '11', '3', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36 Edg/153.0.0.0', '2026-09-16 14:21:21', '2026-09-16 14:21:21'),
('72', '2', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36 Edg/153.0.0.0', '2026-09-16 14:21:45', '2026-09-16 14:21:45'),
('73', '11', '3', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36 Edg/153.0.0.0', '2026-09-16 14:22:32', '2026-09-16 14:22:32'),
('74', '2', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36 Edg/153.0.0.0', '2026-09-16 14:23:36', '2026-09-16 14:23:36');

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `migrations` VALUES ('1', '0001_01_01_000000_create_users_table', '1'),
('2', '0001_01_01_000001_create_cache_table', '1'),
('3', '0001_01_01_000002_create_jobs_table', '1'),
('4', '2026_08_21_071810_create_rbac_tables', '1'),
('5', '2026_08_21_071811_create_committee_members_table', '1'),
('6', '2026_08_21_071812_create_employee_roles_and_locations_tables', '1'),
('7', '2026_08_21_071812_create_imams_table', '1'),
('8', '2026_08_21_071813_create_employees_table', '1'),
('9', '2026_08_21_071813_create_prayers_tables', '1'),
('10', '2026_08_21_071814_create_warnings_tables', '1'),
('11', '2026_08_21_071815_create_internal_notifications_and_login_activities_tables', '1'),
('12', '2026_08_21_071816_create_employee_work_locations_table', '1'),
('13', '2026_08_21_071817_create_performance_flags_table', '1'),
('14', '2026_08_21_071818_update_performance_inspection_and_create_finance_tables', '2'),
('15', '2026_09_07_214929_alter_value_column_in_warning_settings_table', '3'),
('16', '2026_09_15_163000_update_performance_status_default_to_none', '4'),
('17', '2026_09_16_170000_create_permission_user_and_custom_permissions', '5');

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `payment_accounts`;
CREATE TABLE `payment_accounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `provider` varchar(255) NOT NULL,
  `account_number` varchar(255) NOT NULL,
  `account_holder` varchar(255) DEFAULT NULL,
  `balance` decimal(14,2) NOT NULL DEFAULT 0.00,
  `currency` varchar(255) NOT NULL DEFAULT 'USD',
  `status` varchar(255) NOT NULL DEFAULT 'active',
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `payment_accounts` VALUES ('1', 'zaad', 'zaad', '0637075499', 'apdiwahid', '0.00', 'USD', 'active', NULL, '2026-09-01 10:40:48', '2026-09-01 10:40:48');

DROP TABLE IF EXISTS `performance_flags`;
CREATE TABLE `performance_flags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint(20) unsigned DEFAULT NULL,
  `imam_id` bigint(20) unsigned DEFAULT NULL,
  `flag_type` varchar(255) NOT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `source_name` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `performance_flags_employee_id_foreign` (`employee_id`),
  KEY `performance_flags_imam_id_foreign` (`imam_id`),
  CONSTRAINT `performance_flags_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  CONSTRAINT `performance_flags_imam_id_foreign` FOREIGN KEY (`imam_id`) REFERENCES `imams` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `performance_flags` VALUES ('1', '1', NULL, 'yellow', NULL, 'Barxadda', '2026-09-01', '2026-09-01 07:33:09', '2026-09-01 07:33:09'),
('2', '1', NULL, 'yellow', NULL, 'Dabaqa 1-aad', '2026-09-01', '2026-09-01 07:33:25', '2026-09-01 07:33:25'),
('3', '1', NULL, 'yellow', NULL, 'Barxadda', '2026-09-01', '2026-09-01 07:35:08', '2026-09-01 07:35:08'),
('4', '1', NULL, 'red', NULL, 'Dabaqa 1-aad', '2026-09-01', '2026-09-01 07:38:20', '2026-09-01 07:38:20'),
('5', '1', NULL, 'yellow', NULL, 'Dabaqa 1-aad', '2026-09-01', '2026-09-01 07:43:32', '2026-09-01 07:43:32'),
('6', '1', NULL, 'yellow', NULL, 'Dabaqa 1-aad', '2026-09-01', '2026-09-01 07:43:44', '2026-09-01 07:43:44'),
('7', '1', NULL, 'yellow', NULL, 'Barxadda', '2026-09-01', '2026-09-01 07:44:06', '2026-09-01 07:44:06'),
('8', '1', NULL, 'green', NULL, 'Barxadda', '2026-09-09', '2026-09-09 07:01:26', '2026-09-09 07:01:26'),
('9', '1', NULL, 'green', NULL, 'Dabaqa 1-aad', '2026-09-09', '2026-09-09 07:01:45', '2026-09-09 07:01:45'),
('10', '1', NULL, 'green', NULL, 'Barxadda', '2026-09-14', '2026-09-14 14:46:09', '2026-09-14 14:46:09'),
('11', '1', NULL, 'green', NULL, 'Dabaqa 1-aad', '2026-09-14', '2026-09-14 14:46:29', '2026-09-14 14:46:29'),
('12', NULL, '2', 'yellow', NULL, 'Casar', '2026-09-15', '2026-09-15 13:21:22', '2026-09-15 13:21:22'),
('13', NULL, '2', 'red', NULL, 'Casar', '2026-09-15', '2026-09-15 13:58:38', '2026-09-15 13:58:38'),
('14', '1', NULL, 'green', NULL, 'Barxadda', '2026-09-16', '2026-09-16 14:06:09', '2026-09-16 14:06:09'),
('15', '1', NULL, 'green', NULL, 'Dabaqa 1-aad', '2026-09-16', '2026-09-16 14:06:15', '2026-09-16 14:06:15'),
('16', NULL, '2', 'yellow', NULL, 'Casar', '2026-09-16', '2026-09-16 14:08:23', '2026-09-16 14:08:23'),
('17', '3', NULL, 'green', NULL, 'Maktabadda', '2026-09-16', '2026-09-16 14:22:07', '2026-09-16 14:22:07'),
('18', '3', NULL, 'yellow', NULL, 'Musqulaha', '2026-09-16', '2026-09-16 14:22:15', '2026-09-16 14:22:15');

DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE `permission_role` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_role_id_foreign` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `permission_role` VALUES ('1', '1'),
('1', '2'),
('1', '3'),
('1', '4'),
('1', '5'),
('1', '6'),
('1', '8'),
('2', '1'),
('2', '2'),
('3', '1'),
('3', '2'),
('3', '3'),
('3', '4'),
('3', '5'),
('3', '6'),
('3', '8'),
('4', '1'),
('4', '2'),
('4', '3'),
('4', '4'),
('4', '5'),
('4', '8'),
('5', '1'),
('5', '2'),
('5', '3'),
('5', '4'),
('5', '5'),
('5', '6'),
('5', '8'),
('6', '1'),
('6', '2'),
('6', '3'),
('6', '4'),
('6', '5'),
('6', '6'),
('6', '8'),
('7', '1'),
('7', '2'),
('7', '3'),
('7', '4'),
('7', '5'),
('7', '6'),
('7', '8'),
('8', '1'),
('8', '2'),
('8', '3'),
('8', '4'),
('8', '5'),
('8', '8'),
('9', '1'),
('9', '2'),
('9', '3'),
('9', '4'),
('9', '5'),
('9', '8');

DROP TABLE IF EXISTS `permission_user`;
CREATE TABLE `permission_user` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`user_id`),
  KEY `permission_user_user_id_foreign` (`user_id`),
  CONSTRAINT `permission_user_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `permission_user` VALUES ('1', '7'),
('10', '7');

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `permissions` VALUES ('1', 'view-dashboard', 'Eeg Dashboard-ka', 'Awoodda lagu arko dashboard-ka.', '2026-08-29 21:05:38', '2026-08-29 21:05:38'),
('2', 'manage-users', 'Maamul Isticmaalayaasha', 'Abuur, wax ka badal ama tirtir akoonnada nidaamka.', '2026-08-29 21:05:39', '2026-08-29 21:05:39'),
('3', 'manage-employees', 'Maamul Shaqaalaha', 'Maamulista shaqaalaha, doorarkooda iyo meelaha shaqada.', '2026-08-29 21:05:39', '2026-08-29 21:05:39'),
('4', 'manage-committee', 'Maamul Guddiga', 'Maamulista xubnaha guddiga iyo xilalkooda.', '2026-08-29 21:05:39', '2026-08-29 21:05:39'),
('5', 'manage-imams', 'Maamul Imaamyada', 'Maamulista macluumaadka imaamyada.', '2026-08-29 21:05:39', '2026-08-29 21:05:39'),
('6', 'manage-prayers', 'Maamul Salaadaha', 'Qorshaynta noocyada, kaltimada iyo jadwalka salaadda.', '2026-08-29 21:05:39', '2026-08-29 21:05:39'),
('7', 'manage-warnings', 'Maamul Digniinaha', 'Awoodda bixinta digniinaha shaqaalaha iyo dejinta xadka.', '2026-08-29 21:05:39', '2026-08-29 21:05:39'),
('8', 'view-login-activity', 'Eeg Gelitaanka', 'La socoshada taariikhda gelitaanka shaqaalaha.', '2026-08-29 21:05:39', '2026-08-29 21:05:39'),
('9', 'manage-finances', 'Maamul Dhaqaalaha', NULL, '2026-09-01 10:16:44', '2026-09-01 10:16:44'),
('10', 'manage-notifications', 'Dirista Farriimaha & Ogeysiisyada', 'Awoodda dirista farriimaha iyo ogeysiisyada guud ee nidaamka.', '2026-09-16 13:18:16', '2026-09-16 13:18:16'),
('11', 'view-admin-performance', 'Qiimaynta & Kormeerka Maamulayaasha', 'Awoodda lagu arko kormeerka iyo dhibcaha maalinlaha ah ee maamulka.', '2026-09-16 13:18:16', '2026-09-16 13:18:16');

DROP TABLE IF EXISTS `prayer_schedules`;
CREATE TABLE `prayer_schedules` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `prayer_type_id` bigint(20) unsigned NOT NULL,
  `imam_id` bigint(20) unsigned NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'active',
  `schedule_info` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `performance_status` varchar(255) NOT NULL DEFAULT 'none',
  `last_inspected_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `prayer_schedules_date_prayer_type_id_unique` (`date`,`prayer_type_id`),
  KEY `prayer_schedules_prayer_type_id_foreign` (`prayer_type_id`),
  KEY `prayer_schedules_imam_id_foreign` (`imam_id`),
  CONSTRAINT `prayer_schedules_imam_id_foreign` FOREIGN KEY (`imam_id`) REFERENCES `imams` (`id`) ON DELETE CASCADE,
  CONSTRAINT `prayer_schedules_prayer_type_id_foreign` FOREIGN KEY (`prayer_type_id`) REFERENCES `prayer_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `prayer_schedules` VALUES ('1', '2026-09-14', '1', '1', 'active', NULL, '2026-09-14 13:29:41', '2026-09-15 13:17:31', 'none', NULL),
('2', '2026-09-14', '3', '2', 'active', NULL, '2026-09-14 20:10:36', '2026-09-14 20:10:36', 'none', NULL);

DROP TABLE IF EXISTS `prayer_times`;
CREATE TABLE `prayer_times` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `prayer_type_id` bigint(20) unsigned NOT NULL,
  `adhan_time` time NOT NULL,
  `iqamah_time` time NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prayer_times_prayer_type_id_foreign` (`prayer_type_id`),
  CONSTRAINT `prayer_times_prayer_type_id_foreign` FOREIGN KEY (`prayer_type_id`) REFERENCES `prayer_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `prayer_times` VALUES ('1', '1', '05:00:00', '05:20:00', 'active', '2026-08-29 21:05:47', '2026-08-29 21:05:47'),
('2', '2', '12:20:00', '12:40:00', 'active', '2026-08-29 21:05:47', '2026-08-29 21:05:47'),
('3', '3', '15:45:00', '16:00:00', 'active', '2026-08-29 21:05:47', '2026-08-29 21:05:47'),
('4', '4', '18:15:00', '18:25:00', 'active', '2026-08-29 21:05:47', '2026-08-29 21:05:47'),
('5', '5', '19:30:00', '19:45:00', 'active', '2026-08-29 21:05:47', '2026-08-29 21:05:47');

DROP TABLE IF EXISTS `prayer_types`;
CREATE TABLE `prayer_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `prayer_types_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `prayer_types` VALUES ('1', 'Subax', 'active', '2026-08-29 21:05:46', '2026-08-29 21:05:46'),
('2', 'Duhur', 'active', '2026-08-29 21:05:46', '2026-08-29 21:05:46'),
('3', 'Casar', 'active', '2026-08-29 21:05:46', '2026-08-29 21:05:46'),
('4', 'Maqrib', 'active', '2026-08-29 21:05:47', '2026-08-29 21:05:47'),
('5', 'Cisha', 'active', '2026-08-29 21:05:47', '2026-08-29 21:05:47');

DROP TABLE IF EXISTS `role_user`;
CREATE TABLE `role_user` (
  `role_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`user_id`),
  KEY `role_user_user_id_foreign` (`user_id`),
  CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `role_user` VALUES ('1', '1'),
('2', '2'),
('4', '7'),
('7', '3'),
('7', '6'),
('7', '11'),
('9', '8'),
('9', '9');

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `roles` VALUES ('1', 'super-admin', 'Maamulaha Sare', 'Awood buuxda ee nidaamka.', '2026-08-29 21:05:38', '2026-08-29 21:05:38'),
('2', 'administrator', 'Maamule', 'Maamulaha hawlaha caadiga ah.', '2026-08-29 21:05:38', '2026-08-29 21:05:38'),
('3', 'chairman', 'Guddoomiye', 'Guddoomiyaha guddiga masaajidka.', '2026-08-29 21:05:38', '2026-08-29 21:05:38'),
('4', 'secretary', 'Xoghaye', 'Xoghayaha guddiga masaajidka.', '2026-08-29 21:05:38', '2026-08-29 21:05:38'),
('5', 'treasurer', 'Khasnaji', 'Khasnajiga guddiga masaajidka.', '2026-08-29 21:05:38', '2026-08-29 21:05:38'),
('6', 'committee-member', 'Xubin Guddiga', 'Xubin caadi ah oo ka tirsan guddiga.', '2026-08-29 21:05:38', '2026-08-29 21:05:38'),
('7', 'employee', 'Shaqaale', 'Shaqaale ka shaqeeya masaajidka.', '2026-08-29 21:05:38', '2026-08-29 21:05:38'),
('8', 'supervisor', 'Maamule Kormeere (Supervisor)', 'Maamule kormeera shaqaalaha, digniinaha iyo nadaafadda, laakiin aan abuuri karin akoonno.', '2026-09-08 09:20:49', '2026-09-08 09:20:49'),
('9', 'imam', 'Imaam', 'Imaamka Masaajidka', '2026-09-15 13:13:49', '2026-09-15 13:13:49');

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `sessions` VALUES ('tQVDyMwEBq4BSJGTeRyDIjGwwwzHShhg1bRc3t2O', '2', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/153.0.0.0 Safari/537.36 Edg/153.0.0.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiMEFhNFd0eDl6SFdJb2FQYWgzWnVMeUtwdnpJRDQ3Z1ZsUUd3RFhGVyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kYXNoYm9hcmQiO3M6NToicm91dGUiO3M6OToiZGFzaGJvYXJkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6Mjt9', '1789568617');

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'active',
  `has_custom_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `plain_password` varchar(255) DEFAULT NULL,
  `subscription_blocked` tinyint(1) NOT NULL DEFAULT 0,
  `subscription_price` decimal(8,2) NOT NULL DEFAULT 30.00,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `users` VALUES ('1', 'System Owner (Developer)', 'superadmin', 'developer@mosquemanagement.com', NULL, '$2y$12$UjvZWomYaiur6RjtpfilsuPE/UFqZw8304W9IvhD22Bx8QGED44ky', 'active', '0', '123', '0', '30.00', NULL, '2026-08-29 21:05:43', '2026-08-29 21:05:43'),
('2', 'Shiine Admin', 'shiine', 'shiine@mosquemanagement.com', NULL, '$2y$12$WRTc4vKOVVWbBYZbGPQttetiKN6y/fZNk0xVyn1gAslumg/xHEzRe', 'active', '0', '123', '0', '30.00', NULL, '2026-08-29 21:05:44', '2026-09-08 10:44:24'),
('3', 'frahaan maxamuud maxamed', 'farhaan', 'abdi6@gmail.com', NULL, '$2y$12$txce3CGS9eOXMwEIg0CQPeIgtFuyWEb7nnQY8Z0aUHpcw3yVi/6cS', 'active', '0', '1234', '0', '30.00', NULL, '2026-08-29 21:24:23', '2026-09-08 09:58:43'),
('6', 'cabdikariim yaasiin maxamuud', 'qawdhan', NULL, NULL, '$2y$12$QuIH87q67YRB6RVPcMqHxuErL6dwNoLqm0XG7idk5L/LrKlJ5i3rG', 'active', '0', '1234', '0', '30.00', NULL, '2026-09-15 12:53:48', '2026-09-15 12:53:48'),
('7', 'nimco yaasiin maxamud', 'gudoomiye1', 'nimcoyaasiin@gmail.com', NULL, '$2y$12$TbEFD/kkDVABDG396nLrieJxnO89CbDnwc.q15CuV6vwtusZ2s7oO', 'active', '1', '1234', '0', '30.00', NULL, '2026-09-15 13:01:58', '2026-09-16 13:31:03'),
('8', 'Sheekh Cumar Xasan', 'imaam1', 'omar@masajid.com', NULL, '$2y$12$.f0qf4LH3jNe659JMTN2OuC7JQp54FlgFo6CHEb.fOLOafHVxQmlu', 'active', '0', '1234', '0', '30.00', NULL, '2026-09-15 13:13:49', '2026-09-15 13:13:49'),
('9', 'Sheekh Yuusuf Cali', 'imaam2', 'yusuf@masajid.com', NULL, '$2y$12$Kdx.s/UzTT0ALA3db9ceKuZ3154sJqvTqqzdr6wpb1/.klxv2Lj6q', 'active', '0', '1234', '0', '30.00', NULL, '2026-09-15 13:18:18', '2026-09-15 13:18:18'),
('11', 'nasttexo', 'naska', NULL, NULL, '$2y$12$PhpNGpdVWp0Jo9smCvL9uO0mQVkLWQuHw1kpzfHhSmMBFgREi5YTG', 'active', '0', '1234', '0', '30.00', NULL, '2026-09-16 14:21:02', '2026-09-16 14:21:02');

DROP TABLE IF EXISTS `warning_settings`;
CREATE TABLE `warning_settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `warning_settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `warning_settings` VALUES ('1', 'monthly_warning_limit', '3', '2026-08-29 21:05:46', '2026-08-29 21:05:46'),
('2', 'yearly_warning_limit', '10', '2026-08-29 21:05:46', '2026-08-29 21:05:46'),
('3', 'yellow_flags_before_warning', '3', '2026-08-29 21:05:46', '2026-08-29 21:05:46'),
('4', 'developer_whatsapp', '+252615000000', '2026-08-29 21:05:46', '2026-08-29 21:05:46'),
('5', 'developer_payment_account', '5432-1098-7654-3210', '2026-08-29 21:05:46', '2026-08-29 21:05:46'),
('6', 'monthly_eval_msg_good', 'Hambalyo {name}! Shaqadaadii bishan ({month}) aad bay u wanaagsanayd (Dhibcahaaga: {score}%). Waxaad heshay {green} Cagaar, {yellow} Jaale, {red} Cas. Sii wad dadaalkaaga wanaagsan!', '2026-09-07 21:43:31', '2026-09-16 13:51:35'),
('7', 'monthly_eval_msg_medium', 'Ogeysiis Qiimayn {name}: Shaqadaada bishan ({month}) waxay ahayd mid dhexdhexaad ah (Dhibcahaaga: {score}%). Waxaad heshay {green} Cagaar, {yellow} Jaale, {red} Cas. Fadlan kordhi nadaafadda iyo feejignaanta.', '2026-09-07 21:43:31', '2026-09-16 13:51:35'),
('8', 'monthly_eval_msg_poor', 'Digniin/Ogeysiis Gaabis {name}: Waxaa la arkay in bishan ({month}) shaqadaadu aad u hoosaysay oo gaabis badani ku jiro (Dhibcahaaga: {score}%). Waxaad heshay {green} Cagaar, {yellow} Jaale, {red} Cas. Fadlan si degdeg ah u hagaaji shaqadaada si aadan digniino dheeraad ah u qaadan.', '2026-09-07 21:51:44', '2026-09-16 13:51:35'),
('9', 'auto_warning_msg_employee', 'Digniin outomatic ah: Waxaa laguu qoray digniintan sababtoo ah waxaad heshay {threshold} calaamadood oo jaale (Yellow) ah oo ku saabsan nadaafadda/shaqadaada.', '2026-09-14 14:40:08', '2026-09-14 14:40:08'),
('10', 'auto_warning_msg_imam', 'Digniin outomatic ah: Waxaa laguu qoray digniintan sababtoo ah waxaad heshay {threshold} calaamadood oo jaale (Yellow) ah oo ku saabsan habsaamida salaadahaaga.', '2026-09-14 14:40:08', '2026-09-14 14:40:08'),
('11', 'daily_eval_msg_employee', 'Asc {name}, warbixinta kormeerka shaqadaada maanta ({date}): Natiijadaadu waa {score}%. Waxaad heshay {green} Cagaar, {yellow} Jaale, {red} Cas. Heerkaaga maanta: {level}. Waad ku mahadsan tahay shaqadaada.', '2026-09-16 13:50:14', '2026-09-16 13:51:35'),
('12', 'daily_eval_msg_imam', 'Asc {name}, warbixinta salaadahaaga maanta ({date}): Natiijadaadu waa {score}%. Waxaad heshay {green} Cagaar, {yellow} Jaale, {red} Cas. Heerkaaga maanta: {level}. Jazakallahu Khayran.', '2026-09-16 13:50:15', '2026-09-16 13:51:35'),
('13', 'weekly_eval_msg_employee', 'Ogeysiiska Toddobaadlaha (Isbuuclaha) {name}: Soo koobidda waxqabadkaaga 7-dii maalmood ee la soo dhaafay ({period}): Dhibcahaagu waa {score}%. Waxaad heshay {green} Cagaar, {yellow} Jaale, {red} Cas. Heerkaaga: {level}. Sii wad dadaalka!', '2026-09-16 13:50:15', '2026-09-16 13:51:35'),
('14', 'weekly_eval_msg_imam', 'Ogeysiiska Toddobaadlaha (Isbuuclaha) {name}: Soo koobidda xaaladda salaadahaaga 7-dii maalmood ee la soo dhaafay ({period}): Dhibcahaagu waa {score}%. Waxaad heshay {green} Cagaar, {yellow} Jaale, {red} Cas. Heerkaaga: {level}. Jazakallahu Khayran.', '2026-09-16 13:50:15', '2026-09-16 13:51:35'),
('15', 'daily_msg_green_employee', 'Hambalyo {name}! Kormeerka shaqadaada maanta ({date}) ee goobta ({location}) waxay heshay Cagaar (Heer Sare). Sii wad dadaalkaaga wanaagsan!', '2026-09-16 14:02:14', '2026-09-16 14:02:14'),
('16', 'daily_msg_yellow_employee', 'Ogeysiis {name}: Kormeerka shaqadaada maanta ({date}) ee goobta ({location}) waxaa lagu arkay gaabis (Jaale). Sabab: {reason}. Fadlan kordhi nadaafadda iyo feejignaanta.', '2026-09-16 14:02:14', '2026-09-16 14:02:14'),
('17', 'daily_msg_red_employee', 'Digniin/Gaabis {name}: Kormeerka shaqadaada maanta ({date}) ee goobta ({location}) waxaa laga bixiyay Cas (Aad u liidata). Sabab: {reason}. Fadlan si degdeg ah u sax goobtan si aadan digniin u qaadan.', '2026-09-16 14:02:14', '2026-09-16 14:02:14'),
('18', 'daily_msg_green_imam', 'Jazakallahu Khayran {name}! Salaadda ({prayer}) ee maanta ({date}) si heer sare ah ayaa loo gutay (Cagaar). Allah ha kaa aqbalo.', '2026-09-16 14:02:14', '2026-09-16 14:02:14'),
('19', 'daily_msg_yellow_imam', 'Ogeysiis {name}: Salaadda ({prayer}) ee maanta ({date}) waxaa laga diiwaangeliyay dib-u-dhac/habsaamid (Jaale). Sabab: {reason}. Fadlan ilaali waqtiga salaadda.', '2026-09-16 14:02:15', '2026-09-16 14:02:15'),
('20', 'daily_msg_red_imam', 'Digniin {name}: Salaadda ({prayer}) ee maanta ({date}) waxaa laga diiwaangeliyay maqnaansho (Cas). Sabab: {reason}. Fadlan si degdeg ah ula xiriir maamulka.', '2026-09-16 14:02:15', '2026-09-16 14:02:15');

DROP TABLE IF EXISTS `work_locations`;
CREATE TABLE `work_locations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `work_locations_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `work_locations` VALUES ('1', 'Hoolka Weyn ee Salaadda', 'Goobta salaadda ee weyn', 'active', '2026-08-29 21:05:45', '2026-08-29 21:05:45'),
('2', 'Musqulaha', 'Goobta musqulaha ee masaajidka', 'active', '2026-08-29 21:05:45', '2026-08-29 21:05:45'),
('3', 'Goobta Weysada', 'Goobta dadku ku weyseystaan', 'active', '2026-08-29 21:05:45', '2026-08-29 21:05:45'),
('4', 'Barxadda', 'Barxadda bannaanka ee masaajidka', 'active', '2026-08-29 21:05:45', '2026-08-29 21:05:45'),
('5', 'Dabaqa 1-aad', 'Dabaqa koowaad ee masaajidka', 'active', '2026-08-29 21:05:45', '2026-08-29 21:05:45'),
('6', 'Dabaqa 2-aad', 'Dabaqa labaad ee masaajidka', 'active', '2026-08-29 21:05:45', '2026-08-29 21:05:45'),
('7', 'Xafiiska', 'Xafiiska maamulka ee masaajidka', 'active', '2026-08-29 21:05:45', '2026-08-29 21:05:45'),
('8', 'Maktabadda', 'Maktabadda masaajidka ee buugaagta', 'active', '2026-08-29 21:05:45', '2026-08-29 21:05:45'),
('9', 'Albaabka Weyn', 'Albaabka laga soo galo masaajidka', 'active', '2026-08-29 21:05:45', '2026-08-29 21:05:45'),
('10', 'Goobta Baabuurta', 'Goobta baabuurta la dhigto', 'active', '2026-08-29 21:05:45', '2026-08-29 21:05:45');

SET FOREIGN_KEY_CHECKS=1;
