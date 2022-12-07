SHOW DATABASES;

CREATE DATABASE ASSIGNMENT_7;

SHOW DATABASES;

USE ASSIGNMENT_7;

create table depts(
deptcode varchar(3) primary key,
deptname varchar(30) not null);
-- DROP TABLE CRS_REGD;
-- DROP TABLE CRS_OFFRD;
-- DROP TABLE FACULTY;
-- DROP TABLE STUDENTS;
-- DROP TABLE DEPTS;
create table students(
rollno int(8) primary key,
name varchar(30),
bdate date check(bdate < '1997-01-01'),
deptcode varchar(3),
hostel int(10) check(hostel<10),
parent_inc float(8,1),
constraint deptcode foreign key(deptcode) references depts(deptcode) on delete cascade
);

create table faculty(
fac_code varchar(8) primary key,
fac_name varchar(30) not null,
fac_dept varchar(3) ,
constraint fac_dept foreign key(fac_dept) references depts(deptcode));

create table crs_offrd(
crs_code varchar(5) primary key,
crs_name varchar(35) not null,
crs_credits float(2,1),
crs_fac_cd varchar(8), 
constraint crs_fac_cd foreign key(crs_fac_cd) references faculty(fac_code));

create table crs_regd(
crs_rollno int(8) ,
crs_cd varchar(5),
marks float(5,2),
primary key(crs_rollno,crs_cd),
constraint crs_rollno foreign key(crs_rollno) references students(rollno),
constraint crs_cd foreign key(crs_cd) references crs_offrd(crs_code));

SHOW TABLES;

INSERT INTO DEPTS
VALUES
('CST','Computer Science & Technology'),
('ME','Mechanical Engineering'),
('EE','Electrical Engineering'),
('CE','Civil Engineering'),
('PHY','Physics');

SELECT *
FROM DEPTS;

INSERT INTO STUDENTS
VALUES
(121,"SUBHAJIT","1995-12-21","CST",5,10000),
(122,"ANUBHAV","1994-11-01","CST",7,20000.8),
(123,"VICKY","1993-05-30","CST",5,60000.4),
(124,"VIJAY","1995-03-15","ME",5,99999),
(125,"SINGA","1992-08-28","CE",1,10000.7),
(126,"MALAY","1996-12-30","ME",4,2000000.9),
(127,"RAJESH","1995-05-17","PHY",2,500000),
(128,"MOHIT","1996-09-21","CE",7,9900000),
(129,"ROHIT","1994-02-22","EE",9,90000.5);

SELECT *
FROM STUDENTS;

INSERT INTO FACULTY
VALUES
('F10','MALAY KULE','CST'),
('F11','JAYA SIL','CST'),
('F12','SKM','EE'),
('F13','MANAS HIRA','PHY'),
('F14','BKS','CE'),
('F15','NIRNAY GHOSH','CST'),
('F16','SURAJEET GHOSH','PHY'),
('F17','ATANU SAMANTA','CE');

SELECT *
FROM FACULTY;

INSERT INTO CRS_OFFRD
VALUES
('C1','TOC',4.2,'F11'),
('C2','COA',3.0,'F10'),
('C3','GRAPH ALGO',4.1,'F13'),
('C4','DBMS',3.6,'F10'),
('C5','C LANGUAGE',2.0,'F17'),
('C6','JAVA',3.9,'F15');

SELECT *
FROM CRS_OFFRD;

INSERT INTO CRS_REGD
VALUES
(121,'C1',95.3),
(122,'C1',99),
(121,'C2',90),
(123,'C5',70),
(125,'C4',60),
(128,'C6',95.9);

SELECT *
FROM CRS_REGD;



#TASK-1

CREATE VIEW CST_STUDENTS AS
(SELECT *
FROM STUDENTS
WHERE DEPTCODE='CST');

SELECT *
FROM CST_STUDENTS;

CREATE VIEW CSE_STUD AS
(SELECT ROLLNO,NAME,HOSTEL
FROM STUDENTS
WHERE DEPTCODE='CST');

SELECT *
FROM CSE_STUD;

INSERT INTO STUDENTS
VALUES
(130,'ATANU','1996-12-01','CST',8,90000.9);

SELECT *
FROM CST_STUDENTS;

SELECT *
FROM CSE_STUD;

insert into CST_STUDENTS values
(10,"JEEVA","1996-07-20","CST",1,900100.9);

SELECT *
FROM CSE_STUD;

SELECT *
FROM STUDENTS;

insert into cse_stud values
(11,"JAYANTH",2);

SELECT *
FROM CST_STUDENTS;

SELECT *
FROM STUDENTS;

update students
set parent_inc=parent_inc+5000;

SELECT *
FROM CST_STUDENTS;

SELECT *
FROM CSE_STUD;

Drop view csE_stud;

#TASK-2

create view me_students as
(select s.rollno as "Roll-No",s.name as "Name",d.deptname as "Department_Name",
TIMESTAMPDIFF(YEAR, s.bdate, CURDATE())  as Age
from depts d,students s
where d.deptcode=s.deptcode and d.deptname="MECHANICAL ENGINEERING");

insert into me_students values
(12,"RAHUL","MECHANICAL ENGINEERING",25);

delete from me_students
 where Name="TAAHA";
 
update me_students
set Department_Name="COMPUTER SCIENCE ENGINEERING"
where Name=”MALAY”;