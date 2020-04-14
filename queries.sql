select * from `DISTRIBUTION`;
select * from `COURSES`;

-- query: distribution by course
select COURSES.CourseName, Type, Percent  from `DISTRIBUTION`, `COURSES`
where (COURSES.courseID = DISTRIBUTION.CourseID)
order by CourseName;

-- query: student enrollments by course
select LastName, FirstName, CourseName from `ENROLLMENT`
inner join `STUDENTS` on (STUDENTS.StudentID = ENROLLMENT.StudentID)
inner join `COURSES` on (COURSES.CourseID = ENROLLMENT.CourseID)
order by CourseName asc;

-- query: assignments by distribution
select AssignID, COURSES.CourseName, Instance, MaxPoints, DISTRIBUTION.Type
from `ASSIGNMENTS`
left join `DISTRIBUTION` on (DISTRIBUTION.distribID = ASSIGNMENTS.distribID)
left join `COURSES` on (COURSES.CourseID = DISTRIBUTION.courseID);

-- query: student grades by assignment
select STUDENTGRADES.AssignID, STUDENTGRADES.StudentID, FirstName, LastName, Points, MaxPoints, Instance
from `STUDENTGRADES`
right JOIN `ASSIGNMENTS` ON (ASSIGNMENTS.AssignID = STUDENTGRADES.AssignID)
LEFT JOIN `STUDENTS` ON (STUDENTS.StudentID = STUDENTGRADES.StudentID);

-- query: Compute the average/highest/lowest score of an assignment
select a.AssignID, a.MaxPoints, avg(s.POINTS) AS PointAVG, max(s.POINTS) AS BestScore, min(s.POINTS) AS WorstScore
from ASSIGNMENTS a, STUDENTGRADES s 
where a.AssignID=2 AND s.AssignID=a.AssignID;

-- query: compute the grade for a student
SELECT DISTINCT pt.StudentID, st.FirstName, st.LastName, pt.CourseID,pt.AssignmentID, pt.CategoryName, pt.Points, pt.MaxPoints, pt.Percent
FROM (
    SELECT STUDENT.StudentID, AssignmentID, FirstName, LastName, CourseID, Points
    FROM STUDENT JOIN ENROLLMENT JOIN SCORE
    WHERE STUDENT.StudentID = ENROLLMENT.StudentID
    AND STUDENT.StudentID = SCORE.StudentID) st
JOIN
(SELECT StudentID, CourseID, CategoryName, ASSIGNMENTS.AssignmentID, Points, ASSIGNMENTS.PointsPossible, DISTRIBUTION.Percent
    FROM DISTRIBUTION JOIN ASSIGNMENTS JOIN STUDENTGRADES
    WHERE DISTRIBUTION.DistributionID = ASSIGNMENTS.DistributionID
    AND ASSIGNMENTS.AssignmentID = STUDENTGRADES.AssignmentID) pt
WHERE st.AssignmentID = pt.AssignmentID
AND st.Points = pt.Points AND st.StudentID=1234;

