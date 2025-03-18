
with actual_sales as (
select
Product_Name,
Brand,
p.Category,
p.Cost_Price,
p.Sale_Price,
s.Units_Sold,
p.Description,
p.Image_url,
s.Date,
s.Country,
s.Customer_Type,
s.Discount_Band,
Cost_Price * Units_Sold as total_cost,
Sale_Price * Units_Sold as revenue,
format(date,'MMMM') as month
from Product_data p
join product_sales s
on p.Product_ID=s.Product
)

select *,
(1-discount*1.0/100)*revenue as discounted_revenue
from actual_sales a
join discount_data d
on a.Discount_Band=d.discount_band
and a.month=d.month