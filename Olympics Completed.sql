
use olympics;

create table if not exists olympics1
(
ID int,
Name varchar(300),
Sex char(5),
Age int,
Height int,
Weight int,
Team varchar(500),
NOC	varchar(500),
Games varchar(500),
Year int,
Season varchar(500),
City varchar(500),
Sport varchar(500),
Event varchar(500),
Medal varchar(300)
);

load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Athletes.csv' 
into table olympics1
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 rows;



select * from olympics1;

-- SQL PROJECT

-- 1. Show how many medal counts present for entire data
select Medal,count(Medal)as total_medal_count from olympics1 group by Medal order by total_medal_count asc;

-- 1a. Show how many gold medals  
select medal, count(Medal) from olympics1 where Medal='Gold';

-- 1a. Show how many Silver medals  
select count(Medal) from olympics1 where Medal='Silver';

-- 1a. Show how many Bronze medals  
select count(Medal) from olympics1 where Medal='Bronze';


-- 2. Show count of unique sports present in Olympics
select count(distinct(sport)) from olympics1;

-- Name of all the unique sports

select distinct(sport)from olympics1;

-- 3. Show how many different medals won by team India

select team,medal,count(Medal) as total_medal
from olympics1
where team='india'
and medal<>'nomedal'
group by team,medal
order by total_medal asc;

-- 4. Show event wise medals won by India show from highest to lowest medals won in order
select * from olympics1;

select team,event, medal , count(*) as total_medals
from olympics1
where Team='India'
and medal<>'nomedal'
group by team,event,medal
order by total_medals desc;


-- 5. Show event wise medals won by India in order of year

select year,event, medal , count(*) as total_medals
from olympics1
where Team='India'
and medal<>'nomedal'
group by event,year,medal
order by year desc;

-- 6. show 10 country who won maximum medals.

select team, count(medal) as max_medals
from olympics1
where medal<>'nomedal'
group by Team
order by max_medals desc
limit 10;


-- 7.show top 10 countries whowon gold

select noc, count(medal) as gold_won_country
from olympics1
where Medal="Gold"
group by noc
order by gold_won_country desc
limit 10;


--  8. show in which year did United states won most gold medal
select team,year,count(medal) as most_gold_medal
from olympics
where medal='gold' and team='united states'
group by team,year
order by most_gold_medal desc
limit 1;

-- 9. In which sports United States has most medals.
select sport, count(*) as max_medal_sport
from olympics1
where (Team='United States') & (Medal = 'Gold' or Medal = 'Silver' or Medal = 'Bronze')
group by sport
order by  max_medal_sport desc
limit 10;


-- 10. Find top three players who won most medals along with their sports and country

select * from olympics1;

select name,team,sport, count(medal) as top_3
from olympics1
where Medal = 'Gold' or Medal = 'Silver' or Medal = 'Bronze'
group by name
order by top_3 desc
limit 3;



-- 11. Find player with most gold medals in cycling along with his country.
select name, noc ,count(medal) as Gold_cyclist
from olympics1
where Medal='Gold' & sport='cycling'
group by name,sport,noc
order by Gold_cyclist desc
limit 1;
 
 # no one got gold medal in cycling

-- 12.Find player with most medals (Gold+Silver+Bronze) in Basketball also show his country.
select name,Team, count(medal) as gsb_basketball
from olympics1
where  Medal <>'nomedal' and sport = "Basketball"
group by name
order by gsb_basketball desc
limit 1;


-- 13. Find out the count of different medals of the top basketball player Teresa Edwards
select medal, count(*) as teresa_medals
from olympics1
where (name='Teresa Edwards') & (Medal = 'Gold' or Medal = 'Silver' or Medal = 'Bronze') & (sport = 'Basketball')
group by medal;


-- 14. Find out medals won by male,female each year , Export this data and plot graph in excel
select * from olympics1;
select sex, year,medal ,count(*) as medal_with_years
from olympics1
where Medal = 'Gold' or Medal = 'Silver' or Medal = 'Bronze'
group by year
order by medal_with_years desc;

-- 15. show in which year did United states won most gold medal

select team, year , count(medal) as year_most_gold 
from olympics1
where medal='gold' and team='united states'
group by Team,year
order by year_most_gold desc
limit 1;

-- No. of countries participating in the Olympics over the years
select noc,count(noc), year as Participation_over_Year
from olympics1
group by noc,year
order by year,Participation_over_Year asc;

-- No. of athletes participating over the years.
select distinct(count(name)), year,name from olympics1
group by name,year
order by year desc;

-- In which years were the Olympic Games organized?
select distinct(year) from olympics1
order by year asc;

-- What is the overall medal tally by team?


 

-- How many Olympic games had been organized till date(2016)?
select count(distinct(year)) as olympic_till_date from olympics1
order by year asc;

--  In which cities the Olympic games had been organized?
select count(distinct(city)) from olympics1;

-- How many sports are being played in the Olympics?
select count(distinct(sport)) from olympics1;

--  How many athletes participated in the Olympics?
select count(distinct(name)) from olympics1;

select max(year) from olympics1;

-- 
SELECT COUNT(*) AS num_rows FROM olympics1;

SELECT COUNT(*) AS num_columns 
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'olympics' 
  AND TABLE_NAME = 'Athletes';
  
  show tables;

