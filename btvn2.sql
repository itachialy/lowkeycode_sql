select class_name as lop_hoc, count(student_id) as so_luong
from student s
inner join class c on s.class_id = c.class_id
group by class_name;

select class_name as lop_hoc, max(student_point) as diem_cao_nhat
from student s
inner join class c on s.class_id = c.class_id
group by class_name;

select class_name as lop_hoc, avg(student_point) as diem_trung_binh
from student s
inner join class c on s.class_id = c.class_id
group by class_name;

select student_name as name , student_birthday as birthday
from student
union 
select  instructor_name as name , instructor_birthday as birthday
from instructor;

select student_name, student_point
from student
order by student_point desc
limit 3;

select student_name, student_point
from student
where student_point = (
select max(student_point)
from student);
;


