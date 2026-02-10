
    
    

select
    id as unique_field,
    count(*) as n_records

from "postgres"."public"."activity_types"
where id is not null
group by id
having count(*) > 1


