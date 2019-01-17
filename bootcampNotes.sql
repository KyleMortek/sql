-- SELECT customer_id,amount,payment_date  
-- FROM payment
-- WHERE amount <= 1 OR amount >=8;
--  SELECT * FROM payment
--  select cusotmer_id, staff_id from payment
-- select count(*) from payment;
-- select count(distinct amount) from payment
-- select first_name,last_name from customer
-- order by first_name ASC,
-- last_name ASC;
-- select * from customer;
-- select customer_id, amount from payment
-- order by amount desc
-- limit 10;
-- challenge
-- select film_id ,title from film
-- order by film_id asc
-- limit 5;
-- select amount,payment_date from payment
-- where payment_date between '2007-02-07' and '2007-02-15'
-- time stamps 
-- limit 5;
-- where amount not between 8 and 9;
-- select * from city
-- where country_id between 99 and 100
-- order by city desc 
-- limit 3;

-- IN STATEMENT BELOW
select customer_id, rental_id, return_date
from rental 
where customer_id IN (7,13,10)
order by return_date desc;
select * from payment
where amount in(7.99, 8.99);
-- LIKE STATEMENT BELOW
SELECT first_name, last_name 
from customer
where first_name like '%y'--any characters that end in y 
where first_name like '_her%'-- any number of chaacters can be placed in that underscore 
where first_name ILIKE 'bar%'-- no case sensitivity
where first_name LIKE 'BAR%'-- wont find anything cause it needs to match. ABORT

-- how many payment transactions were greater than 5 dollars 
-- select  amount from payment
-- where amount > '5.00'
SELECT count(amount) from payment
where amount > '5.00'
-- how many actors have the first name that starts with the letter p
-- select * from actor
select count(first_name) from actor
where first_name ilike 'p%'

-- how many unique district are our customers from 
-- select DISTINCT count(*) from city
-- select count(DISTINCT(district)) from address;
-- select district from address
select count(DISTINCT (district)) from address
-- retrevie the list of people from those addresses from the question above 
-- select DISTINCT count(*) from city
-- select count(DISTINCT(district)) from address;
-- select district from address
select DISTINCT (district) from address

-- how many films have a rating of R and a replacment cost between5 and 15 doollars
select count(*) from film
where rating =('R')
and replacement_cost BETWEEN 5.00 and 15.00 
-- and replacement_cost BETWEEN 5 and 15
-- select count(rating) from film
-- where rating in('R')

-- how many films have the word truman somewhere in the title
select count(*) from film
where title ilike '%truman%'-- somewhere in the title

-- getting the average amount 
SELECT avg(amount) from payment
-- getting the roundded average
SELECT round(avg(amount)) from payment
-- getting the roundded average to 2 decimal places
SELECT round(avg(amount),2) from payment
-- below gets the count of how many payments were 0.00 dollars 
SELECT COUNT(amount) FROM payment
WHERE amount = 0.00; 
-- getting the minimum amount
SELECT MIN(amount) FROM payment
-- getting the max amount
SELECT Max(amount) FROM payment
-- getting the sum of all the amounts in payment 
SELECT SUM(amount) FROM payment
-- getting the ROUNDED sum of all the amounts in payment 
SELECT ROUND(SUM(amount),1) FROM payment
-- groups the same transcctions together ABORT
SELECT customer_id
FROM payment
GROUP BY customer_id 
-- group by with order by 
SELECT customer_id, sum(amount)
FROM payment
GROUP BY customer_id
order by sum(amount) desc
-- more group by notes 
select staff_id, count(payment_id)
from payment
group by staff_id
-- below counts the number of different types of ratings
select rating, count(rating) from film 
group by rating
-- continued group by 
select rental_duration, count(rental_duration)
from film
GROUP By rental_duration
-- group by average ratings
select rating, avg(rental_rate)
from film 
group by rating
-- group by staff_id, return the total number of payments per staffid and total
-- amount each staff id made. 
select staff_id, count(staff_id),sum(amount)
from payment
group by staff_id
-- get the average replacement cost of each rating of movie 
SELECT rating, round(avg(replacement_cost),2)
from film
group by rating
-- get the top 5 spenders by customer id so you can give coupons to them ABORT
-- for being such good customers 
select customer_id, sum(amount) 
from payment
group by customer_id
order by sum(amount) desc
limit 5 
-- HAVING LECTURE 
-- having clause ABORT
select customer_id, sum(amount)
from  payment
group by customer_id
having sum(amount) >200
--
select store_id, count( customer_id)
from customer
group BY store_id
having count(customer_id)>300
--find the average rate for each rating that are under 3 dollars 
select rating, avg(rental_rate)
from film
where rating    in ('R', 'G','PG' )
group by rating
having avg(rental_rate)<3
-- having challenege find cusotmers that have greater than or equal to 40 
--transacitons
select customer_id, count(*) 
from payment
group by customer_id
having count(*)>=40
--having challenge 
-- find the ratings of movies that had an average rental duration of more than 5
--days 
select rating, avg(rental_duration)
from film
group by rating 
having avg(rental_duration) >5
--Return the customer IDs of customers who have spent at least $110 with the staff member who has an ID of 2.</p>

