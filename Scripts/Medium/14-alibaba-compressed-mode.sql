WITH ranked_cte AS
  (
    SELECT
      *,
      DENSE_RANK() OVER(ORDER BY order_occurrences DESC) as rank 
    FROM 
      items_per_order
  )
SELECT
  item_count AS mode
FROM
  ranked_cte
WHERE
  rank = 1
ORDER BY
  1;