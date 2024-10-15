

-- CTE = Common table expression

-- I need to find out about the actors whose age is between 70 and 85

select actor_id, name
from actors
where (Year(curdate()) - birth_year) between 70 and 85;




with actor_ages as 
(

		select actor_id, name, Year(curdate()) - birth_year as Age
        from actors

),

final as 
(
select name 
from actor_ages
where Age between 70 and 85
)

select * from final
limit 1

; 




-- We want to identify all the movies with over 500% profit

-- revenue - budget = profit

-- (revenue - budget / budget) *100 == profit_percentage



with cte1 as 

(
		select movie_id, 
			((revenue - budget)/budget) * 100 as profit_pct
            from financials
),

cte2 as 

(
			select * from movies
),


cte3 as (

   select a.movie_id, b.title, a.profit_pct from cte1 as a
   join cte2 as b on a.movie_id = b.movie_id
   where 	a.profit_pct > 500

)

select * from cte3
;




-- We need to identify those movies who have lower than the average rating of all 
-- movies but they generated over 500% profit.

-- tader exact rating is less than average rating
-- tara generate korse more than 500% profit





with belowavgmovies as 

(
		select movie_id
        from movies 
        where imdb_rating < (select avg(imdb_rating) from movies)

)

select * from belowavgmovies;





with cte1 as 

(
		select movie_id, 
			((revenue - budget)/budget) * 100 as profit_pct
            from financials
),

belowavgmovies as 

(
		select movie_id, imdb_rating
        from movies 
        where imdb_rating < (select avg(imdb_rating) from movies)

),

cte2 as (

   select a.movie_id, b.title, c.imdb_rating, a.profit_pct
   from cte1 as a
   join movies as b on a.movie_id = b.movie_id
   join belowavgmovies as c on a.movie_id = c.movie_id
   where profit_pct > 500

)

select * from cte2;





-- we need to find out all the movies with more than average rating and financial information


with cte1 as

(select * from movies
	where imdb_rating > (select avg(imdb_rating) from movies))
,

cte2 as (
	
    select a.movie_id, a.title, a.imdb_rating, a.industry, b.budget, b.revenue,
			b.currency, b.unit	 from cte1 as a
    join financials as b on a.movie_id = b.movie_id

)
select * from cte2;




CREATE VIEW high_rated_movies_with_financials AS
WITH cte1 AS (
    SELECT *
    FROM movies
    WHERE imdb_rating > (SELECT AVG(imdb_rating) FROM movies)
),
cte2 AS (
    SELECT a.movie_id, a.title, a.imdb_rating, a.industry,
           b.budget, b.revenue, b.currency, b.unit
    FROM cte1 AS a
    JOIN financials AS b ON a.movie_id = b.movie_id
)
SELECT * FROM cte2;







