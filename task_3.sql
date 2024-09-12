/*добавьте сюда запрос для решения задания 3*/
SELECT extract(MONTH FROM p.date_purch::date) AS MONTH,
       to_char(extract(YEAR FROM p.date_purch::date), '9999') AS YEAR,
       round(avg(p.price), 2) AS price_avg
FROM car_shop.purchases p 
WHERE extract(YEAR FROM p.date_purch::date) = 2022
GROUP BY extract(YEAR FROM p.date_purch::date), extract(MONTH FROM p.date_purch::date)
ORDER BY MONTH;
