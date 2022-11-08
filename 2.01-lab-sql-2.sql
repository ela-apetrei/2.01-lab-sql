-- Select all the actors with the first name ‘Scarlett’.
SELECT * FROM actor WHERE first_name LIKE "Scarlett";

-- Select all the actors with the last name ‘Johansson’.
SELECT * FROM actor WHERE last_name LIKE "Johansson";

-- How many films (movies) are available for rent?
SELECT COUNT(inventory_id) FROM rental WHERE return_date is not null;

-- How many films have been rented?
SELECT COUNT(film_id) FROM film WHERE rental_rate > 0;

-- What is the shortest and longest rental period?
SELECT MAX(rental_duration) FROM film;
SELECT MIN(rental_duration) FROM film;

-- What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT MAX(length) FROM film AS max_duration;
SELECT MIN(length) FROM film AS min_duration;

-- What's the average movie duration?
SELECT avg(length) FROM film;

-- What's the average movie duration expressed in format (hours, minutes)?
SELECT convert('115.2720', datetime);

-- How many movies longer than 3 hours?
SELECT COUNT(film_id) FROM film where (length > 180);

-- Get the name and email formatted. Example: Mary SMITH - mary.smith@sakilacustomer.org.
SELECT concat(first_name, ' ', last_name, ' - ', email) FROM customer;

-- What's the length of the longest film title?
SELECT length(title) AS 'Length of movie title' FROM film HAVING MAX(length)