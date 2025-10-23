-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3307
-- Generation Time: Oct 23, 2025 at 07:18 AM
-- Server version: 8.4.3
-- PHP Version: 8.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mini_pos2`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `made_in` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `logo`, `website`, `made_in`, `active`, `created_at`, `updated_at`) VALUES
(1, 'Apple', 'logos/01JYMY5AC8GM3G3ZMKVH7E1CE5.jpg', 'https://apple.com', 'American', 1, '2025-06-14 05:51:38', '2025-10-17 05:05:49'),
(2, 'Dell', 'logos/01JYMY4TAB8WHRWJ1XY0WR5FSB.jpg', 'https://dell.com', 'American', 1, '2025-06-14 05:51:38', '2025-10-17 05:05:32'),
(3, 'Asus', 'logos/01JYMXYTXCWMN95V5G65S4HXDS.jpg', 'https://asus.com', 'Taiwan', 1, '2025-06-14 05:51:38', '2025-10-17 05:06:27'),
(4, 'Lenovo', 'logos/01JYMY6VSQRC3Q20EZKMMR4Y60.jpg', 'https://lenovo.com', 'China', 1, '2025-06-14 05:51:38', '2025-10-23 03:27:34'),
(5, 'Asus ROG', 'logos/01JYMY8PWBM83NC5T4QF4P85JE.jpg', 'https://www.asus.com', 'Taiwan', 1, '2025-06-26 01:39:49', '2025-10-17 05:03:46'),
(6, 'Razer', 'logos/01JYMYBZJP0BE818VVBV1402Q4.jpg', 'https://www.razer.com', 'American', 1, '2025-06-26 01:41:51', '2025-10-17 05:07:46'),
(7, 'MSI', 'logos/01JYMYKN7EGA1NHBYV4V35ER81.jpg', 'https://www.msi.com', 'Taiwan', 1, '2025-06-26 01:46:03', '2025-10-17 05:04:42'),
(8, 'Acer', 'logos/01JYMYTHBVT1FB88CQV3EV94PG.jpg', 'https://www.acer.com', 'Taiwan', 1, '2025-06-26 01:49:48', '2025-10-23 03:27:11'),
(9, 'HP', 'logos/01JYMYWQNMY162R8SCNTX8KP4K.jpg', 'https://www.hp.com', 'American', 1, '2025-06-26 01:51:00', '2025-10-23 03:28:11'),
(10, 'NO Brand', NULL, NULL, NULL, 1, '2025-06-26 01:52:37', '2025-06-26 01:52:37'),
(11, 'Samsung', 'logos/01JYMZ2MWEE0T013XXPVP5JPD0.jpg', 'https://www.samsung.com', 'South Korea', 1, '2025-06-26 01:54:14', '2025-10-23 03:30:32'),
(12, 'AlienWare', 'logos/01JYMZZHK5SEQ1SNPWARHJ1WZB.jpg', 'https://thealienware.com/', 'American', 1, '2025-06-26 02:10:01', '2025-10-23 03:31:58'),
(13, 'Logitech', 'logos/01K357JNQQ1AK1Y6D9TWKAZZA5.jpg', 'https://www.logitech.com', 'American', 1, '2025-08-21 02:33:26', '2025-10-23 03:36:03'),
(14, 'Redragon', 'logos/01K357MJWN2C0WGKVHH2AH4ZF5.jpg', 'https://www.redragonzone.com/', 'China', 1, '2025-08-21 02:34:29', '2025-10-23 03:36:40'),
(15, 'SteelSeries', 'logos/01K357NZXZE7G1B1AHKDT49G1C.jpg', 'https://steelseries.com', 'China', 1, '2025-08-21 02:35:15', '2025-10-23 03:37:18'),
(16, 'Onikuma', 'logos/01K357Q9HFRGMHS9DG2KQAPEW0.jpg', 'https://www.onikuma.com', 'China', 1, '2025-08-21 02:35:57', '2025-10-23 03:39:35'),
(17, 'HyperX', 'logos/01K357RJYT9WP87PGQNS78HK4F.jpg', 'https://hyperx.com/', 'China', 1, '2025-08-21 02:36:40', '2025-10-23 03:38:20'),
(18, 'Akko', 'logos/01K357SSKWYW5GES9KKBYGWXX9.jpg', 'https://en.akkogear.com', 'China', 1, '2025-08-21 02:37:19', '2025-10-23 03:38:47'),
(19, 'Aula', 'logos/01K357V40N2FZ8CNJT1GDENGPW.jpg', 'https://www.aulastar.com', 'China', 1, '2025-08-21 02:38:03', '2025-10-23 03:39:16'),
(20, 'Crucial', NULL, NULL, NULL, 1, '2025-09-10 14:55:39', '2025-09-10 14:55:39'),
(21, 'MARVO', NULL, NULL, NULL, 1, '2025-09-12 16:09:01', '2025-09-12 16:09:01'),
(22, 'NZXT', NULL, NULL, NULL, 1, '2025-09-12 16:13:01', '2025-09-12 16:13:01'),
(23, 'AMD', NULL, NULL, NULL, 1, '2025-09-15 05:15:36', '2025-09-15 05:15:36');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('tl_gold_computer_cache_1b6453892473a467d07372d45eb05abc2031647a', 'i:2;', 1761201287),
('tl_gold_computer_cache_1b6453892473a467d07372d45eb05abc2031647a:timer', 'i:1761201287;', 1761201287),
('tl_gold_computer_cache_356a192b7913b04c54574d18c28d46e6395428ab', 'i:1;', 1761053277),
('tl_gold_computer_cache_356a192b7913b04c54574d18c28d46e6395428ab:timer', 'i:1761053277;', 1761053277),
('tl_gold_computer_cache_902ba3cda1883801594b6e1b452790cc53948fda', 'i:1;', 1761199431),
('tl_gold_computer_cache_902ba3cda1883801594b6e1b452790cc53948fda:timer', 'i:1761199431;', 1761199431),
('tl_gold_computer_cache_c1dfd96eea8cc2b62785275bca38ac261256e278', 'i:1;', 1761200086),
('tl_gold_computer_cache_c1dfd96eea8cc2b62785275bca38ac261256e278:timer', 'i:1761200086;', 1761200086),
('tl_gold_computer_cache_livewire-rate-limiter:056fc329aaaa757d31db450f525da23fde4d1b36', 'i:4;', 1761202842),
('tl_gold_computer_cache_livewire-rate-limiter:056fc329aaaa757d31db450f525da23fde4d1b36:timer', 'i:1761202842;', 1761202842),
('tl_gold_computer_cache_livewire-rate-limiter:659c3259552bbc727b07716b40b79c961f9e8d70', 'i:1;', 1761202682),
('tl_gold_computer_cache_livewire-rate-limiter:659c3259552bbc727b07716b40b79c961f9e8d70:timer', 'i:1761202682;', 1761202682),
('tl_gold_computer_cache_livewire-rate-limiter:a17961fa74e9275d529f489537f179c05d50c2f3', 'i:2;', 1761201933),
('tl_gold_computer_cache_livewire-rate-limiter:a17961fa74e9275d529f489537f179c05d50c2f3:timer', 'i:1761201933;', 1761201933),
('tl_gold_computer_cache_livewire-rate-limiter:f37e656703f3614ee878bab6d07aa8da08fc999d', 'i:2;', 1761202668),
('tl_gold_computer_cache_livewire-rate-limiter:f37e656703f3614ee878bab6d07aa8da08fc999d:timer', 'i:1761202668;', 1761202668);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `active`, `created_at`, `updated_at`) VALUES
(1, 'Laptop', '<p>full set laptop</p>', 1, '2025-06-14 05:51:38', '2025-06-26 01:55:40'),
(2, 'Smartphone', '<p>smart phone</p>', 1, '2025-06-14 05:51:38', '2025-06-26 01:55:52'),
(3, 'Headphone', '<p>headphone</p>', 1, '2025-06-14 05:51:38', '2025-06-26 01:55:00'),
(4, 'PC', '<p>Desktop full setup.</p>', 1, '2025-06-26 01:55:22', '2025-10-23 07:05:49'),
(5, 'PC parts', '<p>individual part of a desk top</p>', 1, '2025-06-26 01:56:14', '2025-06-26 01:56:14'),
(6, 'Laptop Part', '<p>individual part of a laptop that can be replace</p>', 1, '2025-06-26 01:56:42', '2025-06-26 01:56:42'),
(7, 'Mouse', '<p>Mouse and it\'s accesorry</p>', 1, '2025-06-26 01:57:05', '2025-06-26 02:03:55'),
(8, 'Mouse pad', '<p>pad for mouse</p>', 1, '2025-06-26 01:57:42', '2025-06-26 01:57:42'),
(9, 'Keyboard', '<p>key board for desk top</p>', 1, '2025-06-26 01:58:09', '2025-10-17 06:50:50'),
(10, 'Microphone', '<p>single microphone</p>', 1, '2025-06-26 01:58:40', '2025-06-26 01:58:40'),
(11, 'Camera', '<p>full camera or stream camera, all kind of camera</p>', 1, '2025-06-26 02:01:54', '2025-06-26 02:01:54'),
(12, 'Adapter and USB', '<p>all kinds of wire adapters and plugs,&nbsp;</p>', 1, '2025-06-26 02:05:12', '2025-06-26 02:06:07'),
(13, 'Monitor and TV', '<p>Monitor for desktop, and TV</p>', 1, '2025-06-26 02:07:11', '2025-06-26 02:07:11'),
(14, 'Accessory', '<p>Utilities devices.</p><p><br></p>', 1, '2025-09-12 16:09:12', '2025-10-23 07:06:37'),
(15, 'Cooling Pad', '<p>Boost your computer performance.</p><p><br></p>', 1, '2025-09-12 16:13:22', '2025-10-23 07:07:11');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `gender`, `phone`, `date_of_birth`, `address`, `active`, `created_at`, `updated_at`, `customer_code`) VALUES
(1, 'Gin visal', 'male', '010683974', '1997-11-12', 'unknown', 1, '2025-06-14 05:51:38', '2025-10-22 14:47:59', NULL),
(2, 'Miss Heidenreich DVM', 'female', '089642971', '2011-09-01', 'Street:  #E2-7, St.289-516 S/K Boeng kak I, Khan Toul kok', 1, '2025-06-14 05:51:38', '2025-10-22 14:48:16', NULL),
(3, 'Srey Nit', 'female', '076735192', '2005-09-17', 'Street:  #E2-7, St.289-516 S/K Boeng kak I, Khan Toul kok', 1, '2025-06-14 05:51:38', '2025-10-22 14:49:38', NULL),
(4, 'Nuon Sreyha', 'female', '0998712342', '2009-05-20', 'Street:  #113, St.41 (Norodom) S/K Chak Tomuk, Khan Daun Penh', 1, '2025-06-14 05:51:38', '2025-10-20 05:20:56', NULL),
(5, 'Pern Kongkea', 'male', '012873444', '1972-07-07', 'Street:  #113, St.41 (Norodom) S/K Chak Tomuk, Khan Daun Penh', 1, '2025-06-14 05:51:38', '2025-10-22 14:49:49', NULL),
(6, 'Ms. Angelita Kohler ', 'female', '078436621', '1971-10-29', 'Street:  #E2-7, St.289-516 S/K Boeng kak I, Khan Toul kok', 1, '2025-06-14 05:51:38', '2025-08-21 09:29:16', NULL),
(7, 'Tyra Bayer', 'male', '015218799', '1973-10-01', 'Street:  #E2-7, St.289-516 S/K Boeng kak I, Khan Toul kok', 1, '2025-06-14 05:51:38', '2025-10-22 14:49:09', NULL),
(8, 'Deja Erdman', 'male', '0663244571', '1975-07-17', 'Street:  National Road 6A S/K Prek Leap, Khan Ruessei Kaev', 1, '2025-06-14 05:51:38', '2025-08-21 09:30:18', NULL),
(9, 'Chan Sothea', 'female', '0924388721', '1991-01-17', 'Street:  National Road 6A S/K Prek Leap, Khan Ruessei Kaev', 1, '2025-06-14 05:51:38', '2025-10-23 05:38:09', NULL),
(10, 'Poun Jenie', 'female', '01277656712', '2012-12-05', 'Street:  #89Eo, St.286 S/K Olympic, Khan Chamkar Mon', 1, '2025-06-14 05:51:38', '2025-10-22 14:50:03', NULL),
(11, 'Hong Bunthea', 'male', '0899915731', '2000-01-01', 'none', 1, '2025-06-14 06:04:16', '2025-10-22 14:50:28', NULL),
(12, 'Nun Monte', 'male', '0776293761', '2004-01-07', 'Street 51 (Pasteur) – BKK1', 1, '2025-09-02 03:31:32', '2025-10-22 14:51:45', NULL),
(13, 'Sok Sophanan', 'male', '0776293761', '2001-03-11', 'Street 271 (Monireth Blvd) – Meanchey', 1, '2025-09-08 04:06:32', '2025-10-22 14:52:24', NULL),
(14, 'Sok Sami', 'female', '07765231', '1997-10-12', 'Street 2004 – Sen Sok', 1, '2025-09-09 12:38:57', '2025-10-22 14:52:48', NULL),
(15, 'Teng Hinching', 'female', '015463412', '1995-07-17', 'Street 63 – Boeung Keng Kang', 1, '2025-09-09 12:42:06', '2025-10-22 14:53:31', NULL),
(16, 'Tha Vathana', 'male', '099548983', '2000-11-20', 'Street 110 – Daun Penh', 1, '2025-09-15 03:18:04', '2025-10-22 14:53:52', NULL),
(17, 'Hong Nontie', 'male', '060874853', '2000-04-14', 'Street 182 – Toul Kork', 1, '2025-09-15 05:11:49', '2025-10-22 14:54:25', NULL),
(18, 'Bong Soun', 'male', '090657987', '2003-07-27', 'Street 105 – Chamkarmon', 1, '2025-09-15 06:57:07', '2025-10-22 14:54:55', NULL),
(19, 'Bong Thon', 'male', '066245123', '1999-07-19', 'Street 598 – Russey Keo', 1, '2025-10-09 14:03:29', '2025-10-22 14:55:27', NULL),
(20, 'Chan Vireak', 'male', '017542961', '1992-11-09', 'Street 352 – Toul Svay Prey', 1, '2025-10-09 14:05:03', '2025-10-22 14:56:00', NULL),
(21, 'Bon Thamit', 'male', '076381623', '1996-08-26', 'Street 432 – BKK3', 1, '2025-10-11 23:26:49', '2025-10-22 14:56:24', NULL),
(22, 'In Visal', 'male', '016834601', '1998-12-18', 'Street 193 – Toul Kork', 1, '2025-10-20 05:19:49', '2025-10-23 04:12:27', NULL),
(23, 'Sy Sothoun', 'male', '0962332321', '2001-02-23', 'Kilomet 6, Resussey Keo', 1, '2025-10-23 04:24:03', '2025-10-23 04:25:20', NULL),
(24, 'Sothearith', 'male', '012343534', '2003-09-23', 'ChruyChongva, Phnom Penh', 1, '2025-10-23 04:26:26', '2025-10-23 04:31:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `exports`
--

CREATE TABLE `exports` (
  `id` bigint UNSIGNED NOT NULL,
  `completed_at` timestamp NULL DEFAULT NULL,
  `file_disk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exporter` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `processed_rows` int UNSIGNED NOT NULL DEFAULT '0',
  `total_rows` int UNSIGNED NOT NULL,
  `successful_rows` int UNSIGNED NOT NULL DEFAULT '0',
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exports`
--

INSERT INTO `exports` (`id`, `completed_at`, `file_disk`, `file_name`, `exporter`, `processed_rows`, `total_rows`, `successful_rows`, `user_id`, `created_at`, `updated_at`) VALUES
(1, NULL, 'local', 'export-1-sale-items', 'App\\Filament\\Exports\\SaleItemExporter', 168, 168, 0, 1, '2025-09-02 02:21:00', '2025-09-02 02:32:50'),
(2, NULL, 'local', 'export-2-sale-items', 'App\\Filament\\Exports\\SaleItemExporter', 168, 168, 0, 1, '2025-09-02 02:22:59', '2025-09-02 02:32:47'),
(3, NULL, 'local', 'export-3-sale-items', 'App\\Filament\\Exports\\SaleItemExporter', 168, 168, 0, 1, '2025-09-02 02:23:50', '2025-09-02 02:32:49'),
(4, NULL, 'local', 'export-4-sale-items', 'App\\Filament\\Exports\\SaleItemExporter', 168, 168, 0, 1, '2025-09-02 02:31:44', '2025-09-02 02:32:48'),
(5, NULL, 'local', 'export-5-sale-items', 'App\\Filament\\Exports\\SaleItemExporter', 0, 168, 0, 1, '2025-09-02 02:34:34', '2025-09-02 02:34:34'),
(6, NULL, 'local', 'export-6-sale-items', 'App\\Filament\\Exports\\SaleItemExporter', 0, 168, 0, 1, '2025-09-02 02:34:55', '2025-09-02 02:34:55'),
(7, '2025-09-02 02:37:06', 'local', 'export-7-sale-items', 'App\\Filament\\Exports\\SaleItemExporter', 168, 168, 168, 1, '2025-09-02 02:37:06', '2025-09-02 02:37:06'),
(8, '2025-09-02 02:38:38', 'local', 'export-8-sale-items', 'App\\Filament\\Exports\\SaleItemExporter', 168, 168, 168, 1, '2025-09-02 02:38:38', '2025-09-02 02:38:38'),
(9, '2025-09-02 02:47:50', 'local', 'export-9-sale-items', 'App\\Filament\\Exports\\SaleItemExporter', 168, 168, 168, 1, '2025-09-02 02:47:50', '2025-09-02 02:47:50'),
(10, '2025-09-02 02:59:38', 'local', 'export-10-sale-items', 'App\\Filament\\Exports\\SaleItemExporter', 168, 168, 168, 1, '2025-09-02 02:59:38', '2025-09-02 02:59:38'),
(11, '2025-09-02 03:00:18', 'local', 'export-11-sale-items', 'App\\Filament\\Exports\\SaleItemExporter', 168, 168, 168, 1, '2025-09-02 03:00:17', '2025-09-02 03:00:18'),
(12, '2025-09-02 03:01:23', 'local', 'export-12-sale-items', 'App\\Filament\\Exports\\SaleItemExporter', 168, 168, 168, 1, '2025-09-02 03:01:23', '2025-09-02 03:01:23'),
(13, '2025-09-02 04:30:35', 'local', 'export-13-sales', 'App\\Filament\\Exports\\SaleExporter', 5, 5, 5, 1, '2025-09-02 04:30:35', '2025-09-02 04:30:35'),
(14, '2025-09-02 05:39:14', 'local', 'export-14-sales', 'App\\Filament\\Exports\\SaleExporter', 20, 20, 20, 3, '2025-09-02 05:39:10', '2025-09-02 05:39:14'),
(15, '2025-09-02 05:39:25', 'local', 'export-15-sales', 'App\\Filament\\Exports\\SaleExporter', 10, 10, 10, 3, '2025-09-02 05:39:25', '2025-09-02 05:39:25'),
(16, '2025-09-02 05:39:58', 'local', 'export-16-sales', 'App\\Filament\\Exports\\SaleExporter', 10, 10, 10, 3, '2025-09-02 05:39:57', '2025-09-02 05:39:58'),
(17, '2025-09-02 07:19:59', 'local', 'export-17-sale-items', 'App\\Filament\\Exports\\SaleItemExporter', 170, 170, 170, 1, '2025-09-02 07:19:57', '2025-09-02 07:19:59'),
(18, '2025-09-02 08:09:54', 'local', 'export-18-sales', 'App\\Filament\\Exports\\SaleExporter', 4, 4, 4, 3, '2025-09-02 08:09:52', '2025-09-02 08:09:54'),
(19, '2025-09-05 04:07:45', 'local', 'export-19-sales', 'App\\Filament\\Exports\\SaleExporter', 7, 7, 7, 3, '2025-09-05 04:07:42', '2025-09-05 04:07:45'),
(20, '2025-09-05 04:08:47', 'local', 'export-20-products', 'App\\Filament\\Exports\\ProductExporter', 10, 10, 10, 3, '2025-09-05 04:08:47', '2025-09-05 04:08:47'),
(21, '2025-09-07 05:01:21', 'local', 'export-21-brands', 'App\\Filament\\Exports\\BrandExporter', 3, 3, 3, 3, '2025-09-07 05:01:20', '2025-09-07 05:01:21'),
(22, '2025-09-07 05:01:32', 'local', 'export-22-categories', 'App\\Filament\\Exports\\CategoryExporter', 2, 2, 2, 3, '2025-09-07 05:01:32', '2025-09-07 05:01:32'),
(23, '2025-09-07 05:01:44', 'local', 'export-23-product-imports', 'App\\Filament\\Exports\\ProductImportExporter', 106, 106, 106, 3, '2025-09-07 05:01:44', '2025-09-07 05:01:44'),
(24, '2025-09-07 05:03:44', 'local', 'export-24-product-imports', 'App\\Filament\\Exports\\ProductImportExporter', 106, 106, 106, 3, '2025-09-07 05:03:44', '2025-09-07 05:03:44'),
(25, '2025-09-07 05:04:02', 'local', 'export-25-products', 'App\\Filament\\Exports\\ProductExporter', 114, 114, 114, 3, '2025-09-07 05:04:02', '2025-09-07 05:04:02'),
(26, '2025-10-08 07:26:07', 'local', 'export-26-products', 'App\\Filament\\Exports\\ProductExporter', 10, 10, 10, 1, '2025-10-08 07:26:06', '2025-10-08 07:26:07'),
(27, '2025-10-23 05:54:10', 'local', 'export-27-sales', 'App\\Filament\\Exports\\SaleExporter', 10, 10, 10, 4, '2025-10-23 05:54:08', '2025-10-23 05:54:10'),
(28, '2025-10-23 05:55:06', 'local', 'export-28-products', 'App\\Filament\\Exports\\ProductExporter', 10, 10, 10, 4, '2025-10-23 05:55:06', '2025-10-23 05:55:06'),
(29, '2025-10-23 05:57:57', 'local', 'export-29-products', 'App\\Filament\\Exports\\ProductExporter', 125, 125, 125, 4, '2025-10-23 05:57:57', '2025-10-23 05:57:57');

-- --------------------------------------------------------

--
-- Table structure for table `failed_import_rows`
--

CREATE TABLE `failed_import_rows` (
  `id` bigint UNSIGNED NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `import_id` bigint UNSIGNED NOT NULL,
  `validation_error` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `imports`
--

CREATE TABLE `imports` (
  `id` bigint UNSIGNED NOT NULL,
  `completed_at` timestamp NULL DEFAULT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `importer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `processed_rows` int UNSIGNED NOT NULL DEFAULT '0',
  `total_rows` int UNSIGNED NOT NULL,
  `successful_rows` int UNSIGNED NOT NULL DEFAULT '0',
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(1146, 'default', '{\"uuid\":\"cdcd27c8-e7c6-4a68-853b-ebb71c1ab418\",\"displayName\":\"Filament\\\\Actions\\\\Exports\\\\Jobs\\\\ExportCsv\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":1756866063,\"data\":{\"commandName\":\"Filament\\\\Actions\\\\Exports\\\\Jobs\\\\ExportCsv\",\"command\":\"O:39:\\\"Filament\\\\Actions\\\\Exports\\\\Jobs\\\\ExportCsv\\\":8:{s:11:\\\"\\u0000*\\u0000exporter\\\";O:37:\\\"App\\\\Filament\\\\Exports\\\\SaleItemExporter\\\":3:{s:9:\\\"\\u0000*\\u0000export\\\";O:38:\\\"Filament\\\\Actions\\\\Exports\\\\Models\\\\Export\\\":33:{s:13:\\\"\\u0000*\\u0000connection\\\";s:5:\\\"mysql\\\";s:8:\\\"\\u0000*\\u0000table\\\";s:7:\\\"exports\\\";s:13:\\\"\\u0000*\\u0000primaryKey\\\";s:2:\\\"id\\\";s:10:\\\"\\u0000*\\u0000keyType\\\";s:3:\\\"int\\\";s:12:\\\"incrementing\\\";b:1;s:7:\\\"\\u0000*\\u0000with\\\";a:0:{}s:12:\\\"\\u0000*\\u0000withCount\\\";a:0:{}s:19:\\\"preventsLazyLoading\\\";b:0;s:10:\\\"\\u0000*\\u0000perPage\\\";i:15;s:6:\\\"exists\\\";b:1;s:18:\\\"wasRecentlyCreated\\\";b:0;s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;s:13:\\\"\\u0000*\\u0000attributes\\\";a:11:{s:2:\\\"id\\\";i:1;s:12:\\\"completed_at\\\";N;s:9:\\\"file_disk\\\";s:5:\\\"local\\\";s:9:\\\"file_name\\\";s:19:\\\"export-1-sale-items\\\";s:8:\\\"exporter\\\";s:37:\\\"App\\\\Filament\\\\Exports\\\\SaleItemExporter\\\";s:14:\\\"processed_rows\\\";i:0;s:10:\\\"total_rows\\\";i:168;s:15:\\\"successful_rows\\\";i:0;s:7:\\\"user_id\\\";i:1;s:10:\\\"created_at\\\";s:19:\\\"2025-09-02 09:21:00\\\";s:10:\\\"updated_at\\\";s:19:\\\"2025-09-02 09:21:00\\\";}s:11:\\\"\\u0000*\\u0000original\\\";a:11:{s:2:\\\"id\\\";i:1;s:12:\\\"completed_at\\\";N;s:9:\\\"file_disk\\\";s:5:\\\"local\\\";s:9:\\\"file_name\\\";s:19:\\\"export-1-sale-items\\\";s:8:\\\"exporter\\\";s:37:\\\"App\\\\Filament\\\\Exports\\\\SaleItemExporter\\\";s:14:\\\"processed_rows\\\";i:0;s:10:\\\"total_rows\\\";i:168;s:15:\\\"successful_rows\\\";i:0;s:7:\\\"user_id\\\";i:1;s:10:\\\"created_at\\\";s:19:\\\"2025-09-02 09:21:00\\\";s:10:\\\"updated_at\\\";s:19:\\\"2025-09-02 09:21:00\\\";}s:10:\\\"\\u0000*\\u0000changes\\\";a:0:{}s:11:\\\"\\u0000*\\u0000previous\\\";a:0:{}s:8:\\\"\\u0000*\\u0000casts\\\";a:4:{s:12:\\\"completed_at\\\";s:9:\\\"timestamp\\\";s:14:\\\"processed_rows\\\";s:7:\\\"integer\\\";s:10:\\\"total_rows\\\";s:7:\\\"integer\\\";s:15:\\\"successful_rows\\\";s:7:\\\"integer\\\";}s:17:\\\"\\u0000*\\u0000classCastCache\\\";a:0:{}s:21:\\\"\\u0000*\\u0000attributeCastCache\\\";a:0:{}s:13:\\\"\\u0000*\\u0000dateFormat\\\";N;s:10:\\\"\\u0000*\\u0000appends\\\";a:0:{}s:19:\\\"\\u0000*\\u0000dispatchesEvents\\\";a:0:{}s:14:\\\"\\u0000*\\u0000observables\\\";a:0:{}s:12:\\\"\\u0000*\\u0000relations\\\";a:0:{}s:10:\\\"\\u0000*\\u0000touches\\\";a:0:{}s:27:\\\"\\u0000*\\u0000relationAutoloadCallback\\\";N;s:26:\\\"\\u0000*\\u0000relationAutoloadContext\\\";N;s:10:\\\"timestamps\\\";b:1;s:13:\\\"usesUniqueIds\\\";b:0;s:9:\\\"\\u0000*\\u0000hidden\\\";a:0:{}s:10:\\\"\\u0000*\\u0000visible\\\";a:0:{}s:11:\\\"\\u0000*\\u0000fillable\\\";a:0:{}s:10:\\\"\\u0000*\\u0000guarded\\\";a:0:{}}s:12:\\\"\\u0000*\\u0000columnMap\\\";a:9:{s:7:\\\"sale.id\\\";s:7:\\\"Sale ID\\\";s:14:\\\"sale.sale_date\\\";s:9:\\\"Sale Date\\\";s:18:\\\"sale.customer.name\\\";s:8:\\\"Customer\\\";s:14:\\\"sale.user.name\\\";s:7:\\\"Sold By\\\";s:12:\\\"product.name\\\";s:7:\\\"Product\\\";s:3:\\\"qty\\\";s:8:\\\"Quantity\\\";s:10:\\\"unit_price\\\";s:10:\\\"Unit Price\\\";s:8:\\\"subtotal\\\";s:8:\\\"Subtotal\\\";s:17:\\\"total_sale_amount\\\";s:17:\\\"Total Sale Amount\\\";}s:10:\\\"\\u0000*\\u0000options\\\";a:0:{}}s:9:\\\"\\u0000*\\u0000export\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:38:\\\"Filament\\\\Actions\\\\Exports\\\\Models\\\\Export\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:8:\\\"\\u0000*\\u0000query\\\";s:617:\\\"O:36:\\\"AnourValar\\\\EloquentSerialize\\\\Package\\\":1:{s:42:\\\"\\u0000AnourValar\\\\EloquentSerialize\\\\Package\\u0000data\\\";a:4:{s:5:\\\"model\\\";s:15:\\\"App\\\\Models\\\\Sale\\\";s:10:\\\"connection\\\";N;s:8:\\\"eloquent\\\";a:3:{s:4:\\\"with\\\";a:0:{}s:14:\\\"removed_scopes\\\";a:0:{}s:5:\\\"casts\\\";a:1:{s:2:\\\"id\\\";s:3:\\\"int\\\";}}s:5:\\\"query\\\";a:5:{s:8:\\\"bindings\\\";a:9:{s:6:\\\"select\\\";a:0:{}s:4:\\\"from\\\";a:0:{}s:4:\\\"join\\\";a:0:{}s:5:\\\"where\\\";a:0:{}s:7:\\\"groupBy\\\";a:0:{}s:6:\\\"having\\\";a:0:{}s:5:\\\"order\\\";a:0:{}s:5:\\\"union\\\";a:0:{}s:10:\\\"unionOrder\\\";a:0:{}}s:8:\\\"distinct\\\";b:0;s:4:\\\"from\\\";s:5:\\\"sales\\\";s:6:\\\"wheres\\\";a:0:{}s:6:\\\"orders\\\";a:1:{i:0;a:2:{s:6:\\\"column\\\";s:9:\\\"sale_date\\\";s:9:\\\"direction\\\";s:4:\\\"desc\\\";}}}}}\\\";s:10:\\\"\\u0000*\\u0000records\\\";a:100:{i:0;i:167;i:1;i:168;i:2;i:18;i:3;i:21;i:4;i:143;i:5;i:41;i:6;i:124;i:7;i:92;i:8;i:93;i:9;i:125;i:10;i:126;i:11;i:127;i:12;i:128;i:13;i:130;i:14;i:120;i:15;i:132;i:16;i:123;i:17;i:133;i:18;i:134;i:19;i:131;i:20;i:163;i:21;i:139;i:22;i:138;i:23;i:137;i:24;i:135;i:25;i:141;i:26;i:142;i:27;i:136;i:28;i:140;i:29;i:144;i:30;i:145;i:31;i:146;i:32;i:129;i:33;i:147;i:34;i:148;i:35;i:150;i:36;i:151;i:37;i:165;i:38;i:122;i:39;i:162;i:40;i:149;i:41;i:17;i:42;i:42;i:43;i:13;i:44;i:14;i:45;i:15;i:46;i:16;i:47;i:11;i:48;i:12;i:49;i:3;i:50;i:4;i:51;i:47;i:52;i:1;i:53;i:164;i:54;i:91;i:55;i:121;i:56;i:34;i:57;i:8;i:58;i:119;i:59;i:67;i:60;i:2;i:61;i:9;i:62;i:25;i:63;i:33;i:64;i:7;i:65;i:66;i:66;i:157;i:67;i:158;i:68;i:90;i:69;i:156;i:70;i:32;i:71;i:40;i:72;i:89;i:73;i:160;i:74;i:118;i:75;i:6;i:76;i:117;i:77;i:155;i:78;i:88;i:79;i:87;i:80;i:65;i:81;i:64;i:82;i:31;i:83;i:161;i:84;i:116;i:85;i:5;i:86;i:39;i:87;i:115;i:88;i:30;i:89;i:86;i:90;i:63;i:91;i:37;i:92;i:85;i:93;i:84;i:94;i:114;i:95;i:154;i:96;i:29;i:97;i:94;i:98;i:113;i:99;i:24;}s:7:\\\"\\u0000*\\u0000page\\\";i:1;s:12:\\\"\\u0000*\\u0000columnMap\\\";a:9:{s:7:\\\"sale.id\\\";s:7:\\\"Sale ID\\\";s:14:\\\"sale.sale_date\\\";s:9:\\\"Sale Date\\\";s:18:\\\"sale.customer.name\\\";s:8:\\\"Customer\\\";s:14:\\\"sale.user.name\\\";s:7:\\\"Sold By\\\";s:12:\\\"product.name\\\";s:7:\\\"Product\\\";s:3:\\\"qty\\\";s:8:\\\"Quantity\\\";s:10:\\\"unit_price\\\";s:10:\\\"Unit Price\\\";s:8:\\\"subtotal\\\";s:8:\\\"Subtotal\\\";s:17:\\\"total_sale_amount\\\";s:17:\\\"Total Sale Amount\\\";}s:10:\\\"\\u0000*\\u0000options\\\";a:0:{}s:7:\\\"batchId\\\";s:36:\\\"9fc736c5-96df-46c0-a006-7a4acc430f47\\\";}\"},\"createdAt\":1756779663,\"delay\":null}', 255, NULL, 1756780366, 1756780366),
(1147, 'default', '{\"uuid\":\"f472de82-f00b-4cbd-a1a7-518eadbbe12b\",\"displayName\":\"Filament\\\\Actions\\\\Exports\\\\Jobs\\\\ExportCsv\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":1756866183,\"data\":{\"commandName\":\"Filament\\\\Actions\\\\Exports\\\\Jobs\\\\ExportCsv\",\"command\":\"O:39:\\\"Filament\\\\Actions\\\\Exports\\\\Jobs\\\\ExportCsv\\\":8:{s:11:\\\"\\u0000*\\u0000exporter\\\";O:37:\\\"App\\\\Filament\\\\Exports\\\\SaleItemExporter\\\":3:{s:9:\\\"\\u0000*\\u0000export\\\";O:38:\\\"Filament\\\\Actions\\\\Exports\\\\Models\\\\Export\\\":33:{s:13:\\\"\\u0000*\\u0000connection\\\";s:5:\\\"mysql\\\";s:8:\\\"\\u0000*\\u0000table\\\";s:7:\\\"exports\\\";s:13:\\\"\\u0000*\\u0000primaryKey\\\";s:2:\\\"id\\\";s:10:\\\"\\u0000*\\u0000keyType\\\";s:3:\\\"int\\\";s:12:\\\"incrementing\\\";b:1;s:7:\\\"\\u0000*\\u0000with\\\";a:0:{}s:12:\\\"\\u0000*\\u0000withCount\\\";a:0:{}s:19:\\\"preventsLazyLoading\\\";b:0;s:10:\\\"\\u0000*\\u0000perPage\\\";i:15;s:6:\\\"exists\\\";b:1;s:18:\\\"wasRecentlyCreated\\\";b:0;s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;s:13:\\\"\\u0000*\\u0000attributes\\\";a:11:{s:2:\\\"id\\\";i:2;s:12:\\\"completed_at\\\";N;s:9:\\\"file_disk\\\";s:5:\\\"local\\\";s:9:\\\"file_name\\\";s:19:\\\"export-2-sale-items\\\";s:8:\\\"exporter\\\";s:37:\\\"App\\\\Filament\\\\Exports\\\\SaleItemExporter\\\";s:14:\\\"processed_rows\\\";i:0;s:10:\\\"total_rows\\\";i:168;s:15:\\\"successful_rows\\\";i:0;s:7:\\\"user_id\\\";i:1;s:10:\\\"created_at\\\";s:19:\\\"2025-09-02 09:22:59\\\";s:10:\\\"updated_at\\\";s:19:\\\"2025-09-02 09:22:59\\\";}s:11:\\\"\\u0000*\\u0000original\\\";a:11:{s:2:\\\"id\\\";i:2;s:12:\\\"completed_at\\\";N;s:9:\\\"file_disk\\\";s:5:\\\"local\\\";s:9:\\\"file_name\\\";s:19:\\\"export-2-sale-items\\\";s:8:\\\"exporter\\\";s:37:\\\"App\\\\Filament\\\\Exports\\\\SaleItemExporter\\\";s:14:\\\"processed_rows\\\";i:0;s:10:\\\"total_rows\\\";i:168;s:15:\\\"successful_rows\\\";i:0;s:7:\\\"user_id\\\";i:1;s:10:\\\"created_at\\\";s:19:\\\"2025-09-02 09:22:59\\\";s:10:\\\"updated_at\\\";s:19:\\\"2025-09-02 09:22:59\\\";}s:10:\\\"\\u0000*\\u0000changes\\\";a:0:{}s:11:\\\"\\u0000*\\u0000previous\\\";a:0:{}s:8:\\\"\\u0000*\\u0000casts\\\";a:4:{s:12:\\\"completed_at\\\";s:9:\\\"timestamp\\\";s:14:\\\"processed_rows\\\";s:7:\\\"integer\\\";s:10:\\\"total_rows\\\";s:7:\\\"integer\\\";s:15:\\\"successful_rows\\\";s:7:\\\"integer\\\";}s:17:\\\"\\u0000*\\u0000classCastCache\\\";a:0:{}s:21:\\\"\\u0000*\\u0000attributeCastCache\\\";a:0:{}s:13:\\\"\\u0000*\\u0000dateFormat\\\";N;s:10:\\\"\\u0000*\\u0000appends\\\";a:0:{}s:19:\\\"\\u0000*\\u0000dispatchesEvents\\\";a:0:{}s:14:\\\"\\u0000*\\u0000observables\\\";a:0:{}s:12:\\\"\\u0000*\\u0000relations\\\";a:0:{}s:10:\\\"\\u0000*\\u0000touches\\\";a:0:{}s:27:\\\"\\u0000*\\u0000relationAutoloadCallback\\\";N;s:26:\\\"\\u0000*\\u0000relationAutoloadContext\\\";N;s:10:\\\"timestamps\\\";b:1;s:13:\\\"usesUniqueIds\\\";b:0;s:9:\\\"\\u0000*\\u0000hidden\\\";a:0:{}s:10:\\\"\\u0000*\\u0000visible\\\";a:0:{}s:11:\\\"\\u0000*\\u0000fillable\\\";a:0:{}s:10:\\\"\\u0000*\\u0000guarded\\\";a:0:{}}s:12:\\\"\\u0000*\\u0000columnMap\\\";a:9:{s:7:\\\"sale.id\\\";s:7:\\\"Sale ID\\\";s:14:\\\"sale.sale_date\\\";s:9:\\\"Sale Date\\\";s:18:\\\"sale.customer.name\\\";s:8:\\\"Customer\\\";s:14:\\\"sale.user.name\\\";s:7:\\\"Sold By\\\";s:12:\\\"product.name\\\";s:7:\\\"Product\\\";s:3:\\\"qty\\\";s:8:\\\"Quantity\\\";s:10:\\\"unit_price\\\";s:10:\\\"Unit Price\\\";s:8:\\\"subtotal\\\";s:8:\\\"Subtotal\\\";s:17:\\\"total_sale_amount\\\";s:17:\\\"Total Sale Amount\\\";}s:10:\\\"\\u0000*\\u0000options\\\";a:0:{}}s:9:\\\"\\u0000*\\u0000export\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:38:\\\"Filament\\\\Actions\\\\Exports\\\\Models\\\\Export\\\";s:2:\\\"id\\\";i:2;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:8:\\\"\\u0000*\\u0000query\\\";s:617:\\\"O:36:\\\"AnourValar\\\\EloquentSerialize\\\\Package\\\":1:{s:42:\\\"\\u0000AnourValar\\\\EloquentSerialize\\\\Package\\u0000data\\\";a:4:{s:5:\\\"model\\\";s:15:\\\"App\\\\Models\\\\Sale\\\";s:10:\\\"connection\\\";N;s:8:\\\"eloquent\\\";a:3:{s:4:\\\"with\\\";a:0:{}s:14:\\\"removed_scopes\\\";a:0:{}s:5:\\\"casts\\\";a:1:{s:2:\\\"id\\\";s:3:\\\"int\\\";}}s:5:\\\"query\\\";a:5:{s:8:\\\"bindings\\\";a:9:{s:6:\\\"select\\\";a:0:{}s:4:\\\"from\\\";a:0:{}s:4:\\\"join\\\";a:0:{}s:5:\\\"where\\\";a:0:{}s:7:\\\"groupBy\\\";a:0:{}s:6:\\\"having\\\";a:0:{}s:5:\\\"order\\\";a:0:{}s:5:\\\"union\\\";a:0:{}s:10:\\\"unionOrder\\\";a:0:{}}s:8:\\\"distinct\\\";b:0;s:4:\\\"from\\\";s:5:\\\"sales\\\";s:6:\\\"wheres\\\";a:0:{}s:6:\\\"orders\\\";a:1:{i:0;a:2:{s:6:\\\"column\\\";s:9:\\\"sale_date\\\";s:9:\\\"direction\\\";s:4:\\\"desc\\\";}}}}}\\\";s:10:\\\"\\u0000*\\u0000records\\\";a:100:{i:0;i:167;i:1;i:168;i:2;i:18;i:3;i:21;i:4;i:143;i:5;i:41;i:6;i:124;i:7;i:92;i:8;i:93;i:9;i:125;i:10;i:126;i:11;i:127;i:12;i:128;i:13;i:130;i:14;i:120;i:15;i:132;i:16;i:123;i:17;i:133;i:18;i:134;i:19;i:131;i:20;i:163;i:21;i:139;i:22;i:138;i:23;i:137;i:24;i:135;i:25;i:141;i:26;i:142;i:27;i:136;i:28;i:140;i:29;i:144;i:30;i:145;i:31;i:146;i:32;i:129;i:33;i:147;i:34;i:148;i:35;i:150;i:36;i:151;i:37;i:165;i:38;i:122;i:39;i:162;i:40;i:149;i:41;i:17;i:42;i:42;i:43;i:13;i:44;i:14;i:45;i:15;i:46;i:16;i:47;i:11;i:48;i:12;i:49;i:3;i:50;i:4;i:51;i:47;i:52;i:1;i:53;i:164;i:54;i:91;i:55;i:121;i:56;i:34;i:57;i:8;i:58;i:119;i:59;i:67;i:60;i:2;i:61;i:9;i:62;i:25;i:63;i:33;i:64;i:7;i:65;i:66;i:66;i:157;i:67;i:158;i:68;i:90;i:69;i:156;i:70;i:32;i:71;i:40;i:72;i:89;i:73;i:160;i:74;i:118;i:75;i:6;i:76;i:117;i:77;i:155;i:78;i:88;i:79;i:87;i:80;i:65;i:81;i:64;i:82;i:31;i:83;i:161;i:84;i:116;i:85;i:5;i:86;i:39;i:87;i:115;i:88;i:30;i:89;i:86;i:90;i:63;i:91;i:37;i:92;i:85;i:93;i:84;i:94;i:114;i:95;i:154;i:96;i:29;i:97;i:94;i:98;i:113;i:99;i:24;}s:7:\\\"\\u0000*\\u0000page\\\";i:1;s:12:\\\"\\u0000*\\u0000columnMap\\\";a:9:{s:7:\\\"sale.id\\\";s:7:\\\"Sale ID\\\";s:14:\\\"sale.sale_date\\\";s:9:\\\"Sale Date\\\";s:18:\\\"sale.customer.name\\\";s:8:\\\"Customer\\\";s:14:\\\"sale.user.name\\\";s:7:\\\"Sold By\\\";s:12:\\\"product.name\\\";s:7:\\\"Product\\\";s:3:\\\"qty\\\";s:8:\\\"Quantity\\\";s:10:\\\"unit_price\\\";s:10:\\\"Unit Price\\\";s:8:\\\"subtotal\\\";s:8:\\\"Subtotal\\\";s:17:\\\"total_sale_amount\\\";s:17:\\\"Total Sale Amount\\\";}s:10:\\\"\\u0000*\\u0000options\\\";a:0:{}s:7:\\\"batchId\\\";s:36:\\\"9fc7377b-3def-4a18-b7f4-bc26a79e07d9\\\";}\"},\"createdAt\":1756779783,\"delay\":null}', 159, NULL, 1756780366, 1756780366),
(1148, 'default', '{\"uuid\":\"8a9aa0bf-5804-419c-a91d-d05f9aff031e\",\"displayName\":\"Filament\\\\Actions\\\\Exports\\\\Jobs\\\\ExportCsv\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":1756866183,\"data\":{\"commandName\":\"Filament\\\\Actions\\\\Exports\\\\Jobs\\\\ExportCsv\",\"command\":\"O:39:\\\"Filament\\\\Actions\\\\Exports\\\\Jobs\\\\ExportCsv\\\":8:{s:11:\\\"\\u0000*\\u0000exporter\\\";O:37:\\\"App\\\\Filament\\\\Exports\\\\SaleItemExporter\\\":3:{s:9:\\\"\\u0000*\\u0000export\\\";O:38:\\\"Filament\\\\Actions\\\\Exports\\\\Models\\\\Export\\\":33:{s:13:\\\"\\u0000*\\u0000connection\\\";s:5:\\\"mysql\\\";s:8:\\\"\\u0000*\\u0000table\\\";s:7:\\\"exports\\\";s:13:\\\"\\u0000*\\u0000primaryKey\\\";s:2:\\\"id\\\";s:10:\\\"\\u0000*\\u0000keyType\\\";s:3:\\\"int\\\";s:12:\\\"incrementing\\\";b:1;s:7:\\\"\\u0000*\\u0000with\\\";a:0:{}s:12:\\\"\\u0000*\\u0000withCount\\\";a:0:{}s:19:\\\"preventsLazyLoading\\\";b:0;s:10:\\\"\\u0000*\\u0000perPage\\\";i:15;s:6:\\\"exists\\\";b:1;s:18:\\\"wasRecentlyCreated\\\";b:0;s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;s:13:\\\"\\u0000*\\u0000attributes\\\";a:11:{s:2:\\\"id\\\";i:2;s:12:\\\"completed_at\\\";N;s:9:\\\"file_disk\\\";s:5:\\\"local\\\";s:9:\\\"file_name\\\";s:19:\\\"export-2-sale-items\\\";s:8:\\\"exporter\\\";s:37:\\\"App\\\\Filament\\\\Exports\\\\SaleItemExporter\\\";s:14:\\\"processed_rows\\\";i:0;s:10:\\\"total_rows\\\";i:168;s:15:\\\"successful_rows\\\";i:0;s:7:\\\"user_id\\\";i:1;s:10:\\\"created_at\\\";s:19:\\\"2025-09-02 09:22:59\\\";s:10:\\\"updated_at\\\";s:19:\\\"2025-09-02 09:22:59\\\";}s:11:\\\"\\u0000*\\u0000original\\\";a:11:{s:2:\\\"id\\\";i:2;s:12:\\\"completed_at\\\";N;s:9:\\\"file_disk\\\";s:5:\\\"local\\\";s:9:\\\"file_name\\\";s:19:\\\"export-2-sale-items\\\";s:8:\\\"exporter\\\";s:37:\\\"App\\\\Filament\\\\Exports\\\\SaleItemExporter\\\";s:14:\\\"processed_rows\\\";i:0;s:10:\\\"total_rows\\\";i:168;s:15:\\\"successful_rows\\\";i:0;s:7:\\\"user_id\\\";i:1;s:10:\\\"created_at\\\";s:19:\\\"2025-09-02 09:22:59\\\";s:10:\\\"updated_at\\\";s:19:\\\"2025-09-02 09:22:59\\\";}s:10:\\\"\\u0000*\\u0000changes\\\";a:0:{}s:11:\\\"\\u0000*\\u0000previous\\\";a:0:{}s:8:\\\"\\u0000*\\u0000casts\\\";a:4:{s:12:\\\"completed_at\\\";s:9:\\\"timestamp\\\";s:14:\\\"processed_rows\\\";s:7:\\\"integer\\\";s:10:\\\"total_rows\\\";s:7:\\\"integer\\\";s:15:\\\"successful_rows\\\";s:7:\\\"integer\\\";}s:17:\\\"\\u0000*\\u0000classCastCache\\\";a:0:{}s:21:\\\"\\u0000*\\u0000attributeCastCache\\\";a:0:{}s:13:\\\"\\u0000*\\u0000dateFormat\\\";N;s:10:\\\"\\u0000*\\u0000appends\\\";a:0:{}s:19:\\\"\\u0000*\\u0000dispatchesEvents\\\";a:0:{}s:14:\\\"\\u0000*\\u0000observables\\\";a:0:{}s:12:\\\"\\u0000*\\u0000relations\\\";a:0:{}s:10:\\\"\\u0000*\\u0000touches\\\";a:0:{}s:27:\\\"\\u0000*\\u0000relationAutoloadCallback\\\";N;s:26:\\\"\\u0000*\\u0000relationAutoloadContext\\\";N;s:10:\\\"timestamps\\\";b:1;s:13:\\\"usesUniqueIds\\\";b:0;s:9:\\\"\\u0000*\\u0000hidden\\\";a:0:{}s:10:\\\"\\u0000*\\u0000visible\\\";a:0:{}s:11:\\\"\\u0000*\\u0000fillable\\\";a:0:{}s:10:\\\"\\u0000*\\u0000guarded\\\";a:0:{}}s:12:\\\"\\u0000*\\u0000columnMap\\\";a:9:{s:7:\\\"sale.id\\\";s:7:\\\"Sale ID\\\";s:14:\\\"sale.sale_date\\\";s:9:\\\"Sale Date\\\";s:18:\\\"sale.customer.name\\\";s:8:\\\"Customer\\\";s:14:\\\"sale.user.name\\\";s:7:\\\"Sold By\\\";s:12:\\\"product.name\\\";s:7:\\\"Product\\\";s:3:\\\"qty\\\";s:8:\\\"Quantity\\\";s:10:\\\"unit_price\\\";s:10:\\\"Unit Price\\\";s:8:\\\"subtotal\\\";s:8:\\\"Subtotal\\\";s:17:\\\"total_sale_amount\\\";s:17:\\\"Total Sale Amount\\\";}s:10:\\\"\\u0000*\\u0000options\\\";a:0:{}}s:9:\\\"\\u0000*\\u0000export\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:38:\\\"Filament\\\\Actions\\\\Exports\\\\Models\\\\Export\\\";s:2:\\\"id\\\";i:2;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:8:\\\"\\u0000*\\u0000query\\\";s:617:\\\"O:36:\\\"AnourValar\\\\EloquentSerialize\\\\Package\\\":1:{s:42:\\\"\\u0000AnourValar\\\\EloquentSerialize\\\\Package\\u0000data\\\";a:4:{s:5:\\\"model\\\";s:15:\\\"App\\\\Models\\\\Sale\\\";s:10:\\\"connection\\\";N;s:8:\\\"eloquent\\\";a:3:{s:4:\\\"with\\\";a:0:{}s:14:\\\"removed_scopes\\\";a:0:{}s:5:\\\"casts\\\";a:1:{s:2:\\\"id\\\";s:3:\\\"int\\\";}}s:5:\\\"query\\\";a:5:{s:8:\\\"bindings\\\";a:9:{s:6:\\\"select\\\";a:0:{}s:4:\\\"from\\\";a:0:{}s:4:\\\"join\\\";a:0:{}s:5:\\\"where\\\";a:0:{}s:7:\\\"groupBy\\\";a:0:{}s:6:\\\"having\\\";a:0:{}s:5:\\\"order\\\";a:0:{}s:5:\\\"union\\\";a:0:{}s:10:\\\"unionOrder\\\";a:0:{}}s:8:\\\"distinct\\\";b:0;s:4:\\\"from\\\";s:5:\\\"sales\\\";s:6:\\\"wheres\\\";a:0:{}s:6:\\\"orders\\\";a:1:{i:0;a:2:{s:6:\\\"column\\\";s:9:\\\"sale_date\\\";s:9:\\\"direction\\\";s:4:\\\"desc\\\";}}}}}\\\";s:10:\\\"\\u0000*\\u0000records\\\";a:68:{i:0;i:159;i:1;i:38;i:2;i:23;i:3;i:36;i:4;i:83;i:5;i:111;i:6;i:62;i:7;i:35;i:8;i:112;i:9;i:28;i:10;i:110;i:11;i:82;i:12;i:61;i:13;i:27;i:14;i:81;i:15;i:60;i:16;i:80;i:17;i:22;i:18;i:10;i:19;i:26;i:20;i:109;i:21;i:108;i:22;i:79;i:23;i:20;i:24;i:59;i:25;i:58;i:26;i:57;i:27;i:107;i:28;i:106;i:29;i:166;i:30;i:78;i:31;i:56;i:32;i:105;i:33;i:55;i:34;i:19;i:35;i:54;i:36;i:104;i:37;i:53;i:38;i:77;i:39;i:103;i:40;i:52;i:41;i:51;i:42;i:102;i:43;i:101;i:44;i:50;i:45;i:76;i:46;i:75;i:47;i:100;i:48;i:49;i:49;i:99;i:50;i:98;i:51;i:48;i:52;i:74;i:53;i:73;i:54;i:97;i:55;i:72;i:56;i:71;i:57;i:96;i:58;i:70;i:59;i:46;i:60;i:69;i:61;i:152;i:62;i:45;i:63;i:95;i:64;i:44;i:65;i:43;i:66;i:68;i:67;i:153;}s:7:\\\"\\u0000*\\u0000page\\\";i:2;s:12:\\\"\\u0000*\\u0000columnMap\\\";a:9:{s:7:\\\"sale.id\\\";s:7:\\\"Sale ID\\\";s:14:\\\"sale.sale_date\\\";s:9:\\\"Sale Date\\\";s:18:\\\"sale.customer.name\\\";s:8:\\\"Customer\\\";s:14:\\\"sale.user.name\\\";s:7:\\\"Sold By\\\";s:12:\\\"product.name\\\";s:7:\\\"Product\\\";s:3:\\\"qty\\\";s:8:\\\"Quantity\\\";s:10:\\\"unit_price\\\";s:10:\\\"Unit Price\\\";s:8:\\\"subtotal\\\";s:8:\\\"Subtotal\\\";s:17:\\\"total_sale_amount\\\";s:17:\\\"Total Sale Amount\\\";}s:10:\\\"\\u0000*\\u0000options\\\";a:0:{}s:7:\\\"batchId\\\";s:36:\\\"9fc7377b-3def-4a18-b7f4-bc26a79e07d9\\\";}\"},\"createdAt\":1756779783,\"delay\":null}', 159, NULL, 1756780367, 1756780367),
(1149, 'default', '{\"uuid\":\"8691ed3b-6b97-4529-bede-761911d6e62d\",\"displayName\":\"Filament\\\\Actions\\\\Exports\\\\Jobs\\\\ExportCsv\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":1756866713,\"data\":{\"commandName\":\"Filament\\\\Actions\\\\Exports\\\\Jobs\\\\ExportCsv\",\"command\":\"O:39:\\\"Filament\\\\Actions\\\\Exports\\\\Jobs\\\\ExportCsv\\\":8:{s:11:\\\"\\u0000*\\u0000exporter\\\";O:37:\\\"App\\\\Filament\\\\Exports\\\\SaleItemExporter\\\":3:{s:9:\\\"\\u0000*\\u0000export\\\";O:38:\\\"Filament\\\\Actions\\\\Exports\\\\Models\\\\Export\\\":33:{s:13:\\\"\\u0000*\\u0000connection\\\";s:5:\\\"mysql\\\";s:8:\\\"\\u0000*\\u0000table\\\";s:7:\\\"exports\\\";s:13:\\\"\\u0000*\\u0000primaryKey\\\";s:2:\\\"id\\\";s:10:\\\"\\u0000*\\u0000keyType\\\";s:3:\\\"int\\\";s:12:\\\"incrementing\\\";b:1;s:7:\\\"\\u0000*\\u0000with\\\";a:0:{}s:12:\\\"\\u0000*\\u0000withCount\\\";a:0:{}s:19:\\\"preventsLazyLoading\\\";b:0;s:10:\\\"\\u0000*\\u0000perPage\\\";i:15;s:6:\\\"exists\\\";b:1;s:18:\\\"wasRecentlyCreated\\\";b:0;s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;s:13:\\\"\\u0000*\\u0000attributes\\\";a:11:{s:2:\\\"id\\\";i:4;s:12:\\\"completed_at\\\";N;s:9:\\\"file_disk\\\";s:5:\\\"local\\\";s:9:\\\"file_name\\\";s:19:\\\"export-4-sale-items\\\";s:8:\\\"exporter\\\";s:37:\\\"App\\\\Filament\\\\Exports\\\\SaleItemExporter\\\";s:14:\\\"processed_rows\\\";i:0;s:10:\\\"total_rows\\\";i:168;s:15:\\\"successful_rows\\\";i:0;s:7:\\\"user_id\\\";i:1;s:10:\\\"created_at\\\";s:19:\\\"2025-09-02 09:31:44\\\";s:10:\\\"updated_at\\\";s:19:\\\"2025-09-02 09:31:44\\\";}s:11:\\\"\\u0000*\\u0000original\\\";a:11:{s:2:\\\"id\\\";i:4;s:12:\\\"completed_at\\\";N;s:9:\\\"file_disk\\\";s:5:\\\"local\\\";s:9:\\\"file_name\\\";s:19:\\\"export-4-sale-items\\\";s:8:\\\"exporter\\\";s:37:\\\"App\\\\Filament\\\\Exports\\\\SaleItemExporter\\\";s:14:\\\"processed_rows\\\";i:0;s:10:\\\"total_rows\\\";i:168;s:15:\\\"successful_rows\\\";i:0;s:7:\\\"user_id\\\";i:1;s:10:\\\"created_at\\\";s:19:\\\"2025-09-02 09:31:44\\\";s:10:\\\"updated_at\\\";s:19:\\\"2025-09-02 09:31:44\\\";}s:10:\\\"\\u0000*\\u0000changes\\\";a:0:{}s:11:\\\"\\u0000*\\u0000previous\\\";a:0:{}s:8:\\\"\\u0000*\\u0000casts\\\";a:4:{s:12:\\\"completed_at\\\";s:9:\\\"timestamp\\\";s:14:\\\"processed_rows\\\";s:7:\\\"integer\\\";s:10:\\\"total_rows\\\";s:7:\\\"integer\\\";s:15:\\\"successful_rows\\\";s:7:\\\"integer\\\";}s:17:\\\"\\u0000*\\u0000classCastCache\\\";a:0:{}s:21:\\\"\\u0000*\\u0000attributeCastCache\\\";a:0:{}s:13:\\\"\\u0000*\\u0000dateFormat\\\";N;s:10:\\\"\\u0000*\\u0000appends\\\";a:0:{}s:19:\\\"\\u0000*\\u0000dispatchesEvents\\\";a:0:{}s:14:\\\"\\u0000*\\u0000observables\\\";a:0:{}s:12:\\\"\\u0000*\\u0000relations\\\";a:0:{}s:10:\\\"\\u0000*\\u0000touches\\\";a:0:{}s:27:\\\"\\u0000*\\u0000relationAutoloadCallback\\\";N;s:26:\\\"\\u0000*\\u0000relationAutoloadContext\\\";N;s:10:\\\"timestamps\\\";b:1;s:13:\\\"usesUniqueIds\\\";b:0;s:9:\\\"\\u0000*\\u0000hidden\\\";a:0:{}s:10:\\\"\\u0000*\\u0000visible\\\";a:0:{}s:11:\\\"\\u0000*\\u0000fillable\\\";a:0:{}s:10:\\\"\\u0000*\\u0000guarded\\\";a:0:{}}s:12:\\\"\\u0000*\\u0000columnMap\\\";a:9:{s:7:\\\"sale.id\\\";s:7:\\\"Sale ID\\\";s:14:\\\"sale.sale_date\\\";s:9:\\\"Sale Date\\\";s:18:\\\"sale.customer.name\\\";s:8:\\\"Customer\\\";s:14:\\\"sale.user.name\\\";s:7:\\\"Sold By\\\";s:12:\\\"product.name\\\";s:7:\\\"Product\\\";s:3:\\\"qty\\\";s:8:\\\"Quantity\\\";s:10:\\\"unit_price\\\";s:10:\\\"Unit Price\\\";s:8:\\\"subtotal\\\";s:8:\\\"Subtotal\\\";s:17:\\\"total_sale_amount\\\";s:17:\\\"Total Sale Amount\\\";}s:10:\\\"\\u0000*\\u0000options\\\";a:0:{}}s:9:\\\"\\u0000*\\u0000export\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:38:\\\"Filament\\\\Actions\\\\Exports\\\\Models\\\\Export\\\";s:2:\\\"id\\\";i:4;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:8:\\\"\\u0000*\\u0000query\\\";s:617:\\\"O:36:\\\"AnourValar\\\\EloquentSerialize\\\\Package\\\":1:{s:42:\\\"\\u0000AnourValar\\\\EloquentSerialize\\\\Package\\u0000data\\\";a:4:{s:5:\\\"model\\\";s:15:\\\"App\\\\Models\\\\Sale\\\";s:10:\\\"connection\\\";N;s:8:\\\"eloquent\\\";a:3:{s:4:\\\"with\\\";a:0:{}s:14:\\\"removed_scopes\\\";a:0:{}s:5:\\\"casts\\\";a:1:{s:2:\\\"id\\\";s:3:\\\"int\\\";}}s:5:\\\"query\\\";a:5:{s:8:\\\"bindings\\\";a:9:{s:6:\\\"select\\\";a:0:{}s:4:\\\"from\\\";a:0:{}s:4:\\\"join\\\";a:0:{}s:5:\\\"where\\\";a:0:{}s:7:\\\"groupBy\\\";a:0:{}s:6:\\\"having\\\";a:0:{}s:5:\\\"order\\\";a:0:{}s:5:\\\"union\\\";a:0:{}s:10:\\\"unionOrder\\\";a:0:{}}s:8:\\\"distinct\\\";b:0;s:4:\\\"from\\\";s:5:\\\"sales\\\";s:6:\\\"wheres\\\";a:0:{}s:6:\\\"orders\\\";a:1:{i:0;a:2:{s:6:\\\"column\\\";s:9:\\\"sale_date\\\";s:9:\\\"direction\\\";s:4:\\\"desc\\\";}}}}}\\\";s:10:\\\"\\u0000*\\u0000records\\\";a:100:{i:0;i:167;i:1;i:168;i:2;i:18;i:3;i:21;i:4;i:143;i:5;i:41;i:6;i:124;i:7;i:92;i:8;i:93;i:9;i:125;i:10;i:126;i:11;i:127;i:12;i:128;i:13;i:130;i:14;i:120;i:15;i:132;i:16;i:123;i:17;i:133;i:18;i:134;i:19;i:131;i:20;i:163;i:21;i:139;i:22;i:138;i:23;i:137;i:24;i:135;i:25;i:141;i:26;i:142;i:27;i:136;i:28;i:140;i:29;i:144;i:30;i:145;i:31;i:146;i:32;i:129;i:33;i:147;i:34;i:148;i:35;i:150;i:36;i:151;i:37;i:165;i:38;i:122;i:39;i:162;i:40;i:149;i:41;i:17;i:42;i:42;i:43;i:13;i:44;i:14;i:45;i:15;i:46;i:16;i:47;i:11;i:48;i:12;i:49;i:3;i:50;i:4;i:51;i:47;i:52;i:1;i:53;i:164;i:54;i:91;i:55;i:121;i:56;i:34;i:57;i:8;i:58;i:119;i:59;i:67;i:60;i:2;i:61;i:9;i:62;i:25;i:63;i:33;i:64;i:7;i:65;i:66;i:66;i:157;i:67;i:158;i:68;i:90;i:69;i:156;i:70;i:32;i:71;i:40;i:72;i:89;i:73;i:160;i:74;i:118;i:75;i:6;i:76;i:117;i:77;i:155;i:78;i:88;i:79;i:87;i:80;i:65;i:81;i:64;i:82;i:31;i:83;i:161;i:84;i:116;i:85;i:5;i:86;i:39;i:87;i:115;i:88;i:30;i:89;i:86;i:90;i:63;i:91;i:37;i:92;i:85;i:93;i:84;i:94;i:114;i:95;i:154;i:96;i:29;i:97;i:94;i:98;i:113;i:99;i:24;}s:7:\\\"\\u0000*\\u0000page\\\";i:1;s:12:\\\"\\u0000*\\u0000columnMap\\\";a:9:{s:7:\\\"sale.id\\\";s:7:\\\"Sale ID\\\";s:14:\\\"sale.sale_date\\\";s:9:\\\"Sale Date\\\";s:18:\\\"sale.customer.name\\\";s:8:\\\"Customer\\\";s:14:\\\"sale.user.name\\\";s:7:\\\"Sold By\\\";s:12:\\\"product.name\\\";s:7:\\\"Product\\\";s:3:\\\"qty\\\";s:8:\\\"Quantity\\\";s:10:\\\"unit_price\\\";s:10:\\\"Unit Price\\\";s:8:\\\"subtotal\\\";s:8:\\\"Subtotal\\\";s:17:\\\"total_sale_amount\\\";s:17:\\\"Total Sale Amount\\\";}s:10:\\\"\\u0000*\\u0000options\\\";a:0:{}s:7:\\\"batchId\\\";s:36:\\\"9fc73aa0-82cc-4993-93ce-60fb674d5e1f\\\";}\"},\"createdAt\":1756780313,\"delay\":null}', 11, NULL, 1756780367, 1756780367),
(1150, 'default', '{\"uuid\":\"15fa9129-d87a-4bb2-b0f5-af1a67720f5c\",\"displayName\":\"Filament\\\\Actions\\\\Exports\\\\Jobs\\\\ExportCsv\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":1756866713,\"data\":{\"commandName\":\"Filament\\\\Actions\\\\Exports\\\\Jobs\\\\ExportCsv\",\"command\":\"O:39:\\\"Filament\\\\Actions\\\\Exports\\\\Jobs\\\\ExportCsv\\\":8:{s:11:\\\"\\u0000*\\u0000exporter\\\";O:37:\\\"App\\\\Filament\\\\Exports\\\\SaleItemExporter\\\":3:{s:9:\\\"\\u0000*\\u0000export\\\";O:38:\\\"Filament\\\\Actions\\\\Exports\\\\Models\\\\Export\\\":33:{s:13:\\\"\\u0000*\\u0000connection\\\";s:5:\\\"mysql\\\";s:8:\\\"\\u0000*\\u0000table\\\";s:7:\\\"exports\\\";s:13:\\\"\\u0000*\\u0000primaryKey\\\";s:2:\\\"id\\\";s:10:\\\"\\u0000*\\u0000keyType\\\";s:3:\\\"int\\\";s:12:\\\"incrementing\\\";b:1;s:7:\\\"\\u0000*\\u0000with\\\";a:0:{}s:12:\\\"\\u0000*\\u0000withCount\\\";a:0:{}s:19:\\\"preventsLazyLoading\\\";b:0;s:10:\\\"\\u0000*\\u0000perPage\\\";i:15;s:6:\\\"exists\\\";b:1;s:18:\\\"wasRecentlyCreated\\\";b:0;s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;s:13:\\\"\\u0000*\\u0000attributes\\\";a:11:{s:2:\\\"id\\\";i:4;s:12:\\\"completed_at\\\";N;s:9:\\\"file_disk\\\";s:5:\\\"local\\\";s:9:\\\"file_name\\\";s:19:\\\"export-4-sale-items\\\";s:8:\\\"exporter\\\";s:37:\\\"App\\\\Filament\\\\Exports\\\\SaleItemExporter\\\";s:14:\\\"processed_rows\\\";i:0;s:10:\\\"total_rows\\\";i:168;s:15:\\\"successful_rows\\\";i:0;s:7:\\\"user_id\\\";i:1;s:10:\\\"created_at\\\";s:19:\\\"2025-09-02 09:31:44\\\";s:10:\\\"updated_at\\\";s:19:\\\"2025-09-02 09:31:44\\\";}s:11:\\\"\\u0000*\\u0000original\\\";a:11:{s:2:\\\"id\\\";i:4;s:12:\\\"completed_at\\\";N;s:9:\\\"file_disk\\\";s:5:\\\"local\\\";s:9:\\\"file_name\\\";s:19:\\\"export-4-sale-items\\\";s:8:\\\"exporter\\\";s:37:\\\"App\\\\Filament\\\\Exports\\\\SaleItemExporter\\\";s:14:\\\"processed_rows\\\";i:0;s:10:\\\"total_rows\\\";i:168;s:15:\\\"successful_rows\\\";i:0;s:7:\\\"user_id\\\";i:1;s:10:\\\"created_at\\\";s:19:\\\"2025-09-02 09:31:44\\\";s:10:\\\"updated_at\\\";s:19:\\\"2025-09-02 09:31:44\\\";}s:10:\\\"\\u0000*\\u0000changes\\\";a:0:{}s:11:\\\"\\u0000*\\u0000previous\\\";a:0:{}s:8:\\\"\\u0000*\\u0000casts\\\";a:4:{s:12:\\\"completed_at\\\";s:9:\\\"timestamp\\\";s:14:\\\"processed_rows\\\";s:7:\\\"integer\\\";s:10:\\\"total_rows\\\";s:7:\\\"integer\\\";s:15:\\\"successful_rows\\\";s:7:\\\"integer\\\";}s:17:\\\"\\u0000*\\u0000classCastCache\\\";a:0:{}s:21:\\\"\\u0000*\\u0000attributeCastCache\\\";a:0:{}s:13:\\\"\\u0000*\\u0000dateFormat\\\";N;s:10:\\\"\\u0000*\\u0000appends\\\";a:0:{}s:19:\\\"\\u0000*\\u0000dispatchesEvents\\\";a:0:{}s:14:\\\"\\u0000*\\u0000observables\\\";a:0:{}s:12:\\\"\\u0000*\\u0000relations\\\";a:0:{}s:10:\\\"\\u0000*\\u0000touches\\\";a:0:{}s:27:\\\"\\u0000*\\u0000relationAutoloadCallback\\\";N;s:26:\\\"\\u0000*\\u0000relationAutoloadContext\\\";N;s:10:\\\"timestamps\\\";b:1;s:13:\\\"usesUniqueIds\\\";b:0;s:9:\\\"\\u0000*\\u0000hidden\\\";a:0:{}s:10:\\\"\\u0000*\\u0000visible\\\";a:0:{}s:11:\\\"\\u0000*\\u0000fillable\\\";a:0:{}s:10:\\\"\\u0000*\\u0000guarded\\\";a:0:{}}s:12:\\\"\\u0000*\\u0000columnMap\\\";a:9:{s:7:\\\"sale.id\\\";s:7:\\\"Sale ID\\\";s:14:\\\"sale.sale_date\\\";s:9:\\\"Sale Date\\\";s:18:\\\"sale.customer.name\\\";s:8:\\\"Customer\\\";s:14:\\\"sale.user.name\\\";s:7:\\\"Sold By\\\";s:12:\\\"product.name\\\";s:7:\\\"Product\\\";s:3:\\\"qty\\\";s:8:\\\"Quantity\\\";s:10:\\\"unit_price\\\";s:10:\\\"Unit Price\\\";s:8:\\\"subtotal\\\";s:8:\\\"Subtotal\\\";s:17:\\\"total_sale_amount\\\";s:17:\\\"Total Sale Amount\\\";}s:10:\\\"\\u0000*\\u0000options\\\";a:0:{}}s:9:\\\"\\u0000*\\u0000export\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:38:\\\"Filament\\\\Actions\\\\Exports\\\\Models\\\\Export\\\";s:2:\\\"id\\\";i:4;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:8:\\\"\\u0000*\\u0000query\\\";s:617:\\\"O:36:\\\"AnourValar\\\\EloquentSerialize\\\\Package\\\":1:{s:42:\\\"\\u0000AnourValar\\\\EloquentSerialize\\\\Package\\u0000data\\\";a:4:{s:5:\\\"model\\\";s:15:\\\"App\\\\Models\\\\Sale\\\";s:10:\\\"connection\\\";N;s:8:\\\"eloquent\\\";a:3:{s:4:\\\"with\\\";a:0:{}s:14:\\\"removed_scopes\\\";a:0:{}s:5:\\\"casts\\\";a:1:{s:2:\\\"id\\\";s:3:\\\"int\\\";}}s:5:\\\"query\\\";a:5:{s:8:\\\"bindings\\\";a:9:{s:6:\\\"select\\\";a:0:{}s:4:\\\"from\\\";a:0:{}s:4:\\\"join\\\";a:0:{}s:5:\\\"where\\\";a:0:{}s:7:\\\"groupBy\\\";a:0:{}s:6:\\\"having\\\";a:0:{}s:5:\\\"order\\\";a:0:{}s:5:\\\"union\\\";a:0:{}s:10:\\\"unionOrder\\\";a:0:{}}s:8:\\\"distinct\\\";b:0;s:4:\\\"from\\\";s:5:\\\"sales\\\";s:6:\\\"wheres\\\";a:0:{}s:6:\\\"orders\\\";a:1:{i:0;a:2:{s:6:\\\"column\\\";s:9:\\\"sale_date\\\";s:9:\\\"direction\\\";s:4:\\\"desc\\\";}}}}}\\\";s:10:\\\"\\u0000*\\u0000records\\\";a:68:{i:0;i:159;i:1;i:38;i:2;i:23;i:3;i:36;i:4;i:83;i:5;i:111;i:6;i:62;i:7;i:35;i:8;i:112;i:9;i:28;i:10;i:110;i:11;i:82;i:12;i:61;i:13;i:27;i:14;i:81;i:15;i:60;i:16;i:80;i:17;i:22;i:18;i:10;i:19;i:26;i:20;i:109;i:21;i:108;i:22;i:79;i:23;i:20;i:24;i:59;i:25;i:58;i:26;i:57;i:27;i:107;i:28;i:106;i:29;i:166;i:30;i:78;i:31;i:56;i:32;i:105;i:33;i:55;i:34;i:19;i:35;i:54;i:36;i:104;i:37;i:53;i:38;i:77;i:39;i:103;i:40;i:52;i:41;i:51;i:42;i:102;i:43;i:101;i:44;i:50;i:45;i:76;i:46;i:75;i:47;i:100;i:48;i:49;i:49;i:99;i:50;i:98;i:51;i:48;i:52;i:74;i:53;i:73;i:54;i:97;i:55;i:72;i:56;i:71;i:57;i:96;i:58;i:70;i:59;i:46;i:60;i:69;i:61;i:152;i:62;i:45;i:63;i:95;i:64;i:44;i:65;i:43;i:66;i:68;i:67;i:153;}s:7:\\\"\\u0000*\\u0000page\\\";i:2;s:12:\\\"\\u0000*\\u0000columnMap\\\";a:9:{s:7:\\\"sale.id\\\";s:7:\\\"Sale ID\\\";s:14:\\\"sale.sale_date\\\";s:9:\\\"Sale Date\\\";s:18:\\\"sale.customer.name\\\";s:8:\\\"Customer\\\";s:14:\\\"sale.user.name\\\";s:7:\\\"Sold By\\\";s:12:\\\"product.name\\\";s:7:\\\"Product\\\";s:3:\\\"qty\\\";s:8:\\\"Quantity\\\";s:10:\\\"unit_price\\\";s:10:\\\"Unit Price\\\";s:8:\\\"subtotal\\\";s:8:\\\"Subtotal\\\";s:17:\\\"total_sale_amount\\\";s:17:\\\"Total Sale Amount\\\";}s:10:\\\"\\u0000*\\u0000options\\\";a:0:{}s:7:\\\"batchId\\\";s:36:\\\"9fc73aa0-82cc-4993-93ce-60fb674d5e1f\\\";}\"},\"createdAt\":1756780313,\"delay\":null}', 11, NULL, 1756780368, 1756780368),
(1151, 'default', '{\"uuid\":\"4034be35-3dca-4751-943a-4be37203e3e1\",\"displayName\":\"Filament\\\\Actions\\\\Exports\\\\Jobs\\\\ExportCsv\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":1756866236,\"data\":{\"commandName\":\"Filament\\\\Actions\\\\Exports\\\\Jobs\\\\ExportCsv\",\"command\":\"O:39:\\\"Filament\\\\Actions\\\\Exports\\\\Jobs\\\\ExportCsv\\\":8:{s:11:\\\"\\u0000*\\u0000exporter\\\";O:37:\\\"App\\\\Filament\\\\Exports\\\\SaleItemExporter\\\":3:{s:9:\\\"\\u0000*\\u0000export\\\";O:38:\\\"Filament\\\\Actions\\\\Exports\\\\Models\\\\Export\\\":33:{s:13:\\\"\\u0000*\\u0000connection\\\";s:5:\\\"mysql\\\";s:8:\\\"\\u0000*\\u0000table\\\";s:7:\\\"exports\\\";s:13:\\\"\\u0000*\\u0000primaryKey\\\";s:2:\\\"id\\\";s:10:\\\"\\u0000*\\u0000keyType\\\";s:3:\\\"int\\\";s:12:\\\"incrementing\\\";b:1;s:7:\\\"\\u0000*\\u0000with\\\";a:0:{}s:12:\\\"\\u0000*\\u0000withCount\\\";a:0:{}s:19:\\\"preventsLazyLoading\\\";b:0;s:10:\\\"\\u0000*\\u0000perPage\\\";i:15;s:6:\\\"exists\\\";b:1;s:18:\\\"wasRecentlyCreated\\\";b:0;s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;s:13:\\\"\\u0000*\\u0000attributes\\\";a:11:{s:2:\\\"id\\\";i:3;s:12:\\\"completed_at\\\";N;s:9:\\\"file_disk\\\";s:5:\\\"local\\\";s:9:\\\"file_name\\\";s:19:\\\"export-3-sale-items\\\";s:8:\\\"exporter\\\";s:37:\\\"App\\\\Filament\\\\Exports\\\\SaleItemExporter\\\";s:14:\\\"processed_rows\\\";i:0;s:10:\\\"total_rows\\\";i:168;s:15:\\\"successful_rows\\\";i:0;s:7:\\\"user_id\\\";i:1;s:10:\\\"created_at\\\";s:19:\\\"2025-09-02 09:23:50\\\";s:10:\\\"updated_at\\\";s:19:\\\"2025-09-02 09:23:50\\\";}s:11:\\\"\\u0000*\\u0000original\\\";a:11:{s:2:\\\"id\\\";i:3;s:12:\\\"completed_at\\\";N;s:9:\\\"file_disk\\\";s:5:\\\"local\\\";s:9:\\\"file_name\\\";s:19:\\\"export-3-sale-items\\\";s:8:\\\"exporter\\\";s:37:\\\"App\\\\Filament\\\\Exports\\\\SaleItemExporter\\\";s:14:\\\"processed_rows\\\";i:0;s:10:\\\"total_rows\\\";i:168;s:15:\\\"successful_rows\\\";i:0;s:7:\\\"user_id\\\";i:1;s:10:\\\"created_at\\\";s:19:\\\"2025-09-02 09:23:50\\\";s:10:\\\"updated_at\\\";s:19:\\\"2025-09-02 09:23:50\\\";}s:10:\\\"\\u0000*\\u0000changes\\\";a:0:{}s:11:\\\"\\u0000*\\u0000previous\\\";a:0:{}s:8:\\\"\\u0000*\\u0000casts\\\";a:4:{s:12:\\\"completed_at\\\";s:9:\\\"timestamp\\\";s:14:\\\"processed_rows\\\";s:7:\\\"integer\\\";s:10:\\\"total_rows\\\";s:7:\\\"integer\\\";s:15:\\\"successful_rows\\\";s:7:\\\"integer\\\";}s:17:\\\"\\u0000*\\u0000classCastCache\\\";a:0:{}s:21:\\\"\\u0000*\\u0000attributeCastCache\\\";a:0:{}s:13:\\\"\\u0000*\\u0000dateFormat\\\";N;s:10:\\\"\\u0000*\\u0000appends\\\";a:0:{}s:19:\\\"\\u0000*\\u0000dispatchesEvents\\\";a:0:{}s:14:\\\"\\u0000*\\u0000observables\\\";a:0:{}s:12:\\\"\\u0000*\\u0000relations\\\";a:0:{}s:10:\\\"\\u0000*\\u0000touches\\\";a:0:{}s:27:\\\"\\u0000*\\u0000relationAutoloadCallback\\\";N;s:26:\\\"\\u0000*\\u0000relationAutoloadContext\\\";N;s:10:\\\"timestamps\\\";b:1;s:13:\\\"usesUniqueIds\\\";b:0;s:9:\\\"\\u0000*\\u0000hidden\\\";a:0:{}s:10:\\\"\\u0000*\\u0000visible\\\";a:0:{}s:11:\\\"\\u0000*\\u0000fillable\\\";a:0:{}s:10:\\\"\\u0000*\\u0000guarded\\\";a:0:{}}s:12:\\\"\\u0000*\\u0000columnMap\\\";a:9:{s:7:\\\"sale.id\\\";s:7:\\\"Sale ID\\\";s:14:\\\"sale.sale_date\\\";s:9:\\\"Sale Date\\\";s:18:\\\"sale.customer.name\\\";s:8:\\\"Customer\\\";s:14:\\\"sale.user.name\\\";s:7:\\\"Sold By\\\";s:12:\\\"product.name\\\";s:7:\\\"Product\\\";s:3:\\\"qty\\\";s:8:\\\"Quantity\\\";s:10:\\\"unit_price\\\";s:10:\\\"Unit Price\\\";s:8:\\\"subtotal\\\";s:8:\\\"Subtotal\\\";s:17:\\\"total_sale_amount\\\";s:17:\\\"Total Sale Amount\\\";}s:10:\\\"\\u0000*\\u0000options\\\";a:0:{}}s:9:\\\"\\u0000*\\u0000export\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:38:\\\"Filament\\\\Actions\\\\Exports\\\\Models\\\\Export\\\";s:2:\\\"id\\\";i:3;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:8:\\\"\\u0000*\\u0000query\\\";s:617:\\\"O:36:\\\"AnourValar\\\\EloquentSerialize\\\\Package\\\":1:{s:42:\\\"\\u0000AnourValar\\\\EloquentSerialize\\\\Package\\u0000data\\\";a:4:{s:5:\\\"model\\\";s:15:\\\"App\\\\Models\\\\Sale\\\";s:10:\\\"connection\\\";N;s:8:\\\"eloquent\\\";a:3:{s:4:\\\"with\\\";a:0:{}s:14:\\\"removed_scopes\\\";a:0:{}s:5:\\\"casts\\\";a:1:{s:2:\\\"id\\\";s:3:\\\"int\\\";}}s:5:\\\"query\\\";a:5:{s:8:\\\"bindings\\\";a:9:{s:6:\\\"select\\\";a:0:{}s:4:\\\"from\\\";a:0:{}s:4:\\\"join\\\";a:0:{}s:5:\\\"where\\\";a:0:{}s:7:\\\"groupBy\\\";a:0:{}s:6:\\\"having\\\";a:0:{}s:5:\\\"order\\\";a:0:{}s:5:\\\"union\\\";a:0:{}s:10:\\\"unionOrder\\\";a:0:{}}s:8:\\\"distinct\\\";b:0;s:4:\\\"from\\\";s:5:\\\"sales\\\";s:6:\\\"wheres\\\";a:0:{}s:6:\\\"orders\\\";a:1:{i:0;a:2:{s:6:\\\"column\\\";s:9:\\\"sale_date\\\";s:9:\\\"direction\\\";s:4:\\\"desc\\\";}}}}}\\\";s:10:\\\"\\u0000*\\u0000records\\\";a:100:{i:0;i:167;i:1;i:168;i:2;i:18;i:3;i:21;i:4;i:143;i:5;i:41;i:6;i:124;i:7;i:92;i:8;i:93;i:9;i:125;i:10;i:126;i:11;i:127;i:12;i:128;i:13;i:130;i:14;i:120;i:15;i:132;i:16;i:123;i:17;i:133;i:18;i:134;i:19;i:131;i:20;i:163;i:21;i:139;i:22;i:138;i:23;i:137;i:24;i:135;i:25;i:141;i:26;i:142;i:27;i:136;i:28;i:140;i:29;i:144;i:30;i:145;i:31;i:146;i:32;i:129;i:33;i:147;i:34;i:148;i:35;i:150;i:36;i:151;i:37;i:165;i:38;i:122;i:39;i:162;i:40;i:149;i:41;i:17;i:42;i:42;i:43;i:13;i:44;i:14;i:45;i:15;i:46;i:16;i:47;i:11;i:48;i:12;i:49;i:3;i:50;i:4;i:51;i:47;i:52;i:1;i:53;i:164;i:54;i:91;i:55;i:121;i:56;i:34;i:57;i:8;i:58;i:119;i:59;i:67;i:60;i:2;i:61;i:9;i:62;i:25;i:63;i:33;i:64;i:7;i:65;i:66;i:66;i:157;i:67;i:158;i:68;i:90;i:69;i:156;i:70;i:32;i:71;i:40;i:72;i:89;i:73;i:160;i:74;i:118;i:75;i:6;i:76;i:117;i:77;i:155;i:78;i:88;i:79;i:87;i:80;i:65;i:81;i:64;i:82;i:31;i:83;i:161;i:84;i:116;i:85;i:5;i:86;i:39;i:87;i:115;i:88;i:30;i:89;i:86;i:90;i:63;i:91;i:37;i:92;i:85;i:93;i:84;i:94;i:114;i:95;i:154;i:96;i:29;i:97;i:94;i:98;i:113;i:99;i:24;}s:7:\\\"\\u0000*\\u0000page\\\";i:1;s:12:\\\"\\u0000*\\u0000columnMap\\\";a:9:{s:7:\\\"sale.id\\\";s:7:\\\"Sale ID\\\";s:14:\\\"sale.sale_date\\\";s:9:\\\"Sale Date\\\";s:18:\\\"sale.customer.name\\\";s:8:\\\"Customer\\\";s:14:\\\"sale.user.name\\\";s:7:\\\"Sold By\\\";s:12:\\\"product.name\\\";s:7:\\\"Product\\\";s:3:\\\"qty\\\";s:8:\\\"Quantity\\\";s:10:\\\"unit_price\\\";s:10:\\\"Unit Price\\\";s:8:\\\"subtotal\\\";s:8:\\\"Subtotal\\\";s:17:\\\"total_sale_amount\\\";s:17:\\\"Total Sale Amount\\\";}s:10:\\\"\\u0000*\\u0000options\\\";a:0:{}s:7:\\\"batchId\\\";s:36:\\\"9fc737cb-0343-4544-8128-7aeec2d5ccc6\\\";}\"},\"createdAt\":1756779836,\"delay\":null}', 138, NULL, 1756780369, 1756780369),
(1152, 'default', '{\"uuid\":\"776d9862-3ede-4b40-bcc4-304151927610\",\"displayName\":\"Filament\\\\Actions\\\\Exports\\\\Jobs\\\\ExportCsv\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":1756866236,\"data\":{\"commandName\":\"Filament\\\\Actions\\\\Exports\\\\Jobs\\\\ExportCsv\",\"command\":\"O:39:\\\"Filament\\\\Actions\\\\Exports\\\\Jobs\\\\ExportCsv\\\":8:{s:11:\\\"\\u0000*\\u0000exporter\\\";O:37:\\\"App\\\\Filament\\\\Exports\\\\SaleItemExporter\\\":3:{s:9:\\\"\\u0000*\\u0000export\\\";O:38:\\\"Filament\\\\Actions\\\\Exports\\\\Models\\\\Export\\\":33:{s:13:\\\"\\u0000*\\u0000connection\\\";s:5:\\\"mysql\\\";s:8:\\\"\\u0000*\\u0000table\\\";s:7:\\\"exports\\\";s:13:\\\"\\u0000*\\u0000primaryKey\\\";s:2:\\\"id\\\";s:10:\\\"\\u0000*\\u0000keyType\\\";s:3:\\\"int\\\";s:12:\\\"incrementing\\\";b:1;s:7:\\\"\\u0000*\\u0000with\\\";a:0:{}s:12:\\\"\\u0000*\\u0000withCount\\\";a:0:{}s:19:\\\"preventsLazyLoading\\\";b:0;s:10:\\\"\\u0000*\\u0000perPage\\\";i:15;s:6:\\\"exists\\\";b:1;s:18:\\\"wasRecentlyCreated\\\";b:0;s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;s:13:\\\"\\u0000*\\u0000attributes\\\";a:11:{s:2:\\\"id\\\";i:3;s:12:\\\"completed_at\\\";N;s:9:\\\"file_disk\\\";s:5:\\\"local\\\";s:9:\\\"file_name\\\";s:19:\\\"export-3-sale-items\\\";s:8:\\\"exporter\\\";s:37:\\\"App\\\\Filament\\\\Exports\\\\SaleItemExporter\\\";s:14:\\\"processed_rows\\\";i:0;s:10:\\\"total_rows\\\";i:168;s:15:\\\"successful_rows\\\";i:0;s:7:\\\"user_id\\\";i:1;s:10:\\\"created_at\\\";s:19:\\\"2025-09-02 09:23:50\\\";s:10:\\\"updated_at\\\";s:19:\\\"2025-09-02 09:23:50\\\";}s:11:\\\"\\u0000*\\u0000original\\\";a:11:{s:2:\\\"id\\\";i:3;s:12:\\\"completed_at\\\";N;s:9:\\\"file_disk\\\";s:5:\\\"local\\\";s:9:\\\"file_name\\\";s:19:\\\"export-3-sale-items\\\";s:8:\\\"exporter\\\";s:37:\\\"App\\\\Filament\\\\Exports\\\\SaleItemExporter\\\";s:14:\\\"processed_rows\\\";i:0;s:10:\\\"total_rows\\\";i:168;s:15:\\\"successful_rows\\\";i:0;s:7:\\\"user_id\\\";i:1;s:10:\\\"created_at\\\";s:19:\\\"2025-09-02 09:23:50\\\";s:10:\\\"updated_at\\\";s:19:\\\"2025-09-02 09:23:50\\\";}s:10:\\\"\\u0000*\\u0000changes\\\";a:0:{}s:11:\\\"\\u0000*\\u0000previous\\\";a:0:{}s:8:\\\"\\u0000*\\u0000casts\\\";a:4:{s:12:\\\"completed_at\\\";s:9:\\\"timestamp\\\";s:14:\\\"processed_rows\\\";s:7:\\\"integer\\\";s:10:\\\"total_rows\\\";s:7:\\\"integer\\\";s:15:\\\"successful_rows\\\";s:7:\\\"integer\\\";}s:17:\\\"\\u0000*\\u0000classCastCache\\\";a:0:{}s:21:\\\"\\u0000*\\u0000attributeCastCache\\\";a:0:{}s:13:\\\"\\u0000*\\u0000dateFormat\\\";N;s:10:\\\"\\u0000*\\u0000appends\\\";a:0:{}s:19:\\\"\\u0000*\\u0000dispatchesEvents\\\";a:0:{}s:14:\\\"\\u0000*\\u0000observables\\\";a:0:{}s:12:\\\"\\u0000*\\u0000relations\\\";a:0:{}s:10:\\\"\\u0000*\\u0000touches\\\";a:0:{}s:27:\\\"\\u0000*\\u0000relationAutoloadCallback\\\";N;s:26:\\\"\\u0000*\\u0000relationAutoloadContext\\\";N;s:10:\\\"timestamps\\\";b:1;s:13:\\\"usesUniqueIds\\\";b:0;s:9:\\\"\\u0000*\\u0000hidden\\\";a:0:{}s:10:\\\"\\u0000*\\u0000visible\\\";a:0:{}s:11:\\\"\\u0000*\\u0000fillable\\\";a:0:{}s:10:\\\"\\u0000*\\u0000guarded\\\";a:0:{}}s:12:\\\"\\u0000*\\u0000columnMap\\\";a:9:{s:7:\\\"sale.id\\\";s:7:\\\"Sale ID\\\";s:14:\\\"sale.sale_date\\\";s:9:\\\"Sale Date\\\";s:18:\\\"sale.customer.name\\\";s:8:\\\"Customer\\\";s:14:\\\"sale.user.name\\\";s:7:\\\"Sold By\\\";s:12:\\\"product.name\\\";s:7:\\\"Product\\\";s:3:\\\"qty\\\";s:8:\\\"Quantity\\\";s:10:\\\"unit_price\\\";s:10:\\\"Unit Price\\\";s:8:\\\"subtotal\\\";s:8:\\\"Subtotal\\\";s:17:\\\"total_sale_amount\\\";s:17:\\\"Total Sale Amount\\\";}s:10:\\\"\\u0000*\\u0000options\\\";a:0:{}}s:9:\\\"\\u0000*\\u0000export\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:38:\\\"Filament\\\\Actions\\\\Exports\\\\Models\\\\Export\\\";s:2:\\\"id\\\";i:3;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:8:\\\"\\u0000*\\u0000query\\\";s:617:\\\"O:36:\\\"AnourValar\\\\EloquentSerialize\\\\Package\\\":1:{s:42:\\\"\\u0000AnourValar\\\\EloquentSerialize\\\\Package\\u0000data\\\";a:4:{s:5:\\\"model\\\";s:15:\\\"App\\\\Models\\\\Sale\\\";s:10:\\\"connection\\\";N;s:8:\\\"eloquent\\\";a:3:{s:4:\\\"with\\\";a:0:{}s:14:\\\"removed_scopes\\\";a:0:{}s:5:\\\"casts\\\";a:1:{s:2:\\\"id\\\";s:3:\\\"int\\\";}}s:5:\\\"query\\\";a:5:{s:8:\\\"bindings\\\";a:9:{s:6:\\\"select\\\";a:0:{}s:4:\\\"from\\\";a:0:{}s:4:\\\"join\\\";a:0:{}s:5:\\\"where\\\";a:0:{}s:7:\\\"groupBy\\\";a:0:{}s:6:\\\"having\\\";a:0:{}s:5:\\\"order\\\";a:0:{}s:5:\\\"union\\\";a:0:{}s:10:\\\"unionOrder\\\";a:0:{}}s:8:\\\"distinct\\\";b:0;s:4:\\\"from\\\";s:5:\\\"sales\\\";s:6:\\\"wheres\\\";a:0:{}s:6:\\\"orders\\\";a:1:{i:0;a:2:{s:6:\\\"column\\\";s:9:\\\"sale_date\\\";s:9:\\\"direction\\\";s:4:\\\"desc\\\";}}}}}\\\";s:10:\\\"\\u0000*\\u0000records\\\";a:68:{i:0;i:159;i:1;i:38;i:2;i:23;i:3;i:36;i:4;i:83;i:5;i:111;i:6;i:62;i:7;i:35;i:8;i:112;i:9;i:28;i:10;i:110;i:11;i:82;i:12;i:61;i:13;i:27;i:14;i:81;i:15;i:60;i:16;i:80;i:17;i:22;i:18;i:10;i:19;i:26;i:20;i:109;i:21;i:108;i:22;i:79;i:23;i:20;i:24;i:59;i:25;i:58;i:26;i:57;i:27;i:107;i:28;i:106;i:29;i:166;i:30;i:78;i:31;i:56;i:32;i:105;i:33;i:55;i:34;i:19;i:35;i:54;i:36;i:104;i:37;i:53;i:38;i:77;i:39;i:103;i:40;i:52;i:41;i:51;i:42;i:102;i:43;i:101;i:44;i:50;i:45;i:76;i:46;i:75;i:47;i:100;i:48;i:49;i:49;i:99;i:50;i:98;i:51;i:48;i:52;i:74;i:53;i:73;i:54;i:97;i:55;i:72;i:56;i:71;i:57;i:96;i:58;i:70;i:59;i:46;i:60;i:69;i:61;i:152;i:62;i:45;i:63;i:95;i:64;i:44;i:65;i:43;i:66;i:68;i:67;i:153;}s:7:\\\"\\u0000*\\u0000page\\\";i:2;s:12:\\\"\\u0000*\\u0000columnMap\\\";a:9:{s:7:\\\"sale.id\\\";s:7:\\\"Sale ID\\\";s:14:\\\"sale.sale_date\\\";s:9:\\\"Sale Date\\\";s:18:\\\"sale.customer.name\\\";s:8:\\\"Customer\\\";s:14:\\\"sale.user.name\\\";s:7:\\\"Sold By\\\";s:12:\\\"product.name\\\";s:7:\\\"Product\\\";s:3:\\\"qty\\\";s:8:\\\"Quantity\\\";s:10:\\\"unit_price\\\";s:10:\\\"Unit Price\\\";s:8:\\\"subtotal\\\";s:8:\\\"Subtotal\\\";s:17:\\\"total_sale_amount\\\";s:17:\\\"Total Sale Amount\\\";}s:10:\\\"\\u0000*\\u0000options\\\";a:0:{}s:7:\\\"batchId\\\";s:36:\\\"9fc737cb-0343-4544-8128-7aeec2d5ccc6\\\";}\"},\"createdAt\":1756779836,\"delay\":null}', 138, NULL, 1756780369, 1756780369);
INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(1153, 'default', '{\"uuid\":\"77a5a225-3ffd-4f3c-bf87-613742d85715\",\"displayName\":\"Filament\\\\Actions\\\\Exports\\\\Jobs\\\\ExportCsv\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":1756866063,\"data\":{\"commandName\":\"Filament\\\\Actions\\\\Exports\\\\Jobs\\\\ExportCsv\",\"command\":\"O:39:\\\"Filament\\\\Actions\\\\Exports\\\\Jobs\\\\ExportCsv\\\":8:{s:11:\\\"\\u0000*\\u0000exporter\\\";O:37:\\\"App\\\\Filament\\\\Exports\\\\SaleItemExporter\\\":3:{s:9:\\\"\\u0000*\\u0000export\\\";O:38:\\\"Filament\\\\Actions\\\\Exports\\\\Models\\\\Export\\\":33:{s:13:\\\"\\u0000*\\u0000connection\\\";s:5:\\\"mysql\\\";s:8:\\\"\\u0000*\\u0000table\\\";s:7:\\\"exports\\\";s:13:\\\"\\u0000*\\u0000primaryKey\\\";s:2:\\\"id\\\";s:10:\\\"\\u0000*\\u0000keyType\\\";s:3:\\\"int\\\";s:12:\\\"incrementing\\\";b:1;s:7:\\\"\\u0000*\\u0000with\\\";a:0:{}s:12:\\\"\\u0000*\\u0000withCount\\\";a:0:{}s:19:\\\"preventsLazyLoading\\\";b:0;s:10:\\\"\\u0000*\\u0000perPage\\\";i:15;s:6:\\\"exists\\\";b:1;s:18:\\\"wasRecentlyCreated\\\";b:0;s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;s:13:\\\"\\u0000*\\u0000attributes\\\";a:11:{s:2:\\\"id\\\";i:1;s:12:\\\"completed_at\\\";N;s:9:\\\"file_disk\\\";s:5:\\\"local\\\";s:9:\\\"file_name\\\";s:19:\\\"export-1-sale-items\\\";s:8:\\\"exporter\\\";s:37:\\\"App\\\\Filament\\\\Exports\\\\SaleItemExporter\\\";s:14:\\\"processed_rows\\\";i:0;s:10:\\\"total_rows\\\";i:168;s:15:\\\"successful_rows\\\";i:0;s:7:\\\"user_id\\\";i:1;s:10:\\\"created_at\\\";s:19:\\\"2025-09-02 09:21:00\\\";s:10:\\\"updated_at\\\";s:19:\\\"2025-09-02 09:21:00\\\";}s:11:\\\"\\u0000*\\u0000original\\\";a:11:{s:2:\\\"id\\\";i:1;s:12:\\\"completed_at\\\";N;s:9:\\\"file_disk\\\";s:5:\\\"local\\\";s:9:\\\"file_name\\\";s:19:\\\"export-1-sale-items\\\";s:8:\\\"exporter\\\";s:37:\\\"App\\\\Filament\\\\Exports\\\\SaleItemExporter\\\";s:14:\\\"processed_rows\\\";i:0;s:10:\\\"total_rows\\\";i:168;s:15:\\\"successful_rows\\\";i:0;s:7:\\\"user_id\\\";i:1;s:10:\\\"created_at\\\";s:19:\\\"2025-09-02 09:21:00\\\";s:10:\\\"updated_at\\\";s:19:\\\"2025-09-02 09:21:00\\\";}s:10:\\\"\\u0000*\\u0000changes\\\";a:0:{}s:11:\\\"\\u0000*\\u0000previous\\\";a:0:{}s:8:\\\"\\u0000*\\u0000casts\\\";a:4:{s:12:\\\"completed_at\\\";s:9:\\\"timestamp\\\";s:14:\\\"processed_rows\\\";s:7:\\\"integer\\\";s:10:\\\"total_rows\\\";s:7:\\\"integer\\\";s:15:\\\"successful_rows\\\";s:7:\\\"integer\\\";}s:17:\\\"\\u0000*\\u0000classCastCache\\\";a:0:{}s:21:\\\"\\u0000*\\u0000attributeCastCache\\\";a:0:{}s:13:\\\"\\u0000*\\u0000dateFormat\\\";N;s:10:\\\"\\u0000*\\u0000appends\\\";a:0:{}s:19:\\\"\\u0000*\\u0000dispatchesEvents\\\";a:0:{}s:14:\\\"\\u0000*\\u0000observables\\\";a:0:{}s:12:\\\"\\u0000*\\u0000relations\\\";a:0:{}s:10:\\\"\\u0000*\\u0000touches\\\";a:0:{}s:27:\\\"\\u0000*\\u0000relationAutoloadCallback\\\";N;s:26:\\\"\\u0000*\\u0000relationAutoloadContext\\\";N;s:10:\\\"timestamps\\\";b:1;s:13:\\\"usesUniqueIds\\\";b:0;s:9:\\\"\\u0000*\\u0000hidden\\\";a:0:{}s:10:\\\"\\u0000*\\u0000visible\\\";a:0:{}s:11:\\\"\\u0000*\\u0000fillable\\\";a:0:{}s:10:\\\"\\u0000*\\u0000guarded\\\";a:0:{}}s:12:\\\"\\u0000*\\u0000columnMap\\\";a:9:{s:7:\\\"sale.id\\\";s:7:\\\"Sale ID\\\";s:14:\\\"sale.sale_date\\\";s:9:\\\"Sale Date\\\";s:18:\\\"sale.customer.name\\\";s:8:\\\"Customer\\\";s:14:\\\"sale.user.name\\\";s:7:\\\"Sold By\\\";s:12:\\\"product.name\\\";s:7:\\\"Product\\\";s:3:\\\"qty\\\";s:8:\\\"Quantity\\\";s:10:\\\"unit_price\\\";s:10:\\\"Unit Price\\\";s:8:\\\"subtotal\\\";s:8:\\\"Subtotal\\\";s:17:\\\"total_sale_amount\\\";s:17:\\\"Total Sale Amount\\\";}s:10:\\\"\\u0000*\\u0000options\\\";a:0:{}}s:9:\\\"\\u0000*\\u0000export\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:38:\\\"Filament\\\\Actions\\\\Exports\\\\Models\\\\Export\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:8:\\\"\\u0000*\\u0000query\\\";s:617:\\\"O:36:\\\"AnourValar\\\\EloquentSerialize\\\\Package\\\":1:{s:42:\\\"\\u0000AnourValar\\\\EloquentSerialize\\\\Package\\u0000data\\\";a:4:{s:5:\\\"model\\\";s:15:\\\"App\\\\Models\\\\Sale\\\";s:10:\\\"connection\\\";N;s:8:\\\"eloquent\\\";a:3:{s:4:\\\"with\\\";a:0:{}s:14:\\\"removed_scopes\\\";a:0:{}s:5:\\\"casts\\\";a:1:{s:2:\\\"id\\\";s:3:\\\"int\\\";}}s:5:\\\"query\\\";a:5:{s:8:\\\"bindings\\\";a:9:{s:6:\\\"select\\\";a:0:{}s:4:\\\"from\\\";a:0:{}s:4:\\\"join\\\";a:0:{}s:5:\\\"where\\\";a:0:{}s:7:\\\"groupBy\\\";a:0:{}s:6:\\\"having\\\";a:0:{}s:5:\\\"order\\\";a:0:{}s:5:\\\"union\\\";a:0:{}s:10:\\\"unionOrder\\\";a:0:{}}s:8:\\\"distinct\\\";b:0;s:4:\\\"from\\\";s:5:\\\"sales\\\";s:6:\\\"wheres\\\";a:0:{}s:6:\\\"orders\\\";a:1:{i:0;a:2:{s:6:\\\"column\\\";s:9:\\\"sale_date\\\";s:9:\\\"direction\\\";s:4:\\\"desc\\\";}}}}}\\\";s:10:\\\"\\u0000*\\u0000records\\\";a:68:{i:0;i:159;i:1;i:38;i:2;i:23;i:3;i:36;i:4;i:83;i:5;i:111;i:6;i:62;i:7;i:35;i:8;i:112;i:9;i:28;i:10;i:110;i:11;i:82;i:12;i:61;i:13;i:27;i:14;i:81;i:15;i:60;i:16;i:80;i:17;i:22;i:18;i:10;i:19;i:26;i:20;i:109;i:21;i:108;i:22;i:79;i:23;i:20;i:24;i:59;i:25;i:58;i:26;i:57;i:27;i:107;i:28;i:106;i:29;i:166;i:30;i:78;i:31;i:56;i:32;i:105;i:33;i:55;i:34;i:19;i:35;i:54;i:36;i:104;i:37;i:53;i:38;i:77;i:39;i:103;i:40;i:52;i:41;i:51;i:42;i:102;i:43;i:101;i:44;i:50;i:45;i:76;i:46;i:75;i:47;i:100;i:48;i:49;i:49;i:99;i:50;i:98;i:51;i:48;i:52;i:74;i:53;i:73;i:54;i:97;i:55;i:72;i:56;i:71;i:57;i:96;i:58;i:70;i:59;i:46;i:60;i:69;i:61;i:152;i:62;i:45;i:63;i:95;i:64;i:44;i:65;i:43;i:66;i:68;i:67;i:153;}s:7:\\\"\\u0000*\\u0000page\\\";i:2;s:12:\\\"\\u0000*\\u0000columnMap\\\";a:9:{s:7:\\\"sale.id\\\";s:7:\\\"Sale ID\\\";s:14:\\\"sale.sale_date\\\";s:9:\\\"Sale Date\\\";s:18:\\\"sale.customer.name\\\";s:8:\\\"Customer\\\";s:14:\\\"sale.user.name\\\";s:7:\\\"Sold By\\\";s:12:\\\"product.name\\\";s:7:\\\"Product\\\";s:3:\\\"qty\\\";s:8:\\\"Quantity\\\";s:10:\\\"unit_price\\\";s:10:\\\"Unit Price\\\";s:8:\\\"subtotal\\\";s:8:\\\"Subtotal\\\";s:17:\\\"total_sale_amount\\\";s:17:\\\"Total Sale Amount\\\";}s:10:\\\"\\u0000*\\u0000options\\\";a:0:{}s:7:\\\"batchId\\\";s:36:\\\"9fc736c5-96df-46c0-a006-7a4acc430f47\\\";}\"},\"createdAt\":1756779663,\"delay\":null}', 255, NULL, 1756780370, 1756780370);

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job_batches`
--

INSERT INTO `job_batches` (`id`, `name`, `total_jobs`, `pending_jobs`, `failed_jobs`, `failed_job_ids`, `options`, `cancelled_at`, `created_at`, `finished_at`) VALUES
('9fc736c5-96df-46c0-a006-7a4acc430f47', '', 3, 2, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:6226:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:1:{s:4:\"next\";O:46:\"Filament\\Actions\\Exports\\Jobs\\ExportCompletion\":7:{s:11:\"\0*\0exporter\";O:37:\"App\\Filament\\Exports\\SaleItemExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:37:\"App\\Filament\\Exports\\SaleItemExporter\";s:10:\"total_rows\";i:168;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-02 09:21:00\";s:10:\"created_at\";s:19:\"2025-09-02 09:21:00\";s:2:\"id\";i:1;s:9:\"file_name\";s:19:\"export-1-sale-items\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:37:\"App\\Filament\\Exports\\SaleItemExporter\";s:10:\"total_rows\";i:168;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-02 09:21:00\";s:10:\"created_at\";s:19:\"2025-09-02 09:21:00\";s:2:\"id\";i:1;s:9:\"file_name\";s:19:\"export-1-sale-items\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:19:\"export-1-sale-items\";}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:9:{s:7:\"sale.id\";s:7:\"Sale ID\";s:14:\"sale.sale_date\";s:9:\"Sale Date\";s:18:\"sale.customer.name\";s:8:\"Customer\";s:14:\"sale.user.name\";s:7:\"Sold By\";s:12:\"product.name\";s:7:\"Product\";s:3:\"qty\";s:8:\"Quantity\";s:10:\"unit_price\";s:10:\"Unit Price\";s:8:\"subtotal\";s:8:\"Subtotal\";s:17:\"total_sale_amount\";s:17:\"Total Sale Amount\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:1;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:9:{s:7:\"sale.id\";s:7:\"Sale ID\";s:14:\"sale.sale_date\";s:9:\"Sale Date\";s:18:\"sale.customer.name\";s:8:\"Customer\";s:14:\"sale.user.name\";s:7:\"Sold By\";s:12:\"product.name\";s:7:\"Product\";s:3:\"qty\";s:8:\"Quantity\";s:10:\"unit_price\";s:10:\"Unit Price\";s:8:\"subtotal\";s:8:\"Subtotal\";s:17:\"total_sale_amount\";s:17:\"Total Sale Amount\";}s:10:\"\0*\0formats\";a:2:{i:0;E:47:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Csv\";i:1;E:48:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Xlsx\";}s:10:\"\0*\0options\";a:0:{}s:7:\"chained\";a:1:{i:0;s:2764:\"O:44:\"Filament\\Actions\\Exports\\Jobs\\CreateXlsxFile\":4:{s:11:\"\0*\0exporter\";O:37:\"App\\Filament\\Exports\\SaleItemExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:37:\"App\\Filament\\Exports\\SaleItemExporter\";s:10:\"total_rows\";i:168;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-02 09:21:00\";s:10:\"created_at\";s:19:\"2025-09-02 09:21:00\";s:2:\"id\";i:1;s:9:\"file_name\";s:19:\"export-1-sale-items\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:37:\"App\\Filament\\Exports\\SaleItemExporter\";s:10:\"total_rows\";i:168;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-02 09:21:00\";s:10:\"created_at\";s:19:\"2025-09-02 09:21:00\";s:2:\"id\";i:1;s:9:\"file_name\";s:19:\"export-1-sale-items\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:19:\"export-1-sale-items\";}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:9:{s:7:\"sale.id\";s:7:\"Sale ID\";s:14:\"sale.sale_date\";s:9:\"Sale Date\";s:18:\"sale.customer.name\";s:8:\"Customer\";s:14:\"sale.user.name\";s:7:\"Sold By\";s:12:\"product.name\";s:7:\"Product\";s:3:\"qty\";s:8:\"Quantity\";s:10:\"unit_price\";s:10:\"Unit Price\";s:8:\"subtotal\";s:8:\"Subtotal\";s:17:\"total_sale_amount\";s:17:\"Total Sale Amount\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:1;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:9:{s:7:\"sale.id\";s:7:\"Sale ID\";s:14:\"sale.sale_date\";s:9:\"Sale Date\";s:18:\"sale.customer.name\";s:8:\"Customer\";s:14:\"sale.user.name\";s:7:\"Sold By\";s:12:\"product.name\";s:7:\"Product\";s:3:\"qty\";s:8:\"Quantity\";s:10:\"unit_price\";s:10:\"Unit Price\";s:8:\"subtotal\";s:8:\"Subtotal\";s:17:\"total_sale_amount\";s:17:\"Total Sale Amount\";}s:10:\"\0*\0options\";a:0:{}}\";}s:19:\"chainCatchCallbacks\";a:0:{}}}s:8:\"function\";s:266:\"function (\\Illuminate\\Bus\\Batch $batch) use ($next) {\n                if (! $batch->cancelled()) {\n                    \\Illuminate\\Container\\Container::getInstance()->make(\\Illuminate\\Contracts\\Bus\\Dispatcher::class)->dispatch($next);\n                }\n            }\";s:5:\"scope\";s:27:\"Illuminate\\Bus\\ChainedBatch\";s:4:\"this\";N;s:4:\"self\";s:32:\"00000000000008e30000000000000000\";}\";s:4:\"hash\";s:44:\"EB7ictdyg9jL6XFLTlYf6t3g3GOa35LQ63UjSO54zZU=\";}}}}', NULL, 1756779662, NULL),
('9fc7377b-3def-4a18-b7f4-bc26a79e07d9', '', 3, 2, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:6226:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:1:{s:4:\"next\";O:46:\"Filament\\Actions\\Exports\\Jobs\\ExportCompletion\":7:{s:11:\"\0*\0exporter\";O:37:\"App\\Filament\\Exports\\SaleItemExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:37:\"App\\Filament\\Exports\\SaleItemExporter\";s:10:\"total_rows\";i:168;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-02 09:22:59\";s:10:\"created_at\";s:19:\"2025-09-02 09:22:59\";s:2:\"id\";i:2;s:9:\"file_name\";s:19:\"export-2-sale-items\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:37:\"App\\Filament\\Exports\\SaleItemExporter\";s:10:\"total_rows\";i:168;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-02 09:22:59\";s:10:\"created_at\";s:19:\"2025-09-02 09:22:59\";s:2:\"id\";i:2;s:9:\"file_name\";s:19:\"export-2-sale-items\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:19:\"export-2-sale-items\";}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:9:{s:7:\"sale.id\";s:7:\"Sale ID\";s:14:\"sale.sale_date\";s:9:\"Sale Date\";s:18:\"sale.customer.name\";s:8:\"Customer\";s:14:\"sale.user.name\";s:7:\"Sold By\";s:12:\"product.name\";s:7:\"Product\";s:3:\"qty\";s:8:\"Quantity\";s:10:\"unit_price\";s:10:\"Unit Price\";s:8:\"subtotal\";s:8:\"Subtotal\";s:17:\"total_sale_amount\";s:17:\"Total Sale Amount\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:2;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:9:{s:7:\"sale.id\";s:7:\"Sale ID\";s:14:\"sale.sale_date\";s:9:\"Sale Date\";s:18:\"sale.customer.name\";s:8:\"Customer\";s:14:\"sale.user.name\";s:7:\"Sold By\";s:12:\"product.name\";s:7:\"Product\";s:3:\"qty\";s:8:\"Quantity\";s:10:\"unit_price\";s:10:\"Unit Price\";s:8:\"subtotal\";s:8:\"Subtotal\";s:17:\"total_sale_amount\";s:17:\"Total Sale Amount\";}s:10:\"\0*\0formats\";a:2:{i:0;E:47:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Csv\";i:1;E:48:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Xlsx\";}s:10:\"\0*\0options\";a:0:{}s:7:\"chained\";a:1:{i:0;s:2764:\"O:44:\"Filament\\Actions\\Exports\\Jobs\\CreateXlsxFile\":4:{s:11:\"\0*\0exporter\";O:37:\"App\\Filament\\Exports\\SaleItemExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:37:\"App\\Filament\\Exports\\SaleItemExporter\";s:10:\"total_rows\";i:168;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-02 09:22:59\";s:10:\"created_at\";s:19:\"2025-09-02 09:22:59\";s:2:\"id\";i:2;s:9:\"file_name\";s:19:\"export-2-sale-items\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:37:\"App\\Filament\\Exports\\SaleItemExporter\";s:10:\"total_rows\";i:168;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-02 09:22:59\";s:10:\"created_at\";s:19:\"2025-09-02 09:22:59\";s:2:\"id\";i:2;s:9:\"file_name\";s:19:\"export-2-sale-items\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:19:\"export-2-sale-items\";}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:9:{s:7:\"sale.id\";s:7:\"Sale ID\";s:14:\"sale.sale_date\";s:9:\"Sale Date\";s:18:\"sale.customer.name\";s:8:\"Customer\";s:14:\"sale.user.name\";s:7:\"Sold By\";s:12:\"product.name\";s:7:\"Product\";s:3:\"qty\";s:8:\"Quantity\";s:10:\"unit_price\";s:10:\"Unit Price\";s:8:\"subtotal\";s:8:\"Subtotal\";s:17:\"total_sale_amount\";s:17:\"Total Sale Amount\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:2;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:9:{s:7:\"sale.id\";s:7:\"Sale ID\";s:14:\"sale.sale_date\";s:9:\"Sale Date\";s:18:\"sale.customer.name\";s:8:\"Customer\";s:14:\"sale.user.name\";s:7:\"Sold By\";s:12:\"product.name\";s:7:\"Product\";s:3:\"qty\";s:8:\"Quantity\";s:10:\"unit_price\";s:10:\"Unit Price\";s:8:\"subtotal\";s:8:\"Subtotal\";s:17:\"total_sale_amount\";s:17:\"Total Sale Amount\";}s:10:\"\0*\0options\";a:0:{}}\";}s:19:\"chainCatchCallbacks\";a:0:{}}}s:8:\"function\";s:266:\"function (\\Illuminate\\Bus\\Batch $batch) use ($next) {\n                if (! $batch->cancelled()) {\n                    \\Illuminate\\Container\\Container::getInstance()->make(\\Illuminate\\Contracts\\Bus\\Dispatcher::class)->dispatch($next);\n                }\n            }\";s:5:\"scope\";s:27:\"Illuminate\\Bus\\ChainedBatch\";s:4:\"this\";N;s:4:\"self\";s:32:\"00000000000008e30000000000000000\";}\";s:4:\"hash\";s:44:\"XowWIztbyOjTqtgEguy3E9pLr7QbXJgRPRVcrEVBkrA=\";}}}}', NULL, 1756779781, NULL),
('9fc737cb-0343-4544-8128-7aeec2d5ccc6', '', 3, 2, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:6226:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:1:{s:4:\"next\";O:46:\"Filament\\Actions\\Exports\\Jobs\\ExportCompletion\":7:{s:11:\"\0*\0exporter\";O:37:\"App\\Filament\\Exports\\SaleItemExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:37:\"App\\Filament\\Exports\\SaleItemExporter\";s:10:\"total_rows\";i:168;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-02 09:23:50\";s:10:\"created_at\";s:19:\"2025-09-02 09:23:50\";s:2:\"id\";i:3;s:9:\"file_name\";s:19:\"export-3-sale-items\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:37:\"App\\Filament\\Exports\\SaleItemExporter\";s:10:\"total_rows\";i:168;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-02 09:23:50\";s:10:\"created_at\";s:19:\"2025-09-02 09:23:50\";s:2:\"id\";i:3;s:9:\"file_name\";s:19:\"export-3-sale-items\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:19:\"export-3-sale-items\";}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:9:{s:7:\"sale.id\";s:7:\"Sale ID\";s:14:\"sale.sale_date\";s:9:\"Sale Date\";s:18:\"sale.customer.name\";s:8:\"Customer\";s:14:\"sale.user.name\";s:7:\"Sold By\";s:12:\"product.name\";s:7:\"Product\";s:3:\"qty\";s:8:\"Quantity\";s:10:\"unit_price\";s:10:\"Unit Price\";s:8:\"subtotal\";s:8:\"Subtotal\";s:17:\"total_sale_amount\";s:17:\"Total Sale Amount\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:3;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:9:{s:7:\"sale.id\";s:7:\"Sale ID\";s:14:\"sale.sale_date\";s:9:\"Sale Date\";s:18:\"sale.customer.name\";s:8:\"Customer\";s:14:\"sale.user.name\";s:7:\"Sold By\";s:12:\"product.name\";s:7:\"Product\";s:3:\"qty\";s:8:\"Quantity\";s:10:\"unit_price\";s:10:\"Unit Price\";s:8:\"subtotal\";s:8:\"Subtotal\";s:17:\"total_sale_amount\";s:17:\"Total Sale Amount\";}s:10:\"\0*\0formats\";a:2:{i:0;E:47:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Csv\";i:1;E:48:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Xlsx\";}s:10:\"\0*\0options\";a:0:{}s:7:\"chained\";a:1:{i:0;s:2764:\"O:44:\"Filament\\Actions\\Exports\\Jobs\\CreateXlsxFile\":4:{s:11:\"\0*\0exporter\";O:37:\"App\\Filament\\Exports\\SaleItemExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:37:\"App\\Filament\\Exports\\SaleItemExporter\";s:10:\"total_rows\";i:168;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-02 09:23:50\";s:10:\"created_at\";s:19:\"2025-09-02 09:23:50\";s:2:\"id\";i:3;s:9:\"file_name\";s:19:\"export-3-sale-items\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:37:\"App\\Filament\\Exports\\SaleItemExporter\";s:10:\"total_rows\";i:168;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-02 09:23:50\";s:10:\"created_at\";s:19:\"2025-09-02 09:23:50\";s:2:\"id\";i:3;s:9:\"file_name\";s:19:\"export-3-sale-items\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:19:\"export-3-sale-items\";}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:9:{s:7:\"sale.id\";s:7:\"Sale ID\";s:14:\"sale.sale_date\";s:9:\"Sale Date\";s:18:\"sale.customer.name\";s:8:\"Customer\";s:14:\"sale.user.name\";s:7:\"Sold By\";s:12:\"product.name\";s:7:\"Product\";s:3:\"qty\";s:8:\"Quantity\";s:10:\"unit_price\";s:10:\"Unit Price\";s:8:\"subtotal\";s:8:\"Subtotal\";s:17:\"total_sale_amount\";s:17:\"Total Sale Amount\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:3;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:9:{s:7:\"sale.id\";s:7:\"Sale ID\";s:14:\"sale.sale_date\";s:9:\"Sale Date\";s:18:\"sale.customer.name\";s:8:\"Customer\";s:14:\"sale.user.name\";s:7:\"Sold By\";s:12:\"product.name\";s:7:\"Product\";s:3:\"qty\";s:8:\"Quantity\";s:10:\"unit_price\";s:10:\"Unit Price\";s:8:\"subtotal\";s:8:\"Subtotal\";s:17:\"total_sale_amount\";s:17:\"Total Sale Amount\";}s:10:\"\0*\0options\";a:0:{}}\";}s:19:\"chainCatchCallbacks\";a:0:{}}}s:8:\"function\";s:266:\"function (\\Illuminate\\Bus\\Batch $batch) use ($next) {\n                if (! $batch->cancelled()) {\n                    \\Illuminate\\Container\\Container::getInstance()->make(\\Illuminate\\Contracts\\Bus\\Dispatcher::class)->dispatch($next);\n                }\n            }\";s:5:\"scope\";s:27:\"Illuminate\\Bus\\ChainedBatch\";s:4:\"this\";N;s:4:\"self\";s:32:\"00000000000008e30000000000000000\";}\";s:4:\"hash\";s:44:\"0jKlw6aPqz1KpGrCVat4+GBAoYOjBqqPI4Dy9fVgjfQ=\";}}}}', NULL, 1756779833, NULL),
('9fc73aa0-82cc-4993-93ce-60fb674d5e1f', '', 3, 2, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:6226:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:1:{s:4:\"next\";O:46:\"Filament\\Actions\\Exports\\Jobs\\ExportCompletion\":7:{s:11:\"\0*\0exporter\";O:37:\"App\\Filament\\Exports\\SaleItemExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:37:\"App\\Filament\\Exports\\SaleItemExporter\";s:10:\"total_rows\";i:168;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-02 09:31:44\";s:10:\"created_at\";s:19:\"2025-09-02 09:31:44\";s:2:\"id\";i:4;s:9:\"file_name\";s:19:\"export-4-sale-items\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:37:\"App\\Filament\\Exports\\SaleItemExporter\";s:10:\"total_rows\";i:168;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-02 09:31:44\";s:10:\"created_at\";s:19:\"2025-09-02 09:31:44\";s:2:\"id\";i:4;s:9:\"file_name\";s:19:\"export-4-sale-items\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:19:\"export-4-sale-items\";}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:9:{s:7:\"sale.id\";s:7:\"Sale ID\";s:14:\"sale.sale_date\";s:9:\"Sale Date\";s:18:\"sale.customer.name\";s:8:\"Customer\";s:14:\"sale.user.name\";s:7:\"Sold By\";s:12:\"product.name\";s:7:\"Product\";s:3:\"qty\";s:8:\"Quantity\";s:10:\"unit_price\";s:10:\"Unit Price\";s:8:\"subtotal\";s:8:\"Subtotal\";s:17:\"total_sale_amount\";s:17:\"Total Sale Amount\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:4;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:9:{s:7:\"sale.id\";s:7:\"Sale ID\";s:14:\"sale.sale_date\";s:9:\"Sale Date\";s:18:\"sale.customer.name\";s:8:\"Customer\";s:14:\"sale.user.name\";s:7:\"Sold By\";s:12:\"product.name\";s:7:\"Product\";s:3:\"qty\";s:8:\"Quantity\";s:10:\"unit_price\";s:10:\"Unit Price\";s:8:\"subtotal\";s:8:\"Subtotal\";s:17:\"total_sale_amount\";s:17:\"Total Sale Amount\";}s:10:\"\0*\0formats\";a:2:{i:0;E:47:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Csv\";i:1;E:48:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Xlsx\";}s:10:\"\0*\0options\";a:0:{}s:7:\"chained\";a:1:{i:0;s:2764:\"O:44:\"Filament\\Actions\\Exports\\Jobs\\CreateXlsxFile\":4:{s:11:\"\0*\0exporter\";O:37:\"App\\Filament\\Exports\\SaleItemExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:37:\"App\\Filament\\Exports\\SaleItemExporter\";s:10:\"total_rows\";i:168;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-02 09:31:44\";s:10:\"created_at\";s:19:\"2025-09-02 09:31:44\";s:2:\"id\";i:4;s:9:\"file_name\";s:19:\"export-4-sale-items\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:37:\"App\\Filament\\Exports\\SaleItemExporter\";s:10:\"total_rows\";i:168;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-02 09:31:44\";s:10:\"created_at\";s:19:\"2025-09-02 09:31:44\";s:2:\"id\";i:4;s:9:\"file_name\";s:19:\"export-4-sale-items\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:19:\"export-4-sale-items\";}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:9:{s:7:\"sale.id\";s:7:\"Sale ID\";s:14:\"sale.sale_date\";s:9:\"Sale Date\";s:18:\"sale.customer.name\";s:8:\"Customer\";s:14:\"sale.user.name\";s:7:\"Sold By\";s:12:\"product.name\";s:7:\"Product\";s:3:\"qty\";s:8:\"Quantity\";s:10:\"unit_price\";s:10:\"Unit Price\";s:8:\"subtotal\";s:8:\"Subtotal\";s:17:\"total_sale_amount\";s:17:\"Total Sale Amount\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:4;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:9:{s:7:\"sale.id\";s:7:\"Sale ID\";s:14:\"sale.sale_date\";s:9:\"Sale Date\";s:18:\"sale.customer.name\";s:8:\"Customer\";s:14:\"sale.user.name\";s:7:\"Sold By\";s:12:\"product.name\";s:7:\"Product\";s:3:\"qty\";s:8:\"Quantity\";s:10:\"unit_price\";s:10:\"Unit Price\";s:8:\"subtotal\";s:8:\"Subtotal\";s:17:\"total_sale_amount\";s:17:\"Total Sale Amount\";}s:10:\"\0*\0options\";a:0:{}}\";}s:19:\"chainCatchCallbacks\";a:0:{}}}s:8:\"function\";s:266:\"function (\\Illuminate\\Bus\\Batch $batch) use ($next) {\n                if (! $batch->cancelled()) {\n                    \\Illuminate\\Container\\Container::getInstance()->make(\\Illuminate\\Contracts\\Bus\\Dispatcher::class)->dispatch($next);\n                }\n            }\";s:5:\"scope\";s:27:\"Illuminate\\Bus\\ChainedBatch\";s:4:\"this\";N;s:4:\"self\";s:32:\"00000000000008e30000000000000000\";}\";s:4:\"hash\";s:44:\"9WFEsqBV3h68Wf0Rz+CHH709DlDEte8PMg0IPqwm5EA=\";}}}}', NULL, 1756780309, NULL),
('9fc73c85-3862-433b-938a-b0f5a6d22ca2', '', 3, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:6226:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:1:{s:4:\"next\";O:46:\"Filament\\Actions\\Exports\\Jobs\\ExportCompletion\":7:{s:11:\"\0*\0exporter\";O:37:\"App\\Filament\\Exports\\SaleItemExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:37:\"App\\Filament\\Exports\\SaleItemExporter\";s:10:\"total_rows\";i:168;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-02 09:37:06\";s:10:\"created_at\";s:19:\"2025-09-02 09:37:06\";s:2:\"id\";i:7;s:9:\"file_name\";s:19:\"export-7-sale-items\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:37:\"App\\Filament\\Exports\\SaleItemExporter\";s:10:\"total_rows\";i:168;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-02 09:37:06\";s:10:\"created_at\";s:19:\"2025-09-02 09:37:06\";s:2:\"id\";i:7;s:9:\"file_name\";s:19:\"export-7-sale-items\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:19:\"export-7-sale-items\";}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:9:{s:7:\"sale.id\";s:7:\"Sale ID\";s:14:\"sale.sale_date\";s:9:\"Sale Date\";s:18:\"sale.customer.name\";s:8:\"Customer\";s:14:\"sale.user.name\";s:7:\"Sold By\";s:12:\"product.name\";s:7:\"Product\";s:3:\"qty\";s:8:\"Quantity\";s:10:\"unit_price\";s:10:\"Unit Price\";s:8:\"subtotal\";s:8:\"Subtotal\";s:17:\"total_sale_amount\";s:17:\"Total Sale Amount\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:7;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:9:{s:7:\"sale.id\";s:7:\"Sale ID\";s:14:\"sale.sale_date\";s:9:\"Sale Date\";s:18:\"sale.customer.name\";s:8:\"Customer\";s:14:\"sale.user.name\";s:7:\"Sold By\";s:12:\"product.name\";s:7:\"Product\";s:3:\"qty\";s:8:\"Quantity\";s:10:\"unit_price\";s:10:\"Unit Price\";s:8:\"subtotal\";s:8:\"Subtotal\";s:17:\"total_sale_amount\";s:17:\"Total Sale Amount\";}s:10:\"\0*\0formats\";a:2:{i:0;E:47:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Csv\";i:1;E:48:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Xlsx\";}s:10:\"\0*\0options\";a:0:{}s:7:\"chained\";a:1:{i:0;s:2764:\"O:44:\"Filament\\Actions\\Exports\\Jobs\\CreateXlsxFile\":4:{s:11:\"\0*\0exporter\";O:37:\"App\\Filament\\Exports\\SaleItemExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:37:\"App\\Filament\\Exports\\SaleItemExporter\";s:10:\"total_rows\";i:168;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-02 09:37:06\";s:10:\"created_at\";s:19:\"2025-09-02 09:37:06\";s:2:\"id\";i:7;s:9:\"file_name\";s:19:\"export-7-sale-items\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:37:\"App\\Filament\\Exports\\SaleItemExporter\";s:10:\"total_rows\";i:168;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-02 09:37:06\";s:10:\"created_at\";s:19:\"2025-09-02 09:37:06\";s:2:\"id\";i:7;s:9:\"file_name\";s:19:\"export-7-sale-items\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:19:\"export-7-sale-items\";}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:9:{s:7:\"sale.id\";s:7:\"Sale ID\";s:14:\"sale.sale_date\";s:9:\"Sale Date\";s:18:\"sale.customer.name\";s:8:\"Customer\";s:14:\"sale.user.name\";s:7:\"Sold By\";s:12:\"product.name\";s:7:\"Product\";s:3:\"qty\";s:8:\"Quantity\";s:10:\"unit_price\";s:10:\"Unit Price\";s:8:\"subtotal\";s:8:\"Subtotal\";s:17:\"total_sale_amount\";s:17:\"Total Sale Amount\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:7;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:9:{s:7:\"sale.id\";s:7:\"Sale ID\";s:14:\"sale.sale_date\";s:9:\"Sale Date\";s:18:\"sale.customer.name\";s:8:\"Customer\";s:14:\"sale.user.name\";s:7:\"Sold By\";s:12:\"product.name\";s:7:\"Product\";s:3:\"qty\";s:8:\"Quantity\";s:10:\"unit_price\";s:10:\"Unit Price\";s:8:\"subtotal\";s:8:\"Subtotal\";s:17:\"total_sale_amount\";s:17:\"Total Sale Amount\";}s:10:\"\0*\0options\";a:0:{}}\";}s:19:\"chainCatchCallbacks\";a:0:{}}}s:8:\"function\";s:266:\"function (\\Illuminate\\Bus\\Batch $batch) use ($next) {\n                if (! $batch->cancelled()) {\n                    \\Illuminate\\Container\\Container::getInstance()->make(\\Illuminate\\Contracts\\Bus\\Dispatcher::class)->dispatch($next);\n                }\n            }\";s:5:\"scope\";s:27:\"Illuminate\\Bus\\ChainedBatch\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000e4d0000000000000000\";}\";s:4:\"hash\";s:44:\"BW2WKbpyBfRvLKBrBNB88rQzDbnlxCMzfV93aKwr4u0=\";}}}}', NULL, 1756780626, 1756780626),
('9fc73d11-968e-47f4-aed0-9295a214847a', '', 3, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:6226:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:1:{s:4:\"next\";O:46:\"Filament\\Actions\\Exports\\Jobs\\ExportCompletion\":7:{s:11:\"\0*\0exporter\";O:37:\"App\\Filament\\Exports\\SaleItemExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:37:\"App\\Filament\\Exports\\SaleItemExporter\";s:10:\"total_rows\";i:168;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-02 09:38:38\";s:10:\"created_at\";s:19:\"2025-09-02 09:38:38\";s:2:\"id\";i:8;s:9:\"file_name\";s:19:\"export-8-sale-items\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:37:\"App\\Filament\\Exports\\SaleItemExporter\";s:10:\"total_rows\";i:168;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-02 09:38:38\";s:10:\"created_at\";s:19:\"2025-09-02 09:38:38\";s:2:\"id\";i:8;s:9:\"file_name\";s:19:\"export-8-sale-items\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:19:\"export-8-sale-items\";}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:9:{s:7:\"sale.id\";s:7:\"Sale ID\";s:14:\"sale.sale_date\";s:9:\"Sale Date\";s:18:\"sale.customer.name\";s:8:\"Customer\";s:14:\"sale.user.name\";s:7:\"Sold By\";s:12:\"product.name\";s:7:\"Product\";s:3:\"qty\";s:8:\"Quantity\";s:10:\"unit_price\";s:10:\"Unit Price\";s:8:\"subtotal\";s:8:\"Subtotal\";s:17:\"total_sale_amount\";s:17:\"Total Sale Amount\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:8;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:9:{s:7:\"sale.id\";s:7:\"Sale ID\";s:14:\"sale.sale_date\";s:9:\"Sale Date\";s:18:\"sale.customer.name\";s:8:\"Customer\";s:14:\"sale.user.name\";s:7:\"Sold By\";s:12:\"product.name\";s:7:\"Product\";s:3:\"qty\";s:8:\"Quantity\";s:10:\"unit_price\";s:10:\"Unit Price\";s:8:\"subtotal\";s:8:\"Subtotal\";s:17:\"total_sale_amount\";s:17:\"Total Sale Amount\";}s:10:\"\0*\0formats\";a:2:{i:0;E:47:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Csv\";i:1;E:48:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Xlsx\";}s:10:\"\0*\0options\";a:0:{}s:7:\"chained\";a:1:{i:0;s:2764:\"O:44:\"Filament\\Actions\\Exports\\Jobs\\CreateXlsxFile\":4:{s:11:\"\0*\0exporter\";O:37:\"App\\Filament\\Exports\\SaleItemExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:37:\"App\\Filament\\Exports\\SaleItemExporter\";s:10:\"total_rows\";i:168;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-02 09:38:38\";s:10:\"created_at\";s:19:\"2025-09-02 09:38:38\";s:2:\"id\";i:8;s:9:\"file_name\";s:19:\"export-8-sale-items\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:37:\"App\\Filament\\Exports\\SaleItemExporter\";s:10:\"total_rows\";i:168;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-02 09:38:38\";s:10:\"created_at\";s:19:\"2025-09-02 09:38:38\";s:2:\"id\";i:8;s:9:\"file_name\";s:19:\"export-8-sale-items\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:19:\"export-8-sale-items\";}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:9:{s:7:\"sale.id\";s:7:\"Sale ID\";s:14:\"sale.sale_date\";s:9:\"Sale Date\";s:18:\"sale.customer.name\";s:8:\"Customer\";s:14:\"sale.user.name\";s:7:\"Sold By\";s:12:\"product.name\";s:7:\"Product\";s:3:\"qty\";s:8:\"Quantity\";s:10:\"unit_price\";s:10:\"Unit Price\";s:8:\"subtotal\";s:8:\"Subtotal\";s:17:\"total_sale_amount\";s:17:\"Total Sale Amount\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:8;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:9:{s:7:\"sale.id\";s:7:\"Sale ID\";s:14:\"sale.sale_date\";s:9:\"Sale Date\";s:18:\"sale.customer.name\";s:8:\"Customer\";s:14:\"sale.user.name\";s:7:\"Sold By\";s:12:\"product.name\";s:7:\"Product\";s:3:\"qty\";s:8:\"Quantity\";s:10:\"unit_price\";s:10:\"Unit Price\";s:8:\"subtotal\";s:8:\"Subtotal\";s:17:\"total_sale_amount\";s:17:\"Total Sale Amount\";}s:10:\"\0*\0options\";a:0:{}}\";}s:19:\"chainCatchCallbacks\";a:0:{}}}s:8:\"function\";s:266:\"function (\\Illuminate\\Bus\\Batch $batch) use ($next) {\n                if (! $batch->cancelled()) {\n                    \\Illuminate\\Container\\Container::getInstance()->make(\\Illuminate\\Contracts\\Bus\\Dispatcher::class)->dispatch($next);\n                }\n            }\";s:5:\"scope\";s:27:\"Illuminate\\Bus\\ChainedBatch\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000e4d0000000000000000\";}\";s:4:\"hash\";s:44:\"Z+l91x5Y8ePFi01xfz++PclHxA3t6qETyFzE16cqUZs=\";}}}}', NULL, 1756780718, 1756780718);
INSERT INTO `job_batches` (`id`, `name`, `total_jobs`, `pending_jobs`, `failed_jobs`, `failed_job_ids`, `options`, `cancelled_at`, `created_at`, `finished_at`) VALUES
('9fc7405c-0edd-428b-8a28-879f01d43357', '', 3, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:6226:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:1:{s:4:\"next\";O:46:\"Filament\\Actions\\Exports\\Jobs\\ExportCompletion\":7:{s:11:\"\0*\0exporter\";O:37:\"App\\Filament\\Exports\\SaleItemExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:37:\"App\\Filament\\Exports\\SaleItemExporter\";s:10:\"total_rows\";i:168;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-02 09:47:50\";s:10:\"created_at\";s:19:\"2025-09-02 09:47:50\";s:2:\"id\";i:9;s:9:\"file_name\";s:19:\"export-9-sale-items\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:37:\"App\\Filament\\Exports\\SaleItemExporter\";s:10:\"total_rows\";i:168;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-02 09:47:50\";s:10:\"created_at\";s:19:\"2025-09-02 09:47:50\";s:2:\"id\";i:9;s:9:\"file_name\";s:19:\"export-9-sale-items\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:19:\"export-9-sale-items\";}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:9:{s:7:\"sale.id\";s:7:\"Sale ID\";s:14:\"sale.sale_date\";s:9:\"Sale Date\";s:18:\"sale.customer.name\";s:8:\"Customer\";s:14:\"sale.user.name\";s:7:\"Sold By\";s:12:\"product.name\";s:7:\"Product\";s:3:\"qty\";s:8:\"Quantity\";s:10:\"unit_price\";s:10:\"Unit Price\";s:8:\"subtotal\";s:8:\"Subtotal\";s:17:\"total_sale_amount\";s:17:\"Total Sale Amount\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:9;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:9:{s:7:\"sale.id\";s:7:\"Sale ID\";s:14:\"sale.sale_date\";s:9:\"Sale Date\";s:18:\"sale.customer.name\";s:8:\"Customer\";s:14:\"sale.user.name\";s:7:\"Sold By\";s:12:\"product.name\";s:7:\"Product\";s:3:\"qty\";s:8:\"Quantity\";s:10:\"unit_price\";s:10:\"Unit Price\";s:8:\"subtotal\";s:8:\"Subtotal\";s:17:\"total_sale_amount\";s:17:\"Total Sale Amount\";}s:10:\"\0*\0formats\";a:2:{i:0;E:47:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Csv\";i:1;E:48:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Xlsx\";}s:10:\"\0*\0options\";a:0:{}s:7:\"chained\";a:1:{i:0;s:2764:\"O:44:\"Filament\\Actions\\Exports\\Jobs\\CreateXlsxFile\":4:{s:11:\"\0*\0exporter\";O:37:\"App\\Filament\\Exports\\SaleItemExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:37:\"App\\Filament\\Exports\\SaleItemExporter\";s:10:\"total_rows\";i:168;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-02 09:47:50\";s:10:\"created_at\";s:19:\"2025-09-02 09:47:50\";s:2:\"id\";i:9;s:9:\"file_name\";s:19:\"export-9-sale-items\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:37:\"App\\Filament\\Exports\\SaleItemExporter\";s:10:\"total_rows\";i:168;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-02 09:47:50\";s:10:\"created_at\";s:19:\"2025-09-02 09:47:50\";s:2:\"id\";i:9;s:9:\"file_name\";s:19:\"export-9-sale-items\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:19:\"export-9-sale-items\";}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:9:{s:7:\"sale.id\";s:7:\"Sale ID\";s:14:\"sale.sale_date\";s:9:\"Sale Date\";s:18:\"sale.customer.name\";s:8:\"Customer\";s:14:\"sale.user.name\";s:7:\"Sold By\";s:12:\"product.name\";s:7:\"Product\";s:3:\"qty\";s:8:\"Quantity\";s:10:\"unit_price\";s:10:\"Unit Price\";s:8:\"subtotal\";s:8:\"Subtotal\";s:17:\"total_sale_amount\";s:17:\"Total Sale Amount\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:9;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:9:{s:7:\"sale.id\";s:7:\"Sale ID\";s:14:\"sale.sale_date\";s:9:\"Sale Date\";s:18:\"sale.customer.name\";s:8:\"Customer\";s:14:\"sale.user.name\";s:7:\"Sold By\";s:12:\"product.name\";s:7:\"Product\";s:3:\"qty\";s:8:\"Quantity\";s:10:\"unit_price\";s:10:\"Unit Price\";s:8:\"subtotal\";s:8:\"Subtotal\";s:17:\"total_sale_amount\";s:17:\"Total Sale Amount\";}s:10:\"\0*\0options\";a:0:{}}\";}s:19:\"chainCatchCallbacks\";a:0:{}}}s:8:\"function\";s:266:\"function (\\Illuminate\\Bus\\Batch $batch) use ($next) {\n                if (! $batch->cancelled()) {\n                    \\Illuminate\\Container\\Container::getInstance()->make(\\Illuminate\\Contracts\\Bus\\Dispatcher::class)->dispatch($next);\n                }\n            }\";s:5:\"scope\";s:27:\"Illuminate\\Bus\\ChainedBatch\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000e500000000000000000\";}\";s:4:\"hash\";s:44:\"qnFa+S5o0KpDSL7S4H795ueUynW4yF0ne4fbCCy9TEk=\";}}}}', NULL, 1756781270, 1756781270),
('9fc74494-033d-441d-babd-e568fa7a6740', '', 3, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:6238:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:1:{s:4:\"next\";O:46:\"Filament\\Actions\\Exports\\Jobs\\ExportCompletion\":7:{s:11:\"\0*\0exporter\";O:37:\"App\\Filament\\Exports\\SaleItemExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:37:\"App\\Filament\\Exports\\SaleItemExporter\";s:10:\"total_rows\";i:168;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-02 09:59:38\";s:10:\"created_at\";s:19:\"2025-09-02 09:59:38\";s:2:\"id\";i:10;s:9:\"file_name\";s:20:\"export-10-sale-items\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:37:\"App\\Filament\\Exports\\SaleItemExporter\";s:10:\"total_rows\";i:168;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-02 09:59:38\";s:10:\"created_at\";s:19:\"2025-09-02 09:59:38\";s:2:\"id\";i:10;s:9:\"file_name\";s:20:\"export-10-sale-items\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:20:\"export-10-sale-items\";}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:9:{s:7:\"sale.id\";s:7:\"Sale ID\";s:14:\"sale.sale_date\";s:9:\"Sale Date\";s:18:\"sale.customer.name\";s:8:\"Customer\";s:14:\"sale.user.name\";s:7:\"Sold By\";s:12:\"product.name\";s:7:\"Product\";s:3:\"qty\";s:8:\"Quantity\";s:10:\"unit_price\";s:10:\"Unit Price\";s:8:\"subtotal\";s:8:\"Subtotal\";s:17:\"total_sale_amount\";s:17:\"Total Sale Amount\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:10;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:9:{s:7:\"sale.id\";s:7:\"Sale ID\";s:14:\"sale.sale_date\";s:9:\"Sale Date\";s:18:\"sale.customer.name\";s:8:\"Customer\";s:14:\"sale.user.name\";s:7:\"Sold By\";s:12:\"product.name\";s:7:\"Product\";s:3:\"qty\";s:8:\"Quantity\";s:10:\"unit_price\";s:10:\"Unit Price\";s:8:\"subtotal\";s:8:\"Subtotal\";s:17:\"total_sale_amount\";s:17:\"Total Sale Amount\";}s:10:\"\0*\0formats\";a:2:{i:0;E:47:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Csv\";i:1;E:48:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Xlsx\";}s:10:\"\0*\0options\";a:0:{}s:7:\"chained\";a:1:{i:0;s:2770:\"O:44:\"Filament\\Actions\\Exports\\Jobs\\CreateXlsxFile\":4:{s:11:\"\0*\0exporter\";O:37:\"App\\Filament\\Exports\\SaleItemExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:37:\"App\\Filament\\Exports\\SaleItemExporter\";s:10:\"total_rows\";i:168;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-02 09:59:38\";s:10:\"created_at\";s:19:\"2025-09-02 09:59:38\";s:2:\"id\";i:10;s:9:\"file_name\";s:20:\"export-10-sale-items\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:37:\"App\\Filament\\Exports\\SaleItemExporter\";s:10:\"total_rows\";i:168;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-02 09:59:38\";s:10:\"created_at\";s:19:\"2025-09-02 09:59:38\";s:2:\"id\";i:10;s:9:\"file_name\";s:20:\"export-10-sale-items\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:20:\"export-10-sale-items\";}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:9:{s:7:\"sale.id\";s:7:\"Sale ID\";s:14:\"sale.sale_date\";s:9:\"Sale Date\";s:18:\"sale.customer.name\";s:8:\"Customer\";s:14:\"sale.user.name\";s:7:\"Sold By\";s:12:\"product.name\";s:7:\"Product\";s:3:\"qty\";s:8:\"Quantity\";s:10:\"unit_price\";s:10:\"Unit Price\";s:8:\"subtotal\";s:8:\"Subtotal\";s:17:\"total_sale_amount\";s:17:\"Total Sale Amount\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:10;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:9:{s:7:\"sale.id\";s:7:\"Sale ID\";s:14:\"sale.sale_date\";s:9:\"Sale Date\";s:18:\"sale.customer.name\";s:8:\"Customer\";s:14:\"sale.user.name\";s:7:\"Sold By\";s:12:\"product.name\";s:7:\"Product\";s:3:\"qty\";s:8:\"Quantity\";s:10:\"unit_price\";s:10:\"Unit Price\";s:8:\"subtotal\";s:8:\"Subtotal\";s:17:\"total_sale_amount\";s:17:\"Total Sale Amount\";}s:10:\"\0*\0options\";a:0:{}}\";}s:19:\"chainCatchCallbacks\";a:0:{}}}s:8:\"function\";s:266:\"function (\\Illuminate\\Bus\\Batch $batch) use ($next) {\n                if (! $batch->cancelled()) {\n                    \\Illuminate\\Container\\Container::getInstance()->make(\\Illuminate\\Contracts\\Bus\\Dispatcher::class)->dispatch($next);\n                }\n            }\";s:5:\"scope\";s:27:\"Illuminate\\Bus\\ChainedBatch\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000e500000000000000000\";}\";s:4:\"hash\";s:44:\"Uh2vLbXc2d02K5lhbK8aNSs3V1WgmVNnO10zec5Kxvs=\";}}}}', NULL, 1756781978, 1756781978),
('9fc744d0-26dc-4d81-a062-9c1d5fa5e04a', '', 3, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:6238:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:1:{s:4:\"next\";O:46:\"Filament\\Actions\\Exports\\Jobs\\ExportCompletion\":7:{s:11:\"\0*\0exporter\";O:37:\"App\\Filament\\Exports\\SaleItemExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:37:\"App\\Filament\\Exports\\SaleItemExporter\";s:10:\"total_rows\";i:168;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-02 10:00:17\";s:10:\"created_at\";s:19:\"2025-09-02 10:00:17\";s:2:\"id\";i:11;s:9:\"file_name\";s:20:\"export-11-sale-items\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:37:\"App\\Filament\\Exports\\SaleItemExporter\";s:10:\"total_rows\";i:168;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-02 10:00:17\";s:10:\"created_at\";s:19:\"2025-09-02 10:00:17\";s:2:\"id\";i:11;s:9:\"file_name\";s:20:\"export-11-sale-items\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:20:\"export-11-sale-items\";}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:9:{s:7:\"sale.id\";s:7:\"Sale ID\";s:14:\"sale.sale_date\";s:9:\"Sale Date\";s:18:\"sale.customer.name\";s:8:\"Customer\";s:14:\"sale.user.name\";s:7:\"Sold By\";s:12:\"product.name\";s:7:\"Product\";s:3:\"qty\";s:8:\"Quantity\";s:10:\"unit_price\";s:10:\"Unit Price\";s:8:\"subtotal\";s:8:\"Subtotal\";s:17:\"total_sale_amount\";s:17:\"Total Sale Amount\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:11;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:9:{s:7:\"sale.id\";s:7:\"Sale ID\";s:14:\"sale.sale_date\";s:9:\"Sale Date\";s:18:\"sale.customer.name\";s:8:\"Customer\";s:14:\"sale.user.name\";s:7:\"Sold By\";s:12:\"product.name\";s:7:\"Product\";s:3:\"qty\";s:8:\"Quantity\";s:10:\"unit_price\";s:10:\"Unit Price\";s:8:\"subtotal\";s:8:\"Subtotal\";s:17:\"total_sale_amount\";s:17:\"Total Sale Amount\";}s:10:\"\0*\0formats\";a:2:{i:0;E:47:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Csv\";i:1;E:48:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Xlsx\";}s:10:\"\0*\0options\";a:0:{}s:7:\"chained\";a:1:{i:0;s:2770:\"O:44:\"Filament\\Actions\\Exports\\Jobs\\CreateXlsxFile\":4:{s:11:\"\0*\0exporter\";O:37:\"App\\Filament\\Exports\\SaleItemExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:37:\"App\\Filament\\Exports\\SaleItemExporter\";s:10:\"total_rows\";i:168;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-02 10:00:17\";s:10:\"created_at\";s:19:\"2025-09-02 10:00:17\";s:2:\"id\";i:11;s:9:\"file_name\";s:20:\"export-11-sale-items\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:37:\"App\\Filament\\Exports\\SaleItemExporter\";s:10:\"total_rows\";i:168;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-02 10:00:17\";s:10:\"created_at\";s:19:\"2025-09-02 10:00:17\";s:2:\"id\";i:11;s:9:\"file_name\";s:20:\"export-11-sale-items\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:20:\"export-11-sale-items\";}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:9:{s:7:\"sale.id\";s:7:\"Sale ID\";s:14:\"sale.sale_date\";s:9:\"Sale Date\";s:18:\"sale.customer.name\";s:8:\"Customer\";s:14:\"sale.user.name\";s:7:\"Sold By\";s:12:\"product.name\";s:7:\"Product\";s:3:\"qty\";s:8:\"Quantity\";s:10:\"unit_price\";s:10:\"Unit Price\";s:8:\"subtotal\";s:8:\"Subtotal\";s:17:\"total_sale_amount\";s:17:\"Total Sale Amount\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:11;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:9:{s:7:\"sale.id\";s:7:\"Sale ID\";s:14:\"sale.sale_date\";s:9:\"Sale Date\";s:18:\"sale.customer.name\";s:8:\"Customer\";s:14:\"sale.user.name\";s:7:\"Sold By\";s:12:\"product.name\";s:7:\"Product\";s:3:\"qty\";s:8:\"Quantity\";s:10:\"unit_price\";s:10:\"Unit Price\";s:8:\"subtotal\";s:8:\"Subtotal\";s:17:\"total_sale_amount\";s:17:\"Total Sale Amount\";}s:10:\"\0*\0options\";a:0:{}}\";}s:19:\"chainCatchCallbacks\";a:0:{}}}s:8:\"function\";s:266:\"function (\\Illuminate\\Bus\\Batch $batch) use ($next) {\n                if (! $batch->cancelled()) {\n                    \\Illuminate\\Container\\Container::getInstance()->make(\\Illuminate\\Contracts\\Bus\\Dispatcher::class)->dispatch($next);\n                }\n            }\";s:5:\"scope\";s:27:\"Illuminate\\Bus\\ChainedBatch\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000e500000000000000000\";}\";s:4:\"hash\";s:44:\"YvrxxI6txg65kDQgSELwFnBG+LFVNjvhvQKuGQG89ME=\";}}}}', NULL, 1756782018, 1756782018),
('9fc74534-0b5c-463d-9970-c7741f764a2d', '', 3, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:6238:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:1:{s:4:\"next\";O:46:\"Filament\\Actions\\Exports\\Jobs\\ExportCompletion\":7:{s:11:\"\0*\0exporter\";O:37:\"App\\Filament\\Exports\\SaleItemExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:37:\"App\\Filament\\Exports\\SaleItemExporter\";s:10:\"total_rows\";i:168;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-02 10:01:23\";s:10:\"created_at\";s:19:\"2025-09-02 10:01:23\";s:2:\"id\";i:12;s:9:\"file_name\";s:20:\"export-12-sale-items\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:37:\"App\\Filament\\Exports\\SaleItemExporter\";s:10:\"total_rows\";i:168;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-02 10:01:23\";s:10:\"created_at\";s:19:\"2025-09-02 10:01:23\";s:2:\"id\";i:12;s:9:\"file_name\";s:20:\"export-12-sale-items\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:20:\"export-12-sale-items\";}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:9:{s:7:\"sale.id\";s:7:\"Sale ID\";s:14:\"sale.sale_date\";s:9:\"Sale Date\";s:18:\"sale.customer.name\";s:8:\"Customer\";s:14:\"sale.user.name\";s:7:\"Sold By\";s:12:\"product.name\";s:7:\"Product\";s:3:\"qty\";s:8:\"Quantity\";s:10:\"unit_price\";s:10:\"Unit Price\";s:8:\"subtotal\";s:8:\"Subtotal\";s:17:\"total_sale_amount\";s:17:\"Total Sale Amount\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:12;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:9:{s:7:\"sale.id\";s:7:\"Sale ID\";s:14:\"sale.sale_date\";s:9:\"Sale Date\";s:18:\"sale.customer.name\";s:8:\"Customer\";s:14:\"sale.user.name\";s:7:\"Sold By\";s:12:\"product.name\";s:7:\"Product\";s:3:\"qty\";s:8:\"Quantity\";s:10:\"unit_price\";s:10:\"Unit Price\";s:8:\"subtotal\";s:8:\"Subtotal\";s:17:\"total_sale_amount\";s:17:\"Total Sale Amount\";}s:10:\"\0*\0formats\";a:2:{i:0;E:47:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Csv\";i:1;E:48:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Xlsx\";}s:10:\"\0*\0options\";a:0:{}s:7:\"chained\";a:1:{i:0;s:2770:\"O:44:\"Filament\\Actions\\Exports\\Jobs\\CreateXlsxFile\":4:{s:11:\"\0*\0exporter\";O:37:\"App\\Filament\\Exports\\SaleItemExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:37:\"App\\Filament\\Exports\\SaleItemExporter\";s:10:\"total_rows\";i:168;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-02 10:01:23\";s:10:\"created_at\";s:19:\"2025-09-02 10:01:23\";s:2:\"id\";i:12;s:9:\"file_name\";s:20:\"export-12-sale-items\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:37:\"App\\Filament\\Exports\\SaleItemExporter\";s:10:\"total_rows\";i:168;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-02 10:01:23\";s:10:\"created_at\";s:19:\"2025-09-02 10:01:23\";s:2:\"id\";i:12;s:9:\"file_name\";s:20:\"export-12-sale-items\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:20:\"export-12-sale-items\";}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:9:{s:7:\"sale.id\";s:7:\"Sale ID\";s:14:\"sale.sale_date\";s:9:\"Sale Date\";s:18:\"sale.customer.name\";s:8:\"Customer\";s:14:\"sale.user.name\";s:7:\"Sold By\";s:12:\"product.name\";s:7:\"Product\";s:3:\"qty\";s:8:\"Quantity\";s:10:\"unit_price\";s:10:\"Unit Price\";s:8:\"subtotal\";s:8:\"Subtotal\";s:17:\"total_sale_amount\";s:17:\"Total Sale Amount\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:12;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:9:{s:7:\"sale.id\";s:7:\"Sale ID\";s:14:\"sale.sale_date\";s:9:\"Sale Date\";s:18:\"sale.customer.name\";s:8:\"Customer\";s:14:\"sale.user.name\";s:7:\"Sold By\";s:12:\"product.name\";s:7:\"Product\";s:3:\"qty\";s:8:\"Quantity\";s:10:\"unit_price\";s:10:\"Unit Price\";s:8:\"subtotal\";s:8:\"Subtotal\";s:17:\"total_sale_amount\";s:17:\"Total Sale Amount\";}s:10:\"\0*\0options\";a:0:{}}\";}s:19:\"chainCatchCallbacks\";a:0:{}}}s:8:\"function\";s:266:\"function (\\Illuminate\\Bus\\Batch $batch) use ($next) {\n                if (! $batch->cancelled()) {\n                    \\Illuminate\\Container\\Container::getInstance()->make(\\Illuminate\\Contracts\\Bus\\Dispatcher::class)->dispatch($next);\n                }\n            }\";s:5:\"scope\";s:27:\"Illuminate\\Bus\\ChainedBatch\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000e500000000000000000\";}\";s:4:\"hash\";s:44:\"XZChL5x0sfpYDM/PhqlVmsPXMr5kT76JFkw56gevwI4=\";}}}}', NULL, 1756782083, 1756782083),
('9fc7651b-08c9-437d-8b7b-6fd1356d4ec7', '', 2, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:5801:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:1:{s:4:\"next\";O:44:\"Filament\\Actions\\Exports\\Jobs\\CreateXlsxFile\":6:{s:11:\"\0*\0exporter\";O:33:\"App\\Filament\\Exports\\SaleExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:33:\"App\\Filament\\Exports\\SaleExporter\";s:10:\"total_rows\";i:5;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-02 11:30:35\";s:10:\"created_at\";s:19:\"2025-09-02 11:30:35\";s:2:\"id\";i:13;s:9:\"file_name\";s:15:\"export-13-sales\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:33:\"App\\Filament\\Exports\\SaleExporter\";s:10:\"total_rows\";i:5;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-02 11:30:35\";s:10:\"created_at\";s:19:\"2025-09-02 11:30:35\";s:2:\"id\";i:13;s:9:\"file_name\";s:15:\"export-13-sales\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:15:\"export-13-sales\";}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:7:{s:2:\"id\";s:10:\"Invoice No\";s:13:\"customer.name\";s:13:\"Customer Name\";s:9:\"sale_date\";s:9:\"Sale Date\";s:8:\"products\";s:8:\"Products\";s:9:\"total_qty\";s:14:\"Total Quantity\";s:12:\"total_amount\";s:12:\"Total Amount\";s:9:\"user.name\";s:7:\"Cashier\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:13;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:7:{s:2:\"id\";s:10:\"Invoice No\";s:13:\"customer.name\";s:13:\"Customer Name\";s:9:\"sale_date\";s:9:\"Sale Date\";s:8:\"products\";s:8:\"Products\";s:9:\"total_qty\";s:14:\"Total Quantity\";s:12:\"total_amount\";s:12:\"Total Amount\";s:9:\"user.name\";s:7:\"Cashier\";}s:10:\"\0*\0options\";a:0:{}s:7:\"chained\";a:1:{i:0;s:2667:\"O:46:\"Filament\\Actions\\Exports\\Jobs\\ExportCompletion\":5:{s:11:\"\0*\0exporter\";O:33:\"App\\Filament\\Exports\\SaleExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:33:\"App\\Filament\\Exports\\SaleExporter\";s:10:\"total_rows\";i:5;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-02 11:30:35\";s:10:\"created_at\";s:19:\"2025-09-02 11:30:35\";s:2:\"id\";i:13;s:9:\"file_name\";s:15:\"export-13-sales\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:33:\"App\\Filament\\Exports\\SaleExporter\";s:10:\"total_rows\";i:5;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-02 11:30:35\";s:10:\"created_at\";s:19:\"2025-09-02 11:30:35\";s:2:\"id\";i:13;s:9:\"file_name\";s:15:\"export-13-sales\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:15:\"export-13-sales\";}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:7:{s:2:\"id\";s:10:\"Invoice No\";s:13:\"customer.name\";s:13:\"Customer Name\";s:9:\"sale_date\";s:9:\"Sale Date\";s:8:\"products\";s:8:\"Products\";s:9:\"total_qty\";s:14:\"Total Quantity\";s:12:\"total_amount\";s:12:\"Total Amount\";s:9:\"user.name\";s:7:\"Cashier\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:13;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:7:{s:2:\"id\";s:10:\"Invoice No\";s:13:\"customer.name\";s:13:\"Customer Name\";s:9:\"sale_date\";s:9:\"Sale Date\";s:8:\"products\";s:8:\"Products\";s:9:\"total_qty\";s:14:\"Total Quantity\";s:12:\"total_amount\";s:12:\"Total Amount\";s:9:\"user.name\";s:7:\"Cashier\";}s:10:\"\0*\0formats\";a:1:{i:0;E:48:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Xlsx\";}s:10:\"\0*\0options\";a:0:{}}\";}s:19:\"chainCatchCallbacks\";a:0:{}}}s:8:\"function\";s:266:\"function (\\Illuminate\\Bus\\Batch $batch) use ($next) {\n                if (! $batch->cancelled()) {\n                    \\Illuminate\\Container\\Container::getInstance()->make(\\Illuminate\\Contracts\\Bus\\Dispatcher::class)->dispatch($next);\n                }\n            }\";s:5:\"scope\";s:27:\"Illuminate\\Bus\\ChainedBatch\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000d2d0000000000000000\";}\";s:4:\"hash\";s:44:\"0UO3dfC3sflwZX42CdJV6cjC9O3szQ6n5OwGqDWQpEE=\";}}}}', NULL, 1756787435, 1756787435),
('9fc77da4-a42d-49be-bd22-6038712dfb4f', '', 2, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:5805:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:1:{s:4:\"next\";O:44:\"Filament\\Actions\\Exports\\Jobs\\CreateXlsxFile\":6:{s:11:\"\0*\0exporter\";O:33:\"App\\Filament\\Exports\\SaleExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:3;s:8:\"exporter\";s:33:\"App\\Filament\\Exports\\SaleExporter\";s:10:\"total_rows\";i:20;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-02 12:39:10\";s:10:\"created_at\";s:19:\"2025-09-02 12:39:10\";s:2:\"id\";i:14;s:9:\"file_name\";s:15:\"export-14-sales\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:3;s:8:\"exporter\";s:33:\"App\\Filament\\Exports\\SaleExporter\";s:10:\"total_rows\";i:20;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-02 12:39:10\";s:10:\"created_at\";s:19:\"2025-09-02 12:39:10\";s:2:\"id\";i:14;s:9:\"file_name\";s:15:\"export-14-sales\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:15:\"export-14-sales\";}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:7:{s:2:\"id\";s:10:\"Invoice No\";s:13:\"customer.name\";s:13:\"Customer Name\";s:9:\"sale_date\";s:9:\"Sale Date\";s:8:\"products\";s:8:\"Products\";s:9:\"total_qty\";s:14:\"Total Quantity\";s:12:\"total_amount\";s:12:\"Total Amount\";s:9:\"user.name\";s:7:\"Cashier\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:14;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:7:{s:2:\"id\";s:10:\"Invoice No\";s:13:\"customer.name\";s:13:\"Customer Name\";s:9:\"sale_date\";s:9:\"Sale Date\";s:8:\"products\";s:8:\"Products\";s:9:\"total_qty\";s:14:\"Total Quantity\";s:12:\"total_amount\";s:12:\"Total Amount\";s:9:\"user.name\";s:7:\"Cashier\";}s:10:\"\0*\0options\";a:0:{}s:7:\"chained\";a:1:{i:0;s:2669:\"O:46:\"Filament\\Actions\\Exports\\Jobs\\ExportCompletion\":5:{s:11:\"\0*\0exporter\";O:33:\"App\\Filament\\Exports\\SaleExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:3;s:8:\"exporter\";s:33:\"App\\Filament\\Exports\\SaleExporter\";s:10:\"total_rows\";i:20;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-02 12:39:10\";s:10:\"created_at\";s:19:\"2025-09-02 12:39:10\";s:2:\"id\";i:14;s:9:\"file_name\";s:15:\"export-14-sales\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:3;s:8:\"exporter\";s:33:\"App\\Filament\\Exports\\SaleExporter\";s:10:\"total_rows\";i:20;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-02 12:39:10\";s:10:\"created_at\";s:19:\"2025-09-02 12:39:10\";s:2:\"id\";i:14;s:9:\"file_name\";s:15:\"export-14-sales\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:15:\"export-14-sales\";}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:7:{s:2:\"id\";s:10:\"Invoice No\";s:13:\"customer.name\";s:13:\"Customer Name\";s:9:\"sale_date\";s:9:\"Sale Date\";s:8:\"products\";s:8:\"Products\";s:9:\"total_qty\";s:14:\"Total Quantity\";s:12:\"total_amount\";s:12:\"Total Amount\";s:9:\"user.name\";s:7:\"Cashier\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:14;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:7:{s:2:\"id\";s:10:\"Invoice No\";s:13:\"customer.name\";s:13:\"Customer Name\";s:9:\"sale_date\";s:9:\"Sale Date\";s:8:\"products\";s:8:\"Products\";s:9:\"total_qty\";s:14:\"Total Quantity\";s:12:\"total_amount\";s:12:\"Total Amount\";s:9:\"user.name\";s:7:\"Cashier\";}s:10:\"\0*\0formats\";a:1:{i:0;E:48:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Xlsx\";}s:10:\"\0*\0options\";a:0:{}}\";}s:19:\"chainCatchCallbacks\";a:0:{}}}s:8:\"function\";s:266:\"function (\\Illuminate\\Bus\\Batch $batch) use ($next) {\n                if (! $batch->cancelled()) {\n                    \\Illuminate\\Container\\Container::getInstance()->make(\\Illuminate\\Contracts\\Bus\\Dispatcher::class)->dispatch($next);\n                }\n            }\";s:5:\"scope\";s:27:\"Illuminate\\Bus\\ChainedBatch\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000d310000000000000000\";}\";s:4:\"hash\";s:44:\"iLuxRCJeoautEM7QVPSu1I1sI8vsoKFYlkWUajP7hW8=\";}}}}', NULL, 1756791552, 1756791553);
INSERT INTO `job_batches` (`id`, `name`, `total_jobs`, `pending_jobs`, `failed_jobs`, `failed_job_ids`, `options`, `cancelled_at`, `created_at`, `finished_at`) VALUES
('9fc77db8-6a86-4cee-b5cc-075941713aea', '', 2, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:5805:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:1:{s:4:\"next\";O:44:\"Filament\\Actions\\Exports\\Jobs\\CreateXlsxFile\":6:{s:11:\"\0*\0exporter\";O:33:\"App\\Filament\\Exports\\SaleExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:3;s:8:\"exporter\";s:33:\"App\\Filament\\Exports\\SaleExporter\";s:10:\"total_rows\";i:10;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-02 12:39:25\";s:10:\"created_at\";s:19:\"2025-09-02 12:39:25\";s:2:\"id\";i:15;s:9:\"file_name\";s:15:\"export-15-sales\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:3;s:8:\"exporter\";s:33:\"App\\Filament\\Exports\\SaleExporter\";s:10:\"total_rows\";i:10;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-02 12:39:25\";s:10:\"created_at\";s:19:\"2025-09-02 12:39:25\";s:2:\"id\";i:15;s:9:\"file_name\";s:15:\"export-15-sales\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:15:\"export-15-sales\";}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:7:{s:2:\"id\";s:10:\"Invoice No\";s:13:\"customer.name\";s:13:\"Customer Name\";s:9:\"sale_date\";s:9:\"Sale Date\";s:8:\"products\";s:8:\"Products\";s:9:\"total_qty\";s:14:\"Total Quantity\";s:12:\"total_amount\";s:12:\"Total Amount\";s:9:\"user.name\";s:7:\"Cashier\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:15;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:7:{s:2:\"id\";s:10:\"Invoice No\";s:13:\"customer.name\";s:13:\"Customer Name\";s:9:\"sale_date\";s:9:\"Sale Date\";s:8:\"products\";s:8:\"Products\";s:9:\"total_qty\";s:14:\"Total Quantity\";s:12:\"total_amount\";s:12:\"Total Amount\";s:9:\"user.name\";s:7:\"Cashier\";}s:10:\"\0*\0options\";a:0:{}s:7:\"chained\";a:1:{i:0;s:2669:\"O:46:\"Filament\\Actions\\Exports\\Jobs\\ExportCompletion\":5:{s:11:\"\0*\0exporter\";O:33:\"App\\Filament\\Exports\\SaleExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:3;s:8:\"exporter\";s:33:\"App\\Filament\\Exports\\SaleExporter\";s:10:\"total_rows\";i:10;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-02 12:39:25\";s:10:\"created_at\";s:19:\"2025-09-02 12:39:25\";s:2:\"id\";i:15;s:9:\"file_name\";s:15:\"export-15-sales\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:3;s:8:\"exporter\";s:33:\"App\\Filament\\Exports\\SaleExporter\";s:10:\"total_rows\";i:10;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-02 12:39:25\";s:10:\"created_at\";s:19:\"2025-09-02 12:39:25\";s:2:\"id\";i:15;s:9:\"file_name\";s:15:\"export-15-sales\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:15:\"export-15-sales\";}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:7:{s:2:\"id\";s:10:\"Invoice No\";s:13:\"customer.name\";s:13:\"Customer Name\";s:9:\"sale_date\";s:9:\"Sale Date\";s:8:\"products\";s:8:\"Products\";s:9:\"total_qty\";s:14:\"Total Quantity\";s:12:\"total_amount\";s:12:\"Total Amount\";s:9:\"user.name\";s:7:\"Cashier\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:15;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:7:{s:2:\"id\";s:10:\"Invoice No\";s:13:\"customer.name\";s:13:\"Customer Name\";s:9:\"sale_date\";s:9:\"Sale Date\";s:8:\"products\";s:8:\"Products\";s:9:\"total_qty\";s:14:\"Total Quantity\";s:12:\"total_amount\";s:12:\"Total Amount\";s:9:\"user.name\";s:7:\"Cashier\";}s:10:\"\0*\0formats\";a:1:{i:0;E:48:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Xlsx\";}s:10:\"\0*\0options\";a:0:{}}\";}s:19:\"chainCatchCallbacks\";a:0:{}}}s:8:\"function\";s:266:\"function (\\Illuminate\\Bus\\Batch $batch) use ($next) {\n                if (! $batch->cancelled()) {\n                    \\Illuminate\\Container\\Container::getInstance()->make(\\Illuminate\\Contracts\\Bus\\Dispatcher::class)->dispatch($next);\n                }\n            }\";s:5:\"scope\";s:27:\"Illuminate\\Bus\\ChainedBatch\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000d310000000000000000\";}\";s:4:\"hash\";s:44:\"xaahO7nh4pOv+O7kWomRxrdiVfjNB5v+u/OOS/5tQao=\";}}}}', NULL, 1756791565, 1756791565),
('9fc77de9-fd37-4a19-a80f-9a56ea02d898', '', 2, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:5805:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:1:{s:4:\"next\";O:44:\"Filament\\Actions\\Exports\\Jobs\\CreateXlsxFile\":6:{s:11:\"\0*\0exporter\";O:33:\"App\\Filament\\Exports\\SaleExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:3;s:8:\"exporter\";s:33:\"App\\Filament\\Exports\\SaleExporter\";s:10:\"total_rows\";i:10;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-02 12:39:57\";s:10:\"created_at\";s:19:\"2025-09-02 12:39:57\";s:2:\"id\";i:16;s:9:\"file_name\";s:15:\"export-16-sales\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:3;s:8:\"exporter\";s:33:\"App\\Filament\\Exports\\SaleExporter\";s:10:\"total_rows\";i:10;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-02 12:39:57\";s:10:\"created_at\";s:19:\"2025-09-02 12:39:57\";s:2:\"id\";i:16;s:9:\"file_name\";s:15:\"export-16-sales\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:15:\"export-16-sales\";}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:7:{s:2:\"id\";s:10:\"Invoice No\";s:13:\"customer.name\";s:13:\"Customer Name\";s:9:\"sale_date\";s:9:\"Sale Date\";s:8:\"products\";s:8:\"Products\";s:9:\"total_qty\";s:14:\"Total Quantity\";s:12:\"total_amount\";s:12:\"Total Amount\";s:9:\"user.name\";s:7:\"Cashier\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:16;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:7:{s:2:\"id\";s:10:\"Invoice No\";s:13:\"customer.name\";s:13:\"Customer Name\";s:9:\"sale_date\";s:9:\"Sale Date\";s:8:\"products\";s:8:\"Products\";s:9:\"total_qty\";s:14:\"Total Quantity\";s:12:\"total_amount\";s:12:\"Total Amount\";s:9:\"user.name\";s:7:\"Cashier\";}s:10:\"\0*\0options\";a:0:{}s:7:\"chained\";a:1:{i:0;s:2669:\"O:46:\"Filament\\Actions\\Exports\\Jobs\\ExportCompletion\":5:{s:11:\"\0*\0exporter\";O:33:\"App\\Filament\\Exports\\SaleExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:3;s:8:\"exporter\";s:33:\"App\\Filament\\Exports\\SaleExporter\";s:10:\"total_rows\";i:10;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-02 12:39:57\";s:10:\"created_at\";s:19:\"2025-09-02 12:39:57\";s:2:\"id\";i:16;s:9:\"file_name\";s:15:\"export-16-sales\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:3;s:8:\"exporter\";s:33:\"App\\Filament\\Exports\\SaleExporter\";s:10:\"total_rows\";i:10;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-02 12:39:57\";s:10:\"created_at\";s:19:\"2025-09-02 12:39:57\";s:2:\"id\";i:16;s:9:\"file_name\";s:15:\"export-16-sales\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:15:\"export-16-sales\";}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:7:{s:2:\"id\";s:10:\"Invoice No\";s:13:\"customer.name\";s:13:\"Customer Name\";s:9:\"sale_date\";s:9:\"Sale Date\";s:8:\"products\";s:8:\"Products\";s:9:\"total_qty\";s:14:\"Total Quantity\";s:12:\"total_amount\";s:12:\"Total Amount\";s:9:\"user.name\";s:7:\"Cashier\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:16;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:7:{s:2:\"id\";s:10:\"Invoice No\";s:13:\"customer.name\";s:13:\"Customer Name\";s:9:\"sale_date\";s:9:\"Sale Date\";s:8:\"products\";s:8:\"Products\";s:9:\"total_qty\";s:14:\"Total Quantity\";s:12:\"total_amount\";s:12:\"Total Amount\";s:9:\"user.name\";s:7:\"Cashier\";}s:10:\"\0*\0formats\";a:1:{i:0;E:48:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Xlsx\";}s:10:\"\0*\0options\";a:0:{}}\";}s:19:\"chainCatchCallbacks\";a:0:{}}}s:8:\"function\";s:266:\"function (\\Illuminate\\Bus\\Batch $batch) use ($next) {\n                if (! $batch->cancelled()) {\n                    \\Illuminate\\Container\\Container::getInstance()->make(\\Illuminate\\Contracts\\Bus\\Dispatcher::class)->dispatch($next);\n                }\n            }\";s:5:\"scope\";s:27:\"Illuminate\\Bus\\ChainedBatch\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000d310000000000000000\";}\";s:4:\"hash\";s:44:\"6DREFZPjZ0tp/mdVT999IHR2UslPwafkyIdjoy/mV88=\";}}}}', NULL, 1756791597, 1756791597),
('9fc7a1ae-a0e5-4313-b71a-643c05f6b265', '', 3, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:6238:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:1:{s:4:\"next\";O:46:\"Filament\\Actions\\Exports\\Jobs\\ExportCompletion\":7:{s:11:\"\0*\0exporter\";O:37:\"App\\Filament\\Exports\\SaleItemExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:37:\"App\\Filament\\Exports\\SaleItemExporter\";s:10:\"total_rows\";i:170;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-02 14:19:57\";s:10:\"created_at\";s:19:\"2025-09-02 14:19:57\";s:2:\"id\";i:17;s:9:\"file_name\";s:20:\"export-17-sale-items\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:37:\"App\\Filament\\Exports\\SaleItemExporter\";s:10:\"total_rows\";i:170;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-02 14:19:57\";s:10:\"created_at\";s:19:\"2025-09-02 14:19:57\";s:2:\"id\";i:17;s:9:\"file_name\";s:20:\"export-17-sale-items\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:20:\"export-17-sale-items\";}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:9:{s:7:\"sale.id\";s:7:\"Sale ID\";s:14:\"sale.sale_date\";s:9:\"Sale Date\";s:18:\"sale.customer.name\";s:8:\"Customer\";s:14:\"sale.user.name\";s:7:\"Sold By\";s:12:\"product.name\";s:7:\"Product\";s:3:\"qty\";s:8:\"Quantity\";s:10:\"unit_price\";s:10:\"Unit Price\";s:8:\"subtotal\";s:8:\"Subtotal\";s:17:\"total_sale_amount\";s:17:\"Total Sale Amount\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:17;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:9:{s:7:\"sale.id\";s:7:\"Sale ID\";s:14:\"sale.sale_date\";s:9:\"Sale Date\";s:18:\"sale.customer.name\";s:8:\"Customer\";s:14:\"sale.user.name\";s:7:\"Sold By\";s:12:\"product.name\";s:7:\"Product\";s:3:\"qty\";s:8:\"Quantity\";s:10:\"unit_price\";s:10:\"Unit Price\";s:8:\"subtotal\";s:8:\"Subtotal\";s:17:\"total_sale_amount\";s:17:\"Total Sale Amount\";}s:10:\"\0*\0formats\";a:2:{i:0;E:47:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Csv\";i:1;E:48:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Xlsx\";}s:10:\"\0*\0options\";a:0:{}s:7:\"chained\";a:1:{i:0;s:2770:\"O:44:\"Filament\\Actions\\Exports\\Jobs\\CreateXlsxFile\":4:{s:11:\"\0*\0exporter\";O:37:\"App\\Filament\\Exports\\SaleItemExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:37:\"App\\Filament\\Exports\\SaleItemExporter\";s:10:\"total_rows\";i:170;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-02 14:19:57\";s:10:\"created_at\";s:19:\"2025-09-02 14:19:57\";s:2:\"id\";i:17;s:9:\"file_name\";s:20:\"export-17-sale-items\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:37:\"App\\Filament\\Exports\\SaleItemExporter\";s:10:\"total_rows\";i:170;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-02 14:19:57\";s:10:\"created_at\";s:19:\"2025-09-02 14:19:57\";s:2:\"id\";i:17;s:9:\"file_name\";s:20:\"export-17-sale-items\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:20:\"export-17-sale-items\";}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:9:{s:7:\"sale.id\";s:7:\"Sale ID\";s:14:\"sale.sale_date\";s:9:\"Sale Date\";s:18:\"sale.customer.name\";s:8:\"Customer\";s:14:\"sale.user.name\";s:7:\"Sold By\";s:12:\"product.name\";s:7:\"Product\";s:3:\"qty\";s:8:\"Quantity\";s:10:\"unit_price\";s:10:\"Unit Price\";s:8:\"subtotal\";s:8:\"Subtotal\";s:17:\"total_sale_amount\";s:17:\"Total Sale Amount\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:17;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:9:{s:7:\"sale.id\";s:7:\"Sale ID\";s:14:\"sale.sale_date\";s:9:\"Sale Date\";s:18:\"sale.customer.name\";s:8:\"Customer\";s:14:\"sale.user.name\";s:7:\"Sold By\";s:12:\"product.name\";s:7:\"Product\";s:3:\"qty\";s:8:\"Quantity\";s:10:\"unit_price\";s:10:\"Unit Price\";s:8:\"subtotal\";s:8:\"Subtotal\";s:17:\"total_sale_amount\";s:17:\"Total Sale Amount\";}s:10:\"\0*\0options\";a:0:{}}\";}s:19:\"chainCatchCallbacks\";a:0:{}}}s:8:\"function\";s:266:\"function (\\Illuminate\\Bus\\Batch $batch) use ($next) {\n                if (! $batch->cancelled()) {\n                    \\Illuminate\\Container\\Container::getInstance()->make(\\Illuminate\\Contracts\\Bus\\Dispatcher::class)->dispatch($next);\n                }\n            }\";s:5:\"scope\";s:27:\"Illuminate\\Bus\\ChainedBatch\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000e350000000000000000\";}\";s:4:\"hash\";s:44:\"g3pUI58VjoZhd+FXgYz/Y8Bn3Mz/4072lVUmTC1uJuk=\";}}}}', NULL, 1756797599, 1756797599),
('9fc7b387-7bbe-445a-92f4-f21b0f5615fe', '', 2, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:5801:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:1:{s:4:\"next\";O:44:\"Filament\\Actions\\Exports\\Jobs\\CreateXlsxFile\":6:{s:11:\"\0*\0exporter\";O:33:\"App\\Filament\\Exports\\SaleExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:3;s:8:\"exporter\";s:33:\"App\\Filament\\Exports\\SaleExporter\";s:10:\"total_rows\";i:4;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-02 15:09:52\";s:10:\"created_at\";s:19:\"2025-09-02 15:09:52\";s:2:\"id\";i:18;s:9:\"file_name\";s:15:\"export-18-sales\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:3;s:8:\"exporter\";s:33:\"App\\Filament\\Exports\\SaleExporter\";s:10:\"total_rows\";i:4;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-02 15:09:52\";s:10:\"created_at\";s:19:\"2025-09-02 15:09:52\";s:2:\"id\";i:18;s:9:\"file_name\";s:15:\"export-18-sales\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:15:\"export-18-sales\";}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:7:{s:2:\"id\";s:10:\"Invoice No\";s:13:\"customer.name\";s:13:\"Customer Name\";s:9:\"sale_date\";s:9:\"Sale Date\";s:8:\"products\";s:8:\"Products\";s:9:\"total_qty\";s:14:\"Total Quantity\";s:12:\"total_amount\";s:12:\"Total Amount\";s:9:\"user.name\";s:7:\"Cashier\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:18;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:7:{s:2:\"id\";s:10:\"Invoice No\";s:13:\"customer.name\";s:13:\"Customer Name\";s:9:\"sale_date\";s:9:\"Sale Date\";s:8:\"products\";s:8:\"Products\";s:9:\"total_qty\";s:14:\"Total Quantity\";s:12:\"total_amount\";s:12:\"Total Amount\";s:9:\"user.name\";s:7:\"Cashier\";}s:10:\"\0*\0options\";a:0:{}s:7:\"chained\";a:1:{i:0;s:2667:\"O:46:\"Filament\\Actions\\Exports\\Jobs\\ExportCompletion\":5:{s:11:\"\0*\0exporter\";O:33:\"App\\Filament\\Exports\\SaleExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:3;s:8:\"exporter\";s:33:\"App\\Filament\\Exports\\SaleExporter\";s:10:\"total_rows\";i:4;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-02 15:09:52\";s:10:\"created_at\";s:19:\"2025-09-02 15:09:52\";s:2:\"id\";i:18;s:9:\"file_name\";s:15:\"export-18-sales\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:3;s:8:\"exporter\";s:33:\"App\\Filament\\Exports\\SaleExporter\";s:10:\"total_rows\";i:4;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-02 15:09:52\";s:10:\"created_at\";s:19:\"2025-09-02 15:09:52\";s:2:\"id\";i:18;s:9:\"file_name\";s:15:\"export-18-sales\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:15:\"export-18-sales\";}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:7:{s:2:\"id\";s:10:\"Invoice No\";s:13:\"customer.name\";s:13:\"Customer Name\";s:9:\"sale_date\";s:9:\"Sale Date\";s:8:\"products\";s:8:\"Products\";s:9:\"total_qty\";s:14:\"Total Quantity\";s:12:\"total_amount\";s:12:\"Total Amount\";s:9:\"user.name\";s:7:\"Cashier\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:18;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:7:{s:2:\"id\";s:10:\"Invoice No\";s:13:\"customer.name\";s:13:\"Customer Name\";s:9:\"sale_date\";s:9:\"Sale Date\";s:8:\"products\";s:8:\"Products\";s:9:\"total_qty\";s:14:\"Total Quantity\";s:12:\"total_amount\";s:12:\"Total Amount\";s:9:\"user.name\";s:7:\"Cashier\";}s:10:\"\0*\0formats\";a:1:{i:0;E:48:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Xlsx\";}s:10:\"\0*\0options\";a:0:{}}\";}s:19:\"chainCatchCallbacks\";a:0:{}}}s:8:\"function\";s:266:\"function (\\Illuminate\\Bus\\Batch $batch) use ($next) {\n                if (! $batch->cancelled()) {\n                    \\Illuminate\\Container\\Container::getInstance()->make(\\Illuminate\\Contracts\\Bus\\Dispatcher::class)->dispatch($next);\n                }\n            }\";s:5:\"scope\";s:27:\"Illuminate\\Bus\\ChainedBatch\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000d310000000000000000\";}\";s:4:\"hash\";s:44:\"4KgVkzvXTFx43wbwr88pPdIClDWpuc605MoTwUU41WE=\";}}}}', NULL, 1756800593, 1756800593),
('9fcd65e0-3eff-4239-949f-7120ae6568bf', '', 2, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:5801:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:1:{s:4:\"next\";O:44:\"Filament\\Actions\\Exports\\Jobs\\CreateXlsxFile\":6:{s:11:\"\0*\0exporter\";O:33:\"App\\Filament\\Exports\\SaleExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:3;s:8:\"exporter\";s:33:\"App\\Filament\\Exports\\SaleExporter\";s:10:\"total_rows\";i:7;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-05 11:07:42\";s:10:\"created_at\";s:19:\"2025-09-05 11:07:42\";s:2:\"id\";i:19;s:9:\"file_name\";s:15:\"export-19-sales\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:3;s:8:\"exporter\";s:33:\"App\\Filament\\Exports\\SaleExporter\";s:10:\"total_rows\";i:7;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-05 11:07:42\";s:10:\"created_at\";s:19:\"2025-09-05 11:07:42\";s:2:\"id\";i:19;s:9:\"file_name\";s:15:\"export-19-sales\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:15:\"export-19-sales\";}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:7:{s:2:\"id\";s:10:\"Invoice No\";s:13:\"customer.name\";s:13:\"Customer Name\";s:9:\"sale_date\";s:9:\"Sale Date\";s:8:\"products\";s:8:\"Products\";s:9:\"total_qty\";s:14:\"Total Quantity\";s:12:\"total_amount\";s:12:\"Total Amount\";s:9:\"user.name\";s:7:\"Cashier\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:19;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:7:{s:2:\"id\";s:10:\"Invoice No\";s:13:\"customer.name\";s:13:\"Customer Name\";s:9:\"sale_date\";s:9:\"Sale Date\";s:8:\"products\";s:8:\"Products\";s:9:\"total_qty\";s:14:\"Total Quantity\";s:12:\"total_amount\";s:12:\"Total Amount\";s:9:\"user.name\";s:7:\"Cashier\";}s:10:\"\0*\0options\";a:0:{}s:7:\"chained\";a:1:{i:0;s:2667:\"O:46:\"Filament\\Actions\\Exports\\Jobs\\ExportCompletion\":5:{s:11:\"\0*\0exporter\";O:33:\"App\\Filament\\Exports\\SaleExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:3;s:8:\"exporter\";s:33:\"App\\Filament\\Exports\\SaleExporter\";s:10:\"total_rows\";i:7;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-05 11:07:42\";s:10:\"created_at\";s:19:\"2025-09-05 11:07:42\";s:2:\"id\";i:19;s:9:\"file_name\";s:15:\"export-19-sales\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:3;s:8:\"exporter\";s:33:\"App\\Filament\\Exports\\SaleExporter\";s:10:\"total_rows\";i:7;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-05 11:07:42\";s:10:\"created_at\";s:19:\"2025-09-05 11:07:42\";s:2:\"id\";i:19;s:9:\"file_name\";s:15:\"export-19-sales\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:15:\"export-19-sales\";}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:7:{s:2:\"id\";s:10:\"Invoice No\";s:13:\"customer.name\";s:13:\"Customer Name\";s:9:\"sale_date\";s:9:\"Sale Date\";s:8:\"products\";s:8:\"Products\";s:9:\"total_qty\";s:14:\"Total Quantity\";s:12:\"total_amount\";s:12:\"Total Amount\";s:9:\"user.name\";s:7:\"Cashier\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:19;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:7:{s:2:\"id\";s:10:\"Invoice No\";s:13:\"customer.name\";s:13:\"Customer Name\";s:9:\"sale_date\";s:9:\"Sale Date\";s:8:\"products\";s:8:\"Products\";s:9:\"total_qty\";s:14:\"Total Quantity\";s:12:\"total_amount\";s:12:\"Total Amount\";s:9:\"user.name\";s:7:\"Cashier\";}s:10:\"\0*\0formats\";a:1:{i:0;E:48:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Xlsx\";}s:10:\"\0*\0options\";a:0:{}}\";}s:19:\"chainCatchCallbacks\";a:0:{}}}s:8:\"function\";s:266:\"function (\\Illuminate\\Bus\\Batch $batch) use ($next) {\n                if (! $batch->cancelled()) {\n                    \\Illuminate\\Container\\Container::getInstance()->make(\\Illuminate\\Contracts\\Bus\\Dispatcher::class)->dispatch($next);\n                }\n            }\";s:5:\"scope\";s:27:\"Illuminate\\Bus\\ChainedBatch\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000d3d0000000000000000\";}\";s:4:\"hash\";s:44:\"4g9BPgcWEW+39BGmN9m9N3ZM2hfVggS6WY4XLZ8glMc=\";}}}}', NULL, 1757045263, 1757045263),
('9fcd6642-72ab-41da-ac01-bdf7c24cf29d', '', 2, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:5828:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:1:{s:4:\"next\";O:46:\"Filament\\Actions\\Exports\\Jobs\\ExportCompletion\":7:{s:11:\"\0*\0exporter\";O:36:\"App\\Filament\\Exports\\ProductExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:3;s:8:\"exporter\";s:36:\"App\\Filament\\Exports\\ProductExporter\";s:10:\"total_rows\";i:10;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-05 11:08:47\";s:10:\"created_at\";s:19:\"2025-09-05 11:08:47\";s:2:\"id\";i:20;s:9:\"file_name\";s:18:\"export-20-products\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:3;s:8:\"exporter\";s:36:\"App\\Filament\\Exports\\ProductExporter\";s:10:\"total_rows\";i:10;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-05 11:08:47\";s:10:\"created_at\";s:19:\"2025-09-05 11:08:47\";s:2:\"id\";i:20;s:9:\"file_name\";s:18:\"export-20-products\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:18:\"export-20-products\";}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:8:{s:2:\"id\";s:2:\"ID\";s:4:\"name\";s:4:\"Name\";s:10:\"brand.name\";s:5:\"Brand\";s:13:\"category.name\";s:8:\"Category\";s:5:\"price\";s:5:\"Price\";s:5:\"stock\";s:8:\"In Stock\";s:11:\"description\";s:11:\"Description\";s:6:\"active\";s:6:\"Active\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:20;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:8:{s:2:\"id\";s:2:\"ID\";s:4:\"name\";s:4:\"Name\";s:10:\"brand.name\";s:5:\"Brand\";s:13:\"category.name\";s:8:\"Category\";s:5:\"price\";s:5:\"Price\";s:5:\"stock\";s:8:\"In Stock\";s:11:\"description\";s:11:\"Description\";s:6:\"active\";s:6:\"Active\";}s:10:\"\0*\0formats\";a:2:{i:0;E:47:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Csv\";i:1;E:48:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Xlsx\";}s:10:\"\0*\0options\";a:0:{}s:7:\"chained\";a:1:{i:0;s:2565:\"O:44:\"Filament\\Actions\\Exports\\Jobs\\CreateXlsxFile\":4:{s:11:\"\0*\0exporter\";O:36:\"App\\Filament\\Exports\\ProductExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:3;s:8:\"exporter\";s:36:\"App\\Filament\\Exports\\ProductExporter\";s:10:\"total_rows\";i:10;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-05 11:08:47\";s:10:\"created_at\";s:19:\"2025-09-05 11:08:47\";s:2:\"id\";i:20;s:9:\"file_name\";s:18:\"export-20-products\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:3;s:8:\"exporter\";s:36:\"App\\Filament\\Exports\\ProductExporter\";s:10:\"total_rows\";i:10;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-05 11:08:47\";s:10:\"created_at\";s:19:\"2025-09-05 11:08:47\";s:2:\"id\";i:20;s:9:\"file_name\";s:18:\"export-20-products\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:18:\"export-20-products\";}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:8:{s:2:\"id\";s:2:\"ID\";s:4:\"name\";s:4:\"Name\";s:10:\"brand.name\";s:5:\"Brand\";s:13:\"category.name\";s:8:\"Category\";s:5:\"price\";s:5:\"Price\";s:5:\"stock\";s:8:\"In Stock\";s:11:\"description\";s:11:\"Description\";s:6:\"active\";s:6:\"Active\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:20;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:8:{s:2:\"id\";s:2:\"ID\";s:4:\"name\";s:4:\"Name\";s:10:\"brand.name\";s:5:\"Brand\";s:13:\"category.name\";s:8:\"Category\";s:5:\"price\";s:5:\"Price\";s:5:\"stock\";s:8:\"In Stock\";s:11:\"description\";s:11:\"Description\";s:6:\"active\";s:6:\"Active\";}s:10:\"\0*\0options\";a:0:{}}\";}s:19:\"chainCatchCallbacks\";a:0:{}}}s:8:\"function\";s:266:\"function (\\Illuminate\\Bus\\Batch $batch) use ($next) {\n                if (! $batch->cancelled()) {\n                    \\Illuminate\\Container\\Container::getInstance()->make(\\Illuminate\\Contracts\\Bus\\Dispatcher::class)->dispatch($next);\n                }\n            }\";s:5:\"scope\";s:27:\"Illuminate\\Bus\\ChainedBatch\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000db30000000000000000\";}\";s:4:\"hash\";s:44:\"lrktir5wN+e9Slw26pTekLGZZtlNMDzYeKBPEQUBUQI=\";}}}}', NULL, 1757045327, 1757045327),
('9fd17f06-a36f-42a8-94ce-b28e64545697', '', 2, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:5692:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:1:{s:4:\"next\";O:46:\"Filament\\Actions\\Exports\\Jobs\\ExportCompletion\":7:{s:11:\"\0*\0exporter\";O:34:\"App\\Filament\\Exports\\BrandExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:3;s:8:\"exporter\";s:34:\"App\\Filament\\Exports\\BrandExporter\";s:10:\"total_rows\";i:3;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-07 12:01:20\";s:10:\"created_at\";s:19:\"2025-09-07 12:01:20\";s:2:\"id\";i:21;s:9:\"file_name\";s:16:\"export-21-brands\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:3;s:8:\"exporter\";s:34:\"App\\Filament\\Exports\\BrandExporter\";s:10:\"total_rows\";i:3;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-07 12:01:20\";s:10:\"created_at\";s:19:\"2025-09-07 12:01:20\";s:2:\"id\";i:21;s:9:\"file_name\";s:16:\"export-21-brands\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:16:\"export-21-brands\";}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:7:{s:2:\"id\";s:2:\"ID\";s:4:\"name\";s:4:\"Name\";s:7:\"website\";s:7:\"Website\";s:7:\"made_in\";s:7:\"Made in\";s:6:\"active\";s:6:\"Active\";s:10:\"created_at\";s:10:\"Created at\";s:10:\"updated_at\";s:10:\"Updated at\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:21;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:7:{s:2:\"id\";s:2:\"ID\";s:4:\"name\";s:4:\"Name\";s:7:\"website\";s:7:\"Website\";s:7:\"made_in\";s:7:\"Made in\";s:6:\"active\";s:6:\"Active\";s:10:\"created_at\";s:10:\"Created at\";s:10:\"updated_at\";s:10:\"Updated at\";}s:10:\"\0*\0formats\";a:2:{i:0;E:47:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Csv\";i:1;E:48:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Xlsx\";}s:10:\"\0*\0options\";a:0:{}s:7:\"chained\";a:1:{i:0;s:2497:\"O:44:\"Filament\\Actions\\Exports\\Jobs\\CreateXlsxFile\":4:{s:11:\"\0*\0exporter\";O:34:\"App\\Filament\\Exports\\BrandExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:3;s:8:\"exporter\";s:34:\"App\\Filament\\Exports\\BrandExporter\";s:10:\"total_rows\";i:3;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-07 12:01:20\";s:10:\"created_at\";s:19:\"2025-09-07 12:01:20\";s:2:\"id\";i:21;s:9:\"file_name\";s:16:\"export-21-brands\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:3;s:8:\"exporter\";s:34:\"App\\Filament\\Exports\\BrandExporter\";s:10:\"total_rows\";i:3;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-07 12:01:20\";s:10:\"created_at\";s:19:\"2025-09-07 12:01:20\";s:2:\"id\";i:21;s:9:\"file_name\";s:16:\"export-21-brands\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:16:\"export-21-brands\";}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:7:{s:2:\"id\";s:2:\"ID\";s:4:\"name\";s:4:\"Name\";s:7:\"website\";s:7:\"Website\";s:7:\"made_in\";s:7:\"Made in\";s:6:\"active\";s:6:\"Active\";s:10:\"created_at\";s:10:\"Created at\";s:10:\"updated_at\";s:10:\"Updated at\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:21;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:7:{s:2:\"id\";s:2:\"ID\";s:4:\"name\";s:4:\"Name\";s:7:\"website\";s:7:\"Website\";s:7:\"made_in\";s:7:\"Made in\";s:6:\"active\";s:6:\"Active\";s:10:\"created_at\";s:10:\"Created at\";s:10:\"updated_at\";s:10:\"Updated at\";}s:10:\"\0*\0options\";a:0:{}}\";}s:19:\"chainCatchCallbacks\";a:0:{}}}s:8:\"function\";s:266:\"function (\\Illuminate\\Bus\\Batch $batch) use ($next) {\n                if (! $batch->cancelled()) {\n                    \\Illuminate\\Container\\Container::getInstance()->make(\\Illuminate\\Contracts\\Bus\\Dispatcher::class)->dispatch($next);\n                }\n            }\";s:5:\"scope\";s:27:\"Illuminate\\Bus\\ChainedBatch\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000cc00000000000000000\";}\";s:4:\"hash\";s:44:\"Mj4f5LFVVq22FtmQKEgiRJSld5JTBpz75ywiTzkgCko=\";}}}}', NULL, 1757221281, 1757221281);
INSERT INTO `job_batches` (`id`, `name`, `total_jobs`, `pending_jobs`, `failed_jobs`, `failed_job_ids`, `options`, `cancelled_at`, `created_at`, `finished_at`) VALUES
('9fd17f18-51f5-4e4f-ad89-1c08615b683a', '', 2, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:5662:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:1:{s:4:\"next\";O:46:\"Filament\\Actions\\Exports\\Jobs\\ExportCompletion\":7:{s:11:\"\0*\0exporter\";O:37:\"App\\Filament\\Exports\\CategoryExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:3;s:8:\"exporter\";s:37:\"App\\Filament\\Exports\\CategoryExporter\";s:10:\"total_rows\";i:2;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-07 12:01:32\";s:10:\"created_at\";s:19:\"2025-09-07 12:01:32\";s:2:\"id\";i:22;s:9:\"file_name\";s:20:\"export-22-categories\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:3;s:8:\"exporter\";s:37:\"App\\Filament\\Exports\\CategoryExporter\";s:10:\"total_rows\";i:2;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-07 12:01:32\";s:10:\"created_at\";s:19:\"2025-09-07 12:01:32\";s:2:\"id\";i:22;s:9:\"file_name\";s:20:\"export-22-categories\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:20:\"export-22-categories\";}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:6:{s:2:\"id\";s:2:\"ID\";s:4:\"name\";s:4:\"Name\";s:11:\"description\";s:11:\"Description\";s:6:\"active\";s:6:\"Active\";s:10:\"created_at\";s:10:\"Created at\";s:10:\"updated_at\";s:10:\"Updated at\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:22;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:6:{s:2:\"id\";s:2:\"ID\";s:4:\"name\";s:4:\"Name\";s:11:\"description\";s:11:\"Description\";s:6:\"active\";s:6:\"Active\";s:10:\"created_at\";s:10:\"Created at\";s:10:\"updated_at\";s:10:\"Updated at\";}s:10:\"\0*\0formats\";a:2:{i:0;E:47:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Csv\";i:1;E:48:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Xlsx\";}s:10:\"\0*\0options\";a:0:{}s:7:\"chained\";a:1:{i:0;s:2482:\"O:44:\"Filament\\Actions\\Exports\\Jobs\\CreateXlsxFile\":4:{s:11:\"\0*\0exporter\";O:37:\"App\\Filament\\Exports\\CategoryExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:3;s:8:\"exporter\";s:37:\"App\\Filament\\Exports\\CategoryExporter\";s:10:\"total_rows\";i:2;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-07 12:01:32\";s:10:\"created_at\";s:19:\"2025-09-07 12:01:32\";s:2:\"id\";i:22;s:9:\"file_name\";s:20:\"export-22-categories\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:3;s:8:\"exporter\";s:37:\"App\\Filament\\Exports\\CategoryExporter\";s:10:\"total_rows\";i:2;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-07 12:01:32\";s:10:\"created_at\";s:19:\"2025-09-07 12:01:32\";s:2:\"id\";i:22;s:9:\"file_name\";s:20:\"export-22-categories\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:20:\"export-22-categories\";}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:6:{s:2:\"id\";s:2:\"ID\";s:4:\"name\";s:4:\"Name\";s:11:\"description\";s:11:\"Description\";s:6:\"active\";s:6:\"Active\";s:10:\"created_at\";s:10:\"Created at\";s:10:\"updated_at\";s:10:\"Updated at\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:22;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:6:{s:2:\"id\";s:2:\"ID\";s:4:\"name\";s:4:\"Name\";s:11:\"description\";s:11:\"Description\";s:6:\"active\";s:6:\"Active\";s:10:\"created_at\";s:10:\"Created at\";s:10:\"updated_at\";s:10:\"Updated at\";}s:10:\"\0*\0options\";a:0:{}}\";}s:19:\"chainCatchCallbacks\";a:0:{}}}s:8:\"function\";s:266:\"function (\\Illuminate\\Bus\\Batch $batch) use ($next) {\n                if (! $batch->cancelled()) {\n                    \\Illuminate\\Container\\Container::getInstance()->make(\\Illuminate\\Contracts\\Bus\\Dispatcher::class)->dispatch($next);\n                }\n            }\";s:5:\"scope\";s:27:\"Illuminate\\Bus\\ChainedBatch\";s:4:\"this\";N;s:4:\"self\";s:32:\"00000000000007a60000000000000000\";}\";s:4:\"hash\";s:44:\"Amr4tfg/TUBvZ/2vYRvgqU37ckC6ls0+l9gW8aEPmzQ=\";}}}}', NULL, 1757221292, 1757221292),
('9fd17f2a-8123-42c5-baf0-3d0d4706b3a3', '', 3, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:5867:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:1:{s:4:\"next\";O:44:\"Filament\\Actions\\Exports\\Jobs\\CreateXlsxFile\":6:{s:11:\"\0*\0exporter\";O:42:\"App\\Filament\\Exports\\ProductImportExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:3;s:8:\"exporter\";s:42:\"App\\Filament\\Exports\\ProductImportExporter\";s:10:\"total_rows\";i:106;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-07 12:01:44\";s:10:\"created_at\";s:19:\"2025-09-07 12:01:44\";s:2:\"id\";i:23;s:9:\"file_name\";s:25:\"export-23-product-imports\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:3;s:8:\"exporter\";s:42:\"App\\Filament\\Exports\\ProductImportExporter\";s:10:\"total_rows\";i:106;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-07 12:01:44\";s:10:\"created_at\";s:19:\"2025-09-07 12:01:44\";s:2:\"id\";i:23;s:9:\"file_name\";s:25:\"export-23-product-imports\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:25:\"export-23-product-imports\";}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:7:{s:2:\"id\";s:2:\"ID\";s:8:\"products\";s:8:\"Products\";s:9:\"total_qyt\";s:9:\"Total Qty\";s:12:\"total_amount\";s:12:\"Total Amount\";s:11:\"import_date\";s:11:\"Import Date\";s:13:\"supplier.name\";s:8:\"Supplier\";s:9:\"user.name\";s:8:\"Importer\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:23;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:7:{s:2:\"id\";s:2:\"ID\";s:8:\"products\";s:8:\"Products\";s:9:\"total_qyt\";s:9:\"Total Qty\";s:12:\"total_amount\";s:12:\"Total Amount\";s:11:\"import_date\";s:11:\"Import Date\";s:13:\"supplier.name\";s:8:\"Supplier\";s:9:\"user.name\";s:8:\"Importer\";}s:10:\"\0*\0options\";a:0:{}s:7:\"chained\";a:1:{i:0;s:2700:\"O:46:\"Filament\\Actions\\Exports\\Jobs\\ExportCompletion\":5:{s:11:\"\0*\0exporter\";O:42:\"App\\Filament\\Exports\\ProductImportExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:3;s:8:\"exporter\";s:42:\"App\\Filament\\Exports\\ProductImportExporter\";s:10:\"total_rows\";i:106;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-07 12:01:44\";s:10:\"created_at\";s:19:\"2025-09-07 12:01:44\";s:2:\"id\";i:23;s:9:\"file_name\";s:25:\"export-23-product-imports\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:3;s:8:\"exporter\";s:42:\"App\\Filament\\Exports\\ProductImportExporter\";s:10:\"total_rows\";i:106;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-07 12:01:44\";s:10:\"created_at\";s:19:\"2025-09-07 12:01:44\";s:2:\"id\";i:23;s:9:\"file_name\";s:25:\"export-23-product-imports\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:25:\"export-23-product-imports\";}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:7:{s:2:\"id\";s:2:\"ID\";s:8:\"products\";s:8:\"Products\";s:9:\"total_qyt\";s:9:\"Total Qty\";s:12:\"total_amount\";s:12:\"Total Amount\";s:11:\"import_date\";s:11:\"Import Date\";s:13:\"supplier.name\";s:8:\"Supplier\";s:9:\"user.name\";s:8:\"Importer\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:23;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:7:{s:2:\"id\";s:2:\"ID\";s:8:\"products\";s:8:\"Products\";s:9:\"total_qyt\";s:9:\"Total Qty\";s:12:\"total_amount\";s:12:\"Total Amount\";s:11:\"import_date\";s:11:\"Import Date\";s:13:\"supplier.name\";s:8:\"Supplier\";s:9:\"user.name\";s:8:\"Importer\";}s:10:\"\0*\0formats\";a:1:{i:0;E:48:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Xlsx\";}s:10:\"\0*\0options\";a:0:{}}\";}s:19:\"chainCatchCallbacks\";a:0:{}}}s:8:\"function\";s:266:\"function (\\Illuminate\\Bus\\Batch $batch) use ($next) {\n                if (! $batch->cancelled()) {\n                    \\Illuminate\\Container\\Container::getInstance()->make(\\Illuminate\\Contracts\\Bus\\Dispatcher::class)->dispatch($next);\n                }\n            }\";s:5:\"scope\";s:27:\"Illuminate\\Bus\\ChainedBatch\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000d430000000000000000\";}\";s:4:\"hash\";s:44:\"jFj+laeepeLC6P+qSZKrXw0wKaDGbP4hd68BgOegi/M=\";}}}}', NULL, 1757221304, 1757221304),
('9fd17fe0-ac4e-48ed-bdae-0a9ec7b27cb6', '', 3, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:5926:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:1:{s:4:\"next\";O:46:\"Filament\\Actions\\Exports\\Jobs\\ExportCompletion\":7:{s:11:\"\0*\0exporter\";O:42:\"App\\Filament\\Exports\\ProductImportExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:3;s:8:\"exporter\";s:42:\"App\\Filament\\Exports\\ProductImportExporter\";s:10:\"total_rows\";i:106;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-07 12:03:44\";s:10:\"created_at\";s:19:\"2025-09-07 12:03:44\";s:2:\"id\";i:24;s:9:\"file_name\";s:25:\"export-24-product-imports\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:3;s:8:\"exporter\";s:42:\"App\\Filament\\Exports\\ProductImportExporter\";s:10:\"total_rows\";i:106;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-07 12:03:44\";s:10:\"created_at\";s:19:\"2025-09-07 12:03:44\";s:2:\"id\";i:24;s:9:\"file_name\";s:25:\"export-24-product-imports\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:25:\"export-24-product-imports\";}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:7:{s:2:\"id\";s:2:\"ID\";s:8:\"products\";s:8:\"Products\";s:9:\"total_qyt\";s:9:\"Total Qty\";s:12:\"total_amount\";s:12:\"Total Amount\";s:11:\"import_date\";s:11:\"Import Date\";s:13:\"supplier.name\";s:8:\"Supplier\";s:9:\"user.name\";s:8:\"Importer\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:24;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:7:{s:2:\"id\";s:2:\"ID\";s:8:\"products\";s:8:\"Products\";s:9:\"total_qyt\";s:9:\"Total Qty\";s:12:\"total_amount\";s:12:\"Total Amount\";s:11:\"import_date\";s:11:\"Import Date\";s:13:\"supplier.name\";s:8:\"Supplier\";s:9:\"user.name\";s:8:\"Importer\";}s:10:\"\0*\0formats\";a:2:{i:0;E:47:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Csv\";i:1;E:48:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Xlsx\";}s:10:\"\0*\0options\";a:0:{}s:7:\"chained\";a:1:{i:0;s:2614:\"O:44:\"Filament\\Actions\\Exports\\Jobs\\CreateXlsxFile\":4:{s:11:\"\0*\0exporter\";O:42:\"App\\Filament\\Exports\\ProductImportExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:3;s:8:\"exporter\";s:42:\"App\\Filament\\Exports\\ProductImportExporter\";s:10:\"total_rows\";i:106;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-07 12:03:44\";s:10:\"created_at\";s:19:\"2025-09-07 12:03:44\";s:2:\"id\";i:24;s:9:\"file_name\";s:25:\"export-24-product-imports\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:3;s:8:\"exporter\";s:42:\"App\\Filament\\Exports\\ProductImportExporter\";s:10:\"total_rows\";i:106;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-07 12:03:44\";s:10:\"created_at\";s:19:\"2025-09-07 12:03:44\";s:2:\"id\";i:24;s:9:\"file_name\";s:25:\"export-24-product-imports\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:25:\"export-24-product-imports\";}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:7:{s:2:\"id\";s:2:\"ID\";s:8:\"products\";s:8:\"Products\";s:9:\"total_qyt\";s:9:\"Total Qty\";s:12:\"total_amount\";s:12:\"Total Amount\";s:11:\"import_date\";s:11:\"Import Date\";s:13:\"supplier.name\";s:8:\"Supplier\";s:9:\"user.name\";s:8:\"Importer\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:24;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:7:{s:2:\"id\";s:2:\"ID\";s:8:\"products\";s:8:\"Products\";s:9:\"total_qyt\";s:9:\"Total Qty\";s:12:\"total_amount\";s:12:\"Total Amount\";s:11:\"import_date\";s:11:\"Import Date\";s:13:\"supplier.name\";s:8:\"Supplier\";s:9:\"user.name\";s:8:\"Importer\";}s:10:\"\0*\0options\";a:0:{}}\";}s:19:\"chainCatchCallbacks\";a:0:{}}}s:8:\"function\";s:266:\"function (\\Illuminate\\Bus\\Batch $batch) use ($next) {\n                if (! $batch->cancelled()) {\n                    \\Illuminate\\Container\\Container::getInstance()->make(\\Illuminate\\Contracts\\Bus\\Dispatcher::class)->dispatch($next);\n                }\n            }\";s:5:\"scope\";s:27:\"Illuminate\\Bus\\ChainedBatch\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000d3d0000000000000000\";}\";s:4:\"hash\";s:44:\"hfPBxvW5DxVU6DF1oEMGxMgYj6YrHFUuaaXFjrnW7pw=\";}}}}', NULL, 1757221424, 1757221424),
('9fd17ffc-86b1-45e0-b802-24e310a8f431', '', 3, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:5832:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:1:{s:4:\"next\";O:46:\"Filament\\Actions\\Exports\\Jobs\\ExportCompletion\":7:{s:11:\"\0*\0exporter\";O:36:\"App\\Filament\\Exports\\ProductExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:3;s:8:\"exporter\";s:36:\"App\\Filament\\Exports\\ProductExporter\";s:10:\"total_rows\";i:114;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-07 12:04:02\";s:10:\"created_at\";s:19:\"2025-09-07 12:04:02\";s:2:\"id\";i:25;s:9:\"file_name\";s:18:\"export-25-products\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:3;s:8:\"exporter\";s:36:\"App\\Filament\\Exports\\ProductExporter\";s:10:\"total_rows\";i:114;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-07 12:04:02\";s:10:\"created_at\";s:19:\"2025-09-07 12:04:02\";s:2:\"id\";i:25;s:9:\"file_name\";s:18:\"export-25-products\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:18:\"export-25-products\";}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:8:{s:2:\"id\";s:2:\"ID\";s:4:\"name\";s:4:\"Name\";s:10:\"brand.name\";s:5:\"Brand\";s:13:\"category.name\";s:8:\"Category\";s:5:\"price\";s:5:\"Price\";s:5:\"stock\";s:8:\"In Stock\";s:11:\"description\";s:11:\"Description\";s:6:\"active\";s:6:\"Active\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:25;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:8:{s:2:\"id\";s:2:\"ID\";s:4:\"name\";s:4:\"Name\";s:10:\"brand.name\";s:5:\"Brand\";s:13:\"category.name\";s:8:\"Category\";s:5:\"price\";s:5:\"Price\";s:5:\"stock\";s:8:\"In Stock\";s:11:\"description\";s:11:\"Description\";s:6:\"active\";s:6:\"Active\";}s:10:\"\0*\0formats\";a:2:{i:0;E:47:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Csv\";i:1;E:48:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Xlsx\";}s:10:\"\0*\0options\";a:0:{}s:7:\"chained\";a:1:{i:0;s:2567:\"O:44:\"Filament\\Actions\\Exports\\Jobs\\CreateXlsxFile\":4:{s:11:\"\0*\0exporter\";O:36:\"App\\Filament\\Exports\\ProductExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:3;s:8:\"exporter\";s:36:\"App\\Filament\\Exports\\ProductExporter\";s:10:\"total_rows\";i:114;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-07 12:04:02\";s:10:\"created_at\";s:19:\"2025-09-07 12:04:02\";s:2:\"id\";i:25;s:9:\"file_name\";s:18:\"export-25-products\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:3;s:8:\"exporter\";s:36:\"App\\Filament\\Exports\\ProductExporter\";s:10:\"total_rows\";i:114;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-09-07 12:04:02\";s:10:\"created_at\";s:19:\"2025-09-07 12:04:02\";s:2:\"id\";i:25;s:9:\"file_name\";s:18:\"export-25-products\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:18:\"export-25-products\";}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:8:{s:2:\"id\";s:2:\"ID\";s:4:\"name\";s:4:\"Name\";s:10:\"brand.name\";s:5:\"Brand\";s:13:\"category.name\";s:8:\"Category\";s:5:\"price\";s:5:\"Price\";s:5:\"stock\";s:8:\"In Stock\";s:11:\"description\";s:11:\"Description\";s:6:\"active\";s:6:\"Active\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:25;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:8:{s:2:\"id\";s:2:\"ID\";s:4:\"name\";s:4:\"Name\";s:10:\"brand.name\";s:5:\"Brand\";s:13:\"category.name\";s:8:\"Category\";s:5:\"price\";s:5:\"Price\";s:5:\"stock\";s:8:\"In Stock\";s:11:\"description\";s:11:\"Description\";s:6:\"active\";s:6:\"Active\";}s:10:\"\0*\0options\";a:0:{}}\";}s:19:\"chainCatchCallbacks\";a:0:{}}}s:8:\"function\";s:266:\"function (\\Illuminate\\Bus\\Batch $batch) use ($next) {\n                if (! $batch->cancelled()) {\n                    \\Illuminate\\Container\\Container::getInstance()->make(\\Illuminate\\Contracts\\Bus\\Dispatcher::class)->dispatch($next);\n                }\n            }\";s:5:\"scope\";s:27:\"Illuminate\\Bus\\ChainedBatch\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000dcc0000000000000000\";}\";s:4:\"hash\";s:44:\"Iq7DU9z2HkkjRhouMvA9WM3M0jct1WL5J8sAN4m9ZrE=\";}}}}', NULL, 1757221442, 1757221442),
('a0100f4e-a6a6-4071-9902-dbbc5b868767', '', 2, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:5828:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:1:{s:4:\"next\";O:46:\"Filament\\Actions\\Exports\\Jobs\\ExportCompletion\":7:{s:11:\"\0*\0exporter\";O:36:\"App\\Filament\\Exports\\ProductExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:36:\"App\\Filament\\Exports\\ProductExporter\";s:10:\"total_rows\";i:10;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-10-08 14:26:06\";s:10:\"created_at\";s:19:\"2025-10-08 14:26:06\";s:2:\"id\";i:26;s:9:\"file_name\";s:18:\"export-26-products\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:36:\"App\\Filament\\Exports\\ProductExporter\";s:10:\"total_rows\";i:10;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-10-08 14:26:06\";s:10:\"created_at\";s:19:\"2025-10-08 14:26:06\";s:2:\"id\";i:26;s:9:\"file_name\";s:18:\"export-26-products\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:18:\"export-26-products\";}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:8:{s:2:\"id\";s:2:\"ID\";s:4:\"name\";s:4:\"Name\";s:10:\"brand.name\";s:5:\"Brand\";s:13:\"category.name\";s:8:\"Category\";s:5:\"price\";s:5:\"Price\";s:5:\"stock\";s:8:\"In Stock\";s:11:\"description\";s:11:\"Description\";s:6:\"active\";s:6:\"Active\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:26;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:8:{s:2:\"id\";s:2:\"ID\";s:4:\"name\";s:4:\"Name\";s:10:\"brand.name\";s:5:\"Brand\";s:13:\"category.name\";s:8:\"Category\";s:5:\"price\";s:5:\"Price\";s:5:\"stock\";s:8:\"In Stock\";s:11:\"description\";s:11:\"Description\";s:6:\"active\";s:6:\"Active\";}s:10:\"\0*\0formats\";a:2:{i:0;E:47:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Csv\";i:1;E:48:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Xlsx\";}s:10:\"\0*\0options\";a:0:{}s:7:\"chained\";a:1:{i:0;s:2565:\"O:44:\"Filament\\Actions\\Exports\\Jobs\\CreateXlsxFile\":4:{s:11:\"\0*\0exporter\";O:36:\"App\\Filament\\Exports\\ProductExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:36:\"App\\Filament\\Exports\\ProductExporter\";s:10:\"total_rows\";i:10;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-10-08 14:26:06\";s:10:\"created_at\";s:19:\"2025-10-08 14:26:06\";s:2:\"id\";i:26;s:9:\"file_name\";s:18:\"export-26-products\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:36:\"App\\Filament\\Exports\\ProductExporter\";s:10:\"total_rows\";i:10;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-10-08 14:26:06\";s:10:\"created_at\";s:19:\"2025-10-08 14:26:06\";s:2:\"id\";i:26;s:9:\"file_name\";s:18:\"export-26-products\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:18:\"export-26-products\";}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:8:{s:2:\"id\";s:2:\"ID\";s:4:\"name\";s:4:\"Name\";s:10:\"brand.name\";s:5:\"Brand\";s:13:\"category.name\";s:8:\"Category\";s:5:\"price\";s:5:\"Price\";s:5:\"stock\";s:8:\"In Stock\";s:11:\"description\";s:11:\"Description\";s:6:\"active\";s:6:\"Active\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:26;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:8:{s:2:\"id\";s:2:\"ID\";s:4:\"name\";s:4:\"Name\";s:10:\"brand.name\";s:5:\"Brand\";s:13:\"category.name\";s:8:\"Category\";s:5:\"price\";s:5:\"Price\";s:5:\"stock\";s:8:\"In Stock\";s:11:\"description\";s:11:\"Description\";s:6:\"active\";s:6:\"Active\";}s:10:\"\0*\0options\";a:0:{}}\";}s:19:\"chainCatchCallbacks\";a:0:{}}}s:8:\"function\";s:266:\"function (\\Illuminate\\Bus\\Batch $batch) use ($next) {\n                if (! $batch->cancelled()) {\n                    \\Illuminate\\Container\\Container::getInstance()->make(\\Illuminate\\Contracts\\Bus\\Dispatcher::class)->dispatch($next);\n                }\n            }\";s:5:\"scope\";s:27:\"Illuminate\\Bus\\ChainedBatch\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000d4e0000000000000000\";}\";s:4:\"hash\";s:44:\"PK7CDVjGNtlEAw/Xopsaxj5v2VAXeenR+ZC6Mn4O+ik=\";}}}}', NULL, 1759908367, 1759908367),
('a02e1b2d-619e-4a02-a225-7c58028a63f8', '', 2, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:5805:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:1:{s:4:\"next\";O:44:\"Filament\\Actions\\Exports\\Jobs\\CreateXlsxFile\":6:{s:11:\"\0*\0exporter\";O:33:\"App\\Filament\\Exports\\SaleExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:4;s:8:\"exporter\";s:33:\"App\\Filament\\Exports\\SaleExporter\";s:10:\"total_rows\";i:10;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-10-23 12:54:08\";s:10:\"created_at\";s:19:\"2025-10-23 12:54:08\";s:2:\"id\";i:27;s:9:\"file_name\";s:15:\"export-27-sales\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:4;s:8:\"exporter\";s:33:\"App\\Filament\\Exports\\SaleExporter\";s:10:\"total_rows\";i:10;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-10-23 12:54:08\";s:10:\"created_at\";s:19:\"2025-10-23 12:54:08\";s:2:\"id\";i:27;s:9:\"file_name\";s:15:\"export-27-sales\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:15:\"export-27-sales\";}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:7:{s:2:\"id\";s:10:\"Invoice No\";s:13:\"customer.name\";s:13:\"Customer Name\";s:9:\"sale_date\";s:9:\"Sale Date\";s:8:\"products\";s:8:\"Products\";s:9:\"total_qty\";s:14:\"Total Quantity\";s:12:\"total_amount\";s:12:\"Total Amount\";s:9:\"user.name\";s:7:\"Cashier\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:27;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:7:{s:2:\"id\";s:10:\"Invoice No\";s:13:\"customer.name\";s:13:\"Customer Name\";s:9:\"sale_date\";s:9:\"Sale Date\";s:8:\"products\";s:8:\"Products\";s:9:\"total_qty\";s:14:\"Total Quantity\";s:12:\"total_amount\";s:12:\"Total Amount\";s:9:\"user.name\";s:7:\"Cashier\";}s:10:\"\0*\0options\";a:0:{}s:7:\"chained\";a:1:{i:0;s:2669:\"O:46:\"Filament\\Actions\\Exports\\Jobs\\ExportCompletion\":5:{s:11:\"\0*\0exporter\";O:33:\"App\\Filament\\Exports\\SaleExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:4;s:8:\"exporter\";s:33:\"App\\Filament\\Exports\\SaleExporter\";s:10:\"total_rows\";i:10;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-10-23 12:54:08\";s:10:\"created_at\";s:19:\"2025-10-23 12:54:08\";s:2:\"id\";i:27;s:9:\"file_name\";s:15:\"export-27-sales\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:4;s:8:\"exporter\";s:33:\"App\\Filament\\Exports\\SaleExporter\";s:10:\"total_rows\";i:10;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-10-23 12:54:08\";s:10:\"created_at\";s:19:\"2025-10-23 12:54:08\";s:2:\"id\";i:27;s:9:\"file_name\";s:15:\"export-27-sales\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:15:\"export-27-sales\";}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:7:{s:2:\"id\";s:10:\"Invoice No\";s:13:\"customer.name\";s:13:\"Customer Name\";s:9:\"sale_date\";s:9:\"Sale Date\";s:8:\"products\";s:8:\"Products\";s:9:\"total_qty\";s:14:\"Total Quantity\";s:12:\"total_amount\";s:12:\"Total Amount\";s:9:\"user.name\";s:7:\"Cashier\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:27;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:7:{s:2:\"id\";s:10:\"Invoice No\";s:13:\"customer.name\";s:13:\"Customer Name\";s:9:\"sale_date\";s:9:\"Sale Date\";s:8:\"products\";s:8:\"Products\";s:9:\"total_qty\";s:14:\"Total Quantity\";s:12:\"total_amount\";s:12:\"Total Amount\";s:9:\"user.name\";s:7:\"Cashier\";}s:10:\"\0*\0formats\";a:1:{i:0;E:48:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Xlsx\";}s:10:\"\0*\0options\";a:0:{}}\";}s:19:\"chainCatchCallbacks\";a:0:{}}}s:8:\"function\";s:266:\"function (\\Illuminate\\Bus\\Batch $batch) use ($next) {\n                if (! $batch->cancelled()) {\n                    \\Illuminate\\Container\\Container::getInstance()->make(\\Illuminate\\Contracts\\Bus\\Dispatcher::class)->dispatch($next);\n                }\n            }\";s:5:\"scope\";s:27:\"Illuminate\\Bus\\ChainedBatch\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000de70000000000000000\";}\";s:4:\"hash\";s:44:\"2DZwLv5xbtxK+zOMkzwkkRA+/EJIedhVNF1/tZ3FOuI=\";}}}}', NULL, 1761198849, 1761198849),
('a02e1b84-e0b4-4595-9494-2d8c9cc07408', '', 2, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:5828:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:1:{s:4:\"next\";O:46:\"Filament\\Actions\\Exports\\Jobs\\ExportCompletion\":7:{s:11:\"\0*\0exporter\";O:36:\"App\\Filament\\Exports\\ProductExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:4;s:8:\"exporter\";s:36:\"App\\Filament\\Exports\\ProductExporter\";s:10:\"total_rows\";i:10;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-10-23 12:55:06\";s:10:\"created_at\";s:19:\"2025-10-23 12:55:06\";s:2:\"id\";i:28;s:9:\"file_name\";s:18:\"export-28-products\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:4;s:8:\"exporter\";s:36:\"App\\Filament\\Exports\\ProductExporter\";s:10:\"total_rows\";i:10;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-10-23 12:55:06\";s:10:\"created_at\";s:19:\"2025-10-23 12:55:06\";s:2:\"id\";i:28;s:9:\"file_name\";s:18:\"export-28-products\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:18:\"export-28-products\";}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:8:{s:2:\"id\";s:2:\"ID\";s:4:\"name\";s:4:\"Name\";s:10:\"brand.name\";s:5:\"Brand\";s:13:\"category.name\";s:8:\"Category\";s:5:\"price\";s:5:\"Price\";s:5:\"stock\";s:8:\"In Stock\";s:11:\"description\";s:11:\"Description\";s:6:\"active\";s:6:\"Active\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:28;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:8:{s:2:\"id\";s:2:\"ID\";s:4:\"name\";s:4:\"Name\";s:10:\"brand.name\";s:5:\"Brand\";s:13:\"category.name\";s:8:\"Category\";s:5:\"price\";s:5:\"Price\";s:5:\"stock\";s:8:\"In Stock\";s:11:\"description\";s:11:\"Description\";s:6:\"active\";s:6:\"Active\";}s:10:\"\0*\0formats\";a:2:{i:0;E:47:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Csv\";i:1;E:48:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Xlsx\";}s:10:\"\0*\0options\";a:0:{}s:7:\"chained\";a:1:{i:0;s:2565:\"O:44:\"Filament\\Actions\\Exports\\Jobs\\CreateXlsxFile\":4:{s:11:\"\0*\0exporter\";O:36:\"App\\Filament\\Exports\\ProductExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:4;s:8:\"exporter\";s:36:\"App\\Filament\\Exports\\ProductExporter\";s:10:\"total_rows\";i:10;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-10-23 12:55:06\";s:10:\"created_at\";s:19:\"2025-10-23 12:55:06\";s:2:\"id\";i:28;s:9:\"file_name\";s:18:\"export-28-products\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:4;s:8:\"exporter\";s:36:\"App\\Filament\\Exports\\ProductExporter\";s:10:\"total_rows\";i:10;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-10-23 12:55:06\";s:10:\"created_at\";s:19:\"2025-10-23 12:55:06\";s:2:\"id\";i:28;s:9:\"file_name\";s:18:\"export-28-products\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:18:\"export-28-products\";}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:8:{s:2:\"id\";s:2:\"ID\";s:4:\"name\";s:4:\"Name\";s:10:\"brand.name\";s:5:\"Brand\";s:13:\"category.name\";s:8:\"Category\";s:5:\"price\";s:5:\"Price\";s:5:\"stock\";s:8:\"In Stock\";s:11:\"description\";s:11:\"Description\";s:6:\"active\";s:6:\"Active\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:28;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:8:{s:2:\"id\";s:2:\"ID\";s:4:\"name\";s:4:\"Name\";s:10:\"brand.name\";s:5:\"Brand\";s:13:\"category.name\";s:8:\"Category\";s:5:\"price\";s:5:\"Price\";s:5:\"stock\";s:8:\"In Stock\";s:11:\"description\";s:11:\"Description\";s:6:\"active\";s:6:\"Active\";}s:10:\"\0*\0options\";a:0:{}}\";}s:19:\"chainCatchCallbacks\";a:0:{}}}s:8:\"function\";s:266:\"function (\\Illuminate\\Bus\\Batch $batch) use ($next) {\n                if (! $batch->cancelled()) {\n                    \\Illuminate\\Container\\Container::getInstance()->make(\\Illuminate\\Contracts\\Bus\\Dispatcher::class)->dispatch($next);\n                }\n            }\";s:5:\"scope\";s:27:\"Illuminate\\Bus\\ChainedBatch\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000e5f0000000000000000\";}\";s:4:\"hash\";s:44:\"QIxd79p6XmBOWoihMj+NZLgJdTjjpqvyLqygSb8OumE=\";}}}}', NULL, 1761198906, 1761198906);
INSERT INTO `job_batches` (`id`, `name`, `total_jobs`, `pending_jobs`, `failed_jobs`, `failed_job_ids`, `options`, `cancelled_at`, `created_at`, `finished_at`) VALUES
('a02e1c89-c344-4df4-8fa5-e052e1faf9e7', '', 3, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:5832:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:1:{s:4:\"next\";O:46:\"Filament\\Actions\\Exports\\Jobs\\ExportCompletion\":7:{s:11:\"\0*\0exporter\";O:36:\"App\\Filament\\Exports\\ProductExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:4;s:8:\"exporter\";s:36:\"App\\Filament\\Exports\\ProductExporter\";s:10:\"total_rows\";i:125;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-10-23 12:57:57\";s:10:\"created_at\";s:19:\"2025-10-23 12:57:57\";s:2:\"id\";i:29;s:9:\"file_name\";s:18:\"export-29-products\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:4;s:8:\"exporter\";s:36:\"App\\Filament\\Exports\\ProductExporter\";s:10:\"total_rows\";i:125;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-10-23 12:57:57\";s:10:\"created_at\";s:19:\"2025-10-23 12:57:57\";s:2:\"id\";i:29;s:9:\"file_name\";s:18:\"export-29-products\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:18:\"export-29-products\";}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:8:{s:2:\"id\";s:2:\"ID\";s:4:\"name\";s:4:\"Name\";s:10:\"brand.name\";s:5:\"Brand\";s:13:\"category.name\";s:8:\"Category\";s:5:\"price\";s:5:\"Price\";s:5:\"stock\";s:8:\"In Stock\";s:11:\"description\";s:11:\"Description\";s:6:\"active\";s:6:\"Active\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:29;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:8:{s:2:\"id\";s:2:\"ID\";s:4:\"name\";s:4:\"Name\";s:10:\"brand.name\";s:5:\"Brand\";s:13:\"category.name\";s:8:\"Category\";s:5:\"price\";s:5:\"Price\";s:5:\"stock\";s:8:\"In Stock\";s:11:\"description\";s:11:\"Description\";s:6:\"active\";s:6:\"Active\";}s:10:\"\0*\0formats\";a:2:{i:0;E:47:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Csv\";i:1;E:48:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Xlsx\";}s:10:\"\0*\0options\";a:0:{}s:7:\"chained\";a:1:{i:0;s:2567:\"O:44:\"Filament\\Actions\\Exports\\Jobs\\CreateXlsxFile\":4:{s:11:\"\0*\0exporter\";O:36:\"App\\Filament\\Exports\\ProductExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":33:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:4;s:8:\"exporter\";s:36:\"App\\Filament\\Exports\\ProductExporter\";s:10:\"total_rows\";i:125;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-10-23 12:57:57\";s:10:\"created_at\";s:19:\"2025-10-23 12:57:57\";s:2:\"id\";i:29;s:9:\"file_name\";s:18:\"export-29-products\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:4;s:8:\"exporter\";s:36:\"App\\Filament\\Exports\\ProductExporter\";s:10:\"total_rows\";i:125;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-10-23 12:57:57\";s:10:\"created_at\";s:19:\"2025-10-23 12:57:57\";s:2:\"id\";i:29;s:9:\"file_name\";s:18:\"export-29-products\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:18:\"export-29-products\";}s:11:\"\0*\0previous\";a:0:{}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:27:\"\0*\0relationAutoloadCallback\";N;s:26:\"\0*\0relationAutoloadContext\";N;s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:8:{s:2:\"id\";s:2:\"ID\";s:4:\"name\";s:4:\"Name\";s:10:\"brand.name\";s:5:\"Brand\";s:13:\"category.name\";s:8:\"Category\";s:5:\"price\";s:5:\"Price\";s:5:\"stock\";s:8:\"In Stock\";s:11:\"description\";s:11:\"Description\";s:6:\"active\";s:6:\"Active\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:29;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:8:{s:2:\"id\";s:2:\"ID\";s:4:\"name\";s:4:\"Name\";s:10:\"brand.name\";s:5:\"Brand\";s:13:\"category.name\";s:8:\"Category\";s:5:\"price\";s:5:\"Price\";s:5:\"stock\";s:8:\"In Stock\";s:11:\"description\";s:11:\"Description\";s:6:\"active\";s:6:\"Active\";}s:10:\"\0*\0options\";a:0:{}}\";}s:19:\"chainCatchCallbacks\";a:0:{}}}s:8:\"function\";s:266:\"function (\\Illuminate\\Bus\\Batch $batch) use ($next) {\n                if (! $batch->cancelled()) {\n                    \\Illuminate\\Container\\Container::getInstance()->make(\\Illuminate\\Contracts\\Bus\\Dispatcher::class)->dispatch($next);\n                }\n            }\";s:5:\"scope\";s:27:\"Illuminate\\Bus\\ChainedBatch\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000e3f0000000000000000\";}\";s:4:\"hash\";s:44:\"22DO2MdrRKij6VoCVMl81qYLLZTqd/41oBoP2HBX3fM=\";}}}}', NULL, 1761199077, 1761199077);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_06_09_124801_create_brands_table', 1),
(5, '2025_06_09_134932_create_categories_table', 1),
(6, '2025_06_09_140538_create_customers_table', 1),
(7, '2025_06_09_154611_create_suppliers_table', 1),
(8, '2025_06_09_212320_create_products_table', 1),
(9, '2025_06_10_101554_create_sales_table', 1),
(10, '2025_06_10_102357_create_sale_items_table', 1),
(11, '2025_06_11_184259_create_product_imports_table', 1),
(12, '2025_06_11_184447_create_product_import_items_table', 1),
(13, '2025_06_26_132822_create_widgets_table', 2),
(14, '2025_07_11_112043_create_inventory_snapshots_table', 2),
(15, '2025_07_11_131220_create_discounts_table', 3),
(16, '2025_09_02_085200_create_notifications_table', 3),
(17, '2025_09_02_085216_create_imports_table', 3),
(18, '2025_09_02_085217_create_exports_table', 3),
(19, '2025_09_02_085218_create_failed_import_rows_table', 3),
(20, '2025_09_10_215324_password_reset_otps', 4);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_otps`
--

CREATE TABLE `password_reset_otps` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `otp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_otps`
--

INSERT INTO `password_reset_otps` (`id`, `email`, `otp`, `expires_at`, `created_at`, `updated_at`) VALUES
(9, 'tannmona@gmail.com', '487293', '2025-10-23 04:18:03', '2025-10-23 03:58:17', '2025-10-23 04:08:03');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('tannmona@gmail.com', '$2y$12$s4N4/GL1QzuJQzL02Ss9iOaNnkCM8AK6Y7TT7ZV/Sg5z9O75sEtXW', '2025-09-15 02:20:53'),
('tannouzita@gmail.com', '$2y$12$JLC01qgowK1ibPTGBIDLSOpe.SiovCVWVNVESHPtekmTOsxeOSJzG', '2025-09-14 14:59:11');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `stock` int DEFAULT '0',
  `stock_security` tinyint UNSIGNED DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `brand_id` bigint UNSIGNED DEFAULT NULL,
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `image`, `price`, `stock`, `stock_security`, `description`, `active`, `brand_id`, `category_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Dell inspiron 3501', 'products/01JYN1JH1B8JW08YTETRTEVQ2N.jpg', 400.00, 5, 5, '<p>CPU i3-1125G4 / Ram :4GB / SSD : 256GB / Display : 15.6\" Full HD / Windows 10Pro (White , Mint , Blue , Black )</p>', 1, 2, 1, 1, '2025-06-14 05:58:21', '2025-10-19 22:31:17'),
(2, 'Apple MacBook Air ', 'products/01K349E50SRENWCFZ7KPNB0SV3.webp', 400.00, 7, 5, '<p>Intel Core i7 / RAM:&nbsp; 8GB / SSD: 512GB / Display: 13.3\" 2560 x 1600 IPS Retina Display Integrated Intel Iris Plus Graphics / (gold, silver, space gray)</p><p><br></p>', 1, 1, 1, 1, '2025-06-14 06:01:04', '2025-10-19 22:26:43'),
(3, 'Laptop dell XPS 15,6', 'products/01JYN1T6BW7KX654NBPCJY92DV.jpg', 500.00, 5, 5, '<p>Core i7-6700HQ @2.60GHz , Ram 16GBGB, SSD 256GB, 15,6\" FHD</p><p>VGA NVIDIA 960M 2GB</p><p>&nbsp;</p>', 1, 2, 1, 1, '2025-06-14 06:09:09', '2025-09-16 02:52:43'),
(4, 'AlienWare Laptop parts Screen', 'products/01K347TGP295P1H0GBEGQWJ871.jpg', 180.00, 5, 5, '<p>Alienware Laptop parts model.New Alienware M17x / M17xR2 17\" WUXGA RGB LCD Screen Panel Display with Cables - 0DHMC</p>', 1, 12, 6, 1, '2025-01-12 19:53:40', '2025-09-07 03:52:01'),
(5, 'Samsung Galaxy A35-5G 128GB', 'products/01K347WZR9HHV3ZZQ5F8JR6J1W.jpg', 379.00, 0, 5, '<p><strong>Display: 6.6-inch Super AMOLED display with a 120Hz refresh rate<br>Processor: MediaTek Dimensity 7000 processor<br>Memory: 6GB RAM<br>Storage: 128GB internal storage (expandable via microSD card)<br>Camera: Quad-camera setup with a 48MP main camera, 12MP ultrawide camera, 5MP depth camera, and 5MP macro camera</strong></p>', 0, 11, 2, 1, '2024-12-26 19:53:40', '2025-09-08 02:13:05'),
(6, 'HP 2022 15.6 HD Micro-Edge', 'products/01K349G66VBSEM9SD7ZGTD1EK2.jpg', 661.00, 5, 5, '<p>HP Laptop model Edge, 8-Cores AMD Ryzen 7 5700U(up to 4.3GHz), 16GB DDR4 RAM, 1TB PCIe SSD, Full-Size KB, WiFi 6, Bluetooth 5.2, HDMI, Windows 11, Silver,</p>', 1, 9, 1, 1, '2024-12-21 19:53:40', '2025-10-12 00:18:00'),
(7, 'Lenovo Monitor Legion R27i-30', 'products/01K349N8JQ6RHXRM9M8DXP2G8P.png', 300.00, 4, 5, '<p>-Viewable Size: <strong>27\'\'</strong><br>-Resolution: <strong>FHD(1920x1080)(165Hz)</strong><br>-Panel Technology: IPS&nbsp;<br>-Brightness: 350 cd/m²<br>-Speaker: 3Wx2<br>-Adjustability: Tilt,Swivel,Pivot,Height<br>-Port: 2x HDMI, 1x DP<br>-Cable inbox: 1x DP cable<br>-Warranty: 3 Years</p>', 1, 4, 13, 1, '2024-11-20 19:53:40', '2025-09-12 12:50:13'),
(8, 'NO Brand Camera Pro X', 'products/01K349SF1HN6EDQBF248RF8M6M.jpg', 824.00, 0, 5, '<ul><li>26.2MP Full-Frame CMOS Sensor</li><li>DIGIC 8 Image Processor</li><li>UHD 4K and Full HD 1080 Video</li><li>2.36m-Dot OLED Electronic Viewfinder</li><li>3\" 1.04m-Dot Vari-Angle Touchscreen LCD</li><li>Dual Pixel CMOS AF, 4779 AF Points</li><li>ISO 100-40000, Up to 5 fps Shooting</li><li>RF 24-105mm f/4-7.1 IS STM Lens</li></ul>', 0, 10, 11, 1, '2025-04-24 19:53:40', '2025-08-21 10:43:58'),
(9, 'MSI Graphic card Ventus 3X Geforce RTX4060ti', 'products/01K34A28Y6TGPHVR0HKWDXRWFN.jpg', 1469.00, 4, 5, '<p>MSI PC parts:</p><p>Video card manufacturer: Nvidia</p><p>Memory capacity: 8GB</p><p>Video card model: GeForce RTX 4060</p><p>Memory interface: 128-Bit</p><p>Type of memory: GDDR6</p>', 1, 7, 5, 1, '2024-12-26 19:53:40', '2025-09-14 14:38:10'),
(10, 'Barracuda', 'products/01K34AEF31ZJA5ERPAQCHK8P5F.webp', 170.00, 7, 5, '<p>Barracuda Razor Headphone</p><ul><li>2.4Ghz wirless (type-C), Bluetooth 5.2, 3.5mm audio jack input</li><li>Razer™ SmartSwitch Dual Wireless</li><li>THX spatial audio : experience next-gen surround sound</li><li>Up to 40 hours battery life per single charge</li><li>Integrated Beamforming Noise-Cancelling Mics</li><li>Razer™ TriForce Titanium 50mm Drivers</li><li>Ultra-soft flow knit memory foam cushions</li></ul><p><br></p>', 1, 6, 3, 1, '2025-03-22 19:53:40', '2025-08-21 15:45:22'),
(11, 'Seiren X', 'products/01K357FJ2VBDYHJNJWWGE0Z8P7.jpg', 99.00, 6, 5, '<p><strong>Razer Microphone</strong></p><ul><li>USB input</li><li>Ultra-precise pickup pattern</li><li>Shock resistant</li><li>Compact form factor</li><li>Streamer certified</li><li>Premium quality</li></ul>', 1, 6, 10, 1, '2025-04-11 19:53:40', '2025-08-21 12:43:41'),
(12, 'Element Z104', 'products/01K3583HRG8VFEHY0HPV8EVG22.webp', 50.00, 8, 5, '<p>Redragon Keyboard</p><ul><li>Full size mechanical switches (MX Chery blue equivalent)</li><li>All 104 keys are 100% conflict free, anti-ghosting</li><li>Ultra-durable keys tested to 50 million keystrokes</li><li>12 Dual action Multimedia and “F” keys</li><li>Rainbow RGB backlighting with 19 different modes</li></ul>', 1, 14, 9, 1, '2025-06-24 19:53:40', '2025-09-08 02:48:42'),
(13, 'Basilisk V3', 'products/01K35CPWKDB287ND85HVY94E3G.png', 60.00, 11, 5, '<ul><li>26000 dpi optical sensor</li><li>Razer Focus+ 26K optical sensor</li><li>Full spectrum RGB customizability</li><li>10 + 1 programmable buttons</li><li>Pooling Rate 1000</li></ul><p><br></p>', 1, 6, 7, 1, '2024-10-22 19:53:40', '2025-09-08 03:16:10'),
(14, 'HyperX Fury 16GB DDR4 SDRAM Memory Module', 'products/01K358F25Z0HKAVW133TYHM2QT.png', 65.00, 8, 5, '<p>Memory Size: 16 GB</p><p>Memory Speed: 3733 MHz</p><p>Memory Technology: DDR4 SDRAM</p>', 1, 17, 5, 1, '2025-03-09 19:53:40', '2025-09-08 02:48:42'),
(15, 'Asgard x TUF Gaming Alliance : Valkyrie RGB 16GB ', 'products/01K358TWNAZT787GTE08VV7QKC.webp', 55.00, 11, 5, '<p>Memory Size: 16 GB</p><p>Memory Speed: 3600 MHz</p><p>Memory Technology: DDR4&nbsp;</p><p><br></p>', 1, 3, 5, 1, '2025-06-05 19:53:40', '2025-08-21 12:44:13'),
(16, 'TUF GAMING VG27AQ5A-L', 'products/01K3595Z9T0GB1QF1GW6MD5W9Q.webp', 220.00, 7, 5, '<ul><li>-Viewable Size: <strong>27\'\'</strong><br>-Resolution: <strong>QHD(2560x1440)(210Hz)</strong><br>-Panel Technology: IPS&nbsp;<br>-Form Factor: Flat<br>-Speaker: Stereo<br>-Stand: Rotatable<br>-Port: 2x HDMI, 1x DP<br>-Warranty: 3 Years</li></ul>', 1, 3, 13, 1, '2025-05-25 19:53:40', '2025-09-15 07:02:05'),
(17, 'Blue Yeti', 'products/01K359A8BY8S82RQXPQQRR7K4V.webp', 148.00, 7, 5, '<p><strong><br>Microphone Details:</strong></p><ul><li><strong>Power Required/Consumption</strong>: 5V 150mA</li><li><strong>Sample Rate</strong>: 48 kHz</li><li><strong>Bit Rate</strong>: 16-bit</li><li><strong>Capsules</strong>: 3 0.55 in (14 mm) condenser capsules</li><li><strong>Polar Patterns</strong>: Cardioid, Bidirectional, Omnidirectional, Stereo</li><li><strong>Frequency Response</strong>: 20 Hz - 20 kHz</li><li><strong>Max SPL</strong>: 120 dB (THD: 0.5% 1 kHz)</li><li><strong>Dimensions (extended in stand)</strong>: 4.72 in (12 cm) x 4.92 in (12.5 cm) x 11.61 in (29.5 cm)</li><li><strong>Weight (microphone)</strong>: 1.94 lbs (.88 kg)</li><li><strong>Weight (stand)</strong>: 1.1 lbs (.5 kg)</li></ul><p><br></p>', 1, 13, 10, 1, '2025-04-09 19:53:40', '2025-09-08 08:45:29'),
(18, 'Logitech G440 mousepad', 'products/01K359EW78K1Q462T5WS00SC0R.webp', 25.00, 10, 5, '<p><br></p><ul><li>Size : 340 x 280 x 3mm</li></ul>', 1, 13, 8, 1, '2025-04-08 19:53:40', '2025-10-11 23:29:29'),
(19, 'Barracuda X', 'products/01K35CT68A93P58KKNW0C9RD0W.jpg', 112.00, 7, 5, '<p>Type | Headphone<br>Connection | 3.5MM Audio, Bluetooth ,USB Wireless, USB-C Wireless<br>Audio Driver | 40MM<br>Sound channel | 7.1<br>Microphone | Yes<br>Weight | 249 grams<br>Battery | Rechargeable</p>', 1, 6, 3, 1, '2025-01-04 19:53:40', '2025-09-08 08:27:29'),
(20, 'Bluetooth Adaptor', 'products/01K35CWH9HPCYDX87D9JCQQR1D.webp', 10.00, 15, 5, '<p>Bluetooth 5.0 chip</p>', 1, 10, 12, 1, '2024-11-30 19:53:40', '2025-09-15 03:54:46'),
(21, 'Logitech G640 Mousepad', 'products/01K359GKGAXM1H21NY0MSBHAYW.webp', 35.00, 3, 5, '<ul><li>Size : 400 x 460 x 3 mm</li></ul><p><br></p>', 1, 13, 8, 1, '2024-07-10 19:53:40', '2025-10-17 06:06:02'),
(22, '980 (500GB)', 'products/01K35CZHKRJE9ZM03T761GRD4N.webp', 78.00, 12, 5, '<p>Capacity | 500GB<br>Interface | PCIe® Gen 3.0 x4, NVMe™ 1.4<br>Form Factor | M.2<br>Read Speed | Up to 3,500 MB/s<br>Write Speed | Up to 3,000 MB/s</p>', 1, 11, 6, 1, '2025-05-08 19:53:40', '2025-08-21 15:59:12'),
(23, 'Asus ROG Zephyrus GA502D', 'products/01K35C877FRQZYKPSZA4PK6CX8.jpg', 566.00, 8, 5, '<p>- Processor: AMD Ryzen 7 3750H with Radeon Vega Mobile Gfx (8 CPUs), ~2.3GHz<br>- Ram: 24Gb DDR<br>- SSD: 512Gb NVMe<br>- Display: 15.6-inch Full HD 120Hz<br>- VGA: NVIDIA GeForce GTX 1660 Ti with Max-Q Design 6Gb</p>', 1, 5, 1, 1, '2024-09-02 19:53:40', '2025-08-22 07:52:42'),
(24, 'QcK (Small) Mousepad', 'products/01K359KCM1K2P4PXDJJEVPWAMN.webp', 10.00, 13, 5, '<ul><li>Size : 250 x 210 x 2mm</li></ul><p><br></p>', 1, 15, 8, 1, '2024-10-19 19:53:40', '2025-09-08 09:21:01'),
(25, 'QcK (Medium) Mousepad', 'products/01K359MZMTH45AA128WGNJY4YY.webp', 15.00, 11, 5, '<ul><li>Size : 320 x 270 x 2mm</li></ul><p><br></p>', 1, 13, 8, 1, '2025-03-26 19:53:40', '2025-08-21 16:27:05'),
(26, 'Neptune X', 'products/01K35D2YP54M9H2VXMK3P7EN2K.webp', 17.00, 15, 5, '<ul><li>Size : 300 x 800 x 4 MM</li><li>RGB lighting effect</li></ul><p><br></p>', 1, 14, 8, 1, '2025-06-13 19:53:40', '2025-09-16 02:34:27'),
(27, 'Brio 4K', 'products/01K35D5WTRV47DA3MDHTEZ75J5.png', 162.00, 8, 5, '<ul><li>4K Ultra HD&nbsp; Webcam</li><li>Up to 30 frame per second 4K</li><li>Brio retains a high frame rate (up to 90 fps)</li></ul><p><br></p>', 1, 13, 11, 1, '2024-09-25 19:53:40', '2025-08-21 15:58:45'),
(28, 'HyperX Alloy Rise - Gaming Keyboards', 'products/01K359Y4WF2TMHGNNV7FSESRGS.webp', 135.00, 7, 5, '<p>Keyboard details:</p><ul><li><strong>Switch:</strong> HyperX Red - Linear</li><li><strong>Actuation Point:</strong> Mechanical</li><li><strong>Backlight:</strong> RGB (16,777,216 colors)</li><li><strong>Light Effects:</strong> Per-key RGB lighting and 5 brightness levels</li><li><strong>Onboard Memory:</strong> 10 profiles</li><li><strong>Polling Rate:</strong> 8000Hz</li><li><strong>Anti-ghosting:</strong> 100% anti-ghosting</li><li><strong>Rollover:</strong> N-key mode</li><li><strong>Connectivity:</strong> Wired</li></ul><p><br></p>', 1, 17, 9, 1, '2025-04-24 19:53:40', '2025-10-16 10:43:31'),
(29, 'Laptop Dell Latitude 5410', 'products/01K35A4HT91QFS1YEMV44CV7K2.jpg', 397.00, 4, 5, '<p>- Ci7-10610U @1.8Ghz</p><p>- Ram: 16Gb DDR4&nbsp;</p><p>- Storage: SSD:256GB M.2</p><p>- Display: 14inch FHD&nbsp;</p><p>- VGA : Intel UHD Graphic&nbsp;</p>', 1, 2, 1, 1, '2025-06-07 19:53:40', '2025-08-21 03:18:09'),
(30, 'Streamcam', 'products/01K35D8KKQWK0KRAC4AAKXKA01.jpg', 100.00, 7, 5, '<ul><li>1080 full HD sensor</li><li>Up to 60 frame per second stream true-to-life</li><li>Support full HD vertical video</li><li>Connect with USB type-C</li></ul><p><br></p>', 1, 13, 11, 1, '2024-07-22 19:53:40', '2025-09-08 03:53:39'),
(31, 'Goliathus V3 L', 'products/01K35DCFZGKSMAX03J57QT1A3K.webp', 27.00, 13, 5, '<ul><li>Size : 400 x 450 x 3mm</li><li>Mesh textured fabric surface</li></ul><p><br></p>', 1, 6, 8, 1, '2024-12-03 19:53:40', '2025-09-08 04:32:48'),
(32, 'Seiren V3 Chroma', 'products/01K35AG90WZWTN9RBHPNS1RYVN.png', 115.00, 5, 5, '<p>16mm condenser capsule with a supercardioid pickup pattern,</p><p>&nbsp;a 24-bit bit rate, and a 96 kHz sample rate (which can be dropped to 48 kHz for OBS).</p><p>Interface | USB-A (USB-A to USB-C)</p>', 1, 6, 10, 1, '2025-03-22 19:53:40', '2025-09-07 03:32:45'),
(33, 'STRIX 850W Gold Aura Edition', 'products/01K35APMVKZNX9T862KCP6Q7YQ.png', 235.00, 5, 5, '<p>Capacity: 850W<br>Form Factor: ATX<br>Cable Management:&nbsp; Modular<br>Power Rating: 80+ Gold</p>', 1, 5, 5, 1, '2024-12-09 19:53:40', '2025-10-09 14:37:54'),
(34, 'Cloud Alpha HyperX Headphone', 'products/01K35AVB177998MQKGN6DW6B6Z.webp', 79.00, 6, 5, '<p>HyperX Headphone:</p><p>Type | Headphone<br>Connection | 3.5MM Audio<br>Audio Driver | 50MM<br>Sound channel | 7.1<br>Microphone | Yes<br>Weight | 336 grams</p>', 1, 17, 3, 1, '2025-02-19 19:53:40', '2025-09-08 08:44:23'),
(35, 'Dell Gaming G3 3500', 'products/01K35DFZ6A6X7TWK5QA8X0Y9M3.jpg', 493.00, 6, 5, '<p>- CPU : Intel Core i7-10750H @2.6GHz<br>- Ram: 16Gb DDR4&nbsp;<br>- Storage: SSD:512GB M.2<br>- Display: 14 inch FHD</p>', 1, 2, 1, 1, '2024-08-11 19:53:40', '2025-09-08 08:46:14'),
(36, 'DELL Vostro 3030MT PC set', 'products/01K35B2ZMMB74VE3DMMSS7SSH0.jpg', 620.00, 4, 5, '<p>&nbsp;-CPU : Intel Core i7-14700 Processor<br>&nbsp;-RAM : 8GB DDR5 (Upgradable)<br>&nbsp;-Storage : 512GB M.2 PCIe (Upgradable)<br>&nbsp;-GPU : Intel® UHD Graphics 730 (Upgradable)<br>&nbsp;-Network : Wireless + Bluetooth<br>&nbsp;-OS :Windows 11 Pro Recommendation<br><br></p>', 1, 2, 4, 1, '2024-12-20 19:53:40', '2025-10-17 04:44:22'),
(37, 'Flick XL', 'products/01K35B8XTT8XYRCHMK8TQ9BZDW.webp', 25.00, 8, 5, '<ul><li>Size : 400 x 900 x 4 MM</li><li>Natural processed rubber bottom</li></ul><p><br></p>', 1, 14, 8, 1, '2024-09-04 19:53:40', '2025-09-08 02:48:42'),
(38, 'Laptop Dell G33500 ', 'products/01K35BFW00SQKQHV6ABR95RCR4.webp', 479.00, 4, 5, '<p>- CPU: Ci7-10750H @2.6Hz (12 CPUs)<br>- Ram: 16GB DDR4&nbsp;<br>- Storage: SSD 512GB M.2<br>- VGA: Intel UHD Graphics<br>- VGA2: NVIDIA GeForce GTX 1650 4GB<br>- Screen: 15.6-inch Full HD 120Hz</p>', 1, 2, 1, 1, '2024-09-22 19:53:40', '2025-08-21 03:42:03'),
(39, 'Laptop Dell Vostro 5568 ', 'products/01K35DKRP0G7EE6FNM7A6ZCXC8.jpg', 181.00, 6, 5, '<p>- Ci5-7300U<br>- Ram: 8Gb DDR4<br>- Storage: SSD:256GB M.2<br>- Display: 15.6-inch Full HD&nbsp;<br>- Keyboard: No Light&nbsp;<br>- VGA: Intel</p>', 1, 2, 1, 1, '2024-10-19 19:53:40', '2025-09-08 04:49:05'),
(40, 'Ryuu', 'products/01K35DYQGHQ93EBJNFK203T3V3.webp', 39.00, 9, 5, '<ul><li>14mm large microphone absorber driver</li><li>Next level upgraded noise reduction</li><li>One 3.5mm jack audio monitor</li><li>Support up to 192kHz/ 24bit</li></ul><p><br></p>', 1, 14, 10, 1, '2024-10-25 19:53:40', '2025-08-21 15:41:52'),
(41, 'Ethernet Cable (10M)', 'products/01K35E2XKCEDNX873YCNKHB037.webp', 12.00, 25, 5, '<ul><li>Round UTP Gigabit Ethernet Network Cable</li><li>Wire core: 26AWG copper clad aluminum</li><li>Ethernet Speed: 1000Mbps</li></ul><p><br></p>', 1, 10, 12, 1, '2024-10-09 19:53:40', '2025-10-22 14:59:39'),
(42, 'CW905', 'products/01K35E5HJS1ZEADDN66D821QFD.jpg', 19.00, 12, 5, '<p>Connection | Wired<br>DPI | 6400<br>Weight | 132 grams<br>Sensor | Optical<br>Click | Clicky<br>Pooling Rate | 1000</p>', 1, 16, 7, 1, '2025-01-13 19:53:40', '2025-09-08 03:18:54'),
(43, 'Black Mousepad', 'products/01K35BMSGFFVCE9WF8GM4Y94ZJ.webp', 6.00, 10, 5, '<ul><li>Large : 300 x 800 x 4mm = 6$<br><br></li></ul><p><br></p>', 1, 10, 8, 1, '2025-02-19 19:53:40', '2025-09-07 00:16:10'),
(44, 'Laptop HP ProBook 450 G5 (core i5)', 'products/01K35BRF8Q8CBJ87N0F6HDDYVR.jpg', 299.00, 7, 5, '<p>_CPU: Core(TM)i5-7200U@2.50GHz<br>-Ram: 8Gb DDR4<br>-SSD: 256GB M.2<br>-Display: 15.6inch FHD<br>-keyboard: No Light .<br>-VGA: Intel HD Graphic 620</p>', 1, 9, 1, 1, '2025-02-09 19:53:40', '2025-08-21 10:16:57'),
(45, 'Laptop Dell Latitude 7400', 'products/01K35BWV0GMJSWE1P7ZFA1DJ48.webp', 299.00, 7, 5, '<p>- Ci5-8350U @1.6Ghz&nbsp;<br>- Ram: 8Gb DDR4&nbsp;<br>- Storage: SSD 256GB&nbsp;<br>- Display: 14-inch Full HD&nbsp;<br>- Keyboard: Light&nbsp; <br>- VGA: Intel UHD Graphics 620</p>', 1, 2, 1, 1, '2025-03-26 19:53:40', '2025-10-16 07:43:00'),
(46, 'Asus TUF Gaming FX505DT', 'products/01K35CCXRC193731ZVEK0DQZ32.jpg', 488.00, 5, 5, '<p>- CPU :AMD Ryzen 7 3750H with Radeon Vega&nbsp; (8Core)&nbsp; &nbsp;&nbsp;<br>- Ram : 16GB&nbsp; &nbsp;<br>- SSD : 512GB M.2 PCIe&nbsp; &nbsp;&nbsp;<br>- Display:15.6\" Full HD (1920x1080) 144Hz&nbsp; &nbsp; <br>-VGA : NVIDIA 1650 (4GB)</p>', 1, 3, 1, 1, '2025-06-11 19:53:40', '2025-09-07 03:52:01'),
(47, 'Alias', 'products/01K35E97B2SEMYW9EFHMK5RB17.webp', 215.00, 7, 5, '<p>3X BIGGER CAPSULE — USB-C</p>', 1, 15, 10, 1, '2025-06-23 19:53:40', '2025-09-15 07:02:05'),
(48, 'Laptop Dell Latitude E7490 (Ci7)', 'products/01K35ECSM404CDWX7CT5MSKVZH.jpg', 267.00, 8, 5, '<p>- Ci7-8th Gen<br>- Ram: 8Gb DDR4&nbsp;<br>- Storage: SSD:256GB M.2<br>- Display: 14-inch Full HD (Touch)&nbsp;<br>- VGA : Intel UHD&nbsp;</p>', 1, 2, 1, 1, '2024-07-15 19:53:40', '2025-08-21 12:32:52'),
(49, 'Laptop Hp ProBook 430 G5 (core i3)', 'products/01K35EQ04ZC3GCBJJVZEEFM14F.jpg', 199.00, 8, 5, '<p>- Ci3-7020U<br>- Ram: 4Gb /8GB DDR4&nbsp;<br>- Storage: SSD:256GB M.2<br>- Display: 15-inch HD<br>- VGA: Intel HD Graphics 620</p>', 1, 9, 1, 1, '2024-12-26 19:53:40', '2025-09-08 04:24:46'),
(50, '990 Pro  Memory (1TB)', 'products/01K35ESGET1XB77SA9FSCBJH3R.webp', 124.00, 15, 5, '<p>Capacity | 1TB<br>Interface | PCIe Gen 4.0 x4, NVMe 2.0<br>Form Factor | M.2 (2280)<br>Read Speed | Up to 6,900 MB/s<br>Write Speed | Up to 7,450 MB/s</p>', 1, 11, 6, 1, '2024-10-26 19:53:40', '2025-10-23 03:56:01'),
(51, 'MSI G244F E2 Monitor', 'products/01K35CJ476W9TRN0HT6N2W3KGQ.png', 145.00, 4, 5, '<p>Size | 24\"<br>Form Factor | Flat<br>Panel Type | IPS<br>Resolution | 1080p FHD<br>Refresh Rate | 180Hz<br>Response Time | 1 Ms<br>Stand | Fixed</p>', 1, 7, 13, 1, '2024-08-16 19:53:40', '2025-10-09 14:39:13'),
(52, 'Acer Aspire 3', 'products/01K35EW4D1C9XV4C42G2XG8DE2.webp', 330.00, 8, 5, '<p>- CPU : <strong>Intel® Core™ i3-1305U Processor</strong><br>- RAM : 8GB = 16GB = $20<br>- Storage : <strong>256GB M.2 PCIe<br></strong>- Display : <strong>15.6\" FHD 1920x1200 IPS-Level<br></strong>- GPU : <strong>Intel UHD Graphics</strong><br>- <strong>Windows 11 Pro Recommendation</strong><br>- 38Wh Li-io battery | HD WebCam<br>- 1.5 Kg | Color : Silver</p>', 1, 8, 1, 1, '2024-12-08 19:53:40', '2025-09-16 02:37:15'),
(53, 'Apex 3', 'products/01K35F06S19E85K5DHGMPT5AXM.jpg', 95.00, 9, 5, '<p>Connection | Wired<br>Form Factor | 100<br>Hot-Swappable | No<br>Switch Type | Silent<br>Switch Name | Membrane<br>Backlit | RGB</p>', 1, 15, 9, 1, '2025-05-23 19:53:40', '2025-08-21 15:43:20'),
(54, 'G102 Lightsync', 'products/01K35F9E4DEJ6TN9X5P7X1GA2V.jpg', 20.00, 14, 10, '<ul><li>8000 dpi laser sensor</li><li>Gaming-grade sensor</li><li>6 Programmable buttons</li><li>Logitech Lightsync RGB lighting</li></ul><p>Color( black , Blue, White , Purple)</p>', 1, 13, 7, 1, '2025-08-21 04:48:12', '2025-10-19 22:33:00'),
(55, 'G304 Lightspeed', 'products/01K35FBEV7WJ8D3CB6WX1YHRS2.png', 45.00, 14, 10, '<ul><li>12000 dpi optical sensor</li><li>Advance Hero sensor</li><li>Lightspeed wireless technology</li><li>Lag free 1ms report rate</li><li>6 Programmable buttons</li><li>250 hours battery life (AA battery)</li><li>Ultra lightweight 99 grams</li></ul><p>Color ( Back, Blue, White, Cyan, Purple)</p>', 1, 13, 7, 1, '2025-08-21 04:49:18', '2025-09-08 04:32:48'),
(56, 'G502 Hero', 'products/01K35FFA55ZJ79VNKWRV93KK4J.jpg', 49.00, 14, 10, '<ul><li>25600 dpi optical sensor</li><li>Advance 25K Hero sensor</li><li>11 Programmable buttons</li><li>Tune-able weight</li><li>Supreme comfort</li><li>Logitech lightsync RGB lighting</li></ul><p><br></p>', 1, 13, 7, 1, '2025-08-21 04:51:24', '2025-10-22 14:59:39'),
(57, 'DeathAdder V3', 'products/01K35FJE9VGG9DJQ0Q5MA6FF69.webp', 80.00, 9, 10, '<ul><li>30K dpi optical sensor</li><li>World most precise Razer Focus Pro optical sensor</li><li>59g Ultra-lightweight Design</li><li>Refined Ergonomic Form</li><li>Razer™ 8K Hz HyperPolling Technology</li><li>Razer speedflex cable</li></ul><p><br></p>', 1, 6, 7, 1, '2025-08-21 04:53:07', '2025-08-21 15:20:16'),
(58, 'Cobra', 'products/01K35FNNEZSDAVVCD0XV99P1PG.webp', 19.00, 14, 10, '<p>Connection | Wired<br>DPI | 10000<br>Weight | 130 grams<br>Sensor | PAW3325<br>Click | Clicky<br>Pooling Rate | 1000</p>', 1, 14, 7, 1, '2025-08-21 04:54:53', '2025-10-23 02:59:50'),
(59, 'SC580', 'products/01K35FR20EKDPJ1RH7WT80530H.webp', 20.00, 13, 10, '<p>Connection | Wired, Wireless, Bluetooth<br>DPI | 10000<br>Weight | 80 grams<br>Sensor | Optical<br>Battery | Rechargeable 500mAh<br>Battery Life | 70 Hours<br>Interface | USB-C<br>Click | Clicky<br>Pooling Rate | 1000</p>', 1, 19, 7, 1, '2025-08-21 04:56:11', '2025-08-21 16:00:04'),
(60, 'Pulsefire Haste', 'products/01K35FTSTX0GXRPXPFK28BE963.webp', 50.00, 9, 10, '<p>Connection | Wired<br>DPI | 16000<br>Weight | 59 grams<br>Sensor | PAW3335<br>Click | Clicky<br>Pooling Rate | 1000</p>', 1, 17, 7, 1, '2025-08-21 04:57:41', '2025-08-21 15:50:33'),
(61, 'Pulsefire Haste 2', 'products/01K35FWBMSSXQ6CJHFMHFRK99K.webp', 60.00, 9, 10, '<p>Connection | Wired<br>DPI | 26000<br>Weight | 61 grams<br>Sensor | HyperX 26K<br>Click | Clicky<br>Pooling Rate | 1000<br>Color ( white, black)</p>', 1, 17, 7, 1, '2025-08-21 04:58:32', '2025-08-21 15:43:20'),
(62, 'Pulsefire Saga', 'products/01K35FY1M7YXAB31812QAA4NSH.webp', 80.00, 13, 10, '<p>Connection | Wired<br>DPI | 26000<br>Weight | 69 grams<br>Sensor | HyperX 26K<br>Click | Clicky<br>Pooling Rate | 8000</p>', 1, 17, 7, 1, '2025-08-21 04:59:27', '2025-08-21 16:00:35'),
(63, 'D2421H', 'products/01K35G2ARG790J5YP81MW4CPBG.webp', 145.00, 6, 5, '<p>Size | 24\"<br>Form Factor | Flat<br>Panel Type | IPS<br>Resolution | 1080p FHD<br>Refresh Rate | 60Hz<br>Response Time | 5 Ms<br>Stand | Fixed<br>Built-in Speaker | No</p>', 1, 2, 13, 1, '2025-08-21 05:01:48', '2025-09-08 04:02:13'),
(64, 'MAG 244F', 'products/01K35G49GEJ6FC0NPQQZZEAMHW.webp', 149.00, 7, 5, '<p>Size | 24\"<br>Form Factor | Flat<br>Panel Type | IPS<br>Resolution | 1080p FHD<br>Refresh Rate | 200Hz<br>Response Time | 0.5 Ms<br>Stand | Fixed<br>Built-in Speaker | Yes</p>', 1, 7, 13, 1, '2025-08-21 05:02:52', '2025-09-15 06:57:16'),
(65, 'Strix OLED XG27AQDMG', 'products/01K35G5N1BHNH22XFT24GW3K3G.webp', 650.00, 5, 5, '<p>Size | 27\"<br>Form Factor | Flat<br>Panel Type | OLED<br>Resolution | 2K QHD<br>Refresh Rate | 240Hz<br>Response Time | 0.03 Ms<br>Stand | Rotatable<br>Built-in Speaker | No</p>', 1, 5, 13, 1, '2025-08-21 05:03:37', '2025-10-09 14:44:41'),
(66, 'Laptop Dell Latitude E5480', 'products/01K35G9TH4NGGANWT9FK9JDGZY.jpg', 210.00, 8, 5, '<p>- Ci5-7300U @2.6Ghz <br>- Ram: 8Gb DDR4 (16G + 15$)<br>- Storage: SSD:256GB M.2<br>- Display: 14-inch Full HD (Touch)<br>- VGA: Intel UHD Graphics 620</p>', 1, 2, 1, 1, '2025-08-21 05:05:53', '2025-09-08 08:51:35'),
(67, 'Laptop Dell Precision 5520', 'products/01K35GDSKEPDFAF167W52A3GKJ.jpg', 399.00, 7, 5, '<p>- CPU: Intel(R) Core(TM) i7-7700HQ CPU @ 2.80GHz (8 CPUs), ~2.8GHz<br>- Ram: 16Gb DDR4<br>- SSD: 512GB<br>- Display: 15.6-inch Full Hd</p>', 1, 2, 1, 1, '2025-08-21 05:08:03', '2025-09-08 08:42:15'),
(68, 'Apex 7', 'products/01K35T2GVAFZ9C6KFCEBEKKN1Y.jpg', 180.00, 14, 7, '<p>Connection | Wired<br>Form Factor | 100<br>Hot-Swappable | No<br>Switch Type | Clicky<br>Switch Name | SteelSeries QX2 Mechanical<br>Backlit | RGB<br><br></p>', 1, 15, 9, 3, '2025-08-21 07:56:40', '2025-09-15 06:57:16'),
(69, 'Ksnake K87', 'products/01K35T5V430XRZP0F8HXVAAZKZ.png', 15.00, 14, 5, '<p>Connection | Wired<br>Interface | N/A<br>Form Factor | 87<br>Hot-Swappable | No<br>Switch Type | Silent<br>Switch Name | Membrane<br>Backlit | RGB</p>', 1, 10, 9, 3, '2025-08-21 07:58:29', '2025-09-08 04:54:08'),
(70, 'K512 Shiva', 'products/01K35T8YD828RJNXPK6MPWGJKX.webp', 25.00, 9, 5, '<p>Connection | Wired<br>Form Factor | 100<br>Hot-Swappable | No<br>Switch Type | Silent<br>Switch Name | Membrane<br>Backlit | RGB<br><br></p>', 1, 14, 9, 3, '2025-08-21 08:00:10', '2025-08-21 15:43:57'),
(71, 'Element Z88', 'products/01K35TB67MEQR253C17EKXEZZJ.webp', 40.00, 11, 5, '<ul><li>Compact 60% 81 keys mechanical red switch</li><li>Non-slip ergonomic and spill-resistant design</li><li>Sturdy keyboard base made off high-grade aluminum</li><li>Anti ghosting with water resistance</li><li>RGB per key backlighting effect</li></ul><p><br></p>', 1, 14, 9, 3, '2025-08-21 08:01:24', '2025-09-08 04:23:56'),
(72, 'K503 Harpe', 'products/01K35TCZ2WMCE31RNYMPHXN02X.webp', 24.00, 15, 5, '<p>Connection | Wired<br>Form Factor | 100<br>Hot-Swappable | No<br>Switch Type | Silent<br>Switch Name | Membrane<br>Backlit | RGB</p>', 1, 14, 9, 3, '2025-08-21 08:02:22', '2025-10-22 14:41:47'),
(73, 'K530 Draconic', 'products/01K35TEJKXDTNM05X684PJ5TJW.webp', 50.00, 14, 4, '<p>Connection | Wired, Bluetooth<br>Interface | USB-C<br>Form Factor | 60<br>Hot-Swappable | Yes<br>Switch Type | Tactile<br>Switch Name | Mechanical Brown<br>Backlit | RGB<br>Battery | Rechargeable<br>Customization | Redragon</p>', 1, 14, 9, 3, '2025-08-21 08:03:15', '2025-08-21 15:38:31'),
(74, 'K552 Kumara', 'products/01K35TGGEG8V0MENARZSGR12HY.webp', 40.00, 15, 5, '<p>Connection | Wired<br>Form Factor | 87<br>Hot-Swappable | Yes<br>Switch Type | Clicky<br>Switch Name | Mechanical Blue<br>Backlit | RGB<br>Customization | Redragon</p>', 1, 14, 9, 3, '2025-08-21 08:04:18', '2025-10-15 04:27:40'),
(75, 'K640RGB', 'products/01K35TK1W5NGQKYGK3Z2W7NXZF.webp', 18.00, 15, 5, '<p>Connection | Wired<br>Form Factor | 100<br>Hot-Swappable | No<br>Switch Type | Silent<br>Switch Name | Membrane<br>Backlit | RGB<br><br></p>', 1, 14, 9, 3, '2025-08-21 08:05:41', '2025-10-21 13:28:51'),
(76, '5075B Black & Silver', 'products/01K35TPMXV18X6PMN5XGPZ6128.webp', 100.00, 12, 5, '<p>Connection | Wired, Wireless, Bluetooth<br>Interface | USB-C<br>Form Factor | 75<br>Hot-Swappable | Yes<br>Switch Type | Linear<br>Switch Name | Akko V3 Cream Yellow Pro<br>Backlit | RGB<br>Battery | Rechargeable<br>Customization | Akko Macro</p>', 1, 18, 9, 3, '2025-08-21 08:07:39', '2025-09-08 03:53:39'),
(77, 'F2058', 'products/01K35TTYPC25XXDG5PWJPJZPMT.webp', 25.00, 11, 5, '<p>Connection | Wired<br>Form Factor | 100<br>Hot-Swappable | No<br>Switch Type | Clicky<br>Switch Name | Mechanical Blue<br>Backlit | RGB</p>', 1, 19, 9, 3, '2025-08-21 08:10:00', '2025-09-16 02:45:18'),
(78, 'F3060', 'products/01K35TX6ZZWAHBJGWHZEW69M0Y.webp', 25.00, 14, 5, '<p>Connection | Wired<br>Form Factor | 75<br>Hot-Swappable | No<br>Switch Type | Clicky<br>Switch Name | Mechanical Blue<br>Backlit | RGB<br><br></p>', 1, 19, 9, 3, '2025-08-21 08:11:14', '2025-10-21 13:28:51'),
(79, 'F3287', 'products/01K35TZ6H1J4SC8VMDX8X4JRQ1.webp', 35.00, 15, 5, '<p>Connection | Wired, Wireless, Bluetooth<br>Interface | USB-C<br>Form Factor | 87<br>Hot-Swappable | No<br>Switch Type | Clicky<br>Switch Name | Mechanical Blue<br>Backlit | RGB<br>Battery | Rechargeable</p>', 1, 19, 9, 3, '2025-08-21 08:12:19', '2025-10-19 22:33:00'),
(80, 'S2022', 'products/01K35V1E4MV89D2NBPDY0GJJMR.webp', 22.00, 14, 5, '<p>Connection | Wired<br>Form Factor | 100<br>Hot-Swappable | No<br>Switch Type | Clicky<br>Switch Name | Mechanical Blue<br>Backlit | RGB</p>', 1, 19, 9, 3, '2025-08-21 08:13:33', '2025-10-07 12:56:46'),
(81, 'SK961', 'products/01K35V3H9JQEEYWF6RG1G0TJDZ.webp', 35.00, 15, 5, '<p>Connection | Wired, Wireless, Bluetooth<br>Interface | USB-C<br>Form Factor | 60<br>Hot-Swappable | Yes<br>Switch Type | Clicky<br>Switch Name | Mechanical Blue<br>Backlit | RGB<br>Battery | Rechargeable</p>', 1, 19, 9, 3, '2025-08-21 08:14:41', '2025-10-20 05:20:15'),
(82, 'G30', 'products/01K35V5S9FSZVHTVFXK53SZ17S.webp', 28.00, 14, 5, '<p>Connection | Wired<br>Interface | USB-C<br>Form Factor | 75<br>Hot-Swappable | No<br>Switch Type | Tactile<br>Switch Name | Mechanical<br>Backlit | RGB</p>', 1, 16, 9, 3, '2025-08-21 08:15:55', '2025-10-11 23:59:49'),
(83, 'G27', 'products/01K35V7FJ09NT45GZH6X4PX6GX.webp', 25.00, 16, 5, '<p>Connection | Wired<br>Form Factor | 100<br>Hot-Swappable | No<br>Switch Type | Clicky<br>Switch Name | Mechanical<br>Backlit | RGB</p>', 1, 16, 9, 3, '2025-08-21 08:16:51', '2025-10-23 03:56:01'),
(84, 'Blackwidow Essential', 'products/01K35V8Y63FCXCRS1VGM18P07G.webp', 80.00, 15, 5, '<p>Connection | Wired<br>Form Factor | 100<br>Hot-Swappable | No<br>Switch Type | Clicky<br>Switch Name | Razer Green Switch<br>Backlit | Backlit<br><br></p>', 1, 6, 9, 3, '2025-08-21 08:17:39', '2025-10-21 12:51:30'),
(85, 'Blackwidow V3 TKL', 'products/01K35VBT2JSNYYN2CCCQ2GGDXV.webp', 89.00, 15, 5, '<p>Connection | Wired<br>Form Factor | 87<br>Hot-Swappable | No<br>Switch Type | Linear, Clicky<br>Switch Name | Razer Yellow / Green<br>Backlit | RGB<br><br></p>', 1, 6, 9, 3, '2025-08-21 08:19:13', '2025-09-08 04:32:48'),
(86, 'Blackwidow V4 75%', 'products/01K35VDGGVF8FGRAYMM59GMSK3.webp', 199.00, 12, 4, '<p>Connection | Wired<br>Interface | USB-C<br>Form Factor | 75<br>Hot-Swappable | Yes<br>Switch Type | Tactile<br>Switch Name | Razer Orange Gen3 : Tactile<br>Backlit | RGB</p>', 1, 6, 9, 3, '2025-08-21 08:20:08', '2025-08-21 15:39:36'),
(87, 'Huntsman Mini', 'products/01K35VF8QZKA077TZSMR02GZR7.webp', 99.00, 15, 5, '<p>Connection | Wired<br>Form Factor | 60<br>Hot-Swappable | No<br>Switch Type | Linear, Clicky<br>Switch Name | Razer Optical Red / Purple<br>Backlit | RGB<br><br></p>', 1, 6, 9, 3, '2025-08-21 08:21:06', '2025-10-15 04:31:30'),
(88, 'Ornata V3X', 'products/01K35VGYE9D8X6Q305MA69XQ68.webp', 69.00, 15, 4, '<p>Connection | Wired<br>Interface | USB-C<br>Form Factor | 100<br>Hot-Swappable | No<br>Switch Type | Silent<br>Switch Name | Mecha-Membrane<br>Backlit | RGB<br><br></p>', 1, 6, 9, 3, '2025-08-21 08:22:01', '2025-10-22 14:59:39'),
(89, 'S506', 'products/01K35VKAZXB5D4XZKX6MCWDBC6.webp', 25.00, 9, 5, '<p>Type | Headphone<br>Connection | USB Wired<br>Audio Driver | 50MM<br>Sound channel | 7.1<br>Microphone | Yes</p>', 1, 19, 3, 3, '2025-08-21 08:23:19', '2025-08-21 15:43:57'),
(90, 'S8', 'products/01K35VMGY86ZAP9ZPM4V6SPDGT.webp', 29.00, 9, 5, '<p>Type | Headphone<br>Connection | 3.5MM Audio, USB Wireless, Bluetooth<br>Audio Driver | 40MM<br>Sound channel | 7.1<br>Microphone | Yes<br>Battery | Rechargeable</p>', 1, 19, 3, 3, '2025-08-21 08:23:58', '2025-08-21 15:52:16'),
(91, 'Cloud III', 'products/01K35VQ8W755PZ6RBA22B7GA50.webp', 140.00, 7, 5, '<p>Type | Headphone<br>Connection | 3.5MM Audio, USB Wired, USB-C Wireless<br>Audio Driver | 53MM<br>Sound channel | 7.1<br>Microphone | Yes<br><br></p>', 1, 17, 3, 3, '2025-08-21 08:25:28', '2025-08-21 15:26:15'),
(92, 'Cloud III S Wireless', 'products/01K35VRQW0583F36VDTHWP7FXP.webp', 199.00, 9, 3, '<p>Type | Headphone<br>Connection | USB Wireless, USB-C Wireless, Bluetooth<br>Audio Driver | 53MM<br>Sound channel | 7.1<br>Microphone | Yes<br>Battery | Rechargeable</p>', 1, 17, 3, 3, '2025-08-21 08:26:16', '2025-08-21 15:51:25'),
(93, 'Cloud Revolver 7.1', 'products/01K35VTT0TFT6E8QET60R4HG42.jpg', 150.00, 9, 5, '<p>Type | Headphone<br>Connection | 3.5MM Audio , USB Wired<br>Audio Driver | 53MM<br>Sound channel | 7.1<br>Microphone | Yes<br><br></p>', 1, 17, 3, 3, '2025-08-21 08:27:24', '2025-08-21 15:23:47'),
(94, 'Cloud Stinger 2', 'products/01K35VW3WBSJAH03M02E91NZGS.webp', 59.00, 11, 5, '<p>Type | Headphone<br>Connection | 3.5MM Audio<br>Audio Driver | 50MM<br>Sound channel | 7.1<br>Microphone | Yes<br><br></p>', 1, 17, 3, 3, '2025-08-21 08:28:07', '2025-09-08 04:23:56'),
(95, 'Zone Vibe 100', 'products/01K35VXQ45NTQ2W414Q9ZFBMYD.jpg', 79.00, 9, 5, '<p>Type | Headphone<br>Connection | Bluetooth<br>Audio Driver | 40MM<br>Sound channel | 7.1<br>Microphone | Yes<br>Battery | Rechargeable</p>', 1, 13, 3, 3, '2025-08-21 08:28:59', '2025-08-21 15:46:17'),
(96, 'G Pro X', 'products/01K35VZ5F9VTBGZ5T4Y8QYM89K.jpg', 119.00, 12, 4, '<p>Type | Headphone<br>Connection | 3.5MM Audio , USB Wired<br>Audio Driver | 50MM<br>Sound channel | 7.1<br>Microphone | Yes</p>', 1, 13, 3, 3, '2025-08-21 08:29:47', '2025-09-08 08:46:14'),
(97, 'G Pro X 2', 'products/01K35W0K7MK428D8NVMQM64TRT.jpg', 260.00, 12, 5, '<p>Type | Headphone<br>Connection | 3.5MM Audio, USB Wired, USB Wireless, Bluetooth<br>Audio Driver | 50MM<br>Sound channel | 7.1<br>Microphone | Yes<br>Battery | Rechargeable</p>', 1, 13, 3, 3, '2025-08-21 08:30:34', '2025-10-11 23:29:29'),
(98, 'H390', 'products/01K35W329PT7N1TZNPZV2B0E3E.png', 29.00, 14, 5, '<p>Type | Headphone<br>Connection | USB Wired<br>Audio Driver | 30MM<br>Sound channel | 7.1<br>Microphone | Yes</p>', 1, 13, 3, 3, '2025-08-21 08:31:55', '2025-10-21 13:28:51'),
(99, '(Headphone stand) Premium', 'products/01K35W5YRX84SH7PKNPAZR9XP1.webp', 25.00, 10, 5, '<p>Integrated USB Hub</p><p>Weight | 350 grams</p>', 1, 16, 3, 3, '2025-08-21 08:33:29', '2025-09-16 02:33:29'),
(100, 'B90', 'products/01K35W7B8B54E2AHPX5KVH5GDY.jpg', 29.00, 11, 5, '<p>Type | Headphone<br>Connection | 3.5MM Audio, Bluetooth<br>Audio Driver | 40MM<br>Sound channel | 7.1<br>Microphone | Yes<br>Battery | Rechargeable</p>', 1, 16, 3, 3, '2025-08-21 08:34:15', '2025-09-16 02:44:24'),
(101, 'K1 Pro', 'products/01K35W9DQE2PNCE4WCQGD2PB5G.webp', 22.00, 14, 5, '<p>Type | Headphone<br>Connection | 3.5MM Audio<br>Audio Driver | 50MM<br>Sound channel | 7.1<br>Microphone | Yes<br><br></p>', 1, 16, 3, 3, '2025-08-21 08:35:23', '2025-10-23 02:59:50'),
(102, 'X80', 'products/01K35WC5S4XYTPKFGE3FV6ZF03.webp', 19.00, 15, 5, '<p>Type | Headphone<br>Connection | USB Wired<br>Audio Driver | 50MM<br>Sound channel | 7.1<br>Microphone | Yes<br><br><br></p>', 1, 16, 3, 3, '2025-08-21 08:36:53', '2025-10-22 14:41:47'),
(103, 'Blackshark V2 X', 'products/01K35WH7C2EDQEGE1D3M776A0K.jpg', 50.00, 8, 5, '<p>Type | Headphone<br>Connection | 3.5MM Audio<br>Audio Driver | 50MM<br>Sound channel | 7.1<br>Microphone | Yes</p>', 1, 6, 3, 3, '2025-08-21 08:39:39', '2025-08-21 15:16:45'),
(104, 'Ares', 'products/01K35WMH3K16ESKAJ6HCHTFS78.webp', 16.00, 11, 5, '<p>Type | Headphone<br>Connection | 3.5MM Audio<br>Audio Driver | 40MM<br>Sound channel | 7.1<br>Microphone | Yes</p>', 1, 14, 3, 3, '2025-08-21 08:41:27', '2025-09-16 02:45:18'),
(105, 'Cronus', 'products/01K35WPV5HM2MWNA7VW7CK5C63.webp', 22.00, 14, 5, '<p>Type | Headphone<br>Connection | 3.5MM Audio<br>Audio Driver | 40MM<br>Sound channel | 7.1<br>Microphone | Yes</p>', 1, 14, 3, 3, '2025-08-21 08:42:43', '2025-10-11 23:59:49'),
(106, 'Zeus Pro', 'products/01K35WSEZ6H2TH18J27G3QZW4F.jpg', 55.00, 15, 5, '<p>Type | Headphone<br>Connection | USB Wired, USB Wireless, Bluetooth<br>Audio Driver | 53MM<br>Sound channel | 7.1<br>Microphone | Yes<br>Battery | Rechargeable</p>', 1, 14, 3, 3, '2025-08-21 08:44:09', '2025-09-08 04:54:08'),
(107, 'Dell Vostro 15 | 3530 (core i5)', 'products/01K35X8RASRYBDWVZPB5RP9SDE.avif', 429.00, 8, 10, '<p>- <strong>13th Gen Intel i5-1334U Processors</strong><br>- RAM : 8GB DDR4 , 16GB = $20 , 32GB = 50$<br>- Storage : <strong>256GB M.2 PCIe NVMe<br></strong>- Display : <strong>15.6 FHD 1920x1080 120Hz</strong><br>- GPU : Intel® UHD Graphics<br>- OS : Windows 11 Pro Recommendation<br>- Color : Carbon Black</p>', 1, 2, 1, 3, '2025-08-21 08:52:30', '2025-10-12 00:00:28'),
(108, 'Dell Vostro 15 | 3520 (core i7)', 'products/01K35XAZQEF7EMK78QH7FA8NQF.avif', 630.00, 8, 10, '<p>- <strong>12th Gen Intel i7-1255U Processors</strong><br>- RAM : 8GB DDR4 , 16GB = $20 , 32GB = 50$<br>- Storage : <strong>512GB M.2 PCIe NVMe<br></strong>- Display : <strong>15.6 FHD 1920x1080 120Hz</strong><br>- GPU : Intel® UHD Graphics<br>- OS : Windows 11 Pro Recommendation<br>- Color : Carbon Black</p>', 1, 2, 1, 3, '2025-08-21 08:53:43', '2025-10-07 13:01:03'),
(109, 'Dell Inspiron 16 | 5630 (core i5)', 'products/01K35XER39GC2XP88QV457T9ZY.jpg', 579.00, 9, 10, '<p>- <strong>13th Gen Intel i5-1335U Processors</strong><br>- 8GB LPDDR5 4800 MT/s | <strong>512GB M.2 PCIe<br></strong>- <strong>16\"FHD+ WVA Touch ComfortView Plus</strong><br>- GPU : Intel® UHD Graphics<br>- Feature : <strong>Backlit Keyboard , Finger Print</strong><br>- OS : <strong>Windows 11 License</strong><br>- Battery : 4 Cell, 54 Wh, 65 Watt AC<br>- 1.6 Kg | Color : Platinum Silver</p>', 1, 2, 1, 3, '2025-08-21 08:55:46', '2025-08-21 15:44:28'),
(110, 'Macbook Pro 2020 13\"', 'products/01K35XJ62H18KKJSS1JD15Z3N6.webp', 600.00, 7, 7, '<p>- <strong>Intel Core i5 processor</strong><br>- RAM/Storage : 16GB | <strong>512GB</strong><br>- Display : 13.3\" 2K 2560x1600 Retina<br>- <strong>Backlit Magic Keyboard</strong><br>- Touch Bar | SPACE GRAY</p>', 1, 1, 1, 3, '2025-08-21 08:57:39', '2025-10-21 12:40:30'),
(111, '2024 Macbook Air 13 M3 Chip CPO', 'products/01K35XN8N2HTF6N6NTN4ZZEBBK.jpg', 1000.00, 7, 5, '<p>- <strong>Apple M3 Chip (8C / 10GPU)</strong><br>- 8GB Unified Memory<br>- Storage : <strong>512GB</strong><br>- 13.6\" (2560*1664) Liquid Retina 500 nits<br>- <strong>Backlit Magic Keyboard</strong></p>', 1, 1, 1, 3, '2025-08-21 08:59:20', '2025-10-07 13:00:06'),
(112, 'Lenovo Thinkpad X13s Gen1-CPO', 'products/01K35XQSF8YPJMZJ2ND9G7QHHP.png', 679.00, 5, 5, '<p>&nbsp;<strong>Snapdragon 8cx Gen 3</strong><br>- RAM : 16GB | <strong>256GB M.2 PCIe<br></strong>- <strong>13.3\" FHD (1920 x 1080) IPS</strong><br>- GPU : <strong>Qualcomm® Adreno™ 690 Graphics</strong><br>- <strong>Windows 11 License</strong><br>- 1.0Kg | Color : Black</p>', 1, 4, 1, 3, '2025-08-21 09:00:42', '2025-09-08 08:23:31'),
(113, 'MSI Thin 15 B12UCX-2850KH', 'products/01K35XTEX1A616VCMJWHD3FT54.png', 599.00, 7, 5, '<p>- <strong>12th Gen Intel Core i5-12450H</strong><br>- RAM : 8GB DDR4 , 16GB = $20<br>- Storage : <strong>512GB M.2 PCIe</strong><br>- <strong>15.6\" FHD (1920x1080) IPS 144Hz</strong><br>- VGA : <strong>NVIDIA RTX 2050 4GB</strong><br>- <strong>Backlight Key (Single-Color, blue)</strong><br>- <strong>Windows 11 License<br></strong>- Weight : 1.8 Kg | Color : Cosmos Gray</p>', 1, 7, 1, 3, '2025-08-21 09:02:10', '2025-09-08 08:45:29'),
(114, 'Laptop Dell Latitude E7270', 'products/01K35Y55A7WJ73NH08H85AA49A.webp', 199.00, 8, 5, '<p>- Ci5-6200U @2.3Ghz<br>- Ram: 8Gb DDR4&nbsp;<br>- Storage: SSD:256GB M.2<br>- Display: 14inch HD&nbsp;<br>- VGA : Intel HD Graphic 529</p>', 1, 2, 1, 3, '2025-08-21 09:08:00', '2025-10-23 02:25:30'),
(115, 'Arctis 3', 'products/01K4Q7P0VQPRJ5MN0970T1EBGE.webp', 89.00, 10, 10, '<ul><li>3.5 mm analog audio input</li><li>40mm neodymium drivers</li><li>Windows Sonic 7.1 surround sound</li><li>Discord-certified ClearCast noise cancelling microphone</li><li>Arctis signature soundscape</li><li>Athletics-inspired performance fabric Airweave ear cushions</li></ul><p><br></p>', 1, 15, 3, 3, '2025-09-09 12:37:17', '2025-09-10 15:00:41'),
(116, 'White Stitch Cloth (Large)', 'products/WSC.webp', 20.00, 16, 5, '<ul><li>Low Friction: Smooth cloth surface for SPEED and CONTROL</li></ul><p><br></p>', 1, 13, 8, 1, '2025-09-10 14:54:19', '2025-09-15 05:12:12'),
(117, 'P3 Plus (1TB)', 'products/crucial1tb.webp', 65.00, 10, 5, '<p>Capacity | 1TB<br>Interface | PCIe® Gen 3.0 NVMe™<br>Form Factor | M.2<br>Read Speed | Up to 5,000 MB/s<br>Write Speed | Up to 4,200 MB/s</p>', 1, 20, 6, 1, '2025-09-10 14:57:05', '2025-09-10 15:00:41'),
(118, 'MA02W - Wasteland Survival', 'products/akkoMa02W.webp', 80.00, 5, 5, '<p>Connection | 3.5MM Audio, USB Wireless, Bluetooth , Audio Driver | 50MM<br>Sound channel | 7.1, Microphone | Yes<br>Battery | Rechargeable</p>', 1, 18, 3, 1, '2025-09-10 15:38:08', '2025-09-10 15:38:31'),
(119, 'Laptop Dell Latitude 7300', 'products/Laptop Dell Latitude 7300.jpg', 699.00, 9, 7, '<p>- Ci5-8th GenU&nbsp;<br>- Ram: 8Gb DDR4 &nbsp;<br>- Storage: SSD 256GB&nbsp;<br>- Display: 14 inch Full HD <br>- VGA : Intel UHD Graphic 620</p>', 1, 2, 1, 1, '2025-09-12 15:16:26', '2025-10-07 13:01:03'),
(120, 'Soldat S50B', 'products/Soldat.jpg', 40.00, 10, 5, '<p>Keys：98 Keys</p><p>Cable length 1.6M</p><p>Anti-ghosting： 19-keys</p><p>12 multimedia shortcut and FN function</p><p>Diamension: 389*140*41MM</p>', 1, 21, 9, 1, '2025-09-12 16:11:20', '2025-09-12 16:15:53'),
(121, 'H9 cooling pad', 'products/H9.webp', 15.00, 10, 10, '<ul><li>Support up to 15.6 inches laptop</li><li>6 core fans cooling</li><li>Fan come with blue LED lighting</li><li>Adjustable speed fan</li><li>One USB passthrough port</li></ul><p><br></p>', 1, 22, 15, 1, '2025-09-12 16:14:32', '2025-10-09 14:16:35'),
(122, 'Laptop Dell Latitude 5420 (i7)', 'products/Laptop Dell Latitude 5410.jpg', 399.00, 4, 3, '<p>- Ci7-10610U @1.8Ghz<br>- Ram: 16Gb DDR4&nbsp;<br>- Storage: SSD:256GB M.2<br>- Display: 14inch FHD&nbsp;<br>- VGA : Intel UHD Graphic&nbsp;</p>', 1, 2, 1, 1, '2025-09-15 06:52:06', '2025-09-16 02:48:29'),
(123, 'Laptop Dell Latitude 5420 (i5)', 'products/Laptop Dell Latitude 5410.jpg', 299.00, 4, 3, '<p>- Ci5-10210U @1.8Ghz<br>- Ram: 16Gb DDR4&nbsp;<br>- Storage: SSD:256GB M.2<br>- Display: 14inch FHD &nbsp;<br>- VGA : Intel UHD Graphic&nbsp;</p>', 1, 2, 1, 1, '2025-09-15 07:00:47', '2025-10-09 15:14:55'),
(124, 'Acer Aspire 4', 'products/Acer Aspire 3.webp', 300.00, 4, 3, NULL, 1, 8, 1, 1, '2025-09-16 02:36:22', '2025-09-16 02:37:15'),
(125, 'Laptop Asus Gaming FX505DU', 'products/Laptop Asus Gaming FX505DU.jpg', 400.00, 6, 10, NULL, 1, 3, 1, 1, '2025-10-19 21:44:23', '2025-10-21 13:19:43'),
(126, 'Laptop Dell Latitude E5400', 'products/01K83F78AM3RT08DQ1EGDNYTZM.jpg', 299.00, 6, 5, '<p>- Ci5-8365U @1.6GHz-@1.9Ghz<br>- Ram: 8Gb DDR4&nbsp;<br>- Storage: SSD:256GB M.2<br>- Display: 14inch Full HD&nbsp;<br>- Keyboard: Light&nbsp;<br>- VGA : Intel HD Graphic 620</p>', 1, 2, 1, 1, '2025-10-21 13:27:01', '2025-10-23 03:14:32'),
(127, 'Dell 16 Plus Laptop', 'products/01K87R99K11NBBP1RADRWNDJWS.jpg', 899.00, 4, 3, '<ul><li>AMD Ryzen™ AI Processors, Copilot+ PC with on-device AI</li></ul><p><br></p>', 1, 2, 1, 4, '2025-10-23 05:21:05', '2025-10-23 06:25:45'),
(128, 'MX Master 4', 'products/01K87WCX45KBQ2E9G8KETFV8EB.webp', 140.00, 4, 3, NULL, 1, 13, 7, 4, '2025-10-23 06:34:15', '2025-10-23 06:38:28');

-- --------------------------------------------------------

--
-- Table structure for table `product_imports`
--

CREATE TABLE `product_imports` (
  `id` bigint UNSIGNED NOT NULL,
  `import_date` date NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `supplier_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_imports`
--

INSERT INTO `product_imports` (`id`, `import_date`, `note`, `supplier_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, '2025-06-14', '<p>800</p>', 12, 1, '2025-06-14 06:02:24', '2025-08-21 10:29:58'),
(2, '2025-06-14', NULL, 7, 2, '2025-06-14 06:13:43', '2025-06-14 06:13:43'),
(3, '2025-05-10', NULL, 7, 1, '2025-06-20 11:23:54', '2025-06-20 11:23:54'),
(4, '2024-01-01', NULL, 9, 1, '2025-06-20 11:52:38', '2025-06-20 11:52:38'),
(5, '2024-06-23', NULL, 1, 1, '2025-06-23 04:02:03', '2025-06-23 04:02:03'),
(6, '2025-06-26', NULL, 12, 1, '2025-06-26 03:26:17', '2025-08-21 10:30:11'),
(7, '2025-02-12', NULL, 8, 1, '2025-06-26 03:26:56', '2025-06-26 03:26:56'),
(8, '2024-12-26', NULL, 3, 1, '2025-06-26 03:27:33', '2025-06-26 03:27:33'),
(9, '2024-10-26', NULL, 12, 1, '2025-06-26 03:28:55', '2025-08-21 10:30:24'),
(10, '2025-02-26', NULL, 1, 1, '2025-06-26 03:30:00', '2025-06-26 03:30:00'),
(11, '2025-06-23', NULL, 2, 1, '2025-06-26 03:55:36', '2025-06-26 03:55:36'),
(12, '2024-01-21', NULL, 9, 3, '2025-08-21 09:41:45', '2025-08-21 09:41:45'),
(13, '2024-02-21', NULL, 9, 3, '2025-08-21 09:53:15', '2025-08-21 09:53:15'),
(14, '2024-07-21', NULL, 9, 3, '2025-08-21 10:04:41', '2025-08-21 10:04:41'),
(15, '2024-03-21', NULL, 5, 1, '2025-08-21 10:12:31', '2025-08-21 10:12:31'),
(16, '2024-04-21', NULL, 8, 1, '2025-08-21 10:13:31', '2025-08-21 10:13:31'),
(17, '2024-08-21', NULL, 6, 1, '2025-08-21 10:15:44', '2025-08-21 16:35:16'),
(18, '2024-05-21', NULL, 6, 1, '2025-08-21 10:16:57', '2025-08-21 10:16:57'),
(19, '2024-06-21', NULL, 1, 1, '2025-08-21 10:17:39', '2025-08-21 10:17:39'),
(20, '2024-08-21', NULL, 7, 1, '2025-08-21 10:18:45', '2025-08-21 10:18:45'),
(21, '2024-09-21', NULL, 8, 1, '2025-08-21 10:20:13', '2025-08-21 10:20:13'),
(22, '2024-11-21', NULL, 7, 1, '2025-08-21 10:20:49', '2025-08-21 10:20:49'),
(23, '2024-08-18', NULL, 8, 1, '2025-08-21 10:21:50', '2025-08-21 10:21:50'),
(24, '2024-05-21', NULL, 12, 1, '2025-08-21 10:22:41', '2025-08-21 10:22:41'),
(25, '2025-01-16', NULL, 2, 1, '2025-08-21 10:23:19', '2025-08-21 10:23:19'),
(26, '2025-03-10', NULL, 7, 1, '2025-08-21 10:24:24', '2025-08-21 10:24:24'),
(27, '2025-03-05', NULL, 10, 1, '2025-08-21 10:25:45', '2025-08-21 10:25:45'),
(28, '2025-04-19', NULL, 6, 1, '2025-08-21 10:26:15', '2025-08-21 10:26:15'),
(29, '2025-08-21', NULL, 12, 1, '2025-08-21 10:26:56', '2025-08-21 10:26:56'),
(30, '2025-05-10', NULL, 6, 1, '2025-08-21 10:27:30', '2025-08-21 10:27:30'),
(31, '2025-04-30', NULL, 6, 1, '2025-08-21 10:28:11', '2025-08-21 10:28:11'),
(32, '2025-07-08', NULL, 6, 1, '2025-08-21 10:36:51', '2025-08-21 10:36:51'),
(33, '2024-03-10', NULL, 6, 1, '2025-08-21 10:37:19', '2025-08-21 10:37:19'),
(34, '2024-08-09', NULL, 12, 1, '2025-08-21 10:37:49', '2025-08-21 10:37:49'),
(35, '2024-04-21', NULL, 12, 1, '2025-08-21 10:38:19', '2025-08-21 10:38:19'),
(36, '2024-11-21', NULL, 12, 1, '2025-08-21 10:38:41', '2025-08-21 10:38:41'),
(37, '2024-12-31', NULL, 12, 1, '2025-08-21 10:39:10', '2025-08-21 10:39:10'),
(38, '2024-01-21', NULL, 4, 1, '2025-08-21 10:39:33', '2025-08-21 10:39:33'),
(39, '2023-01-21', NULL, 4, 1, '2025-08-21 10:39:59', '2025-08-21 10:39:59'),
(40, '2024-05-21', NULL, 4, 1, '2025-08-21 10:40:45', '2025-08-21 10:40:45'),
(41, '2023-12-17', NULL, 10, 1, '2025-08-21 10:41:12', '2025-08-21 10:41:12'),
(42, '2023-11-21', NULL, 12, 1, '2025-08-21 10:41:37', '2025-08-21 10:41:37'),
(43, '2024-11-21', NULL, 12, 1, '2025-08-21 10:42:00', '2025-08-21 10:42:00'),
(44, '2023-11-21', NULL, 12, 1, '2025-08-21 10:42:23', '2025-08-21 10:42:23'),
(45, '2023-10-30', NULL, 12, 1, '2025-08-21 10:43:07', '2025-08-21 10:43:07'),
(46, '2023-11-21', NULL, 12, 1, '2025-08-21 10:43:33', '2025-08-21 10:43:33'),
(47, '2023-10-23', NULL, 10, 1, '2025-08-21 10:45:02', '2025-08-21 10:45:02'),
(48, '2023-10-21', NULL, 12, 1, '2025-08-21 10:45:38', '2025-08-21 10:45:38'),
(49, '2024-10-21', NULL, 12, 1, '2025-08-21 10:45:58', '2025-08-21 10:45:58'),
(50, '2025-03-21', NULL, 4, 1, '2025-08-21 10:46:19', '2025-08-21 10:46:19'),
(51, '2024-10-21', NULL, 12, 1, '2025-08-21 10:47:42', '2025-08-21 10:47:42'),
(52, '2024-05-21', NULL, 12, 1, '2025-08-21 10:47:57', '2025-08-21 10:47:57'),
(53, '2023-09-21', NULL, 12, 1, '2025-08-21 10:48:21', '2025-08-21 10:48:21'),
(54, '2023-08-21', NULL, 12, 1, '2025-08-21 10:48:45', '2025-08-21 10:48:45'),
(55, '2024-06-21', NULL, 12, 1, '2025-08-21 10:49:07', '2025-08-21 10:49:07'),
(56, '2024-11-21', NULL, 12, 1, '2025-08-21 10:49:28', '2025-08-21 10:49:28'),
(57, '2025-04-21', NULL, 12, 1, '2025-08-21 10:49:48', '2025-08-21 10:49:48'),
(58, '2023-08-21', NULL, 12, 1, '2025-08-21 10:50:22', '2025-08-21 10:50:22'),
(59, '2024-05-21', NULL, 12, 1, '2025-08-21 10:50:44', '2025-08-21 10:50:44'),
(60, '2024-09-21', NULL, 12, 1, '2025-08-21 10:51:15', '2025-08-21 10:51:15'),
(61, '2023-07-21', NULL, 12, 1, '2025-08-21 10:51:57', '2025-08-21 10:51:57'),
(62, '2023-07-21', NULL, 12, 1, '2025-08-21 10:52:18', '2025-08-21 10:52:18'),
(63, '2023-06-21', NULL, 12, 1, '2025-08-21 10:52:45', '2025-08-21 10:52:45'),
(64, '2023-01-21', NULL, 12, 1, '2025-08-21 10:53:13', '2025-08-21 10:53:13'),
(65, '2024-01-21', NULL, 12, 1, '2025-08-21 10:53:38', '2025-08-21 10:53:38'),
(66, '2023-06-21', NULL, 4, 1, '2025-08-21 10:54:01', '2025-08-21 10:54:01'),
(67, '2023-05-21', NULL, 4, 1, '2025-08-21 10:54:19', '2025-08-21 10:54:19'),
(68, '2023-04-21', NULL, 10, 1, '2025-08-21 10:54:46', '2025-08-21 10:54:46'),
(69, '2023-06-21', NULL, 10, 1, '2025-08-21 10:55:12', '2025-08-21 10:55:12'),
(70, '2023-03-21', NULL, 10, 1, '2025-08-21 10:55:36', '2025-08-21 10:55:36'),
(71, '2023-02-21', NULL, 10, 1, '2025-08-21 10:56:13', '2025-08-21 10:56:13'),
(72, '2023-09-21', NULL, 10, 1, '2025-08-21 10:56:44', '2025-08-21 10:56:44'),
(73, '2024-01-21', NULL, 11, 1, '2025-08-21 10:57:36', '2025-08-21 10:57:36'),
(74, '2024-02-21', NULL, 11, 1, '2025-08-21 10:57:54', '2025-08-21 10:57:54'),
(75, '2023-05-27', NULL, 10, 1, '2025-08-21 12:28:08', '2025-08-21 12:28:08'),
(76, '2023-12-01', NULL, 5, 1, '2025-08-21 12:28:47', '2025-08-21 12:28:47'),
(77, '2024-10-21', NULL, 5, 1, '2025-08-21 12:29:17', '2025-08-21 12:29:17'),
(78, '2023-07-21', NULL, 12, 1, '2025-08-21 12:29:54', '2025-08-21 12:29:54'),
(79, '2023-01-18', NULL, 12, 1, '2025-08-21 12:30:20', '2025-08-21 12:30:20'),
(80, '2024-06-21', NULL, 10, 1, '2025-08-21 12:30:41', '2025-08-21 12:30:41'),
(81, '2025-01-11', NULL, 7, 1, '2025-08-21 12:32:52', '2025-08-21 12:32:52'),
(82, '2024-06-01', NULL, 8, 1, '2025-08-21 12:33:33', '2025-08-21 12:33:33'),
(83, '2023-02-27', NULL, 12, 1, '2025-08-21 12:33:54', '2025-08-21 12:33:54'),
(84, '2025-06-07', NULL, 4, 1, '2025-08-21 12:34:17', '2025-08-21 12:34:17'),
(85, '2023-10-24', NULL, 12, 1, '2025-08-21 12:34:42', '2025-08-21 12:34:42'),
(86, '2023-03-09', NULL, 12, 1, '2025-08-21 12:35:03', '2025-08-21 12:35:03'),
(87, '2025-01-30', NULL, 12, 1, '2025-08-21 12:35:30', '2025-08-21 12:35:30'),
(88, '2023-08-16', NULL, 12, 1, '2025-08-21 12:36:25', '2025-08-21 12:36:25'),
(89, '2023-05-13', NULL, 12, 1, '2025-08-21 12:36:50', '2025-08-21 12:36:50'),
(90, '2023-11-21', NULL, 10, 1, '2025-08-21 12:37:34', '2025-08-21 12:37:34'),
(91, '2024-12-01', NULL, 12, 1, '2025-08-21 12:38:12', '2025-08-21 12:38:12'),
(92, '2025-06-21', NULL, 12, 1, '2025-08-21 12:38:43', '2025-08-21 12:38:43'),
(93, '2025-07-08', NULL, 6, 1, '2025-08-21 12:39:35', '2025-08-21 12:39:35'),
(94, '2025-03-04', NULL, 6, 1, '2025-08-21 12:40:05', '2025-08-21 12:40:05'),
(95, '2025-05-21', NULL, 6, 1, '2025-08-21 12:40:39', '2025-08-21 12:40:39'),
(96, '2025-06-11', NULL, 7, 1, '2025-08-21 12:41:15', '2025-08-21 12:41:15'),
(97, '2024-06-11', NULL, 2, 1, '2025-08-21 12:41:53', '2025-08-21 12:41:53'),
(98, '2023-06-21', NULL, 5, 1, '2025-08-21 12:42:33', '2025-08-21 12:42:33'),
(99, '2025-07-05', NULL, 10, 1, '2025-08-21 12:43:41', '2025-08-21 12:43:41'),
(100, '2024-12-21', NULL, 5, 1, '2025-08-21 12:44:13', '2025-08-21 12:44:13'),
(101, '2025-08-22', NULL, 9, 1, '2025-08-22 09:18:58', '2025-08-22 09:18:58'),
(102, '2025-09-05', 'noted', 12, 3, '2025-09-05 03:30:40', '2025-09-05 03:30:40'),
(103, '2025-09-07', 'black mouse pad deals', 12, 3, '2025-09-07 00:16:10', '2025-09-07 00:16:10'),
(104, '2025-09-07', 'this was true', 12, 3, '2025-09-07 03:32:45', '2025-09-07 03:32:45'),
(105, '2025-09-07', 'restock', 8, 3, '2025-09-07 03:52:01', '2025-09-07 03:52:01'),
(106, '2025-09-07', NULL, 1, 3, '2025-09-07 04:32:40', '2025-09-07 04:32:40'),
(108, '2025-09-08', NULL, 12, 3, '2025-09-08 02:48:42', '2025-09-08 02:48:42'),
(109, '2025-09-09', NULL, 12, 3, '2025-09-09 12:20:58', '2025-09-09 12:20:58'),
(110, '2025-09-10', NULL, 13, 3, '2025-09-10 15:00:41', '2025-09-10 15:00:41'),
(111, '2025-09-10', NULL, 13, 3, '2025-09-10 15:38:31', '2025-09-10 15:38:31'),
(112, '2025-09-12', NULL, 3, 3, '2025-09-12 12:50:13', '2025-09-12 12:50:13'),
(113, '2025-09-12', '10 laptop for stock in', 8, 3, '2025-09-12 15:31:06', '2025-09-12 15:31:06'),
(114, '2025-09-12', NULL, 12, 3, '2025-09-12 16:15:53', '2025-09-12 16:15:53'),
(115, '2025-09-14', NULL, 2, 7, '2025-09-14 14:38:10', '2025-09-14 14:38:10'),
(116, '2025-09-14', NULL, 12, 7, '2025-09-14 14:42:06', '2025-09-14 14:42:06'),
(117, '2025-09-15', NULL, 13, 3, '2025-09-15 04:25:42', '2025-09-15 04:25:42'),
(118, '2025-09-15', NULL, 12, 7, '2025-09-15 05:07:25', '2025-09-15 05:07:25'),
(119, '2025-09-15', NULL, 8, 7, '2025-09-15 06:52:58', '2025-09-15 06:52:58'),
(120, '2025-09-15', NULL, 8, 7, '2025-09-15 07:01:11', '2025-09-15 07:01:11'),
(121, '2025-09-16', NULL, 3, 3, '2025-09-16 02:33:29', '2025-09-16 02:33:29'),
(122, '2025-09-16', NULL, 1, 3, '2025-09-16 02:36:55', '2025-09-16 02:36:55'),
(123, '2025-09-16', NULL, 8, 3, '2025-09-16 02:48:29', '2025-09-16 02:48:29'),
(124, '2025-10-07', '<p>2024 Macbook Air stock in for 5</p>', 9, 1, '2025-10-07 13:00:06', '2025-10-07 13:00:06'),
(127, '2025-10-09', NULL, 5, 1, '2025-10-09 14:13:48', '2025-10-09 14:13:48'),
(131, '2025-10-09', NULL, 10, 1, '2025-10-09 14:37:54', '2025-10-09 14:37:54'),
(132, '2025-10-09', NULL, 2, 1, '2025-10-09 14:39:13', '2025-10-09 14:39:13'),
(133, '2025-10-09', NULL, 12, 1, '2025-10-09 14:44:41', '2025-10-09 14:44:41'),
(134, '2025-10-09', NULL, 12, 1, '2025-10-09 15:14:55', '2025-10-09 15:14:55'),
(135, '2025-10-09', NULL, 3, 1, '2025-10-09 15:18:18', '2025-10-09 15:18:18'),
(136, '2025-10-12', NULL, 13, 1, '2025-10-11 23:29:29', '2025-10-11 23:29:29'),
(137, '2025-10-12', NULL, 12, 1, '2025-10-12 00:18:00', '2025-10-12 00:18:00'),
(138, '2025-10-15', NULL, 12, 7, '2025-10-15 04:27:40', '2025-10-15 04:27:40'),
(141, '2025-10-20', NULL, 12, 1, '2025-10-19 21:45:03', '2025-10-21 13:19:43'),
(142, '2025-10-20', NULL, 12, 1, '2025-10-19 21:55:41', '2025-10-21 13:21:05'),
(144, '2025-10-21', NULL, 7, 1, '2025-10-21 14:12:04', '2025-10-23 06:25:45'),
(145, '2025-10-23', '<p>Fully paid.</p>', 9, 4, '2025-10-23 06:38:28', '2025-10-23 06:38:28');

-- --------------------------------------------------------

--
-- Table structure for table `product_import_items`
--

CREATE TABLE `product_import_items` (
  `id` bigint UNSIGNED NOT NULL,
  `product_import_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `qty` int NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_import_items`
--

INSERT INTO `product_import_items` (`id`, `product_import_id`, `product_id`, `qty`, `unit_price`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 4, 200.00, '2025-06-14 06:02:24', '2025-06-14 06:02:24'),
(2, 1, 1, 3, 200.00, '2025-06-14 06:02:24', '2025-06-14 06:02:24'),
(3, 2, 2, 1, 300.00, '2025-06-14 06:13:43', '2025-06-14 06:13:43'),
(4, 2, 3, 1, 400.00, '2025-06-14 06:13:43', '2025-06-14 06:13:43'),
(5, 3, 3, 1, 200.00, '2025-06-20 11:23:54', '2025-06-20 11:23:54'),
(6, 3, 1, 1, 300.00, '2025-06-20 11:23:54', '2025-06-20 11:23:54'),
(7, 3, 2, 1, 200.00, '2025-06-20 11:23:54', '2025-06-20 11:23:54'),
(8, 4, 2, 2, 300.00, '2025-06-20 11:52:38', '2025-06-20 11:52:38'),
(9, 4, 3, 2, 150.00, '2025-06-20 11:52:38', '2025-06-20 11:52:38'),
(10, 5, 2, 1, 300.00, '2025-06-23 04:02:03', '2025-06-23 04:02:03'),
(11, 6, 15, 3, 200.00, '2025-06-26 03:26:17', '2025-06-26 03:26:17'),
(12, 6, 11, 3, 300.00, '2025-06-26 03:26:17', '2025-06-26 03:26:17'),
(13, 6, 4, 3, 500.00, '2025-06-26 03:26:17', '2025-06-26 03:26:17'),
(14, 6, 2, 3, 250.00, '2025-06-26 03:26:17', '2025-06-26 03:26:17'),
(15, 6, 37, 3, 30.00, '2025-06-26 03:26:17', '2025-06-26 03:26:17'),
(16, 6, 44, 3, 300.00, '2025-06-26 03:26:17', '2025-06-26 03:26:17'),
(17, 6, 45, 3, 600.00, '2025-06-26 03:26:17', '2025-06-26 03:26:17'),
(18, 6, 33, 3, 349.00, '2025-06-26 03:26:17', '2025-06-26 03:26:17'),
(19, 7, 1, 4, 200.00, '2025-06-26 03:26:56', '2025-06-26 03:26:56'),
(20, 7, 21, 4, 60.00, '2025-06-26 03:26:56', '2025-06-26 03:26:56'),
(21, 7, 29, 4, 199.00, '2025-06-26 03:26:56', '2025-06-26 03:26:56'),
(22, 8, 6, 4, 400.00, '2025-06-26 03:27:33', '2025-06-26 03:27:33'),
(23, 8, 43, 4, 300.00, '2025-06-26 03:27:33', '2025-06-26 03:27:33'),
(24, 8, 14, 4, 100.00, '2025-06-26 03:27:33', '2025-06-26 03:27:33'),
(25, 9, 3, 5, 300.00, '2025-06-26 03:28:55', '2025-06-26 03:28:55'),
(26, 9, 28, 4, 169.00, '2025-06-26 03:28:55', '2025-06-26 03:28:55'),
(27, 9, 17, 4, 70.00, '2025-06-26 03:28:55', '2025-06-26 03:28:55'),
(28, 9, 7, 2, 400.00, '2025-06-26 03:28:55', '2025-06-26 03:28:55'),
(29, 9, 18, 4, 20.00, '2025-06-26 03:28:55', '2025-06-26 03:28:55'),
(30, 9, 36, 4, 500.00, '2025-06-26 03:28:55', '2025-06-26 03:28:55'),
(31, 10, 12, 3, 100.00, '2025-06-26 03:30:00', '2025-06-26 03:30:00'),
(32, 10, 46, 3, 400.00, '2025-06-26 03:30:00', '2025-06-26 03:30:00'),
(33, 10, 9, 4, 500.00, '2025-06-26 03:30:00', '2025-06-26 03:30:00'),
(34, 10, 38, 4, 300.00, '2025-06-26 03:30:00', '2025-06-26 03:30:00'),
(35, 10, 51, 3, 499.00, '2025-06-26 03:30:00', '2025-06-26 03:30:00'),
(36, 11, 51, 1, 500.00, '2025-06-26 03:55:36', '2025-06-26 03:55:36'),
(37, 11, 32, 4, 99.00, '2025-06-26 03:55:36', '2025-06-26 03:55:36'),
(38, 12, 2, 10, 300.00, '2025-08-21 09:41:45', '2025-08-21 09:41:45'),
(39, 13, 110, 15, 390.00, '2025-08-21 09:53:15', '2025-08-21 09:53:15'),
(40, 14, 111, 10, 600.00, '2025-08-21 10:04:41', '2025-08-21 10:04:41'),
(41, 14, 110, 5, 400.00, '2025-08-21 10:04:41', '2025-10-11 23:45:55'),
(42, 15, 23, 10, 399.00, '2025-08-21 10:12:31', '2025-08-21 10:12:31'),
(43, 16, 35, 10, 300.00, '2025-08-21 10:13:31', '2025-08-21 10:13:31'),
(44, 17, 49, 10, 99.00, '2025-08-21 10:15:44', '2025-08-21 10:15:44'),
(45, 18, 44, 5, 119.00, '2025-08-21 10:16:57', '2025-08-21 10:16:57'),
(46, 19, 52, 10, 150.00, '2025-08-21 10:17:39', '2025-08-21 10:17:39'),
(47, 20, 66, 10, 130.00, '2025-08-21 10:18:45', '2025-08-21 10:18:45'),
(48, 21, 67, 10, 199.00, '2025-08-21 10:20:13', '2025-08-21 10:20:13'),
(49, 21, 109, 10, 460.00, '2025-08-21 10:20:13', '2025-08-21 10:20:13'),
(50, 22, 108, 10, 499.00, '2025-08-21 10:20:49', '2025-08-21 10:20:49'),
(51, 23, 107, 9, 300.00, '2025-08-21 10:21:50', '2025-08-21 10:21:50'),
(52, 24, 112, 11, 399.00, '2025-08-21 10:22:41', '2025-08-21 10:22:41'),
(53, 25, 113, 10, 360.00, '2025-08-21 10:23:19', '2025-08-21 10:23:19'),
(54, 26, 114, 10, 99.00, '2025-08-21 10:24:24', '2025-08-21 10:24:24'),
(55, 27, 10, 8, 100.00, '2025-08-21 10:25:45', '2025-08-21 10:25:45'),
(56, 28, 34, 10, 49.00, '2025-08-21 10:26:15', '2025-08-21 10:26:15'),
(57, 29, 89, 10, 10.00, '2025-08-21 10:26:56', '2025-08-21 10:26:56'),
(58, 29, 90, 10, 13.00, '2025-08-21 10:26:56', '2025-08-21 10:26:56'),
(59, 30, 91, 10, 80.00, '2025-08-21 10:27:30', '2025-08-21 10:27:30'),
(60, 31, 92, 10, 100.00, '2025-08-21 10:28:11', '2025-08-21 10:28:11'),
(61, 32, 93, 10, 90.00, '2025-08-21 10:36:51', '2025-08-21 10:36:51'),
(62, 33, 94, 15, 30.00, '2025-08-21 10:37:19', '2025-08-21 10:37:19'),
(63, 34, 95, 10, 40.00, '2025-08-21 10:37:49', '2025-08-21 10:37:49'),
(64, 35, 96, 15, 69.00, '2025-08-21 10:38:19', '2025-08-21 10:38:19'),
(65, 36, 97, 10, 199.00, '2025-08-21 10:38:41', '2025-08-21 10:38:41'),
(66, 37, 98, 20, 10.00, '2025-08-21 10:39:10', '2025-08-21 10:39:10'),
(67, 38, 100, 15, 15.00, '2025-08-21 10:39:33', '2025-08-21 10:39:33'),
(68, 39, 101, 20, 10.00, '2025-08-21 10:39:59', '2025-08-21 10:39:59'),
(69, 40, 102, 20, 9.00, '2025-08-21 10:40:45', '2025-08-21 10:40:45'),
(70, 41, 103, 10, 30.00, '2025-08-21 10:41:12', '2025-08-21 10:41:12'),
(71, 42, 104, 20, 9.00, '2025-08-21 10:41:37', '2025-08-21 10:41:37'),
(72, 43, 105, 20, 10.00, '2025-08-21 10:42:00', '2025-08-21 10:42:00'),
(73, 44, 106, 15, 30.00, '2025-08-21 10:42:23', '2025-08-21 10:42:23'),
(74, 45, 20, 20, 5.00, '2025-08-21 10:43:07', '2025-08-21 10:43:07'),
(75, 46, 41, 50, 4.00, '2025-08-21 10:43:33', '2025-08-21 10:43:33'),
(76, 47, 19, 10, 60.00, '2025-08-21 10:45:02', '2025-08-21 10:45:02'),
(77, 48, 27, 10, 100.00, '2025-08-21 10:45:38', '2025-08-21 10:45:38'),
(78, 49, 30, 10, 50.00, '2025-08-21 10:45:58', '2025-08-21 10:45:58'),
(79, 50, 99, 10, 10.00, '2025-08-21 10:46:19', '2025-08-21 10:46:19'),
(80, 51, 53, 10, 60.00, '2025-08-21 10:47:42', '2025-08-21 10:47:42'),
(81, 52, 68, 20, 100.00, '2025-08-21 10:47:57', '2025-08-21 10:47:57'),
(82, 53, 69, 19, 5.00, '2025-08-21 10:48:21', '2025-08-21 10:48:21'),
(83, 54, 70, 10, 10.00, '2025-08-21 10:48:45', '2025-08-21 10:48:45'),
(84, 55, 71, 15, 20.00, '2025-08-21 10:49:07', '2025-08-21 10:49:07'),
(85, 56, 72, 20, 10.00, '2025-08-21 10:49:28', '2025-08-21 10:49:28'),
(86, 57, 73, 15, 25.00, '2025-08-21 10:49:48', '2025-08-21 10:49:48'),
(87, 58, 74, 19, 23.00, '2025-08-21 10:50:22', '2025-08-21 10:50:22'),
(88, 59, 75, 20, 10.00, '2025-08-21 10:50:44', '2025-08-21 10:50:44'),
(89, 60, 76, 15, 50.00, '2025-08-21 10:51:15', '2025-08-21 10:51:15'),
(90, 61, 78, 20, 15.00, '2025-08-21 10:51:57', '2025-08-21 10:51:57'),
(91, 62, 77, 19, 10.00, '2025-08-21 10:52:18', '2025-08-21 10:52:18'),
(92, 63, 79, 20, 19.00, '2025-08-21 10:52:45', '2025-08-21 10:52:45'),
(93, 64, 80, 25, 15.00, '2025-08-21 10:53:13', '2025-08-21 10:53:13'),
(94, 65, 81, 20, 20.00, '2025-08-21 10:53:38', '2025-08-21 10:53:38'),
(95, 66, 82, 20, 10.00, '2025-08-21 10:54:01', '2025-08-21 10:54:01'),
(96, 67, 83, 25, 10.00, '2025-08-21 10:54:19', '2025-08-21 10:54:19'),
(97, 68, 84, 19, 40.00, '2025-08-21 10:54:46', '2025-08-21 10:54:46'),
(98, 69, 85, 20, 44.00, '2025-08-21 10:55:12', '2025-08-21 10:55:12'),
(99, 70, 86, 15, 100.00, '2025-08-21 10:55:36', '2025-08-21 10:55:36'),
(100, 71, 87, 20, 50.00, '2025-08-21 10:56:13', '2025-08-21 10:56:13'),
(101, 72, 88, 20, 40.00, '2025-08-21 10:56:44', '2025-08-21 10:56:44'),
(102, 73, 22, 20, 50.00, '2025-08-21 10:57:36', '2025-08-21 10:57:36'),
(103, 74, 50, 25, 80.00, '2025-08-21 10:57:54', '2025-08-21 10:57:54'),
(104, 75, 13, 15, 30.00, '2025-08-21 12:28:08', '2025-08-21 12:28:08'),
(105, 76, 16, 5, 180.00, '2025-08-21 12:28:47', '2025-08-21 12:28:47'),
(106, 77, 16, 5, 120.00, '2025-08-21 12:29:17', '2025-08-21 12:29:17'),
(107, 78, 24, 20, 5.00, '2025-08-21 12:29:54', '2025-08-21 12:29:54'),
(108, 78, 25, 20, 7.00, '2025-08-21 12:29:54', '2025-08-21 12:29:54'),
(109, 79, 26, 20, 10.00, '2025-08-21 12:30:20', '2025-08-21 12:30:20'),
(110, 80, 31, 15, 19.00, '2025-08-21 12:30:41', '2025-08-21 12:30:41'),
(111, 81, 48, 8, 160.00, '2025-08-21 12:32:52', '2025-08-21 12:32:52'),
(112, 82, 39, 9, 120.00, '2025-08-21 12:33:33', '2025-08-21 12:33:33'),
(113, 83, 40, 10, 25.00, '2025-08-21 12:33:54', '2025-08-21 12:33:54'),
(114, 84, 42, 15, 10.00, '2025-08-21 12:34:17', '2025-08-21 12:34:17'),
(115, 85, 47, 10, 175.00, '2025-08-21 12:34:42', '2025-08-21 12:34:42'),
(116, 86, 54, 20, 10.00, '2025-08-21 12:35:03', '2025-08-21 12:35:03'),
(117, 87, 54, 15, 9.00, '2025-08-21 12:35:30', '2025-08-21 12:35:30'),
(118, 88, 55, 20, 30.00, '2025-08-21 12:36:25', '2025-08-21 12:36:25'),
(119, 89, 56, 20, 30.00, '2025-08-21 12:36:50', '2025-08-21 12:36:50'),
(120, 90, 57, 10, 50.00, '2025-08-21 12:37:34', '2025-08-21 12:37:34'),
(121, 91, 58, 20, 10.00, '2025-08-21 12:38:12', '2025-08-21 12:38:12'),
(122, 92, 59, 15, 14.00, '2025-08-21 12:38:43', '2025-08-21 12:38:43'),
(123, 93, 60, 10, 30.00, '2025-08-21 12:39:35', '2025-08-21 12:39:35'),
(124, 94, 61, 10, 35.00, '2025-08-21 12:40:05', '2025-08-21 12:40:05'),
(125, 95, 62, 15, 45.00, '2025-08-21 12:40:39', '2025-08-21 12:40:39'),
(126, 96, 63, 9, 100.00, '2025-08-21 12:41:15', '2025-08-21 12:41:15'),
(127, 97, 64, 8, 100.00, '2025-08-21 12:41:53', '2025-08-21 12:41:53'),
(128, 98, 65, 5, 400.00, '2025-08-21 12:42:33', '2025-08-21 12:42:33'),
(129, 99, 11, 5, 50.00, '2025-08-21 12:43:41', '2025-08-21 12:43:41'),
(130, 100, 15, 10, 30.00, '2025-08-21 12:44:13', '2025-08-21 12:44:13'),
(131, 101, 2, 5, 300.00, '2025-08-22 09:18:58', '2025-08-22 09:18:58'),
(132, 102, 106, 4, 20.00, '2025-09-05 03:30:40', '2025-09-05 03:30:40'),
(133, 103, 43, 10, 2.00, '2025-09-07 00:16:10', '2025-09-07 00:16:10'),
(134, 104, 21, 2, 10.00, '2025-09-07 03:32:45', '2025-09-07 03:32:45'),
(135, 104, 32, 2, 20.00, '2025-09-07 03:32:45', '2025-09-07 03:32:45'),
(136, 104, 28, 2, 10.00, '2025-09-07 03:32:45', '2025-09-07 03:32:45'),
(137, 105, 7, 2, 100.00, '2025-09-07 03:52:01', '2025-09-07 03:52:01'),
(138, 105, 37, 2, 10.00, '2025-09-07 03:52:01', '2025-09-07 03:52:01'),
(139, 105, 45, 2, 50.00, '2025-09-07 03:52:01', '2025-09-07 03:52:01'),
(140, 105, 46, 3, 90.00, '2025-09-07 03:52:01', '2025-09-07 03:52:01'),
(141, 105, 111, 2, 400.00, '2025-09-07 03:52:01', '2025-09-07 03:52:01'),
(142, 105, 4, 2, 40.00, '2025-09-07 03:52:01', '2025-09-07 03:52:01'),
(143, 106, 75, 5, 15.00, '2025-09-07 04:32:40', '2025-09-07 04:32:40'),
(144, 106, 50, 4, 20.00, '2025-09-07 04:32:40', '2025-09-07 04:32:40'),
(145, 106, 102, 4, 3.00, '2025-09-07 04:32:40', '2025-09-07 04:32:40'),
(146, 106, 88, 4, 29.00, '2025-09-07 04:32:40', '2025-09-07 04:32:40'),
(148, 108, 37, 5, 5.00, '2025-09-08 02:48:42', '2025-09-08 02:48:42'),
(149, 108, 45, 5, 90.00, '2025-09-08 02:48:42', '2025-09-08 02:48:42'),
(150, 108, 36, 5, 200.00, '2025-09-08 02:48:42', '2025-09-08 02:48:42'),
(151, 108, 17, 5, 30.00, '2025-09-08 02:48:42', '2025-09-08 02:48:42'),
(152, 108, 14, 5, 20.00, '2025-09-08 02:48:42', '2025-09-08 02:48:42'),
(153, 108, 12, 5, 20.00, '2025-09-08 02:48:42', '2025-09-08 02:48:42'),
(154, 109, 41, 10, 3.00, '2025-09-09 12:20:58', '2025-09-09 12:20:58'),
(155, 110, 117, 10, 30.00, '2025-09-10 15:00:41', '2025-09-10 15:00:41'),
(156, 110, 116, 20, 5.00, '2025-09-10 15:00:41', '2025-09-10 15:00:41'),
(157, 110, 115, 10, 40.00, '2025-09-10 15:00:41', '2025-09-10 15:00:41'),
(159, 110, 83, 10, 10.00, '2025-09-10 15:00:41', '2025-09-10 15:00:41'),
(160, 111, 118, 5, 30.00, '2025-09-10 15:38:31', '2025-09-10 15:38:31'),
(161, 112, 7, 1, 90.00, '2025-09-12 12:50:13', '2025-09-12 12:50:13'),
(162, 113, 119, 10, 300.00, '2025-09-12 15:31:06', '2025-09-12 15:31:06'),
(163, 114, 121, 10, 3.00, '2025-09-12 16:15:53', '2025-09-12 16:15:53'),
(164, 114, 120, 10, 15.00, '2025-09-12 16:15:53', '2025-09-12 16:15:53'),
(165, 115, 9, 1, 1000.00, '2025-09-14 14:38:10', '2025-09-14 14:38:10'),
(166, 116, 41, 5, 3.00, '2025-09-14 14:42:06', '2025-09-14 14:42:06'),
(167, 117, 18, 1, 5.00, '2025-09-15 04:25:42', '2025-09-15 04:25:42'),
(168, 117, 54, 5, 7.00, '2025-09-15 04:25:42', '2025-09-15 04:25:42'),
(169, 118, 41, 1, 13.00, '2025-09-15 05:07:25', '2025-09-15 05:07:25'),
(170, 119, 122, 2, 100.00, '2025-09-15 06:52:58', '2025-09-15 06:52:58'),
(171, 120, 123, 3, 99.00, '2025-09-15 07:01:11', '2025-09-15 07:01:11'),
(172, 121, 99, 5, 10.00, '2025-09-16 02:33:29', '2025-09-16 02:33:29'),
(173, 122, 124, 5, 40.00, '2025-09-16 02:36:55', '2025-09-16 02:36:55'),
(174, 123, 122, 2, 320.00, '2025-09-16 02:48:29', '2025-09-16 02:48:29'),
(175, 124, 111, 5, 200.50, '2025-10-07 13:00:06', '2025-10-07 13:00:06'),
(178, 127, 33, 5, 50.00, '2025-10-09 14:13:48', '2025-10-09 14:13:48'),
(179, 131, 33, 1, 50.51, '2025-10-09 14:37:54', '2025-10-09 14:37:54'),
(180, 132, 51, 1, 45.00, '2025-10-09 14:39:13', '2025-10-09 14:39:13'),
(181, 133, 65, 1, 100.90, '2025-10-09 14:44:41', '2025-10-09 14:44:41'),
(182, 134, 123, 1, 99.99, '2025-10-09 15:14:55', '2025-10-09 15:14:55'),
(183, 135, 1, 1, 100.99, '2025-10-09 15:18:18', '2025-10-09 15:18:18'),
(184, 136, 97, 5, 70.00, '2025-10-11 23:29:29', '2025-10-12 00:03:11'),
(185, 136, 18, 5, 5.50, '2025-10-11 23:29:29', '2025-10-11 23:29:29'),
(186, 137, 6, 1, 100.00, '2025-10-12 00:18:00', '2025-10-12 00:18:00'),
(187, 138, 74, 1, 6.00, '2025-10-15 04:27:40', '2025-10-15 04:34:35'),
(191, 141, 125, 5, 100.00, '2025-10-19 21:45:03', '2025-10-21 13:19:43'),
(192, 142, 125, 2, 120.00, '2025-10-19 21:55:41', '2025-10-19 22:05:12'),
(194, 144, 126, 6, 150.00, '2025-10-21 14:12:04', '2025-10-23 03:14:32'),
(195, 144, 127, 4, 790.00, '2025-10-23 06:25:45', '2025-10-23 06:25:45'),
(196, 145, 128, 4, 120.00, '2025-10-23 06:38:28', '2025-10-23 06:38:28');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `customer_id` bigint UNSIGNED DEFAULT NULL,
  `sale_date` date DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `total_pay` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `user_id`, `customer_id`, `sale_date`, `note`, `total_pay`, `created_at`, `updated_at`) VALUES
(1, 1, 11, '2025-06-14', NULL, NULL, '2025-06-14 06:05:44', '2025-06-26 02:35:16'),
(2, 1, 11, '2025-05-15', NULL, NULL, '2025-06-16 08:40:12', '2025-06-25 15:31:46'),
(3, 1, 9, '2025-06-20', NULL, NULL, '2025-06-20 11:27:55', '2025-06-25 15:31:36'),
(4, 1, 11, '2025-06-20', NULL, NULL, '2025-06-20 11:28:09', '2025-06-25 15:31:10'),
(5, 1, 11, '2024-12-26', NULL, NULL, '2025-06-26 03:33:23', '2025-06-26 03:33:23'),
(6, 1, 8, '2025-02-26', '<p>SN013985638671</p>', NULL, '2025-06-26 03:34:14', '2025-06-26 03:34:14'),
(7, 1, 11, '2025-04-26', NULL, NULL, '2025-06-26 03:35:09', '2025-06-26 03:35:09'),
(8, 1, 2, '2025-05-26', NULL, NULL, '2025-06-26 03:36:58', '2025-06-26 03:36:58'),
(9, 1, 11, '2025-05-14', NULL, NULL, '2025-06-26 03:37:20', '2025-06-26 03:37:20'),
(10, 1, 1, '2024-06-18', NULL, NULL, '2025-06-26 03:39:52', '2025-06-26 03:39:52'),
(11, 1, 11, '2025-06-27', NULL, NULL, '2025-06-27 03:59:01', '2025-06-27 03:59:01'),
(12, 2, 8, '2025-06-27', NULL, NULL, '2025-06-27 07:36:45', '2025-06-27 07:36:45'),
(13, 1, 9, '2025-06-30', NULL, NULL, '2025-06-30 05:02:58', '2025-06-30 05:18:16'),
(14, 1, 11, '2025-06-30', NULL, NULL, '2025-06-30 05:32:44', '2025-06-30 05:32:44'),
(15, 1, 3, '2025-06-30', NULL, NULL, '2025-06-30 06:16:58', '2025-06-30 06:16:58'),
(16, 1, 9, '2025-06-30', NULL, NULL, '2025-06-30 07:47:25', '2025-06-30 07:47:25'),
(17, 1, 11, '2025-07-11', NULL, NULL, '2025-07-11 03:06:10', '2025-07-11 03:06:10'),
(18, 1, 11, '2025-08-21', '<p>SN 82494186231</p>', NULL, '2025-08-21 04:33:55', '2025-08-21 04:33:55'),
(19, 3, 1, '2024-01-23', '<p>SNID: 49285710364</p><p>&nbsp;</p>', NULL, '2025-08-21 09:47:11', '2025-08-21 09:47:11'),
(20, 3, 1, '2024-04-26', '<p>SNID: 83106427598</p>', NULL, '2025-08-21 09:48:37', '2025-08-21 09:48:37'),
(21, 3, 1, '2025-08-21', '<p>SNID: 72059148362</p>', NULL, '2025-08-21 09:49:12', '2025-08-21 09:49:12'),
(22, 3, 1, '2024-06-29', '<p>SNID: 16573892041</p><p><br><br></p><p><br></p>', NULL, '2025-08-21 09:50:01', '2025-08-21 09:50:01'),
(23, 3, 1, '2024-10-09', '<p>SNID: 39482071653</p>', NULL, '2025-08-21 09:50:41', '2025-08-21 12:50:16'),
(24, 3, 1, '2024-10-22', '<p>SNID: 85720146390</p>', NULL, '2025-08-21 09:51:45', '2025-08-21 09:51:45'),
(25, 3, 1, '2025-05-10', '<p>SNID: 61439728501</p>', NULL, '2025-08-21 09:52:17', '2025-08-21 09:52:18'),
(26, 3, 11, '2024-06-13', '<p>SNID: 90846217530</p>', NULL, '2025-08-21 09:55:06', '2025-08-21 09:55:06'),
(27, 3, 11, '2024-07-14', '<p>SNID: 16374950827</p>', NULL, '2025-08-21 09:55:53', '2025-08-21 09:55:54'),
(28, 3, 1, '2024-08-28', '<p>SNID: 38460217954</p>', NULL, '2025-08-21 09:57:01', '2025-08-21 09:57:01'),
(29, 3, 1, '2024-11-11', '<p>SNID: 16374950827</p>', NULL, '2025-08-21 09:58:03', '2025-08-21 12:49:59'),
(30, 3, 1, '2024-12-21', '<p>SNID: 38460217954</p>', NULL, '2025-08-21 09:58:53', '2025-08-21 09:58:53'),
(31, 3, 1, '2025-01-17', '<p>SNID: 72910548360</p>', NULL, '2025-08-21 09:59:28', '2025-08-21 09:59:28'),
(32, 3, 11, '2025-03-30', '<p>SNID: 56091823741</p>', NULL, '2025-08-21 10:00:01', '2025-08-21 10:00:01'),
(33, 3, 11, '2025-04-29', '<p>SNID: 48137609258</p>', NULL, '2025-08-21 10:00:35', '2025-08-21 10:00:35'),
(34, 3, 1, '2025-06-01', '<p>SNID: 29784506139</p>', NULL, '2025-08-21 10:02:27', '2025-08-21 10:02:27'),
(35, 5, 1, '2024-09-17', '<p>SNID: 10396478250</p><p><br><br></p>', NULL, '2025-08-21 10:06:19', '2025-08-21 10:06:19'),
(36, 5, 11, '2024-10-08', '<p>SNID: 65217049386</p>', NULL, '2025-08-21 10:07:04', '2025-08-21 10:07:17'),
(37, 5, 1, '2024-12-06', '<p>SNID: 87403521690</p>', NULL, '2025-08-21 10:07:50', '2025-08-21 12:49:40'),
(38, 4, 1, '2024-10-16', '<p>SNID: 51928374601</p>', NULL, '2025-08-21 10:08:48', '2025-08-21 10:08:48'),
(39, 4, 1, '2024-12-26', '<p>SNID: 73064912857</p>', NULL, '2025-08-21 10:09:16', '2025-08-21 10:09:16'),
(40, 4, 1, '2025-03-17', '<p>SNID: 94618257304</p>', NULL, '2025-08-21 10:09:53', '2025-08-21 10:09:53'),
(41, 6, 1, '2025-08-20', '<p>SNID: 13274189230</p>', NULL, '2025-08-21 12:52:09', '2025-08-21 12:52:09'),
(42, 6, 1, '2025-07-02', '<p>SNID: 32157839172</p>', NULL, '2025-08-21 12:54:13', '2025-08-21 12:54:13'),
(43, 5, 1, '2023-02-19', NULL, NULL, '2025-08-21 12:57:35', '2025-08-21 12:57:35'),
(44, 5, 1, '2023-02-20', NULL, NULL, '2025-08-21 12:58:07', '2025-08-21 12:58:07'),
(45, 5, 8, '2023-03-03', NULL, NULL, '2025-08-21 12:58:43', '2025-08-21 12:58:43'),
(46, 5, 1, '2023-05-11', NULL, NULL, '2025-08-21 12:59:15', '2025-08-21 12:59:15'),
(47, 5, 1, '2025-06-17', NULL, NULL, '2025-08-21 13:00:32', '2025-08-21 13:00:32'),
(48, 5, 1, '2023-07-19', NULL, NULL, '2025-08-21 13:00:57', '2025-08-21 13:00:57'),
(49, 5, 1, '2023-09-01', NULL, NULL, '2025-08-21 13:01:29', '2025-08-21 13:01:29'),
(50, 5, 1, '2023-10-21', NULL, NULL, '2025-08-21 13:01:51', '2025-08-21 13:01:51'),
(51, 5, 4, '2023-12-25', '<p>SNID: 28561890113</p>', NULL, '2025-08-21 13:02:50', '2025-08-21 13:02:50'),
(52, 5, 1, '2023-12-27', NULL, NULL, '2025-08-21 13:03:16', '2025-08-21 13:03:16'),
(53, 5, 1, '2024-01-12', NULL, NULL, '2025-08-21 13:03:40', '2025-08-21 13:03:40'),
(54, 5, 1, '2024-01-17', NULL, NULL, '2025-08-21 13:04:02', '2025-08-21 13:04:02'),
(55, 5, 1, '2024-02-13', NULL, NULL, '2025-08-21 13:04:25', '2025-08-21 13:04:25'),
(56, 5, 1, '2024-02-20', NULL, NULL, '2025-08-21 13:04:44', '2025-08-21 13:04:44'),
(57, 5, 1, '2024-04-05', NULL, NULL, '2025-08-21 13:05:19', '2025-08-21 13:05:19'),
(58, 5, 1, '2024-04-13', NULL, NULL, '2025-08-21 13:05:56', '2025-08-21 13:05:56'),
(59, 5, 1, '2024-04-22', NULL, NULL, '2025-08-21 13:06:30', '2025-08-21 13:06:30'),
(60, 5, 1, '2024-07-04', NULL, NULL, '2025-08-21 13:06:54', '2025-08-21 13:06:54'),
(61, 5, 1, '2024-07-27', NULL, NULL, '2025-08-21 13:07:18', '2025-08-21 13:07:18'),
(62, 5, 1, '2024-09-24', NULL, NULL, '2025-08-21 13:07:42', '2025-08-21 13:07:42'),
(63, 5, 1, '2024-12-14', NULL, NULL, '2025-08-21 13:08:14', '2025-08-21 13:08:14'),
(64, 5, 1, '2025-01-19', NULL, NULL, '2025-08-21 13:08:34', '2025-08-21 13:08:34'),
(65, 5, 1, '2025-01-21', NULL, NULL, '2025-08-21 13:09:02', '2025-08-21 13:09:02'),
(66, 5, 1, '2025-04-25', NULL, NULL, '2025-08-21 13:09:23', '2025-08-21 13:09:23'),
(67, 5, 1, '2025-05-17', NULL, NULL, '2025-08-21 13:09:50', '2025-08-21 13:09:50'),
(68, 4, 1, '2023-02-07', NULL, NULL, '2025-08-21 15:14:43', '2025-08-21 15:14:43'),
(69, 4, 1, '2023-04-22', NULL, NULL, '2025-08-21 15:15:13', '2025-08-21 15:15:13'),
(70, 4, 1, '2023-05-23', NULL, NULL, '2025-08-21 15:15:33', '2025-08-21 15:15:33'),
(71, 4, 6, '2023-06-03', '<p>SNID: 75638219461</p>', NULL, '2025-08-21 15:16:16', '2025-08-21 15:16:16'),
(72, 4, 1, '2023-06-21', NULL, NULL, '2025-08-21 15:16:45', '2025-08-21 15:16:46'),
(73, 4, 1, '2023-06-26', NULL, NULL, '2025-08-21 15:17:09', '2025-08-21 15:17:09'),
(74, 4, 1, '2023-07-01', NULL, NULL, '2025-08-21 15:17:54', '2025-08-21 15:17:54'),
(75, 4, 1, '2023-09-16', NULL, NULL, '2025-08-21 15:18:18', '2025-08-21 15:18:18'),
(76, 4, 1, '2023-09-24', NULL, NULL, '2025-08-21 15:18:46', '2025-08-21 15:18:46'),
(77, 4, 1, '2024-01-11', NULL, NULL, '2025-08-21 15:19:11', '2025-08-21 15:19:11'),
(78, 4, 1, '2024-02-28', NULL, NULL, '2025-08-21 15:19:44', '2025-08-21 15:19:44'),
(79, 4, 1, '2024-05-03', NULL, NULL, '2025-08-21 15:20:16', '2025-08-21 15:20:16'),
(80, 4, 1, '2024-07-04', NULL, NULL, '2025-08-21 15:20:59', '2025-08-21 15:20:59'),
(81, 4, 1, '2024-07-10', NULL, NULL, '2025-08-21 15:21:19', '2025-08-21 15:21:19'),
(82, 4, 1, '2024-08-04', NULL, NULL, '2025-08-21 15:21:49', '2025-08-21 15:21:49'),
(83, 4, 1, '2024-09-27', NULL, NULL, '2025-08-21 15:22:18', '2025-08-21 15:22:18'),
(84, 4, 1, '2024-11-26', NULL, NULL, '2025-08-21 15:22:50', '2025-08-21 15:22:50'),
(85, 4, 1, '2024-12-06', NULL, NULL, '2025-08-21 15:23:18', '2025-08-21 15:23:18'),
(86, 4, 1, '2024-12-16', NULL, NULL, '2025-08-21 15:23:47', '2025-08-21 15:23:47'),
(87, 4, 7, '2025-01-23', NULL, NULL, '2025-08-21 15:24:22', '2025-08-21 15:24:22'),
(88, 4, 1, '2025-01-30', NULL, NULL, '2025-08-21 15:24:42', '2025-08-21 15:24:42'),
(89, 4, 1, '2025-03-16', NULL, NULL, '2025-08-21 15:25:17', '2025-08-21 15:25:17'),
(90, 4, 1, '2025-04-05', NULL, NULL, '2025-08-21 15:25:42', '2025-08-21 15:25:42'),
(91, 4, 1, '2025-06-05', NULL, NULL, '2025-08-21 15:26:15', '2025-08-21 15:26:15'),
(92, 4, 1, '2025-08-18', NULL, NULL, '2025-08-21 15:26:50', '2025-08-21 15:26:50'),
(93, 4, 1, '2025-08-16', NULL, NULL, '2025-08-21 15:27:42', '2025-08-21 15:27:42'),
(94, 4, 1, '2024-11-06', NULL, NULL, '2025-08-21 15:28:12', '2025-08-21 15:28:12'),
(95, 6, 1, '2023-03-01', NULL, NULL, '2025-08-21 15:33:55', '2025-08-21 15:33:55'),
(96, 6, 1, '2023-05-29', NULL, NULL, '2025-08-21 15:34:44', '2025-08-21 15:34:44'),
(97, 6, 1, '2023-06-23', NULL, NULL, '2025-08-21 15:35:29', '2025-08-21 15:35:29'),
(98, 6, 1, '2023-07-24', NULL, NULL, '2025-08-21 15:36:03', '2025-08-21 15:36:03'),
(99, 6, 1, '2023-08-18', NULL, NULL, '2025-08-21 15:36:32', '2025-08-21 15:36:32'),
(100, 6, 1, '2023-09-16', NULL, NULL, '2025-08-21 15:37:13', '2025-08-21 15:37:13'),
(101, 6, 1, '2023-10-30', NULL, NULL, '2025-08-21 15:37:52', '2025-08-21 15:37:52'),
(102, 6, 1, '2023-11-29', NULL, NULL, '2025-08-21 15:38:31', '2025-08-21 15:38:31'),
(103, 6, 1, '2023-12-31', NULL, NULL, '2025-08-21 15:39:05', '2025-08-21 15:39:05'),
(104, 6, 1, '2024-01-17', NULL, NULL, '2025-08-21 15:39:35', '2025-08-21 15:39:36'),
(105, 6, 1, '2024-02-16', NULL, NULL, '2025-08-21 15:40:08', '2025-08-21 15:40:08'),
(106, 6, 1, '2024-03-26', NULL, NULL, '2025-08-21 15:40:31', '2025-08-21 15:40:31'),
(107, 6, 1, '2024-04-05', NULL, NULL, '2025-08-21 15:40:55', '2025-08-21 15:40:55'),
(108, 6, 1, '2024-05-05', '<p>SNID: 927491730122</p>', NULL, '2025-08-21 15:41:27', '2025-08-21 15:41:27'),
(109, 6, 1, '2024-06-08', NULL, NULL, '2025-08-21 15:41:52', '2025-08-21 15:41:52'),
(110, 6, 1, '2024-08-10', NULL, NULL, '2025-08-21 15:42:19', '2025-08-21 15:42:19'),
(111, 6, 1, '2024-09-25', '<p>SNID: 328717481232</p>', NULL, '2025-08-21 15:42:50', '2025-08-21 15:42:50'),
(112, 6, 1, '2024-09-01', NULL, NULL, '2025-08-21 15:43:20', '2025-08-21 15:43:20'),
(113, 6, 1, '2024-10-31', NULL, NULL, '2025-08-21 15:43:57', '2025-08-21 15:43:57'),
(114, 6, 1, '2024-11-22', '<p>SNID: 93864012354</p>', NULL, '2025-08-21 15:44:28', '2025-08-21 15:44:28'),
(115, 6, 1, '2024-12-26', NULL, NULL, '2025-08-21 15:44:56', '2025-08-21 15:44:56'),
(116, 6, 1, '2025-01-13', NULL, NULL, '2025-08-21 15:45:22', '2025-08-21 15:45:22'),
(117, 6, 1, '2025-02-11', NULL, NULL, '2025-08-21 15:45:53', '2025-08-21 15:45:53'),
(118, 6, 1, '2025-03-08', NULL, NULL, '2025-08-21 15:46:17', '2025-08-21 15:46:17'),
(119, 6, 1, '2025-05-22', NULL, NULL, '2025-08-21 15:46:39', '2025-08-21 15:46:39'),
(120, 6, 1, '2025-08-10', NULL, NULL, '2025-08-21 15:46:58', '2025-08-21 15:46:58'),
(121, 6, 1, '2025-06-02', NULL, NULL, '2025-08-21 15:47:17', '2025-08-21 15:47:17'),
(122, 6, 1, '2025-07-21', NULL, NULL, '2025-08-21 15:47:31', '2025-08-21 15:47:31'),
(123, 6, 1, '2025-08-08', NULL, NULL, '2025-08-21 15:48:03', '2025-08-21 15:48:03'),
(124, 6, 1, '2025-08-19', NULL, NULL, '2025-08-21 15:48:36', '2025-08-21 15:48:36'),
(125, 6, 1, '2025-08-15', NULL, NULL, '2025-08-21 15:49:06', '2025-08-21 15:49:06'),
(126, 6, 1, '2025-08-14', NULL, NULL, '2025-08-21 15:49:31', '2025-08-21 15:49:31'),
(127, 6, 1, '2025-08-13', '<p>SNID:29581283123</p>', NULL, '2025-08-21 15:50:09', '2025-08-21 15:50:09'),
(128, 6, 1, '2025-08-12', NULL, NULL, '2025-08-21 15:50:33', '2025-08-21 15:50:33'),
(129, 6, 1, '2025-07-24', '<p>SNID: 92381623498</p>', NULL, '2025-08-21 15:50:59', '2025-08-21 15:50:59'),
(130, 6, 1, '2025-08-11', NULL, NULL, '2025-08-21 15:51:25', '2025-08-21 15:51:25'),
(131, 6, 1, '2025-08-05', NULL, NULL, '2025-08-21 15:51:46', '2025-08-21 15:51:46'),
(132, 6, 1, '2025-08-09', NULL, NULL, '2025-08-21 15:52:16', '2025-08-21 15:52:16'),
(133, 6, 1, '2025-08-07', NULL, NULL, '2025-08-21 15:52:40', '2025-08-21 15:52:40'),
(134, 6, 1, '2025-08-06', NULL, NULL, '2025-08-21 15:52:59', '2025-08-21 15:52:59'),
(135, 6, 1, '2025-08-01', '<p>SNID: 85728654891</p>', NULL, '2025-08-21 15:53:44', '2025-08-21 15:53:44'),
(136, 6, 1, '2025-07-29', NULL, NULL, '2025-08-21 15:54:25', '2025-08-21 15:54:25'),
(137, 6, 1, '2025-08-02', '<p>SNID: 83745819231</p>', NULL, '2025-08-21 15:55:07', '2025-08-21 15:55:07'),
(138, 6, 1, '2025-08-03', NULL, NULL, '2025-08-21 15:56:41', '2025-08-21 15:56:41'),
(139, 6, 1, '2025-08-04', NULL, NULL, '2025-08-21 15:57:04', '2025-08-21 15:57:04'),
(140, 6, 1, '2025-07-28', NULL, NULL, '2025-08-21 15:57:23', '2025-08-21 15:57:23'),
(141, 6, 1, '2025-07-31', NULL, NULL, '2025-08-21 15:57:45', '2025-08-21 15:57:45'),
(142, 6, 1, '2025-07-30', NULL, NULL, '2025-08-21 15:58:12', '2025-08-21 15:58:12'),
(143, 6, 1, '2025-08-21', NULL, NULL, '2025-08-21 15:58:45', '2025-08-22 07:53:22'),
(144, 6, 1, '2025-07-27', NULL, NULL, '2025-08-21 15:59:12', '2025-08-21 15:59:12'),
(145, 6, 1, '2025-07-26', NULL, NULL, '2025-08-21 15:59:37', '2025-08-21 15:59:37'),
(146, 6, 1, '2025-07-25', NULL, NULL, '2025-08-21 16:00:04', '2025-08-21 16:00:04'),
(147, 6, 1, '2025-07-23', NULL, NULL, '2025-08-21 16:00:35', '2025-08-21 16:00:35'),
(148, 6, 1, '2025-07-22', NULL, NULL, '2025-08-21 16:00:51', '2025-08-21 16:00:51'),
(149, 6, 1, '2025-07-20', NULL, NULL, '2025-08-21 16:01:21', '2025-08-21 16:01:21'),
(150, 6, 1, '2025-07-22', NULL, NULL, '2025-08-21 16:01:59', '2025-08-21 16:01:59'),
(151, 6, 1, '2025-07-22', NULL, NULL, '2025-08-21 16:02:36', '2025-08-21 16:02:36'),
(152, 6, 1, '2023-04-18', NULL, NULL, '2025-08-21 16:11:07', '2025-08-21 16:11:07'),
(153, 6, 1, '2023-01-01', NULL, NULL, '2025-08-21 16:11:47', '2025-08-21 16:11:47'),
(154, 6, 1, '2024-11-16', NULL, NULL, '2025-08-21 16:13:18', '2025-08-21 16:13:18'),
(155, 6, 1, '2025-02-11', NULL, NULL, '2025-08-21 16:13:36', '2025-08-21 16:13:36'),
(156, 3, 1, '2025-04-01', NULL, NULL, '2025-08-21 16:15:11', '2025-08-21 16:15:11'),
(157, 3, 1, '2025-04-12', '<p>SNID: 84189619842</p>', NULL, '2025-08-21 16:15:34', '2025-08-21 16:15:34'),
(158, 3, 1, '2025-04-08', NULL, NULL, '2025-08-21 16:15:56', '2025-08-21 16:15:56'),
(159, 3, 1, '2024-10-21', NULL, NULL, '2025-08-21 16:16:32', '2025-08-21 16:16:32'),
(160, 3, 1, '2025-03-11', NULL, NULL, '2025-08-21 16:23:33', '2025-08-21 16:23:33'),
(161, 3, 1, '2025-01-15', NULL, NULL, '2025-08-21 16:24:09', '2025-08-21 16:24:09'),
(162, 3, 1, '2025-07-21', NULL, NULL, '2025-08-21 16:24:32', '2025-08-21 16:24:32'),
(163, 3, 1, '2025-08-05', NULL, NULL, '2025-08-21 16:25:42', '2025-08-21 16:25:42'),
(164, 3, 1, '2025-06-09', NULL, NULL, '2025-08-21 16:26:06', '2025-08-21 16:26:06'),
(165, 3, 1, '2025-07-22', NULL, NULL, '2025-08-21 16:27:05', '2025-08-21 16:27:05'),
(166, 3, 1, '2024-03-12', NULL, NULL, '2025-08-21 16:33:04', '2025-08-21 16:33:04'),
(167, 4, 1, '2025-08-22', NULL, NULL, '2025-08-22 02:11:44', '2025-08-22 02:11:44'),
(168, 4, 5, '2025-08-22', NULL, NULL, '2025-08-22 07:52:42', '2025-08-22 07:52:42'),
(169, 1, 12, '2025-09-02', NULL, NULL, '2025-09-02 03:31:48', '2025-09-02 03:31:48'),
(170, 1, 9, '2025-09-02', NULL, NULL, '2025-09-02 03:34:19', '2025-09-02 03:34:19'),
(172, 3, 1, '2025-09-05', NULL, NULL, '2025-09-05 03:51:00', '2025-09-05 03:51:00'),
(173, 3, 2, '2025-09-05', NULL, NULL, '2025-09-05 03:52:33', '2025-09-05 03:52:33'),
(174, 3, 5, '2025-09-05', NULL, NULL, '2025-09-05 03:55:35', '2025-09-05 03:55:35'),
(177, 3, 1, '2025-09-07', NULL, NULL, '2025-09-07 02:16:41', '2025-09-07 02:16:41'),
(178, 3, 2, '2025-09-07', NULL, NULL, '2025-09-07 05:32:00', '2025-09-07 05:32:00'),
(179, 3, 1, '2025-09-01', NULL, NULL, '2025-09-08 02:13:50', '2025-09-08 02:13:50'),
(180, 3, 2, '2025-09-04', NULL, NULL, '2025-09-08 02:23:46', '2025-09-08 02:23:46'),
(181, 3, 1, '2025-09-08', NULL, NULL, '2025-09-08 02:24:54', '2025-09-08 02:24:54'),
(182, 3, 1, '2025-09-04', NULL, NULL, '2025-09-08 02:51:18', '2025-09-08 02:51:18'),
(183, 3, 11, '2025-09-08', NULL, NULL, '2025-09-08 02:51:42', '2025-09-08 02:51:42'),
(184, 3, 1, '2025-09-08', NULL, NULL, '2025-09-08 03:00:11', '2025-09-08 03:00:11'),
(185, 3, 1, '2025-09-08', NULL, NULL, '2025-09-08 03:00:57', '2025-09-08 03:00:57'),
(186, 3, 1, '2025-09-08', NULL, NULL, '2025-09-08 03:15:08', '2025-09-08 03:15:08'),
(187, 3, 1, '2025-09-08', NULL, NULL, '2025-09-08 03:16:10', '2025-09-08 03:16:10'),
(188, 3, 1, '2025-09-08', NULL, NULL, '2025-09-08 03:18:54', '2025-09-08 03:18:54'),
(189, 3, 1, '2025-09-08', NULL, NULL, '2025-09-08 03:19:09', '2025-09-08 03:19:09'),
(190, 3, 1, '2025-09-08', NULL, NULL, '2025-09-08 03:20:21', '2025-09-08 03:20:21'),
(191, 3, 1, '2025-09-08', NULL, NULL, '2025-09-08 03:30:40', '2025-09-08 03:30:40'),
(192, 3, 1, '2025-09-08', NULL, NULL, '2025-09-08 03:31:33', '2025-09-08 03:31:33'),
(193, 3, 1, '2025-09-08', NULL, NULL, '2025-09-08 03:38:50', '2025-09-08 03:38:50'),
(194, 3, 1, '2025-09-08', NULL, NULL, '2025-09-08 03:53:39', '2025-09-08 03:53:39'),
(195, 3, 1, '2025-09-08', NULL, NULL, '2025-09-08 04:02:13', '2025-09-08 04:02:13'),
(196, 3, 1, '2025-09-08', NULL, NULL, '2025-09-08 04:02:39', '2025-09-08 04:02:39'),
(197, 3, 12, '2025-09-08', NULL, NULL, '2025-09-08 04:23:56', '2025-09-08 04:23:56'),
(198, 3, 1, '2025-09-08', NULL, NULL, '2025-09-08 04:24:13', '2025-09-08 04:24:13'),
(199, 3, 1, '2025-09-08', NULL, NULL, '2025-09-08 04:24:30', '2025-09-08 04:24:30'),
(200, 3, 2, '2025-09-08', NULL, NULL, '2025-09-08 04:24:46', '2025-09-08 04:24:46'),
(201, 3, 1, '2025-09-08', NULL, NULL, '2025-09-08 04:25:05', '2025-09-08 04:25:05'),
(202, 3, 2, '2025-09-08', NULL, NULL, '2025-09-08 04:32:48', '2025-09-08 04:32:48'),
(203, 3, 10, '2025-09-08', NULL, NULL, '2025-09-08 04:33:20', '2025-09-08 04:33:20'),
(204, 3, 1, '2025-09-08', NULL, NULL, '2025-09-08 04:33:47', '2025-09-08 04:33:47'),
(205, 3, 9, '2025-09-08', NULL, NULL, '2025-09-08 04:34:10', '2025-09-08 04:34:10'),
(206, 3, 1, '2025-09-08', NULL, NULL, '2025-09-08 04:34:27', '2025-09-08 04:34:27'),
(207, 3, 1, '2025-09-08', NULL, NULL, '2025-09-08 04:34:52', '2025-09-08 04:34:52'),
(208, 3, 11, '2025-09-04', NULL, NULL, '2025-09-08 04:49:05', '2025-09-08 04:49:05'),
(209, 3, 11, '2025-09-04', NULL, NULL, '2025-09-08 04:50:02', '2025-09-08 04:50:02'),
(210, 3, 11, '2025-09-06', NULL, NULL, '2025-09-08 04:50:39', '2025-09-08 04:50:39'),
(211, 3, 1, '2025-09-08', NULL, NULL, '2025-09-08 04:51:51', '2025-09-08 04:51:51'),
(212, 3, 1, '2025-09-08', NULL, NULL, '2025-09-08 04:52:00', '2025-09-08 04:52:00'),
(213, 3, 1, '2025-09-08', NULL, NULL, '2025-09-08 04:52:15', '2025-09-08 04:52:15'),
(214, 3, 1, '2025-09-08', NULL, NULL, '2025-09-08 04:52:32', '2025-09-08 04:52:32'),
(215, 3, 1, '2025-09-08', NULL, NULL, '2025-09-08 04:52:48', '2025-09-08 04:52:48'),
(216, 3, 1, '2025-09-08', NULL, NULL, '2025-09-08 04:53:04', '2025-09-08 04:53:04'),
(217, 3, 1, '2025-09-08', NULL, NULL, '2025-09-08 04:53:23', '2025-09-08 04:53:23'),
(218, 3, 1, '2025-09-08', NULL, NULL, '2025-09-08 04:53:34', '2025-09-08 04:53:34'),
(219, 3, 1, '2025-09-08', NULL, NULL, '2025-09-08 04:53:47', '2025-09-08 04:53:47'),
(220, 3, 1, '2025-09-08', NULL, NULL, '2025-09-08 04:54:08', '2025-09-08 04:54:08'),
(221, 7, 1, '2025-09-08', NULL, NULL, '2025-09-08 07:27:53', '2025-09-08 07:27:53'),
(222, 7, 1, '2025-09-08', NULL, NULL, '2025-09-08 07:30:15', '2025-09-08 07:30:15'),
(223, 7, 11, '2025-08-01', NULL, NULL, '2025-09-08 08:23:31', '2025-09-08 08:23:31'),
(224, 7, 11, '2025-08-03', NULL, NULL, '2025-09-08 08:25:25', '2025-09-08 08:25:25'),
(225, 7, 11, '2025-08-14', NULL, NULL, '2025-09-08 08:26:23', '2025-09-08 08:26:23'),
(226, 7, 11, '2025-08-31', NULL, NULL, '2025-09-08 08:26:49', '2025-09-08 08:26:49'),
(227, 7, 1, '2025-08-12', NULL, NULL, '2025-09-08 08:27:29', '2025-09-08 08:27:29'),
(228, 7, 1, '2025-08-20', NULL, NULL, '2025-09-08 08:29:47', '2025-09-08 08:29:47'),
(229, 7, 1, '2025-08-18', NULL, NULL, '2025-09-08 08:42:15', '2025-09-08 08:42:15'),
(230, 7, 1, '2025-08-23', NULL, NULL, '2025-09-08 08:43:05', '2025-09-08 08:43:05'),
(231, 7, 1, '2025-08-19', NULL, NULL, '2025-09-08 08:43:38', '2025-09-08 08:43:38'),
(232, 7, 1, '2025-08-15', NULL, NULL, '2025-09-08 08:44:23', '2025-09-08 08:44:23'),
(233, 7, 1, '2025-08-26', NULL, NULL, '2025-09-08 08:44:53', '2025-09-08 08:44:53'),
(234, 7, 11, '2025-08-12', NULL, NULL, '2025-09-08 08:45:29', '2025-09-08 08:45:29'),
(235, 7, 5, '2025-08-16', NULL, NULL, '2025-09-08 08:46:14', '2025-09-08 08:46:14'),
(236, 7, 1, '2025-09-08', NULL, NULL, '2025-09-08 08:49:00', '2025-09-08 08:49:00'),
(237, 7, 1, '2025-09-08', NULL, NULL, '2025-09-08 08:49:14', '2025-09-08 08:49:14'),
(238, 7, 1, '2025-09-08', NULL, NULL, '2025-09-08 08:49:29', '2025-09-08 08:49:29'),
(239, 7, 1, '2025-09-08', NULL, NULL, '2025-09-08 08:49:41', '2025-09-08 08:49:41'),
(240, 7, 1, '2025-09-08', NULL, NULL, '2025-09-08 08:50:04', '2025-09-08 08:50:04'),
(241, 7, 1, '2025-09-08', NULL, NULL, '2025-09-08 08:51:35', '2025-09-08 08:51:35'),
(243, 3, 2, '2025-09-08', NULL, NULL, '2025-09-08 09:21:01', '2025-09-08 09:21:01'),
(244, 3, 1, '2025-09-10', NULL, NULL, '2025-09-10 09:13:03', '2025-09-10 09:13:03'),
(245, 3, 1, '2025-09-10', NULL, NULL, '2025-09-10 09:27:15', '2025-09-10 09:27:15'),
(246, 3, 1, '2025-09-10', NULL, NULL, '2025-09-10 09:37:35', '2025-09-10 09:37:35'),
(247, 3, 1, '2025-09-10', NULL, NULL, '2025-09-10 09:41:55', '2025-09-10 09:41:55'),
(248, 3, 1, '2025-09-10', NULL, NULL, '2025-09-10 09:50:22', '2025-09-10 09:50:22'),
(249, 3, 1, '2025-09-10', NULL, NULL, '2025-09-10 09:57:17', '2025-09-10 09:57:17'),
(250, 3, 1, '2025-09-10', NULL, NULL, '2025-09-10 10:02:24', '2025-09-10 10:02:24'),
(251, 3, 1, '2025-09-10', NULL, NULL, '2025-09-10 10:05:26', '2025-09-10 10:05:26'),
(252, 3, 1, '2025-09-10', NULL, NULL, '2025-09-10 10:07:01', '2025-09-10 10:07:01'),
(253, 3, 1, '2025-09-10', NULL, 20.00, '2025-09-10 10:11:46', '2025-09-10 10:11:46'),
(254, 3, 1, '2025-09-10', NULL, 20.00, '2025-09-10 11:49:00', '2025-09-10 11:49:00'),
(259, 3, 1, '2025-09-10', NULL, 40.00, '2025-09-10 15:32:20', '2025-09-10 15:32:20'),
(261, 7, 1, '2025-09-15', NULL, 20.00, '2025-09-15 01:55:15', '2025-09-15 01:55:15'),
(262, 7, 3, '2025-09-15', NULL, 20.00, '2025-09-15 01:59:24', '2025-09-15 01:59:24'),
(263, 3, 4, '2025-09-15', NULL, 125.00, '2025-09-15 03:04:28', '2025-09-15 03:04:28'),
(264, 7, 1, '2025-09-15', NULL, 36.00, '2025-09-15 03:38:43', '2025-09-15 03:38:43'),
(265, 7, 2, '2025-09-15', NULL, 12.50, '2025-09-15 03:54:46', '2025-09-15 03:54:46'),
(266, 7, 17, '2025-09-15', NULL, 25.00, '2025-09-15 05:12:12', '2025-09-15 05:12:12'),
(270, 7, 13, '2025-09-15', NULL, 20.00, '2025-09-15 06:39:41', '2025-09-15 06:39:41'),
(271, 7, 18, '2025-09-15', NULL, 330.00, '2025-09-15 06:57:16', '2025-09-15 06:57:16'),
(272, 7, 16, '2025-09-15', NULL, 700.00, '2025-09-15 07:02:05', '2025-09-15 07:02:05'),
(273, 3, 1, '2025-09-16', NULL, 20.00, '2025-09-16 02:17:33', '2025-09-16 02:17:33'),
(274, 3, 13, '2025-09-16', NULL, 61.00, '2025-09-16 02:33:59', '2025-09-16 02:33:59'),
(275, 3, 4, '2025-09-16', NULL, 36.00, '2025-09-16 02:34:27', '2025-09-16 02:34:27'),
(276, 3, 1, '2025-09-16', NULL, 20.00, '2025-09-16 02:34:46', '2025-09-16 02:34:46'),
(277, 3, 1, '2025-09-16', NULL, 630.00, '2025-09-16 02:37:15', '2025-09-16 02:37:15'),
(278, 3, 10, '2025-09-16', NULL, 72.00, '2025-09-16 02:39:03', '2025-09-16 02:39:03'),
(279, 3, 1, '2025-09-16', NULL, 100.00, '2025-09-16 02:39:24', '2025-09-16 02:39:24'),
(280, 3, 1, '2025-09-16', NULL, 84.00, '2025-09-16 02:41:40', '2025-09-16 02:41:40'),
(281, 3, 1, '2025-09-16', NULL, 45.00, '2025-09-16 02:42:15', '2025-09-16 02:42:15'),
(282, 3, 2, '2025-09-16', NULL, 54.00, '2025-09-16 02:44:24', '2025-09-16 02:44:24'),
(283, 3, 13, '2025-09-16', NULL, 41.00, '2025-09-16 02:45:18', '2025-09-16 02:45:18'),
(284, 3, 5, '2025-09-16', NULL, 19.00, '2025-09-16 02:45:45', '2025-09-16 02:45:45'),
(285, 3, 11, '2025-09-16', NULL, 1600.00, '2025-09-16 02:52:43', '2025-09-16 02:52:43'),
(286, 7, 1, '2025-09-16', NULL, 23.00, '2025-09-16 03:19:43', '2025-09-16 03:19:43'),
(287, 3, 3, '2025-09-17', NULL, 60.00, '2025-09-17 07:58:24', '2025-09-17 07:58:24'),
(288, 3, 1, '2025-09-17', NULL, 22.00, '2025-09-17 07:59:20', '2025-09-17 07:59:20'),
(289, 3, 1, '2025-09-17', NULL, 22.25, '2025-09-17 08:05:06', '2025-09-17 08:05:06'),
(290, 3, 1, '2025-09-17', NULL, 67.75, '2025-09-17 08:05:58', '2025-09-17 08:05:58'),
(291, 1, 2, '2025-10-07', NULL, 21.00, '2025-10-07 12:56:46', '2025-10-07 12:56:46'),
(292, 1, 2, '2025-10-07', NULL, 35.50, '2025-10-07 12:57:39', '2025-10-07 12:57:39'),
(293, 1, 17, '2025-10-07', NULL, 1329.00, '2025-10-07 13:01:03', '2025-10-07 13:01:03'),
(294, 1, 3, '2025-10-08', NULL, 26.00, '2025-10-08 06:29:32', '2025-10-08 06:29:32'),
(295, 1, 17, '2025-10-09', NULL, 39.60, '2025-10-09 13:56:35', '2025-10-09 13:56:35'),
(296, 1, 19, '2025-10-09', NULL, 705.00, '2025-10-09 14:03:41', '2025-10-09 14:03:41'),
(297, 1, 20, '2025-10-09', NULL, 235.00, '2025-10-09 14:05:08', '2025-10-09 14:05:08'),
(299, 1, 13, '2025-10-12', NULL, 124.00, '2025-10-11 23:54:35', '2025-10-11 23:54:35'),
(300, 1, 21, '2025-10-12', NULL, 70.00, '2025-10-11 23:59:49', '2025-10-11 23:59:49'),
(301, 1, 20, '2025-10-12', NULL, 429.00, '2025-10-12 00:00:28', '2025-10-12 00:00:28'),
(302, 7, 19, '2025-10-15', NULL, 70.50, '2025-10-15 04:30:35', '2025-10-15 04:30:35'),
(303, 7, 18, '2025-10-15', NULL, 125.00, '2025-10-15 04:31:30', '2025-10-15 04:31:30'),
(304, 1, 17, '2025-10-16', NULL, 318.75, '2025-10-16 07:43:00', '2025-10-16 07:43:00'),
(305, 7, 19, '2025-10-17', NULL, 656.00, '2025-10-17 04:44:22', '2025-10-17 04:44:22'),
(306, 1, 1, '2025-10-20', NULL, 400.00, '2025-10-19 22:04:54', '2025-10-19 22:04:54'),
(307, 1, 16, '2025-10-20', NULL, 37.00, '2025-10-19 22:27:09', '2025-10-19 22:27:09'),
(308, 1, 19, '2025-10-20', NULL, 77.00, '2025-10-19 22:33:00', '2025-10-19 22:33:00'),
(309, 1, 22, '2025-10-20', NULL, 35.00, '2025-10-20 05:20:15', '2025-10-20 05:20:15'),
(310, 1, 16, '2025-10-21', NULL, 205.00, '2025-10-21 12:51:30', '2025-10-21 12:51:30'),
(311, 1, 22, '2025-10-21', NULL, 72.00, '2025-10-21 13:28:51', '2025-10-21 13:28:51'),
(312, 7, 18, '2025-10-22', NULL, 68.00, '2025-10-22 14:41:47', '2025-10-22 14:41:47'),
(313, 1, 15, '2025-10-22', NULL, 130.00, '2025-10-22 14:59:39', '2025-10-22 14:59:39'),
(314, 7, 15, '2025-10-23', NULL, 199.00, '2025-10-23 02:25:30', '2025-10-23 02:25:30'),
(315, 1, 20, '2025-10-23', NULL, 91.00, '2025-10-23 02:59:50', '2025-10-23 03:08:59'),
(316, 4, 14, '2025-10-23', NULL, 149.00, '2025-10-23 03:56:01', '2025-10-23 03:56:01');

-- --------------------------------------------------------

--
-- Table structure for table `sale_items`
--

CREATE TABLE `sale_items` (
  `id` bigint UNSIGNED NOT NULL,
  `sale_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `qty` int NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `discount` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sale_items`
--

INSERT INTO `sale_items` (`id`, `sale_id`, `product_id`, `qty`, `unit_price`, `created_at`, `updated_at`, `discount`) VALUES
(1, 1, 2, 1, 500.00, '2025-06-14 06:05:44', '2025-06-25 16:38:31', 0),
(2, 1, 1, 1, 400.00, '2025-06-14 06:05:44', '2025-06-26 02:35:16', 0),
(3, 2, 3, 1, 500.00, '2025-06-16 08:40:12', '2025-06-25 12:06:46', 0),
(4, 3, 2, 2, 500.00, '2025-06-20 11:27:55', '2025-06-25 12:06:32', 0),
(5, 4, 1, 1, 400.00, '2025-06-20 11:28:09', '2025-06-25 12:03:40', 0),
(6, 5, 15, 1, 300.00, '2025-06-26 03:33:23', '2025-06-26 03:33:23', 0),
(7, 6, 45, 1, 1100.00, '2025-06-26 03:34:14', '2025-06-26 03:34:14', 0),
(8, 7, 37, 1, 82.00, '2025-06-26 03:35:09', '2025-06-26 03:35:09', 0),
(9, 8, 44, 1, 572.00, '2025-06-26 03:36:58', '2025-06-26 03:36:58', 0),
(10, 9, 28, 1, 395.00, '2025-06-26 03:37:20', '2025-06-26 03:37:20', 0),
(11, 10, 46, 1, 1252.00, '2025-06-26 03:39:52', '2025-06-26 03:39:52', 0),
(12, 11, 15, 1, 300.00, '2025-06-27 03:59:01', '2025-06-27 03:59:01', 0),
(13, 12, 21, 1, 170.00, '2025-06-27 07:36:45', '2025-06-27 07:36:45', 0),
(14, 13, 11, 2, 489.00, '2025-06-30 05:02:58', '2025-06-30 05:18:16', 0),
(15, 14, 2, 2, 500.00, '2025-06-30 05:32:44', '2025-06-30 05:32:44', 0),
(16, 14, 3, 1, 500.00, '2025-06-30 05:32:44', '2025-06-30 05:32:44', 0),
(17, 14, 43, 1, 566.00, '2025-06-30 05:32:44', '2025-06-30 05:32:44', 0),
(18, 15, 2, 1, 500.00, '2025-06-30 06:16:58', '2025-06-30 06:16:58', 0),
(19, 16, 32, 1, 288.00, '2025-06-30 07:47:25', '2025-06-30 07:47:25', 0),
(20, 17, 14, 1, 201.00, '2025-07-11 03:06:10', '2025-07-11 03:06:10', 0),
(21, 18, 1, 1, 450.00, '2025-08-21 04:33:55', '2025-08-21 04:33:55', 0),
(22, 19, 2, 1, 500.00, '2025-08-21 09:47:11', '2025-08-21 09:47:11', 0),
(23, 20, 2, 1, 500.00, '2025-08-21 09:48:37', '2025-08-21 09:48:37', 0),
(24, 21, 2, 1, 500.00, '2025-08-21 09:49:12', '2025-08-21 09:49:12', 0),
(25, 22, 2, 1, 500.00, '2025-08-21 09:50:01', '2025-08-21 09:50:01', 0),
(26, 23, 2, 1, 500.00, '2025-08-21 09:50:41', '2025-08-21 09:50:41', 0),
(27, 24, 2, 1, 500.00, '2025-08-21 09:51:45', '2025-08-21 09:51:45', 0),
(28, 25, 2, 1, 500.00, '2025-08-21 09:52:18', '2025-08-21 09:52:18', 0),
(29, 26, 110, 1, 600.00, '2025-08-21 09:55:06', '2025-08-21 09:55:06', 0),
(30, 27, 110, 1, 600.00, '2025-08-21 09:55:54', '2025-08-21 09:55:54', 0),
(31, 28, 110, 1, 600.00, '2025-08-21 09:57:01', '2025-08-21 09:57:01', 0),
(32, 29, 110, 1, 600.00, '2025-08-21 09:58:03', '2025-08-21 09:58:03', 0),
(33, 30, 110, 1, 600.00, '2025-08-21 09:58:53', '2025-08-21 09:58:53', 0),
(34, 31, 110, 1, 600.00, '2025-08-21 09:59:28', '2025-08-21 09:59:28', 0),
(35, 32, 110, 1, 600.00, '2025-08-21 10:00:01', '2025-08-21 10:00:01', 0),
(36, 33, 110, 1, 600.00, '2025-08-21 10:00:35', '2025-08-21 10:00:35', 0),
(37, 34, 110, 1, 600.00, '2025-08-21 10:02:27', '2025-08-21 10:02:27', 0),
(38, 35, 111, 1, 1000.00, '2025-08-21 10:06:19', '2025-08-21 10:06:19', 0),
(39, 36, 111, 1, 1000.00, '2025-08-21 10:07:04', '2025-08-21 10:07:04', 0),
(40, 37, 111, 1, 1000.00, '2025-08-21 10:07:50', '2025-08-21 10:07:50', 0),
(41, 38, 111, 1, 1000.00, '2025-08-21 10:08:48', '2025-08-21 10:08:48', 0),
(42, 39, 111, 1, 1000.00, '2025-08-21 10:09:16', '2025-08-21 10:09:16', 0),
(43, 40, 110, 1, 600.00, '2025-08-21 10:09:53', '2025-08-21 10:09:53', 0),
(44, 41, 77, 1, 25.00, '2025-08-21 12:52:09', '2025-08-21 12:52:09', 0),
(45, 42, 3, 1, 500.00, '2025-08-21 12:54:13', '2025-08-21 12:54:13', 0),
(46, 43, 34, 1, 79.00, '2025-08-21 12:57:35', '2025-08-21 12:57:35', 0),
(47, 44, 79, 1, 35.00, '2025-08-21 12:58:07', '2025-08-21 12:58:07', 0),
(48, 45, 111, 1, 1000.00, '2025-08-21 12:58:43', '2025-08-21 12:58:43', 0),
(49, 46, 77, 1, 25.00, '2025-08-21 12:59:15', '2025-08-21 12:59:15', 0),
(50, 47, 77, 1, 25.00, '2025-08-21 13:00:32', '2025-08-21 13:00:32', 0),
(51, 47, 54, 1, 20.00, '2025-08-21 13:00:32', '2025-08-21 13:00:32', 0),
(52, 48, 78, 1, 25.00, '2025-08-21 13:00:57', '2025-08-21 13:00:57', 0),
(53, 49, 13, 1, 60.00, '2025-08-21 13:01:29', '2025-08-21 13:01:29', 0),
(54, 50, 41, 3, 12.00, '2025-08-21 13:01:51', '2025-08-21 13:01:51', 0),
(55, 51, 111, 1, 1000.00, '2025-08-21 13:02:50', '2025-08-21 13:02:50', 0),
(56, 52, 55, 1, 45.00, '2025-08-21 13:03:16', '2025-08-21 13:03:16', 0),
(57, 53, 91, 1, 140.00, '2025-08-21 13:03:40', '2025-08-21 13:03:40', 0),
(58, 54, 85, 1, 89.00, '2025-08-21 13:04:02', '2025-08-21 13:04:02', 0),
(59, 55, 71, 1, 40.00, '2025-08-21 13:04:25', '2025-08-21 13:04:25', 0),
(60, 56, 103, 1, 50.00, '2025-08-21 13:04:44', '2025-08-21 13:04:44', 0),
(61, 57, 41, 5, 12.00, '2025-08-21 13:05:19', '2025-08-21 13:05:19', 0),
(62, 58, 104, 1, 16.00, '2025-08-21 13:05:56', '2025-08-21 13:05:56', 0),
(63, 59, 54, 1, 20.00, '2025-08-21 13:06:30', '2025-08-21 13:06:30', 0),
(64, 59, 74, 1, 40.00, '2025-08-21 13:06:30', '2025-08-21 13:06:30', 0),
(65, 60, 100, 1, 29.00, '2025-08-21 13:06:54', '2025-08-21 13:06:54', 0),
(66, 61, 17, 1, 148.00, '2025-08-21 13:07:18', '2025-08-21 13:07:18', 0),
(67, 62, 84, 1, 80.00, '2025-08-21 13:07:42', '2025-08-21 13:07:42', 0),
(68, 63, 99, 1, 25.00, '2025-08-21 13:08:14', '2025-08-21 13:08:14', 0),
(69, 64, 79, 1, 35.00, '2025-08-21 13:08:34', '2025-08-21 13:08:34', 0),
(70, 65, 22, 2, 78.00, '2025-08-21 13:09:02', '2025-08-21 13:09:02', 0),
(71, 66, 86, 1, 199.00, '2025-08-21 13:09:23', '2025-08-21 13:09:23', 0),
(72, 67, 94, 1, 59.00, '2025-08-21 13:09:50', '2025-08-21 13:09:50', 0),
(73, 68, 71, 1, 40.00, '2025-08-21 15:14:43', '2025-08-21 15:14:43', 0),
(74, 69, 94, 1, 59.00, '2025-08-21 15:15:13', '2025-08-21 15:15:13', 0),
(75, 70, 13, 1, 60.00, '2025-08-21 15:15:33', '2025-08-21 15:15:33', 0),
(76, 71, 108, 1, 630.00, '2025-08-21 15:16:16', '2025-08-21 15:16:16', 0),
(77, 72, 103, 1, 50.00, '2025-08-21 15:16:45', '2025-08-21 15:16:45', 0),
(78, 73, 77, 1, 25.00, '2025-08-21 15:17:09', '2025-08-21 15:17:09', 0),
(79, 74, 68, 1, 180.00, '2025-08-21 15:17:54', '2025-08-21 15:17:54', 0),
(80, 75, 104, 1, 16.00, '2025-08-21 15:18:18', '2025-08-21 15:18:18', 0),
(81, 76, 91, 1, 140.00, '2025-08-21 15:18:46', '2025-08-21 15:18:46', 0),
(82, 76, 54, 1, 20.00, '2025-08-21 15:18:46', '2025-08-21 15:18:46', 0),
(83, 77, 105, 1, 22.00, '2025-08-21 15:19:11', '2025-08-21 15:19:11', 0),
(84, 78, 86, 1, 199.00, '2025-08-21 15:19:44', '2025-08-21 15:19:44', 0),
(85, 79, 57, 1, 80.00, '2025-08-21 15:20:16', '2025-08-21 15:20:16', 0),
(86, 80, 50, 1, 124.00, '2025-08-21 15:20:59', '2025-08-21 15:20:59', 0),
(87, 81, 80, 1, 22.00, '2025-08-21 15:21:19', '2025-08-21 15:21:19', 0),
(88, 82, 43, 1, 6.00, '2025-08-21 15:21:49', '2025-08-21 15:21:49', 0),
(89, 83, 63, 1, 145.00, '2025-08-21 15:22:18', '2025-08-21 15:22:18', 0),
(90, 84, 27, 1, 162.00, '2025-08-21 15:22:50', '2025-08-21 15:22:50', 0),
(91, 85, 41, 3, 12.00, '2025-08-21 15:23:18', '2025-08-21 15:23:18', 0),
(92, 86, 93, 1, 150.00, '2025-08-21 15:23:47', '2025-08-21 15:23:47', 0),
(93, 87, 111, 1, 1000.00, '2025-08-21 15:24:22', '2025-08-21 15:24:22', 0),
(94, 88, 22, 1, 78.00, '2025-08-21 15:24:42', '2025-08-21 15:24:42', 0),
(95, 89, 56, 1, 49.00, '2025-08-21 15:25:17', '2025-08-21 15:25:17', 0),
(96, 90, 26, 1, 17.00, '2025-08-21 15:25:42', '2025-08-21 15:25:42', 0),
(97, 91, 91, 1, 140.00, '2025-08-21 15:26:15', '2025-08-21 15:26:15', 0),
(98, 92, 42, 1, 19.00, '2025-08-21 15:26:50', '2025-08-21 15:26:50', 0),
(99, 93, 22, 2, 78.00, '2025-08-21 15:27:42', '2025-08-21 15:27:42', 0),
(100, 94, 25, 1, 15.00, '2025-08-21 15:28:12', '2025-08-21 15:28:12', 0),
(101, 95, 82, 1, 28.00, '2025-08-21 15:33:55', '2025-08-21 15:33:55', 0),
(102, 95, 78, 1, 25.00, '2025-08-21 15:33:55', '2025-08-21 15:33:55', 0),
(103, 96, 82, 1, 28.00, '2025-08-21 15:34:44', '2025-08-21 15:34:44', 0),
(104, 96, 106, 1, 55.00, '2025-08-21 15:34:44', '2025-08-21 15:34:44', 0),
(105, 97, 101, 1, 22.00, '2025-08-21 15:35:29', '2025-08-21 15:35:29', 0),
(106, 97, 69, 1, 15.00, '2025-08-21 15:35:29', '2025-08-21 15:35:29', 0),
(107, 98, 78, 1, 25.00, '2025-08-21 15:36:03', '2025-08-21 15:36:03', 0),
(108, 98, 56, 1, 49.00, '2025-08-21 15:36:03', '2025-08-21 15:36:03', 0),
(109, 99, 55, 1, 45.00, '2025-08-21 15:36:32', '2025-08-21 15:36:32', 0),
(110, 99, 25, 1, 15.00, '2025-08-21 15:36:32', '2025-08-21 15:36:32', 0),
(111, 100, 81, 1, 35.00, '2025-08-21 15:37:13', '2025-08-21 15:37:13', 0),
(112, 100, 98, 1, 29.00, '2025-08-21 15:37:13', '2025-08-21 15:37:13', 0),
(113, 101, 31, 1, 27.00, '2025-08-21 15:37:52', '2025-08-21 15:37:52', 0),
(114, 101, 62, 1, 80.00, '2025-08-21 15:37:52', '2025-08-21 15:37:52', 0),
(115, 102, 73, 1, 50.00, '2025-08-21 15:38:31', '2025-08-21 15:38:31', 0),
(116, 102, 96, 1, 119.00, '2025-08-21 15:38:31', '2025-08-21 15:38:31', 0),
(117, 103, 100, 1, 29.00, '2025-08-21 15:39:05', '2025-08-21 15:39:05', 0),
(118, 103, 42, 1, 19.00, '2025-08-21 15:39:05', '2025-08-21 15:39:05', 0),
(119, 103, 77, 1, 25.00, '2025-08-21 15:39:05', '2025-08-21 15:39:05', 0),
(120, 104, 86, 1, 199.00, '2025-08-21 15:39:36', '2025-08-21 15:39:36', 0),
(121, 104, 59, 1, 20.00, '2025-08-21 15:39:36', '2025-08-21 15:39:36', 0),
(122, 105, 94, 1, 59.00, '2025-08-21 15:40:08', '2025-08-21 15:40:08', 0),
(123, 105, 99, 1, 25.00, '2025-08-21 15:40:08', '2025-08-21 15:40:08', 0),
(124, 106, 16, 1, 220.00, '2025-08-21 15:40:31', '2025-08-21 15:40:31', 0),
(125, 107, 30, 1, 100.00, '2025-08-21 15:40:55', '2025-08-21 15:40:55', 0),
(126, 107, 19, 1, 112.00, '2025-08-21 15:40:55', '2025-08-21 15:40:55', 0),
(127, 108, 23, 1, 566.00, '2025-08-21 15:41:27', '2025-08-21 15:41:27', 0),
(128, 109, 40, 1, 39.00, '2025-08-21 15:41:52', '2025-08-21 15:41:52', 0),
(129, 110, 47, 1, 215.00, '2025-08-21 15:42:19', '2025-08-21 15:42:19', 0),
(130, 110, 100, 1, 29.00, '2025-08-21 15:42:19', '2025-08-21 15:42:19', 0),
(131, 111, 112, 1, 679.00, '2025-08-21 15:42:50', '2025-08-21 15:42:50', 0),
(132, 112, 61, 1, 60.00, '2025-08-21 15:43:20', '2025-08-21 15:43:20', 0),
(133, 112, 53, 1, 95.00, '2025-08-21 15:43:20', '2025-08-21 15:43:20', 0),
(134, 113, 89, 1, 25.00, '2025-08-21 15:43:57', '2025-08-21 15:43:57', 0),
(135, 113, 70, 1, 25.00, '2025-08-21 15:43:57', '2025-08-21 15:43:57', 0),
(136, 114, 109, 1, 579.00, '2025-08-21 15:44:28', '2025-08-21 15:44:28', 0),
(137, 115, 34, 1, 79.00, '2025-08-21 15:44:56', '2025-08-21 15:44:56', 0),
(138, 115, 99, 1, 25.00, '2025-08-21 15:44:56', '2025-08-21 15:44:56', 0),
(139, 116, 10, 1, 170.00, '2025-08-21 15:45:22', '2025-08-21 15:45:22', 0),
(140, 116, 54, 1, 20.00, '2025-08-21 15:45:22', '2025-08-21 15:45:22', 0),
(141, 117, 51, 1, 145.00, '2025-08-21 15:45:53', '2025-08-21 15:45:53', 0),
(142, 118, 95, 1, 79.00, '2025-08-21 15:46:17', '2025-08-21 15:46:17', 0),
(143, 118, 69, 1, 15.00, '2025-08-21 15:46:17', '2025-08-21 15:46:17', 0),
(144, 119, 41, 2, 12.00, '2025-08-21 15:46:39', '2025-08-21 15:46:39', 0),
(145, 120, 54, 1, 20.00, '2025-08-21 15:46:58', '2025-08-21 15:46:58', 0),
(146, 121, 54, 1, 20.00, '2025-08-21 15:47:17', '2025-08-21 15:47:17', 0),
(147, 121, 25, 1, 15.00, '2025-08-21 15:47:17', '2025-08-21 15:47:17', 0),
(148, 122, 50, 2, 124.00, '2025-08-21 15:47:31', '2025-08-21 15:47:31', 0),
(149, 123, 80, 1, 22.00, '2025-08-21 15:48:03', '2025-08-21 15:48:03', 0),
(150, 123, 20, 1, 10.00, '2025-08-21 15:48:03', '2025-08-21 15:48:03', 0),
(151, 124, 58, 1, 19.00, '2025-08-21 15:48:36', '2025-08-21 15:48:36', 0),
(152, 124, 72, 1, 24.00, '2025-08-21 15:48:36', '2025-08-21 15:48:36', 0),
(153, 125, 102, 1, 19.00, '2025-08-21 15:49:06', '2025-08-21 15:49:06', 0),
(154, 125, 83, 1, 25.00, '2025-08-21 15:49:06', '2025-08-21 15:49:06', 0),
(155, 126, 74, 1, 40.00, '2025-08-21 15:49:31', '2025-08-21 15:49:31', 0),
(156, 126, 54, 1, 20.00, '2025-08-21 15:49:31', '2025-08-21 15:49:31', 0),
(157, 127, 35, 1, 493.00, '2025-08-21 15:50:09', '2025-08-21 15:50:09', 0),
(158, 128, 60, 1, 50.00, '2025-08-21 15:50:33', '2025-08-21 15:50:33', 0),
(159, 128, 25, 1, 15.00, '2025-08-21 15:50:33', '2025-08-21 15:50:33', 0),
(160, 129, 67, 1, 399.00, '2025-08-21 15:50:59', '2025-08-21 15:50:59', 0),
(161, 130, 92, 1, 199.00, '2025-08-21 15:51:25', '2025-08-21 15:51:25', 0),
(162, 131, 19, 1, 112.00, '2025-08-21 15:51:46', '2025-08-21 15:51:46', 0),
(163, 131, 99, 1, 25.00, '2025-08-21 15:51:46', '2025-08-21 15:51:46', 0),
(164, 132, 90, 1, 29.00, '2025-08-21 15:52:16', '2025-08-21 15:52:16', 0),
(165, 132, 77, 1, 25.00, '2025-08-21 15:52:16', '2025-08-21 15:52:16', 0),
(166, 133, 22, 1, 78.00, '2025-08-21 15:52:40', '2025-08-21 15:52:40', 0),
(167, 134, 104, 1, 16.00, '2025-08-21 15:52:59', '2025-08-21 15:52:59', 0),
(168, 134, 82, 1, 28.00, '2025-08-21 15:52:59', '2025-08-21 15:52:59', 0),
(169, 135, 49, 1, 199.00, '2025-08-21 15:53:44', '2025-08-21 15:53:44', 0),
(170, 136, 87, 1, 99.00, '2025-08-21 15:54:25', '2025-08-21 15:54:25', 0),
(171, 137, 113, 1, 599.00, '2025-08-21 15:55:07', '2025-08-21 15:55:07', 0),
(172, 138, 101, 1, 22.00, '2025-08-21 15:56:41', '2025-08-21 15:56:41', 0),
(173, 138, 54, 1, 20.00, '2025-08-21 15:56:41', '2025-08-21 15:56:41', 0),
(174, 139, 55, 1, 45.00, '2025-08-21 15:57:04', '2025-08-21 15:57:04', 0),
(175, 139, 24, 1, 10.00, '2025-08-21 15:57:04', '2025-08-21 15:57:04', 0),
(176, 140, 24, 2, 10.00, '2025-08-21 15:57:23', '2025-08-21 15:57:23', 0),
(177, 140, 102, 1, 19.00, '2025-08-21 15:57:23', '2025-08-21 15:57:23', 0),
(178, 141, 77, 1, 25.00, '2025-08-21 15:57:45', '2025-08-21 15:57:45', 0),
(179, 142, 82, 1, 28.00, '2025-08-21 15:58:12', '2025-08-21 15:58:12', 0),
(180, 142, 56, 1, 49.00, '2025-08-21 15:58:12', '2025-08-21 15:58:12', 0),
(181, 143, 30, 1, 100.00, '2025-08-21 15:58:45', '2025-08-21 15:58:45', 0),
(182, 143, 27, 1, 162.00, '2025-08-21 15:58:45', '2025-08-21 15:58:45', 0),
(183, 144, 22, 2, 78.00, '2025-08-21 15:59:12', '2025-08-21 15:59:12', 0),
(184, 145, 76, 2, 100.00, '2025-08-21 15:59:37', '2025-08-21 15:59:37', 0),
(185, 146, 59, 1, 20.00, '2025-08-21 16:00:04', '2025-08-21 16:00:04', 0),
(186, 146, 25, 1, 15.00, '2025-08-21 16:00:04', '2025-08-21 16:00:04', 0),
(187, 147, 62, 1, 80.00, '2025-08-21 16:00:35', '2025-08-21 16:00:35', 0),
(188, 147, 25, 1, 15.00, '2025-08-21 16:00:35', '2025-08-21 16:00:35', 0),
(189, 148, 43, 1, 6.00, '2025-08-21 16:00:51', '2025-08-21 16:00:51', 0),
(190, 149, 106, 1, 55.00, '2025-08-21 16:01:21', '2025-08-21 16:01:21', 0),
(191, 150, 16, 1, 220.00, '2025-08-21 16:01:59', '2025-08-21 16:01:59', 0),
(192, 151, 35, 1, 493.00, '2025-08-21 16:02:36', '2025-08-21 16:02:36', 0),
(193, 152, 114, 1, 199.00, '2025-08-21 16:11:07', '2025-08-21 16:11:07', 0),
(194, 153, 2, 1, 500.00, '2025-08-21 16:11:47', '2025-08-21 16:11:47', 0),
(195, 154, 88, 2, 69.00, '2025-08-21 16:13:18', '2025-08-21 16:13:18', 0),
(196, 155, 87, 1, 99.00, '2025-08-21 16:13:36', '2025-08-21 16:13:36', 0),
(197, 156, 55, 1, 45.00, '2025-08-21 16:15:11', '2025-08-21 16:15:11', 0),
(198, 156, 68, 1, 180.00, '2025-08-21 16:15:11', '2025-08-21 16:15:11', 0),
(199, 157, 1, 1, 400.00, '2025-08-21 16:15:34', '2025-08-21 16:15:34', 0),
(200, 158, 105, 1, 22.00, '2025-08-21 16:15:56', '2025-08-21 16:15:56', 0),
(201, 158, 79, 1, 35.00, '2025-08-21 16:15:56', '2025-08-21 16:15:56', 0),
(202, 159, 87, 1, 99.00, '2025-08-21 16:16:32', '2025-08-21 16:16:32', 0),
(203, 159, 24, 1, 10.00, '2025-08-21 16:16:32', '2025-08-21 16:16:32', 0),
(204, 159, 56, 1, 49.00, '2025-08-21 16:16:32', '2025-08-21 16:16:32', 0),
(205, 160, 74, 1, 40.00, '2025-08-21 16:23:33', '2025-08-21 16:23:33', 0),
(206, 160, 25, 1, 15.00, '2025-08-21 16:23:33', '2025-08-21 16:23:33', 0),
(207, 160, 54, 1, 20.00, '2025-08-21 16:23:33', '2025-08-21 16:23:33', 0),
(208, 160, 101, 1, 22.00, '2025-08-21 16:23:33', '2025-08-21 16:23:33', 0),
(209, 161, 104, 1, 16.00, '2025-08-21 16:24:09', '2025-08-21 16:24:09', 0),
(210, 161, 25, 1, 15.00, '2025-08-21 16:24:09', '2025-08-21 16:24:09', 0),
(211, 161, 13, 1, 60.00, '2025-08-21 16:24:09', '2025-08-21 16:24:09', 0),
(212, 162, 39, 1, 181.00, '2025-08-21 16:24:32', '2025-08-21 16:24:32', 0),
(213, 163, 112, 1, 679.00, '2025-08-21 16:25:42', '2025-08-21 16:25:42', 0),
(214, 164, 97, 1, 260.00, '2025-08-21 16:26:06', '2025-08-21 16:26:06', 0),
(215, 164, 52, 1, 330.00, '2025-08-21 16:26:06', '2025-08-21 16:26:06', 0),
(216, 165, 97, 1, 260.00, '2025-08-21 16:27:05', '2025-08-21 16:27:05', 0),
(217, 165, 25, 1, 15.00, '2025-08-21 16:27:05', '2025-08-21 16:27:05', 0),
(218, 166, 36, 1, 620.00, '2025-08-21 16:33:04', '2025-08-21 16:33:04', 0),
(219, 167, 41, 2, 12.00, '2025-08-22 02:11:44', '2025-08-22 02:11:44', 0),
(220, 168, 104, 4, 16.00, '2025-08-22 07:52:42', '2025-08-22 07:52:42', 0),
(221, 168, 23, 1, 566.00, '2025-08-22 07:52:42', '2025-08-22 07:52:42', 0),
(222, 169, 63, 1, 145.00, '2025-09-02 03:31:48', '2025-09-02 03:31:48', 0),
(223, 170, 84, 1, 80.00, '2025-09-02 03:34:19', '2025-09-02 03:34:19', 0),
(224, 172, 43, 1, 6.00, '2025-09-05 03:51:00', '2025-09-05 03:51:00', 0),
(225, 173, 54, 1, 20.00, '2025-09-05 03:52:33', '2025-09-05 03:52:33', 0),
(226, 174, 41, 1, 12.00, '2025-09-05 03:55:35', '2025-09-05 03:55:35', 0),
(227, 177, 85, 3, 89.00, '2025-09-07 02:16:41', '2025-09-07 02:16:41', 10),
(228, 177, 81, 2, 35.00, '2025-09-07 02:16:41', '2025-09-07 02:16:41', 0),
(229, 177, 72, 1, 24.00, '2025-09-07 02:16:41', '2025-09-07 02:16:41', 0),
(230, 178, 50, 1, 124.00, '2025-09-07 05:32:00', '2025-09-07 05:32:00', 0),
(231, 179, 111, 1, 1000.00, '2025-09-08 02:13:50', '2025-09-08 02:13:50', 0),
(232, 180, 105, 1, 22.00, '2025-09-08 02:23:46', '2025-09-08 02:23:46', 0),
(233, 180, 34, 1, 79.00, '2025-09-08 02:23:46', '2025-09-08 02:23:46', 0),
(234, 180, 37, 1, 25.00, '2025-09-08 02:23:46', '2025-09-08 02:23:46', 0),
(235, 181, 45, 1, 299.00, '2025-09-08 02:24:54', '2025-09-08 02:24:54', 0),
(236, 181, 21, 1, 35.00, '2025-09-08 02:24:54', '2025-09-08 02:24:54', 0),
(237, 181, 98, 3, 29.00, '2025-09-08 02:24:54', '2025-09-08 02:24:54', 0),
(238, 182, 50, 2, 124.00, '2025-09-08 02:51:18', '2025-09-08 02:51:18', 0),
(239, 183, 87, 1, 99.00, '2025-09-08 02:51:42', '2025-09-08 02:51:42', 0),
(240, 183, 55, 1, 45.00, '2025-09-08 02:51:42', '2025-09-08 02:51:42', 0),
(241, 183, 105, 1, 22.00, '2025-09-08 02:51:42', '2025-09-08 02:51:42', 0),
(242, 184, 74, 1, 40.00, '2025-09-08 03:00:11', '2025-09-08 03:00:11', 0),
(243, 184, 68, 1, 180.00, '2025-09-08 03:00:11', '2025-09-08 03:00:11', 0),
(244, 184, 2, 1, 500.00, '2025-09-08 03:00:11', '2025-09-08 03:00:11', 0),
(245, 185, 50, 1, 124.00, '2025-09-08 03:00:57', '2025-09-08 03:00:57', 0),
(246, 186, 2, 1, 500.00, '2025-09-08 03:15:08', '2025-09-08 03:15:08', 0),
(247, 187, 56, 1, 49.00, '2025-09-08 03:16:10', '2025-09-08 03:16:10', 0),
(248, 187, 13, 1, 60.00, '2025-09-08 03:16:10', '2025-09-08 03:16:10', 0),
(249, 188, 96, 1, 119.00, '2025-09-08 03:18:54', '2025-09-08 03:18:54', 0),
(250, 188, 42, 1, 19.00, '2025-09-08 03:18:54', '2025-09-08 03:18:54', 0),
(251, 188, 71, 1, 40.00, '2025-09-08 03:18:54', '2025-09-08 03:18:54', 0),
(252, 189, 54, 1, 20.00, '2025-09-08 03:19:09', '2025-09-08 03:19:09', 0),
(253, 189, 41, 1, 12.00, '2025-09-08 03:19:09', '2025-09-08 03:19:09', 0),
(254, 189, 75, 1, 18.00, '2025-09-08 03:19:09', '2025-09-08 03:19:09', 0),
(255, 190, 50, 1, 124.00, '2025-09-08 03:20:21', '2025-09-08 03:20:21', 0),
(256, 191, 88, 1, 69.00, '2025-09-08 03:30:40', '2025-09-08 03:30:40', 0),
(257, 192, 80, 1, 22.00, '2025-09-08 03:31:33', '2025-09-08 03:31:33', 0),
(258, 193, 106, 1, 55.00, '2025-09-08 03:38:50', '2025-09-08 03:38:50', 10),
(259, 193, 24, 1, 10.00, '2025-09-08 03:38:50', '2025-09-08 03:38:50', 0),
(260, 194, 76, 1, 100.00, '2025-09-08 03:53:39', '2025-09-08 03:53:39', 10),
(261, 194, 30, 1, 100.00, '2025-09-08 03:53:39', '2025-09-08 03:53:39', 5),
(262, 194, 20, 1, 10.00, '2025-09-08 03:53:39', '2025-09-08 03:53:39', 0),
(263, 195, 54, 1, 20.00, '2025-09-08 04:02:13', '2025-09-08 04:02:13', 0),
(264, 195, 75, 1, 18.00, '2025-09-08 04:02:13', '2025-09-08 04:02:13', 0),
(265, 195, 63, 1, 145.00, '2025-09-08 04:02:13', '2025-09-08 04:02:13', 0),
(266, 196, 83, 1, 25.00, '2025-09-08 04:02:39', '2025-09-08 04:02:39', 0),
(267, 196, 41, 1, 12.00, '2025-09-08 04:02:39', '2025-09-08 04:02:39', 0),
(268, 197, 71, 1, 40.00, '2025-09-08 04:23:56', '2025-09-08 04:23:56', 0),
(269, 197, 94, 1, 59.00, '2025-09-08 04:23:56', '2025-09-08 04:23:56', 0),
(270, 198, 66, 1, 210.00, '2025-09-08 04:24:13', '2025-09-08 04:24:13', 0),
(271, 199, 67, 1, 399.00, '2025-09-08 04:24:30', '2025-09-08 04:24:30', 0),
(272, 200, 49, 1, 199.00, '2025-09-08 04:24:46', '2025-09-08 04:24:46', 0),
(273, 200, 39, 1, 181.00, '2025-09-08 04:24:46', '2025-09-08 04:24:46', 0),
(274, 201, 65, 1, 650.00, '2025-09-08 04:25:05', '2025-09-08 04:25:05', 0),
(275, 202, 85, 1, 89.00, '2025-09-08 04:32:48', '2025-09-08 04:32:48', 0),
(276, 202, 55, 1, 45.00, '2025-09-08 04:32:48', '2025-09-08 04:32:48', 0),
(277, 202, 31, 1, 27.00, '2025-09-08 04:32:48', '2025-09-08 04:32:48', 0),
(278, 203, 54, 1, 20.00, '2025-09-08 04:33:20', '2025-09-08 04:33:20', 0),
(279, 203, 41, 1, 12.00, '2025-09-08 04:33:20', '2025-09-08 04:33:20', 0),
(280, 204, 83, 1, 25.00, '2025-09-08 04:33:47', '2025-09-08 04:33:47', 0),
(281, 204, 36, 1, 620.00, '2025-09-08 04:33:47', '2025-09-08 04:33:47', 1),
(282, 205, 41, 1, 12.00, '2025-09-08 04:34:10', '2025-09-08 04:34:10', 0),
(283, 205, 80, 1, 22.00, '2025-09-08 04:34:10', '2025-09-08 04:34:10', 0),
(284, 205, 98, 1, 29.00, '2025-09-08 04:34:10', '2025-09-08 04:34:10', 0),
(285, 206, 54, 1, 20.00, '2025-09-08 04:34:27', '2025-09-08 04:34:27', 0),
(286, 206, 9, 1, 1469.00, '2025-09-08 04:34:27', '2025-09-08 04:34:27', 0),
(287, 207, 83, 1, 25.00, '2025-09-08 04:34:52', '2025-09-08 04:34:52', 0),
(288, 207, 69, 1, 15.00, '2025-09-08 04:34:52', '2025-09-08 04:34:52', 0),
(289, 208, 39, 1, 181.00, '2025-09-08 04:49:05', '2025-09-08 04:49:05', 0),
(290, 208, 112, 1, 679.00, '2025-09-08 04:49:05', '2025-09-08 04:49:05', 0),
(291, 208, 69, 1, 15.00, '2025-09-08 04:49:05', '2025-09-08 04:49:05', 0),
(292, 209, 36, 1, 620.00, '2025-09-08 04:50:02', '2025-09-08 04:50:02', 0),
(293, 209, 112, 1, 679.00, '2025-09-08 04:50:02', '2025-09-08 04:50:02', 0),
(294, 210, 112, 1, 679.00, '2025-09-08 04:50:39', '2025-09-08 04:50:39', 0),
(295, 210, 110, 2, 600.00, '2025-09-08 04:50:39', '2025-09-08 04:50:39', 0),
(296, 211, 41, 2, 12.00, '2025-09-08 04:51:51', '2025-09-08 04:51:51', 0),
(297, 212, 50, 1, 124.00, '2025-09-08 04:52:00', '2025-09-08 04:52:00', 0),
(298, 213, 80, 1, 22.00, '2025-09-08 04:52:15', '2025-09-08 04:52:15', 0),
(299, 213, 54, 1, 20.00, '2025-09-08 04:52:15', '2025-09-08 04:52:15', 0),
(300, 214, 102, 1, 19.00, '2025-09-08 04:52:32', '2025-09-08 04:52:32', 0),
(301, 214, 88, 1, 69.00, '2025-09-08 04:52:32', '2025-09-08 04:52:32', 0),
(302, 215, 58, 1, 19.00, '2025-09-08 04:52:48', '2025-09-08 04:52:48', 0),
(303, 215, 72, 1, 24.00, '2025-09-08 04:52:48', '2025-09-08 04:52:48', 0),
(304, 216, 83, 1, 25.00, '2025-09-08 04:53:04', '2025-09-08 04:53:04', 0),
(305, 216, 41, 1, 12.00, '2025-09-08 04:53:04', '2025-09-08 04:53:04', 0),
(306, 217, 78, 1, 25.00, '2025-09-08 04:53:23', '2025-09-08 04:53:23', 0),
(307, 217, 101, 1, 22.00, '2025-09-08 04:53:23', '2025-09-08 04:53:23', 0),
(308, 218, 41, 1, 12.00, '2025-09-08 04:53:34', '2025-09-08 04:53:34', 0),
(309, 219, 82, 1, 28.00, '2025-09-08 04:53:47', '2025-09-08 04:53:47', 0),
(310, 220, 106, 1, 55.00, '2025-09-08 04:54:08', '2025-09-08 04:54:08', 0),
(311, 220, 69, 1, 15.00, '2025-09-08 04:54:08', '2025-09-08 04:54:08', 0),
(312, 221, 80, 2, 22.00, '2025-09-08 07:27:53', '2025-09-08 07:27:53', 0),
(313, 221, 54, 2, 20.00, '2025-09-08 07:27:53', '2025-09-08 07:27:53', 0),
(314, 222, 102, 1, 19.00, '2025-09-08 07:30:15', '2025-09-08 07:30:15', 0),
(315, 222, 75, 1, 18.00, '2025-09-08 07:30:15', '2025-09-08 07:30:15', 0),
(316, 223, 7, 1, 300.00, '2025-09-08 08:23:31', '2025-09-08 08:23:31', 0),
(317, 223, 112, 1, 679.00, '2025-09-08 08:23:31', '2025-09-08 08:23:31', 0),
(318, 224, 68, 2, 180.00, '2025-09-08 08:25:25', '2025-09-08 08:25:25', 0),
(319, 224, 84, 1, 80.00, '2025-09-08 08:25:25', '2025-09-08 08:25:25', 0),
(320, 224, 105, 1, 22.00, '2025-09-08 08:25:25', '2025-09-08 08:25:25', 0),
(321, 225, 50, 1, 124.00, '2025-09-08 08:26:23', '2025-09-08 08:26:23', 0),
(322, 225, 110, 1, 600.00, '2025-09-08 08:26:23', '2025-09-08 08:26:23', 0),
(323, 225, 99, 1, 25.00, '2025-09-08 08:26:23', '2025-09-08 08:26:23', 0),
(324, 226, 2, 2, 500.00, '2025-09-08 08:26:49', '2025-09-08 08:26:49', 0),
(325, 227, 19, 1, 112.00, '2025-09-08 08:27:29', '2025-09-08 08:27:29', 0),
(326, 228, 2, 1, 500.00, '2025-09-08 08:29:47', '2025-09-08 08:29:47', 0),
(327, 229, 67, 1, 399.00, '2025-09-08 08:42:15', '2025-09-08 08:42:15', 0),
(328, 230, 35, 1, 493.00, '2025-09-08 08:43:05', '2025-09-08 08:43:05', 0),
(329, 230, 47, 1, 215.00, '2025-09-08 08:43:05', '2025-09-08 08:43:05', 0),
(330, 231, 2, 1, 500.00, '2025-09-08 08:43:38', '2025-09-08 08:43:38', 0),
(331, 232, 113, 1, 599.00, '2025-09-08 08:44:23', '2025-09-08 08:44:23', 0),
(332, 232, 34, 1, 79.00, '2025-09-08 08:44:23', '2025-09-08 08:44:23', 0),
(333, 233, 36, 1, 620.00, '2025-09-08 08:44:53', '2025-09-08 08:44:53', 0),
(334, 234, 17, 1, 148.00, '2025-09-08 08:45:29', '2025-09-08 08:45:29', 0),
(335, 234, 113, 1, 599.00, '2025-09-08 08:45:29', '2025-09-08 08:45:29', 0),
(336, 235, 35, 1, 493.00, '2025-09-08 08:46:14', '2025-09-08 08:46:14', 0),
(337, 235, 96, 1, 119.00, '2025-09-08 08:46:14', '2025-09-08 08:46:14', 0),
(338, 236, 41, 1, 12.00, '2025-09-08 08:49:00', '2025-09-08 08:49:00', 0),
(339, 237, 26, 1, 17.00, '2025-09-08 08:49:14', '2025-09-08 08:49:14', 0),
(340, 238, 20, 1, 10.00, '2025-09-08 08:49:29', '2025-09-08 08:49:29', 0),
(341, 239, 83, 1, 25.00, '2025-09-08 08:49:41', '2025-09-08 08:49:41', 0),
(342, 240, 24, 1, 10.00, '2025-09-08 08:50:04', '2025-09-08 08:50:04', 0),
(343, 241, 66, 1, 210.00, '2025-09-08 08:51:35', '2025-09-08 08:51:35', 0),
(349, 243, 54, 1, 20.00, '2025-09-08 09:21:01', '2025-09-08 09:21:01', 0),
(350, 243, 50, 1, 124.00, '2025-09-08 09:21:01', '2025-09-08 09:21:01', 0),
(351, 243, 24, 1, 10.00, '2025-09-08 09:21:01', '2025-09-08 09:21:01', 0),
(352, 244, 80, 2, 22.00, '2025-09-10 09:13:03', '2025-09-10 09:13:03', 9),
(353, 245, 20, 1, 10.00, '2025-09-10 09:27:15', '2025-09-10 09:27:15', 0),
(354, 246, 54, 1, 20.00, '2025-09-10 09:37:35', '2025-09-10 09:37:35', 0),
(355, 247, 26, 1, 17.00, '2025-09-10 09:41:55', '2025-09-10 09:41:55', 0),
(356, 248, 75, 1, 18.00, '2025-09-10 09:50:22', '2025-09-10 09:50:22', 0),
(357, 249, 75, 1, 18.00, '2025-09-10 09:57:17', '2025-09-10 09:57:17', 0),
(358, 250, 102, 1, 19.00, '2025-09-10 10:02:24', '2025-09-10 10:02:24', 0),
(359, 251, 75, 1, 18.00, '2025-09-10 10:05:26', '2025-09-10 10:05:26', 0),
(360, 252, 58, 1, 19.00, '2025-09-10 10:07:01', '2025-09-10 10:07:01', 0),
(361, 253, 26, 1, 17.00, '2025-09-10 10:11:46', '2025-09-10 10:11:46', 0),
(362, 254, 75, 1, 18.00, '2025-09-10 11:49:00', '2025-09-10 11:49:00', 0),
(367, 259, 116, 2, 20.00, '2025-09-10 15:32:20', '2025-09-10 15:32:20', 0),
(369, 261, 116, 1, 20.00, '2025-09-15 01:55:15', '2025-09-15 01:55:15', 0),
(370, 262, 58, 1, 19.00, '2025-09-15 01:59:24', '2025-09-15 01:59:24', 0),
(371, 263, 50, 1, 124.00, '2025-09-15 03:04:28', '2025-09-15 03:04:28', 0),
(372, 264, 81, 1, 35.00, '2025-09-15 03:38:43', '2025-09-15 03:38:43', 0),
(373, 265, 20, 1, 10.00, '2025-09-15 03:54:46', '2025-09-15 03:54:46', 0),
(374, 266, 116, 1, 20.00, '2025-09-15 05:12:12', '2025-09-15 05:12:12', 0),
(378, 270, 54, 1, 20.00, '2025-09-15 06:39:41', '2025-09-15 06:39:41', 0),
(379, 271, 68, 1, 180.00, '2025-09-15 06:57:16', '2025-09-15 06:57:16', 0),
(380, 271, 64, 1, 149.00, '2025-09-15 06:57:16', '2025-09-15 06:57:16', 0),
(381, 272, 16, 1, 220.00, '2025-09-15 07:02:05', '2025-09-15 07:02:05', 0),
(382, 272, 47, 1, 215.00, '2025-09-15 07:02:05', '2025-09-15 07:02:05', 0),
(383, 272, 97, 1, 260.00, '2025-09-15 07:02:05', '2025-09-15 07:02:05', 0),
(384, 273, 75, 1, 18.00, '2025-09-16 02:17:33', '2025-09-16 02:17:33', 0),
(385, 274, 41, 3, 12.00, '2025-09-16 02:33:59', '2025-09-16 02:33:59', 0),
(386, 274, 83, 1, 25.00, '2025-09-16 02:33:59', '2025-09-16 02:33:59', 0),
(387, 275, 58, 1, 19.00, '2025-09-16 02:34:27', '2025-09-16 02:34:27', 0),
(388, 275, 26, 1, 17.00, '2025-09-16 02:34:27', '2025-09-16 02:34:27', 0),
(389, 276, 102, 1, 19.00, '2025-09-16 02:34:46', '2025-09-16 02:34:46', 0),
(390, 277, 124, 1, 300.00, '2025-09-16 02:37:15', '2025-09-16 02:37:15', 0),
(391, 277, 52, 1, 330.00, '2025-09-16 02:37:15', '2025-09-16 02:37:15', 0),
(392, 278, 54, 1, 20.00, '2025-09-16 02:39:03', '2025-09-16 02:39:03', 0),
(393, 278, 41, 1, 12.00, '2025-09-16 02:39:03', '2025-09-16 02:39:03', 0),
(394, 278, 74, 1, 40.00, '2025-09-16 02:39:03', '2025-09-16 02:39:03', 0),
(395, 279, 88, 1, 69.00, '2025-09-16 02:39:24', '2025-09-16 02:39:24', 0),
(396, 280, 41, 5, 12.00, '2025-09-16 02:41:40', '2025-09-16 02:41:40', 0),
(397, 280, 72, 1, 24.00, '2025-09-16 02:41:40', '2025-09-16 02:41:40', 0),
(398, 281, 83, 1, 25.00, '2025-09-16 02:42:15', '2025-09-16 02:42:15', 0),
(399, 281, 54, 1, 20.00, '2025-09-16 02:42:15', '2025-09-16 02:42:15', 0),
(400, 282, 83, 1, 25.00, '2025-09-16 02:44:24', '2025-09-16 02:44:24', 0),
(401, 282, 100, 1, 29.00, '2025-09-16 02:44:24', '2025-09-16 02:44:24', 0),
(402, 283, 77, 1, 25.00, '2025-09-16 02:45:18', '2025-09-16 02:45:18', 0),
(403, 283, 104, 1, 16.00, '2025-09-16 02:45:18', '2025-09-16 02:45:18', 0),
(404, 284, 102, 1, 19.00, '2025-09-16 02:45:45', '2025-09-16 02:45:45', 0),
(405, 285, 3, 1, 500.00, '2025-09-16 02:52:43', '2025-09-16 02:52:43', 0),
(406, 285, 111, 1, 1000.00, '2025-09-16 02:52:43', '2025-09-16 02:52:43', 0),
(407, 286, 83, 1, 25.00, '2025-09-16 03:19:43', '2025-09-16 03:19:43', 11),
(408, 287, 83, 1, 25.00, '2025-09-17 07:58:24', '2025-09-17 07:58:24', 5),
(409, 287, 79, 1, 35.00, '2025-09-17 07:58:24', '2025-09-17 07:58:24', 0),
(410, 288, 80, 1, 22.00, '2025-09-17 07:59:20', '2025-09-17 07:59:20', 1),
(411, 289, 83, 1, 25.00, '2025-09-17 08:05:06', '2025-09-17 08:05:06', 11),
(412, 290, 88, 1, 69.00, '2025-09-17 08:05:58', '2025-09-17 08:05:58', 2),
(413, 291, 80, 1, 22.00, '2025-10-07 12:56:46', '2025-10-07 12:56:46', 5),
(414, 292, 41, 1, 12.00, '2025-10-07 12:57:39', '2025-10-07 12:57:39', 5),
(415, 292, 83, 1, 25.00, '2025-10-07 12:57:39', '2025-10-07 12:57:39', 5),
(416, 293, 119, 1, 699.00, '2025-10-07 13:01:03', '2025-10-07 13:01:03', 0),
(417, 293, 108, 1, 630.00, '2025-10-07 13:01:03', '2025-10-07 13:01:03', 0),
(418, 294, 83, 1, 25.00, '2025-10-08 06:29:32', '2025-10-08 06:29:32', 0),
(419, 295, 54, 2, 20.00, '2025-10-09 13:56:35', '2025-10-09 13:56:35', 1),
(420, 296, 33, 3, 235.00, '2025-10-09 14:03:41', '2025-10-09 14:03:41', 0),
(421, 297, 33, 1, 235.00, '2025-10-09 14:05:08', '2025-10-09 14:05:08', 0),
(423, 299, 83, 1, 25.00, '2025-10-11 23:54:35', '2025-10-11 23:54:35', 0),
(424, 299, 88, 1, 69.00, '2025-10-11 23:54:35', '2025-10-11 23:54:35', 0),
(425, 299, 75, 1, 18.00, '2025-10-11 23:54:35', '2025-10-11 23:54:35', 0),
(426, 299, 41, 1, 12.00, '2025-10-11 23:54:35', '2025-10-11 23:54:35', 0),
(427, 300, 54, 1, 20.00, '2025-10-11 23:59:49', '2025-10-11 23:59:49', 0),
(428, 300, 82, 1, 28.00, '2025-10-11 23:59:49', '2025-10-11 23:59:49', 0),
(429, 300, 105, 1, 22.00, '2025-10-11 23:59:49', '2025-10-11 23:59:49', 0),
(430, 301, 107, 1, 429.00, '2025-10-12 00:00:28', '2025-10-12 00:00:28', 0),
(431, 302, 88, 1, 69.00, '2025-10-15 04:30:35', '2025-10-15 04:30:35', 0),
(432, 303, 87, 1, 99.00, '2025-10-15 04:31:30', '2025-10-15 04:31:30', 0),
(433, 303, 78, 1, 25.00, '2025-10-15 04:31:30', '2025-10-15 04:31:30', 0),
(434, 304, 102, 1, 19.00, '2025-10-16 07:43:00', '2025-10-16 07:43:00', 0),
(435, 304, 45, 1, 299.00, '2025-10-16 07:43:00', '2025-10-16 07:43:00', 0),
(436, 305, 41, 3, 12.00, '2025-10-17 04:44:22', '2025-10-17 04:44:22', 0),
(437, 305, 36, 1, 620.00, '2025-10-17 04:44:22', '2025-10-17 04:44:22', 0),
(438, 306, 125, 1, 400.00, '2025-10-19 22:04:54', '2025-10-19 22:04:54', 0),
(439, 307, 83, 1, 25.00, '2025-10-19 22:27:09', '2025-10-19 22:27:09', 0),
(440, 307, 41, 1, 12.00, '2025-10-19 22:27:09', '2025-10-19 22:27:09', 0),
(441, 308, 101, 1, 22.00, '2025-10-19 22:33:00', '2025-10-19 22:33:00', 0),
(442, 308, 79, 1, 35.00, '2025-10-19 22:33:00', '2025-10-19 22:33:00', 0),
(443, 308, 54, 1, 20.00, '2025-10-19 22:33:00', '2025-10-19 22:33:00', 0),
(444, 309, 81, 1, 35.00, '2025-10-20 05:20:15', '2025-10-20 05:20:15', 0),
(445, 310, 50, 1, 124.00, '2025-10-21 12:51:30', '2025-10-21 12:51:30', 0),
(446, 310, 84, 1, 80.00, '2025-10-21 12:51:30', '2025-10-21 12:51:30', 0),
(447, 311, 75, 1, 18.00, '2025-10-21 13:28:51', '2025-10-21 13:28:51', 0),
(448, 311, 78, 1, 25.00, '2025-10-21 13:28:51', '2025-10-21 13:28:51', 0),
(449, 311, 98, 1, 29.00, '2025-10-21 13:28:51', '2025-10-21 13:28:51', 0),
(450, 312, 83, 1, 25.00, '2025-10-22 14:41:47', '2025-10-22 14:41:47', 0),
(451, 312, 72, 1, 24.00, '2025-10-22 14:41:47', '2025-10-22 14:41:47', 0),
(452, 312, 102, 1, 19.00, '2025-10-22 14:41:47', '2025-10-22 14:41:47', 0),
(453, 313, 41, 1, 12.00, '2025-10-22 14:59:39', '2025-10-22 14:59:39', 0),
(454, 313, 88, 1, 69.00, '2025-10-22 14:59:39', '2025-10-22 14:59:39', 0),
(455, 313, 56, 1, 49.00, '2025-10-22 14:59:39', '2025-10-22 14:59:39', 0),
(456, 314, 114, 1, 199.00, '2025-10-23 02:25:30', '2025-10-23 02:25:30', 0),
(457, 315, 83, 1, 25.00, '2025-10-23 02:59:50', '2025-10-23 02:59:50', 0),
(458, 315, 101, 1, 22.00, '2025-10-23 02:59:50', '2025-10-23 02:59:50', 0),
(459, 315, 58, 1, 19.00, '2025-10-23 02:59:50', '2025-10-23 02:59:50', 0),
(460, 316, 83, 1, 25.00, '2025-10-23 03:56:01', '2025-10-23 03:56:01', 0),
(461, 316, 50, 1, 124.00, '2025-10-23 03:56:01', '2025-10-23 03:56:01', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('Dp5RPeB6dd33WRcHAus543CUQgNHi18ma68ZVrVF', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiU2FSQzRRak9kaUE5STQwZVN0VThDWE50SWNwMUd2ODZIdjY4cmpPcCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1761199403),
('nhiYOPR46UsL3sEN8Da9CFi7iCdjnhhclUPn4rq8', 4, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiNmx4TUEzQTEyZG1EZk53a2NnSDRNSTRiNlA0WDFpNTI0eFhiOFFHRyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly90bGdvbGQtcG9zLnRlc3Q6ODA4MC9hZG1pbiI7fXM6ODoiZmlsYW1lbnQiO2E6MDp7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjQ7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMiR6T2N1Y1NTVmdXZ1h4RTl5MGtmR2Uuek5lZ3NzQTljU0dNL21tZmc2T2YyOXRGOEJPc04yRyI7czoxNzoiRGFzaGJvYXJkX2ZpbHRlcnMiO047czo2OiJ0YWJsZXMiO2E6Mjp7czoyMzoiTGlzdENhdGVnb3JpZXNfcGVyX3BhZ2UiO3M6MzoiYWxsIjtzOjMwOiJMaXN0Q2F0ZWdvcmllc190b2dnbGVkX2NvbHVtbnMiO2E6Mzp7czoyOiJpZCI7YjowO3M6MTA6ImNyZWF0ZWRfYXQiO2I6MDtzOjEwOiJ1cGRhdGVkX2F0IjtiOjA7fX19', 1761203671),
('pyNW11zy3MMscaWrJRa2SLgXXBpGnPGiKsbJJX3j', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiRzBSTzFvbUFhd1A3elN0R2l2ZFJSMEc2OU5DV3kyNlRHdzZIS0dzbiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1761201774),
('xbj9yBSuybiu6eD33wfiqvVQPXl5wzBRHDhkVHHE', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiQ2paVElvTmxIa1Z4T0dWU1hDZXhmMDY4cTlHWmNwbDJ1ZmdWODlwWiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hZG1pbi9sb2dpbiI7fXM6MzoidXJsIjthOjE6e3M6ODoiaW50ZW5kZWQiO3M6Mjc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hZG1pbiI7fX0=', 1761199405);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `phone`, `address`, `bank_name`, `account_number`, `description`, `active`, `created_at`, `updated_at`) VALUES
(1, 'Yeang Hongsin (ACER)', '08826417256', 'Street:  #51D1, St.245 (Mao Tse Toung Blvd) S/K, Khan', 'ACERCenter', '6381037708', 'Acer laptop provider\n', 1, '2025-06-14 05:51:38', '2025-08-21 09:35:06'),
(2, 'Schaden-Hessel (MSI)', '087271452', 'Street:  #33, St.Angkor Kampong Bay South Village', 'Micro-Star International', '43893552007994', 'MSI  device provider', 1, '2025-06-14 05:51:38', '2025-08-21 09:33:27'),
(3, 'Abshire Hen (ACC)', '0875398267', 'Street:  #09, St.614', 'Absinde', '849688168862', 'Accessory distributer', 1, '2025-06-14 05:51:38', '2025-08-21 09:35:15'),
(4, 'Onikuma', '0998265412', '#165C, St.41 (Norodom) (In front of Brayovong Pagoda), S/K Boeng Keng Kang I', 'Onikuma', '0342844468', 'Onikuma supplier', 1, '2025-06-14 05:51:38', '2025-08-21 09:14:57'),
(5, 'Yet Bonta (ROG)', '098291742', 'Street:  #66Eo, St.53 S/K Phsar Thmei 1, Khan Daun Penh', 'Yeeti', '514505400', 'Asus and Rog supplier', 1, '2025-06-14 05:51:38', '2025-08-21 09:35:26'),
(6, 'Tang Loyhun (HP)', '066532176', 'Street:  #31C, St.222 S/K Boeng Reang, Khan Daun Penh', 'Hewlett Packard', '079912962952', 'HP product supplier', 1, '2025-06-14 05:51:38', '2025-08-21 09:34:56'),
(7, 'Ron Sophean (DEL)', '012435276', 'Street:  No. 19H, Yothapol Khemarak Phoumin (St. 271)', 'Dell Technologies', '35876369119', 'Dell  product provider', 1, '2025-06-14 05:51:38', '2025-08-21 09:34:30'),
(8, 'Pon Sopon (DEL)', '012987639', 'Street:  #89E2, St.113', 'DellLLC', '005825129505', 'Dell supplier', 1, '2025-06-14 05:51:38', '2025-08-21 09:34:44'),
(9, 'Doun Vanna (APL)', '021549274', 'Street:  N. 8Eo, Sihanouk Blvd. (St. 274), Tonle Basak', 'AppleLLC', '30263531379', 'Apple product supplier', 1, '2025-06-14 05:51:38', '2025-08-21 09:35:44'),
(10, 'Thiel Marvin (RZR)', '056720183', 'Street:  #518, St.128 (Kampuchea Krom Blvd), S/K Phsar', 'RazerLLC', '3665774446', 'Razer product Supplier', 1, '2025-06-14 05:51:38', '2025-08-21 09:35:58'),
(11, 'Vin Davit (ACC)', '066435291', 'Street:  #36, St.123 S/K Toul Tumpung I, Chan Chamkar Mon', 'DavitDistri', '63484613263', 'Accessory Provider', 1, '2025-08-21 09:23:50', '2025-08-21 09:36:11'),
(12, 'Ron Amimi (ALL)', '045980123', 'Street:  #59, St.178 S/K Chey Chumneas, Khan Daun Penh', 'RhodsIland', '53472986231', 'All Brand Supplier', 1, '2025-08-21 09:39:01', '2025-08-21 09:39:01'),
(13, 'Pong Vannta', '055437281', 'St. 7', 'Vannata', '6352 2391 2489', NULL, 1, '2025-09-10 14:38:34', '2025-10-22 14:57:48'),
(14, 'Kao Gongi', '0619264961', 'ST 788', 'GonGii', '6547 5875 5712', NULL, 1, '2025-09-15 05:11:11', '2025-10-22 14:58:14');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cashier',
  `avatar_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `phone_number` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otp_code` int DEFAULT NULL,
  `otp_expires_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `role`, `avatar_url`, `active`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `phone_number`, `otp_code`, `otp_expires_at`) VALUES
(1, 'Owner', 'admin@gmail.com', 'admin', 'avatars/01K83BZ6785NGQ1N1T150NAHPJ.jpg', 1, '2025-06-14 05:51:37', '$2y$12$.BlMFUJKfMewfD2315olvOyWRMsGCEVWW3tToGXd2HOwm63NKF3PW', 'eyWu8byi20mvyfrDr5BJjjgAeU5pjUbJR4u9VND4IWTv6PSqk04uLPakBYTQ', '2025-06-14 05:51:38', '2025-10-23 02:36:43', ' 015 589 808', NULL, NULL),
(2, 'Tester', 'tester@gmail.com', 'cashier', NULL, 1, '2025-06-14 05:51:38', '$2y$12$ouxv9NaGv3phSr92zQBkx./xJN7Vf1l.jDf4HqGtz5wJkfdq065lW', 'DbcRoGaWxtHFfmEy9bjrMbdJgor2f7hYpBhaznaPFpRK61T99fSFNA5BjSer', '2025-06-14 05:51:38', '2025-10-23 05:30:58', NULL, NULL, NULL),
(3, 'Tan Mona', 'tannouzita@gmail.com', 'admin', 'avatars/01K31QV8KZSJEAGWGXA3Q247VF.jpg', 1, NULL, '$2y$12$DCHknmreQ4fANUcuWJ3P0OlEcKj2HSkFsWCfI9jtdeJPn2pHwMwYG', 'GiQWaKx1b0yJFRKUXAwHWzsiPrGOwFyFIgCSSMarpkHTFf2xnASqpBeWzOHY', '2025-08-19 17:45:49', '2025-09-15 04:51:18', '066598728', NULL, NULL),
(4, 'Monaseka', 'monaseka.dev@gmail.com', 'admin', 'avatars/01K31QP8P7XCQJMV7QNPBMAV84.png', 1, NULL, '$2y$12$zOcucSSVgWgXxE9y0kfGe.zNegssA9cSGM/mmfg6Of29tF8BOsN2G', 'G3m0LI2nrPUiGUfjmnXzoo3OfMgaISYSGSrRvU72x6P3FNVnnvJNzZ46U4ZG', '2025-08-19 17:47:17', '2025-10-23 06:57:03', '0962819342', NULL, NULL),
(5, 'Sroeurn Sarath', 'ssgolden@gmail.com', 'cashier', 'avatars/01K31QJEK9DHYA1TQH8JAHYDYR.jpg', 1, NULL, '$2y$12$fbs6UlTL8yQzQk23hKsQLuNnCcNBSfuAEKeR1D0wH71ZLT9zwJ.Ga', 'O1bAr83h9E9dOvuaGNnZi7mH38VODmBkmgB3SVI8zoDS5mTVdTOKmjtKUVGI', '2025-08-19 17:48:27', '2025-10-23 03:20:30', '0968384150', NULL, NULL),
(6, 'Sun Dara ', 'sdgolden@gmail.com', 'cashier', 'avatars/01K87V7WKKKB9P0GXXXDNEHJ96.jpg', 0, NULL, '$2y$12$ZF5jBKtAYZosOlFv0HWBFOaGhydVH/EpkHwqcF10USXTWX0jchoRS', 'ibcjhNM6cSNDsD8b2WwBWZg4l5GicfHCAl72I2MF20Zzhlj6gmHCk8NJbaT3', '2025-08-19 17:49:36', '2025-10-23 07:00:27', '061394534', NULL, NULL),
(7, 'Mona Tan', 'tannmona@gmail.com', 'cashier', 'avatars/01K87TKFPBQCNEKQKNR6H1T6M3.jpg', 1, '2025-09-07 06:27:44', '$2y$12$WjGHlTjGbsI8mEgGU2de9OOe16ElkCReL6moHnpsQRO84or5W52zS', 'ublFMz2wSk53bBWREtd7NoLiYFVbdt0sn1AggGzGmv6GW6SqoSpvjxGEwUbY', '2025-08-31 05:55:46', '2025-10-23 07:00:28', '066598728', NULL, NULL),
(8, 'Vannet', 'vannet@gmail.com', 'cashier', NULL, 0, NULL, '$2y$12$6nCGrbd79xT5VYANB1fUyuEDql1ob9L.VNgLnWtBk1Ki5SbQvLnwC', NULL, '2025-08-31 06:05:33', '2025-10-23 03:47:26', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_website_unique` (`website`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_customer_code` (`customer_code`);

--
-- Indexes for table `exports`
--
ALTER TABLE `exports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exports_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_import_rows`
--
ALTER TABLE `failed_import_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `failed_import_rows_import_id_foreign` (`import_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `imports`
--
ALTER TABLE `imports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `imports_user_id_foreign` (`user_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `password_reset_otps`
--
ALTER TABLE `password_reset_otps`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `password_reset_otps_email_unique` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_user_id_foreign` (`user_id`);

--
-- Indexes for table `product_imports`
--
ALTER TABLE `product_imports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_import_items`
--
ALTER TABLE `product_import_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_import_items_product_import_id_foreign` (`product_import_id`),
  ADD KEY `product_import_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sale_items`
--
ALTER TABLE `sale_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_items_sale_id_foreign` (`sale_id`),
  ADD KEY `sale_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `exports`
--
ALTER TABLE `exports`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `failed_import_rows`
--
ALTER TABLE `failed_import_rows`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `imports`
--
ALTER TABLE `imports`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1154;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `password_reset_otps`
--
ALTER TABLE `password_reset_otps`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT for table `product_imports`
--
ALTER TABLE `product_imports`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT for table `product_import_items`
--
ALTER TABLE `product_import_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=197;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=317;

--
-- AUTO_INCREMENT for table `sale_items`
--
ALTER TABLE `sale_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=462;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `exports`
--
ALTER TABLE `exports`
  ADD CONSTRAINT `exports_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `failed_import_rows`
--
ALTER TABLE `failed_import_rows`
  ADD CONSTRAINT `failed_import_rows_import_id_foreign` FOREIGN KEY (`import_id`) REFERENCES `imports` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `imports`
--
ALTER TABLE `imports`
  ADD CONSTRAINT `imports_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `product_import_items`
--
ALTER TABLE `product_import_items`
  ADD CONSTRAINT `product_import_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_import_items_product_import_id_foreign` FOREIGN KEY (`product_import_id`) REFERENCES `product_imports` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sale_items`
--
ALTER TABLE `sale_items`
  ADD CONSTRAINT `sale_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sale_items_sale_id_foreign` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
