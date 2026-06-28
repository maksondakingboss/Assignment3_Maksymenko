create or replace function calculate_order_total(p_order_id int)-- функція для підрахунку загальної суми замовлення

    RETURNS numeric as
$$
select coalesce(sum(quantity * price), 0) -- (кількість * ціна) якщо замовлення порожнє — повертає 0
from order_items
where order_id = p_order_id;
$$ language sql;
select calculate_order_total(1); -- output 1250 значить все чотко