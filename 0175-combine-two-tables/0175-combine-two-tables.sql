-- Write your PostgreSQL query statement below
select P.firstName,p.lastName,A.city,A.state 
from person p
left join Address A on p.personId=A.personId
