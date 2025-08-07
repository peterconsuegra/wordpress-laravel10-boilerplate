/*M!999999\- enable the sandbox mode */ 
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS `adomains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `adomains` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `output` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `backups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `backups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `schedulling` varchar(255) DEFAULT NULL,
  `site_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `output` text DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `barsite_id` int(11) DEFAULT NULL,
  `dashboard_user_id` int(11) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `manual` tinyint(1) DEFAULT NULL,
  `theme` varchar(255) DEFAULT NULL,
  `first_password` text DEFAULT NULL,
  `wp_user` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `barserver_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `domains` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(255) NOT NULL,
  `option_value` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  `option_date` datetime DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `privileges` varchar(255) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `payload` text NOT NULL,
  `last_activity` int(11) NOT NULL,
  UNIQUE KEY `sessions_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `site_cloned_id` varchar(255) DEFAULT NULL,
  `db_prefix` varchar(255) DEFAULT NULL,
  `zip_file_url` varchar(255) DEFAULT NULL,
  `output` longtext DEFAULT NULL,
  `app_name` varchar(255) DEFAULT NULL,
  `action_name` varchar(255) DEFAULT NULL,
  `to_clone_project` varchar(255) DEFAULT NULL,
  `file_to_download` varchar(255) DEFAULT NULL,
  `to_import_project` varchar(255) DEFAULT NULL,
  `db_name` text DEFAULT NULL,
  `db_user` text DEFAULT NULL,
  `db_password` text DEFAULT NULL,
  `cms_user` text DEFAULT NULL,
  `cms_password` text DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `template` tinyint(1) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `disable` tinyint(1) DEFAULT NULL,
  `suspend` tinyint(1) DEFAULT NULL,
  `wordpress_laravel_git_branch` varchar(255) DEFAULT NULL,
  `wordpress_laravel_git` text DEFAULT NULL,
  `wordpress_laravel_url` varchar(255) DEFAULT NULL,
  `wordpress_laravel_name` varchar(255) DEFAULT NULL,
  `wordpress_laravel_target_id` int(11) DEFAULT NULL,
  `wp_load_path` varchar(255) DEFAULT NULL,
  `wp_url` varchar(255) DEFAULT NULL,
  `sql_url` varchar(255) DEFAULT NULL,
  `big_file_url` text DEFAULT NULL,
  `big_file_route` text DEFAULT NULL,
  `error_message1` text DEFAULT NULL,
  `error_message2` text DEFAULT NULL,
  `theme` varchar(255) DEFAULT NULL,
  `barsite_id` int(11) DEFAULT NULL,
  `published` tinyint(1) DEFAULT NULL,
  `to_clone_project_id` int(11) DEFAULT NULL,
  `laravel_version` varchar(255) DEFAULT NULL,
  `shared` tinyint(1) DEFAULT NULL,
  `dashboard_user_id` int(11) DEFAULT NULL,
  `barserver_id` int(11) DEFAULT NULL,
  `snapshot_file` varchar(255) DEFAULT NULL,
  `snapshot_label` varchar(255) DEFAULT NULL,
  `snapshot_date` datetime DEFAULT NULL,
  `first_password` text DEFAULT NULL,
  `wp_user` varchar(255) DEFAULT NULL,
  `bardomain_id` int(11) DEFAULT NULL,
  `linode_id` int(11) DEFAULT NULL,
  `domain_linode_id` bigint(20) DEFAULT NULL,
  `subdomain_linode_id` bigint(20) DEFAULT NULL,
  `cms_name` varchar(255) DEFAULT NULL,
  `backup_days` int(11) DEFAULT NULL,
  `mod_sw` varchar(255) DEFAULT NULL,
  `ssl` tinyint(1) DEFAULT NULL,
  `integration_type` varchar(255) DEFAULT NULL,
  `speed_up` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  `pete_token` text DEFAULT NULL,
  `shared` tinyint(1) DEFAULT NULL,
  `user_db` text DEFAULT NULL,
  `user_db_pass` text DEFAULT NULL,
  `restored` tinyint(1) DEFAULT NULL,
  `snapshot` tinyint(1) DEFAULT NULL,
  `db_info` text DEFAULT NULL,
  `filemanager_info` text DEFAULT NULL,
  `filemanager_directory` varchar(255) DEFAULT NULL,
  `output` text DEFAULT NULL,
  `contact_me_again` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

