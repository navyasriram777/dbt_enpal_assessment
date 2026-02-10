

with activities as (

    select
        activity_id,
        activity_type,
        user_id,
        deal_id,
        due_date,
        is_completed
    from "postgres"."public_pipedrive_analytics"."stg_activity" where is_completed=1

),

activity_types as (

    select
        activity_type,
        activity_name
    from "postgres"."public_pipedrive_analytics"."stg_activity_types" where is_active=1

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
a.deal_id,
a.is_completed,
u.user_id,
a.activity_type,
t.activity_name,
u.user_name,
u.user_email,
u.modified_ts,
a.due_date
from 
activities a

INNER JOIN activity_types t 
    on lower(trim(a.activity_type)) = lower(trim(t.activity_type))

INNER JOIN users u 
    on a.user_id = u.user_id