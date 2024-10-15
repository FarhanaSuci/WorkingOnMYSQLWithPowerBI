-- CTE (Common Table Expression) Bascally we create virtual table.and then apply query
-- We use it as an alternative of subqueries
-- I need to find out the actors whose age is between 70 and 85
use moviesdb;
select actor_id,name
from actors
where (Year(curdate())-birth_year) between 70 and 85;

with  actor_ages as 
(
    select actor_id,name,(Year(curdate()) - birth_year) as Age
    from actors
)
select * from actor_ages
where Age between 70 and 85;

with  actor_ages as 
(
    select actor_id,name,(Year(curdate()) - birth_year) as Age
    from actors
),
final as
(
select * from actor_ages
where Age between 70 and 85

)
select * from final;

with  actor_ages as 
(
    select actor_id,name,(Year(curdate()) - birth_year) as Age
    from actors
),
final as
(
select * from actor_ages
where Age between 70 and 85

)
select * from final
limit 1;

-- We want to identify all the movies with over 500% profit
-- Revenue - Budget = profit
-- (Revenue - Budget / Budget ) *100 == profit_percentage
with cte1 as
(
   select movie_id,
   ((revenue-budget)/budget) * 100 as profit_percentage
   from financials
),
cte2 as (
select a.movie_id,b.title,a.profit_percentage from cte1 as a
join movies as b
on a.movie_id = b.movie_id
where a.profit_percentage > 500
)
select * from cte2;

with cte1 as
(
   select movie_id,
   ((revenue-budget)/budget) * 100 as profit_percentage
   from financials
),
cte2 as (
select * from movies),
cte3 as (
select a.movie_id,b.title,a.profit_percentage from cte1 as a
join cte2 as b
on a.movie_id = b.movie_id
where a.profit_percentage > 500
)
select * from cte3;

-- We need to identify those movies who have lower than the average rating of all
-- movies but they generated over 500% profits

-- Exact rating is less than average rating
-- Generating more than 500% profit


with cte1 as
(
   select movie_id,
   ((revenue-budget)/budget) * 100 as profit_percentage
   from financials
),
cte2 as (
select a.movie_id,b.title,a.profit_percentage from cte1 as a
join movies as b
on a.movie_id = b.movie_id
where a.profit_percentage > 500
)
select * from cte2;
select avg(imdb_rating) from movies;

with belowAverageMovies as
(
  select  movie_id
  from  movies
  where imdb_rating < (select avg(imdb_rating) from movies)
)
select * from belowAverageMovies;

with belowAverageMovies as
(
  select  movie_id,imdb_rating
  from  movies
  where imdb_rating < (select avg(imdb_rating) from movies)
),
 cte1 as
(
   select movie_id,
   ((revenue-budget)/budget) * 100 as profit_percentage
   from financials
),
cte2 as (
select a.movie_id,b.title,c.imdb_rating,a.profit_percentage
from cte1 as a
join movies as b on a.movie_id = b.movie_id
join belowAverageMovies as c on a.movie_id = c.movie_id
where profit_percentage > 500
)
select * from cte2;


