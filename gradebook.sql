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

/* STUDENTGRADES TABLE CREATION */
DROP TABLE IF EXISTS `STUDENTGRADES`;
CREATE TABLE `STUDENTGRADES` (
    `StudentID` int(11) NOT NULL,
    `AssignID` int(11) NOT NULL,
    PRIMARY KEY (StudentID, AssignID),
    FOREIGN KEY (`StudentID`) REFERENCES STUDENTS(StudentID),
    FOREIGN KEY (`AssignID`) REFERENCES ASSIGNMENTS(AssignID)
);
