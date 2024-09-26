create database cases;
use cases;


create table admin_account(
user_admin varchar(50) primary key,
pass_admin varchar(50));

create table class(
	class_id int primary key auto_increment,
    class_name varchar(50)
);


create table student(
	student_id int primary key auto_increment,
    student_name varchar(50),
    student_birthday date,
    student_gender bit,
    student_email varchar(50),
    student_point double,
    user_admin varchar(50),
    class_id int,
    foreign key(user_admin) references admin_account(user_admin),
    foreign key(class_id) references class(class_id)
);

 select s.student_id, s.student_name, s.student_birthday, s.student_gender,
s.student_email, s.student_point, c.class_id, c.class_name  from student s
inner join class c on s.class_id = c.class_id
ORDER BY s.student_id ASC;  

select s.student_id, s.student_name, s.student_birthday, s.student_gender,
s.student_email, s.student_point, c.class_id, c.class_name  from student s
inner join class c on s.class_id = c.class_id
where student_id = 50 ;



insert into class (class_name) values ('Backend-01'), ('Backend-02'),('Frontend-01'),('FullStack');

insert into admin_account(user_admin, pass_admin)
values 
('admin' , '123'),
('itachi' , '123'),
('viet' , '123');


 
 insert into student(student_name,student_birthday, student_gender,student_email, student_point, class_id) 
 values 
 ('Lê Quang Việt','2000-09-09',1,'viet@gmail.com',8,1),
 ('Nguyễn Thị Itachi','1981-12-12',0,'ngoc.ng@gmail.com',5,1),
 ('Nộ Long Cước','1990-12-12',1,'itachi@naruto.com',6,2),
 ('Trần Thị Kim Thương','2004-11-11',0,'kim.tran@gmail.com',8,1),
 ('Trấn Thành','2003-11-11',1,'huynh@gmail.com',7,4),
 ('Sói Hoang Hư Hỏng','2003-11-11',1,'huynh1khoa@gmail.com',7,4),
 ('Cừu Vui Vẻ','2003-11-11',1,'huynh.2khoa@gmail.com',7,1),
 ('Nô Bi Ta','2003-11-11',1,'huynh.3khoa@gmail.com',7,2),
 ('Siêu Nhân Gao','2002-11-11',1,'huynh.4khoa@gmail.com',7,4),
 ('Gao Đỏ','2003-11-11',1,'huynh.5khoa@gmail.com',7,4),
 ('Gao Đỏ Đậm','2005-11-11',1,'huynh.6khoa@gmail.com',7,2),
 ('Gao Đỏ Nhạt','2003-11-11',1,'huynh.7khoa@gmail.com',4,3),
 ('Gao Xanh Dương','2003-11-11',1,'huynh.8khoa@gmail.com',3,4),
 ('Gao Xanh Lá','2003-11-11',1,'huynh.9khoa@gmail.com',7,4),
 ('Gao Cam Sành','2003-11-11',1,'huynh2.khoa@gmail.com',7,2),
 ('Gao Đen Xì','2003-11-11',1,'huynh3.khoa@gmail.com',6,4),
 ('Gao Trắng Bóc','2002-11-11',1,'huynh4.khoa@gmail.com',7,1),
 ('Lê Lãng Tử','2003-11-11',1,'huynh5.khoa@gmail.com',7,3),
 ('Nguyễn Cô Đơn','2003-11-11',1,'huynh6.khoa@gmail.com',7,4),
 ('Nguyễn Ngọc Bích','2003-11-11',1,'huynh7.khoa@gmail.com',7,1),
 ('Lê Minh Tâm','2003-11-11',1,'huynh8.khoa@gmail.com',7,3),
 ('Kim Thương','2003-11-11',1,'huynh9.khoa@gmail.com',7,2);
 
 SELECT s.student_id, s.student_name, s.student_birthday, s.student_gender, 
    s.student_email, s.student_point, c.class_id, c.class_name FROM student s 
    INNER JOIN class c ON s.class_id = c.class_id WHERE s.student_name LIKE 'le';

SELECT s.*, c.class_id, c.class_name
                    FROM student s 
                    JOIN class c ON s.class_id = c.class_id WHERE 1=1
 
 DELIMITER //
CREATE PROCEDURE GetAllStudents()
BEGIN
    SELECT s.student_id, s.student_name, s.student_birthday,
           s.student_gender, s.student_email, s.student_point,
           c.class_id, c.class_name
    FROM student s
    INNER JOIN class c ON s.class_id = c.class_id
    ORDER BY s.student_id ASC;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE GetStudentById(IN studentId INT)
BEGIN
    SELECT s.student_id, s.student_name, s.student_birthday,
           s.student_gender, s.student_email, s.student_point,
           c.class_id, c.class_name
    FROM student s
    INNER JOIN class c ON s.class_id = c.class_id
    WHERE s.student_id = studentId;
END //
DELIMITER ;
call GetStudentById(165); -- done
 
 DELIMITER //
CREATE PROCEDURE UpdateStudent(
    IN studentName VARCHAR(255),
    IN studentBirthday DATE,
    IN studentGender INT,
    IN studentEmail VARCHAR(255),
    IN studentPoint DOUBLE,
    IN classId INT,
	IN studentId INT
)
BEGIN
    UPDATE student
    SET student_name = studentName,
        student_birthday = studentBirthday,
        student_gender = studentGender,
        student_email = studentEmail,
        student_point = studentPoint,
        class_id = classId
    WHERE student_id = studentId;
END //
DELIMITER ;
call UpdateStudent('demo', '2000-11-11', 1, '2@22', 5, 2, 177); -- done


DELIMITER //
CREATE PROCEDURE SearchStudentByName(
    IN searchName VARCHAR(255)
)
BEGIN
    SELECT s.student_id, s.student_name, s.student_birthday, s.student_gender,
           s.student_email, s.student_point, c.class_id, c.class_name 
    FROM student s 
    INNER JOIN class c ON s.class_id = c.class_id 
    WHERE s.student_name LIKE CONCAT('%', searchName, '%');
END //
DELIMITER ;
call SearchStudentByName('i'); -- done


DELIMITER //
CREATE PROCEDURE InsertStudent(
    IN name VARCHAR(255),
    IN birthday DATE,
    IN gender INT,
    IN email VARCHAR(255),
    IN point DOUBLE,
    IN classId INT
)
BEGIN
    INSERT INTO student (student_name, student_birthday, student_gender, student_email, student_point, class_id)
    VALUES (name, birthday, gender, email, point, classId);
END //
DELIMITER ;
 call InsertStudent('new', '1999-11-11',1, 'aaa@gâmi',5,1); -- done


 
 -- SET SQL_SAFE_UPDATES = 1;
