-- IN operator
use moviesdb;
select * from movies;
select * from movies
where movie_id in(101,105,109,113);

-- Any operator
-- I want to see the actor information without any join who
-- worked on above 4 movies
select * from actors
where actor_id = any(select actor_id from movie_actor
where movie_id in(101,105,109,113));

select actor_id from movie_actor
where movie_id in(101,105,109,113);

select * from movies;

select title,imdb_rating from movies
where studio = 'Marvel Studios';

-- Show all the movies whose rating is greater than Marvel Studios
select * from movies
where imdb_rating > any (select imdb_rating from movies
where studio = 'Marvel Studios');

select * from movies
where imdb_rating > all(select imdb_rating from movies
where studio = 'Marvel Studios');

EXPLAIN ANALYZE
select *
from (select *, (year(curdate())-birth_year) as Age
from actors) as ActorswithAge
where age between 70 and 85;

EXPLAIN ANALYZE
select *
, (year(curdate())-birth_year) as Age
from actors 
having age between 70 and 85;