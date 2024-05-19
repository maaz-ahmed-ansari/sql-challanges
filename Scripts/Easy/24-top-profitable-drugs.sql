SELECT 
  drug,
  ROUND(total_sales - cogs, 2) AS total_profit
FROM 
  pharmacy_sales
ORDER BY
  2 DESC
LIMIT 3;