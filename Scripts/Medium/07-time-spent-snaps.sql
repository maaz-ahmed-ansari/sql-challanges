-- Solution - 1

SELECT
  age.age_bucket,
  ROUND(100 *
    SUM(act.time_spent) FILTER (WHERE act.activity_type = 'send') /
      SUM(act.time_spent), 2) AS send_perc,
  ROUND(100 *
    SUM(act.time_spent) FILTER (WHERE act.activity_type = 'open') /
      SUM(act.time_spent), 2) AS open_perc
FROM  
  activities AS act 
  JOIN age_breakdown AS age
    ON act.user_id = age.user_id
WHERE 
  act.activity_type IN ('send', 'open')
GROUP BY
  age.age_bucket;

-- Solution - 2

WITH  grouped_time_spent AS
  (
    SELECT
      age.age_bucket,
      SUM(CASE WHEN act.activity_type = 'send' THEN act.time_spent ELSE 0 END) AS send_time_spent,
      SUM(CASE WHEN act.activity_type = 'open' THEN act.time_spent ELSE 0 END) AS open_time_spent,
      SUM(act.time_spent) AS total_time_spent
    FROM  
      activities AS act 
      JOIN age_breakdown AS age
        ON act.user_id = age.user_id
    WHERE
      act.activity_type IN ('send', 'open')
    GROUP BY
      age.age_bucket
  )
SELECT 
  age_bucket,
  ROUND(100 * send_time_spent / total_time_spent, 2) AS send_perc,
  ROUND(100 * open_time_spent / total_time_spent, 2) AS open_perc
FROM  
  grouped_time_spent;