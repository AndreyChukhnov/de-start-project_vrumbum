/*добавьте сюда запрос для решения задания 6*/
SELECT count(*) AS persons_from_usa_count
FROM car_shop.customers c 
WHERE phone LIKE '+1%'