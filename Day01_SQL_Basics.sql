/*
Day 01 SQL Practice
Topics:
SELECT
WHERE
DISTINCT
LIKE
BETWEEN
IN
ORDER BY
LIMIT
OFFSET
*/


-- Select all movies
SELECT *
FROM movies;


-- Select required columns
SELECT title, rating
FROM movies;


-- Filter movies with rating greater than 8
SELECT *
FROM movies
WHERE rating > 8;


-- Get unique genres
SELECT DISTINCT genre
FROM movies;


-- Movies containing love in title
SELECT *
FROM movies
WHERE title LIKE '%love%';


-- Movies released between years
SELECT *
FROM movies
WHERE release_year BETWEEN 2015 AND 2020;


-- Movies from selected languages
SELECT *
FROM movies
WHERE language IN ('English','Telugu');


-- Sort movies by rating
SELECT *
FROM movies
ORDER BY rating DESC;


-- Get top 10 movies
SELECT *
FROM movies
LIMIT 10;


-- Pagination example
SELECT *
FROM movies
LIMIT 10 OFFSET 20;