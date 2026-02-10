
  
    

  create  table "postgres"."public_pipedrive_analytics"."raw_activity_types__dbt_tmp"
  
  
    as
  
  (
    
insert into public.activity_types
AS
select * from read_csv('raw_data/activity_types.csv')
  );
  