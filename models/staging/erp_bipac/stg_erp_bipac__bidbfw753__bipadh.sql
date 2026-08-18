with source as (

    select * from {{ source('erp_bipac_bidbfw753', 'bipadh') }}

),

filtered as (

    select
        *,
        'BIDBFW753' as source_schema
    from source
    where "_fivetran_deleted" is distinct from true

)

select * from filtered
