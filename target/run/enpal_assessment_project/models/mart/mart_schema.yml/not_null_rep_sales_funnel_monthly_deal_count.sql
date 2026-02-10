
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select deal_count
from "postgres"."public_pipedrive_analytics"."rep_sales_funnel_monthly"
where deal_count is null



  
  
      
    ) dbt_internal_test