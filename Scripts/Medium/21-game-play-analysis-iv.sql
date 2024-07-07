-- Simple Solution

WITH ranked_activity AS (
    SELECT
        *,
        MIN(event_date) OVER (PARTITION BY player_id) AS first_event_date
    FROM
        Activity
)
SELECT
    ROUND( 1.0 * SUM(CASE 
                        WHEN event_date - first_event_date = 1 THEN 1
                        ELSE 0 
                    END
                ) 
            / COUNT(DISTINCT player_id),
            2
    ) AS fraction
FROM
    ranked_activity

-- Get earliest event_date for each player
-- Calculate fraction of no. of players visited consecutive after first day divided by total no. of players
    -- Get this by: sum the number of players by checking if event_date - first_event_date = 1 and divide it by count of distinct players
    -- Make it as fraction by multiplying by 1.0 and round it to 2 decimal places