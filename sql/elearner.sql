SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Table structure for table `users`
--
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
	`userId` mediumint(9) PRIMARY KEY NOT NULL AUTO_INCREMENT,
	`username` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
	`password` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
	`email` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
	`profile_img` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
	`isAdmin` mediumint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
 
--
-- Table structure for table `totalQuestions`
--
DROP TABLE IF EXISTS `totalQuestions`;
CREATE TABLE `totalQuestions` (
  `questionId` mediumint(97) NOT NULL,
  `difficulty` mediumint(10) DEFAULT NULL,
  `category` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(200) COLLATE utf8_unicode_ci,
  `question` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `answer` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `gradeLvl` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --
-- -- Insertion for table `users`
-- --

-- INSERT INTO `users` (`userId`, `username`, `password`, `email`) VALUES
-- (1, 'roob', 'roob', 'm@gmail.com'),
-- (2, 'mytzy', 'mytzy', 'm@gmail.com');

--
-- Insertion for table `totalQuestions`
--
INSERT INTO `totalQuestions` (`questionId`, `difficulty`, `category`, `image`, `question`, `answer`, `gradeLvl`) VALUES
(1, 5, 'Math', '', '5 + 3 = _ + 7', '1', 1),
(2, 6, 'Science', '', 'What part of a bone builds new blood cells? a. Joints b. Bone marrow c. Spongy bone d. Compact bone', 'b', 3),
(3, 3, 'English', '', 'Which letters BEST complete the word? spar____ a. kle b. kel c. kele', 'a', 1),
(4, 9, 'Math', '', '524 + 633 = ', '1157', 2),
(5, 8, 'English', '', 'A person who is shy probably does NOT? a. talk a lot. b. like animals. c. have any friends. d. get along with people.', 'a', 4),
(6, 1, 'Science', '', 'Which law says that an object in motion will stay in motion unless another forces changes that? a. First law b. Second law c. Third law d. All', 'a', 5),
(7, 1, 'Science', '', 'What is a scientist called who studies space in space? a. Astronaut b. Biologist c. Paleontologist d. Physicist', 'a', 1),
(8, 1, 'Science', '', 'What is the Sun? a. A black hole b. Lots of lightning c. A bright flashlight d. A star', 'd', 1),
(9, 1, 'Science', '', 'What is a scientist called that studies living things? a. Geologist b. Engineer c. Paleontologist d. Biologist', 'd', 1),
(10, 1, 'English', '', 'Which letters complete the sentence I have to __ my homework? a. do b. does c. is d. am', 'a', 1),
(11, 1, 'English', '', 'what is the past verb of speak? a. speaking b. spoke c. speaker d. talk', 'b', 1),
(12, 1, 'English', '', 'Which letters complete the sentence She __ my friend? a. is b. are c. has', 'a', 1),
(13, 1, 'Math', 'https://i.pinimg.com/600x315/d6/1d/d7/d61dd7fcb6fe3417157423b2b48ebfe4.jpg', 'What time is it?', '7:00', 1);

--
-- Insertion for table `totalAnswers`
--
-- INSERT INTO `totalAnswers` (`questionId`, `answer`) VALUES
-- (1, '1'),
-- (2, 'b'),
-- (3, 'a'),
-- (4, '1157'),
-- (5, 'a'),
-- (6, 'a');

DROP TABLE IF EXISTS `quizAttempts`; 
CREATE TABLE `quizAttempts` ( -- records past quiz attempts. feel free to add anything to it
  `quizAttemptId` mediumint(97) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `userId` mediumint(9) NOT NULL,
  `testScore` float(3,2) NOT NULL,
  `submissionDate` mediumint(97)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS `gradeLvlInfo`;
CREATE TABLE `gradeLvlInfo` (
  `gradeLvl` mediumint(97) NOT NULL UNIQUE,
  `gradeName` varchar(50) NOT NULL,
  `englishDesc` varchar(500),
  `mathDesc` varchar(500),
  `scienceDesc` varchar(500)
);

INSERT INTO `gradeLvlInfo` (`gradeLvl`, `gradeName`, `englishDesc`, `mathDesc`, `scienceDesc`) VALUES
(1, '1st grade', 'A quiz that test student''s english grammer to help understand how to formulate sentences.', 'Math Desc', 'Science Desc'),
(2, '2nd grade', 'English Desc2', 'Math Desc2', 'Science Desc'),
(3, '3rd grade', 'English Desc3', 'Math Desc3', 'Science Desc'),
(4, '4th grade', 'English Desc4', 'Math Desc4', 'Science Desc'),
(5, '5th grade', 'English Desc5', 'Math Desc5', 'Science Desc'),
(6, '6th grade', 'English Desc6', 'Math Desc6', 'Science Desc');

-- ALTER TABLE `users`
--   ADD PRIMARY KEY (`userId`);
ALTER TABLE `totalQuestions`
  ADD PRIMARY KEY (`questionId`);
-- ALTER TABLE `totalAnswers`
--   ADD PRIMARY KEY (`questionsId`);

-- ALTER TABLE `users`
--   MODIFY `userId` tinyint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
ALTER TABLE `totalQuestions`
  MODIFY `questionId` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
  
COMMIT;