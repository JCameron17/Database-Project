/* STUDENT TABLE CREATION */
DROP TABLE IF EXISTS `STUDENTS`;
CREATE TABLE `STUDENTS` (
    `StudentID` int(11) NOT NULL AUTO_INCREMENT,
    `FirstName` varchar(255) DEFAULT NULL,
    `LastName` varchar(255) DEFAULT NULL,
    `Major` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`StudentID`)
);

/* STUDENT INFORMATION */
INSERT INTO `STUDENTS` (FirstName, LastName, Major)
VALUES ('Harriet', 'Tubman', 'Computer Science'),
('Langston', 'Hughes', 'Computer Science'),
('Fredrick', 'Douglass', 'Computer Science'),
('Michael', 'Jackson', 'Computer Science'),
('Janet', 'Jackson', 'Computer Science'),
('George', 'Carver', 'Computer Science'),
('Maya', 'Angelou', 'Computer Science'),
('Shirley', 'Chisholm', 'Computer Science'),
('Martin', 'King', 'Computer Science'),
('Duke', 'Ellington', 'Computer Science');

/* COURSES TABLE CREATION */
DROP TABLE IF EXISTS `COURSES`; 
CREATE TABLE `COURSES` (
    `CourseID` int(11) NOT NULL AUTO_INCREMENT,
    `CourseName` varchar(255) DEFAULT NULL,
    `Department` varchar(255) DEFAULT NULL,
    `CourseNumber` varchar(255) DEFAULT NULL,
    `Semester` varchar(255) DEFAULT NULL,
    `SchoolYear` int(4) DEFAULT NULL,
    PRIMARY KEY (`CourseID`)
 );
 
 /* COURSE INFORMATION */
INSERT INTO `COURSES` (CourseID, CourseName, Department, CourseNumber, Semester, SchoolYear)
VALUES (CourseID, 'Database Systems', 'CSCI', '432', 'Spring', 2020),
(CourseID, 'Computer Science II', 'CSCI', '136', 'Spring', 2020),
(CourseID, 'Software Engineering', 'CSCI', '375', 'Fall', 2019),
(CourseID, 'Intro to Linear Algebra', 'MATH', '001', 'Spring', 2020),
(CourseID, 'Spanish I', 'SPAN', '001', 'Fall', 2019);

/* ENROLLMENT TABLE CREATION */
DROP TABLE IF EXISTS `ENROLLMENT`;
CREATE TABLE `ENROLLMENT` (
  `StudentID` int(11) NOT NULL,
  `CourseID` int(11) NOT NULL,
  PRIMARY KEY (StudentID, CourseID)
);

/* ENROLLMENT INFORMATION */
INSERT INTO `ENROLLMENT` (StudentID, CourseID)
VALUES (1,2),(1,4),(1,3),(2,2),(2,3),(2,1),(3,1),(3,4),(3,2),
(4,4),(4,5),(4,1),(5,1),(5,3),(5,2),(6,5),(6,4),(6,1),
(7,3),(7,4),(7,5),(8,2),(8,3),(8,5),(9,5),(9,1),(9,2),
(10,3),(10,4),(10,5);

/* DISTRIBUTION TABLE CREATION */
DROP TABLE IF EXISTS `DISTRIBUTION`;
CREATE TABLE `DISTRIBUTION` (
  `DistribID` int(11) NOT NULL AUTO_INCREMENT,
  `CourseID` int(11) DEFAULT NULL,
  `Type` varchar(255) DEFAULT NULL,
  `Percent` int(3) DEFAULT NULL,
  PRIMARY KEY (`DistribID`),
  FOREIGN KEY (`CourseID`) REFERENCES COURSES(CourseID)
);

/* DISTRIBUTION INFORMATION */
INSERT INTO `DISTRIBUTION` (DistribID, CourseID, Type, Percent)
VALUES (DistribID, CourseID, 'Participation', 10),
(DistribID, CourseID, 'Homework', 20),
(DistribID, CourseID, 'Tests', 50),
(DistribID, CourseID, 'Projects', 20);

