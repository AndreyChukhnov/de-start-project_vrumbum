/*добавьте сюда запрос для решения задания 5*/
SELECT
	c.brand_origin,
	max(round((s.price / (100 - s.discount)) * 100, 2)) AS price_max,
	min(round((s.price / (100 - s.discount)) * 100, 2)) AS price_min
FROM car_shop.sales s 
INNER JOIN car_shop.models m 
	ON s.id_model = m.id_model 
INNER JOIN car_shop.cars c 
	ON m.id_car = c.id_car 
GROUP BY 
	c.brand_origin;