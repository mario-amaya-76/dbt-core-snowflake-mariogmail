with source as (

    select * from {{ source('erp_bipac_bidbfe902', 'bipacl') }}

),

filtered as (

    select
        *,
        'BIDBFE902' as source_schema
    from source
    where "_fivetran_deleted" is distinct from true

)

select * from filtered
