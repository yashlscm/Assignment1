USE mavenmovies;
-- 1. Identify primary and foreign keys
-- A primary key is a unique identifier within a table that ensures each record can be distinctly recognized, typically implemented as an auto-incrementing number or a unique code that cannot contain duplicate or null values. 
-- In contrast, a foreign key is a column that creates a relationship between two tables by referencing the primary key of another table, allowing data to be linked across different tables.
SELECT * FROM information_schema.key_column_usage;

-- 2. List all details of actors
SELECT * FROM actor;

-- 3. List all customer information
SELECT * FROM customer;

-- 4. List different countries
SELECT DISTINCT country FROM country;

-- 5. Display active customers
SELECT * FROM customer WHERE active = 1;

-- 6. List rental IDs for customer with ID 1
SELECT rental_id FROM rental WHERE customer_id = 1;

-- 7. Films with rental duration > 5
SELECT * FROM film WHERE rental_duration > 5;

-- 8. Count of films with replacement cost between $15-$20
SELECT COUNT(*) FROM film WHERE replacement_cost > 15 AND replacement_cost < 20;

-- 9. Count of unique first names of actors
SELECT COUNT(DISTINCT first_name) FROM actor;

-- 10. First 10 records from customer table
SELECT * FROM customer LIMIT 10;

-- 11. First 3 customers with first name starting with 'b'
SELECT * FROM customer WHERE first_name LIKE 'b%' LIMIT 3;

-- 12. First 5 G-rated movies
SELECT * FROM film WHERE rating = 'G' LIMIT 5;

-- 13. Customers with first name starting with 'a'
SELECT * FROM customer WHERE first_name LIKE 'a%';

-- 14. Customers with first name ending with 'a'
SELECT * FROM customer WHERE first_name LIKE '%a';

-- 15. First 4 cities starting and ending with 'a'
SELECT * FROM city WHERE city LIKE 'a%a' LIMIT 4;

-- 16. Customers with 'NI' in first name
SELECT * FROM customer WHERE first_name LIKE '%NI%';

-- 17. Customers with 'r' in second position of first name
SELECT * FROM customer WHERE first_name LIKE '_r%';

-- 18. Customers with first name starting with 'a' and at least 5 characters
SELECT * FROM customer WHERE first_name LIKE 'a%' AND LENGTH(first_name) >= 5;

-- 19. Customers with first name starting with 'a' and ending with 'o'
SELECT * FROM customer WHERE first_name LIKE 'a%o';

-- 20. Films with PG and PG-13 rating
SELECT * FROM film WHERE rating IN ('PG', 'PG-13');

-- 21. Films with length between 50 and 100
SELECT * FROM film WHERE length BETWEEN 50 AND 100;

-- 22. Top 50 actors
SELECT * FROM actor LIMIT 50;

-- 23. Distinct film IDs from inventory
SELECT DISTINCT film_id FROM inventory;