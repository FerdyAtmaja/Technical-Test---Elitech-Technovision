-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 16, 2025 at 10:51 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_elitech`
--

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_barang` varchar(255) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `satuan` varchar(255) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `lock_version` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `kode_barang`, `nama_barang`, `satuan`, `stock`, `created_at`, `updated_at`, `deleted_at`, `lock_version`) VALUES
(1, 'BRG001', 'Tensimeter Digital', 'pcs', -37, '2025-11-16 02:39:39', '2025-11-16 02:40:35', NULL, 0),
(2, 'BRG002', 'Termometer Infrared', 'pcs', 25, '2025-11-16 02:39:39', '2025-11-16 02:39:39', NULL, 0),
(3, 'BRG003', 'Pulse Oximeter', 'pcs', 30, '2025-11-16 02:39:39', '2025-11-16 02:39:39', NULL, 0),
(4, 'BRG004', 'Nebulizer Portable', 'pcs', 12, '2025-11-16 02:39:39', '2025-11-16 02:39:39', NULL, 0),
(5, 'BRG005', 'Glucometer', 'pcs', 20, '2025-11-16 02:39:39', '2025-11-16 02:39:39', NULL, 0),
(6, 'BRG006', 'Stetoskop Digital', 'pcs', 8, '2025-11-16 02:39:39', '2025-11-16 02:39:39', NULL, 0),
(7, 'BRG007', 'Defibrilator AED', 'pcs', 3, '2025-11-16 02:39:39', '2025-11-16 02:39:39', NULL, 0),
(8, 'BRG008', 'ECG Machine', 'pcs', 5, '2025-11-16 02:39:39', '2025-11-16 02:39:39', NULL, 0),
(9, 'BRG009', 'Infusion Pump', 'pcs', 10, '2025-11-16 02:39:39', '2025-11-16 02:39:39', NULL, 0),
(10, 'BRG010', 'Suction Unit', 'pcs', 7, '2025-11-16 02:39:39', '2025-11-16 02:39:39', NULL, 0),
(11, 'BRG011', 'Laptop Dell Inspiron', 'pcs', 15, '2025-11-16 02:39:39', '2025-11-16 02:39:39', NULL, 0),
(12, 'BRG012', 'Tablet Samsung', 'pcs', 20, '2025-11-16 02:39:39', '2025-11-16 02:39:39', NULL, 0),
(13, 'BRG013', 'Smartphone iPhone', 'pcs', 12, '2025-11-16 02:39:39', '2025-11-16 02:39:39', NULL, 0),
(14, 'BRG014', 'Monitor LED 24 inch', 'pcs', 18, '2025-11-16 02:39:39', '2025-11-16 02:39:39', NULL, 0),
(15, 'BRG015', 'Printer Laser', 'pcs', 8, '2025-11-16 02:39:39', '2025-11-16 02:39:39', NULL, 0),
(16, 'BRG016', 'Projector LCD', 'pcs', 6, '2025-11-16 02:39:39', '2025-11-16 02:39:39', NULL, 0),
(17, 'BRG017', 'Router WiFi', 'pcs', 25, '2025-11-16 02:39:39', '2025-11-16 02:39:39', NULL, 0),
(18, 'BRG018', 'UPS 1000VA', 'pcs', 10, '2025-11-16 02:39:39', '2025-11-16 02:39:39', NULL, 0),
(19, 'BRG019', 'Scanner Document', 'pcs', 5, '2025-11-16 02:39:39', '2025-11-16 02:39:39', NULL, 0),
(20, 'BRG020', 'External HDD 1TB', 'pcs', 30, '2025-11-16 02:39:39', '2025-11-16 02:39:39', NULL, 0),
(21, 'BRG100', 'Pulpen Biru quibusdam', 'rim', 57, '2025-11-16 02:39:39', '2025-11-16 02:39:39', NULL, 0),
(22, 'BRG052', 'Buku Tulis sed', 'pcs', 71, '2025-11-16 02:39:39', '2025-11-16 02:39:39', NULL, 0),
(23, 'BRG118', 'Sticky Notes quasi', 'pcs', 77, '2025-11-16 02:39:39', '2025-11-16 02:39:39', NULL, 0),
(24, 'BRG047', 'Lakban Bening excepturi', 'box', 14, '2025-11-16 02:39:39', '2025-11-16 02:39:39', NULL, 0),
(25, 'BRG045', 'Penghapus voluptas', 'dus', 64, '2025-11-16 02:39:39', '2025-11-16 02:39:39', NULL, 0),
(26, 'BRG033', 'Sticky Notes hic', 'dus', 92, '2025-11-16 02:39:39', '2025-11-16 02:39:39', NULL, 0),
(27, 'BRG107', 'Highlighter est', 'pack', 66, '2025-11-16 02:39:39', '2025-11-16 02:39:39', NULL, 0),
(28, 'BRG101', 'Highlighter occaecati', 'dus', 20, '2025-11-16 02:39:39', '2025-11-16 02:39:39', NULL, 0),
(29, 'BRG067', 'Lem Stick placeat', 'rim', 34, '2025-11-16 02:39:39', '2025-11-16 02:39:39', NULL, 0),
(30, 'BRG108', 'Klip Kertas perferendis', 'box', 24, '2025-11-16 02:39:39', '2025-11-16 02:39:39', NULL, 0),
(31, 'BRG043', 'Lakban Bening repellendus', 'box', 50, '2025-11-16 02:39:39', '2025-11-16 02:39:39', NULL, 0),
(32, 'BRG103', 'Kalkulator veritatis', 'rim', 11, '2025-11-16 02:39:39', '2025-11-16 02:39:39', NULL, 0),
(33, 'BRG119', 'Marker Board eos', 'box', 47, '2025-11-16 02:39:39', '2025-11-16 02:39:39', NULL, 0),
(34, 'BRG055', 'Tinta Printer sit', 'pack', 69, '2025-11-16 02:39:39', '2025-11-16 02:39:39', NULL, 0),
(35, 'BRG034', 'Sticky Notes commodi', 'rim', 63, '2025-11-16 02:39:39', '2025-11-16 02:39:39', NULL, 0),
(36, 'BRG072', 'Stapler Kecil aut', 'pack', 77, '2025-11-16 02:39:39', '2025-11-16 02:39:39', NULL, 0),
(37, 'BRG114', 'Correction Pen perspiciatis', 'rim', 21, '2025-11-16 02:39:39', '2025-11-16 02:39:39', NULL, 0),
(38, 'BRG113', 'Spidol Hitam et', 'pcs', 79, '2025-11-16 02:39:39', '2025-11-16 02:39:39', NULL, 0),
(39, 'BRG030', 'Kalkulator tempora', 'dus', 30, '2025-11-16 02:39:39', '2025-11-16 02:39:39', NULL, 0),
(40, 'BRG085', 'Lakban Bening neque', 'rim', 38, '2025-11-16 02:39:39', '2025-11-16 02:39:39', NULL, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `items_kode_barang_unique` (`kode_barang`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
