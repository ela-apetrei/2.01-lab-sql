-- 1. Get the id values of the first 5 clients from district_id with a value equals to 1.
SELECT client_id, district_id FROM client 
WHERE district_id = 1 
ORDER BY client_id ASC 
LIMIT 5;

-- 2. In the client table, get an id value of the last client where the district_id equals to 72.
SELECT client_id, district_id FROM client 
WHERE district_id = 72 
ORDER BY client_id DESC LIMIT 1;

-- 3. Get the 3 lowest amounts in the loan table.
SELECT amount FROM loan 
ORDER BY amount ASC LIMIT 3;
 
-- 4. What are the possible values for status, ordered alphabetically in ascending order in the loan table?
SELECT DISTINCT(status) FROM loan 
ORDER BY status ASC;

-- 5. What is the loan_id of the highest payment received in the loan table?
SELECT loan_id, amount FROM loan 
ORDER BY amount DESC 
LIMIT 1;

-- 6. What is the loan amount of the lowest 5 account_ids in the loan table? Show the account_id and the corresponding amount
SELECT account_id, amount FROM loan 
ORDER BY account_id 
ASC LIMIT 5;

-- 7. What are the account_ids with the lowest loan amount that have a loan duration of 60 in the loan table?
SELECT account_id, amount FROM loan 
WHERE duration = 60 
ORDER BY amount ASC 
LIMIT 5;

-- 8. What are the unique values of k_symbol in the order table? Note: There shouldn't be a table name order, since order is reserved from the ORDER BY clause. You have to use backticks to escape the order table name
SELECT DISTINCT(k_symbol) FROM `order`;

-- 9. In the order table, what are the order_ids of the client with the account_id 34?
SELECT  account_id, order_id FROM `order` 
WHERE account_id = 34;

-- 10. In the order table, which account_ids were responsible for orders between order_id 29540 and order_id 29560 (inclusive)?
SELECT account_id FROM `order` 
WHERE order_id BETWEEN 29540 AND 29560;

-- 11. In the order table, what are the individual amounts that were sent to (account_to) id 30067122?
SELECT amount FROM `order` 
WHERE account_to = 30067122;

-- 12. In the trans table, show the trans_id, date, type and amount of the 10 first transactions from account_id 793 in chronological order, from newest to oldest.
SELECT trans_id, `date`, `type`, amount FROM trans 
WHERE account_id = 793 
ORDER BY `date` ASC 
LIMIT 10;

-- 13. In the client table, of all districts with a district_id lower than 10, how many clients are from each district_id? Show the results sorted by the district_id in ascending order.
SELECT DISTINCT(district_id), COUNT(client_id) FROM `client` 
WHERE district_id < 10 
GROUP BY district_id 
ORDER BY district_id ASC; 

-- 14. In the card table, how many cards exist for each type? Rank the result starting with the most frequent type.
SELECT `type`, count(`type`) AS 'Count of each type' FROM bank.card 
GROUP BY `type` 
ORDER BY count(`type`) DESC;

-- 15. Using the loan table, print the top 10 account_ids based on the sum of all of their loan amounts.
SELECT account_id, SUM(amount) FROM bank.loan 
GROUP BY account_id 
ORDER BY SUM(amount) DESC 
LIMIT 10;

-- 16. In the loan table, retrieve the number of loans issued for each day, before (excl) 930907, ordered by date in descending order.
SELECT `date`, COUNT(loan_id) AS 'Count of loans per day' FROM bank.loan 
WHERE `date` < 930907 
GROUP BY `date` 
ORDER BY `date` DESC;

-- 17. In the loan table, for each day in December 1997, count the number of loans issued for each unique loan duration, ordered by date and duration, both in ascending order. You can ignore days without any loans in your output.
SELECT `date`, COUNT(loan_id) FROM bank.loan 
WHERE `date` BETWEEN 931200 AND 940101 
GROUP BY `date`;

-- 18. In the trans table, for account_id 396, sum the amount of transactions for each type (VYDAJ = Outgoing, PRIJEM = Incoming). Your output should have the account_id, the type and the sum of amount, named as total_amount. Sort alphabetically by type.
SELECT account_id, type, SUM(amount) AS total_amount FROM trans
WHERE account_id = 396
GROUP BY type
ORDER BY type asc;

-- 19. From the previous output, translate the values for type to English, rename the column to transaction_type, round total_amount down to an integer
SELECT account_id, type, ROUND(SUM(amount)) AS total_amount,
CASE 
WHEN `type` = 'VYDAJ' then 'outgoing'
WHEN `type` = 'PRIJEM' then 'incoming'
END AS 'transaction_type'
FROM trans
WHERE account_id = 396
GROUP BY type
ORDER BY type asc;

-- 20. From the previous result, modify your query so that it returns only one row, with a column for incoming amount, outgoing amount and the difference.
SELECT account_id,
FLOOR(SUM(case
WHEN type = 'PRIJEM' THEN amount
		end)) AS incomming,
		FLOOR(SUM(case
			WHEN type = 'VYDAJ' then amount
		end)) as outgoing,
		FLOOR(SUM(case
			when type = 'PRIJEM' then amount
		end)) -
		FLOOR(SUM(case
			when type = 'VYDAJ' then amount
		end)) as difference
	FROM bank.trans
WHERE account_id = 396
GROUP BY account_id;

-- 21. Continuing with the previous example, rank the top 10 account_ids based on their difference.
SELECT account_id,
		FLOOR(SUM(case
			when type = 'PRIJEM' THEN amount
		end)) -
		FLOOR(SUM(CASE
			WHEN type = 'VYDAJ' THEN amount
		end)) as difference
	FROM bank.trans
GROUP BY account_id
ORDER BY difference desc
limit 10;