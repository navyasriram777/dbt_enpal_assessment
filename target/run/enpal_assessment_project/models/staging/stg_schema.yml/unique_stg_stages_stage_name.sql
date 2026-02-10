
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    stage_name as unique_field,
    count(*) as n_records

from "postgres"."public_pipedrive_analytics"."stg_stages"
where stage_name is not null
group by stage_name
having count(*) > 1



  
  
      
    ) dbt_internal_test