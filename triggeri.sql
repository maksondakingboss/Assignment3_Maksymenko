
create or replace function update_order_total_trig()
    returns trigger as
$$
begin
    update orders
    set total_amount = calculate_order_total(
            coalesce(new.order_id, old.order_id)
                       )
    where order_id = coalesce(new.order_id, old.order_id);

    return new;
end;
$$ language plpgsql;


create or replace trigger update_order_total
    after insert or update or delete
    on order_items
    for each row
execute function update_order_total_trig();


-- перевірка
select order_id, total_amount from orders where order_id = 1;
call add_product_to_order(1, 3, 1);


create or replace function trg_log_order()
    returns trigger as $$
begin
    insert into order_log (order_id, customer_id, action, log_date)
    values (new.order_id, new.customer_id, 'order_created', current_timestamp);

    return new;
end;
$$ language plpgsql;

create or replace trigger log_order
    after insert on orders
    for each row execute function trg_log_order();

call create_order(2);

select * from order_log;