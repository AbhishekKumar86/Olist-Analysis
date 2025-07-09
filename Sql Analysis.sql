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


---What percentage of orders receive 1-star vs. 5-star reviews?

select review_score, count(*) *100 / sum(count(*)) over() as 'percentage'
from order_review
where review_score in (1,5)
group by review_score 

------------------------------------------------------ Revenue & Payments---------------------------------------------------------------------------------

--What is the breakdown of revenue by payment type (credit card, boleto, etc.)?

select payment_type, round(sum(payment),2)
as 'Total_revenue' from order_payments
group by payment_type
order by Total_revenue desc

--Which states contribute the most to total revenue?

select c.customer_state, round(sum(op.payment),2) as 'total_revenue'
from Customer c
join orders o
on c.customer_id = o.customer_id
join order_payments op
on o.order_id = op.order_id
group by c.customer_state
order by Total_revenue desc

-- What is the average order value per customer?


--------------------------------------------------------------------Seller Performance----------------------------------------------------------------------

-- Which sellers have the highest number of orders?

select oi.seller_id,s.seller_city,s.seller_state,
count (DISTINCT oi.order_id) as total_orders
FROM order_items oi
JOIN sellers s on oi.seller_id = s.seller_id
group by oi.seller_id, s.seller_city, s.seller_state
order by total_orders desc;








