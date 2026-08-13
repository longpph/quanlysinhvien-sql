create database quanlysinhvien;

use quanlysinhvien;

create table Class (
	ClassID int auto_increment primary key,
    ClassName varchar(60) not null,
    StartDate datetime not null,
    Status bit
);

create table Student (
	StudentID int auto_increment primary key,
    StudentName varchar(30) not null,
    Address varchar(50),
    Phone varchar(20),
    Status bit,
    ClassID int not null,
    foreign key (ClassID) references Class(ClassID)
);

create table Subject (
	SubID int auto_increment primary key,
    SubName varchar(30) not null,
    Credit tinyint not null default 1 check (Credit >= 1),
    Status bit default 1
);

create table Mark (
	MarkID int auto_increment primary key,
    SubID int not null unique key,
    StudentID int not null,
    Mark float default 0 check (Mark between 0 and 100),
    ExamTime tinyint default 1,
    foreign key (SubID) references Subject(SubID),
    foreign key (StudentID) references Student(StudentID)
);

insert into Class
values (1, 'A1', '2008-12-20', 1);
insert into Class
values (2, 'A2', '2008-12-22', 1);
insert into Class
values (3, 'B3', current_date(), 0);


insert into Student (StudentName, Address, Phone, Status, ClassId)
values ('Hung', 'Ha Noi', '0912113113', 1, 1);
insert into Student (StudentName, Address, Status, ClassId)
values ('Hoa', 'Hai phong', 1, 1);
insert into Student (StudentName, Address, Phone, Status, ClassId)
values ('Manh', 'HCM', '0123123123', 0, 2);

insert into Subject
values (1, 'CF', 5, 1),
 (2, 'C', 6, 1),
 (3, 'HDJ', 5, 1),
 (4, 'RDBMS', 10, 1);
 
alter table Mark
modify SubID int not null;
 
drop table Mark;
 
create table Mark (
	MarkID int auto_increment primary key,
    SubID int not null,
    StudentID int not null,
    Mark float default 0 check (Mark between 0 and 100),
    ExamTime tinyint default 1,
    foreign key (SubID) references Subject(SubID),
    foreign key (StudentID) references Student(StudentID)
);
 
insert into Mark (SubId, StudentId, Mark, ExamTime)
values (1, 1, 8, 1),
 (1, 2, 10, 2),
 (2, 1, 12, 1);
 
select * from Student;
 
select * from Student where Status = true;

select * from Subject;

select * from Class;

select * from Subject where Credit < 10;

select S.StudentID, S.StudentName, C.ClassName
from Student S join Class C on S.ClassID = C.ClassID;

select S.StudentID, S.StudentName, C.ClassName
from Student S join Class C on S.ClassID = C.ClassID
where C.ClassName = 'A1';

select S.StudentID, S.StudentName, Sub.SubName, M.Mark
from Student S join Mark M on S.StudentID = M.StudentID
				join Subject Sub on M.SubID = Sub.SubID
where Sub.SubName = 'CF';

select * from Student where StudentName like 'h%';

select * from Class where month(StartDate) = 12;

select * from subject where Credit between 3 and 5;

update Student set ClassID = 2 where StudentName = 'Hung';

select s.StudentName, sub.SubName, m.Mark
from Student s
join Mark m on s.StudentID = m.StudentID
	join Subject sub on m.SubID = sub.SubID
order by m.Mark DESC, s.StudentName;
