with bidbfa050 as (

    select
        ACACCT,
        ACCOMP,
        ACCRAT,
        ACCTGR,
        ACSITE,
        ACUNOM,
        "_fivetran_id",
        "_fivetran_synced",
        source_schema
    from {{ ref('stg_erp_bipac__bidbfa050__bipacl') }}

),

bidbfe902 as (

    select
        ACACCT,
        ACCOMP,
        ACCRAT,
        ACCTGR,
        ACSITE,
        ACUNOM,
        "_fivetran_id",
        "_fivetran_synced",
        source_schema
    from {{ ref('stg_erp_bipac__bidbfe902__bipacl') }}

),

bidbfw753 as (

    select
        ACACCT,
        ACCOMP,
        ACCRAT,
        ACCTGR,
        ACSITE,
        ACUNOM,
        "_fivetran_id",
        "_fivetran_synced",
        source_schema
    from {{ ref('stg_erp_bipac__bidbfw753__bipacl') }}

),

unioned as (

    select * from bidbfa050
    union all
    select * from bidbfe902
    union all
    select * from bidbfw753

)

select * from unioned