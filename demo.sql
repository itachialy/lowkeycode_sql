CREATE DATABASE codegym_management;
use codegym_management;

create table student(
name varchar(50),
dob date,
gender bit,
salary int );

select * from student; -- hiển thị bảng
insert into student(name, dob, gender , salary)
values("nam", "2000-11-11",1,1);
truncate table student; -- xóa dữ liệu bảng
