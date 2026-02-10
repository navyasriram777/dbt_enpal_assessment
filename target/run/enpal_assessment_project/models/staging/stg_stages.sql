
  create view "postgres"."public_pipedrive_analytics"."stg_stages__dbt_tmp"
    
    
  as (
    -- Staging model for the stages table



with stages_cte as (
    select *
    from "postgres"."public"."stages"
)

select
stage_id,
stage_name
from stages_cte
  );