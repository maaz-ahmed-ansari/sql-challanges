-- Write your PostgreSQL query statement below
with confirmation_requested as
(
    select  user_id,
            count(*) as requested
    from    Confirmations
    group by 1
),
confirmed as
(
    select  user_id,
            count(*) as confirmed
    from    Confirmations
    where   action = 'confirmed'
    group by 1
),
confirmed_rate as
(
    select  cr.user_id,
            round(confirmed*1.00 / requested, 2) as confirmation_rate
    from    confirmation_requested as cr
            join confirmed as c
                on cr.user_id = c.user_id
)
select  s.user_id,
        coalesce(cr.confirmation_rate, 0) as confirmation_rate
from    Signups as s
        left join confirmed_rate as cr
            on s.user_id = cr.user_id

