USE mavenmovies;
-- Sakila Database Query Collection

-- 1. Total number of rentals
-- Retrieves the count of all rental records
SELECT COUNT(*) AS total_rentals FROM rental;

-- 2. Average rental duration
-- Calculates the average number of days a movie is rented
SELECT 
    AVG(DATEDIFF(return_date, rental_date)) AS avg_rental_duration 
FROM rental 
WHERE return_date IS NOT NULL;

-- 3. Customer names in uppercase
-- Converts first and last names to uppercase
SELECT 
    UPPER(first_name) AS uppercase_first_name, 
    UPPER(last_name) AS uppercase_last_name 
FROM customer;

-- 4. Extract month from rental date
-- Shows rental ID with the corresponding month of rental
SELECT 
    rental_id, 
    MONTH(rental_date) AS rental_month 
FROM rental;

-- 5. Count of rentals per customer
-- Groups rentals by customer and counts their total rentals
SELECT 
    customer_id, 
    COUNT(rental_id) AS rental_count 
FROM rental 
GROUP BY customer_id;

-- 6. Total revenue by store
-- Calculates total revenue for each store
SELECT 
    store.store_id, 
    SUM(payment.amount) AS total_revenue 
FROM store 
JOIN staff ON store.store_id = staff.store_id
JOIN payment ON staff.staff_id = payment.staff_id
GROUP BY store.store_id;

--  Movie rental details with customer information
-- Joins film, inventory, rental, and customer tables to show movie titles and renters
SELECT 
    film.title, 
    customer.first_name, 
    customer.last_name 
FROM film 
JOIN inventory ON film.film_id = inventory.film_id
JOIN rental ON inventory.inventory_id = rental.inventory_id
JOIN customer ON rental.customer_id = customer.customer_id;

-- 8. Actors in "Gone with the Wind"
-- Finds all actors who appeared in the specified film
SELECT 
    actor.first_name, 
    actor.last_name 
FROM actor 
JOIN film_actor ON actor.actor_id = film_actor.actor_id
JOIN film ON film_actor.film_id = film.film_id
WHERE film.title = 'GONE WITH THE WIND';

-- Group by 1 Rentals per movie category
-- Counts total rentals for each movie category
SELECT 
    category.name AS category_name, 
    COUNT(rental.rental_id) AS total_rentals 
FROM category 
JOIN film_category ON category.category_id = film_category.category_id
JOIN film ON film_category.film_id = film.film_id
JOIN inventory ON film.film_id = inventory.film_id
JOIN rental ON inventory.inventory_id = rental.inventory_id
GROUP BY category.name;

-- Group by 2 Average rental rate by language
-- Calculates average rental rate for each language
SELECT 
    language.name AS language_name, 
    AVG(film.rental_rate) AS avg_rental_rate 
FROM film 
JOIN language ON film.language_id = language.language_id
GROUP BY language.name;

-- join 3. Customer total rental spend
-- Calculates total amount spent by each customer on rentals
SELECT 
    customer.customer_id,
    customer.first_name,
    customer.last_name,
    SUM(payment.amount) AS total_spent 
FROM customer 
JOIN payment ON customer.customer_id = payment.customer_id
GROUP BY customer.customer_id, customer.first_name, customer.last_name;

-- Advanced Joins and GROUP BY:5 Top 5 most rented movies
-- Lists the 5 movies with the most rental occurrences
SELECT 
    film.title, 
    COUNT(rental.rental_id) AS times_rented 
FROM film 
JOIN inventory ON film.film_id = inventory.film_id
JOIN rental ON inventory.inventory_id = rental.inventory_id
GROUP BY film.title
ORDER BY times_rented DESC
LIMIT 5;

-- Advanced Joins and GROUP BY:6 Customers renting from both stores
-- Identifies customers who have rented from both store ID 1 and 2
SELECT 
    customer.customer_id, 
    customer.first_name, 
    customer.last_name
FROM customer 
JOIN rental ON customer.customer_id = rental.customer_id
JOIN inventory ON rental.inventory_id = inventory.inventory_id
WHERE inventory.store_id IN (1, 2)
GROUP BY customer.customer_id, customer.first_name, customer.last_name
HAVING COUNT(DISTINCT inventory.store_id) = 2;