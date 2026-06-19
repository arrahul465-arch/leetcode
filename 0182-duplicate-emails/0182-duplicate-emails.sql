-- Write your PostgreSQL query statement below
select p.email from person p
group by email
having count(*)>1;