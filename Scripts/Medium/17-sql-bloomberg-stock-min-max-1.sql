WITH highest_lowest_cte AS
  (
    SELECT 
      *,
      ROW_NUMBER() OVER(PARTITION BY ticker ORDER BY open DESC) AS highest_rnk,
      ROW_NUMBER() OVER(PARTITION BY ticker ORDER BY open) AS lowest_rnk
    FROM 
      stock_prices
  ),
  highest_open_cte AS
  (
    SELECT
      ticker,
      TO_CHAR(date, 'Mon-YYYY') AS highest_mth,
      open AS highest_open
    FROM
      highest_lowest_cte
    WHERE
      highest_rnk = 1
  ),
  lowest_open_cte AS
  (
    SELECT
      ticker,
      TO_CHAR(date, 'Mon-YYYY') AS lowest_mth,
      open AS lowest_open
    FROM
      highest_lowest_cte
    WHERE
      lowest_rnk = 1
  )
SELECT  
  hoc.ticker,
  highest_mth,
  highest_open,
  lowest_mth,
  lowest_open
FROM
  highest_open_cte AS hoc
  JOIN lowest_open_cte AS loc
    ON hoc.ticker = loc.ticker
  