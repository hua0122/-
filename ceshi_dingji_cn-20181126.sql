-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2018-11-26 07:36:06
-- 服务器版本： 5.6.29
-- PHP Version: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ceshi.dingji.cn`
--

-- --------------------------------------------------------

--
-- 表的结构 `sent_action`
--

CREATE TABLE IF NOT EXISTS `sent_action` (
  `id` int(11) unsigned NOT NULL COMMENT '主键',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '行为说明',
  `remark` char(140) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text COMMENT '行为规则',
  `log` text COMMENT '日志规则',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间'
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统行为表';

--
-- 转存表中的数据 `sent_action`
--

INSERT INTO `sent_action` (`id`, `name`, `title`, `remark`, `rule`, `log`, `type`, `status`, `update_time`) VALUES
(1, 'user_login', '用户登录', '积分+10，每天一次', 'table:member|field:score|condition:uid={$self} AND status>-1|rule:score+10|cycle:24|max:1;', '[user|get_nickname]在[time|time_format]登录了后台', 1, 1, 1387181220),
(2, 'add_article', '发布文章', '积分+5，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:5', '', 2, 1, 1380173180),
(3, 'review', '评论', '评论积分+1，无限制', 'table:member|field:score|condition:uid={$self}|rule:score+1', '', 2, 1, 1383285646),
(4, 'add_document', '发表文档', '积分+10，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+10|cycle:24|max:5', '[user|get_nickname]在[time|time_format]发表了一篇文章。\r\n表[model]，记录编号[record]。', 2, 1, 1386139726),
(5, 'add_document_topic', '发表讨论', '积分+5，每天上限10次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:10', '', 2, 1, 1383285551),
(6, 'update_config', '更新配置', '新增或修改或删除配置', '', '', 1, 1, 1383294988),
(7, 'update_model', '更新模型', '新增或修改模型', '', '', 1, 1, 1383295057),
(8, 'update_attribute', '更新属性', '新增或更新或删除属性', '', '', 1, 1, 1383295963),
(9, 'update_channel', '更新导航', '新增或修改或删除导航', '', '', 1, 1, 1383296301),
(10, 'update_menu', '更新菜单', '新增或修改或删除菜单', '', '', 1, 1, 1383296392),
(11, 'update_category', '更新分类', '新增或修改或删除分类.', '', '', 1, 1, 1383296765);

-- --------------------------------------------------------

--
-- 表的结构 `sent_action_log`
--

CREATE TABLE IF NOT EXISTS `sent_action_log` (
  `id` int(10) unsigned NOT NULL COMMENT '主键',
  `action_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间'
) ENGINE=MyISAM AUTO_INCREMENT=201 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表';

--
-- 转存表中的数据 `sent_action_log`
--

INSERT INTO `sent_action_log` (`id`, `action_id`, `user_id`, `action_ip`, `model`, `record_id`, `remark`, `status`, `create_time`) VALUES
(1, 10, 1, 0, 'Menu', 4, '操作url：/wuliao/admin/menu/edit/id/4.html', 1, 1497341394),
(2, 10, 1, 0, 'Menu', 2, '操作url：/wuliao/admin/menu/edit/id/2.html', 1, 1497341449),
(3, 10, 1, 0, 'Menu', 2, '操作url：/wuliao/admin/menu/edit/id/2.html', 1, 1497341545),
(4, 10, 1, 0, 'Menu', 4, '操作url：/wuliao/admin/menu/edit/id/4.html', 1, 1497341575),
(5, 10, 1, 0, 'Menu', 4, '操作url：/wuliao/admin/menu/edit/id/4.html', 1, 1497341593),
(6, 10, 1, 0, 'Menu', 4, '操作url：/wuliao/admin/menu/edit/id/4.html', 1, 1497341607),
(7, 10, 1, 0, 'Menu', 2, '操作url：/wuliao/admin/menu/edit/id/2.html', 1, 1497341616),
(8, 10, 1, 0, 'Menu', 2, '操作url：/wuliao/admin/menu/edit/id/2.html', 1, 1497341892),
(9, 10, 1, 0, 'Menu', 2, '操作url：/wuliao/admin/menu/edit/id/2.html', 1, 1497341949),
(10, 10, 1, 0, 'Menu', 2, '操作url：/wuliao/admin/menu/edit/id/2.html', 1, 1497342047),
(11, 10, 1, 0, 'Menu', 9, '操作url：/wuliao/admin/menu/edit/id/9.html', 1, 1497342135),
(12, 10, 1, 0, 'Menu', 6, '操作url：/wuliao/admin/menu/edit/id/6.html', 1, 1497342293),
(13, 10, 1, 0, 'Menu', 1, '操作url：/wuliao/admin/menu/add/pid/5.html', 1, 1497342396),
(14, 10, 1, 0, 'Menu', 5, '操作url：/wuliao/admin/menu/edit/id/5.html', 1, 1497342426),
(15, 10, 1, 0, 'Menu', 28, '操作url：/wuliao/admin/menu/edit/id/28.html', 1, 1497342467),
(16, 10, 1, 0, 'Menu', 1, '操作url：/wuliao/admin/menu/add/pid/5.html', 1, 1497342757),
(17, 10, 1, 0, 'Menu', 1, '操作url：/wuliao/admin/menu/add/pid/5.html', 1, 1497342837),
(18, 10, 1, 0, 'Menu', 1, '操作url：/wuliao/admin/menu/add/pid/4.html', 1, 1497342990),
(19, 10, 1, 0, 'Menu', 31, '操作url：/wuliao/admin/menu/edit/id/31.html', 1, 1497343031),
(20, 10, 1, 0, 'Menu', 31, '操作url：/wuliao/admin/menu/edit/id/31.html', 1, 1497407819),
(21, 10, 1, 0, 'Menu', 16, '操作url：/wuliao/admin/menu/edit/id/16.html', 1, 1497427890),
(22, 10, 1, 0, 'Menu', 17, '操作url：/wuliao/admin/menu/edit/id/17.html', 1, 1497427902),
(23, 10, 1, 0, 'Menu', 18, '操作url：/wuliao/admin/menu/edit/id/18.html', 1, 1497427917),
(24, 10, 1, 0, 'Menu', 1, '操作url：/wuliao/admin/menu/add/pid/4.html', 1, 1497491083),
(25, 10, 1, 0, 'Menu', 30, '操作url：/wuliao/admin/menu/edit/id/30.html', 1, 1497594188),
(26, 10, 1, 0, 'Menu', 30, '操作url：/wuliao/admin/menu/edit/id/30.html', 1, 1497939810),
(27, 10, 1, 2130706433, 'Menu', 5, '操作url：/admin/menu/edit/id/5.html', 1, 1540609756),
(28, 10, 1, 2130706433, 'Menu', 1, '操作url：/admin/menu/add/pid/0.html', 1, 1540609802),
(29, 10, 1, 2130706433, 'Menu', 33, '操作url：/admin/menu/edit/id/33.html', 1, 1540609849),
(30, 10, 1, 2130706433, 'Menu', 1, '操作url：/admin/menu/add/pid/33.html', 1, 1540610373),
(31, 10, 1, 2130706433, 'Menu', 34, '操作url：/admin/menu/edit/id/34.html', 1, 1540610408),
(32, 10, 1, 2130706433, 'Menu', 34, '操作url：/admin/menu/edit/id/34.html', 1, 1540610460),
(33, 10, 1, 2130706433, 'Menu', 34, '操作url：/admin/menu/edit/id/34.html', 1, 1540610480),
(34, 10, 1, 2130706433, 'Menu', 1, '操作url：/admin/menu/add/pid/0.html', 1, 1540610824),
(35, 10, 1, 2130706433, 'Menu', 33, '操作url：/admin/menu/edit/id/33.html', 1, 1540610855),
(36, 10, 1, 2130706433, 'Menu', 1, '操作url：/admin/menu/add/pid/35.html', 1, 1540613332),
(37, 10, 1, 2130706433, 'Menu', 3, '操作url：/admin/menu/edit/id/3.html', 1, 1540628903),
(38, 10, 1, 2130706433, 'Menu', 3, '操作url：/admin/menu/edit/id/3.html', 1, 1540798255),
(39, 10, 1, 2130706433, 'Menu', 35, '操作url：/admin/menu/edit/id/35.html', 1, 1540798494),
(40, 10, 1, 2130706433, 'Menu', 36, '操作url：/admin/menu/edit/id/36.html', 1, 1540799087),
(41, 10, 1, 2130706433, 'Menu', 36, '操作url：/admin/menu/edit/id/36.html', 1, 1540799133),
(42, 10, 1, 2130706433, 'Menu', 36, '操作url：/admin/menu/edit/id/36.html', 1, 1540799167),
(43, 10, 1, 2130706433, 'Menu', 36, '操作url：/admin/menu/edit/id/36.html', 1, 1540799183),
(44, 10, 1, 2130706433, 'Menu', 1, '操作url：/admin/menu/add/pid/0.html', 1, 1540949429),
(45, 10, 1, 2130706433, 'Menu', 1, '操作url：/admin/menu/add/pid/37.html', 1, 1540949561),
(46, 10, 1, 2130706433, 'Menu', 37, '操作url：/admin/menu/edit/id/37.html', 1, 1540950603),
(47, 10, 1, 2130706433, 'Menu', 22, '操作url：/admin/menu/edit/id/22.html', 1, 1540950952),
(48, 10, 1, 2130706433, 'Menu', 10, '操作url：/admin/menu/edit/id/10.html', 1, 1540951006),
(49, 10, 1, 2130706433, 'Menu', 10, '操作url：/admin/menu/edit/id/10.html', 1, 1540951067),
(50, 10, 1, 2130706433, 'Menu', 22, '操作url：/admin/menu/edit/id/22.html', 1, 1540951077),
(51, 10, 1, 2130706433, 'Menu', 3, '操作url：/admin/menu/edit/id/3.html', 1, 1540951596),
(52, 10, 1, 2130706433, 'Menu', 3, '操作url：/admin/menu/edit/id/3.html', 1, 1540951670),
(53, 10, 1, 2130706433, 'Menu', 3, '操作url：/admin/menu/edit/id/3.html', 1, 1540951698),
(54, 10, 1, 2130706433, 'Menu', 10, '操作url：/admin/menu/edit/id/10.html', 1, 1540952232),
(55, 10, 1, 2130706433, 'Menu', 10, '操作url：/admin/menu/edit/id/10.html', 1, 1540953065),
(56, 10, 1, 2130706433, 'Menu', 22, '操作url：/admin/menu/edit/id/22.html', 1, 1540953117),
(57, 10, 1, 2130706433, 'Menu', 10, '操作url：/admin/menu/edit/id/10.html', 1, 1540953203),
(58, 10, 1, 2130706433, 'Menu', 22, '操作url：/admin/menu/edit/id/22.html', 1, 1540953230),
(59, 11, 1, 2130706433, 'category', 1, '操作url：/admin/category/add.html', 1, 1540956055),
(60, 10, 1, 2130706433, 'Menu', 38, '操作url：/admin/menu/edit/id/38.html', 1, 1540957342),
(61, 10, 1, 2130706433, 'Menu', 37, '操作url：/admin/menu/edit/id/37.html', 1, 1540957788),
(62, 10, 1, 2130706433, 'Menu', 37, '操作url：/admin/menu/edit/id/37.html', 1, 1540957827),
(63, 10, 1, 2130706433, 'Menu', 37, '操作url：/admin/menu/edit/id/37.html', 1, 1540957887),
(64, 10, 1, 2130706433, 'Menu', 37, '操作url：/admin/menu/edit/id/37.html', 1, 1540957926),
(65, 10, 1, 2130706433, 'Menu', 37, '操作url：/admin/menu/edit/id/37.html', 1, 1540957963),
(66, 10, 1, 2130706433, 'Menu', 38, '操作url：/admin/menu/edit/id/38.html', 1, 1540958001),
(67, 10, 1, 2130706433, 'Menu', 37, '操作url：/admin/menu/edit/id/37.html', 1, 1540958017),
(68, 10, 1, 2130706433, 'Menu', 3, '操作url：/admin/menu/edit/id/3.html', 1, 1540971245),
(69, 10, 1, 2130706433, 'Menu', 38, '操作url：/admin/menu/edit/id/38.html', 1, 1540972158),
(70, 10, 1, 2130706433, 'Menu', 37, '操作url：/admin/menu/edit/id/37.html', 1, 1540972185),
(71, 10, 1, 2130706433, 'Menu', 3, '操作url：/admin/menu/edit/id/3.html', 1, 1540979218),
(72, 11, 1, 2130706433, 'category', 8, '操作url：/admin/category/edit.html', 1, 1540979251),
(73, 11, 1, 2130706433, 'category', 1, '操作url：/admin/category/edit.html', 1, 1540979560),
(74, 11, 1, 2130706433, 'category', 2, '操作url：/admin/category/edit.html', 1, 1540979621),
(75, 11, 1, 2130706433, 'category', 8, '操作url：/admin/category/edit.html', 1, 1540979636),
(76, 10, 1, 2130706433, 'Menu', 37, '操作url：/admin/menu/edit/id/37.html', 1, 1541052175),
(77, 10, 1, 2130706433, 'Menu', 3, '操作url：/admin/menu/edit/id/3.html', 1, 1541052199),
(78, 11, 1, 2130706433, 'category', 3, '操作url：/admin/category/edit.html', 1, 1541052438),
(79, 11, 1, 2130706433, 'category', 1, '操作url：/admin/category/add.html', 1, 1541052462),
(80, 11, 1, 2130706433, 'category', 1, '操作url：/admin/category/add.html', 1, 1541052492),
(81, 11, 1, 2130706433, 'category', 1, '操作url：/admin/category/add.html', 1, 1541052512),
(82, 11, 1, 2130706433, 'category', 1, '操作url：/admin/category/add.html', 1, 1541052525),
(83, 10, 1, 2130706433, 'Menu', 3, '操作url：/admin/menu/edit/id/3.html', 1, 1541466754),
(84, 10, 1, 2130706433, 'Menu', 37, '操作url：/admin/menu/edit/id/37.html', 1, 1541466840),
(85, 10, 1, 2130706433, 'Menu', 38, '操作url：/admin/menu/edit/id/38.html', 1, 1541466891),
(86, 10, 1, 2130706433, 'Menu', 38, '操作url：/admin/menu/edit/id/38.html', 1, 1541466977),
(87, 10, 1, 2130706433, 'Menu', 1, '操作url：/admin/menu/add/pid/37.html', 1, 1541467035),
(88, 10, 1, 2130706433, 'Menu', 1, '操作url：/admin/menu/add/pid/37.html', 1, 1541467098),
(89, 10, 1, 2130706433, 'Menu', 1, '操作url：/admin/menu/add/pid/37.html', 1, 1541467160),
(90, 10, 1, 2130706433, 'Menu', 1, '操作url：/admin/menu/add/pid/37.html', 1, 1541467181),
(91, 10, 1, 2130706433, 'Menu', 1, '操作url：/admin/menu/add/pid/37.html', 1, 1541467201),
(92, 10, 1, 2130706433, 'Menu', 1, '操作url：/admin/menu/add/pid/37.html', 1, 1541467236),
(93, 10, 1, 2130706433, 'Menu', 1, '操作url：/admin/menu/add/pid/37.html', 1, 1541467265),
(94, 10, 1, 2130706433, 'Menu', 1, '操作url：/admin/menu/add/pid/37.html', 1, 1541467300),
(95, 10, 1, 2130706433, 'Menu', 1, '操作url：/admin/menu/add/pid/37.html', 1, 1541467361),
(96, 10, 1, 2130706433, 'Menu', 1, '操作url：/admin/menu/add/pid/37.html', 1, 1541467393),
(97, 10, 1, 2130706433, 'Menu', 1, '操作url：/admin/menu/add/pid/0.html', 1, 1541467588),
(98, 10, 1, 2130706433, 'Menu', 1, '操作url：/admin/menu/add/pid/49.html', 1, 1541467634),
(99, 10, 1, 2130706433, 'Menu', 49, '操作url：/admin/menu/edit/id/49.html', 1, 1541467704),
(100, 10, 1, 2130706433, 'Menu', 50, '操作url：/admin/menu/edit/id/50.html', 1, 1541467735),
(101, 10, 1, 2130706433, 'Menu', 33, '操作url：/admin/menu/edit/id/33.html', 1, 1541470855),
(102, 10, 1, 2130706433, 'Menu', 34, '操作url：/admin/menu/edit/id/34.html', 1, 1541470868),
(103, 10, 1, 2130706433, 'Menu', 36, '操作url：/admin/menu/edit/id/36.html', 1, 1541470883),
(104, 10, 1, 2130706433, 'Menu', 35, '操作url：/admin/menu/edit/id/35.html', 1, 1541470964),
(105, 10, 1, 2130706433, 'Menu', 4, '操作url：/admin/menu/edit/id/4.html', 1, 1541471048),
(106, 10, 1, 2130706433, 'Menu', 1, '操作url：/admin/menu/add/pid/0.html', 1, 1541471136),
(107, 10, 1, 2130706433, 'Menu', 31, '操作url：/admin/menu/edit/id/31.html', 1, 1541471233),
(108, 10, 1, 2130706433, 'Menu', 32, '操作url：/admin/menu/edit/id/32.html', 1, 1541471298),
(109, 10, 1, 2130706433, 'Menu', 51, '操作url：/admin/menu/edit/id/51.html', 1, 1541471319),
(110, 10, 1, 2130706433, 'Menu', 31, '操作url：/admin/menu/edit/id/31.html', 1, 1541472379),
(111, 10, 1, 2130706433, 'Menu', 32, '操作url：/admin/menu/edit/id/32.html', 1, 1541474363),
(112, 10, 1, 2130706433, 'Menu', 51, '操作url：/admin/menu/edit/id/51.html', 1, 1541474499),
(113, 10, 1, 2130706433, 'Menu', 51, '操作url：/admin/menu/edit/id/51.html', 1, 1541474530),
(114, 10, 1, 2130706433, 'Menu', 51, '操作url：/admin/menu/edit/id/51.html', 1, 1541474706),
(115, 10, 1, 2130706433, 'Menu', 51, '操作url：/admin/menu/edit/id/51.html', 1, 1541474859),
(116, 10, 1, 2130706433, 'Menu', 51, '操作url：/admin/menu/edit/id/51.html', 1, 1541474883),
(117, 10, 1, 2130706433, 'Menu', 49, '操作url：/admin/menu/edit/id/49.html', 1, 1541474923),
(118, 10, 1, 2130706433, 'Menu', 49, '操作url：/admin/menu/edit/id/49.html', 1, 1541474935),
(119, 10, 1, 2130706433, 'Menu', 49, '操作url：/admin/menu/edit/id/49.html', 1, 1541474994),
(120, 10, 1, 2130706433, 'Menu', 37, '操作url：/admin/menu/edit/id/37.html', 1, 1541475083),
(121, 10, 1, 2130706433, 'Menu', 1, '操作url：/admin/menu/add/pid/0.html', 1, 1541475369),
(122, 10, 1, 2130706433, 'Menu', 1, '操作url：/admin/menu/edit/id/1.html', 1, 1541475392),
(123, 10, 1, 2130706433, 'Menu', 3, '操作url：/admin/menu/edit/id/3.html', 1, 1541475426),
(124, 10, 1, 2130706433, 'Menu', 1, '操作url：/admin/menu/add/pid/0.html', 1, 1541475554),
(125, 10, 1, 2130706433, 'Menu', 53, '操作url：/admin/menu/edit/id/53.html', 1, 1541475568),
(126, 10, 1, 2130706433, 'Menu', 1, '操作url：/admin/menu/add/pid/6.html', 1, 1541475650),
(127, 10, 1, 2130706433, 'Menu', 54, '操作url：/admin/menu/edit/id/54.html', 1, 1541475743),
(128, 10, 1, 2130706433, 'Menu', 1, '操作url：/admin/menu/add/pid/6.html', 1, 1541475839),
(129, 10, 1, 2130706433, 'Menu', 1, '操作url：/admin/menu/add/pid/6.html', 1, 1541475961),
(130, 10, 1, 2130706433, 'Menu', 38, '操作url：/admin/menu/edit/id/38.html', 1, 1541485346),
(131, 10, 1, 2130706433, 'Menu', 39, '操作url：/admin/menu/edit/id/39.html', 1, 1541485358),
(132, 10, 1, 2130706433, 'Menu', 41, '操作url：/admin/menu/edit/id/41.html', 1, 1541485374),
(133, 10, 1, 2130706433, 'Menu', 42, '操作url：/admin/menu/edit/id/42.html', 1, 1541485394),
(134, 10, 1, 2130706433, 'Menu', 43, '操作url：/admin/menu/edit/id/43.html', 1, 1541485404),
(135, 10, 1, 2130706433, 'Menu', 44, '操作url：/admin/menu/edit/id/44.html', 1, 1541485413),
(136, 10, 1, 2130706433, 'Menu', 45, '操作url：/admin/menu/edit/id/45.html', 1, 1541485425),
(137, 10, 1, 2130706433, 'Menu', 46, '操作url：/admin/menu/edit/id/46.html', 1, 1541485437),
(138, 10, 1, 2130706433, 'Menu', 47, '操作url：/admin/menu/edit/id/47.html', 1, 1541485449),
(139, 10, 1, 2130706433, 'Menu', 48, '操作url：/admin/menu/edit/id/48.html', 1, 1541485472),
(140, 10, 1, 2130706433, 'Menu', 6, '操作url：/admin/menu/edit/id/6.html', 1, 1541485496),
(141, 10, 1, 2130706433, 'Menu', 1, '操作url：/admin/menu/add/pid/35.html', 1, 1541485654),
(142, 10, 1, 2130706433, 'Menu', 57, '操作url：/admin/menu/edit/id/57.html', 1, 1541485685),
(143, 10, 1, 2130706433, 'Menu', 1, '操作url：/admin/menu/add/pid/35.html', 1, 1541485711),
(144, 10, 1, 2130706433, 'Menu', 57, '操作url：/admin/menu/edit/id/57.html', 1, 1541485728),
(145, 10, 1, 2130706433, 'Menu', 39, '操作url：/admin/menu/edit/id/39.html', 1, 1541485767),
(146, 10, 1, 2130706433, 'Menu', 40, '操作url：/admin/menu/edit/id/40.html', 1, 1541485785),
(147, 10, 1, 2130706433, 'Menu', 40, '操作url：/admin/menu/edit/id/40.html', 1, 1541485808),
(148, 10, 1, 2130706433, 'Menu', 41, '操作url：/admin/menu/edit/id/41.html', 1, 1541485821),
(149, 10, 1, 2130706433, 'Menu', 42, '操作url：/admin/menu/edit/id/42.html', 1, 1541485835),
(150, 10, 1, 2130706433, 'Menu', 46, '操作url：/admin/menu/edit/id/46.html', 1, 1541485853),
(151, 10, 1, 2130706433, 'Menu', 47, '操作url：/admin/menu/edit/id/47.html', 1, 1541485865),
(152, 10, 1, 2130706433, 'Menu', 48, '操作url：/admin/menu/edit/id/48.html', 1, 1541485878),
(153, 10, 1, 2130706433, 'Menu', 1, '操作url：/admin/menu/add/pid/52.html', 1, 1541488017),
(154, 10, 1, 2130706433, 'Menu', 1, '操作url：/admin/menu/add/pid/52.html', 1, 1541488042),
(155, 10, 1, 2130706433, 'Menu', 52, '操作url：/admin/menu/edit/id/52.html', 1, 1541488086),
(156, 10, 1, 2130706433, 'Menu', 59, '操作url：/admin/menu/edit/id/59.html', 1, 1541488104),
(157, 10, 1, 2130706433, 'Menu', 1, '操作url：/admin/menu/add/pid/53.html', 1, 1541488422),
(158, 10, 1, 2130706433, 'Menu', 53, '操作url：/admin/menu/edit/id/53.html', 1, 1541488467),
(159, 10, 1, 2130706433, 'Menu', 61, '操作url：/admin/menu/edit/id/61.html', 1, 1541488493),
(160, 10, 1, 2130706433, 'Menu', 1, '操作url：/admin/menu/add/pid/53.html', 1, 1541488532),
(161, 10, 1, 2130706433, 'Menu', 1, '操作url：/admin/menu/add/pid/53.html', 1, 1541488650),
(162, 10, 1, 2130706433, 'Menu', 39, '操作url：/admin/menu/edit/id/39.html', 1, 1541489047),
(163, 10, 1, 2130706433, 'Menu', 41, '操作url：/admin/menu/edit/id/41.html', 1, 1541489063),
(164, 10, 1, 2130706433, 'Menu', 39, '操作url：/admin/menu/edit/id/39.html', 1, 1541489136),
(165, 10, 1, 2130706433, 'Menu', 39, '操作url：/admin/menu/edit/id/39.html', 1, 1541489180),
(166, 10, 1, 2130706433, 'Menu', 40, '操作url：/admin/menu/edit/id/40.html', 1, 1541489417),
(167, 10, 1, 2130706433, 'Menu', 41, '操作url：/admin/menu/edit/id/41.html', 1, 1541489438),
(168, 10, 1, 2130706433, 'Menu', 40, '操作url：/admin/menu/edit/id/40.html', 1, 1541489449),
(169, 10, 1, 2130706433, 'Menu', 42, '操作url：/admin/menu/edit/id/42.html', 1, 1541489463),
(170, 10, 1, 2130706433, 'Menu', 43, '操作url：/admin/menu/edit/id/43.html', 1, 1541489479),
(171, 10, 1, 2130706433, 'Menu', 1, '操作url：/admin/menu/add/pid/37.html', 1, 1541489638),
(172, 10, 1, 2130706433, 'Menu', 1, '操作url：/admin/menu/add/pid/37.html', 1, 1541489675),
(173, 10, 1, 2130706433, 'Menu', 1, '操作url：/admin/menu/add/pid/37.html', 1, 1541489710),
(174, 10, 1, 2130706433, 'Menu', 1, '操作url：/admin/menu/add/pid/37.html', 1, 1541489739),
(175, 10, 1, 2130706433, 'Menu', 39, '操作url：/admin/menu/edit/id/39.html', 1, 1541490036),
(176, 10, 1, 2130706433, 'Menu', 32, '操作url：/admin/menu/edit/id/32.html', 1, 1541493881),
(177, 10, 1, 2130706433, 'Menu', 50, '操作url：/admin/menu/edit/id/50.html', 1, 1541494144),
(178, 10, 1, 2130706433, 'Menu', 40, '操作url：/admin/menu/edit/id/40.html', 1, 1541495150),
(179, 10, 1, 2130706433, 'Menu', 41, '操作url：/admin/menu/edit/id/41.html', 1, 1541495179),
(180, 10, 1, 2130706433, 'Menu', 42, '操作url：/admin/menu/edit/id/42.html', 1, 1541495196),
(181, 10, 1, 2130706433, 'Menu', 43, '操作url：/admin/menu/edit/id/43.html', 1, 1541495222),
(182, 10, 1, 2130706433, 'Menu', 44, '操作url：/admin/menu/edit/id/44.html', 1, 1541495259),
(183, 10, 1, 2130706433, 'Menu', 45, '操作url：/admin/menu/edit/id/45.html', 1, 1541495282),
(184, 10, 1, 2130706433, 'Menu', 46, '操作url：/admin/menu/edit/id/46.html', 1, 1541495323),
(185, 10, 1, 2130706433, 'Menu', 47, '操作url：/admin/menu/edit/id/47.html', 1, 1541495371),
(186, 10, 1, 2130706433, 'Menu', 48, '操作url：/admin/menu/edit/id/48.html', 1, 1541495416),
(187, 10, 1, 2130706433, 'Menu', 64, '操作url：/admin/menu/edit/id/64.html', 1, 1541495478),
(188, 10, 1, 2130706433, 'Menu', 65, '操作url：/admin/menu/edit/id/65.html', 1, 1541495494),
(189, 10, 1, 2130706433, 'Menu', 66, '操作url：/admin/menu/edit/id/66.html', 1, 1541495528),
(190, 10, 1, 2130706433, 'Menu', 67, '操作url：/admin/menu/edit/id/67.html', 1, 1541495548),
(191, 10, 1, 2130706433, 'Menu', 43, '操作url：/admin/menu/edit/id/43.html', 1, 1541496140),
(192, 10, 1, 2130706433, 'Menu', 44, '操作url：/admin/menu/edit/id/44.html', 1, 1541496168),
(193, 10, 1, 2130706433, 'Menu', 1, '操作url：/admin/menu/edit/id/1.html', 1, 1541661810),
(194, 10, 1, 2130706433, 'Menu', 58, '操作url：/admin/menu/edit/id/58.html', 1, 1541667732),
(195, 10, 1, 2130706433, 'Menu', 54, '操作url：/admin/menu/edit/id/54.html', 1, 1542010923),
(196, 10, 1, 2130706433, 'Menu', 56, '操作url：/admin/menu/edit/id/56.html', 1, 1542011336),
(197, 10, 1, 2130706433, 'Menu', 60, '操作url：/admin/menu/edit/id/60.html', 1, 1542071874),
(198, 10, 1, 2130706433, 'Menu', 10, '操作url：/admin/menu/edit/id/10.html', 1, 1542158544),
(199, 10, 1, 2130706433, 'Menu', 22, '操作url：/admin/menu/edit/id/22.html', 1, 1542158557),
(200, 10, 1, 2130706433, 'Menu', 55, '操作url：/admin/menu/edit/id/55.html', 1, 1542447735);

-- --------------------------------------------------------

--
-- 表的结构 `sent_activity`
--

CREATE TABLE IF NOT EXISTS `sent_activity` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '名称',
  `amount` int(11) NOT NULL COMMENT '金额',
  `gift` varchar(255) NOT NULL COMMENT '礼物名称',
  `online_time` int(11) NOT NULL COMMENT '上线时间',
  `downline_time` int(11) NOT NULL COMMENT '下线时间',
  `number` int(11) NOT NULL COMMENT '报名人数',
  `status` tinyint(4) NOT NULL COMMENT '状态 1:上线 0:下线',
  `description` varchar(300) NOT NULL COMMENT '活动介绍',
  `type` tinyint(4) NOT NULL COMMENT '活动类型(1:报名送（减） 2:团报送（减）3：报名加钱送物（+）)',
  `icon` int(11) NOT NULL COMMENT '活动图标',
  `two_amount` int(11) NOT NULL COMMENT '两人团优惠金额',
  `three_amount` int(11) NOT NULL COMMENT '三人团优惠金额',
  `five_amount` int(11) NOT NULL COMMENT '五人团优惠金额',
  `tels` varchar(200) NOT NULL COMMENT '团报人电话号码',
  `what` tinyint(4) NOT NULL COMMENT '送啥(1:钱 2:物)',
  `school_id` smallint(6) NOT NULL DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='活动管理';

--
-- 转存表中的数据 `sent_activity`
--

