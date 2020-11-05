SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Table structure for table `users`
--
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
	`userId` mediumint(9) NOT NULL,
	`username` varchar(10) COLLATE utf8_unicode_ci NOT NULL UNIQUE,
	`password` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
	`email` varchar(500) COLLATE utf8_unicode_ci,
	`gender` varchar(100) COLLATE utf8_unicode_ci,
	`gradeLvl` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Table structure for table `totalQuestions`
--
DROP TABLE IF EXISTS `totalQuestions`;
CREATE TABLE `totalQuestions` (
  `questionsId` mediumint(97) NOT NULL,
  `difficulty` mediumint(97) DEFAULT NULL,
  `category` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `question` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `gradeLvl` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- --
-- -- Insertion for table `users`
-- --
INSERT INTO `users` (`userId`, `username`, `password`, `email`, `gender`, `gradeLvl`) VALUES
--

--
-- Insertion for table `totalQuestions`
--
INSERT INTO `totalQuestions` (`questionsId`, `difficulty`, `category`, `image`, `question`, `gradeLvl`) VALUES
--


ALTER TABLE `users`
  ADD PRIMARY KEY (`userId`);
-- ALTER TABLE `totalQuestions`
--   ADD PRIMARY KEY (`questionsId`);

ALTER TABLE `users`
  MODIFY `userId` tinyint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
-- ALTER TABLE `totalQuestions`
--   MODIFY `questionsId` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
  
COMMIT;