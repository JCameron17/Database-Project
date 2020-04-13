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
