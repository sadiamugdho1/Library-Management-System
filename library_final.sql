-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 12, 2025 at 07:15 PM
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
-- Database: `library_management_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_details`
--

CREATE TABLE `admin_details` (
  `admin_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `admin_level` enum('super','regular') NOT NULL,
  `department` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_details`
--

INSERT INTO `admin_details` (`admin_id`, `user_id`, `admin_level`, `department`) VALUES
(1, 21, 'super', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `book_id` int(11) NOT NULL,
  `isbn` varchar(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(100) NOT NULL,
  `publisher` varchar(100) DEFAULT NULL,
  `publication_year` int(11) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `edition` varchar(20) DEFAULT NULL,
  `total_copies` int(11) NOT NULL DEFAULT 1,
  `available_copies` int(11) NOT NULL DEFAULT 1,
  `shelf_location` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `cover_image` varchar(255) DEFAULT NULL,
  `added_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`book_id`, `isbn`, `title`, `author`, `publisher`, `publication_year`, `category_id`, `edition`, `total_copies`, `available_copies`, `shelf_location`, `description`, `cover_image`, `added_date`) VALUES
(1, '123', 'How To Train Your Dragon', 'John Doe', 'john12', 2020, 10, '2', 3, 1, '2', 'dummy', 'https://m.media-amazon.com/images/M/MV5BODA5Y2M0NjctNWQzMy00ODRhLWE0MzUtYmE1YTAzZjYyYmQyXkEyXkFqcGc@._V1_.jpg', '2025-05-11 16:42:11'),
(3, '1234', 'The Great Gatsby', 'F. Scott Fitzgerald', 'John Doe', 1925, 1, '`', 5, 2, '1', 'The Great Gatsby is a 1925 novel by American writer F. Scott Fitzgerald. Set in the Jazz Age on Long Island, near New York City, the novel depicts first-person narrator Nick Carraway&#039;s interactions with Jay Gatsby, a mysterious millionaire with an obsession to reunite with his former lover, Daisy Buchanan.', 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1650033243i/41733839.jpg', '2025-05-11 17:23:00'),
(4, '12345', 'The Godfather', 'Mario Puzo', 'G. P. Putnam&#039;s Sons', 1969, 1, '1', 10, 9, '2', 'The Godfather is a crime novel by Italian American author Mario Puzo. Originally published on 10 March 1969 by G. P. Putnam&#039;s Sons, the novel details the story of a fictional Mafia family in New York City and Long Island, headed by Vito Corleone: the Godfather.', 'https://m.media-amazon.com/images/I/61zAyF3qLnL.jpg', '2025-05-11 19:07:27'),
(5, '123456', 'The Lord of the Rings', 'John Ronald Reuel Tolkien', 'John Doe', 1954, 1, '1', 1, 0, '4', 'The Lord of the Rings is a trilogy of epic fantasy adventure films directed by Peter Jackson, based on the novel The Lord of the Rings by English author J. R. R. Tolkien. The films are titled identically to the three volumes of the novel: The Fellowship of the Ring, The Two Towers, and The Return of the King.', 'https://m.media-amazon.com/images/M/MV5BNzIxMDQ2YTctNDY4MC00ZTRhLTk4ODQtMTVlOWY4NTdiYmMwXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg', '2025-05-11 19:09:46'),
(6, '1234567', 'To Kill a Mockingbird', 'Harper Lee', 'John Doe', 2020, 1, '2', 15, 10, '4', 'To Kill a Mockingbird is a 1960 Southern Gothic novel by American author Harper Lee. It became instantly successful after its release; in the United States, it is widely read in high schools and middle schools. To Kill a Mockingbird won the Pulitzer Prize a year after its release, and it has become a classic of modern American literature. The plot and characters are loosely based on Lee&amp;#039;s observations of her family, her neighbors and an event that occurred near her hometown of Monroeville, Alabama, in 1936, when she was ten.', 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1553383690i/2657.jpg', '2025-05-12 02:06:50');

-- --------------------------------------------------------

--
-- Table structure for table `book_issues`
--

CREATE TABLE `book_issues` (
  `issue_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `issue_date` datetime DEFAULT current_timestamp(),
  `due_date` datetime NOT NULL,
  `return_date` datetime DEFAULT NULL,
  `issued_by` int(11) NOT NULL,
  `returned_to` int(11) DEFAULT NULL,
  `status` enum('issued','returned','overdue','lost') DEFAULT 'issued',
  `renewed_count` int(11) DEFAULT 0,
  `renewal_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `book_issues`
--

INSERT INTO `book_issues` (`issue_id`, `book_id`, `member_id`, `issue_date`, `due_date`, `return_date`, `issued_by`, `returned_to`, `status`, `renewed_count`, `renewal_date`) VALUES
(1, 3, 6, '2025-05-11 14:17:04', '2025-06-08 00:00:00', '2025-05-11 00:00:00', 21, 21, 'returned', 2, '2025-05-11 18:23:36'),
(10, 6, 7, '2025-05-11 22:10:23', '2025-06-02 00:00:00', '2025-05-11 00:00:00', 21, 21, 'returned', 1, '2025-05-12 02:11:18'),
(11, 3, 7, '2025-05-11 22:27:29', '2025-05-25 22:27:29', '2025-05-11 00:00:00', 21, 21, 'returned', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `book_reservations`
--

CREATE TABLE `book_reservations` (
  `reservation_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `reservation_date` datetime DEFAULT current_timestamp(),
  `expiry_date` datetime NOT NULL,
  `status` enum('pending','fulfilled','cancelled','expired') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `book_reservations`
--

INSERT INTO `book_reservations` (`reservation_id`, `book_id`, `member_id`, `reservation_date`, `expiry_date`, `status`) VALUES
(7, 6, 7, '2025-05-12 02:08:50', '2025-05-18 22:08:50', 'fulfilled'),
(8, 3, 7, '2025-05-12 02:27:12', '2025-05-18 22:27:12', 'fulfilled');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `parent_category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `name`, `description`, `parent_category_id`) VALUES
(1, 'Fiction', 'Fictional literature and novels', NULL),
(2, 'Non-Fiction', 'Factual and informative books', NULL),
(3, 'Science', 'Books related to scientific topics', NULL),
(4, 'History', 'Historical books and documents', NULL),
(5, 'Biography', 'Life stories and autobiographies', NULL),
(6, 'Technology', 'Books about technology and computing', NULL),
(7, 'Philosophy', 'Philosophical works and theories', NULL),
(8, 'Arts', 'Books about various art forms', NULL),
(9, 'Reference', 'Reference materials and guides', NULL),
(10, 'Children', 'Books for children and young readers', NULL),
(11, 'Romance', 'Test', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `feedback_tickets`
--

CREATE TABLE `feedback_tickets` (
  `ticket_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `type` enum('feedback','support') NOT NULL,
  `status` enum('pending','in_progress','resolved','closed') NOT NULL DEFAULT 'pending',
  `priority` enum('low','medium','high') NOT NULL DEFAULT 'medium',
  `admin_response` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `assigned_to` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback_tickets`
--

INSERT INTO `feedback_tickets` (`ticket_id`, `user_id`, `name`, `email`, `subject`, `message`, `type`, `status`, `priority`, `admin_response`, `created_at`, `updated_at`, `assigned_to`) VALUES
(3, 22, 'John Doe', 'john@test.com', 'Update my membership', 'Please Update', 'support', 'closed', 'medium', 'solved', '2025-05-12 01:13:52', '2025-05-12 01:33:25', 21),
(4, 22, 'John Doe', 'john@test.com', 'Test', 'Test msg', 'feedback', 'resolved', 'medium', 'thanks for the fd', '2025-05-12 02:14:35', '2025-05-12 02:15:28', 21);

-- --------------------------------------------------------

--
-- Table structure for table `fines`
--

CREATE TABLE `fines` (
  `fine_id` int(11) NOT NULL,
  `issue_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `fine_amount` decimal(10,2) NOT NULL,
  `fine_date` datetime DEFAULT current_timestamp(),
  `fine_reason` enum('overdue','damage','lost') NOT NULL,
  `paid_amount` decimal(10,2) DEFAULT 0.00,
  `payment_date` datetime DEFAULT NULL,
  `status` enum('pending','partially_paid','paid') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fines`
--

INSERT INTO `fines` (`fine_id`, `issue_id`, `member_id`, `fine_amount`, `fine_date`, `fine_reason`, `paid_amount`, `payment_date`, `status`) VALUES
(1, 1, 6, 10.00, '2025-05-11 18:24:02', 'damage', 0.00, NULL, 'pending'),
(2, 11, 7, 10.00, '2025-05-12 02:27:42', 'damage', 0.00, NULL, 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `member_details`
--

CREATE TABLE `member_details` (
  `member_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `membership_number` varchar(20) NOT NULL,
  `membership_type` enum('regular','premium','student','faculty') NOT NULL,
  `membership_start_date` date NOT NULL,
  `membership_end_date` date DEFAULT NULL,
  `max_books_allowed` int(11) DEFAULT 5,
  `student_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `member_details`
--

INSERT INTO `member_details` (`member_id`, `user_id`, `membership_number`, `membership_type`, `membership_start_date`, `membership_end_date`, `max_books_allowed`, `student_id`) VALUES
(3, 18, 'MEM000018', 'regular', '2025-04-29', NULL, 5, NULL),
(4, 19, 'MEM000019', 'regular', '2025-04-29', NULL, 5, NULL),
(5, 20, 'MEM000020', 'regular', '2025-04-29', NULL, 5, NULL),
(6, 21, 'MEM000021', 'regular', '2025-05-11', NULL, 5, NULL),
(7, 22, 'MEM000022', 'premium', '2025-05-11', NULL, 10, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `room_bookings`
--

CREATE TABLE `room_bookings` (
  `booking_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `booking_date` datetime DEFAULT current_timestamp(),
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `booked_by` int(11) NOT NULL,
  `status` enum('reserved','checked_in','checked_out','cancelled') DEFAULT 'reserved',
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `study_rooms`
--

CREATE TABLE `study_rooms` (
  `room_id` int(11) NOT NULL,
  `room_name` varchar(50) NOT NULL,
  `capacity` int(11) NOT NULL,
  `location` varchar(100) NOT NULL,
  `amenities` text DEFAULT NULL,
  `status` enum('available','maintenance','reserved') DEFAULT 'available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system_logs`
--

CREATE TABLE `system_logs` (
  `log_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `action` varchar(100) NOT NULL,
  `table_affected` varchar(50) DEFAULT NULL,
  `record_id` int(11) DEFAULT NULL,
  `action_timestamp` datetime DEFAULT current_timestamp(),
  `ip_address` varchar(50) DEFAULT NULL,
  `details` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `system_logs`
--

INSERT INTO `system_logs` (`log_id`, `user_id`, `action`, `table_affected`, `record_id`, `action_timestamp`, `ip_address`, `details`) VALUES
(1, 21, 'user_login', 'users', 21, '2025-05-11 15:31:47', '::1', 'User logged in'),
(2, 21, 'user_login', 'users', 21, '2025-05-11 15:32:47', '::1', 'User logged in'),
(3, 21, 'user_login', 'users', 21, '2025-05-11 15:33:10', '::1', 'User logged in'),
(4, 21, 'user_login', 'users', 21, '2025-05-11 15:36:11', '::1', 'User logged in'),
(5, 21, 'user_login', 'users', 21, '2025-05-11 15:37:16', '::1', 'User logged in'),
(6, 21, 'user_login', 'users', 21, '2025-05-11 15:37:25', '::1', 'User logged in'),
(7, 21, 'user_login', 'users', 21, '2025-05-11 15:39:23', '::1', 'User logged in'),
(8, 21, 'user_login', 'users', 21, '2025-05-11 15:42:18', '::1', 'User logged in'),
(9, 21, 'user_login', 'users', 21, '2025-05-11 15:45:27', '::1', 'User logged in'),
(10, 21, 'user_login', 'users', 21, '2025-05-11 15:45:39', '::1', 'User logged in'),
(11, 21, 'user_login', 'users', 21, '2025-05-11 15:54:04', '::1', 'User logged in'),
(12, 21, 'user_login', 'users', 21, '2025-05-11 15:57:06', '::1', 'User logged in'),
(13, 21, 'user_login', 'users', 21, '2025-05-11 15:57:34', '::1', 'User logged in'),
(14, 21, 'user_login', 'users', 21, '2025-05-11 15:57:40', '::1', 'User logged in'),
(15, 21, 'user_login', 'users', 21, '2025-05-11 15:58:44', '::1', 'User logged in'),
(16, 21, 'add_book', 'books', 1, '2025-05-11 16:42:11', '::1', 'Added book: How To Train Your Dragon (ISBN: 123)'),
(17, 21, 'user_login', 'users', 21, '2025-05-11 17:06:36', '::1', 'User logged in'),
(18, 21, 'add_book', 'books', 2, '2025-05-11 17:07:13', '::1', 'Added book: Dummy (ISBN: 1234)'),
(19, 21, 'update_book_copies', 'books', 2, '2025-05-11 17:11:23', '::1', 'Updated copies for book: Dummy (ISBN: 1234) - Total: 1, Available: 0'),
(20, 21, 'delete_book', 'books', 2, '2025-05-11 17:22:18', '::1', 'Deleted book: Dummy (ISBN: 1234)'),
(21, 21, 'add_book', 'books', 3, '2025-05-11 17:23:00', '::1', 'Added book: Dum (ISBN: 1234)'),
(22, 21, 'update_book_copies', 'books', 3, '2025-05-11 18:53:03', '::1', 'Updated copies for book: Dum (ISBN: 1234) - Total: 2, Available: 1'),
(23, 21, 'add_book', 'books', 4, '2025-05-11 19:07:27', '::1', 'Added book: The Godfather (ISBN: 12345)'),
(24, 21, 'add_book', 'books', 5, '2025-05-11 19:09:46', '::1', 'Added book: The Lord of the Rings (ISBN: 123456)'),
(25, 21, 'update_book', 'books', 3, '2025-05-11 19:11:57', '::1', 'Updated book: The Great Gatsby (ISBN: 1234)'),
(26, 21, 'update_book', 'books', 1, '2025-05-11 19:12:35', '::1', 'Updated book: How To Train Your Dragon (ISBN: 123)'),
(27, 21, 'update_book', 'books', 1, '2025-05-11 19:12:59', '::1', 'Updated book: How To Train Your Dragon (ISBN: 123)'),
(28, 21, 'user_login', 'users', 21, '2025-05-11 19:49:44', '::1', 'User logged in'),
(29, 21, 'user_login', 'users', 21, '2025-05-11 21:50:53', '::1', 'User logged in'),
(30, 21, 'user_login', 'users', 21, '2025-05-11 22:05:12', '::1', 'User logged in'),
(31, 21, 'user_login', 'users', 21, '2025-05-11 22:31:53', '::1', 'User logged in'),
(32, 21, 'user_login', 'users', 21, '2025-05-12 01:17:23', '::1', 'User logged in'),
(33, 21, 'user_login', 'users', 21, '2025-05-12 02:04:56', '::1', 'User logged in'),
(34, 21, 'add_book', 'books', 6, '2025-05-12 02:06:50', '::1', 'Added book: To Kill a Mockingbird (ISBN: 1234567)'),
(35, 21, 'update_book', 'books', 6, '2025-05-12 02:07:27', '::1', 'Updated book: To Kill a Mockingbird (ISBN: 1234567)'),
(36, 21, 'add_category', 'categories', 11, '2025-05-12 02:07:50', '::1', 'Added category: Romance'),
(37, 21, 'user_login', 'users', 21, '2025-05-12 02:10:10', '::1', 'User logged in'),
(38, 21, 'user_login', 'users', 21, '2025-05-12 02:10:51', '::1', 'User logged in'),
(39, 21, 'user_login', 'users', 21, '2025-05-12 02:14:56', '::1', 'User logged in'),
(40, 21, 'user_login', 'users', 21, '2025-05-12 02:27:23', '::1', 'User logged in');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `user_type` enum('admin','librarian','member') NOT NULL,
  `registration_date` datetime DEFAULT current_timestamp(),
  `last_login` datetime DEFAULT NULL,
  `status` enum('active','inactive','suspended') DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `email`, `first_name`, `last_name`, `phone`, `address`, `user_type`, `registration_date`, `last_login`, `status`) VALUES
(18, 'Khairul', '$2y$10$pQ2OktGxYi2FdFsJrcMLHuQzbQgnUqfhPZMgHS0tJtIBzDgibb7k2', 'khairulamin131@gmail.com', 'khairul', 'Amin', '0989878', 'hdakjDKJnadkjn', 'member', '2025-04-29 17:29:37', NULL, 'active'),
(19, 'jonson', '$2y$10$jdb65PCXbnqm.1u6v5MzBeVZ1KYQ2Vndlf2E.iOK2E5B7dTmRir1u', 'jon@gmail.com', 'jon', 'son', '019**********8', 'Narayanganj', 'member', '2025-04-29 23:34:18', NULL, 'active'),
(20, 'abul', '$2y$10$MKTVLnfeNQugfHOTGXUwGepTw6.2/JywD0Ppi0M/ZCWvR/S8x0aY.', 'abul@gmail.com', 'abul', 'bashar', '01*********', 'Zila porishad', 'member', '2025-04-30 01:02:43', NULL, 'active'),
(21, 'Test', '$2y$10$fqXugaGRznNz5GzMBQehu.MbEcxzPVooHyyIKwWnXaq8lJRq45ZmW', 'test@gmail.com', 'test', 'testtest', '01600000000', 'Test', 'admin', '2025-05-11 15:18:21', '2025-05-12 02:27:23', 'active'),
(22, 'John', '$2y$10$Wl/3uajACdFaXFvaNNdB4.37aSqoZJJXNgxjTOyxwtkOWnZkiX9Gi', 'john@test.com', 'John', 'Doe', '01600000000', 'Dhaka', 'member', '2025-05-11 19:15:13', NULL, 'active');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_details`
--
ALTER TABLE `admin_details`
  ADD PRIMARY KEY (`admin_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`book_id`),
  ADD UNIQUE KEY `isbn` (`isbn`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `book_issues`
--
ALTER TABLE `book_issues`
  ADD PRIMARY KEY (`issue_id`),
  ADD KEY `book_id` (`book_id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `issued_by` (`issued_by`),
  ADD KEY `returned_to` (`returned_to`);

--
-- Indexes for table `book_reservations`
--
ALTER TABLE `book_reservations`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `book_id` (`book_id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `parent_category_id` (`parent_category_id`);

--
-- Indexes for table `feedback_tickets`
--
ALTER TABLE `feedback_tickets`
  ADD PRIMARY KEY (`ticket_id`);

--
-- Indexes for table `fines`
--
ALTER TABLE `fines`
  ADD PRIMARY KEY (`fine_id`),
  ADD KEY `issue_id` (`issue_id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `member_details`
--
ALTER TABLE `member_details`
  ADD PRIMARY KEY (`member_id`),
  ADD UNIQUE KEY `membership_number` (`membership_number`),
  ADD UNIQUE KEY `student_id` (`student_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `room_bookings`
--
ALTER TABLE `room_bookings`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `room_id` (`room_id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `booked_by` (`booked_by`);

--
-- Indexes for table `study_rooms`
--
ALTER TABLE `study_rooms`
  ADD PRIMARY KEY (`room_id`);

--
-- Indexes for table `system_logs`
--
ALTER TABLE `system_logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_details`
--
ALTER TABLE `admin_details`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `book_issues`
--
ALTER TABLE `book_issues`
  MODIFY `issue_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `book_reservations`
--
ALTER TABLE `book_reservations`
  MODIFY `reservation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `feedback_tickets`
--
ALTER TABLE `feedback_tickets`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `fines`
--
ALTER TABLE `fines`
  MODIFY `fine_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `member_details`
--
ALTER TABLE `member_details`
  MODIFY `member_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `room_bookings`
--
ALTER TABLE `room_bookings`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `study_rooms`
--
ALTER TABLE `study_rooms`
  MODIFY `room_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `system_logs`
--
ALTER TABLE `system_logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin_details`
--
ALTER TABLE `admin_details`
  ADD CONSTRAINT `admin_details_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);

--
-- Constraints for table `book_issues`
--
ALTER TABLE `book_issues`
  ADD CONSTRAINT `book_issues_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`),
  ADD CONSTRAINT `book_issues_ibfk_2` FOREIGN KEY (`member_id`) REFERENCES `member_details` (`member_id`),
  ADD CONSTRAINT `book_issues_ibfk_3` FOREIGN KEY (`issued_by`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `book_issues_ibfk_4` FOREIGN KEY (`returned_to`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `book_reservations`
--
ALTER TABLE `book_reservations`
  ADD CONSTRAINT `book_reservations_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`),
  ADD CONSTRAINT `book_reservations_ibfk_2` FOREIGN KEY (`member_id`) REFERENCES `member_details` (`member_id`);

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`parent_category_id`) REFERENCES `categories` (`category_id`) ON DELETE SET NULL;

--
-- Constraints for table `fines`
--
ALTER TABLE `fines`
  ADD CONSTRAINT `fines_ibfk_1` FOREIGN KEY (`issue_id`) REFERENCES `book_issues` (`issue_id`),
  ADD CONSTRAINT `fines_ibfk_2` FOREIGN KEY (`member_id`) REFERENCES `member_details` (`member_id`);

--
-- Constraints for table `member_details`
--
ALTER TABLE `member_details`
  ADD CONSTRAINT `member_details_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `room_bookings`
--
ALTER TABLE `room_bookings`
  ADD CONSTRAINT `room_bookings_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `study_rooms` (`room_id`),
  ADD CONSTRAINT `room_bookings_ibfk_2` FOREIGN KEY (`member_id`) REFERENCES `member_details` (`member_id`),
  ADD CONSTRAINT `room_bookings_ibfk_3` FOREIGN KEY (`booked_by`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `system_logs`
--
ALTER TABLE `system_logs`
  ADD CONSTRAINT `system_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
