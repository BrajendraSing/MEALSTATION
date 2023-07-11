-- phpMyAdmin SQL Dump
-- version 5.2.1deb1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 12, 2023 at 03:27 PM
-- Server version: 8.0.33-0ubuntu0.23.04.2
-- PHP Version: 8.1.12-1ubuntu4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mealstation`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add category', 7, 'add_category'),
(26, 'Can change category', 7, 'change_category'),
(27, 'Can delete category', 7, 'delete_category'),
(28, 'Can view category', 7, 'view_category'),
(29, 'Can add customer', 8, 'add_customer'),
(30, 'Can change customer', 8, 'change_customer'),
(31, 'Can delete customer', 8, 'delete_customer'),
(32, 'Can view customer', 8, 'view_customer'),
(33, 'Can add items', 9, 'add_items'),
(34, 'Can change items', 9, 'change_items'),
(35, 'Can delete items', 9, 'delete_items'),
(36, 'Can view items', 9, 'view_items'),
(37, 'Can add carousel', 10, 'add_carousel'),
(38, 'Can change carousel', 10, 'change_carousel'),
(39, 'Can delete carousel', 10, 'delete_carousel'),
(40, 'Can view carousel', 10, 'view_carousel'),
(41, 'Can add order', 11, 'add_order'),
(42, 'Can change order', 11, 'change_order'),
(43, 'Can delete order', 11, 'delete_order'),
(44, 'Can view order', 11, 'view_order'),
(45, 'Can add service time', 12, 'add_servicetime'),
(46, 'Can change service time', 12, 'change_servicetime'),
(47, 'Can delete service time', 12, 'delete_servicetime'),
(48, 'Can view service time', 12, 'view_servicetime'),
(49, 'Can add manage cart', 13, 'add_managecart'),
(50, 'Can change manage cart', 13, 'change_managecart'),
(51, 'Can delete manage cart', 13, 'delete_managecart'),
(52, 'Can view manage cart', 13, 'view_managecart'),
(53, 'Can add static', 14, 'add_static'),
(54, 'Can change static', 14, 'change_static'),
(55, 'Can delete static', 14, 'delete_static'),
(56, 'Can view static', 14, 'view_static'),
(57, 'Can add admin', 15, 'add_admin'),
(58, 'Can change admin', 15, 'change_admin'),
(59, 'Can delete admin', 15, 'delete_admin'),
(60, 'Can view admin', 15, 'view_admin');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int NOT NULL,
  `password` varchar(128) COLLATE utf8mb4_general_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$320000$mFZCSSkHq1iQI9Rtvfx77e$AwkRufM7qEOdLJoSR4PcVKAM0+gPk4yvZ7MovRoCu9Y=', '2022-08-28 05:03:20.754916', 1, 'mealstation', 'Brajendra', 'Singh', 'brajendrayhari181297@gmail.com', 1, 1, '2022-05-15 15:08:35.000000');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cafe_admin`
--

