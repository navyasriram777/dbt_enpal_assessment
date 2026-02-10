-- Staging model for the fields table
{{ config(materialized='view') }}

with fields_cte as (
    select *
    from {{ source('raw', 'fields') }}
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
    WHEN {{ is_valid_json('field_value_options') }} THEN field_value_options :: jsonb
    ELSE '[]' :: jsonb
    END 
) as json_pair
ON TRUE