
  create view "postgres"."public_pipedrive_analytics"."stg_users__dbt_tmp"
    
    
  as (
    -- Staging model for the users table



with users_cte as (
    select  *,
    ROW_NUMBER() OVER (PARTITION by email,name order by modified desc) as rank_val

    from "postgres"."public"."users"
)

select
id as user_id,
name as user_name,
email as user_email,
modified::timestamp as modified_ts
from users_cte where rank_val=1
  );