
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select activity_name
from "postgres"."public_pipedrive_analytics"."int_activities_enriched"
where activity_name is null



  
  
      
    ) dbt_internal_test