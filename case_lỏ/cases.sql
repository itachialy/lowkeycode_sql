create database cases;
use cases;

create table admin_account
(user_admin varchar(50) primary key,
pass_admin varchar(50) );

create table class
(class_id int primary key auto_increment,
class_name varchar(50) );

create table student
(student_id int primary key auto_increment,
student_name varchar(50),
student_birthday date,
student_gender bit,
student_email varchar(50),
student_point double,
user_admin varchar(50),
class_id int,
foreign key (user_admin) references admin_account(user_admin),
foreign key (class_id) references class(class_id) );

insert into admin_account( user_admin, pass_admin)
values ( 'admin',123 );

insert into class (class_name) values ('Backend-01'), ('Backend-02'),('Frontend-01'),('Fullstack');

insert into student (student_name,student_birthday, student_gender,student_email,student_point, class_id)
values 
('Lê Quang Việt','1999-11-11',1,'viet@gmail.com',8,1),
('Huỳnh Anh Khoa','2000-11-11',1,'khoa@gmail.com',8,4),
('Trần Thị Kim Thương','2003-11-11',0,'thuong@gmail.com',8,2),
('Lê Itachi','1999-11-11',1,'itachi@gmail.com',8,2),
('Lê Kim Băng','1999-11-11',1,'itach@gmail.com',8,2),
('Lê Hoàng','1999-11-11',1,'itac@gmail.com',8,2);


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
