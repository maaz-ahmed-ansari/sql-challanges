-- Sol 1
with ranked_employees as
(
    select  *,
            dense_rank() over (partition by department_id order by salary desc) as rnk
    from    employees
)
select  concat(first_name, ' ', last_name) as employee_name,
        d.name as department_name,
        re.salary
from    ranked_employees as re 
        join departments as d
            on re.department_id = d.id
where   rnk <= 3
order   by  d.name, 
            salary desc;



-- Sol 2
-- with ranked_employees as
-- (
--     select  *,
--             dense_rank() over (partition by department_id order by salary desc) as rnk
--     from    employees
-- ),
-- cleaned_ranked as
-- (
--     select  department_id,
--             concat(first_name, ' ', last_name) as employee_name,
--             salary
--     from    ranked_employees
--     where   rnk <= 3
-- )
-- select  employee_name,
--         d.name as department_name,
--         salary
-- from    cleaned_ranked as cr 
--         join departments as d 
--             on  cr.department_id = d.id 

