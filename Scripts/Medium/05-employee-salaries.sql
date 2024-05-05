with employees_count as
(
    select  *,
            count(*) over (partition by department_id) as emp_count,
            case 
                when salary > 100000 then 1
                else 0    
            end as salary_over_100k
    from    employees
),
over_100k as
(
    select  *,
            cast(sum(salary_over_100k) over (partition by department_id) as float) / 
            count(*) over (partition by department_id) 
                as percentage_over_100k
    from    employees_count
    where   emp_count >= 10
)
select  distinct percentage_over_100k,
        d.name as department_name,
        emp_count as number_of_employees
from    over_100k o1
        join departments as d 
            on o1.department_id = d.id 
order   by 1 desc 
limit   3
