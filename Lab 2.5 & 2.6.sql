USE sakila;
-- Select all the actors with the first name ‘Scarlett’.
SELECT first_name 
FROM actor;
-- How many films (movies) are available for rent and how many films have been rented?
SELECT COUNT(film_id) FROM film;
SELECT COUNT(rental_id) FROM rental;
-- What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT MAX(length) as max_duration FROM film;
SELECT MIN(length) as min_duration FROM film;
-- What's the average movie duration expressed in format (hours, minutes)?
SELECT round(AVG(length)/60,2) AS avg_length FROM film;
-- How many distinct (different) actors' last names are there?
SELECT COUNT(DISTINCT last_name, last_name) FROM actor;
-- Since how many days has the company been operating (check DATEDIFF() function)?
SELECT * FROM sakila.payment
ORDER BY payment_date ASC;
SELECT DATEDIFF (day, 24-05-2005 , 14-02-2006); --NOT WORKING;

-- Show rental info with additional columns month and weekday. Get 20 results
SELECT * FROM rental;
SELECT substr(rental_date,3,2) AS month FROM rental;
SELECT substr(rental_date,4,2) AS month FROM weekday; -- Weekday?? Like monday, tuesday how an I supposed to know that
SELECT DAYOFWEEK(1,2) ;
-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.

-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week. (This one is a follow up from the previous one so I cound get it done)

-- Get release years.
SELECT release_year, title FROM film -- I think there might be something wrong, why is the release year all 2006?
ORDER BY release_year ASC;

-- Get all films with ARMAGEDDON in the title.
SELECT * FROM film
WHERE title = 'ARMAGEDON'; 

-- Get all films which title ends with APOLLO.
SELECT LEFT(title,title(' ',title + ' ')-1) AS FirstName from film;

-- Get 10 the longest films.
SELECT length, title FROM film
ORDER BY length ASC
LIMIT 10;

-- How many films include Behind the Scenes content?
SELECT special_features, COUNT('Behind the Scenes') FROM film;

-- LAB 2.6
-- In the table actor, which are the actors whose last names are not repeated? For example if you would sort the data in the table actor by last_name, you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. These three actors have the same last name. So we do not want to include this last name in our output. Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.;
SELECT last_name, COUNT(last_name)
FROM actor
GROUP BY last_name
HAVING COUNT(last_name) = 1;
-- Which last names appear more than once? We would use the same logic as in the previous question but this time we want to include the last names of the actors where the last name was present more than once
SELECT last_name, COUNT(last_name)
FROM actor
GROUP BY last_name
HAVING COUNT(last_name) > 1;

-- Using the rental table, find out how many rentals were processed by each employee.
SELECT 
SUM(DISTINCT staff_id) total
FROM rental;
-- THE PROBLEM THAT I HAVE WITH THE ABOVE QUESTION AND BELLOW, IS THAQT I CANT WORKOUT THE FORMULA OF HOW TO COUNT THE SUM OF DISTINCT VALUES.
-- Using the film table, find out how many films were released each year.
SELECT release_year FROM film;

-- Using the film table, find out for each rating how many films were there.

-- What is the mean length of the film for each rating type. Round off the average lengths to two decimal places

SELECT rating FROM film
WHERE AVG(lenght) > 120;

-- Rank films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank;
SELECT title, length FROM film
WHERE (title IS NOT NULL) AND (title = '  ')
WHERE (length IS NOT NULL) AND (length = '  ');
