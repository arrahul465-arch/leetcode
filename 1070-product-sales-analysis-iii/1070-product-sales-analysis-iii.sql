-- Write your PostgreSQL query statement below
select s.product_id,s.year as first_year,s.quantity,s.price
from sales s
join(
    select product_id,min(year) as first_year
    from sales
    group by product_id
)as sales2
on s.product_id=sales2.product_id
where s.year=sales2.first_year;

