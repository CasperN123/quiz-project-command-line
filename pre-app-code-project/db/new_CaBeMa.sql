-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 14, 2018 at 02:13 PM
-- Server version: 10.1.33-MariaDB
-- PHP Version: 7.2.6

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

-- --------------------------------------------------------

--
-- Table structure for table `Answers`
--

CREATE TABLE `Answers` (
  `answerID` int(11) NOT NULL,
  `questionID` int(11) NOT NULL,
  `answerText` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Answers`
--

INSERT INTO `Answers` (`answerID`, `questionID`, `answerText`) VALUES
(1, 1, 'This is an answer text'),
(2, 1, 'hejmeddig'),
(3, 1, 'hejmeddig');

-- --------------------------------------------------------

--
-- Table structure for table `Questions`
--

CREATE TABLE `Questions` (
  `questionID` int(11) NOT NULL,
  `quizID` int(11) NOT NULL,
  `correctAnswer` int(11) NOT NULL,
  `text` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Questions`
--

INSERT INTO `Questions` (`questionID`, `quizID`, `correctAnswer`, `text`) VALUES
(1, 1, 1, 'This is a placeholder text'),
(2, 1, 2, 'Another placeholder text was typed here'),
(3, 1, 1, 'Test'),
(4, 3, 3, 'a'),
(5, 8, 8, 'j'),
(6, 1, 2, 'hejmeddig'),
(7, 1, 2, 'hejmeddig');

-- --------------------------------------------------------

--
-- Table structure for table `Quizzes`
--

CREATE TABLE `Quizzes` (
  `quizID` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `creator` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Quizzes`
--

INSERT INTO `Quizzes` (`quizID`, `title`, `description`, `creator`) VALUES
(1, 'quiz1', 'hej', 2),
(3, 'quiz1', 'hej', 3);

-- --------------------------------------------------------

--
-- Table structure for table `UserAnswers`
--

CREATE TABLE `UserAnswers` (
  `userAnswerID` int(11) NOT NULL,
  `questionID` int(11) NOT NULL,
  `userAnswer` int(11) NOT NULL,
  `userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `UserAnswers`
--

INSERT INTO `UserAnswers` (`userAnswerID`, `questionID`, `userAnswer`, `userID`) VALUES
(1, 1, 1, 1),
(2, 1, 1, 1),
(3, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

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
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`userID`, `firstname`, `middlename`, `lastname`, `username`, `password`, `email`) VALUES
(1, 'Peter', 'Poul', 'Petersen', 'sejepeter', 'peterersej', 'sejepeterpetersen@gmail.com'),
(2, 'Heidi', NULL, 'Holgersen', 'heidiholg', 'heidifrejdig', 'heidiholg@gmail.com'),
(3, 'Jesper', 'Just', 'Jørgensen', 'jesperjorg', 'jajajesper', 'jesperjorgensen@sejmail.dk'),
(4, 'Pallan', NULL, 'Allan', 'p_allan', 'slapdogallan', 'pallan_allan@live.com'),
(5, 'ben', 'ja', 'min', 'bensand', '1234', 'hej@meddig.dk'),
(6, 'ben', 'ja', 'min', 'bensand', '1234', 'hej@meddig.dk');

--
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
  MODIFY `answerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Questions`
--
ALTER TABLE `Questions`
  MODIFY `questionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `Quizzes`
--
ALTER TABLE `Quizzes`
  MODIFY `quizID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `UserAnswers`
--
ALTER TABLE `UserAnswers`
  MODIFY `userAnswerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  ADD CONSTRAINT `Answers_ibfk_1` FOREIGN KEY (`questionID`) REFERENCES `Questions` (`questionId`);

--
-- Constraints for table `Quizzes`
--
ALTER TABLE `Quizzes`
  ADD CONSTRAINT `Quizzes_ibfk_1` FOREIGN KEY (`creator`) REFERENCES `Users` (`userID`),
  ADD CONSTRAINT `Quizzes_ibfk_2` FOREIGN KEY (`quizID`) REFERENCES `Questions` (`quizId`);

--
-- Constraints for table `UserAnswers`
--
ALTER TABLE `UserAnswers`
  ADD CONSTRAINT `UserAnswers_ibfk_1` FOREIGN KEY (`questionID`) REFERENCES `Questions` (`questionId`),
  ADD CONSTRAINT `UserAnswers_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `Users` (`userID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
