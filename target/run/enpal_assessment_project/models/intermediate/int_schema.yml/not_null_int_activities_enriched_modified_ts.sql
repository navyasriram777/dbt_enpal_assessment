
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select modified_ts
from "postgres"."public_pipedrive_analytics"."int_activities_enriched"
where modified_ts is null



  
  
      
    ) dbt_internal_test