/*добавьте сюда запрос для решения задания 5*/
SELECT b.brand_origin,
       max((p.price / (100 - p.discount)) * 100) AS max,
       min((p.price / (100 - p.discount)) * 100) AS min
FROM car_shop.purchases p 
INNER JOIN car_shop.models m 
     ON p.model_id = m.id
INNER JOIN car_shop.brands b 
     ON m.brand_id = b.id
GROUP BY b.brand_origin;
