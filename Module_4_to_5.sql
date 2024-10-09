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
left join movie_actor as ma on m.movie_id=ma.movie_id
join actors as a on a.actor_id = ma.actor_id
group by m.movie_id;


-- Find all movies for a actor

-- Sub queries

