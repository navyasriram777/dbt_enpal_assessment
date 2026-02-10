
    
    

with all_values as (

    select
        active as value_field,
        count(*) as n_records

    from "postgres"."public_pipedrive_analytics"."stg_activity_types"
    group by active

)

select *
from all_values
where value_field not in (
    'yes','no'
)


