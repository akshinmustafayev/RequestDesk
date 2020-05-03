-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 03, 2020 at 06:24 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `requestdesk`
--

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` int(32) NOT NULL,
  `name` text NOT NULL,
  `createddate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

CREATE TABLE `requests` (
  `id` int(255) NOT NULL,
  `topic` text NOT NULL,
  `description` text NOT NULL,
  `createddate` text NOT NULL,
  `author` int(32) NOT NULL,
  `status` int(32) NOT NULL,
  `priority` int(3) NOT NULL,
  `requestgroup` int(32) NOT NULL DEFAULT 0,
  `requesttype` int(6) NOT NULL DEFAULT 0,
  `assigned` int(32) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `requests`
--

INSERT INTO `requests` (`id`, `topic`, `description`, `createddate`, `author`, `status`, `priority`, `requestgroup`, `requesttype`, `assigned`) VALUES
(1, 'asdasdasd', '<p>adasd</p><p><u>adsasd</u></p><p><b>asdasdasd</b></p>', '2020-05-03', 1, 0, 1, 0, 0, 0),
(2, 'asd', '', '2020-05-03 14:08', 1, 0, 1, 0, 0, 0),
(3, 'asdasd', '<p><u>sdfsdfsdf</u></p>', '2020-05-03 14:16', 1, 0, 2, 0, 0, 0),
(4, 'adsasfasf', '<p><b>sdfsdgdsg</b></p>', '2020-05-03 14:23', 1, 0, 2, 0, 2, 0),
(5, 'test', '<p>asdasdasd</p>', '2020-05-03 18:42', 1, 0, 3, 0, 1, 0),
(6, 'test', '<p>asdasdasd</p>', '2020-05-03 18:43', 1, 0, 1, 0, 1, 0),
(7, 'new rquest asdasasd', '<p><b>asdasd ad as d<u>as das as d</u></b></p><ol><li><b><u>asdasdasd</u></b></li><li><b><u>asd</u></b></li><li><b><u>asd</u></b></li><li><b><u>sfddssfdfs</u></b></li></ol>', '2020-05-03 20:11', 1, 0, 2, 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `requesttypes`
--

CREATE TABLE `requesttypes` (
  `id` int(16) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `createddate` varchar(255) NOT NULL,
  `needapproval` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `requesttypes`
--

INSERT INTO `requesttypes` (`id`, `name`, `description`, `createddate`, `needapproval`) VALUES
(1, 'New Request', 'Create new standard request for IT Support', 'on Apr 24, 2020 09:32 PM', 0),
(2, 'New IT request', 'New IT request with manager approval', 'in 01-05-2020 23:45', 1);

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

CREATE TABLE `statuses` (
  `id` int(32) NOT NULL,
  `name` text NOT NULL,
  `createddate` date NOT NULL,
  `color` int(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(32) NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `fullname` text NOT NULL,
  `lastlogindate` varchar(255) NOT NULL,
  `passwordsalt` varchar(255) NOT NULL,
  `userrole` int(5) NOT NULL,
  `session` varchar(255) NOT NULL,
  `language` varchar(10) NOT NULL DEFAULT 'en'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `login`, `password`, `email`, `fullname`, `lastlogindate`, `passwordsalt`, `userrole`, `session`, `language`) VALUES
(1, 'admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'adminadmin.com', 'Administrator', '2020-05-03 19:25', '', 1, 'f3d94c61ea4903dd6f4fa5ec7e9cf9bd036840046662b7b3988ebe9a641d0332', 'en');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `id_2` (`id`);

--
-- Indexes for table `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `id_2` (`id`);

--
-- Indexes for table `requesttypes`
--
ALTER TABLE `requesttypes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `id_2` (`id`);

--
-- Indexes for table `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `id_2` (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `id_2` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `requesttypes`
--
ALTER TABLE `requesttypes`
  MODIFY `id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `statuses`
--
ALTER TABLE `statuses`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
