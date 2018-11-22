-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2018 �?11 �?21 �?10:01
-- 服务器版本: 5.5.53
-- PHP 版本: 5.5.38

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `ceshi.dingji.cn`
--

-- --------------------------------------------------------

--
-- 表的结构 `sent_auth_group_detail`
--

CREATE TABLE IF NOT EXISTS `sent_auth_group_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL COMMENT '角色分组ID',
  `rules` varchar(300) NOT NULL COMMENT '规则id',
  `school_id` smallint(6) NOT NULL COMMENT '学校ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='分组详细' AUTO_INCREMENT=28 ;

--
-- 转存表中的数据 `sent_auth_group_detail`
--

INSERT INTO `sent_auth_group_detail` (`id`, `group_id`, `rules`, `school_id`) VALUES
(1, 2, '71,54,68,67,66,65,53,52,51,50,49,48,47,46,45,44,43,64,63,62,61,60,59,58,57,55,42,41,40,38,20,1,11,10,9', 1),
(2, 2, '54,68,67,66,65,53,52,51,50,49,48,47,46,45,44,43,64,63,62,61,60,59,58,57,55,42,41,40,38,20,1,11,10,9', 2),
(3, 2, '54,68,67,66,65,53,52,51,50,49,48,47,46,45,44,43,64,63,62,61,60,59,58,57,55,42,41,40,38,20,1,11,10,9', 3),
(4, 1, '68,67,66,65,53,52,51,50,49,48,47,46,45,44,43,54,42,41', 1),
(5, 1, '68,67,66,65,53,52,51,50,49,48,47,46,45,44,43', 2),
(6, 1, '68,67,66,65,53,52,51,50,49,48,47,46,45,44,43', 3),
(9, 10, '', 3),
(8, 10, '', 2),
(7, 10, '', 1),
(10, 11, '', 1),
(11, 11, '', 2),
(12, 11, '', 3),
(13, 12, '', 1),
(14, 12, '', 2),
(15, 12, '', 3),
(16, 13, '', 1),
(17, 13, '', 2),
(18, 13, '', 3),
(19, 14, '', 1),
(20, 14, '', 2),
(21, 14, '', 3),
(22, 15, '', 1),
(23, 15, '', 2),
(24, 15, '', 3),
(25, 16, '', 1),
(26, 16, '', 2),
(27, 16, '', 3);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
