USE world;

-- 1 Using COUNT, get the number of cities in the USA.
SELECT countrycode, COUNT(DISTINCT `name`) FROM city WHERE countrycode = 'USA';
 
-- 2 Find out the population and life expectancy for people in Argentina.
Select Population from country where Code = "ARG";
Select LifeExpectancy from country where Code = "ARG";

-- 3 Using IS NOT NULL, ORDER BY, and LIMIT, which country has the highest life expectancy?
Select LifeExpectancy from country 
Where LifeExpectancy is not null 
order by LifeExpectancy DESC 
limit 1;

-- 4 Using JOIN ... ON, find the capital city of Spain.
Select *
FROM city 
JOIN country on city.CountryCode = Country.Code
Where ID = "653";

-- 5 Using JOIN ... ON, list all the languages spoken in the Southeast Asia region.
Select CountryCode, Language, Percentage, Region
From countrylanguage cl
JOIN country c on c.code = cl.CountryCode
WHERE region = "Southeast Asia";

-- 6 Using a single query, list 25 cities around the world that start with the letter F.
SELECT Name FROM city WHERE Name LIKE "F%" limit 25;


-- 7 Using COUNT and JOIN ... ON, get the number of cities in China.
Select count(*)
FROM city 
JOIN country on city.CountryCode = Country.Code
WHERE country.name ="china";

-- This should give same solution but doesn't, unsure why 

SELECT countrycode, COUNT(DISTINCT `name`) AS numberOfUSACities FROM city WHERE countrycode = 'CHN';

-- 8 Using IS NOT NULL, ORDER BY, and LIMIT, which country has the lowest population? Discard non-zero populations.
Select Name, population from country 
Where Population is not null and Population!='0'
order by Population  
limit 1;

-- 9 Using aggregate functions, return the number of countries the database contains.
select count(distinct name) from country;

-- 10 What are the top ten largest countries by area?
Select * from country 
Where SurfaceArea 
order by SurfaceArea DESC 
limit 10;

-- 11 List the five largest cities by population in Japan.
Select * from city
Where countrycode = "JPN"
order by Population DESC 
limit 5;


-- 12 List the names and country codes of every country with Elizabeth II as its Head of State. You will need to fix the mistake first!
Update Country
SET HeadOfState="Elizabeth II"
Where HeadOfState="Elisabeth II";
Select Name, Code FROM Country
WHERE HeadOfState = "Elizabeth II";

-- 13 List the top ten countries with the smallest population-to-area ratio. Discard any countries with a ratio of 0.
Select Name, (population/surfacearea) AS RATIO 
from country where (population/surfacearea) !=0 
order by ratio 
asc limit 10;

-- 14 List every unique world language.
SELECT 
    DISTINCT (language)
FROM 
   countrylanguage;

-- 15 List the names and GNP of the world's top 10 richest countries.
Select Name, GNP FROM country
Where GNP order by GNP Desc limit 10;

-- 16 List the names of, and number of languages spoken by, the top ten most multilingual countries.
select c.name, COUNT(cl.language)
from country c
JOIN countrylanguage cl ON c.code = cl.countrycode
group by c.name
order by COUNT(cl.language) desc
limit 10 ;

-- 17 List every country where over 50% of its population can speak German.
Select c.name, cl.percentage
From country c
JOIN countrylanguage cl on cl.CountryCode=c.code
WHERE Percentage >= 50;

-- 18 Which country has the worst life expectancy? Discard zero or null values.
Select LifeExpectancy, name from country 
Where LifeExpectancy is not null 
order by LifeExpectancy 
limit 1;

-- 19 List the top three most common government forms.
select governmentform, COUNT(governmentform)
from country
group by governmentform
order by COUNT(name) desc
limit 3 ;

-- 20 How many countries have gained independence since records began?
select count(*) from country where Indepyear is not null;