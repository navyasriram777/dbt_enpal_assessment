





with validation_errors as (

    select
        deal_id, stage_id, deal_updated_ts
    from "postgres"."public_pipedrive_analytics"."int_deal_stages_enriched"
    group by deal_id, stage_id, deal_updated_ts
    having count(*) > 1

)

select *
from validation_errors


