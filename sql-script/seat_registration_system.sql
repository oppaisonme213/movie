-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 26, 2021 at 05:50 PM
-- Server version: 8.0.17
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `seat_registration_system`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `bookSeat` (IN `user_id` INT, IN `seat` INT)  begin

update movie_seat_table
join user_table
on movie_seat_table.user_id = user_table.user_id
join seat_table
on movie_seat_table.seat_id = seat_table.seat_id
set movie_seat_table.is_available = 0 and movie_seat_user_id = user_id 
where movie_seat_table.movie_seat_id = seat;

end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getSeats` (IN `movie` INT)  begin
declare x int default 1;
while x <= 72 do
	insert into movie_seat_table(movie_id, seat_id)values(movie, x);
	set x = x + 1;
end while;

end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `setBooked` (IN `id` INT, IN `times` INT, IN `multiple` INT)  begin
declare x int default 0;
declare y int default 0;
set x = 72 * times;
set y = x - 72;
while y <= x do
	update movie_seat_table
	set is_available = false
	where movie_id = id and movie_seat_id = y;
    
    set y = y + multiple;
end while;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `verifyUser` (IN `email` VARCHAR(255), IN `pass` VARCHAR(255), OUT `user_id` INT)  begin

select user_table.user_id from user_table
where user_table.email = email and user_table.pass = pass; 

end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `food_table`
--

CREATE TABLE `food_table` (
  `food_id` int(11) NOT NULL,
  `food_name` varchar(255) DEFAULT NULL,
  `image_source` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `food_table`
--

INSERT INTO `food_table` (`food_id`, `food_name`, `image_source`, `price`) VALUES
(1, 'Lay\'s Potato Chips', 'https://www.londondrugs.com/on/demandware.static/-/Sites-londondrugs-master/default/dw60299dab/products/L0871670/large/L0871670.JPG', '199.00'),
(2, 'Hotdog', 'https://upload.wikimedia.org/wikipedia/commons/f/fb/Hotdog_-_Evan_Swigart.jpg', '99.00'),
(3, 'Icecream Sandwich', 'https://www.chatelaine.com/wp-content/uploads/2019/07/Chapmans-Vanilla-Super-Sandwich-Box.jpg', '55.20'),
(4, 'Nachoes Fully Loaded', 'https://thebusybaker.ca/wp-content/uploads/2017/12/rainbow-vegetable-skillet-nachos-fbig1.jpg', '190.99'),
(5, 'Pizza Slice', 'https://wallpaperaccess.com/full/3667701.jpg', '39.99'),
(6, 'Gummy Bears', 'https://i5.walmartimages.com/asr/f9cb6a41-3045-4dbf-b603-ff9189266e5f_1.8ffbc8a801b32246e50926abb38d7697.jpeg', '69.50'),
(7, 'Soft Pretzel', 'https://thumbor.thedailymeal.com/IXdZFF4UQuN17_9-PWGMFp9Tz8c=/870x565/https://www.thedailymeal.com/sites/default/files/2015/11/04/soft%20pretzle-shutterstock-Brent%20Hofacker_181113260.jpg', '39.99'),
(8, 'Popcorn', 'https://i2.wp.com/www.spainonafork.com/wp-content/uploads/2019/04/popcornHOR-11.png?fit=750%2C750&ssl=1', '40.00'),
(9, 'M&M\'s', 'https://images-na.ssl-images-amazon.com/images/I/71RNc7ru%2BnL._SL1500_.jpg', '100.00'),
(10, 'Ice Tea', 'https://horsedrop.com/wp-content/uploads/2020/05/snapshotimagehandler_1132800572.jpeg', '39.00'),
(11, 'Soft Drink', 'https://i.insider.com/564a12aa2491f9c12e8b5488?width=1036&format=jpeg', '45.50'),
(12, 'Beer', 'https://cf.shopee.ph/file/b228755f95453ff05c88f7cc5c117f6c', '60.00');

-- --------------------------------------------------------

--
-- Table structure for table `movie_seat_table`
--

CREATE TABLE `movie_seat_table` (
  `movie_seat_id` int(11) NOT NULL,
  `movie_id` int(11) DEFAULT NULL,
  `seat_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `is_available` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `movie_seat_table`
--

