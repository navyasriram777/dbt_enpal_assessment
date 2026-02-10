
  create view "postgres"."public_pipedrive_analytics"."stg_fileds__dbt_tmp"
    
    
  as (
    -- Staging model for the fields table


with fields_cte as (
    select *
    from "postgres"."public"."fields"
)

select
    id,
    field_key,
    name as field_name,
    field_value_options
from fields_cte
  );