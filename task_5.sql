/*добавьте сюда запрос для решения задания 5*/
SELECT
	coo.brand_origin,
	max(round((s.price / (100 - s.discount)) * 100, 2)) AS price_max,
	min(round((s.price / (100 - s.discount)) * 100, 2)) AS price_min
FROM car_shop.sales s 
INNER JOIN car_shop.countries_of_origin coo 
	ON s.id_brand = coo.id_brand 
GROUP BY 
	coo.brand_origin;