INSERT INTO `sent_activity` (`id`, `name`, `amount`, `gift`, `online_time`, `downline_time`, `number`, `status`, `description`, `type`, `icon`, `two_amount`, `three_amount`, `five_amount`, `tels`, `what`, `school_id`) VALUES
(4, '报名立减', 200, '', 1542331215, 1543543203, 0, 0, '直接报名可享受\r\n200元学费减免', 1, 82, 3, 0, 0, '', 1, 1),
(5, '团报优惠', 0, '', 1542333428, 1543543203, 0, 0, '两人团减免100元\r\n三人团减免200元\r\n五人团减免300元', 2, 83, 100, 200, 300, '', 1, 1),
(6, '加就送', 200, '跑步机', 1542334023, 1543543203, 0, 0, '报名加200元赠送价值888元跑步机一台\r\n阿斯蒂芬\r\n阿斯顿发斯蒂芬完全二确认抢人头\r\n阿斯蒂芬阿道夫阿斯', 3, 178, 0, 0, 0, '', 2, 1),
(7, '送优惠券', 0, '优惠券', 1542334273, 1542334273, 0, 0, '报名就送优惠券', 1, 84, 0, 0, 0, '', 2, 1);

-- --------------------------------------------------------

--
-- 表的结构 `sent_ad`
--

