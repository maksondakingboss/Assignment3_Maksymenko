insert into customers (full_name, email, balance)
values ('Mister Biznes', 'email@email.com', 1234.56);

insert into products (product_name, price, stock_quantity)
values ('Banan', 500.00, 100);

call create_order(1);

call add_product_to_order(1, 1, 2);

select order_id, total_amount from orders;

select product_name, stock_quantity from products;

select * from order_log;

