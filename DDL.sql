/*Добавьте в этот файл все запросы, для создания схемы данных автосалона и
 таблиц в ней в нужном порядке*/

CREATE SCHEMA car_shop; -- создаем схему car_shop

-- создаем родительскую таблицу справочник с цыетами автомобилей 
CREATE TABLE car_shop.colors (
	id_color smallserial PRIMARY KEY,
	color varchar
);

-- создаем таблицу справочник автомобилей cars
CREATE TABLE car_shop.cars(
	id_car smallserial PRIMARY KEY,
	car varchar, 
	brand_origin varchar
)

--создадим таблицу справочник моделей автомобилей odels и свяжем его со справочником cars по id_car
CREATE TABLE car_shop.models(
	id_model smallserial PRIMARY KEY,
	model varchar NOT null,
	gasoline_consumption NUMERIC(3, 1) null,
	id_car SMALLINT REFERENCES car_shop.cars (id_car)
);

--создадим  справочник клиентов customers
CREATE TABLE  car_shop.customers(
	id_customer serial PRIMARY KEY,
	first_name varchar,
	last_name varchar,
	phone varchar
);

-- создадим таблицу событий sales
CREATE TABLE car_shop.sales(
	id serial PRIMARY KEY,
	id_model SMALLINT REFERENCES car_shop.models (id_model),
	id_color SMALLINT REFERENCES car_shop.colors (id_color),
	price numeric(9, 2),
	"date" date,
	id_customer integer REFERENCES car_shop.customers(id_customer),
	discount numeric(4, 2)
);

