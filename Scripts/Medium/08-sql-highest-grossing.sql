-- To identify the highest-grossing products, we need to calculate the total spend for each category and product. 

WITH total_product_spend AS
  (
    SELECT
      category,
      product,
      SUM(spend) AS total_spend
    FROM  
      product_spend
    WHERE
      EXTRACT(YEAR FROM transaction_date) = 2022
    GROUP BY
      category,
      product
  ),
  
ranked_product_spend AS
  (
    SELECT
      *,
      ROW_NUMBER() OVER(
        PARTITION BY category 
        ORDER BY total_spend DESC) as rn
    FROM
      total_product_spend
  )

SELECT
  category,
  product,
  total_spend
FROM
  ranked_product_spend
WHERE
  rn <= 2
ORDER BY
  category, rn;
