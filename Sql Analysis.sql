------------------------------------------------------------------  Data Modelling ---------------------------------------------------------------------------------------------------
alter table order_review
add constraint fk_order_id_rev
foreign key (order_id) references orders(order_id)