CREATE TABLE `cafe_admin` (
  `id` bigint NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `created` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cafe_admin`
--

INSERT INTO `cafe_admin` (`id`, `name`, `email`, `password`, `token`, `created`) VALUES
(1, 'Brajendra Singh', 'brajendrayhari181297@gmail.com', 'pbkdf2_sha256$390000$WbYAgg2ONe4Zxkyg3rXHLz$2rJy/2Gx7qBmhFN+NRte7NjUQ3/oii/IYqVw7PRkXT4=', '', '2023-03-20');

-- --------------------------------------------------------

--
-- Table structure for table `cafe_carousel`
--

CREATE TABLE `cafe_carousel` (
  `id` bigint NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `message` varchar(200) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cafe_carousel`
--

INSERT INTO `cafe_carousel` (`id`, `image`, `message`) VALUES
(1, 'media/images/carousel/front_image_9W0eHev.jpeg', 'Banner Size must be 700X350 '),
(2, 'media/images/carousel/banner_7nVbcYT.png', 'Banner Size must be 700X350 ');

-- --------------------------------------------------------

--
-- Table structure for table `cafe_category`
--

CREATE TABLE `cafe_category` (
  `id` bigint NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cafe_category`
--

INSERT INTO `cafe_category` (`id`, `name`, `image`) VALUES
(1, 'Snacks', 'media/images/category_snacks_HtfRT27.jpg'),
(2, 'Main Course', 'media/images/category_desert_BmRFCOp.jpg'),
(3, 'Dessert', 'media/images/category_main_course_mT2XYab.jpg'),
(4, 'Beverage', 'media/images/category_beverage_UsiZ9Cs.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `cafe_customer`
--

CREATE TABLE `cafe_customer` (
  `id` bigint NOT NULL,
  `first_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_general_ci NOT NULL,
  `mobile` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(500) COLLATE utf8mb4_general_ci NOT NULL,
  `token` varchar(500) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cafe_customer`
--

INSERT INTO `cafe_customer` (`id`, `first_name`, `last_name`, `email`, `mobile`, `password`, `token`) VALUES
(1, 'Brajendra', 'Singh', 'admin@gmail.com', '7524977820', 'pbkdf2_sha256$320000$Q8m8xg5wFOJP3AeGHgT4Wj$3gSHgAvPjXjtMqRbJXAqGmRgvgs4k/EWHyVxeWJeWUk=', '9e45da19-d4ee-11ec-878c-ec765daec903'),
(4, 'Ranveer ', 'Singh', 'infiniteranveer@gmail.com', '8869998075', 'pbkdf2_sha256$320000$JgryTo3NkxwectqAiIeFNZ$xItrZ+WZkjMJxmxBfvGfK/qd8OZJ5//F48MxgXUH63s=', '0'),
(5, 'pragati', 'jkjk', 'pragatiuapdhyay@gmail.com', '9807788889', 'pbkdf2_sha256$320000$kWdRz0C186n8AjObzexMPY$HKeYAQPHFX0PfwYaHpcFzeEs7i9Gjfx7Dvwy58CdxJ0=', '0'),
(6, 'Abhay', 'Singh', 'abhay@gmail.com', '9988776655', 'pbkdf2_sha256$390000$nISfrj3vSDKCbUQ2M8ZSEd$c4ugYp2ogVYQt91Oph2DwgjwSCDcfTxf4dUC/jJM6v4=', '0'),
(7, 'Brajendra', 'Singh', 'brajendrayhari181297@gmail.com', '7524977820', 'pbkdf2_sha256$390000$RN54ybgoGC0SgUuCiwQ26J$ixhgi02T/bg3R3NNl6a9brVopzS8XUcpNOJqu23pX5M=', ''),
(8, '1234', '1234', '8650849041@123', '8650849041', 'pbkdf2_sha256$390000$PGf0fLdZttjO6R14Aojais$9yMod8m2ReiurZOjMlW2wlL98CKRCeheDscfjuC3eZE=', '0');

-- --------------------------------------------------------

--
-- Table structure for table `cafe_items`
--

CREATE TABLE `cafe_items` (
  `id` bigint NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `price` int NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `category_id` bigint NOT NULL,
  `stock` varchar(10) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cafe_items`
--

INSERT INTO `cafe_items` (`id`, `name`, `price`, `image`, `category_id`, `stock`) VALUES
(6, 'Chola Samosa', 15, 'media/items/Chola-samosa.jpg', 1, 'YES'),
(7, 'Dahi Bada', 25, 'media/items/dahi-vada-recipe-2.jpg', 1, 'YES'),
(8, 'Samosa', 10, 'media/items/Indian-Samosa.jpg', 1, 'YES'),
(9, 'Chili Potato', 60, 'media/items/Chili-Potato.jpg', 1, 'YES'),
(10, 'Noodles', 40, 'media/items/Noodles.jpg', 1, 'NO'),
(11, 'Chola Bhatura', 50, 'media/items/chola_bhatura_bzFsITA.jpeg', 2, 'YES'),
(12, 'Aloo Paratha', 30, 'media/items/aloo-paratha-1.jpg', 2, 'YES'),
(13, 'Chhola Rice', 50, 'media/items/Chola-Chawal.jpg', 2, 'YES'),
(14, 'Fried Rice', 50, 'media/items/Fried-Rice.jpg', 2, 'NO'),
(15, 'Paneer Sabji', 100, 'media/items/Best-Kadai-Paneer-Recipe.jpg', 2, 'YES'),
(16, 'Tea', 10, 'media/items/tea1.png', 4, 'YES'),
(17, 'Cold Coffee', 50, 'media/items/cold-coffee-with-icecream.jpg', 4, 'YES'),
(18, 'Lassi', 30, 'media/items/special-lassi-wala.jpg', 4, 'YES'),
(19, 'Masala Mattha', 15, 'media/items/mattha-butter-milk1.jpeg', 4, 'NO'),
(20, 'Mango Juice', 40, 'media/items/Mango-Shake.jpeg', 4, 'YES'),
(21, 'Cake 500g', 250, 'media/items/cake.jpeg', 3, 'NO'),
(22, 'Ice Cream', 50, 'media/items/icecream-cone.png', 3, 'YES');

-- --------------------------------------------------------

--
-- Table structure for table `cafe_managecart`
--

CREATE TABLE `cafe_managecart` (
  `id` bigint NOT NULL,
  `quantity` int NOT NULL,
  `customer_id` bigint NOT NULL,
  `item_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cafe_managecart`
--

INSERT INTO `cafe_managecart` (`id`, `quantity`, `customer_id`, `item_id`) VALUES
(41, 1, 6, 6),
(43, 1, 1, 13),
(44, 3, 1, 11);

-- --------------------------------------------------------

--
-- Table structure for table `cafe_order`
--

CREATE TABLE `cafe_order` (
  `id` bigint NOT NULL,
  `quantity` int NOT NULL,
  `price` int NOT NULL,
  `date` date NOT NULL,
  `customer_id` bigint NOT NULL,
  `item_id` bigint NOT NULL,
  `mobile` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `status` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `payment_method` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `total` int NOT NULL,
  `studentId` varchar(20) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cafe_order`
--

INSERT INTO `cafe_order` (`id`, `quantity`, `price`, `date`, `customer_id`, `item_id`, `mobile`, `status`, `payment_method`, `total`, `studentId`) VALUES
(14, 2, 30, '2022-05-19', 1, 12, '7524977820', 'Delivered', 'pod', 60, '29534'),
(15, 1, 100, '2022-05-19', 1, 15, '7524977820', 'Delivered', 'pod', 100, '29534'),
(16, 1, 40, '2022-05-20', 1, 20, '7524977820', 'Delivered', 'pod', 40, '29534'),
(31, 3, 40, '2022-06-01', 5, 22, '7524977820', 'Delivered', 'qrcode', 120, '29534'),
(32, 1, 50, '2023-06-11', 1, 13, '7524977820', 'Pending', 'pod', 50, '29534'),
(33, 2, 50, '2023-06-11', 1, 22, '7524977820', 'Delivered', 'pod', 100, '29534'),
(34, 1, 30, '2023-06-11', 1, 18, '7524977820', 'Ready', 'pod', 30, '29534'),
(35, 2, 10, '2023-06-11', 6, 8, '9988776655', 'Delivered', 'pod', 20, '28534'),
(36, 1, 50, '2023-06-11', 6, 22, '9988776655', 'Ready', 'pod', 50, '28534'),
(37, 2, 50, '2023-06-12', 1, 22, '9988776655', 'Ready', 'pod', 100, '29534');

-- --------------------------------------------------------

--
-- Table structure for table `cafe_servicetime`
--

CREATE TABLE `cafe_servicetime` (
  `id` bigint NOT NULL,
  `message` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `open` time(6) NOT NULL,
  `close` time(6) NOT NULL,
  `edit` varchar(50) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cafe_servicetime`
--

INSERT INTO `cafe_servicetime` (`id`, `message`, `open`, `close`, `edit`) VALUES
(2, 'Time must be in 24 hour format', '09:05:00.000000', '16:55:00.000000', 'Click Here');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_general_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2022-05-15 15:12:02.700333', '1', 'snacks', 1, '[{\"added\": {}}]', 7, 1),
(2, '2022-05-15 15:12:23.957971', '2', 'Main Course', 1, '[{\"added\": {}}]', 7, 1),
(3, '2022-05-15 15:12:42.747407', '3', 'Desert', 1, '[{\"added\": {}}]', 7, 1),
(4, '2022-05-15 15:13:10.163816', '4', 'Beverage', 1, '[{\"added\": {}}]', 7, 1),
(5, '2022-05-15 15:15:47.739994', '1', 'Carousel object (1)', 1, '[{\"added\": {}}]', 10, 1),
(6, '2022-05-15 15:15:54.852593', '2', 'Carousel object (2)', 1, '[{\"added\": {}}]', 10, 1),
(7, '2022-05-15 15:16:44.989158', '1', 'Burger', 1, '[{\"added\": {}}]', 9, 1),
(8, '2022-05-15 15:17:06.086925', '2', 'Ice Cream', 1, '[{\"added\": {}}]', 9, 1),
(9, '2022-05-15 15:17:32.498894', '3', 'Chola Bhatura', 1, '[{\"added\": {}}]', 9, 1),
(10, '2022-05-15 15:17:49.817852', '4', 'Chai', 1, '[{\"added\": {}}]', 9, 1),
(11, '2022-05-15 15:18:36.393342', '5', 'Burger', 1, '[{\"added\": {}}]', 9, 1),
(12, '2022-05-15 15:19:59.085898', '1', 'ServiceTime object (1)', 1, '[{\"added\": {}}]', 12, 1),
(13, '2022-05-15 15:32:02.689957', '1', 'ServiceTime object (1)', 2, '[{\"changed\": {\"fields\": [\"Close\"]}}]', 12, 1),
(14, '2022-05-16 05:54:25.875689', '1', 'ServiceTime object (1)', 2, '[{\"changed\": {\"fields\": [\"Open\", \"Close\"]}}]', 12, 1),
(15, '2022-05-16 06:37:42.378376', '1', 'mealstation', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]', 4, 1),
(16, '2022-05-18 15:32:02.821669', '5', 'Burger', 2, '[{\"changed\": {\"fields\": [\"Stock\"]}}]', 9, 1),
(17, '2022-05-18 15:32:20.352612', '1', 'Burger', 2, '[{\"changed\": {\"fields\": [\"Stock\"]}}]', 9, 1),
(18, '2022-05-18 15:43:52.442948', '5', 'Burger', 2, '[{\"changed\": {\"fields\": [\"Stock\"]}}]', 9, 1),
(19, '2022-05-18 15:44:29.684978', '1', 'Burger', 2, '[{\"changed\": {\"fields\": [\"Stock\"]}}]', 9, 1),
(20, '2022-05-18 15:44:55.026973', '5', 'Burger', 2, '[{\"changed\": {\"fields\": [\"Stock\"]}}]', 9, 1),
(21, '2022-05-18 15:45:25.216998', '4', 'Chai', 2, '[{\"changed\": {\"fields\": [\"Stock\"]}}]', 9, 1),
(22, '2022-05-18 15:45:41.212857', '2', 'Ice Cream', 2, '[{\"changed\": {\"fields\": [\"Stock\"]}}]', 9, 1),
(23, '2022-05-18 15:46:04.050998', '5', 'Burger 2', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 9, 1),
(24, '2022-05-18 15:46:43.865441', '4', 'Chai', 2, '[{\"changed\": {\"fields\": [\"Stock\"]}}]', 9, 1),
(25, '2022-05-19 05:44:08.498213', '4', 'Chai', 2, '[{\"changed\": {\"fields\": [\"Stock\"]}}]', 9, 1),
(26, '2022-05-19 05:48:01.016496', '4', 'Chai', 2, '[{\"changed\": {\"fields\": [\"Stock\"]}}]', 9, 1),
(27, '2022-05-19 05:52:12.801499', '1', 'ServiceTime object (1)', 3, '', 12, 1),
(28, '2022-05-19 05:52:46.890163', '2', 'ServiceTime object (2)', 1, '[{\"added\": {}}]', 12, 1),
(29, '2022-05-19 06:37:37.861320', '2', 'ServiceTime object (2)', 2, '[{\"changed\": {\"fields\": [\"Close\"]}}]', 12, 1),
(30, '2022-05-19 06:39:18.811105', '7', 'Burger 2', 3, '', 11, 1),
(31, '2022-05-19 06:39:18.830108', '6', 'Chai', 3, '', 11, 1),
(32, '2022-05-19 06:39:18.837131', '5', 'Burger', 3, '', 11, 1),
(33, '2022-05-19 06:39:18.844113', '4', 'Ice Cream', 3, '', 11, 1),
(34, '2022-05-19 06:39:18.849113', '3', 'Burger', 3, '', 11, 1),
(35, '2022-05-19 06:39:18.858115', '2', 'Chola Bhatura', 3, '', 11, 1),
(36, '2022-05-19 06:39:18.869118', '1', 'Burger', 3, '', 11, 1),
(37, '2022-05-19 06:42:29.134343', '4', 'Chai', 2, '[{\"changed\": {\"fields\": [\"Stock\"]}}]', 9, 1),
(38, '2022-05-19 06:43:28.331720', '9', 'Chai', 3, '', 11, 1),
(39, '2022-05-19 06:43:28.339725', '8', 'Ice Cream', 3, '', 11, 1),
(40, '2022-05-19 06:44:37.283486', '2', 'Ice Cream', 2, '[{\"changed\": {\"fields\": [\"Stock\"]}}]', 9, 1),
(41, '2022-05-19 06:46:02.696746', '2', 'Ice Cream', 2, '[{\"changed\": {\"fields\": [\"Stock\"]}}]', 9, 1),
(42, '2022-05-19 06:57:47.133018', '11', 'Ice Cream', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 11, 1),
(43, '2022-05-19 06:57:54.393897', '10', 'Chai', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 11, 1),
(44, '2022-05-19 07:01:51.346684', '11', 'Ice Cream', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 11, 1),
(45, '2022-05-19 07:02:11.190589', '10', 'Chai', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 11, 1),
(46, '2022-05-19 08:12:09.341850', '10', 'Chai', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 11, 1),
(47, '2022-05-19 08:13:23.043847', '11', 'Ice Cream', 3, '', 11, 1),
(48, '2022-05-19 08:13:23.059842', '10', 'Chai', 3, '', 11, 1),
(49, '2022-05-19 08:19:57.004474', '2', 'ServiceTime object (2)', 2, '[{\"changed\": {\"fields\": [\"Close\"]}}]', 12, 1),
(50, '2022-05-19 08:52:13.902046', '2', 'ServiceTime object (2)', 2, '[{\"changed\": {\"fields\": [\"Close\"]}}]', 12, 1),
(51, '2022-05-19 09:18:24.400187', '13', 'Chai', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 11, 1),
(52, '2022-05-19 09:39:08.885166', '12', 'Chai', 3, '', 11, 1),
(53, '2022-05-19 09:39:22.305562', '13', 'Chai', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 11, 1),
(54, '2022-05-19 09:39:36.952589', '13', 'Chai', 3, '', 11, 1),
(55, '2022-05-19 09:40:05.622512', '3', 'Anurag Prajapati', 3, '', 8, 1),
(56, '2022-05-19 09:40:05.636502', '2', 'Brajendra Singh 2', 3, '', 8, 1),
(57, '2022-05-19 10:22:18.460407', '5', 'Burger 2', 3, '', 9, 1),
(58, '2022-05-19 10:22:18.517421', '4', 'Chai', 3, '', 9, 1),
(59, '2022-05-19 10:22:18.524423', '3', 'Chola Bhatura', 3, '', 9, 1),
(60, '2022-05-19 10:22:18.535426', '2', 'Ice Cream', 3, '', 9, 1),
(61, '2022-05-19 10:22:18.547429', '1', 'Burger', 3, '', 9, 1),
(62, '2022-05-19 10:23:10.050864', '6', 'Chola Samosa', 1, '[{\"added\": {}}]', 9, 1),
(63, '2022-05-19 10:24:00.316392', '7', 'Dahi Bada', 1, '[{\"added\": {}}]', 9, 1),
(64, '2022-05-19 10:25:43.040608', '8', 'Samosa', 1, '[{\"added\": {}}]', 9, 1),
(65, '2022-05-19 10:28:28.583044', '9', 'Chili Potato', 1, '[{\"added\": {}}]', 9, 1),
(66, '2022-05-19 10:30:04.158076', '10', 'Noodles', 1, '[{\"added\": {}}]', 9, 1),
(67, '2022-05-19 10:31:14.750738', '11', 'Chola Bhatura', 1, '[{\"added\": {}}]', 9, 1),
(68, '2022-05-19 10:31:56.603606', '12', 'Aloo Paratha', 1, '[{\"added\": {}}]', 9, 1),
(69, '2022-05-19 10:32:57.442875', '13', 'Chhola Rice', 1, '[{\"added\": {}}]', 9, 1),
(70, '2022-05-19 10:33:22.858892', '14', 'Fried Rice', 1, '[{\"added\": {}}]', 9, 1),
(71, '2022-05-19 10:34:00.247730', '15', 'Paneer Sabji', 1, '[{\"added\": {}}]', 9, 1),
(72, '2022-05-19 10:35:22.900618', '16', 'Tea', 1, '[{\"added\": {}}]', 9, 1),
(73, '2022-05-19 10:36:08.500396', '17', 'Cold Coffee', 1, '[{\"added\": {}}]', 9, 1),
(74, '2022-05-19 10:42:56.369541', '18', 'Lassi', 1, '[{\"added\": {}}]', 9, 1),
(75, '2022-05-19 10:44:02.295527', '19', 'Masala Mattha', 1, '[{\"added\": {}}]', 9, 1),
(76, '2022-05-19 10:44:53.603874', '20', 'Mango Juice', 1, '[{\"added\": {}}]', 9, 1),
(77, '2022-05-19 10:46:32.330776', '21', 'Cake 500g', 1, '[{\"added\": {}}]', 9, 1),
(78, '2022-05-19 10:47:11.737822', '22', 'Ice Cream', 1, '[{\"added\": {}}]', 9, 1),
(79, '2022-05-19 10:47:43.370303', '8', 'Samosa', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 9, 1),
(80, '2022-05-19 15:48:51.115870', '2', 'ServiceTime object (2)', 2, '[{\"changed\": {\"fields\": [\"Open\", \"Close\"]}}]', 12, 1),
(81, '2022-05-19 15:51:50.344768', '2', 'ServiceTime object (2)', 2, '[{\"changed\": {\"fields\": [\"Close\"]}}]', 12, 1),
(82, '2022-05-19 16:01:20.884144', '2', 'ServiceTime object (2)', 2, '[{\"changed\": {\"fields\": [\"Close\"]}}]', 12, 1),
(83, '2022-05-20 04:25:38.099117', '15', 'Paneer Sabji', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 11, 1),
(84, '2022-05-20 04:25:54.188230', '14', 'Aloo Paratha', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 11, 1),
(85, '2022-05-20 04:26:43.317142', '2', 'ServiceTime object (2)', 2, '[{\"changed\": {\"fields\": [\"Open\"]}}]', 12, 1),
(86, '2022-05-20 05:00:52.571285', '21', 'Cake 500g', 2, '[{\"changed\": {\"fields\": [\"Stock\"]}}]', 9, 1),
(87, '2022-05-20 05:01:51.871885', '19', 'Masala Mattha', 2, '[{\"changed\": {\"fields\": [\"Stock\"]}}]', 9, 1),
(88, '2022-05-20 06:16:22.911064', '18', 'Ice Cream', 3, '', 11, 1),
(89, '2022-05-20 06:16:22.927064', '17', 'Mango Juice', 3, '', 11, 1),
(90, '2022-05-20 06:21:09.862662', '19', 'Chola Bhatura', 3, '', 11, 1),
(91, '2022-05-20 07:08:52.657897', '20', 'Ice Cream', 3, '', 11, 1),
(92, '2022-05-20 07:18:24.609667', '21', 'Ice Cream', 3, '', 11, 1),
(93, '2022-05-20 07:25:00.818524', '23', 'Ice Cream', 3, '', 11, 1),
(94, '2022-05-20 07:25:00.834526', '22', 'Ice Cream', 3, '', 11, 1),
(95, '2022-05-20 07:32:56.763655', '25', 'Ice Cream', 3, '', 11, 1),
(96, '2022-05-20 07:32:56.771659', '24', 'Ice Cream', 3, '', 11, 1),
(97, '2022-05-20 08:53:40.088354', '2', 'ServiceTime object (2)', 2, '[{\"changed\": {\"fields\": [\"Open\"]}}]', 12, 1),
(98, '2022-05-20 08:54:33.329311', '2', 'ServiceTime object (2)', 2, '[{\"changed\": {\"fields\": [\"Close\"]}}]', 12, 1),
(99, '2022-05-20 09:04:07.113403', '27', 'Lassi', 3, '', 11, 1),
(100, '2022-05-20 09:04:07.127405', '26', 'Mango Juice', 3, '', 11, 1),
(101, '2022-05-20 09:19:33.702349', '29', 'Cold Coffee', 3, '', 11, 1),
(102, '2022-05-20 09:19:33.713351', '28', 'Mango Juice', 3, '', 11, 1),
(103, '2022-05-20 09:20:37.353913', '14', 'Fried Rice', 2, '[{\"changed\": {\"fields\": [\"Stock\"]}}]', 9, 1),
(104, '2022-05-20 09:21:05.462075', '10', 'Noodles', 2, '[{\"changed\": {\"fields\": [\"Stock\"]}}]', 9, 1),
(105, '2022-05-20 09:27:57.808661', '30', 'Lassi', 3, '', 11, 1),
(106, '2022-05-20 09:33:03.797182', '2', 'ServiceTime object (2)', 2, '[{\"changed\": {\"fields\": [\"Close\"]}}]', 12, 1),
(107, '2022-05-20 11:09:16.992136', '3', 'Dessert', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 7, 1),
(108, '2022-05-20 11:11:33.094748', '1', 'Snacks', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 7, 1),
(109, '2022-06-01 04:13:29.314503', '2', 'ServiceTime object (2)', 2, '[{\"changed\": {\"fields\": [\"Open\"]}}]', 12, 1),
(110, '2022-06-03 15:06:41.141323', '1', 'Static object (1)', 1, '[{\"added\": {}}]', 14, 1),
(111, '2022-06-05 02:21:26.900472', '2', 'ServiceTime object (2)', 2, '[{\"changed\": {\"fields\": [\"Open\"]}}]', 12, 1),
(112, '2022-06-05 02:24:42.603192', '2', 'ServiceTime object (2)', 2, '[{\"changed\": {\"fields\": [\"Close\"]}}]', 12, 1),
(113, '2022-06-05 02:29:32.965085', '2', 'ServiceTime object (2)', 2, '[{\"changed\": {\"fields\": [\"Open\", \"Close\"]}}]', 12, 1),
(114, '2022-06-05 02:29:53.419094', '2', 'ServiceTime object (2)', 2, '[{\"changed\": {\"fields\": [\"Open\"]}}]', 12, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int NOT NULL,
  `app_label` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(15, 'cafe', 'admin'),
(10, 'cafe', 'carousel'),
(7, 'cafe', 'category'),
(8, 'cafe', 'customer'),
(9, 'cafe', 'items'),
(13, 'cafe', 'managecart'),
(11, 'cafe', 'order'),
(12, 'cafe', 'servicetime'),
(14, 'cafe', 'static'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL,
  `app` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-05-15 15:05:15.351300'),
(2, 'auth', '0001_initial', '2022-05-15 15:05:17.148288'),
(3, 'admin', '0001_initial', '2022-05-15 15:05:17.601440'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-05-15 15:05:17.632693'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-05-15 15:05:17.648319'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-05-15 15:05:17.976465'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-05-15 15:05:18.163986'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-05-15 15:05:18.382739'),
(9, 'auth', '0004_alter_user_username_opts', '2022-05-15 15:05:18.413991'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-05-15 15:05:18.648381'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-05-15 15:05:18.664008'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-05-15 15:05:18.679636'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-05-15 15:05:18.882770'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-05-15 15:05:19.023403'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-05-15 15:05:19.085910'),
(16, 'auth', '0011_update_proxy_permissions', '2022-05-15 15:05:19.101535'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-05-15 15:05:19.414056'),
(18, 'cafe', '0001_initial', '2022-05-15 15:05:19.476558'),
(19, 'cafe', '0002_customer', '2022-05-15 15:05:19.554688'),
(20, 'cafe', '0003_items', '2022-05-15 15:05:19.773453'),
(21, 'cafe', '0004_alter_items_price', '2022-05-15 15:05:19.789080'),
(22, 'cafe', '0005_customer_token', '2022-05-15 15:05:19.851584'),
(23, 'cafe', '0006_alter_customer_mobile', '2022-05-15 15:05:19.960965'),
(24, 'cafe', '0007_carousel_alter_items_price', '2022-05-15 15:05:20.039096'),
(25, 'cafe', '0008_carousel_message', '2022-05-15 15:05:20.101599'),
(26, 'cafe', '0009_alter_carousel_message', '2022-05-15 15:05:20.117228'),
(27, 'cafe', '0010_alter_carousel_message_order', '2022-05-15 15:05:20.601633'),
(28, 'cafe', '0011_order_address_order_mobile', '2022-05-15 15:05:20.726643'),
(29, 'cafe', '0012_order_status', '2022-05-15 15:05:20.804771'),
(30, 'cafe', '0013_order_payment_method', '2022-05-15 15:05:20.867273'),
(31, 'cafe', '0014_order_total', '2022-05-15 15:05:20.961031'),
(32, 'cafe', '0015_servicetime', '2022-05-15 15:05:21.039161'),
(33, 'cafe', '0016_servicetime_edit', '2022-05-15 15:05:21.101666'),
(34, 'cafe', '0017_cartmodel', '2022-05-15 15:05:21.570444'),
(35, 'cafe', '0018_managecart_delete_cartmodel', '2022-05-15 15:05:21.945469'),
(36, 'cafe', '0019_order_studentid', '2022-05-15 15:05:21.992347'),
(37, 'sessions', '0001_initial', '2022-05-15 15:05:22.086103'),
(38, 'cafe', '0020_remove_order_address', '2022-05-15 15:26:42.308607'),
(39, 'cafe', '0021_items_stock', '2022-05-18 15:25:03.492041'),
(40, 'cafe', '0022_alter_order_status', '2022-05-19 06:54:48.933784'),
(41, 'cafe', '0023_alter_order_status', '2022-05-19 07:07:46.921310'),
(42, 'cafe', '0024_static', '2022-06-03 14:54:05.339961'),
(43, 'cafe', '0025_delete_static', '2023-03-20 13:20:32.532679'),
(44, 'cafe', '0026_admin', '2023-03-20 13:20:32.570023'),
(45, 'cafe', '0027_remove_admin_username', '2023-03-20 13:20:32.600097');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('0zwy8ta7ut1r2tfdhgpluwtz5j3ie6tm', 'e30:1q8bSQ:iG7PYjEDakeuGgszMbAMutyPd78TeDHmzEYRlNEVEds', '2023-06-26 06:55:18.230114'),
('5tfzxwz99melp30yw3qm2lcxr64l7bqo', 'e30:1nwG7z:bO6whdIyFNFyTkxZCgidcBk7kwtRTt8MqKjCQrqfDp8', '2022-06-15 04:38:39.208614'),
('947tz3g38kj71r0o47dl80ubfb8iy79c', 'e30:1nqGOR:-c6NVpOG_BmPp73FYNn8dM-v-iplmgsIp3oHp77ZOaI', '2022-05-29 15:42:51.564142'),
('ah0y875lyjmam0jfrxi3yj25hvvegrpj', '.eJyrVkpMyc3Miy9OLS7OzM-LT81NzMxRssorzcnRQZPKS8xNhcjUAgA7pRTW:1peFdR:octsK6u0MGcfRrNuc7ATsfCP_qGrwKu52al09NWpSRE', '2023-04-03 13:33:13.479689'),
('c8gj2dfh4iu2xjjah6qmmdb4gazeid0a', '.eJyrVkpMyc3Miy9OLS7OzM-LT81NzMxRslJKKkrMSs1LKUrUKyjOLHFIBwnrJefnKumgachLzE0FqneCqVcIzsxLz1CqBQDb-CDY:1pfBiY:aV4E-7CFlwW4F3ZADLBJth11304LglKidLZvikFCBWA', '2023-04-06 03:34:22.380703'),
('fkojpop872p43vmurszop2ozeq4fd20r', '.eJyrVkpMyc3Miy9OLS7OzM-LT81NzMxRslJKKkrMSs1LKUrUKyjOLHFIBwnrJefnKumgachLzE0FqneCqVcIzsxLz1CqBQDb-CDY:1ppLRf:NWCLa6PPow9tjAIk5Q8mqu8WQYmh2VH87cwuC53AOE8', '2023-05-04 03:58:55.785520'),
('j9qhj7epd6aiuk9oh3tccmoolt34d3hh', '.eJxVTr0OgyAQfpWGuTFQFbFT496pD2Du4FCsQII6NX33YuJgt_vu-_2wHrZ17LeFUu8MuzPBrucfgn5T2AkzQRhioWNYk8NilxQHuxTPaGjuDu1fwAjLmN28KqFVN5Q1b1EpS03daMAKtFD5RFHKCoEE2LpE29aSExrLUUgj9E1SDtXbskZ_7BQnTB7cnDvAeBcew47yTH-2BPCUFV2CKS9McHm5MIzs-wOCklYt:1nxfcQ:YQYwaEeTp4lsQztq9ROHN0k8mgj3eA-vVHKeIyaceGw', '2022-06-19 02:03:54.066332'),
('ljohlwjk6hciseao1y3yngnb6yr0eoy1', 'e30:1q8dxm:IK-6FJo0p4p5WufFgeTeFsVX91RdfS1hJAXptzjOIDY', '2023-06-26 09:35:50.260612'),
('tntpbss95568n9wcbc6k8yuk5xry924g', '.eJyrVkpMyc3Miy9OLS7OzM-LT81NzMxRssorzcnRQZPKS8xNhcjUAgA7pRTW:1pzaZh:42B0gg-W9rrVB9qW1rfbZddzofMkFkNWmLQYJDzCd7c', '2023-06-01 10:09:33.451291'),
('ya5qj4k4yd9z34s2649wi8q0d6ao0p80', '.eJxVjDsOwyAQRO9CHSEwH0PK9D4D2oUlOIlAMnYV5e6xJRdJN5r3Zt4swLaWsHVawpzYlUl2-e0Q4pPqAdID6r3x2Oq6zMgPhZ-086klet1O9--gQC_7WmgF3g1ojfDoXKbRjBFQQ5RujyiV1QgkIRuF2RsrCFMWKG2ScbDEPl_cFTgr:1oSAS8:_jKSEqxEGHd4QWcTbr74yuqDJR0XK3ageewrGLKny5w', '2022-09-11 05:03:20.770931');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `cafe_admin`
--
ALTER TABLE `cafe_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cafe_carousel`
--
ALTER TABLE `cafe_carousel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cafe_category`
--
ALTER TABLE `cafe_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cafe_customer`
--
ALTER TABLE `cafe_customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cafe_items`
--
ALTER TABLE `cafe_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cafe_items_category_id_3158ad94_fk_cafe_category_id` (`category_id`);

--
-- Indexes for table `cafe_managecart`
--
ALTER TABLE `cafe_managecart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cafe_managecart_customer_id_10cd036a_fk_cafe_customer_id` (`customer_id`),
  ADD KEY `cafe_managecart_item_id_26b8b7b9_fk_cafe_items_id` (`item_id`);

--
-- Indexes for table `cafe_order`
--
ALTER TABLE `cafe_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cafe_order_customer_id_2b58bf2d_fk_cafe_customer_id` (`customer_id`),
  ADD KEY `cafe_order_item_id_1edd8ef8_fk_cafe_items_id` (`item_id`);

--
-- Indexes for table `cafe_servicetime`
--
ALTER TABLE `cafe_servicetime`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cafe_admin`
--
ALTER TABLE `cafe_admin`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cafe_carousel`
--
ALTER TABLE `cafe_carousel`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cafe_category`
--
ALTER TABLE `cafe_category`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cafe_customer`
--
ALTER TABLE `cafe_customer`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `cafe_items`
--
ALTER TABLE `cafe_items`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `cafe_managecart`
--
ALTER TABLE `cafe_managecart`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `cafe_order`
--
ALTER TABLE `cafe_order`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `cafe_servicetime`
--
ALTER TABLE `cafe_servicetime`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

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
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `cafe_items`
--
ALTER TABLE `cafe_items`
  ADD CONSTRAINT `cafe_items_category_id_3158ad94_fk_cafe_category_id` FOREIGN KEY (`category_id`) REFERENCES `cafe_category` (`id`);

--
-- Constraints for table `cafe_managecart`
--
ALTER TABLE `cafe_managecart`
  ADD CONSTRAINT `cafe_managecart_customer_id_10cd036a_fk_cafe_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `cafe_customer` (`id`),
  ADD CONSTRAINT `cafe_managecart_item_id_26b8b7b9_fk_cafe_items_id` FOREIGN KEY (`item_id`) REFERENCES `cafe_items` (`id`);

--
-- Constraints for table `cafe_order`
--
ALTER TABLE `cafe_order`
  ADD CONSTRAINT `cafe_order_customer_id_2b58bf2d_fk_cafe_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `cafe_customer` (`id`),
  ADD CONSTRAINT `cafe_order_item_id_1edd8ef8_fk_cafe_items_id` FOREIGN KEY (`item_id`) REFERENCES `cafe_items` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
