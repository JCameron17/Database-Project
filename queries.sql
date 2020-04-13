select * from `distribution`;
select * from `courses`;
Select * From `distribution`
WHERE ("Courses.CourseID" = "Distribution.CourseID");

select * from `enrollment`
inner join `students` on (Students.StudentID = Enrollment.StudentID)
inner join `courses` on (Courses.CourseID = Enrollment.CourseID);
