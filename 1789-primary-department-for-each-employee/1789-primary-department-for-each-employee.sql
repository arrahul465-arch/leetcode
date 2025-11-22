# Write your MySQL query statement below
select e.employee_id,e.department_id from employee e
where primary_flag='y' or employee_id in(select employee_id from employee
group by employee_id
having count(*)=1);
