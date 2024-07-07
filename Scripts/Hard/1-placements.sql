SELECT
    s.name
FROM
    Students as s 
        JOIN Packages as p
            USING (id)
        JOIN Friends as f
            USING (id)
        JOIN Packages as p2
            ON f.friend_id = p2.id
WHERE
    p.salary < p2.salary
ORDER BY
    p2.salary;