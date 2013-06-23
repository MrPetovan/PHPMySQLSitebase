SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

-- --------------------------------------------------------

--
-- Table structure for table `api_log`
--

CREATE TABLE IF NOT EXISTS `api_log` (
  `api_token_id` int(11) DEFAULT NULL,
  `method` varchar(50) NOT NULL,
  `params` text NOT NULL,
  `allowed` tinyint(1) NOT NULL DEFAULT '0',
  `success` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  KEY `api_token_id` (`api_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `api_token`
--

CREATE TABLE IF NOT EXISTS `api_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hash` varchar(40) NOT NULL,
  `player_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `expires` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hash` (`hash`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=129 ;

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE IF NOT EXISTS `member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `niveau` smallint(6) NOT NULL,
  `visible` tinyint(4) NOT NULL,
  `code_validation` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_inscription` datetime NOT NULL,
  `remember_token` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prenom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pays` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '--',
  `genre` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'F',
  `date_naissance` datetime DEFAULT NULL,
  `date_connexion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `origin` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `remmber_token` (`remember_token`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT AUTO_INCREMENT=61 ;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`id`, `password`, `email`, `niveau`, `visible`, `code_validation`, `date_inscription`, `remember_token`, `prenom`, `nom`, `pays`, `genre`, `date_naissance`, `date_connexion`, `origin`) VALUES
(1, '28d5a63f686698988123b8dc09c36b85a666ed08', 'ben.lort@gmail.com', 1, 1, NULL, '2009-10-17 16:43:37', NULL, 'Admin', 'Istrateur', 'GB', 'H', NULL, '0000-00-00 00:00:00', '');
-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE IF NOT EXISTS `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `conversation_id` int(11) NOT NULL,
  `player_id` int(11) DEFAULT NULL,
  `text` text NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `conversation_id` (`conversation_id`),
  KEY `sender_id` (`player_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT AUTO_INCREMENT=519 ;

-- --------------------------------------------------------

--
-- Table structure for table `message_recipient`
--

CREATE TABLE IF NOT EXISTS `message_recipient` (
  `message_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `read` datetime DEFAULT NULL,
  PRIMARY KEY (`message_id`,`player_id`),
  KEY `player_id` (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `page`
--

CREATE TABLE IF NOT EXISTS `page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `act` varchar(255) NOT NULL,
  `dsp` varchar(255) NOT NULL,
  `login_required` tinyint(1) NOT NULL DEFAULT '0',
  `admin_required` tinyint(1) NOT NULL DEFAULT '0',
  `tpl` varchar(255) NOT NULL,
  `rewrite_pattern` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT AUTO_INCREMENT=4887 ;

--
-- Dumping data for table `page`
--

INSERT INTO `page` (`id`, `code`, `act`, `dsp`, `login_required`, `admin_required`, `tpl`, `rewrite_pattern`) VALUES
(1, 'accueil', '', 'data/static/00accueil.dsp.php', 0, 0, '', ''),
(2, 'erreur', '', 'data/static/error.dsp.php', 0, 1, '', ''),
(3, 'register', 'data/member/register.act.php', 'data/member/register.dsp.php', 0, 0, '', ''),
(4, 'login', 'data/member/login.act.php', 'data/member/login.dsp.php', 0, 0, 'SESSION_PAGELAYOUT', ''),
(5, 'logout', 'data/member/login.act.php', 'data/member/login.dsp.php', 1, 0, '', ''),
(6, 'rappel-identifiants', 'data/member/forgotten_password.act.php', 'data/member/forgotten_password.dsp.php', 0, 0, '', ''),
(7, 'mon-compte', '', 'data/member/mon-compte.dsp.php', 1, 0, '', ''),
(8, 'mon-compte-infos', 'data/member/edit_profile.act.php', 'data/member/edit_profile.dsp.php', 0, 0, '', ''),
(9, 'admin_member', 'data/admin/admin_member.act.php', 'data/admin/admin_member.dsp.php', 1, 1, 'pagelayout_admin.tpl.php', ''),
(10, 'admin_member_view', 'data/admin/admin_member_view.act.php', 'data/admin/admin_member_view.dsp.php', 1, 1, 'pagelayout_admin.tpl.php', '{page}/{id}.html'),
(11, 'admin_member_mod', 'data/admin/admin_member_mod.act.php', 'data/admin/admin_member_mod.dsp.php', 1, 1, 'pagelayout_admin.tpl.php', ''),
(12, 'admin_page', 'data/admin/admin_page.act.php', 'data/admin/admin_page.dsp.php', 1, 1, 'pagelayout_admin.tpl.php', ''),
(13, 'admin_page_mod', 'data/admin/admin_page_mod.act.php', 'data/admin/admin_page_mod.dsp.php', 1, 1, 'pagelayout_admin.tpl.php', '{page}/{id}.html'),
(14, 'mon-compte-identifiants', 'data/member/edit_profile.act.php', 'data/member/edit_identifiants.dsp.php', 1, 0, '', ''),
(24, 'db-analyse', 'data/db-analyse.act.php', 'data/db-analyse.dsp.php', 1, 1, '', ''),
(602, 'dashboard', 'data/player/dashboard.act.php', 'data/player/dashboard.dsp.php', 1, 0, '', ''),
(603, 'player_list', 'data/player/player_list.act.php', 'data/player/player_list.dsp.php', 1, 0, '', ''),
(604, 'show_player', 'data/player/show_player.act.php', 'data/player/show_player.dsp.php', 1, 0, '', ''),
(2560, 'shout', 'data/shout/shout.act.php', 'data/shout/shout.dsp.php', 1, 0, '', ''),
(2561, 'create_player', 'data/player/create_player.act.php', 'data/player/create_player.dsp.php', 1, 0, '', ''),
(3822, 'conversation_list', 'data/conversation/list.act.php', 'data/conversation/list.dsp.php', 1, 0, '', ''),
(4036, 'admin_conversation_message', 'data/admin/admin_conversation_message.act.php', 'data/admin/admin_conversation_message.dsp.php', 1, 1, 'pagelayout_admin.tpl.php', ''),
(4037, 'admin_conversation_message_view', 'data/admin/admin_conversation_message_view.act.php', 'data/admin/admin_conversation_message_view.dsp.php', 1, 1, 'pagelayout_admin.tpl.php', '{page}/{id}.html'),
(4038, 'admin_conversation_message_mod', 'data/admin/admin_conversation_message_mod.act.php', 'data/admin/admin_conversation_message_mod.dsp.php', 1, 1, 'pagelayout_admin.tpl.php', ''),
(4039, 'conversation_add', 'data/conversation/add.act.php', 'data/conversation/add.dsp.php', 1, 0, '', ''),
(4364, 'conversation_view', 'data/conversation/view.act.php', 'data/conversation/view.dsp.php', 1, 0, '', ''),
(4437, 'conversation_answer', 'data/conversation/answer.act.php', 'data/conversation/answer.dsp.php', 1, 0, '', ''),
(4442, 'admin_lang', 'data/admin/admin_lang.act.php', 'data/admin/admin_lang.dsp.php', 1, 1, 'pagelayout_admin.tpl.php', ''),
(4799, 'api', 'data/api_token/api.act.php', 'data/api_token/api.dsp.php', 0, 0, 'pagelayout_vide.tpl.php', ''),
(4800, 'help_api', '', 'data/static/help_api.dsp.php', 0, 0, '', ''),
(4844, 'translate', 'data/translation/translate.act.php', 'data/translation/translate.dsp.php', 1, 0, '', ''),
(4854, 'admin_player', 'data/admin/admin_player.act.php', 'data/admin/admin_player.dsp.php', 1, 1, 'pagelayout_admin.tpl.php', ''),
(4855, 'admin_player_view', 'data/admin/admin_player_view.act.php', 'data/admin/admin_player_view.dsp.php', 1, 1, 'pagelayout_admin.tpl.php', '{page}/{id}.html'),
(4856, 'admin_player_mod', 'data/admin/admin_player_mod.act.php', 'data/admin/admin_player_mod.dsp.php', 1, 1, 'pagelayout_admin.tpl.php', ''),
(4860, 'admin_translation', 'data/admin/admin_translation.act.php', 'data/admin/admin_translation.dsp.php', 1, 1, 'pagelayout_admin.tpl.php', ''),
(4861, 'admin_translation_view', 'data/admin/admin_translation_view.act.php', 'data/admin/admin_translation_view.dsp.php', 1, 1, 'pagelayout_admin.tpl.php', '{page}/{id}.html'),
(4862, 'admin_translation_mod', 'data/admin/admin_translation_mod.act.php', 'data/admin/admin_translation_mod.dsp.php', 1, 1, 'pagelayout_admin.tpl.php', ''),
(4866, 'admin_api_token', 'data/admin/admin_api_token.act.php', 'data/admin/admin_api_token.dsp.php', 1, 1, 'pagelayout_admin.tpl.php', ''),
(4867, 'admin_api_token_view', 'data/admin/admin_api_token_view.act.php', 'data/admin/admin_api_token_view.dsp.php', 1, 1, 'pagelayout_admin.tpl.php', '{page}/{id}.html'),
(4868, 'admin_api_token_mod', 'data/admin/admin_api_token_mod.act.php', 'data/admin/admin_api_token_mod.dsp.php', 1, 1, 'pagelayout_admin.tpl.php', ''),
(4875, 'admin_shout', 'data/admin/admin_shout.act.php', 'data/admin/admin_shout.dsp.php', 1, 1, 'pagelayout_admin.tpl.php', ''),
(4876, 'admin_shout_view', 'data/admin/admin_shout_view.act.php', 'data/admin/admin_shout_view.dsp.php', 1, 1, 'pagelayout_admin.tpl.php', '{page}/{id}.html'),
(4877, 'admin_shout_mod', 'data/admin/admin_shout_mod.act.php', 'data/admin/admin_shout_mod.dsp.php', 1, 1, 'pagelayout_admin.tpl.php', ''),
(4881, 'admin_conversation', 'data/admin/admin_conversation.act.php', 'data/admin/admin_conversation.dsp.php', 1, 1, 'pagelayout_admin.tpl.php', ''),
(4882, 'admin_conversation_view', 'data/admin/admin_conversation_view.act.php', 'data/admin/admin_conversation_view.dsp.php', 1, 1, 'pagelayout_admin.tpl.php', '{page}/{id}.html'),
(4883, 'admin_conversation_mod', 'data/admin/admin_conversation_mod.act.php', 'data/admin/admin_conversation_mod.dsp.php', 1, 1, 'pagelayout_admin.tpl.php', ''),
(4884, 'admin_message', 'data/admin/admin_message.act.php', 'data/admin/admin_message.dsp.php', 1, 1, 'pagelayout_admin.tpl.php', ''),
(4885, 'admin_message_view', 'data/admin/admin_message_view.act.php', 'data/admin/admin_message_view.dsp.php', 1, 1, 'pagelayout_admin.tpl.php', '{page}/{id}.html'),
(4886, 'admin_message_mod', 'data/admin/admin_message_mod.act.php', 'data/admin/admin_message_mod.dsp.php', 1, 1, 'pagelayout_admin.tpl.php', '');

-- --------------------------------------------------------

--
-- Table structure for table `player`
--

CREATE TABLE IF NOT EXISTS `player` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `api_key` varchar(40) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT AUTO_INCREMENT=52 ;

--
-- Dumping data for table `player`
--

INSERT INTO `player` (`id`, `member_id`, `name`, `active`, `api_key`, `created`) VALUES
(1, 1, 'Ertaï', 1, '426c828a034807b25eb0a56c8aed9aaab96caf8c', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `shout`
--

CREATE TABLE IF NOT EXISTS `shout` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_sent` datetime NOT NULL,
  `shouter_id` int(11) NOT NULL,
  `text` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shouter_id` (`shouter_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=550 ;

--
-- Table structure for table `translation`
--

CREATE TABLE IF NOT EXISTS `translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `locale` varchar(10) NOT NULL,
  `translation` text,
  `context` varchar(255) DEFAULT NULL,
  `translator_id` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`,`locale`,`context`),
  KEY `translator_id` (`translator_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3349 ;

--
-- Constraints for table `api_log`
--
ALTER TABLE `api_log`
  ADD CONSTRAINT `api_log_ibfk_1` FOREIGN KEY (`api_token_id`) REFERENCES `api_token` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `api_token`
--
ALTER TABLE `api_token`
  ADD CONSTRAINT `api_token_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`conversation_id`) REFERENCES `conversation` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `message_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`);

--
-- Constraints for table `message_recipient`
--
ALTER TABLE `message_recipient`
  ADD CONSTRAINT `message_recipient_ibfk_1` FOREIGN KEY (`message_id`) REFERENCES `message` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `message_recipient_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `player`
--
ALTER TABLE `player`
  ADD CONSTRAINT `player_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE NO ACTION;

--
-- Constraints for table `shout`
--
ALTER TABLE `shout`
  ADD CONSTRAINT `shout_ibfk_3` FOREIGN KEY (`shouter_id`) REFERENCES `player` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
