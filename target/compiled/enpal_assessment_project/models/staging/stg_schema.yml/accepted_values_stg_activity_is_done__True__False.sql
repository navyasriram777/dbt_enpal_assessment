
    
    

with all_values as (

    select
        is_done as value_field,
        count(*) as n_records

    from "postgres"."public_pipedrive_analytics"."stg_activity"
    group by is_done

)

select *
from all_values
where value_field not in (
    'True','False'
)


