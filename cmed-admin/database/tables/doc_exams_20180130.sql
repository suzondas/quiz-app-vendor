-- phpMyAdmin SQL Dump
-- version 4.3.8
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 30, 2018 at 12:00 AM
-- Server version: 5.5.51-38.2
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cmedbd_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `doc_exams`
--

CREATE TABLE IF NOT EXISTS `doc_exams` (
  `id` int(11) NOT NULL,
  `exam_id` int(11) DEFAULT NULL,
  `doc_id` int(11) DEFAULT NULL,
  `year` int(4) DEFAULT NULL,
  `session` int(2) DEFAULT NULL,
  `module_id` int(11) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `answers` text,
  `correct` text,
  `wrong` text,
  `not_answered` text,
  `total_mark` int(11) DEFAULT '10',
  `mark` decimal(10,2) DEFAULT '10.00',
  `correct_mark` decimal(10,2) DEFAULT NULL,
  `worng_mark` decimal(10,2) DEFAULT NULL,
  `final_mark` decimal(10,2) DEFAULT NULL,
  `attend_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `exam_type_pos` int(11) DEFAULT NULL,
  `subject_pos` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `duration` int(11) DEFAULT '30',
  `wrong_mark` text,
  `open_date` datetime DEFAULT NULL,
  `close_date` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `doc_exams`
--

INSERT INTO `doc_exams` (`doc_id`, `answers`, `correct_mark`, `start_time`, `end_time`, `status`) VALUES
(19, '[{"5":{"A":"T","B":"T","C":"T","D":"F","E":"F"}},{"6":{"A":"F","B":"F","C":"T","D":"T","E":"F"}},{"7":{"A":"T","B":"F","C":"T","D":"T","E":"T"}},{"8":{"A":"F","B":"F","C":"T","D":"T","E":"T"}}]', '9.50', '20:30:14', '20:33:20', 1),
(21, '[{"5":{"A":"T","B":"T","C":"T","D":"F","E":"F"}},{"6":{"A":"F","B":"F","C":"T","D":"T","E":"T"}},{"7":{"A":"T","B":"F","C":"T","D":"T","E":"F"}},{"8":{"A":"F","B":"F","C":"T","D":"T","E":"T"}}]', '9.50', '10:40:50', '10:44:28', 1),
(25, '[{"5":{"A":"T","B":"F","C":"T","D":"F","E":"F"}},{"6":{"A":"F","B":"F","C":"T","D":"T","E":"F"}},{"7":{"A":"T","B":"F","C":"T","D":"T","E":"F"}},{"8":{"A":"F","B":"F","C":"T","D":"T","E":"T"}}]', '9.50', '09:03:44', '09:13:02', 1),
(28, '[{"5":{"A":"T","B":"T","C":"T","D":"F","E":"F"}},{"6":{"A":"F","B":"F","C":"T","D":"F","E":"T"}},{"7":{"A":"T","B":"F","C":"T","D":"T","E":"F"}},{"8":{"A":"F","B":"F","C":"T","D":"T","E":"T"}}]', '9.00', '16:06:23', '16:12:47', 1),
(30, '[{"6":{"A":"F","B":"F","C":"T","D":"F","E":"T"}},{"7":{"A":"T","B":"F","C":"T","D":"T","E":"F"}},{"8":{"A":"F","B":"F","C":"T","D":"T","E":"T"}},{"5":{"A":"T","B":"T","C":"T","D":"F","E":"F"}}]', '9.00', '12:39:56', '12:46:31', 1),
(31, '[{"5":{"A":"T","B":"T","C":"T","D":"F","E":"F"}},{"6":{"A":"F","B":"F","C":"T","D":"F","E":"F"}},{"7":{"A":"T","B":"F","C":"T","D":"T","E":"T"}},{"8":{"A":"F","B":"T","C":"T","D":"T","E":"T"}}]', '8.50', '10:21:17', '10:36:22', 1),
(32, '[{"5":{"A":"T","B":"T","C":"T","D":"F","E":"F"}},{"6":{"A":"F","B":"F","C":"T","D":"F","E":"F"}},{"7":{"A":"T","B":"F","C":"T","D":"T","E":"F"}},{"8":{"A":"F","B":"F","C":"T","D":"T","E":"T"}}]', '9.50', '22:26:33', '22:38:52', 1),
(35, '[{"5":{"A":"T","B":"F","C":"T","D":"F","E":"F"}},{"6":{"A":"F","B":"F","C":"T","D":"F","E":"F"}},{"7":{"A":"T","B":"F","C":"T","D":"T","E":"F"}},{"8":{"A":"F","B":"F","C":"T","D":"T","E":"T"}}]', '9.00', '12:02:00', '12:06:41', 1),
(37, '[{"5":{"A":"T","B":"T","C":"T","D":"F","E":"F"}},{"6":{"A":"F","B":"F","C":"T","D":"T","E":"T"}},{"7":{"A":"T","B":"F","C":"T","D":"T","E":"F"}},{"8":{"A":"F","B":"F","C":"T","D":"T","E":"T"}}]', '9.50', '13:20:43', '13:25:36', 1),
(22, '[{"5":{"A":"T","B":"F","C":"T","D":"F","E":"F"}},{"6":{"A":"F","B":"F","C":"T","D":"F","E":"T"}},{"7":{"A":"T","B":"F","C":"T","D":"T","E":"F"}},{"8":{"A":"F","B":"F","C":"T","D":"T","E":"T"}}]', '8.50', '11:01:24', '10:55:04', 8),
(23, '[{"5":{"A":"T","B":"T","C":"T","D":"F","E":"F"}},{"6":{"A":"F","B":"F","C":"T","D":"F","E":"T"}},{"7":{"A":"T","B":"F","C":"T","D":"T","E":"F"}},{"8":{"A":"F","B":"F","C":"T","D":"T","E":"T"}}]', '9.00', '10:01:23', '09:58:30', 8),
(24, '[{"5":{"A":"T","B":"T","C":"T","D":"F","E":"F"}},{"6":{"A":"F","B":"F","C":"T","D":"T","E":"F"}},{"7":{"A":"T","B":"F","C":"T","D":"T","E":"F"}},{"8":{"A":"F","B":"F","C":"T","D":"T","E":"T"}}]', '10.00', '19:44:15', '19:43:20', 8),
(27, '[{"5":{"A":"T","B":"T","C":"T","D":"F","E":"F"}},{"6":{"A":"F","B":"F","C":"T","D":"F","E":"T"}},{"7":{"A":"T","B":"F","C":"T","D":"T","E":"F"}},{"8":{"A":"F","B":"F","C":"T","D":"T","E":"T"}}]', '9.00', '10:17:17', '10:15:15', 8),
(29, '[{"5":{"A":"T","B":"T","C":"T","D":"F","E":"F"}},{"6":{"A":"F","B":"F","C":"T","D":"F","E":"T"}},{"7":{"A":"T","B":"F","C":"T","D":"T","E":"F"}},{"8":{"A":"F","B":"F","C":"T","D":"T","E":"T"}}]', '9.00', '08:23:33', '08:20:02', 8),
(34, '[{"5":{"A":"T","B":"T","C":"T","D":"F","E":"F"}},{"6":{"A":"F","B":"F","C":"T","D":"F","E":"T"}},{"7":{"A":"T","B":"F","C":"T","D":"T","E":"F"}},{"8":{"C":"T","D":"T","E":"T"}}]', '8.00', '10:37:35', '10:36:18', 8),
(36, '[{"5":{"A":"T","B":"F","C":"T","D":"F","E":"F"}},{"6":{"A":"F","B":"F","C":"T","D":"F","E":"F"}},{"7":{"A":"T","B":"F","C":"T","D":"T","E":"F"}},{"8":{"A":"F","B":"F","C":"T","D":"T","E":"T"}}]', '9.00', '12:07:34', '12:06:46', 8),
(38, '[{"5":{"A":"T","B":"T","C":"T","D":"F","E":"F"}},{"6":{"A":"F","B":"F","C":"T","D":"F","E":"F"}},{"7":{"A":"T","B":"F","C":"T","D":"T","E":"F"}},{"8":{"A":"F","B":"F","C":"T","D":"T","E":"T"}}]', '9.50', '16:18:18', '16:17:29', 8),
(39, '[{"5":{"A":"T","B":"T","C":"T","D":"T","E":"F"}},{"6":{"A":"T","B":"F","C":"T","D":"T","E":"T"}},{"7":{"A":"T","B":"T","C":"F","D":"T","E":"T"}},{"8":{"C":"T","D":"T","E":"T"}}]', '6.00', '08:52:14', '08:50:31', 8),
(40, '[{"5":{"A":"T","B":"T","C":"T","D":"F","E":"F"}},{"6":{"A":"F","B":"F","C":"T","D":"T","E":"F"}},{"7":{"A":"T","B":"F","C":"T","D":"T","E":"F"}},{"8":{"A":"F","B":"F","C":"T","D":"T","E":"T"}}]', '10.00', '21:05:08', '21:04:11', 8),
(33, NULL, NULL, NULL, NULL, 9);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doc_exams`
--
ALTER TABLE `doc_exams`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `doc_exams`
--
ALTER TABLE `doc_exams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=61;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
