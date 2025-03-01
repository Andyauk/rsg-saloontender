DROP TABLE IF EXISTS `saloontender_stock`;
CREATE TABLE IF NOT EXISTS `saloontender_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `saloontender` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `item` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `saloontender_shop`;
CREATE TABLE IF NOT EXISTS `saloontender_shop` (
  `shopid` varchar(255) NOT NULL,
  `jobaccess` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `displayname` varchar(255) NOT NULL,
  `money` double(11,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`shopid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `saloontender_shop` (`shopid`, `jobaccess`, `displayname`, `money`) VALUES
('valsaloonshop', 'valsaloontender', 'Valentine Saloon', 0),
('blasaloonshop', 'blasaloontender', 'Blackwater Saloon', 0),
('rhosaloonshop', 'rhosaloontender', 'Rhodes Saloon', 0),
('stdenissaloonshop1', 'stdenissaloontender1', 'Saint Denis Saloon', 0),
('stdenissaloonshop2', 'stdenissaloontender2', 'Saint Denis Saloon', 0),
('vansaloonshop', 'vansaloontender', 'Van Horn Saloon', 0),
('armsaloonshop', 'armsaloontender', 'Armadillo Saloon', 0),
('tumsaloonshop', 'tumsaloontender', 'Tumbleweed Saloon', 0);

DROP TABLE IF EXISTS `saloontendershop_stock`;
CREATE TABLE `saloontendershop_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shopid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `items` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `price` double(11,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
