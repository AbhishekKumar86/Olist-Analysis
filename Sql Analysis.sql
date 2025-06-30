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
