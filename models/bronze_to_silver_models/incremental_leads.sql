{{
    config(
        materialized='incremental',
        unique_key='lead_id'
    )
}}

with new_leads as (

    select
    *
    from
    {{ source('salesforce','lead') }}

    {% if is_incremental() %}

    where created_date >= ( select max(created_date) from {{ this }} )

    {% endif %}

)

select
id as lead_id
, first_name
, last_name
, title
, company
, '2945 Parfet Drive, Lakewood, Colorado 80124' as address
, created_date
, lead_source
, status
, industry
-- , rating
, DATEADD(day, -(UNIFORM(1, 30, RANDOM())), current_date()) AS most_recent_website_visit
, DATEADD(day, -(UNIFORM(1, 365, RANDOM())), most_recent_website_visit) AS first_website_visit_date
, case
    when most_recent_website_visit >= dateadd(day, -30, current_date()) then uniform(0,15, random())
    else 0
    end as number_of_website_visits_last_30_days
, (select 
    substr(email, 1, position('.com' in email) + 3) 
    from {{ source('salesforce', 'user') }}
    order by random()
    limit 1) as assigned_rep
, case
    when day(first_website_visit_date) >= 0 then true
    else false
    end as has_purchase_history
, case
    when has_purchase_history = true then uniform(0,500000, random())
    else 0
    end as lifetime_value
from new_leads
where
not is_converted
and
not is_deleted