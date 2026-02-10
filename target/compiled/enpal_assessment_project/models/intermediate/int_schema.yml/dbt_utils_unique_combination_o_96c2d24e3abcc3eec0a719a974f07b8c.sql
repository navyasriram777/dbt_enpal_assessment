





with validation_errors as (

    select
        deal_id, stage_id, stage_name
    from "postgres"."public_pipedrive_analytics"."int_deal_stages_enriched"
    group by deal_id, stage_id, stage_name
    having count(*) > 1

)

select *
from validation_errors


