/*добавьте сюда запрос для решения задания 4*/
SELECT c.client_name AS person, 
       string_agg((b.brand_name || ' ' || m.model_name), ', ') AS cars 
FROM car_shop.clients c 
INNER JOIN car_shop.purchases p 
      ON p.client_id = c.id 
INNER JOIN car_shop.models m 
      ON p.model_id = m.id 
INNER JOIN car_shop.brands b 
      ON m.brand_id = b.id 
GROUP BY c.client_name
ORDER BY c.client_name;
