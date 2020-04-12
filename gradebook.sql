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
 
/* STUDENT INFORMATION */
INSERT INTO `STUDENTS` (FirstName, LastName, Major)
VALUES ('Harriet', 'Tubman', 'Computer Science');
INSERT INTO `STUDENTS` (FirstName, LastName, Major)
VALUES ('Langston', 'Hughes', 'Computer Science');
INSERT INTO `STUDENTS` (FirstName, LastName, Major)
VALUES ('Fredrick', 'Douglass', 'Computer Science');
INSERT INTO `STUDENTS` (FirstName, LastName, Major)
VALUES ('Michael', 'Jackson', 'Computer Science');
INSERT INTO `STUDENTS` (FirstName, LastName, Major)
VALUES ('Janet', 'Jackson', 'Computer Science');
INSERT INTO `STUDENTS` (FirstName, LastName, Major)
VALUES ('George', 'Carver', 'Computer Science');
INSERT INTO `STUDENTS` (FirstName, LastName, Major)
VALUES ('Maya', 'Angelou', 'Computer Science');
INSERT INTO `STUDENTS` (FirstName, LastName, Major)
VALUES ('Shirley', 'Chisholm', 'Computer Science');
INSERT INTO `STUDENTS` (FirstName, LastName, Major)
VALUES ('Martin', 'King', 'Computer Science');
INSERT INTO `STUDENTS` (FirstName, LastName, Major)
VALUES ('Duke', 'Ellington', 'Computer Science');
INSERT INTO `STUDENTS` (FirstName, LastName, Major)
VALUES ('Mae', 'Jemison', 'Computer Science');
INSERT INTO `STUDENTS` (FirstName, LastName, Major)
VALUES ('Zora', 'Hurston', 'Computer Science');
INSERT INTO `STUDENTS` (FirstName, LastName, Major)
VALUES ('Toni', 'Morrison', 'Computer Science');
INSERT INTO `STUDENTS` (FirstName, LastName, Major)
VALUES ('Ida', 'Wells', 'Computer Science');
INSERT INTO `STUDENTS` (FirstName, LastName, Major)
VALUES ('Alain', 'Locke', 'Computer Science');

/* COURSE INFORMATION */
INSERT INTO `COURSES` (CourseID, CourseName, Department, CourseNumber, Semester, SchoolYear)
VALUES (CourseID, 'Database Systems', 'CSCI', '432', 'Spring', 2020);
INSERT INTO `COURSES` (CourseID, CourseName, Department, CourseNumber, Semester, SchoolYear)
VALUES (CourseID, 'Computer Science II', 'CSCI', '136', 'Spring', 2020);
INSERT INTO `COURSES` (CourseID, CourseName, Department, CourseNumber, Semester, SchoolYear)
VALUES (CourseID, 'Software Engineering', 'CSCI', '375', 'Fall', 2019);
INSERT INTO `COURSES` (CourseID, CourseName, Department, CourseNumber, Semester, SchoolYear)
VALUES (CourseID, 'Intro to Linear Algebra', 'MATH', '001', 'Spring', 2020);
INSERT INTO `COURSES` (CourseID, CourseName, Department, CourseNumber, Semester, SchoolYear)
VALUES (CourseID, 'Spanish I', 'SPAN', '001', 'Fall', 2019);
