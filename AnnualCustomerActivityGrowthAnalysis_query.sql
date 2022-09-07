--PROJECT 2
WITH 
task1 as 
(
SELECT
year,
round(AVG(count), 2) as montly_active_customer_average
FROM 
	(SELECT 
	date_part('month', o.order_purchase_timestamp) as month,
	date_part('year', o.order_purchase_timestamp) as year,
	count(distinct c.unique_id) 
	FROM orders_dataset as o
	JOIN customers_dataset as c
	ON o.customer_id = c.customer_id
	GROUP BY 1, 2) as sub
GROUP BY 1
),
task2 as
(
SELECT
date_part('year', sub.min) as year,
count(sub.unique_id) as new_customer
FROM 
	(SELECT 
	c.unique_id,
	min(o.order_purchase_timestamp) 
	FROM orders_dataset as o
	JOIN customers_dataset as c
	ON o.customer_id = c.customer_id
	GROUP BY 1) as sub
GROUP BY 1
),
task3 as
(
SELECT
sub.year,
count(sub.unique_id) as customer_with_more_than_one_transaction
FROM 
	(SELECT
	unique_id,
	date_part('year', o.order_purchase_timestamp) as year,
	count(c.unique_id)
	FROM orders_dataset as o
	JOIN customers_dataset as c
	ON o.customer_id = c.customer_id
	GROUP BY 1, 2
	HAVING count(c.unique_id) > 1) as sub
GROUP BY 1
),
task4 as
(
SELECT
sub.year,
round(avg(sub.count), 3) average_order_per_customer
FROM 
	(SELECT
	unique_id,
	date_part('year', o.order_purchase_timestamp) as year,
	count(c.unique_id)
	FROM orders_dataset as o
	JOIN customers_dataset as c
	ON o.customer_id = c.customer_id
	GROUP BY 1, 2) as sub
GROUP BY 1
)
select
t1.year,
t1.montly_active_customer_average,
t2.new_customer,
t3.customer_with_more_than_one_transaction,
t4.average_order_per_customer
from task1 as t1
inner join task2 as t2
on t1.year = t2.year 
inner join task3 as t3
on t2.year = t3.year
inner join task4 as t4
on t3.year = t4.year

--copy (task1) to 'C:\Users\RG\Downloads\Rakamin Data Science\Mini Project\Analyzing eCommerce\2 - Annual Customer Activity Growth Analysis\task21.csv' delimiter ',' csv header