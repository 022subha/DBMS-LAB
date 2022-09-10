show databases;

create database Assignment_2;
show databases;
use assignment_2;



CREATE TABLE DEPT
(DEPTNO integer (2) PRIMARY KEY,
DNAME varchar (20),
LOC varchar (20));

desc DEPT;
 
show create table DEPT;
 
INSERT into DEPT
values
(10,'Accounting','New York'),
(20,'Research','Dallas'),
(30,'Sales','Chicago'),
(40,'Operations','Boston');
 
select * 
from DEPT;
 
CREATE TABLE EMP
(EMPNO integer (4) PRIMARY KEY,
ENAME varchar (20),
JOB varchar (20),
MGR integer (4),
HIREDATE date,
SAL integer (5) NOT NULL,
COMM integer (5),
DEPTNO integer (2),
constraint MGR foreign key(MGR) references EMP(EMPNO) on delete cascade,
constraint DEPTNO foreign key(DEPTNO) references DEPT(DEPTNO) on delete cascade);
 
desc EMP;
 
show create table EMP;

INSERT into EMP
values
(7369,'Smith','Clerk',7902,'1980-12-17',800,NULL,20),
(7499,'Allen','Salesman',7698,'1981-02-20',1600,300,30),
(7521,'Ward','Salesman',7698,'1981-02-22',1250,500,30),
(7566,'Jones','Manager',7839,'1981-04-02',2975,NULL,20),
(7654,'Martin','Salesman',7698,'1981-09-28',1250,1400,30),
(7698,'Blake','Manager',7839,'1981-05-01',2850,NULL,30),
(7782,'Clark','Manager',7839,'1981-06-09',2450,NULL,10),
(7788,'Scott','Analyst',7566,'1982-12-09',3000,NULL,20),
(7839,'King','President',NULL,'1981-11-17',5000,NULL,10),
(7844,'Turner','Salesman',7698,'1981-09-08',1500,0,30),
(7876,'Adams','Clerk',7788,'1983-01-12',1100,NULL,20),
(7900,'James','Clerk',7698,'1981-12-03',950,NULL,30),
(7902,'Ford','Analyst',7566,'1981-12-04',3000,NULL,20),
(7934,'Miller','Clerk',7782,'1982-01-23',1300,NULL,10);

select * 
from EMP;


#QUERY-1
SELECT ENAME
FROM EMP
WHERE JOB IN ('Analyst','Salesman');

#QUERY-2
SELECT *
FROM EMP
WHERE HIREDATE<'1981-09-30';

#QUERY-3
SELECT ENAME
 FROM EMP
 WHERE JOB NOT in('Manager');
 
 #QUERY-4
 SELECT ENAME
 FROM EMP
 WHERE EMPNO in (7369,7521,7839,7934,7788);
 
 #QYERY-5
 SELECT *
 FROM EMP
WHERE DEPTNO NOT in (30,40,10);

#QUERY-6
SELECT ENAME
FROM emp
WHERE HIREDATE between '1981-06-30' AND '1981-12-31';

#QUERY-7
SELECT distinct JOB
FROM EMP;

#QUERY-8
SELECT ENAME 
FROM EMP 
WHERE COMM is NULL;

#QUERY-9
SELECT ENAME, JOB 
FROM EMP 
WHERE MGR is NULL;

#QUERY-10
SELECT ENAME 
FROM EMP
WHERE DEPTNO is NULL;

#QUERY-11
SELECT *
FROM EMP
WHERE COMM is NOT NULL;

#QUERY-12
SELECT *
FROM EMP
WHERE ENAME like 'S%' OR '%s';

#QUERY-13
SELECT *
FROM EMP
WHERE ENAME like '_i%';

#QUERY-14
SELECT COUNT(*)
FROM EMP;

#QUERY-15
SELECT COUNT(distinct JOB) JOB_NO
FROM EMP;

#QUERY-16
SELECT SUM(SAL)
FROM EMP;

#QUERY-17
SELECT MAX(SAL),MIN(SAL),AVG(SAL)
FROM EMP;

#QUERY-18
SELECT MAX(SAL)
FROM EMP
WHERE JOB='Salesman';

 
