SELECT
    TO_CHAR(trans_date, 'YYYY-MM') AS month,
    country,
    COUNT(1) AS trans_count,
    COUNT(1) FILTER (WHERE state = 'approved') AS approved_count,
    COALESCE(SUM(amount), 0) AS trans_total_amount,
    COALESCE(SUM(amount) FILTER (WHERE state = 'approved'), 0) AS approved_total_amount
FROM
    Transactions
GROUP BY
    2, 1;

-- More Readable:

WITH transaction_cte AS (
    SELECT
        TO_CHAR(trans_date, 'YYYY-MM') AS month,
        country,
        state,
        amount
    FROM
        Transactions
)
SELECT
    month,
    country,
    COUNT(*) AS trans_count,
    COUNT(*) FILTER (WHERE state = 'approved') AS approved_count,
    COALESCE(SUM(amount), 0) AS trans_total_amount,
    COALESCE(SUM(amount) FILTER (WHERE state = 'approved'), 0) AS approved_total_amount
FROM
    transaction_cte
GROUP BY
    month,
    country
ORDER BY
    month,
    country;