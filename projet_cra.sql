-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 22, 2024 at 02:14 PM
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
-- Database: `projet_cra`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `admin_title` varchar(255) DEFAULT NULL,
  `admin_phone` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `admin_title`, `admin_phone`) VALUES
(2, 'admin', '123456789');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `department` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `department`) VALUES
(1, 'Développement'),
(2, 'Systèmes et Réseaux');

-- --------------------------------------------------------

--
-- Table structure for table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20240129141408', '2024-01-29 15:14:31', 67),
('DoctrineMigrations\\Version20240129144146', '2024-01-29 15:41:52', 52),
('DoctrineMigrations\\Version20240129144635', '2024-01-29 15:46:39', 50),
('DoctrineMigrations\\Version20240129144944', '2024-01-29 15:49:48', 49),
('DoctrineMigrations\\Version20240129145240', '2024-01-29 15:52:44', 88),
('DoctrineMigrations\\Version20240228145142', '2024-02-28 15:51:56', 69),
('DoctrineMigrations\\Version20240229215657', NULL, NULL),
('DoctrineMigrations\\Version20240229220320', '2024-03-11 17:02:30', 30),
('DoctrineMigrations\\Version20240229224646', '2024-03-12 16:22:46', 3),
('DoctrineMigrations\\Version20240229224943', '2024-03-12 16:24:31', 3),
('DoctrineMigrations\\Version20240229225158', '2024-03-12 16:25:20', 3),
('DoctrineMigrations\\Version20240229225718', '2024-03-12 16:25:57', 3),
('DoctrineMigrations\\Version20240229230847', '2024-03-12 16:26:32', 3),
('DoctrineMigrations\\Version20240229231032', '2024-03-12 16:27:01', 3),
('DoctrineMigrations\\Version20240229231125', '2024-03-12 16:27:32', 3),
('DoctrineMigrations\\Version20240229231707', '2024-03-12 16:28:07', 3),
('DoctrineMigrations\\Version20240229232241', '2024-03-12 16:28:40', 4),
('DoctrineMigrations\\Version20240229232407', '2024-03-12 16:29:16', 3),
('DoctrineMigrations\\Version20240229232616', '2024-03-12 16:30:47', 3),
('DoctrineMigrations\\Version20240229233109', '2024-03-12 16:31:40', 5),
('DoctrineMigrations\\Version20240229233235', '2024-03-12 16:32:10', 3),
('DoctrineMigrations\\Version20240229233422', '2024-03-12 16:32:38', 3),
('DoctrineMigrations\\Version20240312143223', '2024-03-12 16:32:38', 14),
('DoctrineMigrations\\Version20240315111438', '2024-03-15 12:31:06', 572),
('DoctrineMigrations\\Version20240315113043', '2024-03-15 12:52:06', 100);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `birthday` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `department_id`, `mobile`, `address`, `birthday`) VALUES
(1, 1, '7894561223', '46 avenue Roger Hennequin', '0000-09-27'),
(3, 2, '7894561223', '46 avenue Roger Hennequin', '0000-00-00'),
(4, 2, '7894561223', '46 avenue Roger Hennequin', '1992-09-12'),
(10, 2, '0128457896', '83 rue de versaille', '2005-02-07');

-- --------------------------------------------------------

--
-- Table structure for table `leave`
--

