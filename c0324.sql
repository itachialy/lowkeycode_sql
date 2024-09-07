create database c0324m4;
use c0324m4;
create table student(
student_id int auto_increment primary key,
student_name varchar(50),
student_email varchar(50),
student_classname varchar(25),
student_point double);


select * from student;


insert into student(student_name, student_email, student_classname, student_point)
values
('Việt', 'viet.tam', 'c0324', 8),
('Khoa', 'khoa.huynh', 'c0234', 9);

delimiter //
create procedure insert_student(new_name varchar(50), new_email varchar(50), 
new_classname varchar(25), new_point double)
begin
insert into student(student_name, student_email,
 student_classname, student_point)
 values( new_name, new_email, new_classname, new_point ) ;
 end //
 delimiter ;

call insert_student('2','2','2',2);