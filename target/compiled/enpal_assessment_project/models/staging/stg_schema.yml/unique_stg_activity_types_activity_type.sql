
    
    

select
    activity_type as unique_field,
    count(*) as n_records

from "postgres"."public_pipedrive_analytics"."stg_activity_types"
where activity_type is not null
group by activity_type
having count(*) > 1


