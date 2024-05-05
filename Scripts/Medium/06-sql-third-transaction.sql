WITH transaction_num AS
  (
    SELECT
      *,
      ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY transaction_date) as transaction_no 
    FROM
      transactions 
  )
  
SELECT
  user_id,
  spend,
  transaction_date
FROM  
  transaction_num
WHERE
  transaction_no = 3;