INSERT INTO `DISTRIBUTION` VALUES(DistribID, 1, 'Participation', 50);
INSERT INTO `DISTRIBUTION` VALUES(DistribID, 1, 'Homework', 10);
INSERT INTO `DISTRIBUTION` VALUES(DistribID, 1, 'Tests', 20);
INSERT INTO `DISTRIBUTION` VALUES(DistribID, 1, 'Projects', 20);
INSERT INTO `DISTRIBUTION` VALUES(DistribID, 2, 'Participation', 30);
INSERT INTO `DISTRIBUTION` VALUES(DistribID, 2, 'Homework', 30);
INSERT INTO `DISTRIBUTION` VALUES(DistribID, 2, 'Tests', 20);
INSERT INTO `DISTRIBUTION` VALUES(DistribID, 2, 'Projects', 20);
INSERT INTO `DISTRIBUTION` VALUES(DistribID, 3, 'Participation', 10);
INSERT INTO `DISTRIBUTION` VALUES(DistribID, 3, 'Homework', 30);
INSERT INTO `DISTRIBUTION` VALUES(DistribID, 3, 'Tests', 20);
INSERT INTO `DISTRIBUTION` VALUES(DistribID, 3, 'Projects', 40);
INSERT INTO `DISTRIBUTION` VALUES(DistribID, 4, 'Participation', 15);
INSERT INTO `DISTRIBUTION` VALUES(DistribID, 4, 'Homework', 35);
INSERT INTO `DISTRIBUTION` VALUES(DistribID, 4, 'Tests', 30);
INSERT INTO `DISTRIBUTION` VALUES(DistribID, 4, 'Projects', 20);
INSERT INTO `DISTRIBUTION` VALUES(DistribID, 5, 'Participation', 10);
INSERT INTO `DISTRIBUTION` VALUES(DistribID, 5, 'Homework', 20);
INSERT INTO `DISTRIBUTION` VALUES(DistribID, 5, 'Tests', 40);
INSERT INTO `DISTRIBUTION` VALUES(DistribID, 5, 'Projects', 30);

/* ASSIGNMENT TABLE CREATION */
DROP TABLE IF EXISTS `ASSIGNMENTS`;
CREATE TABLE `ASSIGNMENTS` (
  `AssignID` int(11) NOT NULL AUTO_INCREMENT,
  `DistribID` int(11) DEFAULT NULL,
  `Instance` int(11) DEFAULT NULL,
  `MaxPoints` int(3) DEFAULT NULL,
  PRIMARY KEY (`AssignID`),
  FOREIGN KEY (`DistribID`) REFERENCES DISTRIBUTION(DistribID)
);

/* ASSIGNMENT INFORMATION */
INSERT INTO `ASSIGNMENTS` (AssignID, DistribID, Instance, MaxPoints)
VALUES (AssignID, DistribID, 1, 100);

INSERT INTO `ASSIGNMENTS` VALUES(AssignID, 1, 1, 100),
(AssignID, 2, 1, 100),
(AssignID, 3, 1, 100),
(AssignID, 4, 1, 100),
(AssignID, 5, 1, 100),
(AssignID, 6, 1, 100),
(AssignID, 7, 1, 100),
(AssignID, 8, 1, 100),
(AssignID, 9, 1, 100),
(AssignID, 10, 1, 100),
(AssignID, 11, 1, 100),
(AssignID, 12, 1, 100),
(AssignID, 13, 1, 100),
(AssignID, 14, 1, 100),
(AssignID, 15, 1, 100),
(AssignID, 16, 1, 100),
(AssignID, 17, 1, 100),
(AssignID, 18, 1, 100),
(AssignID, 19, 1, 100),
(AssignID, 20, 1, 100);


/* STUDENTGRADES TABLE CREATION */
DROP TABLE IF EXISTS `STUDENTGRADES`;
CREATE TABLE `STUDENTGRADES` (
    `StudentID` int(11) NOT NULL,
    `AssignID` int(11) NOT NULL,
    `POINTS` int(11) DEFAULT 0 NOT NULL,
    PRIMARY KEY (StudentID, AssignID),
    FOREIGN KEY (`StudentID`) REFERENCES STUDENTS(StudentID),
    FOREIGN KEY (`AssignID`) REFERENCES ASSIGNMENTS(AssignID)
);

INSERT INTO `STUDENTGRADES` VALUES (1, 5, 85), (1, 6, 90), (1, 7, 90), (1, 8, 90),
(1, 9, 71), (1, 10, 88), (1, 11, 95), (1, 12, 76), (1, 13, 68), (1, 14, 87), (1, 15, 97), (1, 16, 95), 

(2, 1, 87), (2, 2, 78), (2, 3, 75), (2, 4, 90), (2, 5, 94), (2, 6, 74), (2, 7, 93), (2, 8, 83), (2, 9, 93), (2, 10, 74), 
(2, 11, 92), (2, 12, 90),

(3, 1, 94), (3, 2, 92), (3, 3, 91), (3, 4, 90), (3, 5, 93), (3, 6, 82), (3, 7, 95), (3, 8, 83), (3, 13, 73),
(3, 14, 90), (3, 15, 90), (3, 16, 90),

(4, 1, 74), (4, 2, 83), (4, 3, 90), (4, 4, 90), (4, 13, 90), (4, 14, 90), (4, 15, 90), (4, 16, 90), (4, 17, 90),
(4, 18, 90), (4, 19, 90), (4, 20, 90),

(5, 1, 73), (5, 2, 90), (5, 3, 94), (5, 4, 86), (5, 5, 83), (5, 6, 90), (5, 7, 92), (5, 8, 76), (5, 9, 94),
(5, 10, 83), (5, 11, 83), (5, 12, 74),

