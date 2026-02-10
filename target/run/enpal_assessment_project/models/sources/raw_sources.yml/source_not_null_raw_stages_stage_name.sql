
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select stage_name
from "postgres"."public"."stages"
where stage_name is null



  
  
      
    ) dbt_internal_test