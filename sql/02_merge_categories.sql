--deliveries_bowlers_type
--team.team_name
--contains fix 4,5

--right arm fast medium fast and Rising Pune Supergait are 
--merging in this fix




drop view if exists v_deliveries_typed;
create view v_deliveries_typed as
select*,
       case when bowler_type_clean =
                 'Right arm Fast Medium'
            then 'Right arm Fast medium'
            else bowler_type_clean
        end as bowler_style
from v_deliveries_clean;

drop view if exists v_teams_clean;
create view v_teams_clean as
select*,
       case when team_name = 'Rising Pune Supergiants'
            then 'Rising Pune Supergiant'
            else team_name
        end as team_name_clean
from teams;