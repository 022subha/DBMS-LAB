show databases;

create database Assignment_4;
show databases;
use assignment_4;

create table ZIPCODES
(ZIP int(5) PRIMARY KEY,
CITY varchar(30));

desc ZIPCODES;

show create table ZIPCODES;

INSERT into ZIPCODES
values
(67226,'wichita'),
(60606,'fort dodge'),
(50302,'kansas city'),
(54444,'columbia'),
(66006,'libaral'),
(61111,'fort hays'),
(65222,'diamond'),
(63111,'kolkata'),
(60706,'patna'),
(61818,'delhi');

select *
from ZIPCODES;

create table EMPLOYEES
(ENO int(4) PRIMARY KEY,
ENAME varchar(30),
ZIP int(5),
HDATE date,
constraint ZIP foreign key(ZIP) references ZIPCODES(ZIP) on delete cascade);

desc EMPLOYEES;

show create table EMPLOYEES;

INSERT into EMPLOYEES
values
(1000,'jones', 67226 ,'1995-12-12'),
(1001 ,'smith', 60606 ,'1994-09-01'),
(1002 ,'brown', 50302 ,'1994-09-01'),
(1003 ,'bapi', 54444 ,'1997-11-21'),
(1005 ,'komal', 61111 ,'1999-01-05'),
(1004 ,'sanjit', 54444 ,'1985-02-10'),
(1006 ,'ramanath', 66006 ,'1985-05-07'),
(1007 ,'pasupati', 61111 ,'1985-03-03'),
(1008 ,'uttam', 65222 ,'1984-09-06'),
(1009 ,'arup', 63111 ,'1984-01-31'),
(1010 ,'biplab', 60706 ,'1984-03-22'),
(1011 ,'umpa', 61818 ,'1991-03-21'),
(1012 ,'mamoni', 67226 ,'1988-03-13'),
(1013 ,'anjali', 60706 ,'1992-03-22'),
(1014 ,'marium', 61818 ,'1993-03-22'),
(1015 ,'falguni', 61818 ,'1988-03-11');

select *
from EMPLOYEES;

CREATE table PARTS
(PNO int(5) PRIMARY KEY,
PNAME varchar(30),
QOH int(3),
PRICE double(6,3),
OLEVEL int(2));

desc PARTS;

INSERT into PARTS
values
(10506, 'land before time 1', 200, 17.99, 20),
(10507, 'land before time 2', 156, 17.99, 20),
(10508, 'land before time 3', 190, 17.99, 20),
(10509, 'land before time 4', 60, 17.99, 20),
(10601, 'Nut', 300, 24.99, 30),
(10602, 'Bolt', 120, 17.99, 30),
(10603, 'Screw', 140 ,13.49, 30),
(10800, 'Driller', 100, 24.99, 30);

select *
from PARTS;

CREATE table CUSTOMERS
(CNO int(4) PRIMARY KEY,
CNAME varchar(30),
STREET varchar(30),
ZIP int(5),
PHONE int(10),
constraint Z foreign key(ZIP) references ZIPCODES(ZIP) on delete cascade);

desc CUSTOMERS;

show create table CUSTOMERS;

INSERT into CUSTOMERS
values
(1111, 'charles', '123 main st.', 67226, 316636),
(2222, 'amina', '124 lane 11', 60606, 24203227),
(3333, 'soma', '224 main st.', 54444, 24203270),
(4444, 'rita', '321 lane 13', 66006, 24219706),
(5555, 'bhaswati', '543 main st.', 50302, 32157654),
(6666, 'santu', '432 main st', 61111, 5432167),
(7777, 'manas', '432 lane 17', 61111, 5432167),
(8888, 'monirul', '765 main st.', 65222, 4321566),
(9999, 'tapan', '654 lane 19', 63111, 5432156),
(1000, 'dipu', '543 main st.', 60706, 9876543),
(9988, 'barun', '657 lane 12', 61818, 9876543);


select *
from CUSTOMERS;


CREATE table ORDERS
(ONO int(4) PRIMARY KEY,
CNO int(4),
ENO int(4),
RECIEVED date,
SHIPPED date,
constraint CNO foreign key(CNO) references CUSTOMERS(CNO) on delete cascade,
constraint ENO foreign key(ENO) references EMPLOYEES(ENO) on delete cascade);

desc ORDERS;

show create table ORDERS;

