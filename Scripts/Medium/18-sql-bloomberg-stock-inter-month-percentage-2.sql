WITH current_prev_cte AS
  (
    SELECT 
      ticker,
      date,
      close as current_close,
      LAG(close) OVER(PARTITION BY ticker ORDER BY date) AS prev_close
    FROM 
      stock_prices
  )
SELECT
  ticker,
  date,
  current_close AS close,
  ROUND(100 * (current_close - prev_close) / prev_close, 2) AS intermth_change_pct
FROM
  current_prev_cte
ORDER BY
  ticker, date;