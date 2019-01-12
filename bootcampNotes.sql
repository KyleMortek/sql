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
-- where first_name like '%y'--any characters that end in y 
-- where first_name like '_her%'-- any number of chaacters can be placed in that underscore 
-- where first_name ILIKE 'bar%'-- no case sensitivity
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
