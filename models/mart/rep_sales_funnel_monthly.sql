with dim_user_activity as
(
SELECT
activity_type,
activity_name,
deal_id,
user_name
from {{ ref('int_activities_enriched')}}
),
dim_deal_progress as 
(
select
deal_id,
stage_id,
stage_name,
date_trunc('month', deal_updated_ts) as month_start
from {{ref('int_deal_stages_enriched')}}
),
base_stage AS
(
    SELECT
    month_start,
    stage_id:: text as funnel_step,
    stage_name as kpi_name,
    deal_id
    FROM dim_deal_progress
),
sub_stages AS (
    -- Step 2.1: Sales Call 1
    SELECT
        d.month_start,
        '2.1' AS funnel_step,
        'SALES CALL 1' AS kpi_name,
        d.deal_id
    FROM dim_deal_progress d
    WHERE d.stage_id = 2
      AND EXISTS (
          SELECT 1
          FROM dim_user_activity a
          WHERE a.deal_id = d.deal_id
            AND a.activity_type = 'meeting'
      )
    UNION ALL
    -- Step 3.1: Sales Call 2
    SELECT
        d.month_start,
        '3.1' AS funnel_step,
        'SALES CALL 2' AS kpi_name,
        d.deal_id
    FROM dim_deal_progress d
    WHERE d.stage_id = 3
      AND EXISTS (
          SELECT 1
          FROM dim_user_activity a
          WHERE a.deal_id = d.deal_id
            AND a.activity_type = 'sc_2'
      )
),
final_monthly_report as
(
SELECT * FROM base_stage
UNION ALL
SELECT * FROM sub_stages
)

SELECT 
TO_CHAR(DATE_TRUNC('month', month_start), 'MM-YYYY') as month,
funnel_step,
kpi_name,
COUNT(DISTINCT deal_id) as deal_count
from
final_monthly_report
group by MONTH,funnel_step,kpi_name
ORDER BY month,CAST(funnel_step AS DOUBLE PRECISION)