CREATE TABLE IF NOT EXISTS `sent_ad` (
  `id` int(10) unsigned NOT NULL COMMENT '主键',
  `place_id` int(11) DEFAULT NULL COMMENT '广告位ID',
  `title` varchar(150) DEFAULT NULL COMMENT '广告名称',
  `cover_id` int(11) DEFAULT NULL COMMENT '广告图片',
  `photolist` varchar(20) NOT NULL COMMENT '辅助图片',
  `url` varchar(150) DEFAULT NULL COMMENT '广告链接',
  `listurl` varchar(255) DEFAULT NULL COMMENT '辅助链接',
  `background` varchar(150) DEFAULT NULL COMMENT '广告背景',
  `content` text COMMENT '广告描述',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '广告位状态'
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='广告表';

--
-- 转存表中的数据 `sent_ad`
--

INSERT INTO `sent_ad` (`id`, `place_id`, `title`, `cover_id`, `photolist`, `url`, `listurl`, `background`, `content`, `create_time`, `update_time`, `status`) VALUES
(1, 1, '电子商务系统设计与开发', 0, '', '', '', '', '<p>我们为客户提供专业的B2C、C2C、B2B、P2P等电子商务平台开发，同时紧扣企业运营，提供个性化的电子商务平台开发和运营管理平台。 </p>', 1440433466, 1440433466, 1),
(2, 1, '企业网站设计与开发', 0, '', '', '', '', '<p>我们为您提供更加专业的企业网站建设、企业文化提升以及企业形象包装服务，为您量身打造更加适合当前网络时代的需求服务，让您的公司更加贴近客户。</p>', 1440433531, 1440433531, 1),
(3, 1, 'WEB应用系统设计与开发', 14, '', '', '', '', '<p>我们为您的企业量身打造专业级别的企业OA系统、CRM系统等，为事、企业单位提供更好更高效的无纸化办公平台环境。</p>', 1440433554, 1462966106, 1),
(4, 1, '手机APP应用设计与开发', 47, '', 'http://www.tensent.cn', '', '', '<p>腾速科技有限公司专注于手机客户端软件开发，是省内移动客户端开发商的先行者，做到行业内领先地位。 </p>', 1440433571, 1541490520, 1),
(6, 1, '123', 0, '60,61,62,63,64', '', '', '', '', 1541556489, 1541556489, 0);

-- --------------------------------------------------------

--
-- 表的结构 `sent_addons`
--

CREATE TABLE IF NOT EXISTS `sent_addons` (
  `id` int(10) unsigned NOT NULL COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `isinstall` int(10) DEFAULT '0' COMMENT '是否安装',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `has_adminlist` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台列表'
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='插件表';

--
-- 转存表中的数据 `sent_addons`
--

INSERT INTO `sent_addons` (`id`, `name`, `title`, `description`, `status`, `config`, `author`, `version`, `isinstall`, `create_time`, `has_adminlist`) VALUES
(1, 'Devteam', '开发团队信息', '开发团队成员信息', 1, '', 'molong', '0.1', 1, 0, 0),
(2, 'Sitestat', '站点统计信息', '统计站点的基础信息', 1, '', 'thinkphp', '0.2', 1, 0, 0),
(3, 'Systeminfo', '系统环境信息', '用于显示一些服务器的信息', 1, '', 'molong', '0.1', 1, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `sent_ad_place`
--

CREATE TABLE IF NOT EXISTS `sent_ad_place` (
  `id` int(10) unsigned NOT NULL COMMENT '主键',
  `title` varchar(150) DEFAULT NULL COMMENT '广告位名称',
  `name` varchar(20) NOT NULL COMMENT '调用名称',
  `show_type` int(11) NOT NULL DEFAULT '5' COMMENT '广告位类型',
  `show_num` int(11) NOT NULL DEFAULT '5' COMMENT '显示条数',
  `start_time` int(11) NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` int(11) NOT NULL DEFAULT '0' COMMENT '结束时间',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `template` varchar(150) DEFAULT NULL COMMENT '广告位模板',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '广告位状态'
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='广告位表';

--
-- 转存表中的数据 `sent_ad_place`
--

INSERT INTO `sent_ad_place` (`id`, `title`, `name`, `show_type`, `show_num`, `start_time`, `end_time`, `create_time`, `update_time`, `template`, `status`) VALUES
(1, '首页幻灯片', 'banner', 1, 5, 0, 0, 1440433367, 1440433367, '', 1);

-- --------------------------------------------------------

--
-- 表的结构 `sent_apply`
--

CREATE TABLE IF NOT EXISTS `sent_apply` (
  `id` int(11) unsigned NOT NULL,
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `phone` varchar(15) NOT NULL COMMENT '电话',
  `station_id` int(11) NOT NULL COMMENT '体检站',
  `code_id` int(11) DEFAULT NULL COMMENT '体检码',
  `is_pay` tinyint(4) DEFAULT NULL COMMENT '是否付款(1:已付款 0：未付款)',
  `create_time` int(11) NOT NULL COMMENT '申请时间',
  `openid` varchar(200) DEFAULT NULL COMMENT '用户openid',
  `sn` varchar(200) DEFAULT NULL COMMENT '订单标号'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='体检申请表';

--
-- 转存表中的数据 `sent_apply`
--

INSERT INTO `sent_apply` (`id`, `name`, `phone`, `station_id`, `code_id`, `is_pay`, `create_time`, `openid`, `sn`) VALUES
(1, '花花', '13594855871', 1, 3, 1, 1542940665, 'o2l0cwqD9xFMwlNrr7BfBCmhLVv8', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `sent_area`
--

CREATE TABLE IF NOT EXISTS `sent_area` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '场地名称',
  `address` varchar(100) NOT NULL COMMENT '场地地址',
  `lat` varchar(20) NOT NULL COMMENT '场地纬度',
  `lng` varchar(20) NOT NULL COMMENT '场地经度',
  `thumb` varchar(200) NOT NULL COMMENT '封面图',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 0：启用 1：禁用',
  `school_id` smallint(6) NOT NULL DEFAULT '1' COMMENT '学校ID'
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='场地管理表';

--
-- 转存表中的数据 `sent_area`
--

INSERT INTO `sent_area` (`id`, `name`, `address`, `lat`, `lng`, `thumb`, `status`, `school_id`) VALUES
(1, '大学城一号训练基地', '陈家桥轻轨站1号出口', '29.567507', '106.559614', '113', 0, 1),
(2, '南岸', '南岸', '29.567507', '106.559614', '54', 0, 1),
(3, '北碚', '北碚XXX', '29.57002', '106.434282', '6', 0, 1),
(4, '北碚一号训练基地(西大、重师)', '北碚', '29.583464', '106.328426', '12', 0, 1),
(5, '沙坪坝', '沙坪坝', '29.570209', '106.308232', '174', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `sent_attachment`
--

CREATE TABLE IF NOT EXISTS `sent_attachment` (
  `id` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '附件显示名',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件类型',
  `source` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '资源ID',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联记录ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '附件大小',
  `dir` int(12) unsigned NOT NULL DEFAULT '0' COMMENT '上级目录ID',
  `sort` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表';

-- --------------------------------------------------------

--
-- 表的结构 `sent_attribute`
--

CREATE TABLE IF NOT EXISTS `sent_attribute` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '字段注释',
  `length` varchar(100) NOT NULL DEFAULT '' COMMENT '字段定义',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '数据类型',
  `value` varchar(100) NOT NULL DEFAULT '' COMMENT '字段默认值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '参数',
  `model_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型id',
  `is_must` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否必填',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `validate_rule` varchar(255) NOT NULL DEFAULT '',
  `validate_time` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `error_info` varchar(100) NOT NULL DEFAULT '',
  `validate_type` varchar(25) NOT NULL DEFAULT '',
  `auto_rule` varchar(100) NOT NULL DEFAULT '',
  `auto_time` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `auto_type` varchar(25) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COMMENT='模型属性表';

--
-- 转存表中的数据 `sent_attribute`
--

INSERT INTO `sent_attribute` (`id`, `name`, `title`, `length`, `type`, `value`, `remark`, `is_show`, `extra`, `model_id`, `is_must`, `status`, `update_time`, `create_time`, `validate_rule`, `validate_time`, `error_info`, `validate_type`, `auto_rule`, `auto_time`, `auto_type`) VALUES
(1, 'uid', '用户ID', '10', 'num', '0', '', 0, '', 1, 0, 1, 1384508362, 1383891233, '', 0, '', '', '', 0, ''),
(2, 'name', '标识', '40', 'string', '', '同一根节点下标识不重复', 1, '', 1, 0, 1, 1383894743, 1383891233, '', 0, '', '', '', 0, ''),
(3, 'title', '标题', '80', 'string', '', '文档标题', 1, '', 1, 0, 1, 1383894778, 1383891233, '', 0, '', '', '', 0, ''),
(4, 'category_id', '所属分类', '10', 'bind', '', '', 1, 'category', 1, 0, 1, 1384508336, 1383891233, '', 0, '', '', '', 0, ''),
(5, 'description', '描述', '140', 'textarea', '', '', 1, '', 1, 0, 1, 1383894927, 1383891233, '', 0, '', '', '', 0, ''),
(8, 'model_id', '内容模型ID', '3', 'num', '0', '该文档所对应的模型', 0, '', 1, 0, 1, 1384508350, 1383891233, '', 0, '', '', '', 0, ''),
(10, 'position', '推荐位', '5', 'select', '0', '多个推荐则将其推荐值相加', 1, '[DOCUMENT_POSITION]', 1, 0, 1, 1383895640, 1383891233, '', 0, '', '', '', 0, ''),
(11, 'link_id', '外链', '10', 'num', '0', '0-非外链，大于0-外链ID,需要函数进行链接与编号的转换', 1, '', 1, 0, 1, 1383895757, 1383891233, '', 0, '', '', '', 0, ''),
(12, 'cover_id', '封面', '10', 'image', '0', '0-无封面，大于0-封面图片ID，需要函数处理', 1, '', 1, 0, 1, 1384147827, 1383891233, '', 0, '', '', '', 0, ''),
(13, 'display', '可见性', '3', 'bool', '1', '', 1, '0:不可见\r\n1:所有人可见', 1, 0, 1, 1386662271, 1383891233, '', 0, '', 'regex', '', 0, 'function'),
(14, 'deadline', '截至时间', '10', 'datetime', '0', '0-永久有效', 1, '', 1, 0, 1, 1387163248, 1383891233, '', 0, '', 'regex', '', 0, 'function'),
(15, 'attach', '附件数量', '3', 'num', '0', '', 0, '', 1, 0, 1, 1387260355, 1383891233, '', 0, '', 'regex', '', 0, 'function'),
(16, 'view', '浏览量', '10', 'num', '0', '', 1, '', 1, 0, 1, 1383895835, 1383891233, '', 0, '', '', '', 0, ''),
(17, 'comment', '评论数', '10', 'num', '0', '', 1, '', 1, 0, 1, 1383895846, 1383891233, '', 0, '', '', '', 0, ''),
(18, 'extend', '扩展统计字段', '10', 'num', '0', '根据需求自行使用', 0, '', 1, 0, 1, 1384508264, 1383891233, '', 0, '', '', '', 0, ''),
(19, 'level', '优先级', '10', 'num', '0', '越高排序越靠前', 1, '', 1, 0, 1, 1453278679, 1383891233, '', 0, '', '0', '', 0, '0'),
(20, 'create_time', '创建时间', '10', 'datetime', '0', '', 1, '', 1, 0, 1, 1383895903, 1383891233, '', 0, '', '', '', 0, ''),
(21, 'update_time', '更新时间', '10', 'text', '0', '', 0, '', 1, 0, 1, 1453278665, 1383891233, '', 0, '', '0', '', 0, '0'),
(22, 'status', '数据状态', '4', 'select', '1', '', 0, '-1:删除\r\n0:禁用\r\n1:正常\r\n2:待审核\r\n3:草稿', 1, 0, 1, 1453278660, 1383891233, '', 0, '', '0', '', 0, '0'),
(24, 'content', '内容', '', 'editor', '', '', 1, '', 2, 0, 1, 1453859207, 1453859207, '', 0, '', '0', '', 0, '0'),
(25, 'tags', '标签', '20', 'tags', '', '', 1, '', 2, 0, 1, 1453881165, 1453881107, '', 0, '', '0', '', 0, '0'),
(26, 'photo_list', '图片列表', '50', 'images', '', '111', 0, '', 3, 0, 1, 1540979476, 1454052339, '', 0, '', '0', '', 0, '0'),
(27, 'content', '内容', '', 'editor', '', '', 1, '', 3, 0, 1, 1454052355, 1454052355, '', 0, '', '0', '', 0, '0'),
(28, 'title', '标题', '200', 'text', '', '', 1, '', 4, 0, 0, 0, 0, '', 0, '', '0', '', 0, '0'),
(29, 'model_id', '模型ID', '11', 'num', '', '', 0, '', 4, 1, 0, 0, 0, '', 0, '', '0', '', 0, '0'),
(30, 'cover_id', '封面', '11', 'image', '0', '', 1, '', 4, 0, 0, 0, 0, '', 0, '', '0', '', 0, '0'),
(31, 'content', '内容', '', 'editor', '', '', 1, '', 4, 0, 0, 0, 0, '', 0, '', '0', '', 0, '0'),
(32, 'create_time', '创建时间', '11', 'datetime', '', '', 1, '', 4, 0, 0, 0, 0, '', 0, '', '0', '', 0, '0'),
(33, 'update_time', '更新时间', '11', 'datetime', '', '', 1, '', 4, 0, 0, 0, 0, '', 0, '', '0', '', 0, '0'),
(34, 'is_top', '是否置顶', '1', 'bool', '0', '', 1, '0:否\r\n1:是', 1, 0, 0, 1466041260, 1466041226, '', 0, '', '0', '', 0, '0');

-- --------------------------------------------------------

--
-- 表的结构 `sent_auth_extend`
--

CREATE TABLE IF NOT EXISTS `sent_auth_extend` (
  `group_id` mediumint(10) unsigned NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) unsigned NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组与分类的对应关系表';

-- --------------------------------------------------------

--
-- 表的结构 `sent_auth_group`
--

CREATE TABLE IF NOT EXISTS `sent_auth_group` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL DEFAULT '' COMMENT '用户组所属模块',
  `type` varchar(10) NOT NULL DEFAULT '' COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(500) DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  `school_id` smallint(6) NOT NULL DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sent_auth_group`
--

INSERT INTO `sent_auth_group` (`id`, `module`, `type`, `title`, `description`, `status`, `rules`, `school_id`) VALUES
(1, 'admin', '1', '编辑', '编辑，针对内容进行管理', 1, '54,68,67,66,65,53,52,51,50,49,48,47,46,45,44,43,64,63,62,42,41,40,38,20,1', 1),
(2, 'admin', '1', '管理员', '管理员', 1, '69,54,68,67,66,65,53,52,51,50,49,48,47,46,45,44,43,64,63,62,61,60,59,58,57,55,42,41,40,38,20,1,11,10', 1),
(10, 'admin', '', '测试', '', 1, '', 1),
(11, 'admin', '', '测试1', '', 1, '95,64,94,93,92,91,90,89,88,87,63,62,86,85,84,40,38,83,82,69,54,81,80,79,59,78,77,76,58,75,74,73,42,72,71,70,41,68,67,66,65,53,52,51,50,49,48,47,46,45,44,43,61,60,57,55,20,1', 1);

-- --------------------------------------------------------

--
-- 表的结构 `sent_auth_group_access`
--

CREATE TABLE IF NOT EXISTS `sent_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sent_auth_group_access`
--

INSERT INTO `sent_auth_group_access` (`uid`, `group_id`) VALUES
(1, 2),
(2, 2),
(3, 1),
(7, 2),
(8, 2),
(10, 1),
(14, 2);

-- --------------------------------------------------------

--
-- 表的结构 `sent_auth_group_detail`
--

CREATE TABLE IF NOT EXISTS `sent_auth_group_detail` (
  `id` int(11) unsigned NOT NULL,
  `group_id` int(11) NOT NULL COMMENT '角色分组ID',
  `rules` varchar(300) NOT NULL COMMENT '规则id',
  `school_id` smallint(6) NOT NULL COMMENT '学校ID'
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='分组详细';

--
-- 转存表中的数据 `sent_auth_group_detail`
--

INSERT INTO `sent_auth_group_detail` (`id`, `group_id`, `rules`, `school_id`) VALUES
(1, 2, '69,54,68,67,66,65,53,52,51,50,49,48,47,46,45,44,43,64,63,62,61,60,59,58,57,55,42,41,40,38,20,1,11,10', 1),
(2, 2, '54,68,67,66,65,53,52,51,50,49,48,47,46,45,44,43,64,63,62,61,60,59,58,57,55,42,41,40,38,20,1,11,10,9', 2),
(3, 2, '54,68,67,66,65,53,52,51,50,49,48,47,46,45,44,43,64,63,62,61,60,59,58,57,55,42,41,40,38,20,1,11,10,9', 3),
(4, 1, '54,68,67,66,65,53,52,51,50,49,48,47,46,45,44,43,64,63,62,42,41,40,38,20,1', 1),
(5, 1, '68,67,66,65,53,52,51,50,49,48,47,46,45,44,43', 2),
(6, 1, '68,67,66,65,53,52,51,50,49,48,47,46,45,44,43', 3),
(9, 10, '', 3),
(8, 10, '', 2),
(7, 10, '', 1),
(10, 11, '95,64,94,93,92,91,90,89,88,87,63,62,86,85,84,40,38,83,82,69,54,81,80,79,59,78,77,76,58,75,74,73,42,72,71,70,41,68,67,66,65,53,52,51,50,49,48,47,46,45,44,43,61,60,57,55,20,1', 1),
(11, 11, '95,64,94,93,92,91,90,89,88,87,63,62,86,85,84,40,38,83,82,69,54,81,80,79,59,78,77,76,58,75,74,73,42,72,71,70,41,68,67,66,65,53,52,51,50,49,48,47,46,45,44,43,61,60,57,55,20,1,11,10,9', 2),
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

-- --------------------------------------------------------

--
-- 表的结构 `sent_auth_rule`
--

CREATE TABLE IF NOT EXISTS `sent_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `group` char(20) NOT NULL DEFAULT '' COMMENT '权限节点分组',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件'
) ENGINE=MyISAM AUTO_INCREMENT=96 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sent_auth_rule`
--

INSERT INTO `sent_auth_rule` (`id`, `module`, `type`, `name`, `title`, `group`, `status`, `condition`) VALUES
(1, 'admin', 2, 'admin/index/index', '后台首页', '首页管理', 1, ''),
(2, 'admin', 2, 'admin/form/index', '自定义表单', '物资管理管理', 0, ''),
(3, 'admin', 2, 'admin/addons/hooks', '钩子列表', '扩展管理', 0, ''),
(4, 'admin', 2, 'admin/addons/index', '插件列表', '系统扩展管理', 0, ''),
(5, 'admin', 2, 'admin/ad/index', '广告管理', '其他管理', 0, ''),
(6, 'admin', 2, 'admin/link/index', '友链管理', '物资管理管理', 0, ''),
(7, 'admin', 2, 'admin/action/log', '行为日志', '会员管理', 0, ''),
(8, 'admin', 2, 'admin/action/index', '行为列表', '会员管理', 0, ''),
(9, 'admin', 2, 'admin/group/access', '权限管理', '权限管理', 1, ''),
(10, 'admin', 2, 'admin/group/index', '角色管理', '权限管理', 1, ''),
(11, 'admin', 2, 'admin/user/index', '帐号管理', '权限管理', 1, ''),
(12, 'admin', 2, 'admin/model/index', '模型管理', '内容管理', 0, ''),
(13, 'admin', 2, 'admin/category/index', '栏目管理', '内容管理', 0, ''),
(14, 'admin', 2, 'admin/seo/index', 'SEO设置', '系统管理', 0, ''),
(15, 'admin', 2, 'admin/database/index?type=import', '数据恢复', '系统管理', 0, ''),
(16, 'admin', 2, 'admin/database/index?type=export', '数据备份', '系统管理', 0, ''),
(17, 'admin', 2, 'admin/channel/index', '导航管理', '系统管理', 0, ''),
(18, 'admin', 2, 'admin/menu/index', '菜单管理', '其他管理', 0, ''),
(19, 'admin', 2, 'admin/config/group', '配置管理', '系统管理', 0, ''),
(20, 'admin', 2, 'admin/index/clear', '更新缓存', '首页管理', 1, ''),
(21, 'admin', 1, 'admin/config/add', '配置添加', '系统管理', 0, ''),
(22, 'admin', 2, 'admin/content/index', '内容列表', '内容管理', 0, ''),
(23, 'admin', 2, 'admin/content/add', '内容添加', '内容管理', 0, ''),
(24, 'admin', 1, 'admin/content/edit', '内容编辑', '内容管理', 0, ''),
(25, 'admin', 1, 'admin/content/del', '内容删除', '内容管理', 0, ''),
(26, 'admin', 1, 'admin/content/status', '内容设置状态', '内容管理', 0, ''),
(27, 'admin', 1, 'admin/category/add', '栏目添加', '内容管理', 0, ''),
(28, 'admin', 1, 'admin/category/edit', '栏目编辑', '内容管理', 0, ''),
(29, 'admin', 1, 'admin/category/editable', '栏目单字编辑', '内容管理', 0, ''),
(30, 'admin', 1, 'admin/category/remove', '栏目删除', '内容管理', 0, ''),
(31, 'admin', 1, 'admin/category/merge', '栏目合并', '内容管理', 0, ''),
(32, 'admin', 1, 'admin/category/move', '栏目移动', '内容管理', 0, ''),
(33, 'admin', 1, 'admin/category/status', '栏目状态', '内容管理', 0, ''),
(34, 'admin', 2, 'admin/seo/rewrite', '伪静态规则', '系统管理', 0, ''),
(35, 'admin', 2, 'admin/config/themes', '主题管理', '系统管理', 0, ''),
(36, 'admin', 2, 'admin/goods/index', '物料管理', '物资管理', 0, ''),
(37, 'admin', 2, 'admin/borrow/index', '借用记录', '物资管理', 0, ''),
(38, 'admin', 2, 'admin/department/index', '团队列表', '团队管理', 1, ''),
(39, 'admin', 2, 'admin/borrow/back', '归还记录', '物资管理', 0, ''),
(40, 'admin', 2, 'admin/person/index', '队员列表', '团队管理', 1, ''),
(41, 'admin', 2, 'admin/area/index', '场地列表', '场地管理', 1, ''),
(42, 'admin', 2, 'admin/grade/index', '班别列表', '班别管理', 1, ''),
(43, 'admin', 2, 'admin/operate/index', 'banner图', '运营管理', 1, ''),
(44, 'admin', 2, 'admin/operate/about', '走进鼎吉', '运营管理', 1, ''),
(45, 'admin', 2, 'admin/operate/beautiful', '发现最美鼎吉', '运营管理', 1, ''),
(46, 'admin', 2, 'admin/operate/coach', '教练风采', '运营管理', 1, ''),
(47, 'admin', 2, 'admin/operate/team', '团队风采', '运营管理', 1, ''),
(48, 'admin', 2, 'admin/operate/student', '学员风采', '运营管理', 1, ''),
(49, 'admin', 2, 'admin/operate/activity', '最新活动', '运营管理', 1, ''),
(50, 'admin', 2, 'admin/operate/banner', 'banner图', '运营管理', 1, ''),
(51, 'admin', 2, 'admin/operate/agreement', '学车协议', '运营管理', 1, ''),
(52, 'admin', 2, 'admin/operate/flow', '科目一学习预约流程', '运营管理', 1, ''),
(53, 'admin', 2, 'admin/operate/pay', '约考缴费流程', '运营管理', 1, ''),
(54, 'admin', 2, 'admin/student/index', '学员列表', '学员管理', 1, ''),
(55, 'admin', 2, 'admin/partner/index', '合伙人申请', '其他管理', 1, ''),
(56, 'admin', 2, '', '学车协议', '其他管理', 0, ''),
(57, 'admin', 2, 'admin/feedback/index', '意见建议', '其他管理', 1, ''),
(58, 'admin', 2, 'admin/activity/index', '活动列表', '活动管理', 1, ''),
(59, 'admin', 2, 'admin/activity/coupon', '优惠券列表', '优惠券管理', 1, ''),
(60, 'admin', 2, 'admin/protect/index', '资源保护', '保护系统', 1, ''),
(61, 'admin', 2, 'admin/protect/develop', '开发记录', '保护系统', 1, ''),
(62, 'admin', 2, 'admin/code/index', '体检码列表', '体检码管理', 1, ''),
(63, 'admin', 2, 'admin/code/outfit', '体检机构列表', '体检码管理', 1, ''),
(64, 'admin', 2, 'admin/code/apply', '列表', '体检申请管理', 1, ''),
(65, 'admin', 2, 'admin/operate/process', '学车流程', '运营管理', 1, ''),
(66, 'admin', 2, 'admin/operate/service', '优势服务', '运营管理', 1, ''),
(67, 'admin', 2, 'admin/operate/ensure', '学车保障', '运营管理', 1, ''),
(68, 'admin', 2, 'admin/operate/question', '常见问题', '运营管理', 1, ''),
(69, 'admin', 1, 'admin/student/editable', '收款', '学员管理', 1, ''),
(70, 'admin', 1, 'admin/area/add', '新增场地', '场地管理', 1, ''),
(71, 'admin', 1, 'admin/area/edit', '编辑场地', '场地管理', 1, ''),
(72, 'admin', 1, 'admin/area/status', '启(禁)用场地', '场地管理', 1, ''),
(73, 'admin', 1, 'admin/grade/status', '上(下)线班别', '班别管理', 1, ''),
(74, 'admin', 1, 'admin/grade/edit', '编辑班别', '班别管理', 1, ''),
(75, 'admin', 1, 'admin/grade/add', '新增班别', '班别管理', 1, ''),
(76, 'admin', 1, 'admin/activity/status', '下线活动', '活动管理', 1, ''),
(77, 'admin', 1, 'admin/activity/edit', '编辑活动', '活动管理', 1, ''),
(78, 'admin', 1, 'admin/activity/add', '新增活动', '活动管理', 1, ''),
(79, 'admin', 1, 'admin/activity/code_status', '下线优惠券', '优惠券管理', 1, ''),
(80, 'admin', 1, 'admin/activity/coupon_add', '新增优惠券', '优惠券管理', 1, ''),
(81, 'admin', 1, 'admin/activity/code', '券码管理', '优惠券管理', 1, ''),
(82, 'admin', 1, 'admin/student/status', '退学', '学员管理', 1, ''),
(83, 'admin', 1, 'admin/student/export', '导出', '学员管理', 1, ''),
(84, 'admin', 1, 'admin/department/add', '导入', '团队管理', 1, ''),
(85, 'admin', 1, 'admin/department/edit', '编辑合伙人信息', '团队管理', 1, ''),
(86, 'admin', 1, 'admin/person/edit', '编辑队员信息', '团队管理', 1, ''),
(87, 'admin', 1, 'admin/code/add', '导入体检码', '体检码管理', 1, ''),
(88, 'admin', 1, 'admin/code/export', '导出', '体检码管理', 1, ''),
(89, 'admin', 1, 'admin/code/outfit_add', '新增', '体检机构管理', 1, ''),
(90, 'admin', 1, 'admin/code/outfit_edit', '编辑', '体检机构管理', 1, ''),
(91, 'admin', 1, 'admin/code/station_delete', '删除', '体检站管理', 1, ''),
(92, 'admin', 1, 'admin/code/station_edit', '编辑', '体检站管理', 1, ''),
(93, 'admin', 1, 'admin/code/station_add', '添加', '体检站管理', 1, ''),
(94, 'admin', 1, 'admin/code/station_list', '列表', '体检站管理', 1, ''),
(95, 'admin', 1, 'admin/code/apply_edit', '编辑', '体检申请管理', 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `sent_category`
--

CREATE TABLE IF NOT EXISTS `sent_category` (
  `id` int(10) unsigned NOT NULL COMMENT '分类ID',
  `name` varchar(30) NOT NULL COMMENT '标志',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `list_row` tinyint(3) unsigned NOT NULL DEFAULT '10' COMMENT '列表每页行数',
  `meta_title` varchar(50) NOT NULL DEFAULT '' COMMENT 'SEO的网页标题',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `template_index` varchar(100) NOT NULL DEFAULT '' COMMENT '频道页模板',
  `template_lists` varchar(100) NOT NULL DEFAULT '' COMMENT '列表页模板',
  `template_detail` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页模板',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '编辑页模板',
  `model` varchar(100) NOT NULL DEFAULT '' COMMENT '列表绑定模型',
  `model_sub` varchar(100) NOT NULL DEFAULT '' COMMENT '子文档绑定模型',
  `type` varchar(100) NOT NULL DEFAULT '' COMMENT '允许发布的内容类型',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `allow_publish` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许发布内容',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '可见性',
  `reply` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许回复',
  `check` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发布的文章是否需要审核',
  `reply_model` varchar(100) NOT NULL DEFAULT '',
  `extend` text COMMENT '扩展设置',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `icon` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类图标',
  `groups` varchar(255) NOT NULL DEFAULT '' COMMENT '分组定义'
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='分类表';

--
-- 转存表中的数据 `sent_category`
--

INSERT INTO `sent_category` (`id`, `name`, `title`, `pid`, `sort`, `list_row`, `meta_title`, `keywords`, `description`, `template_index`, `template_lists`, `template_detail`, `template_edit`, `model`, `model_sub`, `type`, `link_id`, `allow_publish`, `display`, `reply`, `check`, `reply_model`, `extend`, `create_time`, `update_time`, `status`, `icon`, `groups`) VALUES
(1, 'home', '首页banner图', 0, 0, 10, '', '', '', '', '', '', '', '', '2', '2,1', 0, 1, 1, 0, 0, '1', 'null', 1379474947, 1540979560, 1, 0, ''),
(2, 'home', '首页最新活动', 0, 0, 10, '', '', '', '', '', '', '', '2,3', '2', '2,1,3', 0, 1, 1, 0, 1, '1', '', 1379475028, 1540979621, 1, 0, ''),
(3, '', '走进鼎吉', 0, 0, 10, '', '', '', '', '', '', '', '', '', '', 0, 1, 1, 0, 0, '', '', 0, 1541052438, 1, 0, ''),
(8, '', '内页banner图', 0, 1, 10, '', '', '', '', '', '', '', '', '', '', 0, 1, 1, 0, 0, '', NULL, 1540956055, 1540979636, 1, 0, ''),
(9, '', '发现最美鼎吉', 0, 0, 10, '', '', '', '', '', '', '', '', '', '', 0, 1, 1, 0, 0, '', NULL, 1541052462, 1541052462, 1, 0, ''),
(10, '', '教练风采', 0, 0, 10, '', '', '', '', '', '', '', '', '', '', 0, 1, 1, 0, 0, '', NULL, 1541052492, 1541052492, 1, 0, ''),
(11, '', '团队风采', 0, 0, 10, '', '', '', '', '', '', '', '', '', '', 0, 1, 1, 0, 0, '', NULL, 1541052512, 1541052512, 1, 0, ''),
(12, '', '学员风采', 0, 0, 10, '', '', '', '', '', '', '', '', '', '', 0, 1, 1, 0, 0, '', NULL, 1541052524, 1541052524, 1, 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `sent_channel`
--

CREATE TABLE IF NOT EXISTS `sent_channel` (
  `id` int(10) unsigned NOT NULL COMMENT '频道ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级频道ID',
  `title` char(30) NOT NULL COMMENT '频道标题',
  `url` char(100) NOT NULL COMMENT '频道连接',
  `type` int(2) NOT NULL DEFAULT '0' COMMENT '导航类型',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '导航排序',
  `icon` varchar(20) DEFAULT NULL COMMENT '图标',
  `color` varchar(20) DEFAULT NULL COMMENT '导航颜色',
  `band_color` varchar(20) DEFAULT NULL COMMENT '标识点颜色',
  `band_text` varchar(30) DEFAULT NULL COMMENT '标志点文字',
  `active` char(100) NOT NULL DEFAULT '' COMMENT '当前链接',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `target` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '新窗口打开'
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sent_channel`
--

INSERT INTO `sent_channel` (`id`, `pid`, `title`, `url`, `type`, `sort`, `icon`, `color`, `band_color`, `band_text`, `active`, `create_time`, `update_time`, `status`, `target`) VALUES
(1, 0, '网站首页', 'index/index/index', 0, 1, 'home', '', '', '', 'home', 1379475111, 1464490544, 1, 0),
(2, 0, '新闻资讯', 'article/list/1', 0, 1, 'article', '', '', '', 'article', 1379475111, 1464490544, 1, 0),
(21, 0, '学车流程', '', 1, 1, '', '', '', '', 'liucheng', 1540951436, 1540951436, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `sent_code`
--

CREATE TABLE IF NOT EXISTS `sent_code` (
  `id` int(10) unsigned NOT NULL,
  `code` varchar(50) NOT NULL,
  `amount` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态（0:未使用 1:已使用）',
  `coupon_id` int(11) NOT NULL COMMENT '优惠券id'
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='优惠券码';

--
-- 转存表中的数据 `sent_code`
--

INSERT INTO `sent_code` (`id`, `code`, `amount`, `status`, `coupon_id`) VALUES
(1, 'iGPvrOCaRJ', 100, 0, 1),
(2, 'ygLNRJjuQr', 100, 0, 1),
(3, 'RuivkFLsaM', 100, 0, 1),
(4, 'aKwiWcNEbY', 100, 0, 1),
(5, 'gFNiIjyToa', 100, 0, 1),
(6, 'cpCyXwnVWM', 100, 0, 1),
(7, 'CKbPmqFXTo', 100, 0, 1),
(8, 'mOzpjfNuDx', 100, 0, 1),
(9, 'hdQPWLSCVG', 100, 0, 1),
(10, 'zlmZCAtWja', 100, 0, 1),
(11, 'ncCUmtZbgD', 200, 0, 2),
(12, 'mIvaeYqpwX', 200, 0, 2),
(13, 'agxSMzZNhU', 200, 0, 2),
(14, 'FhrwvosKLa', 200, 0, 2),
(15, 'uoKcXZYWsp', 200, 0, 2),
(16, 'xtulnrDUca', 500, 0, 3),
(17, 'OUmsnDIjrZ', 500, 0, 3),
(18, 'ZVelyCcJzR', 200, 0, 4),
(19, 'dMTrQxBiOK', 200, 0, 4),
(20, 'vtGPHLuSNz', 200, 0, 4),
(21, 'vfNwReyQYT', 200, 0, 4),
(22, 'hBeyMXJpgI', 200, 0, 4),
(23, 'kAUNjtdmwe', 200, 0, 4),
(24, 'RUdSeGjLXg', 200, 0, 4),
(25, 'owRpeODkTs', 200, 0, 4),
(26, 'irmcjfKRFq', 200, 0, 4),
(27, 'jcwZaotsmd', 200, 0, 4),
(28, 'sAOdKTNHmB', 300, 0, 5),
(29, 'ZvngIDfUke', 300, 0, 5),
(30, 'ycunDpdbBM', 300, 0, 5),
(31, 'HeWYucfqLn', 300, 0, 5),
(32, 'zoevUKsFDg', 300, 0, 5),
(33, 'gDXsVvPrBL', 200, 0, 6),
(34, 'JjewDktCnR', 200, 0, 6);

-- --------------------------------------------------------

--
-- 表的结构 `sent_config`
--

CREATE TABLE IF NOT EXISTS `sent_config` (
  `id` int(10) unsigned NOT NULL COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` varchar(10) NOT NULL DEFAULT 'text' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '配置说明',
  `icon` varchar(50) NOT NULL DEFAULT '' COMMENT '小图标',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序'
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sent_config`
--

INSERT INTO `sent_config` (`id`, `name`, `type`, `title`, `group`, `extra`, `remark`, `icon`, `create_time`, `update_time`, `status`, `value`, `sort`) VALUES
(1, 'config_group_list', 'textarea', '配置分组', 99, '', '', '', 1447305542, 1452323143, 1, '1:基本\r\n2:会员\r\n3:邮件\r\n4:微信\r\n99:系统', 0),
(2, 'hooks_type', 'textarea', '钩子的类型', 99, '', '类型 1-用于扩展显示内容，2-用于扩展业务处理', '', 1379313397, 1379313407, 1, '1:视图\r\n2:控制器', 6),
(3, 'auth_config', 'textarea', 'Auth配置', 99, '', '自定义Auth.class.php类配置', '', 1379409310, 1379409564, 1, 'AUTH_ON:1\r\nAUTH_TYPE:2', 8),
(5, 'data_backup_path', 'text', '数据库备份根路径', 99, '', '路径必须以 / 结尾', '', 1381482411, 1381482411, 1, './data/backup/', 5),
(6, 'data_backup_part_size', 'text', '数据库备份卷大小', 99, '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', '', 1381482488, 1381729564, 1, '20971520', 7),
(7, 'data_backup_compress', 'bool', '数据库备份文件是否启用压缩', 99, '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', '', 1381713345, 1447306018, 1, '1', 9),
(8, 'data_backup_compress_level', 'select', '数据库备份文件压缩级别', 99, '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', '', 1381713408, 1447305979, 1, '9', 10),
(9, 'develop_mode', 'bool', '开启开发者模式', 99, '0:关闭\r\n1:开启', '是否开启开发者模式', '', 1383105995, 1447305960, 1, '1', 11),
(10, 'allow_visit', 'textarea', '不受限控制器方法', 99, '', '', '', 1386644047, 1438075615, 1, '0:article/draftbox\r\n1:article/mydocument\r\n2:Category/tree\r\n3:Index/verify\r\n4:file/upload\r\n5:file/download\r\n6:user/updatePassword\r\n7:user/updateNickname\r\n8:user/submitPassword\r\n9:user/submitNickname\r\n10:file/uploadpicture', 0),
(11, 'deny_visit', 'textarea', '超管专限控制器方法', 99, '', '仅超级管理员可访问的控制器方法', '', 1386644141, 1438075628, 1, '0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree', 0),
(12, 'admin_allow_ip', 'text', '后台允许访问IP', 99, '', '多个用逗号分隔，如果不配置表示不限制IP访问', '', 1387165454, 1452307198, 1, '', 12),
(13, 'app_debug', 'bool', '是否调试模式', 99, '0:关闭\r\n1:开启', '是否调试模式', '', 1387165685, 1481539829, 1, '0', 6),
(14, 'web_site_title', 'text', '网站标题', 1, '', '网站标题前台显示标题', '', 1378898976, 1379235274, 1, '鼎吉驾校网站管理系统', 0),
(15, 'web_site_url', 'text', '网站URL', 1, '', '网站网址', '', 1378898976, 1379235274, 1, 'http://www.sentcms.me', 1),
(16, 'web_site_description', 'textarea', '网站描述', 1, '', '网站搜索引擎描述', '', 1378898976, 1379235841, 1, '鼎吉驾校网站管理系统', 3),
(17, 'web_site_keyword', 'textarea', '网站关键字', 1, '', '网站搜索引擎关键字', '', 1378898976, 1381390100, 1, '鼎吉驾校网站管理系统', 6),
(18, 'web_site_close', 'bool', '关闭站点', 1, '0:否,1:是', '站点关闭后其他用户不能访问，管理员可以正常访问', '', 1378898976, 1447321395, 1, '0', 4),
(19, 'web_site_icp', 'text', '网站备案号', 1, '', '设置在网站底部显示的备案号，如“赣ICP备13006622号', '', 1378900335, 1379235859, 1, '渝ICP备13006622号', 7),
(20, 'open_mobile_site', 'bool', '开启手机站', 1, '0:关闭\r\n1:开启', '', '', 1440901307, 1440901543, 1, '1', 4),
(21, 'list_rows', 'num', '列表条数', 99, '', '', '', 1448937662, 1448937662, 1, '20', 10),
(22, 'user_allow_register', 'bool', '是否可注册', 2, '1:是\r\n0:否', '', '', 1449043544, 1449043586, 1, '1', 0),
(23, 'user_group_type', 'textarea', '会员分组类别', 2, '', '', '', 1449196835, 1449196835, 1, 'admin:系统管理员\r\nfront:会员等级', 1),
(24, 'config_type_list', 'textarea', '字段类型', 99, '', '', '', 1459136529, 1459136529, 1, 'text:单行文本:varchar\r\nstring:字符串:int\r\npassword:密码:varchar\r\ntextarea:文本框:text\r\nbool:布尔型:int\r\nselect:选择:varchar\r\nnum:数字:int\r\ndecimal:金额:decimal\r\ntags:标签:varchar\r\ndatetime:时间控件:int\r\ndate:日期控件:varchar\r\neditor:编辑器:text\r\nbind:模型绑定:int\r\nimage:图片上传:int\r\nimages:多图上传:varchar\r\nattach:文件上传:varchar', 0),
(25, 'document_position', 'textarea', '文档推荐位', 99, '', '', '', 1453449698, 1453449698, 1, '1:首页推荐\r\n2:列表推荐', 0),
(26, 'mail_host', 'text', 'smtp服务器的名称', 3, '', 'smtp服务器的名称', '', 1455690530, 1455690556, 1, 'smtp.163.com', 0),
(27, 'mail_smtpauth', 'select', '启用smtp认证', 3, '0:否,1:是', '启用smtp认证', '', 1455690641, 1455690689, 1, '1', 0),
(28, 'mail_username', 'text', '邮件发送用户名', 3, '', '邮件发送用户名', '', 1455690771, 1455690771, 1, '你的邮箱账号', 0),
(29, 'mail_password', 'text', '邮箱密码', 3, '', '邮箱密码，如果是qq邮箱，则填安全密码', '', 1455690802, 1455690802, 1, '你的邮箱密码', 0),
(30, 'mail_fromname', 'text', '发件人姓名', 3, '', '发件人姓名', '', 1455690838, 1455690838, 1, '发件人姓名', 0),
(31, 'mail_ishtml', 'select', '是否HTML格式邮件', 3, '0:否,1:是', '是否HTML格式邮件', '', 1455690888, 1455690888, 1, '1', 0),
(32, 'mail_charset', 'text', '邮件编码', 3, '', '设置发送邮件的编码', '', 1455690920, 1455690920, 1, 'UTF8', 0),
(33, 'wechat_name', 'text', '微信名称', 4, '', '填写微信名称', '', 1459136529, 1461898406, 1, '', 0),
(41, 'pc_themes', 'text', 'PC站模板', 0, '', '', '', 1480043043, 1480043043, 1, 'default', 0),
(42, 'mobile_themes', 'text', '手机站模板', 0, '', '', '', 1480043066, 1480043066, 1, 'wap', 0),
(43, 'nav_type_list', 'textarea', '导航分类', 99, '', '', '', 1481539756, 1481539801, 1, '1:顶部\r\n2:底部', 1);

-- --------------------------------------------------------

--
-- 表的结构 `sent_coupon`
--

CREATE TABLE IF NOT EXISTS `sent_coupon` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '名称',
  `code` varchar(50) NOT NULL COMMENT '券码',
  `amount` smallint(6) NOT NULL COMMENT '金额',
  `total` int(11) NOT NULL COMMENT '总张数',
  `use` int(11) NOT NULL COMMENT '已使用张数',
  `online_time` int(11) NOT NULL COMMENT '上线时间',
  `downline_time` int(11) NOT NULL COMMENT '下线时间',
  `number` int(11) NOT NULL COMMENT '报名人数',
  `status` int(11) NOT NULL COMMENT '状态 1:上线 0:下线',
  `school_id` smallint(6) NOT NULL DEFAULT '1' COMMENT '学校ID'
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='优惠券管理';

--
-- 转存表中的数据 `sent_coupon`
--

INSERT INTO `sent_coupon` (`id`, `name`, `code`, `amount`, `total`, `use`, `online_time`, `downline_time`, `number`, `status`, `school_id`) VALUES
(1, '双11优惠券', '', 100, 10, 0, 1541752733, 1542011933, 0, 0, 1),
(2, '双11优惠券', '', 200, 5, 0, 1541752774, 1542011974, 0, 0, 1),
(3, '双11优惠券', '', 500, 2, 0, 1541752814, 1542012014, 0, 0, 1),
(4, '双12优惠券', '', 200, 10, 0, 1542335973, 1543339796, 0, 0, 1),
(5, '测试1', '', 300, 5, 0, 1542612863, 1543545023, 0, 0, 1),
(6, '测试2', '', 200, 2, 0, 1542612891, 1543543251, 0, 0, 2);

-- --------------------------------------------------------

--
-- 表的结构 `sent_department`
--

CREATE TABLE IF NOT EXISTS `sent_department` (
  `id` int(10) unsigned NOT NULL COMMENT '部门ID',
  `title` varchar(50) NOT NULL COMMENT '部门名称',
  `pid` smallint(6) NOT NULL DEFAULT '0' COMMENT '父级ID',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `code` varchar(50) NOT NULL COMMENT '推荐码',
  `phone` varchar(15) NOT NULL COMMENT '电话',
  `number` int(11) NOT NULL COMMENT '招生人数',
  `total` int(11) NOT NULL COMMENT '团队总招生人数',
  `school_id` smallint(6) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='部门表';

--
-- 转存表中的数据 `sent_department`
--

INSERT INTO `sent_department` (`id`, `title`, `pid`, `status`, `remark`, `code`, `phone`, `number`, `total`, `school_id`) VALUES
(1, '团队6', 0, 0, '', '123456', '', 0, 0, 1),
(2, '团队5', 0, 0, '', '', '', 0, 0, 1),
(3, '团队4', 0, 0, '', '', '', 0, 0, 1),
(4, '团队3', 0, 0, '', '', '', 0, 0, 1),
(5, '团队2', 0, 0, '', '', '', 0, 0, 1),
(6, '团队1', 0, 0, '', '', '13594855872', 0, 0, 1),
(7, '团队7', 0, 0, '', '', '13594855872', 0, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `sent_develop`
--

CREATE TABLE IF NOT EXISTS `sent_develop` (
  `id` int(11) unsigned NOT NULL,
  `partner_id` int(11) NOT NULL COMMENT '合伙人或队员ID',
  `student_id` int(11) NOT NULL COMMENT '学员ID',
  `develop_time` int(11) NOT NULL COMMENT '开发时间',
  `process` int(11) NOT NULL COMMENT '最新进度'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='开发记录';

-- --------------------------------------------------------

--
-- 表的结构 `sent_district`
--

CREATE TABLE IF NOT EXISTS `sent_district` (
  `id` mediumint(8) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `level` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `upid` mediumint(8) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=45052 DEFAULT CHARSET=utf8 COMMENT='中国省市区乡镇数据表';

--
-- 转存表中的数据 `sent_district`
--

INSERT INTO `sent_district` (`id`, `name`, `level`, `upid`) VALUES
(1, '北京市', 1, 0),
(2, '天津市', 1, 0),
(3, '河北省', 1, 0),
(4, '山西省', 1, 0),
(5, '内蒙古自治区', 1, 0),
(6, '辽宁省', 1, 0),
(7, '吉林省', 1, 0),
(8, '黑龙江省', 1, 0),
(9, '上海市', 1, 0),
(10, '江苏省', 1, 0),
(11, '浙江省', 1, 0),
(12, '安徽省', 1, 0),
(13, '福建省', 1, 0),
(14, '江西省', 1, 0),
(15, '山东省', 1, 0),
(16, '河南省', 1, 0),
(17, '湖北省', 1, 0),
(18, '湖南省', 1, 0),
(19, '广东省', 1, 0),
(20, '广西壮族自治区', 1, 0),
(21, '海南省', 1, 0),
(22, '重庆市', 1, 0),
(23, '四川省', 1, 0),
(24, '贵州省', 1, 0),
(25, '云南省', 1, 0),
(26, '西藏自治区', 1, 0),
(27, '陕西省', 1, 0),
(28, '甘肃省', 1, 0),
(29, '青海省', 1, 0),
(30, '宁夏回族自治区', 1, 0),
(31, '新疆维吾尔自治区', 1, 0),
(32, '台湾省', 1, 0),
(33, '香港特别行政区', 1, 0),
(34, '澳门特别行政区', 1, 0),
(35, '海外', 1, 0),
(36, '其他', 1, 0),
(37, '东城区', 2, 1),
(38, '西城区', 2, 1),
(39, '崇文区', 2, 1),
(40, '宣武区', 2, 1),
(41, '朝阳区', 2, 1),
(42, '丰台区', 2, 1),
(43, '石景山区', 2, 1),
(44, '海淀区', 2, 1),
(45, '门头沟区', 2, 1),
(46, '房山区', 2, 1),
(47, '通州区', 2, 1),
(48, '顺义区', 2, 1),
(49, '昌平区', 2, 1),
(50, '大兴区', 2, 1),
(51, '怀柔区', 2, 1),
(52, '平谷区', 2, 1),
(53, '密云县', 2, 1),
(54, '延庆县', 2, 1),
(55, '和平区', 2, 2),
(56, '河东区', 2, 2),
(57, '河西区', 2, 2),
(58, '南开区', 2, 2),
(59, '河北区', 2, 2),
(60, '红桥区', 2, 2),
(61, '塘沽区', 2, 2),
(62, '汉沽区', 2, 2),
(63, '大港区', 2, 2),
(64, '东丽区', 2, 2),
(65, '西青区', 2, 2),
(66, '津南区', 2, 2),
(67, '北辰区', 2, 2),
(68, '武清区', 2, 2),
(69, '宝坻区', 2, 2),
(70, '宁河县', 2, 2),
(71, '静海县', 2, 2),
(72, '蓟县', 2, 2),
(73, '石家庄市', 2, 3),
(74, '唐山市', 2, 3),
(75, '秦皇岛市', 2, 3),
(76, '邯郸市', 2, 3),
(77, '邢台市', 2, 3),
(78, '保定市', 2, 3),
(79, '张家口市', 2, 3),
(80, '承德市', 2, 3),
(81, '衡水市', 2, 3),
(82, '廊坊市', 2, 3),
(83, '沧州市', 2, 3),
(84, '太原市', 2, 4),
(85, '大同市', 2, 4),
(86, '阳泉市', 2, 4),
(87, '长治市', 2, 4),
(88, '晋城市', 2, 4),
(89, '朔州市', 2, 4),
(90, '晋中市', 2, 4),
(91, '运城市', 2, 4),
(92, '忻州市', 2, 4),
(93, '临汾市', 2, 4),
(94, '吕梁市', 2, 4),
(95, '呼和浩特市', 2, 5),
(96, '包头市', 2, 5),
(97, '乌海市', 2, 5),
(98, '赤峰市', 2, 5),
(99, '通辽市', 2, 5),
(100, '鄂尔多斯市', 2, 5),
(101, '呼伦贝尔市', 2, 5),
(102, '巴彦淖尔市', 2, 5),
(103, '乌兰察布市', 2, 5),
(104, '兴安盟', 2, 5),
(105, '锡林郭勒盟', 2, 5),
(106, '阿拉善盟', 2, 5),
(107, '沈阳市', 2, 6),
(108, '大连市', 2, 6),
(109, '鞍山市', 2, 6),
(110, '抚顺市', 2, 6),
(111, '本溪市', 2, 6),
(112, '丹东市', 2, 6),
(113, '锦州市', 2, 6),
(114, '营口市', 2, 6),
(115, '阜新市', 2, 6),
(116, '辽阳市', 2, 6),
(117, '盘锦市', 2, 6),
(118, '铁岭市', 2, 6),
(119, '朝阳市', 2, 6),
(120, '葫芦岛市', 2, 6),
(121, '长春市', 2, 7),
(122, '吉林市', 2, 7),
(123, '四平市', 2, 7),
(124, '辽源市', 2, 7),
(125, '通化市', 2, 7),
(126, '白山市', 2, 7),
(127, '松原市', 2, 7),
(128, '白城市', 2, 7),
(129, '延边朝鲜族自治州', 2, 7),
(130, '哈尔滨市', 2, 8),
(131, '齐齐哈尔市', 2, 8),
(132, '鸡西市', 2, 8),
(133, '鹤岗市', 2, 8),
(134, '双鸭山市', 2, 8),
(135, '大庆市', 2, 8),
(136, '伊春市', 2, 8),
(137, '佳木斯市', 2, 8),
(138, '七台河市', 2, 8),
(139, '牡丹江市', 2, 8),
(140, '黑河市', 2, 8),
(141, '绥化市', 2, 8),
(142, '大兴安岭地区', 2, 8),
(143, '黄浦区', 2, 9),
(144, '卢湾区', 2, 9),
(145, '徐汇区', 2, 9),
(146, '长宁区', 2, 9),
(147, '静安区', 2, 9),
(148, '普陀区', 2, 9),
(149, '闸北区', 2, 9),
(150, '虹口区', 2, 9),
(151, '杨浦区', 2, 9),
(152, '闵行区', 2, 9),
(153, '宝山区', 2, 9),
(154, '嘉定区', 2, 9),
(155, '浦东新区', 2, 9),
(156, '金山区', 2, 9),
(157, '松江区', 2, 9),
(158, '青浦区', 2, 9),
(159, '南汇区', 2, 9),
(160, '奉贤区', 2, 9),
(161, '崇明县', 2, 9),
(162, '南京市', 2, 10),
(163, '无锡市', 2, 10),
(164, '徐州市', 2, 10),
(165, '常州市', 2, 10),
(166, '苏州市', 2, 10),
(167, '南通市', 2, 10),
(168, '连云港市', 2, 10),
(169, '淮安市', 2, 10),
(170, '盐城市', 2, 10),
(171, '扬州市', 2, 10),
(172, '镇江市', 2, 10),
(173, '泰州市', 2, 10),
(174, '宿迁市', 2, 10),
(175, '杭州市', 2, 11),
(176, '宁波市', 2, 11),
(177, '温州市', 2, 11),
(178, '嘉兴市', 2, 11),
(179, '湖州市', 2, 11),
(180, '绍兴市', 2, 11),
(181, '舟山市', 2, 11),
(182, '衢州市', 2, 11),
(183, '金华市', 2, 11),
(184, '台州市', 2, 11),
(185, '丽水市', 2, 11),
(186, '合肥市', 2, 12),
(187, '芜湖市', 2, 12),
(188, '蚌埠市', 2, 12),
(189, '淮南市', 2, 12),
(190, '马鞍山市', 2, 12),
(191, '淮北市', 2, 12),
(192, '铜陵市', 2, 12),
(193, '安庆市', 2, 12),
(194, '黄山市', 2, 12),
(195, '滁州市', 2, 12),
(196, '阜阳市', 2, 12),
(197, '宿州市', 2, 12),
(198, '巢湖市', 2, 12),
(199, '六安市', 2, 12),
(200, '亳州市', 2, 12),
(201, '池州市', 2, 12),
(202, '宣城市', 2, 12),
(203, '福州市', 2, 13),
(204, '厦门市', 2, 13),
(205, '莆田市', 2, 13),
(206, '三明市', 2, 13),
(207, '泉州市', 2, 13),
(208, '漳州市', 2, 13),
(209, '南平市', 2, 13),
(210, '龙岩市', 2, 13),
(211, '宁德市', 2, 13),
(212, '南昌市', 2, 14),
(213, '景德镇市', 2, 14),
(214, '萍乡市', 2, 14),
(215, '九江市', 2, 14),
(216, '新余市', 2, 14),
(217, '鹰潭市', 2, 14),
(218, '赣州市', 2, 14),
(219, '吉安市', 2, 14),
(220, '宜春市', 2, 14),
(221, '抚州市', 2, 14),
(222, '上饶市', 2, 14),
(223, '济南市', 2, 15),
(224, '青岛市', 2, 15),
(225, '淄博市', 2, 15),
(226, '枣庄市', 2, 15),
(227, '东营市', 2, 15),
(228, '烟台市', 2, 15),
(229, '潍坊市', 2, 15),
(230, '济宁市', 2, 15),
(231, '泰安市', 2, 15),
(232, '威海市', 2, 15),
(233, '日照市', 2, 15),
(234, '莱芜市', 2, 15),
(235, '临沂市', 2, 15),
(236, '德州市', 2, 15),
(237, '聊城市', 2, 15),
(238, '滨州市', 2, 15),
(239, '菏泽市', 2, 15),
(240, '郑州市', 2, 16),
(241, '开封市', 2, 16),
(242, '洛阳市', 2, 16),
(243, '平顶山市', 2, 16),
(244, '安阳市', 2, 16),
(245, '鹤壁市', 2, 16),
(246, '新乡市', 2, 16),
(247, '焦作市', 2, 16),
(248, '濮阳市', 2, 16),
(249, '许昌市', 2, 16),
(250, '漯河市', 2, 16),
(251, '三门峡市', 2, 16),
(252, '南阳市', 2, 16),
(253, '商丘市', 2, 16),
(254, '信阳市', 2, 16),
(255, '周口市', 2, 16),
(256, '驻马店市', 2, 16),
(257, '济源市', 2, 16),
(258, '武汉市', 2, 17),
(259, '黄石市', 2, 17),
(260, '十堰市', 2, 17),
(261, '宜昌市', 2, 17),
(262, '襄樊市', 2, 17),
(263, '鄂州市', 2, 17),
(264, '荆门市', 2, 17),
(265, '孝感市', 2, 17),
(266, '荆州市', 2, 17),
(267, '黄冈市', 2, 17),
(268, '咸宁市', 2, 17),
(269, '随州市', 2, 17),
(270, '恩施土家族苗族自治州', 2, 17),
(271, '仙桃市', 2, 17),
(272, '潜江市', 2, 17),
(273, '天门市', 2, 17),
(274, '神农架林区', 2, 17),
(275, '长沙市', 2, 18),
(276, '株洲市', 2, 18),
(277, '湘潭市', 2, 18),
(278, '衡阳市', 2, 18),
(279, '邵阳市', 2, 18),
(280, '岳阳市', 2, 18),
(281, '常德市', 2, 18),
(282, '张家界市', 2, 18),
(283, '益阳市', 2, 18),
(284, '郴州市', 2, 18),
(285, '永州市', 2, 18),
(286, '怀化市', 2, 18),
(287, '娄底市', 2, 18),
(288, '湘西土家族苗族自治州', 2, 18),
(289, '广州市', 2, 19),
(290, '韶关市', 2, 19),
(291, '深圳市', 2, 19),
(292, '珠海市', 2, 19),
(293, '汕头市', 2, 19),
(294, '佛山市', 2, 19),
(295, '江门市', 2, 19),
(296, '湛江市', 2, 19),
(297, '茂名市', 2, 19),
(298, '肇庆市', 2, 19),
(299, '惠州市', 2, 19),
(300, '梅州市', 2, 19),
(301, '汕尾市', 2, 19),
(302, '河源市', 2, 19),
(303, '阳江市', 2, 19),
(304, '清远市', 2, 19),
(305, '东莞市', 2, 19),
(306, '中山市', 2, 19),
(307, '潮州市', 2, 19),
(308, '揭阳市', 2, 19),
(309, '云浮市', 2, 19),
(310, '南宁市', 2, 20),
(311, '柳州市', 2, 20),
(312, '桂林市', 2, 20),
(313, '梧州市', 2, 20),
(314, '北海市', 2, 20),
(315, '防城港市', 2, 20),
(316, '钦州市', 2, 20),
(317, '贵港市', 2, 20),
(318, '玉林市', 2, 20),
(319, '百色市', 2, 20),
(320, '贺州市', 2, 20),
(321, '河池市', 2, 20),
(322, '来宾市', 2, 20),
(323, '崇左市', 2, 20),
(324, '海口市', 2, 21),
(325, '三亚市', 2, 21),
(326, '五指山市', 2, 21),
(327, '琼海市', 2, 21),
(328, '儋州市', 2, 21),
(329, '文昌市', 2, 21),
(330, '万宁市', 2, 21),
(331, '东方市', 2, 21),
(332, '定安县', 2, 21),
(333, '屯昌县', 2, 21),
(334, '澄迈县', 2, 21),
(335, '临高县', 2, 21),
(336, '白沙黎族自治县', 2, 21),
(337, '昌江黎族自治县', 2, 21),
(338, '乐东黎族自治县', 2, 21),
(339, '陵水黎族自治县', 2, 21),
(340, '保亭黎族苗族自治县', 2, 21),
(341, '琼中黎族苗族自治县', 2, 21),
(342, '西沙群岛', 2, 21),
(343, '南沙群岛', 2, 21),
(344, '中沙群岛的岛礁及其海域', 2, 21),
(345, '万州区', 2, 22),
(346, '涪陵区', 2, 22),
(347, '渝中区', 2, 22),
(348, '大渡口区', 2, 22),
(349, '江北区', 2, 22),
(350, '沙坪坝区', 2, 22),
(351, '九龙坡区', 2, 22),
(352, '南岸区', 2, 22),
(353, '北碚区', 2, 22),
(354, '双桥区', 2, 22),
(355, '万盛区', 2, 22),
(356, '渝北区', 2, 22),
(357, '巴南区', 2, 22),
(358, '黔江区', 2, 22),
(359, '长寿区', 2, 22),
(360, '綦江县', 2, 22),
(361, '潼南县', 2, 22),
(362, '铜梁县', 2, 22),
(363, '大足县', 2, 22),
(364, '荣昌县', 2, 22),
(365, '璧山县', 2, 22),
(366, '梁平县', 2, 22),
(367, '城口县', 2, 22),
(368, '丰都县', 2, 22),
(369, '垫江县', 2, 22),
(370, '武隆县', 2, 22),
(371, '忠县', 2, 22),
(372, '开县', 2, 22),
(373, '云阳县', 2, 22),
(374, '奉节县', 2, 22),
(375, '巫山县', 2, 22),
(376, '巫溪县', 2, 22),
(377, '石柱土家族自治县', 2, 22),
(378, '秀山土家族苗族自治县', 2, 22),
(379, '酉阳土家族苗族自治县', 2, 22),
(380, '彭水苗族土家族自治县', 2, 22),
(381, '江津市', 2, 22),
(382, '合川市', 2, 22),
(383, '永川市', 2, 22),
(384, '南川市', 2, 22),
(385, '成都市', 2, 23),
(386, '自贡市', 2, 23),
(387, '攀枝花市', 2, 23),
(388, '泸州市', 2, 23),
(389, '德阳市', 2, 23),
(390, '绵阳市', 2, 23),
(391, '广元市', 2, 23),
(392, '遂宁市', 2, 23),
(393, '内江市', 2, 23),
(394, '乐山市', 2, 23),
(395, '南充市', 2, 23),
(396, '眉山市', 2, 23),
(397, '宜宾市', 2, 23),
(398, '广安市', 2, 23),
(399, '达州市', 2, 23),
(400, '雅安市', 2, 23),
(401, '巴中市', 2, 23),
(402, '资阳市', 2, 23),
(403, '阿坝藏族羌族自治州', 2, 23),
(404, '甘孜藏族自治州', 2, 23),
(405, '凉山彝族自治州', 2, 23),
(406, '贵阳市', 2, 24),
(407, '六盘水市', 2, 24),
(408, '遵义市', 2, 24),
(409, '安顺市', 2, 24),
(410, '铜仁地区', 2, 24),
(411, '黔西南布依族苗族自治州', 2, 24),
(412, '毕节地区', 2, 24),
(413, '黔东南苗族侗族自治州', 2, 24),
(414, '黔南布依族苗族自治州', 2, 24),
(415, '昆明市', 2, 25),
(416, '曲靖市', 2, 25),
(417, '玉溪市', 2, 25),
(418, '保山市', 2, 25),
(419, '昭通市', 2, 25),
(420, '丽江市', 2, 25),
(421, '思茅市', 2, 25),
(422, '临沧市', 2, 25),
(423, '楚雄彝族自治州', 2, 25),
(424, '红河哈尼族彝族自治州', 2, 25),
(425, '文山壮族苗族自治州', 2, 25),
(426, '西双版纳傣族自治州', 2, 25),
(427, '大理白族自治州', 2, 25),
(428, '德宏傣族景颇族自治州', 2, 25),
(429, '怒江傈僳族自治州', 2, 25),
(430, '迪庆藏族自治州', 2, 25),
(431, '拉萨市', 2, 26),
(432, '昌都地区', 2, 26),
(433, '山南地区', 2, 26),
(434, '日喀则地区', 2, 26),
(435, '那曲地区', 2, 26),
(436, '阿里地区', 2, 26),
(437, '林芝地区', 2, 26),
(438, '西安市', 2, 27),
(439, '铜川市', 2, 27),
(440, '宝鸡市', 2, 27),
(441, '咸阳市', 2, 27),
(442, '渭南市', 2, 27),
(443, '延安市', 2, 27),
(444, '汉中市', 2, 27),
(445, '榆林市', 2, 27),
(446, '安康市', 2, 27),
(447, '商洛市', 2, 27),
(448, '兰州市', 2, 28),
(449, '嘉峪关市', 2, 28),
(450, '金昌市', 2, 28),
(451, '白银市', 2, 28),
(452, '天水市', 2, 28),
(453, '武威市', 2, 28),
(454, '张掖市', 2, 28),
(455, '平凉市', 2, 28),
(456, '酒泉市', 2, 28),
(457, '庆阳市', 2, 28),
(458, '定西市', 2, 28),
(459, '陇南市', 2, 28),
(460, '临夏回族自治州', 2, 28),
(461, '甘南藏族自治州', 2, 28),
(462, '西宁市', 2, 29),
(463, '海东地区', 2, 29),
(464, '海北藏族自治州', 2, 29),
(465, '黄南藏族自治州', 2, 29),
(466, '海南藏族自治州', 2, 29),
(467, '果洛藏族自治州', 2, 29),
(468, '玉树藏族自治州', 2, 29),
(469, '海西蒙古族藏族自治州', 2, 29),
(470, '银川市', 2, 30),
(471, '石嘴山市', 2, 30),
(472, '吴忠市', 2, 30),
(473, '固原市', 2, 30),
(474, '中卫市', 2, 30),
(475, '乌鲁木齐市', 2, 31),
(476, '克拉玛依市', 2, 31),
(477, '吐鲁番地区', 2, 31),
(478, '哈密地区', 2, 31),
(479, '昌吉回族自治州', 2, 31),
(480, '博尔塔拉蒙古自治州', 2, 31),
(481, '巴音郭楞蒙古自治州', 2, 31),
(482, '阿克苏地区', 2, 31),
(483, '克孜勒苏柯尔克孜自治州', 2, 31),
(484, '喀什地区', 2, 31),
(485, '和田地区', 2, 31),
(486, '伊犁哈萨克自治州', 2, 31),
(487, '塔城地区', 2, 31),
(488, '阿勒泰地区', 2, 31),
(489, '石河子市', 2, 31),
(490, '阿拉尔市', 2, 31),
(491, '图木舒克市', 2, 31),
(492, '五家渠市', 2, 31),
(493, '台北市', 2, 32),
(494, '高雄市', 2, 32),
(495, '基隆市', 2, 32),
(496, '台中市', 2, 32),
(497, '台南市', 2, 32),
(498, '新竹市', 2, 32),
(499, '嘉义市', 2, 32),
(500, '台北县', 2, 32),
(501, '宜兰县', 2, 32),
(502, '桃园县', 2, 32),
(503, '新竹县', 2, 32),
(504, '苗栗县', 2, 32),
(505, '台中县', 2, 32),
(506, '彰化县', 2, 32),
(507, '南投县', 2, 32),
(508, '云林县', 2, 32),
(509, '嘉义县', 2, 32),
(510, '台南县', 2, 32),
(511, '高雄县', 2, 32),
(512, '屏东县', 2, 32),
(513, '澎湖县', 2, 32),
(514, '台东县', 2, 32),
(515, '花莲县', 2, 32),
(516, '中西区', 2, 33),
(517, '东区', 2, 33),
(518, '九龙城区', 2, 33),
(519, '观塘区', 2, 33),
(520, '南区', 2, 33),
(521, '深水埗区', 2, 33),
(522, '黄大仙区', 2, 33),
(523, '湾仔区', 2, 33);

-- --------------------------------------------------------

--
-- 表的结构 `sent_document`
--

CREATE TABLE IF NOT EXISTS `sent_document` (
  `id` int(10) unsigned NOT NULL COMMENT '文档ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `name` char(40) NOT NULL DEFAULT '' COMMENT '标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '标题',
  `category_id` int(10) unsigned NOT NULL COMMENT '所属分类',
  `description` char(140) NOT NULL DEFAULT '' COMMENT '描述',
  `model_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容模型ID',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '推荐位',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `cover_id` int(10) unsigned DEFAULT NULL COMMENT '封面',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '可见性',
  `deadline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '截至时间',
  `attach` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件数量',
  `view` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览量',
  `comment` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '扩展统计字段',
  `level` int(10) NOT NULL DEFAULT '0' COMMENT '优先级',
  `is_top` int(2) NOT NULL DEFAULT '0' COMMENT '是否置顶',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `school_id` smallint(6) NOT NULL DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COMMENT='文档模型基础表';

--
-- 转存表中的数据 `sent_document`
--

INSERT INTO `sent_document` (`id`, `uid`, `name`, `title`, `category_id`, `description`, `model_id`, `position`, `link_id`, `cover_id`, `display`, `deadline`, `attach`, `view`, `comment`, `extend`, `level`, `is_top`, `create_time`, `update_time`, `status`, `school_id`) VALUES
(59, 1, '', '4', 9, '最美鼎吉滚动图', 3, 0, 0, 142, 1, 1542634961, 0, 0, 0, 0, 0, 0, 0, 1542634956, 1, 1),
(17, 1, '', '报名即可参加万人电音节', 2, '', 2, 1, 0, 20, 0, 1541054302, 0, 2, 0, 0, 0, 0, 1541054302, 1541054356, 2, 1),
(60, 1, '', '1', 8, '报名页banner图', 4, 0, 0, 160, 1, 1542635330, 0, 0, 0, 0, 0, 0, 0, 1542635315, 1, 1),
(61, 1, '', '1', 8, '报名页banner图', 4, 0, 0, 161, 1, 1542635339, 0, 0, 0, 0, 0, 0, 0, 1542635333, 1, 1),
(62, 1, '', '2', 8, '报名页banner图', 4, 0, 0, 162, 1, 1542635348, 0, 0, 0, 0, 0, 0, 0, 1542635342, 1, 1),
(52, 1, '', '1', 1, '首页banner图', 4, 0, 0, 128, 1, 1542634791, 0, 0, 0, 0, 0, 0, 0, 1542634777, 1, 1),
(58, 1, '', '3', 9, '最美鼎吉滚动图', 3, 0, 0, 140, 1, 1542634933, 0, 0, 0, 0, 0, 0, 0, 1542634928, 1, 1),
(57, 1, '', '2', 9, '最美鼎吉滚动图', 3, 0, 0, 139, 1, 1542634923, 0, 0, 0, 0, 0, 0, 0, 1542634916, 1, 1),
(56, 1, '', '1', 9, '最美鼎吉滚动图', 3, 0, 0, 138, 1, 1542634911, 0, 0, 0, 0, 0, 0, 0, 1542634906, 1, 1),
(21, 1, '', '走进鼎吉1', 3, '', 3, 1, 0, 68, 0, 1541562483, 0, 0, 0, 0, 0, 0, 1541056368, 1541562483, 1, 1),
(22, 1, '', '走进鼎吉2', 3, '', 3, 1, 0, 165, 0, 0, 0, 0, 0, 0, 0, 0, 1541056794, 1541562483, 1, 1),
(23, 1, '', '走进鼎吉3', 3, '', 3, 1, 0, 133, 0, 1541562483, 0, 0, 0, 0, 0, 0, 1541056819, 1541562483, 1, 1),
(24, 1, '', '走进鼎吉4', 3, '', 3, 1, 0, 134, 0, 0, 0, 0, 0, 0, 0, 0, 1541056839, 1541562483, 1, 1),
(25, 1, '', '走进鼎吉5', 3, '', 3, 1, 0, 135, 0, 1541562483, 0, 0, 0, 0, 0, 0, 1541056867, 1541562483, 1, 1),
(26, 1, '', '教练风采1', 10, '', 3, 1, 0, 143, 0, 1541057950, 0, 0, 0, 0, 0, 0, 1541057950, 1541057969, 1, 1),
(27, 1, '', '教练风采2', 10, '', 3, 1, 0, 144, 0, 1541057974, 0, 0, 0, 0, 0, 0, 1541057974, 1541057988, 1, 1),
(28, 1, '', '教练风采3', 10, '', 3, 1, 0, 145, 0, 1541057992, 0, 0, 0, 0, 0, 0, 1541057992, 1541058007, 1, 1),
(29, 1, '', '教练风采4', 10, '', 3, 1, 0, 146, 0, 1541058012, 0, 0, 0, 0, 0, 0, 1541058012, 1541058042, 1, 1),
(30, 1, '', '教练风采5', 10, '', 3, 1, 0, 147, 0, 1541058058, 0, 0, 0, 0, 0, 0, 1541058058, 1541058075, 1, 1),
(31, 1, '', '团队风采1', 11, '', 3, 1, 0, 170, 0, 1541572048, 0, 0, 0, 0, 0, 0, 1541058400, 1541572048, 1, 1),
(32, 1, '', '团队风采2', 11, '', 3, 1, 0, 150, 0, 0, 0, 0, 0, 0, 0, 0, 1541058426, 1541572048, 1, 1),
(33, 1, '', '团队风采3', 11, '', 3, 1, 0, 151, 0, 1541572048, 0, 0, 0, 0, 0, 0, 1541058446, 1541572048, 1, 1),
(34, 1, '', '团队风采4', 11, '', 3, 1, 0, 152, 0, 0, 0, 0, 0, 0, 0, 0, 1541058469, 1541572048, 1, 1),
(35, 1, '', '团队风采5', 11, '', 3, 1, 0, 153, 0, 1541572048, 0, 0, 0, 0, 0, 0, 1541058495, 1541572048, 1, 1),
(36, 1, '', '学员风采1', 12, '', 3, 1, 0, 154, 0, 1541058524, 0, 0, 0, 0, 0, 0, 1541058524, 1541058538, 1, 1),
(37, 1, '', '学员风采2', 12, '', 3, 1, 0, 155, 0, 1541058542, 0, 0, 0, 0, 0, 0, 1541058542, 1541058555, 1, 1),
(38, 1, '', '学员风采3', 12, '', 3, 1, 0, 156, 0, 1541058564, 0, 0, 0, 0, 0, 0, 1541058564, 1541058577, 1, 1),
(39, 1, '', '学员风采4', 12, '', 3, 1, 0, 157, 0, 1541058581, 0, 0, 0, 0, 0, 0, 1541058581, 1541058598, 1, 1),
(40, 1, '', '学员风采5', 12, '', 3, 1, 0, 158, 0, 1541058602, 0, 0, 0, 0, 0, 0, 1541058602, 1541058615, 1, 1),
(53, 1, '', '2', 1, '首页banner图', 4, 0, 0, 129, 1, 1542634800, 0, 0, 0, 0, 0, 0, 0, 1542634795, 1, 1),
(54, 1, '', '3', 1, '首页banner图', 4, 0, 0, 130, 1, 1542634809, 0, 0, 0, 0, 0, 0, 0, 1542634803, 1, 1),
(55, 1, '', '4', 1, '首页banner图', 4, 0, 0, 131, 1, 1542634818, 0, 0, 0, 0, 0, 0, 0, 1542634812, 1, 1),
(63, 1, '', '4', 9, '最美鼎吉滚动图', 3, 0, 0, 172, 1, 1542636475, 0, 0, 0, 0, 0, 0, 0, 1542636470, 1, 1),
(64, 1, '', '1', 8, '报名页banner图', 4, 0, 0, 173, 1, 1542636687, 0, 0, 0, 0, 0, 0, 0, 1542636617, 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `sent_document_article`
--

CREATE TABLE IF NOT EXISTS `sent_document_article` (
  `doc_id` int(11) unsigned NOT NULL COMMENT '主键',
  `content` text,
  `tags` varchar(20) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文章';

--
-- 转存表中的数据 `sent_document_article`
--

INSERT INTO `sent_document_article` (`doc_id`, `content`, `tags`) VALUES
(2, '<p>我校辅导员赴天津观摩全国辅导员职业技能大赛第一赛区复赛</p>', ''),
(8, '<p>市场陈列</p>', ''),
(17, '<p>报名即可参加万人电音节</p>', '');

-- --------------------------------------------------------

--
-- 表的结构 `sent_document_photo`
--

CREATE TABLE IF NOT EXISTS `sent_document_photo` (
  `doc_id` int(11) unsigned NOT NULL COMMENT '主键',
  `photo_list` varchar(50) DEFAULT NULL COMMENT '111',
  `content` text
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='图片';

--
-- 转存表中的数据 `sent_document_photo`
--

INSERT INTO `sent_document_photo` (`doc_id`, `photo_list`, `content`) VALUES
(5, '', '<p>测试</p>'),
(13, NULL, ''),
(14, NULL, ''),
(15, NULL, ''),
(16, NULL, ''),
(18, NULL, ''),
(19, NULL, ''),
(20, NULL, ''),
(21, NULL, ''),
(22, NULL, ''),
(23, NULL, ''),
(24, NULL, ''),
(25, NULL, ''),
(26, NULL, ''),
(27, NULL, ''),
(28, NULL, ''),
(29, NULL, ''),
(30, NULL, ''),
(31, NULL, ''),
(32, NULL, ''),
(33, NULL, ''),
(34, NULL, ''),
(35, NULL, ''),
(36, NULL, ''),
(37, NULL, ''),
(38, NULL, ''),
(39, NULL, ''),
(40, NULL, '');

-- --------------------------------------------------------

--
-- 表的结构 `sent_feedback`
--

CREATE TABLE IF NOT EXISTS `sent_feedback` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `phone` varchar(15) NOT NULL COMMENT '电话',
  `content` text NOT NULL COMMENT '内容',
  `create_time` int(11) NOT NULL COMMENT '提交时间',
  `status` tinyint(4) NOT NULL COMMENT '状态(0:未处理 1：已处理)',
  `school_id` smallint(6) NOT NULL DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='意见建议';

--
-- 转存表中的数据 `sent_feedback`
--

INSERT INTO `sent_feedback` (`id`, `name`, `phone`, `content`, `create_time`, `status`, `school_id`) VALUES
(1, '何雪莲', '13167876373', '快速报名', 2147483647, 1, 1),
(2, '何雪莲', '13167876373', '快速报名', 2147483647, 0, 1),
(3, '', '', '', 1542095476, 0, 1),
(4, '', '', '报名第三方的手', 1542095796, 0, 1),
(5, '', '', '测试', 1542096170, 0, 1),
(6, '', '', '测试11', 1542096197, 0, 1),
(7, '', '', '测试22', 1542096284, 0, 1),
(8, '', '', '123', 1542096316, 1, 1),
(9, '', '', '456', 1542096420, 1, 1),
(10, '', '', '测试时', 1542096495, 0, 1),
(11, '', '', 'ccc', 1542096682, 0, 1),
(12, '', '', '测试', 1542096907, 0, 1),
(13, '', '', '455555', 1542097011, 0, 1),
(14, '', '', '7567', 1542097070, 0, 1),
(15, '', '', '666', 1542097090, 0, 1),
(16, '', '', '撒艾弗森', 1542097134, 0, 1),
(17, '', '', '8888', 1542097205, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `sent_file`
--

CREATE TABLE IF NOT EXISTS `sent_file` (
  `id` int(10) unsigned NOT NULL COMMENT '文件ID',
  `name` varchar(300) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `savename` varchar(100) NOT NULL DEFAULT '' COMMENT '保存名称',
  `savepath` varchar(100) NOT NULL DEFAULT '' COMMENT '文件保存路径',
  `ext` char(5) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `mime` char(40) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `location` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '文件保存位置',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '远程地址',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文件表';

-- --------------------------------------------------------

--
-- 表的结构 `sent_grade`
--

CREATE TABLE IF NOT EXISTS `sent_grade` (
  `id` int(11) unsigned NOT NULL,
  `version` varchar(50) NOT NULL COMMENT '版本',
  `name` varchar(50) NOT NULL COMMENT '班别名称',
  `type` tinyint(4) NOT NULL COMMENT '车型 1:C1 2:C2',
  `price` decimal(8,2) NOT NULL COMMENT '价格',
  `content` text NOT NULL COMMENT '班别详细',
  `notice` text NOT NULL COMMENT '学车须知',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 0:上线 1:下线',
  `area_id` int(11) NOT NULL COMMENT '所属场地',
  `cid` varchar(20) NOT NULL COMMENT '编号',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='班别管理表';

--
-- 转存表中的数据 `sent_grade`
--

INSERT INTO `sent_grade` (`id`, `version`, `name`, `type`, `price`, `content`, `notice`, `status`, `area_id`, `cid`, `create_time`, `update_time`) VALUES
(1, '181122163443_v0.1', '计时学车全包班', 1, '666.00', '666', '66', 1, 1, '0.1', 1542875683, 1542875683),
(2, '181122163510_v0.2', '计时学车普通班', 1, '555.00', '555', '55', 0, 1, '0.2', 1542875710, 1542875710),
(3, '181122163525_v0.3', '计时学车全包班', 1, '6666.00', '66', '66', 0, 5, '0.3', 1542875725, 1542875725),
(4, '181122163545_v0.4', '计时学车全包班', 1, '888.00', '88', '8', 0, 3, '0.4', 1542875745, 1542875745),
(5, '181122163606_v0.5', '计时学车全包班', 1, '888.00', '8', '8', 0, 2, '0.5', 1542875766, 1542875766),
(6, '181122163627_v0.6', '计时学车全包班', 1, '666.00', '666', '66测试', 0, 1, '0.6', 1542875787, 1542875787),
(7, '181122163646_v0.7', '计时学车全包班', 1, '666.00', '666', '66', 1, 1, '0.7', 1542875806, 1542875806),
(8, '181122163708_v0.8', '计时学车全包班', 1, '666.00', '666', '66侧呃呃呃', 0, 1, '0.8', 1542875828, 1542875828);

-- --------------------------------------------------------

--
-- 表的结构 `sent_hooks`
--

CREATE TABLE IF NOT EXISTS `sent_hooks` (
  `id` int(10) unsigned NOT NULL COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text COMMENT '描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sent_hooks`
--

INSERT INTO `sent_hooks` (`id`, `name`, `description`, `type`, `update_time`, `addons`, `status`) VALUES
(1, 'pageHeader', '页面header钩子，一般用于加载插件CSS文件和代码', 1, 0, '', 1),
(2, 'pageFooter', '页面footer钩子，一般用于加载插件JS文件和JS代码', 1, 0, '', 1),
(3, 'documentEditForm', '添加编辑表单的 扩展内容钩子', 1, 0, '', 1),
(4, 'documentDetailAfter', '文档末尾显示', 1, 0, '', 1),
(5, 'documentDetailBefore', '页面内容前显示用钩子', 1, 0, '', 1),
(6, 'documentSaveComplete', '保存文档数据后的扩展钩子', 2, 0, '', 1),
(7, 'documentEditFormContent', '添加编辑表单的内容显示钩子', 1, 0, '', 1),
(8, 'adminArticleEdit', '后台内容编辑页编辑器', 1, 1378982734, '', 1),
(13, 'AdminIndex', '首页小格子个性化显示', 1, 1382596073, 'Sitestat,Devteam,Systeminfo', 1),
(14, 'topicComment', '评论提交方式扩展钩子。', 1, 1380163518, '', 1),
(16, 'app_begin', '应用开始', 2, 1384481614, '', 1),
(17, 'J_China_City', '每个系统都需要的一个中国省市区三级联动插件。', 1, 1455877345, '', 1);

-- --------------------------------------------------------

--
-- 表的结构 `sent_link`
--

CREATE TABLE IF NOT EXISTS `sent_link` (
  `id` int(5) NOT NULL COMMENT '标识ID',
  `ftype` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:友情链接 1:合作单位',
  `title` varchar(30) NOT NULL DEFAULT '' COMMENT '标题',
  `url` varchar(150) NOT NULL DEFAULT '' COMMENT '链接地址',
  `cover_id` int(11) NOT NULL DEFAULT '0' COMMENT '封面图片ID',
  `descrip` varchar(255) NOT NULL DEFAULT '' COMMENT '备注信息',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `hits` tinyint(7) NOT NULL DEFAULT '0' COMMENT '点击率',
  `update_time` int(10) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `uid` int(7) NOT NULL DEFAULT '0' COMMENT '用户ID ',
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sent_link`
--

INSERT INTO `sent_link` (`id`, `ftype`, `title`, `url`, `cover_id`, `descrip`, `sort`, `hits`, `update_time`, `uid`, `status`) VALUES
(1, 1, '纽腾网络', 'http://www.newteng.net', 0, '', 0, 0, 1495762666, 0, 1),
(21, 1, '111', '#', 5, '', 0, 0, 1540624360, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `sent_member`
--

CREATE TABLE IF NOT EXISTS `sent_member` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(64) NOT NULL DEFAULT '' COMMENT '用户密码',
  `nickname` char(16) NOT NULL DEFAULT '' COMMENT '昵称',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱地址',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `sex` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `qq` char(10) NOT NULL DEFAULT '' COMMENT 'qq号',
  `score` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `signature` text COMMENT '用户签名',
  `pos_province` int(11) DEFAULT '0' COMMENT '用户所在省份',
  `pos_city` int(11) DEFAULT '0' COMMENT '用户所在城市',
  `pos_district` int(11) DEFAULT '0' COMMENT '用户所在县城',
  `pos_community` int(11) DEFAULT '0' COMMENT '用户所在区域',
  `salt` varchar(255) NOT NULL DEFAULT '' COMMENT '密码盐值',
  `login` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员状态',
  `school_id` int(11) NOT NULL COMMENT '所属驾校ID'
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='会员表';

--
-- 转存表中的数据 `sent_member`
--

INSERT INTO `sent_member` (`uid`, `username`, `password`, `nickname`, `email`, `mobile`, `sex`, `birthday`, `qq`, `score`, `signature`, `pos_province`, `pos_city`, `pos_district`, `pos_community`, `salt`, `login`, `reg_ip`, `reg_time`, `last_login_ip`, `last_login_time`, `status`, `school_id`) VALUES
(1, 'admin', '9d98696a650b7bd9c90f057023951aa3', 'admin', 'admin@admin.com', NULL, 0, '0000-00-00', '', 0, NULL, 0, 0, 0, 0, 'nPdbMU', 82, 0, 1489650033, 2002087711, 1543217523, 1, 0),
(7, 'ceshi1', '5974ae0695d1a339c54c9992e2d01d9d', '测试1', NULL, '13594855871', 0, '0000-00-00', '', 0, NULL, 0, 0, 0, 0, 'eJDHFA', 0, 0, 1542446502, 0, 1542446502, 1, 2),
(8, 'ceshi2', 'a8cc6a272a2dd7138ca9bed802c123d6', '测试2', NULL, '13594855872', 0, '0000-00-00', '', 0, NULL, 0, 0, 0, 0, 'GaRsJA', 4, 0, 1542611532, 2002086300, 1542794900, 1, 2),
(9, 'ceshi3', 'f4530d20a0f15bacb09cfd7e3a5cc604', '测试3', NULL, '13594855873', 0, '0000-00-00', '', 0, NULL, 0, 0, 0, 0, 'TVvmXn', 0, 0, 1542611568, 0, 1542611568, 1, 2),
(10, 'ceshi33', 'ebd89507d67f07306bda3ea45bd6d20a', '测试33', NULL, '13594855833', 0, '0000-00-00', '', 0, NULL, 0, 0, 0, 0, 'DrBpti', 1, 0, 1542795019, 2002086300, 1542795052, 1, 2),
(11, 'thinner', 'fd1d1b87891784accf70842c4d6ea5e9', 'thinner', NULL, '15922542385', 0, '0000-00-00', '', 0, NULL, 0, 0, 0, 0, 'vHROrx', 0, 0, 1543043567, 0, 1543043567, 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `sent_member_extend`
--

CREATE TABLE IF NOT EXISTS `sent_member_extend` (
  `uid` int(11) NOT NULL COMMENT '用户UID',
  `education` int(10) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sent_member_extend`
--

INSERT INTO `sent_member_extend` (`uid`, `education`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(11, 0);

-- --------------------------------------------------------

--
-- 表的结构 `sent_member_extend_group`
--

CREATE TABLE IF NOT EXISTS `sent_member_extend_group` (
  `id` int(11) NOT NULL COMMENT '自增主键',
  `name` varchar(50) NOT NULL COMMENT '分组数据表',
  `profile_name` varchar(25) NOT NULL COMMENT '扩展分组名称',
  `createTime` int(11) NOT NULL COMMENT '创建时间',
  `sort` int(11) NOT NULL COMMENT '排序',
  `visiable` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否可见，1可见，0不可见',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '字段状态'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sent_member_extend_group`
--

INSERT INTO `sent_member_extend_group` (`id`, `name`, `profile_name`, `createTime`, `sort`, `visiable`, `status`) VALUES
(1, 'member_extend', '个人资料', 1403847366, 0, 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `sent_member_extend_setting`
--

CREATE TABLE IF NOT EXISTS `sent_member_extend_setting` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '字段注释',
  `length` varchar(100) NOT NULL DEFAULT '' COMMENT '字段定义',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '数据类型',
  `value` varchar(100) NOT NULL DEFAULT '' COMMENT '字段默认值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '参数',
  `is_must` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否必填',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='会员字段表';

--
-- 转存表中的数据 `sent_member_extend_setting`
--

INSERT INTO `sent_member_extend_setting` (`id`, `name`, `title`, `length`, `type`, `value`, `remark`, `is_show`, `extra`, `is_must`, `status`, `update_time`, `create_time`) VALUES
(1, 'education', '学历', '10', 'select', '', '', 1, '1:小学\r\n2:初中\r\n3:高中', 0, 1, 1455930923, 1455930787);

-- --------------------------------------------------------

--
-- 表的结构 `sent_menu`
--

CREATE TABLE IF NOT EXISTS `sent_menu` (
  `id` int(10) unsigned NOT NULL COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `type` varchar(10) NOT NULL DEFAULT 'admin' COMMENT '菜单类别（admin后台，user会员中心）',
  `icon` varchar(20) NOT NULL DEFAULT '' COMMENT '分类图标',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态'
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sent_menu`
--

INSERT INTO `sent_menu` (`id`, `title`, `type`, `icon`, `pid`, `sort`, `url`, `hide`, `tip`, `group`, `is_dev`, `status`) VALUES
(1, '首页', 'admin', 'home', 0, 0, 'admin/index/index', 0, '', '', 0, 0),
(2, '系统', 'admin', 'laptop', 0, 10, 'admin/menu/index', 1, '', '', 0, 0),
(3, '内容', 'admin', 'list', 0, 2, 'admin/category/index', 1, '', '', 0, 0),
(4, '权限管理', 'admin', 'user', 0, 1, 'admin/user/index', 0, '', '', 0, 0),
(5, '物资管理', 'admin', 'th', 0, 2, 'admin/goods/index', 1, '', '', 0, 0),
(6, '其他', 'admin', 'tags', 0, 55, 'admin/menu/index', 0, '', '', 0, 0),
(21, '友链管理', 'admin', 'link', 5, 0, 'admin/link/index', 1, '', '运营管理', 0, 0),
(7, '更新缓存', 'admin', 'refresh', 1, 0, 'admin/index/clear', 0, '', '后台首页', 0, 0),
(8, '配置管理', 'admin', 'cog', 2, 0, 'admin/config/group', 1, '', '系统配置', 0, 0),
(9, '菜单管理', 'admin', 'book', 6, 0, 'admin/menu/index', 0, '', '系统配置', 0, 0),
(10, '导航管理', 'admin', 'map-marker', 6, 0, 'admin/channel/index', 1, '', '系统配置', 0, 0),
(11, '数据备份', 'admin', 'exchange', 2, 0, 'admin/database/index?type=export', 0, '', '数据库管理', 0, 0),
(12, '数据恢复', 'admin', 'table', 2, 0, 'admin/database/index?type=import', 0, '', '数据库管理', 0, 0),
(13, 'SEO设置', 'admin', 'anchor', 2, 0, 'admin/seo/index', 1, '', '优化设置', 0, 0),
(14, '栏目管理', 'admin', 'list-ol', 3, 0, 'admin/category/index', 0, '', '内容配置', 0, 0),
(15, '模型管理', 'admin', 'th-list', 3, 0, 'admin/model/index', 0, '', '内容配置', 0, 0),
(16, '帐号管理', 'admin', 'user', 4, 0, 'admin/user/index', 0, '', '管理员管理', 0, 0),
(17, '角色管理', 'admin', 'users', 4, 0, 'admin/group/index', 0, '', '管理员管理', 0, 0),
(18, '权限管理', 'admin', 'paw', 4, 0, 'admin/group/access', 0, '', '管理员管理', 0, 0),
(19, '行为列表', 'admin', 'file-text', 4, 0, 'admin/action/index', 1, '', '行为管理', 0, 0),
(20, '行为日志', 'admin', 'clipboard', 4, 0, 'admin/action/log', 1, '', '行为管理', 0, 0),
(22, '广告管理', 'admin', 'cc', 6, 0, 'admin/ad/index', 1, '', '系统配置', 0, 0),
(23, '插件列表', 'admin', 'usb', 6, 0, 'admin/addons/index', 1, '', '插件管理', 0, 0),
(24, '钩子列表', 'admin', 'code', 6, 0, 'admin/addons/hooks', 1, '', '插件管理', 0, 0),
(25, '自定义表单', 'admin', 'object-group', 5, 0, 'admin/form/index', 1, '', '运营管理', 0, 0),
(26, '伪静态规则', 'admin', 'magnet', 2, 0, 'admin/seo/rewrite', 1, '', '优化设置', 0, 0),
(27, '主题管理', 'admin', 'heartbeat', 2, 0, 'admin/config/themes', 1, '', '系统配置', 0, 0),
(28, '物料管理', 'admin', '', 5, 0, 'admin/goods/index', 0, '', '物料管理', 0, 0),
(29, '借用记录', 'admin', '', 5, 0, 'admin/borrow/index', 0, '', '借用管理', 0, 0),
(30, '归还记录', 'admin', '', 5, 0, 'admin/borrow/back', 0, '', '借用管理', 0, 0),
(31, '团队列表', 'admin', 'list-ol', 51, 0, 'admin/department/index', 0, '', '团队管理', 0, 0),
(32, '队员列表', 'admin', 'list-ol', 51, 0, 'admin/person/index', 1, '', '队员管理', 0, 0),
(33, '驾校架构', 'admin', 'th', 0, 0, 'admin/area/index', 0, '', '', 0, 0),
(34, '场地列表', 'admin', 'fa fa-list-ol', 33, 0, 'admin/area/index', 0, '', '场地管理', 0, 0),
(35, '活动管理', 'admin', 'book', 0, 0, 'admin/activity/index', 0, '', '', 0, 0),
(36, '班别列表', 'admin', 'fa fa-list-ol', 33, 0, 'admin/grade/index', 0, '', '班别管理', 0, 0),
(37, '运营管理', 'admin', 'fa fa-cloud-upload', 0, 0, 'admin/operate/index', 0, '', '运营管理', 0, 0),
(38, 'banner图', 'admin', 'fa fa-list-ol', 37, 0, 'admin/operate/index', 0, '', '首页', 0, 0),
(39, '走进鼎吉', 'admin', 'fa fa-edit', 37, 0, 'admin/operate/about', 0, '', '首页', 0, 0),
(40, '发现最美鼎吉', 'admin', 'fa fa-edit', 37, 0, 'admin/operate/beautiful', 0, '', '首页', 0, 0),
(41, '教练风采', 'admin', 'fa fa-edit', 37, 0, 'admin/operate/coach', 0, '', '首页', 0, 0),
(42, '团队风采', 'admin', 'fa fa-edit', 37, 0, 'admin/operate/team', 0, '', '首页', 0, 0),
(43, '学员风采', 'admin', 'fa fa-edit', 37, 0, 'admin/operate/student', 0, '', '首页', 0, 0),
(44, '最新活动', 'admin', 'fa fa-edit', 37, 0, 'admin/operate/activity', 0, '', '首页', 0, 0),
(45, 'banner图', 'admin', 'fa fa-list-ol', 37, 0, 'admin/operate/banner', 0, '', '报名', 0, 0),
(46, '学车协议', 'admin', 'fa fa-edit', 37, 0, 'admin/operate/agreement', 0, '', '我的', 0, 0),
(47, '科目一学习预约流程', 'admin', 'fa fa-edit', 37, 0, 'admin/operate/flow', 0, '', '我的', 0, 0),
(48, '约考缴费流程', 'admin', 'fa fa-edit', 37, 0, 'admin/operate/pay', 0, '', '我的', 0, 0),
(49, '学员管理', 'admin', 'fa fa-sign-in', 0, 0, 'admin/student/index', 0, '', '', 0, 0),
(50, '学员列表', 'admin', 'fa fa-list', 49, 0, 'admin/student/index', 0, '', '学员管理', 0, 0),
(51, '团队管理', 'admin', 'fa fa-users', 0, 0, 'admin/department/index', 0, '', '', 0, 0),
(52, '保护系统', 'admin', 'fa fa-key', 0, 0, 'admin/protect/index', 0, '', '', 0, 0),
(53, '体检码', 'admin', 'fa fa-code', 0, 0, 'admin/code/index', 0, '', '', 0, 0),
(54, '合伙人申请', 'admin', 'fa fa-user', 6, 0, 'admin/partner/index', 0, '', '其他', 0, 0),
(55, '学车协议', 'admin', 'fa fa-edit', 6, 0, '', 1, '', '其他', 0, 0),
(56, '意见建议', 'admin', 'fa fa-comment', 6, 0, 'admin/feedback/index', 0, '', '其他', 0, 0),
(57, '活动列表', 'admin', 'fa fa-list', 35, 0, 'admin/activity/index', 0, '', '活动管理', 0, 0),
(58, '优惠券列表', 'admin', 'fa fa-list', 35, 0, 'admin/activity/coupon', 0, '', '优惠券管理', 0, 0),
(59, '资源保护', 'admin', 'fa fa-list', 52, 0, 'admin/protect/index', 0, '', '保护系统', 0, 0),
(60, '开发记录', 'admin', 'fa fa-list', 52, 0, 'admin/protect/develop', 0, '', '保护系统', 0, 0),
(61, '体检码列表', 'admin', 'fa fa-list', 53, 0, 'admin/code/index', 0, '', '体检管理', 0, 0),
(62, '体检机构列表', 'admin', 'fa fa-list', 53, 0, 'admin/code/outfit', 0, '', '体检管理', 0, 0),
(63, '体检申请列表', 'admin', 'fa fa-list', 53, 0, 'admin/code/apply', 0, '', '体检管理', 0, 0),
(64, '学车流程', 'admin', 'fa fa-edit', 37, 0, 'admin/operate/process', 0, '', '报名', 0, 0),
(65, '优势服务', 'admin', 'fa fa-edit', 37, 0, 'admin/operate/service', 0, '', '报名', 0, 0),
(66, '学车保障', 'admin', 'fa fa-edit', 37, 0, 'admin/operate/ensure', 0, '', '报名', 0, 0),
(67, '常见问题', 'admin', 'fa fa-edit', 37, 0, 'admin/operate/question', 0, '', '报名', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `sent_model`
--

CREATE TABLE IF NOT EXISTS `sent_model` (
  `id` int(10) unsigned NOT NULL COMMENT '模型ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '模型标识',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '模型名称',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '继承的模型',
  `icon` varchar(20) NOT NULL COMMENT '模型图标',
  `relation` varchar(30) NOT NULL DEFAULT '' COMMENT '继承与被继承模型的关联字段',
  `is_user_show` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否会员中心显示',
  `need_pk` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '新建表时是否需要主键字段',
  `field_sort` text COMMENT '表单字段排序',
  `field_group` varchar(255) NOT NULL DEFAULT '1:基础' COMMENT '字段分组',
  `field_list` text COMMENT '字段列表',
  `attribute_list` text COMMENT '属性列表（表的字段）',
  `attribute_alias` varchar(255) NOT NULL DEFAULT '' COMMENT '属性别名定义',
  `list_grid` text COMMENT '列表定义',
  `list_row` smallint(2) unsigned NOT NULL DEFAULT '10' COMMENT '列表数据长度',
  `search_key` varchar(50) NOT NULL DEFAULT '' COMMENT '默认搜索字段',
  `search_list` varchar(255) NOT NULL DEFAULT '' COMMENT '高级搜索的字段',
  `template_list` varchar(255) NOT NULL DEFAULT '' COMMENT '列表显示模板',
  `template_add` varchar(255) NOT NULL DEFAULT '' COMMENT '新增模板',
  `template_edit` varchar(255) NOT NULL DEFAULT '' COMMENT '编辑模板',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `engine_type` varchar(25) NOT NULL DEFAULT 'MyISAM' COMMENT '数据库引擎'
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='文档模型表';

--
-- 转存表中的数据 `sent_model`
--

INSERT INTO `sent_model` (`id`, `name`, `title`, `extend`, `icon`, `relation`, `is_user_show`, `need_pk`, `field_sort`, `field_group`, `field_list`, `attribute_list`, `attribute_alias`, `list_grid`, `list_row`, `search_key`, `search_list`, `template_list`, `template_add`, `template_edit`, `create_time`, `update_time`, `status`, `engine_type`) VALUES
(1, 'document', '通用模型', 0, '', '', 1, 1, '{"1":["17","16","19","20","14","13","4","3","2","5","12","11","10"]}', '1:基础,2:扩展', '1,7,8,9,10,2,11,12,13,3,4,14,25,15,5,6,23,22,24', '', '', 'id:ID\r\ntitle:标题\r\nuid:发布人|get_username\r\ncreate_time:创建时间|time_format\r\nupdate_time:更新时间|time_format\r\nstatus:状态|get_content_status', 10, '', '', '', '', '', 1450088499, 1454054412, 1, 'MyISAM'),
(2, 'article', '文章', 1, 'file-word-o', '', 0, 1, '{"1":["3","2","4","25","12","5","24","55"],"2":["11","10","13","19","17","16","14","20"]}', '1:基础,2:扩展', '', '', '', 'id:ID\r\ntitle:标题\r\nuid:发布人|get_username\r\ncreate_time:创建时间|time_format\r\nupdate_time:更新时间|time_format\r\nstatus:状态|get_content_status', 10, '', '', '', '', '', 1453859167, 1467019566, 1, 'MyISAM'),
(3, 'photo', '图片', 1, 'file-image-o', '', 0, 1, '{"1":["3","2","4","12","26","5","27","55"],"2":["11","10","19","13","16","17","14","20"]}', '1:基础,2:扩展', '', '', '', 'id:ID\ntitle:标题\nuid:发布人|get_username\ncreate_time:创建时间|time_format\nupdate_time:更新时间|time_format\nstatus:状态|get_content_status', 10, '', '', '', '', '', 1454052310, 1467019679, 1, 'MyISAM'),
(4, 'page', '单页', 2, 'file-text-o', '', 0, 1, '{"1":["28","55","30","31","32","33"]}', '1:基础', '', '', '', 'id:ID\r\ntitle:标题\r\nupdate_time:更新时间|time_format', 10, '', '', '', '', '', 1456296668, 1470240568, 1, 'MyISAM');

-- --------------------------------------------------------

--
-- 表的结构 `sent_outfit`
--

CREATE TABLE IF NOT EXISTS `sent_outfit` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '名称',
  `address` varchar(100) NOT NULL COMMENT '地址',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态（0:禁用 1:启用）',
  `school_id` smallint(6) NOT NULL DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='体检机构';

--
-- 转存表中的数据 `sent_outfit`
--

INSERT INTO `sent_outfit` (`id`, `name`, `address`, `status`, `school_id`) VALUES
(1, '红十字协会', '红十字协会', 1, 1),
(2, '建设医院', '建设医院', 1, 1),
(3, '陈家桥医院', '陈家桥医院11213', 1, 1),
(4, '红十字北碚', '红十字北碚', 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `sent_page`
--

CREATE TABLE IF NOT EXISTS `sent_page` (
  `id` int(11) unsigned NOT NULL COMMENT '主键',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户uid',
  `title` varchar(200) DEFAULT NULL,
  `model_id` int(11) NOT NULL,
  `cover_id` int(11) DEFAULT '0',
  `content` text,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `school_id` smallint(6) NOT NULL DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='单页';

--
-- 转存表中的数据 `sent_page`
--

INSERT INTO `sent_page` (`id`, `uid`, `title`, `model_id`, `cover_id`, `content`, `create_time`, `update_time`, `school_id`) VALUES
(1, 0, '走进鼎吉', 4, 53, '<p style="text-align: justify;"><img src="/uploads/editor/image/20181121/b8e8482d5205373cbb52a24da9e7c087.jpg" title="20181121/b8e8482d5205373cbb52a24da9e7c087.jpg" alt="b8e8482d5205373cbb52a24da9e7c087.jpg"/></p><p>sdaf asdf asdf asdf asd fasdf asdf&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; wer qwet qwfaaaaaa d发送发斯蒂芬啊阿萨德额&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 高和梵蒂冈啊挨个af asdf asdf asdf asd fasdf asdf&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; wer qwet qwfaaaaaa d发送发斯蒂芬啊阿萨德额&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 高和梵蒂冈啊挨个af asdf asdf asdf asd fasdf asdf&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; wer qwet qwfaaaaaa d发送发斯蒂芬啊阿萨德额&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 高和梵蒂冈啊挨个af asdf asdf asdf asd fasdf asdf&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; wer qwet qwfaaaaaa d发送发斯蒂芬啊阿萨德额&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 高和梵蒂冈啊挨个af asdf asdf asdf asd fasdf asdf&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; wer qwet qwfaaaaaa d发送发斯蒂芬啊阿萨德额&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 高和梵蒂冈啊挨个af asdf asdf asdf asd fasdf asdf&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; wer qwet qwfaaaaaa d发送发斯蒂芬啊阿萨德额&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 高和梵蒂冈啊挨个af asdf asdf asdf asd fasdf asdf&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; wer qwet qwfaaaaaa d发送发斯蒂芬啊阿萨德额&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 高和梵蒂冈啊挨个af asdf asdf asdf asd fasdf asdf&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; wer qwet qwfaaaaaa d发送发斯蒂芬啊阿萨德额&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 高和梵蒂冈啊挨个af asdf asdf asdf asd fasdf asdf&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; wer qwet qwfaaaaaa d发送发斯蒂芬啊阿萨德额&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 高和梵蒂冈啊挨个af asdf asdf asdf asd fasdf asdf&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; wer qwet qwfaaaaaa d发送发斯蒂芬啊阿萨德额&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 高和梵蒂冈啊挨个af asdf asdf asdf asd fasdf asdf&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; wer qwet qwfaaaaaa d发送发斯蒂芬啊阿萨德额&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 高和梵蒂冈啊挨个af asdf asdf asdf asd fasdf asdf&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; wer qwet qwfaaaaaa d发送发斯蒂芬啊阿萨德额&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 高和梵蒂冈啊挨个af asdf asdf asdf asd fasdf asdf&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; wer qwet qwfaaaaaa d发送发斯蒂芬啊阿萨德额&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 高和梵蒂冈啊挨个af asdf asdf asdf asd fasdf asdf&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; wer qwet qwfaaaaaa d发送发斯蒂芬啊阿萨德额&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 高和梵蒂冈啊挨个af asdf asdf asdf asd fasdf asdf&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; wer qwet qwfaaaaaa d发送发斯蒂芬啊阿萨德额&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 高和梵蒂冈啊挨个af asdf asdf asdf asd fasdf asdf&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; wer qwet qwfaaaaaa d发送发斯蒂芬啊阿萨德额&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 高和梵蒂冈啊挨个</p>', 1541572764, 1542730500, 1),
(2, 0, '发现最美鼎吉', 4, 0, '<p>发现最美鼎吉1</p>', 1540951806, 1540977206, 1),
(3, 0, '教练风采', 4, 0, '<p>教练风采</p>', 1540951830, 1542635004, 1),
(4, 0, '团队风采', 4, 0, '<p>团队风采</p>', 1540951849, 1542636417, 1),
(10, 0, '科目一学习预约流程', 4, 0, '<p style="white-space: normal; text-align: center;"><span style="font-size: 24px;">科目一学习方法以及预约流程</span></p><p style="white-space: normal; text-align: center;">西培学堂网址：<span style="text-decoration-line: underline; color: rgb(255, 0, 0);"><a href="http://www.cqxpxt.com/" style="color: rgb(255, 0, 0);">http://www.cqxpxt.com/</a></span></p><p style="white-space: normal; text-align: center;">点击可访问</p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">一、学习方法</p><p style="white-space: normal; text-indent: 2em;">科目一理论学习为6+16模式，前边6个小时需要在西培学堂指定培训点进行面授上课，中途不能离开，并且为人脸识别认证；6个小时学习完毕之后后边16个小时可在网络上边进行学习，也可在课堂进行面授学习</p><p style="white-space: normal; text-indent: 2em;"><br/></p><p style="text-indent: 0em; white-space: normal;">二、预约流程</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503832882696801.png" title="1503832882696801.png" alt="blob.png"/></p><p style="white-space: normal; text-indent: 2em;">请您在首页右上方“用户登录”输入您的身份证号码，初始密码是身份证号码的后6位数字。</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503834101496624.png" title="1503834101496624.png" alt="1503834101496624.png" width="350" height="113"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503832938997982.png" title="1503832938997982.png" alt="1503832938997982.png" width="380" height="1"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503833678767163.png" title="1503833678767163.png" alt="blob.png"/></p><p style="white-space: normal; text-indent: 2em;">如果您是第一次登录，您将直接进入<span style="color: rgb(84, 141, 212);">“面授预约”</span>，首先，请您选择参加面授的地点。选择面授地点后，请选择参加面授的日期、时间、班次、教室。</p><p style="white-space: normal; text-indent: 2em;">如果您参加完6个学时面授培训以后，仍然选择课堂学习，请您点击<span style="color: rgb(84, 141, 212);">“面授预约”</span>，选择参加面授的地点，然后选择参加面授的<span style="color: rgb(84, 141, 212);">日期、时间、班次、教室。</span></p><p style="white-space: normal; text-indent: 2em;">预约面授成功后，系统会发送短信至您的手机。</p><p style="white-space: normal; text-indent: 2em;">您可以点击“课程表下载”，下载查看相关课程安排。<br/><span style="color: rgb(255, 0, 0);">特别提示：</span></p><p style="white-space: normal; text-indent: 2em;"><span style="text-indent: 2em;">1、“网上学习面授班”为参加网络学习前的6个学时的面授培训内容。选择在网络教学平台学习的学员或第一次参加培训的学员请预约“网上学习面授班”班次。</span><br/></p><p style="white-space: normal; text-indent: 2em;">2、如果您已参加完成“网上学习面授班”培训后，仍选择线下课堂学习，请预约“课堂学习面授班”班次。</p><p style="white-space: normal; text-indent: 2em;">3、面授学习均需提前一天预约。</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503834781810896.png" title="1503834781810896.png" alt="1503834781810896.png" width="350" height="214"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503834847892086.png" title="1503834847892086.png" alt="1503834847892086.png" width="350" height="192"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835032173018.png" title="1503835032173018.png" alt="1503835032173018.png" width="350" height="161"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835040362644.png" title="1503835040362644.png" alt="1503835040362644.png" width="350" height="150"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835048839473.png" title="1503835048839473.png" alt="1503835048839473.png" width="350" height="89"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835056316138.png" title="1503835056316138.png" alt="1503835056316138.png" width="350" height="1"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835063956735.png" title="1503835063956735.png" alt="blob.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal; text-indent: 2em;">当您参加满6个学时的面授培训以后，您的手机将收到短信提示，您再次登录后，点击右上方“理论学习” 然后再点击右侧的“点击学习”就能进入教学视频播放界面。</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835249551632.png" title="1503835249551632.png" alt="1503835249551632.png" width="350" height="134"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835268952765.png" title="1503835268952765.png" alt="1503835268952765.png" width="350" height="84"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835286648926.png" title="1503835286648926.png" alt="1503835286648926.png" width="350" height="1"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835314157577.png" title="1503835314157577.png" alt="blob.png"/></p><p style="white-space: normal; text-indent: 2em;"><span style="color: rgb(255, 0, 0);">因学习计时需进行人像验证，在您学习前，请您查看是否正确安装摄像头。</span></p><p style="white-space: normal;"><span style="color: rgb(84, 141, 212);">1、摄像头购买指导：</span></p><p style="text-indent: 0em; white-space: normal;">如果台式电脑未安装摄像头，可以在实体店买或者网上买。<br/>摄像头规格参数：<br/>Usb：2.0接口以上<br/>视像分辨率：640*480<br/>驱动：免驱</p><p style="white-space: normal;"><span style="color: rgb(84, 141, 212);">2、摄像头安装指导：</span><br/>(1)、请将摄像头的USB插口插到您的电脑主机USB接口（如果您长期使用，建议插在主机后面板上面。）</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835488784051.png" title="1503835488784051.png" alt="1503835488784051.png" width="350" height="218"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">(2)、初次使用时，安装如下图。<br/>摄像头插到usb接口弹出的提示：</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835617878608.png" title="1503835617878608.png" alt="1503835617878608.png" width="350" height="82"/></p><p style="white-space: normal;">(3)、安装成功：</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835623404295.png" title="1503835623404295.png" alt="1503835623404295.png" width="350" height="109"/></p><p style="white-space: normal;">(4)、安装成功后，点击右下角的小图标，会显示——可以使用字样。</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835629293128.png" title="1503835629293128.png" alt="1503835629293128.png" width="350" height="211"/></p><p style="white-space: normal;">(5)、最后，调试一下视频设备，看看如何吧！<br/>（注：在Win7中，视频画面需要第三方软件才可以显示，所以我们可以在QQ中来查看设备工作状态，在QQ面板中打开视频调试。）</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835641828020.png" title="1503835641828020.png" alt="1503835641828020.png" width="350" height="414"/></p><p style="white-space: normal;">(6)、切换到视频设置中，等待几秒后你应该会看到视频画面。显示视频设备启动成功，并且可以看到画面。这时，您刷新“理论学习”界面就可以进行视频验证了。</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835648561869.png" title="1503835648561869.png" alt="1503835648561869.png" width="350" height="284"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835679203366.png" title="1503835679203366.png" alt="1503835679203366.png" width="350" height="1"/></p><p style="white-space: normal;"><img width="804" height="1" src="http://ydxc.yooyor.com/ydxc/admin/ueditor/themes/default/images/spacer.gif" alt="http://static.cqxp.cqxpxt.com/img/xxzl/img2.png"/><br/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835668756189.png" title="1503835668756189.png" alt="blob.png"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835686985369.png" title="1503835686985369.png" alt="1503835686985369.png" width="350" height="119"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835691702513.png" title="1503835691702513.png" alt="1503835691702513.png" width="350" height="106"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835695456367.png" title="1503835695456367.png" alt="1503835695456367.png" width="350" height="165"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835701545103.png" title="1503835701545103.png" alt="1503835701545103.png" width="350" height="23"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835708519390.png" title="1503835708519390.png" alt="1503835708519390.png" width="350" height="1"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835712163555.png" title="1503835712163555.png" alt="blob.png"/></p><p style="white-space: normal;">考题练习：在参加科目一考试前，您可以在西培学堂进行考题练习。</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835718233496.png" title="1503835718233496.png" alt="1503835718233496.png" width="350" height="116"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835723321769.png" title="1503835723321769.png" alt="1503835723321769.png" width="350" height="135"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835733536003.png" title="1503835733536003.png" alt="1503835733536003.png" width="350" height="1"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835738281549.png" title="1503835738281549.png" alt="blob.png"/></p><p style="white-space: normal; text-align: center;"><span style="color: rgb(84, 141, 212);">(一）查看学时</span></p><p style="white-space: normal;">您可以在<span style="color: rgb(255, 0, 0);">“理论学习”</span>界面看见自己的学时完成情况<br/>也可以进入<span style="color: rgb(255, 0, 0);">“个人中心”</span>查看自己的学习情况。</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835746603331.png" title="1503835746603331.png" alt="1503835746603331.png" width="350" height="257"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835750379091.png" title="1503835750379091.png" alt="1503835750379091.png" width="350" height="232"/></p><p style="white-space: normal; text-align: center;"><span style="color: rgb(84, 141, 212);">(二）修改，忘记密码</span></p><p style="white-space: normal;">如果需要修改密码，请进入<span style="color: rgb(255, 0, 0);">“个人中心”</span>选择“修改密码”。<br/>如果忘记密码，1、您可以在首页“用户登录”下方点击<span style="color: rgb(255, 0, 0);">“忘记密码”</span>，核对相关信息后，<br/>我们会将您的密码以短信方式发送到您的手机；2、您可以拨打<span style="color: rgb(255, 0, 0);">4001025505</span>客服电话，<br/>客服人员核对相关信息后，将您的密码重置为<span style="color: rgb(255, 0, 0);">初始密码</span>。</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835759999893.png" title="1503835759999893.png" alt="1503835759999893.png" width="350" height="214"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835766985940.png" title="1503835766985940.png" alt="1503835766985940.png" width="350" height="149"/></p><p style="white-space: normal; text-align: center;"><span style="color: rgb(84, 141, 212);">(三）学习疑问或投诉意见</span></p><p style="white-space: normal;">(1)、您可以点击右侧的<span style="color: rgb(255, 0, 0);">“在线提问”</span>通过<span style="color: rgb(255, 0, 0);">“我要提问”</span>将相关问题反馈给我们， 我们将及时给您回复，您可在<span style="color: rgb(255, 0, 0);">“我的提问”</span>中看见回复情况。<br/>(2)、您可以点击右侧的<span style="color: rgb(255, 0, 0);">“联系我们”</span>，教学内容问题可通过“在线教师”与线上教师沟通； 其它问题可通过<span style="color: rgb(255, 0, 0);">“在线客服”</span>或者拨打<span style="color: rgb(255, 0, 0);">400-102-5505</span>客服电话与我们联系，您反馈的问题， 我们将及时给您回复。</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835772479999.png" title="1503835772479999.png" alt="1503835772479999.png" width="350" height="213"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835777271104.png" title="1503835777271104.png" alt="1503835777271104.png" width="350" height="229"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835782885455.png" title="1503835782885455.png" alt="1503835782885455.png" width="350" height="179"/></p><p><br/></p>', 1541556118, 1541556118, 1),
(11, 0, '学车协议', 4, 0, '<p>学车协议123</p>', 1541555774, 1541555774, 1),
(12, 0, '约考缴费流程', 4, 0, '<p style="white-space: normal; text-align: center;"><span style="font-size: 24px;">约考缴费流程</span></p><p style="white-space: normal;">&nbsp;</p><p style="white-space: normal;"><span style="font-size: 18px;">1. 约考流程</span></p><p style="white-space: normal;"><span style="color: rgb(255, 0, 0);">输入约考统一网址:&nbsp;</span><a href="http://cq.122.gov.cn/" target="_blank"><span style="color: rgb(255, 0, 0);">http://cq.122.gov.cn/</span></a><span style="color: rgb(255, 0, 0);">&nbsp;&nbsp;</span>(点击可访问)</p><p style="white-space: normal;">点击个人登录, 登录名为身份证号码,密码为收到的重庆交巡警平台发出六位数字的初始密码(短信接收)</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893237325713.png" title="1503893237325713.png" alt="1503893237325713.png" width="350" height="192"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893243289005.png" title="1503893243289005.png" alt="1503893243289005.png" width="350" height="187"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">如若密码遗失,选择找回密码,填写身份证和姓名并填写验证码重置密码即可</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893261863998.png" title="1503893261863998.png" alt="1503893261863998.png" width="350" height="184"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893265290504.png" title="1503893265290504.png" alt="1503893265290504.png" width="350" height="186"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893269689372.png" title="1503893269689372.png" alt="1503893269689372.png" width="350" height="172"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">1)&nbsp;&nbsp;&nbsp; 点击驾驶证业务</p><p style="white-space: normal;">2)&nbsp;&nbsp;&nbsp; 点击在线办理</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893282115754.png" title="1503893282115754.png" alt="1503893282115754.png" width="350" height="382"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">3)&nbsp;&nbsp;&nbsp; 选择考试科目，点击下一步</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893287615801.png" title="1503893287615801.png" alt="1503893287615801.png" width="350" height="193"/></p><p style="white-space: normal;">&nbsp;</p><p style="white-space: normal;">4)&nbsp;&nbsp;&nbsp; 点击阅读并同意</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893293540965.png" title="1503893293540965.png" alt="1503893293540965.png" width="350" height="338"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">5)&nbsp;&nbsp;&nbsp; 选择考试时间段并选择考场，具体考场和教练员沟通,点击查询</p><p style="white-space: normal;"><br/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893315117034.png" title="1503893315117034.png" alt="1503893315117034.png" width="350" height="119"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">6)&nbsp; 选择考试日和当天考试的场次,具体和驾校和教练员沟通, 这里会提示当天考试总人数和预约人数，可选择场次或更换场次</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893344321345.png" title="1503893344321345.png" alt="1503893344321345.png" width="350" height="336"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">7)&nbsp;&nbsp;&nbsp; 这里先验证当时登录报名填写的手机号码，然后点击提交预约申请信息，约考完毕</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893353327725.png" title="1503893353327725.png" alt="1503893353327725.png" width="350" height="242"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;"><strong><span style="font-size: 20px; color: rgb(255, 0, 0);">2. 缴考试费流程</span></strong></p><p style="white-space: normal;"><strong><span style="font-size: 20px; color: rgb(255, 0, 0);"><br/></span></strong></p><p style="white-space: normal;">输入考试缴费统一网站：<span style="text-decoration-line: underline; color: rgb(255, 0, 0);">http://</span><a href="http://www.ggjfw.com/" style="color: rgb(255, 0, 0);">www.ggjfw.com</a>&nbsp;(点击可访问)（网上缴费不能使用支付宝和微信支付只能使用网银和绑定手机号码的银行卡）</p><p style="white-space: normal;">1)&nbsp;&nbsp;&nbsp; 选择重庆</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893364372087.png" title="1503893364372087.png" alt="1503893364372087.png" width="350" height="305"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">2)&nbsp;&nbsp;&nbsp; 选择车管所网上缴费平台</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893374122230.png" title="1503893374122230.png" alt="1503893374122230.png" width="350" height="196"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">3)&nbsp;&nbsp;&nbsp; 选择驾管业务网上缴费</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893379927407.png" title="1503893379927407.png" alt="1503893379927407.png" width="350" height="275"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">4)&nbsp;&nbsp;&nbsp; 完善个人信息之后点击申请查询（注意不要点击申请缴费）</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893384365248.png" title="1503893384365248.png" alt="1503893384365248.png" width="350" height="289"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">5)&nbsp;&nbsp;&nbsp; 如没有缴费记录则点击申请缴费</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893389241078.png" title="1503893389241078.png" alt="1503893389241078.png" width="350" height="122"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">6)&nbsp;&nbsp;&nbsp; 点击同意</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893396515147.png" title="1503893396515147.png" alt="1503893396515147.png" width="350" height="256"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">7)&nbsp;&nbsp;&nbsp; 先选择科目考试，然后选择考试科目，比如科目一科目二，然后提交订单</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893404963275.png" title="1503893404963275.png" alt="1503893404963275.png" width="350" height="258"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">8)&nbsp;&nbsp;&nbsp; 核对信息无误之后点击确认并缴费</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893412539437.png" title="1503893412539437.png" alt="1503893412539437.png" width="350" height="257"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">9)&nbsp;&nbsp;&nbsp; 输入网银所绑定的手机号码并填写手机验证码</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893419839356.png" title="1503893419839356.png" alt="1503893419839356.png" width="350" height="227"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">10)&nbsp;&nbsp;&nbsp;&nbsp; 核对无误之后点击下一步</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893426695615.png" title="1503893426695615.png" alt="1503893426695615.png" width="350" height="172"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">11)&nbsp;&nbsp;&nbsp;&nbsp; 点击去付款</p><p style="white-space: normal;">&nbsp;</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893431279173.png" title="1503893431279173.png" alt="1503893431279173.png" width="350" height="232"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">12)&nbsp;&nbsp;&nbsp;&nbsp; 输入银行卡号之后点击下一步</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893436913596.png" title="1503893436913596.png" alt="1503893436913596.png" width="350" height="226"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">13)&nbsp;&nbsp;&nbsp;&nbsp; 完善信息之后点击付款</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893440580978.png" title="1503893440580978.png" alt="1503893440580978.png" width="350" height="223"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">14)&nbsp;&nbsp;&nbsp;&nbsp; 缴费完毕，点击返回商户可检查缴费信息</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893447805722.png" title="1503893447805722.png" alt="1503893447805722.png" width="350" height="237"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">15)&nbsp;&nbsp;&nbsp;&nbsp; 付款成功回执信息</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893457415224.png" title="1503893457415224.png" alt="1503893457415224.png" width="350" height="166"/></p><p><br/></p>', 1541556314, 1541556314, 1),
(5, 0, '学员风采', 4, 0, '<p>学员风采</p>', 1540971904, 1542635059, 1),
(6, 0, '学车流程', 4, 0, '<p>学车流程09</p>', 1541555840, 1541555840, 1),
(7, 0, '优势服务', 4, 0, '<p>优势服务90</p>', 1541555832, 1541555832, 1),
(8, 0, '学车保障', 4, 0, '<p>学车保障789</p>', 1541555824, 1541555824, 1),
(9, 0, '常见问题', 4, 0, '<p>常见问题456</p>', 1541555815, 1541555815, 1),
(13, 0, '报名即可参加万人电音节', 4, 169, '<p>最新活动11</p>', 0, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `sent_partner`
--

CREATE TABLE IF NOT EXISTS `sent_partner` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `phone` varchar(15) NOT NULL COMMENT '电话',
  `school` varchar(50) NOT NULL COMMENT '学校',
  `create_time` int(11) NOT NULL COMMENT '申请时间',
  `school_id` smallint(6) NOT NULL DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='合伙人申请列表';

--
-- 转存表中的数据 `sent_partner`
--

INSERT INTO `sent_partner` (`id`, `name`, `phone`, `school`, `create_time`, `school_id`) VALUES
(1, '刘恩瑞', '18315067756', '重庆电子工程职业学院', 1540978129, 1);

-- --------------------------------------------------------

--
-- 表的结构 `sent_person`
--

CREATE TABLE IF NOT EXISTS `sent_person` (
  `id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '姓名',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱地址',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `sex` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '性别 0:男  1：女',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `qq` char(10) NOT NULL DEFAULT '' COMMENT 'qq号',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '用户状态',
  `department_id` int(11) NOT NULL COMMENT '团队ID',
  `code` varchar(50) NOT NULL COMMENT '推荐码',
  `number` int(11) NOT NULL COMMENT '招生人数'
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='人员信息表';

--
-- 转存表中的数据 `sent_person`
--

INSERT INTO `sent_person` (`id`, `username`, `email`, `mobile`, `sex`, `birthday`, `qq`, `create_time`, `status`, `department_id`, `code`, `number`) VALUES
(3, '张三', 'zhangsan@163.com', '123456789101', 0, '0000-00-00', '123456789', 1234567899, 0, 5, '', 0),
(4, '李四', 'lisi@163.com', '12345678910', 0, '0000-00-00', '', 1234567898, 0, 4, '', 0),
(5, '测试', '12312@qq.com', '13594855870', 1, '2017-06-14', '1234567', 1497495094, 0, 6, '', 0),
(6, '测试1', '12312@qq.com', '13594855872', 1, '2017-06-15', '123456', 1497496596, 0, 1, '', 0),
(7, '王武', '12312@qq.com', '13594855872', 0, '2017-06-15', '1231321', 1497497805, 0, 6, '', 0),
(8, '李三', 'vip@qq.comn', '13594855872', 0, '2017-06-15', '123', 1497498007, 0, 2, '', 0),
(9, '科科', '123复古风格@qq.com', '13335481125', 0, '1994-10-24', 'vip.qqcon', 1498804024, 0, 3, '', 0),
(10, '测试', NULL, '13594855', 0, '0000-00-00', '', 1541474164, 0, 7, '12345678', 0);

-- --------------------------------------------------------

--
-- 表的结构 `sent_picture`
--

CREATE TABLE IF NOT EXISTS `sent_picture` (
  `id` int(10) unsigned NOT NULL COMMENT '主键id自增',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间'
) ENGINE=MyISAM AUTO_INCREMENT=179 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sent_picture`
--

INSERT INTO `sent_picture` (`id`, `path`, `url`, `md5`, `sha1`, `status`, `create_time`) VALUES
(1, '/uploads/picture/20181027/46410896ba08afa4edff44e3006ab269.jpg', '/uploads/picture/20181027/46410896ba08afa4edff44e3006ab269.jpg', '792cacc4ff08190f05d1ce407f909b73', 'e95c55dbe0cc6ecea1399a2a1789ef9dc1bf5738', 1, 1540623038),
(2, '/uploads/picture/20181027/6534bea3bb61c960125f2cb3a8894854.jpg', '/uploads/picture/20181027/6534bea3bb61c960125f2cb3a8894854.jpg', '792cacc4ff08190f05d1ce407f909b73', 'e95c55dbe0cc6ecea1399a2a1789ef9dc1bf5738', 1, 1540623531),
(3, '/uploads/picture/20181027/9b718f4515a387e41165e4d59681eaf6.jpg', '/uploads/picture/20181027/9b718f4515a387e41165e4d59681eaf6.jpg', '5e5a249fb2b30c1ca4ab0f976984807d', '154188a9f984d8b03c1c8f04905e9d2f6d191499', 1, 1540623921),
(4, '/uploads/picture/20181027/e08160f93aea1da65692c5c1cf75ec3a.jpg', '/uploads/picture/20181027/e08160f93aea1da65692c5c1cf75ec3a.jpg', '792cacc4ff08190f05d1ce407f909b73', 'e95c55dbe0cc6ecea1399a2a1789ef9dc1bf5738', 1, 1540624150),
(5, '/uploads/picture/20181027/e608f82bb1fc064d4a6dabc5cbfaaae5.jpg', '/uploads/picture/20181027/e608f82bb1fc064d4a6dabc5cbfaaae5.jpg', '5e5a249fb2b30c1ca4ab0f976984807d', '154188a9f984d8b03c1c8f04905e9d2f6d191499', 1, 1540624356),
(6, '/uploads/picture/20181027/68800dd3185988e139daf811b13ce541.jpg', '/uploads/picture/20181027/68800dd3185988e139daf811b13ce541.jpg', '427e85657152e91c1c204d910d6ffc3d', 'd4f75227118770de1d9293164313b3ecff3b2a26', 1, 1540626061),
(7, '/uploads/picture/20181029/1debbd01f22d2bdee2e115943f873632.jpg', '/uploads/picture/20181029/1debbd01f22d2bdee2e115943f873632.jpg', 'a427c52f06864f67653045a7c0959e9e', '943d47b7f63a94c77ba01a26eac8fed12a4389f2', 1, 1540784807),
(8, '/uploads/picture/20181029/3a904bc011f5848b032f9e521953880c.jpg', '/uploads/picture/20181029/3a904bc011f5848b032f9e521953880c.jpg', 'a427c52f06864f67653045a7c0959e9e', '943d47b7f63a94c77ba01a26eac8fed12a4389f2', 1, 1540793569),
(9, '/uploads/picture/20181029/de4cd51bb22e82e9e46da5040ea8ad3e.jpg', '/uploads/picture/20181029/de4cd51bb22e82e9e46da5040ea8ad3e.jpg', '0cea57d45f8b4c3b0b441206a1ba0cd5', '22cff99e201d21b82343cd808f8a1780b12cd335', 1, 1540796862),
(10, '/uploads/picture/20181029/d3916af77bd87cdefbf599fbca817868.jpg', '/uploads/picture/20181029/d3916af77bd87cdefbf599fbca817868.jpg', '0cea57d45f8b4c3b0b441206a1ba0cd5', '22cff99e201d21b82343cd808f8a1780b12cd335', 1, 1540796971),
(11, '/uploads/picture/20181029/0d7e6cf80bc763c39caa5df0cce45a22.jpg', '/uploads/picture/20181029/0d7e6cf80bc763c39caa5df0cce45a22.jpg', '854fe0855aea836f987c961304a0794e', '312740a5b975506b2b4625a0a56def86025145d4', 1, 1540797018),
(12, '/uploads/picture/20181029/2fcdb1b27a02eb6e273abb949488a110.jpg', '/uploads/picture/20181029/2fcdb1b27a02eb6e273abb949488a110.jpg', '854fe0855aea836f987c961304a0794e', '312740a5b975506b2b4625a0a56def86025145d4', 1, 1540797056),
(13, '/uploads/picture/20181029/a0d84218817cb599a4db450cbc1d9883.jpg', '/uploads/picture/20181029/a0d84218817cb599a4db450cbc1d9883.jpg', '854fe0855aea836f987c961304a0794e', '312740a5b975506b2b4625a0a56def86025145d4', 1, 1540797094),
(14, '/uploads/picture/20181029/cebb82837f3e43aef8419e2f2a8dd5d9.jpg', '/uploads/picture/20181029/cebb82837f3e43aef8419e2f2a8dd5d9.jpg', '435e0690dce3cfbea1cd058c0a500c76', '70c43203e9efcdf17017498f85120f3b6b4532fa', 1, 1540797420),
(15, '/uploads/picture/20181101/ffb29ece8c9f295d3a20f8ff90600174.jpg', '/uploads/picture/20181101/ffb29ece8c9f295d3a20f8ff90600174.jpg', '11d451c17ff0473fb386f52d1a4dec8f', '6a1bfa949fa5d565e1d543089ad22658feeabd77', 1, 1541052784),
(16, '/uploads/picture/20181101/ddf8cc338148f45123e6fb8a6dab09e7.jpg', '/uploads/picture/20181101/ddf8cc338148f45123e6fb8a6dab09e7.jpg', '4dcdf5d2d582db793e84e0b2d6f7413b', 'acfd736c60b79e664402307c99d6d9994afa212a', 1, 1541052822),
(17, '/uploads/picture/20181101/2eafe39e6d9ba80847ec374abb8fb74a.jpg', '/uploads/picture/20181101/2eafe39e6d9ba80847ec374abb8fb74a.jpg', '41ea150d2401b063cd80bf94c3b43987', 'd77b73391b3b9851c0e8c104eff3cf25ec2270f5', 1, 1541053633),
(18, '/uploads/picture/20181101/50d37c38fb8ee89feb22d534e451bd7d.jpg', '/uploads/picture/20181101/50d37c38fb8ee89feb22d534e451bd7d.jpg', '431587ad022a32fed1e3548648ab0e77', '000274b5fbb5f8b9604801bdd98be5f5c7176ac3', 1, 1541053735),
(19, '/uploads/picture/20181101/dd7908ec86ab9afce3cc46e0c7c51271.jpg', '/uploads/picture/20181101/dd7908ec86ab9afce3cc46e0c7c51271.jpg', '82b74bd1d43db582ac83cba9d29f942c', 'd4ba4969d883fab36f47c8a5a12876dd171f60ad', 1, 1541053769),
(20, '/uploads/picture/20181101/ee43eaf1e3b0f11e243d533a2f42a7a4.jpg', '/uploads/picture/20181101/ee43eaf1e3b0f11e243d533a2f42a7a4.jpg', '938d16012938b28f49eb33cebfb8ae20', 'e788d5b12a3a1bb5d96f4e4aa882e1bb06748b6e', 1, 1541054333),
(21, '/uploads/picture/20181101/1fc0bd7a9839651ff61963479f2397ee.jpg', '/uploads/picture/20181101/1fc0bd7a9839651ff61963479f2397ee.jpg', '0cea57d45f8b4c3b0b441206a1ba0cd5', '22cff99e201d21b82343cd808f8a1780b12cd335', 1, 1541055156),
(22, '/uploads/picture/20181101/462a8ce969172afd0281fea7d41f026a.jpg', '/uploads/picture/20181101/462a8ce969172afd0281fea7d41f026a.jpg', '435e0690dce3cfbea1cd058c0a500c76', '70c43203e9efcdf17017498f85120f3b6b4532fa', 1, 1541055186),
(23, '/uploads/picture/20181101/550e7e8573988394d46240cc6150f26f.jpg', '/uploads/picture/20181101/550e7e8573988394d46240cc6150f26f.jpg', '854fe0855aea836f987c961304a0794e', '312740a5b975506b2b4625a0a56def86025145d4', 1, 1541055217),
(24, '/uploads/picture/20181101/fbe9b3805b16922caf5560c325ef9fbc.jpg', '/uploads/picture/20181101/fbe9b3805b16922caf5560c325ef9fbc.jpg', 'b1abb390d812ccb108f0560473443e81', '60fd77fe63f3ce4d208360b9d2715294ca389992', 1, 1541056786),
(25, '/uploads/picture/20181101/cc1c683fa4c3ec48ec22b248d82753bb.jpg', '/uploads/picture/20181101/cc1c683fa4c3ec48ec22b248d82753bb.jpg', '41ea150d2401b063cd80bf94c3b43987', 'd77b73391b3b9851c0e8c104eff3cf25ec2270f5', 1, 1541056811),
(26, '/uploads/picture/20181101/7bd93bd1117424cfa66e710aed5bdccd.jpg', '/uploads/picture/20181101/7bd93bd1117424cfa66e710aed5bdccd.jpg', '672b205b3372bd231f0121961f28927a', '4ed1519032233de8f211dccd30cd4c0ca4438e8f', 1, 1541056831),
(27, '/uploads/picture/20181101/86884f1a825a5cfe1f590005c1c65843.jpg', '/uploads/picture/20181101/86884f1a825a5cfe1f590005c1c65843.jpg', '8524c52aac04d60165d42780a7911f1a', 'a42bcb9c27001150104a3a248b34689633fa9e48', 1, 1541056858),
(28, '/uploads/picture/20181101/17121a222842c89ba0f254be4c248847.jpg', '/uploads/picture/20181101/17121a222842c89ba0f254be4c248847.jpg', '81c44de8083ee386a7b58f19ae14d72e', 'd763b05895968cb0a5263f19fdd4461a31c42404', 1, 1541056886),
(29, '/uploads/picture/20181101/02ee3740d97a6c37da776b3faeb3af4e.jpg', '/uploads/picture/20181101/02ee3740d97a6c37da776b3faeb3af4e.jpg', 'b1abb390d812ccb108f0560473443e81', '60fd77fe63f3ce4d208360b9d2715294ca389992', 1, 1541057966),
(30, '/uploads/picture/20181101/a389e05237a937a798bece2754c46450.jpg', '/uploads/picture/20181101/a389e05237a937a798bece2754c46450.jpg', '431587ad022a32fed1e3548648ab0e77', '000274b5fbb5f8b9604801bdd98be5f5c7176ac3', 1, 1541057985),
(31, '/uploads/picture/20181101/39b5bc79065b021fb149b72bee8268ba.jpg', '/uploads/picture/20181101/39b5bc79065b021fb149b72bee8268ba.jpg', 'c4e451e04735bc2250778fd9844efd36', '8d8b223273ad138c760318da7711a9da8b3765a0', 1, 1541058005),
(32, '/uploads/picture/20181101/93d1abe1ccfbd71b91cb60f987e713c7.jpg', '/uploads/picture/20181101/93d1abe1ccfbd71b91cb60f987e713c7.jpg', '427e85657152e91c1c204d910d6ffc3d', 'd4f75227118770de1d9293164313b3ecff3b2a26', 1, 1541058040),
(33, '/uploads/picture/20181101/65c5090de3d423ca76c646a04f852baf.gif', '/uploads/picture/20181101/65c5090de3d423ca76c646a04f852baf.gif', 'dd36172c70e4128895b7d11f26c8492d', '7d140ceb4739aa991f471b7935116ceec774f5ef', 1, 1541058072),
(34, '/uploads/picture/20181101/e5348752a8fd18e1ea1f20f8556e91ce.jpg', '/uploads/picture/20181101/e5348752a8fd18e1ea1f20f8556e91ce.jpg', '0cea57d45f8b4c3b0b441206a1ba0cd5', '22cff99e201d21b82343cd808f8a1780b12cd335', 1, 1541058419),
(35, '/uploads/picture/20181101/55ea3c76939c101ba1bc0e73dc862afc.jpg', '/uploads/picture/20181101/55ea3c76939c101ba1bc0e73dc862afc.jpg', '435e0690dce3cfbea1cd058c0a500c76', '70c43203e9efcdf17017498f85120f3b6b4532fa', 1, 1541058440),
(36, '/uploads/picture/20181101/ed1af2c84600619b14806729844eafb1.jpg', '/uploads/picture/20181101/ed1af2c84600619b14806729844eafb1.jpg', 'a427c52f06864f67653045a7c0959e9e', '943d47b7f63a94c77ba01a26eac8fed12a4389f2', 1, 1541058462),
(37, '/uploads/picture/20181101/18123a9beffcda2bbe27666bedad8044.jpg', '/uploads/picture/20181101/18123a9beffcda2bbe27666bedad8044.jpg', '854fe0855aea836f987c961304a0794e', '312740a5b975506b2b4625a0a56def86025145d4', 1, 1541058487),
(38, '/uploads/picture/20181101/dfe6ec9f0319c2a0a1afbd07b536f965.jpg', '/uploads/picture/20181101/dfe6ec9f0319c2a0a1afbd07b536f965.jpg', '672b205b3372bd231f0121961f28927a', '4ed1519032233de8f211dccd30cd4c0ca4438e8f', 1, 1541058506),
(39, '/uploads/picture/20181101/8e2139011407830106a967ea0e2f1b32.jpg', '/uploads/picture/20181101/8e2139011407830106a967ea0e2f1b32.jpg', '431587ad022a32fed1e3548648ab0e77', '000274b5fbb5f8b9604801bdd98be5f5c7176ac3', 1, 1541058535),
(40, '/uploads/picture/20181101/e5fe6e4b311bc2b00503852aec0fac1c.jpg', '/uploads/picture/20181101/e5fe6e4b311bc2b00503852aec0fac1c.jpg', '322dbdb91fea1678332b024008679ab4', '9d9fbf30a7052f3c33ed75e46da0a56e221a9a9b', 1, 1541058552),
(41, '/uploads/picture/20181101/7a41e9a258d6411d0cc563515a55513e.jpg', '/uploads/picture/20181101/7a41e9a258d6411d0cc563515a55513e.jpg', '82b74bd1d43db582ac83cba9d29f942c', 'd4ba4969d883fab36f47c8a5a12876dd171f60ad', 1, 1541058574),
(42, '/uploads/picture/20181101/775d96ea7e4e350aa817935bbdefdaf0.jpg', '/uploads/picture/20181101/775d96ea7e4e350aa817935bbdefdaf0.jpg', '435e0690dce3cfbea1cd058c0a500c76', '70c43203e9efcdf17017498f85120f3b6b4532fa', 1, 1541058596),
(43, '/uploads/picture/20181101/3884875da2679add18bb40bc612b918f.jpg', '/uploads/picture/20181101/3884875da2679add18bb40bc612b918f.jpg', '0cea57d45f8b4c3b0b441206a1ba0cd5', '22cff99e201d21b82343cd808f8a1780b12cd335', 1, 1541058613),
(44, '/uploads/picture/20181102/0a38b56729bb8c56855d3a851995ce83.gif', '/uploads/picture/20181102/0a38b56729bb8c56855d3a851995ce83.gif', '507352090ac4fc581a240dc71eb1eed6', '9b4f0b2a8695619d85c1b0e4747752ca50f6ca7d', 1, 1541127733),
(45, '/uploads/picture/20181106/1ab5fa412bf169d6aa5811ededcd7bb2.jpg', '/uploads/picture/20181106/1ab5fa412bf169d6aa5811ededcd7bb2.jpg', '90b40abdd3dc243308f37a2e3b33160e', '816d5fc3d13f87f7cdf9ad81cd71ca2cd1cf2ded', 1, 1541487204),
(46, '/uploads/picture/20181106/c8fef2a6a73140d1fc9a323b2f58a484.jpg', '/uploads/picture/20181106/c8fef2a6a73140d1fc9a323b2f58a484.jpg', '90b40abdd3dc243308f37a2e3b33160e', '816d5fc3d13f87f7cdf9ad81cd71ca2cd1cf2ded', 1, 1541487227),
(47, '/uploads/picture/20181106/56ba730ce4beddf2ba58f5b553dc3237.jpg', '/uploads/picture/20181106/56ba730ce4beddf2ba58f5b553dc3237.jpg', 'ea98e490f5402eba68d2e21563cef50d', '8a912f62811a39ff963c54eb28b8d6e887ee786d', 1, 1541490518),
(48, '/uploads/picture/20181106/a0f2fbf5a94a3974713d3a4182c3e16f.jpg', '/uploads/picture/20181106/a0f2fbf5a94a3974713d3a4182c3e16f.jpg', '082e5dacdf065e5fb2f517ad4c4431e7', '8ce3a17e3c642ed948cae99260ad373c0f91d75c', 1, 1541490765),
(49, '/uploads/picture/20181106/053af52a87b80cd2cc4e77658fe719a8.jpg', '/uploads/picture/20181106/053af52a87b80cd2cc4e77658fe719a8.jpg', '082e5dacdf065e5fb2f517ad4c4431e7', '8ce3a17e3c642ed948cae99260ad373c0f91d75c', 1, 1541490840),
(50, '/uploads/picture/20181106/4461a1db4c9f6554fa8e99374914bca8.jpg', '/uploads/picture/20181106/4461a1db4c9f6554fa8e99374914bca8.jpg', '082e5dacdf065e5fb2f517ad4c4431e7', '8ce3a17e3c642ed948cae99260ad373c0f91d75c', 1, 1541490890),
(51, '/uploads/picture/20181106/9664a6f3632005d7bc70034b316ba932.jpg', '/uploads/picture/20181106/9664a6f3632005d7bc70034b316ba932.jpg', '792cacc4ff08190f05d1ce407f909b73', 'e95c55dbe0cc6ecea1399a2a1789ef9dc1bf5738', 1, 1541491474),
(52, '/uploads/picture/20181106/e552344a5f570e361eebb0e4e6df4597.jpg', '/uploads/picture/20181106/e552344a5f570e361eebb0e4e6df4597.jpg', '082e5dacdf065e5fb2f517ad4c4431e7', '8ce3a17e3c642ed948cae99260ad373c0f91d75c', 1, 1541491594),
(53, '/uploads/picture/20181106/dee093a442ebb22748661b687a6e1695.jpg', '/uploads/picture/20181106/dee093a442ebb22748661b687a6e1695.jpg', '90b40abdd3dc243308f37a2e3b33160e', '816d5fc3d13f87f7cdf9ad81cd71ca2cd1cf2ded', 1, 1541493547),
(54, '/uploads/picture/20181107/6e50db683d97602bd16ff7fe3ab988a5.jpg', '/uploads/picture/20181107/6e50db683d97602bd16ff7fe3ab988a5.jpg', 'defece68d4f069af9c14b2500839df18', '4df4b8cc47b9c5c4b2094da4717b7d56727288a6', 1, 1541553071),
(55, '/uploads/picture/20181107/5ab4039d194c986cf0530fcbc9288078.jpg', '/uploads/picture/20181107/5ab4039d194c986cf0530fcbc9288078.jpg', '90b40abdd3dc243308f37a2e3b33160e', '816d5fc3d13f87f7cdf9ad81cd71ca2cd1cf2ded', 1, 1541553384),
(56, '/uploads/picture/20181107/5a1795f84fb183d128ded1d930e5b85f.jpg', '/uploads/picture/20181107/5a1795f84fb183d128ded1d930e5b85f.jpg', '90b40abdd3dc243308f37a2e3b33160e', '816d5fc3d13f87f7cdf9ad81cd71ca2cd1cf2ded', 1, 1541553404),
(57, '/uploads/picture/20181107/11cbc6bddc1f649cb2e626f65f6a5858.jpg', '/uploads/picture/20181107/11cbc6bddc1f649cb2e626f65f6a5858.jpg', '21f6d709dda6513d439f72a1fb1867ab', 'cdcfc212b5a9a8be649841065d304b87469f42a2', 1, 1541553718),
(58, '/uploads/picture/20181107/c6c6c82770e5a79bfabc9e27656b161d.jpg', '/uploads/picture/20181107/c6c6c82770e5a79bfabc9e27656b161d.jpg', '90b40abdd3dc243308f37a2e3b33160e', '816d5fc3d13f87f7cdf9ad81cd71ca2cd1cf2ded', 1, 1541553980),
(59, '/uploads/picture/20181107/4b94aea51e95465287341efa67bd08e3.jpg', '/uploads/picture/20181107/4b94aea51e95465287341efa67bd08e3.jpg', 'ea98e490f5402eba68d2e21563cef50d', '8a912f62811a39ff963c54eb28b8d6e887ee786d', 1, 1541555703),
(60, '/uploads/picture/20181107/fcd77281991d3cf6d9d24d92201fb010.jpg', '/uploads/picture/20181107/fcd77281991d3cf6d9d24d92201fb010.jpg', '90b40abdd3dc243308f37a2e3b33160e', '816d5fc3d13f87f7cdf9ad81cd71ca2cd1cf2ded', 1, 1541556474),
(61, '/uploads/picture/20181107/1fd97b25700201d4da3d2bb5107e980a.jpg', '/uploads/picture/20181107/1fd97b25700201d4da3d2bb5107e980a.jpg', '082e5dacdf065e5fb2f517ad4c4431e7', '8ce3a17e3c642ed948cae99260ad373c0f91d75c', 1, 1541556474),
(62, '/uploads/picture/20181107/ed09b2d3356d4284b9ebb12202d74542.jpg', '/uploads/picture/20181107/ed09b2d3356d4284b9ebb12202d74542.jpg', 'ea98e490f5402eba68d2e21563cef50d', '8a912f62811a39ff963c54eb28b8d6e887ee786d', 1, 1541556474),
(63, '/uploads/picture/20181107/02118cfd25e4a7be81aea9322242968b.jpg', '/uploads/picture/20181107/02118cfd25e4a7be81aea9322242968b.jpg', 'defece68d4f069af9c14b2500839df18', '4df4b8cc47b9c5c4b2094da4717b7d56727288a6', 1, 1541556475),
(64, '/uploads/picture/20181107/59916adf158c934046cf630f0d60901d.jpg', '/uploads/picture/20181107/59916adf158c934046cf630f0d60901d.jpg', '21f6d709dda6513d439f72a1fb1867ab', 'cdcfc212b5a9a8be649841065d304b87469f42a2', 1, 1541556475),
(65, '/uploads/picture/20181107/ff189f16433c2613246774e3e550a769.jpg', '/uploads/picture/20181107/ff189f16433c2613246774e3e550a769.jpg', 'ea98e490f5402eba68d2e21563cef50d', '8a912f62811a39ff963c54eb28b8d6e887ee786d', 1, 1541560224),
(66, '/uploads/picture/20181107/424b74a233d6ba6837b5bdd332cd92fe.jpg', '/uploads/picture/20181107/424b74a233d6ba6837b5bdd332cd92fe.jpg', '082e5dacdf065e5fb2f517ad4c4431e7', '8ce3a17e3c642ed948cae99260ad373c0f91d75c', 1, 1541560234),
(67, '/uploads/picture/20181107/bcf64d3195bd8f963eacb973de18c3eb.gif', '/uploads/picture/20181107/bcf64d3195bd8f963eacb973de18c3eb.gif', 'dd36172c70e4128895b7d11f26c8492d', '7d140ceb4739aa991f471b7935116ceec774f5ef', 1, 1541562435),
(68, '/uploads/picture/20181107/d1bc3c54420501a36f4ce5911599601a.gif', '/uploads/picture/20181107/d1bc3c54420501a36f4ce5911599601a.gif', '507352090ac4fc581a240dc71eb1eed6', '9b4f0b2a8695619d85c1b0e4747752ca50f6ca7d', 1, 1541562475),
(69, '/uploads/picture/20181107/73518c9daa6209987a9f8a2347615dc4.jpg', '/uploads/picture/20181107/73518c9daa6209987a9f8a2347615dc4.jpg', 'ea98e490f5402eba68d2e21563cef50d', '8a912f62811a39ff963c54eb28b8d6e887ee786d', 1, 1541572044),
(70, '/uploads/picture/20181107/bf5c3754a73bdc156758c70d45d51d46.jpg', '/uploads/picture/20181107/bf5c3754a73bdc156758c70d45d51d46.jpg', 'defece68d4f069af9c14b2500839df18', '4df4b8cc47b9c5c4b2094da4717b7d56727288a6', 1, 1541572311),
(71, '/uploads/picture/20181107/df24b6672573ee065853e7a8cbf37727.jpg', '/uploads/picture/20181107/df24b6672573ee065853e7a8cbf37727.jpg', '54c199779c4961746a60f598ae269e37', '41cfca7ac8b92a39e8b94009710f4350a5e93d93', 1, 1541573032),
(72, '/uploads/picture/20181107/83dd29f77d0726dc4bfbd5ea5e5e6491.jpg', '/uploads/picture/20181107/83dd29f77d0726dc4bfbd5ea5e5e6491.jpg', '082e5dacdf065e5fb2f517ad4c4431e7', '8ce3a17e3c642ed948cae99260ad373c0f91d75c', 1, 1541573736),
(73, '/uploads/picture/20181114/b31c297f7e6d8d61ae67b9645a84d018.png', '/uploads/picture/20181114/b31c297f7e6d8d61ae67b9645a84d018.png', '3950a55ad6a7f67bf22cf7e00fd5f008', '798719ba522fa069779247aef4ae662e87823f49', 1, 1542162055),
(74, '/uploads/picture/20181114/c3e09ade1aec334c064f72f27fd243f5.png', '/uploads/picture/20181114/c3e09ade1aec334c064f72f27fd243f5.png', '3950a55ad6a7f67bf22cf7e00fd5f008', '798719ba522fa069779247aef4ae662e87823f49', 1, 1542162224),
(75, '/uploads/picture/20181114/3d041a7b8df107f74c13237f79485233.jpg', '/uploads/picture/20181114/3d041a7b8df107f74c13237f79485233.jpg', 'defece68d4f069af9c14b2500839df18', '4df4b8cc47b9c5c4b2094da4717b7d56727288a6', 1, 1542162442),
(76, '/uploads/picture/20181114/7ce73ae529a1be99b5594398fd822233.jpg', '/uploads/picture/20181114/7ce73ae529a1be99b5594398fd822233.jpg', 'defece68d4f069af9c14b2500839df18', '4df4b8cc47b9c5c4b2094da4717b7d56727288a6', 1, 1542162461),
(77, '/uploads/picture/20181114/64d60cf2fb64897ac2065d3b244cf316.jpg', '/uploads/picture/20181114/64d60cf2fb64897ac2065d3b244cf316.jpg', 'defece68d4f069af9c14b2500839df18', '4df4b8cc47b9c5c4b2094da4717b7d56727288a6', 1, 1542162482),
(78, '/uploads/picture/20181114/6db336a2d805b0e2a472d013cddae046.jpg', '/uploads/picture/20181114/6db336a2d805b0e2a472d013cddae046.jpg', 'ea98e490f5402eba68d2e21563cef50d', '8a912f62811a39ff963c54eb28b8d6e887ee786d', 1, 1542162549),
(79, '/uploads/picture/20181114/a9078e3732ae3e505165791df8b78940.png', '/uploads/picture/20181114/a9078e3732ae3e505165791df8b78940.png', '3950a55ad6a7f67bf22cf7e00fd5f008', '798719ba522fa069779247aef4ae662e87823f49', 1, 1542162583),
(80, '/uploads/picture/20181114/06cb4360aaa9a312f66d04835b4b366c.png', '/uploads/picture/20181114/06cb4360aaa9a312f66d04835b4b366c.png', '30a06443196bfef332afb6f80f0c41cc', '4d7360098f24a6f1e48a3a590eb88b7c18c114f8', 1, 1542163164),
(81, '/uploads/picture/20181114/e98d0effa4ba4fed7c61401a587d66de.png', '/uploads/picture/20181114/e98d0effa4ba4fed7c61401a587d66de.png', '6b7f8418df174e52278df7862bee0ae7', '330d8378320ff730f2c4126e3b06e1886ea87e78', 1, 1542163267),
(82, '/uploads/picture/20181116/bdae037bd725b09be794240ce0033f64.png', '/uploads/picture/20181116/bdae037bd725b09be794240ce0033f64.png', '3950a55ad6a7f67bf22cf7e00fd5f008', '798719ba522fa069779247aef4ae662e87823f49', 1, 1542331265),
(83, '/uploads/picture/20181116/71a1cb7fff1febd0083c0ad8a7c327d0.png', '/uploads/picture/20181116/71a1cb7fff1febd0083c0ad8a7c327d0.png', '30a06443196bfef332afb6f80f0c41cc', '4d7360098f24a6f1e48a3a590eb88b7c18c114f8', 1, 1542333526),
(84, '/uploads/picture/20181116/5e89fe11ad703fb8255c99d50bed9fdd.png', '/uploads/picture/20181116/5e89fe11ad703fb8255c99d50bed9fdd.png', '6b7f8418df174e52278df7862bee0ae7', '330d8378320ff730f2c4126e3b06e1886ea87e78', 1, 1542334054),
(85, '/uploads/picture/20181116/0c8fd4f3843926f110931feda3d95b17.jpg', '/uploads/picture/20181116/0c8fd4f3843926f110931feda3d95b17.jpg', '082e5dacdf065e5fb2f517ad4c4431e7', '8ce3a17e3c642ed948cae99260ad373c0f91d75c', 1, 1542338272),
(86, '/uploads/picture/20181116/6f95a7f84ba58a388579f509cc13893d.jpg', '/uploads/picture/20181116/6f95a7f84ba58a388579f509cc13893d.jpg', '082e5dacdf065e5fb2f517ad4c4431e7', '8ce3a17e3c642ed948cae99260ad373c0f91d75c', 1, 1542338296),
(87, '/uploads/picture/20181116/1403f5b94cbaec4c31c4ac8fc6700cb5.jpg', '/uploads/picture/20181116/1403f5b94cbaec4c31c4ac8fc6700cb5.jpg', '082e5dacdf065e5fb2f517ad4c4431e7', '8ce3a17e3c642ed948cae99260ad373c0f91d75c', 1, 1542338310),
(88, '/uploads/picture/20181116/f23305dd596aa93b3ad5eda2a71b3091.jpg', '/uploads/picture/20181116/f23305dd596aa93b3ad5eda2a71b3091.jpg', '792cacc4ff08190f05d1ce407f909b73', 'e95c55dbe0cc6ecea1399a2a1789ef9dc1bf5738', 1, 1542338338),
(89, '/uploads/picture/20181116/7addb17fae11e2039df551fa0108e0f8.jpg', '/uploads/picture/20181116/7addb17fae11e2039df551fa0108e0f8.jpg', '792cacc4ff08190f05d1ce407f909b73', 'e95c55dbe0cc6ecea1399a2a1789ef9dc1bf5738', 1, 1542338358),
(90, '/uploads/picture/20181116/05e34658de1d904543a4e2367782997f.jpg', '/uploads/picture/20181116/05e34658de1d904543a4e2367782997f.jpg', 'ea98e490f5402eba68d2e21563cef50d', '8a912f62811a39ff963c54eb28b8d6e887ee786d', 1, 1542338381),
(91, '/uploads/picture/20181116/e18b62b0d66050fddae12cb1adf19e5e.jpg', '/uploads/picture/20181116/e18b62b0d66050fddae12cb1adf19e5e.jpg', '082e5dacdf065e5fb2f517ad4c4431e7', '8ce3a17e3c642ed948cae99260ad373c0f91d75c', 1, 1542338391),
(92, '/uploads/picture/20181116/bf78eeaf71931f06f5175566ffa9cc7b.jpg', '/uploads/picture/20181116/bf78eeaf71931f06f5175566ffa9cc7b.jpg', 'ea98e490f5402eba68d2e21563cef50d', '8a912f62811a39ff963c54eb28b8d6e887ee786d', 1, 1542338412),
(93, '/uploads/picture/20181116/a03b531c9a806a71ac262a83a445b555.jpg', '/uploads/picture/20181116/a03b531c9a806a71ac262a83a445b555.jpg', '082e5dacdf065e5fb2f517ad4c4431e7', '8ce3a17e3c642ed948cae99260ad373c0f91d75c', 1, 1542338649),
(94, '/uploads/picture/20181116/91b7d46ef69cfa4dd623760daf7ce7d4.jpg', '/uploads/picture/20181116/91b7d46ef69cfa4dd623760daf7ce7d4.jpg', '90b40abdd3dc243308f37a2e3b33160e', '816d5fc3d13f87f7cdf9ad81cd71ca2cd1cf2ded', 1, 1542338743),
(95, '/uploads/picture/20181116/8dec71e0a635e2942a2220cf6e9b15f9.jpg', '/uploads/picture/20181116/8dec71e0a635e2942a2220cf6e9b15f9.jpg', '90b40abdd3dc243308f37a2e3b33160e', '816d5fc3d13f87f7cdf9ad81cd71ca2cd1cf2ded', 1, 1542338770),
(96, '/uploads/picture/20181116/0ae45727956b745c36dd89b32b27259f.jpg', '/uploads/picture/20181116/0ae45727956b745c36dd89b32b27259f.jpg', '90b40abdd3dc243308f37a2e3b33160e', '816d5fc3d13f87f7cdf9ad81cd71ca2cd1cf2ded', 1, 1542338928),
(97, '/uploads/picture/20181116/0788676a8ebe35ece3645691bfda6dda.jpg', '/uploads/picture/20181116/0788676a8ebe35ece3645691bfda6dda.jpg', '90b40abdd3dc243308f37a2e3b33160e', '816d5fc3d13f87f7cdf9ad81cd71ca2cd1cf2ded', 1, 1542339042),
(98, '/uploads/picture/20181116/15ead4e89967400306c8cdebfc78f4cc.jpg', '/uploads/picture/20181116/15ead4e89967400306c8cdebfc78f4cc.jpg', '082e5dacdf065e5fb2f517ad4c4431e7', '8ce3a17e3c642ed948cae99260ad373c0f91d75c', 1, 1542339090),
(99, '/uploads/picture/20181116/6ccfca4057831e9c29545d1db71903e4.jpg', '/uploads/picture/20181116/6ccfca4057831e9c29545d1db71903e4.jpg', '082e5dacdf065e5fb2f517ad4c4431e7', '8ce3a17e3c642ed948cae99260ad373c0f91d75c', 1, 1542339208),
(100, '/uploads/picture/20181116/8af2e5d189f035aa2e5185a91a058452.jpg', '/uploads/picture/20181116/8af2e5d189f035aa2e5185a91a058452.jpg', '792cacc4ff08190f05d1ce407f909b73', 'e95c55dbe0cc6ecea1399a2a1789ef9dc1bf5738', 1, 1542339378),
(101, '/uploads/picture/20181116/378a24f440d15d3f31448e2c24bb101b.jpg', '/uploads/picture/20181116/378a24f440d15d3f31448e2c24bb101b.jpg', 'defece68d4f069af9c14b2500839df18', '4df4b8cc47b9c5c4b2094da4717b7d56727288a6', 1, 1542339505),
(102, '/uploads/picture/20181119/5977ce881fa883e4a3c6cce66842a941.png', '/uploads/picture/20181119/5977ce881fa883e4a3c6cce66842a941.png', '8404d40f525036bff8e3b9de157ce9cc', '575fba9ba562ca082c8ef6245cec9786e7c938dc', 1, 1542626891),
(103, '/uploads/picture/20181119/ad1339a645171356ca483cde1720da25.png', '/uploads/picture/20181119/ad1339a645171356ca483cde1720da25.png', 'bc6972e9340ecd6f3048dc3385cd8b0a', 'f17e1a78573a8b994c3f387877469e40a8f1d1f5', 1, 1542626908),
(104, '/uploads/picture/20181119/7029e3bcdb2f6c7ba4078b0b5b62f2c2.png', '/uploads/picture/20181119/7029e3bcdb2f6c7ba4078b0b5b62f2c2.png', 'ed653286b15bc2ab0186a15923b93930', '2ff74106c189d408fda667fafe78fc19e5808ab7', 1, 1542626927),
(105, '/uploads/picture/20181119/7a923a39970c4a0cbb7d3b2bc4644f85.jpg', '/uploads/picture/20181119/7a923a39970c4a0cbb7d3b2bc4644f85.jpg', '1e70aa91dd87ee4f28fc846184d78e61', 'e58f8113d37cb50b489d17d367ea16a4d25c5d62', 1, 1542626940),
(106, '/uploads/picture/20181119/3bee0e03eb414ba1bad1fff6761e76b0.jpg', '/uploads/picture/20181119/3bee0e03eb414ba1bad1fff6761e76b0.jpg', '0b6ba59f6dc488a27a913f88470e80d2', '792a48be4466bd5e42e08fdc856f22dc702f411e', 1, 1542627363),
(107, '/uploads/picture/20181119/e2a8ea569571683e85fd6931163d8c5d.jpg', '/uploads/picture/20181119/e2a8ea569571683e85fd6931163d8c5d.jpg', '0b6ba59f6dc488a27a913f88470e80d2', '792a48be4466bd5e42e08fdc856f22dc702f411e', 1, 1542627386),
(108, '/uploads/picture/20181119/ee8e463c2ab9904218a08a1b5a47a76b.jpg', '/uploads/picture/20181119/ee8e463c2ab9904218a08a1b5a47a76b.jpg', '8733e7923919aa3c92163ce9e84a907a', 'de8fb88bbe6a15d051235ceca10bd160f27bb27f', 1, 1542627397),
(109, '/uploads/picture/20181119/595f0dbbdf8b9985f747ffa2d36d0c23.jpg', '/uploads/picture/20181119/595f0dbbdf8b9985f747ffa2d36d0c23.jpg', 'ece4911d11b388adc6858531447d2877', 'c103760f33a865ac130cc9fa8bac9e2bb526d8fe', 1, 1542627408),
(110, '/uploads/picture/20181119/bcf6d2b59d28476b0035a5f3aaa9aafe.JPG', '/uploads/picture/20181119/bcf6d2b59d28476b0035a5f3aaa9aafe.JPG', '7f799481bffa0211dc8c09536fb53c7e', '34794917dedc9b1d33d98e14bdc36733e6c9787e', 1, 1542627626),
(111, '/uploads/picture/20181119/2e03d925164e196e6436f1559475a268.JPG', '/uploads/picture/20181119/2e03d925164e196e6436f1559475a268.JPG', '168a23d2d9dd1fec7237e39e1bc0d99e', '6559f730d3ca4290e7e0dca4aa0bb932e20f1caa', 1, 1542627681),
(112, '/uploads/picture/20181119/dfeedc0aa551189cf092033fc9c9a12a.png', '/uploads/picture/20181119/dfeedc0aa551189cf092033fc9c9a12a.png', '55f3f953031199babd425bbc80dff9a0', '65037e9df8d8e1a2f91c9333fe0d1336a5df5108', 1, 1542628435),
(113, '/uploads/picture/20181119/e4492be232685110a1322966d04b400a.png', '/uploads/picture/20181119/e4492be232685110a1322966d04b400a.png', '55f3f953031199babd425bbc80dff9a0', '65037e9df8d8e1a2f91c9333fe0d1336a5df5108', 1, 1542628478),
(114, '/uploads/picture/20181119/8746668631a33c7feb8cfdb272e7455f.jpg', '/uploads/picture/20181119/8746668631a33c7feb8cfdb272e7455f.jpg', 'ba0004661bd270a5cb8b6480ebdf163e', 'b5cf399f94ba3ffdb318e92d38607a0048775dfb', 1, 1542630263),
(115, '/uploads/picture/20181119/885c2b36121b17e8bf4e278ec45a178b.jpg', '/uploads/picture/20181119/885c2b36121b17e8bf4e278ec45a178b.jpg', '65bf7fe22e719d6e7e42b1d054188560', '28916f42a27de37e3888900773d86a3b4d7aa1b8', 1, 1542630280),
(116, '/uploads/picture/20181119/b9e38aa786d834b47ce8c66551d6bd50.jpg', '/uploads/picture/20181119/b9e38aa786d834b47ce8c66551d6bd50.jpg', '65bf7fe22e719d6e7e42b1d054188560', '28916f42a27de37e3888900773d86a3b4d7aa1b8', 1, 1542630291),
(117, '/uploads/picture/20181119/543d62656943b36f4ee62e4638b97c95.jpg', '/uploads/picture/20181119/543d62656943b36f4ee62e4638b97c95.jpg', '65bf7fe22e719d6e7e42b1d054188560', '28916f42a27de37e3888900773d86a3b4d7aa1b8', 1, 1542630306),
(118, '/uploads/picture/20181119/f4fecc4d1a1fc8b7bd0180361dfdba0e.jpg', '/uploads/picture/20181119/f4fecc4d1a1fc8b7bd0180361dfdba0e.jpg', '2181e5bae2986053e86137e7c54d8038', '8896f6241ff6a27df5610b45bfd9fcfd4958a2e8', 1, 1542630340),
(119, '/uploads/picture/20181119/8accb194b436108efd18aa1b6e718d90.jpg', '/uploads/picture/20181119/8accb194b436108efd18aa1b6e718d90.jpg', '65bf7fe22e719d6e7e42b1d054188560', '28916f42a27de37e3888900773d86a3b4d7aa1b8', 1, 1542630434),
(120, '/uploads/picture/20181119/76233b6c4eb2ad9bfb57216353c9e474.jpg', '/uploads/picture/20181119/76233b6c4eb2ad9bfb57216353c9e474.jpg', '65bf7fe22e719d6e7e42b1d054188560', '28916f42a27de37e3888900773d86a3b4d7aa1b8', 1, 1542630470),
(121, '/uploads/picture/20181119/7999ba3a9e1afefc4ce957e6141d2766.jpg', '/uploads/picture/20181119/7999ba3a9e1afefc4ce957e6141d2766.jpg', 'e896522fdc9b0c465616d913d3f52237', '5218fc8756e80c976bae53e9b20ac10210544a08', 1, 1542630483),
(122, '/uploads/picture/20181119/d30a3b1e286a782a0937d628f662954c.jpg', '/uploads/picture/20181119/d30a3b1e286a782a0937d628f662954c.jpg', '4eaebd35eefad8976f12b4cac2d6db0c', '70d603aac71b2b8fd76228a68e0ac2a312a44a12', 1, 1542630495),
(123, '/uploads/picture/20181119/5f38fed0609f0dd7c9f044a7e6b86b1b.jpg', '/uploads/picture/20181119/5f38fed0609f0dd7c9f044a7e6b86b1b.jpg', '2181e5bae2986053e86137e7c54d8038', '8896f6241ff6a27df5610b45bfd9fcfd4958a2e8', 1, 1542630506),
(124, '/uploads/picture/20181119/d2e4d59bf8ca5c98ab5e5a04cfca938d.jpg', '/uploads/picture/20181119/d2e4d59bf8ca5c98ab5e5a04cfca938d.jpg', '65bf7fe22e719d6e7e42b1d054188560', '28916f42a27de37e3888900773d86a3b4d7aa1b8', 1, 1542630516),
(125, '/uploads/picture/20181119/3d727246d50605b9cc20c92a20135444.jpg', '/uploads/picture/20181119/3d727246d50605b9cc20c92a20135444.jpg', '2181e5bae2986053e86137e7c54d8038', '8896f6241ff6a27df5610b45bfd9fcfd4958a2e8', 1, 1542630569),
(126, '/uploads/picture/20181119/dce291223237494f99aa4fabc7cb028f.jpg', '/uploads/picture/20181119/dce291223237494f99aa4fabc7cb028f.jpg', '65bf7fe22e719d6e7e42b1d054188560', '28916f42a27de37e3888900773d86a3b4d7aa1b8', 1, 1542630643),
(127, '/uploads/picture/20181119/659eac69a188e5f19ffc94e951069496.jpg', '/uploads/picture/20181119/659eac69a188e5f19ffc94e951069496.jpg', '65bf7fe22e719d6e7e42b1d054188560', '28916f42a27de37e3888900773d86a3b4d7aa1b8', 1, 1542630663),
(128, '/uploads/picture/20181119/56a2701ac9f2c844de7125ce7614af74.jpg', '/uploads/picture/20181119/56a2701ac9f2c844de7125ce7614af74.jpg', '817b432a8a093286a5cd0fbbb51a8032', '2498ead43f36561d59d1abe5c47a45d9e6204a88', 1, 1542634785),
(129, '/uploads/picture/20181119/87d9f3a0986a1a7eefb82f317302c0f4.jpg', '/uploads/picture/20181119/87d9f3a0986a1a7eefb82f317302c0f4.jpg', '8e2469bff262170d6ad72b06a57b66a9', 'daffb5afbf2c5a2083e084854718ee784e8d1af7', 1, 1542634798),
(130, '/uploads/picture/20181119/dea686bb62ceb7e354d7b82026e849aa.jpg', '/uploads/picture/20181119/dea686bb62ceb7e354d7b82026e849aa.jpg', '998358b12018cd9317510092626e6dab', '8a688b692909a6c9bff04030da21b130fc4c0b93', 1, 1542634807),
(131, '/uploads/picture/20181119/9a5c0e849fed21b33062d24e21baa404.jpg', '/uploads/picture/20181119/9a5c0e849fed21b33062d24e21baa404.jpg', '65bf7fe22e719d6e7e42b1d054188560', '28916f42a27de37e3888900773d86a3b4d7aa1b8', 1, 1542634816),
(132, '/uploads/picture/20181119/f8c61041f92390e7b8ece1ab02750da7.jpg', '/uploads/picture/20181119/f8c61041f92390e7b8ece1ab02750da7.jpg', 'c19e2e66e68082fc3faf253512dd7bea', 'f3b5c363778c3b0767c899ecb7a308160a44d285', 1, 1542634843),
(133, '/uploads/picture/20181119/e5c684e05b7e3f40d9f940315d94086f.jpg', '/uploads/picture/20181119/e5c684e05b7e3f40d9f940315d94086f.jpg', '4ac3dc0b6fc8dc6936b917e40862be9a', '138bb5c8deb7f41be1e13cbc8c2b22b2a0465adc', 1, 1542634852),
(134, '/uploads/picture/20181119/2e11abb39873187ae35d6e9b243944f1.jpg', '/uploads/picture/20181119/2e11abb39873187ae35d6e9b243944f1.jpg', '38699c65dbeb917b071700eeea03d24f', '8f08c2f4b208a5497339e02c1fe4a815ca2d89ed', 1, 1542634856),
(135, '/uploads/picture/20181119/077d5f2bc0618efa035228dd25cb1266.jpg', '/uploads/picture/20181119/077d5f2bc0618efa035228dd25cb1266.jpg', '8cde9d67987c674b17a61d0b44de6328', '6f4eb7d2bf39b6394d08a0f0936fb919c6815e97', 1, 1542634859),
(136, '/uploads/picture/20181119/cba47e8a9ab78b8fb4af64a8fae33910.jpg', '/uploads/picture/20181119/cba47e8a9ab78b8fb4af64a8fae33910.jpg', '3325628bc2fbfcb60c15ca89d959bc45', '5f4e1d2662d9d6e4b557b6be65c03be77cf75c50', 1, 1542634879),
(137, '/uploads/picture/20181119/af29610538839139d9eada2b2f990eff.jpg', '/uploads/picture/20181119/af29610538839139d9eada2b2f990eff.jpg', '3325628bc2fbfcb60c15ca89d959bc45', '5f4e1d2662d9d6e4b557b6be65c03be77cf75c50', 1, 1542634891),
(138, '/uploads/picture/20181119/d2f792cc6b4c9eac66a5c88b5ffc776f.jpg', '/uploads/picture/20181119/d2f792cc6b4c9eac66a5c88b5ffc776f.jpg', '3325628bc2fbfcb60c15ca89d959bc45', '5f4e1d2662d9d6e4b557b6be65c03be77cf75c50', 1, 1542634909),
(139, '/uploads/picture/20181119/f1ff66055531d5a05f23704c1989bb74.jpg', '/uploads/picture/20181119/f1ff66055531d5a05f23704c1989bb74.jpg', '1e21dd418fb35e82ccf6e595762fb295', '42390487561b8f8761ea3b6f1c59cda5ce8f736d', 1, 1542634919),
(140, '/uploads/picture/20181119/8e4fe38551902ab07e9128caac1b9c55.jpg', '/uploads/picture/20181119/8e4fe38551902ab07e9128caac1b9c55.jpg', '8729d977069ff045da3133cb77116b1b', 'a381dfc5823147fe3dfb6184b6d5e069736bf11a', 1, 1542634930),
(141, '/uploads/picture/20181119/4e8bf3b85bc87f0aeef364986901e208.jpg', '/uploads/picture/20181119/4e8bf3b85bc87f0aeef364986901e208.jpg', '09b8e01c6746c75f606a1202fc2c3b07', 'ba2510089eea2acd759720acb1e969784cb4d785', 1, 1542634940),
(142, '/uploads/picture/20181119/06ced9daa4dbb49c3bbb3782a9dbc25b.jpg', '/uploads/picture/20181119/06ced9daa4dbb49c3bbb3782a9dbc25b.jpg', 'dbb3beb818da57655bb846e2809d8ced', 'e62eeba1754907a6bfe86b108efd03e1813b0c65', 1, 1542634959),
(143, '/uploads/picture/20181119/9bb5a004146a658308a52817af60c5d3.jpg', '/uploads/picture/20181119/9bb5a004146a658308a52817af60c5d3.jpg', '278d73308c8e8dc8695b9a2ac14f4c0c', '493a4c13cdd179b702f3ba6f6610b48089b1110e', 1, 1542634982),
(144, '/uploads/picture/20181119/95b5f0623a2dbae05e952a8640a3c191.jpg', '/uploads/picture/20181119/95b5f0623a2dbae05e952a8640a3c191.jpg', '61d43fb1a7f216e82df132b0d322dbfa', '84ba0871e4d538b63f0f0d3aa56661b5b1b77e56', 1, 1542634986),
(145, '/uploads/picture/20181119/84ffd495758022361e628cf4301c74e3.jpg', '/uploads/picture/20181119/84ffd495758022361e628cf4301c74e3.jpg', '661db579e54f8a0a2782003de2245ca9', '582465d36fe0191fd78b66731bad7488ad525fe2', 1, 1542634990),
(146, '/uploads/picture/20181119/95677f55784744e71d022db9aca2cf65.jpg', '/uploads/picture/20181119/95677f55784744e71d022db9aca2cf65.jpg', '661db579e54f8a0a2782003de2245ca9', '582465d36fe0191fd78b66731bad7488ad525fe2', 1, 1542634994),
(147, '/uploads/picture/20181119/fa9d79ca2b5aa987c709027852d37c69.jpg', '/uploads/picture/20181119/fa9d79ca2b5aa987c709027852d37c69.jpg', '8cdebdb84a85b949eff26df99edf46bd', 'ddd70debc2bda5373acb22e35c4442de4c2a3f1f', 1, 1542634997),
(148, '/uploads/picture/20181119/daa4e1657930d9da49cf5b72841bbd04.jpg', '/uploads/picture/20181119/daa4e1657930d9da49cf5b72841bbd04.jpg', '2f3d5e852a1daadaab49e115a36d9bb9', '2b60fcee95def2be14d591d60e803680500f83f6', 1, 1542635016),
(149, '/uploads/picture/20181119/072b51801c8839129e2cc6d4944ebf71.jpg', '/uploads/picture/20181119/072b51801c8839129e2cc6d4944ebf71.jpg', '9a32aa3429d3575146de642bb07f2302', 'b72f0566fd0670dfa2962508647da821aaa080f2', 1, 1542635019),
(150, '/uploads/picture/20181119/2348995ee188df37a1a52f931a851491.jpg', '/uploads/picture/20181119/2348995ee188df37a1a52f931a851491.jpg', 'a28c5edc160e30c9d776537cd6b647a1', '6f47d8c6ed26d2bb57ade650346541801c738ae5', 1, 1542635023),
(151, '/uploads/picture/20181119/46d039c819c7a4d9c2b57a3346d433da.jpg', '/uploads/picture/20181119/46d039c819c7a4d9c2b57a3346d433da.jpg', '546705e84379098c0306bb415c92ca80', '8f8d63b391ed03bb31a35cd86f4e59bb66f953d0', 1, 1542635026),
(152, '/uploads/picture/20181119/8f6ccdc273060f8c348410f4c950603a.jpg', '/uploads/picture/20181119/8f6ccdc273060f8c348410f4c950603a.jpg', 'ed0da83219d601e1d7f0ed153490193c', '6a6e2bdfdab7e88a25b073c9427ab80da892a5be', 1, 1542635029),
(153, '/uploads/picture/20181119/82719db0dded2a6a1722dd3a73571216.jpg', '/uploads/picture/20181119/82719db0dded2a6a1722dd3a73571216.jpg', '2f3d5e852a1daadaab49e115a36d9bb9', '2b60fcee95def2be14d591d60e803680500f83f6', 1, 1542635032),
(154, '/uploads/picture/20181119/9051f8d3a770f7bdc902e4815133fe9b.jpg', '/uploads/picture/20181119/9051f8d3a770f7bdc902e4815133fe9b.jpg', '9a32aa3429d3575146de642bb07f2302', 'b72f0566fd0670dfa2962508647da821aaa080f2', 1, 1542635045),
(155, '/uploads/picture/20181119/23bc45911e92ff10ff1f6f5327c3ee85.jpg', '/uploads/picture/20181119/23bc45911e92ff10ff1f6f5327c3ee85.jpg', 'a28c5edc160e30c9d776537cd6b647a1', '6f47d8c6ed26d2bb57ade650346541801c738ae5', 1, 1542635048),
(156, '/uploads/picture/20181119/3ef5d57ff76f17b4e76b6f7b21b400a9.jpg', '/uploads/picture/20181119/3ef5d57ff76f17b4e76b6f7b21b400a9.jpg', '2f3d5e852a1daadaab49e115a36d9bb9', '2b60fcee95def2be14d591d60e803680500f83f6', 1, 1542635051),
(157, '/uploads/picture/20181119/fca41498f5bda13c7a49886cbb8a7588.jpg', '/uploads/picture/20181119/fca41498f5bda13c7a49886cbb8a7588.jpg', 'ed0da83219d601e1d7f0ed153490193c', '6a6e2bdfdab7e88a25b073c9427ab80da892a5be', 1, 1542635054),
(158, '/uploads/picture/20181119/83d3d15f6f6d99844692f450fefad6c7.jpg', '/uploads/picture/20181119/83d3d15f6f6d99844692f450fefad6c7.jpg', '546705e84379098c0306bb415c92ca80', '8f8d63b391ed03bb31a35cd86f4e59bb66f953d0', 1, 1542635057),
(159, '/uploads/picture/20181119/786b4427610ecae9ed7a970e858a48f9.jpg', '/uploads/picture/20181119/786b4427610ecae9ed7a970e858a48f9.jpg', '6fa1169606a60f1de2f3ab3afdf18af6', '543df44f9f2286dce4a7bc7f173e6fa5f94153bb', 1, 1542635321),
(160, '/uploads/picture/20181119/017772c0a7768fc6e3ed7a6bc9b2aad5.jpg', '/uploads/picture/20181119/017772c0a7768fc6e3ed7a6bc9b2aad5.jpg', '84346a9faf72ea6bb3ba0d50b92e4dc9', '2131a6a36d2c4a78bcecb3149dc32d9add5d11c8', 1, 1542635327),
(161, '/uploads/picture/20181119/780e2049038f062bffd6c743884fe112.jpg', '/uploads/picture/20181119/780e2049038f062bffd6c743884fe112.jpg', '6fa1169606a60f1de2f3ab3afdf18af6', '543df44f9f2286dce4a7bc7f173e6fa5f94153bb', 1, 1542635336),
(162, '/uploads/picture/20181119/9dabe5fe52b8d092f4e3ad7c307c7e4f.jpg', '/uploads/picture/20181119/9dabe5fe52b8d092f4e3ad7c307c7e4f.jpg', 'b5bf87a14c31bdac28f7da08c5fb20ab', '2a833fcf28ba2d3ce3aab613bf3946ce435d5bba', 1, 1542635344),
(163, '/uploads/picture/20181119/6dacd1fbf17db3ff9187fce9e3e0dc36.jpg', '/uploads/picture/20181119/6dacd1fbf17db3ff9187fce9e3e0dc36.jpg', 'b5bf87a14c31bdac28f7da08c5fb20ab', '2a833fcf28ba2d3ce3aab613bf3946ce435d5bba', 1, 1542635650),
(164, '/uploads/picture/20181119/4362d082c20295ebc716081d47aebc7e.jpg', '/uploads/picture/20181119/4362d082c20295ebc716081d47aebc7e.jpg', '4ac3dc0b6fc8dc6936b917e40862be9a', '138bb5c8deb7f41be1e13cbc8c2b22b2a0465adc', 1, 1542635858),
(165, '/uploads/picture/20181119/1691119293b91321f7c9ef19c66fadb6.jpg', '/uploads/picture/20181119/1691119293b91321f7c9ef19c66fadb6.jpg', 'c19e2e66e68082fc3faf253512dd7bea', 'f3b5c363778c3b0767c899ecb7a308160a44d285', 1, 1542635885),
(166, '/uploads/picture/20181119/b907cf553daaef41f7d8cd829564537d.jpg', '/uploads/picture/20181119/b907cf553daaef41f7d8cd829564537d.jpg', '4ac3dc0b6fc8dc6936b917e40862be9a', '138bb5c8deb7f41be1e13cbc8c2b22b2a0465adc', 1, 1542635921),
(167, '/uploads/picture/20181119/0affbf082daf8d4ab3d4198c86bc2fa3.jpg', '/uploads/picture/20181119/0affbf082daf8d4ab3d4198c86bc2fa3.jpg', '8cde9d67987c674b17a61d0b44de6328', '6f4eb7d2bf39b6394d08a0f0936fb919c6815e97', 1, 1542635957),
(168, '/uploads/picture/20181119/321fd08921ecedfe5f7b5d106a9a8eda.jpg', '/uploads/picture/20181119/321fd08921ecedfe5f7b5d106a9a8eda.jpg', 'c19e2e66e68082fc3faf253512dd7bea', 'f3b5c363778c3b0767c899ecb7a308160a44d285', 1, 1542635962),
(169, '/uploads/picture/20181119/3d9ce5d1da88b410f5b4a2058661aa09.jpg', '/uploads/picture/20181119/3d9ce5d1da88b410f5b4a2058661aa09.jpg', 'c19e2e66e68082fc3faf253512dd7bea', 'f3b5c363778c3b0767c899ecb7a308160a44d285', 1, 1542636317),
(170, '/uploads/picture/20181119/ed557eb4dae33af0bb205f380dd9a25b.jpg', '/uploads/picture/20181119/ed557eb4dae33af0bb205f380dd9a25b.jpg', 'c19e2e66e68082fc3faf253512dd7bea', 'f3b5c363778c3b0767c899ecb7a308160a44d285', 1, 1542636415),
(171, '/uploads/picture/20181119/f2531f453c5322b30c7ec74307f996ba.jpg', '/uploads/picture/20181119/f2531f453c5322b30c7ec74307f996ba.jpg', 'c19e2e66e68082fc3faf253512dd7bea', 'f3b5c363778c3b0767c899ecb7a308160a44d285', 1, 1542636458),
(172, '/uploads/picture/20181119/ffb104f4d96436d5efa64aa92b25071b.jpg', '/uploads/picture/20181119/ffb104f4d96436d5efa64aa92b25071b.jpg', 'c19e2e66e68082fc3faf253512dd7bea', 'f3b5c363778c3b0767c899ecb7a308160a44d285', 1, 1542636473),
(173, '/uploads/picture/20181119/efa55f7890cf709500523c54ed89c0a7.jpg', '/uploads/picture/20181119/efa55f7890cf709500523c54ed89c0a7.jpg', 'e29800871c5faf6c23a59241e6ee6872', '69c8f33b2dbe71d403c65d3b1506bc2800d712f6', 1, 1542636676),
(174, '/uploads/picture/20181119/a6e4a4a8e4a07901eb0cab78ecb97d38.jpg', '/uploads/picture/20181119/a6e4a4a8e4a07901eb0cab78ecb97d38.jpg', 'e29800871c5faf6c23a59241e6ee6872', '69c8f33b2dbe71d403c65d3b1506bc2800d712f6', 1, 1542636730),
(175, '/uploads/picture/20181120/b81e7acb28a96b3a1e56c753f58c6d3b.jpg', '/uploads/picture/20181120/b81e7acb28a96b3a1e56c753f58c6d3b.jpg', 'de2f5b4b2dbc67f18b8994bef0d79033', '2064b8f352a1def7720fdc2705ac50a125b2ec8b', 1, 1542726318),
(176, '/uploads/picture/20181121/993196c7f8fcf80942ef5348765492ea.jpg', '/uploads/picture/20181121/993196c7f8fcf80942ef5348765492ea.jpg', 'c19e2e66e68082fc3faf253512dd7bea', 'f3b5c363778c3b0767c899ecb7a308160a44d285', 1, 1542732185),
(177, '/uploads/picture/20181121/d5bbd669ea01e2580cc411676b7e1750.jpg', '/uploads/picture/20181121/d5bbd669ea01e2580cc411676b7e1750.jpg', '1e70aa91dd87ee4f28fc846184d78e61', 'e58f8113d37cb50b489d17d367ea16a4d25c5d62', 1, 1542732242),
(178, '/uploads/picture/20181121/8d90419a9a25090930f2b0f541a6f06a.jpg', '/uploads/picture/20181121/8d90419a9a25090930f2b0f541a6f06a.jpg', '65bf7fe22e719d6e7e42b1d054188560', '28916f42a27de37e3888900773d86a3b4d7aa1b8', 1, 1542732246);

-- --------------------------------------------------------

--
-- 表的结构 `sent_protect`
--

CREATE TABLE IF NOT EXISTS `sent_protect` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL COMMENT '学员',
  `person_id` int(11) NOT NULL COMMENT '队员ID,或者合伙人ID',
  `protect_time` int(11) NOT NULL COMMENT '保护时间',
  `deactivation_time` int(11) NOT NULL COMMENT '脱保时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='资源保护';

-- --------------------------------------------------------

--
-- 表的结构 `sent_rewrite`
--

CREATE TABLE IF NOT EXISTS `sent_rewrite` (
  `id` int(10) unsigned NOT NULL COMMENT '主键id自增',
  `rule` varchar(255) NOT NULL DEFAULT '' COMMENT '规则',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT 'url',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='伪静态表';

-- --------------------------------------------------------

--
-- 表的结构 `sent_school`
--

CREATE TABLE IF NOT EXISTS `sent_school` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '名称'
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sent_school`
--

INSERT INTO `sent_school` (`id`, `name`) VALUES
(1, '鼎吉驾校'),
(2, '驾校名称2'),
(3, '驾校名称3');

-- --------------------------------------------------------

--
-- 表的结构 `sent_seo_rule`
--

CREATE TABLE IF NOT EXISTS `sent_seo_rule` (
  `id` int(11) unsigned NOT NULL COMMENT '唯一标识',
  `title` text NOT NULL COMMENT '规则标题',
  `app` varchar(40) DEFAULT NULL,
  `controller` varchar(40) DEFAULT NULL,
  `action` varchar(40) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态',
  `seo_title` text NOT NULL COMMENT 'SEO标题',
  `seo_keywords` text NOT NULL COMMENT 'SEO关键词',
  `seo_description` text NOT NULL COMMENT 'SEO描述',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序'
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sent_seo_rule`
--

INSERT INTO `sent_seo_rule` (`id`, `title`, `app`, `controller`, `action`, `status`, `seo_title`, `seo_keywords`, `seo_description`, `sort`) VALUES
(1, '整站标题', '', '', '', 1, 'SentCMS网站管理系统', 'SentCMS网站管理系统', 'SentCMS网站管理系统', 7);

-- --------------------------------------------------------

--
-- 表的结构 `sent_station`
--

CREATE TABLE IF NOT EXISTS `sent_station` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(100) NOT NULL COMMENT '名称',
  `outfit_id` int(11) NOT NULL COMMENT '机构名称',
  `address` varchar(200) NOT NULL COMMENT '详细地址',
  `lng` varchar(20) NOT NULL COMMENT '经度',
  `lat` varchar(20) NOT NULL COMMENT '纬度'
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='体检站';

--
-- 转存表中的数据 `sent_station`
--

INSERT INTO `sent_station` (`id`, `name`, `outfit_id`, `address`, `lng`, `lat`) VALUES
(1, '人和驾驶员体检站', 1, '渝北区人和立交紫露苑附近', '106.532472', '29.617023'),
(2, '茶园驾驶员体检站', 1, '南岸区茶园新区机电路22号（南岸支队车管所旁）', '106.666800', '29.483675'),
(3, '大堰驾驶员体检站', 1, '九龙坡区龙泉村115号(马王场轻轨站大堰机动车检测站旁)', '106.479916', '29.506797'),
(4, '九龙坡区体检站', 2, '九龙坡区云湖路3号光华机市场1-220号（周日休息）', '106.506722', '29.505162'),
(5, '白市驿驾驶员体检站', 3, '九龙坡区白市驿镇白龙路68号附43号（周日休息）', '106.493355', '29.5293');

-- --------------------------------------------------------

--
-- 表的结构 `sent_student`
--

CREATE TABLE IF NOT EXISTS `sent_student` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(20) NOT NULL COMMENT '学员姓名',
  `phone` varchar(15) NOT NULL COMMENT '电话',
  `card` varchar(20) NOT NULL COMMENT '身份证',
  `grade_id` int(11) NOT NULL COMMENT '班别ID',
  `area_id` int(11) NOT NULL COMMENT '场地ID',
  `activity_id` varchar(20) DEFAULT NULL COMMENT '活动ID',
  `coupon` int(11) DEFAULT NULL COMMENT '优惠券ID',
  `inviter` int(11) DEFAULT NULL COMMENT '邀请人ID(根据此ID查询合伙人和队员)  根据学员填写的推荐码查询推荐人ID',
  `sign_date` int(11) NOT NULL COMMENT '报名时间',
  `pay_date` int(11) DEFAULT NULL COMMENT '支付时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态（0：退学 1：正常）',
  `tuition_state` tinyint(4) NOT NULL COMMENT '学费状态（1：全款 2：欠费）',
  `payable` decimal(9,2) NOT NULL COMMENT '应付款',
  `payment` decimal(9,2) NOT NULL COMMENT '实付款',
  `unpaid` decimal(9,2) NOT NULL COMMENT '未付款',
  `openId` varchar(50) DEFAULT NULL COMMENT '微信用户',
  `sn` varchar(100) NOT NULL COMMENT '订单编号',
  `pay_type` tinyint(4) NOT NULL COMMENT '缴费类型（1：线上全款支付 2：线上定金支付 3：线下全款支付 4：线下定金支付）',
  `payee` int(11) DEFAULT NULL COMMENT '收款人',
  `remark` varchar(300) DEFAULT NULL COMMENT '收款备注',
  `school_id` smallint(6) NOT NULL DEFAULT '1',
  `is_pay` tinyint(4) DEFAULT NULL COMMENT '是否付款(1:已付款 0：未付款)'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='学员管理表';

--
-- 转存表中的数据 `sent_student`
--

INSERT INTO `sent_student` (`id`, `name`, `phone`, `card`, `grade_id`, `area_id`, `activity_id`, `coupon`, `inviter`, `sign_date`, `pay_date`, `status`, `tuition_state`, `payable`, `payment`, `unpaid`, `openId`, `sn`, `pay_type`, `payee`, `remark`, `school_id`, `is_pay`) VALUES
(1, '花花', '13594855871', '500236199201276208', 8, 1, NULL, NULL, NULL, 1542881641, NULL, 1, 1, '666.00', '666.00', '0.00', 'o2l0cwqD9xFMwlNrr7BfBCmhLVv8', 'dj_mXAUxTCwxKjaNPllvfnU', 1, NULL, NULL, 1, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `sent_sync_login`
--

CREATE TABLE IF NOT EXISTS `sent_sync_login` (
  `uid` int(11) NOT NULL,
  `openid` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `access_token` varchar(255) NOT NULL,
  `refresh_token` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 表的结构 `sent_test`
--

CREATE TABLE IF NOT EXISTS `sent_test` (
  `id` int(10) unsigned NOT NULL,
  `code` int(11) NOT NULL COMMENT '体检源码',
  `random` int(11) NOT NULL COMMENT '随机码',
  `verify` int(11) NOT NULL COMMENT '体检新码',
  `create_time` int(11) NOT NULL COMMENT '录入时间',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '是否分配（0：未分配 1:已分配）',
  `outfit_id` int(11) NOT NULL COMMENT '所属机构',
  `username` varchar(100) DEFAULT NULL COMMENT '申请人',
  `phone` varchar(20) DEFAULT NULL COMMENT '申请人电话',
  `apply_time` int(11) DEFAULT NULL COMMENT '申请时间'
) ENGINE=MyISAM AUTO_INCREMENT=97 DEFAULT CHARSET=utf8 COMMENT='体检码表';

--
-- 转存表中的数据 `sent_test`
--

INSERT INTO `sent_test` (`id`, `code`, `random`, `verify`, `create_time`, `status`, `outfit_id`, `username`, `phone`, `apply_time`) VALUES
(1, 31005, 576, 31576, 1542008373, 1, 1, '测试一下', '13594855871', NULL),
(2, 31006, 732, 31732, 1542008373, 1, 1, '花花', '13594855871', NULL),
(3, 31007, 541, 31541, 1542008373, 1, 1, '花花', '13594855871', 1542940665),
(4, 31008, 107, 31107, 1542008373, 0, 1, NULL, NULL, NULL),
(5, 31009, 1, 31001, 1542008373, 0, 1, NULL, NULL, NULL),
(6, 31010, 74, 31074, 1542008373, 0, 1, NULL, NULL, NULL),
(7, 31011, 265, 31265, 1542008373, 0, 1, NULL, NULL, NULL),
(8, 31012, 239, 31239, 1542008373, 0, 1, NULL, NULL, NULL),
(9, 31013, 158, 31158, 1542008373, 0, 1, NULL, NULL, NULL),
(10, 31014, 274, 31274, 1542008373, 0, 1, NULL, NULL, NULL),
(11, 31015, 891, 31891, 1542008373, 0, 1, NULL, NULL, NULL),
(12, 31016, 171, 31171, 1542008373, 0, 1, NULL, NULL, NULL),
(13, 31017, 445, 31445, 1542008373, 0, 1, NULL, NULL, NULL),
(14, 31018, 648, 31648, 1542008373, 0, 1, NULL, NULL, NULL),
(15, 31019, 622, 31622, 1542008373, 0, 1, NULL, NULL, NULL),
(16, 31020, 108, 31108, 1542008373, 0, 1, NULL, NULL, NULL),
(17, 31021, 752, 31752, 1542008373, 0, 1, NULL, NULL, NULL),
(18, 31022, 201, 31201, 1542008373, 0, 1, NULL, NULL, NULL),
(19, 31023, 239, 31239, 1542008373, 0, 1, NULL, NULL, NULL),
(20, 31024, 39, 31039, 1542008373, 0, 1, NULL, NULL, NULL),
(21, 31025, 517, 31517, 1542008373, 0, 1, NULL, NULL, NULL),
(22, 31026, 859, 31859, 1542008373, 0, 1, NULL, NULL, NULL),
(23, 31027, 703, 31703, 1542008373, 0, 1, NULL, NULL, NULL),
(24, 31028, 31, 31031, 1542008373, 0, 1, NULL, NULL, NULL),
(25, 31029, 500, 31500, 1542008373, 0, 1, NULL, NULL, NULL),
(26, 31030, 245, 31245, 1542008373, 0, 1, NULL, NULL, NULL),
(27, 31031, 896, 31896, 1542008373, 0, 1, NULL, NULL, NULL),
(28, 31032, 13, 31013, 1542008373, 0, 1, NULL, NULL, NULL),
(29, 31033, 439, 31439, 1542008373, 0, 1, NULL, NULL, NULL),
(30, 31034, 58, 31058, 1542008373, 0, 1, NULL, NULL, NULL),
(31, 31035, 701, 31701, 1542008373, 0, 1, NULL, NULL, NULL),
(32, 31036, 241, 31241, 1542008373, 0, 1, NULL, NULL, NULL),
(33, 31037, 905, 31905, 1542008373, 0, 1, NULL, NULL, NULL),
(34, 31038, 210, 31210, 1542008373, 0, 1, NULL, NULL, NULL),
(35, 31039, 96, 31096, 1542008373, 0, 1, NULL, NULL, NULL),
(36, 31040, 535, 31535, 1542008373, 0, 1, NULL, NULL, NULL),
(37, 31041, 435, 31435, 1542008373, 0, 1, NULL, NULL, NULL),
(38, 31042, 449, 31449, 1542008373, 0, 1, NULL, NULL, NULL),
(39, 31043, 976, 31976, 1542008373, 0, 1, NULL, NULL, NULL),
(40, 31044, 60, 31060, 1542008373, 0, 1, NULL, NULL, NULL),
(41, 31045, 900, 31900, 1542008373, 0, 1, NULL, NULL, NULL),
(42, 31046, 557, 31557, 1542008373, 0, 1, NULL, NULL, NULL),
(43, 31047, 71, 31071, 1542008373, 0, 1, NULL, NULL, NULL),
(44, 31048, 628, 31628, 1542008373, 0, 1, NULL, NULL, NULL),
(45, 31049, 836, 31836, 1542008373, 0, 1, NULL, NULL, NULL),
(46, 31050, 253, 31253, 1542008373, 0, 1, NULL, NULL, NULL),
(47, 264379, 523, 264523, 1542008472, 1, 2, '花花', '13594855871', NULL),
(48, 264378, 502, 264502, 1542008472, 0, 2, NULL, NULL, NULL),
(49, 264377, 16, 264016, 1542008472, 0, 2, NULL, NULL, NULL),
(50, 264376, 580, 264580, 1542008472, 0, 2, NULL, NULL, NULL),
(51, 264375, 153, 264153, 1542008472, 0, 2, NULL, NULL, NULL),
(52, 264374, 514, 264514, 1542008472, 0, 2, NULL, NULL, NULL),
(53, 264373, 965, 264965, 1542008472, 0, 2, NULL, NULL, NULL),
(54, 264372, 825, 264825, 1542008472, 0, 2, NULL, NULL, NULL),
(55, 264371, 974, 264974, 1542008472, 0, 2, NULL, NULL, NULL),
(56, 264370, 18, 264018, 1542008472, 0, 2, NULL, NULL, NULL),
(57, 264369, 366, 264366, 1542008472, 0, 2, NULL, NULL, NULL),
(58, 264368, 210, 264210, 1542008472, 0, 2, NULL, NULL, NULL),
(59, 264367, 545, 264545, 1542008472, 0, 2, NULL, NULL, NULL),
(60, 264366, 716, 264716, 1542008472, 0, 2, NULL, NULL, NULL),
(61, 264365, 845, 264845, 1542008472, 0, 2, NULL, NULL, NULL),
(62, 264364, 355, 264355, 1542008472, 0, 2, NULL, NULL, NULL),
(63, 264363, 161, 264161, 1542008472, 0, 2, NULL, NULL, NULL),
(64, 264362, 892, 264892, 1542008472, 0, 2, NULL, NULL, NULL),
(65, 264361, 173, 264173, 1542008472, 0, 2, NULL, NULL, NULL),
(66, 264360, 181, 264181, 1542008472, 0, 2, NULL, NULL, NULL),
(67, 264359, 490, 264490, 1542008472, 0, 2, NULL, NULL, NULL),
(68, 264358, 266, 264266, 1542008472, 0, 2, NULL, NULL, NULL),
(69, 264357, 808, 264808, 1542008472, 0, 2, NULL, NULL, NULL),
(70, 264356, 97, 264097, 1542008472, 0, 2, NULL, NULL, NULL),
(71, 264355, 516, 264516, 1542008472, 0, 2, NULL, NULL, NULL),
(72, 264354, 285, 264285, 1542008472, 0, 2, NULL, NULL, NULL),
(73, 264353, 680, 264680, 1542008472, 0, 2, NULL, NULL, NULL),
(74, 264352, 324, 264324, 1542008472, 0, 2, NULL, NULL, NULL),
(75, 264351, 109, 264109, 1542008472, 0, 2, NULL, NULL, NULL),
(76, 264350, 478, 264478, 1542008472, 0, 2, NULL, NULL, NULL),
(77, 264349, 166, 264166, 1542008472, 0, 2, NULL, NULL, NULL),
(78, 264348, 252, 264252, 1542008472, 0, 2, NULL, NULL, NULL),
(79, 264347, 453, 264453, 1542008472, 0, 2, NULL, NULL, NULL),
(80, 264346, 390, 264390, 1542008472, 0, 2, NULL, NULL, NULL),
(81, 264345, 208, 264208, 1542008472, 0, 2, NULL, NULL, NULL),
(82, 264344, 43, 264043, 1542008472, 0, 2, NULL, NULL, NULL),
(83, 264343, 916, 264916, 1542008472, 0, 2, NULL, NULL, NULL),
(84, 264342, 573, 264573, 1542008472, 0, 2, NULL, NULL, NULL),
(85, 264341, 142, 264142, 1542008472, 0, 2, NULL, NULL, NULL),
(86, 264340, 264, 264264, 1542008472, 0, 2, NULL, NULL, NULL),
(87, 264339, 993, 264993, 1542008472, 0, 2, NULL, NULL, NULL),
(88, 264338, 470, 264470, 1542008472, 0, 2, NULL, NULL, NULL),
(89, 264337, 961, 264961, 1542008472, 0, 2, NULL, NULL, NULL),
(90, 264336, 679, 264679, 1542008472, 0, 2, NULL, NULL, NULL),
(91, 264335, 43, 264043, 1542008472, 0, 2, NULL, NULL, NULL),
(92, 264334, 703, 264703, 1542008472, 0, 2, NULL, NULL, NULL),
(93, 264333, 89, 264089, 1542008472, 0, 2, NULL, NULL, NULL),
(94, 264332, 56, 264056, 1542008472, 0, 2, NULL, NULL, NULL),
(95, 264331, 460, 264460, 1542008472, 0, 2, NULL, NULL, NULL),
(96, 264330, 827, 264827, 1542008472, 0, 2, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `sent_wx_user`
--

CREATE TABLE IF NOT EXISTS `sent_wx_user` (
  `id` int(10) unsigned NOT NULL,
  `agent_no` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `subscribe` tinyint(4) DEFAULT NULL,
  `openid` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `phone` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '电话',
  `name` varchar(10) CHARACTER SET utf8 DEFAULT NULL COMMENT '姓名',
  `card_id` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '身份证号',
  `shcool` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '学校',
  `k2_status` tinyint(4) DEFAULT NULL COMMENT '科二状态，2:合格  3:不合格',
  `k3_status` tinyint(4) DEFAULT NULL COMMENT '科三状态  2:合格  3:不合格',
  `sex` tinyint(4) DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `province` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `language` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `headimgurl` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `img` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `subscribe_time` int(11) DEFAULT NULL,
  `visit_time` int(11) DEFAULT NULL,
  `lng` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `lat` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `precision` varchar(50) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `sent_wx_user`
--

INSERT INTO `sent_wx_user` (`id`, `agent_no`, `subscribe`, `openid`, `nickname`, `phone`, `name`, `card_id`, `shcool`, `k2_status`, `k3_status`, `sex`, `city`, `country`, `province`, `language`, `headimgurl`, `img`, `subscribe_time`, `visit_time`, `lng`, `lat`, `precision`) VALUES
(7, NULL, NULL, 'o2l0cwqD9xFMwlNrr7BfBCmhLVv8', '花花', NULL, NULL, NULL, NULL, NULL, NULL, 2, '', '安道尔', '', NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLSal9N2KNkoib8MQAU98JLfrLAibYmRWKe9MR0BsWXEkaU2Ohxcia2DlgYXn5XZtIarqxrQBb04jTuQ/132', NULL, 1543033236, NULL, NULL, NULL, NULL),
(2, NULL, NULL, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', 'vip.khan', NULL, NULL, NULL, NULL, NULL, NULL, 2, '', '中国', '贵州', NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/MUWdKOHMagnYfHfoDsupV5Q4AvUJ8AdBVLNTib1luVRUDVUo9NbIbic7AicAhcK8TT8ydBgZaPpIH5hxkVL9DjFXQ/132', NULL, 1543029012, NULL, NULL, NULL, NULL),
(3, NULL, NULL, 'o2l0cwo30rZqIyvIOK7wNQjml968', '琪.', NULL, NULL, NULL, NULL, NULL, NULL, 2, '渝北', '中国', '重庆', NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq0d4KrZsCm0krbSKh83jlU5Z6OUMN6lUnUFa3FiaTR7CNibWr4cYew4zeCh0QMxQavQY8eHqvdpgqw/132', NULL, 1543030561, NULL, NULL, NULL, NULL),
(6, NULL, NULL, 'o2l0cwjjem5xNUH5Is9fUec_jhEE', '老罗', NULL, NULL, NULL, NULL, NULL, NULL, 1, '', '百慕大', '', NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLtzsMP9e5wgyTmDnumoLVRuE73svAghmAmqBIzZHkhF2H0ZtpPh8gkA8ictKoF5OOice5TWCniawZhg/132', NULL, 1543032560, NULL, NULL, NULL, NULL),
(8, NULL, NULL, 'o2l0cwj6bKfp1IlK60lL6exB-sA0', '꯭冯꯭较꯭瘦꯭ 👈 ꯭', NULL, NULL, NULL, NULL, NULL, NULL, 1, '沙坪坝', '中国', '重庆', NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIaSArNlmfEL4IlvxCtaxgiarUXyibkeuibqh46nXf6WZVREibRBHvb9vmKiclTLHicRlbJJVoN575rqquQ/132', NULL, 1543033345, NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sent_action`
--
ALTER TABLE `sent_action`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sent_action_log`
--
ALTER TABLE `sent_action_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `action_ip_ix` (`action_ip`),
  ADD KEY `action_id_ix` (`action_id`),
  ADD KEY `user_id_ix` (`user_id`);

--
-- Indexes for table `sent_activity`
--
ALTER TABLE `sent_activity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sent_ad`
--
ALTER TABLE `sent_ad`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sent_addons`
--
ALTER TABLE `sent_addons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sent_ad_place`
--
ALTER TABLE `sent_ad_place`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sent_apply`
--
ALTER TABLE `sent_apply`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sent_area`
--
ALTER TABLE `sent_area`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `sent_attachment`
--
ALTER TABLE `sent_attachment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_record_status` (`record_id`,`status`);

--
-- Indexes for table `sent_attribute`
--
ALTER TABLE `sent_attribute`
  ADD PRIMARY KEY (`id`),
  ADD KEY `model_id` (`model_id`);

--
-- Indexes for table `sent_auth_extend`
--
ALTER TABLE `sent_auth_extend`
  ADD UNIQUE KEY `group_extend_type` (`group_id`,`extend_id`,`type`),
  ADD KEY `uid` (`group_id`),
  ADD KEY `group_id` (`extend_id`);

--
-- Indexes for table `sent_auth_group`
--
ALTER TABLE `sent_auth_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sent_auth_group_access`
--
ALTER TABLE `sent_auth_group_access`
  ADD UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `sent_auth_group_detail`
--
ALTER TABLE `sent_auth_group_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sent_auth_rule`
--
ALTER TABLE `sent_auth_rule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module` (`module`,`status`,`type`);

--
-- Indexes for table `sent_category`
--
ALTER TABLE `sent_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `sent_channel`
--
ALTER TABLE `sent_channel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `sent_code`
--
ALTER TABLE `sent_code`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sent_config`
--
ALTER TABLE `sent_config`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`),
  ADD KEY `group` (`group`);

--
-- Indexes for table `sent_coupon`
--
ALTER TABLE `sent_coupon`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sent_department`
--
ALTER TABLE `sent_department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sent_develop`
--
ALTER TABLE `sent_develop`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sent_district`
--
ALTER TABLE `sent_district`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sent_document`
--
ALTER TABLE `sent_document`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_category_status` (`category_id`,`status`);

--
-- Indexes for table `sent_document_article`
--
ALTER TABLE `sent_document_article`
  ADD PRIMARY KEY (`doc_id`);

--
-- Indexes for table `sent_document_photo`
--
ALTER TABLE `sent_document_photo`
  ADD PRIMARY KEY (`doc_id`);

--
-- Indexes for table `sent_feedback`
--
ALTER TABLE `sent_feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sent_file`
--
ALTER TABLE `sent_file`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sent_grade`
--
ALTER TABLE `sent_grade`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sent_hooks`
--
ALTER TABLE `sent_hooks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `sent_link`
--
ALTER TABLE `sent_link`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sent_member`
--
ALTER TABLE `sent_member`
  ADD PRIMARY KEY (`uid`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `sent_member_extend`
--
ALTER TABLE `sent_member_extend`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `sent_member_extend_group`
--
ALTER TABLE `sent_member_extend_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sent_member_extend_setting`
--
ALTER TABLE `sent_member_extend_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sent_menu`
--
ALTER TABLE `sent_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `sent_model`
--
ALTER TABLE `sent_model`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sent_outfit`
--
ALTER TABLE `sent_outfit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sent_page`
--
ALTER TABLE `sent_page`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sent_partner`
--
ALTER TABLE `sent_partner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sent_person`
--
ALTER TABLE `sent_person`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `sent_picture`
--
ALTER TABLE `sent_picture`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sent_rewrite`
--
ALTER TABLE `sent_rewrite`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sent_school`
--
ALTER TABLE `sent_school`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sent_seo_rule`
--
ALTER TABLE `sent_seo_rule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sent_station`
--
ALTER TABLE `sent_station`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sent_student`
--
ALTER TABLE `sent_student`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sent_test`
--
ALTER TABLE `sent_test`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sent_wx_user`
--
ALTER TABLE `sent_wx_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`),
  ADD KEY `agent_no` (`agent_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sent_action`
--
ALTER TABLE `sent_action`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `sent_action_log`
--
ALTER TABLE `sent_action_log`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=201;
--
-- AUTO_INCREMENT for table `sent_activity`
--
ALTER TABLE `sent_activity`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `sent_ad`
--
ALTER TABLE `sent_ad`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `sent_addons`
--
ALTER TABLE `sent_addons`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `sent_ad_place`
--
ALTER TABLE `sent_ad_place`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sent_apply`
--
ALTER TABLE `sent_apply`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sent_area`
--
ALTER TABLE `sent_area`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `sent_attachment`
--
ALTER TABLE `sent_attachment`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sent_attribute`
--
ALTER TABLE `sent_attribute`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=55;
--
-- AUTO_INCREMENT for table `sent_auth_group`
--
ALTER TABLE `sent_auth_group`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `sent_auth_group_detail`
--
ALTER TABLE `sent_auth_group_detail`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `sent_auth_rule`
--
ALTER TABLE `sent_auth_rule`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',AUTO_INCREMENT=96;
--
-- AUTO_INCREMENT for table `sent_category`
--
ALTER TABLE `sent_category`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `sent_channel`
--
ALTER TABLE `sent_channel`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '频道ID',AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `sent_code`
--
ALTER TABLE `sent_code`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `sent_config`
--
ALTER TABLE `sent_config`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `sent_coupon`
--
ALTER TABLE `sent_coupon`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `sent_department`
--
ALTER TABLE `sent_department`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '部门ID',AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `sent_develop`
--
ALTER TABLE `sent_develop`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sent_district`
--
ALTER TABLE `sent_district`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=45052;
--
-- AUTO_INCREMENT for table `sent_document`
--
ALTER TABLE `sent_document`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',AUTO_INCREMENT=65;
--
-- AUTO_INCREMENT for table `sent_document_article`
--
ALTER TABLE `sent_document_article`
  MODIFY `doc_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `sent_document_photo`
--
ALTER TABLE `sent_document_photo`
  MODIFY `doc_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `sent_feedback`
--
ALTER TABLE `sent_feedback`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `sent_file`
--
ALTER TABLE `sent_file`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件ID';
--
-- AUTO_INCREMENT for table `sent_grade`
--
ALTER TABLE `sent_grade`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `sent_hooks`
--
ALTER TABLE `sent_hooks`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `sent_link`
--
ALTER TABLE `sent_link`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT COMMENT '标识ID',AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `sent_member`
--
ALTER TABLE `sent_member`
  MODIFY `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `sent_member_extend_group`
--
ALTER TABLE `sent_member_extend_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sent_member_extend_setting`
--
ALTER TABLE `sent_member_extend_setting`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sent_menu`
--
ALTER TABLE `sent_menu`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',AUTO_INCREMENT=68;
--
-- AUTO_INCREMENT for table `sent_model`
--
ALTER TABLE `sent_model`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模型ID',AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `sent_outfit`
--
ALTER TABLE `sent_outfit`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `sent_page`
--
ALTER TABLE `sent_page`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `sent_partner`
--
ALTER TABLE `sent_partner`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sent_person`
--
ALTER TABLE `sent_person`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `sent_picture`
--
ALTER TABLE `sent_picture`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',AUTO_INCREMENT=179;
--
-- AUTO_INCREMENT for table `sent_rewrite`
--
ALTER TABLE `sent_rewrite`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增';
--
-- AUTO_INCREMENT for table `sent_school`
--
ALTER TABLE `sent_school`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `sent_seo_rule`
--
ALTER TABLE `sent_seo_rule`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '唯一标识',AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `sent_station`
--
ALTER TABLE `sent_station`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `sent_student`
--
ALTER TABLE `sent_student`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sent_test`
--
ALTER TABLE `sent_test`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=97;
--
-- AUTO_INCREMENT for table `sent_wx_user`
--
ALTER TABLE `sent_wx_user`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
