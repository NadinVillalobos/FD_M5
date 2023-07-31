--*Consultas de QUERY

--*Consultas para insertar,modificar o eliminar datos en distintas tablas.

--*Tabla de customer

-- Insertar

INSERT INTO customer (customer_id, store_id, first_name, last_name, email, address_id, activebool, create_date, last_update, active)
VALUES (1000,1,'Nadin','villalobos','nadin.villalobos@gmail.com',1000,true,CURRENT_DATE,CURRENT_DATE,1);


-- modificar

UPDATE customer
SET
	customer_id = 1001,
	store_id = 2,
	first_name = 'Nidan',
	last_name = 'Villalobos',
	address_id = 1001,
	activebool = true,
    create_date = CURRENT_DATE,
	last_update = CURRENT_DATE, 
	active = 1
WHERE customer_id = 1000;

-- Eliminar

DELETE FROM customer WHERE customer_id = 1001;

--*Tabla de Staff

-- Insertar

INSERT INTO staff (staff_id, first_name,last_name, address_id, email, store_id, active, username, password, last_update)
VALUES  
    (3, 'Nadin', 'Villalobos', 5, 'nadin.villalobos@gmail.com', 1, true, 'nadinox', '654654', CURRENT_DATE);

-- modificar
UPDATE staff
SET	
	staff_id = 4,
	first_name = 'Philip',
	last_name = 'Fry',
	address_id = 6,
	email = 'PhilipJFry@gmail.com',
	store_id = 2,
	active = true, 
	username = 'JFry',
	password = '456456'
WHERE staff_id = 3;

-- Eliminar
DELETE FROM staff WHERE staff_id = 4;

--*Tabla de Actor

-- Insertar
INSERT INTO actor (actor_id, first_name, last_name, last_update)
VALUES
	(201, 'Nadin', 'Villalobos', CURRENT_DATE);

-- modificar
UPDATE actor
SET
	actor_id = 202,
	first_name = 'Homer',
	last_name = 'Simpson',
    last_update = CURRENT_DATE
WHERE actor_id = 201;

-- Eliminar
DELETE FROM actor WHERE actor_id = 202;

--*Listar las rental con los datos de customer dado año y mes.

SELECT rental.rental_id, rental.rental_date, rental.return_date, customer.customer_id, customer.first_name, customer.last_name
FROM rental
JOIN customer ON rental.customer_id = customer.customer_id
WHERE EXTRACT(YEAR FROM rental.rental_date) = 2005
  AND EXTRACT(MONTH FROM rental.rental_date) = 7;

--*Listar Número, payment_date y amount de todas las “payment”.

SELECT payment_id AS "Número", payment_date AS "Fecha", amount AS "Total"
FROM payment;

--*Listar todas las film del año 2006 que contengan un (rental_rate) mayor a 4.0.

SELECT *
FROM film
WHERE release_year = 2006
  AND rental_rate > 4.0;

--*Listar Diccionario con Nombres de tablas, columnas, si pueden ser nulas y tipo de dato.

SELECT table_name as tabla, column_name as columna, is_nullable, data_type
FROM information_schema.columns
WHERE table_schema = 'public'
ORDER BY tabla



