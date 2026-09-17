--so a second run works
--name the rule
--name a fisrt query 
-- keep all three columns
--number 1,2 in each group 
--same name =same ground 
--a city comes first 
--the the lowest id
--the source table 
--now read from ranked keep copy1,drop the rest

drop view if exists v_venues_clean;
create view v_venues_clean as 
with ranked as (
    select venue_id ,venue,city,
          row_number()over(
            partition by venue 
            order by case when city is null or trim(city)=''
                          then 1 else 0 end,
                    venue_id) as rn
from venues)
select venue_id,venue,city
from ranked where rn=1;
