-- phpMyAdmin SQL Dump
-- version 4.3.8
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 09, 2018 at 11:09 PM
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
-- Table structure for table `assigned_teacher_doctors`
--

CREATE TABLE IF NOT EXISTS `assigned_teacher_doctors` (
  `id` int(11) NOT NULL,
  `year` int(4) DEFAULT NULL,
  `session` int(2) DEFAULT NULL,
  `module` int(11) DEFAULT NULL,
  `teacher_id` varchar(30) DEFAULT NULL,
  `doc_id` varchar(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `assigned_teacher_doctors`
--

INSERT INTO `assigned_teacher_doctors` (`id`, `year`, `session`, `module`, `teacher_id`, `doc_id`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 2018, 1, 1, '17120004', '19', '2018-01-08 18:48:04', 'admin@bigm-bd.com', NULL, NULL),
(2, 2018, 1, 1, '17120004', '39', '2018-01-08 18:48:04', 'admin@bigm-bd.com', NULL, NULL),
(3, 2018, 1, 1, '17120004', '29', '2018-01-08 18:48:04', 'admin@bigm-bd.com', NULL, NULL),
(4, 2018, 1, 1, '17120004', '38', '2018-01-08 18:48:04', 'admin@bigm-bd.com', NULL, NULL),
(5, 2018, 1, 1, '17120004', '40', '2018-01-08 18:48:04', 'admin@bigm-bd.com', NULL, NULL),
(6, 2018, 1, 1, '17120009', '33', '2018-01-08 18:50:27', 'admin@bigm-bd.com', NULL, NULL),
(7, 2018, 1, 1, '17120009', '32', '2018-01-08 18:50:27', 'admin@bigm-bd.com', NULL, NULL),
(8, 2018, 1, 1, '17120009', '24', '2018-01-08 18:50:27', 'admin@bigm-bd.com', NULL, NULL),
(9, 2018, 1, 1, '17120009', '35', '2018-01-08 18:50:27', 'admin@bigm-bd.com', NULL, NULL),
(10, 2018, 1, 1, '17120009', '22', '2018-01-08 18:50:27', 'admin@bigm-bd.com', NULL, NULL),
(11, 2018, 1, 1, '17100003', '37', '2018-01-08 18:53:33', 'admin@bigm-bd.com', NULL, NULL),
(12, 2018, 1, 1, '17100003', '28', '2018-01-08 18:53:33', 'admin@bigm-bd.com', NULL, NULL),
(13, 2018, 1, 1, '17100003', '25', '2018-01-08 18:53:33', 'admin@bigm-bd.com', NULL, NULL),
(14, 2018, 1, 1, '17100003', '34', '2018-01-08 18:53:33', 'admin@bigm-bd.com', NULL, NULL),
(15, 2018, 1, 1, '17100003', '30', '2018-01-08 18:53:33', 'admin@bigm-bd.com', NULL, NULL),
(16, 2018, 1, 1, '17120006', '23', '2018-01-08 07:05:54', 'admin@bigm-bd.com', NULL, NULL),
(17, 2018, 1, 1, '17120006', '22', '2018-01-08 07:05:54', 'admin@bigm-bd.com', NULL, NULL),
(18, 2018, 1, 1, '17120006', '27', '2018-01-08 07:05:54', 'admin@bigm-bd.com', NULL, NULL),
(19, 2018, 1, 1, '17120006', '31', '2018-01-08 07:05:54', 'admin@bigm-bd.com', NULL, NULL),
(20, 2018, 1, 1, '17120006', '36', '2018-01-08 07:05:54', 'admin@bigm-bd.com', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `assignments`
--

CREATE TABLE IF NOT EXISTS `assignments` (
  `id` int(11) NOT NULL,
  `teacher_id` varchar(20) DEFAULT NULL,
  `doc_id` int(11) DEFAULT NULL,
  `module` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `unit` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `desc` text,
  `sent` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `mark` varchar(20) DEFAULT NULL,
  `mark_obtained` varchar(255) DEFAULT NULL,
  `mark_percentage` varchar(255) DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `assignments`
--

INSERT INTO `assignments` (`id`, `teacher_id`, `doc_id`, `module`, `type`, `unit`, `title`, `desc`, `sent`, `mark`, `mark_obtained`, `mark_percentage`, `attachment`, `status`) VALUES
(1, '17120009', 33, 1, NULL, 14, 'Test Subject', 'asfsafsaf', '2018-01-08 12:59:14', '40', NULL, NULL, 'upload/attachment/cropped-BK_icon.png', NULL),
(2, '17120009', 24, 1, NULL, 16, 'educational environment', '"Write a plan to improve educational environment and how to improve staff development program of your own department"\n\nwrite 800 to 1000 words\n send before 6pm on 19th Jan', '2018-01-08 15:10:36', '40', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `assignments_reply`
--

CREATE TABLE IF NOT EXISTS `assignments_reply` (
  `id` int(11) NOT NULL,
  `assignment_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `msg` text,
  `sent` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `attachment` varchar(255) DEFAULT NULL,
  `feedback_msg` text,
  `feedback_attachment` varchar(255) DEFAULT NULL,
  `feedback_at` datetime DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `assignments_reply`
--

INSERT INTO `assignments_reply` (`id`, `assignment_id`, `title`, `msg`, `sent`, `attachment`, `feedback_msg`, `feedback_attachment`, `feedback_at`, `status`) VALUES
(1, 1, 'learning environment', '3. Introduction:   An improved learning environment is very important for achieving a successful educational outcome. At the same time every institution should have a policy to develop their own strategy so that every faculty member can get a scope to develop their own carrier. Now a day, virtual learning gets a momentum to develop the environment of the institute. Like any other program. It is important to clearly define the goals and priorities in medical education courses.', '2018-01-08 14:59:33', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `assignments_resend`
--

CREATE TABLE IF NOT EXISTS `assignments_resend` (
  `id` int(11) NOT NULL,
  `assignment_id` int(11) NOT NULL,
  `teacher_id` varchar(20) DEFAULT NULL,
  `doc_id` int(11) DEFAULT NULL,
  `module` int(11) DEFAULT NULL,
  `unit` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `desc` text,
  `sent` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `attachment` varchar(255) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contact_msgs`
--

CREATE TABLE IF NOT EXISTS `contact_msgs` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `message` text,
  `sent_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `current_module`
--

CREATE TABLE IF NOT EXISTS `current_module` (
  `id` int(11) NOT NULL,
  `year` int(4) DEFAULT NULL,
  `session` int(11) DEFAULT NULL,
  `module_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `current_module`
--

INSERT INTO `current_module` (`id`, `year`, `session`, `module_id`, `created_at`, `created_by`) VALUES
(2, 2018, 1, 1, '2018-01-08 00:29:51', 'admin@bigm-bd.com');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE IF NOT EXISTS `department` (
  `id` int(11) NOT NULL,
  `dept_name` varchar(100) NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_date_time` datetime NOT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date_time` datetime DEFAULT NULL,
  `status` varchar(10) NOT NULL DEFAULT '1' COMMENT 'draft, completed'
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `dept_name`, `created_by`, `created_date_time`, `updated_by`, `updated_date_time`, `status`) VALUES
(1, 'department 1', '1', '2017-05-20 00:00:00', NULL, NULL, '1'),
(2, 'department 2', '1', '2017-05-20 00:00:00', NULL, NULL, '1');

-- --------------------------------------------------------

--
-- Table structure for table `designation`
--

CREATE TABLE IF NOT EXISTS `designation` (
  `id` int(11) NOT NULL,
  `des_name` varchar(100) NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_date_time` datetime NOT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date_time` datetime DEFAULT NULL,
  `status` varchar(10) NOT NULL DEFAULT '1' COMMENT 'draft, completed'
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `designation`
--

INSERT INTO `designation` (`id`, `des_name`, `created_by`, `created_date_time`, `updated_by`, `updated_date_time`, `status`) VALUES
(1, 'Designation 1', '1', '2017-05-22 00:00:00', NULL, NULL, '1'),
(2, 'Designation 2', '1', '2017-05-22 00:00:00', NULL, NULL, '1');

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE IF NOT EXISTS `districts` (
  `DISTRICT_ID` varchar(4) DEFAULT NULL,
  `DIVISION_ID` varchar(2) DEFAULT NULL,
  `DISTRICT_CODE` varchar(2) DEFAULT NULL,
  `DISTRICT_NAME` varchar(100) DEFAULT NULL,
  `BOARD` varchar(40) DEFAULT NULL,
  `BOARD_CODE` varchar(2) DEFAULT NULL,
  `MAD_BOARD_CODE` varchar(2) DEFAULT NULL,
  `ENTERED_BY` varchar(10) DEFAULT NULL,
  `ENTRY_TIMESTAMP` datetime DEFAULT NULL,
  `LAST_UPDATED_BY` varchar(10) DEFAULT NULL,
  `LAST_UPDATED_TIMESTAMP` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`DISTRICT_ID`, `DIVISION_ID`, `DISTRICT_CODE`, `DISTRICT_NAME`, `BOARD`, `BOARD_CODE`, `MAD_BOARD_CODE`, `ENTERED_BY`, `ENTRY_TIMESTAMP`, `LAST_UPDATED_BY`, `LAST_UPDATED_TIMESTAMP`) VALUES
('0401', '04', '01', 'BAGERHAT', 'JESSORE', '3', '7', NULL, NULL, NULL, NULL),
('0203', '02', '03', 'BANDARBAN', 'CHITTAGONG', '4', '7', NULL, NULL, NULL, NULL),
('0104', '01', '04', 'BARGUNA', 'BARISAL', '5', '7', NULL, NULL, NULL, NULL),
('0106', '01', '06', 'BARISAL', 'BARISAL', '5', '7', NULL, NULL, NULL, NULL),
('0109', '01', '09', 'BHOLA', 'BARISAL', '5', '7', NULL, NULL, NULL, NULL),
('0510', '05', '10', 'BOGRA', 'RAJSHAHI', '2', '7', NULL, NULL, NULL, NULL),
('0212', '02', '12', 'BRAHAMANBARIA', 'COMILLA', '1', '7', NULL, NULL, NULL, NULL),
('0213', '02', '13', 'CHANDPUR', 'COMILLA', '1', '7', NULL, NULL, NULL, NULL),
('0215', '02', '15', 'CHITTAGONG                ', 'CHITTAGONG', '4', '7', NULL, NULL, NULL, NULL),
('0418', '04', '18', 'CHUADANGA', 'JESSORE', '3', '7', NULL, NULL, NULL, NULL),
('0219', '02', '19', 'COMILLA', 'COMILLA', '1', '7', NULL, NULL, NULL, NULL),
('0222', '02', '22', 'COX''S BAZAR', 'CHITTAGONG', '4', '7', NULL, NULL, NULL, NULL),
('0326', '03', '26', 'DHAKA', 'DHAKA', '0', '7', NULL, NULL, NULL, NULL),
('0527', '07', '27', 'DINAJPUR', 'DINAJPUR', '8', '7', NULL, NULL, NULL, NULL),
('0329', '03', '29', 'FARIDPUR', 'DHAKA', '0', '7', NULL, NULL, NULL, NULL),
('0230', '02', '30', 'FENI', 'COMILLA', '1', '7', NULL, NULL, NULL, NULL),
('0532', '07', '32', 'GAIBANDHA', 'DINAJPUR', '8', '7', NULL, NULL, NULL, NULL),
('0333', '03', '33', 'GAZIPUR', 'DHAKA', '0', '7', NULL, NULL, NULL, NULL),
('0335', '03', '35', 'GOPALGANJ', 'DHAKA', '0', '7', NULL, NULL, NULL, NULL),
('0636', '06', '36', 'HABIGANJ', 'SYLHET', '6', '7', NULL, NULL, NULL, NULL),
('0538', '05', '38', 'JOYPURHAT', 'RAJSHAHI', '2', '7', NULL, NULL, NULL, NULL),
('0339', '03', '39', 'JAMALPUR', 'DHAKA', '0', '7', NULL, NULL, NULL, NULL),
('0441', '04', '41', 'JESSORE', 'JESSORE', '3', '7', NULL, NULL, NULL, NULL),
('0142', '01', '42', 'JHALOKATI', 'BARISAL', '5', '7', NULL, NULL, NULL, NULL),
('0444', '04', '44', 'JHENAIDAH', 'JESSORE', '3', '7', NULL, NULL, NULL, NULL),
('0246', '02', '46', 'KHAGRACHHARI', 'CHITTAGONG', '4', '7', NULL, NULL, NULL, NULL),
('0447', '04', '47', 'KHULNA', 'JESSORE', '3', '7', NULL, NULL, NULL, NULL),
('0348', '03', '48', 'KISHOREGANJ', 'DHAKA', '0', '7', NULL, NULL, NULL, NULL),
('0549', '07', '49', 'KURIGRAM', 'DINAJPUR', '8', '7', NULL, NULL, NULL, NULL),
('0450', '04', '50', 'KUSHTIA', 'JESSORE', '3', '7', NULL, NULL, NULL, NULL),
('0251', '02', '51', 'LAKSHMIPUR', 'COMILLA', '1', '7', NULL, NULL, NULL, NULL),
('0552', '07', '52', 'LALMONIRHAT', 'DINAJPUR', '8', '7', NULL, NULL, NULL, NULL),
('0354', '03', '54', 'MADARIPUR', 'DHAKA', '0', '7', NULL, NULL, NULL, NULL),
('0455', '04', '55', 'MAGURA', 'JESSORE', '3', '7', NULL, NULL, NULL, NULL),
('0356', '03', '56', 'MANIKGANJ', 'DHAKA', '0', '7', NULL, NULL, NULL, NULL),
('0457', '04', '57', 'MEHERPUR', 'JESSORE', '3', '7', NULL, NULL, NULL, NULL),
('0658', '06', '58', 'MAULVIBAZAR', 'SYLHET', '6', '7', NULL, NULL, NULL, NULL),
('0359', '03', '59', 'MUNSHIGANJ', 'DHAKA', '0', '7', NULL, NULL, NULL, NULL),
('0361', '03', '61', 'MYMENSINGH', 'DHAKA', '0', '7', NULL, NULL, NULL, NULL),
('0564', '05', '64', 'NAOGAON', 'RAJSHAHI', '2', '7', NULL, NULL, NULL, NULL),
('0465', '04', '65', 'NORAIL', 'JESSORE', '3', '7', NULL, NULL, NULL, NULL),
('0367', '03', '67', 'NARAYANGANJ', 'DHAKA', '0', '7', NULL, NULL, NULL, NULL),
('0368', '03', '68', 'NARSINGDI', 'DHAKA', '0', '7', NULL, NULL, NULL, NULL),
('0569', '05', '69', 'NATORE', 'RAJSHAHI', '2', '7', NULL, NULL, NULL, NULL),
('0570', '05', '70', 'NAWABGANJ', 'RAJSHAHI', '2', '7', NULL, NULL, NULL, NULL),
('0372', '03', '72', 'NETRAKONA', 'DHAKA', '0', '7', NULL, NULL, NULL, NULL),
('0573', '07', '73', 'NILPHAMARI', 'DINAJPUR', '8', '7', NULL, NULL, NULL, NULL),
('0275', '02', '75', 'NOAKHALI', 'COMILLA', '1', '7', NULL, NULL, NULL, NULL),
('0576', '05', '76', 'PABNA', 'RAJSHAHI', '2', '7', NULL, NULL, NULL, NULL),
('0577', '07', '77', 'PANCHAGARH', 'DINAJPUR', '8', '7', NULL, NULL, NULL, NULL),
('0178', '01', '78', 'PATUAKHALI', 'BARISAL', '5', '7', NULL, NULL, NULL, NULL),
('0179', '01', '79', 'PIROJPUR', 'BARISAL', '5', '7', NULL, NULL, NULL, NULL),
('0581', '05', '81', 'RAJSHAHI', 'RAJSHAHI', '2', '7', NULL, NULL, NULL, NULL),
('0382', '03', '82', 'RAJBARI', 'DHAKA', '0', '7', NULL, NULL, NULL, NULL),
('0284', '02', '84', 'RANGAMATI', 'CHITTAGONG', '4', '7', NULL, NULL, NULL, NULL),
('0585', '07', '85', 'RANGPUR', 'DINAJPUR', '8', '7', NULL, NULL, NULL, NULL),
('0386', '03', '86', 'SHARIATPUR', 'DHAKA', '0', '7', NULL, NULL, NULL, NULL),
('0487', '04', '87', 'SATKHIRA', 'JESSORE', '3', '7', NULL, NULL, NULL, NULL),
('0588', '05', '88', 'SIRAJGANJ', 'RAJSHAHI', '2', '7', NULL, NULL, NULL, NULL),
('0389', '03', '89', 'SHERPUR', 'DHAKA', '0', '7', NULL, NULL, NULL, NULL),
('0690', '06', '90', 'SUNAMGANJ', 'SYLHET', '6', '7', NULL, NULL, NULL, NULL),
('0691', '06', '91', 'SYLHET', 'SYLHET', '6', '7', NULL, NULL, NULL, NULL),
('0393', '03', '93', 'TANGAIL', 'DHAKA', '0', '7', NULL, NULL, NULL, NULL),
('0594', '07', '94', 'THAKURGAON', 'DINAJPUR', '8', '7', NULL, NULL, NULL, NULL),
('9994', '99', '94', 'UNITED ARAB EMIRATES', 'DHAKA', '0', '7', NULL, NULL, NULL, NULL),
('9995', '99', '95', 'QATAR', 'DHAKA', '0', '7', NULL, NULL, NULL, NULL),
('9996', '99', '96', 'SAUDI ARABIA', 'DHAKA', '0', '7', NULL, NULL, NULL, NULL),
('9997', '99', '97', 'BAHRAIN', 'DHAKA', '0', '7', NULL, NULL, NULL, NULL),
('9998', '99', '98', 'LIBYA', 'DHAKA', '0', '7', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `divisions`
--

CREATE TABLE IF NOT EXISTS `divisions` (
  `DIVISION_ID` varchar(2) DEFAULT NULL,
  `DIVISION_CODE` varchar(2) DEFAULT NULL,
  `DIVISION_NAME` varchar(50) DEFAULT NULL,
  `ENTERED_BY` varchar(10) DEFAULT NULL,
  `ENTRY_TIMESTAMP` datetime DEFAULT NULL,
  `LAST_UPDATED_BY` varchar(10) DEFAULT NULL,
  `LAST_UPDATED_TIMESTAMP` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `divisions`
--

INSERT INTO `divisions` (`DIVISION_ID`, `DIVISION_CODE`, `DIVISION_NAME`, `ENTERED_BY`, `ENTRY_TIMESTAMP`, `LAST_UPDATED_BY`, `LAST_UPDATED_TIMESTAMP`) VALUES
('01', '01', 'BARISAL', NULL, NULL, NULL, NULL),
('02', '02', 'CHITTAGONG', NULL, NULL, NULL, NULL),
('03', '03', 'DHAKA', NULL, NULL, NULL, NULL),
('04', '04', 'KHULNA', NULL, NULL, NULL, NULL),
('05', '05', 'RAJSHAHI', NULL, NULL, NULL, NULL),
('06', '06', 'SYLHET', NULL, NULL, NULL, NULL),
('07', '07', 'RANGPUR', NULL, NULL, NULL, NULL);

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
  `wrong_mark` text
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `doc_experience`
--

CREATE TABLE IF NOT EXISTS `doc_experience` (
  `id` int(11) NOT NULL,
  `admi_id` varchar(50) DEFAULT NULL,
  `exp_inst_name` varchar(255) DEFAULT NULL,
  `exp_designation` varchar(255) DEFAULT NULL,
  `exp_los` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `doc_experience`
--

INSERT INTO `doc_experience` (`id`, `admi_id`, `exp_inst_name`, `exp_designation`, `exp_los`, `created_at`) VALUES
(8, '19', 'JALALABD R-R MEDICAL COLLEGE,SYLHET', 'ASSTT PROF, ASSOC PROF, &PROF; DEPARTMENT,SURGERY', '12 YRS', '2017-12-14 16:34:30'),
(9, '19', 'NORTH EAST MEDICAL COLLEGE,SYLHET', 'PROF DEPARTMENT,SURGERY', '1YR+', '2017-12-14 16:34:30'),
(10, '19', 'PRIME MEDICAL COLLEGE,RANGPUR', 'PROF &HEAD; OF DEPARTMENT,SURGERY', '4 YRS', '2017-12-14 16:34:30'),
(11, '19', 'GAZI MEDICAL COLLEGE,KHULNA', 'PROF &HEAD; OF DEPARTMENT,SURGERY', 'SEPT 2014  TO TILL DATE', '2017-12-14 16:34:30'),
(12, '21', 'Shaheed Suhrawardy Medical College, Dhaka', 'Lecturer of Pathology', '2 years 8 months ', '2017-12-16 20:53:04'),
(13, '21', 'Noakhali Medical College, Noakhali, Bangladesh', 'Assistant Professor (CC) of Pathology', '1 year 8 months', '2017-12-16 20:53:04'),
(14, '21', 'Jahurul Islam  Medical College, Kishoregonj,Bangladesh', 'Assistant Professor of Pathology', '2 years 3 months', '2017-12-16 20:53:04'),
(15, '22', 'BIRDEM Academy & Ibrahim Medical College', 'Assistant Professor', '1 year 7 months', '2017-12-19 17:07:07'),
(16, '22', 'University Dental College', 'Lecturer', '2 years', '2017-12-19 17:07:07'),
(17, '22', 'Certificate Course on Diabetology, BADAS', 'Tutor', '8 years', '2017-12-19 17:07:07'),
(18, '23', 'Faridpur Medical College', 'Assistant Prof OBGYN', '3 years', '2017-12-19 20:14:49'),
(19, '23', 'Sir Salimullah Medical College', 'Assistant Prof & Associate Prof OBGYN', '4 years', '2017-12-19 20:14:49'),
(20, '25', 'Ibrahim Medical College', 'Assistant Professor', '3 Years', '2017-12-21 00:32:22'),
(21, '26', 'Basundhara Ad-din Medical College', 'Asst. professor', '6months', '2017-12-21 03:50:26'),
(22, '26', 'MH samorita mesical college ', 'lecturer', '10 months', '2017-12-21 03:50:26'),
(23, '27', 'Basundhara Ad-din Medical college', 'Asst. Professor', '6months', '2017-12-21 04:08:50'),
(24, '27', 'MH samorita mesical college ', 'lecturer', '10 months', '2017-12-21 04:08:50'),
(25, '28', 'SAPPORO DENTAL COLLEGE & HOSPITAL, UTTARA, DHAKA', 'ASSOCIATE PROFESSOR  (CC) OF BIOCHEMISTRY', '6 YEARS', '2017-12-22 23:36:05'),
(26, '29', 'BANGABANDHU SHEIKH MUJIB MEDICAL UNIVERSITY', 'PROFESSOR', '13 YEARS', '2017-12-24 20:12:01'),
(27, '29', 'DHAKA MEDICAL COLLEGE', 'PROFESSOR', '1 YEARS', '2017-12-24 20:12:01'),
(28, '29', 'SIR SALIMULLAH MEDICAL COLLEGE', 'PROFESSOR', '5 YEARS', '2017-12-24 20:12:01'),
(29, '33', ' IMC & BIRDEM General Hospital', 'Registrar, Department of Internal Medicine', '5 years', '2017-12-26 20:05:25'),
(30, '33', ' IMC & BIRDEM General Hospital', 'Assistant Professor, Department of Internal Medicine', '5 years', '2017-12-26 20:05:25'),
(31, '33', ' IMC & BIRDEM General Hospital', 'Associate Professor, Department of Internal Medicine', '5 years 6 months', '2017-12-26 20:05:25'),
(32, '34', 'BANGLADESH MEDICAL COLLEGE, DHAKA', 'LECTURER', '8 YEARS', '2017-12-28 17:29:21'),
(33, '35', 'BIIRDEM & IMC', 'Assistant Professor', 'July 1, 2014 - till date', '2017-12-28 21:40:26'),
(34, '35', 'BIIRDEM & IMC', 'Registrar', 'May 15, 2010 - June 30, 2014', '2017-12-28 21:40:26'),
(35, '36', 'BIRDEM General Hospital and Ibrahim Medical College', 'Registrar, Department of Nephrology & Dialysis unit', 'From August 2016 till date', '2017-12-31 18:45:55'),
(36, '37', 'Tairunnessa Memorial Medical College & Hospital', 'Assistant Professor (Biochemistry)', 'April, 2017 to on going ', '2017-12-31 18:56:14'),
(37, '38', 'SHYLHET M A G OSMANI MEDICAL COLLEGE', 'REGISTRAR', '2', '2018-01-01 16:10:57'),
(38, '38', 'CHITTAGONG MEDICAL COLLEGE', 'REGISTRAR', '2', '2018-01-01 16:10:57'),
(39, '38', 'COMILLA MEDICAL COLLEGE', 'JUNIOR CONSULTANT', '3', '2018-01-01 16:10:57'),
(40, '38', 'COMILLA MEDICAL COLLEGE', 'SENIOR CONSULTANT', '3', '2018-01-01 16:10:57'),
(41, '38', 'Sher-E-Bangla Medical College', 'Assoc Professor', '2', '2018-01-01 16:10:57'),
(42, '38', 'COMILLA MEDICAL COLLEGE', 'Assoc Professor', '3', '2018-01-01 16:10:57'),
(43, '38', 'Sher-E-Bangla Medical College', 'Assoc Professor', '2', '2018-01-01 16:10:57'),
(44, '38', 'COMILLA MEDICAL COLLEGE', 'Assoc Professor', '5', '2018-01-01 16:10:57'),
(45, '38', 'COMILLA MEDICAL COLLEGE', 'PROFESSOR', '3', '2018-01-01 16:10:57'),
(46, '38', 'DHAKA MEDICAL COLLEGE', 'PROFESSOR', '2', '2018-01-01 16:10:57'),
(47, '39', 'Shaheed Suhrawardy Medical College', 'Professor of Surgery', '20 years', '2018-01-01 17:00:33'),
(48, '40', 'DHAKA MEDICAL COLLEGE HOSPITAL', 'Professor of Surgery', '6 months', '2018-01-01 18:47:42'),
(49, '40', 'DHAKA MEDICAL COLLEGE HOSPITAL', 'Associate Professor of surgery', '4 years', '2018-01-01 18:47:42'),
(50, '40', 'DHAKA MEDICAL COLLEGE HOSPITAL', 'Assistant Professor of Surgery', '2 years', '2018-01-01 18:47:42'),
(51, '41', 'Monsur Ali Medical College', 'Lecturer', '1 year', '2018-01-09 17:45:37'),
(52, '41', 'Anwer Khan Modern Medical College', 'Assistant Professor', '3 year', '2018-01-09 17:45:37'),
(53, '41', 'Bangabandhu Sheikh Mujib Medical University', 'Assistant Professor', '3 year', '2018-01-09 17:45:37'),
(54, '41', 'Bangabandhu Sheikh Mujib Medical University', 'Associate Professor', '2 year', '2018-01-09 17:45:37');

-- --------------------------------------------------------

--
-- Table structure for table `doc_training`
--

CREATE TABLE IF NOT EXISTS `doc_training` (
  `id` int(11) NOT NULL,
  `admi_id` varchar(50) DEFAULT NULL,
  `training_name` varchar(255) DEFAULT NULL,
  `training_duration` varchar(255) DEFAULT NULL,
  `training_organization` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `doc_training`
--

INSERT INTO `doc_training` (`id`, `admi_id`, `training_name`, `training_duration`, `training_organization`, `created_at`) VALUES
(8, '20', 'Honorary Medical Officer (Surgery)', '6 month', 'Dhaka Medical College Hospital', '2017-12-15 03:35:37'),
(9, '20', 'Honorary Medical Officer (ENT)', '1 year', 'P.G. Hospital (BSMMU)', '2017-12-15 03:35:37'),
(10, '21', 'Workshop on Research Management', '7 weeks', 'BMRC', '2017-12-16 20:53:04'),
(11, '21', 'Basic computer training,', '2 weeks', 'DGHS', '2017-12-16 20:53:04'),
(12, '21', 'Hands on training on Biotechnology', '2 weeks', 'MIS, DGHS', '2017-12-16 20:53:04'),
(13, '21', 'Teaching Methodology and assessment', '6 days', 'CME, MoHFW', '2017-12-16 20:53:04'),
(14, '21', 'Postgraduate Course in Histopathology and Cytopathology', '4 days', 'BSMMU', '2017-12-16 20:53:04'),
(15, '21', 'WHO fellowship Training in Pathology', '15 days', 'Mahidol University, Bangkok, Thailand.', '2017-12-16 20:53:04'),
(16, '22', 'FCGP', '1 year', 'BCGP', '2017-12-19 17:07:07'),
(17, '23', 'Training of Medical Education', '7 days', 'CME', '2017-12-19 20:14:49'),
(18, '23', 'Traning on VVF Surgery', '30 days', 'DMC', '2017-12-19 20:14:49'),
(19, '23', 'Traning on Colposcopy', '15 days', 'BSMMU', '2017-12-19 20:14:49'),
(20, '25', 'CCD', '6 Months', 'BIRDEM', '2017-12-21 00:32:22'),
(21, '25', 'CMU', '6 Months', 'BPMPA', '2017-12-21 00:32:22'),
(22, '28', 'WORKSHOP ON FACULTY ADVANCEMENT IN MEDICAL EDUCATION "TEACHING AND ASSESSMENT", "OSPE-PREPARATION, CONDUCTION AND EVALUATION"', '11-13 APRIL,2015: 21-23 NOVEMBER,2015', 'MEDICAL EDUCATION UNIT OF POPULAR MEDICAL COLLEGE', '2017-12-22 23:36:05'),
(23, '29', 'RESEARCH METHODOLOGY', '15 DAYS', 'SCHOOL OF PUBLIC HEALTH, UNIVERSITY OF MANILA , PHILIPPINES ', '2017-12-24 20:12:01'),
(24, '30', 'CLINICAL BIOCHEMISTRY ', '2 YEARS', 'BANGABANDHU SHEIKH MUJIB MEDICAL UNIVERSITY', '2017-12-24 20:38:16'),
(25, '34', 'PGT', '6 MONTHS', 'BSMMU, SHAHBAGH, DHAKA', '2017-12-28 17:29:21'),
(26, '35', 'Research Methodology', '3 days', 'BIRDEM & IMC', '2017-12-28 21:40:26'),
(27, '35', 'Medical Education', '3 days', 'BIRDEM & IMC', '2017-12-28 21:40:26'),
(28, '36', 'Scientific paper writting', '3 days', 'Ibrahim Medical college', '2017-12-31 18:45:55'),
(29, '39', 'Laprascopy Surgery ', 'One Month', 'World Laprascopy Hospital India', '2018-01-01 17:00:33'),
(30, '41', 'Training on Medern Assessment Techniques in Medical Education', '4 days', 'Centre For Medical Education, Mohakhali, Dhaka', '2018-01-09 17:45:37'),
(31, '41', 'Workshop on Teaching Methodology & Assessment', '4 days', 'Centre For Medical Education, Mohakhali, Dhaka', '2018-01-09 17:45:37');

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

CREATE TABLE IF NOT EXISTS `exams` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `module_id` int(11) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `year` int(4) DEFAULT NULL,
  `session` int(2) DEFAULT NULL,
  `time` int(4) DEFAULT NULL,
  `total_mark` int(4) DEFAULT NULL,
  `open_date` datetime DEFAULT NULL,
  `close_date` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exam_question`
--

CREATE TABLE IF NOT EXISTS `exam_question` (
  `id` int(11) NOT NULL,
  `exam_ref_id` int(11) NOT NULL,
  `question_type_id` int(11) NOT NULL COMMENT '1->SBA, 2 -> MCQ',
  `question_id` int(11) NOT NULL,
  `module_id` int(11) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `year` int(4) DEFAULT NULL,
  `session` int(2) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `feedbacks`
--

CREATE TABLE IF NOT EXISTS `feedbacks` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `message` text,
  `sent_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `general_info`
--

CREATE TABLE IF NOT EXISTS `general_info` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `tagline` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `fb_id` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `website` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(100) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` varchar(100) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `general_info`
--

INSERT INTO `general_info` (`id`, `name`, `tagline`, `email`, `fb_id`, `address`, `phone`, `website`, `logo`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`) VALUES
(1, 'GENESIS', 'Post Graduation', 'info@genesis.com', '', '230/3', '01764441544', 'http://www.genesis.com', 'uploads/logo/fe51a981964f65899f154018ab76b87b.png', '2017-03-02 09:46:20', '', '0000-00-00 00:00:00', 'admin', 1),
(2, 'GENESIS', 'Solutions For Business', 'info@bigm-bd.com', '', 'House No: 17/1B (1st floor) Block-B Babor Road, Muhammadpur Dhaka,Bangladesh.', '+88 02 9127611, +88 01811 409732, +88 01911 430370', 'http://www.bigm-bd.com/', 'uploads/logo/f036c45344a7d028fb4a14c6a811e848.png', '2017-03-02 12:14:33', 'admin', '0000-00-00 00:00:00', 'admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `import_doc`
--

CREATE TABLE IF NOT EXISTS `import_doc` (
  `reg_no` varchar(255) DEFAULT NULL,
  `doc_name` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `medical_college` varchar(255) DEFAULT NULL,
  `payment_status` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `N` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `import_doc`
--

INSERT INTO `import_doc` (`reg_no`, `doc_name`, `mobile`, `subject`, `medical_college`, `payment_status`, `status`, `N`) VALUES
('171001', 'Dr. Tamanna Ferdous', '8801716718087', 'Gynae & Obs', 'SEBMC', 'Paid', 'ok', ''),
('171002', 'Dr. Kazi Shamiur Rahman', '8801734828735', 'Oncology', 'NBMC', 'Paid', 'Pic', ''),
('171003', 'Dr. Lazmi Rani Kundu', '8801703797004', 'Anatomy', 'SOMC', 'Paid', 'Pic', ''),
('171004', 'Dr. Farhana Aktar Eity', '8801700924084', 'Surgery', 'RMC', 'Due', 'Pic', ''),
('171005', 'Dr. Fabah Akther', '8801716237142', 'Paediatrics', 'SBMC', 'Paid', 'Pic', ''),
('171006', 'Dr. Shahriar ', '8801832125536', 'Medicine', 'SSMC', 'Due', 'ok', ''),
('171007', 'Dr. Ahmed Sabit ', '8801551612635', 'Neurosurgery', 'SSMC', 'Due', 'ok', ''),
('171008', 'Dr. Laila Afroje', '8801722443104', 'Cardiology', 'SOMC', 'Paid', 'ok', ''),
('171009', 'Dr. Mishuti Rani Ghosh', '8801717404529', 'Gynae & Obs', 'SWMC', 'Paid', 'ok', ''),
('171010', 'Dr. Md. Rezwanul Haque', '8801671477122', 'Endocrinology', 'IMC', 'Paid', 'ok', ''),
('171011', 'Dr. Tanjeen Laila', '8801768358618', 'Basic Science', 'NMC', 'Paid', 'Pic', ''),
('171012', 'Dr. Nasrin Begum Shima', '8801710825451', 'Paediatrics', 'NMC', 'Paid', 'ok', ''),
('171013', 'Dr. Md. Abdur Rashid Jwell', '8801723277639', 'Dermatology', 'CenMC', 'Due : 6000', 'ok', ''),
('171014', 'Dr. Shimul Afrin Parna', '8801741140987', 'Medicine', 'SMCH', 'Paid', 'ok', ''),
('171015', 'Dr. Md. Mohsin', '8801749105130', 'Ortho-Surgery', 'SSMC', 'Paid', 'ok', ''),
('171016', 'Dr. Sarsana Sabab', '8801712042227', 'Gynae & Obs', 'ZHSWMC', 'Paid', 'ok', ''),
('171017', 'Dr. Sadia Afroz', '8801676443838', 'Gynae & Obs', 'SMCH', 'Paid', 'ok', ''),
('171018', 'Dr. Nilupha Akter Moly', '8801718721208', 'Skin VD', 'CBMC', 'Paid', 'ok', ''),
('171019', 'Dr. Khandakar Faisal Arafat', '8801719288887', 'Neuromedicine', 'KMC', 'Paid', 'ok', ''),
('171020', 'Dr. Rabeya Mustary', '8801824196047', 'Int. Medicine', 'UMC', 'Paid', 'Pic', ''),
('171021', 'Dr. Nandita Banik Munna', '8801718580422', 'Opthalmology', 'MCWH', 'Paid', 'Pic', ''),
('171022', 'Dr. Rokeya Ferdous', '8801552375198', '', 'SSMC', 'Paid', 'ok', ''),
('171023', 'Dr. Md. Ashif Areafin', '8801717928998', 'MS', 'IBMC', 'Due', 'Pic', ''),
('171024', 'Dr. Oli Chowdhury', '8801753414518', '', 'DCMCH', 'Paid', 'Pic', ''),
('171025', 'Dr. Fahid Bin Nazrul', '8801670429456', 'Medicine', 'UAMC', '', 'Pic', ''),
('171026', 'Dr. Sayed Shafiq Tamal', '8801745105901', 'Surgery', 'SZMC', 'Due: 8000', 'Ok', ''),
('171027', 'Dr. Tania Rahman Liza', '8801618113202', 'Obs & Gynae', 'SBMC', 'Paid', 'ok', ''),
('171028', 'Dr. Md. Rifat Hassan', '8801716577866', '', 'KYAMC', 'Due : 1000', 'ok', ''),
('171029', 'Dr. Rifat Sarkar Sani ', '8801733508901', '', 'SZMC', 'Due : 1000', 'ok', ''),
('171030', 'Dr. Musanna Galib', '8801711957597', 'MD', 'IMC', 'Due', 'ok', ''),
('171031', 'Dr. Tanmoy Kumar Paul', '8801683514187', 'Medicine', 'CMC', 'Due : 8000', 'ok', ''),
('171032', 'Dr. A. K. M. Jolil Ahmed', '8801624244074', 'MS', 'CMC', 'Due : 6000', 'Pic', ''),
('171033', 'Dr. Rashadur Raza', '8801706679657', 'Oncology', 'CMC', 'Old', 'ok', ''),
('171034', 'Dr. Ismail Hussain', '8801823218080', 'Orthopaedics', 'SSMC', 'Paid', 'Pic', ''),
('171035', 'Dr. Mirza Foysal', '8801731096552', 'MD', 'DNMC', 'Paid', 'Pic', ''),
('171036', 'Dr. Efran Bin Emdad', '8801912308644', 'Medicine', 'DNMC', 'Paid', 'ok', ''),
('171037', 'Dr. Nahid Afroz Nishi', '8801922544321', 'Oncology', 'SZMC', 'Paid', 'ok', ''),
('171038', 'Dr. Syeda Amina Khair Lopa  ', '8801722183173', 'Obs & Gynae', 'SBMC', 'Due : 11000', 'ok', ''),
('171039', 'Dr. Md. Mushiul Alam', '8801670497477', 'Orthopaedics', 'SSMC', 'Paid', 'Pic', ''),
('171040', 'Dr. Tasmir Arefin', '8801683740271', 'Gastroenterology', 'SSMC', 'Paid', 'Pic', ''),
('171041', 'Dr. Md. Mosharraf Hossain', '8801724483459', 'Medicine', 'SZMC', 'Paid', 'Pic', ''),
('171042', 'Dr. Shanta Islam', '8801765296937', 'MS', 'DMC', 'Due', 'ok', ''),
('171043', 'Dr. Shakhawat Hossain', '8801721473843', 'Int. Medicine', 'NIMC', 'Paid', 'ok', ''),
('171044', 'Dr. Shamimur Nahar', '8801737706193', 'Basic Science', 'SOMC', 'Paid', 'ok', ''),
('171045', 'Dr. Md. Shahadat Hossain', '8801718263338', 'Medicine', 'RpMC', 'Paid', 'ok', ''),
('171046', 'Dr. Aziza Ahmed Efa', '8801934701032', 'Medicine', 'DCMCH', 'Paid', 'ok', ''),
('171047', 'Dr. Sumayia', '8801796581468', 'Medicine', 'IMC', 'Paid', 'Pic', ''),
('171048', 'Dr. Md. Ismail Gazi', '8801715234299', 'MS(Urology)', 'IBMC', '11000', 'ok', ''),
('171049', 'Dr. Maho-Nur-Rahman', '8801537091591', 'MS(G.Surgery)', 'SMCH', 'Paid', 'ok', ''),
('171050', 'Dr. Shahee Muntasir Mehran', '8801781626171', 'MD', 'SSMC', '4000', 'ok', ''),
('171051', 'Dr. Mithila Afroz', '8801816378670', 'Basic Science', 'DNMC', '10000', 'Pic', ''),
('171052', 'Dr. Ali Md. Lutful Hoq Chowdhury', '8801883385055', 'Critical care Medicine', 'SOMC', '6000', 'ok', ''),
('171053', 'Dr. Sharifa Alam', '8801683659574', 'Radiology &Imaging', 'ZHSWMC', '4000', 'Pic', ''),
('171054', 'Dr. Maima Siddique', '8801722091955', 'Obs & Gynae', 'KYAMC', '6000', 'Pic', ''),
('171055', 'Dr. Janatul Ferdous', '8801729820526', 'Obs & Gynae', 'KWMC', 'Paid', 'ok', ''),
('171056', 'Dr. Mahmudur Rahman Rifat', '8801711330675', 'Physical Medicine', 'RpMC', '9000', 'ok', ''),
('171057', 'Dr. Zakaria Khan', '8801744977668', 'Psychiatry', 'RpMC', '9000', 'ok', ''),
('171058', 'Dr. Taposi Rabeya', '8801755786325', 'MD(Paediatrics)', 'JIMC', 'Paid', 'Pic', ''),
('171059', 'Dr. Akif Mahmood Oyon', '8801672072141', 'Nephrology', 'HFRCMC', 'Paid', 'Pic', ''),
('171060', 'Dr. Ferdous-E-Zannat Natasha', '8801675634620', 'Cardiology', 'PMC', 'Paid', 'ok', ''),
('171061', 'Dr. Tasmiah Mahmud', '8801715285892', 'Dermatology', 'DNMC', 'Paid', 'Pic', ''),
('171062', 'Dr. Masud Rana Badol', '8801717767104', 'MS', 'DjMC', 'Paid', 'ok', ''),
('171063', 'Dr. ASM Tamim Chowdhury', '8801743407998', 'Surgery', 'IBMC', 'Due', 'Pic', ''),
('171064', 'Dr. Farhana Alam (Rumana)', '8801786491226', 'Paediatrics', 'IMC', 'Due', 'Pic', ''),
('171065', 'Dr. Chowdhury Rehnuma Tabassum', '8801717135504', 'Obs & Gynae', 'RpMC', 'Paid', 'Pic', ''),
('171066', 'Dr. Md. Mahmud Alam Shah', '8801721901903', 'Surgery', 'RpMC', 'Paid', 'ok', ''),
('171067', 'Dr. Tasnuva Tarannum', '8801721736741', 'Medicine', 'SSMC', 'Paid', 'ok', ''),
('171068', 'Dr. Istiaque Mashud', '8801915966648', '', 'IBMC', 'Due', 'Pic', ''),
('171069', 'Dr. Shib Shankar Goshwami', '8801737110741', 'Surgery', 'CBMC', 'Paid', 'ok', ''),
('171070', 'Dr. Sorwar Jahan', '8801715000674', 'Medicine', 'CBMC', 'Paid', 'ok', ''),
('171071', 'Dr. Rabiul Islam', '8801770365575', 'Surgery', 'SZMC', 'Paid', 'ok', ''),
('171072', 'Dr. Md. Arif Ridwan', '8801714452288', 'Medicine', 'SOMC', '6000', 'Pic', ''),
('171073', 'Dr.Md.Shamsuzzaman Sumon', '8801717831169', 'MD-Pulmonology', 'SBMC', '6000', 'Pic', ''),
('171074', 'Dr. Sathi Sultana Rima', '8801726138935', 'Paediatrics', 'KWMC', 'Paid', 'Pic', ''),
('171075', 'Dr. Sadia Jannat', '8801723040109', 'Oncology', 'SBMC', 'Paid', 'Ok', ''),
('171076', 'Dr. Anik Sarker Palash', '8801734603774', 'Orthopedics', 'MMC', 'Paid', 'Pic', ''),
('171077', 'Dr. Nizam Uddin Ahamed', '8801914331383', 'MD', 'MMC', '10000', 'ok', ''),
('171078', 'Dr. Asif Rayhan Chowdhury', '8801726662110', 'Orthopaedics', 'SOMC', '6000', 'Pic', ''),
('171079', 'Dr. Naushad Khan Shaon', '8801764003300', 'Medicine', 'BMC', '11000', 'Pic', ''),
('171080', 'Dr. Md. Imrul Rusel', '8801751804901', 'Cardiology', 'SOMC', 'Paid', 'Pic', ''),
('171081', 'Dr. Sadia   Afrin Shanta', '8801737926995', 'MS', 'MHSMC', 'Paid', 'ok', ''),
('171082', 'Dr. Noorur Rahman', '8801716632018', 'Paediatrics', 'MMC', 'Paid', 'ok', ''),
('171083', 'Dr. Fakiha Ahmed Saadia', '8801915791854', 'Surgery', 'SZMC', 'Paid', 'ok', ''),
('171084', 'Dr. Saqibq Aziz', '8801813518532', 'Psychiatry', 'AKMMC', '4000', 'Pic', ''),
('171085', 'Dr. Abida Sharmin Sikder (Meghna)', '8801687800047', 'Medicine', 'BMC', 'Paid', 'ok', ''),
('171086', 'Dr. Konika Sinha', '8801752247105', 'Radiology', 'AFMC', 'Paid', 'Pic', ''),
('171087', 'Dr. Marufa Akter Mila', '8801849567688', 'Medicine', 'BMC', '6000', 'ok', ''),
('171088', 'Dr. Palash Halder', '8801982611918', 'Nephrology', 'East MC', 'Paid', 'ok', ''),
('171089', 'Dr. Maisha Humid Sangita', '8801911394552', '', 'MCWH', 'Paid', 'ok', ''),
('171090', 'Dr. Sazia Sultana', '8801715913345', 'Cardiology', 'DNMC', 'Paid', 'ok', ''),
('171091', 'Dr. Tushar Das', '8801614440440', 'Urology', 'INMC', '6000', 'ok', ''),
('171092', 'Dr. Fatema Farzana', '8801715339170', 'Cardiology', 'FMC', 'Paid', 'Pic', ''),
('171093', 'Dr. A.M. Nayeem Parvez', '8801723654027', 'CVTS', 'FMC', '7', 'Pic', ''),
('171094', 'Dr. Asma akter', '8801764198185', 'Peadiatrics', 'SZMC', '6000', 'Pic', ''),
('171095', 'Dr. Md. Mehedi Hasan Alif', '8801932999932', 'Surgery', 'Delta MC', '11000', 'Pic', ''),
('171096', 'Dr. Mubarak Hossen Khan', '8801815160830', 'Physical Medicine', 'SOMC', 'Due', 'Pic', ''),
('171097', 'Dr. Sakhawat Hossain', '8801722681810', 'Cardiology', 'Chat Ma O MC', 'Paid', 'ok', ''),
('171098', 'Dr. Syeda Nazmun Hahar', '8801946971145', 'Medicine', 'CMC', 'Paid', 'ok', ''),
('171099', 'Dr. Md. Masum Ur Rahman', '8801722166885', 'Int. Medicine', 'DjMC', 'Paid', 'ok', ''),
('171100', 'Dr. Khundoker Rakibul Hoqne', '8801534406097', 'Urthopedics', 'BMC', 'Paid', 'ok', ''),
('171101', 'Dr. Mst Hazena Khatun Reshma', '8801724005495', 'Gynae & Obs', 'IBMC', '6000', 'Pic', ''),
('171102', 'Dr. Nahida Akter', '8801929070602', 'Gynae & Obs', 'MCFWMC', 'Paid', 'ok', ''),
('171103', 'Dr. Ayesha Siddika', '880192103332', 'Radiology', 'DNMC', '8000', 'Pic', ''),
('171104', 'Dr. Sheikh Hasibul Islam', '8801827506722', 'Medicine', 'KMC', 'Paid', 'Ok', ''),
('171105', 'Dr. Farwana Eva Bindu', '8801931850779', 'MD', 'HFRCMC', '2000', 'ok', ''),
('171106', 'Dr. Jannatul Fardus', '8801742411702', 'Basic Science', 'JIMC', 'Paid', 'Pic', ''),
('171107', 'Dr. Tanzila Aurin', '8801731300633', 'Medicine', 'IBMC', 'Paid', 'Pic', ''),
('171108', 'Dr. Samiun Naher Taposi', '8801966865026', 'Cardiology', 'SSMC', 'Paid', 'ok', ''),
('171110', 'Dr. Jalal Ahmed', '8801722400214', 'Surgwery', 'SZMC', 'Paid', 'Pic', ''),
('171111', 'Dr. Tasnuva Khondokar', '8801722861800', 'Medicine', 'SBMC', 'Due', 'Pic', ''),
('171112', 'Dr. Mondira saha', '8801552307679', 'Opthalmology', 'INMC', 'Due', 'Pic', ''),
('171113', 'Dr. Asma Mahmuda', '8801717386923', 'psychiatry', 'DNMC', 'Paid', 'ok', ''),
('171114', 'Dr. Tanzila Rommon', '8801758712852', 'Medicine', 'SBMC', 'Paid', 'Pic', ''),
('171115', 'Dr. Omal Bin Anis', '8801674136096', 'Orthopaedics', 'North Eas MC', 'Paid', 'ok', ''),
('171116', 'Dr. Amena Khatun', '8801674493528', 'Gynae & Obs', 'SWMC', '10000', 'ok', ''),
('171117', 'Dr. Sajib Kumar Das', '8801717404529', 'Orthopaedics', 'JIMC', 'Paid', 'ok', ''),
('171118', 'Dr. Arnab Kaiyum Tahdeder', '8801558157013', 'Medicine', 'GSUMc', 'Paid', 'ok', ''),
('171119', 'Dr. Md. Zahir uddin', '8801710886970', 'Urology', 'SSMC', '7000', 'ok', ''),
('171120', 'Dr. Tania Rahman ', '8801711709994', 'Gynae & Obs', 'SSMC', 'Paid', 'ok', ''),
('171121', 'Dr. Premangshu Biswas', '8801722590204', 'Cardiology', 'RMC', '6000', 'ok', ''),
('171122', 'Dr. Mehdi Bashar', '8801716088390', 'Orthopaedics', 'SSMC', 'Paid', 'ok', ''),
('171123', 'Dr. Afroza Binta Aziz', '8801714800346', 'Gynae & Obs', 'SBMC', 'Paid', 'Pic', ''),
('171124', 'Dr. Md. Alim Ur Rahman', '8801674757060', 'Medicine', 'IBMC', '9000', 'Pic', ''),
('171125', 'Dr. Saima Nasir', '8801675935290', 'Gynae & Obs', 'IBMC', '9000', 'Pic', ''),
('171126', 'Dr. Ishteak Ahmed Oneek', '8801770330236', 'MD', 'DjMC', 'Paid', 'ok', ''),
('171127', 'Dr. Fatema Farhana', '8801977444929', 'Gynae & Obs', 'FMC', 'Due', 'ok', ''),
('171128', 'Dr. Nasrin Sultana', '8801715626423', 'Dermatology', 'ZHSWMC', '9000', 'Pic', ''),
('171129', 'Dr. Ruhul Amin', '8801727976180', 'Medicine', 'RMC', 'Paid', 'ok', ''),
('171130', 'Dr. Mousumi Ahmed', '8801670416462', 'Medicine', 'MMC', 'Paid', 'Pic', ''),
('171131', 'Dr. Mehena Shayeri Shayzoti', '8801773222257', 'Microbiology', 'IMC', '4000', 'Pic', ''),
('171132', 'Dr. Sumayia Minhaj', '8801822999551', 'Medicine', 'BMC', 'Paid', 'Pic', ''),
('171133', 'Dr. Md. Salim Chistia ', '8801628592214', 'Paediatrics', 'DMC', 'Paid', 'Pic', ''),
('171134', 'Dr. Md. Mainul Islam', '8801724114739', 'Medicine', 'KMC', 'Paid', 'Pic', ''),
('171135', 'Dr. Tahjeeba Parvin Chowdhury', '8801911336459', 'Int. Medicine', 'CMC', 'Paid', 'Pic', ''),
('171136', 'Dr. Farhana Hasan ', '8801745154611', 'Physical Medicine', 'SOMC', '', 'Pic', ''),
('171137', 'Dr. Asma Akter', '8801675189069', 'Gynae & Obs', 'MMC', 'Paid', 'Pic', ''),
('171138', 'Dr. Syada Lutfunnisa', '8801712894993', 'Medicine', 'RMC', 'Paid', 'ok', ''),
('171139', 'Dr. Hasna Faruquee Shipu', '8801741766702', 'Medicine', 'SZMC', 'Paid', 'ok', ''),
('171140', 'Dr. Supti Mukherjee', '8801757085526', 'Cardiology', 'KWMC', 'Paid', 'Pic', ''),
('171141', 'Dr. Shib Shakhar ', '8801750718297', 'MD', 'DjMC', 'Paid', 'Pic', ''),
('171142', 'Dr. Ayesha Amin', '8801753963112', 'Haematology', 'DMC', '4000', 'Pic', ''),
('171144', 'Dr. Afroz Nasrin Ripa', '8801718119339', 'Gynae & Obs', 'SBMC', 'Paid', 'ok', ''),
('171145', 'Dr. Nahid Amin', '8801774311010', 'MD', 'CCMU', '8000', 'Pic', ''),
('171146', 'Dr. Sanjid Chowdhury', '8801763498378', 'MD', 'Capital Me C', '8000', 'Pic', ''),
('171147', 'Dr. Nowreen Ahmed', '8801817049298', 'Gynae & Obs', 'IMC', '8000', 'Pic', ''),
('171148', 'Dr. Md. Mahedi Alam', '8801740874381', 'Medicine', 'MMC', 'Due', 'Pic', ''),
('171149', 'Dr. Mohammad Helal Uddin', '8801722619464', 'Medicine', 'SBMC', '8000', 'Pic', ''),
('171150', 'Dr. Md. Mazharul Haque', '8801715248185', 'Ms', 'SOMC', '6000', 'Pic', ''),
('171151', 'Dr. Md. Zahir Uddin', '8801710886970', 'Urology', 'SSMC', '7000', 'ok', ''),
('171152', 'Dr. Syed Md. Tanjidul Islam', '8801712148422', 'Neur Surgery', 'FMC', 'Due', 'ok', ''),
('171153', 'Dr. Md. Arif Hossain', '8801919410032', 'MS', 'SSMC', '6000', 'Pic', ''),
('171154', 'Dr. Ariful Islam', '8801920450849', 'MD', 'SSMC', '8000', 'Pic', ''),
('171155', 'Dr. K.M. Istiak Rehan', '8801715785506', 'Cardiology', 'North Eas MC', 'Due', 'Pic', ''),
('171156', 'Dr. Md. Salim Reza', '8801717214893', 'Orthopaedics', 'MMC', '7000', 'ok', ''),
('171157', 'Dr. Md. Sakib Ohab', '8801737099021', 'Urology', 'RpMC', '6000', 'ok', ''),
('171158', 'Dr. Sanjary Main Uddin', '8801928131518', 'Medicine', 'UWMC', 'Paid', 'Pic', ''),
('171159', 'Dr. Zamir Ahmed Rasel', '8801726338855', 'Anaesthiology', 'SSMC', '6000', 'ok', ''),
('171160', 'Dr. Miraj Uddin Khandoker', '8801766378709', 'MS', 'SSMC', '6000', 'ok', ''),
('171161', 'Dr. Abdullah Al Ellias (Ashique)', '8801765969651', 'Orthopaedics', 'MMC', 'Paid', 'ok', ''),
('171162', 'Dr. Rakibul Hassan', '8801722094692', 'Surgery', 'DjMC', 'Paid', 'ok', ''),
('171163', 'Dr. Mahbubur Rahman', '8801753661270', 'ENT', 'IBMC', 'Due', 'Pic', ''),
('171164', 'Dr. Iffat Rahman', '8801914763633', 'Gynae & Obs', 'JIMC', '5000', 'ok', ''),
('171165', 'Dr. Ananya Chakraborty', '8801748411333', 'Paediatrics', 'MCFWMC', '8000', 'Pic', ''),
('171166', 'Dr. Sanjida Afruz', '8801796787626', 'Microbiology', 'RCMC', 'Due', 'Pic', ''),
('171167', 'Dr. Shilpi Bose', '8801725790707', 'Medicine', 'MMC', 'Due', 'ok', ''),
('171168', 'Dr. Azima Alauddin', '8801948335653', 'Paediatrics', 'SMAMC', 'Paid', 'Pic', ''),
('171169', 'Dr. Shamiul Alam', '8801516166330', 'Int. Medicine', 'IBMC', 'Paid', 'Pic', ''),
('171170', 'Dr. Lipon Roy', '8801680077768', 'Medicine', 'BMC', 'Due', 'Pic', ''),
('171171', 'Dr. Moinul', '8801911253195', 'Medicine', 'IBMC', 'Due', 'Pic', ''),
('171172', 'Dr. Mohammad Delower Hossain', '8801674182026', '', 'CMC', 'Paid', 'Pic', ''),
('171173', 'Dr. Md. Aminul Islam', '8801628332978', 'Gastroenterology', 'SBMC', 'Due', 'Pic', ''),
('171174', 'Dr. Nipun Hazra', '8801678071281', 'MS', 'AFMC', '8000', 'ok', ''),
('171175', 'Dr. Sharmin', '8801675430513', '', 'SSMC', 'Paid', 'Pic', ''),
('171176', 'Dr. Md. Mohyman Chowdhury', '8801619105999', 'Orthropaedics', 'USTC', 'Paid', 'Pic', ''),
('171177', 'Dr. Md. Mynul Islam', '8801673483564', 'Medicine', 'Enam MC', 'Paid', 'ok', ''),
('171178', 'Dr. Shimul Hossain', '8801716375595', 'ENT', 'DMC', 'Paid', 'ok', ''),
('171179', 'Dr. Nazia Alam', '8801675627282', 'Surgery', 'SOMC', 'Paid', 'ok', ''),
('171180', 'Dr. Md. Asadujjaman', '8801723560547', 'Cardiology', 'DjMC', 'Paid', 'Pic', ''),
('171181', 'Dr. Naznin Akter', '8801719134418', 'Basic Science', 'DjMC', 'Paid', 'Pic', ''),
('171182', 'Dr. Jubayer Ahmed', '8801711871415', 'Medicine', 'RMC', '4000', 'ok', ''),
('', 'Dr. Salmun Nahar', '8801779562089', 'Obs & Gynae', 'FMC', 'Due : 2000', 'Pic', ''),
('176001', 'Dr. Sumit Kumar Saha', '8801674373045', 'Plastic Surgery', 'CoMC', '6000', 'Ok', ''),
('176002', 'Dr. Sadia Naureen', '8801799389879', 'MD', 'BMC', 'Paid', 'Ok', ''),
('176003', 'Dr. Sharfun Nahar Bilu', '8801755218949', 'Gynae ', 'RMC', 'Paid', 'Ok', ''),
('176004', 'Dr. Razia Sultana', '8801921798499', 'Microbiology', 'Enam MC', 'Paid', 'Ok', ''),
('176005', 'Dr. Snigdha Sarkar', '8801716198780', 'MS', 'FMC', 'Paid', 'Ok', ''),
('176006', 'Dr. Sharmin  Akter', '8801714499667', 'MD', 'SBMC', 'Paid', 'Pic', ''),
('176007', 'Dr. Md. Rashed Rabbi', '8801718700872', 'MD', 'SSMC', 'Due', 'Pic', ''),
('176008', 'Dr. Md. Kamuzzaman', '8801717884636', 'Int Medicine', 'UAMC', 'Paid', 'Ok', ''),
('176009', 'Dr. Shihab', '8801521229804', 'Medicine', 'SBMC', 'Due', 'Pic', ''),
('176010', 'Dr. S.M Zobair Hossain', '8801737055134', 'Medicine', 'SBMC', 'Due', 'Pic', ''),
('176011', 'Dr. Anchal Biswas', '8801796464244', 'Gynae ', 'MMC', 'Paid', 'Pic', ''),
('176012', 'Dr. Tonamy Chakma', '8801717039735', 'MS', 'FMC', 'Paid', 'Ok', ''),
('176013', 'Dr. Jahidul Islam', '8801911784852', 'Medicine', 'SBMC', '6000', 'Pic', ''),
('176014', 'Dr. Sirajus Shalakeen', '8801717457922', 'Bichemistry', 'SBMC', 'Due', 'Ok', ''),
('176015', 'Dr. Shariful Islam', '8801736149507', 'Neurosurgery', 'SBMC', 'Paid', 'Ok', ''),
('176016', 'Dr. Mariam Binte Farueq', '8801833287338', 'Medicine', 'CoMC', 'Paid', 'Ok', ''),
('176017', 'Dr. Eva Sen', '8801739782178', 'Oncology', 'TMMC', 'Paid', 'Ok', ''),
('176018', 'Dr. Md. Tanzimul Haque', '8801672145326', 'MD', 'AMUMC', '6000', 'Pic', ''),
('176019', 'Dr. Umama Islam', '8801741331922', 'MS', '', 'Paid', 'Pic', ''),
('176020', 'Dr. Shaan Muhammas Iran', '8801746020096', 'Neurosurgery', 'SSMC', '6000', 'Pic', ''),
('176021', 'Dr. Bhoskar Chandra Mondal', '8801717042934', 'Surgery', 'JIMC', '8000', 'Pic', ''),
('176022', 'Dr. Md. Faizur Razzaque Khan', '8801716689001', 'Ophthalmology', 'JRRMC', 'Paid', 'Ok', ''),
('176023', 'Dr. Fouzia Rahman', '8801721559574', 'Gynae ', 'East Wes MC', 'Paid', 'Pic', ''),
('176024', 'Dr. Ashika Ayrin', '8801784659497', 'Gynae ', 'EWMCH', 'Paid', 'Ok', ''),
('176025', 'Dr. Md. Masud Raihan', '8801722392240', 'Paediatrics', 'SMAMC', 'Paid', 'Ok', ''),
('176026', 'Dr. Md. Shahidul Islam', '8801722480688', 'Paediatrics', 'SoMC', 'Paid', 'Pic', ''),
('176027', 'Dr. Abeda Aktar', '8801772828228', 'Gynae ', 'Enam MC', 'Paid', 'Ok', ''),
('176028', 'Dr. Md. Rakibul Hassan', '8801784448888', 'MS', 'Enam MC', 'Paid', 'Ok', ''),
('176029', 'Dr. Shamma Rubab Khan', '8801738367334', 'MS', 'Enam MC', 'Paid', 'Pic', ''),
('176030', 'Dr. Lutfunnaher Annesha', '8801672828493', 'MS', 'Enam MC', 'Paid', 'Pic', ''),
('176031', 'Dr. Israt Jahan', '8801753943357', 'Gynae ', 'ZHSWMC', 'Paid', 'Ok', ''),
('176032', 'Dr. Moumita Dhar', '8801753996277', 'Gynae ', 'SSMC', 'Paid', 'Ok', ''),
('176033', 'Dr. Kazis Fatema', '8801749671699', 'Gynae ', 'DMC', 'Paid', 'Pic', ''),
('176034', 'Dr. Tasneem Jahan Juthika', '8801673017000', 'MD', 'AFMC', '6000', 'Ok', ''),
('176035', 'Dr. Md. Masudur Rahman', '8801612328331', 'Surgery', 'MMC', 'Paid', 'Ok', ''),
('176036', 'Dr. Sharmin Sultana', '8801929485900', 'Medicine', 'SSMC', '6000', 'Ok', ''),
('176037', 'Dr. Fahmida Rahman Khan', '8801786653910', 'Pathology', 'IMC', 'Paid', 'Ok', ''),
('176038', 'Dr. Mir Mayharul Islam', '8801721399923', 'MD', 'AMUMC', 'Paid', 'Pic', ''),
('176039', 'Dr. Khandakar Fatema', '8801913636316', 'Dermatology', 'Cox MC', 'Paid', 'Ok', ''),
('176040', 'Dr. Soma Banik', '8801912791729', 'Medicine', 'GSSVMC', 'Paid', 'Pic', ''),
('176041', 'Dr. Khaled Jahan Fahim', '8801716838567', 'MD', 'GSSVMC', 'Paid', 'Pic', ''),
('176042', 'Dr. Md. Ashraful Islam', '8801716197536', 'Basic', 'DNMC', 'Paid', 'Ok', ''),
('176043', 'Dr. Fareha Zaman', '8801670826141', 'Gynae ', 'NBMC', 'Paid', 'Ok', ''),
('176044', 'Dr. Md. Arif Ul Sayedin Alam', '8801719209395', 'Ophthalmology', 'IBMc', 'Paid', 'Ok', ''),
('176045', 'Dr. Shabina Yeshmin', '8801926784300', 'MD', 'COMc', 'Paid', 'Ok', ''),
('176046', 'Dr. Bushra Wahid', '8801710510248', 'Surgery', 'JIMC', '7000', 'Pic', ''),
('176047', 'Dr. Raihan Nizam', '8801717117550', 'Medicine', 'UAMC', '6000', 'Ok', ''),
('176048', 'Dr. Shamimd Akhter', '8801712860297', 'Ophthalmology', 'SBMc', 'Paid', 'Pic', ''),
('176049', 'Dr. Joydeep Goswani', '8801712169589', 'Medicine', 'RMC', '8000', 'Pic', ''),
('176050', 'Dr. Kaushik Roy', '8801863322311', 'Surgery', 'RpMC', '8000', 'Ok', ''),
('176051', 'Dr. Kazi Md Afzal Hussain', '8801724927201', 'MD', 'SSMC', 'Paid', 'OK', ''),
('176052', 'Dr. Manjurul Hasan', '8801675998929', 'MS', 'SSMC', '6000', 'Pic', ''),
('176053', 'Dr. Sharmin Akter', '8801673764583', 'MS', 'CMC', 'Paid', 'Pic', ''),
('176054', 'Dr. Susheafa Kumer', '8801770673470', 'MD', 'DSMC', '', 'Ok', ''),
('176055', 'Dr.Md Shariful Islam', '8801727109111', 'MS', 'EMC', 'Paid', 'Pic', ''),
('176056', 'Dr. Md Saniul Islam', '8801761797625', 'Surgery', 'RMC', 'Paid', 'Pic', ''),
('176057', 'Dr. Fathaha Nur Kale', '8801782442072', 'Radiology', 'MCWH', 'Paid', 'Ok', ''),
('176058', 'Dr. Kaze Jakaria Hossain', '8801833449845', 'MD', 'SBMC', 'Paid', 'Ok', ''),
('176059', 'Dr. Aminual Islam', '8801748573799', '', 'MMC', '6000', 'Pic', ''),
('176060', 'Dr. Goutam Saha', '8801735772251', 'MS', 'NBMC', '6000', 'Ok', ''),
('176061', 'Dr. Shahin Ara Ahmed', '8801674135271', '', 'SWMCH', 'Paid', 'Ok', ''),
('176062', 'Dr. Sayla Sultana', '8801762177235', '', 'RPMC', 'Paid', 'Ok', ''),
('176063', 'Dr. Mohammad Nasmd Hoshan', '8801816630068', 'Medicine', 'FMC', '6000', 'Ok', ''),
('176064', 'Dr. Md Najibul Haque', '8801772232996', 'MD', 'CBMC', 'Paid', 'Pic', ''),
('176065', 'Dr. Tamanna Tarin Toma', '8801704798309', 'MD', 'CBMC', 'Paid', 'Pic', ''),
('176066', 'Dr. Saria Tasnim', '8801772687141', 'MS', 'RMC', '1000', 'Ok', ''),
('176067', 'Dr.Jannatul Ferdous', '8801674928577', '', 'HFCMC', 'Paid', 'Ok', ''),
('176068', 'DR. Nasrat Khanam Nila', '8801738694808', 'Basic', 'DJMC', 'Paid', 'Ok', ''),
('176069', 'Dr. A.S. M. Sayem', '8801924267728', 'Orthopaeditrics', 'CMC', 'Paid', 'Ok', ''),
('176070', 'Dr. Mahfuz Ahmed Babu', '8801912763546', 'Paediatrics', 'JRRMC', '6000', 'Pic', ''),
('176071', 'Dr. Humayrashipfat Ara', '8801725371547', 'MS', 'DJMC', 'Due', 'Pic', ''),
('176072', 'Dr. Taszrian Lopa', '8801773071922', 'MS', 'SzMC', '9000', 'Ok', ''),
('176073', 'Dr. Shamima Nasrin', '8801750733944', 'Basic', 'DJMC', 'Paid', 'Pic', ''),
('176074', 'Dr. Asad Sikder', '8801917395021', 'Gastroenterology', 'FMC', '7000', 'Ok', ''),
('176075', 'Dr. Md. Jobayer Ahmod', '8801729814581', 'MD', 'SzMC', 'Paid', 'Ok', ''),
('176076', 'Dr. Sudip sarker', '8801727895854', 'Medicine', 'RpMC', 'Paid', 'Ok', ''),
('176077', 'Dr. Tahira Akhta', '8801833612605', 'Paediatrics', 'SzMC', 'Paid', 'Ok', ''),
('176078', 'Dr. Hadi Mohammad', '8801815000275', 'MD', 'SzMC', 'Paid', 'Ok', ''),
('176079', 'Dr. Shatayet Hossain', '8801720095009', 'MD', 'Enam MC', '8000', 'Ok', ''),
('176080', 'Dr. Tanvir Kabir', '8801946959192', 'MD', 'Enam MC', '9000', 'Ok', ''),
('176081', 'Dr. Mahmuda Akter Pallaby', '8801881488670', 'Medicine', 'Int MC', 'Due', 'Pic', ''),
('176082', 'Dr. Maliha Kamal', '8801675902789', 'Paediatrics', 'HFCMC', '2000', 'Pic', ''),
('176083', 'Dr. Tuhin biste Halim', '8801917720011', 'MD', 'CoMC', 'Paid', 'Pic', ''),
('176084', 'Dr. Bhagyoshnce', '8801672617188', 'Surgery', 'DNMC', '6000', 'Ok', ''),
('176085', 'Dr. Sultana Zakia Farady', '8801917191449', 'MD', 'GSSVMC', 'Paid', 'Pic', ''),
('176086', 'Dr. Shaekh Ahmed', '8801711580527', '', 'SoMC', 'Due', 'Ok', ''),
('176087', 'Dr. Jahirul Islam', '8801722870267', 'MD', 'KMC', 'Paid', 'Pic', ''),
('176088', 'Dr. Mohammad Faruk Ahmed', '8801742884000', 'Neurosurgery', 'RMC', 'Paid', 'Pic', ''),
('176089', 'Dr. Md. Nayazis Sharif', '8801747614693', 'MS', 'RPMC', '8000', 'Ok', ''),
('176090', 'Dr. Tasnuva Mahjabean', '8801822908900', 'Bichemistry', 'SSMC', 'Paid', 'Pic', ''),
('176091', 'Dr. Sunzia Sayed', '8801762595416', 'MS', 'CBMC', 'Due', 'Pic', ''),
('176092', 'Dr. Fatema Khatun', '8801794435923', 'Endocrinology', 'DJMC', '??', 'Ok', ''),
('176093', 'Dr. Sazzadul Kabir Zahin', '8801723978123', 'MD', 'KMC', 'Paid', 'Ok', ''),
('176094', 'Dr. Md. Jasim Uddin', '8801778366513', 'MS', 'SBMc', '6000', 'Ok', ''),
('176095', 'Dr. Nur Un Nabi', '8801921039549', 'MD', 'DNMC', 'Paid', 'Ok', ''),
('176096', 'Dr. Md. Alamin Akiv', '8801817692039', 'Surgery', 'Int MC', '6000', 'Pic', ''),
('176097', 'Dr. Mahiya Tasnim', '8801745591696', 'Surgery', 'Int MC', '6000', 'Pic', ''),
('176098', 'Dr. Rezwana A', '8801847163634', 'MD', 'JIMC', 'Paid', 'Ok', ''),
('176099', 'Dr. Zakirul Hasan Faruk', '8801712541596', 'Surgery', 'DiMC', 'Due', 'Pic', ''),
('176100', 'Dr. Susmita Banik', '8801682921051', 'MD', 'IMC', '1500', 'Pic', ''),
('176101', 'Dr. H. M Habib', '8801718084193', 'MS', 'EastMC', '6000', 'OK', ''),
('176102', 'Dr. Shams-Ul-Arefin', '8801740201676', 'MD', 'SEBMC', '6000', 'Pic', ''),
('176103', 'Dr. Sharmin Akter', '8801727853993', 'MD', 'RMC', '6000', 'Pic', ''),
('176104', 'Dr. Nilufa Yasmin', '8801777129457', 'MS', 'DMC', '6000', 'Ok', ''),
('176105', 'Dr. Syeda Zakia Afrin', '8801682212194', 'MD', 'SSMC', '6000', 'Ok', ''),
('176106', 'Dr. Ahsan Kabir', '8801777401642', 'CCM', 'DMUCMC', '8000', 'Pic', ''),
('176107', 'Dr. Romana Akhter', '8801672134269', 'MS', 'SPMC', '6000', 'Pic', ''),
('176108', 'Dr. Md. Shamsul Huda', '8801737152893', 'Surgery', 'DNMC', 'Paid', 'Ok', ''),
('176109', 'Dr. Noureen Amin', '8801717619482', 'Medicine', 'DMC', '2000', 'Ok', ''),
('176110', 'Dr. Abdullah -Al- Galib', '8801723021836', 'Surgery', 'RMC', 'Due', 'Pic', ''),
('176111', 'Dr. Afif Hossin', '8801717444214', 'MS', 'KYAMC', '2000', 'Ok', ''),
('176112', 'Dr. Shoaib', '8801710245058', 'MD', 'RPMC', 'Due', 'Ok', ''),
('176113', 'Dr. Md Mahabub Alam', '8801710376839', 'MS', 'SSMC', '9000', 'Ok', ''),
('176114', 'Dr. Taposi Saha', '8801716783433', 'MD', 'DelMC', '6000', 'Ok', ''),
('176115', 'Dr. Mohua Chatterjee', '8801748137545', 'Medicine', 'SSMC', '8000', 'Pic', ''),
('176116', 'Dr. Tanjila Salam', '8801937775460', 'MS', 'SZRMC', '8000', 'Ok', ''),
('176117', 'Dr. Zuboer Wasit Nasif', '8801983843173', 'MD', 'SZRMC', '8000', 'Ok', ''),
('176118', 'Dr. Hassan Al Banna', '8801918223277', 'Neurology', 'CMC', 'Due', 'Ok', ''),
('176119', 'Dr. Amena Bintay Yousuf', '8801741330075', 'Surgery', 'Adi Wmc', 'Paid', 'Ok', ''),
('176120', 'Dr. Moazzan Hossain Khan', '8801716470333', 'MS', 'MMC', '6000', 'Pic', ''),
('176121', 'Dr. SMA Mahmudul Hoque', '8801730448921', '', 'DaMC', '4000', 'Pic', ''),
('176122', 'Dr. Rijwnul  Kaber', '8801710100008', 'Surgery', 'DaMC', '6000', 'Pic', ''),
('176123', 'Dr. Tahamina Akter', '8801799429975', 'Gynae ', 'USTC', '6000', 'Pic', ''),
('176124', 'Dr. Istiak Hasan Taufique', '8801763240816', 'MS', 'CMC', 'Due', 'Pic', ''),
('176125', 'Dr. Kazi Eshika Raka', '8801712146770', '', 'NBMC', 'Due', 'Pic', ''),
('176126', 'Dr.Muhammad Hafijur Rahman', '8801671850749', 'Cardilogy', 'DAMC', '6000', 'Pic', ''),
('176127', 'Dr. Murshada Jahan', '8801965838481', '', 'GSMC', '6000', 'Pic', ''),
('176128', 'Dr. Kamrul Hasan', '8801718907819', '', 'KMC', '6000', 'Pic', ''),
('176129', 'Dr SM Kawsar', '8801783045554', 'Surgery', 'SMC', 'Paid', 'Pic', ''),
('176130', 'Dr. Zakia Tasnim', '8801704211096', 'MD', 'RMC', '2000', 'Pic', ''),
('176131', 'Dr. Nayema Munmun', '8801677239961', 'Surgery', 'SBMc', 'Due', 'Ok', ''),
('176132', 'Dr. Tamanna Parvin', '8801723760765', 'Surgery', 'SBMc', 'Due', 'Ok', ''),
('176133', 'Dr. Uzzal Hossain', '8801719475615', 'Medicine', 'RMC', 'Due', 'Pic', ''),
('176134', 'Dr. Nadia Mahabub', '8801625494750', 'MS', 'GSMC', 'Due', 'Pic', ''),
('176135', 'Dr. Mahfuja Sharif', '8801689175147', 'MS', 'SBMC', 'Paid', 'Pic', ''),
('176136', 'Dr. Zannapul Ferdaus', '8801717588028', 'Basic', 'SMOMC', '6000', 'Pic', ''),
('176137', 'Dr. Rockeya Akhtar', '8801739493003', 'MD', 'RMC', 'Due', 'Pic', ''),
('176138', 'Dr. Asma Ul Hosna', '8801726504677', 'Medicine', 'IMC', '6000', 'ok', ''),
('176139', 'Dr. Md Fuad Bin bahar', '8801736518711', 'MD', 'CMC', '8000', 'Pic', ''),
('176140', 'Dr. Arif Ahmad Jony', '8801754870179', 'Medicine', 'AZRMC', '6000', 'Pic', ''),
('176141', 'Dr. Shakia Zaman', '8801712251801', 'Medicine', 'CMC', 'Paid', 'Ok', ''),
('176142', 'Dr. Samira Naznin', '8801712212236', 'Medicine', 'CMC', 'Paid', 'Pic', ''),
('176143', 'Dr. Md Masurdur Rahman', '8801717284476', 'MD', 'KYAMC', '7000', 'Ok', ''),
('176144', 'Dr. Sheikh Rakibul Hassan', '8801711464767', 'Surgery', 'DMC', 'Paid', 'Pic', ''),
('176145', 'Dr. Md Ahsam Uz Zaman', '8801718163171', 'Pathology', 'SOBMC', 'Paid', 'Pic', ''),
('176146', 'Dr. Sheefat Rahman', '8801717112528', 'Nephrology', 'SBMc', 'Paid', 'Pic', ''),
('176147', 'Dr. Somaya Akter', '8801924652172', '', 'GSVMC', 'Paid', 'Pic', ''),
('176148', 'Dr. Sharmin Rahman', '8801798149868', '', 'GMC', 'Paid', 'Pic', ''),
('176149', 'Dr. Sharif Shaila Islam', '8801797475560', 'Gynae ', 'SBMc', '6000', 'Pic', ''),
('176150', 'Dr. Moniruzzaman Khan', '8801710660098', 'Surgery', 'NIMC', '10000', 'Ok', ''),
('176151', 'Dr. Md Mahfuzul  Alam', '8801736010641', 'Cardilogy', 'KMC', 'Paid', 'Ok', ''),
('176152', 'Dr. Esha Khan Rana', '8801671425722', 'Medicine', 'SSMC', '5000', 'Ok', ''),
('176153', 'Dr. Md. Hanif Uddin', '8801710099830', 'MD', 'SzMC', '6000', 'Ok', ''),
('176154', 'Dr. Tasnuva Arif', '8801521517394', 'Paediatrics', 'ShSMC', 'Paid', 'Ok', ''),
('176155', 'Dr. Taslima Sharmin', '8801715000033', 'Radiology', 'SoMC', 'Paid', 'Ok', ''),
('176156', 'Dr. Dipika Khanom', '8801717675290', 'MS', 'KYAMC', '6000', 'Ok', ''),
('176157', 'Dr. Khatun E Zannat', '8801912846434', 'Basic', 'SWMCH', '8000', 'Pic', ''),
('176158', 'Dr. Akhi Roy Bipasha', '8801674060511', 'Gynae ', 'DMC', 'Paid', 'Ok', ''),
('176159', 'Dr. Rasd-e-Afroza Parvin', '8801979402972', 'Gynae', 'CMC', '7000', 'Pic', ''),
('176160', 'Dr. Jakia Momotaz', '8801723232199', 'Gynae ', 'FMC', '4000', 'Ok', ''),
('176161', 'Dr. Md. Al Amin', '8801952086017', '', 'KYAMC', '2000', 'Pic', ''),
('176162', 'Dr. Afseen Chowdhury', '8801747113529', 'Gynae', 'SoMC', 'Paid', 'Ok', ''),
('176163', 'Dr. Sharif updin Hasnat', '8801710366798', 'Neurology', 'ShSMC', '6000', 'Pic', ''),
('176164', 'Dr. Nupur Akter', '8801748645513', 'MS', 'SBMc', '6000', 'Ok', ''),
('176165', 'Dr. Sharmin Sultana', '8801720213191', 'MD', 'SzMC', '8000', 'Ok', ''),
('176166', 'Dr. Nazia Tasrin Sopan', '8801717517425', 'MD', 'SzMC', '8000', 'Pic', ''),
('176167', 'Dr. Shakeeb Ehsan Khan', '8801730438409', 'MD', 'UAMC', 'Paid', 'Ok', ''),
('176168', 'Dr. Jafrin Jahan', '8801716793173', 'Medicine', 'FMC', 'Paid', 'Ok', ''),
('176169', 'Dr. Lubna Sharmin', '8801716195497', 'Medicine', 'EMC', 'Paid', 'Ok', ''),
('176170', 'Dr. Nurul Islam', '8801739006545', 'MD', 'SSMC', '2000', 'Pic', ''),
('176171', 'Dr. Md Belal Hussain', '8801720624132', 'MD', 'CMC', '5000', 'Ok', ''),
('176172', 'Dr. Md. Zohurul Islam', '8801710245978', 'Surgery', 'SEBMC', '4000', 'Pic', ''),
('176173', 'Dr. Rumana Rashid', '8801911661534', 'MD', 'HFRCMC', '8000', 'Pic', ''),
('176174', 'Dr. Rajina Sultana Mily', '8801672233834', 'Gynae', 'South.MC', 'Paid', 'Ok', ''),
('176175', 'Dr. Sayed Sharif Ahammad', '8801716052334', 'Medicine', 'CMC', '6000', 'Ok', ''),
('', 'Dr. Farhana Begum', '8801673609539', 'Basic', 'DNMC', 'Due', 'Pic', ''),
('', 'Dr. Md Al Amin', '8801952086017', 'MD', 'KYAMC', '2000', 'Pic', ''),
('', 'Dr. Borna', '8801711024599', 'MS', 'CMC', '5000', 'Pic', '');

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE IF NOT EXISTS `modules` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `sl` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `course_id`, `name`, `duration`, `sl`) VALUES
(1, 1, 'Contemporary issues in medical education', '1 Month', 1),
(2, 1, 'Instructional design', '1 Month', 2),
(3, 1, 'Teaching-learning', '1 Month', 3),
(4, 1, 'Assessment', '1 Month', 4);

-- --------------------------------------------------------

--
-- Table structure for table `module_units`
--

CREATE TABLE IF NOT EXISTS `module_units` (
  `id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `module_id` int(11) DEFAULT NULL,
  `code` varchar(10) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `details` text,
  `links` text,
  `duration` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `module_units`
--

INSERT INTO `module_units` (`id`, `course_id`, `module_id`, `code`, `name`, `details`, `links`, `duration`, `status`) VALUES
(14, 1, 1, 'CI1', 'Curriculum development', 'PHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7bGluZS1oZWlnaHQ6MTE1JTtmb250LWZhbWlseToKJnF1b3Q7VGltZXMgTmV3IFJvbWFuJnF1b3Q7LCZxdW90O3NlcmlmJnF1b3Q7Ij48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+PHAgY2xhc3M9Ik1zb0xpc3RQYXJhZ3JhcGhDeFNwRmlyc3QiIHN0eWxlPSJ0ZXh0LWluZGVudDotLjI1aW47bXNvLWxpc3Q6bDMgbGV2ZWwxIGxmbzEiPjwhLS1baWYgIXN1cHBvcnRMaXN0c10tLT48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdDtsaW5lLWhlaWdodDoxMTUlO2ZvbnQtZmFtaWx5OiZxdW90O1RpbWVzIE5ldyBSb21hbiZxdW90OywmcXVvdDtzZXJpZiZxdW90OzsKbXNvLWZhcmVhc3QtZm9udC1mYW1pbHk6JnF1b3Q7VGltZXMgTmV3IFJvbWFuJnF1b3Q7Ij4xLjxzcGFuIHN0eWxlPSJmb250LXZhcmlhbnQtbnVtZXJpYzogbm9ybWFsOyBmb250LXZhcmlhbnQtZWFzdC1hc2lhbjogbm9ybWFsOyBmb250LXN0cmV0Y2g6IG5vcm1hbDsgZm9udC1zaXplOiA3cHQ7IGxpbmUtaGVpZ2h0OiBub3JtYWw7IGZvbnQtZmFtaWx5OiAmcXVvdDtUaW1lcyBOZXcgUm9tYW4mcXVvdDs7Ij4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgPC9zcGFuPjwvc3Bhbj48IS0tW2VuZGlmXS0tPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2xpbmUtaGVpZ2h0OjExNSU7Zm9udC1mYW1pbHk6JnF1b3Q7VGltZXMgTmV3IFJvbWFuJnF1b3Q7LCZxdW90O3NlcmlmJnF1b3Q7Ij5UaXRsZQpvZiB0aGUgdW5pdDogPGI+Q3VycmljdWx1bSBQbGFubmluZyBhbmQKZGV2ZWxvcG1lbnQ8L2I+PG86cD48L286cD48L3NwYW4+PC9wPjxwIGNsYXNzPSJNc29MaXN0UGFyYWdyYXBoQ3hTcE1pZGRsZSIgc3R5bGU9InRleHQtaW5kZW50Oi0uMjVpbjttc28tbGlzdDpsMyBsZXZlbDEgbGZvMSI+PCEtLVtpZiAhc3VwcG9ydExpc3RzXS0tPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2xpbmUtaGVpZ2h0OjExNSU7Zm9udC1mYW1pbHk6JnF1b3Q7VGltZXMgTmV3IFJvbWFuJnF1b3Q7LCZxdW90O3NlcmlmJnF1b3Q7Owptc28tZmFyZWFzdC1mb250LWZhbWlseTomcXVvdDtUaW1lcyBOZXcgUm9tYW4mcXVvdDsiPjIuPHNwYW4gc3R5bGU9ImZvbnQtdmFyaWFudC1udW1lcmljOiBub3JtYWw7IGZvbnQtdmFyaWFudC1lYXN0LWFzaWFuOiBub3JtYWw7IGZvbnQtc3RyZXRjaDogbm9ybWFsOyBmb250LXNpemU6IDdwdDsgbGluZS1oZWlnaHQ6IG5vcm1hbDsgZm9udC1mYW1pbHk6ICZxdW90O1RpbWVzIE5ldyBSb21hbiZxdW90OzsiPiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyA8L3NwYW4+PC9zcGFuPjwhLS1bZW5kaWZdLS0+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7bGluZS1oZWlnaHQ6MTE1JTtmb250LWZhbWlseTomcXVvdDtUaW1lcyBOZXcgUm9tYW4mcXVvdDssJnF1b3Q7c2VyaWYmcXVvdDsiPk9iamVjdGl2ZXMKb2YgbGVhcm5pbmcgdGhlIHVuaXQ6IEFmdGVyIGNvbXBsZXRpb24gb2YgdGhlIHVuaXQsIGZlbGxvd3Mgd2lsbCBiZSBhYmxlIHRvOiA8bzpwPjwvbzpwPjwvc3Bhbj48L3A+PHAgY2xhc3M9Ik1zb0xpc3RQYXJhZ3JhcGhDeFNwTWlkZGxlIiBzdHlsZT0ibWFyZ2luLWxlZnQ6Ljc1aW47bXNvLWFkZC1zcGFjZToKYXV0bzt0ZXh0LWluZGVudDotLjI1aW47bXNvLWxpc3Q6bDAgbGV2ZWwxIGxmbzQiPjwhLS1baWYgIXN1cHBvcnRMaXN0c10tLT48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdDtsaW5lLWhlaWdodDoxMTUlO2ZvbnQtZmFtaWx5OiZxdW90O1RpbWVzIE5ldyBSb21hbiZxdW90OywmcXVvdDtzZXJpZiZxdW90OzsKbXNvLWZhcmVhc3QtZm9udC1mYW1pbHk6JnF1b3Q7VGltZXMgTmV3IFJvbWFuJnF1b3Q7Ij5hKTxzcGFuIHN0eWxlPSJmb250LXZhcmlhbnQtbnVtZXJpYzogbm9ybWFsOyBmb250LXZhcmlhbnQtZWFzdC1hc2lhbjogbm9ybWFsOyBmb250LXN0cmV0Y2g6IG5vcm1hbDsgZm9udC1zaXplOiA3cHQ7IGxpbmUtaGVpZ2h0OiBub3JtYWw7IGZvbnQtZmFtaWx5OiAmcXVvdDtUaW1lcyBOZXcgUm9tYW4mcXVvdDs7Ij4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgPC9zcGFuPjwvc3Bhbj48IS0tW2VuZGlmXS0tPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2xpbmUtaGVpZ2h0OjExNSU7Zm9udC1mYW1pbHk6JnF1b3Q7VGltZXMgTmV3IFJvbWFuJnF1b3Q7LCZxdW90O3NlcmlmJnF1b3Q7Ij5EZWZpbmUKdGhlIGN1cnJpY3VsdW0gPG86cD48L286cD48L3NwYW4+PC9wPjxwIGNsYXNzPSJNc29MaXN0UGFyYWdyYXBoQ3hTcE1pZGRsZSIgc3R5bGU9Im1hcmdpbi1sZWZ0Oi43NWluO21zby1hZGQtc3BhY2U6CmF1dG87dGV4dC1pbmRlbnQ6LS4yNWluO21zby1saXN0OmwwIGxldmVsMSBsZm80Ij48IS0tW2lmICFzdXBwb3J0TGlzdHNdLS0+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7bGluZS1oZWlnaHQ6MTE1JTtmb250LWZhbWlseTomcXVvdDtUaW1lcyBOZXcgUm9tYW4mcXVvdDssJnF1b3Q7c2VyaWYmcXVvdDs7Cm1zby1mYXJlYXN0LWZvbnQtZmFtaWx5OiZxdW90O1RpbWVzIE5ldyBSb21hbiZxdW90OyI+Yik8c3BhbiBzdHlsZT0iZm9udC12YXJpYW50LW51bWVyaWM6IG5vcm1hbDsgZm9udC12YXJpYW50LWVhc3QtYXNpYW46IG5vcm1hbDsgZm9udC1zdHJldGNoOiBub3JtYWw7IGZvbnQtc2l6ZTogN3B0OyBsaW5lLWhlaWdodDogbm9ybWFsOyBmb250LWZhbWlseTogJnF1b3Q7VGltZXMgTmV3IFJvbWFuJnF1b3Q7OyI+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IDwvc3Bhbj48L3NwYW4+PCEtLVtlbmRpZl0tLT48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdDtsaW5lLWhlaWdodDoxMTUlO2ZvbnQtZmFtaWx5OiZxdW90O1RpbWVzIE5ldyBSb21hbiZxdW90OywmcXVvdDtzZXJpZiZxdW90OyI+Jm5ic3A7RXhwbGFpbiB0aGUgZGlmZmVyZW50IGFzcGVjdHMgb2YgY3VycmljdWx1bTxvOnA+PC9vOnA+PC9zcGFuPjwvcD48cCBjbGFzcz0iTXNvTGlzdFBhcmFncmFwaEN4U3BNaWRkbGUiIHN0eWxlPSJtYXJnaW4tbGVmdDouNzVpbjttc28tYWRkLXNwYWNlOgphdXRvO3RleHQtaW5kZW50Oi0uMjVpbjttc28tbGlzdDpsMCBsZXZlbDEgbGZvNCI+PCEtLVtpZiAhc3VwcG9ydExpc3RzXS0tPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2xpbmUtaGVpZ2h0OjExNSU7Zm9udC1mYW1pbHk6JnF1b3Q7VGltZXMgTmV3IFJvbWFuJnF1b3Q7LCZxdW90O3NlcmlmJnF1b3Q7Owptc28tZmFyZWFzdC1mb250LWZhbWlseTomcXVvdDtUaW1lcyBOZXcgUm9tYW4mcXVvdDsiPmMpPHNwYW4gc3R5bGU9ImZvbnQtdmFyaWFudC1udW1lcmljOiBub3JtYWw7IGZvbnQtdmFyaWFudC1lYXN0LWFzaWFuOiBub3JtYWw7IGZvbnQtc3RyZXRjaDogbm9ybWFsOyBmb250LXNpemU6IDdwdDsgbGluZS1oZWlnaHQ6IG5vcm1hbDsgZm9udC1mYW1pbHk6ICZxdW90O1RpbWVzIE5ldyBSb21hbiZxdW90OzsiPiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyA8L3NwYW4+PC9zcGFuPjwhLS1bZW5kaWZdLS0+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7bGluZS1oZWlnaHQ6MTE1JTtmb250LWZhbWlseTomcXVvdDtUaW1lcyBOZXcgUm9tYW4mcXVvdDssJnF1b3Q7c2VyaWYmcXVvdDsiPiZuYnNwO1N0YXRlIHRoZSBiYXNpYyBxdWVzdGlvbnMgZHVyaW5nIGN1cnJpY3VsdW0KcGxhbm5pbmc8bzpwPjwvbzpwPjwvc3Bhbj48L3A+PHAgY2xhc3M9Ik1zb0xpc3RQYXJhZ3JhcGhDeFNwTWlkZGxlIiBzdHlsZT0ibWFyZ2luLWxlZnQ6Ljc1aW47bXNvLWFkZC1zcGFjZToKYXV0bzt0ZXh0LWluZGVudDotLjI1aW47bXNvLWxpc3Q6bDAgbGV2ZWwxIGxmbzQiPjwhLS1baWYgIXN1cHBvcnRMaXN0c10tLT48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdDtsaW5lLWhlaWdodDoxMTUlO2ZvbnQtZmFtaWx5OiZxdW90O1RpbWVzIE5ldyBSb21hbiZxdW90OywmcXVvdDtzZXJpZiZxdW90OzsKbXNvLWZhcmVhc3QtZm9udC1mYW1pbHk6JnF1b3Q7VGltZXMgTmV3IFJvbWFuJnF1b3Q7Ij5kKTxzcGFuIHN0eWxlPSJmb250LXZhcmlhbnQtbnVtZXJpYzogbm9ybWFsOyBmb250LXZhcmlhbnQtZWFzdC1hc2lhbjogbm9ybWFsOyBmb250LXN0cmV0Y2g6IG5vcm1hbDsgZm9udC1zaXplOiA3cHQ7IGxpbmUtaGVpZ2h0OiBub3JtYWw7IGZvbnQtZmFtaWx5OiAmcXVvdDtUaW1lcyBOZXcgUm9tYW4mcXVvdDs7Ij4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgPC9zcGFuPjwvc3Bhbj48IS0tW2VuZGlmXS0tPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2xpbmUtaGVpZ2h0OjExNSU7Zm9udC1mYW1pbHk6JnF1b3Q7VGltZXMgTmV3IFJvbWFuJnF1b3Q7LCZxdW90O3NlcmlmJnF1b3Q7Ij4mbmJzcDtEZXNjcmliZSB0aGUgZWR1Y2F0aW9uYWwgc3RyYXRlZ2llcyBmb3IKaW1wbGVtZW50YXRpb24gb2YgY3VycmljdWx1bTxvOnA+PC9vOnA+PC9zcGFuPjwvcD48cCBjbGFzcz0iTXNvTGlzdFBhcmFncmFwaEN4U3BNaWRkbGUiIHN0eWxlPSJtYXJnaW4tbGVmdDouNzVpbjttc28tYWRkLXNwYWNlOgphdXRvO3RleHQtaW5kZW50Oi0uMjVpbjttc28tbGlzdDpsMCBsZXZlbDEgbGZvNCI+PCEtLVtpZiAhc3VwcG9ydExpc3RzXS0tPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2xpbmUtaGVpZ2h0OjExNSU7Zm9udC1mYW1pbHk6JnF1b3Q7VGltZXMgTmV3IFJvbWFuJnF1b3Q7LCZxdW90O3NlcmlmJnF1b3Q7Owptc28tZmFyZWFzdC1mb250LWZhbWlseTomcXVvdDtUaW1lcyBOZXcgUm9tYW4mcXVvdDsiPmUpPHNwYW4gc3R5bGU9ImZvbnQtdmFyaWFudC1udW1lcmljOiBub3JtYWw7IGZvbnQtdmFyaWFudC1lYXN0LWFzaWFuOiBub3JtYWw7IGZvbnQtc3RyZXRjaDogbm9ybWFsOyBmb250LXNpemU6IDdwdDsgbGluZS1oZWlnaHQ6IG5vcm1hbDsgZm9udC1mYW1pbHk6ICZxdW90O1RpbWVzIE5ldyBSb21hbiZxdW90OzsiPiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyA8L3NwYW4+PC9zcGFuPjwhLS1bZW5kaWZdLS0+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7bGluZS1oZWlnaHQ6MTE1JTtmb250LWZhbWlseTomcXVvdDtUaW1lcyBOZXcgUm9tYW4mcXVvdDssJnF1b3Q7c2VyaWYmcXVvdDsiPiZuYnNwO0Rpc3Rpbmd1aXNoIGJldHdlZW4gY29yZSBhbmQgc3BlY2lhbCBzdHVkeQptb2R1bGUgPG86cD48L286cD48L3NwYW4+PC9wPjxwIGNsYXNzPSJNc29MaXN0UGFyYWdyYXBoQ3hTcE1pZGRsZSIgc3R5bGU9InRleHQtaW5kZW50Oi0uMjVpbjttc28tbGlzdDpsMyBsZXZlbDEgbGZvMSI+PCEtLVtpZiAhc3VwcG9ydExpc3RzXS0tPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2xpbmUtaGVpZ2h0OjExNSU7Zm9udC1mYW1pbHk6JnF1b3Q7VGltZXMgTmV3IFJvbWFuJnF1b3Q7LCZxdW90O3NlcmlmJnF1b3Q7Owptc28tZmFyZWFzdC1mb250LWZhbWlseTomcXVvdDtUaW1lcyBOZXcgUm9tYW4mcXVvdDsiPjMuPHNwYW4gc3R5bGU9ImZvbnQtdmFyaWFudC1udW1lcmljOiBub3JtYWw7IGZvbnQtdmFyaWFudC1lYXN0LWFzaWFuOiBub3JtYWw7IGZvbnQtc3RyZXRjaDogbm9ybWFsOyBmb250LXNpemU6IDdwdDsgbGluZS1oZWlnaHQ6IG5vcm1hbDsgZm9udC1mYW1pbHk6ICZxdW90O1RpbWVzIE5ldyBSb21hbiZxdW90OzsiPiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyA8L3NwYW4+PC9zcGFuPjwhLS1bZW5kaWZdLS0+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7bGluZS1oZWlnaHQ6MTE1JTtmb250LWZhbWlseTomcXVvdDtUaW1lcyBOZXcgUm9tYW4mcXVvdDssJnF1b3Q7c2VyaWYmcXVvdDsiPkludHJvZHVjdGlvbjombmJzcDsgQ3VycmljdWx1bSByZWZlcnMgdG8gYSBzZXJpZXMgb2YgcGxhbm5lZAphY3Rpdml0aWVzIG9yIGFuIG9yZ2FuaXplZCBwbGFuIG9mIGNvdXJzZSBvdXRsaW5lIGFsb25nIHdpdGggdGhlIG9iamVjdGl2ZXMKaW50ZW5kZWQgZm9yIHRoZSBhY2hpZXZlbWVudCBvZiB0aGVzZSBhY3Rpdml0aWVzLjxvOnA+PC9vOnA+PC9zcGFuPjwvcD48cCBjbGFzcz0iTXNvTGlzdFBhcmFncmFwaEN4U3BNaWRkbGUiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2xpbmUtaGVpZ2h0OgoxMTUlO2ZvbnQtZmFtaWx5OiZxdW90O1RpbWVzIE5ldyBSb21hbiZxdW90OywmcXVvdDtzZXJpZiZxdW90OyI+QWx0aG91Z2ggbWFueSB0ZWFjaGVycyB1c2VkCmN1cnJpY3VsdW0gYW5kIHN5bGxhYnVzIHN5bm9ueW1vdXNseSBidXQgdGhlIHN5bGxhYnVzIGlzIHRoZSBwbGFuIGZvciBlbnRpcmUKY291cnNlIGFuZCB0aGVyZSBpcyBvbmx5IGFzc2VtYmx5IGFuZCBhc3NpbWlsYXRpb24gb2YgYSBsb25nIGxpc3Qgb2YgY29udGVudHMuCkEgY3VycmljdWx1bSBpcyBtb3JlIHRoYW4ganVzdCBhIHN5bGxhYnVzLiA8bzpwPjwvbzpwPjwvc3Bhbj48L3A+PHAgY2xhc3M9Ik1zb0xpc3RQYXJhZ3JhcGhDeFNwTWlkZGxlIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdDtsaW5lLWhlaWdodDoKMTE1JTtmb250LWZhbWlseTomcXVvdDtUaW1lcyBOZXcgUm9tYW4mcXVvdDssJnF1b3Q7c2VyaWYmcXVvdDsiPiZuYnNwOzxvOnA+PC9vOnA+PC9zcGFuPjwvcD48cCBjbGFzcz0iTXNvTGlzdFBhcmFncmFwaEN4U3BNaWRkbGUiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2xpbmUtaGVpZ2h0OgoxMTUlO2ZvbnQtZmFtaWx5OiZxdW90O1RpbWVzIE5ldyBSb21hbiZxdW90OywmcXVvdDtzZXJpZiZxdW90OyI+Q3VycmljdWx1bSBkZXZlbG9wbWVudCBpcyBkZWZpbmVkCmFzIHBsYW5uZWQsIHB1cnBvc2VmdWwsIHByb2dyZXNzaXZlIGFuZCBzeXN0ZW1hdGljIHByb2Nlc3MgaW4gb3JkZXIgdG8gY3JlYXRlCnBvc2l0aXZlIGltcHJvdmVtZW50cyBpbiBlZHVjYXRpb25hbCBzeXN0ZW0uIEl0IGVuY29tcGFzc2VzIHRoZSBwbGFubmluZyBvZgpsZWFybmluZyBvcHBvcnR1bml0aWVzIGludGVuZGVkIHRvIGJyaW5nIGFib3V0IGNlcnRhaW4gY2hhbmdlcyBpbiBzdHVkZW50cyBhbmQKYXNzZXNzbWVudCBvZiB0aGUgZXh0ZW50IHRvIHdoaWNoIHRoZXNlIGNoYW5nZXMgaGF2ZSB0YWtlbiBwbGFjZS4gU28sIGl0CmNvbnNpc3RzIG9mIHRoZSBnb2FscyBhbmQgb2JqZWN0aXZlcyBvZiB0aGUgY291cnNlLCB0aGUgZWR1Y2F0aW9uYWwgc3RyYXRlZ2llcwpmb3IgYWNoaWV2aW5nIHRoZSBnb2FscyBhbmQgdGhlIG1lYW5zIG9mIGV2YWx1YXRpbmcgdGhlIG91dGNvbWVzIG9mIHN1Y2gKc3RyYXRlZ2llcy48bzpwPjwvbzpwPjwvc3Bhbj48L3A+PHAgY2xhc3M9Ik1zb0xpc3RQYXJhZ3JhcGhDeFNwTWlkZGxlIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdDtsaW5lLWhlaWdodDoKMTE1JTtmb250LWZhbWlseTomcXVvdDtUaW1lcyBOZXcgUm9tYW4mcXVvdDssJnF1b3Q7c2VyaWYmcXVvdDsiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD48cCBjbGFzcz0iTXNvTGlzdFBhcmFncmFwaEN4U3BNaWRkbGUiIHN0eWxlPSJ0ZXh0LWluZGVudDotLjI1aW47bXNvLWxpc3Q6bDMgbGV2ZWwxIGxmbzEiPjwhLS1baWYgIXN1cHBvcnRMaXN0c10tLT48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdDtsaW5lLWhlaWdodDoxMTUlO2ZvbnQtZmFtaWx5OiZxdW90O1RpbWVzIE5ldyBSb21hbiZxdW90OywmcXVvdDtzZXJpZiZxdW90OzsKbXNvLWZhcmVhc3QtZm9udC1mYW1pbHk6JnF1b3Q7VGltZXMgTmV3IFJvbWFuJnF1b3Q7Ij40LjxzcGFuIHN0eWxlPSJmb250LXZhcmlhbnQtbnVtZXJpYzogbm9ybWFsOyBmb250LXZhcmlhbnQtZWFzdC1hc2lhbjogbm9ybWFsOyBmb250LXN0cmV0Y2g6IG5vcm1hbDsgZm9udC1zaXplOiA3cHQ7IGxpbmUtaGVpZ2h0OiBub3JtYWw7IGZvbnQtZmFtaWx5OiAmcXVvdDtUaW1lcyBOZXcgUm9tYW4mcXVvdDs7Ij4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgPC9zcGFuPjwvc3Bhbj48IS0tW2VuZGlmXS0tPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2xpbmUtaGVpZ2h0OjExNSU7Zm9udC1mYW1pbHk6JnF1b3Q7VGltZXMgTmV3IFJvbWFuJnF1b3Q7LCZxdW90O3NlcmlmJnF1b3Q7Ij5UZWFjaGluZy1sZWFybmluZwptZXRob2RzOjxvOnA+PC9vOnA+PC9zcGFuPjwvcD48cCBjbGFzcz0iTXNvTGlzdFBhcmFncmFwaEN4U3BNaWRkbGUiIHN0eWxlPSJtYXJnaW4tbGVmdDouNzVpbjttc28tYWRkLXNwYWNlOgphdXRvO3RleHQtaW5kZW50Oi0uMjVpbjttc28tbGlzdDpsNCBsZXZlbDEgbGZvMiI+PCEtLVtpZiAhc3VwcG9ydExpc3RzXS0tPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2xpbmUtaGVpZ2h0OjExNSU7Zm9udC1mYW1pbHk6JnF1b3Q7VGltZXMgTmV3IFJvbWFuJnF1b3Q7LCZxdW90O3NlcmlmJnF1b3Q7Owptc28tZmFyZWFzdC1mb250LWZhbWlseTomcXVvdDtUaW1lcyBOZXcgUm9tYW4mcXVvdDsiPmEpPHNwYW4gc3R5bGU9ImZvbnQtdmFyaWFudC1udW1lcmljOiBub3JtYWw7IGZvbnQtdmFyaWFudC1lYXN0LWFzaWFuOiBub3JtYWw7IGZvbnQtc3RyZXRjaDogbm9ybWFsOyBmb250LXNpemU6IDdwdDsgbGluZS1oZWlnaHQ6IG5vcm1hbDsgZm9udC1mYW1pbHk6ICZxdW90O1RpbWVzIE5ldyBSb21hbiZxdW90OzsiPiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyA8L3NwYW4+PC9zcGFuPjwhLS1bZW5kaWZdLS0+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7bGluZS1oZWlnaHQ6MTE1JTtmb250LWZhbWlseTomcXVvdDtUaW1lcyBOZXcgUm9tYW4mcXVvdDssJnF1b3Q7c2VyaWYmcXVvdDsiPkZhY2UKdG8gZmFjZSBpbnRlcmFjdGl2ZSBsZWN0dXJlIG9uIHRoZSBjdXJyaWN1bHVtIGZvciB3aG9sZSBncm91cCBhdCB0aGUgY2VudHJlLiA8bzpwPjwvbzpwPjwvc3Bhbj48L3A+PHAgY2xhc3M9Ik1zb0xpc3RQYXJhZ3JhcGhDeFNwTWlkZGxlIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdDtsaW5lLWhlaWdodDoKMTE1JTtmb250LWZhbWlseTomcXVvdDtUaW1lcyBOZXcgUm9tYW4mcXVvdDssJnF1b3Q7c2VyaWYmcXVvdDsiPmIpIEluZGl2aWR1YWxpemVkIGxlYXJuaW5nOiBSZWFkaW5nCnNlbGVjdGl2ZSBjaGFwdGVycyBmcm9tIGJvb2tzLCBhcnRpY2xlcyBmcm9tIGpvdXJuYWxzIGFuZCBmcm9tIHdlYnNpdGU8bzpwPjwvbzpwPjwvc3Bhbj48L3A+PHAgY2xhc3M9Ik1zb0xpc3RQYXJhZ3JhcGhDeFNwTWlkZGxlIiBzdHlsZT0idGV4dC1pbmRlbnQ6LS4yNWluO21zby1saXN0OmwzIGxldmVsMSBsZm8xIj48IS0tW2lmICFzdXBwb3J0TGlzdHNdLS0+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7bGluZS1oZWlnaHQ6MTE1JTtmb250LWZhbWlseTomcXVvdDtUaW1lcyBOZXcgUm9tYW4mcXVvdDssJnF1b3Q7c2VyaWYmcXVvdDs7Cm1zby1mYXJlYXN0LWZvbnQtZmFtaWx5OiZxdW90O1RpbWVzIE5ldyBSb21hbiZxdW90OyI+NS48c3BhbiBzdHlsZT0iZm9udC12YXJpYW50LW51bWVyaWM6IG5vcm1hbDsgZm9udC12YXJpYW50LWVhc3QtYXNpYW46IG5vcm1hbDsgZm9udC1zdHJldGNoOiBub3JtYWw7IGZvbnQtc2l6ZTogN3B0OyBsaW5lLWhlaWdodDogbm9ybWFsOyBmb250LWZhbWlseTogJnF1b3Q7VGltZXMgTmV3IFJvbWFuJnF1b3Q7OyI+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IDwvc3Bhbj48L3NwYW4+PCEtLVtlbmRpZl0tLT48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdDtsaW5lLWhlaWdodDoxMTUlO2ZvbnQtZmFtaWx5OiZxdW90O1RpbWVzIE5ldyBSb21hbiZxdW90OywmcXVvdDtzZXJpZiZxdW90OyI+TGVhcm5pbmcKbWF0ZXJpYWxzOjxvOnA+PC9vOnA+PC9zcGFuPjwvcD48cCBjbGFzcz0iTXNvTGlzdFBhcmFncmFwaEN4U3BNaWRkbGUiIHN0eWxlPSJtYXJnaW4tbGVmdDouNzVpbjttc28tYWRkLXNwYWNlOgphdXRvO3RleHQtaW5kZW50Oi0uMjVpbjttc28tbGlzdDpsMiBsZXZlbDEgbGZvMyI+PCEtLVtpZiAhc3VwcG9ydExpc3RzXS0tPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2xpbmUtaGVpZ2h0OjExNSU7Zm9udC1mYW1pbHk6JnF1b3Q7VGltZXMgTmV3IFJvbWFuJnF1b3Q7LCZxdW90O3NlcmlmJnF1b3Q7Owptc28tZmFyZWFzdC1mb250LWZhbWlseTomcXVvdDtUaW1lcyBOZXcgUm9tYW4mcXVvdDsiPmEpPHNwYW4gc3R5bGU9ImZvbnQtdmFyaWFudC1udW1lcmljOiBub3JtYWw7IGZvbnQtdmFyaWFudC1lYXN0LWFzaWFuOiBub3JtYWw7IGZvbnQtc3RyZXRjaDogbm9ybWFsOyBmb250LXNpemU6IDdwdDsgbGluZS1oZWlnaHQ6IG5vcm1hbDsgZm9udC1mYW1pbHk6ICZxdW90O1RpbWVzIE5ldyBSb21hbiZxdW90OzsiPiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyA8L3NwYW4+PC9zcGFuPjwhLS1bZW5kaWZdLS0+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7bGluZS1oZWlnaHQ6MTE1JTtmb250LWZhbWlseTomcXVvdDtUaW1lcyBOZXcgUm9tYW4mcXVvdDssJnF1b3Q7c2VyaWYmcXVvdDsiPkJvb2tzLQo8bzpwPjwvbzpwPjwvc3Bhbj48L3A+PHAgY2xhc3M9Ik1zb0xpc3RQYXJhZ3JhcGhDeFNwTGFzdCIgc3R5bGU9Im1hcmdpbi1sZWZ0OjU3LjBwdDttc28tYWRkLXNwYWNlOmF1dG87CnRleHQtaW5kZW50Oi0uMjVpbjttc28tbGlzdDpsMSBsZXZlbDEgbGZvNSI+PCEtLVtpZiAhc3VwcG9ydExpc3RzXS0tPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2xpbmUtaGVpZ2h0OjExNSU7Zm9udC1mYW1pbHk6JnF1b3Q7VGltZXMgTmV3IFJvbWFuJnF1b3Q7LCZxdW90O3NlcmlmJnF1b3Q7Owptc28tZmFyZWFzdC1mb250LWZhbWlseTomcXVvdDtUaW1lcyBOZXcgUm9tYW4mcXVvdDsiPmkpPHNwYW4gc3R5bGU9ImZvbnQtdmFyaWFudC1udW1lcmljOiBub3JtYWw7IGZvbnQtdmFyaWFudC1lYXN0LWFzaWFuOiBub3JtYWw7IGZvbnQtc3RyZXRjaDogbm9ybWFsOyBmb250LXNpemU6IDdwdDsgbGluZS1oZWlnaHQ6IG5vcm1hbDsgZm9udC1mYW1pbHk6ICZxdW90O1RpbWVzIE5ldyBSb21hbiZxdW90OzsiPiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOwo8L3NwYW4+PC9zcGFuPjwhLS1bZW5kaWZdLS0+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7bGluZS1oZWlnaHQ6MTE1JTsKZm9udC1mYW1pbHk6JnF1b3Q7VGltZXMgTmV3IFJvbWFuJnF1b3Q7LCZxdW90O3NlcmlmJnF1b3Q7Ij5IYXJkZW4gUk0uIEN1cnJpY3VsdW0gcGxhbm5pbmcgYW5kCmRldmVsb3BtZW50LiBJbjogRGVudCBKQSwgSGFyZGVuIFJNLCBlZGl0b3JzLiBBIFByYWN0aWNhbCBHdWlkZSBmb3IgTWVkaWNhbCBUZWFjaGVycy4KQ2h1cmNoaWxsIExpdmluZ3N0b25lLCAyMDA1OiBwIDEwLSAxOCA8bzpwPjwvbzpwPjwvc3Bhbj48L3A+PHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1hcmdpbi1sZWZ0OjM5LjBwdCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7CmxpbmUtaGVpZ2h0OjExNSU7Zm9udC1mYW1pbHk6JnF1b3Q7VGltZXMgTmV3IFJvbWFuJnF1b3Q7LCZxdW90O3NlcmlmJnF1b3Q7Ij4mbmJzcDtpaSkgTGVpbnN0ZXIgUy5UaGUgdW5kZXJncmFkdWF0ZSBjdXJyaWN1bHVtLgpJbjogRGVudCBKQSwgSGFyZGVuIFJNLCBlZGl0b3JzLiBBIFByYWN0aWNhbCBHdWlkZSBmb3IgTWVkaWNhbCBUZWFjaGVycy4KQ2h1cmNoaWxsIExpdmluZ3N0b25lLCAyMDA1OiBwIDE5LTI3IDxvOnA+PC9vOnA+PC9zcGFuPjwvcD48cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibWFyZ2luLWxlZnQ6MzkuMHB0Ij48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdDsKbGluZS1oZWlnaHQ6MTE1JTtmb250LWZhbWlseTomcXVvdDtUaW1lcyBOZXcgUm9tYW4mcXVvdDssJnF1b3Q7c2VyaWYmcXVvdDsiPmlpaSkmbmJzcDsgUGF0aWwgTkcuIFRoZSBwb3N0IGdyYWR1YXRlIGN1cnJpY3VsdW0uIEluOiBEZW50CkpBLCBIYXJkZW4gUk0sIGVkaXRvcnMuIEEgcHJhY3RpY2FsIGd1aWRlIGZvciBtZWRpY2FsIHRlYWNoZXJzLiBDaHVyY2hpbApMaXZpbmdzdG9uZSwgMjAwNTogcCAyOC0zNzxvOnA+PC9vOnA+PC9zcGFuPjwvcD48cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibWFyZ2luLWxlZnQ6MzkuMHB0Ij48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdDsKbGluZS1oZWlnaHQ6MTE1JTtmb250LWZhbWlseTomcXVvdDtUaW1lcyBOZXcgUm9tYW4mcXVvdDssJnF1b3Q7c2VyaWYmcXVvdDsiPml2KSAmbmJzcDtCZWd1bSBULiBDdXJyaWN1bHVtIGRldmVsb3BtZW50LiBJbjogQ29uY2VwdHMKb2YgbWVkaWNhbCBlZHVjYXRpb24uIDIwMTM6IHAtNS03PG86cD48L286cD48L3NwYW4+PC9wPjxwIGNsYXNzPSJNc29MaXN0UGFyYWdyYXBoQ3hTcEZpcnN0IiBzdHlsZT0ibWFyZ2luLWxlZnQ6Ljc1aW47bXNvLWFkZC1zcGFjZTphdXRvOwp0ZXh0LWluZGVudDotLjI1aW47bXNvLWxpc3Q6bDIgbGV2ZWwxIGxmbzMiPjwhLS1baWYgIXN1cHBvcnRMaXN0c10tLT48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdDtsaW5lLWhlaWdodDoxMTUlO2ZvbnQtZmFtaWx5OiZxdW90O1RpbWVzIE5ldyBSb21hbiZxdW90OywmcXVvdDtzZXJpZiZxdW90OzsKbXNvLWZhcmVhc3QtZm9udC1mYW1pbHk6JnF1b3Q7VGltZXMgTmV3IFJvbWFuJnF1b3Q7Ij5iKTxzcGFuIHN0eWxlPSJmb250LXZhcmlhbnQtbnVtZXJpYzogbm9ybWFsOyBmb250LXZhcmlhbnQtZWFzdC1hc2lhbjogbm9ybWFsOyBmb250LXN0cmV0Y2g6IG5vcm1hbDsgZm9udC1zaXplOiA3cHQ7IGxpbmUtaGVpZ2h0OiBub3JtYWw7IGZvbnQtZmFtaWx5OiAmcXVvdDtUaW1lcyBOZXcgUm9tYW4mcXVvdDs7Ij4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgPC9zcGFuPjwvc3Bhbj48IS0tW2VuZGlmXS0tPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2xpbmUtaGVpZ2h0OjExNSU7Zm9udC1mYW1pbHk6JnF1b3Q7VGltZXMgTmV3IFJvbWFuJnF1b3Q7LCZxdW90O3NlcmlmJnF1b3Q7Ij4mbmJzcDtCb29rbGV0cyBvbiBjdXJyaWN1bHVtPG86cD48L286cD48L3NwYW4+PC9wPjxwIGNsYXNzPSJNc29MaXN0UGFyYWdyYXBoQ3hTcE1pZGRsZSIgc3R5bGU9Im1hcmdpbi1sZWZ0Oi43NWluO21zby1hZGQtc3BhY2U6CmF1dG87dGV4dC1pbmRlbnQ6LS4yNWluO21zby1saXN0OmwyIGxldmVsMSBsZm8zIj48IS0tW2lmICFzdXBwb3J0TGlzdHNdLS0+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7bGluZS1oZWlnaHQ6MTE1JTtmb250LWZhbWlseTomcXVvdDtUaW1lcyBOZXcgUm9tYW4mcXVvdDssJnF1b3Q7c2VyaWYmcXVvdDs7Cm1zby1mYXJlYXN0LWZvbnQtZmFtaWx5OiZxdW90O1RpbWVzIE5ldyBSb21hbiZxdW90OyI+Yyk8c3BhbiBzdHlsZT0iZm9udC12YXJpYW50LW51bWVyaWM6IG5vcm1hbDsgZm9udC12YXJpYW50LWVhc3QtYXNpYW46IG5vcm1hbDsgZm9udC1zdHJldGNoOiBub3JtYWw7IGZvbnQtc2l6ZTogN3B0OyBsaW5lLWhlaWdodDogbm9ybWFsOyBmb250LWZhbWlseTogJnF1b3Q7VGltZXMgTmV3IFJvbWFuJnF1b3Q7OyI+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IDwvc3Bhbj48L3NwYW4+PCEtLVtlbmRpZl0tLT48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdDtsaW5lLWhlaWdodDoxMTUlO2ZvbnQtZmFtaWx5OiZxdW90O1RpbWVzIE5ldyBSb21hbiZxdW90OywmcXVvdDtzZXJpZiZxdW90OyI+Jm5ic3A7QXJ0aWNsZXMgZnJvbSBqb3VybmFscyA8bzpwPjwvbzpwPjwvc3Bhbj48L3A+PHAgY2xhc3M9Ik1zb0xpc3RQYXJhZ3JhcGhDeFNwTWlkZGxlIiBzdHlsZT0ibWFyZ2luLWxlZnQ6MS4yNWluO21zby1hZGQtc3BhY2U6CmF1dG87dGV4dC1pbmRlbnQ6LS41aW47bXNvLWxpc3Q6bDUgbGV2ZWwxIGxmbzYiPjwhLS1baWYgIXN1cHBvcnRMaXN0c10tLT48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdDtsaW5lLWhlaWdodDoxMTUlO2ZvbnQtZmFtaWx5OiZxdW90O1RpbWVzIE5ldyBSb21hbiZxdW90OywmcXVvdDtzZXJpZiZxdW90OzsKbXNvLWZhcmVhc3QtZm9udC1mYW1pbHk6JnF1b3Q7VGltZXMgTmV3IFJvbWFuJnF1b3Q7Ij5pKTxzcGFuIHN0eWxlPSJmb250LXZhcmlhbnQtbnVtZXJpYzogbm9ybWFsOyBmb250LXZhcmlhbnQtZWFzdC1hc2lhbjogbm9ybWFsOyBmb250LXN0cmV0Y2g6IG5vcm1hbDsgZm9udC1zaXplOiA3cHQ7IGxpbmUtaGVpZ2h0OiBub3JtYWw7IGZvbnQtZmFtaWx5OiAmcXVvdDtUaW1lcyBOZXcgUm9tYW4mcXVvdDs7Ij4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsKPC9zcGFuPjwvc3Bhbj48IS0tW2VuZGlmXS0tPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2xpbmUtaGVpZ2h0OjExNSU7CmZvbnQtZmFtaWx5OiZxdW90O1RpbWVzIE5ldyBSb21hbiZxdW90OywmcXVvdDtzZXJpZiZxdW90OyI+SGFyZGVuIFJNLiBUZW4gcXVlc3Rpb25zIHRvIGFzayB3aGVuCnBsYW5uaW5nIGEgY291cnNlIG9yIGN1cnJpY3VsdW0uIE1lZGljYWwgRWR1Y2F0aW9uIDE5ODY7IDIwOiAzNTYtMzY1PG86cD48L286cD48L3NwYW4+PC9wPjxwIGNsYXNzPSJNc29MaXN0UGFyYWdyYXBoQ3hTcE1pZGRsZSIgc3R5bGU9Im1hcmdpbi1sZWZ0OjEuMjVpbjttc28tYWRkLXNwYWNlOgphdXRvO3RleHQtaW5kZW50Oi0uNWluO21zby1saXN0Omw1IGxldmVsMSBsZm82Ij48IS0tW2lmICFzdXBwb3J0TGlzdHNdLS0+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7bGluZS1oZWlnaHQ6MTE1JTtmb250LWZhbWlseTomcXVvdDtUaW1lcyBOZXcgUm9tYW4mcXVvdDssJnF1b3Q7c2VyaWYmcXVvdDs7Cm1zby1mYXJlYXN0LWZvbnQtZmFtaWx5OiZxdW90O1RpbWVzIE5ldyBSb21hbiZxdW90OyI+aWkpPHNwYW4gc3R5bGU9ImZvbnQtdmFyaWFudC1udW1lcmljOiBub3JtYWw7IGZvbnQtdmFyaWFudC1lYXN0LWFzaWFuOiBub3JtYWw7IGZvbnQtc3RyZXRjaDogbm9ybWFsOyBmb250LXNpemU6IDdwdDsgbGluZS1oZWlnaHQ6IG5vcm1hbDsgZm9udC1mYW1pbHk6ICZxdW90O1RpbWVzIE5ldyBSb21hbiZxdW90OzsiPiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOwo8L3NwYW4+PC9zcGFuPjwhLS1bZW5kaWZdLS0+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7bGluZS1oZWlnaHQ6MTE1JTsKZm9udC1mYW1pbHk6JnF1b3Q7VGltZXMgTmV3IFJvbWFuJnF1b3Q7LCZxdW90O3NlcmlmJnF1b3Q7Ij5IYXJkZW4gUk0sIFNvd2RlbiBTLCBEdW5uIFdSLiBTb21lCmVkdWNhdGlvbmFsIHN0cmF0ZWdpZXMgaW4gY3VycmljdWx1bSBkZXZlbG9wbWVudDogU1BJQ0VTIG1vZGVsLiBNZWRpY2FsCkVkdWNhdGlvbi4gMTk4NDsgMTg6IDI4NC0yOTc8bzpwPjwvbzpwPjwvc3Bhbj48L3A+PHAgY2xhc3M9Ik1zb0xpc3RQYXJhZ3JhcGhDeFNwTWlkZGxlIiBzdHlsZT0ibWFyZ2luLWxlZnQ6MS4yNWluO21zby1hZGQtc3BhY2U6CmF1dG87dGV4dC1pbmRlbnQ6LS41aW47bXNvLWxpc3Q6bDUgbGV2ZWwxIGxmbzYiPjwhLS1baWYgIXN1cHBvcnRMaXN0c10tLT48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdDtsaW5lLWhlaWdodDoxMTUlO2ZvbnQtZmFtaWx5OiZxdW90O1RpbWVzIE5ldyBSb21hbiZxdW90OywmcXVvdDtzZXJpZiZxdW90OzsKbXNvLWZhcmVhc3QtZm9udC1mYW1pbHk6JnF1b3Q7VGltZXMgTmV3IFJvbWFuJnF1b3Q7Ij5paWkpPHNwYW4gc3R5bGU9ImZvbnQtdmFyaWFudC1udW1lcmljOiBub3JtYWw7IGZvbnQtdmFyaWFudC1lYXN0LWFzaWFuOiBub3JtYWw7IGZvbnQtc3RyZXRjaDogbm9ybWFsOyBmb250LXNpemU6IDdwdDsgbGluZS1oZWlnaHQ6IG5vcm1hbDsgZm9udC1mYW1pbHk6ICZxdW90O1RpbWVzIE5ldyBSb21hbiZxdW90OzsiPiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOwo8L3NwYW4+PC9zcGFuPjwhLS1bZW5kaWZdLS0+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7bGluZS1oZWlnaHQ6MTE1JTsKZm9udC1mYW1pbHk6JnF1b3Q7VGltZXMgTmV3IFJvbWFuJnF1b3Q7LCZxdW90O3NlcmlmJnF1b3Q7Ij5MdWR2aWdzc29uIEpBLiBBY3VycmljdWx1bSBzaG91bGQgbWVldAp0aGUgZnV0dXJlIGRlbWFuZC4gTWVkaWNhbCBUZWFjaGVyIDE5OTk7IDIxKDIpOiAzPG86cD48L286cD48L3NwYW4+PC9wPjxwIGNsYXNzPSJNc29MaXN0UGFyYWdyYXBoQ3hTcExhc3QiIHN0eWxlPSJtYXJnaW4tbGVmdDouNzVpbjttc28tYWRkLXNwYWNlOmF1dG87CnRleHQtaW5kZW50Oi0uMjVpbjttc28tbGlzdDpsMiBsZXZlbDEgbGZvMyI+PCEtLVtpZiAhc3VwcG9ydExpc3RzXS0tPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2xpbmUtaGVpZ2h0OjExNSU7Zm9udC1mYW1pbHk6JnF1b3Q7VGltZXMgTmV3IFJvbWFuJnF1b3Q7LCZxdW90O3NlcmlmJnF1b3Q7Owptc28tZmFyZWFzdC1mb250LWZhbWlseTomcXVvdDtUaW1lcyBOZXcgUm9tYW4mcXVvdDsiPmQpPHNwYW4gc3R5bGU9ImZvbnQtdmFyaWFudC1udW1lcmljOiBub3JtYWw7IGZvbnQtdmFyaWFudC1lYXN0LWFzaWFuOiBub3JtYWw7IGZvbnQtc3RyZXRjaDogbm9ybWFsOyBmb250LXNpemU6IDdwdDsgbGluZS1oZWlnaHQ6IG5vcm1hbDsgZm9udC1mYW1pbHk6ICZxdW90O1RpbWVzIE5ldyBSb21hbiZxdW90OzsiPiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyA8L3NwYW4+PC9zcGFuPjwhLS1bZW5kaWZdLS0+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7bGluZS1oZWlnaHQ6MTE1JTtmb250LWZhbWlseTomcXVvdDtUaW1lcyBOZXcgUm9tYW4mcXVvdDssJnF1b3Q7c2VyaWYmcXVvdDsiPiZuYnNwO1dlYnNpdGU6ICZuYnNwO2kpIEN1cnJpY3VsdW0gZGV2ZWxvcG1lbnQtV2lraXBlZGlhIDwvc3Bhbj48YSBocmVmPSJodHRwczovL2VuLm0ud2lraXBlZGlhLm9yZy8iPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2xpbmUtaGVpZ2h0OgoxMTUlO2ZvbnQtZmFtaWx5OiZxdW90O1RpbWVzIE5ldyBSb21hbiZxdW90OywmcXVvdDtzZXJpZiZxdW90OyI+aHR0cHM6Ly9lbi5tLndpa2lwZWRpYS5vcmc8L3NwYW4+PC9hPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2xpbmUtaGVpZ2h0OjExNSU7Zm9udC1mYW1pbHk6JnF1b3Q7VGltZXMgTmV3IFJvbWFuJnF1b3Q7LCZxdW90O3NlcmlmJnF1b3Q7Ij48bzpwPjwvbzpwPjwvc3Bhbj48L3A+PHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9Im1hcmdpbi1sZWZ0Oi43NWluIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdDsKbGluZS1oZWlnaHQ6MTE1JTtmb250LWZhbWlseTomcXVvdDtUaW1lcyBOZXcgUm9tYW4mcXVvdDssJnF1b3Q7c2VyaWYmcXVvdDsiPmlpKSBDdXJyaWN1bHVtCmRldmVsb3BtZW50IGluIG1lZGljYWwgZWR1Y2F0aW9uLSBzbGlkZSBzaGFyZSZuYnNwOwo8bzpwPjwvbzpwPjwvc3Bhbj48L3A+PHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7bGluZS1oZWlnaHQ6MTE1JTtmb250LWZhbWlseToKJnF1b3Q7VGltZXMgTmV3IFJvbWFuJnF1b3Q7LCZxdW90O3NlcmlmJnF1b3Q7Ij4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7aHR0cHM6Ly93d3cuc2xpZGVzaGFyZS5uZXQmZ3Q7a21taGFzYW48bzpwPjwvbzpwPjwvc3Bhbj48L3A+PHAgY2xhc3M9Ik1zb0xpc3RQYXJhZ3JhcGgiIHN0eWxlPSJtYXJnaW4tbGVmdDouNzVpbjttc28tYWRkLXNwYWNlOmF1dG87CnRleHQtaW5kZW50Oi0uMjVpbjttc28tbGlzdDpsMiBsZXZlbDEgbGZvMyI+PCEtLVtpZiAhc3VwcG9ydExpc3RzXS0tPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2xpbmUtaGVpZ2h0OjExNSU7Zm9udC1mYW1pbHk6JnF1b3Q7VGltZXMgTmV3IFJvbWFuJnF1b3Q7LCZxdW90O3NlcmlmJnF1b3Q7Owptc28tZmFyZWFzdC1mb250LWZhbWlseTomcXVvdDtUaW1lcyBOZXcgUm9tYW4mcXVvdDsiPmUpPHNwYW4gc3R5bGU9ImZvbnQtdmFyaWFudC1udW1lcmljOiBub3JtYWw7IGZvbnQtdmFyaWFudC1lYXN0LWFzaWFuOiBub3JtYWw7IGZvbnQtc3RyZXRjaDogbm9ybWFsOyBmb250LXNpemU6IDdwdDsgbGluZS1oZWlnaHQ6IG5vcm1hbDsgZm9udC1mYW1pbHk6ICZxdW90O1RpbWVzIE5ldyBSb21hbiZxdW90OzsiPiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyA8L3NwYW4+PC9zcGFuPjwhLS1bZW5kaWZdLS0+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7bGluZS1oZWlnaHQ6MTE1JTtmb250LWZhbWlseTomcXVvdDtUaW1lcyBOZXcgUm9tYW4mcXVvdDssJnF1b3Q7c2VyaWYmcXVvdDsiPiZuYnNwO1Bvd2VyIHBvaW50IHByZXNlbnRhdGlvbiBvbiB0aGUgc3BlY2lmaWMKdG9waWNzICh3ZWJzaXRlKSA6IEN1cnJpY3VsdW0gZGV2ZWxvcG1lbnQgZm9yIE1lZGljYWwgRWR1Y2F0aW9uOiBpbiA2IHNpeCBlYXN5CnN0ZXBz4oCmJm5ic3A7IDxvOnA+PC9vOnA+PC9zcGFuPjwvcD48cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibWFyZ2luLWxlZnQ6LjVpbiI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7CmxpbmUtaGVpZ2h0OjExNSU7Zm9udC1mYW1pbHk6JnF1b3Q7VGltZXMgTmV3IFJvbWFuJnF1b3Q7LCZxdW90O3NlcmlmJnF1b3Q7Ij4mbmJzcDsmbmJzcDsgJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7PC9zcGFuPjxzcGFuIGNsYXNzPSJNc29IeXBlcmxpbmsiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2xpbmUtaGVpZ2h0OjExNSU7Zm9udC1mYW1pbHk6CiZxdW90O1RpbWVzIE5ldyBSb21hbiZxdW90OywmcXVvdDtzZXJpZiZxdW90OyI+aHR0cHM6Ly9tZWRpY2luZS5vc3UuZWR1Jmd0O2RvY3VtZW50czwvc3Bhbj48L3NwYW4+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7bGluZS1oZWlnaHQ6MTE1JTtmb250LWZhbWlseTomcXVvdDtUaW1lcyBOZXcgUm9tYW4mcXVvdDssJnF1b3Q7c2VyaWYmcXVvdDsiPjxvOnA+PC9vOnA+PC9zcGFuPjwvcD48cD4KCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKPC9wPjxwIGNsYXNzPSJNc29MaXN0UGFyYWdyYXBoIiBzdHlsZT0idGV4dC1pbmRlbnQ6LS4yNWluO21zby1saXN0OmwzIGxldmVsMSBsZm8xIj48IS0tW2lmICFzdXBwb3J0TGlzdHNdLS0+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7bGluZS1oZWlnaHQ6MTE1JTtmb250LWZhbWlseTomcXVvdDtUaW1lcyBOZXcgUm9tYW4mcXVvdDssJnF1b3Q7c2VyaWYmcXVvdDs7Cm1zby1mYXJlYXN0LWZvbnQtZmFtaWx5OiZxdW90O1RpbWVzIE5ldyBSb21hbiZxdW90OyI+Ni48c3BhbiBzdHlsZT0iZm9udC12YXJpYW50LW51bWVyaWM6IG5vcm1hbDsgZm9udC12YXJpYW50LWVhc3QtYXNpYW46IG5vcm1hbDsgZm9udC1zdHJldGNoOiBub3JtYWw7IGZvbnQtc2l6ZTogN3B0OyBsaW5lLWhlaWdodDogbm9ybWFsOyBmb250LWZhbWlseTogJnF1b3Q7VGltZXMgTmV3IFJvbWFuJnF1b3Q7OyI+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IDwvc3Bhbj48L3NwYW4+PCEtLVtlbmRpZl0tLT48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdDtsaW5lLWhlaWdodDoxMTUlO2ZvbnQtZmFtaWx5OiZxdW90O1RpbWVzIE5ldyBSb21hbiZxdW90OywmcXVvdDtzZXJpZiZxdW90OyI+VW5pdApjb21wbGV0aW9uIHRpbWU6IE9uZSB1bml0IHNob3VsZCBiZSBjb21wbGV0ZWQgYnkgb25lIHdlZWsgd2l0aCBhIHN0dWR5IHRpbWUgb2YKYXQgbGVhc3QgMTAgaG91cnM8bzpwPjwvbzpwPjwvc3Bhbj48L3A+', '[""]', '1 Week', 1),
(15, 1, 1, 'CI2', 'Educational objectives and competencies', '', '[""]', '1 Week', 1),
(16, 1, 1, 'CI3', 'Educational environment and staff development', '', '[""]', '1 Week', 1),
(17, 1, 1, 'CI4', 'e-learning and continuing professional development (CPD) ', '', '[""]', '1 Week', 1),
(18, 1, 2, 'IMD1', 'Principles of Instructional design and typography', '', '[""]', '1 Week', 1),
(19, 1, 2, 'IMD2', 'Power-point preparation and presentation', '', '[""]', '1 Week', 1),
(20, 1, 2, 'IMD3', 'OHP, flipchart, boards and printed materials', '', '[""]', '1 Week', 1),
(21, 1, 2, 'IMD4', 'Study guide and hand out', '', '[""]', '1 Week', 1),
(22, 1, 3, 'TL1', 'Principles of teaching and learning and teaching methods', '', '[""]', '1 Week', 1),
(23, 1, 3, 'TL2', 'Interactive large group teaching', '', '[""]', '1 Week', 1),
(24, 1, 3, 'TL3', 'Small group teaching and clinical teaching', 'PHA+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7PGJyPjwvcD4=', '[""]', '1 Week', 1),
(25, 1, 3, 'TL4', 'Other educational strategies- micro-teaching, distance learning, problem based learning  (PBL), evidence based learning', '', '[""]', '1 Week', 1),
(26, 1, 4, 'A1', 'Principles and methods of assessment and criteria of good assessment', '', '[""]', '1 Week', 1),
(27, 1, 4, 'A2', 'Written assessments- essay questions, Structured Essay Question (SEQ) Modified Essay Question (MEQ), Multiple Choice Questions (MCQ), Short Answer Question (SAQ)', '', '[""]', '1 Week', 1),
(28, 1, 4, 'A3', 'Performance based assessment –Objective Structured Clinical Examination (OSCE), Clinical examination (Long and short case), DOPS, Mini- CEX', '', '[""]', '1 Week', 1),
(29, 1, 4, 'A4', 'Structured Oral Examination (SOE), self- assessment and portfolio ', '', '[""]', '1 Week', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notice`
--

CREATE TABLE IF NOT EXISTS `notice` (
  `id` int(11) NOT NULL,
  `sent_to` varchar(1) NOT NULL COMMENT 'T=Teacher,S=Student,P=Parent',
  `ref_id` varchar(20) DEFAULT NULL,
  `type` varchar(1) NOT NULL COMMENT 'I=Individual, A=All',
  `subject` text NOT NULL,
  `notice` text,
  `attachment` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notice`
--

INSERT INTO `notice` (`id`, `sent_to`, `ref_id`, `type`, `subject`, `notice`, `attachment`, `created_at`) VALUES
(1, '1', NULL, '', 'Welcome', '', NULL, '2017-08-06 20:34:33'),
(2, 'a', NULL, '', 'Today''s Schedule', '', NULL, '2017-08-06 20:34:26'),
(3, 'a', NULL, '', 'Tomorrow''s Schedule', '\r\n', NULL, '2017-08-06 20:34:17');

-- --------------------------------------------------------

--
-- Table structure for table `oe_qsn_bnk_ans`
--

CREATE TABLE IF NOT EXISTS `oe_qsn_bnk_ans` (
  `id` int(11) NOT NULL,
  `master_ref_id` int(11) NOT NULL,
  `ans` varchar(500) NOT NULL,
  `index_seqn` varchar(2) NOT NULL,
  `correct_ans` varchar(5) DEFAULT NULL COMMENT 'only for mcq , only T,F'
) ENGINE=InnoDB AUTO_INCREMENT=19111 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oe_qsn_bnk_master`
--

CREATE TABLE IF NOT EXISTS `oe_qsn_bnk_master` (
  `id` int(11) NOT NULL,
  `module` int(11) NOT NULL,
  `unit` int(11) NOT NULL,
  `type` varchar(20) NOT NULL COMMENT 'mcq,sba',
  `question_name` varchar(400) NOT NULL,
  `correct_ans` varchar(5) NOT NULL,
  `question_in_year` varchar(90) DEFAULT NULL,
  `discussion` text NOT NULL,
  `reference` text NOT NULL,
  `heading` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(30) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(30) DEFAULT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'active'
) ENGINE=InnoDB AUTO_INCREMENT=3715 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `details` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(100) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `slug`, `details`, `created_at`, `created_by`, `status`) VALUES
(6, 'An overview', 'overview', 'PGRpdiBjbGFzcz0iY29sLXhzLTEyIG5ld3Mtc2luZ2xlIj4KICAgICAgICAgICAgICAgICAgICA8ZGl2IGNsYXNzPSJibG9nLXNpbmdsZS13cmFwIj4KCiAgICAgICAgICAgICAgICAgICAgICAgIDwhLS0gQmxvZyBEZXRhaWwgV3JhcHBlciAtLT4KICAgICAgICAgICAgICAgICAgICAgICAgPGRpdiBjbGFzcz0ibmV3cy1zaW5nbGUtZGV0YWlscyI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8aDQgY2xhc3M9InRpdGxlLXNpbXBsZSI+QW4gb3ZlcnZpZXc8L2g0PgoKICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxwPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFRoaXMgcG9zdGdyYWR1YXRlIGNlcnRpZmljYXRlIGNvdXJzZSBpbiBtZWRpY2FsIGVkdWNhdGlvbiBoYXMgYmVlbiBkZXNpZ25lZCB0byBlbmxpZ2h0ZW4gcGFydGljaXBhbnRzIHdpdGggdGhlIGtleQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlzc3VlcyBpbiBtZWRpY2FsIGVkdWNhdGlvbiBhbmQgdG8gZW5hYmxlIHRoZW0gdG8gZGV2ZWxvcCBhIGJhc2ljIGxldmVsIG9mIGVkdWNhdGlvbmFsIGNvbXBldGVuY2UgYW5kIHByb2Zlc3Npb25hbGlzbQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGluIG1lZGljYWwgZWR1Y2F0aW9uIG1ldGhvZG9sb2xvZ3kuIFRoZSBhaW0gb2YgdGhlIGNlcnRpZmljYXRlIGNvdXJzZSBpcyB0byBlcXVpcCBoZWFsdGggcHJvZmVzc2lvbmFscyB0byBwcmFjdGljZQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFjcm9zcyB0aGUgcmFuZ2Ugb2YgZG9tYWlucyBvZiB0ZWFjaGluZyBhbmQgbGVhcm5pbmcgbW9kZWxzIHJlbGV2YW50IHRvIHRoZWlyIHN0dWRlbnRzLCBzdWJqZWN0cyBhbmQgc2l0dWF0aW9ucy4gQWZ0ZXIKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb21wbGV0aW9uIG9mIHRoaXMgY291cnNlIHRoZSBzdWNjZXNzZnVsIHBhcnRpY2lwYW50cyB3aWxsIGJlIGFibGUgdG8gc2hvdyBiZXR0ZXIgYWJpbGl0eSBpbjoKICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwvcD48dWwgY2xhc3M9ImdvLXdpZGdldCI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPuKAoiBVbmRlcnN0YW5kaW5nIGltcG9ydGFudCBjb250ZW1wb3JhcnkgaXNzdWVzIGluIG1lZGljYWwgZWR1Y2F0aW9uPC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPuKAoiBDb250cmlidXRlIHRvIHRoZSBkZXNpZ24gYW5kIHBsYW5uaW5nIG9mIGxlYXJuaW5nIGFjdGl2aXRpZXMgPC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPuKAoiBBc3Nlc3Mgc3R1ZGVudHMsIHRyYWluZWUsIGhlYWx0aCBjYXJlIHdvcmtlcnMgYW5kIG1ha2UgYSBwbGFuIHRvIGltcHJvdmUgdGhlbTwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj7igKIgVGFraW5nIGluaXRpYXRpdmVzIGZvciBmYWN1bHR5IGRldmVsb3BtZW50IGF0IHRoZWlyIG93biBwcmVtaXNlczwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgPC91bD4KICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxwPjwvcD4KCiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8aDQgY2xhc3M9InRpdGxlLXNpbXBsZSIgaWQ9IndobyI+V2hvIHNob3VsZCB0YWtlIHRoZSBjb3Vyc2U/PC9oND4KICAgICAgICAgICAgICAgICAgICAgICAgICAgIDx1bCBjbGFzcz0iZ28td2lkZ2V0Ij4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iIyI+4oCiIE1lZGljYWwgdGVhY2hlcnMgd2l0aCBhIHBvc3QgZ3JhZHVhdGlvbiBxdWFsaWZpY2F0aW9uIGFuZCBhY3RpdmVseSBpbnZvbHZlZCBpbiB0ZWFjaGluZyBtYXkgYXBwbHkgdG8gdGFrZSB0aGlzIGNlcnRpZmljYXRlCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb3Vyc2UuPC9hPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPuKAoiBUZWFjaGVycyBhdCBEZW50YWwgQ29sbGVnZSB3aXRoIHBvc3QgZ3JhZHVhdGlvbiBpbiBhbnkgc3ViamVjdCBpbnZvbHZlZCBpbiB0ZWFjaGluZyBtYXkgYXBwbHkgdG8gdGFrZSB0aGlzIGNvdXJzZS48L2E+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPC9saT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iIyI+4oCiIE51cnNpbmcgdGVhY2hlcnMgd2l0aCBwb3N0IGdyYWR1YXRpb24gZGlwbG9tYSBtYXkgdGFrZSB0aGlzIGNvdXJzZTwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgPC91bD4KCiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8aDQgY2xhc3M9InRpdGxlLXNpbXBsZSI+SG93IHRoZSBjb3Vyc2Ugd2lsbCBiZSBjb25kdWN0ZWQ/PC9oND4KCiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8cD4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBUaGVyZSB3aWxsIGJlIGFib3V0IDIwIHBhcnRpY2lwYW50cyBoZW5jZWZvcnRoIHNoYWxsIGJlIGNhbGxlZCBmZWxsb3dzIGluIHRoZSAxc3QgYmF0Y2ggb2YgNiBtb250aHMgZHVyYXRpb24uIExlYXJuaW5nCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYW5kIHRlYWNoaW5nIHdpbGwgYmUgbW9zdGx5IG9ubGluZSBhbmQgc2VsZiBkaXJlY3RlZC4gVGhlcmUgd2lsbCBiZSA0IG1vZHVsZXMgYW5kIGVhY2ggbW9kdWxlIGhhdmluZyA0IHVuaXRzLgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEZhY3VsdGllcyB3aWxsIGJlIHRhZ2dlZCB0byB0aGUgZmVsbG93cyBhbmQgdGhleSB3aWxsIGNvb3JkaW5hdGUgbGVhcm5pbmcgYWN0aXZpdGllcy4gQWxsIHRoZSBmZWxsb3dzIG11c3QgaGF2ZSBhbgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVhZ2VybmVzcyBvZiBhY3RpdmUgcGFydGljaXBhdGlvbiBpbiB0ZWFjaGluZyAmYW1wOyBsZWFybmluZyBwcm9jZXNzIG9mIHRoZSBjb3Vyc2UgZGVzaWduZWQgYnkgdGhlIGNvbXBldGVudCBhdXRob3JpdHkuIEEKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsaXN0IG9mIHB1Ymxpc2hlZCBtYXRlcmlhbHMgd2lsbCBiZSBwcm92aWRlZCB0byBhbGwgdGhlIGZlbGxvd3MgYW5kIHRoZXkgaGF2ZSB0byBzdHVkeSB0aGUgYXBwcm9wcmlhdGUgbWF0ZXJpYWxzIGFzCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGVyIGNvdXJzZSBkZW1hbmQuIEFmdGVyIDZkYXlzIHN0dWR5IG9mIG9uZSB1bml0IGFuIG9ubGluZSBhc3NpZ25tZW50IHdpbGwgYmUgc2VuZCB0byB0aGUgZmVsbG93IGFuZCB3aXRoaW4gMjQgaG91cnMKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBoZS9zaGUgd2lsbCBzZW5kIHRoZSBhbnN3ZXIgb25saW5lIHRvIHRoZSB0dXRvci4gSWYgbmVjZXNzYXJ5IGEgZmVlZGJhY2sgd2lsbCBiZSBzZW5kIHRvIHRoZSBmZWxsb3cuIEEgc2Vjb25kIGNoYW5jZQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHdpbGwgYmUgZ2l2ZW4gdG8gcmV3cml0ZSB0aGUgYW5zd2VyLiBNYXJraW5nIHdpbGwgYmUgZG9uZSBieSB0aGUgZmFjdWx0eSBmb3IgZWFjaCB1bml0IGJvdGggZmFjZS10by1mYWNlIHRlYWNoaW5nIGFuZAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG9ubGluZSBsZWFybmluZyB3aWxsIGJlIHByb3ZpZGVkIHRvIHRoZSBmZWxsb3dzLiBUaGVyZSB3aWxsIGJlIGF0IGxlYXN0IG9uZSBmdWxsIGRheSB3b3Jrc2hvcCBhdCBCSVJERU0gcHJlbWlzZXMgZXZlcnkKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtb250aC4gVGhlc2Ugd29ya3Nob3BzIHdpbGwgY29uZHVjdCBhc3Nlc3NtZW50cyBvbiBhIG1vZHVsZSBhbmQgaW50cm9kdWN0aW9uIG9mIHRoZSBuZXh0IG1vZHVsZS4gQWZ0ZXIgY29tcGxldGlvbiBhbGwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bml0cyBzdWNjZXNzZnVsbHkgYW4gb25zaXRlIG1vZHVsZSBjb21wbGV0aW9uIGFzc2Vzc21lbnQgd2lsbCBiZSBoZWxkLiBBZnRlciBzdWNjZXNzZnVsIGNvbXBsZXRpb24gYWxsIDQgbW9kdWxlcyBhCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY2VydGlmaWNhdGUgd2lsbCBiZSBpc3N1ZWQgdG8gdGhlIGZlbGxvdyBmcm9tIEJJUkRFTSBhY2FkZW15LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIER1cmluZyB0aGUgcHJvY2VzcyBvZiBsZWFybmluZyBmZWxsb3cgd2lsbCBiZSBlbmNvdXJhZ2VkIHRvIGNvbW11bmljYXRlIHdpdGggdGhlaXIgbWVudG9ycyB0aHJvdWdoIGVtYWlsLCB3ZWIgc2l0ZSBhbmQKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0ZWxlcGhvbmUuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8L3A+CgogICAgICAgICAgICAgICAgICAgICAgICAgICAgPGg0IGNsYXNzPSJ0aXRsZS1zaW1wbGUiPkhvdyB5b3Ugd2lsbCBsZWFybj88L2g0PgoKICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxwPkZlbGxvd3Mgd2lsbCBiZSBzdXBwbGllZCB3aXRoIGJvb2tzLCBhcnRpY2xlcyBmcm9tIGpvdXJuYWxzIGFuZCBvbmxpbmUgbGlua3MgdG8gc3R1ZHkgdGhlIGxlYXJuaW5nIG9iamVjdGl2ZXMuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRmFjdWx0aWVzIHdpbGwgYmUgYXZhaWxhYmxlIHRocm91Z2ggZW1haWwsIHdlYnNpdGUgYW5kIHRlbGVwaG9uZSB0byBkaXNjdXNzIGFueSBpc3N1ZSBkdXJpbmcgc2VsZiBkaXJlY3RlZCBsZWFybmluZy4gQQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHRhc2stYmFzZWQgbGVhcm5pbmcgYXBwcm9hY2ggd2lsbCBhbHNvIGJlIGFkb3B0ZWQsIHdpdGggYWN0aXZpdGllcyBzdWdnZXN0ZWQgdGhyb3VnaG91dCB0aGUgbGVhcm5pbmcgbWF0ZXJpYWxzIHRoYXQKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBlbmNvdXJhZ2UgcGFydGljaXBhbnRzIHRvIGxpbmsgZWR1Y2F0aW9uYWwgdGhlb3J5IHRvIHRoZWlyIGV2ZXJ5ZGF5IHByYWN0aWNlIGFzIGhlYWx0aCBwcm9mZXNzaW9ucyB0ZWFjaGVycyBhbmQgdG8KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZWZsZWN0IG9uIHRoYXQgcHJhY3RpY2U8L3A+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8dWwgY2xhc3M9ImdvLXdpZGdldCI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPuKAoiBMZWFybmluZyBmcm9tIHByZSBkZXRlcm1pbmVkIGd1aWRlZCBzY2hlZHVsZTwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj7igKIgRGlzY3Vzc2lvbiBhbW9uZyBwYXJ0aWNpcGFudHMgYW5kIHR1dG9yczwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj7igKIgUHJlcGFyYXRpb24gYW5kIHN1Ym1pc3Npb24gb2YgdW5pdCBhc3NpZ25tZW50czwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj7igKIgRmVlZGJhY2sgZnJvbSB0dXRvcnMgYW5kIGNvdXJzZSBjb29yZGluYXRvcnMgYWJvdXQgdGhlaXIgYXNzaWdubWVudDwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj7igKIgU2VsZiByZWZsZWN0aXZlIGxlYXJuaW5nIG9uIHRoYXQgZmVlZGJhY2sgYW5kIHByb3Bvc2FsIGZvciBmdXJ0aGVyIGxlYXJuaW5nPC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8L3VsPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgPGg0IGNsYXNzPSJ0aXRsZS1zaW1wbGUiPkNvbnRlbnQ8L2g0PgoKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPHA+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFRoZXJlIHdpbGwgYmUgZm91ciB0aGVtZXMgYmFzZWQgb24gcHJvZ3JhbSBzY2hlZHVsZSBvZiB0aGUgY291cnNlLiA8L3A+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPHVsIGNsYXNzPSJnby13aWRnZXQiIHN0eWxlPSJtYXJnaW4tYm90dG9tOiAxNXB4Ij4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj7igKIgQ29udGVtcG9yYXJ5IGlzc3VlcyBpbiBtZWRpY2FsIGVkdWNhdGlvbjwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPuKAoiBJbnN0cnVjdGlvbmFsIGRlc2lnbjwvYT4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPC9saT48bGk+PGEgaHJlZj0iIyI+4oCiIFRlYWNoaW5nLWxlYXJuaW5nPC9hPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8L2xpPjxsaT48YSBocmVmPSIjIj7igKIgQXNzZXNzbWVudDwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwvdWw+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPHA+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgVGhlcmUgYXJlIDQgdW5pdHMgd2l0aGluIGVhY2ggdGhlbWUuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8L3A+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8aDQgY2xhc3M9InRpdGxlLXNpbXBsZSI+RWR1Y2F0aW9uYWwgcGhpbG9zb3BoeTwvaDQ+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8cD4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQaGlsb3NvcGh5IHJlZ2FyZGluZyB0aGlzIGNvdXJzZSB3aWxsIGJlIHRvIGJ1aWxkIGEgZ29vZCBxdWFsaXR5IHRlYWNoZXIgd2hvIHdpbGwgYmUgY29tcGFzc2lvbmF0ZSwgY29tcGV0ZW50IGFuZCBwcm9mZXNzaW9uYWxseSBzdXBlcmlvciB3aXRoIGhpZ2gKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdGFrZSBvZiBldGhpY2FsIOKAk21vcmFsIGh1bWFuLiBIZSB3aWxsIGJlIGEgZ3VpZGUgYW5kIHJvbGUgbW9kZWwgZm9yIHRoZSBzdHVkZW50cyBzbyB0aGF0IGZ1dHVyZSBnZW5lcmF0aW9uIHdpbGwgcmVwbGFjZSB0aGVtIGluIHRlcm1zIG9mIGJldHRlcgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHF1YWxpdHkgYW5kIGFwcGxpY2FiaWxpdHkuIFRoZSB0cmFpbmVkIHRlYWNoZXIgd2lsbCBlbmdhZ2UgdGhlbXNlbHZlcyBpbiByZXNlYXJjaCBhbmQgZmFjdWx0eSBkZXZlbG9wbWVudCBwcm9ncmFtLgogICAgICAgICAgICAgICAgICAgICAgICAgICAgPC9wPgoKICAgICAgICAgICAgICAgICAgICAgICAgPC9kaXY+PCEtLSBCbG9nIERldGFpbCBXcmFwcGVyIC0tPgogICAgICAgICAgICAgICAgICAgIDwvZGl2PjwhLS0gQmxvZyBXcmFwcGVyIC0tPgoKCiAgICAgICAgICAgICAgICA8L2Rpdj4=', '2017-12-13 10:00:40', NULL, 1),
(8, 'Suggested readings and links', 'reading-links', 'PGRpdiBjbGFzcz0iY29sLXhzLTEyIG5ld3Mtc2luZ2xlIj4KICAgICAgICAgICAgICAgICAgICA8ZGl2IGNsYXNzPSJibG9nLXNpbmdsZS13cmFwIj4KCiAgICAgICAgICAgICAgICAgICAgICAgIDwhLS0gQmxvZyBEZXRhaWwgV3JhcHBlciAtLT4KICAgICAgICAgICAgICAgICAgICAgICAgPGRpdiBjbGFzcz0ibmV3cy1zaW5nbGUtZGV0YWlscyI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8aDQgY2xhc3M9InRpdGxlLXNpbXBsZSI+U3VnZ2VzdGVkIHJlYWRpbmdzIGFuZCBsaW5rczwvaDQ+CgogICAgICAgICAgICAgICAgICAgICAgICAgICAgPHA+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgVHdvIGJvb2tzIHdpbGwgYmUgcHJvdmlkZWQgdG8gdGhlIHBhcnRpY2lwYW50cyBhbG9uZyB3aXRoJm5ic3A7IFBQVCBvZiBsZWN0dXJlcyBhbmQgam91cm5hbCBoYW5kb3V0cy4gVGhleSB3aWxsIGFsc28gZ2V0IG9ubGluZSByZWFkaW5nIG1hdGVyaWFscyBhbmQgbGlua3Mgb2YgbWVkaWNhbCBlZHVjYXRpb24gcmVsYXRlZCBzaXRlcyBvIGV4cG9zZSB0aGVtIHRvIGEgZ3JlYXRlciBlZHVjYXRpb24gZW52aXJvbm1lbnQgYW5kIHRvIGhlbHAgdGhlbSBwcmVwYXJlIHRoZSBhc3NpZ25tZW50cy4gPGI+U3VnZ2VzdGVkIHJlYWRpbmc8L2I+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8L3A+CgogICAgICAgICAgICAgICAgICAgICAgICAgICAgPGg0IGNsYXNzPSJ0aXRsZS1zaW1wbGUiPkJvb2tzOjwvaDQ+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8dWwgY2xhc3M9ImdvLXdpZGdldCI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPjEuCTxiPkEgcHJhY3RpY2FsIGd1aWRlIGZvciBtZWRpY2FsIHRlYWNoZXJzLiBEZW50IFJBLCBIYXJkZW4gUk0sIGVkaXRvcnMgMm5kIGVkLiBDaHVyY2hpbGwgTGl2aW5nc3RvbmUsIEVkaW5idXJnaC4gMjAwNTwvYj48L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iIyI+Mi4JQSBwcmFjdGljYWwgZ3VpZGUgdG8gbWVkaWNhbCBzdHVkZW50IGFzc2Vzc21lbnQuIEFtaW4gWiwgU2VuZyBDWSwgRW5nIEtIIGVkaXRvcnMuIDFTVCBlZC4gV29ybGQgU2NpZW50aWZpYywgU2luZ2Fwb3JlLiAyMDA2PC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPjMuCUJhc2ljcyBpbiBtZWRpY2FsIGVkdWNhdGlvbi4gQW1pbiBaLCBFbmcgS0ggZWRpdG9ycy4gMXN0IGVkLCBXb3JsZCBTY2llbnRpZmljLCBOZXcgSmVyc2V5LCAyMDAzPC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPjQuCUEgaGFuZGJvb2sgZm9yIG1lZGljYWwgdGVhY2hlci4gTmV3YmxlIEQsIENhbm5vbiBSIGVkaXRvcnMuIDR0aCBlZC4gS2x1d2VyIEFjYWRlbWljIFB1YmxpY2F0aW9uLCBCb3N0b24sIDE5OTY8L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iIyI+NS4JQXNzZXNzbWVudCBpbiBtZWRpY2FsIGVkdWNhdGlvbjogVHJlbmRzIGFuZCB0b29scy4gIFNvb2QgUi4gMVNUIGVkLiBLIEwgV2lnIGNlbnRyZSwgTmV3IERlbGhpLCAxOTkzPC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPjYuCTxiPkNvbmNlcHRzIG9mIG1lZGljYWwgZWR1Y2F0aW9uLiBCZWd1bSBULiAxU1QgZWQuIERoYWthLCAyMDEzIDwvYj48L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwvdWw+CgogICAgICAgICAgICAgICAgICAgICAgICAgICAgPGg0IGNsYXNzPSJ0aXRsZS1zaW1wbGUiPkJvb2tsZXRzPC9oND4KICAgICAgICAgICAgICAgICAgICAgICAgICAgIDx1bCBjbGFzcz0iZ28td2lkZ2V0Ij4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iIyI+MS4JRC4gSS4gTmV3YmxlLiBBc3Nlc3NpbmcgQ2xpbmljYWwgQ29tcGV0ZW5jZSBhdCB0aGUgdW5kZXJncmFkdWF0ZSBsZXZlbC4gQVNNRSBNZWRpY2FsIEVkdWNhdGlvbiBCb29rbGV0IE5vLiAyNS4gRHVuZGVlLCAxOTkyPC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPjIuCUtub3ggSkRFLiBNb2RpZmllZCBFc3NheSBRdWVzdGlvbi4gQVNNRSBNZWRpY2FsIEVkdWNhdGlvbiBCb29rbGV0IE5vLiA1LiBEdW5kZWUsIDE5ODY8L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iIyI+My4JU3Rva2VzIEpGLiBUaGUgY2xpbmljYWwgZXhhbWluYXRpb24tIGFzc2Vzc21lbnQgb2YgY2xpbmljYWwgc2tpbGxzLiBBU01FIGJvb2tsZXQgTm8uNCwgRHVuZGVlLCAxOTc0PC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8L3VsPgoKICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxoNCBjbGFzcz0idGl0bGUtc2ltcGxlIj5BcnRpY2xlczo8L2g0PgogICAgICAgICAgICAgICAgICAgICAgICAgICAgPHVsIGNsYXNzPSJnby13aWRnZXQiPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj4xLglFYnN0ZWluIFJNLiBBc3Nlc3NtZW50IGluIG1lZGljYWwgZWR1Y2F0aW9uLiBOIEVuZyBKIE1lZCAyMDA3OyAzNTY6IDM4Ny05NiA8L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iIyI+Mi4JTm9yY2luaUpKLCAgTWNLaW5sZXkgRFcuIEFzc2Vzc21lbnQgbWV0aG9kcyBpbiBtZWRpY2FsIGVkdWNhdGlvbi4gVGVhY2hpbmcgYW5kIFRlYWNoZXIgZWR1Y2F0aW9uIDIwMDc7IDIzOiAyMzktMjUwPC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPjMuCUhhcmRlbiBSTS4gSG93IHRvIGFzc2VzcyBzdHVkZW50IDogYW4gb3ZlcnZpZXcuIE1lZGljYWwgVGVhY2hlciAxOTc5OyAxOiA2NS03MDwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj40LglGb3dlbGwgU0wsIEJsaWdoIEpHLiBSZWNlbnQgZGV2ZWxvcG1lbnRzIGluIGFzc2Vzc2luZyBtZWRpY2FsIHN0dWRlbnRzLiBQb3N0Z3JhZCBNZWQgSiAxOTk4OyA3OTogMTgtMjQ8L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iIyI+NS4JV29vZCBULiBBc3Nlc3NtZW50IG5vdCBvbmx5IGRyaXZlcyBsZWFybmluZywgaXQgYWxzbyBoZWxwcyBsZWFybmluZy4gTWVkaWNhbCBFZHVjYXRpb24gMjAwOTsgNDM6IDUtNjwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj42LglIYXJkZW4gUk0uIEhvdyB0byBhc3Nlc3MgY2xpbmljYWwgY29tcGV0ZW5jZTogYW4gb3ZlcnZpZXcuIE1lZGljYWwgVGVhY2hlciAxOTc5OyAxKDYpOiAyODktOTY8L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iIyI+Ny4JSGFyZGVuIFJNLiBIb3cgdG8gYXNzZXNzIHN0dWRlbnRzOiBhbiBvdmVydmlldy4gTWVkaWNhbCBUZWFjaGVyIDE5Nzk7IDE6IDY1LTcwPC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPjguCUVyYXVudCBNQS4gV2lkZSBwZXJzcGVjdGl2ZSBvbiBhc3Nlc3NtZW50LiBNZWRpY2FsIEVkdWNhdGlvbiAyMDA0OyAzODogODAwLSA5MDQ8L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iIyI+OS4JU2NodXdpcnRoIExXVCwgVmFuIGRlciBCbGV1dGVuIENQTS4gV3JpdHRlbiBhc3Nlc3NtZW50LiBCTUogMjAwMzsgMzI2OiA2NDMtNDU8L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iIyI+MTAuCSBSYWRlbWFrZXJzIEosIENhdGUgVEgsIEJhciBQUi4gUHJvZ3Jlc3MgdGVzdGluZyB3aXRoIHNob3J0IGFuc3dlciBxdWVzdGlvbnMuIE1lZGljYWwgVGVhY2hlciAyMDA1OyAyNyg3KTogNTc4LTgyPC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPjExLgkgRmFybGV5IEpLLiBUaGUgbXVsdGlwbGUgY2hvaWNlIHRlc3Q6IFdyaXRpbmcgdGhlIHF1ZXN0aW9ucy4gTnVyc2UgRWR1YyAxOTg5OyAxNDogMTAtMTI8L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iIyI+MTIuCSBNYyBDb3VicmllIFAuIEltcHJvdmluZyB0aGUgZmFpcm5lc3Mgb2YgbXVsdGlwbGUgY2hvaWNlIHF1ZXN0aW9uczogQSBsaXRlcmF0dXJlIHJldmlldy4gTWVkaWNhbCBUZWFjaGVyIDIwMDQ7IDI2KDgpOiA3MDktMTI8L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iIyI+MTMuCSBNYyBDb3VicmllIFAsIE1jS25pZ2h0IEwuIFNpbmdsZSBiZXN0IGFuc3dlciBNQ1FzOiBhIG5ldyBmb3JtYXQgZm9yIHRoZSBGUkNSIHBhcnQgMmEgZXhhbS4gQ2xpbmljYWwgUmFkaW9sb2d5IDIwMDg7IDYzOiA1MDYtMTA8L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iIyI+MTQuCSBUd29ydCBDLCBtdWNrbG93IEouIEhvdyB0byB3cml0ZSBoaWdoIHF1YWxpdHkgcXVlc3Rpb25zIGZvciBhIGhpZ2ggc3Rha2VzIGV4YW1pbmF0aW9uLiBDbGluaWNhbCBNZWRpY2luZSAyMDExOyAxMSgzKTogMjI3LTMwPC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPjE1LgkgV2Fsc2ggSy4gQWR2aWNlIG9uIHdyaXRpbmcgbXVsdGlwbGUgY2hvaWNlIHF1ZXN0aW9ucy4gQk1KIENhcnJpZXJzIDIwMDU8L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iIyI+MTYuCSBNaWxsZXIgR0UuIFRoZSBhc3Nlc3NtZW50IG9mIGNsaW5pY2FsIHNraWxscy8gY29tcGV0ZW5jZS8gcGVyZm9ybWFuY2UuIEFjYWQgTWVkIDE5OTA6IDY1OiA1NjMtNzA8L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iIyI+MTcuCSBXYXNzIFYsIFZhbiBkZXIgQmxldXRlbiBDUE0sIFNoYXR6ZXIgSi4gQXNzZXNzbWVudCBvZiBjbGluaWNhbCBjb21wZXRlbmNlLiBMYW5jZXQgMjAwMTsgMzU3OiA5NDUtOTwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj4xOC4JIE5vcmNpbmlKSi4gQ3VycmVudCBwZXJzcGVjdGl2ZXMgaW4gYXNzZXNzbWVudDogdGhlIGFzc2Vzc21lbnQgb2YgcGVyZm9ybWFuY2UgYXQgd29yay4gTWVkaWNhbCBFZHVjYXRpb24gMjAwNTsgMzk6IDg4MC04OTwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj4xOS4JIEhhcmRlbiBSTSwgR2xlZXNvbiBGQS4gQXNzZXNzbWVudCBvZiBjbGluaWNhbCBjb21wZXRlbmNlIHVzaW5nIGFuIE9iamVjdGl2ZSBTdHJ1Y3R1cmVkIENsaW5pY2FsIEV4YW1pbmF0aW9uIChPU0NFKS4gTWVkaWNhbCBFZHVjYXRpb24gMTk3OTsgMTM6IDQxLTU0PC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPjIwLgkgU2VuYW5heWFrZSBNUC4gVGhlIE9TQ0UuIFNyaUxhbmthIEpvdXJuYWwgb2YgQ2hpbGQgSGVhbHRoIDIwMDE7IDMwOiAyNC0yNzwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj4yMS4JIEhvZGdlcyBCLiBWYWxpZGl0eSBhbmQgdGhlIE9TQ0UuIE1lZGljYWwgVGVhY2hlciAyMDAzOyAyNTogMjUwLTU0PC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPjIyLgkgTGVlIFlNLCBEdWNrLVN1biBBSE4uIFRoZSBPU0NFOiBBIG5ldyBjaGFsbGVuZ2UgdG8gdGhlIGV2YWx1YXRpb24gc3lzdGVtIGluIEtvcmVhLiBNZWRpY2FsIFRlYWNoZXIgMjAwNjsgMjgoNCk6IDM3Ny03OTwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj4yMy4JIFZhbiBkZXIgQmxldXRlbiBDUE0uIE1ha2luZyB0aGUgYmVzdCBvZiB0aGUg4oCcTG9uZyBDYXNl4oCdLiBMYW5jZXQgMTk5NjsgMzc0OiA3MDQtNTwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj4yNC4JIFdhc3MgViwgSm9sbHkgQi4gRG9lcyBvYnNlcnZhdGlvbiBhZGQgdmFsaWRpdHkgdG8gdGhlIGxvbmcgY2FzZT8gTWVkaWNhbCBFZHVjYXRpb24gMjAwMTsgMzU6IDcyOS0zNDwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj4yNS4JIE5vcmNpbmlKSi4gTWluaSBDbGluaWNhbCBFdmFsdWF0aW9uIEV4ZXJjaXNlIChtaW5pLSBDRVgpLiBUaGUgQ2xpbmljYWwgVGVhY2hlciAyMDA1OyAyOjI1LTMwPC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPjI2LgkgTm9yY2luaUpKLCBCbGFuayBMTCwgRHVmZnkgRkQuIFRoZSBtaW5pLSBDRVg6IEEgbWV0aG9kIGZvciBhc3Nlc3NpbmcgY2xpbmljYWwgc2tpbGxzLiBBbm5hbHMgb2YgSW50ZXJuYWwgTWVkaWNpbmUgMjAwMzsgMTM4KDYpOiA0NzYtODMgPC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPjI3LgkgS29nYW4gSiwgSG9sbWJvZSBFIEhhdWVyIEsuIFRvb2xzIGZvciBkaXJlY3Qgb2JzZXJ2YXRpb24gYW5kIGFzc2Vzc21lbnQgb2YgY2xpbmljYWwgc2tpbGxzIG9mIG1lZGljYWwgdHJhaW5lZXMuIEpBTUEgMjAwOTsgMzAyOiAxMzE2LTI2PC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPjI4LgkgV2ViYiBDLCBFbmRhY290dCBSLCBHcmF5IE0uIE1vZGVscyBvZiBQb3J0Zm9saW8uIE1lZGljYWwgRWR1Y2F0aW9uIDIwMDI7IDM2OiA4OTctOTg8L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iIyI+MjkuCSBGcmllZG1hbiBCLCBEYXZpZCBNLCBEYXZpcyBNSCwgSGFyZGVuIFJNLiBQb3J0Zm9saW8gYXMgYSBtZXRob2Qgb2Ygc3R1ZGVudCBhc3Nlc3NtZW50LiBNZWRpY2FsIFRlYWNoZXIgMjAwMTsgMjMoNik6IDUzNS01MTwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj4zMC4JIEZhbGNoaWtvdiBOLCBCb3VkIEQuIFN0dWRlbnQgc2VsZiBhc3Nlc3NtZW50IGluIGhpZ2hlciBlZHVjYXRpb246IGEgbWV0YSBhbmFseXNpcy4gUmV2aWV3IG9mIEVkdWNhdGlvbmFsIFJlc2VhcmNoIDE5ODk7IDk6IDM0NS00MzA8L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iIyI+MzEuCSBEYXZpcyBNSCwgSGFyZGVuIFJNLiBDb21wZXRlbmN5IGJhc2VkIGFzc2Vzc21lbnQ6IE1ha2luZyBpdCBhIHJlYWxpdHkuIE1lZGljYWwgVGVhY2hlciAyMDAzOyAyNSg2KTogNTY1LTU2ODwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgPC91bD4KICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxoNCBjbGFzcz0idGl0bGUtc2ltcGxlIj5XZWJzaXRlOjwvaDQ+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8dWwgY2xhc3M9ImdvLXdpZGdldCI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPjEuCUJyb3duIEdUTC4gV3JpdGluZyBhbmQgZ3JhZGluZyBlc3NheSBxdWVzdGlvbnMuIE1hcmNoIDIwMTI7IGF2YWlsYWJsZSBmcm9tOiBodHRwOi8vY2ZlLnVuYy5lZHUvPC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPjIuCVByaW5jaXBsZXMgb2YgQXNzZXNzbWVudC0gQmVzdCBQcmFjdGljZS4gaHR0cDovL3d3dy5zbGlkZXNoYXJlLm5ldCZndDtkcmRqd2Fsa2VyPC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPjMuCU5vcmNpbmlKSiwgIE1jS2lubGV5IERXLiBBc3Nlc3NtZW50IG1ldGhvZHMgaW4gbWVkaWNhbCBlZHVjYXRpb24uIDxicj53d3cuc2NpZW5jZWRpcmVjdC5jb20gPC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPjQuCUFNRUUgR3VpZGVzLUFuIGludGVybmF0aW9uYWwgQXNzb2NpYXRpb24gRm9yIE1lZGljYWwgRWR1Y2F0aW9uIDxicj5odHRwczovL2FtZWUub3JnJmd0O3B1YmxpY2F0aW9uczwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj41LglQb3J0Zm9saW9zOiBMZWFybmluZyBhbmQgQXNzZXNzbWVudCBpbiBNZWRpY2FsIEVkdWNhdGlvbiA8YnI+IGh0dHA6Ly91bWFuaXRvYmEuY2EmZ3Q7cGdtZSZndDttZWRpYTwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgPC91bD4KCgogICAgICAgICAgICAgICAgICAgICAgICA8L2Rpdj48IS0tIEJsb2cgRGV0YWlsIFdyYXBwZXIgLS0+CiAgICAgICAgICAgICAgICAgICAgPC9kaXY+PCEtLSBCbG9nIFdyYXBwZXIgLS0+CgoKICAgICAgICAgICAgICAgIDwvZGl2PjwhLS0gQ29sdW1uIC0tPg==', '2017-12-13 10:13:07', NULL, 1),
(9, 'Assessment', 'assessment', 'PGRpdiBjbGFzcz0iY29sLXhzLTEyIG5ld3Mtc2luZ2xlIj4KICAgICAgICAgICAgICAgICAgICA8ZGl2IGNsYXNzPSJibG9nLXNpbmdsZS13cmFwIj4KCiAgICAgICAgICAgICAgICAgICAgICAgIDwhLS0gQmxvZyBEZXRhaWwgV3JhcHBlciAtLT4KICAgICAgICAgICAgICAgICAgICAgICAgPGRpdiBjbGFzcz0ibmV3cy1zaW5nbGUtZGV0YWlscyI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8aDQgY2xhc3M9InRpdGxlLXNpbXBsZSI+QXNzZXNzbWVudCZuYnNwOyBtZXRob2RzPC9oND4KCiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8cD5FYWNoIHVuaXQgaXMgYXNzZXNzZWQgYnkgc2V2ZXJhbCZuYnNwOyB3YXlzLiBFdmVyeSBTYXQgZGF5IGEgbmV3IHVuaXQgd2lsbCBiZSBzdGFydGVkLiBBIHN0dWR5IGd1aWRlIGF2YWlsYWJsZSBvbmxpbmUgc2hvdWxkIGJlIGZvbGxvd2VkLiBvbiA1dGggZGF5IGFuIGFzc2lnbm1lbnQgYW5kIDQgTUNRIHdpbGwgYmUgYXZhaWxhYmxlIG9uIGxpbmUuIEEgc2FtcGxlIGFzc2lnbm1lbnQgd2lsbCBiZSBzdXBwbGllZCBkdXJpbmcgdGhlIG9yaWVudGF0aW9uIHByb2dyYW0uJm5ic3A7IEFzc2lnbm1lbnQgZm9yIGV2ZXJ5IHVuaXQgaW4gd3JpdHRlbiBmb3JtIHdpbGwgYmUgdGhlIG1haW4gc3RlbSBvZiB0aGUgYXNzZXNzbWVudCBwcm9jZXNzLiBXb3JrLWJhc2VkIGFzc2Vzc21lbnQgb2YgaW5kaXZpZHVhbCB0YXNrIHdpbGwgYmUgYXNzZXNzZWQgYnkgYSBjb21wZXRlbnQgYXV0aG9yaXR5LiBUaGlzIG1heSBiZSZuYnNwOyBhIHNsaWRlIHByZXBhcmF0aW9uIG9mIGludGVyYWN0aXZlIGxlY3R1cmUsIHBsYW5uaW5nIG9mIGEgYmVkc2lkZSB0ZWFjaGluZyBvciBwcmVwYXJhdGlvbiBvZiA1IE9TUEUgc3RhdGlvbnMgb2YgdGhlaXIgb3duIGRpc2NpcGxpbmUuIE9uIDd0aCBkYXkgdGhhdCBpcyBvbiBGcmlkYXkgYnkgNiBwbSBhc3NpZ25tZW50cyBhbmQgTUNRcyBzaG91bGQgYmUgc3VibWl0dGVkIHRvIHRoZSBmYWN1bHR5IGZvciBhc3Nlc3NtZW50IGFuZCBtYXJraW5nLiZuYnNwOyBGb3IgdGhlIGFzc2lnbm1lbnQgdGhlcmUgd2lsbCBiZSA0MCBtYXJrcyBhbmQgZm9yIE1DUSAxMCBtYXJrcy4gV2hvbGUgdW5pdCBtYXJrcyB3aWxsIGFjdCBhcyBmb3JtYXRpdmUgYXNzZXNzbWVudCBhbmQgaXQgd2lsbCBhZGQgdGhlIG1hcmtzIG9mIHRoZSBtb2R1bGUgZXhhbWluYXRpb24uPC9wPjxoNCBjbGFzcz0idGl0bGUtc2ltcGxlIiBzdHlsZT0iY29sb3I6IHJnYigwLCAwLCAwKTsiPk1hcmtpbmcgY3JpdGVyaWE8L2g0PjxwIHN0eWxlPSJjb2xvcjogcmdiKDAsIDAsIDApOyI+QSsgd2lsbCBpbmRpY2F0ZSAmZ3Q7NzAlICwgQSBpcyBiZXR3ZWVuIDYwLTcwJSwmbmJzcDsgQiB3aWxsIGluZGljYXRlIHRoYXQgY29ycmVjdGlvbiBuZWVkZWQgYW5kIHNob3VsZCBiZSByZXN1Ym1pdHRlZCB3aXRoaW4gMjQgaG91cnMuIEMgd2lsbCBpbmRpY2F0ZSB0aGF0IGl0IGlzIG5vdCBhY2NlcHRhYmxlIGFuZCBzaG91bGQgYmUgcmUtd3JpdHRlbiBhbmQgc3VibWl0dGVkIGFnYWluIHdpdGhpbiBvbmUgd2Vlay4gSWYgbmVjZXNzYXJ5IGZlZWRiYWNrIHdpbGwgYmUgcHJvdmlkZWQgYnkgdGhlIGZhY3VsdHkuJm5ic3A7PC9wPjxwPlBsYWdpYXJpc20gaXMgYSBzcGVjaWZpYyBmb3JtIG9mIGFjYWRlbWljIGRpc2hvbmVzdHkgaW52b2x2aW5nIHRoZSBwcmVzZW50YXRpb24gb2YgYW5vdGhlciBhcyBvbmXigJlzIG93bi4mbmJzcDsgU28gZGlyZWN0IGNvcHlpbmcgZnJvbSB0ZXh0Ym9va3MsIGpvdXJuYWxzLCBwZXJpb2RpY2FscyBldGMgd2l0aCBmdWxsIGFja25vd2xlZGdlbWVudCBvZiB0aGUgYWN0dWFsIGF1dGhvciBpcyBhIHB1bmlzaGFibGUgb2ZmZW5jZS4gUGFyYXBocmFzaW5nIGFuZCBjb3B5aW5nIGFub3RoZXIgd29yayBjb21l4oCZcyB1bmRlciBzYW1lIG9mZmVuY2UuIFNvIGEgY29kZSBvZiBjb25kdWN0IGZvciB0aGUgdGVhY2hlciB3aWxsIGJlIGFwcGxpY2FibGUgZm9yIGFsbCBwYXJ0aWNpcGFudHMuPC9wPjxwIHN0eWxlPSJjb2xvcjogcmdiKDAsIDAsIDApOyI+PGJyPjwvcD48cD48Zm9udCBmYWNlPSJIZWx2ZXRpY2EgTmV1ZSwgSGVsdmV0aWNhLCBBcmlhbCwgc2Fucy1zZXJpZiI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMThweDsiPkV0aGljYWwgaXNzdWVzPC9zcGFuPjwvZm9udD48YnI+PC9wPjxwPlBhcnRpY2lwYW50cyB3aWxsIG1hbmFnZSBsZWF2ZSwgY2xhc3Mgc2NoZWR1bGUsIGFuZCByZWFkaW5nIHRpbWUsIGFzc2Vzc21lbnQgdGltZSBhbmQgbG9naXN0aWMgYnkgdGhlbXNlbHZlcy4gVGhlIGF1dGhvcml0eSBmb3IgdGhlIGNvdXJzZSB3aWxsIG5vdCB0YWtlIGFueSByZXNwb25zaWJpbGl0eSBmb3IgdGhlc2UgY2FzZXMuPC9wPjxwPjxmb250IGZhY2U9IkhlbHZldGljYSBOZXVlLCBIZWx2ZXRpY2EsIEFyaWFsLCBzYW5zLXNlcmlmIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxOHB4OyI+UmVzdWx0IGRlY2xhcmF0aW9uPC9zcGFuPjwvZm9udD48YnI+PC9wPjxwPkZvcm1hdGl2ZSBhc3Nlc3NtZW50IHdpbGwgYmUgZGVjbGFyZWQgaW5kaXZpZHVhbGx5IGFuZCBtb2R1bGUgYXNzZXNzbWVudCB3aWxsIGJlIGRlY2xhcmVkIGFzIGEgd2hvbGUuIEFmdGVyIGNvbXBsZXRpb24gb2YgYWxsIHRoZSBtb2R1bGUgdGhlIGZvcm1hdGl2ZSBhc3Nlc3NtZW50IHdpbGwgYmUgdGFrZW4gYW5kIGEgcmVzdWx0IG9mIGFsbCB0aG9zZSB3aWxsIGJlIGZvcm11bGF0ZWQgdG8gZGVjbGFyZSBzdWNjZXNzZnVsIGNhbmRpZGF0ZXMuIEEgY2VydGlmaWNhdGUgb2YgY29tcGxldGlvbiB3aWxsIGJlIGF3YXJkZWQgaW4gY2VyZW1vbnkgZm9yIHN1Y2Nlc3NmdWwgY2FuZGlkYXRlcy48L3A+PHA+PGJyPjwvcD48cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0idGV4dC1hbGlnbjpqdXN0aWZ5O3RleHQtanVzdGlmeTppbnRlci1pZGVvZ3JhcGgiPjxiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6IDEycHQ7IGxpbmUtaGVpZ2h0OiAxMTUlOyBmb250LWZhbWlseTogQXJpYWwsIHNhbnMtc2VyaWY7IGJhY2tncm91bmQtaW1hZ2U6IGluaXRpYWw7IGJhY2tncm91bmQtcG9zaXRpb246IGluaXRpYWw7IGJhY2tncm91bmQtc2l6ZTogaW5pdGlhbDsgYmFja2dyb3VuZC1yZXBlYXQ6IGluaXRpYWw7IGJhY2tncm91bmQtYXR0YWNobWVudDogaW5pdGlhbDsgYmFja2dyb3VuZC1vcmlnaW46IGluaXRpYWw7IGJhY2tncm91bmQtY2xpcDogaW5pdGlhbDsiPlJVTEVTICZuYnNwO0FORCAmbmJzcDtSRUdVTEFUSU9OUzo8L3NwYW4+PC9iPjxiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTguMHB0O21zby1iaWRpLWZvbnQtc2l6ZToKMTQuMHB0O2xpbmUtaGVpZ2h0OjExNSU7Zm9udC1mYW1pbHk6IiB0aW1lcz0iIiBuZXc9IiIgcm9tYW4iLCJzZXJpZiIiPSIiPjxvOnA+PC9vOnA+PC9zcGFuPjwvYj48L3A+PHAgY2xhc3M9Ik1zb05vcm1hbCIgc3R5bGU9InRleHQtYWxpZ246anVzdGlmeTt0ZXh0LWp1c3RpZnk6aW50ZXItaWRlb2dyYXBoIj48Yj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjE0LjBwdDtsaW5lLWhlaWdodDoKMTE1JTtmb250LWZhbWlseToiIHRpbWVzPSIiIG5ldz0iIiByb21hbiIsInNlcmlmIiI9IiI+Q2VydGlmaWNhdGUgQ291cnNlIG9uIE1lZGljYWwKRWR1Y2F0aW9uPG86cD48L286cD48L3NwYW4+PC9iPjwvcD48cCBjbGFzcz0iTXNvTGlzdFBhcmFncmFwaEN4U3BGaXJzdCIgc3R5bGU9InRleHQtYWxpZ246anVzdGlmeTt0ZXh0LWp1c3RpZnk6aW50ZXItaWRlb2dyYXBoOwp0ZXh0LWluZGVudDotLjI1aW47bXNvLWxpc3Q6bDEgbGV2ZWwxIGxmbzEiPjwhLS1baWYgIXN1cHBvcnRMaXN0c10tLT48c3BhbiBzdHlsZT0iZm9udC1zaXplOjE0LjBwdDtsaW5lLWhlaWdodDoxMTUlO2ZvbnQtZmFtaWx5OlN5bWJvbDttc28tZmFyZWFzdC1mb250LWZhbWlseToKU3ltYm9sO21zby1iaWRpLWZvbnQtZmFtaWx5OlN5bWJvbCI+wrc8c3BhbiBzdHlsZT0iZm9udC12YXJpYW50LW51bWVyaWM6IG5vcm1hbDsgZm9udC12YXJpYW50LWVhc3QtYXNpYW46IG5vcm1hbDsgZm9udC1zdHJldGNoOiBub3JtYWw7IGZvbnQtc2l6ZTogN3B0OyBsaW5lLWhlaWdodDogbm9ybWFsOyBmb250LWZhbWlseTogIiB0aW1lcz0iIiBuZXc9IiIgcm9tYW4iOyI9IiI+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Cjwvc3Bhbj48L3NwYW4+PCEtLVtlbmRpZl0tLT48c3BhbiBzdHlsZT0iZm9udC1zaXplOjE0LjBwdDtsaW5lLWhlaWdodDoxMTUlOwpmb250LWZhbWlseToiIHRpbWVzPSIiIG5ldz0iIiByb21hbiIsInNlcmlmIiI9IiI+Q291cnNlIGR1cmF0aW9uIOKAkyA2IG1vbnRoczxvOnA+PC9vOnA+PC9zcGFuPjwvcD48cCBjbGFzcz0iTXNvTGlzdFBhcmFncmFwaEN4U3BNaWRkbGUiIHN0eWxlPSJ0ZXh0LWFsaWduOmp1c3RpZnk7dGV4dC1qdXN0aWZ5OgppbnRlci1pZGVvZ3JhcGg7dGV4dC1pbmRlbnQ6LS4yNWluO21zby1saXN0OmwxIGxldmVsMSBsZm8xIj48IS0tW2lmICFzdXBwb3J0TGlzdHNdLS0+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxNC4wcHQ7bGluZS1oZWlnaHQ6MTE1JTtmb250LWZhbWlseTpTeW1ib2w7bXNvLWZhcmVhc3QtZm9udC1mYW1pbHk6ClN5bWJvbDttc28tYmlkaS1mb250LWZhbWlseTpTeW1ib2wiPsK3PHNwYW4gc3R5bGU9ImZvbnQtdmFyaWFudC1udW1lcmljOiBub3JtYWw7IGZvbnQtdmFyaWFudC1lYXN0LWFzaWFuOiBub3JtYWw7IGZvbnQtc3RyZXRjaDogbm9ybWFsOyBmb250LXNpemU6IDdwdDsgbGluZS1oZWlnaHQ6IG5vcm1hbDsgZm9udC1mYW1pbHk6ICIgdGltZXM9IiIgbmV3PSIiIHJvbWFuIjsiPSIiPiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOwo8L3NwYW4+PC9zcGFuPjwhLS1bZW5kaWZdLS0+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxNC4wcHQ7bGluZS1oZWlnaHQ6MTE1JTsKZm9udC1mYW1pbHk6IiB0aW1lcz0iIiBuZXc9IiIgcm9tYW4iLCJzZXJpZiIiPSIiPkFkbWlzc2lvbiBjcml0ZXJpYS0gQ2FuZGlkYXRlcy9mZWxsb3dzCnNob3VsZCBoYXZlIHBvc3QgZ3JhZHVhdGUgZGVncmVlIGluIGFueSBzdWJqZWN0LjxvOnA+PC9vOnA+PC9zcGFuPjwvcD48cCBjbGFzcz0iTXNvTGlzdFBhcmFncmFwaEN4U3BNaWRkbGUiIHN0eWxlPSJ0ZXh0LWFsaWduOmp1c3RpZnk7dGV4dC1qdXN0aWZ5OgppbnRlci1pZGVvZ3JhcGg7dGV4dC1pbmRlbnQ6LS4yNWluO21zby1saXN0OmwxIGxldmVsMSBsZm8xIj48IS0tW2lmICFzdXBwb3J0TGlzdHNdLS0+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxNC4wcHQ7bGluZS1oZWlnaHQ6MTE1JTtmb250LWZhbWlseTpTeW1ib2w7bXNvLWZhcmVhc3QtZm9udC1mYW1pbHk6ClN5bWJvbDttc28tYmlkaS1mb250LWZhbWlseTpTeW1ib2wiPsK3PHNwYW4gc3R5bGU9ImZvbnQtdmFyaWFudC1udW1lcmljOiBub3JtYWw7IGZvbnQtdmFyaWFudC1lYXN0LWFzaWFuOiBub3JtYWw7IGZvbnQtc3RyZXRjaDogbm9ybWFsOyBmb250LXNpemU6IDdwdDsgbGluZS1oZWlnaHQ6IG5vcm1hbDsgZm9udC1mYW1pbHk6ICIgdGltZXM9IiIgbmV3PSIiIHJvbWFuIjsiPSIiPiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOwo8L3NwYW4+PC9zcGFuPjwhLS1bZW5kaWZdLS0+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxNC4wcHQ7bGluZS1oZWlnaHQ6MTE1JTsKZm9udC1mYW1pbHk6IiB0aW1lcz0iIiBuZXc9IiIgcm9tYW4iLCJzZXJpZiIiPSIiPkNvdXJzZSBmZWUtIFRrLiAyNTAwMC8tPG86cD48L286cD48L3NwYW4+PC9wPjxwIGNsYXNzPSJNc29MaXN0UGFyYWdyYXBoQ3hTcE1pZGRsZSIgc3R5bGU9InRleHQtYWxpZ246anVzdGlmeTt0ZXh0LWp1c3RpZnk6CmludGVyLWlkZW9ncmFwaDt0ZXh0LWluZGVudDotLjI1aW47bXNvLWxpc3Q6bDEgbGV2ZWwxIGxmbzEiPjwhLS1baWYgIXN1cHBvcnRMaXN0c10tLT48c3BhbiBzdHlsZT0iZm9udC1zaXplOjE0LjBwdDtsaW5lLWhlaWdodDoxMTUlO2ZvbnQtZmFtaWx5OlN5bWJvbDttc28tZmFyZWFzdC1mb250LWZhbWlseToKU3ltYm9sO21zby1iaWRpLWZvbnQtZmFtaWx5OlN5bWJvbCI+wrc8c3BhbiBzdHlsZT0iZm9udC12YXJpYW50LW51bWVyaWM6IG5vcm1hbDsgZm9udC12YXJpYW50LWVhc3QtYXNpYW46IG5vcm1hbDsgZm9udC1zdHJldGNoOiBub3JtYWw7IGZvbnQtc2l6ZTogN3B0OyBsaW5lLWhlaWdodDogbm9ybWFsOyBmb250LWZhbWlseTogIiB0aW1lcz0iIiBuZXc9IiIgcm9tYW4iOyI9IiI+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Cjwvc3Bhbj48L3NwYW4+PCEtLVtlbmRpZl0tLT48c3BhbiBzdHlsZT0iZm9udC1zaXplOjE0LjBwdDtsaW5lLWhlaWdodDoxMTUlOwpmb250LWZhbWlseToiIHRpbWVzPSIiIG5ldz0iIiByb21hbiIsInNlcmlmIiI9IiI+RmFjdWx0aWVzLSBBbGwmbmJzcDsgY29vcmRpbmF0b3JzIGFuZCB0dXRvcnMgc2hvdWxkIGhhdmUgZGVncmVlIGluCm1lZGljYWwgZWR1Y2F0aW9uPG86cD48L286cD48L3NwYW4+PC9wPjxwIGNsYXNzPSJNc29MaXN0UGFyYWdyYXBoQ3hTcE1pZGRsZSIgc3R5bGU9InRleHQtYWxpZ246anVzdGlmeTt0ZXh0LWp1c3RpZnk6CmludGVyLWlkZW9ncmFwaDt0ZXh0LWluZGVudDotLjI1aW47bXNvLWxpc3Q6bDEgbGV2ZWwxIGxmbzEiPjwhLS1baWYgIXN1cHBvcnRMaXN0c10tLT48c3BhbiBzdHlsZT0iZm9udC1zaXplOjE0LjBwdDtsaW5lLWhlaWdodDoxMTUlO2ZvbnQtZmFtaWx5OlN5bWJvbDttc28tZmFyZWFzdC1mb250LWZhbWlseToKU3ltYm9sO21zby1iaWRpLWZvbnQtZmFtaWx5OlN5bWJvbCI+wrc8c3BhbiBzdHlsZT0iZm9udC12YXJpYW50LW51bWVyaWM6IG5vcm1hbDsgZm9udC12YXJpYW50LWVhc3QtYXNpYW46IG5vcm1hbDsgZm9udC1zdHJldGNoOiBub3JtYWw7IGZvbnQtc2l6ZTogN3B0OyBsaW5lLWhlaWdodDogbm9ybWFsOyBmb250LWZhbWlseTogIiB0aW1lcz0iIiBuZXc9IiIgcm9tYW4iOyI9IiI+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Cjwvc3Bhbj48L3NwYW4+PCEtLVtlbmRpZl0tLT48c3BhbiBzdHlsZT0iZm9udC1zaXplOjE0LjBwdDtsaW5lLWhlaWdodDoxMTUlOwpmb250LWZhbWlseToiIHRpbWVzPSIiIG5ldz0iIiByb21hbiIsInNlcmlmIiI9IiI+Q3VycmljdWx1bS0gQSB3ZWxsIHN0cnVjdHVyZWQgY3VycmljdWx1bQppcyBwcmVwYXJlZCBieSB0aGUgZmFjdWx0aWVzIGFuZCBhcHByb3ZlZCBieSB0aGUgYXV0aG9yaXR5PG86cD48L286cD48L3NwYW4+PC9wPjxwIGNsYXNzPSJNc29MaXN0UGFyYWdyYXBoQ3hTcE1pZGRsZSIgc3R5bGU9InRleHQtYWxpZ246anVzdGlmeTt0ZXh0LWp1c3RpZnk6CmludGVyLWlkZW9ncmFwaDt0ZXh0LWluZGVudDotLjI1aW47bXNvLWxpc3Q6bDEgbGV2ZWwxIGxmbzEiPjwhLS1baWYgIXN1cHBvcnRMaXN0c10tLT48c3BhbiBzdHlsZT0iZm9udC1zaXplOjE0LjBwdDtsaW5lLWhlaWdodDoxMTUlO2ZvbnQtZmFtaWx5OlN5bWJvbDttc28tZmFyZWFzdC1mb250LWZhbWlseToKU3ltYm9sO21zby1iaWRpLWZvbnQtZmFtaWx5OlN5bWJvbCI+wrc8c3BhbiBzdHlsZT0iZm9udC12YXJpYW50LW51bWVyaWM6IG5vcm1hbDsgZm9udC12YXJpYW50LWVhc3QtYXNpYW46IG5vcm1hbDsgZm9udC1zdHJldGNoOiBub3JtYWw7IGZvbnQtc2l6ZTogN3B0OyBsaW5lLWhlaWdodDogbm9ybWFsOyBmb250LWZhbWlseTogIiB0aW1lcz0iIiBuZXc9IiIgcm9tYW4iOyI9IiI+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Cjwvc3Bhbj48L3NwYW4+PCEtLVtlbmRpZl0tLT48c3BhbiBzdHlsZT0iZm9udC1zaXplOjE0LjBwdDtsaW5lLWhlaWdodDoxMTUlOwpmb250LWZhbWlseToiIHRpbWVzPSIiIG5ldz0iIiByb21hbiIsInNlcmlmIiI9IiI+VGVhY2hpbmcgbGVhcm5pbmctIHNtYWxsIGdyb3VwCmRpc2N1c3Npb24sIHNlbGYgb3IgaW5kaXZpZHVhbGl6ZWQgbGVhcm5pbmcuIExlYXJuaW5nIG1hdGVyaWFscyB3aWxsIGJlIHByb3ZpZGVkCmJ5IHRoZSBhdXRob3JpdHkgb3IgbGlzdCBvZiB0aGUgbWF0ZXJpYWwgd2lsbCBiZSBnaXZlbiB0byB0aGUgZmVsbG93cy4gVGhlc2UKYXJlIC0xKSBzcGVjaWZpYyBjaGFwdGVyIGZyb20gYm9va3MgMikgYXJ0aWNsZSBmcm9tIGpvdXJuYWwgYW5kIDMpIHdlYnNpdGUgbGluazxvOnA+PC9vOnA+PC9zcGFuPjwvcD48cCBjbGFzcz0iTXNvTGlzdFBhcmFncmFwaEN4U3BNaWRkbGUiIHN0eWxlPSJ0ZXh0LWFsaWduOmp1c3RpZnk7dGV4dC1qdXN0aWZ5OgppbnRlci1pZGVvZ3JhcGg7dGV4dC1pbmRlbnQ6LS4yNWluO21zby1saXN0OmwxIGxldmVsMSBsZm8xIj48IS0tW2lmICFzdXBwb3J0TGlzdHNdLS0+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxNC4wcHQ7bGluZS1oZWlnaHQ6MTE1JTtmb250LWZhbWlseTpTeW1ib2w7bXNvLWZhcmVhc3QtZm9udC1mYW1pbHk6ClN5bWJvbDttc28tYmlkaS1mb250LWZhbWlseTpTeW1ib2wiPsK3PHNwYW4gc3R5bGU9ImZvbnQtdmFyaWFudC1udW1lcmljOiBub3JtYWw7IGZvbnQtdmFyaWFudC1lYXN0LWFzaWFuOiBub3JtYWw7IGZvbnQtc3RyZXRjaDogbm9ybWFsOyBmb250LXNpemU6IDdwdDsgbGluZS1oZWlnaHQ6IG5vcm1hbDsgZm9udC1mYW1pbHk6ICIgdGltZXM9IiIgbmV3PSIiIHJvbWFuIjsiPSIiPiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOwo8L3NwYW4+PC9zcGFuPjwhLS1bZW5kaWZdLS0+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxNC4wcHQ7bGluZS1oZWlnaHQ6MTE1JTsKZm9udC1mYW1pbHk6IiB0aW1lcz0iIiBuZXc9IiIgcm9tYW4iLCJzZXJpZiIiPSIiPlRoZXJlIGlzIGEgbW9kdWxlIGNvb3JkaW5hdG9yIHdobyB3aWxsCmludm9sdmUgaW4gdGVhY2hpbmcgbGVhcm5pbmcgcHJvY2VzcywgZ3VpZGUgdGhlIHR1dG9yIGZvciB0ZWFjaGluZyBhbmQKYXNzZXNzbWVudCwgY29tcGlsZSB0aGUgcmVzdWx0IGFuZCBmaW5hbGx5IGNvb3JkaW5hdGUgd2l0aCB0aGUgYXV0aG9yaXR5LiA8bzpwPjwvbzpwPjwvc3Bhbj48L3A+PHAgY2xhc3M9Ik1zb0xpc3RQYXJhZ3JhcGhDeFNwTWlkZGxlIiBzdHlsZT0idGV4dC1hbGlnbjpqdXN0aWZ5O3RleHQtanVzdGlmeToKaW50ZXItaWRlb2dyYXBoO3RleHQtaW5kZW50Oi0uMjVpbjttc28tbGlzdDpsMSBsZXZlbDEgbGZvMSI+PCEtLVtpZiAhc3VwcG9ydExpc3RzXS0tPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTQuMHB0O2xpbmUtaGVpZ2h0OjExNSU7Zm9udC1mYW1pbHk6U3ltYm9sO21zby1mYXJlYXN0LWZvbnQtZmFtaWx5OgpTeW1ib2w7bXNvLWJpZGktZm9udC1mYW1pbHk6U3ltYm9sIj7CtzxzcGFuIHN0eWxlPSJmb250LXZhcmlhbnQtbnVtZXJpYzogbm9ybWFsOyBmb250LXZhcmlhbnQtZWFzdC1hc2lhbjogbm9ybWFsOyBmb250LXN0cmV0Y2g6IG5vcm1hbDsgZm9udC1zaXplOiA3cHQ7IGxpbmUtaGVpZ2h0OiBub3JtYWw7IGZvbnQtZmFtaWx5OiAiIHRpbWVzPSIiIG5ldz0iIiByb21hbiI7Ij0iIj4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsKPC9zcGFuPjwvc3Bhbj48IS0tW2VuZGlmXS0tPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTQuMHB0O2xpbmUtaGVpZ2h0OjExNSU7CmZvbnQtZmFtaWx5OiIgdGltZXM9IiIgbmV3PSIiIHJvbWFuIiwic2VyaWYiIj0iIj5FYWNoIHR1dG9yIGlzIGFzc2lnbmVkIHdpdGggYXQgbGVhc3QgNQpmZWxsb3dzIGZvciBhIHNwZWNpZmljIHVuaXQ8bzpwPjwvbzpwPjwvc3Bhbj48L3A+PHAgY2xhc3M9Ik1zb0xpc3RQYXJhZ3JhcGhDeFNwTWlkZGxlIiBzdHlsZT0idGV4dC1hbGlnbjpqdXN0aWZ5O3RleHQtanVzdGlmeToKaW50ZXItaWRlb2dyYXBoO3RleHQtaW5kZW50Oi0uMjVpbjttc28tbGlzdDpsMSBsZXZlbDEgbGZvMSI+PCEtLVtpZiAhc3VwcG9ydExpc3RzXS0tPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTQuMHB0O2xpbmUtaGVpZ2h0OjExNSU7Zm9udC1mYW1pbHk6U3ltYm9sO21zby1mYXJlYXN0LWZvbnQtZmFtaWx5OgpTeW1ib2w7bXNvLWJpZGktZm9udC1mYW1pbHk6U3ltYm9sIj7CtzxzcGFuIHN0eWxlPSJmb250LXZhcmlhbnQtbnVtZXJpYzogbm9ybWFsOyBmb250LXZhcmlhbnQtZWFzdC1hc2lhbjogbm9ybWFsOyBmb250LXN0cmV0Y2g6IG5vcm1hbDsgZm9udC1zaXplOiA3cHQ7IGxpbmUtaGVpZ2h0OiBub3JtYWw7IGZvbnQtZmFtaWx5OiAiIHRpbWVzPSIiIG5ldz0iIiByb21hbiI7Ij0iIj4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsKPC9zcGFuPjwvc3Bhbj48IS0tW2VuZGlmXS0tPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTQuMHB0O2xpbmUtaGVpZ2h0OjExNSU7CmZvbnQtZmFtaWx5OiIgdGltZXM9IiIgbmV3PSIiIHJvbWFuIiwic2VyaWYiIj0iIj5GZWxsb3dzIHNob3VsZCBjb21wbGV0ZSBvbmUgdW5pdCBpbiBhCndlZWsgd2l0aCBhIG1pbmltdW0gMTAgaG91cnMgcmVhZGluZyB0aW1lIHBlciB3ZWVrLiA8bzpwPjwvbzpwPjwvc3Bhbj48L3A+PHAgY2xhc3M9Ik1zb0xpc3RQYXJhZ3JhcGhDeFNwTWlkZGxlIiBzdHlsZT0idGV4dC1hbGlnbjpqdXN0aWZ5O3RleHQtanVzdGlmeToKaW50ZXItaWRlb2dyYXBoO3RleHQtaW5kZW50Oi0uMjVpbjttc28tbGlzdDpsMSBsZXZlbDEgbGZvMSI+PCEtLVtpZiAhc3VwcG9ydExpc3RzXS0tPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTQuMHB0O2xpbmUtaGVpZ2h0OjExNSU7Zm9udC1mYW1pbHk6U3ltYm9sO21zby1mYXJlYXN0LWZvbnQtZmFtaWx5OgpTeW1ib2w7bXNvLWJpZGktZm9udC1mYW1pbHk6U3ltYm9sIj7CtzxzcGFuIHN0eWxlPSJmb250LXZhcmlhbnQtbnVtZXJpYzogbm9ybWFsOyBmb250LXZhcmlhbnQtZWFzdC1hc2lhbjogbm9ybWFsOyBmb250LXN0cmV0Y2g6IG5vcm1hbDsgZm9udC1zaXplOiA3cHQ7IGxpbmUtaGVpZ2h0OiBub3JtYWw7IGZvbnQtZmFtaWx5OiAiIHRpbWVzPSIiIG5ldz0iIiByb21hbiI7Ij0iIj4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsKPC9zcGFuPjwvc3Bhbj48IS0tW2VuZGlmXS0tPjxiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTQuMHB0O2xpbmUtaGVpZ2h0OjExNSU7Zm9udC1mYW1pbHk6IiB0aW1lcz0iIiBuZXc9IiIgcm9tYW4iLCJzZXJpZiIiPSIiPkFzc2Vzc21lbnQ8L3NwYW4+PC9iPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTQuMHB0O2xpbmUtaGVpZ2h0OjExNSU7Zm9udC1mYW1pbHk6IiB0aW1lcz0iIiBuZXc9IiIgcm9tYW4iLCJzZXJpZiIiPSIiPi0KRmVsbG93cyB3aWxsIGJlIGFzc2Vzc2VkIGR1cmluZyB0aGUgY291cnNlIChmb3JtYXRpdmUpIGFuZCBhdCB0aGUmbmJzcDsgZW5kIG9mIHRoZSBjb3Vyc2UgKHN1bW1hdGl2ZSkgLiZuYnNwOyA8bzpwPjwvbzpwPjwvc3Bhbj48L3A+PHAgY2xhc3M9Ik1zb0xpc3RQYXJhZ3JhcGhDeFNwTWlkZGxlIiBzdHlsZT0idGV4dC1hbGlnbjpqdXN0aWZ5O3RleHQtanVzdGlmeToKaW50ZXItaWRlb2dyYXBoIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjE0LjBwdDtsaW5lLWhlaWdodDoxMTUlO2ZvbnQtZmFtaWx5OgoiIHRpbWVzPSIiIG5ldz0iIiByb21hbiIsInNlcmlmIiI9IiI+Rm9ybWF0aXZlIGFzc2Vzc21lbnQtIDQwJSBtYXJrcyAob25saW5lKSA8bzpwPjwvbzpwPjwvc3Bhbj48L3A+PHAgY2xhc3M9Ik1zb0xpc3RQYXJhZ3JhcGhDeFNwTWlkZGxlIiBzdHlsZT0ibWFyZ2luLWxlZnQ6Ljc1aW47bXNvLWFkZC1zcGFjZToKYXV0bzt0ZXh0LWFsaWduOmp1c3RpZnk7dGV4dC1qdXN0aWZ5OmludGVyLWlkZW9ncmFwaDt0ZXh0LWluZGVudDotLjI1aW47Cm1zby1saXN0OmwwIGxldmVsMSBsZm8yIj48IS0tW2lmICFzdXBwb3J0TGlzdHNdLS0+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxNC4wcHQ7CmxpbmUtaGVpZ2h0OjExNSU7Zm9udC1mYW1pbHk6IiB0aW1lcz0iIiBuZXc9IiIgcm9tYW4iLCJzZXJpZiI7bXNvLWZhcmVhc3QtZm9udC1mYW1pbHk6PSIiICJ0aW1lcz0iIiByb21hbiIiPSIiPmEpPHNwYW4gc3R5bGU9ImZvbnQtdmFyaWFudC1udW1lcmljOiBub3JtYWw7IGZvbnQtdmFyaWFudC1lYXN0LWFzaWFuOiBub3JtYWw7IGZvbnQtc3RyZXRjaDogbm9ybWFsOyBmb250LXNpemU6IDdwdDsgbGluZS1oZWlnaHQ6IG5vcm1hbDsgZm9udC1mYW1pbHk6ICIgdGltZXM9IiIgbmV3PSIiIHJvbWFuIjsiPSIiPiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOwo8L3NwYW4+PC9zcGFuPjwhLS1bZW5kaWZdLS0+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxNC4wcHQ7bGluZS1oZWlnaHQ6MTE1JTsKZm9udC1mYW1pbHk6IiB0aW1lcz0iIiBuZXc9IiIgcm9tYW4iLCJzZXJpZiIiPSIiPkFzc2lnbm1lbnQtIDQwIGluIGVhY2ggdW5pdCB0b3RhbCAyMDA8bzpwPjwvbzpwPjwvc3Bhbj48L3A+PHAgY2xhc3M9Ik1zb0xpc3RQYXJhZ3JhcGhDeFNwTGFzdCIgc3R5bGU9Im1hcmdpbi1sZWZ0Oi43NWluO21zby1hZGQtc3BhY2U6YXV0bzsKdGV4dC1hbGlnbjpqdXN0aWZ5O3RleHQtanVzdGlmeTppbnRlci1pZGVvZ3JhcGg7dGV4dC1pbmRlbnQ6LS4yNWluO21zby1saXN0OgpsMCBsZXZlbDEgbGZvMiI+PCEtLVtpZiAhc3VwcG9ydExpc3RzXS0tPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTQuMHB0O2xpbmUtaGVpZ2h0OgoxMTUlO2ZvbnQtZmFtaWx5OiIgdGltZXM9IiIgbmV3PSIiIHJvbWFuIiwic2VyaWYiO21zby1mYXJlYXN0LWZvbnQtZmFtaWx5OiJ0aW1lcz0iIiByb21hbiIiPSIiPmIpPHNwYW4gc3R5bGU9ImZvbnQtdmFyaWFudC1udW1lcmljOiBub3JtYWw7IGZvbnQtdmFyaWFudC1lYXN0LWFzaWFuOiBub3JtYWw7IGZvbnQtc3RyZXRjaDogbm9ybWFsOyBmb250LXNpemU6IDdwdDsgbGluZS1oZWlnaHQ6IG5vcm1hbDsgZm9udC1mYW1pbHk6ICIgdGltZXM9IiIgbmV3PSIiIHJvbWFuIjsiPSIiPiZuYnNwOyZuYnNwOyZuYnNwOwo8L3NwYW4+PC9zcGFuPjwhLS1bZW5kaWZdLS0+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxNC4wcHQ7bGluZS1oZWlnaHQ6MTE1JTsKZm9udC1mYW1pbHk6IiB0aW1lcz0iIiBuZXc9IiIgcm9tYW4iLCJzZXJpZiIiPSIiPk1DUSA0LCBpbiBlYWNoIHVuaXQgMTAgbWFya3MgdG90YWwgNDAgaW4gYSBtb2R1bGUmbmJzcDsgJm5ic3A7PG86cD48L286cD48L3NwYW4+PC9wPjxwIGNsYXNzPSJNc29Ob3JtYWwiIHN0eWxlPSJtYXJnaW4tbGVmdDouNWluO3RleHQtYWxpZ246anVzdGlmeTt0ZXh0LWp1c3RpZnk6CmludGVyLWlkZW9ncmFwaCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxNC4wcHQ7bGluZS1oZWlnaHQ6MTE1JTtmb250LWZhbWlseToKIiB0aW1lcz0iIiBuZXc9IiIgcm9tYW4iLCJzZXJpZiIiPSIiPkZlbGxvd3MgaGF2ZSB0byBzdWJtaXQgb25lIGFzc2lnbm1lbnQgZm9yIGVhY2ggdW5pdC4KV2hvbGUgZm9ybWF0aXZlIGFzc2Vzc21lbnQgd2lsbCBiZSBjb21wbGV0ZWQgYnkgb25lIHdlZWsuIElmIGEgZmVsbG93IGZhaWxlZCB0bwpkbyBzbywgaGUgd2lsbCBiZSZuYnNwOyBhbGxvd2VkIHRvIGNvbXBsZXRlIGl0IGluIHN1YnNlcXVlbnQgd2Vla3MgYnV0IHdpdGhvdXQgY29tcGxldGluZyBvbmUKbW9kdWxlLCBoZS9zaGUgd2lsbCBub3QgYmUgYWxsb3dlZCB0byBzdGFydCB0aGUgbmV4dCBtb2R1bGUuIEFmdGVyIGVhY2ggbW9kdWxlIHRoZXJlIHdpbGwgYmUgb25lIHdlZWsgZ2FwLiBEdXJpbmcgdGhpcyBwZXJpb2QgaW5jb21wbGV0ZSB1bml0cyBpZiBuZWNlc3NhcnkgbWF5IGJlIGNvbXBsZXRlZC48bzpwPjwvbzpwPjwvc3Bhbj48L3A+PHA+CgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKPHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxNC4wcHQ7bGluZS1oZWlnaHQ6MTE1JTtmb250LWZhbWlseToiIHRpbWVzPSIiIG5ldz0iIiByb21hbiIsInNlcmlmIjs9IiIgbXNvLWZhcmVhc3QtZm9udC1mYW1pbHk6InRpbWVzPSIiIHJvbWFuIjttc28tZmFyZWFzdC10aGVtZS1mb250Om1pbm9yLWZhcmVhc3Q7PSIiIG1zby1hbnNpLWxhbmd1YWdlOmVuLXVzO21zby1mYXJlYXN0LWxhbmd1YWdlOmVuLXVzO21zby1iaWRpLWxhbmd1YWdlOmFyLXNhIj0iIj5UdXRvcgp3aWxsIHByb3ZpZGUgZmVlZGJhY2sgb24gdGhlIGFzc2lnbm1lbnQuIElmIHRoZSBhc3NpZ25tZW50IGlzIG5vdCBzYXRpc2ZhY3RvcnksCmZlbGxvd3MgaGF2ZSB0byBzdWJtaXQgaXQgYWdhaW4gd2l0aCBuZWNlc3NhcnkgY29ycmVjdGlvbnMuPC9zcGFuPjxicj48L3A+PHA+PGJyPjwvcD48cD48YnI+PC9wPgoKICAgICAgICAgICAgICAgICAgICAgICAgPC9kaXY+PCEtLSBCbG9nIERldGFpbCBXcmFwcGVyIC0tPgogICAgICAgICAgICAgICAgICAgIDwvZGl2PjwhLS0gQmxvZyBXcmFwcGVyIC0tPgoKCiAgICAgICAgICAgICAgICA8L2Rpdj4=', '2017-12-13 10:33:46', NULL, 1),
(10, 'The Regulations', 'rules-regulations', 'PGRpdiBjbGFzcz0iY29sLXhzLTEyIG5ld3Mtc2luZ2xlIj4KICAgICAgICAgICAgICAgICAgICA8ZGl2IGNsYXNzPSJibG9nLXNpbmdsZS13cmFwIj4KCiAgICAgICAgICAgICAgICAgICAgICAgIDwhLS0gQmxvZyBEZXRhaWwgV3JhcHBlciAtLT4KICAgICAgICAgICAgICAgICAgICAgICAgPGRpdiBjbGFzcz0ibmV3cy1zaW5nbGUtZGV0YWlscyI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8aDQgY2xhc3M9InRpdGxlLXNpbXBsZSIgc3R5bGU9ImNvbG9yOiByZ2IoMCwgMCwgMCk7Ij48dT48aT5HZW5lcmFsPC9pPjwvdT48L2g0PjxoNCBjbGFzcz0idGl0bGUtc2ltcGxlIiBzdHlsZT0iIj48Zm9udCBmYWNlPSJPcGVuIFNhbnMsIHNhbnMtc2VyaWYiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE0cHg7Ij5UaGlzIGNlcnRpZmljYXRlIGNvdXJzZSB3aWxsIG5vdCBjZXJ0aWZ5IHRoYXQgeW91IGFyZSBjb21wZXRlbnQgY2VydGFpbiBjbGluaWNhbCBhc3BlY3QuIEl0IGlzIG9ubHkgYXBwbGljYWJsZSBpbiB0ZXJtIG9mIG1lZGljYWwgZWR1Y2F0aW9uIG9ubHkuPC9zcGFuPjwvZm9udD48L2g0PjxoNCBjbGFzcz0idGl0bGUtc2ltcGxlIiBzdHlsZT0iIj48aT48dT5BZG1pc3Npb248L3U+PC9pPjxicj48L2g0PjxwPjwvcD48cD48L3A+PHVsPjwvdWw+PHA+PC9wPjxvbD48bGk+PGZvbnQgY29sb3I9IiMzMjMyM2EiIGZhY2U9Ik9wZW4gU2Fucywgc2Fucy1zZXJpZiI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTRweDsiPkEgY2FuZGlkYXRlIGZvciBhZG1pc3Npb24gdG8gdGhlIHByb2dyYW1tZSBtdXN0IGhhdmUmbmJzcDsgYWNoaXZlZCBhIHBvc3RncmFkdWF0ZSBkZWdyZWUgaW4gYW55IGRpc2NpcGxpbmUgYXBwcm92ZWQgYnkgQk1EQzwvc3Bhbj48L2ZvbnQ+PC9saT48bGk+Q3VycmVudGx5IGhlIGlzIGF0dGFjaGVkIHRvIGFueSBvZiB0aGUgbWVkaWNhbCBjb2xsZWdlIG9yIE1lZGljYWwgVW5pdmVyc2l0eS48L2xpPjxsaT5XaWxsaW5nIHRvIHNlcnZlIHRoZSBtZWRpY2FsIGNvbGxlZ2UgZm9yIHRoZSBzdHVkeSBwZXJpb2QgYW5kIHRocmVlIHllYXJzIHRoZXJlIGFmdGVyLjwvbGk+PC9vbD4KCiAgICAgICAgICAgICAgICAgICAgICAgIDwvZGl2PjwhLS0gQmxvZyBEZXRhaWwgV3JhcHBlciAtLT4KICAgICAgICAgICAgICAgICAgICA8L2Rpdj48IS0tIEJsb2cgV3JhcHBlciAtLT4KCgogICAgICAgICAgICAgICAgPC9kaXY+', '2017-12-13 10:40:01', NULL, 1),
(11, 'Books', 'books', 'PGRpdiBjbGFzcz0iY29sLXhzLTEyIG5ld3Mtc2luZ2xlIj4KICAgICAgICAgICAgICAgICAgICA8ZGl2IGNsYXNzPSJibG9nLXNpbmdsZS13cmFwIj4KCiAgICAgICAgICAgICAgICAgICAgICAgIDwhLS0gQmxvZyBEZXRhaWwgV3JhcHBlciAtLT4KICAgICAgICAgICAgICAgICAgICAgICAgPGRpdiBjbGFzcz0ibmV3cy1zaW5nbGUtZGV0YWlscyI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8aDQgY2xhc3M9InRpdGxlLXNpbXBsZSI+Qm9va3M6PC9oND4KCiAgICAgICAgICAgICAgICAgICAgICAgICAgIDx1bCBjbGFzcz0iZ28td2lkZ2V0Ij4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iIyI+MS4JQSBwcmFjdGljYWwgZ3VpZGUgZm9yIG1lZGljYWwgdGVhY2hlcnMuIERlbnQgUkEsIEhhcmRlbiBSTSwgZWRpdG9ycyAybmQgZWQuIENodXJjaGlsbCBMaXZpbmdzdG9uZSwgRWRpbmJ1cmdoLiAyMDA1PC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPjIuCUEgcHJhY3RpY2FsIGd1aWRlIHRvIG1lZGljYWwgc3R1ZGVudCBhc3Nlc3NtZW50LiBBbWluIFosIFNlbmcgQ1ksIEVuZyBLSCBlZGl0b3JzLiAxU1QgZWQuIFdvcmxkIFNjaWVudGlmaWMsIFNpbmdhcG9yZS4gMjAwNjwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj4zLglCYXNpY3MgaW4gbWVkaWNhbCBlZHVjYXRpb24uIEFtaW4gWiwgRW5nIEtIIGVkaXRvcnMuIDFzdCBlZCwgV29ybGQgU2NpZW50aWZpYywgTmV3IEplcnNleSwgMjAwMzwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj40LglBIGhhbmRib29rIGZvciBtZWRpY2FsIHRlYWNoZXIuIE5ld2JsZSBELCBDYW5ub24gUiBlZGl0b3JzLiA0dGggZWQuIEtsdXdlciBBY2FkZW1pYyBQdWJsaWNhdGlvbiwgQm9zdG9uLCAxOTk2PC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPjUuCUFzc2Vzc21lbnQgaW4gbWVkaWNhbCBlZHVjYXRpb246IFRyZW5kcyBhbmQgdG9vbHMuICBTb29kIFIuIDFTVCBlZC4gSyBMIFdpZyBjZW50cmUsIE5ldyBEZWxoaSwgMTk5MzwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj42LglDb25jZXB0cyBmIG1lZGljYWwgZWR1Y2F0aW9uLiBCZWd1bSBULiAxU1QgZWQuIERoYWthLCAyMDEzIDwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgPC91bD4KCiAgICAgICAgICAgICAgICAgICAgICAgIDwvZGl2PjwhLS0gQmxvZyBEZXRhaWwgV3JhcHBlciAtLT4KICAgICAgICAgICAgICAgICAgICA8L2Rpdj48IS0tIEJsb2cgV3JhcHBlciAtLT4KCgogICAgICAgICAgICAgICAgPC9kaXY+', '2017-12-13 10:44:03', NULL, 1),
(12, 'Booklets', 'booklets', 'PGRpdiBjbGFzcz0iY29sLXhzLTEyIG5ld3Mtc2luZ2xlIj4KICAgICAgICAgICAgICAgICAgICA8ZGl2IGNsYXNzPSJibG9nLXNpbmdsZS13cmFwIj4KCiAgICAgICAgICAgICAgICAgICAgICAgIDwhLS0gQmxvZyBEZXRhaWwgV3JhcHBlciAtLT4KICAgICAgICAgICAgICAgICAgICAgICAgPGRpdiBjbGFzcz0ibmV3cy1zaW5nbGUtZGV0YWlscyI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8aDQgY2xhc3M9InRpdGxlLXNpbXBsZSI+Qm9va2xldHM6PC9oND4KCiAgICAgICAgICAgICAgICAgICAgICAgICAgPHVsIGNsYXNzPSJnby13aWRnZXQiPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj4xLglELiBJLiBOZXdibGUuIEFzc2Vzc2luZyBDbGluaWNhbCBDb21wZXRlbmNlIGF0IHRoZSB1bmRlcmdyYWR1YXRlIGxldmVsLiBBU01FIE1lZGljYWwgRWR1Y2F0aW9uIEJvb2tsZXQgTm8uIDI1LiBEdW5kZWUsIDE5OTI8L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iIyI+Mi4JS25veCBKREUuIE1vZGlmaWVkIEVzc2F5IFF1ZXN0aW9uLiBBU01FIE1lZGljYWwgRWR1Y2F0aW9uIEJvb2tsZXQgTm8uIDUuIER1bmRlZSwgMTk4NjwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj4zLglTdG9rZXMgSkYuIFRoZSBjbGluaWNhbCBleGFtaW5hdGlvbi0gYXNzZXNzbWVudCBvZiBjbGluaWNhbCBza2lsbHMuIEFTTUUgYm9va2xldCBOby40LCBEdW5kZWUsIDE5NzQ8L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwvdWw+CgogICAgICAgICAgICAgICAgICAgICAgICA8L2Rpdj48IS0tIEJsb2cgRGV0YWlsIFdyYXBwZXIgLS0+CiAgICAgICAgICAgICAgICAgICAgPC9kaXY+PCEtLSBCbG9nIFdyYXBwZXIgLS0+CgoKICAgICAgICAgICAgICAgIDwvZGl2Pg==', '2017-12-13 10:46:15', NULL, 1);
INSERT INTO `pages` (`id`, `name`, `slug`, `details`, `created_at`, `created_by`, `status`) VALUES
(13, 'Articles', 'articles', 'PGRpdiBjbGFzcz0iY29sLXhzLTEyIG5ld3Mtc2luZ2xlIj4KICAgICAgICAgICAgICAgICAgICA8ZGl2IGNsYXNzPSJibG9nLXNpbmdsZS13cmFwIj4KCiAgICAgICAgICAgICAgICAgICAgICAgIDwhLS0gQmxvZyBEZXRhaWwgV3JhcHBlciAtLT4KICAgICAgICAgICAgICAgICAgICAgICAgPGRpdiBjbGFzcz0ibmV3cy1zaW5nbGUtZGV0YWlscyI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8aDQgY2xhc3M9InRpdGxlLXNpbXBsZSI+QXJ0aWNsZXM6PC9oND4KCiAgICAgICAgICAgICAgICAgICAgICAgICAgPHVsIGNsYXNzPSJnby13aWRnZXQiPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj4xLglFYnN0ZWluIFJNLiBBc3Nlc3NtZW50IGluIG1lZGljYWwgZWR1Y2F0aW9uLiBOIEVuZyBKIE1lZCAyMDA3OyAzNTY6IDM4Ny05NiA8L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iIyI+Mi4JTm9yY2luaUpKLCAgTWNLaW5sZXkgRFcuIEFzc2Vzc21lbnQgbWV0aG9kcyBpbiBtZWRpY2FsIGVkdWNhdGlvbi4gVGVhY2hpbmcgYW5kIFRlYWNoZXIgZWR1Y2F0aW9uIDIwMDc7IDIzOiAyMzktMjUwPC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPjMuCUhhcmRlbiBSTS4gSG93IHRvIGFzc2VzcyBzdHVkZW50IDogYW4gb3ZlcnZpZXcuIE1lZGljYWwgVGVhY2hlciAxOTc5OyAxOiA2NS03MDwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj40LglGb3dlbGwgU0wsIEJsaWdoIEpHLiBSZWNlbnQgZGV2ZWxvcG1lbnRzIGluIGFzc2Vzc2luZyBtZWRpY2FsIHN0dWRlbnRzLiBQb3N0Z3JhZCBNZWQgSiAxOTk4OyA3OTogMTgtMjQ8L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iIyI+NS4JV29vZCBULiBBc3Nlc3NtZW50IG5vdCBvbmx5IGRyaXZlcyBsZWFybmluZywgaXQgYWxzbyBoZWxwcyBsZWFybmluZy4gTWVkaWNhbCBFZHVjYXRpb24gMjAwOTsgNDM6IDUtNjwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj42LglIYXJkZW4gUk0uIEhvdyB0byBhc3Nlc3MgY2xpbmljYWwgY29tcGV0ZW5jZTogYW4gb3ZlcnZpZXcuIE1lZGljYWwgVGVhY2hlciAxOTc5OyAxKDYpOiAyODktOTY8L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iIyI+Ny4JSGFyZGVuIFJNLiBIb3cgdG8gYXNzZXNzIHN0dWRlbnRzOiBhbiBvdmVydmlldy4gTWVkaWNhbCBUZWFjaGVyIDE5Nzk7IDE6IDY1LTcwPC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPjguCUVyYXVudCBNQS4gV2lkZSBwZXJzcGVjdGl2ZSBvbiBhc3Nlc3NtZW50LiBNZWRpY2FsIEVkdWNhdGlvbiAyMDA0OyAzODogODAwLSA5MDQ8L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iIyI+OS4JU2NodXdpcnRoIExXVCwgVmFuIGRlciBCbGV1dGVuIENQTS4gV3JpdHRlbiBhc3Nlc3NtZW50LiBCTUogMjAwMzsgMzI2OiA2NDMtNDU8L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iIyI+MTAuCSBSYWRlbWFrZXJzIEosIENhdGUgVEgsIEJhciBQUi4gUHJvZ3Jlc3MgdGVzdGluZyB3aXRoIHNob3J0IGFuc3dlciBxdWVzdGlvbnMuIE1lZGljYWwgVGVhY2hlciAyMDA1OyAyNyg3KTogNTc4LTgyPC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPjExLgkgRmFybGV5IEpLLiBUaGUgbXVsdGlwbGUgY2hvaWNlIHRlc3Q6IFdyaXRpbmcgdGhlIHF1ZXN0aW9ucy4gTnVyc2UgRWR1YyAxOTg5OyAxNDogMTAtMTI8L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iIyI+MTIuCSBNYyBDb3VicmllIFAuIEltcHJvdmluZyB0aGUgZmFpcm5lc3Mgb2YgbXVsdGlwbGUgY2hvaWNlIHF1ZXN0aW9uczogQSBsaXRlcmF0dXJlIHJldmlldy4gTWVkaWNhbCBUZWFjaGVyIDIwMDQ7IDI2KDgpOiA3MDktMTI8L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iIyI+MTMuCSBNYyBDb3VicmllIFAsIE1jS25pZ2h0IEwuIFNpbmdsZSBiZXN0IGFuc3dlciBNQ1FzOiBhIG5ldyBmb3JtYXQgZm9yIHRoZSBGUkNSIHBhcnQgMmEgZXhhbS4gQ2xpbmljYWwgUmFkaW9sb2d5IDIwMDg7IDYzOiA1MDYtMTA8L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iIyI+MTQuCSBUd29ydCBDLCBtdWNrbG93IEouIEhvdyB0byB3cml0ZSBoaWdoIHF1YWxpdHkgcXVlc3Rpb25zIGZvciBhIGhpZ2ggc3Rha2VzIGV4YW1pbmF0aW9uLiBDbGluaWNhbCBNZWRpY2luZSAyMDExOyAxMSgzKTogMjI3LTMwPC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPjE1LgkgV2Fsc2ggSy4gQWR2aWNlIG9uIHdyaXRpbmcgbXVsdGlwbGUgY2hvaWNlIHF1ZXN0aW9ucy4gQk1KIENhcnJpZXJzIDIwMDU8L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iIyI+MTYuCSBNaWxsZXIgR0UuIFRoZSBhc3Nlc3NtZW50IG9mIGNsaW5pY2FsIHNraWxscy8gY29tcGV0ZW5jZS8gcGVyZm9ybWFuY2UuIEFjYWQgTWVkIDE5OTA6IDY1OiA1NjMtNzA8L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iIyI+MTcuCSBXYXNzIFYsIFZhbiBkZXIgQmxldXRlbiBDUE0sIFNoYXR6ZXIgSi4gQXNzZXNzbWVudCBvZiBjbGluaWNhbCBjb21wZXRlbmNlLiBMYW5jZXQgMjAwMTsgMzU3OiA5NDUtOTwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj4xOC4JIE5vcmNpbmlKSi4gQ3VycmVudCBwZXJzcGVjdGl2ZXMgaW4gYXNzZXNzbWVudDogdGhlIGFzc2Vzc21lbnQgb2YgcGVyZm9ybWFuY2UgYXQgd29yay4gTWVkaWNhbCBFZHVjYXRpb24gMjAwNTsgMzk6IDg4MC04OTwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj4xOS4JIEhhcmRlbiBSTSwgR2xlZXNvbiBGQS4gQXNzZXNzbWVudCBvZiBjbGluaWNhbCBjb21wZXRlbmNlIHVzaW5nIGFuIE9iamVjdGl2ZSBTdHJ1Y3R1cmVkIENsaW5pY2FsIEV4YW1pbmF0aW9uIChPU0NFKS4gTWVkaWNhbCBFZHVjYXRpb24gMTk3OTsgMTM6IDQxLTU0PC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPjIwLgkgU2VuYW5heWFrZSBNUC4gVGhlIE9TQ0UuIFNyaUxhbmthIEpvdXJuYWwgb2YgQ2hpbGQgSGVhbHRoIDIwMDE7IDMwOiAyNC0yNzwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj4yMS4JIEhvZGdlcyBCLiBWYWxpZGl0eSBhbmQgdGhlIE9TQ0UuIE1lZGljYWwgVGVhY2hlciAyMDAzOyAyNTogMjUwLTU0PC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPjIyLgkgTGVlIFlNLCBEdWNrLVN1biBBSE4uIFRoZSBPU0NFOiBBIG5ldyBjaGFsbGVuZ2UgdG8gdGhlIGV2YWx1YXRpb24gc3lzdGVtIGluIEtvcmVhLiBNZWRpY2FsIFRlYWNoZXIgMjAwNjsgMjgoNCk6IDM3Ny03OTwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj4yMy4JIFZhbiBkZXIgQmxldXRlbiBDUE0uIE1ha2luZyB0aGUgYmVzdCBvZiB0aGUg4oCcTG9uZyBDYXNl4oCdLiBMYW5jZXQgMTk5NjsgMzc0OiA3MDQtNTwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj4yNC4JIFdhc3MgViwgSm9sbHkgQi4gRG9lcyBvYnNlcnZhdGlvbiBhZGQgdmFsaWRpdHkgdG8gdGhlIGxvbmcgY2FzZT8gTWVkaWNhbCBFZHVjYXRpb24gMjAwMTsgMzU6IDcyOS0zNDwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj4yNS4JIE5vcmNpbmlKSi4gTWluaSBDbGluaWNhbCBFdmFsdWF0aW9uIEV4ZXJjaXNlIChtaW5pLSBDRVgpLiBUaGUgQ2xpbmljYWwgVGVhY2hlciAyMDA1OyAyOjI1LTMwPC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPjI2LgkgTm9yY2luaUpKLCBCbGFuayBMTCwgRHVmZnkgRkQuIFRoZSBtaW5pLSBDRVg6IEEgbWV0aG9kIGZvciBhc3Nlc3NpbmcgY2xpbmljYWwgc2tpbGxzLiBBbm5hbHMgb2YgSW50ZXJuYWwgTWVkaWNpbmUgMjAwMzsgMTM4KDYpOiA0NzYtODMgPC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPjI3LgkgS29nYW4gSiwgSG9sbWJvZSBFIEhhdWVyIEsuIFRvb2xzIGZvciBkaXJlY3Qgb2JzZXJ2YXRpb24gYW5kIGFzc2Vzc21lbnQgb2YgY2xpbmljYWwgc2tpbGxzIG9mIG1lZGljYWwgdHJhaW5lZXMuIEpBTUEgMjAwOTsgMzAyOiAxMzE2LTI2PC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPjI4LgkgV2ViYiBDLCBFbmRhY290dCBSLCBHcmF5IE0uIE1vZGVscyBvZiBQb3J0Zm9saW8uIE1lZGljYWwgRWR1Y2F0aW9uIDIwMDI7IDM2OiA4OTctOTg8L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iIyI+MjkuCSBGcmllZG1hbiBCLCBEYXZpZCBNLCBEYXZpcyBNSCwgSGFyZGVuIFJNLiBQb3J0Zm9saW8gYXMgYSBtZXRob2Qgb2Ygc3R1ZGVudCBhc3Nlc3NtZW50LiBNZWRpY2FsIFRlYWNoZXIgMjAwMTsgMjMoNik6IDUzNS01MTwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj4zMC4JIEZhbGNoaWtvdiBOLCBCb3VkIEQuIFN0dWRlbnQgc2VsZiBhc3Nlc3NtZW50IGluIGhpZ2hlciBlZHVjYXRpb246IGEgbWV0YSBhbmFseXNpcy4gUmV2aWV3IG9mIEVkdWNhdGlvbmFsIFJlc2VhcmNoIDE5ODk7IDk6IDM0NS00MzA8L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iIyI+MzEuCSBEYXZpcyBNSCwgSGFyZGVuIFJNLiBDb21wZXRlbmN5IGJhc2VkIGFzc2Vzc21lbnQ6IE1ha2luZyBpdCBhIHJlYWxpdHkuIE1lZGljYWwgVGVhY2hlciAyMDAzOyAyNSg2KTogNTY1LTU2ODwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgPC91bD4KCiAgICAgICAgICAgICAgICAgICAgICAgIDwvZGl2PjwhLS0gQmxvZyBEZXRhaWwgV3JhcHBlciAtLT4KICAgICAgICAgICAgICAgICAgICA8L2Rpdj48IS0tIEJsb2cgV3JhcHBlciAtLT4KCgogICAgICAgICAgICAgICAgPC9kaXY+', '2017-12-13 10:47:21', NULL, 1),
(14, 'Websites', 'websites', 'PGRpdiBjbGFzcz0iY29sLXhzLTEyIG5ld3Mtc2luZ2xlIj4KICAgICAgICAgICAgICAgICAgICA8ZGl2IGNsYXNzPSJibG9nLXNpbmdsZS13cmFwIj4KCiAgICAgICAgICAgICAgICAgICAgICAgIDwhLS0gQmxvZyBEZXRhaWwgV3JhcHBlciAtLT4KICAgICAgICAgICAgICAgICAgICAgICAgPGRpdiBjbGFzcz0ibmV3cy1zaW5nbGUtZGV0YWlscyI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8aDQgY2xhc3M9InRpdGxlLXNpbXBsZSI+V2Vic2l0ZTo8L2g0PgoKICAgICAgICAgICAgICAgICAgICAgICAgICA8dWwgY2xhc3M9ImdvLXdpZGdldCI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPjEuCUQuIEkuIE5ld2JsZS4gQXNzZXNzaW5nIENsaW5pY2FsIENvbXBldGVuY2UgYXQgdGhlIHVuZGVyZ3JhZHVhdGUgbGV2ZWwuIEFTTUUgTWVkaWNhbCBFZHVjYXRpb24gQm9va2xldCBOby4gMjUuIER1bmRlZSwgMTk5MjwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj4yLglLbm94IEpERS4gTW9kaWZpZWQgRXNzYXkgUXVlc3Rpb24uIEFTTUUgTWVkaWNhbCBFZHVjYXRpb24gQm9va2xldCBOby4gNS4gRHVuZGVlLCAxOTg2PC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPjMuCVN0b2tlcyBKRi4gVGhlIGNsaW5pY2FsIGV4YW1pbmF0aW9uLSBhc3Nlc3NtZW50IG9mIGNsaW5pY2FsIHNraWxscy4gQVNNRSBib29rbGV0IE5vLjQsIER1bmRlZSwgMTk3NDwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgPC91bD4KCiAgICAgICAgICAgICAgICAgICAgICAgIDwvZGl2PjwhLS0gQmxvZyBEZXRhaWwgV3JhcHBlciAtLT4KICAgICAgICAgICAgICAgICAgICA8L2Rpdj48IS0tIEJsb2cgV3JhcHBlciAtLT4KCgogICAgICAgICAgICAgICAgPC9kaXY+', '2017-12-13 10:49:18', NULL, 1),
(16, 'Faculty', 'faculty', 'PGRpdiBjbGFzcz0iY29sLXhzLTEyIG5ld3Mtc2luZ2xlIj4KICAgICAgICAgICAgICAgICAgICA8ZGl2IGNsYXNzPSJibG9nLXNpbmdsZS13cmFwIj4KCiAgICAgICAgICAgICAgICAgICAgICAgIDwhLS0gQmxvZyBEZXRhaWwgV3JhcHBlciAtLT4KICAgICAgICAgICAgICAgICAgICAgICAgPGRpdiBjbGFzcz0ibmV3cy1zaW5nbGUtZGV0YWlscyI+PHA+PGZvbnQgc3R5bGU9IiI+PGZvbnQgZmFjZT0iT3BlbiBTYW5zLCBzYW5zLXNlcmlmIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOiAxNnB4OyI+PGI+Q291cnNlIERpcmVjdG9yOiA8L2I+UHJvZiBIdW1heXVuIEthYmlyIENob3dkaHVyeTwvc3Bhbj48L2ZvbnQ+PC9mb250PjwvcD48cD48Zm9udCBzdHlsZT0iIj48Zm9udCBmYWNlPSJPcGVuIFNhbnMsIHNhbnMtc2VyaWYiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE2cHg7Ij48YnI+PC9zcGFuPjwvZm9udD48L2ZvbnQ+PC9wPjxwPjxmb250IHN0eWxlPSJmb250LWZhbWlseTogIiBvcGVuPSIiIHNhbnMiLD0iIiBzYW5zLXNlcmlmOz0iIiBmb250LXNpemU6PSIiIDE0cHg7Ij0iIj48YiBzdHlsZT0iZm9udC1zaXplOiAxMnB0OyI+Q291cnNlIEM8L2I+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTZweDsiPjxiPm9vcmRpbmF0b3I8L2I+PC9zcGFuPjxiIHN0eWxlPSJmb250LXNpemU6IDEycHQ7Ij46IDwvYj48L2ZvbnQ+PGZvbnQgc3R5bGU9ImZvbnQtZmFtaWx5OiAiIG9wZW49IiIgc2FucyIsPSIiIHNhbnMtc2VyaWY7PSIiIGZvbnQtc2l6ZTo9IiIgMTJwdDsiPSIiPlByb2YKVGFobWluYSBCZWd1bTwvZm9udD48L3A+PHA+PGZvbnQgc3R5bGU9ImZvbnQtZmFtaWx5OiAiIG9wZW49IiIgc2FucyIsPSIiIHNhbnMtc2VyaWY7PSIiIGZvbnQtc2l6ZTo9IiIgMTJwdDsiPSIiPjxicj48L2ZvbnQ+PC9wPjx1bCBjbGFzcz0iZ28td2lkZ2V0Ij48bGk+PHAgY2xhc3M9Indlc3Rlcm4iIHN0eWxlPSJtYXJnaW4tYm90dG9tOiAwLjE0aW47IGxpbmUtaGVpZ2h0OiAxMTUlIj48Zm9udCBzaXplPSIzIiBzdHlsZT0iZm9udC1zaXplOiAxMnB0Ij48Yj4xLgpNb2R1bGUmbmJzcDs8L2I+PC9mb250PjxiIHN0eWxlPSJmb250LXNpemU6IDEycHQ7Ij5DPC9iPjxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE2cHg7Ij48Yj5vb3JkaW5hdG9yOjwvYj48L3NwYW4+PC9wPjxwIGNsYXNzPSJ3ZXN0ZXJuIiBzdHlsZT0ibWFyZ2luLWJvdHRvbTogMC4xNGluOyBsaW5lLWhlaWdodDogMTE1JSI+CWEuCkNvbnRlbXBvcmFyeSBpc3N1ZXMgaW4gTWVkaWNhbCBFZHVjYXRpb24tLS0gUHJvZi4gRmVyZG91c3kgQmVndW0KRmxvcmEgJmFtcDsgUHJvZiBTaGFoIEFsYW08L3A+PHAgY2xhc3M9Indlc3Rlcm4iIHN0eWxlPSJtYXJnaW4tYm90dG9tOiAwLjE0aW47IGxpbmUtaGVpZ2h0OiAxMTUlIj4JYi4KVGVhY2hpbmctbGVhcm5pbmctLS0tUHJvZi4gQUJNIEphbWFsICZhbXA7IFByb2YuIEFiaWQgSG9zc2FpbiBNb2xsYWguPC9wPjxwIGNsYXNzPSJ3ZXN0ZXJuIiBzdHlsZT0ibWFyZ2luLWJvdHRvbTogMC4xNGluOyBsaW5lLWhlaWdodDogMTE1JSI+CWMuCiBJbnN0cnVjdGlvbmFsIG1hdGVyaWFsIGRlc2lnbi0tLSBQcm9mLiBNdW5hIFNhbGltYSBKYWhhbjwvcD48cCBjbGFzcz0id2VzdGVybiIgc3R5bGU9Im1hcmdpbi1ib3R0b206IDAuMTRpbjsgbGluZS1oZWlnaHQ6IDExNSUiPglkLgpBc3Nlc3NtZW50LS0tLSBQcm9mLiBUYWhtaW5hIEJlZ3VtPC9wPjxwIGNsYXNzPSJ3ZXN0ZXJuIiBzdHlsZT0ibWFyZ2luLWJvdHRvbTogMC4xNGluOyBsaW5lLWhlaWdodDogMTE1JSI+PGJyPjwvcD48cCBjbGFzcz0id2VzdGVybiIgc3R5bGU9Im1hcmdpbi1ib3R0b206IDAuMTRpbjsgbGluZS1oZWlnaHQ6IDExNSUiPgkKPC9wPjxwIGNsYXNzPSJ3ZXN0ZXJuIiBzdHlsZT0ibWFyZ2luLWJvdHRvbTogMC4xNGluOyBsaW5lLWhlaWdodDogMTE1JSI+PGZvbnQgc2l6ZT0iMyIgc3R5bGU9ImZvbnQtc2l6ZTogMTJwdCI+PGI+Mi4KRmFjdWx0aWVzOiA8L2I+PC9mb250Pgo8L3A+PHAgY2xhc3M9Indlc3Rlcm4iIHN0eWxlPSJtYXJnaW4tYm90dG9tOiAwLjE0aW47IGxpbmUtaGVpZ2h0OiAxMTUlIj4JYS4KPHNwYW4gc3R5bGU9ImJhY2tncm91bmQtaW1hZ2U6IGluaXRpYWw7IGJhY2tncm91bmQtcG9zaXRpb246IGluaXRpYWw7IGJhY2tncm91bmQtc2l6ZTogaW5pdGlhbDsgYmFja2dyb3VuZC1yZXBlYXQ6IGluaXRpYWw7IGJhY2tncm91bmQtYXR0YWNobWVudDogaW5pdGlhbDsgYmFja2dyb3VuZC1vcmlnaW46IGluaXRpYWw7IGJhY2tncm91bmQtY2xpcDogaW5pdGlhbDsiPlByb2YuCktob25ka2VyIE1hbnphcmUgU2hhbWltJm5ic3A7IChIb25vcmFyeSk8L3NwYW4+PC9wPjxwIGNsYXNzPSJ3ZXN0ZXJuIiBzdHlsZT0ibWFyZ2luLWJvdHRvbTogMC4xNGluOyBsaW5lLWhlaWdodDogMTE1JSI+CWIuClByb2YuIEFiZHVsIEhhbmlmIChUYWJsdSk8L3A+PHAgY2xhc3M9Indlc3Rlcm4iIHN0eWxlPSJtYXJnaW4tYm90dG9tOiAwLjE0aW47IGxpbmUtaGVpZ2h0OiAxMTUlIj4JPC9wPjxwIGNsYXNzPSJ3ZXN0ZXJuIiBzdHlsZT0ibWFyZ2luLWJvdHRvbTogMC4xNGluOyBsaW5lLWhlaWdodDogMTE1JSI+Yy4mbmJzcDsgRHIuIFNoYW1pbWEgUGFydmluPC9wPjxwIGNsYXNzPSJ3ZXN0ZXJuIiBzdHlsZT0ibWFyZ2luLWJvdHRvbTogMC4xNGluOyBsaW5lLWhlaWdodDogMTE1JSI+ZC4gRHIuIFJ1a3NoYW5hIEFobWVkPC9wPjxwIGNsYXNzPSJ3ZXN0ZXJuIiBzdHlsZT0ibWFyZ2luLWJvdHRvbTogMC4xNGluOyBsaW5lLWhlaWdodDogMTE1JSI+ZS4gRHIgQWJ1bCBLYWxhbSBNZCBTaGFtc3VkZGluPC9wPjxwIGNsYXNzPSJ3ZXN0ZXJuIiBzdHlsZT0ibWFyZ2luLWJvdHRvbTogMC4xNGluOyBsaW5lLWhlaWdodDogMTE1JSI+PGJyPjwvcD48cCBjbGFzcz0id2VzdGVybiIgc3R5bGU9Im1hcmdpbi1ib3R0b206IDAuMTRpbjsgbGluZS1oZWlnaHQ6IDExNSUiPgoJCgkKCTxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+CgkJQHBhZ2UgeyBtYXJnaW46IDAuNzlpbiB9CgkJcCB7IG1hcmdpbi1ib3R0b206IDAuMWluOyBkaXJlY3Rpb246IGx0cjsgbGluZS1oZWlnaHQ6IDEyMCU7IHRleHQtYWxpZ246IGxlZnQ7IG9ycGhhbnM6IDI7IHdpZG93czogMiB9CgkJcC5jdGwgeyBmb250LXNpemU6IDE0cHQ7IHNvLWxhbmd1YWdlOiBibi1CRCB9Cgk8L3N0eWxlPgoKCgoKCgoKCgoKCgoKCgoKCgoKPC9wPjxwIGNsYXNzPSJ3ZXN0ZXJuIiBzdHlsZT0ibWFyZ2luLWJvdHRvbTogMC4xNGluOyBsaW5lLWhlaWdodDogMTE1JSI+PGJyPjwvcD48cCBjbGFzcz0id2VzdGVybiIgc3R5bGU9Im1hcmdpbi1ib3R0b206IDAuMTRpbjsgbGluZS1oZWlnaHQ6IDExNSUiPkNWIG9mIGZhY3VsdGllczo8L3A+PHAgY2xhc3M9Indlc3Rlcm4iIHN0eWxlPSJtYXJnaW4tYm90dG9tOiAwLjE0aW47IGxpbmUtaGVpZ2h0OiAxMTUlIj48c3BhbiBzdHlsZT0iY29sb3I6IHJnYigzNCwgMzQsIDM0KTsgZm9udC1mYW1pbHk6IGFyaWFsLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEyLjhweDsiPk5hbWU6IFRhaG1pbmEgQmVndW08L3NwYW4+PC9wPjxkaXYgZGlyPSJhdXRvIiBzdHlsZT0iY29sb3I6IHJnYigzNCwgMzQsIDM0KTsgZm9udC1mYW1pbHk6IGFyaWFsLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEyLjhweDsiPkRlc2lnbmF0aW9uIDogUHJvZmVzc29yICggZm9ybWVyIGhlYWQsIGRlcGFydG1lbnQgb2YgUGFlZGlhdHJpY3MsIEJJUkRFTSk8L2Rpdj48ZGl2IGRpcj0iYXV0byIgc3R5bGU9ImNvbG9yOiByZ2IoMzQsIDM0LCAzNCk7IGZvbnQtZmFtaWx5OiBhcmlhbCwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMi44cHg7Ij5BY2FkZW1pYyBxdWFsaWZpY2F0aW9uczo8L2Rpdj48ZGl2IGRpcj0iYXV0byIgc3R5bGU9ImNvbG9yOiByZ2IoMzQsIDM0LCAzNCk7IGZvbnQtZmFtaWx5OiBhcmlhbCwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMi44cHg7Ij4xLiBNQkJTIChIb25zKSBmcm9tIE15bWVuc2luZyBNZWRpY2FsIENvbGxlZ2UgaW4gMTk4Mi48L2Rpdj48ZGl2IGRpcj0iYXV0byIgc3R5bGU9ImNvbG9yOiByZ2IoMzQsIDM0LCAzNCk7IGZvbnQtZmFtaWx5OiBhcmlhbCwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMi44cHg7Ij4yLiBGQ1BTIGluIDE5OTAuPC9kaXY+PGRpdiBkaXI9ImF1dG8iIHN0eWxlPSJjb2xvcjogcmdiKDM0LCAzNCwgMzQpOyBmb250LWZhbWlseTogYXJpYWwsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTIuOHB4OyI+My4gTUQgZnJvbSBVbml2ZXJzaXR5IG9mIERoYWthIGluIDE5OTQ8L2Rpdj48ZGl2IGRpcj0iYXV0byIgc3R5bGU9ImNvbG9yOiByZ2IoMzQsIDM0LCAzNCk7IGZvbnQtZmFtaWx5OiBhcmlhbCwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMi44cHg7Ij40LiBEaXBsb21hIGluIE1lZGljYWwgRWR1Y2F0aW9uIGZyb20gVW5pdmVyc2l0eSBvZiBEdW5kZWUsIFVLIGluIDE5OTYuPC9kaXY+PGRpdiBkaXI9ImF1dG8iIHN0eWxlPSJjb2xvcjogcmdiKDM0LCAzNCwgMzQpOyBmb250LWZhbWlseTogYXJpYWwsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTIuOHB4OyI+NS4gTWFzdGVycyBpbiBNZWRpY2FsIEVkdWNhdGlvbiBmcm9tIFVuaXZlcnNpdHkgb2YgRHVuZGVlIGluIDE5OTkuPC9kaXY+PGRpdiBkaXI9ImF1dG8iIHN0eWxlPSJjb2xvcjogcmdiKDM0LCAzNCwgMzQpOyBmb250LWZhbWlseTogYXJpYWwsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTIuOHB4OyI+VGVhY2hpbmcgZXhwZXJpZW5jZSA6IDI3IHllYXJzIGluIE15bWVuc2luZyBNZWRpY2FsIGNvbGxlZ2UsIEJJUkRFTSBhbmQgQ2VudGVyIGZvciBNZWRpY2FsIEVkdWNhdGlvbiwgRGhha2EuPC9kaXY+PGRpdiBkaXI9ImF1dG8iIHN0eWxlPSJjb2xvcjogcmdiKDM0LCAzNCwgMzQpOyBmb250LWZhbWlseTogYXJpYWwsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTIuOHB4OyI+T3RoZXIgZXhwZXJpZW5jZTombmJzcDs8L2Rpdj48ZGl2IGRpcj0iYXV0byIgc3R5bGU9ImNvbG9yOiByZ2IoMzQsIDM0LCAzNCk7IGZvbnQtZmFtaWx5OiBhcmlhbCwgc2Fucy1zZXJpZjsgZm9udC1zaXplOiAxMi44cHg7Ij4xLiBJbnZvbHZlZCBpbiBtZWRpY2FsIGVkdWNhdGlvbiBpbiBCYW5nbGFkZXNoIHNpbmNlIDE5OTYuPC9kaXY+PGRpdiBkaXI9ImF1dG8iIHN0eWxlPSJjb2xvcjogcmdiKDM0LCAzNCwgMzQpOyBmb250LWZhbWlseTogYXJpYWwsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTIuOHB4OyI+Mi4gQXJyYW5nZWQgYW5kIHBhcnRpY2lwYXRlZGQgaW4gd29ya3Nob3BzIGFzIHJlc291cmNlIHBlcnNvbiBpbiB2YXJpb3VzIGFzcGVjdHMgb2YgbWVkaWNhbCBlZHVjYXRpb24gaW4gQkNQUywgQlNNTVUsIEJJUkRFTSBhbmQgb3RoZXIgbWVkaWNhbCBpbnN0aXR1dGlvbnMuPC9kaXY+PGRpdiBkaXI9ImF1dG8iIHN0eWxlPSJjb2xvcjogcmdiKDM0LCAzNCwgMzQpOyBmb250LWZhbWlseTogYXJpYWwsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTIuOHB4OyI+My4gUGFydGljaXBhdGVkZCBpbiBtYW55IG5hdGlvbmFsIGFuZCBpbnRlcm5hdGlvbmFsIGNvbmZlcmVuY2Ugb24gbWVkaWNhbCBlZHVjYXRpb24uJm5ic3A7PC9kaXY+PGRpdiBkaXI9ImF1dG8iIHN0eWxlPSJjb2xvcjogcmdiKDM0LCAzNCwgMzQpOyBmb250LWZhbWlseTogYXJpYWwsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTIuOHB4OyI+NC4gSW52b2x2ZWQgaW4gY3VycmljdWx1bSBkZXZlbG9wbWVudCBhbmQgcmV2aXNpb24gb2YgY3VycmljdWx1bSBpbiBCYW5nbGFkZXNoLjwvZGl2PjxkaXYgZGlyPSJhdXRvIiBzdHlsZT0iY29sb3I6IHJnYigzNCwgMzQsIDM0KTsgZm9udC1mYW1pbHk6IGFyaWFsLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEyLjhweDsiPjUuIEF1dGhvcmVkIGEgYm9vayBvbiBtZWRpY2FsIGVkdWNhdGlvbiAiQ29uY2VwdHMgb2YgTWVkaWNhbCBFZHVjYXRpb24iIGZvciBtZWRpY2FsIHRlYWNoZXJzLjwvZGl2PjxkaXYgZGlyPSJhdXRvIiBzdHlsZT0iY29sb3I6IHJnYigzNCwgMzQsIDM0KTsgZm9udC1mYW1pbHk6IGFyaWFsLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEyLjhweDsiPjYuIFB1Ymxpc2hlZCBtb3JlIHRoYW4gNTAgc2NpZW50aWZpYyBhcnRpY2xlcyBpbiBuYXRpb25hbCBhbmQgaW50ZXJuYXRpb25hbCBqb3VybmFscy48L2Rpdj48cCBjbGFzcz0id2VzdGVybiIgc3R5bGU9Im1hcmdpbi1ib3R0b206IDAuMTRpbjsgbGluZS1oZWlnaHQ6IDExNSUiPjxicj48L3A+PC9saT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwvdWw+CgogICAgICAgICAgICAgICAgICAgICAgICA8L2Rpdj48IS0tIEJsb2cgRGV0YWlsIFdyYXBwZXIgLS0+CiAgICAgICAgICAgICAgICAgICAgPC9kaXY+PCEtLSBCbG9nIFdyYXBwZXIgLS0+CgoKICAgICAgICAgICAgICAgIDwvZGl2PjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+CgkJQHBhZ2UgeyBtYXJnaW46IDAuNzlpbiB9CgkJcCB7IG1hcmdpbi1ib3R0b206IDAuMWluOyBkaXJlY3Rpb246IGx0cjsgbGluZS1oZWlnaHQ6IDEyMCU7IHRleHQtYWxpZ246IGxlZnQ7IG9ycGhhbnM6IDI7IHdpZG93czogMiB9CgkJcC5jdGwgeyBmb250LXNpemU6IDE0cHQ7IHNvLWxhbmd1YWdlOiBibi1CRCB9Cgk8L3N0eWxlPg==', '2017-12-13 12:47:28', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sif_admission`
--

CREATE TABLE IF NOT EXISTS `sif_admission` (
  `id` int(10) NOT NULL,
  `master_id` int(11) NOT NULL,
  `reg_no` int(11) NOT NULL,
  `reg_type` varchar(30) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `password` varchar(9) NOT NULL,
  `assigned_teacher_id` varchar(50) DEFAULT NULL,
  `institute` int(1) DEFAULT NULL,
  `year` varchar(30) NOT NULL,
  `course_code` int(3) NOT NULL,
  `module` int(5) DEFAULT NULL,
  `batch_code` int(4) DEFAULT NULL,
  `subject` int(2) NOT NULL,
  `service_pack_id` varchar(30) DEFAULT NULL,
  `admi_type` varchar(2) DEFAULT NULL,
  `session` int(2) NOT NULL,
  `medical_col` varchar(80) DEFAULT NULL,
  `collage_type` varchar(10) DEFAULT NULL,
  `doc_name` varchar(50) NOT NULL,
  `blood_gro` varchar(10) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `marital_status` varchar(255) DEFAULT NULL,
  `father_name` varchar(50) NOT NULL,
  `mother_name` varchar(50) NOT NULL,
  `religion` varchar(255) DEFAULT NULL,
  `nationality` varchar(255) DEFAULT NULL,
  `n_id` varchar(20) DEFAULT NULL,
  `passport` varchar(90) NOT NULL,
  `job_des` varchar(255) DEFAULT NULL,
  `mail_address` varchar(255) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `fb_id` varchar(255) DEFAULT NULL,
  `skype` varchar(255) DEFAULT NULL,
  `viber` varchar(255) DEFAULT NULL,
  `bmdc_no` varchar(55) DEFAULT NULL,
  `ins_roll_no` varchar(30) DEFAULT NULL,
  `spouse_name` varchar(50) DEFAULT NULL,
  `spouse_mobile` varchar(15) DEFAULT NULL,
  `answer_type` int(2) DEFAULT NULL,
  `rcp_reg_no` varchar(80) DEFAULT NULL,
  `per_divi` varchar(20) DEFAULT NULL,
  `per_dist` varchar(20) DEFAULT NULL,
  `per_thana` varchar(20) DEFAULT NULL,
  `per_address` varchar(255) DEFAULT NULL,
  `mai_divi` varchar(20) DEFAULT NULL,
  `mai_dist` varchar(20) DEFAULT NULL,
  `mai_thana` varchar(20) DEFAULT NULL,
  `mai_address` varchar(255) DEFAULT NULL,
  `fee_amount` varchar(20) DEFAULT NULL,
  `discount_amont` varchar(20) DEFAULT NULL,
  `dis_auth_by` varchar(45) DEFAULT NULL,
  `final_amount` varchar(20) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `sign` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(50) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `status` int(2) NOT NULL DEFAULT '1',
  `pay_status` int(1) NOT NULL DEFAULT '0',
  `pt_call` varchar(255) DEFAULT NULL,
  `pw_payment` varchar(255) DEFAULT NULL,
  `pw_communitcation` varchar(255) DEFAULT NULL,
  `present_work_place` varchar(255) DEFAULT NULL,
  `job_description` varchar(255) DEFAULT NULL,
  `doc_mbbs` varchar(255) DEFAULT NULL,
  `doc_pg` varchar(255) DEFAULT NULL,
  `doc_phi` varchar(255) DEFAULT NULL,
  `doc_nid` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sif_admission`
--

INSERT INTO `sif_admission` (`id`, `master_id`, `reg_no`, `reg_type`, `user_name`, `password`, `assigned_teacher_id`, `institute`, `year`, `course_code`, `module`, `batch_code`, `subject`, `service_pack_id`, `admi_type`, `session`, `medical_col`, `collage_type`, `doc_name`, `blood_gro`, `gender`, `marital_status`, `father_name`, `mother_name`, `religion`, `nationality`, `n_id`, `passport`, `job_des`, `mail_address`, `phone`, `email`, `dob`, `fb_id`, `skype`, `viber`, `bmdc_no`, `ins_roll_no`, `spouse_name`, `spouse_mobile`, `answer_type`, `rcp_reg_no`, `per_divi`, `per_dist`, `per_thana`, `per_address`, `mai_divi`, `mai_dist`, `mai_thana`, `mai_address`, `fee_amount`, `discount_amont`, `dis_auth_by`, `final_amount`, `photo`, `sign`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`, `pay_status`, `pt_call`, `pw_payment`, `pw_communitcation`, `present_work_place`, `job_description`, `doc_mbbs`, `doc_pg`, `doc_phi`, `doc_nid`) VALUES
(19, 10, 181011, 'CMED', 'drwasey@gmail.com', '0C8VPV', NULL, NULL, '2018', 1, 1, NULL, 0, NULL, NULL, 1, NULL, NULL, 'A.E.MD ABDUL WASEY', 'B+', 'Male', 'Married', 'MD. ABDUL WAHAB', 'AZIZUNNESSA KHATUN', 'Muslim', 'BANGLADESHI', '9196207182179', 'BA 0218180', NULL, NULL, '01711887173', 'drwasey@gmail.com', '1957-01-03', 'Md Abdul Wasey', 'Aema Wasey', '+8801711887173', 'A10767', NULL, 'NASIMA BEGUM', '01713006476', NULL, NULL, '06', '0690', '069018', 'VILLAGE:MUKTIKHOLA', '04', '0447', '044785', 'GAZI MEDICAL COLLEGE, 19-21,MAJID SARANI,SONADANGA,KHULNA-9100', NULL, NULL, NULL, NULL, 'upload/documents/181011/photo_181011.jpg', 'upload/documents/181011/sign_181011.jpg', '2018-01-07 12:29:52', NULL, '2018-01-02 20:42:22', 'admin@bigm-bd.com', 1, 0, '', 'ONLINE/bkash', '0', 'GAZI MEDICAL COLLEGE,KHULNA', 'PROF & HEAD OF SURGERY', 'upload/documents/181011/mbbs_181011.pdf', 'upload/documents/181011/pg_181011.pdf', NULL, 'upload/documents/181011/nid_181011.pdf'),
(21, 12, 181013, 'CMED', 'drmarufraza@gmail.com', 'BMTXKM', NULL, NULL, '2018', 1, 1, NULL, 0, NULL, NULL, 1, NULL, NULL, 'Abu Khalid Muhammad Maruf Raza', 'AB+', 'Male', 'Married', 'Md. Muzibur Rahman Sarkar', 'Khaleda Begum', 'Muslim', 'Bangladeshi', '2696402538265', 'OC 5032927', NULL, NULL, '01711306123', 'drmarufraza@gmail.com', '1981-02-14', 'maruf raza', '', '', 'A 40911', NULL, 'Abu Khalid Muhammad Maruf Raza', '01711306123', NULL, NULL, '03', '0326', '032664', 'House: 152/15, Road: 9/2, Block: B, Scetion-12, Pallabi, Mirpur, Dhaka.', '03', '0326', '032664', 'House: 152/15, Road: 9/2, Block: B, Scetion-12, Pallabi, Mirpur, Dhaka.', NULL, NULL, NULL, NULL, 'upload/documents/181013/photo_181013.jpg', 'upload/documents/181013/sign_181013.jpg', '2018-01-07 12:29:52', NULL, '2018-01-02 20:41:45', 'admin@bigm-bd.com', 1, 0, '09:00', 'Cash', '0', 'Jahurul Islam  Medical College, Kishoregonj,Bangladesh', 'Assistant Professor of Pathology', 'upload/documents/181013/mbbs_181013.jpg', 'upload/documents/181013/pg_181013.jpg', NULL, 'upload/documents/181013/nid_181013.jpg'),
(22, 13, 181014, 'CMED', 'njahan.bird@gmail.com', '0FYDUR', NULL, NULL, '2018', 1, 1, NULL, 0, NULL, NULL, 1, NULL, NULL, 'Nasim Jahan', 'B+', 'Female', 'Married', 'Abul Quasem', 'Shahida Parven', 'Muslim', 'Bangladeshi', '2696653250865', 'BC 0094477', NULL, NULL, '01819476076', 'njahan.bird@gmail.com', '1976-07-13', 'Nasim Jahan', '', '01819476076', 'A 31095', NULL, '', '01777681208', NULL, NULL, '03', '0326', '032666', 'Flat A-9, Dom Inno Sorrel, 131/1, New Eskaton Road', '03', '0326', '032666', 'Flat A-9, Dom Inno Sorrel, 131/1, New Eskaton Road', NULL, NULL, NULL, NULL, 'upload/documents/181014/photo_181014.JPG', 'upload/documents/181014/sign_181014.PNG', '2018-01-07 12:29:52', NULL, '2018-01-02 20:41:34', 'admin@bigm-bd.com', 1, 0, '', 'cash', '0', 'BIRDEM General Hospital', 'Assistant Professor, Department of Psychiatry', 'upload/documents/181014/mbbs_181014.jpg', 'upload/documents/181014/pg_181014.jpg', NULL, 'upload/documents/181014/nid_181014.jpg'),
(23, 14, 181015, 'CMED', 'dririn.alam@yahoo.com', '6MD4RU', NULL, NULL, '2018', 1, 1, NULL, 0, NULL, NULL, 1, NULL, NULL, 'Irin Parveen Alam', 'B+', 'Female', 'Married', 'Mohd. Shafiqul Alam', 'Momotaz Begam', 'Muslim', 'Bangladeshi', '2694263701097', ' OC 7103492', NULL, NULL, '01715348398', 'dririn.alam@yahoo.com', '1968-10-29', 'Irin Parveen Alam', '', '01715348398', '23944', NULL, 'Dr. Irin Parveen Alam', '01715348398', NULL, NULL, '02', '0215', '021578', 'Moulovi Asadul haque,s Bari, vill- Bauria, PO-Dozanagar, ', '03', '0326', '032642', 'Krishnochura, 6/4/A, Sheikh Shaheb Bazar, Azimpur Dhaka.', NULL, NULL, NULL, NULL, 'upload/documents/181015/photo_181015.jpg', 'upload/documents/181015/sign_181015.JPG', '2018-01-07 12:29:52', NULL, '2018-01-02 20:41:20', 'admin@bigm-bd.com', 1, 0, 'after 9.30PM, 3-6PM', 'cash counter', '0', 'Sir Salimullah Medical College', 'Associate Prof. OBGYN', 'upload/documents/181015/mbbs_181015.JPG', 'upload/documents/181015/pg_181015.jpg', NULL, 'upload/documents/181015/nid_181015.JPG'),
(24, 15, 181016, 'CMED', 'ezhar65@gmail.com', 'H5CYKU', NULL, NULL, '2018', 1, 1, NULL, 0, NULL, NULL, 1, NULL, NULL, 'MD. EZHARUL HAQUE', 'A+', 'Male', 'Married', 'MD. ABDUL QUDDUS MIAHYAN', 'RAHIMA BEGUM', 'Muslim', '', '2694813883010', '', NULL, NULL, '01711172547', 'ezhar65@gmail.com', '1965-08-30', '', '', '', 'A-19159', NULL, '', '', NULL, NULL, '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, 'upload/documents/181016/photo_181016.jpg', 'upload/documents/181016/sign_181016.png', '2018-01-07 12:29:52', NULL, '2018-01-02 20:41:08', 'admin@bigm-bd.com', 1, 0, '', '', '0', '', '', 'upload/documents/181016/mbbs_181016.pdf', 'upload/documents/181016/pg_181016.pdf', NULL, 'upload/documents/181016/nid_181016.jpg'),
(25, 16, 181017, 'CMED', 'dr.towhid29@gmail.com', 'GD2GOB', NULL, NULL, '2018', 1, 1, NULL, 0, NULL, NULL, 1, NULL, NULL, 'Dr.Md.Towhidur Rahman', 'B+', 'Male', 'Married', 'Md. Abdul Gafur', 'Rowshan Ara Begum', 'Muslim', 'Bangladeshi', '3323019462580', '', NULL, NULL, '01819458385', 'dr.towhid29@gmail.com', '1982-05-19', 'Towhid Rahman', '', '', 'A46162', NULL, 'Dr. Md. Towhidur Rahman', '01819458385', NULL, NULL, '03', '0333', '033387', '', '03', '0326', '032663', '129, Elephant Road, Flat-E/3', NULL, NULL, NULL, NULL, 'upload/documents/181017/photo_181017.jpg', 'upload/documents/181017/sign_181017.jpg', '2018-01-07 12:29:52', NULL, '2018-01-02 20:40:58', 'admin@bigm-bd.com', 1, 0, '', '', '0', 'BIRDEM', 'Assistant Professor, Dept. of Radiology & Imaging', 'upload/documents/181017/mbbs_181017.jpg', 'upload/documents/181017/pg_181017.jpg', NULL, 'upload/documents/181017/nid_181017.jpg'),
(27, 17, 181019, 'CMED', 'tun-na@hotmail.com', 'SGAMZT', NULL, NULL, '2018', 1, 1, NULL, 0, NULL, NULL, 1, NULL, NULL, 'Sabikun Naher', 'B+', 'Female', 'Married', 'Md. Emdadul Haque Bhuiya', 'Farida Yasmin', 'Muslim', 'Bangladeshi', '19875550005309', '', NULL, NULL, '01917267809', 'tun-na@hotmail.com', '1987-11-12', '', '', '', 'A60661', NULL, 'Dr.Tanvir ahmed', '01711464449', NULL, NULL, '03', '0326', '032664', '6/c; 16/3; pallabi mirpur dhaka', '03', '0326', '032650', '3A/1, salimulllah road mohammadpur dhaka', NULL, NULL, NULL, NULL, 'upload/documents/181019/photo_181019.PNG', 'upload/documents/181019/sign_181019.jpg', '2018-01-07 12:29:52', NULL, '2018-01-02 20:40:46', 'admin@bigm-bd.com', 1, 0, '20:00', 'cash', '0', 'Basundhara ad-din Medical college', 'Asst. professor, Department of Biochemistry', 'upload/documents/181019/mbbs_181019.jpg', 'upload/documents/181019/pg_181019.jpg', NULL, 'upload/documents/181019/nid_181019.jpg'),
(28, 18, 181020, 'CMED', 'taslima.rafique@gmail.com', '5KZUMQ', NULL, NULL, '2018', 1, 1, NULL, 0, NULL, NULL, 1, NULL, NULL, 'DR. TASLIMA RAFIQUE', 'O+', 'Female', 'Married', 'MD. RAFIQUL QUADER', 'MAHMUDA ANOM', 'Muslim', 'BANGLADESHI', '19782692619469554', 'BL0211223', NULL, NULL, '01713367653', 'taslima.rafique@gmail.com', '1978-02-12', '', '', '', 'A-38696', NULL, 'DR. TASLIMA RAFIQUE', '01713367653', NULL, NULL, '03', '0326', '032626', 'FLAT # C-5, HOUSE # 23, ROAD # 23, BLOCK # B, BANANI-1213', '03', '0326', '032626', 'FLAT # C-5, HOUSE # 23, ROAD # 23, BLOCK # B, BANANI-1213', NULL, NULL, NULL, NULL, 'upload/documents/181020/photo_181020.jpg', 'upload/documents/181020/sign_181020.jpg', '2018-01-07 12:29:52', NULL, '2018-01-02 20:40:35', 'admin@bigm-bd.com', 1, 0, '10:30 am', 'CASH', '0', 'SAPPORO DENTAL COLLEGE & HOSPITAL, UTTARA, DHAKA', 'ASSOCIATE PROFESSOR  (CC) OF BIOCHEMISTRY', 'upload/documents/181020/mbbs_181020.jpg', 'upload/documents/181020/pg_181020.jpg', NULL, 'upload/documents/181020/nid_181020.jpg'),
(29, 19, 181021, 'CMED', 'm_mhoque@yahoo.com', 'SERTSQ', NULL, NULL, '2018', 1, 1, NULL, 0, NULL, NULL, 1, NULL, NULL, 'MD. MOZAMMEL HOQUE', 'B+', 'Male', 'Married', 'MD. ANWAR ALI', 'CHANDAN ARA BEGUM', 'Muslim', 'BANGLADESHI', '6815254310575', 'BN 0153158', NULL, NULL, '01711822852', 'm_mhoque@yahoo.com', '1959-11-25', '', '', '', 'A- 21421', NULL, 'MD. MOZAMMEL HOQUE', '01711822852', NULL, NULL, '03', '0368', '036852', 'NOADIA', '03', '0326', '032675', 'DEPARTMENT OF BIOCHEMISTRY AND MOLECULAR BIOLOGY, BSMMU.', NULL, NULL, NULL, NULL, 'upload/documents/181021/photo_181021.jpg', 'upload/documents/181021/sign_181021.jpg', '2018-01-07 12:29:52', NULL, '2018-01-02 20:40:24', 'admin@bigm-bd.com', 1, 0, '', 'CASH', '0', 'BANGABANDHU SHEIKH MUJIB MEDICAL UNIVERSITY', 'PROFESSOR CUM CHAIRMAN', 'upload/documents/181021/mbbs_181021.pdf', 'upload/documents/181021/pg_181021.pdf', NULL, 'upload/documents/181021/nid_181021.pdf'),
(30, 20, 181022, 'CMED', 'dr.masum@yahoo.com', 'NTDABC', NULL, NULL, '2018', 1, 1, NULL, 0, NULL, NULL, 1, NULL, NULL, 'MOHAMMAD MASUM ALAM', 'O+', 'Male', 'Single', 'MD. MOFAZZAL HOQUE MRIDHA', 'BEGUM MONJURA HOQUE', 'Muslim', 'BANGLADESHI ', '2693625695654', 'BN 0889272', NULL, NULL, '01914255488', 'dr.masum@yahoo.com', '1982-01-01', '', '', '', 'A - 42744', NULL, 'DR. RAWAZ JAHAN NIMA', '01914255487', NULL, NULL, '03', '0326', '032636', '373/14 EAST GORAN , DHAKA 1219.', '03', '0326', '032636', '373/14 EAST GORAN , DHAKA 1219.', NULL, NULL, NULL, NULL, 'upload/documents/181022/photo_181022.JPG', 'upload/documents/181022/sign_181022.jpg', '2018-01-07 12:29:52', NULL, '2018-01-02 20:40:12', 'admin@bigm-bd.com', 1, 0, '', 'CASH', '0', 'BANGABANDHU SHEIKH MUJIB MEDICAL UNIVERSITY', 'RESEARCH ASSISTANT', 'upload/documents/181022/mbbs_181022.jpg', 'upload/documents/181022/pg_181022.jpg', NULL, 'upload/documents/181022/nid_181022.pdf'),
(31, 21, 181001, 'CMED', 'shaheenssr7@yahoo.com', 'DXHLHC', NULL, NULL, '2018', 1, 1, NULL, 0, NULL, NULL, 1, NULL, NULL, 'shaheen akter', 'B+', 'Female', 'Married', 'akm fazlul haque', 'sharifa begum', 'Muslim', '', '19712693016085389', '', NULL, NULL, '01711901456', 'shaheenssr7@yahoo.com', '1971-09-01', '', '', '', 'A26534', NULL, '', '', NULL, NULL, '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, 'upload/documents/171001/photo_171001.JPG', 'upload/documents/171001/sign_171001.JPG', '2018-01-07 12:29:52', NULL, '2018-01-02 20:39:57', 'admin@bigm-bd.com', 1, 0, '', '', '0', '', '', 'upload/documents/171001/mbbs_171001.pdf', 'upload/documents/171001/pg_171001.pdf', NULL, 'upload/documents/171001/nid_171001.pdf'),
(32, 22, 181023, 'CMED', 'debnathpurabi@yahoo.com', 'UHPJXU', NULL, NULL, '2018', 1, 1, NULL, 0, NULL, NULL, 1, NULL, NULL, 'Dr. Purabi Rani Debnath', 'B+', 'Female', 'Married', 'Naresh Chandra Debnath', 'Basanti Debnath', 'Hindus', 'Bangladeshi', '2694262671543', '', NULL, NULL, '01711175303', 'debnathpurabi@yahoo.com', '1969-01-13', 'debnathpurabi@yahoo.com', '', '', 'A25401', NULL, '', '', NULL, NULL, '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, 'upload/documents/181023/photo_181023.jpg', 'upload/documents/181023/sign_181023.jpg', '2018-01-07 12:29:52', NULL, '2018-01-02 20:39:46', 'admin@bigm-bd.com', 1, 0, '', '', '0', '', '', 'upload/documents/181023/mbbs_181023.pdf', 'upload/documents/181023/pg_181023.pdf', NULL, 'upload/documents/181023/nid_181023.pdf'),
(33, 23, 181024, 'CMED', 'delwarhschest@yahoo.com', '31DTC7', NULL, NULL, '2018', 1, 1, NULL, 0, NULL, NULL, 1, NULL, NULL, 'Dr. Mohammad Delwar Hossain', 'O+', 'Male', 'Married', 'Md Ismail', 'Nur Jahan Begum', 'Muslim', 'Bangladeshi', '1459032049', '', NULL, NULL, '01819218238', 'delwarhschest@yahoo.com', '1964-04-12', '', '', '', '20882', NULL, 'Dr Samira Rahat Afroze', '01552458392', NULL, NULL, '03', '0326', '032663', 'SDK Tower, 210 Elephant Road', '03', '0326', '032666', 'Room no 1534, 14th floor, BIRDEM General Hospital, Kazi Nazrul Islam Avenue, Dhaka 1000.', NULL, NULL, NULL, NULL, 'upload/documents/181024/photo_181024.jpg', NULL, '2018-01-07 12:29:52', NULL, '2018-01-02 20:39:34', 'admin@bigm-bd.com', 1, 0, '', 'Cash', '0', 'Internal Medicine Dept. IMC & BIRDEM General Hospital', 'Associate Professor, Internal Medicine Dept., IMC & BIRDEM General Hospital', 'upload/documents/181024/mbbs_181024.docx', 'upload/documents/181024/pg_181024.docx', NULL, 'upload/documents/181024/nid_181024.docx'),
(34, 24, 181025, 'CMED', 'maqsoodfarzana2@gmail.com', 'SBYM0A', NULL, NULL, '2018', 1, 1, NULL, 0, NULL, NULL, 1, NULL, NULL, 'FARZANA MAQSOOD', 'A+', 'Female', 'Married', 'MAQSOOD ALI', 'PARVEN CHOWDHURY', 'Muslim', 'BANGLADESHI', '1921240204', '', NULL, NULL, '01630472757', 'maqsoodfarzana2@gmail.com', '1980-10-26', '', '', '', 'A45985', NULL, 'MAQSOOD ALI', '01775038007', NULL, NULL, '03', '0326', '032663', '405, FREE SHCOOL STREET, HATIRPUL', '03', '0326', '032663', '405, FREE SHCOOL STREET, HATIRPUL', NULL, NULL, NULL, NULL, 'upload/documents/181025/photo_181025.jpg', 'upload/documents/181025/sign_181025.jpg', '2018-01-07 12:29:52', NULL, '2018-01-02 20:39:22', 'admin@bigm-bd.com', 1, 0, '', '', '0', 'BANGLADESH MEDICAL COLLEGE, DHAKA', 'LECTURER, DEPT. OF ANATOMY', 'upload/documents/181025/mbbs_181025.jpg', 'upload/documents/181025/pg_181025.jpg', NULL, 'upload/documents/181025/nid_181025.jpg'),
(35, 25, 181026, 'CMED', 'muradrahim23@yahoo.com', 'FVBCVM', NULL, NULL, '2018', 1, 1, NULL, 0, NULL, NULL, 1, NULL, NULL, 'Muhammad Abdur Rahim', 'O+', 'Male', 'Married', 'Muhammad Abdur Rouf', 'Relina Rouf', 'Muslim', 'Bangladeshi', '9317636078507', 'BL 0256968', NULL, NULL, '01674534500', 'muradrahim23@yahoo.com', '1976-09-16', '', '', '', 'A 33318', NULL, 'Shahana Zaman', '01716630453', NULL, NULL, '03', '0393', '039376', 'Village - Dhubaria, PS - Dhubaria', '03', '0326', '032626', 'Flat - B4, House - 74B, Road - 127, Gulshan, Dhaka-1212', NULL, NULL, NULL, NULL, 'upload/documents/181026/photo_181026.jpg', NULL, '2018-01-07 12:29:52', NULL, '2018-01-02 20:39:01', 'admin@bigm-bd.com', 1, 0, '', 'cheque/cash', '0', 'BIRDEM General Hospital', 'Assistant Professor, Nephrology', 'upload/documents/181026/mbbs_181026.jpg', 'upload/documents/181026/pg_181026.jpg', NULL, 'upload/documents/181026/nid_181026.jpg'),
(36, 26, 181027, 'CMED', 'shudhanshukumarsaha@gmail.com', 'ABMJAN', NULL, NULL, '2018', 1, 1, NULL, 0, NULL, NULL, 1, NULL, NULL, 'Shudhanshu Kumar Saha', 'O+', 'Male', 'Married', 'Sunil Kumar Saha', 'Joshna Rani Saha', 'Hindus', 'Bangladeshi', '2697557398614', 'BF-0700391', NULL, NULL, '01759961995', 'shudhanshukumarsaha@gmail.com', '1975-10-05', '', '', '', 'A-31224', NULL, 'Shudhanshu Kumar Saha', '01759961995', NULL, NULL, '04', '0455', '045595', 'Vill+ PO Radhanagar Gram', '03', '0326', '032690', '75 Tejkunipara, framgate, Dhaka', NULL, NULL, NULL, NULL, 'upload/documents/181027/photo_181027.jpg', NULL, '2018-01-07 12:29:52', NULL, '2018-01-02 19:18:31', 'admin@bigm-bd.com', 1, 0, '14:00', 'Cash/Cheque', '0', 'Nephrology department, BIRDEM General Hospital ', 'Registrar, Nephrology', 'upload/documents/181027/mbbs_181027.jpg', 'upload/documents/181027/pg_181027.jpg', NULL, 'upload/documents/181027/nid_181027.jpg'),
(37, 27, 181028, 'CMED', 'shabnamsejooti@gmail.com', 'XEWHKV', NULL, NULL, '2018', 1, 1, NULL, 0, NULL, NULL, 1, NULL, NULL, 'Dr. Shabnam Sarwar Sejooti', 'AB+', 'Female', 'Married', 'Md. Golam Sarwar Hasan', 'Sabiha Noor Chowdhury', 'Muslim', 'Bangladeshi', '6125214284240', '', NULL, NULL, '01712029738', 'shabnamsejooti@gmail.com', '1986-08-23', '', '', '', 'A55383', NULL, '', '', NULL, NULL, '03', '0326', '032695', 'Flat no-A2, House no-1, Road no-29, Sector-7, Uttara, Dhaka', '03', '0326', '032695', 'Flat no-A2, House no-1, Road no-29, Sector-7, Uttara, Dhaka', NULL, NULL, NULL, NULL, 'upload/documents/181028/photo_181028.jpg', 'upload/documents/181028/sign_181028.jpg', '2018-01-07 12:29:52', NULL, '2018-01-02 19:18:21', 'admin@bigm-bd.com', 1, 0, '', '', '0', 'Tairunnessa Memorial Medical College & Hospital', 'Assistant Professor, Dept. of Biochemistry', '', '', NULL, ''),
(38, 28, 181029, 'CMED', 'alamdr2003@yahoo.com', '9DLTHD', NULL, NULL, '2018', 1, 1, NULL, 0, NULL, NULL, 1, NULL, NULL, 'PROF. ABUL BASHAR MOHAMMAD KHURSHID ALAM', 'AB+', 'Male', 'Married', 'MD. MAMINUL HAQUE', 'BEGUM JAHANARA HAQUE', 'Muslim', 'BANGLADESHI', '4626995544', '', NULL, NULL, '01711749096', 'alamdr2003@yahoo.com', '1961-12-31', '', '', '', 'A13976', NULL, 'SELF', '01711749096', NULL, NULL, '02', '0219', '021967', 'KINGSHUK AND PUPIL,693/KA,JHAWTOLA,COMILLA.', '03', '0326', '032616', '', NULL, NULL, NULL, NULL, 'upload/documents/181029/photo_181029.jpg', NULL, '2018-01-07 12:29:52', NULL, '2018-01-02 19:18:11', 'admin@bigm-bd.com', 1, 0, '', 'CASH', '0', 'DEPARTMENT OF SURGERY, DHAKA MEDICAL COLLEGE AND HOSPITAL.', 'GOVT SERVICE', 'upload/documents/181029/mbbs_181029.pdf', 'upload/documents/181029/pg_181029.pdf', NULL, 'upload/documents/181029/nid_181029.pdf'),
(39, 29, 181030, 'CMED', 'drmustafiz@hotmail.com', 'LLLCNP', NULL, NULL, '2018', 1, 1, NULL, 0, NULL, NULL, 1, NULL, NULL, 'Dr. Md. Mustafizur Rahman', 'B+', 'Male', 'Married', 'Md. Bazlar Rahman', 'Mrs. Fazrunnessa', 'Muslim', '', '2696653261244', '', NULL, NULL, '01711619767', 'drmustafiz@hotmail.com', '1968-10-31', 'Mustafizur Rahman', '', '', '23899', NULL, '', '', NULL, NULL, '03', '0335', '033558', 'Baliakandi', '03', '0326', '032666', '10/A Circuit house road Kakril, Dhaka', NULL, NULL, NULL, NULL, 'upload/documents/181030/photo_181030.jpg', NULL, '2018-01-07 12:29:52', NULL, '2018-01-02 19:18:02', 'admin@bigm-bd.com', 1, 0, '', '', '0', '', 'Professor of Surgery Shaheed Suhrawardy Medical College', '', '', NULL, ''),
(40, 30, 181031, 'CMED', 'salmasultana68@yahoo.com', 'CDMSD5', NULL, NULL, '2018', 1, 1, NULL, 0, NULL, NULL, 1, NULL, NULL, 'SALMA SULTANA', 'O+', 'Female', 'Married', 'DR. ALI AHMED CHOWDHURY', 'KHURSHID SULTANA', 'Muslim', 'Bangladeshi', '2691649116456', '', NULL, NULL, '01713031044', 'salmasultana68@yahoo.com', '1968-10-03', 'Salma Sultana', '', '', 'A23365', NULL, '', '', NULL, NULL, '02', '0215', '021504', '42, JAMAL KHAN ROAD', '03', '0326', '032616', 'Apt. 2/A, H- 43, R- 9/A,', NULL, NULL, NULL, NULL, 'upload/documents/181031/photo_181031.jpg', NULL, '2018-01-07 12:29:52', NULL, '2018-01-02 19:17:47', 'admin@bigm-bd.com', 1, 0, '', '', '0', '', '', 'upload/documents/181031/mbbs_181031.jpg', 'upload/documents/181031/pg_181031.jpg', NULL, ''),
(41, 31, 181032, 'CMED', 'sahil_nazwa@yahoo.com', '9MU5HM', NULL, NULL, '2018', 1, NULL, NULL, 0, NULL, NULL, 1, NULL, NULL, 'Nahid Farhana Amin', 'B+', 'Female', 'Married', 'Nurul Amin', 'Rashida Momtaz', 'Muslim', 'Bangladeshi', '1900408657', 'BN 0376928', NULL, NULL, '01552309038', 'sahil_nazwa@yahoo.com', '1975-02-07', 'Nahid Amin', '', '01552309038', '31148', NULL, 'Md Golam Sarwer', '01819213313', NULL, NULL, '03', '0326', '032695', 'House 7, Road 24, Sector 10', '03', '0326', '032695', 'House 7, Road 24, Sector 10', NULL, NULL, NULL, NULL, 'upload/documents/181032/photo_181032.jpg', NULL, '2018-01-09 05:45:37', NULL, NULL, NULL, 0, 0, '11:00', 'Cash', '0', 'Bangabandhu Sheikh Mujib Medical University', 'Associate Professor, Department of Anatomy', 'upload/documents/181032/mbbs_181032.jpg', 'upload/documents/181032/pg_181032.jpg', NULL, 'upload/documents/181032/nid_181032.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `sif_batch`
--

CREATE TABLE IF NOT EXISTS `sif_batch` (
  `id` int(10) NOT NULL,
  `course_code` int(10) NOT NULL,
  `faculty_code` int(10) NOT NULL,
  `subject` varchar(60) NOT NULL,
  `batch_code` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(50) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` varchar(50) NOT NULL,
  `status` varchar(40) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sif_batch`
--

INSERT INTO `sif_batch` (`id`, `course_code`, `faculty_code`, `subject`, `batch_code`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`) VALUES
(36, 7, 0, 'Regular: Ganglia', 6, '2017-06-09 04:10:02', 'admin@bigm-bd.com', '2017-06-09 10:10:02', 'admin@bigm-bd.com', '1'),
(37, 1, 0, 'Friday Mega', 3, '2017-05-08 09:51:53', 'admin@bigm-bd.com', '2017-05-08 15:51:53', 'admin@bigm-bd.com', '1'),
(38, 1, 0, 'Special', 9, '2017-05-08 09:54:06', 'admin@bigm-bd.com', '2017-05-08 15:54:06', 'admin@bigm-bd.com', '1'),
(39, 1, 0, 'Foundation Batch', 1, '2017-06-09 04:08:40', 'admin@bigm-bd.com', '2017-06-09 10:08:40', 'admin@bigm-bd.com', '1'),
(40, 7, 0, 'Regular: Axon', 8, '2017-06-09 04:11:56', 'admin@bigm-bd.com', '2017-06-09 10:11:56', 'admin@bigm-bd.com', '1'),
(41, 1, 0, 'Oncology Batch', 6, '2017-05-06 06:18:24', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', '1'),
(42, 1, 0, 'Exam : Combined', 5, '2017-05-08 09:52:10', 'admin@bigm-bd.com', '2017-05-08 15:52:10', 'admin@bigm-bd.com', '1'),
(43, 1, 0, 'Crush', 8, '2017-05-06 06:19:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', '1'),
(44, 1, 0, 'Foundation : Medicine', 2, '2017-05-08 09:51:43', 'admin@bigm-bd.com', '2017-05-08 15:51:43', 'admin@bigm-bd.com', '1'),
(45, 1, 0, 'Friday Medicine', 7, '2017-05-08 09:52:52', 'admin@bigm-bd.com', '2017-05-08 15:52:52', 'admin@bigm-bd.com', '1'),
(46, 1, 0, 'Exam : Medicine', 4, '2017-05-08 09:52:02', 'admin@bigm-bd.com', '2017-05-08 15:52:02', 'admin@bigm-bd.com', '1'),
(47, 1, 0, 'Crush Medicine', 4, '2017-05-06 06:21:33', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', '1'),
(48, 2, 0, 'Regular batch', 2, '2017-08-15 12:28:04', 'admin@bigm-bd.com', '2017-08-15 18:28:04', 'admin@bigm-bd.com', '1'),
(49, 2, 0, 'Exam batch', 3, '2017-08-15 12:29:25', 'admin@bigm-bd.com', '2017-08-15 18:29:25', 'admin@bigm-bd.com', '1'),
(50, 2, 0, 'Mock', 5, '2017-08-15 12:27:13', 'admin@bigm-bd.com', '2017-08-15 18:27:13', 'admin@bigm-bd.com', '1'),
(51, 7, 0, 'Regular Batch : DNA', 1, '2017-05-08 09:53:22', 'admin@bigm-bd.com', '2017-05-08 15:53:22', 'admin@bigm-bd.com', '1'),
(52, 7, 0, 'Regular Batch : RNA', 2, '2017-05-08 09:53:58', 'admin@bigm-bd.com', '2017-05-08 15:53:58', 'admin@bigm-bd.com', '1'),
(53, 7, 0, 'Regular Batch : Neuron', 3, '2017-05-08 09:53:34', 'admin@bigm-bd.com', '2017-05-08 15:53:34', 'admin@bigm-bd.com', '1'),
(54, 7, 0, 'Regular Batch : Receptor', 4, '2017-05-08 09:53:50', 'admin@bigm-bd.com', '2017-05-08 15:53:50', 'admin@bigm-bd.com', '1'),
(55, 7, 0, 'Regular Batch : Nucleus', 5, '2017-05-08 09:53:42', 'admin@bigm-bd.com', '2017-05-08 15:53:42', 'admin@bigm-bd.com', '1'),
(56, 7, 0, 'Synapse', 9, '2017-06-09 04:12:33', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', '1'),
(57, 7, 0, 'Recovery / Crush', 7, '2017-08-14 11:49:01', 'admin@bigm-bd.com', '2017-08-14 17:49:01', 'admin@bigm-bd.com', '1'),
(58, 8, 0, 'A1', 1, '2017-06-09 04:15:05', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', '1'),
(59, 8, 0, 'A2', 2, '2017-08-04 10:04:04', 'admin@bigm-bd.com', '2017-08-04 16:04:04', 'admin@bigm-bd.com', '2'),
(60, 8, 0, 'A3', 3, '2017-08-04 10:04:10', 'admin@bigm-bd.com', '2017-08-04 16:04:10', 'admin@bigm-bd.com', '2'),
(61, 8, 0, 'A4', 4, '2017-08-04 10:04:17', 'admin@bigm-bd.com', '2017-08-04 16:04:17', 'admin@bigm-bd.com', '2'),
(62, 8, 0, 'A5', 5, '2017-08-04 10:04:23', 'admin@bigm-bd.com', '2017-08-04 16:04:23', 'admin@bigm-bd.com', '2'),
(63, 8, 0, 'A6', 6, '2017-08-04 10:04:34', 'admin@bigm-bd.com', '2017-08-04 16:04:34', 'admin@bigm-bd.com', '2'),
(64, 8, 0, 'A7', 7, '2017-08-04 10:04:43', 'admin@bigm-bd.com', '2017-08-04 16:04:43', 'admin@bigm-bd.com', '2'),
(65, 2, 0, 'Foundation Batch', 1, '2017-08-15 12:28:24', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', '1'),
(66, 2, 0, 'Clinical Batch', 4, '2017-08-15 12:29:15', 'admin@bigm-bd.com', '2017-08-15 18:29:15', 'admin@bigm-bd.com', '1'),
(67, 8, 0, 'MS Residency Exam', 1, '2017-08-17 08:47:43', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', '1');

-- --------------------------------------------------------

--
-- Table structure for table `sif_class_topic`
--

CREATE TABLE IF NOT EXISTS `sif_class_topic` (
  `id` int(10) NOT NULL,
  `course_code` int(10) NOT NULL,
  `faculty_code` int(10) NOT NULL,
  `subject_id` int(3) NOT NULL,
  `class_topic_name` varchar(70) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(50) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` varchar(40) NOT NULL,
  `status` int(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=1993 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sif_class_topic`
--

INSERT INTO `sif_class_topic` (`id`, `course_code`, `faculty_code`, `subject_id`, `class_topic_name`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`) VALUES
(9, 1, 2, 6, 'Thorax', '2017-03-05 10:34:45', 'admin@bigm-bd.com', '2017-03-05 16:34:45', 'admin@bigm-bd.com', 1),
(10, 2, 1, 12, 'Genetics', '2017-03-05 10:30:28', 'admin@bigm-bd.com', '2017-03-05 16:30:28', 'admin@bigm-bd.com', 1),
(11, 1, 1, 0, 'Virology', '2017-01-29 12:27:07', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 0),
(12, 1, 1, 0, 'Head neck', '2017-01-29 12:27:33', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 0),
(13, 1, 1, 0, 'Renal System', '2017-01-29 12:28:01', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 0),
(14, 2, 1, 0, 'Neuroanatomy', '2017-02-02 05:27:22', 'admin@bigm-bd.com', '2017-02-02 11:27:22', 'admin@bigm-bd.com', 0),
(15, 2, 1, 0, 'Immunology', '2017-02-02 05:27:30', 'admin@bigm-bd.com', '2017-02-02 11:27:30', 'admin@bigm-bd.com', 0),
(16, 2, 1, 0, 'oncology', '2017-02-02 05:27:39', 'admin@bigm-bd.com', '2017-02-02 11:27:39', 'admin@bigm-bd.com', 0),
(17, 1, 2, 0, 'Hepatology', '2017-02-02 05:19:36', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 0),
(18, 1, 2, 0, 'Biostatics', '2017-02-02 05:20:10', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 0),
(19, 1, 3, 0, 'Nephrology', '2017-02-02 05:21:03', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 0),
(20, 1, 3, 0, 'Mycology', '2017-02-02 05:21:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 0),
(21, 1, 3, 0, 'Enbryology', '2017-02-02 05:22:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 0),
(22, 2, 2, 0, 'Abdomen', '2017-02-02 05:50:38', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 0),
(23, 2, 2, 0, 'Neuro Anatomy', '2017-02-02 05:50:55', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 0),
(24, 2, 2, 0, 'Inflamation', '2017-02-02 05:51:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 0),
(25, 2, 3, 0, 'GIT Physiology', '2017-02-06 07:54:19', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 0),
(26, 2, 3, 0, 'Medical Psychiatry', '2017-02-06 07:55:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 0),
(27, 2, 3, 0, 'Toxicology', '2017-02-06 07:55:21', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 0),
(28, 2, 4, 0, 'Metabolism', '2017-02-06 08:39:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 0),
(29, 2, 4, 0, 'Infectious Diseases', '2017-02-06 08:40:20', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 0),
(30, 1, 1, 0, 'nazmul', '2017-02-11 10:36:37', 'admin@bigm-bd.com', '2017-02-11 16:36:37', 'admin@bigm-bd.com', 2),
(31, 7, 0, 67, 'Parasitology', '2017-06-11 06:00:33', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(32, 7, 0, 67, 'Mycology', '2017-06-11 06:00:33', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(33, 7, 0, 67, 'Gen: Bacteriology', '2017-06-11 06:00:33', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(34, 7, 0, 67, 'Sys: Bacteriology', '2017-06-11 06:00:33', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(35, 7, 0, 67, 'Abdomen-I', '2017-06-11 06:00:33', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(36, 7, 0, 67, 'Abdomen-II', '2017-06-11 06:00:33', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(37, 7, 0, 67, 'Head Neck', '2017-06-11 06:00:33', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(38, 7, 0, 67, 'Thorax', '2017-06-11 06:00:33', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(39, 7, 0, 67, 'Extremity-I', '2017-06-11 06:00:33', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(40, 7, 0, 67, 'Extremity-II', '2017-06-11 06:00:33', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(41, 7, 0, 67, 'Embryology-I', '2017-06-11 06:00:33', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(42, 7, 0, 67, 'Embryology-II', '2017-06-11 06:00:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(43, 7, 0, 67, 'Histology-I', '2017-06-11 06:00:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(44, 7, 0, 67, 'Histology-II', '2017-06-11 06:00:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(45, 7, 0, 67, 'Endocrinology-I', '2017-06-11 06:00:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(46, 7, 0, 67, 'Endocrinology-II', '2017-06-11 06:00:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(47, 7, 0, 67, 'Neuroanatomy', '2017-06-11 06:00:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(48, 7, 0, 67, 'Nervous System', '2017-06-11 06:00:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(49, 7, 0, 67, 'Gen: Pharmacology', '2017-06-11 06:00:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(50, 7, 0, 67, 'Sys: Pharmacology', '2017-06-11 06:00:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(51, 7, 0, 67, 'GIT Physiology', '2017-06-11 06:00:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(52, 7, 0, 67, 'Metabolism, Vitamins & Minerals', '2017-06-11 06:00:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(53, 7, 0, 67, 'CVS Physiology-I', '2017-06-11 06:00:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(54, 7, 0, 67, 'CVS Physiology-II', '2017-06-11 06:00:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(55, 7, 0, 67, 'Cell Injury & Adaptation', '2017-06-11 06:00:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(56, 7, 0, 67, 'Genetics', '2017-06-11 06:00:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(57, 7, 0, 67, 'Neoplasm-I', '2017-06-11 06:00:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(58, 7, 0, 67, 'Neoplasm-II', '2017-06-11 06:00:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(59, 7, 0, 67, 'Repair, Regeneration, Healing & Hem', '2017-06-11 06:00:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(60, 7, 0, 67, 'Immunology-I', '2017-06-11 06:00:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(61, 7, 0, 67, 'Immunology-II', '2017-06-11 06:00:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(62, 7, 0, 67, 'Respiratory System', '2017-06-11 06:00:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(63, 7, 0, 67, 'General Physiology', '2017-06-11 06:00:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(64, 7, 0, 67, 'Renal System', '2017-06-11 06:00:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(65, 7, 0, 67, 'Body Fluid, Acid Base Balance .....', '2017-06-11 06:00:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(66, 7, 0, 67, 'Blood', '2017-06-11 06:00:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(67, 7, 0, 67, 'Haematology', '2017-06-11 06:00:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(68, 7, 0, 75, 'Parasitology', '2017-06-11 06:01:56', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(69, 7, 0, 75, 'Mycology', '2017-06-11 06:01:56', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(70, 7, 0, 75, 'Gen: Bacteriology', '2017-06-11 06:01:56', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(71, 7, 0, 75, 'Sys: Bacteriology', '2017-06-11 06:01:56', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(72, 7, 0, 75, 'Abdomen-I', '2017-06-11 06:01:56', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(73, 7, 0, 75, 'Abdomen-II', '2017-06-11 06:01:56', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(74, 7, 0, 75, 'Head Neck', '2017-06-11 06:01:56', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(75, 7, 0, 75, 'Thorax', '2017-06-11 06:01:56', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(76, 7, 0, 75, 'Extremity-I', '2017-06-11 06:01:56', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(77, 7, 0, 75, 'Extremity-II', '2017-06-11 06:01:56', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(78, 7, 0, 75, 'Embryology-I', '2017-06-11 06:01:56', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(79, 7, 0, 75, 'Embryology-II', '2017-06-11 06:01:56', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(80, 7, 0, 75, 'Histology-I', '2017-06-11 06:01:56', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(81, 7, 0, 75, 'Histology-II', '2017-06-11 06:01:56', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(82, 7, 0, 75, 'Endocrinology-I', '2017-06-11 06:01:56', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(83, 7, 0, 75, 'Endocrinology-II', '2017-06-11 06:01:56', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(84, 7, 0, 75, 'Neuroanatomy', '2017-06-11 06:01:56', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(85, 7, 0, 75, 'Nervous System', '2017-06-11 06:01:56', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(86, 7, 0, 75, 'Gen: Pharmacology', '2017-06-11 06:01:56', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(87, 7, 0, 75, 'Sys: Pharmacology', '2017-06-11 06:01:56', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(88, 7, 0, 75, 'GIT Physiology', '2017-06-11 06:01:56', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(89, 7, 0, 75, 'Metabolism, Vitamins & Minerals', '2017-06-11 06:01:56', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(90, 7, 0, 75, 'CVS Physiology-I', '2017-06-11 06:01:56', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(91, 7, 0, 75, 'CVS Physiology-II', '2017-06-11 06:01:56', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(92, 7, 0, 75, 'Cell Injury & Adaptation', '2017-06-11 06:01:56', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(93, 7, 0, 75, 'Genetics', '2017-06-11 06:01:56', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(94, 7, 0, 75, 'Neoplasm-I', '2017-06-11 06:01:56', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(95, 7, 0, 75, 'Neoplasm-II', '2017-06-11 06:01:56', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(96, 7, 0, 75, 'Repair, Regeneration, Healing & Hem', '2017-06-11 06:01:56', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(97, 7, 0, 75, 'Immunology-I', '2017-06-11 06:01:56', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(98, 7, 0, 75, 'Immunology-II', '2017-06-11 06:01:56', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(99, 7, 0, 75, 'Respiratory System', '2017-06-11 06:01:56', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(100, 7, 0, 75, 'General Physiology', '2017-06-11 06:01:56', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(101, 7, 0, 75, 'Renal System', '2017-06-11 06:01:56', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(102, 7, 0, 75, 'Body Fluid, Acid Base Balance .....', '2017-06-11 06:01:56', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(103, 7, 0, 75, 'Blood', '2017-06-11 06:01:56', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(104, 7, 0, 75, 'Haematology', '2017-06-11 06:01:56', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(105, 7, 0, 75, 'Good Medical Practice', '2017-06-11 06:01:56', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(106, 7, 0, 71, 'Parasitology', '2017-06-11 06:02:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(107, 7, 0, 71, 'Mycology', '2017-06-11 06:02:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(108, 7, 0, 71, 'Gen: Bacteriology', '2017-06-11 06:02:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(109, 7, 0, 71, 'Sys: Bacteriology', '2017-06-11 06:02:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(110, 7, 0, 71, 'Abdomen-I', '2017-06-11 06:02:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(111, 7, 0, 71, 'Abdomen-II', '2017-06-11 06:02:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(112, 7, 0, 71, 'Head Neck', '2017-06-11 06:02:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(113, 7, 0, 71, 'Thorax', '2017-06-11 06:02:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(114, 7, 0, 71, 'Extremity-I', '2017-06-11 06:02:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(115, 7, 0, 71, 'Extremity-II', '2017-06-11 06:02:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(116, 7, 0, 71, 'Embryology-I', '2017-06-11 06:02:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(117, 7, 0, 71, 'Embryology-II', '2017-06-11 06:02:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(118, 7, 0, 71, 'Histology-I', '2017-06-11 06:02:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(119, 7, 0, 71, 'Histology-II', '2017-06-11 06:02:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(120, 7, 0, 71, 'Endocrinology-I', '2017-06-11 06:02:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(121, 7, 0, 71, 'Endocrinology-II', '2017-06-11 06:02:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(122, 7, 0, 71, 'Neuroanatomy', '2017-06-11 06:02:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(123, 7, 0, 71, 'Nervous System', '2017-06-11 06:02:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(124, 7, 0, 71, 'Gen: Pharmacology', '2017-06-11 06:02:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(125, 7, 0, 71, 'Sys: Pharmacology', '2017-06-11 06:02:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(126, 7, 0, 71, 'GIT Physiology', '2017-06-11 06:02:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(127, 7, 0, 71, 'Metabolism, Vitamins & Minerals', '2017-06-11 06:02:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(128, 7, 0, 71, 'CVS Physiology-I', '2017-06-11 06:02:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(129, 7, 0, 71, 'CVS Physiology-II', '2017-06-11 06:02:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(130, 7, 0, 71, 'Cell Injury & Adaptation', '2017-06-11 06:02:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(131, 7, 0, 71, 'Genetics', '2017-06-11 06:02:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(132, 7, 0, 71, 'Neoplasm-I', '2017-06-11 06:02:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(133, 7, 0, 71, 'Neoplasm-II', '2017-06-11 06:02:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(134, 7, 0, 71, 'Repair, Regeneration, Healing & Hem', '2017-06-11 06:02:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(135, 7, 0, 71, 'Immunology-I', '2017-06-11 06:02:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(136, 7, 0, 71, 'Immunology-II', '2017-06-11 06:02:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(137, 7, 0, 71, 'Respiratory System', '2017-06-11 06:02:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(138, 7, 0, 71, 'General Physiology', '2017-06-11 06:02:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(139, 7, 0, 71, 'Renal System', '2017-06-11 06:02:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(140, 7, 0, 71, 'Body Fluid, Acid Base Balance .....', '2017-06-11 06:02:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(141, 7, 0, 71, 'Blood', '2017-06-11 06:02:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(142, 7, 0, 71, 'Haematology', '2017-06-11 06:02:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(143, 7, 0, 54, 'Parasitology', '2017-06-11 06:03:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(144, 7, 0, 54, 'Mycology', '2017-06-11 06:03:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(145, 7, 0, 54, 'Gen: Bacteriology', '2017-06-11 06:03:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(146, 7, 0, 54, 'Sys: Bacteriology', '2017-06-11 06:03:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(147, 7, 0, 54, 'Abdomen-I', '2017-06-11 06:03:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(148, 7, 0, 54, 'Abdomen-II', '2017-06-11 06:03:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(149, 7, 0, 54, 'Head Neck', '2017-06-11 06:03:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(150, 7, 0, 54, 'Thorax', '2017-06-11 06:03:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(151, 7, 0, 54, 'Extremity-I', '2017-06-11 06:03:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(152, 7, 0, 54, 'Extremity-II', '2017-06-11 06:03:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(153, 7, 0, 54, 'Embryology-I', '2017-06-11 06:03:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(154, 7, 0, 54, 'Embryology-II', '2017-06-11 06:03:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(155, 7, 0, 54, 'Histology-I', '2017-06-11 06:03:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(156, 7, 0, 54, 'Histology-II', '2017-06-11 06:03:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(157, 7, 0, 54, 'Endocrinology-I', '2017-06-11 06:03:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(158, 7, 0, 54, 'Endocrinology-II', '2017-06-11 06:03:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(159, 7, 0, 54, 'Neuroanatomy', '2017-06-11 06:03:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(160, 7, 0, 54, 'Nervous System', '2017-06-11 06:03:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(161, 7, 0, 54, 'Gen: Pharmacology', '2017-06-11 06:03:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(162, 7, 0, 54, 'Sys: Pharmacology', '2017-06-11 06:03:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(163, 7, 0, 54, 'GIT Physiology', '2017-06-11 06:03:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(164, 7, 0, 54, 'Metabolism, Vitamins & Minerals', '2017-06-11 06:03:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(165, 7, 0, 54, 'CVS Physiology-I', '2017-06-11 06:03:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(166, 7, 0, 54, 'CVS Physiology-II', '2017-06-11 06:03:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(167, 7, 0, 54, 'Cell Injury & Adaptation', '2017-06-11 06:03:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(168, 7, 0, 54, 'Genetics', '2017-06-11 06:03:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(169, 7, 0, 54, 'Neoplasm-I', '2017-06-11 06:03:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(170, 7, 0, 54, 'Neoplasm-II', '2017-06-11 06:03:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(171, 7, 0, 54, 'Repair, Regeneration, Healing & Hem', '2017-06-11 06:03:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(172, 7, 0, 54, 'Immunology-I', '2017-06-11 06:03:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(173, 7, 0, 54, 'Immunology-II', '2017-06-11 06:03:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(174, 7, 0, 54, 'Respiratory System', '2017-06-11 06:03:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(175, 7, 0, 54, 'General Physiology', '2017-06-11 06:03:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(176, 7, 0, 54, 'Renal System', '2017-06-11 06:03:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(177, 7, 0, 54, 'Body Fluid, Acid Base Balance .....', '2017-06-11 06:03:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(178, 7, 0, 54, 'Blood', '2017-06-11 06:03:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(179, 7, 0, 54, 'Haematology', '2017-06-11 06:03:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(180, 7, 0, 53, 'Parasitology', '2017-06-11 06:04:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(181, 7, 0, 53, 'Mycology', '2017-06-11 06:04:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(182, 7, 0, 53, 'Gen: Bacteriology', '2017-06-11 06:04:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(183, 7, 0, 53, 'Sys: Bacteriology', '2017-06-11 06:04:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(184, 7, 0, 53, 'Abdomen-I', '2017-06-11 06:04:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(185, 7, 0, 53, 'Abdomen-II', '2017-06-11 06:04:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(186, 7, 0, 53, 'Head Neck', '2017-06-11 06:04:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(187, 7, 0, 53, 'Thorax', '2017-06-11 06:04:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(188, 7, 0, 53, 'Extremity-I', '2017-06-11 06:04:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(189, 7, 0, 53, 'Extremity-II', '2017-06-11 06:04:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(190, 7, 0, 53, 'Embryology-I', '2017-06-11 06:04:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(191, 7, 0, 53, 'Embryology-II', '2017-06-11 06:04:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(192, 7, 0, 53, 'Histology-I', '2017-06-11 06:04:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(193, 7, 0, 53, 'Histology-II', '2017-06-11 06:04:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(194, 7, 0, 53, 'Endocrinology-I', '2017-06-11 06:04:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(195, 7, 0, 53, 'Endocrinology-II', '2017-06-11 06:04:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(196, 7, 0, 53, 'Neuroanatomy', '2017-06-11 06:04:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(197, 7, 0, 53, 'Nervous System', '2017-06-11 06:04:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(198, 7, 0, 53, 'Gen: Pharmacology', '2017-06-11 06:04:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(199, 7, 0, 53, 'Sys: Pharmacology', '2017-06-11 06:04:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(200, 7, 0, 53, 'GIT Physiology', '2017-06-11 06:04:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(201, 7, 0, 53, 'Metabolism, Vitamins & Minerals', '2017-06-11 06:04:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(202, 7, 0, 53, 'CVS Physiology-I', '2017-06-11 06:04:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(203, 7, 0, 53, 'CVS Physiology-II', '2017-06-11 06:04:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(204, 7, 0, 53, 'Cell Injury & Adaptation', '2017-06-11 06:04:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(205, 7, 0, 53, 'Genetics', '2017-06-11 06:04:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(206, 7, 0, 53, 'Neoplasm-I', '2017-06-11 06:04:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(207, 7, 0, 53, 'Neoplasm-II', '2017-06-11 06:04:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(208, 7, 0, 53, 'Repair, Regeneration, Healing & Hem', '2017-06-11 06:04:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(209, 7, 0, 53, 'Immunology-I', '2017-06-11 06:04:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(210, 7, 0, 53, 'Immunology-II', '2017-06-11 06:04:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(211, 7, 0, 53, 'Respiratory System', '2017-06-11 06:04:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(212, 7, 0, 53, 'General Physiology', '2017-06-11 06:04:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(213, 7, 0, 53, 'Renal System', '2017-06-11 06:04:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(214, 7, 0, 53, 'Body Fluid, Acid Base Balance .....', '2017-06-11 06:04:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(215, 7, 0, 53, 'Blood', '2017-06-11 06:04:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(216, 7, 0, 53, 'Haematology', '2017-06-11 06:04:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(217, 7, 0, 29, 'Parasitology', '2017-06-11 06:04:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(218, 7, 0, 29, 'Mycology', '2017-06-11 06:04:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(219, 7, 0, 29, 'Gen: Bacteriology', '2017-06-11 06:04:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(220, 7, 0, 29, 'Sys: Bacteriology', '2017-06-11 06:04:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(221, 7, 0, 29, 'Abdomen-I', '2017-06-11 06:04:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(222, 7, 0, 29, 'Abdomen-II', '2017-06-11 06:04:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(223, 7, 0, 29, 'Head Neck', '2017-06-11 06:04:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(224, 7, 0, 29, 'Thorax', '2017-06-11 06:04:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(225, 7, 0, 29, 'Extremity-I', '2017-06-11 06:04:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(226, 7, 0, 29, 'Extremity-II', '2017-06-11 06:04:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(227, 7, 0, 29, 'Embryology-I', '2017-06-11 06:04:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(228, 7, 0, 29, 'Embryology-II', '2017-06-11 06:04:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(229, 7, 0, 29, 'Histology-I', '2017-06-11 06:04:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(230, 7, 0, 29, 'Histology-II', '2017-06-11 06:04:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(231, 7, 0, 29, 'Endocrinology-I', '2017-06-11 06:04:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(232, 7, 0, 29, 'Endocrinology-II', '2017-06-11 06:04:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(233, 7, 0, 29, 'Neuroanatomy', '2017-06-11 06:04:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(234, 7, 0, 29, 'Nervous System', '2017-06-11 06:04:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(235, 7, 0, 29, 'Gen: Pharmacology', '2017-06-11 06:04:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(236, 7, 0, 29, 'Sys: Pharmacology', '2017-06-11 06:04:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(237, 7, 0, 29, 'GIT Physiology', '2017-06-11 06:04:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(238, 7, 0, 29, 'Metabolism, Vitamins & Minerals', '2017-06-11 06:04:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(239, 7, 0, 29, 'CVS Physiology-I', '2017-06-11 06:04:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(240, 7, 0, 29, 'CVS Physiology-II', '2017-06-11 06:04:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(241, 7, 0, 29, 'Cell Injury & Adaptation', '2017-06-11 06:04:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(242, 7, 0, 29, 'Genetics', '2017-06-11 06:04:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(243, 7, 0, 29, 'Neoplasm-I', '2017-06-11 06:04:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(244, 7, 0, 29, 'Neoplasm-II', '2017-06-11 06:04:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(245, 7, 0, 29, 'Repair, Regeneration, Healing & Hem', '2017-06-11 06:04:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(246, 7, 0, 29, 'Immunology-I', '2017-06-11 06:04:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(247, 7, 0, 29, 'Immunology-II', '2017-06-11 06:04:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(248, 7, 0, 29, 'Respiratory System', '2017-06-11 06:04:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(249, 7, 0, 29, 'General Physiology', '2017-06-11 06:04:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(250, 7, 0, 29, 'Renal System', '2017-06-11 06:04:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(251, 7, 0, 29, 'Body Fluid, Acid Base Balance .....', '2017-06-11 06:04:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(252, 7, 0, 29, 'Blood', '2017-06-11 06:04:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(253, 7, 0, 29, 'Haematology', '2017-06-11 06:04:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(254, 7, 0, 49, 'Parasitology', '2017-06-11 06:04:55', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(255, 7, 0, 49, 'Mycology', '2017-06-11 06:04:55', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(256, 7, 0, 49, 'Gen: Bacteriology', '2017-06-11 06:04:55', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(257, 7, 0, 49, 'Sys: Bacteriology', '2017-06-11 06:04:55', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(258, 7, 0, 49, 'Abdomen-I', '2017-06-11 06:04:55', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(259, 7, 0, 49, 'Abdomen-II', '2017-06-11 06:04:55', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(260, 7, 0, 49, 'Head Neck', '2017-06-11 06:04:55', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(261, 7, 0, 49, 'Thorax', '2017-06-11 06:04:55', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(262, 7, 0, 49, 'Extremity-I', '2017-06-11 06:04:55', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(263, 7, 0, 49, 'Extremity-II', '2017-06-11 06:04:55', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(264, 7, 0, 49, 'Embryology-I', '2017-06-11 06:04:55', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(265, 7, 0, 49, 'Embryology-II', '2017-06-11 06:04:55', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(266, 7, 0, 49, 'Histology-I', '2017-06-11 06:04:55', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(267, 7, 0, 49, 'Histology-II', '2017-06-11 06:04:55', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(268, 7, 0, 49, 'Endocrinology-I', '2017-06-11 06:04:55', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(269, 7, 0, 49, 'Endocrinology-II', '2017-06-11 06:04:55', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(270, 7, 0, 49, 'Neuroanatomy', '2017-06-11 06:04:55', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(271, 7, 0, 49, 'Nervous System', '2017-06-11 06:04:55', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(272, 7, 0, 49, 'Gen: Pharmacology', '2017-06-11 06:04:55', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(273, 7, 0, 49, 'Sys: Pharmacology', '2017-06-11 06:04:55', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(274, 7, 0, 49, 'GIT Physiology', '2017-06-11 06:04:55', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(275, 7, 0, 49, 'Metabolism, Vitamins & Minerals', '2017-06-11 06:04:55', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(276, 7, 0, 49, 'CVS Physiology-I', '2017-06-11 06:04:55', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(277, 7, 0, 49, 'CVS Physiology-II', '2017-06-11 06:04:55', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(278, 7, 0, 49, 'Cell Injury & Adaptation', '2017-06-11 06:04:55', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(279, 7, 0, 49, 'Genetics', '2017-06-11 06:04:55', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(280, 7, 0, 49, 'Neoplasm-I', '2017-06-11 06:04:55', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(281, 7, 0, 49, 'Neoplasm-II', '2017-06-11 06:04:55', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(282, 7, 0, 49, 'Repair, Regeneration, Healing & Hem', '2017-06-11 06:04:55', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(283, 7, 0, 49, 'Immunology-I', '2017-06-11 06:04:55', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(284, 7, 0, 49, 'Immunology-II', '2017-06-11 06:04:55', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(285, 7, 0, 49, 'Respiratory System', '2017-06-11 06:04:55', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(286, 7, 0, 49, 'General Physiology', '2017-06-11 06:04:55', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(287, 7, 0, 49, 'Renal System', '2017-06-11 06:04:55', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(288, 7, 0, 49, 'Body Fluid, Acid Base Balance .....', '2017-06-11 06:04:55', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(289, 7, 0, 49, 'Blood', '2017-06-11 06:04:55', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(290, 7, 0, 49, 'Haematology', '2017-06-11 06:04:55', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(291, 7, 0, 62, 'Parasitology', '2017-06-11 06:05:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(292, 7, 0, 62, 'Mycology', '2017-06-11 06:05:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(293, 7, 0, 62, 'Gen: Bacteriology', '2017-06-11 06:05:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(294, 7, 0, 62, 'Sys: Bacteriology', '2017-06-11 06:05:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(295, 7, 0, 62, 'Abdomen-I', '2017-06-11 06:05:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(296, 7, 0, 62, 'Abdomen-II', '2017-06-11 06:05:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(297, 7, 0, 62, 'Head Neck', '2017-06-11 06:05:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(298, 7, 0, 62, 'Thorax', '2017-06-11 06:05:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(299, 7, 0, 62, 'Extremity-I', '2017-06-11 06:05:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(300, 7, 0, 62, 'Extremity-II', '2017-06-11 06:05:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(301, 7, 0, 62, 'Embryology-I', '2017-06-11 06:05:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(302, 7, 0, 62, 'Embryology-II', '2017-06-11 06:05:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(303, 7, 0, 62, 'Histology-I', '2017-06-11 06:05:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(304, 7, 0, 62, 'Histology-II', '2017-06-11 06:05:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(305, 7, 0, 62, 'Endocrinology-I', '2017-06-11 06:05:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(306, 7, 0, 62, 'Endocrinology-II', '2017-06-11 06:05:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(307, 7, 0, 62, 'Neuroanatomy', '2017-06-11 06:05:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(308, 7, 0, 62, 'Nervous System', '2017-06-11 06:05:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(309, 7, 0, 62, 'Gen: Pharmacology', '2017-06-11 06:05:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(310, 7, 0, 62, 'Sys: Pharmacology', '2017-06-11 06:05:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(311, 7, 0, 62, 'GIT Physiology', '2017-06-11 06:05:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(312, 7, 0, 62, 'Metabolism, Vitamins & Minerals', '2017-06-11 06:05:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(313, 7, 0, 62, 'CVS Physiology-I', '2017-06-11 06:05:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(314, 7, 0, 62, 'CVS Physiology-II', '2017-06-11 06:05:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(315, 7, 0, 62, 'Cell Injury & Adaptation', '2017-06-11 06:05:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(316, 7, 0, 62, 'Genetics', '2017-06-11 06:05:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(317, 7, 0, 62, 'Neoplasm-I', '2017-06-11 06:05:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(318, 7, 0, 62, 'Neoplasm-II', '2017-06-11 06:05:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(319, 7, 0, 62, 'Repair, Regeneration, Healing & Hem', '2017-06-11 06:05:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(320, 7, 0, 62, 'Immunology-I', '2017-06-11 06:05:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(321, 7, 0, 62, 'Immunology-II', '2017-06-11 06:05:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(322, 7, 0, 62, 'Respiratory System', '2017-06-11 06:05:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(323, 7, 0, 62, 'General Physiology', '2017-06-11 06:05:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(324, 7, 0, 62, 'Renal System', '2017-06-11 06:05:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(325, 7, 0, 62, 'Body Fluid, Acid Base Balance .....', '2017-06-11 06:05:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(326, 7, 0, 62, 'Blood', '2017-06-11 06:05:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(327, 7, 0, 62, 'Haematology', '2017-06-11 06:05:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(328, 7, 0, 65, 'Parasitology', '2017-06-11 06:05:58', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(329, 7, 0, 65, 'Mycology', '2017-06-11 06:05:58', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(330, 7, 0, 65, 'Gen: Bacteriology', '2017-06-11 06:05:58', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(331, 7, 0, 65, 'Sys: Bacteriology', '2017-06-11 06:05:58', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(332, 7, 0, 65, 'Abdomen-I', '2017-06-11 06:05:58', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(333, 7, 0, 65, 'Abdomen-II', '2017-06-11 06:05:58', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(334, 7, 0, 65, 'Head Neck', '2017-06-11 06:05:58', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(335, 7, 0, 65, 'Thorax', '2017-06-11 06:05:58', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(336, 7, 0, 65, 'Extremity-I', '2017-06-11 06:05:58', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(337, 7, 0, 65, 'Extremity-II', '2017-06-11 06:05:58', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(338, 7, 0, 65, 'Embryology-I', '2017-06-11 06:05:58', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(339, 7, 0, 65, 'Embryology-II', '2017-06-11 06:05:58', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(340, 7, 0, 65, 'Histology-I', '2017-06-11 06:05:58', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(341, 7, 0, 65, 'Histology-II', '2017-06-11 06:05:58', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(342, 7, 0, 65, 'Endocrinology-I', '2017-06-11 06:05:58', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(343, 7, 0, 65, 'Endocrinology-II', '2017-06-11 06:05:58', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(344, 7, 0, 65, 'Neuroanatomy', '2017-06-11 06:05:58', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(345, 7, 0, 65, 'Nervous System', '2017-06-11 06:05:58', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(346, 7, 0, 65, 'Gen: Pharmacology', '2017-06-11 06:05:58', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(347, 7, 0, 65, 'Sys: Pharmacology', '2017-06-11 06:05:58', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(348, 7, 0, 65, 'GIT Physiology', '2017-06-11 06:05:58', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(349, 7, 0, 65, 'Metabolism, Vitamins & Minerals', '2017-06-11 06:05:58', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(350, 7, 0, 65, 'CVS Physiology-I', '2017-06-11 06:05:58', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(351, 7, 0, 65, 'CVS Physiology-II', '2017-06-11 06:05:58', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(352, 7, 0, 65, 'Cell Injury & Adaptation', '2017-06-11 06:05:58', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(353, 7, 0, 65, 'Genetics', '2017-06-11 06:05:58', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(354, 7, 0, 65, 'Neoplasm-I', '2017-06-11 06:05:58', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(355, 7, 0, 65, 'Neoplasm-II', '2017-06-11 06:05:58', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(356, 7, 0, 65, 'Repair, Regeneration, Healing & Hem', '2017-06-11 06:05:58', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(357, 7, 0, 65, 'Immunology-I', '2017-06-11 06:05:58', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(358, 7, 0, 65, 'Immunology-II', '2017-06-11 06:05:58', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(359, 7, 0, 65, 'Respiratory System', '2017-06-11 06:05:58', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(360, 7, 0, 65, 'General Physiology', '2017-06-11 06:05:58', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(361, 7, 0, 65, 'Renal System', '2017-06-11 06:05:58', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(362, 7, 0, 65, 'Body Fluid, Acid Base Balance .....', '2017-06-11 06:05:58', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(363, 7, 0, 65, 'Blood', '2017-06-11 06:05:58', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(364, 7, 0, 65, 'Haematology', '2017-06-11 06:05:58', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(365, 7, 0, 77, 'Parasitology', '2017-06-11 06:06:53', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(366, 7, 0, 77, 'Mycology', '2017-06-11 06:06:53', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(367, 7, 0, 77, 'Gen: Bacteriology', '2017-06-11 06:06:53', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(368, 7, 0, 77, 'Sys: Bacteriology', '2017-06-11 06:06:53', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(369, 7, 0, 77, 'Abdomen-I', '2017-06-11 06:06:53', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(370, 7, 0, 77, 'Abdomen-II', '2017-06-11 06:06:53', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(371, 7, 0, 77, 'Head Neck', '2017-06-11 06:06:53', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(372, 7, 0, 77, 'Thorax', '2017-06-11 06:06:53', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(373, 7, 0, 77, 'Extremity-I', '2017-06-11 06:06:53', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(374, 7, 0, 77, 'Extremity-II', '2017-06-11 06:06:53', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(375, 7, 0, 77, 'Embryology-I', '2017-06-11 06:06:53', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(376, 7, 0, 77, 'Embryology-II', '2017-06-11 06:06:53', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(377, 7, 0, 77, 'Histology-I', '2017-06-11 06:06:53', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(378, 7, 0, 77, 'Histology-II', '2017-06-11 06:06:53', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(379, 7, 0, 77, 'Endocrinology-I', '2017-06-11 06:06:53', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(380, 7, 0, 77, 'Endocrinology-II', '2017-06-11 06:06:53', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(381, 7, 0, 77, 'Neuroanatomy', '2017-06-11 06:06:53', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(382, 7, 0, 77, 'Nervous System', '2017-06-11 06:06:53', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(383, 7, 0, 77, 'Gen: Pharmacology', '2017-06-11 06:06:53', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(384, 7, 0, 77, 'Sys: Pharmacology', '2017-06-11 06:06:53', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(385, 7, 0, 77, 'GIT Physiology', '2017-06-11 06:06:53', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(386, 7, 0, 77, 'Metabolism, Vitamins & Minerals', '2017-06-11 06:06:53', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(387, 7, 0, 77, 'CVS Physiology-I', '2017-06-11 06:06:53', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(388, 7, 0, 77, 'CVS Physiology-II', '2017-06-11 06:06:53', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(389, 7, 0, 77, 'Cell Injury & Adaptation', '2017-06-11 06:06:54', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(390, 7, 0, 77, 'Genetics', '2017-06-11 06:06:54', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(391, 7, 0, 77, 'Neoplasm-I', '2017-06-11 06:06:54', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(392, 7, 0, 77, 'Neoplasm-II', '2017-06-11 06:06:54', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(393, 7, 0, 77, 'Repair, Regeneration, Healing & Hem', '2017-06-11 06:06:54', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(394, 7, 0, 77, 'Immunology-I', '2017-06-11 06:06:54', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(395, 7, 0, 77, 'Immunology-II', '2017-06-11 06:06:54', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(396, 7, 0, 77, 'Respiratory System', '2017-06-11 06:06:54', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(397, 7, 0, 77, 'General Physiology', '2017-06-11 06:06:54', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(398, 7, 0, 77, 'Renal System', '2017-06-11 06:06:54', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(399, 7, 0, 77, 'Body Fluid, Acid Base Balance .....', '2017-06-11 06:06:54', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(400, 7, 0, 77, 'Blood', '2017-06-11 06:06:54', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(401, 7, 0, 77, 'Haematology', '2017-06-11 06:06:54', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(402, 7, 0, 35, 'Parasitology', '2017-06-11 06:07:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(403, 7, 0, 35, 'Mycology', '2017-06-11 06:07:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(404, 7, 0, 35, 'Gen: Bacteriology', '2017-06-11 06:07:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(405, 7, 0, 35, 'Sys: Bacteriology', '2017-06-11 06:07:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(406, 7, 0, 35, 'Abdomen-I', '2017-06-11 06:07:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(407, 7, 0, 35, 'Abdomen-II', '2017-06-11 06:07:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(408, 7, 0, 35, 'Head Neck', '2017-06-11 06:07:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(409, 7, 0, 35, 'Thorax', '2017-06-11 06:07:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(410, 7, 0, 35, 'Extremity-I', '2017-06-11 06:07:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(411, 7, 0, 35, 'Extremity-II', '2017-06-11 06:07:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(412, 7, 0, 35, 'Embryology-I', '2017-06-11 06:07:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(413, 7, 0, 35, 'Embryology-II', '2017-06-11 06:07:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(414, 7, 0, 35, 'Histology-I', '2017-06-11 06:07:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(415, 7, 0, 35, 'Histology-II', '2017-06-11 06:07:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(416, 7, 0, 35, 'Endocrinology-I', '2017-06-11 06:07:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(417, 7, 0, 35, 'Endocrinology-II', '2017-06-11 06:07:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(418, 7, 0, 35, 'Neuroanatomy', '2017-06-11 06:07:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(419, 7, 0, 35, 'Nervous System', '2017-06-11 06:07:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(420, 7, 0, 35, 'Gen: Pharmacology', '2017-06-11 06:07:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(421, 7, 0, 35, 'Sys: Pharmacology', '2017-06-11 06:07:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(422, 7, 0, 35, 'GIT Physiology', '2017-06-11 06:07:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(423, 7, 0, 35, 'Metabolism, Vitamins & Minerals', '2017-06-11 06:07:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(424, 7, 0, 35, 'CVS Physiology-I', '2017-06-11 06:07:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(425, 7, 0, 35, 'CVS Physiology-II', '2017-06-11 06:07:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(426, 7, 0, 35, 'Cell Injury & Adaptation', '2017-06-11 06:07:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(427, 7, 0, 35, 'Genetics', '2017-06-11 06:07:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(428, 7, 0, 35, 'Neoplasm-I', '2017-06-11 06:07:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(429, 7, 0, 35, 'Neoplasm-II', '2017-06-11 06:07:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(430, 7, 0, 35, 'Repair, Regeneration, Healing & Hem', '2017-06-11 06:07:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(431, 7, 0, 35, 'Immunology-I', '2017-06-11 06:07:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(432, 7, 0, 35, 'Immunology-II', '2017-06-11 06:07:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(433, 7, 0, 35, 'Respiratory System', '2017-06-11 06:07:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(434, 7, 0, 35, 'General Physiology', '2017-06-11 06:07:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(435, 7, 0, 35, 'Renal System', '2017-06-11 06:07:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(436, 7, 0, 35, 'Body Fluid, Acid Base Balance .....', '2017-06-11 06:07:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(437, 7, 0, 35, 'Blood', '2017-06-11 06:07:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(438, 7, 0, 35, 'Haematology', '2017-06-11 06:07:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(439, 7, 0, 46, 'Parasitology', '2017-06-11 06:08:03', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(440, 7, 0, 46, 'Mycology', '2017-06-11 06:08:03', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(441, 7, 0, 46, 'Gen: Bacteriology', '2017-06-11 06:08:03', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(442, 7, 0, 46, 'Sys: Bacteriology', '2017-06-11 06:08:03', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(443, 7, 0, 46, 'Abdomen-I', '2017-06-11 06:08:03', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(444, 7, 0, 46, 'Abdomen-II', '2017-06-11 06:08:03', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(445, 7, 0, 46, 'Head Neck', '2017-06-11 06:08:03', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(446, 7, 0, 46, 'Thorax', '2017-06-11 06:08:03', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(447, 7, 0, 46, 'Extremity-I', '2017-06-11 06:08:03', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(448, 7, 0, 46, 'Extremity-II', '2017-06-11 06:08:03', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(449, 7, 0, 46, 'Embryology-I', '2017-06-11 06:08:03', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(450, 7, 0, 46, 'Embryology-II', '2017-06-11 06:08:03', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(451, 7, 0, 46, 'Histology-I', '2017-06-11 06:08:03', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(452, 7, 0, 46, 'Histology-II', '2017-06-11 06:08:03', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(453, 7, 0, 46, 'Endocrinology-I', '2017-06-11 06:08:03', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(454, 7, 0, 46, 'Endocrinology-II', '2017-06-11 06:08:03', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(455, 7, 0, 46, 'Neuroanatomy', '2017-06-11 06:08:03', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(456, 7, 0, 46, 'Nervous System', '2017-06-11 06:08:03', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(457, 7, 0, 46, 'Gen: Pharmacology', '2017-06-11 06:08:03', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(458, 7, 0, 46, 'Sys: Pharmacology', '2017-06-11 06:08:03', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(459, 7, 0, 46, 'GIT Physiology', '2017-06-11 06:08:03', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(460, 7, 0, 46, 'Metabolism, Vitamins & Minerals', '2017-06-11 06:08:03', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(461, 7, 0, 46, 'CVS Physiology-I', '2017-06-11 06:08:03', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(462, 7, 0, 46, 'CVS Physiology-II', '2017-06-11 06:08:03', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(463, 7, 0, 46, 'Cell Injury & Adaptation', '2017-06-11 06:08:03', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(464, 7, 0, 46, 'Genetics', '2017-06-11 06:08:03', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(465, 7, 0, 46, 'Neoplasm-I', '2017-06-11 06:08:03', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(466, 7, 0, 46, 'Neoplasm-II', '2017-06-11 06:08:03', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(467, 7, 0, 46, 'Repair, Regeneration, Healing & Hem', '2017-06-11 06:08:03', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(468, 7, 0, 46, 'Immunology-I', '2017-06-11 06:08:03', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(469, 7, 0, 46, 'Immunology-II', '2017-06-11 06:08:03', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(470, 7, 0, 46, 'Respiratory System', '2017-06-11 06:08:03', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(471, 7, 0, 46, 'General Physiology', '2017-06-11 06:08:03', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(472, 7, 0, 46, 'Renal System', '2017-06-11 06:08:03', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1);
INSERT INTO `sif_class_topic` (`id`, `course_code`, `faculty_code`, `subject_id`, `class_topic_name`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`) VALUES
(473, 7, 0, 46, 'Body Fluid, Acid Base Balance .....', '2017-06-11 06:08:03', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(474, 7, 0, 46, 'Blood', '2017-06-11 06:08:03', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(475, 7, 0, 46, 'Haematology', '2017-06-11 06:08:03', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(476, 7, 0, 34, 'Parasitology', '2017-06-11 06:08:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(477, 7, 0, 34, 'Mycology', '2017-06-11 06:08:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(478, 7, 0, 34, 'Gen: Bacteriology', '2017-06-11 06:08:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(479, 7, 0, 34, 'Sys: Bacteriology', '2017-06-11 06:08:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(480, 7, 0, 34, 'Abdomen-I', '2017-06-11 06:08:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(481, 7, 0, 34, 'Abdomen-II', '2017-06-11 06:08:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(482, 7, 0, 34, 'Head Neck', '2017-06-11 06:08:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(483, 7, 0, 34, 'Thorax', '2017-06-11 06:08:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(484, 7, 0, 34, 'Extremity-I', '2017-06-11 06:08:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(485, 7, 0, 34, 'Extremity-II', '2017-06-11 06:08:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(486, 7, 0, 34, 'Embryology-I', '2017-06-11 06:08:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(487, 7, 0, 34, 'Embryology-II', '2017-06-11 06:08:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(488, 7, 0, 34, 'Histology-I', '2017-06-11 06:08:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(489, 7, 0, 34, 'Histology-II', '2017-06-11 06:08:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(490, 7, 0, 34, 'Endocrinology-I', '2017-06-11 06:08:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(491, 7, 0, 34, 'Endocrinology-II', '2017-06-11 06:08:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(492, 7, 0, 34, 'Neuroanatomy', '2017-06-11 06:08:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(493, 7, 0, 34, 'Nervous System', '2017-06-11 06:08:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(494, 7, 0, 34, 'Gen: Pharmacology', '2017-06-11 06:08:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(495, 7, 0, 34, 'Sys: Pharmacology', '2017-06-11 06:08:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(496, 7, 0, 34, 'GIT Physiology', '2017-06-11 06:08:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(497, 7, 0, 34, 'Metabolism, Vitamins & Minerals', '2017-06-11 06:08:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(498, 7, 0, 34, 'CVS Physiology-I', '2017-06-11 06:08:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(499, 7, 0, 34, 'CVS Physiology-II', '2017-06-11 06:08:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(500, 7, 0, 34, 'Cell Injury & Adaptation', '2017-06-11 06:08:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(501, 7, 0, 34, 'Genetics', '2017-06-11 06:08:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(502, 7, 0, 34, 'Neoplasm-I', '2017-06-11 06:08:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(503, 7, 0, 34, 'Neoplasm-II', '2017-06-11 06:08:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(504, 7, 0, 34, 'Repair, Regeneration, Healing & Hem', '2017-06-11 06:08:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(505, 7, 0, 34, 'Immunology-I', '2017-06-11 06:08:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(506, 7, 0, 34, 'Immunology-II', '2017-06-11 06:08:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(507, 7, 0, 34, 'Respiratory System', '2017-06-11 06:08:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(508, 7, 0, 34, 'General Physiology', '2017-06-11 06:08:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(509, 7, 0, 34, 'Renal System', '2017-06-11 06:08:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(510, 7, 0, 34, 'Body Fluid, Acid Base Balance .....', '2017-06-11 06:08:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(511, 7, 0, 34, 'Blood', '2017-06-11 06:08:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(512, 7, 0, 34, 'Haematology', '2017-06-11 06:08:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(513, 7, 0, 32, 'Parasitology', '2017-06-11 06:09:07', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(514, 7, 0, 32, 'Mycology', '2017-06-11 06:09:07', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(515, 7, 0, 32, 'Gen: Bacteriology', '2017-06-11 06:09:07', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(516, 7, 0, 32, 'Sys: Bacteriology', '2017-06-11 06:09:07', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(517, 7, 0, 32, 'Abdomen-I', '2017-06-11 06:09:07', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(518, 7, 0, 32, 'Abdomen-II', '2017-06-11 06:09:07', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(519, 7, 0, 32, 'Head Neck', '2017-06-11 06:09:07', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(520, 7, 0, 32, 'Thorax', '2017-06-11 06:09:07', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(521, 7, 0, 32, 'Extremity-I', '2017-06-11 06:09:07', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(522, 7, 0, 32, 'Extremity-II', '2017-06-11 06:09:07', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(523, 7, 0, 32, 'Embryology-I', '2017-06-11 06:09:07', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(524, 7, 0, 32, 'Embryology-II', '2017-06-11 06:09:07', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(525, 7, 0, 32, 'Histology-I', '2017-06-11 06:09:07', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(526, 7, 0, 32, 'Histology-II', '2017-06-11 06:09:07', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(527, 7, 0, 32, 'Endocrinology-I', '2017-06-11 06:09:07', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(528, 7, 0, 32, 'Endocrinology-II', '2017-06-11 06:09:07', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(529, 7, 0, 32, 'Neuroanatomy', '2017-06-11 06:09:07', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(530, 7, 0, 32, 'Nervous System', '2017-06-11 06:09:07', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(531, 7, 0, 32, 'Gen: Pharmacology', '2017-06-11 06:09:07', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(532, 7, 0, 32, 'Sys: Pharmacology', '2017-06-11 06:09:07', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(533, 7, 0, 32, 'GIT Physiology', '2017-06-11 06:09:07', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(534, 7, 0, 32, 'Metabolism, Vitamins & Minerals', '2017-06-11 06:09:07', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(535, 7, 0, 32, 'CVS Physiology-I', '2017-06-11 06:09:07', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(536, 7, 0, 32, 'CVS Physiology-II', '2017-06-11 06:09:07', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(537, 7, 0, 32, 'Cell Injury & Adaptation', '2017-06-11 06:09:07', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(538, 7, 0, 32, 'Genetics', '2017-06-11 06:09:07', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(539, 7, 0, 32, 'Neoplasm-I', '2017-06-11 06:09:07', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(540, 7, 0, 32, 'Neoplasm-II', '2017-06-11 06:09:07', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(541, 7, 0, 32, 'Repair, Regeneration, Healing & Hem', '2017-06-11 06:09:07', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(542, 7, 0, 32, 'Immunology-I', '2017-06-11 06:09:07', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(543, 7, 0, 32, 'Immunology-II', '2017-06-11 06:09:07', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(544, 7, 0, 32, 'Respiratory System', '2017-06-11 06:09:07', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(545, 7, 0, 32, 'General Physiology', '2017-06-11 06:09:07', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(546, 7, 0, 32, 'Renal System', '2017-06-11 06:09:07', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(547, 7, 0, 32, 'Body Fluid, Acid Base Balance .....', '2017-06-11 06:09:07', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(548, 7, 0, 32, 'Blood', '2017-06-11 06:09:07', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(549, 7, 0, 32, 'Haematology', '2017-06-11 06:09:07', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(550, 7, 0, 55, 'Parasitology', '2017-06-11 06:09:39', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(551, 7, 0, 55, 'Mycology', '2017-06-11 06:09:39', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(552, 7, 0, 55, 'Gen: Bacteriology', '2017-06-11 06:09:39', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(553, 7, 0, 55, 'Sys: Bacteriology', '2017-06-11 06:09:39', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(554, 7, 0, 55, 'Abdomen-I', '2017-06-11 06:09:39', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(555, 7, 0, 55, 'Abdomen-II', '2017-06-11 06:09:39', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(556, 7, 0, 55, 'Head Neck', '2017-06-11 06:09:39', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(557, 7, 0, 55, 'Thorax', '2017-06-11 06:09:39', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(558, 7, 0, 55, 'Extremity-I', '2017-06-11 06:09:39', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(559, 7, 0, 55, 'Extremity-II', '2017-06-11 06:09:39', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(560, 7, 0, 55, 'Embryology-I', '2017-06-11 06:09:39', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(561, 7, 0, 55, 'Embryology-II', '2017-06-11 06:09:39', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(562, 7, 0, 55, 'Histology-I', '2017-06-11 06:09:39', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(563, 7, 0, 55, 'Histology-II', '2017-06-11 06:09:39', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(564, 7, 0, 55, 'Endocrinology-I', '2017-06-11 06:09:39', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(565, 7, 0, 55, 'Endocrinology-II', '2017-06-11 06:09:39', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(566, 7, 0, 55, 'Neuroanatomy', '2017-06-11 06:09:40', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(567, 7, 0, 55, 'Nervous System', '2017-06-11 06:09:40', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(568, 7, 0, 55, 'Gen: Pharmacology', '2017-06-11 06:09:40', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(569, 7, 0, 55, 'Sys: Pharmacology', '2017-06-11 06:09:40', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(570, 7, 0, 55, 'GIT Physiology', '2017-06-11 06:09:40', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(571, 7, 0, 55, 'Metabolism, Vitamins & Minerals', '2017-06-11 06:09:40', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(572, 7, 0, 55, 'CVS Physiology-I', '2017-06-11 06:09:40', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(573, 7, 0, 55, 'CVS Physiology-II', '2017-06-11 06:09:40', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(574, 7, 0, 55, 'Cell Injury & Adaptation', '2017-06-11 06:09:40', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(575, 7, 0, 55, 'Genetics', '2017-06-11 06:09:40', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(576, 7, 0, 55, 'Neoplasm-I', '2017-06-11 06:09:40', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(577, 7, 0, 55, 'Neoplasm-II', '2017-06-11 06:09:40', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(578, 7, 0, 55, 'Repair, Regeneration, Healing & Hem', '2017-06-11 06:09:40', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(579, 7, 0, 55, 'Immunology-I', '2017-06-11 06:09:40', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(580, 7, 0, 55, 'Immunology-II', '2017-06-11 06:09:40', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(581, 7, 0, 55, 'Respiratory System', '2017-06-11 06:09:40', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(582, 7, 0, 55, 'General Physiology', '2017-06-11 06:09:40', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(583, 7, 0, 55, 'Renal System', '2017-06-11 06:09:40', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(584, 7, 0, 55, 'Body Fluid, Acid Base Balance .....', '2017-06-11 06:09:40', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(585, 7, 0, 55, 'Blood', '2017-06-11 06:09:40', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(586, 7, 0, 55, 'Haematology', '2017-06-11 06:09:40', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(587, 7, 0, 36, 'Parasitology', '2017-06-11 06:10:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(588, 7, 0, 36, 'Mycology', '2017-06-11 06:10:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(589, 7, 0, 36, 'Gen: Bacteriology', '2017-06-11 06:10:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(590, 7, 0, 36, 'Sys: Bacteriology', '2017-06-11 06:10:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(591, 7, 0, 36, 'Abdomen-I', '2017-06-11 06:10:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(592, 7, 0, 36, 'Abdomen-II', '2017-06-11 06:10:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(593, 7, 0, 36, 'Head Neck', '2017-06-11 06:10:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(594, 7, 0, 36, 'Thorax', '2017-06-11 06:10:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(595, 7, 0, 36, 'Extremity-I', '2017-06-11 06:10:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(596, 7, 0, 36, 'Extremity-II', '2017-06-11 06:10:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(597, 7, 0, 36, 'Embryology-I', '2017-06-11 06:10:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(598, 7, 0, 36, 'Embryology-II', '2017-06-11 06:10:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(599, 7, 0, 36, 'Histology-I', '2017-06-11 06:10:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(600, 7, 0, 36, 'Histology-II', '2017-06-11 06:10:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(601, 7, 0, 36, 'Endocrinology-I', '2017-06-11 06:10:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(602, 7, 0, 36, 'Endocrinology-II', '2017-06-11 06:10:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(603, 7, 0, 36, 'Neuroanatomy', '2017-06-11 06:10:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(604, 7, 0, 36, 'Nervous System', '2017-06-11 06:10:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(605, 7, 0, 36, 'Gen: Pharmacology', '2017-06-11 06:10:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(606, 7, 0, 36, 'Sys: Pharmacology', '2017-06-11 06:10:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(607, 7, 0, 36, 'GIT Physiology', '2017-06-11 06:10:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(608, 7, 0, 36, 'Metabolism, Vitamins & Minerals', '2017-06-11 06:10:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(609, 7, 0, 36, 'CVS Physiology-I', '2017-06-11 06:10:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(610, 7, 0, 36, 'CVS Physiology-II', '2017-06-11 06:10:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(611, 7, 0, 36, 'Cell Injury & Adaptation', '2017-06-11 06:10:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(612, 7, 0, 36, 'Genetics', '2017-06-11 06:10:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(613, 7, 0, 36, 'Neoplasm-I', '2017-06-11 06:10:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(614, 7, 0, 36, 'Neoplasm-II', '2017-06-11 06:10:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(615, 7, 0, 36, 'Repair, Regeneration, Healing & Hem', '2017-06-11 06:10:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(616, 7, 0, 36, 'Immunology-I', '2017-06-11 06:10:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(617, 7, 0, 36, 'Immunology-II', '2017-06-11 06:10:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(618, 7, 0, 36, 'Respiratory System', '2017-06-11 06:10:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(619, 7, 0, 36, 'General Physiology', '2017-06-11 06:10:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(620, 7, 0, 36, 'Renal System', '2017-06-11 06:10:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(621, 7, 0, 36, 'Body Fluid, Acid Base Balance .....', '2017-06-11 06:10:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(622, 7, 0, 36, 'Blood', '2017-06-11 06:10:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(623, 7, 0, 36, 'Haematology', '2017-06-11 06:10:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(624, 7, 0, 57, 'Parasitology', '2017-06-11 06:10:38', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(625, 7, 0, 57, 'Mycology', '2017-06-11 06:10:38', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(626, 7, 0, 57, 'Gen: Bacteriology', '2017-06-11 06:10:38', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(627, 7, 0, 57, 'Sys: Bacteriology', '2017-06-11 06:10:38', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(628, 7, 0, 57, 'Abdomen-I', '2017-06-11 06:10:38', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(629, 7, 0, 57, 'Abdomen-II', '2017-06-11 06:10:38', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(630, 7, 0, 57, 'Head Neck', '2017-06-11 06:10:38', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(631, 7, 0, 57, 'Thorax', '2017-06-11 06:10:38', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(632, 7, 0, 57, 'Extremity-I', '2017-06-11 06:10:38', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(633, 7, 0, 57, 'Extremity-II', '2017-06-11 06:10:39', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(634, 7, 0, 57, 'Embryology-I', '2017-06-11 06:10:39', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(635, 7, 0, 57, 'Embryology-II', '2017-06-11 06:10:39', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(636, 7, 0, 57, 'Histology-I', '2017-06-11 06:10:39', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(637, 7, 0, 57, 'Histology-II', '2017-06-11 06:10:39', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(638, 7, 0, 57, 'Endocrinology-I', '2017-06-11 06:10:39', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(639, 7, 0, 57, 'Endocrinology-II', '2017-06-11 06:10:39', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(640, 7, 0, 57, 'Neuroanatomy', '2017-06-11 06:10:39', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(641, 7, 0, 57, 'Nervous System', '2017-06-11 06:10:39', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(642, 7, 0, 57, 'Gen: Pharmacology', '2017-06-11 06:10:39', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(643, 7, 0, 57, 'Sys: Pharmacology', '2017-06-11 06:10:39', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(644, 7, 0, 57, 'GIT Physiology', '2017-06-11 06:10:39', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(645, 7, 0, 57, 'Metabolism, Vitamins & Minerals', '2017-06-11 06:10:39', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(646, 7, 0, 57, 'CVS Physiology-I', '2017-06-11 06:10:39', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(647, 7, 0, 57, 'CVS Physiology-II', '2017-06-11 06:10:39', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(648, 7, 0, 57, 'Cell Injury & Adaptation', '2017-06-11 06:10:39', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(649, 7, 0, 57, 'Genetics', '2017-06-11 06:10:39', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(650, 7, 0, 57, 'Neoplasm-I', '2017-06-11 06:10:39', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(651, 7, 0, 57, 'Neoplasm-II', '2017-06-11 06:10:39', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(652, 7, 0, 57, 'Repair, Regeneration, Healing & Hem', '2017-06-11 06:10:39', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(653, 7, 0, 57, 'Immunology-I', '2017-06-11 06:10:39', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(654, 7, 0, 57, 'Immunology-II', '2017-06-11 06:10:39', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(655, 7, 0, 57, 'Respiratory System', '2017-06-11 06:10:39', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(656, 7, 0, 57, 'General Physiology', '2017-06-11 06:10:39', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(657, 7, 0, 57, 'Renal System', '2017-06-11 06:10:39', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(658, 7, 0, 57, 'Body Fluid, Acid Base Balance .....', '2017-06-11 06:10:39', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(659, 7, 0, 57, 'Blood', '2017-06-11 06:10:39', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(660, 7, 0, 57, 'Haematology', '2017-06-11 06:10:39', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(661, 7, 0, 33, 'Parasitology', '2017-06-11 06:11:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(662, 7, 0, 33, 'Mycology', '2017-06-11 06:11:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(663, 7, 0, 33, 'Gen: Bacteriology', '2017-06-11 06:11:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(664, 7, 0, 33, 'Sys: Bacteriology', '2017-06-11 06:11:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(665, 7, 0, 33, 'Abdomen-I', '2017-06-11 06:11:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(666, 7, 0, 33, 'Abdomen-II', '2017-06-11 06:11:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(667, 7, 0, 33, 'Head Neck', '2017-06-11 06:11:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(668, 7, 0, 33, 'Thorax', '2017-06-11 06:11:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(669, 7, 0, 33, 'Extremity-I', '2017-06-11 06:11:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(670, 7, 0, 33, 'Extremity-II', '2017-06-11 06:11:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(671, 7, 0, 33, 'Embryology-I', '2017-06-11 06:11:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(672, 7, 0, 33, 'Embryology-II', '2017-06-11 06:11:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(673, 7, 0, 33, 'Histology-I', '2017-06-11 06:11:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(674, 7, 0, 33, 'Histology-II', '2017-06-11 06:11:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(675, 7, 0, 33, 'Endocrinology-I', '2017-06-11 06:11:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(676, 7, 0, 33, 'Endocrinology-II', '2017-06-11 06:11:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(677, 7, 0, 33, 'Neuroanatomy', '2017-06-11 06:11:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(678, 7, 0, 33, 'Nervous System', '2017-06-11 06:11:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(679, 7, 0, 33, 'Gen: Pharmacology', '2017-06-11 06:11:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(680, 7, 0, 33, 'Sys: Pharmacology', '2017-06-11 06:11:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(681, 7, 0, 33, 'GIT Physiology', '2017-06-11 06:11:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(682, 7, 0, 33, 'Metabolism, Vitamins & Minerals', '2017-06-11 06:11:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(683, 7, 0, 33, 'CVS Physiology-I', '2017-06-11 06:11:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(684, 7, 0, 33, 'CVS Physiology-II', '2017-06-11 06:11:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(685, 7, 0, 33, 'Cell Injury & Adaptation', '2017-06-11 06:11:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(686, 7, 0, 33, 'Genetics', '2017-06-11 06:11:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(687, 7, 0, 33, 'Neoplasm-I', '2017-06-11 06:11:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(688, 7, 0, 33, 'Neoplasm-II', '2017-06-11 06:11:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(689, 7, 0, 33, 'Repair, Regeneration, Healing & Hem', '2017-06-11 06:11:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(690, 7, 0, 33, 'Immunology-I', '2017-06-11 06:11:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(691, 7, 0, 33, 'Immunology-II', '2017-06-11 06:11:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(692, 7, 0, 33, 'Respiratory System', '2017-06-11 06:11:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(693, 7, 0, 33, 'General Physiology', '2017-06-11 06:11:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(694, 7, 0, 33, 'Renal System', '2017-06-11 06:11:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(695, 7, 0, 33, 'Body Fluid, Acid Base Balance .....', '2017-06-11 06:11:07', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(696, 7, 0, 33, 'Blood', '2017-06-11 06:11:07', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(697, 7, 0, 33, 'Haematology', '2017-06-11 06:11:07', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(698, 7, 0, 28, 'Parasitology', '2017-06-11 06:11:38', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(699, 7, 0, 28, 'Mycology', '2017-06-11 06:11:38', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(700, 7, 0, 28, 'Gen: Bacteriology', '2017-06-11 06:11:38', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(701, 7, 0, 28, 'Sys: Bacteriology', '2017-06-11 06:11:38', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(702, 7, 0, 28, 'Abdomen-I', '2017-06-11 06:11:38', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(703, 7, 0, 28, 'Abdomen-II', '2017-06-11 06:11:38', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(704, 7, 0, 28, 'Head Neck', '2017-06-11 06:11:38', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(705, 7, 0, 28, 'Thorax', '2017-06-11 06:11:38', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(706, 7, 0, 28, 'Extremity-I', '2017-06-11 06:11:38', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(707, 7, 0, 28, 'Extremity-II', '2017-06-11 06:11:38', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(708, 7, 0, 28, 'Embryology-I', '2017-06-11 06:11:38', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(709, 7, 0, 28, 'Embryology-II', '2017-06-11 06:11:38', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(710, 7, 0, 28, 'Histology-I', '2017-06-11 06:11:38', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(711, 7, 0, 28, 'Histology-II', '2017-06-11 06:11:38', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(712, 7, 0, 28, 'Endocrinology-I', '2017-06-11 06:11:38', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(713, 7, 0, 28, 'Endocrinology-II', '2017-06-11 06:11:38', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(714, 7, 0, 28, 'Neuroanatomy', '2017-06-11 06:11:38', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(715, 7, 0, 28, 'Nervous System', '2017-06-11 06:11:38', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(716, 7, 0, 28, 'Gen: Pharmacology', '2017-06-11 06:11:38', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(717, 7, 0, 28, 'Sys: Pharmacology', '2017-06-11 06:11:38', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(718, 7, 0, 28, 'GIT Physiology', '2017-06-11 06:11:38', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(719, 7, 0, 28, 'Metabolism, Vitamins & Minerals', '2017-06-11 06:11:38', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(720, 7, 0, 28, 'CVS Physiology-I', '2017-06-11 06:11:38', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(721, 7, 0, 28, 'CVS Physiology-II', '2017-06-11 06:11:38', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(722, 7, 0, 28, 'Cell Injury & Adaptation', '2017-06-11 06:11:38', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(723, 7, 0, 28, 'Genetics', '2017-06-11 06:11:38', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(724, 7, 0, 28, 'Neoplasm-I', '2017-06-11 06:11:38', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(725, 7, 0, 28, 'Neoplasm-II', '2017-06-11 06:11:38', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(726, 7, 0, 28, 'Repair, Regeneration, Healing & Hem', '2017-06-11 06:11:38', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(727, 7, 0, 28, 'Immunology-I', '2017-06-11 06:11:38', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(728, 7, 0, 28, 'Immunology-II', '2017-06-11 06:11:38', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(729, 7, 0, 28, 'Respiratory System', '2017-06-11 06:11:38', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(730, 7, 0, 28, 'General Physiology', '2017-06-11 06:11:38', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(731, 7, 0, 28, 'Renal System', '2017-06-11 06:11:38', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(732, 7, 0, 28, 'Body Fluid, Acid Base Balance .....', '2017-06-11 06:11:38', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(733, 7, 0, 28, 'Blood', '2017-06-11 06:11:38', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(734, 7, 0, 28, 'Haematology', '2017-06-11 06:11:38', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(735, 7, 0, 70, 'Parasitology', '2017-06-11 06:12:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(736, 7, 0, 70, 'Mycology', '2017-06-11 06:12:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(737, 7, 0, 70, 'Gen: Bacteriology', '2017-06-11 06:12:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(738, 7, 0, 70, 'Sys: Bacteriology', '2017-06-11 06:12:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(739, 7, 0, 70, 'Abdomen-I', '2017-06-11 06:12:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(740, 7, 0, 70, 'Abdomen-II', '2017-06-11 06:12:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(741, 7, 0, 70, 'Head Neck', '2017-06-11 06:12:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(742, 7, 0, 70, 'Thorax', '2017-06-11 06:12:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(743, 7, 0, 70, 'Extremity-I', '2017-06-11 06:12:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(744, 7, 0, 70, 'Extremity-II', '2017-06-11 06:12:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(745, 7, 0, 70, 'Embryology-I', '2017-06-11 06:12:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(746, 7, 0, 70, 'Embryology-II', '2017-06-11 06:12:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(747, 7, 0, 70, 'Histology-I', '2017-06-11 06:12:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(748, 7, 0, 70, 'Histology-II', '2017-06-11 06:12:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(749, 7, 0, 70, 'Endocrinology-I', '2017-06-11 06:12:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(750, 7, 0, 70, 'Endocrinology-II', '2017-06-11 06:12:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(751, 7, 0, 70, 'Neuroanatomy', '2017-06-11 06:12:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(752, 7, 0, 70, 'Nervous System', '2017-06-11 06:12:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(753, 7, 0, 70, 'Gen: Pharmacology', '2017-06-11 06:12:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(754, 7, 0, 70, 'Sys: Pharmacology', '2017-06-11 06:12:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(755, 7, 0, 70, 'GIT Physiology', '2017-06-11 06:12:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(756, 7, 0, 70, 'Metabolism, Vitamins & Minerals', '2017-06-11 06:12:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(757, 7, 0, 70, 'CVS Physiology-I', '2017-06-11 06:12:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(758, 7, 0, 70, 'CVS Physiology-II', '2017-06-11 06:12:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(759, 7, 0, 70, 'Cell Injury & Adaptation', '2017-06-11 06:12:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(760, 7, 0, 70, 'Genetics', '2017-06-11 06:12:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(761, 7, 0, 70, 'Neoplasm-I', '2017-06-11 06:12:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(762, 7, 0, 70, 'Neoplasm-II', '2017-06-11 06:12:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(763, 7, 0, 70, 'Repair, Regeneration, Healing & Hem', '2017-06-11 06:12:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(764, 7, 0, 70, 'Immunology-I', '2017-06-11 06:12:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(765, 7, 0, 70, 'Immunology-II', '2017-06-11 06:12:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(766, 7, 0, 70, 'Respiratory System', '2017-06-11 06:12:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(767, 7, 0, 70, 'General Physiology', '2017-06-11 06:12:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(768, 7, 0, 70, 'Renal System', '2017-06-11 06:12:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(769, 7, 0, 70, 'Body Fluid, Acid Base Balance .....', '2017-06-11 06:12:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(770, 7, 0, 70, 'Blood', '2017-06-11 06:12:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(771, 7, 0, 70, 'Haematology', '2017-06-11 06:12:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(772, 7, 0, 72, 'Parasitology', '2017-06-11 06:13:03', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(773, 7, 0, 72, 'Mycology', '2017-06-11 06:13:03', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(774, 7, 0, 72, 'Gen: Bacteriology', '2017-06-11 06:13:03', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(775, 7, 0, 72, 'Sys: Bacteriology', '2017-06-11 06:13:03', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(776, 7, 0, 72, 'Abdomen-I', '2017-06-11 06:13:03', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(777, 7, 0, 72, 'Abdomen-II', '2017-06-11 06:13:03', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(778, 7, 0, 72, 'Head Neck', '2017-06-11 06:13:03', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(779, 7, 0, 72, 'Thorax', '2017-06-11 06:13:03', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(780, 7, 0, 72, 'Extremity-I', '2017-06-11 06:13:03', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(781, 7, 0, 72, 'Extremity-II', '2017-06-11 06:13:03', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(782, 7, 0, 72, 'Embryology-I', '2017-06-11 06:13:03', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(783, 7, 0, 72, 'Embryology-II', '2017-06-11 06:13:04', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(784, 7, 0, 72, 'Histology-I', '2017-06-11 06:13:04', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(785, 7, 0, 72, 'Histology-II', '2017-06-11 06:13:04', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(786, 7, 0, 72, 'Endocrinology-I', '2017-06-11 06:13:04', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(787, 7, 0, 72, 'Endocrinology-II', '2017-06-11 06:13:04', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(788, 7, 0, 72, 'Neuroanatomy', '2017-06-11 06:13:04', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(789, 7, 0, 72, 'Nervous System', '2017-06-11 06:13:04', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(790, 7, 0, 72, 'Gen: Pharmacology', '2017-06-11 06:13:04', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(791, 7, 0, 72, 'Sys: Pharmacology', '2017-06-11 06:13:04', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(792, 7, 0, 72, 'GIT Physiology', '2017-06-11 06:13:04', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(793, 7, 0, 72, 'Metabolism, Vitamins & Minerals', '2017-06-11 06:13:04', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(794, 7, 0, 72, 'CVS Physiology-I', '2017-06-11 06:13:04', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(795, 7, 0, 72, 'CVS Physiology-II', '2017-06-11 06:13:04', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(796, 7, 0, 72, 'Cell Injury & Adaptation', '2017-06-11 06:13:04', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(797, 7, 0, 72, 'Genetics', '2017-06-11 06:13:04', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(798, 7, 0, 72, 'Neoplasm-I', '2017-06-11 06:13:04', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(799, 7, 0, 72, 'Neoplasm-II', '2017-06-11 06:13:04', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(800, 7, 0, 72, 'Repair, Regeneration, Healing & Hem', '2017-06-11 06:13:04', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(801, 7, 0, 72, 'Immunology-I', '2017-06-11 06:13:04', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(802, 7, 0, 72, 'Immunology-II', '2017-06-11 06:13:04', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(803, 7, 0, 72, 'Respiratory System', '2017-06-11 06:13:04', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(804, 7, 0, 72, 'General Physiology', '2017-06-11 06:13:04', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(805, 7, 0, 72, 'Renal System', '2017-06-11 06:13:04', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(806, 7, 0, 72, 'Body Fluid, Acid Base Balance .....', '2017-06-11 06:13:04', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(807, 7, 0, 72, 'Blood', '2017-06-11 06:13:04', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(808, 7, 0, 72, 'Haematology', '2017-06-11 06:13:04', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(809, 7, 0, 40, 'Parasitology', '2017-06-11 06:13:50', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(810, 7, 0, 40, 'Mycology', '2017-06-11 06:13:50', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(811, 7, 0, 40, 'Gen: Bacteriology', '2017-06-11 06:13:50', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(812, 7, 0, 40, 'Sys: Bacteriology', '2017-06-11 06:13:50', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(813, 7, 0, 40, 'Abdomen-I', '2017-06-11 06:13:50', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(814, 7, 0, 40, 'Abdomen-II', '2017-06-11 06:13:50', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(815, 7, 0, 40, 'Head Neck', '2017-06-11 06:13:50', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(816, 7, 0, 40, 'Thorax', '2017-06-11 06:13:51', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(817, 7, 0, 40, 'Extremity-I', '2017-06-11 06:13:51', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(818, 7, 0, 40, 'Extremity-II', '2017-06-11 06:13:51', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(819, 7, 0, 40, 'Embryology-I', '2017-06-11 06:13:51', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(820, 7, 0, 40, 'Embryology-II', '2017-06-11 06:13:51', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(821, 7, 0, 40, 'Histology-I', '2017-06-11 06:13:51', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(822, 7, 0, 40, 'Histology-II', '2017-06-11 06:13:51', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(823, 7, 0, 40, 'Endocrinology-I', '2017-06-11 06:13:51', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(824, 7, 0, 40, 'Endocrinology-II', '2017-06-11 06:13:51', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(825, 7, 0, 40, 'Neuroanatomy', '2017-06-11 06:13:51', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(826, 7, 0, 40, 'Nervous System', '2017-06-11 06:13:51', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(827, 7, 0, 40, 'Gen: Pharmacology', '2017-06-11 06:13:51', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(828, 7, 0, 40, 'Sys: Pharmacology', '2017-06-11 06:13:51', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(829, 7, 0, 40, 'GIT Physiology', '2017-06-11 06:13:51', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(830, 7, 0, 40, 'Metabolism, Vitamins & Minerals', '2017-06-11 06:13:51', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(831, 7, 0, 40, 'CVS Physiology-I', '2017-06-11 06:13:51', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(832, 7, 0, 40, 'CVS Physiology-II', '2017-06-11 06:13:51', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(833, 7, 0, 40, 'Cell Injury & Adaptation', '2017-06-11 06:13:51', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(834, 7, 0, 40, 'Genetics', '2017-06-11 06:13:51', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(835, 7, 0, 40, 'Neoplasm-I', '2017-06-11 06:13:51', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(836, 7, 0, 40, 'Neoplasm-II', '2017-06-11 06:13:51', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(837, 7, 0, 40, 'Repair, Regeneration, Healing & Hem', '2017-06-11 06:13:51', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(838, 7, 0, 40, 'Immunology-I', '2017-06-11 06:13:51', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(839, 7, 0, 40, 'Immunology-II', '2017-06-11 06:13:51', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(840, 7, 0, 40, 'Respiratory System', '2017-06-11 06:13:51', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(841, 7, 0, 40, 'General Physiology', '2017-06-11 06:13:51', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(842, 7, 0, 40, 'Renal System', '2017-06-11 06:13:51', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(843, 7, 0, 40, 'Body Fluid, Acid Base Balance .....', '2017-06-11 06:13:51', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(844, 7, 0, 40, 'Blood', '2017-06-11 06:13:51', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(845, 7, 0, 40, 'Haematology', '2017-06-11 06:13:51', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(846, 7, 0, 31, 'Parasitology', '2017-06-11 06:14:16', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(847, 7, 0, 31, 'Mycology', '2017-06-11 06:14:16', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(848, 7, 0, 31, 'Gen: Bacteriology', '2017-06-11 06:14:16', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(849, 7, 0, 31, 'Sys: Bacteriology', '2017-06-11 06:14:16', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(850, 7, 0, 31, 'Abdomen-I', '2017-06-11 06:14:16', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(851, 7, 0, 31, 'Abdomen-II', '2017-06-11 06:14:16', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(852, 7, 0, 31, 'Head Neck', '2017-06-11 06:14:16', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(853, 7, 0, 31, 'Thorax', '2017-06-11 06:14:16', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(854, 7, 0, 31, 'Extremity-I', '2017-06-11 06:14:16', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(855, 7, 0, 31, 'Extremity-II', '2017-06-11 06:14:16', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(856, 7, 0, 31, 'Embryology-I', '2017-06-11 06:14:16', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(857, 7, 0, 31, 'Embryology-II', '2017-06-11 06:14:16', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(858, 7, 0, 31, 'Histology-I', '2017-06-11 06:14:16', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(859, 7, 0, 31, 'Histology-II', '2017-06-11 06:14:16', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(860, 7, 0, 31, 'Endocrinology-I', '2017-06-11 06:14:16', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(861, 7, 0, 31, 'Endocrinology-II', '2017-06-11 06:14:16', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(862, 7, 0, 31, 'Neuroanatomy', '2017-06-11 06:14:16', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(863, 7, 0, 31, 'Nervous System', '2017-06-11 06:14:16', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(864, 7, 0, 31, 'Gen: Pharmacology', '2017-06-11 06:14:16', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(865, 7, 0, 31, 'Sys: Pharmacology', '2017-06-11 06:14:16', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(866, 7, 0, 31, 'GIT Physiology', '2017-06-11 06:14:17', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(867, 7, 0, 31, 'Metabolism, Vitamins & Minerals', '2017-06-11 06:14:17', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(868, 7, 0, 31, 'CVS Physiology-I', '2017-06-11 06:14:17', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(869, 7, 0, 31, 'CVS Physiology-II', '2017-06-11 06:14:17', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(870, 7, 0, 31, 'Cell Injury & Adaptation', '2017-06-11 06:14:17', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(871, 7, 0, 31, 'Genetics', '2017-06-11 06:14:17', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(872, 7, 0, 31, 'Neoplasm-I', '2017-06-11 06:14:17', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(873, 7, 0, 31, 'Neoplasm-II', '2017-06-11 06:14:17', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(874, 7, 0, 31, 'Repair, Regeneration, Healing & Hem', '2017-06-11 06:14:17', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(875, 7, 0, 31, 'Immunology-I', '2017-06-11 06:14:17', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(876, 7, 0, 31, 'Immunology-II', '2017-06-11 06:14:17', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(877, 7, 0, 31, 'Respiratory System', '2017-06-11 06:14:17', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(878, 7, 0, 31, 'General Physiology', '2017-06-11 06:14:17', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(879, 7, 0, 31, 'Renal System', '2017-06-11 06:14:17', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(880, 7, 0, 31, 'Body Fluid, Acid Base Balance .....', '2017-06-11 06:14:17', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(881, 7, 0, 31, 'Blood', '2017-06-11 06:14:17', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(882, 7, 0, 31, 'Haematology', '2017-06-11 06:14:17', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(883, 7, 0, 56, 'Parasitology', '2017-06-11 06:14:45', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(884, 7, 0, 56, 'Mycology', '2017-06-11 06:14:45', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(885, 7, 0, 56, 'Gen: Bacteriology', '2017-06-11 06:14:45', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(886, 7, 0, 56, 'Sys: Bacteriology', '2017-06-11 06:14:45', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(887, 7, 0, 56, 'Abdomen-I', '2017-06-11 06:14:45', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(888, 7, 0, 56, 'Abdomen-II', '2017-06-11 06:14:45', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(889, 7, 0, 56, 'Head Neck', '2017-06-11 06:14:45', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(890, 7, 0, 56, 'Thorax', '2017-06-11 06:14:45', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(891, 7, 0, 56, 'Extremity-I', '2017-06-11 06:14:45', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(892, 7, 0, 56, 'Extremity-II', '2017-06-11 06:14:45', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(893, 7, 0, 56, 'Embryology-I', '2017-06-11 06:14:45', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(894, 7, 0, 56, 'Embryology-II', '2017-06-11 06:14:45', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(895, 7, 0, 56, 'Histology-I', '2017-06-11 06:14:45', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(896, 7, 0, 56, 'Histology-II', '2017-06-11 06:14:45', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(897, 7, 0, 56, 'Endocrinology-I', '2017-06-11 06:14:45', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(898, 7, 0, 56, 'Endocrinology-II', '2017-06-11 06:14:45', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(899, 7, 0, 56, 'Neuroanatomy', '2017-06-11 06:14:45', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(900, 7, 0, 56, 'Nervous System', '2017-06-11 06:14:45', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(901, 7, 0, 56, 'Gen: Pharmacology', '2017-06-11 06:14:45', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(902, 7, 0, 56, 'Sys: Pharmacology', '2017-06-11 06:14:45', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(903, 7, 0, 56, 'GIT Physiology', '2017-06-11 06:14:45', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(904, 7, 0, 56, 'Metabolism, Vitamins & Minerals', '2017-06-11 06:14:45', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(905, 7, 0, 56, 'CVS Physiology-I', '2017-06-11 06:14:45', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(906, 7, 0, 56, 'CVS Physiology-II', '2017-06-11 06:14:45', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(907, 7, 0, 56, 'Cell Injury & Adaptation', '2017-06-11 06:14:45', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(908, 7, 0, 56, 'Genetics', '2017-06-11 06:14:45', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(909, 7, 0, 56, 'Neoplasm-I', '2017-06-11 06:14:45', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(910, 7, 0, 56, 'Neoplasm-II', '2017-06-11 06:14:45', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(911, 7, 0, 56, 'Repair, Regeneration, Healing & Hem', '2017-06-11 06:14:45', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(912, 7, 0, 56, 'Immunology-I', '2017-06-11 06:14:45', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(913, 7, 0, 56, 'Immunology-II', '2017-06-11 06:14:45', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(914, 7, 0, 56, 'Respiratory System', '2017-06-11 06:14:45', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(915, 7, 0, 56, 'General Physiology', '2017-06-11 06:14:45', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(916, 7, 0, 56, 'Renal System', '2017-06-11 06:14:45', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(917, 7, 0, 56, 'Body Fluid, Acid Base Balance .....', '2017-06-11 06:14:45', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(918, 7, 0, 56, 'Blood', '2017-06-11 06:14:45', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(919, 7, 0, 56, 'Haematology', '2017-06-11 06:14:45', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(920, 7, 0, 30, 'Parasitology', '2017-06-11 06:15:12', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(921, 7, 0, 30, 'Mycology', '2017-06-11 06:15:12', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(922, 7, 0, 30, 'Gen: Bacteriology', '2017-06-11 06:15:12', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(923, 7, 0, 30, 'Sys: Bacteriology', '2017-06-11 06:15:12', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(924, 7, 0, 30, 'Abdomen-I', '2017-06-11 06:15:12', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(925, 7, 0, 30, 'Abdomen-II', '2017-06-11 06:15:12', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(926, 7, 0, 30, 'Head Neck', '2017-06-11 06:15:12', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(927, 7, 0, 30, 'Thorax', '2017-06-11 06:15:12', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(928, 7, 0, 30, 'Extremity-I', '2017-06-11 06:15:12', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(929, 7, 0, 30, 'Extremity-II', '2017-06-11 06:15:12', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(930, 7, 0, 30, 'Embryology-I', '2017-06-11 06:15:12', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(931, 7, 0, 30, 'Embryology-II', '2017-06-11 06:15:12', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(932, 7, 0, 30, 'Histology-I', '2017-06-11 06:15:12', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(933, 7, 0, 30, 'Histology-II', '2017-06-11 06:15:12', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(934, 7, 0, 30, 'Endocrinology-I', '2017-06-11 06:15:12', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(935, 7, 0, 30, 'Endocrinology-II', '2017-06-11 06:15:12', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1);
INSERT INTO `sif_class_topic` (`id`, `course_code`, `faculty_code`, `subject_id`, `class_topic_name`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`) VALUES
(936, 7, 0, 30, 'Neuroanatomy', '2017-06-11 06:15:12', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(937, 7, 0, 30, 'Nervous System', '2017-06-11 06:15:12', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(938, 7, 0, 30, 'Gen: Pharmacology', '2017-06-11 06:15:12', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(939, 7, 0, 30, 'Sys: Pharmacology', '2017-06-11 06:15:12', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(940, 7, 0, 30, 'GIT Physiology', '2017-06-11 06:15:12', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(941, 7, 0, 30, 'Metabolism, Vitamins & Minerals', '2017-06-11 06:15:12', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(942, 7, 0, 30, 'CVS Physiology-I', '2017-06-11 06:15:12', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(943, 7, 0, 30, 'CVS Physiology-II', '2017-06-11 06:15:12', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(944, 7, 0, 30, 'Cell Injury & Adaptation', '2017-06-11 06:15:12', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(945, 7, 0, 30, 'Genetics', '2017-06-11 06:15:12', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(946, 7, 0, 30, 'Neoplasm-I', '2017-06-11 06:15:12', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(947, 7, 0, 30, 'Neoplasm-II', '2017-06-11 06:15:12', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(948, 7, 0, 30, 'Repair, Regeneration, Healing & Hem', '2017-06-11 06:15:12', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(949, 7, 0, 30, 'Immunology-I', '2017-06-11 06:15:12', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(950, 7, 0, 30, 'Immunology-II', '2017-06-11 06:15:12', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(951, 7, 0, 30, 'Respiratory System', '2017-06-11 06:15:12', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(952, 7, 0, 30, 'General Physiology', '2017-06-11 06:15:12', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(953, 7, 0, 30, 'Renal System', '2017-06-11 06:15:12', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(954, 7, 0, 30, 'Body Fluid, Acid Base Balance .....', '2017-06-11 06:15:12', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(955, 7, 0, 30, 'Blood', '2017-06-11 06:15:12', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(956, 7, 0, 30, 'Haematology', '2017-06-11 06:15:12', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(957, 7, 0, 58, 'Parasitology', '2017-06-11 06:15:58', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(958, 7, 0, 58, 'Mycology', '2017-06-11 06:15:58', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(959, 7, 0, 58, 'Gen: Bacteriology', '2017-06-11 06:15:58', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(960, 7, 0, 58, 'Sys: Bacteriology', '2017-06-11 06:15:58', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(961, 7, 0, 58, 'Abdomen-I', '2017-06-11 06:15:59', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(962, 7, 0, 58, 'Abdomen-II', '2017-06-11 06:15:59', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(963, 7, 0, 58, 'Head Neck', '2017-06-11 06:15:59', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(964, 7, 0, 58, 'Thorax', '2017-06-11 06:15:59', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(965, 7, 0, 58, 'Extremity-I', '2017-06-11 06:15:59', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(966, 7, 0, 58, 'Extremity-II', '2017-06-11 06:15:59', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(967, 7, 0, 58, 'Embryology-I', '2017-06-11 06:15:59', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(968, 7, 0, 58, 'Embryology-II', '2017-06-11 06:15:59', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(969, 7, 0, 58, 'Histology-I', '2017-06-11 06:15:59', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(970, 7, 0, 58, 'Histology-II', '2017-06-11 06:15:59', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(971, 7, 0, 58, 'Endocrinology-I', '2017-06-11 06:15:59', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(972, 7, 0, 58, 'Endocrinology-II', '2017-06-11 06:15:59', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(973, 7, 0, 58, 'Neuroanatomy', '2017-06-11 06:15:59', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(974, 7, 0, 58, 'Nervous System', '2017-06-11 06:15:59', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(975, 7, 0, 58, 'Gen: Pharmacology', '2017-06-11 06:15:59', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(976, 7, 0, 58, 'Sys: Pharmacology', '2017-06-11 06:15:59', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(977, 7, 0, 58, 'GIT Physiology', '2017-06-11 06:15:59', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(978, 7, 0, 58, 'Metabolism, Vitamins & Minerals', '2017-06-11 06:15:59', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(979, 7, 0, 58, 'CVS Physiology-I', '2017-06-11 06:15:59', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(980, 7, 0, 58, 'CVS Physiology-II', '2017-06-11 06:15:59', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(981, 7, 0, 58, 'Cell Injury & Adaptation', '2017-06-11 06:15:59', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(982, 7, 0, 58, 'Genetics', '2017-06-11 06:15:59', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(983, 7, 0, 58, 'Neoplasm-I', '2017-06-11 06:15:59', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(984, 7, 0, 58, 'Neoplasm-II', '2017-06-11 06:15:59', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(985, 7, 0, 58, 'Repair, Regeneration, Healing & Hem', '2017-06-11 06:15:59', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(986, 7, 0, 58, 'Immunology-I', '2017-06-11 06:15:59', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(987, 7, 0, 58, 'Immunology-II', '2017-06-11 06:15:59', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(988, 7, 0, 58, 'Respiratory System', '2017-06-11 06:15:59', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(989, 7, 0, 58, 'General Physiology', '2017-06-11 06:15:59', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(990, 7, 0, 58, 'Renal System', '2017-06-11 06:15:59', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(991, 7, 0, 58, 'Body Fluid, Acid Base Balance .....', '2017-06-11 06:15:59', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(992, 7, 0, 58, 'Blood', '2017-06-11 06:15:59', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(993, 7, 0, 58, 'Haematology', '2017-06-11 06:15:59', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(994, 7, 0, 50, 'Parasitology', '2017-06-11 06:16:23', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(995, 7, 0, 50, 'Mycology', '2017-06-11 06:16:23', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(996, 7, 0, 50, 'Gen: Bacteriology', '2017-06-11 06:16:23', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(997, 7, 0, 50, 'Sys: Bacteriology', '2017-06-11 06:16:23', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(998, 7, 0, 50, 'Abdomen-I', '2017-06-11 06:16:23', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(999, 7, 0, 50, 'Abdomen-II', '2017-06-11 06:16:23', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1000, 7, 0, 50, 'Head Neck', '2017-06-11 06:16:23', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1001, 7, 0, 50, 'Thorax', '2017-06-11 06:16:23', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1002, 7, 0, 50, 'Extremity-I', '2017-06-11 06:16:23', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1003, 7, 0, 50, 'Extremity-II', '2017-06-11 06:16:23', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1004, 7, 0, 50, 'Embryology-I', '2017-06-11 06:16:23', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1005, 7, 0, 50, 'Embryology-II', '2017-06-11 06:16:23', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1006, 7, 0, 50, 'Histology-I', '2017-06-11 06:16:23', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1007, 7, 0, 50, 'Histology-II', '2017-06-11 06:16:23', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1008, 7, 0, 50, 'Endocrinology-I', '2017-06-11 06:16:23', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1009, 7, 0, 50, 'Endocrinology-II', '2017-06-11 06:16:23', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1010, 7, 0, 50, 'Neuroanatomy', '2017-06-11 06:16:23', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1011, 7, 0, 50, 'Nervous System', '2017-06-11 06:16:23', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1012, 7, 0, 50, 'Gen: Pharmacology', '2017-06-11 06:16:23', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1013, 7, 0, 50, 'Sys: Pharmacology', '2017-06-11 06:16:23', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1014, 7, 0, 50, 'GIT Physiology', '2017-06-11 06:16:23', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1015, 7, 0, 50, 'Metabolism, Vitamins & Minerals', '2017-06-11 06:16:23', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1016, 7, 0, 50, 'CVS Physiology-I', '2017-06-11 06:16:23', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1017, 7, 0, 50, 'CVS Physiology-II', '2017-06-11 06:16:23', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1018, 7, 0, 50, 'Cell Injury & Adaptation', '2017-06-11 06:16:23', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1019, 7, 0, 50, 'Genetics', '2017-06-11 06:16:23', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1020, 7, 0, 50, 'Neoplasm-I', '2017-06-11 06:16:23', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1021, 7, 0, 50, 'Neoplasm-II', '2017-06-11 06:16:23', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1022, 7, 0, 50, 'Repair, Regeneration, Healing & Hem', '2017-06-11 06:16:23', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1023, 7, 0, 50, 'Immunology-I', '2017-06-11 06:16:23', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1024, 7, 0, 50, 'Immunology-II', '2017-06-11 06:16:23', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1025, 7, 0, 50, 'Respiratory System', '2017-06-11 06:16:23', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1026, 7, 0, 50, 'General Physiology', '2017-06-11 06:16:23', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1027, 7, 0, 50, 'Renal System', '2017-06-11 06:16:23', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1028, 7, 0, 50, 'Body Fluid, Acid Base Balance .....', '2017-06-11 06:16:23', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1029, 7, 0, 50, 'Blood', '2017-06-11 06:16:23', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1030, 7, 0, 50, 'Haematology', '2017-06-11 06:16:23', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1031, 7, 0, 64, 'Parasitology', '2017-06-11 06:16:49', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1032, 7, 0, 64, 'Mycology', '2017-06-11 06:16:49', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1033, 7, 0, 64, 'Gen: Bacteriology', '2017-06-11 06:16:49', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1034, 7, 0, 64, 'Sys: Bacteriology', '2017-06-11 06:16:49', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1035, 7, 0, 64, 'Abdomen-I', '2017-06-11 06:16:49', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1036, 7, 0, 64, 'Abdomen-II', '2017-06-11 06:16:49', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1037, 7, 0, 64, 'Head Neck', '2017-06-11 06:16:49', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1038, 7, 0, 64, 'Thorax', '2017-06-11 06:16:49', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1039, 7, 0, 64, 'Extremity-I', '2017-06-11 06:16:49', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1040, 7, 0, 64, 'Extremity-II', '2017-06-11 06:16:49', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1041, 7, 0, 64, 'Embryology-I', '2017-06-11 06:16:49', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1042, 7, 0, 64, 'Embryology-II', '2017-06-11 06:16:49', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1043, 7, 0, 64, 'Histology-I', '2017-06-11 06:16:49', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1044, 7, 0, 64, 'Histology-II', '2017-06-11 06:16:49', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1045, 7, 0, 64, 'Endocrinology-I', '2017-06-11 06:16:49', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1046, 7, 0, 64, 'Endocrinology-II', '2017-06-11 06:16:49', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1047, 7, 0, 64, 'Neuroanatomy', '2017-06-11 06:16:49', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1048, 7, 0, 64, 'Nervous System', '2017-06-11 06:16:49', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1049, 7, 0, 64, 'Gen: Pharmacology', '2017-06-11 06:16:49', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1050, 7, 0, 64, 'Sys: Pharmacology', '2017-06-11 06:16:49', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1051, 7, 0, 64, 'GIT Physiology', '2017-06-11 06:16:49', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1052, 7, 0, 64, 'Metabolism, Vitamins & Minerals', '2017-06-11 06:16:49', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1053, 7, 0, 64, 'CVS Physiology-I', '2017-06-11 06:16:49', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1054, 7, 0, 64, 'CVS Physiology-II', '2017-06-11 06:16:49', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1055, 7, 0, 64, 'Cell Injury & Adaptation', '2017-06-11 06:16:49', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1056, 7, 0, 64, 'Genetics', '2017-06-11 06:16:49', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1057, 7, 0, 64, 'Neoplasm-I', '2017-06-11 06:16:49', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1058, 7, 0, 64, 'Neoplasm-II', '2017-06-11 06:16:49', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1059, 7, 0, 64, 'Repair, Regeneration, Healing & Hem', '2017-06-11 06:16:49', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1060, 7, 0, 64, 'Immunology-I', '2017-06-11 06:16:49', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1061, 7, 0, 64, 'Immunology-II', '2017-06-11 06:16:49', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1062, 7, 0, 64, 'Respiratory System', '2017-06-11 06:16:49', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1063, 7, 0, 64, 'General Physiology', '2017-06-11 06:16:49', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1064, 7, 0, 64, 'Renal System', '2017-06-11 06:16:49', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1065, 7, 0, 64, 'Body Fluid, Acid Base Balance .....', '2017-06-11 06:16:49', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1066, 7, 0, 64, 'Blood', '2017-06-11 06:16:49', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1067, 7, 0, 64, 'Haematology', '2017-06-11 06:16:49', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1068, 7, 0, 78, 'Parasitology', '2017-06-11 06:17:18', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1069, 7, 0, 78, 'Mycology', '2017-06-11 06:17:18', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1070, 7, 0, 78, 'Gen: Bacteriology', '2017-06-11 06:17:18', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1071, 7, 0, 78, 'Sys: Bacteriology', '2017-06-11 06:17:18', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1072, 7, 0, 78, 'Abdomen-I', '2017-06-11 06:17:18', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1073, 7, 0, 78, 'Abdomen-II', '2017-06-11 06:17:18', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1074, 7, 0, 78, 'Head Neck', '2017-06-11 06:17:18', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1075, 7, 0, 78, 'Thorax', '2017-06-11 06:17:18', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1076, 7, 0, 78, 'Extremity-I', '2017-06-11 06:17:18', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1077, 7, 0, 78, 'Extremity-II', '2017-06-11 06:17:18', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1078, 7, 0, 78, 'Embryology-I', '2017-06-11 06:17:18', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1079, 7, 0, 78, 'Embryology-II', '2017-06-11 06:17:18', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1080, 7, 0, 78, 'Histology-I', '2017-06-11 06:17:18', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1081, 7, 0, 78, 'Histology-II', '2017-06-11 06:17:18', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1082, 7, 0, 78, 'Endocrinology-I', '2017-06-11 06:17:18', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1083, 7, 0, 78, 'Endocrinology-II', '2017-06-11 06:17:18', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1084, 7, 0, 78, 'Neuroanatomy', '2017-06-11 06:17:18', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1085, 7, 0, 78, 'Nervous System', '2017-06-11 06:17:18', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1086, 7, 0, 78, 'Gen: Pharmacology', '2017-06-11 06:17:18', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1087, 7, 0, 78, 'Sys: Pharmacology', '2017-06-11 06:17:18', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1088, 7, 0, 78, 'GIT Physiology', '2017-06-11 06:17:18', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1089, 7, 0, 78, 'Metabolism, Vitamins & Minerals', '2017-06-11 06:17:18', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1090, 7, 0, 78, 'CVS Physiology-I', '2017-06-11 06:17:18', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1091, 7, 0, 78, 'CVS Physiology-II', '2017-06-11 06:17:18', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1092, 7, 0, 78, 'Cell Injury & Adaptation', '2017-06-11 06:17:18', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1093, 7, 0, 78, 'Genetics', '2017-06-11 06:17:18', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1094, 7, 0, 78, 'Neoplasm-I', '2017-06-11 06:17:18', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1095, 7, 0, 78, 'Neoplasm-II', '2017-06-11 06:17:18', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1096, 7, 0, 78, 'Repair, Regeneration, Healing & Hem', '2017-06-11 06:17:18', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1097, 7, 0, 78, 'Immunology-I', '2017-06-11 06:17:18', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1098, 7, 0, 78, 'Immunology-II', '2017-06-11 06:17:18', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1099, 7, 0, 78, 'Respiratory System', '2017-06-11 06:17:18', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1100, 7, 0, 78, 'General Physiology', '2017-06-11 06:17:18', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1101, 7, 0, 78, 'Renal System', '2017-06-11 06:17:18', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1102, 7, 0, 78, 'Body Fluid, Acid Base Balance .....', '2017-06-11 06:17:18', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1103, 7, 0, 78, 'Blood', '2017-06-11 06:17:18', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1104, 7, 0, 78, 'Haematology', '2017-06-11 06:17:18', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1105, 7, 0, 79, 'Parasitology', '2017-06-11 06:17:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1106, 7, 0, 79, 'Mycology', '2017-06-11 06:17:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1107, 7, 0, 79, 'Gen: Bacteriology', '2017-06-11 06:17:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1108, 7, 0, 79, 'Sys: Bacteriology', '2017-06-11 06:17:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1109, 7, 0, 79, 'Abdomen-I', '2017-06-11 06:17:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1110, 7, 0, 79, 'Abdomen-II', '2017-06-11 06:17:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1111, 7, 0, 79, 'Head Neck', '2017-06-11 06:17:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1112, 7, 0, 79, 'Thorax', '2017-06-11 06:17:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1113, 7, 0, 79, 'Extremity-I', '2017-06-11 06:17:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1114, 7, 0, 79, 'Extremity-II', '2017-06-11 06:17:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1115, 7, 0, 79, 'Embryology-I', '2017-06-11 06:17:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1116, 7, 0, 79, 'Embryology-II', '2017-06-11 06:17:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1117, 7, 0, 79, 'Histology-I', '2017-06-11 06:17:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1118, 7, 0, 79, 'Histology-II', '2017-06-11 06:17:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1119, 7, 0, 79, 'Endocrinology-I', '2017-06-11 06:17:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1120, 7, 0, 79, 'Endocrinology-II', '2017-06-11 06:17:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1121, 7, 0, 79, 'Neuroanatomy', '2017-06-11 06:17:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1122, 7, 0, 79, 'Nervous System', '2017-06-11 06:17:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1123, 7, 0, 79, 'Gen: Pharmacology', '2017-06-11 06:17:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1124, 7, 0, 79, 'Sys: Pharmacology', '2017-06-11 06:17:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1125, 7, 0, 79, 'GIT Physiology', '2017-06-11 06:17:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1126, 7, 0, 79, 'Metabolism, Vitamins & Minerals', '2017-06-11 06:17:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1127, 7, 0, 79, 'CVS Physiology-I', '2017-06-11 06:17:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1128, 7, 0, 79, 'CVS Physiology-II', '2017-06-11 06:17:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1129, 7, 0, 79, 'Cell Injury & Adaptation', '2017-06-11 06:17:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1130, 7, 0, 79, 'Genetics', '2017-06-11 06:17:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1131, 7, 0, 79, 'Neoplasm-I', '2017-06-11 06:17:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1132, 7, 0, 79, 'Neoplasm-II', '2017-06-11 06:17:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1133, 7, 0, 79, 'Repair, Regeneration, Healing & Hem', '2017-06-11 06:17:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1134, 7, 0, 79, 'Immunology-I', '2017-06-11 06:17:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1135, 7, 0, 79, 'Immunology-II', '2017-06-11 06:17:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1136, 7, 0, 79, 'Respiratory System', '2017-06-11 06:17:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1137, 7, 0, 79, 'General Physiology', '2017-06-11 06:17:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1138, 7, 0, 79, 'Renal System', '2017-06-11 06:17:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1139, 7, 0, 79, 'Body Fluid, Acid Base Balance .....', '2017-06-11 06:17:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1140, 7, 0, 79, 'Blood', '2017-06-11 06:17:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1141, 7, 0, 79, 'Haematology', '2017-06-11 06:17:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1142, 7, 0, 59, 'Parasitology', '2017-06-11 06:18:07', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1143, 7, 0, 59, 'Mycology', '2017-06-11 06:18:07', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1144, 7, 0, 59, 'Gen: Bacteriology', '2017-06-11 06:18:07', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1145, 7, 0, 59, 'Sys: Bacteriology', '2017-06-11 06:18:07', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1146, 7, 0, 59, 'Abdomen-I', '2017-06-11 06:18:07', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1147, 7, 0, 59, 'Abdomen-II', '2017-06-11 06:18:08', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1148, 7, 0, 59, 'Head Neck', '2017-06-11 06:18:08', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1149, 7, 0, 59, 'Thorax', '2017-06-11 06:18:08', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1150, 7, 0, 59, 'Extremity-I', '2017-06-11 06:18:08', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1151, 7, 0, 59, 'Extremity-II', '2017-06-11 06:18:08', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1152, 7, 0, 59, 'Embryology-I', '2017-06-11 06:18:08', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1153, 7, 0, 59, 'Embryology-II', '2017-06-11 06:18:08', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1154, 7, 0, 59, 'Histology-I', '2017-06-11 06:18:08', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1155, 7, 0, 59, 'Histology-II', '2017-06-11 06:18:08', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1156, 7, 0, 59, 'Endocrinology-I', '2017-06-11 06:18:08', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1157, 7, 0, 59, 'Endocrinology-II', '2017-06-11 06:18:08', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1158, 7, 0, 59, 'Neuroanatomy', '2017-06-11 06:18:08', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1159, 7, 0, 59, 'Nervous System', '2017-06-11 06:18:08', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1160, 7, 0, 59, 'Gen: Pharmacology', '2017-06-11 06:18:08', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1161, 7, 0, 59, 'Sys: Pharmacology', '2017-06-11 06:18:08', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1162, 7, 0, 59, 'GIT Physiology', '2017-06-11 06:18:08', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1163, 7, 0, 59, 'Metabolism, Vitamins & Minerals', '2017-06-11 06:18:08', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1164, 7, 0, 59, 'CVS Physiology-I', '2017-06-11 06:18:08', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1165, 7, 0, 59, 'CVS Physiology-II', '2017-06-11 06:18:08', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1166, 7, 0, 59, 'Cell Injury & Adaptation', '2017-06-11 06:18:08', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1167, 7, 0, 59, 'Genetics', '2017-06-11 06:18:08', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1168, 7, 0, 59, 'Neoplasm-I', '2017-06-11 06:18:08', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1169, 7, 0, 59, 'Neoplasm-II', '2017-06-11 06:18:08', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1170, 7, 0, 59, 'Repair, Regeneration, Healing & Hem', '2017-06-11 06:18:08', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1171, 7, 0, 59, 'Immunology-I', '2017-06-11 06:18:08', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1172, 7, 0, 59, 'Immunology-II', '2017-06-11 06:18:08', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1173, 7, 0, 59, 'Respiratory System', '2017-06-11 06:18:08', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1174, 7, 0, 59, 'General Physiology', '2017-06-11 06:18:08', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1175, 7, 0, 59, 'Renal System', '2017-06-11 06:18:08', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1176, 7, 0, 59, 'Body Fluid, Acid Base Balance .....', '2017-06-11 06:18:08', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1177, 7, 0, 59, 'Blood', '2017-06-11 06:18:08', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1178, 7, 0, 59, 'Haematology', '2017-06-11 06:18:08', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1179, 7, 0, 66, 'Parasitology', '2017-06-11 06:18:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1180, 7, 0, 66, 'Mycology', '2017-06-11 06:18:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1181, 7, 0, 66, 'Gen: Bacteriology', '2017-06-11 06:18:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1182, 7, 0, 66, 'Sys: Bacteriology', '2017-06-11 06:18:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1183, 7, 0, 66, 'Abdomen-I', '2017-06-11 06:18:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1184, 7, 0, 66, 'Abdomen-II', '2017-06-11 06:18:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1185, 7, 0, 66, 'Head Neck', '2017-06-11 06:18:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1186, 7, 0, 66, 'Thorax', '2017-06-11 06:18:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1187, 7, 0, 66, 'Extremity-I', '2017-06-11 06:18:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1188, 7, 0, 66, 'Extremity-II', '2017-06-11 06:18:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1189, 7, 0, 66, 'Embryology-I', '2017-06-11 06:18:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1190, 7, 0, 66, 'Embryology-II', '2017-06-11 06:18:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1191, 7, 0, 66, 'Histology-I', '2017-06-11 06:18:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1192, 7, 0, 66, 'Histology-II', '2017-06-11 06:18:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1193, 7, 0, 66, 'Endocrinology-I', '2017-06-11 06:18:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1194, 7, 0, 66, 'Endocrinology-II', '2017-06-11 06:18:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1195, 7, 0, 66, 'Neuroanatomy', '2017-06-11 06:18:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1196, 7, 0, 66, 'Nervous System', '2017-06-11 06:18:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1197, 7, 0, 66, 'Gen: Pharmacology', '2017-06-11 06:18:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1198, 7, 0, 66, 'Sys: Pharmacology', '2017-06-11 06:18:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1199, 7, 0, 66, 'GIT Physiology', '2017-06-11 06:18:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1200, 7, 0, 66, 'Metabolism, Vitamins & Minerals', '2017-06-11 06:18:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1201, 7, 0, 66, 'CVS Physiology-I', '2017-06-11 06:18:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1202, 7, 0, 66, 'CVS Physiology-II', '2017-06-11 06:18:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1203, 7, 0, 66, 'Cell Injury & Adaptation', '2017-06-11 06:18:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1204, 7, 0, 66, 'Genetics', '2017-06-11 06:18:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1205, 7, 0, 66, 'Neoplasm-I', '2017-06-11 06:18:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1206, 7, 0, 66, 'Neoplasm-II', '2017-06-11 06:18:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1207, 7, 0, 66, 'Repair, Regeneration, Healing & Hem', '2017-06-11 06:18:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1208, 7, 0, 66, 'Immunology-I', '2017-06-11 06:18:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1209, 7, 0, 66, 'Immunology-II', '2017-06-11 06:18:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1210, 7, 0, 66, 'Respiratory System', '2017-06-11 06:18:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1211, 7, 0, 66, 'General Physiology', '2017-06-11 06:18:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1212, 7, 0, 66, 'Renal System', '2017-06-11 06:18:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1213, 7, 0, 66, 'Body Fluid, Acid Base Balance .....', '2017-06-11 06:18:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1214, 7, 0, 66, 'Blood', '2017-06-11 06:18:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1215, 7, 0, 66, 'Haematology', '2017-06-11 06:18:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1216, 7, 0, 45, 'Parasitology', '2017-06-11 06:20:43', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1217, 7, 0, 45, 'Mycology', '2017-06-11 06:20:43', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1218, 7, 0, 45, 'Gen: Bacteriology', '2017-06-11 06:20:43', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1219, 7, 0, 45, 'Sys: Bacteriology', '2017-06-11 06:20:43', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1220, 7, 0, 45, 'Abdomen-I', '2017-06-11 06:20:43', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1221, 7, 0, 45, 'Abdomen-II', '2017-06-11 06:20:43', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1222, 7, 0, 45, 'Head Neck', '2017-06-11 06:20:43', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1223, 7, 0, 45, 'Thorax', '2017-06-11 06:20:43', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1224, 7, 0, 45, 'Extremity-I', '2017-06-11 06:20:43', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1225, 7, 0, 45, 'Extremity-II', '2017-06-11 06:20:43', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1226, 7, 0, 45, 'Embryology-I', '2017-06-11 06:20:43', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1227, 7, 0, 45, 'Embryology-II', '2017-06-11 06:20:43', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1228, 7, 0, 45, 'Histology-I', '2017-06-11 06:20:43', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1229, 7, 0, 45, 'Histology-II', '2017-06-11 06:20:43', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1230, 7, 0, 45, 'Endocrinology-I', '2017-06-11 06:20:43', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1231, 7, 0, 45, 'Endocrinology-II', '2017-06-11 06:20:43', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1232, 7, 0, 45, 'Neuroanatomy', '2017-06-11 06:20:43', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1233, 7, 0, 45, 'Nervous System', '2017-06-11 06:20:43', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1234, 7, 0, 45, 'Gen: Pharmacology', '2017-06-11 06:20:43', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1235, 7, 0, 45, 'Sys: Pharmacology', '2017-06-11 06:20:43', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1236, 7, 0, 45, 'GIT Physiology', '2017-06-11 06:20:43', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1237, 7, 0, 45, 'Metabolism, Vitamins & Minerals', '2017-06-11 06:20:43', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1238, 7, 0, 45, 'CVS Physiology-I', '2017-06-11 06:20:43', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1239, 7, 0, 45, 'CVS Physiology-II', '2017-06-11 06:20:43', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1240, 7, 0, 45, 'Cell Injury & Adaptation', '2017-06-11 06:20:43', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1241, 7, 0, 45, 'Genetics', '2017-06-11 06:20:43', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1242, 7, 0, 45, 'Neoplasm-I', '2017-06-11 06:20:43', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1243, 7, 0, 45, 'Neoplasm-II', '2017-06-11 06:20:43', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1244, 7, 0, 45, 'Repair, Regeneration, Healing & Hem', '2017-06-11 06:20:43', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1245, 7, 0, 45, 'Immunology-I', '2017-06-11 06:20:43', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1246, 7, 0, 45, 'Immunology-II', '2017-06-11 06:20:43', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1247, 7, 0, 45, 'Respiratory System', '2017-06-11 06:20:43', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1248, 7, 0, 45, 'General Physiology', '2017-06-11 06:20:43', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1249, 7, 0, 45, 'Renal System', '2017-06-11 06:20:43', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1250, 7, 0, 45, 'Body Fluid, Acid Base Balance .....', '2017-06-11 06:20:43', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1251, 7, 0, 45, 'Blood', '2017-06-11 06:20:43', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1252, 7, 0, 45, 'Haematology', '2017-06-11 06:20:43', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1253, 7, 0, 42, 'Parasitology', '2017-06-11 06:21:14', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1254, 7, 0, 42, 'Mycology', '2017-06-11 06:21:14', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1255, 7, 0, 42, 'Gen: Bacteriology', '2017-06-11 06:21:14', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1256, 7, 0, 42, 'Sys: Bacteriology', '2017-06-11 06:21:14', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1257, 7, 0, 42, 'Abdomen-I', '2017-06-11 06:21:14', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1258, 7, 0, 42, 'Abdomen-II', '2017-06-11 06:21:14', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1259, 7, 0, 42, 'Head Neck', '2017-06-11 06:21:14', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1260, 7, 0, 42, 'Thorax', '2017-06-11 06:21:14', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1261, 7, 0, 42, 'Extremity-I', '2017-06-11 06:21:14', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1262, 7, 0, 42, 'Extremity-II', '2017-06-11 06:21:14', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1263, 7, 0, 42, 'Embryology-I', '2017-06-11 06:21:14', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1264, 7, 0, 42, 'Embryology-II', '2017-06-11 06:21:14', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1265, 7, 0, 42, 'Histology-I', '2017-06-11 06:21:14', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1266, 7, 0, 42, 'Histology-II', '2017-06-11 06:21:14', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1267, 7, 0, 42, 'Endocrinology-I', '2017-06-11 06:21:14', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1268, 7, 0, 42, 'Endocrinology-II', '2017-06-11 06:21:14', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1269, 7, 0, 42, 'Neuroanatomy', '2017-06-11 06:21:14', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1270, 7, 0, 42, 'Nervous System', '2017-06-11 06:21:14', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1271, 7, 0, 42, 'Gen: Pharmacology', '2017-06-11 06:21:14', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1272, 7, 0, 42, 'Sys: Pharmacology', '2017-06-11 06:21:14', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1273, 7, 0, 42, 'GIT Physiology', '2017-06-11 06:21:14', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1274, 7, 0, 42, 'Metabolism, Vitamins & Minerals', '2017-06-11 06:21:14', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1275, 7, 0, 42, 'CVS Physiology-I', '2017-06-11 06:21:14', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1276, 7, 0, 42, 'CVS Physiology-II', '2017-06-11 06:21:14', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1277, 7, 0, 42, 'Cell Injury & Adaptation', '2017-06-11 06:21:14', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1278, 7, 0, 42, 'Genetics', '2017-06-11 06:21:14', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1279, 7, 0, 42, 'Neoplasm-I', '2017-06-11 06:21:14', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1280, 7, 0, 42, 'Neoplasm-II', '2017-06-11 06:21:14', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1281, 7, 0, 42, 'Repair, Regeneration, Healing & Hem', '2017-06-11 06:21:14', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1282, 7, 0, 42, 'Immunology-I', '2017-06-11 06:21:14', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1283, 7, 0, 42, 'Immunology-II', '2017-06-11 06:21:14', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1284, 7, 0, 42, 'Respiratory System', '2017-06-11 06:21:14', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1285, 7, 0, 42, 'General Physiology', '2017-06-11 06:21:14', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1286, 7, 0, 42, 'Renal System', '2017-06-11 06:21:14', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1287, 7, 0, 42, 'Body Fluid, Acid Base Balance .....', '2017-06-11 06:21:14', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1288, 7, 0, 42, 'Blood', '2017-06-11 06:21:14', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1289, 7, 0, 42, 'Haematology', '2017-06-11 06:21:14', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1290, 7, 0, 41, 'Parasitology', '2017-06-11 06:22:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1291, 7, 0, 41, 'Mycology', '2017-06-11 06:22:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1292, 7, 0, 41, 'Gen: Bacteriology', '2017-06-11 06:22:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1293, 7, 0, 41, 'Sys: Bacteriology', '2017-06-11 06:22:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1294, 7, 0, 41, 'Abdomen-I', '2017-06-11 06:22:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1295, 7, 0, 41, 'Abdomen-II', '2017-06-11 06:22:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1296, 7, 0, 41, 'Head Neck', '2017-06-11 06:22:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1297, 7, 0, 41, 'Thorax', '2017-06-11 06:22:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1298, 7, 0, 41, 'Extremity-I', '2017-06-11 06:22:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1299, 7, 0, 41, 'Extremity-II', '2017-06-11 06:22:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1300, 7, 0, 41, 'Embryology-I', '2017-06-11 06:22:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1301, 7, 0, 41, 'Embryology-II', '2017-06-11 06:22:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1302, 7, 0, 41, 'Histology-I', '2017-06-11 06:22:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1303, 7, 0, 41, 'Histology-II', '2017-06-11 06:22:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1304, 7, 0, 41, 'Endocrinology-I', '2017-06-11 06:22:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1305, 7, 0, 41, 'Endocrinology-II', '2017-06-11 06:22:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1306, 7, 0, 41, 'Neuroanatomy', '2017-06-11 06:22:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1307, 7, 0, 41, 'Nervous System', '2017-06-11 06:22:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1308, 7, 0, 41, 'Gen: Pharmacology', '2017-06-11 06:22:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1309, 7, 0, 41, 'Sys: Pharmacology', '2017-06-11 06:22:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1310, 7, 0, 41, 'GIT Physiology', '2017-06-11 06:22:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1311, 7, 0, 41, 'Metabolism, Vitamins & Minerals', '2017-06-11 06:22:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1312, 7, 0, 41, 'CVS Physiology-I', '2017-06-11 06:22:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1313, 7, 0, 41, 'CVS Physiology-II', '2017-06-11 06:22:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1314, 7, 0, 41, 'Cell Injury & Adaptation', '2017-06-11 06:22:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1315, 7, 0, 41, 'Genetics', '2017-06-11 06:22:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1316, 7, 0, 41, 'Neoplasm-I', '2017-06-11 06:22:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1317, 7, 0, 41, 'Neoplasm-II', '2017-06-11 06:22:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1318, 7, 0, 41, 'Repair, Regeneration, Healing & Hem', '2017-06-11 06:22:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1319, 7, 0, 41, 'Immunology-I', '2017-06-11 06:22:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1320, 7, 0, 41, 'Immunology-II', '2017-06-11 06:22:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1321, 7, 0, 41, 'Respiratory System', '2017-06-11 06:22:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1322, 7, 0, 41, 'General Physiology', '2017-06-11 06:22:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1323, 7, 0, 41, 'Renal System', '2017-06-11 06:22:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1324, 7, 0, 41, 'Body Fluid, Acid Base Balance .....', '2017-06-11 06:22:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1325, 7, 0, 41, 'Blood', '2017-06-11 06:22:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1326, 7, 0, 41, 'Haematology', '2017-06-11 06:22:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1327, 7, 0, 43, 'Parasitology', '2017-06-11 06:22:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1328, 7, 0, 43, 'Mycology', '2017-06-11 06:22:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1329, 7, 0, 43, 'Gen: Bacteriology', '2017-06-11 06:22:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1330, 7, 0, 43, 'Sys: Bacteriology', '2017-06-11 06:22:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1331, 7, 0, 43, 'Abdomen-I', '2017-06-11 06:22:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1332, 7, 0, 43, 'Abdomen-II', '2017-06-11 06:22:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1333, 7, 0, 43, 'Head Neck', '2017-06-11 06:22:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1334, 7, 0, 43, 'Thorax', '2017-06-11 06:22:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1335, 7, 0, 43, 'Extremity-I', '2017-06-11 06:22:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1336, 7, 0, 43, 'Extremity-II', '2017-06-11 06:22:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1337, 7, 0, 43, 'Embryology-I', '2017-06-11 06:22:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1338, 7, 0, 43, 'Embryology-II', '2017-06-11 06:22:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1339, 7, 0, 43, 'Histology-I', '2017-06-11 06:22:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1340, 7, 0, 43, 'Histology-II', '2017-06-11 06:22:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1341, 7, 0, 43, 'Endocrinology-I', '2017-06-11 06:22:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1342, 7, 0, 43, 'Endocrinology-II', '2017-06-11 06:22:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1343, 7, 0, 43, 'Neuroanatomy', '2017-06-11 06:22:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1344, 7, 0, 43, 'Nervous System', '2017-06-11 06:22:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1345, 7, 0, 43, 'Gen: Pharmacology', '2017-06-11 06:22:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1346, 7, 0, 43, 'Sys: Pharmacology', '2017-06-11 06:22:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1347, 7, 0, 43, 'GIT Physiology', '2017-06-11 06:22:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1348, 7, 0, 43, 'Metabolism, Vitamins & Minerals', '2017-06-11 06:22:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1349, 7, 0, 43, 'CVS Physiology-I', '2017-06-11 06:22:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1350, 7, 0, 43, 'CVS Physiology-II', '2017-06-11 06:22:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1351, 7, 0, 43, 'Cell Injury & Adaptation', '2017-06-11 06:22:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1352, 7, 0, 43, 'Genetics', '2017-06-11 06:22:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1353, 7, 0, 43, 'Neoplasm-I', '2017-06-11 06:22:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1354, 7, 0, 43, 'Neoplasm-II', '2017-06-11 06:22:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1355, 7, 0, 43, 'Repair, Regeneration, Healing & Hem', '2017-06-11 06:22:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1356, 7, 0, 43, 'Immunology-I', '2017-06-11 06:22:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1357, 7, 0, 43, 'Immunology-II', '2017-06-11 06:22:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1358, 7, 0, 43, 'Respiratory System', '2017-06-11 06:22:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1359, 7, 0, 43, 'General Physiology', '2017-06-11 06:22:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1360, 7, 0, 43, 'Renal System', '2017-06-11 06:22:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1361, 7, 0, 43, 'Body Fluid, Acid Base Balance .....', '2017-06-11 06:22:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1362, 7, 0, 43, 'Blood', '2017-06-11 06:22:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1363, 7, 0, 43, 'Haematology', '2017-06-11 06:22:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1364, 7, 0, 44, 'Parasitology', '2017-06-11 06:29:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1365, 7, 0, 44, 'Mycology', '2017-06-11 06:29:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1366, 7, 0, 44, 'Gen: Bacteriology', '2017-06-11 06:29:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1367, 7, 0, 44, 'Sys: Bacteriology', '2017-06-11 06:29:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1368, 7, 0, 44, 'Abdomen-I', '2017-06-11 06:29:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1369, 7, 0, 44, 'Abdomen-II', '2017-06-11 06:29:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1370, 7, 0, 44, 'Head Neck', '2017-06-11 06:29:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1371, 7, 0, 44, 'Thorax', '2017-06-11 06:29:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1372, 7, 0, 44, 'Extremity-I', '2017-06-11 06:29:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1373, 7, 0, 44, 'Extremity-II', '2017-06-11 06:29:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1374, 7, 0, 44, 'Embryology-I', '2017-06-11 06:29:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1375, 7, 0, 44, 'Embryology-II', '2017-06-11 06:29:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1376, 7, 0, 44, 'Histology-I', '2017-06-11 06:29:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1377, 7, 0, 44, 'Histology-II', '2017-06-11 06:29:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1378, 7, 0, 44, 'Endocrinology-I', '2017-06-11 06:29:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1379, 7, 0, 44, 'Endocrinology-II', '2017-06-11 06:29:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1380, 7, 0, 44, 'Neuroanatomy', '2017-06-11 06:29:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1381, 7, 0, 44, 'Nervous System', '2017-06-11 06:29:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1382, 7, 0, 44, 'Gen: Pharmacology', '2017-06-11 06:29:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1383, 7, 0, 44, 'Sys: Pharmacology', '2017-06-11 06:29:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1384, 7, 0, 44, 'GIT Physiology', '2017-06-11 06:29:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1385, 7, 0, 44, 'Metabolism, Vitamins & Minerals', '2017-06-11 06:29:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1386, 7, 0, 44, 'CVS Physiology-I', '2017-06-11 06:29:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1387, 7, 0, 44, 'CVS Physiology-II', '2017-06-11 06:29:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1388, 7, 0, 44, 'Cell Injury & Adaptation', '2017-06-11 06:29:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1389, 7, 0, 44, 'Genetics', '2017-06-11 06:29:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1390, 7, 0, 44, 'Neoplasm-I', '2017-06-11 06:29:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1391, 7, 0, 44, 'Neoplasm-II', '2017-06-11 06:29:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1392, 7, 0, 44, 'Repair, Regeneration, Healing & Hem', '2017-06-11 06:29:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1393, 7, 0, 44, 'Immunology-I', '2017-06-11 06:29:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1394, 7, 0, 44, 'Immunology-II', '2017-06-11 06:29:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1);
INSERT INTO `sif_class_topic` (`id`, `course_code`, `faculty_code`, `subject_id`, `class_topic_name`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`) VALUES
(1395, 7, 0, 44, 'Respiratory System', '2017-06-11 06:29:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1396, 7, 0, 44, 'General Physiology', '2017-06-11 06:29:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1397, 7, 0, 44, 'Renal System', '2017-06-11 06:29:14', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1398, 7, 0, 44, 'Body Fluid, Acid Base Balance .....', '2017-06-11 06:29:14', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1399, 7, 0, 44, 'Blood', '2017-06-11 06:29:14', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1400, 7, 0, 44, 'Haematology', '2017-06-11 06:29:14', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1401, 7, 0, 60, 'Parasitology', '2017-06-11 06:29:47', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1402, 7, 0, 60, 'Mycology', '2017-06-11 06:29:47', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1403, 7, 0, 60, 'Gen: Bacteriology', '2017-06-11 06:29:47', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1404, 7, 0, 60, 'Sys: Bacteriology', '2017-06-11 06:29:47', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1405, 7, 0, 60, 'Abdomen-I', '2017-06-11 06:29:48', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1406, 7, 0, 60, 'Abdomen-II', '2017-06-11 06:29:48', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1407, 7, 0, 60, 'Head Neck', '2017-06-11 06:29:48', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1408, 7, 0, 60, 'Thorax', '2017-06-11 06:29:48', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1409, 7, 0, 60, 'Extremity-I', '2017-06-11 06:29:48', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1410, 7, 0, 60, 'Extremity-II', '2017-06-11 06:29:48', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1411, 7, 0, 60, 'Embryology-I', '2017-06-11 06:29:48', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1412, 7, 0, 60, 'Embryology-II', '2017-06-11 06:29:48', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1413, 7, 0, 60, 'Histology-I', '2017-06-11 06:29:48', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1414, 7, 0, 60, 'Histology-II', '2017-06-11 06:29:48', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1415, 7, 0, 60, 'Endocrinology-I', '2017-06-11 06:29:48', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1416, 7, 0, 60, 'Endocrinology-II', '2017-06-11 06:29:48', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1417, 7, 0, 60, 'Neuroanatomy', '2017-06-11 06:29:48', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1418, 7, 0, 60, 'Nervous System', '2017-06-11 06:29:48', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1419, 7, 0, 60, 'Gen: Pharmacology', '2017-06-11 06:29:48', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1420, 7, 0, 60, 'Sys: Pharmacology', '2017-06-11 06:29:48', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1421, 7, 0, 60, 'GIT Physiology', '2017-06-11 06:29:48', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1422, 7, 0, 60, 'Metabolism, Vitamins & Minerals', '2017-06-11 06:29:48', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1423, 7, 0, 60, 'CVS Physiology-I', '2017-06-11 06:29:48', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1424, 7, 0, 60, 'CVS Physiology-II', '2017-06-11 06:29:48', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1425, 7, 0, 60, 'Cell Injury & Adaptation', '2017-06-11 06:29:48', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1426, 7, 0, 60, 'Genetics', '2017-06-11 06:29:48', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1427, 7, 0, 60, 'Neoplasm-I', '2017-06-11 06:29:48', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1428, 7, 0, 60, 'Neoplasm-II', '2017-06-11 06:29:48', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1429, 7, 0, 60, 'Repair, Regeneration, Healing & Hem', '2017-06-11 06:29:48', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1430, 7, 0, 60, 'Immunology-I', '2017-06-11 06:29:48', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1431, 7, 0, 60, 'Immunology-II', '2017-06-11 06:29:48', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1432, 7, 0, 60, 'Respiratory System', '2017-06-11 06:29:48', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1433, 7, 0, 60, 'General Physiology', '2017-06-11 06:29:48', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1434, 7, 0, 60, 'Renal System', '2017-06-11 06:29:48', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1435, 7, 0, 60, 'Body Fluid, Acid Base Balance .....', '2017-06-11 06:29:48', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1436, 7, 0, 60, 'Blood', '2017-06-11 06:29:48', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1437, 7, 0, 60, 'Haematology', '2017-06-11 06:29:48', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1438, 7, 0, 39, 'Parasitology', '2017-06-11 06:30:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1439, 7, 0, 39, 'Mycology', '2017-06-11 06:30:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1440, 7, 0, 39, 'Gen: Bacteriology', '2017-06-11 06:30:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1441, 7, 0, 39, 'Sys: Bacteriology', '2017-06-11 06:30:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1442, 7, 0, 39, 'Abdomen-I', '2017-06-11 06:30:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1443, 7, 0, 39, 'Abdomen-II', '2017-06-11 06:30:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1444, 7, 0, 39, 'Head Neck', '2017-06-11 06:30:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1445, 7, 0, 39, 'Thorax', '2017-06-11 06:30:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1446, 7, 0, 39, 'Extremity-I', '2017-06-11 06:30:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1447, 7, 0, 39, 'Extremity-II', '2017-06-11 06:30:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1448, 7, 0, 39, 'Embryology-I', '2017-06-11 06:30:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1449, 7, 0, 39, 'Embryology-II', '2017-06-11 06:30:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1450, 7, 0, 39, 'Histology-I', '2017-06-11 06:30:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1451, 7, 0, 39, 'Histology-II', '2017-06-11 06:30:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1452, 7, 0, 39, 'Endocrinology-I', '2017-06-11 06:30:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1453, 7, 0, 39, 'Endocrinology-II', '2017-06-11 06:30:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1454, 7, 0, 39, 'Neuroanatomy', '2017-06-11 06:30:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1455, 7, 0, 39, 'Nervous System', '2017-06-11 06:30:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1456, 7, 0, 39, 'Gen: Pharmacology', '2017-06-11 06:30:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1457, 7, 0, 39, 'Sys: Pharmacology', '2017-06-11 06:30:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1458, 7, 0, 39, 'GIT Physiology', '2017-06-11 06:30:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1459, 7, 0, 39, 'Metabolism, Vitamins & Minerals', '2017-06-11 06:30:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1460, 7, 0, 39, 'CVS Physiology-I', '2017-06-11 06:30:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1461, 7, 0, 39, 'CVS Physiology-II', '2017-06-11 06:30:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1462, 7, 0, 39, 'Cell Injury & Adaptation', '2017-06-11 06:30:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1463, 7, 0, 39, 'Genetics', '2017-06-11 06:30:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1464, 7, 0, 39, 'Neoplasm-I', '2017-06-11 06:30:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1465, 7, 0, 39, 'Neoplasm-II', '2017-06-11 06:30:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1466, 7, 0, 39, 'Repair, Regeneration, Healing & Hem', '2017-06-11 06:30:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1467, 7, 0, 39, 'Immunology-I', '2017-06-11 06:30:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1468, 7, 0, 39, 'Immunology-II', '2017-06-11 06:30:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1469, 7, 0, 39, 'Respiratory System', '2017-06-11 06:30:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1470, 7, 0, 39, 'General Physiology', '2017-06-11 06:30:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1471, 7, 0, 39, 'Renal System', '2017-06-11 06:30:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1472, 7, 0, 39, 'Body Fluid, Acid Base Balance .....', '2017-06-11 06:30:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1473, 7, 0, 39, 'Blood', '2017-06-11 06:30:14', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1474, 7, 0, 39, 'Haematology', '2017-06-11 06:30:14', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1475, 7, 0, 51, 'Parasitology', '2017-06-11 06:31:10', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1476, 7, 0, 51, 'Mycology', '2017-06-11 06:31:10', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1477, 7, 0, 51, 'Gen: Bacteriology', '2017-06-11 06:31:10', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1478, 7, 0, 51, 'Sys: Bacteriology', '2017-06-11 06:31:10', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1479, 7, 0, 51, 'Abdomen-I', '2017-06-11 06:31:10', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1480, 7, 0, 51, 'Abdomen-II', '2017-06-11 06:31:10', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1481, 7, 0, 51, 'Head Neck', '2017-06-11 06:31:10', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1482, 7, 0, 51, 'Thorax', '2017-06-11 06:31:10', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1483, 7, 0, 51, 'Extremity-I', '2017-06-11 06:31:10', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1484, 7, 0, 51, 'Extremity-II', '2017-06-11 06:31:10', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1485, 7, 0, 51, 'Embryology-I', '2017-06-11 06:31:10', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1486, 7, 0, 51, 'Embryology-II', '2017-06-11 06:31:10', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1487, 7, 0, 51, 'Histology-I', '2017-06-11 06:31:10', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1488, 7, 0, 51, 'Histology-II', '2017-06-11 06:31:10', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1489, 7, 0, 51, 'Endocrinology-I', '2017-06-11 06:31:10', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1490, 7, 0, 51, 'Endocrinology-II', '2017-06-11 06:31:10', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1491, 7, 0, 51, 'Neuroanatomy', '2017-06-11 06:31:10', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1492, 7, 0, 51, 'Nervous System', '2017-06-11 06:31:10', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1493, 7, 0, 51, 'Gen: Pharmacology', '2017-06-11 06:31:10', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1494, 7, 0, 51, 'Sys: Pharmacology', '2017-06-11 06:31:10', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1495, 7, 0, 51, 'GIT Physiology', '2017-06-11 06:31:10', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1496, 7, 0, 51, 'Metabolism, Vitamins & Minerals', '2017-06-11 06:31:10', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1497, 7, 0, 51, 'CVS Physiology-I', '2017-06-11 06:31:10', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1498, 7, 0, 51, 'CVS Physiology-II', '2017-06-11 06:31:11', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1499, 7, 0, 51, 'Cell Injury & Adaptation', '2017-06-11 06:31:11', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1500, 7, 0, 51, 'Genetics', '2017-06-11 06:31:11', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1501, 7, 0, 51, 'Neoplasm-I', '2017-06-11 06:31:11', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1502, 7, 0, 51, 'Neoplasm-II', '2017-06-11 06:31:11', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1503, 7, 0, 51, 'Repair, Regeneration, Healing & Hem', '2017-06-11 06:31:11', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1504, 7, 0, 51, 'Immunology-I', '2017-06-11 06:31:11', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1505, 7, 0, 51, 'Immunology-II', '2017-06-11 06:31:11', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1506, 7, 0, 51, 'Respiratory System', '2017-06-11 06:31:11', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1507, 7, 0, 51, 'General Physiology', '2017-06-11 06:31:11', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1508, 7, 0, 51, 'Renal System', '2017-06-11 06:31:11', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1509, 7, 0, 51, 'Body Fluid, Acid Base Balance .....', '2017-06-11 06:31:11', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1510, 7, 0, 51, 'Blood', '2017-06-11 06:31:11', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1511, 7, 0, 51, 'Haematology', '2017-06-11 06:31:11', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1512, 7, 0, 69, 'Parasitology', '2017-06-11 06:32:52', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1513, 7, 0, 69, 'Mycology', '2017-06-11 06:32:52', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1514, 7, 0, 69, 'Gen: Bacteriology', '2017-06-11 06:32:52', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1515, 7, 0, 69, 'Sys: Bacteriology', '2017-06-11 06:32:52', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1516, 7, 0, 69, 'Abdomen-I', '2017-06-11 06:32:52', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1517, 7, 0, 69, 'Abdomen-II', '2017-06-11 06:32:52', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1518, 7, 0, 69, 'Head Neck', '2017-06-11 06:32:52', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1519, 7, 0, 69, 'Thorax', '2017-06-11 06:32:52', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1520, 7, 0, 69, 'Extremity-I', '2017-06-11 06:32:52', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1521, 7, 0, 69, 'Extremity-II', '2017-06-11 06:32:52', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1522, 7, 0, 69, 'Embryology-I', '2017-06-11 06:32:52', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1523, 7, 0, 69, 'Embryology-II', '2017-06-11 06:32:52', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1524, 7, 0, 69, 'Histology-I', '2017-06-11 06:32:52', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1525, 7, 0, 69, 'Histology-II', '2017-06-11 06:32:52', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1526, 7, 0, 69, 'Endocrinology-I', '2017-06-11 06:32:52', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1527, 7, 0, 69, 'Endocrinology-II', '2017-06-11 06:32:52', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1528, 7, 0, 69, 'Neuroanatomy', '2017-06-11 06:32:52', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1529, 7, 0, 69, 'Nervous System', '2017-06-11 06:32:52', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1530, 7, 0, 69, 'Gen: Pharmacology', '2017-06-11 06:32:52', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1531, 7, 0, 69, 'Sys: Pharmacology', '2017-06-11 06:32:52', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1532, 7, 0, 69, 'GIT Physiology', '2017-06-11 06:32:52', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1533, 7, 0, 69, 'Metabolism, Vitamins & Minerals', '2017-06-11 06:32:52', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1534, 7, 0, 69, 'CVS Physiology-I', '2017-06-11 06:32:52', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1535, 7, 0, 69, 'CVS Physiology-II', '2017-06-11 06:32:52', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1536, 7, 0, 69, 'Cell Injury & Adaptation', '2017-06-11 06:32:52', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1537, 7, 0, 69, 'Genetics', '2017-06-11 06:32:52', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1538, 7, 0, 69, 'Neoplasm-I', '2017-06-11 06:32:52', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1539, 7, 0, 69, 'Neoplasm-II', '2017-06-11 06:32:52', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1540, 7, 0, 69, 'Repair, Regeneration, Healing & Hem', '2017-06-11 06:32:52', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1541, 7, 0, 69, 'Immunology-I', '2017-06-11 06:32:52', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1542, 7, 0, 69, 'Immunology-II', '2017-06-11 06:32:52', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1543, 7, 0, 69, 'Respiratory System', '2017-06-11 06:32:53', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1544, 7, 0, 69, 'General Physiology', '2017-06-11 06:32:53', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1545, 7, 0, 69, 'Renal System', '2017-06-11 06:32:53', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1546, 7, 0, 69, 'Body Fluid, Acid Base Balance .....', '2017-06-11 06:32:53', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1547, 7, 0, 69, 'Blood', '2017-06-11 06:32:53', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1548, 7, 0, 69, 'Haematology', '2017-06-11 06:32:53', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1549, 7, 0, 74, 'Parasitology', '2017-06-11 06:33:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1550, 7, 0, 74, 'Mycology', '2017-06-11 06:33:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1551, 7, 0, 74, 'Gen: Bacteriology', '2017-06-11 06:33:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1552, 7, 0, 74, 'Sys: Bacteriology', '2017-06-11 06:33:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1553, 7, 0, 74, 'Abdomen-I', '2017-06-11 06:33:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1554, 7, 0, 74, 'Abdomen-II', '2017-06-11 06:33:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1555, 7, 0, 74, 'Head Neck', '2017-06-11 06:33:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1556, 7, 0, 74, 'Thorax', '2017-06-11 06:33:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1557, 7, 0, 74, 'Extremity-I', '2017-06-11 06:33:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1558, 7, 0, 74, 'Extremity-II', '2017-06-11 06:33:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1559, 7, 0, 74, 'Embryology-I', '2017-06-11 06:33:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1560, 7, 0, 74, 'Embryology-II', '2017-06-11 06:33:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1561, 7, 0, 74, 'Histology-I', '2017-06-11 06:33:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1562, 7, 0, 74, 'Histology-II', '2017-06-11 06:33:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1563, 7, 0, 74, 'Endocrinology-I', '2017-06-11 06:33:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1564, 7, 0, 74, 'Endocrinology-II', '2017-06-11 06:33:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1565, 7, 0, 74, 'Neuroanatomy', '2017-06-11 06:33:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1566, 7, 0, 74, 'Nervous System', '2017-06-11 06:33:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1567, 7, 0, 74, 'Gen: Pharmacology', '2017-06-11 06:33:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1568, 7, 0, 74, 'Sys: Pharmacology', '2017-06-11 06:33:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1569, 7, 0, 74, 'GIT Physiology', '2017-06-11 06:33:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1570, 7, 0, 74, 'Metabolism, Vitamins & Minerals', '2017-06-11 06:33:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1571, 7, 0, 74, 'CVS Physiology-I', '2017-06-11 06:33:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1572, 7, 0, 74, 'CVS Physiology-II', '2017-06-11 06:33:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1573, 7, 0, 74, 'Cell Injury & Adaptation', '2017-06-11 06:33:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1574, 7, 0, 74, 'Genetics', '2017-06-11 06:33:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1575, 7, 0, 74, 'Neoplasm-I', '2017-06-11 06:33:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1576, 7, 0, 74, 'Neoplasm-II', '2017-06-11 06:33:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1577, 7, 0, 74, 'Repair, Regeneration, Healing & Hem', '2017-06-11 06:33:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1578, 7, 0, 74, 'Immunology-I', '2017-06-11 06:33:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1579, 7, 0, 74, 'Immunology-II', '2017-06-11 06:33:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1580, 7, 0, 74, 'Respiratory System', '2017-06-11 06:33:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1581, 7, 0, 74, 'General Physiology', '2017-06-11 06:33:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1582, 7, 0, 74, 'Renal System', '2017-06-11 06:33:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1583, 7, 0, 74, 'Body Fluid, Acid Base Balance .....', '2017-06-11 06:33:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1584, 7, 0, 74, 'Blood', '2017-06-11 06:33:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1585, 7, 0, 74, 'Haematology', '2017-06-11 06:33:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1586, 7, 0, 47, 'Parasitology', '2017-06-11 10:08:15', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1587, 7, 0, 47, 'Mycology', '2017-06-11 10:08:15', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1588, 7, 0, 47, 'Gen: Bacteriology', '2017-06-11 10:08:15', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1589, 7, 0, 47, 'Sys: Bacteriology', '2017-06-11 10:08:15', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1590, 7, 0, 47, 'Abdomen-I', '2017-06-11 10:08:15', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1591, 7, 0, 47, 'Abdomen-II', '2017-06-11 10:08:15', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1592, 7, 0, 47, 'Head Neck', '2017-06-11 10:08:15', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1593, 7, 0, 47, 'Thorax', '2017-06-11 10:08:15', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1594, 7, 0, 47, 'Extremity-I', '2017-06-11 10:08:15', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1595, 7, 0, 47, 'Extremity-II', '2017-06-11 10:08:15', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1596, 7, 0, 47, 'Embryology-I', '2017-06-11 10:08:15', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1597, 7, 0, 47, 'Embryology-II', '2017-06-11 10:08:15', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1598, 7, 0, 47, 'Histology-I', '2017-06-11 10:08:15', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1599, 7, 0, 47, 'Histology-II', '2017-06-11 10:08:15', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1600, 7, 0, 47, 'Endocrinology-I', '2017-06-11 10:08:15', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1601, 7, 0, 47, 'Endocrinology-II', '2017-06-11 10:08:15', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1602, 7, 0, 47, 'Neuroanatomy', '2017-06-11 10:08:15', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1603, 7, 0, 47, 'Nervous System', '2017-06-11 10:08:15', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1604, 7, 0, 47, 'Gen: Pharmacology', '2017-06-11 10:08:15', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1605, 7, 0, 47, 'Sys: Pharmacology', '2017-06-11 10:08:15', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1606, 7, 0, 47, 'GIT Physiology', '2017-06-11 10:08:15', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1607, 7, 0, 47, 'Metabolism, Vitamins & Minerals', '2017-06-11 10:08:15', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1608, 7, 0, 47, 'CVS Physiology-I', '2017-06-11 10:08:15', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1609, 7, 0, 47, 'CVS Physiology-II', '2017-06-11 10:08:15', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1610, 7, 0, 47, 'Cell Injury & Adaptation', '2017-06-11 10:08:15', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1611, 7, 0, 47, 'Genetics', '2017-06-11 10:08:15', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1612, 7, 0, 47, 'Neoplasm-I', '2017-06-11 10:08:16', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1613, 7, 0, 47, 'Neoplasm-II', '2017-06-11 10:08:16', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1614, 7, 0, 47, 'Repair, Regeneration, Healing & Hem', '2017-06-11 10:08:16', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1615, 7, 0, 47, 'Immunology-I', '2017-06-11 10:08:16', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1616, 7, 0, 47, 'Immunology-II', '2017-06-11 10:08:16', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1617, 7, 0, 47, 'Respiratory System', '2017-06-11 10:08:16', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1618, 7, 0, 47, 'General Physiology', '2017-06-11 10:08:16', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1619, 7, 0, 47, 'Renal System', '2017-06-11 10:08:16', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1620, 7, 0, 47, 'Body Fluid, Acid Base Balance .....', '2017-06-11 10:08:16', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1621, 7, 0, 47, 'Blood', '2017-06-11 10:08:16', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1622, 7, 0, 47, 'Haematology', '2017-06-11 10:08:16', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1623, 7, 0, 76, 'Parasitology', '2017-06-11 10:08:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1624, 7, 0, 76, 'Mycology', '2017-06-11 10:08:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1625, 7, 0, 76, 'Gen: Bacteriology', '2017-06-11 10:08:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1626, 7, 0, 76, 'Sys: Bacteriology', '2017-06-11 10:08:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1627, 7, 0, 76, 'Abdomen-I', '2017-06-11 10:08:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1628, 7, 0, 76, 'Abdomen-II', '2017-06-11 10:08:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1629, 7, 0, 76, 'Head Neck', '2017-06-11 10:08:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1630, 7, 0, 76, 'Thorax', '2017-06-11 10:08:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1631, 7, 0, 76, 'Extremity-I', '2017-06-11 10:08:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1632, 7, 0, 76, 'Extremity-II', '2017-06-11 10:08:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1633, 7, 0, 76, 'Embryology-I', '2017-06-11 10:08:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1634, 7, 0, 76, 'Embryology-II', '2017-06-11 10:08:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1635, 7, 0, 76, 'Histology-I', '2017-06-11 10:08:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1636, 7, 0, 76, 'Histology-II', '2017-06-11 10:08:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1637, 7, 0, 76, 'Endocrinology-I', '2017-06-11 10:08:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1638, 7, 0, 76, 'Endocrinology-II', '2017-06-11 10:08:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1639, 7, 0, 76, 'Neuroanatomy', '2017-06-11 10:08:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1640, 7, 0, 76, 'Nervous System', '2017-06-11 10:08:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1641, 7, 0, 76, 'Gen: Pharmacology', '2017-06-11 10:08:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1642, 7, 0, 76, 'Sys: Pharmacology', '2017-06-11 10:08:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1643, 7, 0, 76, 'GIT Physiology', '2017-06-11 10:08:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1644, 7, 0, 76, 'Metabolism, Vitamins & Minerals', '2017-06-11 10:08:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1645, 7, 0, 76, 'CVS Physiology-I', '2017-06-11 10:08:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1646, 7, 0, 76, 'CVS Physiology-II', '2017-06-11 10:08:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1647, 7, 0, 76, 'Cell Injury & Adaptation', '2017-06-11 10:08:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1648, 7, 0, 76, 'Genetics', '2017-06-11 10:08:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1649, 7, 0, 76, 'Neoplasm-I', '2017-06-11 10:08:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1650, 7, 0, 76, 'Neoplasm-II', '2017-06-11 10:08:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1651, 7, 0, 76, 'Repair, Regeneration, Healing & Hem', '2017-06-11 10:08:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1652, 7, 0, 76, 'Immunology-I', '2017-06-11 10:08:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1653, 7, 0, 76, 'Immunology-II', '2017-06-11 10:08:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1654, 7, 0, 76, 'Respiratory System', '2017-06-11 10:08:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1655, 7, 0, 76, 'General Physiology', '2017-06-11 10:08:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1656, 7, 0, 76, 'Renal System', '2017-06-11 10:08:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1657, 7, 0, 76, 'Body Fluid, Acid Base Balance .....', '2017-06-11 10:08:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1658, 7, 0, 76, 'Blood', '2017-06-11 10:08:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1659, 7, 0, 76, 'Haematology', '2017-06-11 10:08:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1660, 7, 0, 80, 'Parasitology', '2017-06-11 10:09:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1661, 7, 0, 80, 'Mycology', '2017-06-11 10:09:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1662, 7, 0, 80, 'Gen: Bacteriology', '2017-06-11 10:09:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1663, 7, 0, 80, 'Sys: Bacteriology', '2017-06-11 10:09:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1664, 7, 0, 80, 'Abdomen-I', '2017-06-11 10:09:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1665, 7, 0, 80, 'Abdomen-II', '2017-06-11 10:09:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1666, 7, 0, 80, 'Head Neck', '2017-06-11 10:09:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1667, 7, 0, 80, 'Thorax', '2017-06-11 10:09:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1668, 7, 0, 80, 'Extremity-I', '2017-06-11 10:09:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1669, 7, 0, 80, 'Extremity-II', '2017-06-11 10:09:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1670, 7, 0, 80, 'Embryology-I', '2017-06-11 10:09:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1671, 7, 0, 80, 'Embryology-II', '2017-06-11 10:09:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1672, 7, 0, 80, 'Histology-I', '2017-06-11 10:09:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1673, 7, 0, 80, 'Histology-II', '2017-06-11 10:09:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1674, 7, 0, 80, 'Endocrinology-I', '2017-06-11 10:09:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1675, 7, 0, 80, 'Endocrinology-II', '2017-06-11 10:09:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1676, 7, 0, 80, 'Neuroanatomy', '2017-06-11 10:09:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1677, 7, 0, 80, 'Nervous System', '2017-06-11 10:09:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1678, 7, 0, 80, 'Gen: Pharmacology', '2017-06-11 10:09:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1679, 7, 0, 80, 'Sys: Pharmacology', '2017-06-11 10:09:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1680, 7, 0, 80, 'GIT Physiology', '2017-06-11 10:09:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1681, 7, 0, 80, 'Metabolism, Vitamins & Minerals', '2017-06-11 10:09:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1682, 7, 0, 80, 'CVS Physiology-I', '2017-06-11 10:09:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1683, 7, 0, 80, 'CVS Physiology-II', '2017-06-11 10:09:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1684, 7, 0, 80, 'Cell Injury & Adaptation', '2017-06-11 10:09:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1685, 7, 0, 80, 'Genetics', '2017-06-11 10:09:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1686, 7, 0, 80, 'Neoplasm-I', '2017-06-11 10:09:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1687, 7, 0, 80, 'Neoplasm-II', '2017-06-11 10:09:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1688, 7, 0, 80, 'Repair, Regeneration, Healing & Hem', '2017-06-11 10:09:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1689, 7, 0, 80, 'Immunology-I', '2017-06-11 10:09:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1690, 7, 0, 80, 'Immunology-II', '2017-06-11 10:09:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1691, 7, 0, 80, 'Respiratory System', '2017-06-11 10:09:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1692, 7, 0, 80, 'General Physiology', '2017-06-11 10:09:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1693, 7, 0, 80, 'Renal System', '2017-06-11 10:09:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1694, 7, 0, 80, 'Body Fluid, Acid Base Balance .....', '2017-06-11 10:09:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1695, 7, 0, 80, 'Blood', '2017-06-11 10:09:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1696, 7, 0, 80, 'Haematology', '2017-06-11 10:09:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1697, 7, 0, 48, 'Parasitology', '2017-06-11 10:10:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1698, 7, 0, 48, 'Mycology', '2017-06-11 10:10:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1699, 7, 0, 48, 'Gen: Bacteriology', '2017-06-11 10:10:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1700, 7, 0, 48, 'Sys: Bacteriology', '2017-06-11 10:10:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1701, 7, 0, 48, 'Abdomen-I', '2017-06-11 10:10:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1702, 7, 0, 48, 'Abdomen-II', '2017-06-11 10:10:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1703, 7, 0, 48, 'Head Neck', '2017-06-11 10:10:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1704, 7, 0, 48, 'Thorax', '2017-06-11 10:10:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1705, 7, 0, 48, 'Extremity-I', '2017-06-11 10:10:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1706, 7, 0, 48, 'Extremity-II', '2017-06-11 10:10:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1707, 7, 0, 48, 'Embryology-I', '2017-06-11 10:10:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1708, 7, 0, 48, 'Embryology-II', '2017-06-11 10:10:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1709, 7, 0, 48, 'Histology-I', '2017-06-11 10:10:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1710, 7, 0, 48, 'Histology-II', '2017-06-11 10:10:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1711, 7, 0, 48, 'Endocrinology-I', '2017-06-11 10:10:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1712, 7, 0, 48, 'Endocrinology-II', '2017-06-11 10:10:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1713, 7, 0, 48, 'Neuroanatomy', '2017-06-11 10:10:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1714, 7, 0, 48, 'Nervous System', '2017-06-11 10:10:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1715, 7, 0, 48, 'Gen: Pharmacology', '2017-06-11 10:10:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1716, 7, 0, 48, 'Sys: Pharmacology', '2017-06-11 10:10:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1717, 7, 0, 48, 'GIT Physiology', '2017-06-11 10:10:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1718, 7, 0, 48, 'Metabolism, Vitamins & Minerals', '2017-06-11 10:10:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1719, 7, 0, 48, 'CVS Physiology-I', '2017-06-11 10:10:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1720, 7, 0, 48, 'CVS Physiology-II', '2017-06-11 10:10:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1721, 7, 0, 48, 'Cell Injury & Adaptation', '2017-06-11 10:10:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1722, 7, 0, 48, 'Genetics', '2017-06-11 10:10:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1723, 7, 0, 48, 'Neoplasm-I', '2017-06-11 10:10:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1724, 7, 0, 48, 'Neoplasm-II', '2017-06-11 10:10:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1725, 7, 0, 48, 'Repair, Regeneration, Healing & Hem', '2017-06-11 10:10:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1726, 7, 0, 48, 'Immunology-I', '2017-06-11 10:10:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1727, 7, 0, 48, 'Immunology-II', '2017-06-11 10:10:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1728, 7, 0, 48, 'Respiratory System', '2017-06-11 10:10:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1729, 7, 0, 48, 'General Physiology', '2017-06-11 10:10:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1730, 7, 0, 48, 'Renal System', '2017-06-11 10:10:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1731, 7, 0, 48, 'Body Fluid, Acid Base Balance .....', '2017-06-11 10:10:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1732, 7, 0, 48, 'Blood', '2017-06-11 10:10:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1733, 7, 0, 48, 'Haematology', '2017-06-11 10:10:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1734, 7, 0, 38, 'Parasitology', '2017-06-11 10:10:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1735, 7, 0, 38, 'Mycology', '2017-06-11 10:10:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1736, 7, 0, 38, 'Gen: Bacteriology', '2017-06-11 10:10:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1737, 7, 0, 38, 'Sys: Bacteriology', '2017-06-11 10:10:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1738, 7, 0, 38, 'Abdomen-I', '2017-06-11 10:10:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1739, 7, 0, 38, 'Abdomen-II', '2017-06-11 10:10:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1740, 7, 0, 38, 'Head Neck', '2017-06-11 10:10:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1741, 7, 0, 38, 'Thorax', '2017-06-11 10:10:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1742, 7, 0, 38, 'Extremity-I', '2017-06-11 10:10:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1743, 7, 0, 38, 'Extremity-II', '2017-06-11 10:10:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1744, 7, 0, 38, 'Embryology-I', '2017-06-11 10:10:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1745, 7, 0, 38, 'Embryology-II', '2017-06-11 10:10:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1746, 7, 0, 38, 'Histology-I', '2017-06-11 10:10:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1747, 7, 0, 38, 'Histology-II', '2017-06-11 10:10:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1748, 7, 0, 38, 'Endocrinology-I', '2017-06-11 10:10:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1749, 7, 0, 38, 'Endocrinology-II', '2017-06-11 10:10:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1750, 7, 0, 38, 'Neuroanatomy', '2017-06-11 10:10:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1751, 7, 0, 38, 'Nervous System', '2017-06-11 10:10:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1752, 7, 0, 38, 'Gen: Pharmacology', '2017-06-11 10:10:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1753, 7, 0, 38, 'Sys: Pharmacology', '2017-06-11 10:10:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1754, 7, 0, 38, 'GIT Physiology', '2017-06-11 10:10:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1755, 7, 0, 38, 'Metabolism, Vitamins & Minerals', '2017-06-11 10:10:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1756, 7, 0, 38, 'CVS Physiology-I', '2017-06-11 10:10:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1757, 7, 0, 38, 'CVS Physiology-II', '2017-06-11 10:10:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1758, 7, 0, 38, 'Cell Injury & Adaptation', '2017-06-11 10:10:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1759, 7, 0, 38, 'Genetics', '2017-06-11 10:10:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1760, 7, 0, 38, 'Neoplasm-I', '2017-06-11 10:10:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1761, 7, 0, 38, 'Neoplasm-II', '2017-06-11 10:10:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1762, 7, 0, 38, 'Repair, Regeneration, Healing & Hem', '2017-06-11 10:10:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1763, 7, 0, 38, 'Immunology-I', '2017-06-11 10:10:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1764, 7, 0, 38, 'Immunology-II', '2017-06-11 10:10:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1765, 7, 0, 38, 'Respiratory System', '2017-06-11 10:10:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1766, 7, 0, 38, 'General Physiology', '2017-06-11 10:10:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1767, 7, 0, 38, 'Renal System', '2017-06-11 10:10:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1768, 7, 0, 38, 'Body Fluid, Acid Base Balance .....', '2017-06-11 10:10:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1769, 7, 0, 38, 'Blood', '2017-06-11 10:10:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1770, 7, 0, 38, 'Haematology', '2017-06-11 10:10:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1771, 7, 0, 68, 'Parasitology', '2017-06-11 10:10:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1772, 7, 0, 68, 'Mycology', '2017-06-11 10:10:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1773, 7, 0, 68, 'Gen: Bacteriology', '2017-06-11 10:10:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1774, 7, 0, 68, 'Sys: Bacteriology', '2017-06-11 10:10:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1775, 7, 0, 68, 'Abdomen-I', '2017-06-11 10:10:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1776, 7, 0, 68, 'Abdomen-II', '2017-06-11 10:10:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1777, 7, 0, 68, 'Head Neck', '2017-06-11 10:10:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1778, 7, 0, 68, 'Thorax', '2017-06-11 10:10:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1779, 7, 0, 68, 'Extremity-I', '2017-06-11 10:10:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1780, 7, 0, 68, 'Extremity-II', '2017-06-11 10:10:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1781, 7, 0, 68, 'Embryology-I', '2017-06-11 10:10:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1782, 7, 0, 68, 'Embryology-II', '2017-06-11 10:10:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1783, 7, 0, 68, 'Histology-I', '2017-06-11 10:10:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1784, 7, 0, 68, 'Histology-II', '2017-06-11 10:10:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1785, 7, 0, 68, 'Endocrinology-I', '2017-06-11 10:10:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1786, 7, 0, 68, 'Endocrinology-II', '2017-06-11 10:10:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1787, 7, 0, 68, 'Neuroanatomy', '2017-06-11 10:10:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1788, 7, 0, 68, 'Nervous System', '2017-06-11 10:10:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1789, 7, 0, 68, 'Gen: Pharmacology', '2017-06-11 10:10:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1790, 7, 0, 68, 'Sys: Pharmacology', '2017-06-11 10:10:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1791, 7, 0, 68, 'GIT Physiology', '2017-06-11 10:10:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1792, 7, 0, 68, 'Metabolism, Vitamins & Minerals', '2017-06-11 10:10:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1793, 7, 0, 68, 'CVS Physiology-I', '2017-06-11 10:10:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1794, 7, 0, 68, 'CVS Physiology-II', '2017-06-11 10:10:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1795, 7, 0, 68, 'Cell Injury & Adaptation', '2017-06-11 10:10:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1796, 7, 0, 68, 'Genetics', '2017-06-11 10:10:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1797, 7, 0, 68, 'Neoplasm-I', '2017-06-11 10:10:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1798, 7, 0, 68, 'Neoplasm-II', '2017-06-11 10:10:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1799, 7, 0, 68, 'Repair, Regeneration, Healing & Hem', '2017-06-11 10:10:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1800, 7, 0, 68, 'Immunology-I', '2017-06-11 10:10:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1801, 7, 0, 68, 'Immunology-II', '2017-06-11 10:10:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1802, 7, 0, 68, 'Respiratory System', '2017-06-11 10:10:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1803, 7, 0, 68, 'General Physiology', '2017-06-11 10:10:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1804, 7, 0, 68, 'Renal System', '2017-06-11 10:10:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1805, 7, 0, 68, 'Body Fluid, Acid Base Balance .....', '2017-06-11 10:10:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1806, 7, 0, 68, 'Blood', '2017-06-11 10:10:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1807, 7, 0, 68, 'Haematology', '2017-06-11 10:10:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1808, 7, 0, 37, 'Parasitology', '2017-06-11 10:11:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1809, 7, 0, 37, 'Mycology', '2017-06-11 10:11:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1810, 7, 0, 37, 'Gen: Bacteriology', '2017-06-11 10:11:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1811, 7, 0, 37, 'Sys: Bacteriology', '2017-06-11 10:11:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1812, 7, 0, 37, 'Abdomen-I', '2017-06-11 10:11:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1813, 7, 0, 37, 'Abdomen-II', '2017-06-11 10:11:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1814, 7, 0, 37, 'Head Neck', '2017-06-11 10:11:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1815, 7, 0, 37, 'Thorax', '2017-06-11 10:11:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1816, 7, 0, 37, 'Extremity-I', '2017-06-11 10:11:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1817, 7, 0, 37, 'Extremity-II', '2017-06-11 10:11:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1818, 7, 0, 37, 'Embryology-I', '2017-06-11 10:11:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1819, 7, 0, 37, 'Embryology-II', '2017-06-11 10:11:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1820, 7, 0, 37, 'Histology-I', '2017-06-11 10:11:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1821, 7, 0, 37, 'Histology-II', '2017-06-11 10:11:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1822, 7, 0, 37, 'Endocrinology-I', '2017-06-11 10:11:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1823, 7, 0, 37, 'Endocrinology-II', '2017-06-11 10:11:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1824, 7, 0, 37, 'Neuroanatomy', '2017-06-11 10:11:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1825, 7, 0, 37, 'Nervous System', '2017-06-11 10:11:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1826, 7, 0, 37, 'Gen: Pharmacology', '2017-06-11 10:11:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1827, 7, 0, 37, 'Sys: Pharmacology', '2017-06-11 10:11:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1828, 7, 0, 37, 'GIT Physiology', '2017-06-11 10:11:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1829, 7, 0, 37, 'Metabolism, Vitamins & Minerals', '2017-06-11 10:11:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1830, 7, 0, 37, 'CVS Physiology-I', '2017-06-11 10:11:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1831, 7, 0, 37, 'CVS Physiology-II', '2017-06-11 10:11:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1832, 7, 0, 37, 'Cell Injury & Adaptation', '2017-06-11 10:11:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1833, 7, 0, 37, 'Genetics', '2017-06-11 10:11:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1834, 7, 0, 37, 'Neoplasm-I', '2017-06-11 10:11:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1835, 7, 0, 37, 'Neoplasm-II', '2017-06-11 10:11:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1836, 7, 0, 37, 'Repair, Regeneration, Healing & Hem', '2017-06-11 10:11:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1837, 7, 0, 37, 'Immunology-I', '2017-06-11 10:11:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1838, 7, 0, 37, 'Immunology-II', '2017-06-11 10:11:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1839, 7, 0, 37, 'Respiratory System', '2017-06-11 10:11:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1840, 7, 0, 37, 'General Physiology', '2017-06-11 10:11:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1841, 7, 0, 37, 'Renal System', '2017-06-11 10:11:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1842, 7, 0, 37, 'Body Fluid, Acid Base Balance .....', '2017-06-11 10:11:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1843, 7, 0, 37, 'Blood', '2017-06-11 10:11:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1844, 7, 0, 37, 'Haematology', '2017-06-11 10:11:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1845, 7, 0, 63, 'Parasitology', '2017-06-11 10:12:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1846, 7, 0, 63, 'Mycology', '2017-06-11 10:12:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1847, 7, 0, 63, 'Gen: Bacteriology', '2017-06-11 10:12:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1848, 7, 0, 63, 'Sys: Bacteriology', '2017-06-11 10:12:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1849, 7, 0, 63, 'Abdomen-I', '2017-06-11 10:12:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1850, 7, 0, 63, 'Abdomen-II', '2017-06-11 10:12:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1851, 7, 0, 63, 'Head Neck', '2017-06-11 10:12:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1852, 7, 0, 63, 'Thorax', '2017-06-11 10:12:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1853, 7, 0, 63, 'Extremity-I', '2017-06-11 10:12:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1);
INSERT INTO `sif_class_topic` (`id`, `course_code`, `faculty_code`, `subject_id`, `class_topic_name`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`) VALUES
(1854, 7, 0, 63, 'Extremity-II', '2017-06-11 10:12:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1855, 7, 0, 63, 'Embryology-I', '2017-06-11 10:12:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1856, 7, 0, 63, 'Embryology-II', '2017-06-11 10:12:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1857, 7, 0, 63, 'Histology-I', '2017-06-11 10:12:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1858, 7, 0, 63, 'Histology-II', '2017-06-11 10:12:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1859, 7, 0, 63, 'Endocrinology-I', '2017-06-11 10:12:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1860, 7, 0, 63, 'Endocrinology-II', '2017-06-11 10:12:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1861, 7, 0, 63, 'Neuroanatomy', '2017-06-11 10:12:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1862, 7, 0, 63, 'Nervous System', '2017-06-11 10:12:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1863, 7, 0, 63, 'Gen: Pharmacology', '2017-06-11 10:12:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1864, 7, 0, 63, 'Sys: Pharmacology', '2017-06-11 10:12:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1865, 7, 0, 63, 'GIT Physiology', '2017-06-11 10:12:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1866, 7, 0, 63, 'Metabolism, Vitamins & Minerals', '2017-06-11 10:12:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1867, 7, 0, 63, 'CVS Physiology-I', '2017-06-11 10:12:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1868, 7, 0, 63, 'CVS Physiology-II', '2017-06-11 10:12:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1869, 7, 0, 63, 'Cell Injury & Adaptation', '2017-06-11 10:12:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1870, 7, 0, 63, 'Genetics', '2017-06-11 10:12:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1871, 7, 0, 63, 'Neoplasm-I', '2017-06-11 10:12:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1872, 7, 0, 63, 'Neoplasm-II', '2017-06-11 10:12:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1873, 7, 0, 63, 'Repair, Regeneration, Healing & Hem', '2017-06-11 10:12:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1874, 7, 0, 63, 'Immunology-I', '2017-06-11 10:12:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1875, 7, 0, 63, 'Immunology-II', '2017-06-11 10:12:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1876, 7, 0, 63, 'Respiratory System', '2017-06-11 10:12:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1877, 7, 0, 63, 'General Physiology', '2017-06-11 10:12:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1878, 7, 0, 63, 'Renal System', '2017-06-11 10:12:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1879, 7, 0, 63, 'Body Fluid, Acid Base Balance .....', '2017-06-11 10:12:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1880, 7, 0, 63, 'Blood', '2017-06-11 10:12:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1881, 7, 0, 63, 'Haematology', '2017-06-11 10:12:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1882, 7, 0, 52, 'Parasitology', '2017-06-11 10:13:01', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1883, 7, 0, 52, 'Mycology', '2017-06-11 10:13:01', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1884, 7, 0, 52, 'Gen: Bacteriology', '2017-06-11 10:13:01', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1885, 7, 0, 52, 'Sys: Bacteriology', '2017-06-11 10:13:01', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1886, 7, 0, 52, 'Abdomen-I', '2017-06-11 10:13:01', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1887, 7, 0, 52, 'Abdomen-II', '2017-06-11 10:13:01', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1888, 7, 0, 52, 'Head Neck', '2017-06-11 10:13:01', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1889, 7, 0, 52, 'Thorax', '2017-06-11 10:13:01', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1890, 7, 0, 52, 'Extremity-I', '2017-06-11 10:13:01', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1891, 7, 0, 52, 'Extremity-II', '2017-06-11 10:13:01', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1892, 7, 0, 52, 'Embryology-I', '2017-06-11 10:13:01', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1893, 7, 0, 52, 'Embryology-II', '2017-06-11 10:13:01', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1894, 7, 0, 52, 'Histology-I', '2017-06-11 10:13:01', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1895, 7, 0, 52, 'Histology-II', '2017-06-11 10:13:01', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1896, 7, 0, 52, 'Endocrinology-I', '2017-06-11 10:13:01', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1897, 7, 0, 52, 'Endocrinology-II', '2017-06-11 10:13:01', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1898, 7, 0, 52, 'Neuroanatomy', '2017-06-11 10:13:01', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1899, 7, 0, 52, 'Nervous System', '2017-06-11 10:13:01', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1900, 7, 0, 52, 'Gen: Pharmacology', '2017-06-11 10:13:01', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1901, 7, 0, 52, 'Sys: Pharmacology', '2017-06-11 10:13:01', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1902, 7, 0, 52, 'GIT Physiology', '2017-06-11 10:13:01', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1903, 7, 0, 52, 'Metabolism, Vitamins & Minerals', '2017-06-11 10:13:01', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1904, 7, 0, 52, 'CVS Physiology-I', '2017-06-11 10:13:01', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1905, 7, 0, 52, 'CVS Physiology-II', '2017-06-11 10:13:01', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1906, 7, 0, 52, 'Cell Injury & Adaptation', '2017-06-11 10:13:01', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1907, 7, 0, 52, 'Genetics', '2017-06-11 10:13:01', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1908, 7, 0, 52, 'Neoplasm-I', '2017-06-11 10:13:01', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1909, 7, 0, 52, 'Neoplasm-II', '2017-06-11 10:13:01', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1910, 7, 0, 52, 'Repair, Regeneration, Healing & Hem', '2017-06-11 10:13:01', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1911, 7, 0, 52, 'Immunology-I', '2017-06-11 10:13:01', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1912, 7, 0, 52, 'Immunology-II', '2017-06-11 10:13:01', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1913, 7, 0, 52, 'Respiratory System', '2017-06-11 10:13:01', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1914, 7, 0, 52, 'General Physiology', '2017-06-11 10:13:01', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1915, 7, 0, 52, 'Renal System', '2017-06-11 10:13:01', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1916, 7, 0, 52, 'Body Fluid, Acid Base Balance .....', '2017-06-11 10:13:01', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1917, 7, 0, 52, 'Blood', '2017-06-11 10:13:01', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1918, 7, 0, 52, 'Haematology', '2017-06-11 10:13:01', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1919, 7, 0, 61, 'Parasitology', '2017-06-11 10:13:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1920, 7, 0, 61, 'Mycology', '2017-06-11 10:13:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1921, 7, 0, 61, 'Gen: Bacteriology', '2017-06-11 10:13:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1922, 7, 0, 61, 'Sys: Bacteriology', '2017-06-11 10:13:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1923, 7, 0, 61, 'Abdomen-I', '2017-06-11 10:13:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1924, 7, 0, 61, 'Abdomen-II', '2017-06-11 10:13:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1925, 7, 0, 61, 'Head Neck', '2017-06-11 10:13:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1926, 7, 0, 61, 'Thorax', '2017-06-11 10:13:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1927, 7, 0, 61, 'Extremity-I', '2017-06-11 10:13:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1928, 7, 0, 61, 'Extremity-II', '2017-06-11 10:13:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1929, 7, 0, 61, 'Embryology-I', '2017-06-11 10:13:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1930, 7, 0, 61, 'Embryology-II', '2017-06-11 10:13:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1931, 7, 0, 61, 'Histology-I', '2017-06-11 10:13:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1932, 7, 0, 61, 'Histology-II', '2017-06-11 10:13:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1933, 7, 0, 61, 'Endocrinology-I', '2017-06-11 10:13:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1934, 7, 0, 61, 'Endocrinology-II', '2017-06-11 10:13:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1935, 7, 0, 61, 'Neuroanatomy', '2017-06-11 10:13:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1936, 7, 0, 61, 'Nervous System', '2017-06-11 10:13:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1937, 7, 0, 61, 'Gen: Pharmacology', '2017-06-11 10:13:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1938, 7, 0, 61, 'Sys: Pharmacology', '2017-06-11 10:13:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1939, 7, 0, 61, 'GIT Physiology', '2017-06-11 10:13:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1940, 7, 0, 61, 'Metabolism, Vitamins & Minerals', '2017-06-11 10:13:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1941, 7, 0, 61, 'CVS Physiology-I', '2017-06-11 10:13:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1942, 7, 0, 61, 'CVS Physiology-II', '2017-06-11 10:13:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1943, 7, 0, 61, 'Cell Injury & Adaptation', '2017-06-11 10:13:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1944, 7, 0, 61, 'Genetics', '2017-06-11 10:13:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1945, 7, 0, 61, 'Neoplasm-I', '2017-06-11 10:13:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1946, 7, 0, 61, 'Neoplasm-II', '2017-06-11 10:13:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1947, 7, 0, 61, 'Repair, Regeneration, Healing & Hem', '2017-06-11 10:13:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1948, 7, 0, 61, 'Immunology-I', '2017-06-11 10:13:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1949, 7, 0, 61, 'Immunology-II', '2017-06-11 10:13:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1950, 7, 0, 61, 'Respiratory System', '2017-06-11 10:13:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1951, 7, 0, 61, 'General Physiology', '2017-06-11 10:13:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1952, 7, 0, 61, 'Renal System', '2017-06-11 10:13:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1953, 7, 0, 61, 'Body Fluid, Acid Base Balance .....', '2017-06-11 10:13:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1954, 7, 0, 61, 'Blood', '2017-06-11 10:13:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1955, 7, 0, 61, 'Haematology', '2017-06-11 10:13:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1956, 7, 0, 73, 'Parasitology', '2017-06-11 10:15:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1957, 7, 0, 73, 'Mycology', '2017-06-11 10:15:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1958, 7, 0, 73, 'Gen: Bacteriology', '2017-06-11 10:15:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1959, 7, 0, 73, 'Sys: Bacteriology', '2017-06-11 10:15:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1960, 7, 0, 73, 'Abdomen-I', '2017-06-11 10:15:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1961, 7, 0, 73, 'Abdomen-II', '2017-06-11 10:15:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1962, 7, 0, 73, 'Head Neck', '2017-06-11 10:15:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1963, 7, 0, 73, 'Thorax', '2017-06-11 10:15:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1964, 7, 0, 73, 'Extremity-I', '2017-06-11 10:15:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1965, 7, 0, 73, 'Extremity-II', '2017-06-11 10:15:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1966, 7, 0, 73, 'Embryology-I', '2017-06-11 10:15:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1967, 7, 0, 73, 'Embryology-II', '2017-06-11 10:15:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1968, 7, 0, 73, 'Histology-I', '2017-06-11 10:15:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1969, 7, 0, 73, 'Histology-II', '2017-06-11 10:15:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1970, 7, 0, 73, 'Endocrinology-I', '2017-06-11 10:15:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1971, 7, 0, 73, 'Endocrinology-II', '2017-06-11 10:15:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1972, 7, 0, 73, 'Neuroanatomy', '2017-06-11 10:15:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1973, 7, 0, 73, 'Nervous System', '2017-06-11 10:15:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1974, 7, 0, 73, 'Gen: Pharmacology', '2017-06-11 10:15:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1975, 7, 0, 73, 'Sys: Pharmacology', '2017-06-11 10:15:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1976, 7, 0, 73, 'GIT Physiology', '2017-06-11 10:15:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1977, 7, 0, 73, 'Metabolism, Vitamins & Minerals', '2017-06-11 10:15:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1978, 7, 0, 73, 'CVS Physiology-I', '2017-06-11 10:15:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1979, 7, 0, 73, 'CVS Physiology-II', '2017-06-11 10:15:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1980, 7, 0, 73, 'Cell Injury & Adaptation', '2017-06-11 10:15:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1981, 7, 0, 73, 'Genetics', '2017-06-11 10:15:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1982, 7, 0, 73, 'Neoplasm-I', '2017-06-11 10:15:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1983, 7, 0, 73, 'Neoplasm-II', '2017-06-11 10:15:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1984, 7, 0, 73, 'Repair, Regeneration, Healing & Hem', '2017-06-11 10:15:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1985, 7, 0, 73, 'Immunology-I', '2017-06-11 10:15:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1986, 7, 0, 73, 'Immunology-II', '2017-06-11 10:15:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1987, 7, 0, 73, 'Respiratory System', '2017-06-11 10:15:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1988, 7, 0, 73, 'General Physiology', '2017-06-11 10:15:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1989, 7, 0, 73, 'Renal System', '2017-06-11 10:15:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1990, 7, 0, 73, 'Body Fluid, Acid Base Balance .....', '2017-06-11 10:15:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1991, 7, 0, 73, 'Blood', '2017-06-11 10:15:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(1992, 7, 0, 73, 'Haematology', '2017-06-11 10:15:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sif_course`
--

CREATE TABLE IF NOT EXISTS `sif_course` (
  `id` int(10) NOT NULL,
  `course_name` varchar(60) NOT NULL,
  `course_code` int(1) NOT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `fee` decimal(15,2) DEFAULT NULL,
  `per_year_session` int(2) DEFAULT NULL,
  `pys_st_limit` int(3) DEFAULT NULL,
  `sess_one_start` varchar(255) DEFAULT NULL,
  `sess_two_start` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(70) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` varchar(80) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sif_course`
--

INSERT INTO `sif_course` (`id`, `course_name`, `course_code`, `duration`, `fee`, `per_year_session`, `pys_st_limit`, `sess_one_start`, `sess_two_start`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`) VALUES
(1, 'Certificate in Medical Education (CMEd)', 1, '6 Months', '25000.00', 2, 20, 'January', 'July', '2017-09-28 08:11:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sif_doc_master`
--

CREATE TABLE IF NOT EXISTS `sif_doc_master` (
  `id` int(11) NOT NULL,
  `registrtion_no` varchar(50) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `password` varchar(25) NOT NULL,
  `assigned_teacher_id` varchar(30) DEFAULT NULL,
  `bmdc_no` varchar(50) NOT NULL,
  `doc_name` varchar(80) NOT NULL,
  `father_name` varchar(80) NOT NULL,
  `mother_name` varchar(80) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(40) NOT NULL,
  `photo` varchar(60) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(25) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(25) DEFAULT NULL,
  `status` int(1) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sif_doc_master`
--

INSERT INTO `sif_doc_master` (`id`, `registrtion_no`, `user_name`, `password`, `assigned_teacher_id`, `bmdc_no`, `doc_name`, `father_name`, `mother_name`, `phone`, `email`, `photo`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`) VALUES
(10, '181011', 'drwasey@gmail.com', '0C8VPV', NULL, 'A10767', 'A.E.MD ABDUL WASEY', 'MD. ABDUL WAHAB', 'AZIZUNNESSA KHATUN', '01711887173', 'drwasey@gmail.com', 'upload/documents/181011/photo_181011.jpg', '2018-01-02 14:42:22', NULL, '2018-01-02 20:42:22', 'admin@bigm-bd.com', 1),
(12, '181013', 'drmarufraza@gmail.com', 'BMTXKM', NULL, 'A 40911', 'Abu Khalid Muhammad Maruf Raza', 'Md. Muzibur Rahman Sarkar', 'Khaleda Begum', '01711306123', 'drmarufraza@gmail.com', 'upload/documents/181013/photo_181013.jpg', '2018-01-02 14:41:45', NULL, '2018-01-02 20:41:45', 'admin@bigm-bd.com', 1),
(13, '181014', 'njahan.bird@gmail.com', '0FYDUR', NULL, 'A 31095', 'Nasim Jahan', 'Abul Quasem', 'Shahida Parven', '01819476076', 'njahan.bird@gmail.com', 'upload/documents/181014/photo_181014.JPG', '2018-01-02 14:41:34', NULL, '2018-01-02 20:41:34', 'admin@bigm-bd.com', 1),
(14, '181015', 'dririn.alam@yahoo.com', '6MD4RU', NULL, '23944', 'Irin Parveen Alam', 'Mohd. Shafiqul Alam', 'Momotaz Begam', '01715348398', 'dririn.alam@yahoo.com', 'upload/documents/181015/photo_181015.jpg', '2018-01-02 14:41:20', NULL, '2018-01-02 20:41:20', 'admin@bigm-bd.com', 1),
(15, '181016', 'ezhar65@gmail.com', 'H5CYKU', NULL, 'A-19159', 'MD. EZHARUL HAQUE', 'MD. ABDUL QUDDUS MIAHYAN', 'RAHIMA BEGUM', '01711172547', 'ezhar65@gmail.com', 'upload/documents/181016/photo_181016.jpg', '2018-01-02 14:41:08', NULL, '2018-01-02 20:41:08', 'admin@bigm-bd.com', 1),
(16, '181017', 'dr.towhid29@gmail.com', 'GD2GOB', NULL, 'A46162', 'Dr.Md.Towhidur Rahman', 'Md. Abdul Gafur', 'Rowshan Ara Begum', '01819458385', 'dr.towhid29@gmail.com', 'upload/documents/181017/photo_181017.jpg', '2018-01-02 14:40:58', NULL, '2018-01-02 20:40:58', 'admin@bigm-bd.com', 1),
(17, '181018', 'connectunna@gmail.com', 'RCUCG2', NULL, 'A60661', 'SABIKUN NAHER', 'Md.Emdadul Haque Bhuiya', 'Farida Yasmin', '01917267809', 'connectunna@gmail.com', 'upload/documents/181018/photo_181018.PNG', '2018-01-02 14:40:46', NULL, '2018-01-02 20:40:46', 'admin@bigm-bd.com', 1),
(18, '181020', 'taslima.rafique@gmail.com', '5KZUMQ', NULL, 'A-38696', 'DR. TASLIMA RAFIQUE', 'MD. RAFIQUL QUADER', 'MAHMUDA ANOM', '01713367653', 'taslima.rafique@gmail.com', 'upload/documents/181020/photo_181020.jpg', '2018-01-02 14:40:35', NULL, '2018-01-02 20:40:35', 'admin@bigm-bd.com', 1),
(19, '181021', 'm_mhoque@yahoo.com', 'SERTSQ', NULL, 'A- 21421', 'MD. MOZAMMEL HOQUE', 'MD. ANWAR ALI', 'CHANDAN ARA BEGUM', '01711822852', 'm_mhoque@yahoo.com', 'upload/documents/181021/photo_181021.jpg', '2018-01-02 14:40:24', NULL, '2018-01-02 20:40:24', 'admin@bigm-bd.com', 1),
(20, '181022', 'dr.masum@yahoo.com', 'NTDABC', NULL, 'A - 42744', 'MOHAMMAD MASUM ALAM', 'MD. MOFAZZAL HOQUE MRIDHA', 'BEGUM MONJURA HOQUE', '01914255488', 'dr.masum@yahoo.com', 'upload/documents/181022/photo_181022.JPG', '2018-01-02 14:40:12', NULL, '2018-01-02 20:40:12', 'admin@bigm-bd.com', 1),
(21, '171001', 'shaheenssr7@yahoo.com', 'DXHLHC', NULL, 'A26534', 'shaheen akter', 'akm fazlul haque', 'sharifa begum', '01711901456', 'shaheenssr7@yahoo.com', 'upload/documents/171001/photo_171001.JPG', '2018-01-02 14:39:57', NULL, '2018-01-02 20:39:57', 'admin@bigm-bd.com', 1),
(22, '181023', 'debnathpurabi@yahoo.com', 'UHPJXU', NULL, 'A25401', 'Dr. Purabi Rani Debnath', 'Naresh Chandra Debnath', 'Basanti Debnath', '01711175303', 'debnathpurabi@yahoo.com', 'upload/documents/181023/photo_181023.jpg', '2018-01-02 14:39:46', NULL, '2018-01-02 20:39:46', 'admin@bigm-bd.com', 1),
(23, '181024', 'delwarhschest@yahoo.com', '31DTC7', NULL, '20882', 'Dr. Mohammad Delwar Hossain', 'Md Ismail', 'Nur Jahan Begum', '01819218238', 'delwarhschest@yahoo.com', 'upload/documents/181024/photo_181024.jpg', '2018-01-02 14:39:34', NULL, '2018-01-02 20:39:34', 'admin@bigm-bd.com', 1),
(24, '181025', 'maqsoodfarzana2@gmail.com', 'SBYM0A', NULL, 'A45985', 'FARZANA MAQSOOD', 'MAQSOOD ALI', 'PARVEN CHOWDHURY', '01630472757', 'maqsoodfarzana2@gmail.com', 'upload/documents/181025/photo_181025.jpg', '2018-01-02 14:39:22', NULL, '2018-01-02 20:39:22', 'admin@bigm-bd.com', 1),
(25, '181026', 'muradrahim23@yahoo.com', 'FVBCVM', NULL, 'A 33318', 'Muhammad Abdur Rahim', 'Muhammad Abdur Rouf', 'Relina Rouf', '01674534500', 'muradrahim23@yahoo.com', 'upload/documents/181026/photo_181026.jpg', '2018-01-02 14:39:01', NULL, '2018-01-02 20:39:01', 'admin@bigm-bd.com', 1),
(26, '181027', 'shudhanshukumarsaha@gmail.com', 'ABMJAN', NULL, 'A-31224', 'Shudhanshu Kumar Saha', 'Sunil Kumar Saha', 'Joshna Rani Saha', '01759961995', 'shudhanshukumarsaha@gmail.com', 'upload/documents/181027/photo_181027.jpg', '2018-01-02 13:18:31', NULL, '2018-01-02 19:18:31', 'admin@bigm-bd.com', 1),
(27, '181028', 'shabnamsejooti@gmail.com', 'XEWHKV', NULL, 'A55383', 'Dr. Shabnam Sarwar Sejooti', 'Md. Golam Sarwar Hasan', 'Sabiha Noor Chowdhury', '01712029738', 'shabnamsejooti@gmail.com', 'upload/documents/181028/photo_181028.jpg', '2018-01-02 13:18:21', NULL, '2018-01-02 19:18:21', 'admin@bigm-bd.com', 1),
(28, '181029', 'alamdr2003@yahoo.com', '9DLTHD', NULL, 'A13976', 'PROF. ABUL BASHAR MOHAMMAD KHURSHID ALAM', 'MD. MAMINUL HAQUE', 'BEGUM JAHANARA HAQUE', '01711749096', 'alamdr2003@yahoo.com', 'upload/documents/181029/photo_181029.jpg', '2018-01-02 13:18:11', NULL, '2018-01-02 19:18:11', 'admin@bigm-bd.com', 1),
(29, '181030', 'drmustafiz@hotmail.com', 'LLLCNP', NULL, '23899', 'Dr. Md. Mustafizur Rahman', 'Md. Bazlar Rahman', 'Mrs. Fazrunnessa', '01711619767', 'drmustafiz@hotmail.com', 'upload/documents/181030/photo_181030.jpg', '2018-01-02 13:18:02', NULL, '2018-01-02 19:18:02', 'admin@bigm-bd.com', 1),
(30, '181031', 'salmasultana68@yahoo.com', 'CDMSD5', NULL, 'A23365', 'SALMA SULTANA', 'DR. ALI AHMED CHOWDHURY', 'KHURSHID SULTANA', '01713031044', 'salmasultana68@yahoo.com', 'upload/documents/181031/photo_181031.jpg', '2018-01-02 13:17:47', NULL, '2018-01-02 19:17:47', 'admin@bigm-bd.com', 1),
(31, '181032', 'sahil_nazwa@yahoo.com', '9MU5HM', NULL, '31148', 'Nahid Farhana Amin', 'Nurul Amin', 'Rashida Momtaz', '01552309038', 'sahil_nazwa@yahoo.com', 'upload/documents/181032/photo_181032.jpg', '2018-01-09 05:45:37', NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sif_edu_qualification`
--

CREATE TABLE IF NOT EXISTS `sif_edu_qualification` (
  `id` int(11) NOT NULL,
  `admiss_id` int(11) DEFAULT NULL COMMENT 'sif_admission table id',
  `exam_name` varchar(50) DEFAULT NULL,
  `pass_year` int(4) DEFAULT NULL,
  `exam_group` int(2) DEFAULT NULL,
  `exam_board` int(2) DEFAULT NULL,
  `exam_ins` varchar(255) DEFAULT NULL,
  `exam_result` varchar(8) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sif_edu_qualification`
--

INSERT INTO `sif_edu_qualification` (`id`, `admiss_id`, `exam_name`, `pass_year`, `exam_group`, `exam_board`, `exam_ins`, `exam_result`) VALUES
(37, 19, 'S.S.C', 1971, 1, 7, 'GOVT HIGH SCHOOL,SYLHET', '1ST DIV'),
(38, 19, 'MBBS', 1982, 0, 0, '3', 'PASSED'),
(39, 19, 'FCPS', 1991, 0, 0, 'BCPS', 'PASSED'),
(40, 20, 'S.S.C', 1982, 1, 2, 'Khansama High School', '1st Divi'),
(41, 20, 'H.S.C', 1984, 1, 2, 'Dinajpur Govt. College', '1st Divi'),
(42, 20, 'MBBS', 1990, 0, 0, '1', 'Pass'),
(43, 20, 'Others', 2006, 0, 0, 'National Institute of Preventive & Social Medicine (NIPSOM)', 'Pass'),
(44, 21, 'S.S.C', 1995, 1, 1, 'M D C Model Institute, Pallabi, Mirpur, Dhaka', 'First Di'),
(45, 21, 'H.S.C', 1997, 1, 1, 'B C I C College, Mirpur, Dhaka.', 'First Di'),
(46, 21, 'MBBS', 2004, 0, 0, '4', 'Pass'),
(47, 21, 'MPHIL', 2010, 0, 0, 'Bangabandhu Sheikh Mujib Medical university, Shabag, Dhaka.', 'Pass'),
(48, 22, 'S.S.C', 1991, 1, 1, 'Azimpur Girls High School', 'First'),
(49, 22, 'H.S.C', 1993, 1, 1, 'Begum Badrunnessa Government Womens College', 'First'),
(50, 22, 'MBBS', 1999, 0, 0, '26', 'Regular'),
(51, 22, 'FCPS', 2014, 0, 0, 'BCPS', 'Regular'),
(52, 23, 'S.S.C', 1984, 1, 1, 'Muslim Modern Academy', '1st Divi'),
(53, 23, 'H.S.C', 1986, 1, 0, 'Holycross College', '1st Divi'),
(54, 23, 'MBBS', 1994, 0, 0, '3', 'Passed'),
(55, 23, 'FCPS', 2003, 0, 0, 'bangladesh College Of Physician & Surgeons', 'passed'),
(56, 25, 'S.S.C', 1998, 1, 1, 'Shilmon A. H. M. High School', '1st'),
(57, 25, 'H.S.C', 2000, 1, 1, 'Notredame College', '1st'),
(58, 25, 'MBBS', 2006, 0, 0, '8', 'Pass'),
(59, 25, 'MD', 2014, 0, 0, 'BIRDEM Academy', 'Pass'),
(60, 27, 'S.S.C', 2002, 1, 1, 'mirpur bangla high school', 'GPA 4.75'),
(61, 27, 'H.S.C', 2004, 1, 1, 'SOS HERMANN GMEINER COLLEGE', '5.00'),
(62, 27, 'MBBS', 2011, 0, 0, '6', 'passed'),
(63, 27, 'MD', 2017, 0, 0, 'BSMMU', 'passed'),
(64, 28, 'S.S.C', 1994, 1, 2, 'RANGPUR GOVT. GIRLS HIGH SCHOOL', '1ST DIVI'),
(65, 28, 'H.S.C', 1996, 1, 2, 'NILPHAMARI GOVT. COLLEGE', '1ST DIVI'),
(66, 28, 'MBBS', 2003, 0, 0, '8', 'PASSED'),
(67, 28, 'MPHIL', 2011, 0, 0, 'BIRDEM ACADEMY', 'PASSED'),
(68, 29, 'S.S.C', 1975, 1, 1, 'HATIRDIA S A MODEL HIGH SCHOOL', 'FIRST'),
(69, 29, 'H.S.C', 1977, 1, 1, 'RESIDENTIAL MODEL COLLEGE', 'FIRST'),
(70, 29, 'MBBS', 1984, 0, 0, '3', 'PASSED'),
(71, 29, 'MPHIL', 1989, 0, 0, 'BANGABANDHU SHEIKH MUJIB MEDICAL UNIVERSITY', 'PASSED'),
(72, 30, 'S.S.C', 1996, 1, 1, 'MOTIJHEEL GOVT. BOYS HIGH SCHOOL', 'FIRST (*'),
(73, 30, 'H.S.C', 1998, 1, 1, 'DHAKA COLLEGE', 'FIRST (*'),
(74, 30, 'MBBS', 2004, 0, 0, '7', 'PASSED'),
(75, 30, 'MD', 2014, 0, 0, 'BANGABANDHU SHEIKH MUJIB MEDICAL UNIVERSITY', 'PASSED'),
(76, 33, 'S.S.C', 1980, 1, 1, 'Dighir Par, AC Institution', '1st Divi'),
(77, 33, 'H.S.C', 1982, 1, 1, 'Dhaka College', '1st Divi'),
(78, 33, 'MBBS', 1989, 0, 0, '4', 'Pass'),
(79, 33, 'MD', 2003, 0, 0, '', 'Pass'),
(80, 34, 'S.S.C', 1995, 1, 1, 'AGRANI SCHOOL, DHAKA', '1ST DIVI'),
(81, 34, 'H.S.C', 1997, 1, 1, 'BADRUNESSA COLLEGE, DHAKA.', '1ST DIVI'),
(82, 34, 'MBBS', 2004, 0, 0, '23', 'PASSED'),
(83, 34, 'MPHIL', 2017, 0, 0, 'DHAKA MEDICAL COLLEGE, DHAKA.', 'PASSED'),
(84, 35, 'S.S.C', 1991, 1, 1, 'Dhubaria Sefatullah High School', '1st divi'),
(85, 35, 'H.S.C', 1994, 1, 1, 'Notre Dame College', '1st divi'),
(86, 36, 'S.S.C', 1990, 1, 8, 'Radhanagar B.L. High School', 'Ist Divi'),
(87, 36, 'H.S.C', 1992, 1, 8, 'Magura Govt. H.S.S. college', 'Ist Divi'),
(88, 36, 'MBBS', 2000, 0, 0, '12', 'pass'),
(89, 37, 'S.S.C', 2001, 1, 8, 'Dawood Public School', '4.50'),
(90, 37, 'H.S.C', 2003, 1, 6, 'Sylhet Women College', '4.50'),
(91, 38, 'S.S.C', 1976, 1, 7, 'COMILLA ZILLA SCHOOL', 'FIRST'),
(92, 38, 'H.S.C', 1978, 1, 1, 'DHAKA COLLEGE', 'FIRST'),
(93, 38, 'MBBS', 1984, 0, 0, '8', 'PASS'),
(94, 38, 'FCPS', 1994, 0, 0, 'BCPS', 'QUALIFIE'),
(95, 39, 'S.S.C', 1984, 1, 1, 'Faridpur zilla School ', 'First Di'),
(96, 39, 'H.S.C', 1986, 1, 1, 'Govt. Rajendra College', 'First Di'),
(97, 39, 'MBBS', 1994, 0, 0, '4', 'Passed R'),
(98, 39, 'FCPS', 2003, 0, 0, 'BCPS', 'Regular'),
(99, 40, 'S.S.C', 1983, 1, 7, 'Kusum Kumari Girls’ High School', '1ST DIVI'),
(100, 40, 'H.S.C', 0, 1, 7, 'Chittagong college', '1ST DIVI'),
(101, 40, 'MBBS', 1992, 0, 0, '5', 'passed'),
(102, 40, 'FCPS', 2003, 0, 0, 'BCPS', 'passed'),
(103, 41, 'S.S.C', 1990, 1, 1, 'Agroni Balika Bidyalaya', 'First di'),
(104, 41, 'H.S.C', 1992, 1, 1, 'Viqarunnisa Noon School & College', 'First di'),
(105, 41, 'MBBS', 1999, 0, 0, '26', 'Pass'),
(106, 41, 'MPHIL', 2008, 0, 0, 'Bangabandhu Sheikh Mujib Medical University', 'Pass');

-- --------------------------------------------------------

--
-- Table structure for table `sif_faculty`
--

CREATE TABLE IF NOT EXISTS `sif_faculty` (
  `id` int(10) NOT NULL,
  `course_code` int(10) NOT NULL,
  `faculty_code` int(11) NOT NULL,
  `faculty_name` varchar(80) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(80) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` varchar(80) NOT NULL,
  `status` varchar(30) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sif_faculty`
--

INSERT INTO `sif_faculty` (`id`, `course_code`, `faculty_code`, `faculty_name`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`) VALUES
(1, 0, 1, 'MD', '2017-08-02 11:51:21', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', '1'),
(2, 0, 2, 'MS', '2017-08-02 11:51:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', '1'),
(3, 0, 3, 'Basic Science', '2017-08-02 11:51:33', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', '1'),
(4, 0, 4, 'Surgery', '2017-08-02 11:51:39', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', '1'),
(5, 0, 5, 'Medicine', '2017-08-02 11:51:45', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', '1'),
(6, 0, 6, 'Dentistry', '2017-08-02 11:52:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', '1'),
(7, 0, 7, 'Obs. & Gynae', '2017-08-15 12:24:54', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', '1'),
(8, 0, 8, 'Paediatrics', '2017-08-15 12:25:07', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', '1');

-- --------------------------------------------------------

--
-- Table structure for table `sif_general_info`
--

CREATE TABLE IF NOT EXISTS `sif_general_info` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `tagline` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `fb_id` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `website` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `ah_stu_fee` varchar(20) NOT NULL,
  `ah_tec_payment` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(100) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` varchar(100) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sif_general_info`
--

INSERT INTO `sif_general_info` (`id`, `name`, `tagline`, `email`, `fb_id`, `address`, `phone`, `website`, `logo`, `ah_stu_fee`, `ah_tec_payment`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`) VALUES
(1, 'Certificate in Medical Education :: CMEd', '', '', '', '', '', '', 'upload/logo/8749a2daa73ce2b3d49e967c380cca58.png', '1200.0000', '200.0028', '2017-03-01 10:31:48', '', '0000-00-00 00:00:00', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sif_groups`
--

CREATE TABLE IF NOT EXISTS `sif_groups` (
  `id` mediumint(8) unsigned NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sif_groups`
--

INSERT INTO `sif_groups` (`id`, `name`, `description`) VALUES
(1, 'super-admin', 'Super Admin'),
(2, 'admin', 'Admission/Payment'),
(3, 'editor', 'Result/Exam/Schedule'),
(4, 'teacher', 'Teacher');

-- --------------------------------------------------------

--
-- Table structure for table `sif_institute`
--

CREATE TABLE IF NOT EXISTS `sif_institute` (
  `id` int(10) NOT NULL,
  `institute_name` varchar(80) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(90) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` varchar(80) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sif_institute`
--

INSERT INTO `sif_institute` (`id`, `institute_name`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`) VALUES
(5, 'Abroad', '2017-08-03 08:06:59', 'admin@bigm-bd.com', '0000-00-00 00:00:00', 'admin@bigm-bd.com', 2),
(6, 'BSMMU', '2017-02-11 06:04:28', 'admin@bigm-bd.com', '0000-00-00 00:00:00', 'admin@bigm-bd.com', 1),
(7, 'BPSC', '2017-08-03 08:07:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', 'admin@bigm-bd.com', 2),
(8, 'Others', '2017-02-11 07:17:52', 'admin@bigm-bd.com', '0000-00-00 00:00:00', 'admin@bigm-bd.com', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sif_login_attempts`
--

CREATE TABLE IF NOT EXISTS `sif_login_attempts` (
  `id` int(11) unsigned NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sif_login_attempts`
--

INSERT INTO `sif_login_attempts` (`id`, `ip_address`, `login`, `time`) VALUES
(19, '203.76.125.74', ' admin@bigm-bd.com', 1515479233),
(20, '119.40.84.118', 'nahian_is@yahoo.com', 1515560711);

-- --------------------------------------------------------

--
-- Table structure for table `sif_medical_collage`
--

CREATE TABLE IF NOT EXISTS `sif_medical_collage` (
  `id` int(11) NOT NULL,
  `collage_name` varchar(80) CHARACTER SET utf8 NOT NULL,
  `collage_type` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(90) CHARACTER SET utf8 NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` varchar(80) CHARACTER SET utf8 NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sif_medical_collage`
--

INSERT INTO `sif_medical_collage` (`id`, `collage_name`, `collage_type`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`) VALUES
(1, 'Rajshahi medcal collage', 'Govt', '2017-05-31 09:47:53', 'admin@bigm-bd.com', '0000-00-00 00:00:00', 'admin@bigm-bd.com', 1),
(2, 'Rangpur medcal collage', 'Govt', '2017-05-31 09:47:47', 'admin@bigm-bd.com', '0000-00-00 00:00:00', 'admin@bigm-bd.com', 1),
(3, 'Dhaka Medical College', 'Govt', '2017-05-31 09:47:36', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(4, 'Mymensing Medical College, Mymensingh', 'Govt', '2017-06-09 03:42:11', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(5, 'Chittagong Medical College, Chittagong', 'Govt', '2017-06-09 03:42:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(6, 'M. A. G. Osmani Medical College, Sylhet', 'Govt', '2017-06-09 03:42:38', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(7, 'Sher-e-Bengla Medical College, Barisal', 'Govt', '2017-06-09 03:43:14', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(8, 'Sir Salimullah Medical College, Dhaka', 'Govt', '2017-06-09 03:43:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(9, 'Comilla Medical College, Comilla', 'Govt', '2017-06-09 03:43:38', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(10, 'Khulna Medical College, Khulna', 'Govt', '2017-06-09 03:43:47', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(11, 'Shaheed Ziaur Rahman Medical College, Bogra', 'Govt', '2017-06-09 03:44:00', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(12, 'Faridpur Medical College, Faridpur', 'Govt', '2017-06-09 03:44:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(13, 'Dinajpur Medical College, Dinajpur', 'Govt', '2017-06-09 03:44:20', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(14, 'Shaheed Sohrawardy Medical College, Dhaka', 'Govt', '2017-06-09 03:44:33', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(15, 'Pabna Medical College, Pabna', 'Govt', '2017-06-09 03:44:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(16, 'Noakhali Medical College, Noakhali', 'Govt', '2017-06-09 03:44:53', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(17, 'Cox''s Bazar Medical College, Cox''s Bazar', 'Govt', '2017-06-09 03:45:05', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(18, 'Jessore Medical College, Jessore', 'Govt', '2017-06-09 03:45:14', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(19, 'Satkhira Medical College, Satkhira', 'Govt', '2017-06-09 03:45:25', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(20, 'Shohid Syed Nazrul Islam Medical College, Kishorgong', 'Govt', '2017-06-09 03:47:38', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(21, 'Kustia Medical College, Kustia', 'Govt', '2017-06-09 03:47:48', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(22, 'Shaikh Shahera Khatun Medical College, Gopalgong', 'Govt', '2017-06-09 03:48:00', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(23, 'Bangladesh Medical College, Dhaka', 'Private', '2017-06-09 03:48:14', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(24, 'Gonoshasthaya Medical College, Savar, Dhaka', 'Private', '2017-06-09 03:48:24', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(25, 'Jahurul Islam Medical College, Kishorgong', 'Private', '2017-06-09 03:48:33', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(26, 'Z.H. Sikder Women Medical College, Dhaka', 'Private', '2017-06-09 03:48:54', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(27, 'Dhaka National Medical College, Dhaka', 'Private', '2017-06-09 03:49:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(28, 'Community Based Medical College, Dhaka', 'Private', '2017-06-09 03:49:17', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(29, 'Jalalabad Ragib Rabeya Medical College, Sylhet', 'Private', '2017-06-09 03:49:30', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(30, 'Shaheed Monsur Ali Medical College, Sylhet', 'Private', '2017-06-09 03:49:40', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(31, 'North East Medical College, Dhaka', 'Private', '2017-06-09 03:49:51', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(32, 'Holy Family Red Creasent Medical College, Dhaka', 'Private', '2017-06-09 03:50:03', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(33, 'International Medical College, Gazipur', 'Private', '2017-06-09 03:50:12', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(34, 'North Bengal Medical College, Sirajgonj', 'Private', '2017-06-09 03:50:25', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(35, 'East West Medical College, Dhaka', 'Private', '2017-06-09 03:50:36', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(36, 'Kumudini Medical College, Tangail', 'Private', '2017-06-09 03:50:46', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(37, 'Tairunnessa Medical College, Gazipur', 'Private', '2017-06-09 03:50:58', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(38, 'Ibrahim Medical College, Dhaka', 'Private', '2017-06-09 03:51:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(39, 'BGC Trust Medical College, Chittagong', 'Private', '2017-06-09 03:51:22', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(40, 'Shabuddin Medical College, Dhaka', 'Private', '2017-06-09 03:51:35', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(41, 'Enam Medical College, Savar', 'Private', '2017-06-09 03:52:15', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(42, 'Islami Bank Medical College, Rajshahi', 'Private', '2017-06-09 03:52:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(43, 'IBN Sina Medical College, Dhaka', 'Private', '2017-06-09 03:52:47', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(44, 'Central Medical College, Comilla', 'Private', '2017-06-09 03:53:00', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(45, 'Eastern Medical College, Comilla', 'Private', '2017-06-09 03:53:12', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(46, 'Khawja Eunus Medical College, Sirajgonj', 'Private', '2017-06-09 03:53:24', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(47, 'Ma O Shishu Medical College, Chittagong', 'Private', '2017-06-09 03:53:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(48, 'Sylhet Women Medical College, Sylhet', 'Private', '2017-06-09 03:53:50', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(49, 'Nightangel Medical College, Ashulia, Dhaka', 'Private', '2017-06-09 03:54:01', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(50, 'Southern Medical College, Chittagong', 'Private', '2017-06-09 03:54:14', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(51, 'Northern International Medical College, Dhaka', 'Private', '2017-06-09 03:54:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(52, 'Uttara Adhunik Medical College , Dhaka', 'Private', '2017-06-09 03:54:39', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(53, 'Delta Medical College, Dhaka', 'Private', '2017-06-09 03:54:54', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(54, 'Addin Women Medical College, Dhaka', 'Private', '2017-06-09 03:55:05', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(55, 'Dhaka Community Medical College, Dhaka', 'Private', '2017-06-09 03:55:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(56, 'TMSS Medical College, Bogra', 'Private', '2017-06-09 03:55:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(57, 'Anwar Khan Modern Medical College, Dhaka', 'Private', '2017-06-09 03:56:15', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(58, 'Prime Medical College, Rangpur', 'Private', '2017-06-09 03:56:25', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(59, 'Rangpur Community Medical College, Rangpur', 'Private', '2017-06-09 03:56:40', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(60, 'Northern Medical College, Rangpur', 'Private', '2017-06-09 03:56:53', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(61, 'Faridpur Diabetic Association Medical College, Faridpur', 'Private', '2017-06-09 03:57:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(62, 'Lab-Aid Medical College, Dhaka', 'Private', '2017-06-09 03:57:19', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(63, 'Green Life Medical College, Dhaka', 'Private', '2017-06-09 03:57:29', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(64, 'Popular Medical College, Dhaka', 'Private', '2017-06-09 03:57:41', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(65, 'MH Shamarita Medical College, Dhaka', 'Private', '2017-06-09 03:57:54', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(66, 'Moonnu Medical College, Manikgonj', 'Private', '2017-06-09 03:58:04', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(67, 'Dhaka Central International Medical College, Dhaka', 'Private', '2017-06-09 03:58:19', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(68, 'Dr. Serajul Islam Medical College, Dhaka', 'Private', '2017-06-09 03:59:04', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(69, 'Marks Medical College, Dhaka', 'Private', '2017-06-09 03:59:18', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(70, 'Maynamoti Medical College, Comilla', 'Private', '2017-06-09 03:59:31', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(71, 'Addin Sokin Medical College, Jessore', 'Private', '2017-06-09 03:59:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(72, 'Gazi Medical College, Khulna', 'Private', '2017-06-09 03:59:52', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(73, 'Barind Medical College, Rajshahi', 'Private', '2017-06-09 04:00:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(74, 'City Medical College, Gazipur', 'Private', '2017-06-09 04:00:17', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(75, 'Others', 'Private', '2017-08-03 10:25:53', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(76, 'Armed Forces Medical College, Dhaka', 'Private', '2017-08-07 09:45:23', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(77, 'Medical College For Women and Hospital', 'Private', '2017-08-08 09:04:23', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(78, 'University Dental College & Hospital', 'Private', '2017-08-17 09:11:43', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(79, 'Udayan Dental College', 'Private', '2017-08-17 10:00:23', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(80, 'Pioneer Dental College', 'Private', '2017-08-17 10:18:19', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(81, 'Sapparo Dental College', 'Private', '2017-08-17 10:22:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(82, 'Chittagong international dental college', 'Private', '2017-08-17 10:36:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sif_reference`
--

CREATE TABLE IF NOT EXISTS `sif_reference` (
  `id` int(11) NOT NULL,
  `admiss_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `designation` varchar(70) NOT NULL,
  `mobile` varchar(45) NOT NULL,
  `relation` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sif_result_process`
--

CREATE TABLE IF NOT EXISTS `sif_result_process` (
  `id` int(11) NOT NULL,
  `exam_id` int(11) DEFAULT NULL,
  `answer_sheet` varchar(255) DEFAULT NULL,
  `result_sheet` varchar(255) DEFAULT NULL,
  `correct_answers` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(50) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `status` varchar(1) DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sif_result_process`
--

INSERT INTO `sif_result_process` (`id`, `exam_id`, `answer_sheet`, `result_sheet`, `correct_answers`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`) VALUES
(79, 3, 'upload/ans/A_RNA_CVS_240317_1_7_217.txt', 'upload/result/RNA_CVS_240317_1_7_217.txt', '["F","F","T","F","T","F","T","T","T","F","T","T","F","F","T","T","F","F","F","F","T","T","T","F","F","T","F","F","T","T","F","F","F","T","T","F","T","F","T","T","F","T","T","F","F","T","T","T","F","F","T","T","F","F","T","F","T","T","F","T","T","F","F","F","T","T","T","T","T","F","F","F","T","F","T","T","T","F","T","T","F","F","T","F","T","F","T","T","F","T","T","F","F","F","F","T","F","F","F","T","F","T","T","F","T","T","T","F","T","F","T","T","F","T","T","T","F","T","F","F","T","F","F","T","T","F","T","T","F","F","T","F","T","T","F","F","T","T","T","F","T","F","F","T","F","T","F","T","F","T","F","T","F","T","T","T","T","F","F","T","F","F","T","T","F","T","T","T","F","F","T","F","F","T","F","F","F","T","T","F","F","T","T","F","F","F","T","F","T","F","F","F","T","T","F","T","T","T","F","F"]', '2017-08-22 16:52:59', 'admin@bigm-bd.com', NULL, NULL, '1'),
(80, 4, 'upload/ans/Ans_RNA-Neuron19.txt', 'upload/result/D_80_180817_1_7_319.TXT,upload/result/D_80_180817_1_7_3_119.TXT', '["T","F","F","T","F","T","F","T","F","T","T","T","F","F","T","T","T","F","T","T","T","T","T","F","F","F","T","F","T","T","F","F","F","T","T","F","T","F","T","T","F","T","T","T","F","T","F","T","T","F","T","F","T","F","F","F","F","T","F","F","T","T","T","F","F","T","F","T","F","T","F","T","F","T","F","T","F","F","T","T","T","F","T","T","F","T","F","F","T","T","F","T","T","T","F","F","T","F","T","F","F","T","T","F","F","T","F","T","F","F","T","T","F","F","T","F","T","F","T","T","T","F","F","T","T","T","F","T","T","F","T","T","F","F","T","F","T","T","F","T","T","F","F","T","T","T","T","F","F","F","T","F","F","T","T","F","F","T","F","F","F","F","T","T","T","T","F","T","F","F","F","F","T","T","F","F","F","F","T","F","T","T","T","F","F","T","T","F","F","F","T","T","T","F","F","T","T","T","T","F","T","T","T","F","F","F","T","F","T","F","F","T","F","T","T","T","T","F","T","F","F","T","T","F","T","T","F","T","F","F","F","T","T","T","F","T","T","T","T","T","T","T","F","F","T","T","F","F","T","F","T","F","F","F","F","T","F","T","F","T","F","F","F","F","F","T","T","T","T","F","T","T","T","F","F","T","T","T","F","F","T","T","F","T","F","T","T","T","F","T","F","F","T","T","T","F","T","F","F","T","T","F","T","T","F","F","T","F","T","F","F","F","F","T","T","T","T","F","F","T","F","F","T","F","F","T","T","F","F","T","F","F","T","T","T","T","T","F","F","T","T","F","T","T","F","F","F","T","T","T","F","T","F","T","T","T","T","F","F","T","F","T","T","T","T","F","T","T","T","T","F","F","F","T","T","F","T","F","F","T","T","F","F","T","T","F","T","F","T","T","T","F","T","F","F","T","T","T","F","F","T","F","F","T","T","T","F","F","F","F","T","F","F","T","F","T","F","T","T","T","T","T","F","T","T","T","F","F","T","T","T","F","F","F","F","T","F","T","T","F","T","F","T","T","F","T","F","F","T","F","T","T","F","T","F","F","F","T","T","F","F","T","F","T","F","T","F","T","T","T","T","F","T","T","F","T","F","T","T","F","F","F","T","F","F","T","F","F","T","T","T","F","F","F","F","F","T","T","F","F"]', '2017-08-22 16:57:13', 'admin@bigm-bd.com', NULL, NULL, '1');

-- --------------------------------------------------------

--
-- Table structure for table `sif_session`
--

CREATE TABLE IF NOT EXISTS `sif_session` (
  `id` int(10) NOT NULL,
  `ses_id` int(11) NOT NULL,
  `ses_name` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(40) NOT NULL,
  `updated_at` varchar(40) NOT NULL,
  `updated_by` datetime NOT NULL,
  `status` varchar(30) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sif_session`
--

INSERT INTO `sif_session` (`id`, `ses_id`, `ses_name`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`) VALUES
(3, 7, 'July', '2017-02-11 07:04:50', 'admin@bigm-bd.com', '', '0000-00-00 00:00:00', '1'),
(4, 1, 'January', '2017-02-11 07:04:55', 'admin@bigm-bd.com', '', '0000-00-00 00:00:00', '2');

-- --------------------------------------------------------

--
-- Table structure for table `sif_teacher`
--

CREATE TABLE IF NOT EXISTS `sif_teacher` (
  `id` int(11) NOT NULL,
  `teacher_id` varchar(25) NOT NULL,
  `tec_name` varchar(70) NOT NULL,
  `tec_type` varchar(255) DEFAULT NULL,
  `fath_name` varchar(70) NOT NULL,
  `mother_name` varchar(70) NOT NULL,
  `dob` varchar(15) NOT NULL,
  `joining_date` date NOT NULL,
  `gender` varchar(100) DEFAULT NULL,
  `religion` int(1) NOT NULL,
  `nationality` varchar(12) NOT NULL,
  `na_id` varchar(25) NOT NULL,
  `pass_no` varchar(30) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `bmdc_no` varchar(30) NOT NULL,
  `per_add` varchar(120) NOT NULL,
  `mai_add` varchar(120) NOT NULL,
  `spouse_name` varchar(50) NOT NULL,
  `pouse_mobile` varchar(15) NOT NULL,
  `blood_gro` varchar(6) NOT NULL,
  `per_divi` varchar(10) NOT NULL,
  `per_dist` varchar(10) NOT NULL,
  `per_thana` varchar(10) NOT NULL,
  `per_address` varchar(50) NOT NULL,
  `mai_divi` varchar(10) NOT NULL,
  `mai_dist` varchar(10) NOT NULL,
  `mai_thana` varchar(10) NOT NULL,
  `mai_address` varchar(50) NOT NULL,
  `photo` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(25) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` varchar(25) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sif_teacher`
--

INSERT INTO `sif_teacher` (`id`, `teacher_id`, `tec_name`, `tec_type`, `fath_name`, `mother_name`, `dob`, `joining_date`, `gender`, `religion`, `nationality`, `na_id`, `pass_no`, `mobile`, `telephone`, `email`, `bmdc_no`, `per_add`, `mai_add`, `spouse_name`, `pouse_mobile`, `blood_gro`, `per_divi`, `per_dist`, `per_thana`, `per_address`, `mai_divi`, `mai_dist`, `mai_thana`, `mai_address`, `photo`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`) VALUES
(1, '17100001', 'Prof. Humayun Kabir Chowdhury', 'Senior Tutor', 'Father Name', 'Mother Name', '1980-10-14', '2017-10-14', '0', 0, 'Bangladeshi', '09876543210987', '', '01911430370', '', 'hkabirdr@gmail.com', '423445', '', '', '', '', 'A+', '', '', '', '', '', '', '', '', 'upload/photo/17100001.jpg', '2018-01-08 12:22:39', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(2, '17100002', 'Prof. Tahmina Begum', 'Senior Tutor', 'Father Name', 'Mother Name', '1965-10-14', '2017-10-14', '0', 0, 'Bangladeshi', '09876543210987', '', '01911430345', '', 'tahminabaari@gmail.com', '423423', '', '', '', '', 'AB+', '', '', '', '', '', '', '', '', 'upload/photo/17100002.jpg', '2018-01-08 12:21:43', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(3, '17100003', 'Prof. Shah Alam', 'Senior Tutor', 'Father Name', 'Mother Name', '1985-10-14', '2017-10-14', '0', 0, 'Bangladeshi', '09876543210987', '', '01911430354', '', 'drpanna@yahoo.com', '454554', '', '', '', '', 'B+', '', '', '', '', '', '', '', '', 'upload/photo/17100003.jpg', '2018-01-08 12:23:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(4, '17120004', 'Prof. Ferdousy Begum Flora', '', '', '', '2017-12-31', '2017-12-31', '0', 0, '', '', '', '01819223221', '01819223221', 'fbegum9@gmail.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2017-12-31 15:26:03', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(5, '17120005', 'Prof. Muna Salima Jahan', '', '', '', '2017-12-31', '2017-12-31', '0', 0, '', '', '', '01711110090', '', 'shalimajm@gmail.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2017-12-31 15:28:46', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(6, '17120006', 'Prof. ABM Jamal', '', '', '', '2017-12-31', '2017-12-31', '0', 0, '', '', '', '01819230009', '', 'abmjamal2003@yahoo.co.in', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2017-12-31 15:30:07', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(7, '17120007', 'Prof. Khondker Manzare Shamim', '', '', '', '2017-12-31', '2017-12-31', '0', 0, '', '', '', '01711806378', '', 'manzareshamim@gmail.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2017-12-31 15:43:28', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(8, '17120008', 'Prof. Abdul Hanif (Tablu)', '', '', '', '2017-12-31', '2017-12-31', '0', 0, '', '', '', '01715160371', '', 'ahaniftablu@hotmail.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2017-12-31 15:44:50', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(9, '17120009', 'Prof. Abid Hossain Mollah.', '', '', '', '2017-12-31', '2017-12-31', '0', 0, '', '', '', '01711530323', '', 'professorahm@yahoo.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2017-12-31 15:47:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(10, '18010010', 'Prof Shah Alam', '', '', '', '2018-01-01', '2018-01-01', '0', 0, '', '', '', '01711237708', '', 'drpanna@yahoo.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2018-01-01 05:10:56', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(11, '18010011', 'Dr Abul Kalam Md Shamsuddin', 'Faculty', '', '', '2018-01-02', '2018-01-02', '0', 0, '', '', '', '01711367035', '', 'shamsuddin.babu@yahoo.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2018-01-02 05:08:47', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(12, '18010012', 'Dr. Rukshana Ahmed', 'Faculty', '', '', '2018-01-02', '2018-01-02', '0', 0, '', '', '', '01731198874', '', 'rukshanaahmed@gmail.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2018-01-02 05:13:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(13, '18010013', 'Dr. Shamima Parvin', 'Faculty', '', '', '2018-01-02', '2018-01-02', '0', 0, '', '', '', '01759911151', '', 'drs_kabir@yahoo.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2018-01-02 05:15:48', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sif_teacher_edu_qualification`
--

CREATE TABLE IF NOT EXISTS `sif_teacher_edu_qualification` (
  `teacher_auto_id` int(11) NOT NULL COMMENT 'sif_teacher table auto id',
  `exam_name` varchar(8) CHARACTER SET utf8 NOT NULL,
  `pass_year` int(5) NOT NULL,
  `exam_group` int(2) NOT NULL,
  `exam_board` int(2) NOT NULL,
  `exam_ins` varchar(90) CHARACTER SET utf8 NOT NULL,
  `exam_result` varchar(8) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sif_teacher_edu_qualification`
--

INSERT INTO `sif_teacher_edu_qualification` (`teacher_auto_id`, `exam_name`, `pass_year`, `exam_group`, `exam_board`, `exam_ins`, `exam_result`) VALUES
(2, 'S.S.C', 1998, 1, 1, 'Motijheel Model High School, Dhaka', '1st'),
(2, 'H.S.C', 2000, 1, 1, 'NotreDame College, Dhaka', '1st'),
(2, 'MBBS', 2006, 0, 0, '10', 'Passed'),
(1, 'S.S.C', 2001, 1, 1, 'NPHA', '4.75'),
(1, 'H.S.C', 2003, 1, 1, 'Dhaka College, Dhaka', '4.50'),
(1, 'MBBS', 2009, 0, 0, '4', 'Passed'),
(4, 'O Level', 2014, 4, 8, 'Modi possimus ullam perspiciatis eum', 'Officia '),
(4, 'H.S.C', 1956, 2, 7, 'Lorem laboriosam architecto duis et qui dolore fugiat qui veritatis temporibus ipsum ut si', 'Natus ut'),
(4, 'MBBS', 1987, 0, 0, '46', 'Adipisic'),
(4, 'FCPS', 1999, 0, 0, '43', 'Aliquip '),
(4, 'MD/MS En', 1973, 0, 0, '6', 'Dolores ');

-- --------------------------------------------------------

--
-- Table structure for table `sif_users`
--

CREATE TABLE IF NOT EXISTS `sif_users` (
  `id` int(11) unsigned NOT NULL,
  `teacher_id` varchar(20) NOT NULL COMMENT 'Teacher ID',
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `password_view` varchar(100) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) unsigned DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `image` varchar(200) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Yes = 1, No = 0',
  `status` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sif_users`
--

INSERT INTO `sif_users` (`id`, `teacher_id`, `ip_address`, `username`, `password`, `password_view`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `image`, `deleted`, `status`) VALUES
(1, 'teacher_id', 'ip_address', 'username', 'password', 'password_view', 'salt', 'email', 'activation_code', 'forgotten_password_code', 0, 'remember_code', 0, 0, 0, 'first_name', 'last_name', 'company', 'phone', 'image', 0, 0),
(2, '0', '::1', 'admin@bigm-bd.com', '$2y$08$SIVq4jP.ousV4.1qx0WJW.HyoAHR9xX5Wd4MXd9T5/b7i5QcTdhu6', '123456', '', 'admin@bigm-bd.com', '', '', 0, 'HBwjRhDsiBpQ8MwQjl9k3u', 1474185190, 1515560719, 1, 'Admin', 'Istrator', '', '', '', 0, 1),
(9, '0', '::1', 'nahian@bigm-bd.com', '$2y$08$cToKUuV32uuKvqc9jZpzcOWiuZvegp90NnIGg9owvUWZdYabrUvDW', 'VyjD2yrd', '', 'nahian@bigm-bd.com', '', '', 0, 'H2xon8TCQZKt2G9stmeJ8O', 1485946628, 1499952387, 1, 'Julkar', 'Nahian', '', '', 'upload/photo/Sh_(2).jpg', 0, 1),
(19, '17100001', '113.11.57.161', 'hkabirdr@gmail.com', '$2y$08$9M/A6BcH8FEccfAk2W45D.kl2OGiI6dmgQOrR0TbZ.pd/lriIjr/2', 'XbsOVe', '', 'hkabirdr@gmail.com', '', '', 0, 'VrQwx3xhxn.t2K9Pwermi.', 1502967874, 1515414445, 1, 'Prof. Humayun Kabir ', 'Chowdhury', '', '01911430370', '', 0, 1),
(20, '17100002', '113.11.57.161', 'tahminabaari@gmail.com', '$2y$08$ZkuC6GFkNNsCh4M4ytjrE.4WPrHvybppCbC04oWROfJQiXCTxtxbW', 'EJ7txR', '', 'tahminabaari@gmail.com', '', '', 0, '', 1502969000, 0, 1, 'Prof. Tahmina ', 'Begum', '', '01911430345', '', 0, 1),
(21, '17100003', '113.11.57.161', 'drpanna@yahoo.com', '$2y$08$Mha8GuOQxkkz6xh35PUijukUGikL2lSvh2uCuynokR848pJ8gP5NS', 'TKY1A0', '', 'drpanna@yahoo.com', '', '', 0, 'UQ3PSoU6HW9jVkHt6pj4fu', 1506957668, 1515219457, 1, 'Prof. Shah ', 'Alam', '', '39567650252', '', 0, 1),
(22, '17120004', '113.11.57.161', 'fbegum9@gmail.com', '$2y$08$QygHcw59uHY1JOROxwrNeOaI3wsjJIrq.0ZiLSShpT2l4ufP3YVqC', 'A8PBEZ', '', 'fbegum9@gmail.com', '', '', 0, '', 1514733963, 0, 1, 'Prof.', 'Flora', '', '01819223221', '', 0, 1),
(23, '17120005', '113.11.57.161', 'shalimajm@gmail.com', '$2y$08$ef2PSRESC.CEDEe7pX6NP.kpD5v5QClZOZCveHo2eYJO.p5YGcJQC', 'YZQUE5', '', 'shalimajm@gmail.com', '', '', 0, '', 1514734126, 0, 1, 'Prof.', 'Jahan', '', '01711110090', '', 0, 1),
(24, '17120006', '113.11.57.161', 'abmjamal2003@yahoo.co.in', '$2y$08$s7z7zcl4S3SSJOXMkRMqSeJ3iQTqucsYhBRZ9CFu2hZ95GGpilk0e', '3USP99', '', 'abmjamal2003@yahoo.co.in', '', '', 0, 'wMRFIxAKSwtS5WYZooQ3bu', 1514734208, 1515414619, 1, 'Prof.', 'Jamal', '', '01819230009', '', 0, 1),
(25, '17120007', '113.11.57.161', 'manzareshamim@gmail.com', '$2y$08$hTWJ05fe9L0VuebCiD5OU.PIODv9b0TRpH4ltdMmxjuJb14M6sAX.', '3PYRHI', '', 'manzareshamim@gmail.com', '', '', 0, '', 1514735008, 0, 1, 'Prof.', 'Shamim', '', '01711806378', '', 0, 1),
(26, '17120008', '113.11.57.161', 'ahaniftablu@hotmail.com', '$2y$08$Nq1xuaM8J9HeGtZkeTCG3OXZcCdaUTqTdEQaGea0lo6GvET81ojw6', 'EJJUZ9', '', 'ahaniftablu@hotmail.com', '', '', 0, '', 1514735091, 0, 1, 'Prof.', '(Tablu)', '', '01715160371', '', 0, 1),
(27, '17120009', '113.11.57.161', 'professorahm@yahoo.com', '$2y$08$jB5EZ1ZmHar9zNFeWgCMKuzR7Fyds6yna6AIE6kwgaBBIE9pi6b1O', 'ABAU9B', '', 'professorahm@yahoo.com', '', '', 0, 'iN/9SSpE.ZPFHmiMyCpyk.', 1514735246, 1515560750, 1, 'Prof.', 'Mollah.', '', '01711530323', '', 0, 1),
(29, '18010011', '119.40.88.146', 'shamsuddin.babu@yahoo.com', '$2y$08$K3.BB10smHjDyXnSS0glhu4mf1CAa.6FUgYdAwYqfHNfkNGIx.Bjm', 'GIICG7', '', 'shamsuddin.babu@yahoo.com', '', '', 0, '', 1514869727, 0, 1, 'Dr', 'Shamsuddin', '', '01711367035', '', 0, 1),
(30, '18010012', '119.40.88.146', 'rukshanaahmed@gmail.com', '$2y$08$rKI5/WvZIefaZ6dxeqSYYuYmlKYnXXxyZMvzPPfpWHFgq4rpuZx42', '34YAYY', '', 'rukshanaahmed@gmail.com', '', '', 0, '', 1514869982, 0, 1, 'Dr.', 'Khanom', '', '01731198874', '', 0, 1),
(31, '18010013', '119.40.88.146', 'drs_kabir@yahoo.com', '$2y$08$XKzAziYkdxgG3OWpvp8kVeGTp28RQSeo8cLtwoPcccqjF6KgKiCQS', 'ABCDEF', '', 'drs_kabir@yahoo.com', '', '', 0, 'OJDaUPKUICRvQBudlx4L1O', 1514870148, 1515329706, 1, 'Dr.', 'Parvin', '', '01759911151', '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sif_users_groups`
--

CREATE TABLE IF NOT EXISTS `sif_users_groups` (
  `id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sif_users_groups`
--

INSERT INTO `sif_users_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 0, 0),
(3, 2, 1),
(8, 8, 4),
(9, 9, 1),
(10, 10, 4),
(11, 11, 4),
(19, 12, 4),
(17, 13, 4),
(20, 14, 4),
(21, 15, 4),
(22, 16, 4),
(23, 17, 4),
(24, 18, 4),
(25, 19, 4),
(26, 20, 4),
(27, 21, 4),
(28, 22, 4),
(29, 23, 4),
(30, 24, 4),
(31, 25, 4),
(32, 26, 4),
(33, 27, 4),
(34, 28, 4),
(35, 29, 4),
(36, 30, 4),
(37, 31, 4);

-- --------------------------------------------------------

--
-- Table structure for table `thanas`
--

CREATE TABLE IF NOT EXISTS `thanas` (
  `THANA_ID` varchar(6) DEFAULT NULL,
  `DISTRICT_ID` varchar(4) DEFAULT NULL,
  `THANA_CODE` varchar(2) DEFAULT NULL,
  `THANA_NAME` varchar(100) DEFAULT NULL,
  `ENTERED_BY` varchar(10) DEFAULT NULL,
  `ENTRY_TIMESTAMP` datetime DEFAULT NULL,
  `LAST_UPDATED_BY` varchar(10) DEFAULT NULL,
  `LAST_UPDATED_TIMESTAMP` datetime DEFAULT NULL,
  `AREA_STATUS` varchar(1) DEFAULT NULL,
  `DISTRICT_HQ` decimal(1,0) DEFAULT NULL,
  `M_STATUS` decimal(1,0) DEFAULT NULL,
  `SEQEAP` decimal(1,0) DEFAULT NULL,
  `THANA_NAMEB` varchar(50) DEFAULT NULL,
  `POP07` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `thanas`
--

INSERT INTO `thanas` (`THANA_ID`, `DISTRICT_ID`, `THANA_CODE`, `THANA_NAME`, `ENTERED_BY`, `ENTRY_TIMESTAMP`, `LAST_UPDATED_BY`, `LAST_UPDATED_TIMESTAMP`, `AREA_STATUS`, `DISTRICT_HQ`, `M_STATUS`, `SEQEAP`, `THANA_NAMEB`, `POP07`) VALUES
('023029', '0230', '29', 'FENI SADAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???? ???', NULL),
('023041', '0230', '41', 'FULGAZI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('023051', '0230', '51', 'PARSHURAM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('023094', '0230', '94', 'SONAGAZI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('024643', '0246', '43', 'DIGHINALA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('024649', '0246', '49', 'KHAGRACHHARI SADAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????? ???', NULL),
('024661', '0246', '61', 'LAKSHMICHHARI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????????', NULL),
('024665', '0246', '65', 'MAHALCHHARI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('024667', '0246', '67', 'MANIKCHHARI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('024670', '0246', '70', 'MATIRANGA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????????', NULL),
('024677', '0246', '77', 'PANCHHARI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????', NULL),
('024680', '0246', '80', 'RAMGARH', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????', NULL),
('025133', '0251', '33', 'KAMALNAGAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????', NULL),
('025143', '0251', '43', 'LAKSHMIPUR SADAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????? ???', NULL),
('025158', '0251', '58', 'ROYPUR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????', NULL),
('025165', '0251', '65', 'RAMGANJ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('025173', '0251', '73', 'RAMGATI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????', NULL),
('027507', '0275', '07', 'BEGUMGANJ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('027510', '0275', '10', 'CHATKHIL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('027521', '0275', '21', 'COMPANIGANJ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????????', NULL),
('027536', '0275', '36', 'HATIYA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????', NULL),
('027547', '0275', '47', 'KABIRHAT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('027580', '0275', '80', 'SENBAGH', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????', NULL),
('027583', '0275', '83', 'SONAIMURI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????', NULL),
('027585', '0275', '85', 'SUBARNACHAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('027587', '0275', '87', 'NOAKHALI SADAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????? ???', NULL),
('032665', '0326', '65', 'PALTAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????', NULL),
('032666', '0326', '66', 'RAMNA', NULL, NULL, NULL, NULL, 'C', NULL, NULL, NULL, '????', NULL),
('032668', '0326', '68', 'SABUJBAGH', NULL, NULL, NULL, NULL, 'C', NULL, NULL, NULL, '???????', NULL),
('032672', '0326', '72', 'SAVAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????', NULL),
('032674', '0326', '74', 'SHAH ALI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????? ???', NULL),
('032675', '0326', '75', 'SHAHBAGH', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????', NULL),
('032676', '0326', '76', 'SHYAMPUR', NULL, NULL, NULL, NULL, 'C', NULL, NULL, NULL, '????????', NULL),
('032688', '0326', '88', 'SUTRAPUR', NULL, NULL, NULL, NULL, 'C', NULL, NULL, NULL, '?????????', NULL),
('032690', '0326', '90', 'TEJGAON', NULL, NULL, NULL, NULL, 'C', NULL, NULL, NULL, '???????', NULL),
('032692', '0326', '92', 'TEJGAON IND. AREA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????? ????? ?????', NULL),
('032693', '0326', '93', 'TURAG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????', NULL),
('032695', '0326', '95', 'UTTARA', NULL, NULL, NULL, NULL, 'C', NULL, NULL, NULL, '??????', NULL),
('032696', '0326', '96', 'UTTAR KHAN', NULL, NULL, NULL, NULL, 'C', NULL, NULL, NULL, '????? ???', NULL),
('032903', '0329', '03', 'ALFADANGA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????????', NULL),
('032910', '0329', '10', 'BHANGA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????', NULL),
('032918', '0329', '18', 'BOALMARI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????', NULL),
('032921', '0329', '21', 'CHAR BHADRASAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?? ???????', NULL),
('032947', '0329', '47', 'FARIDPUR SADAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????? ???', NULL),
('032956', '0329', '56', 'MADHUKHALI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('032962', '0329', '62', 'NAGARKANDA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????', NULL),
('032984', '0329', '84', 'SADARPUR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????', NULL),
('033330', '0333', '30', 'GAZIPUR SADAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????? ???', NULL),
('033332', '0333', '32', 'KALIAKAIR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????', NULL),
('033334', '0333', '34', 'KALIGANJ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('033336', '0333', '36', 'KAPASIA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('033386', '0333', '86', 'SREEPUR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('033532', '0335', '32', 'GOPALGANJ SADAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????? ???', NULL),
('033543', '0335', '43', 'KASHIANI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('033551', '0335', '51', 'KOTALIPARA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????????', NULL),
('033558', '0335', '58', 'MUKSUDPUR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????', NULL),
('033591', '0335', '91', 'TUNGIPARA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('033907', '0339', '07', 'BAKSHIGANJ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????????', NULL),
('033915', '0339', '15', 'DEWANGANJ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????????', NULL),
('033929', '0339', '29', 'ISLAMPUR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('033936', '0339', '36', 'JAMALPUR SADAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????? ???', NULL),
('033958', '0339', '58', 'MADARGANJ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????', NULL),
('033961', '0339', '61', 'MELANDAHA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('033985', '0339', '85', 'SARISHABARI UPAZILA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????? ??????', NULL),
('034802', '0348', '02', 'AUSTAGRAM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????', NULL),
('034806', '0348', '06', 'BAJITPUR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('034811', '0348', '11', 'BHAIRAB', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????', NULL),
('034827', '0348', '27', 'HOSSAINPUR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('034833', '0348', '33', 'ITNA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????', NULL),
('034842', '0348', '42', 'KARIMGANJ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('034845', '0348', '45', 'KATIADI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('034849', '0348', '49', 'KISHOREGANJ SADAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????? ???', NULL),
('034854', '0348', '54', 'KULIAR CHAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????', NULL),
('034859', '0348', '59', 'MITHAMAIN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????', NULL),
('034876', '0348', '76', 'NIKLI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????', NULL),
('034879', '0348', '79', 'PAKUNDIA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????????', NULL),
('034892', '0348', '92', 'TARAIL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????', NULL),
('035440', '0354', '40', 'KALKINI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('035454', '0354', '54', 'MADARIPUR SADAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????? ???', NULL),
('035480', '0354', '80', 'RAJOIR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????', NULL),
('035487', '0354', '87', 'SHIB CHAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????? ??', NULL),
('035610', '0356', '10', 'DAULATPUR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('035622', '0356', '22', 'GHIOR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????', NULL),
('035628', '0356', '28', 'HARIRAMPUR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????', NULL),
('035646', '0356', '46', 'MANIKGANJ SADAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????? ???', NULL),
('035670', '0356', '70', 'SATURIA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('035678', '0356', '78', 'SHIBALAYA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????', NULL),
('035682', '0356', '82', 'SINGAIR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('035924', '0359', '24', 'GAZARIA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('035944', '0359', '44', 'LOHAJANG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????', NULL),
('035956', '0359', '56', 'MUNSHIGANJ SADAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????? ???', NULL),
('035974', '0359', '74', 'SERAJDIKHAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????????', NULL),
('035984', '0359', '84', 'SREENAGAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('035994', '0359', '94', 'TONGIBARI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????????', NULL),
('036113', '0361', '13', 'BHALUKA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????', NULL),
('036116', '0361', '16', 'DHOBAURA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('036120', '0361', '20', 'FULBARIA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????', NULL),
('036122', '0361', '22', 'GAFFARGAON', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('036123', '0361', '23', 'GAURIPUR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('036124', '0361', '24', 'HALUAGHAT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????', NULL),
('036131', '0361', '31', 'ISHWARGANJ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????', NULL),
('036152', '0361', '52', 'MYMENSINGH SADAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????? ???', NULL),
('036165', '0361', '65', 'MUKTAGACHHA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????????', NULL),
('036172', '0361', '72', 'NANDAIL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('036181', '0361', '81', 'PHULPUR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????', NULL),
('036194', '0361', '94', 'TRISHAL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('036702', '0367', '02', 'ARAIHAZAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????', NULL),
('036704', '0367', '04', 'SONARGAON', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????', NULL),
('036706', '0367', '06', 'BANDAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????', NULL),
('036758', '0367', '58', 'NARAYANGANJ SADAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????? ???', NULL),
('036768', '0367', '68', 'RUPGANJ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('036807', '0368', '07', 'BELABO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????', NULL),
('036852', '0368', '52', 'MANOHARDI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('036860', '0368', '60', 'NARSINGDI SADAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????? ???', NULL),
('036863', '0368', '63', 'PALASH', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????', NULL),
('036864', '0368', '64', 'ROYPURA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('036876', '0368', '76', 'SHIBPUR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????', NULL),
('037204', '0372', '04', 'ATPARA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????', NULL),
('037209', '0372', '09', 'BARHATTA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????', NULL),
('037218', '0372', '18', 'DURGAPUR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????', NULL),
('037238', '0372', '38', 'KHALIAJURI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????????', NULL),
('037240', '0372', '40', 'KALMAKANDA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????????', NULL),
('037247', '0372', '47', 'KENDUA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('037256', '0372', '56', 'MADAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??? ', NULL),
('037263', '0372', '63', 'MOHANGANJ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('037274', '0372', '74', 'NETROKONA SADAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????? ???', NULL),
('037283', '0372', '83', 'PURBADHALA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('038207', '0382', '07', 'BALIAKANDI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????????', NULL),
('038229', '0382', '29', 'GOALANDA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('038273', '0382', '73', 'PANGSHA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????', NULL),
('038276', '0382', '76', 'RAJBARI SADAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????? ???', NULL),
('038614', '0386', '14', 'BHEDARGANJ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????', NULL),
('038625', '0386', '25', 'DAMUDYA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('038636', '0386', '36', 'GOSAIRHAT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????', NULL),
('038665', '0386', '65', 'NARIA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????', NULL),
('038669', '0386', '69', 'SHARIATPUR SADAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????? ???', NULL),
('038694', '0386', '94', 'ZANJIRA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????', NULL),
('038937', '0389', '37', 'JHENAIGATI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????', NULL),
('038967', '0389', '67', 'NAKLA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????', NULL),
('038970', '0389', '70', 'NALITABARI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????????', NULL),
('038988', '0389', '88', 'SHERPUR SADAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????? ???', NULL),
('038990', '0389', '90', 'SREEBARDI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????', NULL),
('039309', '0393', '09', 'BASAIL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????', NULL),
('039319', '0393', '19', 'BHUAPUR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('039323', '0393', '23', 'DELDUAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('039325', '0393', '25', 'DHANBARI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????', NULL),
('039328', '0393', '28', 'GHATAIL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????', NULL),
('039338', '0393', '38', 'GOPALPUR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('039347', '0393', '47', 'KALIHATI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('039357', '0393', '57', 'MADHUPUR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????', NULL),
('039366', '0393', '66', 'MIRZAPUR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????', NULL),
('039376', '0393', '76', 'NAGARPUR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('039385', '0393', '85', 'SAKHIPUR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????', NULL),
('039395', '0393', '95', 'TANGAIL SADAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????? ???', NULL),
('040108', '0401', '08', 'BAGERHAT SADAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????? ???', NULL),
('040114', '0401', '14', 'CHITALMARI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('040134', '0401', '34', 'FAKIRHAT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('040138', '0401', '38', 'KACHUA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????', NULL),
('040156', '0401', '56', 'MOLLAHAT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????', NULL),
('040158', '0401', '58', 'MONGLA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????', NULL),
('040160', '0401', '60', 'MORRELGANJ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????', NULL),
('040173', '0401', '73', 'RAMPAL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????', NULL),
('040177', '0401', '77', 'SARANKHOLA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('041807', '0418', '07', 'ALAMDANGA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????', NULL),
('041823', '0418', '23', 'CHUADANGA SADAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????? ???', NULL),
('041831', '0418', '31', 'DAMURHUDA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????', NULL),
('041855', '0418', '55', 'JIBAN NAGAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???? ???', NULL),
('044104', '0441', '04', 'ABHAYNAGAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????', NULL),
('044109', '0441', '09', 'BAGHER PARA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????', NULL),
('044111', '0441', '11', 'CHAUGACHHA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????', NULL),
('044123', '0441', '23', 'JHIKARGACHHA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('044138', '0441', '38', 'KESHABPUR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('044147', '0441', '47', 'KOTWALI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('044161', '0441', '61', 'MANIRAMPUR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????', NULL),
('044190', '0441', '90', 'SHARSHA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????', NULL),
('044414', '0444', '14', 'HARINAKUNDA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????????', NULL),
('044419', '0444', '19', 'JHENAIDAH SADAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????? ???', NULL),
('044433', '0444', '33', 'KALIGANJ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('044442', '0444', '42', 'KOTCHANDPUR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????????', NULL),
('044471', '0444', '71', 'MAHESHPUR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('044480', '0444', '80', 'SHAILKUPA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('044712', '0447', '12', 'BATIAGHATA', NULL, NULL, NULL, NULL, 'C', NULL, NULL, NULL, '??????????', NULL),
('044717', '0447', '17', 'DACOPE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????', NULL),
('044721', '0447', '21', 'DAULATPUR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('044730', '0447', '30', 'DUMURIA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('044740', '0447', '40', 'DIGHALIA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('044745', '0447', '45', 'KHALISHPUR', NULL, NULL, NULL, NULL, 'C', NULL, NULL, NULL, '????????', NULL),
('044748', '0447', '48', 'KHAN JAHAN ALI', NULL, NULL, NULL, NULL, 'C', NULL, NULL, NULL, '??? ????? ???', NULL),
('044751', '0447', '51', 'KHULNA SADAR', NULL, NULL, NULL, NULL, 'C', NULL, NULL, NULL, '????? ???', NULL),
('044753', '0447', '53', 'KOYRA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????', NULL),
('044764', '0447', '64', 'PAIKGACHHA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('044769', '0447', '69', 'PHULTALA', NULL, NULL, NULL, NULL, 'C', NULL, NULL, NULL, '??????', NULL),
('044775', '0447', '75', 'RUPSA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????', NULL),
('044785', '0447', '85', 'SONADANGA', NULL, NULL, NULL, NULL, 'C', NULL, NULL, NULL, '??????????', NULL),
('044794', '0447', '94', 'TEROKHADA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('045015', '0450', '15', 'BHERAMARA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('045039', '0450', '39', 'DAULATPUR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('045063', '0450', '63', 'KHOKSA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('045071', '0450', '71', 'KUMARKHALI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('045079', '0450', '79', 'KUSHTIA SADAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????? ???', NULL),
('045094', '0450', '94', 'MIRPUR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????', NULL),
('045557', '0455', '57', 'MAGURA SADAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????? ???', NULL),
('045566', '0455', '66', 'MOHAMMADPUR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????', NULL),
('045585', '0455', '85', 'SHALIKHA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????', NULL),
('045595', '0455', '95', 'SREEPUR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('045747', '0457', '47', 'GANGNI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????', NULL),
('045760', '0457', '60', 'MUJIB NAGAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???? ???', NULL),
('045787', '0457', '87', 'MEHERPUR SADAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????? ???', NULL),
('046528', '0465', '28', 'KALIA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????', NULL),
('046552', '0465', '52', 'LOHAGARA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('046576', '0465', '76', 'NARAIL SADAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????? ???', NULL),
('048704', '0487', '04', 'ASSASUNI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('048725', '0487', '25', 'DEBHATA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('048743', '0487', '43', 'KALAROA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('048747', '0487', '47', 'KALIGANJ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('048782', '0487', '82', 'SATKHIRA SADAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????? ???', NULL),
('048786', '0487', '86', 'SHYAMNAGAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('048790', '0487', '90', 'TALA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????', NULL),
('051006', '0510', '06', 'ADAMDIGHI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('051020', '0510', '20', 'BOGRA SADAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????? ???', NULL),
('051027', '0510', '27', 'DHUNAT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????', NULL),
('051033', '0510', '33', 'DHUPCHANCHIA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????????', NULL),
('051040', '0510', '40', 'GABTALI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????', NULL),
('051054', '0510', '54', 'KAHALOO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????', NULL),
('051067', '0510', '67', 'NANDIGRAM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????????', NULL),
('051081', '0510', '81', 'SARIAKANDI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????????', NULL),
('051085', '0510', '85', 'SHAJAHANPUR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????????', NULL),
('051088', '0510', '88', 'SHERPUR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????', NULL),
('051094', '0510', '94', 'SHIBGANJ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????', NULL),
('051095', '0510', '95', 'SONATOLA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('052710', '0527', '10', 'BIRAMPUR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('052712', '0527', '12', 'BIRGANJ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('052717', '0527', '17', 'BIRAL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????', NULL),
('052721', '0527', '21', 'BOCHAGANJ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????', NULL),
('052730', '0527', '30', 'CHIRIRBANDAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????????', NULL),
('052738', '0527', '38', 'FULBARI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('052743', '0527', '43', 'GHORAGHAT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('052747', '0527', '47', 'HAKIMPUR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('052756', '0527', '56', 'KAHAROLE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('052760', '0527', '60', 'KHANSAMA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????', NULL),
('052764', '0527', '64', 'DINAJPUR SADAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????? ???', NULL),
('052769', '0527', '69', 'NAWABGANJ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????', NULL),
('052777', '0527', '77', 'PARBATIPUR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????????', NULL),
('053221', '0532', '21', 'FULCHHARI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????', NULL),
('053224', '0532', '24', 'GAIBANDHA SADAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????? ???', NULL),
('053230', '0532', '30', 'GOBINDAGANJ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????????', NULL),
('053267', '0532', '67', 'PALASHBARI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('053282', '0532', '82', 'SADULLAPUR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????????', NULL),
('053288', '0532', '88', 'SAGHATA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????', NULL),
('053291', '0532', '91', 'SUNDARGANJ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????????', NULL),
('053813', '0538', '13', 'AKKELPUR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????', NULL),
('053847', '0538', '47', 'JOYPURHAT SADAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????? ???', NULL),
('053858', '0538', '58', 'KALAI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????', NULL),
('053861', '0538', '61', 'KHETLAL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('053874', '0538', '74', 'PANCHBIBI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('054906', '0549', '06', 'BHURUNGAMARI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????????', NULL),
('054908', '0549', '08', 'CHAR RAJIBPUR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?? ????????', NULL),
('054909', '0549', '09', 'CHILMARI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('054918', '0549', '18', 'PHULBARI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('054952', '0549', '52', 'KURIGRAM SADAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????? ???', NULL),
('054961', '0549', '61', 'NAGESHWARI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????', NULL),
('054977', '0549', '77', 'RAJARHAT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('054979', '0549', '79', 'RAUMARI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????', NULL),
('054994', '0549', '94', 'ULIPUR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????', NULL),
('055202', '0552', '02', 'ADITMARI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('055233', '0552', '33', 'HATIBANDHA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????????', NULL),
('055239', '0552', '39', 'KALIGANJ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('055255', '0552', '55', 'LALMONIRHAT SADAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????? ???', NULL),
('055270', '0552', '70', 'PATGRAM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('056403', '0564', '03', 'ATRAI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????', NULL),
('056406', '0564', '06', 'BADALGACHHI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('056428', '0564', '28', 'DHAMOIRHAT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('056447', '0564', '47', 'MANDA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????', NULL),
('056450', '0564', '50', 'MAHADEBPUR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????', NULL),
('056460', '0564', '60', 'NAOGAON SADAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????? ???', NULL),
('056469', '0564', '69', 'NIAMATPUR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????', NULL),
('056475', '0564', '75', 'PATNITALA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('056479', '0564', '79', 'PORSHA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????', NULL),
('056485', '0564', '85', 'RANINAGAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('056486', '0564', '86', 'SAPAHAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('056909', '0569', '09', 'BAGATIPARA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????????', NULL),
('056915', '0569', '15', 'BARAIGRAM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('056941', '0569', '41', 'GURUDASPUR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????????', NULL),
('056944', '0569', '44', 'LALPUR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????', NULL),
('056963', '0569', '63', 'NATORE SADAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????? ???', NULL),
('056991', '0569', '91', 'SINGRA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????', NULL),
('057018', '0570', '18', 'BHOLAHAT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('057037', '0570', '37', 'GOMASTAPUR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????????', NULL),
('057056', '0570', '56', 'NACHOLE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????', NULL),
('057066', '0570', '66', 'CHAPAI NABABGANJ SADAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????? ???????? ???', NULL),
('057088', '0570', '88', 'SHIBGANJ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('057312', '0573', '12', 'DIMLA UPAZILA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????? ??????', NULL),
('057315', '0573', '15', 'DOMAR UPAZILA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????? ??????', NULL),
('057336', '0573', '36', 'JALDHAKA UPAZILA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????? ??????', NULL),
('057345', '0573', '45', 'KISHOREGANJ UPAZILA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????? ??????', NULL),
('057364', '0573', '64', 'NILPHAMARI SADAR UPAZ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????? ??? ??????', NULL),
('057385', '0573', '85', 'SAIDPUR UPAZILA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????? ??????', NULL),
('057605', '0576', '05', 'ATGHARIA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('057616', '0576', '16', 'BERA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????', NULL),
('057619', '0576', '19', 'BHANGURA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('057622', '0576', '22', 'CHATMOHAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????', NULL),
('057633', '0576', '33', 'FARIDPUR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('057639', '0576', '39', 'ISHWARDI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('057655', '0576', '55', 'PABNA SADAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????? ???', NULL),
('057672', '0576', '72', 'SANTHIA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('057683', '0576', '83', 'SUJANAGAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('057704', '0577', '04', 'ATWARI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('057725', '0577', '25', 'BODA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????', NULL),
('057734', '0577', '34', 'DEBIGANJ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('057773', '0577', '73', 'PANCHAGARH SADAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????? ???', NULL),
('057790', '0577', '90', 'TENTULIA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????', NULL),
('058110', '0581', '10', 'BAGHA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????', NULL),
('058112', '0581', '12', 'BAGHMARA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('058122', '0581', '22', 'BOALIA', NULL, NULL, NULL, NULL, 'C', NULL, NULL, NULL, '????????', NULL),
('058125', '0581', '25', 'CHARGHAT', NULL, NULL, NULL, NULL, 'C', NULL, NULL, NULL, '??????', NULL),
('058131', '0581', '31', 'DURGAPUR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????', NULL),
('058134', '0581', '34', 'GODAGARI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('058140', '0581', '40', 'MATIHAR', NULL, NULL, NULL, NULL, 'C', NULL, NULL, NULL, '??????', NULL),
('058153', '0581', '53', 'MOHANPUR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('058172', '0581', '72', 'PABA', NULL, NULL, NULL, NULL, 'C', NULL, NULL, NULL, '???', NULL),
('058182', '0581', '82', 'PUTHIA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????', NULL),
('058185', '0581', '85', 'RAJPARA', NULL, NULL, NULL, NULL, 'C', NULL, NULL, NULL, '???????', NULL),
('058190', '0581', '90', 'SHAH MAKHDUM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????? ?????', NULL),
('058194', '0581', '94', 'TANORE', NULL, NULL, NULL, NULL, 'C', NULL, NULL, NULL, '?????', NULL),
('058503', '0585', '03', 'BADARGANJ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('058527', '0585', '27', 'GANGACHARA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('058542', '0585', '42', 'KAUNIA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('058549', '0585', '49', 'RANGPUR SADAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????? ???', NULL),
('058558', '0585', '58', 'MITHA PUKUR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????', NULL),
('058573', '0585', '73', 'PIRGACHHA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('058576', '0585', '76', 'PIRGANJ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('058592', '0585', '92', 'TARAGANJ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('058811', '0588', '11', 'BELKUCHI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('058827', '0588', '27', 'CHAUHALI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????', NULL),
('058844', '0588', '44', 'KAMARKHANDA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????????', NULL),
('058850', '0588', '50', 'KAZIPUR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('058861', '0588', '61', 'ROYGANJ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('058867', '0588', '67', 'SHAHJADPUR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????', NULL),
('058878', '0588', '78', 'SIRAJGANJ SADAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????? ???', NULL),
('058889', '0588', '89', 'TARASH', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????', NULL),
('058894', '0588', '94', 'ULLAH PARA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????? ????', NULL),
('059408', '0594', '08', 'BALIADANGI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????????', NULL),
('059451', '0594', '51', 'HARIPUR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????', NULL),
('059482', '0594', '82', 'PIRGANJ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('059486', '0594', '86', 'RANISANKAIL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????', NULL),
('059494', '0594', '94', 'THAKURGAON SADAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????? ???', NULL),
('063602', '0636', '02', 'AJMIRIGANJ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????????', NULL),
('063605', '0636', '05', 'BAHUBAL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????', NULL),
('063611', '0636', '11', 'BANIACHONG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('063626', '0636', '26', 'CHUNARUGHAT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????', NULL),
('063644', '0636', '44', 'HABIGANJ SADAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????? ???', NULL),
('063668', '0636', '68', 'LAKHAI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????', NULL),
('063671', '0636', '71', 'MADHABPUR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('063677', '0636', '77', 'NABIGANJ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('065814', '0658', '14', 'BARLEKHA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????', NULL),
('065835', '0658', '35', 'JURI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????', NULL),
('065856', '0658', '56', 'KAMALGANJ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('065865', '0658', '65', 'KULAURA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('065874', '0658', '74', 'MAULVIBAZAR SADAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????? ???', NULL),
('065880', '0658', '80', 'RAJNAGAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????', NULL),
('065883', '0658', '83', 'SREEMANGAL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????', NULL),
('069018', '0690', '18', 'BISHWAMBARPUR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????????', NULL),
('069023', '0690', '23', 'CHHATAK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????', NULL),
('069027', '0690', '27', 'DAKSHIN SUNAMGANJ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????? ?????????', NULL),
('069029', '0690', '29', 'DERAI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????', NULL),
('069032', '0690', '32', 'DHARAMPASHA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('069033', '0690', '33', 'DOWARABAZAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????? ?????', NULL),
('069047', '0690', '47', 'JAGANNATHPUR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????????', NULL),
('069050', '0690', '50', 'JAMALGANJ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????', NULL),
('069086', '0690', '86', 'SULLA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????', NULL),
('069089', '0690', '89', 'SUNAMGANJ SADAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????? ???', NULL),
('069092', '0690', '92', 'TAHIRPUR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('069108', '0691', '08', 'BALAGANJ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('069117', '0691', '17', 'BEANI BAZAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????? ?????', NULL),
('069120', '0691', '20', 'BISHWANATH', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('069127', '0691', '27', 'COMPANIGANJ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????????', NULL),
('069131', '0691', '31', 'DAKSHIN SURMA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????? ?????', NULL),
('069135', '0691', '35', 'FENCHUGANJ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????????', NULL),
('069138', '0691', '38', 'GOLAPGANJ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????', NULL),
('069141', '0691', '41', 'GOWAINGHAT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????', NULL),
('069153', '0691', '53', 'JAINTIAPUR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????', NULL),
('069159', '0691', '59', 'KANAIGHAT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('069162', '0691', '62', 'SYLHET SADAR', NULL, NULL, NULL, NULL, 'C', NULL, NULL, NULL, '????? ???', NULL),
('069194', '0691', '94', 'ZAKIGANJ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('033387', '0333', '87', 'TONGI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('028407', '0284', '07', 'BAGHAICHHARI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('028421', '0284', '21', 'BARKAL UPAZILA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????', NULL),
('028425', '0284', '25', 'KAWKHALI (BETBUNIA)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????? ?????????', NULL),
('028429', '0284', '29', 'BELAI CHHARI  UPAZI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('028436', '0284', '36', 'KAPTAI  UPAZILA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('028447', '0284', '47', 'JURAI CHHARI UPAZIL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('028458', '0284', '58', 'LANGADU  UPAZILA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('028475', '0284', '75', 'NANIARCHAR  UPAZILA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????', NULL),
('028478', '0284', '78', 'RAJASTHALI  UPAZILA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????', NULL),
('028487', '0284', '87', 'RANGAMATI SADAR  UP', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????????', NULL),
('032602', '0326', '02', 'ADABOR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????', NULL),
('032604', '0326', '04', 'BADDA', NULL, NULL, NULL, NULL, 'C', NULL, NULL, NULL, '??????', NULL),
('032606', '0326', '06', 'BIMAN BANDAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????? ?????', NULL),
('032608', '0326', '08', 'CANTONMENT', NULL, NULL, NULL, NULL, 'C', NULL, NULL, NULL, '?????????????', NULL),
('032610', '0326', '10', 'DAKSHINKHAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????', NULL),
('032612', '0326', '12', 'DEMRA', NULL, NULL, NULL, NULL, 'C', NULL, NULL, NULL, '?????', NULL),
('032614', '0326', '14', 'DHAMRAI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????', NULL),
('032616', '0326', '16', 'DHANMONDI', NULL, NULL, NULL, NULL, 'C', NULL, NULL, NULL, '????????', NULL),
('032618', '0326', '18', 'DOHAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????', NULL),
('032626', '0326', '26', 'GULSHAN', NULL, NULL, NULL, NULL, 'C', NULL, NULL, NULL, '??????', NULL),
('032628', '0326', '28', 'HAZARIBAGH', NULL, NULL, NULL, NULL, 'C', NULL, NULL, NULL, '?????????', NULL),
('032629', '0326', '29', 'JATRABARI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????????', NULL),
('032630', '0326', '30', 'KAFRUL', NULL, NULL, NULL, NULL, 'C', NULL, NULL, NULL, '??????', NULL),
('032634', '0326', '34', 'KAMRANGIR CHAR', NULL, NULL, NULL, NULL, 'C', NULL, NULL, NULL, '?????????? ??', NULL),
('032636', '0326', '36', 'KHILGAON', NULL, NULL, NULL, NULL, 'C', NULL, NULL, NULL, '??????', NULL),
('032637', '0326', '37', 'KHILKHET', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('032638', '0326', '38', 'KERANIGANJ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????????', NULL),
('032640', '0326', '40', 'KOTWALI', NULL, NULL, NULL, NULL, 'C', NULL, NULL, NULL, '???????', NULL),
('032642', '0326', '42', 'LALBAGH', NULL, NULL, NULL, NULL, 'C', NULL, NULL, NULL, '??????', NULL),
('032648', '0326', '48', 'MIRPUR', NULL, NULL, NULL, NULL, 'C', NULL, NULL, NULL, '??????', NULL),
('032650', '0326', '50', 'MOHAMMADPUR', NULL, NULL, NULL, NULL, 'C', NULL, NULL, NULL, '???????????', NULL),
('032654', '0326', '54', 'MOTIJHEEL', NULL, NULL, NULL, NULL, 'C', NULL, NULL, NULL, '??????', NULL),
('032662', '0326', '62', 'NAWABGANJ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????', NULL),
('032663', '0326', '63', 'NEW MARKET', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??? ???????', NULL),
('032664', '0326', '64', 'PALLABI', NULL, NULL, NULL, NULL, 'C', NULL, NULL, NULL, '??????', NULL),
('010409', '0104', '09', 'AMTALI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????', NULL),
('010419', '0104', '19', 'BAMNA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????', NULL),
('010428', '0104', '28', 'BARGUNA SADAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????? ???', NULL),
('010447', '0104', '47', 'BETAGI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????', NULL),
('010485', '0104', '85', 'PATHARGHATA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('010602', '0106', '02', 'AGAILJHARA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('010603', '0106', '03', 'BABUGANJ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('010607', '0106', '07', 'BAKERGANJ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????', NULL),
('010610', '0106', '10', 'BANARI PARA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????? ????', NULL),
('010632', '0106', '32', 'GAURNADI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????', NULL),
('010636', '0106', '36', 'HIZLA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????', NULL),
('010651', '0106', '51', 'BARISAL SADAR (KOTWALI)', NULL, NULL, NULL, NULL, 'C', NULL, NULL, NULL, '?????? ??? (???????)', NULL),
('010662', '0106', '62', 'MHENDIGANJ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????????', NULL),
('010669', '0106', '69', 'MULADI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????', NULL),
('010694', '0106', '94', 'WAZIRPUR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('010918', '0109', '18', 'BHOLA SADAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???? ???', NULL),
('010921', '0109', '21', 'BURHANUDDIN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????????', NULL),
('010925', '0109', '25', 'CHAR FASSON', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?? ??????', NULL),
('010929', '0109', '29', 'DAULAT KHAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???? ???', NULL),
('010954', '0109', '54', 'LALMOHAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('010965', '0109', '65', 'MANPURA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????', NULL),
('010991', '0109', '91', 'TAZUMUDDIN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????', NULL),
('014240', '0142', '40', 'JHALOKATI SADAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????? ???', NULL),
('014243', '0142', '43', 'KANTHALIA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????', NULL),
('014273', '0142', '73', 'NALCHITY', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????', NULL),
('014284', '0142', '84', 'RAJAPUR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('017838', '0178', '38', 'BAUPHAL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????', NULL),
('017852', '0178', '52', 'DASHMINA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('017855', '0178', '55', 'DUMKI UPAZILA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????? ??????', NULL),
('017857', '0178', '57', 'GALACHIPA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('017866', '0178', '66', 'KALA PARA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('017876', '0178', '76', 'MIRZAGANJ UPAZILA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????? ??????', NULL),
('017895', '0178', '95', 'PATUAKHALI SADAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????? ???', NULL),
('017914', '0179', '14', 'BHANDARIA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????????', NULL),
('017947', '0179', '47', 'KAWKHALI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('017958', '0179', '58', 'MATHBARIA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('017976', '0179', '76', 'NAZIRPUR UPAZILA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('017980', '0179', '80', 'PIROJPUR SADAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????? ???', NULL),
('017987', '0179', '87', 'NESARABAD (SWARUPKATI)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????(??????????)', NULL),
('017990', '0179', '90', 'ZIANAGAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('020304', '0203', '04', 'ALIKADAM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????', NULL),
('020314', '0203', '14', 'BANDARBAN SADAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????? ???', NULL),
('020351', '0203', '51', 'LAMA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????', NULL),
('020373', '0203', '73', 'NAIKHONGCHHARI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????????', NULL),
('020389', '0203', '89', 'ROWANGCHHARI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('020391', '0203', '91', 'RUMA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????', NULL),
('020395', '0203', '95', 'THANCHI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????', NULL),
('021202', '0212', '02', 'AKHAURA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????', NULL),
('021204', '0212', '04', 'BANCHHARAMPUR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????????', NULL),
('021213', '0212', '13', 'BRAHMANBARIA SADAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????????????? ???', NULL),
('021233', '0212', '33', 'ASHUGANJ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('021263', '0212', '63', 'KASBA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????', NULL),
('021285', '0212', '85', 'NABINAGAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????', NULL),
('021290', '0212', '90', 'NASIRNAGAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('021294', '0212', '94', 'SARAIL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????', NULL),
('021322', '0213', '22', 'CHANDPUR SADAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????? ???', NULL),
('021345', '0213', '45', 'FARIDGANJ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('021347', '0213', '47', 'HAIM CHAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????', NULL),
('021349', '0213', '49', 'HAJIGANJ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('021358', '0213', '58', 'KACHUA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????', NULL);
INSERT INTO `thanas` (`THANA_ID`, `DISTRICT_ID`, `THANA_CODE`, `THANA_NAME`, `ENTERED_BY`, `ENTRY_TIMESTAMP`, `LAST_UPDATED_BY`, `LAST_UPDATED_TIMESTAMP`, `AREA_STATUS`, `DISTRICT_HQ`, `M_STATUS`, `SEQEAP`, `THANA_NAMEB`, `POP07`) VALUES
('021376', '0213', '76', 'MATLAB DAKSHIN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???? ??????', NULL),
('021379', '0213', '79', 'MATLAB UTTAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???? ?????', NULL),
('021395', '0213', '95', 'SHAHRASTI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????????', NULL),
('021504', '0215', '04', 'ANOWARA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('021506', '0215', '06', 'BAYEJID BOSTAMI', NULL, NULL, NULL, NULL, 'C', NULL, NULL, NULL, '?????? ????????', NULL),
('021508', '0215', '08', 'BANSHKHALI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('021510', '0215', '10', 'BAKALIA', NULL, NULL, NULL, NULL, 'C', NULL, NULL, NULL, '???????', NULL),
('021512', '0215', '12', 'BOALKHALI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????', NULL),
('021518', '0215', '18', 'CHANDANAISH', NULL, NULL, NULL, NULL, 'C', NULL, NULL, NULL, '?????????', NULL),
('021519', '0215', '19', 'CHANDGAON', NULL, NULL, NULL, NULL, 'C', NULL, NULL, NULL, '???????', NULL),
('021520', '0215', '20', 'CHITTAGONG PORT', NULL, NULL, NULL, NULL, 'C', NULL, NULL, NULL, '????????? ?????', NULL),
('021528', '0215', '28', 'DOUBLE MOORING', NULL, NULL, NULL, NULL, 'C', NULL, NULL, NULL, '???? ?????', NULL),
('021533', '0215', '33', 'FATIKCHHARI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('021535', '0215', '35', 'HALISHAHAR', NULL, NULL, NULL, NULL, 'C', NULL, NULL, NULL, '???????', NULL),
('021537', '0215', '37', 'HATHAZARI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????', NULL),
('021541', '0215', '41', 'KOTWALI', NULL, NULL, NULL, NULL, 'C', NULL, NULL, NULL, '???????', NULL),
('021543', '0215', '43', 'KHULSHI', NULL, NULL, NULL, NULL, 'C', NULL, NULL, NULL, '?????', NULL),
('021547', '0215', '47', 'LOHAGARA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('021553', '0215', '53', 'MIRSHARAI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????', NULL),
('021555', '0215', '55', 'PAHARTALI', NULL, NULL, NULL, NULL, 'C', NULL, NULL, NULL, '????????', NULL),
('021557', '0215', '57', 'PANCHLAISH', NULL, NULL, NULL, NULL, 'C', NULL, NULL, NULL, '????????', NULL),
('021561', '0215', '61', 'PATIYA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????', NULL),
('021565', '0215', '65', 'PATENGA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('021570', '0215', '70', 'RANGUNIA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????????', NULL),
('021574', '0215', '74', 'RAOZAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????', NULL),
('021578', '0215', '78', 'SANDWIP', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????', NULL),
('021582', '0215', '82', 'SATKANIA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????', NULL),
('021586', '0215', '86', 'SITAKUNDA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????', NULL),
('021909', '0219', '09', 'BARURA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????', NULL),
('021915', '0219', '15', 'BRAHMAN PARA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????? ????', NULL),
('021918', '0219', '18', 'BURICHANG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????', NULL),
('021927', '0219', '27', 'CHANDINA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????', NULL),
('021931', '0219', '31', 'CHAUDDAGRAM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????????', NULL),
('021933', '0219', '33', 'COMILLA SADAR DAKSHIN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????? ??? ??????', NULL),
('021936', '0219', '36', 'DAUDKANDI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????????', NULL),
('021940', '0219', '40', 'DEBIDWAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????', NULL),
('021954', '0219', '54', 'HOMNA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????', NULL),
('021967', '0219', '67', 'COMILLA ADARSHA SADAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '???????? ????? ???', NULL),
('021972', '0219', '72', 'LAKSAM', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????', NULL),
('021974', '0219', '74', 'MANOHARGANJ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????', NULL),
('021975', '0219', '75', 'MEGHNA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????', NULL),
('021981', '0219', '81', 'MURADNAGAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('021987', '0219', '87', 'NANGALKOT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????', NULL),
('021994', '0219', '94', 'TITAS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????', NULL),
('022216', '0222', '16', 'CHAKARIA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????', NULL),
('022224', '0222', '24', 'COX''S BAZAR SADAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????? ???', NULL),
('022245', '0222', '45', 'KUTUBDIA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????', NULL),
('022249', '0222', '49', 'MAHESHKHALI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('022256', '0222', '56', 'PEKUA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '??????', NULL),
('022266', '0222', '66', 'RAMU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????', NULL),
('022290', '0222', '90', 'TEKNAF', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????', NULL),
('022294', '0222', '94', 'UKHIA UPAZILA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????? ??????', NULL),
('023014', '0230', '14', 'CHHAGALNAIYA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????', NULL),
('023025', '0230', '25', 'DAGANBHUIYAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????????', NULL),
('999401', '9994', '01', 'ABU DHABI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('999501', '9995', '01', 'DOHA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('999601', '9996', '01', 'RIYADH', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('999602', '9996', '02', 'JEDDA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('999701', '9997', '01', 'MANAMA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('999801', '9998', '01', 'TRIPOLI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('032985', '0329', '85', 'SHALTHA', 'BANADMIN06', '2010-10-01 11:39:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `unit_attachments`
--

CREATE TABLE IF NOT EXISTS `unit_attachments` (
  `id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `unit_attachments`
--

INSERT INTO `unit_attachments` (`id`, `unit_id`, `title`, `desc`, `attachment`, `created_at`, `status`) VALUES
(2, 0, 'Once Again', '', '', NULL, 1),
(3, 11, 'asfsafsa', '', '', NULL, 1),
(4, 13, '', '', '', '2017-12-13 00:16:45', 1),
(6, 15, '', '', '', '2017-12-13 00:19:40', 1),
(7, 16, '', '', '', '2017-12-13 00:20:05', 1),
(8, 17, '', '', '', '2017-12-13 00:20:27', 1),
(9, 18, '', '', '', '2017-12-13 00:20:45', 1),
(10, 19, '', '', '', '2017-12-13 00:21:01', 1),
(11, 20, '', '', '', '2017-12-13 00:21:16', 1),
(12, 21, '', '', '', '2017-12-13 00:21:36', 1),
(13, 22, '', '', '', '2017-12-13 00:21:56', 1),
(14, 23, '', '', '', '2017-12-13 00:22:13', 1),
(15, 24, '', '', '', '2017-12-13 00:22:33', 1),
(16, 25, '', '', '', '2017-12-13 00:23:08', 1),
(17, 26, '', '', '', '2017-12-13 00:23:27', 1),
(18, 27, '', '', '', '2017-12-13 00:24:09', 1),
(19, 28, '', '', '', '2017-12-13 00:24:34', 1),
(20, 29, '', '', '', '2017-12-13 00:24:52', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assigned_teacher_doctors`
--
ALTER TABLE `assigned_teacher_doctors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assignments`
--
ALTER TABLE `assignments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assignments_reply`
--
ALTER TABLE `assignments_reply`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assignments_resend`
--
ALTER TABLE `assignments_resend`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_msgs`
--
ALTER TABLE `contact_msgs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `current_module`
--
ALTER TABLE `current_module`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `designation`
--
ALTER TABLE `designation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doc_exams`
--
ALTER TABLE `doc_exams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doc_experience`
--
ALTER TABLE `doc_experience`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doc_training`
--
ALTER TABLE `doc_training`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exam_question`
--
ALTER TABLE `exam_question`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `general_info`
--
ALTER TABLE `general_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `module_units`
--
ALTER TABLE `module_units`
  ADD PRIMARY KEY (`id`,`status`);

--
-- Indexes for table `notice`
--
ALTER TABLE `notice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oe_qsn_bnk_ans`
--
ALTER TABLE `oe_qsn_bnk_ans`
  ADD PRIMARY KEY (`id`), ADD KEY `master_ref_id` (`master_ref_id`) USING BTREE;

--
-- Indexes for table `oe_qsn_bnk_master`
--
ALTER TABLE `oe_qsn_bnk_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `sif_admission`
--
ALTER TABLE `sif_admission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sif_batch`
--
ALTER TABLE `sif_batch`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sif_class_topic`
--
ALTER TABLE `sif_class_topic`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sif_course`
--
ALTER TABLE `sif_course`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sif_doc_master`
--
ALTER TABLE `sif_doc_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sif_edu_qualification`
--
ALTER TABLE `sif_edu_qualification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sif_faculty`
--
ALTER TABLE `sif_faculty`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sif_general_info`
--
ALTER TABLE `sif_general_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sif_groups`
--
ALTER TABLE `sif_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sif_institute`
--
ALTER TABLE `sif_institute`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sif_login_attempts`
--
ALTER TABLE `sif_login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sif_medical_collage`
--
ALTER TABLE `sif_medical_collage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sif_reference`
--
ALTER TABLE `sif_reference`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sif_result_process`
--
ALTER TABLE `sif_result_process`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sif_session`
--
ALTER TABLE `sif_session`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sif_teacher`
--
ALTER TABLE `sif_teacher`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sif_users`
--
ALTER TABLE `sif_users`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `username` (`username`) USING BTREE;

--
-- Indexes for table `sif_users_groups`
--
ALTER TABLE `sif_users_groups`
  ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`) USING BTREE, ADD KEY `fk_users_groups_users1_idx` (`user_id`) USING BTREE, ADD KEY `fk_users_groups_groups1_idx` (`group_id`) USING BTREE;

--
-- Indexes for table `unit_attachments`
--
ALTER TABLE `unit_attachments`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assigned_teacher_doctors`
--
ALTER TABLE `assigned_teacher_doctors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `assignments`
--
ALTER TABLE `assignments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `assignments_reply`
--
ALTER TABLE `assignments_reply`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `assignments_resend`
--
ALTER TABLE `assignments_resend`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `contact_msgs`
--
ALTER TABLE `contact_msgs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `current_module`
--
ALTER TABLE `current_module`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `designation`
--
ALTER TABLE `designation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `doc_exams`
--
ALTER TABLE `doc_exams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=61;
--
-- AUTO_INCREMENT for table `doc_experience`
--
ALTER TABLE `doc_experience`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=55;
--
-- AUTO_INCREMENT for table `doc_training`
--
ALTER TABLE `doc_training`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `exams`
--
ALTER TABLE `exams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `exam_question`
--
ALTER TABLE `exam_question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=152;
--
-- AUTO_INCREMENT for table `feedbacks`
--
ALTER TABLE `feedbacks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `general_info`
--
ALTER TABLE `general_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `module_units`
--
ALTER TABLE `module_units`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `notice`
--
ALTER TABLE `notice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `oe_qsn_bnk_ans`
--
ALTER TABLE `oe_qsn_bnk_ans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19111;
--
-- AUTO_INCREMENT for table `oe_qsn_bnk_master`
--
ALTER TABLE `oe_qsn_bnk_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3715;
--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `sif_admission`
--
ALTER TABLE `sif_admission`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `sif_batch`
--
ALTER TABLE `sif_batch`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=68;
--
-- AUTO_INCREMENT for table `sif_class_topic`
--
ALTER TABLE `sif_class_topic`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1993;
--
-- AUTO_INCREMENT for table `sif_course`
--
ALTER TABLE `sif_course`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sif_doc_master`
--
ALTER TABLE `sif_doc_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `sif_edu_qualification`
--
ALTER TABLE `sif_edu_qualification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=107;
--
-- AUTO_INCREMENT for table `sif_faculty`
--
ALTER TABLE `sif_faculty`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `sif_general_info`
--
ALTER TABLE `sif_general_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sif_groups`
--
ALTER TABLE `sif_groups`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `sif_institute`
--
ALTER TABLE `sif_institute`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `sif_login_attempts`
--
ALTER TABLE `sif_login_attempts`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `sif_medical_collage`
--
ALTER TABLE `sif_medical_collage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=83;
--
-- AUTO_INCREMENT for table `sif_reference`
--
ALTER TABLE `sif_reference`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sif_result_process`
--
ALTER TABLE `sif_result_process`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=81;
--
-- AUTO_INCREMENT for table `sif_session`
--
ALTER TABLE `sif_session`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `sif_teacher`
--
ALTER TABLE `sif_teacher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `sif_users`
--
ALTER TABLE `sif_users`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `sif_users_groups`
--
ALTER TABLE `sif_users_groups`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `unit_attachments`
--
ALTER TABLE `unit_attachments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
