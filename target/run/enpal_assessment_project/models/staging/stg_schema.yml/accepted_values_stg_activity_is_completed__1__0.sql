
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with all_values as (

    select
        is_completed as value_field,
        count(*) as n_records

    from "postgres"."public_pipedrive_analytics"."stg_activity"
    group by is_completed

)

select *
from all_values
where value_field not in (
    '1','0'
)



  
  
      
    ) dbt_internal_test