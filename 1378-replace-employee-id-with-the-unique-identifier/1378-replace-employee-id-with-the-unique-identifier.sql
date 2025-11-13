# Write your MySQL query statement below
select eUNI.unique_id,e.name from employees e
left join employeeUNI  eUNI on e.id=eUNI.id;