
-- 1. Get film ratings.
SELECT film_id, title, rating from FILM;

-- 2. Get release years.
SELECT film_id, title, release_year from FILM;

-- 3. Get all films with ARMAGEDDON in the title.
SELECT film_id, title FROM film WHERE title LIKE "%ARMAGEDDON%";

-- 4. Get all films with APOLLO in the title
SELECT film_id, title FROM film WHERE title LIKE "%APOLLO%";

-- 5. Get all films which title ends with APOLLO.
SELECT film_id, title FROM film WHERE title LIKE "%APOLLO";

-- 6. Get all films with word DATE in the title.
SELECT film_id, title FROM film WHERE title LIKE "%DATE%";

-- 7. Get 10 films with the longest title.
SELECT title, length(title) FROM film ORDER BY length(title) DESC LIMIT 10;

-- 8. Get 10 the longest films.
SELECT * FROM film ORDER BY length DESC LIMIT 10;

-- 9. How many films include Behind the Scenes content?
SELECT count(film_id) FROM film WHERE special_features LIKE "%Behind the Scenes%";

-- 10. List films ordered by release year and title in alphabetical order.
SELECT * FROM film ORDER BY release_year, title ASC