
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select activity_type
from "postgres"."public_pipedrive_analytics"."int_activities_enriched"
where activity_type is null



  
  
      
    ) dbt_internal_test