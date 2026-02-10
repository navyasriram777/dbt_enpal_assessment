
    
    

select
    activity_id as unique_field,
    count(*) as n_records

from "postgres"."public_pipedrive_analytics"."stg_activity_types"
where activity_id is not null
group by activity_id
having count(*) > 1


