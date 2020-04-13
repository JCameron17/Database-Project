select * from `distribution`;
select * from `courses`;
select * from `distribution`
inner join `courses` on (Courses.CourseID = Distribution.CourseID);

select * from `enrollment`
inner join `students` on (Students.StudentID = Enrollment.StudentID)
inner join `courses` on (Courses.CourseID = Enrollment.CourseID);
