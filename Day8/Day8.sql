create table student(studentid int, studentname varchar(10), courseid int);
create table course (courseid int, coursename varchar(10));
insert into student values (100,'Robert',10);
insert into student values (101,'John',20);
insert into student values (102,'Joel',20);
insert into student values (103,'Soloman',30);

select * from student;

insert into course values(10,'SAM');
insert into course values(11,'SMITH');
insert into course values(30,'Jose');

select* from student;
select* from course;

#inner join, will only select values that are matching (only the courseid that arem matching
select * from student 
inner join course 
on student.courseid=course.courseid;

#left (same as left outer join), will select all values from left table, and the matching values
select * from student
left outer join course
on student.courseid=course.courseid;

#right join (same as right outer join), will select all values from right table, and the matching values
select * from student
right outer join course
on student.courseid=course.courseid;

#full join (same as right outer join), will select all values from right table, and the matching values
select * from student
full join course
on student.courseid=course.courseid;

#full join (same as right outer join), will select all values from right table, and the matching values
select * from student
left outer join course
on student.courseid=course.courseid
union
select * from student
right outer join course
on student.courseid=course.courseid;

#cross join: no condition needed, no common column needed, it is called product of rows.
select * from student
cross join course;

#equal join
select * from student,course
where student.courseid=course.courseid;

#non-equal join
select * from student,course
where student.courseid>course.courseid;

#self join
select * from student s1,student s2
where s1.studentid=s2.studentid
and s2.studentname="ROBERT";


#TCL
create table branch (bcode int, bname varchar(10),blocation varchar(10));
insert into branch values(100,'SBI', 'CHENNA');
select * from branch;
insert into branch values(101,'ICIC','BANGALORE');
commit;

start transaction;
insert into branch values(103,'ICIC','BANGALORE');
rollback;


delete from branch where bcode = 103;


-- create table (DDL command)
create table pet
(
	pet_id int,
    pet_type varchar(100)
);

-- set session so no autocommits are completed
set session autocommit = 0;

# COMMIT

-- insert a record
insert into pet values(1, 'dog');

-- first commit
commit;

-- insert more records
insert into pet values(2, 'cat');
insert into pet values(3, 'rabbit');

-- what records are in our table
select * from pet;


# ROLLBACK

-- undo everything up until the last commit
rollback;
select * from pet;


# AUTOCOMMIT WITH DDL

-- insert another value
insert into pet values(4, 'turtle');

-- truncate table
truncate table pet;

insert into pet values(5, 'fish');
insert into pet values(6, 'snake');

-- rollback to last commit: truncate
rollback;
select * from pet;


# SAVEPOINT

#    1 |..... 2 ....... 3 .... 4 ....... 

-- insert
savepoint before_insert;
insert into pet values(1, 'dog');
insert into pet values(2, 'cat');

-- check our table
select * from pet;

-- delete
savepoint before_delete;
delete from pet where pet_id = 1;

-- check our table
select * from pet;

-- update
savepoint before_update;
update pet set pet_type = 'fish' where pet_id = 2;

-- check our table
select * from pet;


-- rollback to savepoints
rollback to before_update;
select * from pet;

rollback to before_delete;
select * from pet;

rollback to before_insert;
select * from pet;

-- regular rollback
rollback;
select * from pet;

create table emp(empid int, empname varchar(10),salary int);
insert into emp values(10,'robert',25000);
insert into emp values(20,'john',5000);
insert into emp values(30,'joel',50000);
insert into emp values(40,'sam',1000);
insert into emp values(50,'josed',25000);
insert into emp values(50,'smith',25000);

select * from emp;


select empid, empname,salary
from emp
where salary > (select salary from emp where empname = 'SMITH');

#query to display emp detials from the table whose dept is same as the department of emp smith or sam

create table department1 (empid int, empname varchar(20), salary int, deptname varchar(10));
insert into department1 values(101, 'Robert', 25000,'SAP');
insert into department1 values(102, 'Smith', 55000,'SQL');
insert into department1 values(103, 'Soloman', 655000,'SAP');
insert into department1 values(104, 'John', 20000,'CS');
insert into department1 values(105, 'Joel', 75000,'HR');
insert into department1 values(105, 'Smith', 85000,'SQL');

