-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 15, 2020 at 12:20 PM
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
(2, 'SysAdm', '2020-05-07'),
(3, 'Business Analytics', '2020-08-07'),
(4, 'Programmers', '2020-09-07'),
(5, 'Another group', '2020-06-09');

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

CREATE TABLE `requests` (
  `id` int(255) NOT NULL,
  `topic` text NOT NULL DEFAULT '',
  `description` text NOT NULL DEFAULT '',
  `createddate` text NOT NULL DEFAULT '',
  `solution` text NOT NULL DEFAULT '',
  `author` int(32) NOT NULL,
  `status` int(32) NOT NULL,
  `priority` int(3) NOT NULL,
  `usergroup` int(32) NOT NULL DEFAULT 0,
  `requesttype` int(6) NOT NULL DEFAULT 0,
  `assigned` int(32) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `requests`
--

INSERT INTO `requests` (`id`, `topic`, `description`, `createddate`, `solution`, `author`, `status`, `priority`, `usergroup`, `requesttype`, `assigned`) VALUES
(1, 'asdasdasd', '<p>adasd</p><p><u>adsasd</u></p><p><b>asdasdasd</b></p>', '2020-05-03', '', 1, 6, 1, 0, 0, 0),
(2, 'asd', '', '2020-05-03 14:08', '', 2, 2, 1, 0, 0, 0),
(3, 'asdasd', '<p><u>sdfsdfsdf</u></p>', '2020-05-03 14:16', '', 1, 0, 2, 0, 0, 0),
(4, 'adsasfasf', '<p><b>sdfsdgdsg</b></p>', '2020-05-03 14:23', '', 2, 0, 2, 0, 2, 0),
(5, 'test', '<p>asdasdasd</p>', '2020-05-03 18:42', '', 1, 0, 3, 0, 1, 0),
(6, 'test', '<p>asdasdasd</p>', '2020-05-03 18:43', '', 1, 3, 1, 0, 1, 0),
(7, 'new rquest asdasasd', '<p><b>asdasd ad as d<u>as das as d</u></b></p><ol><li><b><u>asdasdasd</u></b></li><li><b><u>asd</u></b></li><li><b><u>asd</u></b></li><li><b><u>sfddssfdfs</u></b></li></ol>', '2020-05-03 20:11', '', 2, 0, 2, 0, 1, 0),
(8, 'Test request for check', '<p><b>Teststesdfsdf</b></p><p><b><u>asdasdasdasd</u></b></p><ol><li><u>asdasdagsdasd</u></li><li><u>asdfasdfsdafa</u></li><li><u>asdgfdsfasdfsdf</u></li></ol><p><br></p>', '2020-05-03 20:37', '', 1, 1, 3, 2, 1, 1),
(9, 'test', '<p>sdfsdf</p><ol><li>sdf</li><li>sdfgggf</li><li><b>jghgggg</b></li></ol>', '2020-05-07 15:35', 'Some solution for the given problem', 1, 5, 1, 0, 1, 0),
(10, 'New SysAdm request', '<p>need help</p><ol><li><u>server does not workasdasd</u></li><li><u>asdasd</u></li></ol><p style=\"text-align: right; \"><u>asdasdasd</u></p>', '2020-05-12 13:58', '', 1, 0, 1, 2, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `requestshistory`
--

CREATE TABLE `requestshistory` (
  `id` int(255) NOT NULL,
  `requestid` int(255) NOT NULL,
  `action` text NOT NULL DEFAULT '',
  `date` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `requestshistory`
--

INSERT INTO `requestshistory` (`id`, `requestid`, `action`, `date`) VALUES
(1, 9, 'Request Created', '09.05.2020 10:10'),
(2, 9, 'Request Assigned', '06.01.2022 10:10'),
(3, 2, 'Request Created', '01.08.2020 10:10');

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
-- Table structure for table `usergroups`
--

CREATE TABLE `usergroups` (
  `id` int(32) NOT NULL,
  `userid` int(32) NOT NULL,
  `groupid` int(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usergroups`
--

INSERT INTO `usergroups` (`id`, `userid`, `groupid`) VALUES
(1, 1, 2),
(2, 1, 4),
(3, 2, 3),
(4, 1, 10);

-- --------------------------------------------------------

--
-- Table structure for table `userroles`
--

CREATE TABLE `userroles` (
  `id` int(32) NOT NULL,
  `userid` int(32) NOT NULL,
  `userrole` int(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `userroles`
--

INSERT INTO `userroles` (`id`, `userid`, `userrole`) VALUES
(1, 1, 4),
(2, 2, 1),
(3, 3, 1);

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
  `session` varchar(255) NOT NULL,
  `language` varchar(10) NOT NULL DEFAULT 'en',
  `requestsgroup` int(32) NOT NULL DEFAULT -1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `login`, `password`, `email`, `fullname`, `lastlogindate`, `passwordsalt`, `session`, `language`, `requestsgroup`) VALUES
(1, 'admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'adminadmin.com', 'Administrator', '2020-05-15 13:56', '', 'a4819adae4613a311d60cd89ed726aadf0bcf3a415d49e5fdf79239c970914f3', 'en', 2),
(2, 'user', '4f8996da763b7a969b1028ee3007569eaf3a635486ddab211d512c85b9df8fb', 'user@org.com', 'Name F. Surname', '2020-05-15 13:56', '', 'ccbda6c999317498c8913161a68b7e60a23dcf5a7d92310cf09286e40f31a8a9', 'en', 3);

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
  ADD KEY `id_2` (`id`),
  ADD KEY `author` (`author`),
  ADD KEY `status` (`status`),
  ADD KEY `priority` (`priority`),
  ADD KEY `requestgroup` (`usergroup`),
  ADD KEY `requesttype` (`requesttype`),
  ADD KEY `assigned` (`assigned`);

--
-- Indexes for table `requestshistory`
--
ALTER TABLE `requestshistory`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `id_2` (`id`),
  ADD KEY `requestid` (`requestid`);

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
-- Indexes for table `usergroups`
--
ALTER TABLE `usergroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `id_2` (`id`),
  ADD KEY `userid` (`userid`),
  ADD KEY `groupid` (`groupid`);

--
-- Indexes for table `userroles`
--
ALTER TABLE `userroles`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `userid` (`userid`),
  ADD KEY `userrole` (`userrole`),
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
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `requestshistory`
--
ALTER TABLE `requestshistory`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
-- AUTO_INCREMENT for table `usergroups`
--
ALTER TABLE `usergroups`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `userroles`
--
ALTER TABLE `userroles`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
