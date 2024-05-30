-- Write your PostgreSQL query statement below
-- Solution A: More efficient
with registered_cte as
    (
        select
            contest_id,
            count(user_id) as registerd_count
        from    
            Register
        group by
            contest_id
    ),
    total_users as
    (
        select 
            count(user_id) as total_users
        from
            Users
    )
select
    contest_id,
    round(100.0 * registerd_count/
          total_users, 2) as percentage
from
    registered_cte, total_users
order by
    2 desc,
    1

-- Solution B
with  total_users as
    (
        select 
            count(user_id) as total_users
        from
            Users
    )

select
    distinct contest_id,
    round(100.0 * count(r.user_id) over (partition by contest_id) / tu.total_users, 2) as percentage
from
    Users as u
    join Register as r
        on u.user_id = r.user_id,
    total_users as tu
order by
    2 desc, 1