select * from department1 where deptname in(select deptname from department1 where empname='SMITH' or empname='Jose');

select * from department1;


#simple view
#select from a single table
create view v1 as select * from department1;
select * from department1;
select * from v1;

insert into v1 values(60, 'Robert', 20000, 'cs');
update v1 set deptna='sap';
delete from v1;

#complex view
#select from multiple table
create table table1(empid int, empname varchar(10), salary int);
insert into table1 values(101,'Robert',20000);
insert into table1 values(102,'Joel',50000);
insert into table1 values(103,'John',35000);
insert into table1 values(104,'Solomon',75000);
create table table2(empid int, empname varchar(10), salary int);
insert into table2 values(201,'Smith',40000);
insert into table2 values(202,'Sam',20000);
insert into table2 values(203,'Robert',55000);
insert into table2 values(204,'John',55000);
select* from table1;
select* from table2;

create view dv2 as 
select* from table1
union
select* from table2;

select* from dv2;
insert into dv2 values(205,'RAJA',500);
update dv2 set salary=100;
delete from dv2 where empid=100;

#creating a view is basically creating a copy,
#cannot insert update and delete


#####################################################
#hw
#####################################################
create table qualmast (
qual_code varchar(4),
qual_name varchar(40)
);

insert into qualmast values ('BSc','Bachelor of Science');
insert into qualmast values ('Bcom','Bachelor of Commerce');
insert into qualmast values ('BA','Bachelor of Arts');
insert into qualmast values ('MBA','Bachelor of Business Administration');
insert into qualmast values ('Msc','Bachelor of Science');

select * from qualmast;

create table institute (
inst_code varchar(4),
inst_name varchar(40)
);


insert into institute values ('BOMU','Bombay University');
insert into institute values ('IIMA','Indian Institue of Mannagemmnt,Ahmedabad');
insert into institute values ('XLMA','Xavier Labour Research Institute');
insert into institute values ('XLRI','Bachelor of Business Administration');
insert into institute values ('IITB','Indian Institue of Technology,Bombay');

select * from institute;

create table friends (
	fr_num int,
    fr_name varchar(20),
    date_of_birth date,
    sex varchar(1)
);

insert into institute (fr_num, fr_name, date_of_birth,sex) values (1,'Hannah','09-02-2020','f');
insert into institute values (2,'Arienn','2019-09-13', 'f');
insert into institute values (3,'Jeremy','2019-06-24','m');
insert into institute values (4,'John','2020-08-24', 'm');
insert into institute values (5,'Thomas','2020-02-14','m');

create table department1 (
	dept_code varchar (4),
	dept_name varchar (20) not null,
	constraint dept_pk primary key (dept_code)
);

insert into department1 values ('MKTG', 'Marketing');
insert into department1 values ('GEN', 'General Management');
insert into department1 values ('FIN', 'Finance');
insert into department1 values ('SOFT', 'Software');
insert into department1 values ('TRNG', 'Training');
insert into department1 values ('HRD', 'Human Resources Mgmt');
insert into department1 values ('COMM', 'Commercial');
insert into department1 values ('SECY', 'Secretarial');
insert into department1 values ('LEGL', 'Legal');

create table employee (
	emp_code int(5),
	emp_name varchar(25) not null,
	dept_code varchar(4),
	grade varchar(2),
	age int(2),
	date_join date,
	sex varchar(1),
	salary  int(6),
	married varchar(1),
	reports_to int (5),
	constraint employee_pk primary key (emp_code),
	constraint employee_fk01 foreign key (dept_code) references department1 (dept_code)
);

insert into employee values (1, 'Rajiv Jain', 'GEN', 'M1', 35, 
	'1995-01-01', 'M', 16000, 'Y', 0);
insert into employee values (2, 'Ashit Kothari', 'SOFT', 'M3', 27, 
	'1995-01-01', 'M', 6000, 'N', 1);
