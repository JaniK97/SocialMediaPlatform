-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 25.04.2019 klo 15:58
-- Palvelimen versio: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `social`
--
CREATE DATABASE IF NOT EXISTS `social` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `social`;

-- --------------------------------------------------------

--
-- Rakenne taululle `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `post_body` text NOT NULL,
  `posted_by` varchar(60) NOT NULL,
  `posted_to` varchar(60) NOT NULL,
  `date_added` datetime NOT NULL,
  `removed` varchar(3) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Vedos taulusta `comments`
--

INSERT INTO `comments` (`id`, `post_body`, `posted_by`, `posted_to`, `date_added`, `removed`, `post_id`) VALUES
(31, 'Onnittelut palveluun liittymisestÃ¤ !', 'ross_lantea', 'jani_karlsson', '2019-04-25 16:41:31', 'no', 105),
(32, 'HyvÃ¤ video Ross !', 'jani_karlsson', 'ross_lantea', '2019-04-25 16:43:59', 'no', 107),
(33, 'Kiitos !', 'jani_karlsson', 'jani_karlsson', '2019-04-25 16:48:28', 'no', 105);

-- --------------------------------------------------------

--
-- Rakenne taululle `friend_requests`
--

CREATE TABLE `friend_requests` (
  `id` int(11) NOT NULL,
  `user_to` varchar(50) NOT NULL,
  `user_from` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Rakenne taululle `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `username` varchar(60) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Vedos taulusta `likes`
--

INSERT INTO `likes` (`id`, `username`, `post_id`) VALUES
(13, 'ross_lantea', 105),
(14, 'jani_karlsson', 107),
(15, 'ross_lantea', 108);

-- --------------------------------------------------------

--
-- Rakenne taululle `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `user_to` varchar(50) NOT NULL,
  `user_from` varchar(50) NOT NULL,
  `body` text NOT NULL,
  `date` datetime NOT NULL,
  `opened` varchar(3) NOT NULL,
  `viewed` varchar(3) NOT NULL,
  `deleted` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Vedos taulusta `messages`
--

INSERT INTO `messages` (`id`, `user_to`, `user_from`, `body`, `date`, `opened`, `viewed`, `deleted`) VALUES
(66, 'ross_lantea', 'jani_karlsson', 'Heippa ! Oliko mahdollista tulla tÃ¤nÃ¤Ã¤n kÃ¤ymÃ¤Ã¤n ?', '2019-04-25 16:44:42', 'yes', 'no', 'no'),
(67, 'jani_karlsson', 'ross_lantea', 'Hei, kyllÃ¤hÃ¤n tuo onnistuu! Oletko mihin aikaan tulossa ?', '2019-04-25 16:47:35', 'no', 'no', 'no');

-- --------------------------------------------------------

--
-- Rakenne taululle `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_to` varchar(50) NOT NULL,
  `user_from` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `link` varchar(100) NOT NULL,
  `datetime` datetime NOT NULL,
  `opened` varchar(3) NOT NULL,
  `viewed` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Vedos taulusta `notifications`
--

INSERT INTO `notifications` (`id`, `user_to`, `user_from`, `message`, `link`, `datetime`, `opened`, `viewed`) VALUES
(16, 'jani_karlsson', 'ross_lantea', 'Ross Lantea liked your post', 'post.php?id=105', '2019-04-25 16:41:19', 'no', 'no'),
(17, 'jani_karlsson', 'ross_lantea', 'Ross Lantea commented on your post', 'post.php?id=105', '2019-04-25 16:41:31', 'no', 'no'),
(18, 'ross_lantea', 'jani_karlsson', 'Jani Karlsson liked your post', 'post.php?id=107', '2019-04-25 16:43:48', 'no', 'no'),
(19, 'ross_lantea', 'jani_karlsson', 'Jani Karlsson commented on your post', 'post.php?id=107', '2019-04-25 16:43:59', 'no', 'no'),
(20, 'ross_lantea', 'jani_karlsson', 'Jani Karlsson commented on a post you commented on', 'post.php?id=105', '2019-04-25 16:48:28', 'no', 'no'),
(21, 'jani_karlsson', 'ross_lantea', 'Ross Lantea liked your post', 'post.php?id=108', '2019-04-25 16:57:26', 'no', 'no');

-- --------------------------------------------------------

--
-- Rakenne taululle `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `body` text NOT NULL,
  `added_by` varchar(60) NOT NULL,
  `user_to` varchar(60) NOT NULL,
  `date_added` datetime NOT NULL,
  `user_closed` varchar(3) NOT NULL,
  `deleted` varchar(3) NOT NULL,
  `likes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Vedos taulusta `posts`
--

INSERT INTO `posts` (`id`, `body`, `added_by`, `user_to`, `date_added`, `user_closed`, `deleted`, `likes`) VALUES
(105, 'EnsimmÃ¤inen postaus #SugarMouseTV !!!!', 'jani_karlsson', 'none', '2019-04-25 16:41:01', 'no', 'no', 1),
(107, '<br><iframe width=\'420\' height=\'315\' src=\'https://www.youtube.com/embed/QdVgdZEruSk\'></iframe><br>', 'ross_lantea', 'none', '2019-04-25 16:43:27', 'no', 'no', 1),
(108, 'Ulkona paistaa aurinko ! #summer', 'jani_karlsson', 'none', '2019-04-25 16:53:50', 'no', 'no', 1),
(109, 'TÃ¤Ã¤llÃ¤ Sipoossa vain sataa... #raining', 'ross_lantea', 'none', '2019-04-25 16:57:12', 'no', 'no', 0);

-- --------------------------------------------------------

--
-- Rakenne taululle `trends`
--

CREATE TABLE `trends` (
  `title` varchar(50) NOT NULL,
  `hits` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Vedos taulusta `trends`
--

INSERT INTO `trends` (`title`, `hits`) VALUES
('Tll', 1),
('Sipoossa', 1),
('Vain', 1),
('Sataa', 1),
('Raining', 1);

-- --------------------------------------------------------

--
-- Rakenne taululle `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `signup_date` date NOT NULL,
  `profile_pic` varchar(255) NOT NULL,
  `num_posts` int(11) NOT NULL,
  `num_likes` int(11) NOT NULL,
  `user_closed` varchar(3) NOT NULL,
  `friend_array` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Vedos taulusta `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `username`, `email`, `password`, `signup_date`, `profile_pic`, `num_posts`, `num_likes`, `user_closed`, `friend_array`) VALUES
(19, 'Jani', 'Karlsson', 'jani_karlsson', 'Jani@gmail.com', '27e6aae6a9859819fb5e94454354bde5', '2019-04-25', 'assets/images/profile_pics/jani_karlsson9b35b852cf9d6fbb5f3961a83676ab14n.jpeg', 2, 2, 'no', ',ross_lantea,'),
(20, 'Ross', 'Lantea', 'ross_lantea', 'Ross@gmail.com', '27e6aae6a9859819fb5e94454354bde5', '2019-04-25', 'assets/images/profile_pics/ross_lantea9c24eb6e356336d3a58bbdec1d91318dn.jpeg', 3, 1, 'no', ',jani_karlsson,');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `friend_requests`
--
ALTER TABLE `friend_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `friend_requests`
--
ALTER TABLE `friend_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
