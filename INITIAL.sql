/*сохраните в этом файле запросы для первоначальной загрузки данных - создание схемы raw_data и таблицы sales и наполнение их данными из csv файла*/
CREATE SCHEMA row_data;

CREATE TABLE row_data.sales (
	id SMALLINT PRIMARY KEY,
	auto varchar,
	gasoline_consumption NUMERIC (3, 1) null,
	price NUMERIC (9, 2),
	"date" date,
	person varchar,
	phone varchar,
	discount NUMERIC (4, 2),
	brand_origin varchar
);


\copy row_data.sales (id, auto, gasoline_consumption, price, date, person, phone, discount, brand_origin)
FROM 'C:\Temp\cars.csv' 
WITH (FORMAT csv, HEADER, DELIMITER ',', NULL 'null');