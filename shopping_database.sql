-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 10, 2019 at 10:44 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopping_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `category_items`
--

CREATE TABLE `category_items` (
  `id` int(4) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category_items`
--

INSERT INTO `category_items` (`id`, `name`) VALUES
(1, 'Clothes'),
(5, 'Electronics'),
(3, 'Furniture'),
(2, 'Grocery'),
(4, 'Jewellery');

-- --------------------------------------------------------

--
-- Table structure for table `shopping_cart`
--

CREATE TABLE `shopping_cart` (
  `id` int(4) NOT NULL,
  `item_id` int(4) NOT NULL,
  `quantity` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shopping_cart`
--

INSERT INTO `shopping_cart` (`id`, `item_id`, `quantity`) VALUES
(1, 8, 2),
(2, 3, 1),
(3, 6, 5);

-- --------------------------------------------------------

--
-- Table structure for table `shopping_items`
--

CREATE TABLE `shopping_items` (
  `id` int(4) NOT NULL,
  `name` varchar(20) NOT NULL,
  `price` double(10,2) NOT NULL,
  `category_id` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shopping_items`
--

INSERT INTO `shopping_items` (`id`, `name`, `price`, `category_id`) VALUES
(3, 'iPhone X', 90000.00, 5),
(4, 'iPhone XR', 72000.00, 5),
(5, 'L.G TV', 50000.00, 5),
(6, 'Kissan Ketchup', 250.00, 2),
(7, 'Study Table', 1500.00, 3),
(8, 'DENIM Jeans', 1000.00, 1),
(9, 'Dove Soap', 50.00, 2),
(10, 'Lux Soap', 45.00, 2),
(11, 'DENIM Jacket', 2000.00, 1),
(12, 'DENIM Shirt', 1000.00, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category_items`
--
ALTER TABLE `category_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `shopping_cart`
--
ALTER TABLE `shopping_cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_id_key` (`item_id`);

--
-- Indexes for table `shopping_items`
--
ALTER TABLE `shopping_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `category_id_key` (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category_items`
--
ALTER TABLE `category_items`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `shopping_cart`
--
ALTER TABLE `shopping_cart`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shopping_items`
--
ALTER TABLE `shopping_items`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `shopping_cart`
--
ALTER TABLE `shopping_cart`
  ADD CONSTRAINT `item_id_key` FOREIGN KEY (`item_id`) REFERENCES `shopping_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shopping_items`
--
ALTER TABLE `shopping_items`
  ADD CONSTRAINT `category_id_key` FOREIGN KEY (`category_id`) REFERENCES `category_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
