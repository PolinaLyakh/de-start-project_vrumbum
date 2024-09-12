/*добавьте сюда запрос для решения задания 6*/
SELECT count(c.id) AS persons_from_USA_count
FROM car_shop.clients c 
WHERE c.phone LIKE '+1%';
