DROP TABLE IF EXISTS `STUDENT`;
CREATE TABLE `STUDENT` (
    `FirstName` varchar(255) DEFAULT NULL,
    `LastName` varchar(255) DEFAULT NULL,
    `Major` varchar(255) DEFAULT NULL,
    `StudentID` int(11) NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (`StudentID`)
) ENGINE=InnoDB;
