/*сохраните в этом файле запросы для первоначальной загрузки данных - создание схемы raw_data и таблицы sales и наполнение их данными из csv файла*/
-- Схема для исходной таблицы
CREATE SCHEMA raw_data;

-- Ненормализованная таблица
CREATE TABLE raw_data.sales (
id integer PRIMARY KEY,
auto varchar,
gasoline_consumption REAL,
price NUMERIC,
date date,
person_name varchar,
phone varchar,
discount integer,
brand_origin varchar
);

COPY raw_data.sales (id, auto, gasoline_consumption, price, date, person_name, phone, discount, brand_origin)
FROM '/Users/cars.csv'
WITH CSV HEADER NULL 'null';
