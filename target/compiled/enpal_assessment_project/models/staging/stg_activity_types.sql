

with activity_types_cte as (
    select *
    from "postgres"."public"."activity_types"
)

select
    id as activity_id,
    name as activity_name,
    -- convert 'Yes'/'No'  to 1 for true and 0 for false
    case 
        when lower(trim(active)) = 'yes' then 1
        else 0
    end as is_active,
    lower(nullif(trim(type), '')) as activity_type
from activity_types_cte