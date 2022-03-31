USE sakila;

-- 1 List all actors.
select * from actor;

-- 2 Find the surname of the actor with the forename 'John'.
select last_name from actor where first_name ="john";

-- 3 Find all actors with surname 'Neeson'.
select * from actor where last_name = "Neeson";

-- 4 Find all actors with ID numbers divisible by 10.
Select first_name, Last_name, (actor_ID/10)
from actor WHERE actor_id % 10 = 0;

-- 5 What is the description of the movie with an ID of 100?
select description from film where film_id = 100;

-- 6 Find every R-rated movie.
select title, rating from film where rating = "R";

-- 7 Find every non-R-rated movie.
select title, rating from film where rating != "R";

-- 8 Find the ten shortest movies.
select title, description, length from film where length order by length limit 10;

-- 9 Find the movies with the longest runtime, without using LIMIT.
Select title from film 
where length = (SELECT Max(length) FROM film);

-- 10 Find all movies that have deleted scenes.
select title from film 
where special_features like "%deleted scenes%";


-- 11 Using HAVING, reverse-alphabetically list the last names that are not repeated.
SELECT last_name from actor
GROUP BY last_name
HAVING COUNT(last_name)=1
ORDER BY last_name DESC;

-- 12 Using HAVING, list the last names that appear more than once, from highest to lowest frequency.
SELECT last_name, count(last_name) from actor
GROUP BY last_name
HAVING COUNT(last_name)>1
ORDER BY count(last_name) desc;

-- 13 Which actor has appeared in the most films?
select first_name, last_name, count(fa.film_id)
From Actor a
JOIN film_actor fa ON fa.actor_id = a.actor_id
GROUP BY a.actor_id
Order by count(fa.film_id) desc
limit 1;

-- 14 When is 'Academy Dinosaur' due?
select title, release_year from film where title = "academy Dinosaur";
-- i have given 2 answers as the question is ambiguous - is the due date the release year or when it is due to be returned to the shop
SELECT return_date
FROM rental r
JOIN inventory i ON i.inventory_id = r.inventory_id
JOIN  film f ON f.film_id = i.film_id
WHERE f.title = "Academy Dinosaur"
ORDER BY return_date DESC;

-- 15 What is the average runtime of all films?
select avg(length) from film;

-- 16 List the average runtime for every film category.
select c.name, avg(length)
from film f
JOIN film_category fc ON f.film_id=fc.film_id
JOIN category c ON c.category_id=fc.category_id
GROUP by fc.category_id;


-- 17 List all movies featuring a robot.
select title
from film
where description like "%robot%";

-- 18 How many movies were released in 2010?
select count(film_id) 
from film
where release_year = 2010;

-- 19 Find the titles of all the horror movies.
select f.title, c.name 
from film f
JOIN film_category fc ON f.film_id=fc.film_id
JOIN category c ON c.category_id=fc.category_id
WHERE c.name = "horror";

-- 20 List the full name of the staff member with the ID of 2.
select first_name, last_name
from staff Where staff_ID = 2;

-- 21 List all the movies that Fred Costner has appeared in.
Select a.actor_id, a.first_name, a.last_name, f.title
from film f 
JOIN film_actor fa ON f.film_id = fa.film_id
Join actor a ON a.actor_ID = fa.actor_ID
WHERE a.first_name = "Fred" AND a.last_name = "Costner";


-- 22 How many distinct countries are there?
select count(distinct country) from country;

-- 23 List the name of every language in reverse-alphabetical order.
select name 
from language 
order by name desc;

-- 24 List the full names of every actor whose surname ends with '-son' in alphabetical order by their forename.
select first_name, last_name
from actor
where last_name like "%son";

-- 25 Which category contains the most films?
select c.name, count(f.title)
from category c
join film_category fc ON c.category_id = fc.category_id
join film f ON f.film_id=fc.film_id
group by c.name;