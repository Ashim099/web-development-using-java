-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 10, 2024 at 08:42 AM
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
-- Database: `camerahub`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(16) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(32) NOT NULL,
  `create_time` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `email`, `password`, `create_time`) VALUES
('admin', 'admin@gmail.com', 'm B\"ÃÈ»é«ùÕs', '2024-05-02 07:46:52');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `UserId` int(11) NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `Contact` varchar(255) NOT NULL,
  `Email` varchar(225) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `ProfilePicture` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`UserId`, `FirstName`, `LastName`, `Contact`, `Email`, `Password`, `ProfilePicture`) VALUES
(2, 'Aashma', 'Rai', '9812331013', 'takhangma@gmail.com', 'òU erkãÑþf', '31623886436k8fy245nte9mvhatp25xtgeo9yijs4tszgespxbiuerwc4akludfnwr2vvyo8rldwg0nnxi5s6nsetyrcb6rkd7ql5oa5x3fw4hh.png'),
(3, 'asd', 'asd', 'asd', 'admasdasdin@gmail.com', 'èË|W(\0æÃÕOò ÿ', 'https___hybrismediaprod.blob.core.windows.net_sys-master-phoenix-images-container_haf_h7b_9720377704478_blade14-p10-black-500x500.png'),
(4, 'asd', 'asd', '234', 'sadsadasd@gmail.com', 'èË|W(\0æÃÕOò ÿ', 'DFF180E2SSB_Front-scaled.jpg'),
(5, 'admin', 'admin', 'asd', 'admin@gmail.com', 'm B\"ÃÈ»é«ùÕs\r', 'https___hybrismediaprod.blob.core.windows.net_sys-master-phoenix-images-container_hc6_h23_9481463562270_blade15-ch9-500x500.png'),
(6, 'Rishi', 'Neupane', 'abcd@gmail.com', 'abcd@gmail.com', 'rÊ±}\'óþÇ¡ðÊHÿ', 'logo.jpg'),
(7, 'Kishitiz', 'Neupane', 'rishi@gmail.com', 'rishi@gmail.com', 'rÊ±}\'óþÇ¡ðÊHÿ', 'logo.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `OrderId` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `UserName` varchar(225) NOT NULL,
  `UserEmail` varchar(225) NOT NULL,
  `Date` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`OrderId`, `id`, `UserName`, `UserEmail`, `Date`) VALUES
(2, 7, 'asd', 'admasdasdin@gmail.com', '2024-05-01'),
(3, 7, 'asd', 'admasdasdin@gmail.com', '2024-05-01'),
(4, 9, 'Rishi', 'abcd@gmail.com', '2024-05-08'),
(5, 9, 'Rishi', 'abcd@gmail.com', '2024-05-08'),
(6, 9, 'admin', 'admin@gmail.com', '2024-05-09'),
(7, 11, 'Rishi', 'abcd@gmail.com', '2024-05-09'),
(8, 27, 'Kishitiz', 'rishi@gmail.com', '2024-05-10'),
(9, 24, 'Kishitiz', 'rishi@gmail.com', '2024-05-10');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `productName` varchar(225) NOT NULL,
  `productCategory` varchar(225) NOT NULL,
  `productBrand` varchar(225) NOT NULL,
  `productPrice` int(11) NOT NULL,
  `productImage` varchar(225) NOT NULL,
  `stockLeft` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `productName`, `productCategory`, `productBrand`, `productPrice`, `productImage`, `stockLeft`) VALUES
(23, 'Canon EOS R7', 'mirrorless camera', 'cannon', 800, 'r7.png', 9),
(24, 'Canon EOS', 'mirrorless camera', 'cannon', 700, 'eos ms.jpeg', 9),
(25, 'Canon', 'cannon', 'cannon', 900, 'EOS.jpeg', 9),
(26, 'Stand', 'Camera stand', 'slik', 800, 'stand.jpg', 7),
(27, 'Canon lens 50 mm', 'lens', 'cannon', 150, 'lens.jpg', 5),
(28, 'Canon lens 50 ', 'cannon lens', 'cannon', 200, 'lens2.jpeg', 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`UserId`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`OrderId`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `UserId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `OrderId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
