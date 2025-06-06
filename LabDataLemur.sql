--Solucion en el DataLemur
--------------***BASIC SQL*****
--ejercicio 1: Dada la tabla de reseñas, escribe una consulta para 
--recuperar todas las reseñas de 3 estrellas usando 
--la cláusula WHERE de SQL. Solo muestra las columnas user_id y stars.
SELECT user_id,stars 
FROM reviews 
WHERE stars = 3;

--ejercicio 2: Se te da una tabla de productos, que contiene datos sobre 
--diferentes productos en la nube de Microsoft Azure. Salidas todos 
--los datos, en todas las columnas.
SELECT * 
FROM products;
--ejercicio 3: Dada la tabla de reseñas, escribe una consulta 
--para recuperar todas las reseñas de 3 estrellas usando la cláusula WHERE de SQL. 
--Solo muestra las columnas user_id y stars.
SELECT user_id, stars
FROM reviews
WHERE stars = 3;
--ejercicio 4: la reseña debe tener 4 estrellas o más la ID de la reseña es menor que 6000
--la ID de la reseña es mayor que 2000
--la reseña no puede provenir del usuario 142
--Consejo profesional: Intenta codificar y ejecutar cada comando, uno a la vez. 
--Es muy fácil intentar codificar todo de una vez y cometer un error.
SELECT * FROM reviews
WHERE stars >= 4 
AND review_id < 6000
AND review_id > 2000
AND user_id != 142;

--ejercicio 5: Imagina que eres un analista de datos que trabaja en CVS Pharmacy y 
--tienes acceso a los datos de ventas de la farmacia.
SELECT manufacturer, drug, units_sold
FROM pharmacy_sales
WHERE (manufacturer = 'Biogen' OR manufacturer = 'AbbVie' OR manufacturer = 'Eli Lilly')
AND units_sold BETWEEN 100000 AND 105000;
--ejercicio 6: Imagina que eres un Analista de Datos trabajando en CVS Pharmacy, 
--y tienes acceso a datos de ventas de farmacia. Usa el comando SQL IN para 
--encontrar datos sobre medicamentos:que fueron fabricados por Roche, 
--Bayer o AstraZenecay que no vendieron entre 55,000 y 550,000 unidades.
SELECT manufacturer, drug, units_sold FROM pharmacy_sales
WHERE manufacturer IN ('Roche', 'Bayer', 'AstraZeneca')
AND units_sold NOT BETWEEN 55000 AND 550000;
--ejercicio 7: Tiene una tabla de 1000 registros de clientes 
--de una pequeña empresa con sede en Australia.Encontar todos 
--los clientes cuyos nombres empiecen en "ck"
SELECT *
FROM customers
WHERE customer_name LIKE 'F%ck';

--ejercicio 7.1: Tiene una tabla de 1000 registros de clientes de una pequeña empresa con sede en Australia.
--Encuentre todos los clientes cuyo nombre tenga como segunda y tercera letra "e".
--Ejemplo: "Reece Smith"
SELECT *
FROM customers
WHERE customer_name LIKE '_ee%';

--ejercicio 8: Tiene una tabla de 1000 registros de clientes de una pequeña empresa con sede en Australia.
--Encuentre todos los clientes que tengan entre 18 y 22 años (inclusive), vivan en Victoria, 
--Tasmania o Queensland, su género no sea "n/a" y su nombre comience con "A" o "B".
SELECT * FROM customers
WHERE age BETWEEN 18 AND 22
AND state IN ('Victoria', 'Tasmania', 'Queensland')
AND gender != 'n/a'
AND (customer_name LIKE 'A%' OR customer_name LIKE 'B%');

-----********Intermediate SQL************

--ejercicio 9: 
--Devuelve el número de filas en la tabla pharmacy_sales.
SELECT COUNT(*) 
FROM pharmacy_sales;

--ejercicio 10: Imagina que eres un analista de datos que trabaja en una farmacia CVS y tienes acceso a los datos de ventas de la farmacia.
--Genera el número total de medicamentos fabricados por Pfizer y las ventas totales de todos los medicamentos de Pfizer.
SELECT COUNT(*), SUM(total_sales)
FROM pharmacy_sales
WHERE manufacturer = 'Pfizer'

--ejercicio 11: Escriba una consulta SQL usando AVG para encontrar el precio de apertura
--promedio de las acciones de Google (cuyo símbolo bursátil es 'GOOG').
SELECT AVG(open)
FROM stock_prices
WHERE ticker='GOOG';

--ejercicio 12: 
--Usa el comando MIN de SQL en este ejercicio práctico 
--para encontrar el precio más bajo al que se abrió la acción de Microsoft (MSFT).
SELECT MIN(open)
FROM stock_prices
WHERE ticker='MSFT';

