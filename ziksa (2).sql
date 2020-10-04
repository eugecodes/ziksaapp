-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 09, 2016 at 10:22 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.5.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ziksa`
--

-- --------------------------------------------------------

--
-- Table structure for table `corporate`
--

CREATE TABLE `corporate` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `corporate` varchar(100) NOT NULL,
  `type_trainer` text,
  `when_training` date DEFAULT NULL,
  `price_range` varchar(50) DEFAULT NULL,
  `requested_qualifications` text,
  `optional_qualifications` text,
  `years_experience_req` int(11) DEFAULT NULL,
  `require_test` tinyint(1) NOT NULL DEFAULT '0',
  `presencial_remoto` varchar(50) DEFAULT 'ambos',
  `language_preference` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `corporate`
--

INSERT INTO `corporate` (`id`, `user_id`, `corporate`, `type_trainer`, `when_training`, `price_range`, `requested_qualifications`, `optional_qualifications`, `years_experience_req`, `require_test`, `presencial_remoto`, `language_preference`) VALUES
(1, 0, 'No corporate', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'ambos', ''),
(2, 0, 'company', 'company', '2016-01-01', '250,700', 'company', 'company', 0, 1, 'company', 'company'),
(3, 0, 'Emilse', 'technical', '2016-04-05', '15,175', 'certified in microsoft technologies', 'certified in cisco', 5, 1, 'in company or remote', 'spanish'),
(4, 0, 'Emilse Test', 'technical', '2016-04-02', '10,85', 'none', 'teacher', 9, 0, 'remote', 'english'),
(5, 11, 'Playjirafe', 'kinder', '2016-04-05', '250,450', 'none', 'none', 2, 0, 'in company', 'english');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `id` int(11) NOT NULL,
  `course_description` varchar(250) NOT NULL,
  `creator_id` int(11) NOT NULL,
  `creation_datetime` date NOT NULL,
  `course_complete` tinyint(1) NOT NULL,
  `course_start_date` date NOT NULL,
  `course_end_date` date NOT NULL,
  `course_cost` double NOT NULL,
  `course_pass_mark` int(11) NOT NULL DEFAULT '40',
  `venue` varchar(50) NOT NULL,
  `pretest_enabled` tinyint(1) NOT NULL,
  `exams_enabled` tinyint(1) NOT NULL,
  `trainerid` int(11) NOT NULL,
  `rating` decimal(10,2) NOT NULL,
  `preview_image` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`id`, `course_description`, `creator_id`, `creation_datetime`, `course_complete`, `course_start_date`, `course_end_date`, `course_cost`, `course_pass_mark`, `venue`, `pretest_enabled`, `exams_enabled`, `trainerid`, `rating`, `preview_image`) VALUES
(1, 'My Course 1', 1, '2016-09-24', 1, '2016-09-24', '2016-09-24', 1.05, 40, 'School 1', 1, 1, 3, '10.00', 'http://www.boosteducationservice.co.uk/wp-content/uploads/2014/05/courses.jpg'),
(2, 'My Course 2', 1, '2016-09-24', 1, '2016-09-24', '2016-09-24', 1.05, 40, 'School 1', 1, 1, 3, '0.50', ''),
(3, 'My Course 3', 1, '2016-09-24', 1, '2016-09-24', '2016-09-24', 1.05, 40, 'School 1', 1, 1, 3, '1.20', ''),
(4, 'My Course 4', 1, '2016-09-24', 1, '2016-09-24', '2016-09-30', 1.05, 40, 'School 1', 1, 1, 3, '0.70', ''),
(5, 'My Course 5', 1, '2016-09-24', 1, '2016-07-04', '2016-09-24', 1.05, 40, 'School 1', 1, 1, 3, '5.23', '');

-- --------------------------------------------------------

--
-- Table structure for table `course_page`
--

CREATE TABLE `course_page` (
  `id` int(11) NOT NULL,
  `course_unit_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course_page`
--

INSERT INTO `course_page` (`id`, `course_unit_id`, `course_id`, `content`) VALUES
(1, 1, 1, '<p>Lorem ipsum dolor sit amet, eam in ubique omittam reprehendunt, at sint mutat per. Essent omittam consequat et vis, vidisse appareat ex sed. In eum mollis melius, mei denique copiosae iudicabit id, rationibus eloquentiam necessitatibus nec cu. Ea ponderum delicata omittantur mea, nam dicam viderer te, error discere molestiae ut eum. Ei ius idque efficiantur, ad aliquam forensibus eos. Vim quas veritus suavitate an, cum no tale eius.\r\n  </p>\r\n  <p>\r\nEum ne habeo noluisse copiosae, eam cu facilisi hendrerit efficiendi. Quo ut solet facilisis interpretaris, ea aperiam saperet ius. Has at nemore dicunt causae, te quis elitr vim. Modo denique delicatissimi ei est, in latine accusamus quo. Quo movet suavitate ad, ex qui commune quaerendum. Sea ei solet nostrum salutandi, populo lobortis vim et. Ut munere dolorem posidonium duo, eu duo alii lobortis laboramus, cu erant legere honestatis ius.\r\n  </p>\r\n  <p>\r\nVix malorum accusam interpretaris ne, pro graece consequuntur te. Sit novum munere ocurreret ut. Melius vidisse persecuti pro an, ad tollit ornatus sea. Dictas melius ad vis, putant dictas his cu, alii liber sonet vel eu. Te ius omittam hendrerit, ad pri zril quaestio consectetuer, ne duis ipsum eos. Id mel minim euismod adolescens, an eius docendi invidunt eam.\r\n  </p>\r\n  <p>\r\nEuismod admodum ut nam, probo elitr mea eu. Sed cu autem errem. Ei semper maiestatis comprehensam pro, tation eruditi petentium eum eu. Etiam persequeris ei pro, eos eu quis suas posidonium. Qui ferri populo appellantur ad. In sit alienum luptatum, vis id eripuit consequat eloquentiam, vis ne iusto dicunt.\r\n  </p>\r\n  <p>\r\nEu vis nisl vocibus delicatissimi, ius id nobis propriae. Veri solum qui cu, eu augue aeterno voluptaria vim. Ex tale tollit est, at vel aperiri commune philosophia. Qualisque percipitur usu ex, tale stet partem quo id, vis cu graeci menandri assueverit.\r\n  </p>\r\n  <p>\r\nAd omnes vocibus torquatos pri, ea eos tibique appareat. Et mei nulla percipitur, nam id homero verear abhorreant, vim dolorem scriptorem an. Ne denique splendide vis. Enim consectetuer reprehendunt eu vix, dignissim consetetur interesset vim id. Audiam accommodare te duo. Vis ea quando ridens doctus.\r\n  </p>\r\n  <p>\r\nQuidam scaevola delicata no ius, duo ut tale perfecto. Modo eros omittantur cu per, mundi admodum ut usu, in malis nostrud nam. Ne idque doctus ius. Eu liber errem instructior quo, ea qui etiam doming lobortis.\r\n  </p>\r\n  <p>\r\nLegere convenire torquatos ut nec, magna legendos at mei. Ei consulatu vituperatoribus ius, nam ex aperiam percipit rationibus. Ea sed erat labore, vis ad mollis euismod, nam brute laudem legimus in. Vel latine dolorem et, ea sed clita assentior, per rebum aliquip aliquid in. Ei mel sanctus conclusionemque, vis dicunt signiferumque ne. Quas posidonium no his, mei at accusata signiferumque. Definiebas reprehendunt eos ne.\r\n  </p>\r\n  <p>\r\nEst cu choro munere. Qui singulis electram id. Dicant alienum eam ea. Sea suas fabulas accumsan ei. Cu nemore vocibus efficiantur est. Postulant inciderint id mel, id sea wisi option, his an sonet labitur nominavi.\r\n  </p>\r\n  <p>\r\nQui ad primis accommodare. Cu tincidunt efficiendi eum, pro id exerci debitis. At vel soluta tamquam, eu quot putent persecuti usu, in modus affert sapientem sea. Detracto expetendis et his, delicata dissentiet reformidans per eu.\r\n</p>'),
(2, 1, 2, '<img src="http://image.flaticon.com/teams/1-freepik.jpg"/><p>Lorem ipsum dolor sit amet, eam in ubique omittam reprehendunt, at sint mutat per. Essent omittam consequat et vis, vidisse appareat ex sed. In eum mollis melius, mei denique copiosae iudicabit id, rationibus eloquentiam necessitatibus nec cu. Ea ponderum delicata omittantur mea, nam dicam viderer te, error discere molestiae ut eum. Ei ius idque efficiantur, ad aliquam forensibus eos. Vim quas veritus suavitate an, cum no tale eius.\r\n  </p>\r\n  <p>\r\nEum ne habeo noluisse copiosae, eam cu facilisi hendrerit efficiendi. Quo ut solet facilisis interpretaris, ea aperiam saperet ius. Has at nemore dicunt causae, te quis elitr vim. Modo denique delicatissimi ei est, in latine accusamus quo. Quo movet suavitate ad, ex qui commune quaerendum. Sea ei solet nostrum salutandi, populo lobortis vim et. Ut munere dolorem posidonium duo, eu duo alii lobortis laboramus, cu erant legere honestatis ius.\r\n  </p>\r\n  <p>\r\nVix malorum accusam interpretaris ne, pro graece consequuntur te. Sit novum munere ocurreret ut. Melius vidisse persecuti pro an, ad tollit ornatus sea. Dictas melius ad vis, putant dictas his cu, alii liber sonet vel eu. Te ius omittam hendrerit, ad pri zril quaestio consectetuer, ne duis ipsum eos. Id mel minim euismod adolescens, an eius docendi invidunt eam.\r\n  </p>\r\n  <p>\r\nEuismod admodum ut nam, probo elitr mea eu. Sed cu autem errem. Ei semper maiestatis comprehensam pro, tation eruditi petentium eum eu. Etiam persequeris ei pro, eos eu quis suas posidonium. Qui ferri populo appellantur ad. In sit alienum luptatum, vis id eripuit consequat eloquentiam, vis ne iusto dicunt.\r\n  </p>\r\n  <p>\r\nEu vis nisl vocibus delicatissimi, ius id nobis propriae. Veri solum qui cu, eu augue aeterno voluptaria vim. Ex tale tollit est, at vel aperiri commune philosophia. Qualisque percipitur usu ex, tale stet partem quo id, vis cu graeci menandri assueverit.\r\n  </p>\r\n  <p>\r\nAd omnes vocibus torquatos pri, ea eos tibique appareat. Et mei nulla percipitur, nam id homero verear abhorreant, vim dolorem scriptorem an. Ne denique splendide vis. Enim consectetuer reprehendunt eu vix, dignissim consetetur interesset vim id. Audiam accommodare te duo. Vis ea quando ridens doctus.\r\n  </p>\r\n  <p>\r\nQuidam scaevola delicata no ius, duo ut tale perfecto. Modo eros omittantur cu per, mundi admodum ut usu, in malis nostrud nam. Ne idque doctus ius. Eu liber errem instructior quo, ea qui etiam doming lobortis.\r\n  </p>\r\n  <p>\r\nLegere convenire torquatos ut nec, magna legendos at mei. Ei consulatu vituperatoribus ius, nam ex aperiam percipit rationibus. Ea sed erat labore, vis ad mollis euismod, nam brute laudem legimus in. Vel latine dolorem et, ea sed clita assentior, per rebum aliquip aliquid in. Ei mel sanctus conclusionemque, vis dicunt signiferumque ne. Quas posidonium no his, mei at accusata signiferumque. Definiebas reprehendunt eos ne.\r\n  </p>\r\n  <p>\r\nEst cu choro munere. Qui singulis electram id. Dicant alienum eam ea. Sea suas fabulas accumsan ei. Cu nemore vocibus efficiantur est. Postulant inciderint id mel, id sea wisi option, his an sonet labitur nominavi.\r\n  </p>\r\n  <p>\r\nQui ad primis accommodare. Cu tincidunt efficiendi eum, pro id exerci debitis. At vel soluta tamquam, eu quot putent persecuti usu, in modus affert sapientem sea. Detracto expetendis et his, delicata dissentiet reformidans per eu.\r\n</p>'),
(3, 1, 2, '<img src="http://icons.iconarchive.com/icons/igh0zt/ios7-style-metro-ui/icons-390.jpg"/>\r\n<p>Course Content!</p>');

-- --------------------------------------------------------

--
-- Table structure for table `course_unit`
--

CREATE TABLE `course_unit` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `unit_description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course_unit`
--

INSERT INTO `course_unit` (`id`, `course_id`, `unit_description`) VALUES
(1, 1, 'Unit 1'),
(2, 2, 'Unit 1'),
(3, 1, 'Unit 2'),
(4, 2, 'Unit 2'),
(5, 1, 'Unit 3'),
(6, 2, 'Unit 3');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `message` text NOT NULL,
  `message_read` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

CREATE TABLE `permission` (
  `id` int(11) NOT NULL,
  `permission_description` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `corporate_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `programs`
