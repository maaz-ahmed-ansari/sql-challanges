WITH total_pharmacy_sales AS
  (
    SELECT 
      manufacturer,
      SUM(total_sales) AS sale
    FROM 
      pharmacy_sales
    GROUP BY
      manufacturer
    ORDER BY
      2 DESC,
      1
  )
SELECT
  manufacturer,
  CONCAT(
    '$',
    ROUND(
      sale / 1000000.0
      , 0),
    ' million'
  ) AS sale
FROM
  total_pharmacy_sales


-- Alternate way
SELECT 
  manufacturer,
  '$' || ROUND(SUM(total_sales) / 1000000) || ' million' AS sale
FROM pharmacy_sales
GROUP BY manufacturer
ORDER By SUM(total_sales) DESC;
