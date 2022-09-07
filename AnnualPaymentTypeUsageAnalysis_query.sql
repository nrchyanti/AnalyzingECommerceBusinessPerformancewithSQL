with tab as
(select
 payment_type,
date_part('year', o.order_purchase_timestamp) as year,
count(o.order_id) as banyak_penggunaan
from orders_dataset as o
join order_payments_dataset as op
on o.order_id = op.order_id
group by 1,2
order by 3 desc),
task1 as
(
select
payment_type,
count(o.order_id) as total_penggunaan
from orders_dataset as o
join order_payments_dataset as op
on o.order_id = op.order_id
group by 1 
order by 2 desc
),
task2 as
(SELECT 
payment_type,
sum(banyak_penggunaan) filter (where year=2016) as "penggunaan_tahun_2016",
sum(banyak_penggunaan) filter (where year=2017) as "penggunaan_tahun_2017",
sum(banyak_penggunaan) filter (where year=2018) as "penggunaan_tahun_2018"
from tab
group by 1)
select
t2.payment_type,
penggunaan_tahun_2016,
penggunaan_tahun_2017,
penggunaan_tahun_2018,
total_penggunaan
from task2 as t2
join task1 as t1
on t2.payment_type = t1.payment_type