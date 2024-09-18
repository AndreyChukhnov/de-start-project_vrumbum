/*Добавьте в этот файл запросы, которые наполняют данными таблицы в схеме автосалона*/

/*наполняем табицу сolors*/
INSERT INTO car_shop.color (color)
SELECT DISTINCT TRIM(SUBSTRING(auto FROM strpos(auto, ',') + 1))
FROM row_data.sales;cit

-- наполним таблицу cars данными
INSERT INTO car_shop.cars (car, brand_origin)
SELECT 
	TRIM(SPLIT_PART(auto, ' ', 1)) AS car,
	brand_origin
FROM row_data.sales s
GROUP BY TRIM(SPLIT_PART(auto, ' ', 1)), brand_origin
ORDER BY TRIM(SPLIT_PART(auto, ' ', 1));

-- наполним талицу models  данными 
INSERT INTO car_shop.models (model, gasoline_consumption, id_car)
SELECT 
    SUBSTRING(auto FROM POSITION(' ' IN auto) + 1 FOR POSITION(',' IN auto) - POSITION(' ' IN auto) - 1) AS model,
    avg(s.gasoline_consumption) AS gasoline_consumption,
    AVG(c.id_car) AS id_car
FROM row_data.sales s
LEFT JOIN car_shop.cars c 
    ON TRIM(SPLIT_PART(s.auto, ' ', 1)) = c.car
GROUP BY SUBSTRING(auto FROM POSITION(' ' IN auto) + 1 FOR POSITION(',' IN auto) - POSITION(' ' IN auto) - 1)
ORDER BY model;

--наполним  таблицу customers данными
INSERT INTO car_shop.customers(first_name, last_name, phone)
SELECT 
	 split_part(person, ' ', 1),
	 split_part(person, ' ', 2),
	 phone
FROM row_data.sales
GROUP BY 1, 2, 3
ORDER BY 2, 1;

-- наполним таблицу sales данными
INSERT INTO car_shop.sales (id_model, id_color, price, date, id_customer, discount)
SELECT 
       m.id_model,
       col.id_color,
       s.price,
       s."date" ,
       c.id_customer,
       s.discount 
FROM row_data.sales s
LEFT JOIN car_shop.models m 
	ON SUBSTRING(auto FROM POSITION(' ' IN auto) + 1 FOR POSITION(',' IN auto) - POSITION(' ' IN auto) - 1) = m.model
LEFT JOIN car_shop.customers c 
	ON s.phone = c.phone
LEFT JOIN car_shop.colors col 
	ON TRIM(SUBSTRING(auto FROM strpos(auto, ',') + 1)) = col.color;