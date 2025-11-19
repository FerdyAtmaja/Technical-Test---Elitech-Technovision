-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 19, 2025 at 05:22 AM
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
-- Table structure for table `audit_logs`
--

CREATE TABLE `audit_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `auditable_type` varchar(255) NOT NULL,
  `auditable_id` bigint(20) UNSIGNED NOT NULL,
  `event` varchar(255) NOT NULL,
  `old_values` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`old_values`)),
  `new_values` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`new_values`)),
  `user_id` varchar(255) DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `audit_logs`
--

INSERT INTO `audit_logs` (`id`, `auditable_type`, `auditable_id`, `event`, `old_values`, `new_values`, `user_id`, `ip_address`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\Item', 1, 'created', '[]', '{\"nama_barang\":\"Tensimeter Digital\",\"satuan\":\"pcs\",\"stock\":15,\"kode_barang\":\"BRG001\",\"created_by\":null,\"stock_awal\":15,\"updated_at\":\"2025-11-18 16:39:03\",\"created_at\":\"2025-11-18 16:39:03\",\"id\":1}', NULL, '127.0.0.1', '2025-11-18 09:39:04', '2025-11-18 09:39:04'),
(2, 'App\\Models\\Item', 2, 'created', '[]', '{\"nama_barang\":\"Termometer Infrared\",\"satuan\":\"pcs\",\"stock\":25,\"kode_barang\":\"BRG002\",\"created_by\":null,\"stock_awal\":25,\"updated_at\":\"2025-11-18 16:39:04\",\"created_at\":\"2025-11-18 16:39:04\",\"id\":2}', NULL, '127.0.0.1', '2025-11-18 09:39:04', '2025-11-18 09:39:04'),
(3, 'App\\Models\\Item', 3, 'created', '[]', '{\"nama_barang\":\"Pulse Oximeter\",\"satuan\":\"pcs\",\"stock\":30,\"kode_barang\":\"BRG003\",\"created_by\":null,\"stock_awal\":30,\"updated_at\":\"2025-11-18 16:39:04\",\"created_at\":\"2025-11-18 16:39:04\",\"id\":3}', NULL, '127.0.0.1', '2025-11-18 09:39:04', '2025-11-18 09:39:04'),
(4, 'App\\Models\\Item', 4, 'created', '[]', '{\"nama_barang\":\"Nebulizer Portable\",\"satuan\":\"pcs\",\"stock\":12,\"kode_barang\":\"BRG004\",\"created_by\":null,\"stock_awal\":12,\"updated_at\":\"2025-11-18 16:39:04\",\"created_at\":\"2025-11-18 16:39:04\",\"id\":4}', NULL, '127.0.0.1', '2025-11-18 09:39:04', '2025-11-18 09:39:04'),
(5, 'App\\Models\\Item', 5, 'created', '[]', '{\"nama_barang\":\"Glucometer\",\"satuan\":\"pcs\",\"stock\":20,\"kode_barang\":\"BRG005\",\"created_by\":null,\"stock_awal\":20,\"updated_at\":\"2025-11-18 16:39:04\",\"created_at\":\"2025-11-18 16:39:04\",\"id\":5}', NULL, '127.0.0.1', '2025-11-18 09:39:04', '2025-11-18 09:39:04'),
(6, 'App\\Models\\Item', 6, 'created', '[]', '{\"nama_barang\":\"Stetoskop Digital\",\"satuan\":\"pcs\",\"stock\":8,\"kode_barang\":\"BRG006\",\"created_by\":null,\"stock_awal\":8,\"updated_at\":\"2025-11-18 16:39:04\",\"created_at\":\"2025-11-18 16:39:04\",\"id\":6}', NULL, '127.0.0.1', '2025-11-18 09:39:04', '2025-11-18 09:39:04'),
(7, 'App\\Models\\Item', 7, 'created', '[]', '{\"nama_barang\":\"Defibrilator AED\",\"satuan\":\"pcs\",\"stock\":3,\"kode_barang\":\"BRG007\",\"created_by\":null,\"stock_awal\":3,\"updated_at\":\"2025-11-18 16:39:04\",\"created_at\":\"2025-11-18 16:39:04\",\"id\":7}', NULL, '127.0.0.1', '2025-11-18 09:39:04', '2025-11-18 09:39:04'),
(8, 'App\\Models\\Item', 8, 'created', '[]', '{\"nama_barang\":\"ECG Machine\",\"satuan\":\"pcs\",\"stock\":5,\"kode_barang\":\"BRG008\",\"created_by\":null,\"stock_awal\":5,\"updated_at\":\"2025-11-18 16:39:04\",\"created_at\":\"2025-11-18 16:39:04\",\"id\":8}', NULL, '127.0.0.1', '2025-11-18 09:39:04', '2025-11-18 09:39:04'),
(9, 'App\\Models\\Item', 9, 'created', '[]', '{\"nama_barang\":\"Infusion Pump\",\"satuan\":\"pcs\",\"stock\":10,\"kode_barang\":\"BRG009\",\"created_by\":null,\"stock_awal\":10,\"updated_at\":\"2025-11-18 16:39:04\",\"created_at\":\"2025-11-18 16:39:04\",\"id\":9}', NULL, '127.0.0.1', '2025-11-18 09:39:04', '2025-11-18 09:39:04'),
(10, 'App\\Models\\Item', 10, 'created', '[]', '{\"nama_barang\":\"Suction Unit\",\"satuan\":\"pcs\",\"stock\":7,\"kode_barang\":\"BRG010\",\"created_by\":null,\"stock_awal\":7,\"updated_at\":\"2025-11-18 16:39:04\",\"created_at\":\"2025-11-18 16:39:04\",\"id\":10}', NULL, '127.0.0.1', '2025-11-18 09:39:04', '2025-11-18 09:39:04'),
(11, 'App\\Models\\Item', 11, 'created', '[]', '{\"nama_barang\":\"Laptop Dell Inspiron\",\"satuan\":\"pcs\",\"stock\":15,\"kode_barang\":\"BRG011\",\"created_by\":null,\"stock_awal\":15,\"updated_at\":\"2025-11-18 16:39:04\",\"created_at\":\"2025-11-18 16:39:04\",\"id\":11}', NULL, '127.0.0.1', '2025-11-18 09:39:04', '2025-11-18 09:39:04'),
(12, 'App\\Models\\Item', 12, 'created', '[]', '{\"nama_barang\":\"Tablet Samsung\",\"satuan\":\"pcs\",\"stock\":20,\"kode_barang\":\"BRG012\",\"created_by\":null,\"stock_awal\":20,\"updated_at\":\"2025-11-18 16:39:04\",\"created_at\":\"2025-11-18 16:39:04\",\"id\":12}', NULL, '127.0.0.1', '2025-11-18 09:39:04', '2025-11-18 09:39:04'),
(13, 'App\\Models\\Item', 13, 'created', '[]', '{\"nama_barang\":\"Smartphone iPhone\",\"satuan\":\"pcs\",\"stock\":12,\"kode_barang\":\"BRG013\",\"created_by\":null,\"stock_awal\":12,\"updated_at\":\"2025-11-18 16:39:04\",\"created_at\":\"2025-11-18 16:39:04\",\"id\":13}', NULL, '127.0.0.1', '2025-11-18 09:39:04', '2025-11-18 09:39:04'),
(14, 'App\\Models\\Item', 14, 'created', '[]', '{\"nama_barang\":\"Monitor LED 24 inch\",\"satuan\":\"pcs\",\"stock\":18,\"kode_barang\":\"BRG014\",\"created_by\":null,\"stock_awal\":18,\"updated_at\":\"2025-11-18 16:39:04\",\"created_at\":\"2025-11-18 16:39:04\",\"id\":14}', NULL, '127.0.0.1', '2025-11-18 09:39:04', '2025-11-18 09:39:04'),
(15, 'App\\Models\\Item', 15, 'created', '[]', '{\"nama_barang\":\"Printer Laser\",\"satuan\":\"pcs\",\"stock\":8,\"kode_barang\":\"BRG015\",\"created_by\":null,\"stock_awal\":8,\"updated_at\":\"2025-11-18 16:39:04\",\"created_at\":\"2025-11-18 16:39:04\",\"id\":15}', NULL, '127.0.0.1', '2025-11-18 09:39:04', '2025-11-18 09:39:04'),
(16, 'App\\Models\\Item', 16, 'created', '[]', '{\"nama_barang\":\"Projector LCD\",\"satuan\":\"pcs\",\"stock\":6,\"kode_barang\":\"BRG016\",\"created_by\":null,\"stock_awal\":6,\"updated_at\":\"2025-11-18 16:39:04\",\"created_at\":\"2025-11-18 16:39:04\",\"id\":16}', NULL, '127.0.0.1', '2025-11-18 09:39:04', '2025-11-18 09:39:04'),
(17, 'App\\Models\\Item', 17, 'created', '[]', '{\"nama_barang\":\"Router WiFi\",\"satuan\":\"pcs\",\"stock\":25,\"kode_barang\":\"BRG017\",\"created_by\":null,\"stock_awal\":25,\"updated_at\":\"2025-11-18 16:39:04\",\"created_at\":\"2025-11-18 16:39:04\",\"id\":17}', NULL, '127.0.0.1', '2025-11-18 09:39:04', '2025-11-18 09:39:04'),
(18, 'App\\Models\\Item', 18, 'created', '[]', '{\"nama_barang\":\"UPS 1000VA\",\"satuan\":\"pcs\",\"stock\":10,\"kode_barang\":\"BRG018\",\"created_by\":null,\"stock_awal\":10,\"updated_at\":\"2025-11-18 16:39:04\",\"created_at\":\"2025-11-18 16:39:04\",\"id\":18}', NULL, '127.0.0.1', '2025-11-18 09:39:04', '2025-11-18 09:39:04'),
(19, 'App\\Models\\Item', 19, 'created', '[]', '{\"nama_barang\":\"Scanner Document\",\"satuan\":\"pcs\",\"stock\":5,\"kode_barang\":\"BRG019\",\"created_by\":null,\"stock_awal\":5,\"updated_at\":\"2025-11-18 16:39:04\",\"created_at\":\"2025-11-18 16:39:04\",\"id\":19}', NULL, '127.0.0.1', '2025-11-18 09:39:04', '2025-11-18 09:39:04'),
(20, 'App\\Models\\Item', 20, 'created', '[]', '{\"nama_barang\":\"External HDD 1TB\",\"satuan\":\"pcs\",\"stock\":30,\"kode_barang\":\"BRG020\",\"created_by\":null,\"stock_awal\":30,\"updated_at\":\"2025-11-18 16:39:04\",\"created_at\":\"2025-11-18 16:39:04\",\"id\":20}', NULL, '127.0.0.1', '2025-11-18 09:39:04', '2025-11-18 09:39:04'),
(21, 'App\\Models\\Item', 21, 'created', '[]', '{\"kode_barang\":\"BRG055\",\"nama_barang\":\"Pensil 2B corporis\",\"satuan\":\"box\",\"stock\":61,\"created_by\":null,\"stock_awal\":61,\"updated_at\":\"2025-11-18 16:39:06\",\"created_at\":\"2025-11-18 16:39:06\",\"id\":21}', NULL, '127.0.0.1', '2025-11-18 09:39:06', '2025-11-18 09:39:06'),
(22, 'App\\Models\\Item', 22, 'created', '[]', '{\"kode_barang\":\"BRG109\",\"nama_barang\":\"Kertas A4 vel\",\"satuan\":\"pcs\",\"stock\":25,\"created_by\":null,\"stock_awal\":25,\"updated_at\":\"2025-11-18 16:39:06\",\"created_at\":\"2025-11-18 16:39:06\",\"id\":22}', NULL, '127.0.0.1', '2025-11-18 09:39:06', '2025-11-18 09:39:06'),
(23, 'App\\Models\\Item', 23, 'created', '[]', '{\"kode_barang\":\"BRG034\",\"nama_barang\":\"Kalkulator quidem\",\"satuan\":\"pack\",\"stock\":21,\"created_by\":null,\"stock_awal\":21,\"updated_at\":\"2025-11-18 16:39:06\",\"created_at\":\"2025-11-18 16:39:06\",\"id\":23}', NULL, '127.0.0.1', '2025-11-18 09:39:06', '2025-11-18 09:39:06'),
(24, 'App\\Models\\Item', 24, 'created', '[]', '{\"kode_barang\":\"BRG095\",\"nama_barang\":\"Folder Plastik odio\",\"satuan\":\"pack\",\"stock\":50,\"created_by\":null,\"stock_awal\":50,\"updated_at\":\"2025-11-18 16:39:06\",\"created_at\":\"2025-11-18 16:39:06\",\"id\":24}', NULL, '127.0.0.1', '2025-11-18 09:39:06', '2025-11-18 09:39:06'),
(25, 'App\\Models\\Item', 25, 'created', '[]', '{\"kode_barang\":\"BRG047\",\"nama_barang\":\"Tinta Printer rerum\",\"satuan\":\"pack\",\"stock\":50,\"created_by\":null,\"stock_awal\":50,\"updated_at\":\"2025-11-18 16:39:06\",\"created_at\":\"2025-11-18 16:39:06\",\"id\":25}', NULL, '127.0.0.1', '2025-11-18 09:39:06', '2025-11-18 09:39:06'),
(26, 'App\\Models\\Item', 26, 'created', '[]', '{\"kode_barang\":\"BRG059\",\"nama_barang\":\"Buku Tulis velit\",\"satuan\":\"box\",\"stock\":14,\"created_by\":null,\"stock_awal\":14,\"updated_at\":\"2025-11-18 16:39:06\",\"created_at\":\"2025-11-18 16:39:06\",\"id\":26}', NULL, '127.0.0.1', '2025-11-18 09:39:06', '2025-11-18 09:39:06'),
(27, 'App\\Models\\Item', 27, 'created', '[]', '{\"kode_barang\":\"BRG080\",\"nama_barang\":\"Correction Pen non\",\"satuan\":\"pcs\",\"stock\":77,\"created_by\":null,\"stock_awal\":77,\"updated_at\":\"2025-11-18 16:39:06\",\"created_at\":\"2025-11-18 16:39:06\",\"id\":27}', NULL, '127.0.0.1', '2025-11-18 09:39:06', '2025-11-18 09:39:06'),
(28, 'App\\Models\\Item', 28, 'created', '[]', '{\"kode_barang\":\"BRG085\",\"nama_barang\":\"Sticky Notes mollitia\",\"satuan\":\"dus\",\"stock\":23,\"created_by\":null,\"stock_awal\":23,\"updated_at\":\"2025-11-18 16:39:06\",\"created_at\":\"2025-11-18 16:39:06\",\"id\":28}', NULL, '127.0.0.1', '2025-11-18 09:39:06', '2025-11-18 09:39:06'),
(29, 'App\\Models\\Item', 29, 'created', '[]', '{\"kode_barang\":\"BRG067\",\"nama_barang\":\"Folder Plastik natus\",\"satuan\":\"pack\",\"stock\":78,\"created_by\":null,\"stock_awal\":78,\"updated_at\":\"2025-11-18 16:39:06\",\"created_at\":\"2025-11-18 16:39:06\",\"id\":29}', NULL, '127.0.0.1', '2025-11-18 09:39:06', '2025-11-18 09:39:06'),
(30, 'App\\Models\\Item', 30, 'created', '[]', '{\"kode_barang\":\"BRG063\",\"nama_barang\":\"Amplop Coklat fugiat\",\"satuan\":\"pack\",\"stock\":87,\"created_by\":null,\"stock_awal\":87,\"updated_at\":\"2025-11-18 16:39:06\",\"created_at\":\"2025-11-18 16:39:06\",\"id\":30}', NULL, '127.0.0.1', '2025-11-18 09:39:06', '2025-11-18 09:39:06'),
(31, 'App\\Models\\Item', 31, 'created', '[]', '{\"kode_barang\":\"BRG101\",\"nama_barang\":\"Klip Kertas consequatur\",\"satuan\":\"rim\",\"stock\":79,\"created_by\":null,\"stock_awal\":79,\"updated_at\":\"2025-11-18 16:39:06\",\"created_at\":\"2025-11-18 16:39:06\",\"id\":31}', NULL, '127.0.0.1', '2025-11-18 09:39:06', '2025-11-18 09:39:06'),
(32, 'App\\Models\\Item', 32, 'created', '[]', '{\"kode_barang\":\"BRG064\",\"nama_barang\":\"Kertas A4 reiciendis\",\"satuan\":\"rim\",\"stock\":71,\"created_by\":null,\"stock_awal\":71,\"updated_at\":\"2025-11-18 16:39:06\",\"created_at\":\"2025-11-18 16:39:06\",\"id\":32}', NULL, '127.0.0.1', '2025-11-18 09:39:06', '2025-11-18 09:39:06'),
(33, 'App\\Models\\Item', 33, 'created', '[]', '{\"kode_barang\":\"BRG050\",\"nama_barang\":\"Stapler Kecil fuga\",\"satuan\":\"rim\",\"stock\":63,\"created_by\":null,\"stock_awal\":63,\"updated_at\":\"2025-11-18 16:39:06\",\"created_at\":\"2025-11-18 16:39:06\",\"id\":33}', NULL, '127.0.0.1', '2025-11-18 09:39:06', '2025-11-18 09:39:06'),
(34, 'App\\Models\\Item', 34, 'created', '[]', '{\"kode_barang\":\"BRG092\",\"nama_barang\":\"Highlighter iste\",\"satuan\":\"rim\",\"stock\":51,\"created_by\":null,\"stock_awal\":51,\"updated_at\":\"2025-11-18 16:39:06\",\"created_at\":\"2025-11-18 16:39:06\",\"id\":34}', NULL, '127.0.0.1', '2025-11-18 09:39:06', '2025-11-18 09:39:06'),
(35, 'App\\Models\\Item', 35, 'created', '[]', '{\"kode_barang\":\"BRG081\",\"nama_barang\":\"Kalkulator et\",\"satuan\":\"dus\",\"stock\":61,\"created_by\":null,\"stock_awal\":61,\"updated_at\":\"2025-11-18 16:39:06\",\"created_at\":\"2025-11-18 16:39:06\",\"id\":35}', NULL, '127.0.0.1', '2025-11-18 09:39:06', '2025-11-18 09:39:06'),
(36, 'App\\Models\\Item', 36, 'created', '[]', '{\"kode_barang\":\"BRG114\",\"nama_barang\":\"Pulpen Biru sequi\",\"satuan\":\"box\",\"stock\":58,\"created_by\":null,\"stock_awal\":58,\"updated_at\":\"2025-11-18 16:39:06\",\"created_at\":\"2025-11-18 16:39:06\",\"id\":36}', NULL, '127.0.0.1', '2025-11-18 09:39:06', '2025-11-18 09:39:06'),
(37, 'App\\Models\\Item', 37, 'created', '[]', '{\"kode_barang\":\"BRG078\",\"nama_barang\":\"Amplop Coklat quos\",\"satuan\":\"pack\",\"stock\":19,\"created_by\":null,\"stock_awal\":19,\"updated_at\":\"2025-11-18 16:39:06\",\"created_at\":\"2025-11-18 16:39:06\",\"id\":37}', NULL, '127.0.0.1', '2025-11-18 09:39:06', '2025-11-18 09:39:06'),
(38, 'App\\Models\\Item', 38, 'created', '[]', '{\"kode_barang\":\"BRG054\",\"nama_barang\":\"Kalkulator quae\",\"satuan\":\"pack\",\"stock\":31,\"created_by\":null,\"stock_awal\":31,\"updated_at\":\"2025-11-18 16:39:06\",\"created_at\":\"2025-11-18 16:39:06\",\"id\":38}', NULL, '127.0.0.1', '2025-11-18 09:39:06', '2025-11-18 09:39:06'),
(39, 'App\\Models\\Item', 39, 'created', '[]', '{\"kode_barang\":\"BRG089\",\"nama_barang\":\"Amplop Coklat nulla\",\"satuan\":\"pcs\",\"stock\":72,\"created_by\":null,\"stock_awal\":72,\"updated_at\":\"2025-11-18 16:39:06\",\"created_at\":\"2025-11-18 16:39:06\",\"id\":39}', NULL, '127.0.0.1', '2025-11-18 09:39:06', '2025-11-18 09:39:06'),
(40, 'App\\Models\\Item', 40, 'created', '[]', '{\"kode_barang\":\"BRG119\",\"nama_barang\":\"Kertas A4 ducimus\",\"satuan\":\"pack\",\"stock\":44,\"created_by\":null,\"stock_awal\":44,\"updated_at\":\"2025-11-18 16:39:06\",\"created_at\":\"2025-11-18 16:39:06\",\"id\":40}', NULL, '127.0.0.1', '2025-11-18 09:39:06', '2025-11-18 09:39:06'),
(41, 'App\\Models\\Item', 1, 'updated', '{\"id\":1,\"kode_barang\":\"BRG001\",\"nama_barang\":\"Tensimeter Digital\",\"satuan\":\"pcs\",\"stock_awal\":15,\"stock\":15,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18T16:39:03.000000Z\",\"updated_at\":\"2025-11-18T16:39:03.000000Z\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', '{\"id\":1,\"kode_barang\":\"BRG001\",\"nama_barang\":\"Tensimeter Digital\",\"satuan\":\"pcs\",\"stock_awal\":15,\"stock\":32,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18 16:39:03\",\"updated_at\":\"2025-11-18 16:39:03\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', NULL, '127.0.0.1', '2025-11-18 09:39:06', '2025-11-18 09:39:06'),
(42, 'App\\Models\\Transaction', 1, 'created', '[]', '{\"item_id\":1,\"jenis_transaksi\":\"masuk\",\"jumlah\":17,\"tanggal_transaksi\":\"2025-11-04 16:39:06\",\"keterangan\":\"Pengisian ulang inventory\",\"status\":\"aktif\",\"updated_at\":\"2025-11-18 16:39:06\",\"created_at\":\"2025-11-18 16:39:06\",\"id\":1}', NULL, '127.0.0.1', '2025-11-18 09:39:06', '2025-11-18 09:39:06'),
(43, 'App\\Models\\Item', 2, 'updated', '{\"id\":2,\"kode_barang\":\"BRG002\",\"nama_barang\":\"Termometer Infrared\",\"satuan\":\"pcs\",\"stock_awal\":25,\"stock\":25,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18T16:39:04.000000Z\",\"updated_at\":\"2025-11-18T16:39:04.000000Z\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', '{\"id\":2,\"kode_barang\":\"BRG002\",\"nama_barang\":\"Termometer Infrared\",\"satuan\":\"pcs\",\"stock_awal\":25,\"stock\":31,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18 16:39:04\",\"updated_at\":\"2025-11-18 16:39:04\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', NULL, '127.0.0.1', '2025-11-18 09:39:06', '2025-11-18 09:39:06'),
(44, 'App\\Models\\Transaction', 2, 'created', '[]', '{\"item_id\":2,\"jenis_transaksi\":\"masuk\",\"jumlah\":6,\"tanggal_transaksi\":\"2025-11-01 16:39:06\",\"keterangan\":\"Pembelian rutin bulanan\",\"status\":\"aktif\",\"updated_at\":\"2025-11-18 16:39:06\",\"created_at\":\"2025-11-18 16:39:06\",\"id\":2}', NULL, '127.0.0.1', '2025-11-18 09:39:06', '2025-11-18 09:39:06'),
(45, 'App\\Models\\Item', 3, 'updated', '{\"id\":3,\"kode_barang\":\"BRG003\",\"nama_barang\":\"Pulse Oximeter\",\"satuan\":\"pcs\",\"stock_awal\":30,\"stock\":30,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18T16:39:04.000000Z\",\"updated_at\":\"2025-11-18T16:39:04.000000Z\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', '{\"id\":3,\"kode_barang\":\"BRG003\",\"nama_barang\":\"Pulse Oximeter\",\"satuan\":\"pcs\",\"stock_awal\":30,\"stock\":50,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18 16:39:04\",\"updated_at\":\"2025-11-18 16:39:04\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', NULL, '127.0.0.1', '2025-11-18 09:39:06', '2025-11-18 09:39:06'),
(46, 'App\\Models\\Transaction', 3, 'created', '[]', '{\"item_id\":3,\"jenis_transaksi\":\"masuk\",\"jumlah\":20,\"tanggal_transaksi\":\"2025-11-10 16:39:06\",\"keterangan\":\"Pengisian ulang inventory\",\"status\":\"aktif\",\"updated_at\":\"2025-11-18 16:39:06\",\"created_at\":\"2025-11-18 16:39:06\",\"id\":3}', NULL, '127.0.0.1', '2025-11-18 09:39:06', '2025-11-18 09:39:06'),
(47, 'App\\Models\\Item', 4, 'updated', '{\"id\":4,\"kode_barang\":\"BRG004\",\"nama_barang\":\"Nebulizer Portable\",\"satuan\":\"pcs\",\"stock_awal\":12,\"stock\":12,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18T16:39:04.000000Z\",\"updated_at\":\"2025-11-18T16:39:04.000000Z\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', '{\"id\":4,\"kode_barang\":\"BRG004\",\"nama_barang\":\"Nebulizer Portable\",\"satuan\":\"pcs\",\"stock_awal\":12,\"stock\":31,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18 16:39:04\",\"updated_at\":\"2025-11-18 16:39:04\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', NULL, '127.0.0.1', '2025-11-18 09:39:06', '2025-11-18 09:39:06'),
(48, 'App\\Models\\Transaction', 4, 'created', '[]', '{\"item_id\":4,\"jenis_transaksi\":\"masuk\",\"jumlah\":19,\"tanggal_transaksi\":\"2025-11-12 16:39:06\",\"keterangan\":\"Stok tambahan\",\"status\":\"aktif\",\"updated_at\":\"2025-11-18 16:39:06\",\"created_at\":\"2025-11-18 16:39:06\",\"id\":4}', NULL, '127.0.0.1', '2025-11-18 09:39:06', '2025-11-18 09:39:06'),
(49, 'App\\Models\\Item', 5, 'updated', '{\"id\":5,\"kode_barang\":\"BRG005\",\"nama_barang\":\"Glucometer\",\"satuan\":\"pcs\",\"stock_awal\":20,\"stock\":20,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18T16:39:04.000000Z\",\"updated_at\":\"2025-11-18T16:39:04.000000Z\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', '{\"id\":5,\"kode_barang\":\"BRG005\",\"nama_barang\":\"Glucometer\",\"satuan\":\"pcs\",\"stock_awal\":20,\"stock\":26,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18 16:39:04\",\"updated_at\":\"2025-11-18 16:39:04\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', NULL, '127.0.0.1', '2025-11-18 09:39:06', '2025-11-18 09:39:06'),
(50, 'App\\Models\\Transaction', 5, 'created', '[]', '{\"item_id\":5,\"jenis_transaksi\":\"masuk\",\"jumlah\":6,\"tanggal_transaksi\":\"2025-11-07 16:39:06\",\"keterangan\":\"Pembelian rutin bulanan\",\"status\":\"aktif\",\"updated_at\":\"2025-11-18 16:39:06\",\"created_at\":\"2025-11-18 16:39:06\",\"id\":5}', NULL, '127.0.0.1', '2025-11-18 09:39:06', '2025-11-18 09:39:06'),
(51, 'App\\Models\\Item', 5, 'updated', '{\"id\":5,\"kode_barang\":\"BRG005\",\"nama_barang\":\"Glucometer\",\"satuan\":\"pcs\",\"stock_awal\":20,\"stock\":26,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18T16:39:04.000000Z\",\"updated_at\":\"2025-11-18T16:39:06.000000Z\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', '{\"id\":5,\"kode_barang\":\"BRG005\",\"nama_barang\":\"Glucometer\",\"satuan\":\"pcs\",\"stock_awal\":20,\"stock\":25,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18 16:39:04\",\"updated_at\":\"2025-11-18 16:39:06\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', NULL, '127.0.0.1', '2025-11-18 09:39:06', '2025-11-18 09:39:06'),
(52, 'App\\Models\\Transaction', 6, 'created', '[]', '{\"item_id\":5,\"jenis_transaksi\":\"keluar\",\"jumlah\":1,\"tanggal_transaksi\":\"2025-11-17 16:39:06\",\"keterangan\":\"Alokasi departemen\",\"status\":\"aktif\",\"updated_at\":\"2025-11-18 16:39:06\",\"created_at\":\"2025-11-18 16:39:06\",\"id\":6}', NULL, '127.0.0.1', '2025-11-18 09:39:06', '2025-11-18 09:39:06'),
(53, 'App\\Models\\Item', 6, 'updated', '{\"id\":6,\"kode_barang\":\"BRG006\",\"nama_barang\":\"Stetoskop Digital\",\"satuan\":\"pcs\",\"stock_awal\":8,\"stock\":8,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18T16:39:04.000000Z\",\"updated_at\":\"2025-11-18T16:39:04.000000Z\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', '{\"id\":6,\"kode_barang\":\"BRG006\",\"nama_barang\":\"Stetoskop Digital\",\"satuan\":\"pcs\",\"stock_awal\":8,\"stock\":22,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18 16:39:04\",\"updated_at\":\"2025-11-18 16:39:04\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', NULL, '127.0.0.1', '2025-11-18 09:39:06', '2025-11-18 09:39:06'),
(54, 'App\\Models\\Transaction', 7, 'created', '[]', '{\"item_id\":6,\"jenis_transaksi\":\"masuk\",\"jumlah\":14,\"tanggal_transaksi\":\"2025-11-09 16:39:06\",\"keterangan\":\"Restok barang habis\",\"status\":\"aktif\",\"updated_at\":\"2025-11-18 16:39:06\",\"created_at\":\"2025-11-18 16:39:06\",\"id\":7}', NULL, '127.0.0.1', '2025-11-18 09:39:06', '2025-11-18 09:39:06'),
(55, 'App\\Models\\Item', 6, 'updated', '{\"id\":6,\"kode_barang\":\"BRG006\",\"nama_barang\":\"Stetoskop Digital\",\"satuan\":\"pcs\",\"stock_awal\":8,\"stock\":22,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18T16:39:04.000000Z\",\"updated_at\":\"2025-11-18T16:39:06.000000Z\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', '{\"id\":6,\"kode_barang\":\"BRG006\",\"nama_barang\":\"Stetoskop Digital\",\"satuan\":\"pcs\",\"stock_awal\":8,\"stock\":15,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18 16:39:04\",\"updated_at\":\"2025-11-18 16:39:06\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', NULL, '127.0.0.1', '2025-11-18 09:39:06', '2025-11-18 09:39:06'),
(56, 'App\\Models\\Transaction', 8, 'created', '[]', '{\"item_id\":6,\"jenis_transaksi\":\"keluar\",\"jumlah\":7,\"tanggal_transaksi\":\"2025-11-14 16:39:06\",\"keterangan\":\"Alokasi departemen\",\"status\":\"aktif\",\"updated_at\":\"2025-11-18 16:39:06\",\"created_at\":\"2025-11-18 16:39:06\",\"id\":8}', NULL, '127.0.0.1', '2025-11-18 09:39:06', '2025-11-18 09:39:06'),
(57, 'App\\Models\\Item', 7, 'updated', '{\"id\":7,\"kode_barang\":\"BRG007\",\"nama_barang\":\"Defibrilator AED\",\"satuan\":\"pcs\",\"stock_awal\":3,\"stock\":3,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18T16:39:04.000000Z\",\"updated_at\":\"2025-11-18T16:39:04.000000Z\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', '{\"id\":7,\"kode_barang\":\"BRG007\",\"nama_barang\":\"Defibrilator AED\",\"satuan\":\"pcs\",\"stock_awal\":3,\"stock\":17,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18 16:39:04\",\"updated_at\":\"2025-11-18 16:39:04\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', NULL, '127.0.0.1', '2025-11-18 09:39:06', '2025-11-18 09:39:06'),
(58, 'App\\Models\\Transaction', 9, 'created', '[]', '{\"item_id\":7,\"jenis_transaksi\":\"masuk\",\"jumlah\":14,\"tanggal_transaksi\":\"2025-11-05 16:39:06\",\"keterangan\":\"Pembelian bulk\",\"status\":\"aktif\",\"updated_at\":\"2025-11-18 16:39:06\",\"created_at\":\"2025-11-18 16:39:06\",\"id\":9}', NULL, '127.0.0.1', '2025-11-18 09:39:06', '2025-11-18 09:39:06'),
(59, 'App\\Models\\Item', 8, 'updated', '{\"id\":8,\"kode_barang\":\"BRG008\",\"nama_barang\":\"ECG Machine\",\"satuan\":\"pcs\",\"stock_awal\":5,\"stock\":5,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18T16:39:04.000000Z\",\"updated_at\":\"2025-11-18T16:39:04.000000Z\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', '{\"id\":8,\"kode_barang\":\"BRG008\",\"nama_barang\":\"ECG Machine\",\"satuan\":\"pcs\",\"stock_awal\":5,\"stock\":15,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18 16:39:04\",\"updated_at\":\"2025-11-18 16:39:04\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(60, 'App\\Models\\Transaction', 10, 'created', '[]', '{\"item_id\":8,\"jenis_transaksi\":\"masuk\",\"jumlah\":10,\"tanggal_transaksi\":\"2025-11-06 16:39:06\",\"keterangan\":\"Pengisian ulang inventory\",\"status\":\"aktif\",\"updated_at\":\"2025-11-18 16:39:06\",\"created_at\":\"2025-11-18 16:39:06\",\"id\":10}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(61, 'App\\Models\\Item', 9, 'updated', '{\"id\":9,\"kode_barang\":\"BRG009\",\"nama_barang\":\"Infusion Pump\",\"satuan\":\"pcs\",\"stock_awal\":10,\"stock\":10,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18T16:39:04.000000Z\",\"updated_at\":\"2025-11-18T16:39:04.000000Z\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', '{\"id\":9,\"kode_barang\":\"BRG009\",\"nama_barang\":\"Infusion Pump\",\"satuan\":\"pcs\",\"stock_awal\":10,\"stock\":29,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18 16:39:04\",\"updated_at\":\"2025-11-18 16:39:04\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(62, 'App\\Models\\Transaction', 11, 'created', '[]', '{\"item_id\":9,\"jenis_transaksi\":\"masuk\",\"jumlah\":19,\"tanggal_transaksi\":\"2025-11-06 16:39:07\",\"keterangan\":\"Pembelian bulk\",\"status\":\"aktif\",\"updated_at\":\"2025-11-18 16:39:07\",\"created_at\":\"2025-11-18 16:39:07\",\"id\":11}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(63, 'App\\Models\\Item', 9, 'updated', '{\"id\":9,\"kode_barang\":\"BRG009\",\"nama_barang\":\"Infusion Pump\",\"satuan\":\"pcs\",\"stock_awal\":10,\"stock\":29,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18T16:39:04.000000Z\",\"updated_at\":\"2025-11-18T16:39:07.000000Z\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', '{\"id\":9,\"kode_barang\":\"BRG009\",\"nama_barang\":\"Infusion Pump\",\"satuan\":\"pcs\",\"stock_awal\":10,\"stock\":26,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18 16:39:04\",\"updated_at\":\"2025-11-18 16:39:07\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(64, 'App\\Models\\Transaction', 12, 'created', '[]', '{\"item_id\":9,\"jenis_transaksi\":\"keluar\",\"jumlah\":3,\"tanggal_transaksi\":\"2025-11-16 16:39:07\",\"keterangan\":\"Alokasi departemen\",\"status\":\"aktif\",\"updated_at\":\"2025-11-18 16:39:07\",\"created_at\":\"2025-11-18 16:39:07\",\"id\":12}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(65, 'App\\Models\\Item', 10, 'updated', '{\"id\":10,\"kode_barang\":\"BRG010\",\"nama_barang\":\"Suction Unit\",\"satuan\":\"pcs\",\"stock_awal\":7,\"stock\":7,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18T16:39:04.000000Z\",\"updated_at\":\"2025-11-18T16:39:04.000000Z\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', '{\"id\":10,\"kode_barang\":\"BRG010\",\"nama_barang\":\"Suction Unit\",\"satuan\":\"pcs\",\"stock_awal\":7,\"stock\":22,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18 16:39:04\",\"updated_at\":\"2025-11-18 16:39:04\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(66, 'App\\Models\\Transaction', 13, 'created', '[]', '{\"item_id\":10,\"jenis_transaksi\":\"masuk\",\"jumlah\":15,\"tanggal_transaksi\":\"2025-11-02 16:39:07\",\"keterangan\":\"Pembelian bulk\",\"status\":\"aktif\",\"updated_at\":\"2025-11-18 16:39:07\",\"created_at\":\"2025-11-18 16:39:07\",\"id\":13}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(67, 'App\\Models\\Item', 11, 'updated', '{\"id\":11,\"kode_barang\":\"BRG011\",\"nama_barang\":\"Laptop Dell Inspiron\",\"satuan\":\"pcs\",\"stock_awal\":15,\"stock\":15,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18T16:39:04.000000Z\",\"updated_at\":\"2025-11-18T16:39:04.000000Z\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', '{\"id\":11,\"kode_barang\":\"BRG011\",\"nama_barang\":\"Laptop Dell Inspiron\",\"satuan\":\"pcs\",\"stock_awal\":15,\"stock\":29,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18 16:39:04\",\"updated_at\":\"2025-11-18 16:39:04\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(68, 'App\\Models\\Transaction', 14, 'created', '[]', '{\"item_id\":11,\"jenis_transaksi\":\"masuk\",\"jumlah\":14,\"tanggal_transaksi\":\"2025-10-30 16:39:07\",\"keterangan\":\"Pembelian rutin bulanan\",\"status\":\"aktif\",\"updated_at\":\"2025-11-18 16:39:07\",\"created_at\":\"2025-11-18 16:39:07\",\"id\":14}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(69, 'App\\Models\\Item', 11, 'updated', '{\"id\":11,\"kode_barang\":\"BRG011\",\"nama_barang\":\"Laptop Dell Inspiron\",\"satuan\":\"pcs\",\"stock_awal\":15,\"stock\":29,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18T16:39:04.000000Z\",\"updated_at\":\"2025-11-18T16:39:07.000000Z\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', '{\"id\":11,\"kode_barang\":\"BRG011\",\"nama_barang\":\"Laptop Dell Inspiron\",\"satuan\":\"pcs\",\"stock_awal\":15,\"stock\":20,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18 16:39:04\",\"updated_at\":\"2025-11-18 16:39:07\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(70, 'App\\Models\\Transaction', 15, 'created', '[]', '{\"item_id\":11,\"jenis_transaksi\":\"keluar\",\"jumlah\":9,\"tanggal_transaksi\":\"2025-11-15 16:39:07\",\"keterangan\":\"Penggunaan maintenance\",\"status\":\"aktif\",\"updated_at\":\"2025-11-18 16:39:07\",\"created_at\":\"2025-11-18 16:39:07\",\"id\":15}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(71, 'App\\Models\\Item', 12, 'updated', '{\"id\":12,\"kode_barang\":\"BRG012\",\"nama_barang\":\"Tablet Samsung\",\"satuan\":\"pcs\",\"stock_awal\":20,\"stock\":20,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18T16:39:04.000000Z\",\"updated_at\":\"2025-11-18T16:39:04.000000Z\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', '{\"id\":12,\"kode_barang\":\"BRG012\",\"nama_barang\":\"Tablet Samsung\",\"satuan\":\"pcs\",\"stock_awal\":20,\"stock\":35,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18 16:39:04\",\"updated_at\":\"2025-11-18 16:39:04\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(72, 'App\\Models\\Transaction', 16, 'created', '[]', '{\"item_id\":12,\"jenis_transaksi\":\"masuk\",\"jumlah\":15,\"tanggal_transaksi\":\"2025-11-06 16:39:07\",\"keterangan\":\"Pengisian ulang inventory\",\"status\":\"aktif\",\"updated_at\":\"2025-11-18 16:39:07\",\"created_at\":\"2025-11-18 16:39:07\",\"id\":16}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(73, 'App\\Models\\Item', 12, 'updated', '{\"id\":12,\"kode_barang\":\"BRG012\",\"nama_barang\":\"Tablet Samsung\",\"satuan\":\"pcs\",\"stock_awal\":20,\"stock\":35,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18T16:39:04.000000Z\",\"updated_at\":\"2025-11-18T16:39:07.000000Z\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', '{\"id\":12,\"kode_barang\":\"BRG012\",\"nama_barang\":\"Tablet Samsung\",\"satuan\":\"pcs\",\"stock_awal\":20,\"stock\":34,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18 16:39:04\",\"updated_at\":\"2025-11-18 16:39:07\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(74, 'App\\Models\\Transaction', 17, 'created', '[]', '{\"item_id\":12,\"jenis_transaksi\":\"keluar\",\"jumlah\":1,\"tanggal_transaksi\":\"2025-11-16 16:39:07\",\"keterangan\":\"Penggunaan operasional\",\"status\":\"aktif\",\"updated_at\":\"2025-11-18 16:39:07\",\"created_at\":\"2025-11-18 16:39:07\",\"id\":17}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(75, 'App\\Models\\Item', 13, 'updated', '{\"id\":13,\"kode_barang\":\"BRG013\",\"nama_barang\":\"Smartphone iPhone\",\"satuan\":\"pcs\",\"stock_awal\":12,\"stock\":12,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18T16:39:04.000000Z\",\"updated_at\":\"2025-11-18T16:39:04.000000Z\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', '{\"id\":13,\"kode_barang\":\"BRG013\",\"nama_barang\":\"Smartphone iPhone\",\"satuan\":\"pcs\",\"stock_awal\":12,\"stock\":21,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18 16:39:04\",\"updated_at\":\"2025-11-18 16:39:04\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(76, 'App\\Models\\Transaction', 18, 'created', '[]', '{\"item_id\":13,\"jenis_transaksi\":\"masuk\",\"jumlah\":9,\"tanggal_transaksi\":\"2025-11-09 16:39:07\",\"keterangan\":\"Restok mingguan\",\"status\":\"aktif\",\"updated_at\":\"2025-11-18 16:39:07\",\"created_at\":\"2025-11-18 16:39:07\",\"id\":18}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(77, 'App\\Models\\Item', 14, 'updated', '{\"id\":14,\"kode_barang\":\"BRG014\",\"nama_barang\":\"Monitor LED 24 inch\",\"satuan\":\"pcs\",\"stock_awal\":18,\"stock\":18,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18T16:39:04.000000Z\",\"updated_at\":\"2025-11-18T16:39:04.000000Z\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', '{\"id\":14,\"kode_barang\":\"BRG014\",\"nama_barang\":\"Monitor LED 24 inch\",\"satuan\":\"pcs\",\"stock_awal\":18,\"stock\":27,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18 16:39:04\",\"updated_at\":\"2025-11-18 16:39:04\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(78, 'App\\Models\\Transaction', 19, 'created', '[]', '{\"item_id\":14,\"jenis_transaksi\":\"masuk\",\"jumlah\":9,\"tanggal_transaksi\":\"2025-10-29 16:39:07\",\"keterangan\":\"Pengisian ulang inventory\",\"status\":\"aktif\",\"updated_at\":\"2025-11-18 16:39:07\",\"created_at\":\"2025-11-18 16:39:07\",\"id\":19}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(79, 'App\\Models\\Item', 15, 'updated', '{\"id\":15,\"kode_barang\":\"BRG015\",\"nama_barang\":\"Printer Laser\",\"satuan\":\"pcs\",\"stock_awal\":8,\"stock\":8,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18T16:39:04.000000Z\",\"updated_at\":\"2025-11-18T16:39:04.000000Z\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', '{\"id\":15,\"kode_barang\":\"BRG015\",\"nama_barang\":\"Printer Laser\",\"satuan\":\"pcs\",\"stock_awal\":8,\"stock\":19,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18 16:39:04\",\"updated_at\":\"2025-11-18 16:39:04\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(80, 'App\\Models\\Transaction', 20, 'created', '[]', '{\"item_id\":15,\"jenis_transaksi\":\"masuk\",\"jumlah\":11,\"tanggal_transaksi\":\"2025-11-07 16:39:07\",\"keterangan\":\"Pembelian rutin bulanan\",\"status\":\"aktif\",\"updated_at\":\"2025-11-18 16:39:07\",\"created_at\":\"2025-11-18 16:39:07\",\"id\":20}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(81, 'App\\Models\\Item', 16, 'updated', '{\"id\":16,\"kode_barang\":\"BRG016\",\"nama_barang\":\"Projector LCD\",\"satuan\":\"pcs\",\"stock_awal\":6,\"stock\":6,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18T16:39:04.000000Z\",\"updated_at\":\"2025-11-18T16:39:04.000000Z\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', '{\"id\":16,\"kode_barang\":\"BRG016\",\"nama_barang\":\"Projector LCD\",\"satuan\":\"pcs\",\"stock_awal\":6,\"stock\":23,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18 16:39:04\",\"updated_at\":\"2025-11-18 16:39:04\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(82, 'App\\Models\\Transaction', 21, 'created', '[]', '{\"item_id\":16,\"jenis_transaksi\":\"masuk\",\"jumlah\":17,\"tanggal_transaksi\":\"2025-11-10 16:39:07\",\"keterangan\":\"Pembelian rutin bulanan\",\"status\":\"aktif\",\"updated_at\":\"2025-11-18 16:39:07\",\"created_at\":\"2025-11-18 16:39:07\",\"id\":21}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(83, 'App\\Models\\Item', 17, 'updated', '{\"id\":17,\"kode_barang\":\"BRG017\",\"nama_barang\":\"Router WiFi\",\"satuan\":\"pcs\",\"stock_awal\":25,\"stock\":25,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18T16:39:04.000000Z\",\"updated_at\":\"2025-11-18T16:39:04.000000Z\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', '{\"id\":17,\"kode_barang\":\"BRG017\",\"nama_barang\":\"Router WiFi\",\"satuan\":\"pcs\",\"stock_awal\":25,\"stock\":35,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18 16:39:04\",\"updated_at\":\"2025-11-18 16:39:04\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(84, 'App\\Models\\Transaction', 22, 'created', '[]', '{\"item_id\":17,\"jenis_transaksi\":\"masuk\",\"jumlah\":10,\"tanggal_transaksi\":\"2025-10-29 16:39:07\",\"keterangan\":\"Restok mingguan\",\"status\":\"aktif\",\"updated_at\":\"2025-11-18 16:39:07\",\"created_at\":\"2025-11-18 16:39:07\",\"id\":22}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(85, 'App\\Models\\Item', 17, 'updated', '{\"id\":17,\"kode_barang\":\"BRG017\",\"nama_barang\":\"Router WiFi\",\"satuan\":\"pcs\",\"stock_awal\":25,\"stock\":35,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18T16:39:04.000000Z\",\"updated_at\":\"2025-11-18T16:39:07.000000Z\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', '{\"id\":17,\"kode_barang\":\"BRG017\",\"nama_barang\":\"Router WiFi\",\"satuan\":\"pcs\",\"stock_awal\":25,\"stock\":23,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18 16:39:04\",\"updated_at\":\"2025-11-18 16:39:07\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(86, 'App\\Models\\Transaction', 23, 'created', '[]', '{\"item_id\":17,\"jenis_transaksi\":\"keluar\",\"jumlah\":12,\"tanggal_transaksi\":\"2025-11-17 16:39:07\",\"keterangan\":\"Konsumsi rutin\",\"status\":\"aktif\",\"updated_at\":\"2025-11-18 16:39:07\",\"created_at\":\"2025-11-18 16:39:07\",\"id\":23}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(87, 'App\\Models\\Item', 18, 'updated', '{\"id\":18,\"kode_barang\":\"BRG018\",\"nama_barang\":\"UPS 1000VA\",\"satuan\":\"pcs\",\"stock_awal\":10,\"stock\":10,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18T16:39:04.000000Z\",\"updated_at\":\"2025-11-18T16:39:04.000000Z\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', '{\"id\":18,\"kode_barang\":\"BRG018\",\"nama_barang\":\"UPS 1000VA\",\"satuan\":\"pcs\",\"stock_awal\":10,\"stock\":24,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18 16:39:04\",\"updated_at\":\"2025-11-18 16:39:04\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(88, 'App\\Models\\Transaction', 24, 'created', '[]', '{\"item_id\":18,\"jenis_transaksi\":\"masuk\",\"jumlah\":14,\"tanggal_transaksi\":\"2025-11-06 16:39:07\",\"keterangan\":\"Pembelian darurat\",\"status\":\"aktif\",\"updated_at\":\"2025-11-18 16:39:07\",\"created_at\":\"2025-11-18 16:39:07\",\"id\":24}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(89, 'App\\Models\\Item', 18, 'updated', '{\"id\":18,\"kode_barang\":\"BRG018\",\"nama_barang\":\"UPS 1000VA\",\"satuan\":\"pcs\",\"stock_awal\":10,\"stock\":24,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18T16:39:04.000000Z\",\"updated_at\":\"2025-11-18T16:39:07.000000Z\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', '{\"id\":18,\"kode_barang\":\"BRG018\",\"nama_barang\":\"UPS 1000VA\",\"satuan\":\"pcs\",\"stock_awal\":10,\"stock\":21,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18 16:39:04\",\"updated_at\":\"2025-11-18 16:39:07\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(90, 'App\\Models\\Transaction', 25, 'created', '[]', '{\"item_id\":18,\"jenis_transaksi\":\"keluar\",\"jumlah\":3,\"tanggal_transaksi\":\"2025-11-15 16:39:07\",\"keterangan\":\"Penggunaan maintenance\",\"status\":\"aktif\",\"updated_at\":\"2025-11-18 16:39:07\",\"created_at\":\"2025-11-18 16:39:07\",\"id\":25}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(91, 'App\\Models\\Item', 19, 'updated', '{\"id\":19,\"kode_barang\":\"BRG019\",\"nama_barang\":\"Scanner Document\",\"satuan\":\"pcs\",\"stock_awal\":5,\"stock\":5,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18T16:39:04.000000Z\",\"updated_at\":\"2025-11-18T16:39:04.000000Z\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', '{\"id\":19,\"kode_barang\":\"BRG019\",\"nama_barang\":\"Scanner Document\",\"satuan\":\"pcs\",\"stock_awal\":5,\"stock\":13,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18 16:39:04\",\"updated_at\":\"2025-11-18 16:39:04\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(92, 'App\\Models\\Transaction', 26, 'created', '[]', '{\"item_id\":19,\"jenis_transaksi\":\"masuk\",\"jumlah\":8,\"tanggal_transaksi\":\"2025-11-03 16:39:07\",\"keterangan\":\"Pembelian bulk\",\"status\":\"aktif\",\"updated_at\":\"2025-11-18 16:39:07\",\"created_at\":\"2025-11-18 16:39:07\",\"id\":26}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(93, 'App\\Models\\Item', 20, 'updated', '{\"id\":20,\"kode_barang\":\"BRG020\",\"nama_barang\":\"External HDD 1TB\",\"satuan\":\"pcs\",\"stock_awal\":30,\"stock\":30,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18T16:39:04.000000Z\",\"updated_at\":\"2025-11-18T16:39:04.000000Z\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', '{\"id\":20,\"kode_barang\":\"BRG020\",\"nama_barang\":\"External HDD 1TB\",\"satuan\":\"pcs\",\"stock_awal\":30,\"stock\":37,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18 16:39:04\",\"updated_at\":\"2025-11-18 16:39:04\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(94, 'App\\Models\\Transaction', 27, 'created', '[]', '{\"item_id\":20,\"jenis_transaksi\":\"masuk\",\"jumlah\":7,\"tanggal_transaksi\":\"2025-11-09 16:39:07\",\"keterangan\":\"Pembelian darurat\",\"status\":\"aktif\",\"updated_at\":\"2025-11-18 16:39:07\",\"created_at\":\"2025-11-18 16:39:07\",\"id\":27}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(95, 'App\\Models\\Item', 21, 'updated', '{\"id\":21,\"kode_barang\":\"BRG055\",\"nama_barang\":\"Pensil 2B corporis\",\"satuan\":\"box\",\"stock_awal\":61,\"stock\":61,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18T16:39:06.000000Z\",\"updated_at\":\"2025-11-18T16:39:06.000000Z\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', '{\"id\":21,\"kode_barang\":\"BRG055\",\"nama_barang\":\"Pensil 2B corporis\",\"satuan\":\"box\",\"stock_awal\":61,\"stock\":81,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18 16:39:06\",\"updated_at\":\"2025-11-18 16:39:06\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(96, 'App\\Models\\Transaction', 28, 'created', '[]', '{\"item_id\":21,\"jenis_transaksi\":\"masuk\",\"jumlah\":20,\"tanggal_transaksi\":\"2025-10-30 16:39:07\",\"keterangan\":\"Stok tambahan\",\"status\":\"aktif\",\"updated_at\":\"2025-11-18 16:39:07\",\"created_at\":\"2025-11-18 16:39:07\",\"id\":28}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(97, 'App\\Models\\Item', 22, 'updated', '{\"id\":22,\"kode_barang\":\"BRG109\",\"nama_barang\":\"Kertas A4 vel\",\"satuan\":\"pcs\",\"stock_awal\":25,\"stock\":25,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18T16:39:06.000000Z\",\"updated_at\":\"2025-11-18T16:39:06.000000Z\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', '{\"id\":22,\"kode_barang\":\"BRG109\",\"nama_barang\":\"Kertas A4 vel\",\"satuan\":\"pcs\",\"stock_awal\":25,\"stock\":43,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18 16:39:06\",\"updated_at\":\"2025-11-18 16:39:06\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(98, 'App\\Models\\Transaction', 29, 'created', '[]', '{\"item_id\":22,\"jenis_transaksi\":\"masuk\",\"jumlah\":18,\"tanggal_transaksi\":\"2025-11-03 16:39:07\",\"keterangan\":\"Restok mingguan\",\"status\":\"aktif\",\"updated_at\":\"2025-11-18 16:39:07\",\"created_at\":\"2025-11-18 16:39:07\",\"id\":29}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(99, 'App\\Models\\Item', 23, 'updated', '{\"id\":23,\"kode_barang\":\"BRG034\",\"nama_barang\":\"Kalkulator quidem\",\"satuan\":\"pack\",\"stock_awal\":21,\"stock\":21,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18T16:39:06.000000Z\",\"updated_at\":\"2025-11-18T16:39:06.000000Z\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', '{\"id\":23,\"kode_barang\":\"BRG034\",\"nama_barang\":\"Kalkulator quidem\",\"satuan\":\"pack\",\"stock_awal\":21,\"stock\":31,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18 16:39:06\",\"updated_at\":\"2025-11-18 16:39:06\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(100, 'App\\Models\\Transaction', 30, 'created', '[]', '{\"item_id\":23,\"jenis_transaksi\":\"masuk\",\"jumlah\":10,\"tanggal_transaksi\":\"2025-10-29 16:39:07\",\"keterangan\":\"Pembelian darurat\",\"status\":\"aktif\",\"updated_at\":\"2025-11-18 16:39:07\",\"created_at\":\"2025-11-18 16:39:07\",\"id\":30}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(101, 'App\\Models\\Item', 24, 'updated', '{\"id\":24,\"kode_barang\":\"BRG095\",\"nama_barang\":\"Folder Plastik odio\",\"satuan\":\"pack\",\"stock_awal\":50,\"stock\":50,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18T16:39:06.000000Z\",\"updated_at\":\"2025-11-18T16:39:06.000000Z\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', '{\"id\":24,\"kode_barang\":\"BRG095\",\"nama_barang\":\"Folder Plastik odio\",\"satuan\":\"pack\",\"stock_awal\":50,\"stock\":61,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18 16:39:06\",\"updated_at\":\"2025-11-18 16:39:06\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(102, 'App\\Models\\Transaction', 31, 'created', '[]', '{\"item_id\":24,\"jenis_transaksi\":\"masuk\",\"jumlah\":11,\"tanggal_transaksi\":\"2025-11-01 16:39:07\",\"keterangan\":\"Pembelian darurat\",\"status\":\"aktif\",\"updated_at\":\"2025-11-18 16:39:07\",\"created_at\":\"2025-11-18 16:39:07\",\"id\":31}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(103, 'App\\Models\\Item', 25, 'updated', '{\"id\":25,\"kode_barang\":\"BRG047\",\"nama_barang\":\"Tinta Printer rerum\",\"satuan\":\"pack\",\"stock_awal\":50,\"stock\":50,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18T16:39:06.000000Z\",\"updated_at\":\"2025-11-18T16:39:06.000000Z\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', '{\"id\":25,\"kode_barang\":\"BRG047\",\"nama_barang\":\"Tinta Printer rerum\",\"satuan\":\"pack\",\"stock_awal\":50,\"stock\":60,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18 16:39:06\",\"updated_at\":\"2025-11-18 16:39:06\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(104, 'App\\Models\\Transaction', 32, 'created', '[]', '{\"item_id\":25,\"jenis_transaksi\":\"masuk\",\"jumlah\":10,\"tanggal_transaksi\":\"2025-11-06 16:39:07\",\"keterangan\":\"Pembelian darurat\",\"status\":\"aktif\",\"updated_at\":\"2025-11-18 16:39:07\",\"created_at\":\"2025-11-18 16:39:07\",\"id\":32}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(105, 'App\\Models\\Item', 25, 'updated', '{\"id\":25,\"kode_barang\":\"BRG047\",\"nama_barang\":\"Tinta Printer rerum\",\"satuan\":\"pack\",\"stock_awal\":50,\"stock\":60,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18T16:39:06.000000Z\",\"updated_at\":\"2025-11-18T16:39:07.000000Z\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', '{\"id\":25,\"kode_barang\":\"BRG047\",\"nama_barang\":\"Tinta Printer rerum\",\"satuan\":\"pack\",\"stock_awal\":50,\"stock\":58,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18 16:39:06\",\"updated_at\":\"2025-11-18 16:39:07\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07');
INSERT INTO `audit_logs` (`id`, `auditable_type`, `auditable_id`, `event`, `old_values`, `new_values`, `user_id`, `ip_address`, `created_at`, `updated_at`) VALUES
(106, 'App\\Models\\Transaction', 33, 'created', '[]', '{\"item_id\":25,\"jenis_transaksi\":\"keluar\",\"jumlah\":2,\"tanggal_transaksi\":\"2025-11-15 16:39:07\",\"keterangan\":\"Kebutuhan proyek\",\"status\":\"aktif\",\"updated_at\":\"2025-11-18 16:39:07\",\"created_at\":\"2025-11-18 16:39:07\",\"id\":33}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(107, 'App\\Models\\Item', 26, 'updated', '{\"id\":26,\"kode_barang\":\"BRG059\",\"nama_barang\":\"Buku Tulis velit\",\"satuan\":\"box\",\"stock_awal\":14,\"stock\":14,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18T16:39:06.000000Z\",\"updated_at\":\"2025-11-18T16:39:06.000000Z\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', '{\"id\":26,\"kode_barang\":\"BRG059\",\"nama_barang\":\"Buku Tulis velit\",\"satuan\":\"box\",\"stock_awal\":14,\"stock\":30,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18 16:39:06\",\"updated_at\":\"2025-11-18 16:39:06\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(108, 'App\\Models\\Transaction', 34, 'created', '[]', '{\"item_id\":26,\"jenis_transaksi\":\"masuk\",\"jumlah\":16,\"tanggal_transaksi\":\"2025-11-03 16:39:07\",\"keterangan\":\"Pembelian rutin bulanan\",\"status\":\"aktif\",\"updated_at\":\"2025-11-18 16:39:07\",\"created_at\":\"2025-11-18 16:39:07\",\"id\":34}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(109, 'App\\Models\\Item', 27, 'updated', '{\"id\":27,\"kode_barang\":\"BRG080\",\"nama_barang\":\"Correction Pen non\",\"satuan\":\"pcs\",\"stock_awal\":77,\"stock\":77,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18T16:39:06.000000Z\",\"updated_at\":\"2025-11-18T16:39:06.000000Z\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', '{\"id\":27,\"kode_barang\":\"BRG080\",\"nama_barang\":\"Correction Pen non\",\"satuan\":\"pcs\",\"stock_awal\":77,\"stock\":96,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18 16:39:06\",\"updated_at\":\"2025-11-18 16:39:06\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(110, 'App\\Models\\Transaction', 35, 'created', '[]', '{\"item_id\":27,\"jenis_transaksi\":\"masuk\",\"jumlah\":19,\"tanggal_transaksi\":\"2025-11-09 16:39:07\",\"keterangan\":\"Pembelian bulk\",\"status\":\"aktif\",\"updated_at\":\"2025-11-18 16:39:07\",\"created_at\":\"2025-11-18 16:39:07\",\"id\":35}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(111, 'App\\Models\\Item', 28, 'updated', '{\"id\":28,\"kode_barang\":\"BRG085\",\"nama_barang\":\"Sticky Notes mollitia\",\"satuan\":\"dus\",\"stock_awal\":23,\"stock\":23,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18T16:39:06.000000Z\",\"updated_at\":\"2025-11-18T16:39:06.000000Z\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', '{\"id\":28,\"kode_barang\":\"BRG085\",\"nama_barang\":\"Sticky Notes mollitia\",\"satuan\":\"dus\",\"stock_awal\":23,\"stock\":40,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18 16:39:06\",\"updated_at\":\"2025-11-18 16:39:06\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(112, 'App\\Models\\Transaction', 36, 'created', '[]', '{\"item_id\":28,\"jenis_transaksi\":\"masuk\",\"jumlah\":17,\"tanggal_transaksi\":\"2025-11-03 16:39:07\",\"keterangan\":\"Pengadaan dari supplier\",\"status\":\"aktif\",\"updated_at\":\"2025-11-18 16:39:07\",\"created_at\":\"2025-11-18 16:39:07\",\"id\":36}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(113, 'App\\Models\\Item', 29, 'updated', '{\"id\":29,\"kode_barang\":\"BRG067\",\"nama_barang\":\"Folder Plastik natus\",\"satuan\":\"pack\",\"stock_awal\":78,\"stock\":78,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18T16:39:06.000000Z\",\"updated_at\":\"2025-11-18T16:39:06.000000Z\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', '{\"id\":29,\"kode_barang\":\"BRG067\",\"nama_barang\":\"Folder Plastik natus\",\"satuan\":\"pack\",\"stock_awal\":78,\"stock\":89,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18 16:39:06\",\"updated_at\":\"2025-11-18 16:39:06\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(114, 'App\\Models\\Transaction', 37, 'created', '[]', '{\"item_id\":29,\"jenis_transaksi\":\"masuk\",\"jumlah\":11,\"tanggal_transaksi\":\"2025-11-08 16:39:07\",\"keterangan\":\"Restok mingguan\",\"status\":\"aktif\",\"updated_at\":\"2025-11-18 16:39:07\",\"created_at\":\"2025-11-18 16:39:07\",\"id\":37}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(115, 'App\\Models\\Item', 30, 'updated', '{\"id\":30,\"kode_barang\":\"BRG063\",\"nama_barang\":\"Amplop Coklat fugiat\",\"satuan\":\"pack\",\"stock_awal\":87,\"stock\":87,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18T16:39:06.000000Z\",\"updated_at\":\"2025-11-18T16:39:06.000000Z\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', '{\"id\":30,\"kode_barang\":\"BRG063\",\"nama_barang\":\"Amplop Coklat fugiat\",\"satuan\":\"pack\",\"stock_awal\":87,\"stock\":106,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18 16:39:06\",\"updated_at\":\"2025-11-18 16:39:06\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(116, 'App\\Models\\Transaction', 38, 'created', '[]', '{\"item_id\":30,\"jenis_transaksi\":\"masuk\",\"jumlah\":19,\"tanggal_transaksi\":\"2025-11-10 16:39:07\",\"keterangan\":\"Pembelian rutin bulanan\",\"status\":\"aktif\",\"updated_at\":\"2025-11-18 16:39:07\",\"created_at\":\"2025-11-18 16:39:07\",\"id\":38}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(117, 'App\\Models\\Item', 30, 'updated', '{\"id\":30,\"kode_barang\":\"BRG063\",\"nama_barang\":\"Amplop Coklat fugiat\",\"satuan\":\"pack\",\"stock_awal\":87,\"stock\":106,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18T16:39:06.000000Z\",\"updated_at\":\"2025-11-18T16:39:07.000000Z\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', '{\"id\":30,\"kode_barang\":\"BRG063\",\"nama_barang\":\"Amplop Coklat fugiat\",\"satuan\":\"pack\",\"stock_awal\":87,\"stock\":63,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18 16:39:06\",\"updated_at\":\"2025-11-18 16:39:07\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(118, 'App\\Models\\Transaction', 39, 'created', '[]', '{\"item_id\":30,\"jenis_transaksi\":\"keluar\",\"jumlah\":43,\"tanggal_transaksi\":\"2025-11-14 16:39:07\",\"keterangan\":\"Alokasi departemen\",\"status\":\"aktif\",\"updated_at\":\"2025-11-18 16:39:07\",\"created_at\":\"2025-11-18 16:39:07\",\"id\":39}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(119, 'App\\Models\\Item', 31, 'updated', '{\"id\":31,\"kode_barang\":\"BRG101\",\"nama_barang\":\"Klip Kertas consequatur\",\"satuan\":\"rim\",\"stock_awal\":79,\"stock\":79,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18T16:39:06.000000Z\",\"updated_at\":\"2025-11-18T16:39:06.000000Z\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', '{\"id\":31,\"kode_barang\":\"BRG101\",\"nama_barang\":\"Klip Kertas consequatur\",\"satuan\":\"rim\",\"stock_awal\":79,\"stock\":95,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18 16:39:06\",\"updated_at\":\"2025-11-18 16:39:06\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(120, 'App\\Models\\Transaction', 40, 'created', '[]', '{\"item_id\":31,\"jenis_transaksi\":\"masuk\",\"jumlah\":16,\"tanggal_transaksi\":\"2025-11-10 16:39:07\",\"keterangan\":\"Stok tambahan\",\"status\":\"aktif\",\"updated_at\":\"2025-11-18 16:39:07\",\"created_at\":\"2025-11-18 16:39:07\",\"id\":40}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(121, 'App\\Models\\Item', 31, 'updated', '{\"id\":31,\"kode_barang\":\"BRG101\",\"nama_barang\":\"Klip Kertas consequatur\",\"satuan\":\"rim\",\"stock_awal\":79,\"stock\":95,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18T16:39:06.000000Z\",\"updated_at\":\"2025-11-18T16:39:07.000000Z\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', '{\"id\":31,\"kode_barang\":\"BRG101\",\"nama_barang\":\"Klip Kertas consequatur\",\"satuan\":\"rim\",\"stock_awal\":79,\"stock\":87,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18 16:39:06\",\"updated_at\":\"2025-11-18 16:39:07\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(122, 'App\\Models\\Transaction', 41, 'created', '[]', '{\"item_id\":31,\"jenis_transaksi\":\"keluar\",\"jumlah\":8,\"tanggal_transaksi\":\"2025-11-16 16:39:07\",\"keterangan\":\"Distribusi ke cabang\",\"status\":\"aktif\",\"updated_at\":\"2025-11-18 16:39:07\",\"created_at\":\"2025-11-18 16:39:07\",\"id\":41}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(123, 'App\\Models\\Item', 32, 'updated', '{\"id\":32,\"kode_barang\":\"BRG064\",\"nama_barang\":\"Kertas A4 reiciendis\",\"satuan\":\"rim\",\"stock_awal\":71,\"stock\":71,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18T16:39:06.000000Z\",\"updated_at\":\"2025-11-18T16:39:06.000000Z\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', '{\"id\":32,\"kode_barang\":\"BRG064\",\"nama_barang\":\"Kertas A4 reiciendis\",\"satuan\":\"rim\",\"stock_awal\":71,\"stock\":76,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18 16:39:06\",\"updated_at\":\"2025-11-18 16:39:06\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(124, 'App\\Models\\Transaction', 42, 'created', '[]', '{\"item_id\":32,\"jenis_transaksi\":\"masuk\",\"jumlah\":5,\"tanggal_transaksi\":\"2025-11-04 16:39:07\",\"keterangan\":\"Pembelian rutin bulanan\",\"status\":\"aktif\",\"updated_at\":\"2025-11-18 16:39:07\",\"created_at\":\"2025-11-18 16:39:07\",\"id\":42}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(125, 'App\\Models\\Item', 32, 'updated', '{\"id\":32,\"kode_barang\":\"BRG064\",\"nama_barang\":\"Kertas A4 reiciendis\",\"satuan\":\"rim\",\"stock_awal\":71,\"stock\":76,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18T16:39:06.000000Z\",\"updated_at\":\"2025-11-18T16:39:07.000000Z\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', '{\"id\":32,\"kode_barang\":\"BRG064\",\"nama_barang\":\"Kertas A4 reiciendis\",\"satuan\":\"rim\",\"stock_awal\":71,\"stock\":44,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18 16:39:06\",\"updated_at\":\"2025-11-18 16:39:07\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(126, 'App\\Models\\Transaction', 43, 'created', '[]', '{\"item_id\":32,\"jenis_transaksi\":\"keluar\",\"jumlah\":32,\"tanggal_transaksi\":\"2025-11-17 16:39:07\",\"keterangan\":\"Pemakaian darurat\",\"status\":\"aktif\",\"updated_at\":\"2025-11-18 16:39:07\",\"created_at\":\"2025-11-18 16:39:07\",\"id\":43}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(127, 'App\\Models\\Item', 33, 'updated', '{\"id\":33,\"kode_barang\":\"BRG050\",\"nama_barang\":\"Stapler Kecil fuga\",\"satuan\":\"rim\",\"stock_awal\":63,\"stock\":63,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18T16:39:06.000000Z\",\"updated_at\":\"2025-11-18T16:39:06.000000Z\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', '{\"id\":33,\"kode_barang\":\"BRG050\",\"nama_barang\":\"Stapler Kecil fuga\",\"satuan\":\"rim\",\"stock_awal\":63,\"stock\":83,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18 16:39:06\",\"updated_at\":\"2025-11-18 16:39:06\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(128, 'App\\Models\\Transaction', 44, 'created', '[]', '{\"item_id\":33,\"jenis_transaksi\":\"masuk\",\"jumlah\":20,\"tanggal_transaksi\":\"2025-11-09 16:39:07\",\"keterangan\":\"Pengadaan dari supplier\",\"status\":\"aktif\",\"updated_at\":\"2025-11-18 16:39:07\",\"created_at\":\"2025-11-18 16:39:07\",\"id\":44}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(129, 'App\\Models\\Item', 34, 'updated', '{\"id\":34,\"kode_barang\":\"BRG092\",\"nama_barang\":\"Highlighter iste\",\"satuan\":\"rim\",\"stock_awal\":51,\"stock\":51,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18T16:39:06.000000Z\",\"updated_at\":\"2025-11-18T16:39:06.000000Z\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', '{\"id\":34,\"kode_barang\":\"BRG092\",\"nama_barang\":\"Highlighter iste\",\"satuan\":\"rim\",\"stock_awal\":51,\"stock\":65,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18 16:39:06\",\"updated_at\":\"2025-11-18 16:39:06\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(130, 'App\\Models\\Transaction', 45, 'created', '[]', '{\"item_id\":34,\"jenis_transaksi\":\"masuk\",\"jumlah\":14,\"tanggal_transaksi\":\"2025-11-07 16:39:07\",\"keterangan\":\"Pengisian ulang inventory\",\"status\":\"aktif\",\"updated_at\":\"2025-11-18 16:39:07\",\"created_at\":\"2025-11-18 16:39:07\",\"id\":45}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(131, 'App\\Models\\Item', 35, 'updated', '{\"id\":35,\"kode_barang\":\"BRG081\",\"nama_barang\":\"Kalkulator et\",\"satuan\":\"dus\",\"stock_awal\":61,\"stock\":61,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18T16:39:06.000000Z\",\"updated_at\":\"2025-11-18T16:39:06.000000Z\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', '{\"id\":35,\"kode_barang\":\"BRG081\",\"nama_barang\":\"Kalkulator et\",\"satuan\":\"dus\",\"stock_awal\":61,\"stock\":66,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18 16:39:06\",\"updated_at\":\"2025-11-18 16:39:06\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(132, 'App\\Models\\Transaction', 46, 'created', '[]', '{\"item_id\":35,\"jenis_transaksi\":\"masuk\",\"jumlah\":5,\"tanggal_transaksi\":\"2025-10-29 16:39:07\",\"keterangan\":\"Restok mingguan\",\"status\":\"aktif\",\"updated_at\":\"2025-11-18 16:39:07\",\"created_at\":\"2025-11-18 16:39:07\",\"id\":46}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(133, 'App\\Models\\Item', 35, 'updated', '{\"id\":35,\"kode_barang\":\"BRG081\",\"nama_barang\":\"Kalkulator et\",\"satuan\":\"dus\",\"stock_awal\":61,\"stock\":66,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18T16:39:06.000000Z\",\"updated_at\":\"2025-11-18T16:39:07.000000Z\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', '{\"id\":35,\"kode_barang\":\"BRG081\",\"nama_barang\":\"Kalkulator et\",\"satuan\":\"dus\",\"stock_awal\":61,\"stock\":31,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18 16:39:06\",\"updated_at\":\"2025-11-18 16:39:07\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(134, 'App\\Models\\Transaction', 47, 'created', '[]', '{\"item_id\":35,\"jenis_transaksi\":\"keluar\",\"jumlah\":35,\"tanggal_transaksi\":\"2025-11-15 16:39:07\",\"keterangan\":\"Pemakaian harian\",\"status\":\"aktif\",\"updated_at\":\"2025-11-18 16:39:07\",\"created_at\":\"2025-11-18 16:39:07\",\"id\":47}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(135, 'App\\Models\\Item', 36, 'updated', '{\"id\":36,\"kode_barang\":\"BRG114\",\"nama_barang\":\"Pulpen Biru sequi\",\"satuan\":\"box\",\"stock_awal\":58,\"stock\":58,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18T16:39:06.000000Z\",\"updated_at\":\"2025-11-18T16:39:06.000000Z\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', '{\"id\":36,\"kode_barang\":\"BRG114\",\"nama_barang\":\"Pulpen Biru sequi\",\"satuan\":\"box\",\"stock_awal\":58,\"stock\":63,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18 16:39:06\",\"updated_at\":\"2025-11-18 16:39:06\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(136, 'App\\Models\\Transaction', 48, 'created', '[]', '{\"item_id\":36,\"jenis_transaksi\":\"masuk\",\"jumlah\":5,\"tanggal_transaksi\":\"2025-10-29 16:39:07\",\"keterangan\":\"Pembelian rutin bulanan\",\"status\":\"aktif\",\"updated_at\":\"2025-11-18 16:39:07\",\"created_at\":\"2025-11-18 16:39:07\",\"id\":48}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(137, 'App\\Models\\Item', 37, 'updated', '{\"id\":37,\"kode_barang\":\"BRG078\",\"nama_barang\":\"Amplop Coklat quos\",\"satuan\":\"pack\",\"stock_awal\":19,\"stock\":19,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18T16:39:06.000000Z\",\"updated_at\":\"2025-11-18T16:39:06.000000Z\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', '{\"id\":37,\"kode_barang\":\"BRG078\",\"nama_barang\":\"Amplop Coklat quos\",\"satuan\":\"pack\",\"stock_awal\":19,\"stock\":39,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18 16:39:06\",\"updated_at\":\"2025-11-18 16:39:06\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(138, 'App\\Models\\Transaction', 49, 'created', '[]', '{\"item_id\":37,\"jenis_transaksi\":\"masuk\",\"jumlah\":20,\"tanggal_transaksi\":\"2025-11-11 16:39:07\",\"keterangan\":\"Restok barang habis\",\"status\":\"aktif\",\"updated_at\":\"2025-11-18 16:39:07\",\"created_at\":\"2025-11-18 16:39:07\",\"id\":49}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(139, 'App\\Models\\Item', 38, 'updated', '{\"id\":38,\"kode_barang\":\"BRG054\",\"nama_barang\":\"Kalkulator quae\",\"satuan\":\"pack\",\"stock_awal\":31,\"stock\":31,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18T16:39:06.000000Z\",\"updated_at\":\"2025-11-18T16:39:06.000000Z\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', '{\"id\":38,\"kode_barang\":\"BRG054\",\"nama_barang\":\"Kalkulator quae\",\"satuan\":\"pack\",\"stock_awal\":31,\"stock\":36,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18 16:39:06\",\"updated_at\":\"2025-11-18 16:39:06\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(140, 'App\\Models\\Transaction', 50, 'created', '[]', '{\"item_id\":38,\"jenis_transaksi\":\"masuk\",\"jumlah\":5,\"tanggal_transaksi\":\"2025-11-01 16:39:07\",\"keterangan\":\"Restok mingguan\",\"status\":\"aktif\",\"updated_at\":\"2025-11-18 16:39:07\",\"created_at\":\"2025-11-18 16:39:07\",\"id\":50}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(141, 'App\\Models\\Item', 39, 'updated', '{\"id\":39,\"kode_barang\":\"BRG089\",\"nama_barang\":\"Amplop Coklat nulla\",\"satuan\":\"pcs\",\"stock_awal\":72,\"stock\":72,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18T16:39:06.000000Z\",\"updated_at\":\"2025-11-18T16:39:06.000000Z\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', '{\"id\":39,\"kode_barang\":\"BRG089\",\"nama_barang\":\"Amplop Coklat nulla\",\"satuan\":\"pcs\",\"stock_awal\":72,\"stock\":78,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18 16:39:06\",\"updated_at\":\"2025-11-18 16:39:06\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(142, 'App\\Models\\Transaction', 51, 'created', '[]', '{\"item_id\":39,\"jenis_transaksi\":\"masuk\",\"jumlah\":6,\"tanggal_transaksi\":\"2025-10-30 16:39:07\",\"keterangan\":\"Pengadaan dari supplier\",\"status\":\"aktif\",\"updated_at\":\"2025-11-18 16:39:07\",\"created_at\":\"2025-11-18 16:39:07\",\"id\":51}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(143, 'App\\Models\\Item', 39, 'updated', '{\"id\":39,\"kode_barang\":\"BRG089\",\"nama_barang\":\"Amplop Coklat nulla\",\"satuan\":\"pcs\",\"stock_awal\":72,\"stock\":78,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18T16:39:06.000000Z\",\"updated_at\":\"2025-11-18T16:39:07.000000Z\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', '{\"id\":39,\"kode_barang\":\"BRG089\",\"nama_barang\":\"Amplop Coklat nulla\",\"satuan\":\"pcs\",\"stock_awal\":72,\"stock\":27,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18 16:39:06\",\"updated_at\":\"2025-11-18 16:39:07\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(144, 'App\\Models\\Transaction', 52, 'created', '[]', '{\"item_id\":39,\"jenis_transaksi\":\"keluar\",\"jumlah\":51,\"tanggal_transaksi\":\"2025-11-16 16:39:07\",\"keterangan\":\"Alokasi departemen\",\"status\":\"aktif\",\"updated_at\":\"2025-11-18 16:39:07\",\"created_at\":\"2025-11-18 16:39:07\",\"id\":52}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(145, 'App\\Models\\Item', 40, 'updated', '{\"id\":40,\"kode_barang\":\"BRG119\",\"nama_barang\":\"Kertas A4 ducimus\",\"satuan\":\"pack\",\"stock_awal\":44,\"stock\":44,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18T16:39:06.000000Z\",\"updated_at\":\"2025-11-18T16:39:06.000000Z\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', '{\"id\":40,\"kode_barang\":\"BRG119\",\"nama_barang\":\"Kertas A4 ducimus\",\"satuan\":\"pack\",\"stock_awal\":44,\"stock\":61,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18 16:39:06\",\"updated_at\":\"2025-11-18 16:39:06\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(146, 'App\\Models\\Transaction', 53, 'created', '[]', '{\"item_id\":40,\"jenis_transaksi\":\"masuk\",\"jumlah\":17,\"tanggal_transaksi\":\"2025-11-05 16:39:07\",\"keterangan\":\"Pembelian rutin bulanan\",\"status\":\"aktif\",\"updated_at\":\"2025-11-18 16:39:07\",\"created_at\":\"2025-11-18 16:39:07\",\"id\":53}', NULL, '127.0.0.1', '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(147, 'App\\Models\\Item', 39, 'updated', '{\"id\":39,\"kode_barang\":\"BRG089\",\"nama_barang\":\"Amplop Coklat nulla\",\"satuan\":\"pcs\",\"stock_awal\":72,\"stock\":27,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18T16:39:06.000000Z\",\"updated_at\":\"2025-11-18T16:39:07.000000Z\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', '{\"id\":39,\"kode_barang\":\"BRG089\",\"nama_barang\":\"Amplop Coklat nulla\",\"satuan\":\"pcs\",\"stock_awal\":72,\"stock\":2,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18 16:39:06\",\"updated_at\":\"2025-11-18 16:39:07\",\"deleted_at\":null,\"updated_by\":1,\"deleted_by\":null}', '1', '127.0.0.1', '2025-11-18 19:12:05', '2025-11-18 19:12:05'),
(148, 'App\\Models\\Transaction', 54, 'created', '[]', '{\"item_id\":39,\"jenis_transaksi\":\"keluar\",\"tanggal_transaksi\":\"2025-11-19 00:00:00\",\"jumlah\":25,\"keterangan\":\"Beli di toko sebelah\",\"status\":\"aktif\",\"updated_at\":\"2025-11-19 02:12:05\",\"created_at\":\"2025-11-19 02:12:05\",\"id\":54}', '1', '127.0.0.1', '2025-11-18 19:12:05', '2025-11-18 19:12:05'),
(149, 'App\\Models\\Item', 14, 'updated', '{\"id\":14,\"kode_barang\":\"BRG014\",\"nama_barang\":\"Monitor LED 24 inch\",\"satuan\":\"pcs\",\"stock_awal\":18,\"stock\":27,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18T16:39:04.000000Z\",\"updated_at\":\"2025-11-18T16:39:07.000000Z\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', '{\"id\":14,\"kode_barang\":\"BRG014\",\"nama_barang\":\"Monitor LED 24 inch\",\"satuan\":\"pcs\",\"stock_awal\":18,\"stock\":0,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18 16:39:04\",\"updated_at\":\"2025-11-18 16:39:07\",\"deleted_at\":null,\"updated_by\":1,\"deleted_by\":null}', '1', '127.0.0.1', '2025-11-18 19:12:36', '2025-11-18 19:12:36'),
(150, 'App\\Models\\Transaction', 55, 'created', '[]', '{\"item_id\":14,\"jenis_transaksi\":\"keluar\",\"tanggal_transaksi\":\"2025-11-19 00:00:00\",\"jumlah\":27,\"keterangan\":\"Keluar ke toko sebelah\",\"status\":\"aktif\",\"updated_at\":\"2025-11-19 02:12:36\",\"created_at\":\"2025-11-19 02:12:36\",\"id\":55}', '1', '127.0.0.1', '2025-11-18 19:12:36', '2025-11-18 19:12:36'),
(151, 'App\\Models\\Item', 39, 'updated', '{\"id\":39,\"kode_barang\":\"BRG089\",\"nama_barang\":\"Amplop Coklat nulla\",\"satuan\":\"pcs\",\"stock_awal\":72,\"stock\":2,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18T16:39:06.000000Z\",\"updated_at\":\"2025-11-19T02:12:05.000000Z\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', '{\"id\":39,\"kode_barang\":\"BRG089\",\"nama_barang\":\"Amplop Coklat nulla\",\"satuan\":\"pcs\",\"stock_awal\":72,\"stock\":14,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18 16:39:06\",\"updated_at\":\"2025-11-19 02:12:05\",\"deleted_at\":null,\"updated_by\":1,\"deleted_by\":null}', '1', '127.0.0.1', '2025-11-18 19:14:43', '2025-11-18 19:14:43'),
(152, 'App\\Models\\Transaction', 56, 'created', '[]', '{\"item_id\":39,\"jenis_transaksi\":\"masuk\",\"tanggal_transaksi\":\"2025-11-19 00:00:00\",\"jumlah\":12,\"keterangan\":\"Stok tambahan\",\"status\":\"aktif\",\"updated_at\":\"2025-11-19 02:14:43\",\"created_at\":\"2025-11-19 02:14:43\",\"id\":56}', '1', '127.0.0.1', '2025-11-18 19:14:43', '2025-11-18 19:14:43'),
(153, 'App\\Models\\Item', 39, 'updated', '{\"id\":39,\"kode_barang\":\"BRG089\",\"nama_barang\":\"Amplop Coklat nulla\",\"satuan\":\"pcs\",\"stock_awal\":72,\"stock\":14,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18T16:39:06.000000Z\",\"updated_at\":\"2025-11-19T02:14:43.000000Z\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', '{\"id\":39,\"kode_barang\":\"BRG089\",\"nama_barang\":\"Amplop Coklat nulla\",\"satuan\":\"pcs\",\"stock_awal\":72,\"stock\":2,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18 16:39:06\",\"updated_at\":\"2025-11-19 02:14:43\",\"deleted_at\":null,\"updated_by\":1,\"deleted_by\":null}', '1', '127.0.0.1', '2025-11-18 19:14:53', '2025-11-18 19:14:53'),
(154, 'App\\Models\\Transaction', 56, 'updated', '{\"id\":56,\"item_id\":39,\"jenis_transaksi\":\"masuk\",\"tanggal_transaksi\":\"2025-11-19T00:00:00.000000Z\",\"jumlah\":12,\"keterangan\":\"Stok tambahan\",\"status\":\"aktif\",\"canceled_at\":null,\"canceled_by\":null,\"restored_at\":null,\"restored_by\":null,\"lock_version\":0,\"created_at\":\"2025-11-19T02:14:43.000000Z\",\"updated_at\":\"2025-11-19T02:14:43.000000Z\"}', '{\"id\":56,\"item_id\":39,\"jenis_transaksi\":\"masuk\",\"tanggal_transaksi\":\"2025-11-19\",\"jumlah\":12,\"keterangan\":\"Stok tambahan\",\"status\":\"dibatalkan\",\"canceled_at\":\"2025-11-19 02:14:53\",\"canceled_by\":1,\"restored_at\":null,\"restored_by\":null,\"lock_version\":0,\"created_at\":\"2025-11-19 02:14:43\",\"updated_at\":\"2025-11-19 02:14:53\"}', '1', '127.0.0.1', '2025-11-18 19:14:53', '2025-11-18 19:14:53'),
(155, 'App\\Models\\Item', 39, 'updated', '{\"id\":39,\"kode_barang\":\"BRG089\",\"nama_barang\":\"Amplop Coklat nulla\",\"satuan\":\"pcs\",\"stock_awal\":72,\"stock\":2,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18T16:39:06.000000Z\",\"updated_at\":\"2025-11-19T02:14:53.000000Z\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', '{\"id\":39,\"kode_barang\":\"BRG089\",\"nama_barang\":\"Amplop Coklat nulla\",\"satuan\":\"pcs\",\"stock_awal\":72,\"stock\":14,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18 16:39:06\",\"updated_at\":\"2025-11-19 02:14:53\",\"deleted_at\":null,\"updated_by\":1,\"deleted_by\":null}', '1', '127.0.0.1', '2025-11-18 19:15:11', '2025-11-18 19:15:11'),
(156, 'App\\Models\\Item', 39, 'updated', '{\"id\":39,\"kode_barang\":\"BRG089\",\"nama_barang\":\"Amplop Coklat nulla\",\"satuan\":\"pcs\",\"stock_awal\":72,\"stock\":14,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18T16:39:06.000000Z\",\"updated_at\":\"2025-11-19T02:14:53.000000Z\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', '{\"id\":39,\"kode_barang\":\"BRG089\",\"nama_barang\":\"Amplop Coklat nulla\",\"satuan\":\"pcs\",\"stock_awal\":72,\"stock\":26,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18 16:39:06\",\"updated_at\":\"2025-11-19 02:14:53\",\"deleted_at\":null,\"updated_by\":1,\"deleted_by\":null}', '1', '127.0.0.1', '2025-11-18 19:15:11', '2025-11-18 19:15:11'),
(157, 'App\\Models\\Transaction', 56, 'updated', '{\"id\":56,\"item_id\":39,\"jenis_transaksi\":\"masuk\",\"tanggal_transaksi\":\"2025-11-19T00:00:00.000000Z\",\"jumlah\":12,\"keterangan\":\"Stok tambahan\",\"status\":\"dibatalkan\",\"canceled_at\":\"2025-11-19T02:14:53.000000Z\",\"canceled_by\":1,\"restored_at\":null,\"restored_by\":null,\"lock_version\":0,\"created_at\":\"2025-11-19T02:14:43.000000Z\",\"updated_at\":\"2025-11-19T02:14:53.000000Z\"}', '{\"id\":56,\"item_id\":39,\"jenis_transaksi\":\"masuk\",\"tanggal_transaksi\":\"2025-11-19\",\"jumlah\":12,\"keterangan\":\"Stok tambahan\",\"status\":\"restored\",\"canceled_at\":\"2025-11-19 02:14:53\",\"canceled_by\":1,\"restored_at\":\"2025-11-19 02:15:11\",\"restored_by\":1,\"lock_version\":0,\"created_at\":\"2025-11-19 02:14:43\",\"updated_at\":\"2025-11-19 02:15:11\"}', '1', '127.0.0.1', '2025-11-18 19:15:11', '2025-11-18 19:15:11'),
(158, 'App\\Models\\Item', 16, 'updated', '{\"id\":16,\"kode_barang\":\"BRG016\",\"nama_barang\":\"Projector LCD\",\"satuan\":\"pcs\",\"stock_awal\":6,\"stock\":23,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18T16:39:04.000000Z\",\"updated_at\":\"2025-11-18T16:39:07.000000Z\",\"deleted_at\":null,\"updated_by\":null,\"deleted_by\":null}', '{\"id\":16,\"kode_barang\":\"BRG016\",\"nama_barang\":\"Projector LCD\",\"satuan\":\"pcs\",\"stock_awal\":6,\"stock\":6,\"lock_version\":0,\"created_by\":null,\"created_at\":\"2025-11-18 16:39:04\",\"updated_at\":\"2025-11-18 16:39:07\",\"deleted_at\":null,\"updated_by\":1,\"deleted_by\":null}', '1', '127.0.0.1', '2025-11-18 19:17:50', '2025-11-18 19:17:50'),
(159, 'App\\Models\\Transaction', 57, 'created', '[]', '{\"item_id\":16,\"jenis_transaksi\":\"keluar\",\"tanggal_transaksi\":\"2025-11-19 00:00:00\",\"jumlah\":17,\"keterangan\":\"Distribusi ke cabang\",\"status\":\"aktif\",\"updated_at\":\"2025-11-19 02:17:50\",\"created_at\":\"2025-11-19 02:17:50\",\"id\":57}', '1', '127.0.0.1', '2025-11-18 19:17:50', '2025-11-18 19:17:50');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_barang` varchar(255) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `satuan` varchar(255) NOT NULL,
  `stock_awal` int(11) NOT NULL DEFAULT 0,
  `stock` int(11) NOT NULL DEFAULT 0,
  `lock_version` int(11) NOT NULL DEFAULT 0,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `kode_barang`, `nama_barang`, `satuan`, `stock_awal`, `stock`, `lock_version`, `created_by`, `created_at`, `updated_at`, `deleted_at`, `updated_by`, `deleted_by`) VALUES
