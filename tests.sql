
-- ТЕСТИ
-- я очистив таблиці передц им щоб перевірити все на свіжих даних, тому вставляємо
insert into customers (full_name, email, balance)
values ('Mister Biznes', 'email@email.com', 1234.56);

insert into products (product_name, price, stock_quantity)
values ('Banan', 500.00, 100);

call create_order(1);

call add_product_to_order(1, 1, 2);

select order_id, total_amount from orders; -- ордер 1,тотал амоунт 1000

select product_name, stock_quantity from products; -- банан 98

select * from order_log; -- є ордер,все круто

