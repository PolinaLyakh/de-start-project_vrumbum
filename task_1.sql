/*добавьте сюда запрос для решения задания 1*/
SELECT (sum(CASE WHEN m.gasoline_consumption IS NULL THEN 1 ELSE 0 END) * 100)
            / count(*) AS nulls_percentage_gasoline_consumption
FROM car_shop.models m;
