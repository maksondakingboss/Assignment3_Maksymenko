create OR REPLACE procedure create_order(p_customer_id int)
    LANGUAGE plpgsql
AS
$$
begin
    -- перевірка чи існує клієнт
    if not exists (select 1 from customers where customer_id = p_customer_id) then
        raise exception 'Customer % does not exist', p_customer_id;-- якщо клієнта не існує кидає помилку

    end if;
    insert into orders (customer_id, total_amount, order_date)
    values (p_customer_id, 0, current_timestamp);
end;
$$;
call create_order(1); -- все правильно
call create_order(999); -- видає помилку
select *
from orders; -- перевірка працездатності

-- додає товар до замовлення
create or replace procedure add_product_to_order(
    p_order_id int,
    p_product_id int,
    p_quantity int
)
    language plpgsql as
$$
declare
    v_price numeric(10, 2); -- створбємо вартість товару
    v_stock int; -- ств. к-сть товвару
begin
    if p_quantity <= 0 then -- перевірка наявності на те чи ж вона > 0
        raise exception 'Error quantite mst be postive';
    end if;

    select price, stock_quantity
    into v_price, v_stock
    from products
    where product_id = p_product_id;
-- перевірки на те чи можемо взяти товар

    if not found then
        raise exception 'Product % does not exist', p_product_id;
    end if;

    if v_stock < p_quantity then
        raise exception 'Not enough stock, available: %', v_stock;
    end if;

    insert into order_items (order_id, product_id, quantity, price)
    values (p_order_id, p_product_id, p_quantity, v_price);

    update products
    set stock_quantity = stock_quantity - p_quantity
    where product_id = p_product_id;
end;
$$;
-- просто перевірка
call add_product_to_order(1, 2, 3);

-- Prevent adding zero or negative quantity.
call add_product_to_order(1, 2, 0);

--- Prevent adding a product if there is not enough stock.
call add_product_to_order(1, 2, 9999);