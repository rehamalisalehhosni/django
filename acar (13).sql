-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 05, 2016 at 01:50 PM
-- Server version: 5.5.47-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `acar`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_emailaddress`
--

CREATE TABLE IF NOT EXISTS `account_emailaddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `account_emailaddress_user_id_2c513194_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `account_emailconfirmation`
--

CREATE TABLE IF NOT EXISTS `account_emailconfirmation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `sent` datetime DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  `email_address_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `account_ema_email_address_id_5b7f8c58_fk_account_emailaddress_id` (`email_address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=76 ;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add users', 7, 'add_users'),
(20, 'Can change users', 7, 'change_users'),
(21, 'Can delete users', 7, 'delete_users'),
(22, 'Can add categories', 8, 'add_categories'),
(23, 'Can change categories', 8, 'change_categories'),
(24, 'Can delete categories', 8, 'delete_categories'),
(25, 'Can add country', 9, 'add_country'),
(26, 'Can change country', 9, 'change_country'),
(27, 'Can delete country', 9, 'delete_country'),
(28, 'Can add city', 10, 'add_city'),
(29, 'Can change city', 10, 'change_city'),
(30, 'Can delete city', 10, 'delete_city'),
(31, 'Can add section', 11, 'add_section'),
(32, 'Can change section', 11, 'change_section'),
(33, 'Can delete section', 11, 'delete_section'),
(34, 'Can add property', 12, 'add_property'),
(35, 'Can change property', 12, 'change_property'),
(36, 'Can delete property', 12, 'delete_property'),
(37, 'Can add property image', 13, 'add_propertyimage'),
(38, 'Can change property image', 13, 'change_propertyimage'),
(39, 'Can delete property image', 13, 'delete_propertyimage'),
(40, 'Can add comments', 14, 'add_comments'),
(41, 'Can change comments', 14, 'change_comments'),
(42, 'Can delete comments', 14, 'delete_comments'),
(43, 'Can add new projects', 15, 'add_newprojects'),
(44, 'Can change new projects', 15, 'change_newprojects'),
(45, 'Can delete new projects', 15, 'delete_newprojects'),
(46, 'Can add units', 16, 'add_units'),
(47, 'Can change units', 16, 'change_units'),
(48, 'Can delete units', 16, 'delete_units'),
(49, 'Can add new projects image', 17, 'add_newprojectsimage'),
(50, 'Can change new projects image', 17, 'change_newprojectsimage'),
(51, 'Can delete new projects image', 17, 'delete_newprojectsimage'),
(52, 'Can add luxury', 18, 'add_luxury'),
(53, 'Can change luxury', 18, 'change_luxury'),
(54, 'Can delete luxury', 18, 'delete_luxury'),
(55, 'Can add luxury image', 19, 'add_luxuryimage'),
(56, 'Can change luxury image', 19, 'change_luxuryimage'),
(57, 'Can delete luxury image', 19, 'delete_luxuryimage'),
(58, 'Can add site', 20, 'add_site'),
(59, 'Can change site', 20, 'change_site'),
(60, 'Can delete site', 20, 'delete_site'),
(61, 'Can add email address', 21, 'add_emailaddress'),
(62, 'Can change email address', 21, 'change_emailaddress'),
(63, 'Can delete email address', 21, 'delete_emailaddress'),
(64, 'Can add email confirmation', 22, 'add_emailconfirmation'),
(65, 'Can change email confirmation', 22, 'change_emailconfirmation'),
(66, 'Can delete email confirmation', 22, 'delete_emailconfirmation'),
(67, 'Can add social application', 23, 'add_socialapp'),
(68, 'Can change social application', 23, 'change_socialapp'),
(69, 'Can delete social application', 23, 'delete_socialapp'),
(70, 'Can add social account', 24, 'add_socialaccount'),
(71, 'Can change social account', 24, 'change_socialaccount'),
(72, 'Can delete social account', 24, 'delete_socialaccount'),
(73, 'Can add social application token', 25, 'add_socialtoken'),
(74, 'Can change social application token', 25, 'change_socialtoken'),
(75, 'Can delete social application token', 25, 'delete_socialtoken');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$24000$VcTO9Qnn5sRU$AxpcX49CSgrCCuu6TI0gxb7IEhvLQ4dL0pSmVis8uQk=', '2016-04-04 17:00:07', 1, 'admin', '', '', 'admin@gmail.com', 1, 1, '2016-04-04 15:50:59'),
(2, '!K7mKzUB4pK1MxptBqR54pvj0biXUU9vpfxTmcyhJ', '2016-04-05 03:34:30', 0, 'reham', 'Reham', 'Elkhawaga', '', 0, 1, '2016-04-04 15:58:42'),
(3, 'pbkdf2_sha256$24000$dvUiwkEJWUWf$mbBtElgqsVJCIvSi2U/x6sFv1IJnm2BqQ/k2eZeh224=', '2016-04-04 16:20:10', 0, 'support', '', '', 'support@gmail.com', 0, 1, '2016-04-04 16:17:02');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2016-04-04 15:54:02', '1', 'http://localhost:8000/', 2, 'Changed domain and name.', 20, 1),
(2, '2016-04-04 15:54:57', '1', 'facebook', 1, 'Added.', 23, 1),
(3, '2016-04-04 16:47:18', '1', 'NewProjects object', 1, 'Added.', 15, 1),
(4, '2016-04-04 16:48:14', '1', 'NewProjectsImage object', 1, 'Added.', 17, 1),
(5, '2016-04-04 16:49:06', '1', 'Units object', 1, 'Added.', 16, 1),
(6, '2016-04-04 17:00:44', '1', 'data', 1, 'Added.', 18, 1),
(7, '2016-04-04 17:00:44', '2', 'data', 1, 'Added.', 18, 1),
(8, '2016-04-04 17:02:15', '4', 'LuxuryImage object', 1, 'Added.', 19, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(21, 'account', 'emailaddress'),
(22, 'account', 'emailconfirmation'),
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(8, 'project_app', 'categories'),
(10, 'project_app', 'city'),
(14, 'project_app', 'comments'),
(9, 'project_app', 'country'),
(18, 'project_app', 'luxury'),
(19, 'project_app', 'luxuryimage'),
(15, 'project_app', 'newprojects'),
(17, 'project_app', 'newprojectsimage'),
(12, 'project_app', 'property'),
(13, 'project_app', 'propertyimage'),
(11, 'project_app', 'section'),
(16, 'project_app', 'units'),
(7, 'project_app', 'users'),
(6, 'sessions', 'session'),
(20, 'sites', 'site'),
(24, 'socialaccount', 'socialaccount'),
(23, 'socialaccount', 'socialapp'),
(25, 'socialaccount', 'socialtoken');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2016-04-04 15:49:04'),
(2, 'auth', '0001_initial', '2016-04-04 15:49:07'),
(3, 'account', '0001_initial', '2016-04-04 15:49:08'),
(4, 'account', '0002_email_max_length', '2016-04-04 15:49:08'),
(5, 'admin', '0001_initial', '2016-04-04 15:49:09'),
(6, 'admin', '0002_logentry_remove_auto_add', '2016-04-04 15:49:09'),
(7, 'contenttypes', '0002_remove_content_type_name', '2016-04-04 15:49:09'),
(8, 'auth', '0002_alter_permission_name_max_length', '2016-04-04 15:49:10'),
(9, 'auth', '0003_alter_user_email_max_length', '2016-04-04 15:49:10'),
(10, 'auth', '0004_alter_user_username_opts', '2016-04-04 15:49:10'),
(11, 'auth', '0005_alter_user_last_login_null', '2016-04-04 15:49:10'),
(12, 'auth', '0006_require_contenttypes_0002', '2016-04-04 15:49:10'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2016-04-04 15:49:10'),
(14, 'project_app', '0001_initial', '2016-04-04 15:49:17'),
(15, 'sessions', '0001_initial', '2016-04-04 15:49:17'),
(16, 'sites', '0001_initial', '2016-04-04 15:49:17'),
(17, 'sites', '0002_alter_domain_unique', '2016-04-04 15:49:17'),
(18, 'socialaccount', '0001_initial', '2016-04-04 15:49:19'),
(19, 'socialaccount', '0002_token_max_lengths', '2016-04-04 15:49:20'),
(20, 'socialaccount', '0003_extra_data_default_dict', '2016-04-04 15:49:20'),
(21, 'project_app', '0002_auto_20160405_0342', '2016-04-05 03:42:53'),
(22, 'project_app', '0003_auto_20160405_0425', '2016-04-05 04:25:45');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('7oghjn1a6ecpcdxxif068mpvdie3hsyv', 'NDY1NWEzOGVlNTBjOGEyZGY3Y2UzNzk1Y2Q3NGM0Y2VjMGUyM2NjZjp7Il9hdXRoX3VzZXJfaGFzaCI6ImM1ZjExZmVmOTM4ZDhkZmYxM2E1MWNiNjcwMThhODhhMjg1OWM4MzIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJhbGxhdXRoLmFjY291bnQuYXV0aF9iYWNrZW5kcy5BdXRoZW50aWNhdGlvbkJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMiJ9', '2016-04-19 03:34:30'),
('bweewgpgp9qqq7wnyrskv2jl33nl445g', 'ZmRmZjA2MDZiYWZmM2I3ZTM3N2FlNzMyYTM4NzQ4YWY1Yjk3MWVhZjp7InVzZXJfaWQiOjEsIl9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJ1c2VyIjoic3VwcG9ydCIsImFjdGl2ZSI6MSwiX2F1dGhfdXNlcl9oYXNoIjoiMTc5MjUwMTU3NjkxOGY3YzU3NDZhMzdhZGRlZTZhODY2MWIzYjJjNCJ9', '2016-04-18 16:20:10');

-- --------------------------------------------------------

--
-- Table structure for table `django_site`
--

CREATE TABLE IF NOT EXISTS `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `django_site`
--

INSERT INTO `django_site` (`id`, `domain`, `name`) VALUES
(1, 'http://localhost:8000/', 'mysite.com');

-- --------------------------------------------------------

--
-- Table structure for table `project_app_categories`
--

CREATE TABLE IF NOT EXISTS `project_app_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `project_app_categories`
--

INSERT INTO `project_app_categories` (`id`, `category_name`) VALUES
(1, 'Apartment'),
(2, 'Building'),
(3, 'Chalet'),
(4, 'Furnished Apartment'),
(5, 'Land'),
(6, 'Farm'),
(7, 'Office'),
(8, 'Clinic'),
(9, 'Store'),
(10, 'Villa'),
(11, 'Palace'),
(12, 'Town House');

-- --------------------------------------------------------

--
-- Table structure for table `project_app_city`
--

CREATE TABLE IF NOT EXISTS `project_app_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_name` varchar(255) NOT NULL,
  `coun_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project_app_city_0c741588` (`coun_id_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `project_app_city`
--

INSERT INTO `project_app_city` (`id`, `city_name`, `coun_id_id`) VALUES
(1, 'cairo', 1),
(2, 'mansoura', 1),
(3, 'alex', 1),
(4, 'sharm', 1),
(5, 'berlin', 2),
(6, 'frankfourt', 2);

-- --------------------------------------------------------

--
-- Table structure for table `project_app_comments`
--

CREATE TABLE IF NOT EXISTS `project_app_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` longtext NOT NULL,
  `coun_id_id` int(11) NOT NULL,
  `pro_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project_app_comments_335bd4a3` (`pro_id_id`),
  KEY `project_app_comments_coun_id_id_07bebc69_fk_auth_user_id` (`coun_id_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `project_app_comments`
--

INSERT INTO `project_app_comments` (`id`, `comment`, `coun_id_id`, `pro_id_id`) VALUES
(1, 'hiiiiiiiiiiiiiii', 3, 1),
(3, 'hioooooooooooooo', 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `project_app_country`
--

CREATE TABLE IF NOT EXISTS `project_app_country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `project_app_country`
--

INSERT INTO `project_app_country` (`id`, `country_name`) VALUES
(1, 'Egypt'),
(2, 'germany'),
(3, 'Australia');

-- --------------------------------------------------------

--
-- Table structure for table `project_app_luxury`
--

CREATE TABLE IF NOT EXISTS `project_app_luxury` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lux_id` int(11) NOT NULL,
  `lux_name` varchar(255) NOT NULL,
  `area` double NOT NULL,
  `price` double NOT NULL,
  `Description` longtext NOT NULL,
  `address` longtext NOT NULL,
  `longtiude` double NOT NULL,
  `latitude` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `project_app_luxury`
--

INSERT INTO `project_app_luxury` (`id`, `lux_id`, `lux_name`, `area`, `price`, `Description`, `address`, `longtiude`, `latitude`) VALUES
(1, 1, 'data', 3421.33, 200, 'data', 'Maadi', 3421.33, 3421.33),
(2, 1, 'data', 3421.33, 200, 'data', 'Maadi', 3421.33, 3421.33);

-- --------------------------------------------------------

--
-- Table structure for table `project_app_luxuryimage`
--

CREATE TABLE IF NOT EXISTS `project_app_luxuryimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_name` varchar(100) NOT NULL,
  `lux_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project_app_luxuryim_lux_id_id_a6224701_fk_project_app_luxury_id` (`lux_id_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `project_app_luxuryimage`
--

INSERT INTO `project_app_luxuryimage` (`id`, `image_name`, `lux_id_id`) VALUES
(4, 'Luxury_images/SmartBuilding.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `project_app_newprojects`
--

CREATE TABLE IF NOT EXISTS `project_app_newprojects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_id` int(11) NOT NULL,
  `pro_name` varchar(255) NOT NULL,
  `Description` longtext NOT NULL,
  `Address` longtext NOT NULL,
  `Services` longtext NOT NULL,
  `PaymentMethods` longtext NOT NULL,
  `DeliveryDate` longtext NOT NULL,
  `OwnerCompany` longtext NOT NULL,
  `longtiude` double NOT NULL,
  `latitude` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `project_app_newprojects`
--

INSERT INTO `project_app_newprojects` (`id`, `pro_id`, `pro_name`, `Description`, `Address`, `Services`, `PaymentMethods`, `DeliveryDate`, `OwnerCompany`, `longtiude`, `latitude`) VALUES
(1, 1, 'data', 'data', 'data', 'data', 'data', 'data', 'data', 3421.33, 23242);

-- --------------------------------------------------------

--
-- Table structure for table `project_app_newprojectsimage`
--

CREATE TABLE IF NOT EXISTS `project_app_newprojectsimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_name` varchar(100) NOT NULL,
  `proj_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project_app_ne_proj_id_id_54159f5b_fk_project_app_newprojects_id` (`proj_id_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `project_app_newprojectsimage`
--

INSERT INTO `project_app_newprojectsimage` (`id`, `image_name`, `proj_id_id`) VALUES
(1, 'NewProjects_images/images.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `project_app_property`
--

CREATE TABLE IF NOT EXISTS `project_app_property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prop_name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `youtube` varchar(255) NOT NULL,
  `phone` int(11) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `area` double NOT NULL,
  `price` double NOT NULL,
  `preview` longtext NOT NULL,
  `details` longtext NOT NULL,
  `longtiude` longtext NOT NULL,
  `Latitude` longtext NOT NULL,
  `cat_id_id` int(11) NOT NULL,
  `city_id_id` int(11) NOT NULL,
  `country_id_id` int(11) NOT NULL,
  `sec_id_id` int(11) NOT NULL,
  `uid_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project_app_prop_cat_id_id_22e2e59c_fk_project_app_categories_id` (`cat_id_id`),
  KEY `project_app_property_city_id_id_af9c5ea8_fk_project_app_city_id` (`city_id_id`),
  KEY `project_app_pro_country_id_id_905fe8f7_fk_project_app_country_id` (`country_id_id`),
  KEY `project_app_property_61e24904` (`sec_id_id`),
  KEY `project_app_property_71422c2d` (`uid_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `project_app_property`
--

INSERT INTO `project_app_property` (`id`, `prop_name`, `address`, `youtube`, `phone`, `owner`, `area`, `price`, `preview`, `details`, `longtiude`, `Latitude`, `cat_id_id`, `city_id_id`, `country_id_id`, `sec_id_id`, `uid_id`) VALUES
(1, 'acar data', 'acar data', 'https://www.youtube.com/embed/AxJ5-Beio68', 2147483647, 'acar data', 22.2, 222.2, 'acar data', 'acar data  acar data  acar data  acar data  acar data  acar data  acar data  acar data  acar data  acar data  \r\nacar data  acar data  acar data  acar data  acar data  acar data  acar data  acar data  acar data  acar data', '37.8049371438', '33.5026128026', 1, 1, 1, 1, 2),
(2, 'acar 2', 'first', 'https://www.youtube.com/embed/AxJ5-Beio68', 2147483647, 'first', 12133133, 2323, 'first', 'first', '155.30847399902302', '-31.995944605586768', 1, 1, 1, 1, 2),
(4, 'acar', 'first', 'https://www.youtube.com/embed/AxJ5-Beio68', 2147483647, 'first', 3421.33, 100000000, 'first', 'first  firstfirstfirstfirst first  firstfirstfirstfirst', '151.298464233398', '-33.8402886075606', 1, 1, 1, 1, 2),
(5, 'my acar', 'data', 'https://www.youtube.com/embed/AxJ5-Beio68', 874397968, 'data', 22002, 222, 'data', 'data   datadatadatadatadata data   datadatadatadatadata data   datadatadatadatadata', '151.298464233398', '-33.8402886075606', 1, 1, 1, 1, 2),
(6, 'alsahel  iooo', 'socond', 'https://www.youtube.com/embed/AxJ5-Beio68', 38247842, 'first', 3421.33, 200, 'first', 'alsahel  alsahel  alsahel', '34.20416810078132', '33.266394256054305', 1, 1, 1, 1, 2),
(7, 'acara iii', 'first', 'https://www.youtube.com/embed/AxJ5-Beio68', 2147483647, 'first', 3421.33, 8000, 'first', 'acara iii  acara iii  acara iii', '35.72989441914069', '32.45893675345939', 1, 1, 1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `project_app_propertyimage`
--

CREATE TABLE IF NOT EXISTS `project_app_propertyimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_name` varchar(100) NOT NULL,
  `pro_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project_app_proper_pro_id_id_ecfdca25_fk_project_app_property_id` (`pro_id_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `project_app_propertyimage`
--

INSERT INTO `project_app_propertyimage` (`id`, `image_name`, `pro_id_id`) VALUES
(1, 'property_images/SmartBuilding.jpg', 1),
(2, 'property_images/SmartBuilding_DXTqodR.jpg', 1),
(3, 'property_images/images.jpg', 1),
(4, 'property_images/SmartBuilding_lOyngse.jpg', 2),
(5, 'property_images/download.jpg', 2),
(6, 'property_images/SmartBuilding_hkLr8up.jpg', 2),
(10, 'property_images/commercial-buildings_1_MpXwNoY.jpg', 4),
(11, 'property_images/commercial-buildings.jpg', 4),
(12, 'property_images/download_uo8lSaf.jpg', 4),
(13, 'property_images/SmartBuilding_UtZxfqM.jpg', 5),
(14, 'property_images/download_StQfEfw.jpg', 5),
(15, 'property_images/commercial-buildings_mAW1i1c.jpg', 5),
(16, 'property_images/commercial-buildings_1_MpXwNoY_NdY7LvQ.jpg', 6),
(18, 'property_images/images_uzw2ckA.jpg', 6),
(19, 'property_images/images_w2l7X1G_GKZtc1x.jpg', 7),
(20, 'property_images/SmartBuilding_GRm4eY6.jpg', 7),
(21, 'property_images/download_StQfEfw_ILsmjry.jpg', 7);

-- --------------------------------------------------------

--
-- Table structure for table `project_app_section`
--

CREATE TABLE IF NOT EXISTS `project_app_section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sec_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `project_app_section`
--

INSERT INTO `project_app_section` (`id`, `sec_name`) VALUES
(1, 'Old Rent'),
(2, 'Sale'),
(3, 'New Rent');

-- --------------------------------------------------------

--
-- Table structure for table `project_app_units`
--

CREATE TABLE IF NOT EXISTS `project_app_units` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_id` int(11) NOT NULL,
  `unit_name` varchar(255) NOT NULL,
  `min_area` double NOT NULL,
  `max_area` double NOT NULL,
  `minPrice` double NOT NULL,
  `maxPrice` double NOT NULL,
  `project_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project_app_project_id_id_979c7517_fk_project_app_newprojects_id` (`project_id_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `project_app_units`
--

INSERT INTO `project_app_units` (`id`, `unit_id`, `unit_name`, `min_area`, `max_area`, `minPrice`, `maxPrice`, `project_id_id`) VALUES
(1, 1, 'small', 100, 200, 10000, 10000000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `project_app_users`
--

CREATE TABLE IF NOT EXISTS `project_app_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `points` int(11) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `phone` int(11) NOT NULL,
  `picture` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `project_app_users`
--

INSERT INTO `project_app_users` (`id`, `points`, `age`, `token`, `phone`, `picture`, `user_id`) VALUES
(1, NULL, 23, NULL, 2147483647, 'profile_images/scale.jpg', 3);

-- --------------------------------------------------------

--
-- Table structure for table `socialaccount_socialaccount`
--

CREATE TABLE IF NOT EXISTS `socialaccount_socialaccount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `uid` varchar(191) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  `extra_data` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialaccount_provider_fc810c6e_uniq` (`provider`,`uid`),
  KEY `socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `socialaccount_socialaccount`
--

INSERT INTO `socialaccount_socialaccount` (`id`, `provider`, `uid`, `last_login`, `date_joined`, `extra_data`, `user_id`) VALUES
(1, 'facebook', '1286059664744523', '2016-04-05 03:34:29', '2016-04-04 15:58:42', '{"first_name": "Reham", "last_name": "Elkhawaga", "verified": true, "name": "Reham Elkhawaga", "locale": "en_GB", "gender": "female", "updated_time": "2015-09-09T07:35:04+0000", "link": "https://www.facebook.com/app_scoped_user_id/1286059664744523/", "timezone": 2, "id": "1286059664744523"}', 2);

-- --------------------------------------------------------

--
-- Table structure for table `socialaccount_socialapp`
--

CREATE TABLE IF NOT EXISTS `socialaccount_socialapp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `name` varchar(40) NOT NULL,
  `client_id` varchar(191) NOT NULL,
  `secret` varchar(191) NOT NULL,
  `key` varchar(191) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `socialaccount_socialapp`
--

INSERT INTO `socialaccount_socialapp` (`id`, `provider`, `name`, `client_id`, `secret`, `key`) VALUES
(1, 'facebook', 'facebook', '591487017674211', 'f0905238511ff014dc44ecb05ad3820c', '');

-- --------------------------------------------------------

--
-- Table structure for table `socialaccount_socialapp_sites`
--

CREATE TABLE IF NOT EXISTS `socialaccount_socialapp_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `socialapp_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialapp_sites_socialapp_id_71a9a768_uniq` (`socialapp_id`,`site_id`),
  KEY `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` (`site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `socialaccount_socialapp_sites`
--

INSERT INTO `socialaccount_socialapp_sites` (`id`, `socialapp_id`, `site_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `socialaccount_socialtoken`
--

CREATE TABLE IF NOT EXISTS `socialaccount_socialtoken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` longtext NOT NULL,
  `token_secret` longtext NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialtoken_app_id_fca4e0ac_uniq` (`app_id`,`account_id`),
  KEY `socialacco_account_id_951f210e_fk_socialaccount_socialaccount_id` (`account_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `socialaccount_socialtoken`
--

INSERT INTO `socialaccount_socialtoken` (`id`, `token`, `token_secret`, `expires_at`, `account_id`, `app_id`) VALUES
(1, 'CAAIZA9E2T5eMBADJI5zFiW7uNxI6rKtBQFIGEMyZCLKtorRzivIIOsqlmn8kgi6e7qyyHtwobAUqCAswVTH14RT3XMf681dQ4Fv9gcZCSpQvAolKKQZC2s0GQFAZCt8nZBMDmVKUafByM2IYIzWYElMwtBcQ6pKS01dFfZCA8vuHOL6Wd5AasJn8fZCUZBC5tB0KugRaARtRcsAZDZD', '', NULL, 1, 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account_emailaddress`
--
ALTER TABLE `account_emailaddress`
  ADD CONSTRAINT `account_emailaddress_user_id_2c513194_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `account_emailconfirmation`
--
ALTER TABLE `account_emailconfirmation`
  ADD CONSTRAINT `account_ema_email_address_id_5b7f8c58_fk_account_emailaddress_id` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `project_app_city`
--
ALTER TABLE `project_app_city`
  ADD CONSTRAINT `project_app_city_coun_id_id_722f2a77_fk_project_app_country_id` FOREIGN KEY (`coun_id_id`) REFERENCES `project_app_country` (`id`);

--
-- Constraints for table `project_app_comments`
--
ALTER TABLE `project_app_comments`
  ADD CONSTRAINT `project_app_comments_coun_id_id_07bebc69_fk_auth_user_id` FOREIGN KEY (`coun_id_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `project_app_commen_pro_id_id_eb368e63_fk_project_app_property_id` FOREIGN KEY (`pro_id_id`) REFERENCES `project_app_property` (`id`);

--
-- Constraints for table `project_app_luxuryimage`
--
ALTER TABLE `project_app_luxuryimage`
  ADD CONSTRAINT `project_app_luxuryim_lux_id_id_a6224701_fk_project_app_luxury_id` FOREIGN KEY (`lux_id_id`) REFERENCES `project_app_luxury` (`id`);

--
-- Constraints for table `project_app_newprojectsimage`
--
ALTER TABLE `project_app_newprojectsimage`
  ADD CONSTRAINT `project_app_ne_proj_id_id_54159f5b_fk_project_app_newprojects_id` FOREIGN KEY (`proj_id_id`) REFERENCES `project_app_newprojects` (`id`);

--
-- Constraints for table `project_app_property`
--
ALTER TABLE `project_app_property`
  ADD CONSTRAINT `project_app_property_city_id_id_af9c5ea8_fk_project_app_city_id` FOREIGN KEY (`city_id_id`) REFERENCES `project_app_city` (`id`),
  ADD CONSTRAINT `project_app_property_uid_id_3e9b7116_fk_auth_user_id` FOREIGN KEY (`uid_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `project_app_propert_sec_id_id_48228454_fk_project_app_section_id` FOREIGN KEY (`sec_id_id`) REFERENCES `project_app_section` (`id`),
  ADD CONSTRAINT `project_app_prop_cat_id_id_22e2e59c_fk_project_app_categories_id` FOREIGN KEY (`cat_id_id`) REFERENCES `project_app_categories` (`id`),
  ADD CONSTRAINT `project_app_pro_country_id_id_905fe8f7_fk_project_app_country_id` FOREIGN KEY (`country_id_id`) REFERENCES `project_app_country` (`id`);

--
-- Constraints for table `project_app_propertyimage`
--
ALTER TABLE `project_app_propertyimage`
  ADD CONSTRAINT `project_app_proper_pro_id_id_ecfdca25_fk_project_app_property_id` FOREIGN KEY (`pro_id_id`) REFERENCES `project_app_property` (`id`);

--
-- Constraints for table `project_app_units`
--
ALTER TABLE `project_app_units`
  ADD CONSTRAINT `project_app_project_id_id_979c7517_fk_project_app_newprojects_id` FOREIGN KEY (`project_id_id`) REFERENCES `project_app_newprojects` (`id`);

--
-- Constraints for table `project_app_users`
--
ALTER TABLE `project_app_users`
  ADD CONSTRAINT `project_app_users_user_id_e43bef6c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `socialaccount_socialaccount`
--
ALTER TABLE `socialaccount_socialaccount`
  ADD CONSTRAINT `socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `socialaccount_socialapp_sites`
--
ALTER TABLE `socialaccount_socialapp_sites`
  ADD CONSTRAINT `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`),
  ADD CONSTRAINT `socialaccoun_socialapp_id_97fb6e7d_fk_socialaccount_socialapp_id` FOREIGN KEY (`socialapp_id`) REFERENCES `socialaccount_socialapp` (`id`);

--
-- Constraints for table `socialaccount_socialtoken`
--
ALTER TABLE `socialaccount_socialtoken`
  ADD CONSTRAINT `socialaccount_soci_app_id_636a42d7_fk_socialaccount_socialapp_id` FOREIGN KEY (`app_id`) REFERENCES `socialaccount_socialapp` (`id`),
  ADD CONSTRAINT `socialacco_account_id_951f210e_fk_socialaccount_socialaccount_id` FOREIGN KEY (`account_id`) REFERENCES `socialaccount_socialaccount` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
