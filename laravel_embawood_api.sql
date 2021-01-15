-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 15, 2021 at 03:57 PM
-- Server version: 10.3.22-MariaDB
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_embawood_api`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`) VALUES
(1, 'YATAQ DƏSTİ'),
(2, 'QONAQ DƏSTİ'),
(3, 'YUMŞAQ MEBEL'),
(4, 'STUL VƏ MASALAR'),
(5, 'DƏHLİZ DƏSTİ');

-- --------------------------------------------------------

--
-- Table structure for table `galleries`
--

CREATE TABLE `galleries` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `galleries`
--

INSERT INTO `galleries` (`id`, `product_id`, `image`, `created_at`, `updated_at`) VALUES
(35, 24, 'images/product/gallery/2021-01-15/siJsxHzAHTCZQbAtytNUKvUts2mxI5xKugZmSFIN.png', '2021-01-15 09:24:01', NULL),
(36, 24, 'images/product/gallery/2021-01-15/DP3NxRU9S898TVy2tksOUkajSFQirB0uiSSsgGUk.png', '2021-01-15 09:24:01', NULL),
(37, 25, 'images/product/gallery/2021-01-15/qxMQmH7Ziqghtc8aXR7o3wHKf9NnpN0Y3zedF4D9.png', '2021-01-15 09:27:28', NULL),
(38, 25, 'images/product/gallery/2021-01-15/SeTFAmyKbDK0v5OJm1HZwUfSVC1YDEbs8QjYRiUg.png', '2021-01-15 09:27:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2021_01_12_170906_create_categories_table', 1),
(2, '2021_01_12_170954_create_products_table', 1),
(3, '2021_01_12_183758_create_galleries_table', 2),
(4, '2021_01_13_071316_create_users_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `main_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `category_id`, `main_image`, `description`, `created_at`, `updated_at`) VALUES
(24, 'Arizona', 1, 'images/product/2021-01-15/dFmNzSxYVfB4WtCLogVRSfGnxX5GBdn93GLtqgn7.png', 'Arizona yataq desti', '2021-01-15 09:24:01', '2021-01-15 09:24:01'),
(25, 'ST S-553.2', 2, 'images/product/2021-01-15/GqZKJFO8asQbrJbHzXA8uJmbBqySL6OTaklePSvO.png', 'ST S-553.2 qonaq desti', '2021-01-15 09:27:28', '2021-01-15 09:27:28'),
(26, 'Novella', 3, 'images/product/2021-01-15/zAer5CiA2gPgXkgyrvlVss0qOJ5SJ87T0J3R8Jhh.png', 'Novella yumshaq desti', '2021-01-15 09:28:56', '2021-01-15 09:57:05');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@bk.ru', '$2y$10$5I7bsq5992kTzDSSwo35eOgfVsAvImLbjnLs8snKzg11oGbVGgubC', '2021-01-13 04:27:13', '2021-01-13 04:27:13'),
(2, 'admin1', 'admin1@bk.ru', '$2y$10$opyfCkRVNnKJ8gT5g09r9udqxgfISfDKthBlVwG2igy9211GN00QO', '2021-01-13 08:43:43', '2021-01-13 08:43:43'),
(3, 'admin2', 'admin2@bk.ru', '$2y$10$X1dVeQ7j4g/ElcGaIEsseOi4G.GuHc7x5paYU736aBMJ9CW0qcNE6', '2021-01-13 16:49:17', '2021-01-13 16:49:17'),
(4, 'admin3', 'admin3@bk.ru', '$2y$10$XGevO/NDjADF/UK.koFXOO3y2NFAI2wNuZk1vvzRFyo7kAS2QnuMu', '2021-01-15 09:51:25', '2021-01-15 09:51:25'),
(5, 'admin4', 'admin4@bk.ru', '$2y$10$KbFYZ8IQmZXlchV2RtW1V.cUfP4JAxqno6OoucXVBgO2P4lSl0Qg.', '2021-01-15 09:52:06', '2021-01-15 09:52:06'),
(6, 'admin5', 'admin5@bk.ru', '$2y$10$Og4A5RhBo/t73UD6WQhI8OJEWuk1grVEVndtaPpy4.1RCx7/SfYje', '2021-01-15 09:52:45', '2021-01-15 09:52:45');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `galleries`
--
ALTER TABLE `galleries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `galleries`
--
ALTER TABLE `galleries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
