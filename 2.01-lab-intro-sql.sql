-- 1. Get all the data from tables actor, film and customer.
select * from actor, film, customer

-- Get film titles.
select title from film group by title

-- 2. Get unique list of film languages under the alias language. Note that we are not asking you to obtain the language per each film, but this is a good time to think about how you might get that information in the future
select name as "Language" from language GROUP BY name

-- OR:
SELECT DISTINCT name AS "Language" FROM language

-- 3. Find out how many stores does the company have?
SELECT COUNT(store_id) FROM store

-- 4. Find out how many employees staff does the company have?
SELECT COUNT(staff_id) FROM staff

-- 5. Return a list of employee first names only?
SELECT first_name from staff