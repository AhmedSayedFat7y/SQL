-- 1.Retrieve Number of Student who have a value in thier age 

select St_Age
from Student
where St_Age is not null

-- 2.get all instructor name without repition 

select distinct  Ins_Name 
from Instructor

--3.

select s.St_Id , s.St_Fname +' ' + s.St_Lname  as Fullname ,d.Dept_Name
from Student s inner Join Department d
on d.Dept_Id = s.Dept_Id

--4.Display Instructor name and Department name if the ins in department or not 

select s.Ins_Name , d.Dept_Name 
from Instructor s  left outer join Department d
on d.Dept_Id=s.Dept_Id 
 
-- 5.display student full name and the name of course he is taking 
-- for only courses which grade have value

select s.st_fname + ' ' + s.st_Lname , c.crs_name ,sc.Grade
from Student s  inner join Stud_Course sc 
on s.St_Id=sc.St_Id 
inner join Course c
on c.Crs_Id=sc.Crs_Id
where sc.Grade is not null

-- 6.display number of courses for each topic 

select count(c.crs_id) as counts , t.Top_Name
from Course c inner join Topic t
on t.Top_Id = c.Top_Id 
group by t.Top_Id, t.Top_Name

--7.display max and min salary for instructors

select max(salary) , min(salary) 
from Instructor 

-- 8.display instructors who have the salaries less than the average salary for all ins
select salary , Ins_Name from Instructor
where Salary < (select avg(Salary) from Instructor)

-- 9.display department name that contains the instructor who receives the min salary 

select d.dept_name  ,i.Ins_Name , i.Salary
from Department d inner join Instructor i
on d.Dept_Id = i.Dept_Id 
where i.Salary > (select min(Salary) from Instructor ) 

-- 10.select the max two salaries in instructor table

select *
from (select ins_name , Salary , Row_number() over(order by salary desc) as RN
			from Instructor ) as newtable
where Rn <=2

-- 11.selcet the instructor name and his salary but if there is no salary display instructor bonus

select coalesce(salary ,1)  , Ins_Name 
from Instructor

-- 12.select name of instructor and the average salary for each instructor 

select avg(salary) , Ins_Name
from Instructor 
group by Ins_Id,Ins_Name
order by avg(salary)  desc, Ins_Name 

--13.select the student first name and the data of his supervisor 

select s.st_fname as Student_Name ,l.St_Fname as Leader_Name 
from Student s ,Student l
where l.St_Id = s.St_super

--------
select s.St_Id , s.St_Fname,s.St_Age  , count(s.St_Id) over(partition by s.St_Address ), s.St_Address 
from Student s
where St_Address ='Cairo'

----------

select * , ROW_NUMBER() over (order by st_Age desc) as RN
from Student

select * , Ntile(3) over (order by st_Age desc) as RN
from Student


-----------

select * 
from (
		select * , Dense_Rank() over (partition by Dept_id order by st_age desc ) as D
		from Student 
		where Dept_id is not null
	) as NewTable
where D <=2