--

CREATE TABLE `programs` (
  `programid` int(11) NOT NULL,
  `programname` varchar(250) NOT NULL,
  `program_complete` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `description` varchar(250) NOT NULL,
  `startdate` date NOT NULL,
  `enddate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `role_description` varchar(150) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `role_description`, `status`) VALUES
(1, 'Trainer', 1),
(2, 'Corporate Admin', 1),
(5, 'Corporate Employee', 1),
(6, 'Ziksa Admin', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) DEFAULT NULL,
  `country` varchar(50) NOT NULL,
  `profile_img` varchar(250) DEFAULT NULL,
  `position` point DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rating` int(11) NOT NULL DEFAULT '1',
  `hour_cost` double NOT NULL DEFAULT '0',
  `years_experience` int(11) DEFAULT NULL,
  `cv` varchar(100) DEFAULT NULL,
  `creation_date` date NOT NULL,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `role_id` int(11) NOT NULL,
  `corporate` varchar(50) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `logged_in` tinyint(1) NOT NULL DEFAULT '0',
  `last_login` timestamp NULL DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `invite_employees` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `username`, `password`, `address`, `phone`, `city`, `state`, `country`, `profile_img`, `position`, `status`, `rating`, `hour_cost`, `years_experience`, `cv`, `creation_date`, `modified_date`, `role_id`, `corporate`, `group_id`, `logged_in`, `last_login`, `active`, `verified`, `invite_employees`) VALUES
