SELECT 
  user_id
FROM 
  emails AS e  
  JOIN texts AS t  
    ON e.email_id = t.email_id
WHERE
  signup_action = 'Confirmed'
  AND 
    DATE(action_date) - DATE(signup_date) = 1