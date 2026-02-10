
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select type
from "postgres"."public"."activity_types"
where type is null



  
  
      
    ) dbt_internal_test