-- Cleans raw activity data, standardizes column names and types


with activity_cte as (
    select *,
    row_number() 
    over(partition by activity_id order by due_to desc) rank_val
    from "postgres"."public"."activity"
)

select
    activity_id,
    lower(nullif(trim(type), '')) as activity_type,
    assigned_to_user as user_id,
    deal_id::int as deal_id,
    case 
    when done = true then 1
    when done = false then 0
    END AS is_completed,
    due_to::timestamp as due_date -- cast due_to to timestamp
from activity_cte
where rank_val=1