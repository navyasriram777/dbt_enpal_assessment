
    
    

with all_values as (

    select
        done as value_field,
        count(*) as n_records

    from "postgres"."public_pipedrive_analytics"."stg_activity"
    group by done

)

select *
from all_values
where value_field not in (
    'True','False'
)


