-- Write your PostgreSQL query statement below
-- PostgreSQL
-- PostgreSQL
WITH daily AS (
  SELECT
    visited_on,
    SUM(amount) AS amount
  FROM Customer
  GROUP BY visited_on
),
w AS (
  SELECT
    visited_on,
    amount,
    SUM(amount) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS sum_7d,
    COUNT(*)  OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS cnt_7d
  FROM daily
)
SELECT
  visited_on,
  sum_7d AS amount,
  ROUND(sum_7d::numeric / 7, 2) AS average_amount
FROM w
WHERE cnt_7d = 7
ORDER BY visited_on;
