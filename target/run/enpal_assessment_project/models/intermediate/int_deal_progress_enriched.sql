
  
    

  create  table "postgres"."public_pipedrive_analytics"."int_deal_progress_enriched__dbt_tmp"
  
  
    as
  
  (
    

with deals AS
(
select 
deal_id,
deal_updated_ts,
deal_tracked_key,
deal_value_updated :: int as deal_value_updated
from 
"postgres"."public_pipedrive_analytics"."stg_deal_changes" where deal_tracked_key='stage_id'
),

stages AS
(
select
stage_id :: int as stage_id,
stage_name
from "postgres"."public_pipedrive_analytics"."stg_stages"
),
de_duplicate_deals AS
(
select 
d.deal_id,
s.stage_id,
s.stage_name,
d.deal_updated_ts,
ROW_NUMBER() over(PARTITION by d.deal_id,s.stage_id,d.deal_updated_ts order by d.deal_updated_ts desc) row_rank

from 
deals d
LEFT JOIN stages s ON d.deal_value_updated=s.stage_id
)
select 
deal_id,
stage_id,
stage_name,
deal_updated_ts
from 
de_duplicate_deals
where row_rank=1
  );
  