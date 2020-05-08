-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 08, 2020 at 10:54 AM
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

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `createddate`) VALUES
(1, 'None', '2020-05-07'),
(2, 'SysAdm', '2020-05-07');

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

CREATE TABLE `requests` (
  `id` int(255) NOT NULL,
  `topic` text NOT NULL,
  `description` text NOT NULL,
  `createddate` text NOT NULL,
  `solution` text NOT NULL DEFAULT '',
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

INSERT INTO `requests` (`id`, `topic`, `description`, `createddate`, `solution`, `author`, `status`, `priority`, `requestgroup`, `requesttype`, `assigned`) VALUES
(1, 'asdasdasd', '<p>adasd</p><p><u>adsasd</u></p><p><b>asdasdasd</b></p>', '2020-05-03', '', 1, 0, 1, 0, 0, 0),
(2, 'asd', '', '2020-05-03 14:08', '', 1, 0, 1, 0, 0, 0),
(3, 'asdasd', '<p><u>sdfsdfsdf</u></p>', '2020-05-03 14:16', '', 1, 0, 2, 0, 0, 0),
(4, 'adsasfasf', '<p><b>sdfsdgdsg</b></p>', '2020-05-03 14:23', '', 1, 0, 2, 0, 2, 0),
(5, 'test', '<p>asdasdasd</p>', '2020-05-03 18:42', '', 1, 0, 3, 0, 1, 0),
(6, 'test', '<p>asdasdasd</p>', '2020-05-03 18:43', '', 1, 0, 1, 0, 1, 0),
(7, 'new rquest asdasasd', '<p><b>asdasd ad as d<u>as das as d</u></b></p><ol><li><b><u>asdasdasd</u></b></li><li><b><u>asd</u></b></li><li><b><u>asd</u></b></li><li><b><u>sfddssfdfs</u></b></li></ol>', '2020-05-03 20:11', '', 1, 0, 2, 0, 1, 0),
(8, 'Test request for check', '<p><b>Teststesdfsdf</b></p><p><b><u>asdasdasdasd</u></b></p><ol><li><u>asdasdagsdasd</u></li><li><u>asdfasdfsdafa</u></li><li><u>asdgfdsfasdfsdf</u></li></ol><p><br></p>', '2020-05-03 20:37', '', 1, 1, 3, 2, 1, 1),
(9, 'test', '<p>sdfsdf</p><ol><li>sdf</li><li>sdfgggf</li><li><b>jghgggg</b></li></ol>', '2020-05-07 15:35', 'Some solution for the given problem', 1, 0, 1, 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `requestshistory`
--

CREATE TABLE `requestshistory` (
  `id` int(255) NOT NULL,
  `requestid` int(255) NOT NULL,
  `action` text NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `requeststatuses`
--

CREATE TABLE `requeststatuses` (
  `id` int(32) NOT NULL,
  `name` text NOT NULL,
  `createddate` date NOT NULL,
  `color` int(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `requeststatuses`
--

INSERT INTO `requeststatuses` (`id`, `name`, `createddate`, `color`) VALUES
(1, 'None', '2020-05-07', 0),
(2, 'Open', '2020-05-07', 1),
(3, 'Closed', '2020-05-07', 2),
(4, 'Waiting', '2020-05-07', 3),
(5, 'In Progress', '2020-05-07', 4),
(6, 'Rejected', '2020-05-06', 5);

-- --------------------------------------------------------

--
-- Table structure for table `requeststypes`
--

CREATE TABLE `requeststypes` (
  `id` int(16) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `createddate` varchar(255) NOT NULL,
  `needapproval` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `requeststypes`
--

INSERT INTO `requeststypes` (`id`, `name`, `description`, `createddate`, `needapproval`) VALUES
(1, 'New Request', 'Create new standard request for IT Support', 'on Apr 24, 2020 09:32 PM', 0),
(2, 'New IT request', 'New IT request with manager approval', 'in 01-05-2020 23:45', 1);

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
(1, 'admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'adminadmin.com', 'Administrator', '2020-05-08 12:12', '', 1, '156f270f22c1f4413f3618374bce0f57416e414ffec7d90f3e0215e29ca7dd1e', 'en');

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
-- Indexes for table `requestshistory`
--
ALTER TABLE `requestshistory`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `id_2` (`id`);

--
-- Indexes for table `requeststatuses`
--
ALTER TABLE `requeststatuses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `id_2` (`id`);

--
-- Indexes for table `requeststypes`
--
ALTER TABLE `requeststypes`
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
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `requestshistory`
--
ALTER TABLE `requestshistory`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `requeststatuses`
--
ALTER TABLE `requeststatuses`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `requeststypes`
--
ALTER TABLE `requeststypes`
  MODIFY `id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
