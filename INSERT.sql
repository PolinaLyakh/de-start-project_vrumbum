/*Добавьте в этот файл запросы, которые наполняют данными таблицы в схеме автосалона*/
-- clients
INSERT INTO car_shop.clients (client_name, phone)
SELECT DISTINCT person_name, phone
FROM raw_data.sales;

-- brands
INSERT INTO car_shop.brands (brand_name, brand_origin)
SELECT DISTINCT split_part(auto, ' ', 1), brand_origin
FROM raw_data.sales;

-- colors
INSERT INTO car_shop.colors (color_name)
SELECT DISTINCT split_part(auto, ' ', -1)
FROM raw_data.sales;

-- models
INSERT INTO car_shop.models (model_name, gasoline_consumption, brand_id)
SELECT DISTINCT concat(split_part(split_part(s.auto, ',', 1), ' ', 2), ' ', split_part(split_part(s.auto, ',', 1), ' ', 3)),
       s.gasoline_consumption,
       b.id
FROM raw_data.sales s
INNER JOIN car_shop.brands b
      on b.brand_name = split_part(s.auto, ' ', 1);

-- models_colors
INSERT INTO car_shop.models_colors (model_id, color_id)
SELECT m.id, c.id
FROM raw_data.sales s 
INNER JOIN car_shop.models m 
      ON concat(split_part(split_part(s.auto, ',', 1), ' ', 2), ' ', split_part(split_part(s.auto, ',', 1), ' ', 3)) = m.model_name 
INNER JOIN car_shop.colors c 
      ON split_part(s.auto, ' ', -1) = c.color_name;

-- purchases
INSERT INTO car_shop.purchases (model_id, date_purch, client_id, price, discount)
SELECT m.id, s.date, c.id, s.price, s.discount 
FROM raw_data.sales s 
INNER JOIN car_shop.models m 
      ON concat(split_part(split_part(s.auto, ',', 1), ' ', 2), ' ', split_part(split_part(s.auto, ',', 1), ' ', 3)) = m.model_name
INNER JOIN car_shop.clients c 
      ON c.client_name = s.person_name AND c.phone = s.phone;
