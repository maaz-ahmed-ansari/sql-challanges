
WITH ranked_emp AS (
    SELECT
        e.*,
        DENSE_RANK() OVER (PARTITION BY e.departmentId ORDER BY salary DESC) AS rnk
    FROM
        Employee e 
)
SELECT
    d.name AS Department,
    re.name AS Employee,
    re.salary AS Salary
FROM
    ranked_emp AS re JOIN
    Department AS d
        ON re.departmentId = d.id
WHERE
    rnk <= 3;