-- Using GROUP BY
SELECT 
  city,
  COUNT(1) AS total_orders
FROM 
  trades AS t 
  JOIN users AS u 
    ON t.user_id = u.user_id
WHERE
  status = 'Completed'
GROUP BY
  city
ORDER BY
  2 DESC
LIMIT
  3;

-- Using Window function
WITH total_order_cte AS
  (
    SELECT 
      *,
      COUNT(1) OVER(PARTITION BY city) AS total_orders
    FROM 
      trades AS t 
      JOIN users AS u 
        ON t.user_id = u.user_id
    WHERE
      status = 'Completed'
  ),
  ranked_cte AS
  (
    SELECT
      city,
      total_orders,
      ROW_NUMBER() OVER(ORDER BY total_orders DESC) AS rnk 
    FROM
      (SELECT DISTINCT city, total_orders FROM total_order_cte) x
  )
SELECT
  city,
  total_orders
FROM
  ranked_cte
WHERE
  rnk <=3
ORDER BY
  total_orders DESC;
