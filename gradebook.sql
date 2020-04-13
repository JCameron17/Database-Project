DROP TABLE IF EXISTS `STUDENTS`;
CREATE TABLE `STUDENTS` (
    `StudentID` int(11) NOT NULL AUTO_INCREMENT,
    `FirstName` varchar(255) DEFAULT NULL,
    `LastName` varchar(255) DEFAULT NULL,
    `Major` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`StudentID`)
);

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
 
DROP TABLE IF EXISTS `ENROLLMENT`;
CREATE TABLE `ENROLLMENT` (
  `StudentID` int(11) NOT NULL,
  `CourseID` int(11) NOT NULL,
  PRIMARY KEY (StudentID, CourseID)
);
 
DROP TABLE IF EXISTS `DISTRIBUTION`;
CREATE TABLE `DISTRIBUTION` (
  `DistribID` int(11) NOT NULL AUTO_INCREMENT,
  `CourseID` int(11) DEFAULT NULL,
  `Type` varchar(255) DEFAULT NULL,
  `Percent` int(3) DEFAULT NULL,
  PRIMARY KEY (`DistribID`),
  FOREIGN KEY (`CourseID`) REFERENCES Courses(CourseID)
);

DROP TABLE IF EXISTS `ASSIGNMENTS`;
CREATE TABLE `ASSIGNMENTS` (
  `AssignID` int(11) NOT NULL AUTO_INCREMENT,
  `DistribID` int(11) DEFAULT NULL,
  `Instance` int(11) DEFAULT NULL,
  `MaxPoints` int(3) DEFAULT NULL,
  PRIMARY KEY (`AssignID`),
  FOREIGN KEY (`DistribID`) REFERENCES Distribution(DistribID)
);

 DROP TABLE IF EXISTS `ENROLLMENT`;
 CREATE TABLE `ENROLLMENT` (
   `StudentID` int(11) NOT NULL,
   `CourseID` int(11) NOT NULL,
   PRIMARY KEY (StudentID, CourseID),
   FOREIGN KEY (`StudentID`) REFERENCES Students(StudentID),
   FOREIGN KEY (`CourseID`) REFERENCES Courses(CourseID)
);

 DROP TABLE IF EXISTS `STUDENTGRADES`;
 CREATE TABLE `STUDENTGRADES` (
   `StudentID` int(11) NOT NULL,
   `AssignID` int(11) NOT NULL,
   PRIMARY KEY (StudentID, AssignID),
   FOREIGN KEY (`StudentID`) REFERENCES Students(StudentID),
   FOREIGN KEY (`AssignID`) REFERENCES Assignments(AssignID)
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
('Duke', 'Ellington', 'Computer Science'),
('Mae', 'Jemison', 'Computer Science'),
('Zora', 'Hurston', 'Computer Science'),
('Toni', 'Morrison', 'Computer Science'),
('Ida', 'Wells', 'Computer Science'), 
('Alain', 'Locke', 'Computer Science');

/* COURSE INFORMATION */
INSERT INTO `COURSES` (CourseID, CourseName, Department, CourseNumber, Semester, SchoolYear)
VALUES (CourseID, 'Database Systems', 'CSCI', '432', 'Spring', 2020),
(CourseID, 'Computer Science II', 'CSCI', '136', 'Spring', 2020),
(CourseID, 'Software Engineering', 'CSCI', '375', 'Fall', 2019),
(CourseID, 'Intro to Linear Algebra', 'MATH', '001', 'Spring', 2020),
(CourseID, 'Spanish I', 'SPAN', '001', 'Fall', 2019),
(CourseID, 'Education in Black America', 'AFRO', '122', 'Fall', 2019),
(CourseID, 'Black Women in America', 'AFRO', '185', 'Fall', 2019),
(CourseID, 'Classical Mythology', 'CLAS', '109', 'Fall', 2019),
(CourseID, 'Intro Black Diaspora I', 'HIST', '005', 'Spring', 2020),
(CourseID, 'Organic Chemistry II', 'CHEM', '142', 'Spring', 2020);

/* DISTRIBUTION INFORMATION */
INSERT INTO `DISTRIBUTION` (DistribID, CourseID, Type, Percent)
VALUES (DistribID, CourseID, 'Participation', 10),
(DistribID, CourseID, 'Homework', 20),
(DistribID, CourseID, 'Tests', 50),
(DistribID, CourseID, 'Projects', 20);

/* ASSIGNMENT INFORMATION */
INSERT INTO `ASSIGNMENTS` (AssignID, DistribID, Instance, MaxPoints)
VALUES (AssignID, DistribID, 1, 100);

/* ASSIGNMENT INFORMATION */
INSERT INTO `ENROLLMENT` (StudentID, CourseID)
VALUES (1,2),(1,4),(1,7),(2,2),(2,6),(2,8),(3,1),(3,8),(3,9),
(4,4),(4,5),(4,8),(5,1),(5,3),(5,10),(6,3),(6,6),(6,9),
(7,3),(7,4),(7,8),(8,2),(9,5),(9,6),(9,10),
(10,3),(10,4),(10,5),(11,1),(11,7),(11,9),(12,2),(12,5),(12,10),
(13,2),(13,6),(13,7),(14,1),(14,7),(14,8),(15,2),(15,5),(15,10);
