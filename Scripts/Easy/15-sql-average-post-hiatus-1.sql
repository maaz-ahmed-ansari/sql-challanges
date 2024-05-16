SELECT
  user_id,
  MAX(CAST(post_date AS DATE)) - MIN(CAST(post_date AS DATE)) AS days_between
FROM
  posts
WHERE
  EXTRACT(YEAR FROM post_date) = 2021
GROUP BY
  user_id
HAVING
  COUNT(post_id) > 1;