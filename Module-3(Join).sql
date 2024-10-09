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


 
 
 
 
 