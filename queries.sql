select * from `distribution`;
select * from `courses`;
select * from `distribution`
inner join `courses` on (Courses.CourseID = Distribution.CourseID);

select * from `enrollment`
inner join `students` on (Students.StudentID = Enrollment.StudentID)
inner join `courses` on (Courses.CourseID = Enrollment.CourseID);

select * from `assignments`
inner join `distribution` on (distribution.distribID = assignments.distribID);

select * from `studentgrades`
inner join `students` on (students.studentID = studentgrades.studentID)
inner join `assignments` on (assignments.assignID = studentgrades.assignID);
