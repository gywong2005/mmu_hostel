-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.39 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for flaskapp
DROP DATABASE IF EXISTS `flaskapp`;
CREATE DATABASE IF NOT EXISTS `flaskapp` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `flaskapp`;

-- Dumping structure for table flaskapp.admin
DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table flaskapp.admin: ~1 rows (approximately)
INSERT INTO `admin` (`id`, `name`, `email`, `password`) VALUES
	(1234, 'Kairos', 'admin@example.com', '$2b$12$296Zc5hnoYBlVYMOWi7QWu9LTKe5N8w05oZXPMIwT5afDcAkVwD0e'),
	(2468284, 'Lee', 'admin2@example.com', '$2b$12$296Zc5hnoYBlVYMOWi7QWu9LTKe5N8w05oZXPMIwT5afDcAkVwD0e');

-- Dumping structure for table flaskapp.announcement
DROP TABLE IF EXISTS `announcement`;
CREATE TABLE IF NOT EXISTS `announcement` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `context` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Dumping data for table flaskapp.announcement: ~6 rows (approximately)
INSERT INTO `announcement` (`id`, `title`, `context`) VALUES
	(39, 'How do I organize a paragraph?', 'There are many different ways to organize a paragraph. The organization you choose will depend on the controlling idea of the paragraph. Below are a few possibilities for organization, with links to brief examples:\r\n\r\nNarration: Tell a story. Go chronologically, from start to finish. (See an example.)\r\nDescription: Provide specific details about what something looks, smells, tastes, sounds, or feels like. Organize spatially, in order of appearance, or by topic. (See an example.)\r\nProcess: Explain how something works, step by step. Perhaps follow a sequence—first, second, third. (See an example.)\r\nClassification: Separate into groups or explain the various parts of a topic. (See an example.)\r\nIllustration: Give examples and explain how those examples support your point. (See an example in the 5-step process '),
	(40, 'Lorem', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec interdum aliquam nulla, dapibus scelerisque orci auctor at. Mauris id rhoncus orci. Nunc ac porttitor orci. Sed arcu ex, eleifend nec dapibus a, pharetra at sapien. Aenean ultrices tincidunt arcu sed vehicula. Nulla ac erat lorem. Proin eget ipsum consectetur, bibendum nisi ut, placerat ante. In hac habitasse platea dictumst. Nam eu nisl lectus. Nullam pretium erat diam, quis bibendum nisi dapibus at. Nulla facilisi. Aliquam vel dignissim lorem.'),
	(41, '2', '2'),
	(42, 'wdcd', 'dscs'),
	(43, 'wdcd', 'dscs'),
	(44, 'asdasd', 'sdsadasd');

-- Dumping structure for table flaskapp.beds
DROP TABLE IF EXISTS `beds`;
CREATE TABLE IF NOT EXISTS `beds` (
  `id` int NOT NULL AUTO_INCREMENT,
  `room_number` int NOT NULL,
  `bed_letter` char(1) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'Available',
  PRIMARY KEY (`id`),
  UNIQUE KEY `room_bed` (`room_number`,`bed_letter`),
  CONSTRAINT `fk_beds_rooms` FOREIGN KEY (`room_number`) REFERENCES `rooms` (`number`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table flaskapp.beds: ~17 rows (approximately)
INSERT INTO `beds` (`id`, `room_number`, `bed_letter`, `status`) VALUES
	(1, 101, 'A', 'Available'),
	(3, 103, 'A', 'Available'),
	(4, 104, 'A', 'Available'),
	(6, 202, 'A', 'Available'),
	(7, 203, 'A', 'Available'),
	(8, 301, 'A', 'Available'),
	(9, 302, 'A', 'Available'),
	(10, 303, 'A', 'Available'),
	(12, 103, 'B', 'Available'),
	(13, 104, 'B', 'Available'),
	(14, 202, 'B', 'Available'),
	(15, 203, 'B', 'Available'),
	(16, 302, 'B', 'Available'),
	(17, 303, 'B', 'Available'),
	(18, 103, 'C', 'Available'),
	(19, 203, 'C', 'Available'),
	(20, 303, 'C', 'Available');

-- Dumping structure for table flaskapp.booking
DROP TABLE IF EXISTS `booking`;
CREATE TABLE IF NOT EXISTS `booking` (
  `booking_no` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `trimester_id` int NOT NULL,
  `group_individual` tinyint(1) NOT NULL,
  `group_id` int DEFAULT NULL,
  `hostel_id` int NOT NULL,
  `room_no` int NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  `bed_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`booking_no`),
  KEY `FK_booking_trimester` (`trimester_id`),
  KEY `FK_booking_users` (`user_id`),
  KEY `FK_booking_rooms` (`room_no`),
  KEY `FK_booking_hostel` (`hostel_id`),
  KEY `FK_booking_groups` (`group_id`),
  CONSTRAINT `FK_booking_groups` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`),
  CONSTRAINT `FK_booking_hostel` FOREIGN KEY (`hostel_id`) REFERENCES `hostel` (`id`),
  CONSTRAINT `FK_booking_rooms` FOREIGN KEY (`room_no`) REFERENCES `rooms` (`number`),
  CONSTRAINT `FK_booking_trimester` FOREIGN KEY (`trimester_id`) REFERENCES `trimester` (`id`),
  CONSTRAINT `FK_booking_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Dumping data for table flaskapp.booking: ~2 rows (approximately)

-- Dumping structure for table flaskapp.chat_messages
DROP TABLE IF EXISTS `chat_messages`;
CREATE TABLE IF NOT EXISTS `chat_messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sender_id` int NOT NULL,
  `receiver_id` int DEFAULT NULL,
  `group_id` int DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_chat_messages_sender` (`sender_id`),
  KEY `FK_chat_messages_receiver` (`receiver_id`),
  KEY `FK_chat_messages_group` (`group_id`),
  CONSTRAINT `FK_chat_messages_group` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`),
  CONSTRAINT `FK_chat_messages_receiver` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_chat_messages_sender` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Dumping data for table flaskapp.chat_messages: ~55 rows (approximately)
INSERT INTO `chat_messages` (`id`, `sender_id`, `receiver_id`, `group_id`, `message`, `timestamp`) VALUES
	(1, 1, 3, NULL, 'sddsd', '2024-09-22 22:03:04'),
	(2, 1, 3, NULL, 'fdfdfdf', '2024-09-22 22:03:07'),
	(3, 7, NULL, 54, 'ssf', '2024-09-22 22:12:40'),
	(4, 7, NULL, 54, 'dsfsfsf', '2024-09-22 22:12:43'),
	(5, 7, NULL, 54, 'fsffsfsf', '2024-09-22 22:12:45'),
	(6, 7, 3, NULL, 'sfsfsf', '2024-09-22 22:12:51'),
	(7, 7, 3, NULL, 'sdfsfs', '2024-09-22 22:12:54'),
	(8, 3, 3, NULL, 'sdsdsf', '2024-09-22 22:13:09'),
	(9, 3, 1, NULL, 'sdsfsfsf', '2024-09-22 22:13:34'),
	(10, 3, 7, NULL, 'sfsffs', '2024-09-22 22:14:04'),
	(11, 3, 7, NULL, 'asdsfs', '2024-09-22 22:21:36'),
	(12, 3, 1, NULL, 'dadadd', '2024-09-22 22:21:40'),
	(13, 3, 3, NULL, 'hfyhjfgh\r\n', '2024-09-22 22:22:20'),
	(14, 7, NULL, 54, 'saadd', '2024-09-22 22:23:03'),
	(15, 7, 3, NULL, 'saqsdad', '2024-09-22 22:28:49'),
	(16, 7, 3, NULL, 'adaddad', '2024-09-22 22:28:55'),
	(17, 1, 3, NULL, 'adada', '2024-09-23 21:19:12'),
	(18, 1, 3, NULL, 'assgsdgd', '2024-09-23 21:19:17'),
	(19, 3, 3, NULL, 'adadd', '2024-09-23 21:38:53'),
	(20, 3, 1, NULL, 'adfadad', '2024-09-23 21:40:37'),
	(21, 3, 7, NULL, 'adasda', '2024-09-23 21:40:42'),
	(22, 3, 3, NULL, 'wddsd', '2024-09-23 21:41:07'),
	(23, 7, NULL, 54, 'adadad', '2024-09-23 22:01:32'),
	(24, 7, 3, NULL, 'qddadad', '2024-09-23 22:01:35'),
	(25, 7, 3, NULL, 'addadad', '2024-09-23 22:01:38'),
	(26, 1, 3, NULL, 'addad', '2024-09-23 22:01:57'),
	(27, 1, 3, NULL, 'HAHAHA what u speak', '2024-09-23 22:02:05'),
	(28, 1, 3, NULL, 'dada', '2024-09-23 22:34:55'),
	(29, 1, 3, NULL, 'daadd', '2024-09-23 22:40:52'),
	(30, 7, 3, NULL, 'sasdad', '2024-09-23 22:52:45'),
	(31, 3, NULL, 54, 'dadaad', '2024-09-23 23:00:14'),
	(32, 1, 3, NULL, 'adad', '2024-09-23 23:17:32'),
	(33, 1, 3, NULL, 'adad', '2024-09-23 23:17:43'),
	(34, 1, 3, NULL, 'addad', '2024-09-23 23:17:47'),
	(35, 1, 3, NULL, 'addad', '2024-09-23 23:18:50'),
	(36, 1, 3, NULL, 'addada', '2024-09-23 23:18:52'),
	(37, 1, 3, NULL, 'addada', '2024-09-23 23:18:59'),
	(38, 1, 3, NULL, 'sas', '2024-09-23 23:20:45'),
	(39, 1, 3, NULL, 'sas', '2024-09-23 23:21:35'),
	(40, 1, 3, NULL, 'dada', '2024-09-23 23:21:37'),
	(41, 3, 7, NULL, 'add', '2024-09-23 23:21:55'),
	(42, 3, 3, NULL, 'dadd', '2024-09-23 23:21:57'),
	(43, 3, 1, NULL, 'daaddasda', '2024-09-23 23:21:59'),
	(44, 3, 1, NULL, 'dadaadd', '2024-09-23 23:22:04'),
	(45, 3, 1, NULL, 'dadada', '2024-09-23 23:22:06'),
	(46, 7, NULL, 54, 'add', '2024-09-23 23:31:09'),
	(47, 7, NULL, 54, 'add', '2024-09-23 23:31:39'),
	(48, 7, NULL, 54, 'add', '2024-09-23 23:31:58'),
	(49, 7, NULL, 54, 'adsad', '2024-09-23 23:32:09'),
	(50, 7, NULL, 54, 'adda', '2024-09-23 23:32:26'),
	(51, 7, NULL, 54, 'dafdhtfjfnbxczcfgdf', '2024-09-23 23:32:35'),
	(52, 7, NULL, 54, 'adddd', '2024-09-23 23:36:14'),
	(53, 7, NULL, 54, 'adsgjhkj.', '2024-09-23 23:36:16'),
	(54, 7, NULL, 54, 'asdasd', '2024-09-23 23:43:09'),
	(55, 7, 3, NULL, 'dada', '2024-09-23 23:43:11'),
	(56, 7, 3, NULL, 'fsfgf', '2024-09-23 23:43:54'),
	(57, 1, 3, NULL, 'fsfsfsfsf', '2024-09-24 11:57:33'),
	(58, 1, 3, NULL, 'sfsfs', '2024-09-24 12:00:49'),
	(59, 1, 3, NULL, 'asfsf', '2024-09-24 12:04:11');

-- Dumping structure for table flaskapp.groups
DROP TABLE IF EXISTS `groups`;
CREATE TABLE IF NOT EXISTS `groups` (
  `group_id` int NOT NULL AUTO_INCREMENT,
  `leader_id` int NOT NULL,
  `trimester_id` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `profile_pic` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`group_id`),
  KEY `leader_id` (`leader_id`),
  KEY `FK_groups_trimester` (`trimester_id`),
  CONSTRAINT `FK_groups_trimester` FOREIGN KEY (`trimester_id`) REFERENCES `trimester` (`id`),
  CONSTRAINT `groups_ibfk_1` FOREIGN KEY (`leader_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Dumping data for table flaskapp.groups: ~1 rows (approximately)
INSERT INTO `groups` (`group_id`, `leader_id`, `trimester_id`, `name`, `profile_pic`) VALUES
	(54, 7, 1, NULL, NULL);

-- Dumping structure for table flaskapp.group_members
DROP TABLE IF EXISTS `group_members`;
CREATE TABLE IF NOT EXISTS `group_members` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `group_members_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`),
  CONSTRAINT `group_members_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Dumping data for table flaskapp.group_members: ~1 rows (approximately)
INSERT INTO `group_members` (`id`, `group_id`, `user_id`) VALUES
	(119, 54, 7),
	(120, 54, 3);

-- Dumping structure for table flaskapp.hostel
DROP TABLE IF EXISTS `hostel`;
CREATE TABLE IF NOT EXISTS `hostel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `gender` enum('Male','Female') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table flaskapp.hostel: ~4 rows (approximately)
INSERT INTO `hostel` (`id`, `name`, `gender`) VALUES
	(1, 'Hostel A', 'Male'),
	(2, 'Hostel B', 'Female'),
	(3, 'Hostel C', 'Male'),
	(4, 'Hostel D', 'Female');

-- Dumping structure for table flaskapp.invitations
DROP TABLE IF EXISTS `invitations`;
CREATE TABLE IF NOT EXISTS `invitations` (
  `invitation_id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `inviter_id` int NOT NULL,
  `invitee_id` int NOT NULL,
  `status` enum('pending','accepted','declined') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'pending',
  `invitation_date` timestamp NOT NULL DEFAULT (now()),
  PRIMARY KEY (`invitation_id`),
  KEY `FK_invitations_groups` (`group_id`),
  KEY `FK_invitations_users` (`inviter_id`),
  KEY `FK_invitations_users_2` (`invitee_id`),
  CONSTRAINT `FK_invitations_groups` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_invitations_users` FOREIGN KEY (`inviter_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_invitations_users_2` FOREIGN KEY (`invitee_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Dumping data for table flaskapp.invitations: ~0 rows (approximately)

-- Dumping structure for table flaskapp.questions
DROP TABLE IF EXISTS `questions`;
CREATE TABLE IF NOT EXISTS `questions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `section_id` int NOT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `min_rating` int DEFAULT '1',
  `max_rating` int DEFAULT '5',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_questions_ques_sections` (`section_id`),
  CONSTRAINT `FK_questions_ques_sections` FOREIGN KEY (`section_id`) REFERENCES `ques_sections` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Dumping data for table flaskapp.questions: ~30 rows (approximately)
INSERT INTO `questions` (`id`, `section_id`, `text`, `min_rating`, `max_rating`) VALUES
	(1, 1, 'I prefer a quiet environment when studying.', 1, 5),
	(2, 1, 'I usually study early in the morning.', 1, 5),
	(3, 1, 'I prefer studying alone rather than in groups.', 1, 5),
	(4, 1, 'I take frequent breaks while studying.', 1, 5),
	(5, 1, 'I rely heavily on digital devices for studying.', 1, 5),
	(6, 2, 'I keep my room organized and clean daily.', 1, 5),
	(7, 2, 'It is important to me that shared spaces are kept clean.', 1, 5),
	(8, 2, 'I am comfortable with others borrowing my personal items.', 1, 5),
	(9, 2, 'I prefer a minimalist, clutter-free living space.', 1, 5),
	(10, 2, 'I like to have a cleaning schedule in place.', 1, 5),
	(11, 3, 'I prefer going to bed early (before 10 PM).\n\n', 1, 5),
	(12, 3, 'I am an early riser (before 6 AM).', 1, 5),
	(13, 3, 'I am a light sleeper and wake up easily.', 1, 5),
	(14, 3, 'I need complete silence to sleep.', 1, 5),
	(15, 3, 'I prefer a completely dark room when sleeping.', 1, 5),
	(16, 4, 'I enjoy social interaction and prefer spending time with others.', 1, 5),
	(17, 4, 'I like having guests over frequently.', 1, 5),
	(18, 4, 'I am interested in participating in social events with my roommates.', 1, 5),
	(19, 4, 'I prefer sharing meals with my roommates.', 1, 5),
	(20, 4, 'I highly value personal space and privacy.', 1, 5),
	(21, 5, 'I prefer addressing conflicts directly and immediately.', 1, 5),
	(22, 5, 'I like to communicate with my roommates daily.', 1, 5),
	(23, 5, 'I prefer face-to-face communication over texting.', 1, 5),
	(24, 5, 'I like to discuss and solve problems together.', 1, 5),
	(25, 5, 'I am open to discussing personal matters with my roommate.\n\n', 1, 5),
	(26, 6, 'I am okay with high music/TV volume at home.', 1, 5),
	(27, 6, 'I believe in having set quiet hours in the room.', 1, 5),
	(28, 6, 'I need complete silence while working or studying.', 1, 5),
	(29, 6, 'I prefer a generally quiet living environment.', 1, 5),
	(30, 6, 'I use earplugs or noise-canceling headphones regularly.', 1, 5);

-- Dumping structure for table flaskapp.ques_sections
DROP TABLE IF EXISTS `ques_sections`;
CREATE TABLE IF NOT EXISTS `ques_sections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Dumping data for table flaskapp.ques_sections: ~6 rows (approximately)
INSERT INTO `ques_sections` (`id`, `name`) VALUES
	(1, 'Study Habits'),
	(2, 'Cleanliness'),
	(3, 'Sleep Schedule'),
	(4, 'Socializing Preference'),
	(5, 'Communication Style'),
	(6, 'Noice Tolerance');

-- Dumping structure for table flaskapp.rooms
DROP TABLE IF EXISTS `rooms`;
CREATE TABLE IF NOT EXISTS `rooms` (
  `number` int NOT NULL,
  `hostel_id` int NOT NULL,
  `category` enum('Single','Double','Triple') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `capacity` int NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'Available',
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`number`),
  KEY `hostel_id` (`hostel_id`),
  CONSTRAINT `rooms_ibfk_1` FOREIGN KEY (`hostel_id`) REFERENCES `hostel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table flaskapp.rooms: ~17 rows (approximately)
INSERT INTO `rooms` (`number`, `hostel_id`, `category`, `capacity`, `status`, `price`) VALUES
	(101, 1, 'Single', 1, 'Available', 100.00),
	(103, 1, 'Triple', 3, 'Available', 200.00),
	(104, 1, 'Double', 2, 'Available', 200.00),
	(202, 2, 'Double', 2, 'Available', 160.00),
	(203, 2, 'Triple', 3, 'Available', 210.00),
	(204, 2, 'Single', 1, 'Available', 110.00),
	(205, 2, 'Double', 2, 'Available', 160.00),
	(206, 2, 'Triple', 3, 'Available', 210.00),
	(301, 3, 'Single', 1, 'Available', 120.00),
	(302, 3, 'Double', 2, 'Available', 170.00),
	(303, 3, 'Triple', 3, 'Available', 220.00),
	(304, 3, 'Single', 1, 'Available', 120.00),
	(305, 3, 'Double', 2, 'Available', 170.00),
	(306, 3, 'Triple', 3, 'Available', 220.00),
	(308, 3, 'Double', 2, 'Available', 170.00);

-- Dumping structure for table flaskapp.room_change_requests
DROP TABLE IF EXISTS `room_change_requests`;
CREATE TABLE IF NOT EXISTS `room_change_requests` (
  `request_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `reason` text NOT NULL,
  `status` enum('pending','approved','rejected') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`request_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `fk_room_change_requests_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table flaskapp.room_change_requests: ~2 rows (approximately)
INSERT INTO `room_change_requests` (`request_id`, `user_id`, `reason`, `status`, `created_at`) VALUES
	(24, 1, 'sfsfsfsf', 'rejected', '2024-09-20 14:52:50'),
	(25, 1, 'ascdfsdscfs', 'rejected', '2024-09-20 15:11:46'),
	(26, 3, 'sfffsczx', 'pending', '2024-09-20 15:46:04');

-- Dumping structure for table flaskapp.room_swap_requests
DROP TABLE IF EXISTS `room_swap_requests`;
CREATE TABLE IF NOT EXISTS `room_swap_requests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `other_user_id` int NOT NULL,
  `reason` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `status` enum('pending','approved_by_student','rejected','approved_by_admin','rejected_by_admin') COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `other_user_id` (`other_user_id`),
  CONSTRAINT `room_swap_requests_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `room_swap_requests_ibfk_2` FOREIGN KEY (`other_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Dumping data for table flaskapp.room_swap_requests: ~0 rows (approximately)
INSERT INTO `room_swap_requests` (`id`, `user_id`, `other_user_id`, `reason`, `status`, `created_at`) VALUES
	(6, 1, 3, 'acsfsvgxx', 'approved_by_student', '2024-09-20 16:32:23');

-- Dumping structure for table flaskapp.trimester
DROP TABLE IF EXISTS `trimester`;
CREATE TABLE IF NOT EXISTS `trimester` (
  `id` int NOT NULL AUTO_INCREMENT,
  `term` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2317 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Dumping data for table flaskapp.trimester: ~3 rows (approximately)
INSERT INTO `trimester` (`id`, `term`, `name`) VALUES
	(1, 2310, 'Trimester March/April 2024'),
	(2, 2320, 'Trimester July/August 2024'),
	(3, 2330, 'Trimester Oct/Nov 2024');

-- Dumping structure for table flaskapp.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `gender` enum('Male','Female') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `faculty` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `profile_pic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `survey_completed` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table flaskapp.users: ~16 rows (approximately)
INSERT INTO `users` (`id`, `name`, `gender`, `email`, `password`, `faculty`, `profile_pic`, `survey_completed`) VALUES
	(1, 'John Wick', 'Male', '1@www.com', '$2b$12$296Zc5hnoYBlVYMOWi7QWu9LTKe5N8w05oZXPMIwT5afDcAkVwD0e', 'Computing', '/static/uploads/IMG_9520.JPG', 0),
	(2, 'Jane Smith', 'Female', 'user2@example.com', '$2b$12$yocdymDGgMbzktihJhXTguo7yuDDCMWSensxIX75HTBA1RkfyZ7zi', 'Science', '', 0),
	(3, 'Bob Johnson', 'Male', 'user3@example.com', '$2b$12$yocdymDGgMbzktihJhXTguo7yuDDCMWSensxIX75HTBA1RkfyZ7zi', 'Arts', '/static/uploads/IMG_9523.JPG', 0),
	(4, 'Alice Cooper', 'Female', 'alice.cooper@example.com', '$2b$12$yocdymDGgMbzktihJhXTguo7yuDDCMWSensxIX75HTBA1RkfyZ7zi', 'Business', '', 0),
	(5, 'David Miller', 'Male', 'david.miller@example.com', '$2b$12$yocdymDGgMbzktihJhXTguo7yuDDCMWSensxIX75HTBA1RkfyZ7zi', 'Mathematics', '', 0),
	(6, 'Emma Watson', 'Female', 'emma.watson@example.com', '$2b$12$yocdymDGgMbzktihJhXTguo7yuDDCMWSensxIX75HTBA1RkfyZ7zi', 'Computer Science', '', 0),
	(7, 'Liam Nelson', 'Male', 'liam.nelson@example.com', '$2b$12$yocdymDGgMbzktihJhXTguo7yuDDCMWSensxIX75HTBA1RkfyZ7zi', 'Physics', '', 0),
	(8, 'Sophia Lee', 'Female', 'sophia.lee@example.com', '$2b$12$yocdymDGgMbzktihJhXTguo7yuDDCMWSensxIX75HTBA1RkfyZ7zi', 'Biology', '', 0),
	(9, 'Noah Brown', 'Male', 'noah.brown@example.com', '$2b$12$yocdymDGgMbzktihJhXTguo7yuDDCMWSensxIX75HTBA1RkfyZ7zi', 'History', '', 0),
	(10, 'Olivia Martin', 'Female', 'olivia.martin@example.com', '$2b$12$yocdymDGgMbzktihJhXTguo7yuDDCMWSensxIX75HTBA1RkfyZ7zi', 'Chemistry', '', 0),
	(11, 'William Davis', 'Male', 'william.davis@example.com', '$2b$12$yocdymDGgMbzktihJhXTguo7yuDDCMWSensxIX75HTBA1RkfyZ7zi', 'Engineering', '', 0),
	(12, 'Isabella Garcia', 'Female', 'isabella.garcia@example.com', '$2b$12$yocdymDGgMbzktihJhXTguo7yuDDCMWSensxIX75HTBA1RkfyZ7zi', 'Psychology', '', 0),
	(13, 'James Wilson', 'Male', 'james.wilson@example.com', '$2b$12$yocdymDGgMbzktihJhXTguo7yuDDCMWSensxIX75HTBA1RkfyZ7zi', 'Philosophy', '', 0),
	(14, 'Charlotte Martinez', 'Female', 'charlotte.martinez@example.com', '$2b$12$yocdymDGgMbzktihJhXTguo7yuDDCMWSensxIX75HTBA1RkfyZ7zi', 'Art', '', 0),
	(15, 'Michael Anderson', 'Male', 'michael.anderson@example.com', '$2b$12$yocdymDGgMbzktihJhXTguo7yuDDCMWSensxIX75HTBA1RkfyZ7zi', 'Business', '', 0);

-- Dumping structure for table flaskapp.user_ratings
DROP TABLE IF EXISTS `user_ratings`;
CREATE TABLE IF NOT EXISTS `user_ratings` (
  `rating_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `question_id` int DEFAULT NULL,
  `rating` int DEFAULT NULL,
  PRIMARY KEY (`rating_id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `user_ratings_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- Dumping data for table flaskapp.user_ratings: ~55 rows (approximately)
INSERT INTO `user_ratings` (`rating_id`, `user_id`, `question_id`, `rating`) VALUES
	(3, 3, 1, 3),
	(4, 3, 2, 3),
	(5, 3, 3, 3),
	(6, 3, 4, 3),
	(7, 3, 5, 3),
	(8, 3, 6, 3),
	(9, 3, 7, 3),
	(10, 3, 8, 3),
	(11, 3, 9, 3),
	(12, 3, 10, 3),
	(13, 3, 11, 3),
	(14, 3, 12, 4),
	(15, 3, 13, 5),
	(16, 3, 14, 4),
	(17, 3, 15, 4),
	(18, 3, 16, 4),
	(19, 3, 17, 5),
	(20, 3, 18, 5),
	(21, 3, 19, 5),
	(22, 3, 20, 4),
	(23, 3, 21, 4),
	(24, 3, 22, 5),
	(25, 3, 23, 4),
	(26, 3, 24, 5),
	(27, 3, 25, 4),
	(28, 3, 26, 4),
	(29, 3, 27, 5),
	(30, 3, 28, 5),
	(31, 3, 29, 5),
	(32, 3, 30, 5),
	(63, 5, 1, 5),
	(64, 5, 2, 5),
	(65, 5, 3, 5),
	(66, 5, 4, 5),
	(67, 5, 5, 5),
	(68, 5, 6, 4),
	(69, 5, 7, 4),
	(70, 5, 8, 4),
	(71, 5, 9, 4),
	(72, 5, 10, 4),
	(73, 5, 11, 4),
	(74, 5, 12, 5),
	(75, 5, 13, 5),
	(76, 5, 14, 4),
	(77, 5, 15, 4),
	(78, 5, 16, 4),
	(79, 5, 17, 5),
	(80, 5, 18, 4),
	(81, 5, 19, 5),
	(82, 5, 20, 4),
	(83, 5, 21, 4),
	(84, 5, 22, 4),
	(85, 5, 23, 4),
	(86, 5, 24, 5),
	(87, 5, 25, 4),
	(88, 5, 26, 4),
	(89, 5, 27, 5),
	(90, 5, 28, 4),
	(91, 5, 29, 5),
	(92, 5, 30, 4);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
