with tweeets_count as 
(
  select 
    user_id,
    count(*) as tweet_count
  FROM
    tweets 
  where 
    EXTRACT(YEAR from tweet_date) = 2022
  group by 
    user_id
)
select
  tweet_count as tweet_bucket,
  count(*) as users_num 
from 
  tweeets_count 
group by tweet_count 
order by tweet_count;