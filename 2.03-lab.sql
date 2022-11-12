-- 1. How many distinct (different) actors' last names are there?
SELECT COUNT(DISTINCT last_name) FROM actor;

-- 2. In how many different languages where the films originally produced? (Use the column language_id from the film table)
SELECT COUNT(DISTINCT language_id) FROM film;

-- 3. How many movies were released with "PG-13" rating?
SELECT COUNT(film_id) FROM film WHERE rating = 'PG-13';

-- 4. Get 10 the longest movies from 2006.
-- SELECT * FROM film WHERE release_year = 2006 ORDER BY length DESC LIMIT 10;

-- 5. How many days has been the company operating (check DATEDIFF() function)?  
SELECT  DATEDIFF(MAX(rental_date), MIN(rental_date)) AS 'Operating days' FROM rental;

-- 6. Show rental info with additional columns month and weekday. Get 20.
SELECT *, EXTRACT(MONTH from CONVERT(rental_date, date)) AS Month, EXTRACT(DAY from CONVERT(rental_date, date)) AS Weekday from rental LIMIT 20;

-- 7. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT rental_date, DAYNAME(rental_date),
CASE DAYNAME(rental_date)
	WHEN 'Saturday' THEN 'Weekend' 
	WHEN 'Sunday' THEN 'Weekend'
	ELSE 'Weekday'
	END AS 'day_type'
FROM sakila.rental;
    
-- 8. How many rentals were in the last month of activity?
SELECT max(rental_date) -interval 1 month FROM rental;
SELECT count(rental_id) from rental WHERE rental_date > '2006-01-14';