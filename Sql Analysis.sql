------------------------------------------------------------------  Data Modelling ---------------------------------------------------------------------------------------------------
alter table order_review
add constraint fk_order_id_rev
foreign key (order_id) references orders(order_id)

alter table order_items
add constraint fk_order_id_item
foreign key  (order_id) references orders(order_id)

alter table Customer
add constraint pk_csutomer_id_customer primary key (customer_id)

alter table orders
add constraint fk_customer_id_orders
foreign key  (customer_id) references Customer(customer_id)

alter table products
add constraint pk_product_id_prducts
primary key (product_id)

------------------------------------------------------------------------Customer Experience & Reviews-----------------------------------------------------------------

  ----What is the average review score across all orders?
  
select avg(review_score) as 'avg_rev_score' from order_review

-----Which sellers have the lowest average review scores?

select s.seller_id, avg(o_r.review_score) as 'avg_rev_score'
from order_review o_r
join orders o 
on o_r.order_id = o.order_id
join order_items ot
on o.order_id = ot.order_id
join sellers s
on ot.seller_id = s.seller_id
group by s.seller_id
order by avg_rev_score asc

--- Which product categories are most frequently reviewed poorly?

select pc.product_category, avg(o_w.review_score) 
as 'avg_review_score', count(*) as 'total_poor_rev'
from products p
join order_items o
on p.product_id = o.product_id
join orders os
on o.order_id = os.order_id
join order_review o_w
on os.order_id = o_w.order_id
join product_category pc
on p.product_category = pc.product_category
WHERE o_w.review_score IN (1, 2)
group by pc.product_category
order by total_poor_rev desc