--ejercicio 13: 
--Usa el comando MAX de SQL en este ejercicio práctico 
--para encontrar el precio más alto al que se abrió la acción de Netflix (NFLX) en la historia.
SELECT MAX(open)
FROM stock_prices
WHERE ticker='NFLX';

--ejercicio 14: Para cada acción de FAANG en el conjunto de datos stock_prices, escriba una 
--consulta SQL para encontrar el precio más bajo al que se abrió cada acción. 
--Asegúrese de ordenar también los resultados por precio, en orden descendente.
SELECT ticker, MIN(open)
FROM stock_prices
GROUP BY ticker
ORDER BY min DESC;

--ejercicio 15: Este ejercicio de GROUP BY de SQL utiliza datos reales de una pregunta de entrevista de SQL de 
--LinkedIn que es un poco difícil de abordar en este momento, por lo que resolveremos una variante más fácil de la pregunta de la entrevista.
SELECT skill, COUNT(candidate_id) FROM candidates
GROUP BY skill
ORDER BY count DESC;

--ejercicio 16: 
--Usa los comandos HAVING y MIN de SQL para encontrar todas las acciones de FAANG cuya precio 
--de apertura por acción siempre fue superior a $100.
SELECT ticker, MIN(open)
FROM stock_prices
GROUP BY ticker
HAVING MIN(open) > 100;

--ejercicio 17: Dada una tabla de candidatos y sus habilidades técnicas, enumere los 
--identificadores de los candidatos que tengan más de 2 habilidades técnicas.
--No hay duplicados en la tabla de candidatos.
SELECT candidate_id FROM candidates
GROUP BY candidate_id
HAVING COUNT(candidate_id) > 2;

--ejercicio 18: Supongamos que se le proporciona una tabla que contiene datos sobre 
--los clientes de Amazon y su gasto en productos de diferentes categorías. 
--Escriba una consulta utilizando COUNT DISTINCT para identificar la cantidad de productos
--únicos dentro de cada categoría de producto.
SELECT category, COUNT(DISTINCT product)
FROM product_spend
GROUP BY category;

--ejercicio 19: CVS Health está intentando comprender mejor las ventas de sus farmacias y qué tan bien se venden los distintos productos. 
--Cada medicamento solo puede ser producido por un fabricante.
--Redacte una consulta para encontrar los 3 medicamentos más rentables vendidos y cuántas ganancias obtuvieron.
--Suponga que no hay vínculos en las ganancias. Muestre el resultado desde la ganancia total más alta hasta la más baja.
SELECT drug, total_sales - cogs AS total_profit
FROM pharmacy_sales
ORDER BY total_profit DESC LIMIT 3;

--ejercicio 20: Su equipo en JPMorgan Chase se está preparando para lanzar una nueva tarjeta de crédito y, 
--para obtener más información, está analizando cuántas tarjetas de crédito se emitieron cada mes.
--Redacte una consulta que muestre el nombre de cada tarjeta de crédito y la diferencia en la 
--cantidad de tarjetas emitidas entre el mes con la mayor cantidad de tarjetas emitidas y el mes con la
--menor cantidad de tarjetas emitidas. Organice los resultados en función de la mayor disparidad.
SELECT card_name, MAX(issued_amount) - MIN(issued_amount) AS difference
FROM monthly_cards_issued
GROUP BY card_name
ORDER BY difference DESC;

--ejercicio 21: Muestra las acciones que tuvieron "meses de grandes movimientos" y cuántos de esos meses tuvieron. 
--Ordena tus resultados desde las acciones con más, hasta las que tuvieron menos, "meses de grandes movimientos".
--¿Qué es un mes de grandes movimientos?
SELECT ticker, COUNT(ticker)
FROM stock_prices
WHERE (close - open)/open > 0.10 OR (close - open)/open < -0.10
GROUP BY ticker
ORDER BY count DESC;

--ejercicio 22: Imagina que eres un analista de datos que trabaja en la farmacia CVS y tienes acceso a los datos de ventas de la farmacia.
--Para todos los medicamentos de Merck, genera el nombre del medicamento y el costo unitario de cada uno, redondeado al dólar más cercano.
--Ordénalo desde el medicamento más barato hasta el más caro.
--Sugerencia: el costo unitario se define como las ventas totales divididas por las unidades vendidas.
SELECT drug, CEIL(total_sales / units_sold) AS unit_cost
FROM pharmacy_sales
WHERE manufacturer = 'Merck'
ORDER BY unit_cost;

--ejercicio 23: Tesla está investigando cuellos de botella en la producción y necesita su ayuda 
--para extraer los datos relevantes. Escriba una consulta para determinar qué piezas han comenzado 
--el proceso de ensamblaje pero aún no están terminadas.
--Suposiciones:
SELECT part, assembly_step
FROM parts_assembly
WHERE finish_date IS NULL;

