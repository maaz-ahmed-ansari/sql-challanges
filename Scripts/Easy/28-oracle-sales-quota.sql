SELECT 
  DISTINCT d.employee_id,
  CASE 
    WHEN SUM(deal_size) OVER(PARTITION BY d.employee_id) >= quota
    THEN 'yes'
    ELSE 'no'
  END AS made_quota
FROM 
  deals AS d 
  JOIN sales_quotas AS sq 
    ON d.employee_id = sq.employee_id
ORDER BY
  1;