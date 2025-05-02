SELECT * FROM public.sales_table
ORDER BY transactions_id ASC LIMIT 10

select count(*)
from Sales_table;

select *from Sales_table
where
transactions_id is null
or
sale_date is null
or
sale_time is null
or
customer_id is null
or
gender is null
or
age is null
or 
category is null
or
quantiy is null
or
price_per_unit is null
or
cogs is null
or
total_sale is null;

delete from Sales_table
where
transactions_id is null
or
sale_date is null
or
sale_time is null
or
customer_id is null
or
gender is null
or
age is null
or 
category is null
or
quantiy is null
or
price_per_unit is null
or
cogs is null
or
total_sale is null;

select count(distinct category) as category_sales from Sales_table;

select distinct category from Sales_table;

select *from Sales_table
where sale_date = '2022-11-05';

select *from Sales_table where category = 'Clothing' and to_char(sale_date,'YYYY-MM')='2022-11' and quantiy >=4;

select category, sum(total_sale) as net_sale,
count(*) as total_order
from Sales_table
group by 1;

select round(avg(age),2) as avg_age
from Sales_table
where category = 'Beauty';

select *from Sales_table
where total_sale > 1000;

select category, gender,count(*) as total_transcation 
from Sales_table group by category, gender order by 1;

select *from 
(
select 
extract(year from sale_date) as year,
extract(month from sale_date) as month,
avg(total_sale) as avg_sale,
rank() over(partition by extract(year from sale_date) order by avg(total_sale) desc ) as rank
from Sales_table
group by 1,2 
) as t1
where rank =1;

select 
customer_id,
sum(total_sale) as total_sales
from Sales_table
group by 1
order by 2 desc
limit 5;

select category , count(distinct customer_id ) as unique_cust
from Sales_table
group by category;

select 
avg(total_sale) as avg_sale
from Sales_table;

select
gender,
count(*) as transcation_count,
(sum(total_sale),2) as total_rev,
(avg(total_sale),2) as avg_trans
FROM Sales_table
where gender is not null
group by gender;