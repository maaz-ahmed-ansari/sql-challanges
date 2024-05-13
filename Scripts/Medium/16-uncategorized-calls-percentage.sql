SELECT 
  ROUND(100.0 *
    (COUNT(*) - COUNT(CASE WHEN call_category = 'n/a' THEN NULL ELSE call_category END))/ 
      COUNT(*), 1) AS uncategorised_call_pct
FROM 
  callers;
