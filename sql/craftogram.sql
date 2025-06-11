-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 11, 2025 at 08:33 AM
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
-- Database: `craftogram`
--

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int(11) NOT NULL,
  `images` varchar(255) NOT NULL,
  `author` varchar(100) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `category` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `images`, `author`, `title`, `content`, `category`, `created_at`) VALUES
(50, '\"672866bf76caf-pb1.webp\"', 'mina', 'Blue glaze on pottery', 'The use of blue glaze on pottery is an imported technique, first developed by Mongol artisans who combined Chinese glazing technology with Persian decorative arts. This technique travelled east to India with early Turkish conquests in the 14th century. During its infancy, it was used to make tiles to decorate mosques, tombs and palaces in Central Asia. Later, following their conquests and arrival in India, the Mughals began using them in India. Gradually the blue glaze technique grew beyond an architectural accessory to Indian potters. From there, the technique travelled to the plains of Delhi and in the 17th century went to Jaipur, the pink city of India.\\r\\nToday, blue pottery is an industry that provides livelihood to many people in Jaipur. The traditional designs have been adopted, and now, apart from the usual urns, jars, pots and vases, you can find tea sets, cups and saucers, plates and glasses, jugs, ashtrays and napkin rings.', 'pottery', '2024-11-04 06:16:31'),
(51, '\"6728671311d70-pb2.webp\"', 'dimple', 'Vintage', 'Vintage Hand Painted Indian Pottery Vase. Painted by multiple artisans and is completely unique. Painted in India. 12 inches in height by 6 inches in diameter. No chips or cracks. One of a kind.', 'pottery', '2024-11-04 06:17:55'),
(52, '\"672867a716a73-pb4.webp\"', 'moru', 'SwadeshiBlessings', 'Swadeshi Blessings brings to you an Exclusive Indian Traditional Clay Cookware Range that will surely help you create a ‘WOW’ factor experience in front of your guests. It is beautifully handcrafted by the abled craftsman of Rajasthan, India.\\r\\nThe founders of Swadeshi Blessings vowed to make a difference in the lives of thousands of local craftspeople & artisans thereby creating a global marketplace for them.', 'pottery', '2024-11-04 06:20:23'),
(53, '\"6728680fea12c-thangka-painting.jpg\"', 'nandini', 'Thangka painting', ' A Thangka painting is a Buddhist painting on cotton, silk appliqué usually depicting a Buddhist deity, a Buddhist scene or a   Mandala. Not only is it used to adorn homes, but it is also an important mode of religious expression.', 'paintings', '2024-11-04 06:22:07'),
(54, '\"6728683c2d013-madhubani-painting.jpg\"', 'rekha', 'Madhubani painting', ' Madhubani painting, also called Mithila painting, is a traditional folk art of Bihar which is known all over the world.', 'paintings', '2024-11-04 06:22:52'),
(55, '\"67286891c758d-Jadupatua-Painting.jpg\"', 'sanju', ' Jadupatua painting', ' Jadupatua painting is an art practiced by the Santhal tribe of Jharkhand.\\r\\nThe Jadupatuas are painted on scrolls depicting themes from the life of Lord Krishna, the story of creation according to the Santhal tradition and their dance and music and sometimes death images and life after death.', 'paintings', '2024-11-04 06:24:17'),
(56, '\"67286924380a2-Banarasi.webp\"', 'neha', 'Banarasi', 'Known for its rich sacred history, heritage & opulent textile crafts, Banaras (Varanasi) is one city that needs no institutional recognition. We love roving to cities that are backed with deep-rooted tales, strolling on the ghats of Banaras and attending the holy Ganga Aarti makes us fall in love with this city all over again.', 'textiles', '2024-11-04 06:26:44'),
(57, '\"67286966baa21-bhuj.webp\"', 'moru', 'Textile craft', 'A textile craft highly revered amongst the Khatri Community, Ajrak found its way to India in the 16th century routing its way from the Sindh province to Kutch, Gujarat. With artisans spread across Dhamadka Village & Ajrakhpur until date, their brave stories of continuing to keep the legacy of this textile craft intact even after the disastrous Bhuj Earthquake in 2001 is indeed inspiring and noteworthy. Our team of textile designers work with artisans spread across Barmer and Bhuj, featuring a mix of earthy and bright prints!', 'textiles', '2024-11-04 06:27:50'),
(58, '\"672869b7586ed-Azulejos-hand-painted-tiles.jpg\"', 'sanju', 'Azulejos', 'Azulejos are hand painted tiles that were originally brought to Goa by the Portuguese. Blue and yellow were the favourite colour combinations of the tiles which depicted mainly floral patterns and religious scenes though now new themes and colours are being added.', 'textiles', '2024-11-04 06:29:11'),
(59, '\"67286a4d57601-ab.avif\"', 'rekha', 'Knitted pocket squares', 'I hand knit these pocket squares in soft, fine and mostly natural fibres (wool & wool blend).', 'accessories', '2024-11-04 06:31:41'),
(60, '\"67286a86751d4-ab4.avif\"', 'dimple', 'Denim bag', 'Perfect casual summer vibes, this lightweight but sturdy cross body or clutch bag has been designed and handmade from preloved, upcycled denim jeans with striped chenille upholstery fabric in rich warm tones. Inside is an opulent copper coloured shot silk lining adding an extra touch of luxury.', 'accessories', '2024-11-04 06:32:38'),
(61, '\"67286aef89190-ab5.avif\"', 'varad', 'Hair bow', 'Hair bow and scrunchie set made using a bright neon flower print cotton fabric.', 'accessories', '2024-11-04 06:34:23'),
(63, '', 'janhavi', 'pottey', 'hiiiiiiii', 'accessories', '2024-11-08 05:09:02'),
(64, '\"672d9d1595f00-672d9178572af-2.jpg\"', 'janhavi', 'potry', 'hiiiiiiiiiiiiiiiiiiiii', 'paintings', '2024-11-08 05:09:41');

