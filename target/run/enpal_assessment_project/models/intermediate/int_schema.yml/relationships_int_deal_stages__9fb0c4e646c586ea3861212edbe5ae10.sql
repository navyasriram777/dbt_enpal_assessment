
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with child as (
    select stage_id as from_field
    from "postgres"."public_pipedrive_analytics"."int_deal_stages_enriched"
    where stage_id is not null
),

parent as (
    select stage_id as to_field
    from "postgres"."public_pipedrive_analytics"."stg_stages"
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null



  
  
      
    ) dbt_internal_test