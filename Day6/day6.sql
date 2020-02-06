use db;
create database training;


#DDL- Data Definition Language
create table emp(emp_id int, emp_name char(10), emp_location char(10));

select * from emp; 
create table emp1(emp_id int primary key, emp_name char(10) not null, emp_locaton char(10) unique);

select * from emp1;

alter table emp add emp_email varchar(10);

alter table emp modify emp_name varchar(15);

alter table emp drop column emp_name;
drop table emp;

#DML- Data manipulation language
insert into emp1(emp_id,emp_name,emp_locaton)values(1,'robert','denver');
insert into emp1(emp_id,emp_name,emp_locaton)values(31,'robert2','denver3');

desc emp1;

update emp1 set emp_locaton ='seattle' where emp_name='robert';
delete from emp1 where emp_locaton="denver1";

truncate emp1;

select * from emp











