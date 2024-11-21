/*Процент моделей машин, у которых нет параметра gasoline_consumption*/
SELECT 
	(COUNT(
		CASE WHEN gasoline_consumption IS NULL THEN 1 END
			) * 1.0 / COUNT(*)
		) * 100 AS nulls_percentage_gasoline_consumption
FROM car_shop.sales s 
INNER JOIN car_shop.models m USING (id_model);
