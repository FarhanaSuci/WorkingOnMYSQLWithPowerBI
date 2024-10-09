use moviesdb;
select * from actors;
select name, birth_year from actors;

-- SQL is caseInsensivitive
/**select name,
 birth_year from actors;**/
 
 
 describe actors;
 describe movies;
 select * from movies;
 
 
 -- I want to see only the bollywood movies --
 
 
 select * from movies where industry = "Bollywood";
 
 -- I want to see all the hollywood movies that are rated above 8 --
 
 
 select * from movies where industry = "Hollywood" and imdb_rating>8;
 
 -- I want to see all the movies where either itis a hollywood movie or more --
 -- than 8 rated movie--
 
 select * from movies where industry = "Hollywood" or imdb_rating>8;
 
 -- Sorting --
 select * from movies
 where industry = "Hollywood" and imdb_rating>8
 order by imdb_rating;
 
 -- Decending order --
 select * from movies
 where industry = "Hollywood" and imdb_rating>8
 order by imdb_rating DESC;
  
  -- top 5 --
  select * from movies
  limit 5;
  
  -- bottom 5 --
  select * from movies
  order by movie_id DESC
  limit 5;
 -- Aggregation function ---
 -- sum,avg,count,min,max--
 select count(*) from movies; -- Row count of a table
 
 -- How many Hollywood movies are there in the table
 
 select count(*) from movies
 where industry = "Hollywood";
 
 -- I want to see the average rating for the year 2022?
 select avg (imdb_rating) as Average_Rating from movies
 where release_year=2022;
 
 select movie_id,title as movie_name , imdb_rating as rating 
 from movies; -- Renaming
 
 -- I want to see the average imdb_rating for each industry avialable in our data
 -- for the year 2022
 
 
 select * from movies;
 
 select Industry,round(avg(imdb_rating),1) as average_rating from movies
 where release_year =2022
 group by industry;
 
 -- Group by for Category or segmentation
 -- Group by always after the aggregation function
 
  -- I want to see the average imdb_rating for each industry avialable in our data
 -- for the year 2019 to 2023
 
 
  
 SELECT 
    Industry, ROUND(AVG(imdb_rating), 1) AS average_rating
FROM
    movies
WHERE
    release_year >= 2019
        AND release_year <= 2023
GROUP BY industry;

-- I want to see the yearly breakdown of average rating.
 -- please consider the following years,2019 to 2023
 
  SELECT 
    release_year, ROUND(AVG(imdb_rating), 1) AS average_rating
FROM
    movies
WHERE
    release_year >= 2019
        AND release_year <= 2023
GROUP BY release_year
order by release_year;


SELECT release_year, ROUND(AVG(imdb_rating), 1) AS average_rating
FROM movies
WHERE release_year between 2019 AND 2023
GROUP BY release_year
order by release_year;

-- handling missing values --
select * from movies;

select * from movies
where imdb_rating is null;

select * from movies
where imdb_rating is not null;

select * from movies
where studio is null;

select * from movies
where studio ="";

-- I want to see all the movies without null and blank values
select * from movies
where imdb_rating is not null and studio<>"";

-- offset is basically used for row skipping .
select * from movies
limit 5 
offset 1;-- Skipping first row .showing 5 rows from the next rows

select * from movies
limit 5 
offset 5;-- Skipping first five rows .showing 5 rows from the next rows

-- I want to see the 2nd high rated movie name in my table.
select title,imdb_rating from movies
order by imdb_rating desc
limit 1
offset 1;


 
 
 
 
 