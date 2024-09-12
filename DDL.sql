/*Добавьте в этот файл все запросы, для создания схемы данных автосалона и
 таблиц в ней в нужном порядке*/
CREATE SCHEMA car_shop;

CREATE TABLE car_shop.clients(    /* Таблица с клиентами */
id serial PRIMARY KEY,    /* Первичный ключ с автоинкрементом */
client_name varchar NOT NULL,    /* Имя клиента. Будут храниться строковые значения. Обязательно для заполнения */
phone varchar NOT NULL    /* Номер телефона клиента. Кроме цифр могут храниться другие символы, поэтому тип поля varchar. Обязательно для заполнения */
);

CREATE TABLE car_shop.brands(    /* Таблица с брендами автомобилей */
id serial PRIMARY KEY,    /* Первичный ключ с автоинкрементом */
brand_origin varchar    /* Страна происхождения бренда. Здесь будут храниться строковые значения */
);

-- Забыли имя бренда
ALTER TABLE car_shop.brands ADD COLUMN brand_name varchar NOT null;    /* Будт храниться строковые значения. Обязательно для заполнения */

CREATE TABLE car_shop.colors(    /* Таблица с цветами для автомобилей */
id serial PRIMARY KEY,    /* Первичный ключ с автоинкрементом */
color_name varchar NOT null    /* Название цвета. Здесь будут храниться строковые значения. Обязательно для заполнения */
);

CREATE TABLE car_shop.models(    /* Таблица с моделями автомобилей. Создается после таблицы с брендами */
id serial primary KEY,    /* Первичный ключ с автоинкрементом */
brand_id integer NOT NULL REFERENCES car_shop.brands(id),    /* id бренда. Ссылается на столбец с id таблицы с брендами. Будет храниться целое число. Обязательно для заполнения */
gasoline_consumption REAL,    /* Потребление бензина. Будут храниться дробные значения. Допустимо значение null */
model_name varchar NOT null    /* Название модели. Возможны символы и цифры. Обязательно для заполнения */
);

CREATE TABLE car_shop.models_colors(    /* Таблица для реализации связи "многие ко многим" между таблицами models и colors. Создается после таблиц с моделями и цветами */
model_id integer NOT NULL REFERENCES car_shop.models(id),    /* id модели автомобиля. Ссылка на столбец с id таблицы models. Будет храниться целое число. Обязательно для заполнения */
color_id integer NOT NULL REFERENCES car_shop.colors(id)    /* Ссылка на id таблицы colors */
);

CREATE TABLE car_shop.purchases(    /* Таблица с покупками. Создается после таблиц с моделями и клиентами */
id serial PRIMARY KEY,    /* Первичный ключ с автоинкрементом */
model_id integer NOT NULL REFERENCES car_shop.models(id),    /* id модели автомобиля. Ссылается на столбец с id таблицы models. Будет храниться целое число. Обязательно для заполнения */
date_purch date NOT NULL,    /* Дата покупки. Будет храниться значения типа дата. Обязательно для заполения */
client_id integer NOT NULL REFERENCES car_shop.clients(id),    /* id покупателя. Ссылается на столбец с id таблицы clients. Будет храниться целое число. Обязательно для заполнения */
price numeric(9, 2) NOT NULL    /* Цена покупки. Будут храниться денежные величины. Обязательно для заполнения */
);

-- Забыли указать скидку
ALTER TABLE car_shop.purchases ADD COLUMN discount integer DEFAULT 0;    /* Скидка. Будут храниться целые значения */
