select
    project_id,
    round(
        avg(experience_years),
        2) as average_years
from    
    Project as p
    join Employee as e
        on e.employee_id = p.employee_id
group by
    project_id;