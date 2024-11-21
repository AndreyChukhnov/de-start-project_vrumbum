/*Расчет средней цены всех автомобилей с разбивкой по месяцам в 2022 году с учётом скидки*/
SELECT 
	EXTRACT (MONTH FROM date) AS MONTH,
	EXTRACT (YEAR FROM date) AS YEAR,
	round(avg(price),2)
FROM 
	car_shop.sales s
WHERE 
	EXTRACT (YEAR FROM date) = 2022
GROUP BY
	EXTRACT (MONTH FROM date),
	EXTRACT (YEAR FROM date)
ORDER BY 
	EXTRACT (MONTH FROM date);
