-- Write your PostgreSQL query statement below
WITH counts AS (
  SELECT
    CASE
      WHEN income < 20000 THEN 'Low Salary'
      WHEN income <= 50000 THEN 'Average Salary'
      ELSE 'High Salary'
    END AS category,
    COUNT(*) AS cnt
  FROM Accounts
  GROUP BY 1
),
categories AS (
  SELECT 'Low Salary' AS category
  UNION ALL
  SELECT 'Average Salary'
  UNION ALL
  SELECT 'High Salary'
)
SELECT
  c.category,
  COALESCE(cnt, 0) AS accounts_count
FROM categories c
LEFT JOIN counts t
ON c.category = t.category;
