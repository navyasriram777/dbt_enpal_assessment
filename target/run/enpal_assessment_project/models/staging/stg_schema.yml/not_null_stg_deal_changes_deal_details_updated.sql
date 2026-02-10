
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select deal_details_updated
from "postgres"."public_pipedrive_analytics"."stg_deal_changes"
where deal_details_updated is null



  
  
      
    ) dbt_internal_test