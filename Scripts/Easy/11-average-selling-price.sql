select
    p.product_id,
    COALESCE(
        ROUND(
            1.0 * SUM(price * units) / SUM(units), 
            2), 
        0) as average_price
from   
    Prices as p
    left join UnitsSold as sold
        on p.product_id = sold.product_id
           and p.start_date <= sold.purchase_date
           and sold.purchase_date <= p.end_date
group by
    p.product_id;


-- Reason to use left join:
-- Since ask is: Write a solution to find the average selling price for each product. 
-- Instead of each product sold