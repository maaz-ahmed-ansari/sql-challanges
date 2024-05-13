WITH ut_max AS
  (
    SELECT
      user_id,
      MAX(transaction_date) AS max_transaction_date
    FROM 
      user_transactions
    GROUP BY
      user_id
  )
SELECT
  ut.transaction_date,
  ut.user_id,
  COUNT(*) AS purchase_count
FROM
  user_transactions AS ut
  JOIN ut_max
    ON ut.user_id = ut_max.user_id
       AND ut.transaction_date = ut_max.max_transaction_date
GROUP BY
  2, 1
ORDER BY
  1;

-- In subquery ut_max calculat user_id and max transaction_date grouped by user_id
-- Then Inner Join this cte with user_transactions table on user_id and max_transaction date = transaction date
-- Get count() grouped by user_id
-- Display transaction_date, user_id and count (in group by clause can use transaction_date as 2nd parameter/arg)