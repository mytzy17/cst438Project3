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
	`profile_img` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
-- 	`numberOfCorrect` mediumint(9) PRIMARY KEY NOT NULL AUTO_INCREMENT,
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
(13, 1, 'Math', 'https://i.pinimg.com/600x315/d6/1d/d7/d61dd7fcb6fe3417157423b2b48ebfe4.jpg', 'What time is it?', '7:00', 1),
(14, 1, 'Science', '', 'Which animal lays eggs? a. Dog b. Cat c. Duck d.Sheep', 'c', 1),
(15, 1, 'Science', '', 'What part of the plant conducts photosynthesis? a. Branch b. Leaf c. Root d.Trunk', 'b', 2),
(16, 1, 'Science', '', 'What is the boiling point of water? a. 25 C b. 50 C c. 75 C d. 100 C', 'd', 2),
(17, 1, 'Science', '', 'Which is the largest land animal? a. Lion b. Tiger c. Elephant d. Rhinoceros', 'c', 2),
(18, 1, 'Science', '', 'When you push something, you apply? a. Force b. Acceleration c. Mass d. Compression', 'a', 2),
(19, 1, 'Science', '', 'Which group of animals have scales? a. Mammals b. Amphibians c. Reptiles', 'c', 2),
(20, 1, 'Science', '', 'What part of the flower contains the pollen? a. Anther b. Stigma c. Stem d. Leaves', 'a', 3),
(21, 1, 'Science', '', 'Which of the following is NOT scientifically considered a fruit? a. Pumpkin b. Tomato c. Broccoli d. Pear', 'c', 3),
(22, 1, 'Science', '', 'Who came up with the three laws of motion? a. Benjamin Franklin b. Albert Einstein c. Galileo d. Isaac Newton', 'd', 3),
(23, 1, 'Science', '', 'What tissue connects muscles to bones? a. Skin b. Blood vessels c. Fat d. Tendon', 'd', 3),
(24, 1, 'Science', '', 'Which nutrient plays an essential role in muscle-building? a. Protein b. Carbohydrate c. Iron d. Fat', 'a', 4),
(25, 1, 'Science', '', 'Plants need which gas to perform photosynthesis? a. Hydrogen b. Carbon monoxide c. Carbon dioxide d. Carbon dioxide', 'c', 4),
(26, 1, 'Science', '', 'Earth is surrounded by layers of gases collectively called? a. Hydrosphere b. Stratosphere c. Atmosphere d. Ozone layer', 'c', 4),
(27, 1, 'Science', '', 'Which system of the body controls the senses? a. Circulatory system b. Digestive system c. Nervous system d. Skeletal system', 'c', 4),
(28, 1, 'Science', '', 'Similar body cells group together to form a? a. Organ b. Tissue c. Blood vessels d. Joints', 'b', 4),
(29, 1, 'Science', '', 'Which of these is NOT a form of energy we get from the sun? a. Kinetic b. Potential c. Heat d. Light', 'a', 5),
(30, 1, 'Science', '', 'Which two chromosomes do all male humans have? a. YY b. XX c. XY d. ABC', 'c', 5),
(31, 1, 'Science', '', 'What part of the cell are all the organelles found? a. Nucleus b. Cytoplasm c. Cell Wall d. Cell Membrane', 'b', 5),
(32, 1, 'Science', '', 'What is not a function of our skeletal system? a. Digesting b. Protection c. Support d. Movement', 'a', 5),
(33, 1, 'Science', '', 'Which of these is the most efficient for of heat transfer? a. Heat does not transfer b. Conduction c. Convection d. Radiation', 'b', 5),
(34, 1, 'Science', '', 'What energy emerges from motion? a. Potential energy b. Electrical energy c. Kinetic energy d. Gravitational energy', 'c', 6),
(35, 1, 'Science', '', 'The standard unit of measurement for energy is? a. Newton b. Ampere c. Watt d. Joule', 'd', 6),
(36, 1, 'Science', '', 'Which biologist proposed the theory of evolution through natural selection? a. Charles Darwin b. Stephen Hawking c. Francesco Redi d. Alexander Fleming', 'a', 6),
(37, 1, 'Science', '', 'What are animals, which eat both plants and animals, called? a. Herbivores b. Insectivores c. Carnivores d. Omnivores', 'd', 6),
(38, 1, 'Science', '', 'A single piece of coiled DNA is called? a. Nucleus b. Ribosome c. Cytoplasm d. Chromosome', 'd', 6),
(39, 1, 'English', '', 'What is the past simple of become? a. began b. became c. were', 'b', 1),
(40, 1, 'English', '', 'What is the past tense for drink? a. drinks b. drinked c. drinking d. drank', 'd', 2),
(41, 1, 'English', '', 'A sentence that makes a statement, is called a? a. declarative sentence b. interrogative sentence c. exclamatory sentence d. independent sentence', 'a', 2),
(42, 1, 'English', '', 'When you are upset about something, you are? a. happy b. unhappy c. happiest d. unangry', 'b', 2),
(43, 1, 'English', '', 'Ken filled his cup with too much milk and it ____ a. overflowed b. reflowed c. underflowed d. preflowed', 'a', 2),
(44, 1, 'English', '', 'Which of these words is a NOUN? a. cat b. hit c. red d. sing', 'a', 2),
(45, 1, 'English', '', 'The eagle was _____ than the bluebird. a. big b. bigger c. biggest d. most big', 'b', 3),
(46, 1, 'English', '', 'What does the prefix BI mean in BICYCLE? a. two b. one c. not d. round', 'a', 3),
(47, 1, 'English', '', 'What does reread mean? a. read before b. read again c. read wrong d. not read', 'b', 3),
(48, 1, 'English', '', 'When you do not agree with someone, you? a. disagree b. preagree c. reagree d. unagree', 'a', 3),
(49, 1, 'English', '', 'What do you need in a complex sentence? a. subordinating conjunction b. conjunction c. run-on d. fragment', 'a', 3),
(50, 1, 'English', '', 'I would like another ____ of cake. a. piece b. peace c. peece d. peez', 'a', 4),
(51, 1, 'English', '', 'Which one is a correct sentence? a. Good to eat. b. We made cookies. c.Wagging its tail.', 'b', 4),
(52, 1, 'English', '', 'What does the prefix re mean? a. more b. again c. not d. can', 'b', 4),
(53, 1, 'English', '', 'What type of sentence is this? "Are Jessica and Lilith sisters?" a. declarative b. imperative c. exclamatory d. interrogative', 'd', 4),
(54, 1, 'English', '', 'Which of these is a complete sentence? a. My mother drove us to the lake b. My father, brother and mother c. Came home from school today', 'd', 4),
(55, 1, 'English', '', 'Which sentence uses a comma correctly? a. However I am very good at math. b. However I, am very, good at math. c. However, I am very good at math. d. However I am very good, at math.', 'c', 5),
(56, 1, 'English', '', 'The suffix in the word comfortable is? a. for b. table c. ible d. able', 'd', 5),
(57, 1, 'English', '', 'Identify the verb in the following sentence. "That woman is a millionaire." a. that b. woman c. is d. millionaire', 'c', 5),
(58, 1, 'English', '', 'Which of these prefixes means "bad" or "wrong"? a. pre- b. non- c. bi- d. mis-', 'd', 5),
(59, 1, 'English', '', 'Which group of words are helping verbs? a. is, am, are, he b. will, seem, feel, being c. has, have, will, am d. swim, appear, smells, seem', 'c', 5),
(60, 1, 'English', '', 'What does the suffix "ing" mean? a. past tense b. action or process c. full of d. runner', 'b', 6),
(61, 1, 'English', '', 'Identify the adjective in the following sentence. "The rain was steady throughout the afternoon" a. rain b. was c. steady d. throughout', 'c', 6),
(62, 1, 'English', '', 'Which of the following is a non-count noun? a. table b. candle c. dog d. information', 'd', 6),
(63, 1, 'English', '', 'Which sentence is a simple sentence? a. We like to eat cheese. b. We like to eat cheese, although some cheeses are disgusting. c. In the mornings, we like to eat cheese on our eggs and toast. d. In the mornings, before we go to school, we like to eat cheese.', 'a', 6),
(64, 1, 'English', '', 'Disapprove means? a. To not get along b. To not approve of something c. To approve of something', 'b', 6),
(65, 1, 'Math', '', ' a.  b. c. ', 'b', 1);


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
  `testScore` float(5,2) NOT NULL,
  `submissionDate` varchar(100)
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