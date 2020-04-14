select * from `DISTRIBUTION`;
select * from `COURSES`;

-- query: distribution by course
select COURSES.CourseName, Type, Percent  from `DISTRIBUTION`, `COURSES`
where (COURSES.courseID = DISTRIBUTION.CourseID)
order by CourseName;

-- query: assignments by distribution
select AssignID, COURSES.CourseName, Instance, MaxPoints, DISTRIBUTION.Type
from `ASSIGNMENTS`
left join `DISTRIBUTION` on (DISTRIBUTION.distribID = ASSIGNMENTS.distribID)
left join `COURSES` on (COURSES.CourseID = DISTRIBUTION.courseID);

-- query: student grades by assignment
select SCORE.AssignID, SCORE.StudentID, FirstName, LastName, Points, MaxPoints, Instance
from `SCORE`
right JOIN `ASSIGNMENTS` ON (ASSIGNMENTS.AssignID = SCORE.AssignID)
LEFT JOIN `STUDENTS` ON (STUDENTS.StudentID = SCORE.StudentID);

-- #4 query: Compute the average/highest/lowest score of an assignment
select a.AssignID, a.MaxPoints, avg(s.POINTS) AS PointAVG, max(s.POINTS) AS BestScore, min(s.POINTS) AS WorstScore
from ASSIGNMENTS a, SCORE s
where a.AssignID=2 AND s.AssignID=a.AssignID;

-- #5 query: List all of the students in a given course
select LastName, FirstName, CourseName from `ENROLLMENT`
inner join `STUDENTS` on (STUDENTS.StudentID = ENROLLMENT.StudentID)
inner join `COURSES` on (COURSES.CourseID = ENROLLMENT.CourseID) where (COURSES.CourseID = 2)
-- feel free to change the CourseID to get the student list for the other courses
order by LastName asc;

-- #6 query: List all of the students in a course and all of their scores on every assignment
select LastName, FirstName, CourseName, ASSIGNMENTS.AssignID, Points, MaxPoints from `ENROLLMENT`
inner join `STUDENTS` on (STUDENTS.StudentID = ENROLLMENT.StudentID)
inner join `SCORE` on (SCORE.StudentID = ENROLLMENT.StudentID)
inner join `ASSIGNMENTS` on (ASSIGNMENTS.AssignID = SCORE.AssignID)
inner join `COURSES` on (COURSES.CourseID = ENROLLMENT.CourseID) where (COURSES.CourseID = 1)
order by AssignID, LastName asc;

-- #7 query: Add an assignment to a course
insert into ASSIGNMENTS(DistribID, Instance, MaxPoints)
VALUES (1, 3, 100);
-- updated #7 table
SELECT * FROM ASSIGNMENTS;

-- #8 query: Change the percentages of the categories for a course
-- feel free to change Percent to set new distribution
-- NOTE: another Percent must be altered to keep the total Percent = 100
update DISTRIBUTION set Percent = 30
where DistribID = 1;
update DISTRIBUTION set Percent = 40
where DistribID = 3;
-- updated #8 table
SELECT * FROM DISTRIBUTION;

-- #9 query: Add 2 points to the score of each student on an assignment
UPDATE STUDENTGRADES SET Points = Points + 2
WHERE AssignID = 4;
-- updated #9 table
SELECT * FROM `STUDENTGRADES`
LEFT JOIN `ASSIGNMENTS` ON (STUDENTGRADES.AssignID = ASSIGNMENTS.AssignID) WHERE (STUDENTGRADES.AssignID = 4)
order by StudentID;

-- #10 query: Add 2 points just to those students whose last name contains a ‘Q’
UPDATE STUDENTGRADES 
JOIN `STUDENTS` ON (STUDENTGRADES.StudentID = STUDENTS.StudentID)
SET Points = Points + 2
WHERE (STUDENTS.LastName LIKE 'Q%') and (STUDENTS.StudentID = 6);
-- update #10 table
SELECT Points FROM `STUDENTGRADES`
WHERE (StudentID = 6);
--

-- #11 query: compute the grade for a student
# SELECT DISTINCT pt.StudentID, st.FirstName, st.LastName, pt.CourseID,pt.AssignmentID, pt.CategoryName, pt.Points, pt.MaxPoints, pt.Percent
# FROM (
#     SELECT STUDENT.StudentID, AssignmentID, FirstName, LastName, CourseID, Points
#     FROM STUDENT JOIN ENROLLMENT JOIN SCORE
#     WHERE STUDENT.StudentID = ENROLLMENT.StudentID
#     AND STUDENT.StudentID = SCORE.StudentID) st
# JOIN
# (SELECT StudentID, CourseID, CategoryName, ASSIGNMENTS.AssignmentID, Points, ASSIGNMENTS.PointsPossible, DISTRIBUTION.Percent
#     FROM DISTRIBUTION JOIN ASSIGNMENTS JOIN SCORE
#     WHERE DISTRIBUTION.DistributionID = ASSIGNMENTS.DistributionID
#     AND ASSIGNMENTS.AssignmentID = SCORE.AssignmentID) pt
# WHERE st.AssignmentID = pt.AssignmentID
# AND st.Points = pt.Points AND st.StudentID=1234;

-- student final grade for Harriet Tubman in Software Engineering
Select SUM(((sg.Points * 100) / a.MaxPoints) * (Percent / 100)) AS FINALGRADE
FROM DISTRIBUTION d, ASSIGNMENTS a, STUDENTGRADES sg
WHERE d.DistribID = a.DistribID
AND sg.AssignID = a.AssignID
AND d.CourseID = 3
AND StudentID = 1;
