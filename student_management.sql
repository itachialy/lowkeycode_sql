create database student_management;
create table Class(
id int,
name varchar(50)
);
create table Teacher(
id int,
name varchar(50),
age int,
country varchar(50)
);
select * from teacher; -- hiển thị bảng
select * from class; -- hiển thị bảng

insert into teacher (id, name, age, country) -- thêm dùng insert into() + values();
values(1,"Thương",18,"Da Nang");

insert into class (id, name)
values(1,"Thương");

show tables; -- hiển thị tất cả bảng trong packge này
describe teacher; -- hiển thị cấu trúc của bảng table

ALTER TABLE Teacher -- lệnh này dùng để thay đổi cấu trúc bảng
CHANGE COLUMN counntry country VARCHAR(50); -- Lệnh này đổi tên cột từ 
-- counntry thành country và giữ nguyên kiểu dữ liệu VARCHAR(50).