SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `PHPMySQLSitebase`
--

-- --------------------------------------------------------

--
-- Structure de la table `member`
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
  `date_naissance` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_connexion` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `origin` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `remmber_token` (`remember_token`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Contenu de la table `member`
--

INSERT INTO `member` (`id`, `password`, `email`, `niveau`, `visible`, `code_validation`, `date_inscription`, `remember_token`, `prenom`, `nom`, `pays`, `genre`, `date_naissance`, `date_connexion`, `origin`) VALUES
(1, 'd033e22ae348aeb5660fc2140aec35850c4da997', 'admin@borderlines.com', 1, 1, NULL, '2009-10-17 16:43:37', NULL, 'Admin', 'Istrateur', '--', 'F', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '');

-- --------------------------------------------------------

--
-- Structure de la table `page`
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=602 ;

--
-- Contenu de la table `page`
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
(9, 'admin_member', 'data/admin/admin_member.act.php', 'data/admin/admin_member.dsp.php', 1, 1, '', ''),
(10, 'admin_member_view', 'data/admin/admin_member_view.act.php', 'data/admin/admin_member_view.dsp.php', 1, 1, '', '{page}/{id}.html'),
(11, 'admin_member_mod', 'data/admin/admin_member_mod.act.php', 'data/admin/admin_member_mod.dsp.php', 1, 1, '', ''),
(12, 'admin_page', 'data/admin/admin_page.act.php', 'data/admin/admin_page.dsp.php', 1, 1, '', ''),
(13, 'admin_page_mod', 'data/admin/admin_page_mod.act.php', 'data/admin/admin_page_mod.dsp.php', 1, 1, '', '{page}/{id}.html'),
(14, 'mon-compte-identifiants', 'data/member/edit_profile.act.php', 'data/member/edit_identifiants.dsp.php', 1, 0, '', ''),
(24, 'db-analyse', 'data/db-analyse.act.php', 'data/db-analyse.dsp.php', 1, 1, '', '');
SET FOREIGN_KEY_CHECKS=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