(1, 'Tester', 'tester', 'f5d1278e8109edd94e1e4197e04873b9', 'D524, 63700 La Crouzille, France', '4545654456654', 'La Crouzille', 'Auvergne-RhÃ´ne-Alpes', 'FR', 'server/php/files/profile_img (1).png | server/php/files/thumbnail', '\0\0\0\0\0\0\0ŒIZ¤‚G@\0\0\0\0\0ú@', 1, 34, 15.8, 15, 'server/php/cv.pdf', '2016-09-15', '2016-10-09 21:49:44', 1, '2', NULL, 0, NULL, 1, 1, 1),
(2, 'Tester', 'test', '098f6bcd4621d373cade4e832627b4f6', 'D524, 63700 La Crouzille, France', '3423423424234', 'La Crouzille', 'Auvergne-RhÃƒÂ´ne-Alpes', 'FR', 'server/php/profile_img (2).png | server/php/thumbn', '\0\0\0\0\0\0\0ŒIZ¤‚G@\0\0\0\0\0ú@', 1, 1, 12.3, 15, 'server/php/cv_sin_certificados.pdf', '2016-09-15', '2016-09-15 05:06:00', 2, '2', NULL, 0, NULL, 1, 1, 1),
(3, 'trainer', 'trainer', '2c065aae9fcb37b49043a5a2012b3dbf', 'D524, 63700 La Crouzille, France', '3322311231', 'La Crouzille', 'Auvergne-RhÃƒÂ´ne-Alpes', 'FR', 'server/php/profile_img (3).png | server/php/thumbn', '\0\0\0\0\0\0\0ŒIZ¤‚G@\0\0\0\0\0ú@', 1, 1, 13, 18, 'server/php/mycv.pdf', '2016-09-15', '2016-09-15 05:08:08', 1, '2', NULL, 0, NULL, 1, 0, 1),
(4, 'My Company', 'my_company', '93991b3a2cc7a1bc8c6eff64a97fe1a1', 'Les Sagnes, 63700 La Crouzille, France', '6654446465465456', 'La Crouzille', 'Auvergne-RhÃƒÂ´ne-Alpes', 'FR', 'server/php/profile_img (10).png | server/php/thumb', '\0\0\0\0\0\0\0€tÄG@\0\0\0\0)\r@', 1, 1, 0, NULL, NULL, '2016-09-16', '2016-09-16 03:26:44', 2, 'My Company', NULL, 0, NULL, 1, 0, 1),
(5, 'My other company', 'hola', '4d186321c1a7f0f354b297e8914ab240', 'Chez Branlet, 63700 Youx, France', '5464565454', 'Youx', 'Auvergne-RhÃƒÂ´ne-Alpes', 'FR', 'server/php/profile_img (11).png | server/php/thumbnail/profile_img (11).png', '\0\0\0\0\0\0\0&ýå’ÐG@\0\0\0\0Ý\r@', 1, 1, 0, NULL, NULL, '2016-09-16', '2016-09-16 03:34:34', 2, 'My other company', NULL, 0, NULL, 1, 0, 1),
(6, 'abc', 'abc', '900150983cd24fb0d6963f7d28e17f72', 'D524, 63700 La Crouzille, France', '123', 'La Crouzille', 'Auvergne-RhÃƒÂ´ne-Alpes', 'FR', 'server/php/profile_img (12).png | server/php/thumbnail/profile_img (12).png', '\0\0\0\0\0\0\0ŒIZ¤‚G@\0\0\0\0\0ú@', 1, 1, 0, NULL, NULL, '2016-09-16', '2016-09-16 03:38:05', 2, 'abc', NULL, 0, NULL, 1, 0, 1),
(7, 'company', 'company', '93c731f1c3a84ef05cd54d044c379eaa', 'D524, 63700 La Crouzille, France', '123456', 'La Crouzille', 'Auvergne-RhÃƒÂ´ne-Alpes', 'FR', 'server/php/profile_img (13).png | server/php/thumbnail/profile_img (13).png', '\0\0\0\0\0\0\0ŒIZ¤‚G@\0\0\0\0\0ú@', 1, 1, 0, NULL, NULL, '2016-09-16', '2016-09-16 03:42:44', 2, 'company', NULL, 0, NULL, 1, 0, 1),
(8, 'Emilse', 'emilseuor@hotmail.com', '700b4ee6693285adfc35ac780fbb2be5', 'Buxerolles, 63330 Virlet, France', '454564564545546', 'Virlet', 'Auvergne-RhÃƒÂ´ne-Alpes', 'FR', 'server/php/profile_img (14).png | server/php/thumbnail/profile_img (14).png', '\0\0\0\0\0\0\0gT•KwG@\0\0\0\0®y@', 1, 1, 0, NULL, NULL, '2016-09-16', '2016-09-16 17:03:08', 2, 'Emilse', NULL, 0, NULL, 1, 0, 1),
(9, 'Emilse Test', 'emilse.e@vsstechnology.com', '0e80f2ac27f263c7d439dd0748a07305', 'D524, 63700 La Crouzille, France', '451212132213', 'La Crouzille', 'Auvergne-RhÃƒÂ´ne-Alpes', 'FR', 'server/php/profile_img (15).png | server/php/thumbnail/profile_img (15).png', '\0\0\0\0\0\0\0ŒIZ¤‚G@\0\0\0\0\0ú@', 1, 1, 0, NULL, NULL, '2016-09-16', '2016-09-16 20:57:14', 2, 'Emilse Test', NULL, 0, NULL, 1, 1, 1),
(10, 'Jungla Company', 'emileuge@gmail.com', '700b4ee6693285adfc35ac780fbb2be5', 'Chez Branlet, 63700 Youx, France', '421123321121321', 'Youx', 'Auvergne-RhÃƒÂ´ne-Alpes', 'FR', 'server/php/profile_img (16).png | server/php/thumbnail/profile_img (16).png', '\0\0\0\0\0\0\0"¶‡d×G@\0\0\0€×@', 1, 1, 0, NULL, NULL, '2016-09-17', '2016-09-17 16:57:41', 2, 'Jungla Company', NULL, 0, NULL, 1, 0, 1),
(11, 'Playjirafe', 'play@jirafe.com', '21232f297a57a5a743894a0e4a801fc3', 'D524, 63700 La Crouzille, France', '12123312123312', 'La Crouzille', 'Auvergne-RhÃƒÂ´ne-Alpes', 'FR', 'server/php/profile_img (17).png | server/php/thumbnail/profile_img (17).png', '\0\0\0\0\0\0\0ŒIZ¤‚G@\0\0\0\0\0ú@', 1, 1, 0, NULL, NULL, '2016-09-17', '2016-09-17 17:00:43', 2, 'Playjirafe', NULL, 0, NULL, 1, 0, 1),
(12, 'name123', 'name123', '5f25b6a0b984f370afd14aebc3140226', 'D524, 63700 La Crouzille, France', '12123312123312', 'La Crouzille', 'Auvergne-RhÃƒÂ´ne-Alpes', '', NULL, NULL, 1, 1, 0, NULL, NULL, '0000-00-00', '2016-09-26 01:19:32', 0, NULL, NULL, 0, NULL, 1, 0, 1),
(13, 'user123', 'user123', '6ad14ba9986e3615423dfca256d04e3f', 'D524, 63700 La Crouzille, France', '12123312123312', '', NULL, '', NULL, NULL, 1, 1, 0, NULL, NULL, '0000-00-00', '2016-09-26 01:20:04', 2, NULL, NULL, 0, NULL, 1, 0, 1),
(14, 'test1', 'test1', '5a105e8b9d40e1329780d62ea2265d8a', 'D524, 63700 La Crouzille, France', '12123312123312', '', NULL, '', NULL, NULL, 1, 1, 0, NULL, NULL, '0000-00-00', '2016-10-05 05:20:57', 2, NULL, NULL, 0, NULL, 1, 0, 1),
(15, 'test2', 'test2', 'ad0234829205b9033196ba818f7a872b', 'D524, 63700 La Crouzille, France', '12123312123312', '', NULL, '', NULL, NULL, 1, 1, 0, NULL, NULL, '0000-00-00', '2016-10-06 07:53:47', 2, NULL, NULL, 0, NULL, 1, 0, 1),
(16, 'test3', 'test3', '8ad8757baa8564dc136c1e07507f4a98', 'D524, 63700 La Crouzille, France', '12123312123312', '', NULL, '', NULL, NULL, 1, 1, 0, NULL, NULL, '0000-00-00', '2016-10-06 07:55:29', 2, NULL, NULL, 0, NULL, 1, 0, 1),
(17, 'test7', 'test7', 'b04083e53e242626595e2b8ea327e525', 'D524, 63700 La Crouzille, France', '12123312123312', '', NULL, '', NULL, NULL, 1, 1, 0, NULL, NULL, '0000-00-00', '2016-10-06 08:02:30', 2, NULL, NULL, 0, NULL, 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users_programs`
--

CREATE TABLE `users_programs` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `programid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_programs`
--

INSERT INTO `users_programs` (`id`, `userid`, `programid`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 2, 1),
(6, 3, 1),
(8, 13, 1),
(9, 14, 1),
(10, 15, 1),
(11, 16, 1),
(12, 17, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_group`
--

CREATE TABLE `user_group` (
  `id` int(11) NOT NULL,
  `group_description` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `corporate`
--
ALTER TABLE `corporate`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_page`
--
ALTER TABLE `course_page`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_unit`
--
ALTER TABLE `course_unit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `programs`
--
ALTER TABLE `programs`
  ADD PRIMARY KEY (`programid`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_programs`
--
ALTER TABLE `users_programs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_group`
--
ALTER TABLE `user_group`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `corporate`
--
ALTER TABLE `corporate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `course_page`
--
ALTER TABLE `course_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `course_unit`
--
ALTER TABLE `course_unit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `permission`
--
ALTER TABLE `permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `programs`
--
ALTER TABLE `programs`
  MODIFY `programid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `users_programs`
--
ALTER TABLE `users_programs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `user_group`
--
ALTER TABLE `user_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