(1, 'BRG001', 'Tensimeter Digital', 'pcs', 15, 32, 0, NULL, '2025-11-18 09:39:03', '2025-11-18 09:39:06', NULL, NULL, NULL),
(2, 'BRG002', 'Termometer Infrared', 'pcs', 25, 31, 0, NULL, '2025-11-18 09:39:04', '2025-11-18 09:39:06', NULL, NULL, NULL),
(3, 'BRG003', 'Pulse Oximeter', 'pcs', 30, 50, 0, NULL, '2025-11-18 09:39:04', '2025-11-18 09:39:06', NULL, NULL, NULL),
(4, 'BRG004', 'Nebulizer Portable', 'pcs', 12, 31, 0, NULL, '2025-11-18 09:39:04', '2025-11-18 09:39:06', NULL, NULL, NULL),
(5, 'BRG005', 'Glucometer', 'pcs', 20, 25, 0, NULL, '2025-11-18 09:39:04', '2025-11-18 09:39:06', NULL, NULL, NULL),
(6, 'BRG006', 'Stetoskop Digital', 'pcs', 8, 15, 0, NULL, '2025-11-18 09:39:04', '2025-11-18 09:39:06', NULL, NULL, NULL),
(7, 'BRG007', 'Defibrilator AED', 'pcs', 3, 17, 0, NULL, '2025-11-18 09:39:04', '2025-11-18 09:39:06', NULL, NULL, NULL),
(8, 'BRG008', 'ECG Machine', 'pcs', 5, 15, 0, NULL, '2025-11-18 09:39:04', '2025-11-18 09:39:07', NULL, NULL, NULL),
(9, 'BRG009', 'Infusion Pump', 'pcs', 10, 26, 0, NULL, '2025-11-18 09:39:04', '2025-11-18 09:39:07', NULL, NULL, NULL),
(10, 'BRG010', 'Suction Unit', 'pcs', 7, 22, 0, NULL, '2025-11-18 09:39:04', '2025-11-18 09:39:07', NULL, NULL, NULL),
(11, 'BRG011', 'Laptop Dell Inspiron', 'pcs', 15, 20, 0, NULL, '2025-11-18 09:39:04', '2025-11-18 09:39:07', NULL, NULL, NULL),
(12, 'BRG012', 'Tablet Samsung', 'pcs', 20, 34, 0, NULL, '2025-11-18 09:39:04', '2025-11-18 09:39:07', NULL, NULL, NULL),
(13, 'BRG013', 'Smartphone iPhone', 'pcs', 12, 21, 0, NULL, '2025-11-18 09:39:04', '2025-11-18 09:39:07', NULL, NULL, NULL),
(14, 'BRG014', 'Monitor LED 24 inch', 'pcs', 18, 0, 0, NULL, '2025-11-18 09:39:04', '2025-11-18 19:12:36', NULL, NULL, NULL),
(15, 'BRG015', 'Printer Laser', 'pcs', 8, 19, 0, NULL, '2025-11-18 09:39:04', '2025-11-18 09:39:07', NULL, NULL, NULL),
(16, 'BRG016', 'Projector LCD', 'pcs', 6, 6, 0, NULL, '2025-11-18 09:39:04', '2025-11-18 19:17:50', NULL, NULL, NULL),
(17, 'BRG017', 'Router WiFi', 'pcs', 25, 23, 0, NULL, '2025-11-18 09:39:04', '2025-11-18 09:39:07', NULL, NULL, NULL),
(18, 'BRG018', 'UPS 1000VA', 'pcs', 10, 21, 0, NULL, '2025-11-18 09:39:04', '2025-11-18 09:39:07', NULL, NULL, NULL),
(19, 'BRG019', 'Scanner Document', 'pcs', 5, 13, 0, NULL, '2025-11-18 09:39:04', '2025-11-18 09:39:07', NULL, NULL, NULL),
(20, 'BRG020', 'External HDD 1TB', 'pcs', 30, 37, 0, NULL, '2025-11-18 09:39:04', '2025-11-18 09:39:07', NULL, NULL, NULL),
(21, 'BRG055', 'Pensil 2B corporis', 'box', 61, 81, 0, NULL, '2025-11-18 09:39:06', '2025-11-18 09:39:07', NULL, NULL, NULL),
(22, 'BRG109', 'Kertas A4 vel', 'pcs', 25, 43, 0, NULL, '2025-11-18 09:39:06', '2025-11-18 09:39:07', NULL, NULL, NULL),
(23, 'BRG034', 'Kalkulator quidem', 'pack', 21, 31, 0, NULL, '2025-11-18 09:39:06', '2025-11-18 09:39:07', NULL, NULL, NULL),
(24, 'BRG095', 'Folder Plastik odio', 'pack', 50, 61, 0, NULL, '2025-11-18 09:39:06', '2025-11-18 09:39:07', NULL, NULL, NULL),
(25, 'BRG047', 'Tinta Printer rerum', 'pack', 50, 58, 0, NULL, '2025-11-18 09:39:06', '2025-11-18 09:39:07', NULL, NULL, NULL),
(26, 'BRG059', 'Buku Tulis velit', 'box', 14, 30, 0, NULL, '2025-11-18 09:39:06', '2025-11-18 09:39:07', NULL, NULL, NULL),
(27, 'BRG080', 'Correction Pen non', 'pcs', 77, 96, 0, NULL, '2025-11-18 09:39:06', '2025-11-18 09:39:07', NULL, NULL, NULL),
(28, 'BRG085', 'Sticky Notes mollitia', 'dus', 23, 40, 0, NULL, '2025-11-18 09:39:06', '2025-11-18 09:39:07', NULL, NULL, NULL),
(29, 'BRG067', 'Folder Plastik natus', 'pack', 78, 89, 0, NULL, '2025-11-18 09:39:06', '2025-11-18 09:39:07', NULL, NULL, NULL),
(30, 'BRG063', 'Amplop Coklat fugiat', 'pack', 87, 63, 0, NULL, '2025-11-18 09:39:06', '2025-11-18 09:39:07', NULL, NULL, NULL),
(31, 'BRG101', 'Klip Kertas consequatur', 'rim', 79, 87, 0, NULL, '2025-11-18 09:39:06', '2025-11-18 09:39:07', NULL, NULL, NULL),
(32, 'BRG064', 'Kertas A4 reiciendis', 'rim', 71, 44, 0, NULL, '2025-11-18 09:39:06', '2025-11-18 09:39:07', NULL, NULL, NULL),
(33, 'BRG050', 'Stapler Kecil fuga', 'rim', 63, 83, 0, NULL, '2025-11-18 09:39:06', '2025-11-18 09:39:07', NULL, NULL, NULL),
(34, 'BRG092', 'Highlighter iste', 'rim', 51, 65, 0, NULL, '2025-11-18 09:39:06', '2025-11-18 09:39:07', NULL, NULL, NULL),
(35, 'BRG081', 'Kalkulator et', 'dus', 61, 31, 0, NULL, '2025-11-18 09:39:06', '2025-11-18 09:39:07', NULL, NULL, NULL),
(36, 'BRG114', 'Pulpen Biru sequi', 'box', 58, 63, 0, NULL, '2025-11-18 09:39:06', '2025-11-18 09:39:07', NULL, NULL, NULL),
(37, 'BRG078', 'Amplop Coklat quos', 'pack', 19, 39, 0, NULL, '2025-11-18 09:39:06', '2025-11-18 09:39:07', NULL, NULL, NULL),
(38, 'BRG054', 'Kalkulator quae', 'pack', 31, 36, 0, NULL, '2025-11-18 09:39:06', '2025-11-18 09:39:07', NULL, NULL, NULL),
(39, 'BRG089', 'Amplop Coklat nulla', 'pcs', 72, 26, 0, NULL, '2025-11-18 09:39:06', '2025-11-18 19:15:11', NULL, NULL, NULL),
(40, 'BRG119', 'Kertas A4 ducimus', 'pack', 44, 61, 0, NULL, '2025-11-18 09:39:06', '2025-11-18 09:39:07', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

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
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_11_15_113738_create_items_table', 1),
(5, '2025_11_15_113758_create_transactions_table', 1),
(6, '2025_11_15_142354_create_personal_access_tokens_table', 1),
(7, '2025_11_16_055957_create_audit_logs_table', 1),
(8, '2025_11_16_123402_add_user_tracking_to_items_table', 1),
(9, '2025_11_16_123817_add_created_by_to_items_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(4, 'App\\Models\\User', 1, 'auth-token', '3d8b70585aa28a6d8a0e5bea7f2092a0b49a78c92a3c5e4edbc5407fcd0f11a5', '[\"*\"]', '2025-11-18 21:22:11', NULL, '2025-11-18 19:35:53', '2025-11-18 21:22:11');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `jenis_transaksi` enum('masuk','keluar') NOT NULL,
  `tanggal_transaksi` date NOT NULL,
  `jumlah` int(11) NOT NULL,
  `keterangan` text DEFAULT NULL,
  `status` enum('aktif','dibatalkan','restored') NOT NULL DEFAULT 'aktif',
  `canceled_at` timestamp NULL DEFAULT NULL,
  `canceled_by` bigint(20) UNSIGNED DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `restored_by` bigint(20) UNSIGNED DEFAULT NULL,
  `lock_version` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `item_id`, `jenis_transaksi`, `tanggal_transaksi`, `jumlah`, `keterangan`, `status`, `canceled_at`, `canceled_by`, `restored_at`, `restored_by`, `lock_version`, `created_at`, `updated_at`) VALUES
(1, 1, 'masuk', '2025-11-04', 17, 'Pengisian ulang inventory', 'aktif', NULL, NULL, NULL, NULL, 0, '2025-11-18 09:39:06', '2025-11-18 09:39:06'),
(2, 2, 'masuk', '2025-11-01', 6, 'Pembelian rutin bulanan', 'aktif', NULL, NULL, NULL, NULL, 0, '2025-11-18 09:39:06', '2025-11-18 09:39:06'),
(3, 3, 'masuk', '2025-11-10', 20, 'Pengisian ulang inventory', 'aktif', NULL, NULL, NULL, NULL, 0, '2025-11-18 09:39:06', '2025-11-18 09:39:06'),
(4, 4, 'masuk', '2025-11-12', 19, 'Stok tambahan', 'aktif', NULL, NULL, NULL, NULL, 0, '2025-11-18 09:39:06', '2025-11-18 09:39:06'),
(5, 5, 'masuk', '2025-11-07', 6, 'Pembelian rutin bulanan', 'aktif', NULL, NULL, NULL, NULL, 0, '2025-11-18 09:39:06', '2025-11-18 09:39:06'),
(6, 5, 'keluar', '2025-11-17', 1, 'Alokasi departemen', 'aktif', NULL, NULL, NULL, NULL, 0, '2025-11-18 09:39:06', '2025-11-18 09:39:06'),
(7, 6, 'masuk', '2025-11-09', 14, 'Restok barang habis', 'aktif', NULL, NULL, NULL, NULL, 0, '2025-11-18 09:39:06', '2025-11-18 09:39:06'),
(8, 6, 'keluar', '2025-11-14', 7, 'Alokasi departemen', 'aktif', NULL, NULL, NULL, NULL, 0, '2025-11-18 09:39:06', '2025-11-18 09:39:06'),
(9, 7, 'masuk', '2025-11-05', 14, 'Pembelian bulk', 'aktif', NULL, NULL, NULL, NULL, 0, '2025-11-18 09:39:06', '2025-11-18 09:39:06'),
(10, 8, 'masuk', '2025-11-06', 10, 'Pengisian ulang inventory', 'aktif', NULL, NULL, NULL, NULL, 0, '2025-11-18 09:39:06', '2025-11-18 09:39:06'),
(11, 9, 'masuk', '2025-11-06', 19, 'Pembelian bulk', 'aktif', NULL, NULL, NULL, NULL, 0, '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(12, 9, 'keluar', '2025-11-16', 3, 'Alokasi departemen', 'aktif', NULL, NULL, NULL, NULL, 0, '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(13, 10, 'masuk', '2025-11-02', 15, 'Pembelian bulk', 'aktif', NULL, NULL, NULL, NULL, 0, '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(14, 11, 'masuk', '2025-10-30', 14, 'Pembelian rutin bulanan', 'aktif', NULL, NULL, NULL, NULL, 0, '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(15, 11, 'keluar', '2025-11-15', 9, 'Penggunaan maintenance', 'aktif', NULL, NULL, NULL, NULL, 0, '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(16, 12, 'masuk', '2025-11-06', 15, 'Pengisian ulang inventory', 'aktif', NULL, NULL, NULL, NULL, 0, '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(17, 12, 'keluar', '2025-11-16', 1, 'Penggunaan operasional', 'aktif', NULL, NULL, NULL, NULL, 0, '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(18, 13, 'masuk', '2025-11-09', 9, 'Restok mingguan', 'aktif', NULL, NULL, NULL, NULL, 0, '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(19, 14, 'masuk', '2025-10-29', 9, 'Pengisian ulang inventory', 'aktif', NULL, NULL, NULL, NULL, 0, '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(20, 15, 'masuk', '2025-11-07', 11, 'Pembelian rutin bulanan', 'aktif', NULL, NULL, NULL, NULL, 0, '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(21, 16, 'masuk', '2025-11-10', 17, 'Pembelian rutin bulanan', 'aktif', NULL, NULL, NULL, NULL, 0, '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(22, 17, 'masuk', '2025-10-29', 10, 'Restok mingguan', 'aktif', NULL, NULL, NULL, NULL, 0, '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(23, 17, 'keluar', '2025-11-17', 12, 'Konsumsi rutin', 'aktif', NULL, NULL, NULL, NULL, 0, '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(24, 18, 'masuk', '2025-11-06', 14, 'Pembelian darurat', 'aktif', NULL, NULL, NULL, NULL, 0, '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(25, 18, 'keluar', '2025-11-15', 3, 'Penggunaan maintenance', 'aktif', NULL, NULL, NULL, NULL, 0, '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(26, 19, 'masuk', '2025-11-03', 8, 'Pembelian bulk', 'aktif', NULL, NULL, NULL, NULL, 0, '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(27, 20, 'masuk', '2025-11-09', 7, 'Pembelian darurat', 'aktif', NULL, NULL, NULL, NULL, 0, '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(28, 21, 'masuk', '2025-10-30', 20, 'Stok tambahan', 'aktif', NULL, NULL, NULL, NULL, 0, '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(29, 22, 'masuk', '2025-11-03', 18, 'Restok mingguan', 'aktif', NULL, NULL, NULL, NULL, 0, '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(30, 23, 'masuk', '2025-10-29', 10, 'Pembelian darurat', 'aktif', NULL, NULL, NULL, NULL, 0, '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(31, 24, 'masuk', '2025-11-01', 11, 'Pembelian darurat', 'aktif', NULL, NULL, NULL, NULL, 0, '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(32, 25, 'masuk', '2025-11-06', 10, 'Pembelian darurat', 'aktif', NULL, NULL, NULL, NULL, 0, '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(33, 25, 'keluar', '2025-11-15', 2, 'Kebutuhan proyek', 'aktif', NULL, NULL, NULL, NULL, 0, '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(34, 26, 'masuk', '2025-11-03', 16, 'Pembelian rutin bulanan', 'aktif', NULL, NULL, NULL, NULL, 0, '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(35, 27, 'masuk', '2025-11-09', 19, 'Pembelian bulk', 'aktif', NULL, NULL, NULL, NULL, 0, '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(36, 28, 'masuk', '2025-11-03', 17, 'Pengadaan dari supplier', 'aktif', NULL, NULL, NULL, NULL, 0, '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(37, 29, 'masuk', '2025-11-08', 11, 'Restok mingguan', 'aktif', NULL, NULL, NULL, NULL, 0, '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(38, 30, 'masuk', '2025-11-10', 19, 'Pembelian rutin bulanan', 'aktif', NULL, NULL, NULL, NULL, 0, '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(39, 30, 'keluar', '2025-11-14', 43, 'Alokasi departemen', 'aktif', NULL, NULL, NULL, NULL, 0, '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(40, 31, 'masuk', '2025-11-10', 16, 'Stok tambahan', 'aktif', NULL, NULL, NULL, NULL, 0, '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(41, 31, 'keluar', '2025-11-16', 8, 'Distribusi ke cabang', 'aktif', NULL, NULL, NULL, NULL, 0, '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(42, 32, 'masuk', '2025-11-04', 5, 'Pembelian rutin bulanan', 'aktif', NULL, NULL, NULL, NULL, 0, '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(43, 32, 'keluar', '2025-11-17', 32, 'Pemakaian darurat', 'aktif', NULL, NULL, NULL, NULL, 0, '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(44, 33, 'masuk', '2025-11-09', 20, 'Pengadaan dari supplier', 'aktif', NULL, NULL, NULL, NULL, 0, '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(45, 34, 'masuk', '2025-11-07', 14, 'Pengisian ulang inventory', 'aktif', NULL, NULL, NULL, NULL, 0, '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(46, 35, 'masuk', '2025-10-29', 5, 'Restok mingguan', 'aktif', NULL, NULL, NULL, NULL, 0, '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(47, 35, 'keluar', '2025-11-15', 35, 'Pemakaian harian', 'aktif', NULL, NULL, NULL, NULL, 0, '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(48, 36, 'masuk', '2025-10-29', 5, 'Pembelian rutin bulanan', 'aktif', NULL, NULL, NULL, NULL, 0, '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(49, 37, 'masuk', '2025-11-11', 20, 'Restok barang habis', 'aktif', NULL, NULL, NULL, NULL, 0, '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(50, 38, 'masuk', '2025-11-01', 5, 'Restok mingguan', 'aktif', NULL, NULL, NULL, NULL, 0, '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(51, 39, 'masuk', '2025-10-30', 6, 'Pengadaan dari supplier', 'aktif', NULL, NULL, NULL, NULL, 0, '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(52, 39, 'keluar', '2025-11-16', 51, 'Alokasi departemen', 'aktif', NULL, NULL, NULL, NULL, 0, '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(53, 40, 'masuk', '2025-11-05', 17, 'Pembelian rutin bulanan', 'aktif', NULL, NULL, NULL, NULL, 0, '2025-11-18 09:39:07', '2025-11-18 09:39:07'),
(54, 39, 'keluar', '2025-11-19', 25, 'Beli di toko sebelah', 'aktif', NULL, NULL, NULL, NULL, 0, '2025-11-18 19:12:05', '2025-11-18 19:12:05'),
(55, 14, 'keluar', '2025-11-19', 27, 'Keluar ke toko sebelah', 'aktif', NULL, NULL, NULL, NULL, 0, '2025-11-18 19:12:36', '2025-11-18 19:12:36'),
(56, 39, 'masuk', '2025-11-19', 12, 'Stok tambahan', 'restored', '2025-11-18 19:14:53', 1, '2025-11-18 19:15:11', 1, 0, '2025-11-18 19:14:43', '2025-11-18 19:15:11'),
(57, 16, 'keluar', '2025-11-19', 17, 'Distribusi ke cabang', 'aktif', NULL, NULL, NULL, NULL, 0, '2025-11-18 19:17:50', '2025-11-18 19:17:50');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','manager','staff') NOT NULL DEFAULT 'staff',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'admin@inventory.com', NULL, '$2y$12$/ztlPox0092AJjdZFNXVOeNpi6DKkZA7Wj46VqA0a/F2orOROOM3O', 'admin', NULL, '2025-11-18 09:39:02', '2025-11-18 09:39:02'),
(2, 'Manager', 'manager@inventory.com', NULL, '$2y$12$I3WtZycmbhrPpQWFUhFHSuHTCbzzsRMgWJRgBsGQucGgiN4427o5G', 'manager', NULL, '2025-11-18 09:39:02', '2025-11-18 09:39:02'),
(3, 'Staff', 'staff@inventory.com', NULL, '$2y$12$d9QzSTR9f03atzMiwBLFW.7XQa.uqS1B3vbrwvTcSVWVBwj15rN22', 'staff', NULL, '2025-11-18 09:39:02', '2025-11-18 09:39:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `audit_logs_auditable_type_auditable_id_index` (`auditable_type`,`auditable_id`);

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
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `items_kode_barang_unique` (`kode_barang`),
  ADD KEY `items_updated_by_foreign` (`updated_by`),
  ADD KEY `items_deleted_by_foreign` (`deleted_by`),
  ADD KEY `items_created_by_foreign` (`created_by`);

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
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_item_id_foreign` (`item_id`),
  ADD KEY `transactions_canceled_by_foreign` (`canceled_by`),
  ADD KEY `transactions_restored_by_foreign` (`restored_by`);

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
-- AUTO_INCREMENT for table `audit_logs`
--
ALTER TABLE `audit_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=160;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `items_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `items_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_canceled_by_foreign` FOREIGN KEY (`canceled_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `transactions_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_restored_by_foreign` FOREIGN KEY (`restored_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