insert into employee values (3, 'Bimal Mehta', 'SECY', 'S2', 39, 
	'1995-01-01', 'M', 4800, 'Y', 1);
insert into employee values (4, 'Deepak Deo', 'SOFT', 'E2', 39, 
	'1995-01-01', 'M', 8000, 'Y', 2);
insert into employee values (5, 'V V Nath', 'SOFT', 'E2', 49, 
	'1995-01-01', 'M', 8000, 'N', 2);
insert into employee values (6, 'Jayesh Shah', 'SOFT', 'S6', 26,
	'1995-01-01', 'M', 5500, 'N', 5);
insert into employee values (7, 'Rama Kini', 'SOFT', 'S5', 30, 
	'1995-01-01', 'F', 4600, 'Y', 5);
insert into employee values (8, 'Anay Kamat', 'SOFT', 'S5', 33, 
	'1995-01-01', 'M', 5200, 'Y', 5);
insert into employee values (9, 'Gangadhar Kini', 'SOFT', 'M2', 39,
	'1995-01-01', 'M', 8200, 'Y', 1);
insert into employee values (10, 'Sudha Ganesan', 'MKTG', 'M2', 32,
	'1995-01-01', 'F', 12500, 'Y', 1);
insert into employee values (11, 'R Srinivasan', 'MKTG', 'M4', 29, 
	'1995-01-01', 'M', 4900, 'N', 10);
insert into employee values (12, 'S Kannan', 'MKTG', 'E3', 35,
	'1995-01-01', 'M', 6400, 'Y', 11);
insert into employee values (13, 'Neeta Gopinath', 'MKTG', 'M4', 28,
	'1995-01-01', 'F', 5400, 'Y', 10);
insert into employee values (14, 'Manorama Gupta', 'MKTG', 'M5', 27,
	'1995-01-01', 'F', 3100, 'N', 10);
insert into employee values (15, 'Udai Kotecha', 'MKTG', 'M5', 39,
	'1995-01-01', 'M', 6200, 'Y', 10);
insert into employee values (16, 'Anuradha Gadkari', 'FIN', 'M2', 40,
	'1995-01-01', 'F', 10000, 'Y', 1);
insert into employee values (17, 'Santosh Khot', 'FIN', 'M5', 32,
	'1995-01-01', 'M', 3800, 'Y', 16);
insert into employee values (18, 'Ragini Mazumdar', 'FIN', 'M5', 25,
	'1995-01-01', 'F', 3600, 'N', 16);
insert into employee values (19, 'Shivanand Joshi', 'HRD', 'M2', 42,
	'1995-01-01', 'M', 11500, 'Y', 1);
insert into employee values (20, 'Sanjeev Achar', 'HRD', 'S3', 23, 
	'1995-01-01', 'M', 2400, 'N', 19);
insert into employee values (21, 'Neerja Girdhar', 'HRD', 'E2', 24,
	'1995-01-01', 'F', 4200, 'N', 19);
insert into employee values (22, 'Madhusoodan Adiga', 'COMM', 'M4', 36,
	'1995-01-01', 'M', 6000, 'Y', 2);

select * from employee;
#Get a list of all male employees
select * from employee where sex = 'm';
#Get a list of all femaile employees
select * from employee where sex = 'f';

#Get a list of all employees older than 50 years.
select * from employee where age > 50;

#Get a list of all employees between 20 and 30 years of age.
select * from employee where age between 20 and 30;

#Get a list of all employees who have joined the company in the year 1995.

#Get a list of all employees from FIN, HRD and COMM departments.
select * from employee where dept_code = 'FIN' or dept_code = 'HRD' or dept_code = 'COMM';

#Get a list of all employees who are not in HRD department.
select * from employee where dept_code = 'FIN';

#Get a list of all employees whose name starts with the letter A.

#Unmarried male employee greater than 35 years of age, and unmarried female employees greater than 30 years of age are given a "single person special leave". Get a list of all employees eligible for this scheme.

























































