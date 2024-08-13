select s.student_name, c.class_name
from student s
join class c on s.class_id=c.class_id;

select s.student_name, c.class_name 
from student s
left join class c on s.class_id = c.class_id;

select * 
from student 
where student_name like '%Hai%' or student_name like '%Huynh%';

select * 
from student 
where student_point > 5;

select * 
from student 
where student_name like 'Nguyen%';

