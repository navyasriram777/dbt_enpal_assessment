
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    user_email as unique_field,
    count(*) as n_records

from "postgres"."public_pipedrive_analytics"."stg_users"
where user_email is not null
group by user_email
having count(*) > 1



  
  
      
    ) dbt_internal_test