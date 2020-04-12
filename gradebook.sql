DROP TABLE IF EXISTS `STUDENT`;
CREATE TABLE `STUDENT` (
    `StudentID` int(11) NOT NULL AUTO_INCREMENT,
    `FirstName` varchar(255) DEFAULT NULL,
    `LastName` varchar(255) DEFAULT NULL,
    `Major` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`StudentID`)
) ENGINE=InnoDB;

INSERT INTO `STUDENT` (FirstName, LastName, Major)
VALUES ('Harriet', 'Tubman', 'Computer Science');
INSERT INTO `STUDENT` (FirstName, LastName, Major)
VALUES ('Langston', 'Hughes', 'Computer Science');
INSERT INTO `STUDENT` (FirstName, LastName, Major)
VALUES ('Fredrick', 'Douglass', 'Computer Science');
INSERT INTO `STUDENT` (FirstName, LastName, Major)
VALUES ('Michael', 'Jackson', 'Computer Science');
INSERT INTO `STUDENT` (FirstName, LastName, Major)
VALUES ('Janet', 'Jackson', 'Computer Science');
INSERT INTO `STUDENT` (FirstName, LastName, Major)
VALUES ('George', 'Carver', 'Computer Science');
INSERT INTO `STUDENT` (FirstName, LastName, Major)
VALUES ('Maya', 'Angelou', 'Computer Science');
INSERT INTO `STUDENT` (FirstName, LastName, Major)
VALUES ('Shirley', 'Chisholm', 'Computer Science');
INSERT INTO `STUDENT` (FirstName, LastName, Major)
VALUES ('Martin', 'King', 'Computer Science');
INSERT INTO `STUDENT` (FirstName, LastName, Major)
VALUES ('Duke', 'Ellington', 'Computer Science');
INSERT INTO `STUDENT` (FirstName, LastName, Major)
VALUES ('Mae', 'Jemison', 'Computer Science');
INSERT INTO `STUDENT` (FirstName, LastName, Major)
VALUES ('Zora', 'Hurston', 'Computer Science');
INSERT INTO `STUDENT` (FirstName, LastName, Major)
VALUES ('Toni', 'Morrison', 'Computer Science');
INSERT INTO `STUDENT` (FirstName, LastName, Major)
VALUES ('Ida', 'Wells', 'Computer Science');
INSERT INTO `STUDENT` (FirstName, LastName, Major)
VALUES ('Alain', 'Locke', 'Computer Science');

COMMIT;
