select * from `distribution`;
select * from `courses`;

-- query: distribution by course
select Courses.CourseName, Type, Percent  from `distribution`, `courses`
where (courses.courseID = distribution.CourseID)
order by CourseName;


select * from `enrollment`
inner join `students` on (Students.StudentID = Enrollment.StudentID)
inner join `courses` on (Courses.CourseID = Enrollment.CourseID);

-- query: assignments by distribution
select AssignID, Courses.CourseName, Instance, MaxPoints, Distribution.Type
from `assignments`
left join `distribution` on (distribution.distribID = assignments.distribID)
left join `courses` on (Courses.CourseID = distribution.courseID);

select * from `studentgrades`
inner join `students` on (students.studentID = studentgrades.studentID)
inner join `assignments` on (assignments.assignID = studentgrades.assignID);
