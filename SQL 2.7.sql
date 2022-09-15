SQL Join
USE SAKILA;
-- How many films are there for each of the categories in the category table. Use appropriate join to write this query.

SELECT * FROM sakila.film_category c;
SELECT * FROM sakila.film f;

SELECT fc.Category_id, sum(f.film_id) FROM sakila.film f
JOIN sakila.film_category fc
ON f.film_id = fc.film_id
GROUP BY category_id
ORDER BY fc.category_id ASC;

-- Display the total amount rung up by each staff member in August of 2005.
SELECT s.staff_id, sum(p.amount) FROM sakila.payment p
JOIN sakila.staff s
ON s.staff_id = p.staff_id
WHERE payment_date BETWEEN '2005-08-01 00:00:00' AND '2005-09-01 00:00:00'
GROUP BY staff_id;

-- Which actor has appeared in the most films?
SELECT a.actor_id, sum(

