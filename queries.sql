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

select * from `STUDENTGRADES`
inner join `STUDENTS` on (STUDENTS.studentID = STUDENTGRADES.studentID)
inner join `ASSIGNMENTS` on (ASSIGNMENTS.assignID = STUDENTGRADES.assignID);

-- query: Compute the average/highest/lowest score of an assignment
select a.AssignmentID, avg(s.POINTS), max(s.POINTS), min(s.POINTS) 
from ASSIGNMENTS a, SCORE s 
where a.AssignmentID=2 AND s.AssignmentID=a.AssignmentID;

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

