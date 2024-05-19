WITH loss_over_sales AS
(
SELECT 
  manufacturer,
  cogs - total_sales AS loss
FROM 
  pharmacy_sales
WHERE
  total_sales - cogs < 0
)
SELECT
  manufacturer,
  COUNT(*) AS drug_count,
  SUM(loss) AS total_loss
FROM
  loss_over_sales
GROUP BY
  manufacturer
ORDER BY
  3 DESC;