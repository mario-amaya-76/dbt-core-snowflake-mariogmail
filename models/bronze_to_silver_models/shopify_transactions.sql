{{
    config(
        materialized='table'
    )
}}

with shopify_orders as (
    select
    *
    from
    {{ source('SHOPIFY','ORDER') }}
)

, shopify_customers as (
    select
    *
    from
    {{ source('SHOPIFY','CUSTOMER') }}
)

select 
c.* 
from shopify_orders o
left join shopify_customers c
    on o.customer_id = c.id
where o.customer_id is not null