-- Write your PostgreSQL query statement below
select  v.customer_id,
        count(1) as count_no_trans
from    Visits as v
        left join Transactions as t
            on v.visit_id = t.visit_id
where   t.transaction_id is null
group by v.customer_id
order by 2;

-- We have to check for where   t.transaction_id is null
-- As primary key can't be null and thus avoids null original record 
-- being counted extra if we choose non-primary key'