/*M!999999\- enable the sandbox mode */ 
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (1,'2014_10_12_000000_create_users_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (2,'2014_10_12_100000_create_password_resets_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (3,'2015_10_10_171122_create_sites_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (4,'2015_10_11_173212_add_site_to_clone_to_sites',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (5,'2015_10_12_120357_add_db_prefix_to_sites',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (6,'2015_10_12_121329_add_zip_file_url_to_sites',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (7,'2015_10_13_115640_create_options_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (8,'2015_10_20_123905_add_output_to_sites',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (9,'2015_10_29_114211_add_fields_to_sites',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (10,'2015_10_30_115442_add_to_clone_project',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (11,'2015_11_08_145024_add_file_to_download',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (12,'2015_11_16_183141_create_sessions_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (13,'2015_12_01_113307_add_to_import_project_to_sites',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (14,'2016_01_11_004103_add_db_fields_to_sites',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (15,'2016_01_21_230358_add_cms_fields_to_sites',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (16,'2016_01_24_185150_add_admin_field_to_users',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (17,'2016_01_25_014253_add_user_id_to_sites',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (18,'2016_01_30_124715_add_template_to_sites',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (19,'2016_02_01_043724_add_deleted_to_sites',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (20,'2016_02_09_175322_add_soft_deleting_to_sites',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (21,'2016_02_20_145730_create_adomains_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (22,'2016_02_20_161301_add_site_id_to_adomains',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (23,'2016_02_21_231102_add_output_to_adomain',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (24,'2016_08_17_213753_add_diable_to_sites',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (25,'2016_08_17_221455_add_suspend_to_sites',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (26,'2016_11_20_185339_add_wordpress_laravel_to_sites_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (27,'2016_11_20_191813_add_wordpress_laravel_target_to_sites_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (28,'2016_11_20_194947_add_wordpress_laravel_url_to_sites_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (29,'2016_11_20_202850_add_wordpress_laravel_name_to_sites_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (30,'2016_11_20_204415_add_wordpress_laravel_fields2_to_sites_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (31,'2017_01_07_160926_add_sql_url_to_sites',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (32,'2017_04_04_120201_big_file_route',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (33,'2017_04_04_120831_add_big_file_route',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (34,'2018_06_18_195712_add_error_messages',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (35,'2018_06_18_211903_add_recent_to_sites',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (36,'2018_07_02_164230_add_subscription_id_to_sites',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (37,'2018_07_10_134930_add_visible_to_options',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (38,'2018_07_10_143741_add_option_date',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (39,'2018_10_29_171538_add_pete_token_to_users',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (40,'2018_10_30_215739_add_theme_to_sites',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (41,'2018_11_05_211455_add_fields_to_sites_austinm',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (42,'2018_11_07_203333_add_barsite_id_to_sites_austin',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (43,'2018_11_13_152605_add_published_to_sites',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (44,'2018_11_15_004629_add_fields_to_sites_killanov',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (45,'2018_11_15_012715_add_fields_wp_user_to_sites',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (46,'2018_11_19_122343_create_backups_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (47,'2018_11_19_124817_add_output_to_backups',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (48,'2018_11_19_131921_add_name_to_backups',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (49,'2018_11_21_120452_add_file_name_to_backups',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (50,'2018_12_02_190514_add_to_clone_project_id_to_sites',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (51,'2018_12_15_185935_add_barsite_id_to_backups',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (52,'2018_12_19_222701_add_wp_user_to_sites',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (53,'2019_02_23_222749_add_wp_user_to_sites2',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (54,'2019_04_11_190413_add_laravel_version_to_sites',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (55,'2019_05_07_233534_add_wp_user_to_pete2',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (56,'2019_05_31_195009_add_shared_and_dashboard_user_id_to_sites',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (57,'2019_06_01_134937_add_dashboard_user_id_tobackups',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (58,'2019_06_12_184514_add_barserver_id_to_sites',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (59,'2019_07_26_205055_add_snapshots_to_sites',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (60,'2019_07_30_121833_add_label_to_backups',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (61,'2019_07_30_122159_add_manual_to_backups',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (62,'2019_08_05_114605_add_first_password',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (63,'2019_08_12_160522_add_shared_to_users',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (64,'2019_09_11_163954_add_wp_user_to_sites_if_not_exist',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (65,'2019_11_28_102130_add_sw_fields_to_users',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (66,'2019_12_05_143504_add_clone_fields_to_backups',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (67,'2019_12_14_000001_create_personal_access_tokens_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (68,'2020_02_15_213838_add_linode_id_to_sites',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (69,'2020_02_19_123934_add_linodes_ids',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (70,'2020_03_24_033748_add_cms_name_to_sites',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (71,'2020_04_26_174611_add_db_info_to_users',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (72,'2020_05_02_201943_add_filemanager_info_to_users',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (73,'2020_05_02_214219_add_filemanager_directory_to_users',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (74,'2020_05_13_212231_add_category_to_options',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (75,'2020_05_13_213808_add_privileges_to_options',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (76,'2020_05_13_221318_add_order_to_options',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (77,'2020_06_10_112917_add_version_to_options',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (78,'2020_06_10_115031_add_output_to_user',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (79,'2020_07_28_165424_add_title_to_options',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (80,'2020_08_23_104348_add_user_id_to_backups',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (81,'2020_08_23_110552_add_barserver_id_to_backups',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (82,'2020_08_23_111031_add_backup_days_id_to_sites',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (83,'2020_10_05_153504_add_mod_sw_to_sites',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (84,'2020_12_01_230111_change_sites_timestamps_to_nullable',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (85,'2021_04_27_213948_add_contact_me_again_to_users',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (86,'2021_06_14_164702_add_internal_ip_to_barserver',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (87,'2022_05_06_144118_create_domains_table',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (88,'2022_08_08_185911_add_serverstatus_sw_to_barservers',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (89,'2022_10_19_163913_add_integration_type_to_sites',1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (90,'2025_06_30_140225_add_speed_up_to_sites_table',1);
