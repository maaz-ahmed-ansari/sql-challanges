WITH joined_cte AS
  (
    SELECT  
      DISTINCT customer_id,
      product_category
    FROM
      customer_contracts AS c 
      JOIN products as p 
        ON c.product_id = p.product_id
  ),
  ranked_cte AS
  (
    SELECT
      *,
      ROW_NUMBER() OVER(PARTITION BY customer_id) AS num_of_categories
    FROM  
      joined_cte
  )
SELECT
  customer_id
FROM
  ranked_cte
WHERE 
  num_of_categories = (
                      SELECT
                        COUNT(DISTINCT product_category)
                      FROM
                        products
                      )

-- Approach
-- First Get Distinct customer_id and product_category by joining two tables on product_id
-- Then count number of categories for each customer_id using window function
-- Get those customer_id whose number_of_cvcategories is equal to distinct category from products table