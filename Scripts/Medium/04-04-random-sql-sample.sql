select  id,
        name
from    big_table
where   random() < 0.15
limit   1;
-- https://wiki.postgresql.org/wiki/TABLESAMPLE_Implementation#:~:text=TABLESAMPLE%20is%20a%20query%20dealing,they%20are%20ANSI%20SQL%20required