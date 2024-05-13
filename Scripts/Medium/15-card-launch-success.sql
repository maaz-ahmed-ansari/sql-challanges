WITH ranked_cte AS
  (
    SELECT 
      *,
      ROW_NUMBER() OVER(PARTITION BY card_name ORDER BY issue_year, issue_month) AS rn 
    FROM 
      monthly_cards_issued
  )
SELECT
  card_name,
  issued_amount
FROM
  ranked_cte
WHERE
  rn = 1
ORDER BY
  issued_amount DESC;