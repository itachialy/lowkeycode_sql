
create table james(
account varchar(50) primary key,
password varchar(50)
);
create table class(
id int primary key auto_increment,
name varchar(50)
);

create table student(
id int primary key auto_increment,
name varchar(50),
gender bit,
birthday date,
point float,
email varchar(50),
account varchar(50),
class_id int,
foreign key (account) references james(account),
foreign key (class_id) references class(id)
);
create table instructor(
id int primary key auto_increment,
name varchar(50),
birthday date,
salary int
);
create table class_instructor(
class_id int,
instructor_id int,
primary key (class_id , instructor_id),
foreign key (class_id) references class(id),
foreign key (instructor_id) references instructor(id)
);
