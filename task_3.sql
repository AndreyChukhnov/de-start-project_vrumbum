/*добавьте сюда запрос для решения задания 3*/
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