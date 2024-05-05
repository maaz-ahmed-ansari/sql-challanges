select
    s.shipment_id,
    s.ship_date,
    c.customer_id,
    s.quantity,
    case
        when c.membership_start_date < s.ship_date
             and s.ship_date < c.membership_end_date
        then 'Y'
        else 'N'
    end as is_member
from   
    customers as c 
    join shipments as s 
        on c.customer_id = s.customer_id