--
-- Triggers `blogs`
--
DELIMITER $$
CREATE TRIGGER `remove_brackets_before_insert` BEFORE INSERT ON `blogs` FOR EACH ROW BEGIN
    -- Update the images column to remove brackets and quotes
    SET NEW.images = REPLACE(REPLACE(NEW.images, '[', ''), ']', '');
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `blog_comments`
--

CREATE TABLE `blog_comments` (
  `id` int(11) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `comment_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blog_comments`
--

INSERT INTO `blog_comments` (`id`, `blog_id`, `comment`, `comment_time`) VALUES
(8, 53, 'amazing!!!', '2024-11-04 07:15:32'),
(9, 61, 'beautiful !', '2024-11-04 15:29:11'),
(10, 64, 'hiiiiiiiii', '2024-11-08 05:10:21'),
(11, 53, 'yess', '2024-11-08 05:10:36'),
(12, 53, 'nice', '2024-11-08 07:07:01');

-- --------------------------------------------------------

--
-- Table structure for table `blog_likes`
--

CREATE TABLE `blog_likes` (
  `id` int(11) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blog_likes`
--

INSERT INTO `blog_likes` (`id`, `blog_id`, `created_at`) VALUES
(4, 53, '2024-11-04 06:34:31'),
(5, 53, '2024-11-04 07:15:22'),
(6, 53, '2024-11-04 07:15:22'),
(7, 54, '2024-11-04 07:15:23'),
(8, 50, '2024-11-04 07:16:03'),
(9, 50, '2024-11-04 07:16:03'),
(10, 50, '2024-11-04 07:16:04'),
(11, 50, '2024-11-04 07:16:04'),
(12, 50, '2024-11-04 07:16:04'),
(13, 51, '2024-11-04 07:16:05'),
(14, 51, '2024-11-04 07:16:05'),
(15, 51, '2024-11-04 07:16:05'),
(16, 59, '2024-11-04 07:17:46'),
(17, 59, '2024-11-04 07:17:47'),
(18, 60, '2024-11-04 07:17:48'),
(19, 60, '2024-11-04 07:17:48'),
(20, 56, '2024-11-04 07:18:24'),
(21, 57, '2024-11-04 07:18:25'),
(22, 57, '2024-11-04 07:18:25'),
(23, 57, '2024-11-04 07:18:25'),
(24, 61, '2024-11-04 15:28:58'),
(25, 61, '2024-11-04 15:28:59'),
(26, 61, '2024-11-04 16:18:42'),
(27, 61, '2024-11-04 16:18:42'),
(28, 61, '2024-11-04 16:18:42'),
(29, 61, '2024-11-04 16:18:42'),
(30, 61, '2024-11-04 16:18:43'),
(31, 61, '2024-11-04 16:18:43'),
(32, 61, '2024-11-04 16:18:43'),
(33, 61, '2024-11-04 16:18:43'),
(34, 61, '2024-11-04 16:18:43'),
(35, 61, '2024-11-04 16:18:43'),
(36, 61, '2024-11-04 16:18:43'),
(37, 61, '2024-11-04 16:18:44'),
(38, 61, '2024-11-04 16:18:44'),
(39, 61, '2024-11-04 16:18:45'),
(40, 61, '2024-11-04 16:18:45'),
(41, 61, '2024-11-04 16:18:45'),
(42, 61, '2024-11-04 16:18:45'),
(43, 61, '2024-11-04 16:18:45'),
(44, 61, '2024-11-04 16:18:46'),
(45, 61, '2024-11-04 16:18:46'),
(46, 61, '2024-11-04 16:18:46'),
(47, 61, '2024-11-04 16:18:46'),
(48, 61, '2024-11-04 16:18:46'),
(49, 61, '2024-11-04 16:18:47'),
(50, 53, '2024-11-08 04:14:37'),
(51, 53, '2024-11-08 04:14:39'),
(52, 54, '2024-11-08 04:14:54'),
(55, 64, '2024-11-08 05:10:14'),
(56, 64, '2024-11-08 05:10:14'),
(57, 64, '2024-11-08 05:10:14'),
(58, 64, '2024-11-08 05:10:15'),
(59, 64, '2024-11-08 05:10:15'),
(60, 64, '2024-11-08 05:10:15'),
(61, 64, '2024-11-08 05:10:15'),
(62, 64, '2024-11-08 05:10:15'),
(63, 64, '2024-11-08 05:10:15'),
(64, 64, '2024-11-08 05:10:16'),
(65, 64, '2024-11-08 05:10:16'),
(66, 64, '2024-11-08 05:10:16'),
(67, 64, '2024-11-08 05:10:16'),
(68, 64, '2024-11-08 05:10:16'),
(69, 64, '2024-11-08 05:10:16'),
(70, 64, '2024-11-08 05:10:17'),
(71, 55, '2024-11-08 05:10:25'),
(72, 55, '2024-11-08 05:10:25'),
(73, 55, '2024-11-08 05:10:25'),
(74, 55, '2024-11-08 05:10:26'),
(75, 55, '2024-11-08 05:10:26'),
(76, 55, '2024-11-08 05:10:26'),
(77, 55, '2024-11-08 05:10:26'),
(78, 55, '2024-11-08 05:10:26'),
(79, 55, '2024-11-08 05:10:26'),
(80, 55, '2024-11-08 05:10:27'),
(81, 53, '2024-11-08 05:10:29'),
(82, 53, '2024-11-08 05:10:29'),
(83, 53, '2024-11-08 05:10:29'),
(84, 53, '2024-11-08 05:10:29'),
(85, 53, '2024-11-08 05:10:30'),
(86, 53, '2024-11-08 05:10:30'),
(87, 53, '2024-11-08 05:10:30'),
(88, 53, '2024-11-08 05:10:30'),
(89, 53, '2024-11-08 05:10:31'),
(90, 53, '2024-11-08 05:10:31'),
(91, 53, '2024-11-08 05:10:31'),
(92, 53, '2024-11-08 05:10:31'),
(93, 53, '2024-11-08 05:10:32'),
(94, 53, '2024-11-08 07:06:51'),
(95, 53, '2024-11-19 12:01:58'),
(96, 53, '2024-11-19 12:01:58'),
(97, 53, '2024-11-19 12:01:59');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `organizer` varchar(100) NOT NULL,
  `event_date` date NOT NULL,
  `event_time` varchar(200) NOT NULL,
  `location` varchar(255) NOT NULL,
  `fees` decimal(10,2) NOT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `language` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `title`, `description`, `organizer`, `event_date`, `event_time`, `location`, `fees`, `image_path`, `category`, `language`) VALUES
(2, 'Block Painting', 'Master the block painting with your skills and enthusiam', 'Kinjal Banushali', '2024-11-21', '4 hours', 'Domblivli', 999.00, 'uploads/c1.jpg', 'Painting', 'English'),
(10, 'Accessories workshop', 'its a chance for artist to showcase their talent .', 'Neha Bura', '2024-11-11', '5 hours', 'Mahad', 666.00, 'uploads/Accessories.jpeg', 'Accessories', 'English');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `caption` varchar(1000) NOT NULL,
  `category` enum('paintings','textiles','accessories','pottery') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `image`, `caption`, `category`, `created_at`) VALUES
(15, 'dimple', 'uploads/t1.jpg', 'odisha:pipili work', 'textiles', '2024-11-04 06:37:07'),
(17, 'varad', 'uploads/p1.jpg', 'kalamkari paintings\r\nandhra pradesh', 'paintings', '2024-11-04 06:42:21'),
(18, 'varad', 'uploads/a3.jpg', 'Dolls with personalities', 'accessories', '2024-11-04 06:42:57'),
(19, 'rekha ', 'uploads/po1.jpg', 'bidri ware\r\nkarnataka', 'pottery', '2024-11-04 06:43:37'),
(20, 'rekha ', 'uploads/t2.webp', 'Traditional Rajasthani textiles wall hanging', 'textiles', '2024-11-04 06:46:11'),
(21, 'sanju', 'uploads/a2.jpg', 'the art', 'accessories', '2024-11-04 06:46:40'),
(22, 'sanju', 'uploads/p2.jpg', 'the colors take you to different realms', 'paintings', '2024-11-04 06:47:17'),
(23, 'sunil', 'uploads/p3.jpg', 'painting on a saree', 'paintings', '2024-11-04 06:48:05'),
(24, 'sunil', 'uploads/po2.jpg', 'its a white ceramic', 'pottery', '2024-11-04 06:48:59'),
(25, 'dimple', 'uploads/a1.jpg', 'jute craft of andhra pradesh', 'accessories', '2024-11-04 06:51:03'),
(26, 'neha ', 'uploads/textileb3.webp', 'the smoothness of fabric is too good', 'textiles', '2024-11-04 06:52:20'),
(27, 'neha ', 'uploads/2.jpg', 'its art that needs to be experienced', 'pottery', '2024-11-04 15:28:17'),
(29, 'neha ', 'uploads/thangka-painting.jpg', 'its a ancient painting', 'paintings', '2024-11-08 07:05:18');

-- --------------------------------------------------------

--
-- Table structure for table `post_comments`
--

CREATE TABLE `post_comments` (
  `post_id` int(11) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `comment_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `post_comments`
--

INSERT INTO `post_comments` (`post_id`, `comment`, `comment_time`) VALUES
(9, 'its a good art', '2024-11-03 17:32:06'),
(9, 'its fabulous', '2024-11-03 17:32:32'),
(12, 'wow', '2024-11-03 19:54:04'),
(11, 'wow\'', '2024-11-03 20:32:00'),
(12, 'yes', '2024-11-03 20:38:51'),
(9, 'qfghj', '2024-11-03 20:42:34'),
(12, 'good', '2024-11-04 05:22:31'),
(22, 'wow!!!!', '2024-11-04 07:14:43'),
(17, 'Amazing', '2024-11-04 07:14:52'),
(19, 'nice', '2024-11-04 07:15:53'),
(18, '!!!!!!!!!!!!11', '2024-11-04 07:16:58'),
(21, 'wow!!!!!!!!!!!!!', '2024-11-04 15:28:44'),
(17, 'What A  Artistic Detailing!', '2024-11-04 16:16:17'),
(17, 'nice', '2024-11-08 04:14:21'),
(17, 'wow!!!!Amazing', '2024-11-19 12:01:52'),
(27, '!!!!!!!!!!!!!!!', '2024-11-19 12:02:28');

-- --------------------------------------------------------

--
-- Table structure for table `post_likes`
--

CREATE TABLE `post_likes` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `post_likes`
--

INSERT INTO `post_likes` (`id`, `post_id`) VALUES
(105, 15),
(31, 17),
(49, 17),
(108, 17),
(109, 17),
(113, 17),
(114, 17),
(115, 17),
(76, 18),
(77, 18),
(78, 18),
(79, 18),
(80, 18),
(81, 18),
(82, 18),
(83, 18),
(84, 18),
(85, 18),
(86, 18),
(87, 18),
(88, 18),
(89, 18),
(90, 18),
(91, 18),
(92, 18),
(93, 18),
(94, 18),
(95, 18),
(96, 18),
(97, 18),
(98, 18),
(99, 18),
(100, 18),
(101, 18),
(36, 19),
(50, 19),
(102, 19),
(41, 20),
(42, 20),
(43, 20),
(44, 20),
(45, 20),
(106, 20),
(118, 20),
(119, 20),
(46, 21),
(61, 21),
(62, 21),
(63, 21),
(64, 21),
(65, 21),
(66, 21),
(67, 21),
(68, 21),
(69, 21),
(70, 21),
(71, 21),
(72, 21),
(73, 21),
(74, 21),
(75, 21),
(48, 22),
(32, 23),
(33, 23),
(34, 23),
(47, 23),
(51, 24),
(103, 24),
(37, 25),
(38, 25),
(39, 25),
(40, 25),
(53, 25),
(54, 25),
(55, 25),
(56, 25),
(57, 25),
(58, 25),
(59, 25),
(60, 25),
(120, 25),
(121, 25),
(107, 26),
(52, 27),
(104, 27),
(116, 27),
(117, 27),
(112, 29);

-- --------------------------------------------------------

--
-- Table structure for table `signup_details`
--

CREATE TABLE `signup_details` (
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `fullname` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `signup_details`
--

INSERT INTO `signup_details` (`username`, `email`, `password`, `fullname`) VALUES
('', '', '$2y$10$B9Vbz3KuTaNqbZsjzEADz.pONZVXCEAzs0f9tIXh.jEwHo2T30uO2', 'nandini patil'),
('aditi', 'aditi@gmail.com', '$2y$10$upD..dhtJaVFi80Kt0w6uurRpxHq0ubxYAwRvQtacnGuY8UMUnWXW', 'aditi lad'),
('dimple', 'dimple@gmail.com', '$2y$10$HS79Qobg5ZHD0vfBorMmeepCDvNeyunk8JqnlvDYiEfDx4x.TOCJ.', 'dimple kolhe'),
('janhavi', 'janhavi@gmail.com', '$2y$10$FAtc7E9K4gMos491LIMoyuZYcKhiExUrmMKwVKfim0juPF8vQPb16', 'janhavi jadhav'),
('k', 'k@gmail.com', '$2y$10$UNZHZfH6eOviZaFGsHfbtO8OBAxwxD6coKXLKufMiPO0/F6Ew539G', 'kinjal bhanushali'),
('kinjal', 'kinjal@gmail.com', '$2y$10$oW0jCWGaMtBw25YEckjqee9dhvvAZR6aqS/98VEp.MLEbd.a8J/FG', 'kinjal bhanushali'),
('kjb', 'kjb@gmail.com', '$2y$10$xIQyWl8CiE12DZ4hhqQu3uIyIpp9yL1hbuqtXqmdsitB2PtBT30sa', 'kinjal bhanushali'),
('M', 'm@gmail.com', '$2y$10$2eTpeVycIaT.eX5.lT.qRe5TV6Mr8/MVahU5fta/kmcktJZU3XQk6', 'M Kolhe'),
('mina ', 'mina@gmail.com', '$2y$10$wbZWD/gj3CgdEyF5iWp7LuHlJXB5v2NJnoEBg9jrhiigEqRNbptdy', 'mina patil'),
('mohan', 'mohan@gmail.com', '$2y$10$44dWJL.5XVCixmxklfVlRu0CieIdFfQ0EtS0y2qFGv.Ao94HO3Sf2', 'mohan patil'),
('moru', 'moru@gmail.com', '$2y$10$V1NTAYRiSbgeEz9M/jnzd.B3WsNsLiI4q9ulkgNSu0dSpDyvXOpb6', 'Morvica kolhe'),
('moru1', 'moru1@gmail.com', '$2y$10$spJ1jAmptqAV3Yc18PHQx.qwAJ1KPObPiF/H4VmGpZEYHxuIQAUEy', 'Morvica kolhe'),
('moru2', 'moru2@gmail.com', '$2y$10$8AJO5Ljw8jCGr558F/mIiOYTSv1Ic3YwGAdDoWl0NKrLMPpX167xK', 'Moru kakd'),
('nandini', 'nandini@gmail.com', '$2y$10$IvlUkKCDwoCaFfRJOJbf1uz2BDS7d.woXhV32vKvYbGt8wb2Ortoe', 'nandini patil'),
('neha ', 'neha@gmail.com', '$2y$10$TqE0.3.SXx1Lk0kUXi3lCOILWmcs9ksiDNECMOkgJwGluTSjxE8KS', 'neha bura '),
('pranjal', 'pranjal@gmail.com', '$2y$10$SphNV/Q27G9BmHE6j3pGcuCjFD2nKdWkha1nlbFCrghnLNaP7x.7i', 'pranjal kolhe'),
('rekha ', 'rekha@gmail.com', '$2y$10$2aZetPt2AiD2CVemIFQxnOcZ0IPeCzGuW6J5qZpzqmKar5XaiigWy', 'rekha kolhe'),
('S', 's@gmail.com', '$2y$10$0FjHVxELI7KoJurbNycSGOQWlzImb5FpGE4rTbUzXjTP.S934N/HG', 'S mmm'),
('sanju', 'sanju@gmail.com', '$2y$10$ui3DPwd/C6mUTkWa.RDtwu6IUsOaz7DTr8OvWLJduH4.VEAvVNvBG', 'sanju patil'),
('shilpa', 'shilpa@gmail.com', '$2y$10$XJMFp343b6nW/21Rvb0.D.I1n7lZoNgdag54fvPdlteN2dYGb4srK', 'shilpa patil'),
('sunil', 'sunil@gmail.com', '$2y$10$1mLzXCbu73l8W486Y5cEU.yB2Q9JJ58W40XDJhKDrjaXEL1T6dW0y', 'sunil kolhe'),
('varad', 'v@gmail.com', '$2y$10$S9EXVbnrH7LfZe6Y43XQK.ct2D/QPvMTVOe7wOFbttWoH99404bHG', 'varad kolhe');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `dob` varchar(10) NOT NULL,
  `gender` enum('Male','Female','Other','') NOT NULL,
  `bio` varchar(1000) NOT NULL,
  `profile_pic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_id`, `first_name`, `last_name`, `email`, `phone`, `dob`, `gender`, `bio`, `profile_pic`) VALUES
(0, '', '', '', '', '', '', '', '', 'default-profile.jpg'),
(0, 'aditi', 'aditi', 'lad', 'aditi@gmail.com', '563214789', '2012-06-14', 'Female', 'i am a artist that want to paint the world with colours of joy.\r\nNice to meet you....\r\n', 'uploads/WhatsApp Image 2024-10-16 at 20.26.10.jpeg'),
(0, 'dimple', 'dimple', 'kolhe', 'dimple@gmail.com', '7539462180', '2024-10-05', 'Female', 'its good to meet you all', 'uploads/WhatsApp Image 2024-09-24 at 10.41.15.jpeg'),
(0, 'janhavi', 'janhavi', 'jadhav', 'janhavi@gmail.com', '845632179', '2024-11-19', 'Female', 'i am a artist of colours......', 'uploads/WhatsApp Image 2024-10-16 at 20.26.10.jpeg'),
(0, 'mina', 'mina ', 'patil', 'mina@gmail.com', '4563210789', '2024-10-30', 'Female', 'i am a girl\r\n', 'uploads/WhatsApp Image 2024-09-24 at 10.41.15.jpeg'),
(0, 'moru', 'morvica', 'kolhe', 'moru@gmail.com', '7418529630', '2024-10-11', 'Female', 'asdfghjkl', 'uploads/WhatsApp Image 2024-09-24 at 10.41.14.jpeg'),
(0, 'moru1', 'morvica ', 'kolhe', 'moru1@gmail.com', '8520147796', '2024-10-30', 'Female', 'qdfghnjm,.', 'default-profile.jpg'),
(0, 'moru2', 'moru', 'kakd', 'moru2@gmail.com', '7410258963', '2024-10-10', 'Female', 'qasdfghjkl', 'default-profile.jpg'),
(0, 'nandini', 'nandini ', 'patil', 'nandini@gmail.com', '5462317089', '2024-10-10', 'Female', 'asdfghjkl;', 'uploads/WhatsApp Image 2024-09-24 at 10.41.14.jpeg'),
(0, 'neha ', 'neha ', 'bura ', 'neha@gmail.com', '1234567891', '2024-10-14', 'Female', 'i am a pottery artist looking forward to more opportunities', 'uploads/WhatsApp Image 2024-10-16 at 20.26.10.jpeg'),
(0, 'rekha', 'rekha', 'kolhe', 'rekha@gmail.com', '7531594280', '2024-10-11', 'Female', 'dfghnm,jhgfds', 'uploads/1.jpeg'),
(0, 'S', 'S', 'mm', 's@gmail.com', '8456213970', '2024-10-05', 'Female', 'i am a girl', 'uploads/WhatsApp Image 2024-10-16 at 20.26.10.jpeg'),
(0, 'sanju', 'sanju', 'patil', 'sanju@gmail.com', '7412580369', '2024-10-18', 'Male', 'sdfrgthyjukil;\'', 'uploads/WhatsApp Image 2024-09-24 at 10.41.14.jpeg'),
(0, 'sunil', 'sunil', 'kolhe', 'sunil@gmail.com', '7512369840', '2024-10-12', 'Male', 'sdfvbgnhjmk,l.;/.l,mnb', 'uploads/1.jpeg'),
(0, 'test_user', 'Test', 'User', 'test@example.com', '1234567890', '2000-01-01', 'Male', 'This is a test bio', 'default-profile.jpg'),
(0, 'varad', 'Varad ', 'Kolhe', 'v@gmail.com', '5420136987', '2024-11-13', 'Male', 'I am proud to show u my arts ', 'uploads/WhatsApp Image 2024-09-24 at 10.41.16 (2).jpeg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_comments`
--
ALTER TABLE `blog_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_id` (`blog_id`);

--
-- Indexes for table `blog_likes`
--
ALTER TABLE `blog_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_blog` (`blog_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_likes`
--
ALTER TABLE `post_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `signup_details`
--
ALTER TABLE `signup_details`
  ADD PRIMARY KEY (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `blog_comments`
--
ALTER TABLE `blog_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `blog_likes`
--
ALTER TABLE `blog_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `post_likes`
--
ALTER TABLE `post_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blog_comments`
--
ALTER TABLE `blog_comments`
  ADD CONSTRAINT `blog_comments_ibfk_1` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `blog_likes`
--
ALTER TABLE `blog_likes`
  ADD CONSTRAINT `fk_blog` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `post_likes`
--
ALTER TABLE `post_likes`
  ADD CONSTRAINT `post_likes_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
