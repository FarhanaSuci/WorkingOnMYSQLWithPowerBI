SELECT * FROM moviesdb.movies;

-- Bridge table
-- I want to see all the movies , their title , their rating
-- and the associated actor information.

use moviesdb;
select * from movies;


select m.movie_id,title,imdb_rating,a.actor_id,a.name,a.birth_year
from movies as m
left join movie_actor as ma on m.movie_id=ma.movie_id
join actors as a on a.actor_id = ma.actor_id;

-- usecase of group_concat
-- Remove Redundancy by concat operation
-- List of all actors name per movie name
select m.movie_id,title,
group_concat(a.name separator ", ") as Actors
from movies as m
left join movie_actor as ma on m.movie_id=ma.movie_id -- Here movie actor is a bridge table
join actors as a on a.actor_id = ma.actor_id
group by m.movie_id;


-- Find all movies for a actor

-- Sub queries

-- What is the highest imdb rating movie?
select movie_id,title,imdb_rating from movies
order by imdb_rating desc
limit 1;

-- We cannot use aggregate function without group by clause

select max(imdb_rating) from movies;

select movie_id,title,imdb_rating from movies
where imdb_rating = (select max(imdb_rating) from movies); -- outer Query(inner Query)

-- What is the lowest imdb rating movie?

select movie_id,title,imdb_rating from movies
where imdb_rating = (select min(imdb_rating) from movies) ;

-- I want to see the movies with highest imdb rating and lowest imdb rating
select movie_id,title,imdb_rating from movies
where imdb_rating = (select max(imdb_rating) from movies)

union 

select movie_id,title,imdb_rating from movies
where imdb_rating = (select min(imdb_rating) from movies) ;

-- I want to see all the actors who are aged between 70 and 85
select * ,(year(curdate())-birth_year) as Age from actors
having age between 70 and 85; -- where always search from table.So, here we use having

select * from (select * ,(year(curdate())-birth_year) as Age 
from actors) as ActorWithAge
where age between 70 and 85;

select * from (select * ,(year(curdate())-birth_year) as Age 
from actors) as ActorWithAge;



