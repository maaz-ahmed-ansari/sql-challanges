WITH grouped_cte AS
  (
    SELECT 
      policy_holder_id,
      COUNT(*) OVER(PARTITION BY policy_holder_id) AS calls_by_holder_id
    FROM 
      callers
  )
SELECT
  COUNT(DISTINCT policy_holder_id)
FROM
  grouped_cte
WHERE
  calls_by_holder_id > 2;