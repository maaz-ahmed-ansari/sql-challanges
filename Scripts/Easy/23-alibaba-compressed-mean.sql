SELECT 
  ROUND(
    CAST(
      SUM(item_count * order_occurrences)/
      SUM(order_occurrences)
      AS numeric
    ),
    1
  )
FROM 
  items_per_order;