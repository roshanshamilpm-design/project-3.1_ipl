--so a second run works
--name the rule
--keep every column
--rule 2: the full stop
--tidy the edges 
--rule 1: cut the name 
--is there a comma ?
--yes : stop before it 
--no: take it all 
--close case and substr
--read the raw table
drop view if exists v_matches_venue;
create view v_matches_venue as
select *,
      replace(
        trim(
            substr(venue,1,
            case when instr(venue,',')>0
                 then instr(venue,',')-1
                 else length(venue)
            end)
        ),
        'M.Chinnaswamy','M Chinnaswamy'
      ) as venue_clean
from matches;
            