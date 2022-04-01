Use Movielens;

-- 1 List the titles and release dates of movies released between 1983-1993 in reverse chronological order.
select title as "movie title", release_date
from movies
WHERE release_date between "1983-01-01" and "1993-01-12"
order by release_date desc;

-- 2 Without using LIMIT, list the titles of the movies with the lowest average rating.
SELECT title as "movie title", AVG(rating) AS average_rating
FROM movies
JOIN ratings ON movies.id = ratings.movie_id
GROUP BY movies.title
HAVING average_rating = (
	SELECT MIN(avg_rating)
	FROM (
		SELECT AVG(rating) 
		AS avg_rating 
		FROM ratings 
        GROUP BY movie_id) 
    AS table1
);

-- 3 List the unique records for Sci-Fi movies where male 24-year-old students have given 5-star ratings.
SELECT u.id as "user id", g.name, u.age, u.gender, r.rating, o.name, m.title as "movie title"
FROM genres_movies gm
JOIN movies m ON gm.movie_id = m.id
JOIN genres g ON gm.genre_id = g.id
JOIN ratings r ON m.id = r.movie_id
JOIN users  u ON r.user_id = u.id
join occupations o on o.id = u.occupation_id
WHERE r.rating = 5 AND u.gender = 'M' AND g.name = 'Sci-Fi' AND u.age = 24 AND o.name = "student"
order by u.id;

-- 4 List the unique titles of each of the movies released on the most popular release day. 
SELECT title as "movie title", release_date 
from movies 
WHERE release_date = (
	SELECT release_date 
	FROM movies
	GROUP BY release_date 
    ORDER BY COUNT(id) 
    DESC LIMIT 1);
    
-- 5 Find the total number of movies in each genre; list the results in ascending numeric order.
select count(m.title) as "Total films in genre", g.name
from movies m
join genres_movies gm ON m.id = gm.movie_id
join  genres g ON g.id = gm.genre_id
group by g.name
order by count(m.title) asc;






