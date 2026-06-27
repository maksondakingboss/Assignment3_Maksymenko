create OR REPLACE procedure create_order(p_customer_id int)
    LANGUAGE plpgsql
AS $$
    begin
    if not exists (select 1 from customers where customer_id = p_customer_id) then
        raise exception 'Customer % does not exist', p_customer_id;
end if;

insert into orders (customer_id, total_amount, order_date)
values (p_customer_id, 0, current_timestamp);
end;
$$;
call create_order(1); -- все правильно
call create_order(999); -- видає помилку
select * from orders;
