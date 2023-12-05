-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 05, 2023 at 08:10 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `movie`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_cast`
--

CREATE TABLE `tb_cast` (
  `movieID` int(11) NOT NULL,
  `castID` int(11) NOT NULL,
  `castName` text NOT NULL,
  `castRole` text NOT NULL,
  `studio` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_category`
--

CREATE TABLE `tb_category` (
  `categoryID` int(11) NOT NULL,
  `categoryName` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_movie`
--

CREATE TABLE `tb_movie` (
  `movieID` int(11) NOT NULL,
  `movieName` text NOT NULL,
  `genre` text NOT NULL,
  `year` year(4) DEFAULT NULL,
  `meanRating` float DEFAULT NULL,
  `numberOfRatings` text DEFAULT NULL,
  `runtime` text DEFAULT NULL,
  `cover` text NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_movie`
--

INSERT INTO `tb_movie` (`movieID`, `movieName`, `genre`, `year`, `meanRating`, `numberOfRatings`, `runtime`, `cover`, `description`) VALUES
(1, 'The Shawshank Redemption', 'Drama', '1994', 9.3, '2,800,000', '2h 22m', 'Shawshank.jpg', 'Shawshank.txt'),
(2, 'The Godfather', 'Crime, Drama', '1972', 9.2, '2,000,000', '2h 55m', 'Godfather.jpg', 'Godfather.txt'),
(3, 'The Dark Knight', 'Action, Crime, Drama', '2008', 9, '2,800,000', '2h 32m', 'DarkKnight.jpg', 'DarkKnight.txt'),
(4, 'The Godfather Part II', 'Crime, Drama', '1974', 9, '1,300,000', '3h 22m', 'Godfather2.jpg', 'Godfather2.txt'),
(5, '12 Angry Men', 'Crime, Drama', '1957', 9, '840,000', '1h 36m', '12AngryMen.jpg', '12AngryMen.txt'),
(6, 'Schindler\'s List', 'Biography, Drama, History', '1993', 9, '1,400,000', '3h 15m', 'SchindlersList.jpg', 'SchindlersList.txt'),
(7, 'The Lord of the Rings: The Return of the King', 'Action, Adventure, Drama', '2003', 9, '1,900,000', '3h 21m', 'Lotr3.jpg', 'Lotr3.txt'),
(8, 'Pulp Fiction', 'Crime, Drama', '1994', 8.9, '2,200,000', '2h 34m', 'PulpFiction.jpg', 'PulpFiction.txt'),
(9, 'The Lord of the Rings: The Fellowship of the Ring', 'Action, Adventure, Drama', '2001', 8.8, '2,000,000', '2h 58m', 'Lotr.jpg', 'Lotr.txt'),
(10, 'The Good, the Bad and the Ugly', 'Adventure, Western', '1966', 8.8, '749,000', '2h 28m', 'GoodBadandUgly.jpg', 'GoodBadandUgly.txt'),
(11, 'Forrest Gump', 'Drama, Romance', '1994', 8.8, '2,200,000', '2h 22m', 'ForrestGump.jpg', 'ForrestGump.txt'),
(12, 'Fight Club', 'Drama', '1999', 8.8, '2,300,000', '2h 19m', 'FightClub.jpg', 'FightClub.txt'),
(13, 'Taxi Driver', 'Crime, Drama', '1976', 8.2, '893,000', '1h 54m', 'TaxiDriver.jpg', 'TaxiDriver.txt'),
(14, 'Goodfellas', 'Biography, Crime, Drama', '1990', 8.7, '1,200,000', '2h 25m', 'Goodfellas.jpg', 'Goodfellas.txt'),
(15, 'Scarface', 'Crime, Drama', '1983', 8.3, '892,000', '2h 50m', 'Scarface.jpg', 'Scarface.txt'),
(16, 'Django Unchained', 'Drama, Western', '2012', 8.5, '1,600,000', '2h 45m', 'Django.jpg', 'Django.txt'),
(17, 'Basketball Diaries', 'Biography, Crime, Drama', '1995', 7.3, '118,000', '1h 42m', 'Basketball.jpg', 'Basketball.txt'),
(18, 'What\'s Eating Gilbert Grape', 'Drama', '1993', 7.7, '249,000', '1h 58m', 'Gilbert.jpg', 'Gilbert.txt'),
(19, 'Good Will Hunting', 'Drama, Romance', '1997', 8.3, '1,000,000', '2h 6m', 'Good.jpg', 'Good.txt'),
(20, 'One Flew Over the Cuckoo\'s Nest', 'Drama', '1975', 8.7, '1,000,000', '2h 13m', 'Cuckoo.jpg', 'Cuckoo.txt');

-- --------------------------------------------------------

--
-- Table structure for table `tb_movielist`
--

CREATE TABLE `tb_movielist` (
  `movieID` int(11) NOT NULL,
  `listID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `listName` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_ratings`
--

CREATE TABLE `tb_ratings` (
  `movieID` int(11) NOT NULL,
  `ratingID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `Stars` tinyint(11) NOT NULL,
  `Review` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tb_ratings`
--

INSERT INTO `tb_ratings` (`movieID`, `ratingID`, `userID`, `Stars`, `Review`) VALUES
(2, 2, 9455, 9, 'Very nice movie! me likes');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(100) NOT NULL,
  `userName` varchar(100) NOT NULL,
  `pwd` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id`, `userName`, `pwd`, `email`) VALUES
(6, '111', '123', '111'),
(9, '1', '1', '1@test.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_category`
--
ALTER TABLE `tb_category`
  ADD PRIMARY KEY (`categoryID`);

--
-- Indexes for table `tb_movie`
--
ALTER TABLE `tb_movie`
  ADD PRIMARY KEY (`movieID`);

--
-- Indexes for table `tb_movielist`
--
ALTER TABLE `tb_movielist`
  ADD PRIMARY KEY (`listID`);

--
-- Indexes for table `tb_ratings`
--
ALTER TABLE `tb_ratings`
  ADD PRIMARY KEY (`ratingID`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_category`
--
ALTER TABLE `tb_category`
  MODIFY `categoryID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_movie`
--
ALTER TABLE `tb_movie`
  MODIFY `movieID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tb_movielist`
--
ALTER TABLE `tb_movielist`
  MODIFY `listID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tb_ratings`
--
ALTER TABLE `tb_ratings`
  MODIFY `ratingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
