-- 1. Drop column picture from staff.
-- drop column
alter table staff
drop column picture;
select * from staff;

-- 2. A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
insert into staff
values (3,'Tammy','Sanders',79,'TAMMY.SANDERS@sakilacustomer.org',2,1,'Tammy','','2006-02-15 04:57:20');
select * from staff;

-- 3. Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. You can use current date for the rental_date column in the rental table. Hint: Check the columns in the table rental and see what information you would need to add there. You can query those pieces of information. For eg., you would notice that you need customer_id information as well. To get that you can use the following query:
select customer_id from sakila.customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER'; -- customer_id=130

-- Use similar method to get inventory_id, film_id, and staff_id.
select * from rental order by rental_id desc;
select * from film where title = "Academy Dinosaur"; -- film_id=1; 
select * from inventory where film_id=1; -- inventory_id=1;

insert into rental
values(16050, '2005-09-23 22:50:12', 1, 130, null, 1, '2005-09-23 22:50:12');


-- 4. Delete non-active users, but first, create a backup table deleted_users to store customer_id, email, and the date for the users that would be deleted. Follow these steps:
-- Check if there are any non-active users
select * from customer where `active` = 0;

-- Create a table backup table as suggested
CREATE TABLE backup_table (
  customer_id int UNIQUE NOT NULL,
  store_id int NOT NULL,
  first_name varchar(50),
  last_name varchar(50),
  email varchar(50),
  address_id int,
  `active` int,
  creation_date datetime,
  last_update datetime default null,
  CONSTRAINT PRIMARY KEY (customer_id)
);

drop table if exists backup_table;

-- Insert the non active users in the table backup table
insert into backup_table
values 
('16', '2', 'SANDRA', 'MARTIN', 'SANDRA.MARTIN@sakilacustomer.org', '20', '0', '2006-02-14 22:04:36', '2006-02-15 04:57:20'),
('64', '2', 'JUDITH', 'COX', 'JUDITH.COX@sakilacustomer.org', '68', '0', '2006-02-14 22:04:36', '2006-02-15 04:57:20'),
('124', '1', 'SHEILA', 'WELLS', 'SHEILA.WELLS@sakilacustomer.org', '128', '0', '2006-02-14 22:04:36', '2006-02-15 04:57:20'),
('169', '2', 'ERICA', 'MATTHEWS', 'ERICA.MATTHEWS@sakilacustomer.org', '173', '0', '2006-02-14 22:04:36', '2006-02-15 04:57:20'),
('241', '2', 'HEIDI', 'LARSON', 'HEIDI.LARSON@sakilacustomer.org', '245', '0', '2006-02-14 22:04:36', '2006-02-15 04:57:20'),
('271', '1', 'PENNY', 'NEAL', 'PENNY.NEAL@sakilacustomer.org', '276', '0', '2006-02-14 22:04:36', '2006-02-15 04:57:20'),
('315', '2', 'KENNETH', 'GOODEN', 'KENNETH.GOODEN@sakilacustomer.org', '320', '0', '2006-02-14 22:04:37', '2006-02-15 04:57:20'),
('368', '1', 'HARRY', 'ARCE', 'HARRY.ARCE@sakilacustomer.org', '373', '0', '2006-02-14 22:04:37', '2006-02-15 04:57:20'),
('406', '1', 'NATHAN', 'RUNYON', 'NATHAN.RUNYON@sakilacustomer.org', '411', '0', '2006-02-14 22:04:37', '2006-02-15 04:57:20'),
('446', '2', 'THEODORE', 'CULP', 'THEODORE.CULP@sakilacustomer.org', '451', '0', '2006-02-14 22:04:37', '2006-02-15 04:57:20'),
('482', '1', 'MAURICE', 'CRAWLEY', 'MAURICE.CRAWLEY@sakilacustomer.org', '487', '0', '2006-02-14 22:04:37', '2006-02-15 04:57:20'),
('510', '2', 'BEN', 'EASTER', 'BEN.EASTER@sakilacustomer.org', '515', '0', '2006-02-14 22:04:37', '2006-02-15 04:57:20'),
('534', '1', 'CHRISTIAN', 'JUNG', 'CHRISTIAN.JUNG@sakilacustomer.org', '540', '0', '2006-02-14 22:04:37', '2006-02-15 04:57:20'),
('558', '1', 'JIMMIE', 'EGGLESTON', 'JIMMIE.EGGLESTON@sakilacustomer.org', '564', '0', '2006-02-14 22:04:37', '2006-02-15 04:57:20'),
('592', '1', 'TERRANCE', 'ROUSH', 'TERRANCE.ROUSH@sakilacustomer.org', '598', '0', '2006-02-14 22:04:37', '2006-02-15 04:57:20');

-- Delete the non active users from the table custome2
delete from customer where `active` = 0;