INSERT into ORDERS
values
(1020, 1111, 1000, '1994-12-10', '1994-12-12'),
(1021, 1111, 1000, '1995-01-12', '1995-01-15'),
(1022, 2222, 1001, '1997-01-20', Null),
(1023, 3333, 1002, '1998-04-13', '1998-04-29'),
(1024, 4444, 1003, '1996-03-11', '1996-03-13'),
(1025, 5555, 1004, '1996-03-11', '1996-03-12'),
(1026, 5555, 1004, '1998-05-31', '1998-01-08'),
(1027, 8888, 1006, '1995-05-23', '1993-03-23'),
(1028, 7777, 1007, '1984-05-17', '1983-12-18'),
(1029, 3333, 1008, '1992-12-13', '1993-09-18'),
(1030, 2222, 1010, '1983-04-30', '1985-09-17'),
(1031, 1000, 1011, '1993-05-26', '1985-04-16'),
(1032, 1111, 1012, '1986-04-15', '2005-01-31'),
(1033, 9988, 1013, '2000-04-18', '2005-04-18'),
(1034, 9988, 1014, '2005-02-08', '2005-02-18'),
(1035, 1111, 1015, '2005-04-18', Null);

SELECT *
FROM ORDERS;

CREATE TABLE ODETAILS
(ONO int(4),
PNO int(5),
QTY int(3),
PRIMARY KEY(ONO,PNO),
constraint ONO foreign key(ONO) references ORDERS(ONO) on delete cascade,
constraint PNO foreign key(PNO) references PARTS(PNO) on delete cascade);

desc ODETAILS;

show create table ODETAILS;

INSERT into ODETAILS
values
(1034, 10506, 7),
(1020, 10507, 5),
(1022 ,10507, 6),
(1029 ,10508, 5),
(1026 ,10509, 9),
(1029, 10507, 3),
(1021 ,10800, 2),
(1035 ,10601, 5),
(1033 ,10602, 8),
(1032 ,10509, 7),
(1031 ,10603, 1);


select *
from ODETAILS;


#QUERIES-1
SELECT distinct PNO
FROM ODETAILS;

#QUERIES-2
SELECT *
FROM CUSTOMERS
WHERE CNAME like '%s%';														

#QUERY-3
SELECT PNO,PNAME
FROM PARTS
WHERE PRICE<19.99;

#QUERY-4
SELECT ONO,CNAME,SHIPPED
FROM ORDERS O,CUSTOMERS C
WHERE O.CNO=C.CNO AND SHIPPED is NULL;

#QUERY-5
SELECT PNAME,PRICE
FROM PARTS
ORDER BY PRICE
LIMIT 1;

#QUERY-6
SELECT PNAME,PRICE
FROM PARTS
WHERE PRICE<(
SELECT min(PRICE)
FROM PARTS
WHERE PNAME like 'land before time %');


#QUERY-7
SELECT ENO
FROM ZIPCODES Z,EMPLOYEES E
WHERE Z.ZIP=E.ZIP AND CITY='fort dodge';

#QUERY-8
SELECT ENAME,HDATE
FROM EMPLOYEES
ORDER BY HDATE
LIMIT 1;

#QUERY-9
SELECT PNO,PNAME,PRICE
FROM PARTS
WHERE PRICE>20.00
ORDER BY PNO;

#QUERY-10
SELECT P.PNO,P.PNAME,FORMAT(SUM(QTY)*PRICE,2) TOTAL_SALES
FROM PARTS P,ODETAILS O
WHERE P.PNO=O.PNO
GROUP by PNO;


#QUERY-11
SELECT P.PNO,P.PNAME,CONCAT('Rs. ',FORMAT(SUM(QTY*PRICE),2)) TOTAL_SALES
FROM PARTS P,ODETAILS O
WHERE P.PNO=O.PNO
GROUP BY PNO
HAVING SUM(QTY*PRICE)>100.53;


#QUERY-12
UPDATE ZIPCODES
SET CITY='parth'
WHERE CITY='columbia';

SELECT *
FROM ZIPCODES;

#QUERY-13
UPDATE ORDERS
SET SHIPPED=SYSDATE()
WHERE SHIPPED is NULL;

SELECT *
FROM ORDERS;

#QUERY-14
UPDATE PARTS
SET PRICE=PRICE-PRICE*0.1
WHERE PRICE<24.00;

SELECT *
FROM PARTS;

#QUERY-15
UPDATE PARTS
SET QOH=(
SELECT max(QOH)
FROM(
SELECT QOH
FROM PARTS)
AS T)
WHERE QOH<100;

SELECT *
FROM PARTS;