--ejercicio 24: Explora el conjunto de datos de Marvel Avengers y 
--escribe una consulta para categorizar a los superhéroes según sus 
--me gusta promedio de la siguiente manera:
SELECT actor,character,platform,avg_likes,
  CASE 
    WHEN avg_likes >= 15000 THEN 'Super Likes'
    WHEN avg_likes BETWEEN 5000 AND 14999 THEN 'Good Likes'
    ELSE 'Low Likes'
  END AS likes_category
FROM marvel_avengers
ORDER BY avg_likes DESC;

--ejercicio 25: Esta es la misma pregunta que el problema n.° 3 del capítulo SQL de Ace the Data Science Interview. 
SELECT 
  SUM(CASE WHEN device_type = 'laptop' THEN 1 ELSE 0 END) AS laptop_views, 
  SUM(CASE WHEN device_type IN ('tablet', 'phone') THEN 1 ELSE 0 END) AS mobile_views 
FROM viewership;

--ejercicio 26: Supongamos que le han proporcionado las tablas que contienen información sobre 
--los usuarios de Robinhood y las transacciones bursátiles que realizaron.
--Use una operación JOIN para generar toda la información de la tabla de 
--transacciones unida a la tabla de usuarios.
SELECT *
FROM trades
INNER JOIN users
  ON trades.user_id = users.user_id;

--ejercicio 27: ¡Esta es la misma pregunta que el problema n.° 2 del capítulo SQL de Ace the Data Science Interview!
SELECT users.city, COUNT(trades.order_id) AS total_orders 
FROM trades 
INNER JOIN users 
  ON trades.user_id = users.user_id 
WHERE trades.status = 'Completed' 
GROUP BY users.city 
ORDER BY total_orders DESC
LIMIT 3;

--ejercicio 28: Supongamos que se le proporcionan dos tablas que contienen datos sobre las páginas de 
--Facebook y sus respectivos "Me gusta" (como en "Me gusta una página de Facebook").
SELECT page_id
FROM pages
WHERE NOT EXISTS (
  SELECT page_id
  FROM page_likes AS likes
  WHERE likes.page_id = pages.page_id);

--ejercicio 29: Dada una tabla de publicaciones de Facebook, 
--para cada usuario que publicó al menos dos veces en 2021, 
--escribe una consulta para encontrar la cantidad de días 
--entre la primera publicación del año y la última publicación
--del año de cada usuario en el año 2021. 
SELECT 
	user_id, 
    MAX(post_date::DATE) - MIN(post_date::DATE) AS days_between
FROM posts
WHERE DATE_PART('year', post_date::DATE) = 2021 
GROUP BY user_id
HAVING COUNT(post_id)>1;
-------------*****Advanced SQL**********
--EJERCICIO 30:
--Como el analista de datos principal para una destacada empresa
--de gestión de eventos musicales, se te ha encomendado un conjunto
--de datos que contiene ingresos por conciertos e información
--detallada sobre varios artistas.
SELECT artist_name,concert_revenue,genre,number_of_members,revenue_per_member
FROM (
  -- Subquery Result
  SELECT
    artist_name,
    concert_revenue,
    genre,
    number_of_members,
    concert_revenue / number_of_members AS revenue_per_member,
    RANK() OVER (
      PARTITION BY genre
      ORDER BY concert_revenue / number_of_members DESC) AS ranked_concerts
  FROM concerts) AS subquery
WHERE ranked_concerts = 1
ORDER BY revenue_per_member DESC;
--EJERCICIO 31:
--Un cliente de Supercloud de Microsoft Azure se define como un 
--cliente que ha comprado al menos un producto de cada categoría
--de producto listada en la tabla de productos.
WITH supercloud_cust AS (
  SELECT 
    customers.customer_id, 
    COUNT(DISTINCT products.product_category) AS product_count
  FROM customer_contracts AS customers
  INNER JOIN products 
    ON customers.product_id = products.product_id
  GROUP BY customers.customer_id
)

SELECT customer_id
FROM supercloud_cust
WHERE product_count = (
  SELECT COUNT(DISTINCT product_category) FROM products
);
--EJERCICIO 32:
--Asume que tienes la tabla de clientes que contiene todos 
--los detalles del cliente. El gerente de la sucursal 
--está buscando un cliente masculino cuyo nombre termine en "son" y que tenga 20 años.
SELECT *
FROM customers
WHERE LOWER(customer_name) LIKE '%son'
  AND gender = 'Male'
  AND age = 20;
 --EJERCICIO 33:
 --CVS Health quiere obtener una comprensión más 
 --clara de sus ventas de farmacia y el rendimiento 
 --de varios productos.
 SELECT 
  manufacturer, 
  CONCAT( '$', ROUND(SUM(total_sales) / 1000000), ' million') AS sales_mil 
FROM pharmacy_sales 
GROUP BY manufacturer 
ORDER BY SUM(total_sales) DESC, manufacturer;

