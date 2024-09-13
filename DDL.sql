/*Добавьте в этот файл все запросы, для создания схемы данных автосалона и
 таблиц в ней в нужном порядке*/
CREATE SCHEMA car_shop;

CREATE TABLE car_shop.clients(    
id serial PRIMARY KEY,    /* Первичный ключ с автоинкрементом */
client_name varchar NOT NULL,    /* Будут храниться строковые значения. Обязательно для заполнения */
phone varchar NOT NULL    /* Кроме цифр могут храниться другие символы. Обязательно для заполнения */
);

CREATE TABLE car_shop.brands(
id serial PRIMARY KEY,    /* Первичный ключ с автоинкрементом */
brand_origin varchar    /* Здесь будут храниться строковые значения */
);

-- Забыли имя бренда
ALTER TABLE car_shop.brands ADD COLUMN brand_name varchar NOT null;    /* Будт храниться строковые значения. Обязательно для заполнения */

CREATE TABLE car_shop.colors( 
id serial PRIMARY KEY,    /* Первичный ключ с автоинкрементом */
color_name varchar NOT null    /* Здесь будут храниться строковые значения. Обязательно для заполнения */
);

CREATE TABLE car_shop.models( 
id serial primary KEY,    /* Первичный ключ с автоинкрементом */
brand_id integer NOT NULL REFERENCES car_shop.brands(id),    /* Будет храниться целое число. Обязательно для заполнения */
gasoline_consumption REAL,    /* Будут храниться дробные значения. Допустимо значение null */
model_name varchar NOT null    /* Возможны символы и цифры. Обязательно для заполнения */
);

CREATE TABLE car_shop.models_colors(  
model_id integer NOT NULL REFERENCES car_shop.models(id),    /* Будет храниться целое число. Обязательно для заполнения */
color_id integer NOT NULL REFERENCES car_shop.colors(id)    /* Будет храниться целое число. Обязательно для заполнения */
);

CREATE TABLE car_shop.purchases(   
id serial PRIMARY KEY,    /* Первичный ключ с автоинкрементом */
model_id integer NOT NULL REFERENCES car_shop.models(id),    /* Будет храниться целое число. Обязательно для заполнения */
date_purch date NOT NULL,    /* Будет храниться значения типа дата. Обязательно для заполения */
client_id integer NOT NULL REFERENCES car_shop.clients(id),    /* Ссылается на столбец с id таблицы clients. Будет храниться целое число. Обязательно для заполнения */
price numeric(9, 2) NOT NULL    /* Будут храниться денежные величины. Обязательно для заполнения */
);

-- Забыли указать скидку
ALTER TABLE car_shop.purchases ADD COLUMN discount integer DEFAULT 0;    /* Будут храниться целые значения */