CREATE TABLE `leave` (
  `id` int(11) NOT NULL,
  `leave_from` date NOT NULL,
  `leave_to` date NOT NULL,
  `leave_description` longtext NOT NULL,
  `leave_status` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `leavetype_id` int(11) NOT NULL,
  `rejection_comment` longtext DEFAULT NULL,
  `medical_certificate_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leave`
--

INSERT INTO `leave` (`id`, `leave_from`, `leave_to`, `leave_description`, `leave_status`, `employee_id`, `leavetype_id`, `rejection_comment`, `medical_certificate_path`) VALUES
(1, '2024-01-01', '2024-02-01', '', 1, 1, 1, NULL, NULL),
(2, '2024-02-01', '2024-03-08', 'vacances', 3, 3, 1, 'ça va?', NULL),
(6, '2019-01-01', '2019-01-01', 'test', 1, 3, 1, NULL, NULL),
(8, '2019-01-01', '2019-01-01', 'blabla', 2, 3, 2, NULL, NULL),
(13, '2019-01-01', '2019-01-01', 'merci', 1, 3, 1, NULL, NULL),
(18, '2019-01-01', '2019-01-01', 'cv', 2, 3, 5, NULL, '65f2d6f38f82c.png'),
(20, '2019-01-01', '2019-01-01', 'cc', 1, 3, 6, NULL, '65f46004aa2a6.png');

-- --------------------------------------------------------

--
-- Table structure for table `leave_type`
--

CREATE TABLE `leave_type` (
  `id` int(11) NOT NULL,
  `leave_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leave_type`
--

INSERT INTO `leave_type` (`id`, `leave_type`) VALUES
(1, 'Congé payé'),
(2, 'Congé sans solde'),
(3, 'RTT'),
(5, 'Arrêt Maladie'),
(6, 'Autre');

-- --------------------------------------------------------

--
-- Table structure for table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personne`
--

CREATE TABLE `personne` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` int(11) NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personne`
--

INSERT INTO `personne` (`id`, `name`, `email`, `password`, `role`, `type`) VALUES
(1, 'aissatou', 'aissatousalla@gmail.com', '$2y$13$/zUYfM7Bu99dZKRonH367ebSvKghNtoWnwRjBIJ.KlvvAopMNt4G2', 2, 'employee'),
(2, 'admin', 'admin@gmail.com', '$2y$13$g8Ceq5U1PAZqofv3KVmOFedY/9NzJOd1Rtb3NFhZCsKmM9RwpfZMq', 1, 'admin'),
(3, 'mariama', 'mariama@gmail.com', '$2y$13$MJoQF9A5e8Bgqd8qhOyWoe81MtdRLjEEwj9LY3TgM0ln8Wz858iaO', 2, 'employee'),
(4, 'kokou', 'kokou@gmail.com', '$2y$13$O8JmUTxBb1UVc44278Hy3ukWF0CId/NJQdAjOm3khdC233JoQobXK', 2, 'employee'),
(10, 'Kelyan', 'kelyan@gmail.com', '$2y$13$6ivfxQZUfFrJUB9Xj.lt5eI.tQja9RVdW40DWMa71/WOGys5anIK2', 2, 'employee');

-- --------------------------------------------------------

--
-- Table structure for table `pointage`
--

CREATE TABLE `pointage` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `categorie_absence_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `ispresent` tinyint(1) NOT NULL,
  `comments` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_5D9F75A1AE80F5DF` (`department_id`);

--
-- Indexes for table `leave`
--
ALTER TABLE `leave`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_9BB080D08C03F15C` (`employee_id`),
  ADD KEY `IDX_9BB080D0AB9F5BF` (`leavetype_id`);

--
-- Indexes for table `leave_type`
--
ALTER TABLE `leave_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Indexes for table `personne`
--
ALTER TABLE `personne`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pointage`
--
ALTER TABLE `pointage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_7591B208C03F15C` (`employee_id`),
  ADD KEY `IDX_7591B20B336E923` (`categorie_absence_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `leave`
--
ALTER TABLE `leave`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `leave_type`
--
ALTER TABLE `leave_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personne`
--
ALTER TABLE `personne`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pointage`
--
ALTER TABLE `pointage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `FK_880E0D76BF396750` FOREIGN KEY (`id`) REFERENCES `personne` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `FK_5D9F75A1AE80F5DF` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`),
  ADD CONSTRAINT `FK_5D9F75A1BF396750` FOREIGN KEY (`id`) REFERENCES `personne` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `leave`
--
ALTER TABLE `leave`
  ADD CONSTRAINT `FK_9BB080D08C03F15C` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`),
  ADD CONSTRAINT `FK_9BB080D0AB9F5BF` FOREIGN KEY (`leavetype_id`) REFERENCES `leave_type` (`id`);

--
-- Constraints for table `pointage`
--
ALTER TABLE `pointage`
  ADD CONSTRAINT `FK_7591B208C03F15C` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`),
  ADD CONSTRAINT `FK_7591B20B336E923` FOREIGN KEY (`categorie_absence_id`) REFERENCES `leave_type` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