select customer_id, staff_id, sum(amount) --,sum(amount)
from payment
where staff_id = 2
group by staff_id, customer_id
-- order by sum desc
having sum(amount) > 110
-- the having only works when there is a WHERE  and a GROUP BY claue before it?



--How many films begin with the letter J?------------------------------?2
SELECT count(title)
from film
where title ilike 'j%'-- ilike ignores case sensiviity 
-- where title like 'J%'--check case sensitivity 
-- where title ilike '%j%'-- check anywhere in the text for the asking CHAR
-- where title ilike 'j_%'--check if there is a letter after j and starts with j
-- where title ilike '%j_%'--checks if there is a letter after j and before it

--What customer has the highest customer ID number whose name starts-------?3
--with an 'E' and has an address id lower than 500?
select customer_id,first_name, last_name, address_id
from customer
where first_name like 'E_%' and address_id <500 
order by customer_id desc
limit 1

-- AS examples ------changes the name---------------ASAS AS AS
select customer_id, sum(amount) as total_spend
from payment
group by customer_id

-- JOINS 
select 
customer.customer_id ,
customer.first_name,
last_name,
email,
amount, 
payment_date
from customer
inner join payment on payment.customer_id = customer.customer_id
WHERE customer.customer_id = 2

--more joins 
select payment_id, first_name, last_name from payment
inner join staff on payment.staff_id = staff.staff_id
-- more joins 
select title,count(title)as copies_at_store_1 from inventory
INNER JOIN film on inventory.film_id = film.film_id
-- order by inventory.store_id asc
where inventory.store_id = 1
group by title
order by title
-- order by title
-- having count(title) > 3
-- order by title
----------------------------MORE INNER JOINS------------------------------
-- below joins language with film language_id so you can see both together
select film.title, language.name AS movieLang 
from film
INNER JOIN language 
-- or--- INNER JOIN language AS lan
ON language.language_id = film.language_id
-- or---ON lan.language_id = film.language_id
-- the commeneted out section shows you can you AS to shorten the code 
-- so the code looks more neat 

--NOTE: USING THE 'AS' STATEMENT IS NOT NEEDED. IT WILL STILL WORK WITHOUT IT
--SELECT * FROM TABLEa ______
--INNER JOIN TABLEb ______ 
--ON TABLEa.NAME = TABLEb.NAME

-------------------FULL OUTER JOIN------------------------------------------
-- SELECT * FROM TABLEa
--FULL OUTER JOIN TABLEb
--ON TABLEa.NAME = TABLEb.NAME
-- RETURNS ALL INFORMATION FROM BOTH TABLES 
-------------------LEFT OUTER JOIN------------------------------------------
-- SELECT * FROM TABLEa
-- LEFT OUTER JOIN TABLEb
-- ON TABLEa.NAME - TABLEb.NAME
--RETURNS EVERYTHING IN TABLE a PLUS WHAT TABLE a HAS IN COMMON WITH TABLEb
-------------------LEFT OUTER JOIN WITH WHERE STATEMENT---------------------
-- SELECT * FROM TABLEa
-- LEFT OUTER JOIN TABLEb
-- ON TABLEa.NAME - TABLEb.NAME
-- WHERE TABLEb.ID IS NULL
--RETURNS ONLY THE UNIWUE INFORMATION FROM TABLEa NOTHING IN COMMON WITH TABLEb
------------------FULL OUTER JOIN WITH WHERE STATEMENT---------------------
-- SELECT * FROM TABLEa
-- FULL OUTER JOIN TABLEb
-- ON TABLEa.NAME = TABLEb.NAME
-- WHERE TABLEa.ID IS NULL 
-- OR TABLEb.ID IS NULL 
-- RETURN ONLY UNIQUE INFORMATION FROM BOTH TABLES, THEY DONT HAVE IN COMMON

----- copy of all the movies that are not in inventory -------------
select film.film_id,film.title,inventory_id
from film
LEFT OUTER JOIN inventory on inventory.film_id = film.film_id
where inventory.film_id is null
---------or you can do it this way 
----- copy of all the movies that are not in inventory -------------
select film.film_id,film.title,inventory_id
from film
LEFT OUTER JOIN inventory on inventory.film_id = film.film_id
where inventory_id is NULL
order by title
--- both the same thing above 


-----------------------UNION statement------------------------------
---- union will delete duplicate rows
----- to avoid that use UNION ALL
----------------------extract--------------------------------------
select * from payment
select payment_date from payment
select extract(day from payment_date) from payment
-- more extract
select sum(amount), EXTRACT(month from payment_date) as MONTH
from payment
GROUP by MONTH
order by sum(amount)

