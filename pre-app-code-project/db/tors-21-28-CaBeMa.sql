-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 14, 2018 at 09:10 PM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `CaBeMa`
--
DROP DATABASE IF EXISTS `CaBeMa`;
CREATE DATABASE IF NOT EXISTS `CaBeMa` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `CaBeMa`;


-- --------------------------------------------------------
--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
CREATE TABLE `Users` (
  `userID` int(11) NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `middlename` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELATIONSHIPS FOR TABLE `Users`:
--

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`userID`, `firstname`, `middlename`, `lastname`, `username`, `password`, `email`) VALUES
(1, 'Casper', NULL, 'Nørgaard', 'Casper', '1234', 'casper@somewhere.dk'),
(2, 'Benjamin', NULL, 'Sandland', 'Benjamin', '9ABC', 'benjamin@somewhereelse.com'),
(3, 'Maria', NULL, 'Clemmensen', 'Maria', '5678', 'maria@somewhereinbetween.net'),
(4, 'Peter', 'Rudolf', 'Hansen', 'Peter', 'abcd', 'peter@hotmail.com'),
(5, 'Jens', NULL, 'Hansen', 'Jens', 'abcd', 'jens@hotmail.com'),
(6, 'Thomas', 'Fido', 'Pedersen', 'Thomas', 'abcd', 'thomas@hotmail.com');

--
-- --------------------------------------------------------
-- Table structure for table `Quizzes`
--

