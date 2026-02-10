
    
    

select
    month as unique_field,
    count(*) as n_records

from "postgres"."public_pipedrive_analytics"."rep_sales_funnel_monthly"
where month is not null
group by month
having count(*) > 1


