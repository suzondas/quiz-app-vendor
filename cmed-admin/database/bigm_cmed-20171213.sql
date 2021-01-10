-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 13, 2017 at 01:30 PM
-- Server version: 5.7.20-0ubuntu0.16.04.1
-- PHP Version: 5.6.32-1+ubuntu16.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bigm_cmed`
--

-- --------------------------------------------------------

--
-- Table structure for table `assigned_teacher_doctors`
--

CREATE TABLE `assigned_teacher_doctors` (
  `id` int(11) NOT NULL,
  `teacher_id` varchar(30) DEFAULT NULL,
  `doc_id` varchar(11) DEFAULT NULL,
  `module` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `assignments`
--

CREATE TABLE `assignments` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `assignments_reply`
--

CREATE TABLE `assignments_reply` (
  `id` int(11) NOT NULL,
  `assignment_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `msg` text,
  `sent` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `attachment` varchar(255) DEFAULT NULL,
  `feedback_msg` text,
  `feedback_attachment` varchar(255) DEFAULT NULL,
  `feedback_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `assignments_resend`
--

CREATE TABLE `assignments_resend` (
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

CREATE TABLE `contact_msgs` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `message` text,
  `sent_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `dept_name` varchar(100) NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_date_time` datetime NOT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date_time` datetime DEFAULT NULL,
  `status` varchar(10) NOT NULL DEFAULT '1' COMMENT 'draft, completed'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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

CREATE TABLE `designation` (
  `id` int(11) NOT NULL,
  `des_name` varchar(100) NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_date_time` datetime NOT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `updated_date_time` datetime DEFAULT NULL,
  `status` varchar(10) NOT NULL DEFAULT '1' COMMENT 'draft, completed'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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

CREATE TABLE `districts` (
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
('0222', '02', '22', 'COX\'S BAZAR', 'CHITTAGONG', '4', '7', NULL, NULL, NULL, NULL),
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

CREATE TABLE `divisions` (
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
-- Table structure for table `doc_experience`
--

CREATE TABLE `doc_experience` (
  `id` int(11) NOT NULL,
  `admi_id` varchar(50) DEFAULT NULL,
  `exp_inst_name` varchar(255) DEFAULT NULL,
  `exp_designation` varchar(255) DEFAULT NULL,
  `exp_los` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `doc_experience`
--

INSERT INTO `doc_experience` (`id`, `admi_id`, `exp_inst_name`, `exp_designation`, `exp_los`, `created_at`) VALUES
(1, '6', 'Shay Campos', 'Repudiandae vero recusandae Aut quo aliquip incidunt debitis dolorem sint sunt quia placeat quisquam quis tenetur quia', 'Et cumque qui aut cillum commodo et magnam quidem', '2017-12-11 18:00:00'),
(2, '7', 'Shay Campos', 'Repudiandae vero recusandae Aut quo aliquip incidunt debitis dolorem sint sunt quia placeat quisquam quis tenetur quia', 'Et cumque qui aut cillum commodo et magnam quidem', '2017-12-11 18:00:00'),
(3, '10', 'Chiquita Roman', 'Obcaecati ad ad cupiditate numquam eaque nostrud blanditiis tempor id voluptate doloremque ullam rerum at quisquam lorem amet laborum', 'Natus recusandae Quia dolores veniam dicta provident velit id cupidatat id temporibus beatae', '2017-12-11 18:00:00'),
(4, '11', 'Brett Thomas', 'Et sit excepteur et ipsum quasi vitae et cumque consectetur aut lorem rerum', 'Id veniam minima laborum Vel non nostrud duis duis est exercitation impedit aut unde dolore quia pariatur Deleniti', '2017-12-11 18:00:00'),
(5, '12', 'Yetta Gordon', 'In eveniet fugit praesentium molestiae adipisicing do magni culpa quia dignissimos molestiae laboris doloremque architecto laboris necessitatibus excepteur sequi', 'Debitis incidunt necessitatibus labore fugit aute minus pariatur Dolorem elit quis omnis fugit voluptas qui', '2017-12-11 18:00:00'),
(6, '13', 'Yetta Gordon', 'In eveniet fugit praesentium molestiae adipisicing do magni culpa quia dignissimos molestiae laboris doloremque architecto laboris necessitatibus excepteur sequi', 'Debitis incidunt necessitatibus labore fugit aute minus pariatur Dolorem elit quis omnis fugit voluptas qui', '2017-12-11 18:00:00'),
(7, '18', 'Herman Melendez', 'Repudiandae dolorem do eum consequatur eligendi irure aliquid', 'Provident aut cupiditate laudantium exercitation perspiciatis voluptatem magni laudantium ut dolor voluptates est quam', '2017-12-12 12:51:04');

-- --------------------------------------------------------

--
-- Table structure for table `doc_training`
--

CREATE TABLE `doc_training` (
  `id` int(11) NOT NULL,
  `admi_id` varchar(50) DEFAULT NULL,
  `training_name` varchar(255) DEFAULT NULL,
  `training_duration` varchar(255) DEFAULT NULL,
  `training_organization` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `doc_training`
--

INSERT INTO `doc_training` (`id`, `admi_id`, `training_name`, `training_duration`, `training_organization`, `created_at`) VALUES
(1, '6', 'Remedios Dyer', 'Nemo voluptatem fuga Inventore dolores quod sed iure', 'Adkins and Meyer Associates', '2017-12-11 18:00:00'),
(2, '7', 'Remedios Dyer', 'Nemo voluptatem fuga Inventore dolores quod sed iure', 'Adkins and Meyer Associates', '2017-12-11 18:00:00'),
(3, '10', 'Ivana Munoz', 'Qui nulla enim in facilis possimus omnis alias iusto eos', 'Baker and Roth Trading', '2017-12-11 18:00:00'),
(4, '11', 'Barrett Silva', 'Aute voluptatem fuga Non ut ex officia enim', 'Tucker Herman Traders', '2017-12-11 18:00:00'),
(5, '12', 'Meghan Beach', 'Sequi cum eaque ipsum magna perspiciatis aut asperiores cillum tempore sit voluptate ab velit sit dolores voluptate et nesciunt occaecat', 'Casey Kelly Co', '2017-12-11 18:00:00'),
(6, '13', 'Meghan Beach', 'Sequi cum eaque ipsum magna perspiciatis aut asperiores cillum tempore sit voluptate ab velit sit dolores voluptate et nesciunt occaecat', 'Casey Kelly Co', '2017-12-11 18:00:00'),
(7, '18', 'Cody Garcia', 'Provident et sed laboris similique totam sapiente eius consequatur', 'Barnett and Walters LLC', '2017-12-12 12:51:04');

-- --------------------------------------------------------

--
-- Table structure for table `feedbacks`
--

CREATE TABLE `feedbacks` (
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

CREATE TABLE `general_info` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `import_doc` (
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

CREATE TABLE `modules` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `sl` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `module_units` (
  `id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `module_id` int(11) DEFAULT NULL,
  `code` varchar(10) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `details` text,
  `links` text,
  `duration` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `module_units`
--

INSERT INTO `module_units` (`id`, `course_id`, `module_id`, `code`, `name`, `details`, `links`, `duration`, `status`) VALUES
(14, 1, 1, 'CI1', 'Curriculum development', '', '[""]', NULL, 1),
(15, 1, 1, 'CI2', 'Educational objectives and competencies', '', '[""]', NULL, 1),
(16, 1, 1, 'CI3', 'Educational environment and staff development', '', '[""]', NULL, 1),
(17, 1, 1, 'CI4', 'e-learning and continuing professional development (CPD) ', '', '[""]', NULL, 1),
(18, 1, 2, 'IMD1', 'Principles of Instructional design and typography', '', '[""]', NULL, 1),
(19, 1, 2, 'IMD2', 'Power-point preparation and presentation', '', '[""]', NULL, 1),
(20, 1, 2, 'IMD3', 'OHP, flipchart, boards and printed materials', '', '[""]', NULL, 1),
(21, 1, 2, 'IMD4', 'Study guide and hand out', '', '[""]', NULL, 1),
(22, 1, 3, 'TL1', 'Principles of teaching and learning and teaching methods', '', '[""]', NULL, 1),
(23, 1, 3, 'TL2', 'Interactive large group teaching', '', '[""]', NULL, 1),
(24, 1, 3, 'TL3', 'Small group teaching and clinical teaching', 'PHA+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7PGJyPjwvcD4=', '[""]', NULL, 1),
(25, 1, 3, 'TL4', 'Other educational strategies- micro-teaching, distance learning, problem based learning  (PBL), evidence based learning', '', '[""]', NULL, 1),
(26, 1, 4, 'A1', 'Principles and methods of assessment and criteria of good assessment', '', '[""]', NULL, 1),
(27, 1, 4, 'A2', 'Written assessments- essay questions, Structured Essay Question (SEQ) Modified Essay Question (MEQ), Multiple Choice Questions (MCQ), Short Answer Question (SAQ)', '', '[""]', NULL, 1),
(28, 1, 4, 'A3', 'Performance based assessment –Objective Structured Clinical Examination (OSCE), Clinical examination (Long and short case), DOPS, Mini- CEX', '', '[""]', NULL, 1),
(29, 1, 4, 'A4', 'Structured Oral Examination (SOE), self- assessment and portfolio ', '', '[""]', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `notice`
--

CREATE TABLE `notice` (
  `id` int(11) NOT NULL,
  `sent_to` varchar(1) NOT NULL COMMENT 'T=Teacher,S=Student,P=Parent',
  `ref_id` varchar(20) DEFAULT NULL,
  `type` varchar(1) NOT NULL COMMENT 'I=Individual, A=All',
  `subject` text NOT NULL,
  `notice` text,
  `attachment` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notice`
--

INSERT INTO `notice` (`id`, `sent_to`, `ref_id`, `type`, `subject`, `notice`, `attachment`, `created_at`) VALUES
(1, '1', NULL, '', 'Welcome', '', NULL, '2017-08-06 20:34:33'),
(2, 'a', NULL, '', 'Today\'s Schedule', '', NULL, '2017-08-06 20:34:26'),
(3, 'a', NULL, '', 'Tomorrow\'s Schedule', '\r\n', NULL, '2017-08-06 20:34:17');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `details` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(100) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `slug`, `details`, `created_at`, `created_by`, `status`) VALUES
(6, 'An overview', 'overview', 'PGRpdiBjbGFzcz0iY29sLXhzLTEyIG5ld3Mtc2luZ2xlIj4KICAgICAgICAgICAgICAgICAgICA8ZGl2IGNsYXNzPSJibG9nLXNpbmdsZS13cmFwIj4KCiAgICAgICAgICAgICAgICAgICAgICAgIDwhLS0gQmxvZyBEZXRhaWwgV3JhcHBlciAtLT4KICAgICAgICAgICAgICAgICAgICAgICAgPGRpdiBjbGFzcz0ibmV3cy1zaW5nbGUtZGV0YWlscyI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8aDQgY2xhc3M9InRpdGxlLXNpbXBsZSI+QW4gb3ZlcnZpZXc8L2g0PgoKICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxwPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFRoaXMgcG9zdGdyYWR1YXRlIGNlcnRpZmljYXRlIGNvdXJzZSBpbiBtZWRpY2FsIGVkdWNhdGlvbiBoYXMgYmVlbiBkZXNpZ25lZCB0byBlbmxpZ2h0ZW4gcGFydGljaXBhbnRzIHdpdGggdGhlIGtleQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlzc3VlcyBpbiBtZWRpY2FsIGVkdWNhdGlvbiBhbmQgdG8gZW5hYmxlIHRoZW0gdG8gZGV2ZWxvcCBhIGJhc2ljIGxldmVsIG9mIGVkdWNhdGlvbmFsIGNvbXBldGVuY2UgYW5kIHByb2Zlc3Npb25hbGlzbQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGluIG1lZGljYWwgZWR1Y2F0aW9uIG1ldGhvZG9sb2xvZ3kuIFRoZSBhaW0gb2YgdGhlIGNlcnRpZmljYXRlIGNvdXJzZSBpcyB0byBlcXVpcCBoZWFsdGggcHJvZmVzc2lvbmFscyB0byBwcmFjdGljZQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFjcm9zcyB0aGUgcmFuZ2Ugb2YgZG9tYWlucyBvZiB0ZWFjaGluZyBhbmQgbGVhcm5pbmcgbW9kZWxzIHJlbGV2YW50IHRvIHRoZWlyIHN0dWRlbnRzLCBzdWJqZWN0cyBhbmQgc2l0dWF0aW9ucy4gQWZ0ZXIKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb21wbGV0aW9uIG9mIHRoaXMgY291cnNlIHRoZSBzdWNjZXNzZnVsIHBhcnRpY2lwYW50cyB3aWxsIGJlIGFibGUgdG8gc2hvdyBiZXR0ZXIgYWJpbGl0eSBpbjoKICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwvcD48dWwgY2xhc3M9ImdvLXdpZGdldCI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPuKAoiBVbmRlcnN0YW5kaW5nIGltcG9ydGFudCBjb250ZW1wb3JhcnkgaXNzdWVzIGluIG1lZGljYWwgZWR1Y2F0aW9uPC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPuKAoiBDb250cmlidXRlIHRvIHRoZSBkZXNpZ24gYW5kIHBsYW5uaW5nIG9mIGxlYXJuaW5nIGFjdGl2aXRpZXMgPC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPuKAoiBBc3Nlc3Mgc3R1ZGVudHMsIHRyYWluZWUsIGhlYWx0aCBjYXJlIHdvcmtlcnMgYW5kIG1ha2UgYSBwbGFuIHRvIGltcHJvdmUgdGhlbTwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj7igKIgVGFraW5nIGluaXRpYXRpdmVzIGZvciBmYWN1bHR5IGRldmVsb3BtZW50IGF0IHRoZWlyIG93biBwcmVtaXNlczwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgPC91bD4KICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxwPjwvcD4KCiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8aDQgY2xhc3M9InRpdGxlLXNpbXBsZSIgaWQ9IndobyI+V2hvIHNob3VsZCB0YWtlIHRoZSBjb3Vyc2U/PC9oND4KICAgICAgICAgICAgICAgICAgICAgICAgICAgIDx1bCBjbGFzcz0iZ28td2lkZ2V0Ij4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iIyI+4oCiIE1lZGljYWwgdGVhY2hlcnMgd2l0aCBhIHBvc3QgZ3JhZHVhdGlvbiBxdWFsaWZpY2F0aW9uIGFuZCBhY3RpdmVseSBpbnZvbHZlZCBpbiB0ZWFjaGluZyBtYXkgYXBwbHkgdG8gdGFrZSB0aGlzIGNlcnRpZmljYXRlCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb3Vyc2UuPC9hPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPuKAoiBUZWFjaGVycyBhdCBEZW50YWwgQ29sbGVnZSB3aXRoIHBvc3QgZ3JhZHVhdGlvbiBpbiBhbnkgc3ViamVjdCBpbnZvbHZlZCBpbiB0ZWFjaGluZyBtYXkgYXBwbHkgdG8gdGFrZSB0aGlzIGNvdXJzZS48L2E+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPC9saT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iIyI+4oCiIE51cnNpbmcgdGVhY2hlcnMgd2l0aCBwb3N0IGdyYWR1YXRpb24gZGlwbG9tYSBtYXkgdGFrZSB0aGlzIGNvdXJzZTwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgPC91bD4KCiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8aDQgY2xhc3M9InRpdGxlLXNpbXBsZSI+SG93IHRoZSBjb3Vyc2Ugd2lsbCBiZSBjb25kdWN0ZWQ/PC9oND4KCiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8cD4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBUaGVyZSB3aWxsIGJlIGFib3V0IDI1IHBhcnRpY2lwYW50cyBoZW5jZWZvcnRoIHNoYWxsIGJlIGNhbGxlZCBmZWxsb3dzIGluIHRoZSAxc3QgYmF0Y2ggb2YgNiBtb250aHMgZHVyYXRpb24uIExlYXJuaW5nCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYW5kIHRlYWNoaW5nIHdpbGwgYmUgbW9zdGx5IG9ubGluZSBhbmQgc2VsZiBkaXJlY3RlZC4gVGhlcmUgd2lsbCBiZSA0IG1vZHVsZXMgYW5kIGVhY2ggbW9kdWxlIGhhdmluZyA1IHVuaXRzLgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEZhY3VsdGllcyB3aWxsIGJlIHRhZ2dlZCB0byB0aGUgZmVsbG93cyBhbmQgdGhleSB3aWxsIGNvb3JkaW5hdGUgbGVhcm5pbmcgYWN0aXZpdGllcy4gQWxsIHRoZSBmZWxsb3dzIG11c3QgaGF2ZSBhbgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVhZ2VybmVzcyBvZiBhY3RpdmUgcGFydGljaXBhdGlvbiBpbiB0ZWFjaGluZyAmYW1wOyBsZWFybmluZyBwcm9jZXNzIG9mIHRoZSBjb3Vyc2UgZGVzaWduZWQgYnkgdGhlIGNvbXBldGVudCBhdXRob3JpdHkuIEEKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsaXN0IG9mIHB1Ymxpc2hlZCBtYXRlcmlhbHMgd2lsbCBiZSBwcm92aWRlZCB0byBhbGwgdGhlIGZlbGxvd3MgYW5kIHRoZXkgaGF2ZSB0byBzdHVkeSB0aGUgYXBwcm9wcmlhdGUgbWF0ZXJpYWxzIGFzCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGVyIGNvdXJzZSBkZW1hbmQuIEFmdGVyIDZkYXlzIHN0dWR5IG9mIG9uZSB1bml0IGFuIG9ubGluZSBhc3NpZ25tZW50IHdpbGwgYmUgc2VuZCB0byB0aGUgZmVsbG93IGFuZCB3aXRoaW4gMjQgaG91cnMKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBoZS9zaGUgd2lsbCBzZW5kIHRoZSBhbnN3ZXIgb25saW5lIHRvIHRoZSB0dXRvci4gSWYgbmVjZXNzYXJ5IGEgZmVlZGJhY2sgd2lsbCBiZSBzZW5kIHRvIHRoZSBmZWxsb3cuIEEgc2Vjb25kIGNoYW5jZQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHdpbGwgYmUgZ2l2ZW4gdG8gcmV3cml0ZSB0aGUgYW5zd2VyLiBNYXJraW5nIHdpbGwgYmUgZG9uZSBieSB0aGUgZmFjdWx0eSBmb3IgZWFjaCB1bml0IGJvdGggZmFjZS10by1mYWNlIHRlYWNoaW5nIGFuZAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG9ubGluZSBsZWFybmluZyB3aWxsIGJlIHByb3ZpZGVkIHRvIHRoZSBmZWxsb3dzLiBUaGVyZSB3aWxsIGJlIGF0IGxlYXN0IG9uZSBmdWxsIGRheSB3b3Jrc2hvcCBhdCBCSVJERU0gcHJlbWlzZXMgZXZlcnkKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtb250aC4gVGhlc2Ugd29ya3Nob3BzIHdpbGwgY29uZHVjdCBhc3Nlc3NtZW50cyBvbiBhIG1vZHVsZSBhbmQgaW50cm9kdWN0aW9uIG9mIHRoZSBuZXh0IG1vZHVsZS4gQWZ0ZXIgY29tcGxldGlvbiBhbGwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bml0cyBzdWNjZXNzZnVsbHkgYW4gb25zaXRlIG1vZHVsZSBjb21wbGV0aW9uIGFzc2Vzc21lbnQgd2lsbCBiZSBoZWxkLiBBZnRlciBzdWNjZXNzZnVsIGNvbXBsZXRpb24gYWxsIDQgbW9kdWxlcyBhCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY2VydGlmaWNhdGUgd2lsbCBiZSBpc3N1ZWQgdG8gdGhlIGZlbGxvdyBmcm9tIEJJUkRFTSBhY2FkZW15LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIER1cmluZyB0aGUgcHJvY2VzcyBvZiBsZWFybmluZyBmZWxsb3cgd2lsbCBiZSBlbmNvdXJhZ2VkIHRvIGNvbW11bmljYXRlIHdpdGggdGhlaXIgbWVudG9ycyB0aHJvdWdoIGVtYWlsLCB3ZWIgc2l0ZSBhbmQKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0ZWxlcGhvbmUuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8L3A+CgogICAgICAgICAgICAgICAgICAgICAgICAgICAgPGg0IGNsYXNzPSJ0aXRsZS1zaW1wbGUiPkhvdyB5b3Ugd2lsbCBsZWFybj88L2g0PgoKICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxwPkZlbGxvd3Mgd2lsbCBiZSBzdXBwbGllZCB3aXRoIGJvb2tzLCBhcnRpY2xlcyBmcm9tIGpvdXJuYWxzIGFuZCBvbmxpbmUgbGlua3MgdG8gc3R1ZHkgdGhlIGxlYXJuaW5nIG9iamVjdGl2ZXMuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRmFjdWx0aWVzIHdpbGwgYmUgYXZhaWxhYmxlIHRocm91Z2ggZW1haWwsIHdlYnNpdGUgYW5kIHRlbGVwaG9uZSB0byBkaXNjdXNzIGFueSBpc3N1ZSBkdXJpbmcgc2VsZiBkaXJlY3RlZCBsZWFybmluZy4gQQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHRhc2stYmFzZWQgbGVhcm5pbmcgYXBwcm9hY2ggd2lsbCBhbHNvIGJlIGFkb3B0ZWQsIHdpdGggYWN0aXZpdGllcyBzdWdnZXN0ZWQgdGhyb3VnaG91dCB0aGUgbGVhcm5pbmcgbWF0ZXJpYWxzIHRoYXQKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBlbmNvdXJhZ2UgcGFydGljaXBhbnRzIHRvIGxpbmsgZWR1Y2F0aW9uYWwgdGhlb3J5IHRvIHRoZWlyIGV2ZXJ5ZGF5IHByYWN0aWNlIGFzIGhlYWx0aCBwcm9mZXNzaW9ucyB0ZWFjaGVycyBhbmQgdG8KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZWZsZWN0IG9uIHRoYXQgcHJhY3RpY2U8L3A+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8dWwgY2xhc3M9ImdvLXdpZGdldCI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPuKAoiBMZWFybmluZyBmcm9tIHByZSBkZXRlcm1pbmVkIGd1aWRlZCBzY2hlZHVsZTwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj7igKIgRGlzY3Vzc2lvbiBhbW9uZyBwYXJ0aWNpcGFudHMgYW5kIHR1dG9yczwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj7igKIgUHJlcGFyYXRpb24gYW5kIHN1Ym1pc3Npb24gb2YgdW5pdCBhc3NpZ25tZW50czwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj7igKIgRmVlZGJhY2sgZnJvbSB0dXRvcnMgYW5kIGNvdXJzZSBjb29yZGluYXRvcnMgYWJvdXQgdGhlaXIgYXNzaWdubWVudDwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj7igKIgU2VsZiByZWZsZWN0aXZlIGxlYXJuaW5nIG9uIHRoYXQgZmVlZGJhY2sgYW5kIHByb3Bvc2FsIGZvciBmdXJ0aGVyIGxlYXJuaW5nPC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8L3VsPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgPGg0IGNsYXNzPSJ0aXRsZS1zaW1wbGUiPkNvbnRlbnQ8L2g0PgoKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPHA+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFRoZXJlIHdpbGwgYmUgZml2ZSB0aGVtZXMgYmFzZWQgb24gcHJvZ3JhbSBzY2hlZHVsZSBvZiB0aGUgY291cnNlLiA8L3A+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPHVsIGNsYXNzPSJnby13aWRnZXQiIHN0eWxlPSJtYXJnaW4tYm90dG9tOiAxNXB4Ij4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSJodHRwOi8vbG9jYWxob3N0L2NtZWQvbW9kdWxlLzEiPuKAoiBDb250ZW1wb3JhcnkgaXNzdWVzIGluIG1lZGljYWwgZWR1Y2F0aW9uPC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iaHR0cDovL2xvY2FsaG9zdC9jbWVkL21vZHVsZS8yIj7igKIgVGVhY2hpbmctbGVhcm5pbmc8L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSJodHRwOi8vbG9jYWxob3N0L2NtZWQvbW9kdWxlLzMiPuKAoiBJbnN0cnVjdGlvbmFsIG1vZHVsZSBkZXNpZ248L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSJodHRwOi8vbG9jYWxob3N0L2NtZWQvbW9kdWxlLzQiPuKAoiBBc3Nlc3NtZW50PC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPC91bD4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8cD4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBUaGVyZSBhcmUgNSB1bml0cyB3aXRoaW4gZWFjaCB0aGVtZS4KICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwvcD4KICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxoNCBjbGFzcz0idGl0bGUtc2ltcGxlIj5FZHVjYXRpb25hbCBwaGlsb3NvcGh5PC9oND4KICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxwPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBoaWxvc29waHkgcmVnYXJkaW5nIHRoaXMgY291cnNlIHdpbGwgYmUgdG8gYnVpbGQgYSBnb29kIHF1YWxpdHkgdGVhY2hlciB3aG8gd2lsbCBiZSBjb21wYXNzaW9uYXRlLCBjb21wZXRlbnQgYW5kIHByb2Zlc3Npb25hbGx5IHN1cGVyaW9yIHdpdGggaGlnaAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0YWtlIG9mIGV0aGljYWwg4oCTbW9yYWwgaHVtYW4uIEhlIHdpbGwgYmUgYSBndWlkZSBhbmQgcm9sZSBtb2RlbCBmb3IgdGhlIHN0dWRlbnRzIHNvIHRoYXQgZnV0dXJlIGdlbmVyYXRpb24gd2lsbCByZXBsYWNlIHRoZW0gaW4gdGVybXMgb2YgYmV0dGVyCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcXVhbGl0eSBhbmQgYXBwbGljYWJpbGl0eS4gVGhlIHRyYWluZWQgdGVhY2hlciB3aWxsIGVuZ2FnZSB0aGVtc2VsdmVzIGluIHJlc2VhcmNoIGFuZCBmYWN1bHR5IGRldmVsb3BtZW50IHByb2dyYW0uCiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8L3A+CgogICAgICAgICAgICAgICAgICAgICAgICA8L2Rpdj48IS0tIEJsb2cgRGV0YWlsIFdyYXBwZXIgLS0+CiAgICAgICAgICAgICAgICAgICAgPC9kaXY+PCEtLSBCbG9nIFdyYXBwZXIgLS0+CgoKICAgICAgICAgICAgICAgIDwvZGl2Pg==', '2017-12-13 10:00:40', NULL, 1),
(8, 'Suggested readings and links', 'reading-links', 'PGRpdiBjbGFzcz0iY29sLXhzLTEyIG5ld3Mtc2luZ2xlIj4KICAgICAgICAgICAgICAgICAgICA8ZGl2IGNsYXNzPSJibG9nLXNpbmdsZS13cmFwIj4KCiAgICAgICAgICAgICAgICAgICAgICAgIDwhLS0gQmxvZyBEZXRhaWwgV3JhcHBlciAtLT4KICAgICAgICAgICAgICAgICAgICAgICAgPGRpdiBjbGFzcz0ibmV3cy1zaW5nbGUtZGV0YWlscyI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8aDQgY2xhc3M9InRpdGxlLXNpbXBsZSI+U3VnZ2VzdGVkIHJlYWRpbmdzIGFuZCBsaW5rczwvaDQ+CgogICAgICAgICAgICAgICAgICAgICAgICAgICAgPHA+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQSBudW1iZXIgb2YgYm9va3Mgd2lsbCBiZSBwcm92aWRlZCB0byB0aGUgcGFydGljaXBhbnRzIGFsb25nIHdpdGggbGVjdHVyZXMgYW5kIGpvdXJuYWwgaGFuZG91dHMuIFRoZXkgd2lsbCBhbHNvIGdldCBvbmxpbmUgcmVhZGluZyBtYXRlcmlhbHMgYW5kIGxpbmtzIG9mIG1lZGljYWwgZWR1Y2F0aW9uIHJlbGF0ZWQgc2l0ZXMgbyBleHBvc2UgdGhlbSB0byBhIGdyZWF0ZXIgZWR1Y2F0aW9uIGVudmlyb25tZW50IGFuZCB0byBoZWxwIHRoZW0gcHJlcGFyZSB0aGUgYXNzaWdubWVudHMuIDxiPlN1Z2dlc3RlZCByZWFkaW5nPC9iPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgPC9wPgoKICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxoNCBjbGFzcz0idGl0bGUtc2ltcGxlIj5Cb29rczo8L2g0PgogICAgICAgICAgICAgICAgICAgICAgICAgICAgPHVsIGNsYXNzPSJnby13aWRnZXQiPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj4xLglBIHByYWN0aWNhbCBndWlkZSBmb3IgbWVkaWNhbCB0ZWFjaGVycy4gRGVudCBSQSwgSGFyZGVuIFJNLCBlZGl0b3JzIDJuZCBlZC4gQ2h1cmNoaWxsIExpdmluZ3N0b25lLCBFZGluYnVyZ2guIDIwMDU8L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iIyI+Mi4JQSBwcmFjdGljYWwgZ3VpZGUgdG8gbWVkaWNhbCBzdHVkZW50IGFzc2Vzc21lbnQuIEFtaW4gWiwgU2VuZyBDWSwgRW5nIEtIIGVkaXRvcnMuIDFTVCBlZC4gV29ybGQgU2NpZW50aWZpYywgU2luZ2Fwb3JlLiAyMDA2PC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPjMuCUJhc2ljcyBpbiBtZWRpY2FsIGVkdWNhdGlvbi4gQW1pbiBaLCBFbmcgS0ggZWRpdG9ycy4gMXN0IGVkLCBXb3JsZCBTY2llbnRpZmljLCBOZXcgSmVyc2V5LCAyMDAzPC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPjQuCUEgaGFuZGJvb2sgZm9yIG1lZGljYWwgdGVhY2hlci4gTmV3YmxlIEQsIENhbm5vbiBSIGVkaXRvcnMuIDR0aCBlZC4gS2x1d2VyIEFjYWRlbWljIFB1YmxpY2F0aW9uLCBCb3N0b24sIDE5OTY8L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iIyI+NS4JQXNzZXNzbWVudCBpbiBtZWRpY2FsIGVkdWNhdGlvbjogVHJlbmRzIGFuZCB0b29scy4gIFNvb2QgUi4gMVNUIGVkLiBLIEwgV2lnIGNlbnRyZSwgTmV3IERlbGhpLCAxOTkzPC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPjYuCUNvbmNlcHRzIGYgbWVkaWNhbCBlZHVjYXRpb24uIEJlZ3VtIFQuIDFTVCBlZC4gRGhha2EsIDIwMTMgPC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8L3VsPgoKICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxoNCBjbGFzcz0idGl0bGUtc2ltcGxlIj5Cb29rbGV0czwvaDQ+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8dWwgY2xhc3M9ImdvLXdpZGdldCI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPjEuCUQuIEkuIE5ld2JsZS4gQXNzZXNzaW5nIENsaW5pY2FsIENvbXBldGVuY2UgYXQgdGhlIHVuZGVyZ3JhZHVhdGUgbGV2ZWwuIEFTTUUgTWVkaWNhbCBFZHVjYXRpb24gQm9va2xldCBOby4gMjUuIER1bmRlZSwgMTk5MjwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj4yLglLbm94IEpERS4gTW9kaWZpZWQgRXNzYXkgUXVlc3Rpb24uIEFTTUUgTWVkaWNhbCBFZHVjYXRpb24gQm9va2xldCBOby4gNS4gRHVuZGVlLCAxOTg2PC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPjMuCVN0b2tlcyBKRi4gVGhlIGNsaW5pY2FsIGV4YW1pbmF0aW9uLSBhc3Nlc3NtZW50IG9mIGNsaW5pY2FsIHNraWxscy4gQVNNRSBib29rbGV0IE5vLjQsIER1bmRlZSwgMTk3NDwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgPC91bD4KCiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8aDQgY2xhc3M9InRpdGxlLXNpbXBsZSI+QXJ0aWNsZXM6PC9oND4KICAgICAgICAgICAgICAgICAgICAgICAgICAgIDx1bCBjbGFzcz0iZ28td2lkZ2V0Ij4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iIyI+MS4JRWJzdGVpbiBSTS4gQXNzZXNzbWVudCBpbiBtZWRpY2FsIGVkdWNhdGlvbi4gTiBFbmcgSiBNZWQgMjAwNzsgMzU2OiAzODctOTYgPC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPjIuCU5vcmNpbmlKSiwgIE1jS2lubGV5IERXLiBBc3Nlc3NtZW50IG1ldGhvZHMgaW4gbWVkaWNhbCBlZHVjYXRpb24uIFRlYWNoaW5nIGFuZCBUZWFjaGVyIGVkdWNhdGlvbiAyMDA3OyAyMzogMjM5LTI1MDwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj4zLglIYXJkZW4gUk0uIEhvdyB0byBhc3Nlc3Mgc3R1ZGVudCA6IGFuIG92ZXJ2aWV3LiBNZWRpY2FsIFRlYWNoZXIgMTk3OTsgMTogNjUtNzA8L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iIyI+NC4JRm93ZWxsIFNMLCBCbGlnaCBKRy4gUmVjZW50IGRldmVsb3BtZW50cyBpbiBhc3Nlc3NpbmcgbWVkaWNhbCBzdHVkZW50cy4gUG9zdGdyYWQgTWVkIEogMTk5ODsgNzk6IDE4LTI0PC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPjUuCVdvb2QgVC4gQXNzZXNzbWVudCBub3Qgb25seSBkcml2ZXMgbGVhcm5pbmcsIGl0IGFsc28gaGVscHMgbGVhcm5pbmcuIE1lZGljYWwgRWR1Y2F0aW9uIDIwMDk7IDQzOiA1LTY8L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iIyI+Ni4JSGFyZGVuIFJNLiBIb3cgdG8gYXNzZXNzIGNsaW5pY2FsIGNvbXBldGVuY2U6IGFuIG92ZXJ2aWV3LiBNZWRpY2FsIFRlYWNoZXIgMTk3OTsgMSg2KTogMjg5LTk2PC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPjcuCUhhcmRlbiBSTS4gSG93IHRvIGFzc2VzcyBzdHVkZW50czogYW4gb3ZlcnZpZXcuIE1lZGljYWwgVGVhY2hlciAxOTc5OyAxOiA2NS03MDwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj44LglFcmF1bnQgTUEuIFdpZGUgcGVyc3BlY3RpdmUgb24gYXNzZXNzbWVudC4gTWVkaWNhbCBFZHVjYXRpb24gMjAwNDsgMzg6IDgwMC0gOTA0PC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPjkuCVNjaHV3aXJ0aCBMV1QsIFZhbiBkZXIgQmxldXRlbiBDUE0uIFdyaXR0ZW4gYXNzZXNzbWVudC4gQk1KIDIwMDM7IDMyNjogNjQzLTQ1PC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPjEwLgkgUmFkZW1ha2VycyBKLCBDYXRlIFRILCBCYXIgUFIuIFByb2dyZXNzIHRlc3Rpbmcgd2l0aCBzaG9ydCBhbnN3ZXIgcXVlc3Rpb25zLiBNZWRpY2FsIFRlYWNoZXIgMjAwNTsgMjcoNyk6IDU3OC04MjwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj4xMS4JIEZhcmxleSBKSy4gVGhlIG11bHRpcGxlIGNob2ljZSB0ZXN0OiBXcml0aW5nIHRoZSBxdWVzdGlvbnMuIE51cnNlIEVkdWMgMTk4OTsgMTQ6IDEwLTEyPC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPjEyLgkgTWMgQ291YnJpZSBQLiBJbXByb3ZpbmcgdGhlIGZhaXJuZXNzIG9mIG11bHRpcGxlIGNob2ljZSBxdWVzdGlvbnM6IEEgbGl0ZXJhdHVyZSByZXZpZXcuIE1lZGljYWwgVGVhY2hlciAyMDA0OyAyNig4KTogNzA5LTEyPC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPjEzLgkgTWMgQ291YnJpZSBQLCBNY0tuaWdodCBMLiBTaW5nbGUgYmVzdCBhbnN3ZXIgTUNRczogYSBuZXcgZm9ybWF0IGZvciB0aGUgRlJDUiBwYXJ0IDJhIGV4YW0uIENsaW5pY2FsIFJhZGlvbG9neSAyMDA4OyA2MzogNTA2LTEwPC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPjE0LgkgVHdvcnQgQywgbXVja2xvdyBKLiBIb3cgdG8gd3JpdGUgaGlnaCBxdWFsaXR5IHF1ZXN0aW9ucyBmb3IgYSBoaWdoIHN0YWtlcyBleGFtaW5hdGlvbi4gQ2xpbmljYWwgTWVkaWNpbmUgMjAxMTsgMTEoMyk6IDIyNy0zMDwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj4xNS4JIFdhbHNoIEsuIEFkdmljZSBvbiB3cml0aW5nIG11bHRpcGxlIGNob2ljZSBxdWVzdGlvbnMuIEJNSiBDYXJyaWVycyAyMDA1PC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPjE2LgkgTWlsbGVyIEdFLiBUaGUgYXNzZXNzbWVudCBvZiBjbGluaWNhbCBza2lsbHMvIGNvbXBldGVuY2UvIHBlcmZvcm1hbmNlLiBBY2FkIE1lZCAxOTkwOiA2NTogNTYzLTcwPC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPjE3LgkgV2FzcyBWLCBWYW4gZGVyIEJsZXV0ZW4gQ1BNLCBTaGF0emVyIEouIEFzc2Vzc21lbnQgb2YgY2xpbmljYWwgY29tcGV0ZW5jZS4gTGFuY2V0IDIwMDE7IDM1NzogOTQ1LTk8L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iIyI+MTguCSBOb3JjaW5pSkouIEN1cnJlbnQgcGVyc3BlY3RpdmVzIGluIGFzc2Vzc21lbnQ6IHRoZSBhc3Nlc3NtZW50IG9mIHBlcmZvcm1hbmNlIGF0IHdvcmsuIE1lZGljYWwgRWR1Y2F0aW9uIDIwMDU7IDM5OiA4ODAtODk8L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iIyI+MTkuCSBIYXJkZW4gUk0sIEdsZWVzb24gRkEuIEFzc2Vzc21lbnQgb2YgY2xpbmljYWwgY29tcGV0ZW5jZSB1c2luZyBhbiBPYmplY3RpdmUgU3RydWN0dXJlZCBDbGluaWNhbCBFeGFtaW5hdGlvbiAoT1NDRSkuIE1lZGljYWwgRWR1Y2F0aW9uIDE5Nzk7IDEzOiA0MS01NDwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj4yMC4JIFNlbmFuYXlha2UgTVAuIFRoZSBPU0NFLiBTcmlMYW5rYSBKb3VybmFsIG9mIENoaWxkIEhlYWx0aCAyMDAxOyAzMDogMjQtMjc8L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iIyI+MjEuCSBIb2RnZXMgQi4gVmFsaWRpdHkgYW5kIHRoZSBPU0NFLiBNZWRpY2FsIFRlYWNoZXIgMjAwMzsgMjU6IDI1MC01NDwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj4yMi4JIExlZSBZTSwgRHVjay1TdW4gQUhOLiBUaGUgT1NDRTogQSBuZXcgY2hhbGxlbmdlIHRvIHRoZSBldmFsdWF0aW9uIHN5c3RlbSBpbiBLb3JlYS4gTWVkaWNhbCBUZWFjaGVyIDIwMDY7IDI4KDQpOiAzNzctNzk8L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iIyI+MjMuCSBWYW4gZGVyIEJsZXV0ZW4gQ1BNLiBNYWtpbmcgdGhlIGJlc3Qgb2YgdGhlIOKAnExvbmcgQ2FzZeKAnS4gTGFuY2V0IDE5OTY7IDM3NDogNzA0LTU8L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iIyI+MjQuCSBXYXNzIFYsIEpvbGx5IEIuIERvZXMgb2JzZXJ2YXRpb24gYWRkIHZhbGlkaXR5IHRvIHRoZSBsb25nIGNhc2U/IE1lZGljYWwgRWR1Y2F0aW9uIDIwMDE7IDM1OiA3MjktMzQ8L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iIyI+MjUuCSBOb3JjaW5pSkouIE1pbmkgQ2xpbmljYWwgRXZhbHVhdGlvbiBFeGVyY2lzZSAobWluaS0gQ0VYKS4gVGhlIENsaW5pY2FsIFRlYWNoZXIgMjAwNTsgMjoyNS0zMDwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj4yNi4JIE5vcmNpbmlKSiwgQmxhbmsgTEwsIER1ZmZ5IEZELiBUaGUgbWluaS0gQ0VYOiBBIG1ldGhvZCBmb3IgYXNzZXNzaW5nIGNsaW5pY2FsIHNraWxscy4gQW5uYWxzIG9mIEludGVybmFsIE1lZGljaW5lIDIwMDM7IDEzOCg2KTogNDc2LTgzIDwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj4yNy4JIEtvZ2FuIEosIEhvbG1ib2UgRSBIYXVlciBLLiBUb29scyBmb3IgZGlyZWN0IG9ic2VydmF0aW9uIGFuZCBhc3Nlc3NtZW50IG9mIGNsaW5pY2FsIHNraWxscyBvZiBtZWRpY2FsIHRyYWluZWVzLiBKQU1BIDIwMDk7IDMwMjogMTMxNi0yNjwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj4yOC4JIFdlYmIgQywgRW5kYWNvdHQgUiwgR3JheSBNLiBNb2RlbHMgb2YgUG9ydGZvbGlvLiBNZWRpY2FsIEVkdWNhdGlvbiAyMDAyOyAzNjogODk3LTk4PC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPjI5LgkgRnJpZWRtYW4gQiwgRGF2aWQgTSwgRGF2aXMgTUgsIEhhcmRlbiBSTS4gUG9ydGZvbGlvIGFzIGEgbWV0aG9kIG9mIHN0dWRlbnQgYXNzZXNzbWVudC4gTWVkaWNhbCBUZWFjaGVyIDIwMDE7IDIzKDYpOiA1MzUtNTE8L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iIyI+MzAuCSBGYWxjaGlrb3YgTiwgQm91ZCBELiBTdHVkZW50IHNlbGYgYXNzZXNzbWVudCBpbiBoaWdoZXIgZWR1Y2F0aW9uOiBhIG1ldGEgYW5hbHlzaXMuIFJldmlldyBvZiBFZHVjYXRpb25hbCBSZXNlYXJjaCAxOTg5OyA5OiAzNDUtNDMwPC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPjMxLgkgRGF2aXMgTUgsIEhhcmRlbiBSTS4gQ29tcGV0ZW5jeSBiYXNlZCBhc3Nlc3NtZW50OiBNYWtpbmcgaXQgYSByZWFsaXR5LiBNZWRpY2FsIFRlYWNoZXIgMjAwMzsgMjUoNik6IDU2NS01Njg8L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwvdWw+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8aDQgY2xhc3M9InRpdGxlLXNpbXBsZSI+V2Vic2l0ZTo8L2g0PgogICAgICAgICAgICAgICAgICAgICAgICAgICAgPHVsIGNsYXNzPSJnby13aWRnZXQiPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj4xLglCcm93biBHVEwuIFdyaXRpbmcgYW5kIGdyYWRpbmcgZXNzYXkgcXVlc3Rpb25zLiBNYXJjaCAyMDEyOyBhdmFpbGFibGUgZnJvbTogaHR0cDovL2NmZS51bmMuZWR1LzwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj4yLglQcmluY2lwbGVzIG9mIEFzc2Vzc21lbnQtIEJlc3QgUHJhY3RpY2UuIGh0dHA6Ly93d3cuc2xpZGVzaGFyZS5uZXQmZ3Q7ZHJkandhbGtlcjwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj4zLglOb3JjaW5pSkosICBNY0tpbmxleSBEVy4gQXNzZXNzbWVudCBtZXRob2RzIGluIG1lZGljYWwgZWR1Y2F0aW9uLiA8YnI+d3d3LnNjaWVuY2VkaXJlY3QuY29tIDwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj40LglBTUVFIEd1aWRlcy1BbiBpbnRlcm5hdGlvbmFsIEFzc29jaWF0aW9uIEZvciBNZWRpY2FsIEVkdWNhdGlvbiA8YnI+aHR0cHM6Ly9hbWVlLm9yZyZndDtwdWJsaWNhdGlvbnM8L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iIyI+NS4JUG9ydGZvbGlvczogTGVhcm5pbmcgYW5kIEFzc2Vzc21lbnQgaW4gTWVkaWNhbCBFZHVjYXRpb24gPGJyPiBodHRwOi8vdW1hbml0b2JhLmNhJmd0O3BnbWUmZ3Q7bWVkaWE8L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwvdWw+CgoKICAgICAgICAgICAgICAgICAgICAgICAgPC9kaXY+PCEtLSBCbG9nIERldGFpbCBXcmFwcGVyIC0tPgogICAgICAgICAgICAgICAgICAgIDwvZGl2PjwhLS0gQmxvZyBXcmFwcGVyIC0tPgoKCiAgICAgICAgICAgICAgICA8L2Rpdj48IS0tIENvbHVtbiAtLT4=', '2017-12-13 10:13:07', NULL, 1),
(9, 'Assessment', 'assessment', 'PGRpdiBjbGFzcz0iY29sLXhzLTEyIG5ld3Mtc2luZ2xlIj4KICAgICAgICAgICAgICAgICAgICA8ZGl2IGNsYXNzPSJibG9nLXNpbmdsZS13cmFwIj4KCiAgICAgICAgICAgICAgICAgICAgICAgIDwhLS0gQmxvZyBEZXRhaWwgV3JhcHBlciAtLT4KICAgICAgICAgICAgICAgICAgICAgICAgPGRpdiBjbGFzcz0ibmV3cy1zaW5nbGUtZGV0YWlscyI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8aDQgY2xhc3M9InRpdGxlLXNpbXBsZSI+QXNzZXNzbWVudMKgIG1ldGhvZHM8L2g0PgoKICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxwPkVhY2ggdW5pdCBpcyBhc3Nlc3NlZCBieSBzZXZlcmFswqAgd2F5cy4gQSBzaW5nbGUgc2hvdCBhc3NpZ25tZW50IG9mIGV2ZXJ5IHVuaXQgaW4gd3JpdHRlbiBmb3JtIHdpbGwgYmUgdGhlIG1haW4gc3RlbSBvZiB0aGUgYXNzZXNzbWVudCBwcm9jZXNzLiBXb3JrLWJhc2VkIGFzc2Vzc21lbnQgb2YgaW5kaXZpZHVhbCB0YXNrIHdpbGwgYmUgYXNzZXNzZWQgYnkgYSBjb21wZXRlbnQgYXV0aG9yaXR5LiBUaGlzIG1heSBiZcKgIGFzbGlkZSBwcmVwYXJhdGlvbiBvZiBpbnRlcmFjdGl2ZSBsZWN0dXJlLCBwbGFubmluZyBvZiBhIGJlZHNpZGUgdGVhY2hpbmcgb3IgcHJlcGFyYXRpb24gb2YgNSBPU1BFIHN0YXRpb25zIG9mIHRoZWlyIG93biBkaXNjaXBsaW5lLiBUaGV5IGhhdmUgdG8gYXBwZWFyIGEgdW5pdCB3cml0dGVuIGV4YW0gd2hpY2ggd2lsbCBiZSBlaXRoZXIgTUNRLCBTQVEsIFNpbmdsZSBzZW50ZW5jZSBhbnN3ZXIgb3IgZmlsbCBpbiB0aGUgYmxhbmtzLiBXaG9sZSB1bml0IG1hcmtzIHdpbGwgYWN0IGFzIGZvcm1hdGl2ZSBhc3Nlc3NtZW50IGFuZCBpdCB3aWxsIGFkZCB0aGUgbWFya3Mgb2YgdGhlIG1vZHVsZSBleGFtaW5hdGlvbi48L3A+PGg0IGNsYXNzPSJ0aXRsZS1zaW1wbGUiIHN0eWxlPSJjb2xvcjogcmdiKDAsIDAsIDApOyI+TWFya2luZyBjcml0ZXJpYTwvaDQ+PHA+wqBBIG1hcmtpbmcgdGVhbSBhcHByb2FjaCBpcyBlbXBsb3llZCBmb3IgbWFya2luZyBhc3NpZ25tZW50cy4gR3VpZGFuY2UgaXMgcHJvdmlkZWQgZm9yIGJvdGggbWFya2VycyBhbmQgcGFydGljaXBhbnRzIHRocm91Z2ggbWFya2luZyBjcml0ZXJpYS4gVGhpcyBjcml0ZXJpYSBhcmUgaW50ZW5kZWQgdG8gY2xhcmlmeSBmb3IgcGFydGljaXBhbnRzIHdoYXQgdGhleSBhcmUgZXhwZWN0ZWQgdG8gZG8gZm9yIGVhY2ggYXNzaWdubWVudCBhbmQgdG8gaW1wcm92ZSBpbnRlciByYXRlciByZWxpYWJpbGl0eS48L3A+PHA+UGxhZ2lhcmlzbSBpcyBhIHNwZWNpZmljIGZvcm0gb2YgYWNhZGVtaWMgZGlzaG9uZXN0eSBpbnZvbHZpbmcgdGhlIHByZXNlbnRhdGlvbiBvZiBhbm90aGVyIGFzIG9uZeKAmXMgb3duLsKgIFNvIGRpcmVjdCBjb3B5aW5nIGZyb20gdGV4dGJvb2tzLCBqb3VybmFscywgb2VyaW9kaWNhbHMgZXRjIHdpdGggZnVsbCBhY2tub3dsZWRnZW1lbnQgb2YgdGhlIGFjdHVhbCBhdXRob3IgaXMgYSBwdW5pc2hhYmxlIG9mZmVuY2UuIFBhcmFwaHJhc2luZyBhbmQgY29weWluZyBhbm90aGVyIHdvcmsgY29tZeKAmXMgdW5kZXIgc2FtZSBvZmZlbmNlLiBTbyBhIGNvZGUgb2YgY29uZHVjdCBmb3IgdGhlIHRlYWNoZXIgd2lsbCBiZSBhcHBsaWNhYmxlIGZvciBhbGwgcGFydGljaXBhbnRzLjwvcD48aDQgY2xhc3M9InRpdGxlLXNpbXBsZSIgc3R5bGU9ImNvbG9yOiByZ2IoMCwgMCwgMCk7Ij5SZSBzaXQgY3JpdGVyaWE8L2g0PjxwPlRoZXJlIGFyZSBzZXZlcmFswqAgdHlwZSBvZiByZSBzaXQgaW4gdGhpcyBwYXJ0aWN1bGFyIGNvdXJzZS4gQW4gaW5jb21wbGV0ZSBhc3NpZ25tZW50IG9yIHZlcnkgYmFkbHkgcHJlcGFyZWQgYXNzaWdubWVudMKgIHdpbGwgYmUgc2ltcGx5IGRpc2NhcmRlZCBhbmQgYSBmcmVzaGx5IHByZXBhcmVkIGFzc2lnbm1lbnQgbWF5IGJlIGFza2VkwqAgZm9yIHJlIHN1Ym1pdC7CoCBJbiBzb21lIGNhc2VzIHR1dG9yIG1heSBzZW5kIHRoZSBiYWNrIHRoZSBvcmlnaW5hbCBvbmUgYW5kIGFza2VkIGZvciBjb21wbGV0aW9uIG9mIHRoZSBhc3NpZ24gbWVudC4gSG93ZXZlciBpdCB3aWxsIGJlIGFwcGxpY2FibGUgaW4gb25seSB0d28gb2NjYXNpb25zIGluIGEgbW9kdWxlIHRvdGFsIGZpdmUgb2NjYXNpb25zIGluIHdob2xlIGNvdXJzZS4gRmFpbCB0byBvYnRhaW4gYWRlcXVhdGUgcGFzcyBtYXJrcyBpbiBmb3JtYXRpdmUgd3JpdHRlbiBhc3Nlc3NtZW50wqAgd2lsbCBzaW1wbHkgYWxsb3dlZCBmb3IgYSByZXNpdCBpbiBzaW5nbGUgdGltZSBhbmQgZmFpbGluZyB0byBvYnRhaW4gdGhpcyBjcml0ZXJpYSBpbiBtb3JlIHRoYW4gb3IgZXF1YWwgdG8gNTAlIGNhc2VzIGluIGEgbW9kdWxlIG1heSBiYXJlZCB0aGUgcGFydGljaXBhbnRzIGZvciB0YWtpbmcgcGFydCBJIG5leHQgbW9kdWxlIGFzIHdlbGwuwqAgRmFpbCB0byBvYnRhaW4gdGhlIHBhc3MgbWFyayBpbiBzdW1tYXRpdmUgYXNzZXNzbWVudCBvZiB0aGUgbW9kdWxlIHdpbGwgYWxsb3cgZm9yIHJlIHNpdCB3aXRoaW4gMTAgd29ya2luZyBkYXlzIG9mIG9yIGJlZm9yZSBuZXh0IG1vZHVsZS48L3A+PHA+PGZvbnQgZmFjZT0iSGVsdmV0aWNhIE5ldWUsIEhlbHZldGljYSwgQXJpYWwsIHNhbnMtc2VyaWYiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE4cHg7Ij5FdGhpY2FsIGlzc3Vlczwvc3Bhbj48L2ZvbnQ+PGJyPjwvcD48cD5QYXJ0aWNpcGFudHMgd2lsbCBtYW5hZ2UgbGVhdmUsIGNsYXNzIHNjaGVkdWxlLCBhbmQgcmVhZGluZyB0aW1lLCBhc3Nlc3NtZW50IHRpbWUgYW5kIGxvZ2lzdGljIGJ5IHRoZW1zZWx2ZXMuIFRoZSBhdXRob3JpdHkgZm9yIHRoZSBjb3Vyc2Ugd2lsbCBub3QgdGFrZSBhbnkgcmVzcG9uc2liaWxpdHkgZm9yIHRoZXNlIGNhc2VzLjwvcD48cD48Zm9udCBmYWNlPSJIZWx2ZXRpY2EgTmV1ZSwgSGVsdmV0aWNhLCBBcmlhbCwgc2Fucy1zZXJpZiI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMThweDsiPlJlc3VsdCBkZWNsYXJhdGlvbjwvc3Bhbj48L2ZvbnQ+PGJyPjwvcD48cD5Gb3JtYXRpdmUgYXNzZXNzbWVudCB3aWxsIGJlIGRlY2xhcmVkIGluZGl2aWR1YWxseSBhbmQgbW9kdWxlIGFzc2Vzc21lbnQgd2lsbCBiZSBkZWNsYXJlZCBhcyBhIHdob2xlLiBBZnRlciBjb21wbGV0aW9uIG9mIGFsbCB0aGUgbW9kdWxlIHRoZSBmb3JtYXRpdmUgYXNzZXNzbWVudCB3aWxsIGJlIHRha2VuIGFuZCBhIHJlc3VsdCBvZiBhbGwgdGhvc2Ugd2lsbCBiZSBmb3JtdWxhdGVkIHRvIGRlY2xhcmUgc3VjY2Vzc2Z1bCBjYW5kaWRhdGVzLiBBIGNlcnRpZmljYXRlIG9mIGNvbXBsZXRpb24gd2lsbCBiZSBhd2FyZGVkIGluIGNlcmVtb255IGZvciBzdWNjZXNzZnVsIGNhbmRpZGF0ZXMuPC9wPgoKICAgICAgICAgICAgICAgICAgICAgICAgPC9kaXY+PCEtLSBCbG9nIERldGFpbCBXcmFwcGVyIC0tPgogICAgICAgICAgICAgICAgICAgIDwvZGl2PjwhLS0gQmxvZyBXcmFwcGVyIC0tPgoKCiAgICAgICAgICAgICAgICA8L2Rpdj4=', '2017-12-13 10:33:46', NULL, 1),
(10, 'The Regulations', 'rules-regulations', 'PGRpdiBjbGFzcz0iY29sLXhzLTEyIG5ld3Mtc2luZ2xlIj4KICAgICAgICAgICAgICAgICAgICA8ZGl2IGNsYXNzPSJibG9nLXNpbmdsZS13cmFwIj4KCiAgICAgICAgICAgICAgICAgICAgICAgIDwhLS0gQmxvZyBEZXRhaWwgV3JhcHBlciAtLT4KICAgICAgICAgICAgICAgICAgICAgICAgPGRpdiBjbGFzcz0ibmV3cy1zaW5nbGUtZGV0YWlscyI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8aDQgY2xhc3M9InRpdGxlLXNpbXBsZSIgc3R5bGU9ImNvbG9yOiByZ2IoMCwgMCwgMCk7Ij48dT48aT5HZW5lcmFsPC9pPjwvdT48L2g0PjxoNCBjbGFzcz0idGl0bGUtc2ltcGxlIiBzdHlsZT0iIj48Zm9udCBmYWNlPSJPcGVuIFNhbnMsIHNhbnMtc2VyaWYiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE0cHg7Ij5UaGlzIGNlcnRpZmljYXRlIGNvdXJzZSB3aWxsIG5vdCBjZXJ0aWZ5IHRoYXQgeW91IGFyZSBjb21wZXRlbnQgY2VydGFpbiBjbGluaWNhbCBhc3BlY3QuIEl0IGlzIG9ubHkgYXBwbGljYWJsZSBpbiB0ZXJtIG9mIG1lZGljYWwgZWR1Y2F0aW9uIG9ubHkuPC9zcGFuPjwvZm9udD48L2g0PjxoNCBjbGFzcz0idGl0bGUtc2ltcGxlIiBzdHlsZT0iIj48aT48dT5BZG1pc3Npb248L3U+PC9pPjxicj48L2g0PjxwPjwvcD48cD48L3A+PHVsPjwvdWw+PHA+PC9wPjxvbD48bGk+PGZvbnQgY29sb3I9IiMzMjMyM2EiIGZhY2U9Ik9wZW4gU2Fucywgc2Fucy1zZXJpZiI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTRweDsiPkEgY2FuZGlkYXRlIGZvciBhZG1pc3Npb24gdG8gdGhlIHByb2dyYW1tZSBtdXN0IGhhdmUmbmJzcDsgYWNoaXZlZCBhIHBvc3RncmFkdWF0ZSBkZWdyZWUgaW4gYW55IGRpc2NpcGxpbmUgYXBwcm92ZWQgYnkgQk1EQzwvc3Bhbj48L2ZvbnQ+PC9saT48bGk+Q3VycmVudGx5IGhlIGlzIGF0dGFjaGVkIHRvIGFueSBvZiB0aGUgbWVkaWNhbCBjb2xsZWdlIG9yIE1lZGljYWwgVW5pdmVyc2l0eS48L2xpPjxsaT5XaWxsaW5nIHRvIHNlcnZlIHRoZSBtZWRpY2FsIGNvbGxlZ2UgZm9yIHRoZSBzdHVkeSBwZXJpb2QgYW5kIHRocmVlIHllYXJzIHRoZXJlIGFmdGVyLjwvbGk+PC9vbD4KCiAgICAgICAgICAgICAgICAgICAgICAgIDwvZGl2PjwhLS0gQmxvZyBEZXRhaWwgV3JhcHBlciAtLT4KICAgICAgICAgICAgICAgICAgICA8L2Rpdj48IS0tIEJsb2cgV3JhcHBlciAtLT4KCgogICAgICAgICAgICAgICAgPC9kaXY+', '2017-12-13 10:40:01', NULL, 1),
(11, 'Books', 'books', 'PGRpdiBjbGFzcz0iY29sLXhzLTEyIG5ld3Mtc2luZ2xlIj4KICAgICAgICAgICAgICAgICAgICA8ZGl2IGNsYXNzPSJibG9nLXNpbmdsZS13cmFwIj4KCiAgICAgICAgICAgICAgICAgICAgICAgIDwhLS0gQmxvZyBEZXRhaWwgV3JhcHBlciAtLT4KICAgICAgICAgICAgICAgICAgICAgICAgPGRpdiBjbGFzcz0ibmV3cy1zaW5nbGUtZGV0YWlscyI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8aDQgY2xhc3M9InRpdGxlLXNpbXBsZSI+Qm9va3M6PC9oND4KCiAgICAgICAgICAgICAgICAgICAgICAgICAgIDx1bCBjbGFzcz0iZ28td2lkZ2V0Ij4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iIyI+MS4JQSBwcmFjdGljYWwgZ3VpZGUgZm9yIG1lZGljYWwgdGVhY2hlcnMuIERlbnQgUkEsIEhhcmRlbiBSTSwgZWRpdG9ycyAybmQgZWQuIENodXJjaGlsbCBMaXZpbmdzdG9uZSwgRWRpbmJ1cmdoLiAyMDA1PC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPjIuCUEgcHJhY3RpY2FsIGd1aWRlIHRvIG1lZGljYWwgc3R1ZGVudCBhc3Nlc3NtZW50LiBBbWluIFosIFNlbmcgQ1ksIEVuZyBLSCBlZGl0b3JzLiAxU1QgZWQuIFdvcmxkIFNjaWVudGlmaWMsIFNpbmdhcG9yZS4gMjAwNjwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj4zLglCYXNpY3MgaW4gbWVkaWNhbCBlZHVjYXRpb24uIEFtaW4gWiwgRW5nIEtIIGVkaXRvcnMuIDFzdCBlZCwgV29ybGQgU2NpZW50aWZpYywgTmV3IEplcnNleSwgMjAwMzwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj40LglBIGhhbmRib29rIGZvciBtZWRpY2FsIHRlYWNoZXIuIE5ld2JsZSBELCBDYW5ub24gUiBlZGl0b3JzLiA0dGggZWQuIEtsdXdlciBBY2FkZW1pYyBQdWJsaWNhdGlvbiwgQm9zdG9uLCAxOTk2PC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPjUuCUFzc2Vzc21lbnQgaW4gbWVkaWNhbCBlZHVjYXRpb246IFRyZW5kcyBhbmQgdG9vbHMuICBTb29kIFIuIDFTVCBlZC4gSyBMIFdpZyBjZW50cmUsIE5ldyBEZWxoaSwgMTk5MzwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj42LglDb25jZXB0cyBmIG1lZGljYWwgZWR1Y2F0aW9uLiBCZWd1bSBULiAxU1QgZWQuIERoYWthLCAyMDEzIDwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgPC91bD4KCiAgICAgICAgICAgICAgICAgICAgICAgIDwvZGl2PjwhLS0gQmxvZyBEZXRhaWwgV3JhcHBlciAtLT4KICAgICAgICAgICAgICAgICAgICA8L2Rpdj48IS0tIEJsb2cgV3JhcHBlciAtLT4KCgogICAgICAgICAgICAgICAgPC9kaXY+', '2017-12-13 10:44:03', NULL, 1),
(12, 'Booklets', 'booklets', 'PGRpdiBjbGFzcz0iY29sLXhzLTEyIG5ld3Mtc2luZ2xlIj4KICAgICAgICAgICAgICAgICAgICA8ZGl2IGNsYXNzPSJibG9nLXNpbmdsZS13cmFwIj4KCiAgICAgICAgICAgICAgICAgICAgICAgIDwhLS0gQmxvZyBEZXRhaWwgV3JhcHBlciAtLT4KICAgICAgICAgICAgICAgICAgICAgICAgPGRpdiBjbGFzcz0ibmV3cy1zaW5nbGUtZGV0YWlscyI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8aDQgY2xhc3M9InRpdGxlLXNpbXBsZSI+Qm9va2xldHM6PC9oND4KCiAgICAgICAgICAgICAgICAgICAgICAgICAgPHVsIGNsYXNzPSJnby13aWRnZXQiPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj4xLglELiBJLiBOZXdibGUuIEFzc2Vzc2luZyBDbGluaWNhbCBDb21wZXRlbmNlIGF0IHRoZSB1bmRlcmdyYWR1YXRlIGxldmVsLiBBU01FIE1lZGljYWwgRWR1Y2F0aW9uIEJvb2tsZXQgTm8uIDI1LiBEdW5kZWUsIDE5OTI8L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iIyI+Mi4JS25veCBKREUuIE1vZGlmaWVkIEVzc2F5IFF1ZXN0aW9uLiBBU01FIE1lZGljYWwgRWR1Y2F0aW9uIEJvb2tsZXQgTm8uIDUuIER1bmRlZSwgMTk4NjwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj4zLglTdG9rZXMgSkYuIFRoZSBjbGluaWNhbCBleGFtaW5hdGlvbi0gYXNzZXNzbWVudCBvZiBjbGluaWNhbCBza2lsbHMuIEFTTUUgYm9va2xldCBOby40LCBEdW5kZWUsIDE5NzQ8L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwvdWw+CgogICAgICAgICAgICAgICAgICAgICAgICA8L2Rpdj48IS0tIEJsb2cgRGV0YWlsIFdyYXBwZXIgLS0+CiAgICAgICAgICAgICAgICAgICAgPC9kaXY+PCEtLSBCbG9nIFdyYXBwZXIgLS0+CgoKICAgICAgICAgICAgICAgIDwvZGl2Pg==', '2017-12-13 10:46:15', NULL, 1),
(13, 'Articles', 'articles', 'PGRpdiBjbGFzcz0iY29sLXhzLTEyIG5ld3Mtc2luZ2xlIj4KICAgICAgICAgICAgICAgICAgICA8ZGl2IGNsYXNzPSJibG9nLXNpbmdsZS13cmFwIj4KCiAgICAgICAgICAgICAgICAgICAgICAgIDwhLS0gQmxvZyBEZXRhaWwgV3JhcHBlciAtLT4KICAgICAgICAgICAgICAgICAgICAgICAgPGRpdiBjbGFzcz0ibmV3cy1zaW5nbGUtZGV0YWlscyI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8aDQgY2xhc3M9InRpdGxlLXNpbXBsZSI+QXJ0aWNsZXM6PC9oND4KCiAgICAgICAgICAgICAgICAgICAgICAgICAgPHVsIGNsYXNzPSJnby13aWRnZXQiPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj4xLglFYnN0ZWluIFJNLiBBc3Nlc3NtZW50IGluIG1lZGljYWwgZWR1Y2F0aW9uLiBOIEVuZyBKIE1lZCAyMDA3OyAzNTY6IDM4Ny05NiA8L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iIyI+Mi4JTm9yY2luaUpKLCAgTWNLaW5sZXkgRFcuIEFzc2Vzc21lbnQgbWV0aG9kcyBpbiBtZWRpY2FsIGVkdWNhdGlvbi4gVGVhY2hpbmcgYW5kIFRlYWNoZXIgZWR1Y2F0aW9uIDIwMDc7IDIzOiAyMzktMjUwPC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPjMuCUhhcmRlbiBSTS4gSG93IHRvIGFzc2VzcyBzdHVkZW50IDogYW4gb3ZlcnZpZXcuIE1lZGljYWwgVGVhY2hlciAxOTc5OyAxOiA2NS03MDwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj40LglGb3dlbGwgU0wsIEJsaWdoIEpHLiBSZWNlbnQgZGV2ZWxvcG1lbnRzIGluIGFzc2Vzc2luZyBtZWRpY2FsIHN0dWRlbnRzLiBQb3N0Z3JhZCBNZWQgSiAxOTk4OyA3OTogMTgtMjQ8L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iIyI+NS4JV29vZCBULiBBc3Nlc3NtZW50IG5vdCBvbmx5IGRyaXZlcyBsZWFybmluZywgaXQgYWxzbyBoZWxwcyBsZWFybmluZy4gTWVkaWNhbCBFZHVjYXRpb24gMjAwOTsgNDM6IDUtNjwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj42LglIYXJkZW4gUk0uIEhvdyB0byBhc3Nlc3MgY2xpbmljYWwgY29tcGV0ZW5jZTogYW4gb3ZlcnZpZXcuIE1lZGljYWwgVGVhY2hlciAxOTc5OyAxKDYpOiAyODktOTY8L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iIyI+Ny4JSGFyZGVuIFJNLiBIb3cgdG8gYXNzZXNzIHN0dWRlbnRzOiBhbiBvdmVydmlldy4gTWVkaWNhbCBUZWFjaGVyIDE5Nzk7IDE6IDY1LTcwPC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPjguCUVyYXVudCBNQS4gV2lkZSBwZXJzcGVjdGl2ZSBvbiBhc3Nlc3NtZW50LiBNZWRpY2FsIEVkdWNhdGlvbiAyMDA0OyAzODogODAwLSA5MDQ8L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iIyI+OS4JU2NodXdpcnRoIExXVCwgVmFuIGRlciBCbGV1dGVuIENQTS4gV3JpdHRlbiBhc3Nlc3NtZW50LiBCTUogMjAwMzsgMzI2OiA2NDMtNDU8L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iIyI+MTAuCSBSYWRlbWFrZXJzIEosIENhdGUgVEgsIEJhciBQUi4gUHJvZ3Jlc3MgdGVzdGluZyB3aXRoIHNob3J0IGFuc3dlciBxdWVzdGlvbnMuIE1lZGljYWwgVGVhY2hlciAyMDA1OyAyNyg3KTogNTc4LTgyPC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPjExLgkgRmFybGV5IEpLLiBUaGUgbXVsdGlwbGUgY2hvaWNlIHRlc3Q6IFdyaXRpbmcgdGhlIHF1ZXN0aW9ucy4gTnVyc2UgRWR1YyAxOTg5OyAxNDogMTAtMTI8L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iIyI+MTIuCSBNYyBDb3VicmllIFAuIEltcHJvdmluZyB0aGUgZmFpcm5lc3Mgb2YgbXVsdGlwbGUgY2hvaWNlIHF1ZXN0aW9uczogQSBsaXRlcmF0dXJlIHJldmlldy4gTWVkaWNhbCBUZWFjaGVyIDIwMDQ7IDI2KDgpOiA3MDktMTI8L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iIyI+MTMuCSBNYyBDb3VicmllIFAsIE1jS25pZ2h0IEwuIFNpbmdsZSBiZXN0IGFuc3dlciBNQ1FzOiBhIG5ldyBmb3JtYXQgZm9yIHRoZSBGUkNSIHBhcnQgMmEgZXhhbS4gQ2xpbmljYWwgUmFkaW9sb2d5IDIwMDg7IDYzOiA1MDYtMTA8L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iIyI+MTQuCSBUd29ydCBDLCBtdWNrbG93IEouIEhvdyB0byB3cml0ZSBoaWdoIHF1YWxpdHkgcXVlc3Rpb25zIGZvciBhIGhpZ2ggc3Rha2VzIGV4YW1pbmF0aW9uLiBDbGluaWNhbCBNZWRpY2luZSAyMDExOyAxMSgzKTogMjI3LTMwPC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPjE1LgkgV2Fsc2ggSy4gQWR2aWNlIG9uIHdyaXRpbmcgbXVsdGlwbGUgY2hvaWNlIHF1ZXN0aW9ucy4gQk1KIENhcnJpZXJzIDIwMDU8L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iIyI+MTYuCSBNaWxsZXIgR0UuIFRoZSBhc3Nlc3NtZW50IG9mIGNsaW5pY2FsIHNraWxscy8gY29tcGV0ZW5jZS8gcGVyZm9ybWFuY2UuIEFjYWQgTWVkIDE5OTA6IDY1OiA1NjMtNzA8L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iIyI+MTcuCSBXYXNzIFYsIFZhbiBkZXIgQmxldXRlbiBDUE0sIFNoYXR6ZXIgSi4gQXNzZXNzbWVudCBvZiBjbGluaWNhbCBjb21wZXRlbmNlLiBMYW5jZXQgMjAwMTsgMzU3OiA5NDUtOTwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj4xOC4JIE5vcmNpbmlKSi4gQ3VycmVudCBwZXJzcGVjdGl2ZXMgaW4gYXNzZXNzbWVudDogdGhlIGFzc2Vzc21lbnQgb2YgcGVyZm9ybWFuY2UgYXQgd29yay4gTWVkaWNhbCBFZHVjYXRpb24gMjAwNTsgMzk6IDg4MC04OTwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj4xOS4JIEhhcmRlbiBSTSwgR2xlZXNvbiBGQS4gQXNzZXNzbWVudCBvZiBjbGluaWNhbCBjb21wZXRlbmNlIHVzaW5nIGFuIE9iamVjdGl2ZSBTdHJ1Y3R1cmVkIENsaW5pY2FsIEV4YW1pbmF0aW9uIChPU0NFKS4gTWVkaWNhbCBFZHVjYXRpb24gMTk3OTsgMTM6IDQxLTU0PC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPjIwLgkgU2VuYW5heWFrZSBNUC4gVGhlIE9TQ0UuIFNyaUxhbmthIEpvdXJuYWwgb2YgQ2hpbGQgSGVhbHRoIDIwMDE7IDMwOiAyNC0yNzwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj4yMS4JIEhvZGdlcyBCLiBWYWxpZGl0eSBhbmQgdGhlIE9TQ0UuIE1lZGljYWwgVGVhY2hlciAyMDAzOyAyNTogMjUwLTU0PC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPjIyLgkgTGVlIFlNLCBEdWNrLVN1biBBSE4uIFRoZSBPU0NFOiBBIG5ldyBjaGFsbGVuZ2UgdG8gdGhlIGV2YWx1YXRpb24gc3lzdGVtIGluIEtvcmVhLiBNZWRpY2FsIFRlYWNoZXIgMjAwNjsgMjgoNCk6IDM3Ny03OTwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj4yMy4JIFZhbiBkZXIgQmxldXRlbiBDUE0uIE1ha2luZyB0aGUgYmVzdCBvZiB0aGUg4oCcTG9uZyBDYXNl4oCdLiBMYW5jZXQgMTk5NjsgMzc0OiA3MDQtNTwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj4yNC4JIFdhc3MgViwgSm9sbHkgQi4gRG9lcyBvYnNlcnZhdGlvbiBhZGQgdmFsaWRpdHkgdG8gdGhlIGxvbmcgY2FzZT8gTWVkaWNhbCBFZHVjYXRpb24gMjAwMTsgMzU6IDcyOS0zNDwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj4yNS4JIE5vcmNpbmlKSi4gTWluaSBDbGluaWNhbCBFdmFsdWF0aW9uIEV4ZXJjaXNlIChtaW5pLSBDRVgpLiBUaGUgQ2xpbmljYWwgVGVhY2hlciAyMDA1OyAyOjI1LTMwPC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPjI2LgkgTm9yY2luaUpKLCBCbGFuayBMTCwgRHVmZnkgRkQuIFRoZSBtaW5pLSBDRVg6IEEgbWV0aG9kIGZvciBhc3Nlc3NpbmcgY2xpbmljYWwgc2tpbGxzLiBBbm5hbHMgb2YgSW50ZXJuYWwgTWVkaWNpbmUgMjAwMzsgMTM4KDYpOiA0NzYtODMgPC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPjI3LgkgS29nYW4gSiwgSG9sbWJvZSBFIEhhdWVyIEsuIFRvb2xzIGZvciBkaXJlY3Qgb2JzZXJ2YXRpb24gYW5kIGFzc2Vzc21lbnQgb2YgY2xpbmljYWwgc2tpbGxzIG9mIG1lZGljYWwgdHJhaW5lZXMuIEpBTUEgMjAwOTsgMzAyOiAxMzE2LTI2PC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPjI4LgkgV2ViYiBDLCBFbmRhY290dCBSLCBHcmF5IE0uIE1vZGVscyBvZiBQb3J0Zm9saW8uIE1lZGljYWwgRWR1Y2F0aW9uIDIwMDI7IDM2OiA4OTctOTg8L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iIyI+MjkuCSBGcmllZG1hbiBCLCBEYXZpZCBNLCBEYXZpcyBNSCwgSGFyZGVuIFJNLiBQb3J0Zm9saW8gYXMgYSBtZXRob2Qgb2Ygc3R1ZGVudCBhc3Nlc3NtZW50LiBNZWRpY2FsIFRlYWNoZXIgMjAwMTsgMjMoNik6IDUzNS01MTwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj4zMC4JIEZhbGNoaWtvdiBOLCBCb3VkIEQuIFN0dWRlbnQgc2VsZiBhc3Nlc3NtZW50IGluIGhpZ2hlciBlZHVjYXRpb246IGEgbWV0YSBhbmFseXNpcy4gUmV2aWV3IG9mIEVkdWNhdGlvbmFsIFJlc2VhcmNoIDE5ODk7IDk6IDM0NS00MzA8L2E+PC9saT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8bGk+PGEgaHJlZj0iIyI+MzEuCSBEYXZpcyBNSCwgSGFyZGVuIFJNLiBDb21wZXRlbmN5IGJhc2VkIGFzc2Vzc21lbnQ6IE1ha2luZyBpdCBhIHJlYWxpdHkuIE1lZGljYWwgVGVhY2hlciAyMDAzOyAyNSg2KTogNTY1LTU2ODwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgPC91bD4KCiAgICAgICAgICAgICAgICAgICAgICAgIDwvZGl2PjwhLS0gQmxvZyBEZXRhaWwgV3JhcHBlciAtLT4KICAgICAgICAgICAgICAgICAgICA8L2Rpdj48IS0tIEJsb2cgV3JhcHBlciAtLT4KCgogICAgICAgICAgICAgICAgPC9kaXY+', '2017-12-13 10:47:21', NULL, 1),
(14, 'Websites', 'websites', 'PGRpdiBjbGFzcz0iY29sLXhzLTEyIG5ld3Mtc2luZ2xlIj4KICAgICAgICAgICAgICAgICAgICA8ZGl2IGNsYXNzPSJibG9nLXNpbmdsZS13cmFwIj4KCiAgICAgICAgICAgICAgICAgICAgICAgIDwhLS0gQmxvZyBEZXRhaWwgV3JhcHBlciAtLT4KICAgICAgICAgICAgICAgICAgICAgICAgPGRpdiBjbGFzcz0ibmV3cy1zaW5nbGUtZGV0YWlscyI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8aDQgY2xhc3M9InRpdGxlLXNpbXBsZSI+V2Vic2l0ZTo8L2g0PgoKICAgICAgICAgICAgICAgICAgICAgICAgICA8dWwgY2xhc3M9ImdvLXdpZGdldCI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPjEuCUQuIEkuIE5ld2JsZS4gQXNzZXNzaW5nIENsaW5pY2FsIENvbXBldGVuY2UgYXQgdGhlIHVuZGVyZ3JhZHVhdGUgbGV2ZWwuIEFTTUUgTWVkaWNhbCBFZHVjYXRpb24gQm9va2xldCBOby4gMjUuIER1bmRlZSwgMTk5MjwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT48YSBocmVmPSIjIj4yLglLbm94IEpERS4gTW9kaWZpZWQgRXNzYXkgUXVlc3Rpb24uIEFTTUUgTWVkaWNhbCBFZHVjYXRpb24gQm9va2xldCBOby4gNS4gRHVuZGVlLCAxOTg2PC9hPjwvbGk+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPGxpPjxhIGhyZWY9IiMiPjMuCVN0b2tlcyBKRi4gVGhlIGNsaW5pY2FsIGV4YW1pbmF0aW9uLSBhc3Nlc3NtZW50IG9mIGNsaW5pY2FsIHNraWxscy4gQVNNRSBib29rbGV0IE5vLjQsIER1bmRlZSwgMTk3NDwvYT48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgPC91bD4KCiAgICAgICAgICAgICAgICAgICAgICAgIDwvZGl2PjwhLS0gQmxvZyBEZXRhaWwgV3JhcHBlciAtLT4KICAgICAgICAgICAgICAgICAgICA8L2Rpdj48IS0tIEJsb2cgV3JhcHBlciAtLT4KCgogICAgICAgICAgICAgICAgPC9kaXY+', '2017-12-13 10:49:18', NULL, 1),
(16, 'Faculty', 'faculty', 'PGRpdiBjbGFzcz0iY29sLXhzLTEyIG5ld3Mtc2luZ2xlIj4KICAgICAgICAgICAgICAgICAgICA8ZGl2IGNsYXNzPSJibG9nLXNpbmdsZS13cmFwIj4KCiAgICAgICAgICAgICAgICAgICAgICAgIDwhLS0gQmxvZyBEZXRhaWwgV3JhcHBlciAtLT4KICAgICAgICAgICAgICAgICAgICAgICAgPGRpdiBjbGFzcz0ibmV3cy1zaW5nbGUtZGV0YWlscyI+CiAgICAgICAgICAgICAgICAgICAgICAgICAgICA8aDQgY2xhc3M9InRpdGxlLXNpbXBsZSI+RmFjdWx0eTo8L2g0PgoKICAgICAgICAgICAgICAgICAgICAgICAgICAgPHVsIGNsYXNzPSJnby13aWRnZXQiPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxsaT4KCQoJCgk8c3R5bGUgdHlwZT0idGV4dC9jc3MiPgoJCUBwYWdlIHsgbWFyZ2luOiAwLjc5aW4gfQoJCXAgeyBtYXJnaW4tYm90dG9tOiAwLjFpbjsgZGlyZWN0aW9uOiBsdHI7IGxpbmUtaGVpZ2h0OiAxMjAlOyB0ZXh0LWFsaWduOiBsZWZ0OyBvcnBoYW5zOiAyOyB3aWRvd3M6IDIgfQoJCXAuY3RsIHsgZm9udC1zaXplOiAxNHB0OyBzby1sYW5ndWFnZTogYm4tQkQgfQoJPC9zdHlsZT4KCgo8cCBjbGFzcz0id2VzdGVybiIgc3R5bGU9Im1hcmdpbi1ib3R0b206IDAuMTRpbjsgbGluZS1oZWlnaHQ6IDExNSUiPjxmb250IHNpemU9IjMiIHN0eWxlPSJmb250LXNpemU6IDEycHQiPjxiPkNvdXJzZQpBZG1pbmlzdHJhdG9yOiA8L2I+PC9mb250Pjxmb250IHNpemU9IjMiIHN0eWxlPSJmb250LXNpemU6IDEycHQiPlByb2YKSHVtYXl1biBLYWJpciBDaG93ZGh1cnk8L2ZvbnQ+PC9wPjxwIGNsYXNzPSJ3ZXN0ZXJuIiBzdHlsZT0ibWFyZ2luLWJvdHRvbTogMC4xNGluOyBsaW5lLWhlaWdodDogMTE1JSI+PGZvbnQgc2l6ZT0iMyIgc3R5bGU9ImZvbnQtc2l6ZTogMTJwdCI+PGI+Q291cnNlCkRpcmVjdG9yOiA8L2I+PC9mb250Pjxmb250IHNpemU9IjMiIHN0eWxlPSJmb250LXNpemU6IDEycHQiPlByb2YKVGFobWluYSBCZWd1bTwvZm9udD48L3A+PHAgY2xhc3M9Indlc3Rlcm4iIHN0eWxlPSJtYXJnaW4tYm90dG9tOiAwLjE0aW47IGxpbmUtaGVpZ2h0OiAxMTUlIj4KPGJyPgoKPC9wPjxwIGNsYXNzPSJ3ZXN0ZXJuIiBzdHlsZT0ibWFyZ2luLWJvdHRvbTogMC4xNGluOyBsaW5lLWhlaWdodDogMTE1JSI+PGZvbnQgc2l6ZT0iMyIgc3R5bGU9ImZvbnQtc2l6ZTogMTJwdCI+PGI+MS4gQ291cnNlCiBjby1vcmRpbmF0b3JzPC9iPjwvZm9udD48L3A+PHAgY2xhc3M9Indlc3Rlcm4iIHN0eWxlPSJtYXJnaW4tYm90dG9tOiAwLjE0aW47IGxpbmUtaGVpZ2h0OiAxMTUlIj5hLiBQcm9mLgoJRmVyZG91c3kgQmVndW0gRmxvcmE8L3A+PHAgY2xhc3M9Indlc3Rlcm4iIHN0eWxlPSJtYXJnaW4tYm90dG9tOiAwLjE0aW47IGxpbmUtaGVpZ2h0OiAxMTUlIj5iLiBQcm9mLiBBYmlkCglIb3NzYWluIE1vbGxhaC48L3A+PHAgY2xhc3M9Indlc3Rlcm4iIHN0eWxlPSJtYXJnaW4tYm90dG9tOiAwLjE0aW47IGxpbmUtaGVpZ2h0OiAxMTUlIj5jLlByb2YgU2hhaAoJQWxhbTwvcD48cCBjbGFzcz0id2VzdGVybiIgc3R5bGU9Im1hcmdpbi1ib3R0b206IDAuMTRpbjsgbGluZS1oZWlnaHQ6IDExNSUiPjxicj4KCjwvcD48cCBjbGFzcz0id2VzdGVybiIgc3R5bGU9Im1hcmdpbi1ib3R0b206IDAuMTRpbjsgbGluZS1oZWlnaHQ6IDExNSUiPjxmb250IHNpemU9IjMiIHN0eWxlPSJmb250LXNpemU6IDEycHQiPjxiPjIuCk1vZHVsZSBjby1vcmRpbmF0b3I8L2I+PC9mb250PjwvcD48cCBjbGFzcz0id2VzdGVybiIgc3R5bGU9Im1hcmdpbi1ib3R0b206IDAuMTRpbjsgbGluZS1oZWlnaHQ6IDExNSUiPglhLgpDb250ZW1wb3JhcnkgaXNzdWVzIGluIE1lZGljYWwgRWR1Y2F0aW9uLS0tIFByb2YuIEZlcmRvdXN5IEJlZ3VtCkZsb3JhICZhbXA7IFByb2YgU2hhaCBBbGFtPC9wPjxwIGNsYXNzPSJ3ZXN0ZXJuIiBzdHlsZT0ibWFyZ2luLWJvdHRvbTogMC4xNGluOyBsaW5lLWhlaWdodDogMTE1JSI+CWIuClRlYWNoaW5nLWxlYXJuaW5nLS0tLVByb2YuIEFCTSBKYW1hbCAmYW1wOyBQcm9mLiBBYmlkIEhvc3NhaW4gTW9sbGFoLjwvcD48cCBjbGFzcz0id2VzdGVybiIgc3R5bGU9Im1hcmdpbi1ib3R0b206IDAuMTRpbjsgbGluZS1oZWlnaHQ6IDExNSUiPgljLgogSW5zdHJ1Y3Rpb25hbCBtYXRlcmlhbCBkZXNpZ24tLS0gUHJvZi4gTXVuYSBTYWxpbWEgSmFoYW48L3A+PHAgY2xhc3M9Indlc3Rlcm4iIHN0eWxlPSJtYXJnaW4tYm90dG9tOiAwLjE0aW47IGxpbmUtaGVpZ2h0OiAxMTUlIj4JZC4KQXNzZXNzbWVudC0tLS0gUHJvZi4gVGFobWluYSBCZWd1bTwvcD48cCBjbGFzcz0id2VzdGVybiIgc3R5bGU9Im1hcmdpbi1ib3R0b206IDAuMTRpbjsgbGluZS1oZWlnaHQ6IDExNSUiPjxicj48L3A+PHAgY2xhc3M9Indlc3Rlcm4iIHN0eWxlPSJtYXJnaW4tYm90dG9tOiAwLjE0aW47IGxpbmUtaGVpZ2h0OiAxMTUlIj4JCjwvcD48cCBjbGFzcz0id2VzdGVybiIgc3R5bGU9Im1hcmdpbi1ib3R0b206IDAuMTRpbjsgbGluZS1oZWlnaHQ6IDExNSUiPjxmb250IHNpemU9IjMiIHN0eWxlPSJmb250LXNpemU6IDEycHQiPjxiPjMuCkZhY3VsdGllczogPC9iPjwvZm9udD4KPC9wPjxwIGNsYXNzPSJ3ZXN0ZXJuIiBzdHlsZT0ibWFyZ2luLWJvdHRvbTogMC4xNGluOyBsaW5lLWhlaWdodDogMTE1JSI+CWEuCjxzcGFuIHN0eWxlPSJiYWNrZ3JvdW5kLWltYWdlOiBpbml0aWFsOyBiYWNrZ3JvdW5kLXBvc2l0aW9uOiBpbml0aWFsOyBiYWNrZ3JvdW5kLXNpemU6IGluaXRpYWw7IGJhY2tncm91bmQtcmVwZWF0OiBpbml0aWFsOyBiYWNrZ3JvdW5kLWF0dGFjaG1lbnQ6IGluaXRpYWw7IGJhY2tncm91bmQtb3JpZ2luOiBpbml0aWFsOyBiYWNrZ3JvdW5kLWNsaXA6IGluaXRpYWw7Ij5Qcm9mLgpLaG9uZGtlciBNYW56YXJlIFNoYW1pbTwvc3Bhbj4gCjwvcD48cCBjbGFzcz0id2VzdGVybiIgc3R5bGU9Im1hcmdpbi1ib3R0b206IDAuMTRpbjsgbGluZS1oZWlnaHQ6IDExNSUiPgliLgpQcm9mLiBBYmR1bCBIYW5pZiAoVGFibHUpPC9wPjxwIGNsYXNzPSJ3ZXN0ZXJuIiBzdHlsZT0ibWFyZ2luLWJvdHRvbTogMC4xNGluOyBsaW5lLWhlaWdodDogMTE1JSI+CWMuCjxzcGFuIHN0eWxlPSJiYWNrZ3JvdW5kLWltYWdlOiBpbml0aWFsOyBiYWNrZ3JvdW5kLXBvc2l0aW9uOiBpbml0aWFsOyBiYWNrZ3JvdW5kLXNpemU6IGluaXRpYWw7IGJhY2tncm91bmQtcmVwZWF0OiBpbml0aWFsOyBiYWNrZ3JvdW5kLWF0dGFjaG1lbnQ6IGluaXRpYWw7IGJhY2tncm91bmQtb3JpZ2luOiBpbml0aWFsOyBiYWNrZ3JvdW5kLWNsaXA6IGluaXRpYWw7Ij5Qcm9mPC9zcGFuPjxzcGFuIHN0eWxlPSJiYWNrZ3JvdW5kLWltYWdlOiBpbml0aWFsOyBiYWNrZ3JvdW5kLXBvc2l0aW9uOiBpbml0aWFsOyBiYWNrZ3JvdW5kLXNpemU6IGluaXRpYWw7IGJhY2tncm91bmQtcmVwZWF0OiBpbml0aWFsOyBiYWNrZ3JvdW5kLWF0dGFjaG1lbnQ6IGluaXRpYWw7IGJhY2tncm91bmQtb3JpZ2luOiBpbml0aWFsOyBiYWNrZ3JvdW5kLWNsaXA6IGluaXRpYWw7Ij4uCk0gQSBXb2hhYjwvc3Bhbj48L3A+PHAgY2xhc3M9Indlc3Rlcm4iIHN0eWxlPSJtYXJnaW4tYm90dG9tOiAwLjE0aW47IGxpbmUtaGVpZ2h0OiAxMTUlIj4KCQoJCgk8c3R5bGUgdHlwZT0idGV4dC9jc3MiPgoJCUBwYWdlIHsgbWFyZ2luOiAwLjc5aW4gfQoJCXAgeyBtYXJnaW4tYm90dG9tOiAwLjFpbjsgZGlyZWN0aW9uOiBsdHI7IGxpbmUtaGVpZ2h0OiAxMjAlOyB0ZXh0LWFsaWduOiBsZWZ0OyBvcnBoYW5zOiAyOyB3aWRvd3M6IDIgfQoJCXAuY3RsIHsgZm9udC1zaXplOiAxNHB0OyBzby1sYW5ndWFnZTogYm4tQkQgfQoJPC9zdHlsZT4KCgoKCgoKCgoKCgoKCgoKCgoKCjwvcD48cCBjbGFzcz0id2VzdGVybiIgc3R5bGU9Im1hcmdpbi1ib3R0b206IDAuMTRpbjsgbGluZS1oZWlnaHQ6IDExNSUiPiZuYnNwO2QuClByb2YuICBNZC4mbmJzcDtIdW1heXVuJm5ic3A7S2FiaXImbmJzcDtUYWx1a2RlcjwvcD48L2xpPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgPC91bD4KCiAgICAgICAgICAgICAgICAgICAgICAgIDwvZGl2PjwhLS0gQmxvZyBEZXRhaWwgV3JhcHBlciAtLT4KICAgICAgICAgICAgICAgICAgICA8L2Rpdj48IS0tIEJsb2cgV3JhcHBlciAtLT4KCgogICAgICAgICAgICAgICAgPC9kaXY+', '2017-12-13 12:47:28', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sif_admission`
--

CREATE TABLE `sif_admission` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sif_admission`
--

INSERT INTO `sif_admission` (`id`, `master_id`, `reg_no`, `reg_type`, `user_name`, `password`, `assigned_teacher_id`, `institute`, `year`, `course_code`, `module`, `batch_code`, `subject`, `service_pack_id`, `admi_type`, `session`, `medical_col`, `collage_type`, `doc_name`, `blood_gro`, `gender`, `marital_status`, `father_name`, `mother_name`, `religion`, `nationality`, `n_id`, `passport`, `job_des`, `mail_address`, `phone`, `email`, `dob`, `fb_id`, `skype`, `viber`, `bmdc_no`, `ins_roll_no`, `spouse_name`, `spouse_mobile`, `answer_type`, `rcp_reg_no`, `per_divi`, `per_dist`, `per_thana`, `per_address`, `mai_divi`, `mai_dist`, `mai_thana`, `mai_address`, `fee_amount`, `discount_amont`, `dis_auth_by`, `final_amount`, `photo`, `sign`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`, `pay_status`, `pt_call`, `pw_payment`, `pw_communitcation`, `present_work_place`, `job_description`, `doc_mbbs`, `doc_pg`, `doc_phi`, `doc_nid`) VALUES
(1, 1, 181001, 'CMED', 'tixozel1@hotmail.com', 'XZXPUI', NULL, NULL, '2018', 1, NULL, NULL, 0, NULL, NULL, 1, NULL, NULL, 'Rhiannon Rosario', 'O-', 'Male', 'Married', 'Mary Irwin', 'Cameran Wilder', 'Others', 'Esse accusamus facilis cupidatat non', 'Porro magni cupid', 'Ipsum eos distinctio Et eum eius et est sit dolores laudantium ut qui nobis dolore veniam', NULL, NULL, '96412786487', 'tixozel1@hotmail.com', '2010-02-02', 'Eum facilis excepteur reprehenderit qui vero quo minus quibusdam reprehenderit ipsa', 'Aut consequatur Amet reiciendis nostrud', 'Consequat Occaecat sequi voluptatum debitis rerum consequatur Est voluptate nisi provident hic eum', '8721657', NULL, 'Nigel Fox', '12746782164', NULL, NULL, '02', '0212', '021202', 'Nihil cupidatat excepturi omnis dolorem', '07', '0549', '054918', 'Sequi ut ea voluptatem amet alias temporibus ab accusamus cum in id ullamco ipsam cupidatat dolores autem quos amet eos', NULL, NULL, NULL, NULL, 'upload/documents/181001/photo_181001.png', 'upload/documents/181001/sign_181001.jpg', '2017-12-12 09:30:37', NULL, NULL, NULL, 0, 0, '08:59', 'kasjbfkj', '0', 'Est ad corporis explicabo Nam officiis sed quis', 'Aut adipisicing alias autem quos quam vitae ipsa non autem maxime', 'upload/documents/181001/mbbs_181001.png', 'upload/documents/181001/pg_181001.png', NULL, 'upload/documents/181001/nid_181001.png'),
(2, 1, 181002, 'CMED', 'tixozel2@hotmail.com', 'EVVYHH', NULL, NULL, '2018', 1, NULL, NULL, 0, NULL, NULL, 1, NULL, NULL, 'Rhiannon Rosario', 'O-', 'Male', 'Married', 'Mary Irwin', 'Cameran Wilder', 'Others', 'Esse accusamus facilis cupidatat non', 'Porro magni cupid', 'Ipsum eos distinctio Et eum eius et est sit dolores laudantium ut qui nobis dolore veniam', NULL, NULL, '96412786487', 'tixozel2@hotmail.com', '2010-02-02', 'Eum facilis excepteur reprehenderit qui vero quo minus quibusdam reprehenderit ipsa', 'Aut consequatur Amet reiciendis nostrud', 'Consequat Occaecat sequi voluptatum debitis rerum consequatur Est voluptate nisi provident hic eum', '8721657', NULL, 'Nigel Fox', '12746782164', NULL, NULL, '02', '0212', '021202', 'Nihil cupidatat excepturi omnis dolorem', '07', '0549', '054918', 'Sequi ut ea voluptatem amet alias temporibus ab accusamus cum in id ullamco ipsam cupidatat dolores autem quos amet eos', NULL, NULL, NULL, NULL, 'upload/documents/181002/photo_181002.png', 'upload/documents/181002/sign_181002.jpg', '2017-12-12 09:30:37', NULL, NULL, NULL, 0, 0, '08:59', 'kasjbfkj', '0', 'Est ad corporis explicabo Nam officiis sed quis', 'Aut adipisicing alias autem quos quam vitae ipsa non autem maxime', 'upload/documents/181002/mbbs_181002.png', 'upload/documents/181002/pg_181002.png', NULL, 'upload/documents/181002/nid_181002.png'),
(3, 1, 181003, 'CMED', 'tixozel2@hotmail.com', '8WCF2W', NULL, NULL, '2018', 1, NULL, NULL, 0, NULL, NULL, 1, NULL, NULL, 'Rhiannon Rosario', 'O-', 'Male', 'Married', 'Mary Irwin', 'Cameran Wilder', 'Others', 'Esse accusamus facilis cupidatat non', 'Porro magni cupid', 'Ipsum eos distinctio Et eum eius et est sit dolores laudantium ut qui nobis dolore veniam', NULL, NULL, '96412786487', 'tixozel2@hotmail.com', '2010-02-02', 'Eum facilis excepteur reprehenderit qui vero quo minus quibusdam reprehenderit ipsa', 'Aut consequatur Amet reiciendis nostrud', 'Consequat Occaecat sequi voluptatum debitis rerum consequatur Est voluptate nisi provident hic eum', '8721657', NULL, 'Nigel Fox', '12746782164', NULL, NULL, '02', '0212', '021202', 'Nihil cupidatat excepturi omnis dolorem', '07', '0549', '054918', 'Sequi ut ea voluptatem amet alias temporibus ab accusamus cum in id ullamco ipsam cupidatat dolores autem quos amet eos', NULL, NULL, NULL, NULL, 'upload/documents/181003/photo_181003.png', 'upload/documents/181003/sign_181003.jpg', '2017-12-12 09:30:37', NULL, NULL, NULL, 0, 0, '08:59', 'kasjbfkj', '0', 'Est ad corporis explicabo Nam officiis sed quis', 'Aut adipisicing alias autem quos quam vitae ipsa non autem maxime', 'upload/documents/181003/mbbs_181003.png', 'upload/documents/181003/pg_181003.png', NULL, 'upload/documents/181003/nid_181003.png'),
(4, 1, 181004, 'CMED', 'tixozel2@hotmail.com', 'LICSSR', NULL, NULL, '2018', 1, NULL, NULL, 0, NULL, NULL, 1, NULL, NULL, 'Rhiannon Rosario', 'O-', 'Male', 'Married', 'Mary Irwin', 'Cameran Wilder', 'Others', 'Esse accusamus facilis cupidatat non', 'Porro magni cupid', 'Ipsum eos distinctio Et eum eius et est sit dolores laudantium ut qui nobis dolore veniam', NULL, NULL, '96412786487', 'tixozel2@hotmail.com', '2010-02-02', 'Eum facilis excepteur reprehenderit qui vero quo minus quibusdam reprehenderit ipsa', 'Aut consequatur Amet reiciendis nostrud', 'Consequat Occaecat sequi voluptatum debitis rerum consequatur Est voluptate nisi provident hic eum', '8721657', NULL, 'Nigel Fox', '12746782164', NULL, NULL, '02', '0212', '021202', 'Nihil cupidatat excepturi omnis dolorem', '07', '0549', '054918', 'Sequi ut ea voluptatem amet alias temporibus ab accusamus cum in id ullamco ipsam cupidatat dolores autem quos amet eos', NULL, NULL, NULL, NULL, 'upload/documents/181004/photo_181004.png', 'upload/documents/181004/sign_181004.jpg', '2017-12-12 09:30:37', NULL, NULL, NULL, 0, 0, '08:59', 'kasjbfkj', '0', 'Est ad corporis explicabo Nam officiis sed quis', 'Aut adipisicing alias autem quos quam vitae ipsa non autem maxime', 'upload/documents/181004/mbbs_181004.png', 'upload/documents/181004/pg_181004.png', NULL, 'upload/documents/181004/nid_181004.png'),
(5, 1, 181005, 'CMED', 'tixozel2@hotmail.com', 'LELHAJ', NULL, NULL, '2018', 1, NULL, NULL, 0, NULL, NULL, 1, NULL, NULL, 'Rhiannon Rosario', 'O-', 'Male', 'Married', 'Mary Irwin', 'Cameran Wilder', 'Others', 'Esse accusamus facilis cupidatat non', 'Porro magni cupid', 'Ipsum eos distinctio Et eum eius et est sit dolores laudantium ut qui nobis dolore veniam', NULL, NULL, '96412786487', 'tixozel2@hotmail.com', '2010-02-02', 'Eum facilis excepteur reprehenderit qui vero quo minus quibusdam reprehenderit ipsa', 'Aut consequatur Amet reiciendis nostrud', 'Consequat Occaecat sequi voluptatum debitis rerum consequatur Est voluptate nisi provident hic eum', '8721657', NULL, 'Nigel Fox', '12746782164', NULL, NULL, '02', '0212', '021202', 'Nihil cupidatat excepturi omnis dolorem', '07', '0549', '054918', 'Sequi ut ea voluptatem amet alias temporibus ab accusamus cum in id ullamco ipsam cupidatat dolores autem quos amet eos', NULL, NULL, NULL, NULL, 'upload/documents/181005/photo_181005.png', 'upload/documents/181005/sign_181005.jpg', '2017-12-12 09:30:37', NULL, NULL, NULL, 0, 0, '08:59', 'kasjbfkj', '0', 'Est ad corporis explicabo Nam officiis sed quis', 'Aut adipisicing alias autem quos quam vitae ipsa non autem maxime', 'upload/documents/181005/mbbs_181005.png', 'upload/documents/181005/pg_181005.png', NULL, 'upload/documents/181005/nid_181005.png'),
(6, 1, 181006, 'CMED', 'tixozel2@hotmail.com', 'JPFQDI', NULL, NULL, '2018', 1, NULL, NULL, 0, NULL, NULL, 1, NULL, NULL, 'Rhiannon Rosario', 'O-', 'Male', 'Married', 'Mary Irwin', 'Cameran Wilder', 'Others', 'Esse accusamus facilis cupidatat non', 'Porro magni cupid', 'Ipsum eos distinctio Et eum eius et est sit dolores laudantium ut qui nobis dolore veniam', NULL, NULL, '96412786487', 'tixozel2@hotmail.com', '2010-02-02', 'Eum facilis excepteur reprehenderit qui vero quo minus quibusdam reprehenderit ipsa', 'Aut consequatur Amet reiciendis nostrud', 'Consequat Occaecat sequi voluptatum debitis rerum consequatur Est voluptate nisi provident hic eum', '8721657', NULL, 'Nigel Fox', '12746782164', NULL, NULL, '02', '0212', '021202', 'Nihil cupidatat excepturi omnis dolorem', '07', '0549', '054918', 'Sequi ut ea voluptatem amet alias temporibus ab accusamus cum in id ullamco ipsam cupidatat dolores autem quos amet eos', NULL, NULL, NULL, NULL, 'upload/documents/181006/photo_181006.png', 'upload/documents/181006/sign_181006.jpg', '2017-12-12 09:30:37', NULL, NULL, NULL, 0, 0, '08:59', 'kasjbfkj', '0', 'Est ad corporis explicabo Nam officiis sed quis', 'Aut adipisicing alias autem quos quam vitae ipsa non autem maxime', 'upload/documents/181006/mbbs_181006.png', 'upload/documents/181006/pg_181006.png', NULL, 'upload/documents/181006/nid_181006.png'),
(7, 1, 181007, 'CMED', 'tixozel3@hotmail.com', 'YUSFXG', NULL, NULL, '2018', 1, NULL, NULL, 0, NULL, NULL, 1, NULL, NULL, 'Rhiannon Rosario', 'O-', 'Male', 'Married', 'Mary Irwin', 'Cameran Wilder', 'Others', 'Esse accusamus facilis cupidatat non', 'Porro magni cupid', 'Ipsum eos distinctio Et eum eius et est sit dolores laudantium ut qui nobis dolore veniam', NULL, NULL, '96412786487', 'tixozel3@hotmail.com', '2010-02-02', 'Eum facilis excepteur reprehenderit qui vero quo minus quibusdam reprehenderit ipsa', 'Aut consequatur Amet reiciendis nostrud', 'Consequat Occaecat sequi voluptatum debitis rerum consequatur Est voluptate nisi provident hic eum', '8721657', NULL, 'Nigel Fox', '12746782164', NULL, NULL, '02', '0212', '021202', 'Nihil cupidatat excepturi omnis dolorem', '07', '0549', '054918', 'Sequi ut ea voluptatem amet alias temporibus ab accusamus cum in id ullamco ipsam cupidatat dolores autem quos amet eos', NULL, NULL, NULL, NULL, 'upload/documents/181007/photo_181007.jpg', 'upload/documents/181007/sign_181007.jpg', '2017-12-12 09:30:37', NULL, NULL, NULL, 0, 0, '08:59', 'kasjbfkj', '0', 'Est ad corporis explicabo Nam officiis sed quis', 'Aut adipisicing alias autem quos quam vitae ipsa non autem maxime', 'upload/documents/181007/mbbs_181007.png', 'upload/documents/181007/pg_181007.png', NULL, 'upload/documents/181007/nid_181007.png'),
(8, 2, 187001, 'CMED', 'coto@yahoo.com', 'JQZNIB', NULL, NULL, '2018', 1, NULL, NULL, 0, NULL, NULL, 7, NULL, NULL, 'Alan Craft', 'A+', 'Male', 'Married', 'Kirk Moses', 'Lesley Ortiz', 'Muslim', 'Nesciunt consequatur', '61287461276487126', '', NULL, NULL, '87451278457', 'coto@yahoo.com', '2017-12-12', '', '', '', 'BDD1111901', NULL, 'Leonard Thomas', '76429164812', NULL, NULL, '07', '', '', 'Sunt dicta occaecat ad ducimus ipsam odit laborum Necessitatibus minus qui ducimus quas voluptatum pariatur Labore necessitatibus sunt harum Nam', '07', '', '', 'Aut deleniti eos occaecat natus autem eligendi aut consequatur dignissimos vel blanditiis ex', NULL, NULL, NULL, NULL, 'upload/documents/187001/photo_187001.png', 'upload/documents/187001/sign_187001.jpg', '2017-12-12 09:30:37', NULL, NULL, NULL, 0, 0, '21:48', 'Mollitia veritatis ', '0', 'Et aspernatur error ut suscipit cumque doloribus mollitia', 'Dolor ut maxime consequuntur illum debitis obcaecati eius error sint eiusmod laudantium reprehenderit beatae fugiat', 'upload/documents/187001/mbbs_187001.png', 'upload/documents/187001/pg_187001.png', NULL, 'upload/documents/187001/nid_187001.png'),
(9, 2, 187002, 'CMED', 'coto2@yahoo.com', 'ZEJPL3', NULL, NULL, '2018', 1, NULL, NULL, 0, NULL, NULL, 7, NULL, NULL, 'Alan Craft', 'A+', 'Male', 'Married', 'Kirk Moses', 'Lesley Ortiz', 'Muslim', 'Nesciunt consequatur', '61287461276487126', '', NULL, NULL, '87451278457', 'coto2@yahoo.com', '2017-12-12', '', '', '', 'BDD1111901', NULL, 'Leonard Thomas', '76429164812', NULL, NULL, '07', '', '', 'Sunt dicta occaecat ad ducimus ipsam odit laborum Necessitatibus minus qui ducimus quas voluptatum pariatur Labore necessitatibus sunt harum Nam', '07', '', '', 'Aut deleniti eos occaecat natus autem eligendi aut consequatur dignissimos vel blanditiis ex', NULL, NULL, NULL, NULL, 'upload/documents/187002/photo_187002.png', 'upload/documents/187002/sign_187002.jpg', '2017-12-12 09:30:37', NULL, NULL, NULL, 0, 0, '21:48', 'Mollitia veritatis ', '0', 'Et aspernatur error ut suscipit cumque doloribus mollitia', 'Dolor ut maxime consequuntur illum debitis obcaecati eius error sint eiusmod laudantium reprehenderit beatae fugiat', 'upload/documents/187002/mbbs_187002.png', 'upload/documents/187002/pg_187002.png', NULL, 'upload/documents/187002/nid_187002.png'),
(10, 2, 187003, 'CMED', 'coto2@yahoo.com', 'KFMGFU', NULL, NULL, '2018', 1, NULL, NULL, 0, NULL, NULL, 7, NULL, NULL, 'Alan Craft', 'A+', 'Male', 'Married', 'Kirk Moses', 'Lesley Ortiz', 'Muslim', 'Nesciunt consequatur', '61287461276487126', '', NULL, NULL, '87451278457', 'coto2@yahoo.com', '2017-12-12', '', '', '', 'BDD1111901', NULL, 'Leonard Thomas', '76429164812', NULL, NULL, '07', '', '', 'Sunt dicta occaecat ad ducimus ipsam odit laborum Necessitatibus minus qui ducimus quas voluptatum pariatur Labore necessitatibus sunt harum Nam', '07', '', '', 'Aut deleniti eos occaecat natus autem eligendi aut consequatur dignissimos vel blanditiis ex', NULL, NULL, NULL, NULL, 'upload/documents/187003/photo_187003.png', 'upload/documents/187003/sign_187003.jpg', '2017-12-12 09:30:37', NULL, NULL, NULL, 0, 0, '21:48', 'Mollitia veritatis ', '0', 'Et aspernatur error ut suscipit cumque doloribus mollitia', 'Dolor ut maxime consequuntur illum debitis obcaecati eius error sint eiusmod laudantium reprehenderit beatae fugiat', 'upload/documents/187003/mbbs_187003.png', 'upload/documents/187003/pg_187003.png', NULL, 'upload/documents/187003/nid_187003.png'),
(11, 3, 177001, 'CMED', 'bogesuwy@yahoo.com', 'DKDSIA', NULL, NULL, '2017', 1, NULL, NULL, 0, NULL, NULL, 7, NULL, NULL, 'Myles Harvey', 'AB+', 'Male', 'Single', 'Carolyn Casey', 'Velma Forbes', 'Hindus', '', 'Facere tempore i', '', NULL, NULL, '84987329875', 'bogesuwy@yahoo.com', '2017-12-12', '', '', '', 'Eum ut porro nihil rem', NULL, 'Jared Pollard', '12094721471', NULL, NULL, '05', '', '', 'Et recusandae Voluptatem quae sequi eos', '02', '', '', 'Ut eaque tempora officia excepturi vitae irure minus qui', NULL, NULL, NULL, NULL, 'upload/documents/177001/photo_177001.jpg', 'upload/documents/177001/sign_177001.jpg', '2017-12-12 09:30:37', NULL, NULL, NULL, 0, 0, '17:06', 'Dolor ab dolore qui assumenda voluptate non et nesciunt nulla', '0', 'Consequat Earum est nihil eum neque in quo', 'Tempore quo aperiam adipisicing veniam sed quidem laborum cumque ex officia consectetur excepturi aliquam ut libero necessitatibus non enim non', 'upload/documents/177001/mbbs_177001.png', 'upload/documents/177001/pg_177001.png', NULL, 'upload/documents/177001/nid_177001.png'),
(12, 4, 181008, 'CMED', 'fogykuwyby@hotmail.com', 'THRYJS', NULL, NULL, '2018', 1, NULL, NULL, 0, NULL, NULL, 1, NULL, NULL, 'McKenzie Carson', 'AB+', 'Male', 'Married', 'Germane Sampson', 'Lacey Andrews', 'Christian', '', '19286429186498126', 'Vitae eos est quia in dolores', NULL, NULL, '93842189471', 'fogykuwyby@hotmail.com', '2017-12-12', '', '', '', 'kbfaskj2222', NULL, 'dslkfnaskln', '04712347128', NULL, NULL, '05', '', '', 'Dignissimos aute culpa sequi omnis tempora aliquip exercitationem consequatur ut accusamus inventore vel corrupti suscipit quod elit non earum consequat', '04', '', '', 'Necessitatibus tenetur voluptatem In recusandae Consequatur id ipsum omnis nihil velit est elit voluptate excepteur mollitia nobis', NULL, NULL, NULL, NULL, 'upload/documents/181008/photo_181008.jpg', 'upload/documents/181008/sign_181008.jpg', '2017-12-12 10:26:09', NULL, '2017-12-12 00:00:00', 'admin@bigm-bd.com', 1, 0, '21:40', '', '0', '', '', 'upload/documents/181008/mbbs_181008.png', 'upload/documents/181008/pg_181008.png', NULL, 'upload/documents/181008/nid_181008.png'),
(13, 4, 181009, 'CMED', 'fogykuwyby1@hotmail.com', 'O1KL3N', NULL, NULL, '2018', 1, NULL, NULL, 0, NULL, NULL, 1, NULL, NULL, 'McKenzie Carson', 'AB+', 'Male', 'Married', 'Germane Sampson', 'Lacey Andrews', 'Christian', '', '19286429186498126', 'Vitae eos est quia in dolores', NULL, NULL, '93842189471', 'fogykuwyby1@hotmail.com', '2017-12-12', '', '', '', 'kbfaskj2222', NULL, 'dslkfnaskln', '04712347128', NULL, NULL, '05', '', '', 'Dignissimos aute culpa sequi omnis tempora aliquip exercitationem consequatur ut accusamus inventore vel corrupti suscipit quod elit non earum consequat', '04', '', '', 'Necessitatibus tenetur voluptatem In recusandae Consequatur id ipsum omnis nihil velit est elit voluptate excepteur mollitia nobis', NULL, NULL, NULL, NULL, 'upload/documents/181009/photo_181009.jpg', 'upload/documents/181009/sign_181009.jpg', '2017-12-12 09:30:37', NULL, NULL, NULL, 0, 0, '21:40', '', '0', '', '', 'upload/documents/181009/mbbs_181009.png', 'upload/documents/181009/pg_181009.png', NULL, 'upload/documents/181009/nid_181009.png'),
(18, 9, 181010, 'CMED', 'radix@yahoo.com', 'WEG6VL', NULL, NULL, '2018', 1, NULL, NULL, 0, NULL, NULL, 1, NULL, NULL, 'Kane Sullivan', 'A+', 'Female', 'Single', 'Karly Solis', 'Xyla Hoffman', 'Others', 'Obcaecati incidunt dolorem sint molestiae eius et incidunt laudantium et illum dolorem officia rem qui blanditiis cillum cumque quae', 'Necessitatibus es', 'Mollit in nulla vel aut aute temporibus ratione', NULL, NULL, '21846217461', 'radix@yahoo.com', '2017-09-25', 'Ea esse amet in eum exercitationem ad laudantium vel aspernatur aperiam unde omnis doloribus voluptatem Aut aliquam nisi quo nulla', 'Ea odio ducimus excepteur aut sint dolorum id nihil dicta consequat Id amet et veritatis voluptate vitae in incidunt nobis', 'Placeat veritatis do ducimus in aute aut', 'kasjfbaskjb222', NULL, 'Roary Walls', '28174721468', NULL, NULL, '07', '', '', 'Animi expedita voluptatem velit quaerat accusamus facilis magnam', '02', '', '', 'Culpa eos eaque possimus qui', NULL, NULL, NULL, NULL, 'upload/documents/181010/photo_181010.png', 'upload/documents/181010/sign_181010.jpg', '2017-12-12 12:51:04', NULL, NULL, NULL, 0, 0, '01:19', 'Omnis quia nihil perspiciatis suscipit sunt doloribus cillum ut accusantium iure delectus iste aut irure', '0', 'Labore quis fugit esse laborum Quia labore aute irure tempora blanditiis repudiandae nemo non dolores id voluptas quis', 'Earum consequatur Deserunt fugiat ipsum quam ullamco ullam', 'upload/documents/181010/mbbs_181010.png', 'upload/documents/181010/pg_181010.png', NULL, 'upload/documents/181010/nid_181010.png');

-- --------------------------------------------------------

--
-- Table structure for table `sif_admission_transition`
--

CREATE TABLE `sif_admission_transition` (
  `id` int(10) NOT NULL,
  `master_id` int(11) NOT NULL,
  `reg_no` int(11) NOT NULL,
  `reg_type` varchar(30) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `password` varchar(9) NOT NULL,
  `assigned_teacher_id` varchar(50) DEFAULT NULL,
  `institute` int(1) NOT NULL,
  `year` varchar(30) NOT NULL,
  `course_code` int(3) NOT NULL,
  `faculty_code` int(5) NOT NULL,
  `batch_code` int(4) NOT NULL,
  `subject` int(2) NOT NULL,
  `service_pack_id` varchar(30) NOT NULL,
  `admi_type` varchar(2) NOT NULL,
  `session` int(2) NOT NULL,
  `medical_col` varchar(80) NOT NULL,
  `collage_type` varchar(10) NOT NULL,
  `doc_name` varchar(50) NOT NULL,
  `blood_gro` varchar(10) NOT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `marital_status` varchar(255) DEFAULT NULL,
  `father_name` varchar(50) NOT NULL,
  `mother_name` varchar(50) NOT NULL,
  `religion` varchar(255) DEFAULT NULL,
  `nationality` varchar(255) DEFAULT NULL,
  `n_id` varchar(40) NOT NULL,
  `passport` varchar(90) NOT NULL,
  `job_des` varchar(180) NOT NULL,
  `mail_address` varchar(140) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `email` varchar(40) NOT NULL,
  `dob` date DEFAULT NULL,
  `fb_id` varchar(255) NOT NULL,
  `skype` varchar(255) DEFAULT NULL,
  `viber` varchar(255) DEFAULT NULL,
  `bmdc_no` varchar(55) NOT NULL,
  `ins_roll_no` varchar(30) NOT NULL,
  `spouse_name` varchar(50) NOT NULL,
  `spouse_mobile` varchar(15) NOT NULL,
  `answer_type` int(2) NOT NULL,
  `rcp_reg_no` varchar(80) NOT NULL,
  `per_divi` varchar(20) NOT NULL,
  `per_dist` varchar(20) NOT NULL,
  `per_thana` varchar(20) NOT NULL,
  `per_address` varchar(120) NOT NULL,
  `mai_divi` varchar(20) NOT NULL,
  `mai_dist` varchar(20) NOT NULL,
  `mai_thana` varchar(20) NOT NULL,
  `mai_address` varchar(120) NOT NULL,
  `fee_amount` varchar(20) NOT NULL,
  `discount_amont` varchar(20) NOT NULL,
  `dis_auth_by` varchar(45) NOT NULL,
  `final_amount` varchar(20) NOT NULL,
  `photo` varchar(40) NOT NULL,
  `sign` varchar(35) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(50) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` varchar(50) NOT NULL,
  `status` int(2) NOT NULL,
  `pay_status` int(1) NOT NULL,
  `pt_call` varchar(255) DEFAULT NULL,
  `pw_payment` varchar(255) DEFAULT NULL,
  `pw_communitcation` varchar(255) DEFAULT NULL,
  `present_work_place` varchar(255) DEFAULT NULL,
  `job_description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sif_batch`
--

CREATE TABLE `sif_batch` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `sif_class_topic` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `sif_course` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sif_course`
--

INSERT INTO `sif_course` (`id`, `course_name`, `course_code`, `duration`, `fee`, `per_year_session`, `pys_st_limit`, `sess_one_start`, `sess_two_start`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`) VALUES
(1, 'Certificate in Medical Education (CMEd)', 1, '6 Months', '25000.00', 2, 20, 'January', 'July', '2017-09-28 08:11:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sif_doc_master`
--

CREATE TABLE `sif_doc_master` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sif_doc_master`
--

INSERT INTO `sif_doc_master` (`id`, `registrtion_no`, `user_name`, `password`, `assigned_teacher_id`, `bmdc_no`, `doc_name`, `father_name`, `mother_name`, `phone`, `email`, `photo`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`) VALUES
(1, '181001', 'tixozel1@hotmail.com', 'XZXPUI', NULL, '8721657', 'Rhiannon Rosario', 'Mary Irwin', 'Cameran Wilder', '96412786487', 'tixozel1@hotmail.com', 'upload/documents/181001/photo_181001.png', '2017-12-12 08:31:47', NULL, NULL, NULL, 0),
(2, '187001', 'coto@yahoo.com', 'JQZNIB', NULL, 'BDD1111901', 'Alan Craft', 'Kirk Moses', 'Lesley Ortiz', '87451278457', 'coto@yahoo.com', 'upload/documents/187001/photo_187001.png', '2017-12-12 09:14:39', NULL, NULL, NULL, 0),
(3, '177001', 'bogesuwy@yahoo.com', 'DKDSIA', NULL, 'Eum ut porro nihil rem', 'Myles Harvey', 'Carolyn Casey', 'Velma Forbes', '84987329875', 'bogesuwy@yahoo.com', 'upload/documents/177001/photo_177001.jpg', '2017-12-12 09:18:44', NULL, NULL, NULL, 0),
(4, '181008', 'fogykuwyby@hotmail.com', 'THRYJS', NULL, 'kbfaskj2222', 'McKenzie Carson', 'Germane Sampson', 'Lacey Andrews', '93842189471', 'fogykuwyby@hotmail.com', 'upload/documents/181008/photo_181008.jpg', '2017-12-12 10:26:10', NULL, '2017-12-12 00:00:00', 'admin@bigm-bd.com', 1),
(9, '181010', 'radix@yahoo.com', 'WEG6VL', NULL, 'kasjfbaskjb222', 'Kane Sullivan', 'Karly Solis', 'Xyla Hoffman', '21846217461', 'radix@yahoo.com', 'upload/documents/181010/photo_181010.png', '2017-12-12 12:51:04', NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sif_doc_payment`
--

CREATE TABLE `sif_doc_payment` (
  `id` int(11) NOT NULL,
  `doc_id` int(11) NOT NULL COMMENT 'admission table id',
  `doc_reg_no` varchar(10) NOT NULL,
  `date` datetime NOT NULL,
  `amount` float NOT NULL,
  `auth_by` varchar(50) DEFAULT NULL,
  `mr_no` varchar(70) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `vat_tax` varchar(2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(100) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sif_edu_qualification`
--

CREATE TABLE `sif_edu_qualification` (
  `id` int(11) NOT NULL,
  `admiss_id` int(11) DEFAULT NULL COMMENT 'sif_admission table id',
  `exam_name` varchar(50) DEFAULT NULL,
  `pass_year` int(4) DEFAULT NULL,
  `exam_group` int(2) DEFAULT NULL,
  `exam_board` int(2) DEFAULT NULL,
  `exam_ins` varchar(255) DEFAULT NULL,
  `exam_result` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sif_edu_qualification`
--

INSERT INTO `sif_edu_qualification` (`id`, `admiss_id`, `exam_name`, `pass_year`, `exam_group`, `exam_board`, `exam_ins`, `exam_result`) VALUES
(1, 4, 'S.S.C', 1964, 3, 2, 'Et maxime officia commodi amet laudantium similique necessitatibus iure nulla ut eveniet fugiat labore tenetur et non mollitia', '4'),
(2, 4, 'H.S.C', 2000, 3, 5, 'Adipisicing sapiente est omnis quod qui aut cum nobis sed id dolor rerum dolore est qui consequatur', '4'),
(3, 5, 'S.S.C', 1964, 3, 2, 'Et maxime officia commodi amet laudantium similique necessitatibus iure nulla ut eveniet fugiat labore tenetur et non mollitia', '4'),
(4, 5, 'H.S.C', 2000, 3, 5, 'Adipisicing sapiente est omnis quod qui aut cum nobis sed id dolor rerum dolore est qui consequatur', '4'),
(5, 5, 'MBBS', 1970, 0, 0, '58', '3'),
(6, 5, 'FCPS', 2017, 0, 0, 'Non ab omnis culpa deserunt magna id qui minus quos qui', '3'),
(7, 6, 'S.S.C', 1964, 3, 2, 'Et maxime officia commodi amet laudantium similique necessitatibus iure nulla ut eveniet fugiat labore tenetur et non mollitia', '4'),
(8, 6, 'H.S.C', 2000, 3, 5, 'Adipisicing sapiente est omnis quod qui aut cum nobis sed id dolor rerum dolore est qui consequatur', '4'),
(9, 6, 'MBBS', 1970, 0, 0, '58', '3'),
(10, 6, 'FCPS', 2017, 0, 0, 'Non ab omnis culpa deserunt magna id qui minus quos qui', '3'),
(11, 7, 'S.S.C', 1964, 3, 2, 'Et maxime officia commodi amet laudantium similique necessitatibus iure nulla ut eveniet fugiat labore tenetur et non mollitia', '4'),
(12, 7, 'H.S.C', 2000, 3, 5, 'Adipisicing sapiente est omnis quod qui aut cum nobis sed id dolor rerum dolore est qui consequatur', '4'),
(13, 7, 'MBBS', 1970, 0, 0, '58', '3'),
(14, 7, 'FCPS', 2017, 0, 0, 'Non ab omnis culpa deserunt magna id qui minus quos qui', '3'),
(15, 8, 'O Level', 1990, 1, 2, 'Minim aut fuga Distinctio Beatae voluptatem Sunt sit rerum', '4'),
(16, 9, 'O Level', 1990, 1, 2, 'Minim aut fuga Distinctio Beatae voluptatem Sunt sit rerum', '4'),
(17, 10, 'O Level', 1990, 1, 2, 'Minim aut fuga Distinctio Beatae voluptatem Sunt sit rerum', '4'),
(18, 10, 'H.S.C Equivalent', 2007, 4, 3, 'Magni cupiditate sed ut natus necessitatibus duis omnis odit quae odio odio', '4'),
(19, 10, 'MBBS', 1999, 0, 0, '70', '3'),
(20, 10, 'MS', 1967, 0, 0, 'Temporibus aut veritatis libero dolorem cupiditate dolor quas ipsum Nam nesciunt doloribus id', '3'),
(21, 11, 'O Level', 1979, 2, 9, 'Aliquam dolorem nostrum expedita maxime voluptas eveniet ipsa consequatur Impedit rerum nobis aliquip sint deleniti itaque natus odit dolores', '4'),
(22, 11, 'A Level', 1975, 4, 12, 'Quo nostrum quod maiores id fugiat', '4'),
(23, 11, 'MBBS', 1981, 0, 0, '54', '4'),
(24, 11, 'FRCS', 1957, 0, 0, 'Anim sequi facere incididunt porro rem', '4'),
(25, 12, 'S.S.C', 1955, 4, 11, 'In ut magna incidunt dolore sit incididunt maxime corporis tenetur et quo', '4'),
(26, 12, 'H.S.C Equivalent', 2011, 4, 8, 'Aut beatae rerum praesentium perferendis occaecat magni earum natus nihil inventore', '4'),
(27, 12, 'MBBS', 2013, 0, 0, '36', '3'),
(28, 12, 'FRCS', 1996, 0, 0, 'Dolorum esse eum reprehenderit accusantium quae fuga Totam mollitia dolorem et', '3'),
(29, 13, 'S.S.C', 1955, 4, 11, 'In ut magna incidunt dolore sit incididunt maxime corporis tenetur et quo', '4'),
(30, 13, 'H.S.C Equivalent', 2011, 4, 8, 'Aut beatae rerum praesentium perferendis occaecat magni earum natus nihil inventore', '4'),
(31, 13, 'MBBS', 2013, 0, 0, '36', '3'),
(32, 13, 'FRCS', 1996, 0, 0, 'Dolorum esse eum reprehenderit accusantium quae fuga Totam mollitia dolorem et', '3'),
(33, 18, 'S.S.C', 2000, 3, 3, 'Eu commodo dignissimos enim magna anim tenetur nisi iusto pariatur Atque deserunt do dolor odio in quisquam enim distinctio Voluptatem', '5'),
(34, 18, 'H.S.C Equivalent', 1995, 4, 2, 'Non occaecat qui asperiores cillum impedit tenetur dolores consequat Id fuga Exercitationem pariatur Pariatur Pariatur Nesciunt', '5'),
(35, 18, 'MBBS', 1992, 0, 0, '26', '3'),
(36, 18, 'MD', 1955, 0, 0, 'Nihil nihil fugiat doloribus velit eos amet vel delectus tempora', '3');

-- --------------------------------------------------------

--
-- Table structure for table `sif_exam`
--

CREATE TABLE `sif_exam` (
  `id` int(11) NOT NULL,
  `exam_name` varchar(50) NOT NULL,
  `exam_date` date DEFAULT NULL,
  `time_from` time DEFAULT NULL,
  `time_to` time DEFAULT NULL,
  `year` int(4) NOT NULL,
  `session` int(2) NOT NULL,
  `course_code` int(2) NOT NULL,
  `faculty_code` int(2) NOT NULL,
  `batch_code` int(2) NOT NULL,
  `topic_id` varchar(50) NOT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `subject_id` int(3) NOT NULL,
  `mock_no` int(1) DEFAULT NULL,
  `exam_type` varchar(8) NOT NULL,
  `paper` varchar(100) DEFAULT NULL,
  `ans_type` varchar(1) NOT NULL,
  `no_mcq_question` varchar(15) NOT NULL,
  `mcq_ques_val` float(6,2) NOT NULL,
  `no_sba_question` varchar(15) NOT NULL,
  `sba_question_val` float(6,2) NOT NULL,
  `negative_mark` float(10,2) NOT NULL,
  `full_mark` float(6,2) NOT NULL,
  `highest_mark` float(6,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(20) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` varchar(25) NOT NULL,
  `status` int(1) NOT NULL,
  `processed` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sif_exam`
--

INSERT INTO `sif_exam` (`id`, `exam_name`, `exam_date`, `time_from`, `time_to`, `year`, `session`, `course_code`, `faculty_code`, `batch_code`, `topic_id`, `teacher_id`, `subject_id`, `mock_no`, `exam_type`, `paper`, `ans_type`, `no_mcq_question`, `mcq_ques_val`, `no_sba_question`, `sba_question_val`, `negative_mark`, `full_mark`, `highest_mark`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`, `processed`) VALUES
(3, 'RNA', '2017-08-22', '09:00:00', '10:55:00', 2017, 1, 7, 6, 2, ',4,31', NULL, 46, 0, '6', '', 'E', '1-40', 1.00, '', 0.00, 0.25, 40.00, 38.50, '2017-08-22 16:53:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1, 1),
(4, 'RNA NURON', '2017-08-22', '22:00:00', '23:30:00', 2017, 1, 7, 7, 3, '32,35', NULL, 133, 0, '6', '', 'E', '1-40', 1.00, '', 0.00, 0.25, 40.00, 29.40, '2017-08-22 16:57:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sif_exam_fcps_part2`
--

CREATE TABLE `sif_exam_fcps_part2` (
  `id` int(11) NOT NULL,
  `exam_name` varchar(20) NOT NULL,
  `exam_date` date DEFAULT NULL,
  `time_from` time DEFAULT NULL,
  `time_to` time DEFAULT NULL,
  `institute` int(1) NOT NULL,
  `year` int(4) NOT NULL,
  `session` int(2) NOT NULL,
  `course_code` int(2) NOT NULL,
  `faculty_code` int(3) NOT NULL,
  `batch_code` int(3) NOT NULL,
  `subject_id` varchar(15) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `full_mark` varchar(15) NOT NULL,
  `service_pack_id` varchar(15) NOT NULL,
  `exam_type_id` varchar(15) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(25) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` varchar(25) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sif_exam_result`
--

CREATE TABLE `sif_exam_result` (
  `id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `doc_id` int(11) NOT NULL,
  `teacher_id` varchar(50) NOT NULL,
  `doc_reg_no` varchar(10) NOT NULL,
  `year` varchar(4) NOT NULL,
  `session` varchar(1) NOT NULL,
  `course_code` varchar(1) NOT NULL,
  `faculty_code` varchar(1) NOT NULL,
  `batch_code` varchar(1) NOT NULL,
  `topic_id` varchar(50) DEFAULT NULL,
  `subject_id` int(11) NOT NULL,
  `mock_no` int(1) DEFAULT NULL,
  `exam_type` int(11) NOT NULL,
  `paper` varchar(100) DEFAULT NULL,
  `ans_type` varchar(1) NOT NULL,
  `mcq_range` varchar(20) DEFAULT NULL,
  `mcq_mark` varchar(20) DEFAULT NULL,
  `sba_range` varchar(10) DEFAULT NULL,
  `sba_mark` int(1) DEFAULT NULL,
  `neg_mark` varchar(10) DEFAULT NULL,
  `full_mark` varchar(10) DEFAULT NULL,
  `correct_ans` text,
  `wrong_ans` text,
  `not_answered` text,
  `no_correct` int(10) DEFAULT NULL,
  `no_wrong` int(10) DEFAULT NULL,
  `correct_mark` float(6,2) DEFAULT NULL,
  `wrong_mark` float(6,2) DEFAULT NULL,
  `obtained_mark` float(6,2) DEFAULT NULL,
  `mark_percentage` float(6,2) DEFAULT NULL,
  `overall_pos` varchar(20) DEFAULT NULL,
  `subject_pos` int(4) DEFAULT NULL,
  `merit_pos` int(4) DEFAULT NULL,
  `candidate_type` varchar(20) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(50) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='sif_exam_result';

--
-- Dumping data for table `sif_exam_result`
--

INSERT INTO `sif_exam_result` (`id`, `exam_id`, `doc_id`, `teacher_id`, `doc_reg_no`, `year`, `session`, `course_code`, `faculty_code`, `batch_code`, `topic_id`, `subject_id`, `mock_no`, `exam_type`, `paper`, `ans_type`, `mcq_range`, `mcq_mark`, `sba_range`, `sba_mark`, `neg_mark`, `full_mark`, `correct_ans`, `wrong_ans`, `not_answered`, `no_correct`, `no_wrong`, `correct_mark`, `wrong_mark`, `obtained_mark`, `mark_percentage`, `overall_pos`, `subject_pos`, `merit_pos`, `candidate_type`, `subject`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`) VALUES
(121, 3, 423, '2', '17172010', '2017', '1', '7', '2', '2', ',4,31', 59, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', '{"1":"F","2":"F","3":"T","4":"F","5":"T","6":"F","7":"T","8":"T","9":"T","10":"F","11":"T","12":"T","13":"F","14":"F","15":"T","16":"T","17":"F","18":"F","19":"F","20":"F","21":"T","22":"T","23":"T","24":"F","25":"F","26":"T","27":"F","28":"F","29":"T","30":"T","31":"F","33":"F","34":"T","35":"T","36":"F","37":"T","38":"F","39":"T","40":"T","42":"T","43":"T","44":"F","45":"F","46":"T","47":"T","48":"T","49":"F","50":"F","51":"T","52":"T","53":"F","54":"F","55":"T","56":"F","57":"T","58":"T","59":"F","60":"T","61":"T","62":"F","63":"F","64":"F","65":"T","66":"T","67":"T","69":"T","70":"F","71":"F","72":"F","73":"T","74":"F","75":"T","76":"T","77":"T","78":"F","79":"T","80":"T","82":"F","83":"T","84":"F","85":"T","87":"T","88":"T","90":"T","91":"T","92":"F","94":"F","96":"T","97":"F","98":"F","99":"F","100":"T","101":"F","102":"T","103":"T","104":"F","105":"T","106":"T","109":"T","110":"F","111":"T","113":"F","114":"T","116":"T","118":"T","121":"T","122":"F","123":"F","124":"T","125":"T","127":"T","128":"T","129":"F","131":"T","132":"F","133":"T","134":"T","135":"F","136":"F","137":"T","138":"T","139":"T","140":"F","141":"T","142":"F","143":"F","144":"T","145":"F","146":"T","147":"F","148":"T","149":"F","150":"T","151":"F","152":"T","155":"T","156":"T","157":"T","158":"F","159":"F","160":"T","162":"F","166":"T","167":"T","168":"T","169":"F","170":"F","171":"T","172":"F","173":"F","174":"T","175":"F","177":"F","179":"T","181":"F","182":"T","183":"T","184":"F","185":"F","186":"F","187":"T","188":"F","189":"T","190":"F","192":"F","193":"T","194":"T","195":"F","197":"T","198":"T","199":"F","200":"F"}', '{"32":"T","41":"T","68":"F","81":"T","86":"T","89":"T","93":"T","95":"T","107":"F","108":"T","112":"F","115":"F","117":"T","119":"T","120":"T","126":"T","130":"T","153":"T","154":"F","161":"T","163":"F","164":"F","165":"T","176":"T","178":"F","180":"T","191":"T","196":"F"}', '[]', 172, 28, 34.40, 1.40, 33.00, 82.50, 'G-1', 2, 8, 'A', 'o', '2017-08-22 16:53:06', 'admin@bigm-bd.com', NULL, NULL, 1),
(122, 3, 424, '2', '17172156', '2017', '1', '7', '2', '2', ',4,31', 59, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin@bigm-bd.com', NULL, NULL, 1),
(123, 3, 433, '2', '17', '2017', '1', '7', '1', '2', ',4,31', 30, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin@bigm-bd.com', NULL, NULL, 1),
(124, 3, 435, '2', '17', '2017', '1', '7', '1', '2', ',4,31', 39, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin@bigm-bd.com', NULL, NULL, 1),
(125, 3, 436, '2', '17172003', '2017', '1', '7', '1', '2', ',4,31', 39, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', '{"1":"F","2":"F","3":"T","4":"F","5":"T","6":"F","7":"T","8":"T","9":"T","10":"F","11":"T","12":"T","14":"F","15":"T","16":"T","17":"F","18":"F","19":"F","20":"F","21":"T","22":"T","24":"F","25":"F","26":"T","27":"F","28":"F","29":"T","30":"T","31":"F","32":"F","33":"F","34":"T","35":"T","36":"F","37":"T","38":"F","39":"T","40":"T","41":"F","42":"T","43":"T","44":"F","45":"F","46":"T","47":"T","48":"T","49":"F","50":"F","51":"T","52":"T","53":"F","54":"F","55":"T","56":"F","57":"T","58":"T","59":"F","60":"T","61":"T","62":"F","63":"F","64":"F","65":"T","66":"T","67":"T","68":"T","69":"T","70":"F","71":"F","72":"F","73":"T","74":"F","75":"T","77":"T","78":"F","79":"T","80":"T","81":"F","82":"F","83":"T","84":"F","85":"T","86":"F","87":"T","88":"T","90":"T","92":"F","93":"F","94":"F","95":"F","96":"T","98":"F","101":"F","102":"T","104":"F","106":"T","107":"T","108":"F","110":"F","111":"T","113":"F","114":"T","115":"T","117":"F","119":"F","121":"T","122":"F","123":"F","124":"T","125":"T","126":"F","127":"T","128":"T","129":"F","131":"T","132":"F","133":"T","134":"T","135":"F","136":"F","137":"T","138":"T","140":"F","141":"T","144":"T","145":"F","146":"T","147":"F","148":"T","149":"F","151":"F","152":"T","154":"T","155":"T","156":"T","157":"T","158":"F","159":"F","160":"T","162":"F","166":"T","167":"T","168":"T","169":"F","170":"F","171":"T","172":"F","173":"F","174":"T","175":"F","176":"F","177":"F","178":"T","179":"T","180":"F","181":"F","182":"T","183":"T","184":"F","185":"F","187":"T","188":"F","189":"T","190":"F","191":"F","192":"F","193":"T","194":"T","195":"F","196":"T","199":"F"}', '{"13":"T","23":"F","76":"F","89":"T","91":"F","97":"T","99":"T","100":"F","103":"F","109":"F","112":"F","116":"F","118":"F","120":"T","130":"T","139":"F","142":"T","143":"T","150":"F","153":"T","161":"T","163":"F","164":"F","165":"T","186":"T","197":"F","198":"F","200":"T"}', '{"105":"."}', 171, 28, 34.20, 1.40, 32.80, 82.00, 'P-2', 3, 10, 'B', 'f', '2017-08-22 16:53:06', 'admin@bigm-bd.com', NULL, NULL, 1),
(126, 3, 437, '2', '17172004', '2017', '1', '7', '2', '2', ',4,31', 58, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', '{"1":"F","2":"F","3":"T","4":"F","5":"T","6":"F","7":"T","8":"T","9":"T","10":"F","11":"T","12":"T","13":"F","14":"F","15":"T","16":"T","17":"F","18":"F","19":"F","20":"F","21":"T","22":"T","23":"T","24":"F","25":"F","26":"T","27":"F","28":"F","29":"T","30":"T","31":"F","32":"F","33":"F","34":"T","35":"T","36":"F","37":"T","38":"F","39":"T","40":"T","41":"F","42":"T","43":"T","44":"F","45":"F","46":"T","47":"T","49":"F","50":"F","51":"T","52":"T","53":"F","54":"F","55":"T","56":"F","57":"T","58":"T","59":"F","60":"T","61":"T","62":"F","63":"F","64":"F","65":"T","66":"T","67":"T","68":"T","69":"T","70":"F","72":"F","73":"T","74":"F","75":"T","76":"T","77":"T","78":"F","79":"T","80":"T","81":"F","82":"F","83":"T","84":"F","85":"T","87":"T","88":"T","89":"F","91":"T","92":"F","93":"F","94":"F","95":"F","96":"T","97":"F","98":"F","99":"F","100":"T","101":"F","102":"T","103":"T","104":"F","105":"T","106":"T","107":"T","108":"F","109":"T","110":"F","111":"T","113":"F","115":"T","116":"T","120":"F","121":"T","122":"F","123":"F","124":"T","125":"T","126":"F","127":"T","128":"T","129":"F","130":"F","131":"T","132":"F","133":"T","134":"T","135":"F","136":"F","137":"T","139":"T","140":"F","144":"T","145":"F","146":"T","147":"F","148":"T","149":"F","150":"T","152":"T","156":"T","157":"T","158":"F","159":"F","160":"T","161":"F","163":"T","164":"T","165":"F","166":"T","167":"T","168":"T","169":"F","170":"F","171":"T","172":"F","173":"F","174":"T","175":"F","178":"T","179":"T","182":"T","183":"T","187":"T","188":"F","189":"T","190":"F","191":"F","192":"F","193":"T","194":"T","195":"F","197":"T","199":"F"}', '{"48":"F","71":"T","86":"T","90":"F","112":"F","114":"F","117":"T","118":"F","119":"T","138":"F","141":"F","142":"T","143":"T","151":"T","153":"T","154":"F","155":"F","162":"T","176":"T","177":"T","180":"T","181":"T","184":"T","185":"T","186":"T","196":"F","198":"F","200":"T"}', '[]', 172, 28, 34.40, 1.40, 33.00, 82.50, 'P-2', 2, 9, 'B', 'O', '2017-08-22 16:53:06', 'admin@bigm-bd.com', NULL, NULL, 1),
(127, 3, 438, '2', '17172005', '2017', '1', '7', '1', '2', ',4,31', 32, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', '{"1":"F","2":"F","3":"T","4":"F","5":"T","6":"F","7":"T","8":"T","9":"T","10":"F","11":"T","12":"T","13":"F","14":"F","15":"T","16":"T","17":"F","18":"F","19":"F","20":"F","21":"T","22":"T","23":"T","24":"F","25":"F","26":"T","27":"F","28":"F","29":"T","30":"T","31":"F","32":"F","33":"F","34":"T","35":"T","36":"F","37":"T","38":"F","39":"T","40":"T","41":"F","42":"T","44":"F","45":"F","46":"T","47":"T","49":"F","50":"F","51":"T","52":"T","53":"F","54":"F","55":"T","56":"F","57":"T","58":"T","59":"F","60":"T","61":"T","62":"F","63":"F","64":"F","65":"T","66":"T","67":"T","68":"T","69":"T","70":"F","71":"F","72":"F","73":"T","74":"F","75":"T","76":"T","77":"T","78":"F","79":"T","80":"T","81":"F","82":"F","83":"T","84":"F","85":"T","86":"F","88":"T","89":"F","91":"T","92":"F","93":"F","94":"F","95":"F","96":"T","97":"F","98":"F","99":"F","100":"T","101":"F","102":"T","103":"T","104":"F","105":"T","106":"T","107":"T","108":"F","109":"T","110":"F","111":"T","113":"F","114":"T","115":"T","116":"T","117":"F","118":"T","119":"F","120":"F","121":"T","122":"F","123":"F","124":"T","125":"T","126":"F","127":"T","128":"T","129":"F","130":"F","131":"T","132":"F","133":"T","134":"T","135":"F","136":"F","137":"T","138":"T","139":"T","140":"F","141":"T","142":"F","145":"F","146":"T","147":"F","148":"T","149":"F","150":"T","151":"F","152":"T","153":"F","154":"T","155":"T","156":"T","157":"T","158":"F","159":"F","160":"T","161":"F","162":"F","163":"T","164":"T","165":"F","166":"T","167":"T","168":"T","169":"F","170":"F","171":"T","172":"F","173":"F","174":"T","175":"F","176":"F","177":"F","178":"T","179":"T","180":"F","181":"F","182":"T","183":"T","184":"F","185":"F","186":"F","187":"T","188":"F","189":"T","190":"F","191":"F","192":"F","193":"T","194":"T","195":"F","196":"T","197":"T","199":"F","200":"F"}', '{"43":"F","48":"F","87":"F","90":"F","112":"F","143":"T","144":"F","198":"F"}', '[]', 192, 8, 38.40, 0.40, 38.00, 95.00, 'G-1', 1, 2, 'A', 'C', '2017-08-22 16:53:05', 'admin@bigm-bd.com', NULL, NULL, 1),
(128, 3, 439, '2', '17172006', '2017', '1', '7', '1', '2', ',4,31', 69, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', '{"1":"F","2":"F","3":"T","4":"F","5":"T","6":"F","7":"T","9":"T","10":"F","11":"T","13":"F","14":"F","15":"T","16":"T","17":"F","18":"F","19":"F","20":"F","21":"T","24":"F","25":"F","26":"T","27":"F","28":"F","29":"T","30":"T","31":"F","32":"F","33":"F","34":"T","35":"T","36":"F","37":"T","38":"F","39":"T","42":"T","46":"T","47":"T","48":"T","50":"F","51":"T","53":"F","54":"F","61":"T","62":"F","65":"T","66":"T","67":"T","69":"T","70":"F","71":"F","72":"F","73":"T","75":"T","76":"T","77":"T","79":"T","80":"T","81":"F","82":"F","83":"T","85":"T","87":"T","88":"T","90":"T","91":"T","92":"F","96":"T","97":"F","98":"F","99":"F","100":"T","101":"F","103":"T","104":"F","105":"T","106":"T","107":"T","110":"F","111":"T","113":"F","114":"T","115":"T","117":"F","119":"F","120":"F","121":"T","122":"F","123":"F","124":"T","125":"T","126":"F","127":"T","128":"T","129":"F","130":"F","131":"T","132":"F","133":"T","134":"T","135":"F","136":"F","137":"T","138":"T","141":"T","142":"F","143":"F","144":"T","145":"F","146":"T","150":"T","152":"T","154":"T","155":"T","156":"T","157":"T","158":"F","159":"F","160":"T","162":"F","163":"T","166":"T","167":"T","168":"T","169":"F","170":"F","171":"T","172":"F","173":"F","174":"T","175":"F","181":"F","182":"T","183":"T","184":"F","185":"F","187":"T","189":"T","190":"F","191":"F","192":"F","193":"T","194":"T","196":"T","198":"T","199":"F","200":"F"}', '{"8":"F","12":"F","22":"F","23":"F","40":"F","41":"T","43":"F","44":"T","45":"T","49":"T","52":"F","55":"F","56":"T","63":"T","64":"T","68":"F","74":"T","78":"T","84":"T","86":"T","89":"T","94":"T","95":"T","102":"F","108":"T","112":"F","116":"F","118":"F","139":"F","140":"T","147":"T","151":"T","153":"T","161":"T","164":"F","165":"T","177":"T","178":"F","180":"T","186":"T","188":"T","195":"T","197":"F"}', '{"57":".","58":".","59":".","60":".","93":".","109":".","148":".","149":".","176":".","179":"."}', 147, 43, 29.40, 2.15, 27.25, 68.12, 'P-2', 2, 26, 'B', 'T', '2017-08-22 16:53:07', 'admin@bigm-bd.com', NULL, NULL, 1),
(129, 3, 440, '2', '17172007', '2017', '1', '7', '1', '2', ',4,31', 28, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', '{"1":"F","2":"F","3":"T","4":"F","5":"T","6":"F","7":"T","8":"T","9":"T","10":"F","11":"T","12":"T","15":"T","16":"T","17":"F","18":"F","19":"F","20":"F","21":"T","24":"F","25":"F","26":"T","29":"T","30":"T","31":"F","32":"F","33":"F","34":"T","35":"T","36":"F","37":"T","38":"F","39":"T","42":"T","43":"T","48":"T","51":"T","52":"T","54":"F","57":"T","60":"T","61":"T","63":"F","64":"F","65":"T","66":"T","67":"T","68":"T","69":"T","71":"F","72":"F","74":"F","75":"T","76":"T","79":"T","80":"T","81":"F","83":"T","85":"T","88":"T","89":"F","90":"T","91":"T","92":"F","94":"F","95":"F","97":"F","98":"F","99":"F","100":"T","103":"T","104":"F","105":"T","106":"T","107":"T","109":"T","111":"T","113":"F","115":"T","116":"T","118":"T","121":"T","122":"F","124":"T","125":"T","127":"T","128":"T","131":"T","132":"F","133":"T","134":"T","135":"F","137":"T","138":"T","141":"T","142":"F","144":"T","146":"T","147":"F","148":"T","149":"F","150":"T","152":"T","153":"F","154":"T","155":"T","156":"T","157":"T","158":"F","159":"F","160":"T","162":"F","166":"T","167":"T","168":"T","169":"F","170":"F","172":"F","173":"F","174":"T","175":"F","176":"F","177":"F","180":"F","187":"T","190":"F","192":"F","193":"T","194":"T","195":"F","196":"T","197":"T","198":"T","199":"F","200":"F"}', '{"22":"F","23":"F","40":"F","41":"T","44":"T","45":"T","46":"F","47":"F","49":"T","50":"T","53":"T","55":"F","56":"T","58":"F","59":"T","62":"T","70":"T","73":"F","77":"F","78":"T","82":"T","84":"T","86":"T","87":"F","93":"T","96":"F","101":"T","102":"F","108":"T","110":"T","112":"F","114":"F","117":"T","119":"T","120":"T","123":"T","126":"T","130":"T","136":"T","139":"F","140":"T","143":"T","145":"T","151":"T","161":"T","163":"F","164":"F","165":"T","171":"F","178":"F","179":"F","181":"T","182":"F","183":"F","184":"T","185":"T","186":"T","188":"T","189":"F","191":"T"}', '{"13":".","14":".","27":".","28":".","129":"."}', 135, 60, 27.00, 3.00, 24.00, 60.00, 'G-1', 2, 28, 'A', 'D', '2017-08-22 16:53:05', 'admin@bigm-bd.com', NULL, NULL, 1),
(130, 3, 441, '2', '17172008', '2017', '1', '7', '2', '2', ',4,31', 55, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', '{"1":"F","2":"F","3":"T","4":"F","5":"T","6":"F","7":"T","8":"T","9":"T","10":"F","11":"T","12":"T","14":"F","15":"T","16":"T","17":"F","18":"F","19":"F","20":"F","21":"T","24":"F","26":"T","27":"F","28":"F","29":"T","30":"T","32":"F","33":"F","34":"T","35":"T","36":"F","37":"T","39":"T","42":"T","43":"T","44":"F","45":"F","46":"T","47":"T","50":"F","51":"T","52":"T","54":"F","56":"F","57":"T","58":"T","59":"F","61":"T","64":"F","66":"T","67":"T","68":"T","69":"T","70":"F","73":"T","74":"F","76":"T","79":"T","81":"F","83":"T","85":"T","87":"T","88":"T","90":"T","91":"T","92":"F","96":"T","98":"F","99":"F","102":"T","103":"T","105":"T","106":"T","107":"T","109":"T","111":"T","113":"F","114":"T","115":"T","117":"F","118":"T","124":"T","125":"T","126":"F","127":"T","128":"T","129":"F","130":"F","131":"T","132":"F","133":"T","134":"T","135":"F","136":"F","137":"T","138":"T","139":"T","141":"T","142":"F","143":"F","146":"T","148":"T","149":"F","151":"F","155":"T","156":"T","163":"T","164":"T","166":"T","167":"T","168":"T","169":"F","170":"F","171":"T","174":"T","176":"F","177":"F","180":"F","182":"T","183":"T","184":"F","187":"T","188":"F","189":"T","193":"T","194":"T","196":"T"}', '{"13":"T","22":"F","23":"F","25":"T","31":"T","38":"T","40":"F","41":"T","48":"F","49":"T","53":"T","55":"F","60":"F","62":"T","63":"T","65":"F","71":"T","72":"T","75":"F","77":"F","78":"T","80":"F","82":"T","84":"T","86":"T","89":"T","93":"T","94":"T","95":"T","97":"T","100":"F","101":"T","104":"T","108":"T","110":"T","112":"F","116":"F","119":"T","120":"T","121":"F","122":"T","123":"T","140":"T","144":"F","145":"T","147":"T","150":"F","152":"F","153":"T","154":"F","157":"F","158":"T","159":"T","160":"F","161":"T","162":"T","165":"T","172":"T","173":"T","175":"T","178":"F","179":"F","181":"T","185":"T","186":"T","190":"T","191":"T","192":"T","195":"T","197":"F","198":"F","199":"T","200":"T"}', '[]', 127, 73, 25.40, 3.65, 21.75, 54.38, 'P-1', 1, 33, 'B', 'm', '2017-08-22 16:53:06', 'admin@bigm-bd.com', NULL, NULL, 1),
(131, 3, 442, '2', '17172009', '2017', '1', '7', '1', '2', ',4,31', 58, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin@bigm-bd.com', NULL, NULL, 1),
(132, 3, 445, '2', '17172012', '2017', '1', '7', '1', '2', ',4,31', 28, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', '{"1":"F","2":"F","3":"T","4":"F","5":"T","6":"F","7":"T","8":"T","9":"T","10":"F","11":"T","12":"T","13":"F","14":"F","15":"T","16":"T","17":"F","18":"F","19":"F","21":"T","22":"T","23":"T","24":"F","25":"F","26":"T","27":"F","28":"F","29":"T","31":"F","32":"F","33":"F","34":"T","35":"T","36":"F","37":"T","38":"F","39":"T","42":"T","44":"F","46":"T","47":"T","49":"F","50":"F","52":"T","54":"F","55":"T","56":"F","58":"T","59":"F","60":"T","61":"T","62":"F","64":"F","65":"T","66":"T","67":"T","68":"T","69":"T","70":"F","71":"F","73":"T","74":"F","75":"T","76":"T","78":"F","79":"T","80":"T","81":"F","82":"F","83":"T","84":"F","85":"T","87":"T","88":"T","90":"T","91":"T","92":"F","94":"F","95":"F","96":"T","98":"F","99":"F","100":"T","101":"F","102":"T","103":"T","104":"F","105":"T","106":"T","107":"T","108":"F","109":"T","110":"F","112":"T","113":"F","115":"T","116":"T","120":"F","121":"T","122":"F","123":"F","124":"T","125":"T","126":"F","127":"T","128":"T","129":"F","130":"F","132":"F","133":"T","134":"T","135":"F","136":"F","137":"T","139":"T","140":"F","144":"T","145":"F","146":"T","147":"F","151":"F","152":"T","153":"F","154":"T","156":"T","157":"T","158":"F","159":"F","160":"T","161":"F","163":"T","164":"T","165":"F","166":"T","167":"T","168":"T","169":"F","170":"F","171":"T","172":"F","173":"F","174":"T","178":"T","182":"T","183":"T","187":"T","188":"F","189":"T","190":"F","191":"F","192":"F","193":"T","194":"T","195":"F","197":"T","199":"F"}', '{"20":">","30":"F","40":"F","41":"T","43":"F","45":"T","48":"F","51":"F","53":"T","57":"F","63":"T","72":"T","77":"F","86":"T","89":"T","93":"T","97":"T","111":"F","114":"F","117":"T","118":"F","119":"T","131":"F","138":"F","141":"F","142":"T","143":"T","148":"F","149":"T","150":"F","155":"F","162":"T","175":"T","176":"T","177":"T","179":"F","180":"T","181":"T","184":"T","185":"T","186":"T","196":"F","198":"F","200":"T"}', '[]', 156, 44, 31.20, 2.20, 29.00, 72.50, 'P-1', 1, 21, 'B', 'T', '2017-08-22 16:53:06', 'admin@bigm-bd.com', NULL, NULL, 1),
(133, 3, 446, '2', '17172013', '2017', '1', '7', '1', '2', ',4,31', 52, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', '{"1":"F","2":"F","3":"T","4":"F","5":"T","6":"F","7":"T","8":"T","9":"T","10":"F","11":"T","13":"F","14":"F","15":"T","16":"T","21":"T","22":"T","23":"T","26":"T","27":"F","28":"F","29":"T","30":"T","32":"F","33":"F","34":"T","35":"T","36":"F","37":"T","38":"F","39":"T","41":"F","42":"T","44":"F","46":"T","47":"T","48":"T","49":"F","50":"F","51":"T","52":"T","53":"F","54":"F","55":"T","58":"T","59":"F","60":"T","61":"T","62":"F","63":"F","65":"T","66":"T","67":"T","68":"T","69":"T","71":"F","72":"F","73":"T","74":"F","75":"T","76":"T","77":"T","78":"F","79":"T","80":"T","81":"F","82":"F","83":"T","84":"F","85":"T","87":"T","88":"T","89":"F","90":"T","91":"T","92":"F","93":"F","95":"F","96":"T","97":"F","98":"F","99":"F","100":"T","101":"F","102":"T","103":"T","104":"F","105":"T","106":"T","107":"T","108":"F","109":"T","110":"F","111":"T","112":"T","113":"F","114":"T","115":"T","116":"T","117":"F","118":"T","119":"F","120":"F","121":"T","122":"F","123":"F","124":"T","125":"T","126":"F","127":"T","128":"T","129":"F","130":"F","131":"T","132":"F","133":"T","134":"T","135":"F","137":"T","138":"T","140":"F","141":"T","142":"F","143":"F","144":"T","145":"F","146":"T","147":"F","148":"T","149":"F","150":"T","153":"F","154":"T","156":"T","157":"T","158":"F","159":"F","160":"T","161":"F","162":"F","163":"T","164":"T","165":"F","166":"T","167":"T","168":"T","169":"F","170":"F","171":"T","172":"F","173":"F","174":"T","175":"F","176":"F","177":"F","178":"T","179":"T","180":"F","181":"F","182":"T","183":"T","184":"F","185":"F","186":"F","187":"T","188":"F","189":"T","190":"F","191":"F","192":"F","193":"T","194":"T","195":"F","196":"T","197":"T","198":"T","199":"F","200":"F"}', '{"12":"F","31":"T","40":"F","43":"F","45":"T","56":"T","57":"F","64":"T","70":"T","86":"T","94":"T","136":"T","139":"F","151":"T","152":"F","155":"F"}', '{"17":".","18":".","19":".","20":".","24":".","25":"."}', 178, 16, 35.60, 0.80, 34.80, 87.00, 'G-1', 1, 6, 'A', 'f', '2017-08-22 16:53:06', 'admin@bigm-bd.com', NULL, NULL, 1),
(134, 3, 447, '2', '17172014', '2017', '1', '7', '2', '2', ',4,31', 55, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', '{"1":"F","2":"F","3":"T","4":"F","5":"T","6":"F","8":"T","9":"T","10":"F","11":"T","13":"F","14":"F","16":"T","18":"F","19":"F","20":"F","21":"T","22":"T","23":"T","24":"F","25":"F","26":"T","29":"T","30":"T","31":"F","32":"F","33":"F","34":"T","36":"F","37":"T","39":"T","40":"T","41":"F","42":"T","44":"F","45":"F","46":"T","47":"T","48":"T","49":"F","50":"F","51":"T","52":"T","53":"F","54":"F","61":"T","62":"F","64":"F","65":"T","66":"T","68":"T","69":"T","70":"F","72":"F","73":"T","74":"F","76":"T","79":"T","80":"T","83":"T","84":"F","85":"T","86":"F","87":"T","88":"T","89":"F","91":"T","92":"F","96":"T","97":"F","98":"F","99":"F","100":"T","101":"F","102":"T","103":"T","104":"F","105":"T","106":"T","108":"F","109":"T","110":"F","111":"T","112":"T","113":"F","115":"T","121":"T","122":"F","123":"F","124":"T","125":"T","127":"T","128":"T","129":"F","130":"F","131":"T","132":"F","133":"T","134":"T","135":"F","136":"F","137":"T","138":"T","139":"T","140":"F","141":"T","142":"F","143":"F","144":"T","145":"F","146":"T","147":"F","148":"T","149":"F","150":"T","153":"F","154":"T","156":"T","157":"T","158":"F","159":"F","160":"T","162":"F","166":"T","167":"T","168":"T","169":"F","170":"F","171":"T","172":"F","173":"F","174":"T","175":"F","176":"F","177":"F","179":"T","181":"F","182":"T","183":"T","184":"F","186":"F","187":"T","188":"F","189":"T","190":"F","191":"F","192":"F","193":"T","194":"T","195":"F","196":"T","197":"T","198":"T"}', '{"7":"F","12":"F","15":"F","17":"T","27":"T","28":"T","35":"F","38":"T","43":"F","55":"F","63":"T","67":"F","71":"T","75":"F","77":"F","78":"T","81":"T","82":"T","90":"F","93":"T","94":"T","95":"T","107":"F","114":"F","126":"T","151":"T","152":"F","155":"F","161":"T","163":"F","164":"F","165":"T","178":"F","180":"T","185":"T","199":"T","200":"T"}', '{"56":".","57":".","58":".","59":".","60":".","116":".","117":".","118":".","119":".","120":"."}', 153, 37, 30.60, 1.85, 28.75, 71.88, 'G-2', 2, 23, 'A', 'P', '2017-08-22 16:53:06', 'admin@bigm-bd.com', NULL, NULL, 1),
(135, 3, 448, '2', '17172015', '2017', '1', '7', '1', '2', ',4,31', 28, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', '{"1":"F","2":"F","3":"T","4":"F","5":"T","6":"F","7":"T","8":"T","9":"T","10":"F","11":"T","12":"T","13":"F","14":"F","15":"T","17":"F","21":"T","22":"T","23":"T","24":"F","26":"T","27":"F","29":"T","30":"T","31":"F","32":"F","33":"F","34":"T","36":"F","37":"T","38":"F","39":"T","41":"F","42":"T","44":"F","45":"F","46":"T","47":"T","48":"T","49":"F","50":"F","51":"T","52":"T","53":"F","54":"F","56":"F","57":"T","58":"T","59":"F","60":"T","61":"T","62":"F","63":"F","64":"F","65":"T","66":"T","67":"T","68":"T","69":"T","70":"F","71":"F","72":"F","73":"T","74":"F","75":"T","76":"T","78":"F","79":"T","80":"T","81":"F","83":"T","84":"F","85":"T","86":"F","87":"T","88":"T","89":"F","90":"T","91":"T","92":"F","96":"T","97":"F","98":"F","99":"F","100":"T","101":"F","102":"T","103":"T","104":"F","105":"T","106":"T","107":"T","108":"F","109":"T","110":"F","111":"T","113":"F","115":"T","116":"T","117":"F","118":"T","119":"F","120":"F","121":"T","122":"F","123":"F","124":"T","125":"T","126":"F","127":"T","128":"T","129":"F","130":"F","131":"T","132":"F","133":"T","134":"T","135":"F","136":"F","137":"T","138":"T","139":"T","140":"F","141":"T","142":"F","144":"T","145":"F","146":"T","147":"F","148":"T","149":"F","151":"F","153":"F","154":"T","156":"T","157":"T","158":"F","159":"F","160":"T","161":"F","162":"F","163":"T","164":"T","165":"F","166":"T","167":"T","168":"T","169":"F","170":"F","171":"T","172":"F","173":"F","174":"T","175":"F","176":"F","177":"F","178":"T","179":"T","181":"F","182":"T","183":"T","184":"F","185":"F","190":"F","192":"F","193":"T","194":"T","195":"F","196":"T","199":"F","200":"F"}', '{"16":"F","18":"T","19":"T","20":"T","25":"T","28":"T","35":"F","40":"F","43":"F","55":"F","77":"F","82":"T","93":"T","94":"T","95":"T","112":"F","114":"F","143":"T","150":"F","152":"F","155":"F","180":"T","186":"T","187":"F","188":"T","189":"F","191":"T","197":"F","198":"F"}', '[]', 171, 29, 34.20, 1.45, 32.75, 81.88, 'P-1', 1, 11, 'B', 'A', '2017-08-22 16:53:06', 'admin@bigm-bd.com', NULL, NULL, 1),
(136, 3, 449, '2', '17172016', '2017', '1', '7', '1', '2', ',4,31', 28, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin@bigm-bd.com', NULL, NULL, 1),
(137, 3, 450, '2', '17172017', '2017', '1', '7', '1', '2', ',4,31', 48, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', '{"1":"F","3":"T","5":"T","6":"F","7":"T","8":"T","9":"T","10":"F","11":"T","12":"T","14":"F","16":"T","17":"F","18":"F","19":"F","20":"F","21":"T","22":"T","24":"F","25":"F","26":"T","27":"F","28":"F","29":"T","31":"F","32":"F","33":"F","34":"T","35":"T","36":"F","40":"T","41":"F","43":"T","44":"F","48":"T","49":"F","50":"F","51":"T","53":"F","54":"F","55":"T","57":"T","59":"F","60":"T","61":"T","65":"T","66":"T","71":"F","75":"T","77":"T","81":"F","83":"T","84":"F","85":"T","86":"F","87":"T","89":"F","91":"T","92":"F","93":"F","94":"F","95":"F","97":"F","101":"F","102":"T","104":"F","105":"T","107":"T","108":"F","110":"F","112":"T","113":"F","115":"T","117":"F","119":"F","120":"F","121":"T","122":"F","123":"F","124":"T","125":"T","126":"F","127":"T","128":"T","129":"F","131":"T","132":"F","133":"T","134":"T","135":"F","136":"F","137":"T","140":"F","141":"T","142":"F","143":"F","144":"T","146":"T","147":"F","148":"T","151":"F","153":"F","158":"F","159":"F","162":"F","164":"T","166":"T","167":"T","168":"T","169":"F","170":"F","173":"F","174":"T","175":"F","176":"F","177":"F","180":"F","181":"F","182":"T","183":"T","184":"F","185":"F","187":"T","189":"T","191":"F","192":"F","193":"T","194":"T","195":"F","196":"T","197":"T","198":"T","199":"F","200":"F"}', '{"2":"T","4":"T","13":"T","15":"F","23":"F","30":"F","37":"F","38":"T","39":"F","42":"F","45":"T","46":"F","47":"F","52":"F","56":"T","58":"F","62":"T","63":"T","64":"T","67":"F","68":"F","69":"F","70":"T","72":"T","73":"F","74":"T","76":"F","78":"T","79":"F","80":"F","82":"T","88":"F","90":"F","96":"F","98":"T","99":"T","100":"F","103":"F","106":"F","109":"F","111":"F","114":"F","116":"F","118":"F","130":"T","138":"F","139":"F","145":"T","149":"T","150":"F","152":"F","154":"F","155":"F","156":"F","157":"F","160":"F","161":"T","163":"F","165":"T","171":"F","172":"T","178":"F","179":"F","186":"T","188":"T","190":"T"}', '[]', 134, 66, 26.80, 3.30, 23.50, 58.75, 'P-1', 1, 29, 'B', 'K', '2017-08-22 16:53:06', 'admin@bigm-bd.com', NULL, NULL, 1),
(138, 3, 453, '2', '17172019', '2017', '1', '7', '1', '2', ',4,31', 28, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', '{"1":"F","2":"F","3":"T","4":"F","5":"T","6":"F","7":"T","8":"T","9":"T","10":"F","11":"T","12":"T","13":"F","14":"F","15":"T","17":"F","21":"T","22":"T","23":"T","29":"T","30":"T","32":"F","33":"F","34":"T","36":"F","38":"F","42":"T","44":"F","45":"F","46":"T","47":"T","48":"T","49":"F","50":"F","51":"T","52":"T","53":"F","54":"F","55":"T","57":"T","58":"T","59":"F","61":"T","62":"F","63":"F","64":"F","65":"T","67":"T","68":"T","69":"T","70":"F","71":"F","72":"F","73":"T","74":"F","75":"T","76":"T","77":"T","79":"T","80":"T","83":"T","85":"T","87":"T","89":"F","90":"T","91":"T","92":"F","94":"F","95":"F","96":"T","97":"F","98":"F","99":"F","100":"T","102":"T","103":"T","105":"T","106":"T","107":"T","109":"T","111":"T","113":"F","115":"T","116":"T","118":"T","121":"T","122":"F","123":"F","124":"T","125":"T","127":"T","128":"T","129":"F","130":"F","131":"T","132":"F","133":"T","134":"T","135":"F","136":"F","138":"T","140":"F","141":"T","146":"T","148":"T","150":"T","152":"T","154":"T","155":"T","157":"T","159":"F","160":"T","162":"F","164":"T","166":"T","167":"T","168":"T","169":"F","170":"F","171":"T","172":"F","173":"F","174":"T","175":"F","176":"F","177":"F","179":"T","182":"T","184":"F","185":"F","187":"T","188":"F","189":"T","190":"F","191":"F","192":"F","193":"T","194":"T","195":"F","196":"T","197":"T","198":"T","199":"F","200":"F"}', '{"16":"F","18":"T","19":"T","20":"T","24":"T","25":"T","26":"F","27":"T","28":"T","31":"T","35":"F","37":"F","39":"F","40":"F","41":"T","43":"F","56":"T","60":"F","66":"F","78":"T","81":"T","82":"T","84":"T","86":"T","88":"F","93":"T","101":"T","104":"T","108":"T","110":"T","112":"F","114":"F","117":"T","119":"T","120":"T","126":"T","137":"F","139":"F","142":"T","143":"T","144":"F","145":"T","147":"T","149":"T","151":"T","153":"T","156":"F","158":"T","161":"T","163":"F","165":"T","178":"F","180":"T","181":"T","183":"F","186":"T"}', '[]', 144, 56, 28.80, 2.80, 26.00, 65.00, 'P-3', 4, 27, 'B', '.', '2017-08-22 16:53:06', 'admin@bigm-bd.com', NULL, NULL, 1),
(139, 3, 454, '2', '17172020', '2017', '1', '7', '2', '2', ',4,31', 61, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin@bigm-bd.com', NULL, NULL, 1),
(140, 3, 455, '2', '17172021', '2017', '1', '7', '2', '2', ',4,31', 40, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin@bigm-bd.com', NULL, NULL, 1),
(141, 3, 457, '2', '17172022', '2017', '1', '7', '1', '2', ',4,31', 58, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin@bigm-bd.com', NULL, NULL, 1),
(142, 3, 458, '2', '17172023', '2017', '1', '7', '2', '2', ',4,31', 68, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin@bigm-bd.com', NULL, NULL, 1),
(143, 3, 461, '2', '17172025', '2017', '1', '7', '1', '2', ',4,31', 28, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin@bigm-bd.com', NULL, NULL, 1),
(144, 3, 462, '2', '17172026', '2017', '1', '7', '2', '2', ',4,31', 58, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin@bigm-bd.com', NULL, NULL, 1),
(145, 3, 464, '2', '17172027', '2017', '1', '7', '1', '2', ',4,31', 28, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin@bigm-bd.com', NULL, NULL, 1),
(146, 3, 465, '2', '17172028', '2017', '1', '7', '1', '2', ',4,31', 34, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', '{"1":"F","2":"F","3":"T","4":"F","5":"T","6":"F","7":"T","8":"T","9":"T","10":"F","11":"T","12":"T","13":"F","14":"F","15":"T","16":"T","17":"F","18":"F","19":"F","20":"F","21":"T","24":"F","27":"F","28":"F","29":"T","30":"T","31":"F","32":"F","33":"F","34":"T","35":"T","36":"F","37":"T","38":"F","39":"T","42":"T","43":"T","46":"T","47":"T","50":"F","51":"T","52":"T","53":"F","54":"F","56":"F","57":"T","58":"T","60":"T","61":"T","62":"F","63":"F","65":"T","66":"T","67":"T","69":"T","70":"F","71":"F","72":"F","75":"T","79":"T","80":"T","83":"T","84":"F","85":"T","86":"F","87":"T","89":"F","90":"T","91":"T","94":"F","96":"T","97":"F","98":"F","100":"T","101":"F","102":"T","103":"T","104":"F","105":"T","106":"T","107":"T","109":"T","110":"F","111":"T","113":"F","115":"T","119":"F","120":"F","121":"T","123":"F","124":"T","127":"T","128":"T","129":"F","132":"F","133":"T","134":"T","135":"F","136":"F","137":"T","139":"T","140":"F","141":"T","142":"F","144":"T","146":"T","147":"F","148":"T","149":"F","150":"T","152":"T","153":"F","157":"T","158":"F","159":"F","160":"T","161":"F","163":"T","165":"F","166":"T","167":"T","168":"T","169":"F","170":"F","171":"T","172":"F","173":"F","174":"T","175":"F","176":"F","177":"F","179":"T","180":"F","181":"F","182":"T","183":"T","184":"F","185":"F","187":"T","188":"F","189":"T","190":"F","192":"F","193":"T","194":"T","195":"F","196":"T","197":"T","198":"T","199":"F","200":"F"}', '{"22":"F","23":"F","25":"T","26":"F","40":"F","41":"T","44":"T","45":"T","48":"F","49":"T","55":"F","59":"T","64":"T","68":"F","73":"F","74":"T","76":"F","77":"F","78":"T","81":"T","82":"T","88":"F","92":"T","93":"T","95":"T","99":"T","108":"T","112":"F","114":"F","116":"F","117":"T","118":"F","122":"T","125":"F","126":"T","130":"T","131":"F","138":"F","143":"T","145":"T","151":"T","154":"F","155":"F","156":"F","162":"T","164":"F","178":"F","186":"T","191":"T"}', '[]', 151, 49, 30.20, 2.45, 27.75, 69.38, 'P-1', 1, 25, 'B', 'D', '2017-08-22 16:53:06', 'admin@bigm-bd.com', NULL, NULL, 1),
(147, 3, 466, '2', '17172029', '2017', '1', '7', '2', '2', ',4,31', 59, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', '{"1":"F","2":"F","3":"T","4":"F","5":"T","6":"F","7":"T","8":"T","9":"T","10":"F","11":"T","12":"T","13":"F","14":"F","15":"T","16":"T","17":"F","18":"F","19":"F","20":"F","21":"T","22":"T","24":"F","25":"F","26":"T","27":"F","30":"T","31":"F","33":"F","34":"T","35":"T","36":"F","37":"T","38":"F","39":"T","41":"F","42":"T","45":"F","46":"T","47":"T","48":"T","49":"F","50":"F","51":"T","52":"T","53":"F","54":"F","55":"T","56":"F","57":"T","60":"T","61":"T","62":"F","63":"F","64":"F","65":"T","66":"T","67":"T","70":"F","71":"F","72":"F","73":"T","75":"T","76":"T","77":"T","79":"T","80":"T","81":"F","83":"T","84":"F","85":"T","86":"F","87":"T","88":"T","90":"T","91":"T","96":"T","97":"F","98":"F","100":"T","101":"F","102":"T","104":"F","105":"T","106":"T","107":"T","110":"F","111":"T","113":"F","114":"T","115":"T","117":"F","118":"T","120":"F","121":"T","122":"F","123":"F","124":"T","125":"T","130":"F","131":"T","132":"F","133":"T","134":"T","135":"F","136":"F","138":"T","139":"T","140":"F","141":"T","144":"T","146":"T","148":"T","150":"T","152":"T","154":"T","155":"T","156":"T","157":"T","159":"F","160":"T","161":"F","163":"T","165":"F","166":"T","167":"T","168":"T","169":"F","170":"F","171":"T","172":"F","175":"F","178":"T","179":"T","181":"F","182":"T","183":"T","185":"F","186":"F","187":"T","188":"F","189":"T","190":"F","191":"F","192":"F","193":"T","194":"T","195":"F","196":"T","197":"T","198":"T"}', '{"23":"F","28":"T","29":"F","32":"T","40":"F","43":"F","44":"T","58":"F","59":"T","68":"F","69":"F","74":"T","78":"T","82":"T","89":"T","92":"T","93":"T","94":"T","95":"T","99":"T","103":"F","108":"T","109":"F","112":"F","116":"F","119":"T","126":"T","127":"F","128":"F","129":"T","137":"F","142":"T","143":"T","145":"T","147":"T","149":"T","151":"T","153":"T","158":"T","162":"T","164":"F","173":"T","174":"F","176":"T","177":"T","180":"T","184":"T","199":"T","200":"T"}', '[]', 151, 49, 30.20, 2.45, 27.75, 69.38, 'P-2', 3, 24, 'B', 'o', '2017-08-22 16:53:06', 'admin@bigm-bd.com', NULL, NULL, 1),
(148, 3, 467, '2', '17172030', '2017', '1', '7', '2', '2', ',4,31', 56, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', '{"1":"F","2":"F","3":"T","5":"T","6":"F","7":"T","8":"T","9":"T","10":"F","11":"T","12":"T","13":"F","14":"F","17":"F","21":"T","22":"T","23":"T","24":"F","25":"F","26":"T","27":"F","28":"F","29":"T","30":"T","33":"F","34":"T","35":"T","36":"F","37":"T","38":"F","39":"T","42":"T","44":"F","46":"T","47":"T","49":"F","50":"F","51":"T","52":"T","53":"F","54":"F","61":"T","62":"F","65":"T","66":"T","67":"T","68":"T","69":"T","70":"F","71":"F","72":"F","73":"T","75":"T","79":"T","80":"T","81":"F","82":"F","83":"T","84":"F","85":"T","87":"T","88":"T","90":"T","91":"T","92":"F","94":"F","95":"F","96":"T","97":"F","98":"F","99":"F","100":"T","101":"F","102":"T","103":"T","104":"F","105":"T","106":"T","107":"T","108":"F","109":"T","110":"F","111":"T","113":"F","114":"T","115":"T","116":"T","119":"F","121":"T","122":"F","123":"F","124":"T","125":"T","126":"F","127":"T","128":"T","129":"F","130":"F","131":"T","132":"F","133":"T","134":"T","135":"F","136":"F","137":"T","138":"T","139":"T","140":"F","141":"T","142":"F","143":"F","144":"T","145":"F","146":"T","147":"F","148":"T","149":"F","150":"T","151":"F","152":"T","153":"F","154":"T","155":"T","156":"T","157":"T","158":"F","159":"F","160":"T","161":"F","162":"F","163":"T","164":"T","165":"F","166":"T","167":"T","168":"T","169":"F","170":"F","171":"T","172":"F","173":"F","174":"T","175":"F","176":"F","178":"T","181":"F","182":"T","183":"T","184":"F","185":"F","186":"F","187":"T","188":"F","189":"T","190":"F","192":"F","194":"T","195":"F","196":"T","197":"T","199":"F"}', '{"4":"T","15":"F","16":"F","18":"T","19":"T","20":"T","31":"T","32":"T","40":"F","41":"T","43":"F","45":"T","48":"F","55":"F","56":"T","57":"F","58":"F","59":"T","60":"F","63":"T","64":"T","74":"T","76":"F","77":"F","78":"T","86":"T","89":"T","93":"T","112":"F","117":"T","118":"F","120":"T","177":"T","179":"F","180":"T","191":"T","193":"F","198":"F","200":"T"}', '[]', 161, 39, 32.20, 1.95, 30.25, 75.62, 'P-1', 1, 18, 'B', 'N', '2017-08-22 16:53:06', 'admin@bigm-bd.com', NULL, NULL, 1),
(149, 3, 468, '2', '17172031', '2017', '1', '7', '1', '2', ',4,31', 28, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', '{"1":"F","2":"F","3":"T","4":"F","5":"T","6":"F","7":"T","8":"T","9":"T","10":"F","11":"T","13":"F","14":"F","15":"T","17":"F","21":"T","22":"T","23":"T","24":"F","25":"F","26":"T","27":"F","28":"F","29":"T","30":"T","31":"F","32":"F","33":"F","34":"T","35":"T","36":"F","37":"T","38":"F","39":"T","41":"F","42":"T","44":"F","45":"F","46":"T","47":"T","48":"T","49":"F","50":"F","51":"T","52":"T","53":"F","54":"F","55":"T","56":"F","57":"T","58":"T","59":"F","60":"T","61":"T","62":"F","63":"F","64":"F","65":"T","66":"T","67":"T","69":"T","70":"F","71":"F","72":"F","73":"T","75":"T","77":"T","79":"T","81":"F","83":"T","84":"F","85":"T","87":"T","88":"T","90":"T","91":"T","92":"F","93":"F","94":"F","95":"F","96":"T","97":"F","98":"F","99":"F","100":"T","105":"T","106":"T","107":"T","109":"T","110":"F","111":"T","113":"F","115":"T","116":"T","117":"F","119":"F","121":"T","122":"F","123":"F","124":"T","125":"T","126":"F","127":"T","128":"T","129":"F","130":"F","131":"T","132":"F","133":"T","134":"T","135":"F","136":"F","137":"T","138":"T","139":"T","140":"F","141":"T","142":"F","143":"F","144":"T","146":"T","147":"F","148":"T","149":"F","150":"T","153":"F","154":"T","155":"T","156":"T","157":"T","158":"F","159":"F","160":"T","161":"F","163":"T","165":"F","166":"T","167":"T","168":"T","169":"F","170":"F","171":"T","175":"F","176":"F","177":"F","178":"T","179":"T","182":"T","183":"T","184":"F","187":"T","188":"F","189":"T","190":"F","191":"F","194":"T","197":"T","198":"T","199":"F"}', '{"12":"F","16":"F","18":"T","19":"T","20":"T","40":"F","43":"F","68":"F","74":"T","76":"F","78":"T","80":"F","82":"T","86":"T","89":"T","101":"T","102":"F","103":"F","104":"T","108":"T","112":"F","114":"F","118":"F","120":"T","145":"T","151":"T","152":"F","162":"T","164":"F","172":"T","173":"T","174":"F","180":"T","181":"T","185":"T","186":"T","192":"T","193":"F","195":"T","196":"F","200":"T"}', '[]', 159, 41, 31.80, 2.05, 29.75, 74.38, 'P-2', 3, 19, 'B', '.', '2017-08-22 16:53:06', 'admin@bigm-bd.com', NULL, NULL, 1),
(150, 3, 470, '2', '17172032', '2017', '1', '7', '1', '2', ',4,31', 28, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', '{"1":"F","2":"F","3":"T","5":"T","6":"F","7":"T","8":"T","9":"T","10":"F","11":"T","13":"F","14":"F","15":"T","16":"T","17":"F","18":"F","19":"F","20":"F","21":"T","24":"F","25":"F","28":"F","29":"T","30":"T","31":"F","32":"F","33":"F","34":"T","35":"T","36":"F","37":"T","38":"F","39":"T","41":"F","42":"T","43":"T","44":"F","45":"F","46":"T","47":"T","48":"T","49":"F","50":"F","51":"T","52":"T","53":"F","54":"F","55":"T","56":"F","57":"T","59":"F","60":"T","61":"T","62":"F","65":"T","66":"T","67":"T","68":"T","69":"T","70":"F","71":"F","72":"F","73":"T","75":"T","76":"T","77":"T","78":"F","79":"T","80":"T","81":"F","82":"F","83":"T","85":"T","86":"F","87":"T","88":"T","89":"F","90":"T","94":"F","95":"F","96":"T","98":"F","99":"F","100":"T","101":"F","103":"T","104":"F","105":"T","106":"T","107":"T","109":"T","110":"F","111":"T","113":"F","115":"T","116":"T","117":"F","118":"T","119":"F","121":"T","123":"F","124":"T","125":"T","126":"F","127":"T","128":"T","129":"F","131":"T","132":"F","133":"T","134":"T","135":"F","136":"F","137":"T","138":"T","139":"T","140":"F","141":"T","143":"F","144":"T","147":"F","148":"T","149":"F","150":"T","151":"F","154":"T","155":"T","156":"T","157":"T","158":"F","159":"F","160":"T","161":"F","162":"F","163":"T","165":"F","166":"T","167":"T","168":"T","169":"F","170":"F","171":"T","172":"F","173":"F","174":"T","175":"F","176":"F","177":"F","178":"T","179":"T","181":"F","182":"T","183":"T","184":"F","185":"F","187":"T","188":"F","189":"T","190":"F","192":"F","193":"T","194":"T","195":"F","196":"T","197":"T","198":"T","199":"F","200":"F"}', '{"4":"T","12":"F","22":"F","23":"F","26":"F","27":"T","40":"F","58":"F","63":"T","64":"T","74":"T","84":"T","91":"F","92":"T","93":"T","97":"T","102":"F","108":"T","112":"F","114":"F","120":"T","122":"T","130":"T","142":"T","145":"T","146":"F","152":"F","153":"T","164":"F","180":"T","186":"T","191":"T"}', '[]', 168, 32, 33.60, 1.60, 32.00, 80.00, 'G-2', 2, 13, 'A', 'C', '2017-08-22 16:53:05', 'admin@bigm-bd.com', NULL, NULL, 1),
(151, 3, 471, '2', '17172033', '2017', '1', '7', '1', '2', ',4,31', 46, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin@bigm-bd.com', NULL, NULL, 1),
(152, 3, 472, '2', '17172034', '2017', '1', '7', '2', '2', ',4,31', 55, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', '{"1":"F","2":"F","3":"T","5":"T","6":"F","7":"T","8":"T","9":"T","10":"F","11":"T","12":"T","13":"F","14":"F","15":"T","16":"T","17":"F","21":"T","22":"T","24":"F","25":"F","26":"T","28":"F","29":"T","31":"F","32":"F","34":"T","35":"T","36":"F","37":"T","38":"F","39":"T","40":"T","41":"F","42":"T","43":"T","44":"F","45":"F","46":"T","47":"T","48":"T","49":"F","50":"F","51":"T","53":"F","54":"F","55":"T","59":"F","61":"T","65":"T","66":"T","67":"T","68":"T","69":"T","70":"F","71":"F","72":"F","73":"T","80":"T","83":"T","85":"T","87":"T","88":"T","90":"T","91":"T","92":"F","93":"F","94":"F","95":"F","96":"T","97":"F","98":"F","99":"F","100":"T","102":"T","103":"T","105":"T","106":"T","107":"T","108":"F","109":"T","110":"F","112":"T","116":"T","118":"T","121":"T","124":"T","125":"T","131":"T","133":"T","134":"T","136":"F","137":"T","138":"T","142":"F","143":"F","145":"F","146":"T","148":"T","150":"T","151":"F","155":"T","156":"T","157":"T","158":"F","159":"F","160":"T","161":"F","162":"F","165":"F","166":"T","167":"T","168":"T","169":"F","170":"F","172":"F","173":"F","175":"F","178":"T","179":"T","181":"F","183":"T","185":"F","186":"F","188":"F","190":"F","192":"F","193":"T","199":"F","200":"F"}', '{"4":"T","18":"T","19":"T","20":"T","23":"F","27":"T","30":"F","33":"T","52":"F","56":"T","57":"F","58":"F","60":"F","62":"T","63":"T","64":"T","74":"T","75":"F","76":"F","77":"F","78":"T","79":"F","81":"T","82":"T","84":"T","86":"T","89":"T","101":"T","104":"T","111":"F","113":"T","114":"F","115":"F","117":"T","119":"T","120":"T","122":"T","123":"T","126":"T","127":"F","128":"F","129":"T","130":"T","132":"T","135":"T","139":"F","140":"T","141":"F","144":"F","147":"T","149":"T","152":"F","153":"T","154":"F","163":"F","164":"F","171":"F","174":"F","176":"T","177":"T","180":"T","182":"F","184":"T","187":"F","189":"F","191":"T","194":"F","195":"T","196":"F","197":"F","198":"F"}', '[]', 129, 71, 25.80, 3.55, 22.25, 55.62, 'P-1', 1, 31, 'B', 'M', '2017-08-22 16:53:06', 'admin@bigm-bd.com', NULL, NULL, 1),
(153, 3, 473, '2', '17172035', '2017', '1', '7', '1', '2', ',4,31', 36, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin@bigm-bd.com', NULL, NULL, 1),
(154, 3, 475, '2', '17172037', '2017', '1', '7', '1', '2', ',4,31', 39, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', '{"1":"F","2":"F","3":"T","4":"F","5":"T","6":"F","7":"T","8":"T","9":"T","10":"F","11":"T","12":"T","13":"F","14":"F","15":"T","16":"T","17":"F","18":"F","19":"F","20":"F","21":"T","24":"F","27":"F","28":"F","29":"T","31":"F","32":"F","33":"F","34":"T","35":"T","36":"F","37":"T","38":"F","39":"T","40":"T","41":"F","42":"T","44":"F","45":"F","46":"T","47":"T","50":"F","51":"T","52":"T","53":"F","54":"F","56":"F","57":"T","58":"T","60":"T","61":"T","62":"F","63":"F","65":"T","66":"T","67":"T","69":"T","70":"F","71":"F","72":"F","75":"T","79":"T","80":"T","85":"T","86":"F","87":"T","89":"F","90":"T","91":"T","94":"F","96":"T","97":"F","99":"F","100":"T","101":"F","102":"T","103":"T","104":"F","105":"T","106":"T","107":"T","109":"T","110":"F","111":"T","113":"F","115":"T","119":"F","120":"F","121":"T","123":"F","124":"T","126":"F","127":"T","128":"T","129":"F","131":"T","132":"F","133":"T","134":"T","135":"F","136":"F","137":"T","139":"T","140":"F","141":"T","142":"F","144":"T","145":"F","146":"T","147":"F","148":"T","149":"F","150":"T","152":"T","153":"F","157":"T","158":"F","159":"F","160":"T","161":"F","162":"F","163":"T","164":"T","166":"T","167":"T","168":"T","169":"F","170":"F","171":"T","172":"F","173":"F","174":"T","175":"F","176":"F","177":"F","178":"T","179":"T","180":"F","181":"F","182":"T","183":"T","184":"F","185":"F","186":"F","187":"T","188":"F","189":"T","190":"F","191":"F","192":"F","193":"T","194":"T","195":"F","196":"T","197":"T","198":"T","199":"F","200":"F"}', '{"22":"F","23":"F","25":"T","26":"F","30":"F","43":"F","48":"F","49":"T","55":"F","59":"T","64":"T","68":"F","73":"F","74":"T","76":"F","77":"F","78":"T","81":"T","82":"T","83":"F","84":"T","88":"F","92":"T","93":"T","95":"T","98":"T","108":"T","112":"F","114":"F","116":"F","117":"T","118":"F","122":"T","125":"F","130":"T","138":"F","143":"T","151":"T","154":"F","155":"F","156":"F","165":"T"}', '[]', 158, 42, 31.60, 2.10, 29.50, 73.75, 'P-4', 5, 20, 'B', 'f', '2017-08-22 16:53:06', 'admin@bigm-bd.com', NULL, NULL, 1),
(155, 3, 476, '2', '17172038', '2017', '1', '7', '1', '2', ',4,31', 39, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin@bigm-bd.com', NULL, NULL, 1),
(156, 3, 479, '2', '17172039', '2017', '1', '7', '1', '2', ',4,31', 50, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', '{"1":"F","3":"T","5":"T","6":"F","7":"T","8":"T","9":"T","10":"F","11":"T","12":"T","13":"F","14":"F","15":"T","16":"T","17":"F","18":"F","19":"F","20":"F","21":"T","22":"T","24":"F","25":"F","26":"T","28":"F","29":"T","31":"F","32":"F","34":"T","36":"F","37":"T","38":"F","39":"T","40":"T","41":"F","42":"T","43":"T","44":"F","45":"F","46":"T","47":"T","48":"T","49":"F","50":"F","51":"T","53":"F","54":"F","55":"T","59":"F","61":"T","65":"T","66":"T","67":"T","68":"T","69":"T","70":"F","71":"F","72":"F","73":"T","77":"T","80":"T","83":"T","85":"T","87":"T","88":"T","90":"T","91":"T","92":"F","93":"F","94":"F","95":"F","96":"T","97":"F","98":"F","99":"F","100":"T","102":"T","103":"T","105":"T","106":"T","107":"T","108":"F","110":"F","112":"T","116":"T","118":"T","121":"T","124":"T","125":"T","127":"T","131":"T","133":"T","134":"T","136":"F","137":"T","138":"T","141":"T","144":"T","146":"T","148":"T","150":"T","151":"F","155":"T","156":"T","157":"T","158":"F","159":"F","160":"T","161":"F","162":"F","165":"F","166":"T","167":"T","168":"T","169":"F","170":"F","172":"F","173":"F","175":"F","178":"T","179":"T","181":"F","183":"T","185":"F","186":"F","188":"F","190":"F","192":"F","193":"T","199":"F","200":"F"}', '{"2":"T","4":"T","23":"F","27":"T","30":"F","33":"T","35":"F","52":"F","56":"T","57":"F","58":"F","60":"F","62":"T","63":"T","64":"T","74":"T","75":"F","76":"F","78":"T","79":"F","81":"T","82":"T","84":"T","86":"T","89":"T","101":"T","104":"T","109":"F","111":"F","113":"T","114":"F","115":"F","117":"T","119":"T","120":"T","122":"T","123":"T","126":"T","128":"F","129":"T","130":"T","132":"T","135":"T","139":"F","140":"T","142":"T","143":"T","145":"T","147":"T","149":"T","152":"F","153":"T","154":"F","163":"F","164":"F","171":"F","174":"F","176":"T","177":"T","180":"T","182":"F","184":"T","187":"F","189":"F","191":"T","194":"F","195":"T","196":"F","197":"F","198":"F"}', '[]', 130, 70, 26.00, 3.50, 22.50, 56.25, 'P-1', 1, 30, 'B', 'q', '2017-08-22 16:53:06', 'admin@bigm-bd.com', NULL, NULL, 1),
(157, 3, 480, '2', '17172040', '2017', '1', '7', '1', '2', ',4,31', 73, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin@bigm-bd.com', NULL, NULL, 1);
INSERT INTO `sif_exam_result` (`id`, `exam_id`, `doc_id`, `teacher_id`, `doc_reg_no`, `year`, `session`, `course_code`, `faculty_code`, `batch_code`, `topic_id`, `subject_id`, `mock_no`, `exam_type`, `paper`, `ans_type`, `mcq_range`, `mcq_mark`, `sba_range`, `sba_mark`, `neg_mark`, `full_mark`, `correct_ans`, `wrong_ans`, `not_answered`, `no_correct`, `no_wrong`, `correct_mark`, `wrong_mark`, `obtained_mark`, `mark_percentage`, `overall_pos`, `subject_pos`, `merit_pos`, `candidate_type`, `subject`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`) VALUES
(158, 3, 481, '2', '17172041', '2017', '1', '7', '1', '2', ',4,31', 39, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', '{"2":"F","3":"T","4":"F","5":"T","6":"F","7":"T","8":"T","9":"T","10":"F","11":"T","12":"T","13":"F","14":"F","15":"T","21":"T","22":"T","24":"F","25":"F","26":"T","28":"F","29":"T","30":"T","31":"F","33":"F","34":"T","35":"T","36":"F","37":"T","38":"F","39":"T","40":"T","41":"F","42":"T","44":"F","45":"F","46":"T","47":"T","48":"T","50":"F","51":"T","52":"T","53":"F","54":"F","55":"T","57":"T","58":"T","59":"F","60":"T","61":"T","62":"F","63":"F","64":"F","65":"T","66":"T","67":"T","68":"T","69":"T","70":"F","71":"F","72":"F","73":"T","75":"T","77":"T","79":"T","80":"T","81":"F","83":"T","85":"T","86":"F","87":"T","89":"F","91":"T","92":"F","95":"F","96":"T","97":"F","98":"F","99":"F","100":"T","102":"T","103":"T","105":"T","106":"T","107":"T","108":"F","109":"T","110":"F","111":"T","113":"F","115":"T","117":"F","119":"F","120":"F","121":"T","123":"F","124":"T","125":"T","126":"F","127":"T","128":"T","129":"F","131":"T","132":"F","133":"T","134":"T","135":"F","136":"F","137":"T","138":"T","139":"T","140":"F","141":"T","142":"F","143":"F","144":"T","145":"F","146":"T","147":"F","148":"T","150":"T","153":"F","154":"T","156":"T","157":"T","158":"F","159":"F","160":"T","161":"F","162":"F","163":"T","164":"T","165":"F","166":"T","167":"T","168":"T","169":"F","170":"F","171":"T","172":"F","173":"F","174":"T","175":"F","176":"F","178":"T","179":"T","180":"F","181":"F","182":"T","183":"T","184":"F","185":"F","186":"F","187":"T","188":"F","189":"T","190":"F","191":"F","192":"F","193":"T","194":"T","195":"F","196":"T","197":"T","199":"F","200":"F"}', '{"1":"T","16":"F","17":"T","18":"T","19":"T","20":"T","23":"F","27":"T","32":"T","43":"F","49":"T","56":"T","74":"T","76":"F","78":"T","82":"T","84":"T","88":"F","90":"F","93":"T","94":"T","101":"T","104":"T","112":"F","114":"F","116":"F","118":"F","122":"T","130":"T","149":"T","151":"T","152":"F","155":"F","177":"T","198":"F"}', '[]', 165, 35, 33.00, 1.75, 31.25, 78.12, 'P-3', 4, 17, 'B', 'f', '2017-08-22 16:53:06', 'admin@bigm-bd.com', NULL, NULL, 1),
(159, 3, 484, '2', '17172042', '2017', '1', '7', '2', '2', ',4,31', 59, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin@bigm-bd.com', NULL, NULL, 1),
(160, 3, 485, '2', '17172043', '2017', '1', '7', '1', '2', ',4,31', 39, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', '{"1":"F","2":"F","3":"T","4":"F","5":"T","6":"F","7":"T","8":"T","9":"T","11":"T","12":"T","13":"F","14":"F","15":"T","16":"T","17":"F","18":"F","19":"F","20":"F","27":"F","28":"F","29":"T","30":"T","31":"F","32":"F","33":"F","35":"T","36":"F","37":"T","38":"F","39":"T","43":"T","45":"F","46":"T","47":"T","48":"T","50":"F","51":"T","52":"T","53":"F","54":"F","56":"F","57":"T","58":"T","59":"F","61":"T","65":"T","67":"T","68":"T","69":"T","70":"F","71":"F","72":"F","73":"T","75":"T","79":"T","80":"T","81":"F","82":"F","84":"F","88":"T","96":"T","98":"F","99":"F","100":"T","102":"T","105":"T","108":"F","110":"F","111":"T","113":"F","115":"T","117":"F","119":"F","120":"F","122":"F","126":"F","127":"T","128":"T","129":"F","130":"F","136":"F","137":"T","138":"T","139":"T","141":"T","146":"T","149":"F","150":"T","154":"T","157":"T","160":"T","162":"F","163":"T","166":"T","167":"T","168":"T","169":"F","170":"F","171":"T","172":"F","173":"F","174":"T","175":"F","178":"T","179":"T","181":"F","182":"T","183":"T","184":"F","185":"F","187":"T","188":"F","190":"F","191":"F","192":"F","193":"T","194":"T","195":"F","197":"T","198":"T","199":"F","200":"F"}', '{"10":"T","34":"F","40":"F","49":"T","55":"F","60":"F","62":"T","63":"T","64":"T","66":"F","74":"T","76":"F","77":"F","78":"T","83":"F","85":"F","86":"T","87":"F","89":"T","90":"F","97":"T","106":"F","107":"F","109":"F","112":"F","114":"F","116":"F","118":"F","121":"F","123":"T","124":"F","125":"F","131":"F","132":"T","133":"F","134":"F","135":"T","140":"T","147":"T","148":"F","151":"T","161":"T","164":"F","165":"T","176":"T","177":"T","180":"T","186":"T","189":"F","196":"F"}', '{"21":".","22":".","23":".","24":".","25":".","26":".","41":".","42":".","44":".","91":".","92":".","93":".","94":".","95":".","101":".","103":".","104":".","142":".","143":".","144":".","145":".","152":".","153":".","155":".","156":".","158":".","159":"."}', 123, 50, 24.60, 2.50, 22.10, 55.25, '-1', 5, 32, '.', '.', '2017-08-22 16:53:05', 'admin@bigm-bd.com', NULL, NULL, 1),
(161, 3, 486, '2', '17172044', '2017', '1', '7', '2', '2', ',4,31', 55, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', '{"1":"F","2":"F","3":"T","4":"F","5":"T","6":"F","9":"T","11":"T","12":"T","13":"F","14":"F","15":"T","16":"T","18":"F","20":"F","21":"T","22":"T","23":"T","24":"F","25":"F","26":"T","27":"F","29":"T","31":"F","32":"F","33":"F","34":"T","36":"F","37":"T","38":"F","39":"T","40":"T","41":"F","42":"T","43":"T","44":"F","45":"F","46":"T","47":"T","48":"T","49":"F","50":"F","51":"T","52":"T","53":"F","54":"F","55":"T","56":"F","57":"T","58":"T","59":"F","61":"T","62":"F","63":"F","64":"F","65":"T","66":"T","67":"T","68":"T","69":"T","70":"F","71":"F","72":"F","73":"T","74":"F","75":"T","76":"T","77":"T","78":"F","79":"T","80":"T","81":"F","82":"F","83":"T","84":"F","85":"T","86":"F","88":"T","89":"F","90":"T","91":"T","92":"F","93":"F","94":"F","96":"T","98":"F","99":"F","100":"T","101":"F","102":"T","105":"T","106":"T","107":"T","108":"F","109":"T","110":"F","111":"T","113":"F","114":"T","115":"T","116":"T","117":"F","118":"T","119":"F","120":"F","121":"T","122":"F","123":"F","124":"T","125":"T","126":"F","127":"T","128":"T","129":"F","130":"F","131":"T","132":"F","133":"T","134":"T","135":"F","136":"F","137":"T","138":"T","140":"F","141":"T","144":"T","145":"F","146":"T","148":"T","150":"T","152":"T","153":"F","154":"T","156":"T","157":"T","158":"F","159":"F","160":"T","162":"F","163":"T","164":"T","165":"F","166":"T","167":"T","168":"T","169":"F","170":"F","173":"F","174":"T","175":"F","179":"T","180":"F","182":"T","183":"T","184":"F","185":"F","187":"T","188":"F","191":"F","192":"F","193":"T","194":"T","195":"F","197":"T","200":"F"}', '{"7":"F","8":"F","10":"T","17":"T","19":"T","28":"T","30":"F","35":"F","60":"F","87":"F","95":"T","97":"T","103":"F","104":"T","112":"F","139":"F","142":"T","143":"T","147":"T","149":"T","151":"T","155":"F","161":"T","171":"F","172":"T","176":"T","177":"T","178":"F","181":"T","186":"T","189":"F","190":"T","196":"F","198":"F","199":"T"}', '[]', 165, 35, 33.00, 1.75, 31.25, 78.12, 'P-1', 2, 16, 'B', '.', '2017-08-22 16:53:06', 'admin@bigm-bd.com', NULL, NULL, 1),
(162, 3, 487, '2', '17172045', '2017', '1', '7', '1', '2', ',4,31', 28, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', '{"1":"F","2":"F","3":"T","4":"F","5":"T","6":"F","7":"T","8":"T","9":"T","10":"F","11":"T","12":"T","13":"F","14":"F","15":"T","16":"T","17":"F","18":"F","19":"F","20":"F","21":"T","22":"T","23":"T","24":"F","25":"F","26":"T","27":"F","28":"F","30":"T","31":"F","32":"F","33":"F","34":"T","35":"T","36":"F","37":"T","38":"F","39":"T","41":"F","42":"T","43":"T","44":"F","45":"F","46":"T","47":"T","50":"F","51":"T","52":"T","53":"F","54":"F","56":"F","57":"T","58":"T","60":"T","61":"T","62":"F","64":"F","65":"T","66":"T","67":"T","68":"T","69":"T","70":"F","71":"F","72":"F","73":"T","75":"T","77":"T","78":"F","79":"T","81":"F","83":"T","84":"F","85":"T","86":"F","88":"T","89":"F","91":"T","92":"F","94":"F","95":"F","96":"T","97":"F","98":"F","99":"F","100":"T","101":"F","103":"T","104":"F","105":"T","106":"T","107":"T","108":"F","109":"T","110":"F","111":"T","113":"F","114":"T","115":"T","119":"F","120":"F","121":"T","122":"F","124":"T","126":"F","127":"T","128":"T","129":"F","133":"T","134":"T","135":"F","136":"F","137":"T","138":"T","139":"T","141":"T","142":"F","143":"F","144":"T","146":"T","147":"F","149":"F","150":"T","153":"F","154":"T","155":"T","156":"T","157":"T","158":"F","159":"F","160":"T","161":"F","162":"F","163":"T","164":"T","165":"F","166":"T","167":"T","168":"T","169":"F","170":"F","171":"T","172":"F","173":"F","174":"T","175":"F","177":"F","178":"T","179":"T","180":"F","181":"F","183":"T","184":"F","187":"T","188":"F","189":"T","190":"F","192":"F","193":"T","194":"T","195":"F","196":"T","197":"T","198":"T","199":"F","200":"F"}', '{"29":"F","40":"F","48":"F","49":"T","55":"F","59":"T","63":"T","74":"T","76":"F","80":"F","82":"T","87":"F","90":"F","93":"T","102":"F","112":"F","116":"F","117":"T","118":"F","123":"T","125":"F","130":"T","131":"F","132":"T","140":"T","145":"T","148":"F","151":"T","152":"F","176":"T","182":"F","185":"T","186":"T","191":"T"}', '[]', 166, 34, 33.20, 1.70, 31.50, 78.75, 'G-1', 3, 15, 'A', 'A', '2017-08-22 16:53:05', 'admin@bigm-bd.com', NULL, NULL, 1),
(163, 3, 488, '2', '17172046', '2017', '1', '7', '2', '2', ',4,31', 53, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin@bigm-bd.com', NULL, NULL, 1),
(164, 3, 491, '2', '17172047', '2017', '1', '7', '1', '2', ',4,31', 34, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin@bigm-bd.com', NULL, NULL, 1),
(165, 3, 492, '2', '17172048', '2017', '1', '7', '4', '2', ',4,31', 29, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin@bigm-bd.com', NULL, NULL, 1),
(166, 3, 493, '2', '17172050', '2017', '1', '7', '1', '2', ',4,31', 28, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin@bigm-bd.com', NULL, NULL, 1),
(167, 3, 494, '2', '17172051', '2017', '1', '7', '1', '2', ',4,31', 46, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', '{"2":"F","5":"T","6":"F","7":"T","9":"T","10":"F","11":"T","12":"T","13":"F","14":"F","15":"T","17":"F","24":"F","25":"F","27":"F","30":"T","31":"F","32":"F","33":"F","34":"T","35":"T","36":"F","39":"T","41":"F","44":"F","45":"F","47":"T","49":"F","51":"T","52":"T","53":"F","54":"F","56":"F","57":"T","59":"F","60":"T","61":"T","62":"F","63":"F","64":"F","70":"F","73":"T","74":"F","76":"T","78":"F","80":"T","83":"T","85":"T","90":"T","92":"F","93":"F","94":"F","95":"F","96":"T","97":"F","98":"F","100":"T","101":"F","105":"T","106":"T","109":"T","110":"F","111":"T","112":"T","117":"F","119":"F","120":"F","121":"T","122":"F","124":"T","128":"T","129":"F","134":"T","136":"F","140":"F","141":"T","142":"F","143":"F","144":"T","150":"T","151":"F","152":"T","155":"T","158":"F","159":"F","163":"T","165":"F","166":"T","168":"T","169":"F","170":"F","173":"F","174":"T","175":"F","177":"F","179":"T","180":"F","185":"F","187":"T","188":"F","190":"F","192":"F","196":"T","199":"F"}', '{"1":"T","3":"F","4":"T","8":"F","16":"F","18":"T","19":"T","20":"T","21":"F","22":"F","23":"F","26":"F","28":"T","29":"F","37":"F","38":"T","40":"F","42":"F","43":"F","46":"F","48":"F","50":"T","55":"F","58":"F","65":"F","66":"F","67":"F","68":"F","69":"F","71":"T","72":"T","75":"F","77":"F","79":"F","81":"T","82":"T","84":"T","86":"T","87":"F","88":"F","89":"T","91":"F","99":"T","102":"F","103":"F","104":"T","107":"F","108":"T","113":"T","114":"F","115":"F","116":"F","118":"F","123":"T","125":"F","126":"T","127":"F","130":"T","131":"F","132":"T","133":"F","135":"T","137":"F","138":"F","139":"F","145":"T","146":"F","147":"T","148":"F","149":"T","153":"T","154":"F","156":"F","157":"F","160":"F","161":"T","162":"T","164":"F","167":"F","171":"F","172":"T","176":"T","178":"F","181":"T","182":"F","183":"F","184":"T","186":"T","189":"F","191":"T","193":"F","194":"F","195":"T","197":"F","198":"F","200":"T"}', '[]', 104, 96, 20.80, 4.80, 16.00, 40.00, 'G-2', 6, 36, 'A', '.', '2017-08-22 16:53:05', 'admin@bigm-bd.com', NULL, NULL, 1),
(168, 3, 495, '2', '17172052', '2017', '1', '7', '2', '2', ',4,31', 64, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', '{"1":"F","2":"F","3":"T","4":"F","5":"T","6":"F","7":"T","8":"T","9":"T","10":"F","11":"T","12":"T","13":"F","14":"F","15":"T","16":"T","17":"F","18":"F","19":"F","20":"F","21":"T","22":"T","23":"T","24":"F","25":"F","26":"T","27":"F","28":"F","29":"T","30":"T","31":"F","32":"F","33":"F","34":"T","35":"T","36":"F","37":"T","38":"F","39":"T","40":"T","41":"F","42":"T","43":"T","46":"T","47":"T","48":"T","49":"F","50":"F","51":"T","52":"T","53":"F","54":"F","55":"T","56":"F","57":"T","58":"T","61":"T","62":"F","63":"F","64":"F","65":"T","66":"T","67":"T","68":"T","69":"T","70":"F","71":"F","72":"F","73":"T","75":"T","76":"T","77":"T","78":"F","80":"T","81":"F","82":"F","83":"T","84":"F","85":"T","86":"F","87":"T","89":"F","90":"T","91":"T","92":"F","93":"F","95":"F","96":"T","97":"F","98":"F","99":"F","100":"T","101":"F","102":"T","104":"F","105":"T","106":"T","107":"T","108":"F","109":"T","110":"F","111":"T","113":"F","115":"T","118":"T","119":"F","120":"F","121":"T","122":"F","123":"F","124":"T","125":"T","126":"F","127":"T","128":"T","129":"F","130":"F","131":"T","132":"F","133":"T","134":"T","135":"F","136":"F","137":"T","138":"T","139":"T","140":"F","141":"T","142":"F","143":"F","144":"T","145":"F","146":"T","147":"F","148":"T","149":"F","150":"T","151":"F","153":"F","154":"T","155":"T","156":"T","157":"T","158":"F","159":"F","160":"T","161":"F","162":"F","163":"T","164":"T","165":"F","166":"T","167":"T","168":"T","169":"F","170":"F","171":"T","172":"F","173":"F","174":"T","175":"F","176":"F","177":"F","178":"T","179":"T","180":"F","181":"F","182":"T","183":"T","184":"F","185":"F","186":"F","189":"T","190":"F","191":"F","192":"F","193":"T","194":"T","195":"F","196":"T","197":"T","199":"F"}', '{"44":"T","45":"T","59":"T","60":"F","74":"T","79":"F","88":"F","94":"T","103":"F","112":"F","114":"F","116":"F","117":"T","152":"F","187":"F","188":"T","198":"F","200":"T"}', '[]', 182, 18, 36.40, 0.90, 35.50, 88.75, 'P-1', 1, 5, 'B', 'R', '2017-08-22 16:53:06', 'admin@bigm-bd.com', NULL, NULL, 1),
(169, 3, 496, '2', '17172053', '2017', '1', '7', '2', '2', ',4,31', 55, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', '{"3":"T","5":"T","6":"F","7":"T","8":"T","9":"T","10":"F","11":"T","13":"F","14":"F","15":"T","16":"T","17":"F","18":"F","19":"F","20":"F","21":"T","23":"T","24":"F","25":"F","26":"T","27":"F","28":"F","29":"T","30":"T","31":"F","32":"F","33":"F","34":"T","36":"F","37":"T","38":"F","39":"T","41":"F","42":"T","44":"F","46":"T","47":"T","48":"T","49":"F","50":"F","51":"T","53":"F","54":"F","55":"T","60":"T","61":"T","62":"F","63":"F","64":"F","65":"T","66":"T","67":"T","69":"T","70":"F","71":"F","72":"F","73":"T","75":"T","79":"T","80":"T","81":"F","82":"F","83":"T","84":"F","85":"T","86":"F","87":"T","88":"T","91":"T","92":"F","95":"F","96":"T","97":"F","98":"F","99":"F","100":"T","101":"F","102":"T","103":"T","104":"F","105":"T","106":"T","107":"T","108":"F","109":"T","110":"F","111":"T","113":"F","115":"T","116":"T","117":"F","118":"T","120":"F","121":"T","122":"F","123":"F","124":"T","125":"T","127":"T","128":"T","129":"F","130":"F","131":"T","132":"F","133":"T","134":"T","135":"F","136":"F","137":"T","140":"F","141":"T","142":"F","143":"F","144":"T","145":"F","146":"T","147":"F","148":"T","149":"F","150":"T","153":"F","154":"T","155":"T","156":"T","157":"T","158":"F","159":"F","160":"T","164":"T","165":"F","166":"T","167":"T","168":"T","169":"F","170":"F","171":"T","173":"F","174":"T","175":"F","176":"F","181":"F","183":"T","184":"F","187":"T","188":"F","189":"T","190":"F","191":"F","192":"F","193":"T","194":"T","196":"T","197":"T","199":"F","200":"F"}', '{"1":"T","2":"T","4":"T","12":"F","22":"F","35":"F","40":"F","43":"F","45":"T","52":"F","56":"T","57":"F","58":"F","59":"T","68":"F","74":"T","76":"F","77":"F","78":"T","89":"T","90":"F","93":"T","94":"T","112":"F","114":"F","119":"T","126":"T","138":"F","139":"F","151":"T","152":"F","161":"T","162":"T","163":"F","172":"T","177":"T","178":"F","179":"F","180":"T","182":"F","185":"T","186":"T","195":"T","198":"F"}', '[]', 156, 44, 31.20, 2.20, 29.00, 72.50, '-1', 3, 22, '.', 'O', '2017-08-22 16:53:05', 'admin@bigm-bd.com', NULL, NULL, 1),
(170, 3, 499, '2', '17172055', '2017', '1', '7', '2', '2', ',4,31', 55, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', '{"1":"F","2":"F","3":"T","4":"F","5":"T","6":"F","7":"T","8":"T","9":"T","10":"F","11":"T","12":"T","13":"F","14":"F","15":"T","16":"T","17":"F","18":"F","19":"F","20":"F","21":"T","23":"T","24":"F","26":"T","27":"F","28":"F","29":"T","30":"T","31":"F","32":"F","33":"F","34":"T","35":"T","36":"F","37":"T","38":"F","39":"T","41":"F","42":"T","44":"F","45":"F","46":"T","47":"T","48":"T","50":"F","51":"T","52":"T","53":"F","54":"F","55":"T","56":"F","58":"T","59":"F","60":"T","61":"T","62":"F","63":"F","64":"F","65":"T","66":"T","67":"T","68":"T","69":"T","70":"F","71":"F","72":"F","73":"T","74":"F","76":"T","77":"T","78":"F","79":"T","80":"T","81":"F","82":"F","83":"T","84":"F","85":"T","86":"F","87":"T","88":"T","89":"F","91":"T","92":"F","93":"F","94":"F","95":"F","96":"T","97":"F","98":"F","99":"F","100":"T","101":"F","103":"T","104":"F","105":"T","106":"T","107":"T","109":"T","111":"T","113":"F","114":"T","115":"T","116":"T","117":"F","119":"F","120":"F","121":"T","123":"F","124":"T","125":"T","126":"F","127":"T","128":"T","129":"F","130":"F","131":"T","132":"F","133":"T","134":"T","135":"F","136":"F","137":"T","138":"T","139":"T","140":"F","141":"T","142":"F","143":"F","144":"T","145":"F","146":"T","147":"F","151":"F","152":"T","154":"T","156":"T","157":"T","158":"F","159":"F","160":"T","161":"F","163":"T","165":"F","166":"T","167":"T","168":"T","169":"F","170":"F","171":"T","172":"F","173":"F","174":"T","175":"F","176":"F","177":"F","178":"T","180":"F","181":"F","182":"T","183":"T","184":"F","185":"F","187":"T","190":"F","192":"F","193":"T","194":"T","199":"F","200":"F"}', '{"22":"F","25":"T","40":"F","43":"F","49":"T","57":"F","75":"F","90":"F","102":"F","108":"T","110":"T","112":"F","118":"F","122":"T","148":"F","149":"T","150":"F","153":"T","155":"F","162":"T","164":"F","179":"F","186":"T","188":"T","189":"F","191":"T","195":"T","196":"F","197":"F","198":"F"}', '[]', 170, 30, 34.00, 1.50, 32.50, 81.25, 'G-1', 1, 12, 'A', 'P', '2017-08-22 16:53:06', 'admin@bigm-bd.com', NULL, NULL, 1),
(171, 3, 603, '2', '17172054', '2017', '1', '7', '5', '2', ',4,31', 28, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', '{"3":"T","5":"T","6":"F","7":"T","8":"T","9":"T","10":"F","11":"T","12":"T","13":"F","14":"F","15":"T","16":"T","17":"F","18":"F","19":"F","20":"F","21":"T","22":"T","23":"T","24":"F","25":"F","26":"T","27":"F","28":"F","29":"T","31":"F","32":"F","34":"T","35":"T","36":"F","37":"T","38":"F","39":"T","41":"F","42":"T","44":"F","46":"T","47":"T","48":"T","49":"F","50":"F","51":"T","52":"T","53":"F","54":"F","55":"T","57":"T","60":"T","61":"T","62":"F","63":"F","65":"T","66":"T","67":"T","68":"T","69":"T","70":"F","71":"F","72":"F","73":"T","75":"T","76":"T","79":"T","80":"T","81":"F","82":"F","83":"T","85":"T","86":"F","87":"T","88":"T","89":"F","90":"T","91":"T","92":"F","93":"F","94":"F","95":"F","96":"T","97":"F","98":"F","99":"F","100":"T","101":"F","102":"T","103":"T","104":"F","105":"T","106":"T","107":"T","108":"F","109":"T","110":"F","111":"T","113":"F","115":"T","116":"T","118":"T","119":"F","120":"F","121":"T","122":"F","123":"F","124":"T","125":"T","127":"T","128":"T","129":"F","131":"T","132":"F","133":"T","134":"T","135":"F","136":"F","138":"T","139":"T","140":"F","141":"T","142":"F","145":"F","146":"T","147":"F","148":"T","149":"F","150":"T","153":"F","155":"T","156":"T","157":"T","158":"F","159":"F","160":"T","161":"F","163":"T","164":"T","165":"F","166":"T","167":"T","168":"T","169":"F","170":"F","171":"T","172":"F","173":"F","174":"T","175":"F","176":"F","177":"F","178":"T","181":"F","183":"T","184":"F","185":"F","187":"T","188":"F","189":"T","190":"F","191":"F","192":"F","193":"T","194":"T","196":"T","197":"T","198":"T","199":"F","200":"F"}', '{"1":"T","2":"T","4":"T","30":"F","33":"T","40":"F","43":"F","45":"T","56":"T","58":"F","59":"T","64":"T","74":"T","77":"F","78":"T","84":"T","112":"F","114":"F","117":"T","126":"T","130":"T","137":"F","143":"T","144":"F","151":"T","152":"F","154":"F","162":"T","179":"F","180":"T","182":"F","186":"T","195":"T"}', '[]', 167, 33, 33.40, 1.65, 31.75, 79.38, 'P-2', 2, 14, 'B', 'A', '2017-08-22 16:53:06', 'admin@bigm-bd.com', NULL, NULL, 1),
(172, 3, 646, '2', '17172095', '2017', '1', '7', '2', '2', ',4,31', 53, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', '{"1":"F","2":"F","3":"T","4":"F","5":"T","6":"F","7":"T","8":"T","9":"T","10":"F","11":"T","12":"T","13":"F","14":"F","15":"T","16":"T","17":"F","18":"F","19":"F","20":"F","21":"T","22":"T","23":"T","29":"T","30":"T","33":"F","35":"T","37":"T","39":"T","40":"T","42":"T","43":"T","46":"T","47":"T","51":"T","52":"T","54":"F","60":"T","61":"T","65":"T","66":"T","67":"T","68":"T","69":"T","70":"F","71":"F","72":"F","75":"T","79":"T","80":"T","82":"F","83":"T","85":"T","86":"F","87":"T","90":"T","92":"F","95":"F","96":"T","99":"F","102":"T","103":"T","105":"T","106":"T","107":"T","109":"T","111":"T","112":"T","116":"T","117":"F","119":"F","120":"F","124":"T","127":"T","129":"F","130":"F","131":"T","134":"T","136":"F","137":"T","138":"T","139":"T","146":"T","148":"T","150":"T","151":"F","152":"T","154":"T","155":"T","156":"T","157":"T","160":"T","164":"T","166":"T","167":"T","168":"T","169":"F","170":"F","171":"T","172":"F","173":"F","175":"F","178":"T","179":"T","181":"F","182":"T","183":"T","184":"F","185":"F","187":"T","188":"F","193":"T","194":"T","196":"T","197":"T","198":"T","199":"F"}', '{"24":"T","25":"T","26":"F","27":"T","28":"T","31":"T","32":"T","34":"F","36":"T","38":"T","41":"T","44":"T","45":"T","48":"F","49":"T","50":"T","53":"T","55":"F","56":"T","57":"F","58":"F","59":"T","62":"T","63":"T","64":"T","73":"F","74":"T","76":"F","77":"F","78":"T","81":"T","84":"T","88":"F","89":"T","91":"F","93":"T","94":"T","97":"T","98":"T","100":"F","101":"T","104":"T","108":"T","110":"T","113":"T","114":"F","115":"F","118":"F","121":"F","122":"T","123":"T","125":"F","126":"T","128":"F","132":"T","133":"F","135":"T","140":"T","141":"F","142":"T","143":"T","144":"F","145":"T","147":"T","149":"T","153":"T","158":"T","159":"T","161":"T","162":"T","163":"F","165":"T","174":"F","176":"T","177":"T","180":"T","186":"T","189":"F","190":"T","191":"T","192":"T","195":"T","200":"T"}', '[]', 117, 83, 23.40, 4.15, 19.25, 48.12, 'G-1', 1, 35, 'A', 'l', '2017-08-22 16:53:06', 'admin@bigm-bd.com', NULL, NULL, 1),
(173, 3, 653, '2', '17172134', '2017', '1', '7', '1', '2', ',4,31', 58, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', '{"1":"F","2":"F","3":"T","4":"F","5":"T","6":"F","7":"T","8":"T","9":"T","10":"F","11":"T","12":"T","13":"F","14":"F","15":"T","16":"T","17":"F","18":"F","19":"F","20":"F","21":"T","22":"T","23":"T","24":"F","25":"F","26":"T","27":"F","28":"F","29":"T","30":"T","31":"F","32":"F","33":"F","34":"T","35":"T","36":"F","37":"T","38":"F","39":"T","40":"T","41":"F","42":"T","44":"F","45":"F","46":"T","47":"T","48":"T","49":"F","50":"F","51":"T","52":"T","53":"F","54":"F","55":"T","56":"F","57":"T","58":"T","59":"F","60":"T","61":"T","62":"F","63":"F","64":"F","65":"T","66":"T","67":"T","68":"T","69":"T","70":"F","71":"F","72":"F","73":"T","74":"F","75":"T","76":"T","77":"T","78":"F","79":"T","80":"T","81":"F","82":"F","83":"T","84":"F","85":"T","86":"F","87":"T","88":"T","89":"F","90":"T","91":"T","92":"F","93":"F","94":"F","96":"T","97":"F","98":"F","99":"F","100":"T","101":"F","102":"T","103":"T","104":"F","105":"T","106":"T","107":"T","108":"F","109":"T","110":"F","111":"T","113":"F","115":"T","116":"T","117":"F","118":"T","119":"F","120":"F","121":"T","122":"F","123":"F","124":"T","125":"T","126":"F","127":"T","128":"T","129":"F","130":"F","131":"T","132":"F","133":"T","134":"T","135":"F","136":"F","137":"T","138":"T","139":"T","140":"F","141":"T","142":"F","143":"F","144":"T","145":"F","146":"T","147":"F","148":"T","149":"F","150":"T","151":"F","152":"T","153":"F","154":"T","155":"T","156":"T","157":"T","158":"F","159":"F","160":"T","161":"F","162":"F","163":"T","164":"T","165":"F","166":"T","167":"T","168":"T","169":"F","170":"F","171":"T","172":"F","173":"F","174":"T","175":"F","176":"F","178":"T","179":"T","180":"F","181":"F","182":"T","183":"T","184":"F","185":"F","186":"F","187":"T","188":"F","189":"T","190":"F","191":"F","192":"F","193":"T","194":"T","195":"F","196":"T","197":"T","199":"F","200":"F"}', '{"43":"F","95":"T","112":"F","114":"F","177":"T","198":"F"}', '[]', 194, 6, 38.80, 0.30, 38.50, 96.25, 'P-1', 1, 1, 'B', 'O', '2017-08-22 16:53:06', 'admin@bigm-bd.com', NULL, NULL, 1),
(174, 3, 681, '2', '17172071', '2017', '1', '7', '4', '2', ',4,31', 59, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', '{"1":"F","2":"F","3":"T","4":"F","5":"T","6":"F","7":"T","8":"T","9":"T","10":"F","11":"T","12":"T","13":"F","14":"F","15":"T","16":"T","17":"F","18":"F","19":"F","20":"F","21":"T","22":"T","24":"F","25":"F","29":"T","31":"F","32":"F","33":"F","34":"T","35":"T","36":"F","37":"T","38":"F","39":"T","40":"T","41":"F","42":"T","44":"F","45":"F","46":"T","47":"T","48":"T","49":"F","50":"F","51":"T","53":"F","54":"F","55":"T","56":"F","57":"T","58":"T","59":"F","60":"T","61":"T","62":"F","63":"F","65":"T","66":"T","67":"T","68":"T","69":"T","70":"F","71":"F","72":"F","73":"T","74":"F","75":"T","76":"T","77":"T","78":"F","80":"T","81":"F","83":"T","84":"F","85":"T","86":"F","87":"T","88":"T","89":"F","90":"T","91":"T","92":"F","94":"F","95":"F","96":"T","97":"F","98":"F","99":"F","100":"T","101":"F","102":"T","103":"T","104":"F","105":"T","106":"T","107":"T","108":"F","109":"T","110":"F","111":"T","113":"F","114":"T","115":"T","116":"T","117":"F","118":"T","119":"F","121":"T","122":"F","123":"F","124":"T","125":"T","126":"F","127":"T","128":"T","129":"F","131":"T","132":"F","133":"T","134":"T","135":"F","136":"F","137":"T","138":"T","139":"T","140":"F","141":"T","142":"F","143":"F","144":"T","145":"F","146":"T","147":"F","148":"T","149":"F","150":"T","151":"F","152":"T","153":"F","154":"T","155":"T","156":"T","157":"T","158":"F","159":"F","160":"T","161":"F","162":"F","163":"T","164":"T","165":"F","166":"T","167":"T","168":"T","169":"F","170":"F","171":"T","172":"F","173":"F","174":"T","175":"F","177":"F","178":"T","179":"T","180":"F","181":"F","182":"T","183":"T","184":"F","185":"F","186":"F","187":"T","188":"F","189":"T","190":"F","191":"F","192":"F","193":"T","194":"T","195":"F","196":"T","197":"T","198":"T","199":"F","200":"F"}', '{"23":"F","26":"F","27":"T","28":"T","30":"F","43":"F","52":"F","64":"T","79":"F","82":"T","93":"T","112":"F","120":"T","130":"T","176":"T"}', '[]', 185, 15, 37.00, 0.75, 36.25, 90.62, 'P-1', 1, 4, 'B', 'o', '2017-08-22 16:53:06', 'admin@bigm-bd.com', NULL, NULL, 1),
(175, 3, 822, '2', '17172066', '2017', '1', '7', '1', '2', ',4,31', 50, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', '{"1":"F","2":"F","3":"T","4":"F","5":"T","6":"F","7":"T","8":"T","9":"T","10":"F","11":"T","13":"F","14":"F","15":"T","16":"T","17":"F","18":"F","19":"F","20":"F","21":"T","22":"T","23":"T","24":"F","25":"F","26":"T","27":"F","28":"F","29":"T","30":"T","31":"F","33":"F","34":"T","36":"F","37":"T","38":"F","39":"T","41":"F","42":"T","43":"T","44":"F","45":"F","46":"T","47":"T","48":"T","49":"F","50":"F","51":"T","52":"T","53":"F","54":"F","55":"T","56":"F","57":"T","58":"T","59":"F","60":"T","61":"T","62":"F","63":"F","64":"F","65":"T","66":"T","67":"T","68":"T","69":"T","70":"F","71":"F","72":"F","73":"T","74":"F","75":"T","76":"T","77":"T","78":"F","79":"T","80":"T","81":"F","82":"F","83":"T","84":"F","85":"T","86":"F","87":"T","88":"T","89":"F","90":"T","91":"T","92":"F","93":"F","94":"F","96":"T","97":"F","98":"F","99":"F","100":"T","101":"F","102":"T","103":"T","104":"F","105":"T","106":"T","107":"T","109":"T","110":"F","111":"T","113":"F","115":"T","116":"T","117":"F","118":"T","119":"F","120":"F","121":"T","122":"F","123":"F","124":"T","125":"T","126":"F","127":"T","128":"T","129":"F","130":"F","131":"T","132":"F","133":"T","134":"T","135":"F","136":"F","137":"T","138":"T","139":"T","140":"F","141":"T","142":"F","143":"F","144":"T","145":"F","146":"T","147":"F","148":"T","149":"F","150":"T","151":"F","152":"T","153":"F","154":"T","155":"T","156":"T","157":"T","158":"F","159":"F","160":"T","161":"F","162":"F","163":"T","164":"T","165":"F","166":"T","167":"T","168":"T","169":"F","170":"F","171":"T","172":"F","173":"F","174":"T","175":"F","177":"F","178":"T","179":"T","180":"F","181":"F","182":"T","183":"T","184":"F","185":"F","190":"F","191":"F","192":"F","193":"T","194":"T","195":"F","196":"T","197":"T","199":"F","200":"F"}', '{"12":"F","32":"T","35":"F","40":"F","95":"T","108":"T","112":"F","114":"F","176":"T","186":"T","187":"F","188":"T","189":"F","198":"F"}', '[]', 186, 14, 37.20, 0.70, 36.50, 91.25, 'G-1', 1, 3, 'A', '.', '2017-08-22 16:53:05', 'admin@bigm-bd.com', NULL, NULL, 1),
(176, 3, 827, '2', '17172077', '2017', '1', '7', '2', '2', ',4,31', 64, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin@bigm-bd.com', NULL, NULL, 1),
(177, 3, 835, '2', '17172150', '2017', '1', '7', '1', '2', ',4,31', 28, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', '{"1":"F","2":"F","3":"T","4":"F","5":"T","6":"F","7":"T","8":"T","9":"T","10":"F","11":"T","12":"T","15":"T","21":"T","22":"T","24":"F","25":"F","26":"T","29":"T","30":"T","31":"F","32":"F","34":"T","35":"T","37":"T","39":"T","40":"T","42":"T","43":"T","49":"F","50":"F","51":"T","53":"F","54":"F","58":"T","60":"T","61":"T","65":"T","67":"T","68":"T","69":"T","70":"F","71":"F","72":"F","73":"T","74":"F","75":"T","76":"T","77":"T","79":"T","80":"T","81":"F","83":"T","85":"T","89":"F","91":"T","96":"T","97":"F","98":"F","100":"T","102":"T","103":"T","105":"T","108":"F","110":"F","111":"T","112":"T","114":"T","115":"T","116":"T","118":"T","121":"T","122":"F","123":"F","124":"T","125":"T","129":"F","130":"F","133":"T","135":"F","136":"F","137":"T","138":"T","140":"F","141":"T","144":"T","147":"F","149":"F","156":"T","157":"T","158":"F","159":"F","160":"T","162":"F","163":"T","165":"F","166":"T","167":"T","168":"T","169":"F","170":"F","171":"T","172":"F","173":"F","174":"T","175":"F","176":"F","177":"F","180":"F","181":"F","182":"T","183":"T","185":"F","186":"F","188":"F","190":"F","191":"F","192":"F","194":"T","195":"F","198":"T","199":"F","200":"F"}', '{"13":"T","14":"T","16":"F","17":"T","18":"T","19":"T","20":"T","23":"F","27":"T","28":"T","33":"T","36":"T","38":"T","41":"T","44":"T","45":"T","46":"F","47":"F","48":"F","52":"F","55":"F","56":"T","57":"F","59":"T","62":"T","63":"T","64":"T","66":"F","78":"T","82":"T","84":"T","86":"T","87":"F","88":"F","90":"F","92":"T","93":"T","94":"T","95":"T","99":"T","101":"T","104":"T","106":"F","107":"F","109":"F","113":"T","117":"T","119":"T","120":"T","126":"T","127":"F","128":"F","131":"F","132":"T","134":"F","139":"F","142":"T","143":"T","145":"T","146":"F","148":"F","150":"F","151":"T","152":"F","153":"T","154":"F","155":"F","161":"T","164":"F","178":"F","179":"F","184":"T","187":"F","189":"F","193":"F","196":"F","197":"F"}', '[]', 123, 77, 24.60, 3.85, 20.75, 51.88, 'P-1', 1, 34, 'B', 'u', '2017-08-22 16:53:07', 'admin@bigm-bd.com', NULL, NULL, 1),
(178, 3, 910, '2', '17177159', '2017', '1', '7', '2', '2', ',4,31', 55, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin@bigm-bd.com', NULL, NULL, 1),
(179, 3, 972, '2', '17172164', '2017', '1', '7', '1', '2', ',4,31', 9, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', '{"1":"F","2":"F","3":"T","4":"F","5":"T","6":"F","7":"T","8":"T","9":"T","10":"F","11":"T","13":"F","14":"F","15":"T","16":"T","17":"F","18":"F","19":"F","20":"F","21":"T","22":"T","23":"T","24":"F","25":"F","26":"T","27":"F","28":"F","29":"T","30":"T","31":"F","32":"F","33":"F","34":"T","35":"T","36":"F","37":"T","38":"F","39":"T","40":"T","41":"F","42":"T","45":"F","46":"T","47":"T","49":"F","50":"F","51":"T","52":"T","53":"F","54":"F","55":"T","56":"F","57":"T","60":"T","61":"T","62":"F","63":"F","64":"F","65":"T","66":"T","67":"T","68":"T","69":"T","70":"F","71":"F","72":"F","73":"T","74":"F","75":"T","76":"T","77":"T","78":"F","79":"T","80":"T","81":"F","82":"F","83":"T","84":"F","85":"T","86":"F","87":"T","88":"T","89":"F","90":"T","91":"T","92":"F","93":"F","94":"F","96":"T","98":"F","99":"F","100":"T","101":"F","103":"T","105":"T","106":"T","107":"T","108":"F","109":"T","110":"F","111":"T","113":"F","115":"T","116":"T","119":"F","120":"F","121":"T","122":"F","123":"F","124":"T","125":"T","126":"F","127":"T","128":"T","129":"F","130":"F","131":"T","132":"F","133":"T","134":"T","135":"F","136":"F","137":"T","138":"T","141":"T","142":"F","144":"T","145":"F","147":"F","148":"T","149":"F","150":"T","152":"T","153":"F","154":"T","156":"T","157":"T","158":"F","159":"F","160":"T","161":"F","162":"F","163":"T","164":"T","165":"F","166":"T","167":"T","168":"T","169":"F","170":"F","171":"T","172":"F","173":"F","174":"T","175":"F","176":"F","178":"T","179":"T","181":"F","182":"T","183":"T","184":"F","185":"F","186":"F","187":"T","188":"F","189":"T","190":"F","191":"F","192":"F","193":"T","194":"T","195":"F","196":"T","197":"T","198":"T","199":"F","200":"F"}', '{"12":"F","43":"F","44":"T","48":"F","58":"F","59":"T","95":"T","97":"T","102":"F","104":"T","112":"F","114":"F","117":"T","118":"F","139":"F","140":"T","143":"T","146":"F","151":"T","155":"F","177":"T","180":"T"}', '[]', 178, 22, 35.60, 1.10, 34.50, 86.25, 'P-1', 2, 7, 'B', 'f', '2017-08-22 16:53:06', 'admin@bigm-bd.com', NULL, NULL, 1),
(180, 3, 1081, '2', '1717172045', '2017', '1', '7', '1', '2', ',4,31', 129, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin@bigm-bd.com', NULL, NULL, 1),
(181, 4, 655, '3', '17173030', '2017', '1', '7', '1', '3', '32,35', 29, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', '{"1":"T","4":"T","7":"F","9":"F","10":"T","11":"T","12":"T","13":"F","14":"F","15":"T","16":"T","17":"T","19":"T","20":"T","21":"T","22":"T","23":"T","26":"F","28":"F","31":"F","38":"F","40":"T","42":"T","43":"T","44":"T","46":"T","48":"T","49":"T","52":"F","54":"F","55":"F","58":"T","63":"T","64":"F","65":"F","66":"T","68":"T","70":"T","73":"F","74":"T","76":"T","79":"T","80":"T","81":"T","83":"T","84":"T","86":"T","89":"T","90":"T","92":"T","93":"T","94":"T","97":"T","99":"T","102":"T","103":"T","106":"T","108":"T","111":"T","112":"T","115":"T","116":"F","117":"T","118":"F","119":"T","120":"T","121":"T","124":"T","125":"T","126":"T","128":"T","129":"T","131":"T","132":"T","135":"T","137":"T","138":"T","140":"T","141":"T","144":"T","145":"T","147":"T","149":"F","150":"F","151":"T","154":"T","155":"T","156":"F","157":"F","158":"T","160":"F","163":"T","164":"T","165":"T","166":"T","168":"T","173":"T","174":"T","179":"T","181":"T","182":"T","183":"T","186":"T","187":"T","191":"T","192":"T","193":"T","194":"F","195":"F","196":"T","197":"T","198":"T","199":"T"}', '{"2":"T","3":"T","5":"T","6":"F","8":"F","18":"T","24":"T","25":"T","27":"F","29":"F","30":"F","32":"T","33":"T","34":"F","35":"F","36":"T","37":"F","39":"F","41":"T","45":"T","47":"T","50":"T","51":"F","53":"F","56":"T","57":"T","59":"T","60":"T","61":"F","62":"F","67":"T","69":"T","71":"T","72":"F","75":"T","77":"T","78":"T","82":"T","85":"T","87":"T","88":"T","91":"T","95":"T","96":"T","98":"T","100":"T","101":"T","104":"T","105":"T","107":"T","109":"T","110":"T","113":"T","114":"T","122":"T","123":"T","127":"T","130":"T","133":"T","134":"T","136":"T","139":"T","142":"T","143":"T","146":"F","148":"T","152":"T","153":"T","159":"T","161":"T","162":"T","167":"T","169":"T","170":"T","171":"T","172":"T","175":"T","176":"T","177":"T","178":"T","180":"T","184":"T","185":"T","188":"T","189":"T","190":"T","200":"T"}', '[]', 113, 87, 22.60, 4.35, 18.25, 45.62, 'P-1', 1, 4, 'B', 'a', '2017-08-22 16:57:14', 'admin@bigm-bd.com', NULL, NULL, 1),
(182, 4, 803, '3', '17177137', '2017', '1', '7', '1', '3', '32,35', 68, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin@bigm-bd.com', NULL, NULL, 1),
(183, 4, 832, '3', '17173036', '2017', '1', '7', '1', '3', '32,35', 30, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', '{"1":"T","2":"F","3":"F","4":"T","5":"F","6":"T","9":"F","10":"T","11":"T","12":"T","14":"F","16":"T","17":"T","19":"T","20":"T","21":"T","22":"T","24":"F","25":"F","26":"F","27":"T","30":"T","35":"T","37":"T","40":"T","41":"F","45":"F","46":"T","47":"F","48":"T","49":"T","50":"F","51":"T","54":"F","55":"F","56":"F","57":"F","58":"T","60":"F","61":"T","62":"T","63":"T","64":"F","65":"F","67":"F","68":"T","70":"T","71":"F","72":"T","73":"F","74":"T","75":"F","76":"T","77":"F","78":"F","79":"T","80":"T","81":"T","82":"F","83":"T","84":"T","85":"F","86":"T","87":"F","88":"F","89":"T","90":"T","91":"F","92":"T","93":"T","94":"T","95":"F","97":"T","98":"F","99":"T","100":"F","102":"T","103":"T","104":"F","105":"F","106":"T","107":"F","108":"T","109":"F","111":"T","112":"T","113":"F","114":"F","115":"T","116":"F","117":"T","118":"F","120":"T","121":"T","123":"F","125":"T","126":"T","127":"F","129":"T","130":"F","131":"T","132":"T","133":"F","134":"F","135":"T","136":"F","137":"T","138":"T","140":"T","141":"T","142":"F","143":"F","144":"T","145":"T","147":"T","148":"F","150":"F","151":"T","152":"F","153":"F","155":"T","156":"F","158":"T","159":"F","160":"F","161":"F","162":"F","163":"T","164":"T","165":"T","166":"T","167":"F","168":"T","169":"F","170":"F","171":"F","172":"F","173":"T","174":"T","177":"F","178":"F","179":"T","180":"F","184":"F","185":"F","186":"T","187":"T","188":"F","189":"F","190":"F","191":"T","192":"T","193":"T","194":"F","195":"F","196":"T","197":"T"}', '{"7":"T","8":"F","13":"T","15":"F","18":"T","23":"F","28":"T","29":"F","33":"T","36":"T","38":"T","39":"F","42":"F","43":"F","44":"F","52":"T","53":"F","59":"T","66":"F","69":"T","96":"T","101":"T","110":"T","119":"F","122":"T","124":"F","128":"F","139":"T","146":"F","149":"T","154":"F","157":"T","175":"T","176":"T","181":"F","182":"F","183":"F","198":"F","199":"F","200":"T"}', '{"31":".","32":".","34":"."}', 157, 40, 31.40, 2.00, 29.40, 73.50, 'G-1', 1, 1, 'A', 'B', '2017-08-22 16:57:14', 'admin@bigm-bd.com', NULL, NULL, 1),
(184, 4, 837, '3', '17173001', '2017', '1', '7', '1', '3', '32,35', 38, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin@bigm-bd.com', NULL, NULL, 1),
(185, 4, 850, '3', '17173026', '2017', '1', '7', '1', '3', '32,35', 39, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin@bigm-bd.com', NULL, NULL, 1),
(186, 4, 852, '3', '17173140', '2017', '1', '7', '2', '3', '32,35', 62, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', '{"3":"F","4":"T","5":"F","6":"T","7":"F","8":"T","9":"F","10":"T","11":"T","13":"F","14":"F","16":"T","18":"F","19":"T","24":"F","25":"F","27":"T","29":"T","30":"T","32":"F","33":"F","35":"T","37":"T","38":"F","39":"T","42":"T","44":"T","45":"F","46":"T","48":"T","49":"T","51":"T","52":"F","56":"F","57":"F","58":"T","64":"F","65":"F","66":"T","70":"T","72":"T","73":"F","74":"T","75":"F","76":"T","77":"F","78":"F","79":"T","80":"T","81":"T","83":"T","84":"T","86":"T","91":"F","92":"T","93":"T","98":"F","99":"T","100":"F","101":"F","102":"T","103":"T","104":"F","105":"F","108":"T","110":"F","111":"T","112":"T","113":"F","114":"F","115":"T","120":"T","121":"T","123":"F","125":"T","128":"T","129":"T","135":"T","136":"F","137":"T","138":"T","139":"F","141":"T","142":"F","146":"T","147":"T","148":"F","149":"F","150":"F","152":"F","155":"T","157":"F","158":"T","160":"F","164":"T","167":"F","173":"T","174":"T","176":"F","177":"F","179":"T","180":"F","184":"F","185":"F","187":"T","189":"F","191":"T","192":"T","195":"F","197":"T","198":"T","199":"T","200":"F"}', '{"1":"F","2":"T","12":"F","15":"F","17":"F","20":"F","21":"F","22":"F","23":"F","26":"T","28":"T","31":"T","34":"F","36":"T","40":"F","41":"T","43":"F","47":"T","50":"T","53":"F","54":"T","55":"T","59":"T","60":"T","61":"F","62":"F","63":"F","67":"T","68":"F","69":"T","71":"T","82":"T","85":"T","87":"T","88":"T","89":"F","90":"F","94":"F","95":"T","96":"T","97":"F","106":"F","107":"T","109":"T","116":"T","117":"F","118":"T","119":"F","122":"T","124":"F","126":"F","127":"T","130":"T","131":"F","132":"F","133":"T","134":"T","140":"F","143":"T","144":"F","145":"F","151":"F","153":"T","154":"F","156":"T","159":"T","161":"T","162":"T","163":"F","165":"F","166":"F","168":"F","169":"T","170":"T","171":"T","172":"T","175":"T","178":"T","181":"F","182":"F","183":"F","186":"F","188":"T","190":"T","193":"F","194":"T","196":"F"}', '[]', 113, 87, 22.60, 4.35, 18.25, 45.62, 'P-1', 1, 5, 'B', 'Q', '2017-08-22 16:57:14', 'admin@bigm-bd.com', NULL, NULL, 1),
(187, 4, 932, '3', '17173009', '2017', '1', '7', '1', '3', '32,35', 30, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', '{"1":"T","2":"F","3":"F","4":"T","5":"F","9":"F","11":"T","12":"T","13":"F","15":"T","16":"T","17":"T","20":"T","21":"T","22":"T","23":"T","24":"F","25":"F","26":"F","27":"T","28":"F","29":"T","30":"T","33":"F","35":"T","37":"T","39":"T","40":"T","41":"F","44":"T","46":"T","47":"F","48":"T","50":"F","53":"T","54":"F","55":"F","56":"F","57":"F","58":"T","59":"F","60":"F","61":"T","62":"T","63":"T","64":"F","65":"F","66":"T","67":"F","68":"T","71":"F","72":"T","73":"F","74":"T","75":"F","76":"T","77":"F","79":"T","80":"T","81":"T","82":"F","83":"T","84":"T","85":"F","86":"T","91":"F","92":"T","94":"T","95":"F","98":"F","99":"T","100":"F","101":"F","102":"T","104":"F","106":"T","107":"F","108":"T","114":"F","117":"T","118":"F","119":"T","120":"T","121":"T","125":"T","126":"T","129":"T","130":"F","131":"T","132":"T","133":"F","134":"F","135":"T","136":"F","138":"T","140":"T","141":"T","144":"T","145":"T","146":"T","147":"T","151":"T","154":"T","155":"T","157":"F","158":"T","160":"F","161":"F","162":"F","163":"T","165":"T","166":"T","168":"T","171":"F","174":"T","177":"F","181":"T","183":"T","184":"F","186":"T","187":"T","188":"F","189":"F","190":"F","192":"T","193":"T","195":"F","196":"T","197":"T","200":"F"}', '{"6":"F","7":"T","8":"F","10":"F","14":"T","18":"T","19":"F","31":"T","32":"T","34":"F","36":"T","38":"T","42":"F","43":"F","45":"T","49":"F","51":"F","52":"T","69":"T","70":"F","78":"T","87":"T","88":"T","89":"F","90":"F","93":"F","96":"T","97":"F","103":"F","105":"T","109":"T","110":"T","111":"F","112":"F","113":"T","115":"F","116":"T","122":"T","123":"T","124":"F","127":"T","128":"F","137":"F","139":"T","142":"T","143":"T","148":"T","149":"T","150":"T","152":"T","153":"T","156":"T","159":"T","164":"F","167":"T","169":"T","170":"T","172":"T","173":"F","175":"T","176":"T","178":"T","179":"F","180":"T","182":"F","185":"T","191":"F","194":"T","198":"F","199":"F"}', '[]', 130, 70, 26.00, 3.50, 22.50, 56.25, 'P-1', 2, 2, 'B', 'B', '2017-08-22 16:57:14', 'admin@bigm-bd.com', NULL, NULL, 1),
(188, 4, 945, '3', '17173009', '2017', '1', '7', '0', '3', '32,35', 38, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', '{"1":"T","2":"F","3":"F","4":"T","5":"F","9":"F","11":"T","12":"T","13":"F","15":"T","16":"T","17":"T","20":"T","21":"T","22":"T","23":"T","24":"F","25":"F","26":"F","27":"T","28":"F","29":"T","30":"T","33":"F","35":"T","37":"T","39":"T","40":"T","41":"F","44":"T","46":"T","47":"F","48":"T","50":"F","53":"T","54":"F","55":"F","56":"F","57":"F","58":"T","59":"F","60":"F","61":"T","62":"T","63":"T","64":"F","65":"F","66":"T","67":"F","68":"T","71":"F","72":"T","73":"F","74":"T","75":"F","76":"T","77":"F","79":"T","80":"T","81":"T","82":"F","83":"T","84":"T","85":"F","86":"T","91":"F","92":"T","94":"T","95":"F","98":"F","99":"T","100":"F","101":"F","102":"T","104":"F","106":"T","107":"F","108":"T","114":"F","117":"T","118":"F","119":"T","120":"T","121":"T","125":"T","126":"T","129":"T","130":"F","131":"T","132":"T","133":"F","134":"F","135":"T","136":"F","138":"T","140":"T","141":"T","144":"T","145":"T","146":"T","147":"T","151":"T","154":"T","155":"T","157":"F","158":"T","160":"F","161":"F","162":"F","163":"T","165":"T","166":"T","168":"T","171":"F","174":"T","177":"F","181":"T","183":"T","184":"F","186":"T","187":"T","188":"F","189":"F","190":"F","192":"T","193":"T","195":"F","196":"T","197":"T","200":"F"}', '{"6":"F","7":"T","8":"F","10":"F","14":"T","18":"T","19":"F","31":"T","32":"T","34":"F","36":"T","38":"T","42":"F","43":"F","45":"T","49":"F","51":"F","52":"T","69":"T","70":"F","78":"T","87":"T","88":"T","89":"F","90":"F","93":"F","96":"T","97":"F","103":"F","105":"T","109":"T","110":"T","111":"F","112":"F","113":"T","115":"F","116":"T","122":"T","123":"T","124":"F","127":"T","128":"F","137":"F","139":"T","142":"T","143":"T","148":"T","149":"T","150":"T","152":"T","153":"T","156":"T","159":"T","164":"F","167":"T","169":"T","170":"T","172":"T","173":"F","175":"T","176":"T","178":"T","179":"F","180":"T","182":"F","185":"T","191":"F","194":"T","198":"F","199":"F"}', '[]', 130, 70, 26.00, 3.50, 22.50, 56.25, 'P-2', 3, 3, 'B', 'B', '2017-08-22 16:57:14', 'admin@bigm-bd.com', NULL, NULL, 1),
(189, 4, 1105, '3', '17173012', '2017', '1', '7', '1', '3', '32,35', 28, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin@bigm-bd.com', NULL, NULL, 1),
(190, 4, 1111, '3', '17173014', '2017', '1', '7', '0', '3', '32,35', 79, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', '{"1":"T","4":"T","5":"F","6":"T","7":"F","9":"F","10":"T","11":"T","12":"T","15":"T","16":"T","17":"T","20":"T","21":"T","22":"T","23":"T","27":"T","32":"F","33":"F","34":"T","35":"T","37":"T","39":"T","40":"T","42":"T","43":"T","44":"T","48":"T","49":"T","51":"T","53":"T","58":"T","62":"T","63":"T","65":"F","68":"T","70":"T","74":"T","76":"T","80":"T","82":"F","85":"F","86":"T","89":"T","90":"T","92":"T","93":"T","95":"F","96":"F","100":"F","102":"T","103":"T","104":"F","107":"F","109":"F","110":"F","111":"T","112":"T","113":"F","114":"F","117":"T","119":"T","121":"T","124":"T","125":"T","126":"T","128":"T","129":"T","132":"T","135":"T","136":"F","137":"T","138":"T","139":"F","140":"T","141":"T","144":"T","145":"T","146":"T","147":"T","149":"F","151":"T","154":"T","155":"T","158":"T","161":"F","162":"F","166":"T","168":"T","173":"T","174":"T","179":"T","181":"T","182":"T","183":"T","186":"T","187":"T","189":"F","190":"F","191":"T","192":"T","193":"T","200":"F"}', '{"2":"T","3":"T","8":"F","13":"T","14":"T","18":"T","19":"F","24":"T","25":"T","26":"T","28":"T","29":"F","30":"F","31":"T","36":"T","38":"T","41":"T","45":"T","46":"F","47":"T","50":"T","52":"T","54":"T","55":"T","56":"T","57":"T","59":"T","60":"T","61":"F","64":"T","66":"F","67":"T","69":"T","71":"T","72":"F","73":"T","75":"T","77":"T","78":"T","79":"F","81":"F","83":"F","84":"F","87":"T","88":"T","91":"T","94":"F","97":"F","98":"T","99":"F","101":"T","105":"T","106":"F","108":"F","115":"F","116":"T","118":"T","120":"F","122":"T","123":"T","127":"T","130":"T","131":"F","133":"T","134":"T","142":"T","143":"T","148":"T","150":"T","152":"T","153":"T","156":"T","157":"T","159":"T","160":"T","163":"F","164":"F","165":"F","167":"T","169":"T","170":"T","171":"T","172":"T","175":"T","176":"T","177":"T","178":"T","180":"T","184":"T","185":"T","188":"T","194":"T","195":"T","196":"F","197":"F","198":"F","199":"F"}', '[]', 103, 97, 20.60, 4.85, 15.75, 39.38, 'G-1', 1, 6, 'A', 'f', '2017-08-22 16:57:14', 'admin@bigm-bd.com', NULL, NULL, 1),
(191, 4, 1118, '3', '17173021', '2017', '1', '7', '0', '3', '32,35', 39, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin@bigm-bd.com', NULL, NULL, 1),
(192, 4, 1128, '3', '17173035', '2017', '1', '7', '0', '3', '32,35', 64, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin@bigm-bd.com', NULL, NULL, 1),
(193, 4, 1159, '3', '1717173042', '2017', '1', '7', '0', '3', '32,35', 28, 0, 6, '', 'E', '1-40', '1', '', 1, '.25', '40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin@bigm-bd.com', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sif_exam_result_mock`
--

CREATE TABLE `sif_exam_result_mock` (
  `id` int(11) NOT NULL,
  `doc_reg_no` varchar(20) DEFAULT NULL,
  `mock_no` int(11) DEFAULT NULL,
  `paper1` decimal(10,2) DEFAULT NULL,
  `paper2` decimal(10,2) DEFAULT NULL,
  `paper3` decimal(10,2) DEFAULT NULL,
  `percentage` decimal(10,2) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sif_exam_result_part2`
--

CREATE TABLE `sif_exam_result_part2` (
  `id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `doc_id` int(11) NOT NULL,
  `doc_reg_no` varchar(10) NOT NULL,
  `year` varchar(4) NOT NULL,
  `session` varchar(1) NOT NULL,
  `course_code` varchar(1) NOT NULL,
  `faculty_code` varchar(1) NOT NULL,
  `batch_code` varchar(1) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `exam_type` int(11) NOT NULL,
  `ans_type` varchar(1) NOT NULL,
  `neg_mark` varchar(10) DEFAULT NULL,
  `full_mark` varchar(10) DEFAULT NULL,
  `obtained_mark` float(6,2) DEFAULT NULL,
  `mark_percentage` float(6,2) DEFAULT NULL,
  `overall_pos` int(4) DEFAULT NULL,
  `subject_pos` int(4) DEFAULT NULL,
  `merit_pos` int(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(50) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='sif_exam_result';

-- --------------------------------------------------------

--
-- Table structure for table `sif_exam_type`
--

CREATE TABLE `sif_exam_type` (
  `id` int(10) NOT NULL,
  `exam_name` varchar(45) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(45) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` varchar(50) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sif_exam_type`
--

INSERT INTO `sif_exam_type` (`id`, `exam_name`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`) VALUES
(6, 'Class Test', '2017-02-11 10:38:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', 'admin@bigm-bd.com', '2'),
(7, 'Review Exam', '2017-02-06 07:08:07', 'admin@bigm-bd.com', '0000-00-00 00:00:00', 'admin@bigm-bd.com', '1'),
(8, 'Faculty Exam', '2017-02-06 07:08:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', 'admin@bigm-bd.com', '1'),
(9, 'Mock 1', '2017-02-06 07:08:50', 'admin@bigm-bd.com', '0000-00-00 00:00:00', 'admin@bigm-bd.com', '1'),
(10, 'Mock 2', '2017-02-06 07:09:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', 'admin@bigm-bd.com', '1');

-- --------------------------------------------------------

--
-- Table structure for table `sif_exe_stuff`
--

CREATE TABLE `sif_exe_stuff` (
  `id` int(11) NOT NULL,
  `exe_stuff_id` varchar(25) NOT NULL,
  `name` varchar(70) NOT NULL,
  `emp_type` int(1) NOT NULL,
  `joining_date` varchar(25) NOT NULL,
  `fath_name` varchar(70) NOT NULL,
  `mother_name` varchar(70) NOT NULL,
  `dob` varchar(15) NOT NULL,
  `gender` int(1) NOT NULL,
  `religion` int(1) NOT NULL,
  `nationality` varchar(12) NOT NULL,
  `na_id` varchar(25) NOT NULL,
  `pass_no` varchar(30) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `spouse_name` varchar(50) NOT NULL,
  `pouse_mobile` varchar(15) NOT NULL,
  `blood_gro` varchar(6) NOT NULL,
  `per_divi` varchar(10) NOT NULL,
  `per_dist` varchar(10) NOT NULL,
  `per_thana` varchar(10) NOT NULL,
  `per_address` varchar(10) NOT NULL,
  `mai_divi` varchar(10) NOT NULL,
  `mai_dist` varchar(11) NOT NULL,
  `mai_thana` varchar(10) NOT NULL,
  `mai_address` varchar(10) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(25) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` varchar(25) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sif_exe_stuff`
--

INSERT INTO `sif_exe_stuff` (`id`, `exe_stuff_id`, `name`, `emp_type`, `joining_date`, `fath_name`, `mother_name`, `dob`, `gender`, `religion`, `nationality`, `na_id`, `pass_no`, `mobile`, `telephone`, `email`, `spouse_name`, `pouse_mobile`, `blood_gro`, `per_divi`, `per_dist`, `per_thana`, `per_address`, `mai_divi`, `mai_dist`, `mai_thana`, `mai_address`, `photo`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`) VALUES
(1, '17080001', 'Md. Abdul Mannaf  Rana', 1, '2011-12-01', 'Mr. X', 'Mrs. Y', '1985-01-01', 1, 1, 'Bangladeshi', '', '', '01914979206', '0', '', '', '', 'O+', '', '', '', '', '', '', '', '', 'upload/exe_stuff_photo/01914979206.jpg', '2017-08-17 11:38:35', 'admin@bigm-bd.com', '0000-00-00 00:00:00', 'admin@bigm-bd.com', 1),
(2, '17080002', 'Md. Habibur Rahman', 1, '2012-02-01', 'Md. Abdul Aziz', 'Mst. Hafeza Begum', '1989-05-04', 1, 1, 'Bangladeshi', '', '', '01915100750', '0', 'habibur.genesis@gmail.com', 'Mst. Farlina Akter Jhuma ', '01983319383', 'B+', '03', '0339', '033985', 'vill. Moha', '03', '0339', '033985', 'vill. Moha', 'upload/exe_stuff_photo/01915100750.jpg', '2017-08-17 11:46:45', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sif_exe_stuff_edu_qualification`
--

CREATE TABLE `sif_exe_stuff_edu_qualification` (
  `id` int(11) NOT NULL,
  `exe_auto_id` int(11) NOT NULL COMMENT 'sif_exe_stuff table auto id',
  `exam_name` varchar(8) CHARACTER SET utf8 NOT NULL,
  `pass_year` int(5) NOT NULL,
  `exam_group` int(2) NOT NULL,
  `exam_board` int(2) NOT NULL,
  `exam_ins` varchar(90) CHARACTER SET utf8 NOT NULL,
  `exam_result` varchar(8) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sif_exe_stuff_edu_qualification`
--

INSERT INTO `sif_exe_stuff_edu_qualification` (`id`, `exe_auto_id`, `exam_name`, `pass_year`, `exam_group`, `exam_board`, `exam_ins`, `exam_result`) VALUES
(1, 2, 'S.S.C', 2006, 3, 1, 'Baraiporal high schoole', '3.38'),
(2, 2, 'H.S.C', 2008, 4, 12, 'SSTC ', '4.38'),
(3, 2, 'B.Sc/BA', 2013, 0, 0, 'Sharisha Bari College', '2nd ');

-- --------------------------------------------------------

--
-- Table structure for table `sif_faculty`
--

CREATE TABLE `sif_faculty` (
  `id` int(10) NOT NULL,
  `course_code` int(10) NOT NULL,
  `faculty_code` int(11) NOT NULL,
  `faculty_name` varchar(80) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` varchar(80) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` varchar(80) NOT NULL,
  `status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Table structure for table `sif_fee`
--

CREATE TABLE `sif_fee` (
  `id` int(11) NOT NULL,
  `course_code` int(2) NOT NULL,
  `ser_pack_id` int(2) NOT NULL,
  `fee_amount` varchar(20) NOT NULL,
  `old_fee_amount` int(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(30) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` varchar(30) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sif_fee`
--

INSERT INTO `sif_fee` (`id`, `course_code`, `ser_pack_id`, `fee_amount`, `old_fee_amount`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`) VALUES
(1, 1, 11, '17000', 13000, '2017-08-07 10:02:52', 'admin@bigm-bd.com', '0000-00-00 00:00:00', 'admin@bigm-bd.com', 1),
(2, 2, 32, '15000', 0, '2017-01-26 09:31:40', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(3, 1, 13, '6500', 5000, '2017-05-08 10:07:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', 'admin@bigm-bd.com', 1),
(4, 1, 15, '8000', 6000, '2017-05-08 10:08:17', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(5, 1, 14, '2000', 1500, '2017-05-08 10:08:36', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(6, 7, 11, '16000', 12000, '2017-08-11 10:44:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', 'admin@bigm-bd.com', 1),
(7, 7, 13, '6500', 5000, '2017-05-08 10:09:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(8, 7, 14, '2000', 1500, '2017-05-08 10:09:25', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(9, 7, 15, '12000', 9000, '2017-08-11 10:44:49', 'admin@bigm-bd.com', '0000-00-00 00:00:00', 'admin@bigm-bd.com', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sif_general_info`
--

CREATE TABLE `sif_general_info` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sif_general_info`
--

INSERT INTO `sif_general_info` (`id`, `name`, `tagline`, `email`, `fb_id`, `address`, `phone`, `website`, `logo`, `ah_stu_fee`, `ah_tec_payment`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`) VALUES
(1, 'Certificate in Medical Education :: CMEd', '', '', '', '', '', '', 'upload/logo/8749a2daa73ce2b3d49e967c380cca58.png', '1200.0000', '200.0028', '2017-03-01 10:31:48', '', '0000-00-00 00:00:00', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sif_genesis_question`
--

CREATE TABLE `sif_genesis_question` (
  `id` int(3) NOT NULL,
  `question` varchar(210) CHARACTER SET utf8 NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(90) CHARACTER SET utf8 NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` varchar(80) CHARACTER SET utf8 NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sif_genesis_question`
--

INSERT INTO `sif_genesis_question` (`id`, `question`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`) VALUES
(1, 'এই প্রতিষ্ঠানের শিক্ষক / শিক্ষার্থী এর নিকট হতে জেনে', '2017-03-09 03:24:23', 'admin@bigm-bd.com', '0000-00-00 00:00:00', 'admin@bigm-bd.com', 1),
(2, 'বন্ধু / কলিগ / ক্লাস মেট এর নিকট হতে জেনে', '2017-03-08 23:44:22', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(3, 'পোস্টার দেখে', '2017-03-08 23:44:36', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(4, 'লিফলেট হতে', '2017-03-08 23:44:54', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(5, 'লেকচার শীট দেখে', '2017-03-08 23:45:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(6, 'বি. সি. এস ক্লাস হতে', '2017-03-08 23:45:40', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(7, 'মডেল টেস্ট দিতে এসে', '2017-03-08 23:46:07', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(8, 'পিজি লাইব্রেরীর বিজ্ঞাপন হতে', '2017-03-08 23:46:45', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(9, 'এই প্রতিষ্ঠানের বাস সার্ভিস হতে', '2017-03-09 03:24:35', 'admin@bigm-bd.com', '0000-00-00 00:00:00', 'admin@bigm-bd.com', 1),
(10, 'ফেসবুক বিজ্ঞাপন হতে', '2017-03-08 23:47:35', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(11, 'SMS হতে', '2017-03-08 23:47:55', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(12, 'অন্যান্য', '2017-03-08 23:48:05', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(13, 'এই প্রতিষ্ঠানের প্রকাশিত বই হতে উৎসাহিত হয়ে', '2017-03-09 03:26:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sif_groups`
--

CREATE TABLE `sif_groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Table structure for table `sif_holiday`
--

CREATE TABLE `sif_holiday` (
  `id` int(10) NOT NULL,
  `holiday_topic` varchar(200) NOT NULL,
  `detail` text NOT NULL,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL,
  `duration` int(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(30) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` varchar(40) NOT NULL,
  `status` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sif_holiday`
--

INSERT INTO `sif_holiday` (`id`, `holiday_topic`, `detail`, `date_from`, `date_to`, `duration`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`) VALUES
(12, 'Friday', 'weekly holiday', '2017-01-13', '2017-01-15', 3, '2017-02-11 10:43:08', 'admin@bigm-bd.com', '2017-02-11 16:43:08', 'admin@bigm-bd.com', 1),
(19, 'asdf', 'asdf', '2017-01-09', '2017-01-10', 2, '2017-01-10 05:59:11', 'admin@bigm-bd.com', '2017-01-10 11:59:11', 'admin@bigm-bd.com', 1),
(20, 'adsfa', 'asdf', '2017-01-09', '2017-01-11', 1, '2017-01-09 12:15:47', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(21, 'mobile', 'asdfsd', '2017-01-10', '0000-00-00', 1, '2017-01-09 12:17:20', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(22, 'laptop', 'adf', '2017-01-09', '2017-01-12', 1, '2017-01-09 12:17:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(23, 'adfdsf', 'asdf', '2017-01-09', '2017-01-11', 2, '2017-01-09 12:21:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(24, 'sat', 'adf', '2017-01-09', '0000-00-00', 1, '2017-01-09 12:21:38', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sif_institute`
--

CREATE TABLE `sif_institute` (
  `id` int(10) NOT NULL,
  `institute_name` varchar(80) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(90) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` varchar(80) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `sif_login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sif_login_attempts`
--

INSERT INTO `sif_login_attempts` (`id`, `ip_address`, `login`, `time`) VALUES
(1, '::1', 'nahian@bigm-bd.com', 1513156163);

-- --------------------------------------------------------

--
-- Table structure for table `sif_medical_collage`
--

CREATE TABLE `sif_medical_collage` (
  `id` int(11) NOT NULL,
  `collage_name` varchar(80) CHARACTER SET utf8 NOT NULL,
  `collage_type` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(90) CHARACTER SET utf8 NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` varchar(80) CHARACTER SET utf8 NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(17, 'Cox\'s Bazar Medical College, Cox\'s Bazar', 'Govt', '2017-06-09 03:45:05', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
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
-- Table structure for table `sif_package_des`
--

CREATE TABLE `sif_package_des` (
  `id` int(10) NOT NULL,
  `description` varchar(60) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(40) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` varchar(60) NOT NULL,
  `status` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sif_package_des`
--

INSERT INTO `sif_package_des` (`id`, `description`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`) VALUES
(9, 'Lecture - 40', '2017-05-08 10:03:38', 'admin@bigm-bd.com', '2017-05-08 16:03:38', 'admin@bigm-bd.com', 1),
(10, 'Special Class', '2017-02-11 06:36:31', 'admin@bigm-bd.com', '2017-02-11 12:34:57', 'admin@bigm-bd.com', 1),
(11, 'Lecture Sheet', '2017-01-26 08:59:11', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(12, 'Class Test', '2017-01-26 08:59:20', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(13, 'Review Exam + Book Marking', '2017-01-26 08:59:31', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(14, 'Solve Class', '2017-01-26 08:59:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(15, 'Faculty Exam', '2017-01-26 08:59:51', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(16, 'Mock Test-I', '2017-05-08 10:02:00', 'admin@bigm-bd.com', '2017-05-08 16:02:00', 'admin@bigm-bd.com', 1),
(17, 'Mock Test-II', '2017-05-08 10:02:10', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(18, 'Mock Test-III', '2017-05-08 10:02:16', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(19, 'Exam Session', '2017-05-08 10:04:33', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sif_reference`
--

CREATE TABLE `sif_reference` (
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

CREATE TABLE `sif_result_process` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sif_result_process`
--

INSERT INTO `sif_result_process` (`id`, `exam_id`, `answer_sheet`, `result_sheet`, `correct_answers`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`) VALUES
(79, 3, 'upload/ans/A_RNA_CVS_240317_1_7_217.txt', 'upload/result/RNA_CVS_240317_1_7_217.txt', '["F","F","T","F","T","F","T","T","T","F","T","T","F","F","T","T","F","F","F","F","T","T","T","F","F","T","F","F","T","T","F","F","F","T","T","F","T","F","T","T","F","T","T","F","F","T","T","T","F","F","T","T","F","F","T","F","T","T","F","T","T","F","F","F","T","T","T","T","T","F","F","F","T","F","T","T","T","F","T","T","F","F","T","F","T","F","T","T","F","T","T","F","F","F","F","T","F","F","F","T","F","T","T","F","T","T","T","F","T","F","T","T","F","T","T","T","F","T","F","F","T","F","F","T","T","F","T","T","F","F","T","F","T","T","F","F","T","T","T","F","T","F","F","T","F","T","F","T","F","T","F","T","F","T","T","T","T","F","F","T","F","F","T","T","F","T","T","T","F","F","T","F","F","T","F","F","F","T","T","F","F","T","T","F","F","F","T","F","T","F","F","F","T","T","F","T","T","T","F","F"]', '2017-08-22 16:52:59', 'admin@bigm-bd.com', NULL, NULL, '1'),
(80, 4, 'upload/ans/Ans_RNA-Neuron19.txt', 'upload/result/D_80_180817_1_7_319.TXT,upload/result/D_80_180817_1_7_3_119.TXT', '["T","F","F","T","F","T","F","T","F","T","T","T","F","F","T","T","T","F","T","T","T","T","T","F","F","F","T","F","T","T","F","F","F","T","T","F","T","F","T","T","F","T","T","T","F","T","F","T","T","F","T","F","T","F","F","F","F","T","F","F","T","T","T","F","F","T","F","T","F","T","F","T","F","T","F","T","F","F","T","T","T","F","T","T","F","T","F","F","T","T","F","T","T","T","F","F","T","F","T","F","F","T","T","F","F","T","F","T","F","F","T","T","F","F","T","F","T","F","T","T","T","F","F","T","T","T","F","T","T","F","T","T","F","F","T","F","T","T","F","T","T","F","F","T","T","T","T","F","F","F","T","F","F","T","T","F","F","T","F","F","F","F","T","T","T","T","F","T","F","F","F","F","T","T","F","F","F","F","T","F","T","T","T","F","F","T","T","F","F","F","T","T","T","F","F","T","T","T","T","F","T","T","T","F","F","F","T","F","T","F","F","T","F","T","T","T","T","F","T","F","F","T","T","F","T","T","F","T","F","F","F","T","T","T","F","T","T","T","T","T","T","T","F","F","T","T","F","F","T","F","T","F","F","F","F","T","F","T","F","T","F","F","F","F","F","T","T","T","T","F","T","T","T","F","F","T","T","T","F","F","T","T","F","T","F","T","T","T","F","T","F","F","T","T","T","F","T","F","F","T","T","F","T","T","F","F","T","F","T","F","F","F","F","T","T","T","T","F","F","T","F","F","T","F","F","T","T","F","F","T","F","F","T","T","T","T","T","F","F","T","T","F","T","T","F","F","F","T","T","T","F","T","F","T","T","T","T","F","F","T","F","T","T","T","T","F","T","T","T","T","F","F","F","T","T","F","T","F","F","T","T","F","F","T","T","F","T","F","T","T","T","F","T","F","F","T","T","T","F","F","T","F","F","T","T","T","F","F","F","F","T","F","F","T","F","T","F","T","T","T","T","T","F","T","T","T","F","F","T","T","T","F","F","F","F","T","F","T","T","F","T","F","T","T","F","T","F","F","T","F","T","T","F","T","F","F","F","T","T","F","F","T","F","T","F","T","F","T","T","T","T","F","T","T","F","T","F","T","T","F","F","F","T","F","F","T","F","F","T","T","T","F","F","F","F","F","T","T","F","F"]', '2017-08-22 16:57:13', 'admin@bigm-bd.com', NULL, NULL, '1');

-- --------------------------------------------------------

--
-- Table structure for table `sif_room_type`
--

CREATE TABLE `sif_room_type` (
  `id` int(10) NOT NULL,
  `floor` varchar(40) NOT NULL,
  `room_name` varchar(40) NOT NULL,
  `capacity` int(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(35) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` varchar(35) NOT NULL,
  `status` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sif_room_type`
--

INSERT INTO `sif_room_type` (`id`, `floor`, `room_name`, `capacity`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`) VALUES
(1, '4th Floor', 'Seminar Room', 85, '2017-05-08 10:15:28', '', '2017-05-08 16:15:28', 'admin@bigm-bd.com', '1'),
(2, '4th Floor', 'Hall Room – 501', 40, '2017-05-08 10:11:13', 'admin@bigm-bd.com', '2017-05-08 16:11:13', 'admin@bigm-bd.com', '1'),
(3, '4th Floor', 'Hall Room- 502', 55, '2017-05-08 10:11:22', 'admin@bigm-bd.com', '2017-05-08 16:11:22', 'admin@bigm-bd.com', '1'),
(4, '4th Floor', 'Hall Room- 503', 55, '2017-05-08 10:11:47', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', '1'),
(5, '4th Floor', 'Class Room - 504', 25, '2017-05-08 10:12:17', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', '1'),
(6, '2nd Floor', 'LG- 301', 46, '2017-05-08 10:13:17', 'admin@bigm-bd.com', '2017-05-08 16:13:17', 'admin@bigm-bd.com', '1'),
(7, '2nd Floor', 'LG- 302', 56, '2017-05-08 10:13:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', '1'),
(8, '2nd Floor', 'LG- 303', 56, '2017-05-08 10:13:36', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', '1'),
(9, '2nd Floor', 'Seminar', 110, '2017-05-08 10:13:53', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', '1'),
(10, '4th Floor', 'Teacher Lounge', 12, '2017-05-08 10:14:53', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', '1'),
(11, '4th Floor', 'CM Room', 9, '2017-05-08 10:15:07', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', '1'),
(12, '4th Floor', 'Hall Room – 501,502,503', 180, '2017-06-09 04:38:04', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', '1'),
(13, '2nd Floor', 'LG- 301,302,303', 180, '2017-06-09 04:38:39', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', '1');

-- --------------------------------------------------------

--
-- Table structure for table `sif_schedule`
--

CREATE TABLE `sif_schedule` (
  `id` int(11) NOT NULL,
  `schedule_type` varchar(1) DEFAULT NULL,
  `schedule_name` varchar(50) DEFAULT NULL,
  `paper` varchar(10) DEFAULT NULL,
  `year` varchar(4) DEFAULT NULL,
  `session` varchar(1) DEFAULT NULL,
  `course_code` varchar(1) DEFAULT NULL,
  `faculty_code` varchar(1) DEFAULT NULL,
  `batch_code` varchar(1) DEFAULT NULL,
  `topic_id` varchar(50) DEFAULT NULL,
  `subject_id` varchar(50) DEFAULT NULL,
  `service_pack_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time_from` time DEFAULT NULL,
  `time_to` time DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `executive_id` int(11) DEFAULT NULL,
  `support_stuff_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(50) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '0 = False, 1 = True'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sif_schedule`
--

INSERT INTO `sif_schedule` (`id`, `schedule_type`, `schedule_name`, `paper`, `year`, `session`, `course_code`, `faculty_code`, `batch_code`, `topic_id`, `subject_id`, `service_pack_id`, `date`, `time_from`, `time_to`, `room_id`, `teacher_id`, `executive_id`, `support_stuff_id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`) VALUES
(1, 'R', 'Axon Lecture', '', '2017', '1', '7', NULL, '8', ',30,31', '67,75,71,54,53,29,49,62,65,77,35,46,34,32,55,36,57', 11, '2017-08-04', '14:30:00', '19:30:00', 9, 1, 0, 0, '2017-08-03 10:42:16', 'admin@bigm-bd.com', NULL, NULL, 1),
(2, 'R', '', '', '2017', '1', '7', NULL, '1', ',19', '', 11, '2017-08-07', '14:30:00', '19:30:00', 12, 1, 0, 0, '2017-08-07 10:45:15', 'admin@bigm-bd.com', '2017-08-06 22:45:15', 'admin@bigm-bd.com', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sif_service_pack`
--

CREATE TABLE `sif_service_pack` (
  `id` int(10) NOT NULL,
  `ser_pack` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(40) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` varchar(30) NOT NULL,
  `status` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sif_service_pack`
--

INSERT INTO `sif_service_pack` (`id`, `ser_pack`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`) VALUES
(11, 'Regular Batch', '2017-05-08 10:03:59', '', '0000-00-00 00:00:00', 'admin@bigm-bd.com', 1),
(13, 'Exam Batch', '2017-05-08 10:05:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(14, 'Mock Batch', '2017-05-08 10:06:02', '', '0000-00-00 00:00:00', 'admin@bigm-bd.com', 1),
(15, 'Special Batch', '2017-05-08 10:06:41', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sif_session`
--

CREATE TABLE `sif_session` (
  `id` int(10) NOT NULL,
  `ses_id` int(11) NOT NULL,
  `ses_name` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(40) NOT NULL,
  `updated_at` varchar(40) NOT NULL,
  `updated_by` datetime NOT NULL,
  `status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sif_session`
--

INSERT INTO `sif_session` (`id`, `ses_id`, `ses_name`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`) VALUES
(3, 7, 'July', '2017-02-11 07:04:50', 'admin@bigm-bd.com', '', '0000-00-00 00:00:00', '1'),
(4, 1, 'January', '2017-02-11 07:04:55', 'admin@bigm-bd.com', '', '0000-00-00 00:00:00', '2');

-- --------------------------------------------------------

--
-- Table structure for table `sif_sp_pd_rel`
--

CREATE TABLE `sif_sp_pd_rel` (
  `id` int(10) NOT NULL,
  `sp_id` int(11) NOT NULL COMMENT 'service pack id',
  `pd_id` int(11) NOT NULL COMMENT 'package description id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(40) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` varchar(40) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sif_sp_pd_rel`
--

INSERT INTO `sif_sp_pd_rel` (`id`, `sp_id`, `pd_id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`) VALUES
(9, 33, 12, '2017-01-26 09:04:19', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(10, 33, 13, '2017-01-26 09:04:19', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(11, 33, 14, '2017-01-26 09:04:19', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(19, 37, 11, '2017-02-11 06:33:35', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 2),
(20, 37, 13, '2017-02-11 06:33:35', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 2),
(21, 38, 13, '2017-02-11 08:09:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 2),
(22, 38, 14, '2017-02-11 08:09:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 2),
(23, 38, 15, '2017-02-11 08:09:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 2),
(29, 11, 9, '2017-05-08 10:03:59', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(30, 11, 10, '2017-05-08 10:03:59', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(31, 11, 11, '2017-05-08 10:03:59', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(32, 11, 12, '2017-05-08 10:03:59', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(33, 11, 13, '2017-05-08 10:03:59', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(34, 11, 15, '2017-05-08 10:03:59', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(35, 11, 16, '2017-05-08 10:03:59', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(36, 11, 17, '2017-05-08 10:03:59', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(37, 11, 18, '2017-05-08 10:03:59', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(38, 13, 13, '2017-05-08 10:05:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(39, 13, 14, '2017-05-08 10:05:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(40, 13, 16, '2017-05-08 10:05:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(41, 13, 17, '2017-05-08 10:05:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(42, 13, 18, '2017-05-08 10:05:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(43, 13, 19, '2017-05-08 10:05:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(44, 14, 16, '2017-05-08 10:06:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(45, 14, 17, '2017-05-08 10:06:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(46, 14, 18, '2017-05-08 10:06:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(47, 15, 10, '2017-05-08 10:06:41', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(48, 15, 11, '2017-05-08 10:06:41', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(49, 15, 12, '2017-05-08 10:06:41', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(50, 15, 16, '2017-05-08 10:06:41', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(51, 15, 17, '2017-05-08 10:06:41', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(52, 15, 18, '2017-05-08 10:06:41', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sif_subject`
--

CREATE TABLE `sif_subject` (
  `id` int(11) NOT NULL,
  `course_code` int(2) NOT NULL,
  `faculty_code` int(2) NOT NULL,
  `subject` varchar(90) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(40) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` varchar(40) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sif_subject`
--

INSERT INTO `sif_subject` (`id`, `course_code`, `faculty_code`, `subject`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`) VALUES
(6, 2, 2, 'Medicine', '2017-05-08 09:55:22', 'admin@bigm-bd.com', '0000-00-00 00:00:00', 'admin@bigm-bd.com', 1),
(7, 1, 1, 'General Sergery', '2017-02-11 06:15:04', 'admin@bigm-bd.com', '0000-00-00 00:00:00', 'admin@bigm-bd.com', 1),
(8, 1, 2, 'Radiology & Imaging', '2017-05-08 09:57:01', 'admin@bigm-bd.com', '0000-00-00 00:00:00', 'admin@bigm-bd.com', 1),
(9, 2, 3, 'Paediatrics', '2017-05-08 09:55:40', 'admin@bigm-bd.com', '0000-00-00 00:00:00', 'admin@bigm-bd.com', 1),
(10, 2, 3, 'Surgery', '2017-05-08 09:55:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', 'admin@bigm-bd.com', 1),
(11, 1, 1, 'Medicine', '2017-05-08 09:54:39', 'admin@bigm-bd.com', '0000-00-00 00:00:00', 'admin@bigm-bd.com', 1),
(12, 1, 1, 'Paediatrics', '2017-05-08 09:54:58', 'admin@bigm-bd.com', '0000-00-00 00:00:00', 'admin@bigm-bd.com', 1),
(13, 2, 1, 'Obs. & Gynae', '2017-05-08 09:56:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', 'admin@bigm-bd.com', 1),
(14, 1, 0, 'Radiotherapy', '2017-05-08 09:57:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', 'admin@bigm-bd.com', 1),
(15, 1, 0, 'Anaesthesiology', '2017-06-11 05:58:24', 'admin@bigm-bd.com', '0000-00-00 00:00:00', 'admin@bigm-bd.com', 1),
(16, 1, 0, 'Dermatology', '2017-05-08 09:57:51', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(17, 1, 0, 'Ophthalmology', '2017-05-08 09:58:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(18, 1, 0, 'ENT', '2017-05-08 09:58:07', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(19, 1, 0, 'Psychiarty', '2017-05-08 09:58:28', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(20, 1, 0, 'Microbiology', '2017-05-08 09:58:40', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(21, 1, 0, 'Biochemistry', '2017-05-08 09:58:56', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(22, 1, 0, 'Haematology', '2017-05-08 09:59:06', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(23, 1, 0, 'Histopathology', '2017-05-08 09:59:20', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(24, 1, 0, 'Physical Medicine', '2017-05-08 09:59:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(25, 1, 0, 'Obs. & Gynae', '2017-05-08 10:00:00', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(26, 2, 0, 'Dental Surgery', '2017-05-08 10:00:20', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(27, 1, 0, 'Urology', '2017-05-08 10:00:39', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(28, 7, 0, 'Internal Medicine', '2017-06-09 04:21:59', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(29, 7, 0, 'Cardiology', '2017-06-09 04:22:17', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(30, 7, 0, 'Neurology', '2017-06-09 04:22:29', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(31, 7, 0, 'Nephrology', '2017-06-09 04:22:45', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(32, 7, 0, 'Gastroenterology', '2017-06-09 04:22:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(33, 7, 0, 'Hepatology', '2017-06-09 04:23:07', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(34, 7, 0, 'Endocrinology & Metabolism', '2017-06-09 04:23:17', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(35, 7, 0, 'Critical Care Medicine', '2017-06-09 04:23:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(36, 7, 0, 'Haematology', '2017-06-09 04:23:41', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(37, 7, 0, 'Rheumatology', '2017-06-09 04:23:53', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(38, 7, 0, 'Pulmonology', '2017-06-09 04:24:04', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(39, 7, 0, 'Paediatrics', '2017-06-09 04:24:14', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(40, 7, 0, 'Neonatology', '2017-06-09 04:24:24', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(41, 7, 0, 'Paed. Haemato-Oncology', '2017-06-09 04:24:35', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(42, 7, 0, 'Paed. Gastroenterology', '2017-06-09 04:24:44', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(43, 7, 0, 'Paed. Nephrology', '2017-06-09 04:25:01', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(44, 7, 0, 'Paed. Neurology', '2017-06-09 04:25:32', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(45, 7, 0, 'Paed. Cardiology', '2017-06-09 04:25:43', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(46, 7, 0, 'Dermatology & Venereology', '2017-06-09 04:25:55', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(47, 7, 0, 'Physical Medicine & Rehabilitation', '2017-06-09 04:26:08', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(48, 7, 0, 'Psychiatry', '2017-06-09 04:26:24', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(49, 7, 0, 'Child Psychiatry', '2017-06-09 04:26:35', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(50, 7, 0, 'Oncology', '2017-06-09 04:26:54', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(51, 7, 0, 'Palliative Medicine', '2017-06-09 04:27:10', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(52, 7, 0, 'Transfusion Medicine', '2017-06-09 04:27:21', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(53, 7, 0, 'Cardio Vascular & Thoracic Sur.', '2017-06-09 04:27:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(54, 7, 0, 'Burn & Plastic Surgery', '2017-06-09 04:27:46', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(55, 7, 0, 'General Surgery', '2017-06-09 04:28:01', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(56, 7, 0, 'Neuro-surgery', '2017-06-09 04:28:11', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(57, 7, 0, 'Hepatobiliary & Pancreatic Sur.', '2017-06-09 04:28:24', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(58, 7, 0, 'Obstetrics & Gynaecology', '2017-06-09 04:28:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(59, 7, 0, 'Orthopaedic Surgery', '2017-06-09 04:28:49', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(60, 7, 0, 'Paediatric Surgery', '2017-06-09 04:29:04', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(61, 7, 0, 'Urology', '2017-06-09 04:29:16', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(62, 7, 0, 'Colorectal Surgery', '2017-06-09 04:29:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(63, 7, 0, 'Surgical Oncology', '2017-06-09 04:29:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(64, 7, 0, 'Ophthalmology', '2017-06-09 04:29:52', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(65, 7, 0, 'Community Ophthalmology', '2017-06-09 04:30:21', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(66, 7, 0, 'Otolaryngology (ENT)', '2017-06-09 04:30:35', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(67, 7, 0, 'Anaesthesiology', '2017-06-09 04:30:45', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(68, 7, 0, 'Radiology & Imaging', '2017-06-09 04:30:56', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(69, 7, 0, 'Pathology', '2017-06-09 04:31:11', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(70, 7, 0, 'Lab. Medicine', '2017-06-09 04:31:22', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(71, 7, 0, 'Biochemistry', '2017-06-09 04:31:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(72, 7, 0, 'Microbiology', '2017-06-09 04:31:48', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(73, 7, 0, 'Virology', '2017-06-09 04:32:00', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(74, 7, 0, 'Pharmacology', '2017-06-09 04:32:11', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(75, 7, 0, 'Anatomy', '2017-06-09 04:32:21', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(76, 7, 0, 'Physiology', '2017-06-09 04:32:30', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(77, 7, 0, 'Conservative Dentistry', '2017-06-09 04:32:39', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(78, 7, 0, 'Oral & Maxilofacial Surgery', '2017-06-09 04:32:49', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(79, 7, 0, 'Orthodontics', '2017-06-09 04:33:01', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(80, 7, 0, 'Prosthodontics', '2017-06-09 04:33:16', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(81, 8, 0, 'Anaesthesiology', '2017-08-04 10:07:28', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(82, 8, 0, 'Anatomy', '2017-08-04 10:07:41', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(83, 8, 0, 'Biochemistry', '2017-08-04 10:07:56', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(84, 8, 0, 'Burn & Plastic Surgery', '2017-08-04 10:08:10', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(85, 8, 0, 'Cardio Vascular & Thoracic Sur.', '2017-08-04 10:08:29', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(86, 8, 0, 'Cardiology', '2017-08-04 10:08:47', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(87, 8, 0, 'Child Psychiatry', '2017-08-04 10:09:12', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(88, 8, 0, 'Colorectal Surgery', '2017-08-04 10:09:36', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(89, 8, 0, 'Community Ophthalmology', '2017-08-04 10:10:04', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(90, 8, 0, 'Conservative Dentistry', '2017-08-04 10:10:24', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(91, 8, 0, 'Critical Care Medicine', '2017-08-04 10:10:45', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(92, 8, 0, 'Dermatology & Venereology', '2017-08-04 10:11:17', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(93, 8, 0, 'Endocrinology & Metabolism', '2017-08-04 10:11:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(94, 8, 0, 'Gastroenterology', '2017-08-04 10:11:50', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(95, 8, 0, 'General Surgery', '2017-08-04 10:12:07', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(96, 8, 0, 'Haematology', '2017-08-04 10:12:28', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(97, 8, 0, 'Hepatobiliary & Pancreatic Sur.', '2017-08-04 10:13:01', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(98, 8, 0, 'Hepatology', '2017-08-04 10:13:49', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(99, 8, 0, 'Internal Medicine', '2017-08-04 10:14:25', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(100, 8, 0, 'Lab. Medicine', '2017-08-04 10:14:45', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(101, 8, 0, 'Microbiology', '2017-08-04 10:15:05', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(102, 8, 0, 'Virology', '2017-08-04 10:15:25', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(103, 8, 0, 'Urology', '2017-08-04 10:15:39', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(104, 8, 0, 'Transfusion Medicine', '2017-08-04 10:16:02', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(105, 8, 0, 'Surgical Oncology', '2017-08-04 10:16:20', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(106, 8, 0, 'Rheumatology', '2017-08-04 10:16:40', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(107, 8, 0, 'Radiology & Imaging', '2017-08-04 10:17:20', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(108, 8, 0, 'Pulmonology', '2017-08-04 10:17:36', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(109, 8, 0, 'Psychiatry', '2017-08-04 10:17:51', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(110, 8, 0, 'Prosthodontics', '2017-08-04 10:18:07', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(111, 8, 0, 'Physiology', '2017-08-04 10:18:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(112, 8, 0, 'Physical Medicine & Rehabilitation', '2017-08-04 10:18:53', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(113, 8, 0, 'Pharmacology', '2017-08-04 10:19:08', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(114, 8, 0, 'Pathology', '2017-08-04 10:19:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(115, 8, 0, 'Palliative Medicine', '2017-08-04 10:19:52', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(116, 8, 0, 'Paediatrics', '2017-08-04 10:20:13', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(117, 8, 0, 'Paediatric Surgery', '2017-08-04 10:20:34', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(118, 8, 0, 'Paed. Neurology', '2017-08-04 10:21:16', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(119, 8, 0, 'Paed. Haemato-Oncology', '2017-08-04 10:21:38', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(120, 8, 0, 'Paed. Gastroenterology', '2017-08-04 10:22:03', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(121, 8, 0, 'Paed. Cardiolog', '2017-08-04 10:22:29', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(122, 8, 0, 'Otolaryngology (ENT)', '2017-08-04 10:22:59', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(123, 8, 0, 'Orthopaedic Surgery', '2017-08-04 10:23:19', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(124, 8, 0, 'Orthodontics', '2017-08-04 10:23:35', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(125, 8, 0, 'Oral & Maxilofacial Surgery', '2017-08-04 10:23:55', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(126, 8, 0, 'Ophthalmology', '2017-08-04 10:24:17', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(127, 8, 0, 'Oncology', '2017-08-04 10:24:39', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(128, 8, 0, 'Obstetrics & Gynaecology', '2017-08-04 10:25:01', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(129, 8, 0, 'Neurology', '2017-08-04 10:25:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(130, 8, 0, 'Neuro-surgery', '2017-08-04 10:25:47', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(131, 8, 0, 'Nephrology', '2017-08-04 10:26:18', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(132, 8, 0, 'Neonatology', '2017-08-04 10:26:55', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(133, 7, 0, 'Conservative Dentistry & Endodonntics', '2017-08-14 12:24:46', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(134, 8, 0, 'Conservative Dentistry & Endodonntics', '2017-08-14 12:25:03', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(135, 7, 0, 'Oral and Maxi. Surgery', '2017-08-14 12:25:15', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(136, 8, 0, 'Oral and Maxi. Surgery', '2017-08-14 12:25:22', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(137, 7, 0, 'Orthodontics', '2017-08-14 12:25:35', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(138, 8, 0, 'Orthodontics', '2017-08-14 12:25:41', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(139, 7, 0, 'Pedodontics', '2017-08-14 12:25:51', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(140, 8, 0, 'Pedodontics', '2017-08-14 12:25:58', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(141, 7, 0, 'Prosthodontics', '2017-08-14 12:26:10', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(142, 8, 0, 'Prosthodontics', '2017-08-14 12:26:15', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(143, 8, 0, 'OMS', '2017-08-17 10:26:41', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sif_subject_omr`
--

CREATE TABLE `sif_subject_omr` (
  `ID` int(11) NOT NULL,
  `SYMBLE` varchar(1) DEFAULT NULL,
  `SUB_CODE` varchar(2) DEFAULT NULL,
  `SUBJECT` varchar(40) DEFAULT NULL,
  `SUB_50` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sif_subject_omr`
--

INSERT INTO `sif_subject_omr` (`ID`, `SYMBLE`, `SUB_CODE`, `SUBJECT`, `SUB_50`) VALUES
(1, 'A', '01', 'Internal Medicine', 'Anaesthesiology'),
(2, 'a', '02', 'Cardiology', 'Biochemistry'),
(3, 'B', '03', 'Neurology', 'Cardiology'),
(4, 'b', '04', 'Nephrology', 'Cardiovascular Surgery'),
(5, 'C', '05', 'Gastroenterology', 'Dermatology & Venereology'),
(6, 'c', '06', 'Hepatology', 'Endocrinology & Metabolism'),
(7, 'D', '07', 'Endocrinology & Metabolism', 'Family Medicine'),
(8, 'd', '08', 'Critical Care Medicine', 'Feto-Maternal Medicine'),
(9, 'E', '09', 'Haematology', 'Gastroenterology'),
(10, 'e', '10', 'Rheumatology', 'General Surgery'),
(11, 'F', '11', 'Pulmonology', 'Gynaecological Oncology'),
(12, 'f', '12', 'Paediatrics', 'Haematology'),
(13, 'G', '13', 'Neonatology', 'Hepatology'),
(14, 'g', '14', 'Paediatric Haemato-Oncology', 'Histopathology'),
(15, 'H', '15', 'Paediatric Gastroenterology', 'Microbiology'),
(16, 'h', '16', 'Paediatric Nephrology', 'Neonatology'),
(17, 'I', '17', 'Paediatric Neurology', 'Nephrology'),
(18, 'i', '18', 'Paediatric Cardiology', 'Neurology'),
(19, 'J', '19', 'Dermatology & Venereology', 'Neuro-surgery'),
(20, 'j', '20', 'Physical Medicine & Rehabilitation', 'Obstetrics & Gynaecology'),
(21, 'K', '21', 'Psychiatry / Child Psychiatry', 'Ophthalmology'),
(22, 'k', '22', 'Oncology / Radiotherapy', 'Orthopaedic Surgery'),
(23, 'L', '23', 'Palliative / Transfusion Medicine', 'Otolaryngology (ENT)'),
(24, 'l', '24', 'Cardio Vascular & Thoracic Surgery', 'Paediatrics'),
(25, 'M', '25', 'Burn & Plastic Surgery', 'Paed. Gastroenterology'),
(26, 'm', '26', 'General Surgery', 'Paed. Haemato-Oncology'),
(27, 'N', '27', 'Neuro-Surgery', 'Paed. Nephrology'),
(28, 'n', '28', 'Hepatobiliary  & Pancreatic Surgery', 'Paed. Neurology'),
(29, 'O', '29', 'Obs & Gynae', 'Paed. Pulmonology'),
(30, 'o', '30', 'Orthopaedics Surgery', 'Paediatric Surgery'),
(31, 'P', '31', 'Paediatrics Surgery', 'Physical Medicine & Rehabilitation'),
(32, 'p', '32', 'Urology', 'Plastic & Reconstructive Surgery'),
(33, 'Q', '33', 'Colorectal Surgery', 'Psychiatry'),
(34, 'q', '34', 'Surgical Oncology', 'Pulmonology'),
(35, 'R', '35', 'Ophthalmology', 'Radiology & Imaging'),
(36, 'r', '36', 'Otolaryngology  (ENT)', 'Radiotherapy'),
(37, 'S', '37', 'Anaesthesiology', 'Reproductive Endocrinology'),
(38, 's', '38', 'Radiology & Imaging', 'Rheumatology'),
(39, 'T', '39', 'Pathology / Lab. Medicine', 'Thoracic Surgery'),
(40, 't', '40', 'Biochemistry', 'Transfusion Medicine'),
(41, 'U', '41', 'Microbiology / Virology', 'Tropical Medicine'),
(42, 'u', '42', 'Pharmacology', 'Urology'),
(43, 'V', '43', 'Anatomy / Physiology', 'Conservative Dentistry'),
(44, 'v', '44', 'Conservative Dentistry', 'Oral & Maxilofacial Surgery'),
(45, 'W', '45', 'Oral & Maxilofacial Surgery', 'Orthodontics'),
(46, 'w', '46', 'Orthodontics / Prosthodontics', 'Prosthodontics'),
(47, '.', '47', 'No. Subject Selecion', 'No. Subject Selecion'),
(48, '>', '48', 'Multi Subject Selecion', 'Multi Subject Selecion');

-- --------------------------------------------------------

--
-- Table structure for table `sif_teacher`
--

CREATE TABLE `sif_teacher` (
  `id` int(11) NOT NULL,
  `teacher_id` varchar(25) NOT NULL,
  `tec_name` varchar(70) NOT NULL,
  `tec_type` varchar(255) DEFAULT NULL,
  `fath_name` varchar(70) NOT NULL,
  `mother_name` varchar(70) NOT NULL,
  `dob` varchar(15) NOT NULL,
  `joining_date` date NOT NULL,
  `gender` int(1) NOT NULL,
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
  `photo` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(25) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` varchar(25) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sif_teacher`
--

INSERT INTO `sif_teacher` (`id`, `teacher_id`, `tec_name`, `tec_type`, `fath_name`, `mother_name`, `dob`, `joining_date`, `gender`, `religion`, `nationality`, `na_id`, `pass_no`, `mobile`, `telephone`, `email`, `bmdc_no`, `per_add`, `mai_add`, `spouse_name`, `pouse_mobile`, `blood_gro`, `per_divi`, `per_dist`, `per_thana`, `per_address`, `mai_divi`, `mai_dist`, `mai_thana`, `mai_address`, `photo`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`) VALUES
(1, '17100001', 'Prof. Humayun Kabir Chowdhury', 'Senior Tutor', 'Father Name', 'Mother Name', '1980-10-14', '2017-10-14', 0, 0, 'Bangladeshi', '09876543210987', '', '01911430370', '', 'hkabir@gmail.com', '423445', '', '', '', '', 'A+', '', '', '', '', '', '', '', '', 'upload/photo/17100001.jpg', '2017-10-13 22:05:24', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(2, '17100002', 'Prof. Tahmina Begum', 'Senior Tutor', 'Father Name', 'Mother Name', '1965-10-14', '2017-10-14', 0, 0, 'Bangladeshi', '09876543210987', '', '01911430345', '', 'tahmina@gmail.com', '423423', '', '', '', '', 'AB+', '', '', '', '', '', '', '', '', 'upload/photo/17100002.jpg', '2017-10-13 22:11:27', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(3, '17100003', 'Prof. Shah Alam', 'Senior Tutor', 'Father Name', 'Mother Name', '1985-10-14', '2017-10-14', 0, 0, 'Bangladeshi', '09876543210987', '', '01911430354', '', 'alam@gmail.com', '454554', '', '', '', '', 'B+', '', '', '', '', '', '', '', '', 'upload/photo/17100003.jpg', '2017-10-14 00:32:40', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sif_teacher_edu_qualification`
--

CREATE TABLE `sif_teacher_edu_qualification` (
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
-- Table structure for table `sif_teacher_evaluation`
--

CREATE TABLE `sif_teacher_evaluation` (
  `id` int(11) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `schedule_id` varchar(35) NOT NULL COMMENT 'schedule table auto id',
  `introduction` int(1) NOT NULL,
  `knowledge` int(1) NOT NULL,
  `express` int(1) NOT NULL,
  `interaction` int(1) NOT NULL,
  `suggestions` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(20) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sif_teacher_payment`
--

CREATE TABLE `sif_teacher_payment` (
  `id` int(11) NOT NULL,
  `teacher_id` varchar(11) NOT NULL COMMENT 'teacher unique id',
  `pay_for` varchar(10) NOT NULL,
  `date` datetime NOT NULL,
  `amount` float NOT NULL,
  `note` varchar(255) NOT NULL,
  `auth_by` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` varchar(100) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sif_topics`
--

CREATE TABLE `sif_topics` (
  `id` int(11) NOT NULL,
  `name` varchar(35) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` varchar(30) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` varchar(30) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sif_topics`
--

INSERT INTO `sif_topics` (`id`, `name`, `created_at`, `created_by`, `updated_at`, `updated_by`, `status`) VALUES
(2, 'virology', '2017-03-11 06:45:21', 'admin@bigm-bd.com', '0000-00-00 00:00:00', 'admin@bigm-bd.com', 2),
(3, 'Parasitology', '2017-05-08 10:16:03', 'admin@bigm-bd.com', '0000-00-00 00:00:00', 'admin@bigm-bd.com', 1),
(4, 'Mycology', '2017-05-08 10:16:11', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(5, 'Gen: Bacteriology', '2017-05-08 10:16:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(6, 'Sys: Bacteriology', '2017-05-08 10:16:56', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(7, 'Abdomen-I', '2017-05-08 10:17:29', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(8, 'Abdomen-II', '2017-05-08 10:17:37', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(9, 'Head Neck', '2017-05-08 10:17:48', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(10, 'Thorax', '2017-05-08 10:17:53', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(11, 'Extremity-I', '2017-05-08 10:18:22', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(12, 'Extremity-II', '2017-05-08 10:18:28', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(13, 'Embryology-I', '2017-05-08 10:18:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(14, 'Embryology-II', '2017-05-08 10:18:51', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(15, 'Histology-I', '2017-05-08 10:19:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(16, 'Histology-II', '2017-05-08 10:19:16', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(17, 'Endocrinology-I', '2017-05-08 10:19:35', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(18, 'Endocrinology-II', '2017-05-08 10:20:24', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(19, 'Neuroanatomy', '2017-05-08 10:20:33', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(20, 'Nervous System', '2017-05-08 10:20:42', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(21, 'Gen: Pharmacology', '2017-05-08 10:21:07', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(22, 'Sys: Pharmacology', '2017-05-08 10:21:20', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(23, 'Biostatistics', '2017-05-08 10:21:38', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(24, 'GIT Physiology', '2017-05-08 10:21:49', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(25, 'Metabolism, Vitamins & Minerals', '2017-05-08 10:22:20', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(26, 'CVS Physiology-I', '2017-05-08 10:22:52', 'admin@bigm-bd.com', '0000-00-00 00:00:00', 'admin@bigm-bd.com', 1),
(27, 'CVS Physiology-II', '2017-05-08 10:23:01', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(28, 'Cell Injury & Adaptation', '2017-05-08 10:23:25', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(29, 'Genetics', '2017-05-08 10:23:30', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(30, 'Neoplasm-I', '2017-05-08 10:24:18', 'admin@bigm-bd.com', '0000-00-00 00:00:00', 'admin@bigm-bd.com', 1),
(31, 'Neoplasm-II', '2017-05-08 10:24:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', 'admin@bigm-bd.com', 1),
(32, 'Repair, Regeneration, Healing & Hem', '2017-05-08 10:25:35', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(33, 'Immunology-I', '2017-05-08 10:26:01', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(34, 'Immunology-II', '2017-05-08 10:26:09', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(35, 'Respiratory System', '2017-05-08 10:26:31', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(36, 'General Physiology', '2017-05-08 10:26:47', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(37, 'Renal System', '2017-05-08 10:26:56', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(38, 'Body Fluid, Acid Base Balance .....', '2017-05-08 10:27:26', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(39, 'Blood', '2017-05-08 10:27:49', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(40, 'Haematology', '2017-05-08 10:27:58', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(41, 'Cardiology-I', '2017-05-08 10:29:50', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(42, 'Cardiology-II', '2017-05-08 10:29:57', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(43, 'Neurology-I', '2017-05-08 10:30:18', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(44, 'Neurology-II', '2017-05-08 10:30:31', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(45, 'Nephrology-I', '2017-05-08 10:30:41', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(46, 'Nephrology-II', '2017-05-08 10:30:50', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(47, 'Good Medical Practice', '2017-05-08 10:31:10', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(48, 'Endocrinology Clinical-I', '2017-05-08 10:32:36', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(49, 'Endocrinology Clinical-II', '2017-05-08 10:32:43', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1),
(50, 'Endocrinology Clinical-III', '2017-05-08 10:32:49', 'admin@bigm-bd.com', '0000-00-00 00:00:00', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sif_users`
--

CREATE TABLE `sif_users` (
  `id` int(11) UNSIGNED NOT NULL,
  `teacher_id` varchar(20) NOT NULL COMMENT 'Teacher ID',
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `password_view` varchar(100) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `image` varchar(200) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Yes = 1, No = 0',
  `status` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sif_users`
--

INSERT INTO `sif_users` (`id`, `teacher_id`, `ip_address`, `username`, `password`, `password_view`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `image`, `deleted`, `status`) VALUES
(2, '0', '::1', 'admin@bigm-bd.com', '$2y$08$V8xS9dtX9i7VhC86rb9uhecdQfNitkGWG8WgKMAmK.IieL6eKrmwq', '123456', NULL, 'admin@bigm-bd.com', NULL, NULL, NULL, '0/nFTNbJeXhNmu7oWHGnru', 1474185190, 1513171826, 1, 'Admin', 'Istrator', '', '', '', 0, 1),
(9, '17020003', '::1', '01717036048', '$2y$08$cToKUuV32uuKvqc9jZpzcOWiuZvegp90NnIGg9owvUWZdYabrUvDW', 'VyjD2yrd', NULL, 'nahian@bigm-bd.com', NULL, NULL, NULL, 'H2xon8TCQZKt2G9stmeJ8O', 1485946628, 1499952387, 1, 'Julkar', 'Nahian', NULL, NULL, 'upload/photo/Sh_(2).jpg', 0, 1),
(10, '17020004', '::1', '01911430370', '$2y$08$kKu5VAoL1Pg/A9uMk3pqp.A0tTiVNng2260gmv4OQU1bZbMN.5fJG', 'RJ42Ahep', NULL, 'mamun@bigm-bd@gmail.com', NULL, NULL, NULL, 'J9DXWoK0yhyvUds2npcm8O', 1485947522, 1487493413, 1, 'Abdullah', 'Mamun', NULL, NULL, 'upload/photo/17020004.jpg', 0, 1),
(11, '17020005', '::1', '01700000000', '$2y$08$GA6gMUvRsApB1EVZmk43gO9OEvsoL88lSF5sheWD0EpLdPXzgA2ei', 'y0PNd2Gl', NULL, 'nazmulhasan.cse@gmail.com', NULL, NULL, NULL, 'NPswS51Gksq0zDC690T9nu', 1486811723, 1488950053, 1, 'jahir', 'abbaus', NULL, '01700000000', 'upload/photo/17020005.jpg', 0, 1),
(12, '5', '::1', '0912740', '$2y$08$lc33tI7xvW3fom/RstCgyu0chKj6a53gII1uXATEnIjiXublNwrJm', '123456', NULL, 'nazmulhasan.cse@gmail.com', NULL, NULL, NULL, 'sUI6l4pWRqZKXutAP8oCE.', 1488264751, 1488950374, 1, 'Nazmul', 'Hasan', 'GENESIS', '01738750676', 'upload/exe_stuff_photo/300X300-r.jpg', 0, 1),
(13, '6', '::1', '9817419', '$2y$08$VoGYRHHLj4Ou4QQD6B6WteUHkR7QdnmWlKVya8Z2PSgl9ROXQgvq6', 'nazmul123', NULL, 'nazmulhasan.cse@gmail.com', NULL, NULL, NULL, '/UwO3n7LDdb9J.C1Zll03O', 1488264856, 1488275932, 1, 'Nazmul', 'Hasan', 'GENESIS', '01738750676', 'upload/exe_stuff_photo/01700000000.jpg', 0, 1),
(14, '17080012', '45.64.137.218', '789687', '$2y$08$BGbr4PTVdqU2bVmqk1R4XeDtkPgui2w6TFPwsWloJaHd2sn7zXfpW', 'scoqN8', NULL, 'jksabf@kjsafb.asf', NULL, NULL, NULL, NULL, 1501585274, NULL, 1, 'kjasbfjksbkj', 'kjasbfjksbkj', NULL, '64654564651', 'upload/photo/17080012.jpg', 0, 1),
(15, '17080013', '45.64.137.218', '234123', '$2y$08$RjZuwdbjgRHJFvN7EV0sOuyLizDTNO4sSXp/dqOzFKtwqrwXZzbyy', 'Shgbc5', NULL, 'a@yahoo.com', NULL, NULL, NULL, NULL, 1501585734, NULL, 1, 'asdfdsf', 'asdfdsf', NULL, '01700000000', 'upload/photo/17080013.jpg', 0, 1),
(16, '17080014', '45.64.137.218', '45432334', '$2y$08$hSLGFkPznrhitxIrC2fRLeiy8Ivcckql.0jTje5q6plu5K.htt3Au', 'MrhtYY', NULL, 'a@yahoo.com', NULL, NULL, NULL, NULL, 1501586469, NULL, 1, 'testsdfds', 'testsdfds', NULL, '01700000000', 'upload/photo/17080014.jpg', 0, 1),
(17, '17080015', '45.64.137.218', '147852', '$2y$08$agpTZEPdA9AZ6.WBq0jDfewLebKoRAVzSP2av1.jZYIfr7gJhfcVG', 'QCUdBD', NULL, 'a@yahoo.com', NULL, NULL, NULL, 'AMmmd6W1XevycM2zYbDcRu', 1501586548, 1501586664, 1, 'dsfgdfsg', 'dsfgdfsg', NULL, '01700000000', 'upload/photo/17080015.jpg', 0, 1),
(18, '17080001', '45.64.137.218', '50000', '$2y$08$T1AUyQ1KygY.z7MUF71/OexOYyH/NHNYycBOgjibEZwV2noRs//qa', 'Y2CWT9', NULL, 'genesis.mithu@gmail.com', NULL, NULL, NULL, 'IRByqXhBMV3IpZDxlti.j.', 1501756908, 1507871934, 1, 'SS', 'SS', NULL, '01712423410', 'upload/photo/170800011.jpg', 0, 1),
(19, '17080002', '45.64.137.218', 'A-46878', '$2y$08$9M/A6BcH8FEccfAk2W45D.kl2OGiI6dmgQOrR0TbZ.pd/lriIjr/2', 'XbsOVe', NULL, 'rafe.dr@gmail.com', NULL, NULL, NULL, 'rsKoMKebC/K/Rh9oIBgzb.', 1502967874, 1507744237, 1, 'DR.', 'RAFE', NULL, '01711271806', 'upload/photo/170800021.jpg', 0, 1),
(20, '17080003', '45.64.137.218', 'xxxxx', '$2y$08$ZkuC6GFkNNsCh4M4ytjrE.4WPrHvybppCbC04oWROfJQiXCTxtxbW', 'EJ7txR', NULL, 'genesis.mithu@gmail.com', NULL, NULL, NULL, 'eTig5VrpoVRhw8MYFgm39.', 1502969000, 1505325167, 1, 'Dr.', 'Rahman', NULL, '01711958305', 'upload/photo/170800032.jpg', 0, 1),
(21, '17100004', '::1', 'wapykegoza@gmail.com', '$2y$08$Mha8GuOQxkkz6xh35PUijukUGikL2lSvh2uCuynokR848pJ8gP5NS', 'TKY1A0', NULL, 'wapykegoza@gmail.com', NULL, NULL, NULL, NULL, 1506957668, NULL, 1, 'Vera', 'Norris', NULL, '39567650252', 'upload/photo/17100004.jpg', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sif_users_groups`
--

CREATE TABLE `sif_users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sif_users_groups`
--

INSERT INTO `sif_users_groups` (`id`, `user_id`, `group_id`) VALUES
(3, 2, 1),
(8, 8, 4),
(9, 9, 4),
(10, 10, 4),
(11, 11, 4),
(19, 12, 3),
(17, 13, 2),
(20, 14, 4),
(21, 15, 4),
(22, 16, 4),
(23, 17, 4),
(24, 18, 4),
(25, 19, 4),
(26, 20, 4),
(27, 21, 4);

-- --------------------------------------------------------

--
-- Table structure for table `sif_visitor`
--

CREATE TABLE `sif_visitor` (
  `id` int(11) NOT NULL,
  `name` varchar(70) NOT NULL,
  `visitor_type` int(1) NOT NULL,
  `purpose` varchar(250) NOT NULL,
  `med_coll` varchar(120) NOT NULL,
  `course` varchar(80) NOT NULL,
  `subject` varchar(90) NOT NULL,
  `degree` varchar(40) NOT NULL,
  `mobile` varchar(40) NOT NULL,
  `email` varchar(35) NOT NULL,
  `created_by` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` varchar(30) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `thanas`
--

CREATE TABLE `thanas` (
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
('022224', '0222', '24', 'COX\'S BAZAR SADAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '????????? ???', NULL),
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

CREATE TABLE `unit_attachments` (
  `id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `unit_attachments`
--

INSERT INTO `unit_attachments` (`id`, `unit_id`, `title`, `desc`, `attachment`, `created_at`, `status`) VALUES
(2, 0, 'Once Again', '', '', NULL, 1),
(3, 11, 'asfsafsa', '', '', NULL, 1),
(4, 13, '', '', '', '2017-12-13 00:16:45', 1),
(5, 14, '', '', '', '2017-12-13 00:19:18', 1),
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
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `sif_admission`
--
ALTER TABLE `sif_admission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sif_admission_transition`
--
ALTER TABLE `sif_admission_transition`
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
-- Indexes for table `sif_doc_payment`
--
ALTER TABLE `sif_doc_payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sif_edu_qualification`
--
ALTER TABLE `sif_edu_qualification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sif_exam`
--
ALTER TABLE `sif_exam`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sif_exam_fcps_part2`
--
ALTER TABLE `sif_exam_fcps_part2`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sif_exam_result`
--
ALTER TABLE `sif_exam_result`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sif_exam_result_mock`
--
ALTER TABLE `sif_exam_result_mock`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sif_exam_result_part2`
--
ALTER TABLE `sif_exam_result_part2`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sif_exam_type`
--
ALTER TABLE `sif_exam_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sif_exe_stuff`
--
ALTER TABLE `sif_exe_stuff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sif_exe_stuff_edu_qualification`
--
ALTER TABLE `sif_exe_stuff_edu_qualification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sif_faculty`
--
ALTER TABLE `sif_faculty`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sif_fee`
--
ALTER TABLE `sif_fee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sif_general_info`
--
ALTER TABLE `sif_general_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sif_genesis_question`
--
ALTER TABLE `sif_genesis_question`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sif_groups`
--
ALTER TABLE `sif_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sif_holiday`
--
ALTER TABLE `sif_holiday`
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
-- Indexes for table `sif_package_des`
--
ALTER TABLE `sif_package_des`
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
-- Indexes for table `sif_room_type`
--
ALTER TABLE `sif_room_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sif_schedule`
--
ALTER TABLE `sif_schedule`
  ADD PRIMARY KEY (`id`,`status`);

--
-- Indexes for table `sif_service_pack`
--
ALTER TABLE `sif_service_pack`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sif_session`
--
ALTER TABLE `sif_session`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sif_sp_pd_rel`
--
ALTER TABLE `sif_sp_pd_rel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sif_subject`
--
ALTER TABLE `sif_subject`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sif_subject_omr`
--
ALTER TABLE `sif_subject_omr`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sif_teacher`
--
ALTER TABLE `sif_teacher`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sif_teacher_evaluation`
--
ALTER TABLE `sif_teacher_evaluation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sif_teacher_payment`
--
ALTER TABLE `sif_teacher_payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sif_topics`
--
ALTER TABLE `sif_topics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sif_users`
--
ALTER TABLE `sif_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`) USING BTREE;

--
-- Indexes for table `sif_users_groups`
--
ALTER TABLE `sif_users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`) USING BTREE,
  ADD KEY `fk_users_groups_users1_idx` (`user_id`) USING BTREE,
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`) USING BTREE;

--
-- Indexes for table `sif_visitor`
--
ALTER TABLE `sif_visitor`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `assignments`
--
ALTER TABLE `assignments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `assignments_reply`
--
ALTER TABLE `assignments_reply`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
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
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `designation`
--
ALTER TABLE `designation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `doc_experience`
--
ALTER TABLE `doc_experience`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `doc_training`
--
ALTER TABLE `doc_training`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `feedbacks`
--
ALTER TABLE `feedbacks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `general_info`
--
ALTER TABLE `general_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `module_units`
--
ALTER TABLE `module_units`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `notice`
--
ALTER TABLE `notice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `sif_admission`
--
ALTER TABLE `sif_admission`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `sif_admission_transition`
--
ALTER TABLE `sif_admission_transition`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sif_batch`
--
ALTER TABLE `sif_batch`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;
--
-- AUTO_INCREMENT for table `sif_class_topic`
--
ALTER TABLE `sif_class_topic`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1993;
--
-- AUTO_INCREMENT for table `sif_course`
--
ALTER TABLE `sif_course`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sif_doc_master`
--
ALTER TABLE `sif_doc_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `sif_doc_payment`
--
ALTER TABLE `sif_doc_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sif_edu_qualification`
--
ALTER TABLE `sif_edu_qualification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `sif_exam`
--
ALTER TABLE `sif_exam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `sif_exam_fcps_part2`
--
ALTER TABLE `sif_exam_fcps_part2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sif_exam_result`
--
ALTER TABLE `sif_exam_result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=194;
--
-- AUTO_INCREMENT for table `sif_exam_result_mock`
--
ALTER TABLE `sif_exam_result_mock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sif_exam_result_part2`
--
ALTER TABLE `sif_exam_result_part2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sif_exam_type`
--
ALTER TABLE `sif_exam_type`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `sif_exe_stuff`
--
ALTER TABLE `sif_exe_stuff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sif_exe_stuff_edu_qualification`
--
ALTER TABLE `sif_exe_stuff_edu_qualification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `sif_faculty`
--
ALTER TABLE `sif_faculty`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `sif_fee`
--
ALTER TABLE `sif_fee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `sif_general_info`
--
ALTER TABLE `sif_general_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sif_genesis_question`
--
ALTER TABLE `sif_genesis_question`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `sif_groups`
--
ALTER TABLE `sif_groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `sif_holiday`
--
ALTER TABLE `sif_holiday`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `sif_institute`
--
ALTER TABLE `sif_institute`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `sif_login_attempts`
--
ALTER TABLE `sif_login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sif_medical_collage`
--
ALTER TABLE `sif_medical_collage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;
--
-- AUTO_INCREMENT for table `sif_package_des`
--
ALTER TABLE `sif_package_des`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `sif_reference`
--
ALTER TABLE `sif_reference`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sif_result_process`
--
ALTER TABLE `sif_result_process`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;
--
-- AUTO_INCREMENT for table `sif_room_type`
--
ALTER TABLE `sif_room_type`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `sif_schedule`
--
ALTER TABLE `sif_schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sif_service_pack`
--
ALTER TABLE `sif_service_pack`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `sif_session`
--
ALTER TABLE `sif_session`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `sif_sp_pd_rel`
--
ALTER TABLE `sif_sp_pd_rel`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
--
-- AUTO_INCREMENT for table `sif_subject`
--
ALTER TABLE `sif_subject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;
--
-- AUTO_INCREMENT for table `sif_subject_omr`
--
ALTER TABLE `sif_subject_omr`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT for table `sif_teacher`
--
ALTER TABLE `sif_teacher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `sif_teacher_evaluation`
--
ALTER TABLE `sif_teacher_evaluation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sif_teacher_payment`
--
ALTER TABLE `sif_teacher_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sif_topics`
--
ALTER TABLE `sif_topics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `sif_users`
--
ALTER TABLE `sif_users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `sif_users_groups`
--
ALTER TABLE `sif_users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `sif_visitor`
--
ALTER TABLE `sif_visitor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `unit_attachments`
--
ALTER TABLE `unit_attachments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
