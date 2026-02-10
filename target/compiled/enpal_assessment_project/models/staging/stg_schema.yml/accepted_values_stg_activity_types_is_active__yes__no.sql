
    
    

with all_values as (

    select
        is_active as value_field,
        count(*) as n_records

    from "postgres"."public_pipedrive_analytics"."stg_activity_types"
    group by is_active

)

select *
from all_values
where value_field not in (
    'yes','no'
)


