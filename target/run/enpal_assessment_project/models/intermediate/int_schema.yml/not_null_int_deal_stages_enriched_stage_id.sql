
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select stage_id
from "postgres"."public_pipedrive_analytics"."int_deal_stages_enriched"
where stage_id is null



  
  
      
    ) dbt_internal_test