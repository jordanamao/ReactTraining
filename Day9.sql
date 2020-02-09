create table emp1(empid int, empname char(10), location char(10));
insert into emp1 values (1, "Jordan", "bellevue");
insert into emp1 values (2, "Hannah", "bellevue");
insert into emp1 values (3, "Demi", "bellevue");


delimiter //
create procedure test2(IN name char(20)) 
begin
-- 	insert into emp1 values(@empid, @empname, @location);
select * From emp1 where empname = name;
end//
delimiter ;

call test2 ("Jordan");

delimiter //
create procedure test1 (in empid int,in empname char(10),in location char(10))
begin
insert into emp1 values (1, "Jordan", "bellevue");
end//

delimiter ;

call test1 (2,"Hannah","Washington");

select empname,location from department where deptno=40;

create index employee_id_index ON emp1(empid);

#aggregate functions
#count()

select * from emp;
select empid, count(*) totalemployee from emp group by empid;

select empid, sum(salary) totalemp from emp group by empid;

select empid, max(salary) totalemp from emp group by empid;

select empid, avg(salary) totalemp from emp group by empid;

select empid, count(*) totalemp from emp group by empid having count(*)>2;

select empid, sum(salary)empsalary from emp group by empid having sum(salary)>1000;

















