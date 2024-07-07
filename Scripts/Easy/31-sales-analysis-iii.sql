SELECT
    p.product_id,
    p.product_name
FROM
    Product as p JOIN
    Sales as s
        ON p.product_id = s.product_id
GROUP BY
    p.product_id,
    p.product_name
HAVING
    MIN(s.sale_date) >= TO_DATE('2019-01-01', 'YYYY-MM-DD') AND
    MAX(s.sale_date) <= TO_DATE('2019-03-31', 'YYYY-MM-DD')