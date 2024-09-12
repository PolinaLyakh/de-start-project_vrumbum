/*добавьте сюда запрос для решения задания 2*/
SELECT b.brand_name,
       to_char(extract(YEAR FROM p.date_purch::date), '9999') AS YEAR,
       round(avg(p.price), 2) AS price_avg
FROM car_shop.purchases p 
INNER JOIN car_shop.models m 
ON p.model_id = m.id
INNER JOIN car_shop.brands b 
ON m.brand_id = b.id
GROUP BY b.brand_name, extract(YEAR FROM p.date_purch::date)
ORDER BY b.brand_name, extract(YEAR FROM p.date_purch::date);
