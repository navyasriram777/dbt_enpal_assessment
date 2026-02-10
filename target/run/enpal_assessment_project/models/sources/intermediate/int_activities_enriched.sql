
  
    

  create  table "postgres"."public_pipedrive_analytics"."int_activities_enriched__dbt_tmp"
  
  
    as
  
  (
    

with activities as (

    select
        activity_id,
        lower(nullif(trim(cast(activity_type as varchar)), '')) as activity_type,
        user_id,
        deal_id,
        done,
        due_to
    from "postgres"."public_pipedrive_analytics"."stg_activity"

),

activity_types as (

    select
        lower(nullif(trim(cast(activity_type as varchar)), '')) as activity_type,
        activity_name,
        active
    from "postgres"."public_pipedrive_analytics"."stg_activity_types"

),

users as (

    select
        user_id,
        user_name,
        user_email,
        modified_ts
    from "postgres"."public_pipedrive_analytics"."stg_users"

)

select 
    a.activity_id,
    a.activity_type,
    t.activity_name,
    t.active as activity_type_active,

    a.user_id,
    u.user_name,
    u.user_email,

    a.deal_id,
    case 
    when a.done = true then 1
    else 0
    END AS is_completed,
    a.due_to,
    u.modified_ts

from activities a

left join activity_types t 
    on a.activity_type = t.activity_type 

left join users u 
    on a.user_id = u.user_id
  );
  