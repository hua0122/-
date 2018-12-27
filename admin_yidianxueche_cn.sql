-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2018-12-26 07:32:38
-- 服务器版本： 5.6.29-log
-- PHP Version: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `admin.yidianxueche.cn`
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
) ENGINE=MyISAM AUTO_INCREMENT=204 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表';

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
(200, 10, 1, 2130706433, 'Menu', 55, '操作url：/admin/menu/edit/id/55.html', 1, 1542447735),
(201, 10, 1, 2002087473, 'Menu', 1, '操作url：/admin/menu/add/pid/6.html', 1, 1543648823),
(202, 10, 1, 2002086281, 'Menu', 39, '操作url：/admin/menu/edit/id/39.html', 1, 1543981411),
(203, 10, 1, 2002086281, 'Menu', 40, '操作url：/admin/menu/edit/id/40.html', 1, 1543981426);

-- --------------------------------------------------------

--
-- 表的结构 `sent_activity`
--

CREATE TABLE IF NOT EXISTS `sent_activity` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '名称',
  `amount` int(11) DEFAULT NULL COMMENT '金额',
  `gift` varchar(255) DEFAULT NULL COMMENT '礼物名称',
  `online_time` int(11) NOT NULL COMMENT '上线时间',
  `downline_time` int(11) NOT NULL COMMENT '下线时间',
  `number` int(11) NOT NULL DEFAULT '0' COMMENT '报名人数',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态 1:上线 0:下线',
  `description` varchar(300) NOT NULL COMMENT '活动介绍',
  `type` tinyint(4) NOT NULL COMMENT '活动类型(1:报名送（减） 2:团报送（减）3：报名加钱送物（+）)',
  `icon` int(11) NOT NULL COMMENT '活动图标',
  `two_amount` int(11) DEFAULT NULL COMMENT '两人团优惠金额',
  `three_amount` int(11) DEFAULT NULL COMMENT '三人团优惠金额',
  `five_amount` int(11) DEFAULT NULL COMMENT '五人团优惠金额',
  `tels` varchar(200) DEFAULT NULL COMMENT '团报人电话号码',
  `what` tinyint(4) DEFAULT NULL COMMENT '送啥(1:钱 2:物)',
  `school_id` smallint(6) NOT NULL DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='活动管理';

--
-- 转存表中的数据 `sent_activity`
--

INSERT INTO `sent_activity` (`id`, `name`, `amount`, `gift`, `online_time`, `downline_time`, `number`, `status`, `description`, `type`, `icon`, `two_amount`, `three_amount`, `five_amount`, `tels`, `what`, `school_id`) VALUES
(4, '报名立减', 200, '', 1542331215, 1544543203, 9, 0, '直接报名可享受\r\n200元学费减免', 1, 82, 3, 0, 0, '', 1, 1),
(5, '团报优惠', 0, '', 1542333428, 1543909149, 0, 0, '两人团减免100元\r\n三人团减免200元\r\n五人团减免300元', 2, 83, 100, 200, 300, '', 1, 1),
(6, '加就送', 200, '跑步机', 1542334023, 1544543203, 0, 0, '报名加200元赠送价值888元跑步机一台\r\n阿斯蒂芬\r\n阿斯顿发斯蒂芬完全二确认抢人头\r\n阿斯蒂芬阿道夫阿斯', 3, 178, 0, 0, 0, '', 2, 1),
(7, '送优惠券', 0, '优惠券', 1542334273, 1542334273, 0, 0, '报名就送优惠券', 1, 84, 0, 0, 0, '', 2, 1),
(8, '测试', 100, '', 1544687842, 1545807622, 0, 1, '123', 1, 295, 0, 0, 0, NULL, 1, 1),
(9, '1', 0, '111', 1544692383, 1545879003, 0, 1, '1111', 1, 297, 0, 0, 0, NULL, 2, 1),
(10, '报名立减500元，等你来参与', 0, '', 1544774706, 1544774706, 0, 1, '即日起报名普通班立减500元', 1, 311, 0, 0, 0, NULL, 1, 6),
(11, '报名赠送自行车一辆', 300, '', 1545122369, 1545156029, 0, 1, '报名赠送自行车一辆', 1, 333, 0, 0, 0, NULL, 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `sent_activity_user`
--

CREATE TABLE IF NOT EXISTS `sent_activity_user` (
  `id` int(11) unsigned NOT NULL,
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `tel` varchar(15) NOT NULL COMMENT '电话',
  `amount` decimal(8,2) DEFAULT NULL COMMENT '预存金额',
  `pid` int(11) DEFAULT '0' COMMENT '父级',
  `is_prestore` tinyint(4) DEFAULT '0' COMMENT '是否预存 0否1是',
  `luck_name` varchar(100) DEFAULT NULL COMMENT '奖品名称',
  `school_id` int(11) NOT NULL DEFAULT '1' COMMENT '学校ID',
  `prestore_time` int(11) DEFAULT NULL COMMENT '预存时间',
  `add_time` int(11) DEFAULT NULL COMMENT '首次登录时间',
  `update_time` int(11) DEFAULT NULL COMMENT '最后一次登录时间',
  `is_sign` tinyint(4) DEFAULT '0' COMMENT '是否报名（1：已报名 0：未报名）',
  `is_share` tinyint(4) DEFAULT '0',
  `total_amount` int(11) DEFAULT '0',
  `sn` varchar(50) DEFAULT NULL COMMENT '订单号',
  `is_pay` tinyint(4) DEFAULT '0' COMMENT '是否支付 1已支付  0未支付',
  `pay_date` int(11) DEFAULT NULL COMMENT '支付时间',
  `num` int(11) DEFAULT '0' COMMENT '邀请人数'
) ENGINE=MyISAM AUTO_INCREMENT=194 DEFAULT CHARSET=utf8 COMMENT='活动参与人';

--
-- 转存表中的数据 `sent_activity_user`
--

INSERT INTO `sent_activity_user` (`id`, `name`, `tel`, `amount`, `pid`, `is_prestore`, `luck_name`, `school_id`, `prestore_time`, `add_time`, `update_time`, `is_sign`, `is_share`, `total_amount`, `sn`, `is_pay`, `pay_date`, `num`) VALUES
(1, '123', '13333333333', NULL, 0, 0, NULL, 3, NULL, 1545647985, 1545647985, 0, 0, 0, NULL, 0, NULL, 0),
(3, '123', '15222222222', NULL, 0, 0, NULL, 2, NULL, 1545648426, 1545648426, 0, 0, 0, NULL, 0, NULL, 0),
(4, '156', '15666666666', '100.00', 0, 1, NULL, 6, 1545649181, 1545648449, 1545649181, 0, 1, 0, 'yc_CxahmyeAqBvEfrRNQLfC', 0, NULL, 0),
(5, '123', '15555555555', NULL, 0, 0, NULL, 5, NULL, 1545648466, 1545648466, 0, 0, 0, NULL, 0, NULL, 0),
(6, '蒋学勇', '15223474637', '100.00', 0, 1, '很遗憾,未中奖', 5, 1545742368, 1545653110, 1545742368, 0, 1, 100, 'yc_TOhwUBxymzSKAjBfJKIo', 0, NULL, 0),
(7, '123', '15333333333', '100.00', 0, 1, NULL, 3, 1545807282, 1545653167, 1545807610, 0, 1, 100, 'yc_QZnMNoWiNaopluxOdTVL', 0, NULL, 0),
(8, '谢俊胜', '15523566844', NULL, 0, 0, NULL, 1, NULL, 1545657966, 1545657966, 0, 0, 0, NULL, 0, NULL, 0),
(9, '梁开欣', '13350370668', '100.00', 0, 1, NULL, 5, 1545748883, 1545658923, 1545748883, 0, 0, 0, 'yc_djnLvrxDwQYlHgnPmqkV', 0, NULL, 0),
(10, '陈维', '18523542108', '100.00', 0, 1, NULL, 5, 1545659143, 1545658928, 1545659143, 0, 1, 0, 'yc_OneQNPMQzIDmWVchNNWB', 0, NULL, 0),
(11, '李洪彬', '15223041441', '100.00', 0, 1, '100元秀火锅现金券', 5, 1545662808, 1545658953, 1545662808, 0, 1, 200, 'yc_MxrzLnUgWekeXrcDNYRH', 0, NULL, 1),
(12, '田兴翠', '13048452463', '100.00', 0, 1, NULL, 5, 1545664691, 1545659006, 1545664691, 0, 0, 0, 'yc_oQhNMzkpjlAvvwbcTzFF', 0, NULL, 0),
(13, '刘艳', '18875280294', '100.00', 0, 1, NULL, 5, 1545659109, 1545659097, 1545659109, 0, 0, 0, 'yc_VldljEVtWWXKojEbNsFd', 0, NULL, 0),
(14, '谢艳玲', '17383087432', '100.00', 11, 1, '很遗憾,未中奖', 5, 1545660385, 1545660364, 1545660403, 0, 1, 400, 'yc_eFIUUDULTgznsKqGTulL', 1, 1545660403, 0),
(15, '田和昆', '17725077333', '100.00', 0, 1, NULL, 3, 1545660788, 1545660755, 1545660788, 0, 1, 0, 'yc_QZKDMkirismZYqglxXqy', 0, NULL, 0),
(16, '左强', '18223257103', '100.00', 0, 1, NULL, 3, 1545736067, 1545660805, 1545736067, 0, 1, 0, 'yc_zipVqcvldlRDaADMYqgz', 0, NULL, 0),
(17, '隗彬', '15523224114', '100.00', 0, 1, NULL, 3, 1545660935, 1545660842, 1545660935, 0, 0, 0, 'yc_EnRXvxhiRIFdRgZTbDJG', 0, NULL, 0),
(18, '周新伟', '18842985768', '100.00', 0, 1, NULL, 3, 1545660861, 1545660844, 1545660861, 0, 1, 0, 'yc_dqUkWaNBgnguNciPFfXk', 0, NULL, 0),
(19, '何晓盼', '18883606046', '100.00', 0, 1, NULL, 4, 1545664310, 1545660912, 1545664310, 0, 0, 0, 'yc_PDWVzvKwGEyfRKQaspPQ', 0, NULL, 0),
(20, '魏佳欢', '15142170208', '100.00', 0, 1, NULL, 3, 1545792147, 1545661022, 1545792171, 0, 1, 400, 'yc_dxWyEiAnYnFbStCdDJXn', 1, 1545792171, 1),
(21, '王成艺', '17338352414', '100.00', 0, 1, '很遗憾,未中奖', 3, 1545661874, 1545661868, 1545661874, 0, 1, 100, 'yc_sTmNLRUGmKxEDWilyNUG', 0, NULL, 0),
(22, '袁静', '15923067506', NULL, 18, 0, NULL, 3, NULL, 1545662504, 1545662504, 0, 0, 0, NULL, 0, NULL, 0),
(23, '沈丹丹', '17784294470', '100.00', 0, 1, NULL, 5, 1545737929, 1545662828, 1545737929, 0, 1, 0, 'yc_zsSVUPwUSuEFrTHifTDG', 0, NULL, 0),
(24, '张林', '18883182297', '100.00', 0, 1, NULL, 4, 1545664254, 1545664250, 1545750277, 0, 0, 0, 'yc_YYMiNAtZDpWPXfJHaayx', 0, NULL, 0),
(25, '王姝蘅', '15825984373', '100.00', 0, 1, NULL, 4, 1545750178, 1545664255, 1545750178, 0, 0, 0, 'yc_ACUciglxiCJjzTnyVymz', 0, NULL, 0),
(26, '杨仕林', '17623402012', '100.00', 0, 1, NULL, 4, 1545664272, 1545664268, 1545664272, 0, 0, 0, 'yc_TKMzJWaOmebbGDsSKygo', 0, NULL, 0),
(27, '陈烬', '15736321640', '100.00', 0, 1, NULL, 4, 1545666271, 1545666251, 1545666271, 0, 1, 100, 'yc_SbEHIKgvsuBxlwEboFTc', 0, NULL, 0),
(28, '曾艳', '15202348036', '100.00', 0, 1, '很遗憾,未中奖', 4, 1545667602, 1545667599, 1545702328, 0, 1, 700, 'yc_QDDiQDdJeECISpLEmJBz', 1, 1545667611, 3),
(29, '唐志祥', '17815379793', '100.00', 0, 1, '100元秀火锅现金券', 4, 1545758899, 1545668421, 1545758899, 0, 1, 100, 'yc_JBdUXnjTFaqRNvffhEyw', 0, NULL, 0),
(30, '王科', '18225137003', NULL, 0, 0, NULL, 4, NULL, 1545668532, 1545668532, 0, 1, 100, NULL, 0, NULL, 1),
(31, '丁雪', '13330301323', '100.00', 28, 1, NULL, 4, 1545669191, 1545668979, 1545669218, 0, 0, 300, 'yc_jnNzkBTUOAEBEJkTupst', 1, 1545669218, 0),
(32, '张家鑫', '13453256754', '100.00', 30, 1, NULL, 4, 1545670245, 1545670222, 1545670245, 0, 0, 0, 'yc_TJWeGDDmShYLLtRtfTQO', 0, NULL, 0),
(33, '夏家豪', '15023666053', '100.00', 0, 1, '100元秀火锅现金券', 4, 1545672457, 1545672453, 1545732647, 0, 1, 0, 'yc_WJllamvVETWLoBBSKahn', 0, NULL, 0),
(34, '花花', '13594855872', '0.01', 0, 1, NULL, 6, 1545808809, 1545701727, 1545808809, 0, 0, 900, 'yc_henroQUsOXPdyhGSTJDO', 0, 1545805717, 0),
(35, '啦啦啦', '18375928109', '100.00', 0, 1, '100元秀火锅现金券', 6, 1545808323, 1545701874, 1545809169, 0, 1, 1300, 'yc_zfRPqWfVwkHugxMYoJgS', 1, 1545809169, 0),
(36, '樊远江', '15334537865', '100.00', 0, 1, '很遗憾,未中奖', 6, 1545801352, 1545707375, 1545801352, 0, 1, 100, 'yc_fgUMKfVDazPFYdzAlGXX', 0, NULL, 1),
(37, '曹志祥', '15084384134', '100.00', 0, 1, '100元秀火锅现金券', 2, 1545799695, 1545709538, 1545799695, 0, 1, 100, 'yc_aXpjSYxjPaXnbuPuwJyN', 0, NULL, 1),
(38, '黄美术', '17782249077', '100.00', 0, 1, NULL, 6, 1545710572, 1545710568, 1545710572, 0, 0, 0, 'yc_RdzfrmEyKnNCdfrZyeXw', 0, NULL, 0),
(39, '范志洪', '18875280680', '100.00', 0, 1, '很遗憾,未中奖', 4, 1545736269, 1545710705, 1545736269, 0, 1, 100, 'yc_TUYulNypwVMyWzKGdOjE', 0, NULL, 0),
(40, '董佳明', '17784726708', '100.00', 0, 1, '很遗憾,未中奖', 6, 1545711187, 1545711094, 1545718890, 0, 1, 700, 'yc_mrJcavTkVIWKIVMIkxHt', 1, 1545711195, 3),
(41, '温择', '17784722456', NULL, 0, 0, NULL, 6, NULL, 1545711865, 1545711865, 0, 1, 100, NULL, 0, NULL, 1),
(42, '陈力', '15823169050', '100.00', 41, 1, NULL, 6, 1545711986, 1545711982, 1545712003, 0, 0, 300, 'yc_HCblpRiOTtDxuTPFxkMs', 1, 1545712003, 0),
(43, '彭林', '18290512996', '100.00', 40, 1, NULL, 6, 1545712075, 1545712071, 1545712083, 0, 1, 400, 'yc_xWUFKVtffMaWgtHYbuDt', 1, 1545712083, 1),
(44, '郎昊', '18315033493', '100.00', 0, 1, NULL, 6, 1545718074, 1545712211, 1545718074, 0, 0, 0, 'yc_MdHJNfcLqHgUppvYujoa', 0, NULL, 0),
(45, '谭鹏', '15223546872', '100.00', 43, 1, NULL, 6, 1545712513, 1545712500, 1545712521, 0, 0, 300, 'yc_MGNGJBouuBweCrkCoxgL', 1, 1545712521, 0),
(46, '张国善', '17723898165', '100.00', 0, 1, '100元秀火锅现金券', 5, 1545806159, 1545712771, 1545806159, 0, 1, 100, 'yc_ZfrIYFGXVwzlZbqivBPf', 0, NULL, 1),
(47, '李汶峰', '13220208856', '100.00', 0, 1, NULL, 5, 1545713186, 1545713174, 1545713186, 0, 0, 0, 'yc_yAvNzLnlSKtwsICVrJFP', 0, NULL, 0),
(48, '雷正楠', '17602843498', '100.00', 36, 1, NULL, 6, 1545713279, 1545713272, 1545713609, 0, 0, 300, 'yc_ZhYbwTgFPtNJFfkFqdji', 1, 1545713288, 0),
(49, '段辉', '17784728234', '100.00', 40, 1, NULL, 6, 1545714745, 1545714676, 1545714755, 0, 0, 300, 'yc_IRmsPmGNtrpFtQnTeKnl', 1, 1545714755, 0),
(50, '罗涛', '15182541009', '100.00', 0, 1, '品牌充电宝1个', 3, 1545724865, 1545715470, 1545731153, 0, 1, 100, 'yc_qGGhWIHpdBSKLLSIwEtK', 0, NULL, 1),
(51, '陈代勇', '18306073956', NULL, 50, 0, NULL, 3, NULL, 1545716992, 1545724820, 0, 0, 0, NULL, 0, NULL, 0),
(52, '冉茂权', '13068384040', NULL, 50, 0, NULL, 3, NULL, 1545717158, 1545717158, 0, 0, 0, NULL, 0, NULL, 0),
(53, '黎玲', '17815336247', '100.00', 37, 1, NULL, 2, 1545717255, 1545717240, 1545717255, 0, 0, 0, 'yc_YMOfAsZTEKTtKSgjhauj', 0, NULL, 0),
(54, '刘兴宇', '18996635902', '100.00', 0, 1, NULL, 1, 1545726233, 1545717305, 1545726233, 0, 0, 0, 'yc_RlqogGVTXHomkJfdLzpB', 0, NULL, 0),
(55, '户华', '18290290440', '100.00', 0, 1, '100元秀火锅现金券', 1, 1545725252, 1545717456, 1545725268, 0, 1, 400, 'yc_KPkCqCOUJsyJqWDUWTvT', 1, 1545725268, 0),
(56, '谭江林', '15730134009', '100.00', 0, 1, NULL, 1, 1545801161, 1545717508, 1545801216, 0, 1, 0, 'yc_MZvbrHUxJeyXVRyWFabg', 0, NULL, 0),
(57, '吴鹏', '18225324516', NULL, 0, 0, NULL, 5, NULL, 1545717739, 1545717739, 0, 0, 0, NULL, 0, NULL, 0),
(58, '陈玄', '15086855066', '100.00', 0, 1, NULL, 6, 1545805362, 1545718319, 1545805362, 0, 1, 100, 'yc_bjivSsxStAgEnGWkbRHc', 0, NULL, 0),
(59, '吴祖鹏', '15501816530', '100.00', 0, 1, NULL, 6, 1545718396, 1545718394, 1545718411, 0, 0, 300, 'yc_GgNrbbtjgcBDQjiTxqkC', 1, 1545718411, 0),
(60, '余兴丹', '15523731604', '100.00', 0, 1, NULL, 1, 1545808023, 1545719358, 1545808023, 0, 1, 100, 'yc_vyskEUBmSfUSeweXeBKq', 0, NULL, 0),
(61, '蔡长宪', '15923315441', NULL, 50, 0, NULL, 3, NULL, 1545720139, 1545720139, 0, 0, 0, NULL, 0, NULL, 0),
(62, '申锐', '18875164509', '100.00', 0, 1, NULL, 1, 1545720895, 1545720739, 1545720895, 0, 0, 0, 'yc_bIkrqlUwHGbfDxsMNHYT', 0, NULL, 0),
(63, '杨艳琳', '18875281193', '100.00', 0, 1, NULL, 4, 1545742285, 1545720968, 1545742285, 0, 0, 0, 'yc_PwycQWjHWQlnWXuuQimP', 0, NULL, 0),
(64, '师子齐', '15298033487', '100.00', 0, 1, '很遗憾,未中奖', 4, 1545721700, 1545721575, 1545721707, 0, 1, 500, 'yc_qboiWlTpXPSJXISFaVaU', 1, 1545721707, 1),
(65, '周渝', '15023039886', '100.00', 50, 1, '100元秀火锅现金券', 3, 1545722168, 1545721626, 1545722168, 0, 1, 100, 'yc_dwzaRlAUspMsUZEymOYI', 0, NULL, 0),
(66, '刘明珠', '18325074742', '100.00', 0, 1, NULL, 1, 1545726604, 1545721974, 1545726604, 0, 0, 0, 'yc_oaLbQhTzOkieuqbMYvLR', 0, NULL, 0),
(67, '龙雨', '17623183327', '100.00', 0, 1, '100元秀火锅现金券', 4, 1545722292, 1545722233, 1545734346, 0, 1, 600, 'yc_aGvsZrmsRIRtGEFDYSRM', 1, 1545722313, 2),
(68, '周双', '18716322662', '100.00', 67, 1, '100元秀火锅现金券', 4, 1545723004, 1545722893, 1545723014, 0, 1, 500, 'yc_FXCnVlBzRdlLTcErgBMD', 1, 1545723014, 1),
(69, '王钰', '19970892017', '100.00', 0, 1, '很遗憾,未中奖', 1, 1545801821, 1545723568, 1545801821, 0, 1, 400, 'yc_wKTnIEwsioaarkopbXQe', 0, NULL, 3),
(70, '唐海洋', '17623019379', '100.00', 68, 1, '100元秀火锅现金券', 4, 1545723598, 1545723584, 1545723608, 0, 1, 400, 'yc_oBihIKSyZuiqYUlLMFwj', 1, 1545723608, 0),
(71, '高源', '18375702644', '100.00', 28, 1, '很遗憾,未中奖', 4, 1545724027, 1545723938, 1545724041, 0, 1, 300, 'yc_XAkYTYmrleXhjifdQoBI', 1, 1545724041, 0),
(72, '苏昕', '18323486005', '100.00', 0, 1, '品牌充电宝1个', 1, 1545724152, 1545724150, 1545726447, 0, 1, 800, 'yc_gSPdETLoAptxYwJCsRFQ', 0, NULL, 7),
(73, '李勇', '18716330039', '100.00', 0, 1, '100元秀火锅现金券', 4, 1545726316, 1545724916, 1545726316, 0, 1, 100, 'yc_PCPNSTEqBAnAOgStKVNb', 0, NULL, 1),
(74, '任波凡', '15320395242', '100.00', 0, 1, NULL, 1, 1545725603, 1545725212, 1545725603, 0, 0, 0, 'yc_IQCQikhqwWEvMDUpAtSs', 0, NULL, 0),
(75, '周江平', '17754928731', '100.00', 0, 1, '很遗憾,未中奖', 1, 1545749487, 1545725249, 1545749589, 0, 1, 100, 'yc_JzftqZngBwjnTAdjNvqd', 0, NULL, 0),
(76, '徐家亮', '17347912434', NULL, 0, 0, NULL, 1, NULL, 1545725590, 1545749574, 0, 1, 0, NULL, 0, NULL, 0),
(77, '田康', '18883087898', '100.00', 0, 1, NULL, 1, 1545725616, 1545725611, 1545725616, 0, 1, 0, 'yc_XxBmAojsIsfLMDUtbAbc', 0, NULL, 0),
(78, '王鹏', '17725024068', '100.00', 0, 1, NULL, 3, 1545725775, 1545725773, 1545725775, 0, 0, 0, 'yc_CqyFaeyjogQPXoHHQfkj', 0, NULL, 0),
(79, '张宇', '18423018158', '100.00', 73, 1, NULL, 4, 1545726206, 1545726012, 1545726214, 0, 1, 400, 'yc_XJksAZvGLMTIrsKFKyQf', 1, 1545726214, 0),
(80, '杨中润', '15736529629', '100.00', 28, 1, NULL, 4, 1545726385, 1545726063, 1545726411, 0, 0, 300, 'yc_dPCldxNCVjRgLGRzjGYq', 1, 1545726411, 0),
(81, '龚欢', '13896900800', '100.00', 0, 1, '很遗憾,未中奖', 4, 1545726096, 1545726065, 1545726138, 0, 1, 400, 'yc_rpYbQFjuiLZxrWRkRlTK', 1, 1545726138, 0),
(82, '何保伦', '15223866453', '100.00', 0, 1, NULL, 1, 1545726251, 1545726246, 1545727220, 0, 0, 0, 'yc_ibkjIyjMsiAFdHPuYIwy', 0, NULL, 0),
(83, '梁夏', '15223444624', NULL, 0, 0, NULL, 4, NULL, 1545726544, 1545726544, 0, 1, 0, NULL, 0, NULL, 0),
(84, '赵飞', '15082099942', '100.00', 0, 1, NULL, 1, 1545726608, 1545726585, 1545726608, 0, 0, 0, 'yc_yerauXcaFpzuIrPFCmRW', 0, NULL, 0),
(85, '程小燕', '18423461075', NULL, 0, 0, '很遗憾,未中奖', 1, NULL, 1545726743, 1545806059, 0, 1, 100, NULL, 0, NULL, 0),
(86, '陈晓雪', '15823659367', '100.00', 0, 1, NULL, 1, 1545726882, 1545726859, 1545726881, 0, 0, 0, 'yc_FRlPzdCOZFrqFMYmsSMd', 0, NULL, 0),
(87, '冉红', '18315229005', '100.00', 0, 1, NULL, 1, 1545726968, 1545726960, 1545726968, 0, 0, 0, 'yc_IlQZzGNNBCehKxCDbhdX', 0, NULL, 0),
(88, '何翰霖', '18184054702', NULL, 0, 0, '很遗憾,未中奖', 3, NULL, 1545727012, 1545727012, 0, 1, 200, NULL, 0, NULL, 2),
(89, '刘方亮', '18182216477', '100.00', 88, 1, '100元秀火锅现金券', 3, 1545727101, 1545727090, 1545727131, 0, 1, 400, 'yc_RrEAEDIhNWxRRedOdkfi', 1, 1545727131, 0),
(90, '王升筱', '15736567131', '100.00', 88, 1, '100元秀火锅现金券', 3, 1545727113, 1545727104, 1545727144, 0, 1, 400, 'yc_QcPhoyyaYICJEPjDqmqb', 1, 1545727144, 0),
(91, '夏佳欣', '13983770093', '100.00', 0, 1, NULL, 1, 1545727120, 1545727112, 1545727120, 0, 0, 0, 'yc_HoTFwOVAKdAuXmbyxmtw', 0, NULL, 0),
(92, '郝晨宇', '18636737788', NULL, 0, 0, NULL, 1, NULL, 1545727393, 1545727393, 0, 0, 0, NULL, 0, NULL, 0),
(93, '万梓杰', '15823903405', '100.00', 0, 1, '100元秀火锅现金券', 3, 1545727819, 1545727446, 1545727819, 0, 1, 100, 'yc_sLDJvcJoaEukYnwujezE', 0, NULL, 0),
(94, '123', '15111111111', NULL, 0, 0, NULL, 1, NULL, 1545728221, 1545728221, 0, 0, 0, NULL, 0, NULL, 0),
(95, '牛启华', '18290537841', '100.00', 83, 1, NULL, 4, 1545734108, 1545728370, 1545734108, 0, 1, 0, 'yc_LhMNROpOsAdLDkilYNaq', 0, NULL, 0),
(96, '陈新怀', '13098623074', '100.00', 0, 1, NULL, 1, 1545749393, 1545730710, 1545749393, 0, 1, 0, 'yc_RThHYuDPQGiJCoOYIDKv', 0, NULL, 0),
(97, '杨柳', '18883280187', NULL, 0, 0, '100元秀火锅现金券', 1, NULL, 1545731466, 1545731466, 0, 1, 100, NULL, 0, NULL, 1),
(98, '童庆瑜', '15579819095', NULL, 0, 0, NULL, 1, NULL, 1545732295, 1545732295, 0, 1, 0, NULL, 0, NULL, 0),
(99, '陈怡君', '18581371209', NULL, 36, 0, NULL, 6, NULL, 1545732306, 1545732306, 0, 0, 0, NULL, 0, NULL, 0),
(100, '雷浩', '19922944660', NULL, 33, 0, NULL, 4, NULL, 1545732681, 1545732681, 0, 0, 0, NULL, 0, NULL, 0),
(101, '尹鹏', '17602388075', '100.00', 67, 1, '100元秀火锅现金券', 4, 1545733757, 1545733740, 1545734181, 0, 1, 400, 'yc_UnKXPTvkXUzNEQRRrlqM', 1, 1545733766, 0),
(102, '夏玉龙', '18523766824', NULL, 50, 0, NULL, 3, NULL, 1545734590, 1545734590, 0, 1, 0, NULL, 0, NULL, 0),
(103, '邓潇', '13368386336', '100.00', 16, 1, '100元秀火锅现金券', 3, 1545736661, 1545736654, 1545736661, 0, 1, 100, 'yc_kotZFCdGcrSOwufbrtBu', 0, NULL, 0),
(104, '李广', '17815378743', '100.00', 64, 1, NULL, 4, 1545736773, 1545736770, 1545736799, 0, 1, 400, 'yc_sgSTvpygyKQKaIEhuMzZ', 1, 1545736799, 0),
(105, '张善军', '15696683072', '100.00', 83, 1, '100元秀火锅现金券', 4, 1545738148, 1545738137, 1545738148, 0, 1, 100, 'yc_SPFRVLYISOBGlTZlVmdt', 0, NULL, 0),
(106, '唐辉贵', '18398497538', '100.00', 0, 1, NULL, 4, 1545738248, 1545738221, 1545738248, 0, 0, 0, 'yc_jmCJDSXawkfjcfrRvzia', 0, NULL, 0),
(107, '李庆攀', '18723771223', NULL, 0, 0, NULL, 5, NULL, 1545740213, 1545740213, 0, 0, 0, NULL, 0, NULL, 0),
(108, '李益', '17623308694', NULL, 21, 0, NULL, 3, NULL, 1545740418, 1545740418, 0, 0, 0, NULL, 0, NULL, 0),
(109, '李渝涛', '15703060835', '100.00', 0, 1, NULL, 4, 1545741973, 1545741965, 1545741973, 0, 0, 0, 'yc_FbNlaNDXfboYTZyrSqNe', 0, NULL, 0),
(193, '123', '15444444444', '100.00', 7, 1, NULL, 3, 1545807582, 1545807538, 1545807582, 0, 0, 0, 'yc_wJVGskYICEPPzZWiirjg', 0, NULL, 0),
(110, '唐鹏飞', '13350129707', '100.00', 0, 1, NULL, 4, 1545742286, 1545742264, 1545742855, 0, 0, 0, 'yc_UyVWNvEcIpBLztFXCgiP', 0, NULL, 0),
(111, '万怡', '17815378758', NULL, 0, 0, NULL, 4, NULL, 1545742270, 1545742270, 0, 0, 0, NULL, 0, NULL, 0),
(112, '冯霜蓉', '18423249381', '100.00', 0, 1, NULL, 4, 1545742649, 1545742276, 1545742649, 0, 1, 0, 'yc_KiuiyCnHVihbCQvdYRgA', 0, NULL, 0),
(113, '杨华群', '15770258043', '100.00', 0, 1, NULL, 4, 1545783723, 1545742316, 1545783723, 0, 1, 0, 'yc_VAcLIbLrtIxQfVNVROUu', 0, NULL, 0),
(114, '张卫', '18723901267', NULL, 0, 0, NULL, 4, NULL, 1545742702, 1545742702, 0, 0, 0, NULL, 0, NULL, 0),
(115, '13678420219', '13678420219', '100.00', 36, 1, NULL, 6, 1545743200, 1545743186, 1545743200, 0, 0, 0, 'yc_qPWmsCdBSGnfpjpTLaLM', 0, NULL, 0),
(116, '于佳加', '18324129587', '100.00', 0, 1, '很遗憾,未中奖', 6, 1545744235, 1545744023, 1545744243, 0, 1, 700, 'yc_QFpjdHpEyHxXRKomkYQk', 1, 1545744243, 3),
(117, '冉桂玲', '13638292537', '100.00', 0, 1, NULL, 6, 1545801363, 1545744183, 1545801521, 0, 0, 0, 'yc_xNahdOMujxonvErSDoJf', 0, NULL, 0),
(118, '王思琪', '18223604949', NULL, 28, 0, NULL, 4, NULL, 1545745366, 1545745366, 0, 1, 100, NULL, 0, NULL, 0),
(119, '唐田田', '18324129089', '100.00', 116, 1, '很遗憾,未中奖', 6, 1545745884, 1545745752, 1545746859, 0, 1, 400, 'yc_NWnBikuFyGIroQgoboBV', 1, 1545745893, 0),
(120, '陈小渝', '13637962528', NULL, 0, 0, NULL, 4, NULL, 1545746100, 1545746100, 0, 1, 0, NULL, 0, NULL, 0),
(121, '肖涛', '13668431517', '100.00', 0, 1, NULL, 4, 1545746406, 1545746121, 1545746406, 0, 0, 0, 'yc_pMJgrebNzOuUohpBFifx', 0, NULL, 0),
(122, '田海明', '15923232098', '100.00', 0, 1, NULL, 4, 1545746414, 1545746137, 1545746414, 0, 0, 0, 'yc_KsiNpnjvxMDWtqoBmrVD', 0, NULL, 0),
(123, '陈苗苗', '13370744072', NULL, 0, 0, NULL, 4, NULL, 1545746138, 1545746138, 0, 0, 0, NULL, 0, NULL, 0),
(124, '温亭松', '17353135573', '100.00', 0, 1, NULL, 4, 1545746248, 1545746141, 1545746248, 0, 0, 0, 'yc_lyRLbnesqDgHCfzWhRjX', 0, NULL, 0),
(125, '张擎天', '13206107551', '100.00', 0, 1, NULL, 4, 1545746402, 1545746145, 1545746402, 0, 0, 0, 'yc_CIhWWgfOJZRfKqOSjmQy', 0, NULL, 0),
(126, '蒲杨', '15025536621', '100.00', 116, 1, '很遗憾,未中奖', 6, 1545746792, 1545746784, 1545746819, 0, 1, 400, 'yc_zjSYPLCBZgVInkvERYNa', 1, 1545746819, 0),
(127, '崔莉', '13388964950', '100.00', 69, 1, '很遗憾,未中奖', 1, 1545804725, 1545746792, 1545804735, 0, 1, 500, 'yc_udaBhxEKCgzDtNdyLLtx', 1, 1545804735, 1),
(128, '高红琼', '15736433203', '100.00', 116, 1, NULL, 6, 1545747000, 1545746962, 1545747022, 0, 1, 400, 'yc_tmPmUEbPMXWvjyjelrpo', 1, 1545747022, 0),
(129, '周姣', '15702301641', NULL, 0, 0, NULL, 1, NULL, 1545747378, 1545747378, 0, 0, 0, NULL, 0, NULL, 0),
(130, '朱浩', '18175090317', '100.00', 0, 1, NULL, 5, 1545748894, 1545748694, 1545748894, 0, 0, 0, 'yc_BUglZHPaCAqRfPUwpcyJ', 0, NULL, 0),
(131, '马晓寒', '15923914847', '100.00', 0, 1, NULL, 5, 1545748910, 1545748696, 1545748910, 0, 0, 0, 'yc_BSUTcRzGkGaWmuZZyTEZ', 0, NULL, 0),
(132, '邓宏', '15923040496', '100.00', 0, 1, NULL, 5, 1545748947, 1545748703, 1545748947, 0, 0, 0, 'yc_yvJrEMSKFpzLcGhbpjrW', 0, NULL, 0),
(133, '何帅', '15393532172', NULL, 0, 0, NULL, 5, NULL, 1545748716, 1545748716, 0, 0, 0, NULL, 0, NULL, 0),
(134, '秦蔚', '18723091242', '100.00', 0, 1, NULL, 5, 1545748891, 1545748754, 1545748891, 0, 0, 0, 'yc_jquCVSkjxxCuyXeBmvhw', 0, NULL, 0),
(135, '1829801445', '18224363126', '100.00', 0, 1, NULL, 5, 1545748901, 1545748767, 1545748901, 0, 0, 0, 'yc_ZuhCyUYQySLpqREeqBNl', 0, NULL, 0),
(136, '陈阳', '13028393511', '100.00', 96, 1, NULL, 1, 1545749804, 1545749778, 1545749804, 0, 0, 0, 'yc_NWhrZJGPlUuoVSREVAIs', 0, NULL, 0),
(137, '刘丽屏', '15084351860', NULL, 120, 0, '很遗憾,未中奖', 4, NULL, 1545750100, 1545750100, 0, 1, 100, NULL, 0, NULL, 0),
(138, '夏黎明', '17378357952', '100.00', 50, 1, '很遗憾,未中奖', 3, 1545750347, 1545750341, 1545750356, 0, 1, 400, 'yc_oeNifbxZaKPjwGqZqKSI', 1, 1545750356, 0),
(139, '熊克俊', '18723131071', '100.00', 69, 1, NULL, 1, 1545752007, 1545752000, 1545752016, 0, 0, 300, 'yc_gQVIubOixLsqXtSkunKE', 1, 1545752016, 0),
(140, '龙昕', '15730498136', '100.00', 0, 1, '品牌充电宝1个', 5, 1545791360, 1545752328, 1545791371, 0, 1, 400, 'yc_MBWJPHSYmVCQDiLeUQzX', 1, 1545791371, 0),
(141, '李鹏娟', '17815378903', '100.00', 0, 1, NULL, 4, 1545753983, 1545753204, 1545753983, 0, 1, 100, 'yc_KcgQSvUoDsqkhMXwLify', 0, NULL, 0),
(142, '刘新海', '19939335273', NULL, 0, 0, NULL, 4, NULL, 1545753410, 1545753410, 0, 1, 0, NULL, 0, NULL, 0),
(143, '曲磊', '13356154545', '100.00', 69, 1, NULL, 1, 1545753699, 1545753693, 1545753698, 0, 0, 0, 'yc_cDdxQVCMpdjnNPfJzmcd', 0, NULL, 0),
(144, '唐钟建', '17782248922', '100.00', 40, 1, NULL, 6, 1545756414, 1545756254, 1545756427, 0, 0, 300, 'yc_qXaVvxeIudgnfngeVnYa', 1, 1545756427, 0),
(145, '焦俊峰', '15523232083', '100.00', 0, 1, NULL, 4, 1545756738, 1545756724, 1545756738, 0, 0, 0, 'yc_BUfpPbNSFEzLLRUXwKhh', 0, NULL, 0),
(146, '陈凤', '18996663639', NULL, 0, 0, NULL, 1, NULL, 1545790003, 1545790003, 0, 0, 0, NULL, 0, NULL, 0),
(147, '李哲', '15878381923', '100.00', 0, 1, '很遗憾,未中奖', 3, 1545799954, 1545790983, 1545799954, 0, 1, 100, 'yc_AgkVwweDoNWcuvWpoHpv', 0, NULL, 0),
(148, '韦屿涛', '18315164625', NULL, 0, 0, NULL, 4, NULL, 1545791019, 1545791019, 0, 0, 0, NULL, 0, NULL, 0),
(149, '徐佳', '13658452591', '100.00', 30, 1, NULL, 4, 1545792271, 1545792224, 1545792271, 0, 1, 0, 'yc_fxkwRKkyOITEvuVPaazj', 0, NULL, 0),
(150, '郑福元', '15730591545', '100.00', 30, 1, NULL, 4, 1545792708, 1545792639, 1545792723, 0, 1, 400, 'yc_tJYgrRmSZFeXJTfygOdN', 1, 1545792723, 0),
(151, '唐仕银', '17868954670', '100.00', 69, 1, NULL, 1, 1545797027, 1545796947, 1545798628, 0, 0, 300, 'yc_umHUpJXyIheQKJjwCDxZ', 1, 1545797053, 0),
(152, '罗小芳', '18324144904', '100.00', 0, 1, NULL, 6, 1545797363, 1545797356, 1545797376, 0, 1, 400, 'yc_vYRRibUHEUivFEmPFbTy', 1, 1545797376, 0),
(153, '廖正福', '17623238708', '100.00', 152, 1, NULL, 6, 1545797973, 1545797970, 1545797973, 0, 0, 0, 'yc_JPRWCpYWjJKrfHcEEfNb', 0, NULL, 0),
(154, '兰祥', '13187339413', '100.00', 0, 1, NULL, 1, 1545798405, 1545798401, 1545798405, 0, 0, 0, 'yc_GGPQlcBFdOHYJuTZBEHE', 0, NULL, 0),
(155, '庹小松', '18225497420', '100.00', 37, 1, '很遗憾,未中奖', 2, 1545799837, 1545799652, 1545799837, 0, 1, 0, 'yc_nKLmeufvbylUbnGOjzSs', 0, NULL, 0),
(156, '杨建林', '17725167552', '100.00', 37, 1, NULL, 2, 1545799696, 1545799655, 1545799696, 0, 1, 0, 'yc_vWHnHEbQcTedikgcKlSg', 0, NULL, 0),
(157, '冉小松', '18166536416', '100.00', 37, 1, '很遗憾,未中奖', 2, 1545799684, 1545799656, 1545799683, 0, 1, 0, 'yc_vmjRpkHUdOHYJmAXPNjA', 0, NULL, 0),
(158, '代春生', '17623123862', '100.00', 37, 1, '100元秀火锅现金券', 2, 1545799696, 1545799673, 1545799696, 0, 1, 0, 'yc_hcsYHlczvMRsBNuzjUAa', 0, NULL, 0),
(159, '郭效犇', '18893652539', '100.00', 37, 1, '品牌充电宝1个', 2, 1545801487, 1545799673, 1545801497, 0, 1, 400, 'yc_jDcyhXltlNueIOmcHNSf', 1, 1545801497, 0),
(160, '罗玉李', '15823171934', '100.00', 37, 1, NULL, 2, 1545799853, 1545799684, 1545799853, 0, 0, 0, 'yc_bxxhghtCTztNelwFpISA', 0, NULL, 0),
(161, '李松', '15730435725', '100.00', 157, 1, NULL, 2, 1545800059, 1545799976, 1545800059, 0, 0, 0, 'yc_PXTwIBLsnxlBUrgrWAdM', 0, NULL, 0),
(162, '郭效犇', '15667084136', NULL, 159, 0, '100元秀火锅现金券', 2, NULL, 1545800079, 1545800079, 0, 1, 100, NULL, 0, NULL, 0),
(163, '1', '13993303144', '100.00', 155, 1, NULL, 2, 1545800565, 1545800557, 1545801114, 0, 0, 0, 'yc_PwVwWEdYPpcCQDKEFQwV', 0, NULL, 0),
(164, '陈港', '15084481034', '100.00', 0, 1, NULL, 4, 1545800680, 1545800669, 1545800680, 0, 1, 100, 'yc_MSvERdPEBzLNWnXcmsdF', 0, NULL, 0),
(165, '李超', '18883328446', '100.00', 0, 1, '很遗憾,未中奖', 6, 1545801335, 1545801053, 1545801335, 0, 1, 0, 'yc_psWRaAMgIesWFuUHOnDl', 0, NULL, 0),
(166, '陈心田', '17623014642', '100.00', 0, 1, '很遗憾,未中奖', 6, 1545801339, 1545801056, 1545801373, 0, 1, 400, 'yc_zAWXeoXvGZCGbRIssxpY', 1, 1545801373, 0),
(167, '刘江', '15196545953', '100.00', 0, 1, '100元秀火锅现金券', 6, 1545801123, 1545801117, 1545801327, 0, 1, 100, 'yc_zmtnzDyMdVSAQQLjiHLy', 0, NULL, 0),
(168, '窦伟华', '13368444951', '100.00', 0, 1, NULL, 6, 1545801181, 1545801172, 1545801181, 0, 0, 0, 'yc_RdvYRJGXtDcBZbHjUleQ', 0, NULL, 0),
(169, '陆思宇', '17725166345', '100.00', 0, 1, NULL, 6, 1545801348, 1545801188, 1545801348, 0, 0, 0, 'yc_vPJPcbuTNeQFhDRbklJy', 0, NULL, 0),
(170, '廖俊霖', '13594120232', '100.00', 0, 1, NULL, 6, 1545801349, 1545801203, 1545801349, 0, 0, 0, 'yc_obsiLZIMDkoWhBdlSTkv', 0, NULL, 0),
(171, '费远良', '18723937970', '100.00', 0, 1, '很遗憾,未中奖', 1, 1545801926, 1545801380, 1545801934, 0, 1, 400, 'yc_CKdAtJYVWPJLmSSERSZh', 1, 1545801934, 0),
(172, '苟云帆', '18723453225', NULL, 158, 0, NULL, 2, NULL, 1545801682, 1545801682, 0, 0, 0, NULL, 0, NULL, 0),
(173, '李豪', '18696700703', '100.00', 158, 1, NULL, 2, 1545801714, 1545801698, 1545801714, 0, 1, 0, 'yc_wxRGfitiXdiNiaZyKumf', 0, NULL, 0),
(174, '王鹏程', '13224031855', '100.00', 0, 1, NULL, 5, 1545801765, 1545801750, 1545801765, 0, 0, 0, 'yc_BWkwOVnSHKtAmMLQKzRe', 0, NULL, 0),
(175, '刘剑', '17830143458', '100.00', 0, 1, '100元秀火锅现金券', 6, 1545808869, 1545802828, 1545808869, 0, 1, 200, 'yc_qLQPtPJEKzWtVSrWObbR', 0, NULL, 1),
(176, '徐桂彬', '15123431707', '100.00', 72, 1, '100元秀火锅现金券', 1, 1545804527, 1545802979, 1545804822, 0, 1, 400, 'yc_AMaILpTRVaWrpHTNUaXI', 1, 1545804545, 0),
(177, '丁娇', '13637830869', '100.00', 72, 1, '很遗憾,未中奖', 1, 1545803611, 1545803570, 1545806082, 0, 1, 400, 'yc_uJhKSCaxYHojFEwgrBVT', 1, 1545803618, 0),
(178, '肖雨露', '18580417396', '100.00', 72, 1, '很遗憾,未中奖', 1, 1545803688, 1545803610, 1545804430, 0, 1, 400, 'yc_kwtjjqIPtjNGFtbFvREF', 1, 1545803730, 0),
(179, '王大伟', '15223171471', '100.00', 72, 1, '100元秀火锅现金券', 1, 1545804034, 1545803949, 1545806711, 0, 1, 400, 'yc_ehxEBiphPEQLeTmZGKHI', 1, 1545804041, 0),
(180, '董益', '18723918594', '100.00', 72, 1, NULL, 1, 1545804062, 1545804058, 1545806374, 0, 0, 300, 'yc_AzIfEFTOAzTBxHWXqydz', 1, 1545804073, 0),
(181, '甘程全', '17623247660', '100.00', 175, 1, '100元秀火锅现金券', 6, 1545804298, 1545804287, 1545804641, 0, 1, 400, 'yc_nfuPDGVfxodVLMoJBIhu', 1, 1545804314, 0),
(182, '彭鹏', '18523486548', '100.00', 0, 1, '很遗憾,未中奖', 1, 1545806110, 1545804659, 1545806110, 0, 1, 100, 'yc_LtvwMKjWAPRVtsJlshrQ', 0, NULL, 0),
(183, '杨琴', '18323780443', NULL, 37, 0, NULL, 2, NULL, 1545804790, 1545804790, 0, 1, 0, NULL, 0, NULL, 0),
(184, '孙居正', '18709907471', '100.00', 127, 1, NULL, 1, 1545805178, 1545805174, 1545805289, 0, 0, 300, 'yc_mZUdIlzKBItudjUiArLi', 1, 1545805186, 0),
(185, '杨闽', '15023598493', NULL, 77, 0, NULL, 1, NULL, 1545805427, 1545805427, 0, 0, 0, NULL, 0, NULL, 0),
(186, '张玉', '15730680056', '100.00', 97, 1, NULL, 1, 1545806467, 1545806275, 1545806478, 0, 1, 400, 'yc_meKSqbCQsiPYKSXnyfWE', 1, 1545806478, 1),
(187, '毛独浩', '15223744885', '100.00', 72, 1, '很遗憾,未中奖', 1, 1545806432, 1545806421, 1545806445, 0, 1, 400, 'yc_DqBuCKUWQnwGpNQeEsth', 1, 1545806445, 0),
(188, '陈娜', '18702369885', '100.00', 186, 1, NULL, 1, 1545806762, 1545806689, 1545806777, 0, 1, 400, 'yc_kCbCAXYzsanNgOPgWKFx', 1, 1545806777, 0),
(189, '梁铭富', '15916239746', '100.00', 46, 1, '100元秀火锅现金券', 5, 1545806824, 1545806735, 1545807129, 0, 1, 400, 'yc_kalyMEIpsoFeMMPutAXA', 1, 1545806843, 0),
(190, '杨秋菊', '15696171608', '100.00', 0, 1, NULL, 1, 1545808801, 1545807151, 1545808801, 0, 1, 0, 'yc_HcnRvXJDbtMKqrxATvAc', 0, NULL, 0),
(191, '陈浩甄', '15881861362', '100.00', 20, 1, NULL, 3, 1545807296, 1545807292, 1545807352, 0, 0, 300, 'yc_IUdACRiZJZcmsZLjKUzq', 1, 1545807352, 0),
(192, '李丽娜', '18281502674', '100.00', 72, 1, NULL, 1, 1545807332, 1545807323, 1545807342, 0, 0, 300, 'yc_eegOkcRLCEWtGRsHIDAw', 1, 1545807342, 0);

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
) ENGINE=MyISAM AUTO_INCREMENT=81 DEFAULT CHARSET=utf8 COMMENT='体检申请表';

--
-- 转存表中的数据 `sent_apply`
--

INSERT INTO `sent_apply` (`id`, `name`, `phone`, `station_id`, `code_id`, `is_pay`, `create_time`, `openid`, `sn`) VALUES
(1, '花花', '13594855871', 1, 3, 1, 1542940665, 'o2l0cwqD9xFMwlNrr7BfBCmhLVv8', NULL),
(2, '啦啦', '18356958626', 1, 4, 1, 1543310312, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', NULL),
(3, '啦啦啦', '18596532653', 2, NULL, NULL, 1543310513, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', NULL),
(4, '啦啦啦', '15232365236', 1, NULL, NULL, 1543310546, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', NULL),
(5, '啦啦啦', '18656236562', 1, NULL, NULL, 1543310598, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', NULL),
(6, '啦啦啦', '13256235623', 1, NULL, NULL, 1543310678, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', NULL),
(7, '啦啦啦', '15236235623', 1, NULL, NULL, 1543310743, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', NULL),
(8, '啦啦啦', '15232653236', 1, NULL, NULL, 1543368368, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', NULL),
(9, '啦啦啦', '18885623562', 3, NULL, NULL, 1543478935, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', NULL),
(10, '嘿嘿嘿', '18556235623', 1, NULL, NULL, 1543479489, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', NULL),
(11, '嘿嘿嘿', '18562356236', 1, NULL, NULL, 1543479527, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', NULL),
(12, '啦啦啦', '18845212360', 1, NULL, NULL, 1543479643, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', NULL),
(13, '哈哈哈', '15236523604', 1, NULL, NULL, 1543484902, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', NULL),
(14, '嘿嘿额和', '18885623623', 1, NULL, NULL, 1543485068, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', NULL),
(15, '啦啦啦', '18889090909', 1, 5, 1, 1543886360, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', NULL),
(16, '啦啦啦', '18889090909', 1, 6, 1, 1543886361, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', NULL),
(17, '冯显志', '15922542385', 1, 7, 1, 1544002894, 'o2l0cwj6bKfp1IlK60lL6exB-sA0', NULL),
(18, '冯显志', '15922542385', 1, 8, 1, 1544002939, 'o2l0cwj6bKfp1IlK60lL6exB-sA0', NULL),
(19, '冯显志', '15922542385', 1, 9, 1, 1544065221, 'o2l0cwj6bKfp1IlK60lL6exB-sA0', NULL),
(20, '花花', '13594855872', 1, 10, 1, 1544078464, 'o2l0cwqD9xFMwlNrr7BfBCmhLVv8', NULL),
(21, '冯显志', '15922542385', 4, 48, 1, 1544362423, 'o2l0cwj6bKfp1IlK60lL6exB-sA0', NULL),
(22, '啦啦啦', '18565236235', 3, NULL, NULL, 1544428861, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', NULL),
(23, '啦啦啦', '18565236235', 2, NULL, NULL, 1544429427, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', NULL),
(24, '啦啦啦', '18565236235', 3, NULL, NULL, 1544429536, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', NULL),
(25, '啦啦啦', '18565236235', 4, NULL, NULL, 1544429669, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', NULL),
(26, '啦啦啦', '18565236235', 3, NULL, NULL, 1544429682, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', NULL),
(27, '啦啦啦', '18565236235', 4, NULL, NULL, 1544429697, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', NULL),
(28, '啦啦啦', '18565236235', 4, NULL, NULL, 1544429700, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', NULL),
(29, '啦啦啦', '18565236235', 2, NULL, NULL, 1544430600, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', NULL),
(30, '啦啦啦', '18565236235', 3, NULL, NULL, 1544430671, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', NULL),
(31, '啦啦啦', '18565236235', 3, NULL, NULL, 1544430743, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', NULL),
(32, '啦啦啦', '18565236235', 3, NULL, NULL, 1544430769, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', NULL),
(33, '啦啦啦', '18565236235', 3, NULL, NULL, 1544430799, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', NULL),
(34, '啦啦啦', '18565236235', 2, NULL, NULL, 1544431083, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', NULL),
(35, '冯显志', '15922542385', 5, NULL, 1, 1544619663, 'o2l0cwj6bKfp1IlK60lL6exB-sA0', NULL),
(36, '冯显志', '15922542385', 5, NULL, 1, 1544619683, 'o2l0cwj6bKfp1IlK60lL6exB-sA0', NULL),
(37, '冯显志', '15922542385', 3, 11, 1, 1544619853, 'o2l0cwj6bKfp1IlK60lL6exB-sA0', NULL),
(38, '啦啦啦', '18565236235', 2, NULL, NULL, 1544671341, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', NULL),
(39, '啦啦啦', '18565236235', 3, NULL, NULL, 1544671491, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', NULL),
(40, '啦啦啦', '18565236235', 2, NULL, NULL, 1544671539, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', NULL),
(41, '啦啦啦', '18565236235', 2, NULL, NULL, 1544671566, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', NULL),
(42, '啦啦啦', '18565236235', 2, NULL, NULL, 1544671586, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', NULL),
(43, '啦啦啦', '18565236235', 2, NULL, NULL, 1544671722, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', NULL),
(44, '啦啦啦', '18565236235', 2, NULL, NULL, 1544671741, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', NULL),
(45, '啦啦啦', '18565236235', 2, NULL, NULL, 1544671747, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', NULL),
(46, '啦啦啦', '18565236235', 2, NULL, NULL, 1544671765, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', NULL),
(47, '啦啦啦', '18565236235', 3, NULL, NULL, 1544671778, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', NULL),
(48, '啦啦啦', '18565236235', 2, NULL, NULL, 1544671800, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', NULL),
(49, '啦啦啦', '18565236235', 3, NULL, NULL, 1544672860, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', NULL),
(50, '啦啦啦', '18565236235', 3, NULL, NULL, 1544682101, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', NULL),
(51, '啦啦啦', '18565236235', 2, NULL, NULL, 1544682286, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', NULL),
(52, '啦啦啦', '18565236235', 3, NULL, NULL, 1544682294, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', NULL),
(53, '啦啦啦', '18565236235', 2, NULL, NULL, 1544682311, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', NULL),
(54, '啦啦啦', '18565236235', 3, NULL, NULL, 1544682843, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', NULL),
(55, '''测试''', '13594855871', 1, NULL, NULL, 1544683125, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', NULL),
(56, '''测试''', '13594855871', 1, NULL, NULL, 1544683210, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', NULL),
(57, '''测试''', '13594855871', 1, NULL, NULL, 1544683295, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', NULL),
(58, '啦啦啦', '18565236235', 2, NULL, NULL, 1544683356, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', NULL),
(59, '''测试''', '13594855871', 1, NULL, NULL, 1544683364, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', NULL),
(60, '啦啦啦', '18565236235', 3, NULL, NULL, 1544683379, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', NULL),
(61, '''测试''', '13594855871', 1, NULL, NULL, 1544683714, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', NULL),
(62, '啦啦啦', '18565236235', 2, NULL, NULL, 1544683722, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', 'tj_rNHVscMQGqEkfFFFnPuB'),
(63, '啦啦啦', '18565236235', 2, NULL, NULL, 1544683756, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', 'tj_gMQomvfPpKFAiCNKJNkV'),
(64, '啦啦啦', '18565236235', 2, NULL, NULL, 1544683849, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', 'tj_oeaQMuAYgQfhpRhfXcqO'),
(65, '啦啦啦', '18565236235', 2, NULL, NULL, 1544683858, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', NULL),
(66, '啦啦啦', '18565236235', 3, NULL, NULL, 1544683913, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', 'tj_qCfbJLCRqSuMYmTwKLaf'),
(67, '啦啦啦', '18565236235', 3, NULL, NULL, 1544683922, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', 'tj_FeNBzRBxRcpPMbPueqPa'),
(68, '啦啦啦', '18565236235', 3, NULL, NULL, 1544683928, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', 'tj_DZhEEsRnekqugXSsKNda'),
(69, '啦啦啦', '18565236235', 3, NULL, NULL, 1544684022, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', 'tj_jRyOrvGKdcFOoWRXRcYQ'),
(70, '花花', '13594855872', 2, NULL, NULL, 1544684032, 'o2l0cwqD9xFMwlNrr7BfBCmhLVv8', 'tj_PqkDlFCvuMUjCcJTJnvi'),
(71, '啦啦啦', '18565236235', 2, NULL, NULL, 1544684109, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', 'tj_cHBBQrsrmZBufqKwYSuj'),
(72, '啦啦啦', '18565236235', 2, NULL, NULL, 1544684133, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', 'tj_KemocqOHHwIoTkknHYUf'),
(73, '''测试''', '13594855871', 1, NULL, NULL, 1544684164, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', NULL),
(74, '''测试''', '13594855871', 1, NULL, NULL, 1544684461, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', NULL),
(75, '''测试''', '13594855871', 1, NULL, NULL, 1544684606, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', NULL),
(76, '啦啦啦', '18565236235', 2, 12, 1, 1544684811, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', 'tj_NAqDzSobfJTxfeeLAgsH'),
(77, '花花', '13594855872', 2, NULL, NULL, 1544684831, 'o2l0cwqD9xFMwlNrr7BfBCmhLVv8', 'tj_RfOfVXHsSWklQrQRjMZG'),
(78, '啦啦啦', '18565236235', 3, NULL, NULL, 1544685226, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', 'tj_xhfrKltInYEPkDmeoZlq'),
(79, '啦啦啦', '18565236235', 2, NULL, NULL, 1544685751, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', 'tj_UmdWHYkuAZChxVxEwOdh'),
(80, '啦啦啦', '18565236235', 2, NULL, NULL, 1544687312, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', 'tj_ZBpaFLALcqXxOPovWubu');

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
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='场地管理表';

--
-- 转存表中的数据 `sent_area`
--

INSERT INTO `sent_area` (`id`, `name`, `address`, `lat`, `lng`, `thumb`, `status`, `school_id`) VALUES
(1, '大学城一号训练基地', '陈家桥轻轨站一号出口', '29.567507', '106.559614', '226', 0, 1),
(2, '南岸', '南岸', '29.567507', '106.559614', '54', 0, 1),
(3, '北碚', '北碚XXX', '29.817124', '106.255627', '6', 0, 1),
(4, '北碚一号训练基地', '北碚', '29.836112', '106.388594', '12', 0, 1),
(5, '沙坪坝', '沙坪坝沙坪坝沙坪坝沙坪坝沙坪坝', '29.586668', '106.4562', '228', 0, 1),
(6, 'ccc', '陈家桥轻轨站1号出口', '', '', '199', 1, 1),
(7, '大学城训练基地', '大学城陈家桥轻轨站下出站即到', '29.614801', '106.334175', '314', 0, 5),
(8, '陈家桥轻轨站训练基地', '陈家桥轻轨站训练基地', '29.614743', '106.333528', '316', 0, 5),
(9, '学员风采2', '333', '29.588112', '106.402087', '317', 0, 5),
(10, '易点学车', '沙坪坝沙坪坝沙坪坝沙坪坝', '29.567507', '106.559614', '319', 0, 6),
(11, '测试', '沙坪坝沙坪坝沙坪坝沙坪坝', '29.567507', '106.559614', '320', 0, 6),
(12, '测试11', '沙坪坝沙坪坝沙坪坝沙坪坝', '29.567507', '106.559614', '321', 0, 6),
(13, '重庆西南机动车驾驶培训集团有限公司', '11111111', '29.554438', '106.406686', '335', 0, 1);

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
  `rules` varchar(500) DEFAULT NULL COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  `school_id` smallint(6) NOT NULL DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sent_auth_group`
--

INSERT INTO `sent_auth_group` (`id`, `module`, `type`, `title`, `description`, `status`, `rules`, `school_id`) VALUES
(20, 'admin', '', '金西亚行政人事', '', 1, '', 1),
(21, 'admin', '', '金西亚市场', '', 1, '', 1),
(22, 'admin', '', '金西亚管理员', '', 1, '', 1),
(17, 'admin', '', '鼎吉行政人事部', '', 1, '1,103,104,10,11,105,106,107,108,109,110,111,112', 1),
(18, 'admin', '', '鼎吉市场部', '', 1, '1,103,104,41,70,71,72,42,73,74,75,54,83,59,79,80,81,60,61', 1),
(19, 'admin', '', '鼎吉管理员', '', 1, '1,20,41,70,71,72,42,73,74,75,43,44,45,46,47,48,49,50,51,52,53,65,66,67,68,96,97,98,99,100,101,102,54,82,83,55,57,58,76,77,78,59,79,80,81,60,61,62,63,87,88,64,95,89,90,91,92,93,94', 1);

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
(11, 11),
(12, 17),
(13, 18),
(14, 19),
(15, 21);

-- --------------------------------------------------------

--
-- 表的结构 `sent_auth_group_detail`
--

CREATE TABLE IF NOT EXISTS `sent_auth_group_detail` (
  `id` int(11) unsigned NOT NULL,
  `group_id` int(11) NOT NULL COMMENT '角色分组ID',
  `rules` varchar(300) DEFAULT NULL COMMENT '规则id',
  `school_id` smallint(6) NOT NULL COMMENT '学校ID'
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COMMENT='分组详细';

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
(10, 11, '83,82,69,54,20,1', 1),
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
(27, 16, '', 3),
(28, 16, NULL, 1),
(29, 16, NULL, 2),
(30, 16, NULL, 3),
(31, 17, '1,103,104,10,11,105,106,107,108,109,110,111,112', 1),
(32, 17, '', 2),
(33, 17, '', 3),
(34, 18, '1,103,104,41,70,71,72,42,73,74,75,54,83,59,79,80,81,60,61', 1),
(35, 18, '', 2),
(36, 18, '', 3),
(37, 19, '1,20,41,70,71,72,42,73,74,75,43,44,45,46,47,48,49,50,51,52,53,65,66,67,68,96,97,98,99,100,101,102,54,82,83,55,57,58,76,77,78,59,79,80,81,60,61,62,63,87,88,64,95,89,90,91,92,93,94', 1),
(38, 19, '', 2),
(39, 19, '', 3),
(40, 20, '', 1),
(41, 20, '11', 2),
(42, 20, '', 3),
(43, 21, '', 1),
(44, 21, '1,103,104,42,73,74,75,54,83,58,76,77,78,59,79,80,81,60,61', 2),
(45, 21, '', 3),
(46, 22, '', 1),
(47, 22, '1,20,11,38,40,84,85,86,41,70,71,72,42,73,74,75,43,44,45,46,47,48,49,50,51,52,53,65,66,67,68,54,69,82,83,55,57,58,76,77,78,59,79,80,81,60,61,62,63,87,88,64,95,89,90,91,92,93,94', 2),
(48, 22, '', 3),
(49, 17, NULL, 6),
(52, 20, NULL, 6),
(53, 21, NULL, 6),
(54, 22, NULL, 6),
(55, 17, NULL, 4),
(56, 18, '', 4),
(57, 19, '', 4),
(58, 20, NULL, 4),
(59, 21, NULL, 4),
(60, 22, NULL, 4),
(61, 17, NULL, 5),
(62, 18, '1,20,103,104,9,10,11,105,106,107,108,109,110,111,112,38,40,84,85,86,41,70,71,72,42,73,74,75,43,44,45,46,47,48,49,50,51,52,53,65,66,67,68,96,97,98,99,100,101,102,54,69,82,83,55,57,58,76,77,78,59,79,80,81,60,61,62,63,87,88,64,95,89,90,91,92,93,94', 5),
(63, 19, '1,20,103,104,9,10,11,105,106,107,108,109,110,111,112,38,40,84,85,86,41,70,71,72,42,73,74,75,43,44,45,46,47,48,49,50,51,52,53,65,66,67,68,96,97,98,99,100,101,102,54,69,82,83,55,57,58,76,77,78,59,79,80,81,60,61,62,63,87,88,64,95,89,90,91,92,93,94', 5),
(64, 20, NULL, 5),
(65, 21, NULL, 5),
(66, 22, NULL, 5),
(68, 18, '1,20,103,104,9,10,11,105,106,107,108,109,110,111,112,38,40,84,85,86,41,70,71,72,42,73,74,75,43,44,45,46,47,48,49,50,51,52,53,65,66,67,68,96,97,98,99,100,101,102,54,69,82,83,55,57,58,76,77,78,59,79,80,81,60,61,62,63,87,88,64,95,89,90,91,92,93,94', 6),
(69, 19, '1,20,103,104,9,10,11,105,106,107,108,109,110,111,112,38,40,84,85,86,41,70,71,72,42,73,74,75,43,44,45,46,47,48,49,50,51,52,53,65,66,67,68,96,97,98,99,100,101,102,54,69,82,83,55,57,58,76,77,78,59,79,80,81,60,61,62,63,87,88,64,95,89,90,91,92,93,94', 6),
(70, 20, NULL, 6),
(71, 21, NULL, 6),
(72, 22, NULL, 6);

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
) ENGINE=MyISAM AUTO_INCREMENT=114 DEFAULT CHARSET=utf8;

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
(43, 'admin', 2, 'admin/operate/index', '首页banner图', '运营管理', 1, ''),
(44, 'admin', 2, 'admin/operate/about', '走进鼎吉', '运营管理', 1, ''),
(45, 'admin', 2, 'admin/operate/beautiful', '发现最美鼎吉', '运营管理', 1, ''),
(46, 'admin', 2, 'admin/operate/coach', '教练风采', '运营管理', 1, ''),
(47, 'admin', 2, 'admin/operate/team', '团队风采', '运营管理', 1, ''),
(48, 'admin', 2, 'admin/operate/student', '学员风采', '运营管理', 1, ''),
(49, 'admin', 2, 'admin/operate/activity', '最新活动', '运营管理', 1, ''),
(50, 'admin', 2, 'admin/operate/banner', '报名页banner图', '运营管理', 1, ''),
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
(95, 'admin', 1, 'admin/code/apply_edit', '编辑', '体检申请管理', 1, ''),
(96, 'admin', 1, 'admin/operate/add', '首页banner图新增', '运营管理', 1, ''),
(97, 'admin', 1, 'admin/operate/edit', '首页banner图修改', '运营管理', 1, ''),
(98, 'admin', 1, 'admin/operate/del', '删除', '运营管理', 1, ''),
(99, 'admin', 1, 'admin/operate/beautiful_add', '发现最美鼎吉滚动图新增', '运营管理', 1, ''),
(100, 'admin', 1, 'admin/operate/beautiful_edit', '发现最美鼎吉滚动图修改', '运营管理', 1, ''),
(101, 'admin', 1, 'admin/operate/banner_add', '报名页banner图添加', '运营管理', 1, ''),
(102, 'admin', 1, 'admin/operate/banner_edit', '报名页banner图修改', '运营管理', 1, ''),
(103, 'admin', 1, 'admin/user/edit', '个人资料修改', '首页管理', 1, ''),
(104, 'admin', 1, 'admin/user/editpwd', '个人密码修改', '首页管理', 1, ''),
(105, 'admin', 1, 'admin/group/add', '添加角色', '权限管理', 1, ''),
(106, 'admin', 1, 'admin/group/edit', '编辑角色', '权限管理', 1, ''),
(107, 'admin', 1, 'admin/group/auth', '授权', '权限管理', 1, ''),
(108, 'admin', 1, 'admin/group/del', '删除角色', '权限管理', 1, ''),
(109, 'admin', 1, 'admin/user/add', '新增账号', '权限管理', 1, ''),
(110, 'admin', 1, 'admin/user/edit', '编辑账号', '权限管理', 1, ''),
(111, 'admin', 1, 'admin/user/auth', '给账号分配角色', '权限管理', 1, ''),
(112, 'admin', 1, 'admin/user/del', '删除账号', '权限管理', 1, ''),
(113, 'admin', 1, 'admin/activity/export', '活动导出', '活动管理', 1, '');

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
) ENGINE=MyISAM AUTO_INCREMENT=87 DEFAULT CHARSET=utf8 COMMENT='优惠券码';

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
(34, 'JjewDktCnR', 200, 0, 6),
(35, 'UiqRfynzgo', 100, 0, 7),
(36, 'EPekFvUfZx', 100, 0, 7),
(37, 'rUSosqZgTA', 200, 0, 8),
(38, 'JdmlLzMAar', 200, 0, 8),
(39, 'pPhOlXViBj', 200, 0, 8),
(40, 'WpZkVtJrsh', 200, 0, 8),
(41, 'oFaiEsQeSy', 200, 0, 8),
(42, 'OVScJmPpse', 200, 0, 8),
(43, 'zltmFiksRp', 200, 0, 8),
(44, 'AIBqGnxtuK', 200, 0, 8),
(45, 'RkJrzcMPuo', 200, 0, 8),
(46, 'YipaDzEMhZ', 200, 0, 8),
(47, 'gIOcuRsLve', 200, 0, 8),
(48, 'prEncGmOjZ', 200, 0, 8),
(49, 'mAkxdrQHnP', 200, 0, 8),
(50, 'KlkiDHrWsj', 200, 0, 8),
(51, 'HmlxnSeYqV', 200, 0, 8),
(52, 'tvpsbSPFUx', 200, 0, 8),
(53, 'kJCzRShvui', 200, 0, 8),
(54, 'jNyZdEWveG', 200, 0, 8),
(55, 'HpRzMwXIOb', 200, 0, 8),
(56, 'RcVnbzIpyo', 200, 0, 8),
(57, 'usADbQJqgl', 200, 0, 8),
(58, 'pkICNAyDQg', 200, 0, 8),
(59, 'SLJBgPtkuh', 200, 0, 8),
(60, 'rUbqZhcFHk', 200, 0, 8),
(61, 'LtfGTjHVzA', 200, 0, 8),
(62, 'WJuDAatywI', 200, 0, 8),
(63, 'ncIoCeQmDs', 200, 0, 8),
(64, 'ZVGFpSaoCR', 200, 0, 8),
(65, 'BzhJoHLsjV', 200, 0, 8),
(66, 'pWbLEPzQyH', 200, 0, 8),
(67, 'vRmOtMZBqa', 200, 0, 8),
(68, 'KMZRayHvIX', 200, 0, 8),
(69, 'KXRZJNHVcD', 200, 0, 8),
(70, 'NoaVyXMCJQ', 200, 0, 8),
(71, 'CzlueMAwcy', 200, 0, 8),
(72, 'TFoGcZlEjq', 200, 0, 8),
(73, 'rKcIFUgsYE', 200, 0, 8),
(74, 'ykOfwVEPcB', 200, 0, 8),
(75, 'HfamVcqotu', 200, 0, 8),
(76, 'ZREYkMxjLg', 200, 0, 8),
(77, 'VOvTSAzQDk', 200, 0, 8),
(78, 'sZohPKcLCz', 200, 0, 8),
(79, 'KPEjJvAewm', 200, 0, 8),
(80, 'JYGlAfqcbn', 200, 0, 8),
(81, 'SqdkGoJvXN', 200, 0, 8),
(82, 'dSxRTGMqhz', 200, 0, 8),
(83, 'QfWGvrsNTn', 200, 0, 8),
(84, 'UtgYBIVAXG', 200, 0, 8),
(85, 'BiAZkQngGJ', 200, 0, 8),
(86, 'TlHIiYcovE', 200, 0, 8);

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
  `code` varchar(50) DEFAULT NULL COMMENT '券码',
  `amount` smallint(6) NOT NULL COMMENT '金额',
  `total` int(11) NOT NULL COMMENT '总张数',
  `use` int(11) NOT NULL DEFAULT '0' COMMENT '已使用张数',
  `online_time` int(11) NOT NULL COMMENT '上线时间',
  `downline_time` int(11) NOT NULL COMMENT '下线时间',
  `number` int(11) NOT NULL DEFAULT '0' COMMENT '报名人数',
  `status` int(11) DEFAULT '1' COMMENT '状态 1:上线 0:下线',
  `school_id` smallint(6) NOT NULL DEFAULT '1' COMMENT '学校ID'
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='优惠券管理';

--
-- 转存表中的数据 `sent_coupon`
--

INSERT INTO `sent_coupon` (`id`, `name`, `code`, `amount`, `total`, `use`, `online_time`, `downline_time`, `number`, `status`, `school_id`) VALUES
(1, '双11优惠券', '', 100, 10, 0, 1541752733, 1542011933, 0, 0, 1),
(2, '双11优惠券', '', 200, 5, 0, 1541752774, 1542011974, 0, 0, 1),
(3, '双11优惠券', '', 500, 2, 0, 1541752814, 1542012014, 0, 0, 1),
(4, '双12优惠券', '', 200, 10, 0, 1542335973, 1543339796, 0, 0, 1),
(5, '测试1', '', 300, 5, 0, 1542612863, 1543545023, 0, 0, 1),
(6, '测试2', '', 200, 2, 0, 1542612891, 1543543251, 0, 0, 2),
(7, '测试', NULL, 100, 2, 0, 1544687596, 1545375616, 0, 1, 1),
(8, '立减200元', NULL, 200, 50, 0, 1545122287, 1550030407, 0, 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `sent_department`
--

CREATE TABLE IF NOT EXISTS `sent_department` (
  `id` int(10) unsigned NOT NULL COMMENT '部门ID',
  `title` varchar(50) NOT NULL COMMENT '部门名称',
  `pid` smallint(6) NOT NULL DEFAULT '0' COMMENT '父级ID',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `code` varchar(50) DEFAULT NULL COMMENT '推荐码',
  `phone` varchar(15) NOT NULL COMMENT '电话',
  `number` int(11) DEFAULT NULL COMMENT '招生人数',
  `total` int(11) DEFAULT NULL COMMENT '团队总招生人数',
  `school_id` smallint(6) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=496 DEFAULT CHARSET=utf8 COMMENT='部门表';

--
-- 转存表中的数据 `sent_department`
--

INSERT INTO `sent_department` (`id`, `title`, `pid`, `status`, `remark`, `code`, `phone`, `number`, `total`, `school_id`) VALUES
(1, '谭江林', 0, 0, NULL, NULL, '15730134009', NULL, NULL, 1),
(2, '苏昕', 0, 0, NULL, NULL, '18323486005', NULL, NULL, 1),
(3, '邵世豪', 0, 0, NULL, NULL, '13815120925', NULL, NULL, 1),
(4, '费远良', 0, 0, NULL, NULL, '18723937970', NULL, NULL, 1),
(5, '彭鹏', 0, 0, NULL, NULL, '18523486548', NULL, NULL, 1),
(6, '杨秋菊', 0, 0, NULL, NULL, '15696171608', NULL, NULL, 1),
(7, '程小燕', 0, 0, NULL, NULL, '18423461075', NULL, NULL, 1),
(8, '龙杰', 0, 0, NULL, NULL, '15923235633', NULL, NULL, 1),
(9, '黄嘉欣', 0, 0, NULL, NULL, '13140229362', NULL, NULL, 1),
(10, '文才源', 0, 0, NULL, NULL, '17772438546', NULL, NULL, 1),
(11, '庹泽锟', 0, 0, NULL, NULL, '17353135721', NULL, NULL, 1),
(12, '周裕军', 0, 0, NULL, NULL, '13541521347', NULL, NULL, 1),
(13, '屈册', 0, 0, NULL, NULL, '19922903084', NULL, NULL, 1),
(14, '徐勇', 0, 0, NULL, NULL, '15320828235', NULL, NULL, 1),
(15, '汤依磊', 0, 0, NULL, NULL, '17320332483', NULL, NULL, 1),
(16, '王钰', 0, 0, NULL, NULL, '19970892017', NULL, NULL, 1),
(17, '谭森泉', 0, 0, NULL, NULL, '19912458050', NULL, NULL, 1),
(18, '君易豪', 0, 0, NULL, NULL, '18582986171', NULL, NULL, 1),
(19, '王佳莹', 0, 0, NULL, NULL, '15079885761', NULL, NULL, 1),
(20, '崔莉', 0, 0, NULL, NULL, '13388994950', NULL, NULL, 1),
(21, '王明辉', 0, 0, NULL, NULL, '15025561568', NULL, NULL, 1),
(22, '张丽婷', 0, 0, NULL, NULL, '13389609970', NULL, NULL, 1),
(23, '刘明珠', 0, 0, NULL, NULL, '18325074742', NULL, NULL, 1),
(24, '篙梦祥', 0, 0, NULL, NULL, '17633934673', NULL, NULL, 1),
(25, '田康', 0, 0, NULL, NULL, '18883087898', NULL, NULL, 1),
(26, '何保伦', 0, 0, NULL, NULL, '15223866453', NULL, NULL, 1),
(27, '赵飞', 0, 0, NULL, NULL, '15082099942', NULL, NULL, 1),
(28, '张超', 0, 0, NULL, NULL, '18883092007', NULL, NULL, 1),
(29, '王士康', 0, 0, NULL, NULL, '13722204259', NULL, NULL, 1),
(30, '杨闽', 0, 0, NULL, NULL, '15823598493', NULL, NULL, 1),
(31, '郝晨宇', 0, 0, NULL, NULL, '18636737788', NULL, NULL, 1),
(32, '赵稳', 0, 0, NULL, NULL, '18893352647', NULL, NULL, 1),
(33, '张呈祥', 0, 0, NULL, NULL, '13062320382', NULL, NULL, 1),
(34, '童庆瑜', 0, 0, NULL, NULL, '15579819095', NULL, NULL, 1),
(35, '肖荣康', 0, 0, NULL, NULL, '13364068387', NULL, NULL, 1),
(36, '余兴丹', 0, 0, NULL, NULL, '15523731604', NULL, NULL, 1),
(37, '陈圆', 0, 0, NULL, NULL, '18783259979', NULL, NULL, 1),
(38, '冉晓莉', 0, 0, NULL, NULL, '15723059712', NULL, NULL, 1),
(39, '戴涛', 0, 0, NULL, NULL, '15723061651', NULL, NULL, 1),
(40, '瞿红碧', 0, 0, NULL, NULL, '18723754340', NULL, NULL, 1),
(41, '张露瑶', 0, 0, NULL, NULL, '15023860821', NULL, NULL, 1),
(42, '汪世银', 0, 0, NULL, NULL, '15223678675', NULL, NULL, 1),
(43, '陈江', 0, 0, NULL, NULL, '18323588485', NULL, NULL, 1),
(44, '李嘉豪', 0, 0, NULL, NULL, '17523647862', NULL, NULL, 1),
(45, '陈广', 0, 0, NULL, NULL, '18323765437', NULL, NULL, 1),
(46, '冉红', 0, 0, NULL, NULL, '18315229005', NULL, NULL, 1),
(47, '张浩', 0, 0, NULL, NULL, '18315038660', NULL, NULL, 1),
(48, '陈国旺', 0, 0, NULL, NULL, '15826332477', NULL, NULL, 1),
(49, '赵飞', 0, 0, NULL, NULL, '18324183367', NULL, NULL, 1),
(50, '刘兴宇', 0, 0, NULL, NULL, '18996635902', NULL, NULL, 1),
(51, '申锐', 0, 0, NULL, NULL, '18875164509', NULL, NULL, 1),
(52, '夏佳欣', 0, 0, NULL, NULL, '13983770093', NULL, NULL, 1),
(53, '黄浩', 0, 0, NULL, NULL, '15310062716', NULL, NULL, 1),
(54, '何勇', 0, 0, NULL, NULL, '18225183276', NULL, NULL, 1),
(55, '杜玉骞', 0, 0, NULL, NULL, '15298267625', NULL, NULL, 1),
(56, '唐聪', 0, 0, NULL, NULL, '17382243179', NULL, NULL, 1),
(57, '户华', 0, 0, NULL, NULL, '18290290440', NULL, NULL, 1),
(58, '罗浩', 0, 0, NULL, NULL, '18725789252', NULL, NULL, 1),
(59, '文艳霞', 0, 0, NULL, NULL, '1889048694', NULL, NULL, 1),
(60, '陈新怀', 0, 0, NULL, NULL, '13098623074', NULL, NULL, 1),
(61, '田祯', 0, 0, NULL, NULL, '15310765179', NULL, NULL, 1),
(62, '毛燕飞', 0, 0, NULL, NULL, '13896881474', NULL, NULL, 1),
(63, '南永杰', 0, 0, NULL, NULL, '13689999798', NULL, NULL, 1),
(64, '蔡平', 0, 0, NULL, NULL, '17723853474', NULL, NULL, 1),
(65, '谢培花', 0, 0, NULL, NULL, '19923484755', NULL, NULL, 1),
(66, '王菊平', 0, 0, NULL, NULL, '18896148997', NULL, NULL, 1),
(67, '兰祥', 0, 0, NULL, NULL, '13187339413', NULL, NULL, 1),
(68, '龙伟', 0, 0, NULL, NULL, '17382065585', NULL, NULL, 1),
(69, '江仙文', 0, 0, NULL, NULL, '18423222216', NULL, NULL, 1),
(70, '廖浩文', 0, 0, NULL, NULL, '13629720706', NULL, NULL, 1),
(71, '幸银川', 0, 0, NULL, NULL, '18716510312', NULL, NULL, 1),
(72, '宋国文', 0, 0, NULL, NULL, '17338974480', NULL, NULL, 1),
(73, '陈凤', 0, 0, NULL, NULL, '18996663639', NULL, NULL, 1),
(74, '翁岳', 0, 0, NULL, NULL, '13193070499', NULL, NULL, 1),
(75, '李青青', 0, 0, NULL, NULL, '18883914546', NULL, NULL, 1),
(76, '王海敏', 0, 0, NULL, NULL, '15223903050', NULL, NULL, 1),
(77, '陈晓雪', 0, 0, NULL, NULL, '15823659367', NULL, NULL, 1),
(78, '杨金凤', 0, 0, NULL, NULL, '15730188221', NULL, NULL, 1),
(79, '蒋利霞', 0, 0, NULL, NULL, '18323958447', NULL, NULL, 1),
(80, '龙晓雨', 0, 0, NULL, NULL, '15213482115', NULL, NULL, 1),
(81, '杨茂涵', 0, 0, NULL, NULL, '15736565406', NULL, NULL, 1),
(82, '廖府', 0, 0, NULL, NULL, '15213567101', NULL, NULL, 1),
(83, '苏海源', 0, 0, NULL, NULL, '15340524426', NULL, NULL, 1),
(84, '张承杰', 0, 0, NULL, NULL, '18883833385', NULL, NULL, 1),
(85, '周江平', 0, 0, NULL, NULL, '17754928731', NULL, NULL, 1),
(86, '舒艳', 0, 0, NULL, NULL, '18102389623', NULL, NULL, 1),
(87, '李佳', 0, 0, NULL, NULL, '15909361091', NULL, NULL, 1),
(88, '刘冉', 0, 0, NULL, NULL, '15722917110', NULL, NULL, 1),
(89, '高天', 0, 0, NULL, NULL, '18883087505', NULL, NULL, 1),
(90, '刘莉', 0, 0, NULL, NULL, '13594859239', NULL, NULL, 1),
(91, '张颖佳', 0, 0, NULL, NULL, '18375751482', NULL, NULL, 1),
(92, '黄炼', 0, 0, NULL, NULL, '17602393485', NULL, NULL, 1),
(93, '彭隆冬', 0, 0, NULL, NULL, '13364068535', NULL, NULL, 1),
(94, '王孝炎', 0, 0, NULL, NULL, '13648333963', NULL, NULL, 1),
(95, '莫海英', 0, 0, NULL, NULL, '18883124215', NULL, NULL, 1),
(96, '代鹏', 0, 0, NULL, NULL, '18875211693', NULL, NULL, 1),
(97, '刘郎杰', 0, 0, NULL, NULL, '18883164332', NULL, NULL, 1),
(98, '向琼', 0, 0, NULL, NULL, '17723891743', NULL, NULL, 1),
(100, '曹志祥', 0, 0, NULL, NULL, '15084384134', NULL, NULL, 2),
(101, '庹小松', 0, 0, NULL, NULL, '18225497420', NULL, NULL, 2),
(102, '杨勇', 0, 0, NULL, NULL, '13272761563', NULL, NULL, 2),
(103, '杨强', 0, 0, NULL, NULL, '18380124726', NULL, NULL, 2),
(104, '谢志能', 0, 0, NULL, NULL, '13229001305', NULL, NULL, 2),
(105, '宋成乐', 0, 0, NULL, NULL, '18875263033', NULL, NULL, 2),
(106, '廖欢', 0, 0, NULL, NULL, '17815336060', NULL, NULL, 2),
(107, '罗玉李', 0, 0, NULL, NULL, '15823171934', NULL, NULL, 2),
(108, '易建川', 0, 0, NULL, NULL, '17300283808', NULL, NULL, 2),
(109, '郭效犇', 0, 0, NULL, NULL, '18893652539', NULL, NULL, 2),
(110, '李瑞欣', 0, 0, NULL, NULL, '18956560986', NULL, NULL, 2),
(111, '龙欢', 0, 0, NULL, NULL, '18784441342', NULL, NULL, 2),
(112, '杨柳', 0, 0, NULL, NULL, '15803097163', NULL, NULL, 2),
(113, '杨迪尘', 0, 0, NULL, NULL, '13608357405', NULL, NULL, 2),
(114, '杨琴', 0, 0, NULL, NULL, '18323780443', NULL, NULL, 2),
(115, '袁美月', 0, 0, NULL, NULL, '18580095963', NULL, NULL, 2),
(116, '张国政', 0, 0, NULL, NULL, '17623114442', NULL, NULL, 2),
(117, '倪红静', 0, 0, NULL, NULL, '15178728600', NULL, NULL, 2),
(118, '彭雅婷', 0, 0, NULL, NULL, '15123131001', NULL, NULL, 2),
(119, '代春生', 0, 0, NULL, NULL, '17623123862', NULL, NULL, 2),
(120, '牟红欣', 0, 0, NULL, NULL, '18883673086', NULL, NULL, 2),
(121, '白玛拉姆', 0, 0, NULL, NULL, '18696663937', NULL, NULL, 2),
(122, '丁开罗', 0, 0, NULL, NULL, '17623697830', NULL, NULL, 2),
(123, '彭艳', 0, 0, NULL, NULL, '13098610411', NULL, NULL, 2),
(124, '何泽红', 0, 0, NULL, NULL, '18225353672', NULL, NULL, 2),
(125, '汪林玉', 0, 0, NULL, NULL, '18223771048', NULL, NULL, 2),
(126, '苟云帆', 0, 0, NULL, NULL, '18723453225', NULL, NULL, 2),
(127, '李豪', 0, 0, NULL, NULL, '18696700703', NULL, NULL, 2),
(128, '刘静茹', 0, 0, NULL, NULL, '15340545498', NULL, NULL, 2),
(129, '柯静', 0, 0, NULL, NULL, '13101194747', NULL, NULL, 2),
(130, '林涛', 0, 0, NULL, NULL, '18602338026', NULL, NULL, 2),
(131, '周杨', 0, 0, NULL, NULL, '18423239324', NULL, NULL, 2),
(132, '李家豪', 0, 0, NULL, NULL, '13330242181', NULL, NULL, 2),
(133, '袁小彤', 0, 0, NULL, NULL, '15320218016', NULL, NULL, 2),
(134, '黄林', 0, 0, NULL, NULL, '18716714771', NULL, NULL, 2),
(135, '杨波', 0, 0, NULL, NULL, '13320248787', NULL, NULL, 2),
(136, '李林巧', 0, 0, NULL, NULL, '18509021235', NULL, NULL, 2),
(137, '任静', 0, 0, NULL, NULL, '15310928874', NULL, NULL, 2),
(138, '王雪', 0, 0, NULL, NULL, '15923674533', NULL, NULL, 2),
(139, '周子豪', 0, 0, NULL, NULL, '18503800575', NULL, NULL, 2),
(140, '左强', 0, 0, NULL, NULL, '18223257103', NULL, NULL, 3),
(141, '王鹏', 0, 0, NULL, NULL, '17725024068', NULL, NULL, 3),
(142, '田茜茜', 0, 0, NULL, NULL, '15123500402', NULL, NULL, 3),
(143, '刘思华', 0, 0, NULL, NULL, '15923099201', NULL, NULL, 3),
(144, '何欣宇', 0, 0, NULL, NULL, '17781080327', NULL, NULL, 3),
(145, '刘向淋', 0, 0, NULL, NULL, '15923027912', NULL, NULL, 3),
(146, '王伟楠', 0, 0, NULL, NULL, '18883324939', NULL, NULL, 3),
(147, '蒋松', 0, 0, NULL, NULL, '18883147482', NULL, NULL, 3),
(148, '李哲', 0, 0, NULL, NULL, '15878381923', NULL, NULL, 3),
(149, '刘青', 0, 0, NULL, NULL, '15736341840', NULL, NULL, 3),
(150, '王成艺', 0, 0, NULL, NULL, '17338352414', NULL, NULL, 3),
(151, '蒋彬彬', 0, 0, NULL, NULL, '15870487251', NULL, NULL, 3),
(152, '陈勇旭', 0, 0, NULL, NULL, '15223623808', NULL, NULL, 3),
(153, '陈鑫', 0, 0, NULL, NULL, '15723237263', NULL, NULL, 3),
(154, '王闽', 0, 0, NULL, NULL, '17358372015', NULL, NULL, 3),
(155, '孟天龙', 0, 0, NULL, NULL, '15703016617', NULL, NULL, 3),
(156, '杨清清', 0, 0, NULL, NULL, '15730098831', NULL, NULL, 3),
(157, '余红杰', 0, 0, NULL, NULL, '15730798334', NULL, NULL, 3),
(158, '李守飞', 0, 0, NULL, NULL, '18323444706', NULL, NULL, 3),
(159, '陈林', 0, 0, NULL, NULL, '15870560984', NULL, NULL, 3),
(160, '罗盼', 0, 0, NULL, NULL, '17815377732', NULL, NULL, 3),
(161, '冉承', 0, 0, NULL, NULL, '13658486449', NULL, NULL, 3),
(162, '何翰霖', 0, 0, NULL, NULL, '18184054702', NULL, NULL, 3),
(163, '刘星雨', 0, 0, NULL, NULL, '15870469588', NULL, NULL, 3),
(164, '罗涛', 0, 0, NULL, NULL, '15182541009', NULL, NULL, 3),
(165, '万梓杰', 0, 0, NULL, NULL, '15823903405', NULL, NULL, 3),
(166, '周渝', 0, 0, NULL, NULL, '15023039886', NULL, NULL, 3),
(167, '刘永弘', 0, 0, NULL, NULL, '18723821810', NULL, NULL, 3),
(168, '陈代勇', 0, 0, NULL, NULL, '18306073956', NULL, NULL, 3),
(169, '蔡畅', 0, 0, NULL, NULL, '15923315441', NULL, NULL, 3),
(170, '冉茂权', 0, 0, NULL, NULL, '13068384040', NULL, NULL, 3),
(171, '杨旺', 0, 0, NULL, NULL, '18323775634', NULL, NULL, 3),
(172, '向志峥', 0, 0, NULL, NULL, '17783575289', NULL, NULL, 3),
(173, '卿登科', 0, 0, NULL, NULL, '18223252524', NULL, NULL, 3),
(174, '魏佳欢', 0, 0, NULL, NULL, '15142170208', NULL, NULL, 3),
(175, '罗凤', 0, 0, NULL, NULL, '15320802331', NULL, NULL, 3),
(176, '蔡文婷', 0, 0, NULL, NULL, '18117926036', NULL, NULL, 3),
(177, '朱涛', 0, 0, NULL, NULL, '15181830781', NULL, NULL, 3),
(178, '蒋航', 0, 0, NULL, NULL, '17815379580', NULL, NULL, 3),
(179, '柯凤飞', 0, 0, NULL, NULL, '15095894020', NULL, NULL, 3),
(180, '汪涵', 0, 0, NULL, NULL, '15520169841', NULL, NULL, 3),
(181, '吴雅琴', 0, 0, NULL, NULL, '15923667895', NULL, NULL, 3),
(182, '杜鑫艳', 0, 0, NULL, NULL, '18781667665', NULL, NULL, 3),
(183, '夏永诚', 0, 0, NULL, NULL, '15808453051', NULL, NULL, 3),
(184, '李益', 0, 0, NULL, NULL, '17623308694', NULL, NULL, 3),
(185, '杨华山', 0, 0, NULL, NULL, '18225437236', NULL, NULL, 3),
(186, '郭洪', 0, 0, NULL, NULL, '15215034251', NULL, NULL, 3),
(187, '贺子龙', 0, 0, NULL, NULL, '13897402518', NULL, NULL, 3),
(188, '赵福源', 0, 0, NULL, NULL, '1871537959', NULL, NULL, 3),
(189, '赵廷翠', 0, 0, NULL, NULL, '17815377026', NULL, NULL, 3),
(190, '李星怡', 0, 0, NULL, NULL, '13980929042', NULL, NULL, 3),
(191, '曾宪蓉', 0, 0, NULL, NULL, '18723164437', NULL, NULL, 3),
(192, '王小玉', 0, 0, NULL, NULL, '18598518256', NULL, NULL, 3),
(193, '叶贵川', 0, 0, NULL, NULL, '15102350533', NULL, NULL, 3),
(194, '丛雨', 0, 0, NULL, NULL, '18840873649', NULL, NULL, 3),
(195, '何虎', 0, 0, NULL, NULL, '18883162956', NULL, NULL, 3),
(196, '龚剑', 0, 0, NULL, NULL, '13452391875', NULL, NULL, 3),
(197, '张佳乐', 0, 0, NULL, NULL, '15723061381', NULL, NULL, 3),
(198, '王勇达', 0, 0, NULL, NULL, '15923091395', NULL, NULL, 3),
(199, '雷科鹏', 0, 0, NULL, NULL, '18883134367', NULL, NULL, 3),
(200, '唐庆凯', 0, 0, NULL, NULL, '17602440668', NULL, NULL, 3),
(201, '许愿', 0, 0, NULL, NULL, '13224021046', NULL, NULL, 3),
(202, '谢卓言', 0, 0, NULL, NULL, '19923033075', NULL, NULL, 3),
(203, '王豪豪', 0, 0, NULL, NULL, '15093542362', NULL, NULL, 3),
(204, '周洪名', 0, 0, NULL, NULL, '15923083057', NULL, NULL, 3),
(205, '王芃凇', 0, 0, NULL, NULL, '18581492852', NULL, NULL, 3),
(206, '张凯棋', 0, 0, NULL, NULL, '18883146267', NULL, NULL, 3),
(207, '刘志豪', 0, 0, NULL, NULL, '17716992615', NULL, NULL, 3),
(208, '周新伟', 0, 0, NULL, NULL, '18842985768', NULL, NULL, 3),
(209, '马宏韬', 0, 0, NULL, NULL, '17640620921', NULL, NULL, 3),
(210, '袁静', 0, 0, NULL, NULL, '15923067506', NULL, NULL, 3),
(211, '隗彬', 0, 0, NULL, NULL, '15523224114', NULL, NULL, 3),
(212, '刘杰', 0, 0, NULL, NULL, '17783500386', NULL, NULL, 3),
(213, '金晓勇', 0, 0, NULL, NULL, '18202338576', NULL, NULL, 3),
(214, '谢娇', 0, 0, NULL, NULL, '15923979002', NULL, NULL, 3),
(215, '李欣', 0, 0, NULL, NULL, '17815378781', NULL, NULL, 3),
(216, '刘秀', 0, 0, NULL, NULL, '15656831863', NULL, NULL, 3),
(217, '田和昆', 0, 0, NULL, NULL, '17725077333', NULL, NULL, 3),
(218, '谢馨红', 0, 0, NULL, NULL, '18323904820', NULL, NULL, 3),
(219, '潘正锴', 0, 0, NULL, NULL, '15923328321', NULL, NULL, 3),
(220, '游小莉', 0, 0, NULL, NULL, '18883254970', NULL, NULL, 3),
(221, '刘炜', 0, 0, NULL, NULL, '15730675593', NULL, NULL, 3),
(222, '刘爽', 0, 0, NULL, NULL, '13062339465', NULL, NULL, 3),
(223, '王聪', 0, 0, NULL, NULL, '18875058220', NULL, NULL, 3),
(224, '张芷菱', 0, 0, NULL, NULL, '13983408851', NULL, NULL, 3),
(225, '蔡仁伟', 0, 0, NULL, NULL, '15102354952', NULL, NULL, 3),
(226, '蔡沅之', 0, 0, NULL, NULL, '18166307577', NULL, NULL, 3),
(227, '范志洪', 0, 0, NULL, NULL, '18875280680', NULL, NULL, 4),
(228, '何晓盼', 0, 0, NULL, NULL, '18883606046', NULL, NULL, 4),
(229, '安松', 0, 0, NULL, NULL, '13996929335', NULL, NULL, 4),
(230, '吴松洋', 0, 0, NULL, NULL, '17736123440', NULL, NULL, 4),
(231, '李勇', 0, 0, NULL, NULL, '18716330039', NULL, NULL, 4),
(232, '曾艳', 0, 0, NULL, NULL, '15202348036', NULL, NULL, 4),
(233, '冉博文', 0, 0, NULL, NULL, '18723764800', NULL, NULL, 4),
(234, '谢豪洁', 0, 0, NULL, NULL, '18723397819', NULL, NULL, 4),
(235, '黄静文', 0, 0, NULL, NULL, '19936402167', NULL, NULL, 4),
(236, '苏功婷', 0, 0, NULL, NULL, '13098609625', NULL, NULL, 4),
(237, '张阗', 0, 0, NULL, NULL, '18723094767', NULL, NULL, 4),
(238, '刘鑫', 0, 0, NULL, NULL, '18623081590', NULL, NULL, 4),
(239, '贺江升', 0, 0, NULL, NULL, '17774943337', NULL, NULL, 4),
(240, '苏考财', 0, 0, NULL, NULL, '18723095460', NULL, NULL, 4),
(241, '李成林', 0, 0, NULL, NULL, '13635308842', NULL, NULL, 4),
(242, '黄醇洋', 0, 0, NULL, NULL, '15803635947', NULL, NULL, 4),
(243, '吴朝鲜', 0, 0, NULL, NULL, '18375651689', NULL, NULL, 4),
(244, '谭兰萍', 0, 0, NULL, NULL, '15683502206', NULL, NULL, 4),
(245, '黎傲然', 0, 0, NULL, NULL, '19923163025', NULL, NULL, 4),
(246, '杨仕林', 0, 0, NULL, NULL, '17623402012', NULL, NULL, 4),
(247, '杨婷', 0, 0, NULL, NULL, '18323785279', NULL, NULL, 4),
(248, '冉丽', 0, 0, NULL, NULL, '17729677092', NULL, NULL, 4),
(249, '周雪', 0, 0, NULL, NULL, '18580095378', NULL, NULL, 4),
(250, '龚建', 0, 0, NULL, NULL, '13272549253', NULL, NULL, 4),
(251, '周治西', 0, 0, NULL, NULL, '15310334612', NULL, NULL, 4),
(252, '韦清波', 0, 0, NULL, NULL, '13500326594', NULL, NULL, 4),
(253, '黄梓川', 0, 0, NULL, NULL, '13618397048', NULL, NULL, 4),
(254, '夏家豪', 0, 0, NULL, NULL, '15023666053', NULL, NULL, 4),
(255, '龚凤怡', 0, 0, NULL, NULL, '13658471608', NULL, NULL, 4),
(256, '苏白', 0, 0, NULL, NULL, '13896900800', NULL, NULL, 4),
(257, '牛启华', 0, 0, NULL, NULL, '18290537841', NULL, NULL, 4),
(258, '唐辉贵', 0, 0, NULL, NULL, '18398497538', NULL, NULL, 4),
(259, '梁勇', 0, 0, NULL, NULL, '18315090734', NULL, NULL, 4),
(260, '龙雨', 0, 0, NULL, NULL, '17623183327', NULL, NULL, 4),
(261, '梁川', 0, 0, NULL, NULL, '17823220885', NULL, NULL, 4),
(262, '王姝蘅', 0, 0, NULL, NULL, '15825984373', NULL, NULL, 4),
(263, '温亭松', 0, 0, NULL, NULL, '17353135573', NULL, NULL, 4),
(264, '李昊', 0, 0, NULL, NULL, '18837996526', NULL, NULL, 4),
(265, '张擎天', 0, 0, NULL, NULL, '13206107551', NULL, NULL, 4),
(266, '陈小渝', 0, 0, NULL, NULL, '13637962528', NULL, NULL, 4),
(267, '陈苗苗', 0, 0, NULL, NULL, '13370744072', NULL, NULL, 4),
(268, '张皓凌', 0, 0, NULL, NULL, '13658442646', NULL, NULL, 4),
(269, '曹航', 0, 0, NULL, NULL, '17815366624', NULL, NULL, 4),
(270, '肖涛', 0, 0, NULL, NULL, '13668431517', NULL, NULL, 4),
(271, '张林', 0, 0, NULL, NULL, '18883182297', NULL, NULL, 4),
(272, '苏馨', 0, 0, NULL, NULL, '13618338500', NULL, NULL, 4),
(273, '肖杰', 0, 0, NULL, NULL, '17623082417', NULL, NULL, 4),
(274, '何祥', 0, 0, NULL, NULL, '15823067847', NULL, NULL, 4),
(275, '涂家辉', 0, 0, NULL, NULL, '17726637696', NULL, NULL, 4),
(276, '杨晓燕', 0, 0, NULL, NULL, '17764872990', NULL, NULL, 4),
(277, '郑建娃', 0, 0, NULL, NULL, '13108986620', NULL, NULL, 4),
(278, '郭合法', 0, 0, NULL, NULL, '13206012267', NULL, NULL, 4),
(279, '邱调双', 0, 0, NULL, NULL, '15023468293', NULL, NULL, 4),
(280, '何顺洪', 0, 0, NULL, NULL, '13452750262', NULL, NULL, 4),
(281, '李渝涛', 0, 0, NULL, NULL, '15703060835', NULL, NULL, 4),
(282, '秦琦琦', 0, 0, NULL, NULL, '13272806239', NULL, NULL, 4),
(283, '师子齐', 0, 0, NULL, NULL, '15298033487', NULL, NULL, 4),
(284, '张峻豪', 0, 0, NULL, NULL, '13220209815', NULL, NULL, 4),
(285, '冯江艳', 0, 0, NULL, NULL, '18423674772', NULL, NULL, 4),
(286, '钟金毅', 0, 0, NULL, NULL, '18983098373', NULL, NULL, 4),
(287, '杨艳琳', 0, 0, NULL, NULL, '18875281193', NULL, NULL, 4),
(288, '杨华群', 0, 0, NULL, NULL, '15770258043', NULL, NULL, 4),
(289, '万怡', 0, 0, NULL, NULL, '17815378758', NULL, NULL, 4),
(290, '冯霜蓉', 0, 0, NULL, NULL, '18423249381', NULL, NULL, 4),
(291, '刘雷', 0, 0, NULL, NULL, '13042335671', NULL, NULL, 4),
(292, '张刚', 0, 0, NULL, NULL, '13983461265', NULL, NULL, 4),
(293, '陈方浩', 0, 0, NULL, NULL, '15334618757', NULL, NULL, 4),
(294, '张鑫烽', 0, 0, NULL, NULL, '18736573612', NULL, NULL, 4),
(295, '皮金川', 0, 0, NULL, NULL, '17723133155', NULL, NULL, 4),
(296, '唐鹏飞', 0, 0, NULL, NULL, '13350129707', NULL, NULL, 4),
(297, '任书鑫', 0, 0, NULL, NULL, '14755714097', NULL, NULL, 4),
(298, '张卫', 0, 0, NULL, NULL, '18723901267', NULL, NULL, 4),
(299, '梁夏', 0, 0, NULL, NULL, '15223444624', NULL, NULL, 4),
(300, '李鹏娟', 0, 0, NULL, NULL, '17815378903', NULL, NULL, 4),
(301, '廖春梅', 0, 0, NULL, NULL, '17815379661', NULL, NULL, 4),
(302, '韦屿涛', 0, 0, NULL, NULL, '18315164625', NULL, NULL, 4),
(303, '王科', 0, 0, NULL, NULL, '18225137003', NULL, NULL, 4),
(304, '郭儒龙', 0, 0, NULL, NULL, '18302361862', NULL, NULL, 4),
(305, '陈港', 0, 0, NULL, NULL, '15084481034', NULL, NULL, 4),
(306, '贺愈婷', 0, 0, NULL, NULL, '15213668143', NULL, NULL, 4),
(307, '杜敏睿', 0, 0, NULL, NULL, '15213061737', NULL, NULL, 4),
(308, '毛文静', 0, 0, NULL, NULL, '18996541498', NULL, NULL, 4),
(309, '明洋', 0, 0, NULL, NULL, '17382270045', NULL, NULL, 4),
(310, '唐志祥', 0, 0, NULL, NULL, '17815379793', NULL, NULL, 4),
(311, '张鑫', 0, 0, NULL, NULL, '15683186453', NULL, NULL, 4),
(312, '李洋', 0, 0, NULL, NULL, '17815377717', NULL, NULL, 4),
(313, '焦俊峰', 0, 0, NULL, NULL, '15523232083', NULL, NULL, 4),
(314, '刘新海', 0, 0, NULL, NULL, '19939335273', NULL, NULL, 4),
(315, '张志恒', 0, 0, NULL, NULL, '13462652850', NULL, NULL, 4),
(316, '陈烬', 0, 0, NULL, NULL, '15736321640', NULL, NULL, 4),
(317, '田海明', 0, 0, NULL, NULL, '15923232098', NULL, NULL, 4),
(318, '李睿', 0, 0, NULL, NULL, '13018394742', NULL, NULL, 5),
(319, '向巧丽', 0, 0, NULL, NULL, '15823797357', NULL, NULL, 5),
(320, '郑惠文', 0, 0, NULL, NULL, '18886452354', NULL, NULL, 5),
(321, '马理鹏', 0, 0, NULL, NULL, '18883149976', NULL, NULL, 5),
(322, '何明慧', 0, 0, NULL, NULL, '15684597534', NULL, NULL, 5),
(323, '余柏林', 0, 0, NULL, NULL, '17784459684', NULL, NULL, 5),
(324, '黄灿', 0, 0, NULL, NULL, '13667485658', NULL, NULL, 5),
(325, '万治强', 0, 0, NULL, NULL, '15870564581', NULL, NULL, 5),
(326, '蔡明恋', 0, 0, NULL, NULL, '17783547385', NULL, NULL, 5),
(327, '雷明华', 0, 0, NULL, NULL, '18225275974', NULL, NULL, 5),
(328, '蔡雨', 0, 0, NULL, NULL, '17394742563', NULL, NULL, 5),
(329, '张梦', 0, 0, NULL, NULL, '13018365821', NULL, NULL, 5),
(330, '岳嵩', 0, 0, NULL, NULL, '18875271132', NULL, NULL, 5),
(331, '石嘉雯', 0, 0, NULL, NULL, '18723075815', NULL, NULL, 5),
(332, '刘艳', 0, 0, NULL, NULL, '18875280294', NULL, NULL, 5),
(333, '蒋文彬', 0, 0, NULL, NULL, '15923254371', NULL, NULL, 5),
(334, '易成才', 0, 0, NULL, NULL, '17623131464', NULL, NULL, 5),
(335, '范涛', 0, 0, NULL, NULL, '17815376393', NULL, NULL, 5),
(336, '牛婉莹', 0, 0, NULL, NULL, '17815378845', NULL, NULL, 5),
(337, '谭智', 0, 0, NULL, NULL, '15881882136', NULL, NULL, 5),
(338, '唐耀坤', 0, 0, NULL, NULL, '15826144826', NULL, NULL, 5),
(339, '宋文懋', 0, 0, NULL, NULL, '18182271798', NULL, NULL, 5),
(340, '丁祖琴', 0, 0, NULL, NULL, '15178962610', NULL, NULL, 5),
(341, '龙昕', 0, 0, NULL, NULL, '15730498136', NULL, NULL, 5),
(342, '陈朋', 0, 0, NULL, NULL, '17725080627', NULL, NULL, 5),
(343, '陈申铃', 0, 0, NULL, NULL, '18018294800', NULL, NULL, 5),
(344, '何子晨', 0, 0, NULL, NULL, '15109007431', NULL, NULL, 5),
(345, '周海玲', 0, 0, NULL, NULL, '18725630242', NULL, NULL, 5),
(346, '周帆', 0, 0, NULL, NULL, '15723227982', NULL, NULL, 5),
(347, '洪星', 0, 0, NULL, NULL, '18883127833', NULL, NULL, 5),
(348, '杨震', 0, 0, NULL, NULL, '15178705436', NULL, NULL, 5),
(349, '李峻帆', 0, 0, NULL, NULL, '13048414125', NULL, NULL, 5),
(350, '彭遂强', 0, 0, NULL, NULL, '15730317378', NULL, NULL, 5),
(351, '陈维', 0, 0, NULL, NULL, '18523542108', NULL, NULL, 5),
(352, '罗三盛', 0, 0, NULL, NULL, '17320432772', NULL, NULL, 5),
(353, '李悦', 0, 0, NULL, NULL, '18183125048', NULL, NULL, 5),
(354, '李林虎', 0, 0, NULL, NULL, '17815379965', NULL, NULL, 5),
(355, '唐玉霞', 0, 0, NULL, NULL, '13042335505', NULL, NULL, 5),
(356, '贺文静', 0, 0, NULL, NULL, '19802374958', NULL, NULL, 5),
(357, '杨会军', 0, 0, NULL, NULL, '15123494132', NULL, NULL, 5),
(358, '罗浩霖', 0, 0, NULL, NULL, '17623244789', NULL, NULL, 5),
(359, '廖恒', 0, 0, NULL, NULL, '13110289250', NULL, NULL, 5),
(360, '梁开欣', 0, 0, NULL, NULL, '13350370668', NULL, NULL, 5),
(361, '朱浩', 0, 0, NULL, NULL, '18175090317', NULL, NULL, 5),
(362, '张国善', 0, 0, NULL, NULL, '17723898165', NULL, NULL, 5),
(363, '李泰言', 0, 0, NULL, NULL, '15140769815', NULL, NULL, 5),
(364, '马晓寒', 0, 0, NULL, NULL, '15923914847', NULL, NULL, 5),
(365, '查敏斌', 0, 0, NULL, NULL, '19912452715', NULL, NULL, 5),
(366, '秦蔚', 0, 0, NULL, NULL, '18723091242', NULL, NULL, 5),
(367, '陶露露', 0, 0, NULL, NULL, '18224363126', NULL, NULL, 5),
(368, '邓宏', 0, 0, NULL, NULL, '15923040496', NULL, NULL, 5),
(369, '黄珊', 0, 0, NULL, NULL, '15282009335', NULL, NULL, 5),
(370, '何帅', 0, 0, NULL, NULL, '15393532172', NULL, NULL, 5),
(371, '任梦迪', 0, 0, NULL, NULL, '18375972203', NULL, NULL, 5),
(372, '李洪彬', 0, 0, NULL, NULL, '15223041441', NULL, NULL, 5),
(373, '谢艳玲', 0, 0, NULL, NULL, '17383087432', NULL, NULL, 5),
(374, '王鹏程', 0, 0, NULL, NULL, '13224031855', NULL, NULL, 5),
(375, '辜俊鑫', 0, 0, NULL, NULL, '13272935142', NULL, NULL, 5),
(376, '汪妍', 0, 0, NULL, NULL, '13272935143', NULL, NULL, 5),
(377, '袁慧娟', 0, 0, NULL, NULL, '13272935144', NULL, NULL, 5),
(378, '王红艳', 0, 0, NULL, NULL, '13272935145', NULL, NULL, 5),
(379, '黎南庆', 0, 0, NULL, NULL, '13272935146', NULL, NULL, 5),
(380, '彭卫东', 0, 0, NULL, NULL, '17623665752', NULL, NULL, 5),
(381, '张元卫', 0, 0, NULL, NULL, '17815379190', NULL, NULL, 5),
(382, '沈丹丹', 0, 0, NULL, NULL, '17784294470', NULL, NULL, 5),
(383, '李庆攀', 0, 0, NULL, NULL, '18723771223', NULL, NULL, 5),
(384, '李汶峰', 0, 0, NULL, NULL, '13220208856', NULL, NULL, 5),
(385, '杨欣欣', 0, 0, NULL, NULL, '13032307200', NULL, NULL, 5),
(386, '徐琪妍', 0, 0, NULL, NULL, '13617605023', NULL, NULL, 5),
(387, '殷宗军', 0, 0, NULL, NULL, '18875284697', NULL, NULL, 5),
(388, '蒋学勇', 0, 0, NULL, NULL, '15223474637', NULL, NULL, 5),
(389, '刘译焱', 0, 0, NULL, NULL, '13272610657', NULL, NULL, 5),
(390, '梁鑫', 0, 0, NULL, NULL, '15978988710', NULL, NULL, 5),
(391, '田兴翠', 0, 0, NULL, NULL, '13048452463', NULL, NULL, 5),
(392, '杨洪程', 0, 0, NULL, NULL, '18896048017', NULL, NULL, 5),
(393, '何东林', 0, 0, NULL, NULL, '13028343648', NULL, NULL, 5),
(394, '潘登', 0, 0, NULL, NULL, '13983613822', NULL, NULL, 5),
(395, '赵爽', 0, 0, NULL, NULL, '15683656919', NULL, NULL, 5),
(396, '吴鹏', 0, 0, NULL, NULL, '18225324516', NULL, NULL, 5),
(397, '范涛', 0, 0, NULL, NULL, '18284662178', NULL, NULL, 5),
(398, '谭玲玲', 0, 0, NULL, NULL, '15923872589', NULL, NULL, 5),
(399, '龚丹', 0, 0, NULL, NULL, '18323667042', NULL, NULL, 5),
(400, '张海伟', 0, 0, NULL, NULL, '18883162841', NULL, NULL, 6),
(401, '樊远江', 0, 0, NULL, NULL, '15334537865', NULL, NULL, 6),
(402, '李超', 0, 0, NULL, NULL, '15196545953', NULL, NULL, 6),
(403, '刘江', 0, 0, NULL, NULL, '18883328446', NULL, NULL, 6),
(404, '包竹君 ', 0, 0, NULL, NULL, '18323979160', NULL, NULL, 6),
(405, '蹇霞 ', 0, 0, NULL, NULL, '18723464620', NULL, NULL, 6),
(406, '易林奎', 0, 0, NULL, NULL, '18983426454', NULL, NULL, 6),
(407, '余清清', 0, 0, NULL, NULL, '18375835743', NULL, NULL, 6),
(408, '黄美术', 0, 0, NULL, NULL, '17782249077', NULL, NULL, 6),
(409, '董佳明', 0, 0, NULL, NULL, '17784726708', NULL, NULL, 6),
(410, '许红艳', 0, 0, NULL, NULL, '18702350896', NULL, NULL, 6),
(411, '张欢', 0, 0, NULL, NULL, '13212590316', NULL, NULL, 6),
(412, '何海容', 0, 0, NULL, NULL, '15983988029', NULL, NULL, 6),
(413, '张佳', 0, 0, NULL, NULL, '15223161540', NULL, NULL, 6),
(414, '袁晨', 0, 0, NULL, NULL, '15340591443', NULL, NULL, 6),
(415, '陆思宇', 0, 0, NULL, NULL, '17725166345', NULL, NULL, 6),
(416, '肖源', 0, 0, NULL, NULL, '15823434367', NULL, NULL, 6),
(417, '吴祖鹏', 0, 0, NULL, NULL, '15501816530', NULL, NULL, 6),
(418, '魏莉', 0, 0, NULL, NULL, '18598566102', NULL, NULL, 6),
(419, '毛各浩', 0, 0, NULL, NULL, '18315012453', NULL, NULL, 6),
(420, '张颢鹏', 0, 0, NULL, NULL, '17725164533', NULL, NULL, 6),
(421, '杨明', 0, 0, NULL, NULL, '13866752697', NULL, NULL, 6),
(422, '杨可悦', 0, 0, NULL, NULL, '15730487767', NULL, NULL, 6),
(423, '赵文青', 0, 0, NULL, NULL, '17830370808', NULL, NULL, 6),
(424, '冉桂玲', 0, 0, NULL, NULL, '13638292537', NULL, NULL, 6),
(425, '罗小芳 ', 0, 0, NULL, NULL, '18324144904', NULL, NULL, 6),
(426, '胡赛赛', 0, 0, NULL, NULL, '17815366804', NULL, NULL, 6),
(427, '于佳加', 0, 0, NULL, NULL, '18324129587', NULL, NULL, 6),
(428, '明晓蝶', 0, 0, NULL, NULL, '18748591863', NULL, NULL, 6),
(429, '梅宗清', 0, 0, NULL, NULL, '13320214049', NULL, NULL, 6),
(430, '窦伟华', 0, 0, NULL, NULL, '13368444951', NULL, NULL, 6),
(431, '张真', 0, 0, NULL, NULL, '17737262889', NULL, NULL, 6),
(432, '向春莲', 0, 0, NULL, NULL, '18883160440', NULL, NULL, 6),
(433, '张本文', 0, 0, NULL, NULL, '13609458090', NULL, NULL, 6),
(434, '金啸隆', 0, 0, NULL, NULL, '17830369288', NULL, NULL, 6),
(435, '严俐', 0, 0, NULL, NULL, '18323873307', NULL, NULL, 6),
(436, '郎昊', 0, 0, NULL, NULL, '18315033493', NULL, NULL, 6),
(437, '陈印', 0, 0, NULL, NULL, '13638244023', NULL, NULL, 6),
(438, '姚灵辉', 0, 0, NULL, NULL, '18883105406', NULL, NULL, 6),
(439, '谭俊波', 0, 0, NULL, NULL, '13388941022', NULL, NULL, 6),
(440, '焦彦霖', 0, 0, NULL, NULL, '13034150473', NULL, NULL, 6),
(441, '申鹏', 0, 0, NULL, NULL, '18386041853', NULL, NULL, 6),
(442, '景海洋', 0, 0, NULL, NULL, '13772590745', NULL, NULL, 6),
(443, '王景芳', 0, 0, NULL, NULL, '18223860104', NULL, NULL, 6),
(444, '温择', 0, 0, NULL, NULL, '17784722456', NULL, NULL, 6),
(445, '李奇磊', 0, 0, NULL, NULL, '17320380383', NULL, NULL, 6),
(446, '田新鑫', 0, 0, NULL, NULL, '13594731506', NULL, NULL, 6),
(447, '徐顺淋', 0, 0, NULL, NULL, '13647634369', NULL, NULL, 6),
(448, '罗慧敏', 0, 0, NULL, NULL, '18315023885', NULL, NULL, 6),
(449, '廖俊霖', 0, 0, NULL, NULL, '13594120232', NULL, NULL, 6),
(450, '彭羚', 0, 0, NULL, NULL, '15620825769', NULL, NULL, 6),
(451, '徐崇森', 0, 0, NULL, NULL, '15123603584', NULL, NULL, 6),
(452, '黄进', 0, 0, NULL, NULL, '15723542241', NULL, NULL, 6),
(453, '贾明超', 0, 0, NULL, NULL, '19912457079', NULL, NULL, 6),
(454, '吴雨凤', 0, 0, NULL, NULL, '17815172050', NULL, NULL, 6),
(455, '曾智鸿', 0, 0, NULL, NULL, '18722912691', NULL, NULL, 6),
(456, '喻峡蜂', 0, 0, NULL, NULL, '15213002994', NULL, NULL, 6),
(457, '殷宗吕', 0, 0, NULL, NULL, '15320349082', NULL, NULL, 6),
(458, '刘剑', 0, 0, NULL, NULL, '17830143458', NULL, NULL, 6),
(459, '邹洋龙', 0, 0, NULL, NULL, '17313294316', NULL, NULL, 6),
(460, '白杨', 0, 0, NULL, NULL, '18054197282', NULL, NULL, 6),
(461, '聂君', 0, 0, NULL, NULL, '15730475447', NULL, NULL, 6),
(462, '何茜', 0, 0, NULL, NULL, '18996018516', NULL, NULL, 6),
(463, '唐银隆', 0, 0, NULL, NULL, '15223380468', NULL, NULL, 6),
(464, '李俊霖', 0, 0, NULL, NULL, '18323214518', NULL, NULL, 6),
(465, '陈心田', 0, 0, NULL, NULL, '17623014642', NULL, NULL, 6),
(466, '吴生花', 0, 0, NULL, NULL, '15683558437', NULL, NULL, 6),
(467, '冉翠婷', 0, 0, NULL, NULL, '18423691869', NULL, NULL, 6),
(468, '陈玄', 0, 0, NULL, NULL, '15086855066', NULL, NULL, 6),
(469, '杨鑫', 0, 0, NULL, NULL, '13996627903', NULL, NULL, 6),
(470, '唐燕', 0, 0, NULL, NULL, '13983927483', NULL, NULL, 6),
(471, '陈梦真', 0, 0, NULL, NULL, '18996143573', NULL, NULL, 6),
(472, '朱建凤', 0, 0, NULL, NULL, '13320214402', NULL, NULL, 6),
(473, '王淑熔', 0, 0, NULL, NULL, '17623053341', NULL, NULL, 6),
(474, '花花', 0, 0, NULL, NULL, '13594855872', NULL, NULL, 6),
(475, 'VIP', 0, 0, NULL, NULL, '18375928109', NULL, NULL, 6),
(476, '王双', 0, 0, NULL, NULL, '15922542323', NULL, NULL, 1),
(477, '罗建忠', 0, 0, NULL, NULL, '18908311444', NULL, NULL, 1),
(478, '冯显志', 0, 0, NULL, NULL, '1544444449', NULL, NULL, 4),
(479, '冯显志', 0, 0, NULL, NULL, '15666666666', NULL, NULL, 6),
(480, '冯显志', 0, 0, NULL, NULL, '15111111111', NULL, NULL, 1),
(481, '冯显志', 0, 0, NULL, NULL, '15222222222', NULL, NULL, 2),
(482, '冯显志', 0, 0, NULL, NULL, '15333333333', NULL, NULL, 3),
(483, '冯显志', 0, 0, NULL, NULL, '15555555555', NULL, NULL, 5),
(484, '冯显志', 0, 0, NULL, NULL, '13333333333', NULL, NULL, 3),
(485, '冯显志', 0, 0, NULL, NULL, '11111111111', NULL, NULL, 1),
(486, '冯显志', 0, 0, NULL, NULL, '12222222222', NULL, NULL, 2),
(487, '冯显志', 0, 0, NULL, NULL, '14444444444', NULL, NULL, 4),
(488, '冯显志', 0, 0, NULL, NULL, '14555555555', NULL, NULL, 5),
(489, '冯显志', 0, 0, NULL, NULL, '16666666666', NULL, NULL, 6),
(490, '罗艳丽', 0, 0, NULL, NULL, '15123357564', NULL, NULL, 1),
(491, '谢俊胜', 0, 0, NULL, NULL, '15523566844', NULL, NULL, 1),
(492, '周姣', 0, 0, NULL, NULL, '15702301641', NULL, NULL, 1),
(493, '任波凡', 0, 0, NULL, NULL, '15320395242', NULL, NULL, 1),
(494, '徐家亮', 0, 0, NULL, NULL, '17347912434', NULL, NULL, 1),
(495, '杨柳', 0, 0, NULL, NULL, '18883280187', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- 表的结构 `sent_develop`
--

CREATE TABLE IF NOT EXISTS `sent_develop` (
  `id` int(11) unsigned NOT NULL,
  `person` varchar(20) NOT NULL COMMENT '合伙人或队员电话号码',
  `name` varchar(20) DEFAULT NULL COMMENT '学员姓名',
  `develop_time` int(11) NOT NULL COMMENT '开发时间',
  `tel` varchar(20) NOT NULL COMMENT '学员电话号码',
  `channel` text NOT NULL COMMENT '资源获取途径',
  `one` text COMMENT '一次跟进情况',
  `two` text COMMENT '两次跟进情况',
  `three` text COMMENT '三次跟进情况',
  `deal_time` int(11) DEFAULT NULL COMMENT '预计成交时间',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `update_time` bigint(11) DEFAULT NULL COMMENT '跟进时间'
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='开发记录';

--
-- 转存表中的数据 `sent_develop`
--

INSERT INTO `sent_develop` (`id`, `person`, `name`, `develop_time`, `tel`, `channel`, `one`, `two`, `three`, `deal_time`, `remark`, `update_time`) VALUES
(1, '13594855872', NULL, 1541206346, '13594855004', '网上', NULL, NULL, NULL, NULL, NULL, 0),
(3, '13594855872', NULL, 1544256346, '13594855005', '网上', NULL, NULL, NULL, NULL, NULL, 0),
(4, '18375928109', '嘿嘿嘿', 1544596188, '18885202685', '软碟通', '111', '222', '', 1544682420, NULL, 230174725499),
(5, '18375928109', '啊啊啊', 1544596501, '18885202688', '阿萨斯', '111', '22', '333', 1544769240, NULL, 229354271099);

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
  `description` char(140) DEFAULT '' COMMENT '描述',
  `model_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容模型ID',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '推荐位',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `cover_id` int(10) unsigned DEFAULT NULL COMMENT '封面',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '可见性',
  `deadline` int(10) unsigned DEFAULT NULL COMMENT '截至时间',
  `attach` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件数量',
  `view` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览量',
  `comment` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '扩展统计字段',
  `level` int(10) NOT NULL DEFAULT '0' COMMENT '优先级',
  `is_top` int(2) NOT NULL DEFAULT '0' COMMENT '是否置顶',
  `create_time` int(10) unsigned DEFAULT NULL COMMENT '创建时间',
  `update_time` int(10) unsigned DEFAULT NULL COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `school_id` smallint(6) NOT NULL DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=287 DEFAULT CHARSET=utf8 COMMENT='文档模型基础表';

--
-- 转存表中的数据 `sent_document`
--

INSERT INTO `sent_document` (`id`, `uid`, `name`, `title`, `category_id`, `description`, `model_id`, `position`, `link_id`, `cover_id`, `display`, `deadline`, `attach`, `view`, `comment`, `extend`, `level`, `is_top`, `create_time`, `update_time`, `status`, `school_id`) VALUES
(17, 1, '', '报名即可参加万人电音节', 2, '', 2, 1, 0, 20, 0, 1541054302, 0, 2, 0, 0, 0, 0, 1541054302, 1541054356, 2, 1),
(111, 1, '', '0999', 8, NULL, 4, 0, 0, 217, 1, 1543996791, 0, 0, 0, 0, 0, 0, 1543734578, 1543996790, 1, 1),
(256, 1, '', '11', 8, '报名页banner图', 4, 0, 0, 221, 1, 1543997061, 0, 0, 0, 0, 0, 0, 1543997061, 1543997061, 1, 1),
(274, 1, '', '222', 1, NULL, 4, 0, 0, 271, 1, 1544673878, 0, 0, 0, 0, 0, 0, 1544673779, 1544673878, 1, 4),
(273, 1, '', '111111', 1, '首页banner图', 4, 0, 0, 270, 1, 1544673752, 0, 0, 0, 0, 0, 0, 1544673752, 1544673752, 1, 4),
(268, 1, '', '5', 9, '最美鼎吉滚动图', 3, 0, 0, 245, 1, 1544436474, 0, 0, 0, 0, 0, 0, 1544436474, 1544436474, 1, 1),
(21, 1, '', '走进鼎吉1', 3, '', 3, 1, 0, 318, 0, 1541562483, 0, 0, 0, 0, 0, 0, 1541056368, 1541562483, 1, 1),
(22, 1, '', '走进鼎吉2', 3, '', 3, 1, 0, 284, 0, 0, 0, 0, 0, 0, 0, 0, 1541056794, 1541562483, 1, 1),
(23, 1, '', '走进鼎吉3', 3, '', 3, 1, 0, 285, 0, 1541562483, 0, 0, 0, 0, 0, 0, 1541056819, 1541562483, 1, 1),
(24, 1, '', '走进鼎吉4', 3, '', 3, 1, 0, 286, 0, 0, 0, 0, 0, 0, 0, 0, 1541056839, 1541562483, 1, 1),
(25, 1, '', '走进鼎吉5', 3, '', 3, 1, 0, 287, 0, 1541562483, 0, 0, 0, 0, 0, 0, 1541056867, 1541562483, 1, 1),
(26, 1, '', '教练风采1', 10, '', 3, 1, 0, 0, 0, 1541057950, 0, 0, 0, 0, 0, 0, 1541057950, 1541057969, 1, 1),
(27, 1, '', '教练风采2', 10, '', 3, 1, 0, 0, 0, 1541057974, 0, 0, 0, 0, 0, 0, 1541057974, 1541057988, 1, 1),
(28, 1, '', '教练风采3', 10, '', 3, 1, 0, 0, 0, 1541057992, 0, 0, 0, 0, 0, 0, 1541057992, 1541058007, 1, 1),
(29, 1, '', '教练风采4', 10, '', 3, 1, 0, 0, 0, 1541058012, 0, 0, 0, 0, 0, 0, 1541058012, 1541058042, 1, 1),
(30, 1, '', '教练风采5', 10, '', 3, 1, 0, 0, 0, 1541058058, 0, 0, 0, 0, 0, 0, 1541058058, 1541058075, 1, 1),
(31, 1, '', '团队风采1', 11, '', 3, 1, 0, 0, 0, 1541572048, 0, 0, 0, 0, 0, 0, 1541058400, 1541572048, 1, 1),
(32, 1, '', '团队风采2', 11, '', 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1541058426, 1541572048, 1, 1),
(33, 1, '', '团队风采3', 11, '', 3, 1, 0, 0, 0, 1541572048, 0, 0, 0, 0, 0, 0, 1541058446, 1541572048, 1, 1),
(34, 1, '', '团队风采4', 11, '', 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1541058469, 1541572048, 1, 1),
(35, 1, '', '团队风采5', 11, '', 3, 1, 0, 0, 0, 1541572048, 0, 0, 0, 0, 0, 0, 1541058495, 1541572048, 1, 1),
(36, 1, '', '学员风采1', 12, '', 3, 1, 0, 288, 0, 1541058524, 0, 0, 0, 0, 0, 0, 1541058524, 1541058538, 1, 1),
(37, 1, '', '学员风采2', 12, '', 3, 1, 0, 289, 0, 1541058542, 0, 0, 0, 0, 0, 0, 1541058542, 1541058555, 1, 1),
(38, 1, '', '学员风采3', 12, '', 3, 1, 0, 291, 0, 1541058564, 0, 0, 0, 0, 0, 0, 1541058564, 1541058577, 1, 1),
(39, 1, '', '学员风采4', 12, '', 3, 1, 0, 290, 0, 1541058581, 0, 0, 0, 0, 0, 0, 1541058581, 1541058598, 1, 1),
(40, 1, '', '学员风采5', 12, '', 3, 1, 0, 292, 0, 1541058602, 0, 0, 0, 0, 0, 0, 1541058602, 1541058615, 1, 1),
(270, 1, '', '2', 9, NULL, 3, 0, 0, 300, 1, 1544692452, 0, 0, 0, 0, 0, 0, 1544436493, 1544692452, 1, 1),
(269, 1, '', '4', 9, NULL, 3, 0, 0, 301, 1, 1544692468, 0, 0, 0, 0, 0, 0, 1544436483, 1544692468, 1, 1),
(267, 1, '', '1', 9, '最美鼎吉滚动图', 3, 0, 0, 244, 1, 1544436443, 0, 0, 0, 0, 0, 0, 1544436443, 1544436443, 1, 1),
(280, 1, '', '55', 1, '首页banner图', 4, 0, 0, 304, 1, 1544774078, 0, 0, 0, 0, 0, 0, 1544774078, 1544774078, 1, 1),
(65, 1, '', '驾校2', 1, '首页banner图', 4, 0, 0, 179, 1, 1543475497, 0, 0, 0, 0, 0, 0, 0, 1543475308, 1, 2),
(66, 1, '', '报名页-驾校2', 8, '报名页banner图', 4, 0, 0, 180, 1, 1543475716, 0, 0, 0, 0, 0, 0, 0, 1543475696, 1, 2),
(67, 1, '', '走进鼎吉1', 3, '', 3, 1, 0, 68, 0, 1541562483, 0, 0, 0, 0, 0, 0, 1541056368, 1541562483, 1, 2),
(68, 1, '', '走进鼎吉1', 3, '', 3, 1, 0, 68, 0, 1541562483, 0, 0, 0, 0, 0, 0, 1541056368, 1541562483, 1, 2),
(69, 1, '', '走进鼎吉1', 3, '', 3, 1, 0, 68, 0, 1541562483, 0, 0, 0, 0, 0, 0, 1541056368, 1541562483, 1, 2),
(70, 1, '', '走进鼎吉1', 3, '', 3, 1, 0, 182, 0, 1541562483, 0, 0, 0, 0, 0, 0, 1541056368, 1541562483, 1, 2),
(71, 1, '', '走进鼎吉1', 3, '', 3, 1, 0, 68, 0, 1541562483, 0, 0, 0, 0, 0, 0, 1541056368, 1541562483, 1, 2),
(72, 1, '', '走进鼎吉3', 3, '', 3, 1, 0, 68, 0, 1541562483, 0, 0, 0, 0, 0, 0, 1541056368, 1541562483, 1, 3),
(73, 1, '', '走进鼎吉3', 3, '', 3, 1, 0, 181, 0, 1541562483, 0, 0, 0, 0, 0, 0, 1541056368, 1541562483, 1, 3),
(74, 1, '', '走进鼎吉3', 3, '', 3, 1, 0, 68, 0, 1541562483, 0, 0, 0, 0, 0, 0, 1541056368, 1541562483, 1, 3),
(75, 1, '', '走进鼎吉3', 3, '', 3, 1, 0, 68, 0, 1541562483, 0, 0, 0, 0, 0, 0, 1541056368, 1541562483, 1, 3),
(76, 1, '', '走进鼎吉3', 3, '', 3, 1, 0, 67, 0, 1541562483, 0, 0, 0, 0, 0, 0, 1541056368, 1541562483, 1, 3),
(77, 1, '', '教练风采1', 10, '', 3, 1, 0, 143, 0, 1541057950, 0, 0, 0, 0, 0, 0, 1541057950, 1541057969, 1, 2),
(78, 1, '', '教练风采1', 10, '', 3, 1, 0, 143, 0, 1541057950, 0, 0, 0, 0, 0, 0, 1541057950, 1541057969, 1, 2),
(79, 1, '', '教练风采5', 10, '', 3, 1, 0, 147, 0, 1541058058, 0, 0, 0, 0, 0, 0, 1541058058, 1541058075, 1, 2),
(80, 1, '', '教练风采2', 10, '', 3, 1, 0, 144, 0, 1541057974, 0, 0, 0, 0, 0, 0, 1541057974, 1541057988, 1, 2),
(81, 1, '', '教练风采4', 10, '', 3, 1, 0, 146, 0, 1541058012, 0, 0, 0, 0, 0, 0, 1541058012, 1541058042, 1, 2),
(82, 1, '', '教练风采4', 10, '', 3, 1, 0, 146, 0, 1541058012, 0, 0, 0, 0, 0, 0, 1541058012, 1541058042, 1, 3),
(83, 1, '', '教练风采4', 10, '', 3, 1, 0, 146, 0, 1541058012, 0, 0, 0, 0, 0, 0, 1541058012, 1541058042, 1, 3),
(84, 1, '', '教练风采4', 10, '', 3, 1, 0, 146, 0, 1541058012, 0, 0, 0, 0, 0, 0, 1541058012, 1541058042, 1, 3),
(85, 1, '', '教练风采4', 10, '', 3, 1, 0, 146, 0, 1541058012, 0, 0, 0, 0, 0, 0, 1541058012, 1541058042, 1, 3),
(86, 1, '', '教练风采4', 10, '', 3, 1, 0, 146, 0, 1541058012, 0, 0, 0, 0, 0, 0, 1541058012, 1541058042, 1, 3),
(87, 1, '', '团队风采3', 11, '', 3, 1, 0, 151, 0, 1541572048, 0, 0, 0, 0, 0, 0, 1541058446, 1541572048, 1, 2),
(88, 1, '', '团队风采3', 11, '', 3, 1, 0, 151, 0, 1541572048, 0, 0, 0, 0, 0, 0, 1541058446, 1541572048, 1, 2),
(89, 1, '', '团队风采3', 11, '', 3, 1, 0, 151, 0, 1541572048, 0, 0, 0, 0, 0, 0, 1541058446, 1541572048, 1, 2),
(90, 1, '', '团队风采3', 11, '', 3, 1, 0, 151, 0, 1541572048, 0, 0, 0, 0, 0, 0, 1541058446, 1541572048, 1, 2),
(91, 1, '', '团队风采3', 11, '', 3, 1, 0, 151, 0, 1541572048, 0, 0, 0, 0, 0, 0, 1541058446, 1541572048, 1, 2),
(92, 1, '', '团队风采3', 11, '', 3, 1, 0, 151, 0, 1541572048, 0, 0, 0, 0, 0, 0, 1541058446, 1541572048, 1, 3),
(93, 1, '', '团队风采3', 11, '', 3, 1, 0, 151, 0, 1541572048, 0, 0, 0, 0, 0, 0, 1541058446, 1541572048, 1, 3),
(94, 1, '', '团队风采3', 11, '', 3, 1, 0, 151, 0, 1541572048, 0, 0, 0, 0, 0, 0, 1541058446, 1541572048, 1, 3),
(95, 1, '', '团队风采3', 11, '', 3, 1, 0, 151, 0, 1541572048, 0, 0, 0, 0, 0, 0, 1541058446, 1541572048, 1, 3),
(96, 1, '', '团队风采3', 11, '', 3, 1, 0, 151, 0, 1541572048, 0, 0, 0, 0, 0, 0, 1541058446, 1541572048, 1, 3),
(97, 1, '', '学员风采5', 12, '', 3, 1, 0, 158, 0, 1541058602, 0, 0, 0, 0, 0, 0, 1541058602, 1541058615, 1, 2),
(98, 1, '', '学员风采5', 12, '', 3, 1, 0, 158, 0, 1541058602, 0, 0, 0, 0, 0, 0, 1541058602, 1541058615, 1, 2),
(99, 1, '', '学员风采5', 12, '', 3, 1, 0, 158, 0, 1541058602, 0, 0, 0, 0, 0, 0, 1541058602, 1541058615, 1, 2),
(100, 1, '', '学员风采5', 12, '', 3, 1, 0, 158, 0, 1541058602, 0, 0, 0, 0, 0, 0, 1541058602, 1541058615, 1, 2),
(101, 1, '', '学员风采5', 12, '', 3, 1, 0, 158, 0, 1541058602, 0, 0, 0, 0, 0, 0, 1541058602, 1541058615, 1, 2),
(102, 1, '', '学员风采5', 12, '', 3, 1, 0, 158, 0, 1541058602, 0, 0, 0, 0, 0, 0, 1541058602, 1541058615, 1, 3),
(103, 1, '', '学员风采5', 12, '', 3, 1, 0, 158, 0, 1541058602, 0, 0, 0, 0, 0, 0, 1541058602, 1541058615, 1, 3),
(104, 1, '', '学员风采5', 12, '', 3, 1, 0, 158, 0, 1541058602, 0, 0, 0, 0, 0, 0, 1541058602, 1541058615, 1, 3),
(105, 1, '', '学员风采5', 12, '', 3, 1, 0, 158, 0, 1541058602, 0, 0, 0, 0, 0, 0, 1541058602, 1541058615, 1, 3),
(106, 1, '', '学员风采5', 12, '', 3, 1, 0, 158, 0, 1541058602, 0, 0, 0, 0, 0, 0, 1541058602, 1541058615, 1, 3),
(286, 1, '', '111', 8, NULL, 4, 0, 0, 329, 1, 1544864620, 0, 0, 0, 0, 0, 0, 1544864605, 1544864620, 1, 1),
(112, 1, '', '走进鼎吉3', 3, '', 3, 1, 0, 68, 0, 1543908210, 0, 0, 0, 0, 0, 0, 0, 1541562483, 1, 6),
(113, 1, '', '走进鼎吉3', 3, '', 3, 1, 0, 181, 0, 1543908210, 0, 0, 0, 0, 0, 0, 0, 1541562483, 1, 6),
(114, 1, '', '走进鼎吉3', 3, '', 3, 1, 0, 68, 0, 1543908210, 0, 0, 0, 0, 0, 0, 0, 1541562483, 1, 6),
(115, 1, '', '走进鼎吉3', 3, '', 3, 1, 0, 68, 0, 1543908210, 0, 0, 0, 0, 0, 0, 0, 1541562483, 1, 6),
(116, 1, '', '走进鼎吉3', 3, '', 3, 1, 0, 67, 0, 1543908210, 0, 0, 0, 0, 0, 0, 0, 1541562483, 1, 6),
(117, 1, '', '教练风采4', 10, '', 3, 1, 0, 146, 0, 1543908210, 0, 0, 0, 0, 0, 0, 0, 1541058042, 1, 6),
(118, 1, '', '教练风采4', 10, '', 3, 1, 0, 146, 0, 1543908210, 0, 0, 0, 0, 0, 0, 0, 1541058042, 1, 6),
(119, 1, '', '教练风采4', 10, '', 3, 1, 0, 146, 0, 1543908210, 0, 0, 0, 0, 0, 0, 0, 1541058042, 1, 6),
(120, 1, '', '教练风采4', 10, '', 3, 1, 0, 146, 0, 1543908210, 0, 0, 0, 0, 0, 0, 0, 1541058042, 1, 6),
(121, 1, '', '教练风采4', 10, '', 3, 1, 0, 146, 0, 1543908210, 0, 0, 0, 0, 0, 0, 0, 1541058042, 1, 6),
(122, 1, '', '团队风采3', 11, '', 3, 1, 0, 151, 0, 1543908210, 0, 0, 0, 0, 0, 0, 0, 1541572048, 1, 6),
(123, 1, '', '团队风采3', 11, '', 3, 1, 0, 151, 0, 1543908210, 0, 0, 0, 0, 0, 0, 0, 1541572048, 1, 6),
(124, 1, '', '团队风采3', 11, '', 3, 1, 0, 151, 0, 1543908210, 0, 0, 0, 0, 0, 0, 0, 1541572048, 1, 6),
(125, 1, '', '团队风采3', 11, '', 3, 1, 0, 151, 0, 1543908210, 0, 0, 0, 0, 0, 0, 0, 1541572048, 1, 6),
(126, 1, '', '团队风采3', 11, '', 3, 1, 0, 151, 0, 1543908210, 0, 0, 0, 0, 0, 0, 0, 1541572048, 1, 6),
(127, 1, '', '学员风采5', 12, '', 3, 1, 0, 158, 0, 1543908210, 0, 0, 0, 0, 0, 0, 0, 1541058615, 1, 6),
(128, 1, '', '学员风采5', 12, '', 3, 1, 0, 158, 0, 1543908210, 0, 0, 0, 0, 0, 0, 0, 1541058615, 1, 6),
(129, 1, '', '学员风采5', 12, '', 3, 1, 0, 158, 0, 1543908210, 0, 0, 0, 0, 0, 0, 0, 1541058615, 1, 6),
(130, 1, '', '学员风采5', 12, '', 3, 1, 0, 158, 0, 1543908210, 0, 0, 0, 0, 0, 0, 0, 1541058615, 1, 6),
(131, 1, '', '学员风采5', 12, '', 3, 1, 0, 158, 0, 1543908210, 0, 0, 0, 0, 0, 0, 0, 1541058615, 1, 6),
(132, 1, '', '走进鼎吉3', 3, '', 3, 1, 0, 68, 0, 1543908377, 0, 0, 0, 0, 0, 0, 0, 1541562483, 1, 4),
(133, 1, '', '走进鼎吉3', 3, '', 3, 1, 0, 181, 0, 1543908377, 0, 0, 0, 0, 0, 0, 0, 1541562483, 1, 4),
(134, 1, '', '走进鼎吉3', 3, '', 3, 1, 0, 68, 0, 1543908377, 0, 0, 0, 0, 0, 0, 0, 1541562483, 1, 4),
(135, 1, '', '走进鼎吉3', 3, '', 3, 1, 0, 68, 0, 1543908377, 0, 0, 0, 0, 0, 0, 0, 1541562483, 1, 4),
(136, 1, '', '走进鼎吉3', 3, '', 3, 1, 0, 67, 0, 1543908377, 0, 0, 0, 0, 0, 0, 0, 1541562483, 1, 4),
(137, 1, '', '教练风采4', 10, '', 3, 1, 0, 146, 0, 1543908377, 0, 0, 0, 0, 0, 0, 0, 1541058042, 1, 4),
(138, 1, '', '教练风采4', 10, '', 3, 1, 0, 146, 0, 1543908377, 0, 0, 0, 0, 0, 0, 0, 1541058042, 1, 4),
(139, 1, '', '教练风采4', 10, '', 3, 1, 0, 146, 0, 1543908377, 0, 0, 0, 0, 0, 0, 0, 1541058042, 1, 4),
(140, 1, '', '教练风采4', 10, '', 3, 1, 0, 146, 0, 1543908377, 0, 0, 0, 0, 0, 0, 0, 1541058042, 1, 4),
(141, 1, '', '教练风采4', 10, '', 3, 1, 0, 146, 0, 1543908377, 0, 0, 0, 0, 0, 0, 0, 1541058042, 1, 4),
(142, 1, '', '团队风采3', 11, '', 3, 1, 0, 151, 0, 1543908377, 0, 0, 0, 0, 0, 0, 0, 1541572048, 1, 4),
(143, 1, '', '团队风采3', 11, '', 3, 1, 0, 151, 0, 1543908377, 0, 0, 0, 0, 0, 0, 0, 1541572048, 1, 4),
(144, 1, '', '团队风采3', 11, '', 3, 1, 0, 151, 0, 1543908377, 0, 0, 0, 0, 0, 0, 0, 1541572048, 1, 4),
(145, 1, '', '团队风采3', 11, '', 3, 1, 0, 151, 0, 1543908377, 0, 0, 0, 0, 0, 0, 0, 1541572048, 1, 4),
(146, 1, '', '团队风采3', 11, '', 3, 1, 0, 151, 0, 1543908377, 0, 0, 0, 0, 0, 0, 0, 1541572048, 1, 4),
(147, 1, '', '学员风采5', 12, '', 3, 1, 0, 158, 0, 1543908377, 0, 0, 0, 0, 0, 0, 0, 1541058615, 1, 4),
(148, 1, '', '学员风采5', 12, '', 3, 1, 0, 158, 0, 1543908377, 0, 0, 0, 0, 0, 0, 0, 1541058615, 1, 4),
(149, 1, '', '学员风采5', 12, '', 3, 1, 0, 158, 0, 1543908377, 0, 0, 0, 0, 0, 0, 0, 1541058615, 1, 4),
(150, 1, '', '学员风采5', 12, '', 3, 1, 0, 158, 0, 1543908377, 0, 0, 0, 0, 0, 0, 0, 1541058615, 1, 4),
(151, 1, '', '学员风采5', 12, '', 3, 1, 0, 158, 0, 1543908377, 0, 0, 0, 0, 0, 0, 0, 1541058615, 1, 4),
(152, 1, '', '走进鼎吉3', 3, '', 3, 1, 0, 68, 0, 1543908497, 0, 0, 0, 0, 0, 0, 0, 1541562483, 1, 5),
(153, 1, '', '走进鼎吉3', 3, '', 3, 1, 0, 181, 0, 1543908497, 0, 0, 0, 0, 0, 0, 0, 1541562483, 1, 5),
(154, 1, '', '走进鼎吉3', 3, '', 3, 1, 0, 68, 0, 1543908497, 0, 0, 0, 0, 0, 0, 0, 1541562483, 1, 5),
(155, 1, '', '走进鼎吉3', 3, '', 3, 1, 0, 68, 0, 1543908497, 0, 0, 0, 0, 0, 0, 0, 1541562483, 1, 5),
(156, 1, '', '走进鼎吉3', 3, '', 3, 1, 0, 67, 0, 1543908497, 0, 0, 0, 0, 0, 0, 0, 1541562483, 1, 5),
(157, 1, '', '教练风采4', 10, '', 3, 1, 0, 146, 0, 1543908497, 0, 0, 0, 0, 0, 0, 0, 1541058042, 1, 5),
(158, 1, '', '教练风采4', 10, '', 3, 1, 0, 146, 0, 1543908497, 0, 0, 0, 0, 0, 0, 0, 1541058042, 1, 5),
(159, 1, '', '教练风采4', 10, '', 3, 1, 0, 146, 0, 1543908497, 0, 0, 0, 0, 0, 0, 0, 1541058042, 1, 5),
(160, 1, '', '教练风采4', 10, '', 3, 1, 0, 146, 0, 1543908497, 0, 0, 0, 0, 0, 0, 0, 1541058042, 1, 5),
(161, 1, '', '教练风采4', 10, '', 3, 1, 0, 146, 0, 1543908497, 0, 0, 0, 0, 0, 0, 0, 1541058042, 1, 5),
(162, 1, '', '团队风采3', 11, '', 3, 1, 0, 151, 0, 1543908497, 0, 0, 0, 0, 0, 0, 0, 1541572048, 1, 5),
(163, 1, '', '团队风采3', 11, '', 3, 1, 0, 151, 0, 1543908497, 0, 0, 0, 0, 0, 0, 0, 1541572048, 1, 5),
(164, 1, '', '团队风采3', 11, '', 3, 1, 0, 151, 0, 1543908497, 0, 0, 0, 0, 0, 0, 0, 1541572048, 1, 5),
(165, 1, '', '团队风采3', 11, '', 3, 1, 0, 151, 0, 1543908497, 0, 0, 0, 0, 0, 0, 0, 1541572048, 1, 5),
(166, 1, '', '团队风采3', 11, '', 3, 1, 0, 151, 0, 1543908497, 0, 0, 0, 0, 0, 0, 0, 1541572048, 1, 5),
(167, 1, '', '学员风采5', 12, '', 3, 1, 0, 158, 0, 1543908497, 0, 0, 0, 0, 0, 0, 0, 1541058615, 1, 5),
(168, 1, '', '学员风采5', 12, '', 3, 1, 0, 158, 0, 1543908497, 0, 0, 0, 0, 0, 0, 0, 1541058615, 1, 5),
(169, 1, '', '学员风采5', 12, '', 3, 1, 0, 158, 0, 1543908497, 0, 0, 0, 0, 0, 0, 0, 1541058615, 1, 5),
(170, 1, '', '学员风采5', 12, '', 3, 1, 0, 158, 0, 1543908497, 0, 0, 0, 0, 0, 0, 0, 1541058615, 1, 5),
(171, 1, '', '学员风采5', 12, '', 3, 1, 0, 158, 0, 1543908497, 0, 0, 0, 0, 0, 0, 0, 1541058615, 1, 5),
(172, 1, '', '走进鼎吉3', 3, '', 3, 1, 0, 68, 0, 1543908677, 0, 0, 0, 0, 0, 0, 1543908677, 1543908677, 1, 6),
(173, 1, '', '走进鼎吉3', 3, '', 3, 1, 0, 181, 0, 1543908677, 0, 0, 0, 0, 0, 0, 1543908677, 1543908677, 1, 6),
(174, 1, '', '走进鼎吉3', 3, '', 3, 1, 0, 68, 0, 1543908677, 0, 0, 0, 0, 0, 0, 1543908677, 1543908677, 1, 6),
(175, 1, '', '走进鼎吉3', 3, '', 3, 1, 0, 68, 0, 1543908677, 0, 0, 0, 0, 0, 0, 1543908677, 1543908677, 1, 6),
(176, 1, '', '走进鼎吉3', 3, '', 3, 1, 0, 67, 0, 1543908677, 0, 0, 0, 0, 0, 0, 1543908677, 1543908677, 1, 6),
(177, 1, '', '教练风采4', 10, '', 3, 1, 0, 146, 0, 1543908677, 0, 0, 0, 0, 0, 0, 1543908677, 1543908677, 1, 6),
(178, 1, '', '教练风采4', 10, '', 3, 1, 0, 146, 0, 1543908677, 0, 0, 0, 0, 0, 0, 1543908677, 1543908677, 1, 6),
(179, 1, '', '教练风采4', 10, '', 3, 1, 0, 146, 0, 1543908677, 0, 0, 0, 0, 0, 0, 1543908677, 1543908677, 1, 6),
(180, 1, '', '教练风采4', 10, '', 3, 1, 0, 146, 0, 1543908677, 0, 0, 0, 0, 0, 0, 1543908677, 1543908677, 1, 6),
(181, 1, '', '教练风采4', 10, '', 3, 1, 0, 146, 0, 1543908677, 0, 0, 0, 0, 0, 0, 1543908677, 1543908677, 1, 6),
(182, 1, '', '团队风采3', 11, '', 3, 1, 0, 151, 0, 1543908677, 0, 0, 0, 0, 0, 0, 1543908677, 1543908677, 1, 6),
(183, 1, '', '团队风采3', 11, '', 3, 1, 0, 151, 0, 1543908677, 0, 0, 0, 0, 0, 0, 1543908677, 1543908677, 1, 6),
(184, 1, '', '团队风采3', 11, '', 3, 1, 0, 151, 0, 1543908677, 0, 0, 0, 0, 0, 0, 1543908677, 1543908677, 1, 6),
(185, 1, '', '团队风采3', 11, '', 3, 1, 0, 151, 0, 1543908677, 0, 0, 0, 0, 0, 0, 1543908677, 1543908677, 1, 6),
(186, 1, '', '团队风采3', 11, '', 3, 1, 0, 151, 0, 1543908677, 0, 0, 0, 0, 0, 0, 1543908677, 1543908677, 1, 6),
(187, 1, '', '学员风采5', 12, '', 3, 1, 0, 158, 0, 1543908677, 0, 0, 0, 0, 0, 0, 1543908677, 1543908677, 1, 6),
(188, 1, '', '学员风采5', 12, '', 3, 1, 0, 158, 0, 1543908677, 0, 0, 0, 0, 0, 0, 1543908677, 1543908677, 1, 6),
(189, 1, '', '学员风采5', 12, '', 3, 1, 0, 158, 0, 1543908677, 0, 0, 0, 0, 0, 0, 1543908677, 1543908677, 1, 6),
(190, 1, '', '学员风采5', 12, '', 3, 1, 0, 158, 0, 1543908677, 0, 0, 0, 0, 0, 0, 1543908677, 1543908677, 1, 6),
(191, 1, '', '学员风采5', 12, '', 3, 1, 0, 158, 0, 1543908677, 0, 0, 0, 0, 0, 0, 1543908677, 1543908677, 1, 6),
(192, 1, '', '走进鼎吉3', 3, '', 3, 1, 0, 68, 0, 1543908859, 0, 0, 0, 0, 0, 0, 1543908859, 1543908859, 1, 4),
(193, 1, '', '走进鼎吉3', 3, '', 3, 1, 0, 181, 0, 1543908859, 0, 0, 0, 0, 0, 0, 1543908859, 1543908859, 1, 4),
(194, 1, '', '走进鼎吉3', 3, '', 3, 1, 0, 68, 0, 1543908859, 0, 0, 0, 0, 0, 0, 1543908859, 1543908859, 1, 4),
(195, 1, '', '走进鼎吉3', 3, '', 3, 1, 0, 68, 0, 1543908859, 0, 0, 0, 0, 0, 0, 1543908859, 1543908859, 1, 4),
(196, 1, '', '走进鼎吉3', 3, '', 3, 1, 0, 67, 0, 1543908859, 0, 0, 0, 0, 0, 0, 1543908859, 1543908859, 1, 4),
(197, 1, '', '教练风采4', 10, '', 3, 1, 0, 146, 0, 1543908859, 0, 0, 0, 0, 0, 0, 1543908859, 1543908859, 1, 4),
(198, 1, '', '教练风采4', 10, '', 3, 1, 0, 146, 0, 1543908859, 0, 0, 0, 0, 0, 0, 1543908859, 1543908859, 1, 4),
(199, 1, '', '教练风采4', 10, '', 3, 1, 0, 146, 0, 1543908859, 0, 0, 0, 0, 0, 0, 1543908859, 1543908859, 1, 4),
(200, 1, '', '教练风采4', 10, '', 3, 1, 0, 146, 0, 1543908859, 0, 0, 0, 0, 0, 0, 1543908859, 1543908859, 1, 4),
(201, 1, '', '教练风采4', 10, '', 3, 1, 0, 146, 0, 1543908859, 0, 0, 0, 0, 0, 0, 1543908859, 1543908859, 1, 4),
(202, 1, '', '团队风采3', 11, '', 3, 1, 0, 151, 0, 1543908859, 0, 0, 0, 0, 0, 0, 1543908859, 1543908859, 1, 4),
(203, 1, '', '团队风采3', 11, '', 3, 1, 0, 151, 0, 1543908859, 0, 0, 0, 0, 0, 0, 1543908859, 1543908859, 1, 4),
(204, 1, '', '团队风采3', 11, '', 3, 1, 0, 151, 0, 1543908859, 0, 0, 0, 0, 0, 0, 1543908859, 1543908859, 1, 4),
(205, 1, '', '团队风采3', 11, '', 3, 1, 0, 151, 0, 1543908859, 0, 0, 0, 0, 0, 0, 1543908859, 1543908859, 1, 4),
(206, 1, '', '团队风采3', 11, '', 3, 1, 0, 151, 0, 1543908859, 0, 0, 0, 0, 0, 0, 1543908859, 1543908859, 1, 4),
(207, 1, '', '学员风采5', 12, '', 3, 1, 0, 158, 0, 1543908859, 0, 0, 0, 0, 0, 0, 1543908859, 1543908859, 1, 4),
(208, 1, '', '学员风采5', 12, '', 3, 1, 0, 158, 0, 1543908859, 0, 0, 0, 0, 0, 0, 1543908859, 1543908859, 1, 4),
(209, 1, '', '学员风采5', 12, '', 3, 1, 0, 158, 0, 1543908859, 0, 0, 0, 0, 0, 0, 1543908859, 1543908859, 1, 4),
(210, 1, '', '学员风采5', 12, '', 3, 1, 0, 158, 0, 1543908859, 0, 0, 0, 0, 0, 0, 1543908859, 1543908859, 1, 4),
(211, 1, '', '学员风采5', 12, '', 3, 1, 0, 158, 0, 1543908859, 0, 0, 0, 0, 0, 0, 1543908859, 1543908859, 1, 4),
(212, 1, '', '走进鼎吉3', 3, '', 3, 1, 0, 68, 0, 1543908872, 0, 0, 0, 0, 0, 0, 1543908872, 1543908872, 1, 5),
(213, 1, '', '走进鼎吉3', 3, '', 3, 1, 0, 181, 0, 1543908872, 0, 0, 0, 0, 0, 0, 1543908872, 1543908872, 1, 5),
(214, 1, '', '走进鼎吉3', 3, '', 3, 1, 0, 68, 0, 1543908872, 0, 0, 0, 0, 0, 0, 1543908872, 1543908872, 1, 5),
(215, 1, '', '走进鼎吉3', 3, '', 3, 1, 0, 68, 0, 1543908872, 0, 0, 0, 0, 0, 0, 1543908872, 1543908872, 1, 5),
(216, 1, '', '走进鼎吉3', 3, '', 3, 1, 0, 67, 0, 1543908872, 0, 0, 0, 0, 0, 0, 1543908872, 1543908872, 1, 5),
(217, 1, '', '教练风采4', 10, '', 3, 1, 0, 146, 0, 1543908872, 0, 0, 0, 0, 0, 0, 1543908872, 1543908872, 1, 5),
(218, 1, '', '教练风采4', 10, '', 3, 1, 0, 146, 0, 1543908872, 0, 0, 0, 0, 0, 0, 1543908872, 1543908872, 1, 5),
(219, 1, '', '教练风采4', 10, '', 3, 1, 0, 146, 0, 1543908872, 0, 0, 0, 0, 0, 0, 1543908872, 1543908872, 1, 5),
(220, 1, '', '教练风采4', 10, '', 3, 1, 0, 146, 0, 1543908872, 0, 0, 0, 0, 0, 0, 1543908872, 1543908872, 1, 5),
(221, 1, '', '教练风采4', 10, '', 3, 1, 0, 146, 0, 1543908872, 0, 0, 0, 0, 0, 0, 1543908872, 1543908872, 1, 5),
(222, 1, '', '团队风采3', 11, '', 3, 1, 0, 151, 0, 1543908872, 0, 0, 0, 0, 0, 0, 1543908872, 1543908872, 1, 5),
(223, 1, '', '团队风采3', 11, '', 3, 1, 0, 151, 0, 1543908872, 0, 0, 0, 0, 0, 0, 1543908872, 1543908872, 1, 5),
(224, 1, '', '团队风采3', 11, '', 3, 1, 0, 151, 0, 1543908872, 0, 0, 0, 0, 0, 0, 1543908872, 1543908872, 1, 5),
(225, 1, '', '团队风采3', 11, '', 3, 1, 0, 151, 0, 1543908872, 0, 0, 0, 0, 0, 0, 1543908872, 1543908872, 1, 5),
(226, 1, '', '团队风采3', 11, '', 3, 1, 0, 151, 0, 1543908872, 0, 0, 0, 0, 0, 0, 1543908872, 1543908872, 1, 5),
(227, 1, '', '学员风采5', 12, '', 3, 1, 0, 158, 0, 1543908872, 0, 0, 0, 0, 0, 0, 1543908872, 1543908872, 1, 5),
(228, 1, '', '学员风采5', 12, '', 3, 1, 0, 158, 0, 1543908872, 0, 0, 0, 0, 0, 0, 1543908872, 1543908872, 1, 5),
(229, 1, '', '学员风采5', 12, '', 3, 1, 0, 158, 0, 1543908872, 0, 0, 0, 0, 0, 0, 1543908872, 1543908872, 1, 5),
(230, 1, '', '学员风采5', 12, '', 3, 1, 0, 158, 0, 1543908872, 0, 0, 0, 0, 0, 0, 1543908872, 1543908872, 1, 5),
(231, 1, '', '学员风采5', 12, '', 3, 1, 0, 158, 0, 1543908872, 0, 0, 0, 0, 0, 0, 1543908872, 1543908872, 1, 5),
(232, 1, '', '走进鼎吉3', 3, '', 3, 1, 0, 68, 0, 1543908883, 0, 0, 0, 0, 0, 0, 1543908883, 1543908883, 1, 6),
(233, 1, '', '走进鼎吉3', 3, '', 3, 1, 0, 181, 0, 1543908883, 0, 0, 0, 0, 0, 0, 1543908883, 1543908883, 1, 6),
(234, 1, '', '走进鼎吉3', 3, '', 3, 1, 0, 68, 0, 1543908883, 0, 0, 0, 0, 0, 0, 1543908883, 1543908883, 1, 6),
(235, 1, '', '走进鼎吉3', 3, '', 3, 1, 0, 68, 0, 1543908883, 0, 0, 0, 0, 0, 0, 1543908883, 1543908883, 1, 6),
(236, 1, '', '走进鼎吉3', 3, '', 3, 1, 0, 67, 0, 1543908883, 0, 0, 0, 0, 0, 0, 1543908883, 1543908883, 1, 6),
(237, 1, '', '教练风采4', 10, '', 3, 1, 0, 146, 0, 1543908883, 0, 0, 0, 0, 0, 0, 1543908883, 1543908883, 1, 6),
(238, 1, '', '教练风采4', 10, '', 3, 1, 0, 146, 0, 1543908883, 0, 0, 0, 0, 0, 0, 1543908883, 1543908883, 1, 6),
(239, 1, '', '教练风采4', 10, '', 3, 1, 0, 146, 0, 1543908883, 0, 0, 0, 0, 0, 0, 1543908883, 1543908883, 1, 6),
(240, 1, '', '教练风采4', 10, '', 3, 1, 0, 146, 0, 1543908883, 0, 0, 0, 0, 0, 0, 1543908883, 1543908883, 1, 6),
(241, 1, '', '教练风采4', 10, '', 3, 1, 0, 146, 0, 1543908883, 0, 0, 0, 0, 0, 0, 1543908883, 1543908883, 1, 6),
(242, 1, '', '团队风采3', 11, '', 3, 1, 0, 151, 0, 1543908883, 0, 0, 0, 0, 0, 0, 1543908883, 1543908883, 1, 6),
(243, 1, '', '团队风采3', 11, '', 3, 1, 0, 151, 0, 1543908883, 0, 0, 0, 0, 0, 0, 1543908883, 1543908883, 1, 6),
(244, 1, '', '团队风采3', 11, '', 3, 1, 0, 151, 0, 1543908883, 0, 0, 0, 0, 0, 0, 1543908883, 1543908883, 1, 6),
(245, 1, '', '团队风采3', 11, '', 3, 1, 0, 151, 0, 1543908883, 0, 0, 0, 0, 0, 0, 1543908883, 1543908883, 1, 6),
(246, 1, '', '团队风采3', 11, '', 3, 1, 0, 151, 0, 1543908883, 0, 0, 0, 0, 0, 0, 1543908883, 1543908883, 1, 6),
(247, 1, '', '学员风采5', 12, '', 3, 1, 0, 158, 0, 1543908883, 0, 0, 0, 0, 0, 0, 1543908883, 1543908883, 1, 6),
(248, 1, '', '学员风采5', 12, '', 3, 1, 0, 158, 0, 1543908883, 0, 0, 0, 0, 0, 0, 1543908883, 1543908883, 1, 6),
(249, 1, '', '学员风采5', 12, '', 3, 1, 0, 158, 0, 1543908883, 0, 0, 0, 0, 0, 0, 1543908883, 1543908883, 1, 6),
(250, 1, '', '学员风采5', 12, '', 3, 1, 0, 158, 0, 1543908883, 0, 0, 0, 0, 0, 0, 1543908883, 1543908883, 1, 6),
(251, 1, '', '学员风采5', 12, '', 3, 1, 0, 158, 0, 1543908883, 0, 0, 0, 0, 0, 0, 1543908883, 1543908883, 1, 6),
(282, 1, '', '55', 1, '首页banner图', 4, 0, 0, 307, 1, 1544774160, 0, 0, 0, 0, 0, 0, 1544774160, 1544774160, 1, 5),
(279, 1, '', '33', 1, '首页banner图', 4, 0, 0, 303, 1, 1544774068, 0, 0, 0, 0, 0, 0, 1544774068, 1544774068, 1, 1),
(278, 1, '', '66', 1, '首页banner图', 4, 0, 0, 302, 1, 1544773720, 0, 0, 0, 0, 0, 0, 1544773720, 1544773720, 1, 1),
(283, 1, '', '3', 1, '首页banner图', 4, 0, 0, 308, 1, 1544774169, 0, 0, 0, 0, 0, 0, 1544774169, 1544774169, 1, 5),
(284, 1, '', '56', 1, '首页banner图', 4, 0, 0, 309, 1, 1544774222, 0, 0, 0, 0, 0, 0, 1544774222, 1544774222, 1, 6),
(285, 1, '', '55', 1, '首页banner图', 4, 0, 0, 310, 1, 1544774230, 0, 0, 0, 0, 0, 0, 1544774230, 1544774230, 1, 6);

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
  `name` varchar(20) DEFAULT NULL COMMENT '姓名',
  `phone` varchar(15) DEFAULT NULL COMMENT '电话',
  `content` text NOT NULL COMMENT '内容',
  `create_time` int(11) NOT NULL COMMENT '提交时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态(0:未处理 1：已处理)',
  `school_id` smallint(6) NOT NULL DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='意见建议';

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
(17, '', '', '8888', 1542097205, 0, 1),
(18, NULL, NULL, '12345678', 1543463568, 0, 2),
(19, NULL, NULL, '测试', 1543472132, 0, 2),
(20, '啦啦啦', '18858689523', '111', 1543474789, 0, 1),
(21, '啦啦啦', '18858689523', '111', 1543474973, 0, 1),
(22, '啦啦啦', '18858689523', '11', 1543474982, 0, 1),
(23, NULL, NULL, '测试', 1543476502, 0, 1),
(24, NULL, NULL, '测试', 1543476503, 0, 1),
(25, NULL, NULL, '测试', 1543476503, 0, 1),
(26, NULL, NULL, '测试', 1543476503, 0, 1),
(27, NULL, NULL, '测试', 1543476503, 0, 1),
(28, NULL, NULL, '测试', 1543476504, 0, 1),
(29, NULL, NULL, '测试', 1543476504, 0, 1),
(30, NULL, NULL, '测试', 1543476505, 0, 1),
(31, NULL, NULL, '测试', 1543476505, 0, 1),
(32, NULL, NULL, '测试', 1543476506, 0, 1),
(33, NULL, NULL, '测试', 1543476506, 0, 1),
(34, NULL, NULL, '测试', 1543476506, 0, 1),
(35, NULL, NULL, '测试', 1543481620, 0, 1),
(36, '冯显', '15922542385', '给我', 1543653855, 0, 1),
(37, '啦啦啦', '18565236235', '111', 1544688886, 0, 1);

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
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='班别管理表';

--
-- 转存表中的数据 `sent_grade`
--

INSERT INTO `sent_grade` (`id`, `version`, `name`, `type`, `price`, `content`, `notice`, `status`, `area_id`, `cid`, `create_time`, `update_time`) VALUES
(1, '181122163443_v0.1', '计时学车全包班', 1, '666.00', '666', '66', 1, 1, '0.1', 1542875683, 1542875683),
(2, '181122163510_v0.2', '计时学车普通班', 1, '555.00', '555', '55', 1, 1, '0.2', 1542875710, 1542875710),
(3, '181122163525_v0.3', '计时学车全包班', 1, '6666.00', '66', '66', 0, 5, '0.3', 1542875725, 1542875725),
(4, '181122163545_v0.4', '计时学车全包班', 1, '888.00', '88', '8', 1, 3, '0.4', 1542875745, 1542875745),
(5, '181122163606_v0.5', '计时学车全包班', 1, '888.00', '8', '8', 0, 2, '0.5', 1542875766, 1542875766),
(6, '181122163627_v0.6', '计时学车全包班', 1, '666.00', '666', '66测试', 0, 1, '0.6', 1542875787, 1542875787),
(7, '181122163646_v0.7', '计时学车全包班', 1, '666.00', '666', '66', 1, 1, '0.7', 1542875806, 1542875806),
(8, '181122163708_v0.8', '计时学车全包班', 1, '666.00', '666', '66侧呃呃呃', 0, 1, '0.8', 1542875828, 1542875828),
(9, '181130170317_v0.9', '测试班别详情', 1, '666.00', '班别详情<br/>班别详情班别详情<br/>班别详情', '学车须知', 0, 1, '0.9', 1543568597, 1543568597),
(10, '181201174012_v1', '计时学车全包班', 1, '888.00', '报名服务：提供免费上门接送观摩场地，试学试驾<br/>约车方式：根据教练员安排及自行约车结合<br/>接送服务：练车过程中提供全程免费定点接送服务，考试集中统一免费接送<br/>约车方式：根据教练员安排及自行约车结合', '报名服务：提供免费上门接送观摩场地，试学试驾<br/>约车方式：根据教练员安排及自行约车结合<br/>接送服务：练车过程中提供全程免费定点接送服务，考试集中统一免费接送<br/>约车方式：根据教练员安排及自行约车结合', 0, 3, '1', 1543657212, 1543657212),
(11, '181206105708_v1.1', '计时学车普通班', 1, '555.00', '报名服务：提供免费上门接送观摩场地，试学试驾<br/>约车方式：根据教练员安排及自行约车结合<br/>接送服务：练车过程中提供全程免费定点接送服务，考试集中统一免费接送<br/>约车方式：根据教练员安排及自行约车结合', '报名服务：提供免费上门接送观摩场地，试学试驾<br/>约车方式：根据教练员安排及自行约车结合<br/>接送服务：练车过程中提供全程免费定点接送服务，考试集中统一免费接送<br/>约车方式：根据教练员安排及自行约车结合', 1, 1, '1.1', 1544065028, 1544065028),
(12, '181206105719_v1.2', '计时学车普通班', 2, '555.00', '报名服务：提供免费上门接送观摩场地，试学试驾<br/>约车方式：根据教练员安排及自行约车结合<br/>接送服务：练车过程中提供全程免费定点接送服务，考试集中统一免费接送<br/>约车方式：根据教练员安排及自行约车结合', '报名服务：提供免费上门接送观摩场地，试学试驾<br/>约车方式：根据教练员安排及自行约车结合<br/>接送服务：练车过程中提供全程免费定点接送服务，考试集中统一免费接送<br/>约车方式：根据教练员安排及自行约车结合', 1, 1, '1.2', 1544065039, 1544671039),
(13, '181213111726_v1.3', '计时学车普通班', 1, '555.00', '报名服务：提供免费上门接送观摩场地，试学试驾<br/>约车方式：根据教练员安排及自行约车结合<br/>接送服务：练车过程中提供全程免费定点接送服务，考试集中统一免费接送<br/>约车方式：根据教练员安排及自行约车结合', '报名服务：提供免费上门接送观摩场地，试学试驾<br/>约车方式：根据教练员安排及自行约车结合<br/>接送服务：练车过程中提供全程免费定点接送服务，考试集中统一免费接送<br/>约车方式：根据教练员安排及自行约车结合', 1, 1, '1.3', 1544671046, 1544671046),
(14, '181213111922_v1.4', '计时学车全包班', 2, '3980.00', '测试测试测试测试测试测试测试<br/>测试测试测试测试<br/>测试测试测试测试测试测试<br/>测试测试测试测试测试', '测试测试测试测试测试测试测试<br/>测试测试测试测试<br/>测试测试测试测试测试测试<br/>测试测试测试测试测试', 0, 2, '1.4', 1544671162, 1544671162),
(15, '181213171254_v1.5', '计时学车普通班', 2, '555.00', '报名服务：提供免费上门接送观摩场地，试学试驾<br/>约车方式：根据教练员安排及自行约车结合<br/>接送服务：练车过程中提供全程免费定点接送服务，考试集中统一免费接送<br/>约车方式：根据教练员安排及自行约车结合', '报名服务：提供免费上门接送观摩场地，试学试驾<br/>约车方式：根据教练员安排及自行约车结合<br/>接送服务：练车过程中提供全程免费定点接送服务，考试集中统一免费接送<br/>约车方式：根据教练员安排及自行约车结合', 0, 1, '1.5', 1544692374, 1544692374),
(16, '181217190420_v1.6', '测试', 1, '666.00', '123', '123', 0, 7, '1.6', 1545044660, 1545044660),
(17, '181217190438_v1.7', '测试', 1, '666.00', '123', '123', 0, 10, '1.7', 1545044678, 1545044678);

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
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='会员表';

--
-- 转存表中的数据 `sent_member`
--

INSERT INTO `sent_member` (`uid`, `username`, `password`, `nickname`, `email`, `mobile`, `sex`, `birthday`, `qq`, `score`, `signature`, `pos_province`, `pos_city`, `pos_district`, `pos_community`, `salt`, `login`, `reg_ip`, `reg_time`, `last_login_ip`, `last_login_time`, `status`, `school_id`) VALUES
(1, 'admin', '9d98696a650b7bd9c90f057023951aa3', 'admin', 'admin@admin.com', NULL, 0, '0000-00-00', '', 0, NULL, 0, 0, 0, 0, 'nPdbMU', 138, 0, 1489650033, 1912335161, 1545720566, 1, 0),
(15, 'jxysc', 'dcb872bf5638873c8db526e4fa33c8e2', '金西亚市场', NULL, '15988888888', 0, '0000-00-00', '', 0, NULL, 0, 0, 0, 0, 'atzLms', 1, 0, 1543652272, 2002086557, 1543829392, 1, 1),
(12, 'djcyl', '972f7b1ac2650926257af5e3b0d15a15', '车主管', NULL, '15999999999', 0, '0000-00-00', '', 0, NULL, 0, 0, 0, 0, 'GbnEdF', 4, 0, 1543651631, 2002086557, 1543887362, 1, 1),
(13, 'djwf', 'd95bac9fe65e4e65e7302129da364c83', '王凤', NULL, '15922222222', 0, '0000-00-00', '', 0, NULL, 0, 0, 0, 0, 'ztWGhn', 3, 0, 1543651894, 1784065607, 1544840943, 1, 1),
(14, 'djldj', 'a572f4306889b143b1964e96c42f841e', '罗校', NULL, '15966666666', 0, '0000-00-00', '', 0, NULL, 0, 0, 0, 0, 'yiejFQ', 23, 0, 1543651938, 1912334658, 1545123013, 1, 1);

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
(11, 0),
(12, 0),
(13, 0),
(14, 0),
(15, 0);

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
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

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
(39, '走进驾校', 'admin', 'fa fa-edit', 37, 0, 'admin/operate/about', 0, '', '首页', 0, 0),
(40, '发现最美驾校', 'admin', 'fa fa-edit', 37, 0, 'admin/operate/beautiful', 0, '', '首页', 0, 0),
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
(67, '常见问题', 'admin', 'fa fa-edit', 37, 0, 'admin/operate/question', 0, '', '报名', 0, 0),
(68, '驾校管理', 'admin', 'fa fa-list', 6, 0, 'admin/school/index', 0, '', '系统配置', 0, 0);

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
-- 表的结构 `sent_msg`
--

CREATE TABLE IF NOT EXISTS `sent_msg` (
  `id` int(10) unsigned NOT NULL,
  `tel` varchar(20) NOT NULL COMMENT '电话号码',
  `code` varchar(10) NOT NULL COMMENT '验证码'
) ENGINE=MyISAM AUTO_INCREMENT=312 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sent_msg`
--

INSERT INTO `sent_msg` (`id`, `tel`, `code`) VALUES
(89, '17754928731', '3708'),
(88, '15870560984', '9872'),
(87, '15730498136', '3526'),
(86, '13996627903', '0176'),
(85, '17383087432', '0789'),
(84, '18996507173', '1252'),
(83, '15736685361', '6583'),
(82, '13101194747', '7584'),
(81, '18716330039', '4531'),
(80, '15923328321', '0965'),
(79, '15736685391', '2964'),
(78, '18225324516', '2739'),
(77, '17347912434', '4766'),
(76, '13098623074', '5177'),
(75, '15023860821', '2319'),
(74, '17815379791', '3206'),
(73, '13340314756', '2064'),
(72, '18875243340', '0868'),
(71, '18223430919', '2087'),
(70, '15310928874', '6169'),
(69, '18996663639', '8208'),
(68, '18423018158', '9950'),
(67, '15736321640', '8403'),
(66, '17815379793', '5348'),
(65, '15808453051', '8589'),
(64, '15823659367', '4601'),
(63, '18323873307', '3264'),
(62, '18228853582', '3265'),
(61, '17823220885', '7967'),
(60, '17725164533', '2689'),
(59, '15722917110', '7842'),
(58, '18290537841', '7659'),
(57, '17830370808', '2975'),
(56, '18503800575', '0187'),
(55, '13547139531', '6453'),
(54, '13838056718', '9167'),
(53, '15340545498', '2067'),
(47, '15736565406', '9651'),
(52, '15334537865', '2273'),
(51, '18223257103', '8511'),
(50, '15084384134', '3952'),
(49, '15223474637', '4341'),
(48, '18908311444', '2591'),
(46, '15922542385', '8362'),
(90, '17725024068', '5636'),
(91, '15202348036', '5907'),
(92, '15223444624', '0185'),
(93, '18883182297', '9200'),
(94, '18323667042', '7513'),
(95, '15340517086', '2654'),
(96, '15730463594', '5982'),
(97, '17784294470', '5529'),
(98, '18523542108', '1026'),
(99, '15823797375', '3180'),
(100, '18175090317', '5569'),
(101, '15683507067', '8370'),
(102, '15923914847', '3501'),
(103, '18723091242', '3149'),
(104, '13350370668', '3702'),
(105, '18883087898', '1543'),
(106, '18281187680', '2514'),
(107, '15023263173', '5390'),
(108, '17783813743', '3801'),
(109, '17338352414', '8850'),
(110, '15182541009', '7047'),
(111, '18883324939', '9638'),
(112, '18840873646', '9425'),
(113, '18883162956', '3184'),
(114, '15823903405', '6553'),
(115, '15523224114', '1509'),
(116, '17602440668', '3375'),
(117, '18840873649', '3398'),
(118, '13678420219', '7108'),
(119, '15123500402', '1275'),
(120, '13896881474', '5916'),
(121, '15909361091', '7180'),
(122, '15549169550', '6069'),
(123, '18323486005', '2899'),
(124, '18996635602', '9210'),
(125, '15523731604', '3161'),
(126, '15579819095', '9748'),
(127, '18680802325', '4632'),
(128, '18323588485', '5760'),
(129, '18290290440', '8192'),
(130, '18636737788', '0138'),
(131, '15523566844', '7965'),
(132, '15702301641', '0983'),
(133, '15923911652', '8992'),
(134, '15223866453', '1923'),
(135, '18723646042', '7641'),
(136, '18723937970', '5796'),
(137, '18875280680', '6246'),
(138, '18883606046', '7941'),
(139, '13594855872', '3459'),
(140, '18375928109', '9643'),
(141, '17623123862', '0273'),
(142, '15922896577', '7918'),
(143, '15922866577', '2762'),
(144, '15023666053', '0460'),
(145, '15555555555', '1111'),
(146, '15656565656', '1111'),
(147, '15333333333', '1111'),
(148, '15111111111', '1111'),
(149, '15222222222', '1111'),
(150, '15444444444', '1111'),
(151, '15555555555', '1111'),
(152, '15666666666', '1111'),
(153, '18423075400', '8144'),
(154, '13333333333', '1111'),
(155, '11111111111', '1111'),
(156, '12222222222', '1111'),
(157, '14444444444', '1111'),
(158, '14555555555', '1111'),
(159, '16666666666', '1111'),
(160, '15223474937', '0991'),
(161, '15223041441', '4935'),
(162, '13048452463', '4718'),
(163, '18875280294', '0785'),
(164, '17725077333', '9351'),
(165, '18842985768', '9392'),
(166, '15142170208', '9289'),
(167, '15923067506', '6195'),
(168, '17623402012', '2349'),
(169, '15825984373', '1959'),
(170, '18875281193', '2807'),
(171, '15696683072', '0125'),
(172, '13453256754', '7643'),
(173, '18225137003', '1290'),
(174, '13330301323', '0710'),
(175, '15023666056', '1035'),
(176, '17623205018', '0305'),
(177, '17782249077', '7060'),
(178, '17784726708', '2479'),
(179, '15823169050', '5478'),
(180, '17784722456', '7446'),
(181, '18290512996', '4296'),
(182, '18315033493', '2540'),
(183, '18883695670', '2879'),
(184, '15223546872', '5341'),
(185, '17723898165', '8348'),
(186, '13220208856', '2601'),
(187, '17602843498', '9832'),
(188, '17784728234', '8928'),
(189, '18306073956', '9164'),
(190, '17815332647', '8697'),
(191, '13068384040', '4762'),
(192, '17815336247', '6138'),
(193, '18996635902', '6508'),
(194, '15730134009', '8087'),
(195, '15086855066', '8319'),
(196, '15501816530', '7361'),
(197, '15320395242', '0025'),
(198, '15923315441', '5980'),
(199, '18875164506', '1656'),
(200, '18875164509', '5981'),
(201, '19912032310', '5846'),
(202, '15023039886', '0439'),
(203, '15298033487', '7578'),
(204, '18325074742', '8909'),
(205, '17623183327', '5856'),
(206, '18716322662', '4272'),
(207, '19970892017', '5645'),
(208, '17623019379', '1866'),
(209, '18375702644', '6447'),
(210, '18423461075', '6573'),
(211, '15736529629', '1164'),
(212, '13896900800', '6223'),
(213, '15023598493', '7219'),
(214, '15082099942', '9252'),
(215, '18315229002', '4884'),
(216, '18182216477', '6408'),
(217, '18315229005', '8125'),
(218, '15736567131', '3375'),
(219, '18184054702', '5316'),
(220, '13983770093', '5587'),
(221, '13527570140', '1463'),
(222, '18883280187', '1876'),
(223, '18581371209', '7062'),
(224, '19922944660', '5021'),
(225, '17602388075', '1843'),
(226, '18523766824', '6596'),
(227, '13368386337', '1073'),
(228, '13368386336', '0375'),
(229, '17815378743', '0170'),
(230, '18398497538', '5969'),
(231, '18723771223', '2453'),
(232, '17623308694', '0751'),
(233, '15703060835', '9122'),
(234, '13350129707', '5101'),
(235, '17815378758', '0192'),
(236, '18423249381', '6516'),
(237, '15770258043', '5288'),
(238, '18723901267', '9069'),
(239, '14785714097', '2575'),
(240, '18324129587', '1848'),
(241, '13638292537', '6508'),
(242, '18223604949', '8546'),
(243, '18324129089', '4253'),
(244, '13388964950', '8618'),
(245, '13637962528', '8118'),
(246, '15696042931', '9078'),
(247, '17815366422', '3980'),
(248, '13668431517', '1572'),
(249, '13206107551', '5309'),
(250, '13370744072', '6285'),
(251, '15923232098', '3830'),
(252, '17353135573', '6484'),
(253, '15025536621', '5397'),
(254, '15736433203', '5706'),
(255, '15923040496', '4798'),
(256, '15393532172', '8550'),
(257, '18224363126', '3650'),
(258, '13028393511', '2610'),
(259, '15084351860', '5033'),
(260, '17378357952', '8501'),
(261, '18723131071', '2758'),
(262, '17815378903', '5406'),
(263, '19939335273', '0395'),
(264, '13356154545', '8239'),
(265, '17782248922', '6175'),
(266, '15523232083', '3528'),
(267, '18223731239', '9634'),
(268, '18315164625', '8795'),
(269, '15878381923', '0547'),
(270, '13658452591', '6966'),
(271, '15730591545', '5894'),
(272, '17868954670', '0493'),
(273, '18324144904', '8970'),
(274, '17623238708', '1475'),
(275, '13187339413', '0659'),
(276, '18225497420', '3277'),
(277, '18166536416', '4275'),
(278, '17725167552', '1821'),
(279, '18893652539', '9433'),
(280, '15823171934', '8105'),
(281, '15730435725', '7162'),
(282, '15667084136', '7358'),
(283, '13993303144', '8520'),
(284, '15084481034', '1781'),
(285, '18883328446', '2323'),
(286, '17623014642', '3627'),
(287, '15196545953', '2400'),
(288, '13368444951', '0632'),
(289, '17725166345', '0989'),
(290, '13594120232', '8684'),
(291, '18723453225', '5941'),
(292, '18696700703', '0036'),
(293, '13224031855', '4366'),
(294, '17830143458', '7134'),
(295, '15123431707', '4678'),
(296, '13637830869', '0950'),
(297, '18580417396', '6955'),
(298, '15223171471', '4800'),
(299, '18723918594', '1345'),
(300, '17623247660', '3206'),
(301, '18523486548', '3137'),
(302, '18323780443', '6596'),
(303, '18709907471', '3390'),
(304, '15730680056', '2791'),
(305, '15222744885', '2972'),
(306, '15223744885', '1978'),
(307, '18702369885', '8250'),
(308, '15916239746', '7908'),
(309, '15696171608', '5751'),
(310, '15881861362', '6403'),
(311, '18281502674', '8283');

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
  `create_time` bigint(10) DEFAULT NULL,
  `update_time` bigint(10) DEFAULT NULL,
  `school_id` smallint(6) NOT NULL DEFAULT '1',
  `category_id` smallint(6) DEFAULT NULL COMMENT '栏目ID'
) ENGINE=MyISAM AUTO_INCREMENT=98 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='单页';

--
-- 转存表中的数据 `sent_page`
--

INSERT INTO `sent_page` (`id`, `uid`, `title`, `model_id`, `cover_id`, `content`, `create_time`, `update_time`, `school_id`, `category_id`) VALUES
(1, 0, '走进鼎吉', 4, 53, '<p>走进鼎吉</p>', 0, 1544836626, 1, 3),
(16, 0, '发现最美鼎吉', 4, 0, '<p>发现最美鼎吉2</p>', 0, 0, 2, 9),
(17, 0, '发现最美鼎吉', 4, 0, '<p>发现最美鼎吉3</p>', 0, 0, 3, 9),
(18, 0, '教练风采', 4, 0, '<p>教练风采2</p>', 1540951830, 1543482348, 2, 10),
(19, 0, '教练风采', 4, 0, '<p>教练风采3</p>', 1540951830, 1543483168, 3, 10),
(20, 0, '团队风采', 4, 0, '<p>团队风采2</p>', 1540951849, 1543484584, 2, 11),
(21, 0, '团队风采', 4, 0, '<p>团队风采3</p>', 1540951849, 1543484574, 3, 11),
(22, 0, '学员风采', 4, 0, '<p>学员风采</p>', 1540971904, 1542635059, 2, 12),
(23, 0, '学员风采', 4, 0, '<p>学员风采</p>', 1540971904, 1542635059, 3, 12),
(24, 0, '报名即可参加万人电音节', 4, 169, '<p>最新活动11</p>', 0, 0, 2, 2),
(25, 0, '报名即可参加万人电音节', 4, 169, '<p>最新活动11</p>', 0, 0, 3, 2),
(30, 0, '学车保障', 4, 0, '<p>学车保障789</p>', 1541555824, 1541555824, 2, 15),
(26, 0, '学车流程', 4, 0, '<p>学车流程09</p>', 1541555840, 1541555840, 2, 13),
(27, 0, '学车流程', 4, 0, '<p>学车流程09</p>', 1541555840, 1541555840, 3, 13),
(28, 0, '优势服务2', 4, 0, '<p>优势服务90</p>', 1541555832, 1541555832, 2, 14),
(29, 0, '优势服务3', 4, 0, '<p>优势服务90</p>', 1541555832, 1541555832, 3, 14),
(31, 0, '学车保障', 4, 0, '<p>学车保障789</p>', 1541555824, 1541555824, 3, 15),
(32, 0, '常见问题2', 4, 0, '<p>常见问题456</p>', 1541555815, 1541555815, 2, 16),
(33, 0, '常见问题3', 4, 0, '<p>常见问题456</p>', 1541555815, 1541555815, 3, 16),
(2, 0, '发现最美鼎吉', 4, 0, '<p>发现最美鼎吉1</p>', 1540951806, 1540977206, 1, 9),
(3, 0, '教练风采', 4, 0, '<p>教练风采</p>', 1540951830, 1544720612, 1, 10),
(4, 0, '团队风采', 4, 0, '<p>团队风采</p>', 1540951849, 1544433137, 1, 11),
(10, 0, '科目一学习预约流程', 4, 0, '<p style="white-space: normal; text-align: center;"><span style="font-size: 24px;">科目一学习方法以及预约流程</span></p><p style="white-space: normal; text-align: center;">西培学堂网址：<span style="text-decoration-line: underline; color: rgb(255, 0, 0);"><a href="http://www.cqxpxt.com/" style="color: rgb(255, 0, 0);">http://www.cqxpxt.com/</a></span></p><p style="white-space: normal; text-align: center;">点击可访问</p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">一、学习方法</p><p style="white-space: normal; text-indent: 2em;">科目一理论学习为6+16模式，前边6个小时需要在西培学堂指定培训点进行面授上课，中途不能离开，并且为人脸识别认证；6个小时学习完毕之后后边16个小时可在网络上边进行学习，也可在课堂进行面授学习</p><p style="white-space: normal; text-indent: 2em;"><br/></p><p style="text-indent: 0em; white-space: normal;">二、预约流程</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503832882696801.png" title="1503832882696801.png" alt="blob.png"/></p><p style="white-space: normal; text-indent: 2em;">请您在首页右上方“用户登录”输入您的身份证号码，初始密码是身份证号码的后6位数字。</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503834101496624.png" title="1503834101496624.png" alt="1503834101496624.png" width="350" height="113"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503832938997982.png" title="1503832938997982.png" alt="1503832938997982.png" width="380" height="1"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503833678767163.png" title="1503833678767163.png" alt="blob.png"/></p><p style="white-space: normal; text-indent: 2em;">如果您是第一次登录，您将直接进入<span style="color: rgb(84, 141, 212);">“面授预约”</span>，首先，请您选择参加面授的地点。选择面授地点后，请选择参加面授的日期、时间、班次、教室。</p><p style="white-space: normal; text-indent: 2em;">如果您参加完6个学时面授培训以后，仍然选择课堂学习，请您点击<span style="color: rgb(84, 141, 212);">“面授预约”</span>，选择参加面授的地点，然后选择参加面授的<span style="color: rgb(84, 141, 212);">日期、时间、班次、教室。</span></p><p style="white-space: normal; text-indent: 2em;">预约面授成功后，系统会发送短信至您的手机。</p><p style="white-space: normal; text-indent: 2em;">您可以点击“课程表下载”，下载查看相关课程安排。<br/><span style="color: rgb(255, 0, 0);">特别提示：</span></p><p style="white-space: normal; text-indent: 2em;"><span style="text-indent: 2em;">1、“网上学习面授班”为参加网络学习前的6个学时的面授培训内容。选择在网络教学平台学习的学员或第一次参加培训的学员请预约“网上学习面授班”班次。</span><br/></p><p style="white-space: normal; text-indent: 2em;">2、如果您已参加完成“网上学习面授班”培训后，仍选择线下课堂学习，请预约“课堂学习面授班”班次。</p><p style="white-space: normal; text-indent: 2em;">3、面授学习均需提前一天预约。</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503834781810896.png" title="1503834781810896.png" alt="1503834781810896.png" width="350" height="214"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503834847892086.png" title="1503834847892086.png" alt="1503834847892086.png" width="350" height="192"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835032173018.png" title="1503835032173018.png" alt="1503835032173018.png" width="350" height="161"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835040362644.png" title="1503835040362644.png" alt="1503835040362644.png" width="350" height="150"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835048839473.png" title="1503835048839473.png" alt="1503835048839473.png" width="350" height="89"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835056316138.png" title="1503835056316138.png" alt="1503835056316138.png" width="350" height="1"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835063956735.png" title="1503835063956735.png" alt="blob.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal; text-indent: 2em;">当您参加满6个学时的面授培训以后，您的手机将收到短信提示，您再次登录后，点击右上方“理论学习” 然后再点击右侧的“点击学习”就能进入教学视频播放界面。</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835249551632.png" title="1503835249551632.png" alt="1503835249551632.png" width="350" height="134"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835268952765.png" title="1503835268952765.png" alt="1503835268952765.png" width="350" height="84"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835286648926.png" title="1503835286648926.png" alt="1503835286648926.png" width="350" height="1"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835314157577.png" title="1503835314157577.png" alt="blob.png"/></p><p style="white-space: normal; text-indent: 2em;"><span style="color: rgb(255, 0, 0);">因学习计时需进行人像验证，在您学习前，请您查看是否正确安装摄像头。</span></p><p style="white-space: normal;"><span style="color: rgb(84, 141, 212);">1、摄像头购买指导：</span></p><p style="text-indent: 0em; white-space: normal;">如果台式电脑未安装摄像头，可以在实体店买或者网上买。<br/>摄像头规格参数：<br/>Usb：2.0接口以上<br/>视像分辨率：640*480<br/>驱动：免驱</p><p style="white-space: normal;"><span style="color: rgb(84, 141, 212);">2、摄像头安装指导：</span><br/>(1)、请将摄像头的USB插口插到您的电脑主机USB接口（如果您长期使用，建议插在主机后面板上面。）</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835488784051.png" title="1503835488784051.png" alt="1503835488784051.png" width="350" height="218"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">(2)、初次使用时，安装如下图。<br/>摄像头插到usb接口弹出的提示：</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835617878608.png" title="1503835617878608.png" alt="1503835617878608.png" width="350" height="82"/></p><p style="white-space: normal;">(3)、安装成功：</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835623404295.png" title="1503835623404295.png" alt="1503835623404295.png" width="350" height="109"/></p><p style="white-space: normal;">(4)、安装成功后，点击右下角的小图标，会显示——可以使用字样。</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835629293128.png" title="1503835629293128.png" alt="1503835629293128.png" width="350" height="211"/></p><p style="white-space: normal;">(5)、最后，调试一下视频设备，看看如何吧！<br/>（注：在Win7中，视频画面需要第三方软件才可以显示，所以我们可以在QQ中来查看设备工作状态，在QQ面板中打开视频调试。）</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835641828020.png" title="1503835641828020.png" alt="1503835641828020.png" width="350" height="414"/></p><p style="white-space: normal;">(6)、切换到视频设置中，等待几秒后你应该会看到视频画面。显示视频设备启动成功，并且可以看到画面。这时，您刷新“理论学习”界面就可以进行视频验证了。</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835648561869.png" title="1503835648561869.png" alt="1503835648561869.png" width="350" height="284"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835679203366.png" title="1503835679203366.png" alt="1503835679203366.png" width="350" height="1"/></p><p style="white-space: normal;"><img width="804" height="1" src="http://ydxc.yooyor.com/ydxc/admin/ueditor/themes/default/images/spacer.gif" alt="http://static.cqxp.cqxpxt.com/img/xxzl/img2.png"/><br/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835668756189.png" title="1503835668756189.png" alt="blob.png"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835686985369.png" title="1503835686985369.png" alt="1503835686985369.png" width="350" height="119"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835691702513.png" title="1503835691702513.png" alt="1503835691702513.png" width="350" height="106"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835695456367.png" title="1503835695456367.png" alt="1503835695456367.png" width="350" height="165"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835701545103.png" title="1503835701545103.png" alt="1503835701545103.png" width="350" height="23"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835708519390.png" title="1503835708519390.png" alt="1503835708519390.png" width="350" height="1"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835712163555.png" title="1503835712163555.png" alt="blob.png"/></p><p style="white-space: normal;">考题练习：在参加科目一考试前，您可以在西培学堂进行考题练习。</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835718233496.png" title="1503835718233496.png" alt="1503835718233496.png" width="350" height="116"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835723321769.png" title="1503835723321769.png" alt="1503835723321769.png" width="350" height="135"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835733536003.png" title="1503835733536003.png" alt="1503835733536003.png" width="350" height="1"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835738281549.png" title="1503835738281549.png" alt="blob.png"/></p><p style="white-space: normal; text-align: center;"><span style="color: rgb(84, 141, 212);">(一）查看学时</span></p><p style="white-space: normal;">您可以在<span style="color: rgb(255, 0, 0);">“理论学习”</span>界面看见自己的学时完成情况<br/>也可以进入<span style="color: rgb(255, 0, 0);">“个人中心”</span>查看自己的学习情况。</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835746603331.png" title="1503835746603331.png" alt="1503835746603331.png" width="350" height="257"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835750379091.png" title="1503835750379091.png" alt="1503835750379091.png" width="350" height="232"/></p><p style="white-space: normal; text-align: center;"><span style="color: rgb(84, 141, 212);">(二）修改，忘记密码</span></p><p style="white-space: normal;">如果需要修改密码，请进入<span style="color: rgb(255, 0, 0);">“个人中心”</span>选择“修改密码”。<br/>如果忘记密码，1、您可以在首页“用户登录”下方点击<span style="color: rgb(255, 0, 0);">“忘记密码”</span>，核对相关信息后，<br/>我们会将您的密码以短信方式发送到您的手机；2、您可以拨打<span style="color: rgb(255, 0, 0);">4001025505</span>客服电话，<br/>客服人员核对相关信息后，将您的密码重置为<span style="color: rgb(255, 0, 0);">初始密码</span>。</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835759999893.png" title="1503835759999893.png" alt="1503835759999893.png" width="350" height="214"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835766985940.png" title="1503835766985940.png" alt="1503835766985940.png" width="350" height="149"/></p><p style="white-space: normal; text-align: center;"><span style="color: rgb(84, 141, 212);">(三）学习疑问或投诉意见</span></p><p style="white-space: normal;">(1)、您可以点击右侧的<span style="color: rgb(255, 0, 0);">“在线提问”</span>通过<span style="color: rgb(255, 0, 0);">“我要提问”</span>将相关问题反馈给我们， 我们将及时给您回复，您可在<span style="color: rgb(255, 0, 0);">“我的提问”</span>中看见回复情况。<br/>(2)、您可以点击右侧的<span style="color: rgb(255, 0, 0);">“联系我们”</span>，教学内容问题可通过“在线教师”与线上教师沟通； 其它问题可通过<span style="color: rgb(255, 0, 0);">“在线客服”</span>或者拨打<span style="color: rgb(255, 0, 0);">400-102-5505</span>客服电话与我们联系，您反馈的问题， 我们将及时给您回复。</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835772479999.png" title="1503835772479999.png" alt="1503835772479999.png" width="350" height="213"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835777271104.png" title="1503835777271104.png" alt="1503835777271104.png" width="350" height="229"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835782885455.png" title="1503835782885455.png" alt="1503835782885455.png" width="350" height="179"/></p><p><br/></p>', 1541556118, 1541556118, 1, 0),
(11, 0, '学车协议', 4, 0, '<p>学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1</p><p><br/></p><p>学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1学车协议1</p><p>学车协议1学车协议1</p><p><br/></p><p>学车协议1学车协议1学车协议1学车协议1学车协议1</p>', 0, 0, 1, 0),
(12, 0, '约考缴费流程', 4, 0, '<p style="text-align: center; white-space: normal;"><span style="font-size: 24px;">约考缴费流程</span></p><p style="white-space: normal;">&nbsp;</p><p style="white-space: normal;"><span style="font-size: 18px;">1. 约考流程</span></p><p style="white-space: normal;"><span style="color: rgb(255, 0, 0);">输入约考统一网址:&nbsp;</span><a href="http://cq.122.gov.cn/" target="_blank"><span style="color: rgb(255, 0, 0);">http://cq.122.gov.cn/</span></a><span style="color: rgb(255, 0, 0);">&nbsp;&nbsp;</span>(点击可访问)</p><p style="white-space: normal;">点击个人登录, 登录名为身份证号码,密码为收到的重庆交巡警平台发出六位数字的初始密码(短信接收)</p><p style="text-align: center; white-space: normal;"><img width="350" height="192" title="1503893237325713.png" alt="1503893237325713.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893237325713.png"/></p><p style="text-align: center; white-space: normal;"><img width="350" height="187" title="1503893243289005.png" alt="1503893243289005.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893243289005.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">如若密码遗失,选择找回密码,填写身份证和姓名并填写验证码重置密码即可</p><p style="text-align: center; white-space: normal;"><img width="350" height="184" title="1503893261863998.png" alt="1503893261863998.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893261863998.png"/></p><p style="text-align: center; white-space: normal;"><img width="350" height="186" title="1503893265290504.png" alt="1503893265290504.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893265290504.png"/></p><p style="text-align: center; white-space: normal;"><img width="350" height="172" title="1503893269689372.png" alt="1503893269689372.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893269689372.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">1)&nbsp;&nbsp;&nbsp; 点击驾驶证业务</p><p style="white-space: normal;">2)&nbsp;&nbsp;&nbsp; 点击在线办理</p><p style="text-align: center; white-space: normal;"><img width="350" height="382" title="1503893282115754.png" alt="1503893282115754.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893282115754.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">3)&nbsp;&nbsp;&nbsp; 选择考试科目，点击下一步</p><p style="text-align: center; white-space: normal;"><img width="350" height="193" title="1503893287615801.png" alt="1503893287615801.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893287615801.png"/></p><p style="white-space: normal;">&nbsp;</p><p style="white-space: normal;">4)&nbsp;&nbsp;&nbsp; 点击阅读并同意</p><p style="text-align: center; white-space: normal;"><img width="350" height="338" title="1503893293540965.png" alt="1503893293540965.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893293540965.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">5)&nbsp;&nbsp;&nbsp; 选择考试时间段并选择考场，具体考场和教练员沟通,点击查询</p><p style="white-space: normal;"><br/></p><p style="text-align: center; white-space: normal;"><img width="350" height="119" title="1503893315117034.png" alt="1503893315117034.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893315117034.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">6)&nbsp; 选择考试日和当天考试的场次,具体和驾校和教练员沟通, 这里会提示当天考试总人数和预约人数，可选择场次或更换场次</p><p style="text-align: center; white-space: normal;"><img width="350" height="336" title="1503893344321345.png" alt="1503893344321345.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893344321345.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">7)&nbsp;&nbsp;&nbsp; 这里先验证当时登录报名填写的手机号码，然后点击提交预约申请信息，约考完毕</p><p style="text-align: center; white-space: normal;"><img width="350" height="242" title="1503893353327725.png" alt="1503893353327725.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893353327725.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;"><strong><span style="color: rgb(255, 0, 0); font-size: 20px;">2. 缴考试费流程</span></strong></p><p style="white-space: normal;"><strong><span style="color: rgb(255, 0, 0); font-size: 20px;"><br/></span></strong></p><p style="white-space: normal;">输入考试缴费统一网站：<span style="color: rgb(255, 0, 0); text-decoration-line: underline;">http://</span><a style="color: rgb(255, 0, 0);" href="http://www.ggjfw.com/">www.ggjfw.com</a>&nbsp;(点击可访问)（网上缴费不能使用支付宝和微信支付只能使用网银和绑定手机号码的银行卡）</p><p style="white-space: normal;">1)&nbsp;&nbsp;&nbsp; 选择重庆</p><p style="text-align: center; white-space: normal;"><img width="350" height="305" title="1503893364372087.png" alt="1503893364372087.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893364372087.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">2)&nbsp;&nbsp;&nbsp; 选择车管所网上缴费平台</p><p style="text-align: center; white-space: normal;"><img width="350" height="196" title="1503893374122230.png" alt="1503893374122230.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893374122230.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">3)&nbsp;&nbsp;&nbsp; 选择驾管业务网上缴费</p><p style="text-align: center; white-space: normal;"><img width="350" height="275" title="1503893379927407.png" alt="1503893379927407.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893379927407.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">4)&nbsp;&nbsp;&nbsp; 完善个人信息之后点击申请查询（注意不要点击申请缴费）</p><p style="text-align: center; white-space: normal;"><img width="350" height="289" title="1503893384365248.png" alt="1503893384365248.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893384365248.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">5)&nbsp;&nbsp;&nbsp; 如没有缴费记录则点击申请缴费</p><p style="text-align: center; white-space: normal;"><img width="350" height="122" title="1503893389241078.png" alt="1503893389241078.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893389241078.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">6)&nbsp;&nbsp;&nbsp; 点击同意</p><p style="text-align: center; white-space: normal;"><img width="350" height="256" title="1503893396515147.png" alt="1503893396515147.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893396515147.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">7)&nbsp;&nbsp;&nbsp; 先选择科目考试，然后选择考试科目，比如科目一科目二，然后提交订单</p><p style="text-align: center; white-space: normal;"><img width="350" height="258" title="1503893404963275.png" alt="1503893404963275.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893404963275.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">8)&nbsp;&nbsp;&nbsp; 核对信息无误之后点击确认并缴费</p><p style="text-align: center; white-space: normal;"><img width="350" height="257" title="1503893412539437.png" alt="1503893412539437.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893412539437.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">9)&nbsp;&nbsp;&nbsp; 输入网银所绑定的手机号码并填写手机验证码</p><p style="text-align: center; white-space: normal;"><img width="350" height="227" title="1503893419839356.png" alt="1503893419839356.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893419839356.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">10)&nbsp;&nbsp;&nbsp;&nbsp; 核对无误之后点击下一步</p><p style="text-align: center; white-space: normal;"><img width="350" height="172" title="1503893426695615.png" alt="1503893426695615.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893426695615.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">11)&nbsp;&nbsp;&nbsp;&nbsp; 点击去付款</p><p style="white-space: normal;">&nbsp;</p><p style="text-align: center; white-space: normal;"><img width="350" height="232" title="1503893431279173.png" alt="1503893431279173.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893431279173.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">12)&nbsp;&nbsp;&nbsp;&nbsp; 输入银行卡号之后点击下一步</p><p style="text-align: center; white-space: normal;"><img width="350" height="226" title="1503893436913596.png" alt="1503893436913596.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893436913596.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">13)&nbsp;&nbsp;&nbsp;&nbsp; 完善信息之后点击付款</p><p style="text-align: center; white-space: normal;"><img width="350" height="223" title="1503893440580978.png" alt="1503893440580978.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893440580978.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">14)&nbsp;&nbsp;&nbsp;&nbsp; 缴费完毕，点击返回商户可检查缴费信息</p><p style="text-align: center; white-space: normal;"><img width="350" height="237" title="1503893447805722.png" alt="1503893447805722.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893447805722.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">15)&nbsp;&nbsp;&nbsp;&nbsp; 付款成功回执信息</p><p style="text-align: center; white-space: normal;"><img width="350" height="166" title="1503893457415224.png" alt="1503893457415224.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893457415224.png"/></p><p><br/></p>', 0, 0, 1, 0),
(5, 0, '学员风采', 4, 0, '<p>学员风采</p>', 1540971904, 1544686699, 1, 12),
(6, 0, '学车流程1', 4, 0, '<p>学车流程09</p>', 0, 0, 1, 13),
(7, 0, '优势服务', 4, 0, '<p>优势服务90</p>', 1541555832, 1541555832, 1, 14),
(8, 0, '学车保障', 4, 0, '<p>学车保障789</p>', 1541555824, 1541555824, 1, 15),
(9, 0, '常见问题', 4, 0, '<p>常见问题456</p>', 1541555815, 1541555815, 1, 16),
(13, 0, '报名即可参加万人电音节', 4, 0, '<p>最新活动11</p>', 37487778283, 37487778283, 1, 2),
(14, 0, '走进鼎吉', 4, 53, '测试2', 1541572764, 1542730500, 2, 3),
(15, 0, '走进鼎吉', 4, 53, '测试3', 1541572764, 1542730500, 3, 3),
(34, 1, '易点学车', 4, 53, '<p>走进鼎吉</p>', 1543908210, 1543909272, 6, 3),
(35, 1, '发现最美鼎吉', 4, 0, '<p>发现最美鼎吉1</p>', 0, 0, 6, 9),
(36, 1, '教练风采', 4, 0, '<p>教练风采</p>', 0, 0, 6, 10),
(37, 1, '团队风采', 4, 0, '<p>团队风采</p>', 0, 0, 6, 11),
(38, 1, '走进鼎吉', 4, 53, '<p>走进鼎吉</p>', 1543908377, 0, 4, 3),
(39, 1, '发现最美鼎吉', 4, 0, '<p>发现最美鼎吉1</p>', 0, 0, 4, 9),
(40, 1, '教练风采', 4, 0, '<p>教练风采</p>', 0, 0, 4, 10),
(41, 1, '团队风采', 4, 0, '<p>团队风采</p>', 0, 0, 4, 11),
(42, 1, '走进鼎吉', 4, 53, '<p>走进鼎吉</p>', 1543908497, 0, 5, 3),
(43, 1, '发现最美鼎吉', 4, 0, '<p>发现最美鼎吉1</p>', 0, 0, 5, 9),
(44, 1, '教练风采', 4, 0, '<p>教练风采</p>', 0, 0, 5, 10),
(45, 1, '团队风采', 4, 0, '<p>团队风采</p>', 0, 0, 5, 11),
(46, 1, '走进鼎吉', 4, 53, '<p>走进鼎吉</p>', 1543908677, 1543908677, 6, 3),
(47, 1, '发现最美鼎吉', 4, 0, '<p>发现最美鼎吉1</p>', 1543908677, 1543908677, 6, 9),
(48, 1, '教练风采', 4, 0, '<p>教练风采</p>', 1543908677, 1543908677, 6, 10),
(49, 1, '团队风采', 4, 0, '<p>团队风采</p>', 1543908677, 1543908677, 6, 11),
(50, 1, '科目一学习预约流程', 4, 0, '<p style="white-space: normal; text-align: center;"><span style="font-size: 24px;">科目一学习方法以及预约流程</span></p><p style="white-space: normal; text-align: center;">西培学堂网址：<span style="text-decoration-line: underline; color: rgb(255, 0, 0);"><a href="http://www.cqxpxt.com/" style="color: rgb(255, 0, 0);">http://www.cqxpxt.com/</a></span></p><p style="white-space: normal; text-align: center;">点击可访问</p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">一、学习方法</p><p style="white-space: normal; text-indent: 2em;">科目一理论学习为6+16模式，前边6个小时需要在西培学堂指定培训点进行面授上课，中途不能离开，并且为人脸识别认证；6个小时学习完毕之后后边16个小时可在网络上边进行学习，也可在课堂进行面授学习</p><p style="white-space: normal; text-indent: 2em;"><br/></p><p style="text-indent: 0em; white-space: normal;">二、预约流程</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503832882696801.png" title="1503832882696801.png" alt="blob.png"/></p><p style="white-space: normal; text-indent: 2em;">请您在首页右上方“用户登录”输入您的身份证号码，初始密码是身份证号码的后6位数字。</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503834101496624.png" title="1503834101496624.png" alt="1503834101496624.png" width="350" height="113"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503832938997982.png" title="1503832938997982.png" alt="1503832938997982.png" width="380" height="1"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503833678767163.png" title="1503833678767163.png" alt="blob.png"/></p><p style="white-space: normal; text-indent: 2em;">如果您是第一次登录，您将直接进入<span style="color: rgb(84, 141, 212);">“面授预约”</span>，首先，请您选择参加面授的地点。选择面授地点后，请选择参加面授的日期、时间、班次、教室。</p><p style="white-space: normal; text-indent: 2em;">如果您参加完6个学时面授培训以后，仍然选择课堂学习，请您点击<span style="color: rgb(84, 141, 212);">“面授预约”</span>，选择参加面授的地点，然后选择参加面授的<span style="color: rgb(84, 141, 212);">日期、时间、班次、教室。</span></p><p style="white-space: normal; text-indent: 2em;">预约面授成功后，系统会发送短信至您的手机。</p><p style="white-space: normal; text-indent: 2em;">您可以点击“课程表下载”，下载查看相关课程安排。<br/><span style="color: rgb(255, 0, 0);">特别提示：</span></p><p style="white-space: normal; text-indent: 2em;"><span style="text-indent: 2em;">1、“网上学习面授班”为参加网络学习前的6个学时的面授培训内容。选择在网络教学平台学习的学员或第一次参加培训的学员请预约“网上学习面授班”班次。</span><br/></p><p style="white-space: normal; text-indent: 2em;">2、如果您已参加完成“网上学习面授班”培训后，仍选择线下课堂学习，请预约“课堂学习面授班”班次。</p><p style="white-space: normal; text-indent: 2em;">3、面授学习均需提前一天预约。</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503834781810896.png" title="1503834781810896.png" alt="1503834781810896.png" width="350" height="214"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503834847892086.png" title="1503834847892086.png" alt="1503834847892086.png" width="350" height="192"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835032173018.png" title="1503835032173018.png" alt="1503835032173018.png" width="350" height="161"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835040362644.png" title="1503835040362644.png" alt="1503835040362644.png" width="350" height="150"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835048839473.png" title="1503835048839473.png" alt="1503835048839473.png" width="350" height="89"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835056316138.png" title="1503835056316138.png" alt="1503835056316138.png" width="350" height="1"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835063956735.png" title="1503835063956735.png" alt="blob.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal; text-indent: 2em;">当您参加满6个学时的面授培训以后，您的手机将收到短信提示，您再次登录后，点击右上方“理论学习” 然后再点击右侧的“点击学习”就能进入教学视频播放界面。</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835249551632.png" title="1503835249551632.png" alt="1503835249551632.png" width="350" height="134"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835268952765.png" title="1503835268952765.png" alt="1503835268952765.png" width="350" height="84"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835286648926.png" title="1503835286648926.png" alt="1503835286648926.png" width="350" height="1"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835314157577.png" title="1503835314157577.png" alt="blob.png"/></p><p style="white-space: normal; text-indent: 2em;"><span style="color: rgb(255, 0, 0);">因学习计时需进行人像验证，在您学习前，请您查看是否正确安装摄像头。</span></p><p style="white-space: normal;"><span style="color: rgb(84, 141, 212);">1、摄像头购买指导：</span></p><p style="text-indent: 0em; white-space: normal;">如果台式电脑未安装摄像头，可以在实体店买或者网上买。<br/>摄像头规格参数：<br/>Usb：2.0接口以上<br/>视像分辨率：640*480<br/>驱动：免驱</p><p style="white-space: normal;"><span style="color: rgb(84, 141, 212);">2、摄像头安装指导：</span><br/>(1)、请将摄像头的USB插口插到您的电脑主机USB接口（如果您长期使用，建议插在主机后面板上面。）</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835488784051.png" title="1503835488784051.png" alt="1503835488784051.png" width="350" height="218"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">(2)、初次使用时，安装如下图。<br/>摄像头插到usb接口弹出的提示：</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835617878608.png" title="1503835617878608.png" alt="1503835617878608.png" width="350" height="82"/></p><p style="white-space: normal;">(3)、安装成功：</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835623404295.png" title="1503835623404295.png" alt="1503835623404295.png" width="350" height="109"/></p><p style="white-space: normal;">(4)、安装成功后，点击右下角的小图标，会显示——可以使用字样。</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835629293128.png" title="1503835629293128.png" alt="1503835629293128.png" width="350" height="211"/></p><p style="white-space: normal;">(5)、最后，调试一下视频设备，看看如何吧！<br/>（注：在Win7中，视频画面需要第三方软件才可以显示，所以我们可以在QQ中来查看设备工作状态，在QQ面板中打开视频调试。）</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835641828020.png" title="1503835641828020.png" alt="1503835641828020.png" width="350" height="414"/></p><p style="white-space: normal;">(6)、切换到视频设置中，等待几秒后你应该会看到视频画面。显示视频设备启动成功，并且可以看到画面。这时，您刷新“理论学习”界面就可以进行视频验证了。</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835648561869.png" title="1503835648561869.png" alt="1503835648561869.png" width="350" height="284"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835679203366.png" title="1503835679203366.png" alt="1503835679203366.png" width="350" height="1"/></p><p style="white-space: normal;"><img width="804" height="1" src="http://ydxc.yooyor.com/ydxc/admin/ueditor/themes/default/images/spacer.gif" alt="http://static.cqxp.cqxpxt.com/img/xxzl/img2.png"/><br/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835668756189.png" title="1503835668756189.png" alt="blob.png"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835686985369.png" title="1503835686985369.png" alt="1503835686985369.png" width="350" height="119"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835691702513.png" title="1503835691702513.png" alt="1503835691702513.png" width="350" height="106"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835695456367.png" title="1503835695456367.png" alt="1503835695456367.png" width="350" height="165"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835701545103.png" title="1503835701545103.png" alt="1503835701545103.png" width="350" height="23"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835708519390.png" title="1503835708519390.png" alt="1503835708519390.png" width="350" height="1"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835712163555.png" title="1503835712163555.png" alt="blob.png"/></p><p style="white-space: normal;">考题练习：在参加科目一考试前，您可以在西培学堂进行考题练习。</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835718233496.png" title="1503835718233496.png" alt="1503835718233496.png" width="350" height="116"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835723321769.png" title="1503835723321769.png" alt="1503835723321769.png" width="350" height="135"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835733536003.png" title="1503835733536003.png" alt="1503835733536003.png" width="350" height="1"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835738281549.png" title="1503835738281549.png" alt="blob.png"/></p><p style="white-space: normal; text-align: center;"><span style="color: rgb(84, 141, 212);">(一）查看学时</span></p><p style="white-space: normal;">您可以在<span style="color: rgb(255, 0, 0);">“理论学习”</span>界面看见自己的学时完成情况<br/>也可以进入<span style="color: rgb(255, 0, 0);">“个人中心”</span>查看自己的学习情况。</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835746603331.png" title="1503835746603331.png" alt="1503835746603331.png" width="350" height="257"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835750379091.png" title="1503835750379091.png" alt="1503835750379091.png" width="350" height="232"/></p><p style="white-space: normal; text-align: center;"><span style="color: rgb(84, 141, 212);">(二）修改，忘记密码</span></p><p style="white-space: normal;">如果需要修改密码，请进入<span style="color: rgb(255, 0, 0);">“个人中心”</span>选择“修改密码”。<br/>如果忘记密码，1、您可以在首页“用户登录”下方点击<span style="color: rgb(255, 0, 0);">“忘记密码”</span>，核对相关信息后，<br/>我们会将您的密码以短信方式发送到您的手机；2、您可以拨打<span style="color: rgb(255, 0, 0);">4001025505</span>客服电话，<br/>客服人员核对相关信息后，将您的密码重置为<span style="color: rgb(255, 0, 0);">初始密码</span>。</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835759999893.png" title="1503835759999893.png" alt="1503835759999893.png" width="350" height="214"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835766985940.png" title="1503835766985940.png" alt="1503835766985940.png" width="350" height="149"/></p><p style="white-space: normal; text-align: center;"><span style="color: rgb(84, 141, 212);">(三）学习疑问或投诉意见</span></p><p style="white-space: normal;">(1)、您可以点击右侧的<span style="color: rgb(255, 0, 0);">“在线提问”</span>通过<span style="color: rgb(255, 0, 0);">“我要提问”</span>将相关问题反馈给我们， 我们将及时给您回复，您可在<span style="color: rgb(255, 0, 0);">“我的提问”</span>中看见回复情况。<br/>(2)、您可以点击右侧的<span style="color: rgb(255, 0, 0);">“联系我们”</span>，教学内容问题可通过“在线教师”与线上教师沟通； 其它问题可通过<span style="color: rgb(255, 0, 0);">“在线客服”</span>或者拨打<span style="color: rgb(255, 0, 0);">400-102-5505</span>客服电话与我们联系，您反馈的问题， 我们将及时给您回复。</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835772479999.png" title="1503835772479999.png" alt="1503835772479999.png" width="350" height="213"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835777271104.png" title="1503835777271104.png" alt="1503835777271104.png" width="350" height="229"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835782885455.png" title="1503835782885455.png" alt="1503835782885455.png" width="350" height="179"/></p><p><br/></p>', 1543908677, 1543908677, 6, 0),
(51, 1, '学车协议', 4, 0, '<p>学车协议123</p>', 1543908677, 1543908677, 6, 0);
INSERT INTO `sent_page` (`id`, `uid`, `title`, `model_id`, `cover_id`, `content`, `create_time`, `update_time`, `school_id`, `category_id`) VALUES
(52, 1, '约考缴费流程', 4, 0, '<p style="text-align: center; white-space: normal;"><span style="font-size: 24px;">约考缴费流程</span></p><p style="white-space: normal;">&nbsp;</p><p style="white-space: normal;"><span style="font-size: 18px;">1. 约考流程</span></p><p style="white-space: normal;"><span style="color: rgb(255, 0, 0);">输入约考统一网址:&nbsp;</span><a href="http://cq.122.gov.cn/" target="_blank"><span style="color: rgb(255, 0, 0);">http://cq.122.gov.cn/</span></a><span style="color: rgb(255, 0, 0);">&nbsp;&nbsp;</span>(点击可访问)</p><p style="white-space: normal;">点击个人登录, 登录名为身份证号码,密码为收到的重庆交巡警平台发出六位数字的初始密码(短信接收)</p><p style="text-align: center; white-space: normal;"><img width="350" height="192" title="1503893237325713.png" alt="1503893237325713.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893237325713.png"/></p><p style="text-align: center; white-space: normal;"><img width="350" height="187" title="1503893243289005.png" alt="1503893243289005.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893243289005.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">如若密码遗失,选择找回密码,填写身份证和姓名并填写验证码重置密码即可</p><p style="text-align: center; white-space: normal;"><img width="350" height="184" title="1503893261863998.png" alt="1503893261863998.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893261863998.png"/></p><p style="text-align: center; white-space: normal;"><img width="350" height="186" title="1503893265290504.png" alt="1503893265290504.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893265290504.png"/></p><p style="text-align: center; white-space: normal;"><img width="350" height="172" title="1503893269689372.png" alt="1503893269689372.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893269689372.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">1)&nbsp;&nbsp;&nbsp; 点击驾驶证业务</p><p style="white-space: normal;">2)&nbsp;&nbsp;&nbsp; 点击在线办理</p><p style="text-align: center; white-space: normal;"><img width="350" height="382" title="1503893282115754.png" alt="1503893282115754.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893282115754.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">3)&nbsp;&nbsp;&nbsp; 选择考试科目，点击下一步</p><p style="text-align: center; white-space: normal;"><img width="350" height="193" title="1503893287615801.png" alt="1503893287615801.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893287615801.png"/></p><p style="white-space: normal;">&nbsp;</p><p style="white-space: normal;">4)&nbsp;&nbsp;&nbsp; 点击阅读并同意</p><p style="text-align: center; white-space: normal;"><img width="350" height="338" title="1503893293540965.png" alt="1503893293540965.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893293540965.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">5)&nbsp;&nbsp;&nbsp; 选择考试时间段并选择考场，具体考场和教练员沟通,点击查询</p><p style="white-space: normal;"><br/></p><p style="text-align: center; white-space: normal;"><img width="350" height="119" title="1503893315117034.png" alt="1503893315117034.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893315117034.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">6)&nbsp; 选择考试日和当天考试的场次,具体和驾校和教练员沟通, 这里会提示当天考试总人数和预约人数，可选择场次或更换场次</p><p style="text-align: center; white-space: normal;"><img width="350" height="336" title="1503893344321345.png" alt="1503893344321345.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893344321345.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">7)&nbsp;&nbsp;&nbsp; 这里先验证当时登录报名填写的手机号码，然后点击提交预约申请信息，约考完毕</p><p style="text-align: center; white-space: normal;"><img width="350" height="242" title="1503893353327725.png" alt="1503893353327725.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893353327725.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;"><strong><span style="color: rgb(255, 0, 0); font-size: 20px;">2. 缴考试费流程</span></strong></p><p style="white-space: normal;"><strong><span style="color: rgb(255, 0, 0); font-size: 20px;"><br/></span></strong></p><p style="white-space: normal;">输入考试缴费统一网站：<span style="color: rgb(255, 0, 0); text-decoration-line: underline;">http://</span><a style="color: rgb(255, 0, 0);" href="http://www.ggjfw.com/">www.ggjfw.com</a>&nbsp;(点击可访问)（网上缴费不能使用支付宝和微信支付只能使用网银和绑定手机号码的银行卡）</p><p style="white-space: normal;">1)&nbsp;&nbsp;&nbsp; 选择重庆</p><p style="text-align: center; white-space: normal;"><img width="350" height="305" title="1503893364372087.png" alt="1503893364372087.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893364372087.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">2)&nbsp;&nbsp;&nbsp; 选择车管所网上缴费平台</p><p style="text-align: center; white-space: normal;"><img width="350" height="196" title="1503893374122230.png" alt="1503893374122230.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893374122230.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">3)&nbsp;&nbsp;&nbsp; 选择驾管业务网上缴费</p><p style="text-align: center; white-space: normal;"><img width="350" height="275" title="1503893379927407.png" alt="1503893379927407.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893379927407.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">4)&nbsp;&nbsp;&nbsp; 完善个人信息之后点击申请查询（注意不要点击申请缴费）</p><p style="text-align: center; white-space: normal;"><img width="350" height="289" title="1503893384365248.png" alt="1503893384365248.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893384365248.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">5)&nbsp;&nbsp;&nbsp; 如没有缴费记录则点击申请缴费</p><p style="text-align: center; white-space: normal;"><img width="350" height="122" title="1503893389241078.png" alt="1503893389241078.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893389241078.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">6)&nbsp;&nbsp;&nbsp; 点击同意</p><p style="text-align: center; white-space: normal;"><img width="350" height="256" title="1503893396515147.png" alt="1503893396515147.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893396515147.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">7)&nbsp;&nbsp;&nbsp; 先选择科目考试，然后选择考试科目，比如科目一科目二，然后提交订单</p><p style="text-align: center; white-space: normal;"><img width="350" height="258" title="1503893404963275.png" alt="1503893404963275.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893404963275.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">8)&nbsp;&nbsp;&nbsp; 核对信息无误之后点击确认并缴费</p><p style="text-align: center; white-space: normal;"><img width="350" height="257" title="1503893412539437.png" alt="1503893412539437.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893412539437.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">9)&nbsp;&nbsp;&nbsp; 输入网银所绑定的手机号码并填写手机验证码</p><p style="text-align: center; white-space: normal;"><img width="350" height="227" title="1503893419839356.png" alt="1503893419839356.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893419839356.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">10)&nbsp;&nbsp;&nbsp;&nbsp; 核对无误之后点击下一步</p><p style="text-align: center; white-space: normal;"><img width="350" height="172" title="1503893426695615.png" alt="1503893426695615.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893426695615.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">11)&nbsp;&nbsp;&nbsp;&nbsp; 点击去付款</p><p style="white-space: normal;">&nbsp;</p><p style="text-align: center; white-space: normal;"><img width="350" height="232" title="1503893431279173.png" alt="1503893431279173.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893431279173.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">12)&nbsp;&nbsp;&nbsp;&nbsp; 输入银行卡号之后点击下一步</p><p style="text-align: center; white-space: normal;"><img width="350" height="226" title="1503893436913596.png" alt="1503893436913596.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893436913596.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">13)&nbsp;&nbsp;&nbsp;&nbsp; 完善信息之后点击付款</p><p style="text-align: center; white-space: normal;"><img width="350" height="223" title="1503893440580978.png" alt="1503893440580978.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893440580978.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">14)&nbsp;&nbsp;&nbsp;&nbsp; 缴费完毕，点击返回商户可检查缴费信息</p><p style="text-align: center; white-space: normal;"><img width="350" height="237" title="1503893447805722.png" alt="1503893447805722.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893447805722.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">15)&nbsp;&nbsp;&nbsp;&nbsp; 付款成功回执信息</p><p style="text-align: center; white-space: normal;"><img width="350" height="166" title="1503893457415224.png" alt="1503893457415224.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893457415224.png"/></p><p><br/></p>', 1543908677, 1543908677, 6, 0),
(53, 1, '学员风采', 4, 0, '<p>学员风采</p>', 1543908677, 1543908677, 6, 12),
(54, 1, '学车流程1', 4, 0, '<p>学车流程09</p>', 1543908677, 1543908677, 6, 13),
(55, 1, '优势服务', 4, 0, '<p>优势服务90</p>', 1543908677, 1543908677, 6, 14),
(56, 1, '学车保障', 4, 0, '<p>学车保障789</p>', 1543908677, 1543908677, 6, 15),
(57, 1, '常见问题', 4, 0, '<p>常见问题456</p>', 1543908677, 1543908677, 6, 16),
(58, 1, '报名即可参加万人电音节', 4, 202, '<p>最新活动11</p>', 1543908677, 1543908677, 6, 2),
(59, 1, '走进鼎吉', 4, 53, '<p>走进鼎吉</p>', 1543908859, 1543908859, 4, 3),
(60, 1, '发现最美鼎吉', 4, 0, '<p>发现最美鼎吉1</p>', 1543908859, 1543908859, 4, 9),
(61, 1, '教练风采', 4, 0, '<p>教练风采</p>', 1543908859, 1543908859, 4, 10),
(62, 1, '团队风采', 4, 0, '<p>团队风采</p>', 1543908859, 1543908859, 4, 11),
(63, 1, '科目一学习预约流程', 4, 0, '<p style="white-space: normal; text-align: center;"><span style="font-size: 24px;">科目一学习方法以及预约流程</span></p><p style="white-space: normal; text-align: center;">西培学堂网址：<span style="text-decoration-line: underline; color: rgb(255, 0, 0);"><a href="http://www.cqxpxt.com/" style="color: rgb(255, 0, 0);">http://www.cqxpxt.com/</a></span></p><p style="white-space: normal; text-align: center;">点击可访问</p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">一、学习方法</p><p style="white-space: normal; text-indent: 2em;">科目一理论学习为6+16模式，前边6个小时需要在西培学堂指定培训点进行面授上课，中途不能离开，并且为人脸识别认证；6个小时学习完毕之后后边16个小时可在网络上边进行学习，也可在课堂进行面授学习</p><p style="white-space: normal; text-indent: 2em;"><br/></p><p style="text-indent: 0em; white-space: normal;">二、预约流程</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503832882696801.png" title="1503832882696801.png" alt="blob.png"/></p><p style="white-space: normal; text-indent: 2em;">请您在首页右上方“用户登录”输入您的身份证号码，初始密码是身份证号码的后6位数字。</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503834101496624.png" title="1503834101496624.png" alt="1503834101496624.png" width="350" height="113"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503832938997982.png" title="1503832938997982.png" alt="1503832938997982.png" width="380" height="1"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503833678767163.png" title="1503833678767163.png" alt="blob.png"/></p><p style="white-space: normal; text-indent: 2em;">如果您是第一次登录，您将直接进入<span style="color: rgb(84, 141, 212);">“面授预约”</span>，首先，请您选择参加面授的地点。选择面授地点后，请选择参加面授的日期、时间、班次、教室。</p><p style="white-space: normal; text-indent: 2em;">如果您参加完6个学时面授培训以后，仍然选择课堂学习，请您点击<span style="color: rgb(84, 141, 212);">“面授预约”</span>，选择参加面授的地点，然后选择参加面授的<span style="color: rgb(84, 141, 212);">日期、时间、班次、教室。</span></p><p style="white-space: normal; text-indent: 2em;">预约面授成功后，系统会发送短信至您的手机。</p><p style="white-space: normal; text-indent: 2em;">您可以点击“课程表下载”，下载查看相关课程安排。<br/><span style="color: rgb(255, 0, 0);">特别提示：</span></p><p style="white-space: normal; text-indent: 2em;"><span style="text-indent: 2em;">1、“网上学习面授班”为参加网络学习前的6个学时的面授培训内容。选择在网络教学平台学习的学员或第一次参加培训的学员请预约“网上学习面授班”班次。</span><br/></p><p style="white-space: normal; text-indent: 2em;">2、如果您已参加完成“网上学习面授班”培训后，仍选择线下课堂学习，请预约“课堂学习面授班”班次。</p><p style="white-space: normal; text-indent: 2em;">3、面授学习均需提前一天预约。</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503834781810896.png" title="1503834781810896.png" alt="1503834781810896.png" width="350" height="214"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503834847892086.png" title="1503834847892086.png" alt="1503834847892086.png" width="350" height="192"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835032173018.png" title="1503835032173018.png" alt="1503835032173018.png" width="350" height="161"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835040362644.png" title="1503835040362644.png" alt="1503835040362644.png" width="350" height="150"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835048839473.png" title="1503835048839473.png" alt="1503835048839473.png" width="350" height="89"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835056316138.png" title="1503835056316138.png" alt="1503835056316138.png" width="350" height="1"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835063956735.png" title="1503835063956735.png" alt="blob.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal; text-indent: 2em;">当您参加满6个学时的面授培训以后，您的手机将收到短信提示，您再次登录后，点击右上方“理论学习” 然后再点击右侧的“点击学习”就能进入教学视频播放界面。</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835249551632.png" title="1503835249551632.png" alt="1503835249551632.png" width="350" height="134"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835268952765.png" title="1503835268952765.png" alt="1503835268952765.png" width="350" height="84"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835286648926.png" title="1503835286648926.png" alt="1503835286648926.png" width="350" height="1"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835314157577.png" title="1503835314157577.png" alt="blob.png"/></p><p style="white-space: normal; text-indent: 2em;"><span style="color: rgb(255, 0, 0);">因学习计时需进行人像验证，在您学习前，请您查看是否正确安装摄像头。</span></p><p style="white-space: normal;"><span style="color: rgb(84, 141, 212);">1、摄像头购买指导：</span></p><p style="text-indent: 0em; white-space: normal;">如果台式电脑未安装摄像头，可以在实体店买或者网上买。<br/>摄像头规格参数：<br/>Usb：2.0接口以上<br/>视像分辨率：640*480<br/>驱动：免驱</p><p style="white-space: normal;"><span style="color: rgb(84, 141, 212);">2、摄像头安装指导：</span><br/>(1)、请将摄像头的USB插口插到您的电脑主机USB接口（如果您长期使用，建议插在主机后面板上面。）</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835488784051.png" title="1503835488784051.png" alt="1503835488784051.png" width="350" height="218"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">(2)、初次使用时，安装如下图。<br/>摄像头插到usb接口弹出的提示：</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835617878608.png" title="1503835617878608.png" alt="1503835617878608.png" width="350" height="82"/></p><p style="white-space: normal;">(3)、安装成功：</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835623404295.png" title="1503835623404295.png" alt="1503835623404295.png" width="350" height="109"/></p><p style="white-space: normal;">(4)、安装成功后，点击右下角的小图标，会显示——可以使用字样。</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835629293128.png" title="1503835629293128.png" alt="1503835629293128.png" width="350" height="211"/></p><p style="white-space: normal;">(5)、最后，调试一下视频设备，看看如何吧！<br/>（注：在Win7中，视频画面需要第三方软件才可以显示，所以我们可以在QQ中来查看设备工作状态，在QQ面板中打开视频调试。）</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835641828020.png" title="1503835641828020.png" alt="1503835641828020.png" width="350" height="414"/></p><p style="white-space: normal;">(6)、切换到视频设置中，等待几秒后你应该会看到视频画面。显示视频设备启动成功，并且可以看到画面。这时，您刷新“理论学习”界面就可以进行视频验证了。</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835648561869.png" title="1503835648561869.png" alt="1503835648561869.png" width="350" height="284"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835679203366.png" title="1503835679203366.png" alt="1503835679203366.png" width="350" height="1"/></p><p style="white-space: normal;"><img width="804" height="1" src="http://ydxc.yooyor.com/ydxc/admin/ueditor/themes/default/images/spacer.gif" alt="http://static.cqxp.cqxpxt.com/img/xxzl/img2.png"/><br/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835668756189.png" title="1503835668756189.png" alt="blob.png"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835686985369.png" title="1503835686985369.png" alt="1503835686985369.png" width="350" height="119"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835691702513.png" title="1503835691702513.png" alt="1503835691702513.png" width="350" height="106"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835695456367.png" title="1503835695456367.png" alt="1503835695456367.png" width="350" height="165"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835701545103.png" title="1503835701545103.png" alt="1503835701545103.png" width="350" height="23"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835708519390.png" title="1503835708519390.png" alt="1503835708519390.png" width="350" height="1"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835712163555.png" title="1503835712163555.png" alt="blob.png"/></p><p style="white-space: normal;">考题练习：在参加科目一考试前，您可以在西培学堂进行考题练习。</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835718233496.png" title="1503835718233496.png" alt="1503835718233496.png" width="350" height="116"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835723321769.png" title="1503835723321769.png" alt="1503835723321769.png" width="350" height="135"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835733536003.png" title="1503835733536003.png" alt="1503835733536003.png" width="350" height="1"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835738281549.png" title="1503835738281549.png" alt="blob.png"/></p><p style="white-space: normal; text-align: center;"><span style="color: rgb(84, 141, 212);">(一）查看学时</span></p><p style="white-space: normal;">您可以在<span style="color: rgb(255, 0, 0);">“理论学习”</span>界面看见自己的学时完成情况<br/>也可以进入<span style="color: rgb(255, 0, 0);">“个人中心”</span>查看自己的学习情况。</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835746603331.png" title="1503835746603331.png" alt="1503835746603331.png" width="350" height="257"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835750379091.png" title="1503835750379091.png" alt="1503835750379091.png" width="350" height="232"/></p><p style="white-space: normal; text-align: center;"><span style="color: rgb(84, 141, 212);">(二）修改，忘记密码</span></p><p style="white-space: normal;">如果需要修改密码，请进入<span style="color: rgb(255, 0, 0);">“个人中心”</span>选择“修改密码”。<br/>如果忘记密码，1、您可以在首页“用户登录”下方点击<span style="color: rgb(255, 0, 0);">“忘记密码”</span>，核对相关信息后，<br/>我们会将您的密码以短信方式发送到您的手机；2、您可以拨打<span style="color: rgb(255, 0, 0);">4001025505</span>客服电话，<br/>客服人员核对相关信息后，将您的密码重置为<span style="color: rgb(255, 0, 0);">初始密码</span>。</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835759999893.png" title="1503835759999893.png" alt="1503835759999893.png" width="350" height="214"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835766985940.png" title="1503835766985940.png" alt="1503835766985940.png" width="350" height="149"/></p><p style="white-space: normal; text-align: center;"><span style="color: rgb(84, 141, 212);">(三）学习疑问或投诉意见</span></p><p style="white-space: normal;">(1)、您可以点击右侧的<span style="color: rgb(255, 0, 0);">“在线提问”</span>通过<span style="color: rgb(255, 0, 0);">“我要提问”</span>将相关问题反馈给我们， 我们将及时给您回复，您可在<span style="color: rgb(255, 0, 0);">“我的提问”</span>中看见回复情况。<br/>(2)、您可以点击右侧的<span style="color: rgb(255, 0, 0);">“联系我们”</span>，教学内容问题可通过“在线教师”与线上教师沟通； 其它问题可通过<span style="color: rgb(255, 0, 0);">“在线客服”</span>或者拨打<span style="color: rgb(255, 0, 0);">400-102-5505</span>客服电话与我们联系，您反馈的问题， 我们将及时给您回复。</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835772479999.png" title="1503835772479999.png" alt="1503835772479999.png" width="350" height="213"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835777271104.png" title="1503835777271104.png" alt="1503835777271104.png" width="350" height="229"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835782885455.png" title="1503835782885455.png" alt="1503835782885455.png" width="350" height="179"/></p><p><br/></p>', 1543908859, 1543908859, 4, 0),
(64, 1, '学车协议', 4, 0, '<p>学车协议123</p>', 1543908859, 1543908859, 4, 0),
(65, 1, '约考缴费流程', 4, 0, '<p style="text-align: center; white-space: normal;"><span style="font-size: 24px;">约考缴费流程</span></p><p style="white-space: normal;">&nbsp;</p><p style="white-space: normal;"><span style="font-size: 18px;">1. 约考流程</span></p><p style="white-space: normal;"><span style="color: rgb(255, 0, 0);">输入约考统一网址:&nbsp;</span><a href="http://cq.122.gov.cn/" target="_blank"><span style="color: rgb(255, 0, 0);">http://cq.122.gov.cn/</span></a><span style="color: rgb(255, 0, 0);">&nbsp;&nbsp;</span>(点击可访问)</p><p style="white-space: normal;">点击个人登录, 登录名为身份证号码,密码为收到的重庆交巡警平台发出六位数字的初始密码(短信接收)</p><p style="text-align: center; white-space: normal;"><img width="350" height="192" title="1503893237325713.png" alt="1503893237325713.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893237325713.png"/></p><p style="text-align: center; white-space: normal;"><img width="350" height="187" title="1503893243289005.png" alt="1503893243289005.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893243289005.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">如若密码遗失,选择找回密码,填写身份证和姓名并填写验证码重置密码即可</p><p style="text-align: center; white-space: normal;"><img width="350" height="184" title="1503893261863998.png" alt="1503893261863998.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893261863998.png"/></p><p style="text-align: center; white-space: normal;"><img width="350" height="186" title="1503893265290504.png" alt="1503893265290504.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893265290504.png"/></p><p style="text-align: center; white-space: normal;"><img width="350" height="172" title="1503893269689372.png" alt="1503893269689372.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893269689372.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">1)&nbsp;&nbsp;&nbsp; 点击驾驶证业务</p><p style="white-space: normal;">2)&nbsp;&nbsp;&nbsp; 点击在线办理</p><p style="text-align: center; white-space: normal;"><img width="350" height="382" title="1503893282115754.png" alt="1503893282115754.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893282115754.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">3)&nbsp;&nbsp;&nbsp; 选择考试科目，点击下一步</p><p style="text-align: center; white-space: normal;"><img width="350" height="193" title="1503893287615801.png" alt="1503893287615801.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893287615801.png"/></p><p style="white-space: normal;">&nbsp;</p><p style="white-space: normal;">4)&nbsp;&nbsp;&nbsp; 点击阅读并同意</p><p style="text-align: center; white-space: normal;"><img width="350" height="338" title="1503893293540965.png" alt="1503893293540965.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893293540965.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">5)&nbsp;&nbsp;&nbsp; 选择考试时间段并选择考场，具体考场和教练员沟通,点击查询</p><p style="white-space: normal;"><br/></p><p style="text-align: center; white-space: normal;"><img width="350" height="119" title="1503893315117034.png" alt="1503893315117034.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893315117034.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">6)&nbsp; 选择考试日和当天考试的场次,具体和驾校和教练员沟通, 这里会提示当天考试总人数和预约人数，可选择场次或更换场次</p><p style="text-align: center; white-space: normal;"><img width="350" height="336" title="1503893344321345.png" alt="1503893344321345.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893344321345.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">7)&nbsp;&nbsp;&nbsp; 这里先验证当时登录报名填写的手机号码，然后点击提交预约申请信息，约考完毕</p><p style="text-align: center; white-space: normal;"><img width="350" height="242" title="1503893353327725.png" alt="1503893353327725.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893353327725.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;"><strong><span style="color: rgb(255, 0, 0); font-size: 20px;">2. 缴考试费流程</span></strong></p><p style="white-space: normal;"><strong><span style="color: rgb(255, 0, 0); font-size: 20px;"><br/></span></strong></p><p style="white-space: normal;">输入考试缴费统一网站：<span style="color: rgb(255, 0, 0); text-decoration-line: underline;">http://</span><a style="color: rgb(255, 0, 0);" href="http://www.ggjfw.com/">www.ggjfw.com</a>&nbsp;(点击可访问)（网上缴费不能使用支付宝和微信支付只能使用网银和绑定手机号码的银行卡）</p><p style="white-space: normal;">1)&nbsp;&nbsp;&nbsp; 选择重庆</p><p style="text-align: center; white-space: normal;"><img width="350" height="305" title="1503893364372087.png" alt="1503893364372087.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893364372087.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">2)&nbsp;&nbsp;&nbsp; 选择车管所网上缴费平台</p><p style="text-align: center; white-space: normal;"><img width="350" height="196" title="1503893374122230.png" alt="1503893374122230.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893374122230.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">3)&nbsp;&nbsp;&nbsp; 选择驾管业务网上缴费</p><p style="text-align: center; white-space: normal;"><img width="350" height="275" title="1503893379927407.png" alt="1503893379927407.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893379927407.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">4)&nbsp;&nbsp;&nbsp; 完善个人信息之后点击申请查询（注意不要点击申请缴费）</p><p style="text-align: center; white-space: normal;"><img width="350" height="289" title="1503893384365248.png" alt="1503893384365248.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893384365248.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">5)&nbsp;&nbsp;&nbsp; 如没有缴费记录则点击申请缴费</p><p style="text-align: center; white-space: normal;"><img width="350" height="122" title="1503893389241078.png" alt="1503893389241078.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893389241078.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">6)&nbsp;&nbsp;&nbsp; 点击同意</p><p style="text-align: center; white-space: normal;"><img width="350" height="256" title="1503893396515147.png" alt="1503893396515147.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893396515147.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">7)&nbsp;&nbsp;&nbsp; 先选择科目考试，然后选择考试科目，比如科目一科目二，然后提交订单</p><p style="text-align: center; white-space: normal;"><img width="350" height="258" title="1503893404963275.png" alt="1503893404963275.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893404963275.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">8)&nbsp;&nbsp;&nbsp; 核对信息无误之后点击确认并缴费</p><p style="text-align: center; white-space: normal;"><img width="350" height="257" title="1503893412539437.png" alt="1503893412539437.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893412539437.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">9)&nbsp;&nbsp;&nbsp; 输入网银所绑定的手机号码并填写手机验证码</p><p style="text-align: center; white-space: normal;"><img width="350" height="227" title="1503893419839356.png" alt="1503893419839356.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893419839356.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">10)&nbsp;&nbsp;&nbsp;&nbsp; 核对无误之后点击下一步</p><p style="text-align: center; white-space: normal;"><img width="350" height="172" title="1503893426695615.png" alt="1503893426695615.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893426695615.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">11)&nbsp;&nbsp;&nbsp;&nbsp; 点击去付款</p><p style="white-space: normal;">&nbsp;</p><p style="text-align: center; white-space: normal;"><img width="350" height="232" title="1503893431279173.png" alt="1503893431279173.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893431279173.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">12)&nbsp;&nbsp;&nbsp;&nbsp; 输入银行卡号之后点击下一步</p><p style="text-align: center; white-space: normal;"><img width="350" height="226" title="1503893436913596.png" alt="1503893436913596.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893436913596.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">13)&nbsp;&nbsp;&nbsp;&nbsp; 完善信息之后点击付款</p><p style="text-align: center; white-space: normal;"><img width="350" height="223" title="1503893440580978.png" alt="1503893440580978.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893440580978.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">14)&nbsp;&nbsp;&nbsp;&nbsp; 缴费完毕，点击返回商户可检查缴费信息</p><p style="text-align: center; white-space: normal;"><img width="350" height="237" title="1503893447805722.png" alt="1503893447805722.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893447805722.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">15)&nbsp;&nbsp;&nbsp;&nbsp; 付款成功回执信息</p><p style="text-align: center; white-space: normal;"><img width="350" height="166" title="1503893457415224.png" alt="1503893457415224.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893457415224.png"/></p><p><br/></p>', 1543908859, 1543908859, 4, 0),
(66, 1, '学员风采', 4, 0, '<p>学员风采</p>', 1543908859, 1543908859, 4, 12),
(67, 1, '学车流程1', 4, 0, '<p>学车流程09</p>', 1543908859, 1543908859, 4, 13),
(68, 1, '优势服务', 4, 0, '<p>优势服务90</p>', 1543908859, 1543908859, 4, 14),
(69, 1, '学车保障', 4, 0, '<p>学车保障789</p>', 1543908859, 1543908859, 4, 15),
(70, 1, '常见问题', 4, 0, '<p>常见问题456</p>', 1543908859, 1543908859, 4, 16),
(71, 1, '报名即可参加万人电音节', 4, 202, '<p>最新活动11</p>', 1543908859, 1543908859, 4, 2),
(72, 1, '走进鼎吉', 4, 53, '<p>走进鼎吉</p>', 1543908872, 1543908872, 5, 3),
(73, 1, '发现最美鼎吉', 4, 0, '<p>发现最美鼎吉1</p>', 1543908872, 1543908872, 5, 9),
(74, 1, '教练风采', 4, 0, '<p>教练风采</p>', 1543908872, 1543908872, 5, 10),
(75, 1, '团队风采', 4, 0, '<p>团队风采</p>', 1543908872, 1543908872, 5, 11),
(76, 1, '科目一学习预约流程', 4, 0, '<p style="white-space: normal; text-align: center;"><span style="font-size: 24px;">科目一学习方法以及预约流程</span></p><p style="white-space: normal; text-align: center;">西培学堂网址：<span style="text-decoration-line: underline; color: rgb(255, 0, 0);"><a href="http://www.cqxpxt.com/" style="color: rgb(255, 0, 0);">http://www.cqxpxt.com/</a></span></p><p style="white-space: normal; text-align: center;">点击可访问</p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">一、学习方法</p><p style="white-space: normal; text-indent: 2em;">科目一理论学习为6+16模式，前边6个小时需要在西培学堂指定培训点进行面授上课，中途不能离开，并且为人脸识别认证；6个小时学习完毕之后后边16个小时可在网络上边进行学习，也可在课堂进行面授学习</p><p style="white-space: normal; text-indent: 2em;"><br/></p><p style="text-indent: 0em; white-space: normal;">二、预约流程</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503832882696801.png" title="1503832882696801.png" alt="blob.png"/></p><p style="white-space: normal; text-indent: 2em;">请您在首页右上方“用户登录”输入您的身份证号码，初始密码是身份证号码的后6位数字。</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503834101496624.png" title="1503834101496624.png" alt="1503834101496624.png" width="350" height="113"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503832938997982.png" title="1503832938997982.png" alt="1503832938997982.png" width="380" height="1"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503833678767163.png" title="1503833678767163.png" alt="blob.png"/></p><p style="white-space: normal; text-indent: 2em;">如果您是第一次登录，您将直接进入<span style="color: rgb(84, 141, 212);">“面授预约”</span>，首先，请您选择参加面授的地点。选择面授地点后，请选择参加面授的日期、时间、班次、教室。</p><p style="white-space: normal; text-indent: 2em;">如果您参加完6个学时面授培训以后，仍然选择课堂学习，请您点击<span style="color: rgb(84, 141, 212);">“面授预约”</span>，选择参加面授的地点，然后选择参加面授的<span style="color: rgb(84, 141, 212);">日期、时间、班次、教室。</span></p><p style="white-space: normal; text-indent: 2em;">预约面授成功后，系统会发送短信至您的手机。</p><p style="white-space: normal; text-indent: 2em;">您可以点击“课程表下载”，下载查看相关课程安排。<br/><span style="color: rgb(255, 0, 0);">特别提示：</span></p><p style="white-space: normal; text-indent: 2em;"><span style="text-indent: 2em;">1、“网上学习面授班”为参加网络学习前的6个学时的面授培训内容。选择在网络教学平台学习的学员或第一次参加培训的学员请预约“网上学习面授班”班次。</span><br/></p><p style="white-space: normal; text-indent: 2em;">2、如果您已参加完成“网上学习面授班”培训后，仍选择线下课堂学习，请预约“课堂学习面授班”班次。</p><p style="white-space: normal; text-indent: 2em;">3、面授学习均需提前一天预约。</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503834781810896.png" title="1503834781810896.png" alt="1503834781810896.png" width="350" height="214"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503834847892086.png" title="1503834847892086.png" alt="1503834847892086.png" width="350" height="192"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835032173018.png" title="1503835032173018.png" alt="1503835032173018.png" width="350" height="161"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835040362644.png" title="1503835040362644.png" alt="1503835040362644.png" width="350" height="150"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835048839473.png" title="1503835048839473.png" alt="1503835048839473.png" width="350" height="89"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835056316138.png" title="1503835056316138.png" alt="1503835056316138.png" width="350" height="1"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835063956735.png" title="1503835063956735.png" alt="blob.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal; text-indent: 2em;">当您参加满6个学时的面授培训以后，您的手机将收到短信提示，您再次登录后，点击右上方“理论学习” 然后再点击右侧的“点击学习”就能进入教学视频播放界面。</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835249551632.png" title="1503835249551632.png" alt="1503835249551632.png" width="350" height="134"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835268952765.png" title="1503835268952765.png" alt="1503835268952765.png" width="350" height="84"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835286648926.png" title="1503835286648926.png" alt="1503835286648926.png" width="350" height="1"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835314157577.png" title="1503835314157577.png" alt="blob.png"/></p><p style="white-space: normal; text-indent: 2em;"><span style="color: rgb(255, 0, 0);">因学习计时需进行人像验证，在您学习前，请您查看是否正确安装摄像头。</span></p><p style="white-space: normal;"><span style="color: rgb(84, 141, 212);">1、摄像头购买指导：</span></p><p style="text-indent: 0em; white-space: normal;">如果台式电脑未安装摄像头，可以在实体店买或者网上买。<br/>摄像头规格参数：<br/>Usb：2.0接口以上<br/>视像分辨率：640*480<br/>驱动：免驱</p><p style="white-space: normal;"><span style="color: rgb(84, 141, 212);">2、摄像头安装指导：</span><br/>(1)、请将摄像头的USB插口插到您的电脑主机USB接口（如果您长期使用，建议插在主机后面板上面。）</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835488784051.png" title="1503835488784051.png" alt="1503835488784051.png" width="350" height="218"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">(2)、初次使用时，安装如下图。<br/>摄像头插到usb接口弹出的提示：</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835617878608.png" title="1503835617878608.png" alt="1503835617878608.png" width="350" height="82"/></p><p style="white-space: normal;">(3)、安装成功：</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835623404295.png" title="1503835623404295.png" alt="1503835623404295.png" width="350" height="109"/></p><p style="white-space: normal;">(4)、安装成功后，点击右下角的小图标，会显示——可以使用字样。</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835629293128.png" title="1503835629293128.png" alt="1503835629293128.png" width="350" height="211"/></p><p style="white-space: normal;">(5)、最后，调试一下视频设备，看看如何吧！<br/>（注：在Win7中，视频画面需要第三方软件才可以显示，所以我们可以在QQ中来查看设备工作状态，在QQ面板中打开视频调试。）</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835641828020.png" title="1503835641828020.png" alt="1503835641828020.png" width="350" height="414"/></p><p style="white-space: normal;">(6)、切换到视频设置中，等待几秒后你应该会看到视频画面。显示视频设备启动成功，并且可以看到画面。这时，您刷新“理论学习”界面就可以进行视频验证了。</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835648561869.png" title="1503835648561869.png" alt="1503835648561869.png" width="350" height="284"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835679203366.png" title="1503835679203366.png" alt="1503835679203366.png" width="350" height="1"/></p><p style="white-space: normal;"><img width="804" height="1" src="http://ydxc.yooyor.com/ydxc/admin/ueditor/themes/default/images/spacer.gif" alt="http://static.cqxp.cqxpxt.com/img/xxzl/img2.png"/><br/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835668756189.png" title="1503835668756189.png" alt="blob.png"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835686985369.png" title="1503835686985369.png" alt="1503835686985369.png" width="350" height="119"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835691702513.png" title="1503835691702513.png" alt="1503835691702513.png" width="350" height="106"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835695456367.png" title="1503835695456367.png" alt="1503835695456367.png" width="350" height="165"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835701545103.png" title="1503835701545103.png" alt="1503835701545103.png" width="350" height="23"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835708519390.png" title="1503835708519390.png" alt="1503835708519390.png" width="350" height="1"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835712163555.png" title="1503835712163555.png" alt="blob.png"/></p><p style="white-space: normal;">考题练习：在参加科目一考试前，您可以在西培学堂进行考题练习。</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835718233496.png" title="1503835718233496.png" alt="1503835718233496.png" width="350" height="116"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835723321769.png" title="1503835723321769.png" alt="1503835723321769.png" width="350" height="135"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835733536003.png" title="1503835733536003.png" alt="1503835733536003.png" width="350" height="1"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835738281549.png" title="1503835738281549.png" alt="blob.png"/></p><p style="white-space: normal; text-align: center;"><span style="color: rgb(84, 141, 212);">(一）查看学时</span></p><p style="white-space: normal;">您可以在<span style="color: rgb(255, 0, 0);">“理论学习”</span>界面看见自己的学时完成情况<br/>也可以进入<span style="color: rgb(255, 0, 0);">“个人中心”</span>查看自己的学习情况。</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835746603331.png" title="1503835746603331.png" alt="1503835746603331.png" width="350" height="257"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835750379091.png" title="1503835750379091.png" alt="1503835750379091.png" width="350" height="232"/></p><p style="white-space: normal; text-align: center;"><span style="color: rgb(84, 141, 212);">(二）修改，忘记密码</span></p><p style="white-space: normal;">如果需要修改密码，请进入<span style="color: rgb(255, 0, 0);">“个人中心”</span>选择“修改密码”。<br/>如果忘记密码，1、您可以在首页“用户登录”下方点击<span style="color: rgb(255, 0, 0);">“忘记密码”</span>，核对相关信息后，<br/>我们会将您的密码以短信方式发送到您的手机；2、您可以拨打<span style="color: rgb(255, 0, 0);">4001025505</span>客服电话，<br/>客服人员核对相关信息后，将您的密码重置为<span style="color: rgb(255, 0, 0);">初始密码</span>。</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835759999893.png" title="1503835759999893.png" alt="1503835759999893.png" width="350" height="214"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835766985940.png" title="1503835766985940.png" alt="1503835766985940.png" width="350" height="149"/></p><p style="white-space: normal; text-align: center;"><span style="color: rgb(84, 141, 212);">(三）学习疑问或投诉意见</span></p><p style="white-space: normal;">(1)、您可以点击右侧的<span style="color: rgb(255, 0, 0);">“在线提问”</span>通过<span style="color: rgb(255, 0, 0);">“我要提问”</span>将相关问题反馈给我们， 我们将及时给您回复，您可在<span style="color: rgb(255, 0, 0);">“我的提问”</span>中看见回复情况。<br/>(2)、您可以点击右侧的<span style="color: rgb(255, 0, 0);">“联系我们”</span>，教学内容问题可通过“在线教师”与线上教师沟通； 其它问题可通过<span style="color: rgb(255, 0, 0);">“在线客服”</span>或者拨打<span style="color: rgb(255, 0, 0);">400-102-5505</span>客服电话与我们联系，您反馈的问题， 我们将及时给您回复。</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835772479999.png" title="1503835772479999.png" alt="1503835772479999.png" width="350" height="213"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835777271104.png" title="1503835777271104.png" alt="1503835777271104.png" width="350" height="229"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835782885455.png" title="1503835782885455.png" alt="1503835782885455.png" width="350" height="179"/></p><p><br/></p>', 1543908872, 1543908872, 5, 0),
(77, 1, '学车协议', 4, 0, '<p>学车协议123</p>', 1543908872, 1543908872, 5, 0);
INSERT INTO `sent_page` (`id`, `uid`, `title`, `model_id`, `cover_id`, `content`, `create_time`, `update_time`, `school_id`, `category_id`) VALUES
(78, 1, '约考缴费流程', 4, 0, '<p style="text-align: center; white-space: normal;"><span style="font-size: 24px;">约考缴费流程</span></p><p style="white-space: normal;">&nbsp;</p><p style="white-space: normal;"><span style="font-size: 18px;">1. 约考流程</span></p><p style="white-space: normal;"><span style="color: rgb(255, 0, 0);">输入约考统一网址:&nbsp;</span><a href="http://cq.122.gov.cn/" target="_blank"><span style="color: rgb(255, 0, 0);">http://cq.122.gov.cn/</span></a><span style="color: rgb(255, 0, 0);">&nbsp;&nbsp;</span>(点击可访问)</p><p style="white-space: normal;">点击个人登录, 登录名为身份证号码,密码为收到的重庆交巡警平台发出六位数字的初始密码(短信接收)</p><p style="text-align: center; white-space: normal;"><img width="350" height="192" title="1503893237325713.png" alt="1503893237325713.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893237325713.png"/></p><p style="text-align: center; white-space: normal;"><img width="350" height="187" title="1503893243289005.png" alt="1503893243289005.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893243289005.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">如若密码遗失,选择找回密码,填写身份证和姓名并填写验证码重置密码即可</p><p style="text-align: center; white-space: normal;"><img width="350" height="184" title="1503893261863998.png" alt="1503893261863998.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893261863998.png"/></p><p style="text-align: center; white-space: normal;"><img width="350" height="186" title="1503893265290504.png" alt="1503893265290504.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893265290504.png"/></p><p style="text-align: center; white-space: normal;"><img width="350" height="172" title="1503893269689372.png" alt="1503893269689372.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893269689372.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">1)&nbsp;&nbsp;&nbsp; 点击驾驶证业务</p><p style="white-space: normal;">2)&nbsp;&nbsp;&nbsp; 点击在线办理</p><p style="text-align: center; white-space: normal;"><img width="350" height="382" title="1503893282115754.png" alt="1503893282115754.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893282115754.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">3)&nbsp;&nbsp;&nbsp; 选择考试科目，点击下一步</p><p style="text-align: center; white-space: normal;"><img width="350" height="193" title="1503893287615801.png" alt="1503893287615801.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893287615801.png"/></p><p style="white-space: normal;">&nbsp;</p><p style="white-space: normal;">4)&nbsp;&nbsp;&nbsp; 点击阅读并同意</p><p style="text-align: center; white-space: normal;"><img width="350" height="338" title="1503893293540965.png" alt="1503893293540965.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893293540965.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">5)&nbsp;&nbsp;&nbsp; 选择考试时间段并选择考场，具体考场和教练员沟通,点击查询</p><p style="white-space: normal;"><br/></p><p style="text-align: center; white-space: normal;"><img width="350" height="119" title="1503893315117034.png" alt="1503893315117034.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893315117034.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">6)&nbsp; 选择考试日和当天考试的场次,具体和驾校和教练员沟通, 这里会提示当天考试总人数和预约人数，可选择场次或更换场次</p><p style="text-align: center; white-space: normal;"><img width="350" height="336" title="1503893344321345.png" alt="1503893344321345.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893344321345.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">7)&nbsp;&nbsp;&nbsp; 这里先验证当时登录报名填写的手机号码，然后点击提交预约申请信息，约考完毕</p><p style="text-align: center; white-space: normal;"><img width="350" height="242" title="1503893353327725.png" alt="1503893353327725.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893353327725.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;"><strong><span style="color: rgb(255, 0, 0); font-size: 20px;">2. 缴考试费流程</span></strong></p><p style="white-space: normal;"><strong><span style="color: rgb(255, 0, 0); font-size: 20px;"><br/></span></strong></p><p style="white-space: normal;">输入考试缴费统一网站：<span style="color: rgb(255, 0, 0); text-decoration-line: underline;">http://</span><a style="color: rgb(255, 0, 0);" href="http://www.ggjfw.com/">www.ggjfw.com</a>&nbsp;(点击可访问)（网上缴费不能使用支付宝和微信支付只能使用网银和绑定手机号码的银行卡）</p><p style="white-space: normal;">1)&nbsp;&nbsp;&nbsp; 选择重庆</p><p style="text-align: center; white-space: normal;"><img width="350" height="305" title="1503893364372087.png" alt="1503893364372087.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893364372087.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">2)&nbsp;&nbsp;&nbsp; 选择车管所网上缴费平台</p><p style="text-align: center; white-space: normal;"><img width="350" height="196" title="1503893374122230.png" alt="1503893374122230.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893374122230.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">3)&nbsp;&nbsp;&nbsp; 选择驾管业务网上缴费</p><p style="text-align: center; white-space: normal;"><img width="350" height="275" title="1503893379927407.png" alt="1503893379927407.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893379927407.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">4)&nbsp;&nbsp;&nbsp; 完善个人信息之后点击申请查询（注意不要点击申请缴费）</p><p style="text-align: center; white-space: normal;"><img width="350" height="289" title="1503893384365248.png" alt="1503893384365248.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893384365248.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">5)&nbsp;&nbsp;&nbsp; 如没有缴费记录则点击申请缴费</p><p style="text-align: center; white-space: normal;"><img width="350" height="122" title="1503893389241078.png" alt="1503893389241078.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893389241078.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">6)&nbsp;&nbsp;&nbsp; 点击同意</p><p style="text-align: center; white-space: normal;"><img width="350" height="256" title="1503893396515147.png" alt="1503893396515147.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893396515147.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">7)&nbsp;&nbsp;&nbsp; 先选择科目考试，然后选择考试科目，比如科目一科目二，然后提交订单</p><p style="text-align: center; white-space: normal;"><img width="350" height="258" title="1503893404963275.png" alt="1503893404963275.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893404963275.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">8)&nbsp;&nbsp;&nbsp; 核对信息无误之后点击确认并缴费</p><p style="text-align: center; white-space: normal;"><img width="350" height="257" title="1503893412539437.png" alt="1503893412539437.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893412539437.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">9)&nbsp;&nbsp;&nbsp; 输入网银所绑定的手机号码并填写手机验证码</p><p style="text-align: center; white-space: normal;"><img width="350" height="227" title="1503893419839356.png" alt="1503893419839356.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893419839356.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">10)&nbsp;&nbsp;&nbsp;&nbsp; 核对无误之后点击下一步</p><p style="text-align: center; white-space: normal;"><img width="350" height="172" title="1503893426695615.png" alt="1503893426695615.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893426695615.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">11)&nbsp;&nbsp;&nbsp;&nbsp; 点击去付款</p><p style="white-space: normal;">&nbsp;</p><p style="text-align: center; white-space: normal;"><img width="350" height="232" title="1503893431279173.png" alt="1503893431279173.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893431279173.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">12)&nbsp;&nbsp;&nbsp;&nbsp; 输入银行卡号之后点击下一步</p><p style="text-align: center; white-space: normal;"><img width="350" height="226" title="1503893436913596.png" alt="1503893436913596.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893436913596.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">13)&nbsp;&nbsp;&nbsp;&nbsp; 完善信息之后点击付款</p><p style="text-align: center; white-space: normal;"><img width="350" height="223" title="1503893440580978.png" alt="1503893440580978.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893440580978.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">14)&nbsp;&nbsp;&nbsp;&nbsp; 缴费完毕，点击返回商户可检查缴费信息</p><p style="text-align: center; white-space: normal;"><img width="350" height="237" title="1503893447805722.png" alt="1503893447805722.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893447805722.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">15)&nbsp;&nbsp;&nbsp;&nbsp; 付款成功回执信息</p><p style="text-align: center; white-space: normal;"><img width="350" height="166" title="1503893457415224.png" alt="1503893457415224.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893457415224.png"/></p><p><br/></p>', 1543908872, 1543908872, 5, 0),
(79, 1, '学员风采', 4, 0, '<p>学员风采</p>', 1543908872, 1543908872, 5, 12),
(80, 1, '学车流程1', 4, 0, '<p>学车流程09</p>', 1543908872, 1543908872, 5, 13),
(81, 1, '优势服务', 4, 0, '<p>优势服务90</p>', 1543908872, 1543908872, 5, 14),
(82, 1, '学车保障', 4, 0, '<p>学车保障789</p>', 1543908872, 1543908872, 5, 15),
(83, 1, '常见问题', 4, 0, '<p>常见问题456</p>', 1543908872, 1543908872, 5, 16),
(84, 1, '报名即可参加万人电音节', 4, 202, '<p>最新活动11</p>', 1543908872, 1543908872, 5, 2),
(85, 1, '走进鼎吉', 4, 53, '<p>走进鼎吉</p>', 1543908883, 1543908883, 6, 3),
(86, 1, '发现最美鼎吉', 4, 0, '<p>发现最美鼎吉1</p>', 1543908883, 1543908883, 6, 9),
(87, 1, '教练风采', 4, 0, '<p>教练风采</p>', 1543908883, 1543908883, 6, 10),
(88, 1, '团队风采', 4, 0, '<p>团队风采</p>', 1543908883, 1543908883, 6, 11),
(89, 1, '科目一学习预约流程', 4, 0, '<p style="white-space: normal; text-align: center;"><span style="font-size: 24px;">科目一学习方法以及预约流程</span></p><p style="white-space: normal; text-align: center;">西培学堂网址：<span style="text-decoration-line: underline; color: rgb(255, 0, 0);"><a href="http://www.cqxpxt.com/" style="color: rgb(255, 0, 0);">http://www.cqxpxt.com/</a></span></p><p style="white-space: normal; text-align: center;">点击可访问</p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">一、学习方法</p><p style="white-space: normal; text-indent: 2em;">科目一理论学习为6+16模式，前边6个小时需要在西培学堂指定培训点进行面授上课，中途不能离开，并且为人脸识别认证；6个小时学习完毕之后后边16个小时可在网络上边进行学习，也可在课堂进行面授学习</p><p style="white-space: normal; text-indent: 2em;"><br/></p><p style="text-indent: 0em; white-space: normal;">二、预约流程</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503832882696801.png" title="1503832882696801.png" alt="blob.png"/></p><p style="white-space: normal; text-indent: 2em;">请您在首页右上方“用户登录”输入您的身份证号码，初始密码是身份证号码的后6位数字。</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503834101496624.png" title="1503834101496624.png" alt="1503834101496624.png" width="350" height="113"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503832938997982.png" title="1503832938997982.png" alt="1503832938997982.png" width="380" height="1"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503833678767163.png" title="1503833678767163.png" alt="blob.png"/></p><p style="white-space: normal; text-indent: 2em;">如果您是第一次登录，您将直接进入<span style="color: rgb(84, 141, 212);">“面授预约”</span>，首先，请您选择参加面授的地点。选择面授地点后，请选择参加面授的日期、时间、班次、教室。</p><p style="white-space: normal; text-indent: 2em;">如果您参加完6个学时面授培训以后，仍然选择课堂学习，请您点击<span style="color: rgb(84, 141, 212);">“面授预约”</span>，选择参加面授的地点，然后选择参加面授的<span style="color: rgb(84, 141, 212);">日期、时间、班次、教室。</span></p><p style="white-space: normal; text-indent: 2em;">预约面授成功后，系统会发送短信至您的手机。</p><p style="white-space: normal; text-indent: 2em;">您可以点击“课程表下载”，下载查看相关课程安排。<br/><span style="color: rgb(255, 0, 0);">特别提示：</span></p><p style="white-space: normal; text-indent: 2em;"><span style="text-indent: 2em;">1、“网上学习面授班”为参加网络学习前的6个学时的面授培训内容。选择在网络教学平台学习的学员或第一次参加培训的学员请预约“网上学习面授班”班次。</span><br/></p><p style="white-space: normal; text-indent: 2em;">2、如果您已参加完成“网上学习面授班”培训后，仍选择线下课堂学习，请预约“课堂学习面授班”班次。</p><p style="white-space: normal; text-indent: 2em;">3、面授学习均需提前一天预约。</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503834781810896.png" title="1503834781810896.png" alt="1503834781810896.png" width="350" height="214"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503834847892086.png" title="1503834847892086.png" alt="1503834847892086.png" width="350" height="192"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835032173018.png" title="1503835032173018.png" alt="1503835032173018.png" width="350" height="161"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835040362644.png" title="1503835040362644.png" alt="1503835040362644.png" width="350" height="150"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835048839473.png" title="1503835048839473.png" alt="1503835048839473.png" width="350" height="89"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835056316138.png" title="1503835056316138.png" alt="1503835056316138.png" width="350" height="1"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835063956735.png" title="1503835063956735.png" alt="blob.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal; text-indent: 2em;">当您参加满6个学时的面授培训以后，您的手机将收到短信提示，您再次登录后，点击右上方“理论学习” 然后再点击右侧的“点击学习”就能进入教学视频播放界面。</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835249551632.png" title="1503835249551632.png" alt="1503835249551632.png" width="350" height="134"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835268952765.png" title="1503835268952765.png" alt="1503835268952765.png" width="350" height="84"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835286648926.png" title="1503835286648926.png" alt="1503835286648926.png" width="350" height="1"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835314157577.png" title="1503835314157577.png" alt="blob.png"/></p><p style="white-space: normal; text-indent: 2em;"><span style="color: rgb(255, 0, 0);">因学习计时需进行人像验证，在您学习前，请您查看是否正确安装摄像头。</span></p><p style="white-space: normal;"><span style="color: rgb(84, 141, 212);">1、摄像头购买指导：</span></p><p style="text-indent: 0em; white-space: normal;">如果台式电脑未安装摄像头，可以在实体店买或者网上买。<br/>摄像头规格参数：<br/>Usb：2.0接口以上<br/>视像分辨率：640*480<br/>驱动：免驱</p><p style="white-space: normal;"><span style="color: rgb(84, 141, 212);">2、摄像头安装指导：</span><br/>(1)、请将摄像头的USB插口插到您的电脑主机USB接口（如果您长期使用，建议插在主机后面板上面。）</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835488784051.png" title="1503835488784051.png" alt="1503835488784051.png" width="350" height="218"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">(2)、初次使用时，安装如下图。<br/>摄像头插到usb接口弹出的提示：</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835617878608.png" title="1503835617878608.png" alt="1503835617878608.png" width="350" height="82"/></p><p style="white-space: normal;">(3)、安装成功：</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835623404295.png" title="1503835623404295.png" alt="1503835623404295.png" width="350" height="109"/></p><p style="white-space: normal;">(4)、安装成功后，点击右下角的小图标，会显示——可以使用字样。</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835629293128.png" title="1503835629293128.png" alt="1503835629293128.png" width="350" height="211"/></p><p style="white-space: normal;">(5)、最后，调试一下视频设备，看看如何吧！<br/>（注：在Win7中，视频画面需要第三方软件才可以显示，所以我们可以在QQ中来查看设备工作状态，在QQ面板中打开视频调试。）</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835641828020.png" title="1503835641828020.png" alt="1503835641828020.png" width="350" height="414"/></p><p style="white-space: normal;">(6)、切换到视频设置中，等待几秒后你应该会看到视频画面。显示视频设备启动成功，并且可以看到画面。这时，您刷新“理论学习”界面就可以进行视频验证了。</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835648561869.png" title="1503835648561869.png" alt="1503835648561869.png" width="350" height="284"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835679203366.png" title="1503835679203366.png" alt="1503835679203366.png" width="350" height="1"/></p><p style="white-space: normal;"><img width="804" height="1" src="http://ydxc.yooyor.com/ydxc/admin/ueditor/themes/default/images/spacer.gif" alt="http://static.cqxp.cqxpxt.com/img/xxzl/img2.png"/><br/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835668756189.png" title="1503835668756189.png" alt="blob.png"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835686985369.png" title="1503835686985369.png" alt="1503835686985369.png" width="350" height="119"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835691702513.png" title="1503835691702513.png" alt="1503835691702513.png" width="350" height="106"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835695456367.png" title="1503835695456367.png" alt="1503835695456367.png" width="350" height="165"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835701545103.png" title="1503835701545103.png" alt="1503835701545103.png" width="350" height="23"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835708519390.png" title="1503835708519390.png" alt="1503835708519390.png" width="350" height="1"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835712163555.png" title="1503835712163555.png" alt="blob.png"/></p><p style="white-space: normal;">考题练习：在参加科目一考试前，您可以在西培学堂进行考题练习。</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835718233496.png" title="1503835718233496.png" alt="1503835718233496.png" width="350" height="116"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835723321769.png" title="1503835723321769.png" alt="1503835723321769.png" width="350" height="135"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835733536003.png" title="1503835733536003.png" alt="1503835733536003.png" width="350" height="1"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835738281549.png" title="1503835738281549.png" alt="blob.png"/></p><p style="white-space: normal; text-align: center;"><span style="color: rgb(84, 141, 212);">(一）查看学时</span></p><p style="white-space: normal;">您可以在<span style="color: rgb(255, 0, 0);">“理论学习”</span>界面看见自己的学时完成情况<br/>也可以进入<span style="color: rgb(255, 0, 0);">“个人中心”</span>查看自己的学习情况。</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835746603331.png" title="1503835746603331.png" alt="1503835746603331.png" width="350" height="257"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835750379091.png" title="1503835750379091.png" alt="1503835750379091.png" width="350" height="232"/></p><p style="white-space: normal; text-align: center;"><span style="color: rgb(84, 141, 212);">(二）修改，忘记密码</span></p><p style="white-space: normal;">如果需要修改密码，请进入<span style="color: rgb(255, 0, 0);">“个人中心”</span>选择“修改密码”。<br/>如果忘记密码，1、您可以在首页“用户登录”下方点击<span style="color: rgb(255, 0, 0);">“忘记密码”</span>，核对相关信息后，<br/>我们会将您的密码以短信方式发送到您的手机；2、您可以拨打<span style="color: rgb(255, 0, 0);">4001025505</span>客服电话，<br/>客服人员核对相关信息后，将您的密码重置为<span style="color: rgb(255, 0, 0);">初始密码</span>。</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835759999893.png" title="1503835759999893.png" alt="1503835759999893.png" width="350" height="214"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835766985940.png" title="1503835766985940.png" alt="1503835766985940.png" width="350" height="149"/></p><p style="white-space: normal; text-align: center;"><span style="color: rgb(84, 141, 212);">(三）学习疑问或投诉意见</span></p><p style="white-space: normal;">(1)、您可以点击右侧的<span style="color: rgb(255, 0, 0);">“在线提问”</span>通过<span style="color: rgb(255, 0, 0);">“我要提问”</span>将相关问题反馈给我们， 我们将及时给您回复，您可在<span style="color: rgb(255, 0, 0);">“我的提问”</span>中看见回复情况。<br/>(2)、您可以点击右侧的<span style="color: rgb(255, 0, 0);">“联系我们”</span>，教学内容问题可通过“在线教师”与线上教师沟通； 其它问题可通过<span style="color: rgb(255, 0, 0);">“在线客服”</span>或者拨打<span style="color: rgb(255, 0, 0);">400-102-5505</span>客服电话与我们联系，您反馈的问题， 我们将及时给您回复。</p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835772479999.png" title="1503835772479999.png" alt="1503835772479999.png" width="350" height="213"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835777271104.png" title="1503835777271104.png" alt="1503835777271104.png" width="350" height="229"/></p><p style="white-space: normal; text-align: center;"><img src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170827/1503835782885455.png" title="1503835782885455.png" alt="1503835782885455.png" width="350" height="179"/></p><p><br/></p>', 1543908883, 1543908883, 6, 0),
(90, 1, '学车协议', 4, 0, '<p>学车协议123</p>', 1543908883, 1543908883, 6, 0),
(91, 1, '约考缴费流程', 4, 0, '<p style="text-align: center; white-space: normal;"><span style="font-size: 24px;">约考缴费流程</span></p><p style="white-space: normal;">&nbsp;</p><p style="white-space: normal;"><span style="font-size: 18px;">1. 约考流程</span></p><p style="white-space: normal;"><span style="color: rgb(255, 0, 0);">输入约考统一网址:&nbsp;</span><a href="http://cq.122.gov.cn/" target="_blank"><span style="color: rgb(255, 0, 0);">http://cq.122.gov.cn/</span></a><span style="color: rgb(255, 0, 0);">&nbsp;&nbsp;</span>(点击可访问)</p><p style="white-space: normal;">点击个人登录, 登录名为身份证号码,密码为收到的重庆交巡警平台发出六位数字的初始密码(短信接收)</p><p style="text-align: center; white-space: normal;"><img width="350" height="192" title="1503893237325713.png" alt="1503893237325713.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893237325713.png"/></p><p style="text-align: center; white-space: normal;"><img width="350" height="187" title="1503893243289005.png" alt="1503893243289005.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893243289005.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">如若密码遗失,选择找回密码,填写身份证和姓名并填写验证码重置密码即可</p><p style="text-align: center; white-space: normal;"><img width="350" height="184" title="1503893261863998.png" alt="1503893261863998.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893261863998.png"/></p><p style="text-align: center; white-space: normal;"><img width="350" height="186" title="1503893265290504.png" alt="1503893265290504.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893265290504.png"/></p><p style="text-align: center; white-space: normal;"><img width="350" height="172" title="1503893269689372.png" alt="1503893269689372.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893269689372.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">1)&nbsp;&nbsp;&nbsp; 点击驾驶证业务</p><p style="white-space: normal;">2)&nbsp;&nbsp;&nbsp; 点击在线办理</p><p style="text-align: center; white-space: normal;"><img width="350" height="382" title="1503893282115754.png" alt="1503893282115754.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893282115754.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">3)&nbsp;&nbsp;&nbsp; 选择考试科目，点击下一步</p><p style="text-align: center; white-space: normal;"><img width="350" height="193" title="1503893287615801.png" alt="1503893287615801.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893287615801.png"/></p><p style="white-space: normal;">&nbsp;</p><p style="white-space: normal;">4)&nbsp;&nbsp;&nbsp; 点击阅读并同意</p><p style="text-align: center; white-space: normal;"><img width="350" height="338" title="1503893293540965.png" alt="1503893293540965.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893293540965.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">5)&nbsp;&nbsp;&nbsp; 选择考试时间段并选择考场，具体考场和教练员沟通,点击查询</p><p style="white-space: normal;"><br/></p><p style="text-align: center; white-space: normal;"><img width="350" height="119" title="1503893315117034.png" alt="1503893315117034.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893315117034.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">6)&nbsp; 选择考试日和当天考试的场次,具体和驾校和教练员沟通, 这里会提示当天考试总人数和预约人数，可选择场次或更换场次</p><p style="text-align: center; white-space: normal;"><img width="350" height="336" title="1503893344321345.png" alt="1503893344321345.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893344321345.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">7)&nbsp;&nbsp;&nbsp; 这里先验证当时登录报名填写的手机号码，然后点击提交预约申请信息，约考完毕</p><p style="text-align: center; white-space: normal;"><img width="350" height="242" title="1503893353327725.png" alt="1503893353327725.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893353327725.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;"><strong><span style="color: rgb(255, 0, 0); font-size: 20px;">2. 缴考试费流程</span></strong></p><p style="white-space: normal;"><strong><span style="color: rgb(255, 0, 0); font-size: 20px;"><br/></span></strong></p><p style="white-space: normal;">输入考试缴费统一网站：<span style="color: rgb(255, 0, 0); text-decoration-line: underline;">http://</span><a style="color: rgb(255, 0, 0);" href="http://www.ggjfw.com/">www.ggjfw.com</a>&nbsp;(点击可访问)（网上缴费不能使用支付宝和微信支付只能使用网银和绑定手机号码的银行卡）</p><p style="white-space: normal;">1)&nbsp;&nbsp;&nbsp; 选择重庆</p><p style="text-align: center; white-space: normal;"><img width="350" height="305" title="1503893364372087.png" alt="1503893364372087.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893364372087.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">2)&nbsp;&nbsp;&nbsp; 选择车管所网上缴费平台</p><p style="text-align: center; white-space: normal;"><img width="350" height="196" title="1503893374122230.png" alt="1503893374122230.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893374122230.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">3)&nbsp;&nbsp;&nbsp; 选择驾管业务网上缴费</p><p style="text-align: center; white-space: normal;"><img width="350" height="275" title="1503893379927407.png" alt="1503893379927407.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893379927407.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">4)&nbsp;&nbsp;&nbsp; 完善个人信息之后点击申请查询（注意不要点击申请缴费）</p><p style="text-align: center; white-space: normal;"><img width="350" height="289" title="1503893384365248.png" alt="1503893384365248.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893384365248.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">5)&nbsp;&nbsp;&nbsp; 如没有缴费记录则点击申请缴费</p><p style="text-align: center; white-space: normal;"><img width="350" height="122" title="1503893389241078.png" alt="1503893389241078.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893389241078.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">6)&nbsp;&nbsp;&nbsp; 点击同意</p><p style="text-align: center; white-space: normal;"><img width="350" height="256" title="1503893396515147.png" alt="1503893396515147.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893396515147.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">7)&nbsp;&nbsp;&nbsp; 先选择科目考试，然后选择考试科目，比如科目一科目二，然后提交订单</p><p style="text-align: center; white-space: normal;"><img width="350" height="258" title="1503893404963275.png" alt="1503893404963275.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893404963275.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">8)&nbsp;&nbsp;&nbsp; 核对信息无误之后点击确认并缴费</p><p style="text-align: center; white-space: normal;"><img width="350" height="257" title="1503893412539437.png" alt="1503893412539437.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893412539437.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">9)&nbsp;&nbsp;&nbsp; 输入网银所绑定的手机号码并填写手机验证码</p><p style="text-align: center; white-space: normal;"><img width="350" height="227" title="1503893419839356.png" alt="1503893419839356.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893419839356.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">10)&nbsp;&nbsp;&nbsp;&nbsp; 核对无误之后点击下一步</p><p style="text-align: center; white-space: normal;"><img width="350" height="172" title="1503893426695615.png" alt="1503893426695615.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893426695615.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">11)&nbsp;&nbsp;&nbsp;&nbsp; 点击去付款</p><p style="white-space: normal;">&nbsp;</p><p style="text-align: center; white-space: normal;"><img width="350" height="232" title="1503893431279173.png" alt="1503893431279173.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893431279173.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">12)&nbsp;&nbsp;&nbsp;&nbsp; 输入银行卡号之后点击下一步</p><p style="text-align: center; white-space: normal;"><img width="350" height="226" title="1503893436913596.png" alt="1503893436913596.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893436913596.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">13)&nbsp;&nbsp;&nbsp;&nbsp; 完善信息之后点击付款</p><p style="text-align: center; white-space: normal;"><img width="350" height="223" title="1503893440580978.png" alt="1503893440580978.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893440580978.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">14)&nbsp;&nbsp;&nbsp;&nbsp; 缴费完毕，点击返回商户可检查缴费信息</p><p style="text-align: center; white-space: normal;"><img width="350" height="237" title="1503893447805722.png" alt="1503893447805722.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893447805722.png"/></p><p style="white-space: normal;"><br/></p><p style="white-space: normal;">15)&nbsp;&nbsp;&nbsp;&nbsp; 付款成功回执信息</p><p style="text-align: center; white-space: normal;"><img width="350" height="166" title="1503893457415224.png" alt="1503893457415224.png" src="http://ydxctrue.yidianxueche.cn/ueditor/php/upload/image/20170828/1503893457415224.png"/></p><p><br/></p>', 1543908883, 1543908883, 6, 0),
(92, 1, '学员风采', 4, 0, '<p>学员风采</p>', 1543908883, 1543908883, 6, 12),
(93, 1, '学车流程1', 4, 0, '<p>学车流程09</p>', 1543908883, 1543908883, 6, 13),
(94, 1, '优势服务', 4, 0, '<p>优势服务90</p>', 1543908883, 1543908883, 6, 14),
(95, 1, '学车保障', 4, 0, '<p>学车保障789</p>', 1543908883, 1543908883, 6, 15),
(96, 1, '常见问题', 4, 0, '<p>常见问题456</p>', 1543908883, 1543908883, 6, 16),
(97, 1, '报名即可参加万人电音节', 4, 202, '<p>最新活动11</p>', 1543908883, 1543908883, 6, 2);

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
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '用户状态',
  `department_id` int(11) NOT NULL COMMENT '团队ID',
  `code` varchar(50) DEFAULT NULL COMMENT '推荐码',
  `number` int(11) DEFAULT NULL COMMENT '招生人数'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='人员信息表';

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
) ENGINE=MyISAM AUTO_INCREMENT=336 DEFAULT CHARSET=utf8;

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
(178, '/uploads/picture/20181121/8d90419a9a25090930f2b0f541a6f06a.jpg', '/uploads/picture/20181121/8d90419a9a25090930f2b0f541a6f06a.jpg', '65bf7fe22e719d6e7e42b1d054188560', '28916f42a27de37e3888900773d86a3b4d7aa1b8', 1, 1542732246),
(179, '/uploads/picture/20181130/e179658891014d488ab5dfbc8e91ad04.jpg', '/uploads/picture/20181130/e179658891014d488ab5dfbc8e91ad04.jpg', '082e5dacdf065e5fb2f517ad4c4431e7', '8ce3a17e3c642ed948cae99260ad373c0f91d75c', 1, 1543564786),
(180, '/uploads/picture/20181130/f62cc87d722bb5773fcc9b51b5864e5a.jpg', '/uploads/picture/20181130/f62cc87d722bb5773fcc9b51b5864e5a.jpg', 'defece68d4f069af9c14b2500839df18', '4df4b8cc47b9c5c4b2094da4717b7d56727288a6', 1, 1543564824),
(181, '/uploads/picture/20181130/504d639abeab7371c19bd3740ad25914.jpg', '/uploads/picture/20181130/504d639abeab7371c19bd3740ad25914.jpg', 'ea98e490f5402eba68d2e21563cef50d', '8a912f62811a39ff963c54eb28b8d6e887ee786d', 1, 1543564842),
(182, '/uploads/picture/20181130/13553778909467dac66dfced9d6ea268.jpg', '/uploads/picture/20181130/13553778909467dac66dfced9d6ea268.jpg', 'defece68d4f069af9c14b2500839df18', '4df4b8cc47b9c5c4b2094da4717b7d56727288a6', 1, 1543565702),
(183, '/uploads/picture/20181130/1bdfa6f9ccafe0cb97d884adc61800ec.jpg', '/uploads/picture/20181130/1bdfa6f9ccafe0cb97d884adc61800ec.jpg', 'defece68d4f069af9c14b2500839df18', '4df4b8cc47b9c5c4b2094da4717b7d56727288a6', 1, 1543565726),
(184, '/uploads/picture/20181130/e368dac54b7ac0a37e1cfacf2b7babed.jpg', '/uploads/picture/20181130/e368dac54b7ac0a37e1cfacf2b7babed.jpg', '082e5dacdf065e5fb2f517ad4c4431e7', '8ce3a17e3c642ed948cae99260ad373c0f91d75c', 1, 1543565985),
(185, '/uploads/picture/20181130/8d6370ae3e0fc9fa301d46f70826cd51.jpg', '/uploads/picture/20181130/8d6370ae3e0fc9fa301d46f70826cd51.jpg', 'defece68d4f069af9c14b2500839df18', '4df4b8cc47b9c5c4b2094da4717b7d56727288a6', 1, 1543566081),
(186, '/uploads/picture/20181130/198e406fdd16257e0e3c5e1a6991218c.jpg', '/uploads/picture/20181130/198e406fdd16257e0e3c5e1a6991218c.jpg', 'ea98e490f5402eba68d2e21563cef50d', '8a912f62811a39ff963c54eb28b8d6e887ee786d', 1, 1543566390),
(187, '/uploads/picture/20181130/9747e3de1fc974d9b1d6eda732ec5ea0.jpg', '/uploads/picture/20181130/9747e3de1fc974d9b1d6eda732ec5ea0.jpg', 'ea98e490f5402eba68d2e21563cef50d', '8a912f62811a39ff963c54eb28b8d6e887ee786d', 1, 1543566725),
(188, '/uploads/picture/20181130/3324a01087c09362b5694b8c5f375fd5.jpg', '/uploads/picture/20181130/3324a01087c09362b5694b8c5f375fd5.jpg', 'ea98e490f5402eba68d2e21563cef50d', '8a912f62811a39ff963c54eb28b8d6e887ee786d', 1, 1543566795),
(189, '/uploads/picture/20181130/8c1f1d4f945ae60564388d0dead8743d.jpg', '/uploads/picture/20181130/8c1f1d4f945ae60564388d0dead8743d.jpg', '082e5dacdf065e5fb2f517ad4c4431e7', '8ce3a17e3c642ed948cae99260ad373c0f91d75c', 1, 1543566805),
(190, '/uploads/picture/20181130/93f619abcce0192ea77f80cb896194eb.jpg', '/uploads/picture/20181130/93f619abcce0192ea77f80cb896194eb.jpg', '082e5dacdf065e5fb2f517ad4c4431e7', '8ce3a17e3c642ed948cae99260ad373c0f91d75c', 1, 1543566903),
(191, '/uploads/picture/20181130/fc9244e083ba0f89323509342d19f8eb.jpg', '/uploads/picture/20181130/fc9244e083ba0f89323509342d19f8eb.jpg', 'ea98e490f5402eba68d2e21563cef50d', '8a912f62811a39ff963c54eb28b8d6e887ee786d', 1, 1543566939),
(192, '/uploads/picture/20181130/f6dff5b170ae500ffbf99235584d16b5.jpg', '/uploads/picture/20181130/f6dff5b170ae500ffbf99235584d16b5.jpg', '082e5dacdf065e5fb2f517ad4c4431e7', '8ce3a17e3c642ed948cae99260ad373c0f91d75c', 1, 1543566997),
(193, '/uploads/picture/20181130/6f536dbed60757ddbd0c581d80e3e864.jpg', '/uploads/picture/20181130/6f536dbed60757ddbd0c581d80e3e864.jpg', '082e5dacdf065e5fb2f517ad4c4431e7', '8ce3a17e3c642ed948cae99260ad373c0f91d75c', 1, 1543567013),
(194, '/uploads/picture/20181130/ca294868daae925d7b5c50eec1cdaa10.jpg', '/uploads/picture/20181130/ca294868daae925d7b5c50eec1cdaa10.jpg', 'defece68d4f069af9c14b2500839df18', '4df4b8cc47b9c5c4b2094da4717b7d56727288a6', 1, 1543567113),
(195, '/uploads/picture/20181130/5b59800ba9a5b5cf7dfc2d5b2f6b567a.jpg', '/uploads/picture/20181130/5b59800ba9a5b5cf7dfc2d5b2f6b567a.jpg', '082e5dacdf065e5fb2f517ad4c4431e7', '8ce3a17e3c642ed948cae99260ad373c0f91d75c', 1, 1543567126),
(196, '/uploads/picture/20181130/288ee394db4777c62427acfc1be7d22c.jpg', '/uploads/picture/20181130/288ee394db4777c62427acfc1be7d22c.jpg', '082e5dacdf065e5fb2f517ad4c4431e7', '8ce3a17e3c642ed948cae99260ad373c0f91d75c', 1, 1543567187),
(197, '/uploads/picture/20181130/7941a79e826f02e6c20d7fb31f6c9a5c.jpg', '/uploads/picture/20181130/7941a79e826f02e6c20d7fb31f6c9a5c.jpg', 'ea98e490f5402eba68d2e21563cef50d', '8a912f62811a39ff963c54eb28b8d6e887ee786d', 1, 1543567292),
(198, '/uploads/picture/20181130/346a40f67f762548eca51f6393a5466e.jpg', '/uploads/picture/20181130/346a40f67f762548eca51f6393a5466e.jpg', '082e5dacdf065e5fb2f517ad4c4431e7', '8ce3a17e3c642ed948cae99260ad373c0f91d75c', 1, 1543567301),
(199, '/uploads/picture/20181130/c4411a3fd4ea0afd1598d9b5cac3ca32.jpg', '/uploads/picture/20181130/c4411a3fd4ea0afd1598d9b5cac3ca32.jpg', '082e5dacdf065e5fb2f517ad4c4431e7', '8ce3a17e3c642ed948cae99260ad373c0f91d75c', 1, 1543567832),
(200, '/uploads/picture/20181130/ed84d7374f670a0422dbf2e11aca7a4f.jpg', '/uploads/picture/20181130/ed84d7374f670a0422dbf2e11aca7a4f.jpg', '082e5dacdf065e5fb2f517ad4c4431e7', '8ce3a17e3c642ed948cae99260ad373c0f91d75c', 1, 1543568089),
(201, '/uploads/picture/20181202/62d3bc56c64ba5ca7c316889b54d621f.jpg', '/uploads/picture/20181202/62d3bc56c64ba5ca7c316889b54d621f.jpg', '8e2469bff262170d6ad72b06a57b66a9', 'daffb5afbf2c5a2083e084854718ee784e8d1af7', 1, 1543733810),
(202, '/uploads/picture/20181202/2391158bcac403d2a560a89fa5d1880f.jpg', '/uploads/picture/20181202/2391158bcac403d2a560a89fa5d1880f.jpg', '8729d977069ff045da3133cb77116b1b', 'a381dfc5823147fe3dfb6184b6d5e069736bf11a', 1, 1543733865),
(203, '/uploads/picture/20181202/8baaa5fd035e294fdc905994913bf3db.jpg', '/uploads/picture/20181202/8baaa5fd035e294fdc905994913bf3db.jpg', '3325628bc2fbfcb60c15ca89d959bc45', '5f4e1d2662d9d6e4b557b6be65c03be77cf75c50', 1, 1543734221),
(204, '/uploads/picture/20181202/82851421a2f4ca671cc1a15c0cb10475.jpg', '/uploads/picture/20181202/82851421a2f4ca671cc1a15c0cb10475.jpg', '8729d977069ff045da3133cb77116b1b', 'a381dfc5823147fe3dfb6184b6d5e069736bf11a', 1, 1543734287),
(205, '/uploads/picture/20181202/01a05b31612f439e6004bb962f61f200.jpg', '/uploads/picture/20181202/01a05b31612f439e6004bb962f61f200.jpg', '8e2469bff262170d6ad72b06a57b66a9', 'daffb5afbf2c5a2083e084854718ee784e8d1af7', 1, 1543734470),
(206, '/uploads/picture/20181202/43019581e6a1b63ab407a34d12d94892.jpg', '/uploads/picture/20181202/43019581e6a1b63ab407a34d12d94892.jpg', '817b432a8a093286a5cd0fbbb51a8032', '2498ead43f36561d59d1abe5c47a45d9e6204a88', 1, 1543734561),
(207, '/uploads/picture/20181205/b1378d213a3127523adcd3c6452daf0c.jpg', '/uploads/picture/20181205/b1378d213a3127523adcd3c6452daf0c.jpg', '685ec7621f8df3c818fa5bf171ddb292', '0a8c1d3ca4170b761288a855c2db39f5889d7b3c', 1, 1543995083),
(208, '/uploads/picture/20181205/a9f68bff6f926b7e77c77c40a635dc34.jpg', '/uploads/picture/20181205/a9f68bff6f926b7e77c77c40a635dc34.jpg', '65bf7fe22e719d6e7e42b1d054188560', '28916f42a27de37e3888900773d86a3b4d7aa1b8', 1, 1543995138),
(209, '/uploads/picture/20181205/671cacf3be0d76543e7bd3e2ccbb3eb8.jpg', '/uploads/picture/20181205/671cacf3be0d76543e7bd3e2ccbb3eb8.jpg', '01e93d52a19d1f53a77ec0f3f799723d', '058a2f74123447011a3be7e373c81c40f5f4821b', 1, 1543995174),
(210, '/uploads/picture/20181205/a1bad95b7a398764ef321f079c504214.jpg', '/uploads/picture/20181205/a1bad95b7a398764ef321f079c504214.jpg', '7fdd77643e3f41de4f4f251b03947fc0', '6902b2544c7ab9278725235fae02005c9e3d9342', 1, 1543995188),
(211, '/uploads/picture/20181205/7cbb9eb6de6f129dbccc9c791bf2c41f.jpg', '/uploads/picture/20181205/7cbb9eb6de6f129dbccc9c791bf2c41f.jpg', '685ec7621f8df3c818fa5bf171ddb292', '0a8c1d3ca4170b761288a855c2db39f5889d7b3c', 1, 1543995189),
(212, '/uploads/picture/20181205/a6ebd25fd5df6163c5a44a24dae0f976.jpg', '/uploads/picture/20181205/a6ebd25fd5df6163c5a44a24dae0f976.jpg', 'a81860fd8ed905d7d1b143776ee8af5e', '1c8e143bcade16437e95bd0897489c7d528ecdb9', 1, 1543995242),
(213, '/uploads/picture/20181205/b514a31fc4e2252fd1f3a9131e0c6a6b.jpg', '/uploads/picture/20181205/b514a31fc4e2252fd1f3a9131e0c6a6b.jpg', '5e7679202693e91550eacbb4de1a8e22', 'b0a209631bcefe20fecf8d9d0debf1ebe5147b08', 1, 1543995256),
(214, '/uploads/picture/20181205/a94d73dd017253bdc20993ad0fc0f99d.jpg', '/uploads/picture/20181205/a94d73dd017253bdc20993ad0fc0f99d.jpg', 'a81860fd8ed905d7d1b143776ee8af5e', '1c8e143bcade16437e95bd0897489c7d528ecdb9', 1, 1543995395),
(215, '/uploads/picture/20181205/807d7580aa7236de0ab1ccfe26c12a7b.jpg', '/uploads/picture/20181205/807d7580aa7236de0ab1ccfe26c12a7b.jpg', '5e7679202693e91550eacbb4de1a8e22', 'b0a209631bcefe20fecf8d9d0debf1ebe5147b08', 1, 1543995413);
INSERT INTO `sent_picture` (`id`, `path`, `url`, `md5`, `sha1`, `status`, `create_time`) VALUES
(216, '/uploads/picture/20181205/3848a45b33983231db0e1573a2c2ea6d.jpg', '/uploads/picture/20181205/3848a45b33983231db0e1573a2c2ea6d.jpg', '3dac73545dc400c9a580720a83820a76', 'd8d8a84aa7d6c8145254360c39db0213154c874b', 1, 1543996755),
(217, '/uploads/picture/20181205/9eb0a699f1b9a82b06f35d5037ca64e3.jpg', '/uploads/picture/20181205/9eb0a699f1b9a82b06f35d5037ca64e3.jpg', '4ed657877a8be771cd6b17a8c41a5742', '3b39d133f35e92f66f46511110c3755d00dda295', 1, 1543996786),
(218, '/uploads/picture/20181205/47a2d157b4ef388aa8479d07479e2253.jpg', '/uploads/picture/20181205/47a2d157b4ef388aa8479d07479e2253.jpg', '263c7069017757e3ab85728cd1dc8497', '85820aefa5117f4cb25a2b13dbad0cca20bb35e7', 1, 1543996891),
(219, '/uploads/picture/20181205/4a6e9752285db7a709c74f3a31f0e5b5.jpg', '/uploads/picture/20181205/4a6e9752285db7a709c74f3a31f0e5b5.jpg', '566d4cd9156aea0fc5e513fef4f17a3c', 'de7593f6ff17b835937026f0c0c0c59c02dc8bdc', 1, 1543996978),
(220, '/uploads/picture/20181205/33d8a52ccbe162169e93ea7f6fd02d2b.jpg', '/uploads/picture/20181205/33d8a52ccbe162169e93ea7f6fd02d2b.jpg', '6ebae41b6d5058480f925538e8904859', 'd7b1f73df64ba1dee0d0166b32c8f6bb1c98deaf', 1, 1543996992),
(221, '/uploads/picture/20181205/5fcdfe596dd5b04ec9e4d2533c5d55b6.jpg', '/uploads/picture/20181205/5fcdfe596dd5b04ec9e4d2533c5d55b6.jpg', '222cb0b3e087e24846cb58a11cca7780', 'a7f3b9120f3057d83f823726bd0680df4a515171', 1, 1543997058),
(222, '/uploads/picture/20181205/8967c18a41fa862118d4ceae7915ddac.jpg', '/uploads/picture/20181205/8967c18a41fa862118d4ceae7915ddac.jpg', 'b8d63d9c6b8898cc0e68f42db7862b9f', '6b819ac4c73db22e6293d05e5a826345fdfe07c0', 1, 1543997120),
(223, '/uploads/picture/20181205/07bbef1242fc085777d59a8815c709ff.jpg', '/uploads/picture/20181205/07bbef1242fc085777d59a8815c709ff.jpg', '3314b96711d8c598b9cbe58b315ef2a1', '4a5220b138cf102af0ec2b02507cdf293ef5678f', 1, 1543997194),
(224, '/uploads/picture/20181206/e5cce77f74cf4654e07cad3647045a0e.jpg', '/uploads/picture/20181206/e5cce77f74cf4654e07cad3647045a0e.jpg', 'ed9b07be267be5fe75b01e6a1756ebf1', 'a251701d5dc8c8e3be8cbf53891fdf922e4d6773', 1, 1544064755),
(225, '/uploads/picture/20181206/e2ac13286c692eff720392fb7f2ebae2.jpg', '/uploads/picture/20181206/e2ac13286c692eff720392fb7f2ebae2.jpg', '41800e48e27e0313efe417b5d9771d76', '5b6a2d689208d901a6853a96cb9c02c8c3d7b582', 1, 1544064774),
(226, '/uploads/picture/20181206/89199138a018d56b5e0dd21a7347a391.jpg', '/uploads/picture/20181206/89199138a018d56b5e0dd21a7347a391.jpg', '8a09cdfbef68a765c7c26b137e874079', 'b8f31f1681a09cdab5e8546f273e68f3e89d9d8d', 1, 1544064900),
(227, '/uploads/picture/20181206/b2e54e8d680a395c21153c6d6663ef34.jpg', '/uploads/picture/20181206/b2e54e8d680a395c21153c6d6663ef34.jpg', '41800e48e27e0313efe417b5d9771d76', '5b6a2d689208d901a6853a96cb9c02c8c3d7b582', 1, 1544065320),
(228, '/uploads/picture/20181206/51bb72ae28bca05f979db471e10c9fd5.jpg', '/uploads/picture/20181206/51bb72ae28bca05f979db471e10c9fd5.jpg', 'e7ec29215466c75ace187a069c674724', '9fcb5d84a0993dd857e1f16917fccc385e00ea84', 1, 1544079944),
(229, '/uploads/picture/20181206/f7412c9f88f160b5f31fb02ad71166e8.jpg', '/uploads/picture/20181206/f7412c9f88f160b5f31fb02ad71166e8.jpg', 'b10989c48950e9d0175ba4d8300f4dbc', '40a634082e88306d56ea88589ab9a846f6ccf37b', 1, 1544080300),
(230, '/uploads/picture/20181206/e75fe177a850df99e5b2e7ad4901c6d7.jpg', '/uploads/picture/20181206/e75fe177a850df99e5b2e7ad4901c6d7.jpg', 'd8e34d99f10b4c16133fea1c53661991', '13d85281c92f8f9921bde66f218685d14b0b1275', 1, 1544080321),
(231, '/uploads/picture/20181206/87f3d18523d8aa2174baa6429886ec46.jpg', '/uploads/picture/20181206/87f3d18523d8aa2174baa6429886ec46.jpg', '53a21172c5a0d484a7909c111b140538', 'ccfa11486d7cb0e81e32fc9084e302cb63396fc4', 1, 1544080359),
(232, '/uploads/picture/20181206/a2b5bbde2b4c90080ba0e83fdcbdf662.jpg', '/uploads/picture/20181206/a2b5bbde2b4c90080ba0e83fdcbdf662.jpg', '5616089808bfb4dd192f70ef5ccb6c79', 'd3760ca41c8969c9bb859509d24d77de708a6fb8', 1, 1544080398),
(233, '/uploads/picture/20181210/0f7cd53b58c33b2631695c65f0960c15.jpg', '/uploads/picture/20181210/0f7cd53b58c33b2631695c65f0960c15.jpg', 'd0ba73b5801c66d05b1e4d8baa95a368', 'af854b11156ef00b0feeb7582a50f85ad6a77295', 1, 1544430628),
(234, '/uploads/picture/20181210/e373766c361b08e1360996d9cf37471b.jpg', '/uploads/picture/20181210/e373766c361b08e1360996d9cf37471b.jpg', '91357757269ed8aec6ee219a4b0ae50f', 'ae9f790a108d3a9996f1b04975f795b49d2d139a', 1, 1544430779),
(235, '/uploads/picture/20181210/7e640427b9a553dd14cbbc742985a767.jpg', '/uploads/picture/20181210/7e640427b9a553dd14cbbc742985a767.jpg', '91357757269ed8aec6ee219a4b0ae50f', 'ae9f790a108d3a9996f1b04975f795b49d2d139a', 1, 1544431402),
(236, '/uploads/picture/20181210/522a2e4d2a9ad43b834c0d6b073b4dec.jpg', '/uploads/picture/20181210/522a2e4d2a9ad43b834c0d6b073b4dec.jpg', '01e93d52a19d1f53a77ec0f3f799723d', '058a2f74123447011a3be7e373c81c40f5f4821b', 1, 1544433273),
(237, '/uploads/picture/20181210/f6b88ba9098b56702045e62e9072e3b5.jpg', '/uploads/picture/20181210/f6b88ba9098b56702045e62e9072e3b5.jpg', '7fdd77643e3f41de4f4f251b03947fc0', '6902b2544c7ab9278725235fae02005c9e3d9342', 1, 1544433285),
(238, '/uploads/picture/20181210/b36f74737d2056388aa8125916141a6f.jpg', '/uploads/picture/20181210/b36f74737d2056388aa8125916141a6f.jpg', 'a81860fd8ed905d7d1b143776ee8af5e', '1c8e143bcade16437e95bd0897489c7d528ecdb9', 1, 1544433296),
(239, '/uploads/picture/20181210/2cb94b47ead7c1bac7cab6cd18e4aac2.jpg', '/uploads/picture/20181210/2cb94b47ead7c1bac7cab6cd18e4aac2.jpg', '5e7679202693e91550eacbb4de1a8e22', 'b0a209631bcefe20fecf8d9d0debf1ebe5147b08', 1, 1544433305),
(240, '/uploads/picture/20181210/d95fa89695ae9d9c730df0dfc70d94b9.jpg', '/uploads/picture/20181210/d95fa89695ae9d9c730df0dfc70d94b9.jpg', 'ba5fef114c1c3ef1879274f6652d021f', 'd0da913956a66baf2e6cf91160f5587b7885d3e4', 1, 1544433314),
(241, '/uploads/picture/20181210/ec3dc2c8b1bc242a28e1bc9a3d92dc89.JPG', '/uploads/picture/20181210/ec3dc2c8b1bc242a28e1bc9a3d92dc89.JPG', 'e9b9553093484fab7eedd9b8768926aa', '63ff1eebb05a9656abaf87cc491c5505454456f8', 1, 1544433596),
(242, '/uploads/picture/20181210/4dea0042ebafcb087df8edf6b2e7b940.JPG', '/uploads/picture/20181210/4dea0042ebafcb087df8edf6b2e7b940.JPG', '7f670a2ab32c55aac576a2c87b558dc7', 'de43c07fd52d907617f339151c271e8f55733afd', 1, 1544434095),
(243, '/uploads/picture/20181210/28be6215f7f518f917bceedacf4b5e74.JPG', '/uploads/picture/20181210/28be6215f7f518f917bceedacf4b5e74.JPG', '7357552dad9443ef7efe6638c261dd1b', 'da88b591a3559157895194cc874753fe837ca77c', 1, 1544434123),
(244, '/uploads/picture/20181210/7af0917d968bc61717f82e0c501fe1b9.jpg', '/uploads/picture/20181210/7af0917d968bc61717f82e0c501fe1b9.jpg', 'c590153dcd799782e14d9f4d9f83d6a6', '38407c7f7268641b089b7b58d66ffd9e5be7cea5', 1, 1544436441),
(245, '/uploads/picture/20181210/f72b799a4941f6d63c77245d8c97b75b.jpg', '/uploads/picture/20181210/f72b799a4941f6d63c77245d8c97b75b.jpg', '38490b7f67e410d6a695b4a421609934', '2e1218034a0704bec2179cdda19f7b2a29e5a17d', 1, 1544436472),
(246, '/uploads/picture/20181210/58bf394708d278dfa50438bf4518b523.jpg', '/uploads/picture/20181210/58bf394708d278dfa50438bf4518b523.jpg', 'b3ab68d0c0f979e953e4bd33c9d528ea', '5372eb4ad7df2aa46127960797330e62bf8b783b', 1, 1544436482),
(247, '/uploads/picture/20181210/d55b25316a24ab62a8c098d229e7db79.jpg', '/uploads/picture/20181210/d55b25316a24ab62a8c098d229e7db79.jpg', '75a7e0efabc2643e7f547af2de260895', '418bbe2ec19bfab69810bf3f3d602b89cc91a2d0', 1, 1544436492),
(248, '/uploads/picture/20181210/4eebd8a895c880fbc5732e1b80843c4e.jpg', '/uploads/picture/20181210/4eebd8a895c880fbc5732e1b80843c4e.jpg', 'a10534da6bbbc43190283bb81926cf38', '5ecaa15584903fb4da089d81d0b9712435a9a357', 1, 1544436503),
(249, '/uploads/picture/20181213/361103be65c2489c018b8fc89c929c49.JPG', '/uploads/picture/20181213/361103be65c2489c018b8fc89c929c49.JPG', '163aab313b60b0671db754fd29a68317', '827846b8b204c3879bf5d559c55edf99bee029f6', 1, 1544669803),
(250, '/uploads/picture/20181213/8ab02cc0a2d91d51cbb9671b13db27b0.jpg', '/uploads/picture/20181213/8ab02cc0a2d91d51cbb9671b13db27b0.jpg', '80e19a9d774e621782cc70fbbc52505e', '420efb1479fc23eacc862eaa91efa266e387e7b4', 1, 1544669808),
(251, '/uploads/picture/20181213/413b22c0ecd9c059f4cce7f9e67adedc.jpg', '/uploads/picture/20181213/413b22c0ecd9c059f4cce7f9e67adedc.jpg', '8fa2b02afeb58994db4593618acddbed', '6404d60fbd723e3445b91d61deea0e6a328546fc', 1, 1544670179),
(252, '/uploads/picture/20181213/3881da5e208d135501f303697ad49743.jpg', '/uploads/picture/20181213/3881da5e208d135501f303697ad49743.jpg', 'adcc5e33ffe5194c22ba6f3ebdacb95c', '052c9f1cfbbcd12ee7d660c726c6ae182bcaea10', 1, 1544670195),
(253, '/uploads/picture/20181213/ca925649a657656904a7cba1f0431ac4.jpg', '/uploads/picture/20181213/ca925649a657656904a7cba1f0431ac4.jpg', '4bae67f7572b0b0c3e070c27747aea9f', 'c656c1a0f88ca62494f66bce04955841b7dc4986', 1, 1544670199),
(254, '/uploads/picture/20181213/2fee8fb65573cc8b031e7f6b6d5efbe1.jpg', '/uploads/picture/20181213/2fee8fb65573cc8b031e7f6b6d5efbe1.jpg', '02c07ddbc8b19ece4121b64678accc4a', '314a67699defc7b5e6decdacfb18b6f5bf102f7b', 1, 1544670204),
(255, '/uploads/picture/20181213/9073bc7e546f52a0321e573edae613f5.jpg', '/uploads/picture/20181213/9073bc7e546f52a0321e573edae613f5.jpg', 'b18b60cc38d9f264ac3fa7f184e29553', '9ef0ed3ef3645a7e00e5a623f5c128c0d7fe148c', 1, 1544670207),
(256, '/uploads/picture/20181213/50cf4c615479038b10eae665597f0fdc.jpg', '/uploads/picture/20181213/50cf4c615479038b10eae665597f0fdc.jpg', '4bae67f7572b0b0c3e070c27747aea9f', 'c656c1a0f88ca62494f66bce04955841b7dc4986', 1, 1544670210),
(257, '/uploads/picture/20181213/987a8ce55dde50e90b885f735f66d76d.jpg', '/uploads/picture/20181213/987a8ce55dde50e90b885f735f66d76d.jpg', '1d49d9959ef19a9d8e349238a55915ce', '03f11b2381f163f7d02b0863109c2dcbc31bb8bf', 1, 1544670217),
(258, '/uploads/picture/20181213/a8b4425e811f38c65ea87238bbd8d6cf.jpg', '/uploads/picture/20181213/a8b4425e811f38c65ea87238bbd8d6cf.jpg', 'bcaf2115fd01c8d2cf437579b1240e37', '7c85afbd6c693e553a2cd77fbf70487acf52d8aa', 1, 1544672179),
(259, '/uploads/picture/20181213/dd9f4afd282c246e6e3c419c36a9c7e0.jpg', '/uploads/picture/20181213/dd9f4afd282c246e6e3c419c36a9c7e0.jpg', 'f84ea4efd2ad9631c9d33001b9cf8323', '68f1e0774a2b556ad6c6603ab6be3104c3499558', 1, 1544672187),
(260, '/uploads/picture/20181213/0208d2739756099817660df0003a6ff4.jpg', '/uploads/picture/20181213/0208d2739756099817660df0003a6ff4.jpg', 'dba1d975acb89075f25c8e15b14a458a', '9de8ffce8f9a425a1a48f74c2b0216cf07457899', 1, 1544672208),
(261, '/uploads/picture/20181213/fb1827ac17a8cc9ec8b533a856091299.jpg', '/uploads/picture/20181213/fb1827ac17a8cc9ec8b533a856091299.jpg', 'dba1d975acb89075f25c8e15b14a458a', '9de8ffce8f9a425a1a48f74c2b0216cf07457899', 1, 1544672388),
(262, '/uploads/picture/20181213/376d4f2329d6c66a9dc015645faebd31.jpg', '/uploads/picture/20181213/376d4f2329d6c66a9dc015645faebd31.jpg', 'dba1d975acb89075f25c8e15b14a458a', '9de8ffce8f9a425a1a48f74c2b0216cf07457899', 1, 1544672562),
(263, '/uploads/picture/20181213/1269aa8756ed5d585889866dad0af6cf.jpg', '/uploads/picture/20181213/1269aa8756ed5d585889866dad0af6cf.jpg', 'f84ea4efd2ad9631c9d33001b9cf8323', '68f1e0774a2b556ad6c6603ab6be3104c3499558', 1, 1544672746),
(264, '/uploads/picture/20181213/6c83ffa6d665276b97fd4130d44f1d50.jpg', '/uploads/picture/20181213/6c83ffa6d665276b97fd4130d44f1d50.jpg', '715af5624ec05bd51d820dee6404bf08', 'a6df38f5a32d7b35351fde0fca6369468ebebdc4', 1, 1544673447),
(265, '/uploads/picture/20181213/4330dc06ee6fcb5666f00517295f2f98.jpg', '/uploads/picture/20181213/4330dc06ee6fcb5666f00517295f2f98.jpg', '715af5624ec05bd51d820dee6404bf08', 'a6df38f5a32d7b35351fde0fca6369468ebebdc4', 1, 1544673550),
(266, '/uploads/picture/20181213/3f92f0aeb0bca954ddceb47b905240b5.jpg', '/uploads/picture/20181213/3f92f0aeb0bca954ddceb47b905240b5.jpg', '3960613046297a463e3433d9ab926e67', '092f9d68d160da604539d121fa53c22d0f75bd10', 1, 1544673632),
(267, '/uploads/picture/20181213/6168b7e2bbc1247cab16b5b941f17741.jpg', '/uploads/picture/20181213/6168b7e2bbc1247cab16b5b941f17741.jpg', 'f8f2d26fb6d8a5d7d861cc4535e01a1e', '87793268aa3fdabc72b5bcbbe05caf442b6bf810', 1, 1544673652),
(268, '/uploads/picture/20181213/f2886c10b80084a820391be47464479b.jpg', '/uploads/picture/20181213/f2886c10b80084a820391be47464479b.jpg', '715af5624ec05bd51d820dee6404bf08', 'a6df38f5a32d7b35351fde0fca6369468ebebdc4', 1, 1544673743),
(269, '/uploads/picture/20181213/1786fcf1af6a41cd86e578117f7c21f9.jpg', '/uploads/picture/20181213/1786fcf1af6a41cd86e578117f7c21f9.jpg', 'd0dcdff8e9d5f12818275a68d684bc39', '5bca2d7ceaea46b7f69304804cb82ff4b52e5978', 1, 1544673744),
(270, '/uploads/picture/20181213/d70f2cd75e14cdd71aa8b8556c811e11.jpg', '/uploads/picture/20181213/d70f2cd75e14cdd71aa8b8556c811e11.jpg', 'ed0da83219d601e1d7f0ed153490193c', '6a6e2bdfdab7e88a25b073c9427ab80da892a5be', 1, 1544673748),
(271, '/uploads/picture/20181213/5e33b02d2faba6d1001049ee8c3780f9.jpg', '/uploads/picture/20181213/5e33b02d2faba6d1001049ee8c3780f9.jpg', 'afcfe8cab2026e8d0d2f4a46913f01ba', 'fbb882020047ef1f3ca63b5355092ffbdaff267d', 1, 1544673777),
(272, '/uploads/picture/20181213/ec46249e099b7e88f2b91a67d57227b1.jpg', '/uploads/picture/20181213/ec46249e099b7e88f2b91a67d57227b1.jpg', '998358b12018cd9317510092626e6dab', '8a688b692909a6c9bff04030da21b130fc4c0b93', 1, 1544673786),
(273, '/uploads/picture/20181213/91832fe3c7c602d5bcb02ff5b93b4a7f.jpg', '/uploads/picture/20181213/91832fe3c7c602d5bcb02ff5b93b4a7f.jpg', 'bcaf2115fd01c8d2cf437579b1240e37', '7c85afbd6c693e553a2cd77fbf70487acf52d8aa', 1, 1544673971),
(274, '/uploads/picture/20181213/4b5ad73434e22025c09faa3b0320e44b.jpg', '/uploads/picture/20181213/4b5ad73434e22025c09faa3b0320e44b.jpg', 'bcaf2115fd01c8d2cf437579b1240e37', '7c85afbd6c693e553a2cd77fbf70487acf52d8aa', 1, 1544674024),
(275, '/uploads/picture/20181213/da99095e25eb3de4cc67480d0671cb30.jpg', '/uploads/picture/20181213/da99095e25eb3de4cc67480d0671cb30.jpg', 'bcaf2115fd01c8d2cf437579b1240e37', '7c85afbd6c693e553a2cd77fbf70487acf52d8aa', 1, 1544674136),
(276, '/uploads/picture/20181213/d89618f26aec052acdc94f73f81ed832.jpg', '/uploads/picture/20181213/d89618f26aec052acdc94f73f81ed832.jpg', 'bcaf2115fd01c8d2cf437579b1240e37', '7c85afbd6c693e553a2cd77fbf70487acf52d8aa', 1, 1544674150),
(277, '/uploads/picture/20181213/0638f66cf7ec6a128f22f788ae2da83c.jpg', '/uploads/picture/20181213/0638f66cf7ec6a128f22f788ae2da83c.jpg', 'd0dcdff8e9d5f12818275a68d684bc39', '5bca2d7ceaea46b7f69304804cb82ff4b52e5978', 1, 1544674171),
(278, '/uploads/picture/20181213/5c0f5dc8b8ea972f7ed3059e8782dc77.jpg', '/uploads/picture/20181213/5c0f5dc8b8ea972f7ed3059e8782dc77.jpg', 'f84ea4efd2ad9631c9d33001b9cf8323', '68f1e0774a2b556ad6c6603ab6be3104c3499558', 1, 1544674296),
(279, '/uploads/picture/20181213/a79089a0979c1e475115e2305fa969a3.jpg', '/uploads/picture/20181213/a79089a0979c1e475115e2305fa969a3.jpg', 'd0dcdff8e9d5f12818275a68d684bc39', '5bca2d7ceaea46b7f69304804cb82ff4b52e5978', 1, 1544680779),
(280, '/uploads/picture/20181213/b98b07018eba36aed522939ee1f908dc.jpg', '/uploads/picture/20181213/b98b07018eba36aed522939ee1f908dc.jpg', '43baa78e00b238c45c686f6046b00e6c', '537a41c0877866c2ba32fc629c4513f44cd663e7', 1, 1544681711),
(281, '/uploads/picture/20181213/35d387008a01042cf2d9e9e9fc66949f.jpg', '/uploads/picture/20181213/35d387008a01042cf2d9e9e9fc66949f.jpg', '988b0a48ddeae3db68d26d41d9a5da0c', '60fbb4b2a830eeb6e320406a477960bda4322f2f', 1, 1544681731),
(282, '/uploads/picture/20181213/13e54a5aae6b7f2826713a475fee2e39.jpg', '/uploads/picture/20181213/13e54a5aae6b7f2826713a475fee2e39.jpg', 'ed559ba5babc4e15058d99b2dca2fe4d', 'f1ffe49fef7ebebcfd036fed80ffb8d76a5e0e27', 1, 1544685421),
(283, '/uploads/picture/20181213/73f02d9b8192d1f9512b8f43aed3db8f.jpg', '/uploads/picture/20181213/73f02d9b8192d1f9512b8f43aed3db8f.jpg', '2f3d5e852a1daadaab49e115a36d9bb9', '2b60fcee95def2be14d591d60e803680500f83f6', 1, 1544685818),
(284, '/uploads/picture/20181213/b4e5f3631372016b0db24ccf13f4c897.jpg', '/uploads/picture/20181213/b4e5f3631372016b0db24ccf13f4c897.jpg', '02c07ddbc8b19ece4121b64678accc4a', '314a67699defc7b5e6decdacfb18b6f5bf102f7b', 1, 1544685897),
(285, '/uploads/picture/20181213/1d449b7c9fa07c24bcb4bff0c0eb6232.jpg', '/uploads/picture/20181213/1d449b7c9fa07c24bcb4bff0c0eb6232.jpg', '1d49d9959ef19a9d8e349238a55915ce', '03f11b2381f163f7d02b0863109c2dcbc31bb8bf', 1, 1544685923),
(286, '/uploads/picture/20181213/6dde15e6acb3acf52b495ed59487fbf5.jpg', '/uploads/picture/20181213/6dde15e6acb3acf52b495ed59487fbf5.jpg', 'b18b60cc38d9f264ac3fa7f184e29553', '9ef0ed3ef3645a7e00e5a623f5c128c0d7fe148c', 1, 1544685926),
(287, '/uploads/picture/20181213/e361baad7ff631f2fbb185235f7f14b7.jpg', '/uploads/picture/20181213/e361baad7ff631f2fbb185235f7f14b7.jpg', '1d49d9959ef19a9d8e349238a55915ce', '03f11b2381f163f7d02b0863109c2dcbc31bb8bf', 1, 1544685929),
(288, '/uploads/picture/20181213/ca63ce80fcddbf52f0592b4118ef6638.jpg', '/uploads/picture/20181213/ca63ce80fcddbf52f0592b4118ef6638.jpg', '02c07ddbc8b19ece4121b64678accc4a', '314a67699defc7b5e6decdacfb18b6f5bf102f7b', 1, 1544685957),
(289, '/uploads/picture/20181213/edc667bf6c901341ce7bdd0b67399cd4.jpg', '/uploads/picture/20181213/edc667bf6c901341ce7bdd0b67399cd4.jpg', 'b18b60cc38d9f264ac3fa7f184e29553', '9ef0ed3ef3645a7e00e5a623f5c128c0d7fe148c', 1, 1544685959),
(290, '/uploads/picture/20181213/0a2213625790e594d0e6daadfba55d6c.jpg', '/uploads/picture/20181213/0a2213625790e594d0e6daadfba55d6c.jpg', '1d49d9959ef19a9d8e349238a55915ce', '03f11b2381f163f7d02b0863109c2dcbc31bb8bf', 1, 1544685962),
(291, '/uploads/picture/20181213/6f1edaca0cd161f4ecc82685fd8d6884.jpg', '/uploads/picture/20181213/6f1edaca0cd161f4ecc82685fd8d6884.jpg', 'd9de9269a1170a52bcd518cfb94d8463', '37d174a2f422329082fdea5a65b11414b24fa445', 1, 1544685964),
(292, '/uploads/picture/20181213/1f52b9fbe98a43d9b11d865d772204ca.jpg', '/uploads/picture/20181213/1f52b9fbe98a43d9b11d865d772204ca.jpg', 'b18b60cc38d9f264ac3fa7f184e29553', '9ef0ed3ef3645a7e00e5a623f5c128c0d7fe148c', 1, 1544685967),
(293, '/uploads/picture/20181213/5ba7b9a3f3027256afd3c236f1227cc3.jpg', '/uploads/picture/20181213/5ba7b9a3f3027256afd3c236f1227cc3.jpg', '91179d52f46a8c2ff15068137bf64ae3', 'a091db5e08ce2fc77c2ead1a8c8ddfa146bed344', 1, 1544687665),
(294, '/uploads/picture/20181213/87fca59ccd1a7b8f3018fa7a625b11e9.jpg', '/uploads/picture/20181213/87fca59ccd1a7b8f3018fa7a625b11e9.jpg', '91179d52f46a8c2ff15068137bf64ae3', 'a091db5e08ce2fc77c2ead1a8c8ddfa146bed344', 1, 1544687697),
(295, '/uploads/picture/20181213/63bfabc0c4ab2bff15793309775e4efc.jpg', '/uploads/picture/20181213/63bfabc0c4ab2bff15793309775e4efc.jpg', '91179d52f46a8c2ff15068137bf64ae3', 'a091db5e08ce2fc77c2ead1a8c8ddfa146bed344', 1, 1544687871),
(296, '/uploads/picture/20181213/e6746a16a9f4b42ff346008abb99567a.jpg', '/uploads/picture/20181213/e6746a16a9f4b42ff346008abb99567a.jpg', 'f1daab262de7c59b7d38747b17a53c1b', '4ec88427a27dc02ba677aecf87019dcfbcb9e53f', 1, 1544692330),
(297, '/uploads/picture/20181213/cef6a6a53faa5ebd3608e5b1e952c4b9.jpg', '/uploads/picture/20181213/cef6a6a53faa5ebd3608e5b1e952c4b9.jpg', '91179d52f46a8c2ff15068137bf64ae3', 'a091db5e08ce2fc77c2ead1a8c8ddfa146bed344', 1, 1544692399),
(298, '/uploads/picture/20181213/fd47ed60042014dd900b9e591616f7fe.jpg', '/uploads/picture/20181213/fd47ed60042014dd900b9e591616f7fe.jpg', '81bf0d11ac523a6634c6846314d36c9d', 'd7aa49e5702650503d01c942f9aa5e6863618267', 1, 1544692438),
(299, '/uploads/picture/20181213/cd64ba6a5076550f8e1222a4b7776282.jpg', '/uploads/picture/20181213/cd64ba6a5076550f8e1222a4b7776282.jpg', '81bf0d11ac523a6634c6846314d36c9d', 'd7aa49e5702650503d01c942f9aa5e6863618267', 1, 1544692447),
(300, '/uploads/picture/20181213/997cfc8992ca783804eb641808bfce20.jpg', '/uploads/picture/20181213/997cfc8992ca783804eb641808bfce20.jpg', 'cd7710dfe1f17210195c3a3ec680c9c4', '2da599b2d2bc3e02320b3063265df4a7f9490743', 1, 1544692451),
(301, '/uploads/picture/20181213/93feecbe452eced705a6d89a191a6c3a.jpg', '/uploads/picture/20181213/93feecbe452eced705a6d89a191a6c3a.jpg', '5241a43e070f77269dd8ce6393a4bb8e', '2ffe7b65d8e996c555af763eb3a54f77fc854d6d', 1, 1544692465),
(302, '/uploads/picture/20181214/4e097a93e256d67e40beb2c01947e9b8.jpg', '/uploads/picture/20181214/4e097a93e256d67e40beb2c01947e9b8.jpg', 'afcfe8cab2026e8d0d2f4a46913f01ba', 'fbb882020047ef1f3ca63b5355092ffbdaff267d', 1, 1544773718),
(303, '/uploads/picture/20181214/f2bbc11ffa0c2e0904b5e50a89110293.jpg', '/uploads/picture/20181214/f2bbc11ffa0c2e0904b5e50a89110293.jpg', '998358b12018cd9317510092626e6dab', '8a688b692909a6c9bff04030da21b130fc4c0b93', 1, 1544774065),
(304, '/uploads/picture/20181214/01a739495c0ae268a86c3e26d99dedd5.jpg', '/uploads/picture/20181214/01a739495c0ae268a86c3e26d99dedd5.jpg', '8e2469bff262170d6ad72b06a57b66a9', 'daffb5afbf2c5a2083e084854718ee784e8d1af7', 1, 1544774077),
(305, '/uploads/picture/20181214/cb85ac2382f3bdfb49e83c48092f1312.jpg', '/uploads/picture/20181214/cb85ac2382f3bdfb49e83c48092f1312.jpg', '817b432a8a093286a5cd0fbbb51a8032', '2498ead43f36561d59d1abe5c47a45d9e6204a88', 1, 1544774085),
(306, '/uploads/picture/20181214/ea7b113037e41aad46421726b082afd7.jpg', '/uploads/picture/20181214/ea7b113037e41aad46421726b082afd7.jpg', '817b432a8a093286a5cd0fbbb51a8032', '2498ead43f36561d59d1abe5c47a45d9e6204a88', 1, 1544774091),
(307, '/uploads/picture/20181214/025a7d3dd1bcd51b535436eecaea5310.jpg', '/uploads/picture/20181214/025a7d3dd1bcd51b535436eecaea5310.jpg', '61d43fb1a7f216e82df132b0d322dbfa', '84ba0871e4d538b63f0f0d3aa56661b5b1b77e56', 1, 1544774158),
(308, '/uploads/picture/20181214/b618d7639f406f3d2def94be2d165d7e.jpg', '/uploads/picture/20181214/b618d7639f406f3d2def94be2d165d7e.jpg', '8cdebdb84a85b949eff26df99edf46bd', 'ddd70debc2bda5373acb22e35c4442de4c2a3f1f', 1, 1544774167),
(309, '/uploads/picture/20181214/6eaea6885f5b68f6e46067b032f47f64.jpg', '/uploads/picture/20181214/6eaea6885f5b68f6e46067b032f47f64.jpg', 'a28c5edc160e30c9d776537cd6b647a1', '6f47d8c6ed26d2bb57ade650346541801c738ae5', 1, 1544774221),
(310, '/uploads/picture/20181214/061156e476afce328b1f367f38726f12.jpg', '/uploads/picture/20181214/061156e476afce328b1f367f38726f12.jpg', 'e3c4cdb935a3cb034a364732fb325539', '00495405e5c9cf0b74828826484386be38411dc0', 1, 1544774228),
(311, '/uploads/picture/20181214/4f19bbcef1c146cff3986259bdbecab2.jpg', '/uploads/picture/20181214/4f19bbcef1c146cff3986259bdbecab2.jpg', '93518e678a3ced4065dc0ad79185a5bd', '522273b80763238eef4662b0f0b043ee83b63fd8', 1, 1544774712),
(312, '/uploads/picture/20181214/f8b813d90cd8c89ca38f7499e8d36a8e.jpg', '/uploads/picture/20181214/f8b813d90cd8c89ca38f7499e8d36a8e.jpg', 'fb76b07a370e3b6e324dc4e2362e46ef', '76c9338b5660745a831883c51f68abd050d2fa25', 1, 1544774931),
(313, '/uploads/picture/20181214/ed02bf0adefc646165e41b0fee921e13.jpg', '/uploads/picture/20181214/ed02bf0adefc646165e41b0fee921e13.jpg', '7cd666ae58d1e6ba3134af7402e247a4', '4f17ae3d037a777b429393d60d40daf79332e5e3', 1, 1544774936),
(314, '/uploads/picture/20181214/c6640a3c80e21db951030a35a245ba9d.jpg', '/uploads/picture/20181214/c6640a3c80e21db951030a35a245ba9d.jpg', '915bd9ca7a13709a56856a579a0f5af2', '181ffa9dda074557d29cee5f12c52b8e5286a09f', 1, 1544774952),
(315, '/uploads/picture/20181214/6959887f6e37b76d446249ab6d60b5d9.jpg', '/uploads/picture/20181214/6959887f6e37b76d446249ab6d60b5d9.jpg', 'f3877d96c56fac82edd61f0625e0f312', '427df28380bb6c7779fd8ce889ec9a9d7c243eb8', 1, 1544775086),
(316, '/uploads/picture/20181214/871028a3956b74cceeaab6cd69dd17c1.jpg', '/uploads/picture/20181214/871028a3956b74cceeaab6cd69dd17c1.jpg', 'f3877d96c56fac82edd61f0625e0f312', '427df28380bb6c7779fd8ce889ec9a9d7c243eb8', 1, 1544775130),
(317, '/uploads/picture/20181214/a2233f245fb2c9327994d85cc508ac31.jpg', '/uploads/picture/20181214/a2233f245fb2c9327994d85cc508ac31.jpg', '915bd9ca7a13709a56856a579a0f5af2', '181ffa9dda074557d29cee5f12c52b8e5286a09f', 1, 1544775243),
(318, '/uploads/picture/20181215/08e4c3d610b1f411908fd40fd429aff8.png', '/uploads/picture/20181215/08e4c3d610b1f411908fd40fd429aff8.png', '9c2e4186fb1e6450350f47e57ef58dac', '475b2e3ecd640396b912123693340febb6071370', 1, 1544836617),
(319, '/uploads/picture/20181215/e974b56473e16f86160d16e5ab72edea.jpg', '/uploads/picture/20181215/e974b56473e16f86160d16e5ab72edea.jpg', '81bf0d11ac523a6634c6846314d36c9d', 'd7aa49e5702650503d01c942f9aa5e6863618267', 1, 1544846954),
(320, '/uploads/picture/20181215/bb34c36321f6a8b3f3a6cd6af6966b3b.jpg', '/uploads/picture/20181215/bb34c36321f6a8b3f3a6cd6af6966b3b.jpg', '81bf0d11ac523a6634c6846314d36c9d', 'd7aa49e5702650503d01c942f9aa5e6863618267', 1, 1544853853),
(321, '/uploads/picture/20181215/5a496f5894db8512033f10d6c5d2bbb5.jpg', '/uploads/picture/20181215/5a496f5894db8512033f10d6c5d2bbb5.jpg', '81bf0d11ac523a6634c6846314d36c9d', 'd7aa49e5702650503d01c942f9aa5e6863618267', 1, 1544854011),
(322, '/uploads/picture/20181215/84a8df74fd51076c4a4859ad90367314.JPG', '/uploads/picture/20181215/84a8df74fd51076c4a4859ad90367314.JPG', '287467f007f18d26ede545ad2d1382bf', 'd24b5999f90a113a5d145d90a795e817b6887fea', 1, 1544862460),
(323, '/uploads/picture/20181215/9817d1cb7250d3f050628308f4270058.JPG', '/uploads/picture/20181215/9817d1cb7250d3f050628308f4270058.JPG', '9339d6a7bb4213418bfd97c775fa9d4c', 'ee27f30a7d6b01cbaa748f3f7a360f7c005afa5b', 1, 1544862465),
(324, '/uploads/picture/20181215/afb3d0d79221b4c9116afea2d53b8184.jpg', '/uploads/picture/20181215/afb3d0d79221b4c9116afea2d53b8184.jpg', '8daf49bf8639d96a7f0ceee7e376bda1', '196010c774ce58920c349c103d7b43f3487f5274', 1, 1544862500),
(325, '/uploads/picture/20181215/e77561eca54c32498165f34d7d30f081.jpg', '/uploads/picture/20181215/e77561eca54c32498165f34d7d30f081.jpg', 'f3c6a065ef5a783032deed64cf07a08a', 'e62822a1a8e9e5f2cad279980c3b53b59687a988', 1, 1544862513),
(326, '/uploads/picture/20181215/aba53f55fed806be445bf909c87651ab.jpg', '/uploads/picture/20181215/aba53f55fed806be445bf909c87651ab.jpg', 'a0855b3964a03523c7f503617457b9b6', '21672cb3b2fe109dcc8cf6ee45251e7a08ddf16f', 1, 1544862544),
(327, '/uploads/picture/20181215/979576f918296ca76a2dda75d1122d16.jpg', '/uploads/picture/20181215/979576f918296ca76a2dda75d1122d16.jpg', '74e073596b801117c798cb6ff8b88235', 'de6467eb134b165ee14e8873f6eff67bd7041022', 1, 1544862584),
(328, '/uploads/picture/20181215/8d7dad6f698b00e8eb5b0d68e01dc867.jpg', '/uploads/picture/20181215/8d7dad6f698b00e8eb5b0d68e01dc867.jpg', 'bceda1a51c918d7826135cfde31342e0', '1167d5d20e1eb88e50ae97918befe73fbda2a8d6', 1, 1544864602),
(329, '/uploads/picture/20181215/105f9c9f180e3c83d9fa6963b9cf8534.png', '/uploads/picture/20181215/105f9c9f180e3c83d9fa6963b9cf8534.png', '134a8c2597fc825d03c72193e09bea5f', '170dd273f8f5223247b746c42ef3608dc2f5c75e', 1, 1544864615),
(330, '/uploads/picture/20181218/09ae5f9133d617f89e999d2eca44fadf.jpg', '/uploads/picture/20181218/09ae5f9133d617f89e999d2eca44fadf.jpg', '812279d5507a8df6c85ce80437d608db', '1dd53ae0a94a0268726a5cf22c27566475dcc022', 1, 1545122379),
(331, '/uploads/picture/20181218/74123adce5dfbc453872a231fb9b3e67.jpg', '/uploads/picture/20181218/74123adce5dfbc453872a231fb9b3e67.jpg', '1aea8f47f8c5a6541bd49233e0c21b0a', 'db029eb67dfbcf210f465b41d1fe2dfb50f3f1f4', 1, 1545122406),
(332, '/uploads/picture/20181218/650ac9d35a02c5ea93ed14a7ad139ee0.jpg', '/uploads/picture/20181218/650ac9d35a02c5ea93ed14a7ad139ee0.jpg', '6d6bb68b3ac93194adbb28dae6de662f', 'ec6dd11e80ee6da34320ca9a32049a037c7bea15', 1, 1545122415),
(333, '/uploads/picture/20181218/b183fd80de1b5c988393ec2896f916d3.jpg', '/uploads/picture/20181218/b183fd80de1b5c988393ec2896f916d3.jpg', 'cf8347bf30ac078ed3c7e1de24661498', '3aedec8b6f8a3d536fc5ea18def56a84fbcd1485', 1, 1545122419),
(334, '/uploads/picture/20181218/3ffc2f980e5f0312b6e94e0fda80981d.jpg', '/uploads/picture/20181218/3ffc2f980e5f0312b6e94e0fda80981d.jpg', '5c6c8427997ccdb63d2eca99f9d8ce54', '179dd7d17d8b9793d91e20b056a815b1fa655464', 1, 1545122934),
(335, '/uploads/picture/20181218/b208eaea0b27454fc75e1de21320c2ca.jpg', '/uploads/picture/20181218/b208eaea0b27454fc75e1de21320c2ca.jpg', 'bcee0da6eb308d4e22df2ca4d5e64cdb', '96eb7f6865889b908bb66436c9b47e992d202612', 1, 1545122938);

-- --------------------------------------------------------

--
-- 表的结构 `sent_protect`
--

CREATE TABLE IF NOT EXISTS `sent_protect` (
  `id` int(11) unsigned NOT NULL,
  `name` varchar(20) DEFAULT NULL COMMENT '学员名称',
  `person` varchar(20) NOT NULL COMMENT '队员,或者合伙人 电话号码',
  `protect_time` int(11) NOT NULL COMMENT '保护时间',
  `deactivation_time` int(11) NOT NULL COMMENT '脱保时间',
  `tel` varchar(20) NOT NULL COMMENT '学员手机号码',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '状态 （0:保护状态 1：主动脱保 2：超时脱保 3：助攻脱保 4：已成交)',
  `deal_time` int(11) DEFAULT NULL COMMENT '成交时间'
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='资源保护';

--
-- 转存表中的数据 `sent_protect`
--

INSERT INTO `sent_protect` (`id`, `name`, `person`, `protect_time`, `deactivation_time`, `tel`, `status`, `deal_time`) VALUES
(2, '测试1', '13594855872', 1544172884, 1544604947, '13594855801', 4, 1544173884),
(3, '测试2', '13594855872', 1544172884, 1544179884, '13594855802', 4, 1544239694),
(4, '测试3', '13594855872', 1544172884, 1544189884, '13594855803', 0, 0),
(5, NULL, '13594855872', 1544251653, 1544683653, '13594855001', 0, 0),
(6, 'ceshi', '13594855872', 1544251653, 1544251653, '13594855002', 0, 0),
(7, 'ceshi', '13594855872', 1544251653, 1544253381, '13594855003', 1, 0),
(8, '测试1', '18375928109', 1544172884, 1544604947, '13594855810', 4, 1544173884),
(9, '测试1', '18375928109', 1544172884, 1544604947, '13594855811', 4, 1544173884),
(10, '测试1', '18375928109', 1544172884, 1544604947, '13594855812', 4, 1544183884),
(11, '测试1', '18375928109', 1544172884, 1544604947, '13594855813', 4, 1544683884),
(12, '啦啦啦', '18375928109', 1544407870, 1544839870, '18885202685', 1, NULL),
(13, '', '18375928109', 1544579262, 1545011262, '18885202686', 1, NULL),
(14, '', '18375928109', 1544579372, 1545011372, '18885202687', 1, NULL),
(15, '', '18375928109', 1544579433, 1544585982, '18885202688', 1, NULL),
(16, '', '18375928109', 1544579475, 1544586017, '18885202689', 1, NULL),
(17, '', '18375928109', 1544579503, 1544586085, '18885202610', 1, NULL),
(18, '', '18375928109', 1544579529, 1544586159, '18885202611', 1, NULL),
(19, '', '18375928109', 1544581775, 1545013775, '18885202613', 1, NULL),
(20, '', '18375928109', 1544582118, 1545014118, '18885202614', 0, NULL),
(21, '', '18375928109', 1544582525, 1545014525, '18885202615', 0, NULL),
(22, '呀呀呀', '18375928109', 1544599340, 1545031340, '18885202632', 0, NULL),
(23, '测试1', '15702392780', 1544172884, 1544604947, '13594850001', 4, 1544239694),
(24, '测试1', '15702392780', 1544172884, 1544604947, '13594850002', 4, 1544239694),
(25, '测试3', '15702392781', 1544172884, 1544604947, '13594850003', 4, 1544173884),
(26, '测试4', '15702392781', 1544172884, 1544604947, '13594850004', 4, 1544173884),
(27, '测试4', '15702392781', 1544172884, 1544604947, '13594850005', 4, 1544604947),
(28, '测试4', '15702392781', 1544172884, 1544604947, '13594850006', 4, 1544604947);

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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `sent_school`
--

INSERT INTO `sent_school` (`id`, `name`) VALUES
(1, '鼎吉驾校'),
(2, '金西亚驾校'),
(3, '城南驾校'),
(4, '西南驾校'),
(5, '秀学车'),
(6, '易点学车');

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
  `is_pay` tinyint(4) DEFAULT '0' COMMENT '是否付款(1:已付款 0：未付款)'
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COMMENT='学员管理表';

--
-- 转存表中的数据 `sent_student`
--

INSERT INTO `sent_student` (`id`, `name`, `phone`, `card`, `grade_id`, `area_id`, `activity_id`, `coupon`, `inviter`, `sign_date`, `pay_date`, `status`, `tuition_state`, `payable`, `payment`, `unpaid`, `openId`, `sn`, `pay_type`, `payee`, `remark`, `school_id`, `is_pay`) VALUES
(11, '冯显志', '15922542385', '500225199508150358', 17, 10, NULL, NULL, NULL, 1545046452, NULL, 1, 1, '666.00', '666.00', '0.00', 'o2l0cwj6bKfp1IlK60lL6exB-sA0', 'dj_WwokstaTlfohhmjimkCg', 1, NULL, NULL, 6, NULL),
(14, '花花', '13594855872', '500236199109136208', 17, 10, NULL, NULL, NULL, 1545125587, NULL, 1, 1, '666.00', '666.00', '0.00', 'o2l0cwqD9xFMwlNrr7BfBCmhLVv8', 'dj_pFqNXCAZMrGapUrPoCdb', 1, NULL, NULL, 6, NULL),
(15, '花花', '13594855872', '500236199109136203', 17, 10, NULL, NULL, NULL, 1545126351, NULL, 1, 1, '666.00', '666.00', '0.00', 'o2l0cwqD9xFMwlNrr7BfBCmhLVv8', 'dj_jtUnfTyReWCLwHQvJcge', 1, NULL, NULL, 6, NULL),
(16, '花花', '13594855872', '500236199109136201', 17, 10, NULL, NULL, NULL, 1545126484, NULL, 1, 1, '666.00', '666.00', '0.00', 'o2l0cwqD9xFMwlNrr7BfBCmhLVv8', 'dj_wdPlkVTeceuGWROZfdRr', 1, NULL, NULL, 6, NULL),
(17, '花花', '13594855872', '500236199109136201', 17, 10, NULL, NULL, NULL, 1545126526, NULL, 1, 1, '666.00', '666.00', '0.00', 'o2l0cwqD9xFMwlNrr7BfBCmhLVv8', 'dj_nOWQwHMAKXgcdHYZWTRt', 1, NULL, NULL, 6, NULL),
(18, '啦啦啦', '18375928109', '522124199810020321', 17, 10, NULL, NULL, NULL, 1545127953, NULL, 1, 1, '666.00', '666.00', '0.00', 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', 'dj_CDMjsXDntayadBBZdIGZ', 1, NULL, NULL, 6, NULL),
(19, '啦啦啦', '18375928109', '522124199809088965', 17, 10, NULL, NULL, NULL, 1545128009, NULL, 1, 1, '666.00', '666.00', '0.00', 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', 'dj_jmHSEtTxXWQGlrJFPRQP', 1, NULL, NULL, 6, NULL),
(20, '啦啦啦', '18885202685', '522124199710230231', 17, 10, NULL, NULL, NULL, 1545128189, NULL, 1, 1, '666.00', '666.00', '0.00', 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', 'dj_VoygCmIDVQnpClXQthoz', 1, NULL, NULL, 6, NULL),
(21, '啦啦啦', '18295623012', '522124200102130231', 17, 10, NULL, NULL, NULL, 1545128285, NULL, 1, 1, '666.00', '666.00', '0.00', 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', 'dj_DVWpHZLfLrCfUIeWpNxm', 1, NULL, NULL, 6, NULL),
(22, '花花', '13594855872', '500236199109136201', 17, 10, NULL, NULL, NULL, 1545128552, NULL, 1, 1, '666.00', '666.00', '0.00', 'o2l0cwqD9xFMwlNrr7BfBCmhLVv8', 'dj_SJxqfPipRkMVPiIqblYr', 1, NULL, NULL, 6, NULL),
(23, '花花', '13594855872', '500236199109136201', 17, 10, NULL, NULL, NULL, 1545128855, NULL, 1, 1, '666.00', '666.00', '0.00', 'o2l0cwqD9xFMwlNrr7BfBCmhLVv8', 'dj_NkNzfYgbuVypHtUdMAXb', 1, NULL, NULL, 6, NULL),
(24, '花花', '13594855872', '500236199109136208', 17, 10, NULL, NULL, NULL, 1545128892, NULL, 1, 1, '666.00', '666.00', '0.00', 'o2l0cwqD9xFMwlNrr7BfBCmhLVv8', 'dj_VVGDJslEAidrFGIhmWwJ', 1, NULL, NULL, 6, NULL),
(25, '花花', '13594855872', '500236199109136201', 17, 10, NULL, NULL, NULL, 1545128920, NULL, 1, 1, '666.00', '666.00', '0.00', 'o2l0cwqD9xFMwlNrr7BfBCmhLVv8', 'dj_BTsnYvEynIOwCHfSzDmh', 1, NULL, NULL, 6, NULL),
(26, '花花', '13594855871', '500236199109136208', 17, 10, NULL, NULL, NULL, 1545129150, NULL, 1, 1, '666.00', '666.00', '0.00', 'o2l0cwqD9xFMwlNrr7BfBCmhLVv8', 'dj_XYsqgdDvwecVhoOseRga', 1, NULL, NULL, 6, NULL),
(27, '冯显志', '15922542385', '500225199508150358', 17, 10, NULL, NULL, NULL, 1545129346, NULL, 1, 1, '666.00', '666.00', '0.00', 'o2l0cwj6bKfp1IlK60lL6exB-sA0', 'dj_qOrvGsLtswDDnfpYaMJE', 1, NULL, NULL, 6, NULL),
(28, '花花', '13594855872', '500236199109136208', 17, 10, NULL, NULL, NULL, 1545130393, NULL, 1, 1, '666.00', '666.00', '0.00', 'o2l0cwqD9xFMwlNrr7BfBCmhLVv8', 'dj_uopJNgnbCecOiDTrPwBX', 1, NULL, NULL, 6, NULL),
(29, '花花', '13594855871', '500236199109136203', 17, 10, NULL, NULL, NULL, 1545131866, NULL, 1, 1, '666.00', '666.00', '0.00', 'o2l0cwqD9xFMwlNrr7BfBCmhLVv8', 'dj_uDDtJaoqNxVncsHoLNCY', 1, NULL, NULL, 6, NULL),
(30, '花花', '13594855872', '500236199109136205', 17, 10, NULL, NULL, NULL, 1545703307, NULL, 1, 1, '666.00', '666.00', '0.00', 'o2l0cwqD9xFMwlNrr7BfBCmhLVv8', 'dj_svboPpMpUqgGHWxpOVry', 1, NULL, NULL, 6, NULL),
(31, '花花', '13594855872', '500236199109136205', 17, 10, NULL, NULL, NULL, 1545703314, NULL, 1, 1, '666.00', '666.00', '0.00', 'o2l0cwqD9xFMwlNrr7BfBCmhLVv8', 'dj_jQLSlYFCgMdCVGHsXLii', 1, NULL, NULL, 6, NULL),
(32, '花花', '13594855872', '500236199109136208', 17, 10, NULL, NULL, NULL, 1545703492, NULL, 1, 1, '666.00', '666.00', '0.00', 'o2l0cwqD9xFMwlNrr7BfBCmhLVv8', 'dj_KSlrKIRpPHjZlWcwFnhw', 1, NULL, NULL, 6, 0),
(33, '花花', '13594855872', '500236199109136208', 17, 10, NULL, NULL, NULL, 1545703628, NULL, 1, 1, '666.00', '666.00', '0.00', 'o2l0cwqD9xFMwlNrr7BfBCmhLVv8', 'dj_BbAMTsPYyDJEKkOoUvxu', 1, NULL, NULL, 6, 0),
(34, '花花', '13594855872', '500236199109136208', 17, 10, NULL, NULL, NULL, 1545703677, NULL, 1, 1, '666.00', '666.00', '0.00', 'o2l0cwqD9xFMwlNrr7BfBCmhLVv8', 'dj_QBOAzqgXdFQeYbqCFhOX', 1, NULL, NULL, 6, 0),
(35, '花花', '13594855872', '500236199109136208', 17, 10, NULL, NULL, NULL, 1545703772, NULL, 1, 1, '666.00', '666.00', '0.00', 'o2l0cwqD9xFMwlNrr7BfBCmhLVv8', 'dj_jSvBQDxZModKgvfOVeRS', 1, NULL, NULL, 6, 0),
(36, '花花', '13594855872', '500236199109136208', 17, 10, NULL, NULL, NULL, 1545703821, NULL, 1, 1, '666.00', '666.00', '0.00', 'o2l0cwqD9xFMwlNrr7BfBCmhLVv8', 'dj_vLDHXfnIsSBvowkKDfQZ', 1, NULL, NULL, 6, 0),
(37, '花花', '13594855872', '500236199109136205', 17, 10, NULL, NULL, NULL, 1545703831, 1545703841, 1, 1, '666.00', '666.00', '0.00', 'o2l0cwqD9xFMwlNrr7BfBCmhLVv8', 'dj_RABVZNPEkdfgWeTutKiR', 1, NULL, NULL, 6, 0),
(38, '花花', '13594855872', '500236199109136208', 17, 10, NULL, NULL, NULL, 1545704240, 1545704247, 1, 1, '666.00', '666.00', '0.00', 'o2l0cwqD9xFMwlNrr7BfBCmhLVv8', 'dj_JJrOspltSmxQoVofLWdL', 1, NULL, NULL, 6, 0),
(39, '花花', '13594855872', '500236199109136208', 17, 10, NULL, NULL, NULL, 1545704556, NULL, 1, 1, '666.00', '666.00', '0.00', 'o2l0cwqD9xFMwlNrr7BfBCmhLVv8', 'dj_uBWHIZlAXTcZyWbRMftE', 1, NULL, NULL, 6, 0),
(40, '花花', '13594855872', '500236199109136208', 17, 10, NULL, NULL, NULL, 1545704563, NULL, 1, 1, '666.00', '666.00', '0.00', 'o2l0cwqD9xFMwlNrr7BfBCmhLVv8', 'dj_snJmqxzlEWXCYFhOoPMV', 1, NULL, NULL, 6, 0),
(41, '花花', '13594855872', '500236199109136208', 17, 10, NULL, NULL, NULL, 1545704593, NULL, 1, 1, '666.00', '666.00', '0.00', 'o2l0cwqD9xFMwlNrr7BfBCmhLVv8', 'dj_UxtKcqqlLTfkWgNYmPcs', 1, NULL, NULL, 6, 0),
(42, '花花', '13594855872', '500236199109136208', 17, 10, NULL, NULL, NULL, 1545704599, NULL, 1, 1, '666.00', '666.00', '0.00', 'o2l0cwqD9xFMwlNrr7BfBCmhLVv8', 'dj_ygZNJUcYdiMGuzEgTvoj', 1, NULL, NULL, 6, 0),
(43, '花花', '13594855872', '500236199109136208', 17, 10, NULL, NULL, NULL, 1545704669, NULL, 1, 1, '666.00', '666.00', '0.00', 'o2l0cwqD9xFMwlNrr7BfBCmhLVv8', 'dj_TABXjgMEnkQQiVjZGBbq', 1, NULL, NULL, 6, 0),
(44, '花花', '13594855872', '500236199109136208', 17, 10, NULL, NULL, NULL, 1545704811, NULL, 1, 1, '666.00', '666.00', '0.00', 'o2l0cwqD9xFMwlNrr7BfBCmhLVv8', 'dj_kJOrovPyfPDcBHuXPCiJ', 1, NULL, NULL, 6, 0),
(45, '花花', '13594855872', '500236199109136208', 17, 10, NULL, NULL, NULL, 1545704866, NULL, 1, 1, '666.00', '666.00', '0.00', 'o2l0cwqD9xFMwlNrr7BfBCmhLVv8', 'dj_qjpjQHoKlAbRnhdHKMSe', 1, NULL, NULL, 6, 0),
(46, '花花', '13594855872', '500236199109136208', 17, 10, NULL, NULL, NULL, 1545705407, NULL, 1, 1, '666.00', '666.00', '0.00', 'o2l0cwqD9xFMwlNrr7BfBCmhLVv8', 'dj_wHtLaFHgUzfrNIArVtpS', 1, NULL, NULL, 6, 0),
(47, '花花', '13594855872', '500236199109136208', 17, 10, NULL, NULL, NULL, 1545705586, NULL, 1, 1, '666.00', '666.00', '0.00', 'o2l0cwqD9xFMwlNrr7BfBCmhLVv8', 'dj_bgAKdJptZqQkyixqCRJm', 1, NULL, NULL, 6, 0),
(48, '花花', '13594855872', '500236199109136208', 17, 10, NULL, NULL, NULL, 1545705966, NULL, 1, 1, '666.00', '666.00', '0.00', 'o2l0cwqD9xFMwlNrr7BfBCmhLVv8', 'dj_tPVoHGdVLesyIUvSAlvs', 1, NULL, NULL, 6, 0),
(49, '花花', '13594855872', '500236199109136208', 17, 10, NULL, NULL, NULL, 1545706312, 1545706319, 1, 1, '666.00', '666.00', '0.00', 'o2l0cwqD9xFMwlNrr7BfBCmhLVv8', 'dj_VwmpKrKdjeGbYENluzWV', 1, NULL, NULL, 6, 0),
(50, '花花', '13594855872', '500236199109136203', 17, 10, NULL, NULL, NULL, 1545706508, NULL, 1, 1, '666.00', '666.00', '0.00', 'o2l0cwqD9xFMwlNrr7BfBCmhLVv8', 'dj_nYaZvlPAIiBNqRkhTFQX', 1, NULL, NULL, 6, 0),
(51, '花花', '13594855872', '500236199109136208', 17, 10, NULL, NULL, NULL, 1545706514, NULL, 1, 1, '666.00', '666.00', '0.00', 'o2l0cwqD9xFMwlNrr7BfBCmhLVv8', 'dj_mEVuIARstRrGylTNXUSs', 1, NULL, NULL, 6, 0),
(52, '花花', '13594855872', '500236199109136203', 17, 10, NULL, NULL, NULL, 1545706525, 1545706531, 1, 1, '666.00', '666.00', '0.00', 'o2l0cwqD9xFMwlNrr7BfBCmhLVv8', 'dj_bwCKijHtdFSinrFCymWB', 1, NULL, NULL, 6, 0),
(53, '花花', '13594855872', '500236199109136208', 17, 10, NULL, NULL, NULL, 1545706629, NULL, 1, 1, '666.00', '666.00', '0.00', 'o2l0cwqD9xFMwlNrr7BfBCmhLVv8', 'dj_cbehlkNUONtLhHboqkoN', 1, NULL, NULL, 6, 0),
(54, '花花', '13594855872', '500236199109136203', 17, 10, NULL, NULL, NULL, 1545707757, 1545707764, 1, 1, '666.00', '666.00', '0.00', 'o2l0cwqD9xFMwlNrr7BfBCmhLVv8', 'dj_pEGOTqBRqeBsPYPPOJxP', 1, NULL, NULL, 6, 1);

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
(4, 31008, 107, 31107, 1542008373, 1, 1, '啦啦', '18356958626', 1543310312),
(5, 31009, 1, 31001, 1542008373, 1, 1, '啦啦啦', '18889090909', 1543886360),
(6, 31010, 74, 31074, 1542008373, 1, 1, '啦啦啦', '18889090909', 1543886361),
(7, 31011, 265, 31265, 1542008373, 1, 1, '冯显志', '15922542385', 1544002894),
(8, 31012, 239, 31239, 1542008373, 1, 1, '冯显志', '15922542385', 1544002939),
(9, 31013, 158, 31158, 1542008373, 1, 1, '冯显志', '15922542385', 1544065221),
(10, 31014, 274, 31274, 1542008373, 1, 1, '花花', '13594855872', 1544078464),
(11, 31015, 891, 31891, 1542008373, 1, 1, '冯显志', '15922542385', 1544619853),
(12, 31016, 171, 31171, 1542008373, 1, 1, '啦啦啦', '18565236235', 1544684839),
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
(48, 264378, 502, 264502, 1542008472, 1, 2, '冯显志', '15922542385', 1544362423),
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
  `precision` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `school_id` smallint(6) NOT NULL DEFAULT '1' COMMENT '学校ID'
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `sent_wx_user`
--

INSERT INTO `sent_wx_user` (`id`, `agent_no`, `subscribe`, `openid`, `nickname`, `phone`, `name`, `card_id`, `shcool`, `k2_status`, `k3_status`, `sex`, `city`, `country`, `province`, `language`, `headimgurl`, `img`, `subscribe_time`, `visit_time`, `lng`, `lat`, `precision`, `school_id`) VALUES
(2, NULL, NULL, 'o2l0cwjIF_dOUVUdQHoVAZZF4Ri4', 'vip.khan', '18295623012', '啦啦啦', '522124200102130231', NULL, NULL, NULL, 2, '', '中国', '贵州', NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/MUWdKOHMagnYfHfoDsupV5Q4AvUJ8AdBVLNTib1luVRUDVUo9NbIbic7AicAhcK8TT8ydBgZaPpIH5hxkVL9DjFXQ/132', NULL, 1543029012, NULL, NULL, NULL, NULL, 1),
(3, NULL, NULL, 'o2l0cwo30rZqIyvIOK7wNQjml968', '琪.', NULL, NULL, NULL, NULL, NULL, NULL, 2, '渝北', '中国', '重庆', NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq0d4KrZsCm0krbSKh83jlU5Z6OUMN6lUnUFa3FiaTR7CNibWr4cYew4zeCh0QMxQavQY8eHqvdpgqw/132', NULL, 1543030561, NULL, NULL, NULL, NULL, 1),
(6, NULL, NULL, 'o2l0cwjjem5xNUH5Is9fUec_jhEE', '老罗', NULL, NULL, NULL, NULL, NULL, NULL, 1, '', '百慕大', '', NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLtzsMP9e5wgyTmDnumoLVRuE73svAghmAmqBIzZHkhF2H0ZtpPh8gkA8ictKoF5OOice5TWCniawZhg/132', NULL, 1543032560, NULL, NULL, NULL, NULL, 1),
(8, NULL, NULL, 'o2l0cwj6bKfp1IlK60lL6exB-sA0', '꯭冯꯭较꯭瘦꯭ 👈 ꯭', '15922542385', '冯显志', '500225199508150358', NULL, NULL, NULL, 1, '沙坪坝', '中国', '重庆', NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIaSArNlmfEL4IlvxCtaxgiarUXyibkeuibqh46nXf6WZVREibRBHvb9vmKiclTLHicRlbJJVoN575rqquQ/132', NULL, 1543033345, NULL, NULL, NULL, NULL, 1),
(10, NULL, NULL, 'o2l0cwqD9xFMwlNrr7BfBCmhLVv8', '花花🎉 🎉', '13594855872', '花花', '500236199109136203', NULL, NULL, NULL, 2, '', '安道尔', '', NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLSal9N2KNkoib8MQAU98JLfrLAibYmRWKe9MR0BsWXEkaU2Ohxcia2DlgYXn5XZtIarqxrQBb04jTuQ/132', NULL, 1544066628, NULL, NULL, NULL, NULL, 1),
(9, NULL, NULL, 'o2l0cwou_duk5w92GeBfDspqquJ4', '李大仙', NULL, NULL, NULL, NULL, NULL, NULL, 2, '南充', '中国', '四川', NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/iaMhsEREDzicgkHeficMxTy8pYvsB0o3TRCVknPvC0gPhtV0taDZhaiajHjdJpqf0OcHGynrF7MNYQTMuPpjT1AicJg/132', NULL, 1543921077, NULL, NULL, NULL, NULL, 1),
(11, NULL, NULL, 'oad8nxKfQe2i_Fhlv2qeC8-5ISno', 'vip.khan', NULL, NULL, NULL, NULL, NULL, NULL, 2, '', '中国', '贵州', NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/611B5V8YLD6bgcGayibN41TXrwEUXgqYMBRoE4OgIkMEDI6WYy6IFcZszWKdObSJM8joJY38aZQM40GPgMrGibRw/132', NULL, 1544843041, NULL, NULL, NULL, NULL, 1),
(12, NULL, NULL, 'oad8nxEEZO93tYQI35xok3SJkCYU', '花花🎉 🎉', '13594855872', '花花', '500236199109136209', NULL, NULL, NULL, 2, '', '安道尔', '', NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIl48icVa6NMwdrRlUnbTg6ibcUGdQ4MvuRDgExaRjSAR7Fs1T0rcQY1p3vVeUbyPGOYDDRaEPbic4Mw/132', NULL, 1544843070, NULL, NULL, NULL, NULL, 1),
(13, NULL, NULL, 'oad8nxEYHWQkclhoK2M1BBx7YUO4', '꯭冯꯭较꯭瘦꯭ 👈 ꯭', NULL, NULL, NULL, NULL, NULL, NULL, 1, '沙坪坝', '中国', '重庆', NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIrJXF9T42od83nanqAFnW6ia5CF4icclvHf8nsYTf5hD7XAvDWmX0myciauxv0MEvGicc7icQvGzmd1Jg/132', NULL, 1544857121, NULL, NULL, NULL, NULL, 1),
(14, NULL, NULL, 'o2l0cwl0JNFYnD5CDR-2UlCroS5E', '刺猬', NULL, NULL, NULL, NULL, NULL, NULL, 2, '', '', '', NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/UvOxex00oDWNWeZwp74W8WicbTreeHJicyiaKWqIE1Gq4kpecBWpibbDUF6gTKRNfxAOibSIicCDZC7LYO45Y0vOPlibw/132', NULL, 1545183174, NULL, NULL, NULL, NULL, 1),
(16, NULL, NULL, 'oOa6J1PVHZEhZ_qBX30oVzEQz8Fw', '꯭冯꯭较꯭瘦꯭ 👈 ꯭', NULL, NULL, NULL, NULL, NULL, NULL, 1, '沙坪坝', '中国', '重庆', NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJ2NNTuiavvsKSlYiaqicgaI3OpRKefWqff9W61xeFlUOUJdUk7FTRK2aCb4sgDrx77h5wFRpP3VpMcw/132', NULL, 1545297395, NULL, NULL, NULL, NULL, 1),
(17, NULL, NULL, 'oOa6J1EfRL2qN6YucS4nz9SJgEQg', '花花🎉 🎉', NULL, NULL, NULL, NULL, NULL, NULL, 2, '', '安道尔', '', NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLicjcpficybn5Bfflnywp8UqhYbkicjXFBpvSDjvvqD0icDZpdwnB7vcyLicriaWcGl0VASjkmia8cgbXeg/132', NULL, 1545297410, NULL, NULL, NULL, NULL, 1),
(18, NULL, NULL, 'oOa6J1ACQgiYZtcDzH1_OU1OxzXI', 'vip.khan', NULL, NULL, NULL, NULL, NULL, NULL, 2, '', '中国', '贵州', NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/qk4oNk4A9ib0yp2axLpAZviaibVFbsbtnmQv4rggP6qmUhjg78Ap5WVXvYiaSicpx4Mxcoe35iccH8cLOgDanvTnuMhg/132', NULL, 1545361071, NULL, NULL, NULL, NULL, 1),
(19, NULL, NULL, 'oD2DF026o4z1tjMj2jKK5Azsz6Cs', '花花🎉 🎉', NULL, NULL, NULL, NULL, NULL, NULL, 2, '', '安道尔', '', NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTL6gtXyDoojheCslxeVGia26bkdtGX06f2PFicfTD5q2nAICUmH6ibicaWVsRCyIRhasv4HebRmoUWseA/132', NULL, 1545394777, NULL, NULL, NULL, NULL, 1),
(20, NULL, NULL, 'oD2DF06onyQ0GqcSTgbXekHub8Gw', '꯭冯꯭较꯭瘦꯭ 👈 ꯭', NULL, NULL, NULL, NULL, NULL, NULL, 1, '沙坪坝', '中国', '重庆', NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJpC3FhW8n3hdyW3srzmYniboVyib8dvTwvkNtEbTSIdWGvUicMiblibjkq5Ty6rP2wicOAibz4ZTsGiaoClw/132', NULL, 1545394949, NULL, NULL, NULL, NULL, 1),
(21, NULL, NULL, 'oVo9u1SFGqvlohbhe0cwI6P1XgPA', '花花🎉 🎉', NULL, NULL, NULL, NULL, NULL, NULL, 2, '', '安道尔', '', NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJPI6kgKQGgw3n2S5kqyPXzicgjQ4HcXkg9Ae9Zj823kdib8hCDiatRrx4viar44xFCkibnKvXUhW7ZfsA/132', NULL, 1545395017, NULL, NULL, NULL, NULL, 1),
(22, NULL, NULL, 'oVo9u1XCM10U3Z2jSmflvRjbEMeM', '王又又', NULL, NULL, NULL, NULL, NULL, NULL, 1, '沙坪坝', '中国', '重庆', NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/PY1DeicI56l9CXia3Qc2ic8XbGk5vdKKxe2tTicN34QasoNeqCYicfXMiakMbxTarfGeepdp0S2OnY4HTVFk7viaTLUjw/132', NULL, 1545401217, NULL, NULL, NULL, NULL, 1),
(23, NULL, NULL, 'oVo9u1Yo4Mi_WesgEQnjaMlEPSmY', '风承', NULL, NULL, NULL, NULL, NULL, NULL, 1, '綦江', '中国', '重庆', NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/yvDjGS7eenfnqXic4sOTCfDzEzzvHHQuDQc3oUEfNicfibcmBkbhWIiboNic6y93QEwbt5foCES9bj9lnZ980pkicnTQ/132', NULL, 1545401443, NULL, NULL, NULL, NULL, 1),
(24, NULL, NULL, 'oOa6J1GMHQzKEKME0XWDtyZnYh_4', 'Better ', NULL, NULL, NULL, NULL, NULL, NULL, 2, '', '中国', '', NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/dodob439ebCQX6yOVf6enakNr2ycuURicjPbAVg1ibicxibJiclJMBkmknHyzNfXic8jRMuSvribKFiatacb6KrR5gyqZg/132', NULL, 1545403909, NULL, NULL, NULL, NULL, 1),
(25, NULL, NULL, 'oOa6J1N5G_YL3Y29mktURX5D0AxI', '老罗', NULL, NULL, NULL, NULL, NULL, NULL, 1, '', '百慕大', '', NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI5LiaRovnx8iaGWv7hXWgW1yALZTkTyG5icZpoulb0HvbGMzTgicMOKPra4Vcia21VqQzK0QtUicCf45Fw/132', NULL, 1545404408, NULL, NULL, NULL, NULL, 1),
(26, NULL, NULL, 'oad8nxKBcKALRQR05cVEeHvaFIco', '学勇', NULL, NULL, NULL, NULL, NULL, NULL, 1, '', '中国', '重庆', NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/AuiakPrG9kiaEZpUsWoKJ1qcuIsScyXeKOvMib2icQcQlLrfpKxocicKUKULMibXObXaN0JpksXDia1DgWe0AgAo1aTNg/132', NULL, 1545463465, NULL, NULL, NULL, NULL, 1),
(27, NULL, NULL, 'oad8nxP8kKkgzvn1T74wFrzT_MLU', '一纸情书🌸', NULL, NULL, NULL, NULL, NULL, NULL, 1, '渝北', '中国', '重庆', NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLkWoiaXhl4tWpVDnibYgBYP1BHywLFgkyvF80h249pWx4eo24np0n3bKXW1FEYc4lrosKsmZd0caDw/132', NULL, 1545464421, NULL, NULL, NULL, NULL, 1),
(28, NULL, NULL, 'oad8nxLmm7Un46fnoNOOfn-2kt94', 'YY', NULL, NULL, NULL, NULL, NULL, NULL, 2, '沙坪坝', '中国', '重庆', NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/icANibv1sT5ea5thgicZ2ia0ic7fCGplRT7xAAqUJYeL6kG3czbOZibacNzdkp202h3XF2QL6ibuxR1AAy11h6p8qH4CQ/132', NULL, 1545465471, NULL, NULL, NULL, NULL, 1),
(29, NULL, NULL, 'oad8nxHzFHSQNWvrbq6L9_OidAMU', '小可爱雨昕', NULL, NULL, NULL, NULL, NULL, NULL, 2, '璧山', '中国', '重庆', NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoWfHMtWurnztAxEC1PN8YcxJFPwgq9zt4XGawetaQqYNaaChBxicicVq4cpKxBu6nYlzUICwaXdNrA/132', NULL, 1545478161, NULL, NULL, NULL, NULL, 1),
(30, NULL, NULL, 'oOa6J1CpSrrN3OmxI66naFeWI7XY', '得与失。', NULL, NULL, NULL, NULL, NULL, NULL, 1, '成都', '中国', '四川', NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/PWJuYjIYzUdh5fhPxFxEbVUm4orvsbL3TicicgiazicPzdeOyHorPWFQibk9mH3UnckMsxWiafgOmJ8T6CXhT5Y5TJibQ/132', NULL, 1545488700, NULL, NULL, NULL, NULL, 1),
(31, NULL, NULL, 'oVo9u1Uwlq2T7iiQzmNeegDhHrvo', 'Mr.夏', NULL, NULL, NULL, NULL, NULL, NULL, 1, '万盛', '中国', '重庆', NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/4cjgCtJ67ws0eiccrx9wr4ZnicibVBNPKBhLB6SZdFKGSBSuMk3bM33PxFmziaDRyLevHNQbn57A1HC62jqibk2Mubw/132', NULL, 1545527214, NULL, NULL, NULL, NULL, 1),
(32, NULL, NULL, 'oVo9u1YMBNSvtyS6VJ3MgHDZKoDQ', '纵', NULL, NULL, NULL, NULL, NULL, NULL, 1, '', '中国', '', NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/iacIyxHXOjiack6KVcFoysQSOkpxscdqnFia27ugLsXIhRB5MZyRmU6oia5JktwH62NF5q8GD7ZicjxoiabxFDR4THIw/132', NULL, 1545527266, NULL, NULL, NULL, NULL, 1),
(33, NULL, NULL, 'oVo9u1ciSqZoc9zLicYGEjHCEbWE', 'Eril', NULL, NULL, NULL, NULL, NULL, NULL, 1, '', '中国', '重庆', NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eo4qRiakPPvibPCFv7FmppCISXicntny6lpzS6hGTibYdSm0mPWHcVQ157kUjHLBsrrTbRtdxDiavEaAwA/132', NULL, 1545527287, NULL, NULL, NULL, NULL, 1),
(34, NULL, NULL, 'oad8nxO5BKrSsolV8_XsGr9AX8VM', '龚丹', NULL, NULL, NULL, NULL, NULL, NULL, 2, '', '中国', '', NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/gibph22MlxCWmUpiaReSJG7HGEmEOtsGOEe4aNI9skAyiaKkDMicpRUE1n8HJF1BicJSic4yf6Eqgeicvzd1Wj9MNKZqA/132', NULL, 1545533413, NULL, NULL, NULL, NULL, 1),
(35, NULL, NULL, 'oad8nxLyIfNHrsU3h3mK5a3OdPz4', '陈维', NULL, NULL, NULL, NULL, NULL, NULL, 0, '', '', '', NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/XJgzdIfhDdADCKoiakm7ib10ib2ZQ66fWElKnN4IaZcj2n9icurkBAsxQj85eulwU6G7b1azK0h0F3HGdexdrxOyAQ/132', NULL, 1545533465, NULL, NULL, NULL, NULL, 1),
(36, NULL, NULL, 'oVo9u1Va639spXvaBrpExIi-4QCQ', 'Hello stranger', NULL, NULL, NULL, NULL, NULL, NULL, 1, '万州', '中国', '重庆', NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/6vz8MgZia6XxkOpnrzEMd8QaCKqK2G2pRcW7icjlhoMu6pWfsDKVNVfazmgA9hRTYb2v9YC9UXGlJBq3NL4Kaicicg/132', NULL, 1545556701, NULL, NULL, NULL, NULL, 1),
(37, NULL, NULL, 'oD2DF07nnd-xCKHR2j42FvrKO9fA', '啦啦啦', NULL, NULL, NULL, NULL, NULL, NULL, 0, '', '', '', NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJSEM2Z8wJOIJeTA8QbibZYJQ3o7ibeUPJHXIWQX0fhQBdQVN8zsWtWdLTPKJIrUSquoRQBp5gUUuCg/132', NULL, 1545624219, NULL, NULL, NULL, NULL, 1),
(38, NULL, NULL, 'oOa6J1EODCZ6EzpFVIpDPxqzhzmc', '首合~Mr.yang', NULL, NULL, NULL, NULL, NULL, NULL, 1, '', '中国', '重庆', NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/TZLY8FkTBhTjOYafHTSWDqnh45We5GdfOKt39b1Cmgiba4zKdOPNOMtP1654XYDC70H628VxPKfolMHQPpFqFUw/132', NULL, 1545632546, NULL, NULL, NULL, NULL, 1),
(39, NULL, NULL, 'oVo9u1cwS4fROKRXNBughNeiDH1E', '西南驾培集团团队负责人招募', NULL, NULL, NULL, NULL, NULL, NULL, 1, '合川', '中国', '重庆', NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoic2VBl91Ou4eKMANb5ibR3yqCyl7Yib3Eol7oJbKVSvrEqwXBY4moPU0LVkRP68WbiaQKcscjaVdickA/132', NULL, 1545633239, NULL, NULL, NULL, NULL, 1),
(40, NULL, NULL, 'oOa6J1EU66smLs6OjH4jwlQUU_s8', '心口一人', NULL, NULL, NULL, NULL, NULL, NULL, 1, '沙坪坝', '中国', '重庆', NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/gBoxsJe1o78Zxs9DojSmhKFGEMCst0S7FyH3M5rpSSKUbRCclSDuhibtzCrlKsQPagfeOptpkicJgboyOeaKibX9g/132', NULL, 1545645309, NULL, NULL, NULL, NULL, 1),
(41, NULL, NULL, 'o2l0cwp8SUmK3CZDLtn7vfXvbMHg', 'ceshi10', NULL, NULL, NULL, NULL, NULL, NULL, 2, '', '奥地利', '福拉尔贝格', NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/uRjZ4dVppLUEJ1d7cZDpf0MOIugCzCtbgajuVvbM1HL9earkPVJqyJ8BRB5icb6094iabicFDKsQJLUBlcJ3wvnqg/132', NULL, 1545647160, NULL, NULL, NULL, NULL, 1),
(42, NULL, NULL, 'oOa6J1OP3lOpiZ3Ln9DztrlQfhYo', 'ceshi10', NULL, NULL, NULL, NULL, NULL, NULL, 2, '', '奥地利', '福拉尔贝格', NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/ZpwibbDSUjApZvQD4NGA2uHeuM8Qx4GokVbyToAFBicLQKlZHiaUISgEq0a3kev1oRcUL9ulLJAKOwThxmhvlWmDA/132', NULL, 1545647190, NULL, NULL, NULL, NULL, 1);

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
-- Indexes for table `sent_activity_user`
--
ALTER TABLE `sent_activity_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tel` (`tel`),
  ADD KEY `tel_2` (`tel`);

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
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `sent_develop`
--
ALTER TABLE `sent_develop`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tel` (`tel`),
  ADD KEY `id` (`id`),
  ADD KEY `person` (`person`);

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
-- Indexes for table `sent_msg`
--
ALTER TABLE `sent_msg`
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
  ADD UNIQUE KEY `code` (`code`),
  ADD UNIQUE KEY `mobile` (`mobile`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `sent_picture`
--
ALTER TABLE `sent_picture`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sent_protect`
--
ALTER TABLE `sent_protect`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tel` (`tel`),
  ADD KEY `person` (`person`),
  ADD KEY `deactivation_time` (`deactivation_time`),
  ADD KEY `protect_time` (`protect_time`),
  ADD KEY `deal_time` (`deal_time`);

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
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=204;
--
-- AUTO_INCREMENT for table `sent_activity`
--
ALTER TABLE `sent_activity`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `sent_activity_user`
--
ALTER TABLE `sent_activity_user`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=194;
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
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=81;
--
-- AUTO_INCREMENT for table `sent_area`
--
ALTER TABLE `sent_area`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
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
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `sent_auth_group_detail`
--
ALTER TABLE `sent_auth_group_detail`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=73;
--
-- AUTO_INCREMENT for table `sent_auth_rule`
--
ALTER TABLE `sent_auth_rule`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',AUTO_INCREMENT=114;
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
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=87;
--
-- AUTO_INCREMENT for table `sent_config`
--
ALTER TABLE `sent_config`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `sent_coupon`
--
ALTER TABLE `sent_coupon`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `sent_department`
--
ALTER TABLE `sent_department`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '部门ID',AUTO_INCREMENT=496;
--
-- AUTO_INCREMENT for table `sent_develop`
--
ALTER TABLE `sent_develop`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `sent_district`
--
ALTER TABLE `sent_district`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=45052;
--
-- AUTO_INCREMENT for table `sent_document`
--
ALTER TABLE `sent_document`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',AUTO_INCREMENT=287;
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
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `sent_file`
--
ALTER TABLE `sent_file`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件ID';
--
-- AUTO_INCREMENT for table `sent_grade`
--
ALTER TABLE `sent_grade`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
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
  MODIFY `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',AUTO_INCREMENT=16;
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
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',AUTO_INCREMENT=69;
--
-- AUTO_INCREMENT for table `sent_model`
--
ALTER TABLE `sent_model`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模型ID',AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `sent_msg`
--
ALTER TABLE `sent_msg`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=312;
--
-- AUTO_INCREMENT for table `sent_outfit`
--
ALTER TABLE `sent_outfit`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `sent_page`
--
ALTER TABLE `sent_page`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=98;
--
-- AUTO_INCREMENT for table `sent_partner`
--
ALTER TABLE `sent_partner`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sent_person`
--
ALTER TABLE `sent_person`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID';
--
-- AUTO_INCREMENT for table `sent_picture`
--
ALTER TABLE `sent_picture`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',AUTO_INCREMENT=336;
--
-- AUTO_INCREMENT for table `sent_protect`
--
ALTER TABLE `sent_protect`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `sent_rewrite`
--
ALTER TABLE `sent_rewrite`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增';
--
-- AUTO_INCREMENT for table `sent_school`
--
ALTER TABLE `sent_school`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
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
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=55;
--
-- AUTO_INCREMENT for table `sent_test`
--
ALTER TABLE `sent_test`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=97;
--
-- AUTO_INCREMENT for table `sent_wx_user`
--
ALTER TABLE `sent_wx_user`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=43;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
