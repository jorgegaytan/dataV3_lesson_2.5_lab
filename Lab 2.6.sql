-- 1. In the table actor, which are the actors whose last names are not repeated?...
SELECT first_name,last_name
FROM sakila.actor
WHERE last_name IN (SELECT last_name
					FROM sakila.actor
					GROUP BY last_name
					HAVING COUNT(last_name) = 1);
​
-- 2. Which last names appear more than once?
SELECT first_name,last_name
FROM sakila.actor
WHERE last_name IN (SELECT last_name
					FROM sakila.actor
					GROUP BY last_name
					HAVING COUNT(last_name) > 1);
                    
-- 3. Using the rental table, find out how many rentals were processed by each employee.
SELECT COUNT(rental_id)
FROM sakila.rental
GROUP BY staff_id;
​
-- 4. Using the film table, find out how many films were released each year.
SELECT release_year, COUNT(DISTINCT film_id)
FROM sakila.film
GROUP BY release_year;
​
-- 5. Using the film table, find out for each rating how many films were there.
SELECT rating,count(film_id)
FROM sakila.film
GROUP BY rating;
​
-- 6. What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
SELECT rating,ROUND(AVG(length),2)
FROM sakila.film
GROUP BY rating;
​
-- 7. Which kind of movies (rating) have a mean duration of more than two hours?
-- PG-13
​
-- 8. Rank films by length (filter out the rows that have nulls or 0s in length column). 
-- In your output, only select the columns title, length, and the rank.
​
SELECT title,length,CASE
WHEN length < 60 then 'Short'
WHEN length BETWEEN 60 AND 120 then 'Medium'
ELSE 'Long'
END AS length_rank
FROM sakila.film
WHERE length != 0 AND length IS NOT Null;