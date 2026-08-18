{{ config(materialized='table') }}

with unioned as (

    select * from {{ ref('int_erp_bipac__bipas_unioned') }}

),

final as (

    select
        {{ dbt_utils.generate_surrogate_key(['source_schema', '"_fivetran_id"']) }}
                        as bipas_id,
        source_schema,
        * exclude (source_schema, "_fivetran_id")

    from unioned

)

select * from final
