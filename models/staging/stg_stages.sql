-- Staging model for the stages table
{{ config(materialized='view') }}


with stages_cte as (
    select *
    from {{ source('raw', 'stages') }}
)

select
stage_id,
stage_name
from stages_cte