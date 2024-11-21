/*Название бренда и средняя цена его автомобилей в разбивке по всем годам с учётом скидки*/
SELECT 
    c.car AS brand_name, 
    EXTRACT(YEAR FROM s.date) AS year, 
    ROUND(AVG(s.price), 2) AS price_avg
FROM 
    car_shop.sales s 
INNER JOIN 
    car_shop.models m ON s.id_model = m.id_model
INNER JOIN 
    car_shop.cars c ON m.id_car = c.id_car
GROUP BY 
    c.car, 
    EXTRACT(YEAR FROM s.date)
ORDER BY
	c.car, 
    EXTRACT(YEAR FROM s.date);
