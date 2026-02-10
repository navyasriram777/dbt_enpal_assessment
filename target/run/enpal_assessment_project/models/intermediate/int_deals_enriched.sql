
  
    

  create  table "postgres"."public_pipedrive_analytics"."int_deals_enriched__dbt_tmp"
  
  
    as
  
  (
    

with deals AS
(
select 
deal_id,
deal_updated_ts,
deal_tracked_key,
deal_details_updated
From 
"postgres"."public_pipedrive_analytics"."stg_deal_changes"
),

field_types AS
(
select
field_id,
field_key,
field_name,
field_value_options,
field_stage_id,
field_stage_description
from "postgres"."public_pipedrive_analytics"."stg_fields"
)

select
d.deal_id,
d.deal_tracked_key as deal_tracked_key,
ft.field_name as field_name,
ft.field_stage_id as field_stage_id,
ft.field_stage_description as field_stage_description,
ft.deal_details_updated as deal_details_updated,
d.new_value as deal_details_updated,
d.deal_updated_ts as deal_updated_ts
From 
deals d 
LEFT JOIN field_types ft ON d.deal_tracked_key=ft.field_key order by d.deal_tracked_key
  );
  