DROP TABLE IF EXISTS `Quizzes`;
CREATE TABLE `Quizzes` (
  `quizID` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `creator` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `Quizzes`:
--   `creator`
--       `Users` -> `userID`
--

--
-- Dumping data for table `Quizzes`
--

INSERT INTO `Quizzes` (`quizID`, `title`, `description`, `creator`) VALUES
(1, 'Computer Science', 'Basic questions regarding computer science', 1);

-- --------------------------------------------------------


--
-- Table structure for table `Questions`
--

DROP TABLE IF EXISTS `Questions`;
CREATE TABLE `Questions` (
  `questionID` int(11) NOT NULL,
  `quizID` int(11) NOT NULL,
  `correctAnswer` int(11) NOT NULL,
  `trueCorrectAnswerID` int(11) NOT NULL,
  `text` varchar(255) NOT NULL,
  `points` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELATIONSHIPS FOR TABLE `Questions`:
--   `quizID`
--       `Quizzes` -> `quizID`
--

--
-- Dumping data for table `Questions`
--

INSERT INTO `Questions` (`questionID`, `quizID`, `correctAnswer`, `trueCorrectAnswerID`, `text`, `points`) VALUES
(1, 1, 5, 0, 'What does HDD stand for?', 5),
(2, 1, 2, 0, 'What is the cheapest of these?', 3),
(3, 1, 7, 0, 'What is the correct reprensation of a sacartic face?', 3);

-- --------------------------------------------------------

--
-- Table structure for table `Answers`
--

DROP TABLE IF EXISTS `Answers`;
CREATE TABLE `Answers` (
  `answerID` int(11) NOT NULL,
  `questionID` int(11) NOT NULL,
  `answerText` varchar(255) NOT NULL,
  `answerLocalID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `Answers`:
--   `questionID`
--       `Questions` -> `questionID`
--

--
-- Dumping data for table `Answers`
--

INSERT INTO `Answers` (`answerID`, `questionID`, `answerText`, `answerLocalID`) VALUES
(1, 1, 'Highly Dysfunctional Diagnosis', 1),
(2, 1, 'Heavy Drive Disk', 2),
(3, 1, 'High Density Drive', 3),
(4, 1, 'Hydraulic Disk Drive', 4),
(5, 1, 'Hard Disk Drive', 5),
(6, 2, 'MacBook', 1),
(7, 2, 'Toshiba PC', 2),
(8, 3, '1Head', 1),
(9, 3, '2Head', 2),
(10, 3, '3Head', 3),
(11, 3, '5Head', 4),
(12, 3, 'monkaS', 5),
(13, 3, '1/2Head', 6),
(14, 3, '4Head', 7);

-- --------------------------------------------------------
--


--
-- Table structure for table `UserAnswers`
--

DROP TABLE IF EXISTS `UserAnswers`;
CREATE TABLE `UserAnswers` (
  `userAnswerID` int(11) NOT NULL,
  `questionID` int(11) NOT NULL,
  `userAnswer` int(11) NOT NULL,
  `userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `UserAnswers`:
--   `questionID`
--       `Questions` -> `questionID`
--   `userID`
--       `Users` -> `userID`
--

--
-- Dumping data for table `UserAnswers`
--

INSERT INTO `UserAnswers` (`userAnswerID`, `questionID`, `userAnswer`, `userID`) VALUES
(1, 1, 5, 2),
(2, 2, 2, 2),
(3, 3, 7, 2),
(4, 1, 2, 1),
(5, 2, 2, 1),
(6, 3, 7, 1),
(7, 1, 2, 3),
(8, 2, 1, 3),
(9, 3, 3, 3),
(10, 1, 5, 5),
(11, 1, 5, 4),
(12, 1, 4, 6),
(13, 2, 1, 4),
(14, 2, 2, 6),
(15, 3, 4, 4),
(16, 3, 7, 6);

-- --------------------------------------------------------

-- Indexes for dumped tables
--

--
-- Indexes for table `Answers`
--
ALTER TABLE `Answers`
  ADD PRIMARY KEY (`answerID`),
  ADD KEY `questionIndex` (`questionID`) USING BTREE;

--
-- Indexes for table `Questions`
--
ALTER TABLE `Questions`
  ADD PRIMARY KEY (`questionID`),
  ADD KEY `quizIndex` (`quizID`);

--
-- Indexes for table `Quizzes`
--
ALTER TABLE `Quizzes`
  ADD PRIMARY KEY (`quizID`),
  ADD KEY `creatorIndex` (`creator`) USING BTREE;

--
-- Indexes for table `UserAnswers`
--
ALTER TABLE `UserAnswers`
  ADD PRIMARY KEY (`userAnswerID`),
  ADD KEY `questionID-index` (`questionID`),
  ADD KEY `userIndex` (`userID`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`userID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Answers`
--
ALTER TABLE `Answers`
  MODIFY `answerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `Questions`
--
ALTER TABLE `Questions`
  MODIFY `questionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Quizzes`
--
ALTER TABLE `Quizzes`
  MODIFY `quizID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `UserAnswers`
--
ALTER TABLE `UserAnswers`
  MODIFY `userAnswerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Answers`
--
ALTER TABLE `Answers`
  ADD CONSTRAINT `AnswerQuestion` FOREIGN KEY (`questionID`) REFERENCES `Questions` (`questionID`) ON DELETE CASCADE;

--
-- Constraints for table `Questions`
--
ALTER TABLE `Questions`
  ADD CONSTRAINT `QuestionQuiz` FOREIGN KEY (`quizID`) REFERENCES `Quizzes` (`quizID`) ON DELETE CASCADE;

--
-- Constraints for table `Quizzes`
--
ALTER TABLE `Quizzes`
  ADD CONSTRAINT `QuizUser` FOREIGN KEY (`creator`) REFERENCES `Users` (`userID`) ON DELETE CASCADE;

--
-- Constraints for table `UserAnswers`
--
ALTER TABLE `UserAnswers`
  ADD CONSTRAINT `UserAnswerQuestion` FOREIGN KEY (`questionID`) REFERENCES `Questions` (`questionID`) ON DELETE CASCADE,
  ADD CONSTRAINT `UserAnswerUser` FOREIGN KEY (`userID`) REFERENCES `Users` (`userID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
