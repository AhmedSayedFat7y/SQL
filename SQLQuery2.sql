use ITI 
-- PART 1 

-- 1.Display instructor Name and Department Name 
-- even instructor not assigned to any department


SELECT Ins_Name , dept_name 
from Instructor i  left outer join Department d
on d.Dept_Id=i.Dept_Id

-- 2.Display student full name and the name of the course he is taking
-- For only courses which have a grade  

select s.St_fname +' ' + s.St_Lname , c.Crs_Name , sc.Grade
from Student s inner join Stud_Course sc 
on s.St_Id = sc.St_Id 
inner join  Course c 
on c.Crs_Id = sc.Crs_Id 
where grade is not null



-- 3.Display number of courses for each topic name

select count(Crs_Id) as number_of_courses , top_name
from Course inner join Topic
on Topic.Top_Id= Course.Top_Id
group by top_name 

--4.Display max and min salary for instructors

select max(Salary) , min(Salary)
from Instructor

--5.Display instructors who have salaries less than the average salary of all instructors.

select Salary , Ins_Name
from Instructor
where Salary < all(select AVG(Salary) from Instructor
                 group by Ins_Id      ) 

-- 6.Display the Department name that contains the instructor who receives the minimum salary.

select d.Dept_Name , MIN(i.Salary)
from Department d inner join Instructor i
on d.Dept_Id = i.Dept_Id 
group by d.Dept_Name


