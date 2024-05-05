-- Write your PostgreSQL query statement below
select  distinct author_id as id
from    Views
where   author_id = viewer_id
order   by 1;

-- More Generalized
-- select  author_id as id
-- from    Views
-- where   author_id = viewer_id
-- group   by author_id
-- Having  count(author_id) >= 1
-- order   by 1;