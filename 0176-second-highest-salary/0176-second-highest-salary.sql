-- Write your PostgreSQL query statement below
select max (salary) as SecondHighestSalary 
from employee e
where salary<(
    select max(salary) from employee e
);