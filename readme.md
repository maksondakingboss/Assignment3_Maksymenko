# Assignment 3 MAKSYMENKO MAKSYM

## Структура

schema.sql створення таблиць
functions.sql функція підрахунку суми замовлення 
procedures.sql процедури створення замовлення і додавання товару
triggers.sql тригери для оновлення суми і логування
tests.sql тестовий скрипт
answers.md відповіді на додаткові питання

## Що реалізовано

Функція calculate_order_total рахує суму замовлення з order_items
Процедура create_order створює замовлення з перевіркою клієнта
Процедура add_product_to_order додає товар з перевіркою стоку
Тригер update_order_total автоматично оновлює суму замовлення
Тригер log_order записує нові замовлення в order_log