SELECT 
  ROUND(
    1.0 * COUNT(texts.email_id)/
    COUNT(DISTINCT emails.email_id), 2 
  ) AS activation_rate
FROM 
  emails
  LEFT JOIN texts 
    ON emails.email_id = texts.email_id
       AND signup_action = 'Confirmed';

-- First left join emails and texts tables based on email_id andsignup_action = 'Confirmed'
-- Calculate activation_rate using count() on two tables (email_id field)