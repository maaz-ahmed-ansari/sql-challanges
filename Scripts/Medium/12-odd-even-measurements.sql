WITH odd_even_rnk_cte AS
  (
    SELECT 
      *,
      CAST(measurement_time AS DATE)  AS measurement_day,
      ROW_NUMBER() OVER(PARTITION BY
                          CAST(measurement_time AS DATE) 
                        ORDER BY 
                          measurement_time) AS rnk
    FROM 
      measurements
  )
SELECT
  measurement_day,
  SUM(measurement_value) FILTER (WHERE rnk % 2 != 0) AS odd_sum,
  SUM(measurement_value) FILTER (WHERE rnk % 2 = 0) AS even_sum
FROM
  odd_even_rnk_cte
GROUP BY
  measurement_day
ORDER BY
  measurement_day;

-- Note:
-- TO_CHAR(DATE_TRUNC('day', measurement_time), 'MM/DD/YYYY HH24:MI:SS') AS measurement_day
-- and  CAST(measurement_time AS DATE)  AS measurement_day produce different results

-- TO_CHAR produces a string output.
-- CAST produces a date output.
