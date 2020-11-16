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
	`username` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
	`password` varchar(30) COLLATE utf8_unicode_ci NOT NULL
	`email` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
-- 	`gradeLvl` mediumint(9) NOT NULL,
	`background` varchar(200) COLLATE utf8_unicode_ci NOT NULL
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

--
-- Table structure for table `totalAnswers`
--
-- DROP TABLE IF EXISTS `totalAnswers`;
-- CREATE TABLE `totalAnswers` (
-- 	`questionId` mediumint(9) NOT NULL,
-- 	`answer` varchar(25) COLLATE utf8_unicode_ci NOT NULL
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --
-- -- Insertion for table `users`
-- --
-- INSERT INTO `users` (`userId`, `username`, `password`, `email`, `background`) VALUES
-- (1, 'roob', 'roob', 'm@gmail.com', 'https://images.pexels.com/photos/1831234/pexels-photo-1831234.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
-- (2, 'mytzy', 'mytzy', 'm@gmail.com', 'https://images.pexels.com/photos/1831234/pexels-photo-1831234.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
-- (3, 'miguel', 'mytzy', 'm@gmail.com', 'https://lh3.googleusercontent.com/proxy/chlFTAFis-9XmPGc4dTcdP4pHaZSgBT7HahGPzUulOiwFf3z94eWKE8dWGOEmn0NpAOA3qAf4zbNqn9y0tEQVzsfa7EIc27pZSpihQIlRITkIp9d8NoH83vsu16KZsK7LbY'),
-- (4, 'gerard', 'mytzy', 'm@gmail.com', 'https://htmlcolorcodes.com/assets/images/html-color-codes-color-tutorials-hero.jpg'),
-- (5, 'kim', 'mytzy', 'm@gmail.com', 'https://images.pexels.com/photos/1831234/pexels-photo-1831234.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
-- (6, 'angel', 'mytzy', 'm@gmail.com', 'https://cdn.pixabay.com/photo/2017/08/30/01/05/milky-way-2695569_960_720.jpg'),
-- (7, 'yeesus', 'mytzy', 'm@gmail.com', 'https://lh3.googleusercontent.com/proxy/chlFTAFis-9XmPGc4dTcdP4pHaZSgBT7HahGPzUulOiwFf3z94eWKE8dWGOEmn0NpAOA3qAf4zbNqn9y0tEQVzsfa7EIc27pZSpihQIlRITkIp9d8NoH83vsu16KZsK7LbY'),
-- (8, 'chuy', 'mytzy', 'm@gmail.com', 'https://cdn.pixabay.com/photo/2017/08/30/01/05/milky-way-2695569_960_720.jpg'),
-- (9, 'chu', 'mytzy', 'm@gmail.com', 'https://lh3.googleusercontent.com/proxy/chlFTAFis-9XmPGc4dTcdP4pHaZSgBT7HahGPzUulOiwFf3z94eWKE8dWGOEmn0NpAOA3qAf4zbNqn9y0tEQVzsfa7EIc27pZSpihQIlRITkIp9d8NoH83vsu16KZsK7LbY'),
-- (10, 'caas', 'mytzy', 'm@gmail.com', 'https://images.pexels.com/photos/1831234/pexels-photo-1831234.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
-- (11, 'humphrey', 'mytzy', 'm@gmail.com', 'https://htmlcolorcodes.com/assets/images/html-color-codes-color-tutorials-hero.jpg'),
-- (12, 'jenjen', 'mytzy', 'm@gmail.com', 'https://images.pexels.com/photos/1831234/pexels-photo-1831234.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
-- (13, 'theobald', 'mytzy', 'm@gmail.com', 'https://htmlcolorcodes.com/assets/images/html-color-codes-color-tutorials-hero.jpg'),
-- (14, 'trinh', 'mytzy', 'm@gmail.com', 'https://htmlcolorcodes.com/assets/images/html-color-codes-color-tutorials-hero.jpg'),
-- (15, 'escobar', 'mytzy', 'm@gmail.com', 'https://cdn.pixabay.com/photo/2017/08/30/01/05/milky-way-2695569_960_720.jpg');

INSERT INTO `users` (`userId`, `username`, `password`, `email`) VALUES
(1, 'roob', 'roob', 'm@gmail.com'),
(2, 'mytzy', 'mytzy', 'm@gmail.com');

--
-- Insertion for table `totalQuestions`
--
INSERT INTO `totalQuestions` (`questionId`, `difficulty`, `category`, `image`, `question`, `answer`, `gradeLvl`) VALUES
(1, 5, 'Math', '', '5 + 3 = _ + 7', '1', 1),
(2, 6, 'Science', '', 'What part of a bone builds new blood cells? a. Joints b. Bone marrow c. Spongy bone d. Compact bone', 'b', 3),
(3, 3, 'English', '', 'Which letters BEST complete the word? spar____ a. kle b. kel c. kele', 'a', 1),
(4, 9, 'Math', '', '524 + 633 = ', '1157', 2),
(5, 8, 'Englsh', '', 'A person who is shy probably does NOT? a. talk a lot. b. like animals. c. have any friends. d. get along with people.', 'a', 4),
(6, 1, 'Science', '', 'Which law says that an object in motion will stay in motion unless another forces changes that? a. First law b. Second law c. Third law d. All', 'a', 5);

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

ALTER TABLE `users`
  ADD PRIMARY KEY (`userId`);
ALTER TABLE `totalQuestions`
  ADD PRIMARY KEY (`questionId`);
-- ALTER TABLE `totalAnswers`
--   ADD PRIMARY KEY (`questionsId`);

ALTER TABLE `users`
  MODIFY `userId` tinyint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
ALTER TABLE `totalQuestions`
  MODIFY `questionId` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
  
COMMIT;