
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select deal_updated_ts
from "postgres"."public_pipedrive_analytics"."int_deal_stages_enriched"
where deal_updated_ts is null



  
  
      
    ) dbt_internal_test