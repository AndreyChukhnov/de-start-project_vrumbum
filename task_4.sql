/*добавьте сюда запрос для решения задания 4*/
SELECT
	concat(c2.first_name, ' ', c2.last_name) AS person,
	string_agg(concat(c.car, ' ', m.model), ', ') AS car
FROM car_shop.sales s 
INNER JOIN car_shop.models m 
	ON  s.id_model = m.id_model 
INNER JOIN car_shop.cars c 
	ON m.id_car = c.id_car
INNER JOIN car_shop.customers c2 
	ON c2.id_customer = s.id_customer 
GROUP BY 
	concat(c2.first_name, ' ', c2.last_name)
ORDER BY 
	concat(c2.first_name, ' ', c2.last_name);