-- Write your PostgreSQL query statement below
select  e.name,
        b.bonus
from    Employee as e
        left join Bonus as b
            on e.empId = b.empId
where   b.bonus < 1000 
        or b.bonus is null;

-- If the EmpId in table Employee has no match in table Bonus, we consider that the corresponding bonus is null and null is smaller than 1000.
-- Inner join is the default join, we can solve the mismatching problem by using outer join.