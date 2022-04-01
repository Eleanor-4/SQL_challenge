USE world;

-- 1 Using COUNT, get the number of cities in the USA.
SELECT countrycode, COUNT(DISTINCT `name`) as "number of cities"
FROM city 
WHERE countrycode = 'USA';
 
-- 2 Find out the population and life expectancy for people in Argentina.
Select name, Population, LifeExpectancy from country where Code = "ARG";


-- 3 Using IS NOT NULL, ORDER BY, and LIMIT, which country has the highest life expectancy?
Select name, LifeExpectancy from country 
Where LifeExpectancy is not null 
order by LifeExpectancy DESC 
limit 1;

-- 4 Using JOIN ... ON, find the capital city of Spain.
Select country.name as "Country", city.name as "Capital city"
FROM city 
JOIN country on city.CountryCode = Country.Code
Where ID = "653";

-- 5 Using JOIN ... ON, list all the languages spoken in the Southeast Asia region.
Select c.name as "County", Language, Percentage, Region
From countrylanguage cl
JOIN country c on c.code = cl.CountryCode
WHERE region = "Southeast Asia";

-- 6 Using a single query, list 25 cities around the world that start with the letter F.
SELECT Name as "Cities staring with 'F'" FROM city WHERE Name LIKE "F%" limit 25;


-- 7 Using COUNT and JOIN ... ON, get the number of cities in China.
Select count(*) as "Number of cities in China"
FROM city 
JOIN country on city.CountryCode = Country.Code
WHERE country.name ="china";

-- This should give same solution but doesn't, unsure why 

SELECT countrycode, COUNT(DISTINCT `name`) AS numberOfchnCities FROM city WHERE countrycode = 'CHN';

-- 8 Using IS NOT NULL, ORDER BY, and LIMIT, which country has the lowest population? Discard non-zero populations.
Select Name as "Country with lowest Pop", population from country 
Where Population is not null and Population!='0'
order by Population  
limit 1;

-- 9 Using aggregate functions, return the number of countries the database contains.
select count(distinct name) as "number of countries in database" from country;

-- 10 What are the top ten largest countries by area?
Select name as "Top ten largest countries by area" , surfacearea from country 
Where SurfaceArea 
order by SurfaceArea DESC 
limit 10;

-- 11 List the five largest cities by population in Japan.
Select name as "Top 5 largest Japanese cities by population", population from city
Where countrycode = "JPN"
order by Population DESC 
limit 5;


-- 12 List the names and country codes of every country with Elizabeth II as its Head of State. You will need to fix the mistake first!
Update Country
SET HeadOfState="Elizabeth II"
Where HeadOfState="Elisabeth II";
Select Name as "Coutries with Elizabeth II as Head of State" FROM Country
WHERE HeadOfState = "Elizabeth II";

-- 13 List the top ten countries with the smallest population-to-area ratio. Discard any countries with a ratio of 0.
Select Name as "Country", (population/surfacearea) AS "Population to area ratio"
from country where (population/surfacearea) !=0 
order by "Population to area ratio"
asc limit 10;

-- 14 List every unique world language.
SELECT DISTINCT (language) FROM countrylanguage;

-- 15 List the names and GNP of the world's top 10 richest countries.
Select Name as "Top 10 richest countries", GNP as "Gross national Profit"
FROM country
Where GNP order by GNP Desc limit 10;

-- 16 List the names of, and number of languages spoken by, the top ten most multilingual countries.
select c.name as "Country", COUNT(cl.language) as "Number of languages spoken"
from country c
JOIN countrylanguage cl ON c.code = cl.countrycode
group by c.name
order by COUNT(cl.language) desc
limit 10 ;

-- 17 List every country where over 50% of its population can speak German.
Select c.name as "Countries that speak German", cl.percentage as "Percentage of population"
From country c
JOIN countrylanguage cl on cl.CountryCode=c.code
WHERE Percentage >= 50;

-- 18 Which country has the worst life expectancy? Discard zero or null values.
Select name as "Country with lowest life expectancy", LifeExpectancy from country 
Where LifeExpectancy is not null 
order by LifeExpectancy 
limit 1;

-- 19 List the top three most common government forms.
select governmentform as "Top 3 governement forms", COUNT(governmentform) as "number of counties"
from country
group by governmentform
order by COUNT(name) desc
limit 3 ;

-- 20 How many countries have gained independence since records began?
select count(*) as "Number of countries that gained independence since records began" from country where Indepyear is not null;