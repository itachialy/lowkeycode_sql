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