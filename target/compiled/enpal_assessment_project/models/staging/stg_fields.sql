-- Staging model for the fields table


with fields_cte as (
    select *
    from "postgres"."public"."fields"
)

select
    id as field_id,
    field_key,
    name as field_name,
    field_value_options,
    (json_pair->> 'id') :: int as field_stage_id,
    (json_pair->> 'label') :: varchar as field_stage_description
from fields_cte
LEFT JOIN LATERAL 
jsonb_array_elements(
    CASE 
    WHEN 
field_value_options is not null and field_value_options :: jsonb is not null
 THEN field_value_options :: jsonb
    ELSE '[]' :: jsonb
    END 
) as json_pair
ON TRUE