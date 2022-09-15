USE sakila;
-- Select all the actors with the first name ‘Scarlett’.
SELECT first_name 
FROM actor;

-- How many films (movies) are available for rent and how many films have been rented?
SELECT COUNT(DISTINCT film_id)
FROM sakila.inventory;

SELECT COUNT(DISTINCT rental_id)
FROM sakila.rental;
-- What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT MAX(length) as max_duration FROM film;
SELECT MIN(length) as min_duration FROM film;
-- What's the average movie duration expressed in format (hours, minutes)?
SELECT CONCAT(CAST(FLOOR(AVG(length)/60) AS CHAR),':',FLOOR(CAST(AVG(length)%60 AS CHAR)))
FROM sakila.film;
-- How many distinct (different) actors' last names are there?
SELECT COUNT(DISTINCT last_name) 
FROM sakila.actor;
-- Since how many days has the company been operating (check DATEDIFF() function)?
SELECT DATEDIFF(max(rental_date),min(rental_date))
FROM sakila.rental;

-- Show rental info with additional columns month and weekday. Get 20 results
SELECT * FROM rental;
SELECT substr(rental_date,3,2) AS month FROM rental;
SELECT substr(rental_date,4,2) AS month FROM weekday; -- Weekday?? Like monday, tuesday how an I supposed to know that
SELECT DAYOFWEEK(1,2) ;
-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT *,WEEKDAY((CONVERT(return_date,date))) AS Weekday_return, DATE_FORMAT(CONVERT(return_date,date), "%M") AS Return_month, CASE
WHEN WEEKDAY((CONVERT(return_date,date))) = 1 or WEEKDAY((CONVERT(return_date,date))) = 7 THEN 'Weekend'
ELSE 'Workday'
END AS day_type
FROM sakila.rental;

-- Get release years.
SELECT release_year, title FROM film -- 
ORDER BY release_year ASC;

-- Get all films with ARMAGEDDON in the title.
SELECT *
FROM sakila.film
WHERE title LIKE '%ARMAGEDDON%';

-- Get all films which title ends with APOLLO.
SELECT *
FROM sakila.film
WHERE title LIKE '%APOLLO';

-- Get 10 the longest films.
SELECT *
FROM sakila.film
ORDER BY length DESC
LIMIT 10;

-- How many films include Behind the Scenes content?
SELECT *
FROM sakila.film
WHERE special_features LIKE 'Behind the Scenes';

