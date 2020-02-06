create table eempidsmp2(empid int, empname char(10), emplocation char(10));

#sp_help emp2;
#sp_rename'emp2.emplocation','location' for mysql server


INSERT INTO `training`.`emp2`
(`empid`,
`empname`,
`emplocation`,
`emp_salary`)
VALUES
(1,
'John',
'London',
1200);

CREATE TABLE EMP4(EMPID INT NOT NULL AUTO_INCREMENT PRIMARY KEY, EMP_NAME CHAR(10),SALARY INT);

SELECT * FROM EMP4;

INSERT EMP4 VALUES (1,'Jordan',100);
INSERT EMP4 VALUES (2,'Hannah', 1200);

INSERT EMP4 VALUES ('Joe', 1200);

SELECT* FROM EMP4;

CREATE TABLE EMP5(EMPID INT NOT NULL AUTO_INCREMENT PRIMARY KEY, EMP_NAME CHAR(10),SALARY INT);
INSERT EMP5 VALUES (21,'Jordan', 1200);
INSERT EMP5 VALUES (30,'Jordan', 1200);
INSERT INTO EMP5 VALUES (null,'Jordan', 1200);
INSERT INTO EMP5 (EMP_NAME,SALARY) VALUES ('Jordan', 1200);
SELECT* FROM EMP5;

INSERT INTO EMP5 (EMP_NAME,SALARY,EMP_LOCATION) VALUES ('Jeremy', 1200,'London');
INSERT INTO EMP5 (EMP_NAME,SALARY,EMP_LOCATION) VALUES ('Jlo', 1200,'Japan');
INSERT INTO EMP5 (EMP_NAME,SALARY,EMP_LOCATION) VALUES ('Shakira', 1200,'Tokyo');
INSERT INTO EMP5 (EMP_NAME,SALARY,EMP_LOCATION) VALUES ('Jimmy', 1200,'Amsterdam');

SELECT* FROM EMP5;

select empid,emp_name from emp5;

#select specific columns
select empid,emp_name,salary,emp_location from emp5;

#changin the name for runtime purposes
select empid as id, emp_name as name, salary from emp5;

select emp_name as EmpName, (salary*12) as empsalary from emp5;

select emp_name emp_location  from emp5;

select concat (emp_name, emp_location) from emp5;


create table emp6(empid int, salary int CONSTRAINT emp_chk CHECK(salary>100));
insert emp6 values(1,200);
select * from emp6;
insert emp6 values(2,10);

#multiple constraints can be implemented 
create table emp7(empid int CONSTRAINT emp_chk1 check(empid is not null), empsalary int CONSTRAINT emp_chk2 CHECK(empsalary>100));
insert emp7 values(null,300);
select * from emp7;
insert emp7 values(2,500);

create table department(deptno int primary key, name char(10), location char(10));
insert department values(10,'robert', 'chennai');
insert department values(10,'robert1', 'numbai');
insert department values(10,'robert2', 'chai');
insert department values(10,'robert3', 'bangalore');

select* from department;

create table emp8(empid int, empname char(10), salary int, deptno int, foreign key (deptno)references department(deptno));

select * from emp8;

#CREATE USER 'Hannah'@'localhost' IDENTIFIED BY '123456';
# GRANT ALL PRIVILEGES ON *.* TO 'Jordan';

create table books (title_id char(20), book_name char(20) not null, book_price int);
insert books values ('AU101', 'Harry potter', 20);
insert books values ('BU2032', 'The hunger games', 30);
insert books values ('DW4032', 'Percy Jackson', 10);
insert books values ('ERT304', 'The help', 5);

select * from books;

#1.Display what each books price would be if a 20% price increase
#were to take place. Show the title id , old price and new price using
#meaningful headings.

select title_id, book_price as old_price, (book_price*1.2) as new_price from books;

#2. Display the name of books whose price are greater than $20  
#and less than $55.

select book_name from books where book_price between 20 and 55;

#3.Display the numeric part of every 
#title id (the numeric part of the title eg BU1032 , 1032)

select REGEXP_REPLACE(title_id, '[A-Z]', '') from books;

select REGEXP_SUBSTR(title_id, '[^A-Z]') from books;

#4 1.You want to retrieve data for all the employees who 
#joined after  '1-12-90' have 4 ñ 6 years of experience.

















