create table Class(
ClassID int primary key auto_increment NOT NULL,
ClassName varchar(60) NOT NULL,
StartDate datetime NOT NULL,
Status bit
);

create table Student(
StudentID int primary key auto_increment NOT NULL,
StudentName varchar(30) NOT NULL,
Address varchar(50),
Phone varchar(20),
Status bit,
ClassID int NOT NULL
);
alter table Student add constraint FK_ClassID foreign key (ClassID) references Class(ClassID); 

create table  Subject(
SubID int primary key auto_increment NOT NULL,
SubName varchar(30) NOT NULL,
Credit tinyint NOT NULL default 1 check (Credit >= 1),
Status bit default 1
);

create table Mark(
MarkID int primary key auto_increment NOT NULL,
SubID int NOT NULL,
StudentID int NOT NULL,
Mark float default 0 check (Mark between 0 and 100),
ExamTimes tinyint default 1,
unique (SubID, StudentID),
foreign key (SubID) references Subject(SubID),
foreign key (StudentID) references Student(StudentID)
);

INSERT INTO Class
VALUES (1, 'A1', '2008-12-20', 1);
INSERT INTO Class
VALUES (2, 'A2', '2008-12-22', 1);
INSERT INTO Class
VALUES (3, 'B3', current_date, 0);

INSERT INTO Student (StudentName, Address, Phone, Status, ClassId)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO Student (StudentName, Address, Status, ClassId)
VALUES ('Hoa', 'Hai phong', 1, 1);
INSERT INTO Student (StudentName, Address, Phone, Status, ClassId)
VALUES ('Manh', 'HCM', '0123123123', 0, 2);

INSERT INTO Subject
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);

INSERT INTO Mark (SubId, StudentId, Mark, ExamTimes)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);
       
-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
select StudentName 
from student
where StudentName like "h%";

-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select classname as lop_hoc, startdate as thang_12
from class
where month(startdate) = 12;


-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select subname as mon_hoc, credit
from subject
where credit between 3 and 5;


-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
update student
set classid = 2
where studentname = "Hung";
-- set sql_safe_updates = 1;


-- Hiển thị các thông tin: StudentName, SubName, Mark. 
-- Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
select s.StudentName, su.SubName, m.Mark
from student s
inner join mark m on s.StudentID = m.StudentID
inner join subject su on m.SubID = su.SubID
order by m.mark desc, s.StudentName asc;
