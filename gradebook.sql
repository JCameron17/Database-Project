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
('George', 'Quincy', 'Computer Science'),
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
VALUES (DistribID, 1, 'Participation', 50),(DistribID, 1, 'Homework', 10),(DistribID, 1, 'Tests', 20),(DistribID, 1, 'Projects', 20),
(DistribID, 2, 'Participation', 30),(DistribID, 2, 'Homework', 30),(DistribID, 2, 'Tests', 20),(DistribID, 2, 'Projects', 20),
(DistribID, 3, 'Participation', 10),(DistribID, 3, 'Homework', 30),(DistribID, 3, 'Tests', 20),(DistribID, 3, 'Projects', 40),
(DistribID, 4, 'Participation', 15),(DistribID, 4, 'Homework', 35),(DistribID, 4, 'Tests', 30),(DistribID, 4, 'Projects', 20),
(DistribID, 5, 'Participation', 10),(DistribID, 5, 'Homework', 20),(DistribID, 5, 'Tests', 40),(DistribID, 5, 'Projects', 30);

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
VALUES (AssignID, 1, 1, 100),(AssignID, 2, 3, 100),(AssignID, 3, 2, 100),(AssignID, 4, 1, 100),
(AssignID, 5, 1, 100),(AssignID, 6, 5, 100),(AssignID, 7, 2, 100),(AssignID, 8, 2, 100),
(AssignID, 9, 1, 100),(AssignID, 10, 2, 100),(AssignID, 11, 1, 100),(AssignID, 12, 1, 100),
(AssignID, 13, 1, 100),(AssignID, 14, 1, 100),(AssignID, 15, 1, 100),(AssignID, 16, 2, 100),
(AssignID, 17, 1, 100),(AssignID, 18, 1, 100),(AssignID, 19, 1, 100),(AssignID, 20, 1, 100);

/* SCORE TABLE CREATION */
DROP TABLE IF EXISTS `SCORE`;
CREATE TABLE `SCORE` (
    `StudentID` int(11) NOT NULL,
    `AssignID` int(11) NOT NULL,
  	`Points` int(11) DEFAULT 0 NOT NULL,
    PRIMARY KEY (StudentID, AssignID),
    FOREIGN KEY (`StudentID`) REFERENCES STUDENTS(StudentID),
    FOREIGN KEY (`AssignID`) REFERENCES ASSIGNMENTS(AssignID)
);

INSERT INTO `SCORE` (StudentID, AssignID, Points)
VALUES (1, 6, 90), (1, 7, 90), (1, 8, 90),(1, 9, 71), (1, 10, 88), (1, 11, 95), (1, 12, 76), (1, 13, 68), (1, 14, 87), (1, 15, 97), (1, 16, 95),
(2, 1, 87), (2, 2, 78), (2, 3, 75), (2, 4, 90), (2, 5, 94), (2, 6, 74), (2, 7, 93), (2, 8, 83), (2, 9, 93), (2, 10, 74), (2, 11, 92), (2, 12, 90),
(3, 1, 94), (3, 2, 92), (3, 3, 91), (3, 4, 90), (3, 5, 93), (3, 6, 82), (3, 7, 95), (3, 8, 83), (3, 13, 73), (3, 14, 90), (3, 15, 90), (3, 16, 90),
(4, 1, 74), (4, 2, 83), (4, 3, 90), (4, 4, 96), (4, 13, 78), (4, 14, 89), (4, 15, 76), (4, 16, 50), (4, 17, 97), (4, 18, 76), (4, 19, 98), (4, 20, 94),
(5, 1, 73), (5, 2, 90), (5, 3, 94), (5, 4, 86), (5, 5, 83), (5, 6, 90), (5, 7, 92), (5, 8, 76), (5, 9, 94), (5, 10, 83), (5, 11, 83), (5, 12, 74),
(6, 1, 77), (6, 2, 88), (6, 3, 95), (6, 4, 93), (6, 13, 93), (6, 14, 97), (6, 15, 92), (6, 16, 88), (6, 17, 86), (6, 18, 85), (6, 19, 93), (6, 20, 94),
(7, 9, 88), (7, 10, 94), (7, 11, 76), (7, 12, 89), (7, 13, 93), (7, 14, 92), (7, 15, 84), (7, 16, 73), (7, 17, 98), (7, 18, 89), (7, 19, 93), (7, 20, 89), (8, 5, 89), (8, 6, 93), (8, 7, 83), (8, 8, 92), (8, 9, 82), (8, 10, 67), (8, 11, 93), (8, 12, 93), (8, 17, 85), (8, 18, 89), (8, 19, 83), (8, 20, 89),
(9, 1, 89), (9, 2, 83), (9, 3, 84), (9, 4, 93), (9, 5, 73), (9, 6, 72), (9, 7, 74), (9, 8, 84), (9, 17, 72), (9, 18, 93), (9, 19, 88), (9, 20, 83), (10, 9, 82), (10, 10, 92), (10, 11, 74), (10, 12, 84), (10, 13, 98), (10, 14, 97), (10, 15, 81), (10, 16, 73), (10, 17, 99), (10, 18, 81), (10, 19, 97), (10, 20, 85);
