# 1.3. Качество данных
Изучив DDL таблиц в источнике, можно селать следующие выводы:
- Первичные ключи и условия уникальности обеспечивают отсутствие дублей по ключевым полям таблицы;
- Все поля не могут принимать значение NULL, след. нет пропусков вданных;
- Внешние ключи соответствуют ключевым значениям в др.таблицах;
- На числовые поля наложены ограничения по значениям, что исключает грубые ошибки.

Просмотрела глубину числовых данных, каких-то аномальных значений выявлено не было.

## Инструменты обеспечивающие качество данных в источнике:

| Таблицы             | Объект                      | Инструмент      | Для чего используется |
| ------------------- | --------------------------- | --------------- | --------------------- |
| production.products | id int4 NOT NULL PRIMARY KEY | Первичный ключ  | Обеспечивает уникальность записей о пользователях |
| production.products |CONSTRAINT products_price_check CHECK ((price >= (0)::numeric))| Проверка значений  | Обеспечивает отсутствие в таблице значений не соответствующих условию |
| production.users    |id int4 NOT NULL PRIMARY KEY  | Первичный ключ  | Обеспечивает уникальность записей о пользователях |
| production.orderitems|CONSTRAINT orderitems_check CHECK (((discount >= (0)::numeric) AND (discount <= price)))| Проверка значений|Обеспечивает отсутствие в таблице значений не соответствующих условию|
| production.orderitems|CONSTRAINT orderitems_order_id_product_id_key UNIQUE (order_id, product_id)| Уникальность значений|Обеспечивает уникальность значений в полях order_id и product_id|
| production.orderitems|CONSTRAINT orderitems_pkey PRIMARY KEY (id)| Первичный ключ|Обеспечивает уникальность записей|
| production.orderitems|CONSTRAINT orderitems_price_check CHECK ((price >= (0)::numeric))| Проверка значений|Обеспечивает отсутствие в таблице значений не соответствующих условию|
| production.orderitems|CONSTRAINT orderitems_quantity_check CHECK ((quantity > 0))| Проверка значений|Обеспечивает отсутствие в таблице значений не соответствующих условию|
| production.orderitems|CONSTRAINT orderitems_order_id_fkey FOREIGN KEY (order_id) REFERENCES production.orders(order_id)| Внешний ключй|Обеспечивает соответствие в таблице значений order_id значениям production.orders(order_id)|
| production.orderitems|CONSTRAINT orderitems_product_id_fkey FOREIGN KEY (product_id) REFERENCES production.products(id)| Внешний ключй|Обеспечивает соответствие в таблице значений product_id значениям production.products(id)|
| production.orders|CONSTRAINT orders_check CHECK ((cost = (payment + bonus_payment)))| Проверка значений|Обеспечивает отсутствие в таблице значений не соответствующих условию|
| production.orders|CONSTRAINT orders_pkey PRIMARY KEY (order_id)| Первичный ключй| Обеспечивает уникальность записей|
| production.orderstatuses|CONSTRAINT orderstatuses_pkey PRIMARY KEY (id)|Первичный ключй| Обеспечивает уникальность записей|