INSERT INTO `movie_seat_table` (`movie_seat_id`, `movie_id`, `seat_id`, `user_id`, `is_available`) VALUES
(1, 1, 1, NULL, 1),
(2, 1, 2, NULL, 1),
(3, 1, 3, NULL, 0),
(4, 1, 4, NULL, 1),
(5, 1, 5, NULL, 1),
(6, 1, 6, NULL, 0),
(7, 1, 7, NULL, 1),
(8, 1, 8, NULL, 1),
(9, 1, 9, NULL, 0),
(10, 1, 10, NULL, 1),
(11, 1, 11, 16, 0),
(12, 1, 12, NULL, 0),
(13, 1, 13, NULL, 1),
(14, 1, 14, NULL, 1),
(15, 1, 15, NULL, 0),
(16, 1, 16, NULL, 1),
(17, 1, 17, NULL, 1),
(18, 1, 18, NULL, 0),
(19, 1, 19, NULL, 1),
(20, 1, 20, NULL, 1),
(21, 1, 21, NULL, 0),
(22, 1, 22, NULL, 1),
(23, 1, 23, NULL, 1),
(24, 1, 24, NULL, 0),
(25, 1, 25, NULL, 1),
(26, 1, 26, 15, 0),
(27, 1, 27, NULL, 0),
(28, 1, 28, NULL, 1),
(29, 1, 29, NULL, 1),
(30, 1, 30, NULL, 0),
(31, 1, 31, NULL, 1),
(32, 1, 32, NULL, 1),
(33, 1, 33, NULL, 0),
(34, 1, 34, NULL, 1),
(35, 1, 35, NULL, 1),
(36, 1, 36, NULL, 0),
(37, 1, 37, NULL, 1),
(38, 1, 38, NULL, 1),
(39, 1, 39, NULL, 0),
(40, 1, 40, NULL, 1),
(41, 1, 41, 2, 0),
(42, 1, 42, NULL, 0),
(43, 1, 43, NULL, 1),
(44, 1, 44, NULL, 1),
(45, 1, 45, NULL, 0),
(46, 1, 46, NULL, 1),
(47, 1, 47, NULL, 1),
(48, 1, 48, NULL, 0),
(49, 1, 49, NULL, 1),
(50, 1, 50, NULL, 1),
(51, 1, 51, NULL, 0),
(52, 1, 52, NULL, 1),
(53, 1, 53, NULL, 1),
(54, 1, 54, NULL, 0),
(55, 1, 55, NULL, 1),
(56, 1, 56, NULL, 1),
(57, 1, 57, NULL, 0),
(58, 1, 58, NULL, 1),
(59, 1, 59, NULL, 1),
(60, 1, 60, NULL, 0),
(61, 1, 61, NULL, 1),
(62, 1, 62, NULL, 1),
(63, 1, 63, NULL, 0),
(64, 1, 64, NULL, 1),
(65, 1, 65, NULL, 1),
(66, 1, 66, NULL, 0),
(67, 1, 67, NULL, 1),
(68, 1, 68, NULL, 1),
(69, 1, 69, NULL, 0),
(70, 1, 70, NULL, 1),
(71, 1, 71, NULL, 1),
(72, 1, 72, NULL, 0),
(73, 2, 1, NULL, 1),
(74, 2, 2, NULL, 0),
(75, 2, 3, NULL, 1),
(76, 2, 4, NULL, 0),
(77, 2, 5, NULL, 1),
(78, 2, 6, NULL, 0),
(79, 2, 7, NULL, 1),
(80, 2, 8, NULL, 0),
(81, 2, 9, NULL, 0),
(82, 2, 10, NULL, 0),
(83, 2, 11, 16, 0),
(84, 2, 12, NULL, 0),
(85, 2, 13, NULL, 1),
(86, 2, 14, NULL, 0),
(87, 2, 15, NULL, 1),
(88, 2, 16, NULL, 0),
(89, 2, 17, NULL, 1),
(90, 2, 18, NULL, 0),
(91, 2, 19, NULL, 1),
(92, 2, 20, NULL, 0),
(93, 2, 21, NULL, 1),
(94, 2, 22, NULL, 0),
(95, 2, 23, NULL, 1),
(96, 2, 24, NULL, 0),
(97, 2, 25, NULL, 1),
(98, 2, 26, 15, 0),
(99, 2, 27, NULL, 0),
(100, 2, 28, NULL, 0),
(101, 2, 29, NULL, 1),
(102, 2, 30, NULL, 0),
(103, 2, 31, NULL, 1),
(104, 2, 32, NULL, 0),
(105, 2, 33, NULL, 1),
(106, 2, 34, NULL, 0),
(107, 2, 35, NULL, 1),
(108, 2, 36, NULL, 0),
(109, 2, 37, NULL, 1),
(110, 2, 38, NULL, 0),
(111, 2, 39, NULL, 1),
(112, 2, 40, NULL, 0),
(113, 2, 41, 2, 0),
(114, 2, 42, NULL, 0),
(115, 2, 43, NULL, 1),
(116, 2, 44, NULL, 0),
(117, 2, 45, NULL, 0),
(118, 2, 46, NULL, 0),
(119, 2, 47, NULL, 1),
(120, 2, 48, NULL, 0),
(121, 2, 49, NULL, 1),
(122, 2, 50, NULL, 0),
(123, 2, 51, NULL, 1),
(124, 2, 52, NULL, 0),
(125, 2, 53, NULL, 1),
(126, 2, 54, NULL, 0),
(127, 2, 55, NULL, 1),
(128, 2, 56, NULL, 0),
(129, 2, 57, NULL, 1),
(130, 2, 58, NULL, 0),
(131, 2, 59, NULL, 1),
(132, 2, 60, NULL, 0),
(133, 2, 61, NULL, 1),
(134, 2, 62, NULL, 0),
(135, 2, 63, NULL, 0),
(136, 2, 64, NULL, 0),
(137, 2, 65, NULL, 1),
(138, 2, 66, NULL, 0),
(139, 2, 67, NULL, 1),
(140, 2, 68, NULL, 0),
(141, 2, 69, NULL, 1),
(142, 2, 70, NULL, 0),
(143, 2, 71, NULL, 1),
(144, 2, 72, NULL, 0),
(145, 3, 1, NULL, 1),
(146, 3, 2, NULL, 1),
(147, 3, 3, NULL, 1),
(148, 3, 4, NULL, 0),
(149, 3, 5, NULL, 1),
(150, 3, 6, NULL, 1),
(151, 3, 7, NULL, 0),
(152, 3, 8, NULL, 0),
(153, 3, 9, NULL, 1),
(154, 3, 10, NULL, 1),
(155, 3, 11, 16, 0),
(156, 3, 12, NULL, 0),
(157, 3, 13, NULL, 1),
(158, 3, 14, NULL, 0),
(159, 3, 15, NULL, 1),
(160, 3, 16, NULL, 0),
(161, 3, 17, NULL, 1),
(162, 3, 18, NULL, 1),
(163, 3, 19, NULL, 1),
(164, 3, 20, NULL, 0),
(165, 3, 21, NULL, 0),
(166, 3, 22, NULL, 1),
(167, 3, 23, NULL, 1),
(168, 3, 24, NULL, 0),
(169, 3, 25, NULL, 1),
(170, 3, 26, 15, 0),
(171, 3, 27, NULL, 1),
(172, 3, 28, NULL, 0),
(173, 3, 29, NULL, 1),
(174, 3, 30, NULL, 1),
(175, 3, 31, NULL, 1),
(176, 3, 32, NULL, 0),
(177, 3, 33, NULL, 1),
(178, 3, 34, NULL, 1),
(179, 3, 35, NULL, 0),
(180, 3, 36, NULL, 0),
(181, 3, 37, NULL, 1),
(182, 3, 38, NULL, 1),
(183, 3, 39, NULL, 1),
(184, 3, 40, NULL, 0),
(185, 3, 41, 2, 0),
(186, 3, 42, NULL, 0),
(187, 3, 43, NULL, 1),
(188, 3, 44, NULL, 0),
(189, 3, 45, NULL, 1),
(190, 3, 46, NULL, 1),
(191, 3, 47, NULL, 1),
(192, 3, 48, NULL, 0),
(193, 3, 49, NULL, 0),
(194, 3, 50, NULL, 1),
(195, 3, 51, NULL, 1),
(196, 3, 52, NULL, 0),
(197, 3, 53, NULL, 1),
(198, 3, 54, NULL, 1),
(199, 3, 55, NULL, 1),
(200, 3, 56, NULL, 0),
(201, 3, 57, NULL, 1),
(202, 3, 58, NULL, 1),
(203, 3, 59, NULL, 1),
(204, 3, 60, NULL, 0),
(205, 3, 61, NULL, 1),
(206, 3, 62, NULL, 1),
(207, 3, 63, NULL, 0),
(208, 3, 64, NULL, 0),
(209, 3, 65, NULL, 1),
(210, 3, 66, NULL, 1),
(211, 3, 67, NULL, 1),
(212, 3, 68, NULL, 0),
(213, 3, 69, NULL, 1),
(214, 3, 70, NULL, 0),
(215, 3, 71, NULL, 1),
(216, 3, 72, NULL, 0),
(217, 4, 1, NULL, 1),
(218, 4, 2, NULL, 1),
(219, 4, 3, NULL, 0),
(220, 4, 4, NULL, 0),
(221, 4, 5, NULL, 1),
(222, 4, 6, NULL, 0),
(223, 4, 7, NULL, 1),
(224, 4, 8, NULL, 0),
(225, 4, 9, NULL, 0),
(226, 4, 10, NULL, 1),
(227, 4, 11, 16, 0),
(228, 4, 12, NULL, 0),
(229, 4, 13, NULL, 1),
(230, 4, 14, NULL, 1),
(231, 4, 15, NULL, 0),
(232, 4, 16, NULL, 0),
(233, 4, 17, NULL, 1),
(234, 4, 18, NULL, 0),
(235, 4, 19, NULL, 1),
(236, 4, 20, NULL, 0),
(237, 4, 21, NULL, 0),
(238, 4, 22, NULL, 1),
(239, 4, 23, NULL, 1),
(240, 4, 24, NULL, 0),
(241, 4, 25, NULL, 1),
(242, 4, 26, 15, 0),
(243, 4, 27, NULL, 0),
(244, 4, 28, NULL, 0),
(245, 4, 29, NULL, 1),
(246, 4, 30, NULL, 0),
(247, 4, 31, NULL, 1),
(248, 4, 32, NULL, 0),
(249, 4, 33, NULL, 0),
(250, 4, 34, NULL, 1),
(251, 4, 35, NULL, 1),
(252, 4, 36, NULL, 0),
(253, 4, 37, NULL, 1),
(254, 4, 38, NULL, 1),
(255, 4, 39, NULL, 0),
(256, 4, 40, NULL, 0),
(257, 4, 41, 2, 0),
(258, 4, 42, NULL, 0),
(259, 4, 43, NULL, 1),
(260, 4, 44, NULL, 0),
(261, 4, 45, NULL, 0),
(262, 4, 46, NULL, 1),
(263, 4, 47, NULL, 1),
(264, 4, 48, NULL, 0),
(265, 4, 49, NULL, 1),
(266, 4, 50, NULL, 1),
(267, 4, 51, NULL, 0),
(268, 4, 52, NULL, 0),
(269, 4, 53, NULL, 1),
(270, 4, 54, NULL, 0),
(271, 4, 55, NULL, 1),
(272, 4, 56, NULL, 0),
(273, 4, 57, NULL, 0),
(274, 4, 58, NULL, 1),
(275, 4, 59, NULL, 1),
(276, 4, 60, NULL, 0),
(277, 4, 61, NULL, 1),
(278, 4, 62, NULL, 1),
(279, 4, 63, NULL, 0),
(280, 4, 64, NULL, 0),
(281, 4, 65, NULL, 1),
(282, 4, 66, NULL, 0),
(283, 4, 67, NULL, 1),
(284, 4, 68, NULL, 0),
(285, 4, 69, NULL, 0),
(286, 4, 70, NULL, 1),
(287, 4, 71, NULL, 1),
(288, 4, 72, NULL, 0),
(289, 5, 1, NULL, 1),
(290, 5, 2, NULL, 1),
(291, 5, 3, NULL, 0),
(292, 5, 4, NULL, 1),
(293, 5, 5, NULL, 1),
(294, 5, 6, NULL, 0),
(295, 5, 7, NULL, 0),
(296, 5, 8, NULL, 1),
(297, 5, 9, NULL, 0),
(298, 5, 10, NULL, 1),
(299, 5, 11, 16, 0),
(300, 5, 12, NULL, 0),
(301, 5, 13, NULL, 1),
(302, 5, 14, NULL, 0),
(303, 5, 15, NULL, 0),
(304, 5, 16, NULL, 1),
(305, 5, 17, NULL, 1),
(306, 5, 18, NULL, 0),
(307, 5, 19, NULL, 1),
(308, 5, 20, NULL, 1),
(309, 5, 21, NULL, 0),
(310, 5, 22, NULL, 1),
(311, 5, 23, NULL, 1),
(312, 5, 24, NULL, 0),
(313, 5, 25, NULL, 1),
(314, 5, 26, 15, 0),
(315, 5, 27, NULL, 0),
(316, 5, 28, NULL, 0),
(317, 5, 29, NULL, 1),
(318, 5, 30, NULL, 0),
(319, 5, 31, NULL, 1),
(320, 5, 32, NULL, 1),
(321, 5, 33, NULL, 0),
(322, 5, 34, NULL, 1),
(323, 5, 35, NULL, 0),
(324, 5, 36, NULL, 0),
(325, 5, 37, NULL, 1),
(326, 5, 38, NULL, 1),
(327, 5, 39, NULL, 0),
(328, 5, 40, NULL, 1),
(329, 5, 41, 2, 0),
(330, 5, 42, NULL, 0),
(331, 5, 43, NULL, 1),
(332, 5, 44, NULL, 1),
(333, 5, 45, NULL, 0),
(334, 5, 46, NULL, 1),
(335, 5, 47, NULL, 1),
(336, 5, 48, NULL, 0),
(337, 5, 49, NULL, 0),
(338, 5, 50, NULL, 1),
(339, 5, 51, NULL, 0),
(340, 5, 52, NULL, 1),
(341, 5, 53, NULL, 1),
(342, 5, 54, NULL, 0),
(343, 5, 55, NULL, 1),
(344, 5, 56, NULL, 0),
(345, 5, 57, NULL, 0),
(346, 5, 58, NULL, 1),
(347, 5, 59, NULL, 1),
(348, 5, 60, NULL, 0),
(349, 5, 61, NULL, 1),
(350, 5, 62, NULL, 1),
(351, 5, 63, NULL, 0),
(352, 5, 64, NULL, 1),
(353, 5, 65, NULL, 1),
(354, 5, 66, NULL, 0),
(355, 5, 67, NULL, 1),
(356, 5, 68, NULL, 1),
(357, 5, 69, NULL, 0),
(358, 5, 70, NULL, 0),
(359, 5, 71, NULL, 1),
(360, 5, 72, NULL, 0),
(361, 6, 1, NULL, 1),
(362, 6, 2, NULL, 1),
(363, 6, 3, NULL, 1),
(364, 6, 4, NULL, 1),
(365, 6, 5, NULL, 0),
(366, 6, 6, NULL, 1),
(367, 6, 7, NULL, 1),
(368, 6, 8, NULL, 1),
(369, 6, 9, NULL, 0),
(370, 6, 10, NULL, 0),
(371, 6, 11, 16, 0),
(372, 6, 12, NULL, 1),
(373, 6, 13, NULL, 1),
(374, 6, 14, NULL, 1),
(375, 6, 15, NULL, 0),
(376, 6, 16, NULL, 1),
(377, 6, 17, NULL, 1),
(378, 6, 18, NULL, 0),
(379, 6, 19, NULL, 1),
(380, 6, 20, NULL, 0),
(381, 6, 21, NULL, 1),
(382, 6, 22, NULL, 1),
(383, 6, 23, NULL, 1),
(384, 6, 24, NULL, 1),
(385, 6, 25, NULL, 0),
(386, 6, 26, 15, 0),
(387, 6, 27, NULL, 0),
(388, 6, 28, NULL, 1),
(389, 6, 29, NULL, 1),
(390, 6, 30, NULL, 0),
(391, 6, 31, NULL, 1),
(392, 6, 32, NULL, 1),
(393, 6, 33, NULL, 1),
(394, 6, 34, NULL, 1),
(395, 6, 35, NULL, 0),
(396, 6, 36, NULL, 0),
(397, 6, 37, NULL, 1),
(398, 6, 38, NULL, 1),
(399, 6, 39, NULL, 1),
(400, 6, 40, NULL, 0),
(401, 6, 41, 2, 0),
(402, 6, 42, NULL, 1),
(403, 6, 43, NULL, 1),
(404, 6, 44, NULL, 1),
(405, 6, 45, NULL, 0),
(406, 6, 46, NULL, 1),
(407, 6, 47, NULL, 1),
(408, 6, 48, NULL, 1),
(409, 6, 49, NULL, 1),
(410, 6, 50, NULL, 0),
(411, 6, 51, NULL, 1),
(412, 6, 52, NULL, 1),
(413, 6, 53, NULL, 1),
(414, 6, 54, NULL, 0),
(415, 6, 55, NULL, 0),
(416, 6, 56, NULL, 1),
(417, 6, 57, NULL, 1),
(418, 6, 58, NULL, 1),
(419, 6, 59, NULL, 1),
(420, 6, 60, NULL, 0),
(421, 6, 61, NULL, 1),
(422, 6, 62, NULL, 1),
(423, 6, 63, NULL, 0),
(424, 6, 64, NULL, 1),
(425, 6, 65, NULL, 0),
(426, 6, 66, NULL, 1),
(427, 6, 67, NULL, 1),
(428, 6, 68, NULL, 1),
(429, 6, 69, NULL, 1),
(430, 6, 70, NULL, 0),
(431, 6, 71, NULL, 1),
(432, 6, 72, NULL, 0),
(433, 7, 1, NULL, 1),
(434, 7, 2, NULL, 1),
(435, 7, 3, NULL, 1),
(436, 7, 4, NULL, 1),
(437, 7, 5, NULL, 1),
(438, 7, 6, NULL, 1),
(439, 7, 7, NULL, 0),
(440, 7, 8, NULL, 1),
(441, 7, 9, NULL, 1),
(442, 7, 10, NULL, 1),
(443, 7, 11, 16, 0),
(444, 7, 12, NULL, 1),
(445, 7, 13, NULL, 1),
(446, 7, 14, NULL, 0),
(447, 7, 15, NULL, 1),
(448, 7, 16, NULL, 1),
(449, 7, 17, NULL, 1),
(450, 7, 18, NULL, 1),
(451, 7, 19, NULL, 1),
(452, 7, 20, NULL, 1),
(453, 7, 21, NULL, 0),
(454, 7, 22, NULL, 1),
(455, 7, 23, NULL, 1),
(456, 7, 24, NULL, 1),
(457, 7, 25, NULL, 1),
(458, 7, 26, 15, 0),
(459, 7, 27, NULL, 1),
(460, 7, 28, NULL, 0),
(461, 7, 29, NULL, 1),
(462, 7, 30, NULL, 1),
(463, 7, 31, NULL, 1),
(464, 7, 32, NULL, 1),
(465, 7, 33, NULL, 1),
(466, 7, 34, NULL, 1),
(467, 7, 35, NULL, 0),
(468, 7, 36, NULL, 1),
(469, 7, 37, NULL, 1),
(470, 7, 38, NULL, 1),
(471, 7, 39, NULL, 1),
(472, 7, 40, NULL, 1),
(473, 7, 41, 2, 0),
(474, 7, 42, NULL, 0),
(475, 7, 43, NULL, 1),
(476, 7, 44, NULL, 1),
(477, 7, 45, NULL, 1),
(478, 7, 46, NULL, 1),
(479, 7, 47, NULL, 1),
(480, 7, 48, NULL, 1),
(481, 7, 49, NULL, 0),
(482, 7, 50, NULL, 1),
(483, 7, 51, NULL, 1),
(484, 7, 52, NULL, 1),
(485, 7, 53, NULL, 1),
(486, 7, 54, NULL, 1),
(487, 7, 55, NULL, 1),
(488, 7, 56, NULL, 0),
(489, 7, 57, NULL, 1),
(490, 7, 58, NULL, 1),
(491, 7, 59, NULL, 1),
(492, 7, 60, NULL, 1),
(493, 7, 61, NULL, 1),
(494, 7, 62, NULL, 1),
(495, 7, 63, NULL, 0),
(496, 7, 64, NULL, 1),
(497, 7, 65, NULL, 1),
(498, 7, 66, NULL, 1),
(499, 7, 67, NULL, 1),
(500, 7, 68, NULL, 1),
(501, 7, 69, NULL, 1),
(502, 7, 70, NULL, 0),
(503, 7, 71, NULL, 1),
(504, 7, 72, NULL, 1),
(505, 8, 1, NULL, 1),
(506, 8, 2, NULL, 1),
(507, 8, 3, NULL, 0),
(508, 8, 4, NULL, 1),
(509, 8, 5, NULL, 1),
(510, 8, 6, NULL, 0),
(511, 8, 7, NULL, 0),
(512, 8, 8, NULL, 0),
(513, 8, 9, NULL, 0),
(514, 8, 10, NULL, 1),
(515, 8, 11, 16, 0),
(516, 8, 12, NULL, 0),
(517, 8, 13, NULL, 1),
(518, 8, 14, NULL, 0),
(519, 8, 15, NULL, 0),
(520, 8, 16, NULL, 0),
(521, 8, 17, NULL, 1),
(522, 8, 18, NULL, 0),
(523, 8, 19, NULL, 1),
(524, 8, 20, NULL, 1),
(525, 8, 21, NULL, 0),
(526, 8, 22, NULL, 1),
(527, 8, 23, NULL, 1),
(528, 8, 24, NULL, 0),
(529, 8, 25, NULL, 1),
(530, 8, 26, 15, 0),
(531, 8, 27, NULL, 0),
(532, 8, 28, NULL, 0),
(533, 8, 29, NULL, 1),
(534, 8, 30, NULL, 0),
(535, 8, 31, NULL, 1),
(536, 8, 32, NULL, 0),
(537, 8, 33, NULL, 0),
(538, 8, 34, NULL, 1),
(539, 8, 35, NULL, 0),
(540, 8, 36, NULL, 0),
(541, 8, 37, NULL, 1),
(542, 8, 38, NULL, 1),
(543, 8, 39, NULL, 0),
(544, 8, 40, NULL, 0),
(545, 8, 41, 2, 0),
(546, 8, 42, NULL, 0),
(547, 8, 43, NULL, 1),
(548, 8, 44, NULL, 1),
(549, 8, 45, NULL, 0),
(550, 8, 46, NULL, 1),
(551, 8, 47, NULL, 1),
(552, 8, 48, NULL, 0),
(553, 8, 49, NULL, 0),
(554, 8, 50, NULL, 1),
(555, 8, 51, NULL, 0),
(556, 8, 52, NULL, 1),
(557, 8, 53, NULL, 1),
(558, 8, 54, NULL, 0),
(559, 8, 55, NULL, 1),
(560, 8, 56, NULL, 0),
(561, 8, 57, NULL, 0),
(562, 8, 58, NULL, 1),
(563, 8, 59, NULL, 1),
(564, 8, 60, NULL, 0),
(565, 8, 61, NULL, 1),
(566, 8, 62, NULL, 1),
(567, 8, 63, NULL, 0),
(568, 8, 64, NULL, 0),
(569, 8, 65, NULL, 1),
(570, 8, 66, NULL, 0),
(571, 8, 67, NULL, 1),
(572, 8, 68, NULL, 1),
(573, 8, 69, NULL, 0),
(574, 8, 70, NULL, 0),
(575, 8, 71, NULL, 1),
(576, 8, 72, NULL, 0),
(577, 9, 1, NULL, 1),
(578, 9, 2, NULL, 0),
(579, 9, 3, NULL, 1),
(580, 9, 4, NULL, 0),
(581, 9, 5, NULL, 1),
(582, 9, 6, NULL, 0),
(583, 9, 7, NULL, 1),
(584, 9, 8, NULL, 0),
(585, 9, 9, NULL, 1),
(586, 9, 10, NULL, 0),
(587, 9, 11, 16, 0),
(588, 9, 12, NULL, 0),
(589, 9, 13, NULL, 1),
(590, 9, 14, NULL, 0),
(591, 9, 15, NULL, 1),
(592, 9, 16, NULL, 0),
(593, 9, 17, NULL, 1),
(594, 9, 18, NULL, 0),
(595, 9, 19, NULL, 1),
(596, 9, 20, NULL, 0),
(597, 9, 21, NULL, 1),
(598, 9, 22, NULL, 0),
(599, 9, 23, NULL, 1),
(600, 9, 24, NULL, 0),
(601, 9, 25, NULL, 1),
(602, 9, 26, 15, 0),
(603, 9, 27, NULL, 1),
(604, 9, 28, NULL, 0),
(605, 9, 29, NULL, 1),
(606, 9, 30, NULL, 0),
(607, 9, 31, NULL, 1),
(608, 9, 32, NULL, 0),
(609, 9, 33, NULL, 1),
(610, 9, 34, NULL, 0),
(611, 9, 35, NULL, 1),
(612, 9, 36, NULL, 0),
(613, 9, 37, NULL, 1),
(614, 9, 38, NULL, 0),
(615, 9, 39, NULL, 1),
(616, 9, 40, NULL, 0),
(617, 9, 41, 2, 0),
(618, 9, 42, NULL, 0),
(619, 9, 43, NULL, 1),
(620, 9, 44, NULL, 0),
(621, 9, 45, NULL, 1),
(622, 9, 46, NULL, 0),
(623, 9, 47, NULL, 1),
(624, 9, 48, NULL, 0),
(625, 9, 49, NULL, 1),
(626, 9, 50, NULL, 0),
(627, 9, 51, NULL, 1),
(628, 9, 52, NULL, 0),
(629, 9, 53, NULL, 1),
(630, 9, 54, NULL, 0),
(631, 9, 55, NULL, 1),
(632, 9, 56, NULL, 0),
(633, 9, 57, NULL, 1),
(634, 9, 58, NULL, 0),
(635, 9, 59, NULL, 1),
(636, 9, 60, NULL, 0),
(637, 9, 61, NULL, 1),
(638, 9, 62, NULL, 0),
(639, 9, 63, NULL, 1),
(640, 9, 64, NULL, 0),
(641, 9, 65, NULL, 1),
(642, 9, 66, NULL, 0),
(643, 9, 67, NULL, 1),
(644, 9, 68, NULL, 0),
(645, 9, 69, NULL, 1),
(646, 9, 70, NULL, 0),
(647, 9, 71, NULL, 1),
(648, 9, 72, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `movie_table`
--

CREATE TABLE `movie_table` (
  `movie_id` int(11) NOT NULL,
  `movie_name` varchar(255) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `movie_table`
--

INSERT INTO `movie_table` (`movie_id`, `movie_name`, `image_path`) VALUES
(1, 'Raya and the Last Dragon', 'https://variety.com/wp-content/uploads/2020/10/raya.jpg?w=1000'),
(2, 'Godzilla vs. Kong', 'https://variety.com/wp-content/uploads/2019/11/godzilla-king-kong.jpg?w=1000'),
(3, 'Mortal Kombat', 'https://variety.com/wp-content/uploads/2021/01/mortal-kombat.jpg?w=1280'),
(4, 'Cruella', 'https://variety.com/wp-content/uploads/2019/08/cruella.jpg?w=1280'),
(5, 'A Quiet Place Part II', 'https://variety.com/wp-content/uploads/2020/04/a-quiet-place-2.jpg?w=751'),
(6, 'Fast & Furious 9', 'https://variety.com/wp-content/uploads/2020/01/fast-3.jpg?w=1280'),
(7, 'Black Widow', 'https://variety.com/wp-content/uploads/2019/12/black-widow-trailer-2.jpg?w=1000'),
(8, 'Space Jam: A New Legacy', 'https://variety.com/wp-content/uploads/2021/01/Space-Jam.jpg?w=1280'),
(9, 'Forever Purge', 'https://variety.com/wp-content/uploads/2016/08/5-the-purge-election-year.jpg?w=700');

-- --------------------------------------------------------

--
-- Table structure for table `seat_table`
--

CREATE TABLE `seat_table` (
  `seat_id` int(11) NOT NULL,
  `seat_number` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `seat_table`
--

INSERT INTO `seat_table` (`seat_id`, `seat_number`) VALUES
(1, 'A1'),
(2, 'A2'),
(3, 'A3'),
(4, 'A4'),
(5, 'A5'),
(6, 'A6'),
(7, 'A7'),
(8, 'A8'),
(9, 'A9'),
(10, 'B1'),
(11, 'B2'),
(12, 'B3'),
(13, 'B4'),
(14, 'B5'),
(15, 'B6'),
(16, 'B7'),
(17, 'B8'),
(18, 'B9'),
(19, 'C1'),
(20, 'C2'),
(21, 'C3'),
(22, 'C4'),
(23, 'C5'),
(24, 'C6'),
(25, 'C7'),
(26, 'C8'),
(27, 'C9'),
(28, 'D1'),
(29, 'D2'),
(30, 'D3'),
(31, 'D4'),
(32, 'D5'),
(33, 'D6'),
(34, 'D7'),
(35, 'D8'),
(36, 'D9'),
(37, 'E1'),
(38, 'E2'),
(39, 'E3'),
(40, 'E4'),
(41, 'E5'),
(42, 'E6'),
(43, 'E7'),
(44, 'E8'),
(45, 'E9'),
(46, 'F1'),
(47, 'F2'),
(48, 'F3'),
(49, 'F4'),
(50, 'F5'),
(51, 'F6'),
(52, 'F7'),
(53, 'F8'),
(54, 'F9'),
(55, 'G1'),
(56, 'G2'),
(57, 'G3'),
(58, 'G4'),
(59, 'G5'),
(60, 'G6'),
(61, 'G7'),
(62, 'G8'),
(63, 'G9'),
(64, 'H1'),
(65, 'H2'),
(66, 'H3'),
(67, 'H4'),
(68, 'H5'),
(69, 'H6'),
(70, 'H7'),
(71, 'H8'),
(72, 'H9');

-- --------------------------------------------------------

--
-- Table structure for table `user_table`
--

CREATE TABLE `user_table` (
  `user_id` int(11) NOT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_table`
--

INSERT INTO `user_table` (`user_id`, `firstName`, `lastName`, `email`, `pass`) VALUES
(1, 'Billy', 'Bob', 'BillyBob@farmersUnion.org', 'corn'),
(2, 'James', 'Maye', 'man@gmail.com', '12qwaszx'),
(4, 'Johnny', 'Wang', 'WangGang@gmail.com', 'ganggang'),
(6, 'Steph', 'Maye', 'steph@gmail.com', '12qwaszx'),
(9, 'Jimmy', 'Neutron', 'jimmy@gmail.com', 'boygenius'),
(11, 'Timmy', 'Turner', 'magic@magiccakes.org', 'wands'),
(12, 'Stephanie', 'Maye', 'main@gmail.com', '12qwaszx'),
(14, 'john', 'bitau', 'miss@gmail.com', '12qwaszx'),
(15, 'Mario', 'Mushroom', 'mushroomMan@kingdom.com', '12qwaszx'),
(16, 'James', 'Maye', 'Jamesmaye6094@gmail.com', '12qwaszx');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `food_table`
--
ALTER TABLE `food_table`
  ADD PRIMARY KEY (`food_id`);

--
-- Indexes for table `movie_seat_table`
--
ALTER TABLE `movie_seat_table`
  ADD PRIMARY KEY (`movie_seat_id`),
  ADD KEY `movie_id` (`movie_id`),
  ADD KEY `seat_id` (`seat_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `movie_table`
--
ALTER TABLE `movie_table`
  ADD PRIMARY KEY (`movie_id`);

--
-- Indexes for table `seat_table`
--
ALTER TABLE `seat_table`
  ADD PRIMARY KEY (`seat_id`),
  ADD UNIQUE KEY `seat_number` (`seat_number`);

--
-- Indexes for table `user_table`
--
ALTER TABLE `user_table`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `food_table`
--
ALTER TABLE `food_table`
  MODIFY `food_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `movie_seat_table`
--
ALTER TABLE `movie_seat_table`
  MODIFY `movie_seat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=649;

--
-- AUTO_INCREMENT for table `movie_table`
--
ALTER TABLE `movie_table`
  MODIFY `movie_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `seat_table`
--
ALTER TABLE `seat_table`
  MODIFY `seat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `user_table`
--
ALTER TABLE `user_table`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `movie_seat_table`
--
ALTER TABLE `movie_seat_table`
  ADD CONSTRAINT `movie_seat_table_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movie_table` (`movie_id`),
  ADD CONSTRAINT `movie_seat_table_ibfk_2` FOREIGN KEY (`seat_id`) REFERENCES `seat_table` (`seat_id`),
  ADD CONSTRAINT `movie_seat_table_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
