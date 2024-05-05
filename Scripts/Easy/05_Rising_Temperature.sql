with prev_day_weather as
(
    select  *,
            lag(temperature) over (order by recordDate) as prev_day_temp,
            lag(recordDate) over (order by recordDate) as prev_day_record_date
    from    weather
)
select  id
from    prev_day_weather 
where   temperature > prev_day_temp
        and recordDate = prev_day_record_date + interval '1 day';