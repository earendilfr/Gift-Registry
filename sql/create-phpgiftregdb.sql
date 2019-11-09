

CREATE TABLE `allocs` (
  `itemid` int(11) NOT NULL DEFAULT 0,
  `userid` int(11) NOT NULL DEFAULT 0,
  `bought` tinyint(1) NOT NULL DEFAULT 0,
  `quantity` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`itemid`,`userid`,`bought`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



CREATE TABLE `categories` (
  `categoryid` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`categoryid`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

INSERT INTO `categories` VALUES (1,'Books');
INSERT INTO `categories` VALUES (2,'Music');
INSERT INTO `categories` VALUES (3,'Video Games');
INSERT INTO `categories` VALUES (4,'Clothing');
INSERT INTO `categories` VALUES (5,'Movies/DVD');
INSERT INTO `categories` VALUES (6,'Gift Certificates');
INSERT INTO `categories` VALUES (7,'Hobbies');
INSERT INTO `categories` VALUES (8,'Household');
INSERT INTO `categories` VALUES (9,'Electronics');
INSERT INTO `categories` VALUES (10,'Ornaments/Figurines');
INSERT INTO `categories` VALUES (11,'Automotive');
INSERT INTO `categories` VALUES (12,'Toys');
INSERT INTO `categories` VALUES (13,'Jewellery');
INSERT INTO `categories` VALUES (14,'Computer');
INSERT INTO `categories` VALUES (15,'Games');
INSERT INTO `categories` VALUES (16,'Tools');


CREATE TABLE `events` (
  `eventid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `description` varchar(100) NOT NULL DEFAULT '',
  `eventdate` date NOT NULL DEFAULT '0000-00-00',
  `recurring` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`eventid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `events` VALUES (1,NULL,'Christmas','2000-12-25',1);


CREATE TABLE `items` (
  `itemid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL DEFAULT 0,
  `create_userid` int(11) NOT NULL DEFAULT 0,
  `description` varchar(255) NOT NULL DEFAULT '',
  `visible_owner` tinyint(1) DEFAULT 0,
  `price` decimal(7,2) DEFAULT NULL,
  `source` varchar(255) NOT NULL DEFAULT '',
  `ranking` int(11) NOT NULL DEFAULT 0,
  `url` varchar(255) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `image_filename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`itemid`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;



CREATE TABLE `messages` (
  `messageid` int(11) NOT NULL AUTO_INCREMENT,
  `sender` int(11) NOT NULL DEFAULT 0,
  `recipient` int(11) NOT NULL DEFAULT 0,
  `message` varchar(255) NOT NULL DEFAULT '',
  `isread` tinyint(1) NOT NULL DEFAULT 0,
  `created` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`messageid`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;



CREATE TABLE `ranks` (
  `ranking` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL DEFAULT '',
  `rendered` varchar(255) NOT NULL DEFAULT '',
  `rankorder` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ranking`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

INSERT INTO `ranks` VALUES (1,'1 - Wouldn\'t mind it','<img src=\"images/star_on.gif\" alt=\"*\"><img src=\"images/star_off.gif\" alt=\"\"><img src=\"images/star_off.gif\" alt=\"\"><img src=\"images/star_off.gif\" alt=\"\"><img src=\"images/star_off.gif\" alt=\"\">',1);
INSERT INTO `ranks` VALUES (2,'2 - Would be nice to have','<img src=\"images/star_on.gif\" alt=\"*\"><img src=\"images/star_on.gif\" alt=\"*\"><img src=\"images/star_off.gif\" alt=\"\"><img src=\"images/star_off.gif\" alt=\"\"><img src=\"images/star_off.gif\" alt=\"\">',2);
INSERT INTO `ranks` VALUES (3,'3 - Would make me happy','<img src=\"images/star_on.gif\" alt=\"*\"><img src=\"images/star_on.gif\" alt=\"*\"><img src=\"images/star_on.gif\" alt=\"*\"><img src=\"images/star_off.gif\" alt=\"\"><img src=\"images/star_off.gif\" alt=\"\">',3);
INSERT INTO `ranks` VALUES (4,'4 - I would really, really like this','<img src=\"images/star_on.gif\" alt=\"*\"><img src=\"images/star_on.gif\" alt=\"*\"><img src=\"images/star_on.gif\" alt=\"*\"><img src=\"images/star_on.gif\" alt=\"*\"><img src=\"images/star_off.gif\" alt=\"\">',4);
INSERT INTO `ranks` VALUES (5,'5 - I\'d love to get this','<img src=\"images/star_on.gif\" alt=\"*\"><img src=\"images/star_on.gif\" alt=\"*\"><img src=\"images/star_on.gif\" alt=\"*\"><img src=\"images/star_on.gif\" alt=\"*\"><img src=\"images/star_on.gif\" alt=\"*\">',5);


CREATE TABLE `shoppers` (
  `shopper` int(11) NOT NULL DEFAULT 0,
  `mayshopfor` int(11) NOT NULL DEFAULT 0,
  `pending` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`shopper`,`mayshopfor`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



CREATE TABLE `families` (
  `familyid` int(11) NOT NULL AUTO_INCREMENT,
  `familyname` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`familyid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;



CREATE TABLE `users` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(50) NOT NULL DEFAULT '',
  `fullname` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(255) DEFAULT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT 0,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `email_msgs` tinyint(1) NOT NULL DEFAULT 0,
  `list_stamp` datetime DEFAULT NULL,
  `initialfamilyid` int(11) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;



CREATE TABLE `memberships` (
  `userid` int(11) NOT NULL DEFAULT 0,
  `familyid` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`userid`,`familyid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



CREATE TABLE `subscriptions` (
  `publisher` int(11) NOT NULL,
  `subscriber` int(11) NOT NULL,
  `last_notified` datetime DEFAULT NULL,
  PRIMARY KEY (`publisher`,`subscriber`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

