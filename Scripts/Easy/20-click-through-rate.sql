SELECT
  app_id,
  ROUND(100.0 * 
    COUNT(*) FILTER (WHERE event_type = 'click') /
    COUNT(*) FILTER (WHERE event_type = 'impression'), 2 
  ) AS ctr
FROM 
  events
WHERE 
  EXTRACT(YEAR FROM timestamp) = 2022
GROUP BY
  app_id;