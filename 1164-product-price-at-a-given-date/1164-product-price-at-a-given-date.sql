-- Write your PostgreSQL query statement below
SELECT 
  p1.product_id,
  COALESCE(p2.new_price, 10) AS price
FROM (
  SELECT DISTINCT product_id 
  FROM Products
) p1
LEFT JOIN (
  SELECT 
    product_id, 
    new_price,
    change_date
  FROM Products
  WHERE change_date <= '2019-08-16'
) p2 ON p1.product_id = p2.product_id
  AND p2.change_date = (
    SELECT MAX(change_date)
    FROM Products p3
    WHERE p3.product_id = p1.product_id
      AND p3.change_date <= '2019-08-16'
  )
ORDER BY p1.product_id;