-- Multiple table data retrieval
-- How to add a new column
-- Let's calculate age column on actor table
Use moviesdb;
SELECT * FROM moviesdb.actors;
select YEAR(curdate());
select *,year(curdate()) - birth_year as Age from actors;
select * from moviesdb.financials;

-- Standardizing Movie Revenue
-- We will now convert all the rows with INR currency to USD currency

select * from financials;

select movie_id,budget,
   case when currency = 'INR' then revenue/77 -- Use cse when to create new column
   when currency='USD' then revenue -- based on previous column
   end as REVENUE_USD,
   
   case 
   when unit = 'Thousands' then revenue/1000
   when unit= 'Billions' then revenue*1000
   else revenue
   end as revenue_millions
   
from financials;

-- select distinct unit from financials;

-- Inner Join-- Only Common rows will come from two tables
-- Left Join -- All the rows from left table and additionally
-- those rows from right table that got matched

-- Right Join -- All the rows from right table and additionally
-- those rows from left table that got matched

-- outer join : Combination of left table and right table without matching

-- left , right anti join : showing one table clippimg the matching row
-- Join operates when two table have at least one common column

-- Questions
-- I want to see all the movies information and their revenues
select * from movies;
select * from financials;
select movies.movie_id,title,imdb_rating,financials.revenue from movies 
join financials on financials.movie_id=movies.movie_id;

select m.movie_id,title,imdb_rating,f.revenue from movies as m
join financials as f on f.movie_id=m.movie_id;

select m.movie_id,title,imdb_rating,f.revenue from movies as m
left join financials as f on f.movie_id=m.movie_id;

select m.movie_id,title,imdb_rating,f.revenue from movies as m
right join financials as f on f.movie_id=m.movie_id;

-- Full join -- like Append in Power Query
-- Using UNION(Returning Unique rows) , UNION ALL : Showing Duplicate Row  which exist in both table
-- Two tables must have same numbers of columns with having same name

select m.movie_id,title,imdb_rating,f.revenue from movies as m
left join financials as f on f.movie_id=m.movie_id

UNION

select m.movie_id,title,imdb_rating,f.revenue from movies as m
right join financials as f on f.movie_id=m.movie_id;


select m.movie_id,title,imdb_rating,f.revenue from movies as m
left join financials as f on f.movie_id=m.movie_id

UNION All

select m.movie_id,title,imdb_rating,f.revenue from movies as m
right join financials as f on f.movie_id=m.movie_id;


-- Using () more intelligent function
select m.movie_id,title,imdb_rating,f.revenue from movies as m
join financials as f using(movie_id);

-- CROSS JOIN (Curtesian Multiplication) 
-- No need matching Column

use food_db;
select * from items;
select * from variants;
select name,price,variant_name,variant_price 
from items
cross join variants;

select name,price,variant_name,variant_price,
concat(name," ",variant_name)  as Dish_Name,
price + variant_price as Total_price
from items
cross join variants;

select 
concat(name," ",variant_name)  as Dish_Name,
price + variant_price as Total_price
from items
cross join variants;







 
 
 
 
 