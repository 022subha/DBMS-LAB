show databases;
create database assignment_5;
use assignment_5;


CREATE TABLE Customer
(cust_id int(10) PRIMARY KEY CHECK(cust_id BETWEEN 100 AND 10000),
annual_revenue int(10),
cust_type varchar(30) CHECK(cust_type IN ('MANUFACTURER','WHOLESALER','RETAILER')));

desc Customer;

show create table Customer;


CREATE TABLE Truck
(truck_no int(10) PRIMARY KEY,
driver_name varchar(30));

desc Truck;

show create table Truck;

CREATE TABLE City
(city_name varchar(30) PRIMARY KEY,
population int(20));

desc City;

show create table City;


CREATE TABLE Shipment
(shipment_no int(10),
cust_id int(10),
weight int(10) CHECK(weight<1000),
truck_no int(10),
destination varchar(30),
ship_date date,
PRIMARY KEY(shipment_no,cust_id),
constraint cust_id foreign key(cust_id) references Customer(cust_id) on delete cascade,
constraint truck_no foreign key(truck_no) references Truck(truck_no) on delete set null,
constraint destination foreign key(destination) references City(city_name) on delete cascade);

desc Shipment;

show create table Shipment;


show tables;

INSERT into Customer
values
(103,150000,'RETAILER','Akash'),
(104,200000,'RETAILER','Sai'),
(105,400000,'RETAILER','Prasad'),
(107,275000,'WHOLESALER','Subhajit'),
(108,800000,'MANUFACTURER','Anubhav'),
(109,250000,'RETAILER','Tahha'),
(112,1000000,'MANUFACTURER','Vijay'),
(116,650000,'WHOLESALER','Vicky'),
(118,600000,'WHOLESALER','Pradip'),
(120,400000,'WHOLESALER','Ram');

select *
from Customer;

INSERT into Truck
values
(1,'IQBAL'),
(2,'RAHIM'),
(3,'RAM'),
(4,'MADAN'),
(5,'SURYA'),
(6,'MOHAN'),
(7,'MITHUN');

select *
from Truck;

INSERT into City
values
('Kolkata',55000000),
('Chennai',60000000),
('Mumbai',80000000),
('Delhi',70000000),
('Pune',10000000),
('Medinipur',600000);

select *
from City;


INSERT into Shipment
values
(100,103,220,2,'Kolkata','2021-12-31'),
(100,104,210,4,'Chennai','2021-12-30'),
(100,105,200,5,'Kolkata','2021-12-29'),
(101,105,400,5,'Chennai','2021-12-28'),
(101,107,50,7,'Mumbai','2021-12-27'),
(102,105,101,5,'Mumbai','2021-12-26'),
(102,108,66,6,'Kolkata','2022-12-25'),
(102,109,202,7,'Chennai','2022-12-24'),
(102,112,350,1,'Delhi','2022-12-23'),
(103,116,320,1,'Medinipur','2022-12-22'),
(105,118,460,2,'Pune','2022-12-21'),
(105,120,60,6,'Chennai','2022-12-20'),
(106,105,70,5,'Delhi','2022-12-19'),
(107,105,100,5,'Medinipur','2022-12-18'),
(109,105,70,5,'Pune','2022-12-17'),
(109,103,120,4,'Kolkata','2022-12-16');

select *
from Shipment;


#QUERY-1
select cust_name from Customer 
where cust_id in (select cust_id
from Shipment
where destination='Kolkata')
AND
cust_id in (select cust_id
from Shipment
where destination='Mumbai')
AND
cust_id in (select cust_id
from Shipment
where destination='Chennai');


#QUERY-2
select driver_name
from Truck
where truck_no in (select truck_no
from Shipment
where weight>200);

#QUERY-3
select max(weight) MAX_WEIGHT,min(weight) MIN_WEIGHT
from Shipment;

#QUERY-4
select cust_id,avg(weight)
from Shipment
group by cust_id;

#QUERY-5
select city_name,population
from City
where city_name in (select destination
from Shipment
where weight>100);

#QUERY-6
select destination
from Shipment
group by cust_id
having count(distinct destination)=(select count(*)
from City);

#QUERY-7
select destination,max(weight)
from Shipment
group by destination;

#QUERY-8
select cust_name,annual_revenue
from Customer
where cust_id in (select cust_id
from Shipment
where truck_no in (select truck_no
from Truck
where driver_name='IQBAL'));

#QUERY-9
select driver_name
from Truck
where truck_no in (select truck_no
from Shipment
group by truck_no
having count(distinct destination)=(select count(*) from City));


#QUERY-10
select destination,min(weight)
from Shipment
where destination in (select city_name
from City
where population>1000000)
group by destination;