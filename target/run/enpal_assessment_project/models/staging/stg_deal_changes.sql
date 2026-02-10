
  create view "postgres"."public_pipedrive_analytics"."stg_deal_changes__dbt_tmp"
    
    
  as (
    -- Staging model for the deal_changes table



with deal_changes_cte as (
    select *
    from "postgres"."public"."deal_changes"
)

select
    deal_id::int as deal_id,
    change_time::timestamp as deal_updated_ts,
    changed_field_key as deal_tracked_key,
    new_value as deal_value_updated
from deal_changes
  );