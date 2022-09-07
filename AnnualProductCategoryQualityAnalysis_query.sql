WITH
task1 as
(
SELECT
year,
sum(revenue) as total_revenue
FROM(SELECT 
	date_part('year', o.order_purchase_timestamp) as year,
	(price+freight_value) as revenue
FROM order_items_dataset AS oi
JOIN orders_dataset AS o
ON oi.order_id = o.order_id
WHERE order_status = 'delivered'
	) as sub
GROUP BY year
),
task2 as
(
SELECT 
	date_part('year', order_purchase_timestamp) as year,
	count(order_id) as cancelled_order
FROM orders_dataset
WHERE order_status = 'canceled'
	 GROUP BY 1
),
productxitems AS
	(
		SELECT 
		order_id,
		product_category_name,
		(price+freight_value) as revenue
		FROM order_items_dataset AS oi
		JOIN product_dataset AS p
		ON oi.product_id = p.product_id
	),
orderxproductxitems AS
	(
		SELECT
		product_category_name,
		sum(revenue) as total,
		date_part('year', o.order_purchase_timestamp) as year
		FROM productxitems AS pi
		JOIN orders_dataset AS o
		ON pi.order_id = o.order_id
		GROUP BY 1,3
	),
task3 as
(
	SELECT
	year,
	product_category_name as category_with_highest_revenue
FROM
(
	SELECT
	year,
	product_category_name,
	total,
	max(total) over(partition by year) as max_rev
	FROM orderxproductxitems) as sub
WHERE total=max_rev
),
orderxitems as
(select 
 oi.product_id, 
 date_part('year', o.order_purchase_timestamp) as year, 
 o.order_id, o.order_status 
 from orders_dataset as o 
 join order_items_dataset as oi 
 on o.order_id = oi.order_id 
 WHERE o.order_status = 'canceled'
),
proxorderxitems as
(select
 product_category_name,
 year,
 count(order_id) as total
 from orderxitems as oxi
 join product_dataset as p
 on oxi.product_id = p.product_id
 group by 1,2
),
task4 as
(SELECT 
	year,
	product_category_name as most_canceled_category
FROM (SELECT 
	year,
	product_category_name,
	  total,
	max(total) over(partition by year) as pro
FROM proxorderxitems) as sub
WHERE total = pro
)
select
t1.year,
t1.total_revenue,
t2.cancelled_order,
t3.category_with_highest_revenue,
t4.most_canceled_category
from task1 as t1
inner join task2 as t2
on t1.year = t2.year 
inner join task3 as t3
on t2.year = t3.year
inner join task4 as t4
on t3.year = t4.year