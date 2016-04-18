

CREATE TABLE IF NOT EXISTS `application_users` (
  `username` varchar(250) NOT NULL DEFAULT '',
  `password` varchar(250) DEFAULT NULL,
  `enabled` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`username`)
) ;

INSERT INTO `application_users` (`username`, `password`, `enabled`) VALUES
('ali', 'ali', 1),
('salah', 'salah', 1),
('ammar', 'ammar', 1),
('rafik', 'rafik', 1),
('nizar', 'nizar', 1);



CREATE TABLE IF NOT EXISTS `application_users_roles` (
  `user_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(250) DEFAULT NULL,
  `role` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`user_role_id`),
  UNIQUE KEY `uni_username_role` (`role`,`username`),
  KEY `fk_username_idx` (`username`)
)  ;



INSERT INTO `application_users_roles` (`user_role_id`, `username`, `role`) VALUES
(2, 'ammar', 'HumarRessourceServiceRole'),
(4, 'nizar', 'MaintenanceServiceRole'),
(5, 'ali', 'ProductionServiceRole'),
(87, 'rafik', 'AdminRole');



