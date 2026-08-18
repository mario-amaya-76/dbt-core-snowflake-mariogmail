with source as (

    select * from {{ source('erp_bipac_bidbfa050', 'bipac') }}

),

filtered as (

    select
        *,
        'BIDBFA050' as source_schema
    from source
    where "_fivetran_deleted" is distinct from true

)

select * from filtered
